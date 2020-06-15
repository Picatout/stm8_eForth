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
      0080B1 93 0A                  282         .word      INTER   ;'EVAL
      0080B3 00 00                  283         .word      0       ;HLD
      0080B5 A1 39                  284         .word      LASTN  ;CNTXT pointer
      0080B7 00 80                  285         .word      VAR_BASE   ;variables free space pointer 
      0080B9 A1 80                  286         .word      app_space ; FLASH free space pointer 
      0080BB A1 39                  287         .word      LASTN   ;LAST
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
      008127 CC 99 A9         [ 2]  339         jp  COLD   ;default=MN1
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
      008178 CD 8A 07         [ 4]  404         call LSHIFT ; creat slot mask 
      00817B CD 87 09         [ 4]  405         call INVER  ; ( level reg lshift rval mask )
      00817E CD 85 40         [ 4]  406         call ANDD ; ( level reg lshift slot_masked )
      008181 CD 84 BD         [ 4]  407         call TOR  ; ( level reg lshift -- R: slot_masked )
      008184 CD 86 AF         [ 4]  408         call ROT  ; ( reg lshift level )
      008187 CD 85 04         [ 4]  409         call SWAPP ; ( reg level lshift )
      00818A CD 8A 07         [ 4]  410         call LSHIFT  ; ( reg slot_level -- )
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
      0081A3 CD 90 CF         [ 4]  424         call TOKEN 
      0081A6 CD 84 F4         [ 4]  425         call DUPP 
      0081A9 CD 83 F8         [ 4]  426         call QBRAN 
      0081AC 82 89                  427         .word FORGET2
      0081AE CD 91 CC         [ 4]  428         call NAMEQ
      0081B1 CD 86 9E         [ 4]  429         call QDUP 
      0081B4 CD 83 F8         [ 4]  430         call QBRAN 
      0081B7 82 89                  431         .word FORGET2
      0081B9 CD 84 EA         [ 4]  432         call DROP 
      0081BC 1D 00 04         [ 2]  433         subw x,#2*CELLL 
      0081BF 90 5F            [ 1]  434         clrw y 
      0081C1 FF               [ 2]  435         ldw (x),y 
      0081C2 90 AE 40 02      [ 2]  436         ldw y,#APP_RUN 
      0081C6 EF 02            [ 2]  437         ldw (2,x),y 
      0081C8 CC 9C D7         [ 2]  438         jp ee_store 
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
      0081D4 CD 90 CF         [ 4]  449         call TOKEN
      0081D7 CD 84 F4         [ 4]  450         call DUPP 
      0081DA CD 83 F8         [ 4]  451         call QBRAN 
      0081DD 82 89                  452         .word FORGET2
      0081DF CD 91 CC         [ 4]  453         call NAMEQ ; ( a -- ca na | a F )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



      0081E2 CD 86 9E         [ 4]  454         call QDUP 
      0081E5 CD 83 F8         [ 4]  455         call QBRAN 
      0081E8 82 89                  456         .word FORGET2
                                    457 ; only forget users words 
      0081EA CD 84 F4         [ 4]  458         call DUPP ; ( ca na na )
      0081ED CD 83 C5         [ 4]  459         call DOLIT 
      0081F0 A1 80                  460         .word app_space 
      0081F2 CD 85 04         [ 4]  461         call SWAPP 
      0081F5 CD 87 AF         [ 4]  462         call  ULESS 
      0081F8 CD 83 F8         [ 4]  463         call QBRAN 
      0081FB 82 4B                  464         .word FORGET6 
                                    465 ; ( ca na -- )        
                                    466 ;reset ivec with address >= ca
      0081FD CD 85 04         [ 4]  467         call SWAPP ; ( na ca -- ) 
      008200 CD 9E C8         [ 4]  468         call CHKIVEC ; ( na -- ) 
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
      008217 CD 87 68         [ 4]  479         call SUBB ; ( na last -- na last lfa ) link address 
      00821A CD 84 4D         [ 4]  480         call AT 
      00821D CD 84 F4         [ 4]  481         call DUPP ; ( -- na last a a )
      008220 CD 86 34         [ 4]  482         call CNTXT 
      008223 CD 84 36         [ 4]  483         call STORE
      008226 CD 86 60         [ 4]  484         call LAST  
      008229 CD 84 36         [ 4]  485         call STORE ; ( --  na last )
      00822C CD 85 1E         [ 4]  486         call OVER 
      00822F CD 87 90         [ 4]  487         call EQUAL ; ( na last na -- na T|F ) 
      008232 CD 83 F8         [ 4]  488         call QBRAN 
      008235 82 03                  489         .word FORGET1 
                                    490 ; ( na -- )
      008237 CD 83 C5         [ 4]  491         call DOLIT 
      00823A 00 02                  492         .word 2 
      00823C CD 87 68         [ 4]  493         call SUBB 
      00823F CD 86 50         [ 4]  494         call CPP 
      008242 CD 84 36         [ 4]  495         call STORE  
      008245 CD 9B 84         [ 4]  496         call UPDATCP 
      008248 CC 9B 5B         [ 2]  497         jp UPDATLAST 
      00824B                        498 FORGET6: ; tried to forget a RAM or system word 
                                    499 ; ( ca na -- )
      00824B 1D 00 02         [ 2]  500         subw x,#CELLL 
      00824E 90 BE 2A         [ 2]  501         ldw y,SP0 
      008251 FF               [ 2]  502         ldw (x),y  
      008252 CD 87 AF         [ 4]  503         call ULESS
      008255 CD 83 F8         [ 4]  504         call QBRAN 
      008258 82 7B                  505         .word PROTECTED 
      00825A CD 92 D8         [ 4]  506         call ABORQ 
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
      00827B CD 92 D8         [ 2]  518         jp DROP 
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
      008289 CD 92 D8         [ 4]  533         call ONEP ;
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
      0082A7 E9 CD 86         [ 4]  546         call AT 
      0082AA EF CD 89         [ 4]  547         call VPP   
      0082AD E9 CD 84         [ 4]  548         call STORE 
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
      0082B9 CD 87 90 CD            560         .ascii "MSEC"
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
      0082D1 36 CC 9B 9B      [ 2]  576         addw y,MS 
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
      008353 92 D8 1D         [ 1]  662         LD    A,UART1_DR   ;get char in A
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
                           000001  1418 .if PICATOUT_MOD
      00868E 72 A9 00 01      [ 2] 1419         addw y,#1
                           000000  1420 .else 
                                   1421         INCW Y ; bug incw as no effect on Carry flag 
                                   1422 .endif        
      00868E CD 86            [ 2] 1423         LDW (2,X),Y
      008690 85 CD 84         [ 2] 1424         LDW Y,YTEMP
      008693 4D CC            [ 1] 1425         JRNC DN1 
      008695 86 EF            [ 2] 1426         INCW Y
      008697 86               [ 2] 1427 DN1:    LDW (X),Y
      008698 7E               [ 4] 1428         RET
                                   1429 
                                   1430 
                                   1431 ;       S>D ( n -- d )
                                   1432 ; convert single integer to double 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



      008699 04 3F                 1433         .word LINK 
                           0006CD  1434         LINK=. 
      00869B 44                    1435         .byte 3 
      00869C 55 50 44              1436         .ascii "S>D"
      00869E                       1437 STOD: 
      00869E 90 93 90         [ 2] 1438         subw x,#CELLL 
      0086A1 FE 27            [ 1] 1439         clrw y 
      0086A3 04               [ 2] 1440         ldw (x),y 
      0086A4 1D 00            [ 1] 1441         ldw y,x 
      0086A6 02 FF 81         [ 2] 1442         ldw y,(2,y)
      0086A9 86 99            [ 1] 1443         jrpl 1$ 
      0086AB 03 52 4F 54      [ 2] 1444         ldw y,#-1
      0086AF FF               [ 2] 1445         ldw (x),y 
      0086AF 90               [ 4] 1446 1$:     ret 
                                   1447 
                                   1448 
                                   1449 
                                   1450 
                                   1451 ;       -       ( n1 n2 -- n1-n2 )
                                   1452 ;       Subtraction.
      0086B0 93 90                 1453         .word      LINK
                           0006E6  1454 LINK = . 
      0086B2 FE                    1455         .byte      1
      0086B3 90                    1456         .ascii     "-"
      0006E8                       1457 SUBB:
      0086B4 89 90            [ 1] 1458         LDW Y,X
      0086B6 93 90            [ 2] 1459         LDW Y,(Y)
      0086B8 EE 04 FF         [ 2] 1460         LDW YTEMP,Y
      0086BB 90 93 90         [ 2] 1461         ADDW X,#2
      0086BE EE 02            [ 1] 1462         LDW Y,X
      0086C0 EF 04            [ 2] 1463         LDW Y,(Y)
      0086C2 90 85 EF 02      [ 2] 1464         SUBW Y,YTEMP
      0086C6 81               [ 2] 1465         LDW (X),Y
      0086C7 86               [ 4] 1466         RET
                                   1467 
                                   1468 ;       ABS     ( n -- n )
                                   1469 ;       Return  absolute value of n.
      0086C8 AB 05                 1470         .word      LINK
                           0006FE  1471 LINK = . 
      0086CA 32                    1472         .byte      3
      0086CB 44 52 4F              1473         .ascii     "ABS"
      000702                       1474 ABSS:
      0086CE 50 93            [ 1] 1475         LDW Y,X
      0086CF 90 FE            [ 2] 1476 	LDW Y,(Y)
      0086CF 1C 00            [ 1] 1477         JRPL     AB1     ;negate:
      0086D1 04 81            [ 2] 1478         NEGW     Y     ;else negate hi byte
      0086D3 86               [ 2] 1479         LDW (X),Y
      0086D4 C9               [ 4] 1480 AB1:    RET
                                   1481 
                                   1482 ;       =       ( w w -- t )
                                   1483 ;       Return true if top two are =al.
      0086D5 04 32                 1484         .word      LINK
                           00070E  1485 LINK = . 
      0086D7 44                    1486         .byte      1
      0086D8 55                    1487         .ascii     "="
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



      000710                       1488 EQUAL:
      0086D9 50 FF            [ 1] 1489         LD A,#0xFF  ;true
      0086DA 90 93            [ 1] 1490         LDW Y,X    ;D = n2
      0086DA 1D 00            [ 2] 1491         LDW Y,(Y)
      0086DC 04 90 93         [ 2] 1492         LDW YTEMP,Y
      0086DF 90 EE 06         [ 2] 1493         ADDW X,#2
      0086E2 EF 02            [ 1] 1494         LDW Y,X
      0086E4 90 93            [ 2] 1495         LDW Y,(Y)
      0086E6 90 EE 04         [ 2] 1496         CPW Y,YTEMP     ;if n2 <> n1
      0086E9 FF 81            [ 1] 1497         JREQ     EQ1
      0086EB 86               [ 1] 1498         CLR A
      0086EC D5               [ 1] 1499 EQ1:    LD (X),A
      0086ED 01 2B            [ 1] 1500         LD (1,X),A
      0086EF 81               [ 4] 1501 	RET     
                                   1502 
                                   1503 ;       U<      ( u u -- t )
                                   1504 ;       Unsigned compare of top two items.
      0086EF 90 93                 1505         .word      LINK
                           00072C  1506 LINK = . 
      0086F1 90                    1507         .byte      2
      0086F2 FE 90                 1508         .ascii     "U<"
      00072F                       1509 ULESS:
      0086F4 BF 24            [ 1] 1510         LD A,#0xFF  ;true
      0086F6 1C 00            [ 1] 1511         LDW Y,X    ;D = n2
      0086F8 02 90            [ 2] 1512         LDW Y,(Y)
      0086FA 93 90 FE         [ 2] 1513         LDW YTEMP,Y
      0086FD 72 B9 00         [ 2] 1514         ADDW X,#2
      008700 24 FF            [ 1] 1515         LDW Y,X
      008702 81 86            [ 2] 1516         LDW Y,(Y)
      008704 ED 03 4E         [ 2] 1517         CPW Y,YTEMP     ;if n2 <> n1
      008707 4F 54            [ 1] 1518         JRULT     ULES1
      008709 4F               [ 1] 1519         CLR A
      008709 90               [ 1] 1520 ULES1:  LD (X),A
      00870A 93 90            [ 1] 1521         LD (1,X),A
      00870C FE               [ 4] 1522 	RET     
                                   1523 
                                   1524 ;       <       ( n1 n2 -- t )
                                   1525 ;       Signed compare of top two items.
      00870D 90 53                 1526         .word      LINK
                           00074B  1527 LINK = . 
      00870F FF                    1528         .byte      1
      008710 81                    1529         .ascii     "<"
      00074D                       1530 LESS:
      008711 87 05            [ 1] 1531         LD A,#0xFF  ;true
      008713 06 4E            [ 1] 1532         LDW Y,X    ;D = n2
      008715 45 47            [ 2] 1533         LDW Y,(Y)
      008717 41 54 45         [ 2] 1534         LDW YTEMP,Y
      00871A 1C 00 02         [ 2] 1535         ADDW X,#2
      00871A 90 93            [ 1] 1536         LDW Y,X
      00871C 90 FE            [ 2] 1537         LDW Y,(Y)
      00871E 90 50 FF         [ 2] 1538         CPW Y,YTEMP     ;if n2 <> n1
      008721 81 87            [ 1] 1539         JRSLT     LT1
      008723 13               [ 1] 1540         CLR A
      008724 07               [ 1] 1541 LT1:    LD (X),A
      008725 44 4E            [ 1] 1542         LD (1,X),A
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



      008727 45               [ 4] 1543 	RET     
                                   1544 
                                   1545 ;       MAX     ( n n -- n )
                                   1546 ;       Return greater of two top items.
      008728 47 41                 1547         .word      LINK
                           000769  1548 LINK = . 
      00872A 54                    1549         .byte      3
      00872B 45 41 58              1550         .ascii     "MAX"
      00872C                       1551 MAX:
      00872C 90 93            [ 1] 1552         LDW Y,X    ;D = n2
      00872E 90 FE 90         [ 2] 1553         LDW Y,(2,Y)
      008731 53 90 BF         [ 2] 1554         LDW YTEMP,Y
      008734 24 90            [ 1] 1555         LDW Y,X
      008736 93 90            [ 2] 1556         LDW Y,(Y)
      008738 EE 02 90         [ 2] 1557         CPW Y,YTEMP     ;if n2 <> n1
      00873B 53 72            [ 1] 1558         JRSLT     MAX1
      00873D A9 00            [ 2] 1559         LDW (2,X),Y
      00873F 01 EF 02         [ 2] 1560 MAX1:   ADDW X,#2
      008742 90               [ 4] 1561 	RET     
                                   1562 
                                   1563 ;       MIN     ( n n -- n )
                                   1564 ;       Return smaller of top two items.
      008743 BE 24                 1565         .word      LINK
                           000786  1566 LINK = . 
      008745 24                    1567         .byte      3
      008746 02 90 5C              1568         .ascii     "MIN"
      00078A                       1569 MIN:
      008749 FF 81            [ 1] 1570         LDW Y,X    ;D = n2
      00874B 87 24 03         [ 2] 1571         LDW Y,(2,Y)
      00874E 53 3E 44         [ 2] 1572         LDW YTEMP,Y
      008751 90 93            [ 1] 1573         LDW Y,X
      008751 1D 00            [ 2] 1574         LDW Y,(Y)
      008753 02 90 5F         [ 2] 1575         CPW Y,YTEMP     ;if n2 <> n1
      008756 FF 90            [ 1] 1576         JRSGT     MIN1
      008758 93 90            [ 2] 1577         LDW (2,X),Y
      00875A EE 02 2A         [ 2] 1578 MIN1:	ADDW X,#2
      00875D 05               [ 4] 1579 	RET     
                                   1580 
                                   1581 ;       WITHIN  ( u ul uh -- t )
                                   1582 ;       Return true if u is within
                                   1583 ;       range of ul and uh. ( ul <= u < uh )
      00875E 90 AE                 1584         .word      LINK
                           0007A3  1585 LINK = . 
      008760 FF                    1586         .byte      6
      008761 FF FF 81 87 4D 01     1587         .ascii     "WITHIN"
      0007AA                       1588 WITHI:
      008767 2D 04 9E         [ 4] 1589         CALL     OVER
      008768 CD 06 E8         [ 4] 1590         CALL     SUBB
      008768 90 93 90         [ 4] 1591         CALL     TOR
      00876B FE 90 BF         [ 4] 1592         CALL     SUBB
      00876E 24 1C 00         [ 4] 1593         CALL     RFROM
      008771 02 90 93         [ 2] 1594         JP     ULESS
                                   1595 
                                   1596 ;; Divide
                                   1597 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



                                   1598 ;       UM/MOD  ( udl udh un -- ur uq )
                                   1599 ;       Unsigned divide of a double by a
                                   1600 ;       single. Return mod and quotient.
      008774 90 FE                 1601         .word      LINK
                           0007BE  1602 LINK = . 
      008776 72                    1603         .byte      6
      008777 B2 00 24 FF 81 87     1604         .ascii     "UM/MOD"
      0007C5                       1605 UMMOD:
      00877D 66 03            [ 2] 1606 	LDW XTEMP,X	; save stack pointer
      00877F 41               [ 2] 1607 	LDW X,(X)	; un
      008780 42 53            [ 2] 1608 	LDW YTEMP,X     ; save un
      008782 90 BE 22         [ 2] 1609 	LDW Y,XTEMP	; stack pointer
      008782 90 93 90         [ 2] 1610 	LDW Y,(4,Y)     ; Y=udl
      008785 FE 2A            [ 2] 1611 	LDW X,XTEMP
      008787 03 90            [ 2] 1612 	LDW X,(2,X)	; X=udh
      008789 50 FF            [ 2] 1613 	CPW X,YTEMP
      00878B 81 87            [ 2] 1614 	JRULE MMSM1
      00878D 7E 01            [ 2] 1615 	LDW X,XTEMP
      00878F 3D 00 02         [ 2] 1616 	ADDW X,#2	; pop off 1 level
      008790 90 AE FF FF      [ 2] 1617 	LDW Y,#0xFFFF
      008790 A6               [ 2] 1618 	LDW (X),Y
      008791 FF 90            [ 1] 1619 	CLRW Y
      008793 93 90            [ 2] 1620 	LDW (2,X),Y
      008795 FE               [ 4] 1621 	RET
      0007E7                       1622 MMSM1:
                           000001  1623 .if PICATOUT_MOD 
                                   1624 ; take advantage of divw x,y when udh==0
      008796 90               [ 2] 1625         tnzw x  ; is udh==0?
      008797 BF 24            [ 1] 1626         jrne MMSM2 
      008799 1C               [ 1] 1627         ldw x,y    ;udl 
      00879A 00 02 90         [ 2] 1628         ldw y,YTEMP ; divisor 
      00879D 93               [ 2] 1629         divw x,y 
      00879E 90               [ 2] 1630         pushw x     ; quotient 
      00879F FE 90            [ 2] 1631         ldw x,XTEMP 
      0087A1 B3 24 27         [ 2] 1632         addw x,#CELLL 
      0087A4 01 4F            [ 2] 1633         ldw (2,x),y  ; ur
      0087A6 F7 E7            [ 2] 1634         popw y 
      0087A8 01               [ 2] 1635         ldw (x),y ; uq 
      0087A9 81               [ 4] 1636         ret 
      0007FB                       1637 MMSM2:        
                                   1638 .endif 
      0087AA 87 8E            [ 1] 1639 	LD A,#17	; loop count
      0007FD                       1640 MMSM3:
      0087AC 02 55            [ 2] 1641 	CPW X,YTEMP	; compare udh to un
      0087AE 3C 04            [ 1] 1642 	JRULT MMSM4	; can't subtract
      0087AF 72 B0 00 24      [ 2] 1643 	SUBW X,YTEMP	; can subtract
      000805                       1644 MMSM4:
      0087AF A6               [ 1] 1645 	CCF	; quotient bit
      0087B0 FF 90            [ 2] 1646 	RLCW Y	; rotate into quotient
      0087B2 93               [ 2] 1647 	RLCW X	; rotate into remainder
      0087B3 90               [ 1] 1648 	DEC A	; repeat
      0087B4 FE 90            [ 1] 1649 	JRUGT MMSM3
                           000001  1650 .if PICATOUT_MOD
      0087B6 BF               [ 2] 1651         RRCW X 
                           000000  1652 .else 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



                                   1653 	SRAW X  ; bug 
                                   1654 .endif         
      0087B7 24 1C            [ 2] 1655 	LDW YTEMP,X	; done, save remainder
      0087B9 00 02            [ 2] 1656 	LDW X,XTEMP
      0087BB 90 93 90         [ 2] 1657 	ADDW X,#2	; drop
      0087BE FE               [ 2] 1658 	LDW (X),Y
      0087BF 90 B3 24         [ 2] 1659 	LDW Y,YTEMP	; save quotient
      0087C2 25 01            [ 2] 1660 	LDW (2,X),Y
      0087C4 4F               [ 4] 1661 	RET
                                   1662 	
                                   1663 ;       M/MOD   ( d n -- r q )
                                   1664 ;       Signed floored divide of double by
                                   1665 ;       single. Return mod and quotient.
      0087C5 F7 E7                 1666         .word      LINK
                           00081D  1667 LINK = . 
      0087C7 01                    1668         .byte      5
      0087C8 81 87 AC 01 3C        1669         .ascii     "M/MOD"
      0087CD                       1670 MSMOD:  
      0087CD A6 FF 90         [ 4] 1671         CALL	DUPP
      0087D0 93 90 FE         [ 4] 1672         CALL	ZLESS
      0087D3 90 BF 24         [ 4] 1673         CALL	DUPP
      0087D6 1C 00 02         [ 4] 1674         CALL	TOR
      0087D9 90 93 90         [ 4] 1675         CALL	QBRAN
      0087DC FE 90                 1676         .word	MMOD1
      0087DE B3 24 2F         [ 4] 1677         CALL	NEGAT
      0087E1 01 4F F7         [ 4] 1678         CALL	TOR
      0087E4 E7 01 81         [ 4] 1679         CALL	DNEGA
      0087E7 87 CB 03         [ 4] 1680         CALL	RFROM
      0087EA 4D 41 58         [ 4] 1681 MMOD1:	CALL	TOR
      0087ED CD 04 74         [ 4] 1682         CALL	DUPP
      0087ED 90 93 90         [ 4] 1683         CALL	ZLESS
      0087F0 EE 02 90         [ 4] 1684         CALL	QBRAN
      0087F3 BF 24                 1685         .word	MMOD2
      0087F5 90 93 90         [ 4] 1686         CALL	RAT
      0087F8 FE 90 B3         [ 4] 1687         CALL	PLUS
      0087FB 24 2F 02         [ 4] 1688 MMOD2:	CALL	RFROM
      0087FE EF 02 1C         [ 4] 1689         CALL	UMMOD
      008801 00 02 81         [ 4] 1690         CALL	RFROM
      008804 87 E9 03         [ 4] 1691         CALL	QBRAN
      008807 4D 49                 1692         .word	MMOD3
      008809 4E 04 84         [ 4] 1693         CALL	SWAPP
      00880A CD 06 9A         [ 4] 1694         CALL	NEGAT
      00880A 90 93 90         [ 4] 1695         CALL	SWAPP
      00880D EE               [ 4] 1696 MMOD3:	RET
                                   1697 
                                   1698 ;       /MOD    ( n n -- r q )
                                   1699 ;       Signed divide. Return mod and quotient.
      00880E 02 90                 1700         .word      LINK
                           00086E  1701 LINK = . 
      008810 BF                    1702         .byte      4
      008811 24 90 93 90           1703         .ascii     "/MOD"
      000873                       1704 SLMOD:
      008815 FE 90 B3         [ 4] 1705         CALL	OVER
      008818 24 2C 02         [ 4] 1706         CALL	ZLESS
      00881B EF 02 1C         [ 4] 1707         CALL	SWAPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



      00881E 00 02 81         [ 2] 1708         JP	MSMOD
                                   1709 
                                   1710 ;       MOD     ( n n -- r )
                                   1711 ;       Signed divide. Return mod only.
      008821 88 06                 1712         .word      LINK
                           000881  1713 LINK = . 
      008823 06                    1714         .byte      3
      008824 57 49 54              1715         .ascii     "MOD"
      000885                       1716 MODD:
      008827 48 49 4E         [ 4] 1717 	CALL	SLMOD
      00882A CC 04 6A         [ 2] 1718 	JP	DROP
                                   1719 
                                   1720 ;       /       ( n n -- q )
                                   1721 ;       Signed divide. Return quotient only.
      00882A CD 85                 1722         .word      LINK
                           00088D  1723 LINK = . 
      00882C 1E                    1724         .byte      1
      00882D CD                    1725         .ascii     "/"
      00088F                       1726 SLASH:
      00882E 87 68 CD         [ 4] 1727         CALL	SLMOD
      008831 84 BD CD         [ 4] 1728         CALL	SWAPP
      008834 87 68 CD         [ 2] 1729         JP	DROP
                                   1730 
                                   1731 ;; Multiply
                                   1732 
                                   1733 ;       UM*     ( u u -- ud )
                                   1734 ;       Unsigned multiply. Return double product.
      008837 84 9E                 1735         .word      LINK
                           00089A  1736 LINK = . 
      008839 CC                    1737         .byte      3
      00883A 87 AF 88              1738         .ascii     "UM*"
      00089E                       1739 UMSTA:	; stack have 4 bytes u1=a,b u2=c,d
                           000001  1740 .if  PICATOUT_MOD 
                                   1741 ; take advantage of SP addressing modes
                                   1742 ; these PRODx in RAM are not required
                                   1743 ; the product is kept on stack as local variable 
                                   1744         ;; bytes offset on data stack 
                           000002  1745         da=2 
                           000003  1746         db=3 
                           000000  1747         dc=0 
                           000001  1748         dd=1 
                                   1749         ;; product bytes offset on return stack 
                           000001  1750         UD1=1  ; ud bits 31..24
                           000002  1751         UD2=2  ; ud bits 23..16
                           000003  1752         UD3=3  ; ud bits 15..8 
                           000004  1753         UD4=4  ; ud bits 7..0 
                                   1754         ;; local variable for product set to zero   
      00883D 23 06            [ 1] 1755         clrw y 
      00883F 55 4D            [ 2] 1756         pushw y  ; bits 15..0
      008841 2F 4D            [ 2] 1757         pushw y  ; bits 31..16 
      008843 4F 44            [ 1] 1758         ld a,(db,x) ; b 
      008845 90 97            [ 1] 1759         ld yl,a 
      008845 BF 22            [ 1] 1760         ld a,(dd,x)   ; d
      008847 FE BF            [ 4] 1761         mul y,a    ; b*d  
      008849 24 90            [ 2] 1762         ldw (UD3,sp),y ; lowest weight product 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



      00884B BE 22            [ 1] 1763         ld a,(db,x)
      00884D 90 EE            [ 1] 1764         ld yl,a 
      00884F 04 BE            [ 1] 1765         ld a,(dc,x)
      008851 22 EE            [ 4] 1766         mul y,a  ; b*c 
                                   1767         ;;; do the partial sum 
      008853 02 B3 24         [ 2] 1768         addw y,(UD2,sp)
      008856 23               [ 1] 1769         clr a 
      008857 0F               [ 1] 1770         rlc a
      008858 BE 22            [ 1] 1771         ld (UD1,sp),a 
      00885A 1C 00            [ 2] 1772         ldw (UD2,sp),y 
      00885C 02 90            [ 1] 1773         ld a,(da,x)
      00885E AE FF            [ 1] 1774         ld yl,a 
      008860 FF FF            [ 1] 1775         ld a,(dd,x)
      008862 90 5F            [ 4] 1776         mul y,a   ; a*d 
                                   1777         ;; do partial sum 
      008864 EF 02 81         [ 2] 1778         addw y,(UD2,sp)
      008867 4F               [ 1] 1779         clr a 
      008867 5D 26            [ 1] 1780         adc a,(UD1,sp)
      008869 11 93            [ 1] 1781         ld (UD1,sp),a  
      00886B 90 BE            [ 2] 1782         ldw (UD2,sp),y 
      00886D 24 65            [ 1] 1783         ld a,(da,x)
      00886F 89 BE            [ 1] 1784         ld yl,a 
      008871 22 1C            [ 1] 1785         ld a,(dc,x)
      008873 00 02            [ 4] 1786         mul y,a  ;  a*c highest weight product 
                                   1787         ;;; do partial sum 
      008875 EF 02 90         [ 2] 1788         addw y,(UD1,sp)
      008878 85               [ 2] 1789         ldw (x),y  ; udh 
      008879 FF 81            [ 2] 1790         ldw y,(UD3,sp)
      00887B EF 02            [ 2] 1791         ldw (2,x),y  ; udl  
      00887B A6 11            [ 2] 1792         addw sp,#4 ; drop local variable 
      00887D 81               [ 4] 1793         ret  
                           000000  1794 .else
                                   1795 	LD A,(2,X)	; b
                                   1796 	LD YL,A
                                   1797 	LD A,(X)	; d
                                   1798 	MUL Y,A
                                   1799 	LDW PROD1,Y
                                   1800 	LD A,(3,X)	; a
                                   1801 	LD YL,A
                                   1802 	LD A,(X)	; d
                                   1803 	MUL Y,A
                                   1804 	LDW PROD2,Y
                                   1805 	LD A,(2,X)	; b
                                   1806 	LD YL,A
                                   1807 	LD A,(1,X)	; c
                                   1808 	MUL Y,A
                                   1809 	LDW PROD3,Y
                                   1810 	LD A,(3,X)	; a
                                   1811 	LD YL,A
                                   1812 	LD A,(1,X)	; c
                                   1813 	MUL Y,A	; least signifiant product
                                   1814 	CLR A
                                   1815 	RRWA Y
                                   1816 	LD (3,X),A	; store least significant byte
                                   1817 	ADDW Y,PROD3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



                                   1818 	CLR A
                                   1819 	ADC A,#0	; save carry
                                   1820 	LD CARRY,A
                                   1821 	ADDW Y,PROD2
                                   1822 	LD A,CARRY
                                   1823 	ADC A,#0	; add 2nd carry
                                   1824 	LD CARRY,A
                                   1825 	CLR A
                                   1826 	RRWA Y
                                   1827 	LD (2,X),A	; 2nd product byte
                                   1828 	ADDW Y,PROD1
                                   1829 	RRWA Y
                                   1830 	LD (1,X),A	; 3rd product byte
                                   1831 	RRWA Y  	; 4th product byte now in A
                                   1832 	ADC A,CARRY	; fill in carry bits
                                   1833 	LD (X),A
                                   1834 	RET
                                   1835 .endif 
                                   1836 
                                   1837 
                                   1838 ;       *       ( n n -- n )
                                   1839 ;       Signed multiply. Return single product.
      00887D B3 24                 1840         .word      LINK
                           0008E6  1841 LINK = . 
      00887F 25                    1842         .byte      1
      008880 04                    1843         .ascii     "*"
      0008E8                       1844 STAR:
      008881 72 B0 00         [ 4] 1845 	CALL	UMSTA
      008884 24 04 6A         [ 2] 1846 	JP	DROP
                                   1847 
                                   1848 ;       M*      ( n n -- d )
                                   1849 ;       Signed multiply. Return double product.
      008885 08 E6                 1850         .word      LINK
                           0008F0  1851 LINK = . 
      008885 8C                    1852         .byte      2
      008886 90 59                 1853         .ascii     "M*"
      0008F3                       1854 MSTAR:      
      008888 59 4A 22         [ 4] 1855         CALL	DDUP
      00888B F1 56 BF         [ 4] 1856         CALL	XORR
      00888E 24 BE 22         [ 4] 1857         CALL	ZLESS
      008891 1C 00 02         [ 4] 1858         CALL	TOR
      008894 FF 90 BE         [ 4] 1859         CALL	ABSS
      008897 24 EF 02         [ 4] 1860         CALL	SWAPP
      00889A 81 88 3E         [ 4] 1861         CALL	ABSS
      00889D 05 4D 2F         [ 4] 1862         CALL	UMSTA
      0088A0 4D 4F 44         [ 4] 1863         CALL	RFROM
      0088A3 CD 03 78         [ 4] 1864         CALL	QBRAN
      0088A3 CD 84                 1865         .word	MSTA1
      0088A5 F4 CD 85         [ 4] 1866         CALL	DNEGA
      0088A8 2D               [ 4] 1867 MSTA1:	RET
                                   1868 
                                   1869 ;       . /MOD   ( n1 n2 n3 -- r q )
                                   1870 ;       Multiply n1 and n2, then divide
                                   1871 ;       by n3. Return mod and quotient.
      0088A9 CD 84                 1872         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



                           000919  1873 LINK = . 
      0088AB F4                    1874         .byte      5
      0088AC CD 84 BD CD 83        1875         .ascii     "*/MOD"
      00091F                       1876 SSMOD:
      0088B1 F8 88 C0         [ 4] 1877         CALL     TOR
      0088B4 CD 87 1A         [ 4] 1878         CALL     MSTAR
      0088B7 CD 84 BD         [ 4] 1879         CALL     RFROM
      0088BA CD 87 2C         [ 2] 1880         JP     MSMOD
                                   1881 
                                   1882 ;       */      ( n1 n2 n3 -- q )
                                   1883 ;       Multiply n1 by n2, then divide
                                   1884 ;       by n3. Return quotient only.
      0088BD CD 84                 1885         .word      LINK
                           00092D  1886 LINK = . 
      0088BF 9E                    1887         .byte      2
      0088C0 CD 84                 1888         .ascii     "*/"
      000930                       1889 STASL:
      0088C2 BD CD 84         [ 4] 1890         CALL	SSMOD
      0088C5 F4 CD 85         [ 4] 1891         CALL	SWAPP
      0088C8 2D CD 83         [ 2] 1892         JP	DROP
                                   1893 
                                   1894 ;; Miscellaneous
                                   1895 
                                   1896 ;       CELL+   ( a -- a )
                                   1897 ;       Add cell size in byte to address.
      0088CB F8 88                 1898         .word      LINK
                           00093B  1899 LINK = . 
      0088CD D4                    1900         .byte       2
      0088CE CD 84                 1901         .ascii     "2+"
      00093E                       1902 CELLP:
      0088D0 B1 CD            [ 1] 1903         LDW Y,X
      0088D2 86 EF            [ 2] 1904 	LDW Y,(Y)
      0088D4 CD 84 9E CD      [ 2] 1905         ADDW Y,#CELLL 
      0088D8 88               [ 2] 1906         LDW (X),Y
      0088D9 45               [ 4] 1907         RET
                                   1908 
                                   1909 ;       CELL-   ( a -- a )
                                   1910 ;       Subtract 2 from address.
      0088DA CD 84                 1911         .word      LINK
                           00094A  1912 LINK = . 
      0088DC 9E                    1913         .byte       2
      0088DD CD 83                 1914         .ascii     "2-"
      00094D                       1915 CELLM:
      0088DF F8 88            [ 1] 1916         LDW Y,X
      0088E1 EB CD            [ 2] 1917 	LDW Y,(Y)
      0088E3 85 04 CD 87      [ 2] 1918         SUBW Y,#CELLL
      0088E7 1A               [ 2] 1919         LDW (X),Y
      0088E8 CD               [ 4] 1920         RET
                                   1921 
                                   1922 ;       CELLS   ( n -- n )
                                   1923 ;       Multiply tos by 2.
      0088E9 85 04                 1924         .word      LINK
                           000959  1925 LINK = . 
      0088EB 81                    1926         .byte       2
      0088EC 88 9D                 1927         .ascii     "2*"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



      00095C                       1928 CELLS:
      0088EE 04 2F            [ 1] 1929         LDW Y,X
      0088F0 4D 4F            [ 2] 1930 	LDW Y,(Y)
      0088F2 44 58            [ 2] 1931         SLAW Y
      0088F3 FF               [ 2] 1932         LDW (X),Y
      0088F3 CD               [ 4] 1933         RET
                                   1934 
                                   1935 ;       1+      ( a -- a )
                                   1936 ;       Add cell size in byte to address.
      0088F4 85 1E                 1937         .word      LINK
                           000966  1938 LINK = . 
      0088F6 CD                    1939         .byte      2
      0088F7 85 2D                 1940         .ascii     "1+"
      000969                       1941 ONEP:
      0088F9 CD 85            [ 1] 1942         LDW Y,X
      0088FB 04 CC            [ 2] 1943 	LDW Y,(Y)
      0088FD 88 A3            [ 2] 1944         INCW Y
      0088FF 88               [ 2] 1945         LDW (X),Y
      008900 EE               [ 4] 1946         RET
                                   1947 
                                   1948 ;       1-      ( a -- a )
                                   1949 ;       Subtract 2 from address.
      008901 03 4D                 1950         .word      LINK
                           000973  1951 LINK = . 
      008903 4F                    1952         .byte      2
      008904 44 2D                 1953         .ascii     "1-"
      008905                       1954 ONEM:
      008905 CD 88            [ 1] 1955         LDW Y,X
      008907 F3 CC            [ 2] 1956 	LDW Y,(Y)
      008909 84 EA            [ 2] 1957         DECW Y
      00890B 89               [ 2] 1958         LDW (X),Y
      00890C 01               [ 4] 1959         RET
                                   1960 
                                   1961 ;  shift left n times 
                                   1962 ; LSHIFT ( n1 n2 -- n1<<n2 )
      00890D 01 2F                 1963         .word LINK 
                           000980  1964         LINK=.
      00890F 06                    1965         .byte 6 
      00890F CD 88 F3 CD 85 04     1966         .ascii "LSHIFT"
      000987                       1967 LSHIFT:
      008915 CC 84            [ 1] 1968         ld a,(1,x)
      008917 EA 89 0D         [ 2] 1969         addw x,#CELLL 
      00891A 03 55            [ 1] 1970         ldw y,x 
      00891C 4D 2A            [ 2] 1971         ldw y,(y)
      00891E                       1972 LSHIFT1:
      00891E 90               [ 1] 1973         tnz a 
      00891F 5F 90            [ 1] 1974         jreq LSHIFT4 
      008921 89 90            [ 2] 1975         sllw y 
      008923 89               [ 1] 1976         dec a 
      008924 E6 03            [ 2] 1977         jra LSHIFT1 
      000998                       1978 LSHIFT4:
      008926 90               [ 2] 1979         ldw (x),y 
      008927 97               [ 4] 1980         ret 
                                   1981 
                                   1982 ; shift right n times                 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



                                   1983 ; RSHIFT (n1 n2 -- n1>>n2 )
      008928 E6 01                 1984         .word LINK 
                           00099C  1985         LINK=.
      00892A 90                    1986         .byte 6
      00892B 42 17 03 E6 03 90     1987         .ascii "RSHIFT"
      0009A3                       1988 RSHIFT:
      008931 97 E6            [ 1] 1989         ld a,(1,x)
      008933 00 90 42         [ 2] 1990         addw x,#CELLL 
      008936 72 F9            [ 1] 1991         ldw y,x 
      008938 02 4F            [ 2] 1992         ldw y,(y)
      0009AC                       1993 RSHIFT1:
      00893A 49               [ 1] 1994         tnz a 
      00893B 6B 01            [ 1] 1995         jreq RSHIFT4 
      00893D 17 02            [ 2] 1996         srlw y 
      00893F E6               [ 1] 1997         dec a 
      008940 02 90            [ 2] 1998         jra RSHIFT1 
      0009B4                       1999 RSHIFT4:
      008942 97               [ 2] 2000         ldw (x),y 
      008943 E6               [ 4] 2001         ret 
                                   2002 
                                   2003 
                                   2004 ;       2/      ( n -- n )
                                   2005 ;       divide  tos by 2.
      008944 01 90                 2006         .word      LINK
                           0009B8  2007 LINK = . 
      008946 42                    2008         .byte      2
      008947 72 F9                 2009         .ascii     "2/"
      0009BB                       2010 TWOSL:
      008949 02 4F            [ 1] 2011         LDW Y,X
      00894B 19 01            [ 2] 2012 	LDW Y,(Y)
      00894D 6B 01            [ 2] 2013         SRAW Y
      00894F 17               [ 2] 2014         LDW (X),Y
      008950 02               [ 4] 2015         RET
                                   2016 
                                   2017 ;       BL      ( -- 32 )
                                   2018 ;       Return 32,  blank character.
      008951 E6 02                 2019         .word      LINK
                           0009C5  2020 LINK = . 
      008953 90                    2021         .byte      2
      008954 97 E6                 2022         .ascii     "BL"
      0009C8                       2023 BLANK:
      008956 00 90 42         [ 2] 2024         SUBW X,#2
      008959 72 F9 01 FF      [ 2] 2025 	LDW Y,#32
      00895D 16               [ 2] 2026         LDW (X),Y
      00895E 03               [ 4] 2027         RET
                                   2028 
                                   2029 ;         0     ( -- 0)
                                   2030 ;         Return 0.
      00895F EF 02                 2031         .word      LINK
                           0009D3  2032 LINK = . 
      008961 5B                    2033         .byte       1
      008962 04                    2034         .ascii     "0"
      0009D5                       2035 ZERO:
      008963 81 89 1A         [ 2] 2036         SUBW X,#2
      008966 01 2A            [ 1] 2037 	CLRW Y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



      008968 FF               [ 2] 2038         LDW (X),Y
      008968 CD               [ 4] 2039         RET
                                   2040 
                                   2041 ;         1     ( -- 1)
                                   2042 ;         Return 1.
      008969 89 1E                 2043         .word      LINK
                           0009DE  2044 LINK = . 
      00896B CC                    2045         .byte       1
      00896C 84                    2046         .ascii     "1"
      0009E0                       2047 ONE:
      00896D EA 89 66         [ 2] 2048         SUBW X,#2
      008970 02 4D 2A 01      [ 2] 2049 	LDW Y,#1
      008973 FF               [ 2] 2050         LDW (X),Y
      008973 CD               [ 4] 2051         RET
                                   2052 
                                   2053 ;         -1    ( -- -1)
                                   2054 ;         Return 32,  blank character.
      008974 86 DA                 2055         .word      LINK
                           0009EB  2056 LINK = . 
      008976 CD                    2057         .byte       2
      008977 85 69                 2058         .ascii     "-1"
      0009EE                       2059 MONE:
      008979 CD 85 2D         [ 2] 2060         SUBW X,#2
      00897C CD 84 BD CD      [ 2] 2061 	LDW Y,#0xFFFF
      008980 87               [ 2] 2062         LDW (X),Y
      008981 82               [ 4] 2063         RET
                                   2064 
                                   2065 ;       >CHAR   ( c -- c )
                                   2066 ;       Filter non-printing characters.
      008982 CD 85                 2067         .word      LINK
                           0009F9  2068 LINK = . 
      008984 04                    2069         .byte      5
      008985 CD 87 82 CD 89        2070         .ascii     ">CHAR"
      0009FF                       2071 TCHAR:
                           000001  2072 .if CONVERT_TO_CODE
      00898A 1E CD            [ 1] 2073         ld a,(1,x)
      00898C 84 9E            [ 1] 2074         cp a,#32  
      00898E CD 83            [ 1] 2075         jrmi 1$ 
      008990 F8 89            [ 1] 2076         cp a,#127 
      008992 96 CD            [ 1] 2077         jrpl 1$ 
      008994 87               [ 4] 2078         ret 
      008995 2C 81            [ 1] 2079 1$:     ld a,#'_ 
      008997 89 70            [ 1] 2080         ld (1,x),a 
      008999 05               [ 4] 2081         ret 
                           000000  2082 .else
                                   2083         CALL     DOLIT
                                   2084         .word       0x7F
                                   2085         CALL     ANDD
                                   2086         CALL     DUPP    ;mask msb
                                   2087         CALL     DOLIT
                                   2088         .word      127
                                   2089         CALL     BLANK
                                   2090         CALL     WITHI   ;check for printable
                                   2091         CALL     QBRAN
                                   2092         .word    TCHA1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



                                   2093         CALL     DROP
                                   2094         CALL     DOLIT
                                   2095         .word     0x5F		; "_"     ;replace non-printables
                                   2096 .endif 
      00899A 2A               [ 4] 2097 TCHA1:  RET
                                   2098 
                                   2099 ;       DEPTH   ( -- n )
                                   2100 ;       Return  depth of  data stack.
      00899B 2F 4D                 2101         .word      LINK
                           000A12  2102 LINK = . 
      00899D 4F                    2103         .byte      5
      00899E 44 45 50 54 48        2104         .ascii     "DEPTH"
      00899F                       2105 DEPTH: 
      00899F CD 84 BD         [ 2] 2106         LDW Y,SP0    ;save data stack ptr
      0089A2 CD 89            [ 2] 2107 	LDW XTEMP,X
      0089A4 73 CD 84 9E      [ 2] 2108         SUBW Y,XTEMP     ;#bytes = SP0 - X
      0089A8 CC 88            [ 2] 2109         SRAW Y    ;Y = #stack items
                           000001  2110 .if PICATOUT_MOD
                                   2111 ; why ? 
                                   2112 ;      	DECW Y
                                   2113 .endif 
      0089AA A3 89 99         [ 2] 2114 	SUBW X,#2
      0089AD 02               [ 2] 2115         LDW (X),Y     ; if neg, underflow
      0089AE 2A               [ 4] 2116         RET
                                   2117 
                                   2118 ;       PICK    ( ... +n -- ... w )
                                   2119 ;       Copy  nth stack item to tos.
      0089AF 2F 12                 2120         .word      LINK
                           000A2A  2121 LINK = . 
      0089B0 04                    2122         .byte      4
      0089B0 CD 89 9F CD           2123         .ascii     "PICK"
      000A2F                       2124 PICK:
      0089B4 85 04            [ 1] 2125         LDW Y,X   ;D = n1
      0089B6 CC 84            [ 2] 2126         LDW Y,(Y)
                           000001  2127 .if PICATOUT_MOD
                                   2128 ; modified for standard compliance          
                                   2129 ; 0 PICK must be equivalent to DUP 
      0089B8 EA 89            [ 2] 2130         INCW Y 
                                   2131 .endif         
      0089BA AD 02            [ 2] 2132         SLAW Y
      0089BC 32 2B            [ 2] 2133         LDW XTEMP,X
      0089BE 72 B9 00 22      [ 2] 2134         ADDW Y,XTEMP
      0089BE 90 93            [ 2] 2135         LDW Y,(Y)
      0089C0 90               [ 2] 2136         LDW (X),Y
      0089C1 FE               [ 4] 2137         RET
                                   2138 
                                   2139 ;; Memory access
                                   2140 
                                   2141 ;       +!      ( n a -- )
                                   2142 ;       Add n to  contents at address a.
      0089C2 72 A9                 2143         .word      LINK
                           000A43  2144 LINK = . 
      0089C4 00                    2145         .byte      2
      0089C5 02 FF                 2146         .ascii     "+!"
      000A46                       2147 PSTOR:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



                           000001  2148 .if CONVERT_TO_CODE
      0089C7 81 89            [ 1] 2149         ldw y,x 
      0089C9 BB 02            [ 2] 2150         ldw y,(y)
      0089CB 32 2D 24         [ 2] 2151         ldw YTEMP,y  ; address
      0089CD 90 FE            [ 2] 2152         ldw y,(y)  
      0089CD 90 93            [ 2] 2153         pushw y  ; value at address 
      0089CF 90 FE            [ 1] 2154         ldw y,x 
      0089D1 72 A2 00         [ 2] 2155         ldw y,(2,y) ; n 
      0089D4 02 FF 81         [ 2] 2156         addw y,(1,sp) ; n+value
      0089D7 89 CA 02         [ 5] 2157         ldw [YTEMP],y ;  a!
      0089DA 32 2A            [ 2] 2158         popw y    ;drop local var
      0089DC 1C 00 04         [ 2] 2159         addw x,#4 ; DDROP 
      0089DC 90               [ 4] 2160         ret 
                           000000  2161 .else
                                   2162         CALL	SWAPP
                                   2163         CALL	OVER
                                   2164         CALL	AT
                                   2165         CALL	PLUS
                                   2166         CALL	SWAPP
                                   2167         JP	STORE
                                   2168 .endif 
                                   2169 
                                   2170 ;       2!      ( d a -- )
                                   2171 ;       Store  double integer to address a.
      0089DD 93 90                 2172         .word      LINK
                           000A64  2173 LINK = . 
      0089DF FE                    2174         .byte      2
      0089E0 90 58                 2175         .ascii     "2!"
      000A67                       2176 DSTOR:
                           000001  2177 .if CONVERT_TO_CODE
      0089E2 FF 81            [ 1] 2178         ldw y,x 
      0089E4 89 D9            [ 2] 2179         ldw y,(y)
      0089E6 02 31 2B         [ 2] 2180         ldw YTEMP,y ; address 
      0089E9 1C 00 02         [ 2] 2181         addw x,#CELLL ; drop a 
      0089E9 90 93            [ 1] 2182         ldw y,x 
      0089EB 90 FE            [ 2] 2183         ldw y,(y) ; hi word 
      0089ED 90               [ 2] 2184         pushw x 
      0089EE 5C FF            [ 2] 2185         ldw x,(2,x) ; lo word 
      0089F0 81 89 E6         [ 5] 2186         ldw [YTEMP],y
      0089F3 02 31            [ 1] 2187         ldw y,x 
      0089F5 2D 00 02         [ 2] 2188         ldw x,#2 
      0089F6 92 DF 24         [ 5] 2189         ldw ([YTEMP],x),y 
      0089F6 90               [ 2] 2190         popw x 
      0089F7 93 90 FE         [ 2] 2191         addw x,#4 ; DDROP 
      0089FA 90               [ 4] 2192         ret 
                           000000  2193 .else
                                   2194         CALL	SWAPP
                                   2195         CALL	OVER
                                   2196         CALL	STORE
                                   2197         CALL	CELLP
                                   2198         JP	STORE
                                   2199 .endif 
                                   2200 ;       2@      ( a -- d )
                                   2201 ;       Fetch double integer from address a.
      0089FB 5A FF                 2202         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



                           000A8A  2203 LINK = . 
      0089FD 81                    2204         .byte      2
      0089FE 89 F3                 2205         .ascii     "2@"
      000A8D                       2206 DAT:
                           000001  2207 .if CONVERT_TO_CODE
      008A00 06 4C            [ 1] 2208         ldw y,x 
      008A02 53 48            [ 2] 2209         ldw y,(y) ;address 
      008A04 49 46 54         [ 2] 2210         ldw YTEMP,y 
      008A07 1D 00 02         [ 2] 2211         subw x,#CELLL ; space for udh 
      008A07 E6 01 1C         [ 5] 2212         ldw y,[YTEMP] ; udh 
      008A0A 00               [ 2] 2213         ldw (x),y 
      008A0B 02 90 93 90      [ 2] 2214         ldw y,#2
      008A0F FE DE 24         [ 5] 2215         ldw y,([YTEMP],y) ; udl 
      008A10 EF 02            [ 2] 2216         ldw (2,x),y
      008A10 4D               [ 4] 2217         ret 
                           000000  2218 .else 
                                   2219         CALL	DUPP
                                   2220         CALL	CELLP
                                   2221         CALL	AT
                                   2222         CALL	SWAPP
                                   2223         JP	AT
                                   2224 .endif 
                                   2225 
                                   2226 ;       COUNT   ( b -- b +n )
                                   2227 ;       Return count byte of a string
                                   2228 ;       and add 1 to byte address.
      008A11 27 05                 2229         .word      LINK
                           000AA7  2230 LINK = . 
      008A13 90                    2231         .byte      5
      008A14 58 4A 20 F8 54        2232         .ascii     "COUNT"
      008A18                       2233 COUNT:
                           000001  2234 .if CONVERT_TO_CODE
      008A18 FF 81            [ 1] 2235         ldw y,x 
      008A1A 8A 00            [ 2] 2236         ldw y,(y) ; address 
      008A1C 06 52            [ 1] 2237         ld a,(y)  ; count 
      008A1E 53 48            [ 2] 2238         incw y 
      008A20 49               [ 2] 2239         ldw (x),y 
      008A21 46 54 02         [ 2] 2240         subw x,#CELLL 
      008A23 E7 01            [ 1] 2241         ld (1,x),a 
      008A23 E6               [ 1] 2242         clr (x)
      008A24 01               [ 4] 2243         ret 
                           000000  2244 .else 
                                   2245         CALL     DUPP
                                   2246         CALL     ONEP
                                   2247         CALL     SWAPP
                                   2248         JP     CAT
                                   2249 .endif 
                                   2250 
                                   2251 ;       HERE    ( -- a )
                                   2252 ;       Return  top of  variables
      008A25 1C 00                 2253         .word      LINK
                           000ABF  2254 LINK = . 
      008A27 02                    2255         .byte      4
      008A28 90 93 90 FE           2256         .ascii     "HERE"
      008A2C                       2257 HERE:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



                           000001  2258 .if CONVERT_TO_CODE
      008A2C 4D 27 05 90      [ 2] 2259       	ldw y,#UVP 
      008A30 54 4A            [ 2] 2260         ldw y,(y)
      008A32 20 F8 02         [ 2] 2261         subw x,#CELLL 
      008A34 FF               [ 2] 2262         ldw (x),y 
      008A34 FF               [ 4] 2263         ret 
                           000000  2264 .else
                                   2265         CALL     VPP
                                   2266         JP     AT
                                   2267 .endif 
                                   2268 
                                   2269 ;       PAD     ( -- a )
                                   2270 ;       Return address of text buffer
                                   2271 ;       above  code dictionary.
      008A35 81 8A                 2272         .word      LINK
                           000AD1  2273 LINK = . 
      008A37 1C                    2274         .byte      3
      008A38 02 32 2F              2275         .ascii     "PAD"
      008A3B                       2276 PAD:
      008A3B 90 93 90         [ 4] 2277         CALL     HERE
      008A3E FE 90 57         [ 4] 2278         CALL     DOLIT
      008A41 FF 81                 2279         .word      80
      008A43 8A 38 02         [ 2] 2280         JP     PLUS
                                   2281 
                                   2282 ;       TIB     ( -- a )
                                   2283 ;       Return address of terminal input buffer.
      008A46 42 4C                 2284         .word      LINK
                           000AE2  2285 LINK = . 
      008A48 03                    2286         .byte      3
      008A48 1D 00 02              2287         .ascii     "TIB"
      000AE6                       2288 TIB:
      008A4B 90 AE 00         [ 4] 2289         CALL     NTIB
      008A4E 20 FF 81         [ 4] 2290         CALL     CELLP
      008A51 8A 45 01         [ 2] 2291         JP     AT
                                   2292 
                                   2293 ;       @EXECUTE        ( a -- )
                                   2294 ;       Execute vector stored in address a.
      008A54 30 E2                 2295         .word      LINK
                           000AF1  2296 LINK = . 
      008A55 08                    2297         .byte      8
      008A55 1D 00 02 90 5F FF 81  2298         .ascii     "@EXECUTE"
             8A
      000AFA                       2299 ATEXE:
      008A5D 53 01 31         [ 4] 2300         CALL     AT
      008A60 CD 06 1E         [ 4] 2301         CALL     QDUP    ;?address or zero
      008A60 1D 00 02         [ 4] 2302         CALL     QBRAN
      008A63 90 AE                 2303         .word      EXE1
      008A65 00 01 FF         [ 4] 2304         CALL     EXECU   ;execute if non-zero
      008A68 81               [ 4] 2305 EXE1:   RET     ;do nothing if zero
                                   2306 
                                   2307 ;       CMOVE   ( b1 b2 u -- )
                                   2308 ;       Copy u bytes from b1 to b2.
      008A69 8A 5E                 2309         .word      LINK
                           000B0B  2310 LINK = . 
      008A6B 02                    2311         .byte      5
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



      008A6C 2D 31 4F 56 45        2312         .ascii     "CMOVE"
      008A6E                       2313 CMOVE:
      008A6E 1D 00 02         [ 4] 2314         CALL	TOR
      008A71 90 AE FF         [ 4] 2315         CALL	BRAN
      008A74 FF FF                 2316         .word	CMOV2
      008A76 81 8A 6B         [ 4] 2317 CMOV1:	CALL	TOR
      008A79 05 3E 43         [ 4] 2318         CALL	DUPP
      008A7C 48 41 52         [ 4] 2319         CALL	CAT
      008A7F CD 04 31         [ 4] 2320         CALL	RAT
      008A7F E6 01 A1         [ 4] 2321         CALL	CSTOR
      008A82 20 2B 05         [ 4] 2322         CALL	ONEP
      008A85 A1 7F 2A         [ 4] 2323         CALL	RFROM
      008A88 01 81 A6         [ 4] 2324         CALL	ONEP
      008A8B 5F E7 01         [ 4] 2325 CMOV2:	CALL	DONXT
      008A8E 81 81                 2326         .word	CMOV1
      008A90 8A 79 05         [ 2] 2327         JP	DDROP
                                   2328 
                                   2329 ;       FILL    ( b u c -- )
                                   2330 ;       Fill u bytes of character c
                                   2331 ;       to area beginning at b.
      008A93 44 45                 2332         .word       LINK
                           000B3B  2333 LINK = . 
      008A95 50                    2334         .byte       4
      008A96 54 48 4C 4C           2335         .ascii     "FILL"
      008A98                       2336 FILL:
                           000001  2337 .if CONVERT_TO_CODE
      008A98 90 BE            [ 1] 2338         ldw y,x 
      008A9A 2A BF 22         [ 1] 2339         ld a,(1,y) ; c 
      008A9D 72 B2 00         [ 2] 2340         addw x,#CELLL ; drop c 
      008AA0 22 90            [ 1] 2341         ldw y,x 
      008AA2 57 1D            [ 2] 2342         ldw y,(y) ; count
      008AA4 00 02            [ 2] 2343         pushw y 
      008AA6 FF 81 8A         [ 2] 2344         addw x,#CELLL ; drop u 
      008AA9 92 04            [ 1] 2345         ldw y,x 
      008AAB 50 49 43         [ 2] 2346         addw x,#CELLL ; drop b 
      008AAE 4B FE            [ 2] 2347         ldw y,(y) ; address
      008AAF 90 BF 24         [ 2] 2348         ldw YTEMP,y
      008AAF 90 93            [ 2] 2349         popw y ; count 
      000B5D                       2350 FILL1:  
      008AB1 90 FE 90         [ 4] 2351         ld [YTEMP],a 
      008AB4 5C 90            [ 1] 2352         inc YTEMP+1
      008AB6 58 BF            [ 1] 2353         jrnc FILL2 
      008AB8 22 72            [ 1] 2354         inc YTEMP
      000B66                       2355 FILL2: 
      008ABA B9 00            [ 2] 2356         decw y ; count 
      008ABC 22 90            [ 1] 2357         jrne FILL1  
      008ABE FE               [ 4] 2358         ret 
                           000000  2359 .else 
                                   2360         CALL	SWAPP
                                   2361         CALL	TOR
                                   2362         CALL	SWAPP
                                   2363         CALL	BRAN
                                   2364         .word	FILL2
                                   2365 FILL1:	CALL	DDUP
                                   2366         CALL	CSTOR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



                                   2367         CALL	ONEP
                                   2368 FILL2:	CALL	DONXT
                                   2369         .word	FILL1
                                   2370         JP	DDROP
                                   2371 .endif
                                   2372 
                                   2373 ;       ERASE   ( b u -- )
                                   2374 ;       Erase u bytes beginning at b.
      008ABF FF 81                 2375         .word      LINK
                           000B6D  2376 LINK = . 
      008AC1 8A                    2377         .byte      5
      008AC2 AA 02 2B 21 45        2378         .ascii     "ERASE"
      008AC6                       2379 ERASE:
                           000001  2380 .if CONVERT_TO_CODE
      008AC6 90 93            [ 1] 2381         clrw y 
      008AC8 90 FE 90         [ 2] 2382         subw x,#CELLL 
      008ACB BF               [ 2] 2383         ldw (x),y 
      008ACC 24 90 FE         [ 2] 2384         jp FILL 
                           000000  2385 .else 
                                   2386         CALL     ZERO
                                   2387         JP     FILL
                                   2388 .endif 
                                   2389 ;       PACK0x   ( b u a -- a )
                                   2390 ;       Build a counted string with
                                   2391 ;       u characters from b. Null fill.
      008ACF 90 89                 2392         .word      LINK
                           000B7E  2393 LINK = . 
      008AD1 90                    2394         .byte      5
      008AD2 93 90 EE 02 72 F9     2395         .ascii     "PACK0X"
      000B85                       2396 PACKS:
      008AD8 01 91 CF         [ 4] 2397         CALL     DUPP
      008ADB 24 90 85         [ 4] 2398         CALL     TOR     ;strings only on cell boundary
      008ADE 1C 00 04         [ 4] 2399         CALL     DDUP
      008AE1 81 8A C3         [ 4] 2400         CALL     CSTOR
      008AE4 02 32 21         [ 4] 2401         CALL     ONEP ;save count
      008AE7 CD 04 84         [ 4] 2402         CALL     SWAPP
      008AE7 90 93 90         [ 4] 2403         CALL     CMOVE
      008AEA FE 90 BF         [ 4] 2404         CALL     RFROM
      008AED 24               [ 4] 2405         RET
                                   2406 
                                   2407 ;; Numeric output, single precision
                                   2408 
                                   2409 ;       DIGIT   ( u -- c )
                                   2410 ;       Convert digit u to a character.
      008AEE 1C 00                 2411         .word      LINK
                           000BA0  2412 LINK = . 
      008AF0 02                    2413         .byte      5
      008AF1 90 93 90 FE 89        2414         .ascii     "DIGIT"
      000BA6                       2415 DIGIT:
      008AF6 EE 02 91         [ 4] 2416         CALL	DOLIT
      008AF9 CF 24                 2417         .word	9
      008AFB 90 93 AE         [ 4] 2418         CALL	OVER
      008AFE 00 02 92         [ 4] 2419         CALL	LESS
      008B01 DF 24 85         [ 4] 2420         CALL	DOLIT
      008B04 1C 00                 2421         .word	7
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      008B06 04 81 8A         [ 4] 2422         CALL	ANDD
      008B09 E4 02 32         [ 4] 2423         CALL	PLUS
      008B0C 40 03 45         [ 4] 2424         CALL	DOLIT
      008B0D 00 30                 2425         .word	48	;'0'
      008B0D 90 93 90         [ 2] 2426         JP	PLUS
                                   2427 
                                   2428 ;       EXTRACT ( n base -- n c )
                                   2429 ;       Extract least significant digit from n.
      008B10 FE 90                 2430         .word      LINK
                           000BC6  2431 LINK = . 
      008B12 BF                    2432         .byte      7
      008B13 24 1D 00 02 91 CE 24  2433         .ascii     "EXTRACT"
      000BCE                       2434 EXTRC:
      008B1A FF 90 AE         [ 4] 2435         CALL     ZERO
      008B1D 00 02 91         [ 4] 2436         CALL     SWAPP
      008B20 DE 24 EF         [ 4] 2437         CALL     UMMOD
      008B23 02 81 8B         [ 4] 2438         CALL     SWAPP
      008B26 0A 05 43         [ 2] 2439         JP     DIGIT
                                   2440 
                                   2441 ;       <#      ( -- )
                                   2442 ;       Initiate  numeric output process.
      008B29 4F 55                 2443         .word      LINK
                           000BDF  2444 LINK = . 
      008B2B 4E                    2445         .byte      2
      008B2C 54 23                 2446         .ascii     "<#"
      008B2D                       2447 BDIGS:
      008B2D 90 93 90         [ 4] 2448         CALL     PAD
      008B30 FE 90 F6         [ 4] 2449         CALL     HLD
      008B33 90 5C FF         [ 2] 2450         JP     STORE
                                   2451 
                                   2452 ;       HOLD    ( c -- )
                                   2453 ;       Insert a character into output string.
      008B36 1D 00                 2454         .word      LINK
                           000BED  2455 LINK = . 
      008B38 02                    2456         .byte      4
      008B39 E7 01 7F 81           2457         .ascii     "HOLD"
      000BF2                       2458 HOLD:
      008B3D 8B 27 04         [ 4] 2459         CALL     HLD
      008B40 48 45 52         [ 4] 2460         CALL     AT
      008B43 45 09 76         [ 4] 2461         CALL     ONEM
      008B44 CD 04 74         [ 4] 2462         CALL     DUPP
      008B44 90 AE 00         [ 4] 2463         CALL     HLD
      008B47 16 90 FE         [ 4] 2464         CALL     STORE
      008B4A 1D 00 02         [ 2] 2465         JP     CSTOR
                                   2466 
                                   2467 ;       #       ( u -- u )
                                   2468 ;       Extract one digit from u and
                                   2469 ;       append digit to output string.
      008B4D FF 81                 2470         .word      LINK
                           000C09  2471 LINK = . 
      008B4F 8B                    2472         .byte      1
      008B50 3F                    2473         .ascii     "#"
      000C0B                       2474 DIG:
      008B51 03 50 41         [ 4] 2475         CALL     BASE
      008B54 44 03 CD         [ 4] 2476         CALL     AT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      008B55 CD 0B CE         [ 4] 2477         CALL     EXTRC
      008B55 CD 8B 44         [ 2] 2478         JP     HOLD
                                   2479 
                                   2480 ;       #S      ( u -- 0 )
                                   2481 ;       Convert u until all digits
                                   2482 ;       are added to output string.
      008B58 CD 83                 2483         .word      LINK
                           000C19  2484 LINK = . 
      008B5A C5                    2485         .byte      2
      008B5B 00 50                 2486         .ascii     "#S"
      000C1C                       2487 DIGS:
      008B5D CC 86 EF         [ 4] 2488 DIGS1:  CALL     DIG
      008B60 8B 51 03         [ 4] 2489         CALL     DUPP
      008B63 54 49 42         [ 4] 2490         CALL     QBRAN
      008B66 0C 29                 2491         .word      DIGS2
      008B66 CD 85            [ 2] 2492         JRA     DIGS1
      008B68 DF               [ 4] 2493 DIGS2:  RET
                                   2494 
                                   2495 ;       SIGN    ( n -- )
                                   2496 ;       Add a minus sign to
                                   2497 ;       numeric output string.
      008B69 CD 89                 2498         .word      LINK
                           000C2C  2499 LINK = . 
      008B6B BE                    2500         .byte      4
      008B6C CC 84 4D 8B           2501         .ascii     "SIGN"
      000C31                       2502 SIGN:
      008B70 62 08 40         [ 4] 2503         CALL     ZLESS
      008B73 45 58 45         [ 4] 2504         CALL     QBRAN
      008B76 43 55                 2505         .word      SIGN1
      008B78 54 45 45         [ 4] 2506         CALL     DOLIT
      008B7A 00 2D                 2507         .word      45	;"-"
      008B7A CD 84 4D         [ 2] 2508         JP     HOLD
      008B7D CD               [ 4] 2509 SIGN1:  RET
                                   2510 
                                   2511 ;       #>      ( w -- b u )
                                   2512 ;       Prepare output string.
      008B7E 86 9E                 2513         .word      LINK
                           000C44  2514 LINK = . 
      008B80 CD                    2515         .byte      2
      008B81 83 F8                 2516         .ascii     "#>"
      000C47                       2517 EDIGS:
      008B83 8B 88 CD         [ 4] 2518         CALL     DROP
      008B86 84 1F 81         [ 4] 2519         CALL     HLD
      008B89 8B 71 05         [ 4] 2520         CALL     AT
      008B8C 43 4D 4F         [ 4] 2521         CALL     PAD
      008B8F 56 45 9E         [ 4] 2522         CALL     OVER
      008B91 CC 06 E8         [ 2] 2523         JP     SUBB
                                   2524 
                                   2525 ;       str     ( w -- b u )
                                   2526 ;       Convert a signed integer
                                   2527 ;       to a numeric string.
      008B91 CD 84                 2528         .word      LINK
                           000C5B  2529 LINK = . 
      008B93 BD                    2530         .byte      3
      008B94 CD 84 0F              2531         .ascii     "STR"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



      000C5F                       2532 STR:
      008B97 8B B1 CD         [ 4] 2533         CALL     DUPP
      008B9A 84 BD CD         [ 4] 2534         CALL     TOR
      008B9D 84 F4 CD         [ 4] 2535         CALL     ABSS
      008BA0 84 6B CD         [ 4] 2536         CALL     BDIGS
      008BA3 84 B1 CD         [ 4] 2537         CALL     DIGS
      008BA6 84 5A CD         [ 4] 2538         CALL     RFROM
      008BA9 89 E9 CD         [ 4] 2539         CALL     SIGN
      008BAC 84 9E CD         [ 2] 2540         JP     EDIGS
                                   2541 
                                   2542 ;       HEX     ( -- )
                                   2543 ;       Use radix 16 as base for
                                   2544 ;       numeric conversions.
      008BAF 89 E9                 2545         .word      LINK
                           000C79  2546 LINK = . 
      008BB1 CD                    2547         .byte      3
      008BB2 83 D9 8B              2548         .ascii     "HEX"
      000C7D                       2549 HEX:
      008BB5 99 CC 86         [ 4] 2550         CALL     DOLIT
      008BB8 CF 8B                 2551         .word      16
      008BBA 8B 04 46         [ 4] 2552         CALL     BASE
      008BBD 49 4C 4C         [ 2] 2553         JP     STORE
                                   2554 
                                   2555 ;       DECIMAL ( -- )
                                   2556 ;       Use radix 10 as base
                                   2557 ;       for numeric conversions.
      008BC0 0C 79                 2558         .word      LINK
                           000C8A  2559 LINK = . 
      008BC0 90                    2560         .byte      7
      008BC1 93 90 E6 01 1C 00 02  2561         .ascii     "DECIMAL"
      000C92                       2562 DECIM:
      008BC8 90 93 90         [ 4] 2563         CALL     DOLIT
      008BCB FE 90                 2564         .word      10
      008BCD 89 1C 00         [ 4] 2565         CALL     BASE
      008BD0 02 90 93         [ 2] 2566         JP     STORE
                                   2567 
                                   2568 ;; Numeric input, single precision
                                   2569 
                                   2570 ;       DIGIT?  ( c base -- u t )
                                   2571 ;       Convert a character to its numeric
                                   2572 ;       value. A flag indicates success.
      008BD3 1C 00                 2573         .word      LINK
                           000C9F  2574 LINK = . 
      008BD5 02                    2575         .byte       6
      008BD6 90 FE 90 BF 24 90     2576         .ascii     "DIGIT?"
      000CA6                       2577 DIGTQ:
      008BDC 85 04 3D         [ 4] 2578         CALL     TOR
      008BDD CD 03 45         [ 4] 2579         CALL     DOLIT
      008BDD 92 C7                 2580         .word     48	; "0"
      008BDF 24 3C 25         [ 4] 2581         CALL     SUBB
      008BE2 24 02 3C         [ 4] 2582         CALL     DOLIT
      008BE5 24 09                 2583         .word      9
      008BE6 CD 04 9E         [ 4] 2584         CALL     OVER
      008BE6 90 5A 26         [ 4] 2585         CALL     LESS
      008BE9 F3 81 8B         [ 4] 2586         CALL     QBRAN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      008BEC BB 05                 2587         .word      DGTQ1
      008BEE 45 52 41         [ 4] 2588         CALL     DOLIT
      008BF1 53 45                 2589         .word      7
      008BF3 CD 06 E8         [ 4] 2590         CALL     SUBB
      008BF3 90 5F 1D         [ 4] 2591         CALL     DUPP
      008BF6 00 02 FF         [ 4] 2592         CALL     DOLIT
      008BF9 CC 8B                 2593         .word      10
      008BFB C0 8B ED         [ 4] 2594         CALL     LESS
      008BFE 05 50 41         [ 4] 2595         CALL     ORR
      008C01 43 4B 30         [ 4] 2596 DGTQ1:  CALL     DUPP
      008C04 58 04 1E         [ 4] 2597         CALL     RFROM
      008C05 CC 07 2F         [ 2] 2598         JP     ULESS
                                   2599 
                                   2600 ;       NUMBER? ( a -- n T | a F )
                                   2601 ;       Convert a number string to
                                   2602 ;       integer. Push a flag on tos.
      008C05 CD 84                 2603         .word      LINK
                           000CE2  2604 LINK = . 
      008C07 F4                    2605         .byte      7
      008C08 CD 84 BD CD 86 DA CD  2606         .ascii     "NUMBER?"
      000CEA                       2607 NUMBQ:
      008C0F 84 5A CD         [ 4] 2608         CALL     BASE
      008C12 89 E9 CD         [ 4] 2609         CALL     AT
      008C15 85 04 CD         [ 4] 2610         CALL     TOR
      008C18 8B 91 CD         [ 4] 2611         CALL     ZERO
      008C1B 84 9E 81         [ 4] 2612         CALL     OVER
      008C1E 8B FE 05         [ 4] 2613         CALL     COUNT
      008C21 44 49 47         [ 4] 2614         CALL     OVER
      008C24 49 54 EB         [ 4] 2615         CALL     CAT
      008C26 CD 03 45         [ 4] 2616         CALL     DOLIT
      008C26 CD 83                 2617         .word     36	; "0x"
      008C28 C5 00 09         [ 4] 2618         CALL     EQUAL
      008C2B CD 85 1E         [ 4] 2619         CALL     QBRAN
      008C2E CD 87                 2620         .word      NUMQ1
      008C30 CD CD 83         [ 4] 2621         CALL     HEX
      008C33 C5 00 07         [ 4] 2622         CALL     SWAPP
      008C36 CD 85 40         [ 4] 2623         CALL     ONEP
      008C39 CD 86 EF         [ 4] 2624         CALL     SWAPP
      008C3C CD 83 C5         [ 4] 2625         CALL     ONEM
      008C3F 00 30 CC         [ 4] 2626 NUMQ1:  CALL     OVER
      008C42 86 EF 8C         [ 4] 2627         CALL     CAT
      008C45 20 07 45         [ 4] 2628         CALL     DOLIT
      008C48 58 54                 2629         .word     45	; "-"
      008C4A 52 41 43         [ 4] 2630         CALL     EQUAL
      008C4D 54 04 3D         [ 4] 2631         CALL     TOR
      008C4E CD 04 84         [ 4] 2632         CALL     SWAPP
      008C4E CD 8A 55         [ 4] 2633         CALL     RAT
      008C51 CD 85 04         [ 4] 2634         CALL     SUBB
      008C54 CD 88 45         [ 4] 2635         CALL     SWAPP
      008C57 CD 85 04         [ 4] 2636         CALL     RAT
      008C5A CC 8C 26         [ 4] 2637         CALL     PLUS
      008C5D 8C 46 02         [ 4] 2638         CALL     QDUP
      008C60 3C 23 78         [ 4] 2639         CALL     QBRAN
      008C62 0D A8                 2640         .word      NUMQ6
      008C62 CD 8B 55         [ 4] 2641         CALL     ONEM
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



      008C65 CD 86 21         [ 4] 2642         CALL     TOR
      008C68 CC 84 36         [ 4] 2643 NUMQ2:  CALL     DUPP
      008C6B 8C 5F 04         [ 4] 2644         CALL     TOR
      008C6E 48 4F 4C         [ 4] 2645         CALL     CAT
      008C71 44 05 31         [ 4] 2646         CALL     BASE
      008C72 CD 03 CD         [ 4] 2647         CALL     AT
      008C72 CD 86 21         [ 4] 2648         CALL     DIGTQ
      008C75 CD 84 4D         [ 4] 2649         CALL     QBRAN
      008C78 CD 89                 2650         .word      NUMQ4
      008C7A F6 CD 84         [ 4] 2651         CALL     SWAPP
      008C7D F4 CD 86         [ 4] 2652         CALL     BASE
      008C80 21 CD 84         [ 4] 2653         CALL     AT
      008C83 36 CC 84         [ 4] 2654         CALL     STAR
      008C86 5A 8C 6D         [ 4] 2655         CALL     PLUS
      008C89 01 23 1E         [ 4] 2656         CALL     RFROM
      008C8B CD 09 69         [ 4] 2657         CALL     ONEP
      008C8B CD 85 B1         [ 4] 2658         CALL     DONXT
      008C8E CD 84                 2659         .word      NUMQ2
      008C90 4D CD 8C         [ 4] 2660         CALL     RAT
      008C93 4E CC 8C         [ 4] 2661         CALL     SWAPP
      008C96 72 8C 89         [ 4] 2662         CALL     DROP
      008C99 02 23 53         [ 4] 2663         CALL     QBRAN
      008C9C 0D 91                 2664         .word      NUMQ3
      008C9C CD 8C 8B         [ 4] 2665         CALL     NEGAT
      008C9F CD 84 F4         [ 4] 2666 NUMQ3:  CALL     SWAPP
      008CA2 CD 83            [ 2] 2667         JRA     NUMQ5
      008CA4 F8 8C A9         [ 4] 2668 NUMQ4:  CALL     RFROM
      008CA7 20 F3 81         [ 4] 2669         CALL     RFROM
      008CAA 8C 99 04         [ 4] 2670         CALL     DDROP
      008CAD 53 49 47         [ 4] 2671         CALL     DDROP
      008CB0 4E 09 D5         [ 4] 2672         CALL     ZERO
      008CB1 CD 04 74         [ 4] 2673 NUMQ5:  CALL     DUPP
      008CB1 CD 85 2D         [ 4] 2674 NUMQ6:  CALL     RFROM
      008CB4 CD 83 F8         [ 4] 2675         CALL     DDROP
      008CB7 8C C1 CD         [ 4] 2676         CALL     RFROM
      008CBA 83 C5 00         [ 4] 2677         CALL     BASE
      008CBD 2D CC 8C         [ 2] 2678         JP     STORE
                                   2679 
                                   2680 ;; Basic I/O
                                   2681 
                                   2682 ;       KEY     ( -- c )
                                   2683 ;       Wait for and return an
                                   2684 ;       input character.
      008CC0 72 81                 2685         .word      LINK
                           000DB9  2686 LINK = . 
      008CC2 8C                    2687         .byte      3
      008CC3 AC 02 23              2688         .ascii     "KEY"
      000DBD                       2689 KEY:
                           000001  2690 .if CONVERT_TO_CODE
      008CC6 3E 0B 52 30 FB   [ 2] 2691         btjf UART1_SR,#UART_SR_RXNE,. 
      008CC7 C6 52 31         [ 1] 2692         ld a,UART1_DR 
      008CC7 CD 84 EA         [ 2] 2693         subw x,#CELLL 
      008CCA CD 86            [ 1] 2694         ld (1,x),a 
      008CCC 21               [ 1] 2695         clr (x)
      008CCD CD               [ 4] 2696         ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



                           000000  2697 .else 
                                   2698 KEY1:   CALL     QKEY
                                   2699         CALL     QBRAN
                                   2700         .word      KEY1
                                   2701         RET
                                   2702 .endif 
                                   2703 
                                   2704 ;       NUF?    ( -- t )
                                   2705 ;       Return false if no input,
                                   2706 ;       else pause and if CR return true.
      008CCE 84 4D                 2707         .word      LINK
                           000DCE  2708 LINK = . 
      008CD0 CD                    2709         .byte      4
      008CD1 8B 55 CD 85           2710         .ascii     "NUF?"
      000DD3                       2711 NUFQ:
      008CD5 1E CC 87         [ 4] 2712         CALL     QKEY
      008CD8 68 8C C4         [ 4] 2713         CALL     DUPP
      008CDB 03 53 54         [ 4] 2714         CALL     QBRAN
      008CDE 52 EC                 2715         .word    NUFQ1
      008CDF CD 06 4F         [ 4] 2716         CALL     DDROP
      008CDF CD 84 F4         [ 4] 2717         CALL     KEY
      008CE2 CD 84 BD         [ 4] 2718         CALL     DOLIT
      008CE5 CD 87                 2719         .word      CRR
      008CE7 82 CD 8C         [ 2] 2720         JP     EQUAL
      008CEA 62               [ 4] 2721 NUFQ1:  RET
                                   2722 
                                   2723 ;       SPACE   ( -- )
                                   2724 ;       Send  blank character to
                                   2725 ;       output device.
      008CEB CD 8C                 2726         .word      LINK
                           000DEF  2727 LINK = . 
      008CED 9C                    2728         .byte      5
      008CEE CD 84 9E CD 8C        2729         .ascii     "SPACE"
      000DF5                       2730 SPACE:
      008CF3 B1 CC 8C         [ 4] 2731         CALL     BLANK
      008CF6 C7 8C DB         [ 2] 2732         JP     EMIT
                                   2733 
                                   2734 ;       SPACES  ( +n -- )
                                   2735 ;       Send n spaces to output device.
      008CF9 03 48                 2736         .word      LINK
                           000DFD  2737 LINK = . 
      008CFB 45                    2738         .byte      6
      008CFC 58 50 41 43 45 53     2739         .ascii     "SPACES"
      008CFD                       2740 SPACS:
      008CFD CD 83 C5         [ 4] 2741         CALL     ZERO
      008D00 00 10 CD         [ 4] 2742         CALL     MAX
      008D03 85 B1 CC         [ 4] 2743         CALL     TOR
      008D06 84 36            [ 2] 2744         JRA      CHAR2
      008D08 8C F9 07         [ 4] 2745 CHAR1:  CALL     SPACE
      008D0B 44 45 43         [ 4] 2746 CHAR2:  CALL     DONXT
      008D0E 49 4D                 2747         .word    CHAR1
      008D10 41               [ 4] 2748         RET
                                   2749 
                                   2750 ;       TYPE    ( b u -- )
                                   2751 ;       Output u characters from b.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



      008D11 4C FD                 2752         .word      LINK
                           000E1A  2753 LINK = . 
      008D12 04                    2754         .byte      4
      008D12 CD 83 C5 00           2755         .ascii     "TYPE"
      000E1F                       2756 TYPES:
      008D16 0A CD 85         [ 4] 2757         CALL     TOR
      008D19 B1 CC            [ 2] 2758         JRA     TYPE2
      008D1B 84 36 8D         [ 4] 2759 TYPE1:  CALL     DUPP
      008D1E 0A 06 44         [ 4] 2760         CALL     CAT
      008D21 49 47 49         [ 4] 2761         CALL     EMIT
      008D24 54 3F 69         [ 4] 2762         CALL     ONEP
      008D26 CD 03 59         [ 4] 2763 TYPE2:  CALL     DONXT
      008D26 CD 84                 2764         .word      TYPE1
      008D28 BD CD 83         [ 2] 2765         JP     DROP
                                   2766 
                                   2767 ;       CR      ( -- )
                                   2768 ;       Output a carriage return
                                   2769 ;       and a line feed.
      008D2B C5 00                 2770         .word      LINK
                           000E3A  2771 LINK = . 
      008D2D 30                    2772         .byte      2
      008D2E CD 87                 2773         .ascii     "CR"
      000E3D                       2774 CR:
      008D30 68 CD 83         [ 4] 2775         CALL     DOLIT
      008D33 C5 00                 2776         .word      CRR
      008D35 09 CD 85         [ 4] 2777         CALL     EMIT
      008D38 1E CD 87         [ 4] 2778         CALL     DOLIT
      008D3B CD CD                 2779         .word      LF
      008D3D 83 F8 8D         [ 2] 2780         JP     EMIT
                                   2781 
                                   2782 ;       do$     ( -- a )
                                   2783 ;       Return  address of a compiled
                                   2784 ;       string.
      008D40 57 CD                 2785         .word      LINK
                           000E4F  2786 LINK = . 
      008D42 83                    2787 	.byte      COMPO+3
      008D43 C5 00 07              2788         .ascii     "DO$"
      000E53                       2789 DOSTR:
      008D46 CD 87 68         [ 4] 2790         CALL     RFROM
      008D49 CD 84 F4         [ 4] 2791         CALL     RAT
      008D4C CD 83 C5         [ 4] 2792         CALL     RFROM
      008D4F 00 0A CD         [ 4] 2793         CALL     COUNT
      008D52 87 CD CD         [ 4] 2794         CALL     PLUS
      008D55 85 54 CD         [ 4] 2795         CALL     TOR
      008D58 84 F4 CD         [ 4] 2796         CALL     SWAPP
      008D5B 84 9E CC         [ 4] 2797         CALL     TOR
      008D5E 87               [ 4] 2798         RET
                                   2799 
                                   2800 ;       $"|     ( -- a )
                                   2801 ;       Run time routine compiled by $".
                                   2802 ;       Return address of a compiled string.
      008D5F AF 8D                 2803         .word      LINK
                           000E6E  2804 LINK = . 
      008D61 1F                    2805 	.byte      COMPO+3
      008D62 07 4E 55              2806         .byte     '$','"','|'
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



      000E72                       2807 STRQP:
      008D65 4D 42 45         [ 4] 2808         CALL     DOSTR
      008D68 52               [ 4] 2809         RET
                                   2810 
                                   2811 ;       ."|     ( -- )
                                   2812 ;       Run time routine of ." .
                                   2813 ;       Output a compiled string.
      008D69 3F 6E                 2814         .word      LINK
                           000E78  2815 LINK = . 
      008D6A 43                    2816 	.byte      COMPO+3
      008D6A CD 85 B1              2817         .byte     '.','"','|'
      000E7C                       2818 DOTQP:
      008D6D CD 84 4D         [ 4] 2819         CALL     DOSTR
      008D70 CD 84 BD         [ 4] 2820         CALL     COUNT
      008D73 CD 8A 55         [ 2] 2821         JP     TYPES
                                   2822 
                                   2823 ;       .R      ( n +n -- )
                                   2824 ;       Display an integer in a field
                                   2825 ;       of n columns, right justified.
      008D76 CD 85                 2826         .word      LINK
                           000E87  2827 LINK = . 
      008D78 1E                    2828         .byte      2
      008D79 CD 8B                 2829         .ascii     ".R"
      000E8A                       2830 DOTR:
      008D7B 2D CD 85         [ 4] 2831         CALL     TOR
      008D7E 1E CD 84         [ 4] 2832         CALL     STR
      008D81 6B CD 83         [ 4] 2833         CALL     RFROM
      008D84 C5 00 24         [ 4] 2834         CALL     OVER
      008D87 CD 87 90         [ 4] 2835         CALL     SUBB
      008D8A CD 83 F8         [ 4] 2836         CALL     SPACS
      008D8D 8D 9E CD         [ 2] 2837         JP     TYPES
                                   2838 
                                   2839 ;       U.R     ( u +n -- )
                                   2840 ;       Display an unsigned integer
                                   2841 ;       in n column, right justified.
      008D90 8C FD                 2842         .word      LINK
                           000EA1  2843 LINK = . 
      008D92 CD                    2844         .byte      3
      008D93 85 04 CD              2845         .ascii     "U.R"
      000EA5                       2846 UDOTR:
      008D96 89 E9 CD         [ 4] 2847         CALL     TOR
      008D99 85 04 CD         [ 4] 2848         CALL     BDIGS
      008D9C 89 F6 CD         [ 4] 2849         CALL     DIGS
      008D9F 85 1E CD         [ 4] 2850         CALL     EDIGS
      008DA2 84 6B CD         [ 4] 2851         CALL     RFROM
      008DA5 83 C5 00         [ 4] 2852         CALL     OVER
      008DA8 2D CD 87         [ 4] 2853         CALL     SUBB
      008DAB 90 CD 84         [ 4] 2854         CALL     SPACS
      008DAE BD CD 85         [ 2] 2855         JP     TYPES
                                   2856 
                                   2857 ;       U.      ( u -- )
                                   2858 ;       Display an unsigned integer
                                   2859 ;       in free format.
      008DB1 04 CD                 2860         .word      LINK
                           000EC2  2861 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



      008DB3 84                    2862         .byte      2
      008DB4 B1 CD                 2863         .ascii     "U."
      000EC5                       2864 UDOT:
      008DB6 87 68 CD         [ 4] 2865         CALL     BDIGS
      008DB9 85 04 CD         [ 4] 2866         CALL     DIGS
      008DBC 84 B1 CD         [ 4] 2867         CALL     EDIGS
      008DBF 86 EF CD         [ 4] 2868         CALL     SPACE
      008DC2 86 9E CD         [ 2] 2869         JP     TYPES
                                   2870 
                                   2871 ;       .       ( w -- )
                                   2872 ;       Display an integer in free
                                   2873 ;       format, preceeded by a space.
      008DC5 83 F8                 2874         .word      LINK
                           000ED6  2875 LINK = . 
      008DC7 8E                    2876         .byte      1
      008DC8 28                    2877         .ascii     "."
      000ED8                       2878 DOT:
      008DC9 CD 89 F6         [ 4] 2879         CALL     BASE
      008DCC CD 84 BD         [ 4] 2880         CALL     AT
      008DCF CD 84 F4         [ 4] 2881         CALL     DOLIT
      008DD2 CD 84                 2882         .word      10
      008DD4 BD CD 84         [ 4] 2883         CALL     XORR    ;?decimal
      008DD7 6B CD 85         [ 4] 2884         CALL     QBRAN
      008DDA B1 CD                 2885         .word      DOT1
      008DDC 84 4D CD         [ 2] 2886         JP     UDOT
      008DDF 8D 26 CD         [ 4] 2887 DOT1:   CALL     STR
      008DE2 83 F8 8E         [ 4] 2888         CALL     SPACE
      008DE5 16 CD 85         [ 2] 2889         JP     TYPES
                                   2890 
                                   2891 ;       ?       ( a -- )
                                   2892 ;       Display contents in memory cell.
      008DE8 04 CD                 2893         .word      LINK
                                   2894         
                           000EF9  2895 LINK = . 
      008DEA 85                    2896         .byte      1
      008DEB B1                    2897         .ascii     "?"
      000EFB                       2898 QUEST:
      008DEC CD 84 4D         [ 4] 2899         CALL     AT
      008DEF CD 89 68         [ 2] 2900         JP     DOT
                                   2901 
                                   2902 ;; Parsing
                                   2903 
                                   2904 ;       parse   ( b u c -- b u delta ; <string> )
                                   2905 ;       Scan string delimited by c.
                                   2906 ;       Return found string and its offset.
      008DF2 CD 86                 2907         .word      LINK
                           000F03  2908 LINK = . 
      008DF4 EF                    2909         .byte      5
      008DF5 CD 84 9E CD 89        2910         .ascii     "parse"
      000F09                       2911 PARS:
      008DFA E9 CD 83         [ 4] 2912         CALL     TEMP
      008DFD D9 8D CF         [ 4] 2913         CALL     STORE
      008E00 CD 84 B1         [ 4] 2914         CALL     OVER
      008E03 CD 85 04         [ 4] 2915         CALL     TOR
      008E06 CD 84 EA         [ 4] 2916         CALL     DUPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      008E09 CD 83 F8         [ 4] 2917         CALL     QBRAN
      008E0C 8E 11                 2918         .word    PARS8
      008E0E CD 87 1A         [ 4] 2919         CALL     ONEM
      008E11 CD 85 04         [ 4] 2920         CALL     TEMP
      008E14 20 0F CD         [ 4] 2921         CALL     AT
      008E17 84 9E CD         [ 4] 2922         CALL     BLANK
      008E1A 84 9E CD         [ 4] 2923         CALL     EQUAL
      008E1D 86 CF CD         [ 4] 2924         CALL     QBRAN
      008E20 86 CF                 2925         .word      PARS3
      008E22 CD 8A 55         [ 4] 2926         CALL     TOR
      008E25 CD 84 F4         [ 4] 2927 PARS1:  CALL     BLANK
      008E28 CD 84 9E         [ 4] 2928         CALL     OVER
      008E2B CD 86 CF         [ 4] 2929         CALL     CAT     ;skip leading blanks ONLY
      008E2E CD 84 9E         [ 4] 2930         CALL     SUBB
      008E31 CD 85 B1         [ 4] 2931         CALL     ZLESS
      008E34 CC 84 36         [ 4] 2932         CALL     INVER
      008E37 8D 62 03         [ 4] 2933         CALL     QBRAN
      008E3A 4B 45                 2934         .word      PARS2
      008E3C 59 09 69         [ 4] 2935         CALL     ONEP
      008E3D CD 03 59         [ 4] 2936         CALL     DONXT
      008E3D 72 0B                 2937         .word      PARS1
      008E3F 52 30 FB         [ 4] 2938         CALL     RFROM
      008E42 C6 52 31         [ 4] 2939         CALL     DROP
      008E45 1D 00 02         [ 4] 2940         CALL     ZERO
      008E48 E7 01 7F         [ 2] 2941         JP     DUPP
      008E4B 81 8E 39         [ 4] 2942 PARS2:  CALL     RFROM
      008E4E 04 4E 55         [ 4] 2943 PARS3:  CALL     OVER
      008E51 46 3F 84         [ 4] 2944         CALL     SWAPP
      008E53 CD 04 3D         [ 4] 2945         CALL     TOR
      008E53 CD 83 91         [ 4] 2946 PARS4:  CALL     TEMP
      008E56 CD 84 F4         [ 4] 2947         CALL     AT
      008E59 CD 83 F8         [ 4] 2948         CALL     OVER
      008E5C 8E 6C CD         [ 4] 2949         CALL     CAT
      008E5F 86 CF CD         [ 4] 2950         CALL     SUBB    ;scan for delimiter
      008E62 8E 3D CD         [ 4] 2951         CALL     TEMP
      008E65 83 C5 00         [ 4] 2952         CALL     AT
      008E68 0D CC 87         [ 4] 2953         CALL     BLANK
      008E6B 90 81 8E         [ 4] 2954         CALL     EQUAL
      008E6E 4E 05 53         [ 4] 2955         CALL     QBRAN
      008E71 50 41                 2956         .word      PARS5
      008E73 43 45 AD         [ 4] 2957         CALL     ZLESS
      008E75 CD 03 78         [ 4] 2958 PARS5:  CALL     QBRAN
      008E75 CD 8A                 2959         .word      PARS6
      008E77 48 CC 83         [ 4] 2960         CALL     ONEP
      008E7A AF 8E 6F         [ 4] 2961         CALL     DONXT
      008E7D 06 53                 2962         .word      PARS4
      008E7F 50 41 43         [ 4] 2963         CALL     DUPP
      008E82 45 53 3D         [ 4] 2964         CALL     TOR
      008E84 20 0F            [ 2] 2965         JRA     PARS7
      008E84 CD 8A 55         [ 4] 2966 PARS6:  CALL     RFROM
      008E87 CD 87 ED         [ 4] 2967         CALL     DROP
      008E8A CD 84 BD         [ 4] 2968         CALL     DUPP
      008E8D 20 03 CD         [ 4] 2969         CALL     ONEP
      008E90 8E 75 CD         [ 4] 2970         CALL     TOR
      008E93 83 D9 8E         [ 4] 2971 PARS7:  CALL     OVER
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      008E96 8F 81 8E         [ 4] 2972         CALL     SUBB
      008E99 7D 04 54         [ 4] 2973         CALL     RFROM
      008E9C 59 50 45         [ 4] 2974         CALL     RFROM
      008E9F CC 06 E8         [ 2] 2975         JP     SUBB
      008E9F CD 84 BD         [ 4] 2976 PARS8:  CALL     OVER
      008EA2 20 0C CD         [ 4] 2977         CALL     RFROM
      008EA5 84 F4 CD         [ 2] 2978         JP     SUBB
                                   2979 
                                   2980 ;       PARSE   ( c -- b u ; <string> )
                                   2981 ;       Scan input stream and return
                                   2982 ;       counted string delimited by c.
      008EA8 84 6B                 2983         .word      LINK
                           000FCC  2984 LINK = . 
      008EAA CD                    2985         .byte      5
      008EAB 83 AF CD 89 E9        2986         .ascii     "PARSE"
      000FD2                       2987 PARSE:
      008EB0 CD 83 D9         [ 4] 2988         CALL     TOR
      008EB3 8E A4 CC         [ 4] 2989         CALL     TIB
      008EB6 84 EA 8E         [ 4] 2990         CALL     INN
      008EB9 9A 02 43         [ 4] 2991         CALL     AT
      008EBC 52 06 6F         [ 4] 2992         CALL     PLUS    ;current input buffer pointer
      008EBD CD 05 5F         [ 4] 2993         CALL     NTIB
      008EBD CD 83 C5         [ 4] 2994         CALL     AT
      008EC0 00 0D CD         [ 4] 2995         CALL     INN
      008EC3 83 AF CD         [ 4] 2996         CALL     AT
      008EC6 83 C5 00         [ 4] 2997         CALL     SUBB    ;remaining count
      008EC9 0A CC 83         [ 4] 2998         CALL     RFROM
      008ECC AF 8E BA         [ 4] 2999         CALL     PARS
      008ECF 43 44 4F         [ 4] 3000         CALL     INN
      008ED2 24 0A 46         [ 2] 3001         JP     PSTOR
                                   3002 
                                   3003 ;       .(      ( -- )
                                   3004 ;       Output following string up to next ) .
      008ED3 0F CC                 3005         .word      LINK
                           000FFE  3006 LINK = . 
      008ED3 CD                    3007 	.byte      IMEDD+2
      008ED4 84 9E                 3008         .ascii     ".("
      001001                       3009 DOTPR:
      008ED6 CD 84 B1         [ 4] 3010         CALL     DOLIT
      008ED9 CD 84                 3011         .word     41	; ")"
      008EDB 9E CD 8B         [ 4] 3012         CALL     PARSE
      008EDE 2D CD 86         [ 2] 3013         JP     TYPES
                                   3014 
                                   3015 ;       (       ( -- )
                                   3016 ;       Ignore following string up to next ).
                                   3017 ;       A comment.
      008EE1 EF CD                 3018         .word      LINK
                           00100E  3019 LINK = . 
      008EE3 84                    3020 	.byte      IMEDD+1
      008EE4 BD                    3021         .ascii     "("
      001010                       3022 PAREN:
      008EE5 CD 85 04         [ 4] 3023         CALL     DOLIT
      008EE8 CD 84                 3024         .word     41	; ")"
      008EEA BD 81 8E         [ 4] 3025         CALL     PARSE
      008EED CF 43 24         [ 2] 3026         JP     DDROP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



                                   3027 
                                   3028 ;       \       ( -- )
                                   3029 ;       Ignore following text till
                                   3030 ;       end of line.
      008EF0 22 7C                 3031         .word      LINK
                           00101D  3032 LINK = . 
      008EF2 81                    3033 	.byte      IMEDD+1
      008EF2 CD                    3034         .ascii     "\"
      00101F                       3035 BKSLA:
                           000001  3036 .if CONVERT_TO_CODE
      008EF3 8E D3 81 8E      [ 2] 3037         ldw y,#UCTIB ; #TIB  
      008EF7 EE 43            [ 2] 3038         ldw y,(y)
      008EF9 2E 22            [ 2] 3039         pushw y ; count in TIB 
      008EFB 7C AE 00 0A      [ 2] 3040         ldw y,#UINN ; >IN 
      008EFC 90 BF 24         [ 2] 3041         ldw YTEMP,y
      008EFC CD 8E            [ 2] 3042         popw y 
      008EFE D3 CD 8B         [ 5] 3043         ldw [YTEMP],y
      008F01 2D               [ 4] 3044         ret 
                           000000  3045 .else
                                   3046         CALL     NTIB
                                   3047         CALL     AT
                                   3048         CALL     INN
                                   3049         JP     STORE
                                   3050 .endif 
                                   3051 
                                   3052 ;       WORD    ( c -- a ; <string> )
                                   3053 ;       Parse a word from input stream
                                   3054 ;       and copy it to code dictionary.
      008F02 CC 8E                 3055         .word      LINK
                           001036  3056 LINK = . 
      008F04 9F                    3057         .byte      4
      008F05 8E F8 02 2E           3058         .ascii     "WORD"
      00103B                       3059 WORDD:
      008F09 52 0F D2         [ 4] 3060         CALL     PARSE
      008F0A CD 0A C4         [ 4] 3061         CALL     HERE
      008F0A CD 84 BD         [ 4] 3062         CALL     CELLP
      008F0D CD 8C DF         [ 2] 3063         JP     PACKS
                                   3064 
                                   3065 ;       TOKEN   ( -- a ; <string> )
                                   3066 ;       Parse a word from input stream
                                   3067 ;       and copy it to name dictionary.
      008F10 CD 84                 3068         .word      LINK
                           001049  3069 LINK = . 
      008F12 9E                    3070         .byte      5
      008F13 CD 85 1E CD 87        3071         .ascii     "TOKEN"
      00104F                       3072 TOKEN:
      008F18 68 CD 8E         [ 4] 3073         CALL     BLANK
      008F1B 84 CC 8E         [ 2] 3074         JP     WORDD
                                   3075 
                                   3076 ;; Dictionary search
                                   3077 
                                   3078 ;       NAME>   ( na -- ca )
                                   3079 ;       Return a code address given
                                   3080 ;       a name address.
      008F1E 9F 8F                 3081         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



                           001057  3082 LINK = . 
      008F20 07                    3083         .byte      5
      008F21 03 55 2E 52 3E        3084         .ascii     "NAME>"
      008F25                       3085 NAMET:
      008F25 CD 84 BD         [ 4] 3086         CALL     COUNT
      008F28 CD 8C 62         [ 4] 3087         CALL     DOLIT
      008F2B CD 8C                 3088         .word      31
      008F2D 9C CD 8C         [ 4] 3089         CALL     ANDD
      008F30 C7 CD 84         [ 2] 3090         JP     PLUS
                                   3091 
                                   3092 ;       SAME?   ( a a u -- a a f \ -0+ )
                                   3093 ;       Compare u cells in two
                                   3094 ;       strings. Return 0 if identical.
      008F33 9E CD                 3095         .word      LINK
                           00106D  3096 LINK = . 
      008F35 85                    3097         .byte       5
      008F36 1E CD 87 68 CD        3098         .ascii     "SAME?"
      001073                       3099 SAMEQ:
      008F3B 8E 84 CC         [ 4] 3100         CALL     ONEM
      008F3E 8E 9F 8F         [ 4] 3101         CALL     TOR
      008F41 21 02            [ 2] 3102         JRA     SAME2
      008F43 55 2E 9E         [ 4] 3103 SAME1:  CALL     OVER
      008F45 CD 04 31         [ 4] 3104         CALL     RAT
      008F45 CD 8C 62         [ 4] 3105         CALL     PLUS
      008F48 CD 8C 9C         [ 4] 3106         CALL     CAT
      008F4B CD 8C C7         [ 4] 3107         CALL     OVER
      008F4E CD 8E 75         [ 4] 3108         CALL     RAT
      008F51 CC 8E 9F         [ 4] 3109         CALL     PLUS
      008F54 8F 42 01         [ 4] 3110         CALL     CAT
      008F57 2E 06 E8         [ 4] 3111         CALL     SUBB
      008F58 CD 06 1E         [ 4] 3112         CALL     QDUP
      008F58 CD 85 B1         [ 4] 3113         CALL     QBRAN
      008F5B CD 84                 3114         .word      SAME2
      008F5D 4D CD 83         [ 4] 3115         CALL     RFROM
      008F60 C5 00 0A         [ 2] 3116         JP     DROP
      008F63 CD 85 69         [ 4] 3117 SAME2:  CALL     DONXT
      008F66 CD 83                 3118         .word      SAME1
      008F68 F8 8F 6E         [ 2] 3119         JP     ZERO
                                   3120 
                                   3121 ;       find    ( a va -- ca na | a F )
                                   3122 ;       Search vocabulary for string.
                                   3123 ;       Return ca and na if succeeded.
      008F6B CC 8F                 3124         .word      LINK
                           0010AE  3125 LINK = . 
      008F6D 45                    3126         .byte      4
      008F6E CD 8C DF CD           3127         .ascii     "FIND"
      0010B3                       3128 FIND:
      008F72 8E 75 CC         [ 4] 3129         CALL     SWAPP
      008F75 8E 9F 8F         [ 4] 3130         CALL     DUPP
      008F78 56 01 3F         [ 4] 3131         CALL     CAT
      008F7B CD 05 40         [ 4] 3132         CALL     TEMP
      008F7B CD 84 4D         [ 4] 3133         CALL     STORE
      008F7E CC 8F 58         [ 4] 3134         CALL     DUPP
      008F81 8F 79 05         [ 4] 3135         CALL     AT
      008F84 70 61 72         [ 4] 3136         CALL     TOR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      008F87 73 65 3E         [ 4] 3137         CALL     CELLP
      008F89 CD 04 84         [ 4] 3138         CALL     SWAPP
      008F89 CD 85 C0         [ 4] 3139 FIND1:  CALL     AT
      008F8C CD 84 36         [ 4] 3140         CALL     DUPP
      008F8F CD 85 1E         [ 4] 3141         CALL     QBRAN
      008F92 CD 84                 3142         .word      FIND6
      008F94 BD CD 84         [ 4] 3143         CALL     DUPP
      008F97 F4 CD 83         [ 4] 3144         CALL     AT
      008F9A F8 90 41         [ 4] 3145         CALL     DOLIT
      008F9D CD 89                 3146         .word      MASKK
      008F9F F6 CD 85         [ 4] 3147         CALL     ANDD
      008FA2 C0 CD 84         [ 4] 3148         CALL     RAT
      008FA5 4D CD 8A         [ 4] 3149         CALL     XORR
      008FA8 48 CD 87         [ 4] 3150         CALL     QBRAN
      008FAB 90 CD                 3151         .word      FIND2
      008FAD 83 F8 8F         [ 4] 3152         CALL     CELLP
      008FB0 E2 CD 84         [ 4] 3153         CALL     DOLIT
      008FB3 BD CD                 3154         .word     0xFFFF
      008FB5 8A 48            [ 2] 3155         JRA     FIND3
      008FB7 CD 85 1E         [ 4] 3156 FIND2:  CALL     CELLP
      008FBA CD 84 6B         [ 4] 3157         CALL     TEMP
      008FBD CD 87 68         [ 4] 3158         CALL     AT
      008FC0 CD 85 2D         [ 4] 3159         CALL     SAMEQ
      008FC3 CD 87 09         [ 4] 3160 FIND3:  CALL     BRAN
      008FC6 CD 83                 3161         .word      FIND4
      008FC8 F8 8F DF         [ 4] 3162 FIND6:  CALL     RFROM
      008FCB CD 89 E9         [ 4] 3163         CALL     DROP
      008FCE CD 83 D9         [ 4] 3164         CALL     SWAPP
      008FD1 8F B4 CD         [ 4] 3165         CALL     CELLM
      008FD4 84 9E CD         [ 2] 3166         JP     SWAPP
      008FD7 84 EA CD         [ 4] 3167 FIND4:  CALL     QBRAN
      008FDA 8A 55                 3168         .word      FIND5
      008FDC CC 84 F4         [ 4] 3169         CALL     CELLM
      008FDF CD 84 9E         [ 4] 3170         CALL     CELLM
      008FE2 CD 85            [ 2] 3171         JRA     FIND1
      008FE4 1E CD 85         [ 4] 3172 FIND5:  CALL     RFROM
      008FE7 04 CD 84         [ 4] 3173         CALL     DROP
      008FEA BD CD 85         [ 4] 3174         CALL     SWAPP
      008FED C0 CD 84         [ 4] 3175         CALL     DROP
      008FF0 4D CD 85         [ 4] 3176         CALL     CELLM
      008FF3 1E CD 84         [ 4] 3177         CALL     DUPP
      008FF6 6B CD 87         [ 4] 3178         CALL     NAMET
      008FF9 68 CD 85         [ 2] 3179         JP     SWAPP
                                   3180 
                                   3181 ;       NAME?   ( a -- ca na | a F )
                                   3182 ;       Search vocabularies for a string.
      008FFC C0 CD                 3183         .word      LINK
                           001146  3184 LINK = . 
      008FFE 84                    3185         .byte      5
      008FFF 4D CD 8A 48 CD        3186         .ascii     "NAME?"
      00114C                       3187 NAMEQ:
      009004 87 90 CD         [ 4] 3188         CALL   CNTXT
      009007 83 F8 90         [ 2] 3189         JP     FIND
                                   3190 
                                   3191 ;; Terminal response
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



                                   3192 
                                   3193 ;       ^H      ( bot eot cur -- bot eot cur )
                                   3194 ;       Backup cursor by one character.
      00900A 0E CD                 3195         .word      LINK
                           001154  3196 LINK = . 
      00900C 85                    3197         .byte      2
      00900D 2D CD                 3198         .ascii     "^H"
      001157                       3199 BKSP:
      00900F 83 F8 90         [ 4] 3200         CALL     TOR
      009012 23 CD 89         [ 4] 3201         CALL     OVER
      009015 E9 CD 83         [ 4] 3202         CALL     RFROM
      009018 D9 8F EB         [ 4] 3203         CALL     SWAPP
      00901B CD 84 F4         [ 4] 3204         CALL     OVER
      00901E CD 84 BD         [ 4] 3205         CALL     XORR
      009021 20 0F CD         [ 4] 3206         CALL     QBRAN
      009024 84 9E                 3207         .word      BACK1
      009026 CD 84 EA         [ 4] 3208         CALL     DOLIT
      009029 CD 84                 3209         .word      BKSPP
      00902B F4 CD 89         [ 4] 3210         CALL     EMIT
      00902E E9 CD 84         [ 4] 3211         CALL     ONEM
      009031 BD CD 85         [ 4] 3212         CALL     BLANK
      009034 1E CD 87         [ 4] 3213         CALL     EMIT
      009037 68 CD 84         [ 4] 3214         CALL     DOLIT
      00903A 9E CD                 3215         .word      BKSPP
      00903C 84 9E CC         [ 2] 3216         JP     EMIT
      00903F 87               [ 4] 3217 BACK1:  RET
                                   3218 
                                   3219 ;       TAP    ( bot eot cur c -- bot eot cur )
                                   3220 ;       Accept and echo key stroke
                                   3221 ;       and bump cursor.
      009040 68 CD                 3222         .word      LINK
                           00118A  3223 LINK = . 
      009042 85                    3224         .byte      3
      009043 1E CD 84              3225         .ascii     "TAP"
      00118E                       3226 TAP:
      009046 9E CC 87         [ 4] 3227         CALL     DUPP
      009049 68 8F 83         [ 4] 3228         CALL     EMIT
      00904C 05 50 41         [ 4] 3229         CALL     OVER
      00904F 52 53 45         [ 4] 3230         CALL     CSTOR
      009052 CC 09 69         [ 2] 3231         JP     ONEP
                                   3232 
                                   3233 ;       kTAP    ( bot eot cur c -- bot eot cur )
                                   3234 ;       Process a key stroke,
                                   3235 ;       CR or backspace.
      009052 CD 84                 3236         .word      LINK
                           00119F  3237 LINK = . 
      009054 BD                    3238         .byte      4
      009055 CD 8B 66 CD           3239         .ascii     "KTAP"
      0011A4                       3240 KTAP:
      009059 85 CF CD         [ 4] 3241         CALL     DUPP
      00905C 84 4D CD         [ 4] 3242         CALL     DOLIT
      00905F 86 EF                 3243         .word      CRR
      009061 CD 85 DF         [ 4] 3244         CALL     XORR
      009064 CD 84 4D         [ 4] 3245         CALL     QBRAN
      009067 CD 85                 3246         .word      KTAP2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      009069 CF CD 84         [ 4] 3247         CALL     DOLIT
      00906C 4D CD                 3248         .word      BKSPP
      00906E 87 68 CD         [ 4] 3249         CALL     XORR
      009071 84 9E CD         [ 4] 3250         CALL     QBRAN
      009074 8F 89                 3251         .word      KTAP1
      009076 CD 85 CF         [ 4] 3252         CALL     BLANK
      009079 CC 8A C6         [ 2] 3253         JP     TAP
      00907C 90 4C 82         [ 2] 3254 KTAP1:  JP     BKSP
      00907F 2E 28 6A         [ 4] 3255 KTAP2:  CALL     DROP
      009081 CD 04 84         [ 4] 3256         CALL     SWAPP
      009081 CD 83 C5         [ 4] 3257         CALL     DROP
      009084 00 29 CD         [ 2] 3258         JP     DUPP
                                   3259 
                                   3260 ;       accept  ( b u -- b u )
                                   3261 ;       Accept characters to input
                                   3262 ;       buffer. Return with actual count.
      009087 90 52                 3263         .word      LINK
                           0011D8  3264 LINK = . 
      009089 CC                    3265         .byte      6
      00908A 8E 9F 90 7E 81 28     3266         .ascii     "ACCEPT"
      009090                       3267 ACCEP:
      009090 CD 83 C5         [ 4] 3268         CALL     OVER
      009093 00 29 CD         [ 4] 3269         CALL     PLUS
      009096 90 52 CC         [ 4] 3270         CALL     OVER
      009099 86 CF 90         [ 4] 3271 ACCP1:  CALL     DDUP
      00909C 8E 81 5C         [ 4] 3272         CALL     XORR
      00909F CD 03 78         [ 4] 3273         CALL     QBRAN
      00909F 90 AE                 3274         .word      ACCP4
      0090A1 00 0C 90         [ 4] 3275         CALL     KEY
      0090A4 FE 90 89         [ 4] 3276         CALL     DUPP
      0090A7 90 AE 00         [ 4] 3277         CALL     BLANK
      0090AA 0A 90 BF         [ 4] 3278         CALL     DOLIT
      0090AD 24 90                 3279         .word      127
      0090AF 85 91 CF         [ 4] 3280         CALL     WITHI
      0090B2 24 81 90         [ 4] 3281         CALL     QBRAN
      0090B5 9D 04                 3282         .word      ACCP2
      0090B7 57 4F 52         [ 4] 3283         CALL     TAP
      0090BA 44 03            [ 2] 3284         JRA     ACCP3
      0090BB CD 11 A4         [ 4] 3285 ACCP2:  CALL     KTAP
      0090BB CD 90            [ 2] 3286 ACCP3:  JRA     ACCP1
      0090BD 52 CD 8B         [ 4] 3287 ACCP4:  CALL     DROP
      0090C0 44 CD 89         [ 4] 3288         CALL     OVER
      0090C3 BE CC 8C         [ 2] 3289         JP     SUBB
                                   3290 
                                   3291 ;       QUERY   ( -- )
                                   3292 ;       Accept input stream to
                                   3293 ;       terminal input buffer.
      0090C6 05 90                 3294         .word      LINK
                                   3295         
                           00121E  3296 LINK = . 
      0090C8 B6                    3297         .byte      5
      0090C9 05 54 4F 4B 45        3298         .ascii     "QUERY"
      001224                       3299 QUERY:
      0090CE 4E 0A E6         [ 4] 3300         CALL     TIB
      0090CF CD 03 45         [ 4] 3301         CALL     DOLIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      0090CF CD 8A                 3302         .word      80
      0090D1 48 CC 90         [ 4] 3303         CALL     ACCEP
      0090D4 BB 90 C9         [ 4] 3304         CALL     NTIB
      0090D7 05 4E 41         [ 4] 3305         CALL     STORE
      0090DA 4D 45 3E         [ 4] 3306         CALL     DROP
      0090DD CD 09 D5         [ 4] 3307         CALL     ZERO
      0090DD CD 8B 2D         [ 4] 3308         CALL     INN
      0090E0 CD 83 C5         [ 2] 3309         JP     STORE
                                   3310 
                                   3311 ;       ABORT   ( -- )
                                   3312 ;       Reset data stack and
                                   3313 ;       jump to QUIT.
      0090E3 00 1F                 3314         .word      LINK
                           001243  3315 LINK = . 
      0090E5 CD                    3316         .byte      5
      0090E6 85 40 CC 86 EF        3317         .ascii     "ABORT"
      001249                       3318 ABORT:
      0090EB 90 D7 05         [ 4] 3319         CALL     PRESE
      0090EE 53 41 4D         [ 2] 3320         JP     QUIT
                                   3321 
                                   3322 ;       abort"  ( f -- )
                                   3323 ;       Run time routine of ABORT".
                                   3324 ;       Abort with a message.
      0090F1 45 3F                 3325         .word      LINK
                           001251  3326 LINK = . 
      0090F3 46                    3327 	.byte      COMPO+6
      0090F3 CD 89 F6 CD 84        3328         .ascii     "ABORT"
      0090F8 BD                    3329         .byte      '"'
      001258                       3330 ABORQ:
      0090F9 20 29 CD         [ 4] 3331         CALL     QBRAN
      0090FC 85 1E                 3332         .word      ABOR2   ;text flag
      0090FE CD 84 B1         [ 4] 3333         CALL     DOSTR
      009101 CD 86 EF         [ 4] 3334 ABOR1:  CALL     SPACE
      009104 CD 84 6B         [ 4] 3335         CALL     COUNT
      009107 CD 85 1E         [ 4] 3336         CALL     TYPES
      00910A CD 84 B1         [ 4] 3337         CALL     DOLIT
      00910D CD 86                 3338         .word     63 ; "?"
      00910F EF CD 84         [ 4] 3339         CALL     EMIT
      009112 6B CD 87         [ 4] 3340         CALL     CR
      009115 68 CD 86         [ 2] 3341         JP     ABORT   ;pass error string
      009118 9E CD 83         [ 4] 3342 ABOR2:  CALL     DOSTR
      00911B F8 91 24         [ 2] 3343         JP     DROP
                                   3344 
                                   3345 ;; The text interpreter
                                   3346 
                                   3347 ;       $INTERPRET      ( a -- )
                                   3348 ;       Interpret a word. If failed,
                                   3349 ;       try to convert it to an integer.
      00911E CD 84                 3350         .word      LINK
                           00127F  3351 LINK = . 
      009120 9E                    3352         .byte      10
      009121 CC 84 EA CD 83 D9 90  3353         .ascii     "$INTERPRET"
             FB CC 8A
      00128A                       3354 INTER:
      00912B 55 90 ED         [ 4] 3355         CALL     NAMEQ
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      00912E 04 46 49         [ 4] 3356         CALL     QDUP    ;?defined
      009131 4E 44 78         [ 4] 3357         CALL     QBRAN
      009133 12 B4                 3358         .word      INTE1
      009133 CD 85 04         [ 4] 3359         CALL     AT
      009136 CD 84 F4         [ 4] 3360         CALL     DOLIT
      009139 CD 84                 3361 	.word       0x4000	; COMPO*256
      00913B 6B CD 85         [ 4] 3362         CALL     ANDD    ;?compile only lexicon bits
      00913E C0 CD 84         [ 4] 3363         CALL     ABORQ
      009141 36                    3364         .byte      13
      009142 CD 84 F4 CD 84 4D CD  3365         .ascii     " compile only"
             84 BD CD 89 BE CD
      00914F 85 04 CD         [ 2] 3366         JP     EXECU
      009152 84 4D CD         [ 4] 3367 INTE1:  CALL     NUMBQ   ;convert a number
      009155 84 F4 CD         [ 4] 3368         CALL     QBRAN
      009158 83 F8                 3369         .word    ABOR1
      00915A 91               [ 4] 3370         RET
                                   3371 
                                   3372 ;       [       ( -- )
                                   3373 ;       Start  text interpreter.
      00915B 90 CD                 3374         .word      LINK
                           0012BF  3375 LINK = . 
      00915D 84                    3376 	.byte      IMEDD+1
      00915E F4                    3377         .ascii     "["
      0012C1                       3378 LBRAC:
      00915F CD 84 4D         [ 4] 3379         CALL   DOLIT
      009162 CD 83                 3380         .word  INTER
      009164 C5 1F 7F         [ 4] 3381         CALL   TEVAL
      009167 CD 85 40         [ 2] 3382         JP     STORE
                                   3383 
                                   3384 ;       .OK     ( -- )
                                   3385 ;       Display 'ok' while interpreting.
      00916A CD 84                 3386         .word      LINK
                           0012CE  3387 LINK = . 
      00916C B1                    3388         .byte      3
      00916D CD 85 69              3389         .ascii     ".OK"
      0012D2                       3390 DOTOK:
      009170 CD 83 F8         [ 4] 3391         CALL     DOLIT
      009173 91 7F                 3392         .word      INTER
      009175 CD 89 BE         [ 4] 3393         CALL     TEVAL
      009178 CD 83 C5         [ 4] 3394         CALL     AT
      00917B FF FF 20         [ 4] 3395         CALL     EQUAL
      00917E 0C CD 89         [ 4] 3396         CALL     QBRAN
      009181 BE CD                 3397         .word      DOTO1
      009183 85 C0 CD         [ 4] 3398         CALL     DOTQP
      009186 84                    3399         .byte      3
      009187 4D CD 90              3400         .ascii     " ok"
      00918A F3 CD 84         [ 2] 3401 DOTO1:  JP     CR
                                   3402 
                                   3403 ;       ?STACK  ( -- )
                                   3404 ;       Abort if stack underflows.
      00918D 0F 91                 3405         .word      LINK
                           0012F1  3406 LINK = . 
      00918F 9F                    3407         .byte      6
      009190 CD 84 9E CD 84 EA     3408         .ascii     "?STACK"
      0012F8                       3409 QSTAC: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



      009196 CD 85 04         [ 4] 3410         CALL     DEPTH
      009199 CD 89 CD         [ 4] 3411         CALL     ZLESS   ;check only for underflow
      00919C CC 85 04         [ 4] 3412         CALL     ABORQ
      00919F CD                    3413         .byte      11
      0091A0 83 F8 91 AC CD 89 CD  3414         .ascii     " underflow "
             CD 89 CD 20
      0091AB A5               [ 4] 3415         RET
                                   3416 
                                   3417 ;       EVAL    ( -- )
                                   3418 ;       Interpret  input stream.
      0091AC CD 84                 3419         .word      LINK
                           001310  3420 LINK = . 
      0091AE 9E                    3421         .byte      4
      0091AF CD 84 EA CD           3422         .ascii     "EVAL"
      001315                       3423 EVAL:
      0091B3 85 04 CD         [ 4] 3424 EVAL1:  CALL     TOKEN
      0091B6 84 EA CD         [ 4] 3425         CALL     DUPP
      0091B9 89 CD CD         [ 4] 3426         CALL     CAT     ;?input stream empty
      0091BC 84 F4 CD         [ 4] 3427         CALL     QBRAN
      0091BF 90 DD                 3428         .word    EVAL2
      0091C1 CC 85 04         [ 4] 3429         CALL     TEVAL
      0091C4 91 2E 05         [ 4] 3430         CALL     ATEXE
      0091C7 4E 41 4D         [ 4] 3431         CALL     QSTAC   ;evaluate input, check stack
      0091CA 45 3F 8F         [ 4] 3432         CALL     BRAN
      0091CC 13 15                 3433         .word    EVAL1
      0091CC CD 86 34         [ 4] 3434 EVAL2:  CALL     DROP
      0091CF CC 91 33         [ 2] 3435         JP       DOTOK
                                   3436 
                                   3437 ;       PRESET  ( -- )
                                   3438 ;       Reset data stack pointer and
                                   3439 ;       terminal input buffer.
      0091D2 91 C6                 3440         .word      LINK
                           001339  3441 LINK = . 
      0091D4 02                    3442         .byte      6
      0091D5 5E 48 45 53 45 54     3443         .ascii     "PRESET"
      0091D7                       3444 PRESE:
      0091D7 CD 84 BD         [ 4] 3445         CALL     DOLIT
      0091DA CD 85                 3446         .word      SPP
      0091DC 1E CD 84         [ 4] 3447         CALL     SPSTO
      0091DF 9E CD 85         [ 4] 3448         CALL     DOLIT
      0091E2 04 CD                 3449         .word      TIBB
      0091E4 85 1E CD         [ 4] 3450         CALL     NTIB
      0091E7 85 69 CD         [ 4] 3451         CALL     CELLP
      0091EA 83 F8 92         [ 2] 3452         JP     STORE
                                   3453 
                                   3454 ;       QUIT    ( -- )
                                   3455 ;       Reset return stack pointer
                                   3456 ;       and start text interpreter.
      0091ED 07 CD                 3457         .word      LINK
                           001358  3458 LINK = . 
      0091EF 83                    3459         .byte      4
      0091F0 C5 00 08 CD           3460         .ascii     "QUIT"
      00135D                       3461 QUIT:
      0091F4 83 AF CD         [ 4] 3462         CALL     DOLIT
      0091F7 89 F6                 3463         .word      RPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      0091F9 CD 8A 48         [ 4] 3464         CALL     RPSTO   ;reset return stack pointer
      0091FC CD 83 AF         [ 4] 3465 QUIT1:  CALL     LBRAC   ;start interpretation
      0091FF CD 83 C5         [ 4] 3466 QUIT2:  CALL     QUERY   ;get input
      009202 00 08 CC         [ 4] 3467         CALL     EVAL
      009205 83 AF            [ 2] 3468         JRA     QUIT2   ;continue till error
                                   3469 
                                   3470 ;; The compiler
                                   3471 
                                   3472 ;       '       ( -- ca )
                                   3473 ;       Search vocabularies for
                                   3474 ;       next word in input stream.
      009207 81 91                 3475         .word      LINK
                           001372  3476 LINK = . 
      009209 D4                    3477         .byte      1
      00920A 03                    3478         .ascii     "'"
      001374                       3479 TICK:
      00920B 54 41 50         [ 4] 3480         CALL     TOKEN
      00920E CD 11 4C         [ 4] 3481         CALL     NAMEQ   ;?defined
      00920E CD 84 F4         [ 4] 3482         CALL     QBRAN
      009211 CD 83                 3483         .word      ABOR1
      009213 AF               [ 4] 3484         RET     ;yes, push code address
                                   3485 
                                   3486 ;       ALLOT   ( n -- )
                           000001  3487 .if PICATOUT_MOD
                                   3488 ;       Allocate n bytes to RAM 
                           000000  3489 .else 
                                   3490 ;       Allocate n bytes to  code dictionary.
                                   3491 .endif 
      009214 CD 85                 3492         .word      LINK
                           001382  3493 LINK = . 
      009216 1E                    3494         .byte      5
      009217 CD 84 5A CC 89        3495         .ascii     "ALLOT"
      001388                       3496 ALLOT:
      00921C E9 92 0A         [ 4] 3497         CALL     VPP
                           000001  3498 .if PICATOUT_MOD
                                   3499 ; must update APP_VP each time VP is modidied
      00921F 04 4B 54         [ 4] 3500         call PSTOR 
      009222 41 50 1B         [ 2] 3501         jp UPDATVP 
                           000000  3502 .else
                                   3503         JP     PSTOR
                                   3504 .endif ;PICATOUT_MOD
                                   3505 
                                   3506 ;       ,       ( w -- )
                                   3507 ;         Compile an integer into
                                   3508 ;         variable space.
      009224 13 82                 3509         .word      LINK
                           001393  3510 LINK = . 
      009224 CD                    3511         .byte      1
      009225 84                    3512         .ascii     ","
      001395                       3513 COMMA:
      009226 F4 CD 83         [ 4] 3514         CALL     HERE
      009229 C5 00 0D         [ 4] 3515         CALL     DUPP
      00922C CD 85 69         [ 4] 3516         CALL     CELLP   ;cell boundary
      00922F CD 83 F8         [ 4] 3517         CALL     VPP
      009232 92 4A CD         [ 4] 3518         CALL     STORE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      009235 83 C5 00         [ 2] 3519         JP     STORE
                                   3520 
                                   3521 ;       C,      ( c -- )
                                   3522 ;       Compile a byte into
                                   3523 ;       variables space.
      009238 08 CD                 3524        .word      LINK
                           0013A9  3525 LINK = . 
      00923A 85                    3526         .byte      2
      00923B 69 CD                 3527         .ascii     "C,"
      0013AC                       3528 CCOMMA:
      00923D 83 F8 92         [ 4] 3529         CALL     HERE
      009240 47 CD 8A         [ 4] 3530         CALL     DUPP
      009243 48 CC 92         [ 4] 3531         CALL     ONEP
      009246 0E CC 91         [ 4] 3532         CALL     VPP
      009249 D7 CD 84         [ 4] 3533         CALL     STORE
      00924C EA CD 85         [ 2] 3534         JP     CSTOR
                                   3535 
                                   3536 ;       [COMPILE]       ( -- ; <string> )
                                   3537 ;       Compile next immediate
                                   3538 ;       word into code dictionary.
      00924F 04 CD                 3539         .word      LINK
                           0013C0  3540 LINK = . 
      009251 84                    3541 	.byte      IMEDD+9
      009252 EA CC 84 F4 92 1F 06  3542         .ascii     "[COMPILE]"
             41 43
      0013CA                       3543 BCOMP:
      00925B 43 45 50         [ 4] 3544         CALL     TICK
      00925E 54 16 8D         [ 2] 3545         JP     JSRC
                                   3546 
                                   3547 ;       COMPILE ( -- )
                                   3548 ;       Compile next jsr in
                                   3549 ;       colon list to code dictionary.
      00925F 13 C0                 3550         .word      LINK
                           0013D2  3551 LINK = . 
      00925F CD                    3552 	.byte      COMPO+7
      009260 85 1E CD 86 EF CD 85  3553         .ascii     "COMPILE"
      0013DA                       3554 COMPI:
      009267 1E CD 86         [ 4] 3555         CALL     RFROM
                           000001  3556 .if PICATOUT_MOD
                                   3557 ; no need to increment
                           000000  3558 .else
                                   3559         CALL     ONEP
                                   3560 .endif 
      00926A DA CD 85         [ 4] 3561         CALL     DUPP
      00926D 69 CD 83         [ 4] 3562         CALL     AT
      009270 F8 92 93         [ 4] 3563         CALL     JSRC    ;compile subroutine
      009273 CD 8E 3D         [ 4] 3564         CALL     CELLP
                           000001  3565 .if PICATOUT_MOD
      009276 CD 84            [ 1] 3566         ldw y,x 
      009278 F4 CD            [ 2] 3567         ldw y,(y)
      00927A 8A 48 CD         [ 2] 3568         addw x,#CELLL 
      00927D 83 C5            [ 2] 3569         jp (y)
                           000000  3570 .else 
                                   3571         JP     TOR
                                   3572 .endif 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



                                   3573 
                                   3574 ;       LITERAL ( w -- )
                                   3575 ;       Compile tos to dictionary
                                   3576 ;       as an integer literal.
      00927F 00 7F                 3577         .word      LINK
                           0013F4  3578 LINK = . 
      009281 CD                    3579 	.byte      IMEDD+7
      009282 88 2A CD 83 F8 92 8E  3580         .ascii     "LITERAL"
      0013FC                       3581 LITER:
      009289 CD 92 0E         [ 4] 3582         CALL     COMPI
                           000001  3583 .if PICATOUT_MOD
      00928C 20 03                 3584         .word DOLIT 
                           000000  3585 .else         
                                   3586         CALL     DOLIT
                                   3587 .endif 
      00928E CD 92 24         [ 2] 3588         JP     COMMA
                                   3589 
                                   3590 ;       $,"     ( -- )
                                   3591 ;       Compile a literal string
                                   3592 ;       up to next " .
      009291 20 D5                 3593         .word      LINK
                           001406  3594 LINK = . 
      009293 CD                    3595         .byte      3
      009294 84 EA CD              3596         .byte     '$',',','"'
      00140A                       3597 STRCQ:
      009297 85 1E CC         [ 4] 3598         CALL     DOLIT
      00929A 87 68                 3599         .word     34	; "
      00929C 92 58 05         [ 4] 3600         CALL     PARSE
      00929F 51 55 45         [ 4] 3601         CALL     HERE
      0092A2 52 59 85         [ 4] 3602         CALL     PACKS   ;string to code dictionary
      0092A4 CD 0A AD         [ 4] 3603         CALL     COUNT
      0092A4 CD 8B 66         [ 4] 3604         CALL     PLUS    ;calculate aligned end of string
      0092A7 CD 83 C5         [ 4] 3605         CALL     VPP
      0092AA 00 50 CD         [ 2] 3606         JP     STORE
                                   3607 
                                   3608 ;; Structures
                                   3609 
                                   3610 ;       FOR     ( -- a )
                                   3611 ;       Start a FOR-NEXT loop
                                   3612 ;       structure in a colon definition.
      0092AD 92 5F                 3613         .word      LINK
                           001426  3614 LINK = . 
      0092AF CD                    3615 	.byte      IMEDD+3
      0092B0 85 DF CD              3616         .ascii     "FOR"
      00142A                       3617 FOR:
      0092B3 84 36 CD         [ 4] 3618         CALL     COMPI
                           000001  3619 .if PICATOUT_MOD
      0092B6 84 EA                 3620         .word TOR 
                           000000  3621 .else
                                   3622         CALL     TOR
                                   3623 .endif
      0092B8 CD 8A 55         [ 2] 3624         JP     HERE
                                   3625 
                                   3626 ;       NEXT    ( a -- )
                                   3627 ;       Terminate a FOR-NEXT loop.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



      0092BB CD 85                 3628         .word      LINK
                           001434  3629 LINK = . 
      0092BD CF                    3630 	.byte      IMEDD+4
      0092BE CC 84 36 92           3631         .ascii     "NEXT"
      001439                       3632 NEXT:
      0092C2 9E 05 41         [ 4] 3633         CALL     COMPI
                           000001  3634 .if PICATOUT_MOD
      0092C5 42 4F                 3635         .word DONXT 
                           000000  3636 .else 
                                   3637         CALL     DONXT
                                   3638 .endif         
                           000001  3639 .if PICATOUT_MOD
      0092C7 52 54 0E         [ 4] 3640         call ADRADJ
                                   3641 .endif ; PICATOUT_MOD
      0092C9 CC 13 95         [ 2] 3642         JP     COMMA
                                   3643 
                                   3644 ;       I ( -- n )
                                   3645 ;       stack FOR-NEXT COUNTER 
      0092C9 CD 93                 3646         .word LINK 
                           001446  3647         LINK=.
      0092CB C0                    3648         .byte 1 
      0092CC CC                    3649         .ascii "I"
      001448                       3650 IFETCH: 
      0092CD 93 DD 92         [ 2] 3651         subw x,#CELLL 
      0092D0 C3 46            [ 2] 3652         ldw y,(3,sp)
      0092D2 41               [ 2] 3653         ldw (x),y 
      0092D3 42               [ 4] 3654         ret 
                                   3655 
                                   3656 ;       BEGIN   ( -- a )
                                   3657 ;       Start an infinite or
                                   3658 ;       indefinite loop structure.
      0092D4 4F 52                 3659         .word      LINK
                           001451  3660 LINK = . 
      0092D6 54                    3661 	.byte      IMEDD+5
      0092D7 22 45 47 49 4E        3662         .ascii     "BEGIN"
      0092D8                       3663 BEGIN:
      0092D8 CD 83 F8         [ 2] 3664         JP     HERE
                                   3665 
                                   3666 ;       UNTIL   ( a -- )
                                   3667 ;       Terminate a BEGIN-UNTIL
                                   3668 ;       indefinite loop structure.
      0092DB 92 F7                 3669         .word      LINK
                           00145C  3670 LINK = . 
      0092DD CD                    3671 	.byte      IMEDD+5
      0092DE 8E D3 CD 8E 75        3672         .ascii     "UNTIL"
      001462                       3673 UNTIL:
      0092E3 CD 8B 2D         [ 4] 3674         CALL     COMPI
                           000001  3675 .if PICATOUT_MOD
      0092E6 CD 8E                 3676         .word    QBRAN 
                           000000  3677 .else 
                                   3678         CALL     QBRAN
                                   3679 .endif 
                           000001  3680 .if PICATOUT_MOD 
      0092E8 9F CD 83         [ 4] 3681         call ADRADJ
                                   3682 .endif ; PICATOUT_MOD
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      0092EB C5 00 3F         [ 2] 3683         JP     COMMA
                                   3684 
                                   3685 ;       AGAIN   ( a -- )
                                   3686 ;       Terminate a BEGIN-AGAIN
                                   3687 ;       infinite loop structure.
      0092EE CD 83                 3688         .word      LINK
                           00146F  3689 LINK = . 
      0092F0 AF                    3690 	.byte      IMEDD+5
      0092F1 CD 8E BD CC 92        3691         .ascii     "AGAIN"
      001475                       3692 AGAIN:
      0092F6 C9 CD 8E         [ 4] 3693         CALL     COMPI
                           000001  3694 .if PICATOUT_MOD
      0092F9 D3 CC                 3695         .word BRAN
                           000000  3696 .else
                                   3697         CALL     BRAN
                                   3698 .endif 
                           000001  3699 .if PICATOUT_MOD 
      0092FB 84 EA 92         [ 4] 3700         call ADRADJ 
                                   3701 .endif ; PICATOUT_MOD
      0092FE D1 0A 24         [ 2] 3702         JP     COMMA
                                   3703 
                                   3704 ;       IF      ( -- A )
                                   3705 ;       Begin a conditional branch.
      009301 49 4E                 3706         .word      LINK
                           001482  3707 LINK = . 
      009303 54                    3708 	.byte      IMEDD+2
      009304 45 52                 3709         .ascii     "IF"
      001485                       3710 IFF:
      009306 50 52 45         [ 4] 3711         CALL     COMPI
                           000001  3712 .if PICATOUT_MOD
      009309 54 78                 3713         .word QBRAN
                           000000  3714 .else
                                   3715         CALL     QBRAN
                                   3716 .endif 
      00930A CD 0A C4         [ 4] 3717         CALL     HERE
      00930A CD 91 CC         [ 4] 3718         CALL     ZERO
      00930D CD 86 9E         [ 2] 3719         JP     COMMA
                                   3720 
                                   3721 ;       THEN        ( A -- )
                                   3722 ;       Terminate a conditional branch structure.
      009310 CD 83                 3723         .word      LINK
                           001495  3724 LINK = . 
      009312 F8                    3725 	.byte      IMEDD+4
      009313 93 34 CD 84           3726         .ascii     "THEN"
      00149A                       3727 THENN:
      009317 4D CD 83         [ 4] 3728         CALL     HERE
                           000001  3729 .if PICATOUT_MOD 
      00931A C5 40 00         [ 4] 3730         call ADRADJ 
                                   3731 .endif ; PICATOUT_MOD
      00931D CD 85 40         [ 4] 3732         CALL     SWAPP
      009320 CD 92 D8         [ 2] 3733         JP     STORE
                                   3734 
                                   3735 ;       ELSE        ( A -- A )
                                   3736 ;       Start the false clause in an IF-ELSE-THEN structure.
      009323 0D 20                 3737         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



                           0014A8  3738 LINK = . 
      009325 63                    3739 	.byte      IMEDD+4
      009326 6F 6D 70 69           3740         .ascii     "ELSE"
      0014AD                       3741 ELSEE:
      00932A 6C 65 20         [ 4] 3742         CALL     COMPI
                           000001  3743 .if PICATOUT_MOD
      00932D 6F 6E                 3744         .word BRAN
                           000000  3745 .else
                                   3746         CALL     BRAN
                                   3747 .endif 
      00932F 6C 79 CC         [ 4] 3748         CALL     HERE
      009332 84 1F CD         [ 4] 3749         CALL     ZERO
      009335 8D 6A CD         [ 4] 3750         CALL     COMMA
      009338 83 F8 92         [ 4] 3751         CALL     SWAPP
      00933B E0 81 92         [ 4] 3752         CALL     HERE
                           000001  3753 .if PICATOUT_MOD 
      00933E FF 81 5B         [ 4] 3754         call ADRADJ 
                                   3755 .endif ; PICATOUT_MOD
      009341 CD 04 84         [ 4] 3756         CALL     SWAPP
      009341 CD 83 C5         [ 2] 3757         JP     STORE
                                   3758 
                                   3759 ;       AHEAD       ( -- A )
                                   3760 ;       Compile a forward branch instruction.
      009344 93 0A                 3761         .word      LINK
                           0014CC  3762 LINK = . 
      009346 CD                    3763 	.byte      IMEDD+5
      009347 86 12 CC 84 36        3764         .ascii     "AHEAD"
      0014D2                       3765 AHEAD:
      00934C 93 3F 03         [ 4] 3766         CALL     COMPI
                           000001  3767 .if PICATOUT_MOD
      00934F 2E 4F                 3768         .word BRAN
                           000000  3769 .else
                                   3770         CALL     BRAN
                                   3771 .endif 
      009351 4B 0A C4         [ 4] 3772         CALL     HERE
      009352 CD 09 D5         [ 4] 3773         CALL     ZERO
      009352 CD 83 C5         [ 2] 3774         JP     COMMA
                                   3775 
                                   3776 ;       WHILE       ( a -- A a )
                                   3777 ;       Conditional branch out of a BEGIN-WHILE-REPEAT loop.
      009355 93 0A                 3778         .word      LINK
                           0014E2  3779 LINK = . 
      009357 CD                    3780 	.byte      IMEDD+5
      009358 86 12 CD 84 4D        3781         .ascii     "WHILE"
      0014E8                       3782 WHILE:
      00935D CD 87 90         [ 4] 3783         CALL     COMPI
                           000001  3784 .if PICATOUT_MOD
      009360 CD 83                 3785         .word QBRAN
                           000000  3786 .else
                                   3787         CALL     QBRAN
                                   3788 .endif 
      009362 F8 93 6C         [ 4] 3789         CALL     HERE
      009365 CD 8E FC         [ 4] 3790         CALL     ZERO
      009368 03 20 6F         [ 4] 3791         CALL     COMMA
      00936B 6B CC 8E         [ 2] 3792         JP     SWAPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



                                   3793 
                                   3794 ;       REPEAT      ( A a -- )
                                   3795 ;       Terminate a BEGIN-WHILE-REPEAT indefinite loop.
      00936E BD 93                 3796         .word      LINK
                           0014FB  3797 LINK = . 
      009370 4E                    3798         .byte      IMEDD+6
      009371 06 3F 53 54 41 43     3799         .ascii     "REPEAT"
      001502                       3800 REPEA:
      009377 4B 13 DA         [ 4] 3801         CALL     COMPI
                           000001  3802 .if PICATOUT_MOD
      009378 03 8F                 3803         .word BRAN
                           000000  3804 .else
                                   3805         CALL     BRAN
                                   3806 .endif 
                           000001  3807 .if PICATOUT_MOD 
      009378 CD 8A 98         [ 4] 3808         call ADRADJ 
                                   3809 .endif ; PICATOUT_MOD
      00937B CD 85 2D         [ 4] 3810         CALL     COMMA
      00937E CD 92 D8         [ 4] 3811         CALL     HERE
                           000001  3812 .if PICATOUT_MOD 
      009381 0B 20 75         [ 4] 3813         call ADRADJ 
                                   3814 .endif ; PICATOUT_MOD
      009384 6E 64 65         [ 4] 3815         CALL     SWAPP
      009387 72 66 6C         [ 2] 3816         JP     STORE
                                   3817 
                                   3818 ;       AFT         ( a -- a A )
                                   3819 ;       Jump to THEN in a FOR-AFT-THEN-NEXT loop the first time through.
      00938A 6F 77                 3820         .word      LINK
                           00151B  3821 LINK = . 
      00938C 20                    3822 	.byte      IMEDD+3
      00938D 81 93 71              3823         .ascii     "AFT"
      00151F                       3824 AFT:
      009390 04 45 56         [ 4] 3825         CALL     DROP
      009393 41 4C D2         [ 4] 3826         CALL     AHEAD
      009395 CD 0A C4         [ 4] 3827         CALL     HERE
      009395 CD 90 CF         [ 2] 3828         JP     SWAPP
                                   3829 
                                   3830 ;       ABORT"      ( -- ; <string> )
                                   3831 ;       Conditional abort with an error message.
      009398 CD 84                 3832         .word      LINK
                           00152D  3833 LINK = . 
      00939A F4                    3834 	.byte      IMEDD+6
      00939B CD 84 6B CD 83        3835         .ascii     "ABORT"
      0093A0 F8                    3836         .byte      '"'
      001534                       3837 ABRTQ:
      0093A1 93 B1 CD         [ 4] 3838         CALL     COMPI
                           000001  3839 .if PICATOUT_MOD
      0093A4 86 12                 3840         .word ABORQ
                           000000  3841 .else
                                   3842         CALL     ABORQ
                                   3843 .endif
      0093A6 CD 8B 7A         [ 2] 3844         JP     STRCQ
                                   3845 
                                   3846 ;       $"     ( -- ; <string> )
                                   3847 ;       Compile an inline string literal.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



      0093A9 CD 93                 3848         .word      LINK
                           00153E  3849 LINK = . 
      0093AB 78                    3850 	.byte      IMEDD+2
      0093AC CD 84                 3851         .byte     '$','"'
      001541                       3852 STRQ:
      0093AE 0F 93 95         [ 4] 3853         CALL     COMPI
                           000001  3854 .if PICATOUT_MOD
      0093B1 CD 84                 3855         .word STRQP 
                           000000  3856 .else
                                   3857         CALL     STRQP
                                   3858 .endif
      0093B3 EA CC 93         [ 2] 3859         JP     STRCQ
                                   3860 
                                   3861 ;       ."          ( -- ; <string> )
                                   3862 ;       Compile an inline string literal to be typed out at run time.
      0093B6 52 93                 3863         .word      LINK
                           00154B  3864 LINK = . 
      0093B8 90                    3865 	.byte      IMEDD+2
      0093B9 06 50                 3866         .byte     '.','"'
      00154E                       3867 DOTQ:
      0093BB 52 45 53         [ 4] 3868         CALL     COMPI
                           000001  3869 .if PICATOUT_MOD
      0093BE 45 54                 3870         .word DOTQP 
                           000000  3871 .else
                                   3872         CALL     DOTQP
                                   3873 .endif 
      0093C0 CC 14 0A         [ 2] 3874         JP     STRCQ
                                   3875 
                                   3876 ;; Name compiler
                                   3877 
                                   3878 ;       ?UNIQUE ( a -- a )
                                   3879 ;       Display a warning message
                                   3880 ;       if word already exists.
      0093C0 CD 83                 3881         .word      LINK
                           001558  3882 LINK = . 
      0093C2 C5                    3883         .byte      7
      0093C3 16 80 CD 84 E1 CD 83  3884         .ascii     "?UNIQUE"
      001560                       3885 UNIQU:
      0093CA C5 17 00         [ 4] 3886         CALL     DUPP
      0093CD CD 85 DF         [ 4] 3887         CALL     NAMEQ   ;?name exists
      0093D0 CD 89 BE         [ 4] 3888         CALL     QBRAN
      0093D3 CC 84                 3889         .word      UNIQ1
      0093D5 36 93 B9         [ 4] 3890         CALL     DOTQP   ;redef are OK
      0093D8 04                    3891         .byte       7
      0093D9 51 55 49 54 65 66 20  3892         .ascii     " reDef "       
      0093DD CD 04 9E         [ 4] 3893         CALL     OVER
      0093DD CD 83 C5         [ 4] 3894         CALL     COUNT
      0093E0 17 FF CD         [ 4] 3895         CALL     TYPES   ;just in case
      0093E3 84 88 CD         [ 2] 3896 UNIQ1:  JP     DROP
                                   3897 
                                   3898 ;       $,n     ( na -- )
                                   3899 ;       Build a new dictionary name
                                   3900 ;       using string at na.
                           000001  3901 .if PICATOUT_MOD
                                   3902 ; compile dans l'espace des variables 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



                                   3903 .endif 
      0093E6 93 41                 3904         .word      LINK
                           001584  3905 LINK = . 
      0093E8 CD                    3906         .byte      3
      0093E9 92 A4 CD              3907         .ascii     "$,n"
      001588                       3908 SNAME:
      0093EC 93 95 20         [ 4] 3909         CALL     DUPP
      0093EF F8 93 D8         [ 4] 3910         CALL     CAT     ;?null input
      0093F2 01 27 78         [ 4] 3911         CALL     QBRAN
      0093F4 15 BE                 3912         .word      PNAM1
      0093F4 CD 90 CF         [ 4] 3913         CALL     UNIQU   ;?redefinition
      0093F7 CD 91 CC         [ 4] 3914         CALL     DUPP
      0093FA CD 83 F8         [ 4] 3915         CALL     COUNT
      0093FD 92 E0 81         [ 4] 3916         CALL     PLUS
      009400 93 F2 05         [ 4] 3917         CALL     VPP
      009403 41 4C 4C         [ 4] 3918         CALL     STORE
      009406 4F 54 74         [ 4] 3919         CALL     DUPP
      009408 CD 05 E0         [ 4] 3920         CALL     LAST
      009408 CD 86 42         [ 4] 3921         CALL     STORE   ;save na for vocabulary link
      00940B CD 8A C6         [ 4] 3922         CALL     CELLM   ;link address
      00940E CC 9B 9B         [ 4] 3923         CALL     CNTXT
      009411 94 02 01         [ 4] 3924         CALL     AT
      009414 2C 04 84         [ 4] 3925         CALL     SWAPP
      009415 CD 03 B6         [ 4] 3926         CALL     STORE
      009415 CD               [ 4] 3927         RET     ;save code pointer
      009416 8B 44 CD         [ 4] 3928 PNAM1:  CALL     STRQP
      009419 84                    3929         .byte      5
      00941A F4 CD 89 BE CD        3930         .ascii     " name" ;null input
      00941F 86 42 CD         [ 2] 3931         JP     ABOR1
                                   3932 
                                   3933 ;; FORTH compiler
                                   3934 
                                   3935 ;       $COMPILE        ( a -- )
                                   3936 ;       Compile next word to
                                   3937 ;       dictionary as a token or literal.
      009422 84 36                 3938         .word      LINK
                           0015CC  3939 LINK = . 
      009424 CC                    3940         .byte      8
      009425 84 36 94 13 02 43 2C  3941         .ascii     "$COMPILE"
             45
      00942C                       3942 SCOMP:
      00942C CD 8B 44         [ 4] 3943         CALL     NAMEQ
      00942F CD 84 F4         [ 4] 3944         CALL     QDUP    ;?defined
      009432 CD 89 E9         [ 4] 3945         CALL     QBRAN
      009435 CD 86                 3946         .word      SCOM2
      009437 42 CD 84         [ 4] 3947         CALL     AT
      00943A 36 CC 84         [ 4] 3948         CALL     DOLIT
      00943D 5A 94                 3949         .word     0x8000	;  IMEDD*256
      00943F 29 89 5B         [ 4] 3950         CALL     ANDD    ;?immediate
      009442 43 4F 4D         [ 4] 3951         CALL     QBRAN
      009445 50 49                 3952         .word      SCOM1
      009447 4C 45 5D         [ 2] 3953         JP     EXECU
      00944A CC 16 8D         [ 2] 3954 SCOM1:  JP     JSRC
      00944A CD 93 F4         [ 4] 3955 SCOM2:  CALL     NUMBQ   ;try to convert to number
      00944D CC 97 0D         [ 4] 3956         CALL     QBRAN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      009450 94 40                 3957         .word      ABOR1
      009452 47 43 4F         [ 2] 3958         JP     LITER
                                   3959 
                                   3960 ;       OVERT   ( -- )
                                   3961 ;       Link a new word into vocabulary.
      009455 4D 50                 3962         .word      LINK
                           001603  3963 LINK = . 
      009457 49                    3964         .byte      5
      009458 4C 45 45 52 54        3965         .ascii     "OVERT"
      00945A                       3966 OVERT:
      00945A CD 84 9E         [ 4] 3967         CALL     LAST
      00945D CD 84 F4         [ 4] 3968         CALL     AT
      009460 CD 84 4D         [ 4] 3969         CALL     CNTXT
      009463 CD 97 0D         [ 2] 3970         JP     STORE
                                   3971 
                                   3972 ;       ;       ( -- )
                                   3973 ;       Terminate a colon definition.
      009466 CD 89                 3974         .word      LINK
                           001617  3975 LINK = . 
      009468 BE                    3976 	.byte      IMEDD+COMPO+1
      009469 90                    3977         .ascii     ";"
      001619                       3978 SEMIS:
      00946A 93 90 FE         [ 4] 3979         CALL     COMPI
                           000001  3980 .if PICATOUT_MOD
      00946D 1C 00                 3981         .word EXIT 
                           000000  3982 .else
                                   3983         CALL     EXIT
                                   3984 .endif 
      00946F 02 90 FC         [ 4] 3985         CALL     LBRAC
                           000001  3986 .if PICATOUT_MOD
      009472 94 52 87         [ 4] 3987         call OVERT 
      009475 4C 49 54         [ 4] 3988         CALL FMOVE
      009478 45 52 41         [ 4] 3989         call QDUP 
      00947B 4C 03 78         [ 4] 3990         call QBRAN 
      00947C 17 5D                 3991         .word SET_RAMLAST 
      00947C CD 94 5A         [ 4] 3992         CALL UPDATPTR
      00947F 83               [ 4] 3993         RET 
                           000000  3994 .else 
                                   3995         JP     OVERT
                                   3996 .endif 
                                   3997 
                                   3998 
                           000001  3999 .if PICATOUT_MOD
                                   4000 ;       Terminate an ISR definition 
                                   4001 ;       retourn ca of ISR as double
                                   4002 ;       I; ( -- ud )
      009480 C5 CC                 4003         .word LINK 
                           001635  4004         LINK=.
      009482 94                    4005         .byte 2+IMEDD+COMPO 
      009483 15 94                 4006         .ascii "I;" 
      001638                       4007 ISEMI:
      009485 74 03 24         [ 2] 4008         subw x,#CELLL  
      009488 2C 22 00 80      [ 2] 4009         ldw y,#IRET_CODE 
      00948A FF               [ 2] 4010         ldw (x),y 
      00948A CD 83 C5         [ 4] 4011         call CCOMMA
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      00948D 00 22 CD         [ 4] 4012         call LBRAC 
      009490 90 52 CD         [ 4] 4013         call IFMOVE
      009493 8B 44 CD         [ 4] 4014         call QDUP 
      009496 8C 05 CD         [ 4] 4015         CALL QBRAN 
      009499 8B 2D                 4016         .word SET_RAMLAST
      00949B CD 86 EF         [ 4] 4017         CALL CPP
      00949E CD 86 42         [ 4] 4018         call AT 
      0094A1 CC 84 36         [ 4] 4019         call SWAPP 
      0094A4 94 86 83         [ 4] 4020         CALL CPP 
      0094A7 46 4F 52         [ 4] 4021         call STORE 
      0094AA CD 1B 04         [ 4] 4022         call UPDATCP 
      0094AA CD 94 5A         [ 4] 4023         call EEPVP 
      0094AD 84 BD CC         [ 4] 4024         call DROP 
      0094B0 8B 44 94         [ 4] 4025         call AT 
      0094B3 A6 84 4E         [ 4] 4026         call VPP 
      0094B6 45 58 54         [ 4] 4027         call STORE 
      0094B9 CC 09 D5         [ 2] 4028         jp ZERO
      0094B9 CD               [ 4] 4029         ret           
                                   4030         
                                   4031 .endif ;PICATOUT_MOD
                                   4032 
                                   4033 ;       ]       ( -- )
                                   4034 ;       Start compiling words in
                                   4035 ;       input stream.
      0094BA 94 5A                 4036         .word      LINK
                           001678  4037 LINK = . 
      0094BC 83                    4038         .byte      1
      0094BD D9                    4039         .ascii     "]"
      00167A                       4040 RBRAC:
      0094BE CD 86 8E         [ 4] 4041         CALL   DOLIT
      0094C1 CC 94                 4042         .word  SCOMP
      0094C3 15 94 B4         [ 4] 4043         CALL   TEVAL
      0094C6 01 49 B6         [ 2] 4044         JP     STORE
                                   4045 
                                   4046 ;       CALL,    ( ca -- )
                                   4047 ;       Compile a subroutine call.
      0094C8 16 78                 4048         .word      LINK
                           001687  4049 LINK = . 
      0094C8 1D                    4050         .byte      5
      0094C9 00 02 16 03 FF        4051         .ascii     "CALL,"
      00168D                       4052 JSRC:
      0094CE 81 94 C6         [ 4] 4053         CALL     DOLIT
      0094D1 85 42                 4054         .word     CALLL     ;CALL
      0094D3 45 47 49         [ 4] 4055         CALL     CCOMMA
      0094D6 4E 13 95         [ 2] 4056         JP     COMMA
                                   4057 
                           000001  4058 .if PICATOUT_MOD
                                   4059 ;       INIT-OFS ( -- )
                                   4060 ;       compute offset to adjust jump address 
                                   4061 ;       set variable OFFSET 
      0094D7 16 87                 4062         .word LINK 
                           00169A  4063         LINK=.
      0094D7 CC                    4064         .byte 8 
      0094D8 8B 44 94 D1 85 55 4E  4065         .ascii "INIT-OFS" 
             54
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



      0016A3                       4066 INITOFS:
      0094E0 49 4C 81         [ 4] 4067         call TFLASH 
      0094E2 CD 03 CD         [ 4] 4068         CALL AT 
      0094E2 CD 94 5A         [ 4] 4069         CALL DUPP 
      0094E5 83 F8 CD         [ 4] 4070         call QBRAN
      0094E8 86 8E                 4071         .word 1$
      0094EA CC 94 15         [ 4] 4072         call DROP  
      0094ED 94 DC 85         [ 4] 4073         call CPP 
      0094F0 41 47 41         [ 4] 4074         call AT 
      0094F3 49 4E C4         [ 4] 4075         call HERE
      0094F5 CD 06 E8         [ 4] 4076         call SUBB 
      0094F5 CD 94 5A         [ 4] 4077 1$:     call OFFSET 
      0094F8 84 0F CD         [ 2] 4078         jp STORE  
                                   4079 .endif 
                                   4080 
                                   4081 ;       :       ( -- ; <string> )
                                   4082 ;       Start a new colon definition
                                   4083 ;       using next word as its name.
      0094FB 86 8E                 4084         .word      LINK
                           0016C8  4085 LINK = . 
      0094FD CC                    4086         .byte      1
      0094FE 94                    4087         .ascii     ":"
      0016CA                       4088 COLON:
                           000001  4089 .if PICATOUT_MOD
      0094FF 15 94 EF         [ 4] 4090         call INITOFS       
                                   4091 .endif ; PICATOUT_MOD
      009502 82 49 46         [ 4] 4092         CALL   TOKEN
      009505 CD 15 88         [ 4] 4093         CALL   SNAME
      009505 CD 94 5A         [ 2] 4094         JP     RBRAC
                                   4095 
                           000001  4096 .if PICATOUT_MOD 
                                   4097 ;       I:  ( -- )
                                   4098 ;       Start interrupt service routine definition
                                   4099 ;       those definition have no name.
      009508 83 F8                 4100         .word LINK
                           0016D8  4101         LINK=.
      00950A CD                    4102         .byte 2 
      00950B 8B 44                 4103         .ascii "I:" 
      0016DB                       4104 ICOLON:
      00950D CD 8A 55         [ 4] 4105         call INITOFS 
      009510 CC 94 15         [ 2] 4106         jp RBRAC  
                                   4107 .endif ; PICATOUT_MOD
                                   4108 
                                   4109 ;       IMMEDIATE       ( -- )
                                   4110 ;       Make last compiled word
                                   4111 ;       an immediate word.
      009513 95 02                 4112         .word      LINK
                           0016E3  4113 LINK = . 
      009515 84                    4114         .byte      9
      009516 54 48 45 4E 44 49 41  4115         .ascii     "IMMEDIATE"
             54 45
      00951A                       4116 IMMED:
      00951A CD 8B 44         [ 4] 4117         CALL     DOLIT
      00951D CD 86                 4118         .word     0x8000	;  IMEDD*256
      00951F 8E CD 85         [ 4] 4119         CALL     LAST
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



      009522 04 CC 84         [ 4] 4120         CALL     AT
      009525 36 95 15         [ 4] 4121         CALL     AT
      009528 84 45 4C         [ 4] 4122         CALL     ORR
      00952B 53 45 E0         [ 4] 4123         CALL     LAST
      00952D CD 03 CD         [ 4] 4124         CALL     AT
      00952D CD 94 5A         [ 2] 4125         JP     STORE
                                   4126 
                                   4127 ;; Defining words
                                   4128 
                                   4129 ;       CREATE  ( -- ; <string> )
                                   4130 ;       Compile a new array
                                   4131 ;       without allocating space.
      009530 84 0F                 4132         .word      LINK
                           001709  4133 LINK = . 
      009532 CD                    4134         .byte      6
      009533 8B 44 CD 8A 55 CD     4135         .ascii     "CREATE"
      001710                       4136 CREAT:
      009539 94 15 CD         [ 4] 4137         CALL     TOKEN
      00953C 85 04 CD         [ 4] 4138         CALL     SNAME
      00953F 8B 44 CD         [ 4] 4139         CALL     OVERT        
      009542 86 8E CD         [ 4] 4140         CALL     COMPI 
                           000001  4141 .if PICATOUT_MOD
      009545 85 04                 4142         .word DOVAR 
                           000000  4143 .else
                                   4144         CALL     DOVAR
                                   4145 .endif 
      009547 CC               [ 4] 4146         RET
                                   4147 
                                   4148 ;       VARIABLE        ( -- ; <string> )
                                   4149 ;       Compile a new variable
                                   4150 ;       initialized to 0.
      009548 84 36                 4151         .word      LINK
                           001721  4152 LINK = . 
      00954A 95                    4153         .byte      8
      00954B 28 85 41 48 45 41 44  4154         .ascii     "VARIABLE"
             45
      009552                       4155 VARIA:
                           000001  4156 .if PICATOUT_MOD
                                   4157 ; indirect variable so that VARIABLE definition can be compiled in FLASH 
      009552 CD 94 5A         [ 4] 4158         CALL HERE
      009555 84 0F CD         [ 4] 4159         CALL DUPP 
      009558 8B 44 CD         [ 4] 4160         CALL CELLP
      00955B 8A 55 CC         [ 4] 4161         CALL VPP 
      00955E 94 15 95         [ 4] 4162         CALL STORE
                                   4163 .endif         
      009561 4C 85 57         [ 4] 4164         CALL CREAT
      009564 48 49 4C         [ 4] 4165         CALL DUPP
      009567 45 13 95         [ 4] 4166         CALL COMMA
      009568 CD 09 D5         [ 4] 4167         CALL ZERO
                           000001  4168 .if PICATOUT_MOD 
      009568 CD 94 5A         [ 4] 4169         call SWAPP 
      00956B 83 F8 CD         [ 4] 4170         CALL STORE
      00956E 8B 44 CD         [ 4] 4171         CALL FMOVE ; move definition to FLASH
      009571 8A 55 CD         [ 4] 4172         CALL QDUP 
      009574 94 15 CC         [ 4] 4173         CALL QBRAN 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



      009577 85 04                 4174         .word SET_RAMLAST   
      009579 95 62 86         [ 4] 4175         call UPDATVP  ; don't update if variable kept in RAM.
      00957C 52 45 50         [ 4] 4176         CALL UPDATPTR
      00957F 45               [ 4] 4177         RET         
      00175D                       4178 SET_RAMLAST: 
      009580 41 54 E0         [ 4] 4179         CALL LAST 
      009582 CD 03 CD         [ 4] 4180         CALL AT 
      009582 CD 94 5A         [ 4] 4181         CALL RAMLAST 
      009585 84 0F CD         [ 2] 4182         jp STORE  
                                   4183 
                                   4184 .endif ;PICATOUT_MOD        
                                   4185 
                           000001  4186 .if PICATOUT_MOD
                                   4187 ;       CONSTANT  ( n -- ; <string> )
                                   4188 ;       Compile a new constant 
                                   4189 ;       n CONSTANT name 
      009588 86 8E                 4190         .word LINK 
                           00176B  4191         LINK=. 
      00958A CD                    4192         .byte 8 
      00958B 94 15 CD 8B 44 CD 86  4193         .ascii "CONSTANT" 
             8E
      001774                       4194 CONSTANT:          
      009593 CD 85 04         [ 4] 4195         CALL TOKEN
      009596 CC 84 36         [ 4] 4196         CALL SNAME 
      009599 95 7B 83         [ 4] 4197         CALL OVERT 
      00959C 41 46 54         [ 4] 4198         CALL COMPI 
                           000001  4199 .if PICATOUT_MOD
      00959F 17 9E                 4200         .word DOCONST
                           000000  4201 .else
                                   4202         CALL DOCONST
                                   4203 .endif 
      00959F CD 84 EA         [ 4] 4204         CALL COMMA 
      0095A2 CD 95 52         [ 4] 4205         CALL FMOVE
      0095A5 CD 8B 44         [ 4] 4206         CALL QDUP 
      0095A8 CC 85 04         [ 4] 4207         CALL QBRAN 
      0095AB 95 9B                 4208         .word SET_RAMLAST  
      0095AD 86 41 42         [ 4] 4209         CALL UPDATPTR  
      0095B0 4F               [ 4] 4210 1$:     RET          
                                   4211 
                                   4212 ; CONSTANT runtime semantic 
                                   4213 ; doCONST  ( -- n )
      0095B1 52 54                 4214         .word LINK 
                           001796  4215         LINK=.
      0095B3 22                    4216         .byte 7
      0095B4 44 4F 43 4F 4E 53 54  4217         .ascii "DOCONST"
      00179E                       4218 DOCONST:
      0095B4 CD 94 5A         [ 2] 4219         subw x,#CELLL
      0095B7 92 D8            [ 2] 4220         popw y 
      0095B9 CC 94            [ 2] 4221         ldw y,(y) 
      0095BB 8A               [ 2] 4222         ldw (x),y 
      0095BC 95               [ 4] 4223         ret 
                                   4224 .endif ;PICATOUT_MOD
                                   4225 
                                   4226 
                                   4227 ;; Tools
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



                                   4228 
                                   4229 ;       _TYPE   ( b u -- )
                                   4230 ;       Display a string. Filter
                                   4231 ;       non-printing characters.
      0095BD AD 82                 4232         .word      LINK
                           0017A9  4233 LINK = . 
      0095BF 24                    4234         .byte      5
      0095C0 22 54 59 50 45        4235         .ascii     "_TYPE"
      0095C1                       4236 UTYPE:
      0095C1 CD 94 5A         [ 4] 4237         CALL     TOR     ;start count down loop
      0095C4 8E F2            [ 2] 4238         JRA     UTYP2   ;skip first pass
      0095C6 CC 94 8A         [ 4] 4239 UTYP1:  CALL     DUPP
      0095C9 95 BE 82         [ 4] 4240         CALL     CAT
      0095CC 2E 22 FF         [ 4] 4241         CALL     TCHAR
      0095CE CD 03 2F         [ 4] 4242         CALL     EMIT    ;display only printable
      0095CE CD 94 5A         [ 4] 4243         CALL     ONEP    ;increment address
      0095D1 8E FC CC         [ 4] 4244 UTYP2:  CALL     DONXT
      0095D4 94 8A                 4245         .word      UTYP1   ;loop till done
      0095D6 95 CB 07         [ 2] 4246         JP     DROP
                                   4247 
                                   4248 ;       dm+     ( a u -- a )
                                   4249 ;       Dump u bytes from ,
                                   4250 ;       leaving a+u on  stack.
      0095D9 3F 55                 4251         .word      LINK
                           0017CD  4252 LINK = . 
      0095DB 4E                    4253         .byte      3
      0095DC 49 51 55              4254         .ascii     "dm+"
      0017D1                       4255 DUMPP:
      0095DF 45 04 9E         [ 4] 4256         CALL     OVER
      0095E0 CD 03 45         [ 4] 4257         CALL     DOLIT
      0095E0 CD 84                 4258         .word      4
      0095E2 F4 CD 91         [ 4] 4259         CALL     UDOTR   ;display address
      0095E5 CC CD 83         [ 4] 4260         CALL     SPACE
      0095E8 F8 95 FF         [ 4] 4261         CALL     TOR     ;start count down loop
      0095EB CD 8E            [ 2] 4262         JRA     PDUM2   ;skip first pass
      0095ED FC 07 20         [ 4] 4263 PDUM1:  CALL     DUPP
      0095F0 72 65 44         [ 4] 4264         CALL     CAT
      0095F3 65 66 20         [ 4] 4265         CALL     DOLIT
      0095F6 CD 85                 4266         .word      3
      0095F8 1E CD 8B         [ 4] 4267         CALL     UDOTR   ;display numeric data
      0095FB 2D CD 8E         [ 4] 4268         CALL     ONEP    ;increment address
      0095FE 9F CC 84         [ 4] 4269 PDUM2:  CALL     DONXT
      009601 EA 95                 4270         .word      PDUM1   ;loop till done
      009603 D8               [ 4] 4271         RET
                                   4272 
                                   4273 ;       DUMP    ( a u -- )
                                   4274 ;       Dump u bytes from a,
                                   4275 ;       in a formatted manner.
      009604 03 24                 4276         .word      LINK
                           0017FD  4277 LINK = . 
      009606 2C                    4278         .byte      4
      009607 6E 55 4D 50           4279         .ascii     "DUMP"
      009608                       4280 DUMP:
      009608 CD 84 F4         [ 4] 4281         CALL     BASE
      00960B CD 84 6B         [ 4] 4282         CALL     AT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



      00960E CD 83 F8         [ 4] 4283         CALL     TOR
      009611 96 3E CD         [ 4] 4284         CALL     HEX     ;save radix, set hex
      009614 95 E0 CD         [ 4] 4285         CALL     DOLIT
      009617 84 F4                 4286         .word      16
      009619 CD 8B 2D         [ 4] 4287         CALL     SLASH   ;change count to lines
      00961C CD 86 EF         [ 4] 4288         CALL     TOR     ;start count down loop
      00961F CD 86 42         [ 4] 4289 DUMP1:  CALL     CR
      009622 CD 84 36         [ 4] 4290         CALL     DOLIT
      009625 CD 84                 4291         .word      16
      009627 F4 CD 86         [ 4] 4292         CALL     DDUP
      00962A 60 CD 84         [ 4] 4293         CALL     DUMPP   ;display numeric
      00962D 36 CD 89         [ 4] 4294         CALL     ROT
      009630 CD CD 86         [ 4] 4295         CALL     ROT
      009633 34 CD 84         [ 4] 4296         CALL     SPACE
      009636 4D CD 85         [ 4] 4297         CALL     SPACE
      009639 04 CD 84         [ 4] 4298         CALL     UTYPE   ;display printable characters
      00963C 36 81 CD         [ 4] 4299         CALL     DONXT
      00963F 8E F2                 4300         .word      DUMP1   ;loop till done
      009641 05 20 6E         [ 4] 4301 DUMP3:  CALL     DROP
      009644 61 6D 65         [ 4] 4302         CALL     RFROM
      009647 CC 92 E0         [ 4] 4303         CALL     BASE
      00964A 96 04 08         [ 2] 4304         JP     STORE   ;restore radix
                                   4305 
                                   4306 ;       .S      ( ... -- ... )
                                   4307 ;        Display  contents of stack.
      00964D 24 43                 4308         .word      LINK
                           001849  4309 LINK = . 
      00964F 4F                    4310         .byte      2
      009650 4D 50                 4311         .ascii     ".S"
      00184C                       4312 DOTS:
      009652 49 4C 45         [ 4] 4313         CALL     CR
      009655 CD 0A 18         [ 4] 4314         CALL     DEPTH   ;stack depth
      009655 CD 91 CC         [ 4] 4315         CALL     TOR     ;start count down loop
      009658 CD 86            [ 2] 4316         JRA     DOTS2   ;skip first pass
      00965A 9E CD 83         [ 4] 4317 DOTS1:  CALL     RAT
                           000001  4318 .if PICATOUT_MOD
                                   4319 ; Not required following modification I made To PICK 
                                   4320 ;        CALL ONEP
                                   4321 .endif 
      00965D F8 96 76         [ 4] 4322 	CALL     PICK
      009660 CD 84 4D         [ 4] 4323         CALL     DOT     ;index stack, display contents
      009663 CD 83 C5         [ 4] 4324 DOTS2:  CALL     DONXT
      009666 80 00                 4325         .word      DOTS1   ;loop till done
      009668 CD 85 40         [ 4] 4326         CALL     DOTQP
      00966B CD                    4327         .byte      5
      00966C 83 F8 96 73 CC        4328         .ascii     " <sp "
      009671 84               [ 4] 4329         RET
                                   4330 
                                   4331 ;       >NAME   ( ca -- na | F )
                                   4332 ;       Convert code address
                                   4333 ;       to a name address.
      009672 1F CC                 4334         .word      LINK
                           001871  4335 LINK = . 
      009674 97                    4336         .byte      5
      009675 0D CD 8D 6A CD        4337         .ascii     ">NAME"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



      001877                       4338 TNAME:
      00967A 83 F8 92         [ 4] 4339         CALL     CNTXT   ;vocabulary link
      00967D E0 CC 94         [ 4] 4340 TNAM2:  CALL     AT
      009680 7C 96 4C         [ 4] 4341         CALL     DUPP    ;?last word in a vocabulary
      009683 05 4F 56         [ 4] 4342         CALL     QBRAN
      009686 45 52                 4343         .word      TNAM4
      009688 54 06 5A         [ 4] 4344         CALL     DDUP
      009689 CD 10 5D         [ 4] 4345         CALL     NAMET
      009689 CD 86 60         [ 4] 4346         CALL     XORR    ;compare
      00968C CD 84 4D         [ 4] 4347         CALL     QBRAN
      00968F CD 86                 4348         .word      TNAM3
      009691 34 CC 84         [ 4] 4349         CALL     CELLM   ;continue with next word
      009694 36 96            [ 2] 4350         JRA     TNAM2
      009696 83 C1 3B         [ 4] 4351 TNAM3:  CALL     SWAPP
      009699 CC 04 6A         [ 2] 4352         JP     DROP
      009699 CD 94 5A         [ 4] 4353 TNAM4:  CALL     DDROP
      00969C 84 2F CD         [ 2] 4354         JP     ZERO
                                   4355 
                                   4356 ;       .ID     ( na -- )
                                   4357 ;        Display  name at address.
      00969F 93 41                 4358         .word      LINK
                           0018A6  4359 LINK = . 
      0096A1 CD                    4360         .byte      3
      0096A2 96 89 CD              4361         .ascii     ".ID"
      0018AA                       4362 DOTID:
      0096A5 A0 67 CD         [ 4] 4363         CALL     QDUP    ;if zero no name
      0096A8 86 9E CD         [ 4] 4364         CALL     QBRAN
      0096AB 83 F8                 4365         .word      DOTI1
      0096AD 97 DD CD         [ 4] 4366         CALL     COUNT
      0096B0 A0 FB 81         [ 4] 4367         CALL     DOLIT
      0096B3 96 97                 4368         .word      0x1F
      0096B5 C2 49 3B         [ 4] 4369         CALL     ANDD    ;mask lexicon bits
      0096B8 CC 17 AF         [ 2] 4370         JP     UTYPE
      0096B8 1D 00 02         [ 4] 4371 DOTI1:  CALL     DOTQP
      0096BB 90                    4372         .byte      9
      0096BC AE 00 80 FF CD 94 2C  4373         .ascii     " noName"
      0096C3 CD               [ 4] 4374         RET
                                   4375 
                           000000  4376 WANT_SEE=0 
                           000000  4377 .if WANT_SEE 
                                   4378 ;       SEE     ( -- ; <string> )
                                   4379 ;       A simple decompiler.
                                   4380 ;       Updated for byte machines.
                                   4381         .word      LINK
                                   4382 LINK = . 
                                   4383         .byte      3
                                   4384         .ascii     "SEE"
                                   4385 SEE:
                                   4386         CALL     TICK    ;starting address
                                   4387         CALL     CR
                                   4388         CALL     ONEM
                                   4389 SEE1:   CALL     ONEP
                                   4390         CALL     DUPP
                                   4391         CALL     AT
                                   4392         CALL     DUPP    ;?does it contain a zero
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



                                   4393         CALL     QBRAN
                                   4394         .word    SEE2
                                   4395         CALL     TNAME   ;?is it a name
                                   4396 SEE2:   CALL     QDUP    ;name address or zero
                                   4397         CALL     QBRAN
                                   4398         .word    SEE3
                                   4399         CALL     SPACE
                                   4400         CALL     DOTID   ;display name
                                   4401         CALL     ONEP
                                   4402         JRA      SEE4
                                   4403 SEE3:   CALL     DUPP
                                   4404         CALL     CAT
                                   4405         CALL     UDOT    ;display number
                                   4406 SEE4:   CALL     NUFQ    ;user control
                                   4407         CALL     QBRAN
                                   4408         .word    SEE1
                                   4409         JP     DROP
                                   4410 .endif ; WANT_SEE 
                                   4411 
                                   4412 ;       WORDS   ( -- )
                                   4413 ;       Display names in vocabulary.
      0096C4 93 41                 4414         .word      LINK
                           0018CE  4415 LINK = . 
      0096C6 CD                    4416         .byte      5
      0096C7 A1 40 CD 86 9E        4417         .ascii     "WORDS"
      0018D4                       4418 WORDS:
      0096CC CD 83 F8         [ 4] 4419         CALL     CR
      0096CF 97 DD CD         [ 4] 4420         CALL     CNTXT   ;only in context
      0096D2 86 50 CD         [ 4] 4421 WORS1:  CALL     AT
      0096D5 84 4D CD         [ 4] 4422         CALL     QDUP    ;?at end of list
      0096D8 85 04 CD         [ 4] 4423         CALL     QBRAN
      0096DB 86 50                 4424         .word      WORS2
      0096DD CD 84 36         [ 4] 4425         CALL     DUPP
      0096E0 CD 9B 84         [ 4] 4426         CALL     SPACE
      0096E3 CD 9B 41         [ 4] 4427         CALL     DOTID   ;display a name
      0096E6 CD 84 EA         [ 4] 4428         CALL     CELLM
      0096E9 CD 84 4D         [ 4] 4429         CALL     BRAN
      0096EC CD 86                 4430         .word      WORS1
                           000001  4431 .if PICATOUT_MOD
                                   4432 ;        CALL     DROP ; never reached
                                   4433 .endif 
      0096EE 42               [ 4] 4434 WORS2:  RET
                                   4435 
                                   4436         
                                   4437 ;; Hardware reset
                                   4438 
                                   4439 ;       hi      ( -- )
                                   4440 ;       Display sign-on message.
      0096EF CD 84                 4441         .word      LINK
                           0018F9  4442 LINK = . 
      0096F1 36                    4443         .byte      2
      0096F2 CC 8A                 4444         .ascii     "hi"
      0018FC                       4445 HI:
      0096F4 55 81 96         [ 4] 4446         CALL     CR
      0096F7 B5 01 5D         [ 4] 4447         CALL     DOTQP   ;initialize I/O
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



      0096FA 0F                    4448         .byte      15
      0096FA CD 83 C5 96 55 CD 86  4449         .ascii     "stm8eForth v"
             12 CC 84 36 96
      009706 F8                    4450 	.byte      VER+'0'
      009707 05                    4451         .byte      '.' 
      009708 43                    4452 	.byte      EXT+'0' ;version
      009709 41 4C 4C         [ 2] 4453         JP     CR
                                   4454 
                           000000  4455 WANT_DEBUG=0
                           000000  4456 .if WANT_DEBUG 
                                   4457 ;       DEBUG      ( -- )
                                   4458 ;       Display sign-on message.
                                   4459 ;        .word      LINK
                                   4460 LINK = . 
                                   4461         .byte      5
                                   4462         .ascii     "DEBUG"
                                   4463 DEBUG:
                                   4464 	CALL DOLIT
                                   4465 	.word 0x65
                                   4466 	CALL EMIT
                                   4467 	CALL DOLIT
                                   4468 	.word 0
                                   4469  	CALL ZLESS 
                                   4470 	CALL DOLIT
                                   4471 	.word 0xFFFE
                                   4472 	CALL ZLESS 
                                   4473 	CALL UPLUS 
                                   4474  	CALL DROP 
                                   4475 	CALL DOLIT
                                   4476 	.word 3
                                   4477 	CALL UPLUS 
                                   4478 	CALL UPLUS 
                                   4479  	CALL DROP
                                   4480 	CALL DOLIT
                                   4481 	.word 0x43
                                   4482 	CALL UPLUS 
                                   4483  	CALL DROP
                                   4484 	CALL EMIT
                                   4485 	CALL DOLIT
                                   4486 	.word 0x4F
                                   4487 	CALL DOLIT
                                   4488 	.word 0x6F
                                   4489  	CALL XORR
                                   4490 	CALL DOLIT
                                   4491 	.word 0xF0
                                   4492  	CALL ANDD
                                   4493 	CALL DOLIT
                                   4494 	.word 0x4F
                                   4495  	CALL ORR
                                   4496 	CALL EMIT
                                   4497 	CALL DOLIT
                                   4498 	.word 8
                                   4499 	CALL DOLIT
                                   4500 	.word 6
                                   4501  	CALL SWAPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



                                   4502 	CALL OVER
                                   4503 	CALL XORR
                                   4504 	CALL DOLIT
                                   4505 	.word 3
                                   4506 	CALL ANDD 
                                   4507 	CALL ANDD
                                   4508 	CALL DOLIT
                                   4509 	.word 0x70
                                   4510 	CALL UPLUS 
                                   4511 	CALL DROP
                                   4512 	CALL EMIT
                                   4513 	CALL DOLIT
                                   4514 	.word 0
                                   4515 	CALL QBRAN
                                   4516 	.word DEBUG1
                                   4517 	CALL DOLIT
                                   4518 	.word 0x3F
                                   4519 DEBUG1:
                                   4520 	CALL DOLIT
                                   4521 	.word 0xFFFF
                                   4522 	CALL QBRAN
                                   4523 	.word DEBUG2
                                   4524 	CALL DOLIT
                                   4525 	.word 0x74
                                   4526 	CALL BRAN
                                   4527 	.word DEBUG3
                                   4528 DEBUG2:
                                   4529 	CALL DOLIT
                                   4530 	.word 0x21
                                   4531 DEBUG3:
                                   4532 	CALL EMIT
                                   4533 	CALL DOLIT
                                   4534 	.word 0x68
                                   4535 	CALL DOLIT
                                   4536 	.word 0x80
                                   4537 	CALL STORE
                                   4538 	CALL DOLIT
                                   4539 	.word 0x80
                                   4540 	CALL AT
                                   4541 	CALL EMIT
                                   4542 	CALL DOLIT
                                   4543 	.word 0x4D
                                   4544 	CALL TOR
                                   4545 	CALL RAT
                                   4546 	CALL RFROM
                                   4547 	CALL ANDD
                                   4548 	CALL EMIT
                                   4549 	CALL DOLIT
                                   4550 	.word 0x61
                                   4551 	CALL DOLIT
                                   4552 	.word 0xA
                                   4553 	CALL TOR
                                   4554 DEBUG4:
                                   4555 	CALL DOLIT
                                   4556 	.word 1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



                                   4557 	CALL UPLUS 
                                   4558 	CALL DROP
                                   4559 	CALL DONXT
                                   4560 	.word DEBUG4
                                   4561 	CALL EMIT
                                   4562 	CALL DOLIT
                                   4563 	.word 0x656D
                                   4564 	CALL DOLIT
                                   4565 	.word 0x100
                                   4566 	CALL UMSTA
                                   4567 	CALL SWAPP
                                   4568 	CALL DOLIT
                                   4569 	.word 0x100
                                   4570 	CALL UMSTA
                                   4571 	CALL SWAPP 
                                   4572 	CALL DROP
                                   4573 	CALL EMIT
                                   4574 	CALL EMIT
                                   4575 	CALL DOLIT
                                   4576 	.word 0x2043
                                   4577 	CALL DOLIT
                                   4578 	.word 0
                                   4579 	CALL DOLIT
                                   4580 	.word 0x100
                                   4581 	CALL UMMOD
                                   4582 	CALL EMIT
                                   4583 	CALL EMIT
                                   4584 	;JP ORIG
                                   4585 	RET
                                   4586 .endif ; WANT_DEBUG 
                                   4587 
                                   4588 
                                   4589 ;       'BOOT   ( -- a )
                                   4590 ;       The application startup vector.
      00970C 2C F9                 4591         .word      LINK
                           001917  4592 LINK = . 
      00970D 05                    4593         .byte      5
      00970D CD 83 C5 00 CD        4594         .ascii     "'BOOT"
      00191D                       4595 TBOOT:
      009712 CD 94 2C         [ 4] 4596         CALL     DOVAR
      009715 CC 94                 4597         .word    APP_RUN      ;application to boot
                                   4598 
                                   4599 ;       COLD    ( -- )
                                   4600 ;       The hilevel cold start s=ence.
      009717 15 97                 4601         .word      LINK
                           001924  4602         LINK = . 
      009719 07                    4603         .byte      4
      00971A 08 49 4E 49           4604         .ascii     "COLD"
      001929                       4605 COLD:
                           000000  4606 .if WANT_DEBUG
                                   4607         CALL DEBUG
                                   4608 .endif 
      00971E 54 2D 4F         [ 4] 4609 COLD1:  CALL     DOLIT
      009721 46 53                 4610         .word      UZERO
      009723 CD 03 45         [ 4] 4611 	CALL     DOLIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      009723 CD 86                 4612         .word      UPP
      009725 01 CD 84         [ 4] 4613         CALL     DOLIT
      009728 4D CD                 4614 	.word      UEND-UZERO
      00972A 84 F4 CD         [ 4] 4615         CALL     CMOVE   ;initialize user area
                                   4616 
                           000001  4617 .if PICATOUT_MOD
                                   4618 ; if APP_RUN==0 initialize with ca de 'hi'  
      00972D 83 F8 97 40      [ 2] 4619         ldw y,APP_RUN 
      009731 CD 84            [ 1] 4620         jrne 0$
      009733 EA CD 86         [ 2] 4621         subw x,#CELLL 
      009736 50 CD 84 4D      [ 2] 4622         ldw y,#HI  
      00973A CD               [ 2] 4623         ldw (x),y
      00973B 8B 44 CD         [ 4] 4624         call UPDATRUN 
      00194C                       4625 0$:        
                                   4626 ; update LAST with APP_LAST 
                                   4627 ; if APP_LAST > LAST else do the opposite
      00973E 87 68 CD 86      [ 2] 4628         ldw y,APP_LAST 
      009742 85 CC 84         [ 2] 4629         cpw y,ULAST 
      009745 36 97            [ 1] 4630         jrugt 1$ 
                                   4631 ; save LAST at APP_LAST  
      009747 1A 01 3A         [ 4] 4632         call UPDATLAST 
      00974A 20 06            [ 2] 4633         jra 2$
      00195A                       4634 1$: ; update LAST with APP_LAST 
      00974A CD 97 23         [ 2] 4635         ldw ULAST,y
      00974D CD 90 CF         [ 2] 4636         ldw UCNTXT,y
      001960                       4637 2$:  
                                   4638 ; update APP_CP if < app_space 
      009750 CD 96 08 CC      [ 2] 4639         ldw y,APP_CP  
      009754 96 FA 97         [ 2] 4640         cpw y,UCP   
      009757 48 02            [ 1] 4641         jruge 3$ 
      009759 49 3A 04         [ 4] 4642         call UPDATCP
      00975B 90 BE 18         [ 2] 4643         ldw y,UCP   
      00196F                       4644 3$:
      00975B CD 97 23         [ 2] 4645         ldw UCP,y                 
                                   4646 ; update UVP with APP_VP  
                                   4647 ; if APP_VP>UVP else do the opposite 
      00975E CC 96 FA 97      [ 2] 4648         ldw y,APP_VP 
      009762 58 09 49         [ 2] 4649         cpw y,UVP 
      009765 4D 4D            [ 1] 4650         jrugt 4$
      009767 45 44 49         [ 4] 4651         call UPDATVP 
      00976A 41 54            [ 2] 4652         jra 6$
      001980                       4653 4$: ; update UVP with APP_VP 
      00976C 45 BF 16         [ 2] 4654         ldw UVP,y 
      00976D                       4655 6$:      
                                   4656 .endif ; PICATOUT_MOD
      00976D CD 83 C5         [ 4] 4657         CALL     PRESE   ;initialize data stack and TIB
      009770 80 00 CD         [ 4] 4658         CALL     TBOOT
      009773 86 60 CD         [ 4] 4659         CALL     ATEXE   ;application boot
      009776 84 4D CD         [ 4] 4660         CALL     OVERT
      009779 84 4D CD         [ 2] 4661         JP     QUIT    ;start interpretation
                                   4662 
                           000001  4663 WANT_MATH_CONST = 1 
                           000001  4664 .if WANT_MATH_CONST 
                                   4665         ; irrational constants 
                                   4666         ; approximation by integers ratio.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



                                   4667         .include "const_ratio.asm"
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
      00977C 85 54                   31         .word LINK 
                           001994    32         LINK=.
      00977E CD                      33         .byte 2
      00977F 86 60                   34         .ascii "PI" 
      001997                         35 PII:
      009781 CD 84 4D         [ 2]   36         subw x,#2*CELLL 
      009784 CC 84 36 97      [ 2]   37         ldw y,#355 
      009788 63 06            [ 2]   38         ldw (2,x),y 
      00978A 43 52 45 41      [ 2]   39         ldw y,#113 
      00978E 54               [ 2]   40         ldw (x),y 
      00978F 45               [ 4]   41         ret 
                                     42 
                                     43 ;      SQRT2 ( -- 19601  13860 )
                                     44 ; precision: 1.5e-9 
                                     45 ; usage example to compute Voltage peek to peek from Vrms 
                                     46 ; : VPP SQRT2 */ 2 * ;
                                     47 ;
      009790 19 94                   48         .word LINK 
                           0019A8    49         LINK=.
      009790 CD                      50         .byte 5 
      009791 90 CF CD 96 08          51         .ascii "SQRT2" 
      0019AE                         52 SQRT2:
      009796 CD 96 89         [ 2]   53         subw x,#2*CELLL 
      009799 CD 94 5A 85      [ 2]   54         ldw y,#19601 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



      00979D A1 81            [ 2]   55         ldw (2,x),y 
      00979F 97 89 08 56      [ 2]   56         ldw y,#13860 
      0097A3 41               [ 2]   57         ldw (x),y 
      0097A4 52               [ 4]   58         ret 
                                     59 
                                     60 ;   SQRT3 ( -- 18817 10864 )
                                     61 ; precision: 1.1e-9
                                     62 ;
      0097A5 49 41                   63         .word LINK 
                           0019BF    64         LINK=.
      0097A7 42                      65         .byte 5
      0097A8 4C 45 52 54 33          66         .ascii "SQRT3" 
      0097AA                         67 SQRT3: 
      0097AA CD 8B 44         [ 2]   68     subw x,#2*CELLL 
      0097AD CD 84 F4 CD      [ 2]   69     ldw y,#18817 
      0097B1 89 BE            [ 2]   70     ldw (2,x),y 
      0097B3 CD 86 42 CD      [ 2]   71     ldw y,#10864 
      0097B7 84               [ 2]   72     ldw (x),y 
      0097B8 36               [ 4]   73     ret 
                                     74 
                                     75 ;   E ( -- 28667 10546 )
                                     76 ; precision: 5.5e-9 
                                     77 ; natural log base 
      0097B9 CD 97                   78         .word LINK 
                           0019D6    79         LINK=.
      0097BB 90                      80         .byte 1
      0097BC CD                      81         .ascii "E" 
      0019D8                         82 ENEPER:
      0097BD 84 F4 CD         [ 2]   83     subw x,#2*CELLL 
      0097C0 94 15 CD 8A      [ 2]   84     ldw y,#28667 
      0097C4 55 CD            [ 2]   85     ldw (2,x),y 
      0097C6 85 04 CD 84      [ 2]   86     ldw y,#10546 
      0097CA 36               [ 2]   87     ldw (x),y 
      0097CB CD               [ 4]   88     ret 
                                     89 
                                     90 ;   SQRT10 ( -- 22936 7253 )
                                     91 ; precision: 5.7e-9 
      0097CC A0 67                   92         .word LINK 
                           0019E9    93         LINK=.
      0097CE CD                      94         .byte 6 
      0097CF 86 9E CD 83 F8 97       95         .ascii "SQRT10" 
      0019F0                         96 SQRT10:
      0097D5 DD CD 9B         [ 2]   97     subw x,#2*CELLL
      0097D8 9B CD A0 FB      [ 2]   98     ldw y,#22936 
      0097DC 81 02            [ 2]   99     ldw (2,x),y 
      0097DD 90 AE 1C 55      [ 2]  100     ldw y,#7253
      0097DD CD               [ 2]  101     ldw (x),y 
      0097DE 86               [ 4]  102     ret 
                                    103 
                                    104 ;   SQRT12 ( -- 26797 25293 )
                                    105 ; precision: 1.0e-9 
                                    106 ; used in music to compute well tempered scale
      0097DF 60 CD                  107         .word LINK 
                           001A01   108         LINK=. 
      0097E1 84                     109         .byte 5 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



      0097E2 4D CD 86 73 CC         110         .ascii "12RT2"
      001A07                        111 RT12_2:
      0097E7 84 36 97         [ 2]  112     subw x,#2*CELLL 
      0097EA A1 08 43 4F      [ 2]  113     ldw y,#26797
      0097EE 4E 53            [ 2]  114     ldw (2,x),y 
      0097F0 54 41 4E 54      [ 2]  115     ldw y,#25293
      0097F4 FF               [ 2]  116     ldw (x),y 
      0097F4 CD               [ 4]  117     ret 
                                    118 
                                    119 ;   LOG2 ( -- 2040 11103 )
                                    120 ; log(2)/1.6384
                                    121 ; precision: 1.1e-8
      0097F5 90 CF                  122         .word LINK 
                           001A18   123         LINK=.
      0097F7 CD                     124         .byte 4 
      0097F8 96 08 CD 96            125         .ascii "LOG2" 
      001A1D                        126 LOG2:
      0097FC 89 CD 94         [ 2]  127     subw x,#2*CELLL
      0097FF 5A 98 1E CD      [ 2]  128     ldw y,#2040 
      009803 94 15            [ 2]  129     ldw (2,x),y 
      009805 CD A0 67 CD      [ 2]  130     ldw y,#11103 
      009809 86               [ 2]  131     ldw (x),y 
      00980A 9E               [ 4]  132     ret 
                                    133 
                                    134 ;   LN2 ( -- 485 11464 )
                                    135 ; ln(2)/16.384 
                                    136 ; precision: 1.0e-7 
      00980B CD 83                  137         .word LINK 
                           001A2E   138         LINK=.
      00980D F8                     139         .byte 3 
      00980E 97 DD CD               140         .ascii "LN2" 
      001A32                        141 LN2: 
      009811 A0 FB 81         [ 2]  142     subw x,#2*CELLL
      009814 97 EB 07 44      [ 2]  143     ldw y,#485
      009818 4F 43            [ 2]  144     ldw (2,x),y 
      00981A 4F 4E 53 54      [ 2]  145     ldw y,#11464 
      00981E FF               [ 2]  146     ldw (x),y 
      00981E 1D               [ 4]  147     ret 
                                    148 
                                    149 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



                                   4668 .endif 
                                   4669 
                           000001  4670 .if PICATOUT_MOD
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



                                   4671         .include "flash.asm"
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
      00981F 00 02                   30     .word LINK 
                           001A43    31     LINK=.
      009821 90                      32     .byte 3 
      009822 85 90 FE                33     .ascii "FP!"
      001A47                         34 fptr_store:
      009825 FF 81            [ 1]   35     ldw y,x
      009827 98 16            [ 2]   36     ldw y,(y)
      009829 05 5F            [ 1]   37     ld a,yl 
      00982B 54 59            [ 1]   38     ld FPTR,a 
      00982D 50 45 02         [ 2]   39     addw x,#CELLL 
      00982F 90 93            [ 1]   40     ldw y,x 
      00982F CD 84            [ 2]   41     ldw y,(y)
      009831 BD 20 0F         [ 2]   42     ldw PTR16,y
      009834 CD 84 F4         [ 2]   43     addw x,#CELLL 
      009837 CD               [ 4]   44     ret 
                                     45 
                                     46 ;-----------------------------------
                                     47 ; return EEPROM base address 
                                     48 ; as a double 
                                     49 ;  EEPROM  ( -- ud )
                                     50 ;-----------------------------------
      009838 84 6B                   51     .word LINK 
                           001A5F    52 LINK=.
      00983A CD                      53     .byte 6 
      00983B 8A 7F CD 83 AF CD       54     .ascii "EEPROM"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



      001A66                         55 EEPROM: 
      009841 89 E9 CD 83      [ 2]   56     ldw y,#EEPROM_BASE
      009845 D9 98 34         [ 2]   57     subw x,#2*CELLL 
      009848 CC 84            [ 2]   58     ldw (2,x),y 
      00984A EA 98            [ 1]   59     clrw y 
      00984C 29               [ 2]   60     ldw (x),y 
      00984D 03               [ 4]   61     ret
                                     62 
                                     63 ;---------------------------------
                                     64 ; return APP_LAST pointer as double
                                     65 ; EEP-LAST ( -- ud )
                                     66 ;---------------------------------
      00984E 64 6D                   67 	.word LINK 
                           001A75    68 	LINK=.
      009850 2B                      69 	.byte 8 
      009851 45 45 50 2D 4C 41 53    70 	.ascii "EEP-LAST"
             54
      001A7E                         71 EEPLAST:
      009851 CD 85 1E         [ 2]   72 	subw x,#2*CELLL 
      009854 CD 83 C5 00      [ 2]   73 	ldw y,#APP_LAST 
      009858 04 CD            [ 2]   74 	ldw (2,x),y 
      00985A 8F 25            [ 1]   75 	clrw y 
      00985C CD               [ 2]   76 	ldw (x),y 
      00985D 8E               [ 4]   77 	ret 
                                     78 
                                     79 ;----------------------------------
                                     80 ; return APP_RUN pointer as double	
                                     81 ; EEP-RUN ( -- ud )
                                     82 ;-----------------------------------
      00985E 75 CD                   83 	.word LINK 
                           001A8D    84 	LINK=.
      009860 84                      85 	.byte 7
      009861 BD 20 11 CD 84 F4 CD    86 	.ascii "EEP-RUN"
      001A95                         87 EEPRUN:
      009868 84 6B CD         [ 2]   88 	subw x,#2*CELLL 
      00986B 83 C5 00 03      [ 2]   89 	ldw y,#APP_RUN 
      00986F CD 8F            [ 2]   90 	ldw (2,x),y 
      009871 25 CD            [ 1]   91 	clrw y 
      009873 89               [ 2]   92 	ldw (x),y 
      009874 E9               [ 4]   93 	ret 
                                     94 
                                     95 ;------------------------------------
                                     96 ; return APP_CP pointer as double 
                                     97 ; EEP-CP ( -- ud )
                                     98 ;------------------------------------
      009875 CD 83                   99 	.word LINK
                           001AA4   100 	LINK=.
      009877 D9                     101 	.byte 6 
      009878 98 64 81 98 4D 04      102 	.ascii "EEP-CP"
      001AAB                        103 EEPCP:
      00987E 44 55 4D         [ 2]  104 	subw x,#2*CELLL 
      009881 50 AE 40 04      [ 2]  105 	ldw y,#APP_CP  
      009882 EF 02            [ 2]  106 	ldw (2,x),y 
      009882 CD 85            [ 1]  107 	clrw y 
      009884 B1               [ 2]  108 	ldw (x),y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      009885 CD               [ 4]  109 	ret 
                                    110 
                                    111 ;------------------------------------
                                    112 ; return APP_VP pointer as double 
                                    113 ; EEP-VP ( -- ud )
                                    114 ;-------------------------------------
      009886 84 4D                  115 	.word LINK
                           001ABA   116 	LINK=.
      009888 CD                     117 	.byte 6
      009889 84 BD CD 8C FD CD      118 	.ascii "EEP-VP"
      001AC1                        119 EEPVP:
      00988F 83 C5 00         [ 2]  120 	subw x,#2*CELLL 
      009892 10 CD 89 0F      [ 2]  121 	ldw y,#APP_VP  
      009896 CD 84            [ 2]  122 	ldw (2,x),y 
      009898 BD CD            [ 1]  123 	clrw y 
      00989A 8E               [ 2]  124 	ldw (x),y 
      00989B BD               [ 4]  125 	ret 
                                    126 
                                    127 ;----------------------------------
                                    128 ; update APP_LAST with LAST 
                                    129 ; UPDAT-LAST ( -- )
                                    130 ;----------------------------------
      00989C CD 83                  131 	.word LINK 
                           001AD0   132 	LINK=.
      00989E C5                     133 	.byte 10
      00989F 00 10 CD 86 DA CD 98   134 	.ascii "UPDAT-LAST"
             51 CD 86
      001ADB                        135 UPDATLAST:
      0098A9 AF CD 86         [ 4]  136 	call LAST
      0098AC AF CD 8E         [ 4]  137 	call AT  
      0098AF 75 CD 8E         [ 4]  138 	call EEPLAST
      0098B2 75 CD 98         [ 2]  139 	jp ee_store 
                                    140 
                                    141 ;---------------------------------
                                    142 ; update APP_RUN 
                                    143 ; UPDAT-RUN ( a -- )
                                    144 ;---------------------------------
      0098B5 2F CD                  145 	.word LINK
                           001AE9   146 	LINK=.
      0098B7 83                     147 	.byte 9
      0098B8 D9 98 99 CD 84 EA CD   148 	.ascii "UPDAT-RUN"
             84 9E
      001AF3                        149 UPDATRUN:
      0098C1 CD 85 B1         [ 4]  150 	call EEPRUN
      0098C4 CC 84 36         [ 2]  151 	jp ee_store 
                                    152 	
                                    153 ;---------------------------------
                                    154 ; update APP_CP with CP 
                                    155 ; UPDAT-CP ( -- )
                                    156 ;---------------------------------
      0098C7 98 7D                  157 	.word LINK 
                           001AFB   158 	LINK=.
      0098C9 02                     159 	.byte 8 
      0098CA 2E 53 44 41 54 2D 43   160 	.ascii "UPDAT-CP"
             50
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



      0098CC                        161 UPDATCP:
      0098CC CD 8E BD         [ 4]  162 	call CPP 
      0098CF CD 8A 98         [ 4]  163 	call AT 
      0098D2 CD 84 BD         [ 4]  164 	call EEPCP 
      0098D5 20 09 CD         [ 2]  165 	jp ee_store 
                                    166 
                                    167 ;----------------------------------
                                    168 ; update APP_VP with VP 
                                    169 ; UPDAT-VP ( -- )
                                    170 ;----------------------------------
      0098D8 84 B1                  171 	.word LINK
                           001B12   172 	LINK=.
      0098DA CD                     173 	.byte 8 
      0098DB 8A AF CD 8F 58 CD 83   174 	.ascii "UPDAT-VP" 
             D9
      001B1B                        175 UPDATVP:
      0098E3 98 D7 CD         [ 4]  176 	call VPP 
      0098E6 8E FC 05         [ 4]  177 	call AT
      0098E9 20 3C 73         [ 4]  178 	call EEPVP 
      0098EC 70 20 81         [ 2]  179 	jp ee_store
                                    180 	
                                    181 
                                    182 ;----------------------------------
                                    183 ; fetch integer at address over 65535
                                    184 ;  F@   ( ud -- n )
                                    185 ;----------------------------------
      0098EF 98 C9                  186     .word LINK 
                           001B29   187 LINK=.
      0098F1 05                     188     .byte 2
      0098F2 3E 4E                  189     .ascii "F@"
      001B2C                        190 farat:
      0098F4 41 4D 45         [ 4]  191     call fptr_store
      0098F7 92 BC 00 32      [ 5]  192     ldf a,[FPTR]
      0098F7 CD 86 34         [ 2]  193     subw x,#CELLL 
      0098FA CD               [ 1]  194     ld (x),a 
      0098FB 84 4D CD 84      [ 2]  195     ldw y,#1
      0098FF F4 CD 83 F8      [ 1]  196     ldf a,([FPTR],y)
      009903 99 1E            [ 1]  197     ld (1,x),a
      009905 CD               [ 4]  198     ret 
                                    199 
                                    200 ;-------------------------------------
                                    201 ; fetch C at address over 65535 
                                    202 ; FC@ ( ud -- c)
                                    203 ;-------------------------------------
      009906 86 DA                  204     .word LINK
                           001B44   205     LINK=.
      009908 CD                     206     .byte 3 
      009909 90 DD CD               207     .ascii "FC@" 
      001B48                        208 farcat:
      00990C 85 69 CD         [ 4]  209     call fptr_store 
      00990F 83 F8 99 18      [ 5]  210     ldf a,[FPTR]
      009913 CD 89 CD         [ 2]  211     subw x,#CELLL 
      009916 20 E2            [ 1]  212     ld (1,x),a 
      009918 CD               [ 1]  213     clr (x)
      009919 85               [ 4]  214     ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



                                    215     
                                    216 ;----------------------------------
                                    217 ; unlock EEPROM/OPT for writing/erasing
                                    218 ; wait endlessly for FLASH_IAPSR_DUL bit.
                                    219 ;  UNLKEE   ( -- )
                                    220 ;----------------------------------
      00991A 04 CC                  221     .word LINK 
                           001B58   222 LINK=.
      00991C 84                     223     .byte 6 
      00991D EA CD 86 CF CC 8A      224     .ascii "UNLKEE"
      001B5F                        225 unlock_eeprom:
      009923 55 98 F1 03      [ 1]  226 	mov FLASH_CR2,#0 
      009927 2E 49 44 5C      [ 1]  227 	mov FLASH_NCR2,#0xFF 
      00992A 35 AE 50 64      [ 1]  228 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      00992A CD 86 9E CD      [ 1]  229     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      00992E 83 F8 99 40 CD   [ 2]  230 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      009933 8B               [ 4]  231 	ret
                                    232 
                                    233 ;----------------------------------
                                    234 ; unlock FLASH for writing/erasing
                                    235 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                    236 ; UNLKFL  ( -- )
                                    237 ;----------------------------------
      009934 2D CD                  238     .word LINK 
                           001B77   239 LINK=. 
      009936 83                     240     .byte 6 
      009937 C5 00 1F CD 85 40      241     .ascii "UNLKFL"    
      001B7E                        242 unlock_flash:
      00993D CC 98 2F CD      [ 1]  243 	mov FLASH_CR2,#0 
      009941 8E FC 09 20      [ 1]  244 	mov FLASH_NCR2,#0xFF 
      009945 6E 6F 4E 61      [ 1]  245 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      009949 6D 65 81 99      [ 1]  246 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      00994D 26 05 57 4F 52   [ 2]  247 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      009952 44               [ 4]  248 	ret
                                    249 
                                    250 ;-----------------------------
                                    251 ; unlock FLASH or EEPROM 
                                    252 ; according to FPTR address 
                                    253 ;  UNLOCK ( -- )
                                    254 ;-----------------------------
      009953 53 77                  255 	.word LINK 
                           001B96   256 	LINK=.
      009954 06                     257 	.byte 6
      009954 CD 8E BD CD 86 34      258 	.ascii "UNLOCK"
      001B9D                        259 unlock:
                                    260 ; put addr[15:0] in Y, for bounds check.
      00995A CD 84 4D         [ 2]  261 	ldw y,PTR16   ; Y=addr15:0
                                    262 ; check addr[23:16], if <> 0 then it is extened flash memory
      00995D CD 86            [ 1]  263 	tnz FPTR 
      00995F 9E CD            [ 1]  264 	jrne 4$
      009961 83 F8 99 76      [ 2]  265     cpw y,#FLASH_BASE
      009965 CD 84            [ 1]  266     jruge 4$
      009967 F4 CD 8E 75      [ 2]  267 	cpw y,#EEPROM_BASE  
      00996B CD 99            [ 1]  268     jrult 9$
      00996D 2A CD 89 CD      [ 2]  269 	cpw y,#OPTION_END 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



      009971 CD 84            [ 1]  270 	jrugt 9$
      009973 0F 99 5A         [ 4]  271 	call unlock_eeprom
      009976 81               [ 4]  272 	ret 
      009977 99 4E 02         [ 4]  273 4$: call unlock_flash
      00997A 68               [ 4]  274 9$: ret 
                                    275 
                                    276 ;-------------------------
                                    277 ; lock write access to 
                                    278 ; FLASH and EEPROM 
                                    279 ; LOCK ( -- )
                                    280 ;-------------------------
      00997B 69 96                  281 	.word LINK 
                           001BC0   282 	LINK=.
      00997C 04                     283 	.byte 4 
      00997C CD 8E BD CD            284 	.ascii "LOCK" 
      001BC5                        285 lock: 
      009980 8E FC 0F 73      [ 1]  286 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      009984 74 6D 38 65      [ 1]  287 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009988 46               [ 4]  288 	ret 
                                    289 
                                    290 ;-------------------------
                                    291 ; increment FPTR 
                                    292 ; INC-FPTR ( -- )
                                    293 ;-------------------------
      009989 6F 72                  294 	.word LINK 
                           001BD0   295 	LINK=. 
      00998B 74                     296 	.byte 8 
      00998C 68 20 76 33 2E 30 CC   297 	.ascii "INC-FPTR" 
             8E
      001BD9                        298 inc_fptr:
      009994 BD 99            [ 1]  299 	inc PTR8 
      009996 79 05            [ 1]  300 	jrne 1$
      009998 27 42 4F         [ 2]  301 	ldw y,FPTR 
      00999B 4F 54            [ 2]  302 	incw y 
      00999D 90 BF 32         [ 2]  303 	ldw FPTR,y 
      00999D CD               [ 4]  304 1$: ret 
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
      00999E 85 A1                  315 	.word LINK 
                           001BE8   316 	LINK=. 
      0099A0 40                     317 	.byte 7 
      0099A1 02 99 97 04 43 4F 4C   318 	.ascii "WR-BYTE" 
                                    319 
      001BF0                        320 write_byte:
      0099A8 44 93            [ 1]  321 	ldw y,x 
      0099A9 90 FE            [ 2]  322 	ldw y,(y)
      0099A9 CD 83 C5         [ 2]  323 	addw x,#CELLL 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



      0099AC 80 A7            [ 1]  324 	ld a,yl
      0099AE CD 83 C5 00      [ 4]  325 	ldf [FPTR],a
      0099B2 06 CD 83 C5 00   [ 2]  326 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      0099B7 1A CD            [ 2]  327 	jra inc_fptr 
                                    328 
                                    329 
                                    330 
                                    331 ;---------------------------------------
                                    332 ; write a byte to FLASH or EEPROM/OPTION  
                                    333 ; EEC!  (c ud -- )
                                    334 ;---------------------------------------
      0099B9 8B 91                  335     .word LINK 
                           001C06   336 	LINK=.
      0099BB 90                     337     .byte 4 
      0099BC CE 40 02 26            338     .ascii "EEC!"
                                    339 	; local variables 
                           000001   340 	BTW = 1   ; byte to write offset on stack
                           000002   341     OPT = 2 
                           000002   342 	VSIZE = 2
      001C0B                        343 ee_cstore:
      0099C0 0B 1D            [ 2]  344 	sub sp,#VSIZE
      0099C2 00 02 90         [ 4]  345     call fptr_store
      0099C5 AE 99            [ 1]  346 	ld a,(1,x)
      0099C7 7C               [ 1]  347 	cpl a 
      0099C8 FF CD            [ 1]  348 	ld (BTW,sp),a ; byte to write 
      0099CA 9B 73            [ 1]  349 	clr (OPT,sp)  ; OPTION flag
      0099CC CD 1B 9D         [ 4]  350 	call unlock 
                                    351 	; check if option
      0099CC 90 CE            [ 1]  352 	tnz FPTR 
      0099CE 40 00            [ 1]  353 	jrne 2$
      0099D0 90 B3 1A         [ 2]  354 	ldw y,PTR16 
      0099D3 22 05 CD 9B      [ 2]  355 	cpw y,#OPTION_BASE
      0099D7 5B 20            [ 1]  356 	jrmi 2$
      0099D9 06 A3 48 80      [ 2]  357 	cpw y,#OPTION_END+1
      0099DA 2A 0A            [ 1]  358 	jrpl 2$
      0099DA 90 BF            [ 1]  359 	cpl (OPT,sp)
                                    360 	; OPTION WRITE require this unlock 
      0099DC 1A 90 BF 14      [ 1]  361     bset FLASH_CR2,#FLASH_CR2_OPT
      0099E0 72 1F 50 5C      [ 1]  362     bres FLASH_NCR2,#FLASH_CR2_OPT 
      001C37                        363 2$: 
      0099E0 90 CE 40         [ 4]  364 	call write_byte 	
      0099E3 04 90            [ 1]  365 	tnz (OPT,sp)
      0099E5 B3 18            [ 1]  366 	jreq 3$ 
      0099E7 24 06            [ 1]  367     ld a,(BTW,sp)
      0099E9 CD 9B            [ 1]  368     clrw y
      0099EB 84 90            [ 1]  369 	ld yl,a 
      0099ED BE 18 02         [ 2]  370 	subw x,#CELLL 
      0099EF FF               [ 2]  371 	ldw (x),y 
      0099EF 90 BF 18         [ 4]  372 	call write_byte
      001C4B                        373 3$: 
      0099F2 90 CE 40         [ 4]  374 	call lock 
      0099F5 06 90            [ 2]  375 	addw sp,#VSIZE 
      0099F7 B3               [ 4]  376     ret
                                    377 
                                    378 ;------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



                                    379 ; write integer in FLASH|EEPROM
                                    380 ; EE! ( n ud -- )
                                    381 ;------------------------------
      0099F8 16 22                  382 	.word LINK 
                           001C53   383 	LINK=.
      0099FA 05                     384 	.byte 3 
      0099FB CD 9B 9B               385 	.ascii "EE!"
      001C57                        386 ee_store:
      0099FE 20 03 47         [ 4]  387 	call fptr_store 
      009A00 CD 1B 9D         [ 4]  388 	call unlock 
      009A00 90 BF            [ 1]  389 	ldw y,x 
      009A02 16 FE            [ 2]  390 	ldw y,(y)
      009A03 90 89            [ 2]  391 	pushw y 
      009A03 CD 93            [ 1]  392 	swapw y 
      009A05 C0               [ 2]  393 	ldw (x),y 
      009A06 CD 99 9D         [ 4]  394 	call write_byte 
      009A09 CD 8B            [ 2]  395 	popw y 
      009A0B 7A CD 96         [ 2]  396 	subw x,#CELLL
      009A0E 89               [ 2]  397 	ldw (x),y 
      009A0F CC 93 DD         [ 4]  398 	call write_byte
      009A12 99 A4 02         [ 2]  399 	jp lock 
                                    400 
                                    401 
                                    402 ;----------------------------
                                    403 ; Erase flash memory row 
                                    404 ; stm8s208 as 128 bytes rows
                                    405 ; ROW-ERASE ( ud -- )
                                    406 ;----------------------------
      009A15 50 49                  407 	.word LINK 
                           001C77   408 	LINK=. 
      009A17 09                     409 	.byte 9 
      009A17 1D 00 04 90 AE 01 63   410 	.ascii "ROW-ERASE" 
             EF 02
      001C81                        411 row_erase:
      009A20 90 AE 00         [ 4]  412 	call fptr_store
                                    413 ;code must be execute from RAM 
                                    414 ;copy routine to PAD 
      009A23 71 FF 81         [ 2]  415 	subw x,#CELLL 
      009A26 9A 14 05 53      [ 2]  416 	ldw y,#row_erase_proc
      009A2A 51               [ 2]  417 	ldw (x),y 
      009A2B 52 54 32         [ 4]  418 	call PAD 
      009A2E 90 AE 1C F5      [ 2]  419 	ldw y,#row_erase_proc_end 
      009A2E 1D 00 04 90      [ 2]  420 	subw y,#row_erase_proc
      009A32 AE 4C 91         [ 2]  421 	subw x,#CELLL 
      009A35 EF               [ 2]  422 	ldw (x),y 
      009A36 02 90 AE         [ 4]  423 	call CMOVE 
      001C9E                        424 block_erase:
      009A39 36 24 FF         [ 2]  425 	ldw y,FPTR+1
      009A3C 81 9A 28 05      [ 2]  426 	cpw y,#app_space 
      009A40 53 51            [ 1]  427 	jrpl erase_flash 
                                    428 ; erase EEPROM block
      009A42 52 54 33 00      [ 2]  429 	cpw y,#EEPROM_BASE 
      009A45 24 01            [ 1]  430 	jruge 1$
      009A45 1D               [ 4]  431 	ret ; bad address 
      009A46 00 04 90 AE      [ 2]  432 1$: cpw y,#EEPROM_END 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



      009A4A 49 81            [ 2]  433 	jrule 2$ 
      009A4C EF               [ 4]  434 	ret ; bad address 
      001CB5                        435 2$:	
      009A4D 02 90 AE         [ 4]  436 	call unlock_eeprom 
      009A50 2A 70            [ 2]  437 	jra proceed_erase
                                    438 ; erase flash block:
      001CBA                        439 erase_flash:
      009A52 FF 81 9A         [ 4]  440 	call unlock_flash 
      001CBD                        441 proceed_erase:
      009A55 3F 01 45         [ 4]  442 	call PAD 
      009A58 90 93            [ 1]  443 	ldw y,x
      009A58 1D 00            [ 2]  444 	ldw y,(y)
      009A5A 04 90 AE         [ 2]  445 	addw x,#CELLL  
      009A5D 6F FB            [ 4]  446 	call (y) 
      009A5F EF 02 90 AE      [ 1]  447 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009A63 29               [ 4]  448 	ret 
                                    449 
                                    450 ; this routine is to be copied to PAD 
      001CCE                        451 row_erase_proc:
      009A64 32 FF 81 9A      [ 1]  452 	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
      009A68 56 06 53 51      [ 1]  453 	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
      009A6C 52               [ 1]  454 	clr a 
      009A6D 54 31            [ 1]  455 	clrw y 
      009A6F 30 A7 00 32      [ 1]  456 	ldf ([FPTR],y),a
      009A70 90 5C            [ 2]  457     incw y
      009A70 1D 00 04 90      [ 1]  458 	ldf ([FPTR],y),a
      009A74 AE 59            [ 2]  459     incw y
      009A76 98 EF 02 90      [ 1]  460 	ldf ([FPTR],y),a
      009A7A AE 1C            [ 2]  461     incw y
      009A7C 55 FF 81 9A      [ 1]  462 	ldf ([FPTR],y),a
      009A80 69 05 31 32 52   [ 2]  463 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009A85 54               [ 4]  464 	ret
      001CF5                        465 row_erase_proc_end:
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
      001CF5                        478 copy_buffer:
      009A86 32 80            [ 1]  479 	push #BLOCK_SIZE  
                                    480 ;enable block programming 
      009A87 72 10 50 5B      [ 1]  481 	bset FLASH_CR2,#FLASH_CR2_PRG 
      009A87 1D 00 04 90      [ 1]  482 	bres FLASH_NCR2,#FLASH_CR2_PRG
      009A8B AE 68            [ 1]  483 	clrw y
      009A8D AD               [ 1]  484 1$:	ld a,(x)
      009A8E EF 02 90 AE      [ 1]  485 	ldf ([FPTR],y),a
      009A92 62               [ 2]  486 	incw x 
      009A93 CD FF            [ 2]  487 	incw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



      009A95 81 9A            [ 1]  488 	dec (BCNT,sp)
      009A97 81 04            [ 1]  489 	jrne 1$
                                    490 ; wait EOP bit 
      009A99 4C 4F 47 32 FB   [ 2]  491 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. 
      009A9D 84               [ 1]  492 	pop a ; remove BCNT from stack 
      009A9D 1D               [ 4]  493 	ret 
      001D14                        494 copy_buffer_end:
                                    495 
                                    496 ;-------------------------
                                    497 ; move program_row to RAM 
                                    498 ; in TIB 
                                    499 ;------------------------
      001D14                        500 copy_prog_to_ram:
      009A9E 00 04 90         [ 2]  501 	subw x,#6
      009AA1 AE 07 F8 EF      [ 2]  502 	ldw y,#copy_buffer 
      009AA5 02 90            [ 2]  503 	ldw (4,x),y 
      009AA7 AE 2B 5F FF      [ 2]  504 	ldw y,#TIBBASE
      009AAB 81 9A            [ 2]  505 	ldw (2,x),y 
      009AAD 98 03 4C 4E      [ 2]  506 	ldw y,#copy_buffer_end 
      009AB1 32 A2 1C F5      [ 2]  507 	subw y,#copy_buffer  
      009AB2 FF               [ 2]  508 	ldw (x),y 
      009AB2 1D 00 04         [ 4]  509 	call CMOVE 
      009AB5 90               [ 4]  510 	ret 
                                    511 
                                    512 
                                    513 ;-----------------------------
                                    514 ; write a row in FLASH/EEPROM 
                                    515 ; WR-ROW ( a ud -- )
                                    516 ; a -> address 128 byte buffer to write 
                                    517 ; ud ->  row address in FLASH|EEPROM 
                                    518 ;-----------------------------
      009AB6 AE 01                  519 	.word LINK 
                           001D32   520 	LINK=.
      009AB8 E5                     521 	.byte 6 
      009AB9 EF 02 90 AE 2C C8      522 	.ascii "WR-ROW"
      001D39                        523 write_row:
      009ABF FF 81 9A         [ 4]  524 	call fptr_store
                                    525 ; align to FLASH block 
      009AC2 AE 03            [ 1]  526 	ld a,#0x80 
      009AC4 46 50            [ 1]  527 	and a,PTR8 
      009AC6 21 34            [ 1]  528 	ld PTR8,a  
      009AC7 CD 1D 14         [ 4]  529 	call copy_prog_to_ram
      009AC7 90 93 90         [ 4]  530 	call unlock
      009ACA FE 90            [ 1]  531 	ldw y,x 
      009ACC 9F B7            [ 2]  532 	ldw y,(y)
      009ACE 32 1C 00         [ 2]  533 	addw x,#CELLL 
      009AD1 02               [ 2]  534 	pushw x 
      009AD2 90               [ 1]  535 	ldw x,y ; buffer address in x 
      009AD3 93 90 FE         [ 4]  536 	call TIBBASE
      009AD6 90 BF 33         [ 4]  537 	call lock
      009AD9 1C               [ 2]  538 	popw x 
      009ADA 00               [ 4]  539 	ret 
                                    540 
                                    541 ;-------------------------------------
                                    542 ; change value of OPTION register 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



                                    543 ; SET-OPT (c n -- ) 
                                    544 ; c new value.
                                    545 ; n OPT  number {1..7}
                                    546 ;--------------------------------------
      009ADB 02 81                  547 		.word LINK 
                           001D5B   548 		LINK=.
      009ADD 9A                     549 		.byte 7 
      009ADE C3 06 45 45 50 52 4F   550 		.ascii "SET-OPT" 
      001D63                        551 set_option: 
      009AE5 4D 93            [ 1]  552 		ldw y,x 
      009AE6 90 FE            [ 2]  553 		ldw y,(y)
      009AE6 90 AE            [ 1]  554 		jreq 1$
      009AE8 40 00 1D 00      [ 2]  555 		cpw y,#7 
      009AEC 04 EF            [ 2]  556 		jrule 2$ 
                                    557 ; invalid OPTION number 		
      009AEE 02 90 5F         [ 2]  558 1$:		addw x,#2*CELLL
      009AF1 FF               [ 4]  559 		ret
      009AF2 81 9A            [ 2]  560 2$:		sllw y 
      009AF4 DF 08 45 45      [ 2]  561 		addw y,#OPTION_BASE-1
      009AF8 50               [ 2]  562 		ldw (x),y 
      009AF9 2D 4C 41         [ 2]  563 		subw x,#CELLL 
      009AFC 53 54            [ 1]  564 		clrw y 
      009AFE FF               [ 2]  565 		ldw (x),y 
      009AFE 1D 00 04         [ 4]  566 		call ee_cstore
      009B01 90               [ 4]  567 		ret 
                                    568 
                                    569 
                                    570 
                                    571 ;--------------------------------------
                                    572 ; reset system to its original state 
                                    573 ; before any user modification
                                    574 ; PRISTINE ( -- )
                                    575 ;-------------------------------------
      009B02 AE 40                  576 	.word LINK  
                           001D86   577 	LINK=.
      009B04 00                     578 	.byte 8 
      009B05 EF 02 90 5F FF 81 9A   579 	.ascii "PRISTINE"
             F5
      001D8F                        580 pristine:
                                    581 ;;; erase EEPROM
      009B0D 07 45 45         [ 4]  582 	call EEPROM 
      009B10 50 2D 52         [ 4]  583 1$:	call DDUP 
      009B13 55 4E 81         [ 4]  584 	call row_erase
      009B15 90 93            [ 1]  585 	ldw y,x 
      009B15 1D 00 04         [ 2]  586 	ldw y,(2,y)
      009B18 90 AE 40 02      [ 2]  587 	addw y,#BLOCK_SIZE
      009B1C EF 02            [ 2]  588 	ldw (2,x),y
      009B1E 90 5F FF 81      [ 2]  589 	cpw y,#OPTION_BASE 
      009B22 9B 0D            [ 1]  590 	jrult 1$
                                    591 ;;; reset OPTION to default values
      009B24 06 45 45 50      [ 2]  592 	ldw y,#1 ; OPT1 
      009B28 2D               [ 2]  593 2$:	ldw (x),y   
      009B29 43 50            [ 1]  594 	clrw y 
      009B2B EF 02            [ 2]  595 	ldw (2,x),y  ; ( 0 1 -- ) 
      009B2B 1D 00 04         [ 4]  596 	call DDUP    ; ( 0 1 0 1 -- )  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



      009B2E 90 AE 40         [ 4]  597 	call set_option
      009B31 04 EF            [ 1]  598 	ldw y,x 
      009B33 02 90            [ 2]  599 	ldw y,(y)
      009B35 5F FF            [ 2]  600 	incw y  ; next OPTION 
      009B37 81 9B 24 06      [ 2]  601 	cpw y,#8 
      009B3B 45 45            [ 1]  602 	jrult 2$
                                    603 ;;; erase first row of app_space 	
      009B3D 50 2D 56 50      [ 2]  604 	ldw y,#app_space
      009B41 EF 02            [ 2]  605 	ldw (2,x),y  
      009B41 1D 00            [ 1]  606 	clrw y 
      009B43 04               [ 2]  607 	ldw (x),y ; ( app_space 0 -- )
      009B44 90 AE 40         [ 4]  608 	call row_erase 
                                    609 ; reset interrupt vectors 
      009B47 06 EF 02         [ 2]  610 	subw x,#CELLL 
      009B4A 90 5F            [ 1]  611 	clrw y  
      009B4C FF               [ 2]  612 4$:	ldw (x),y  ; ( n -- ) int# 
      009B4D 81 9B 3A         [ 4]  613 	call DUPP  
      009B50 0A 55 50         [ 4]  614 	call reset_vector
      009B53 44 41            [ 1]  615 	ldw y,x 
      009B55 54 2D            [ 2]  616 	ldw y,(y)
      009B57 4C 41            [ 2]  617 	incw y   ; next vector 
      009B59 53 54 00 19      [ 2]  618 	cpw y,#25 
      009B5B 25 ED            [ 1]  619 	jrult 4$
      009B5B CD 86 60         [ 2]  620 	jp NonHandledInterrupt ; reset MCU
                                    621 
                                    622 ;------------------------------
                                    623 ; reset an interrupt vector 
                                    624 ; to its initial value 
                                    625 ; i.e. NonHandledInterrupt
                                    626 ; RST-IVEC ( n -- )
                                    627 ;-----------------------------
      009B5E CD 84                  628 	.word LINK 
                           001DED   629 	LINK=. 
      009B60 4D                     630 	.byte 8 
      009B61 CD 9A FE CC 9C D7 9B   631 	.ascii "RST-IVEC"
             50
      001DF6                        632 reset_vector:
      009B69 09 55            [ 1]  633 	ldw y,x
      009B6B 50 44 41         [ 2]  634 	addw x,#CELLL 
      009B6E 54 2D            [ 2]  635 	ldw y,(y)
      009B70 52 55 4E 17      [ 2]  636 	cpw y,#23 
      009B73 27 3A            [ 1]  637 	jreq 9$
      009B73 CD 9B 15 CC      [ 2]  638 	cpw y,#29 ; last vector
      009B77 9C D7            [ 1]  639 	jrugt 9$  
      009B79 9B 69            [ 2]  640 	sllw y 
      009B7B 08 55            [ 2]  641 	sllw y 
      009B7D 50 44 41 54      [ 2]  642 	addw y,#0x8008 ; irq0 address 
      009B81 2D 43 50         [ 2]  643 	ldw YTEMP,y
      009B84 1D 00 06         [ 2]  644 	subw x,#3*CELLL 
      009B84 CD 86            [ 2]  645 	ldw (2,x),y 
      009B86 50 CD            [ 1]  646 	clrw y
      009B88 84               [ 2]  647 	ldw (x),y 
      009B89 4D CD            [ 1]  648 	ld a,#0x82 
      009B8B 9B 2B            [ 1]  649 	ld yh,a
      009B8D CC 9C            [ 2]  650 	ldw (4,x),y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



      009B8F D7 9B 7B         [ 4]  651 	call ee_store
      009B92 08 55 50         [ 2]  652 	subw x,#3*CELLL
      009B95 44 41            [ 1]  653 	clrw y 
      009B97 54               [ 2]  654 	ldw (x),y 
      009B98 2D 56 50 00      [ 2]  655 	ldw y,#NonHandledInterrupt
      009B9B EF 04            [ 2]  656 	ldw (4,x),y 
      009B9B CD 86 42         [ 2]  657 	ldw y,YTEMP  
      009B9E CD 84 4D CD      [ 2]  658 	addw y,#2
      009BA2 9B 41            [ 2]  659 	ldw (2,x),y 
      009BA4 CC 9C D7         [ 4]  660 	call ee_store
      009BA7 9B               [ 4]  661 9$:	ret 
                                    662 
                                    663 
                                    664 ;------------------------------
                                    665 ; all interrupt vector with 
                                    666 ; an address >= a are resetted 
                                    667 ; to default
                                    668 ; CHKIVEC ( a -- )
                                    669 ;------------------------------
      009BA8 92 02                  670 	.word LINK 
                           001E40   671 	LINK=.
      009BAA 46                     672 	.byte 7
      009BAB 40 48 4B 49 56 45 43   673 	.ascii "CHKIVEC"
                                    674 ;local variables 
                           000001   675 	SSP=1
                           000003   676 	CADR=3
                           000005   677 	OFS=5
                           000006   678 	VSIZE=6  
      009BAC                        679 CHKIVEC:
      009BAC CD 9A            [ 2]  680 	sub sp,#VSIZE ;alloc local variables 
      009BAE C7 92            [ 1]  681 	ldw y,x 
      009BB0 BC 00            [ 2]  682 	ldw y,(y)
      009BB2 32 1D            [ 2]  683 	ldw (CADR,sp),y ; ca 
      009BB4 00 02            [ 2]  684 	ldw (SSP,sp),x 
      009BB6 F7 90 AE         [ 2]  685 	ldw x,#0x800a ; irq0 address 
      009BB9 00 01            [ 2]  686 	ldw PTR16,X
      009BBB 91 AF 00         [ 2]  687 	ldw x,#-4 
      009BBE 32 E7 01         [ 2]  688 1$:	addw x,#4
      009BC1 81 9B A9         [ 2]  689 	cpw x,#30*4 ; irq0-29 
      009BC4 03 46            [ 1]  690 	jreq 9$
      009BC6 43 40            [ 1]  691 	ldw y,x  
      009BC8 91 D6 33         [ 4]  692 	ld a,([PTR16],y)
      009BC8 CD 9A            [ 1]  693 	cp a,(CADR,sp)
      009BCA C7 92            [ 1]  694 	jrult 1$
      009BCC BC 00            [ 2]  695 	incw y 
      009BCE 32 1D 00         [ 4]  696 	ld a,([PTR16],y)
      009BD1 02 E7            [ 1]  697 	cp a,(CADR+1,sp) 
      009BD3 01 7F            [ 1]  698 	jrult 1$ 
      009BD5 81 9B            [ 2]  699 	ldw (OFS,sp),x 
      009BD7 C4               [ 2]  700 	srlw x
      009BD8 06               [ 2]  701 	srlw x 
      009BD9 55 4E            [ 1]  702 	ldw y,x 
      009BDB 4C 4B            [ 2]  703 	ldw x,(SSP,sp)
      009BDD 45               [ 2]  704 	ldw (x),y
      009BDE 45 1D F6         [ 4]  705 	call reset_vector
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



      009BDF 1E 05            [ 2]  706 	ldw x,(OFS,sp) 
      009BDF 35 00            [ 2]  707 	jra 1$
      009BE1 50 5B            [ 2]  708 9$:	ldw x,(SSP,sp) 
      009BE3 35 FF 50         [ 2]  709 	addw x,#CELLL 
      009BE6 5C 35            [ 2]  710 	addw sp,#VSIZE ; drop local variables  
      009BE8 AE               [ 4]  711 	ret 
                                    712 
                                    713 ;------------------------------
                                    714 ; set interrupt vector 
                                    715 ; SET-IVEC ( ud n -- )
                                    716 ;  ud Handler address
                                    717 ;  n  vector # 0 .. 29 
                                    718 ;-----------------------------
      009BE9 50 64                  719 	.word LINK
                           001E8E   720 	LINK=.
      009BEB 35                     721 	.byte 8 
      009BEC 56 50 64 72 07 50 5F   722 	.ascii "SET-IVEC" 
             FB
      001E97                        723 set_vector:
      009BF4 81 9B            [ 1]  724     ldw y,x 
      009BF6 D8 06 55         [ 2]  725 	addw x,#CELLL 
      009BF9 4E 4C            [ 2]  726 	ldw y,(y) ; vector #
      009BFB 4B 46 4C 1D      [ 2]  727 	cpw y,#29 ; last vector
      009BFE 23 04            [ 2]  728 	jrule 2$
      009BFE 35 00 50         [ 2]  729 	addw x,#2*CELLL 
      009C01 5B               [ 4]  730 	ret
      009C02 35 FF            [ 2]  731 2$:	sllw y 
      009C04 50 5C            [ 2]  732 	sllw y 
      009C06 35 56 50 62      [ 2]  733 	addw y,#0X8008 ; IRQ0 vector address 
      009C0A 35 AE 50         [ 2]  734 	ldw YTEMP,y ; vector address 
      009C0D 62 72            [ 1]  735 	ld a,#0x82 
      009C0F 03 50            [ 1]  736 	ld yh,a 
      009C11 5F FB            [ 1]  737 	ld a,(1,x) ; isr address bits 23..16 
      009C13 81 9B            [ 1]  738 	ld yl,a 
                                    739 ;  write 0x82 + most significant byte of int address	
      009C15 F7 06 55         [ 2]  740 	subw x,#3*CELLL 
      009C18 4E 4C            [ 2]  741 	ldw (4,x),y 
      009C1A 4F 43 4B         [ 2]  742 	ldw y,YTEMP
      009C1D EF 02            [ 2]  743 	ldw (2,x),y ; vector address 
      009C1D 90 BE            [ 1]  744 	clrw y 
      009C1F 33               [ 2]  745 	ldw (x),y   ; as a double 
      009C20 3D 32 26         [ 4]  746 	call ee_store 
      009C23 16 90            [ 1]  747 	ldw y,x 
      009C25 A3 80 00         [ 2]  748 	ldw y,(2,y) ; bits 15..0 int vector 
      009C28 24 10 90         [ 2]  749 	subw x,#3*CELLL 
      009C2B A3 40            [ 2]  750 	ldw (4,x),y 
      009C2D 00 25 0D         [ 2]  751 	ldw y,YTEMP 
      009C30 90 A3 48 7F      [ 2]  752 	addw y,#2 
      009C34 22 07            [ 2]  753 	ldw (2,x),y 
      009C36 CD 9B            [ 1]  754 	clrw y 
      009C38 DF               [ 2]  755 	ldw (x),y 
      009C39 81 CD 9B         [ 4]  756 	call ee_store
      009C3C FE 81 9C         [ 2]  757 	addw x,#2*CELLL  
      009C3F 16               [ 4]  758 9$: ret 
                                    759 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



                                    760 
                                    761 ;------------------------
                                    762 ; Compile word to flash
                                    763 ; EE, (w -- )
                                    764 ;-----------------------
      009C40 04 4C                  765 	.word LINK
                           001EEA   766 	LINK=.
      009C42 4F                     767 	.byte 3
      009C43 43 4B 2C               768 	.ascii "EE,"
      009C45                        769 ee_comma:
      009C45 72 13 50         [ 2]  770 	subw x,#2*CELLL 
      009C48 5F 72 17         [ 2]  771 	ldw y,UCP
      009C4B 50 5F            [ 2]  772 	pushw y 
      009C4D 81 9C            [ 2]  773 	ldw (2,x),y 
      009C4F 40 08            [ 1]  774 	clrw y 
      009C51 49               [ 2]  775 	ldw (x),y
      009C52 4E 43 2D         [ 4]  776 	call ee_store
      009C55 46 50            [ 2]  777 	popw y 
      009C57 54 52 00 02      [ 2]  778 	addw y,#2
      009C59 90 BF 18         [ 2]  779 	ldw UCP,y
      009C59 3C               [ 4]  780 	ret 
                                    781 
                                    782 
                                    783 ;-------------------------
                                    784 ; Compile byte to flash 
                                    785 ; EEC, ( c -- )	
                                    786 ;-------------------------
      009C5A 34 26                  787 	.word LINK 
                           001F0A   788 	LINK=.
      009C5C 08                     789 	.byte 4 
      009C5D 90 BE 32 90            790 	.ascii "EEC,"
      001F0F                        791 ee_ccomma:
      009C61 5C 90 BF         [ 2]  792 	subw x,#2*CELLL 
      009C64 32 81 9C         [ 2]  793 	ldw y,UCP
      009C67 50 07            [ 2]  794 	pushw y 
      009C69 57 52            [ 2]  795 	ldw (2,x),y 
      009C6B 2D 42            [ 1]  796 	clrw y 
      009C6D 59               [ 2]  797 	ldw (x),y
      009C6E 54 45 0B         [ 4]  798 	call ee_cstore
      009C70 90 85            [ 2]  799 	popw y 
      009C70 90 93            [ 2]  800 	incw y 
      009C72 90 FE 1C         [ 2]  801 	ldw UCP,y
      009C75 00               [ 4]  802 	ret 
                                    803 
                                    804 
                                    805 ;--------------------------
                                    806 ; copy FLASH block to ROWBUF
                                    807 ; ROW2BUF ( ud -- )
                                    808 ;--------------------------
      009C76 02 90                  809 	.word LINK 
                           001F29   810 	LINK=.
      009C78 9F                     811 	.byte 7 
      009C79 92 BD 00 32 72 05 50   812 	.ascii "ROW2BUF"
      001F31                        813 ROW2BUF: 
      009C80 5F FB 20         [ 4]  814 	call fptr_store 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



      009C83 D5 9C            [ 1]  815 	ld a,#BLOCK_SIZE
      009C85 68               [ 1]  816 	push a 
      009C86 04 45            [ 1]  817 	and a,PTR8 ; block align 
      009C88 45 43            [ 1]  818 	ld PTR8,a
      009C8A 21 AE 16 80      [ 2]  819 	ldw y,#ROWBUFF 
      009C8B 92 BC 00 32      [ 5]  820 1$: ldf a,[FPTR]
      009C8B 52 02            [ 1]  821 	ld (y),a
      009C8D CD 9A C7         [ 4]  822 	call inc_fptr
      009C90 E6 01            [ 2]  823 	incw y 
      009C92 43 6B            [ 1]  824 	dec (1,sp)
      009C94 01 0F            [ 1]  825 	jrne 1$ 
      009C96 02               [ 1]  826 	pop a 
      009C97 CD               [ 4]  827 	ret 
                                    828 
                                    829 
                                    830 ;---------------------------
                                    831 ; copy ROWBUFF to flash 
                                    832 ; BUF2ROW ( ud -- )
                                    833 ; ud is row address as double 
                                    834 ;---------------------------
      009C98 9C 1D                  835 	.word LINK 
                           001F52   836 	LINK=.
      009C9A 3D                     837 	.byte 7 
      009C9B 32 26 19 90 BE 33 90   838 	.ascii "BUF2ROW" 
      001F5A                        839 BUF2ROW:
      009CA2 A3 48 00         [ 4]  840 	call TBUF ; ( ud rb -- )
      009CA5 2B 10 90         [ 4]  841 	call ROT 
      009CA8 A3 48 80         [ 4]  842 	call ROT  ; ( rb ud -- )
      009CAB 2A 0A 03         [ 4]  843 	call write_row 
      009CAE 02               [ 4]  844 	ret 
                                    845 
                                    846 ;---------------------------------
                                    847 ; how many byte free in that row 
                                    848 ; RFREE ( a -- n )
                                    849 ; a is least byte of target address
                                    850 ;----------------------------------
      009CAF 72 1E                  851 	.word LINK 
                           001F69   852 	LINK=.
      009CB1 50                     853 	.byte 5 
      009CB2 5B 72 1F 50 5C         854 	.ascii "RFREE"
      009CB7                        855 RFREE:
      009CB7 CD 9C            [ 1]  856 	ld a,(1,x)
      009CB9 70 0D            [ 1]  857 	and a,#BLOCK_SIZE-1 
      009CBB 02 27            [ 1]  858 	ld YTEMP,a 
      009CBD 0D 7B            [ 1]  859 	ld a,#BLOCK_SIZE 
      009CBF 01 90            [ 1]  860 	sub a,YTEMP 
      009CC1 5F 90            [ 1]  861 	clrw y 
      009CC3 97 1D            [ 1]  862 	ld yl,a
      009CC5 00               [ 2]  863 	ldw (x),y 
      009CC6 02               [ 4]  864 	ret 
                                    865 
                                    866 ;---------------------------------
                                    867 ; write u bytes to flash/EEPROM 
                                    868 ; constraint to row limit 
                                    869 ; RAM2EE ( ud a u -- u2 )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



                                    870 ; ud flash address 
                                    871 ; a ram address 
                                    872 ; u bytes count
                                    873 ; return u2 bytes written  
                                    874 ;-------------------------------
      009CC7 FF CD                  875 	.word LINK 
                           001F81   876 	LINK=. 
      009CC9 9C                     877 	.byte 6
      009CCA 70 41 4D 32 45 45      878 	.ascii "RAM2EE"
                                    879 	
      009CCB                        880 RAM2EE:
                                    881 ; copy ud on top 
      009CCB CD 9C            [ 1]  882 	ldw y,x 
      009CCD 45 5B 02         [ 2]  883 	ldw y,(6,y) ; LSW of ud  
      009CD0 81 9C 86         [ 2]  884 	ldw YTEMP,y 
      009CD3 03 45            [ 1]  885 	ldw y,x 
      009CD5 45 21 04         [ 2]  886 	ldw y,(4,y)  ; MSW of ud 
      009CD7 1D 00 04         [ 2]  887 	subw x,#2*CELLL 
      009CD7 CD               [ 2]  888 	ldw (x),y 
      009CD8 9A C7 CD         [ 2]  889 	ldw y,YTEMP 
      009CDB 9C 1D            [ 2]  890 	ldw (2,x),y 
      009CDD 90 93 90         [ 4]  891 	call ROW2BUF 
      009CE0 FE 90            [ 1]  892 	ldw y,x 
      009CE2 89 90 5E         [ 2]  893 	ldw y,(6,y)
      009CE5 FF CD            [ 2]  894 	pushw y ; udl 
      009CE7 9C 70            [ 1]  895 	ld a,yl
      009CE9 90 85            [ 1]  896 	and a,#BLOCK_SIZE-1 
      009CEB 1D 00            [ 1]  897 	clrw y 
      009CED 02 FF            [ 1]  898 	ld yl,a 
      009CEF CD 9C 70 CC      [ 2]  899 	addw y,#ROWBUFF 
      009CF3 9C 45 9C         [ 2]  900 	subw x,#CELLL 
      009CF6 D3               [ 2]  901 	ldw (x),y  
      009CF7 09 52 4F         [ 4]  902 	call SWAPP ;  ( ud a ra u -- )
      009CFA 57 2D 45         [ 4]  903 	call RFROM  
      009CFD 52 41 53         [ 4]  904 	call RFREE 
      009D00 45 07 8A         [ 4]  905 	call MIN
      009D01 CD 04 74         [ 4]  906 	call DUPP 
      009D01 CD 9A C7         [ 4]  907 	call TOR  
      009D04 1D 00 02         [ 4]  908 	call CMOVE
      009D07 90 AE 9D         [ 4]  909 	call BUF2ROW 
      009D0A 4E FF CD         [ 4]  910 	call RFROM 
      009D0D 8B               [ 4]  911 	ret 
                                    912 
                                    913 ;--------------------------
                                    914 ; expand 16 bit address 
                                    915 ; to 32 bit address 
                                    916 ; FADDR ( a -- ud )
                                    917 ;--------------------------
      009D0E 55 90                  918 	.word LINK 
                           001FD6   919 	LINK=. 
      009D10 AE                     920 	.byte 5 
      009D11 9D 75 72 A2 9D         921 	.ascii "FADDR"
      001FDC                        922 FADDR:
      009D16 4E 1D 00         [ 2]  923 	jp ZERO 
                                    924 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



                                    925 ;--------------------------
                                    926 ; move new colon definition to FLASH 
                                    927 ; using WR-ROW for efficiency 
                                    928 ; preserving bytes already used 
                                    929 ; in the current block. 
                                    930 ; ud+c must not exceed block boundary 
                                    931 ; at this point the compiler as completed
                                    932 ; in RAM and pointers CP and CNTXT updated.
                                    933 ; CNTXT point to nfa of new word and  
                                    934 ; CP is after compiled word so CP-CNTXT+2=count to write 
                                    935 ; 
                                    936 ; FMOVE ( -- cp+ )
                                    937 ; 
                                    938 ;--------------------------
      009D19 02 FF                  939 	.word LINK 
                           001FE1   940 	LINK=.
      009D1B CD                     941 	.byte 5 
      009D1C 8B 91 4F 56 45         942 	.ascii "FMOVE" 
      009D1E                        943 FMOVE:
      009D1E 90 BE 33         [ 4]  944 	call TFLASH 
      009D21 90 A3 A1         [ 4]  945 	CALL AT 
      009D24 80 2A 13         [ 4]  946 	CALL QBRAN 
      009D27 90 A3                  947 	.word no_move  
      009D29 40 00 24         [ 4]  948 	call CPP
      009D2C 01 81 90         [ 4]  949 	call AT  
      009D2F A3 47 FF         [ 4]  950 	call DUPP ; ( udl udl -- )
      009D32 23 01 81         [ 4]  951 	call CNTXT 
      009D35 CD 03 CD         [ 4]  952 	call AT 
      009D35 CD 9B DF         [ 4]  953 	call DOLIT 
      009D38 20 03                  954 	.word 2 
      009D3A CD 06 E8         [ 4]  955 	call SUBB ; ( udl udl a -- )
      009D3A CD 9B FE         [ 4]  956 	call SWAPP 
      009D3D CD 1F DC         [ 4]  957 	call FADDR 
      009D3D CD 8B 55         [ 4]  958 	call ROT  ; ( udl ud a -- )
      009D40 90 93 90         [ 4]  959 	call DUPP 
      009D43 FE 1C 00         [ 4]  960 	call TOR    ; R: a 
      002018                        961 FMOVE2: 
      009D46 02 90 FD         [ 4]  962 	call HERE 
      009D49 72 17 50         [ 4]  963 	call RAT 
      009D4C 5F 81 E8         [ 4]  964 	call SUBB ; (udl ud a wl -- )
      009D4E                        965 next_row:
      009D4E 35 20 50         [ 4]  966 	call DUPP 
      009D51 5B 35 DF         [ 4]  967 	call TOR  ; ( udl ud a wl -- ) R: a wl
      009D54 50 5C 4F         [ 4]  968 	call RAM2EE ; ( udl a u -- udl u2 ) u2 is byte written to FLASH 
      009D57 90 5F 91         [ 4]  969 	call DUPP 
      009D5A A7 00 32         [ 4]  970 	call TOR
      009D5D 90 5C 91         [ 4]  971 	call PLUS  ; ( udl+ ) 
      009D60 A7 00 32         [ 4]  972 	call DUPP 
      009D63 90 5C 91         [ 4]  973 	call ZERO   ; ( udl+ ud -- )
      009D66 A7 00 32         [ 4]  974 	call RFROM  ; ( udl+ ud u2  R: a wl ) 
      009D69 90 5C 91         [ 4]  975 	call RFROM  ; ( udl+ ud u2 wl R: a ) 
      009D6C A7 00 32         [ 4]  976 	call OVER   ; ( udl+ ud u2 wl u2 -- )
      009D6F 72 05 50         [ 4]  977 	call SUBB  ; ( udl+ ud u2 wl- R: a )
      009D72 5F FB 81         [ 4]  978 	call DUPP 
      009D75 CD 03 78         [ 4]  979 	call QBRAN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



      009D75 20 64                  980 	.word fmove_done 
      009D75 4B 80 72         [ 4]  981 	call SWAPP  ; ( udl+ ud wl- u2 R: a )
      009D78 10 50 5B         [ 4]  982 	call RFROM ; ( udl+ ud wl- u2 a -- ) 
      009D7B 72 11 50         [ 4]  983 	call PLUS  ; ( udl+2 ud wl- a+ )
      009D7E 5C 90 5F         [ 4]  984 	call DUPP 
      009D81 F6 91 A7         [ 4]  985 	call TOR   ; ( udl+2 ud wl- a+ ) R: a+
      009D84 00 32 5C         [ 4]  986 	call SWAPP 
      009D87 90 5C 0A         [ 4]  987 	call BRAN
      009D8A 01 26                  988 	.word next_row  
      002064                        989 fmove_done:	
      009D8C F4 72 05         [ 4]  990 	call RFROM  ; ( -- udl+ ud u2 wl- a  )
      009D8F 50 5F FB         [ 2]  991 	addw x,#5*CELLL ; (  -- cp+ ) new CP 
      009D92 84               [ 4]  992  	ret  
      00206B                        993 no_move:
      009D93 81 09 D5         [ 4]  994 	call ZERO
      009D94 81               [ 4]  995 	ret 
                                    996 
                                    997 ;------------------------------------------
                                    998 ; adjust pointers after **FMOVE** operetion.
                                    999 ; UPDAT-PTR ( cp+ -- )
                                   1000 ; cp+ is new CP position after FMOVE 
                                   1001 ;-------------------------------------------
      009D94 1F E1                 1002 	.word LINK 
                           002071  1003 	LINK=.
      009D94 1D                    1004 	.byte 9
      009D95 00 06 90 AE 9D 75 EF  1005 	.ascii "UPDAT-PTR" 
             04 90
      00207B                       1006 UPDATPTR:
                                   1007 ;reset VP to previous position  
      009D9E AE 17 00         [ 4] 1008 	call EEPVP 
      009DA1 EF 02 90         [ 4] 1009 	call DROP 
      009DA4 AE 9D 94         [ 4] 1010 	call AT
      009DA7 72 A2 9D         [ 4] 1011 	call VPP 
      009DAA 75 FF CD         [ 4] 1012 	call STORE
                                   1013 ;update CONTEXT and LAST 
      009DAD 8B 91 81         [ 4] 1014 	call EEPCP 
      009DB0 9C F7 06         [ 4] 1015 	call DROP
      009DB3 57 52 2D         [ 4] 1016 	call AT
      009DB6 52 4F 57         [ 4] 1017 	call DOLIT 
      009DB9 00 02                 1018 	.word 2 
      009DB9 CD 9A C7         [ 4] 1019 	call PLUS 
      009DBC A6 80 B4         [ 4] 1020 	call DUPP 
      009DBF 34 B7 34         [ 4] 1021 	call CNTXT 
      009DC2 CD 9D 94         [ 4] 1022 	call STORE
      009DC5 CD 9C 1D         [ 4] 1023 	call LAST
      009DC8 90 93 90         [ 4] 1024 	call STORE 
      009DCB FE 1C 00         [ 4] 1025 	call UPDATLAST 
                                   1026 ;update CP 
      009DCE 02 89 93         [ 4] 1027 	call CPP 
      009DD1 CD 17 00         [ 4] 1028 	call STORE
      009DD4 CD 9C 45         [ 4] 1029 	call UPDATCP 
      009DD7 85               [ 4] 1030 	ret 
                                   1031 
                                   1032 ;-----------------------------
                                   1033 ; move interrupt sub-routine
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



                                   1034 ; in flash memory
                                   1035 ;----------------------------- 
      009DD8 81 9D                 1036 	.word LINK 
                           0020B9  1037 	LINK=. 
      009DDA B2                    1038 	.byte 6
      009DDB 07 53 45 54 2D 4F     1039 	.ascii "IFMOVE" 
      0020C0                       1040 IFMOVE:
      009DE1 50 54 81         [ 4] 1041 	call TFLASH 
      009DE3 CD 03 CD         [ 4] 1042 	CALL AT 
      009DE3 90 93 90         [ 4] 1043 	CALL QBRAN 
      009DE6 FE 27                 1044 	.word no_move 
      009DE8 06 90 A3         [ 4] 1045 	call CPP 
      009DEB 00 07 23         [ 4] 1046 	call AT 
      009DEE 04 1C 00         [ 4] 1047 	call DUPP ; ( udl udl -- )
      009DF1 04 81 90         [ 4] 1048 	call EEPVP 
      009DF4 58 72 A9         [ 4] 1049 	call DROP
      009DF7 47 FF FF         [ 4] 1050 	call AT  ; ( udl udl a )
      009DFA 1D 00 02         [ 4] 1051 	call TOR 
      009DFD 90 5F FF         [ 4] 1052 	call FADDR
      009E00 CD 9C 8B         [ 4] 1053 	call RAT ; ( udl ud a -- ) R: a 
      009E03 81 9D DB         [ 2] 1054 	jp FMOVE2 
                                   1055 
                                   1056 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



                                   4672 .endif ; PICATOUT_MOD
                                   4673 
                                   4674 ;===============================================================
                                   4675 
                           0020B9  4676 LASTN =	LINK   ;last name defined
                                   4677 
                                   4678 ; application code begin here
      002100                       4679 	.bndry 128 ; align on flash block  
      002100                       4680 app_space: 
                                   4681 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   6 AB1        00070B R   |   6 ABOR1      001260 R
  6 ABOR2      001277 R   |   6 ABORQ      001258 R   |   6 ABORT      001249 R
  6 ABRTQ      001534 R   |   6 ABSS       000702 R   |   6 ACCEP      0011DF R
  6 ACCP1      0011E8 R   |   6 ACCP2      00120E R   |   6 ACCP3      001211 R
  6 ACCP4      001213 R   |     ADC_CR1 =  005401     |     ADC_CR1_=  000000 
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
  6 AFT        00151F R   |   6 AGAIN      001475 R   |   6 AHEAD      0014D2 R
  6 ALLOT      001388 R   |   6 ANDD       0004C0 R   |     APP_CP  =  004004 
    APP_LAST=  004000     |     APP_RUN =  004002     |     APP_VP  =  004006 
  6 AT         0003CD R   |   6 ATEXE      000AFA R   |   6 AUTORUN    000123 R
    AWU_APR =  0050F1     |     AWU_CSR =  0050F0     |     AWU_TBR =  0050F2 
    B0_MASK =  000001     |     B115200 =  000006     |     B19200  =  000003 
    B1_MASK =  000002     |     B230400 =  000007     |     B2400   =  000000 
    B2_MASK =  000004     |     B38400  =  000004     |     B3_MASK =  000008 
    B460800 =  000008     |     B4800   =  000001     |     B4_MASK =  000010 
    B57600  =  000005     |     B5_MASK =  000020     |     B6_MASK =  000040 
    B7_MASK =  000080     |     B921600 =  000009     |     B9600   =  000002 
  6 BACK1      001187 R   |   6 BASE       000531 R   |     BASEE   =  00000A 
    BCNT    =  000001     |   6 BCOMP      0013CA R   |   6 BDIGS      000BE2 R
    BEEP_BIT=  000004     |     BEEP_CSR=  0050F3     |     BEEP_MAS=  000010 
    BEEP_POR=  00000F     |   6 BEGIN      001457 R   |     BIT0    =  000000 
    BIT1    =  000001     |     BIT2    =  000002     |     BIT3    =  000003 
    BIT4    =  000004     |     BIT5    =  000005     |     BIT6    =  000006 
    BIT7    =  000007     |   6 BKSLA      00101F R   |   6 BKSP       001157 R
    BKSPP   =  000008     |   6 BLANK      0009C8 R   |     BLOCK_SI=  000080 
    BOOT_ROM=  006000     |     BOOT_ROM=  007FFF     |   6 BRAN       00038F R
    BTW     =  000001     |   6 BUF2ROW    001F5A R   |   6 BYE        0000B0 R
    CADR    =  000003     |     CALLL   =  0000CD     |     CAN_DGR =  005426 
    CAN_FPSR=  005427     |     CAN_IER =  005425     |     CAN_MCR =  005420 
    CAN_MSR =  005421     |     CAN_P0  =  005428     |     CAN_P1  =  005429 
    CAN_P2  =  00542A     |     CAN_P3  =  00542B     |     CAN_P4  =  00542C 
    CAN_P5  =  00542D     |     CAN_P6  =  00542E     |     CAN_P7  =  00542F 
    CAN_P8  =  005430     |     CAN_P9  =  005431     |     CAN_PA  =  005432 
    CAN_PB  =  005433     |     CAN_PC  =  005434     |     CAN_PD  =  005435 
    CAN_PE  =  005436     |     CAN_PF  =  005437     |     CAN_RFR =  005424 
    CAN_TPR =  005423     |     CAN_TSR =  005422     |     CARRY   =  000028 
  6 CAT        0003EB R   |   6 CCOMMA     0013AC R   |     CC_C    =  000000 
    CC_H    =  000004     |     CC_I0   =  000003     |     CC_I1   =  000005 
    CC_N    =  000002     |     CC_V    =  000007     |     CC_Z    =  000001 
    CELLL   =  000002     |   6 CELLM      00094D R   |   6 CELLP      00093E R
  6 CELLS      00095C R   |     CFG_GCR =  007F60     |     CFG_GCR_=  000001 
    CFG_GCR_=  000000     |   6 CHAR1      000E0F R   |   6 CHAR2      000E12 R
  6 CHKIVEC    001E48 R   |     CLKOPT  =  004807     |     CLKOPT_C=  000002 
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
    CLK_SWR_=  0000D2     |   6 CMOV1      000B19 R   |   6 CMOV2      000B31 R
  6 CMOVE      000B11 R   |     CNTDWN  =  000030     |   6 CNTXT      0005B4 R
  6 COLD       001929 R   |   6 COLD1      001929 R   |   6 COLON      0016CA R
  6 COMMA      001395 R   |   6 COMPI      0013DA R   |     COMPO   =  000040 
  6 CONSTANT   001774 R   |     CONVERT_=  000001     |   6 COUNT      000AAD R
  6 CPP        0005D0 R   |     CPU_A   =  007F00     |     CPU_CCR =  007F0A 
    CPU_PCE =  007F01     |     CPU_PCH =  007F02     |     CPU_PCL =  007F03 
    CPU_SPH =  007F08     |     CPU_SPL =  007F09     |     CPU_XH  =  007F04 
    CPU_XL  =  007F05     |     CPU_YH  =  007F06     |     CPU_YL  =  007F07 
  6 CR         000E3D R   |   6 CREAT      001710 R   |     CRR     =  00000D 
  6 CSTOR      0003DA R   |   6 DAT        000A8D R   |     DATSTK  =  001680 
  6 DDROP      00064F R   |   6 DDUP       00065A R   |     DEBUG_BA=  007F00 
    DEBUG_EN=  007FFF     |   6 DECIM      000C92 R   |   6 DEPTH      000A18 R
    DEVID_BA=  0048CD     |     DEVID_EN=  0048D8     |     DEVID_LO=  0048D2 
    DEVID_LO=  0048D3     |     DEVID_LO=  0048D4     |     DEVID_LO=  0048D5 
    DEVID_LO=  0048D6     |     DEVID_LO=  0048D7     |     DEVID_LO=  0048D8 
    DEVID_WA=  0048D1     |     DEVID_XH=  0048CE     |     DEVID_XL=  0048CD 
    DEVID_YH=  0048D0     |     DEVID_YL=  0048CF     |   6 DGTQ1      000CD7 R
  6 DI         0000BE R   |   6 DIG        000C0B R   |   6 DIGIT      000BA6 R
  6 DIGS       000C1C R   |   6 DIGS1      000C1C R   |   6 DIGS2      000C29 R
  6 DIGTQ      000CA6 R   |     DM_BK1RE=  007F90     |     DM_BK1RH=  007F91 
    DM_BK1RL=  007F92     |     DM_BK2RE=  007F93     |     DM_BK2RH=  007F94 
    DM_BK2RL=  007F95     |     DM_CR1  =  007F96     |     DM_CR2  =  007F97 
    DM_CSR1 =  007F98     |     DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A 
  6 DN1        0006C9 R   |   6 DNEGA      0006AC R   |   6 DOCONST    00179E R
  6 DOLIT      000345 R   |   6 DONXT      000359 R   |   6 DOSTR      000E53 R
  6 DOT        000ED8 R   |   6 DOT1       000EEE R   |   6 DOTI1      0018C0 R
  6 DOTID      0018AA R   |   6 DOTO1      0012EC R   |   6 DOTOK      0012D2 R
  6 DOTPR      001001 R   |   6 DOTQ       00154E R   |   6 DOTQP      000E7C R
  6 DOTR       000E8A R   |   6 DOTS       00184C R   |   6 DOTS1      001857 R
  6 DOTS2      001860 R   |   6 DOVAR      000521 R   |   6 DROP       00046A R
  6 DSTOR      000A67 R   |   6 DUMP       001802 R   |   6 DUMP1      001819 R
  6 DUMP3      00183B R   |   6 DUMPP      0017D1 R   |   6 DUPP       000474 R
  6 EDIGS      000C47 R   |   6 EEPCP      001AAB R   |   6 EEPLAST    001A7E R
  6 EEPROM     001A66 R   |     EEPROM_B=  004000     |     EEPROM_E=  0047FF 
    EEPROM_S=  000800     |   6 EEPRUN     001A95 R   |   6 EEPVP      001AC1 R
  6 EI         0000B7 R   |   6 ELSEE      0014AD R   |   6 EMIT       00032F R
  6 ENEPER     0019D8 R   |   6 EQ1        000726 R   |   6 EQUAL      000710 R
  6 ERASE      000B73 R   |     ERR     =  00001B     |   6 EVAL       001315 R
  6 EVAL1      001315 R   |   6 EVAL2      001331 R   |   6 EXE1       000B08 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]

