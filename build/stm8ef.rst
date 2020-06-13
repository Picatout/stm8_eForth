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
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; TIM2_CR1 bitfields
                                 
                                 
                                 
                                 
                                 
                                        
                                        ; TIMER2_CCMR bitfields 
                                 
                                 
                                 
                                        
                                        ; TIMER2_CCER1 bitfields
                                 
                                 
                                 
                                 
                                        
                                        ; TIMER2_EGR bitfields
                                 
                                 
                                 
                                 
                                 
                                        
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
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        ; interrupt priority
                                 
                                 
                                 
                                 
                                 
                                         
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
                                     85 ;*************************************
                                     86 ; constant used for conditationnal 
                                     87 ; assembly for those word I converted 
                                     88 ; to code.
                                     89 ; Added by Picatout 2020-05-24 
                                     90 ;*************************************
                           000001    91 CONVERT_TO_CODE=1 ; words converted in assembly by Picatout
                           000001    92 PICATOUT_MOD=1  ; code modified by Picatout 
                                     93 
                                     94 ;*********************************************************
                                     95 ;	Assembler constants
                                     96 ;*********************************************************
                           000000    97 RAMBASE =	0x0000	   ;ram base
                           0017FF    98 STACK   =	0x17FF 	;system (return) stack empty 
                           001680    99 DATSTK  =	0x1680	;data stack  empty
                           001680   100 TBUFFBASE =     0x1680  ; flash read/write transaction buffer address  
                           001700   101 TIBBASE =       0X1700  ; transaction input buffer addr.
                                    102 
                                    103 
                                    104 
                                    105 ;; Memory allocation
                                    106 
                           000006   107 UPP     =     RAMBASE+6          ; systeme variables base address 
                           001680   108 SPP     =     RAMBASE+DATSTK     ; data stack bottom 
                           0017FF   109 RPP     =     RAMBASE+STACK      ;  return stack bottom
                           001680   110 ROWBUFF =     RAMBASE+TBUFFBASE ; flash write buffer 
                           001700   111 TIBB    =     RAMBASE+TIBBASE  ; transaction input buffer
                           000080   112 VAR_BASE =    RAMBASE+0x80  ; user variables start here .
                           0017BF   113 VAR_TOP =     STACK-32*CELLL  ; reserve 32 cells for data stack. 
                                    114 
                           000001   115 .if PICATOUT_MOD 
                                    116 ; user variables constants 
                           000006   117 UBASE = UPP       ; numeric base 
                           000008   118 UTMP = UBASE+2    ; temporary storage
                           00000A   119 UINN = UTMP+2     ; >IN tib pointer 
                           00000C   120 UCTIB = UINN+2    ; tib count 
                           00000E   121 UTIB = UCTIB+2    ; tib address 
                           000010   122 UINTER = UTIB+2   ; interpreter vector 
                           000012   123 UHLD = UINTER+2   ; hold 
                           000014   124 UCNTXT = UHLD+2   ; context, dictionary first link 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 4.
Hexadecimal [24-Bits]



                           000016   125 UVP = UCNTXT+2    ; variable pointer 
                           000018   126 UCP = UVP+2      ; code pointer
                           00001A   127 ULAST = UCP+2    ; last dictionary pointer 
                           00001C   128 UOFFSET = ULAST+2 ; distance between CP and VP to adjust jump address at compile time.
                           00001E   129 UTFLASH = UOFFSET+2 ; select where between FLASH and RAM for compilation destination. 
                           000020   130 URLAST = UTFLASH+2 ; context for dictionary in RAM memory 
                                    131 
                                    132 .endif ; PICATOUT_MOD
                                    133 ;******  System Variables  ******
                           000022   134 XTEMP	=	URLAST +2;address called by CREATE
                           000024   135 YTEMP	=	XTEMP+2	;address called by CREATE
                           000022   136 PROD1 = XTEMP	;space for UM*
                           000024   137 PROD2 = PROD1+2
                           000026   138 PROD3 = PROD2+2
                           000028   139 CARRY = PROD3+2
                           00002A   140 SP0	= CARRY+2	;initial data stack pointer
                           00002C   141 RP0	= SP0+2		;initial return stack pointer
                           00002E   142 MS    =   RP0+2         ; millisecond counter 
                           000030   143 CNTDWN =  MS+2          ; count down timer 
                           000032   144 FPTR = CNTDWN+2         ; 24 bits farptr 
                           000033   145 PTR16 = FPTR+1          ; middle byte of farptr 
                           000034   146 PTR8 = FPTR+2           ; least byte of farptr 
                                    147 
                           000001   148 .if PICATOUT_MOD
                                    149 ; EEPROM persistant data  
                           004000   150 APP_LAST = EEPROM_BASE ; Application last word pointer  
                           004002   151 APP_RUN = APP_LAST+2   ; application autorun address 
                           004004   152 APP_CP = APP_RUN+2   ; free application space pointer 
                           004006   153 APP_VP = APP_CP+2  ; free data space pointer 
                                    154 .endif ;PICATOUT_MOD
                                    155 
                                    156 
                                    157 ;***********************************************
                                    158 ;; Version control
                                    159 
                           000003   160 VER     =     3         ;major release version
                           000000   161 EXT     =     0         ;minor extension
                                    162 
                                    163 ;; Constants
                                    164 
                           00FFFF   165 TRUEE   =     0xFFFF      ;true flag
                                    166 
                           000040   167 COMPO   =     0x40     ;lexicon compile only bit
                           000080   168 IMEDD   =     0x80     ;lexicon immediate bit
                           001F7F   169 MASKK   =     0x1F7F  ;lexicon bit mask
                                    170 
                           000002   171 CELLL   =     2       ;size of a cell
                           00000A   172 BASEE   =     10      ;default radix
                           000008   173 BKSPP   =     8       ;back space
                           00000A   174 LF      =     10      ;line feed
                           00000D   175 CRR     =     13      ;carriage return
                           00001B   176 ERR     =     27      ;error escape
                           000027   177 TIC     =     39      ;tick
                           0000CD   178 CALLL   =     0xCD     ;CALL opcodes
                           000080   179 IRET_CODE =   0x80    ; IRET opcode 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 5.
Hexadecimal [24-Bits]



                                    180 
                                    181         .macro _ledon
                                    182         bset PC_ODR,#LED2_BIT
                                    183         .endm
                                    184 
                                    185         .macro _ledoff
                                    186         bres PC_ODR,#LED2_BIT
                                    187         .endm
                                    188 
                                    189 ;**********************************************************
                                    190         .area DATA (ABS)
      000000                        191         .org RAMBASE 
                                    192 ;**********************************************************
                                    193 
                                    194 ;**********************************************************
                                    195         .area SSEG (ABS) ; STACK
      001700                        196         .org 0x1700
      001700                        197         .ds 256 
                                    198 ; space for DATSTK,TIB and STACK         
                                    199 ;**********************************************************
                                    200 
                                    201 ;**********************************************************
                                    202         .area HOME ; vectors table
                                    203 ;**********************************************************
      008000 82 00 80 96            204 	int main	        ; reset
      008004 82 00 80 80            205 	int NonHandledInterrupt	; trap
      008008 82 00 80 80            206 	int NonHandledInterrupt	; irq0
      00800C 82 00 80 80            207 	int NonHandledInterrupt	; irq1
      008010 82 00 80 80            208 	int NonHandledInterrupt	; irq2
      008014 82 00 80 80            209 	int NonHandledInterrupt	; irq3
      008018 82 00 80 80            210 	int NonHandledInterrupt	; irq4
      00801C 82 00 80 80            211 	int NonHandledInterrupt	; irq5
      008020 82 00 80 80            212 	int NonHandledInterrupt	; irq6
      008024 82 00 80 80            213 	int NonHandledInterrupt	; irq7
      008028 82 00 80 80            214 	int NonHandledInterrupt	; irq8
      00802C 82 00 80 80            215 	int NonHandledInterrupt	; irq9
      008030 82 00 80 80            216 	int NonHandledInterrupt	; irq10
      008034 82 00 80 80            217 	int NonHandledInterrupt	; irq11
      008038 82 00 80 80            218 	int NonHandledInterrupt	; irq12
      00803C 82 00 80 80            219 	int NonHandledInterrupt	; irq13
      008040 82 00 80 80            220 	int NonHandledInterrupt	; irq14
      008044 82 00 80 80            221 	int NonHandledInterrupt	; irq15
      008048 82 00 80 80            222 	int NonHandledInterrupt	; irq16
      00804C 82 00 80 80            223 	int NonHandledInterrupt	; irq17
      008050 82 00 80 80            224 	int NonHandledInterrupt	; irq18
      008054 82 00 80 80            225 	int NonHandledInterrupt	; irq19
      008058 82 00 80 80            226 	int NonHandledInterrupt	; irq20
      00805C 82 00 80 80            227 	int NonHandledInterrupt	; irq21
      008060 82 00 80 80            228 	int NonHandledInterrupt	; irq22
      008064 82 00 80 85            229 	int Timer4Handler	; irq23
      008068 82 00 80 80            230 	int NonHandledInterrupt	; irq24
      00806C 82 00 80 80            231 	int NonHandledInterrupt	; irq25
      008070 82 00 80 80            232 	int NonHandledInterrupt	; irq26
      008074 82 00 80 80            233 	int NonHandledInterrupt	; irq27
      008078 82 00 80 80            234 	int NonHandledInterrupt	; irq28
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 6.
Hexadecimal [24-Bits]



      00807C 82 00 80 80            235 	int NonHandledInterrupt	; irq29
                                    236 
                                    237 ;**********************************************************
                                    238         .area CODE
                                    239 ;**********************************************************
                                    240 
                                    241 ; non handled interrupt reset MCU
      008080                        242 NonHandledInterrupt:
      008080 A6 80            [ 1]  243         ld a, #0x80
      008082 C7 50 D1         [ 1]  244         ld WWDG_CR,a ; WWDG_CR used to reset mcu
                                    245 	;iret
                                    246 
                                    247 ; used for milliseconds counter 
                                    248 ; MS is 16 bits counter 
      008085                        249 Timer4Handler:
      008085 72 5F 53 42      [ 1]  250 	clr TIM4_SR 
      008089 BE 2E            [ 2]  251         ldw x,MS 
      00808B 5C               [ 2]  252         incw x 
      00808C BF 2E            [ 2]  253         ldw MS,x
      00808E BE 30            [ 2]  254         ldw x,CNTDWN 
      008090 27 03            [ 1]  255         jreq 1$
      008092 5A               [ 2]  256         decw x 
      008093 BF 30            [ 2]  257         ldw CNTDWN,x 
      008095                        258 1$:         
      008095 80               [11]  259         iret 
                                    260 
                                    261 
                                    262 ;; Main entry points and COLD start data
      008096                        263 main:
                                    264 ; clear all RAM
      008096 AE 00 00         [ 2]  265 	ldw X,#RAMBASE
      008099                        266 clear_ram0:
      008099 7F               [ 1]  267 	clr (X)
      00809A 5C               [ 2]  268 	incw X
      00809B A3 17 FF         [ 2]  269 	cpw X,#RAM_END
      00809E 23 F9            [ 2]  270 	jrule clear_ram0
      0080A0 AE 17 FF         [ 2]  271         ldw x,#RPP
      0080A3 94               [ 1]  272         ldw sp,x 
      0080A4 CC 80 C3         [ 2]  273 	jp ORIG
                                    274 
                                    275 ; COLD initialize these variables.
      0080A7                        276 UZERO:
      0080A7 00 0A                  277         .word      BASEE   ;BASE
      0080A9 00 00                  278         .word      0       ;tmp
      0080AB 00 00                  279         .word      0       ;>IN
      0080AD 00 00                  280         .word      0       ;#TIB
      0080AF 17 00                  281         .word      TIBB    ;TIB
      0080B1 92 EF                  282         .word      INTER   ;'EVAL
      0080B3 00 00                  283         .word      0       ;HLD
      0080B5 A1 9D                  284         .word      LASTN  ;CNTXT pointer
      0080B7 00 80                  285         .word      VAR_BASE   ;variables free space pointer 
      0080B9 A1 00                  286         .word      app_space ; FLASH free space pointer 
      0080BB A1 9D                  287         .word      LASTN   ;LAST
      0080BD 00 00                  288         .word      0        ; OFFSET 
      0080BF 00 00                  289         .word      0       ; TFLASH
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 7.
Hexadecimal [24-Bits]



                                    290 ;       .word      0       ; URLAST   
      0080C1 00 00                  291 UEND:   .word      0
                                    292 
      0080C3                        293 ORIG:   
                                    294 ; initialize SP
      0080C3 AE 17 FF         [ 2]  295         LDW     X,#STACK  ;initialize return stack
      0080C6 94               [ 1]  296         LDW     SP,X
      0080C7 BF 2C            [ 2]  297         LDW     RP0,X
      0080C9 AE 16 80         [ 2]  298         LDW     X,#DATSTK ;initialize data stack
      0080CC BF 2A            [ 2]  299         LDW     SP0,X
                                    300 ; initialize PC_5 as output to control LED2
                                    301 ; added by Picatout 
      0080CE 72 1A 50 0D      [ 1]  302         bset PC_CR1,#LED2_BIT
      0080D2 72 1A 50 0E      [ 1]  303         bset PC_CR2,#LED2_BIT
      0080D6 72 1A 50 0C      [ 1]  304         bset PC_DDR,#LED2_BIT
      00005A                        305         _ledoff
      0080DA 72 1B 50 0A      [ 1]    1         bres PC_ODR,#LED2_BIT
                                    306 ; initialize clock to HSI
                                    307 ; no divisor 16Mhz 
                                    308 ; Added by Picatout 
      0080DE                        309 clock_init:
      0080DE 72 5F 50 C6      [ 1]  310         clr CLK_CKDIVR
      0080E2 72 12 50 C5      [ 1]  311 	bset CLK_SWCR,#CLK_SWCR_SWEN
      0080E6 A6 E1            [ 1]  312 	ld a,#CLK_SWR_HSI
      0080E8 C7 50 C4         [ 1]  313 	ld CLK_SWR,a
      0080EB C1 50 C3         [ 1]  314 1$:	cp a,CLK_CMSR
      0080EE 26 FB            [ 1]  315 	jrne 1$
                                    316         
                                    317 ; initialize UART1, 115200 8N1
      0080F0                        318 uart1_init:
      0080F0 72 14 50 C7      [ 1]  319 	bset CLK_PCKENR1,#CLK_PCKENR1_UART1
                                    320 	; configure tx pin
      0080F4 72 1A 50 02      [ 1]  321 	bset PA_DDR,#UART1_TX_PIN ; tx pin
      0080F8 72 1A 50 03      [ 1]  322 	bset PA_CR1,#UART1_TX_PIN ; push-pull output
      0080FC 72 1A 50 04      [ 1]  323 	bset PA_CR2,#UART1_TX_PIN ; fast output
                                    324 	; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
      008100 35 0B 52 33      [ 1]  325 	mov UART1_BRR2,#0x0b ; must be loaded first
      008104 35 08 52 32      [ 1]  326 	mov UART1_BRR1,#0x8
      008108 35 0C 52 35      [ 1]  327 	mov UART1_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN));|(1<<UART_CR2_RIEN))
                                    328 ; initialize timer4, used for millisecond interrupt  
      00810C 35 07 53 45      [ 1]  329 	mov TIM4_PSCR,#7 ; prescale 128  
      008110 35 7D 53 46      [ 1]  330 	mov TIM4_ARR,#125 ; set for 1msec.
      008114 35 05 53 40      [ 1]  331 	mov TIM4_CR1,#((1<<TIM4_CR1_CEN)|(1<<TIM4_CR1_URS))
      008118 72 10 53 41      [ 1]  332 	bset TIM4_IER,#TIM4_IER_UIE 
                                    333 ; set TIM4 interrupt priority to highest
      00811C A6 3F            [ 1]  334         ld a,#~(IPR_MASK<<6)
      00811E C4 7F 75         [ 1]  335         and a,ITC_SPR6
      008121 AA C0            [ 1]  336         or a,#(IPR3<<6)
      008123 C7 7F 75         [ 1]  337         ld ITC_SPR6,a 
      008126 9A               [ 1]  338         rim
      008127 CC 99 91         [ 2]  339         jp  COLD   ;default=MN1
                                    340 
                                    341 
                                    342 ;; place MCU in sleep mode with
                                    343 ;; halt opcode 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 8.
Hexadecimal [24-Bits]



                                    344 ;; BYE ( -- )
      00812A 00 00                  345         .word 0
                           0000AC   346         LINK=.
      00812C 03                     347         .byte 3 
      00812D 42 59 45               348         .ascii "BYE"
      008130                        349 BYE: 
      008130 8E               [10]  350         halt 
      008131 81               [ 4]  351         ret 
                                    352 
                                    353 ; Enable interrupts 
                                    354 ; EI ( -- )
      008132 81 2C                  355         .word LINK 
                           0000B4   356         LINK=.
      008134 02                     357         .byte 2
      008135 45 49                  358         .ascii "EI"
      008137                        359 EI:
      008137 9A               [ 1]  360         rim 
      008138 81               [ 4]  361         ret 
                                    362 
                                    363 ; Disable interrupts
                                    364 ; DI ( -- )
      008139 81 34                  365         .word LINK 
                           0000BB   366         LINK=.
      00813B 02                     367         .byte 2 
      00813C 44 49                  368         .ascii "DI"
      00813E                        369 DI:
      00813E 9B               [ 1]  370         sim 
      00813F 81               [ 4]  371         ret 
                                    372 
                                    373 ; set interrupt priority level 
                                    374 ; SET-ISP ( n1 n2 -- )
                                    375 ; n1 level {1..3}
                                    376 ; n2 vector {0..29}
      008140 81 3B                  377         .word LINK 
                           0000C2   378         LINK=.
      008142 07                     379         .byte 7 
      008143 53 45 54 2D 49 53 50   380         .ascii "SET-ISP"
      00814A                        381 SETISP:
      00814A 90 93            [ 1]  382         ldw y,x 
      00814C 90 FE            [ 2]  383         ldw y,(y)
      00814E A6 04            [ 1]  384         ld a,#4 ; 4 slot per register 
                                    385 ;  quotient select register, remainder select slot in register.        
      008150 90 62            [ 2]  386         div y,a ; register=ITC_SPR1[Y], lshift=2*A 
      008152 A4 03            [ 1]  387         and a,#3 
      008154 48               [ 1]  388         sll a ; 2*SLOT  lshift 
      008155 72 A9 7F 70      [ 2]  389         addw y,#ITC_SPR1 
      008159 FF               [ 2]  390         ldw (x),y  ; ( level reg -- )
      00815A 90 5F            [ 1]  391         clrw y 
      00815C 90 97            [ 1]  392         ld yl,a 
      00815E 1D 00 02         [ 2]  393         subw x,#CELLL 
      008161 FF               [ 2]  394         ldw (x),y  ; ( level reg lshift -- )
      008162 90 93            [ 1]  395         ldw y,x 
      008164 90 EE 02         [ 2]  396         ldw y,(2,y) 
      008167 90 F6            [ 1]  397         ld a,(y)   ; reg_value
      008169 1D 00 02         [ 2]  398         subw x,#CELLL 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 9.
Hexadecimal [24-Bits]



      00816C FF               [ 2]  399         ldw (x),y ; ( level reg lshift rval -- )
      00816D CD 85 1E         [ 4]  400         call OVER ; ( level reg lshift rval lshift -- )
      008170 CD 83 C5         [ 4]  401         call DOLIT 
      008173 00 03                  402         .word 3
      008175 CD 85 04         [ 4]  403         call SWAPP  ; ( level reg lshift rval 3 lshift )
      008178 CD 89 EC         [ 4]  404         call LSHIFT ; creat slot mask 
      00817B CD 87 09         [ 4]  405         call INVER  ; ( level reg lshift rval mask )
      00817E CD 85 40         [ 4]  406         call ANDD ; ( level reg lshift slot_masked )
      008181 CD 84 BD         [ 4]  407         call TOR  ; ( level reg lshift -- R: slot_masked )
      008184 CD 86 AF         [ 4]  408         call ROT  ; ( reg lshift level )
      008187 CD 85 04         [ 4]  409         call SWAPP ; ( reg level lshift )
      00818A CD 89 EC         [ 4]  410         call LSHIFT  ; ( reg slot_level -- )
      00818D CD 84 9E         [ 4]  411         call RFROM ; ( reg slot_level masked_val )
      008190 CD 85 54         [ 4]  412         call ORR   ; ( reg updated_rval )
      008193 CD 85 04         [ 4]  413         call SWAPP 
      008196 CD 84 5A         [ 4]  414         call CSTOR
                                    415 
                                    416 ; sélectionne l'application 
                                    417 ; qui démarre automatique lors 
                                    418 ; d'un COLD start 
      008199 81 42                  419         .word LINK 
                           00011B   420         LINK=.
      00819B 07                     421         .byte 7
      00819C 41 55 54 4F 52 55 4E   422         .ascii "AUTORUN"
      0081A3                        423 AUTORUN:
      0081A3 CD 90 B4         [ 4]  424         call TOKEN 
      0081A6 CD 84 F4         [ 4]  425         call DUPP 
      0081A9 CD 83 F8         [ 4]  426         call QBRAN 
      0081AC 82 89                  427         .word FORGET2
      0081AE CD 91 B1         [ 4]  428         call NAMEQ
      0081B1 CD 86 9E         [ 4]  429         call QDUP 
      0081B4 CD 83 F8         [ 4]  430         call QBRAN 
      0081B7 82 89                  431         .word FORGET2
      0081B9 CD 84 EA         [ 4]  432         call DROP 
      0081BC 1D 00 04         [ 2]  433         subw x,#2*CELLL 
      0081BF 90 5F            [ 1]  434         clrw y 
      0081C1 FF               [ 2]  435         ldw (x),y 
      0081C2 90 AE 40 02      [ 2]  436         ldw y,#APP_RUN 
      0081C6 EF 02            [ 2]  437         ldw (2,x),y 
      0081C8 CC 9C 10         [ 2]  438         jp ee_store 
                                    439 
                                    440 ;; Reset dictionary pointer before 
                                    441 ;; forgotten word. RAM space and 
                                    442 ;; interrupt vector defined after 
                                    443 ;; must be resetted also.
      0081CB 81 9B                  444         .word LINK 
                           00014D   445         LINK=.
      0081CD 06                     446         .byte 6
      0081CE 46 4F 52 47 45 54      447         .ascii "FORGET" 
      0081D4                        448 FORGET: 
      0081D4 CD 90 B4         [ 4]  449         call TOKEN
      0081D7 CD 84 F4         [ 4]  450         call DUPP 
      0081DA CD 83 F8         [ 4]  451         call QBRAN 
      0081DD 82 89                  452         .word FORGET2
      0081DF CD 91 B1         [ 4]  453         call NAMEQ ; ( a -- ca na | a F )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



      0081E2 CD 86 9E         [ 4]  454         call QDUP 
      0081E5 CD 83 F8         [ 4]  455         call QBRAN 
      0081E8 82 89                  456         .word FORGET2
                                    457 ; only forget users words 
      0081EA CD 84 F4         [ 4]  458         call DUPP ; ( ca na na )
      0081ED CD 83 C5         [ 4]  459         call DOLIT 
      0081F0 A1 00                  460         .word app_space 
      0081F2 CD 85 04         [ 4]  461         call SWAPP 
      0081F5 CD 87 94         [ 4]  462         call  ULESS 
      0081F8 CD 83 F8         [ 4]  463         call QBRAN 
      0081FB 82 4B                  464         .word FORGET6 
                                    465 ; ( ca na -- )        
                                    466 ;reset ivec with address >= ca
      0081FD CD 85 04         [ 4]  467         call SWAPP ; ( na ca -- ) 
      008200 CD 9E 01         [ 4]  468         call CHKIVEC ; ( na -- ) 
                                    469 ; start at LAST and link back to na 
                                    470 ; if variable found reset VP at that point.
      008203                        471 FORGET1:
      008203 CD 86 60         [ 4]  472         call LAST 
      008206 CD 84 4D         [ 4]  473         call AT 
      008209 CD 84 F4         [ 4]  474         call DUPP  ; ( -- na last last )
      00820C CD 82 9F         [ 4]  475         call FREEVAR ; ( -- na last )
      00820F CD 84 F4         [ 4]  476         call DUPP 
      008212 CD 83 C5         [ 4]  477         call DOLIT 
      008215 00 02                  478         .word 2 
      008217 CD 87 4D         [ 4]  479         call SUBB ; ( na last -- na last lfa ) link address 
      00821A CD 84 4D         [ 4]  480         call AT 
      00821D CD 84 F4         [ 4]  481         call DUPP ; ( -- na last a a )
      008220 CD 86 34         [ 4]  482         call CNTXT 
      008223 CD 84 36         [ 4]  483         call STORE
      008226 CD 86 60         [ 4]  484         call LAST  
      008229 CD 84 36         [ 4]  485         call STORE ; ( --  na last )
      00822C CD 85 1E         [ 4]  486         call OVER 
      00822F CD 87 75         [ 4]  487         call EQUAL ; ( na last na -- na T|F ) 
      008232 CD 83 F8         [ 4]  488         call QBRAN 
      008235 82 03                  489         .word FORGET1 
                                    490 ; ( na -- )
      008237 CD 83 C5         [ 4]  491         call DOLIT 
      00823A 00 02                  492         .word 2 
      00823C CD 87 4D         [ 4]  493         call SUBB 
      00823F CD 86 50         [ 4]  494         call CPP 
      008242 CD 84 36         [ 4]  495         call STORE  
      008245 CD 9A BD         [ 4]  496         call UPDATCP 
      008248 CC 9A 94         [ 2]  497         jp UPDATLAST 
      00824B                        498 FORGET6: ; tried to forget a RAM or system word 
                                    499 ; ( ca na -- )
      00824B 1D 00 02         [ 2]  500         subw x,#CELLL 
      00824E 90 BE 2A         [ 2]  501         ldw y,SP0 
      008251 FF               [ 2]  502         ldw (x),y  
      008252 CD 87 94         [ 4]  503         call ULESS
      008255 CD 83 F8         [ 4]  504         call QBRAN 
      008258 82 7B                  505         .word PROTECTED 
      00825A CD 92 BD         [ 4]  506         call ABORQ 
      00825D 1D                     507         .byte 29
      00825E 20 46 6F 72 20 52 41   508         .ascii " For RAM definition do REBOOT"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal  4D-Bits]



             4D 20 64 65 66 69 6E
             69 74 69 6F 6E 20 64
             6F 20 52 45 42 4F 4F
             54
      0001FB                        509 PROTECTED:
      008266 20 64 65         [ 4]  510         call ABORQ
      008269 66                     511         .byte 10
      00826A 69 6E 69 74 69 6F 6E   512         .ascii " Protected"
             20 64 6F
      000209                        513 FORGET2: ; no name or not found in dictionary 
      008274 20 52 45         [ 4]  514         call ABORQ
      008277 42                     515         .byte 5
      008278 4F 4F 54 61 74         516         .ascii " what"
      00827B                        517 FORGET4:
      00827B CD 92 BD         [ 2]  518         jp DROP 
                                    519 
                                    520 
                                    521 ;---------------------------------
                                    522 ; if na is variable 
                                    523 ; free variable data  
                                    524 ; FREEVAR ( na -- )
                                    525 ;---------------------------------
      00827E 0A 20                  526         .word LINK 
                           000217   527         LINK=.
      008280 50                     528         .byte 7 
      008281 72 6F 74 65 63 74 65   529         .ascii "FREEVAR"
      00021F                        530 FREEVAR:
      008288 64 04 74         [ 4]  531         call DUPP ; ( na na -- )
      008289 CD 03 EB         [ 4]  532         CALL CAT  ; ( na c -- )
      008289 CD 92 BD         [ 4]  533         call ONEP ;
      00828C 05 20 77         [ 4]  534         CALL PLUS ; ( na c+1 -- ca ) 
      00828F 68 61 74         [ 4]  535         call ONEP ; ( ca+ -- ) to get routne address 
      008292 CD 04 74         [ 4]  536         call DUPP ; ( ca+ ca+ -- )
      008292 CC 84 EA         [ 4]  537         CALL AT   ; ( ca+ fnaddr -- ) ; fnaddr is routine address 
      008295 81 CD 07         [ 4]  538         call DOLIT 
      008298 46 52                  539         .word DOVAR ; if routine address is DOVAR then variable 
      00829A 45 45 56         [ 4]  540         call EQUAL  ; ( ca+ fnaddr DOVAR -- ca+ T|F ) 
      00829D 41 52 78         [ 4]  541         call QBRAN 
      00829F 02 55                  542         .word FREEVAR4 
      00829F CD 84 F4         [ 4]  543         call DOLIT 
      0082A2 CD 84                  544         .word 2 
      0082A4 6B CD 89         [ 4]  545         call PLUS  ; ( ca+ 2 -- da ) da is data address 
      0082A7 CE CD 86         [ 4]  546         call AT 
      0082AA EF CD 89         [ 4]  547         call VPP   
      0082AD CE CD 84         [ 4]  548         call STORE 
      0082B0 F4 CD 84         [ 2]  549         jp UPDATVP 
      000255                        550 FREEVAR4: ; not variable
      0082B3 4D CD 83         [ 2]  551         jp  DROP 
                                    552 
                                    553 ;;
                                    554 ;; get millisecond counter 
                                    555 ;; msec ( -- u )
                                    556 ;; Added by Picatout 2020-04-26
      0082B6 C5 85                  557         .word LINK  
                           00025A   558         LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]



      0082B8 A1                     559         .byte 4
      0082B9 CD 87 75 CD            560         .ascii "MSEC"
      00025F                        561 MSEC: 
      0082BD 83 F8 82         [ 2]  562         subw x,#CELLL 
      0082C0 D5 CD 83         [ 2]  563         ldw y,MS 
      0082C3 C5               [ 2]  564         ldw (x),y 
      0082C4 00               [ 4]  565         ret 
                                    566 
                                    567 ; suspend execution for u msec 
                                    568 ;  pause ( u -- )
      0082C5 02 CD                  569         .word LINK 
                           000269   570         LINK=.
      0082C7 86                     571         .byte 5 
      0082C8 EF CD 84 4D CD         572         .ascii "PAUSE"
      00026F                        573 PAUSE:
      0082CD 86 42            [ 1]  574         ldw y,x
      0082CF CD 84            [ 2]  575         ldw y,(y)
      0082D1 36 CC 9A D4      [ 2]  576         addw y,MS 
      0082D5 8F               [10]  577 1$:     wfi  
      0082D5 CC 84 EA         [ 2]  578         cpw y,MS  
      0082D8 82 97            [ 1]  579         jrne 1$        
      0082DA 04 4D 53         [ 2]  580         addw x,#CELLL 
      0082DD 45               [ 4]  581         ret 
                                    582 
                                    583 ; initialize count down timer 
                                    584 ;  TIMER ( u -- )  milliseconds 
      0082DE 43 69                  585         .word LINK 
                           000283   586         LINK=.
      0082DF 05                     587         .byte 5 
      0082DF 1D 00 02 90 BE         588         .ascii "TIMER" 
      000289                        589 TIMER:
      0082E4 2E FF            [ 1]  590         ldw y,x
      0082E6 81 82            [ 2]  591         ldw y,(y) 
      0082E8 DA 05 50         [ 2]  592         ldw CNTDWN,y
      0082EB 41 55 53         [ 2]  593         addw x,#CELLL 
      0082EE 45               [ 4]  594         ret 
                                    595 
                                    596 ; check for TIMER exiparition 
                                    597 ;  TIMEOUT? ( -- 0|-1 )
      0082EF 02 83                  598         .word LINK 
                           000296   599         LINK=. 
      0082EF 90                     600         .byte 8 
      0082F0 93 90 FE 72 B9 00 2E   601         .ascii "TIMEOUT?"
             8F
      00029F                        602 TIMEOUTQ: 
      0082F8 90               [ 1]  603         clr a
      0082F9 B3 2E 26         [ 2]  604         subw x,#CELLL 
      0082FC FA 1C 00         [ 2]  605         ldw y,CNTDWN 
      0082FF 02 81            [ 1]  606         jrne 1$ 
      008301 82               [ 1]  607         cpl a 
      008302 E9 05            [ 1]  608 1$:     ld (1,x),a 
      008304 54               [ 1]  609         ld (x),a 
      008305 49               [ 4]  610         ret         
                                    611 
                                    612 ; reboot MCU 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 13.
Hexadecimal [24-Bits]



                                    613 ; REBOOT ( -- )
      008306 4D 45                  614         .word LINK 
                           0002AF   615         LINK=. 
      008308 52                     616         .byte 6 
      008309 52 45 42 4F 4F 54      617         .ascii "REBOOT"
      0002B6                        618 reboot:
      008309 90 93 90         [ 2]  619         jp NonHandledInterrupt
                                    620 
                                    621 ; compile to flash memory 
                                    622 ; TO-FLASH ( -- )
      00830C FE 90                  623         .word LINK 
                           0002BB   624         LINK=.
      00830E BF                     625         .byte 8
      00830F 30 1C 00 02 81 83 03   626         .ascii "TO-FLASH"
             08
      0002C4                        627 TOFLASH:
      008317 54 49 4D         [ 4]  628         call RAMLAST 
      00831A 45 4F 55         [ 4]  629         call AT 
      00831D 54 3F 1E         [ 4]  630         call QDUP 
      00831F CD 03 78         [ 4]  631         call QBRAN
      00831F 4F 1D                  632         .word 1$
      008321 00 02 90         [ 4]  633         call ABORQ 
      008324 BE                     634         .byte 29
      008325 30 26 01 43 E7 01 F7   635         .ascii " Not while definitions in RAM"   
             81 83 16 06 52 45 42
             4F 4F 54 74 69 6F 6E
             73 20 69 6E 20 52 41
             4D
      008336 90 AE FF FF      [ 2]  636 1$:     ldw y,#-1 
      008336 CC 80 80         [ 2]  637         ldw UTFLASH,y
      008339 83               [ 4]  638         ret 
                                    639 
                                    640 ; compile to RAM 
                                    641 ; TO-RAM ( -- )
      00833A 2F 08                  642         .word LINK 
                           0002FD   643         LINK=.
      00833C 54                     644         .byte 6 
      00833D 4F 2D 46 4C 41 53      645         .ascii "TO-RAM"
      000304                        646 TORAM:
      008343 48 5F            [ 1]  647         clrw y 
      008344 90 BF 1E         [ 2]  648         ldw UTFLASH,y 
      008344 CD               [ 4]  649         ret 
                                    650         
                                    651 
                                    652 ;; Device dependent I/O
                                    653 ;       ?RX     ( -- c T | F )
                                    654 ;         Return input byte and true, or false.
      008345 86 73                  655         .word      LINK 
                           00030C   656 LINK	= .
      008347 CD                     657         .byte      4
      008348 84 4D CD 86            658         .ascii     "?KEY"
      000311                        659 QKEY:
      00834C 9E CD            [ 1]  660         CLRW Y 
      00834E 83 F8 83 73 CD   [ 2]  661         BTJF UART1_SR,#UART_SR_RXNE,INCH   ;check status
      008353 92 BD 1D         [ 1]  662         LD    A,UART1_DR   ;get char in A
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 14.
Hexadecimal [24-Bits]



      008356 20 4E 6F         [ 2]  663 	SUBW	X,#2
      008359 74 20            [ 1]  664         LD     (1,X),A
      00835B 77               [ 1]  665 	CLR	(X)
      00835C 68 69            [ 2]  666         CPLW     Y
      000323                        667 INCH:
      00835E 6C 65 20         [ 2]  668 	SUBW	X,#2
      008361 64               [ 2]  669         LDW     (X),Y
      008362 65               [ 4]  670         RET
                                    671 
                                    672 ;       TX!     ( c -- )
                                    673 ;       Send character c to  output device.
      008363 66 69                  674         .word      LINK
                           00032A   675 LINK	= .
      008365 6E                     676         .byte      4
      008366 69 74 69 6F            677         .ascii     "EMIT"
      00032F                        678 EMIT:
      00836A 6E 73            [ 1]  679         LD     A,(1,X)
      00836C 20 69 6E         [ 2]  680 	ADDW	X,#2
      00836F 20 52 41 4D 90   [ 2]  681 OUTPUT: BTJF UART1_SR,#UART_SR_TXE,OUTPUT  ;loop until tdre
      008374 AE FF FF         [ 1]  682         LD    UART1_DR,A   ;send A
      008377 90               [ 4]  683         RET
                                    684 
                                    685 ;; The kernel
                                    686 
                                    687 ;       doLIT   ( -- w )
                                    688 ;       Push an inline literal.
      008378 BF 1E                  689         .word      LINK
                           00033F   690 LINK	= 	.
      00837A 81                     691 	.byte      COMPO+5
      00837B 83 3B 06 54 4F         692         .ascii     "DOLIT"
      000345                        693 DOLIT:
      008380 2D 52 41         [ 2]  694 	SUBW X,#2
                           000001   695 .if PICATOUT_MOD 
      008383 4D 01            [ 2]  696         ldw y,(1,sp)
      008384 90 FE            [ 2]  697         ldw y,(y)
      008384 90               [ 2]  698         ldw (x),y
      008385 5F 90            [ 2]  699         popw y 
      008387 BF 1E 81         [ 2]  700         jp (2,y)
                           000000   701 .else 
                                    702         POPW Y
                                    703 	LDW YTEMP,Y
                                    704 	LDW Y,(Y)
                                    705         LDW (X),Y
                                    706         LDW Y,YTEMP
                                    707 	JP (2,Y)
                                    708 .endif 
                                    709 
                                    710 ;       next    ( -- )
                                    711 ;       Code for  single index loop.
      00838A 83 7D                  712         .word      LINK
                           000354   713 LINK	= 	.
      00838C 04                     714 	.byte      COMPO+4
      00838D 3F 4B 45 59            715         .ascii     "NEXT"
      008391                        716 DONXT:
      008391 90 5F            [ 2]  717 	LDW Y,(3,SP)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 15.
Hexadecimal [24-Bits]



      008393 72 0B            [ 2]  718 	DECW Y
      008395 52 30            [ 1]  719 	JRPL NEX1 ; jump if N=0
      008397 0B C6            [ 2]  720 	POPW Y
                           000001   721 .if PICATOUT_MOD
      008399 52 31            [ 2]  722         addw sp,#2
                           000000   723 .else        
                                    724 	POP A
                                    725 	POP A
                                    726 .endif         
      00839B 1D 00 02         [ 2]  727         JP (2,Y)
      000366                        728 NEX1:
      00839E E7 01            [ 2]  729         LDW (3,SP),Y
      0083A0 7F 90            [ 2]  730         POPW Y
      0083A2 53 FE            [ 2]  731 	LDW Y,(Y)
      0083A3 90 FC            [ 2]  732 	JP (Y)
                                    733 
                                    734 ;       ?branch ( f -- )
                                    735 ;       Branch if flag is zero.
      0083A3 1D 00                  736         .word      LINK
                           000370   737 LINK	= 	.
      0083A5 02                     738 	.byte      COMPO+7
      0083A6 FF 81 83 8C 04 45 4D   739         .ascii     "?BRANCH"
      000378                        740 QBRAN:	
      0083AD 49 54            [ 1]  741         LDW Y,X
      0083AF 1C 00 02         [ 2]  742 	ADDW X,#2
      0083AF E6 01            [ 2]  743 	LDW Y,(Y)
      0083B1 1C 00            [ 1]  744         JREQ     BRAN
      0083B3 02 72            [ 2]  745 	POPW Y
      0083B5 0F 52 30         [ 2]  746 	JP (2,Y)
                                    747         
                                    748 ;       branch  ( -- )
                                    749 ;       Branch to an inline address.
      0083B8 FB C7                  750         .word      LINK
                           000388   751 LINK	= 	.
      0083BA 52                     752 	.byte      COMPO+6
      0083BB 31 81 83 AA 45 44      753         .ascii     "BRANCH"
      00038F                        754 BRAN:
      0083C1 4F 4C            [ 2]  755         POPW Y
      0083C3 49 54            [ 2]  756 	LDW Y,(Y)
      0083C5 90 FC            [ 2]  757         JP     (Y)
                                    758 
                                    759 ;       EXECUTE ( ca -- )
                                    760 ;       Execute  word at ca.
      0083C5 1D 00                  761         .word      LINK
                           000397   762 LINK	= 	.
      0083C7 02                     763         .byte       7
      0083C8 16 01 90 FE FF 90 85   764         .ascii     "EXECUTE"
      00039F                        765 EXECU:
      0083CF 90 EC            [ 1]  766         LDW Y,X
      0083D1 02 83 BF         [ 2]  767 	ADDW X,#2
      0083D4 44 4E            [ 2]  768 	LDW  Y,(Y)
      0083D6 45 58            [ 2]  769         JP   (Y)
                                    770 
                                    771 ;       EXIT    ( -- )
                                    772 ;       Terminate a colon definition.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 16.
Hexadecimal [24-Bits]



      0083D8 54 97                  773         .word      LINK
                           0003AA   774 LINK = .
      0083D9 04                     775         .byte      4
      0083D9 16 03 90 5A            776         .ascii     "EXIT"
      0003AF                        777 EXIT:
      0083DD 2A 07            [ 2]  778         POPW Y
      0083DF 90               [ 4]  779         RET
                                    780 
                                    781 ;       !       ( w a -- )
                                    782 ;       Pop  data stack to memory.
      0083E0 85 5B                  783         .word      LINK
                           0003B4   784 LINK = .
      0083E2 02                     785         .byte      1
      0083E3 90                     786         .ascii     "!"
      0003B6                        787 STORE:
      0083E4 EC 02            [ 1]  788         LDW Y,X
      0083E6 90 FE            [ 2]  789         LDW Y,(Y)    ;Y=a
      0083E6 17 03 90         [ 2]  790         LDW YTEMP,Y
      0083E9 85 90            [ 1]  791         LDW Y,X
      0083EB FE 90 FC         [ 2]  792         LDW Y,(2,Y)
      0083EE 83 D4 47         [ 5]  793         LDW [YTEMP],Y ;store w at a
      0083F1 3F 42 52         [ 2]  794         ADDW X,#4 ; DDROP 
      0083F4 41               [ 4]  795         RET     
                                    796 
                                    797 ;       @       ( a -- w )
                                    798 ;       Push memory location to stack.
      0083F5 4E 43                  799         .word      LINK
                           0003CB   800 LINK	= 	.
      0083F7 48                     801         .byte    1
      0083F8 40                     802         .ascii	"@"
      0003CD                        803 AT:
      0083F8 90 93            [ 1]  804         LDW Y,X     ;Y = a
      0083FA 1C 00            [ 2]  805         LDW Y,(Y)   ; address 
      0083FC 02 90            [ 2]  806         LDW Y,(Y)   ; value 
      0083FE FE               [ 2]  807         LDW (X),Y ;w = @Y
      0083FF 27               [ 4]  808         RET     
                                    809 
                                    810 ;       C!      ( c b -- )
                                    811 ;       Pop  data stack to byte memory.
      008400 0E 90                  812         .word      LINK
                           0003D7   813 LINK	= .
      008402 85                     814         .byte      2
      008403 90 EC                  815         .ascii     "C!"
      0003DA                        816 CSTOR:
      008405 02 83            [ 1]  817         LDW Y,X
      008407 F0 46            [ 2]  818 	LDW Y,(Y)    ;Y=b
      008409 42 52            [ 1]  819         LD A,(3,X)    ;D = c
      00840B 41 4E            [ 1]  820         LD  (Y),A     ;store c at b
      00840D 43 48 04         [ 2]  821 	ADDW X,#4 ; DDROP 
      00840F 81               [ 4]  822         RET     
                                    823 
                                    824 ;       C@      ( b -- c )
                                    825 ;       Push byte in memory to  stack.
      00840F 90 85                  826         .word      LINK
                           0003E8   827 LINK	= 	.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 17.
Hexadecimal [24-Bits]



      008411 90                     828         .byte      2
      008412 FE 90                  829         .ascii     "C@"
      0003EB                        830 CAT:
      008414 FC 84            [ 1]  831         LDW Y,X     ;Y=b
      008416 08 07            [ 2]  832         LDW Y,(Y)
      008418 45 58            [ 1]  833         LD A,(Y)
      00841A 45 43            [ 1]  834         LD (1,X),A
      00841C 55               [ 1]  835         CLR (X)
      00841D 54               [ 4]  836         RET     
                                    837 
                                    838 ;       RP@     ( -- a )
                                    839 ;       Push current RP to data stack.
      00841E 45 E8                  840         .word      LINK
                           0003F7   841 LINK	= .
      00841F 03                     842         .byte      3
      00841F 90 93 1C               843         .ascii     "RP@"
      0003FB                        844 RPAT:
      008422 00 02            [ 1]  845         LDW Y,SP    ;save return addr
      008424 90 FE 90         [ 2]  846         SUBW X,#2
      008427 FC               [ 2]  847         LDW (X),Y
      008428 84               [ 4]  848         RET     
                                    849 
                                    850 ;       RP!     ( a -- )
                                    851 ;       Set  return stack pointer.
      008429 17 04                  852         .word      LINK
                           000404   853 LINK	= 	. 
      00842B 45                     854 	.byte      COMPO+3
      00842C 58 49 54               855         .ascii     "RP!"
      00842F                        856 RPSTO:
      00842F 90 85            [ 2]  857         POPW Y
      008431 81 84 2A         [ 2]  858         LDW YTEMP,Y
      008434 01 21            [ 1]  859         LDW Y,X
      008436 90 FE            [ 2]  860         LDW Y,(Y)
      008436 90 93            [ 1]  861         LDW SP,Y
      008438 90 FE 90         [ 2]  862         ADDW x,#CELLL ; a was not dropped, Picatout 2020-05-24
      00843B BF 24 90         [ 5]  863         JP [YTEMP]
                                    864 
                                    865 ;       R>      ( -- w )
                                    866 ;       Pop return stack to data stack.
      00843E 93 90                  867         .word      LINK
                           00041B   868 LINK	= 	. 
      008440 EE                     869 	.byte      COMPO+2
      008441 02 91                  870         .ascii     "R>"
      00041E                        871 RFROM:
      008443 CF 24            [ 2]  872         POPW Y    ;save return addr
      008445 1C 00 04         [ 2]  873         LDW YTEMP,Y
      008448 81 84            [ 2]  874         POPW Y
      00844A 34 01 40         [ 2]  875         SUBW X,#2
      00844D FF               [ 2]  876         LDW (X),Y
      00844D 90 93 90         [ 5]  877         JP [YTEMP]
                                    878 
                                    879 ;       R@      ( -- w )
                                    880 ;       Copy top of return stack to stack.
      008450 FE 90                  881         .word      LINK
                           00042E   882 LINK	= 	. 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
Hexadecimal [24-Bits]



      008452 FE                     883         .byte      2
      008453 FF 81                  884         .ascii     "R@"
      000431                        885 RAT:
                           000001   886 .if PICATOUT_MOD
      008455 84 4B            [ 2]  887         ldw y,(3,sp)
      008457 02 43 21         [ 2]  888         subw x,#CELLL 
      00845A FF               [ 2]  889         ldw (x),y 
      00845A 90               [ 4]  890         ret 
                           000000   891 .else 
                                    892         POPW Y
                                    893         LDW YTEMP,Y
                                    894         POPW Y
                                    895         PUSHW Y
                                    896         SUBW X,#2
                                    897         LDW (X),Y
                                    898         JP [YTEMP]
                                    899 .endif         
                                    900 
                                    901 ;       >R      ( w -- )
                                    902 ;       Push data stack to return stack.
      00845B 93 90                  903         .word      LINK
                           00043A   904 LINK	= 	. 
      00845D FE                     905 	.byte      COMPO+2
      00845E E6 03                  906         .ascii     ">R"
      00043D                        907 TOR:
      008460 90 F7            [ 2]  908         POPW Y    ;save return addr
      008462 1C 00 04         [ 2]  909         LDW YTEMP,Y
      008465 81 84            [ 1]  910         LDW Y,X
      008467 57 02            [ 2]  911         LDW Y,(Y)
      008469 43 40            [ 2]  912         PUSHW Y    ;restore return addr
      00846B 1C 00 02         [ 2]  913         ADDW X,#2
      00846B 90 93 90         [ 5]  914         JP [YTEMP]
                                    915 
                                    916 ;       SP@     ( -- a )
                                    917 ;       Push current stack pointer.
      00846E FE 90                  918         .word      LINK
                           000450   919 LINK	= 	. 
      008470 F6                     920         .byte      3
      008471 E7 01 7F               921         .ascii     "SP@"
      000454                        922 SPAT:
      008474 81 84            [ 1]  923 	LDW Y,X
      008476 68 03 52         [ 2]  924         SUBW X,#2
      008479 50               [ 2]  925 	LDW (X),Y
      00847A 40               [ 4]  926         RET     
                                    927 
                                    928 ;       SP!     ( a -- )
                                    929 ;       Set  data stack pointer.
      00847B 04 50                  930         .word      LINK
                           00045D   931 LINK	= 	. 
      00847B 90                     932         .byte      3
      00847C 96 1D 00               933         .ascii     "SP!"
      000461                        934 SPSTO:
      00847F 02               [ 2]  935         LDW     X,(X)     ;X = a
      008480 FF               [ 4]  936         RET     
                                    937 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]



                                    938 ;       DROP    ( w -- )
                                    939 ;       Discard top stack item.
      008481 81 84                  940         .word      LINK
                           000465   941 LINK	= 	. 
      008483 77                     942         .byte      4
      008484 43 52 50 21            943         .ascii     "DROP"
      008488                        944 DROP:
      008488 90 85 90         [ 2]  945         ADDW X,#2     
      00848B BF               [ 4]  946         RET     
                                    947 
                                    948 ;       DUP     ( w -- w w )
                                    949 ;       Duplicate  top stack item.
      00848C 24 90                  950         .word      LINK
                           000470   951 LINK	= 	. 
      00848E 93                     952         .byte      3
      00848F 90 FE 90               953         .ascii     "DUP"
      000474                        954 DUPP:
      008492 94 1C            [ 1]  955 	LDW Y,X
      008494 00 02 92         [ 2]  956         SUBW X,#2
      008497 CC 24            [ 2]  957 	LDW Y,(Y)
      008499 84               [ 2]  958 	LDW (X),Y
      00849A 84               [ 4]  959         RET     
                                    960 
                                    961 ;       SWAP    ( w1 w2 -- w2 w1 )
                                    962 ;       Exchange top two stack items.
      00849B 42 52                  963         .word      LINK
                           00047F   964 LINK	= 	. 
      00849D 3E                     965         .byte      4
      00849E 53 57 41 50            966         .ascii     "SWAP"
      000484                        967 SWAPP:
      00849E 90 85            [ 1]  968         LDW Y,X
      0084A0 90 BF            [ 2]  969         LDW Y,(Y)
      0084A2 24 90 85         [ 2]  970         LDW YTEMP,Y
      0084A5 1D 00            [ 1]  971         LDW Y,X
      0084A7 02 FF 92         [ 2]  972         LDW Y,(2,Y)
      0084AA CC               [ 2]  973         LDW (X),Y
      0084AB 24 84 9B         [ 2]  974         LDW Y,YTEMP
      0084AE 02 52            [ 2]  975         LDW (2,X),Y
      0084B0 40               [ 4]  976         RET     
                                    977 
                                    978 ;       OVER    ( w1 w2 -- w1 w2 w1 )
                                    979 ;       Copy second stack item to top.
      0084B1 04 7F                  980         .word      LINK
                           000499   981 LINK	= . 
      0084B1 16                     982         .byte      4
      0084B2 03 1D 00 02            983         .ascii     "OVER"
      00049E                        984 OVER:
      0084B6 FF 81 84         [ 2]  985         SUBW X,#2
      0084B9 AE 42            [ 1]  986         LDW Y,X
      0084BB 3E 52 04         [ 2]  987         LDW Y,(4,Y)
      0084BD FF               [ 2]  988         LDW (X),Y
      0084BD 90               [ 4]  989         RET     
                                    990 
                                    991 ;       0<      ( n -- t )
                                    992 ;       Return true if n is negative.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]



      0084BE 85 90                  993         .word      LINK
                           0004AA   994 LINK	= . 
      0084C0 BF                     995         .byte      2
      0084C1 24 90                  996         .ascii     "0<"
      0004AD                        997 ZLESS:
      0084C3 93 90            [ 1]  998         LD A,#0xFF
      0084C5 FE 90            [ 1]  999         LDW Y,X
      0084C7 89 1C            [ 2] 1000         LDW Y,(Y)
      0084C9 00 02            [ 1] 1001         JRMI     ZL1
      0084CB 92               [ 1] 1002         CLR A   ;false
      0084CC CC               [ 1] 1003 ZL1:    LD     (X),A
      0084CD 24 84            [ 1] 1004         LD (1,X),A
      0084CF BA               [ 4] 1005 	RET     
                                   1006 
                                   1007 ;       AND     ( w w -- w )
                                   1008 ;       Bitwise AND.
      0084D0 03 53                 1009         .word      LINK
                           0004BC  1010 LINK	= . 
      0084D2 50                    1011         .byte      3
      0084D3 40 4E 44              1012         .ascii     "AND"
      0084D4                       1013 ANDD:
      0084D4 90               [ 1] 1014         LD  A,(X)    ;D=w
      0084D5 93 1D            [ 1] 1015         AND A,(2,X)
      0084D7 00 02            [ 1] 1016         LD (2,X),A
      0084D9 FF 81            [ 1] 1017         LD A,(1,X)
      0084DB 84 D0            [ 1] 1018         AND A,(3,X)
      0084DD 03 53            [ 1] 1019         LD (3,X),A
      0084DF 50 21 02         [ 2] 1020         ADDW X,#2
      0084E1 81               [ 4] 1021         RET
                                   1022 
                                   1023 ;       OR      ( w w -- w )
                                   1024 ;       Bitwise inclusive OR.
      0084E1 FE 81                 1025         .word      LINK
                           0004D1  1026 LINK = . 
      0084E3 84                    1027         .byte      2
      0084E4 DD 04                 1028         .ascii     "OR"
      0004D4                       1029 ORR:
      0084E6 44               [ 1] 1030         LD A,(X)    ;D=w
      0084E7 52 4F            [ 1] 1031         OR A,(2,X)
      0084E9 50 02            [ 1] 1032         LD (2,X),A
      0084EA E6 01            [ 1] 1033         LD A,(1,X)
      0084EA 1C 00            [ 1] 1034         OR A,(3,X)
      0084EC 02 81            [ 1] 1035         LD (3,X),A
      0084EE 84 E5 03         [ 2] 1036         ADDW X,#2
      0084F1 44               [ 4] 1037         RET
                                   1038 
                                   1039 ;       XOR     ( w w -- w )
                                   1040 ;       Bitwise exclusive OR.
      0084F2 55 50                 1041         .word      LINK
                           0004E5  1042 LINK	= . 
      0084F4 03                    1043         .byte      3
      0084F4 90 93 1D              1044         .ascii     "XOR"
      0004E9                       1045 XORR:
      0084F7 00               [ 1] 1046         LD A,(X)    ;D=w
      0084F8 02 90            [ 1] 1047         XOR A,(2,X)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



      0084FA FE FF            [ 1] 1048         LD (2,X),A
      0084FC 81 84            [ 1] 1049         LD A,(1,X)
      0084FE F0 04            [ 1] 1050         XOR A,(3,X)
      008500 53 57            [ 1] 1051         LD (3,X),A
      008502 41 50 02         [ 2] 1052         ADDW X,#2
      008504 81               [ 4] 1053         RET
                                   1054 
                                   1055 ;       UM+     ( u u -- udsum )
                                   1056 ;       Add two unsigned single
                                   1057 ;       and return a double sum.
      008504 90 93                 1058         .word      LINK
                           0004FA  1059 LINK	= . 
      008506 90                    1060         .byte      3
      008507 FE 90 BF              1061         .ascii     "UM+"
      0004FE                       1062 UPLUS:
      00850A 24 90            [ 1] 1063         LD A,#1
      00850C 93 90            [ 1] 1064         LDW Y,X
      00850E EE 02 FF         [ 2] 1065         LDW Y,(2,Y)
      008511 90 BE 24         [ 2] 1066         LDW YTEMP,Y
      008514 EF 02            [ 1] 1067         LDW Y,X
      008516 81 84            [ 2] 1068         LDW Y,(Y)
      008518 FF 04 4F 56      [ 2] 1069         ADDW Y,YTEMP
      00851C 45 52            [ 2] 1070         LDW (2,X),Y
      00851E 25 01            [ 1] 1071         JRC     UPL1
      00851E 1D               [ 1] 1072         CLR A
      00851F 00 02            [ 1] 1073 UPL1:   LD     (1,X),A
      008521 90               [ 1] 1074         CLR (X)
      008522 93               [ 4] 1075         RET
                                   1076 
                                   1077 ;; System and user variables
                                   1078 
                                   1079 ;       doVAR   ( -- a )
                                   1080 ;       Code for VARIABLE and CREATE.
      008523 90 EE                 1081         .word      LINK
                           00051B  1082 LINK	= . 
      008525 04                    1083 	.byte      COMPO+5
      008526 FF 81 85 19 02        1084         .ascii     "DOVAR"
      000521                       1085 DOVAR:
      00852B 30 3C 02         [ 2] 1086 	SUBW X,#2
      00852D 90 85            [ 2] 1087         POPW Y    ;get return addr (pfa)
                           000001  1088 .if PICATOUT_MOD
      00852D A6 FF            [ 2] 1089         LDW Y,(Y) ; indirect address 
                                   1090 .endif ;PICATOUT_MOD        
      00852F 90               [ 2] 1091         LDW (X),Y    ;push on stack
      008530 93               [ 4] 1092         RET     ;go to RET of EXEC
                                   1093 
                                   1094 ;       BASE    ( -- a )
                                   1095 ;       Radix base for numeric I/O.
      008531 90 FE                 1096         .word      LINK        
                           00052C  1097 LINK = . 
      008533 2B                    1098         .byte      4
      008534 01 4F F7 E7           1099         .ascii     "BASE"
      000531                       1100 BASE:
      008538 01 81 85 2A      [ 2] 1101 	LDW Y,#UBASE 
      00853C 03 41 4E         [ 2] 1102 	SUBW X,#2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]



      00853F 44               [ 2] 1103         LDW (X),Y
      008540 81               [ 4] 1104         RET
                                   1105 
                                   1106 ;       tmp     ( -- a )
                                   1107 ;       A temporary storage.
      008540 F6 E4                 1108         .word      LINK
                                   1109         
                           00053C  1110 LINK = . 
      008542 02                    1111 	.byte      3
      008543 E7 02 E6              1112         .ascii     "TMP"
      000540                       1113 TEMP:
      008546 01 E4 03 E7      [ 2] 1114 	LDW Y,#UTMP
      00854A 03 1C 00         [ 2] 1115 	SUBW X,#2
      00854D 02               [ 2] 1116         LDW (X),Y
      00854E 81               [ 4] 1117         RET
                                   1118 
                                   1119 ;       >IN     ( -- a )
                                   1120 ;        Hold parsing pointer.
      00854F 85 3C                 1121         .word      LINK
                           00054B  1122 LINK = . 
      008551 02                    1123         .byte      3
      008552 4F 52 4E              1124         .ascii    ">IN"
      008554                       1125 INN:
      008554 F6 EA 02 E7      [ 2] 1126 	LDW Y,#UINN 
      008558 02 E6 01         [ 2] 1127 	SUBW X,#2
      00855B EA               [ 2] 1128         LDW (X),Y
      00855C 03               [ 4] 1129         RET
                                   1130 
                                   1131 ;       #TIB    ( -- a )
                                   1132 ;       Count in terminal input buffer.
      00855D E7 03                 1133         .word      LINK
                           00055A  1134 LINK = . 
      00855F 1C                    1135         .byte      4
      008560 00 02 81 85           1136         .ascii     "#TIB"
      00055F                       1137 NTIB:
      008564 51 03 58 4F      [ 2] 1138 	LDW Y,#UCTIB 
      008568 52 00 02         [ 2] 1139 	SUBW X,#2
      008569 FF               [ 2] 1140         LDW (X),Y
      008569 F6               [ 4] 1141         RET
                                   1142 
                           000001  1143 .if PICATOUT_MOD
                                   1144 ;       TBUF ( -- a )
                                   1145 ;       address of 128 bytes transaction buffer 
      00856A E8 02                 1146         .word LINK 
                           00056A  1147         LINK=.
      00856C E7                    1148         .byte 4 
      00856D 02 E6 01 E8           1149         .ascii "TBUF"
      00056F                       1150 TBUF:
      008571 03 E7 03 1C      [ 2] 1151         ldw y,#ROWBUFF
      008575 00 02 81         [ 2] 1152         subw x,#CELLL
      008578 85               [ 2] 1153         ldw (x),y 
      008579 65               [ 4] 1154         ret 
                                   1155 
                                   1156 ; systeme variable 
                                   1157 ; compilation destination 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



                                   1158 ; TFLASH ( -- A )
      00857A 03 55                 1159         .word LINK 
                           00057A  1160         LINK=.
      00857C 4D                    1161         .byte 6 
      00857D 2B 46 4C 41 53 48     1162         .ascii "TFLASH"         
      00857E                       1163 TFLASH:
      00857E A6 01 90         [ 2] 1164         subw x,#CELLL 
      008581 93 90 EE 02      [ 2] 1165         ldw y,#UTFLASH
      008585 90               [ 2] 1166         ldw (x),y 
      008586 BF               [ 4] 1167         ret 
                                   1168 
                                   1169 .endif ;PICATOUT_MOD
                                   1170 
                                   1171 ;       "EVAL   ( -- a )
                                   1172 ;       Execution vector of EVAL.
      008587 24 90                 1173         .word      LINK
                           00058C  1174 LINK = . 
      008589 93                    1175         .byte      5
      00858A 90 FE 72 B9 00        1176         .ascii     "'EVAL"
      000592                       1177 TEVAL:
      00858F 24 EF 02 25      [ 2] 1178 	LDW Y,#UINTER 
      008593 01 4F E7         [ 2] 1179 	SUBW X,#2
      008596 01               [ 2] 1180         LDW (X),Y
      008597 7F               [ 4] 1181         RET
                                   1182 
                                   1183 ;       HLD     ( -- a )
                                   1184 ;       Hold a pointer of output string.
      008598 81 85                 1185         .word      LINK
                           00059D  1186 LINK = . 
      00859A 7A                    1187         .byte      3
      00859B 45 44 4F              1188         .ascii     "HLD"
      0005A1                       1189 HLD:
      00859E 56 41 52 12      [ 2] 1190 	LDW Y,#UHLD 
      0085A1 1D 00 02         [ 2] 1191 	SUBW X,#2
      0085A1 1D               [ 2] 1192         LDW (X),Y
      0085A2 00               [ 4] 1193         RET
                                   1194 
                                   1195 ;       CONTEXT ( -- a )
                                   1196 ;       Start vocabulary search.
      0085A3 02 90                 1197         .word      LINK
                           0005AC  1198 LINK = . 
      0085A5 85                    1199         .byte      7
      0085A6 90 FE FF 81 85 9B 04  1200         .ascii     "CONTEXT"
      0005B4                       1201 CNTXT:
      0085AD 42 41 53 45      [ 2] 1202 	LDW Y,#UCNTXT
      0085B1 1D 00 02         [ 2] 1203 	SUBW X,#2
      0085B1 90               [ 2] 1204         LDW (X),Y
      0085B2 AE               [ 4] 1205         RET
                                   1206 
                                   1207 ;       VP      ( -- a )
                                   1208 ;       Point to top of variables
      0085B3 00 06                 1209         .word      LINK
                           0005BF  1210 LINK = . 
      0085B5 1D                    1211         .byte      2
      0085B6 00 02                 1212         .ascii     "VP"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]



      0005C2                       1213 VPP:
      0085B8 FF 81 85 AC      [ 2] 1214 	LDW Y,#UVP 
      0085BC 03 54 4D         [ 2] 1215 	SUBW X,#2
      0085BF 50               [ 2] 1216         LDW (X),Y
      0085C0 81               [ 4] 1217         RET
                                   1218 
                           000001  1219 .if PICATOUT_MOD
                                   1220 ;       CP    ( -- a )
                                   1221 ;       Pointer to top of FLASH 
      0085C0 90 AE                 1222         .word LINK 
                           0005CD  1223         LINK=.
      0085C2 00                    1224         .byte 2 
      0085C3 08 1D                 1225         .ascii "CP"
      0005D0                       1226 CPP: 
      0085C5 00 02 FF 81      [ 2] 1227         ldw y,#UCP 
      0085C9 85 BC 03         [ 2] 1228         subw x,#CELLL 
      0085CC 3E               [ 2] 1229         ldw (x),y 
      0085CD 49               [ 4] 1230         ret                
                                   1231 .endif ;PICATOUT_MOD
                                   1232 
                                   1233 ;       LAST    ( -- a )
                                   1234 ;       Point to last name in dictionary.
      0085CE 4E CD                 1235         .word      LINK
                           0005DB  1236 LINK = . 
      0085CF 04                    1237         .byte      4
      0085CF 90 AE 00 0A           1238         .ascii     "LAST"
      0005E0                       1239 LAST:
      0085D3 1D 00 02 FF      [ 2] 1240 	LDW Y,#ULAST 
      0085D7 81 85 CB         [ 2] 1241 	SUBW X,#2
      0085DA 04               [ 2] 1242         LDW (X),Y
      0085DB 23               [ 4] 1243         RET
                                   1244 
                           000001  1245 .if PICATOUT_MOD 
                                   1246 ; address of system variable URLAST 
                                   1247 ;       RAMLAST ( -- a )
                                   1248 ; RAM dictionary context 
      0085DC 54 49                 1249         .word LINK 
                           0005EB  1250         LINK=. 
      0085DE 42                    1251         .byte 7  
      0085DF 52 41 4D 4C 41 53 54  1252         .ascii "RAMLAST" 
      0005F3                       1253 RAMLAST: 
      0085DF 90 AE 00 0C      [ 2] 1254         ldw y,#URLAST 
      0085E3 1D 00 02         [ 2] 1255         subw x,#CELLL 
      0085E6 FF               [ 2] 1256         ldw (x),y 
      0085E7 81               [ 4] 1257         ret 
                                   1258 .endif ;PICATOUT_MOD
                                   1259 
                           000001  1260 .if PICATOUT_MOD
                                   1261 ; OFFSET ( -- a )
                                   1262 ; address of system variable OFFSET 
      0085E8 85 DA                 1263         .word LINK 
                           0005FE  1264         LINK=.
      0085EA 04                    1265         .byte 6
      0085EB 54 42 55 46 45 54     1266         .ascii "OFFSET" 
      0085EF                       1267 OFFSET: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



      0085EF 90 AE 16         [ 2] 1268         subw x,#CELLL
      0085F2 80 1D 00 02      [ 2] 1269         ldw y,#UOFFSET 
      0085F6 FF               [ 2] 1270         ldw (x),y 
      0085F7 81               [ 4] 1271         ret 
                                   1272 
                                   1273 ; adjust jump address adding OFFSET
                                   1274 ; ADR-ADJ ( a -- a+offset )
      00060E                       1275 ADRADJ: 
      0085F8 85 EA 06         [ 4] 1276         call OFFSET 
      0085FB 54 46 4C         [ 4] 1277         call AT 
      0085FE 41 53 48         [ 2] 1278         jp PLUS 
                                   1279 
                                   1280 .endif ; PICATOUT_MOD
                                   1281 
                                   1282 ;; Common functions
                                   1283 
                                   1284 ;       ?DUP    ( w -- w w | 0 )
                                   1285 ;       Dup tos if its is not zero.
      008601 05 FE                 1286         .word      LINK
                           000619  1287 LINK = . 
      008601 1D                    1288         .byte      4
      008602 00 02 90 AE           1289         .ascii     "?DUP"
      00061E                       1290 QDUP:
      008606 00 1E            [ 1] 1291         LDW Y,X
      008608 FF 81            [ 2] 1292 	LDW Y,(Y)
      00860A 85 FA            [ 1] 1293         JREQ     QDUP1
      00860C 05 27 45         [ 2] 1294 	SUBW X,#2
      00860F 56               [ 2] 1295         LDW (X),Y
      008610 41               [ 4] 1296 QDUP1:  RET
                                   1297 
                                   1298 ;       ROT     ( w1 w2 w3 -- w2 w3 w1 )
                                   1299 ;       Rot 3rd item to top.
      008611 4C 19                 1300         .word      LINK
                           00062B  1301 LINK = . 
      008612 03                    1302         .byte      3
      008612 90 AE 00              1303         .ascii     "ROT"
      00062F                       1304 ROT:
                           000001  1305 .if PICATOUT_MOD
      008615 10 1D            [ 1] 1306         ldw y,x 
      008617 00 02            [ 2] 1307         ldw y,(y)
      008619 FF 81            [ 2] 1308         pushw y 
      00861B 86 0C            [ 1] 1309         ldw y,x 
      00861D 03 48 4C         [ 2] 1310         ldw y,(4,y)
      008620 44               [ 2] 1311         ldw (x),y 
      008621 90 93            [ 1] 1312         ldw y,x 
      008621 90 AE 00         [ 2] 1313         ldw y,(2,y)
      008624 12 1D            [ 2] 1314         ldw (4,x),y 
      008626 00 02            [ 2] 1315         popw y 
      008628 FF 81            [ 2] 1316         ldw (2,x),y
      00862A 86               [ 4] 1317         ret 
                           000000  1318 .else 
                                   1319         LDW Y,X
                                   1320 	LDW Y,(4,Y)
                                   1321 	LDW YTEMP,Y
                                   1322         LDW Y,X
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



                                   1323         LDW Y,(2,Y)
                                   1324         LDW XTEMP,Y
                                   1325         LDW Y,X
                                   1326         LDW Y,(Y)
                                   1327         LDW (2,X),Y
                                   1328         LDW Y,XTEMP
                                   1329         LDW (4,X),Y
                                   1330         LDW Y,YTEMP
                                   1331         LDW (X),Y
                                   1332         RET
                                   1333 .endif 
                                   1334 
                                   1335 ;       2DROP   ( w w -- )
                                   1336 ;       Discard two items on stack.
      00862B 1D 07                 1337         .word      LINK
                           000649  1338 LINK = . 
      00862D 43                    1339         .byte      5
      00862E 4F 4E 54 45 58        1340         .ascii     "2DROP"
      00064F                       1341 DDROP:
      008633 54 00 04         [ 2] 1342         ADDW X,#4
      008634 81               [ 4] 1343         RET
                                   1344 
                                   1345 ;       2DUP    ( w1 w2 -- w1 w2 w1 w2 )
                                   1346 ;       Duplicate top two items.
      008634 90 AE                 1347         .word      LINK
                           000655  1348 LINK = . 
      008636 00                    1349         .byte      4
      008637 14 1D 00 02           1350         .ascii     "2DUP"
      00065A                       1351 DDUP:
      00863B FF 81 86         [ 2] 1352         SUBW X,#4
      00863E 2C 02            [ 1] 1353         LDW Y,X
      008640 56 50 06         [ 2] 1354         LDW Y,(6,Y)
      008642 EF 02            [ 2] 1355         LDW (2,X),Y
      008642 90 AE            [ 1] 1356         LDW Y,X
      008644 00 16 1D         [ 2] 1357         LDW Y,(4,Y)
      008647 00               [ 2] 1358         LDW (X),Y
      008648 02               [ 4] 1359         RET
                                   1360 
                                   1361 ;       +       ( w w -- sum )
                                   1362 ;       Add top two items.
      008649 FF 81                 1363         .word      LINK
                           00066D  1364 LINK = . 
      00864B 86                    1365         .byte      1
      00864C 3F                    1366         .ascii     "+"
      00066F                       1367 PLUS:
      00864D 02 43            [ 1] 1368         LDW Y,X
      00864F 50 FE            [ 2] 1369         LDW Y,(Y)
      008650 90 BF 24         [ 2] 1370         LDW YTEMP,Y
      008650 90 AE 00         [ 2] 1371         ADDW X,#2
      008653 18 1D            [ 1] 1372         LDW Y,X
      008655 00 02            [ 2] 1373         LDW Y,(Y)
      008657 FF 81 86 4D      [ 2] 1374         ADDW Y,YTEMP
      00865B 04               [ 2] 1375         LDW (X),Y
      00865C 4C               [ 4] 1376         RET
                                   1377 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal [24-Bits]



                                   1378 ;       NOT     ( w -- w )
                                   1379 ;       One's complement of tos.
      00865D 41 53                 1380         .word      LINK
                           000685  1381 LINK = . 
      00865F 54                    1382         .byte      3
      008660 4E 4F 54              1383         .ascii     "NOT"
      000689                       1384 INVER:
      008660 90 AE            [ 1] 1385         LDW Y,X
      008662 00 1A            [ 2] 1386         LDW Y,(Y)
      008664 1D 00            [ 2] 1387         CPLW Y
      008666 02               [ 2] 1388         LDW (X),Y
      008667 FF               [ 4] 1389         RET
                                   1390 
                                   1391 ;       NEGATE  ( n -- -n )
                                   1392 ;       Two's complement of tos.
      008668 81 86                 1393         .word      LINK
                           000693  1394 LINK = . 
      00866A 5B                    1395         .byte      6
      00866B 07 52 41 4D 4C 41     1396         .ascii     "NEGATE"
      00069A                       1397 NEGAT:
      008671 53 54            [ 1] 1398         LDW Y,X
      008673 90 FE            [ 2] 1399         LDW Y,(Y)
      008673 90 AE            [ 2] 1400         NEGW Y
      008675 00               [ 2] 1401         LDW (X),Y
      008676 20               [ 4] 1402         RET
                                   1403 
                                   1404 ;       DNEGATE ( d -- -d )
                                   1405 ;       Two's complement of top double.
      008677 1D 00                 1406         .word      LINK
                           0006A4  1407 LINK = . 
      008679 02                    1408         .byte      7
      00867A FF 81 86 6B 06 4F 46  1409         .ascii     "DNEGATE"
      0006AC                       1410 DNEGA:
      008681 46 53            [ 1] 1411         LDW Y,X
      008683 45 54            [ 2] 1412 	LDW Y,(Y)
      008685 90 53            [ 2] 1413         CPLW Y     
      008685 1D 00 02         [ 2] 1414 	LDW YTEMP,Y
      008688 90 AE            [ 1] 1415         LDW Y,X
      00868A 00 1C FF         [ 2] 1416         LDW Y,(2,Y)
      00868D 81 53            [ 2] 1417         CPLW Y
      00868E 90 5C            [ 2] 1418         INCW Y
      00868E CD 86            [ 2] 1419         LDW (2,X),Y
      008690 85 CD 84         [ 2] 1420         LDW Y,YTEMP
      008693 4D CC            [ 1] 1421         JRNC DN1 
      008695 86 EF            [ 2] 1422         INCW Y
      008697 86               [ 2] 1423 DN1:    LDW (X),Y
      008698 7E               [ 4] 1424         RET
                                   1425 
                                   1426 ;       -       ( n1 n2 -- n1-n2 )
                                   1427 ;       Subtraction.
      008699 04 3F                 1428         .word      LINK
                           0006CB  1429 LINK = . 
      00869B 44                    1430         .byte      1
      00869C 55                    1431         .ascii     "-"
      0006CD                       1432 SUBB:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



      00869D 50 93            [ 1] 1433         LDW Y,X
      00869E 90 FE            [ 2] 1434         LDW Y,(Y)
      00869E 90 93 90         [ 2] 1435         LDW YTEMP,Y
      0086A1 FE 27 04         [ 2] 1436         ADDW X,#2
      0086A4 1D 00            [ 1] 1437         LDW Y,X
      0086A6 02 FF            [ 2] 1438         LDW Y,(Y)
      0086A8 81 86 99 03      [ 2] 1439         SUBW Y,YTEMP
      0086AC 52               [ 2] 1440         LDW (X),Y
      0086AD 4F               [ 4] 1441         RET
                                   1442 
                                   1443 ;       ABS     ( n -- n )
                                   1444 ;       Return  absolute value of n.
      0086AE 54 CB                 1445         .word      LINK
                           0006E3  1446 LINK = . 
      0086AF 03                    1447         .byte      3
      0086AF 90 93 90              1448         .ascii     "ABS"
      0006E7                       1449 ABSS:
      0086B2 FE 90            [ 1] 1450         LDW Y,X
      0086B4 89 90            [ 2] 1451 	LDW Y,(Y)
      0086B6 93 90            [ 1] 1452         JRPL     AB1     ;negate:
      0086B8 EE 04            [ 2] 1453         NEGW     Y     ;else negate hi byte
      0086BA FF               [ 2] 1454         LDW (X),Y
      0086BB 90               [ 4] 1455 AB1:    RET
                                   1456 
                                   1457 ;       =       ( w w -- t )
                                   1458 ;       Return true if top two are =al.
      0086BC 93 90                 1459         .word      LINK
                           0006F3  1460 LINK = . 
      0086BE EE                    1461         .byte      1
      0086BF 02                    1462         .ascii     "="
      0006F5                       1463 EQUAL:
      0086C0 EF 04            [ 1] 1464         LD A,#0xFF  ;true
      0086C2 90 85            [ 1] 1465         LDW Y,X    ;D = n2
      0086C4 EF 02            [ 2] 1466         LDW Y,(Y)
      0086C6 81 86 AB         [ 2] 1467         LDW YTEMP,Y
      0086C9 05 32 44         [ 2] 1468         ADDW X,#2
      0086CC 52 4F            [ 1] 1469         LDW Y,X
      0086CE 50 FE            [ 2] 1470         LDW Y,(Y)
      0086CF 90 B3 24         [ 2] 1471         CPW Y,YTEMP     ;if n2 <> n1
      0086CF 1C 00            [ 1] 1472         JREQ     EQ1
      0086D1 04               [ 1] 1473         CLR A
      0086D2 81               [ 1] 1474 EQ1:    LD (X),A
      0086D3 86 C9            [ 1] 1475         LD (1,X),A
      0086D5 04               [ 4] 1476 	RET     
                                   1477 
                                   1478 ;       U<      ( u u -- t )
                                   1479 ;       Unsigned compare of top two items.
      0086D6 32 44                 1480         .word      LINK
                           000711  1481 LINK = . 
      0086D8 55                    1482         .byte      2
      0086D9 50 3C                 1483         .ascii     "U<"
      0086DA                       1484 ULESS:
      0086DA 1D 00            [ 1] 1485         LD A,#0xFF  ;true
      0086DC 04 90            [ 1] 1486         LDW Y,X    ;D = n2
      0086DE 93 90            [ 2] 1487         LDW Y,(Y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



      0086E0 EE 06 EF         [ 2] 1488         LDW YTEMP,Y
      0086E3 02 90 93         [ 2] 1489         ADDW X,#2
      0086E6 90 EE            [ 1] 1490         LDW Y,X
      0086E8 04 FF            [ 2] 1491         LDW Y,(Y)
      0086EA 81 86 D5         [ 2] 1492         CPW Y,YTEMP     ;if n2 <> n1
      0086ED 01 2B            [ 1] 1493         JRULT     ULES1
      0086EF 4F               [ 1] 1494         CLR A
      0086EF 90               [ 1] 1495 ULES1:  LD (X),A
      0086F0 93 90            [ 1] 1496         LD (1,X),A
      0086F2 FE               [ 4] 1497 	RET     
                                   1498 
                                   1499 ;       <       ( n1 n2 -- t )
                                   1500 ;       Signed compare of top two items.
      0086F3 90 BF                 1501         .word      LINK
                           000730  1502 LINK = . 
      0086F5 24                    1503         .byte      1
      0086F6 1C                    1504         .ascii     "<"
      000732                       1505 LESS:
      0086F7 00 02            [ 1] 1506         LD A,#0xFF  ;true
      0086F9 90 93            [ 1] 1507         LDW Y,X    ;D = n2
      0086FB 90 FE            [ 2] 1508         LDW Y,(Y)
      0086FD 72 B9 00         [ 2] 1509         LDW YTEMP,Y
      008700 24 FF 81         [ 2] 1510         ADDW X,#2
      008703 86 ED            [ 1] 1511         LDW Y,X
      008705 03 4E            [ 2] 1512         LDW Y,(Y)
      008707 4F 54 24         [ 2] 1513         CPW Y,YTEMP     ;if n2 <> n1
      008709 2F 01            [ 1] 1514         JRSLT     LT1
      008709 90               [ 1] 1515         CLR A
      00870A 93               [ 1] 1516 LT1:    LD (X),A
      00870B 90 FE            [ 1] 1517         LD (1,X),A
      00870D 90               [ 4] 1518 	RET     
                                   1519 
                                   1520 ;       MAX     ( n n -- n )
                                   1521 ;       Return greater of two top items.
      00870E 53 FF                 1522         .word      LINK
                           00074E  1523 LINK = . 
      008710 81                    1524         .byte      3
      008711 87 05 06              1525         .ascii     "MAX"
      000752                       1526 MAX:
      008714 4E 45            [ 1] 1527         LDW Y,X    ;D = n2
      008716 47 41 54         [ 2] 1528         LDW Y,(2,Y)
      008719 45 BF 24         [ 2] 1529         LDW YTEMP,Y
      00871A 90 93            [ 1] 1530         LDW Y,X
      00871A 90 93            [ 2] 1531         LDW Y,(Y)
      00871C 90 FE 90         [ 2] 1532         CPW Y,YTEMP     ;if n2 <> n1
      00871F 50 FF            [ 1] 1533         JRSLT     MAX1
      008721 81 87            [ 2] 1534         LDW (2,X),Y
      008723 13 07 44         [ 2] 1535 MAX1:   ADDW X,#2
      008726 4E               [ 4] 1536 	RET     
                                   1537 
                                   1538 ;       MIN     ( n n -- n )
                                   1539 ;       Return smaller of top two items.
      008727 45 47                 1540         .word      LINK
                           00076B  1541 LINK = . 
      008729 41                    1542         .byte      3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



      00872A 54 45 4E              1543         .ascii     "MIN"
      00872C                       1544 MIN:
      00872C 90 93            [ 1] 1545         LDW Y,X    ;D = n2
      00872E 90 FE 90         [ 2] 1546         LDW Y,(2,Y)
      008731 53 90 BF         [ 2] 1547         LDW YTEMP,Y
      008734 24 90            [ 1] 1548         LDW Y,X
      008736 93 90            [ 2] 1549         LDW Y,(Y)
      008738 EE 02 90         [ 2] 1550         CPW Y,YTEMP     ;if n2 <> n1
      00873B 53 90            [ 1] 1551         JRSGT     MIN1
      00873D 5C EF            [ 2] 1552         LDW (2,X),Y
      00873F 02 90 BE         [ 2] 1553 MIN1:	ADDW X,#2
      008742 24               [ 4] 1554 	RET     
                                   1555 
                                   1556 ;       WITHIN  ( u ul uh -- t )
                                   1557 ;       Return true if u is within
                                   1558 ;       range of ul and uh. ( ul <= u < uh )
      008743 24 02                 1559         .word      LINK
                           000788  1560 LINK = . 
      008745 90                    1561         .byte      6
      008746 5C FF 81 87 24 01     1562         .ascii     "WITHIN"
      00078F                       1563 WITHI:
      00874C 2D 04 9E         [ 4] 1564         CALL     OVER
      00874D CD 06 CD         [ 4] 1565         CALL     SUBB
      00874D 90 93 90         [ 4] 1566         CALL     TOR
      008750 FE 90 BF         [ 4] 1567         CALL     SUBB
      008753 24 1C 00         [ 4] 1568         CALL     RFROM
      008756 02 90 93         [ 2] 1569         JP     ULESS
                                   1570 
                                   1571 ;; Divide
                                   1572 
                                   1573 ;       UM/MOD  ( udl udh un -- ur uq )
                                   1574 ;       Unsigned divide of a double by a
                                   1575 ;       single. Return mod and quotient.
      008759 90 FE                 1576         .word      LINK
                           0007A3  1577 LINK = . 
      00875B 72                    1578         .byte      6
      00875C B2 00 24 FF 81 87     1579         .ascii     "UM/MOD"
      0007AA                       1580 UMMOD:
      008762 4B 03            [ 2] 1581 	LDW XTEMP,X	; save stack pointer
      008764 41               [ 2] 1582 	LDW X,(X)	; un
      008765 42 53            [ 2] 1583 	LDW YTEMP,X     ; save un
      008767 90 BE 22         [ 2] 1584 	LDW Y,XTEMP	; stack pointer
      008767 90 93 90         [ 2] 1585 	LDW Y,(4,Y)     ; Y=udl
      00876A FE 2A            [ 2] 1586 	LDW X,XTEMP
      00876C 03 90            [ 2] 1587 	LDW X,(2,X)	; X=udh
      00876E 50 FF            [ 2] 1588 	CPW X,YTEMP
      008770 81 87            [ 2] 1589 	JRULE MMSM1
      008772 63 01            [ 2] 1590 	LDW X,XTEMP
      008774 3D 00 02         [ 2] 1591 	ADDW X,#2	; pop off 1 level
      008775 90 AE FF FF      [ 2] 1592 	LDW Y,#0xFFFF
      008775 A6               [ 2] 1593 	LDW (X),Y
      008776 FF 90            [ 1] 1594 	CLRW Y
      008778 93 90            [ 2] 1595 	LDW (2,X),Y
      00877A FE               [ 4] 1596 	RET
      0007CC                       1597 MMSM1:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



                           000001  1598 .if PICATOUT_MOD 
                                   1599 ; take advantage of divw x,y when udh==0
      00877B 90               [ 2] 1600         tnzw x  ; is udh==0?
      00877C BF 24            [ 1] 1601         jrne MMSM2 
      00877E 1C               [ 1] 1602         ldw x,y    ;udl 
      00877F 00 02 90         [ 2] 1603         ldw y,YTEMP ; divisor 
      008782 93               [ 2] 1604         divw x,y 
      008783 90               [ 2] 1605         pushw x     ; quotient 
      008784 FE 90            [ 2] 1606         ldw x,XTEMP 
      008786 B3 24 27         [ 2] 1607         addw x,#CELLL 
      008789 01 4F            [ 2] 1608         ldw (2,x),y  ; ur
      00878B F7 E7            [ 2] 1609         popw y 
      00878D 01               [ 2] 1610         ldw (x),y ; uq 
      00878E 81               [ 4] 1611         ret 
      0007E0                       1612 MMSM2:        
                                   1613 .endif 
      00878F 87 73            [ 1] 1614 	LD A,#17	; loop count
      0007E2                       1615 MMSM3:
      008791 02 55            [ 2] 1616 	CPW X,YTEMP	; compare udh to un
      008793 3C 04            [ 1] 1617 	JRULT MMSM4	; can't subtract
      008794 72 B0 00 24      [ 2] 1618 	SUBW X,YTEMP	; can subtract
      0007EA                       1619 MMSM4:
      008794 A6               [ 1] 1620 	CCF	; quotient bit
      008795 FF 90            [ 2] 1621 	RLCW Y	; rotate into quotient
      008797 93               [ 2] 1622 	RLCW X	; rotate into remainder
      008798 90               [ 1] 1623 	DEC A	; repeat
      008799 FE 90            [ 1] 1624 	JRUGT MMSM3
                                   1625 	;SRAW X
      00879B BF               [ 2] 1626         RRCW X 
      00879C 24 1C            [ 2] 1627 	LDW YTEMP,X	; done, save remainder
      00879E 00 02            [ 2] 1628 	LDW X,XTEMP
      0087A0 90 93 90         [ 2] 1629 	ADDW X,#2	; drop
      0087A3 FE               [ 2] 1630 	LDW (X),Y
      0087A4 90 B3 24         [ 2] 1631 	LDW Y,YTEMP	; save quotient
      0087A7 25 01            [ 2] 1632 	LDW (2,X),Y
      0087A9 4F               [ 4] 1633 	RET
                                   1634 	
                                   1635 ;       M/MOD   ( d n -- r q )
                                   1636 ;       Signed floored divide of double by
                                   1637 ;       single. Return mod and quotient.
      0087AA F7 E7                 1638         .word      LINK
                           000802  1639 LINK = . 
      0087AC 01                    1640         .byte      5
      0087AD 81 87 91 01 3C        1641         .ascii     "M/MOD"
      0087B2                       1642 MSMOD:  
      0087B2 A6 FF 90         [ 4] 1643         CALL	DUPP
      0087B5 93 90 FE         [ 4] 1644         CALL	ZLESS
      0087B8 90 BF 24         [ 4] 1645         CALL	DUPP
      0087BB 1C 00 02         [ 4] 1646         CALL	TOR
      0087BE 90 93 90         [ 4] 1647         CALL	QBRAN
      0087C1 FE 90                 1648         .word	MMOD1
      0087C3 B3 24 2F         [ 4] 1649         CALL	NEGAT
      0087C6 01 4F F7         [ 4] 1650         CALL	TOR
      0087C9 E7 01 81         [ 4] 1651         CALL	DNEGA
      0087CC 87 B0 03         [ 4] 1652         CALL	RFROM
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



      0087CF 4D 41 58         [ 4] 1653 MMOD1:	CALL	TOR
      0087D2 CD 04 74         [ 4] 1654         CALL	DUPP
      0087D2 90 93 90         [ 4] 1655         CALL	ZLESS
      0087D5 EE 02 90         [ 4] 1656         CALL	QBRAN
      0087D8 BF 24                 1657         .word	MMOD2
      0087DA 90 93 90         [ 4] 1658         CALL	RAT
      0087DD FE 90 B3         [ 4] 1659         CALL	PLUS
      0087E0 24 2F 02         [ 4] 1660 MMOD2:	CALL	RFROM
      0087E3 EF 02 1C         [ 4] 1661         CALL	UMMOD
      0087E6 00 02 81         [ 4] 1662         CALL	RFROM
      0087E9 87 CE 03         [ 4] 1663         CALL	QBRAN
      0087EC 4D 49                 1664         .word	MMOD3
      0087EE 4E 04 84         [ 4] 1665         CALL	SWAPP
      0087EF CD 06 9A         [ 4] 1666         CALL	NEGAT
      0087EF 90 93 90         [ 4] 1667         CALL	SWAPP
      0087F2 EE               [ 4] 1668 MMOD3:	RET
                                   1669 
                                   1670 ;       /MOD    ( n n -- r q )
                                   1671 ;       Signed divide. Return mod and quotient.
      0087F3 02 90                 1672         .word      LINK
                           000853  1673 LINK = . 
      0087F5 BF                    1674         .byte      4
      0087F6 24 90 93 90           1675         .ascii     "/MOD"
      000858                       1676 SLMOD:
      0087FA FE 90 B3         [ 4] 1677         CALL	OVER
      0087FD 24 2C 02         [ 4] 1678         CALL	ZLESS
      008800 EF 02 1C         [ 4] 1679         CALL	SWAPP
      008803 00 02 81         [ 2] 1680         JP	MSMOD
                                   1681 
                                   1682 ;       MOD     ( n n -- r )
                                   1683 ;       Signed divide. Return mod only.
      008806 87 EB                 1684         .word      LINK
                           000866  1685 LINK = . 
      008808 06                    1686         .byte      3
      008809 57 49 54              1687         .ascii     "MOD"
      00086A                       1688 MODD:
      00880C 48 49 4E         [ 4] 1689 	CALL	SLMOD
      00880F CC 04 6A         [ 2] 1690 	JP	DROP
                                   1691 
                                   1692 ;       /       ( n n -- q )
                                   1693 ;       Signed divide. Return quotient only.
      00880F CD 85                 1694         .word      LINK
                           000872  1695 LINK = . 
      008811 1E                    1696         .byte      1
      008812 CD                    1697         .ascii     "/"
      000874                       1698 SLASH:
      008813 87 4D CD         [ 4] 1699         CALL	SLMOD
      008816 84 BD CD         [ 4] 1700         CALL	SWAPP
      008819 87 4D CD         [ 2] 1701         JP	DROP
                                   1702 
                                   1703 ;; Multiply
                                   1704 
                                   1705 ;       UM*     ( u u -- ud )
                                   1706 ;       Unsigned multiply. Return double product.
      00881C 84 9E                 1707         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



                           00087F  1708 LINK = . 
      00881E CC                    1709         .byte      3
      00881F 87 94 88              1710         .ascii     "UM*"
      000883                       1711 UMSTA:	; stack have 4 bytes u1=a,b u2=c,d
                           000001  1712 .if  PICATOUT_MOD 
                                   1713 ; take advantage of SP addressing modes
                                   1714 ; these PRODx in RAM are not required
                                   1715 ; the product is kept on stack as local variable 
                                   1716         ;; bytes offset on data stack 
                           000002  1717         da=2 
                           000003  1718         db=3 
                           000000  1719         dc=0 
                           000001  1720         dd=1 
                                   1721         ;; product bytes offset on return stack 
                           000001  1722         UD1=1  ; ud bits 31..24
                           000002  1723         UD2=2  ; ud bits 23..16
                           000003  1724         UD3=3  ; ud bits 15..8 
                           000004  1725         UD4=4  ; ud bits 7..0 
                                   1726         ;; local variable for product set to zero   
      008822 08 06            [ 1] 1727         clrw y 
      008824 55 4D            [ 2] 1728         pushw y  ; bits 15..0
      008826 2F 4D            [ 2] 1729         pushw y  ; bits 31..16 
      008828 4F 44            [ 1] 1730         ld a,(db,x) ; b 
      00882A 90 97            [ 1] 1731         ld yl,a 
      00882A BF 22            [ 1] 1732         ld a,(dd,x)   ; d
      00882C FE BF            [ 4] 1733         mul y,a    ; b*d  
      00882E 24 90            [ 2] 1734         ldw (UD3,sp),y ; lowest weight product 
      008830 BE 22            [ 1] 1735         ld a,(db,x)
      008832 90 EE            [ 1] 1736         ld yl,a 
      008834 04 BE            [ 1] 1737         ld a,(dc,x)
      008836 22 EE            [ 4] 1738         mul y,a  ; b*c 
                                   1739         ;;; do the partial sum 
      008838 02 B3 24         [ 2] 1740         addw y,(UD2,sp)
      00883B 23               [ 1] 1741         clr a 
      00883C 0F               [ 1] 1742         rlc a
      00883D BE 22            [ 1] 1743         ld (UD1,sp),a 
      00883F 1C 00            [ 2] 1744         ldw (UD2,sp),y 
      008841 02 90            [ 1] 1745         ld a,(da,x)
      008843 AE FF            [ 1] 1746         ld yl,a 
      008845 FF FF            [ 1] 1747         ld a,(dd,x)
      008847 90 5F            [ 4] 1748         mul y,a   ; a*d 
                                   1749         ;; do partial sum 
      008849 EF 02 81         [ 2] 1750         addw y,(UD2,sp)
      00884C 4F               [ 1] 1751         clr a 
      00884C 5D 26            [ 1] 1752         adc a,(UD1,sp)
      00884E 11 93            [ 1] 1753         ld (UD1,sp),a  
      008850 90 BE            [ 2] 1754         ldw (UD2,sp),y 
      008852 24 65            [ 1] 1755         ld a,(da,x)
      008854 89 BE            [ 1] 1756         ld yl,a 
      008856 22 1C            [ 1] 1757         ld a,(dc,x)
      008858 00 02            [ 4] 1758         mul y,a  ;  a*c highest weight product 
                                   1759         ;;; do partial sum 
      00885A EF 02 90         [ 2] 1760         addw y,(UD1,sp)
      00885D 85               [ 2] 1761         ldw (x),y  ; udh 
      00885E FF 81            [ 2] 1762         ldw y,(UD3,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



      008860 EF 02            [ 2] 1763         ldw (2,x),y  ; udl  
      008860 A6 11            [ 2] 1764         addw sp,#4 ; drop local variable 
      008862 81               [ 4] 1765         ret  
                           000000  1766 .else
                                   1767 	LD A,(2,X)	; b
                                   1768 	LD YL,A
                                   1769 	LD A,(X)	; d
                                   1770 	MUL Y,A
                                   1771 	LDW PROD1,Y
                                   1772 	LD A,(3,X)	; a
                                   1773 	LD YL,A
                                   1774 	LD A,(X)	; d
                                   1775 	MUL Y,A
                                   1776 	LDW PROD2,Y
                                   1777 	LD A,(2,X)	; b
                                   1778 	LD YL,A
                                   1779 	LD A,(1,X)	; c
                                   1780 	MUL Y,A
                                   1781 	LDW PROD3,Y
                                   1782 	LD A,(3,X)	; a
                                   1783 	LD YL,A
                                   1784 	LD A,(1,X)	; c
                                   1785 	MUL Y,A	; least signifiant product
                                   1786 	CLR A
                                   1787 	RRWA Y
                                   1788 	LD (3,X),A	; store least significant byte
                                   1789 	ADDW Y,PROD3
                                   1790 	CLR A
                                   1791 	ADC A,#0	; save carry
                                   1792 	LD CARRY,A
                                   1793 	ADDW Y,PROD2
                                   1794 	LD A,CARRY
                                   1795 	ADC A,#0	; add 2nd carry
                                   1796 	LD CARRY,A
                                   1797 	CLR A
                                   1798 	RRWA Y
                                   1799 	LD (2,X),A	; 2nd product byte
                                   1800 	ADDW Y,PROD1
                                   1801 	RRWA Y
                                   1802 	LD (1,X),A	; 3rd product byte
                                   1803 	RRWA Y  	; 4th product byte now in A
                                   1804 	ADC A,CARRY	; fill in carry bits
                                   1805 	LD (X),A
                                   1806 	RET
                                   1807 .endif 
                                   1808 
                                   1809 
                                   1810 ;       *       ( n n -- n )
                                   1811 ;       Signed multiply. Return single product.
      008862 B3 24                 1812         .word      LINK
                           0008CB  1813 LINK = . 
      008864 25                    1814         .byte      1
      008865 04                    1815         .ascii     "*"
      0008CD                       1816 STAR:
      008866 72 B0 00         [ 4] 1817 	CALL	UMSTA
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



      008869 24 04 6A         [ 2] 1818 	JP	DROP
                                   1819 
                                   1820 ;       M*      ( n n -- d )
                                   1821 ;       Signed multiply. Return double product.
      00886A 08 CB                 1822         .word      LINK
                           0008D5  1823 LINK = . 
      00886A 8C                    1824         .byte      2
      00886B 90 59                 1825         .ascii     "M*"
      0008D8                       1826 MSTAR:      
      00886D 59 4A 22         [ 4] 1827         CALL	DDUP
      008870 F1 56 BF         [ 4] 1828         CALL	XORR
      008873 24 BE 22         [ 4] 1829         CALL	ZLESS
      008876 1C 00 02         [ 4] 1830         CALL	TOR
      008879 FF 90 BE         [ 4] 1831         CALL	ABSS
      00887C 24 EF 02         [ 4] 1832         CALL	SWAPP
      00887F 81 88 23         [ 4] 1833         CALL	ABSS
      008882 05 4D 2F         [ 4] 1834         CALL	UMSTA
      008885 4D 4F 44         [ 4] 1835         CALL	RFROM
      008888 CD 03 78         [ 4] 1836         CALL	QBRAN
      008888 CD 84                 1837         .word	MSTA1
      00888A F4 CD 85         [ 4] 1838         CALL	DNEGA
      00888D 2D               [ 4] 1839 MSTA1:	RET
                                   1840 
                                   1841 ;       . /MOD   ( n1 n2 n3 -- r q )
                                   1842 ;       Multiply n1 and n2, then divide
                                   1843 ;       by n3. Return mod and quotient.
      00888E CD 84                 1844         .word      LINK
                           0008FE  1845 LINK = . 
      008890 F4                    1846         .byte      5
      008891 CD 84 BD CD 83        1847         .ascii     "*/MOD"
      000904                       1848 SSMOD:
      008896 F8 88 A5         [ 4] 1849         CALL     TOR
      008899 CD 87 1A         [ 4] 1850         CALL     MSTAR
      00889C CD 84 BD         [ 4] 1851         CALL     RFROM
      00889F CD 87 2C         [ 2] 1852         JP     MSMOD
                                   1853 
                                   1854 ;       */      ( n1 n2 n3 -- q )
                                   1855 ;       Multiply n1 by n2, then divide
                                   1856 ;       by n3. Return quotient only.
      0088A2 CD 84                 1857         .word      LINK
                           000912  1858 LINK = . 
      0088A4 9E                    1859         .byte      2
      0088A5 CD 84                 1860         .ascii     "*/"
      000915                       1861 STASL:
      0088A7 BD CD 84         [ 4] 1862         CALL	SSMOD
      0088AA F4 CD 85         [ 4] 1863         CALL	SWAPP
      0088AD 2D CD 83         [ 2] 1864         JP	DROP
                                   1865 
                                   1866 ;; Miscellaneous
                                   1867 
                                   1868 ;       CELL+   ( a -- a )
                                   1869 ;       Add cell size in byte to address.
      0088B0 F8 88                 1870         .word      LINK
                           000920  1871 LINK = . 
      0088B2 B9                    1872         .byte       2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



      0088B3 CD 84                 1873         .ascii     "2+"
      000923                       1874 CELLP:
      0088B5 B1 CD            [ 1] 1875         LDW Y,X
      0088B7 86 EF            [ 2] 1876 	LDW Y,(Y)
      0088B9 CD 84 9E CD      [ 2] 1877         ADDW Y,#CELLL 
      0088BD 88               [ 2] 1878         LDW (X),Y
      0088BE 2A               [ 4] 1879         RET
                                   1880 
                                   1881 ;       CELL-   ( a -- a )
                                   1882 ;       Subtract 2 from address.
      0088BF CD 84                 1883         .word      LINK
                           00092F  1884 LINK = . 
      0088C1 9E                    1885         .byte       2
      0088C2 CD 83                 1886         .ascii     "2-"
      000932                       1887 CELLM:
      0088C4 F8 88            [ 1] 1888         LDW Y,X
      0088C6 D0 CD            [ 2] 1889 	LDW Y,(Y)
      0088C8 85 04 CD 87      [ 2] 1890         SUBW Y,#CELLL
      0088CC 1A               [ 2] 1891         LDW (X),Y
      0088CD CD               [ 4] 1892         RET
                                   1893 
                                   1894 ;       CELLS   ( n -- n )
                                   1895 ;       Multiply tos by 2.
      0088CE 85 04                 1896         .word      LINK
                           00093E  1897 LINK = . 
      0088D0 81                    1898         .byte       2
      0088D1 88 82                 1899         .ascii     "2*"
      000941                       1900 CELLS:
      0088D3 04 2F            [ 1] 1901         LDW Y,X
      0088D5 4D 4F            [ 2] 1902 	LDW Y,(Y)
      0088D7 44 58            [ 2] 1903         SLAW Y
      0088D8 FF               [ 2] 1904         LDW (X),Y
      0088D8 CD               [ 4] 1905         RET
                                   1906 
                                   1907 ;       1+      ( a -- a )
                                   1908 ;       Add cell size in byte to address.
      0088D9 85 1E                 1909         .word      LINK
                           00094B  1910 LINK = . 
      0088DB CD                    1911         .byte      2
      0088DC 85 2D                 1912         .ascii     "1+"
      00094E                       1913 ONEP:
      0088DE CD 85            [ 1] 1914         LDW Y,X
      0088E0 04 CC            [ 2] 1915 	LDW Y,(Y)
      0088E2 88 88            [ 2] 1916         INCW Y
      0088E4 88               [ 2] 1917         LDW (X),Y
      0088E5 D3               [ 4] 1918         RET
                                   1919 
                                   1920 ;       1-      ( a -- a )
                                   1921 ;       Subtract 2 from address.
      0088E6 03 4D                 1922         .word      LINK
                           000958  1923 LINK = . 
      0088E8 4F                    1924         .byte      2
      0088E9 44 2D                 1925         .ascii     "1-"
      0088EA                       1926 ONEM:
      0088EA CD 88            [ 1] 1927         LDW Y,X
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



      0088EC D8 CC            [ 2] 1928 	LDW Y,(Y)
      0088EE 84 EA            [ 2] 1929         DECW Y
      0088F0 88               [ 2] 1930         LDW (X),Y
      0088F1 E6               [ 4] 1931         RET
                                   1932 
                                   1933 ;  shift left n times 
                                   1934 ; LSHIFT ( n1 n2 -- n1<<n2 )
      0088F2 01 2F                 1935         .word LINK 
                           000965  1936         LINK=.
      0088F4 06                    1937         .byte 6 
      0088F4 CD 88 D8 CD 85 04     1938         .ascii "LSHIFT"
      00096C                       1939 LSHIFT:
      0088FA CC 84            [ 1] 1940         ld a,(1,x)
      0088FC EA 88 F2         [ 2] 1941         addw x,#CELLL 
      0088FF 03 55            [ 1] 1942         ldw y,x 
      008901 4D 2A            [ 2] 1943         ldw y,(y)
      008903                       1944 LSHIFT1:
      008903 90               [ 1] 1945         tnz a 
      008904 5F 90            [ 1] 1946         jreq LSHIFT4 
      008906 89 90            [ 2] 1947         sllw y 
      008908 89               [ 1] 1948         dec a 
      008909 E6 03            [ 2] 1949         jra LSHIFT1 
      00097D                       1950 LSHIFT4:
      00890B 90               [ 2] 1951         ldw (x),y 
      00890C 97               [ 4] 1952         ret 
                                   1953 
                                   1954 ; shift right n times                 
                                   1955 ; RSHIFT (n1 n2 -- n1>>n2 )
      00890D E6 01                 1956         .word LINK 
                           000981  1957         LINK=.
      00890F 90                    1958         .byte 6
      008910 42 17 03 E6 03 90     1959         .ascii "RSHIFT"
      000988                       1960 RSHIFT:
      008916 97 E6            [ 1] 1961         ld a,(1,x)
      008918 00 90 42         [ 2] 1962         addw x,#CELLL 
      00891B 72 F9            [ 1] 1963         ldw y,x 
      00891D 02 4F            [ 2] 1964         ldw y,(y)
      000991                       1965 RSHIFT1:
      00891F 49               [ 1] 1966         tnz a 
      008920 6B 01            [ 1] 1967         jreq RSHIFT4 
      008922 17 02            [ 2] 1968         srlw y 
      008924 E6               [ 1] 1969         dec a 
      008925 02 90            [ 2] 1970         jra RSHIFT1 
      000999                       1971 RSHIFT4:
      008927 97               [ 2] 1972         ldw (x),y 
      008928 E6               [ 4] 1973         ret 
                                   1974 
                                   1975 
                                   1976 ;       2/      ( n -- n )
                                   1977 ;       divide  tos by 2.
      008929 01 90                 1978         .word      LINK
                           00099D  1979 LINK = . 
      00892B 42                    1980         .byte      2
      00892C 72 F9                 1981         .ascii     "2/"
      0009A0                       1982 TWOSL:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



      00892E 02 4F            [ 1] 1983         LDW Y,X
      008930 19 01            [ 2] 1984 	LDW Y,(Y)
      008932 6B 01            [ 2] 1985         SRAW Y
      008934 17               [ 2] 1986         LDW (X),Y
      008935 02               [ 4] 1987         RET
                                   1988 
                                   1989 ;       BL      ( -- 32 )
                                   1990 ;       Return 32,  blank character.
      008936 E6 02                 1991         .word      LINK
                           0009AA  1992 LINK = . 
      008938 90                    1993         .byte      2
      008939 97 E6                 1994         .ascii     "BL"
      0009AD                       1995 BLANK:
      00893B 00 90 42         [ 2] 1996         SUBW X,#2
      00893E 72 F9 01 FF      [ 2] 1997 	LDW Y,#32
      008942 16               [ 2] 1998         LDW (X),Y
      008943 03               [ 4] 1999         RET
                                   2000 
                                   2001 ;         0     ( -- 0)
                                   2002 ;         Return 0.
      008944 EF 02                 2003         .word      LINK
                           0009B8  2004 LINK = . 
      008946 5B                    2005         .byte       1
      008947 04                    2006         .ascii     "0"
      0009BA                       2007 ZERO:
      008948 81 88 FF         [ 2] 2008         SUBW X,#2
      00894B 01 2A            [ 1] 2009 	CLRW Y
      00894D FF               [ 2] 2010         LDW (X),Y
      00894D CD               [ 4] 2011         RET
                                   2012 
                                   2013 ;         1     ( -- 1)
                                   2014 ;         Return 1.
      00894E 89 03                 2015         .word      LINK
                           0009C3  2016 LINK = . 
      008950 CC                    2017         .byte       1
      008951 84                    2018         .ascii     "1"
      0009C5                       2019 ONE:
      008952 EA 89 4B         [ 2] 2020         SUBW X,#2
      008955 02 4D 2A 01      [ 2] 2021 	LDW Y,#1
      008958 FF               [ 2] 2022         LDW (X),Y
      008958 CD               [ 4] 2023         RET
                                   2024 
                                   2025 ;         -1    ( -- -1)
                                   2026 ;         Return 32,  blank character.
      008959 86 DA                 2027         .word      LINK
                           0009D0  2028 LINK = . 
      00895B CD                    2029         .byte       2
      00895C 85 69                 2030         .ascii     "-1"
      0009D3                       2031 MONE:
      00895E CD 85 2D         [ 2] 2032         SUBW X,#2
      008961 CD 84 BD CD      [ 2] 2033 	LDW Y,#0xFFFF
      008965 87               [ 2] 2034         LDW (X),Y
      008966 67               [ 4] 2035         RET
                                   2036 
                                   2037 ;       >CHAR   ( c -- c )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



                                   2038 ;       Filter non-printing characters.
      008967 CD 85                 2039         .word      LINK
                           0009DE  2040 LINK = . 
      008969 04                    2041         .byte      5
      00896A CD 87 67 CD 89        2042         .ascii     ">CHAR"
      0009E4                       2043 TCHAR:
                           000001  2044 .if CONVERT_TO_CODE
      00896F 03 CD            [ 1] 2045         ld a,(1,x)
      008971 84 9E            [ 1] 2046         cp a,#32  
      008973 CD 83            [ 1] 2047         jrmi 1$ 
      008975 F8 89            [ 1] 2048         cp a,#127 
      008977 7B CD            [ 1] 2049         jrpl 1$ 
      008979 87               [ 4] 2050         ret 
      00897A 2C 81            [ 1] 2051 1$:     ld a,#'_ 
      00897C 89 55            [ 1] 2052         ld (1,x),a 
      00897E 05               [ 4] 2053         ret 
                           000000  2054 .else
                                   2055         CALL     DOLIT
                                   2056         .word       0x7F
                                   2057         CALL     ANDD
                                   2058         CALL     DUPP    ;mask msb
                                   2059         CALL     DOLIT
                                   2060         .word      127
                                   2061         CALL     BLANK
                                   2062         CALL     WITHI   ;check for printable
                                   2063         CALL     QBRAN
                                   2064         .word    TCHA1
                                   2065         CALL     DROP
                                   2066         CALL     DOLIT
                                   2067         .word     0x5F		; "_"     ;replace non-printables
                                   2068 .endif 
      00897F 2A               [ 4] 2069 TCHA1:  RET
                                   2070 
                                   2071 ;       DEPTH   ( -- n )
                                   2072 ;       Return  depth of  data stack.
      008980 2F 4D                 2073         .word      LINK
                           0009F7  2074 LINK = . 
      008982 4F                    2075         .byte      5
      008983 44 45 50 54 48        2076         .ascii     "DEPTH"
      008984                       2077 DEPTH: 
      008984 CD 84 BD         [ 2] 2078         LDW Y,SP0    ;save data stack ptr
      008987 CD 89            [ 2] 2079 	LDW XTEMP,X
      008989 58 CD 84 9E      [ 2] 2080         SUBW Y,XTEMP     ;#bytes = SP0 - X
      00898D CC 88            [ 2] 2081         SRAW Y    ;Y = #stack items
                           000001  2082 .if PICATOUT_MOD
                                   2083 ; why ? 
                                   2084 ;      	DECW Y
                                   2085 .endif 
      00898F 88 89 7E         [ 2] 2086 	SUBW X,#2
      008992 02               [ 2] 2087         LDW (X),Y     ; if neg, underflow
      008993 2A               [ 4] 2088         RET
                                   2089 
                                   2090 ;       PICK    ( ... +n -- ... w )
                                   2091 ;       Copy  nth stack item to tos.
      008994 2F F7                 2092         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



                           000A0F  2093 LINK = . 
      008995 04                    2094         .byte      4
      008995 CD 89 84 CD           2095         .ascii     "PICK"
      000A14                       2096 PICK:
      008999 85 04            [ 1] 2097         LDW Y,X   ;D = n1
      00899B CC 84            [ 2] 2098         LDW Y,(Y)
                           000001  2099 .if PICATOUT_MOD
                                   2100 ; modified for standard compliance          
                                   2101 ; 0 PICK must be equivalent to DUP 
      00899D EA 89            [ 2] 2102         INCW Y 
                                   2103 .endif         
      00899F 92 02            [ 2] 2104         SLAW Y
      0089A1 32 2B            [ 2] 2105         LDW XTEMP,X
      0089A3 72 B9 00 22      [ 2] 2106         ADDW Y,XTEMP
      0089A3 90 93            [ 2] 2107         LDW Y,(Y)
      0089A5 90               [ 2] 2108         LDW (X),Y
      0089A6 FE               [ 4] 2109         RET
                                   2110 
                                   2111 ;; Memory access
                                   2112 
                                   2113 ;       +!      ( n a -- )
                                   2114 ;       Add n to  contents at address a.
      0089A7 72 A9                 2115         .word      LINK
                           000A28  2116 LINK = . 
      0089A9 00                    2117         .byte      2
      0089AA 02 FF                 2118         .ascii     "+!"
      000A2B                       2119 PSTOR:
                           000001  2120 .if CONVERT_TO_CODE
      0089AC 81 89            [ 1] 2121         ldw y,x 
      0089AE A0 02            [ 2] 2122         ldw y,(y)
      0089B0 32 2D 24         [ 2] 2123         ldw YTEMP,y  ; address
      0089B2 90 FE            [ 2] 2124         ldw y,(y)  
      0089B2 90 93            [ 2] 2125         pushw y  ; value at address 
      0089B4 90 FE            [ 1] 2126         ldw y,x 
      0089B6 72 A2 00         [ 2] 2127         ldw y,(2,y) ; n 
      0089B9 02 FF 81         [ 2] 2128         addw y,(1,sp) ; n+value
      0089BC 89 AF 02         [ 5] 2129         ldw [YTEMP],y ;  a!
      0089BF 32 2A            [ 2] 2130         popw y    ;drop local var
      0089C1 1C 00 04         [ 2] 2131         addw x,#4 ; DDROP 
      0089C1 90               [ 4] 2132         ret 
                           000000  2133 .else
                                   2134         CALL	SWAPP
                                   2135         CALL	OVER
                                   2136         CALL	AT
                                   2137         CALL	PLUS
                                   2138         CALL	SWAPP
                                   2139         JP	STORE
                                   2140 .endif 
                                   2141 
                                   2142 ;       2!      ( d a -- )
                                   2143 ;       Store  double integer to address a.
      0089C2 93 90                 2144         .word      LINK
                           000A49  2145 LINK = . 
      0089C4 FE                    2146         .byte      2
      0089C5 90 58                 2147         .ascii     "2!"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



      000A4C                       2148 DSTOR:
                           000001  2149 .if CONVERT_TO_CODE
      0089C7 FF 81            [ 1] 2150         ldw y,x 
      0089C9 89 BE            [ 2] 2151         ldw y,(y)
      0089CB 02 31 2B         [ 2] 2152         ldw YTEMP,y ; address 
      0089CE 1C 00 02         [ 2] 2153         addw x,#CELLL ; drop a 
      0089CE 90 93            [ 1] 2154         ldw y,x 
      0089D0 90 FE            [ 2] 2155         ldw y,(y) ; hi word 
      0089D2 90               [ 2] 2156         pushw x 
      0089D3 5C FF            [ 2] 2157         ldw x,(2,x) ; lo word 
      0089D5 81 89 CB         [ 5] 2158         ldw [YTEMP],y
      0089D8 02 31            [ 1] 2159         ldw y,x 
      0089DA 2D 00 02         [ 2] 2160         ldw x,#2 
      0089DB 92 DF 24         [ 5] 2161         ldw ([YTEMP],x),y 
      0089DB 90               [ 2] 2162         popw x 
      0089DC 93 90 FE         [ 2] 2163         addw x,#4 ; DDROP 
      0089DF 90               [ 4] 2164         ret 
                           000000  2165 .else
                                   2166         CALL	SWAPP
                                   2167         CALL	OVER
                                   2168         CALL	STORE
                                   2169         CALL	CELLP
                                   2170         JP	STORE
                                   2171 .endif 
                                   2172 ;       2@      ( a -- d )
                                   2173 ;       Fetch double integer from address a.
      0089E0 5A FF                 2174         .word      LINK
                           000A6F  2175 LINK = . 
      0089E2 81                    2176         .byte      2
      0089E3 89 D8                 2177         .ascii     "2@"
      000A72                       2178 DAT:
                           000001  2179 .if CONVERT_TO_CODE
      0089E5 06 4C            [ 1] 2180         ldw y,x 
      0089E7 53 48            [ 2] 2181         ldw y,(y) ;address 
      0089E9 49 46 54         [ 2] 2182         ldw YTEMP,y 
      0089EC 1D 00 02         [ 2] 2183         subw x,#CELLL ; space for udh 
      0089EC E6 01 1C         [ 5] 2184         ldw y,[YTEMP] ; udh 
      0089EF 00               [ 2] 2185         ldw (x),y 
      0089F0 02 90 93 90      [ 2] 2186         ldw y,#2
      0089F4 FE DE 24         [ 5] 2187         ldw y,([YTEMP],y) ; udl 
      0089F5 EF 02            [ 2] 2188         ldw (2,x),y
      0089F5 4D               [ 4] 2189         ret 
                           000000  2190 .else 
                                   2191         CALL	DUPP
                                   2192         CALL	CELLP
                                   2193         CALL	AT
                                   2194         CALL	SWAPP
                                   2195         JP	AT
                                   2196 .endif 
                                   2197 
                                   2198 ;       COUNT   ( b -- b +n )
                                   2199 ;       Return count byte of a string
                                   2200 ;       and add 1 to byte address.
      0089F6 27 05                 2201         .word      LINK
                           000A8C  2202 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



      0089F8 90                    2203         .byte      5
      0089F9 58 4A 20 F8 54        2204         .ascii     "COUNT"
      0089FD                       2205 COUNT:
                           000001  2206 .if CONVERT_TO_CODE
      0089FD FF 81            [ 1] 2207         ldw y,x 
      0089FF 89 E5            [ 2] 2208         ldw y,(y) ; address 
      008A01 06 52            [ 1] 2209         ld a,(y)  ; count 
      008A03 53 48            [ 2] 2210         incw y 
      008A05 49               [ 2] 2211         ldw (x),y 
      008A06 46 54 02         [ 2] 2212         subw x,#CELLL 
      008A08 E7 01            [ 1] 2213         ld (1,x),a 
      008A08 E6               [ 1] 2214         clr (x)
      008A09 01               [ 4] 2215         ret 
                           000000  2216 .else 
                                   2217         CALL     DUPP
                                   2218         CALL     ONEP
                                   2219         CALL     SWAPP
                                   2220         JP     CAT
                                   2221 .endif 
                                   2222 
                                   2223 ;       HERE    ( -- a )
                                   2224 ;       Return  top of  variables
      008A0A 1C 00                 2225         .word      LINK
                           000AA4  2226 LINK = . 
      008A0C 02                    2227         .byte      4
      008A0D 90 93 90 FE           2228         .ascii     "HERE"
      008A11                       2229 HERE:
                           000001  2230 .if CONVERT_TO_CODE
      008A11 4D 27 05 90      [ 2] 2231       	ldw y,#UVP 
      008A15 54 4A            [ 2] 2232         ldw y,(y)
      008A17 20 F8 02         [ 2] 2233         subw x,#CELLL 
      008A19 FF               [ 2] 2234         ldw (x),y 
      008A19 FF               [ 4] 2235         ret 
                           000000  2236 .else
                                   2237         CALL     VPP
                                   2238         JP     AT
                                   2239 .endif 
                                   2240 
                                   2241 ;       PAD     ( -- a )
                                   2242 ;       Return address of text buffer
                                   2243 ;       above  code dictionary.
      008A1A 81 8A                 2244         .word      LINK
                           000AB6  2245 LINK = . 
      008A1C 01                    2246         .byte      3
      008A1D 02 32 2F              2247         .ascii     "PAD"
      008A20                       2248 PAD:
      008A20 90 93 90         [ 4] 2249         CALL     HERE
      008A23 FE 90 57         [ 4] 2250         CALL     DOLIT
      008A26 FF 81                 2251         .word      80
      008A28 8A 1D 02         [ 2] 2252         JP     PLUS
                                   2253 
                                   2254 ;       TIB     ( -- a )
                                   2255 ;       Return address of terminal input buffer.
      008A2B 42 4C                 2256         .word      LINK
                           000AC7  2257 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



      008A2D 03                    2258         .byte      3
      008A2D 1D 00 02              2259         .ascii     "TIB"
      000ACB                       2260 TIB:
      008A30 90 AE 00         [ 4] 2261         CALL     NTIB
      008A33 20 FF 81         [ 4] 2262         CALL     CELLP
      008A36 8A 2A 01         [ 2] 2263         JP     AT
                                   2264 
                                   2265 ;       @EXECUTE        ( a -- )
                                   2266 ;       Execute vector stored in address a.
      008A39 30 C7                 2267         .word      LINK
                           000AD6  2268 LINK = . 
      008A3A 08                    2269         .byte      8
      008A3A 1D 00 02 90 5F FF 81  2270         .ascii     "@EXECUTE"
             8A
      000ADF                       2271 ATEXE:
      008A42 38 01 31         [ 4] 2272         CALL     AT
      008A45 CD 06 1E         [ 4] 2273         CALL     QDUP    ;?address or zero
      008A45 1D 00 02         [ 4] 2274         CALL     QBRAN
      008A48 90 AE                 2275         .word      EXE1
      008A4A 00 01 FF         [ 4] 2276         CALL     EXECU   ;execute if non-zero
      008A4D 81               [ 4] 2277 EXE1:   RET     ;do nothing if zero
                                   2278 
                                   2279 ;       CMOVE   ( b1 b2 u -- )
                                   2280 ;       Copy u bytes from b1 to b2.
      008A4E 8A 43                 2281         .word      LINK
                           000AF0  2282 LINK = . 
      008A50 02                    2283         .byte      5
      008A51 2D 31 4F 56 45        2284         .ascii     "CMOVE"
      008A53                       2285 CMOVE:
      008A53 1D 00 02         [ 4] 2286         CALL	TOR
      008A56 90 AE FF         [ 4] 2287         CALL	BRAN
      008A59 FF FF                 2288         .word	CMOV2
      008A5B 81 8A 50         [ 4] 2289 CMOV1:	CALL	TOR
      008A5E 05 3E 43         [ 4] 2290         CALL	DUPP
      008A61 48 41 52         [ 4] 2291         CALL	CAT
      008A64 CD 04 31         [ 4] 2292         CALL	RAT
      008A64 E6 01 A1         [ 4] 2293         CALL	CSTOR
      008A67 20 2B 05         [ 4] 2294         CALL	ONEP
      008A6A A1 7F 2A         [ 4] 2295         CALL	RFROM
      008A6D 01 81 A6         [ 4] 2296         CALL	ONEP
      008A70 5F E7 01         [ 4] 2297 CMOV2:	CALL	DONXT
      008A73 81 81                 2298         .word	CMOV1
      008A75 8A 5E 05         [ 2] 2299         JP	DDROP
                                   2300 
                                   2301 ;       FILL    ( b u c -- )
                                   2302 ;       Fill u bytes of character c
                                   2303 ;       to area beginning at b.
      008A78 44 45                 2304         .word       LINK
                           000B20  2305 LINK = . 
      008A7A 50                    2306         .byte       4
      008A7B 54 48 4C 4C           2307         .ascii     "FILL"
      008A7D                       2308 FILL:
                           000001  2309 .if CONVERT_TO_CODE
      008A7D 90 BE            [ 1] 2310         ldw y,x 
      008A7F 2A BF 22         [ 1] 2311         ld a,(1,y) ; c 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



      008A82 72 B2 00         [ 2] 2312         addw x,#CELLL ; drop c 
      008A85 22 90            [ 1] 2313         ldw y,x 
      008A87 57 1D            [ 2] 2314         ldw y,(y) ; count
      008A89 00 02            [ 2] 2315         pushw y 
      008A8B FF 81 8A         [ 2] 2316         addw x,#CELLL ; drop u 
      008A8E 77 04            [ 1] 2317         ldw y,x 
      008A90 50 49 43         [ 2] 2318         addw x,#CELLL ; drop b 
      008A93 4B FE            [ 2] 2319         ldw y,(y) ; address
      008A94 90 BF 24         [ 2] 2320         ldw YTEMP,y
      008A94 90 93            [ 2] 2321         popw y ; count 
      000B42                       2322 FILL1:  
      008A96 90 FE 90         [ 4] 2323         ld [YTEMP],a 
      008A99 5C 90            [ 1] 2324         inc YTEMP+1
      008A9B 58 BF            [ 1] 2325         jrnc FILL2 
      008A9D 22 72            [ 1] 2326         inc YTEMP
      000B4B                       2327 FILL2: 
      008A9F B9 00            [ 2] 2328         decw y ; count 
      008AA1 22 90            [ 1] 2329         jrne FILL1  
      008AA3 FE               [ 4] 2330         ret 
                           000000  2331 .else 
                                   2332         CALL	SWAPP
                                   2333         CALL	TOR
                                   2334         CALL	SWAPP
                                   2335         CALL	BRAN
                                   2336         .word	FILL2
                                   2337 FILL1:	CALL	DDUP
                                   2338         CALL	CSTOR
                                   2339         CALL	ONEP
                                   2340 FILL2:	CALL	DONXT
                                   2341         .word	FILL1
                                   2342         JP	DDROP
                                   2343 .endif
                                   2344 
                                   2345 ;       ERASE   ( b u -- )
                                   2346 ;       Erase u bytes beginning at b.
      008AA4 FF 81                 2347         .word      LINK
                           000B52  2348 LINK = . 
      008AA6 8A                    2349         .byte      5
      008AA7 8F 02 2B 21 45        2350         .ascii     "ERASE"
      008AAB                       2351 ERASE:
                           000001  2352 .if CONVERT_TO_CODE
      008AAB 90 93            [ 1] 2353         clrw y 
      008AAD 90 FE 90         [ 2] 2354         subw x,#CELLL 
      008AB0 BF               [ 2] 2355         ldw (x),y 
      008AB1 24 90 FE         [ 2] 2356         jp FILL 
                           000000  2357 .else 
                                   2358         CALL     ZERO
                                   2359         JP     FILL
                                   2360 .endif 
                                   2361 ;       PACK0x   ( b u a -- a )
                                   2362 ;       Build a counted string with
                                   2363 ;       u characters from b. Null fill.
      008AB4 90 89                 2364         .word      LINK
                           000B63  2365 LINK = . 
      008AB6 90                    2366         .byte      5
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



      008AB7 93 90 EE 02 72 F9     2367         .ascii     "PACK0X"
      000B6A                       2368 PACKS:
      008ABD 01 91 CF         [ 4] 2369         CALL     DUPP
      008AC0 24 90 85         [ 4] 2370         CALL     TOR     ;strings only on cell boundary
      008AC3 1C 00 04         [ 4] 2371         CALL     DDUP
      008AC6 81 8A A8         [ 4] 2372         CALL     CSTOR
      008AC9 02 32 21         [ 4] 2373         CALL     ONEP ;save count
      008ACC CD 04 84         [ 4] 2374         CALL     SWAPP
      008ACC 90 93 90         [ 4] 2375         CALL     CMOVE
      008ACF FE 90 BF         [ 4] 2376         CALL     RFROM
      008AD2 24               [ 4] 2377         RET
                                   2378 
                                   2379 ;; Numeric output, single precision
                                   2380 
                                   2381 ;       DIGIT   ( u -- c )
                                   2382 ;       Convert digit u to a character.
      008AD3 1C 00                 2383         .word      LINK
                           000B85  2384 LINK = . 
      008AD5 02                    2385         .byte      5
      008AD6 90 93 90 FE 89        2386         .ascii     "DIGIT"
      000B8B                       2387 DIGIT:
      008ADB EE 02 91         [ 4] 2388         CALL	DOLIT
      008ADE CF 24                 2389         .word	9
      008AE0 90 93 AE         [ 4] 2390         CALL	OVER
      008AE3 00 02 92         [ 4] 2391         CALL	LESS
      008AE6 DF 24 85         [ 4] 2392         CALL	DOLIT
      008AE9 1C 00                 2393         .word	7
      008AEB 04 81 8A         [ 4] 2394         CALL	ANDD
      008AEE C9 02 32         [ 4] 2395         CALL	PLUS
      008AF1 40 03 45         [ 4] 2396         CALL	DOLIT
      008AF2 00 30                 2397         .word	48	;'0'
      008AF2 90 93 90         [ 2] 2398         JP	PLUS
                                   2399 
                                   2400 ;       EXTRACT ( n base -- n c )
                                   2401 ;       Extract least significant digit from n.
      008AF5 FE 90                 2402         .word      LINK
                           000BAB  2403 LINK = . 
      008AF7 BF                    2404         .byte      7
      008AF8 24 1D 00 02 91 CE 24  2405         .ascii     "EXTRACT"
      000BB3                       2406 EXTRC:
      008AFF FF 90 AE         [ 4] 2407         CALL     ZERO
      008B02 00 02 91         [ 4] 2408         CALL     SWAPP
      008B05 DE 24 EF         [ 4] 2409         CALL     UMMOD
      008B08 02 81 8A         [ 4] 2410         CALL     SWAPP
      008B0B EF 05 43         [ 2] 2411         JP     DIGIT
                                   2412 
                                   2413 ;       <#      ( -- )
                                   2414 ;       Initiate  numeric output process.
      008B0E 4F 55                 2415         .word      LINK
                           000BC4  2416 LINK = . 
      008B10 4E                    2417         .byte      2
      008B11 54 23                 2418         .ascii     "<#"
      008B12                       2419 BDIGS:
      008B12 90 93 90         [ 4] 2420         CALL     PAD
      008B15 FE 90 F6         [ 4] 2421         CALL     HLD
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      008B18 90 5C FF         [ 2] 2422         JP     STORE
                                   2423 
                                   2424 ;       HOLD    ( c -- )
                                   2425 ;       Insert a character into output string.
      008B1B 1D 00                 2426         .word      LINK
                           000BD2  2427 LINK = . 
      008B1D 02                    2428         .byte      4
      008B1E E7 01 7F 81           2429         .ascii     "HOLD"
      000BD7                       2430 HOLD:
      008B22 8B 0C 04         [ 4] 2431         CALL     HLD
      008B25 48 45 52         [ 4] 2432         CALL     AT
      008B28 45 09 5B         [ 4] 2433         CALL     ONEM
      008B29 CD 04 74         [ 4] 2434         CALL     DUPP
      008B29 90 AE 00         [ 4] 2435         CALL     HLD
      008B2C 16 90 FE         [ 4] 2436         CALL     STORE
      008B2F 1D 00 02         [ 2] 2437         JP     CSTOR
                                   2438 
                                   2439 ;       #       ( u -- u )
                                   2440 ;       Extract one digit from u and
                                   2441 ;       append digit to output string.
      008B32 FF 81                 2442         .word      LINK
                           000BEE  2443 LINK = . 
      008B34 8B                    2444         .byte      1
      008B35 24                    2445         .ascii     "#"
      000BF0                       2446 DIG:
      008B36 03 50 41         [ 4] 2447         CALL     BASE
      008B39 44 03 CD         [ 4] 2448         CALL     AT
      008B3A CD 0B B3         [ 4] 2449         CALL     EXTRC
      008B3A CD 8B 29         [ 2] 2450         JP     HOLD
                                   2451 
                                   2452 ;       #S      ( u -- 0 )
                                   2453 ;       Convert u until all digits
                                   2454 ;       are added to output string.
      008B3D CD 83                 2455         .word      LINK
                           000BFE  2456 LINK = . 
      008B3F C5                    2457         .byte      2
      008B40 00 50                 2458         .ascii     "#S"
      000C01                       2459 DIGS:
      008B42 CC 86 EF         [ 4] 2460 DIGS1:  CALL     DIG
      008B45 8B 36 03         [ 4] 2461         CALL     DUPP
      008B48 54 49 42         [ 4] 2462         CALL     QBRAN
      008B4B 0C 0E                 2463         .word      DIGS2
      008B4B CD 85            [ 2] 2464         JRA     DIGS1
      008B4D DF               [ 4] 2465 DIGS2:  RET
                                   2466 
                                   2467 ;       SIGN    ( n -- )
                                   2468 ;       Add a minus sign to
                                   2469 ;       numeric output string.
      008B4E CD 89                 2470         .word      LINK
                           000C11  2471 LINK = . 
      008B50 A3                    2472         .byte      4
      008B51 CC 84 4D 8B           2473         .ascii     "SIGN"
      000C16                       2474 SIGN:
      008B55 47 08 40         [ 4] 2475         CALL     ZLESS
      008B58 45 58 45         [ 4] 2476         CALL     QBRAN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      008B5B 43 55                 2477         .word      SIGN1
      008B5D 54 45 45         [ 4] 2478         CALL     DOLIT
      008B5F 00 2D                 2479         .word      45	;"-"
      008B5F CD 84 4D         [ 2] 2480         JP     HOLD
      008B62 CD               [ 4] 2481 SIGN1:  RET
                                   2482 
                                   2483 ;       #>      ( w -- b u )
                                   2484 ;       Prepare output string.
      008B63 86 9E                 2485         .word      LINK
                           000C29  2486 LINK = . 
      008B65 CD                    2487         .byte      2
      008B66 83 F8                 2488         .ascii     "#>"
      000C2C                       2489 EDIGS:
      008B68 8B 6D CD         [ 4] 2490         CALL     DROP
      008B6B 84 1F 81         [ 4] 2491         CALL     HLD
      008B6E 8B 56 05         [ 4] 2492         CALL     AT
      008B71 43 4D 4F         [ 4] 2493         CALL     PAD
      008B74 56 45 9E         [ 4] 2494         CALL     OVER
      008B76 CC 06 CD         [ 2] 2495         JP     SUBB
                                   2496 
                                   2497 ;       str     ( w -- b u )
                                   2498 ;       Convert a signed integer
                                   2499 ;       to a numeric string.
      008B76 CD 84                 2500         .word      LINK
                           000C40  2501 LINK = . 
      008B78 BD                    2502         .byte      3
      008B79 CD 84 0F              2503         .ascii     "STR"
      000C44                       2504 STR:
      008B7C 8B 96 CD         [ 4] 2505         CALL     DUPP
      008B7F 84 BD CD         [ 4] 2506         CALL     TOR
      008B82 84 F4 CD         [ 4] 2507         CALL     ABSS
      008B85 84 6B CD         [ 4] 2508         CALL     BDIGS
      008B88 84 B1 CD         [ 4] 2509         CALL     DIGS
      008B8B 84 5A CD         [ 4] 2510         CALL     RFROM
      008B8E 89 CE CD         [ 4] 2511         CALL     SIGN
      008B91 84 9E CD         [ 2] 2512         JP     EDIGS
                                   2513 
                                   2514 ;       HEX     ( -- )
                                   2515 ;       Use radix 16 as base for
                                   2516 ;       numeric conversions.
      008B94 89 CE                 2517         .word      LINK
                           000C5E  2518 LINK = . 
      008B96 CD                    2519         .byte      3
      008B97 83 D9 8B              2520         .ascii     "HEX"
      000C62                       2521 HEX:
      008B9A 7E CC 86         [ 4] 2522         CALL     DOLIT
      008B9D CF 8B                 2523         .word      16
      008B9F 70 04 46         [ 4] 2524         CALL     BASE
      008BA2 49 4C 4C         [ 2] 2525         JP     STORE
                                   2526 
                                   2527 ;       DECIMAL ( -- )
                                   2528 ;       Use radix 10 as base
                                   2529 ;       for numeric conversions.
      008BA5 0C 5E                 2530         .word      LINK
                           000C6F  2531 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



      008BA5 90                    2532         .byte      7
      008BA6 93 90 E6 01 1C 00 02  2533         .ascii     "DECIMAL"
      000C77                       2534 DECIM:
      008BAD 90 93 90         [ 4] 2535         CALL     DOLIT
      008BB0 FE 90                 2536         .word      10
      008BB2 89 1C 00         [ 4] 2537         CALL     BASE
      008BB5 02 90 93         [ 2] 2538         JP     STORE
                                   2539 
                                   2540 ;; Numeric input, single precision
                                   2541 
                                   2542 ;       DIGIT?  ( c base -- u t )
                                   2543 ;       Convert a character to its numeric
                                   2544 ;       value. A flag indicates success.
      008BB8 1C 00                 2545         .word      LINK
                           000C84  2546 LINK = . 
      008BBA 02                    2547         .byte       6
      008BBB 90 FE 90 BF 24 90     2548         .ascii     "DIGIT?"
      000C8B                       2549 DIGTQ:
      008BC1 85 04 3D         [ 4] 2550         CALL     TOR
      008BC2 CD 03 45         [ 4] 2551         CALL     DOLIT
      008BC2 92 C7                 2552         .word     48	; "0"
      008BC4 24 3C 25         [ 4] 2553         CALL     SUBB
      008BC7 24 02 3C         [ 4] 2554         CALL     DOLIT
      008BCA 24 09                 2555         .word      9
      008BCB CD 04 9E         [ 4] 2556         CALL     OVER
      008BCB 90 5A 26         [ 4] 2557         CALL     LESS
      008BCE F3 81 8B         [ 4] 2558         CALL     QBRAN
      008BD1 A0 05                 2559         .word      DGTQ1
      008BD3 45 52 41         [ 4] 2560         CALL     DOLIT
      008BD6 53 45                 2561         .word      7
      008BD8 CD 06 CD         [ 4] 2562         CALL     SUBB
      008BD8 90 5F 1D         [ 4] 2563         CALL     DUPP
      008BDB 00 02 FF         [ 4] 2564         CALL     DOLIT
      008BDE CC 8B                 2565         .word      10
      008BE0 A5 8B D2         [ 4] 2566         CALL     LESS
      008BE3 05 50 41         [ 4] 2567         CALL     ORR
      008BE6 43 4B 30         [ 4] 2568 DGTQ1:  CALL     DUPP
      008BE9 58 04 1E         [ 4] 2569         CALL     RFROM
      008BEA CC 07 14         [ 2] 2570         JP     ULESS
                                   2571 
                                   2572 ;       NUMBER? ( a -- n T | a F )
                                   2573 ;       Convert a number string to
                                   2574 ;       integer. Push a flag on tos.
      008BEA CD 84                 2575         .word      LINK
                           000CC7  2576 LINK = . 
      008BEC F4                    2577         .byte      7
      008BED CD 84 BD CD 86 DA CD  2578         .ascii     "NUMBER?"
      000CCF                       2579 NUMBQ:
      008BF4 84 5A CD         [ 4] 2580         CALL     BASE
      008BF7 89 CE CD         [ 4] 2581         CALL     AT
      008BFA 85 04 CD         [ 4] 2582         CALL     TOR
      008BFD 8B 76 CD         [ 4] 2583         CALL     ZERO
      008C00 84 9E 81         [ 4] 2584         CALL     OVER
      008C03 8B E3 05         [ 4] 2585         CALL     COUNT
      008C06 44 49 47         [ 4] 2586         CALL     OVER
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      008C09 49 54 EB         [ 4] 2587         CALL     CAT
      008C0B CD 03 45         [ 4] 2588         CALL     DOLIT
      008C0B CD 83                 2589         .word     36	; "0x"
      008C0D C5 00 09         [ 4] 2590         CALL     EQUAL
      008C10 CD 85 1E         [ 4] 2591         CALL     QBRAN
      008C13 CD 87                 2592         .word      NUMQ1
      008C15 B2 CD 83         [ 4] 2593         CALL     HEX
      008C18 C5 00 07         [ 4] 2594         CALL     SWAPP
      008C1B CD 85 40         [ 4] 2595         CALL     ONEP
      008C1E CD 86 EF         [ 4] 2596         CALL     SWAPP
      008C21 CD 83 C5         [ 4] 2597         CALL     ONEM
      008C24 00 30 CC         [ 4] 2598 NUMQ1:  CALL     OVER
      008C27 86 EF 8C         [ 4] 2599         CALL     CAT
      008C2A 05 07 45         [ 4] 2600         CALL     DOLIT
      008C2D 58 54                 2601         .word     45	; "-"
      008C2F 52 41 43         [ 4] 2602         CALL     EQUAL
      008C32 54 04 3D         [ 4] 2603         CALL     TOR
      008C33 CD 04 84         [ 4] 2604         CALL     SWAPP
      008C33 CD 8A 3A         [ 4] 2605         CALL     RAT
      008C36 CD 85 04         [ 4] 2606         CALL     SUBB
      008C39 CD 88 2A         [ 4] 2607         CALL     SWAPP
      008C3C CD 85 04         [ 4] 2608         CALL     RAT
      008C3F CC 8C 0B         [ 4] 2609         CALL     PLUS
      008C42 8C 2B 02         [ 4] 2610         CALL     QDUP
      008C45 3C 23 78         [ 4] 2611         CALL     QBRAN
      008C47 0D 8D                 2612         .word      NUMQ6
      008C47 CD 8B 3A         [ 4] 2613         CALL     ONEM
      008C4A CD 86 21         [ 4] 2614         CALL     TOR
      008C4D CC 84 36         [ 4] 2615 NUMQ2:  CALL     DUPP
      008C50 8C 44 04         [ 4] 2616         CALL     TOR
      008C53 48 4F 4C         [ 4] 2617         CALL     CAT
      008C56 44 05 31         [ 4] 2618         CALL     BASE
      008C57 CD 03 CD         [ 4] 2619         CALL     AT
      008C57 CD 86 21         [ 4] 2620         CALL     DIGTQ
      008C5A CD 84 4D         [ 4] 2621         CALL     QBRAN
      008C5D CD 89                 2622         .word      NUMQ4
      008C5F DB CD 84         [ 4] 2623         CALL     SWAPP
      008C62 F4 CD 86         [ 4] 2624         CALL     BASE
      008C65 21 CD 84         [ 4] 2625         CALL     AT
      008C68 36 CC 84         [ 4] 2626         CALL     STAR
      008C6B 5A 8C 52         [ 4] 2627         CALL     PLUS
      008C6E 01 23 1E         [ 4] 2628         CALL     RFROM
      008C70 CD 09 4E         [ 4] 2629         CALL     ONEP
      008C70 CD 85 B1         [ 4] 2630         CALL     DONXT
      008C73 CD 84                 2631         .word      NUMQ2
      008C75 4D CD 8C         [ 4] 2632         CALL     RAT
      008C78 33 CC 8C         [ 4] 2633         CALL     SWAPP
      008C7B 57 8C 6E         [ 4] 2634         CALL     DROP
      008C7E 02 23 53         [ 4] 2635         CALL     QBRAN
      008C81 0D 76                 2636         .word      NUMQ3
      008C81 CD 8C 70         [ 4] 2637         CALL     NEGAT
      008C84 CD 84 F4         [ 4] 2638 NUMQ3:  CALL     SWAPP
      008C87 CD 83            [ 2] 2639         JRA     NUMQ5
      008C89 F8 8C 8E         [ 4] 2640 NUMQ4:  CALL     RFROM
      008C8C 20 F3 81         [ 4] 2641         CALL     RFROM
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



      008C8F 8C 7E 04         [ 4] 2642         CALL     DDROP
      008C92 53 49 47         [ 4] 2643         CALL     DDROP
      008C95 4E 09 BA         [ 4] 2644         CALL     ZERO
      008C96 CD 04 74         [ 4] 2645 NUMQ5:  CALL     DUPP
      008C96 CD 85 2D         [ 4] 2646 NUMQ6:  CALL     RFROM
      008C99 CD 83 F8         [ 4] 2647         CALL     DDROP
      008C9C 8C A6 CD         [ 4] 2648         CALL     RFROM
      008C9F 83 C5 00         [ 4] 2649         CALL     BASE
      008CA2 2D CC 8C         [ 2] 2650         JP     STORE
                                   2651 
                                   2652 ;; Basic I/O
                                   2653 
                                   2654 ;       KEY     ( -- c )
                                   2655 ;       Wait for and return an
                                   2656 ;       input character.
      008CA5 57 81                 2657         .word      LINK
                           000D9E  2658 LINK = . 
      008CA7 8C                    2659         .byte      3
      008CA8 91 02 23              2660         .ascii     "KEY"
      000DA2                       2661 KEY:
                           000001  2662 .if CONVERT_TO_CODE
      008CAB 3E 0B 52 30 FB   [ 2] 2663         btjf UART1_SR,#UART_SR_RXNE,. 
      008CAC C6 52 31         [ 1] 2664         ld a,UART1_DR 
      008CAC CD 84 EA         [ 2] 2665         subw x,#CELLL 
      008CAF CD 86            [ 1] 2666         ld (1,x),a 
      008CB1 21               [ 1] 2667         clr (x)
      008CB2 CD               [ 4] 2668         ret 
                           000000  2669 .else 
                                   2670 KEY1:   CALL     QKEY
                                   2671         CALL     QBRAN
                                   2672         .word      KEY1
                                   2673         RET
                                   2674 .endif 
                                   2675 
                                   2676 ;       NUF?    ( -- t )
                                   2677 ;       Return false if no input,
                                   2678 ;       else pause and if CR return true.
      008CB3 84 4D                 2679         .word      LINK
                           000DB3  2680 LINK = . 
      008CB5 CD                    2681         .byte      4
      008CB6 8B 3A CD 85           2682         .ascii     "NUF?"
      000DB8                       2683 NUFQ:
      008CBA 1E CC 87         [ 4] 2684         CALL     QKEY
      008CBD 4D 8C A9         [ 4] 2685         CALL     DUPP
      008CC0 03 53 54         [ 4] 2686         CALL     QBRAN
      008CC3 52 D1                 2687         .word    NUFQ1
      008CC4 CD 06 4F         [ 4] 2688         CALL     DDROP
      008CC4 CD 84 F4         [ 4] 2689         CALL     KEY
      008CC7 CD 84 BD         [ 4] 2690         CALL     DOLIT
      008CCA CD 87                 2691         .word      CRR
      008CCC 67 CD 8C         [ 2] 2692         JP     EQUAL
      008CCF 47               [ 4] 2693 NUFQ1:  RET
                                   2694 
                                   2695 ;       SPACE   ( -- )
                                   2696 ;       Send  blank character to
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



                                   2697 ;       output device.
      008CD0 CD 8C                 2698         .word      LINK
                           000DD4  2699 LINK = . 
      008CD2 81                    2700         .byte      5
      008CD3 CD 84 9E CD 8C        2701         .ascii     "SPACE"
      000DDA                       2702 SPACE:
      008CD8 96 CC 8C         [ 4] 2703         CALL     BLANK
      008CDB AC 8C C0         [ 2] 2704         JP     EMIT
                                   2705 
                                   2706 ;       SPACES  ( +n -- )
                                   2707 ;       Send n spaces to output device.
      008CDE 03 48                 2708         .word      LINK
                           000DE2  2709 LINK = . 
      008CE0 45                    2710         .byte      6
      008CE1 58 50 41 43 45 53     2711         .ascii     "SPACES"
      008CE2                       2712 SPACS:
      008CE2 CD 83 C5         [ 4] 2713         CALL     ZERO
      008CE5 00 10 CD         [ 4] 2714         CALL     MAX
      008CE8 85 B1 CC         [ 4] 2715         CALL     TOR
      008CEB 84 36            [ 2] 2716         JRA      CHAR2
      008CED 8C DE 07         [ 4] 2717 CHAR1:  CALL     SPACE
      008CF0 44 45 43         [ 4] 2718 CHAR2:  CALL     DONXT
      008CF3 49 4D                 2719         .word    CHAR1
      008CF5 41               [ 4] 2720         RET
                                   2721 
                                   2722 ;       TYPE    ( b u -- )
                                   2723 ;       Output u characters from b.
      008CF6 4C E2                 2724         .word      LINK
                           000DFF  2725 LINK = . 
      008CF7 04                    2726         .byte      4
      008CF7 CD 83 C5 00           2727         .ascii     "TYPE"
      000E04                       2728 TYPES:
      008CFB 0A CD 85         [ 4] 2729         CALL     TOR
      008CFE B1 CC            [ 2] 2730         JRA     TYPE2
      008D00 84 36 8C         [ 4] 2731 TYPE1:  CALL     DUPP
      008D03 EF 06 44         [ 4] 2732         CALL     CAT
      008D06 49 47 49         [ 4] 2733         CALL     EMIT
      008D09 54 3F 4E         [ 4] 2734         CALL     ONEP
      008D0B CD 03 59         [ 4] 2735 TYPE2:  CALL     DONXT
      008D0B CD 84                 2736         .word      TYPE1
      008D0D BD CD 83         [ 2] 2737         JP     DROP
                                   2738 
                                   2739 ;       CR      ( -- )
                                   2740 ;       Output a carriage return
                                   2741 ;       and a line feed.
      008D10 C5 00                 2742         .word      LINK
                           000E1F  2743 LINK = . 
      008D12 30                    2744         .byte      2
      008D13 CD 87                 2745         .ascii     "CR"
      000E22                       2746 CR:
      008D15 4D CD 83         [ 4] 2747         CALL     DOLIT
      008D18 C5 00                 2748         .word      CRR
      008D1A 09 CD 85         [ 4] 2749         CALL     EMIT
      008D1D 1E CD 87         [ 4] 2750         CALL     DOLIT
      008D20 B2 CD                 2751         .word      LF
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



      008D22 83 F8 8D         [ 2] 2752         JP     EMIT
                                   2753 
                                   2754 ;       do$     ( -- a )
                                   2755 ;       Return  address of a compiled
                                   2756 ;       string.
      008D25 3C CD                 2757         .word      LINK
                           000E34  2758 LINK = . 
      008D27 83                    2759 	.byte      COMPO+3
      008D28 C5 00 07              2760         .ascii     "DO$"
      000E38                       2761 DOSTR:
      008D2B CD 87 4D         [ 4] 2762         CALL     RFROM
      008D2E CD 84 F4         [ 4] 2763         CALL     RAT
      008D31 CD 83 C5         [ 4] 2764         CALL     RFROM
      008D34 00 0A CD         [ 4] 2765         CALL     COUNT
      008D37 87 B2 CD         [ 4] 2766         CALL     PLUS
      008D3A 85 54 CD         [ 4] 2767         CALL     TOR
      008D3D 84 F4 CD         [ 4] 2768         CALL     SWAPP
      008D40 84 9E CC         [ 4] 2769         CALL     TOR
      008D43 87               [ 4] 2770         RET
                                   2771 
                                   2772 ;       $"|     ( -- a )
                                   2773 ;       Run time routine compiled by $".
                                   2774 ;       Return address of a compiled string.
      008D44 94 8D                 2775         .word      LINK
                           000E53  2776 LINK = . 
      008D46 04                    2777 	.byte      COMPO+3
      008D47 07 4E 55              2778         .byte     '$','"','|'
      000E57                       2779 STRQP:
      008D4A 4D 42 45         [ 4] 2780         CALL     DOSTR
      008D4D 52               [ 4] 2781         RET
                                   2782 
                                   2783 ;       ."|     ( -- )
                                   2784 ;       Run time routine of ." .
                                   2785 ;       Output a compiled string.
      008D4E 3F 53                 2786         .word      LINK
                           000E5D  2787 LINK = . 
      008D4F 43                    2788 	.byte      COMPO+3
      008D4F CD 85 B1              2789         .byte     '.','"','|'
      000E61                       2790 DOTQP:
      008D52 CD 84 4D         [ 4] 2791         CALL     DOSTR
      008D55 CD 84 BD         [ 4] 2792         CALL     COUNT
      008D58 CD 8A 3A         [ 2] 2793         JP     TYPES
                                   2794 
                                   2795 ;       .R      ( n +n -- )
                                   2796 ;       Display an integer in a field
                                   2797 ;       of n columns, right justified.
      008D5B CD 85                 2798         .word      LINK
                           000E6C  2799 LINK = . 
      008D5D 1E                    2800         .byte      2
      008D5E CD 8B                 2801         .ascii     ".R"
      000E6F                       2802 DOTR:
      008D60 12 CD 85         [ 4] 2803         CALL     TOR
      008D63 1E CD 84         [ 4] 2804         CALL     STR
      008D66 6B CD 83         [ 4] 2805         CALL     RFROM
      008D69 C5 00 24         [ 4] 2806         CALL     OVER
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



      008D6C CD 87 75         [ 4] 2807         CALL     SUBB
      008D6F CD 83 F8         [ 4] 2808         CALL     SPACS
      008D72 8D 83 CD         [ 2] 2809         JP     TYPES
                                   2810 
                                   2811 ;       U.R     ( u +n -- )
                                   2812 ;       Display an unsigned integer
                                   2813 ;       in n column, right justified.
      008D75 8C E2                 2814         .word      LINK
                           000E86  2815 LINK = . 
      008D77 CD                    2816         .byte      3
      008D78 85 04 CD              2817         .ascii     "U.R"
      000E8A                       2818 UDOTR:
      008D7B 89 CE CD         [ 4] 2819         CALL     TOR
      008D7E 85 04 CD         [ 4] 2820         CALL     BDIGS
      008D81 89 DB CD         [ 4] 2821         CALL     DIGS
      008D84 85 1E CD         [ 4] 2822         CALL     EDIGS
      008D87 84 6B CD         [ 4] 2823         CALL     RFROM
      008D8A 83 C5 00         [ 4] 2824         CALL     OVER
      008D8D 2D CD 87         [ 4] 2825         CALL     SUBB
      008D90 75 CD 84         [ 4] 2826         CALL     SPACS
      008D93 BD CD 85         [ 2] 2827         JP     TYPES
                                   2828 
                                   2829 ;       U.      ( u -- )
                                   2830 ;       Display an unsigned integer
                                   2831 ;       in free format.
      008D96 04 CD                 2832         .word      LINK
                           000EA7  2833 LINK = . 
      008D98 84                    2834         .byte      2
      008D99 B1 CD                 2835         .ascii     "U."
      000EAA                       2836 UDOT:
      008D9B 87 4D CD         [ 4] 2837         CALL     BDIGS
      008D9E 85 04 CD         [ 4] 2838         CALL     DIGS
      008DA1 84 B1 CD         [ 4] 2839         CALL     EDIGS
      008DA4 86 EF CD         [ 4] 2840         CALL     SPACE
      008DA7 86 9E CD         [ 2] 2841         JP     TYPES
                                   2842 
                                   2843 ;       .       ( w -- )
                                   2844 ;       Display an integer in free
                                   2845 ;       format, preceeded by a space.
      008DAA 83 F8                 2846         .word      LINK
                           000EBB  2847 LINK = . 
      008DAC 8E                    2848         .byte      1
      008DAD 0D                    2849         .ascii     "."
      000EBD                       2850 DOT:
      008DAE CD 89 DB         [ 4] 2851         CALL     BASE
      008DB1 CD 84 BD         [ 4] 2852         CALL     AT
      008DB4 CD 84 F4         [ 4] 2853         CALL     DOLIT
      008DB7 CD 84                 2854         .word      10
      008DB9 BD CD 84         [ 4] 2855         CALL     XORR    ;?decimal
      008DBC 6B CD 85         [ 4] 2856         CALL     QBRAN
      008DBF B1 CD                 2857         .word      DOT1
      008DC1 84 4D CD         [ 2] 2858         JP     UDOT
      008DC4 8D 0B CD         [ 4] 2859 DOT1:   CALL     STR
      008DC7 83 F8 8D         [ 4] 2860         CALL     SPACE
      008DCA FB CD 85         [ 2] 2861         JP     TYPES
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



                                   2862 
                                   2863 ;       ?       ( a -- )
                                   2864 ;       Display contents in memory cell.
      008DCD 04 CD                 2865         .word      LINK
                                   2866         
                           000EDE  2867 LINK = . 
      008DCF 85                    2868         .byte      1
      008DD0 B1                    2869         .ascii     "?"
      000EE0                       2870 QUEST:
      008DD1 CD 84 4D         [ 4] 2871         CALL     AT
      008DD4 CD 89 4D         [ 2] 2872         JP     DOT
                                   2873 
                                   2874 ;; Parsing
                                   2875 
                                   2876 ;       parse   ( b u c -- b u delta ; <string> )
                                   2877 ;       Scan string delimited by c.
                                   2878 ;       Return found string and its offset.
      008DD7 CD 86                 2879         .word      LINK
                           000EE8  2880 LINK = . 
      008DD9 EF                    2881         .byte      5
      008DDA CD 84 9E CD 89        2882         .ascii     "parse"
      000EEE                       2883 PARS:
      008DDF CE CD 83         [ 4] 2884         CALL     TEMP
      008DE2 D9 8D B4         [ 4] 2885         CALL     STORE
      008DE5 CD 84 B1         [ 4] 2886         CALL     OVER
      008DE8 CD 85 04         [ 4] 2887         CALL     TOR
      008DEB CD 84 EA         [ 4] 2888         CALL     DUPP
      008DEE CD 83 F8         [ 4] 2889         CALL     QBRAN
      008DF1 8D F6                 2890         .word    PARS8
      008DF3 CD 87 1A         [ 4] 2891         CALL     ONEM
      008DF6 CD 85 04         [ 4] 2892         CALL     TEMP
      008DF9 20 0F CD         [ 4] 2893         CALL     AT
      008DFC 84 9E CD         [ 4] 2894         CALL     BLANK
      008DFF 84 9E CD         [ 4] 2895         CALL     EQUAL
      008E02 86 CF CD         [ 4] 2896         CALL     QBRAN
      008E05 86 CF                 2897         .word      PARS3
      008E07 CD 8A 3A         [ 4] 2898         CALL     TOR
      008E0A CD 84 F4         [ 4] 2899 PARS1:  CALL     BLANK
      008E0D CD 84 9E         [ 4] 2900         CALL     OVER
      008E10 CD 86 CF         [ 4] 2901         CALL     CAT     ;skip leading blanks ONLY
      008E13 CD 84 9E         [ 4] 2902         CALL     SUBB
      008E16 CD 85 B1         [ 4] 2903         CALL     ZLESS
      008E19 CC 84 36         [ 4] 2904         CALL     INVER
      008E1C 8D 47 03         [ 4] 2905         CALL     QBRAN
      008E1F 4B 45                 2906         .word      PARS2
      008E21 59 09 4E         [ 4] 2907         CALL     ONEP
      008E22 CD 03 59         [ 4] 2908         CALL     DONXT
      008E22 72 0B                 2909         .word      PARS1
      008E24 52 30 FB         [ 4] 2910         CALL     RFROM
      008E27 C6 52 31         [ 4] 2911         CALL     DROP
      008E2A 1D 00 02         [ 4] 2912         CALL     ZERO
      008E2D E7 01 7F         [ 2] 2913         JP     DUPP
      008E30 81 8E 1E         [ 4] 2914 PARS2:  CALL     RFROM
      008E33 04 4E 55         [ 4] 2915 PARS3:  CALL     OVER
      008E36 46 3F 84         [ 4] 2916         CALL     SWAPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      008E38 CD 04 3D         [ 4] 2917         CALL     TOR
      008E38 CD 83 91         [ 4] 2918 PARS4:  CALL     TEMP
      008E3B CD 84 F4         [ 4] 2919         CALL     AT
      008E3E CD 83 F8         [ 4] 2920         CALL     OVER
      008E41 8E 51 CD         [ 4] 2921         CALL     CAT
      008E44 86 CF CD         [ 4] 2922         CALL     SUBB    ;scan for delimiter
      008E47 8E 22 CD         [ 4] 2923         CALL     TEMP
      008E4A 83 C5 00         [ 4] 2924         CALL     AT
      008E4D 0D CC 87         [ 4] 2925         CALL     BLANK
      008E50 75 81 8E         [ 4] 2926         CALL     EQUAL
      008E53 33 05 53         [ 4] 2927         CALL     QBRAN
      008E56 50 41                 2928         .word      PARS5
      008E58 43 45 AD         [ 4] 2929         CALL     ZLESS
      008E5A CD 03 78         [ 4] 2930 PARS5:  CALL     QBRAN
      008E5A CD 8A                 2931         .word      PARS6
      008E5C 2D CC 83         [ 4] 2932         CALL     ONEP
      008E5F AF 8E 54         [ 4] 2933         CALL     DONXT
      008E62 06 53                 2934         .word      PARS4
      008E64 50 41 43         [ 4] 2935         CALL     DUPP
      008E67 45 53 3D         [ 4] 2936         CALL     TOR
      008E69 20 0F            [ 2] 2937         JRA     PARS7
      008E69 CD 8A 3A         [ 4] 2938 PARS6:  CALL     RFROM
      008E6C CD 87 D2         [ 4] 2939         CALL     DROP
      008E6F CD 84 BD         [ 4] 2940         CALL     DUPP
      008E72 20 03 CD         [ 4] 2941         CALL     ONEP
      008E75 8E 5A CD         [ 4] 2942         CALL     TOR
      008E78 83 D9 8E         [ 4] 2943 PARS7:  CALL     OVER
      008E7B 74 81 8E         [ 4] 2944         CALL     SUBB
      008E7E 62 04 54         [ 4] 2945         CALL     RFROM
      008E81 59 50 45         [ 4] 2946         CALL     RFROM
      008E84 CC 06 CD         [ 2] 2947         JP     SUBB
      008E84 CD 84 BD         [ 4] 2948 PARS8:  CALL     OVER
      008E87 20 0C CD         [ 4] 2949         CALL     RFROM
      008E8A 84 F4 CD         [ 2] 2950         JP     SUBB
                                   2951 
                                   2952 ;       PARSE   ( c -- b u ; <string> )
                                   2953 ;       Scan input stream and return
                                   2954 ;       counted string delimited by c.
      008E8D 84 6B                 2955         .word      LINK
                           000FB1  2956 LINK = . 
      008E8F CD                    2957         .byte      5
      008E90 83 AF CD 89 CE        2958         .ascii     "PARSE"
      000FB7                       2959 PARSE:
      008E95 CD 83 D9         [ 4] 2960         CALL     TOR
      008E98 8E 89 CC         [ 4] 2961         CALL     TIB
      008E9B 84 EA 8E         [ 4] 2962         CALL     INN
      008E9E 7F 02 43         [ 4] 2963         CALL     AT
      008EA1 52 06 6F         [ 4] 2964         CALL     PLUS    ;current input buffer pointer
      008EA2 CD 05 5F         [ 4] 2965         CALL     NTIB
      008EA2 CD 83 C5         [ 4] 2966         CALL     AT
      008EA5 00 0D CD         [ 4] 2967         CALL     INN
      008EA8 83 AF CD         [ 4] 2968         CALL     AT
      008EAB 83 C5 00         [ 4] 2969         CALL     SUBB    ;remaining count
      008EAE 0A CC 83         [ 4] 2970         CALL     RFROM
      008EB1 AF 8E 9F         [ 4] 2971         CALL     PARS
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      008EB4 43 44 4F         [ 4] 2972         CALL     INN
      008EB7 24 0A 2B         [ 2] 2973         JP     PSTOR
                                   2974 
                                   2975 ;       .(      ( -- )
                                   2976 ;       Output following string up to next ) .
      008EB8 0F B1                 2977         .word      LINK
                           000FE3  2978 LINK = . 
      008EB8 CD                    2979 	.byte      IMEDD+2
      008EB9 84 9E                 2980         .ascii     ".("
      000FE6                       2981 DOTPR:
      008EBB CD 84 B1         [ 4] 2982         CALL     DOLIT
      008EBE CD 84                 2983         .word     41	; ")"
      008EC0 9E CD 8B         [ 4] 2984         CALL     PARSE
      008EC3 12 CD 86         [ 2] 2985         JP     TYPES
                                   2986 
                                   2987 ;       (       ( -- )
                                   2988 ;       Ignore following string up to next ).
                                   2989 ;       A comment.
      008EC6 EF CD                 2990         .word      LINK
                           000FF3  2991 LINK = . 
      008EC8 84                    2992 	.byte      IMEDD+1
      008EC9 BD                    2993         .ascii     "("
      000FF5                       2994 PAREN:
      008ECA CD 85 04         [ 4] 2995         CALL     DOLIT
      008ECD CD 84                 2996         .word     41	; ")"
      008ECF BD 81 8E         [ 4] 2997         CALL     PARSE
      008ED2 B4 43 24         [ 2] 2998         JP     DDROP
                                   2999 
                                   3000 ;       \       ( -- )
                                   3001 ;       Ignore following text till
                                   3002 ;       end of line.
      008ED5 22 7C                 3003         .word      LINK
                           001002  3004 LINK = . 
      008ED7 81                    3005 	.byte      IMEDD+1
      008ED7 CD                    3006         .ascii     "\"
      001004                       3007 BKSLA:
                           000001  3008 .if CONVERT_TO_CODE
      008ED8 8E B8 81 8E      [ 2] 3009         ldw y,#UCTIB ; #TIB  
      008EDC D3 43            [ 2] 3010         ldw y,(y)
      008EDE 2E 22            [ 2] 3011         pushw y ; count in TIB 
      008EE0 7C AE 00 0A      [ 2] 3012         ldw y,#UINN ; >IN 
      008EE1 90 BF 24         [ 2] 3013         ldw YTEMP,y
      008EE1 CD 8E            [ 2] 3014         popw y 
      008EE3 B8 CD 8B         [ 5] 3015         ldw [YTEMP],y
      008EE6 12               [ 4] 3016         ret 
                           000000  3017 .else
                                   3018         CALL     NTIB
                                   3019         CALL     AT
                                   3020         CALL     INN
                                   3021         JP     STORE
                                   3022 .endif 
                                   3023 
                                   3024 ;       WORD    ( c -- a ; <string> )
                                   3025 ;       Parse a word from input stream
                                   3026 ;       and copy it to code dictionary.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      008EE7 CC 8E                 3027         .word      LINK
                           00101B  3028 LINK = . 
      008EE9 84                    3029         .byte      4
      008EEA 8E DD 02 2E           3030         .ascii     "WORD"
      001020                       3031 WORDD:
      008EEE 52 0F B7         [ 4] 3032         CALL     PARSE
      008EEF CD 0A A9         [ 4] 3033         CALL     HERE
      008EEF CD 84 BD         [ 4] 3034         CALL     CELLP
      008EF2 CD 8C C4         [ 2] 3035         JP     PACKS
                                   3036 
                                   3037 ;       TOKEN   ( -- a ; <string> )
                                   3038 ;       Parse a word from input stream
                                   3039 ;       and copy it to name dictionary.
      008EF5 CD 84                 3040         .word      LINK
                           00102E  3041 LINK = . 
      008EF7 9E                    3042         .byte      5
      008EF8 CD 85 1E CD 87        3043         .ascii     "TOKEN"
      001034                       3044 TOKEN:
      008EFD 4D CD 8E         [ 4] 3045         CALL     BLANK
      008F00 69 CC 8E         [ 2] 3046         JP     WORDD
                                   3047 
                                   3048 ;; Dictionary search
                                   3049 
                                   3050 ;       NAME>   ( na -- ca )
                                   3051 ;       Return a code address given
                                   3052 ;       a name address.
      008F03 84 8E                 3053         .word      LINK
                           00103C  3054 LINK = . 
      008F05 EC                    3055         .byte      5
      008F06 03 55 2E 52 3E        3056         .ascii     "NAME>"
      008F0A                       3057 NAMET:
      008F0A CD 84 BD         [ 4] 3058         CALL     COUNT
      008F0D CD 8C 47         [ 4] 3059         CALL     DOLIT
      008F10 CD 8C                 3060         .word      31
      008F12 81 CD 8C         [ 4] 3061         CALL     ANDD
      008F15 AC CD 84         [ 2] 3062         JP     PLUS
                                   3063 
                                   3064 ;       SAME?   ( a a u -- a a f \ -0+ )
                                   3065 ;       Compare u cells in two
                                   3066 ;       strings. Return 0 if identical.
      008F18 9E CD                 3067         .word      LINK
                           001052  3068 LINK = . 
      008F1A 85                    3069         .byte       5
      008F1B 1E CD 87 4D CD        3070         .ascii     "SAME?"
      001058                       3071 SAMEQ:
      008F20 8E 69 CC         [ 4] 3072         CALL     ONEM
      008F23 8E 84 8F         [ 4] 3073         CALL     TOR
      008F26 06 02            [ 2] 3074         JRA     SAME2
      008F28 55 2E 9E         [ 4] 3075 SAME1:  CALL     OVER
      008F2A CD 04 31         [ 4] 3076         CALL     RAT
      008F2A CD 8C 47         [ 4] 3077         CALL     PLUS
      008F2D CD 8C 81         [ 4] 3078         CALL     CAT
      008F30 CD 8C AC         [ 4] 3079         CALL     OVER
      008F33 CD 8E 5A         [ 4] 3080         CALL     RAT
      008F36 CC 8E 84         [ 4] 3081         CALL     PLUS
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



      008F39 8F 27 01         [ 4] 3082         CALL     CAT
      008F3C 2E 06 CD         [ 4] 3083         CALL     SUBB
      008F3D CD 06 1E         [ 4] 3084         CALL     QDUP
      008F3D CD 85 B1         [ 4] 3085         CALL     QBRAN
      008F40 CD 84                 3086         .word      SAME2
      008F42 4D CD 83         [ 4] 3087         CALL     RFROM
      008F45 C5 00 0A         [ 2] 3088         JP     DROP
      008F48 CD 85 69         [ 4] 3089 SAME2:  CALL     DONXT
      008F4B CD 83                 3090         .word      SAME1
      008F4D F8 8F 53         [ 2] 3091         JP     ZERO
                                   3092 
                                   3093 ;       find    ( a va -- ca na | a F )
                                   3094 ;       Search vocabulary for string.
                                   3095 ;       Return ca and na if succeeded.
      008F50 CC 8F                 3096         .word      LINK
                           001093  3097 LINK = . 
      008F52 2A                    3098         .byte      4
      008F53 CD 8C C4 CD           3099         .ascii     "FIND"
      001098                       3100 FIND:
      008F57 8E 5A CC         [ 4] 3101         CALL     SWAPP
      008F5A 8E 84 8F         [ 4] 3102         CALL     DUPP
      008F5D 3B 01 3F         [ 4] 3103         CALL     CAT
      008F60 CD 05 40         [ 4] 3104         CALL     TEMP
      008F60 CD 84 4D         [ 4] 3105         CALL     STORE
      008F63 CC 8F 3D         [ 4] 3106         CALL     DUPP
      008F66 8F 5E 05         [ 4] 3107         CALL     AT
      008F69 70 61 72         [ 4] 3108         CALL     TOR
      008F6C 73 65 23         [ 4] 3109         CALL     CELLP
      008F6E CD 04 84         [ 4] 3110         CALL     SWAPP
      008F6E CD 85 C0         [ 4] 3111 FIND1:  CALL     AT
      008F71 CD 84 36         [ 4] 3112         CALL     DUPP
      008F74 CD 85 1E         [ 4] 3113         CALL     QBRAN
      008F77 CD 84                 3114         .word      FIND6
      008F79 BD CD 84         [ 4] 3115         CALL     DUPP
      008F7C F4 CD 83         [ 4] 3116         CALL     AT
      008F7F F8 90 26         [ 4] 3117         CALL     DOLIT
      008F82 CD 89                 3118         .word      MASKK
      008F84 DB CD 85         [ 4] 3119         CALL     ANDD
      008F87 C0 CD 84         [ 4] 3120         CALL     RAT
      008F8A 4D CD 8A         [ 4] 3121         CALL     XORR
      008F8D 2D CD 87         [ 4] 3122         CALL     QBRAN
      008F90 75 CD                 3123         .word      FIND2
      008F92 83 F8 8F         [ 4] 3124         CALL     CELLP
      008F95 C7 CD 84         [ 4] 3125         CALL     DOLIT
      008F98 BD CD                 3126         .word     0xFFFF
      008F9A 8A 2D            [ 2] 3127         JRA     FIND3
      008F9C CD 85 1E         [ 4] 3128 FIND2:  CALL     CELLP
      008F9F CD 84 6B         [ 4] 3129         CALL     TEMP
      008FA2 CD 87 4D         [ 4] 3130         CALL     AT
      008FA5 CD 85 2D         [ 4] 3131         CALL     SAMEQ
      008FA8 CD 87 09         [ 4] 3132 FIND3:  CALL     BRAN
      008FAB CD 83                 3133         .word      FIND4
      008FAD F8 8F C4         [ 4] 3134 FIND6:  CALL     RFROM
      008FB0 CD 89 CE         [ 4] 3135         CALL     DROP
      008FB3 CD 83 D9         [ 4] 3136         CALL     SWAPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      008FB6 8F 99 CD         [ 4] 3137         CALL     CELLM
      008FB9 84 9E CD         [ 2] 3138         JP     SWAPP
      008FBC 84 EA CD         [ 4] 3139 FIND4:  CALL     QBRAN
      008FBF 8A 3A                 3140         .word      FIND5
      008FC1 CC 84 F4         [ 4] 3141         CALL     CELLM
      008FC4 CD 84 9E         [ 4] 3142         CALL     CELLM
      008FC7 CD 85            [ 2] 3143         JRA     FIND1
      008FC9 1E CD 85         [ 4] 3144 FIND5:  CALL     RFROM
      008FCC 04 CD 84         [ 4] 3145         CALL     DROP
      008FCF BD CD 85         [ 4] 3146         CALL     SWAPP
      008FD2 C0 CD 84         [ 4] 3147         CALL     DROP
      008FD5 4D CD 85         [ 4] 3148         CALL     CELLM
      008FD8 1E CD 84         [ 4] 3149         CALL     DUPP
      008FDB 6B CD 87         [ 4] 3150         CALL     NAMET
      008FDE 4D CD 85         [ 2] 3151         JP     SWAPP
                                   3152 
                                   3153 ;       NAME?   ( a -- ca na | a F )
                                   3154 ;       Search vocabularies for a string.
      008FE1 C0 CD                 3155         .word      LINK
                           00112B  3156 LINK = . 
      008FE3 84                    3157         .byte      5
      008FE4 4D CD 8A 2D CD        3158         .ascii     "NAME?"
      001131                       3159 NAMEQ:
      008FE9 87 75 CD         [ 4] 3160         CALL   CNTXT
      008FEC 83 F8 8F         [ 2] 3161         JP     FIND
                                   3162 
                                   3163 ;; Terminal response
                                   3164 
                                   3165 ;       ^H      ( bot eot cur -- bot eot cur )
                                   3166 ;       Backup cursor by one character.
      008FEF F3 CD                 3167         .word      LINK
                           001139  3168 LINK = . 
      008FF1 85                    3169         .byte      2
      008FF2 2D CD                 3170         .ascii     "^H"
      00113C                       3171 BKSP:
      008FF4 83 F8 90         [ 4] 3172         CALL     TOR
      008FF7 08 CD 89         [ 4] 3173         CALL     OVER
      008FFA CE CD 83         [ 4] 3174         CALL     RFROM
      008FFD D9 8F D0         [ 4] 3175         CALL     SWAPP
      009000 CD 84 F4         [ 4] 3176         CALL     OVER
      009003 CD 84 BD         [ 4] 3177         CALL     XORR
      009006 20 0F CD         [ 4] 3178         CALL     QBRAN
      009009 84 9E                 3179         .word      BACK1
      00900B CD 84 EA         [ 4] 3180         CALL     DOLIT
      00900E CD 84                 3181         .word      BKSPP
      009010 F4 CD 89         [ 4] 3182         CALL     EMIT
      009013 CE CD 84         [ 4] 3183         CALL     ONEM
      009016 BD CD 85         [ 4] 3184         CALL     BLANK
      009019 1E CD 87         [ 4] 3185         CALL     EMIT
      00901C 4D CD 84         [ 4] 3186         CALL     DOLIT
      00901F 9E CD                 3187         .word      BKSPP
      009021 84 9E CC         [ 2] 3188         JP     EMIT
      009024 87               [ 4] 3189 BACK1:  RET
                                   3190 
                                   3191 ;       TAP    ( bot eot cur c -- bot eot cur )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



                                   3192 ;       Accept and echo key stroke
                                   3193 ;       and bump cursor.
      009025 4D CD                 3194         .word      LINK
                           00116F  3195 LINK = . 
      009027 85                    3196         .byte      3
      009028 1E CD 84              3197         .ascii     "TAP"
      001173                       3198 TAP:
      00902B 9E CC 87         [ 4] 3199         CALL     DUPP
      00902E 4D 8F 68         [ 4] 3200         CALL     EMIT
      009031 05 50 41         [ 4] 3201         CALL     OVER
      009034 52 53 45         [ 4] 3202         CALL     CSTOR
      009037 CC 09 4E         [ 2] 3203         JP     ONEP
                                   3204 
                                   3205 ;       kTAP    ( bot eot cur c -- bot eot cur )
                                   3206 ;       Process a key stroke,
                                   3207 ;       CR or backspace.
      009037 CD 84                 3208         .word      LINK
                           001184  3209 LINK = . 
      009039 BD                    3210         .byte      4
      00903A CD 8B 4B CD           3211         .ascii     "KTAP"
      001189                       3212 KTAP:
      00903E 85 CF CD         [ 4] 3213         CALL     DUPP
      009041 84 4D CD         [ 4] 3214         CALL     DOLIT
      009044 86 EF                 3215         .word      CRR
      009046 CD 85 DF         [ 4] 3216         CALL     XORR
      009049 CD 84 4D         [ 4] 3217         CALL     QBRAN
      00904C CD 85                 3218         .word      KTAP2
      00904E CF CD 84         [ 4] 3219         CALL     DOLIT
      009051 4D CD                 3220         .word      BKSPP
      009053 87 4D CD         [ 4] 3221         CALL     XORR
      009056 84 9E CD         [ 4] 3222         CALL     QBRAN
      009059 8F 6E                 3223         .word      KTAP1
      00905B CD 85 CF         [ 4] 3224         CALL     BLANK
      00905E CC 8A AB         [ 2] 3225         JP     TAP
      009061 90 31 82         [ 2] 3226 KTAP1:  JP     BKSP
      009064 2E 28 6A         [ 4] 3227 KTAP2:  CALL     DROP
      009066 CD 04 84         [ 4] 3228         CALL     SWAPP
      009066 CD 83 C5         [ 4] 3229         CALL     DROP
      009069 00 29 CD         [ 2] 3230         JP     DUPP
                                   3231 
                                   3232 ;       accept  ( b u -- b u )
                                   3233 ;       Accept characters to input
                                   3234 ;       buffer. Return with actual count.
      00906C 90 37                 3235         .word      LINK
                           0011BD  3236 LINK = . 
      00906E CC                    3237         .byte      6
      00906F 8E 84 90 63 81 28     3238         .ascii     "ACCEPT"
      009075                       3239 ACCEP:
      009075 CD 83 C5         [ 4] 3240         CALL     OVER
      009078 00 29 CD         [ 4] 3241         CALL     PLUS
      00907B 90 37 CC         [ 4] 3242         CALL     OVER
      00907E 86 CF 90         [ 4] 3243 ACCP1:  CALL     DDUP
      009081 73 81 5C         [ 4] 3244         CALL     XORR
      009084 CD 03 78         [ 4] 3245         CALL     QBRAN
      009084 90 AE                 3246         .word      ACCP4
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      009086 00 0C 90         [ 4] 3247         CALL     KEY
      009089 FE 90 89         [ 4] 3248         CALL     DUPP
      00908C 90 AE 00         [ 4] 3249         CALL     BLANK
      00908F 0A 90 BF         [ 4] 3250         CALL     DOLIT
      009092 24 90                 3251         .word      127
      009094 85 91 CF         [ 4] 3252         CALL     WITHI
      009097 24 81 90         [ 4] 3253         CALL     QBRAN
      00909A 82 04                 3254         .word      ACCP2
      00909C 57 4F 52         [ 4] 3255         CALL     TAP
      00909F 44 03            [ 2] 3256         JRA     ACCP3
      0090A0 CD 11 89         [ 4] 3257 ACCP2:  CALL     KTAP
      0090A0 CD 90            [ 2] 3258 ACCP3:  JRA     ACCP1
      0090A2 37 CD 8B         [ 4] 3259 ACCP4:  CALL     DROP
      0090A5 29 CD 89         [ 4] 3260         CALL     OVER
      0090A8 A3 CC 8B         [ 2] 3261         JP     SUBB
                                   3262 
                                   3263 ;       QUERY   ( -- )
                                   3264 ;       Accept input stream to
                                   3265 ;       terminal input buffer.
      0090AB EA 90                 3266         .word      LINK
                                   3267         
                           001203  3268 LINK = . 
      0090AD 9B                    3269         .byte      5
      0090AE 05 54 4F 4B 45        3270         .ascii     "QUERY"
      001209                       3271 QUERY:
      0090B3 4E 0A CB         [ 4] 3272         CALL     TIB
      0090B4 CD 03 45         [ 4] 3273         CALL     DOLIT
      0090B4 CD 8A                 3274         .word      80
      0090B6 2D CC 90         [ 4] 3275         CALL     ACCEP
      0090B9 A0 90 AE         [ 4] 3276         CALL     NTIB
      0090BC 05 4E 41         [ 4] 3277         CALL     STORE
      0090BF 4D 45 3E         [ 4] 3278         CALL     DROP
      0090C2 CD 09 BA         [ 4] 3279         CALL     ZERO
      0090C2 CD 8B 12         [ 4] 3280         CALL     INN
      0090C5 CD 83 C5         [ 2] 3281         JP     STORE
                                   3282 
                                   3283 ;       ABORT   ( -- )
                                   3284 ;       Reset data stack and
                                   3285 ;       jump to QUIT.
      0090C8 00 1F                 3286         .word      LINK
                           001228  3287 LINK = . 
      0090CA CD                    3288         .byte      5
      0090CB 85 40 CC 86 EF        3289         .ascii     "ABORT"
      00122E                       3290 ABORT:
      0090D0 90 BC 05         [ 4] 3291         CALL     PRESE
      0090D3 53 41 4D         [ 2] 3292         JP     QUIT
                                   3293 
                                   3294 ;       abort"  ( f -- )
                                   3295 ;       Run time routine of ABORT".
                                   3296 ;       Abort with a message.
      0090D6 45 3F                 3297         .word      LINK
                           001236  3298 LINK = . 
      0090D8 46                    3299 	.byte      COMPO+6
      0090D8 CD 89 DB CD 84        3300         .ascii     "ABORT"
      0090DD BD                    3301         .byte      '"'
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      00123D                       3302 ABORQ:
      0090DE 20 29 CD         [ 4] 3303         CALL     QBRAN
      0090E1 85 1E                 3304         .word      ABOR2   ;text flag
      0090E3 CD 84 B1         [ 4] 3305         CALL     DOSTR
      0090E6 CD 86 EF         [ 4] 3306 ABOR1:  CALL     SPACE
      0090E9 CD 84 6B         [ 4] 3307         CALL     COUNT
      0090EC CD 85 1E         [ 4] 3308         CALL     TYPES
      0090EF CD 84 B1         [ 4] 3309         CALL     DOLIT
      0090F2 CD 86                 3310         .word     63 ; "?"
      0090F4 EF CD 84         [ 4] 3311         CALL     EMIT
      0090F7 6B CD 87         [ 4] 3312         CALL     CR
      0090FA 4D CD 86         [ 2] 3313         JP     ABORT   ;pass error string
      0090FD 9E CD 83         [ 4] 3314 ABOR2:  CALL     DOSTR
      009100 F8 91 09         [ 2] 3315         JP     DROP
                                   3316 
                                   3317 ;; The text interpreter
                                   3318 
                                   3319 ;       $INTERPRET      ( a -- )
                                   3320 ;       Interpret a word. If failed,
                                   3321 ;       try to convert it to an integer.
      009103 CD 84                 3322         .word      LINK
                           001264  3323 LINK = . 
      009105 9E                    3324         .byte      10
      009106 CC 84 EA CD 83 D9 90  3325         .ascii     "$INTERPRET"
             E0 CC 8A
      00126F                       3326 INTER:
      009110 3A 90 D2         [ 4] 3327         CALL     NAMEQ
      009113 04 46 49         [ 4] 3328         CALL     QDUP    ;?defined
      009116 4E 44 78         [ 4] 3329         CALL     QBRAN
      009118 12 99                 3330         .word      INTE1
      009118 CD 85 04         [ 4] 3331         CALL     AT
      00911B CD 84 F4         [ 4] 3332         CALL     DOLIT
      00911E CD 84                 3333 	.word       0x4000	; COMPO*256
      009120 6B CD 85         [ 4] 3334         CALL     ANDD    ;?compile only lexicon bits
      009123 C0 CD 84         [ 4] 3335         CALL     ABORQ
      009126 36                    3336         .byte      13
      009127 CD 84 F4 CD 84 4D CD  3337         .ascii     " compile only"
             84 BD CD 89 A3 CD
      009134 85 04 CD         [ 2] 3338         JP     EXECU
      009137 84 4D CD         [ 4] 3339 INTE1:  CALL     NUMBQ   ;convert a number
      00913A 84 F4 CD         [ 4] 3340         CALL     QBRAN
      00913D 83 F8                 3341         .word    ABOR1
      00913F 91               [ 4] 3342         RET
                                   3343 
                                   3344 ;       [       ( -- )
                                   3345 ;       Start  text interpreter.
      009140 75 CD                 3346         .word      LINK
                           0012A4  3347 LINK = . 
      009142 84                    3348 	.byte      IMEDD+1
      009143 F4                    3349         .ascii     "["
      0012A6                       3350 LBRAC:
      009144 CD 84 4D         [ 4] 3351         CALL   DOLIT
      009147 CD 83                 3352         .word  INTER
      009149 C5 1F 7F         [ 4] 3353         CALL   TEVAL
      00914C CD 85 40         [ 2] 3354         JP     STORE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



                                   3355 
                                   3356 ;       .OK     ( -- )
                                   3357 ;       Display 'ok' while interpreting.
      00914F CD 84                 3358         .word      LINK
                           0012B3  3359 LINK = . 
      009151 B1                    3360         .byte      3
      009152 CD 85 69              3361         .ascii     ".OK"
      0012B7                       3362 DOTOK:
      009155 CD 83 F8         [ 4] 3363         CALL     DOLIT
      009158 91 64                 3364         .word      INTER
      00915A CD 89 A3         [ 4] 3365         CALL     TEVAL
      00915D CD 83 C5         [ 4] 3366         CALL     AT
      009160 FF FF 20         [ 4] 3367         CALL     EQUAL
      009163 0C CD 89         [ 4] 3368         CALL     QBRAN
      009166 A3 CD                 3369         .word      DOTO1
      009168 85 C0 CD         [ 4] 3370         CALL     DOTQP
      00916B 84                    3371         .byte      3
      00916C 4D CD 90              3372         .ascii     " ok"
      00916F D8 CD 84         [ 2] 3373 DOTO1:  JP     CR
                                   3374 
                                   3375 ;       ?STACK  ( -- )
                                   3376 ;       Abort if stack underflows.
      009172 0F 91                 3377         .word      LINK
                           0012D6  3378 LINK = . 
      009174 84                    3379         .byte      6
      009175 CD 84 9E CD 84 EA     3380         .ascii     "?STACK"
      0012DD                       3381 QSTAC: 
      00917B CD 85 04         [ 4] 3382         CALL     DEPTH
      00917E CD 89 B2         [ 4] 3383         CALL     ZLESS   ;check only for underflow
      009181 CC 85 04         [ 4] 3384         CALL     ABORQ
      009184 CD                    3385         .byte      11
      009185 83 F8 91 91 CD 89 B2  3386         .ascii     " underflow "
             CD 89 B2 20
      009190 A5               [ 4] 3387         RET
                                   3388 
                                   3389 ;       EVAL    ( -- )
                                   3390 ;       Interpret  input stream.
      009191 CD 84                 3391         .word      LINK
                           0012F5  3392 LINK = . 
      009193 9E                    3393         .byte      4
      009194 CD 84 EA CD           3394         .ascii     "EVAL"
      0012FA                       3395 EVAL:
      009198 85 04 CD         [ 4] 3396 EVAL1:  CALL     TOKEN
      00919B 84 EA CD         [ 4] 3397         CALL     DUPP
      00919E 89 B2 CD         [ 4] 3398         CALL     CAT     ;?input stream empty
      0091A1 84 F4 CD         [ 4] 3399         CALL     QBRAN
      0091A4 90 C2                 3400         .word    EVAL2
      0091A6 CC 85 04         [ 4] 3401         CALL     TEVAL
      0091A9 91 13 05         [ 4] 3402         CALL     ATEXE
      0091AC 4E 41 4D         [ 4] 3403         CALL     QSTAC   ;evaluate input, check stack
      0091AF 45 3F 8F         [ 4] 3404         CALL     BRAN
      0091B1 12 FA                 3405         .word    EVAL1
      0091B1 CD 86 34         [ 4] 3406 EVAL2:  CALL     DROP
      0091B4 CC 91 18         [ 2] 3407         JP       DOTOK
                                   3408 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



                                   3409 ;       PRESET  ( -- )
                                   3410 ;       Reset data stack pointer and
                                   3411 ;       terminal input buffer.
      0091B7 91 AB                 3412         .word      LINK
                           00131E  3413 LINK = . 
      0091B9 02                    3414         .byte      6
      0091BA 5E 48 45 53 45 54     3415         .ascii     "PRESET"
      0091BC                       3416 PRESE:
      0091BC CD 84 BD         [ 4] 3417         CALL     DOLIT
      0091BF CD 85                 3418         .word      SPP
      0091C1 1E CD 84         [ 4] 3419         CALL     SPSTO
      0091C4 9E CD 85         [ 4] 3420         CALL     DOLIT
      0091C7 04 CD                 3421         .word      TIBB
      0091C9 85 1E CD         [ 4] 3422         CALL     NTIB
      0091CC 85 69 CD         [ 4] 3423         CALL     CELLP
      0091CF 83 F8 91         [ 2] 3424         JP     STORE
                                   3425 
                                   3426 ;       QUIT    ( -- )
                                   3427 ;       Reset return stack pointer
                                   3428 ;       and start text interpreter.
      0091D2 EC CD                 3429         .word      LINK
                           00133D  3430 LINK = . 
      0091D4 83                    3431         .byte      4
      0091D5 C5 00 08 CD           3432         .ascii     "QUIT"
      001342                       3433 QUIT:
      0091D9 83 AF CD         [ 4] 3434         CALL     DOLIT
      0091DC 89 DB                 3435         .word      RPP
      0091DE CD 8A 2D         [ 4] 3436         CALL     RPSTO   ;reset return stack pointer
      0091E1 CD 83 AF         [ 4] 3437 QUIT1:  CALL     LBRAC   ;start interpretation
      0091E4 CD 83 C5         [ 4] 3438 QUIT2:  CALL     QUERY   ;get input
      0091E7 00 08 CC         [ 4] 3439         CALL     EVAL
      0091EA 83 AF            [ 2] 3440         JRA     QUIT2   ;continue till error
                                   3441 
                                   3442 ;; The compiler
                                   3443 
                                   3444 ;       '       ( -- ca )
                                   3445 ;       Search vocabularies for
                                   3446 ;       next word in input stream.
      0091EC 81 91                 3447         .word      LINK
                           001357  3448 LINK = . 
      0091EE B9                    3449         .byte      1
      0091EF 03                    3450         .ascii     "'"
      001359                       3451 TICK:
      0091F0 54 41 50         [ 4] 3452         CALL     TOKEN
      0091F3 CD 11 31         [ 4] 3453         CALL     NAMEQ   ;?defined
      0091F3 CD 84 F4         [ 4] 3454         CALL     QBRAN
      0091F6 CD 83                 3455         .word      ABOR1
      0091F8 AF               [ 4] 3456         RET     ;yes, push code address
                                   3457 
                                   3458 ;       ALLOT   ( n -- )
                           000001  3459 .if PICATOUT_MOD
                                   3460 ;       Allocate n bytes to RAM 
                           000000  3461 .else 
                                   3462 ;       Allocate n bytes to  code dictionary.
                                   3463 .endif 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      0091F9 CD 85                 3464         .word      LINK
                           001367  3465 LINK = . 
      0091FB 1E                    3466         .byte      5
      0091FC CD 84 5A CC 89        3467         .ascii     "ALLOT"
      00136D                       3468 ALLOT:
      009201 CE 91 EF         [ 4] 3469         CALL     VPP
                           000001  3470 .if PICATOUT_MOD
                                   3471 ; must update APP_VP each time VP is modidied
      009204 04 4B 54         [ 4] 3472         call PSTOR 
      009207 41 50 54         [ 2] 3473         jp UPDATVP 
                           000000  3474 .else
                                   3475         JP     PSTOR
                                   3476 .endif ;PICATOUT_MOD
                                   3477 
                                   3478 ;       ,       ( w -- )
                                   3479 ;         Compile an integer into
                                   3480 ;         variable space.
      009209 13 67                 3481         .word      LINK
                           001378  3482 LINK = . 
      009209 CD                    3483         .byte      1
      00920A 84                    3484         .ascii     ","
      00137A                       3485 COMMA:
      00920B F4 CD 83         [ 4] 3486         CALL     HERE
      00920E C5 00 0D         [ 4] 3487         CALL     DUPP
      009211 CD 85 69         [ 4] 3488         CALL     CELLP   ;cell boundary
      009214 CD 83 F8         [ 4] 3489         CALL     VPP
      009217 92 2F CD         [ 4] 3490         CALL     STORE
      00921A 83 C5 00         [ 2] 3491         JP     STORE
                                   3492 
                                   3493 ;       C,      ( c -- )
                                   3494 ;       Compile a byte into
                                   3495 ;       variables space.
      00921D 08 CD                 3496        .word      LINK
                           00138E  3497 LINK = . 
      00921F 85                    3498         .byte      2
      009220 69 CD                 3499         .ascii     "C,"
      001391                       3500 CCOMMA:
      009222 83 F8 92         [ 4] 3501         CALL     HERE
      009225 2C CD 8A         [ 4] 3502         CALL     DUPP
      009228 2D CC 91         [ 4] 3503         CALL     ONEP
      00922B F3 CC 91         [ 4] 3504         CALL     VPP
      00922E BC CD 84         [ 4] 3505         CALL     STORE
      009231 EA CD 85         [ 2] 3506         JP     CSTOR
                                   3507 
                                   3508 ;       [COMPILE]       ( -- ; <string> )
                                   3509 ;       Compile next immediate
                                   3510 ;       word into code dictionary.
      009234 04 CD                 3511         .word      LINK
                           0013A5  3512 LINK = . 
      009236 84                    3513 	.byte      IMEDD+9
      009237 EA CC 84 F4 92 04 06  3514         .ascii     "[COMPILE]"
             41 43
      0013AF                       3515 BCOMP:
      009240 43 45 50         [ 4] 3516         CALL     TICK
      009243 54 16 72         [ 2] 3517         JP     JSRC
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



                                   3518 
                                   3519 ;       COMPILE ( -- )
                                   3520 ;       Compile next jsr in
                                   3521 ;       colon list to code dictionary.
      009244 13 A5                 3522         .word      LINK
                           0013B7  3523 LINK = . 
      009244 CD                    3524 	.byte      COMPO+7
      009245 85 1E CD 86 EF CD 85  3525         .ascii     "COMPILE"
      0013BF                       3526 COMPI:
      00924C 1E CD 86         [ 4] 3527         CALL     RFROM
                           000001  3528 .if PICATOUT_MOD
                                   3529 ; no need to increment
                           000000  3530 .else
                                   3531         CALL     ONEP
                                   3532 .endif 
      00924F DA CD 85         [ 4] 3533         CALL     DUPP
      009252 69 CD 83         [ 4] 3534         CALL     AT
      009255 F8 92 78         [ 4] 3535         CALL     JSRC    ;compile subroutine
      009258 CD 8E 22         [ 4] 3536         CALL     CELLP
                           000001  3537 .if PICATOUT_MOD
      00925B CD 84            [ 1] 3538         ldw y,x 
      00925D F4 CD            [ 2] 3539         ldw y,(y)
      00925F 8A 2D CD         [ 2] 3540         addw x,#CELLL 
      009262 83 C5            [ 2] 3541         jp (y)
                           000000  3542 .else 
                                   3543         JP     TOR
                                   3544 .endif 
                                   3545 
                                   3546 ;       LITERAL ( w -- )
                                   3547 ;       Compile tos to dictionary
                                   3548 ;       as an integer literal.
      009264 00 7F                 3549         .word      LINK
                           0013D9  3550 LINK = . 
      009266 CD                    3551 	.byte      IMEDD+7
      009267 88 0F CD 83 F8 92 73  3552         .ascii     "LITERAL"
      0013E1                       3553 LITER:
      00926E CD 91 F3         [ 4] 3554         CALL     COMPI
                           000001  3555 .if PICATOUT_MOD
      009271 20 03                 3556         .word DOLIT 
                           000000  3557 .else         
                                   3558         CALL     DOLIT
                                   3559 .endif 
      009273 CD 92 09         [ 2] 3560         JP     COMMA
                                   3561 
                                   3562 ;       $,"     ( -- )
                                   3563 ;       Compile a literal string
                                   3564 ;       up to next " .
      009276 20 D5                 3565         .word      LINK
                           0013EB  3566 LINK = . 
      009278 CD                    3567         .byte      3
      009279 84 EA CD              3568         .byte     '$',',','"'
      0013EF                       3569 STRCQ:
      00927C 85 1E CC         [ 4] 3570         CALL     DOLIT
      00927F 87 4D                 3571         .word     34	; "
      009281 92 3D 05         [ 4] 3572         CALL     PARSE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      009284 51 55 45         [ 4] 3573         CALL     HERE
      009287 52 59 6A         [ 4] 3574         CALL     PACKS   ;string to code dictionary
      009289 CD 0A 92         [ 4] 3575         CALL     COUNT
      009289 CD 8B 4B         [ 4] 3576         CALL     PLUS    ;calculate aligned end of string
      00928C CD 83 C5         [ 4] 3577         CALL     VPP
      00928F 00 50 CD         [ 2] 3578         JP     STORE
                                   3579 
                                   3580 ;; Structures
                                   3581 
                                   3582 ;       FOR     ( -- a )
                                   3583 ;       Start a FOR-NEXT loop
                                   3584 ;       structure in a colon definition.
      009292 92 44                 3585         .word      LINK
                           00140B  3586 LINK = . 
      009294 CD                    3587 	.byte      IMEDD+3
      009295 85 DF CD              3588         .ascii     "FOR"
      00140F                       3589 FOR:
      009298 84 36 CD         [ 4] 3590         CALL     COMPI
                           000001  3591 .if PICATOUT_MOD
      00929B 84 EA                 3592         .word TOR 
                           000000  3593 .else
                                   3594         CALL     TOR
                                   3595 .endif
      00929D CD 8A 3A         [ 2] 3596         JP     HERE
                                   3597 
                                   3598 ;       NEXT    ( a -- )
                                   3599 ;       Terminate a FOR-NEXT loop.
      0092A0 CD 85                 3600         .word      LINK
                           001419  3601 LINK = . 
      0092A2 CF                    3602 	.byte      IMEDD+4
      0092A3 CC 84 36 92           3603         .ascii     "NEXT"
      00141E                       3604 NEXT:
      0092A7 83 05 41         [ 4] 3605         CALL     COMPI
                           000001  3606 .if PICATOUT_MOD
      0092AA 42 4F                 3607         .word DONXT 
                           000000  3608 .else 
                                   3609         CALL     DONXT
                                   3610 .endif         
                           000001  3611 .if PICATOUT_MOD
      0092AC 52 54 0E         [ 4] 3612         call ADRADJ
                                   3613 .endif ; PICATOUT_MOD
      0092AE CC 13 7A         [ 2] 3614         JP     COMMA
                                   3615 
                                   3616 ;       I ( -- n )
                                   3617 ;       stack FOR-NEXT COUNTER 
      0092AE CD 93                 3618         .word LINK 
                           00142B  3619         LINK=.
      0092B0 A5                    3620         .byte 1 
      0092B1 CC                    3621         .ascii "I"
      00142D                       3622 IFETCH: 
      0092B2 93 C2 92         [ 2] 3623         subw x,#CELLL 
      0092B5 A8 46            [ 2] 3624         ldw y,(3,sp)
      0092B7 41               [ 2] 3625         ldw (x),y 
      0092B8 42               [ 4] 3626         ret 
                                   3627 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



                                   3628 ;       BEGIN   ( -- a )
                                   3629 ;       Start an infinite or
                                   3630 ;       indefinite loop structure.
      0092B9 4F 52                 3631         .word      LINK
                           001436  3632 LINK = . 
      0092BB 54                    3633 	.byte      IMEDD+5
      0092BC 22 45 47 49 4E        3634         .ascii     "BEGIN"
      0092BD                       3635 BEGIN:
      0092BD CD 83 F8         [ 2] 3636         JP     HERE
                                   3637 
                                   3638 ;       UNTIL   ( a -- )
                                   3639 ;       Terminate a BEGIN-UNTIL
                                   3640 ;       indefinite loop structure.
      0092C0 92 DC                 3641         .word      LINK
                           001441  3642 LINK = . 
      0092C2 CD                    3643 	.byte      IMEDD+5
      0092C3 8E B8 CD 8E 5A        3644         .ascii     "UNTIL"
      001447                       3645 UNTIL:
      0092C8 CD 8B 12         [ 4] 3646         CALL     COMPI
                           000001  3647 .if PICATOUT_MOD
      0092CB CD 8E                 3648         .word    QBRAN 
                           000000  3649 .else 
                                   3650         CALL     QBRAN
                                   3651 .endif 
                           000001  3652 .if PICATOUT_MOD 
      0092CD 84 CD 83         [ 4] 3653         call ADRADJ
                                   3654 .endif ; PICATOUT_MOD
      0092D0 C5 00 3F         [ 2] 3655         JP     COMMA
                                   3656 
                                   3657 ;       AGAIN   ( a -- )
                                   3658 ;       Terminate a BEGIN-AGAIN
                                   3659 ;       infinite loop structure.
      0092D3 CD 83                 3660         .word      LINK
                           001454  3661 LINK = . 
      0092D5 AF                    3662 	.byte      IMEDD+5
      0092D6 CD 8E A2 CC 92        3663         .ascii     "AGAIN"
      00145A                       3664 AGAIN:
      0092DB AE CD 8E         [ 4] 3665         CALL     COMPI
                           000001  3666 .if PICATOUT_MOD
      0092DE B8 CC                 3667         .word BRAN
                           000000  3668 .else
                                   3669         CALL     BRAN
                                   3670 .endif 
                           000001  3671 .if PICATOUT_MOD 
      0092E0 84 EA 92         [ 4] 3672         call ADRADJ 
                                   3673 .endif ; PICATOUT_MOD
      0092E3 B6 0A 24         [ 2] 3674         JP     COMMA
                                   3675 
                                   3676 ;       IF      ( -- A )
                                   3677 ;       Begin a conditional branch.
      0092E6 49 4E                 3678         .word      LINK
                           001467  3679 LINK = . 
      0092E8 54                    3680 	.byte      IMEDD+2
      0092E9 45 52                 3681         .ascii     "IF"
      00146A                       3682 IFF:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      0092EB 50 52 45         [ 4] 3683         CALL     COMPI
                           000001  3684 .if PICATOUT_MOD
      0092EE 54 78                 3685         .word QBRAN
                           000000  3686 .else
                                   3687         CALL     QBRAN
                                   3688 .endif 
      0092EF CD 0A A9         [ 4] 3689         CALL     HERE
      0092EF CD 91 B1         [ 4] 3690         CALL     ZERO
      0092F2 CD 86 9E         [ 2] 3691         JP     COMMA
                                   3692 
                                   3693 ;       THEN        ( A -- )
                                   3694 ;       Terminate a conditional branch structure.
      0092F5 CD 83                 3695         .word      LINK
                           00147A  3696 LINK = . 
      0092F7 F8                    3697 	.byte      IMEDD+4
      0092F8 93 19 CD 84           3698         .ascii     "THEN"
      00147F                       3699 THENN:
      0092FC 4D CD 83         [ 4] 3700         CALL     HERE
                           000001  3701 .if PICATOUT_MOD 
      0092FF C5 40 00         [ 4] 3702         call ADRADJ 
                                   3703 .endif ; PICATOUT_MOD
      009302 CD 85 40         [ 4] 3704         CALL     SWAPP
      009305 CD 92 BD         [ 2] 3705         JP     STORE
                                   3706 
                                   3707 ;       ELSE        ( A -- A )
                                   3708 ;       Start the false clause in an IF-ELSE-THEN structure.
      009308 0D 20                 3709         .word      LINK
                           00148D  3710 LINK = . 
      00930A 63                    3711 	.byte      IMEDD+4
      00930B 6F 6D 70 69           3712         .ascii     "ELSE"
      001492                       3713 ELSEE:
      00930F 6C 65 20         [ 4] 3714         CALL     COMPI
                           000001  3715 .if PICATOUT_MOD
      009312 6F 6E                 3716         .word BRAN
                           000000  3717 .else
                                   3718         CALL     BRAN
                                   3719 .endif 
      009314 6C 79 CC         [ 4] 3720         CALL     HERE
      009317 84 1F CD         [ 4] 3721         CALL     ZERO
      00931A 8D 4F CD         [ 4] 3722         CALL     COMMA
      00931D 83 F8 92         [ 4] 3723         CALL     SWAPP
      009320 C5 81 92         [ 4] 3724         CALL     HERE
                           000001  3725 .if PICATOUT_MOD 
      009323 E4 81 5B         [ 4] 3726         call ADRADJ 
                                   3727 .endif ; PICATOUT_MOD
      009326 CD 04 84         [ 4] 3728         CALL     SWAPP
      009326 CD 83 C5         [ 2] 3729         JP     STORE
                                   3730 
                                   3731 ;       AHEAD       ( -- A )
                                   3732 ;       Compile a forward branch instruction.
      009329 92 EF                 3733         .word      LINK
                           0014B1  3734 LINK = . 
      00932B CD                    3735 	.byte      IMEDD+5
      00932C 86 12 CC 84 36        3736         .ascii     "AHEAD"
      0014B7                       3737 AHEAD:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      009331 93 24 03         [ 4] 3738         CALL     COMPI
                           000001  3739 .if PICATOUT_MOD
      009334 2E 4F                 3740         .word BRAN
                           000000  3741 .else
                                   3742         CALL     BRAN
                                   3743 .endif 
      009336 4B 0A A9         [ 4] 3744         CALL     HERE
      009337 CD 09 BA         [ 4] 3745         CALL     ZERO
      009337 CD 83 C5         [ 2] 3746         JP     COMMA
                                   3747 
                                   3748 ;       WHILE       ( a -- A a )
                                   3749 ;       Conditional branch out of a BEGIN-WHILE-REPEAT loop.
      00933A 92 EF                 3750         .word      LINK
                           0014C7  3751 LINK = . 
      00933C CD                    3752 	.byte      IMEDD+5
      00933D 86 12 CD 84 4D        3753         .ascii     "WHILE"
      0014CD                       3754 WHILE:
      009342 CD 87 75         [ 4] 3755         CALL     COMPI
                           000001  3756 .if PICATOUT_MOD
      009345 CD 83                 3757         .word QBRAN
                           000000  3758 .else
                                   3759         CALL     QBRAN
                                   3760 .endif 
      009347 F8 93 51         [ 4] 3761         CALL     HERE
      00934A CD 8E E1         [ 4] 3762         CALL     ZERO
      00934D 03 20 6F         [ 4] 3763         CALL     COMMA
      009350 6B CC 8E         [ 2] 3764         JP     SWAPP
                                   3765 
                                   3766 ;       REPEAT      ( A a -- )
                                   3767 ;       Terminate a BEGIN-WHILE-REPEAT indefinite loop.
      009353 A2 93                 3768         .word      LINK
                           0014E0  3769 LINK = . 
      009355 33                    3770         .byte      IMEDD+6
      009356 06 3F 53 54 41 43     3771         .ascii     "REPEAT"
      0014E7                       3772 REPEA:
      00935C 4B 13 BF         [ 4] 3773         CALL     COMPI
                           000001  3774 .if PICATOUT_MOD
      00935D 03 8F                 3775         .word BRAN
                           000000  3776 .else
                                   3777         CALL     BRAN
                                   3778 .endif 
                           000001  3779 .if PICATOUT_MOD 
      00935D CD 8A 7D         [ 4] 3780         call ADRADJ 
                                   3781 .endif ; PICATOUT_MOD
      009360 CD 85 2D         [ 4] 3782         CALL     COMMA
      009363 CD 92 BD         [ 4] 3783         CALL     HERE
                           000001  3784 .if PICATOUT_MOD 
      009366 0B 20 75         [ 4] 3785         call ADRADJ 
                                   3786 .endif ; PICATOUT_MOD
      009369 6E 64 65         [ 4] 3787         CALL     SWAPP
      00936C 72 66 6C         [ 2] 3788         JP     STORE
                                   3789 
                                   3790 ;       AFT         ( a -- a A )
                                   3791 ;       Jump to THEN in a FOR-AFT-THEN-NEXT loop the first time through.
      00936F 6F 77                 3792         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



                           001500  3793 LINK = . 
      009371 20                    3794 	.byte      IMEDD+3
      009372 81 93 56              3795         .ascii     "AFT"
      001504                       3796 AFT:
      009375 04 45 56         [ 4] 3797         CALL     DROP
      009378 41 4C B7         [ 4] 3798         CALL     AHEAD
      00937A CD 0A A9         [ 4] 3799         CALL     HERE
      00937A CD 90 B4         [ 2] 3800         JP     SWAPP
                                   3801 
                                   3802 ;       ABORT"      ( -- ; <string> )
                                   3803 ;       Conditional abort with an error message.
      00937D CD 84                 3804         .word      LINK
                           001512  3805 LINK = . 
      00937F F4                    3806 	.byte      IMEDD+6
      009380 CD 84 6B CD 83        3807         .ascii     "ABORT"
      009385 F8                    3808         .byte      '"'
      001519                       3809 ABRTQ:
      009386 93 96 CD         [ 4] 3810         CALL     COMPI
                           000001  3811 .if PICATOUT_MOD
      009389 86 12                 3812         .word ABORQ
                           000000  3813 .else
                                   3814         CALL     ABORQ
                                   3815 .endif
      00938B CD 8B 5F         [ 2] 3816         JP     STRCQ
                                   3817 
                                   3818 ;       $"     ( -- ; <string> )
                                   3819 ;       Compile an inline string literal.
      00938E CD 93                 3820         .word      LINK
                           001523  3821 LINK = . 
      009390 5D                    3822 	.byte      IMEDD+2
      009391 CD 84                 3823         .byte     '$','"'
      001526                       3824 STRQ:
      009393 0F 93 7A         [ 4] 3825         CALL     COMPI
                           000001  3826 .if PICATOUT_MOD
      009396 CD 84                 3827         .word STRQP 
                           000000  3828 .else
                                   3829         CALL     STRQP
                                   3830 .endif
      009398 EA CC 93         [ 2] 3831         JP     STRCQ
                                   3832 
                                   3833 ;       ."          ( -- ; <string> )
                                   3834 ;       Compile an inline string literal to be typed out at run time.
      00939B 37 93                 3835         .word      LINK
                           001530  3836 LINK = . 
      00939D 75                    3837 	.byte      IMEDD+2
      00939E 06 50                 3838         .byte     '.','"'
      001533                       3839 DOTQ:
      0093A0 52 45 53         [ 4] 3840         CALL     COMPI
                           000001  3841 .if PICATOUT_MOD
      0093A3 45 54                 3842         .word DOTQP 
                           000000  3843 .else
                                   3844         CALL     DOTQP
                                   3845 .endif 
      0093A5 CC 13 EF         [ 2] 3846         JP     STRCQ
                                   3847 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



                                   3848 ;; Name compiler
                                   3849 
                                   3850 ;       ?UNIQUE ( a -- a )
                                   3851 ;       Display a warning message
                                   3852 ;       if word already exists.
      0093A5 CD 83                 3853         .word      LINK
                           00153D  3854 LINK = . 
      0093A7 C5                    3855         .byte      7
      0093A8 16 80 CD 84 E1 CD 83  3856         .ascii     "?UNIQUE"
      001545                       3857 UNIQU:
      0093AF C5 17 00         [ 4] 3858         CALL     DUPP
      0093B2 CD 85 DF         [ 4] 3859         CALL     NAMEQ   ;?name exists
      0093B5 CD 89 A3         [ 4] 3860         CALL     QBRAN
      0093B8 CC 84                 3861         .word      UNIQ1
      0093BA 36 93 9E         [ 4] 3862         CALL     DOTQP   ;redef are OK
      0093BD 04                    3863         .byte       7
      0093BE 51 55 49 54 65 66 20  3864         .ascii     " reDef "       
      0093C2 CD 04 9E         [ 4] 3865         CALL     OVER
      0093C2 CD 83 C5         [ 4] 3866         CALL     COUNT
      0093C5 17 FF CD         [ 4] 3867         CALL     TYPES   ;just in case
      0093C8 84 88 CD         [ 2] 3868 UNIQ1:  JP     DROP
                                   3869 
                                   3870 ;       $,n     ( na -- )
                                   3871 ;       Build a new dictionary name
                                   3872 ;       using string at na.
                           000001  3873 .if PICATOUT_MOD
                                   3874 ; compile dans l'espace des variables 
                                   3875 .endif 
      0093CB 93 26                 3876         .word      LINK
                           001569  3877 LINK = . 
      0093CD CD                    3878         .byte      3
      0093CE 92 89 CD              3879         .ascii     "$,n"
      00156D                       3880 SNAME:
      0093D1 93 7A 20         [ 4] 3881         CALL     DUPP
      0093D4 F8 93 BD         [ 4] 3882         CALL     CAT     ;?null input
      0093D7 01 27 78         [ 4] 3883         CALL     QBRAN
      0093D9 15 A3                 3884         .word      PNAM1
      0093D9 CD 90 B4         [ 4] 3885         CALL     UNIQU   ;?redefinition
      0093DC CD 91 B1         [ 4] 3886         CALL     DUPP
      0093DF CD 83 F8         [ 4] 3887         CALL     COUNT
      0093E2 92 C5 81         [ 4] 3888         CALL     PLUS
      0093E5 93 D7 05         [ 4] 3889         CALL     VPP
      0093E8 41 4C 4C         [ 4] 3890         CALL     STORE
      0093EB 4F 54 74         [ 4] 3891         CALL     DUPP
      0093ED CD 05 E0         [ 4] 3892         CALL     LAST
      0093ED CD 86 42         [ 4] 3893         CALL     STORE   ;save na for vocabulary link
      0093F0 CD 8A AB         [ 4] 3894         CALL     CELLM   ;link address
      0093F3 CC 9A D4         [ 4] 3895         CALL     CNTXT
      0093F6 93 E7 01         [ 4] 3896         CALL     AT
      0093F9 2C 04 84         [ 4] 3897         CALL     SWAPP
      0093FA CD 03 B6         [ 4] 3898         CALL     STORE
      0093FA CD               [ 4] 3899         RET     ;save code pointer
      0093FB 8B 29 CD         [ 4] 3900 PNAM1:  CALL     STRQP
      0093FE 84                    3901         .byte      5
      0093FF F4 CD 89 A3 CD        3902         .ascii     " name" ;null input
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



      009404 86 42 CD         [ 2] 3903         JP     ABOR1
                                   3904 
                                   3905 ;; FORTH compiler
                                   3906 
                                   3907 ;       $COMPILE        ( a -- )
                                   3908 ;       Compile next word to
                                   3909 ;       dictionary as a token or literal.
      009407 84 36                 3910         .word      LINK
                           0015B1  3911 LINK = . 
      009409 CC                    3912         .byte      8
      00940A 84 36 93 F8 02 43 2C  3913         .ascii     "$COMPILE"
             45
      009411                       3914 SCOMP:
      009411 CD 8B 29         [ 4] 3915         CALL     NAMEQ
      009414 CD 84 F4         [ 4] 3916         CALL     QDUP    ;?defined
      009417 CD 89 CE         [ 4] 3917         CALL     QBRAN
      00941A CD 86                 3918         .word      SCOM2
      00941C 42 CD 84         [ 4] 3919         CALL     AT
      00941F 36 CC 84         [ 4] 3920         CALL     DOLIT
      009422 5A 94                 3921         .word     0x8000	;  IMEDD*256
      009424 0E 89 5B         [ 4] 3922         CALL     ANDD    ;?immediate
      009427 43 4F 4D         [ 4] 3923         CALL     QBRAN
      00942A 50 49                 3924         .word      SCOM1
      00942C 4C 45 5D         [ 2] 3925         JP     EXECU
      00942F CC 16 72         [ 2] 3926 SCOM1:  JP     JSRC
      00942F CD 93 D9         [ 4] 3927 SCOM2:  CALL     NUMBQ   ;try to convert to number
      009432 CC 96 F2         [ 4] 3928         CALL     QBRAN
      009435 94 25                 3929         .word      ABOR1
      009437 47 43 4F         [ 2] 3930         JP     LITER
                                   3931 
                                   3932 ;       OVERT   ( -- )
                                   3933 ;       Link a new word into vocabulary.
      00943A 4D 50                 3934         .word      LINK
                           0015E8  3935 LINK = . 
      00943C 49                    3936         .byte      5
      00943D 4C 45 45 52 54        3937         .ascii     "OVERT"
      00943F                       3938 OVERT:
      00943F CD 84 9E         [ 4] 3939         CALL     LAST
      009442 CD 84 F4         [ 4] 3940         CALL     AT
      009445 CD 84 4D         [ 4] 3941         CALL     CNTXT
      009448 CD 96 F2         [ 2] 3942         JP     STORE
                                   3943 
                                   3944 ;       ;       ( -- )
                                   3945 ;       Terminate a colon definition.
      00944B CD 89                 3946         .word      LINK
                           0015FC  3947 LINK = . 
      00944D A3                    3948 	.byte      IMEDD+COMPO+1
      00944E 90                    3949         .ascii     ";"
      0015FE                       3950 SEMIS:
      00944F 93 90 FE         [ 4] 3951         CALL     COMPI
                           000001  3952 .if PICATOUT_MOD
      009452 1C 00                 3953         .word EXIT 
                           000000  3954 .else
                                   3955         CALL     EXIT
                                   3956 .endif 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      009454 02 90 FC         [ 4] 3957         CALL     LBRAC
                           000001  3958 .if PICATOUT_MOD
      009457 94 37 87         [ 4] 3959         call OVERT 
      00945A 4C 49 54         [ 4] 3960         CALL FMOVE
      00945D 45 52 41         [ 4] 3961         call QDUP 
      009460 4C 03 78         [ 4] 3962         call QBRAN 
      009461 17 42                 3963         .word SET_RAMLAST 
      009461 CD 94 3F         [ 4] 3964         CALL UPDATPTR 
      009464 83               [ 4] 3965 1$:     RET 
                           000000  3966 .else 
                                   3967         JP     OVERT
                                   3968 .endif 
                                   3969 
                           000001  3970 .if PICATOUT_MOD
                                   3971 ;       Terminate an ISR definition 
                                   3972 ;       retourn ca of ISR as double
                                   3973 ;       I; ( -- ud )
      009465 C5 CC                 3974         .word LINK 
                           00161A  3975         LINK=.
      009467 93                    3976         .byte 2+IMEDD+COMPO 
      009468 FA 94                 3977         .ascii "I;" 
      00161D                       3978 ISEMI:
      00946A 59 03 24         [ 2] 3979         subw x,#CELLL  
      00946D 2C 22 00 80      [ 2] 3980         ldw y,#IRET_CODE 
      00946F FF               [ 2] 3981         ldw (x),y 
      00946F CD 83 C5         [ 4] 3982         call CCOMMA
      009472 00 22 CD         [ 4] 3983         call LBRAC 
      009475 90 37 CD         [ 4] 3984         call IFMOVE
      009478 8B 29 CD         [ 4] 3985         call QDUP 
      00947B 8B EA CD         [ 4] 3986         CALL QBRAN 
      00947E 8B 12                 3987         .word SET_RAMLAST
      009480 CD 86 EF         [ 4] 3988         CALL CPP
      009483 CD 86 42         [ 4] 3989         call AT 
      009486 CC 84 36         [ 4] 3990         call SWAPP 
      009489 94 6B 83         [ 4] 3991         CALL CPP 
      00948C 46 4F 52         [ 4] 3992         call STORE 
      00948F CD 1A 3D         [ 4] 3993         call UPDATCP 
      00948F CD 94 3F         [ 4] 3994         call EEPVP 
      009492 84 BD CC         [ 4] 3995         call DROP 
      009495 8B 29 94         [ 4] 3996         call AT 
      009498 8B 84 4E         [ 4] 3997         call VPP 
      00949B 45 58 54         [ 4] 3998         call STORE 
      00949E CC 09 BA         [ 2] 3999         jp ZERO
      00949E CD               [ 4] 4000         ret           
                                   4001         
                                   4002 .endif ;PICATOUT_MOD
                                   4003 
                                   4004 ;       ]       ( -- )
                                   4005 ;       Start compiling words in
                                   4006 ;       input stream.
      00949F 94 3F                 4007         .word      LINK
                           00165D  4008 LINK = . 
      0094A1 83                    4009         .byte      1
      0094A2 D9                    4010         .ascii     "]"
      00165F                       4011 RBRAC:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      0094A3 CD 86 8E         [ 4] 4012         CALL   DOLIT
      0094A6 CC 93                 4013         .word  SCOMP
      0094A8 FA 94 99         [ 4] 4014         CALL   TEVAL
      0094AB 01 49 B6         [ 2] 4015         JP     STORE
                                   4016 
                                   4017 ;       CALL,    ( ca -- )
                                   4018 ;       Compile a subroutine call.
      0094AD 16 5D                 4019         .word      LINK
                           00166C  4020 LINK = . 
      0094AD 1D                    4021         .byte      5
      0094AE 00 02 16 03 FF        4022         .ascii     "CALL,"
      001672                       4023 JSRC:
      0094B3 81 94 AB         [ 4] 4024         CALL     DOLIT
      0094B6 85 42                 4025         .word     CALLL     ;CALL
      0094B8 45 47 49         [ 4] 4026         CALL     CCOMMA
      0094BB 4E 13 7A         [ 2] 4027         JP     COMMA
                                   4028 
                           000001  4029 .if PICATOUT_MOD
                                   4030 ;       INIT-OFS ( -- )
                                   4031 ;       compute offset to adjust jump address 
                                   4032 ;       set variable OFFSET 
      0094BC 16 6C                 4033         .word LINK 
                           00167F  4034         LINK=.
      0094BC CC                    4035         .byte 8 
      0094BD 8B 29 94 B6 85 55 4E  4036         .ascii "INIT-OFS" 
             54
      001688                       4037 INITOFS:
      0094C5 49 4C 81         [ 4] 4038         call TFLASH 
      0094C7 CD 03 CD         [ 4] 4039         CALL AT 
      0094C7 CD 94 3F         [ 4] 4040         CALL DUPP 
      0094CA 83 F8 CD         [ 4] 4041         call QBRAN
      0094CD 86 8E                 4042         .word 1$
      0094CF CC 93 FA         [ 4] 4043         call DROP  
      0094D2 94 C1 85         [ 4] 4044         call CPP 
      0094D5 41 47 41         [ 4] 4045         call AT 
      0094D8 49 4E A9         [ 4] 4046         call HERE
      0094DA CD 06 CD         [ 4] 4047         call SUBB 
      0094DA CD 94 3F         [ 4] 4048 1$:     call OFFSET 
      0094DD 84 0F CD         [ 2] 4049         jp STORE  
                                   4050 .endif 
                                   4051 
                                   4052 ;       :       ( -- ; <string> )
                                   4053 ;       Start a new colon definition
                                   4054 ;       using next word as its name.
      0094E0 86 8E                 4055         .word      LINK
                           0016AD  4056 LINK = . 
      0094E2 CC                    4057         .byte      1
      0094E3 93                    4058         .ascii     ":"
      0016AF                       4059 COLON:
                           000001  4060 .if PICATOUT_MOD
      0094E4 FA 94 D4         [ 4] 4061         call INITOFS       
                                   4062 .endif ; PICATOUT_MOD
      0094E7 82 49 46         [ 4] 4063         CALL   TOKEN
      0094EA CD 15 6D         [ 4] 4064         CALL   SNAME
      0094EA CD 94 3F         [ 2] 4065         JP     RBRAC
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



                                   4066 
                           000001  4067 .if PICATOUT_MOD 
                                   4068 ;       I:  ( -- )
                                   4069 ;       Start interrupt service routine definition
                                   4070 ;       those definition have no name.
      0094ED 83 F8                 4071         .word LINK
                           0016BD  4072         LINK=.
      0094EF CD                    4073         .byte 2 
      0094F0 8B 29                 4074         .ascii "I:" 
      0016C0                       4075 ICOLON:
      0094F2 CD 8A 3A         [ 4] 4076         call INITOFS 
      0094F5 CC 93 FA         [ 2] 4077         jp RBRAC  
                                   4078 .endif ; PICATOUT_MOD
                                   4079 
                                   4080 ;       IMMEDIATE       ( -- )
                                   4081 ;       Make last compiled word
                                   4082 ;       an immediate word.
      0094F8 94 E7                 4083         .word      LINK
                           0016C8  4084 LINK = . 
      0094FA 84                    4085         .byte      9
      0094FB 54 48 45 4E 44 49 41  4086         .ascii     "IMMEDIATE"
             54 45
      0094FF                       4087 IMMED:
      0094FF CD 8B 29         [ 4] 4088         CALL     DOLIT
      009502 CD 86                 4089         .word     0x8000	;  IMEDD*256
      009504 8E CD 85         [ 4] 4090         CALL     LAST
      009507 04 CC 84         [ 4] 4091         CALL     AT
      00950A 36 94 FA         [ 4] 4092         CALL     AT
      00950D 84 45 4C         [ 4] 4093         CALL     ORR
      009510 53 45 E0         [ 4] 4094         CALL     LAST
      009512 CD 03 CD         [ 4] 4095         CALL     AT
      009512 CD 94 3F         [ 2] 4096         JP     STORE
                                   4097 
                                   4098 ;; Defining words
                                   4099 
                                   4100 ;       CREATE  ( -- ; <string> )
                                   4101 ;       Compile a new array
                                   4102 ;       without allocating space.
      009515 84 0F                 4103         .word      LINK
                           0016EE  4104 LINK = . 
      009517 CD                    4105         .byte      6
      009518 8B 29 CD 8A 3A CD     4106         .ascii     "CREATE"
      0016F5                       4107 CREAT:
      00951E 93 FA CD         [ 4] 4108         CALL     TOKEN
      009521 85 04 CD         [ 4] 4109         CALL     SNAME
      009524 8B 29 CD         [ 4] 4110         CALL     OVERT        
      009527 86 8E CD         [ 4] 4111         CALL     COMPI 
                           000001  4112 .if PICATOUT_MOD
      00952A 85 04                 4113         .word DOVAR 
                           000000  4114 .else
                                   4115         CALL     DOVAR
                                   4116 .endif 
      00952C CC               [ 4] 4117         RET
                                   4118 
                                   4119 ;       VARIABLE        ( -- ; <string> )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



                                   4120 ;       Compile a new variable
                                   4121 ;       initialized to 0.
      00952D 84 36                 4122         .word      LINK
                           001706  4123 LINK = . 
      00952F 95                    4124         .byte      8
      009530 0D 85 41 48 45 41 44  4125         .ascii     "VARIABLE"
             45
      009537                       4126 VARIA:
                           000001  4127 .if PICATOUT_MOD
                                   4128 ; indirect variable so that VARIABLE definition can be compiled in FLASH 
      009537 CD 94 3F         [ 4] 4129         CALL HERE
      00953A 84 0F CD         [ 4] 4130         CALL DUPP 
      00953D 8B 29 CD         [ 4] 4131         CALL CELLP
      009540 8A 3A CC         [ 4] 4132         CALL VPP 
      009543 93 FA 95         [ 4] 4133         CALL STORE
                                   4134 .endif         
      009546 31 85 57         [ 4] 4135         CALL CREAT
      009549 48 49 4C         [ 4] 4136         CALL DUPP
      00954C 45 13 7A         [ 4] 4137         CALL COMMA
      00954D CD 09 BA         [ 4] 4138         CALL ZERO
                           000001  4139 .if PICATOUT_MOD 
      00954D CD 94 3F         [ 4] 4140         call SWAPP 
      009550 83 F8 CD         [ 4] 4141         CALL STORE
      009553 8B 29 CD         [ 4] 4142         CALL FMOVE ; move definition to FLASH
      009556 8A 3A CD         [ 4] 4143         CALL QDUP 
      009559 93 FA CC         [ 4] 4144         CALL QBRAN 
      00955C 85 04                 4145         .word SET_RAMLAST   
      00955E 95 47 86         [ 4] 4146         call UPDATVP  ; don't update if variable kept in RAM.
      009561 52 45 50         [ 4] 4147         CALL UPDATPTR
      009564 45               [ 4] 4148         RET         
      001742                       4149 SET_RAMLAST: 
      009565 41 54 E0         [ 4] 4150         CALL LAST 
      009567 CD 03 CD         [ 4] 4151         CALL AT 
      009567 CD 94 3F         [ 4] 4152         CALL RAMLAST 
      00956A 84 0F CD         [ 2] 4153         jp STORE  
                                   4154 
                                   4155 .endif ;PICATOUT_MOD        
                                   4156 
                           000001  4157 .if PICATOUT_MOD
                                   4158 ;       CONSTANT  ( n -- ; <string> )
                                   4159 ;       Compile a new constant 
                                   4160 ;       n CONSTANT name 
      00956D 86 8E                 4161         .word LINK 
                           001750  4162         LINK=. 
      00956F CD                    4163         .byte 8 
      009570 93 FA CD 8B 29 CD 86  4164         .ascii "CONSTANT" 
             8E
      001759                       4165 CONSTANT:          
      009578 CD 85 04         [ 4] 4166         CALL TOKEN
      00957B CC 84 36         [ 4] 4167         CALL SNAME 
      00957E 95 60 83         [ 4] 4168         CALL OVERT 
      009581 41 46 54         [ 4] 4169         CALL COMPI 
                           000001  4170 .if PICATOUT_MOD
      009584 17 83                 4171         .word DOCONST
                           000000  4172 .else
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



                                   4173         CALL DOCONST
                                   4174 .endif 
      009584 CD 84 EA         [ 4] 4175         CALL COMMA 
      009587 CD 95 37         [ 4] 4176         CALL FMOVE
      00958A CD 8B 29         [ 4] 4177         CALL QDUP 
      00958D CC 85 04         [ 4] 4178         CALL QBRAN 
      009590 95 80                 4179         .word SET_RAMLAST  
      009592 86 41 42         [ 4] 4180         CALL UPDATPTR  
      009595 4F               [ 4] 4181 1$:     RET          
                                   4182 
                                   4183 ; CONSTANT runtime semantic 
                                   4184 ; doCONST  ( -- n )
      009596 52 54                 4185         .word LINK 
                           00177B  4186         LINK=.
      009598 22                    4187         .byte 7
      009599 44 4F 43 4F 4E 53 54  4188         .ascii "DOCONST"
      001783                       4189 DOCONST:
      009599 CD 94 3F         [ 2] 4190         subw x,#CELLL
      00959C 92 BD            [ 2] 4191         popw y 
      00959E CC 94            [ 2] 4192         ldw y,(y) 
      0095A0 6F               [ 2] 4193         ldw (x),y 
      0095A1 95               [ 4] 4194         ret 
                                   4195 .endif ;PICATOUT_MOD
                                   4196 
                                   4197 
                                   4198 ;; Tools
                                   4199 
                                   4200 ;       _TYPE   ( b u -- )
                                   4201 ;       Display a string. Filter
                                   4202 ;       non-printing characters.
      0095A2 92 82                 4203         .word      LINK
                           00178E  4204 LINK = . 
      0095A4 24                    4205         .byte      5
      0095A5 22 54 59 50 45        4206         .ascii     "_TYPE"
      0095A6                       4207 UTYPE:
      0095A6 CD 94 3F         [ 4] 4208         CALL     TOR     ;start count down loop
      0095A9 8E D7            [ 2] 4209         JRA     UTYP2   ;skip first pass
      0095AB CC 94 6F         [ 4] 4210 UTYP1:  CALL     DUPP
      0095AE 95 A3 82         [ 4] 4211         CALL     CAT
      0095B1 2E 22 E4         [ 4] 4212         CALL     TCHAR
      0095B3 CD 03 2F         [ 4] 4213         CALL     EMIT    ;display only printable
      0095B3 CD 94 3F         [ 4] 4214         CALL     ONEP    ;increment address
      0095B6 8E E1 CC         [ 4] 4215 UTYP2:  CALL     DONXT
      0095B9 94 6F                 4216         .word      UTYP1   ;loop till done
      0095BB 95 B0 07         [ 2] 4217         JP     DROP
                                   4218 
                                   4219 ;       dm+     ( a u -- a )
                                   4220 ;       Dump u bytes from ,
                                   4221 ;       leaving a+u on  stack.
      0095BE 3F 55                 4222         .word      LINK
                           0017B2  4223 LINK = . 
      0095C0 4E                    4224         .byte      3
      0095C1 49 51 55              4225         .ascii     "dm+"
      0017B6                       4226 DUMPP:
      0095C4 45 04 9E         [ 4] 4227         CALL     OVER
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



      0095C5 CD 03 45         [ 4] 4228         CALL     DOLIT
      0095C5 CD 84                 4229         .word      4
      0095C7 F4 CD 91         [ 4] 4230         CALL     UDOTR   ;display address
      0095CA B1 CD 83         [ 4] 4231         CALL     SPACE
      0095CD F8 95 E4         [ 4] 4232         CALL     TOR     ;start count down loop
      0095D0 CD 8E            [ 2] 4233         JRA     PDUM2   ;skip first pass
      0095D2 E1 07 20         [ 4] 4234 PDUM1:  CALL     DUPP
      0095D5 72 65 44         [ 4] 4235         CALL     CAT
      0095D8 65 66 20         [ 4] 4236         CALL     DOLIT
      0095DB CD 85                 4237         .word      3
      0095DD 1E CD 8B         [ 4] 4238         CALL     UDOTR   ;display numeric data
      0095E0 12 CD 8E         [ 4] 4239         CALL     ONEP    ;increment address
      0095E3 84 CC 84         [ 4] 4240 PDUM2:  CALL     DONXT
      0095E6 EA 95                 4241         .word      PDUM1   ;loop till done
      0095E8 BD               [ 4] 4242         RET
                                   4243 
                                   4244 ;       DUMP    ( a u -- )
                                   4245 ;       Dump u bytes from a,
                                   4246 ;       in a formatted manner.
      0095E9 03 24                 4247         .word      LINK
                           0017E2  4248 LINK = . 
      0095EB 2C                    4249         .byte      4
      0095EC 6E 55 4D 50           4250         .ascii     "DUMP"
      0095ED                       4251 DUMP:
      0095ED CD 84 F4         [ 4] 4252         CALL     BASE
      0095F0 CD 84 6B         [ 4] 4253         CALL     AT
      0095F3 CD 83 F8         [ 4] 4254         CALL     TOR
      0095F6 96 23 CD         [ 4] 4255         CALL     HEX     ;save radix, set hex
      0095F9 95 C5 CD         [ 4] 4256         CALL     DOLIT
      0095FC 84 F4                 4257         .word      16
      0095FE CD 8B 12         [ 4] 4258         CALL     SLASH   ;change count to lines
      009601 CD 86 EF         [ 4] 4259         CALL     TOR     ;start count down loop
      009604 CD 86 42         [ 4] 4260 DUMP1:  CALL     CR
      009607 CD 84 36         [ 4] 4261         CALL     DOLIT
      00960A CD 84                 4262         .word      16
      00960C F4 CD 86         [ 4] 4263         CALL     DDUP
      00960F 60 CD 84         [ 4] 4264         CALL     DUMPP   ;display numeric
      009612 36 CD 89         [ 4] 4265         CALL     ROT
      009615 B2 CD 86         [ 4] 4266         CALL     ROT
      009618 34 CD 84         [ 4] 4267         CALL     SPACE
      00961B 4D CD 85         [ 4] 4268         CALL     SPACE
      00961E 04 CD 84         [ 4] 4269         CALL     UTYPE   ;display printable characters
      009621 36 81 CD         [ 4] 4270         CALL     DONXT
      009624 8E D7                 4271         .word      DUMP1   ;loop till done
      009626 05 20 6E         [ 4] 4272 DUMP3:  CALL     DROP
      009629 61 6D 65         [ 4] 4273         CALL     RFROM
      00962C CC 92 C5         [ 4] 4274         CALL     BASE
      00962F 95 E9 08         [ 2] 4275         JP     STORE   ;restore radix
                                   4276 
                                   4277 ;       .S      ( ... -- ... )
                                   4278 ;        Display  contents of stack.
      009632 24 43                 4279         .word      LINK
                           00182E  4280 LINK = . 
      009634 4F                    4281         .byte      2
      009635 4D 50                 4282         .ascii     ".S"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



      001831                       4283 DOTS:
      009637 49 4C 45         [ 4] 4284         CALL     CR
      00963A CD 09 FD         [ 4] 4285         CALL     DEPTH   ;stack depth
      00963A CD 91 B1         [ 4] 4286         CALL     TOR     ;start count down loop
      00963D CD 86            [ 2] 4287         JRA     DOTS2   ;skip first pass
      00963F 9E CD 83         [ 4] 4288 DOTS1:  CALL     RAT
                           000001  4289 .if PICATOUT_MOD
                                   4290 ; Not required following modification I made To PICK 
                                   4291 ;        CALL ONEP
                                   4292 .endif 
      009642 F8 96 5B         [ 4] 4293 	CALL     PICK
      009645 CD 84 4D         [ 4] 4294         CALL     DOT     ;index stack, display contents
      009648 CD 83 C5         [ 4] 4295 DOTS2:  CALL     DONXT
      00964B 80 00                 4296         .word      DOTS1   ;loop till done
      00964D CD 85 40         [ 4] 4297         CALL     DOTQP
      009650 CD                    4298         .byte      5
      009651 83 F8 96 58 CC        4299         .ascii     " <sp "
      009656 84               [ 4] 4300         RET
                                   4301 
                                   4302 ;       >NAME   ( ca -- na | F )
                                   4303 ;       Convert code address
                                   4304 ;       to a name address.
      009657 1F CC                 4305         .word      LINK
                           001856  4306 LINK = . 
      009659 96                    4307         .byte      5
      00965A F2 CD 8D 4F CD        4308         .ascii     ">NAME"
      00185C                       4309 TNAME:
      00965F 83 F8 92         [ 4] 4310         CALL     CNTXT   ;vocabulary link
      009662 C5 CC 94         [ 4] 4311 TNAM2:  CALL     AT
      009665 61 96 31         [ 4] 4312         CALL     DUPP    ;?last word in a vocabulary
      009668 05 4F 56         [ 4] 4313         CALL     QBRAN
      00966B 45 52                 4314         .word      TNAM4
      00966D 54 06 5A         [ 4] 4315         CALL     DDUP
      00966E CD 10 42         [ 4] 4316         CALL     NAMET
      00966E CD 86 60         [ 4] 4317         CALL     XORR    ;compare
      009671 CD 84 4D         [ 4] 4318         CALL     QBRAN
      009674 CD 86                 4319         .word      TNAM3
      009676 34 CC 84         [ 4] 4320         CALL     CELLM   ;continue with next word
      009679 36 96            [ 2] 4321         JRA     TNAM2
      00967B 68 C1 3B         [ 4] 4322 TNAM3:  CALL     SWAPP
      00967E CC 04 6A         [ 2] 4323         JP     DROP
      00967E CD 94 3F         [ 4] 4324 TNAM4:  CALL     DDROP
      009681 84 2F CD         [ 2] 4325         JP     ZERO
                                   4326 
                                   4327 ;       .ID     ( na -- )
                                   4328 ;        Display  name at address.
      009684 93 26                 4329         .word      LINK
                           00188B  4330 LINK = . 
      009686 CD                    4331         .byte      3
      009687 96 6E CD              4332         .ascii     ".ID"
      00188F                       4333 DOTID:
      00968A 9F A0 CD         [ 4] 4334         CALL     QDUP    ;if zero no name
      00968D 86 9E CD         [ 4] 4335         CALL     QBRAN
      009690 83 F8                 4336         .word      DOTI1
      009692 97 C2 CD         [ 4] 4337         CALL     COUNT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



      009695 A0 34 81         [ 4] 4338         CALL     DOLIT
      009698 96 7C                 4339         .word      0x1F
      00969A C2 49 3B         [ 4] 4340         CALL     ANDD    ;mask lexicon bits
      00969D CC 17 94         [ 2] 4341         JP     UTYPE
      00969D 1D 00 02         [ 4] 4342 DOTI1:  CALL     DOTQP
      0096A0 90                    4343         .byte      9
      0096A1 AE 00 80 FF CD 94 11  4344         .ascii     " noName"
      0096A8 CD               [ 4] 4345         RET
                                   4346 
                           000000  4347 WANT_SEE=0 
                           000000  4348 .if WANT_SEE 
                                   4349 ;       SEE     ( -- ; <string> )
                                   4350 ;       A simple decompiler.
                                   4351 ;       Updated for byte machines.
                                   4352         .word      LINK
                                   4353 LINK = . 
                                   4354         .byte      3
                                   4355         .ascii     "SEE"
                                   4356 SEE:
                                   4357         CALL     TICK    ;starting address
                                   4358         CALL     CR
                                   4359         CALL     ONEM
                                   4360 SEE1:   CALL     ONEP
                                   4361         CALL     DUPP
                                   4362         CALL     AT
                                   4363         CALL     DUPP    ;?does it contain a zero
                                   4364         CALL     QBRAN
                                   4365         .word    SEE2
                                   4366         CALL     TNAME   ;?is it a name
                                   4367 SEE2:   CALL     QDUP    ;name address or zero
                                   4368         CALL     QBRAN
                                   4369         .word    SEE3
                                   4370         CALL     SPACE
                                   4371         CALL     DOTID   ;display name
                                   4372         CALL     ONEP
                                   4373         JRA      SEE4
                                   4374 SEE3:   CALL     DUPP
                                   4375         CALL     CAT
                                   4376         CALL     UDOT    ;display number
                                   4377 SEE4:   CALL     NUFQ    ;user control
                                   4378         CALL     QBRAN
                                   4379         .word    SEE1
                                   4380         JP     DROP
                                   4381 .endif ; WANT_SEE 
                                   4382 
                                   4383 ;       WORDS   ( -- )
                                   4384 ;       Display names in vocabulary.
      0096A9 93 26                 4385         .word      LINK
                           0018B3  4386 LINK = . 
      0096AB CD                    4387         .byte      5
      0096AC A0 79 CD 86 9E        4388         .ascii     "WORDS"
      0018B9                       4389 WORDS:
      0096B1 CD 83 F8         [ 4] 4390         CALL     CR
      0096B4 97 C2 CD         [ 4] 4391         CALL     CNTXT   ;only in context
      0096B7 86 50 CD         [ 4] 4392 WORS1:  CALL     AT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



      0096BA 84 4D CD         [ 4] 4393         CALL     QDUP    ;?at end of list
      0096BD 85 04 CD         [ 4] 4394         CALL     QBRAN
      0096C0 86 50                 4395         .word      WORS2
      0096C2 CD 84 36         [ 4] 4396         CALL     DUPP
      0096C5 CD 9A BD         [ 4] 4397         CALL     SPACE
      0096C8 CD 9A 7A         [ 4] 4398         CALL     DOTID   ;display a name
      0096CB CD 84 EA         [ 4] 4399         CALL     CELLM
      0096CE CD 84 4D         [ 4] 4400         CALL     BRAN
      0096D1 CD 86                 4401         .word      WORS1
      0096D3 42 CD 84         [ 4] 4402         CALL     DROP
      0096D6 36               [ 4] 4403 WORS2:  RET
                                   4404 
                                   4405         
                                   4406 ;; Hardware reset
                                   4407 
                                   4408 ;       hi      ( -- )
                                   4409 ;       Display sign-on message.
      0096D7 CC 8A                 4410         .word      LINK
                           0018E1  4411 LINK = . 
      0096D9 3A                    4412         .byte      2
      0096DA 81 96                 4413         .ascii     "hi"
      0018E4                       4414 HI:
      0096DC 9A 01 5D         [ 4] 4415         CALL     CR
      0096DF CD 0E 61         [ 4] 4416         CALL     DOTQP   ;initialize I/O
      0096DF CD                    4417         .byte      15
      0096E0 83 C5 96 3A CD 86 12  4418         .ascii     "stm8eForth v"
             CC 84 36 96 DD
      0096EC 05                    4419 	.byte      VER+'0'
      0096ED 43                    4420         .byte      '.' 
      0096EE 41                    4421 	.byte      EXT+'0' ;version
      0096EF 4C 4C 2C         [ 2] 4422         JP     CR
                                   4423 
                           000000  4424 WANT_DEBUG=0
                           000000  4425 .if WANT_DEBUG 
                                   4426 ;       DEBUG      ( -- )
                                   4427 ;       Display sign-on message.
                                   4428 ;        .word      LINK
                                   4429 LINK = . 
                                   4430         .byte      5
                                   4431         .ascii     "DEBUG"
                                   4432 DEBUG:
                                   4433 	CALL DOLIT
                                   4434 	.word 0x65
                                   4435 	CALL EMIT
                                   4436 	CALL DOLIT
                                   4437 	.word 0
                                   4438  	CALL ZLESS 
                                   4439 	CALL DOLIT
                                   4440 	.word 0xFFFE
                                   4441 	CALL ZLESS 
                                   4442 	CALL UPLUS 
                                   4443  	CALL DROP 
                                   4444 	CALL DOLIT
                                   4445 	.word 3
                                   4446 	CALL UPLUS 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



                                   4447 	CALL UPLUS 
                                   4448  	CALL DROP
                                   4449 	CALL DOLIT
                                   4450 	.word 0x43
                                   4451 	CALL UPLUS 
                                   4452  	CALL DROP
                                   4453 	CALL EMIT
                                   4454 	CALL DOLIT
                                   4455 	.word 0x4F
                                   4456 	CALL DOLIT
                                   4457 	.word 0x6F
                                   4458  	CALL XORR
                                   4459 	CALL DOLIT
                                   4460 	.word 0xF0
                                   4461  	CALL ANDD
                                   4462 	CALL DOLIT
                                   4463 	.word 0x4F
                                   4464  	CALL ORR
                                   4465 	CALL EMIT
                                   4466 	CALL DOLIT
                                   4467 	.word 8
                                   4468 	CALL DOLIT
                                   4469 	.word 6
                                   4470  	CALL SWAPP
                                   4471 	CALL OVER
                                   4472 	CALL XORR
                                   4473 	CALL DOLIT
                                   4474 	.word 3
                                   4475 	CALL ANDD 
                                   4476 	CALL ANDD
                                   4477 	CALL DOLIT
                                   4478 	.word 0x70
                                   4479 	CALL UPLUS 
                                   4480 	CALL DROP
                                   4481 	CALL EMIT
                                   4482 	CALL DOLIT
                                   4483 	.word 0
                                   4484 	CALL QBRAN
                                   4485 	.word DEBUG1
                                   4486 	CALL DOLIT
                                   4487 	.word 0x3F
                                   4488 DEBUG1:
                                   4489 	CALL DOLIT
                                   4490 	.word 0xFFFF
                                   4491 	CALL QBRAN
                                   4492 	.word DEBUG2
                                   4493 	CALL DOLIT
                                   4494 	.word 0x74
                                   4495 	CALL BRAN
                                   4496 	.word DEBUG3
                                   4497 DEBUG2:
                                   4498 	CALL DOLIT
                                   4499 	.word 0x21
                                   4500 DEBUG3:
                                   4501 	CALL EMIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



                                   4502 	CALL DOLIT
                                   4503 	.word 0x68
                                   4504 	CALL DOLIT
                                   4505 	.word 0x80
                                   4506 	CALL STORE
                                   4507 	CALL DOLIT
                                   4508 	.word 0x80
                                   4509 	CALL AT
                                   4510 	CALL EMIT
                                   4511 	CALL DOLIT
                                   4512 	.word 0x4D
                                   4513 	CALL TOR
                                   4514 	CALL RAT
                                   4515 	CALL RFROM
                                   4516 	CALL ANDD
                                   4517 	CALL EMIT
                                   4518 	CALL DOLIT
                                   4519 	.word 0x61
                                   4520 	CALL DOLIT
                                   4521 	.word 0xA
                                   4522 	CALL TOR
                                   4523 DEBUG4:
                                   4524 	CALL DOLIT
                                   4525 	.word 1
                                   4526 	CALL UPLUS 
                                   4527 	CALL DROP
                                   4528 	CALL DONXT
                                   4529 	.word DEBUG4
                                   4530 	CALL EMIT
                                   4531 	CALL DOLIT
                                   4532 	.word 0x656D
                                   4533 	CALL DOLIT
                                   4534 	.word 0x100
                                   4535 	CALL UMSTA
                                   4536 	CALL SWAPP
                                   4537 	CALL DOLIT
                                   4538 	.word 0x100
                                   4539 	CALL UMSTA
                                   4540 	CALL SWAPP 
                                   4541 	CALL DROP
                                   4542 	CALL EMIT
                                   4543 	CALL EMIT
                                   4544 	CALL DOLIT
                                   4545 	.word 0x2043
                                   4546 	CALL DOLIT
                                   4547 	.word 0
                                   4548 	CALL DOLIT
                                   4549 	.word 0x100
                                   4550 	CALL UMMOD
                                   4551 	CALL EMIT
                                   4552 	CALL EMIT
                                   4553 	;JP ORIG
                                   4554 	RET
                                   4555 .endif ; WANT_DEBUG 
                                   4556 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



                                   4557 
                                   4558 ;       'BOOT   ( -- a )
                                   4559 ;       The application startup vector.
      0096F2 18 E1                 4560         .word      LINK
                           0018FF  4561 LINK = . 
      0096F2 CD                    4562         .byte      5
      0096F3 83 C5 00 CD CD        4563         .ascii     "'BOOT"
      001905                       4564 TBOOT:
      0096F8 94 11 CC         [ 4] 4565         CALL     DOVAR
      0096FB 93 FA                 4566         .word    APP_RUN      ;application to boot
                                   4567 
                                   4568 ;       COLD    ( -- )
                                   4569 ;       The hilevel cold start s=ence.
      0096FD 96 EC                 4570         .word      LINK
                           00190C  4571         LINK = . 
      0096FF 08                    4572         .byte      4
      009700 49 4E 49 54           4573         .ascii     "COLD"
      001911                       4574 COLD:
                           000000  4575 .if WANT_DEBUG
                                   4576         CALL DEBUG
                                   4577 .endif 
      009704 2D 4F 46         [ 4] 4578 COLD1:  CALL     DOLIT
      009707 53 27                 4579         .word      UZERO
      009708 CD 03 45         [ 4] 4580 	CALL     DOLIT
      009708 CD 86                 4581         .word      UPP
      00970A 01 CD 84         [ 4] 4582         CALL     DOLIT
      00970D 4D CD                 4583 	.word      UEND-UZERO
      00970F 84 F4 CD         [ 4] 4584         CALL     CMOVE   ;initialize user area
                                   4585 
                           000001  4586 .if PICATOUT_MOD
                                   4587 ; if APP_RUN==0 initialize with ca de 'hi'  
      009712 83 F8 97 25      [ 2] 4588         ldw y,APP_RUN 
      009716 CD 84            [ 1] 4589         jrne 0$
      009718 EA CD 86         [ 2] 4590         subw x,#CELLL 
      00971B 50 CD 84 4D      [ 2] 4591         ldw y,#HI  
      00971F CD               [ 2] 4592         ldw (x),y
      009720 8B 29 CD         [ 4] 4593         call UPDATRUN 
      001934                       4594 0$:        
                                   4595 ; update LAST with APP_LAST 
                                   4596 ; if APP_LAST > LAST else do the opposite
      009723 87 4D CD 86      [ 2] 4597         ldw y,APP_LAST 
      009727 85 CC 84         [ 2] 4598         cpw y,ULAST 
      00972A 36 96            [ 1] 4599         jrugt 1$ 
                                   4600 ; save LAST at APP_LAST  
      00972C FF 01 3A         [ 4] 4601         call UPDATLAST 
      00972F 20 06            [ 2] 4602         jra 2$
      001942                       4603 1$: ; update LAST with APP_LAST 
      00972F CD 97 08         [ 2] 4604         ldw ULAST,y
      009732 CD 90 B4         [ 2] 4605         ldw UCNTXT,y
      001948                       4606 2$:  
                                   4607 ; update APP_CP if < app_space 
      009735 CD 95 ED CC      [ 2] 4608         ldw y,APP_CP  
      009739 96 DF 97         [ 2] 4609         cpw y,UCP   
      00973C 2D 02            [ 1] 4610         jruge 3$ 
      00973E 49 3A 3D         [ 4] 4611         call UPDATCP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      009740 90 BE 18         [ 2] 4612         ldw y,UCP   
      001957                       4613 3$:
      009740 CD 97 08         [ 2] 4614         ldw UCP,y                 
                                   4615 ; update UVP with APP_VP  
                                   4616 ; if APP_VP>UVP else do the opposite 
      009743 CC 96 DF 97      [ 2] 4617         ldw y,APP_VP 
      009747 3D 09 49         [ 2] 4618         cpw y,UVP 
      00974A 4D 4D            [ 1] 4619         jrugt 4$
      00974C 45 44 49         [ 4] 4620         call UPDATVP 
      00974F 41 54            [ 2] 4621         jra 6$
      001968                       4622 4$: ; update UVP with APP_VP 
      009751 45 BF 16         [ 2] 4623         ldw UVP,y 
      009752                       4624 6$:      
                                   4625 .endif ; PICATOUT_MOD
      009752 CD 83 C5         [ 4] 4626         CALL     PRESE   ;initialize data stack and TIB
      009755 80 00 CD         [ 4] 4627         CALL     TBOOT
      009758 86 60 CD         [ 4] 4628         CALL     ATEXE   ;application boot
      00975B 84 4D CD         [ 4] 4629         CALL     OVERT
      00975E 84 4D CD         [ 2] 4630         JP     QUIT    ;start interpretation
                                   4631 
                           000001  4632 .if PICATOUT_MOD
                                   4633         ; keep this include at end 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



                                   4634         .include "flash.asm"
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
      009761 85 54                   30     .word LINK 
                           00197C    31     LINK=.
      009763 CD                      32     .byte 3 
      009764 86 60 CD                33     .ascii "FP!"
      001980                         34 fptr_store:
      009767 84 4D            [ 1]   35     ldw y,x
      009769 CC 84            [ 2]   36     ldw y,(y)
      00976B 36 97            [ 1]   37     ld a,yl 
      00976D 48 06            [ 1]   38     ld FPTR,a 
      00976F 43 52 45         [ 2]   39     addw x,#CELLL 
      009772 41 54            [ 1]   40     ldw y,x 
      009774 45 FE            [ 2]   41     ldw y,(y)
      009775 90 BF 33         [ 2]   42     ldw PTR16,y
      009775 CD 90 B4         [ 2]   43     addw x,#CELLL 
      009778 CD               [ 4]   44     ret 
                                     45 
                                     46 ;-----------------------------------
                                     47 ; return EEPROM base address 
                                     48 ; as a double 
                                     49 ;  EEPROM  ( -- ud )
                                     50 ;-----------------------------------
      009779 95 ED                   51     .word LINK 
                           001998    52 LINK=.
      00977B CD                      53     .byte 6 
      00977C 96 6E CD 94 3F 85       54     .ascii "EEPROM"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



      00199F                         55 EEPROM: 
      009782 A1 81 97 6E      [ 2]   56     ldw y,#EEPROM_BASE
      009786 08 56 41         [ 2]   57     subw x,#2*CELLL 
      009789 52 49            [ 2]   58     ldw (2,x),y 
      00978B 41 42            [ 1]   59     clrw y 
      00978D 4C               [ 2]   60     ldw (x),y 
      00978E 45               [ 4]   61     ret
                                     62 
                                     63 ;---------------------------------
                                     64 ; return APP_LAST pointer as double
                                     65 ; EEP-LAST ( -- ud )
                                     66 ;---------------------------------
      00978F 19 98                   67 	.word LINK 
                           0019AE    68 	LINK=.
      00978F CD                      69 	.byte 8 
      009790 8B 29 CD 84 F4 CD 89    70 	.ascii "EEP-LAST"
             A3
      0019B7                         71 EEPLAST:
      009798 CD 86 42         [ 2]   72 	subw x,#2*CELLL 
      00979B CD 84 36 CD      [ 2]   73 	ldw y,#APP_LAST 
      00979F 97 75            [ 2]   74 	ldw (2,x),y 
      0097A1 CD 84            [ 1]   75 	clrw y 
      0097A3 F4               [ 2]   76 	ldw (x),y 
      0097A4 CD               [ 4]   77 	ret 
                                     78 
                                     79 ;----------------------------------
                                     80 ; return APP_RUN pointer as double	
                                     81 ; EEP-RUN ( -- ud )
                                     82 ;-----------------------------------
      0097A5 93 FA                   83 	.word LINK 
                           0019C6    84 	LINK=.
      0097A7 CD                      85 	.byte 7
      0097A8 8A 3A CD 85 04 CD 84    86 	.ascii "EEP-RUN"
      0019CE                         87 EEPRUN:
      0097AF 36 CD 9F         [ 2]   88 	subw x,#2*CELLL 
      0097B2 A0 CD 86 9E      [ 2]   89 	ldw y,#APP_RUN 
      0097B6 CD 83            [ 2]   90 	ldw (2,x),y 
      0097B8 F8 97            [ 1]   91 	clrw y 
      0097BA C2               [ 2]   92 	ldw (x),y 
      0097BB CD               [ 4]   93 	ret 
                                     94 
                                     95 ;------------------------------------
                                     96 ; return APP_CP pointer as double 
                                     97 ; EEP-CP ( -- ud )
                                     98 ;------------------------------------
      0097BC 9A D4                   99 	.word LINK
                           0019DD   100 	LINK=.
      0097BE CD                     101 	.byte 6 
      0097BF A0 34 81 2D 43 50      102 	.ascii "EEP-CP"
      0097C2                        103 EEPCP:
      0097C2 CD 86 60         [ 2]  104 	subw x,#2*CELLL 
      0097C5 CD 84 4D CD      [ 2]  105 	ldw y,#APP_CP  
      0097C9 86 73            [ 2]  106 	ldw (2,x),y 
      0097CB CC 84            [ 1]  107 	clrw y 
      0097CD 36               [ 2]  108 	ldw (x),y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



      0097CE 97               [ 4]  109 	ret 
                                    110 
                                    111 ;------------------------------------
                                    112 ; return APP_VP pointer as double 
                                    113 ; EEP-VP ( -- ud )
                                    114 ;-------------------------------------
      0097CF 86 08                  115 	.word LINK
                           0019F3   116 	LINK=.
      0097D1 43                     117 	.byte 6
      0097D2 4F 4E 53 54 41 4E      118 	.ascii "EEP-VP"
      0019FA                        119 EEPVP:
      0097D8 54 00 04         [ 2]  120 	subw x,#2*CELLL 
      0097D9 90 AE 40 06      [ 2]  121 	ldw y,#APP_VP  
      0097D9 CD 90            [ 2]  122 	ldw (2,x),y 
      0097DB B4 CD            [ 1]  123 	clrw y 
      0097DD 95               [ 2]  124 	ldw (x),y 
      0097DE ED               [ 4]  125 	ret 
                                    126 
                                    127 ;----------------------------------
                                    128 ; update APP_LAST with LAST 
                                    129 ; UPDAT-LAST ( -- )
                                    130 ;----------------------------------
      0097DF CD 96                  131 	.word LINK 
                           001A09   132 	LINK=.
      0097E1 6E                     133 	.byte 10
      0097E2 CD 94 3F 98 03 CD 93   134 	.ascii "UPDAT-LAST"
             FA CD 9F
      001A14                        135 UPDATLAST:
      0097EC A0 CD 86         [ 4]  136 	call LAST
      0097EF 9E CD 83         [ 4]  137 	call AT  
      0097F2 F8 97 C2         [ 4]  138 	call EEPLAST
      0097F5 CD A0 34         [ 2]  139 	jp ee_store 
                                    140 
                                    141 ;---------------------------------
                                    142 ; update APP_RUN 
                                    143 ; UPDAT-RUN ( a -- )
                                    144 ;---------------------------------
      0097F8 81 97                  145 	.word LINK
                           001A22   146 	LINK=.
      0097FA D0                     147 	.byte 9
      0097FB 07 44 4F 43 4F 4E 53   148 	.ascii "UPDAT-RUN"
             54 4E
      009803                        149 UPDATRUN:
      009803 1D 00 02         [ 4]  150 	call EEPRUN
      009806 90 85 90         [ 2]  151 	jp ee_store 
                                    152 	
                                    153 ;---------------------------------
                                    154 ; update APP_CP with CP 
                                    155 ; UPDAT-CP ( -- )
                                    156 ;---------------------------------
      009809 FE FF                  157 	.word LINK 
                           001A34   158 	LINK=.
      00980B 81                     159 	.byte 8 
      00980C 97 FB 05 5F 54 59 50   160 	.ascii "UPDAT-CP"
             45
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      009814                        161 UPDATCP:
      009814 CD 84 BD         [ 4]  162 	call CPP 
      009817 20 0F CD         [ 4]  163 	call AT 
      00981A 84 F4 CD         [ 4]  164 	call EEPCP 
      00981D 84 6B CD         [ 2]  165 	jp ee_store 
                                    166 
                                    167 ;----------------------------------
                                    168 ; update APP_VP with VP 
                                    169 ; UPDAT-VP ( -- )
                                    170 ;----------------------------------
      009820 8A 64                  171 	.word LINK
                           001A4B   172 	LINK=.
      009822 CD                     173 	.byte 8 
      009823 83 AF CD 89 CE CD 83   174 	.ascii "UPDAT-VP" 
             D9
      001A54                        175 UPDATVP:
      00982B 98 19 CC         [ 4]  176 	call VPP 
      00982E 84 EA 98         [ 4]  177 	call AT
      009831 0E 03 64         [ 4]  178 	call EEPVP 
      009834 6D 2B 90         [ 2]  179 	jp ee_store
                                    180 	
                                    181 
                                    182 ;----------------------------------
                                    183 ; fetch integer at address over 65535
                                    184 ;  F@   ( ud -- n )
                                    185 ;----------------------------------
      009836 1A 4B                  186     .word LINK 
                           001A62   187 LINK=.
      009836 CD                     188     .byte 2
      009837 85 1E                  189     .ascii "F@"
      001A65                        190 farat:
      009839 CD 83 C5         [ 4]  191     call fptr_store
      00983C 00 04 CD 8F      [ 5]  192     ldf a,[FPTR]
      009840 0A CD 8E         [ 2]  193     subw x,#CELLL 
      009843 5A               [ 1]  194     ld (x),a 
      009844 CD 84 BD 20      [ 2]  195     ldw y,#1
      009848 11 CD 84 F4      [ 1]  196     ldf a,([FPTR],y)
      00984C CD 84            [ 1]  197     ld (1,x),a
      00984E 6B               [ 4]  198     ret 
                                    199 
                                    200 ;-------------------------------------
                                    201 ; fetch C at address over 65535 
                                    202 ; FC@ ( ud -- c)
                                    203 ;-------------------------------------
      00984F CD 83                  204     .word LINK
                           001A7D   205     LINK=.
      009851 C5                     206     .byte 3 
      009852 00 03 CD               207     .ascii "FC@" 
      001A81                        208 farcat:
      009855 8F 0A CD         [ 4]  209     call fptr_store 
      009858 89 CE CD 83      [ 5]  210     ldf a,[FPTR]
      00985C D9 98 49         [ 2]  211     subw x,#CELLL 
      00985F 81 98            [ 1]  212     ld (1,x),a 
      009861 32               [ 1]  213     clr (x)
      009862 04               [ 4]  214     ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



                                    215     
                                    216 ;----------------------------------
                                    217 ; unlock EEPROM/OPT for writing/erasing
                                    218 ; wait endlessly for FLASH_IAPSR_DUL bit.
                                    219 ;  UNLKEE   ( -- )
                                    220 ;----------------------------------
      009863 44 55                  221     .word LINK 
                           001A91   222 LINK=.
      009865 4D                     223     .byte 6 
      009866 50 4E 4C 4B 45 45      224     .ascii "UNLKEE"
      009867                        225 unlock_eeprom:
      009867 CD 85 B1 CD      [ 1]  226 	mov FLASH_CR2,#0 
      00986B 84 4D CD 84      [ 1]  227 	mov FLASH_NCR2,#0xFF 
      00986F BD CD 8C E2      [ 1]  228 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      009873 CD 83 C5 00      [ 1]  229     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      009877 10 CD 88 F4 CD   [ 2]  230 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      00987C 84               [ 4]  231 	ret
                                    232 
                                    233 ;----------------------------------
                                    234 ; unlock FLASH for writing/erasing
                                    235 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                    236 ; UNLKFL  ( -- )
                                    237 ;----------------------------------
      00987D BD CD                  238     .word LINK 
                           001AB0   239 LINK=. 
      00987F 8E                     240     .byte 6 
      009880 A2 CD 83 C5 00 10      241     .ascii "UNLKFL"    
      001AB7                        242 unlock_flash:
      009886 CD 86 DA CD      [ 1]  243 	mov FLASH_CR2,#0 
      00988A 98 36 CD 86      [ 1]  244 	mov FLASH_NCR2,#0xFF 
      00988E AF CD 86 AF      [ 1]  245 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      009892 CD 8E 5A CD      [ 1]  246 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      009896 8E 5A CD 98 14   [ 2]  247 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      00989B CD               [ 4]  248 	ret
                                    249 
                                    250 ;-----------------------------
                                    251 ; unlock FLASH or EEPROM 
                                    252 ; according to FPTR address 
                                    253 ;  UNLOCK ( -- )
                                    254 ;-----------------------------
      00989C 83 D9                  255 	.word LINK 
                           001ACF   256 	LINK=.
      00989E 98                     257 	.byte 6
      00989F 7E CD 84 EA CD 84      258 	.ascii "UNLOCK"
      001AD6                        259 unlock:
                                    260 ; put addr[15:0] in Y, for bounds check.
      0098A5 9E CD 85         [ 2]  261 	ldw y,PTR16   ; Y=addr15:0
                                    262 ; check addr[23:16], if <> 0 then it is extened flash memory
      0098A8 B1 CC            [ 1]  263 	tnz FPTR 
      0098AA 84 36            [ 1]  264 	jrne 4$
      0098AC 98 62 02 2E      [ 2]  265     cpw y,#FLASH_BASE
      0098B0 53 10            [ 1]  266     jruge 4$
      0098B1 90 A3 40 00      [ 2]  267 	cpw y,#EEPROM_BASE  
      0098B1 CD 8E            [ 1]  268     jrult 9$
      0098B3 A2 CD 8A 7D      [ 2]  269 	cpw y,#OPTION_END 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



      0098B7 CD 84            [ 1]  270 	jrugt 9$
      0098B9 BD 20 09         [ 4]  271 	call unlock_eeprom
      0098BC CD               [ 4]  272 	ret 
      0098BD 84 B1 CD         [ 4]  273 4$: call unlock_flash
      0098C0 8A               [ 4]  274 9$: ret 
                                    275 
                                    276 ;-------------------------
                                    277 ; lock write access to 
                                    278 ; FLASH and EEPROM 
                                    279 ; LOCK ( -- )
                                    280 ;-------------------------
      0098C1 94 CD                  281 	.word LINK 
                           001AF9   282 	LINK=.
      0098C3 8F                     283 	.byte 4 
      0098C4 3D CD 83 D9            284 	.ascii "LOCK" 
      001AFE                        285 lock: 
      0098C8 98 BC CD 8E      [ 1]  286 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      0098CC E1 05 20 3C      [ 1]  287 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      0098D0 73               [ 4]  288 	ret 
                                    289 
                                    290 ;-------------------------
                                    291 ; increment FPTR 
                                    292 ; INC-FPTR ( -- )
                                    293 ;-------------------------
      0098D1 70 20                  294 	.word LINK 
                           001B09   295 	LINK=. 
      0098D3 81                     296 	.byte 8 
      0098D4 98 AE 05 3E 4E 41 4D   297 	.ascii "INC-FPTR" 
             45
      0098DC                        298 inc_fptr:
      0098DC CD 86            [ 1]  299 	inc PTR8 
      0098DE 34 CD            [ 1]  300 	jrne 1$
      0098E0 84 4D CD         [ 2]  301 	ldw y,FPTR 
      0098E3 84 F4            [ 2]  302 	incw y 
      0098E5 CD 83 F8         [ 2]  303 	ldw FPTR,y 
      0098E8 99               [ 4]  304 1$: ret 
                                    305 
                                    306 
                                    307 ;----------------------------
                                    308 ; write a byte at address pointed 
                                    309 ; by FPTR and increment FPTR.
                                    310 ; Expect pointer already initialized 
                                    311 ; and memory unlocked 
                                    312 ; WR-BYTE ( c -- )
                                    313 ;----------------------------
                                    314 
      0098E9 03 CD                  315 	.word LINK 
                           001B21   316 	LINK=. 
      0098EB 86                     317 	.byte 7 
      0098EC DA CD 90 C2 CD 85 69   318 	.ascii "WR-BYTE" 
                                    319 
      001B29                        320 write_byte:
      0098F3 CD 83            [ 1]  321 	ldw y,x 
      0098F5 F8 98            [ 2]  322 	ldw y,(y)
      0098F7 FD CD 89         [ 2]  323 	addw x,#CELLL 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      0098FA B2 20            [ 1]  324 	ld a,yl
      0098FC E2 CD 85 04      [ 4]  325 	ldf [FPTR],a
      009900 CC 84 EA CD 86   [ 2]  326 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009905 CF CC            [ 2]  327 	jra inc_fptr 
                                    328 
                                    329 
                                    330 
                                    331 ;---------------------------------------
                                    332 ; write a byte to FLASH or EEPROM/OPTION  
                                    333 ; EEC!  (c ud -- )
                                    334 ;---------------------------------------
      009907 8A 3A                  335     .word LINK 
                           001B3F   336 	LINK=.
      009909 98                     337     .byte 4 
      00990A D6 03 2E 49            338     .ascii "EEC!"
                                    339 	; local variables 
                           000001   340 	BTW = 1   ; byte to write offset on stack
                           000002   341     OPT = 2 
                           000002   342 	VSIZE = 2
      001B44                        343 ee_cstore:
      00990E 44 02            [ 2]  344 	sub sp,#VSIZE
      00990F CD 19 80         [ 4]  345     call fptr_store
      00990F CD 86            [ 1]  346 	ld a,(1,x)
      009911 9E               [ 1]  347 	cpl a 
      009912 CD 83            [ 1]  348 	ld (BTW,sp),a ; byte to write 
      009914 F8 99            [ 1]  349 	clr (OPT,sp)  ; OPTION flag
      009916 25 CD 8B         [ 4]  350 	call unlock 
                                    351 	; check if option
      009919 12 CD            [ 1]  352 	tnz FPTR 
      00991B 83 C5            [ 1]  353 	jrne 2$
      00991D 00 1F CD         [ 2]  354 	ldw y,PTR16 
      009920 85 40 CC 98      [ 2]  355 	cpw y,#OPTION_BASE
      009924 14 CD            [ 1]  356 	jrmi 2$
      009926 8E E1 09 20      [ 2]  357 	cpw y,#OPTION_END+1
      00992A 6E 6F            [ 1]  358 	jrpl 2$
      00992C 4E 61            [ 1]  359 	cpl (OPT,sp)
                                    360 	; OPTION WRITE require this unlock 
      00992E 6D 65 81 99      [ 1]  361     bset FLASH_CR2,#FLASH_CR2_OPT
      009932 0B 05 57 4F      [ 1]  362     bres FLASH_NCR2,#FLASH_CR2_OPT 
      001B70                        363 2$: 
      009936 52 44 53         [ 4]  364 	call write_byte 	
      009939 0D 02            [ 1]  365 	tnz (OPT,sp)
      009939 CD 8E            [ 1]  366 	jreq 3$ 
      00993B A2 CD            [ 1]  367     ld a,(BTW,sp)
      00993D 86 34            [ 1]  368     clrw y
      00993F CD 84            [ 1]  369 	ld yl,a 
      009941 4D CD 86         [ 2]  370 	subw x,#CELLL 
      009944 9E               [ 2]  371 	ldw (x),y 
      009945 CD 83 F8         [ 4]  372 	call write_byte
      001B84                        373 3$: 
      009948 99 5E CD         [ 4]  374 	call lock 
      00994B 84 F4            [ 2]  375 	addw sp,#VSIZE 
      00994D CD               [ 4]  376     ret
                                    377 
                                    378 ;------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



                                    379 ; write integer in FLASH|EEPROM
                                    380 ; EE! ( n ud -- )
                                    381 ;------------------------------
      00994E 8E 5A                  382 	.word LINK 
                           001B8C   383 	LINK=.
      009950 CD                     384 	.byte 3 
      009951 99 0F CD               385 	.ascii "EE!"
      001B90                        386 ee_store:
      009954 89 B2 CD         [ 4]  387 	call fptr_store 
      009957 84 0F 99         [ 4]  388 	call unlock 
      00995A 3F CD            [ 1]  389 	ldw y,x 
      00995C 84 EA            [ 2]  390 	ldw y,(y)
      00995E 81 99            [ 2]  391 	pushw y 
      009960 33 02            [ 1]  392 	swapw y 
      009962 68               [ 2]  393 	ldw (x),y 
      009963 69 1B 29         [ 4]  394 	call write_byte 
      009964 90 85            [ 2]  395 	popw y 
      009964 CD 8E A2         [ 2]  396 	subw x,#CELLL
      009967 CD               [ 2]  397 	ldw (x),y 
      009968 8E E1 0F         [ 4]  398 	call write_byte
      00996B 73 74 6D         [ 2]  399 	jp lock 
                                    400 
                                    401 
                                    402 ;----------------------------
                                    403 ; Erase flash memory row 
                                    404 ; stm8s208 as 128 bytes rows
                                    405 ; ROW-ERASE ( ud -- )
                                    406 ;----------------------------
      00996E 38 65                  407 	.word LINK 
                           001BB0   408 	LINK=. 
      009970 46                     409 	.byte 9 
      009971 6F 72 74 68 20 76 33   410 	.ascii "ROW-ERASE" 
             2E 30
      001BBA                        411 row_erase:
      00997A CC 8E A2         [ 4]  412 	call fptr_store
                                    413 ;code must be execute from RAM 
                                    414 ;copy routine to PAD 
      00997D 99 61 05         [ 2]  415 	subw x,#CELLL 
      009980 27 42 4F 4F      [ 2]  416 	ldw y,#row_erase_proc
      009984 54               [ 2]  417 	ldw (x),y 
      009985 CD 0A BA         [ 4]  418 	call PAD 
      009985 CD 85 A1 40      [ 2]  419 	ldw y,#row_erase_proc_end 
      009989 02 99 7F 04      [ 2]  420 	subw y,#row_erase_proc
      00998D 43 4F 4C         [ 2]  421 	subw x,#CELLL 
      009990 44               [ 2]  422 	ldw (x),y 
      009991 CD 0A F6         [ 4]  423 	call CMOVE 
      001BD7                        424 block_erase:
      009991 CD 83 C5         [ 2]  425 	ldw y,FPTR+1
      009994 80 A7 CD 83      [ 2]  426 	cpw y,#app_space 
      009998 C5 00            [ 1]  427 	jrpl erase_flash 
                                    428 ; erase EEPROM block
      00999A 06 CD 83 C5      [ 2]  429 	cpw y,#EEPROM_BASE 
      00999E 00 1A            [ 1]  430 	jruge 1$
      0099A0 CD               [ 4]  431 	ret ; bad address 
      0099A1 8B 76 90 CE      [ 2]  432 1$: cpw y,#EEPROM_END 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



      0099A5 40 02            [ 2]  433 	jrule 2$ 
      0099A7 26               [ 4]  434 	ret ; bad address 
      001BEE                        435 2$:	
      0099A8 0B 1D 00         [ 4]  436 	call unlock_eeprom 
      0099AB 02 90            [ 2]  437 	jra proceed_erase
                                    438 ; erase flash block:
      001BF3                        439 erase_flash:
      0099AD AE 99 64         [ 4]  440 	call unlock_flash 
      001BF6                        441 proceed_erase:
      0099B0 FF CD 9A         [ 4]  442 	call PAD 
      0099B3 AC 93            [ 1]  443 	ldw y,x
      0099B4 90 FE            [ 2]  444 	ldw y,(y)
      0099B4 90 CE 40         [ 2]  445 	addw x,#CELLL  
      0099B7 00 90            [ 4]  446 	call (y) 
      0099B9 B3 1A 22 05      [ 1]  447 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      0099BD CD               [ 4]  448 	ret 
                                    449 
                                    450 ; this routine is to be copied to PAD 
      001C07                        451 row_erase_proc:
      0099BE 9A 94 20 06      [ 1]  452 	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
      0099C2 35 DF 50 5C      [ 1]  453 	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
      0099C2 90               [ 1]  454 	clr a 
      0099C3 BF 1A            [ 1]  455 	clrw y 
      0099C5 90 BF 14 32      [ 1]  456 	ldf ([FPTR],y),a
      0099C8 90 5C            [ 2]  457     incw y
      0099C8 90 CE 40 04      [ 1]  458 	ldf ([FPTR],y),a
      0099CC 90 B3            [ 2]  459     incw y
      0099CE 18 24 06 CD      [ 1]  460 	ldf ([FPTR],y),a
      0099D2 9A BD            [ 2]  461     incw y
      0099D4 90 BE 18 32      [ 1]  462 	ldf ([FPTR],y),a
      0099D7 72 05 50 5F FB   [ 2]  463 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      0099D7 90               [ 4]  464 	ret
      001C2E                        465 row_erase_proc_end:
                                    466 
                                    467 
                                    468 ;-----------------------------------
                                    469 ; block programming must be 
                                    470 ; executed from RAM 
                                    471 ; initial contidions: 
                                    472 ; 		memory unlocked
                                    473 ;       FPTR initialized 
                                    474 ; input: 
                                    475 ;    x   buffer address 
                                    476 ;-----------------------------------
                           000001   477 	BCNT=1 
      001C2E                        478 copy_buffer:
      0099D8 BF 18            [ 1]  479 	push #BLOCK_SIZE  
                                    480 ;enable block programming 
      0099DA 90 CE 40 06      [ 1]  481 	bset FLASH_CR2,#FLASH_CR2_PRG 
      0099DE 90 B3 16 22      [ 1]  482 	bres FLASH_NCR2,#FLASH_CR2_PRG
      0099E2 05 CD            [ 1]  483 	clrw y
      0099E4 9A               [ 1]  484 1$:	ld a,(x)
      0099E5 D4 20 03 32      [ 1]  485 	ldf ([FPTR],y),a
      0099E8 5C               [ 2]  486 	incw x 
      0099E8 90 BF            [ 2]  487 	incw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



      0099EA 16 01            [ 1]  488 	dec (BCNT,sp)
      0099EB 26 F4            [ 1]  489 	jrne 1$
                                    490 ; wait EOP bit 
      0099EB CD 93 A5 CD 99   [ 2]  491 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. 
      0099F0 85               [ 1]  492 	pop a ; remove BCNT from stack 
      0099F1 CD               [ 4]  493 	ret 
      001C4D                        494 copy_buffer_end:
                                    495 
                                    496 ;-------------------------
                                    497 ; move program_row to RAM 
                                    498 ; in TIB 
                                    499 ;------------------------
      001C4D                        500 copy_prog_to_ram:
      0099F2 8B 5F CD         [ 2]  501 	subw x,#6
      0099F5 96 6E CC 93      [ 2]  502 	ldw y,#copy_buffer 
      0099F9 C2 99            [ 2]  503 	ldw (4,x),y 
      0099FB 8C 03 46 50      [ 2]  504 	ldw y,#TIBBASE
      0099FF 21 02            [ 2]  505 	ldw (2,x),y 
      009A00 90 AE 1C 4D      [ 2]  506 	ldw y,#copy_buffer_end 
      009A00 90 93 90 FE      [ 2]  507 	subw y,#copy_buffer  
      009A04 90               [ 2]  508 	ldw (x),y 
      009A05 9F B7 32         [ 4]  509 	call CMOVE 
      009A08 1C               [ 4]  510 	ret 
                                    511 
                                    512 
                                    513 ;-----------------------------
                                    514 ; write a row in FLASH/EEPROM 
                                    515 ; WR-ROW ( a ud -- )
                                    516 ; a -> address 128 byte buffer to write 
                                    517 ; ud ->  row address in FLASH|EEPROM 
                                    518 ;-----------------------------
      009A09 00 02                  519 	.word LINK 
                           001C6B   520 	LINK=.
      009A0B 90                     521 	.byte 6 
      009A0C 93 90 FE 90 BF 33      522 	.ascii "WR-ROW"
      001C72                        523 write_row:
      009A12 1C 00 02         [ 4]  524 	call fptr_store
                                    525 ; align to FLASH block 
      009A15 81 99            [ 1]  526 	ld a,#0x80 
      009A17 FC 06            [ 1]  527 	and a,PTR8 
      009A19 45 45            [ 1]  528 	ld PTR8,a  
      009A1B 50 52 4F         [ 4]  529 	call copy_prog_to_ram
      009A1E 4D 1A D6         [ 4]  530 	call unlock
      009A1F 90 93            [ 1]  531 	ldw y,x 
      009A1F 90 AE            [ 2]  532 	ldw y,(y)
      009A21 40 00 1D         [ 2]  533 	addw x,#CELLL 
      009A24 00               [ 2]  534 	pushw x 
      009A25 04               [ 1]  535 	ldw x,y ; buffer address in x 
      009A26 EF 02 90         [ 4]  536 	call TIBBASE
      009A29 5F FF 81         [ 4]  537 	call lock
      009A2C 9A               [ 2]  538 	popw x 
      009A2D 18               [ 4]  539 	ret 
                                    540 
                                    541 ;-------------------------------------
                                    542 ; change value of OPTION register 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



                                    543 ; SET-OPT (c n -- ) 
                                    544 ; c new value.
                                    545 ; n OPT  number {1..7}
                                    546 ;--------------------------------------
      009A2E 08 45                  547 		.word LINK 
                           001C94   548 		LINK=.
      009A30 45                     549 		.byte 7 
      009A31 50 2D 4C 41 53 54 54   550 		.ascii "SET-OPT" 
      009A37                        551 set_option: 
      009A37 1D 00            [ 1]  552 		ldw y,x 
      009A39 04 90            [ 2]  553 		ldw y,(y)
      009A3B AE 40            [ 1]  554 		jreq 1$
      009A3D 00 EF 02 90      [ 2]  555 		cpw y,#7 
      009A41 5F FF            [ 2]  556 		jrule 2$ 
                                    557 ; invalid OPTION number 		
      009A43 81 9A 2E         [ 2]  558 1$:		addw x,#2*CELLL
      009A46 07               [ 4]  559 		ret
      009A47 45 45            [ 2]  560 2$:		sllw y 
      009A49 50 2D 52 55      [ 2]  561 		addw y,#OPTION_BASE-1
      009A4D 4E               [ 2]  562 		ldw (x),y 
      009A4E 1D 00 02         [ 2]  563 		subw x,#CELLL 
      009A4E 1D 00            [ 1]  564 		clrw y 
      009A50 04               [ 2]  565 		ldw (x),y 
      009A51 90 AE 40         [ 4]  566 		call ee_cstore
      009A54 02               [ 4]  567 		ret 
                                    568 
                                    569 
                                    570 
                                    571 ;--------------------------------------
                                    572 ; reset system to its original state 
                                    573 ; before any user modification
                                    574 ; PRISTINE ( -- )
                                    575 ;-------------------------------------
      009A55 EF 02                  576 	.word LINK  
                           001CBF   577 	LINK=.
      009A57 90                     578 	.byte 8 
      009A58 5F FF 81 9A 46 06 45   579 	.ascii "PRISTINE"
             45
      001CC8                        580 pristine:
                                    581 ;;; erase EEPROM
      009A60 50 2D 43         [ 4]  582 	call EEPROM 
      009A63 50 06 5A         [ 4]  583 1$:	call DDUP 
      009A64 CD 1B BA         [ 4]  584 	call row_erase
      009A64 1D 00            [ 1]  585 	ldw y,x 
      009A66 04 90 AE         [ 2]  586 	ldw y,(2,y)
      009A69 40 04 EF 02      [ 2]  587 	addw y,#BLOCK_SIZE
      009A6D 90 5F            [ 2]  588 	ldw (2,x),y
      009A6F FF 81 9A 5D      [ 2]  589 	cpw y,#OPTION_BASE 
      009A73 06 45            [ 1]  590 	jrult 1$
                                    591 ;;; reset OPTION to default values
      009A75 45 50 2D 56      [ 2]  592 	ldw y,#1 ; OPT1 
      009A79 50               [ 2]  593 2$:	ldw (x),y   
      009A7A 90 5F            [ 1]  594 	clrw y 
      009A7A 1D 00            [ 2]  595 	ldw (2,x),y  ; ( 0 1 -- ) 
      009A7C 04 90 AE         [ 4]  596 	call DDUP    ; ( 0 1 0 1 -- )  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



      009A7F 40 06 EF         [ 4]  597 	call set_option
      009A82 02 90            [ 1]  598 	ldw y,x 
      009A84 5F FF            [ 2]  599 	ldw y,(y)
      009A86 81 9A            [ 2]  600 	incw y  ; next OPTION 
      009A88 73 0A 55 50      [ 2]  601 	cpw y,#8 
      009A8C 44 41            [ 1]  602 	jrult 2$
                                    603 ;;; erase first row of app_space 	
      009A8E 54 2D 4C 41      [ 2]  604 	ldw y,#app_space
      009A92 53 54            [ 2]  605 	ldw (2,x),y  
      009A94 90 5F            [ 1]  606 	clrw y 
      009A94 CD               [ 2]  607 	ldw (x),y ; ( app_space 0 -- )
      009A95 86 60 CD         [ 4]  608 	call row_erase 
                                    609 ; reset interrupt vectors 
      009A98 84 4D CD         [ 2]  610 	subw x,#CELLL 
      009A9B 9A 37            [ 1]  611 	clrw y  
      009A9D CC               [ 2]  612 4$:	ldw (x),y  ; ( n -- ) int# 
      009A9E 9C 10 9A         [ 4]  613 	call DUPP  
      009AA1 89 09 55         [ 4]  614 	call reset_vector
      009AA4 50 44            [ 1]  615 	ldw y,x 
      009AA6 41 54            [ 2]  616 	ldw y,(y)
      009AA8 2D 52            [ 2]  617 	incw y   ; next vector 
      009AAA 55 4E 00 19      [ 2]  618 	cpw y,#25 
      009AAC 25 ED            [ 1]  619 	jrult 4$
      009AAC CD 9A 4E         [ 2]  620 	jp NonHandledInterrupt ; reset MCU
                                    621 
                                    622 ;------------------------------
                                    623 ; reset an interrupt vector 
                                    624 ; to its initial value 
                                    625 ; i.e. NonHandledInterrupt
                                    626 ; RST-IVEC ( n -- )
                                    627 ;-----------------------------
      009AAF CC 9C                  628 	.word LINK 
                           001D26   629 	LINK=. 
      009AB1 10                     630 	.byte 8 
      009AB2 9A A2 08 55 50 44 41   631 	.ascii "RST-IVEC"
             54
      001D2F                        632 reset_vector:
      009ABA 2D 43            [ 1]  633 	ldw y,x
      009ABC 50 00 02         [ 2]  634 	addw x,#CELLL 
      009ABD 90 FE            [ 2]  635 	ldw y,(y)
      009ABD CD 86 50 CD      [ 2]  636 	cpw y,#23 
      009AC1 84 4D            [ 1]  637 	jreq 9$
      009AC3 CD 9A 64 CC      [ 2]  638 	cpw y,#29 ; last vector
      009AC7 9C 10            [ 1]  639 	jrugt 9$  
      009AC9 9A B4            [ 2]  640 	sllw y 
      009ACB 08 55            [ 2]  641 	sllw y 
      009ACD 50 44 41 54      [ 2]  642 	addw y,#0x8008 ; irq0 address 
      009AD1 2D 56 50         [ 2]  643 	ldw YTEMP,y
      009AD4 1D 00 06         [ 2]  644 	subw x,#3*CELLL 
      009AD4 CD 86            [ 2]  645 	ldw (2,x),y 
      009AD6 42 CD            [ 1]  646 	clrw y
      009AD8 84               [ 2]  647 	ldw (x),y 
      009AD9 4D CD            [ 1]  648 	ld a,#0x82 
      009ADB 9A 7A            [ 1]  649 	ld yh,a
      009ADD CC 9C            [ 2]  650 	ldw (4,x),y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



      009ADF 10 9A CB         [ 4]  651 	call ee_store
      009AE2 02 46 40         [ 2]  652 	subw x,#3*CELLL
      009AE5 90 5F            [ 1]  653 	clrw y 
      009AE5 CD               [ 2]  654 	ldw (x),y 
      009AE6 9A 00 92 BC      [ 2]  655 	ldw y,#NonHandledInterrupt
      009AEA 00 32            [ 2]  656 	ldw (4,x),y 
      009AEC 1D 00 02         [ 2]  657 	ldw y,YTEMP  
      009AEF F7 90 AE 00      [ 2]  658 	addw y,#2
      009AF3 01 91            [ 2]  659 	ldw (2,x),y 
      009AF5 AF 00 32         [ 4]  660 	call ee_store
      009AF8 E7               [ 4]  661 9$:	ret 
                                    662 
                                    663 
                                    664 ;------------------------------
                                    665 ; all interrupt vector with 
                                    666 ; an address >= a are resetted 
                                    667 ; to default
                                    668 ; CHKIVEC ( a -- )
                                    669 ;------------------------------
      009AF9 01 81                  670 	.word LINK 
                           001D79   671 	LINK=.
      009AFB 9A                     672 	.byte 7
      009AFC E2 03 46 43 40 45 43   673 	.ascii "CHKIVEC"
                                    674 ;local variables 
                           000001   675 	SSP=1
                           000003   676 	CADR=3
                           000005   677 	OFS=5
                           000006   678 	VSIZE=6  
      009B01                        679 CHKIVEC:
      009B01 CD 9A            [ 2]  680 	sub sp,#VSIZE ;alloc local variables 
      009B03 00 92            [ 1]  681 	ldw y,x 
      009B05 BC 00            [ 2]  682 	ldw y,(y)
      009B07 32 1D            [ 2]  683 	ldw (CADR,sp),y ; ca 
      009B09 00 02            [ 2]  684 	ldw (SSP,sp),x 
      009B0B E7 01 7F         [ 2]  685 	ldw x,#0x800a ; irq0 address 
      009B0E 81 9A            [ 2]  686 	ldw PTR16,X
      009B10 FD 06 55         [ 2]  687 	ldw x,#-4 
      009B13 4E 4C 4B         [ 2]  688 1$:	addw x,#4
      009B16 45 45 78         [ 2]  689 	cpw x,#30*4 ; irq0-29 
      009B18 27 22            [ 1]  690 	jreq 9$
      009B18 35 00            [ 1]  691 	ldw y,x  
      009B1A 50 5B 35         [ 4]  692 	ld a,([PTR16],y)
      009B1D FF 50            [ 1]  693 	cp a,(CADR,sp)
      009B1F 5C 35            [ 1]  694 	jrult 1$
      009B21 AE 50            [ 2]  695 	incw y 
      009B23 64 35 56         [ 4]  696 	ld a,([PTR16],y)
      009B26 50 64            [ 1]  697 	cp a,(CADR+1,sp) 
      009B28 72 07            [ 1]  698 	jrult 1$ 
      009B2A 50 5F            [ 2]  699 	ldw (OFS,sp),x 
      009B2C FB               [ 2]  700 	srlw x
      009B2D 81               [ 2]  701 	srlw x 
      009B2E 9B 11            [ 1]  702 	ldw y,x 
      009B30 06 55            [ 2]  703 	ldw x,(SSP,sp)
      009B32 4E               [ 2]  704 	ldw (x),y
      009B33 4C 4B 46         [ 4]  705 	call reset_vector
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



      009B36 4C 05            [ 2]  706 	ldw x,(OFS,sp) 
      009B37 20 D6            [ 2]  707 	jra 1$
      009B37 35 00            [ 2]  708 9$:	ldw x,(SSP,sp) 
      009B39 50 5B 35         [ 2]  709 	addw x,#CELLL 
      009B3C FF 50            [ 2]  710 	addw sp,#VSIZE ; drop local variables  
      009B3E 5C               [ 4]  711 	ret 
                                    712 
                                    713 ;------------------------------
                                    714 ; set interrupt vector 
                                    715 ; SET-IVEC ( ud n -- )
                                    716 ;  ud Handler address
                                    717 ;  n  vector # 0 .. 29 
                                    718 ;-----------------------------
      009B3F 35 56                  719 	.word LINK
                           001DC7   720 	LINK=.
      009B41 50                     721 	.byte 8 
      009B42 62 35 AE 50 62 72 03   722 	.ascii "SET-IVEC" 
             50
      001DD0                        723 set_vector:
      009B4A 5F FB            [ 1]  724     ldw y,x 
      009B4C 81 9B 30         [ 2]  725 	addw x,#CELLL 
      009B4F 06 55            [ 2]  726 	ldw y,(y) ; vector #
      009B51 4E 4C 4F 43      [ 2]  727 	cpw y,#29 ; last vector
      009B55 4B 04            [ 2]  728 	jrule 2$
      009B56 1C 00 04         [ 2]  729 	addw x,#2*CELLL 
      009B56 90               [ 4]  730 	ret
      009B57 BE 33            [ 2]  731 2$:	sllw y 
      009B59 3D 32            [ 2]  732 	sllw y 
      009B5B 26 16 90 A3      [ 2]  733 	addw y,#0X8008 ; IRQ0 vector address 
      009B5F 80 00 24         [ 2]  734 	ldw YTEMP,y ; vector address 
      009B62 10 90            [ 1]  735 	ld a,#0x82 
      009B64 A3 40            [ 1]  736 	ld yh,a 
      009B66 00 25            [ 1]  737 	ld a,(1,x) ; isr address bits 23..16 
      009B68 0D 90            [ 1]  738 	ld yl,a 
                                    739 ;  write 0x82 + most significant byte of int address	
      009B6A A3 48 7F         [ 2]  740 	subw x,#3*CELLL 
      009B6D 22 07            [ 2]  741 	ldw (4,x),y 
      009B6F CD 9B 18         [ 2]  742 	ldw y,YTEMP
      009B72 81 CD            [ 2]  743 	ldw (2,x),y ; vector address 
      009B74 9B 37            [ 1]  744 	clrw y 
      009B76 81               [ 2]  745 	ldw (x),y   ; as a double 
      009B77 9B 4F 04         [ 4]  746 	call ee_store 
      009B7A 4C 4F            [ 1]  747 	ldw y,x 
      009B7C 43 4B 02         [ 2]  748 	ldw y,(2,y) ; bits 15..0 int vector 
      009B7E 1D 00 06         [ 2]  749 	subw x,#3*CELLL 
      009B7E 72 13            [ 2]  750 	ldw (4,x),y 
      009B80 50 5F 72         [ 2]  751 	ldw y,YTEMP 
      009B83 17 50 5F 81      [ 2]  752 	addw y,#2 
      009B87 9B 79            [ 2]  753 	ldw (2,x),y 
      009B89 08 49            [ 1]  754 	clrw y 
      009B8B 4E               [ 2]  755 	ldw (x),y 
      009B8C 43 2D 46         [ 4]  756 	call ee_store
      009B8F 50 54 52         [ 2]  757 	addw x,#2*CELLL  
      009B92 81               [ 4]  758 9$: ret 
                                    759 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



                                    760 
                                    761 ;------------------------
                                    762 ; Compile word to flash
                                    763 ; EE, (w -- )
                                    764 ;-----------------------
      009B92 3C 34                  765 	.word LINK
                           001E23   766 	LINK=.
      009B94 26                     767 	.byte 3
      009B95 08 90 BE               768 	.ascii "EE,"
      001E27                        769 ee_comma:
      009B98 32 90 5C         [ 2]  770 	subw x,#2*CELLL 
      009B9B 90 BF 32         [ 2]  771 	ldw y,UCP
      009B9E 81 9B            [ 2]  772 	pushw y 
      009BA0 89 07            [ 2]  773 	ldw (2,x),y 
      009BA2 57 52            [ 1]  774 	clrw y 
      009BA4 2D               [ 2]  775 	ldw (x),y
      009BA5 42 59 54         [ 4]  776 	call ee_store
      009BA8 45 85            [ 2]  777 	popw y 
      009BA9 72 A9 00 02      [ 2]  778 	addw y,#2
      009BA9 90 93 90         [ 2]  779 	ldw UCP,y
      009BAC FE               [ 4]  780 	ret 
                                    781 
                                    782 ;-------------------------
                                    783 ; Compile byte to flash 
                                    784 ; EEC, ( c -- )	
                                    785 ;-------------------------
      009BAD 1C 00                  786 	.word LINK 
                           001E43   787 	LINK=.
      009BAF 02                     788 	.byte 4 
      009BB0 90 9F 92 BD            789 	.ascii "EEC,"
      001E48                        790 ee_ccomma:
      009BB4 00 32 72         [ 2]  791 	subw x,#2*CELLL 
      009BB7 05 50 5F         [ 2]  792 	ldw y,UCP
      009BBA FB 20            [ 2]  793 	pushw y 
      009BBC D5 9B            [ 2]  794 	ldw (2,x),y 
      009BBE A1 04            [ 1]  795 	clrw y 
      009BC0 45               [ 2]  796 	ldw (x),y
      009BC1 45 43 21         [ 4]  797 	call ee_cstore
      009BC4 90 85            [ 2]  798 	popw y 
      009BC4 52 02            [ 2]  799 	incw y 
      009BC6 CD 9A 00         [ 2]  800 	ldw UCP,y
      009BC9 E6               [ 4]  801 	ret 
                                    802 
                                    803 
                                    804 ;--------------------------
                                    805 ; copy FLASH block to ROWBUF
                                    806 ; ROW2BUF ( ud -- )
                                    807 ;--------------------------
      009BCA 01 43                  808 	.word LINK 
                           001E62   809 	LINK=.
      009BCC 6B                     810 	.byte 7 
      009BCD 01 0F 02 CD 9B 56 3D   811 	.ascii "ROW2BUF"
      001E6A                        812 ROW2BUF: 
      009BD4 32 26 19         [ 4]  813 	call fptr_store 
      009BD7 90 BE            [ 1]  814 	ld a,#BLOCK_SIZE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



      009BD9 33               [ 1]  815 	push a 
      009BDA 90 A3            [ 1]  816 	and a,PTR8 ; block align 
      009BDC 48 00            [ 1]  817 	ld PTR8,a
      009BDE 2B 10 90 A3      [ 2]  818 	ldw y,#ROWBUFF 
      009BE2 48 80 2A 0A      [ 5]  819 1$: ldf a,[FPTR]
      009BE6 03 02            [ 1]  820 	ld (y),a
      009BE8 72 1E 50         [ 4]  821 	call inc_fptr
      009BEB 5B 72            [ 2]  822 	incw y 
      009BED 1F 50            [ 1]  823 	dec (1,sp)
      009BEF 5C F1            [ 1]  824 	jrne 1$ 
      009BF0 84               [ 1]  825 	pop a 
      009BF0 CD               [ 4]  826 	ret 
                                    827 
                                    828 
                                    829 ;---------------------------
                                    830 ; copy ROWBUFF to flash 
                                    831 ; BUF2ROW ( ud -- )
                                    832 ; ud is row address as double 
                                    833 ;---------------------------
      009BF1 9B A9                  834 	.word LINK 
                           001E8B   835 	LINK=.
      009BF3 0D                     836 	.byte 7 
      009BF4 02 27 0D 7B 01 90 5F   837 	.ascii "BUF2ROW" 
      001E93                        838 BUF2ROW:
      009BFB 90 97 1D         [ 4]  839 	call TBUF ; ( ud rb -- )
      009BFE 00 02 FF         [ 4]  840 	call ROT 
      009C01 CD 9B A9         [ 4]  841 	call ROT  ; ( rb ud -- )
      009C04 CD 1C 72         [ 4]  842 	call write_row 
      009C04 CD               [ 4]  843 	ret 
                                    844 
                                    845 ;---------------------------------
                                    846 ; how many byte free in that row 
                                    847 ; RFREE ( a -- n )
                                    848 ; a is least byte of target address
                                    849 ;----------------------------------
      009C05 9B 7E                  850 	.word LINK 
                           001EA2   851 	LINK=.
      009C07 5B                     852 	.byte 5 
      009C08 02 81 9B BF 03         853 	.ascii "RFREE"
      001EA8                        854 RFREE:
      009C0D 45 45            [ 1]  855 	ld a,(1,x)
      009C0F 21 7F            [ 1]  856 	and a,#BLOCK_SIZE-1 
      009C10 B7 24            [ 1]  857 	ld YTEMP,a 
      009C10 CD 9A            [ 1]  858 	ld a,#BLOCK_SIZE 
      009C12 00 CD            [ 1]  859 	sub a,YTEMP 
      009C14 9B 56            [ 1]  860 	clrw y 
      009C16 90 93            [ 1]  861 	ld yl,a
      009C18 90               [ 2]  862 	ldw (x),y 
      009C19 FE               [ 4]  863 	ret 
                                    864 
                                    865 ;---------------------------------
                                    866 ; write u bytes to flash/EEPROM 
                                    867 ; constraint to row limit 
                                    868 ; RAM2EE ( ud a u -- u2 )
                                    869 ; ud flash address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



                                    870 ; a ram address 
                                    871 ; u bytes count
                                    872 ; return u2 bytes written  
                                    873 ;-------------------------------
      009C1A 90 89                  874 	.word LINK 
                           001EBA   875 	LINK=. 
      009C1C 90                     876 	.byte 6
      009C1D 5E FF CD 9B A9 90      877 	.ascii "RAM2EE"
                                    878 	
      001EC1                        879 RAM2EE:
                                    880 ; copy ud on top 
      009C23 85 1D            [ 1]  881 	ldw y,x 
      009C25 00 02 FF         [ 2]  882 	ldw y,(6,y) ; LSW of ud  
      009C28 CD 9B A9         [ 2]  883 	ldw YTEMP,y 
      009C2B CC 9B            [ 1]  884 	ldw y,x 
      009C2D 7E 9C 0C         [ 2]  885 	ldw y,(4,y)  ; MSW of ud 
      009C30 09 52 4F         [ 2]  886 	subw x,#2*CELLL 
      009C33 57               [ 2]  887 	ldw (x),y 
      009C34 2D 45 52         [ 2]  888 	ldw y,YTEMP 
      009C37 41 53            [ 2]  889 	ldw (2,x),y 
      009C39 45 1E 6A         [ 4]  890 	call ROW2BUF 
      009C3A 90 93            [ 1]  891 	ldw y,x 
      009C3A CD 9A 00         [ 2]  892 	ldw y,(6,y)
      009C3D 1D 00            [ 2]  893 	pushw y ; udl 
      009C3F 02 90            [ 1]  894 	ld a,yl
      009C41 AE 9C            [ 1]  895 	and a,#BLOCK_SIZE-1 
      009C43 87 FF            [ 1]  896 	clrw y 
      009C45 CD 8B            [ 1]  897 	ld yl,a 
      009C47 3A 90 AE 9C      [ 2]  898 	addw y,#ROWBUFF 
      009C4B AE 72 A2         [ 2]  899 	subw x,#CELLL 
      009C4E 9C               [ 2]  900 	ldw (x),y  
      009C4F 87 1D 00         [ 4]  901 	call SWAPP ;  ( ud a ra u -- )
      009C52 02 FF CD         [ 4]  902 	call RFROM  
      009C55 8B 76 A8         [ 4]  903 	call RFREE 
      009C57 CD 07 6F         [ 4]  904 	call MIN
      009C57 90 BE 33         [ 4]  905 	call DUPP 
      009C5A 90 A3 A1         [ 4]  906 	call TOR  
      009C5D 00 2A 13         [ 4]  907 	call CMOVE
      009C60 90 A3 40         [ 4]  908 	call BUF2ROW 
      009C63 00 24 01         [ 4]  909 	call RFROM 
      009C66 81               [ 4]  910 	ret 
                                    911 
                                    912 ;--------------------------
                                    913 ; expand 16 bit address 
                                    914 ; to 32 bit address 
                                    915 ; FADDR ( a -- ud )
                                    916 ;--------------------------
      009C67 90 A3                  917 	.word LINK 
                           001F0F   918 	LINK=. 
      009C69 47                     919 	.byte 5 
      009C6A FF 23 01 81 52         920 	.ascii "FADDR"
      009C6E                        921 FADDR:
      009C6E CD 9B 18         [ 2]  922 	jp ZERO 
                                    923 
                                    924 ;--------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



                                    925 ; move new colon definition to FLASH 
                                    926 ; using WR-ROW for efficiency 
                                    927 ; preserving bytes already used 
                                    928 ; in the current block. 
                                    929 ; ud+c must not exceed block boundary 
                                    930 ; at this point the compiler as completed
                                    931 ; in RAM and pointers CP and CNTXT updated.
                                    932 ; CNTXT point to nfa of new word and  
                                    933 ; CP is after compiled word so CP-CNTXT+2=count to write 
                                    934 ; 
                                    935 ; FMOVE ( -- cp+ )
                                    936 ; 
                                    937 ;--------------------------
      009C71 20 03                  938 	.word LINK 
                           001F1A   939 	LINK=.
      009C73 05                     940 	.byte 5 
      009C73 CD 9B 37 56 45         941 	.ascii "FMOVE" 
      009C76                        942 FMOVE:
      009C76 CD 8B 3A         [ 4]  943 	call TFLASH 
      009C79 90 93 90         [ 4]  944 	CALL AT 
      009C7C FE 1C 00         [ 4]  945 	CALL QBRAN 
      009C7F 02 90                  946 	.word no_move  
      009C81 FD 72 17         [ 4]  947 	call CPP
      009C84 50 5F 81         [ 4]  948 	call AT  
      009C87 CD 04 74         [ 4]  949 	call DUPP ; ( udl udl -- )
      009C87 35 20 50         [ 4]  950 	call CNTXT 
      009C8A 5B 35 DF         [ 4]  951 	call AT 
      009C8D 50 5C 4F         [ 4]  952 	call DOLIT 
      009C90 90 5F                  953 	.word 2 
      009C92 91 A7 00         [ 4]  954 	call SUBB ; ( udl udl a -- )
      009C95 32 90 5C         [ 4]  955 	call SWAPP 
      009C98 91 A7 00         [ 4]  956 	call FADDR 
      009C9B 32 90 5C         [ 4]  957 	call ROT  ; ( udl ud a -- )
      009C9E 91 A7 00         [ 4]  958 	call DUPP 
      009CA1 32 90 5C         [ 4]  959 	call TOR    ; R: a 
      001F51                        960 FMOVE2: 
      009CA4 91 A7 00         [ 4]  961 	call HERE 
      009CA7 32 72 05         [ 4]  962 	call RAT 
      009CAA 50 5F FB         [ 4]  963 	call SUBB ; (udl ud a wl -- )
      001F5A                        964 next_row:
      009CAD 81 04 74         [ 4]  965 	call DUPP 
      009CAE CD 04 3D         [ 4]  966 	call TOR  ; ( udl ud a wl -- ) R: a wl
      009CAE CD 1E C1         [ 4]  967 	call RAM2EE ; ( udl a u -- udl u2 ) u2 is byte written to FLASH 
      009CAE 4B 80 72         [ 4]  968 	call DUPP 
      009CB1 10 50 5B         [ 4]  969 	call TOR
      009CB4 72 11 50         [ 4]  970 	call PLUS  ; ( udl+ ) 
      009CB7 5C 90 5F         [ 4]  971 	call DUPP 
      009CBA F6 91 A7         [ 4]  972 	call ZERO   ; ( udl+ ud -- )
      009CBD 00 32 5C         [ 4]  973 	call RFROM  ; ( udl+ ud u2  R: a wl ) 
      009CC0 90 5C 0A         [ 4]  974 	call RFROM  ; ( udl+ ud u2 wl R: a ) 
      009CC3 01 26 F4         [ 4]  975 	call OVER   ; ( udl+ ud u2 wl u2 -- )
      009CC6 72 05 50         [ 4]  976 	call SUBB  ; ( udl+ ud u2 wl- R: a )
      009CC9 5F FB 84         [ 4]  977 	call DUPP 
      009CCC 81 03 78         [ 4]  978 	call QBRAN
      009CCD 1F 9D                  979 	.word fmove_done 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      009CCD CD 04 84         [ 4]  980 	call SWAPP  ; ( udl+ ud wl- u2 R: a )
      009CCD 1D 00 06         [ 4]  981 	call RFROM ; ( udl+ ud wl- u2 a -- ) 
      009CD0 90 AE 9C         [ 4]  982 	call PLUS  ; ( udl+2 ud wl- a+ )
      009CD3 AE EF 04         [ 4]  983 	call DUPP 
      009CD6 90 AE 17         [ 4]  984 	call TOR   ; ( udl+2 ud wl- a+ ) R: a+
      009CD9 00 EF 02         [ 4]  985 	call SWAPP 
      009CDC 90 AE 9C         [ 4]  986 	call BRAN
      009CDF CD 72                  987 	.word next_row  
      001F9D                        988 fmove_done:	
      009CE1 A2 9C AE         [ 4]  989 	call RFROM  ; ( -- udl+ ud u2 wl- a  )
      009CE4 FF CD 8B         [ 2]  990 	addw x,#5*CELLL ; (  -- udl+ ) new CP 
      009CE7 76               [ 4]  991  	ret  
      001FA4                        992 no_move:
      009CE8 81 9C 30         [ 4]  993 	call ZERO
      009CEB 06               [ 4]  994 	ret 
                                    995 
                                    996 ;------------------------------------------
                                    997 ; adjust pointers after **FMOVE** operetion.
                                    998 ; UPDAT-PTR ( cp+ -- )
                                    999 ; cp+ is new CP position after FMOVE 
                                   1000 ;-------------------------------------------
      009CEC 57 52                 1001 	.word LINK 
                           001FAA  1002 	LINK=.
      009CEE 2D                    1003 	.byte 9
      009CEF 52 4F 57 41 54 2D 50  1004 	.ascii "UPDAT-PTR" 
             54 52
      009CF2                       1005 UPDATPTR:
                                   1006 ;reset VP to previous position  
      009CF2 CD 9A 00         [ 4] 1007 	call EEPVP 
      009CF5 A6 80 B4         [ 4] 1008 	call DROP 
      009CF8 34 B7 34         [ 4] 1009 	call AT
      009CFB CD 9C CD         [ 4] 1010 	call VPP 
      009CFE CD 9B 56         [ 4] 1011 	call STORE
                                   1012 ;update CONTEXT and LAST 
      009D01 90 93 90         [ 4] 1013 	call EEPCP 
      009D04 FE 1C 00         [ 4] 1014 	call DROP
      009D07 02 89 93         [ 4] 1015 	call AT
      009D0A CD 17 00         [ 4] 1016 	call DOLIT 
      009D0D CD 9B                 1017 	.word 2 
      009D0F 7E 85 81         [ 4] 1018 	call PLUS 
      009D12 9C EB 07         [ 4] 1019 	call DUPP 
      009D15 53 45 54         [ 4] 1020 	call CNTXT 
      009D18 2D 4F 50         [ 4] 1021 	call STORE
      009D1B 54 05 E0         [ 4] 1022 	call LAST
      009D1C CD 03 B6         [ 4] 1023 	call STORE 
      009D1C 90 93 90         [ 4] 1024 	call UPDATLAST 
                                   1025 ;update CP 
      009D1F FE 27 06         [ 4] 1026 	call CPP 
      009D22 90 A3 00         [ 4] 1027 	call STORE
      009D25 07 23 04         [ 4] 1028 	call UPDATCP 
      009D28 1C               [ 4] 1029 	ret 
                                   1030 
                                   1031 ;-----------------------------
                                   1032 ; move interrupt sub-routine
                                   1033 ; in flash memory
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



                                   1034 ;----------------------------- 
      009D29 00 04                 1035 	.word LINK 
                           001FF2  1036 	LINK=. 
      009D2B 81                    1037 	.byte 6
      009D2C 90 58 72 A9 47 FF     1038 	.ascii "IFMOVE" 
      001FF9                       1039 IFMOVE:
      009D32 FF 1D 00         [ 4] 1040 	call TFLASH 
      009D35 02 90 5F         [ 4] 1041 	CALL AT 
      009D38 FF CD 9B         [ 4] 1042 	CALL QBRAN 
      009D3B C4 81                 1043 	.word no_move 
      009D3D 9D 14 08         [ 4] 1044 	call CPP 
      009D40 50 52 49         [ 4] 1045 	call AT 
      009D43 53 54 49         [ 4] 1046 	call DUPP ; ( udl udl -- )
      009D46 4E 45 FA         [ 4] 1047 	call EEPVP 
      009D48 CD 04 6A         [ 4] 1048 	call DROP
      009D48 CD 9A 1F         [ 4] 1049 	call AT  ; ( udl udl a )
      009D4B CD 86 DA         [ 4] 1050 	call TOR 
      009D4E CD 9C 3A         [ 4] 1051 	call FADDR
      009D51 90 93 90         [ 4] 1052 	call RAT ; ( udl ud a -- ) R: a 
      009D54 EE 02 72         [ 2] 1053 	jp FMOVE2 
                                   1054 
                                   1055 
                                   1056 ; application code begin here
      002080                       1057 	.bndry 128 ; align on flash block  
      002080                       1058 app_space: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



                                   4635 .endif ; PICATOUT_MOD
                                   4636 
                           000001  4637 WANT_MATH_CONST = 1 
                           000001  4638 .if WANT_MATH_CONST 
                                   4639         ; irrational constants 
                                   4640         ; approximation by integers ratio.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



                                   4641         .include "const_ratio.asm"
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
      009D57 A9 00                   31         .word LINK 
                           002082    32         LINK=.
      009D59 80                      33         .byte 2
      009D5A EF 02                   34         .ascii "PI" 
      002085                         35 PII:
      009D5C 90 A3 48         [ 2]   36         subw x,#2*CELLL 
      009D5F 00 25 E9 90      [ 2]   37         ldw y,#355 
      009D63 AE 00            [ 2]   38         ldw (2,x),y 
      009D65 01 FF 90 5F      [ 2]   39         ldw y,#113 
      009D69 EF               [ 2]   40         ldw (x),y 
      009D6A 02               [ 4]   41         ret 
                                     42 
                                     43 ;      SQRT2 ( -- 19601  13860 )
                                     44 ; precision: 1.5e-9 
                                     45 ; usage example to compute Voltage peek to peek from Vrms 
                                     46 ; : VPP SQRT2 */ 2 * ;
                                     47 ;
      009D6B CD 86                   48         .word LINK 
                           002096    49         LINK=.
      009D6D DA                      50         .byte 5 
      009D6E CD 9D 1C 90 93          51         .ascii "SQRT2" 
      00209C                         52 SQRT2:
      009D73 90 FE 90         [ 2]   53         subw x,#2*CELLL 
      009D76 5C 90 A3 00      [ 2]   54         ldw y,#19601 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



      009D7A 08 25            [ 2]   55         ldw (2,x),y 
      009D7C E9 90 AE A1      [ 2]   56         ldw y,#13860 
      009D80 00               [ 2]   57         ldw (x),y 
      009D81 EF               [ 4]   58         ret 
                                     59 
                                     60 ;   SQRT3 ( -- 18817 10864 )
                                     61 ; precision: 1.1e-9
                                     62 ;
      009D82 02 90                   63         .word LINK 
                           0020AD    64         LINK=.
      009D84 5F                      65         .byte 5
      009D85 FF CD 9C 3A 1D          66         .ascii "SQRT3" 
      0020B3                         67 SQRT3: 
      009D8A 00 02 90         [ 2]   68     subw x,#2*CELLL 
      009D8D 5F FF CD 84      [ 2]   69     ldw y,#18817 
      009D91 F4 CD            [ 2]   70     ldw (2,x),y 
      009D93 9D AF 90 93      [ 2]   71     ldw y,#10864 
      009D97 90               [ 2]   72     ldw (x),y 
      009D98 FE               [ 4]   73     ret 
                                     74 
                                     75 ;   E ( -- 28667 10546 )
                                     76 ; precision: 5.5e-9 
                                     77 ; natural log base 
      009D99 90 5C                   78         .word LINK 
                           0020C4    79         LINK=.
      009D9B 90                      80         .byte 1
      009D9C A3                      81         .ascii "E" 
      0020C6                         82 ENEPER:
      009D9D 00 19 25         [ 2]   83     subw x,#2*CELLL 
      009DA0 ED CC 80 80      [ 2]   84     ldw y,#28667 
      009DA4 9D 3F            [ 2]   85     ldw (2,x),y 
      009DA6 08 52 53 54      [ 2]   86     ldw y,#10546 
      009DAA 2D               [ 2]   87     ldw (x),y 
      009DAB 49               [ 4]   88     ret 
                                     89 
                                     90 ;   SQRT10 ( -- 22936 7253 )
                                     91 ; precision: 5.7e-9 
      009DAC 56 45                   92         .word LINK 
                           0020D7    93         LINK=.
      009DAE 43                      94         .byte 6 
      009DAF 53 51 52 54 31 30       95         .ascii "SQRT10" 
      0020DE                         96 SQRT10:
      009DAF 90 93 1C         [ 2]   97     subw x,#2*CELLL
      009DB2 00 02 90 FE      [ 2]   98     ldw y,#22936 
      009DB6 90 A3            [ 2]   99     ldw (2,x),y 
      009DB8 00 17 27 3A      [ 2]  100     ldw y,#7253
      009DBC 90               [ 2]  101     ldw (x),y 
      009DBD A3               [ 4]  102     ret 
                                    103 
                                    104 ;   SQRT12 ( -- 26797 25293 )
                                    105 ; precision: 1.0e-9 
                                    106 ; used in music to compute well tempered scale
      009DBE 00 1D                  107         .word LINK 
                           0020EF   108         LINK=. 
      009DC0 22                     109         .byte 6 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



      009DC1 34 90 58 90 58 72      110         .ascii "SQRT12"
      0020F6                        111 SQRT12:
      009DC7 A9 80 08         [ 2]  112     subw x,#2*CELLL 
      009DCA 90 BF 24 1D      [ 2]  113     ldw y,#26797
      009DCE 00 06            [ 2]  114     ldw (2,x),y 
      009DD0 EF 02 90 5F      [ 2]  115     ldw y,#25293
      009DD4 FF               [ 2]  116     ldw (x),y 
      009DD5 A6               [ 4]  117     ret 
                                    118 
                                    119 ;   LOG2 ( -- 2040 11103 )
                                    120 ; precision: 1.1e-8
      009DD6 82 90                  121         .word LINK 
                           002107   122         LINK=.
      009DD8 95                     123         .byte 4 
      009DD9 EF 04 CD 9C            124         .ascii "LOG2" 
      00210C                        125 LOG2:
      009DDD 10 1D 00         [ 2]  126     subw x,#2*CELLL
      009DE0 06 90 5F FF      [ 2]  127     ldw y,#2040 
      009DE4 90 AE            [ 2]  128     ldw (2,x),y 
      009DE6 80 80 EF 04      [ 2]  129     ldw y,#11103 
      009DEA 90               [ 2]  130     ldw (x),y 
      009DEB BE               [ 4]  131     ret 
                                    132 
                                    133 ;   LN2 ( -- 485 11464 )
                                    134 ; precision: 1.0e-7 
      009DEC 24 72                  135         .word LINK 
                           00211D   136         LINK=.
      009DEE A9                     137         .byte 3 
      009DEF 00 02 EF               138         .ascii "LN2" 
      002121                        139 LN2: 
      009DF2 02 CD 9C         [ 2]  140     subw x,#2*CELLL
      009DF5 10 81 9D A6      [ 2]  141     ldw y,#485
      009DF9 07 43            [ 2]  142     ldw (2,x),y 
      009DFB 48 4B 49 56      [ 2]  143     ldw y,#11464 
      009DFF 45               [ 2]  144     ldw (x),y 
      009E00 43               [ 4]  145     ret 
                                    146 
                                    147 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



                                   4642 .endif 
                                   4643 
                                   4644 ;===============================================================
                                   4645 
                           00211D  4646 LASTN =	LINK   ;last name defined
                                   4647 
                                   4648 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   6 AB1        0006F0 R   |   6 ABOR1      001245 R
  6 ABOR2      00125C R   |   6 ABORQ      00123D R   |   6 ABORT      00122E R
  6 ABRTQ      001519 R   |   6 ABSS       0006E7 R   |   6 ACCEP      0011C4 R
  6 ACCP1      0011CD R   |   6 ACCP2      0011F3 R   |   6 ACCP3      0011F6 R
  6 ACCP4      0011F8 R   |     ADC_CR1 =  005401     |     ADC_CR1_=  000000 
    ADC_CR1_=  000001     |     ADC_CR1_=  000004     |     ADC_CR1_=  000005 
    ADC_CR1_=  000006     |     ADC_CR2 =  005402     |     ADC_CR2_=  000003 
    ADC_CR2_=  000004     |     ADC_CR2_=  000005     |     ADC_CR2_=  000006 
    ADC_CR2_=  000001     |     ADC_CR3 =  005403     |     ADC_CR3_=  000007 
    ADC_CR3_=  000006     |     ADC_CSR =  005400     |     ADC_CSR_=  000006 
    ADC_CSR_=  000004     |     ADC_CSR_=  000000     |     ADC_CSR_=  000001 
    ADC_CSR_=  000002     |     ADC_CSR_=  000003     |     ADC_CSR_=  000007 
    ADC_CSR_=  000005     |     ADC_DRH =  005404     |     ADC_DRL =  005405 
    ADC_TDRH=  005406     |     ADC_TDRL=  005407     |   6 ADRADJ     00060E R
    AFR     =  004803     |     AFR0_ADC=  000000     |     AFR1_TIM=  000001 
    AFR2_CCO=  000002     |     AFR3_TIM=  000003     |     AFR4_TIM=  000004 
    AFR5_TIM=  000005     |     AFR6_I2C=  000006     |     AFR7_BEE=  000007 
  6 AFT        001504 R   |   6 AGAIN      00145A R   |   6 AHEAD      0014B7 R
  6 ALLOT      00136D R   |   6 ANDD       0004C0 R   |     APP_CP  =  004004 
    APP_LAST=  004000     |     APP_RUN =  004002     |     APP_VP  =  004006 
  6 AT         0003CD R   |   6 ATEXE      000ADF R   |   6 AUTORUN    000123 R
    AWU_APR =  0050F1     |     AWU_CSR =  0050F0     |     AWU_TBR =  0050F2 
    B0_MASK =  000001     |     B115200 =  000006     |     B19200  =  000003 
    B1_MASK =  000002     |     B230400 =  000007     |     B2400   =  000000 
    B2_MASK =  000004     |     B38400  =  000004     |     B3_MASK =  000008 
    B460800 =  000008     |     B4800   =  000001     |     B4_MASK =  000010 
    B57600  =  000005     |     B5_MASK =  000020     |     B6_MASK =  000040 
    B7_MASK =  000080     |     B921600 =  000009     |     B9600   =  000002 
  6 BACK1      00116C R   |   6 BASE       000531 R   |     BASEE   =  00000A 
    BCNT    =  000001     |   6 BCOMP      0013AF R   |   6 BDIGS      000BC7 R
    BEEP_BIT=  000004     |     BEEP_CSR=  0050F3     |     BEEP_MAS=  000010 
    BEEP_POR=  00000F     |   6 BEGIN      00143C R   |     BIT0    =  000000 
    BIT1    =  000001     |     BIT2    =  000002     |     BIT3    =  000003 
    BIT4    =  000004     |     BIT5    =  000005     |     BIT6    =  000006 
    BIT7    =  000007     |   6 BKSLA      001004 R   |   6 BKSP       00113C R
    BKSPP   =  000008     |   6 BLANK      0009AD R   |     BLOCK_SI=  000080 
    BOOT_ROM=  006000     |     BOOT_ROM=  007FFF     |   6 BRAN       00038F R
    BTW     =  000001     |   6 BUF2ROW    001E93 R   |   6 BYE        0000B0 R
    CADR    =  000003     |     CALLL   =  0000CD     |     CAN_DGR =  005426 
    CAN_FPSR=  005427     |     CAN_IER =  005425     |     CAN_MCR =  005420 
    CAN_MSR =  005421     |     CAN_P0  =  005428     |     CAN_P1  =  005429 
    CAN_P2  =  00542A     |     CAN_P3  =  00542B     |     CAN_P4  =  00542C 
    CAN_P5  =  00542D     |     CAN_P6  =  00542E     |     CAN_P7  =  00542F 
    CAN_P8  =  005430     |     CAN_P9  =  005431     |     CAN_PA  =  005432 
    CAN_PB  =  005433     |     CAN_PC  =  005434     |     CAN_PD  =  005435 
    CAN_PE  =  005436     |     CAN_PF  =  005437     |     CAN_RFR =  005424 
    CAN_TPR =  005423     |     CAN_TSR =  005422     |     CARRY   =  000028 
  6 CAT        0003EB R   |   6 CCOMMA     001391 R   |     CC_C    =  000000 
    CC_H    =  000004     |     CC_I0   =  000003     |     CC_I1   =  000005 
    CC_N    =  000002     |     CC_V    =  000007     |     CC_Z    =  000001 
    CELLL   =  000002     |   6 CELLM      000932 R   |   6 CELLP      000923 R
  6 CELLS      000941 R   |     CFG_GCR =  007F60     |     CFG_GCR_=  000001 
    CFG_GCR_=  000000     |   6 CHAR1      000DF4 R   |   6 CHAR2      000DF7 R
  6 CHKIVEC    001D81 R   |     CLKOPT  =  004807     |     CLKOPT_C=  000002 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]

Symbol Table

    CLKOPT_E=  000003     |     CLKOPT_P=  000000     |     CLKOPT_P=  000001 
    CLK_CCOR=  0050C9     |     CLK_CKDI=  0050C6     |     CLK_CKDI=  000000 
    CLK_CKDI=  000001     |     CLK_CKDI=  000002     |     CLK_CKDI=  000003 
    CLK_CKDI=  000004     |     CLK_CMSR=  0050C3     |     CLK_CSSR=  0050C8 
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
    CLK_SWR_=  0000D2     |   6 CMOV1      000AFE R   |   6 CMOV2      000B16 R
  6 CMOVE      000AF6 R   |     CNTDWN  =  000030     |   6 CNTXT      0005B4 R
  6 COLD       001911 R   |   6 COLD1      001911 R   |   6 COLON      0016AF R
  6 COMMA      00137A R   |   6 COMPI      0013BF R   |     COMPO   =  000040 
  6 CONSTANT   001759 R   |     CONVERT_=  000001     |   6 COUNT      000A92 R
  6 CPP        0005D0 R   |     CPU_A   =  007F00     |     CPU_CCR =  007F0A 
    CPU_PCE =  007F01     |     CPU_PCH =  007F02     |     CPU_PCL =  007F03 
    CPU_SPH =  007F08     |     CPU_SPL =  007F09     |     CPU_XH  =  007F04 
    CPU_XL  =  007F05     |     CPU_YH  =  007F06     |     CPU_YL  =  007F07 
  6 CR         000E22 R   |   6 CREAT      0016F5 R   |     CRR     =  00000D 
  6 CSTOR      0003DA R   |   6 DAT        000A72 R   |     DATSTK  =  001680 
  6 DDROP      00064F R   |   6 DDUP       00065A R   |     DEBUG_BA=  007F00 
    DEBUG_EN=  007FFF     |   6 DECIM      000C77 R   |   6 DEPTH      0009FD R
    DEVID_BA=  0048CD     |     DEVID_EN=  0048D8     |     DEVID_LO=  0048D2 
    DEVID_LO=  0048D3     |     DEVID_LO=  0048D4     |     DEVID_LO=  0048D5 
    DEVID_LO=  0048D6     |     DEVID_LO=  0048D7     |     DEVID_LO=  0048D8 
    DEVID_WA=  0048D1     |     DEVID_XH=  0048CE     |     DEVID_XL=  0048CD 
    DEVID_YH=  0048D0     |     DEVID_YL=  0048CF     |   6 DGTQ1      000CBC R
  6 DI         0000BE R   |   6 DIG        000BF0 R   |   6 DIGIT      000B8B R
  6 DIGS       000C01 R   |   6 DIGS1      000C01 R   |   6 DIGS2      000C0E R
  6 DIGTQ      000C8B R   |     DM_BK1RE=  007F90     |     DM_BK1RH=  007F91 
    DM_BK1RL=  007F92     |     DM_BK2RE=  007F93     |     DM_BK2RH=  007F94 
    DM_BK2RL=  007F95     |     DM_CR1  =  007F96     |     DM_CR2  =  007F97 
    DM_CSR1 =  007F98     |     DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A 
  6 DN1        0006C7 R   |   6 DNEGA      0006AC R   |   6 DOCONST    001783 R
  6 DOLIT      000345 R   |   6 DONXT      000359 R   |   6 DOSTR      000E38 R
  6 DOT        000EBD R   |   6 DOT1       000ED3 R   |   6 DOTI1      0018A5 R
  6 DOTID      00188F R   |   6 DOTO1      0012D1 R   |   6 DOTOK      0012B7 R
  6 DOTPR      000FE6 R   |   6 DOTQ       001533 R   |   6 DOTQP      000E61 R
  6 DOTR       000E6F R   |   6 DOTS       001831 R   |   6 DOTS1      00183C R
  6 DOTS2      001845 R   |   6 DOVAR      000521 R   |   6 DROP       00046A R
  6 DSTOR      000A4C R   |   6 DUMP       0017E7 R   |   6 DUMP1      0017FE R
  6 DUMP3      001820 R   |   6 DUMPP      0017B6 R   |   6 DUPP       000474 R
  6 EDIGS      000C2C R   |   6 EEPCP      0019E4 R   |   6 EEPLAST    0019B7 R
  6 EEPROM     00199F R   |     EEPROM_B=  004000     |     EEPROM_E=  0047FF 
    EEPROM_S=  000800     |   6 EEPRUN     0019CE R   |   6 EEPVP      0019FA R
  6 EI         0000B7 R   |   6 ELSEE      001492 R   |   6 EMIT       00032F R
  6 ENEPER     0020C6 R   |   6 EQ1        00070B R   |   6 EQUAL      0006F5 R
  6 ERASE      000B58 R   |     ERR     =  00001B     |   6 EVAL       0012FA R
  6 EVAL1      0012FA R   |   6 EVAL2      001316 R   |   6 EXE1       000AED R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]

Symbol Table

  6 EXECU      00039F R   |   6 EXIT       0003AF R   |     EXT     =  000000 
    EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1     |   6 EXTRC      000BB3 R
  6 FADDR      001F15 R   |     FHSE    =  7A1200     |     FHSI    =  F42400 
  6 FILL       000B25 R   |   6 FILL1      000B42 R   |   6 FILL2      000B4B R
  6 FIND       001098 R   |   6 FIND1      0010B6 R   |   6 FIND2      0010E4 R
  6 FIND3      0010F0 R   |   6 FIND4      001104 R   |   6 FIND5      001111 R
  6 FIND6      0010F5 R   |     FLASH_BA=  008000     |     FLASH_CR=  00505A 
    FLASH_CR=  000002     |     FLASH_CR=  000000     |     FLASH_CR=  000003 
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
    FLASH_WS=  00480D     |     FLSI    =  01F400     |   6 FMOVE      001F20 R
  6 FMOVE2     001F51 R   |   6 FOR        00140F R   |   6 FORGET     000154 R
  6 FORGET1    000183 R   |   6 FORGET2    000209 R   |   6 FORGET4    000212 R
  6 FORGET6    0001CB R   |     FPTR    =  000032     |   6 FREEVAR    00021F R
  6 FREEVAR4   000255 R   |     GPIO_BAS=  005000     |     GPIO_CR1=  000003 
    GPIO_CR2=  000004     |     GPIO_DDR=  000002     |     GPIO_IDR=  000001 
    GPIO_ODR=  000000     |     GPIO_SIZ=  000005     |   6 HERE       000AA9 R
  6 HEX        000C62 R   |   6 HI         0018E4 R   |   6 HLD        0005A1 R
  6 HOLD       000BD7 R   |     HSECNT  =  004809     |     I2C_CCRH=  00521C 
    I2C_CCRH=  000080     |     I2C_CCRH=  0000C0     |     I2C_CCRH=  000080 
    I2C_CCRH=  000000     |     I2C_CCRH=  000001     |     I2C_CCRH=  000000 
    I2C_CCRL=  00521B     |     I2C_CCRL=  00001A     |     I2C_CCRL=  000002 
    I2C_CCRL=  00000D     |     I2C_CCRL=  000050     |     I2C_CCRL=  000090 
    I2C_CCRL=  0000A0     |     I2C_CR1 =  005210     |     I2C_CR1_=  000006 
    I2C_CR1_=  000007     |     I2C_CR1_=  000000     |     I2C_CR2 =  005211 
    I2C_CR2_=  000002     |     I2C_CR2_=  000003     |     I2C_CR2_=  000000 
    I2C_CR2_=  000001     |     I2C_CR2_=  000007     |     I2C_DR  =  005216 
    I2C_FREQ=  005212     |     I2C_ITR =  00521A     |     I2C_ITR_=  000002 
    I2C_ITR_=  000000     |     I2C_ITR_=  000001     |     I2C_OARH=  005214 
    I2C_OARH=  000001     |     I2C_OARH=  000002     |     I2C_OARH=  000006 
    I2C_OARH=  000007     |     I2C_OARL=  005213     |     I2C_OARL=  000000 
    I2C_OAR_=  000813     |     I2C_OAR_=  000009     |     I2C_PECR=  00521E 
    I2C_READ=  000001     |     I2C_SR1 =  005217     |     I2C_SR1_=  000003 
    I2C_SR1_=  000001     |     I2C_SR1_=  000002     |     I2C_SR1_=  000006 
    I2C_SR1_=  000000     |     I2C_SR1_=  000004     |     I2C_SR1_=  000007 
    I2C_SR2 =  005218     |     I2C_SR2_=  000002     |     I2C_SR2_=  000001 
    I2C_SR2_=  000000     |     I2C_SR2_=  000003     |     I2C_SR2_=  000005 
    I2C_SR3 =  005219     |     I2C_SR3_=  000001     |     I2C_SR3_=  000007 
    I2C_SR3_=  000004     |     I2C_SR3_=  000000     |     I2C_SR3_=  000002 
    I2C_TRIS=  00521D     |     I2C_TRIS=  000005     |     I2C_TRIS=  000005 
    I2C_TRIS=  000005     |     I2C_TRIS=  000011     |     I2C_TRIS=  000011 
    I2C_TRIS=  000011     |     I2C_WRIT=  000000     |   6 ICOLON     0016C0 R
  6 IFETCH     00142D R   |   6 IFF        00146A R   |   6 IFMOVE     001FF9 R
    IMEDD   =  000080     |   6 IMMED      0016D2 R   |   6 INCH       000323 R
  6 INITOFS    001688 R   |   6 INN        00054F R   |     INPUT_DI=  000000 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]

Symbol Table

    INPUT_EI=  000001     |     INPUT_FL=  000000     |     INPUT_PU=  000001 
  6 INTE1      001299 R   |   6 INTER      00126F R   |     INT_ADC2=  000016 
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
    INT_VECT=  008018     |     INT_VECT=  00801C     |     INT_VECT=  008020 
    INT_VECT=  008024     |     INT_VECT=  008068     |     INT_VECT=  008054 
    INT_VECT=  008000     |     INT_VECT=  008030     |     INT_VECT=  008038 
    INT_VECT=  008034     |     INT_VECT=  008040     |     INT_VECT=  00803C 
    INT_VECT=  008048     |     INT_VECT=  008044     |     INT_VECT=  008064 
    INT_VECT=  008008     |     INT_VECT=  008004     |     INT_VECT=  008050 
    INT_VECT=  00804C     |     INT_VECT=  00805C     |     INT_VECT=  008058 
  6 INVER      000689 R   |     IPR0    =  000002     |     IPR1    =  000001 
    IPR2    =  000000     |     IPR3    =  000003     |     IPR_MASK=  000003 
    IRET_COD=  000080     |   6 ISEMI      00161D R   |     ITC_SPR1=  007F70 
    ITC_SPR2=  007F71     |     ITC_SPR3=  007F72     |     ITC_SPR4=  007F73 
    ITC_SPR5=  007F74     |     ITC_SPR6=  007F75     |     ITC_SPR7=  007F76 
    ITC_SPR8=  007F77     |     IWDG_KR =  0050E0     |     IWDG_PR =  0050E1 
    IWDG_RLR=  0050E2     |   6 JSRC       001672 R   |   6 KEY        000DA2 R
  6 KTAP       001189 R   |   6 KTAP1      0011AC R   |   6 KTAP2      0011AF R
  6 LAST       0005E0 R   |   6 LASTN   =  00211D R   |   6 LBRAC      0012A6 R
    LED2_BIT=  000005     |     LED2_MAS=  000020     |     LED2_POR=  00500A 
  6 LESS       000732 R   |     LF      =  00000A     |   6 LINK    =  00211D R
  6 LITER      0013E1 R   |   6 LN2        002121 R   |   6 LOG2       00210C R
  6 LSHIFT     00096C R   |   6 LSHIFT1    000975 R   |   6 LSHIFT4    00097D R
  6 LT1        000748 R   |     MASKK   =  001F7F     |   6 MAX        000752 R
  6 MAX1       000765 R   |   6 MIN        00076F R   |   6 MIN1       000782 R
  6 MMOD1      000825 R   |   6 MMOD2      000839 R   |   6 MMOD3      000850 R
  6 MMSM1      0007CC R   |   6 MMSM2      0007E0 R   |   6 MMSM3      0007E2 R
  6 MMSM4      0007EA R   |   6 MODD       00086A R   |   6 MONE       0009D3 R
    MS      =  00002E     |   6 MSEC       00025F R   |   6 MSMOD      000808 R
  6 MSTA1      0008FB R   |   6 MSTAR      0008D8 R   |     NAFR    =  004804 
  6 NAMEQ      001131 R   |   6 NAMET      001042 R   |     NCLKOPT =  004808 
  6 NEGAT      00069A R   |   6 NEX1       000366 R   |   6 NEXT       00141E R
    NFLASH_W=  00480E     |     NHSECNT =  00480A     |     NOPT1   =  004802 
    NOPT2   =  004804     |     NOPT3   =  004806     |     NOPT4   =  004808 
    NOPT5   =  00480A     |     NOPT6   =  00480C     |     NOPT7   =  00480E 
    NOPTBL  =  00487F     |   6 NTIB       00055F R   |     NUBC    =  004802 
  6 NUFQ       000DB8 R   |   6 NUFQ1      000DD1 R   |   6 NUMBQ      000CCF R
  6 NUMQ1      000D03 R   |   6 NUMQ2      000D34 R   |   6 NUMQ3      000D76 R
  6 NUMQ4      000D7B R   |   6 NUMQ5      000D8A R   |   6 NUMQ6      000D8D R
    NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC 
    NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE     |   6 NonHandl   000000 R
  6 OFFSET     000605 R   |     OFS     =  000005     |   6 ONE        0009C5 R
  6 ONEM       00095B R   |   6 ONEP       00094E R   |     OPT     =  000002 
    OPT0    =  004800     |     OPT1    =  004801     |     OPT2    =  004803 
    OPT3    =  004805     |     OPT4    =  004807     |     OPT5    =  004809 
    OPT6    =  00480B     |     OPT7    =  00480D     |     OPTBL   =  00487E 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]

Symbol Table

    OPTION_B=  004800     |     OPTION_E=  00487F     |     OPTION_S=  000080 
  6 ORIG       000043 R   |   6 ORR        0004D4 R   |   6 OUTPUT     000334 R
    OUTPUT_F=  000001     |     OUTPUT_O=  000000     |     OUTPUT_P=  000001 
    OUTPUT_S=  000000     |   6 OVER       00049E R   |   6 OVERT      0015EE R
    PA      =  000000     |   6 PACKS      000B6A R   |   6 PAD        000ABA R
  6 PAREN      000FF5 R   |   6 PARS       000EEE R   |   6 PARS1      000F19 R
  6 PARS2      000F44 R   |   6 PARS3      000F47 R   |   6 PARS4      000F50 R
  6 PARS5      000F73 R   |   6 PARS6      000F88 R   |   6 PARS7      000F97 R
  6 PARS8      000FA6 R   |   6 PARSE      000FB7 R   |   6 PAUSE      00026F R
    PA_BASE =  005000     |     PA_CR1  =  005003     |     PA_CR2  =  005004 
    PA_DDR  =  005002     |     PA_IDR  =  005001     |     PA_ODR  =  005000 
    PB      =  000005     |     PB_BASE =  005005     |     PB_CR1  =  005008 
    PB_CR2  =  005009     |     PB_DDR  =  005007     |     PB_IDR  =  005006 
    PB_ODR  =  005005     |     PC      =  00000A     |     PC_BASE =  00500A 
    PC_CR1  =  00500D     |     PC_CR2  =  00500E     |     PC_DDR  =  00500C 
    PC_IDR  =  00500B     |     PC_ODR  =  00500A     |     PD      =  00000F 
  6 PDUM1      0017C9 R   |   6 PDUM2      0017DA R   |     PD_BASE =  00500F 
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
    PI      =  000028     |     PICATOUT=  000001     |   6 PICK       000A14 R
  6 PII        002085 R   |     PI_BASE =  005028     |     PI_CR1  =  00502B 
    PI_CR2  =  00502C     |     PI_DDR  =  00502A     |     PI_IDR  =  005029 
    PI_ODR  =  005028     |   6 PLUS       00066F R   |   6 PNAM1      0015A3 R
  6 PRESE      001325 R   |     PROD1   =  000022     |     PROD2   =  000024 
    PROD3   =  000026     |   6 PROTECTE   0001FB R   |   6 PSTOR      000A2B R
    PTR16   =  000033     |     PTR8    =  000034     |   6 QBRAN      000378 R
  6 QDUP       00061E R   |   6 QDUP1      000628 R   |   6 QKEY       000311 R
  6 QSTAC      0012DD R   |   6 QUERY      001209 R   |   6 QUEST      000EE0 R
  6 QUIT       001342 R   |   6 QUIT1      00134A R   |   6 QUIT2      00134D R
  6 RAM2EE     001EC1 R   |     RAMBASE =  000000     |   6 RAMLAST    0005F3 R
    RAM_BASE=  000000     |     RAM_END =  0017FF     |     RAM_SIZE=  001800 
  6 RAT        000431 R   |   6 RBRAC      00165F R   |   6 REPEA      0014E7 R
  6 RFREE      001EA8 R   |   6 RFROM      00041E R   |     ROP     =  004800 
  6 ROT        00062F R   |   6 ROW2BUF    001E6A R   |     ROWBUFF =  001680 
    RP0     =  00002C     |   6 RPAT       0003FB R   |     RPP     =  0017FF 
  6 RPSTO      000408 R   |   6 RSHIFT     000988 R   |   6 RSHIFT1    000991 R
  6 RSHIFT4    000999 R   |     RST_SR  =  0050B3     |   6 SAME1      001060 R
  6 SAME2      001089 R   |   6 SAMEQ      001058 R   |   6 SCOM1      0015D8 R
  6 SCOM2      0015DB R   |   6 SCOMP      0015BA R   |   6 SEMIS      0015FE R
  6 SETISP     0000CA R   |   6 SET_RAML   001742 R   |     SFR_BASE=  005000 
    SFR_END =  0057FF     |   6 SIGN       000C16 R   |   6 SIGN1      000C26 R
  6 SLASH      000874 R   |   6 SLMOD      000858 R   |   6 SNAME      00156D R
    SP0     =  00002A     |   6 SPACE      000DDA R   |   6 SPACS      000DE9 R
  6 SPAT       000454 R   |     SPI_CR1 =  005200     |     SPI_CR2 =  005201 
    SPI_CRCP=  005205     |     SPI_DR  =  005204     |     SPI_ICR =  005202 
    SPI_RXCR=  005206     |     SPI_SR  =  005203     |     SPI_TXCR=  005207 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]

Symbol Table

    SPP     =  001680     |   6 SPSTO      000461 R   |   6 SQRT10     0020DE R
  6 SQRT12     0020F6 R   |   6 SQRT2      00209C R   |   6 SQRT3      0020B3 R
  6 SSMOD      000904 R   |     SSP     =  000001     |     STACK   =  0017FF 
  6 STAR       0008CD R   |   6 STASL      000915 R   |   6 STORE      0003B6 R
  6 STR        000C44 R   |   6 STRCQ      0013EF R   |   6 STRQ       001526 R
  6 STRQP      000E57 R   |   6 SUBB       0006CD R   |   6 SWAPP      000484 R
    SWIM_CSR=  007F80     |   6 TAP        001173 R   |   6 TBOOT      001905 R
  6 TBUF       00056F R   |     TBUFFBAS=  001680     |   6 TCHA1      0009F4 R
  6 TCHAR      0009E4 R   |   6 TEMP       000540 R   |   6 TEVAL      000592 R
  6 TFLASH     000581 R   |   6 THENN      00147F R   |   6 TIB        000ACB R
    TIBB    =  001700     |     TIBBASE =  001700     |     TIC     =  000027 
  6 TICK       001359 R   |     TIM1_ARR=  005262     |     TIM1_ARR=  005263 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]

Symbol Table

    TIM1_SR2=  005256     |     TIM1_SR2=  000001     |     TIM1_SR2=  000002 
    TIM1_SR2=  000003     |     TIM1_SR2=  000004     |     TIM2_ARR=  00530D 
    TIM2_ARR=  00530E     |     TIM2_CCE=  005308     |     TIM2_CCE=  000000 
    TIM2_CCE=  000001     |     TIM2_CCE=  000004     |     TIM2_CCE=  000005 
    TIM2_CCE=  005309     |     TIM2_CCM=  005305     |     TIM2_CCM=  005306 
    TIM2_CCM=  005307     |     TIM2_CCM=  000000     |     TIM2_CCM=  000004 
    TIM2_CCM=  000003     |     TIM2_CCR=  00530F     |     TIM2_CCR=  005310 
    TIM2_CCR=  005311     |     TIM2_CCR=  005312     |     TIM2_CCR=  005313 
    TIM2_CCR=  005314     |     TIM2_CNT=  00530A     |     TIM2_CNT=  00530B 
    TIM2_CR1=  005300     |     TIM2_CR1=  000007     |     TIM2_CR1=  000000 
    TIM2_CR1=  000003     |     TIM2_CR1=  000001     |     TIM2_CR1=  000002 
    TIM2_EGR=  005304     |     TIM2_EGR=  000001     |     TIM2_EGR=  000002 
    TIM2_EGR=  000003     |     TIM2_EGR=  000006     |     TIM2_EGR=  000000 
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
    TIM4_SR_=  000000     |   6 TIMEOUTQ   00029F R   |   6 TIMER      000289 R
    TIM_CR1_=  000007     |     TIM_CR1_=  000000     |     TIM_CR1_=  000006 
    TIM_CR1_=  000005     |     TIM_CR1_=  000004     |     TIM_CR1_=  000003 
    TIM_CR1_=  000001     |     TIM_CR1_=  000002     |   6 TNAM2      00185F R
  6 TNAM3      00187D R   |   6 TNAM4      001883 R   |   6 TNAME      00185C R
  6 TOFLASH    0002C4 R   |   6 TOKEN      001034 R   |   6 TOR        00043D R
  6 TORAM      000304 R   |     TRUEE   =  00FFFF     |   6 TWOSL      0009A0 R
  6 TYPE1      000E09 R   |   6 TYPE2      000E15 R   |   6 TYPES      000E04 R
  6 Timer4Ha   000005 R   |     UART1   =  000000     |     UART1_BA=  005230 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]

Symbol Table

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
    UART_SR_=  000006     |     UART_SR_=  000007     |     UBASE   =  000006 
    UBC     =  004801     |     UCNTXT  =  000014     |     UCP     =  000018 
    UCTIB   =  00000C     |     UD1     =  000001     |     UD2     =  000002 
    UD3     =  000003     |     UD4     =  000004     |   6 UDOT       000EAA R
  6 UDOTR      000E8A R   |   6 UEND       000041 R   |     UHLD    =  000012 
    UINN    =  00000A     |     UINTER  =  000010     |     ULAST   =  00001A 
  6 ULES1      00072A R   |   6 ULESS      000714 R   |   6 UMMOD      0007AA R
  6 UMSTA      000883 R   |   6 UNIQ1      001564 R   |   6 UNIQU      001545 R
  6 UNTIL      001447 R   |     UOFFSET =  00001C     |   6 UPDATCP    001A3D R
  6 UPDATLAS   001A14 R   |   6 UPDATPTR   001FB4 R   |   6 UPDATRUN   001A2C R
  6 UPDATVP    001A54 R   |   6 UPL1       000515 R   |   6 UPLUS      0004FE R
    UPP     =  000006     |     URLAST  =  000020     |     USR_BTN_=  000004 
    USR_BTN_=  000010     |     USR_BTN_=  005015     |     UTFLASH =  00001E 
    UTIB    =  00000E     |     UTMP    =  000008     |   6 UTYP1      001799 R
  6 UTYP2      0017A8 R   |   6 UTYPE      001794 R   |     UVP     =  000016 
  6 UZERO      000027 R   |   6 VARIA      00170F R   |     VAR_BASE=  000080 
    VAR_TOP =  0017BF     |     VER     =  000003     |   6 VPP        0005C2 R
    VSIZE   =  000006     |     WANT_DEB=  000000     |     WANT_MAT=  000001 
    WANT_SEE=  000000     |     WDGOPT  =  004805     |     WDGOPT_I=  000002 
    WDGOPT_L=  000003     |     WDGOPT_W=  000000     |     WDGOPT_W=  000001 
  6 WHILE      0014CD R   |   6 WITHI      00078F R   |   6 WORDD      001020 R
  6 WORDS      0018B9 R   |   6 WORS1      0018BF R   |   6 WORS2      0018DE R
    WWDG_CR =  0050D1     |     WWDG_WR =  0050D2     |   6 XORR       0004E9 R
    XTEMP   =  000022     |     YTEMP   =  000024     |   6 ZERO       0009BA R
  6 ZL1        0004B6 R   |   6 ZLESS      0004AD R   |   6 app_spac   002080 R
  6 block_er   001BD7 R   |   6 clear_ra   000019 R   |   6 clock_in   00005E R
  6 copy_buf   001C2E R   |   6 copy_buf   001C4D R   |   6 copy_pro   001C4D R
    da      =  000002     |     db      =  000003     |     dc      =  000000 
    dd      =  000001     |   6 ee_ccomm   001E48 R   |   6 ee_comma   001E27 R
  6 ee_cstor   001B44 R   |   6 ee_store   001B90 R   |   6 erase_fl   001BF3 R
  6 farat      001A65 R   |   6 farcat     001A81 R   |   6 fmove_do   001F9D R
  6 fptr_sto   001980 R   |   6 inc_fptr   001B12 R   |   6 lock       001AFE R
  6 main       000016 R   |   6 next_row   001F5A R   |   6 no_move    001FA4 R
  6 pristine   001CC8 R   |   6 proceed_   001BF6 R   |   6 reboot     0002B6 R
  6 reset_ve   001D2F R   |   6 row_eras   001BBA R   |   6 row_eras   001C07 R
  6 row_eras   001C2E R   |   6 set_opti   001C9C R   |   6 set_vect   001DD0 R
  6 uart1_in   000070 R   |   6 unlock     001AD6 R   |   6 unlock_e   001A98 R
  6 unlock_f   001AB7 R   |   6 write_by   001B29 R   |   6 write_ro   001C72 R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 DATA       size      0   flags    8
   2 DATA0      size      0   flags    8
   3 SSEG       size      0   flags    8
   4 SSEG1      size    100   flags    8
   5 HOME       size     80   flags    0
   6 CODE       size   2130   flags    0

