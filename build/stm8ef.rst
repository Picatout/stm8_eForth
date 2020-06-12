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
      0080B1 93 03                  282         .word      INTER   ;'EVAL
      0080B3 00 00                  283         .word      0       ;HLD
      0080B5 A0 86                  284         .word      LASTN  ;CNTXT pointer
      0080B7 00 80                  285         .word      VAR_BASE   ;variables free space pointer 
      0080B9 A1 00                  286         .word      app_space ; FLASH free space pointer 
      0080BB A0 86                  287         .word      LASTN   ;LAST
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
      008127 CC 99 A5         [ 2]  339         jp  COLD   ;default=MN1
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
      00816D CD 85 32         [ 4]  400         call OVER ; ( level reg lshift rval lshift -- )
      008170 CD 83 D9         [ 4]  401         call DOLIT 
      008173 00 03                  402         .word 3
      008175 CD 85 18         [ 4]  403         call SWAPP  ; ( level reg lshift rval 3 lshift )
      008178 CD 8A 00         [ 4]  404         call LSHIFT ; creat slot mask 
      00817B CD 87 1D         [ 4]  405         call INVER  ; ( level reg lshift rval mask )
      00817E CD 85 54         [ 4]  406         call ANDD ; ( level reg lshift slot_masked )
      008181 CD 84 D1         [ 4]  407         call TOR  ; ( level reg lshift -- R: slot_masked )
      008184 CD 86 C3         [ 4]  408         call ROT  ; ( reg lshift level )
      008187 CD 85 18         [ 4]  409         call SWAPP ; ( reg level lshift )
      00818A CD 8A 00         [ 4]  410         call LSHIFT  ; ( reg slot_level -- )
      00818D CD 84 B2         [ 4]  411         call RFROM ; ( reg slot_level masked_val )
      008190 CD 85 68         [ 4]  412         call ORR   ; ( reg updated_rval )
      008193 CD 85 18         [ 4]  413         call SWAPP 
      008196 CD 84 6E         [ 4]  414         call CSTOR
                                    415 
                                    416 ; sélectionne l'application 
                                    417 ; qui démarre automatique lors 
                                    418 ; d'un COLD start 
      008199 81 42                  419         .word LINK 
                           00011B   420         LINK=.
      00819B 07                     421         .byte 7
      00819C 41 55 54 4F 52 55 4E   422         .ascii "AUTORUN"
      0081A3                        423 AUTORUN:
      0081A3 CD 90 C8         [ 4]  424         call TOKEN 
      0081A6 CD 85 08         [ 4]  425         call DUPP 
      0081A9 CD 84 0C         [ 4]  426         call QBRAN 
      0081AC 82 9D                  427         .word FORGET2
      0081AE CD 91 C5         [ 4]  428         call NAMEQ
      0081B1 CD 86 B2         [ 4]  429         call QDUP 
      0081B4 CD 84 0C         [ 4]  430         call QBRAN 
      0081B7 82 9D                  431         .word FORGET2
      0081B9 CD 84 FE         [ 4]  432         call DROP 
      0081BC 1D 00 04         [ 2]  433         subw x,#2*CELLL 
      0081BF 90 5F            [ 1]  434         clrw y 
      0081C1 FF               [ 2]  435         ldw (x),y 
      0081C2 90 AE 40 02      [ 2]  436         ldw y,#APP_RUN 
      0081C6 EF 02            [ 2]  437         ldw (2,x),y 
      0081C8 CC 9C 24         [ 2]  438         jp ee_store 
                                    439 
                                    440 ;       PI ( --  355 113 )
                                    441 ; usefull for trignometric 
                                    442 ; computation using */ 
      0081CB 81 9B                  443         .word LINK 
                           00014D   444         LINK=.
      0081CD 02                     445         .byte 2
      0081CE 50 49                  446         .ascii "PI" 
      0081D0                        447 PII:
      0081D0 1D 00 04         [ 2]  448         subw x,#2*CELLL 
      0081D3 90 AE 01 63      [ 2]  449         ldw y,#355 
      0081D7 EF 02            [ 2]  450         ldw (2,x),y 
      0081D9 90 AE 00 71      [ 2]  451         ldw y,#113 
      0081DD FF               [ 2]  452         ldw (x),y 
      0081DE 81               [ 4]  453         ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



                                    454 
                                    455 ;; Reset dictionary pointer before 
                                    456 ;; forgotten word. RAM space and 
                                    457 ;; interrupt vector defined after 
                                    458 ;; must be resetted also.
      0081DF 81 CD                  459         .word LINK 
                           000161   460         LINK=.
      0081E1 06                     461         .byte 6
      0081E2 46 4F 52 47 45 54      462         .ascii "FORGET" 
      0081E8                        463 FORGET: 
      0081E8 CD 90 C8         [ 4]  464         call TOKEN
      0081EB CD 85 08         [ 4]  465         call DUPP 
      0081EE CD 84 0C         [ 4]  466         call QBRAN 
      0081F1 82 9D                  467         .word FORGET2
      0081F3 CD 91 C5         [ 4]  468         call NAMEQ ; ( a -- ca na | a F )
      0081F6 CD 86 B2         [ 4]  469         call QDUP 
      0081F9 CD 84 0C         [ 4]  470         call QBRAN 
      0081FC 82 9D                  471         .word FORGET2
                                    472 ; only forget users words 
      0081FE CD 85 08         [ 4]  473         call DUPP ; ( ca na na )
      008201 CD 83 D9         [ 4]  474         call DOLIT 
      008204 A1 00                  475         .word app_space 
      008206 CD 85 18         [ 4]  476         call SWAPP 
      008209 CD 87 A8         [ 4]  477         call  ULESS 
      00820C CD 84 0C         [ 4]  478         call QBRAN 
      00820F 82 5F                  479         .word FORGET6 
                                    480 ; ( ca na -- )        
                                    481 ;reset ivec with address >= ca
      008211 CD 85 18         [ 4]  482         call SWAPP ; ( na ca -- ) 
      008214 CD 9E 15         [ 4]  483         call CHKIVEC ; ( na -- ) 
                                    484 ; start at LAST and link back to na 
                                    485 ; if variable found reset VP at that point.
      008217                        486 FORGET1:
      008217 CD 86 74         [ 4]  487         call LAST 
      00821A CD 84 61         [ 4]  488         call AT 
      00821D CD 85 08         [ 4]  489         call DUPP  ; ( -- na last last )
      008220 CD 82 B3         [ 4]  490         call FREEVAR ; ( -- na last )
      008223 CD 85 08         [ 4]  491         call DUPP 
      008226 CD 83 D9         [ 4]  492         call DOLIT 
      008229 00 02                  493         .word 2 
      00822B CD 87 61         [ 4]  494         call SUBB ; ( na last -- na last lfa ) link address 
      00822E CD 84 61         [ 4]  495         call AT 
      008231 CD 85 08         [ 4]  496         call DUPP ; ( -- na last a a )
      008234 CD 86 48         [ 4]  497         call CNTXT 
      008237 CD 84 4A         [ 4]  498         call STORE
      00823A CD 86 74         [ 4]  499         call LAST  
      00823D CD 84 4A         [ 4]  500         call STORE ; ( --  na last )
      008240 CD 85 32         [ 4]  501         call OVER 
      008243 CD 87 89         [ 4]  502         call EQUAL ; ( na last na -- na T|F ) 
      008246 CD 84 0C         [ 4]  503         call QBRAN 
      008249 82 17                  504         .word FORGET1 
                                    505 ; ( na -- )
      00824B CD 83 D9         [ 4]  506         call DOLIT 
      00824E 00 02                  507         .word 2 
      008250 CD 87 61         [ 4]  508         call SUBB 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



      008253 CD 86 64         [ 4]  509         call CPP 
      008256 CD 84 4A         [ 4]  510         call STORE  
      008259 CD 9A D1         [ 4]  511         call UPDATCP 
      00825C CC 9A A8         [ 2]  512         jp UPDATLAST 
      00825F                        513 FORGET6: ; tried to forget a RAM or system word 
                                    514 ; ( ca na -- )
      00825F 1D 00 02         [ 2]  515         subw x,#CELLL 
      008262 90 BE 2A         [ 2]  516         ldw y,SP0 
      008265 FF               [ 2]  517         ldw (x),y  
      008266 CD 87 A8         [ 4]  518         call ULESS
      008269 CD 84 0C         [ 4]  519         call QBRAN 
      00826C 82 8F                  520         .word PROTECTED 
      00826E CD 92 D1         [ 4]  521         call ABORQ 
      008271 1D                     522         .byte 29
      008272 20 46 6F 72 20 52 41   523         .ascii " For RAM definition do REBOOT"
             4D 20 64 65 66 69 6E
             69 74 69 6F 6E 20 64
             6F 20 52 45 42 4F 4F
             54
      00828F                        524 PROTECTED:
      00828F CD 92 D1         [ 4]  525         call ABORQ
      008292 0A                     526         .byte 10
      008293 20 50 72 6F 74 65 63   527         .ascii " Protected"
             74 65 64
      00829D                        528 FORGET2: ; no name or not found in dictionary 
      00829D CD 92 D1         [ 4]  529         call ABORQ
      0082A0 05                     530         .byte 5
      0082A1 20 77 68 61 74         531         .ascii " what"
      0082A6                        532 FORGET4:
      0082A6 CC 84 FE         [ 2]  533         jp DROP 
                                    534 
                                    535 
                                    536 ;---------------------------------
                                    537 ; if na is variable 
                                    538 ; free variable data  
                                    539 ; FREEVAR ( na -- )
                                    540 ;---------------------------------
      0082A9 81 E1                  541         .word LINK 
                           00022B   542         LINK=.
      0082AB 07                     543         .byte 7 
      0082AC 46 52 45 45 56 41 52   544         .ascii "FREEVAR"
      0082B3                        545 FREEVAR:
      0082B3 CD 85 08         [ 4]  546         call DUPP ; ( na na -- )
      0082B6 CD 84 7F         [ 4]  547         CALL CAT  ; ( na c -- )
      0082B9 CD 89 E2         [ 4]  548         call ONEP ;
      0082BC CD 87 03         [ 4]  549         CALL PLUS ; ( na c+1 -- ca ) 
      0082BF CD 89 E2         [ 4]  550         call ONEP ; ( ca+ -- ) to get routne address 
      0082C2 CD 85 08         [ 4]  551         call DUPP ; ( ca+ ca+ -- )
      0082C5 CD 84 61         [ 4]  552         CALL AT   ; ( ca+ fnaddr -- ) ; fnaddr is routine address 
      0082C8 CD 83 D9         [ 4]  553         call DOLIT 
      0082CB 85 B5                  554         .word DOVAR ; if routine address is DOVAR then variable 
      0082CD CD 87 89         [ 4]  555         call EQUAL  ; ( ca+ fnaddr DOVAR -- ca+ T|F ) 
      0082D0 CD 84 0C         [ 4]  556         call QBRAN 
      0082D3 82 E9                  557         .word FREEVAR4 
      0082D5 CD 83 D9         [ 4]  558         call DOLIT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]



      0082D8 00 02                  559         .word 2 
      0082DA CD 87 03         [ 4]  560         call PLUS  ; ( ca+ 2 -- da ) da is data address 
      0082DD CD 84 61         [ 4]  561         call AT 
      0082E0 CD 86 56         [ 4]  562         call VPP   
      0082E3 CD 84 4A         [ 4]  563         call STORE 
      0082E6 CC 9A E8         [ 2]  564         jp UPDATVP 
      0082E9                        565 FREEVAR4: ; not variable
      0082E9 CC 84 FE         [ 2]  566         jp  DROP 
                                    567 
                                    568 ;;
                                    569 ;; get millisecond counter 
                                    570 ;; msec ( -- u )
                                    571 ;; Added by Picatout 2020-04-26
      0082EC 82 AB                  572         .word LINK  
                           00026E   573         LINK = . 
      0082EE 04                     574         .byte 4
      0082EF 4D 53 45 43            575         .ascii "MSEC"
      0082F3                        576 MSEC: 
      0082F3 1D 00 02         [ 2]  577         subw x,#CELLL 
      0082F6 90 BE 2E         [ 2]  578         ldw y,MS 
      0082F9 FF               [ 2]  579         ldw (x),y 
      0082FA 81               [ 4]  580         ret 
                                    581 
                                    582 ; suspend execution for u msec 
                                    583 ;  pause ( u -- )
      0082FB 82 EE                  584         .word LINK 
                           00027D   585         LINK=.
      0082FD 05                     586         .byte 5 
      0082FE 50 41 55 53 45         587         .ascii "PAUSE"
      008303                        588 PAUSE:
      008303 90 93            [ 1]  589         ldw y,x
      008305 90 FE            [ 2]  590         ldw y,(y)
      008307 72 B9 00 2E      [ 2]  591         addw y,MS 
      00830B 8F               [10]  592 1$:     wfi  
      00830C 90 B3 2E         [ 2]  593         cpw y,MS  
      00830F 26 FA            [ 1]  594         jrne 1$        
      008311 1C 00 02         [ 2]  595         addw x,#CELLL 
      008314 81               [ 4]  596         ret 
                                    597 
                                    598 ; initialize count down timer 
                                    599 ;  TIMER ( u -- )  milliseconds 
      008315 82 FD                  600         .word LINK 
                           000297   601         LINK=.
      008317 05                     602         .byte 5 
      008318 54 49 4D 45 52         603         .ascii "TIMER" 
      00831D                        604 TIMER:
      00831D 90 93            [ 1]  605         ldw y,x
      00831F 90 FE            [ 2]  606         ldw y,(y) 
      008321 90 BF 30         [ 2]  607         ldw CNTDWN,y
      008324 1C 00 02         [ 2]  608         addw x,#CELLL 
      008327 81               [ 4]  609         ret 
                                    610 
                                    611 ; check for TIMER exiparition 
                                    612 ;  TIMEOUT? ( -- 0|-1 )
      008328 83 17                  613         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 13.
Hexadecimal [24-Bits]



                           0002AA   614         LINK=. 
      00832A 08                     615         .byte 8 
      00832B 54 49 4D 45 4F 55 54   616         .ascii "TIMEOUT?"
             3F
      008333                        617 TIMEOUTQ: 
      008333 4F               [ 1]  618         clr a
      008334 1D 00 02         [ 2]  619         subw x,#CELLL 
      008337 90 BE 30         [ 2]  620         ldw y,CNTDWN 
      00833A 26 01            [ 1]  621         jrne 1$ 
      00833C 43               [ 1]  622         cpl a 
      00833D E7 01            [ 1]  623 1$:     ld (1,x),a 
      00833F F7               [ 1]  624         ld (x),a 
      008340 81               [ 4]  625         ret         
                                    626 
                                    627 ; reboot MCU 
                                    628 ; REBOOT ( -- )
      008341 83 2A                  629         .word LINK 
                           0002C3   630         LINK=. 
      008343 06                     631         .byte 6 
      008344 52 45 42 4F 4F 54      632         .ascii "REBOOT"
      00834A                        633 reboot:
      00834A CC 80 80         [ 2]  634         jp NonHandledInterrupt
                                    635 
                                    636 ; compile to flash memory 
                                    637 ; TO-FLASH ( -- )
      00834D 83 43                  638         .word LINK 
                           0002CF   639         LINK=.
      00834F 08                     640         .byte 8
      008350 54 4F 2D 46 4C 41 53   641         .ascii "TO-FLASH"
             48
      008358                        642 TOFLASH:
      008358 CD 86 87         [ 4]  643         call RAMLAST 
      00835B CD 84 61         [ 4]  644         call AT 
      00835E CD 86 B2         [ 4]  645         call QDUP 
      008361 CD 84 0C         [ 4]  646         call QBRAN
      008364 83 87                  647         .word 1$
      008366 CD 92 D1         [ 4]  648         call ABORQ 
      008369 1D                     649         .byte 29
      00836A 20 4E 6F 74 20 77 68   650         .ascii " Not while definitions in RAM"   
             69 6C 65 20 64 65 66
             69 6E 69 74 69 6F 6E
             73 20 69 6E 20 52 41
             4D
      008387 90 AE FF FF      [ 2]  651 1$:     ldw y,#-1 
      00838B 90 BF 1E         [ 2]  652         ldw UTFLASH,y
      00838E 81               [ 4]  653         ret 
                                    654 
                                    655 ; compile to RAM 
                                    656 ; TO-RAM ( -- )
      00838F 83 4F                  657         .word LINK 
                           000311   658         LINK=.
      008391 06                     659         .byte 6 
      008392 54 4F 2D 52 41 4D      660         .ascii "TO-RAM"
      008398                        661 TORAM:
      008398 90 5F            [ 1]  662         clrw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 14.
Hexadecimal [24-Bits]



      00839A 90 BF 1E         [ 2]  663         ldw UTFLASH,y 
      00839D 81               [ 4]  664         ret 
                                    665         
                                    666 
                                    667 ;; Device dependent I/O
                                    668 ;       ?RX     ( -- c T | F )
                                    669 ;         Return input byte and true, or false.
      00839E 83 91                  670         .word      LINK 
                           000320   671 LINK	= .
      0083A0 04                     672         .byte      4
      0083A1 3F 4B 45 59            673         .ascii     "?KEY"
      0083A5                        674 QKEY:
      0083A5 90 5F            [ 1]  675         CLRW Y 
      0083A7 72 0B 52 30 0B   [ 2]  676         BTJF UART1_SR,#UART_SR_RXNE,INCH   ;check status
      0083AC C6 52 31         [ 1]  677         LD    A,UART1_DR   ;get char in A
      0083AF 1D 00 02         [ 2]  678 	SUBW	X,#2
      0083B2 E7 01            [ 1]  679         LD     (1,X),A
      0083B4 7F               [ 1]  680 	CLR	(X)
      0083B5 90 53            [ 2]  681         CPLW     Y
      0083B7                        682 INCH:
      0083B7 1D 00 02         [ 2]  683 	SUBW	X,#2
      0083BA FF               [ 2]  684         LDW     (X),Y
      0083BB 81               [ 4]  685         RET
                                    686 
                                    687 ;       TX!     ( c -- )
                                    688 ;       Send character c to  output device.
      0083BC 83 A0                  689         .word      LINK
                           00033E   690 LINK	= .
      0083BE 04                     691         .byte      4
      0083BF 45 4D 49 54            692         .ascii     "EMIT"
      0083C3                        693 EMIT:
      0083C3 E6 01            [ 1]  694         LD     A,(1,X)
      0083C5 1C 00 02         [ 2]  695 	ADDW	X,#2
      0083C8 72 0F 52 30 FB   [ 2]  696 OUTPUT: BTJF UART1_SR,#UART_SR_TXE,OUTPUT  ;loop until tdre
      0083CD C7 52 31         [ 1]  697         LD    UART1_DR,A   ;send A
      0083D0 81               [ 4]  698         RET
                                    699 
                                    700 ;; The kernel
                                    701 
                                    702 ;       doLIT   ( -- w )
                                    703 ;       Push an inline literal.
      0083D1 83 BE                  704         .word      LINK
                           000353   705 LINK	= 	.
      0083D3 45                     706 	.byte      COMPO+5
      0083D4 44 4F 4C 49 54         707         .ascii     "DOLIT"
      0083D9                        708 DOLIT:
      0083D9 1D 00 02         [ 2]  709 	SUBW X,#2
                           000001   710 .if PICATOUT_MOD 
      0083DC 16 01            [ 2]  711         ldw y,(1,sp)
      0083DE 90 FE            [ 2]  712         ldw y,(y)
      0083E0 FF               [ 2]  713         ldw (x),y
      0083E1 90 85            [ 2]  714         popw y 
      0083E3 90 EC 02         [ 2]  715         jp (2,y)
                           000000   716 .else 
                                    717         POPW Y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 15.
Hexadecimal [24-Bits]



                                    718 	LDW YTEMP,Y
                                    719 	LDW Y,(Y)
                                    720         LDW (X),Y
                                    721         LDW Y,YTEMP
                                    722 	JP (2,Y)
                                    723 .endif 
                                    724 
                                    725 ;       next    ( -- )
                                    726 ;       Code for  single index loop.
      0083E6 83 D3                  727         .word      LINK
                           000368   728 LINK	= 	.
      0083E8 44                     729 	.byte      COMPO+4
      0083E9 4E 45 58 54            730         .ascii     "NEXT"
      0083ED                        731 DONXT:
      0083ED 16 03            [ 2]  732 	LDW Y,(3,SP)
      0083EF 90 5A            [ 2]  733 	DECW Y
      0083F1 2A 07            [ 1]  734 	JRPL NEX1 ; jump if N=0
      0083F3 90 85            [ 2]  735 	POPW Y
                           000001   736 .if PICATOUT_MOD
      0083F5 5B 02            [ 2]  737         addw sp,#2
                           000000   738 .else        
                                    739 	POP A
                                    740 	POP A
                                    741 .endif         
      0083F7 90 EC 02         [ 2]  742         JP (2,Y)
      0083FA                        743 NEX1:
      0083FA 17 03            [ 2]  744         LDW (3,SP),Y
      0083FC 90 85            [ 2]  745         POPW Y
      0083FE 90 FE            [ 2]  746 	LDW Y,(Y)
      008400 90 FC            [ 2]  747 	JP (Y)
                                    748 
                                    749 ;       ?branch ( f -- )
                                    750 ;       Branch if flag is zero.
      008402 83 E8                  751         .word      LINK
                           000384   752 LINK	= 	.
      008404 47                     753 	.byte      COMPO+7
      008405 3F 42 52 41 4E 43 48   754         .ascii     "?BRANCH"
      00840C                        755 QBRAN:	
      00840C 90 93            [ 1]  756         LDW Y,X
      00840E 1C 00 02         [ 2]  757 	ADDW X,#2
      008411 90 FE            [ 2]  758 	LDW Y,(Y)
      008413 27 0E            [ 1]  759         JREQ     BRAN
      008415 90 85            [ 2]  760 	POPW Y
      008417 90 EC 02         [ 2]  761 	JP (2,Y)
                                    762         
                                    763 ;       branch  ( -- )
                                    764 ;       Branch to an inline address.
      00841A 84 04                  765         .word      LINK
                           00039C   766 LINK	= 	.
      00841C 46                     767 	.byte      COMPO+6
      00841D 42 52 41 4E 43 48      768         .ascii     "BRANCH"
      008423                        769 BRAN:
      008423 90 85            [ 2]  770         POPW Y
      008425 90 FE            [ 2]  771 	LDW Y,(Y)
      008427 90 FC            [ 2]  772         JP     (Y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 16.
Hexadecimal [24-Bits]



                                    773 
                                    774 ;       EXECUTE ( ca -- )
                                    775 ;       Execute  word at ca.
      008429 84 1C                  776         .word      LINK
                           0003AB   777 LINK	= 	.
      00842B 07                     778         .byte       7
      00842C 45 58 45 43 55 54 45   779         .ascii     "EXECUTE"
      008433                        780 EXECU:
      008433 90 93            [ 1]  781         LDW Y,X
      008435 1C 00 02         [ 2]  782 	ADDW X,#2
      008438 90 FE            [ 2]  783 	LDW  Y,(Y)
      00843A 90 FC            [ 2]  784         JP   (Y)
                                    785 
                                    786 ;       EXIT    ( -- )
                                    787 ;       Terminate a colon definition.
      00843C 84 2B                  788         .word      LINK
                           0003BE   789 LINK = .
      00843E 04                     790         .byte      4
      00843F 45 58 49 54            791         .ascii     "EXIT"
      008443                        792 EXIT:
      008443 90 85            [ 2]  793         POPW Y
      008445 81               [ 4]  794         RET
                                    795 
                                    796 ;       !       ( w a -- )
                                    797 ;       Pop  data stack to memory.
      008446 84 3E                  798         .word      LINK
                           0003C8   799 LINK = .
      008448 01                     800         .byte      1
      008449 21                     801         .ascii     "!"
      00844A                        802 STORE:
      00844A 90 93            [ 1]  803         LDW Y,X
      00844C 90 FE            [ 2]  804         LDW Y,(Y)    ;Y=a
      00844E 90 BF 24         [ 2]  805         LDW YTEMP,Y
      008451 90 93            [ 1]  806         LDW Y,X
      008453 90 EE 02         [ 2]  807         LDW Y,(2,Y)
      008456 91 CF 24         [ 5]  808         LDW [YTEMP],Y ;store w at a
      008459 1C 00 04         [ 2]  809         ADDW X,#4 ; DDROP 
      00845C 81               [ 4]  810         RET     
                                    811 
                                    812 ;       @       ( a -- w )
                                    813 ;       Push memory location to stack.
      00845D 84 48                  814         .word      LINK
                           0003DF   815 LINK	= 	.
      00845F 01                     816         .byte    1
      008460 40                     817         .ascii	"@"
      008461                        818 AT:
      008461 90 93            [ 1]  819         LDW Y,X     ;Y = a
      008463 90 FE            [ 2]  820         LDW Y,(Y)   ; address 
      008465 90 FE            [ 2]  821         LDW Y,(Y)   ; value 
      008467 FF               [ 2]  822         LDW (X),Y ;w = @Y
      008468 81               [ 4]  823         RET     
                                    824 
                                    825 ;       C!      ( c b -- )
                                    826 ;       Pop  data stack to byte memory.
      008469 84 5F                  827         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 17.
Hexadecimal [24-Bits]



                           0003EB   828 LINK	= .
      00846B 02                     829         .byte      2
      00846C 43 21                  830         .ascii     "C!"
      00846E                        831 CSTOR:
      00846E 90 93            [ 1]  832         LDW Y,X
      008470 90 FE            [ 2]  833 	LDW Y,(Y)    ;Y=b
      008472 E6 03            [ 1]  834         LD A,(3,X)    ;D = c
      008474 90 F7            [ 1]  835         LD  (Y),A     ;store c at b
      008476 1C 00 04         [ 2]  836 	ADDW X,#4 ; DDROP 
      008479 81               [ 4]  837         RET     
                                    838 
                                    839 ;       C@      ( b -- c )
                                    840 ;       Push byte in memory to  stack.
      00847A 84 6B                  841         .word      LINK
                           0003FC   842 LINK	= 	.
      00847C 02                     843         .byte      2
      00847D 43 40                  844         .ascii     "C@"
      00847F                        845 CAT:
      00847F 90 93            [ 1]  846         LDW Y,X     ;Y=b
      008481 90 FE            [ 2]  847         LDW Y,(Y)
      008483 90 F6            [ 1]  848         LD A,(Y)
      008485 E7 01            [ 1]  849         LD (1,X),A
      008487 7F               [ 1]  850         CLR (X)
      008488 81               [ 4]  851         RET     
                                    852 
                                    853 ;       RP@     ( -- a )
                                    854 ;       Push current RP to data stack.
      008489 84 7C                  855         .word      LINK
                           00040B   856 LINK	= .
      00848B 03                     857         .byte      3
      00848C 52 50 40               858         .ascii     "RP@"
      00848F                        859 RPAT:
      00848F 90 96            [ 1]  860         LDW Y,SP    ;save return addr
      008491 1D 00 02         [ 2]  861         SUBW X,#2
      008494 FF               [ 2]  862         LDW (X),Y
      008495 81               [ 4]  863         RET     
                                    864 
                                    865 ;       RP!     ( a -- )
                                    866 ;       Set  return stack pointer.
      008496 84 8B                  867         .word      LINK
                           000418   868 LINK	= 	. 
      008498 43                     869 	.byte      COMPO+3
      008499 52 50 21               870         .ascii     "RP!"
      00849C                        871 RPSTO:
      00849C 90 85            [ 2]  872         POPW Y
      00849E 90 BF 24         [ 2]  873         LDW YTEMP,Y
      0084A1 90 93            [ 1]  874         LDW Y,X
      0084A3 90 FE            [ 2]  875         LDW Y,(Y)
      0084A5 90 94            [ 1]  876         LDW SP,Y
      0084A7 1C 00 02         [ 2]  877         ADDW x,#CELLL ; a was not dropped, Picatout 2020-05-24
      0084AA 92 CC 24         [ 5]  878         JP [YTEMP]
                                    879 
                                    880 ;       R>      ( -- w )
                                    881 ;       Pop return stack to data stack.
      0084AD 84 98                  882         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
Hexadecimal [24-Bits]



                           00042F   883 LINK	= 	. 
      0084AF 42                     884 	.byte      COMPO+2
      0084B0 52 3E                  885         .ascii     "R>"
      0084B2                        886 RFROM:
      0084B2 90 85            [ 2]  887         POPW Y    ;save return addr
      0084B4 90 BF 24         [ 2]  888         LDW YTEMP,Y
      0084B7 90 85            [ 2]  889         POPW Y
      0084B9 1D 00 02         [ 2]  890         SUBW X,#2
      0084BC FF               [ 2]  891         LDW (X),Y
      0084BD 92 CC 24         [ 5]  892         JP [YTEMP]
                                    893 
                                    894 ;       R@      ( -- w )
                                    895 ;       Copy top of return stack to stack.
      0084C0 84 AF                  896         .word      LINK
                           000442   897 LINK	= 	. 
      0084C2 02                     898         .byte      2
      0084C3 52 40                  899         .ascii     "R@"
      0084C5                        900 RAT:
                           000001   901 .if PICATOUT_MOD
      0084C5 16 03            [ 2]  902         ldw y,(3,sp)
      0084C7 1D 00 02         [ 2]  903         subw x,#CELLL 
      0084CA FF               [ 2]  904         ldw (x),y 
      0084CB 81               [ 4]  905         ret 
                           000000   906 .else 
                                    907         POPW Y
                                    908         LDW YTEMP,Y
                                    909         POPW Y
                                    910         PUSHW Y
                                    911         SUBW X,#2
                                    912         LDW (X),Y
                                    913         JP [YTEMP]
                                    914 .endif         
                                    915 
                                    916 ;       >R      ( w -- )
                                    917 ;       Push data stack to return stack.
      0084CC 84 C2                  918         .word      LINK
                           00044E   919 LINK	= 	. 
      0084CE 42                     920 	.byte      COMPO+2
      0084CF 3E 52                  921         .ascii     ">R"
      0084D1                        922 TOR:
      0084D1 90 85            [ 2]  923         POPW Y    ;save return addr
      0084D3 90 BF 24         [ 2]  924         LDW YTEMP,Y
      0084D6 90 93            [ 1]  925         LDW Y,X
      0084D8 90 FE            [ 2]  926         LDW Y,(Y)
      0084DA 90 89            [ 2]  927         PUSHW Y    ;restore return addr
      0084DC 1C 00 02         [ 2]  928         ADDW X,#2
      0084DF 92 CC 24         [ 5]  929         JP [YTEMP]
                                    930 
                                    931 ;       SP@     ( -- a )
                                    932 ;       Push current stack pointer.
      0084E2 84 CE                  933         .word      LINK
                           000464   934 LINK	= 	. 
      0084E4 03                     935         .byte      3
      0084E5 53 50 40               936         .ascii     "SP@"
      0084E8                        937 SPAT:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]



      0084E8 90 93            [ 1]  938 	LDW Y,X
      0084EA 1D 00 02         [ 2]  939         SUBW X,#2
      0084ED FF               [ 2]  940 	LDW (X),Y
      0084EE 81               [ 4]  941         RET     
                                    942 
                                    943 ;       SP!     ( a -- )
                                    944 ;       Set  data stack pointer.
      0084EF 84 E4                  945         .word      LINK
                           000471   946 LINK	= 	. 
      0084F1 03                     947         .byte      3
      0084F2 53 50 21               948         .ascii     "SP!"
      0084F5                        949 SPSTO:
      0084F5 FE               [ 2]  950         LDW     X,(X)     ;X = a
      0084F6 81               [ 4]  951         RET     
                                    952 
                                    953 ;       DROP    ( w -- )
                                    954 ;       Discard top stack item.
      0084F7 84 F1                  955         .word      LINK
                           000479   956 LINK	= 	. 
      0084F9 04                     957         .byte      4
      0084FA 44 52 4F 50            958         .ascii     "DROP"
      0084FE                        959 DROP:
      0084FE 1C 00 02         [ 2]  960         ADDW X,#2     
      008501 81               [ 4]  961         RET     
                                    962 
                                    963 ;       DUP     ( w -- w w )
                                    964 ;       Duplicate  top stack item.
      008502 84 F9                  965         .word      LINK
                           000484   966 LINK	= 	. 
      008504 03                     967         .byte      3
      008505 44 55 50               968         .ascii     "DUP"
      008508                        969 DUPP:
      008508 90 93            [ 1]  970 	LDW Y,X
      00850A 1D 00 02         [ 2]  971         SUBW X,#2
      00850D 90 FE            [ 2]  972 	LDW Y,(Y)
      00850F FF               [ 2]  973 	LDW (X),Y
      008510 81               [ 4]  974         RET     
                                    975 
                                    976 ;       SWAP    ( w1 w2 -- w2 w1 )
                                    977 ;       Exchange top two stack items.
      008511 85 04                  978         .word      LINK
                           000493   979 LINK	= 	. 
      008513 04                     980         .byte      4
      008514 53 57 41 50            981         .ascii     "SWAP"
      008518                        982 SWAPP:
      008518 90 93            [ 1]  983         LDW Y,X
      00851A 90 FE            [ 2]  984         LDW Y,(Y)
      00851C 90 BF 24         [ 2]  985         LDW YTEMP,Y
      00851F 90 93            [ 1]  986         LDW Y,X
      008521 90 EE 02         [ 2]  987         LDW Y,(2,Y)
      008524 FF               [ 2]  988         LDW (X),Y
      008525 90 BE 24         [ 2]  989         LDW Y,YTEMP
      008528 EF 02            [ 2]  990         LDW (2,X),Y
      00852A 81               [ 4]  991         RET     
                                    992 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]



                                    993 ;       OVER    ( w1 w2 -- w1 w2 w1 )
                                    994 ;       Copy second stack item to top.
      00852B 85 13                  995         .word      LINK
                           0004AD   996 LINK	= . 
      00852D 04                     997         .byte      4
      00852E 4F 56 45 52            998         .ascii     "OVER"
      008532                        999 OVER:
      008532 1D 00 02         [ 2] 1000         SUBW X,#2
      008535 90 93            [ 1] 1001         LDW Y,X
      008537 90 EE 04         [ 2] 1002         LDW Y,(4,Y)
      00853A FF               [ 2] 1003         LDW (X),Y
      00853B 81               [ 4] 1004         RET     
                                   1005 
                                   1006 ;       0<      ( n -- t )
                                   1007 ;       Return true if n is negative.
      00853C 85 2D                 1008         .word      LINK
                           0004BE  1009 LINK	= . 
      00853E 02                    1010         .byte      2
      00853F 30 3C                 1011         .ascii     "0<"
      008541                       1012 ZLESS:
      008541 A6 FF            [ 1] 1013         LD A,#0xFF
      008543 90 93            [ 1] 1014         LDW Y,X
      008545 90 FE            [ 2] 1015         LDW Y,(Y)
      008547 2B 01            [ 1] 1016         JRMI     ZL1
      008549 4F               [ 1] 1017         CLR A   ;false
      00854A F7               [ 1] 1018 ZL1:    LD     (X),A
      00854B E7 01            [ 1] 1019         LD (1,X),A
      00854D 81               [ 4] 1020 	RET     
                                   1021 
                                   1022 ;       AND     ( w w -- w )
                                   1023 ;       Bitwise AND.
      00854E 85 3E                 1024         .word      LINK
                           0004D0  1025 LINK	= . 
      008550 03                    1026         .byte      3
      008551 41 4E 44              1027         .ascii     "AND"
      008554                       1028 ANDD:
      008554 F6               [ 1] 1029         LD  A,(X)    ;D=w
      008555 E4 02            [ 1] 1030         AND A,(2,X)
      008557 E7 02            [ 1] 1031         LD (2,X),A
      008559 E6 01            [ 1] 1032         LD A,(1,X)
      00855B E4 03            [ 1] 1033         AND A,(3,X)
      00855D E7 03            [ 1] 1034         LD (3,X),A
      00855F 1C 00 02         [ 2] 1035         ADDW X,#2
      008562 81               [ 4] 1036         RET
                                   1037 
                                   1038 ;       OR      ( w w -- w )
                                   1039 ;       Bitwise inclusive OR.
      008563 85 50                 1040         .word      LINK
                           0004E5  1041 LINK = . 
      008565 02                    1042         .byte      2
      008566 4F 52                 1043         .ascii     "OR"
      008568                       1044 ORR:
      008568 F6               [ 1] 1045         LD A,(X)    ;D=w
      008569 EA 02            [ 1] 1046         OR A,(2,X)
      00856B E7 02            [ 1] 1047         LD (2,X),A
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



      00856D E6 01            [ 1] 1048         LD A,(1,X)
      00856F EA 03            [ 1] 1049         OR A,(3,X)
      008571 E7 03            [ 1] 1050         LD (3,X),A
      008573 1C 00 02         [ 2] 1051         ADDW X,#2
      008576 81               [ 4] 1052         RET
                                   1053 
                                   1054 ;       XOR     ( w w -- w )
                                   1055 ;       Bitwise exclusive OR.
      008577 85 65                 1056         .word      LINK
                           0004F9  1057 LINK	= . 
      008579 03                    1058         .byte      3
      00857A 58 4F 52              1059         .ascii     "XOR"
      00857D                       1060 XORR:
      00857D F6               [ 1] 1061         LD A,(X)    ;D=w
      00857E E8 02            [ 1] 1062         XOR A,(2,X)
      008580 E7 02            [ 1] 1063         LD (2,X),A
      008582 E6 01            [ 1] 1064         LD A,(1,X)
      008584 E8 03            [ 1] 1065         XOR A,(3,X)
      008586 E7 03            [ 1] 1066         LD (3,X),A
      008588 1C 00 02         [ 2] 1067         ADDW X,#2
      00858B 81               [ 4] 1068         RET
                                   1069 
                                   1070 ;       UM+     ( u u -- udsum )
                                   1071 ;       Add two unsigned single
                                   1072 ;       and return a double sum.
      00858C 85 79                 1073         .word      LINK
                           00050E  1074 LINK	= . 
      00858E 03                    1075         .byte      3
      00858F 55 4D 2B              1076         .ascii     "UM+"
      008592                       1077 UPLUS:
      008592 A6 01            [ 1] 1078         LD A,#1
      008594 90 93            [ 1] 1079         LDW Y,X
      008596 90 EE 02         [ 2] 1080         LDW Y,(2,Y)
      008599 90 BF 24         [ 2] 1081         LDW YTEMP,Y
      00859C 90 93            [ 1] 1082         LDW Y,X
      00859E 90 FE            [ 2] 1083         LDW Y,(Y)
      0085A0 72 B9 00 24      [ 2] 1084         ADDW Y,YTEMP
      0085A4 EF 02            [ 2] 1085         LDW (2,X),Y
      0085A6 25 01            [ 1] 1086         JRC     UPL1
      0085A8 4F               [ 1] 1087         CLR A
      0085A9 E7 01            [ 1] 1088 UPL1:   LD     (1,X),A
      0085AB 7F               [ 1] 1089         CLR (X)
      0085AC 81               [ 4] 1090         RET
                                   1091 
                                   1092 ;; System and user variables
                                   1093 
                                   1094 ;       doVAR   ( -- a )
                                   1095 ;       Code for VARIABLE and CREATE.
      0085AD 85 8E                 1096         .word      LINK
                           00052F  1097 LINK	= . 
      0085AF 45                    1098 	.byte      COMPO+5
      0085B0 44 4F 56 41 52        1099         .ascii     "DOVAR"
      0085B5                       1100 DOVAR:
      0085B5 1D 00 02         [ 2] 1101 	SUBW X,#2
      0085B8 90 85            [ 2] 1102         POPW Y    ;get return addr (pfa)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]



                           000001  1103 .if PICATOUT_MOD
      0085BA 90 FE            [ 2] 1104         LDW Y,(Y) ; indirect address 
                                   1105 .endif ;PICATOUT_MOD        
      0085BC FF               [ 2] 1106         LDW (X),Y    ;push on stack
      0085BD 81               [ 4] 1107         RET     ;go to RET of EXEC
                                   1108 
                                   1109 ;       BASE    ( -- a )
                                   1110 ;       Radix base for numeric I/O.
      0085BE 85 AF                 1111         .word      LINK        
                           000540  1112 LINK = . 
      0085C0 04                    1113         .byte      4
      0085C1 42 41 53 45           1114         .ascii     "BASE"
      0085C5                       1115 BASE:
      0085C5 90 AE 00 06      [ 2] 1116 	LDW Y,#UBASE 
      0085C9 1D 00 02         [ 2] 1117 	SUBW X,#2
      0085CC FF               [ 2] 1118         LDW (X),Y
      0085CD 81               [ 4] 1119         RET
                                   1120 
                                   1121 ;       tmp     ( -- a )
                                   1122 ;       A temporary storage.
      0085CE 85 C0                 1123         .word      LINK
                                   1124         
                           000550  1125 LINK = . 
      0085D0 03                    1126 	.byte      3
      0085D1 54 4D 50              1127         .ascii     "TMP"
      0085D4                       1128 TEMP:
      0085D4 90 AE 00 08      [ 2] 1129 	LDW Y,#UTMP
      0085D8 1D 00 02         [ 2] 1130 	SUBW X,#2
      0085DB FF               [ 2] 1131         LDW (X),Y
      0085DC 81               [ 4] 1132         RET
                                   1133 
                                   1134 ;       >IN     ( -- a )
                                   1135 ;        Hold parsing pointer.
      0085DD 85 D0                 1136         .word      LINK
                           00055F  1137 LINK = . 
      0085DF 03                    1138         .byte      3
      0085E0 3E 49 4E              1139         .ascii    ">IN"
      0085E3                       1140 INN:
      0085E3 90 AE 00 0A      [ 2] 1141 	LDW Y,#UINN 
      0085E7 1D 00 02         [ 2] 1142 	SUBW X,#2
      0085EA FF               [ 2] 1143         LDW (X),Y
      0085EB 81               [ 4] 1144         RET
                                   1145 
                                   1146 ;       #TIB    ( -- a )
                                   1147 ;       Count in terminal input buffer.
      0085EC 85 DF                 1148         .word      LINK
                           00056E  1149 LINK = . 
      0085EE 04                    1150         .byte      4
      0085EF 23 54 49 42           1151         .ascii     "#TIB"
      0085F3                       1152 NTIB:
      0085F3 90 AE 00 0C      [ 2] 1153 	LDW Y,#UCTIB 
      0085F7 1D 00 02         [ 2] 1154 	SUBW X,#2
      0085FA FF               [ 2] 1155         LDW (X),Y
      0085FB 81               [ 4] 1156         RET
                                   1157 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



                           000001  1158 .if PICATOUT_MOD
                                   1159 ;       TBUF ( -- a )
                                   1160 ;       address of 128 bytes transaction buffer 
      0085FC 85 EE                 1161         .word LINK 
                           00057E  1162         LINK=.
      0085FE 04                    1163         .byte 4 
      0085FF 54 42 55 46           1164         .ascii "TBUF"
      008603                       1165 TBUF:
      008603 90 AE 16 80      [ 2] 1166         ldw y,#ROWBUFF
      008607 1D 00 02         [ 2] 1167         subw x,#CELLL
      00860A FF               [ 2] 1168         ldw (x),y 
      00860B 81               [ 4] 1169         ret 
                                   1170 
                                   1171 ; systeme variable 
                                   1172 ; compilation destination 
                                   1173 ; TFLASH ( -- A )
      00860C 85 FE                 1174         .word LINK 
                           00058E  1175         LINK=.
      00860E 06                    1176         .byte 6 
      00860F 54 46 4C 41 53 48     1177         .ascii "TFLASH"         
      008615                       1178 TFLASH:
      008615 1D 00 02         [ 2] 1179         subw x,#CELLL 
      008618 90 AE 00 1E      [ 2] 1180         ldw y,#UTFLASH
      00861C FF               [ 2] 1181         ldw (x),y 
      00861D 81               [ 4] 1182         ret 
                                   1183 
                                   1184 .endif ;PICATOUT_MOD
                                   1185 
                                   1186 ;       "EVAL   ( -- a )
                                   1187 ;       Execution vector of EVAL.
      00861E 86 0E                 1188         .word      LINK
                           0005A0  1189 LINK = . 
      008620 05                    1190         .byte      5
      008621 27 45 56 41 4C        1191         .ascii     "'EVAL"
      008626                       1192 TEVAL:
      008626 90 AE 00 10      [ 2] 1193 	LDW Y,#UINTER 
      00862A 1D 00 02         [ 2] 1194 	SUBW X,#2
      00862D FF               [ 2] 1195         LDW (X),Y
      00862E 81               [ 4] 1196         RET
                                   1197 
                                   1198 ;       HLD     ( -- a )
                                   1199 ;       Hold a pointer of output string.
      00862F 86 20                 1200         .word      LINK
                           0005B1  1201 LINK = . 
      008631 03                    1202         .byte      3
      008632 48 4C 44              1203         .ascii     "HLD"
      008635                       1204 HLD:
      008635 90 AE 00 12      [ 2] 1205 	LDW Y,#UHLD 
      008639 1D 00 02         [ 2] 1206 	SUBW X,#2
      00863C FF               [ 2] 1207         LDW (X),Y
      00863D 81               [ 4] 1208         RET
                                   1209 
                                   1210 ;       CONTEXT ( -- a )
                                   1211 ;       Start vocabulary search.
      00863E 86 31                 1212         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]



                           0005C0  1213 LINK = . 
      008640 07                    1214         .byte      7
      008641 43 4F 4E 54 45 58 54  1215         .ascii     "CONTEXT"
      008648                       1216 CNTXT:
      008648 90 AE 00 14      [ 2] 1217 	LDW Y,#UCNTXT
      00864C 1D 00 02         [ 2] 1218 	SUBW X,#2
      00864F FF               [ 2] 1219         LDW (X),Y
      008650 81               [ 4] 1220         RET
                                   1221 
                                   1222 ;       VP      ( -- a )
                                   1223 ;       Point to top of variables
      008651 86 40                 1224         .word      LINK
                           0005D3  1225 LINK = . 
      008653 02                    1226         .byte      2
      008654 56 50                 1227         .ascii     "VP"
      008656                       1228 VPP:
      008656 90 AE 00 16      [ 2] 1229 	LDW Y,#UVP 
      00865A 1D 00 02         [ 2] 1230 	SUBW X,#2
      00865D FF               [ 2] 1231         LDW (X),Y
      00865E 81               [ 4] 1232         RET
                                   1233 
                           000001  1234 .if PICATOUT_MOD
                                   1235 ;       CP    ( -- a )
                                   1236 ;       Pointer to top of FLASH 
      00865F 86 53                 1237         .word LINK 
                           0005E1  1238         LINK=.
      008661 02                    1239         .byte 2 
      008662 43 50                 1240         .ascii "CP"
      008664                       1241 CPP: 
      008664 90 AE 00 18      [ 2] 1242         ldw y,#UCP 
      008668 1D 00 02         [ 2] 1243         subw x,#CELLL 
      00866B FF               [ 2] 1244         ldw (x),y 
      00866C 81               [ 4] 1245         ret                
                                   1246 .endif ;PICATOUT_MOD
                                   1247 
                                   1248 ;       LAST    ( -- a )
                                   1249 ;       Point to last name in dictionary.
      00866D 86 61                 1250         .word      LINK
                           0005EF  1251 LINK = . 
      00866F 04                    1252         .byte      4
      008670 4C 41 53 54           1253         .ascii     "LAST"
      008674                       1254 LAST:
      008674 90 AE 00 1A      [ 2] 1255 	LDW Y,#ULAST 
      008678 1D 00 02         [ 2] 1256 	SUBW X,#2
      00867B FF               [ 2] 1257         LDW (X),Y
      00867C 81               [ 4] 1258         RET
                                   1259 
                           000001  1260 .if PICATOUT_MOD 
                                   1261 ; address of system variable URLAST 
                                   1262 ;       RAMLAST ( -- a )
                                   1263 ; RAM dictionary context 
      00867D 86 6F                 1264         .word LINK 
                           0005FF  1265         LINK=. 
      00867F 07                    1266         .byte 7  
      008680 52 41 4D 4C 41 53 54  1267         .ascii "RAMLAST" 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



      008687                       1268 RAMLAST: 
      008687 90 AE 00 20      [ 2] 1269         ldw y,#URLAST 
      00868B 1D 00 02         [ 2] 1270         subw x,#CELLL 
      00868E FF               [ 2] 1271         ldw (x),y 
      00868F 81               [ 4] 1272         ret 
                                   1273 .endif ;PICATOUT_MOD
                                   1274 
                           000001  1275 .if PICATOUT_MOD
                                   1276 ; OFFSET ( -- a )
                                   1277 ; address of system variable OFFSET 
      008690 86 7F                 1278         .word LINK 
                           000612  1279         LINK=.
      008692 06                    1280         .byte 6
      008693 4F 46 46 53 45 54     1281         .ascii "OFFSET" 
      008699                       1282 OFFSET: 
      008699 1D 00 02         [ 2] 1283         subw x,#CELLL
      00869C 90 AE 00 1C      [ 2] 1284         ldw y,#UOFFSET 
      0086A0 FF               [ 2] 1285         ldw (x),y 
      0086A1 81               [ 4] 1286         ret 
                                   1287 
                                   1288 ; adjust jump address adding OFFSET
                                   1289 ; ADR-ADJ ( a -- a+offset )
      0086A2                       1290 ADRADJ: 
      0086A2 CD 86 99         [ 4] 1291         call OFFSET 
      0086A5 CD 84 61         [ 4] 1292         call AT 
      0086A8 CC 87 03         [ 2] 1293         jp PLUS 
                                   1294 
                                   1295 .endif ; PICATOUT_MOD
                                   1296 
                                   1297 ;; Common functions
                                   1298 
                                   1299 ;       ?DUP    ( w -- w w | 0 )
                                   1300 ;       Dup tos if its is not zero.
      0086AB 86 92                 1301         .word      LINK
                           00062D  1302 LINK = . 
      0086AD 04                    1303         .byte      4
      0086AE 3F 44 55 50           1304         .ascii     "?DUP"
      0086B2                       1305 QDUP:
      0086B2 90 93            [ 1] 1306         LDW Y,X
      0086B4 90 FE            [ 2] 1307 	LDW Y,(Y)
      0086B6 27 04            [ 1] 1308         JREQ     QDUP1
      0086B8 1D 00 02         [ 2] 1309 	SUBW X,#2
      0086BB FF               [ 2] 1310         LDW (X),Y
      0086BC 81               [ 4] 1311 QDUP1:  RET
                                   1312 
                                   1313 ;       ROT     ( w1 w2 w3 -- w2 w3 w1 )
                                   1314 ;       Rot 3rd item to top.
      0086BD 86 AD                 1315         .word      LINK
                           00063F  1316 LINK = . 
      0086BF 03                    1317         .byte      3
      0086C0 52 4F 54              1318         .ascii     "ROT"
      0086C3                       1319 ROT:
                           000001  1320 .if PICATOUT_MOD
      0086C3 90 93            [ 1] 1321         ldw y,x 
      0086C5 90 FE            [ 2] 1322         ldw y,(y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



      0086C7 90 89            [ 2] 1323         pushw y 
      0086C9 90 93            [ 1] 1324         ldw y,x 
      0086CB 90 EE 04         [ 2] 1325         ldw y,(4,y)
      0086CE FF               [ 2] 1326         ldw (x),y 
      0086CF 90 93            [ 1] 1327         ldw y,x 
      0086D1 90 EE 02         [ 2] 1328         ldw y,(2,y)
      0086D4 EF 04            [ 2] 1329         ldw (4,x),y 
      0086D6 90 85            [ 2] 1330         popw y 
      0086D8 EF 02            [ 2] 1331         ldw (2,x),y
      0086DA 81               [ 4] 1332         ret 
                           000000  1333 .else 
                                   1334         LDW Y,X
                                   1335 	LDW Y,(4,Y)
                                   1336 	LDW YTEMP,Y
                                   1337         LDW Y,X
                                   1338         LDW Y,(2,Y)
                                   1339         LDW XTEMP,Y
                                   1340         LDW Y,X
                                   1341         LDW Y,(Y)
                                   1342         LDW (2,X),Y
                                   1343         LDW Y,XTEMP
                                   1344         LDW (4,X),Y
                                   1345         LDW Y,YTEMP
                                   1346         LDW (X),Y
                                   1347         RET
                                   1348 .endif 
                                   1349 
                                   1350 ;       2DROP   ( w w -- )
                                   1351 ;       Discard two items on stack.
      0086DB 86 BF                 1352         .word      LINK
                           00065D  1353 LINK = . 
      0086DD 05                    1354         .byte      5
      0086DE 32 44 52 4F 50        1355         .ascii     "2DROP"
      0086E3                       1356 DDROP:
      0086E3 1C 00 04         [ 2] 1357         ADDW X,#4
      0086E6 81               [ 4] 1358         RET
                                   1359 
                                   1360 ;       2DUP    ( w1 w2 -- w1 w2 w1 w2 )
                                   1361 ;       Duplicate top two items.
      0086E7 86 DD                 1362         .word      LINK
                           000669  1363 LINK = . 
      0086E9 04                    1364         .byte      4
      0086EA 32 44 55 50           1365         .ascii     "2DUP"
      0086EE                       1366 DDUP:
      0086EE 1D 00 04         [ 2] 1367         SUBW X,#4
      0086F1 90 93            [ 1] 1368         LDW Y,X
      0086F3 90 EE 06         [ 2] 1369         LDW Y,(6,Y)
      0086F6 EF 02            [ 2] 1370         LDW (2,X),Y
      0086F8 90 93            [ 1] 1371         LDW Y,X
      0086FA 90 EE 04         [ 2] 1372         LDW Y,(4,Y)
      0086FD FF               [ 2] 1373         LDW (X),Y
      0086FE 81               [ 4] 1374         RET
                                   1375 
                                   1376 ;       +       ( w w -- sum )
                                   1377 ;       Add top two items.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal [24-Bits]



      0086FF 86 E9                 1378         .word      LINK
                           000681  1379 LINK = . 
      008701 01                    1380         .byte      1
      008702 2B                    1381         .ascii     "+"
      008703                       1382 PLUS:
      008703 90 93            [ 1] 1383         LDW Y,X
      008705 90 FE            [ 2] 1384         LDW Y,(Y)
      008707 90 BF 24         [ 2] 1385         LDW YTEMP,Y
      00870A 1C 00 02         [ 2] 1386         ADDW X,#2
      00870D 90 93            [ 1] 1387         LDW Y,X
      00870F 90 FE            [ 2] 1388         LDW Y,(Y)
      008711 72 B9 00 24      [ 2] 1389         ADDW Y,YTEMP
      008715 FF               [ 2] 1390         LDW (X),Y
      008716 81               [ 4] 1391         RET
                                   1392 
                                   1393 ;       NOT     ( w -- w )
                                   1394 ;       One's complement of tos.
      008717 87 01                 1395         .word      LINK
                           000699  1396 LINK = . 
      008719 03                    1397         .byte      3
      00871A 4E 4F 54              1398         .ascii     "NOT"
      00871D                       1399 INVER:
      00871D 90 93            [ 1] 1400         LDW Y,X
      00871F 90 FE            [ 2] 1401         LDW Y,(Y)
      008721 90 53            [ 2] 1402         CPLW Y
      008723 FF               [ 2] 1403         LDW (X),Y
      008724 81               [ 4] 1404         RET
                                   1405 
                                   1406 ;       NEGATE  ( n -- -n )
                                   1407 ;       Two's complement of tos.
      008725 87 19                 1408         .word      LINK
                           0006A7  1409 LINK = . 
      008727 06                    1410         .byte      6
      008728 4E 45 47 41 54 45     1411         .ascii     "NEGATE"
      00872E                       1412 NEGAT:
      00872E 90 93            [ 1] 1413         LDW Y,X
      008730 90 FE            [ 2] 1414         LDW Y,(Y)
      008732 90 50            [ 2] 1415         NEGW Y
      008734 FF               [ 2] 1416         LDW (X),Y
      008735 81               [ 4] 1417         RET
                                   1418 
                                   1419 ;       DNEGATE ( d -- -d )
                                   1420 ;       Two's complement of top double.
      008736 87 27                 1421         .word      LINK
                           0006B8  1422 LINK = . 
      008738 07                    1423         .byte      7
      008739 44 4E 45 47 41 54 45  1424         .ascii     "DNEGATE"
      008740                       1425 DNEGA:
      008740 90 93            [ 1] 1426         LDW Y,X
      008742 90 FE            [ 2] 1427 	LDW Y,(Y)
      008744 90 53            [ 2] 1428         CPLW Y     
      008746 90 BF 24         [ 2] 1429 	LDW YTEMP,Y
      008749 90 93            [ 1] 1430         LDW Y,X
      00874B 90 EE 02         [ 2] 1431         LDW Y,(2,Y)
      00874E 90 53            [ 2] 1432         CPLW Y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



      008750 90 5C            [ 2] 1433         INCW Y
      008752 EF 02            [ 2] 1434         LDW (2,X),Y
      008754 90 BE 24         [ 2] 1435         LDW Y,YTEMP
      008757 24 02            [ 1] 1436         JRNC DN1 
      008759 90 5C            [ 2] 1437         INCW Y
      00875B FF               [ 2] 1438 DN1:    LDW (X),Y
      00875C 81               [ 4] 1439         RET
                                   1440 
                                   1441 ;       -       ( n1 n2 -- n1-n2 )
                                   1442 ;       Subtraction.
      00875D 87 38                 1443         .word      LINK
                           0006DF  1444 LINK = . 
      00875F 01                    1445         .byte      1
      008760 2D                    1446         .ascii     "-"
      008761                       1447 SUBB:
      008761 90 93            [ 1] 1448         LDW Y,X
      008763 90 FE            [ 2] 1449         LDW Y,(Y)
      008765 90 BF 24         [ 2] 1450         LDW YTEMP,Y
      008768 1C 00 02         [ 2] 1451         ADDW X,#2
      00876B 90 93            [ 1] 1452         LDW Y,X
      00876D 90 FE            [ 2] 1453         LDW Y,(Y)
      00876F 72 B2 00 24      [ 2] 1454         SUBW Y,YTEMP
      008773 FF               [ 2] 1455         LDW (X),Y
      008774 81               [ 4] 1456         RET
                                   1457 
                                   1458 ;       ABS     ( n -- n )
                                   1459 ;       Return  absolute value of n.
      008775 87 5F                 1460         .word      LINK
                           0006F7  1461 LINK = . 
      008777 03                    1462         .byte      3
      008778 41 42 53              1463         .ascii     "ABS"
      00877B                       1464 ABSS:
      00877B 90 93            [ 1] 1465         LDW Y,X
      00877D 90 FE            [ 2] 1466 	LDW Y,(Y)
      00877F 2A 03            [ 1] 1467         JRPL     AB1     ;negate:
      008781 90 50            [ 2] 1468         NEGW     Y     ;else negate hi byte
      008783 FF               [ 2] 1469         LDW (X),Y
      008784 81               [ 4] 1470 AB1:    RET
                                   1471 
                                   1472 ;       =       ( w w -- t )
                                   1473 ;       Return true if top two are =al.
      008785 87 77                 1474         .word      LINK
                           000707  1475 LINK = . 
      008787 01                    1476         .byte      1
      008788 3D                    1477         .ascii     "="
      008789                       1478 EQUAL:
      008789 A6 FF            [ 1] 1479         LD A,#0xFF  ;true
      00878B 90 93            [ 1] 1480         LDW Y,X    ;D = n2
      00878D 90 FE            [ 2] 1481         LDW Y,(Y)
      00878F 90 BF 24         [ 2] 1482         LDW YTEMP,Y
      008792 1C 00 02         [ 2] 1483         ADDW X,#2
      008795 90 93            [ 1] 1484         LDW Y,X
      008797 90 FE            [ 2] 1485         LDW Y,(Y)
      008799 90 B3 24         [ 2] 1486         CPW Y,YTEMP     ;if n2 <> n1
      00879C 27 01            [ 1] 1487         JREQ     EQ1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



      00879E 4F               [ 1] 1488         CLR A
      00879F F7               [ 1] 1489 EQ1:    LD (X),A
      0087A0 E7 01            [ 1] 1490         LD (1,X),A
      0087A2 81               [ 4] 1491 	RET     
                                   1492 
                                   1493 ;       U<      ( u u -- t )
                                   1494 ;       Unsigned compare of top two items.
      0087A3 87 87                 1495         .word      LINK
                           000725  1496 LINK = . 
      0087A5 02                    1497         .byte      2
      0087A6 55 3C                 1498         .ascii     "U<"
      0087A8                       1499 ULESS:
      0087A8 A6 FF            [ 1] 1500         LD A,#0xFF  ;true
      0087AA 90 93            [ 1] 1501         LDW Y,X    ;D = n2
      0087AC 90 FE            [ 2] 1502         LDW Y,(Y)
      0087AE 90 BF 24         [ 2] 1503         LDW YTEMP,Y
      0087B1 1C 00 02         [ 2] 1504         ADDW X,#2
      0087B4 90 93            [ 1] 1505         LDW Y,X
      0087B6 90 FE            [ 2] 1506         LDW Y,(Y)
      0087B8 90 B3 24         [ 2] 1507         CPW Y,YTEMP     ;if n2 <> n1
      0087BB 25 01            [ 1] 1508         JRULT     ULES1
      0087BD 4F               [ 1] 1509         CLR A
      0087BE F7               [ 1] 1510 ULES1:  LD (X),A
      0087BF E7 01            [ 1] 1511         LD (1,X),A
      0087C1 81               [ 4] 1512 	RET     
                                   1513 
                                   1514 ;       <       ( n1 n2 -- t )
                                   1515 ;       Signed compare of top two items.
      0087C2 87 A5                 1516         .word      LINK
                           000744  1517 LINK = . 
      0087C4 01                    1518         .byte      1
      0087C5 3C                    1519         .ascii     "<"
      0087C6                       1520 LESS:
      0087C6 A6 FF            [ 1] 1521         LD A,#0xFF  ;true
      0087C8 90 93            [ 1] 1522         LDW Y,X    ;D = n2
      0087CA 90 FE            [ 2] 1523         LDW Y,(Y)
      0087CC 90 BF 24         [ 2] 1524         LDW YTEMP,Y
      0087CF 1C 00 02         [ 2] 1525         ADDW X,#2
      0087D2 90 93            [ 1] 1526         LDW Y,X
      0087D4 90 FE            [ 2] 1527         LDW Y,(Y)
      0087D6 90 B3 24         [ 2] 1528         CPW Y,YTEMP     ;if n2 <> n1
      0087D9 2F 01            [ 1] 1529         JRSLT     LT1
      0087DB 4F               [ 1] 1530         CLR A
      0087DC F7               [ 1] 1531 LT1:    LD (X),A
      0087DD E7 01            [ 1] 1532         LD (1,X),A
      0087DF 81               [ 4] 1533 	RET     
                                   1534 
                                   1535 ;       MAX     ( n n -- n )
                                   1536 ;       Return greater of two top items.
      0087E0 87 C4                 1537         .word      LINK
                           000762  1538 LINK = . 
      0087E2 03                    1539         .byte      3
      0087E3 4D 41 58              1540         .ascii     "MAX"
      0087E6                       1541 MAX:
      0087E6 90 93            [ 1] 1542         LDW Y,X    ;D = n2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



      0087E8 90 EE 02         [ 2] 1543         LDW Y,(2,Y)
      0087EB 90 BF 24         [ 2] 1544         LDW YTEMP,Y
      0087EE 90 93            [ 1] 1545         LDW Y,X
      0087F0 90 FE            [ 2] 1546         LDW Y,(Y)
      0087F2 90 B3 24         [ 2] 1547         CPW Y,YTEMP     ;if n2 <> n1
      0087F5 2F 02            [ 1] 1548         JRSLT     MAX1
      0087F7 EF 02            [ 2] 1549         LDW (2,X),Y
      0087F9 1C 00 02         [ 2] 1550 MAX1:   ADDW X,#2
      0087FC 81               [ 4] 1551 	RET     
                                   1552 
                                   1553 ;       MIN     ( n n -- n )
                                   1554 ;       Return smaller of top two items.
      0087FD 87 E2                 1555         .word      LINK
                           00077F  1556 LINK = . 
      0087FF 03                    1557         .byte      3
      008800 4D 49 4E              1558         .ascii     "MIN"
      008803                       1559 MIN:
      008803 90 93            [ 1] 1560         LDW Y,X    ;D = n2
      008805 90 EE 02         [ 2] 1561         LDW Y,(2,Y)
      008808 90 BF 24         [ 2] 1562         LDW YTEMP,Y
      00880B 90 93            [ 1] 1563         LDW Y,X
      00880D 90 FE            [ 2] 1564         LDW Y,(Y)
      00880F 90 B3 24         [ 2] 1565         CPW Y,YTEMP     ;if n2 <> n1
      008812 2C 02            [ 1] 1566         JRSGT     MIN1
      008814 EF 02            [ 2] 1567         LDW (2,X),Y
      008816 1C 00 02         [ 2] 1568 MIN1:	ADDW X,#2
      008819 81               [ 4] 1569 	RET     
                                   1570 
                                   1571 ;       WITHIN  ( u ul uh -- t )
                                   1572 ;       Return true if u is within
                                   1573 ;       range of ul and uh. ( ul <= u < uh )
      00881A 87 FF                 1574         .word      LINK
                           00079C  1575 LINK = . 
      00881C 06                    1576         .byte      6
      00881D 57 49 54 48 49 4E     1577         .ascii     "WITHIN"
      008823                       1578 WITHI:
      008823 CD 85 32         [ 4] 1579         CALL     OVER
      008826 CD 87 61         [ 4] 1580         CALL     SUBB
      008829 CD 84 D1         [ 4] 1581         CALL     TOR
      00882C CD 87 61         [ 4] 1582         CALL     SUBB
      00882F CD 84 B2         [ 4] 1583         CALL     RFROM
      008832 CC 87 A8         [ 2] 1584         JP     ULESS
                                   1585 
                                   1586 ;; Divide
                                   1587 
                                   1588 ;       UM/MOD  ( udl udh un -- ur uq )
                                   1589 ;       Unsigned divide of a double by a
                                   1590 ;       single. Return mod and quotient.
      008835 88 1C                 1591         .word      LINK
                           0007B7  1592 LINK = . 
      008837 06                    1593         .byte      6
      008838 55 4D 2F 4D 4F 44     1594         .ascii     "UM/MOD"
      00883E                       1595 UMMOD:
      00883E BF 22            [ 2] 1596 	LDW XTEMP,X	; save stack pointer
      008840 FE               [ 2] 1597 	LDW X,(X)	; un
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



      008841 BF 24            [ 2] 1598 	LDW YTEMP,X     ; save un
      008843 90 BE 22         [ 2] 1599 	LDW Y,XTEMP	; stack pointer
      008846 90 EE 04         [ 2] 1600 	LDW Y,(4,Y)     ; Y=udl
      008849 BE 22            [ 2] 1601 	LDW X,XTEMP
      00884B EE 02            [ 2] 1602 	LDW X,(2,X)	; X=udh
      00884D B3 24            [ 2] 1603 	CPW X,YTEMP
      00884F 23 0F            [ 2] 1604 	JRULE MMSM1
      008851 BE 22            [ 2] 1605 	LDW X,XTEMP
      008853 1C 00 02         [ 2] 1606 	ADDW X,#2	; pop off 1 level
      008856 90 AE FF FF      [ 2] 1607 	LDW Y,#0xFFFF
      00885A FF               [ 2] 1608 	LDW (X),Y
      00885B 90 5F            [ 1] 1609 	CLRW Y
      00885D EF 02            [ 2] 1610 	LDW (2,X),Y
      00885F 81               [ 4] 1611 	RET
      008860                       1612 MMSM1:
                           000001  1613 .if  PICATOUT_MOD 
                                   1614 ; take advantage of divw x,y when udh==0
      008860 5D               [ 2] 1615         tnzw x  ; is udh==0?
      008861 26 11            [ 1] 1616         jrne MMSM2 
      008863 93               [ 1] 1617         ldw x,y    ;udl 
      008864 90 BE 24         [ 2] 1618         ldw y,YTEMP ; divisor 
      008867 65               [ 2] 1619         divw x,y 
      008868 89               [ 2] 1620         pushw x     ; quotient 
      008869 BE 22            [ 2] 1621         ldw x,XTEMP 
      00886B 1C 00 02         [ 2] 1622         addw x,#CELLL 
      00886E EF 02            [ 2] 1623         ldw (2,x),y  ; ur
      008870 90 85            [ 2] 1624         popw y 
      008872 FF               [ 2] 1625         ldw (x),y ; uq 
      008873 81               [ 4] 1626         ret 
      008874                       1627 MMSM2:        
                                   1628 .endif 
      008874 A6 11            [ 1] 1629 	LD A,#17	; loop count
      008876                       1630 MMSM3:
      008876 B3 24            [ 2] 1631 	CPW X,YTEMP	; compare udh to un
      008878 25 04            [ 1] 1632 	JRULT MMSM4	; can't subtract
      00887A 72 B0 00 24      [ 2] 1633 	SUBW X,YTEMP	; can subtract
      00887E                       1634 MMSM4:
      00887E 8C               [ 1] 1635 	CCF	; quotient bit
      00887F 90 59            [ 2] 1636 	RLCW Y	; rotate into quotient
      008881 59               [ 2] 1637 	RLCW X	; rotate into remainder
      008882 4A               [ 1] 1638 	DEC A	; repeat
      008883 22 F1            [ 1] 1639 	JRUGT MMSM3
      008885 57               [ 2] 1640 	SRAW X
      008886 BF 24            [ 2] 1641 	LDW YTEMP,X	; done, save remainder
      008888 BE 22            [ 2] 1642 	LDW X,XTEMP
      00888A 1C 00 02         [ 2] 1643 	ADDW X,#2	; drop
      00888D FF               [ 2] 1644 	LDW (X),Y
      00888E 90 BE 24         [ 2] 1645 	LDW Y,YTEMP	; save quotient
      008891 EF 02            [ 2] 1646 	LDW (2,X),Y
      008893 81               [ 4] 1647 	RET
                                   1648 	
                                   1649 ;       M/MOD   ( d n -- r q )
                                   1650 ;       Signed floored divide of double by
                                   1651 ;       single. Return mod and quotient.
      008894 88 37                 1652         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



                           000816  1653 LINK = . 
      008896 05                    1654         .byte      5
      008897 4D 2F 4D 4F 44        1655         .ascii     "M/MOD"
      00889C                       1656 MSMOD:  
      00889C CD 85 08         [ 4] 1657         CALL	DUPP
      00889F CD 85 41         [ 4] 1658         CALL	ZLESS
      0088A2 CD 85 08         [ 4] 1659         CALL	DUPP
      0088A5 CD 84 D1         [ 4] 1660         CALL	TOR
      0088A8 CD 84 0C         [ 4] 1661         CALL	QBRAN
      0088AB 88 B9                 1662         .word	MMOD1
      0088AD CD 87 2E         [ 4] 1663         CALL	NEGAT
      0088B0 CD 84 D1         [ 4] 1664         CALL	TOR
      0088B3 CD 87 40         [ 4] 1665         CALL	DNEGA
      0088B6 CD 84 B2         [ 4] 1666         CALL	RFROM
      0088B9 CD 84 D1         [ 4] 1667 MMOD1:	CALL	TOR
      0088BC CD 85 08         [ 4] 1668         CALL	DUPP
      0088BF CD 85 41         [ 4] 1669         CALL	ZLESS
      0088C2 CD 84 0C         [ 4] 1670         CALL	QBRAN
      0088C5 88 CD                 1671         .word	MMOD2
      0088C7 CD 84 C5         [ 4] 1672         CALL	RAT
      0088CA CD 87 03         [ 4] 1673         CALL	PLUS
      0088CD CD 84 B2         [ 4] 1674 MMOD2:	CALL	RFROM
      0088D0 CD 88 3E         [ 4] 1675         CALL	UMMOD
      0088D3 CD 84 B2         [ 4] 1676         CALL	RFROM
      0088D6 CD 84 0C         [ 4] 1677         CALL	QBRAN
      0088D9 88 E4                 1678         .word	MMOD3
      0088DB CD 85 18         [ 4] 1679         CALL	SWAPP
      0088DE CD 87 2E         [ 4] 1680         CALL	NEGAT
      0088E1 CD 85 18         [ 4] 1681         CALL	SWAPP
      0088E4 81               [ 4] 1682 MMOD3:	RET
                                   1683 
                                   1684 ;       /MOD    ( n n -- r q )
                                   1685 ;       Signed divide. Return mod and quotient.
      0088E5 88 96                 1686         .word      LINK
                           000867  1687 LINK = . 
      0088E7 04                    1688         .byte      4
      0088E8 2F 4D 4F 44           1689         .ascii     "/MOD"
      0088EC                       1690 SLMOD:
      0088EC CD 85 32         [ 4] 1691         CALL	OVER
      0088EF CD 85 41         [ 4] 1692         CALL	ZLESS
      0088F2 CD 85 18         [ 4] 1693         CALL	SWAPP
      0088F5 CC 88 9C         [ 2] 1694         JP	MSMOD
                                   1695 
                                   1696 ;       MOD     ( n n -- r )
                                   1697 ;       Signed divide. Return mod only.
      0088F8 88 E7                 1698         .word      LINK
                           00087A  1699 LINK = . 
      0088FA 03                    1700         .byte      3
      0088FB 4D 4F 44              1701         .ascii     "MOD"
      0088FE                       1702 MODD:
      0088FE CD 88 EC         [ 4] 1703 	CALL	SLMOD
      008901 CC 84 FE         [ 2] 1704 	JP	DROP
                                   1705 
                                   1706 ;       /       ( n n -- q )
                                   1707 ;       Signed divide. Return quotient only.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



      008904 88 FA                 1708         .word      LINK
                           000886  1709 LINK = . 
      008906 01                    1710         .byte      1
      008907 2F                    1711         .ascii     "/"
      008908                       1712 SLASH:
      008908 CD 88 EC         [ 4] 1713         CALL	SLMOD
      00890B CD 85 18         [ 4] 1714         CALL	SWAPP
      00890E CC 84 FE         [ 2] 1715         JP	DROP
                                   1716 
                                   1717 ;; Multiply
                                   1718 
                                   1719 ;       UM*     ( u u -- ud )
                                   1720 ;       Unsigned multiply. Return double product.
      008911 89 06                 1721         .word      LINK
                           000893  1722 LINK = . 
      008913 03                    1723         .byte      3
      008914 55 4D 2A              1724         .ascii     "UM*"
      008917                       1725 UMSTA:	; stack have 4 bytes u1=a,b u2=c,d
                           000001  1726 .if PICATOUT_MOD 
                                   1727 ; take advantage of SP addressing modes
                                   1728 ; these PRODx in RAM are not required
                                   1729 ; the product is kept on stack as local variable 
                                   1730         ;; bytes offset on data stack 
                           000002  1731         da=2 
                           000003  1732         db=3 
                           000000  1733         dc=0 
                           000001  1734         dd=1 
                                   1735         ;; product bytes offset on return stack 
                           000001  1736         UD1=1  ; ud bits 31..24
                           000002  1737         UD2=2  ; ud bits 23..16
                           000003  1738         UD3=3  ; ud bits 15..8 
                           000004  1739         UD4=4  ; ud bits 7..0 
                                   1740         ;; local variable for product set to zero   
      008917 90 5F            [ 1] 1741         clrw y 
      008919 90 89            [ 2] 1742         pushw y  ; bits 15..0
      00891B 90 89            [ 2] 1743         pushw y  ; bits 31..16 
      00891D E6 03            [ 1] 1744         ld a,(db,x) ; b 
      00891F 90 97            [ 1] 1745         ld yl,a 
      008921 E6 01            [ 1] 1746         ld a,(dd,x)   ; d
      008923 90 42            [ 4] 1747         mul y,a    ; b*d  
      008925 17 03            [ 2] 1748         ldw (UD3,sp),y ; lowest weight product 
      008927 E6 03            [ 1] 1749         ld a,(db,x)
      008929 90 97            [ 1] 1750         ld yl,a 
      00892B E6 00            [ 1] 1751         ld a,(dc,x)
      00892D 90 42            [ 4] 1752         mul y,a  ; b*c 
                                   1753         ;;; do the partial sum 
      00892F 72 F9 02         [ 2] 1754         addw y,(UD2,sp)
      008932 4F               [ 1] 1755         clr a 
      008933 49               [ 1] 1756         rlc a
      008934 6B 01            [ 1] 1757         ld (UD1,sp),a 
      008936 17 02            [ 2] 1758         ldw (UD2,sp),y 
      008938 E6 02            [ 1] 1759         ld a,(da,x)
      00893A 90 97            [ 1] 1760         ld yl,a 
      00893C E6 01            [ 1] 1761         ld a,(dd,x)
      00893E 90 42            [ 4] 1762         mul y,a   ; a*d 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



                                   1763         ;; do partial sum 
      008940 72 F9 02         [ 2] 1764         addw y,(UD2,sp)
      008943 4F               [ 1] 1765         clr a 
      008944 19 01            [ 1] 1766         adc a,(UD1,sp)
      008946 6B 01            [ 1] 1767         ld (UD1,sp),a  
      008948 17 02            [ 2] 1768         ldw (UD2,sp),y 
      00894A E6 02            [ 1] 1769         ld a,(da,x)
      00894C 90 97            [ 1] 1770         ld yl,a 
      00894E E6 00            [ 1] 1771         ld a,(dc,x)
      008950 90 42            [ 4] 1772         mul y,a  ;  a*c highest weight product 
                                   1773         ;;; do partial sum 
      008952 72 F9 01         [ 2] 1774         addw y,(UD1,sp)
      008955 FF               [ 2] 1775         ldw (x),y  ; udh 
      008956 16 03            [ 2] 1776         ldw y,(UD3,sp)
      008958 EF 02            [ 2] 1777         ldw (2,x),y  ; udl  
      00895A 5B 04            [ 2] 1778         addw sp,#4 ; drop local variable 
      00895C 81               [ 4] 1779         ret  
                           000000  1780 .else
                                   1781 	LD A,(2,X)	; b
                                   1782 	LD YL,A
                                   1783 	LD A,(X)	; d
                                   1784 	MUL Y,A
                                   1785 	LDW PROD1,Y
                                   1786 	LD A,(3,X)	; a
                                   1787 	LD YL,A
                                   1788 	LD A,(X)	; d
                                   1789 	MUL Y,A
                                   1790 	LDW PROD2,Y
                                   1791 	LD A,(2,X)	; b
                                   1792 	LD YL,A
                                   1793 	LD A,(1,X)	; c
                                   1794 	MUL Y,A
                                   1795 	LDW PROD3,Y
                                   1796 	LD A,(3,X)	; a
                                   1797 	LD YL,A
                                   1798 	LD A,(1,X)	; c
                                   1799 	MUL Y,A	; least signifiant product
                                   1800 	CLR A
                                   1801 	RRWA Y
                                   1802 	LD (3,X),A	; store least significant byte
                                   1803 	ADDW Y,PROD3
                                   1804 	CLR A
                                   1805 	ADC A,#0	; save carry
                                   1806 	LD CARRY,A
                                   1807 	ADDW Y,PROD2
                                   1808 	LD A,CARRY
                                   1809 	ADC A,#0	; add 2nd carry
                                   1810 	LD CARRY,A
                                   1811 	CLR A
                                   1812 	RRWA Y
                                   1813 	LD (2,X),A	; 2nd product byte
                                   1814 	ADDW Y,PROD1
                                   1815 	RRWA Y
                                   1816 	LD (1,X),A	; 3rd product byte
                                   1817 	RRWA Y  	; 4th product byte now in A
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



                                   1818 	ADC A,CARRY	; fill in carry bits
                                   1819 	LD (X),A
                                   1820 	RET
                                   1821 .endif 
                                   1822 
                                   1823 
                                   1824 ;       *       ( n n -- n )
                                   1825 ;       Signed multiply. Return single product.
      00895D 89 13                 1826         .word      LINK
                           0008DF  1827 LINK = . 
      00895F 01                    1828         .byte      1
      008960 2A                    1829         .ascii     "*"
      008961                       1830 STAR:
      008961 CD 89 17         [ 4] 1831 	CALL	UMSTA
      008964 CC 84 FE         [ 2] 1832 	JP	DROP
                                   1833 
                                   1834 ;       M*      ( n n -- d )
                                   1835 ;       Signed multiply. Return double product.
      008967 89 5F                 1836         .word      LINK
                           0008E9  1837 LINK = . 
      008969 02                    1838         .byte      2
      00896A 4D 2A                 1839         .ascii     "M*"
      00896C                       1840 MSTAR:      
      00896C CD 86 EE         [ 4] 1841         CALL	DDUP
      00896F CD 85 7D         [ 4] 1842         CALL	XORR
      008972 CD 85 41         [ 4] 1843         CALL	ZLESS
      008975 CD 84 D1         [ 4] 1844         CALL	TOR
      008978 CD 87 7B         [ 4] 1845         CALL	ABSS
      00897B CD 85 18         [ 4] 1846         CALL	SWAPP
      00897E CD 87 7B         [ 4] 1847         CALL	ABSS
      008981 CD 89 17         [ 4] 1848         CALL	UMSTA
      008984 CD 84 B2         [ 4] 1849         CALL	RFROM
      008987 CD 84 0C         [ 4] 1850         CALL	QBRAN
      00898A 89 8F                 1851         .word	MSTA1
      00898C CD 87 40         [ 4] 1852         CALL	DNEGA
      00898F 81               [ 4] 1853 MSTA1:	RET
                                   1854 
                                   1855 ;       . /MOD   ( n1 n2 n3 -- r q )
                                   1856 ;       Multiply n1 and n2, then divide
                                   1857 ;       by n3. Return mod and quotient.
      008990 89 69                 1858         .word      LINK
                           000912  1859 LINK = . 
      008992 05                    1860         .byte      5
      008993 2A 2F 4D 4F 44        1861         .ascii     "*/MOD"
      008998                       1862 SSMOD:
      008998 CD 84 D1         [ 4] 1863         CALL     TOR
      00899B CD 89 6C         [ 4] 1864         CALL     MSTAR
      00899E CD 84 B2         [ 4] 1865         CALL     RFROM
      0089A1 CC 88 9C         [ 2] 1866         JP     MSMOD
                                   1867 
                                   1868 ;       */      ( n1 n2 n3 -- q )
                                   1869 ;       Multiply n1 by n2, then divide
                                   1870 ;       by n3. Return quotient only.
      0089A4 89 92                 1871         .word      LINK
                           000926  1872 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



      0089A6 02                    1873         .byte      2
      0089A7 2A 2F                 1874         .ascii     "*/"
      0089A9                       1875 STASL:
      0089A9 CD 89 98         [ 4] 1876         CALL	SSMOD
      0089AC CD 85 18         [ 4] 1877         CALL	SWAPP
      0089AF CC 84 FE         [ 2] 1878         JP	DROP
                                   1879 
                                   1880 ;; Miscellaneous
                                   1881 
                                   1882 ;       CELL+   ( a -- a )
                                   1883 ;       Add cell size in byte to address.
      0089B2 89 A6                 1884         .word      LINK
                           000934  1885 LINK = . 
      0089B4 02                    1886         .byte       2
      0089B5 32 2B                 1887         .ascii     "2+"
      0089B7                       1888 CELLP:
      0089B7 90 93            [ 1] 1889         LDW Y,X
      0089B9 90 FE            [ 2] 1890 	LDW Y,(Y)
      0089BB 72 A9 00 02      [ 2] 1891         ADDW Y,#CELLL 
      0089BF FF               [ 2] 1892         LDW (X),Y
      0089C0 81               [ 4] 1893         RET
                                   1894 
                                   1895 ;       CELL-   ( a -- a )
                                   1896 ;       Subtract 2 from address.
      0089C1 89 B4                 1897         .word      LINK
                           000943  1898 LINK = . 
      0089C3 02                    1899         .byte       2
      0089C4 32 2D                 1900         .ascii     "2-"
      0089C6                       1901 CELLM:
      0089C6 90 93            [ 1] 1902         LDW Y,X
      0089C8 90 FE            [ 2] 1903 	LDW Y,(Y)
      0089CA 72 A2 00 02      [ 2] 1904         SUBW Y,#CELLL
      0089CE FF               [ 2] 1905         LDW (X),Y
      0089CF 81               [ 4] 1906         RET
                                   1907 
                                   1908 ;       CELLS   ( n -- n )
                                   1909 ;       Multiply tos by 2.
      0089D0 89 C3                 1910         .word      LINK
                           000952  1911 LINK = . 
      0089D2 02                    1912         .byte       2
      0089D3 32 2A                 1913         .ascii     "2*"
      0089D5                       1914 CELLS:
      0089D5 90 93            [ 1] 1915         LDW Y,X
      0089D7 90 FE            [ 2] 1916 	LDW Y,(Y)
      0089D9 90 58            [ 2] 1917         SLAW Y
      0089DB FF               [ 2] 1918         LDW (X),Y
      0089DC 81               [ 4] 1919         RET
                                   1920 
                                   1921 ;       1+      ( a -- a )
                                   1922 ;       Add cell size in byte to address.
      0089DD 89 D2                 1923         .word      LINK
                           00095F  1924 LINK = . 
      0089DF 02                    1925         .byte      2
      0089E0 31 2B                 1926         .ascii     "1+"
      0089E2                       1927 ONEP:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



      0089E2 90 93            [ 1] 1928         LDW Y,X
      0089E4 90 FE            [ 2] 1929 	LDW Y,(Y)
      0089E6 90 5C            [ 2] 1930         INCW Y
      0089E8 FF               [ 2] 1931         LDW (X),Y
      0089E9 81               [ 4] 1932         RET
                                   1933 
                                   1934 ;       1-      ( a -- a )
                                   1935 ;       Subtract 2 from address.
      0089EA 89 DF                 1936         .word      LINK
                           00096C  1937 LINK = . 
      0089EC 02                    1938         .byte      2
      0089ED 31 2D                 1939         .ascii     "1-"
      0089EF                       1940 ONEM:
      0089EF 90 93            [ 1] 1941         LDW Y,X
      0089F1 90 FE            [ 2] 1942 	LDW Y,(Y)
      0089F3 90 5A            [ 2] 1943         DECW Y
      0089F5 FF               [ 2] 1944         LDW (X),Y
      0089F6 81               [ 4] 1945         RET
                                   1946 
                                   1947 ;  shift left n times 
                                   1948 ; LSHIFT ( n1 n2 -- n1<<n2 )
      0089F7 89 EC                 1949         .word LINK 
                           000979  1950         LINK=.
      0089F9 06                    1951         .byte 6 
      0089FA 4C 53 48 49 46 54     1952         .ascii "LSHIFT"
      008A00                       1953 LSHIFT:
      008A00 E6 01            [ 1] 1954         ld a,(1,x)
      008A02 1C 00 02         [ 2] 1955         addw x,#CELLL 
      008A05 90 93            [ 1] 1956         ldw y,x 
      008A07 90 FE            [ 2] 1957         ldw y,(y)
      008A09                       1958 LSHIFT1:
      008A09 4D               [ 1] 1959         tnz a 
      008A0A 27 05            [ 1] 1960         jreq LSHIFT4 
      008A0C 90 58            [ 2] 1961         sllw y 
      008A0E 4A               [ 1] 1962         dec a 
      008A0F 20 F8            [ 2] 1963         jra LSHIFT1 
      008A11                       1964 LSHIFT4:
      008A11 FF               [ 2] 1965         ldw (x),y 
      008A12 81               [ 4] 1966         ret 
                                   1967 
                                   1968 ; shift right n times                 
                                   1969 ; RSHIFT (n1 n2 -- n1>>n2 )
      008A13 89 F9                 1970         .word LINK 
                           000995  1971         LINK=.
      008A15 06                    1972         .byte 6
      008A16 52 53 48 49 46 54     1973         .ascii "RSHIFT"
      008A1C                       1974 RSHIFT:
      008A1C E6 01            [ 1] 1975         ld a,(1,x)
      008A1E 1C 00 02         [ 2] 1976         addw x,#CELLL 
      008A21 90 93            [ 1] 1977         ldw y,x 
      008A23 90 FE            [ 2] 1978         ldw y,(y)
      008A25                       1979 RSHIFT1:
      008A25 4D               [ 1] 1980         tnz a 
      008A26 27 05            [ 1] 1981         jreq RSHIFT4 
      008A28 90 54            [ 2] 1982         srlw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



      008A2A 4A               [ 1] 1983         dec a 
      008A2B 20 F8            [ 2] 1984         jra RSHIFT1 
      008A2D                       1985 RSHIFT4:
      008A2D FF               [ 2] 1986         ldw (x),y 
      008A2E 81               [ 4] 1987         ret 
                                   1988 
                                   1989 
                                   1990 ;       2/      ( n -- n )
                                   1991 ;       divide  tos by 2.
      008A2F 8A 15                 1992         .word      LINK
                           0009B1  1993 LINK = . 
      008A31 02                    1994         .byte      2
      008A32 32 2F                 1995         .ascii     "2/"
      008A34                       1996 TWOSL:
      008A34 90 93            [ 1] 1997         LDW Y,X
      008A36 90 FE            [ 2] 1998 	LDW Y,(Y)
      008A38 90 57            [ 2] 1999         SRAW Y
      008A3A FF               [ 2] 2000         LDW (X),Y
      008A3B 81               [ 4] 2001         RET
                                   2002 
                                   2003 ;       BL      ( -- 32 )
                                   2004 ;       Return 32,  blank character.
      008A3C 8A 31                 2005         .word      LINK
                           0009BE  2006 LINK = . 
      008A3E 02                    2007         .byte      2
      008A3F 42 4C                 2008         .ascii     "BL"
      008A41                       2009 BLANK:
      008A41 1D 00 02         [ 2] 2010         SUBW X,#2
      008A44 90 AE 00 20      [ 2] 2011 	LDW Y,#32
      008A48 FF               [ 2] 2012         LDW (X),Y
      008A49 81               [ 4] 2013         RET
                                   2014 
                                   2015 ;         0     ( -- 0)
                                   2016 ;         Return 0.
      008A4A 8A 3E                 2017         .word      LINK
                           0009CC  2018 LINK = . 
      008A4C 01                    2019         .byte       1
      008A4D 30                    2020         .ascii     "0"
      008A4E                       2021 ZERO:
      008A4E 1D 00 02         [ 2] 2022         SUBW X,#2
      008A51 90 5F            [ 1] 2023 	CLRW Y
      008A53 FF               [ 2] 2024         LDW (X),Y
      008A54 81               [ 4] 2025         RET
                                   2026 
                                   2027 ;         1     ( -- 1)
                                   2028 ;         Return 1.
      008A55 8A 4C                 2029         .word      LINK
                           0009D7  2030 LINK = . 
      008A57 01                    2031         .byte       1
      008A58 31                    2032         .ascii     "1"
      008A59                       2033 ONE:
      008A59 1D 00 02         [ 2] 2034         SUBW X,#2
      008A5C 90 AE 00 01      [ 2] 2035 	LDW Y,#1
      008A60 FF               [ 2] 2036         LDW (X),Y
      008A61 81               [ 4] 2037         RET
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



                                   2038 
                                   2039 ;         -1    ( -- -1)
                                   2040 ;         Return 32,  blank character.
      008A62 8A 57                 2041         .word      LINK
                           0009E4  2042 LINK = . 
      008A64 02                    2043         .byte       2
      008A65 2D 31                 2044         .ascii     "-1"
      008A67                       2045 MONE:
      008A67 1D 00 02         [ 2] 2046         SUBW X,#2
      008A6A 90 AE FF FF      [ 2] 2047 	LDW Y,#0xFFFF
      008A6E FF               [ 2] 2048         LDW (X),Y
      008A6F 81               [ 4] 2049         RET
                                   2050 
                                   2051 ;       >CHAR   ( c -- c )
                                   2052 ;       Filter non-printing characters.
      008A70 8A 64                 2053         .word      LINK
                           0009F2  2054 LINK = . 
      008A72 05                    2055         .byte      5
      008A73 3E 43 48 41 52        2056         .ascii     ">CHAR"
      008A78                       2057 TCHAR:
                           000001  2058 .if CONVERT_TO_CODE
      008A78 E6 01            [ 1] 2059         ld a,(1,x)
      008A7A A1 20            [ 1] 2060         cp a,#32  
      008A7C 2B 05            [ 1] 2061         jrmi 1$ 
      008A7E A1 7F            [ 1] 2062         cp a,#127 
      008A80 2A 01            [ 1] 2063         jrpl 1$ 
      008A82 81               [ 4] 2064         ret 
      008A83 A6 5F            [ 1] 2065 1$:     ld a,#'_ 
      008A85 E7 01            [ 1] 2066         ld (1,x),a 
      008A87 81               [ 4] 2067         ret 
                           000000  2068 .else
                                   2069         CALL     DOLIT
                                   2070         .word       0x7F
                                   2071         CALL     ANDD
                                   2072         CALL     DUPP    ;mask msb
                                   2073         CALL     DOLIT
                                   2074         .word      127
                                   2075         CALL     BLANK
                                   2076         CALL     WITHI   ;check for printable
                                   2077         CALL     QBRAN
                                   2078         .word    TCHA1
                                   2079         CALL     DROP
                                   2080         CALL     DOLIT
                                   2081         .word     0x5F		; "_"     ;replace non-printables
                                   2082 .endif 
      008A88 81               [ 4] 2083 TCHA1:  RET
                                   2084 
                                   2085 ;       DEPTH   ( -- n )
                                   2086 ;       Return  depth of  data stack.
      008A89 8A 72                 2087         .word      LINK
                           000A0B  2088 LINK = . 
      008A8B 05                    2089         .byte      5
      008A8C 44 45 50 54 48        2090         .ascii     "DEPTH"
      008A91                       2091 DEPTH: 
      008A91 90 BE 2A         [ 2] 2092         LDW Y,SP0    ;save data stack ptr
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



      008A94 BF 22            [ 2] 2093 	LDW XTEMP,X
      008A96 72 B2 00 22      [ 2] 2094         SUBW Y,XTEMP     ;#bytes = SP0 - X
      008A9A 90 57            [ 2] 2095         SRAW Y    ;Y = #stack items
                           000001  2096 .if PICATOUT_MOD
                                   2097 ; why ? 
                                   2098 ;      	DECW Y
                                   2099 .endif 
      008A9C 1D 00 02         [ 2] 2100 	SUBW X,#2
      008A9F FF               [ 2] 2101         LDW (X),Y     ; if neg, underflow
      008AA0 81               [ 4] 2102         RET
                                   2103 
                                   2104 ;       PICK    ( ... +n -- ... w )
                                   2105 ;       Copy  nth stack item to tos.
      008AA1 8A 8B                 2106         .word      LINK
                           000A23  2107 LINK = . 
      008AA3 04                    2108         .byte      4
      008AA4 50 49 43 4B           2109         .ascii     "PICK"
      008AA8                       2110 PICK:
      008AA8 90 93            [ 1] 2111         LDW Y,X   ;D = n1
      008AAA 90 FE            [ 2] 2112         LDW Y,(Y)
                           000001  2113 .if PICATOUT_MOD
                                   2114 ; modified for standard compliance          
                                   2115 ; 0 PICK must be equivalent to DUP 
      008AAC 90 5C            [ 2] 2116         INCW Y 
                                   2117 .endif         
      008AAE 90 58            [ 2] 2118         SLAW Y
      008AB0 BF 22            [ 2] 2119         LDW XTEMP,X
      008AB2 72 B9 00 22      [ 2] 2120         ADDW Y,XTEMP
      008AB6 90 FE            [ 2] 2121         LDW Y,(Y)
      008AB8 FF               [ 2] 2122         LDW (X),Y
      008AB9 81               [ 4] 2123         RET
                                   2124 
                                   2125 ;; Memory access
                                   2126 
                                   2127 ;       +!      ( n a -- )
                                   2128 ;       Add n to  contents at address a.
      008ABA 8A A3                 2129         .word      LINK
                           000A3C  2130 LINK = . 
      008ABC 02                    2131         .byte      2
      008ABD 2B 21                 2132         .ascii     "+!"
      008ABF                       2133 PSTOR:
                           000001  2134 .if CONVERT_TO_CODE
      008ABF 90 93            [ 1] 2135         ldw y,x 
      008AC1 90 FE            [ 2] 2136         ldw y,(y)
      008AC3 90 BF 24         [ 2] 2137         ldw YTEMP,y  ; address
      008AC6 90 FE            [ 2] 2138         ldw y,(y)  
      008AC8 90 89            [ 2] 2139         pushw y  ; value at address 
      008ACA 90 93            [ 1] 2140         ldw y,x 
      008ACC 90 EE 02         [ 2] 2141         ldw y,(2,y) ; n 
      008ACF 72 F9 01         [ 2] 2142         addw y,(1,sp) ; n+value
      008AD2 91 CF 24         [ 5] 2143         ldw [YTEMP],y ;  a!
      008AD5 90 85            [ 2] 2144         popw y    ;drop local var
      008AD7 1C 00 04         [ 2] 2145         addw x,#4 ; DDROP 
      008ADA 81               [ 4] 2146         ret 
                           000000  2147 .else
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



                                   2148         CALL	SWAPP
                                   2149         CALL	OVER
                                   2150         CALL	AT
                                   2151         CALL	PLUS
                                   2152         CALL	SWAPP
                                   2153         JP	STORE
                                   2154 .endif 
                                   2155 
                                   2156 ;       2!      ( d a -- )
                                   2157 ;       Store  double integer to address a.
      008ADB 8A BC                 2158         .word      LINK
                           000A5D  2159 LINK = . 
      008ADD 02                    2160         .byte      2
      008ADE 32 21                 2161         .ascii     "2!"
      008AE0                       2162 DSTOR:
                           000001  2163 .if CONVERT_TO_CODE
      008AE0 90 93            [ 1] 2164         ldw y,x 
      008AE2 90 FE            [ 2] 2165         ldw y,(y)
      008AE4 90 BF 24         [ 2] 2166         ldw YTEMP,y ; address 
      008AE7 1C 00 02         [ 2] 2167         addw x,#CELLL ; drop a 
      008AEA 90 93            [ 1] 2168         ldw y,x 
      008AEC 90 FE            [ 2] 2169         ldw y,(y) ; hi word 
      008AEE 89               [ 2] 2170         pushw x 
      008AEF EE 02            [ 2] 2171         ldw x,(2,x) ; lo word 
      008AF1 91 CF 24         [ 5] 2172         ldw [YTEMP],y
      008AF4 90 93            [ 1] 2173         ldw y,x 
      008AF6 AE 00 02         [ 2] 2174         ldw x,#2 
      008AF9 92 DF 24         [ 5] 2175         ldw ([YTEMP],x),y 
      008AFC 85               [ 2] 2176         popw x 
      008AFD 1C 00 04         [ 2] 2177         addw x,#4 ; DDROP 
      008B00 81               [ 4] 2178         ret 
                           000000  2179 .else
                                   2180         CALL	SWAPP
                                   2181         CALL	OVER
                                   2182         CALL	STORE
                                   2183         CALL	CELLP
                                   2184         JP	STORE
                                   2185 .endif 
                                   2186 ;       2@      ( a -- d )
                                   2187 ;       Fetch double integer from address a.
      008B01 8A DD                 2188         .word      LINK
                           000A83  2189 LINK = . 
      008B03 02                    2190         .byte      2
      008B04 32 40                 2191         .ascii     "2@"
      008B06                       2192 DAT:
                           000001  2193 .if CONVERT_TO_CODE
      008B06 90 93            [ 1] 2194         ldw y,x 
      008B08 90 FE            [ 2] 2195         ldw y,(y) ;address 
      008B0A 90 BF 24         [ 2] 2196         ldw YTEMP,y 
      008B0D 1D 00 02         [ 2] 2197         subw x,#CELLL ; space for udh 
      008B10 91 CE 24         [ 5] 2198         ldw y,[YTEMP] ; udh 
      008B13 FF               [ 2] 2199         ldw (x),y 
      008B14 90 AE 00 02      [ 2] 2200         ldw y,#2
      008B18 91 DE 24         [ 5] 2201         ldw y,([YTEMP],y) ; udl 
      008B1B EF 02            [ 2] 2202         ldw (2,x),y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



      008B1D 81               [ 4] 2203         ret 
                           000000  2204 .else 
                                   2205         CALL	DUPP
                                   2206         CALL	CELLP
                                   2207         CALL	AT
                                   2208         CALL	SWAPP
                                   2209         JP	AT
                                   2210 .endif 
                                   2211 
                                   2212 ;       COUNT   ( b -- b +n )
                                   2213 ;       Return count byte of a string
                                   2214 ;       and add 1 to byte address.
      008B1E 8B 03                 2215         .word      LINK
                           000AA0  2216 LINK = . 
      008B20 05                    2217         .byte      5
      008B21 43 4F 55 4E 54        2218         .ascii     "COUNT"
      008B26                       2219 COUNT:
                           000001  2220 .if CONVERT_TO_CODE
      008B26 90 93            [ 1] 2221         ldw y,x 
      008B28 90 FE            [ 2] 2222         ldw y,(y) ; address 
      008B2A 90 F6            [ 1] 2223         ld a,(y)  ; count 
      008B2C 90 5C            [ 2] 2224         incw y 
      008B2E FF               [ 2] 2225         ldw (x),y 
      008B2F 1D 00 02         [ 2] 2226         subw x,#CELLL 
      008B32 E7 01            [ 1] 2227         ld (1,x),a 
      008B34 7F               [ 1] 2228         clr (x)
      008B35 81               [ 4] 2229         ret 
                           000000  2230 .else 
                                   2231         CALL     DUPP
                                   2232         CALL     ONEP
                                   2233         CALL     SWAPP
                                   2234         JP     CAT
                                   2235 .endif 
                                   2236 
                                   2237 ;       HERE    ( -- a )
                                   2238 ;       Return  top of  variables
      008B36 8B 20                 2239         .word      LINK
                           000AB8  2240 LINK = . 
      008B38 04                    2241         .byte      4
      008B39 48 45 52 45           2242         .ascii     "HERE"
      008B3D                       2243 HERE:
                           000001  2244 .if CONVERT_TO_CODE
      008B3D 90 AE 00 16      [ 2] 2245       	ldw y,#UVP 
      008B41 90 FE            [ 2] 2246         ldw y,(y)
      008B43 1D 00 02         [ 2] 2247         subw x,#CELLL 
      008B46 FF               [ 2] 2248         ldw (x),y 
      008B47 81               [ 4] 2249         ret 
                           000000  2250 .else
                                   2251         CALL     VPP
                                   2252         JP     AT
                                   2253 .endif 
                                   2254 
                                   2255 ;       PAD     ( -- a )
                                   2256 ;       Return address of text buffer
                                   2257 ;       above  code dictionary.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



      008B48 8B 38                 2258         .word      LINK
                           000ACA  2259 LINK = . 
      008B4A 03                    2260         .byte      3
      008B4B 50 41 44              2261         .ascii     "PAD"
      008B4E                       2262 PAD:
      008B4E CD 8B 3D         [ 4] 2263         CALL     HERE
      008B51 CD 83 D9         [ 4] 2264         CALL     DOLIT
      008B54 00 50                 2265         .word      80
      008B56 CC 87 03         [ 2] 2266         JP     PLUS
                                   2267 
                                   2268 ;       TIB     ( -- a )
                                   2269 ;       Return address of terminal input buffer.
      008B59 8B 4A                 2270         .word      LINK
                           000ADB  2271 LINK = . 
      008B5B 03                    2272         .byte      3
      008B5C 54 49 42              2273         .ascii     "TIB"
      008B5F                       2274 TIB:
      008B5F CD 85 F3         [ 4] 2275         CALL     NTIB
      008B62 CD 89 B7         [ 4] 2276         CALL     CELLP
      008B65 CC 84 61         [ 2] 2277         JP     AT
                                   2278 
                                   2279 ;       @EXECUTE        ( a -- )
                                   2280 ;       Execute vector stored in address a.
      008B68 8B 5B                 2281         .word      LINK
                           000AEA  2282 LINK = . 
      008B6A 08                    2283         .byte      8
      008B6B 40 45 58 45 43 55 54  2284         .ascii     "@EXECUTE"
             45
      008B73                       2285 ATEXE:
      008B73 CD 84 61         [ 4] 2286         CALL     AT
      008B76 CD 86 B2         [ 4] 2287         CALL     QDUP    ;?address or zero
      008B79 CD 84 0C         [ 4] 2288         CALL     QBRAN
      008B7C 8B 81                 2289         .word      EXE1
      008B7E CD 84 33         [ 4] 2290         CALL     EXECU   ;execute if non-zero
      008B81 81               [ 4] 2291 EXE1:   RET     ;do nothing if zero
                                   2292 
                                   2293 ;       CMOVE   ( b1 b2 u -- )
                                   2294 ;       Copy u bytes from b1 to b2.
      008B82 8B 6A                 2295         .word      LINK
                           000B04  2296 LINK = . 
      008B84 05                    2297         .byte      5
      008B85 43 4D 4F 56 45        2298         .ascii     "CMOVE"
      008B8A                       2299 CMOVE:
      008B8A CD 84 D1         [ 4] 2300         CALL	TOR
      008B8D CD 84 23         [ 4] 2301         CALL	BRAN
      008B90 8B AA                 2302         .word	CMOV2
      008B92 CD 84 D1         [ 4] 2303 CMOV1:	CALL	TOR
      008B95 CD 85 08         [ 4] 2304         CALL	DUPP
      008B98 CD 84 7F         [ 4] 2305         CALL	CAT
      008B9B CD 84 C5         [ 4] 2306         CALL	RAT
      008B9E CD 84 6E         [ 4] 2307         CALL	CSTOR
      008BA1 CD 89 E2         [ 4] 2308         CALL	ONEP
      008BA4 CD 84 B2         [ 4] 2309         CALL	RFROM
      008BA7 CD 89 E2         [ 4] 2310         CALL	ONEP
      008BAA CD 83 ED         [ 4] 2311 CMOV2:	CALL	DONXT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



      008BAD 8B 92                 2312         .word	CMOV1
      008BAF CC 86 E3         [ 2] 2313         JP	DDROP
                                   2314 
                                   2315 ;       FILL    ( b u c -- )
                                   2316 ;       Fill u bytes of character c
                                   2317 ;       to area beginning at b.
      008BB2 8B 84                 2318         .word       LINK
                           000B34  2319 LINK = . 
      008BB4 04                    2320         .byte       4
      008BB5 46 49 4C 4C           2321         .ascii     "FILL"
      008BB9                       2322 FILL:
                           000001  2323 .if CONVERT_TO_CODE
      008BB9 90 93            [ 1] 2324         ldw y,x 
      008BBB 90 E6 01         [ 1] 2325         ld a,(1,y) ; c 
      008BBE 1C 00 02         [ 2] 2326         addw x,#CELLL ; drop c 
      008BC1 90 93            [ 1] 2327         ldw y,x 
      008BC3 90 FE            [ 2] 2328         ldw y,(y) ; count
      008BC5 90 89            [ 2] 2329         pushw y 
      008BC7 1C 00 02         [ 2] 2330         addw x,#CELLL ; drop u 
      008BCA 90 93            [ 1] 2331         ldw y,x 
      008BCC 1C 00 02         [ 2] 2332         addw x,#CELLL ; drop b 
      008BCF 90 FE            [ 2] 2333         ldw y,(y) ; address
      008BD1 90 BF 24         [ 2] 2334         ldw YTEMP,y
      008BD4 90 85            [ 2] 2335         popw y ; count 
      008BD6                       2336 FILL1:  
      008BD6 92 C7 24         [ 4] 2337         ld [YTEMP],a 
      008BD9 3C 25            [ 1] 2338         inc YTEMP+1
      008BDB 24 02            [ 1] 2339         jrnc FILL2 
      008BDD 3C 24            [ 1] 2340         inc YTEMP
      008BDF                       2341 FILL2: 
      008BDF 90 5A            [ 2] 2342         decw y ; count 
      008BE1 26 F3            [ 1] 2343         jrne FILL1  
      008BE3 81               [ 4] 2344         ret 
                           000000  2345 .else 
                                   2346         CALL	SWAPP
                                   2347         CALL	TOR
                                   2348         CALL	SWAPP
                                   2349         CALL	BRAN
                                   2350         .word	FILL2
                                   2351 FILL1:	CALL	DDUP
                                   2352         CALL	CSTOR
                                   2353         CALL	ONEP
                                   2354 FILL2:	CALL	DONXT
                                   2355         .word	FILL1
                                   2356         JP	DDROP
                                   2357 .endif
                                   2358 
                                   2359 ;       ERASE   ( b u -- )
                                   2360 ;       Erase u bytes beginning at b.
      008BE4 8B B4                 2361         .word      LINK
                           000B66  2362 LINK = . 
      008BE6 05                    2363         .byte      5
      008BE7 45 52 41 53 45        2364         .ascii     "ERASE"
      008BEC                       2365 ERASE:
                           000001  2366 .if CONVERT_TO_CODE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



      008BEC 90 5F            [ 1] 2367         clrw y 
      008BEE 1D 00 02         [ 2] 2368         subw x,#CELLL 
      008BF1 FF               [ 2] 2369         ldw (x),y 
      008BF2 CC 8B B9         [ 2] 2370         jp FILL 
                           000000  2371 .else 
                                   2372         CALL     ZERO
                                   2373         JP     FILL
                                   2374 .endif 
                                   2375 ;       PACK0x   ( b u a -- a )
                                   2376 ;       Build a counted string with
                                   2377 ;       u characters from b. Null fill.
      008BF5 8B E6                 2378         .word      LINK
                           000B77  2379 LINK = . 
      008BF7 05                    2380         .byte      5
      008BF8 50 41 43 4B 30 58     2381         .ascii     "PACK0X"
      008BFE                       2382 PACKS:
      008BFE CD 85 08         [ 4] 2383         CALL     DUPP
      008C01 CD 84 D1         [ 4] 2384         CALL     TOR     ;strings only on cell boundary
      008C04 CD 86 EE         [ 4] 2385         CALL     DDUP
      008C07 CD 84 6E         [ 4] 2386         CALL     CSTOR
      008C0A CD 89 E2         [ 4] 2387         CALL     ONEP ;save count
      008C0D CD 85 18         [ 4] 2388         CALL     SWAPP
      008C10 CD 8B 8A         [ 4] 2389         CALL     CMOVE
      008C13 CD 84 B2         [ 4] 2390         CALL     RFROM
      008C16 81               [ 4] 2391         RET
                                   2392 
                                   2393 ;; Numeric output, single precision
                                   2394 
                                   2395 ;       DIGIT   ( u -- c )
                                   2396 ;       Convert digit u to a character.
      008C17 8B F7                 2397         .word      LINK
                           000B99  2398 LINK = . 
      008C19 05                    2399         .byte      5
      008C1A 44 49 47 49 54        2400         .ascii     "DIGIT"
      008C1F                       2401 DIGIT:
      008C1F CD 83 D9         [ 4] 2402         CALL	DOLIT
      008C22 00 09                 2403         .word	9
      008C24 CD 85 32         [ 4] 2404         CALL	OVER
      008C27 CD 87 C6         [ 4] 2405         CALL	LESS
      008C2A CD 83 D9         [ 4] 2406         CALL	DOLIT
      008C2D 00 07                 2407         .word	7
      008C2F CD 85 54         [ 4] 2408         CALL	ANDD
      008C32 CD 87 03         [ 4] 2409         CALL	PLUS
      008C35 CD 83 D9         [ 4] 2410         CALL	DOLIT
      008C38 00 30                 2411         .word	48	;'0'
      008C3A CC 87 03         [ 2] 2412         JP	PLUS
                                   2413 
                                   2414 ;       EXTRACT ( n base -- n c )
                                   2415 ;       Extract least significant digit from n.
      008C3D 8C 19                 2416         .word      LINK
                           000BBF  2417 LINK = . 
      008C3F 07                    2418         .byte      7
      008C40 45 58 54 52 41 43 54  2419         .ascii     "EXTRACT"
      008C47                       2420 EXTRC:
      008C47 CD 8A 4E         [ 4] 2421         CALL     ZERO
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      008C4A CD 85 18         [ 4] 2422         CALL     SWAPP
      008C4D CD 88 3E         [ 4] 2423         CALL     UMMOD
      008C50 CD 85 18         [ 4] 2424         CALL     SWAPP
      008C53 CC 8C 1F         [ 2] 2425         JP     DIGIT
                                   2426 
                                   2427 ;       <#      ( -- )
                                   2428 ;       Initiate  numeric output process.
      008C56 8C 3F                 2429         .word      LINK
                           000BD8  2430 LINK = . 
      008C58 02                    2431         .byte      2
      008C59 3C 23                 2432         .ascii     "<#"
      008C5B                       2433 BDIGS:
      008C5B CD 8B 4E         [ 4] 2434         CALL     PAD
      008C5E CD 86 35         [ 4] 2435         CALL     HLD
      008C61 CC 84 4A         [ 2] 2436         JP     STORE
                                   2437 
                                   2438 ;       HOLD    ( c -- )
                                   2439 ;       Insert a character into output string.
      008C64 8C 58                 2440         .word      LINK
                           000BE6  2441 LINK = . 
      008C66 04                    2442         .byte      4
      008C67 48 4F 4C 44           2443         .ascii     "HOLD"
      008C6B                       2444 HOLD:
      008C6B CD 86 35         [ 4] 2445         CALL     HLD
      008C6E CD 84 61         [ 4] 2446         CALL     AT
      008C71 CD 89 EF         [ 4] 2447         CALL     ONEM
      008C74 CD 85 08         [ 4] 2448         CALL     DUPP
      008C77 CD 86 35         [ 4] 2449         CALL     HLD
      008C7A CD 84 4A         [ 4] 2450         CALL     STORE
      008C7D CC 84 6E         [ 2] 2451         JP     CSTOR
                                   2452 
                                   2453 ;       #       ( u -- u )
                                   2454 ;       Extract one digit from u and
                                   2455 ;       append digit to output string.
      008C80 8C 66                 2456         .word      LINK
                           000C02  2457 LINK = . 
      008C82 01                    2458         .byte      1
      008C83 23                    2459         .ascii     "#"
      008C84                       2460 DIG:
      008C84 CD 85 C5         [ 4] 2461         CALL     BASE
      008C87 CD 84 61         [ 4] 2462         CALL     AT
      008C8A CD 8C 47         [ 4] 2463         CALL     EXTRC
      008C8D CC 8C 6B         [ 2] 2464         JP     HOLD
                                   2465 
                                   2466 ;       #S      ( u -- 0 )
                                   2467 ;       Convert u until all digits
                                   2468 ;       are added to output string.
      008C90 8C 82                 2469         .word      LINK
                           000C12  2470 LINK = . 
      008C92 02                    2471         .byte      2
      008C93 23 53                 2472         .ascii     "#S"
      008C95                       2473 DIGS:
      008C95 CD 8C 84         [ 4] 2474 DIGS1:  CALL     DIG
      008C98 CD 85 08         [ 4] 2475         CALL     DUPP
      008C9B CD 84 0C         [ 4] 2476         CALL     QBRAN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      008C9E 8C A2                 2477         .word      DIGS2
      008CA0 20 F3            [ 2] 2478         JRA     DIGS1
      008CA2 81               [ 4] 2479 DIGS2:  RET
                                   2480 
                                   2481 ;       SIGN    ( n -- )
                                   2482 ;       Add a minus sign to
                                   2483 ;       numeric output string.
      008CA3 8C 92                 2484         .word      LINK
                           000C25  2485 LINK = . 
      008CA5 04                    2486         .byte      4
      008CA6 53 49 47 4E           2487         .ascii     "SIGN"
      008CAA                       2488 SIGN:
      008CAA CD 85 41         [ 4] 2489         CALL     ZLESS
      008CAD CD 84 0C         [ 4] 2490         CALL     QBRAN
      008CB0 8C BA                 2491         .word      SIGN1
      008CB2 CD 83 D9         [ 4] 2492         CALL     DOLIT
      008CB5 00 2D                 2493         .word      45	;"-"
      008CB7 CC 8C 6B         [ 2] 2494         JP     HOLD
      008CBA 81               [ 4] 2495 SIGN1:  RET
                                   2496 
                                   2497 ;       #>      ( w -- b u )
                                   2498 ;       Prepare output string.
      008CBB 8C A5                 2499         .word      LINK
                           000C3D  2500 LINK = . 
      008CBD 02                    2501         .byte      2
      008CBE 23 3E                 2502         .ascii     "#>"
      008CC0                       2503 EDIGS:
      008CC0 CD 84 FE         [ 4] 2504         CALL     DROP
      008CC3 CD 86 35         [ 4] 2505         CALL     HLD
      008CC6 CD 84 61         [ 4] 2506         CALL     AT
      008CC9 CD 8B 4E         [ 4] 2507         CALL     PAD
      008CCC CD 85 32         [ 4] 2508         CALL     OVER
      008CCF CC 87 61         [ 2] 2509         JP     SUBB
                                   2510 
                                   2511 ;       str     ( w -- b u )
                                   2512 ;       Convert a signed integer
                                   2513 ;       to a numeric string.
      008CD2 8C BD                 2514         .word      LINK
                           000C54  2515 LINK = . 
      008CD4 03                    2516         .byte      3
      008CD5 53 54 52              2517         .ascii     "STR"
      008CD8                       2518 STR:
      008CD8 CD 85 08         [ 4] 2519         CALL     DUPP
      008CDB CD 84 D1         [ 4] 2520         CALL     TOR
      008CDE CD 87 7B         [ 4] 2521         CALL     ABSS
      008CE1 CD 8C 5B         [ 4] 2522         CALL     BDIGS
      008CE4 CD 8C 95         [ 4] 2523         CALL     DIGS
      008CE7 CD 84 B2         [ 4] 2524         CALL     RFROM
      008CEA CD 8C AA         [ 4] 2525         CALL     SIGN
      008CED CC 8C C0         [ 2] 2526         JP     EDIGS
                                   2527 
                                   2528 ;       HEX     ( -- )
                                   2529 ;       Use radix 16 as base for
                                   2530 ;       numeric conversions.
      008CF0 8C D4                 2531         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



                           000C72  2532 LINK = . 
      008CF2 03                    2533         .byte      3
      008CF3 48 45 58              2534         .ascii     "HEX"
      008CF6                       2535 HEX:
      008CF6 CD 83 D9         [ 4] 2536         CALL     DOLIT
      008CF9 00 10                 2537         .word      16
      008CFB CD 85 C5         [ 4] 2538         CALL     BASE
      008CFE CC 84 4A         [ 2] 2539         JP     STORE
                                   2540 
                                   2541 ;       DECIMAL ( -- )
                                   2542 ;       Use radix 10 as base
                                   2543 ;       for numeric conversions.
      008D01 8C F2                 2544         .word      LINK
                           000C83  2545 LINK = . 
      008D03 07                    2546         .byte      7
      008D04 44 45 43 49 4D 41 4C  2547         .ascii     "DECIMAL"
      008D0B                       2548 DECIM:
      008D0B CD 83 D9         [ 4] 2549         CALL     DOLIT
      008D0E 00 0A                 2550         .word      10
      008D10 CD 85 C5         [ 4] 2551         CALL     BASE
      008D13 CC 84 4A         [ 2] 2552         JP     STORE
                                   2553 
                                   2554 ;; Numeric input, single precision
                                   2555 
                                   2556 ;       DIGIT?  ( c base -- u t )
                                   2557 ;       Convert a character to its numeric
                                   2558 ;       value. A flag indicates success.
      008D16 8D 03                 2559         .word      LINK
                           000C98  2560 LINK = . 
      008D18 06                    2561         .byte       6
      008D19 44 49 47 49 54 3F     2562         .ascii     "DIGIT?"
      008D1F                       2563 DIGTQ:
      008D1F CD 84 D1         [ 4] 2564         CALL     TOR
      008D22 CD 83 D9         [ 4] 2565         CALL     DOLIT
      008D25 00 30                 2566         .word     48	; "0"
      008D27 CD 87 61         [ 4] 2567         CALL     SUBB
      008D2A CD 83 D9         [ 4] 2568         CALL     DOLIT
      008D2D 00 09                 2569         .word      9
      008D2F CD 85 32         [ 4] 2570         CALL     OVER
      008D32 CD 87 C6         [ 4] 2571         CALL     LESS
      008D35 CD 84 0C         [ 4] 2572         CALL     QBRAN
      008D38 8D 50                 2573         .word      DGTQ1
      008D3A CD 83 D9         [ 4] 2574         CALL     DOLIT
      008D3D 00 07                 2575         .word      7
      008D3F CD 87 61         [ 4] 2576         CALL     SUBB
      008D42 CD 85 08         [ 4] 2577         CALL     DUPP
      008D45 CD 83 D9         [ 4] 2578         CALL     DOLIT
      008D48 00 0A                 2579         .word      10
      008D4A CD 87 C6         [ 4] 2580         CALL     LESS
      008D4D CD 85 68         [ 4] 2581         CALL     ORR
      008D50 CD 85 08         [ 4] 2582 DGTQ1:  CALL     DUPP
      008D53 CD 84 B2         [ 4] 2583         CALL     RFROM
      008D56 CC 87 A8         [ 2] 2584         JP     ULESS
                                   2585 
                                   2586 ;       NUMBER? ( a -- n T | a F )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



                                   2587 ;       Convert a number string to
                                   2588 ;       integer. Push a flag on tos.
      008D59 8D 18                 2589         .word      LINK
                           000CDB  2590 LINK = . 
      008D5B 07                    2591         .byte      7
      008D5C 4E 55 4D 42 45 52 3F  2592         .ascii     "NUMBER?"
      008D63                       2593 NUMBQ:
      008D63 CD 85 C5         [ 4] 2594         CALL     BASE
      008D66 CD 84 61         [ 4] 2595         CALL     AT
      008D69 CD 84 D1         [ 4] 2596         CALL     TOR
      008D6C CD 8A 4E         [ 4] 2597         CALL     ZERO
      008D6F CD 85 32         [ 4] 2598         CALL     OVER
      008D72 CD 8B 26         [ 4] 2599         CALL     COUNT
      008D75 CD 85 32         [ 4] 2600         CALL     OVER
      008D78 CD 84 7F         [ 4] 2601         CALL     CAT
      008D7B CD 83 D9         [ 4] 2602         CALL     DOLIT
      008D7E 00 24                 2603         .word     36	; "0x"
      008D80 CD 87 89         [ 4] 2604         CALL     EQUAL
      008D83 CD 84 0C         [ 4] 2605         CALL     QBRAN
      008D86 8D 97                 2606         .word      NUMQ1
      008D88 CD 8C F6         [ 4] 2607         CALL     HEX
      008D8B CD 85 18         [ 4] 2608         CALL     SWAPP
      008D8E CD 89 E2         [ 4] 2609         CALL     ONEP
      008D91 CD 85 18         [ 4] 2610         CALL     SWAPP
      008D94 CD 89 EF         [ 4] 2611         CALL     ONEM
      008D97 CD 85 32         [ 4] 2612 NUMQ1:  CALL     OVER
      008D9A CD 84 7F         [ 4] 2613         CALL     CAT
      008D9D CD 83 D9         [ 4] 2614         CALL     DOLIT
      008DA0 00 2D                 2615         .word     45	; "-"
      008DA2 CD 87 89         [ 4] 2616         CALL     EQUAL
      008DA5 CD 84 D1         [ 4] 2617         CALL     TOR
      008DA8 CD 85 18         [ 4] 2618         CALL     SWAPP
      008DAB CD 84 C5         [ 4] 2619         CALL     RAT
      008DAE CD 87 61         [ 4] 2620         CALL     SUBB
      008DB1 CD 85 18         [ 4] 2621         CALL     SWAPP
      008DB4 CD 84 C5         [ 4] 2622         CALL     RAT
      008DB7 CD 87 03         [ 4] 2623         CALL     PLUS
      008DBA CD 86 B2         [ 4] 2624         CALL     QDUP
      008DBD CD 84 0C         [ 4] 2625         CALL     QBRAN
      008DC0 8E 21                 2626         .word      NUMQ6
      008DC2 CD 89 EF         [ 4] 2627         CALL     ONEM
      008DC5 CD 84 D1         [ 4] 2628         CALL     TOR
      008DC8 CD 85 08         [ 4] 2629 NUMQ2:  CALL     DUPP
      008DCB CD 84 D1         [ 4] 2630         CALL     TOR
      008DCE CD 84 7F         [ 4] 2631         CALL     CAT
      008DD1 CD 85 C5         [ 4] 2632         CALL     BASE
      008DD4 CD 84 61         [ 4] 2633         CALL     AT
      008DD7 CD 8D 1F         [ 4] 2634         CALL     DIGTQ
      008DDA CD 84 0C         [ 4] 2635         CALL     QBRAN
      008DDD 8E 0F                 2636         .word      NUMQ4
      008DDF CD 85 18         [ 4] 2637         CALL     SWAPP
      008DE2 CD 85 C5         [ 4] 2638         CALL     BASE
      008DE5 CD 84 61         [ 4] 2639         CALL     AT
      008DE8 CD 89 61         [ 4] 2640         CALL     STAR
      008DEB CD 87 03         [ 4] 2641         CALL     PLUS
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



      008DEE CD 84 B2         [ 4] 2642         CALL     RFROM
      008DF1 CD 89 E2         [ 4] 2643         CALL     ONEP
      008DF4 CD 83 ED         [ 4] 2644         CALL     DONXT
      008DF7 8D C8                 2645         .word      NUMQ2
      008DF9 CD 84 C5         [ 4] 2646         CALL     RAT
      008DFC CD 85 18         [ 4] 2647         CALL     SWAPP
      008DFF CD 84 FE         [ 4] 2648         CALL     DROP
      008E02 CD 84 0C         [ 4] 2649         CALL     QBRAN
      008E05 8E 0A                 2650         .word      NUMQ3
      008E07 CD 87 2E         [ 4] 2651         CALL     NEGAT
      008E0A CD 85 18         [ 4] 2652 NUMQ3:  CALL     SWAPP
      008E0D 20 0F            [ 2] 2653         JRA     NUMQ5
      008E0F CD 84 B2         [ 4] 2654 NUMQ4:  CALL     RFROM
      008E12 CD 84 B2         [ 4] 2655         CALL     RFROM
      008E15 CD 86 E3         [ 4] 2656         CALL     DDROP
      008E18 CD 86 E3         [ 4] 2657         CALL     DDROP
      008E1B CD 8A 4E         [ 4] 2658         CALL     ZERO
      008E1E CD 85 08         [ 4] 2659 NUMQ5:  CALL     DUPP
      008E21 CD 84 B2         [ 4] 2660 NUMQ6:  CALL     RFROM
      008E24 CD 86 E3         [ 4] 2661         CALL     DDROP
      008E27 CD 84 B2         [ 4] 2662         CALL     RFROM
      008E2A CD 85 C5         [ 4] 2663         CALL     BASE
      008E2D CC 84 4A         [ 2] 2664         JP     STORE
                                   2665 
                                   2666 ;; Basic I/O
                                   2667 
                                   2668 ;       KEY     ( -- c )
                                   2669 ;       Wait for and return an
                                   2670 ;       input character.
      008E30 8D 5B                 2671         .word      LINK
                           000DB2  2672 LINK = . 
      008E32 03                    2673         .byte      3
      008E33 4B 45 59              2674         .ascii     "KEY"
      008E36                       2675 KEY:
                           000001  2676 .if CONVERT_TO_CODE
      008E36 72 0B 52 30 FB   [ 2] 2677         btjf UART1_SR,#UART_SR_RXNE,. 
      008E3B C6 52 31         [ 1] 2678         ld a,UART1_DR 
      008E3E 1D 00 02         [ 2] 2679         subw x,#CELLL 
      008E41 E7 01            [ 1] 2680         ld (1,x),a 
      008E43 7F               [ 1] 2681         clr (x)
      008E44 81               [ 4] 2682         ret 
                           000000  2683 .else 
                                   2684 KEY1:   CALL     QKEY
                                   2685         CALL     QBRAN
                                   2686         .word      KEY1
                                   2687         RET
                                   2688 .endif 
                                   2689 
                                   2690 ;       NUF?    ( -- t )
                                   2691 ;       Return false if no input,
                                   2692 ;       else pause and if CR return true.
      008E45 8E 32                 2693         .word      LINK
                           000DC7  2694 LINK = . 
      008E47 04                    2695         .byte      4
      008E48 4E 55 46 3F           2696         .ascii     "NUF?"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



      008E4C                       2697 NUFQ:
      008E4C CD 83 A5         [ 4] 2698         CALL     QKEY
      008E4F CD 85 08         [ 4] 2699         CALL     DUPP
      008E52 CD 84 0C         [ 4] 2700         CALL     QBRAN
      008E55 8E 65                 2701         .word    NUFQ1
      008E57 CD 86 E3         [ 4] 2702         CALL     DDROP
      008E5A CD 8E 36         [ 4] 2703         CALL     KEY
      008E5D CD 83 D9         [ 4] 2704         CALL     DOLIT
      008E60 00 0D                 2705         .word      CRR
      008E62 CC 87 89         [ 2] 2706         JP     EQUAL
      008E65 81               [ 4] 2707 NUFQ1:  RET
                                   2708 
                                   2709 ;       SPACE   ( -- )
                                   2710 ;       Send  blank character to
                                   2711 ;       output device.
      008E66 8E 47                 2712         .word      LINK
                           000DE8  2713 LINK = . 
      008E68 05                    2714         .byte      5
      008E69 53 50 41 43 45        2715         .ascii     "SPACE"
      008E6E                       2716 SPACE:
      008E6E CD 8A 41         [ 4] 2717         CALL     BLANK
      008E71 CC 83 C3         [ 2] 2718         JP     EMIT
                                   2719 
                                   2720 ;       SPACES  ( +n -- )
                                   2721 ;       Send n spaces to output device.
      008E74 8E 68                 2722         .word      LINK
                           000DF6  2723 LINK = . 
      008E76 06                    2724         .byte      6
      008E77 53 50 41 43 45 53     2725         .ascii     "SPACES"
      008E7D                       2726 SPACS:
      008E7D CD 8A 4E         [ 4] 2727         CALL     ZERO
      008E80 CD 87 E6         [ 4] 2728         CALL     MAX
      008E83 CD 84 D1         [ 4] 2729         CALL     TOR
      008E86 20 03            [ 2] 2730         JRA      CHAR2
      008E88 CD 8E 6E         [ 4] 2731 CHAR1:  CALL     SPACE
      008E8B CD 83 ED         [ 4] 2732 CHAR2:  CALL     DONXT
      008E8E 8E 88                 2733         .word    CHAR1
      008E90 81               [ 4] 2734         RET
                                   2735 
                                   2736 ;       TYPE    ( b u -- )
                                   2737 ;       Output u characters from b.
      008E91 8E 76                 2738         .word      LINK
                           000E13  2739 LINK = . 
      008E93 04                    2740         .byte      4
      008E94 54 59 50 45           2741         .ascii     "TYPE"
      008E98                       2742 TYPES:
      008E98 CD 84 D1         [ 4] 2743         CALL     TOR
      008E9B 20 0C            [ 2] 2744         JRA     TYPE2
      008E9D CD 85 08         [ 4] 2745 TYPE1:  CALL     DUPP
      008EA0 CD 84 7F         [ 4] 2746         CALL     CAT
      008EA3 CD 83 C3         [ 4] 2747         CALL     EMIT
      008EA6 CD 89 E2         [ 4] 2748         CALL     ONEP
      008EA9 CD 83 ED         [ 4] 2749 TYPE2:  CALL     DONXT
      008EAC 8E 9D                 2750         .word      TYPE1
      008EAE CC 84 FE         [ 2] 2751         JP     DROP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



                                   2752 
                                   2753 ;       CR      ( -- )
                                   2754 ;       Output a carriage return
                                   2755 ;       and a line feed.
      008EB1 8E 93                 2756         .word      LINK
                           000E33  2757 LINK = . 
      008EB3 02                    2758         .byte      2
      008EB4 43 52                 2759         .ascii     "CR"
      008EB6                       2760 CR:
      008EB6 CD 83 D9         [ 4] 2761         CALL     DOLIT
      008EB9 00 0D                 2762         .word      CRR
      008EBB CD 83 C3         [ 4] 2763         CALL     EMIT
      008EBE CD 83 D9         [ 4] 2764         CALL     DOLIT
      008EC1 00 0A                 2765         .word      LF
      008EC3 CC 83 C3         [ 2] 2766         JP     EMIT
                                   2767 
                                   2768 ;       do$     ( -- a )
                                   2769 ;       Return  address of a compiled
                                   2770 ;       string.
      008EC6 8E B3                 2771         .word      LINK
                           000E48  2772 LINK = . 
      008EC8 43                    2773 	.byte      COMPO+3
      008EC9 44 4F 24              2774         .ascii     "DO$"
      008ECC                       2775 DOSTR:
      008ECC CD 84 B2         [ 4] 2776         CALL     RFROM
      008ECF CD 84 C5         [ 4] 2777         CALL     RAT
      008ED2 CD 84 B2         [ 4] 2778         CALL     RFROM
      008ED5 CD 8B 26         [ 4] 2779         CALL     COUNT
      008ED8 CD 87 03         [ 4] 2780         CALL     PLUS
      008EDB CD 84 D1         [ 4] 2781         CALL     TOR
      008EDE CD 85 18         [ 4] 2782         CALL     SWAPP
      008EE1 CD 84 D1         [ 4] 2783         CALL     TOR
      008EE4 81               [ 4] 2784         RET
                                   2785 
                                   2786 ;       $"|     ( -- a )
                                   2787 ;       Run time routine compiled by $".
                                   2788 ;       Return address of a compiled string.
      008EE5 8E C8                 2789         .word      LINK
                           000E67  2790 LINK = . 
      008EE7 43                    2791 	.byte      COMPO+3
      008EE8 24 22 7C              2792         .byte     '$','"','|'
      008EEB                       2793 STRQP:
      008EEB CD 8E CC         [ 4] 2794         CALL     DOSTR
      008EEE 81               [ 4] 2795         RET
                                   2796 
                                   2797 ;       ."|     ( -- )
                                   2798 ;       Run time routine of ." .
                                   2799 ;       Output a compiled string.
      008EEF 8E E7                 2800         .word      LINK
                           000E71  2801 LINK = . 
      008EF1 43                    2802 	.byte      COMPO+3
      008EF2 2E 22 7C              2803         .byte     '.','"','|'
      008EF5                       2804 DOTQP:
      008EF5 CD 8E CC         [ 4] 2805         CALL     DOSTR
      008EF8 CD 8B 26         [ 4] 2806         CALL     COUNT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



      008EFB CC 8E 98         [ 2] 2807         JP     TYPES
                                   2808 
                                   2809 ;       .R      ( n +n -- )
                                   2810 ;       Display an integer in a field
                                   2811 ;       of n columns, right justified.
      008EFE 8E F1                 2812         .word      LINK
                           000E80  2813 LINK = . 
      008F00 02                    2814         .byte      2
      008F01 2E 52                 2815         .ascii     ".R"
      008F03                       2816 DOTR:
      008F03 CD 84 D1         [ 4] 2817         CALL     TOR
      008F06 CD 8C D8         [ 4] 2818         CALL     STR
      008F09 CD 84 B2         [ 4] 2819         CALL     RFROM
      008F0C CD 85 32         [ 4] 2820         CALL     OVER
      008F0F CD 87 61         [ 4] 2821         CALL     SUBB
      008F12 CD 8E 7D         [ 4] 2822         CALL     SPACS
      008F15 CC 8E 98         [ 2] 2823         JP     TYPES
                                   2824 
                                   2825 ;       U.R     ( u +n -- )
                                   2826 ;       Display an unsigned integer
                                   2827 ;       in n column, right justified.
      008F18 8F 00                 2828         .word      LINK
                           000E9A  2829 LINK = . 
      008F1A 03                    2830         .byte      3
      008F1B 55 2E 52              2831         .ascii     "U.R"
      008F1E                       2832 UDOTR:
      008F1E CD 84 D1         [ 4] 2833         CALL     TOR
      008F21 CD 8C 5B         [ 4] 2834         CALL     BDIGS
      008F24 CD 8C 95         [ 4] 2835         CALL     DIGS
      008F27 CD 8C C0         [ 4] 2836         CALL     EDIGS
      008F2A CD 84 B2         [ 4] 2837         CALL     RFROM
      008F2D CD 85 32         [ 4] 2838         CALL     OVER
      008F30 CD 87 61         [ 4] 2839         CALL     SUBB
      008F33 CD 8E 7D         [ 4] 2840         CALL     SPACS
      008F36 CC 8E 98         [ 2] 2841         JP     TYPES
                                   2842 
                                   2843 ;       U.      ( u -- )
                                   2844 ;       Display an unsigned integer
                                   2845 ;       in free format.
      008F39 8F 1A                 2846         .word      LINK
                           000EBB  2847 LINK = . 
      008F3B 02                    2848         .byte      2
      008F3C 55 2E                 2849         .ascii     "U."
      008F3E                       2850 UDOT:
      008F3E CD 8C 5B         [ 4] 2851         CALL     BDIGS
      008F41 CD 8C 95         [ 4] 2852         CALL     DIGS
      008F44 CD 8C C0         [ 4] 2853         CALL     EDIGS
      008F47 CD 8E 6E         [ 4] 2854         CALL     SPACE
      008F4A CC 8E 98         [ 2] 2855         JP     TYPES
                                   2856 
                                   2857 ;       .       ( w -- )
                                   2858 ;       Display an integer in free
                                   2859 ;       format, preceeded by a space.
      008F4D 8F 3B                 2860         .word      LINK
                           000ECF  2861 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



      008F4F 01                    2862         .byte      1
      008F50 2E                    2863         .ascii     "."
      008F51                       2864 DOT:
      008F51 CD 85 C5         [ 4] 2865         CALL     BASE
      008F54 CD 84 61         [ 4] 2866         CALL     AT
      008F57 CD 83 D9         [ 4] 2867         CALL     DOLIT
      008F5A 00 0A                 2868         .word      10
      008F5C CD 85 7D         [ 4] 2869         CALL     XORR    ;?decimal
      008F5F CD 84 0C         [ 4] 2870         CALL     QBRAN
      008F62 8F 67                 2871         .word      DOT1
      008F64 CC 8F 3E         [ 2] 2872         JP     UDOT
      008F67 CD 8C D8         [ 4] 2873 DOT1:   CALL     STR
      008F6A CD 8E 6E         [ 4] 2874         CALL     SPACE
      008F6D CC 8E 98         [ 2] 2875         JP     TYPES
                                   2876 
                                   2877 ;       ?       ( a -- )
                                   2878 ;       Display contents in memory cell.
      008F70 8F 4F                 2879         .word      LINK
                                   2880         
                           000EF2  2881 LINK = . 
      008F72 01                    2882         .byte      1
      008F73 3F                    2883         .ascii     "?"
      008F74                       2884 QUEST:
      008F74 CD 84 61         [ 4] 2885         CALL     AT
      008F77 CC 8F 51         [ 2] 2886         JP     DOT
                                   2887 
                                   2888 ;; Parsing
                                   2889 
                                   2890 ;       parse   ( b u c -- b u delta ; <string> )
                                   2891 ;       Scan string delimited by c.
                                   2892 ;       Return found string and its offset.
      008F7A 8F 72                 2893         .word      LINK
                           000EFC  2894 LINK = . 
      008F7C 05                    2895         .byte      5
      008F7D 70 61 72 73 65        2896         .ascii     "parse"
      008F82                       2897 PARS:
      008F82 CD 85 D4         [ 4] 2898         CALL     TEMP
      008F85 CD 84 4A         [ 4] 2899         CALL     STORE
      008F88 CD 85 32         [ 4] 2900         CALL     OVER
      008F8B CD 84 D1         [ 4] 2901         CALL     TOR
      008F8E CD 85 08         [ 4] 2902         CALL     DUPP
      008F91 CD 84 0C         [ 4] 2903         CALL     QBRAN
      008F94 90 3A                 2904         .word    PARS8
      008F96 CD 89 EF         [ 4] 2905         CALL     ONEM
      008F99 CD 85 D4         [ 4] 2906         CALL     TEMP
      008F9C CD 84 61         [ 4] 2907         CALL     AT
      008F9F CD 8A 41         [ 4] 2908         CALL     BLANK
      008FA2 CD 87 89         [ 4] 2909         CALL     EQUAL
      008FA5 CD 84 0C         [ 4] 2910         CALL     QBRAN
      008FA8 8F DB                 2911         .word      PARS3
      008FAA CD 84 D1         [ 4] 2912         CALL     TOR
      008FAD CD 8A 41         [ 4] 2913 PARS1:  CALL     BLANK
      008FB0 CD 85 32         [ 4] 2914         CALL     OVER
      008FB3 CD 84 7F         [ 4] 2915         CALL     CAT     ;skip leading blanks ONLY
      008FB6 CD 87 61         [ 4] 2916         CALL     SUBB
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      008FB9 CD 85 41         [ 4] 2917         CALL     ZLESS
      008FBC CD 87 1D         [ 4] 2918         CALL     INVER
      008FBF CD 84 0C         [ 4] 2919         CALL     QBRAN
      008FC2 8F D8                 2920         .word      PARS2
      008FC4 CD 89 E2         [ 4] 2921         CALL     ONEP
      008FC7 CD 83 ED         [ 4] 2922         CALL     DONXT
      008FCA 8F AD                 2923         .word      PARS1
      008FCC CD 84 B2         [ 4] 2924         CALL     RFROM
      008FCF CD 84 FE         [ 4] 2925         CALL     DROP
      008FD2 CD 8A 4E         [ 4] 2926         CALL     ZERO
      008FD5 CC 85 08         [ 2] 2927         JP     DUPP
      008FD8 CD 84 B2         [ 4] 2928 PARS2:  CALL     RFROM
      008FDB CD 85 32         [ 4] 2929 PARS3:  CALL     OVER
      008FDE CD 85 18         [ 4] 2930         CALL     SWAPP
      008FE1 CD 84 D1         [ 4] 2931         CALL     TOR
      008FE4 CD 85 D4         [ 4] 2932 PARS4:  CALL     TEMP
      008FE7 CD 84 61         [ 4] 2933         CALL     AT
      008FEA CD 85 32         [ 4] 2934         CALL     OVER
      008FED CD 84 7F         [ 4] 2935         CALL     CAT
      008FF0 CD 87 61         [ 4] 2936         CALL     SUBB    ;scan for delimiter
      008FF3 CD 85 D4         [ 4] 2937         CALL     TEMP
      008FF6 CD 84 61         [ 4] 2938         CALL     AT
      008FF9 CD 8A 41         [ 4] 2939         CALL     BLANK
      008FFC CD 87 89         [ 4] 2940         CALL     EQUAL
      008FFF CD 84 0C         [ 4] 2941         CALL     QBRAN
      009002 90 07                 2942         .word      PARS5
      009004 CD 85 41         [ 4] 2943         CALL     ZLESS
      009007 CD 84 0C         [ 4] 2944 PARS5:  CALL     QBRAN
      00900A 90 1C                 2945         .word      PARS6
      00900C CD 89 E2         [ 4] 2946         CALL     ONEP
      00900F CD 83 ED         [ 4] 2947         CALL     DONXT
      009012 8F E4                 2948         .word      PARS4
      009014 CD 85 08         [ 4] 2949         CALL     DUPP
      009017 CD 84 D1         [ 4] 2950         CALL     TOR
      00901A 20 0F            [ 2] 2951         JRA     PARS7
      00901C CD 84 B2         [ 4] 2952 PARS6:  CALL     RFROM
      00901F CD 84 FE         [ 4] 2953         CALL     DROP
      009022 CD 85 08         [ 4] 2954         CALL     DUPP
      009025 CD 89 E2         [ 4] 2955         CALL     ONEP
      009028 CD 84 D1         [ 4] 2956         CALL     TOR
      00902B CD 85 32         [ 4] 2957 PARS7:  CALL     OVER
      00902E CD 87 61         [ 4] 2958         CALL     SUBB
      009031 CD 84 B2         [ 4] 2959         CALL     RFROM
      009034 CD 84 B2         [ 4] 2960         CALL     RFROM
      009037 CC 87 61         [ 2] 2961         JP     SUBB
      00903A CD 85 32         [ 4] 2962 PARS8:  CALL     OVER
      00903D CD 84 B2         [ 4] 2963         CALL     RFROM
      009040 CC 87 61         [ 2] 2964         JP     SUBB
                                   2965 
                                   2966 ;       PARSE   ( c -- b u ; <string> )
                                   2967 ;       Scan input stream and return
                                   2968 ;       counted string delimited by c.
      009043 8F 7C                 2969         .word      LINK
                           000FC5  2970 LINK = . 
      009045 05                    2971         .byte      5
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      009046 50 41 52 53 45        2972         .ascii     "PARSE"
      00904B                       2973 PARSE:
      00904B CD 84 D1         [ 4] 2974         CALL     TOR
      00904E CD 8B 5F         [ 4] 2975         CALL     TIB
      009051 CD 85 E3         [ 4] 2976         CALL     INN
      009054 CD 84 61         [ 4] 2977         CALL     AT
      009057 CD 87 03         [ 4] 2978         CALL     PLUS    ;current input buffer pointer
      00905A CD 85 F3         [ 4] 2979         CALL     NTIB
      00905D CD 84 61         [ 4] 2980         CALL     AT
      009060 CD 85 E3         [ 4] 2981         CALL     INN
      009063 CD 84 61         [ 4] 2982         CALL     AT
      009066 CD 87 61         [ 4] 2983         CALL     SUBB    ;remaining count
      009069 CD 84 B2         [ 4] 2984         CALL     RFROM
      00906C CD 8F 82         [ 4] 2985         CALL     PARS
      00906F CD 85 E3         [ 4] 2986         CALL     INN
      009072 CC 8A BF         [ 2] 2987         JP     PSTOR
                                   2988 
                                   2989 ;       .(      ( -- )
                                   2990 ;       Output following string up to next ) .
      009075 90 45                 2991         .word      LINK
                           000FF7  2992 LINK = . 
      009077 82                    2993 	.byte      IMEDD+2
      009078 2E 28                 2994         .ascii     ".("
      00907A                       2995 DOTPR:
      00907A CD 83 D9         [ 4] 2996         CALL     DOLIT
      00907D 00 29                 2997         .word     41	; ")"
      00907F CD 90 4B         [ 4] 2998         CALL     PARSE
      009082 CC 8E 98         [ 2] 2999         JP     TYPES
                                   3000 
                                   3001 ;       (       ( -- )
                                   3002 ;       Ignore following string up to next ).
                                   3003 ;       A comment.
      009085 90 77                 3004         .word      LINK
                           001007  3005 LINK = . 
      009087 81                    3006 	.byte      IMEDD+1
      009088 28                    3007         .ascii     "("
      009089                       3008 PAREN:
      009089 CD 83 D9         [ 4] 3009         CALL     DOLIT
      00908C 00 29                 3010         .word     41	; ")"
      00908E CD 90 4B         [ 4] 3011         CALL     PARSE
      009091 CC 86 E3         [ 2] 3012         JP     DDROP
                                   3013 
                                   3014 ;       \       ( -- )
                                   3015 ;       Ignore following text till
                                   3016 ;       end of line.
      009094 90 87                 3017         .word      LINK
                           001016  3018 LINK = . 
      009096 81                    3019 	.byte      IMEDD+1
      009097 5C                    3020         .ascii     "\"
      009098                       3021 BKSLA:
                           000001  3022 .if CONVERT_TO_CODE
      009098 90 AE 00 0C      [ 2] 3023         ldw y,#UCTIB ; #TIB  
      00909C 90 FE            [ 2] 3024         ldw y,(y)
      00909E 90 89            [ 2] 3025         pushw y ; count in TIB 
      0090A0 90 AE 00 0A      [ 2] 3026         ldw y,#UINN ; >IN 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      0090A4 90 BF 24         [ 2] 3027         ldw YTEMP,y
      0090A7 90 85            [ 2] 3028         popw y 
      0090A9 91 CF 24         [ 5] 3029         ldw [YTEMP],y
      0090AC 81               [ 4] 3030         ret 
                           000000  3031 .else
                                   3032         CALL     NTIB
                                   3033         CALL     AT
                                   3034         CALL     INN
                                   3035         JP     STORE
                                   3036 .endif 
                                   3037 
                                   3038 ;       WORD    ( c -- a ; <string> )
                                   3039 ;       Parse a word from input stream
                                   3040 ;       and copy it to code dictionary.
      0090AD 90 96                 3041         .word      LINK
                           00102F  3042 LINK = . 
      0090AF 04                    3043         .byte      4
      0090B0 57 4F 52 44           3044         .ascii     "WORD"
      0090B4                       3045 WORDD:
      0090B4 CD 90 4B         [ 4] 3046         CALL     PARSE
      0090B7 CD 8B 3D         [ 4] 3047         CALL     HERE
      0090BA CD 89 B7         [ 4] 3048         CALL     CELLP
      0090BD CC 8B FE         [ 2] 3049         JP     PACKS
                                   3050 
                                   3051 ;       TOKEN   ( -- a ; <string> )
                                   3052 ;       Parse a word from input stream
                                   3053 ;       and copy it to name dictionary.
      0090C0 90 AF                 3054         .word      LINK
                           001042  3055 LINK = . 
      0090C2 05                    3056         .byte      5
      0090C3 54 4F 4B 45 4E        3057         .ascii     "TOKEN"
      0090C8                       3058 TOKEN:
      0090C8 CD 8A 41         [ 4] 3059         CALL     BLANK
      0090CB CC 90 B4         [ 2] 3060         JP     WORDD
                                   3061 
                                   3062 ;; Dictionary search
                                   3063 
                                   3064 ;       NAME>   ( na -- ca )
                                   3065 ;       Return a code address given
                                   3066 ;       a name address.
      0090CE 90 C2                 3067         .word      LINK
                           001050  3068 LINK = . 
      0090D0 05                    3069         .byte      5
      0090D1 4E 41 4D 45 3E        3070         .ascii     "NAME>"
      0090D6                       3071 NAMET:
      0090D6 CD 8B 26         [ 4] 3072         CALL     COUNT
      0090D9 CD 83 D9         [ 4] 3073         CALL     DOLIT
      0090DC 00 1F                 3074         .word      31
      0090DE CD 85 54         [ 4] 3075         CALL     ANDD
      0090E1 CC 87 03         [ 2] 3076         JP     PLUS
                                   3077 
                                   3078 ;       SAME?   ( a a u -- a a f \ -0+ )
                                   3079 ;       Compare u cells in two
                                   3080 ;       strings. Return 0 if identical.
      0090E4 90 D0                 3081         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



                           001066  3082 LINK = . 
      0090E6 05                    3083         .byte       5
      0090E7 53 41 4D 45 3F        3084         .ascii     "SAME?"
      0090EC                       3085 SAMEQ:
      0090EC CD 89 EF         [ 4] 3086         CALL     ONEM
      0090EF CD 84 D1         [ 4] 3087         CALL     TOR
      0090F2 20 29            [ 2] 3088         JRA     SAME2
      0090F4 CD 85 32         [ 4] 3089 SAME1:  CALL     OVER
      0090F7 CD 84 C5         [ 4] 3090         CALL     RAT
      0090FA CD 87 03         [ 4] 3091         CALL     PLUS
      0090FD CD 84 7F         [ 4] 3092         CALL     CAT
      009100 CD 85 32         [ 4] 3093         CALL     OVER
      009103 CD 84 C5         [ 4] 3094         CALL     RAT
      009106 CD 87 03         [ 4] 3095         CALL     PLUS
      009109 CD 84 7F         [ 4] 3096         CALL     CAT
      00910C CD 87 61         [ 4] 3097         CALL     SUBB
      00910F CD 86 B2         [ 4] 3098         CALL     QDUP
      009112 CD 84 0C         [ 4] 3099         CALL     QBRAN
      009115 91 1D                 3100         .word      SAME2
      009117 CD 84 B2         [ 4] 3101         CALL     RFROM
      00911A CC 84 FE         [ 2] 3102         JP     DROP
      00911D CD 83 ED         [ 4] 3103 SAME2:  CALL     DONXT
      009120 90 F4                 3104         .word      SAME1
      009122 CC 8A 4E         [ 2] 3105         JP     ZERO
                                   3106 
                                   3107 ;       find    ( a va -- ca na | a F )
                                   3108 ;       Search vocabulary for string.
                                   3109 ;       Return ca and na if succeeded.
      009125 90 E6                 3110         .word      LINK
                           0010A7  3111 LINK = . 
      009127 04                    3112         .byte      4
      009128 46 49 4E 44           3113         .ascii     "FIND"
      00912C                       3114 FIND:
      00912C CD 85 18         [ 4] 3115         CALL     SWAPP
      00912F CD 85 08         [ 4] 3116         CALL     DUPP
      009132 CD 84 7F         [ 4] 3117         CALL     CAT
      009135 CD 85 D4         [ 4] 3118         CALL     TEMP
      009138 CD 84 4A         [ 4] 3119         CALL     STORE
      00913B CD 85 08         [ 4] 3120         CALL     DUPP
      00913E CD 84 61         [ 4] 3121         CALL     AT
      009141 CD 84 D1         [ 4] 3122         CALL     TOR
      009144 CD 89 B7         [ 4] 3123         CALL     CELLP
      009147 CD 85 18         [ 4] 3124         CALL     SWAPP
      00914A CD 84 61         [ 4] 3125 FIND1:  CALL     AT
      00914D CD 85 08         [ 4] 3126         CALL     DUPP
      009150 CD 84 0C         [ 4] 3127         CALL     QBRAN
      009153 91 89                 3128         .word      FIND6
      009155 CD 85 08         [ 4] 3129         CALL     DUPP
      009158 CD 84 61         [ 4] 3130         CALL     AT
      00915B CD 83 D9         [ 4] 3131         CALL     DOLIT
      00915E 1F 7F                 3132         .word      MASKK
      009160 CD 85 54         [ 4] 3133         CALL     ANDD
      009163 CD 84 C5         [ 4] 3134         CALL     RAT
      009166 CD 85 7D         [ 4] 3135         CALL     XORR
      009169 CD 84 0C         [ 4] 3136         CALL     QBRAN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      00916C 91 78                 3137         .word      FIND2
      00916E CD 89 B7         [ 4] 3138         CALL     CELLP
      009171 CD 83 D9         [ 4] 3139         CALL     DOLIT
      009174 FF FF                 3140         .word     0xFFFF
      009176 20 0C            [ 2] 3141         JRA     FIND3
      009178 CD 89 B7         [ 4] 3142 FIND2:  CALL     CELLP
      00917B CD 85 D4         [ 4] 3143         CALL     TEMP
      00917E CD 84 61         [ 4] 3144         CALL     AT
      009181 CD 90 EC         [ 4] 3145         CALL     SAMEQ
      009184 CD 84 23         [ 4] 3146 FIND3:  CALL     BRAN
      009187 91 98                 3147         .word      FIND4
      009189 CD 84 B2         [ 4] 3148 FIND6:  CALL     RFROM
      00918C CD 84 FE         [ 4] 3149         CALL     DROP
      00918F CD 85 18         [ 4] 3150         CALL     SWAPP
      009192 CD 89 C6         [ 4] 3151         CALL     CELLM
      009195 CC 85 18         [ 2] 3152         JP     SWAPP
      009198 CD 84 0C         [ 4] 3153 FIND4:  CALL     QBRAN
      00919B 91 A5                 3154         .word      FIND5
      00919D CD 89 C6         [ 4] 3155         CALL     CELLM
      0091A0 CD 89 C6         [ 4] 3156         CALL     CELLM
      0091A3 20 A5            [ 2] 3157         JRA     FIND1
      0091A5 CD 84 B2         [ 4] 3158 FIND5:  CALL     RFROM
      0091A8 CD 84 FE         [ 4] 3159         CALL     DROP
      0091AB CD 85 18         [ 4] 3160         CALL     SWAPP
      0091AE CD 84 FE         [ 4] 3161         CALL     DROP
      0091B1 CD 89 C6         [ 4] 3162         CALL     CELLM
      0091B4 CD 85 08         [ 4] 3163         CALL     DUPP
      0091B7 CD 90 D6         [ 4] 3164         CALL     NAMET
      0091BA CC 85 18         [ 2] 3165         JP     SWAPP
                                   3166 
                                   3167 ;       NAME?   ( a -- ca na | a F )
                                   3168 ;       Search vocabularies for a string.
      0091BD 91 27                 3169         .word      LINK
                           00113F  3170 LINK = . 
      0091BF 05                    3171         .byte      5
      0091C0 4E 41 4D 45 3F        3172         .ascii     "NAME?"
      0091C5                       3173 NAMEQ:
      0091C5 CD 86 48         [ 4] 3174         CALL   CNTXT
      0091C8 CC 91 2C         [ 2] 3175         JP     FIND
                                   3176 
                                   3177 ;; Terminal response
                                   3178 
                                   3179 ;       ^H      ( bot eot cur -- bot eot cur )
                                   3180 ;       Backup cursor by one character.
      0091CB 91 BF                 3181         .word      LINK
                           00114D  3182 LINK = . 
      0091CD 02                    3183         .byte      2
      0091CE 5E 48                 3184         .ascii     "^H"
      0091D0                       3185 BKSP:
      0091D0 CD 84 D1         [ 4] 3186         CALL     TOR
      0091D3 CD 85 32         [ 4] 3187         CALL     OVER
      0091D6 CD 84 B2         [ 4] 3188         CALL     RFROM
      0091D9 CD 85 18         [ 4] 3189         CALL     SWAPP
      0091DC CD 85 32         [ 4] 3190         CALL     OVER
      0091DF CD 85 7D         [ 4] 3191         CALL     XORR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



      0091E2 CD 84 0C         [ 4] 3192         CALL     QBRAN
      0091E5 92 00                 3193         .word      BACK1
      0091E7 CD 83 D9         [ 4] 3194         CALL     DOLIT
      0091EA 00 08                 3195         .word      BKSPP
      0091EC CD 83 C3         [ 4] 3196         CALL     EMIT
      0091EF CD 89 EF         [ 4] 3197         CALL     ONEM
      0091F2 CD 8A 41         [ 4] 3198         CALL     BLANK
      0091F5 CD 83 C3         [ 4] 3199         CALL     EMIT
      0091F8 CD 83 D9         [ 4] 3200         CALL     DOLIT
      0091FB 00 08                 3201         .word      BKSPP
      0091FD CC 83 C3         [ 2] 3202         JP     EMIT
      009200 81               [ 4] 3203 BACK1:  RET
                                   3204 
                                   3205 ;       TAP    ( bot eot cur c -- bot eot cur )
                                   3206 ;       Accept and echo key stroke
                                   3207 ;       and bump cursor.
      009201 91 CD                 3208         .word      LINK
                           001183  3209 LINK = . 
      009203 03                    3210         .byte      3
      009204 54 41 50              3211         .ascii     "TAP"
      009207                       3212 TAP:
      009207 CD 85 08         [ 4] 3213         CALL     DUPP
      00920A CD 83 C3         [ 4] 3214         CALL     EMIT
      00920D CD 85 32         [ 4] 3215         CALL     OVER
      009210 CD 84 6E         [ 4] 3216         CALL     CSTOR
      009213 CC 89 E2         [ 2] 3217         JP     ONEP
                                   3218 
                                   3219 ;       kTAP    ( bot eot cur c -- bot eot cur )
                                   3220 ;       Process a key stroke,
                                   3221 ;       CR or backspace.
      009216 92 03                 3222         .word      LINK
                           001198  3223 LINK = . 
      009218 04                    3224         .byte      4
      009219 4B 54 41 50           3225         .ascii     "KTAP"
      00921D                       3226 KTAP:
      00921D CD 85 08         [ 4] 3227         CALL     DUPP
      009220 CD 83 D9         [ 4] 3228         CALL     DOLIT
      009223 00 0D                 3229         .word      CRR
      009225 CD 85 7D         [ 4] 3230         CALL     XORR
      009228 CD 84 0C         [ 4] 3231         CALL     QBRAN
      00922B 92 43                 3232         .word      KTAP2
      00922D CD 83 D9         [ 4] 3233         CALL     DOLIT
      009230 00 08                 3234         .word      BKSPP
      009232 CD 85 7D         [ 4] 3235         CALL     XORR
      009235 CD 84 0C         [ 4] 3236         CALL     QBRAN
      009238 92 40                 3237         .word      KTAP1
      00923A CD 8A 41         [ 4] 3238         CALL     BLANK
      00923D CC 92 07         [ 2] 3239         JP     TAP
      009240 CC 91 D0         [ 2] 3240 KTAP1:  JP     BKSP
      009243 CD 84 FE         [ 4] 3241 KTAP2:  CALL     DROP
      009246 CD 85 18         [ 4] 3242         CALL     SWAPP
      009249 CD 84 FE         [ 4] 3243         CALL     DROP
      00924C CC 85 08         [ 2] 3244         JP     DUPP
                                   3245 
                                   3246 ;       accept  ( b u -- b u )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



                                   3247 ;       Accept characters to input
                                   3248 ;       buffer. Return with actual count.
      00924F 92 18                 3249         .word      LINK
                           0011D1  3250 LINK = . 
      009251 06                    3251         .byte      6
      009252 41 43 43 45 50 54     3252         .ascii     "ACCEPT"
      009258                       3253 ACCEP:
      009258 CD 85 32         [ 4] 3254         CALL     OVER
      00925B CD 87 03         [ 4] 3255         CALL     PLUS
      00925E CD 85 32         [ 4] 3256         CALL     OVER
      009261 CD 86 EE         [ 4] 3257 ACCP1:  CALL     DDUP
      009264 CD 85 7D         [ 4] 3258         CALL     XORR
      009267 CD 84 0C         [ 4] 3259         CALL     QBRAN
      00926A 92 8C                 3260         .word      ACCP4
      00926C CD 8E 36         [ 4] 3261         CALL     KEY
      00926F CD 85 08         [ 4] 3262         CALL     DUPP
      009272 CD 8A 41         [ 4] 3263         CALL     BLANK
      009275 CD 83 D9         [ 4] 3264         CALL     DOLIT
      009278 00 7F                 3265         .word      127
      00927A CD 88 23         [ 4] 3266         CALL     WITHI
      00927D CD 84 0C         [ 4] 3267         CALL     QBRAN
      009280 92 87                 3268         .word      ACCP2
      009282 CD 92 07         [ 4] 3269         CALL     TAP
      009285 20 03            [ 2] 3270         JRA     ACCP3
      009287 CD 92 1D         [ 4] 3271 ACCP2:  CALL     KTAP
      00928A 20 D5            [ 2] 3272 ACCP3:  JRA     ACCP1
      00928C CD 84 FE         [ 4] 3273 ACCP4:  CALL     DROP
      00928F CD 85 32         [ 4] 3274         CALL     OVER
      009292 CC 87 61         [ 2] 3275         JP     SUBB
                                   3276 
                                   3277 ;       QUERY   ( -- )
                                   3278 ;       Accept input stream to
                                   3279 ;       terminal input buffer.
      009295 92 51                 3280         .word      LINK
                                   3281         
                           001217  3282 LINK = . 
      009297 05                    3283         .byte      5
      009298 51 55 45 52 59        3284         .ascii     "QUERY"
      00929D                       3285 QUERY:
      00929D CD 8B 5F         [ 4] 3286         CALL     TIB
      0092A0 CD 83 D9         [ 4] 3287         CALL     DOLIT
      0092A3 00 50                 3288         .word      80
      0092A5 CD 92 58         [ 4] 3289         CALL     ACCEP
      0092A8 CD 85 F3         [ 4] 3290         CALL     NTIB
      0092AB CD 84 4A         [ 4] 3291         CALL     STORE
      0092AE CD 84 FE         [ 4] 3292         CALL     DROP
      0092B1 CD 8A 4E         [ 4] 3293         CALL     ZERO
      0092B4 CD 85 E3         [ 4] 3294         CALL     INN
      0092B7 CC 84 4A         [ 2] 3295         JP     STORE
                                   3296 
                                   3297 ;       ABORT   ( -- )
                                   3298 ;       Reset data stack and
                                   3299 ;       jump to QUIT.
      0092BA 92 97                 3300         .word      LINK
                           00123C  3301 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      0092BC 05                    3302         .byte      5
      0092BD 41 42 4F 52 54        3303         .ascii     "ABORT"
      0092C2                       3304 ABORT:
      0092C2 CD 93 B9         [ 4] 3305         CALL     PRESE
      0092C5 CC 93 D6         [ 2] 3306         JP     QUIT
                                   3307 
                                   3308 ;       abort"  ( f -- )
                                   3309 ;       Run time routine of ABORT".
                                   3310 ;       Abort with a message.
      0092C8 92 BC                 3311         .word      LINK
                           00124A  3312 LINK = . 
      0092CA 46                    3313 	.byte      COMPO+6
      0092CB 41 42 4F 52 54        3314         .ascii     "ABORT"
      0092D0 22                    3315         .byte      '"'
      0092D1                       3316 ABORQ:
      0092D1 CD 84 0C         [ 4] 3317         CALL     QBRAN
      0092D4 92 F0                 3318         .word      ABOR2   ;text flag
      0092D6 CD 8E CC         [ 4] 3319         CALL     DOSTR
      0092D9 CD 8E 6E         [ 4] 3320 ABOR1:  CALL     SPACE
      0092DC CD 8B 26         [ 4] 3321         CALL     COUNT
      0092DF CD 8E 98         [ 4] 3322         CALL     TYPES
      0092E2 CD 83 D9         [ 4] 3323         CALL     DOLIT
      0092E5 00 3F                 3324         .word     63 ; "?"
      0092E7 CD 83 C3         [ 4] 3325         CALL     EMIT
      0092EA CD 8E B6         [ 4] 3326         CALL     CR
      0092ED CC 92 C2         [ 2] 3327         JP     ABORT   ;pass error string
      0092F0 CD 8E CC         [ 4] 3328 ABOR2:  CALL     DOSTR
      0092F3 CC 84 FE         [ 2] 3329         JP     DROP
                                   3330 
                                   3331 ;; The text interpreter
                                   3332 
                                   3333 ;       $INTERPRET      ( a -- )
                                   3334 ;       Interpret a word. If failed,
                                   3335 ;       try to convert it to an integer.
      0092F6 92 CA                 3336         .word      LINK
                           001278  3337 LINK = . 
      0092F8 0A                    3338         .byte      10
      0092F9 24 49 4E 54 45 52 50  3339         .ascii     "$INTERPRET"
             52 45 54
      009303                       3340 INTER:
      009303 CD 91 C5         [ 4] 3341         CALL     NAMEQ
      009306 CD 86 B2         [ 4] 3342         CALL     QDUP    ;?defined
      009309 CD 84 0C         [ 4] 3343         CALL     QBRAN
      00930C 93 2D                 3344         .word      INTE1
      00930E CD 84 61         [ 4] 3345         CALL     AT
      009311 CD 83 D9         [ 4] 3346         CALL     DOLIT
      009314 40 00                 3347 	.word       0x4000	; COMPO*256
      009316 CD 85 54         [ 4] 3348         CALL     ANDD    ;?compile only lexicon bits
      009319 CD 92 D1         [ 4] 3349         CALL     ABORQ
      00931C 0D                    3350         .byte      13
      00931D 20 63 6F 6D 70 69 6C  3351         .ascii     " compile only"
             65 20 6F 6E 6C 79
      00932A CC 84 33         [ 2] 3352         JP     EXECU
      00932D CD 8D 63         [ 4] 3353 INTE1:  CALL     NUMBQ   ;convert a number
      009330 CD 84 0C         [ 4] 3354         CALL     QBRAN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      009333 92 D9                 3355         .word    ABOR1
      009335 81               [ 4] 3356         RET
                                   3357 
                                   3358 ;       [       ( -- )
                                   3359 ;       Start  text interpreter.
      009336 92 F8                 3360         .word      LINK
                           0012B8  3361 LINK = . 
      009338 81                    3362 	.byte      IMEDD+1
      009339 5B                    3363         .ascii     "["
      00933A                       3364 LBRAC:
      00933A CD 83 D9         [ 4] 3365         CALL   DOLIT
      00933D 93 03                 3366         .word  INTER
      00933F CD 86 26         [ 4] 3367         CALL   TEVAL
      009342 CC 84 4A         [ 2] 3368         JP     STORE
                                   3369 
                                   3370 ;       .OK     ( -- )
                                   3371 ;       Display 'ok' while interpreting.
      009345 93 38                 3372         .word      LINK
                           0012C7  3373 LINK = . 
      009347 03                    3374         .byte      3
      009348 2E 4F 4B              3375         .ascii     ".OK"
      00934B                       3376 DOTOK:
      00934B CD 83 D9         [ 4] 3377         CALL     DOLIT
      00934E 93 03                 3378         .word      INTER
      009350 CD 86 26         [ 4] 3379         CALL     TEVAL
      009353 CD 84 61         [ 4] 3380         CALL     AT
      009356 CD 87 89         [ 4] 3381         CALL     EQUAL
      009359 CD 84 0C         [ 4] 3382         CALL     QBRAN
      00935C 93 65                 3383         .word      DOTO1
      00935E CD 8E F5         [ 4] 3384         CALL     DOTQP
      009361 03                    3385         .byte      3
      009362 20 6F 6B              3386         .ascii     " ok"
      009365 CC 8E B6         [ 2] 3387 DOTO1:  JP     CR
                                   3388 
                                   3389 ;       ?STACK  ( -- )
                                   3390 ;       Abort if stack underflows.
      009368 93 47                 3391         .word      LINK
                           0012EA  3392 LINK = . 
      00936A 06                    3393         .byte      6
      00936B 3F 53 54 41 43 4B     3394         .ascii     "?STACK"
      009371                       3395 QSTAC: 
      009371 CD 8A 91         [ 4] 3396         CALL     DEPTH
      009374 CD 85 41         [ 4] 3397         CALL     ZLESS   ;check only for underflow
      009377 CD 92 D1         [ 4] 3398         CALL     ABORQ
      00937A 0B                    3399         .byte      11
      00937B 20 75 6E 64 65 72 66  3400         .ascii     " underflow "
             6C 6F 77 20
      009386 81               [ 4] 3401         RET
                                   3402 
                                   3403 ;       EVAL    ( -- )
                                   3404 ;       Interpret  input stream.
      009387 93 6A                 3405         .word      LINK
                           001309  3406 LINK = . 
      009389 04                    3407         .byte      4
      00938A 45 56 41 4C           3408         .ascii     "EVAL"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



      00938E                       3409 EVAL:
      00938E CD 90 C8         [ 4] 3410 EVAL1:  CALL     TOKEN
      009391 CD 85 08         [ 4] 3411         CALL     DUPP
      009394 CD 84 7F         [ 4] 3412         CALL     CAT     ;?input stream empty
      009397 CD 84 0C         [ 4] 3413         CALL     QBRAN
      00939A 93 AA                 3414         .word    EVAL2
      00939C CD 86 26         [ 4] 3415         CALL     TEVAL
      00939F CD 8B 73         [ 4] 3416         CALL     ATEXE
      0093A2 CD 93 71         [ 4] 3417         CALL     QSTAC   ;evaluate input, check stack
      0093A5 CD 84 23         [ 4] 3418         CALL     BRAN
      0093A8 93 8E                 3419         .word    EVAL1
      0093AA CD 84 FE         [ 4] 3420 EVAL2:  CALL     DROP
      0093AD CC 93 4B         [ 2] 3421         JP       DOTOK
                                   3422 
                                   3423 ;       PRESET  ( -- )
                                   3424 ;       Reset data stack pointer and
                                   3425 ;       terminal input buffer.
      0093B0 93 89                 3426         .word      LINK
                           001332  3427 LINK = . 
      0093B2 06                    3428         .byte      6
      0093B3 50 52 45 53 45 54     3429         .ascii     "PRESET"
      0093B9                       3430 PRESE:
      0093B9 CD 83 D9         [ 4] 3431         CALL     DOLIT
      0093BC 16 80                 3432         .word      SPP
      0093BE CD 84 F5         [ 4] 3433         CALL     SPSTO
      0093C1 CD 83 D9         [ 4] 3434         CALL     DOLIT
      0093C4 17 00                 3435         .word      TIBB
      0093C6 CD 85 F3         [ 4] 3436         CALL     NTIB
      0093C9 CD 89 B7         [ 4] 3437         CALL     CELLP
      0093CC CC 84 4A         [ 2] 3438         JP     STORE
                                   3439 
                                   3440 ;       QUIT    ( -- )
                                   3441 ;       Reset return stack pointer
                                   3442 ;       and start text interpreter.
      0093CF 93 B2                 3443         .word      LINK
                           001351  3444 LINK = . 
      0093D1 04                    3445         .byte      4
      0093D2 51 55 49 54           3446         .ascii     "QUIT"
      0093D6                       3447 QUIT:
      0093D6 CD 83 D9         [ 4] 3448         CALL     DOLIT
      0093D9 17 FF                 3449         .word      RPP
      0093DB CD 84 9C         [ 4] 3450         CALL     RPSTO   ;reset return stack pointer
      0093DE CD 93 3A         [ 4] 3451 QUIT1:  CALL     LBRAC   ;start interpretation
      0093E1 CD 92 9D         [ 4] 3452 QUIT2:  CALL     QUERY   ;get input
      0093E4 CD 93 8E         [ 4] 3453         CALL     EVAL
      0093E7 20 F8            [ 2] 3454         JRA     QUIT2   ;continue till error
                                   3455 
                                   3456 ;; The compiler
                                   3457 
                                   3458 ;       '       ( -- ca )
                                   3459 ;       Search vocabularies for
                                   3460 ;       next word in input stream.
      0093E9 93 D1                 3461         .word      LINK
                           00136B  3462 LINK = . 
      0093EB 01                    3463         .byte      1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      0093EC 27                    3464         .ascii     "'"
      0093ED                       3465 TICK:
      0093ED CD 90 C8         [ 4] 3466         CALL     TOKEN
      0093F0 CD 91 C5         [ 4] 3467         CALL     NAMEQ   ;?defined
      0093F3 CD 84 0C         [ 4] 3468         CALL     QBRAN
      0093F6 92 D9                 3469         .word      ABOR1
      0093F8 81               [ 4] 3470         RET     ;yes, push code address
                                   3471 
                                   3472 ;       ALLOT   ( n -- )
                           000001  3473 .if PICATOUT_MOD
                                   3474 ;       Allocate n bytes to RAM 
                           000000  3475 .else 
                                   3476 ;       Allocate n bytes to  code dictionary.
                                   3477 .endif 
      0093F9 93 EB                 3478         .word      LINK
                           00137B  3479 LINK = . 
      0093FB 05                    3480         .byte      5
      0093FC 41 4C 4C 4F 54        3481         .ascii     "ALLOT"
      009401                       3482 ALLOT:
      009401 CD 86 56         [ 4] 3483         CALL     VPP
                           000001  3484 .if PICATOUT_MOD
                                   3485 ; must update APP_VP each time VP is modidied
      009404 CD 8A BF         [ 4] 3486         call PSTOR 
      009407 CC 9A E8         [ 2] 3487         jp UPDATVP 
                           000000  3488 .else
                                   3489         JP     PSTOR
                                   3490 .endif ;PICATOUT_MOD
                                   3491 
                                   3492 ;       ,       ( w -- )
                                   3493 ;         Compile an integer into
                                   3494 ;         variable space.
      00940A 93 FB                 3495         .word      LINK
                           00138C  3496 LINK = . 
      00940C 01                    3497         .byte      1
      00940D 2C                    3498         .ascii     ","
      00940E                       3499 COMMA:
      00940E CD 8B 3D         [ 4] 3500         CALL     HERE
      009411 CD 85 08         [ 4] 3501         CALL     DUPP
      009414 CD 89 B7         [ 4] 3502         CALL     CELLP   ;cell boundary
      009417 CD 86 56         [ 4] 3503         CALL     VPP
      00941A CD 84 4A         [ 4] 3504         CALL     STORE
      00941D CC 84 4A         [ 2] 3505         JP     STORE
                                   3506 
                                   3507 ;       C,      ( c -- )
                                   3508 ;       Compile a byte into
                                   3509 ;       variables space.
      009420 94 0C                 3510        .word      LINK
                           0013A2  3511 LINK = . 
      009422 02                    3512         .byte      2
      009423 43 2C                 3513         .ascii     "C,"
      009425                       3514 CCOMMA:
      009425 CD 8B 3D         [ 4] 3515         CALL     HERE
      009428 CD 85 08         [ 4] 3516         CALL     DUPP
      00942B CD 89 E2         [ 4] 3517         CALL     ONEP
      00942E CD 86 56         [ 4] 3518         CALL     VPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      009431 CD 84 4A         [ 4] 3519         CALL     STORE
      009434 CC 84 6E         [ 2] 3520         JP     CSTOR
                                   3521 
                                   3522 ;       [COMPILE]       ( -- ; <string> )
                                   3523 ;       Compile next immediate
                                   3524 ;       word into code dictionary.
      009437 94 22                 3525         .word      LINK
                           0013B9  3526 LINK = . 
      009439 89                    3527 	.byte      IMEDD+9
      00943A 5B 43 4F 4D 50 49 4C  3528         .ascii     "[COMPILE]"
             45 5D
      009443                       3529 BCOMP:
      009443 CD 93 ED         [ 4] 3530         CALL     TICK
      009446 CC 97 06         [ 2] 3531         JP     JSRC
                                   3532 
                                   3533 ;       COMPILE ( -- )
                                   3534 ;       Compile next jsr in
                                   3535 ;       colon list to code dictionary.
      009449 94 39                 3536         .word      LINK
                           0013CB  3537 LINK = . 
      00944B 47                    3538 	.byte      COMPO+7
      00944C 43 4F 4D 50 49 4C 45  3539         .ascii     "COMPILE"
      009453                       3540 COMPI:
      009453 CD 84 B2         [ 4] 3541         CALL     RFROM
                           000001  3542 .if PICATOUT_MOD
                                   3543 ; no need to increment
                           000000  3544 .else
                                   3545         CALL     ONEP
                                   3546 .endif 
      009456 CD 85 08         [ 4] 3547         CALL     DUPP
      009459 CD 84 61         [ 4] 3548         CALL     AT
      00945C CD 97 06         [ 4] 3549         CALL     JSRC    ;compile subroutine
      00945F CD 89 B7         [ 4] 3550         CALL     CELLP
                           000001  3551 .if PICATOUT_MOD
      009462 90 93            [ 1] 3552         ldw y,x 
      009464 90 FE            [ 2] 3553         ldw y,(y)
      009466 1C 00 02         [ 2] 3554         addw x,#CELLL 
      009469 90 FC            [ 2] 3555         jp (y)
                           000000  3556 .else 
                                   3557         JP     TOR
                                   3558 .endif 
                                   3559 
                                   3560 ;       LITERAL ( w -- )
                                   3561 ;       Compile tos to dictionary
                                   3562 ;       as an integer literal.
      00946B 94 4B                 3563         .word      LINK
                           0013ED  3564 LINK = . 
      00946D 87                    3565 	.byte      IMEDD+7
      00946E 4C 49 54 45 52 41 4C  3566         .ascii     "LITERAL"
      009475                       3567 LITER:
      009475 CD 94 53         [ 4] 3568         CALL     COMPI
                           000001  3569 .if PICATOUT_MOD
      009478 83 D9                 3570         .word DOLIT 
                           000000  3571 .else         
                                   3572         CALL     DOLIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



                                   3573 .endif 
      00947A CC 94 0E         [ 2] 3574         JP     COMMA
                                   3575 
                                   3576 ;       $,"     ( -- )
                                   3577 ;       Compile a literal string
                                   3578 ;       up to next " .
      00947D 94 6D                 3579         .word      LINK
                           0013FF  3580 LINK = . 
      00947F 03                    3581         .byte      3
      009480 24 2C 22              3582         .byte     '$',',','"'
      009483                       3583 STRCQ:
      009483 CD 83 D9         [ 4] 3584         CALL     DOLIT
      009486 00 22                 3585         .word     34	; "
      009488 CD 90 4B         [ 4] 3586         CALL     PARSE
      00948B CD 8B 3D         [ 4] 3587         CALL     HERE
      00948E CD 8B FE         [ 4] 3588         CALL     PACKS   ;string to code dictionary
      009491 CD 8B 26         [ 4] 3589         CALL     COUNT
      009494 CD 87 03         [ 4] 3590         CALL     PLUS    ;calculate aligned end of string
      009497 CD 86 56         [ 4] 3591         CALL     VPP
      00949A CC 84 4A         [ 2] 3592         JP     STORE
                                   3593 
                                   3594 ;; Structures
                                   3595 
                                   3596 ;       FOR     ( -- a )
                                   3597 ;       Start a FOR-NEXT loop
                                   3598 ;       structure in a colon definition.
      00949D 94 7F                 3599         .word      LINK
                           00141F  3600 LINK = . 
      00949F 83                    3601 	.byte      IMEDD+3
      0094A0 46 4F 52              3602         .ascii     "FOR"
      0094A3                       3603 FOR:
      0094A3 CD 94 53         [ 4] 3604         CALL     COMPI
                           000001  3605 .if PICATOUT_MOD
      0094A6 84 D1                 3606         .word TOR 
                           000000  3607 .else
                                   3608         CALL     TOR
                                   3609 .endif
      0094A8 CC 8B 3D         [ 2] 3610         JP     HERE
                                   3611 
                                   3612 ;       NEXT    ( a -- )
                                   3613 ;       Terminate a FOR-NEXT loop.
      0094AB 94 9F                 3614         .word      LINK
                           00142D  3615 LINK = . 
      0094AD 84                    3616 	.byte      IMEDD+4
      0094AE 4E 45 58 54           3617         .ascii     "NEXT"
      0094B2                       3618 NEXT:
      0094B2 CD 94 53         [ 4] 3619         CALL     COMPI
                           000001  3620 .if PICATOUT_MOD
      0094B5 83 ED                 3621         .word DONXT 
                           000000  3622 .else 
                                   3623         CALL     DONXT
                                   3624 .endif         
                           000001  3625 .if PICATOUT_MOD
      0094B7 CD 86 A2         [ 4] 3626         call ADRADJ
                                   3627 .endif ; PICATOUT_MOD
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



      0094BA CC 94 0E         [ 2] 3628         JP     COMMA
                                   3629 
                                   3630 ;       I ( -- n )
                                   3631 ;       stack FOR-NEXT COUNTER 
      0094BD 94 AD                 3632         .word LINK 
                           00143F  3633         LINK=.
      0094BF 01                    3634         .byte 1 
      0094C0 49                    3635         .ascii "I"
      0094C1                       3636 IFETCH: 
      0094C1 1D 00 02         [ 2] 3637         subw x,#CELLL 
      0094C4 16 03            [ 2] 3638         ldw y,(3,sp)
      0094C6 FF               [ 2] 3639         ldw (x),y 
      0094C7 81               [ 4] 3640         ret 
                                   3641 
                                   3642 ;       BEGIN   ( -- a )
                                   3643 ;       Start an infinite or
                                   3644 ;       indefinite loop structure.
      0094C8 94 BF                 3645         .word      LINK
                           00144A  3646 LINK = . 
      0094CA 85                    3647 	.byte      IMEDD+5
      0094CB 42 45 47 49 4E        3648         .ascii     "BEGIN"
      0094D0                       3649 BEGIN:
      0094D0 CC 8B 3D         [ 2] 3650         JP     HERE
                                   3651 
                                   3652 ;       UNTIL   ( a -- )
                                   3653 ;       Terminate a BEGIN-UNTIL
                                   3654 ;       indefinite loop structure.
      0094D3 94 CA                 3655         .word      LINK
                           001455  3656 LINK = . 
      0094D5 85                    3657 	.byte      IMEDD+5
      0094D6 55 4E 54 49 4C        3658         .ascii     "UNTIL"
      0094DB                       3659 UNTIL:
      0094DB CD 94 53         [ 4] 3660         CALL     COMPI
                           000001  3661 .if PICATOUT_MOD
      0094DE 84 0C                 3662         .word    QBRAN 
                           000000  3663 .else 
                                   3664         CALL     QBRAN
                                   3665 .endif 
                           000001  3666 .if PICATOUT_MOD 
      0094E0 CD 86 A2         [ 4] 3667         call ADRADJ
                                   3668 .endif ; PICATOUT_MOD
      0094E3 CC 94 0E         [ 2] 3669         JP     COMMA
                                   3670 
                                   3671 ;       AGAIN   ( a -- )
                                   3672 ;       Terminate a BEGIN-AGAIN
                                   3673 ;       infinite loop structure.
      0094E6 94 D5                 3674         .word      LINK
                           001468  3675 LINK = . 
      0094E8 85                    3676 	.byte      IMEDD+5
      0094E9 41 47 41 49 4E        3677         .ascii     "AGAIN"
      0094EE                       3678 AGAIN:
      0094EE CD 94 53         [ 4] 3679         CALL     COMPI
                           000001  3680 .if PICATOUT_MOD
      0094F1 84 23                 3681         .word BRAN
                           000000  3682 .else
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



                                   3683         CALL     BRAN
                                   3684 .endif 
                           000001  3685 .if PICATOUT_MOD 
      0094F3 CD 86 A2         [ 4] 3686         call ADRADJ 
                                   3687 .endif ; PICATOUT_MOD
      0094F6 CC 94 0E         [ 2] 3688         JP     COMMA
                                   3689 
                                   3690 ;       IF      ( -- A )
                                   3691 ;       Begin a conditional branch.
      0094F9 94 E8                 3692         .word      LINK
                           00147B  3693 LINK = . 
      0094FB 82                    3694 	.byte      IMEDD+2
      0094FC 49 46                 3695         .ascii     "IF"
      0094FE                       3696 IFF:
      0094FE CD 94 53         [ 4] 3697         CALL     COMPI
                           000001  3698 .if PICATOUT_MOD
      009501 84 0C                 3699         .word QBRAN
                           000000  3700 .else
                                   3701         CALL     QBRAN
                                   3702 .endif 
      009503 CD 8B 3D         [ 4] 3703         CALL     HERE
      009506 CD 8A 4E         [ 4] 3704         CALL     ZERO
      009509 CC 94 0E         [ 2] 3705         JP     COMMA
                                   3706 
                                   3707 ;       THEN        ( A -- )
                                   3708 ;       Terminate a conditional branch structure.
      00950C 94 FB                 3709         .word      LINK
                           00148E  3710 LINK = . 
      00950E 84                    3711 	.byte      IMEDD+4
      00950F 54 48 45 4E           3712         .ascii     "THEN"
      009513                       3713 THENN:
      009513 CD 8B 3D         [ 4] 3714         CALL     HERE
                           000001  3715 .if PICATOUT_MOD 
      009516 CD 86 A2         [ 4] 3716         call ADRADJ 
                                   3717 .endif ; PICATOUT_MOD
      009519 CD 85 18         [ 4] 3718         CALL     SWAPP
      00951C CC 84 4A         [ 2] 3719         JP     STORE
                                   3720 
                                   3721 ;       ELSE        ( A -- A )
                                   3722 ;       Start the false clause in an IF-ELSE-THEN structure.
      00951F 95 0E                 3723         .word      LINK
                           0014A1  3724 LINK = . 
      009521 84                    3725 	.byte      IMEDD+4
      009522 45 4C 53 45           3726         .ascii     "ELSE"
      009526                       3727 ELSEE:
      009526 CD 94 53         [ 4] 3728         CALL     COMPI
                           000001  3729 .if PICATOUT_MOD
      009529 84 23                 3730         .word BRAN
                           000000  3731 .else
                                   3732         CALL     BRAN
                                   3733 .endif 
      00952B CD 8B 3D         [ 4] 3734         CALL     HERE
      00952E CD 8A 4E         [ 4] 3735         CALL     ZERO
      009531 CD 94 0E         [ 4] 3736         CALL     COMMA
      009534 CD 85 18         [ 4] 3737         CALL     SWAPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      009537 CD 8B 3D         [ 4] 3738         CALL     HERE
                           000001  3739 .if PICATOUT_MOD 
      00953A CD 86 A2         [ 4] 3740         call ADRADJ 
                                   3741 .endif ; PICATOUT_MOD
      00953D CD 85 18         [ 4] 3742         CALL     SWAPP
      009540 CC 84 4A         [ 2] 3743         JP     STORE
                                   3744 
                                   3745 ;       AHEAD       ( -- A )
                                   3746 ;       Compile a forward branch instruction.
      009543 95 21                 3747         .word      LINK
                           0014C5  3748 LINK = . 
      009545 85                    3749 	.byte      IMEDD+5
      009546 41 48 45 41 44        3750         .ascii     "AHEAD"
      00954B                       3751 AHEAD:
      00954B CD 94 53         [ 4] 3752         CALL     COMPI
                           000001  3753 .if PICATOUT_MOD
      00954E 84 23                 3754         .word BRAN
                           000000  3755 .else
                                   3756         CALL     BRAN
                                   3757 .endif 
      009550 CD 8B 3D         [ 4] 3758         CALL     HERE
      009553 CD 8A 4E         [ 4] 3759         CALL     ZERO
      009556 CC 94 0E         [ 2] 3760         JP     COMMA
                                   3761 
                                   3762 ;       WHILE       ( a -- A a )
                                   3763 ;       Conditional branch out of a BEGIN-WHILE-REPEAT loop.
      009559 95 45                 3764         .word      LINK
                           0014DB  3765 LINK = . 
      00955B 85                    3766 	.byte      IMEDD+5
      00955C 57 48 49 4C 45        3767         .ascii     "WHILE"
      009561                       3768 WHILE:
      009561 CD 94 53         [ 4] 3769         CALL     COMPI
                           000001  3770 .if PICATOUT_MOD
      009564 84 0C                 3771         .word QBRAN
                           000000  3772 .else
                                   3773         CALL     QBRAN
                                   3774 .endif 
      009566 CD 8B 3D         [ 4] 3775         CALL     HERE
      009569 CD 8A 4E         [ 4] 3776         CALL     ZERO
      00956C CD 94 0E         [ 4] 3777         CALL     COMMA
      00956F CC 85 18         [ 2] 3778         JP     SWAPP
                                   3779 
                                   3780 ;       REPEAT      ( A a -- )
                                   3781 ;       Terminate a BEGIN-WHILE-REPEAT indefinite loop.
      009572 95 5B                 3782         .word      LINK
                           0014F4  3783 LINK = . 
      009574 86                    3784         .byte      IMEDD+6
      009575 52 45 50 45 41 54     3785         .ascii     "REPEAT"
      00957B                       3786 REPEA:
      00957B CD 94 53         [ 4] 3787         CALL     COMPI
                           000001  3788 .if PICATOUT_MOD
      00957E 84 23                 3789         .word BRAN
                           000000  3790 .else
                                   3791         CALL     BRAN
                                   3792 .endif 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



                           000001  3793 .if PICATOUT_MOD 
      009580 CD 86 A2         [ 4] 3794         call ADRADJ 
                                   3795 .endif ; PICATOUT_MOD
      009583 CD 94 0E         [ 4] 3796         CALL     COMMA
      009586 CD 8B 3D         [ 4] 3797         CALL     HERE
                           000001  3798 .if PICATOUT_MOD 
      009589 CD 86 A2         [ 4] 3799         call ADRADJ 
                                   3800 .endif ; PICATOUT_MOD
      00958C CD 85 18         [ 4] 3801         CALL     SWAPP
      00958F CC 84 4A         [ 2] 3802         JP     STORE
                                   3803 
                                   3804 ;       AFT         ( a -- a A )
                                   3805 ;       Jump to THEN in a FOR-AFT-THEN-NEXT loop the first time through.
      009592 95 74                 3806         .word      LINK
                           001514  3807 LINK = . 
      009594 83                    3808 	.byte      IMEDD+3
      009595 41 46 54              3809         .ascii     "AFT"
      009598                       3810 AFT:
      009598 CD 84 FE         [ 4] 3811         CALL     DROP
      00959B CD 95 4B         [ 4] 3812         CALL     AHEAD
      00959E CD 8B 3D         [ 4] 3813         CALL     HERE
      0095A1 CC 85 18         [ 2] 3814         JP     SWAPP
                                   3815 
                                   3816 ;       ABORT"      ( -- ; <string> )
                                   3817 ;       Conditional abort with an error message.
      0095A4 95 94                 3818         .word      LINK
                           001526  3819 LINK = . 
      0095A6 86                    3820 	.byte      IMEDD+6
      0095A7 41 42 4F 52 54        3821         .ascii     "ABORT"
      0095AC 22                    3822         .byte      '"'
      0095AD                       3823 ABRTQ:
      0095AD CD 94 53         [ 4] 3824         CALL     COMPI
                           000001  3825 .if PICATOUT_MOD
      0095B0 92 D1                 3826         .word ABORQ
                           000000  3827 .else
                                   3828         CALL     ABORQ
                                   3829 .endif
      0095B2 CC 94 83         [ 2] 3830         JP     STRCQ
                                   3831 
                                   3832 ;       $"     ( -- ; <string> )
                                   3833 ;       Compile an inline string literal.
      0095B5 95 A6                 3834         .word      LINK
                           001537  3835 LINK = . 
      0095B7 82                    3836 	.byte      IMEDD+2
      0095B8 24 22                 3837         .byte     '$','"'
      0095BA                       3838 STRQ:
      0095BA CD 94 53         [ 4] 3839         CALL     COMPI
                           000001  3840 .if PICATOUT_MOD
      0095BD 8E EB                 3841         .word STRQP 
                           000000  3842 .else
                                   3843         CALL     STRQP
                                   3844 .endif
      0095BF CC 94 83         [ 2] 3845         JP     STRCQ
                                   3846 
                                   3847 ;       ."          ( -- ; <string> )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



                                   3848 ;       Compile an inline string literal to be typed out at run time.
      0095C2 95 B7                 3849         .word      LINK
                           001544  3850 LINK = . 
      0095C4 82                    3851 	.byte      IMEDD+2
      0095C5 2E 22                 3852         .byte     '.','"'
      0095C7                       3853 DOTQ:
      0095C7 CD 94 53         [ 4] 3854         CALL     COMPI
                           000001  3855 .if PICATOUT_MOD
      0095CA 8E F5                 3856         .word DOTQP 
                           000000  3857 .else
                                   3858         CALL     DOTQP
                                   3859 .endif 
      0095CC CC 94 83         [ 2] 3860         JP     STRCQ
                                   3861 
                                   3862 ;; Name compiler
                                   3863 
                                   3864 ;       ?UNIQUE ( a -- a )
                                   3865 ;       Display a warning message
                                   3866 ;       if word already exists.
      0095CF 95 C4                 3867         .word      LINK
                           001551  3868 LINK = . 
      0095D1 07                    3869         .byte      7
      0095D2 3F 55 4E 49 51 55 45  3870         .ascii     "?UNIQUE"
      0095D9                       3871 UNIQU:
      0095D9 CD 85 08         [ 4] 3872         CALL     DUPP
      0095DC CD 91 C5         [ 4] 3873         CALL     NAMEQ   ;?name exists
      0095DF CD 84 0C         [ 4] 3874         CALL     QBRAN
      0095E2 95 F8                 3875         .word      UNIQ1
      0095E4 CD 8E F5         [ 4] 3876         CALL     DOTQP   ;redef are OK
      0095E7 07                    3877         .byte       7
      0095E8 20 72 65 44 65 66 20  3878         .ascii     " reDef "       
      0095EF CD 85 32         [ 4] 3879         CALL     OVER
      0095F2 CD 8B 26         [ 4] 3880         CALL     COUNT
      0095F5 CD 8E 98         [ 4] 3881         CALL     TYPES   ;just in case
      0095F8 CC 84 FE         [ 2] 3882 UNIQ1:  JP     DROP
                                   3883 
                                   3884 ;       $,n     ( na -- )
                                   3885 ;       Build a new dictionary name
                                   3886 ;       using string at na.
                           000001  3887 .if PICATOUT_MOD
                                   3888 ; compile dans l'espace des variables 
                                   3889 .endif 
      0095FB 95 D1                 3890         .word      LINK
                           00157D  3891 LINK = . 
      0095FD 03                    3892         .byte      3
      0095FE 24 2C 6E              3893         .ascii     "$,n"
      009601                       3894 SNAME:
      009601 CD 85 08         [ 4] 3895         CALL     DUPP
      009604 CD 84 7F         [ 4] 3896         CALL     CAT     ;?null input
      009607 CD 84 0C         [ 4] 3897         CALL     QBRAN
      00960A 96 37                 3898         .word      PNAM1
      00960C CD 95 D9         [ 4] 3899         CALL     UNIQU   ;?redefinition
      00960F CD 85 08         [ 4] 3900         CALL     DUPP
      009612 CD 8B 26         [ 4] 3901         CALL     COUNT
      009615 CD 87 03         [ 4] 3902         CALL     PLUS
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



      009618 CD 86 56         [ 4] 3903         CALL     VPP
      00961B CD 84 4A         [ 4] 3904         CALL     STORE
      00961E CD 85 08         [ 4] 3905         CALL     DUPP
      009621 CD 86 74         [ 4] 3906         CALL     LAST
      009624 CD 84 4A         [ 4] 3907         CALL     STORE   ;save na for vocabulary link
      009627 CD 89 C6         [ 4] 3908         CALL     CELLM   ;link address
      00962A CD 86 48         [ 4] 3909         CALL     CNTXT
      00962D CD 84 61         [ 4] 3910         CALL     AT
      009630 CD 85 18         [ 4] 3911         CALL     SWAPP
      009633 CD 84 4A         [ 4] 3912         CALL     STORE
      009636 81               [ 4] 3913         RET     ;save code pointer
      009637 CD 8E EB         [ 4] 3914 PNAM1:  CALL     STRQP
      00963A 05                    3915         .byte      5
      00963B 20 6E 61 6D 65        3916         .ascii     " name" ;null input
      009640 CC 92 D9         [ 2] 3917         JP     ABOR1
                                   3918 
                                   3919 ;; FORTH compiler
                                   3920 
                                   3921 ;       $COMPILE        ( a -- )
                                   3922 ;       Compile next word to
                                   3923 ;       dictionary as a token or literal.
      009643 95 FD                 3924         .word      LINK
                           0015C5  3925 LINK = . 
      009645 08                    3926         .byte      8
      009646 24 43 4F 4D 50 49 4C  3927         .ascii     "$COMPILE"
             45
      00964E                       3928 SCOMP:
      00964E CD 91 C5         [ 4] 3929         CALL     NAMEQ
      009651 CD 86 B2         [ 4] 3930         CALL     QDUP    ;?defined
      009654 CD 84 0C         [ 4] 3931         CALL     QBRAN
      009657 96 6F                 3932         .word      SCOM2
      009659 CD 84 61         [ 4] 3933         CALL     AT
      00965C CD 83 D9         [ 4] 3934         CALL     DOLIT
      00965F 80 00                 3935         .word     0x8000	;  IMEDD*256
      009661 CD 85 54         [ 4] 3936         CALL     ANDD    ;?immediate
      009664 CD 84 0C         [ 4] 3937         CALL     QBRAN
      009667 96 6C                 3938         .word      SCOM1
      009669 CC 84 33         [ 2] 3939         JP     EXECU
      00966C CC 97 06         [ 2] 3940 SCOM1:  JP     JSRC
      00966F CD 8D 63         [ 4] 3941 SCOM2:  CALL     NUMBQ   ;try to convert to number
      009672 CD 84 0C         [ 4] 3942         CALL     QBRAN
      009675 92 D9                 3943         .word      ABOR1
      009677 CC 94 75         [ 2] 3944         JP     LITER
                                   3945 
                                   3946 ;       OVERT   ( -- )
                                   3947 ;       Link a new word into vocabulary.
      00967A 96 45                 3948         .word      LINK
                           0015FC  3949 LINK = . 
      00967C 05                    3950         .byte      5
      00967D 4F 56 45 52 54        3951         .ascii     "OVERT"
      009682                       3952 OVERT:
      009682 CD 86 74         [ 4] 3953         CALL     LAST
      009685 CD 84 61         [ 4] 3954         CALL     AT
      009688 CD 86 48         [ 4] 3955         CALL     CNTXT
      00968B CC 84 4A         [ 2] 3956         JP     STORE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



                                   3957 
                                   3958 ;       ;       ( -- )
                                   3959 ;       Terminate a colon definition.
      00968E 96 7C                 3960         .word      LINK
                           001610  3961 LINK = . 
      009690 C1                    3962 	.byte      IMEDD+COMPO+1
      009691 3B                    3963         .ascii     ";"
      009692                       3964 SEMIS:
      009692 CD 94 53         [ 4] 3965         CALL     COMPI
                           000001  3966 .if PICATOUT_MOD
      009695 84 43                 3967         .word EXIT 
                           000000  3968 .else
                                   3969         CALL     EXIT
                                   3970 .endif 
      009697 CD 93 3A         [ 4] 3971         CALL     LBRAC
                           000001  3972 .if PICATOUT_MOD
      00969A CD 96 82         [ 4] 3973         call OVERT 
      00969D CD 9F B4         [ 4] 3974         CALL FMOVE
      0096A0 CD 86 B2         [ 4] 3975         call QDUP 
      0096A3 CD 84 0C         [ 4] 3976         call QBRAN 
      0096A6 97 D6                 3977         .word SET_RAMLAST 
      0096A8 CD A0 48         [ 4] 3978         CALL UPDATPTR 
      0096AB 81               [ 4] 3979 1$:     RET 
                           000000  3980 .else 
                                   3981         JP     OVERT
                                   3982 .endif 
                                   3983 
                           000001  3984 .if PICATOUT_MOD
                                   3985 ;       Terminate an ISR definition 
                                   3986 ;       retourn ca of ISR as double
                                   3987 ;       I; ( -- ud )
      0096AC 96 90                 3988         .word LINK 
                           00162E  3989         LINK=.
      0096AE C2                    3990         .byte 2+IMEDD+COMPO 
      0096AF 49 3B                 3991         .ascii "I;" 
      0096B1                       3992 ISEMI:
      0096B1 1D 00 02         [ 2] 3993         subw x,#CELLL  
      0096B4 90 AE 00 80      [ 2] 3994         ldw y,#IRET_CODE 
      0096B8 FF               [ 2] 3995         ldw (x),y 
      0096B9 CD 94 25         [ 4] 3996         call CCOMMA
      0096BC CD 93 3A         [ 4] 3997         call LBRAC 
      0096BF CD A0 8D         [ 4] 3998         call IFMOVE
      0096C2 CD 86 B2         [ 4] 3999         call QDUP 
      0096C5 CD 84 0C         [ 4] 4000         CALL QBRAN 
      0096C8 97 D6                 4001         .word SET_RAMLAST
      0096CA CD 86 64         [ 4] 4002         CALL CPP
      0096CD CD 84 61         [ 4] 4003         call AT 
      0096D0 CD 85 18         [ 4] 4004         call SWAPP 
      0096D3 CD 86 64         [ 4] 4005         CALL CPP 
      0096D6 CD 84 4A         [ 4] 4006         call STORE 
      0096D9 CD 9A D1         [ 4] 4007         call UPDATCP 
      0096DC CD 9A 8E         [ 4] 4008         call EEPVP 
      0096DF CD 84 FE         [ 4] 4009         call DROP 
      0096E2 CD 84 61         [ 4] 4010         call AT 
      0096E5 CD 86 56         [ 4] 4011         call VPP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      0096E8 CD 84 4A         [ 4] 4012         call STORE 
      0096EB CC 8A 4E         [ 2] 4013         jp ZERO
      0096EE 81               [ 4] 4014         ret           
                                   4015         
                                   4016 .endif ;PICATOUT_MOD
                                   4017 
                                   4018 ;       ]       ( -- )
                                   4019 ;       Start compiling words in
                                   4020 ;       input stream.
      0096EF 96 AE                 4021         .word      LINK
                           001671  4022 LINK = . 
      0096F1 01                    4023         .byte      1
      0096F2 5D                    4024         .ascii     "]"
      0096F3                       4025 RBRAC:
      0096F3 CD 83 D9         [ 4] 4026         CALL   DOLIT
      0096F6 96 4E                 4027         .word  SCOMP
      0096F8 CD 86 26         [ 4] 4028         CALL   TEVAL
      0096FB CC 84 4A         [ 2] 4029         JP     STORE
                                   4030 
                                   4031 ;       CALL,    ( ca -- )
                                   4032 ;       Compile a subroutine call.
      0096FE 96 F1                 4033         .word      LINK
                           001680  4034 LINK = . 
      009700 05                    4035         .byte      5
      009701 43 41 4C 4C 2C        4036         .ascii     "CALL,"
      009706                       4037 JSRC:
      009706 CD 83 D9         [ 4] 4038         CALL     DOLIT
      009709 00 CD                 4039         .word     CALLL     ;CALL
      00970B CD 94 25         [ 4] 4040         CALL     CCOMMA
      00970E CC 94 0E         [ 2] 4041         JP     COMMA
                                   4042 
                           000001  4043 .if PICATOUT_MOD
                                   4044 ;       INIT-OFS ( -- )
                                   4045 ;       compute offset to adjust jump address 
                                   4046 ;       set variable OFFSET 
      009711 97 00                 4047         .word LINK 
                           001693  4048         LINK=.
      009713 08                    4049         .byte 8 
      009714 49 4E 49 54 2D 4F 46  4050         .ascii "INIT-OFS" 
             53
      00971C                       4051 INITOFS:
      00971C CD 86 15         [ 4] 4052         call TFLASH 
      00971F CD 84 61         [ 4] 4053         CALL AT 
      009722 CD 85 08         [ 4] 4054         CALL DUPP 
      009725 CD 84 0C         [ 4] 4055         call QBRAN
      009728 97 39                 4056         .word 1$
      00972A CD 84 FE         [ 4] 4057         call DROP  
      00972D CD 86 64         [ 4] 4058         call CPP 
      009730 CD 84 61         [ 4] 4059         call AT 
      009733 CD 8B 3D         [ 4] 4060         call HERE
      009736 CD 87 61         [ 4] 4061         call SUBB 
      009739 CD 86 99         [ 4] 4062 1$:     call OFFSET 
      00973C CC 84 4A         [ 2] 4063         jp STORE  
                                   4064 .endif 
                                   4065 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



                                   4066 ;       :       ( -- ; <string> )
                                   4067 ;       Start a new colon definition
                                   4068 ;       using next word as its name.
      00973F 97 13                 4069         .word      LINK
                           0016C1  4070 LINK = . 
      009741 01                    4071         .byte      1
      009742 3A                    4072         .ascii     ":"
      009743                       4073 COLON:
                           000001  4074 .if PICATOUT_MOD
      009743 CD 97 1C         [ 4] 4075         call INITOFS       
                                   4076 .endif ; PICATOUT_MOD
      009746 CD 90 C8         [ 4] 4077         CALL   TOKEN
      009749 CD 96 01         [ 4] 4078         CALL   SNAME
      00974C CC 96 F3         [ 2] 4079         JP     RBRAC
                                   4080 
                           000001  4081 .if PICATOUT_MOD 
                                   4082 ;       I:  ( -- )
                                   4083 ;       Start interrupt service routine definition
                                   4084 ;       those definition have no name.
      00974F 97 41                 4085         .word LINK
                           0016D1  4086         LINK=.
      009751 02                    4087         .byte 2 
      009752 49 3A                 4088         .ascii "I:" 
      009754                       4089 ICOLON:
      009754 CD 97 1C         [ 4] 4090         call INITOFS 
      009757 CC 96 F3         [ 2] 4091         jp RBRAC  
                                   4092 .endif ; PICATOUT_MOD
                                   4093 
                                   4094 ;       IMMEDIATE       ( -- )
                                   4095 ;       Make last compiled word
                                   4096 ;       an immediate word.
      00975A 97 51                 4097         .word      LINK
                           0016DC  4098 LINK = . 
      00975C 09                    4099         .byte      9
      00975D 49 4D 4D 45 44 49 41  4100         .ascii     "IMMEDIATE"
             54 45
      009766                       4101 IMMED:
      009766 CD 83 D9         [ 4] 4102         CALL     DOLIT
      009769 80 00                 4103         .word     0x8000	;  IMEDD*256
      00976B CD 86 74         [ 4] 4104         CALL     LAST
      00976E CD 84 61         [ 4] 4105         CALL     AT
      009771 CD 84 61         [ 4] 4106         CALL     AT
      009774 CD 85 68         [ 4] 4107         CALL     ORR
      009777 CD 86 74         [ 4] 4108         CALL     LAST
      00977A CD 84 61         [ 4] 4109         CALL     AT
      00977D CC 84 4A         [ 2] 4110         JP     STORE
                                   4111 
                                   4112 ;; Defining words
                                   4113 
                                   4114 ;       CREATE  ( -- ; <string> )
                                   4115 ;       Compile a new array
                                   4116 ;       without allocating space.
      009780 97 5C                 4117         .word      LINK
                           001702  4118 LINK = . 
      009782 06                    4119         .byte      6
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



      009783 43 52 45 41 54 45     4120         .ascii     "CREATE"
      009789                       4121 CREAT:
      009789 CD 90 C8         [ 4] 4122         CALL     TOKEN
      00978C CD 96 01         [ 4] 4123         CALL     SNAME
      00978F CD 96 82         [ 4] 4124         CALL     OVERT        
      009792 CD 94 53         [ 4] 4125         CALL     COMPI 
                           000001  4126 .if PICATOUT_MOD
      009795 85 B5                 4127         .word DOVAR 
                           000000  4128 .else
                                   4129         CALL     DOVAR
                                   4130 .endif 
      009797 81               [ 4] 4131         RET
                                   4132 
                                   4133 ;       VARIABLE        ( -- ; <string> )
                                   4134 ;       Compile a new variable
                                   4135 ;       initialized to 0.
      009798 97 82                 4136         .word      LINK
                           00171A  4137 LINK = . 
      00979A 08                    4138         .byte      8
      00979B 56 41 52 49 41 42 4C  4139         .ascii     "VARIABLE"
             45
      0097A3                       4140 VARIA:
                           000001  4141 .if PICATOUT_MOD
                                   4142 ; indirect variable so that VARIABLE definition can be compiled in FLASH 
      0097A3 CD 8B 3D         [ 4] 4143         CALL HERE
      0097A6 CD 85 08         [ 4] 4144         CALL DUPP 
      0097A9 CD 89 B7         [ 4] 4145         CALL CELLP
      0097AC CD 86 56         [ 4] 4146         CALL VPP 
      0097AF CD 84 4A         [ 4] 4147         CALL STORE
                                   4148 .endif         
      0097B2 CD 97 89         [ 4] 4149         CALL CREAT
      0097B5 CD 85 08         [ 4] 4150         CALL DUPP
      0097B8 CD 94 0E         [ 4] 4151         CALL COMMA
      0097BB CD 8A 4E         [ 4] 4152         CALL ZERO
                           000001  4153 .if PICATOUT_MOD 
      0097BE CD 85 18         [ 4] 4154         call SWAPP 
      0097C1 CD 84 4A         [ 4] 4155         CALL STORE
      0097C4 CD 9F B4         [ 4] 4156         CALL FMOVE ; move definition to FLASH
      0097C7 CD 86 B2         [ 4] 4157         CALL QDUP 
      0097CA CD 84 0C         [ 4] 4158         CALL QBRAN 
      0097CD 97 D6                 4159         .word SET_RAMLAST   
      0097CF CD 9A E8         [ 4] 4160         call UPDATVP  ; don't update if variable kept in RAM.
      0097D2 CD A0 48         [ 4] 4161         CALL UPDATPTR
      0097D5 81               [ 4] 4162         RET         
      0097D6                       4163 SET_RAMLAST: 
      0097D6 CD 86 74         [ 4] 4164         CALL LAST 
      0097D9 CD 84 61         [ 4] 4165         CALL AT 
      0097DC CD 86 87         [ 4] 4166         CALL RAMLAST 
      0097DF CC 84 4A         [ 2] 4167         jp STORE  
                                   4168 
                                   4169 .endif ;PICATOUT_MOD        
                                   4170 
                           000001  4171 .if PICATOUT_MOD
                                   4172 ;       CONSTANT  ( n -- ; <string> )
                                   4173 ;       Compile a new constant 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



                                   4174 ;       n CONSTANT name 
      0097E2 97 9A                 4175         .word LINK 
                           001764  4176         LINK=. 
      0097E4 08                    4177         .byte 8 
      0097E5 43 4F 4E 53 54 41 4E  4178         .ascii "CONSTANT" 
             54
      0097ED                       4179 CONSTANT:          
      0097ED CD 90 C8         [ 4] 4180         CALL TOKEN
      0097F0 CD 96 01         [ 4] 4181         CALL SNAME 
      0097F3 CD 96 82         [ 4] 4182         CALL OVERT 
      0097F6 CD 94 53         [ 4] 4183         CALL COMPI 
                           000001  4184 .if PICATOUT_MOD
      0097F9 98 17                 4185         .word DOCONST
                           000000  4186 .else
                                   4187         CALL DOCONST
                                   4188 .endif 
      0097FB CD 94 0E         [ 4] 4189         CALL COMMA 
      0097FE CD 9F B4         [ 4] 4190         CALL FMOVE
      009801 CD 86 B2         [ 4] 4191         CALL QDUP 
      009804 CD 84 0C         [ 4] 4192         CALL QBRAN 
      009807 97 D6                 4193         .word SET_RAMLAST  
      009809 CD A0 48         [ 4] 4194         CALL UPDATPTR  
      00980C 81               [ 4] 4195 1$:     RET          
                                   4196 
                                   4197 ; CONSTANT runtime semantic 
                                   4198 ; doCONST  ( -- n )
      00980D 97 E4                 4199         .word LINK 
                           00178F  4200         LINK=.
      00980F 07                    4201         .byte 7
      009810 44 4F 43 4F 4E 53 54  4202         .ascii "DOCONST"
      009817                       4203 DOCONST:
      009817 1D 00 02         [ 2] 4204         subw x,#CELLL
      00981A 90 85            [ 2] 4205         popw y 
      00981C 90 FE            [ 2] 4206         ldw y,(y) 
      00981E FF               [ 2] 4207         ldw (x),y 
      00981F 81               [ 4] 4208         ret 
                                   4209 .endif ;PICATOUT_MOD
                                   4210 
                                   4211 
                                   4212 ;; Tools
                                   4213 
                                   4214 ;       _TYPE   ( b u -- )
                                   4215 ;       Display a string. Filter
                                   4216 ;       non-printing characters.
      009820 98 0F                 4217         .word      LINK
                           0017A2  4218 LINK = . 
      009822 05                    4219         .byte      5
      009823 5F 54 59 50 45        4220         .ascii     "_TYPE"
      009828                       4221 UTYPE:
      009828 CD 84 D1         [ 4] 4222         CALL     TOR     ;start count down loop
      00982B 20 0F            [ 2] 4223         JRA     UTYP2   ;skip first pass
      00982D CD 85 08         [ 4] 4224 UTYP1:  CALL     DUPP
      009830 CD 84 7F         [ 4] 4225         CALL     CAT
      009833 CD 8A 78         [ 4] 4226         CALL     TCHAR
      009836 CD 83 C3         [ 4] 4227         CALL     EMIT    ;display only printable
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



      009839 CD 89 E2         [ 4] 4228         CALL     ONEP    ;increment address
      00983C CD 83 ED         [ 4] 4229 UTYP2:  CALL     DONXT
      00983F 98 2D                 4230         .word      UTYP1   ;loop till done
      009841 CC 84 FE         [ 2] 4231         JP     DROP
                                   4232 
                                   4233 ;       dm+     ( a u -- a )
                                   4234 ;       Dump u bytes from ,
                                   4235 ;       leaving a+u on  stack.
      009844 98 22                 4236         .word      LINK
                           0017C6  4237 LINK = . 
      009846 03                    4238         .byte      3
      009847 64 6D 2B              4239         .ascii     "dm+"
      00984A                       4240 DUMPP:
      00984A CD 85 32         [ 4] 4241         CALL     OVER
      00984D CD 83 D9         [ 4] 4242         CALL     DOLIT
      009850 00 04                 4243         .word      4
      009852 CD 8F 1E         [ 4] 4244         CALL     UDOTR   ;display address
      009855 CD 8E 6E         [ 4] 4245         CALL     SPACE
      009858 CD 84 D1         [ 4] 4246         CALL     TOR     ;start count down loop
      00985B 20 11            [ 2] 4247         JRA     PDUM2   ;skip first pass
      00985D CD 85 08         [ 4] 4248 PDUM1:  CALL     DUPP
      009860 CD 84 7F         [ 4] 4249         CALL     CAT
      009863 CD 83 D9         [ 4] 4250         CALL     DOLIT
      009866 00 03                 4251         .word      3
      009868 CD 8F 1E         [ 4] 4252         CALL     UDOTR   ;display numeric data
      00986B CD 89 E2         [ 4] 4253         CALL     ONEP    ;increment address
      00986E CD 83 ED         [ 4] 4254 PDUM2:  CALL     DONXT
      009871 98 5D                 4255         .word      PDUM1   ;loop till done
      009873 81               [ 4] 4256         RET
                                   4257 
                                   4258 ;       DUMP    ( a u -- )
                                   4259 ;       Dump u bytes from a,
                                   4260 ;       in a formatted manner.
      009874 98 46                 4261         .word      LINK
                           0017F6  4262 LINK = . 
      009876 04                    4263         .byte      4
      009877 44 55 4D 50           4264         .ascii     "DUMP"
      00987B                       4265 DUMP:
      00987B CD 85 C5         [ 4] 4266         CALL     BASE
      00987E CD 84 61         [ 4] 4267         CALL     AT
      009881 CD 84 D1         [ 4] 4268         CALL     TOR
      009884 CD 8C F6         [ 4] 4269         CALL     HEX     ;save radix, set hex
      009887 CD 83 D9         [ 4] 4270         CALL     DOLIT
      00988A 00 10                 4271         .word      16
      00988C CD 89 08         [ 4] 4272         CALL     SLASH   ;change count to lines
      00988F CD 84 D1         [ 4] 4273         CALL     TOR     ;start count down loop
      009892 CD 8E B6         [ 4] 4274 DUMP1:  CALL     CR
      009895 CD 83 D9         [ 4] 4275         CALL     DOLIT
      009898 00 10                 4276         .word      16
      00989A CD 86 EE         [ 4] 4277         CALL     DDUP
      00989D CD 98 4A         [ 4] 4278         CALL     DUMPP   ;display numeric
      0098A0 CD 86 C3         [ 4] 4279         CALL     ROT
      0098A3 CD 86 C3         [ 4] 4280         CALL     ROT
      0098A6 CD 8E 6E         [ 4] 4281         CALL     SPACE
      0098A9 CD 8E 6E         [ 4] 4282         CALL     SPACE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



      0098AC CD 98 28         [ 4] 4283         CALL     UTYPE   ;display printable characters
      0098AF CD 83 ED         [ 4] 4284         CALL     DONXT
      0098B2 98 92                 4285         .word      DUMP1   ;loop till done
      0098B4 CD 84 FE         [ 4] 4286 DUMP3:  CALL     DROP
      0098B7 CD 84 B2         [ 4] 4287         CALL     RFROM
      0098BA CD 85 C5         [ 4] 4288         CALL     BASE
      0098BD CC 84 4A         [ 2] 4289         JP     STORE   ;restore radix
                                   4290 
                                   4291 ;       .S      ( ... -- ... )
                                   4292 ;        Display  contents of stack.
      0098C0 98 76                 4293         .word      LINK
                           001842  4294 LINK = . 
      0098C2 02                    4295         .byte      2
      0098C3 2E 53                 4296         .ascii     ".S"
      0098C5                       4297 DOTS:
      0098C5 CD 8E B6         [ 4] 4298         CALL     CR
      0098C8 CD 8A 91         [ 4] 4299         CALL     DEPTH   ;stack depth
      0098CB CD 84 D1         [ 4] 4300         CALL     TOR     ;start count down loop
      0098CE 20 09            [ 2] 4301         JRA     DOTS2   ;skip first pass
      0098D0 CD 84 C5         [ 4] 4302 DOTS1:  CALL     RAT
                           000001  4303 .if PICATOUT_MOD
                                   4304 ; Not required following modification I made To PICK 
                                   4305 ;        CALL ONEP
                                   4306 .endif 
      0098D3 CD 8A A8         [ 4] 4307 	CALL     PICK
      0098D6 CD 8F 51         [ 4] 4308         CALL     DOT     ;index stack, display contents
      0098D9 CD 83 ED         [ 4] 4309 DOTS2:  CALL     DONXT
      0098DC 98 D0                 4310         .word      DOTS1   ;loop till done
      0098DE CD 8E F5         [ 4] 4311         CALL     DOTQP
      0098E1 05                    4312         .byte      5
      0098E2 20 3C 73 70 20        4313         .ascii     " <sp "
      0098E7 81               [ 4] 4314         RET
                                   4315 
                                   4316 ;       >NAME   ( ca -- na | F )
                                   4317 ;       Convert code address
                                   4318 ;       to a name address.
      0098E8 98 C2                 4319         .word      LINK
                           00186A  4320 LINK = . 
      0098EA 05                    4321         .byte      5
      0098EB 3E 4E 41 4D 45        4322         .ascii     ">NAME"
      0098F0                       4323 TNAME:
      0098F0 CD 86 48         [ 4] 4324         CALL     CNTXT   ;vocabulary link
      0098F3 CD 84 61         [ 4] 4325 TNAM2:  CALL     AT
      0098F6 CD 85 08         [ 4] 4326         CALL     DUPP    ;?last word in a vocabulary
      0098F9 CD 84 0C         [ 4] 4327         CALL     QBRAN
      0098FC 99 17                 4328         .word      TNAM4
      0098FE CD 86 EE         [ 4] 4329         CALL     DDUP
      009901 CD 90 D6         [ 4] 4330         CALL     NAMET
      009904 CD 85 7D         [ 4] 4331         CALL     XORR    ;compare
      009907 CD 84 0C         [ 4] 4332         CALL     QBRAN
      00990A 99 11                 4333         .word      TNAM3
      00990C CD 89 C6         [ 4] 4334         CALL     CELLM   ;continue with next word
      00990F 20 E2            [ 2] 4335         JRA     TNAM2
      009911 CD 85 18         [ 4] 4336 TNAM3:  CALL     SWAPP
      009914 CC 84 FE         [ 2] 4337         JP     DROP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



      009917 CD 86 E3         [ 4] 4338 TNAM4:  CALL     DDROP
      00991A CC 8A 4E         [ 2] 4339         JP     ZERO
                                   4340 
                                   4341 ;       .ID     ( na -- )
                                   4342 ;        Display  name at address.
      00991D 98 EA                 4343         .word      LINK
                           00189F  4344 LINK = . 
      00991F 03                    4345         .byte      3
      009920 2E 49 44              4346         .ascii     ".ID"
      009923                       4347 DOTID:
      009923 CD 86 B2         [ 4] 4348         CALL     QDUP    ;if zero no name
      009926 CD 84 0C         [ 4] 4349         CALL     QBRAN
      009929 99 39                 4350         .word      DOTI1
      00992B CD 8B 26         [ 4] 4351         CALL     COUNT
      00992E CD 83 D9         [ 4] 4352         CALL     DOLIT
      009931 00 1F                 4353         .word      0x1F
      009933 CD 85 54         [ 4] 4354         CALL     ANDD    ;mask lexicon bits
      009936 CC 98 28         [ 2] 4355         JP     UTYPE
      009939 CD 8E F5         [ 4] 4356 DOTI1:  CALL     DOTQP
      00993C 09                    4357         .byte      9
      00993D 20 6E 6F 4E 61 6D 65  4358         .ascii     " noName"
      009944 81               [ 4] 4359         RET
                                   4360 
                           000000  4361 WANT_SEE=0 
                           000000  4362 .if WANT_SEE 
                                   4363 ;       SEE     ( -- ; <string> )
                                   4364 ;       A simple decompiler.
                                   4365 ;       Updated for byte machines.
                                   4366         .word      LINK
                                   4367 LINK = . 
                                   4368         .byte      3
                                   4369         .ascii     "SEE"
                                   4370 SEE:
                                   4371         CALL     TICK    ;starting address
                                   4372         CALL     CR
                                   4373         CALL     ONEM
                                   4374 SEE1:   CALL     ONEP
                                   4375         CALL     DUPP
                                   4376         CALL     AT
                                   4377         CALL     DUPP    ;?does it contain a zero
                                   4378         CALL     QBRAN
                                   4379         .word    SEE2
                                   4380         CALL     TNAME   ;?is it a name
                                   4381 SEE2:   CALL     QDUP    ;name address or zero
                                   4382         CALL     QBRAN
                                   4383         .word    SEE3
                                   4384         CALL     SPACE
                                   4385         CALL     DOTID   ;display name
                                   4386         CALL     ONEP
                                   4387         JRA      SEE4
                                   4388 SEE3:   CALL     DUPP
                                   4389         CALL     CAT
                                   4390         CALL     UDOT    ;display number
                                   4391 SEE4:   CALL     NUFQ    ;user control
                                   4392         CALL     QBRAN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



                                   4393         .word    SEE1
                                   4394         JP     DROP
                                   4395 .endif ; WANT_SEE 
                                   4396 
                                   4397 ;       WORDS   ( -- )
                                   4398 ;       Display names in vocabulary.
      009945 99 1F                 4399         .word      LINK
                           0018C7  4400 LINK = . 
      009947 05                    4401         .byte      5
      009948 57 4F 52 44 53        4402         .ascii     "WORDS"
      00994D                       4403 WORDS:
      00994D CD 8E B6         [ 4] 4404         CALL     CR
      009950 CD 86 48         [ 4] 4405         CALL     CNTXT   ;only in context
      009953 CD 84 61         [ 4] 4406 WORS1:  CALL     AT
      009956 CD 86 B2         [ 4] 4407         CALL     QDUP    ;?at end of list
      009959 CD 84 0C         [ 4] 4408         CALL     QBRAN
      00995C 99 72                 4409         .word      WORS2
      00995E CD 85 08         [ 4] 4410         CALL     DUPP
      009961 CD 8E 6E         [ 4] 4411         CALL     SPACE
      009964 CD 99 23         [ 4] 4412         CALL     DOTID   ;display a name
      009967 CD 89 C6         [ 4] 4413         CALL     CELLM
      00996A CD 84 23         [ 4] 4414         CALL     BRAN
      00996D 99 53                 4415         .word      WORS1
      00996F CD 84 FE         [ 4] 4416         CALL     DROP
      009972 81               [ 4] 4417 WORS2:  RET
                                   4418 
                                   4419         
                                   4420 ;; Hardware reset
                                   4421 
                                   4422 ;       hi      ( -- )
                                   4423 ;       Display sign-on message.
      009973 99 47                 4424         .word      LINK
                           0018F5  4425 LINK = . 
      009975 02                    4426         .byte      2
      009976 68 69                 4427         .ascii     "hi"
      009978                       4428 HI:
      009978 CD 8E B6         [ 4] 4429         CALL     CR
      00997B CD 8E F5         [ 4] 4430         CALL     DOTQP   ;initialize I/O
      00997E 0F                    4431         .byte      15
      00997F 73 74 6D 38 65 46 6F  4432         .ascii     "stm8eForth v"
             72 74 68 20 76
      00998B 33                    4433 	.byte      VER+'0'
      00998C 2E                    4434         .byte      '.' 
      00998D 30                    4435 	.byte      EXT+'0' ;version
      00998E CC 8E B6         [ 2] 4436         JP     CR
                                   4437 
                           000000  4438 WANT_DEBUG=0
                           000000  4439 .if WANT_DEBUG 
                                   4440 ;       DEBUG      ( -- )
                                   4441 ;       Display sign-on message.
                                   4442 ;        .word      LINK
                                   4443 LINK = . 
                                   4444         .byte      5
                                   4445         .ascii     "DEBUG"
                                   4446 DEBUG:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



                                   4447 	CALL DOLIT
                                   4448 	.word 0x65
                                   4449 	CALL EMIT
                                   4450 	CALL DOLIT
                                   4451 	.word 0
                                   4452  	CALL ZLESS 
                                   4453 	CALL DOLIT
                                   4454 	.word 0xFFFE
                                   4455 	CALL ZLESS 
                                   4456 	CALL UPLUS 
                                   4457  	CALL DROP 
                                   4458 	CALL DOLIT
                                   4459 	.word 3
                                   4460 	CALL UPLUS 
                                   4461 	CALL UPLUS 
                                   4462  	CALL DROP
                                   4463 	CALL DOLIT
                                   4464 	.word 0x43
                                   4465 	CALL UPLUS 
                                   4466  	CALL DROP
                                   4467 	CALL EMIT
                                   4468 	CALL DOLIT
                                   4469 	.word 0x4F
                                   4470 	CALL DOLIT
                                   4471 	.word 0x6F
                                   4472  	CALL XORR
                                   4473 	CALL DOLIT
                                   4474 	.word 0xF0
                                   4475  	CALL ANDD
                                   4476 	CALL DOLIT
                                   4477 	.word 0x4F
                                   4478  	CALL ORR
                                   4479 	CALL EMIT
                                   4480 	CALL DOLIT
                                   4481 	.word 8
                                   4482 	CALL DOLIT
                                   4483 	.word 6
                                   4484  	CALL SWAPP
                                   4485 	CALL OVER
                                   4486 	CALL XORR
                                   4487 	CALL DOLIT
                                   4488 	.word 3
                                   4489 	CALL ANDD 
                                   4490 	CALL ANDD
                                   4491 	CALL DOLIT
                                   4492 	.word 0x70
                                   4493 	CALL UPLUS 
                                   4494 	CALL DROP
                                   4495 	CALL EMIT
                                   4496 	CALL DOLIT
                                   4497 	.word 0
                                   4498 	CALL QBRAN
                                   4499 	.word DEBUG1
                                   4500 	CALL DOLIT
                                   4501 	.word 0x3F
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



                                   4502 DEBUG1:
                                   4503 	CALL DOLIT
                                   4504 	.word 0xFFFF
                                   4505 	CALL QBRAN
                                   4506 	.word DEBUG2
                                   4507 	CALL DOLIT
                                   4508 	.word 0x74
                                   4509 	CALL BRAN
                                   4510 	.word DEBUG3
                                   4511 DEBUG2:
                                   4512 	CALL DOLIT
                                   4513 	.word 0x21
                                   4514 DEBUG3:
                                   4515 	CALL EMIT
                                   4516 	CALL DOLIT
                                   4517 	.word 0x68
                                   4518 	CALL DOLIT
                                   4519 	.word 0x80
                                   4520 	CALL STORE
                                   4521 	CALL DOLIT
                                   4522 	.word 0x80
                                   4523 	CALL AT
                                   4524 	CALL EMIT
                                   4525 	CALL DOLIT
                                   4526 	.word 0x4D
                                   4527 	CALL TOR
                                   4528 	CALL RAT
                                   4529 	CALL RFROM
                                   4530 	CALL ANDD
                                   4531 	CALL EMIT
                                   4532 	CALL DOLIT
                                   4533 	.word 0x61
                                   4534 	CALL DOLIT
                                   4535 	.word 0xA
                                   4536 	CALL TOR
                                   4537 DEBUG4:
                                   4538 	CALL DOLIT
                                   4539 	.word 1
                                   4540 	CALL UPLUS 
                                   4541 	CALL DROP
                                   4542 	CALL DONXT
                                   4543 	.word DEBUG4
                                   4544 	CALL EMIT
                                   4545 	CALL DOLIT
                                   4546 	.word 0x656D
                                   4547 	CALL DOLIT
                                   4548 	.word 0x100
                                   4549 	CALL UMSTA
                                   4550 	CALL SWAPP
                                   4551 	CALL DOLIT
                                   4552 	.word 0x100
                                   4553 	CALL UMSTA
                                   4554 	CALL SWAPP 
                                   4555 	CALL DROP
                                   4556 	CALL EMIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



                                   4557 	CALL EMIT
                                   4558 	CALL DOLIT
                                   4559 	.word 0x2043
                                   4560 	CALL DOLIT
                                   4561 	.word 0
                                   4562 	CALL DOLIT
                                   4563 	.word 0x100
                                   4564 	CALL UMMOD
                                   4565 	CALL EMIT
                                   4566 	CALL EMIT
                                   4567 	;JP ORIG
                                   4568 	RET
                                   4569 .endif ; WANT_DEBUG 
                                   4570 
                                   4571 
                                   4572 ;       'BOOT   ( -- a )
                                   4573 ;       The application startup vector.
      009991 99 75                 4574         .word      LINK
                           001913  4575 LINK = . 
      009993 05                    4576         .byte      5
      009994 27 42 4F 4F 54        4577         .ascii     "'BOOT"
      009999                       4578 TBOOT:
      009999 CD 85 B5         [ 4] 4579         CALL     DOVAR
      00999C 40 02                 4580         .word    APP_RUN      ;application to boot
                                   4581 
                                   4582 ;       COLD    ( -- )
                                   4583 ;       The hilevel cold start s=ence.
      00999E 99 93                 4584         .word      LINK
                           001920  4585         LINK = . 
      0099A0 04                    4586         .byte      4
      0099A1 43 4F 4C 44           4587         .ascii     "COLD"
      0099A5                       4588 COLD:
                           000000  4589 .if WANT_DEBUG
                                   4590         CALL DEBUG
                                   4591 .endif 
      0099A5 CD 83 D9         [ 4] 4592 COLD1:  CALL     DOLIT
      0099A8 80 A7                 4593         .word      UZERO
      0099AA CD 83 D9         [ 4] 4594 	CALL     DOLIT
      0099AD 00 06                 4595         .word      UPP
      0099AF CD 83 D9         [ 4] 4596         CALL     DOLIT
      0099B2 00 1A                 4597 	.word      UEND-UZERO
      0099B4 CD 8B 8A         [ 4] 4598         CALL     CMOVE   ;initialize user area
                                   4599 
                           000001  4600 .if PICATOUT_MOD
                                   4601 ; if APP_RUN==0 initialize with ca de 'hi'  
      0099B7 90 CE 40 02      [ 2] 4602         ldw y,APP_RUN 
      0099BB 26 0B            [ 1] 4603         jrne 0$
      0099BD 1D 00 02         [ 2] 4604         subw x,#CELLL 
      0099C0 90 AE 99 78      [ 2] 4605         ldw y,#HI  
      0099C4 FF               [ 2] 4606         ldw (x),y
      0099C5 CD 9A C0         [ 4] 4607         call UPDATRUN 
      0099C8                       4608 0$:        
                                   4609 ; update LAST with APP_LAST 
                                   4610 ; if APP_LAST > LAST else do the opposite
      0099C8 90 CE 40 00      [ 2] 4611         ldw y,APP_LAST 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      0099CC 90 B3 1A         [ 2] 4612         cpw y,ULAST 
      0099CF 22 05            [ 1] 4613         jrugt 1$ 
                                   4614 ; save LAST at APP_LAST  
      0099D1 CD 9A A8         [ 4] 4615         call UPDATLAST 
      0099D4 20 06            [ 2] 4616         jra 2$
      0099D6                       4617 1$: ; update LAST with APP_LAST 
      0099D6 90 BF 1A         [ 2] 4618         ldw ULAST,y
      0099D9 90 BF 14         [ 2] 4619         ldw UCNTXT,y
      0099DC                       4620 2$:  
                                   4621 ; update APP_CP if < app_space 
      0099DC 90 CE 40 04      [ 2] 4622         ldw y,APP_CP  
      0099E0 90 B3 18         [ 2] 4623         cpw y,UCP   
      0099E3 24 06            [ 1] 4624         jruge 3$ 
      0099E5 CD 9A D1         [ 4] 4625         call UPDATCP
      0099E8 90 BE 18         [ 2] 4626         ldw y,UCP   
      0099EB                       4627 3$:
      0099EB 90 BF 18         [ 2] 4628         ldw UCP,y                 
                                   4629 ; update UVP with APP_VP  
                                   4630 ; if APP_VP>UVP else do the opposite 
      0099EE 90 CE 40 06      [ 2] 4631         ldw y,APP_VP 
      0099F2 90 B3 16         [ 2] 4632         cpw y,UVP 
      0099F5 22 05            [ 1] 4633         jrugt 4$
      0099F7 CD 9A E8         [ 4] 4634         call UPDATVP 
      0099FA 20 03            [ 2] 4635         jra 6$
      0099FC                       4636 4$: ; update UVP with APP_VP 
      0099FC 90 BF 16         [ 2] 4637         ldw UVP,y 
      0099FF                       4638 6$:      
                                   4639 .endif ; PICATOUT_MOD
      0099FF CD 93 B9         [ 4] 4640         CALL     PRESE   ;initialize data stack and TIB
      009A02 CD 99 99         [ 4] 4641         CALL     TBOOT
      009A05 CD 8B 73         [ 4] 4642         CALL     ATEXE   ;application boot
      009A08 CD 96 82         [ 4] 4643         CALL     OVERT
      009A0B CC 93 D6         [ 2] 4644         JP     QUIT    ;start interpretation
                                   4645 
                           000001  4646 .if PICATOUT_MOD
                                   4647         ; keep this include at end 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



                                   4648         .include "flash.asm"
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
      009A0E 99 A0                   30     .word LINK 
                           001990    31     LINK=.
      009A10 03                      32     .byte 3 
      009A11 46 50 21                33     .ascii "FP!"
      009A14                         34 fptr_store:
      009A14 90 93            [ 1]   35     ldw y,x
      009A16 90 FE            [ 2]   36     ldw y,(y)
      009A18 90 9F            [ 1]   37     ld a,yl 
      009A1A B7 32            [ 1]   38     ld FPTR,a 
      009A1C 1C 00 02         [ 2]   39     addw x,#CELLL 
      009A1F 90 93            [ 1]   40     ldw y,x 
      009A21 90 FE            [ 2]   41     ldw y,(y)
      009A23 90 BF 33         [ 2]   42     ldw PTR16,y
      009A26 1C 00 02         [ 2]   43     addw x,#CELLL 
      009A29 81               [ 4]   44     ret 
                                     45 
                                     46 ;-----------------------------------
                                     47 ; return EEPROM base address 
                                     48 ; as a double 
                                     49 ;  EEPROM  ( -- ud )
                                     50 ;-----------------------------------
      009A2A 9A 10                   51     .word LINK 
                           0019AC    52 LINK=.
      009A2C 06                      53     .byte 6 
      009A2D 45 45 50 52 4F 4D       54     .ascii "EEPROM"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



      009A33                         55 EEPROM: 
      009A33 90 AE 40 00      [ 2]   56     ldw y,#EEPROM_BASE
      009A37 1D 00 04         [ 2]   57     subw x,#2*CELLL 
      009A3A EF 02            [ 2]   58     ldw (2,x),y 
      009A3C 90 5F            [ 1]   59     clrw y 
      009A3E FF               [ 2]   60     ldw (x),y 
      009A3F 81               [ 4]   61     ret
                                     62 
                                     63 ;---------------------------------
                                     64 ; return APP_LAST pointer as double
                                     65 ; EEP-LAST ( -- ud )
                                     66 ;---------------------------------
      009A40 9A 2C                   67 	.word LINK 
                           0019C2    68 	LINK=.
      009A42 08                      69 	.byte 8 
      009A43 45 45 50 2D 4C 41 53    70 	.ascii "EEP-LAST"
             54
      009A4B                         71 EEPLAST:
      009A4B 1D 00 04         [ 2]   72 	subw x,#2*CELLL 
      009A4E 90 AE 40 00      [ 2]   73 	ldw y,#APP_LAST 
      009A52 EF 02            [ 2]   74 	ldw (2,x),y 
      009A54 90 5F            [ 1]   75 	clrw y 
      009A56 FF               [ 2]   76 	ldw (x),y 
      009A57 81               [ 4]   77 	ret 
                                     78 
                                     79 ;----------------------------------
                                     80 ; return APP_RUN pointer as double	
                                     81 ; EEP-RUN ( -- ud )
                                     82 ;-----------------------------------
      009A58 9A 42                   83 	.word LINK 
                           0019DA    84 	LINK=.
      009A5A 07                      85 	.byte 7
      009A5B 45 45 50 2D 52 55 4E    86 	.ascii "EEP-RUN"
      009A62                         87 EEPRUN:
      009A62 1D 00 04         [ 2]   88 	subw x,#2*CELLL 
      009A65 90 AE 40 02      [ 2]   89 	ldw y,#APP_RUN 
      009A69 EF 02            [ 2]   90 	ldw (2,x),y 
      009A6B 90 5F            [ 1]   91 	clrw y 
      009A6D FF               [ 2]   92 	ldw (x),y 
      009A6E 81               [ 4]   93 	ret 
                                     94 
                                     95 ;------------------------------------
                                     96 ; return APP_CP pointer as double 
                                     97 ; EEP-CP ( -- ud )
                                     98 ;------------------------------------
      009A6F 9A 5A                   99 	.word LINK
                           0019F1   100 	LINK=.
      009A71 06                     101 	.byte 6 
      009A72 45 45 50 2D 43 50      102 	.ascii "EEP-CP"
      009A78                        103 EEPCP:
      009A78 1D 00 04         [ 2]  104 	subw x,#2*CELLL 
      009A7B 90 AE 40 04      [ 2]  105 	ldw y,#APP_CP  
      009A7F EF 02            [ 2]  106 	ldw (2,x),y 
      009A81 90 5F            [ 1]  107 	clrw y 
      009A83 FF               [ 2]  108 	ldw (x),y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



      009A84 81               [ 4]  109 	ret 
                                    110 
                                    111 ;------------------------------------
                                    112 ; return APP_VP pointer as double 
                                    113 ; EEP-VP ( -- ud )
                                    114 ;-------------------------------------
      009A85 9A 71                  115 	.word LINK
                           001A07   116 	LINK=.
      009A87 06                     117 	.byte 6
      009A88 45 45 50 2D 56 50      118 	.ascii "EEP-VP"
      009A8E                        119 EEPVP:
      009A8E 1D 00 04         [ 2]  120 	subw x,#2*CELLL 
      009A91 90 AE 40 06      [ 2]  121 	ldw y,#APP_VP  
      009A95 EF 02            [ 2]  122 	ldw (2,x),y 
      009A97 90 5F            [ 1]  123 	clrw y 
      009A99 FF               [ 2]  124 	ldw (x),y 
      009A9A 81               [ 4]  125 	ret 
                                    126 
                                    127 ;----------------------------------
                                    128 ; update APP_LAST with LAST 
                                    129 ; UPDAT-LAST ( -- )
                                    130 ;----------------------------------
      009A9B 9A 87                  131 	.word LINK 
                           001A1D   132 	LINK=.
      009A9D 0A                     133 	.byte 10
      009A9E 55 50 44 41 54 2D 4C   134 	.ascii "UPDAT-LAST"
             41 53 54
      009AA8                        135 UPDATLAST:
      009AA8 CD 86 74         [ 4]  136 	call LAST
      009AAB CD 84 61         [ 4]  137 	call AT  
      009AAE CD 9A 4B         [ 4]  138 	call EEPLAST
      009AB1 CC 9C 24         [ 2]  139 	jp ee_store 
                                    140 
                                    141 ;---------------------------------
                                    142 ; update APP_RUN 
                                    143 ; UPDAT-RUN ( a -- )
                                    144 ;---------------------------------
      009AB4 9A 9D                  145 	.word LINK
                           001A36   146 	LINK=.
      009AB6 09                     147 	.byte 9
      009AB7 55 50 44 41 54 2D 52   148 	.ascii "UPDAT-RUN"
             55 4E
      009AC0                        149 UPDATRUN:
      009AC0 CD 9A 62         [ 4]  150 	call EEPRUN
      009AC3 CC 9C 24         [ 2]  151 	jp ee_store 
                                    152 	
                                    153 ;---------------------------------
                                    154 ; update APP_CP with CP 
                                    155 ; UPDAT-CP ( -- )
                                    156 ;---------------------------------
      009AC6 9A B6                  157 	.word LINK 
                           001A48   158 	LINK=.
      009AC8 08                     159 	.byte 8 
      009AC9 55 50 44 41 54 2D 43   160 	.ascii "UPDAT-CP"
             50
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      009AD1                        161 UPDATCP:
      009AD1 CD 86 64         [ 4]  162 	call CPP 
      009AD4 CD 84 61         [ 4]  163 	call AT 
      009AD7 CD 9A 78         [ 4]  164 	call EEPCP 
      009ADA CC 9C 24         [ 2]  165 	jp ee_store 
                                    166 
                                    167 ;----------------------------------
                                    168 ; update APP_VP with VP 
                                    169 ; UPDAT-VP ( -- )
                                    170 ;----------------------------------
      009ADD 9A C8                  171 	.word LINK
                           001A5F   172 	LINK=.
      009ADF 08                     173 	.byte 8 
      009AE0 55 50 44 41 54 2D 56   174 	.ascii "UPDAT-VP" 
             50
      009AE8                        175 UPDATVP:
      009AE8 CD 86 56         [ 4]  176 	call VPP 
      009AEB CD 84 61         [ 4]  177 	call AT
      009AEE CD 9A 8E         [ 4]  178 	call EEPVP 
      009AF1 CC 9C 24         [ 2]  179 	jp ee_store
                                    180 	
                                    181 
                                    182 ;----------------------------------
                                    183 ; fetch integer at address over 65535
                                    184 ;  F@   ( ud -- n )
                                    185 ;----------------------------------
      009AF4 9A DF                  186     .word LINK 
                           001A76   187 LINK=.
      009AF6 02                     188     .byte 2
      009AF7 46 40                  189     .ascii "F@"
      009AF9                        190 farat:
      009AF9 CD 9A 14         [ 4]  191     call fptr_store
      009AFC 92 BC 00 32      [ 5]  192     ldf a,[FPTR]
      009B00 1D 00 02         [ 2]  193     subw x,#CELLL 
      009B03 F7               [ 1]  194     ld (x),a 
      009B04 90 AE 00 01      [ 2]  195     ldw y,#1
      009B08 91 AF 00 32      [ 1]  196     ldf a,([FPTR],y)
      009B0C E7 01            [ 1]  197     ld (1,x),a
      009B0E 81               [ 4]  198     ret 
                                    199 
                                    200 ;-------------------------------------
                                    201 ; fetch C at address over 65535 
                                    202 ; FC@ ( ud -- c)
                                    203 ;-------------------------------------
      009B0F 9A F6                  204     .word LINK
                           001A91   205     LINK=.
      009B11 03                     206     .byte 3 
      009B12 46 43 40               207     .ascii "FC@" 
      009B15                        208 farcat:
      009B15 CD 9A 14         [ 4]  209     call fptr_store 
      009B18 92 BC 00 32      [ 5]  210     ldf a,[FPTR]
      009B1C 1D 00 02         [ 2]  211     subw x,#CELLL 
      009B1F E7 01            [ 1]  212     ld (1,x),a 
      009B21 7F               [ 1]  213     clr (x)
      009B22 81               [ 4]  214     ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



                                    215     
                                    216 ;----------------------------------
                                    217 ; unlock EEPROM/OPT for writing/erasing
                                    218 ; wait endlessly for FLASH_IAPSR_DUL bit.
                                    219 ;  UNLKEE   ( -- )
                                    220 ;----------------------------------
      009B23 9B 11                  221     .word LINK 
                           001AA5   222 LINK=.
      009B25 06                     223     .byte 6 
      009B26 55 4E 4C 4B 45 45      224     .ascii "UNLKEE"
      009B2C                        225 unlock_eeprom:
      009B2C 35 00 50 5B      [ 1]  226 	mov FLASH_CR2,#0 
      009B30 35 FF 50 5C      [ 1]  227 	mov FLASH_NCR2,#0xFF 
      009B34 35 AE 50 64      [ 1]  228 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      009B38 35 56 50 64      [ 1]  229     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      009B3C 72 07 50 5F FB   [ 2]  230 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      009B41 81               [ 4]  231 	ret
                                    232 
                                    233 ;----------------------------------
                                    234 ; unlock FLASH for writing/erasing
                                    235 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                    236 ; UNLKFL  ( -- )
                                    237 ;----------------------------------
      009B42 9B 25                  238     .word LINK 
                           001AC4   239 LINK=. 
      009B44 06                     240     .byte 6 
      009B45 55 4E 4C 4B 46 4C      241     .ascii "UNLKFL"    
      009B4B                        242 unlock_flash:
      009B4B 35 00 50 5B      [ 1]  243 	mov FLASH_CR2,#0 
      009B4F 35 FF 50 5C      [ 1]  244 	mov FLASH_NCR2,#0xFF 
      009B53 35 56 50 62      [ 1]  245 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      009B57 35 AE 50 62      [ 1]  246 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      009B5B 72 03 50 5F FB   [ 2]  247 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      009B60 81               [ 4]  248 	ret
                                    249 
                                    250 ;-----------------------------
                                    251 ; unlock FLASH or EEPROM 
                                    252 ; according to FPTR address 
                                    253 ;  UNLOCK ( -- )
                                    254 ;-----------------------------
      009B61 9B 44                  255 	.word LINK 
                           001AE3   256 	LINK=.
      009B63 06                     257 	.byte 6
      009B64 55 4E 4C 4F 43 4B      258 	.ascii "UNLOCK"
      009B6A                        259 unlock:
                                    260 ; put addr[15:0] in Y, for bounds check.
      009B6A 90 BE 33         [ 2]  261 	ldw y,PTR16   ; Y=addr15:0
                                    262 ; check addr[23:16], if <> 0 then it is extened flash memory
      009B6D 3D 32            [ 1]  263 	tnz FPTR 
      009B6F 26 16            [ 1]  264 	jrne 4$
      009B71 90 A3 80 00      [ 2]  265     cpw y,#FLASH_BASE
      009B75 24 10            [ 1]  266     jruge 4$
      009B77 90 A3 40 00      [ 2]  267 	cpw y,#EEPROM_BASE  
      009B7B 25 0D            [ 1]  268     jrult 9$
      009B7D 90 A3 48 7F      [ 2]  269 	cpw y,#OPTION_END 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



      009B81 22 07            [ 1]  270 	jrugt 9$
      009B83 CD 9B 2C         [ 4]  271 	call unlock_eeprom
      009B86 81               [ 4]  272 	ret 
      009B87 CD 9B 4B         [ 4]  273 4$: call unlock_flash
      009B8A 81               [ 4]  274 9$: ret 
                                    275 
                                    276 ;-------------------------
                                    277 ; lock write access to 
                                    278 ; FLASH and EEPROM 
                                    279 ; LOCK ( -- )
                                    280 ;-------------------------
      009B8B 9B 63                  281 	.word LINK 
                           001B0D   282 	LINK=.
      009B8D 04                     283 	.byte 4 
      009B8E 4C 4F 43 4B            284 	.ascii "LOCK" 
      009B92                        285 lock: 
      009B92 72 13 50 5F      [ 1]  286 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      009B96 72 17 50 5F      [ 1]  287 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009B9A 81               [ 4]  288 	ret 
                                    289 
                                    290 ;-------------------------
                                    291 ; increment FPTR 
                                    292 ; INC-FPTR ( -- )
                                    293 ;-------------------------
      009B9B 9B 8D                  294 	.word LINK 
                           001B1D   295 	LINK=. 
      009B9D 08                     296 	.byte 8 
      009B9E 49 4E 43 2D 46 50 54   297 	.ascii "INC-FPTR" 
             52
      009BA6                        298 inc_fptr:
      009BA6 3C 34            [ 1]  299 	inc PTR8 
      009BA8 26 08            [ 1]  300 	jrne 1$
      009BAA 90 BE 32         [ 2]  301 	ldw y,FPTR 
      009BAD 90 5C            [ 2]  302 	incw y 
      009BAF 90 BF 32         [ 2]  303 	ldw FPTR,y 
      009BB2 81               [ 4]  304 1$: ret 
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
      009BB3 9B 9D                  315 	.word LINK 
                           001B35   316 	LINK=. 
      009BB5 07                     317 	.byte 7 
      009BB6 57 52 2D 42 59 54 45   318 	.ascii "WR-BYTE" 
                                    319 
      009BBD                        320 write_byte:
      009BBD 90 93            [ 1]  321 	ldw y,x 
      009BBF 90 FE            [ 2]  322 	ldw y,(y)
      009BC1 1C 00 02         [ 2]  323 	addw x,#CELLL 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      009BC4 90 9F            [ 1]  324 	ld a,yl
      009BC6 92 BD 00 32      [ 4]  325 	ldf [FPTR],a
      009BCA 72 05 50 5F FB   [ 2]  326 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009BCF 20 D5            [ 2]  327 	jra inc_fptr 
                                    328 
                                    329 
                                    330 
                                    331 ;---------------------------------------
                                    332 ; write a byte to FLASH or EEPROM/OPTION  
                                    333 ; EEC!  (c ud -- )
                                    334 ;---------------------------------------
      009BD1 9B B5                  335     .word LINK 
                           001B53   336 	LINK=.
      009BD3 04                     337     .byte 4 
      009BD4 45 45 43 21            338     .ascii "EEC!"
                                    339 	; local variables 
                           000001   340 	BTW = 1   ; byte to write offset on stack
                           000002   341     OPT = 2 
                           000002   342 	VSIZE = 2
      009BD8                        343 ee_cstore:
      009BD8 52 02            [ 2]  344 	sub sp,#VSIZE
      009BDA CD 9A 14         [ 4]  345     call fptr_store
      009BDD E6 01            [ 1]  346 	ld a,(1,x)
      009BDF 43               [ 1]  347 	cpl a 
      009BE0 6B 01            [ 1]  348 	ld (BTW,sp),a ; byte to write 
      009BE2 0F 02            [ 1]  349 	clr (OPT,sp)  ; OPTION flag
      009BE4 CD 9B 6A         [ 4]  350 	call unlock 
                                    351 	; check if option
      009BE7 3D 32            [ 1]  352 	tnz FPTR 
      009BE9 26 19            [ 1]  353 	jrne 2$
      009BEB 90 BE 33         [ 2]  354 	ldw y,PTR16 
      009BEE 90 A3 48 00      [ 2]  355 	cpw y,#OPTION_BASE
      009BF2 2B 10            [ 1]  356 	jrmi 2$
      009BF4 90 A3 48 80      [ 2]  357 	cpw y,#OPTION_END+1
      009BF8 2A 0A            [ 1]  358 	jrpl 2$
      009BFA 03 02            [ 1]  359 	cpl (OPT,sp)
                                    360 	; OPTION WRITE require this unlock 
      009BFC 72 1E 50 5B      [ 1]  361     bset FLASH_CR2,#FLASH_CR2_OPT
      009C00 72 1F 50 5C      [ 1]  362     bres FLASH_NCR2,#FLASH_CR2_OPT 
      009C04                        363 2$: 
      009C04 CD 9B BD         [ 4]  364 	call write_byte 	
      009C07 0D 02            [ 1]  365 	tnz (OPT,sp)
      009C09 27 0D            [ 1]  366 	jreq 3$ 
      009C0B 7B 01            [ 1]  367     ld a,(BTW,sp)
      009C0D 90 5F            [ 1]  368     clrw y
      009C0F 90 97            [ 1]  369 	ld yl,a 
      009C11 1D 00 02         [ 2]  370 	subw x,#CELLL 
      009C14 FF               [ 2]  371 	ldw (x),y 
      009C15 CD 9B BD         [ 4]  372 	call write_byte
      009C18                        373 3$: 
      009C18 CD 9B 92         [ 4]  374 	call lock 
      009C1B 5B 02            [ 2]  375 	addw sp,#VSIZE 
      009C1D 81               [ 4]  376     ret
                                    377 
                                    378 ;------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



                                    379 ; write integer in FLASH|EEPROM
                                    380 ; EE! ( n ud -- )
                                    381 ;------------------------------
      009C1E 9B D3                  382 	.word LINK 
                           001BA0   383 	LINK=.
      009C20 03                     384 	.byte 3 
      009C21 45 45 21               385 	.ascii "EE!"
      009C24                        386 ee_store:
      009C24 CD 9A 14         [ 4]  387 	call fptr_store 
      009C27 CD 9B 6A         [ 4]  388 	call unlock 
      009C2A 90 93            [ 1]  389 	ldw y,x 
      009C2C 90 FE            [ 2]  390 	ldw y,(y)
      009C2E 90 89            [ 2]  391 	pushw y 
      009C30 90 5E            [ 1]  392 	swapw y 
      009C32 FF               [ 2]  393 	ldw (x),y 
      009C33 CD 9B BD         [ 4]  394 	call write_byte 
      009C36 90 85            [ 2]  395 	popw y 
      009C38 1D 00 02         [ 2]  396 	subw x,#CELLL
      009C3B FF               [ 2]  397 	ldw (x),y 
      009C3C CD 9B BD         [ 4]  398 	call write_byte
      009C3F CC 9B 92         [ 2]  399 	jp lock 
                                    400 
                                    401 
                                    402 ;----------------------------
                                    403 ; Erase flash memory row 
                                    404 ; stm8s208 as 128 bytes rows
                                    405 ; ROW-ERASE ( ud -- )
                                    406 ;----------------------------
      009C42 9C 20                  407 	.word LINK 
                           001BC4   408 	LINK=. 
      009C44 09                     409 	.byte 9 
      009C45 52 4F 57 2D 45 52 41   410 	.ascii "ROW-ERASE" 
             53 45
      009C4E                        411 row_erase:
      009C4E CD 9A 14         [ 4]  412 	call fptr_store
                                    413 ;code must be execute from RAM 
                                    414 ;copy routine to PAD 
      009C51 1D 00 02         [ 2]  415 	subw x,#CELLL 
      009C54 90 AE 9C 9B      [ 2]  416 	ldw y,#row_erase_proc
      009C58 FF               [ 2]  417 	ldw (x),y 
      009C59 CD 8B 4E         [ 4]  418 	call PAD 
      009C5C 90 AE 9C C2      [ 2]  419 	ldw y,#row_erase_proc_end 
      009C60 72 A2 9C 9B      [ 2]  420 	subw y,#row_erase_proc
      009C64 1D 00 02         [ 2]  421 	subw x,#CELLL 
      009C67 FF               [ 2]  422 	ldw (x),y 
      009C68 CD 8B 8A         [ 4]  423 	call CMOVE 
      009C6B                        424 block_erase:
      009C6B 90 BE 33         [ 2]  425 	ldw y,FPTR+1
      009C6E 90 A3 A1 00      [ 2]  426 	cpw y,#app_space 
      009C72 2A 13            [ 1]  427 	jrpl erase_flash 
                                    428 ; erase EEPROM block
      009C74 90 A3 40 00      [ 2]  429 	cpw y,#EEPROM_BASE 
      009C78 24 01            [ 1]  430 	jruge 1$
      009C7A 81               [ 4]  431 	ret ; bad address 
      009C7B 90 A3 47 FF      [ 2]  432 1$: cpw y,#EEPROM_END 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



      009C7F 23 01            [ 2]  433 	jrule 2$ 
      009C81 81               [ 4]  434 	ret ; bad address 
      009C82                        435 2$:	
      009C82 CD 9B 2C         [ 4]  436 	call unlock_eeprom 
      009C85 20 03            [ 2]  437 	jra proceed_erase
                                    438 ; erase flash block:
      009C87                        439 erase_flash:
      009C87 CD 9B 4B         [ 4]  440 	call unlock_flash 
      009C8A                        441 proceed_erase:
      009C8A CD 8B 4E         [ 4]  442 	call PAD 
      009C8D 90 93            [ 1]  443 	ldw y,x
      009C8F 90 FE            [ 2]  444 	ldw y,(y)
      009C91 1C 00 02         [ 2]  445 	addw x,#CELLL  
      009C94 90 FD            [ 4]  446 	call (y) 
      009C96 72 17 50 5F      [ 1]  447 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009C9A 81               [ 4]  448 	ret 
                                    449 
                                    450 ; this routine is to be copied to PAD 
      009C9B                        451 row_erase_proc:
      009C9B 35 20 50 5B      [ 1]  452 	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
      009C9F 35 DF 50 5C      [ 1]  453 	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
      009CA3 4F               [ 1]  454 	clr a 
      009CA4 90 5F            [ 1]  455 	clrw y 
      009CA6 91 A7 00 32      [ 1]  456 	ldf ([FPTR],y),a
      009CAA 90 5C            [ 2]  457     incw y
      009CAC 91 A7 00 32      [ 1]  458 	ldf ([FPTR],y),a
      009CB0 90 5C            [ 2]  459     incw y
      009CB2 91 A7 00 32      [ 1]  460 	ldf ([FPTR],y),a
      009CB6 90 5C            [ 2]  461     incw y
      009CB8 91 A7 00 32      [ 1]  462 	ldf ([FPTR],y),a
      009CBC 72 05 50 5F FB   [ 2]  463 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009CC1 81               [ 4]  464 	ret
      009CC2                        465 row_erase_proc_end:
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
      009CC2                        478 copy_buffer:
      009CC2 4B 80            [ 1]  479 	push #BLOCK_SIZE  
                                    480 ;enable block programming 
      009CC4 72 10 50 5B      [ 1]  481 	bset FLASH_CR2,#FLASH_CR2_PRG 
      009CC8 72 11 50 5C      [ 1]  482 	bres FLASH_NCR2,#FLASH_CR2_PRG
      009CCC 90 5F            [ 1]  483 	clrw y
      009CCE F6               [ 1]  484 1$:	ld a,(x)
      009CCF 91 A7 00 32      [ 1]  485 	ldf ([FPTR],y),a
      009CD3 5C               [ 2]  486 	incw x 
      009CD4 90 5C            [ 2]  487 	incw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



      009CD6 0A 01            [ 1]  488 	dec (BCNT,sp)
      009CD8 26 F4            [ 1]  489 	jrne 1$
                                    490 ; wait EOP bit 
      009CDA 72 05 50 5F FB   [ 2]  491 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. 
      009CDF 84               [ 1]  492 	pop a ; remove BCNT from stack 
      009CE0 81               [ 4]  493 	ret 
      009CE1                        494 copy_buffer_end:
                                    495 
                                    496 ;-------------------------
                                    497 ; move program_row to RAM 
                                    498 ; in TIB 
                                    499 ;------------------------
      009CE1                        500 copy_prog_to_ram:
      009CE1 1D 00 06         [ 2]  501 	subw x,#6
      009CE4 90 AE 9C C2      [ 2]  502 	ldw y,#copy_buffer 
      009CE8 EF 04            [ 2]  503 	ldw (4,x),y 
      009CEA 90 AE 17 00      [ 2]  504 	ldw y,#TIBBASE
      009CEE EF 02            [ 2]  505 	ldw (2,x),y 
      009CF0 90 AE 9C E1      [ 2]  506 	ldw y,#copy_buffer_end 
      009CF4 72 A2 9C C2      [ 2]  507 	subw y,#copy_buffer  
      009CF8 FF               [ 2]  508 	ldw (x),y 
      009CF9 CD 8B 8A         [ 4]  509 	call CMOVE 
      009CFC 81               [ 4]  510 	ret 
                                    511 
                                    512 
                                    513 ;-----------------------------
                                    514 ; write a row in FLASH/EEPROM 
                                    515 ; WR-ROW ( a ud -- )
                                    516 ; a -> address 128 byte buffer to write 
                                    517 ; ud ->  row address in FLASH|EEPROM 
                                    518 ;-----------------------------
      009CFD 9C 44                  519 	.word LINK 
                           001C7F   520 	LINK=.
      009CFF 06                     521 	.byte 6 
      009D00 57 52 2D 52 4F 57      522 	.ascii "WR-ROW"
      009D06                        523 write_row:
      009D06 CD 9A 14         [ 4]  524 	call fptr_store
                                    525 ; align to FLASH block 
      009D09 A6 80            [ 1]  526 	ld a,#0x80 
      009D0B B4 34            [ 1]  527 	and a,PTR8 
      009D0D B7 34            [ 1]  528 	ld PTR8,a  
      009D0F CD 9C E1         [ 4]  529 	call copy_prog_to_ram
      009D12 CD 9B 6A         [ 4]  530 	call unlock
      009D15 90 93            [ 1]  531 	ldw y,x 
      009D17 90 FE            [ 2]  532 	ldw y,(y)
      009D19 1C 00 02         [ 2]  533 	addw x,#CELLL 
      009D1C 89               [ 2]  534 	pushw x 
      009D1D 93               [ 1]  535 	ldw x,y ; buffer address in x 
      009D1E CD 17 00         [ 4]  536 	call TIBBASE
      009D21 CD 9B 92         [ 4]  537 	call lock
      009D24 85               [ 2]  538 	popw x 
      009D25 81               [ 4]  539 	ret 
                                    540 
                                    541 ;-------------------------------------
                                    542 ; change value of OPTION register 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



                                    543 ; SET-OPT (c n -- ) 
                                    544 ; c new value.
                                    545 ; n OPT  number {1..7}
                                    546 ;--------------------------------------
      009D26 9C FF                  547 		.word LINK 
                           001CA8   548 		LINK=.
      009D28 07                     549 		.byte 7 
      009D29 53 45 54 2D 4F 50 54   550 		.ascii "SET-OPT" 
      009D30                        551 set_option: 
      009D30 90 93            [ 1]  552 		ldw y,x 
      009D32 90 FE            [ 2]  553 		ldw y,(y)
      009D34 27 06            [ 1]  554 		jreq 1$
      009D36 90 A3 00 07      [ 2]  555 		cpw y,#7 
      009D3A 23 04            [ 2]  556 		jrule 2$ 
                                    557 ; invalid OPTION number 		
      009D3C 1C 00 04         [ 2]  558 1$:		addw x,#2*CELLL
      009D3F 81               [ 4]  559 		ret
      009D40 90 58            [ 2]  560 2$:		sllw y 
      009D42 72 A9 47 FF      [ 2]  561 		addw y,#OPTION_BASE-1
      009D46 FF               [ 2]  562 		ldw (x),y 
      009D47 1D 00 02         [ 2]  563 		subw x,#CELLL 
      009D4A 90 5F            [ 1]  564 		clrw y 
      009D4C FF               [ 2]  565 		ldw (x),y 
      009D4D CD 9B D8         [ 4]  566 		call ee_cstore
      009D50 81               [ 4]  567 		ret 
                                    568 
                                    569 
                                    570 
                                    571 ;--------------------------------------
                                    572 ; reset system to its original state 
                                    573 ; before any user modification
                                    574 ; PRISTINE ( -- )
                                    575 ;-------------------------------------
      009D51 9D 28                  576 	.word LINK  
                           001CD3   577 	LINK=.
      009D53 08                     578 	.byte 8 
      009D54 50 52 49 53 54 49 4E   579 	.ascii "PRISTINE"
             45
      009D5C                        580 pristine:
                                    581 ;;; erase EEPROM
      009D5C CD 9A 33         [ 4]  582 	call EEPROM 
      009D5F CD 86 EE         [ 4]  583 1$:	call DDUP 
      009D62 CD 9C 4E         [ 4]  584 	call row_erase
      009D65 90 93            [ 1]  585 	ldw y,x 
      009D67 90 EE 02         [ 2]  586 	ldw y,(2,y)
      009D6A 72 A9 00 80      [ 2]  587 	addw y,#BLOCK_SIZE
      009D6E EF 02            [ 2]  588 	ldw (2,x),y
      009D70 90 A3 48 00      [ 2]  589 	cpw y,#OPTION_BASE 
      009D74 25 E9            [ 1]  590 	jrult 1$
                                    591 ;;; reset OPTION to default values
      009D76 90 AE 00 01      [ 2]  592 	ldw y,#1 ; OPT1 
      009D7A FF               [ 2]  593 2$:	ldw (x),y   
      009D7B 90 5F            [ 1]  594 	clrw y 
      009D7D EF 02            [ 2]  595 	ldw (2,x),y  ; ( 0 1 -- ) 
      009D7F CD 86 EE         [ 4]  596 	call DDUP    ; ( 0 1 0 1 -- )  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



      009D82 CD 9D 30         [ 4]  597 	call set_option
      009D85 90 93            [ 1]  598 	ldw y,x 
      009D87 90 FE            [ 2]  599 	ldw y,(y)
      009D89 90 5C            [ 2]  600 	incw y  ; next OPTION 
      009D8B 90 A3 00 08      [ 2]  601 	cpw y,#8 
      009D8F 25 E9            [ 1]  602 	jrult 2$
                                    603 ;;; erase first row of app_space 	
      009D91 90 AE A1 00      [ 2]  604 	ldw y,#app_space
      009D95 EF 02            [ 2]  605 	ldw (2,x),y  
      009D97 90 5F            [ 1]  606 	clrw y 
      009D99 FF               [ 2]  607 	ldw (x),y ; ( app_space 0 -- )
      009D9A CD 9C 4E         [ 4]  608 	call row_erase 
                                    609 ; reset interrupt vectors 
      009D9D 1D 00 02         [ 2]  610 	subw x,#CELLL 
      009DA0 90 5F            [ 1]  611 	clrw y  
      009DA2 FF               [ 2]  612 4$:	ldw (x),y  ; ( n -- ) int# 
      009DA3 CD 85 08         [ 4]  613 	call DUPP  
      009DA6 CD 9D C3         [ 4]  614 	call reset_vector
      009DA9 90 93            [ 1]  615 	ldw y,x 
      009DAB 90 FE            [ 2]  616 	ldw y,(y)
      009DAD 90 5C            [ 2]  617 	incw y   ; next vector 
      009DAF 90 A3 00 19      [ 2]  618 	cpw y,#25 
      009DB3 25 ED            [ 1]  619 	jrult 4$
      009DB5 CC 80 80         [ 2]  620 	jp NonHandledInterrupt ; reset MCU
                                    621 
                                    622 ;------------------------------
                                    623 ; reset an interrupt vector 
                                    624 ; to its initial value 
                                    625 ; i.e. NonHandledInterrupt
                                    626 ; RST-IVEC ( n -- )
                                    627 ;-----------------------------
      009DB8 9D 53                  628 	.word LINK 
                           001D3A   629 	LINK=. 
      009DBA 08                     630 	.byte 8 
      009DBB 52 53 54 2D 49 56 45   631 	.ascii "RST-IVEC"
             43
      009DC3                        632 reset_vector:
      009DC3 90 93            [ 1]  633 	ldw y,x
      009DC5 1C 00 02         [ 2]  634 	addw x,#CELLL 
      009DC8 90 FE            [ 2]  635 	ldw y,(y)
      009DCA 90 A3 00 17      [ 2]  636 	cpw y,#23 
      009DCE 27 3A            [ 1]  637 	jreq 9$
      009DD0 90 A3 00 1D      [ 2]  638 	cpw y,#29 ; last vector
      009DD4 22 34            [ 1]  639 	jrugt 9$  
      009DD6 90 58            [ 2]  640 	sllw y 
      009DD8 90 58            [ 2]  641 	sllw y 
      009DDA 72 A9 80 08      [ 2]  642 	addw y,#0x8008 ; irq0 address 
      009DDE 90 BF 24         [ 2]  643 	ldw YTEMP,y
      009DE1 1D 00 06         [ 2]  644 	subw x,#3*CELLL 
      009DE4 EF 02            [ 2]  645 	ldw (2,x),y 
      009DE6 90 5F            [ 1]  646 	clrw y
      009DE8 FF               [ 2]  647 	ldw (x),y 
      009DE9 A6 82            [ 1]  648 	ld a,#0x82 
      009DEB 90 95            [ 1]  649 	ld yh,a
      009DED EF 04            [ 2]  650 	ldw (4,x),y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



      009DEF CD 9C 24         [ 4]  651 	call ee_store
      009DF2 1D 00 06         [ 2]  652 	subw x,#3*CELLL
      009DF5 90 5F            [ 1]  653 	clrw y 
      009DF7 FF               [ 2]  654 	ldw (x),y 
      009DF8 90 AE 80 80      [ 2]  655 	ldw y,#NonHandledInterrupt
      009DFC EF 04            [ 2]  656 	ldw (4,x),y 
      009DFE 90 BE 24         [ 2]  657 	ldw y,YTEMP  
      009E01 72 A9 00 02      [ 2]  658 	addw y,#2
      009E05 EF 02            [ 2]  659 	ldw (2,x),y 
      009E07 CD 9C 24         [ 4]  660 	call ee_store
      009E0A 81               [ 4]  661 9$:	ret 
                                    662 
                                    663 
                                    664 ;------------------------------
                                    665 ; all interrupt vector with 
                                    666 ; an address >= a are resetted 
                                    667 ; to default
                                    668 ; CHKIVEC ( a -- )
                                    669 ;------------------------------
      009E0B 9D BA                  670 	.word LINK 
                           001D8D   671 	LINK=.
      009E0D 07                     672 	.byte 7
      009E0E 43 48 4B 49 56 45 43   673 	.ascii "CHKIVEC"
                                    674 ;local variables 
                           000001   675 	SSP=1
                           000003   676 	CADR=3
                           000005   677 	OFS=5
                           000006   678 	VSIZE=6  
      009E15                        679 CHKIVEC:
      009E15 52 06            [ 2]  680 	sub sp,#VSIZE ;alloc local variables 
      009E17 90 93            [ 1]  681 	ldw y,x 
      009E19 90 FE            [ 2]  682 	ldw y,(y)
      009E1B 17 03            [ 2]  683 	ldw (CADR,sp),y ; ca 
      009E1D 1F 01            [ 2]  684 	ldw (SSP,sp),x 
      009E1F AE 80 0A         [ 2]  685 	ldw x,#0x800a ; irq0 address 
      009E22 BF 33            [ 2]  686 	ldw PTR16,X
      009E24 AE FF FC         [ 2]  687 	ldw x,#-4 
      009E27 1C 00 04         [ 2]  688 1$:	addw x,#4
      009E2A A3 00 78         [ 2]  689 	cpw x,#30*4 ; irq0-29 
      009E2D 27 22            [ 1]  690 	jreq 9$
      009E2F 90 93            [ 1]  691 	ldw y,x  
      009E31 91 D6 33         [ 4]  692 	ld a,([PTR16],y)
      009E34 11 03            [ 1]  693 	cp a,(CADR,sp)
      009E36 25 EF            [ 1]  694 	jrult 1$
      009E38 90 5C            [ 2]  695 	incw y 
      009E3A 91 D6 33         [ 4]  696 	ld a,([PTR16],y)
      009E3D 11 04            [ 1]  697 	cp a,(CADR+1,sp) 
      009E3F 25 E6            [ 1]  698 	jrult 1$ 
      009E41 1F 05            [ 2]  699 	ldw (OFS,sp),x 
      009E43 54               [ 2]  700 	srlw x
      009E44 54               [ 2]  701 	srlw x 
      009E45 90 93            [ 1]  702 	ldw y,x 
      009E47 1E 01            [ 2]  703 	ldw x,(SSP,sp)
      009E49 FF               [ 2]  704 	ldw (x),y
      009E4A CD 9D C3         [ 4]  705 	call reset_vector
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



      009E4D 1E 05            [ 2]  706 	ldw x,(OFS,sp) 
      009E4F 20 D6            [ 2]  707 	jra 1$
      009E51 1E 01            [ 2]  708 9$:	ldw x,(SSP,sp) 
      009E53 1C 00 02         [ 2]  709 	addw x,#CELLL 
      009E56 5B 06            [ 2]  710 	addw sp,#VSIZE ; drop local variables  
      009E58 81               [ 4]  711 	ret 
                                    712 
                                    713 ;------------------------------
                                    714 ; set interrupt vector 
                                    715 ; SET-IVEC ( ud n -- )
                                    716 ;  ud Handler address
                                    717 ;  n  vector # 0 .. 29 
                                    718 ;-----------------------------
      009E59 9E 0D                  719 	.word LINK
                           001DDB   720 	LINK=.
      009E5B 08                     721 	.byte 8 
      009E5C 53 45 54 2D 49 56 45   722 	.ascii "SET-IVEC" 
             43
      009E64                        723 set_vector:
      009E64 90 93            [ 1]  724     ldw y,x 
      009E66 1C 00 02         [ 2]  725 	addw x,#CELLL 
      009E69 90 FE            [ 2]  726 	ldw y,(y) ; vector #
      009E6B 90 A3 00 1D      [ 2]  727 	cpw y,#29 ; last vector
      009E6F 23 04            [ 2]  728 	jrule 2$
      009E71 1C 00 04         [ 2]  729 	addw x,#2*CELLL 
      009E74 81               [ 4]  730 	ret
      009E75 90 58            [ 2]  731 2$:	sllw y 
      009E77 90 58            [ 2]  732 	sllw y 
      009E79 72 A9 80 08      [ 2]  733 	addw y,#0X8008 ; IRQ0 vector address 
      009E7D 90 BF 24         [ 2]  734 	ldw YTEMP,y ; vector address 
      009E80 A6 82            [ 1]  735 	ld a,#0x82 
      009E82 90 95            [ 1]  736 	ld yh,a 
      009E84 E6 01            [ 1]  737 	ld a,(1,x) ; isr address bits 23..16 
      009E86 90 97            [ 1]  738 	ld yl,a 
                                    739 ;  write 0x82 + most significant byte of int address	
      009E88 1D 00 06         [ 2]  740 	subw x,#3*CELLL 
      009E8B EF 04            [ 2]  741 	ldw (4,x),y 
      009E8D 90 BE 24         [ 2]  742 	ldw y,YTEMP
      009E90 EF 02            [ 2]  743 	ldw (2,x),y ; vector address 
      009E92 90 5F            [ 1]  744 	clrw y 
      009E94 FF               [ 2]  745 	ldw (x),y   ; as a double 
      009E95 CD 9C 24         [ 4]  746 	call ee_store 
      009E98 90 93            [ 1]  747 	ldw y,x 
      009E9A 90 EE 02         [ 2]  748 	ldw y,(2,y) ; bits 15..0 int vector 
      009E9D 1D 00 06         [ 2]  749 	subw x,#3*CELLL 
      009EA0 EF 04            [ 2]  750 	ldw (4,x),y 
      009EA2 90 BE 24         [ 2]  751 	ldw y,YTEMP 
      009EA5 72 A9 00 02      [ 2]  752 	addw y,#2 
      009EA9 EF 02            [ 2]  753 	ldw (2,x),y 
      009EAB 90 5F            [ 1]  754 	clrw y 
      009EAD FF               [ 2]  755 	ldw (x),y 
      009EAE CD 9C 24         [ 4]  756 	call ee_store
      009EB1 1C 00 04         [ 2]  757 	addw x,#2*CELLL  
      009EB4 81               [ 4]  758 9$: ret 
                                    759 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



                                    760 
                                    761 ;------------------------
                                    762 ; Compile word to flash
                                    763 ; EE, (w -- )
                                    764 ;-----------------------
      009EB5 9E 5B                  765 	.word LINK
                           001E37   766 	LINK=.
      009EB7 03                     767 	.byte 3
      009EB8 45 45 2C               768 	.ascii "EE,"
      009EBB                        769 ee_comma:
      009EBB 1D 00 04         [ 2]  770 	subw x,#2*CELLL 
      009EBE 90 BE 18         [ 2]  771 	ldw y,UCP
      009EC1 90 89            [ 2]  772 	pushw y 
      009EC3 EF 02            [ 2]  773 	ldw (2,x),y 
      009EC5 90 5F            [ 1]  774 	clrw y 
      009EC7 FF               [ 2]  775 	ldw (x),y
      009EC8 CD 9C 24         [ 4]  776 	call ee_store
      009ECB 90 85            [ 2]  777 	popw y 
      009ECD 72 A9 00 02      [ 2]  778 	addw y,#2
      009ED1 90 BF 18         [ 2]  779 	ldw UCP,y
      009ED4 81               [ 4]  780 	ret 
                                    781 
                                    782 ;-------------------------
                                    783 ; Compile byte to flash 
                                    784 ; EEC, ( c -- )	
                                    785 ;-------------------------
      009ED5 9E B7                  786 	.word LINK 
                           001E57   787 	LINK=.
      009ED7 04                     788 	.byte 4 
      009ED8 45 45 43 2C            789 	.ascii "EEC,"
      009EDC                        790 ee_ccomma:
      009EDC 1D 00 04         [ 2]  791 	subw x,#2*CELLL 
      009EDF 90 BE 18         [ 2]  792 	ldw y,UCP
      009EE2 90 89            [ 2]  793 	pushw y 
      009EE4 EF 02            [ 2]  794 	ldw (2,x),y 
      009EE6 90 5F            [ 1]  795 	clrw y 
      009EE8 FF               [ 2]  796 	ldw (x),y
      009EE9 CD 9B D8         [ 4]  797 	call ee_cstore
      009EEC 90 85            [ 2]  798 	popw y 
      009EEE 90 5C            [ 2]  799 	incw y 
      009EF0 90 BF 18         [ 2]  800 	ldw UCP,y
      009EF3 81               [ 4]  801 	ret 
                                    802 
                                    803 
                                    804 ;--------------------------
                                    805 ; copy FLASH block to ROWBUF
                                    806 ; ROW2BUF ( ud -- )
                                    807 ;--------------------------
      009EF4 9E D7                  808 	.word LINK 
                           001E76   809 	LINK=.
      009EF6 07                     810 	.byte 7 
      009EF7 52 4F 57 32 42 55 46   811 	.ascii "ROW2BUF"
      009EFE                        812 ROW2BUF: 
      009EFE CD 9A 14         [ 4]  813 	call fptr_store 
      009F01 A6 80            [ 1]  814 	ld a,#BLOCK_SIZE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



      009F03 88               [ 1]  815 	push a 
      009F04 B4 34            [ 1]  816 	and a,PTR8 ; block align 
      009F06 B7 34            [ 1]  817 	ld PTR8,a
      009F08 90 AE 16 80      [ 2]  818 	ldw y,#ROWBUFF 
      009F0C 92 BC 00 32      [ 5]  819 1$: ldf a,[FPTR]
      009F10 90 F7            [ 1]  820 	ld (y),a
      009F12 CD 9B A6         [ 4]  821 	call inc_fptr
      009F15 90 5C            [ 2]  822 	incw y 
      009F17 0A 01            [ 1]  823 	dec (1,sp)
      009F19 26 F1            [ 1]  824 	jrne 1$ 
      009F1B 84               [ 1]  825 	pop a 
      009F1C 81               [ 4]  826 	ret 
                                    827 
                                    828 
                                    829 ;---------------------------
                                    830 ; copy ROWBUFF to flash 
                                    831 ; BUF2ROW ( ud -- )
                                    832 ; ud is row address as double 
                                    833 ;---------------------------
      009F1D 9E F6                  834 	.word LINK 
                           001E9F   835 	LINK=.
      009F1F 07                     836 	.byte 7 
      009F20 42 55 46 32 52 4F 57   837 	.ascii "BUF2ROW" 
      009F27                        838 BUF2ROW:
      009F27 CD 86 03         [ 4]  839 	call TBUF ; ( ud rb -- )
      009F2A CD 86 C3         [ 4]  840 	call ROT 
      009F2D CD 86 C3         [ 4]  841 	call ROT  ; ( rb ud -- )
      009F30 CD 9D 06         [ 4]  842 	call write_row 
      009F33 81               [ 4]  843 	ret 
                                    844 
                                    845 ;---------------------------------
                                    846 ; how many byte free in that row 
                                    847 ; RFREE ( a -- n )
                                    848 ; a is least byte of target address
                                    849 ;----------------------------------
      009F34 9F 1F                  850 	.word LINK 
                           001EB6   851 	LINK=.
      009F36 05                     852 	.byte 5 
      009F37 52 46 52 45 45         853 	.ascii "RFREE"
      009F3C                        854 RFREE:
      009F3C E6 01            [ 1]  855 	ld a,(1,x)
      009F3E A4 7F            [ 1]  856 	and a,#BLOCK_SIZE-1 
      009F40 B7 24            [ 1]  857 	ld YTEMP,a 
      009F42 A6 80            [ 1]  858 	ld a,#BLOCK_SIZE 
      009F44 B0 24            [ 1]  859 	sub a,YTEMP 
      009F46 90 5F            [ 1]  860 	clrw y 
      009F48 90 97            [ 1]  861 	ld yl,a
      009F4A FF               [ 2]  862 	ldw (x),y 
      009F4B 81               [ 4]  863 	ret 
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
      009F4C 9F 36                  874 	.word LINK 
                           001ECE   875 	LINK=. 
      009F4E 06                     876 	.byte 6
      009F4F 52 41 4D 32 45 45      877 	.ascii "RAM2EE"
                                    878 	
      009F55                        879 RAM2EE:
                                    880 ; copy ud on top 
      009F55 90 93            [ 1]  881 	ldw y,x 
      009F57 90 EE 06         [ 2]  882 	ldw y,(6,y) ; LSW of ud  
      009F5A 90 BF 24         [ 2]  883 	ldw YTEMP,y 
      009F5D 90 93            [ 1]  884 	ldw y,x 
      009F5F 90 EE 04         [ 2]  885 	ldw y,(4,y)  ; MSW of ud 
      009F62 1D 00 04         [ 2]  886 	subw x,#2*CELLL 
      009F65 FF               [ 2]  887 	ldw (x),y 
      009F66 90 BE 24         [ 2]  888 	ldw y,YTEMP 
      009F69 EF 02            [ 2]  889 	ldw (2,x),y 
      009F6B CD 9E FE         [ 4]  890 	call ROW2BUF 
      009F6E 90 93            [ 1]  891 	ldw y,x 
      009F70 90 EE 06         [ 2]  892 	ldw y,(6,y)
      009F73 90 89            [ 2]  893 	pushw y ; udl 
      009F75 90 9F            [ 1]  894 	ld a,yl
      009F77 A4 7F            [ 1]  895 	and a,#BLOCK_SIZE-1 
      009F79 90 5F            [ 1]  896 	clrw y 
      009F7B 90 97            [ 1]  897 	ld yl,a 
      009F7D 72 A9 16 80      [ 2]  898 	addw y,#ROWBUFF 
      009F81 1D 00 02         [ 2]  899 	subw x,#CELLL 
      009F84 FF               [ 2]  900 	ldw (x),y  
      009F85 CD 85 18         [ 4]  901 	call SWAPP ;  ( ud a ra u -- )
      009F88 CD 84 B2         [ 4]  902 	call RFROM  
      009F8B CD 9F 3C         [ 4]  903 	call RFREE 
      009F8E CD 88 03         [ 4]  904 	call MIN
      009F91 CD 85 08         [ 4]  905 	call DUPP 
      009F94 CD 84 D1         [ 4]  906 	call TOR  
      009F97 CD 8B 8A         [ 4]  907 	call CMOVE
      009F9A CD 9F 27         [ 4]  908 	call BUF2ROW 
      009F9D CD 84 B2         [ 4]  909 	call RFROM 
      009FA0 81               [ 4]  910 	ret 
                                    911 
                                    912 ;--------------------------
                                    913 ; expand 16 bit address 
                                    914 ; to 32 bit address 
                                    915 ; FADDR ( a -- ud )
                                    916 ;--------------------------
      009FA1 9F 4E                  917 	.word LINK 
                           001F23   918 	LINK=. 
      009FA3 05                     919 	.byte 5 
      009FA4 46 41 44 44 52         920 	.ascii "FADDR"
      009FA9                        921 FADDR:
      009FA9 CC 8A 4E         [ 2]  922 	jp ZERO 
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
      009FAC 9F A3                  938 	.word LINK 
                           001F2E   939 	LINK=.
      009FAE 05                     940 	.byte 5 
      009FAF 46 4D 4F 56 45         941 	.ascii "FMOVE" 
      009FB4                        942 FMOVE:
      009FB4 CD 86 15         [ 4]  943 	call TFLASH 
      009FB7 CD 84 61         [ 4]  944 	CALL AT 
      009FBA CD 84 0C         [ 4]  945 	CALL QBRAN 
      009FBD A0 38                  946 	.word no_move  
      009FBF CD 86 64         [ 4]  947 	call CPP
      009FC2 CD 84 61         [ 4]  948 	call AT  
      009FC5 CD 85 08         [ 4]  949 	call DUPP ; ( udl udl -- )
      009FC8 CD 86 48         [ 4]  950 	call CNTXT 
      009FCB CD 84 61         [ 4]  951 	call AT 
      009FCE CD 83 D9         [ 4]  952 	call DOLIT 
      009FD1 00 02                  953 	.word 2 
      009FD3 CD 87 61         [ 4]  954 	call SUBB ; ( udl udl a -- )
      009FD6 CD 85 18         [ 4]  955 	call SWAPP 
      009FD9 CD 9F A9         [ 4]  956 	call FADDR 
      009FDC CD 86 C3         [ 4]  957 	call ROT  ; ( udl ud a -- )
      009FDF CD 85 08         [ 4]  958 	call DUPP 
      009FE2 CD 84 D1         [ 4]  959 	call TOR    ; R: a 
      009FE5                        960 FMOVE2: 
      009FE5 CD 8B 3D         [ 4]  961 	call HERE 
      009FE8 CD 84 C5         [ 4]  962 	call RAT 
      009FEB CD 87 61         [ 4]  963 	call SUBB ; (udl ud a wl -- )
      009FEE                        964 next_row:
      009FEE CD 85 08         [ 4]  965 	call DUPP 
      009FF1 CD 84 D1         [ 4]  966 	call TOR  ; ( udl ud a wl -- ) R: a wl
      009FF4 CD 9F 55         [ 4]  967 	call RAM2EE ; ( udl a u -- udl u2 ) u2 is byte written to FLASH 
      009FF7 CD 85 08         [ 4]  968 	call DUPP 
      009FFA CD 84 D1         [ 4]  969 	call TOR
      009FFD CD 87 03         [ 4]  970 	call PLUS  ; ( udl+ ) 
      00A000 CD 85 08         [ 4]  971 	call DUPP 
      00A003 CD 8A 4E         [ 4]  972 	call ZERO   ; ( udl+ ud -- )
      00A006 CD 84 B2         [ 4]  973 	call RFROM  ; ( udl+ ud u2  R: a wl ) 
      00A009 CD 84 B2         [ 4]  974 	call RFROM  ; ( udl+ ud u2 wl R: a ) 
      00A00C CD 85 32         [ 4]  975 	call OVER   ; ( udl+ ud u2 wl u2 -- )
      00A00F CD 87 61         [ 4]  976 	call SUBB  ; ( udl+ ud u2 wl- R: a )
      00A012 CD 85 08         [ 4]  977 	call DUPP 
      00A015 CD 84 0C         [ 4]  978 	call QBRAN
      00A018 A0 31                  979 	.word fmove_done 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      00A01A CD 85 18         [ 4]  980 	call SWAPP  ; ( udl+ ud wl- u2 R: a )
      00A01D CD 84 B2         [ 4]  981 	call RFROM ; ( udl+ ud wl- u2 a -- ) 
      00A020 CD 87 03         [ 4]  982 	call PLUS  ; ( udl+2 ud wl- a+ )
      00A023 CD 85 08         [ 4]  983 	call DUPP 
      00A026 CD 84 D1         [ 4]  984 	call TOR   ; ( udl+2 ud wl- a+ ) R: a+
      00A029 CD 85 18         [ 4]  985 	call SWAPP 
      00A02C CD 84 23         [ 4]  986 	call BRAN
      00A02F 9F EE                  987 	.word next_row  
      00A031                        988 fmove_done:	
      00A031 CD 84 B2         [ 4]  989 	call RFROM  ; ( -- udl+ ud u2 wl- a  )
      00A034 1C 00 0A         [ 2]  990 	addw x,#5*CELLL ; (  -- udl+ ) new CP 
      00A037 81               [ 4]  991  	ret  
      00A038                        992 no_move:
      00A038 CD 8A 4E         [ 4]  993 	call ZERO
      00A03B 81               [ 4]  994 	ret 
                                    995 
                                    996 ;------------------------------------------
                                    997 ; adjust pointers after **FMOVE** operetion.
                                    998 ; UPDAT-PTR ( cp+ -- )
                                    999 ; cp+ is new CP position after FMOVE 
                                   1000 ;-------------------------------------------
      00A03C 9F AE                 1001 	.word LINK 
                           001FBE  1002 	LINK=.
      00A03E 09                    1003 	.byte 9
      00A03F 55 50 44 41 54 2D 50  1004 	.ascii "UPDAT-PTR" 
             54 52
      00A048                       1005 UPDATPTR:
                                   1006 ;reset VP to previous position  
      00A048 CD 9A 8E         [ 4] 1007 	call EEPVP 
      00A04B CD 84 FE         [ 4] 1008 	call DROP 
      00A04E CD 84 61         [ 4] 1009 	call AT
      00A051 CD 86 56         [ 4] 1010 	call VPP 
      00A054 CD 84 4A         [ 4] 1011 	call STORE
                                   1012 ;update CONTEXT and LAST 
      00A057 CD 9A 78         [ 4] 1013 	call EEPCP 
      00A05A CD 84 FE         [ 4] 1014 	call DROP
      00A05D CD 84 61         [ 4] 1015 	call AT
      00A060 CD 83 D9         [ 4] 1016 	call DOLIT 
      00A063 00 02                 1017 	.word 2 
      00A065 CD 87 03         [ 4] 1018 	call PLUS 
      00A068 CD 85 08         [ 4] 1019 	call DUPP 
      00A06B CD 86 48         [ 4] 1020 	call CNTXT 
      00A06E CD 84 4A         [ 4] 1021 	call STORE
      00A071 CD 86 74         [ 4] 1022 	call LAST
      00A074 CD 84 4A         [ 4] 1023 	call STORE 
      00A077 CD 9A A8         [ 4] 1024 	call UPDATLAST 
                                   1025 ;update CP 
      00A07A CD 86 64         [ 4] 1026 	call CPP 
      00A07D CD 84 4A         [ 4] 1027 	call STORE
      00A080 CD 9A D1         [ 4] 1028 	call UPDATCP 
      00A083 81               [ 4] 1029 	ret 
                                   1030 
                                   1031 ;-----------------------------
                                   1032 ; move interrupt sub-routine
                                   1033 ; in flash memory
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



                                   1034 ;----------------------------- 
      00A084 A0 3E                 1035 	.word LINK 
                           002006  1036 	LINK=. 
      00A086 06                    1037 	.byte 6
      00A087 49 46 4D 4F 56 45     1038 	.ascii "IFMOVE" 
      00A08D                       1039 IFMOVE:
      00A08D CD 86 15         [ 4] 1040 	call TFLASH 
      00A090 CD 84 61         [ 4] 1041 	CALL AT 
      00A093 CD 84 0C         [ 4] 1042 	CALL QBRAN 
      00A096 A0 38                 1043 	.word no_move 
      00A098 CD 86 64         [ 4] 1044 	call CPP 
      00A09B CD 84 61         [ 4] 1045 	call AT 
      00A09E CD 85 08         [ 4] 1046 	call DUPP ; ( udl udl -- )
      00A0A1 CD 9A 8E         [ 4] 1047 	call EEPVP 
      00A0A4 CD 84 FE         [ 4] 1048 	call DROP
      00A0A7 CD 84 61         [ 4] 1049 	call AT  ; ( udl udl a )
      00A0AA CD 84 D1         [ 4] 1050 	call TOR 
      00A0AD CD 9F A9         [ 4] 1051 	call FADDR
      00A0B0 CD 84 C5         [ 4] 1052 	call RAT ; ( udl ud a -- ) R: a 
      00A0B3 CC 9F E5         [ 2] 1053 	jp FMOVE2 
                                   1054 
                                   1055 
                                   1056 ; application code begin here
      00A100                       1057 	.bndry 128 ; align on flash block  
      00A100                       1058 app_space: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



                                   4649 .endif ; PICATOUT_MOD
                                   4650 
                                   4651 ;===============================================================
                                   4652 
                           002006  4653 LASTN =	LINK   ;last name defined
                                   4654 
                                   4655 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   6 AB1        000704 R   |   6 ABOR1      001259 R
  6 ABOR2      001270 R   |   6 ABORQ      001251 R   |   6 ABORT      001242 R
  6 ABRTQ      00152D R   |   6 ABSS       0006FB R   |   6 ACCEP      0011D8 R
  6 ACCP1      0011E1 R   |   6 ACCP2      001207 R   |   6 ACCP3      00120A R
  6 ACCP4      00120C R   |     ADC_CR1 =  005401     |     ADC_CR1_=  000000 
    ADC_CR1_=  000001     |     ADC_CR1_=  000004     |     ADC_CR1_=  000005 
    ADC_CR1_=  000006     |     ADC_CR2 =  005402     |     ADC_CR2_=  000003 
    ADC_CR2_=  000004     |     ADC_CR2_=  000005     |     ADC_CR2_=  000006 
    ADC_CR2_=  000001     |     ADC_CR3 =  005403     |     ADC_CR3_=  000007 
    ADC_CR3_=  000006     |     ADC_CSR =  005400     |     ADC_CSR_=  000006 
    ADC_CSR_=  000004     |     ADC_CSR_=  000000     |     ADC_CSR_=  000001 
    ADC_CSR_=  000002     |     ADC_CSR_=  000003     |     ADC_CSR_=  000007 
    ADC_CSR_=  000005     |     ADC_DRH =  005404     |     ADC_DRL =  005405 
    ADC_TDRH=  005406     |     ADC_TDRL=  005407     |   6 ADRADJ     000622 R
    AFR     =  004803     |     AFR0_ADC=  000000     |     AFR1_TIM=  000001 
    AFR2_CCO=  000002     |     AFR3_TIM=  000003     |     AFR4_TIM=  000004 
    AFR5_TIM=  000005     |     AFR6_I2C=  000006     |     AFR7_BEE=  000007 
  6 AFT        001518 R   |   6 AGAIN      00146E R   |   6 AHEAD      0014CB R
  6 ALLOT      001381 R   |   6 ANDD       0004D4 R   |     APP_CP  =  004004 
    APP_LAST=  004000     |     APP_RUN =  004002     |     APP_VP  =  004006 
  6 AT         0003E1 R   |   6 ATEXE      000AF3 R   |   6 AUTORUN    000123 R
    AWU_APR =  0050F1     |     AWU_CSR =  0050F0     |     AWU_TBR =  0050F2 
    B0_MASK =  000001     |     B115200 =  000006     |     B19200  =  000003 
    B1_MASK =  000002     |     B230400 =  000007     |     B2400   =  000000 
    B2_MASK =  000004     |     B38400  =  000004     |     B3_MASK =  000008 
    B460800 =  000008     |     B4800   =  000001     |     B4_MASK =  000010 
    B57600  =  000005     |     B5_MASK =  000020     |     B6_MASK =  000040 
    B7_MASK =  000080     |     B921600 =  000009     |     B9600   =  000002 
  6 BACK1      001180 R   |   6 BASE       000545 R   |     BASEE   =  00000A 
    BCNT    =  000001     |   6 BCOMP      0013C3 R   |   6 BDIGS      000BDB R
    BEEP_BIT=  000004     |     BEEP_CSR=  0050F3     |     BEEP_MAS=  000010 
    BEEP_POR=  00000F     |   6 BEGIN      001450 R   |     BIT0    =  000000 
    BIT1    =  000001     |     BIT2    =  000002     |     BIT3    =  000003 
    BIT4    =  000004     |     BIT5    =  000005     |     BIT6    =  000006 
    BIT7    =  000007     |   6 BKSLA      001018 R   |   6 BKSP       001150 R
    BKSPP   =  000008     |   6 BLANK      0009C1 R   |     BLOCK_SI=  000080 
    BOOT_ROM=  006000     |     BOOT_ROM=  007FFF     |   6 BRAN       0003A3 R
    BTW     =  000001     |   6 BUF2ROW    001EA7 R   |   6 BYE        0000B0 R
    CADR    =  000003     |     CALLL   =  0000CD     |     CAN_DGR =  005426 
    CAN_FPSR=  005427     |     CAN_IER =  005425     |     CAN_MCR =  005420 
    CAN_MSR =  005421     |     CAN_P0  =  005428     |     CAN_P1  =  005429 
    CAN_P2  =  00542A     |     CAN_P3  =  00542B     |     CAN_P4  =  00542C 
    CAN_P5  =  00542D     |     CAN_P6  =  00542E     |     CAN_P7  =  00542F 
    CAN_P8  =  005430     |     CAN_P9  =  005431     |     CAN_PA  =  005432 
    CAN_PB  =  005433     |     CAN_PC  =  005434     |     CAN_PD  =  005435 
    CAN_PE  =  005436     |     CAN_PF  =  005437     |     CAN_RFR =  005424 
    CAN_TPR =  005423     |     CAN_TSR =  005422     |     CARRY   =  000028 
  6 CAT        0003FF R   |   6 CCOMMA     0013A5 R   |     CC_C    =  000000 
    CC_H    =  000004     |     CC_I0   =  000003     |     CC_I1   =  000005 
    CC_N    =  000002     |     CC_V    =  000007     |     CC_Z    =  000001 
    CELLL   =  000002     |   6 CELLM      000946 R   |   6 CELLP      000937 R
  6 CELLS      000955 R   |     CFG_GCR =  007F60     |     CFG_GCR_=  000001 
    CFG_GCR_=  000000     |   6 CHAR1      000E08 R   |   6 CHAR2      000E0B R
  6 CHKIVEC    001D95 R   |     CLKOPT  =  004807     |     CLKOPT_C=  000002 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
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
    CLK_SWR_=  0000D2     |   6 CMOV1      000B12 R   |   6 CMOV2      000B2A R
  6 CMOVE      000B0A R   |     CNTDWN  =  000030     |   6 CNTXT      0005C8 R
  6 COLD       001925 R   |   6 COLD1      001925 R   |   6 COLON      0016C3 R
  6 COMMA      00138E R   |   6 COMPI      0013D3 R   |     COMPO   =  000040 
  6 CONSTANT   00176D R   |     CONVERT_=  000001     |   6 COUNT      000AA6 R
  6 CPP        0005E4 R   |     CPU_A   =  007F00     |     CPU_CCR =  007F0A 
    CPU_PCE =  007F01     |     CPU_PCH =  007F02     |     CPU_PCL =  007F03 
    CPU_SPH =  007F08     |     CPU_SPL =  007F09     |     CPU_XH  =  007F04 
    CPU_XL  =  007F05     |     CPU_YH  =  007F06     |     CPU_YL  =  007F07 
  6 CR         000E36 R   |   6 CREAT      001709 R   |     CRR     =  00000D 
  6 CSTOR      0003EE R   |   6 DAT        000A86 R   |     DATSTK  =  001680 
  6 DDROP      000663 R   |   6 DDUP       00066E R   |     DEBUG_BA=  007F00 
    DEBUG_EN=  007FFF     |   6 DECIM      000C8B R   |   6 DEPTH      000A11 R
    DEVID_BA=  0048CD     |     DEVID_EN=  0048D8     |     DEVID_LO=  0048D2 
    DEVID_LO=  0048D3     |     DEVID_LO=  0048D4     |     DEVID_LO=  0048D5 
    DEVID_LO=  0048D6     |     DEVID_LO=  0048D7     |     DEVID_LO=  0048D8 
    DEVID_WA=  0048D1     |     DEVID_XH=  0048CE     |     DEVID_XL=  0048CD 
    DEVID_YH=  0048D0     |     DEVID_YL=  0048CF     |   6 DGTQ1      000CD0 R
  6 DI         0000BE R   |   6 DIG        000C04 R   |   6 DIGIT      000B9F R
  6 DIGS       000C15 R   |   6 DIGS1      000C15 R   |   6 DIGS2      000C22 R
  6 DIGTQ      000C9F R   |     DM_BK1RE=  007F90     |     DM_BK1RH=  007F91 
    DM_BK1RL=  007F92     |     DM_BK2RE=  007F93     |     DM_BK2RH=  007F94 
    DM_BK2RL=  007F95     |     DM_CR1  =  007F96     |     DM_CR2  =  007F97 
    DM_CSR1 =  007F98     |     DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A 
  6 DN1        0006DB R   |   6 DNEGA      0006C0 R   |   6 DOCONST    001797 R
  6 DOLIT      000359 R   |   6 DONXT      00036D R   |   6 DOSTR      000E4C R
  6 DOT        000ED1 R   |   6 DOT1       000EE7 R   |   6 DOTI1      0018B9 R
  6 DOTID      0018A3 R   |   6 DOTO1      0012E5 R   |   6 DOTOK      0012CB R
  6 DOTPR      000FFA R   |   6 DOTQ       001547 R   |   6 DOTQP      000E75 R
  6 DOTR       000E83 R   |   6 DOTS       001845 R   |   6 DOTS1      001850 R
  6 DOTS2      001859 R   |   6 DOVAR      000535 R   |   6 DROP       00047E R
  6 DSTOR      000A60 R   |   6 DUMP       0017FB R   |   6 DUMP1      001812 R
  6 DUMP3      001834 R   |   6 DUMPP      0017CA R   |   6 DUPP       000488 R
  6 EDIGS      000C40 R   |   6 EEPCP      0019F8 R   |   6 EEPLAST    0019CB R
  6 EEPROM     0019B3 R   |     EEPROM_B=  004000     |     EEPROM_E=  0047FF 
    EEPROM_S=  000800     |   6 EEPRUN     0019E2 R   |   6 EEPVP      001A0E R
  6 EI         0000B7 R   |   6 ELSEE      0014A6 R   |   6 EMIT       000343 R
  6 EQ1        00071F R   |   6 EQUAL      000709 R   |   6 ERASE      000B6C R
    ERR     =  00001B     |   6 EVAL       00130E R   |   6 EVAL1      00130E R
  6 EVAL2      00132A R   |   6 EXE1       000B01 R   |   6 EXECU      0003B3 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]

Symbol Table

  6 EXIT       0003C3 R   |     EXT     =  000000     |     EXTI_CR1=  0050A0 
    EXTI_CR2=  0050A1     |   6 EXTRC      000BC7 R   |   6 FADDR      001F29 R
    FHSE    =  7A1200     |     FHSI    =  F42400     |   6 FILL       000B39 R
  6 FILL1      000B56 R   |   6 FILL2      000B5F R   |   6 FIND       0010AC R
  6 FIND1      0010CA R   |   6 FIND2      0010F8 R   |   6 FIND3      001104 R
  6 FIND4      001118 R   |   6 FIND5      001125 R   |   6 FIND6      001109 R
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
    FLSI    =  01F400     |   6 FMOVE      001F34 R   |   6 FMOVE2     001F65 R
  6 FOR        001423 R   |   6 FORGET     000168 R   |   6 FORGET1    000197 R
  6 FORGET2    00021D R   |   6 FORGET4    000226 R   |   6 FORGET6    0001DF R
    FPTR    =  000032     |   6 FREEVAR    000233 R   |   6 FREEVAR4   000269 R
    GPIO_BAS=  005000     |     GPIO_CR1=  000003     |     GPIO_CR2=  000004 
    GPIO_DDR=  000002     |     GPIO_IDR=  000001     |     GPIO_ODR=  000000 
    GPIO_SIZ=  000005     |   6 HERE       000ABD R   |   6 HEX        000C76 R
  6 HI         0018F8 R   |   6 HLD        0005B5 R   |   6 HOLD       000BEB R
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
    I2C_WRIT=  000000     |   6 ICOLON     0016D4 R   |   6 IFETCH     001441 R
  6 IFF        00147E R   |   6 IFMOVE     00200D R   |     IMEDD   =  000080 
  6 IMMED      0016E6 R   |   6 INCH       000337 R   |   6 INITOFS    00169C R
  6 INN        000563 R   |     INPUT_DI=  000000     |     INPUT_EI=  000001 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]

Symbol Table

    INPUT_FL=  000000     |     INPUT_PU=  000001     |   6 INTE1      0012AD R
  6 INTER      001283 R   |     INT_ADC2=  000016     |     INT_AUAR=  000012 
    INT_AWU =  000001     |     INT_CAN_=  000008     |     INT_CAN_=  000009 
    INT_CLK =  000002     |     INT_EXTI=  000003     |     INT_EXTI=  000004 
    INT_EXTI=  000005     |     INT_EXTI=  000006     |     INT_EXTI=  000007 
    INT_FLAS=  000018     |     INT_I2C =  000013     |     INT_SPI =  00000A 
    INT_TIM1=  00000C     |     INT_TIM1=  00000B     |     INT_TIM2=  00000E 
    INT_TIM2=  00000D     |     INT_TIM3=  000010     |     INT_TIM3=  00000F 
    INT_TIM4=  000017     |     INT_TLI =  000000     |     INT_UART=  000011 
    INT_UART=  000015     |     INT_UART=  000014     |     INT_VECT=  008060 
    INT_VECT=  00800C     |     INT_VECT=  008028     |     INT_VECT=  00802C 
    INT_VECT=  008010     |     INT_VECT=  008014     |     INT_VECT=  008018 
    INT_VECT=  00801C     |     INT_VECT=  008020     |     INT_VECT=  008024 
    INT_VECT=  008068     |     INT_VECT=  008054     |     INT_VECT=  008000 
    INT_VECT=  008030     |     INT_VECT=  008038     |     INT_VECT=  008034 
    INT_VECT=  008040     |     INT_VECT=  00803C     |     INT_VECT=  008048 
    INT_VECT=  008044     |     INT_VECT=  008064     |     INT_VECT=  008008 
    INT_VECT=  008004     |     INT_VECT=  008050     |     INT_VECT=  00804C 
    INT_VECT=  00805C     |     INT_VECT=  008058     |   6 INVER      00069D R
    IPR0    =  000002     |     IPR1    =  000001     |     IPR2    =  000000 
    IPR3    =  000003     |     IPR_MASK=  000003     |     IRET_COD=  000080 
  6 ISEMI      001631 R   |     ITC_SPR1=  007F70     |     ITC_SPR2=  007F71 
    ITC_SPR3=  007F72     |     ITC_SPR4=  007F73     |     ITC_SPR5=  007F74 
    ITC_SPR6=  007F75     |     ITC_SPR7=  007F76     |     ITC_SPR8=  007F77 
    IWDG_KR =  0050E0     |     IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2 
  6 JSRC       001686 R   |   6 KEY        000DB6 R   |   6 KTAP       00119D R
  6 KTAP1      0011C0 R   |   6 KTAP2      0011C3 R   |   6 LAST       0005F4 R
  6 LASTN   =  002006 R   |   6 LBRAC      0012BA R   |     LED2_BIT=  000005 
    LED2_MAS=  000020     |     LED2_POR=  00500A     |   6 LESS       000746 R
    LF      =  00000A     |   6 LINK    =  002006 R   |   6 LITER      0013F5 R
  6 LSHIFT     000980 R   |   6 LSHIFT1    000989 R   |   6 LSHIFT4    000991 R
  6 LT1        00075C R   |     MASKK   =  001F7F     |   6 MAX        000766 R
  6 MAX1       000779 R   |   6 MIN        000783 R   |   6 MIN1       000796 R
  6 MMOD1      000839 R   |   6 MMOD2      00084D R   |   6 MMOD3      000864 R
  6 MMSM1      0007E0 R   |   6 MMSM2      0007F4 R   |   6 MMSM3      0007F6 R
  6 MMSM4      0007FE R   |   6 MODD       00087E R   |   6 MONE       0009E7 R
    MS      =  00002E     |   6 MSEC       000273 R   |   6 MSMOD      00081C R
  6 MSTA1      00090F R   |   6 MSTAR      0008EC R   |     NAFR    =  004804 
  6 NAMEQ      001145 R   |   6 NAMET      001056 R   |     NCLKOPT =  004808 
  6 NEGAT      0006AE R   |   6 NEX1       00037A R   |   6 NEXT       001432 R
    NFLASH_W=  00480E     |     NHSECNT =  00480A     |     NOPT1   =  004802 
    NOPT2   =  004804     |     NOPT3   =  004806     |     NOPT4   =  004808 
    NOPT5   =  00480A     |     NOPT6   =  00480C     |     NOPT7   =  00480E 
    NOPTBL  =  00487F     |   6 NTIB       000573 R   |     NUBC    =  004802 
  6 NUFQ       000DCC R   |   6 NUFQ1      000DE5 R   |   6 NUMBQ      000CE3 R
  6 NUMQ1      000D17 R   |   6 NUMQ2      000D48 R   |   6 NUMQ3      000D8A R
  6 NUMQ4      000D8F R   |   6 NUMQ5      000D9E R   |   6 NUMQ6      000DA1 R
    NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC 
    NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE     |   6 NonHandl   000000 R
  6 OFFSET     000619 R   |     OFS     =  000005     |   6 ONE        0009D9 R
  6 ONEM       00096F R   |   6 ONEP       000962 R   |     OPT     =  000002 
    OPT0    =  004800     |     OPT1    =  004801     |     OPT2    =  004803 
    OPT3    =  004805     |     OPT4    =  004807     |     OPT5    =  004809 
    OPT6    =  00480B     |     OPT7    =  00480D     |     OPTBL   =  00487E 
    OPTION_B=  004800     |     OPTION_E=  00487F     |     OPTION_S=  000080 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]

Symbol Table

  6 ORIG       000043 R   |   6 ORR        0004E8 R   |   6 OUTPUT     000348 R
    OUTPUT_F=  000001     |     OUTPUT_O=  000000     |     OUTPUT_P=  000001 
    OUTPUT_S=  000000     |   6 OVER       0004B2 R   |   6 OVERT      001602 R
    PA      =  000000     |   6 PACKS      000B7E R   |   6 PAD        000ACE R
  6 PAREN      001009 R   |   6 PARS       000F02 R   |   6 PARS1      000F2D R
  6 PARS2      000F58 R   |   6 PARS3      000F5B R   |   6 PARS4      000F64 R
  6 PARS5      000F87 R   |   6 PARS6      000F9C R   |   6 PARS7      000FAB R
  6 PARS8      000FBA R   |   6 PARSE      000FCB R   |   6 PAUSE      000283 R
    PA_BASE =  005000     |     PA_CR1  =  005003     |     PA_CR2  =  005004 
    PA_DDR  =  005002     |     PA_IDR  =  005001     |     PA_ODR  =  005000 
    PB      =  000005     |     PB_BASE =  005005     |     PB_CR1  =  005008 
    PB_CR2  =  005009     |     PB_DDR  =  005007     |     PB_IDR  =  005006 
    PB_ODR  =  005005     |     PC      =  00000A     |     PC_BASE =  00500A 
    PC_CR1  =  00500D     |     PC_CR2  =  00500E     |     PC_DDR  =  00500C 
    PC_IDR  =  00500B     |     PC_ODR  =  00500A     |     PD      =  00000F 
  6 PDUM1      0017DD R   |   6 PDUM2      0017EE R   |     PD_BASE =  00500F 
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
    PI      =  000028     |     PICATOUT=  000001     |   6 PICK       000A28 R
  6 PII        000150 R   |     PI_BASE =  005028     |     PI_CR1  =  00502B 
    PI_CR2  =  00502C     |     PI_DDR  =  00502A     |     PI_IDR  =  005029 
    PI_ODR  =  005028     |   6 PLUS       000683 R   |   6 PNAM1      0015B7 R
  6 PRESE      001339 R   |     PROD1   =  000022     |     PROD2   =  000024 
    PROD3   =  000026     |   6 PROTECTE   00020F R   |   6 PSTOR      000A3F R
    PTR16   =  000033     |     PTR8    =  000034     |   6 QBRAN      00038C R
  6 QDUP       000632 R   |   6 QDUP1      00063C R   |   6 QKEY       000325 R
  6 QSTAC      0012F1 R   |   6 QUERY      00121D R   |   6 QUEST      000EF4 R
  6 QUIT       001356 R   |   6 QUIT1      00135E R   |   6 QUIT2      001361 R
  6 RAM2EE     001ED5 R   |     RAMBASE =  000000     |   6 RAMLAST    000607 R
    RAM_BASE=  000000     |     RAM_END =  0017FF     |     RAM_SIZE=  001800 
  6 RAT        000445 R   |   6 RBRAC      001673 R   |   6 REPEA      0014FB R
  6 RFREE      001EBC R   |   6 RFROM      000432 R   |     ROP     =  004800 
  6 ROT        000643 R   |   6 ROW2BUF    001E7E R   |     ROWBUFF =  001680 
    RP0     =  00002C     |   6 RPAT       00040F R   |     RPP     =  0017FF 
  6 RPSTO      00041C R   |   6 RSHIFT     00099C R   |   6 RSHIFT1    0009A5 R
  6 RSHIFT4    0009AD R   |     RST_SR  =  0050B3     |   6 SAME1      001074 R
  6 SAME2      00109D R   |   6 SAMEQ      00106C R   |   6 SCOM1      0015EC R
  6 SCOM2      0015EF R   |   6 SCOMP      0015CE R   |   6 SEMIS      001612 R
  6 SETISP     0000CA R   |   6 SET_RAML   001756 R   |     SFR_BASE=  005000 
    SFR_END =  0057FF     |   6 SIGN       000C2A R   |   6 SIGN1      000C3A R
  6 SLASH      000888 R   |   6 SLMOD      00086C R   |   6 SNAME      001581 R
    SP0     =  00002A     |   6 SPACE      000DEE R   |   6 SPACS      000DFD R
  6 SPAT       000468 R   |     SPI_CR1 =  005200     |     SPI_CR2 =  005201 
    SPI_CRCP=  005205     |     SPI_DR  =  005204     |     SPI_ICR =  005202 
    SPI_RXCR=  005206     |     SPI_SR  =  005203     |     SPI_TXCR=  005207 
    SPP     =  001680     |   6 SPSTO      000475 R   |   6 SSMOD      000918 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]

Symbol Table

    SSP     =  000001     |     STACK   =  0017FF     |   6 STAR       0008E1 R
  6 STASL      000929 R   |   6 STORE      0003CA R   |   6 STR        000C58 R
  6 STRCQ      001403 R   |   6 STRQ       00153A R   |   6 STRQP      000E6B R
  6 SUBB       0006E1 R   |   6 SWAPP      000498 R   |     SWIM_CSR=  007F80 
  6 TAP        001187 R   |   6 TBOOT      001919 R   |   6 TBUF       000583 R
    TBUFFBAS=  001680     |   6 TCHA1      000A08 R   |   6 TCHAR      0009F8 R
  6 TEMP       000554 R   |   6 TEVAL      0005A6 R   |   6 TFLASH     000595 R
  6 THENN      001493 R   |   6 TIB        000ADF R   |     TIBB    =  001700 
    TIBBASE =  001700     |     TIC     =  000027     |   6 TICK       00136D R
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]

Symbol Table

    TIM2_CCE=  005308     |     TIM2_CCE=  000000     |     TIM2_CCE=  000001 
    TIM2_CCE=  000004     |     TIM2_CCE=  000005     |     TIM2_CCE=  005309 
    TIM2_CCM=  005305     |     TIM2_CCM=  005306     |     TIM2_CCM=  005307 
    TIM2_CCM=  000000     |     TIM2_CCM=  000004     |     TIM2_CCM=  000003 
    TIM2_CCR=  00530F     |     TIM2_CCR=  005310     |     TIM2_CCR=  005311 
    TIM2_CCR=  005312     |     TIM2_CCR=  005313     |     TIM2_CCR=  005314 
    TIM2_CNT=  00530A     |     TIM2_CNT=  00530B     |     TIM2_CR1=  005300 
    TIM2_CR1=  000007     |     TIM2_CR1=  000000     |     TIM2_CR1=  000003 
    TIM2_CR1=  000001     |     TIM2_CR1=  000002     |     TIM2_EGR=  005304 
    TIM2_EGR=  000001     |     TIM2_EGR=  000002     |     TIM2_EGR=  000003 
    TIM2_EGR=  000006     |     TIM2_EGR=  000000     |     TIM2_IER=  005301 
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
    TIM4_PSC=  000003     |     TIM4_PSC=  000000     |     TIM4_PSC=  000001 
    TIM4_PSC=  000002     |     TIM4_SR =  005342     |     TIM4_SR_=  000000 
  6 TIMEOUTQ   0002B3 R   |   6 TIMER      00029D R   |     TIM_CR1_=  000007 
    TIM_CR1_=  000000     |     TIM_CR1_=  000006     |     TIM_CR1_=  000005 
    TIM_CR1_=  000004     |     TIM_CR1_=  000003     |     TIM_CR1_=  000001 
    TIM_CR1_=  000002     |   6 TNAM2      001873 R   |   6 TNAM3      001891 R
  6 TNAM4      001897 R   |   6 TNAME      001870 R   |   6 TOFLASH    0002D8 R
  6 TOKEN      001048 R   |   6 TOR        000451 R   |   6 TORAM      000318 R
    TRUEE   =  00FFFF     |   6 TWOSL      0009B4 R   |   6 TYPE1      000E1D R
  6 TYPE2      000E29 R   |   6 TYPES      000E18 R   |   6 Timer4Ha   000005 R
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]

Symbol Table

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
    UCNTXT  =  000014     |     UCP     =  000018     |     UCTIB   =  00000C 
    UD1     =  000001     |     UD2     =  000002     |     UD3     =  000003 
    UD4     =  000004     |   6 UDOT       000EBE R   |   6 UDOTR      000E9E R
  6 UEND       000041 R   |     UHLD    =  000012     |     UINN    =  00000A 
    UINTER  =  000010     |     ULAST   =  00001A     |   6 ULES1      00073E R
  6 ULESS      000728 R   |   6 UMMOD      0007BE R   |   6 UMSTA      000897 R
  6 UNIQ1      001578 R   |   6 UNIQU      001559 R   |   6 UNTIL      00145B R
    UOFFSET =  00001C     |   6 UPDATCP    001A51 R   |   6 UPDATLAS   001A28 R
  6 UPDATPTR   001FC8 R   |   6 UPDATRUN   001A40 R   |   6 UPDATVP    001A68 R
  6 UPL1       000529 R   |   6 UPLUS      000512 R   |     UPP     =  000006 
    URLAST  =  000020     |     USR_BTN_=  000004     |     USR_BTN_=  000010 
    USR_BTN_=  005015     |     UTFLASH =  00001E     |     UTIB    =  00000E 
    UTMP    =  000008     |   6 UTYP1      0017AD R   |   6 UTYP2      0017BC R
  6 UTYPE      0017A8 R   |     UVP     =  000016     |   6 UZERO      000027 R
  6 VARIA      001723 R   |     VAR_BASE=  000080     |     VAR_TOP =  0017BF 
    VER     =  000003     |   6 VPP        0005D6 R   |     VSIZE   =  000006 
    WANT_DEB=  000000     |     WANT_SEE=  000000     |     WDGOPT  =  004805 
    WDGOPT_I=  000002     |     WDGOPT_L=  000003     |     WDGOPT_W=  000000 
    WDGOPT_W=  000001     |   6 WHILE      0014E1 R   |   6 WITHI      0007A3 R
  6 WORDD      001034 R   |   6 WORDS      0018CD R   |   6 WORS1      0018D3 R
  6 WORS2      0018F2 R   |     WWDG_CR =  0050D1     |     WWDG_WR =  0050D2 
  6 XORR       0004FD R   |     XTEMP   =  000022     |     YTEMP   =  000024 
  6 ZERO       0009CE R   |   6 ZL1        0004CA R   |   6 ZLESS      0004C1 R
  6 app_spac   002080 R   |   6 block_er   001BEB R   |   6 clear_ra   000019 R
  6 clock_in   00005E R   |   6 copy_buf   001C42 R   |   6 copy_buf   001C61 R
  6 copy_pro   001C61 R   |     da      =  000002     |     db      =  000003 
    dc      =  000000     |     dd      =  000001     |   6 ee_ccomm   001E5C R
  6 ee_comma   001E3B R   |   6 ee_cstor   001B58 R   |   6 ee_store   001BA4 R
  6 erase_fl   001C07 R   |   6 farat      001A79 R   |   6 farcat     001A95 R
  6 fmove_do   001FB1 R   |   6 fptr_sto   001994 R   |   6 inc_fptr   001B26 R
  6 lock       001B12 R   |   6 main       000016 R   |   6 next_row   001F6E R
  6 no_move    001FB8 R   |   6 pristine   001CDC R   |   6 proceed_   001C0A R
  6 reboot     0002CA R   |   6 reset_ve   001D43 R   |   6 row_eras   001BCE R
  6 row_eras   001C1B R   |   6 row_eras   001C42 R   |   6 set_opti   001CB0 R
  6 set_vect   001DE4 R   |   6 uart1_in   000070 R   |   6 unlock     001AEA R
  6 unlock_e   001AAC R   |   6 unlock_f   001ACB R   |   6 write_by   001B3D R
  6 write_ro   001C86 R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 DATA       size      0   flags    8
   2 DATA0      size      0   flags    8
   3 SSEG       size      0   flags    8
   4 SSEG1      size    100   flags    8
   5 HOME       size     80   flags    0
   6 CODE       size   2080   flags    0