Symbol Table

  6 EXECU      00039F R   |   6 EXIT       0003AF R   |     EXT     =  000000 
    EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1     |   6 EXTRC      000BCE R
  6 FADDR      001FDC R   |     FHSE    =  7A1200     |     FHSI    =  F42400 
  6 FILL       000B40 R   |   6 FILL1      000B5D R   |   6 FILL2      000B66 R
  6 FIND       0010B3 R   |   6 FIND1      0010D1 R   |   6 FIND2      0010FF R
  6 FIND3      00110B R   |   6 FIND4      00111F R   |   6 FIND5      00112C R
  6 FIND6      001110 R   |     FLASH_BA=  008000     |     FLASH_CR=  00505A 
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
    FLASH_WS=  00480D     |     FLSI    =  01F400     |   6 FMOVE      001FE7 R
  6 FMOVE2     002018 R   |   6 FOR        00142A R   |   6 FORGET     000154 R
  6 FORGET1    000183 R   |   6 FORGET2    000209 R   |   6 FORGET4    000212 R
  6 FORGET6    0001CB R   |     FPTR    =  000032     |   6 FREEVAR    00021F R
  6 FREEVAR4   000255 R   |     GPIO_BAS=  005000     |     GPIO_CR1=  000003 
    GPIO_CR2=  000004     |     GPIO_DDR=  000002     |     GPIO_IDR=  000001 
    GPIO_ODR=  000000     |     GPIO_SIZ=  000005     |   6 HERE       000AC4 R
  6 HEX        000C7D R   |   6 HI         0018FC R   |   6 HLD        0005A1 R
  6 HOLD       000BF2 R   |     HSECNT  =  004809     |     I2C_CCRH=  00521C 
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
    I2C_TRIS=  000011     |     I2C_WRIT=  000000     |   6 ICOLON     0016DB R
  6 IFETCH     001448 R   |   6 IFF        001485 R   |   6 IFMOVE     0020C0 R
    IMEDD   =  000080     |   6 IMMED      0016ED R   |   6 INCH       000323 R
  6 INITOFS    0016A3 R   |   6 INN        00054F R   |     INPUT_DI=  000000 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]

Symbol Table

    INPUT_EI=  000001     |     INPUT_FL=  000000     |     INPUT_PU=  000001 
  6 INTE1      0012B4 R   |   6 INTER      00128A R   |     INT_ADC2=  000016 
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
    IRET_COD=  000080     |   6 ISEMI      001638 R   |     ITC_SPR1=  007F70 
    ITC_SPR2=  007F71     |     ITC_SPR3=  007F72     |     ITC_SPR4=  007F73 
    ITC_SPR5=  007F74     |     ITC_SPR6=  007F75     |     ITC_SPR7=  007F76 
    ITC_SPR8=  007F77     |     IWDG_KR =  0050E0     |     IWDG_PR =  0050E1 
    IWDG_RLR=  0050E2     |   6 JSRC       00168D R   |   6 KEY        000DBD R
  6 KTAP       0011A4 R   |   6 KTAP1      0011C7 R   |   6 KTAP2      0011CA R
  6 LAST       0005E0 R   |   6 LASTN   =  0020B9 R   |   6 LBRAC      0012C1 R
    LED2_BIT=  000005     |     LED2_MAS=  000020     |     LED2_POR=  00500A 
  6 LESS       00074D R   |     LF      =  00000A     |   6 LINK    =  0020B9 R
  6 LITER      0013FC R   |   6 LN2        001A32 R   |   6 LOG2       001A1D R
  6 LSHIFT     000987 R   |   6 LSHIFT1    000990 R   |   6 LSHIFT4    000998 R
  6 LT1        000763 R   |     MASKK   =  001F7F     |   6 MAX        00076D R
  6 MAX1       000780 R   |   6 MIN        00078A R   |   6 MIN1       00079D R
  6 MMOD1      000840 R   |   6 MMOD2      000854 R   |   6 MMOD3      00086B R
  6 MMSM1      0007E7 R   |   6 MMSM2      0007FB R   |   6 MMSM3      0007FD R
  6 MMSM4      000805 R   |   6 MODD       000885 R   |   6 MONE       0009EE R
    MS      =  00002E     |   6 MSEC       00025F R   |   6 MSMOD      000823 R
  6 MSTA1      000916 R   |   6 MSTAR      0008F3 R   |     NAFR    =  004804 
  6 NAMEQ      00114C R   |   6 NAMET      00105D R   |     NCLKOPT =  004808 
  6 NEGAT      00069A R   |   6 NEX1       000366 R   |   6 NEXT       001439 R
    NFLASH_W=  00480E     |     NHSECNT =  00480A     |     NOPT1   =  004802 
    NOPT2   =  004804     |     NOPT3   =  004806     |     NOPT4   =  004808 
    NOPT5   =  00480A     |     NOPT6   =  00480C     |     NOPT7   =  00480E 
    NOPTBL  =  00487F     |   6 NTIB       00055F R   |     NUBC    =  004802 
  6 NUFQ       000DD3 R   |   6 NUFQ1      000DEC R   |   6 NUMBQ      000CEA R
  6 NUMQ1      000D1E R   |   6 NUMQ2      000D4F R   |   6 NUMQ3      000D91 R
  6 NUMQ4      000D96 R   |   6 NUMQ5      000DA5 R   |   6 NUMQ6      000DA8 R
    NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC 
    NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE     |   6 NonHandl   000000 R
  6 OFFSET     000605 R   |     OFS     =  000005     |   6 ONE        0009E0 R
  6 ONEM       000976 R   |   6 ONEP       000969 R   |     OPT     =  000002 
    OPT0    =  004800     |     OPT1    =  004801     |     OPT2    =  004803 
    OPT3    =  004805     |     OPT4    =  004807     |     OPT5    =  004809 
    OPT6    =  00480B     |     OPT7    =  00480D     |     OPTBL   =  00487E 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]

Symbol Table

    OPTION_B=  004800     |     OPTION_E=  00487F     |     OPTION_S=  000080 
  6 ORIG       000043 R   |   6 ORR        0004D4 R   |   6 OUTPUT     000334 R
    OUTPUT_F=  000001     |     OUTPUT_O=  000000     |     OUTPUT_P=  000001 
    OUTPUT_S=  000000     |   6 OVER       00049E R   |   6 OVERT      001609 R
    PA      =  000000     |   6 PACKS      000B85 R   |   6 PAD        000AD5 R
  6 PAREN      001010 R   |   6 PARS       000F09 R   |   6 PARS1      000F34 R
  6 PARS2      000F5F R   |   6 PARS3      000F62 R   |   6 PARS4      000F6B R
  6 PARS5      000F8E R   |   6 PARS6      000FA3 R   |   6 PARS7      000FB2 R
  6 PARS8      000FC1 R   |   6 PARSE      000FD2 R   |   6 PAUSE      00026F R
    PA_BASE =  005000     |     PA_CR1  =  005003     |     PA_CR2  =  005004 
    PA_DDR  =  005002     |     PA_IDR  =  005001     |     PA_ODR  =  005000 
    PB      =  000005     |     PB_BASE =  005005     |     PB_CR1  =  005008 
    PB_CR2  =  005009     |     PB_DDR  =  005007     |     PB_IDR  =  005006 
    PB_ODR  =  005005     |     PC      =  00000A     |     PC_BASE =  00500A 
    PC_CR1  =  00500D     |     PC_CR2  =  00500E     |     PC_DDR  =  00500C 
    PC_IDR  =  00500B     |     PC_ODR  =  00500A     |     PD      =  00000F 
  6 PDUM1      0017E4 R   |   6 PDUM2      0017F5 R   |     PD_BASE =  00500F 
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
    PI      =  000028     |     PICATOUT=  000001     |   6 PICK       000A2F R
  6 PII        001997 R   |     PI_BASE =  005028     |     PI_CR1  =  00502B 
    PI_CR2  =  00502C     |     PI_DDR  =  00502A     |     PI_IDR  =  005029 
    PI_ODR  =  005028     |   6 PLUS       00066F R   |   6 PNAM1      0015BE R
  6 PRESE      001340 R   |     PROD1   =  000022     |     PROD2   =  000024 
    PROD3   =  000026     |   6 PROTECTE   0001FB R   |   6 PSTOR      000A46 R
    PTR16   =  000033     |     PTR8    =  000034     |   6 QBRAN      000378 R
  6 QDUP       00061E R   |   6 QDUP1      000628 R   |   6 QKEY       000311 R
  6 QSTAC      0012F8 R   |   6 QUERY      001224 R   |   6 QUEST      000EFB R
  6 QUIT       00135D R   |   6 QUIT1      001365 R   |   6 QUIT2      001368 R
  6 RAM2EE     001F88 R   |     RAMBASE =  000000     |   6 RAMLAST    0005F3 R
    RAM_BASE=  000000     |     RAM_END =  0017FF     |     RAM_SIZE=  001800 
  6 RAT        000431 R   |   6 RBRAC      00167A R   |   6 REPEA      001502 R
  6 RFREE      001F6F R   |   6 RFROM      00041E R   |     ROP     =  004800 
  6 ROT        00062F R   |   6 ROW2BUF    001F31 R   |     ROWBUFF =  001680 
    RP0     =  00002C     |   6 RPAT       0003FB R   |     RPP     =  0017FF 
  6 RPSTO      000408 R   |   6 RSHIFT     0009A3 R   |   6 RSHIFT1    0009AC R
  6 RSHIFT4    0009B4 R   |     RST_SR  =  0050B3     |   6 RT12_2     001A07 R
  6 SAME1      00107B R   |   6 SAME2      0010A4 R   |   6 SAMEQ      001073 R
  6 SCOM1      0015F3 R   |   6 SCOM2      0015F6 R   |   6 SCOMP      0015D5 R
  6 SEMIS      001619 R   |   6 SETISP     0000CA R   |   6 SET_RAML   00175D R
    SFR_BASE=  005000     |     SFR_END =  0057FF     |   6 SIGN       000C31 R
  6 SIGN1      000C41 R   |   6 SLASH      00088F R   |   6 SLMOD      000873 R
  6 SNAME      001588 R   |     SP0     =  00002A     |   6 SPACE      000DF5 R
  6 SPACS      000E04 R   |   6 SPAT       000454 R   |     SPI_CR1 =  005200 
    SPI_CR2 =  005201     |     SPI_CRCP=  005205     |     SPI_DR  =  005204 
    SPI_ICR =  005202     |     SPI_RXCR=  005206     |     SPI_SR  =  005203 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]

Symbol Table

    SPI_TXCR=  005207     |     SPP     =  001680     |   6 SPSTO      000461 R
  6 SQRT10     0019F0 R   |   6 SQRT2      0019AE R   |   6 SQRT3      0019C5 R
  6 SSMOD      00091F R   |     SSP     =  000001     |     STACK   =  0017FF 
  6 STAR       0008E8 R   |   6 STASL      000930 R   |   6 STOD       0006D1 R
  6 STORE      0003B6 R   |   6 STR        000C5F R   |   6 STRCQ      00140A R
  6 STRQ       001541 R   |   6 STRQP      000E72 R   |   6 SUBB       0006E8 R
  6 SWAPP      000484 R   |     SWIM_CSR=  007F80     |   6 TAP        00118E R
  6 TBOOT      00191D R   |   6 TBUF       00056F R   |     TBUFFBAS=  001680 
  6 TCHA1      000A0F R   |   6 TCHAR      0009FF R   |   6 TEMP       000540 R
  6 TEVAL      000592 R   |   6 TFLASH     000581 R   |   6 THENN      00149A R
  6 TIB        000AE6 R   |     TIBB    =  001700     |     TIBBASE =  001700 
    TIC     =  000027     |   6 TICK       001374 R   |     TIM1_ARR=  005262 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]

Symbol Table

    TIM1_SR1=  000000     |     TIM1_SR2=  005256     |     TIM1_SR2=  000001 
    TIM1_SR2=  000002     |     TIM1_SR2=  000003     |     TIM1_SR2=  000004 
    TIM2_ARR=  00530D     |     TIM2_ARR=  00530E     |     TIM2_CCE=  005308 
    TIM2_CCE=  000000     |     TIM2_CCE=  000001     |     TIM2_CCE=  000004 
    TIM2_CCE=  000005     |     TIM2_CCE=  005309     |     TIM2_CCM=  005305 
    TIM2_CCM=  005306     |     TIM2_CCM=  005307     |     TIM2_CCM=  000000 
    TIM2_CCM=  000004     |     TIM2_CCM=  000003     |     TIM2_CCR=  00530F 
    TIM2_CCR=  005310     |     TIM2_CCR=  005311     |     TIM2_CCR=  005312 
    TIM2_CCR=  005313     |     TIM2_CCR=  005314     |     TIM2_CNT=  00530A 
    TIM2_CNT=  00530B     |     TIM2_CR1=  005300     |     TIM2_CR1=  000007 
    TIM2_CR1=  000000     |     TIM2_CR1=  000003     |     TIM2_CR1=  000001 
    TIM2_CR1=  000002     |     TIM2_EGR=  005304     |     TIM2_EGR=  000001 
    TIM2_EGR=  000002     |     TIM2_EGR=  000003     |     TIM2_EGR=  000006 
    TIM2_EGR=  000000     |     TIM2_IER=  005301     |     TIM2_PSC=  00530C 
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
    TIM4_EGR=  000000     |     TIM4_IER=  005341     |     TIM4_IER=  000000 
    TIM4_PSC=  005345     |     TIM4_PSC=  000000     |     TIM4_PSC=  000007 
    TIM4_PSC=  000004     |     TIM4_PSC=  000001     |     TIM4_PSC=  000005 
    TIM4_PSC=  000002     |     TIM4_PSC=  000006     |     TIM4_PSC=  000003 
    TIM4_PSC=  000000     |     TIM4_PSC=  000001     |     TIM4_PSC=  000002 
    TIM4_SR =  005342     |     TIM4_SR_=  000000     |   6 TIMEOUTQ   00029F R
  6 TIMER      000289 R   |     TIM_CR1_=  000007     |     TIM_CR1_=  000000 
    TIM_CR1_=  000006     |     TIM_CR1_=  000005     |     TIM_CR1_=  000004 
    TIM_CR1_=  000003     |     TIM_CR1_=  000001     |     TIM_CR1_=  000002 
  6 TNAM2      00187A R   |   6 TNAM3      001898 R   |   6 TNAM4      00189E R
  6 TNAME      001877 R   |   6 TOFLASH    0002C4 R   |   6 TOKEN      00104F R
  6 TOR        00043D R   |   6 TORAM      000304 R   |     TRUEE   =  00FFFF 
  6 TWOSL      0009BB R   |   6 TYPE1      000E24 R   |   6 TYPE2      000E30 R
  6 TYPES      000E1F R   |   6 Timer4Ha   000005 R   |     UART1   =  000000 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]

Symbol Table

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
    UBASE   =  000006     |     UBC     =  004801     |     UCNTXT  =  000014 
    UCP     =  000018     |     UCTIB   =  00000C     |     UD1     =  000001 
    UD2     =  000002     |     UD3     =  000003     |     UD4     =  000004 
  6 UDOT       000EC5 R   |   6 UDOTR      000EA5 R   |   6 UEND       000041 R
    UHLD    =  000012     |     UINN    =  00000A     |     UINTER  =  000010 
    ULAST   =  00001A     |   6 ULES1      000745 R   |   6 ULESS      00072F R
  6 UMMOD      0007C5 R   |   6 UMSTA      00089E R   |   6 UNIQ1      00157F R
  6 UNIQU      001560 R   |   6 UNTIL      001462 R   |     UOFFSET =  00001C 
  6 UPDATCP    001B04 R   |   6 UPDATLAS   001ADB R   |   6 UPDATPTR   00207B R
  6 UPDATRUN   001AF3 R   |   6 UPDATVP    001B1B R   |   6 UPL1       000515 R
  6 UPLUS      0004FE R   |     UPP     =  000006     |     URLAST  =  000020 
    USR_BTN_=  000004     |     USR_BTN_=  000010     |     USR_BTN_=  005015 
    UTFLASH =  00001E     |     UTIB    =  00000E     |     UTMP    =  000008 
  6 UTYP1      0017B4 R   |   6 UTYP2      0017C3 R   |   6 UTYPE      0017AF R
    UVP     =  000016     |   6 UZERO      000027 R   |   6 VARIA      00172A R
    VAR_BASE=  000080     |     VAR_TOP =  0017BF     |     VER     =  000003 
  6 VPP        0005C2 R   |     VSIZE   =  000006     |     WANT_DEB=  000000 
    WANT_MAT=  000001     |     WANT_SEE=  000000     |     WDGOPT  =  004805 
    WDGOPT_I=  000002     |     WDGOPT_L=  000003     |     WDGOPT_W=  000000 
    WDGOPT_W=  000001     |   6 WHILE      0014E8 R   |   6 WITHI      0007AA R
  6 WORDD      00103B R   |   6 WORDS      0018D4 R   |   6 WORS1      0018DA R
  6 WORS2      0018F6 R   |     WWDG_CR =  0050D1     |     WWDG_WR =  0050D2 
  6 XORR       0004E9 R   |     XTEMP   =  000022     |     YTEMP   =  000024 
  6 ZERO       0009D5 R   |   6 ZL1        0004B6 R   |   6 ZLESS      0004AD R
  6 app_spac   002100 R   |   6 block_er   001C9E R   |   6 clear_ra   000019 R
  6 clock_in   00005E R   |   6 copy_buf   001CF5 R   |   6 copy_buf   001D14 R
  6 copy_pro   001D14 R   |     da      =  000002     |     db      =  000003 
    dc      =  000000     |     dd      =  000001     |   6 ee_ccomm   001F0F R
  6 ee_comma   001EEE R   |   6 ee_cstor   001C0B R   |   6 ee_store   001C57 R
  6 erase_fl   001CBA R   |   6 farat      001B2C R   |   6 farcat     001B48 R
  6 fmove_do   002064 R   |   6 fptr_sto   001A47 R   |   6 inc_fptr   001BD9 R
  6 lock       001BC5 R   |   6 main       000016 R   |   6 next_row   002021 R
  6 no_move    00206B R   |   6 pristine   001D8F R   |   6 proceed_   001CBD R
  6 reboot     0002B6 R   |   6 reset_ve   001DF6 R   |   6 row_eras   001C81 R
  6 row_eras   001CCE R   |   6 row_eras   001CF5 R   |   6 set_opti   001D63 R
  6 set_vect   001E97 R   |   6 uart1_in   000070 R   |   6 unlock     001B9D R
  6 unlock_e   001B5F R   |   6 unlock_f   001B7E R   |   6 write_by   001BF0 R
  6 write_ro   001D39 R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 DATA       size      0   flags    8
   2 DATA0      size      0   flags    8
   3 SSEG       size      0   flags    8
   4 SSEG1      size    100   flags    8
   5 HOME       size     80   flags    0
   6 CODE       size   2100   flags    0

