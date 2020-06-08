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
                           001670    99 DATSTK  =	0x1670	;data stack  empty
                           001680   100 TBUFFBASE =     0x1680  ; flash read/write transaction buffer 
                           001700   101 TIBBASE =       0X1700  ; tib addr.
                                    102 
                                    103 
                                    104 
                                    105 ;; Memory allocation
                                    106 
                           000006   107 UPP     =     RAMBASE+6
                           001670   108 SPP     =     RAMBASE+DATSTK
                           0017FF   109 RPP     =     RAMBASE+STACK
                           001680   110 ROWBUFF =     RAMBASE+TBUFFBASE 
                           001700   111 TIBB    =     RAMBASE+TIBBASE
                           000080   112 CTOP    =     RAMBASE+0x80
                                    113 
                           000001   114 .if PICATOUT_MOD 
                                    115 ; user variables constants 
                           000006   116 UBASE = UPP       ; numeric base 
                           000008   117 UTMP = UBASE+2    ; temporary storage
                           00000A   118 UINN = UTMP+2     ; >IN tib pointer 
                           00000C   119 UCTIB = UINN+2    ; tib count 
                           00000E   120 UTIB = UCTIB+2    ; tib address 
                           000010   121 UINTER = UTIB+2   ; interpreter vector 
                           000012   122 UHLD = UINTER+2   ; hold 
                           000014   123 UCNTXT = UHLD+2   ; context, dictionary first link 
                           000016   124 UVP = UCNTXT+2    ; variable pointer 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 4.
Hexadecimal [24-Bits]



                           000018   125 UCP = UVP+2      ; code pointer
                           00001A   126 ULAST = UCP+2    ; last dictionary pointer 
                           00001C   127 UOFFSET = ULAST+2 ; distance between CP and VP to adjust jump address at compile time.
                           00001E   128 UTFLASH = UOFFSET+2 ; select where between FLASH and RAM for compilation destination. 
                                    129 .endif ; PICATOUT_MOD
                                    130 ;******  System Variables  ******
                           000020   131 XTEMP	=	UTFLASH +2;address called by CREATE
                           000022   132 YTEMP	=	XTEMP+2	;address called by CREATE
                           000020   133 PROD1 = XTEMP	;space for UM*
                           000022   134 PROD2 = PROD1+2
                           000024   135 PROD3 = PROD2+2
                           000026   136 CARRY = PROD3+2
                           000028   137 SP0	= CARRY+2	;initial data stack pointer
                           00002A   138 RP0	= SP0+2		;initial return stack pointer
                           00002C   139 MS    =   RP0+2         ; millisecond counter 
                           00002E   140 CNTDWN =  MS+2          ; count down timer 
                           000030   141 FPTR = CNTDWN+2         ; 24 bits farptr 
                           000031   142 PTR16 = FPTR+1          ; middle byte of farptr 
                           000032   143 PTR8 = FPTR+2           ; least byte of farptr 
                                    144 
                           000001   145 .if PICATOUT_MOD
                                    146 ; EEPROM persistant data  
                           004000   147 APP_LAST = EEPROM_BASE ; Application last word pointer  
                           004002   148 APP_RUN = APP_LAST+2   ; application autorun address 
                           004004   149 APP_CP = APP_RUN+2   ; free application space pointer 
                           004006   150 APP_VP = APP_CP+2  ; free data space pointer 
                                    151 .endif ;PICATOUT_MOD
                                    152 
                                    153 
                                    154 ;***********************************************
                                    155 ;; Version control
                                    156 
                           000003   157 VER     =     3         ;major release version
                           000000   158 EXT     =     0         ;minor extension
                                    159 
                                    160 ;; Constants
                                    161 
                           00FFFF   162 TRUEE   =     0xFFFF      ;true flag
                                    163 
                           000040   164 COMPO   =     0x40     ;lexicon compile only bit
                           000080   165 IMEDD   =     0x80     ;lexicon immediate bit
                           001F7F   166 MASKK   =     0x1F7F  ;lexicon bit mask
                                    167 
                           000002   168 CELLL   =     2       ;size of a cell
                           00000A   169 BASEE   =     10      ;default radix
                           000008   170 BKSPP   =     8       ;back space
                           00000A   171 LF      =     10      ;line feed
                           00000D   172 CRR     =     13      ;carriage return
                           00001B   173 ERR     =     27      ;error escape
                           000027   174 TIC     =     39      ;tick
                           0000CD   175 CALLL   =     0xCD     ;CALL opcodes
                           000080   176 IRET_CODE =   0x80    ; IRET opcode 
                                    177 
                                    178         .macro _ledon
                                    179         bset PC_ODR,#LED2_BIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 5.
Hexadecimal [24-Bits]



                                    180         .endm
                                    181 
                                    182         .macro _ledoff
                                    183         bres PC_ODR,#LED2_BIT
                                    184         .endm
                                    185 
                                    186 ;**********************************************************
                                    187         .area DATA (ABS)
      000000                        188         .org RAMBASE 
                                    189 ;**********************************************************
                                    190 
                                    191 ;**********************************************************
                                    192         .area SSEG (ABS) ; STACK
      001700                        193         .org 0x1700
      001700                        194         .ds 256 
                                    195 ; space for DATSTK,TIB and STACK         
                                    196 ;**********************************************************
                                    197 
                                    198 ;**********************************************************
                                    199         .area HOME ; vectors table
                                    200 ;**********************************************************
      008000 82 00 80 96            201 	int main	        ; reset
      008004 82 00 80 80            202 	int NonHandledInterrupt	; trap
      008008 82 00 80 80            203 	int NonHandledInterrupt	; irq0
      00800C 82 00 80 80            204 	int NonHandledInterrupt	; irq1
      008010 82 00 80 80            205 	int NonHandledInterrupt	; irq2
      008014 82 00 80 80            206 	int NonHandledInterrupt	; irq3
      008018 82 00 80 80            207 	int NonHandledInterrupt	; irq4
      00801C 82 00 80 80            208 	int NonHandledInterrupt	; irq5
      008020 82 00 80 80            209 	int NonHandledInterrupt	; irq6
      008024 82 00 80 80            210 	int NonHandledInterrupt	; irq7
      008028 82 00 80 80            211 	int NonHandledInterrupt	; irq8
      00802C 82 00 80 80            212 	int NonHandledInterrupt	; irq9
      008030 82 00 80 80            213 	int NonHandledInterrupt	; irq10
      008034 82 00 80 80            214 	int NonHandledInterrupt	; irq11
      008038 82 00 80 80            215 	int NonHandledInterrupt	; irq12
      00803C 82 00 80 80            216 	int NonHandledInterrupt	; irq13
      008040 82 00 80 80            217 	int NonHandledInterrupt	; irq14
      008044 82 00 80 80            218 	int NonHandledInterrupt	; irq15
      008048 82 00 80 80            219 	int NonHandledInterrupt	; irq16
      00804C 82 00 80 80            220 	int NonHandledInterrupt	; irq17
      008050 82 00 80 80            221 	int NonHandledInterrupt	; irq18
      008054 82 00 80 80            222 	int NonHandledInterrupt	; irq19
      008058 82 00 80 80            223 	int NonHandledInterrupt	; irq20
      00805C 82 00 80 80            224 	int NonHandledInterrupt	; irq21
      008060 82 00 80 80            225 	int NonHandledInterrupt	; irq22
      008064 82 00 80 85            226 	int Timer4Handler	; irq23
      008068 82 00 80 80            227 	int NonHandledInterrupt	; irq24
      00806C 82 00 80 80            228 	int NonHandledInterrupt	; irq25
      008070 82 00 80 80            229 	int NonHandledInterrupt	; irq26
      008074 82 00 80 80            230 	int NonHandledInterrupt	; irq27
      008078 82 00 80 80            231 	int NonHandledInterrupt	; irq28
      00807C 82 00 80 80            232 	int NonHandledInterrupt	; irq29
                                    233 
                                    234 ;**********************************************************
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 6.
Hexadecimal [24-Bits]



                                    235         .area CODE
                                    236 ;**********************************************************
                                    237 
                                    238 ; non handled interrupt reset MCU
      008080                        239 NonHandledInterrupt:
      008080 A6 80            [ 1]  240         ld a, #0x80
      008082 C7 50 D1         [ 1]  241         ld WWDG_CR,a ; WWDG_CR used to reset mcu
                                    242 	;iret
                                    243 
                                    244 ; used for milliseconds counter 
                                    245 ; MS is 16 bits counter 
      008085                        246 Timer4Handler:
      008085 72 5F 53 42      [ 1]  247 	clr TIM4_SR 
      008089 BE 2C            [ 2]  248         ldw x,MS 
      00808B 5C               [ 2]  249         incw x 
      00808C BF 2C            [ 2]  250         ldw MS,x
      00808E BE 2E            [ 2]  251         ldw x,CNTDWN 
      008090 27 03            [ 1]  252         jreq 1$
      008092 5A               [ 2]  253         decw x 
      008093 BF 2E            [ 2]  254         ldw CNTDWN,x 
      008095                        255 1$:         
      008095 80               [11]  256         iret 
                                    257 
                                    258 
                                    259 ;; Main entry points and COLD start data
      008096                        260 main:
                                    261 ; clear all RAM
      008096 AE 00 00         [ 2]  262 	ldw X,#RAMBASE
      008099                        263 clear_ram0:
      008099 7F               [ 1]  264 	clr (X)
      00809A 5C               [ 2]  265 	incw X
      00809B A3 17 FF         [ 2]  266 	cpw X,#RAM_END
      00809E 23 F9            [ 2]  267 	jrule clear_ram0
      0080A0 AE 17 FF         [ 2]  268         ldw x,#RPP
      0080A3 94               [ 1]  269         ldw sp,x 
      0080A4 CC 80 C3         [ 2]  270 	jp ORIG
                                    271 
                                    272 ; COLD initialize these variables.
      0080A7                        273 UZERO:
      0080A7 00 0A                  274         .word      BASEE   ;BASE
      0080A9 00 00                  275         .word      0       ;tmp
      0080AB 00 00                  276         .word      0       ;>IN
      0080AD 00 00                  277         .word      0       ;#TIB
      0080AF 17 00                  278         .word      TIBB    ;TIB
      0080B1 92 7E                  279         .word      INTER   ;'EVAL
      0080B3 00 00                  280         .word      0       ;HLD
      0080B5 9F F8                  281         .word      LASTN  ;CNTXT pointer
      0080B7 00 80                  282         .word      CTOP   ;CP in RAM
      0080B9 A0 80                  283         .word      app_space ; CP in FLASH 
      0080BB 9F F8                  284         .word      LASTN   ;LAST
      0080BD 00 00                  285         .word      0        ; OFFSET 
      0080BF 00 00                  286         .word      0       ; TFLASH 
      0080C1 00 00                  287 UEND:   .word      0
                                    288 
      0080C3                        289 ORIG:   
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 7.
Hexadecimal [24-Bits]



                                    290 ; initialize SP
      0080C3 AE 17 FF         [ 2]  291         LDW     X,#STACK  ;initialize return stack
      0080C6 94               [ 1]  292         LDW     SP,X
      0080C7 BF 2A            [ 2]  293         LDW     RP0,X
      0080C9 AE 16 70         [ 2]  294         LDW     X,#DATSTK ;initialize data stack
      0080CC BF 28            [ 2]  295         LDW     SP0,X
                                    296 ; initialize PC_5 as output to control LED2
                                    297 ; added by Picatout 
      0080CE 72 1A 50 0D      [ 1]  298         bset PC_CR1,#LED2_BIT
      0080D2 72 1A 50 0E      [ 1]  299         bset PC_CR2,#LED2_BIT
      0080D6 72 1A 50 0C      [ 1]  300         bset PC_DDR,#LED2_BIT
      00005A                        301         _ledoff
      0080DA 72 1B 50 0A      [ 1]    1         bres PC_ODR,#LED2_BIT
                                    302 ; initialize clock to HSI
                                    303 ; no divisor 16Mhz 
                                    304 ; Added by Picatout 
      0080DE                        305 clock_init:
      0080DE 72 5F 50 C6      [ 1]  306         clr CLK_CKDIVR
      0080E2 72 12 50 C5      [ 1]  307 	bset CLK_SWCR,#CLK_SWCR_SWEN
      0080E6 A6 E1            [ 1]  308 	ld a,#CLK_SWR_HSI
      0080E8 C7 50 C4         [ 1]  309 	ld CLK_SWR,a
      0080EB C1 50 C3         [ 1]  310 1$:	cp a,CLK_CMSR
      0080EE 26 FB            [ 1]  311 	jrne 1$
                                    312         
                                    313 ; initialize UART1, 115200 8N1
      0080F0                        314 uart1_init:
      0080F0 72 14 50 C7      [ 1]  315 	bset CLK_PCKENR1,#CLK_PCKENR1_UART1
                                    316 	; configure tx pin
      0080F4 72 1A 50 02      [ 1]  317 	bset PA_DDR,#UART1_TX_PIN ; tx pin
      0080F8 72 1A 50 03      [ 1]  318 	bset PA_CR1,#UART1_TX_PIN ; push-pull output
      0080FC 72 1A 50 04      [ 1]  319 	bset PA_CR2,#UART1_TX_PIN ; fast output
                                    320 	; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
      008100 35 0B 52 33      [ 1]  321 	mov UART1_BRR2,#0x0b ; must be loaded first
      008104 35 08 52 32      [ 1]  322 	mov UART1_BRR1,#0x8
      008108 35 0C 52 35      [ 1]  323 	mov UART1_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN));|(1<<UART_CR2_RIEN))
                                    324 ; initialize timer4, used for millisecond interrupt  
      00810C 35 07 53 45      [ 1]  325 	mov TIM4_PSCR,#7 ; prescale 128  
      008110 35 7D 53 46      [ 1]  326 	mov TIM4_ARR,#125 ; set for 1msec.
      008114 35 05 53 40      [ 1]  327 	mov TIM4_CR1,#((1<<TIM4_CR1_CEN)|(1<<TIM4_CR1_URS))
      008118 72 10 53 41      [ 1]  328 	bset TIM4_IER,#TIM4_IER_UIE 
                                    329 ; set TIM4 interrupt priority to highest
      00811C A6 3F            [ 1]  330         ld a,#~(IPR_MASK<<6)
      00811E C4 7F 75         [ 1]  331         and a,ITC_SPR6
      008121 AA C0            [ 1]  332         or a,#(IPR3<<6)
      008123 C7 7F 75         [ 1]  333         ld ITC_SPR6,a 
      008126 9A               [ 1]  334         rim
      008127 CC 99 17         [ 2]  335         jp  COLD   ;default=MN1
                                    336 
                                    337 
                                    338 ;; place MCU in sleep mode with
                                    339 ;; halt opcode 
                                    340 ;; BYE ( -- )
      00812A 00 00                  341         .word 0
                           0000AC   342         LINK=.
      00812C 03                     343         .byte 3 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 8.
Hexadecimal [24-Bits]



      00812D 42 59 45               344         .ascii "BYE"
      008130                        345 BYE: 
      008130 8E               [10]  346         halt 
      008131 81               [ 4]  347         ret 
                                    348 
                                    349 ; Enable interrupts 
                                    350 ; EI ( -- )
      008132 81 2C                  351         .word LINK 
                           0000B4   352         LINK=.
      008134 02                     353         .byte 2
      008135 45 49                  354         .ascii "EI"
      008137                        355 EI:
      008137 9A               [ 1]  356         rim 
      008138 81               [ 4]  357         ret 
                                    358 
                                    359 ; Disable interrupts
                                    360 ; DI ( -- )
      008139 81 34                  361         .word LINK 
                           0000BB   362         LINK=.
      00813B 02                     363         .byte 2 
      00813C 44 49                  364         .ascii "DI"
      00813E                        365 DI:
      00813E 9B               [ 1]  366         sim 
      00813F 81               [ 4]  367         ret 
                                    368 
                                    369 ; set interrupt priority level 
                                    370 ; SET-ISP ( n1 n2 -- )
                                    371 ; n1 level {1..3}
                                    372 ; n2 vector {0..29}
      008140 81 3B                  373         .word LINK 
                           0000C2   374         LINK=.
      008142 07                     375         .byte 7 
      008143 53 45 54 2D 49 53 50   376         .ascii "SET-ISP"
      00814A                        377 SETISP:
      00814A 90 93            [ 1]  378         ldw y,x 
      00814C 90 FE            [ 2]  379         ldw y,(y)
      00814E A6 04            [ 1]  380         ld a,#4 ; 4 slot per register 
                                    381 ;  quotient select register, remainder select slot in register.        
      008150 90 62            [ 2]  382         div y,a ; register=ITC_SPR1[Y], lshift=2*A 
      008152 A4 03            [ 1]  383         and a,#3 
      008154 48               [ 1]  384         sll a ; 2*SLOT  lshift 
      008155 72 A9 7F 70      [ 2]  385         addw y,#ITC_SPR1 
      008159 FF               [ 2]  386         ldw (x),y  ; ( level reg -- )
      00815A 90 5F            [ 1]  387         clrw y 
      00815C 90 97            [ 1]  388         ld yl,a 
      00815E 1D 00 02         [ 2]  389         subw x,#CELLL 
      008161 FF               [ 2]  390         ldw (x),y  ; ( level reg lshift -- )
      008162 90 93            [ 1]  391         ldw y,x 
      008164 90 EE 02         [ 2]  392         ldw y,(2,y) 
      008167 90 F6            [ 1]  393         ld a,(y)   ; reg_value
      008169 1D 00 02         [ 2]  394         subw x,#CELLL 
      00816C FF               [ 2]  395         ldw (x),y ; ( level reg lshift rval -- )
      00816D CD 84 C2         [ 4]  396         call OVER ; ( level reg lshift rval lshift -- )
      008170 CD 83 69         [ 4]  397         call DOLIT 
      008173 00 03                  398         .word 3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 9.
Hexadecimal [24-Bits]



      008175 CD 84 A8         [ 4]  399         call SWAPP  ; ( level reg lshift rval 3 lshift )
      008178 CD 89 7D         [ 4]  400         call LSHIFT ; creat slot mask 
      00817B CD 86 9A         [ 4]  401         call INVER  ; ( level reg lshift rval mask )
      00817E CD 84 E4         [ 4]  402         call ANDD ; ( level reg lshift slot_masked )
      008181 CD 84 61         [ 4]  403         call TOR  ; ( level reg lshift -- R: slot_masked )
      008184 CD 86 40         [ 4]  404         call ROT  ; ( reg lshift level )
      008187 CD 84 A8         [ 4]  405         call SWAPP ; ( reg level lshift )
      00818A CD 89 7D         [ 4]  406         call LSHIFT  ; ( reg slot_level -- )
      00818D CD 84 42         [ 4]  407         call RFROM ; ( reg slot_level masked_val )
      008190 CD 84 F8         [ 4]  408         call ORR   ; ( reg updated_rval )
      008193 CD 84 A8         [ 4]  409         call SWAPP 
      008196 CD 83 FE         [ 4]  410         call CSTOR
                                    411 
                                    412 ; sélectionne l'application 
                                    413 ; qui démarre automatique lors 
                                    414 ; d'un COLD start 
      008199 81 42                  415         .word LINK 
                           00011B   416         LINK=.
      00819B 07                     417         .byte 7
      00819C 41 55 54 4F 52 55 4E   418         .ascii "AUTORUN"
      0081A3                        419 AUTORUN:
      0081A3 CD 90 43         [ 4]  420         call TOKEN 
      0081A6 CD 84 98         [ 4]  421         call DUPP 
      0081A9 CD 83 9C         [ 4]  422         call QBRAN 
      0081AC 82 5C                  423         .word FORGET2
      0081AE CD 91 40         [ 4]  424         call NAMEQ
      0081B1 CD 86 2F         [ 4]  425         call QDUP 
      0081B4 CD 83 9C         [ 4]  426         call QBRAN 
      0081B7 82 5C                  427         .word FORGET2
      0081B9 CD 84 8E         [ 4]  428         call DROP 
      0081BC 1D 00 04         [ 2]  429         subw x,#2*CELLL 
      0081BF 90 5F            [ 1]  430         clrw y 
      0081C1 FF               [ 2]  431         ldw (x),y 
      0081C2 90 AE 40 02      [ 2]  432         ldw y,#APP_RUN 
      0081C6 EF 02            [ 2]  433         ldw (2,x),y 
      0081C8 CC 9B 96         [ 2]  434         jp ee_store 
                                    435 
                                    436 
                                    437 ;; Reset dictionary pointer before 
                                    438 ;; forgotten word. RAM SPACE and 
                                    439 ;; interrupt vector defineD after 
                                    440 ;; must be resetted also.
      0081CB 81 9B                  441         .word LINK 
                           00014D   442         LINK=.
      0081CD 06                     443         .byte 6
      0081CE 46 4F 52 47 45 54      444         .ascii "FORGET" 
      0081D4                        445 FORGET: 
      0081D4 CD 90 43         [ 4]  446         call TOKEN
      0081D7 CD 84 98         [ 4]  447         call DUPP 
      0081DA CD 83 9C         [ 4]  448         call QBRAN 
      0081DD 82 5C                  449         .word FORGET2
      0081DF CD 91 40         [ 4]  450         call NAMEQ ; ( a -- ca na | a F )
      0081E2 CD 86 2F         [ 4]  451         call QDUP 
      0081E5 CD 83 9C         [ 4]  452         call QBRAN 
      0081E8 82 5C                  453         .word FORGET2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



                                    454 ; only forget users words 
      0081EA CD 84 98         [ 4]  455         call DUPP ; ( ca na na )
      0081ED CD 83 69         [ 4]  456         call DOLIT 
      0081F0 A0 80                  457         .word app_space 
      0081F2 CD 84 A8         [ 4]  458         call SWAPP 
      0081F5 CD 86 DE         [ 4]  459         call SUBB 
      0081F8 CD 84 D1         [ 4]  460         call  ZLESS 
      0081FB CD 83 9C         [ 4]  461         call QBRAN 
      0081FE 82 4E                  462         .word CANT_FORGET 
                                    463 ; ( ca na -- )        
                                    464 ;reset ivec with address >= ca
      008200 CD 84 A8         [ 4]  465         call SWAPP ; ( na ca -- ) 
      008203 CD 9D 87         [ 4]  466         call CHKIVEC ; ( na -- ) 
                                    467 ; start at LAST and link back to na 
                                    468 ; if variable found reset VP at that point.
      008206                        469 FORGET1:
      008206 CD 86 04         [ 4]  470         call LAST 
      008209 CD 83 F1         [ 4]  471         call AT 
      00820C CD 84 98         [ 4]  472         call DUPP  ; ( -- na last last )
      00820F CD 82 72         [ 4]  473         call FREEVAR ; ( -- na last )
      008212 CD 84 98         [ 4]  474         call DUPP 
      008215 CD 83 69         [ 4]  475         call DOLIT 
      008218 00 02                  476         .word 2 
      00821A CD 86 DE         [ 4]  477         call SUBB ; ( na last -- na last lfa ) link address 
      00821D CD 83 F1         [ 4]  478         call AT 
      008220 CD 84 98         [ 4]  479         call DUPP ; ( -- na last a a )
      008223 CD 85 D8         [ 4]  480         call CNTXT 
      008226 CD 83 DA         [ 4]  481         call STORE
      008229 CD 86 04         [ 4]  482         call LAST  
      00822C CD 83 DA         [ 4]  483         call STORE ; ( --  na last )
      00822F CD 84 C2         [ 4]  484         call OVER 
      008232 CD 87 06         [ 4]  485         call EQUAL ; ( na last na -- na T|F ) 
      008235 CD 83 9C         [ 4]  486         call QBRAN 
      008238 82 06                  487         .word FORGET1 
                                    488 ; ( na -- )
      00823A CD 83 69         [ 4]  489         call DOLIT 
      00823D 00 02                  490         .word 2 
      00823F CD 86 DE         [ 4]  491         call SUBB 
      008242 CD 85 F4         [ 4]  492         call CPP 
      008245 CD 83 DA         [ 4]  493         call STORE  
      008248 CD 9A 43         [ 4]  494         call UPDATCP 
      00824B CC 9A 1A         [ 2]  495         jp UPDATLAST 
      00824E                        496 CANT_FORGET:
      00824E CD 92 4C         [ 4]  497         call ABORQ
      008251 0A                     498         .byte 10
      008252 20 50 72 6F 74 65 63   499         .ascii " Protected"
             74 65 64
      00825C                        500 FORGET2:
      00825C CD 92 4C         [ 4]  501         call ABORQ
      00825F 05                     502         .byte 5
      008260 20 77 68 61 74         503         .ascii " what"
      008265                        504 FORGET4:
      008265 CC 84 8E         [ 2]  505         jp DROP 
                                    506 
                                    507 ;---------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



                                    508 ; if na is variable 
                                    509 ; free variable data  
                                    510 ; FREEVAR ( na -- )
                                    511 ;---------------------------------
      008268 81 CD                  512         .word LINK 
                           0001EA   513         LINK=.
      00826A 07                     514         .byte 7 
      00826B 46 52 45 45 56 41 52   515         .ascii "FREEVAR"
      008272                        516 FREEVAR:
      008272 CD 84 98         [ 4]  517         call DUPP ; ( na na -- )
      008275 CD 84 0F         [ 4]  518         CALL CAT  ; ( na c -- )
      008278 CD 89 5F         [ 4]  519         call ONEP ;
      00827B CD 86 80         [ 4]  520         CALL PLUS ; ( na c+1 -- ca ) 
      00827E CD 89 5F         [ 4]  521         call ONEP ; ( ca+ -- ) to get routne address 
      008281 CD 84 98         [ 4]  522         call DUPP ; ( ca+ ca+ -- )
      008284 CD 83 F1         [ 4]  523         CALL AT   ; ( ca+ fnaddr -- ) ; fnaddr is routine address 
      008287 CD 83 69         [ 4]  524         call DOLIT 
      00828A 85 45                  525         .word DOVAR ; if routine address is DOVAR then variable 
      00828C CD 87 06         [ 4]  526         call EQUAL  ; ( ca+ fnaddr DOVAR -- ca+ T|F ) 
      00828F CD 83 9C         [ 4]  527         call QBRAN 
      008292 82 A8                  528         .word FREEVAR4 
      008294 CD 83 69         [ 4]  529         call DOLIT 
      008297 00 02                  530         .word 2 
      008299 CD 86 80         [ 4]  531         call PLUS  ; ( ca+ 2 -- da ) da is data address 
      00829C CD 83 F1         [ 4]  532         call AT 
      00829F CD 85 E6         [ 4]  533         call VPP   
      0082A2 CD 83 DA         [ 4]  534         call STORE 
      0082A5 CC 9A 5A         [ 2]  535         jp UPDATVP 
      0082A8                        536 FREEVAR4: ; not variable
      0082A8 CC 84 8E         [ 2]  537         jp  DROP 
                                    538 
                                    539 ;;
                                    540 ;; get millisecond counter 
                                    541 ;; msec ( -- u )
                                    542 ;; Added by Picatout 2020-04-26
      0082AB 82 6A                  543         .word LINK  
                           00022D   544         LINK = . 
      0082AD 04                     545         .byte 4
      0082AE 4D 53 45 43            546         .ascii "MSEC"
      0082B2                        547 MSEC: 
      0082B2 1D 00 02         [ 2]  548         subw x,#CELLL 
      0082B5 90 BE 2C         [ 2]  549         ldw y,MS 
      0082B8 FF               [ 2]  550         ldw (x),y 
      0082B9 81               [ 4]  551         ret 
                                    552 
                                    553 ; suspend execution for u msec 
                                    554 ;  pause ( u -- )
      0082BA 82 AD                  555         .word LINK 
                           00023C   556         LINK=.
      0082BC 05                     557         .byte 5 
      0082BD 50 41 55 53 45         558         .ascii "PAUSE"
      0082C2                        559 PAUSE:
      0082C2 90 93            [ 1]  560         ldw y,x
      0082C4 90 FE            [ 2]  561         ldw y,(y)
      0082C6 72 B9 00 2C      [ 2]  562         addw y,MS 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]



      0082CA 8F               [10]  563 1$:     wfi  
      0082CB 90 B3 2C         [ 2]  564         cpw y,MS  
      0082CE 26 FA            [ 1]  565         jrne 1$        
      0082D0 1C 00 02         [ 2]  566         addw x,#CELLL 
      0082D3 81               [ 4]  567         ret 
                                    568 
                                    569 ; initialize count down timer 
                                    570 ;  TIMER ( u -- )  milliseconds 
      0082D4 82 BC                  571         .word LINK 
                           000256   572         LINK=.
      0082D6 05                     573         .byte 5 
      0082D7 54 49 4D 45 52         574         .ascii "TIMER" 
      0082DC                        575 TIMER:
      0082DC 90 93            [ 1]  576         ldw y,x
      0082DE 90 FE            [ 2]  577         ldw y,(y) 
      0082E0 90 BF 2E         [ 2]  578         ldw CNTDWN,y
      0082E3 1C 00 02         [ 2]  579         addw x,#CELLL 
      0082E6 81               [ 4]  580         ret 
                                    581 
                                    582 ; check for TIMER exiparition 
                                    583 ;  TIMEOUT? ( -- 0|-1 )
      0082E7 82 D6                  584         .word LINK 
                           000269   585         LINK=. 
      0082E9 08                     586         .byte 8 
      0082EA 54 49 4D 45 4F 55 54   587         .ascii "TIMEOUT?"
             3F
      0082F2                        588 TIMEOUTQ: 
      0082F2 4F               [ 1]  589         clr a
      0082F3 1D 00 02         [ 2]  590         subw x,#CELLL 
      0082F6 90 BE 2E         [ 2]  591         ldw y,CNTDWN 
      0082F9 26 01            [ 1]  592         jrne 1$ 
      0082FB 43               [ 1]  593         cpl a 
      0082FC E7 01            [ 1]  594 1$:     ld (1,x),a 
      0082FE F7               [ 1]  595         ld (x),a 
      0082FF 81               [ 4]  596         ret         
                                    597 
                                    598 ; reboot MCU 
                                    599 ; REBOOT ( -- )
      008300 82 E9                  600         .word LINK 
                           000282   601         LINK=. 
      008302 06                     602         .byte 6 
      008303 52 45 42 4F 4F 54      603         .ascii "REBOOT"
      008309                        604 reboot:
      008309 CC 80 80         [ 2]  605         jp NonHandledInterrupt
                                    606 
                                    607 ; compile to flash memory 
                                    608 ; TO-FLASH ( -- )
      00830C 83 02                  609         .word LINK 
                           00028E   610         LINK=.
      00830E 08                     611         .byte 8
      00830F 54 4F 2D 46 4C 41 53   612         .ascii "TO-FLASH"
             48
      008317                        613 TOFLASH:
      008317 90 AE FF FF      [ 2]  614         ldw y,#-1 
      00831B 90 BF 1E         [ 2]  615         ldw UTFLASH,y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 13.
Hexadecimal [24-Bits]



      00831E 81               [ 4]  616         ret 
                                    617 
                                    618 ; compile to RAM 
                                    619 ; TO-RAM ( -- )
      00831F 83 0E                  620         .word LINK 
                           0002A1   621         LINK=.
      008321 06                     622         .byte 6 
      008322 54 4F 2D 52 41 4D      623         .ascii "TO-RAM"
      008328                        624 TORAM:
      008328 90 5F            [ 1]  625         clrw y 
      00832A 90 BF 1E         [ 2]  626         ldw UTFLASH,y 
      00832D 81               [ 4]  627         ret 
                                    628         
                                    629 
                                    630 ;; Device dependent I/O
                                    631 ;       ?RX     ( -- c T | F )
                                    632 ;         Return input byte and true, or false.
      00832E 83 21                  633         .word      LINK 
                           0002B0   634 LINK	= .
      008330 04                     635         .byte      4
      008331 3F 4B 45 59            636         .ascii     "?KEY"
      008335                        637 QKEY:
      008335 90 5F            [ 1]  638         CLRW Y 
      008337 72 0B 52 30 0B   [ 2]  639         BTJF UART1_SR,#UART_SR_RXNE,INCH   ;check status
      00833C C6 52 31         [ 1]  640         LD    A,UART1_DR   ;get char in A
      00833F 1D 00 02         [ 2]  641 	SUBW	X,#2
      008342 E7 01            [ 1]  642         LD     (1,X),A
      008344 7F               [ 1]  643 	CLR	(X)
      008345 90 53            [ 2]  644         CPLW     Y
      008347                        645 INCH:
      008347 1D 00 02         [ 2]  646 	SUBW	X,#2
      00834A FF               [ 2]  647         LDW     (X),Y
      00834B 81               [ 4]  648         RET
                                    649 
                                    650 ;       TX!     ( c -- )
                                    651 ;       Send character c to  output device.
      00834C 83 30                  652         .word      LINK
                           0002CE   653 LINK	= .
      00834E 04                     654         .byte      4
      00834F 45 4D 49 54            655         .ascii     "EMIT"
      008353                        656 EMIT:
      008353 E6 01            [ 1]  657         LD     A,(1,X)
      008355 1C 00 02         [ 2]  658 	ADDW	X,#2
      008358 72 0F 52 30 FB   [ 2]  659 OUTPUT: BTJF UART1_SR,#UART_SR_TXE,OUTPUT  ;loop until tdre
      00835D C7 52 31         [ 1]  660         LD    UART1_DR,A   ;send A
      008360 81               [ 4]  661         RET
                                    662 
                                    663 ;; The kernel
                                    664 
                                    665 ;       doLIT   ( -- w )
                                    666 ;       Push an inline literal.
      008361 83 4E                  667         .word      LINK
                           0002E3   668 LINK	= 	.
      008363 45                     669 	.byte      COMPO+5
      008364 44 4F 4C 49 54         670         .ascii     "DOLIT"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 14.
Hexadecimal [24-Bits]



      008369                        671 DOLIT:
      008369 1D 00 02         [ 2]  672 	SUBW X,#2
                           000001   673 .if PICATOUT_MOD 
      00836C 16 01            [ 2]  674         ldw y,(1,sp)
      00836E 90 FE            [ 2]  675         ldw y,(y)
      008370 FF               [ 2]  676         ldw (x),y
      008371 90 85            [ 2]  677         popw y 
      008373 90 EC 02         [ 2]  678         jp (2,y)
                           000000   679 .else 
                                    680         POPW Y
                                    681 	LDW YTEMP,Y
                                    682 	LDW Y,(Y)
                                    683         LDW (X),Y
                                    684         LDW Y,YTEMP
                                    685 	JP (2,Y)
                                    686 .endif 
                                    687 
                                    688 ;       next    ( -- )
                                    689 ;       Code for  single index loop.
      008376 83 63                  690         .word      LINK
                           0002F8   691 LINK	= 	.
      008378 44                     692 	.byte      COMPO+4
      008379 4E 45 58 54            693         .ascii     "NEXT"
      00837D                        694 DONXT:
      00837D 16 03            [ 2]  695 	LDW Y,(3,SP)
      00837F 90 5A            [ 2]  696 	DECW Y
      008381 2A 07            [ 1]  697 	JRPL NEX1 ; jump if N=0
      008383 90 85            [ 2]  698 	POPW Y
                           000001   699 .if PICATOUT_MOD
      008385 5B 02            [ 2]  700         addw sp,#2
                           000000   701 .else        
                                    702 	POP A
                                    703 	POP A
                                    704 .endif         
      008387 90 EC 02         [ 2]  705         JP (2,Y)
      00838A                        706 NEX1:
      00838A 17 03            [ 2]  707         LDW (3,SP),Y
      00838C 90 85            [ 2]  708         POPW Y
      00838E 90 FE            [ 2]  709 	LDW Y,(Y)
      008390 90 FC            [ 2]  710 	JP (Y)
                                    711 
                                    712 ;       ?branch ( f -- )
                                    713 ;       Branch if flag is zero.
      008392 83 78                  714         .word      LINK
                           000314   715 LINK	= 	.
      008394 47                     716 	.byte      COMPO+7
      008395 3F 42 52 41 4E 43 48   717         .ascii     "?BRANCH"
      00839C                        718 QBRAN:	
      00839C 90 93            [ 1]  719         LDW Y,X
      00839E 1C 00 02         [ 2]  720 	ADDW X,#2
      0083A1 90 FE            [ 2]  721 	LDW Y,(Y)
      0083A3 27 0E            [ 1]  722         JREQ     BRAN
      0083A5 90 85            [ 2]  723 	POPW Y
      0083A7 90 EC 02         [ 2]  724 	JP (2,Y)
                                    725         
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 15.
Hexadecimal [24-Bits]



                                    726 ;       branch  ( -- )
                                    727 ;       Branch to an inline address.
      0083AA 83 94                  728         .word      LINK
                           00032C   729 LINK	= 	.
      0083AC 46                     730 	.byte      COMPO+6
      0083AD 42 52 41 4E 43 48      731         .ascii     "BRANCH"
      0083B3                        732 BRAN:
      0083B3 90 85            [ 2]  733         POPW Y
      0083B5 90 FE            [ 2]  734 	LDW Y,(Y)
      0083B7 90 FC            [ 2]  735         JP     (Y)
                                    736 
                                    737 ;       EXECUTE ( ca -- )
                                    738 ;       Execute  word at ca.
      0083B9 83 AC                  739         .word      LINK
                           00033B   740 LINK	= 	.
      0083BB 07                     741         .byte       7
      0083BC 45 58 45 43 55 54 45   742         .ascii     "EXECUTE"
      0083C3                        743 EXECU:
      0083C3 90 93            [ 1]  744         LDW Y,X
      0083C5 1C 00 02         [ 2]  745 	ADDW X,#2
      0083C8 90 FE            [ 2]  746 	LDW  Y,(Y)
      0083CA 90 FC            [ 2]  747         JP   (Y)
                                    748 
                                    749 ;       EXIT    ( -- )
                                    750 ;       Terminate a colon definition.
      0083CC 83 BB                  751         .word      LINK
                           00034E   752 LINK = .
      0083CE 04                     753         .byte      4
      0083CF 45 58 49 54            754         .ascii     "EXIT"
      0083D3                        755 EXIT:
      0083D3 90 85            [ 2]  756         POPW Y
      0083D5 81               [ 4]  757         RET
                                    758 
                                    759 ;       !       ( w a -- )
                                    760 ;       Pop  data stack to memory.
      0083D6 83 CE                  761         .word      LINK
                           000358   762 LINK = .
      0083D8 01                     763         .byte      1
      0083D9 21                     764         .ascii     "!"
      0083DA                        765 STORE:
      0083DA 90 93            [ 1]  766         LDW Y,X
      0083DC 90 FE            [ 2]  767         LDW Y,(Y)    ;Y=a
      0083DE 90 BF 22         [ 2]  768         LDW YTEMP,Y
      0083E1 90 93            [ 1]  769         LDW Y,X
      0083E3 90 EE 02         [ 2]  770         LDW Y,(2,Y)
      0083E6 91 CF 22         [ 5]  771         LDW [YTEMP],Y ;store w at a
      0083E9 1C 00 04         [ 2]  772         ADDW X,#4 ; DDROP 
      0083EC 81               [ 4]  773         RET     
                                    774 
                                    775 ;       @       ( a -- w )
                                    776 ;       Push memory location to stack.
      0083ED 83 D8                  777         .word      LINK
                           00036F   778 LINK	= 	.
      0083EF 01                     779         .byte    1
      0083F0 40                     780         .ascii	"@"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 16.
Hexadecimal [24-Bits]



      0083F1                        781 AT:
      0083F1 90 93            [ 1]  782         LDW Y,X     ;Y = a
      0083F3 90 FE            [ 2]  783         LDW Y,(Y)   ; address 
      0083F5 90 FE            [ 2]  784         LDW Y,(Y)   ; value 
      0083F7 FF               [ 2]  785         LDW (X),Y ;w = @Y
      0083F8 81               [ 4]  786         RET     
                                    787 
                                    788 ;       C!      ( c b -- )
                                    789 ;       Pop  data stack to byte memory.
      0083F9 83 EF                  790         .word      LINK
                           00037B   791 LINK	= .
      0083FB 02                     792         .byte      2
      0083FC 43 21                  793         .ascii     "C!"
      0083FE                        794 CSTOR:
      0083FE 90 93            [ 1]  795         LDW Y,X
      008400 90 FE            [ 2]  796 	LDW Y,(Y)    ;Y=b
      008402 E6 03            [ 1]  797         LD A,(3,X)    ;D = c
      008404 90 F7            [ 1]  798         LD  (Y),A     ;store c at b
      008406 1C 00 04         [ 2]  799 	ADDW X,#4 ; DDROP 
      008409 81               [ 4]  800         RET     
                                    801 
                                    802 ;       C@      ( b -- c )
                                    803 ;       Push byte in memory to  stack.
      00840A 83 FB                  804         .word      LINK
                           00038C   805 LINK	= 	.
      00840C 02                     806         .byte      2
      00840D 43 40                  807         .ascii     "C@"
      00840F                        808 CAT:
      00840F 90 93            [ 1]  809         LDW Y,X     ;Y=b
      008411 90 FE            [ 2]  810         LDW Y,(Y)
      008413 90 F6            [ 1]  811         LD A,(Y)
      008415 E7 01            [ 1]  812         LD (1,X),A
      008417 7F               [ 1]  813         CLR (X)
      008418 81               [ 4]  814         RET     
                                    815 
                                    816 ;       RP@     ( -- a )
                                    817 ;       Push current RP to data stack.
      008419 84 0C                  818         .word      LINK
                           00039B   819 LINK	= .
      00841B 03                     820         .byte      3
      00841C 52 50 40               821         .ascii     "RP@"
      00841F                        822 RPAT:
      00841F 90 96            [ 1]  823         LDW Y,SP    ;save return addr
      008421 1D 00 02         [ 2]  824         SUBW X,#2
      008424 FF               [ 2]  825         LDW (X),Y
      008425 81               [ 4]  826         RET     
                                    827 
                                    828 ;       RP!     ( a -- )
                                    829 ;       Set  return stack pointer.
      008426 84 1B                  830         .word      LINK
                           0003A8   831 LINK	= 	. 
      008428 43                     832 	.byte      COMPO+3
      008429 52 50 21               833         .ascii     "RP!"
      00842C                        834 RPSTO:
      00842C 90 85            [ 2]  835         POPW Y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 17.
Hexadecimal [24-Bits]



      00842E 90 BF 22         [ 2]  836         LDW YTEMP,Y
      008431 90 93            [ 1]  837         LDW Y,X
      008433 90 FE            [ 2]  838         LDW Y,(Y)
      008435 90 94            [ 1]  839         LDW SP,Y
      008437 1C 00 02         [ 2]  840         ADDW x,#CELLL ; a was not dropped, Picatout 2020-05-24
      00843A 92 CC 22         [ 5]  841         JP [YTEMP]
                                    842 
                                    843 ;       R>      ( -- w )
                                    844 ;       Pop return stack to data stack.
      00843D 84 28                  845         .word      LINK
                           0003BF   846 LINK	= 	. 
      00843F 42                     847 	.byte      COMPO+2
      008440 52 3E                  848         .ascii     "R>"
      008442                        849 RFROM:
      008442 90 85            [ 2]  850         POPW Y    ;save return addr
      008444 90 BF 22         [ 2]  851         LDW YTEMP,Y
      008447 90 85            [ 2]  852         POPW Y
      008449 1D 00 02         [ 2]  853         SUBW X,#2
      00844C FF               [ 2]  854         LDW (X),Y
      00844D 92 CC 22         [ 5]  855         JP [YTEMP]
                                    856 
                                    857 ;       R@      ( -- w )
                                    858 ;       Copy top of return stack to stack.
      008450 84 3F                  859         .word      LINK
                           0003D2   860 LINK	= 	. 
      008452 02                     861         .byte      2
      008453 52 40                  862         .ascii     "R@"
      008455                        863 RAT:
                           000001   864 .if PICATOUT_MOD
      008455 16 03            [ 2]  865         ldw y,(3,sp)
      008457 1D 00 02         [ 2]  866         subw x,#CELLL 
      00845A FF               [ 2]  867         ldw (x),y 
      00845B 81               [ 4]  868         ret 
                           000000   869 .else 
                                    870         POPW Y
                                    871         LDW YTEMP,Y
                                    872         POPW Y
                                    873         PUSHW Y
                                    874         SUBW X,#2
                                    875         LDW (X),Y
                                    876         JP [YTEMP]
                                    877 .endif         
                                    878 
                                    879 ;       >R      ( w -- )
                                    880 ;       Push data stack to return stack.
      00845C 84 52                  881         .word      LINK
                           0003DE   882 LINK	= 	. 
      00845E 42                     883 	.byte      COMPO+2
      00845F 3E 52                  884         .ascii     ">R"
      008461                        885 TOR:
      008461 90 85            [ 2]  886         POPW Y    ;save return addr
      008463 90 BF 22         [ 2]  887         LDW YTEMP,Y
      008466 90 93            [ 1]  888         LDW Y,X
      008468 90 FE            [ 2]  889         LDW Y,(Y)
      00846A 90 89            [ 2]  890         PUSHW Y    ;restore return addr
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
Hexadecimal [24-Bits]



      00846C 1C 00 02         [ 2]  891         ADDW X,#2
      00846F 92 CC 22         [ 5]  892         JP [YTEMP]
                                    893 
                                    894 ;       SP@     ( -- a )
                                    895 ;       Push current stack pointer.
      008472 84 5E                  896         .word      LINK
                           0003F4   897 LINK	= 	. 
      008474 03                     898         .byte      3
      008475 53 50 40               899         .ascii     "SP@"
      008478                        900 SPAT:
      008478 90 93            [ 1]  901 	LDW Y,X
      00847A 1D 00 02         [ 2]  902         SUBW X,#2
      00847D FF               [ 2]  903 	LDW (X),Y
      00847E 81               [ 4]  904         RET     
                                    905 
                                    906 ;       SP!     ( a -- )
                                    907 ;       Set  data stack pointer.
      00847F 84 74                  908         .word      LINK
                           000401   909 LINK	= 	. 
      008481 03                     910         .byte      3
      008482 53 50 21               911         .ascii     "SP!"
      008485                        912 SPSTO:
      008485 FE               [ 2]  913         LDW     X,(X)     ;X = a
      008486 81               [ 4]  914         RET     
                                    915 
                                    916 ;       DROP    ( w -- )
                                    917 ;       Discard top stack item.
      008487 84 81                  918         .word      LINK
                           000409   919 LINK	= 	. 
      008489 04                     920         .byte      4
      00848A 44 52 4F 50            921         .ascii     "DROP"
      00848E                        922 DROP:
      00848E 1C 00 02         [ 2]  923         ADDW X,#2     
      008491 81               [ 4]  924         RET     
                                    925 
                                    926 ;       DUP     ( w -- w w )
                                    927 ;       Duplicate  top stack item.
      008492 84 89                  928         .word      LINK
                           000414   929 LINK	= 	. 
      008494 03                     930         .byte      3
      008495 44 55 50               931         .ascii     "DUP"
      008498                        932 DUPP:
      008498 90 93            [ 1]  933 	LDW Y,X
      00849A 1D 00 02         [ 2]  934         SUBW X,#2
      00849D 90 FE            [ 2]  935 	LDW Y,(Y)
      00849F FF               [ 2]  936 	LDW (X),Y
      0084A0 81               [ 4]  937         RET     
                                    938 
                                    939 ;       SWAP    ( w1 w2 -- w2 w1 )
                                    940 ;       Exchange top two stack items.
      0084A1 84 94                  941         .word      LINK
                           000423   942 LINK	= 	. 
      0084A3 04                     943         .byte      4
      0084A4 53 57 41 50            944         .ascii     "SWAP"
      0084A8                        945 SWAPP:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]



      0084A8 90 93            [ 1]  946         LDW Y,X
      0084AA 90 FE            [ 2]  947         LDW Y,(Y)
      0084AC 90 BF 22         [ 2]  948         LDW YTEMP,Y
      0084AF 90 93            [ 1]  949         LDW Y,X
      0084B1 90 EE 02         [ 2]  950         LDW Y,(2,Y)
      0084B4 FF               [ 2]  951         LDW (X),Y
      0084B5 90 BE 22         [ 2]  952         LDW Y,YTEMP
      0084B8 EF 02            [ 2]  953         LDW (2,X),Y
      0084BA 81               [ 4]  954         RET     
                                    955 
                                    956 ;       OVER    ( w1 w2 -- w1 w2 w1 )
                                    957 ;       Copy second stack item to top.
      0084BB 84 A3                  958         .word      LINK
                           00043D   959 LINK	= . 
      0084BD 04                     960         .byte      4
      0084BE 4F 56 45 52            961         .ascii     "OVER"
      0084C2                        962 OVER:
      0084C2 1D 00 02         [ 2]  963         SUBW X,#2
      0084C5 90 93            [ 1]  964         LDW Y,X
      0084C7 90 EE 04         [ 2]  965         LDW Y,(4,Y)
      0084CA FF               [ 2]  966         LDW (X),Y
      0084CB 81               [ 4]  967         RET     
                                    968 
                                    969 ;       0<      ( n -- t )
                                    970 ;       Return true if n is negative.
      0084CC 84 BD                  971         .word      LINK
                           00044E   972 LINK	= . 
      0084CE 02                     973         .byte      2
      0084CF 30 3C                  974         .ascii     "0<"
      0084D1                        975 ZLESS:
      0084D1 A6 FF            [ 1]  976         LD A,#0xFF
      0084D3 90 93            [ 1]  977         LDW Y,X
      0084D5 90 FE            [ 2]  978         LDW Y,(Y)
      0084D7 2B 01            [ 1]  979         JRMI     ZL1
      0084D9 4F               [ 1]  980         CLR A   ;false
      0084DA F7               [ 1]  981 ZL1:    LD     (X),A
      0084DB E7 01            [ 1]  982         LD (1,X),A
      0084DD 81               [ 4]  983 	RET     
                                    984 
                                    985 ;       AND     ( w w -- w )
                                    986 ;       Bitwise AND.
      0084DE 84 CE                  987         .word      LINK
                           000460   988 LINK	= . 
      0084E0 03                     989         .byte      3
      0084E1 41 4E 44               990         .ascii     "AND"
      0084E4                        991 ANDD:
      0084E4 F6               [ 1]  992         LD  A,(X)    ;D=w
      0084E5 E4 02            [ 1]  993         AND A,(2,X)
      0084E7 E7 02            [ 1]  994         LD (2,X),A
      0084E9 E6 01            [ 1]  995         LD A,(1,X)
      0084EB E4 03            [ 1]  996         AND A,(3,X)
      0084ED E7 03            [ 1]  997         LD (3,X),A
      0084EF 1C 00 02         [ 2]  998         ADDW X,#2
      0084F2 81               [ 4]  999         RET
                                   1000 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]



                                   1001 ;       OR      ( w w -- w )
                                   1002 ;       Bitwise inclusive OR.
      0084F3 84 E0                 1003         .word      LINK
                           000475  1004 LINK = . 
      0084F5 02                    1005         .byte      2
      0084F6 4F 52                 1006         .ascii     "OR"
      0084F8                       1007 ORR:
      0084F8 F6               [ 1] 1008         LD A,(X)    ;D=w
      0084F9 EA 02            [ 1] 1009         OR A,(2,X)
      0084FB E7 02            [ 1] 1010         LD (2,X),A
      0084FD E6 01            [ 1] 1011         LD A,(1,X)
      0084FF EA 03            [ 1] 1012         OR A,(3,X)
      008501 E7 03            [ 1] 1013         LD (3,X),A
      008503 1C 00 02         [ 2] 1014         ADDW X,#2
      008506 81               [ 4] 1015         RET
                                   1016 
                                   1017 ;       XOR     ( w w -- w )
                                   1018 ;       Bitwise exclusive OR.
      008507 84 F5                 1019         .word      LINK
                           000489  1020 LINK	= . 
      008509 03                    1021         .byte      3
      00850A 58 4F 52              1022         .ascii     "XOR"
      00850D                       1023 XORR:
      00850D F6               [ 1] 1024         LD A,(X)    ;D=w
      00850E E8 02            [ 1] 1025         XOR A,(2,X)
      008510 E7 02            [ 1] 1026         LD (2,X),A
      008512 E6 01            [ 1] 1027         LD A,(1,X)
      008514 E8 03            [ 1] 1028         XOR A,(3,X)
      008516 E7 03            [ 1] 1029         LD (3,X),A
      008518 1C 00 02         [ 2] 1030         ADDW X,#2
      00851B 81               [ 4] 1031         RET
                                   1032 
                                   1033 ;       UM+     ( u u -- udsum )
                                   1034 ;       Add two unsigned single
                                   1035 ;       and return a double sum.
      00851C 85 09                 1036         .word      LINK
                           00049E  1037 LINK	= . 
      00851E 03                    1038         .byte      3
      00851F 55 4D 2B              1039         .ascii     "UM+"
      008522                       1040 UPLUS:
      008522 A6 01            [ 1] 1041         LD A,#1
      008524 90 93            [ 1] 1042         LDW Y,X
      008526 90 EE 02         [ 2] 1043         LDW Y,(2,Y)
      008529 90 BF 22         [ 2] 1044         LDW YTEMP,Y
      00852C 90 93            [ 1] 1045         LDW Y,X
      00852E 90 FE            [ 2] 1046         LDW Y,(Y)
      008530 72 B9 00 22      [ 2] 1047         ADDW Y,YTEMP
      008534 EF 02            [ 2] 1048         LDW (2,X),Y
      008536 25 01            [ 1] 1049         JRC     UPL1
      008538 4F               [ 1] 1050         CLR A
      008539 E7 01            [ 1] 1051 UPL1:   LD     (1,X),A
      00853B 7F               [ 1] 1052         CLR (X)
      00853C 81               [ 4] 1053         RET
                                   1054 
                                   1055 ;; System and user variables
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



                                   1056 
                                   1057 ;       doVAR   ( -- a )
                                   1058 ;       Code for VARIABLE and CREATE.
      00853D 85 1E                 1059         .word      LINK
                           0004BF  1060 LINK	= . 
      00853F 45                    1061 	.byte      COMPO+5
      008540 44 4F 56 41 52        1062         .ascii     "DOVAR"
      008545                       1063 DOVAR:
      008545 1D 00 02         [ 2] 1064 	SUBW X,#2
      008548 90 85            [ 2] 1065         POPW Y    ;get return addr (pfa)
                           000001  1066 .if PICATOUT_MOD
      00854A 90 FE            [ 2] 1067         LDW Y,(Y) ; indirect address 
                                   1068 .endif ;PICATOUT_MOD        
      00854C FF               [ 2] 1069         LDW (X),Y    ;push on stack
      00854D 81               [ 4] 1070         RET     ;go to RET of EXEC
                                   1071 
                                   1072 ;       BASE    ( -- a )
                                   1073 ;       Radix base for numeric I/O.
      00854E 85 3F                 1074         .word      LINK        
                           0004D0  1075 LINK = . 
      008550 04                    1076         .byte      4
      008551 42 41 53 45           1077         .ascii     "BASE"
      008555                       1078 BASE:
      008555 90 AE 00 06      [ 2] 1079 	LDW Y,#UBASE 
      008559 1D 00 02         [ 2] 1080 	SUBW X,#2
      00855C FF               [ 2] 1081         LDW (X),Y
      00855D 81               [ 4] 1082         RET
                                   1083 
                                   1084 ;       tmp     ( -- a )
                                   1085 ;       A temporary storage.
      00855E 85 50                 1086         .word      LINK
                                   1087         
                           0004E0  1088 LINK = . 
      008560 03                    1089 	.byte      3
      008561 54 4D 50              1090         .ascii     "TMP"
      008564                       1091 TEMP:
      008564 90 AE 00 08      [ 2] 1092 	LDW Y,#UTMP
      008568 1D 00 02         [ 2] 1093 	SUBW X,#2
      00856B FF               [ 2] 1094         LDW (X),Y
      00856C 81               [ 4] 1095         RET
                                   1096 
                                   1097 ;       >IN     ( -- a )
                                   1098 ;        Hold parsing pointer.
      00856D 85 60                 1099         .word      LINK
                           0004EF  1100 LINK = . 
      00856F 03                    1101         .byte      3
      008570 3E 49 4E              1102         .ascii    ">IN"
      008573                       1103 INN:
      008573 90 AE 00 0A      [ 2] 1104 	LDW Y,#UINN 
      008577 1D 00 02         [ 2] 1105 	SUBW X,#2
      00857A FF               [ 2] 1106         LDW (X),Y
      00857B 81               [ 4] 1107         RET
                                   1108 
                                   1109 ;       #TIB    ( -- a )
                                   1110 ;       Count in terminal input buffer.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]



      00857C 85 6F                 1111         .word      LINK
                           0004FE  1112 LINK = . 
      00857E 04                    1113         .byte      4
      00857F 23 54 49 42           1114         .ascii     "#TIB"
      008583                       1115 NTIB:
      008583 90 AE 00 0C      [ 2] 1116 	LDW Y,#UCTIB 
      008587 1D 00 02         [ 2] 1117 	SUBW X,#2
      00858A FF               [ 2] 1118         LDW (X),Y
      00858B 81               [ 4] 1119         RET
                                   1120 
                           000001  1121 .if PICATOUT_MOD
                                   1122 ;       TBUF ( -- a )
                                   1123 ;       address of 128 bytes transaction buffer 
      00858C 85 7E                 1124         .word LINK 
                           00050E  1125         LINK=.
      00858E 04                    1126         .byte 4 
      00858F 54 42 55 46           1127         .ascii "TBUF"
      008593                       1128 TBUF:
      008593 90 AE 16 80      [ 2] 1129         ldw y,#ROWBUFF
      008597 1D 00 02         [ 2] 1130         subw x,#CELLL
      00859A FF               [ 2] 1131         ldw (x),y 
      00859B 81               [ 4] 1132         ret 
                                   1133 
                                   1134 ; systeme variable 
                                   1135 ; compilation destination 
                                   1136 ; TFLASH ( -- A )
      00859C 85 8E                 1137         .word LINK 
                           00051E  1138         LINK=.
      00859E 06                    1139         .byte 6 
      00859F 54 46 4C 41 53 48     1140         .ascii "TFLASH"         
      0085A5                       1141 TFLASH:
      0085A5 1D 00 02         [ 2] 1142         subw x,#CELLL 
      0085A8 90 AE 00 1E      [ 2] 1143         ldw y,#UTFLASH
      0085AC FF               [ 2] 1144         ldw (x),y 
      0085AD 81               [ 4] 1145         ret 
                                   1146 
                                   1147 .endif ;PICATOUT_MOD
                                   1148 
                                   1149 ;       "EVAL   ( -- a )
                                   1150 ;       Execution vector of EVAL.
      0085AE 85 9E                 1151         .word      LINK
                           000530  1152 LINK = . 
      0085B0 05                    1153         .byte      5
      0085B1 27 45 56 41 4C        1154         .ascii     "'EVAL"
      0085B6                       1155 TEVAL:
      0085B6 90 AE 00 10      [ 2] 1156 	LDW Y,#UINTER 
      0085BA 1D 00 02         [ 2] 1157 	SUBW X,#2
      0085BD FF               [ 2] 1158         LDW (X),Y
      0085BE 81               [ 4] 1159         RET
                                   1160 
                                   1161 ;       HLD     ( -- a )
                                   1162 ;       Hold a pointer of output string.
      0085BF 85 B0                 1163         .word      LINK
                           000541  1164 LINK = . 
      0085C1 03                    1165         .byte      3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



      0085C2 48 4C 44              1166         .ascii     "HLD"
      0085C5                       1167 HLD:
      0085C5 90 AE 00 12      [ 2] 1168 	LDW Y,#UHLD 
      0085C9 1D 00 02         [ 2] 1169 	SUBW X,#2
      0085CC FF               [ 2] 1170         LDW (X),Y
      0085CD 81               [ 4] 1171         RET
                                   1172 
                                   1173 ;       CONTEXT ( -- a )
                                   1174 ;       Start vocabulary search.
      0085CE 85 C1                 1175         .word      LINK
                           000550  1176 LINK = . 
      0085D0 07                    1177         .byte      7
      0085D1 43 4F 4E 54 45 58 54  1178         .ascii     "CONTEXT"
      0085D8                       1179 CNTXT:
      0085D8 90 AE 00 14      [ 2] 1180 	LDW Y,#UCNTXT
      0085DC 1D 00 02         [ 2] 1181 	SUBW X,#2
      0085DF FF               [ 2] 1182         LDW (X),Y
      0085E0 81               [ 4] 1183         RET
                                   1184 
                                   1185 ;       VP      ( -- a )
                                   1186 ;       Point to top of variables
      0085E1 85 D0                 1187         .word      LINK
                           000563  1188 LINK = . 
      0085E3 02                    1189         .byte      2
      0085E4 56 50                 1190         .ascii     "VP"
      0085E6                       1191 VPP:
      0085E6 90 AE 00 16      [ 2] 1192 	LDW Y,#UVP 
      0085EA 1D 00 02         [ 2] 1193 	SUBW X,#2
      0085ED FF               [ 2] 1194         LDW (X),Y
      0085EE 81               [ 4] 1195         RET
                                   1196 
                           000001  1197 .if PICATOUT_MOD
                                   1198 ;       CP    ( -- a )
                                   1199 ;       Pointer to top of FLASH 
      0085EF 85 E3                 1200         .word LINK 
                           000571  1201         LINK=.
      0085F1 03                    1202         .byte 3 
      0085F2 43 50                 1203         .ascii "CP"
      0085F4                       1204 CPP: 
      0085F4 90 AE 00 18      [ 2] 1205         ldw y,#UCP 
      0085F8 1D 00 02         [ 2] 1206         subw x,#CELLL 
      0085FB FF               [ 2] 1207         ldw (x),y 
      0085FC 81               [ 4] 1208         ret                
                                   1209 .endif ;PICATOUT_MOD
                                   1210 
                                   1211 ;       LAST    ( -- a )
                                   1212 ;       Point to last name in dictionary.
      0085FD 85 F1                 1213         .word      LINK
                           00057F  1214 LINK = . 
      0085FF 04                    1215         .byte      4
      008600 4C 41 53 54           1216         .ascii     "LAST"
      008604                       1217 LAST:
      008604 90 AE 00 1A      [ 2] 1218 	LDW Y,#ULAST 
      008608 1D 00 02         [ 2] 1219 	SUBW X,#2
      00860B FF               [ 2] 1220         LDW (X),Y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]



      00860C 81               [ 4] 1221         RET
                                   1222 
                           000001  1223 .if PICATOUT_MOD
      00860D 85 FF                 1224         .word LINK 
                           00058F  1225         LINK=.
      00860F 06                    1226         .byte 6
      008610 4F 46 46 53 45 54     1227         .ascii "OFFSET" 
      008616                       1228 OFFSET: 
      008616 1D 00 02         [ 2] 1229         subw x,#CELLL
      008619 90 AE 00 1C      [ 2] 1230         ldw y,#UOFFSET 
      00861D FF               [ 2] 1231         ldw (x),y 
      00861E 81               [ 4] 1232         ret 
                                   1233 
                                   1234 ; adjust jump address adding OFFSET
                                   1235 ; ADR-ADJ ( a -- a+offset )
      00861F                       1236 ADRADJ: 
      00861F CD 86 16         [ 4] 1237         call OFFSET 
      008622 CD 83 F1         [ 4] 1238         call AT 
      008625 CC 86 80         [ 2] 1239         jp PLUS 
                                   1240 
                                   1241 .endif ; PICATOUT_MOD
                                   1242 
                                   1243 ;; Common functions
                                   1244 
                                   1245 ;       ?DUP    ( w -- w w | 0 )
                                   1246 ;       Dup tos if its is not zero.
      008628 86 0F                 1247         .word      LINK
                           0005AA  1248 LINK = . 
      00862A 04                    1249         .byte      4
      00862B 3F 44 55 50           1250         .ascii     "?DUP"
      00862F                       1251 QDUP:
      00862F 90 93            [ 1] 1252         LDW Y,X
      008631 90 FE            [ 2] 1253 	LDW Y,(Y)
      008633 27 04            [ 1] 1254         JREQ     QDUP1
      008635 1D 00 02         [ 2] 1255 	SUBW X,#2
      008638 FF               [ 2] 1256         LDW (X),Y
      008639 81               [ 4] 1257 QDUP1:  RET
                                   1258 
                                   1259 ;       ROT     ( w1 w2 w3 -- w2 w3 w1 )
                                   1260 ;       Rot 3rd item to top.
      00863A 86 2A                 1261         .word      LINK
                           0005BC  1262 LINK = . 
      00863C 03                    1263         .byte      3
      00863D 52 4F 54              1264         .ascii     "ROT"
      008640                       1265 ROT:
                           000001  1266 .if PICATOUT_MOD
      008640 90 93            [ 1] 1267         ldw y,x 
      008642 90 FE            [ 2] 1268         ldw y,(y)
      008644 90 89            [ 2] 1269         pushw y 
      008646 90 93            [ 1] 1270         ldw y,x 
      008648 90 EE 04         [ 2] 1271         ldw y,(4,y)
      00864B FF               [ 2] 1272         ldw (x),y 
      00864C 90 93            [ 1] 1273         ldw y,x 
      00864E 90 EE 02         [ 2] 1274         ldw y,(2,y)
      008651 EF 04            [ 2] 1275         ldw (4,x),y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



      008653 90 85            [ 2] 1276         popw y 
      008655 EF 02            [ 2] 1277         ldw (2,x),y
      008657 81               [ 4] 1278         ret 
                           000000  1279 .else 
                                   1280         LDW Y,X
                                   1281 	LDW Y,(4,Y)
                                   1282 	LDW YTEMP,Y
                                   1283         LDW Y,X
                                   1284         LDW Y,(2,Y)
                                   1285         LDW XTEMP,Y
                                   1286         LDW Y,X
                                   1287         LDW Y,(Y)
                                   1288         LDW (2,X),Y
                                   1289         LDW Y,XTEMP
                                   1290         LDW (4,X),Y
                                   1291         LDW Y,YTEMP
                                   1292         LDW (X),Y
                                   1293         RET
                                   1294 .endif 
                                   1295 
                                   1296 ;       2DROP   ( w w -- )
                                   1297 ;       Discard two items on stack.
      008658 86 3C                 1298         .word      LINK
                           0005DA  1299 LINK = . 
      00865A 05                    1300         .byte      5
      00865B 32 44 52 4F 50        1301         .ascii     "2DROP"
      008660                       1302 DDROP:
      008660 1C 00 04         [ 2] 1303         ADDW X,#4
      008663 81               [ 4] 1304         RET
                                   1305 
                                   1306 ;       2DUP    ( w1 w2 -- w1 w2 w1 w2 )
                                   1307 ;       Duplicate top two items.
      008664 86 5A                 1308         .word      LINK
                           0005E6  1309 LINK = . 
      008666 04                    1310         .byte      4
      008667 32 44 55 50           1311         .ascii     "2DUP"
      00866B                       1312 DDUP:
      00866B 1D 00 04         [ 2] 1313         SUBW X,#4
      00866E 90 93            [ 1] 1314         LDW Y,X
      008670 90 EE 06         [ 2] 1315         LDW Y,(6,Y)
      008673 EF 02            [ 2] 1316         LDW (2,X),Y
      008675 90 93            [ 1] 1317         LDW Y,X
      008677 90 EE 04         [ 2] 1318         LDW Y,(4,Y)
      00867A FF               [ 2] 1319         LDW (X),Y
      00867B 81               [ 4] 1320         RET
                                   1321 
                                   1322 ;       +       ( w w -- sum )
                                   1323 ;       Add top two items.
      00867C 86 66                 1324         .word      LINK
                           0005FE  1325 LINK = . 
      00867E 01                    1326         .byte      1
      00867F 2B                    1327         .ascii     "+"
      008680                       1328 PLUS:
      008680 90 93            [ 1] 1329         LDW Y,X
      008682 90 FE            [ 2] 1330         LDW Y,(Y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



      008684 90 BF 22         [ 2] 1331         LDW YTEMP,Y
      008687 1C 00 02         [ 2] 1332         ADDW X,#2
      00868A 90 93            [ 1] 1333         LDW Y,X
      00868C 90 FE            [ 2] 1334         LDW Y,(Y)
      00868E 72 B9 00 22      [ 2] 1335         ADDW Y,YTEMP
      008692 FF               [ 2] 1336         LDW (X),Y
      008693 81               [ 4] 1337         RET
                                   1338 
                                   1339 ;       NOT     ( w -- w )
                                   1340 ;       One's complement of tos.
      008694 86 7E                 1341         .word      LINK
                           000616  1342 LINK = . 
      008696 03                    1343         .byte      3
      008697 4E 4F 54              1344         .ascii     "NOT"
      00869A                       1345 INVER:
      00869A 90 93            [ 1] 1346         LDW Y,X
      00869C 90 FE            [ 2] 1347         LDW Y,(Y)
      00869E 90 53            [ 2] 1348         CPLW Y
      0086A0 FF               [ 2] 1349         LDW (X),Y
      0086A1 81               [ 4] 1350         RET
                                   1351 
                                   1352 ;       NEGATE  ( n -- -n )
                                   1353 ;       Two's complement of tos.
      0086A2 86 96                 1354         .word      LINK
                           000624  1355 LINK = . 
      0086A4 06                    1356         .byte      6
      0086A5 4E 45 47 41 54 45     1357         .ascii     "NEGATE"
      0086AB                       1358 NEGAT:
      0086AB 90 93            [ 1] 1359         LDW Y,X
      0086AD 90 FE            [ 2] 1360         LDW Y,(Y)
      0086AF 90 50            [ 2] 1361         NEGW Y
      0086B1 FF               [ 2] 1362         LDW (X),Y
      0086B2 81               [ 4] 1363         RET
                                   1364 
                                   1365 ;       DNEGATE ( d -- -d )
                                   1366 ;       Two's complement of top double.
      0086B3 86 A4                 1367         .word      LINK
                           000635  1368 LINK = . 
      0086B5 07                    1369         .byte      7
      0086B6 44 4E 45 47 41 54 45  1370         .ascii     "DNEGATE"
      0086BD                       1371 DNEGA:
      0086BD 90 93            [ 1] 1372         LDW Y,X
      0086BF 90 FE            [ 2] 1373 	LDW Y,(Y)
      0086C1 90 53            [ 2] 1374         CPLW Y     
      0086C3 90 BF 22         [ 2] 1375 	LDW YTEMP,Y
      0086C6 90 93            [ 1] 1376         LDW Y,X
      0086C8 90 EE 02         [ 2] 1377         LDW Y,(2,Y)
      0086CB 90 53            [ 2] 1378         CPLW Y
      0086CD 90 5C            [ 2] 1379         INCW Y
      0086CF EF 02            [ 2] 1380         LDW (2,X),Y
      0086D1 90 BE 22         [ 2] 1381         LDW Y,YTEMP
      0086D4 24 02            [ 1] 1382         JRNC DN1 
      0086D6 90 5C            [ 2] 1383         INCW Y
      0086D8 FF               [ 2] 1384 DN1:    LDW (X),Y
      0086D9 81               [ 4] 1385         RET
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal [24-Bits]



                                   1386 
                                   1387 ;       -       ( n1 n2 -- n1-n2 )
                                   1388 ;       Subtraction.
      0086DA 86 B5                 1389         .word      LINK
                           00065C  1390 LINK = . 
      0086DC 01                    1391         .byte      1
      0086DD 2D                    1392         .ascii     "-"
      0086DE                       1393 SUBB:
      0086DE 90 93            [ 1] 1394         LDW Y,X
      0086E0 90 FE            [ 2] 1395         LDW Y,(Y)
      0086E2 90 BF 22         [ 2] 1396         LDW YTEMP,Y
      0086E5 1C 00 02         [ 2] 1397         ADDW X,#2
      0086E8 90 93            [ 1] 1398         LDW Y,X
      0086EA 90 FE            [ 2] 1399         LDW Y,(Y)
      0086EC 72 B2 00 22      [ 2] 1400         SUBW Y,YTEMP
      0086F0 FF               [ 2] 1401         LDW (X),Y
      0086F1 81               [ 4] 1402         RET
                                   1403 
                                   1404 ;       ABS     ( n -- n )
                                   1405 ;       Return  absolute value of n.
      0086F2 86 DC                 1406         .word      LINK
                           000674  1407 LINK = . 
      0086F4 03                    1408         .byte      3
      0086F5 41 42 53              1409         .ascii     "ABS"
      0086F8                       1410 ABSS:
      0086F8 90 93            [ 1] 1411         LDW Y,X
      0086FA 90 FE            [ 2] 1412 	LDW Y,(Y)
      0086FC 2A 03            [ 1] 1413         JRPL     AB1     ;negate:
      0086FE 90 50            [ 2] 1414         NEGW     Y     ;else negate hi byte
      008700 FF               [ 2] 1415         LDW (X),Y
      008701 81               [ 4] 1416 AB1:    RET
                                   1417 
                                   1418 ;       =       ( w w -- t )
                                   1419 ;       Return true if top two are =al.
      008702 86 F4                 1420         .word      LINK
                           000684  1421 LINK = . 
      008704 01                    1422         .byte      1
      008705 3D                    1423         .ascii     "="
      008706                       1424 EQUAL:
      008706 A6 FF            [ 1] 1425         LD A,#0xFF  ;true
      008708 90 93            [ 1] 1426         LDW Y,X    ;D = n2
      00870A 90 FE            [ 2] 1427         LDW Y,(Y)
      00870C 90 BF 22         [ 2] 1428         LDW YTEMP,Y
      00870F 1C 00 02         [ 2] 1429         ADDW X,#2
      008712 90 93            [ 1] 1430         LDW Y,X
      008714 90 FE            [ 2] 1431         LDW Y,(Y)
      008716 90 B3 22         [ 2] 1432         CPW Y,YTEMP     ;if n2 <> n1
      008719 27 01            [ 1] 1433         JREQ     EQ1
      00871B 4F               [ 1] 1434         CLR A
      00871C F7               [ 1] 1435 EQ1:    LD (X),A
      00871D E7 01            [ 1] 1436         LD (1,X),A
      00871F 81               [ 4] 1437 	RET     
                                   1438 
                                   1439 ;       U<      ( u u -- t )
                                   1440 ;       Unsigned compare of top two items.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



      008720 87 04                 1441         .word      LINK
                           0006A2  1442 LINK = . 
      008722 02                    1443         .byte      2
      008723 55 3C                 1444         .ascii     "U<"
      008725                       1445 ULESS:
      008725 A6 FF            [ 1] 1446         LD A,#0xFF  ;true
      008727 90 93            [ 1] 1447         LDW Y,X    ;D = n2
      008729 90 FE            [ 2] 1448         LDW Y,(Y)
      00872B 90 BF 22         [ 2] 1449         LDW YTEMP,Y
      00872E 1C 00 02         [ 2] 1450         ADDW X,#2
      008731 90 93            [ 1] 1451         LDW Y,X
      008733 90 FE            [ 2] 1452         LDW Y,(Y)
      008735 90 B3 22         [ 2] 1453         CPW Y,YTEMP     ;if n2 <> n1
      008738 25 01            [ 1] 1454         JRULT     ULES1
      00873A 4F               [ 1] 1455         CLR A
      00873B F7               [ 1] 1456 ULES1:  LD (X),A
      00873C E7 01            [ 1] 1457         LD (1,X),A
      00873E 81               [ 4] 1458 	RET     
                                   1459 
                                   1460 ;       <       ( n1 n2 -- t )
                                   1461 ;       Signed compare of top two items.
      00873F 87 22                 1462         .word      LINK
                           0006C1  1463 LINK = . 
      008741 01                    1464         .byte      1
      008742 3C                    1465         .ascii     "<"
      008743                       1466 LESS:
      008743 A6 FF            [ 1] 1467         LD A,#0xFF  ;true
      008745 90 93            [ 1] 1468         LDW Y,X    ;D = n2
      008747 90 FE            [ 2] 1469         LDW Y,(Y)
      008749 90 BF 22         [ 2] 1470         LDW YTEMP,Y
      00874C 1C 00 02         [ 2] 1471         ADDW X,#2
      00874F 90 93            [ 1] 1472         LDW Y,X
      008751 90 FE            [ 2] 1473         LDW Y,(Y)
      008753 90 B3 22         [ 2] 1474         CPW Y,YTEMP     ;if n2 <> n1
      008756 2F 01            [ 1] 1475         JRSLT     LT1
      008758 4F               [ 1] 1476         CLR A
      008759 F7               [ 1] 1477 LT1:    LD (X),A
      00875A E7 01            [ 1] 1478         LD (1,X),A
      00875C 81               [ 4] 1479 	RET     
                                   1480 
                                   1481 ;       MAX     ( n n -- n )
                                   1482 ;       Return greater of two top items.
      00875D 87 41                 1483         .word      LINK
                           0006DF  1484 LINK = . 
      00875F 03                    1485         .byte      3
      008760 4D 41 58              1486         .ascii     "MAX"
      008763                       1487 MAX:
      008763 90 93            [ 1] 1488         LDW Y,X    ;D = n2
      008765 90 EE 02         [ 2] 1489         LDW Y,(2,Y)
      008768 90 BF 22         [ 2] 1490         LDW YTEMP,Y
      00876B 90 93            [ 1] 1491         LDW Y,X
      00876D 90 FE            [ 2] 1492         LDW Y,(Y)
      00876F 90 B3 22         [ 2] 1493         CPW Y,YTEMP     ;if n2 <> n1
      008772 2F 02            [ 1] 1494         JRSLT     MAX1
      008774 EF 02            [ 2] 1495         LDW (2,X),Y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



      008776 1C 00 02         [ 2] 1496 MAX1:   ADDW X,#2
      008779 81               [ 4] 1497 	RET     
                                   1498 
                                   1499 ;       MIN     ( n n -- n )
                                   1500 ;       Return smaller of top two items.
      00877A 87 5F                 1501         .word      LINK
                           0006FC  1502 LINK = . 
      00877C 03                    1503         .byte      3
      00877D 4D 49 4E              1504         .ascii     "MIN"
      008780                       1505 MIN:
      008780 90 93            [ 1] 1506         LDW Y,X    ;D = n2
      008782 90 EE 02         [ 2] 1507         LDW Y,(2,Y)
      008785 90 BF 22         [ 2] 1508         LDW YTEMP,Y
      008788 90 93            [ 1] 1509         LDW Y,X
      00878A 90 FE            [ 2] 1510         LDW Y,(Y)
      00878C 90 B3 22         [ 2] 1511         CPW Y,YTEMP     ;if n2 <> n1
      00878F 2C 02            [ 1] 1512         JRSGT     MIN1
      008791 EF 02            [ 2] 1513         LDW (2,X),Y
      008793 1C 00 02         [ 2] 1514 MIN1:	ADDW X,#2
      008796 81               [ 4] 1515 	RET     
                                   1516 
                                   1517 ;       WITHIN  ( u ul uh -- t )
                                   1518 ;       Return true if u is within
                                   1519 ;       range of ul and uh. ( ul <= u < uh )
      008797 87 7C                 1520         .word      LINK
                           000719  1521 LINK = . 
      008799 06                    1522         .byte      6
      00879A 57 49 54 48 49 4E     1523         .ascii     "WITHIN"
      0087A0                       1524 WITHI:
      0087A0 CD 84 C2         [ 4] 1525         CALL     OVER
      0087A3 CD 86 DE         [ 4] 1526         CALL     SUBB
      0087A6 CD 84 61         [ 4] 1527         CALL     TOR
      0087A9 CD 86 DE         [ 4] 1528         CALL     SUBB
      0087AC CD 84 42         [ 4] 1529         CALL     RFROM
      0087AF CC 87 25         [ 2] 1530         JP     ULESS
                                   1531 
                                   1532 ;; Divide
                                   1533 
                                   1534 ;       UM/MOD  ( udl udh un -- ur uq )
                                   1535 ;       Unsigned divide of a double by a
                                   1536 ;       single. Return mod and quotient.
      0087B2 87 99                 1537         .word      LINK
                           000734  1538 LINK = . 
      0087B4 06                    1539         .byte      6
      0087B5 55 4D 2F 4D 4F 44     1540         .ascii     "UM/MOD"
      0087BB                       1541 UMMOD:
      0087BB BF 20            [ 2] 1542 	LDW XTEMP,X	; save stack pointer
      0087BD FE               [ 2] 1543 	LDW X,(X)	; un
      0087BE BF 22            [ 2] 1544 	LDW YTEMP,X     ; save un
      0087C0 90 BE 20         [ 2] 1545 	LDW Y,XTEMP	; stack pointer
      0087C3 90 EE 04         [ 2] 1546 	LDW Y,(4,Y)     ; Y=udl
      0087C6 BE 20            [ 2] 1547 	LDW X,XTEMP
      0087C8 EE 02            [ 2] 1548 	LDW X,(2,X)	; X=udh
      0087CA B3 22            [ 2] 1549 	CPW X,YTEMP
      0087CC 23 0F            [ 2] 1550 	JRULE MMSM1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



      0087CE BE 20            [ 2] 1551 	LDW X,XTEMP
      0087D0 1C 00 02         [ 2] 1552 	ADDW X,#2	; pop off 1 level
      0087D3 90 AE FF FF      [ 2] 1553 	LDW Y,#0xFFFF
      0087D7 FF               [ 2] 1554 	LDW (X),Y
      0087D8 90 5F            [ 1] 1555 	CLRW Y
      0087DA EF 02            [ 2] 1556 	LDW (2,X),Y
      0087DC 81               [ 4] 1557 	RET
      0087DD                       1558 MMSM1:
                           000001  1559 .if  PICATOUT_MOD 
                                   1560 ; take advantage of divw x,y when udh==0
      0087DD 5D               [ 2] 1561         tnzw x  ; is udh==0?
      0087DE 26 11            [ 1] 1562         jrne MMSM2 
      0087E0 93               [ 1] 1563         ldw x,y    ;udl 
      0087E1 90 BE 22         [ 2] 1564         ldw y,YTEMP ; divisor 
      0087E4 65               [ 2] 1565         divw x,y 
      0087E5 89               [ 2] 1566         pushw x     ; quotient 
      0087E6 BE 20            [ 2] 1567         ldw x,XTEMP 
      0087E8 1C 00 02         [ 2] 1568         addw x,#CELLL 
      0087EB EF 02            [ 2] 1569         ldw (2,x),y  ; ur
      0087ED 90 85            [ 2] 1570         popw y 
      0087EF FF               [ 2] 1571         ldw (x),y ; uq 
      0087F0 81               [ 4] 1572         ret 
      0087F1                       1573 MMSM2:        
                                   1574 .endif 
      0087F1 A6 11            [ 1] 1575 	LD A,#17	; loop count
      0087F3                       1576 MMSM3:
      0087F3 B3 22            [ 2] 1577 	CPW X,YTEMP	; compare udh to un
      0087F5 25 04            [ 1] 1578 	JRULT MMSM4	; can't subtract
      0087F7 72 B0 00 22      [ 2] 1579 	SUBW X,YTEMP	; can subtract
      0087FB                       1580 MMSM4:
      0087FB 8C               [ 1] 1581 	CCF	; quotient bit
      0087FC 90 59            [ 2] 1582 	RLCW Y	; rotate into quotient
      0087FE 59               [ 2] 1583 	RLCW X	; rotate into remainder
      0087FF 4A               [ 1] 1584 	DEC A	; repeat
      008800 22 F1            [ 1] 1585 	JRUGT MMSM3
      008802 57               [ 2] 1586 	SRAW X
      008803 BF 22            [ 2] 1587 	LDW YTEMP,X	; done, save remainder
      008805 BE 20            [ 2] 1588 	LDW X,XTEMP
      008807 1C 00 02         [ 2] 1589 	ADDW X,#2	; drop
      00880A FF               [ 2] 1590 	LDW (X),Y
      00880B 90 BE 22         [ 2] 1591 	LDW Y,YTEMP	; save quotient
      00880E EF 02            [ 2] 1592 	LDW (2,X),Y
      008810 81               [ 4] 1593 	RET
                                   1594 	
                                   1595 ;       M/MOD   ( d n -- r q )
                                   1596 ;       Signed floored divide of double by
                                   1597 ;       single. Return mod and quotient.
      008811 87 B4                 1598         .word      LINK
                           000793  1599 LINK = . 
      008813 05                    1600         .byte      5
      008814 4D 2F 4D 4F 44        1601         .ascii     "M/MOD"
      008819                       1602 MSMOD:  
      008819 CD 84 98         [ 4] 1603         CALL	DUPP
      00881C CD 84 D1         [ 4] 1604         CALL	ZLESS
      00881F CD 84 98         [ 4] 1605         CALL	DUPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



      008822 CD 84 61         [ 4] 1606         CALL	TOR
      008825 CD 83 9C         [ 4] 1607         CALL	QBRAN
      008828 88 36                 1608         .word	MMOD1
      00882A CD 86 AB         [ 4] 1609         CALL	NEGAT
      00882D CD 84 61         [ 4] 1610         CALL	TOR
      008830 CD 86 BD         [ 4] 1611         CALL	DNEGA
      008833 CD 84 42         [ 4] 1612         CALL	RFROM
      008836 CD 84 61         [ 4] 1613 MMOD1:	CALL	TOR
      008839 CD 84 98         [ 4] 1614         CALL	DUPP
      00883C CD 84 D1         [ 4] 1615         CALL	ZLESS
      00883F CD 83 9C         [ 4] 1616         CALL	QBRAN
      008842 88 4A                 1617         .word	MMOD2
      008844 CD 84 55         [ 4] 1618         CALL	RAT
      008847 CD 86 80         [ 4] 1619         CALL	PLUS
      00884A CD 84 42         [ 4] 1620 MMOD2:	CALL	RFROM
      00884D CD 87 BB         [ 4] 1621         CALL	UMMOD
      008850 CD 84 42         [ 4] 1622         CALL	RFROM
      008853 CD 83 9C         [ 4] 1623         CALL	QBRAN
      008856 88 61                 1624         .word	MMOD3
      008858 CD 84 A8         [ 4] 1625         CALL	SWAPP
      00885B CD 86 AB         [ 4] 1626         CALL	NEGAT
      00885E CD 84 A8         [ 4] 1627         CALL	SWAPP
      008861 81               [ 4] 1628 MMOD3:	RET
                                   1629 
                                   1630 ;       /MOD    ( n n -- r q )
                                   1631 ;       Signed divide. Return mod and quotient.
      008862 88 13                 1632         .word      LINK
                           0007E4  1633 LINK = . 
      008864 04                    1634         .byte      4
      008865 2F 4D 4F 44           1635         .ascii     "/MOD"
      008869                       1636 SLMOD:
      008869 CD 84 C2         [ 4] 1637         CALL	OVER
      00886C CD 84 D1         [ 4] 1638         CALL	ZLESS
      00886F CD 84 A8         [ 4] 1639         CALL	SWAPP
      008872 CC 88 19         [ 2] 1640         JP	MSMOD
                                   1641 
                                   1642 ;       MOD     ( n n -- r )
                                   1643 ;       Signed divide. Return mod only.
      008875 88 64                 1644         .word      LINK
                           0007F7  1645 LINK = . 
      008877 03                    1646         .byte      3
      008878 4D 4F 44              1647         .ascii     "MOD"
      00887B                       1648 MODD:
      00887B CD 88 69         [ 4] 1649 	CALL	SLMOD
      00887E CC 84 8E         [ 2] 1650 	JP	DROP
                                   1651 
                                   1652 ;       /       ( n n -- q )
                                   1653 ;       Signed divide. Return quotient only.
      008881 88 77                 1654         .word      LINK
                           000803  1655 LINK = . 
      008883 01                    1656         .byte      1
      008884 2F                    1657         .ascii     "/"
      008885                       1658 SLASH:
      008885 CD 88 69         [ 4] 1659         CALL	SLMOD
      008888 CD 84 A8         [ 4] 1660         CALL	SWAPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



      00888B CC 84 8E         [ 2] 1661         JP	DROP
                                   1662 
                                   1663 ;; Multiply
                                   1664 
                                   1665 ;       UM*     ( u u -- ud )
                                   1666 ;       Unsigned multiply. Return double product.
      00888E 88 83                 1667         .word      LINK
                           000810  1668 LINK = . 
      008890 03                    1669         .byte      3
      008891 55 4D 2A              1670         .ascii     "UM*"
      008894                       1671 UMSTA:	; stack have 4 bytes u1=a,b u2=c,d
                           000001  1672 .if PICATOUT_MOD 
                                   1673 ; take advantage of SP addressing modes
                                   1674 ; these PRODx in RAM are not required
                                   1675 ; the product is kept on stack as local variable 
                                   1676         ;; bytes offset on data stack 
                           000002  1677         da=2 
                           000003  1678         db=3 
                           000000  1679         dc=0 
                           000001  1680         dd=1 
                                   1681         ;; product bytes offset on return stack 
                           000001  1682         UD1=1  ; ud bits 31..24
                           000002  1683         UD2=2  ; ud bits 23..16
                           000003  1684         UD3=3  ; ud bits 15..8 
                           000004  1685         UD4=4  ; ud bits 7..0 
                                   1686         ;; local variable for product set to zero   
      008894 90 5F            [ 1] 1687         clrw y 
      008896 90 89            [ 2] 1688         pushw y  ; bits 15..0
      008898 90 89            [ 2] 1689         pushw y  ; bits 31..16 
      00889A E6 03            [ 1] 1690         ld a,(db,x) ; b 
      00889C 90 97            [ 1] 1691         ld yl,a 
      00889E E6 01            [ 1] 1692         ld a,(dd,x)   ; d
      0088A0 90 42            [ 4] 1693         mul y,a    ; b*d  
      0088A2 17 03            [ 2] 1694         ldw (UD3,sp),y ; lowest weight product 
      0088A4 E6 03            [ 1] 1695         ld a,(db,x)
      0088A6 90 97            [ 1] 1696         ld yl,a 
      0088A8 E6 00            [ 1] 1697         ld a,(dc,x)
      0088AA 90 42            [ 4] 1698         mul y,a  ; b*c 
                                   1699         ;;; do the partial sum 
      0088AC 72 F9 02         [ 2] 1700         addw y,(UD2,sp)
      0088AF 4F               [ 1] 1701         clr a 
      0088B0 49               [ 1] 1702         rlc a
      0088B1 6B 01            [ 1] 1703         ld (UD1,sp),a 
      0088B3 17 02            [ 2] 1704         ldw (UD2,sp),y 
      0088B5 E6 02            [ 1] 1705         ld a,(da,x)
      0088B7 90 97            [ 1] 1706         ld yl,a 
      0088B9 E6 01            [ 1] 1707         ld a,(dd,x)
      0088BB 90 42            [ 4] 1708         mul y,a   ; a*d 
                                   1709         ;; do partial sum 
      0088BD 72 F9 02         [ 2] 1710         addw y,(UD2,sp)
      0088C0 4F               [ 1] 1711         clr a 
      0088C1 19 01            [ 1] 1712         adc a,(UD1,sp)
      0088C3 6B 01            [ 1] 1713         ld (UD1,sp),a  
      0088C5 17 02            [ 2] 1714         ldw (UD2,sp),y 
      0088C7 E6 02            [ 1] 1715         ld a,(da,x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



      0088C9 90 97            [ 1] 1716         ld yl,a 
      0088CB E6 00            [ 1] 1717         ld a,(dc,x)
      0088CD 90 42            [ 4] 1718         mul y,a  ;  a*c highest weight product 
                                   1719         ;;; do partial sum 
      0088CF 72 F9 01         [ 2] 1720         addw y,(UD1,sp)
      0088D2 FF               [ 2] 1721         ldw (x),y  ; udh 
      0088D3 16 03            [ 2] 1722         ldw y,(UD3,sp)
      0088D5 EF 02            [ 2] 1723         ldw (2,x),y  ; udl  
      0088D7 5B 04            [ 2] 1724         addw sp,#4 ; drop local variable 
      0088D9 81               [ 4] 1725         ret  
                           000000  1726 .else
                                   1727 	LD A,(2,X)	; b
                                   1728 	LD YL,A
                                   1729 	LD A,(X)	; d
                                   1730 	MUL Y,A
                                   1731 	LDW PROD1,Y
                                   1732 	LD A,(3,X)	; a
                                   1733 	LD YL,A
                                   1734 	LD A,(X)	; d
                                   1735 	MUL Y,A
                                   1736 	LDW PROD2,Y
                                   1737 	LD A,(2,X)	; b
                                   1738 	LD YL,A
                                   1739 	LD A,(1,X)	; c
                                   1740 	MUL Y,A
                                   1741 	LDW PROD3,Y
                                   1742 	LD A,(3,X)	; a
                                   1743 	LD YL,A
                                   1744 	LD A,(1,X)	; c
                                   1745 	MUL Y,A	; least signifiant product
                                   1746 	CLR A
                                   1747 	RRWA Y
                                   1748 	LD (3,X),A	; store least significant byte
                                   1749 	ADDW Y,PROD3
                                   1750 	CLR A
                                   1751 	ADC A,#0	; save carry
                                   1752 	LD CARRY,A
                                   1753 	ADDW Y,PROD2
                                   1754 	LD A,CARRY
                                   1755 	ADC A,#0	; add 2nd carry
                                   1756 	LD CARRY,A
                                   1757 	CLR A
                                   1758 	RRWA Y
                                   1759 	LD (2,X),A	; 2nd product byte
                                   1760 	ADDW Y,PROD1
                                   1761 	RRWA Y
                                   1762 	LD (1,X),A	; 3rd product byte
                                   1763 	RRWA Y  	; 4th product byte now in A
                                   1764 	ADC A,CARRY	; fill in carry bits
                                   1765 	LD (X),A
                                   1766 	RET
                                   1767 .endif 
                                   1768 
                                   1769 
                                   1770 ;       *       ( n n -- n )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



                                   1771 ;       Signed multiply. Return single product.
      0088DA 88 90                 1772         .word      LINK
                           00085C  1773 LINK = . 
      0088DC 01                    1774         .byte      1
      0088DD 2A                    1775         .ascii     "*"
      0088DE                       1776 STAR:
      0088DE CD 88 94         [ 4] 1777 	CALL	UMSTA
      0088E1 CC 84 8E         [ 2] 1778 	JP	DROP
                                   1779 
                                   1780 ;       M*      ( n n -- d )
                                   1781 ;       Signed multiply. Return double product.
      0088E4 88 DC                 1782         .word      LINK
                           000866  1783 LINK = . 
      0088E6 02                    1784         .byte      2
      0088E7 4D 2A                 1785         .ascii     "M*"
      0088E9                       1786 MSTAR:      
      0088E9 CD 86 6B         [ 4] 1787         CALL	DDUP
      0088EC CD 85 0D         [ 4] 1788         CALL	XORR
      0088EF CD 84 D1         [ 4] 1789         CALL	ZLESS
      0088F2 CD 84 61         [ 4] 1790         CALL	TOR
      0088F5 CD 86 F8         [ 4] 1791         CALL	ABSS
      0088F8 CD 84 A8         [ 4] 1792         CALL	SWAPP
      0088FB CD 86 F8         [ 4] 1793         CALL	ABSS
      0088FE CD 88 94         [ 4] 1794         CALL	UMSTA
      008901 CD 84 42         [ 4] 1795         CALL	RFROM
      008904 CD 83 9C         [ 4] 1796         CALL	QBRAN
      008907 89 0C                 1797         .word	MSTA1
      008909 CD 86 BD         [ 4] 1798         CALL	DNEGA
      00890C 81               [ 4] 1799 MSTA1:	RET
                                   1800 
                                   1801 ;       . /MOD   ( n1 n2 n3 -- r q )
                                   1802 ;       Multiply n1 and n2, then divide
                                   1803 ;       by n3. Return mod and quotient.
      00890D 88 E6                 1804         .word      LINK
                           00088F  1805 LINK = . 
      00890F 05                    1806         .byte      5
      008910 2A 2F 4D 4F 44        1807         .ascii     "*/MOD"
      008915                       1808 SSMOD:
      008915 CD 84 61         [ 4] 1809         CALL     TOR
      008918 CD 88 E9         [ 4] 1810         CALL     MSTAR
      00891B CD 84 42         [ 4] 1811         CALL     RFROM
      00891E CC 88 19         [ 2] 1812         JP     MSMOD
                                   1813 
                                   1814 ;       */      ( n1 n2 n3 -- q )
                                   1815 ;       Multiply n1 by n2, then divide
                                   1816 ;       by n3. Return quotient only.
      008921 89 0F                 1817         .word      LINK
                           0008A3  1818 LINK = . 
      008923 02                    1819         .byte      2
      008924 2A 2F                 1820         .ascii     "*/"
      008926                       1821 STASL:
      008926 CD 89 15         [ 4] 1822         CALL	SSMOD
      008929 CD 84 A8         [ 4] 1823         CALL	SWAPP
      00892C CC 84 8E         [ 2] 1824         JP	DROP
                                   1825 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



                                   1826 ;; Miscellaneous
                                   1827 
                                   1828 ;       CELL+   ( a -- a )
                                   1829 ;       Add cell size in byte to address.
      00892F 89 23                 1830         .word      LINK
                           0008B1  1831 LINK = . 
      008931 02                    1832         .byte       2
      008932 32 2B                 1833         .ascii     "2+"
      008934                       1834 CELLP:
      008934 90 93            [ 1] 1835         LDW Y,X
      008936 90 FE            [ 2] 1836 	LDW Y,(Y)
      008938 72 A9 00 02      [ 2] 1837         ADDW Y,#CELLL 
      00893C FF               [ 2] 1838         LDW (X),Y
      00893D 81               [ 4] 1839         RET
                                   1840 
                                   1841 ;       CELL-   ( a -- a )
                                   1842 ;       Subtract 2 from address.
      00893E 89 31                 1843         .word      LINK
                           0008C0  1844 LINK = . 
      008940 02                    1845         .byte       2
      008941 32 2D                 1846         .ascii     "2-"
      008943                       1847 CELLM:
      008943 90 93            [ 1] 1848         LDW Y,X
      008945 90 FE            [ 2] 1849 	LDW Y,(Y)
      008947 72 A2 00 02      [ 2] 1850         SUBW Y,#CELLL
      00894B FF               [ 2] 1851         LDW (X),Y
      00894C 81               [ 4] 1852         RET
                                   1853 
                                   1854 ;       CELLS   ( n -- n )
                                   1855 ;       Multiply tos by 2.
      00894D 89 40                 1856         .word      LINK
                           0008CF  1857 LINK = . 
      00894F 02                    1858         .byte       2
      008950 32 2A                 1859         .ascii     "2*"
      008952                       1860 CELLS:
      008952 90 93            [ 1] 1861         LDW Y,X
      008954 90 FE            [ 2] 1862 	LDW Y,(Y)
      008956 90 58            [ 2] 1863         SLAW Y
      008958 FF               [ 2] 1864         LDW (X),Y
      008959 81               [ 4] 1865         RET
                                   1866 
                                   1867 ;       1+      ( a -- a )
                                   1868 ;       Add cell size in byte to address.
      00895A 89 4F                 1869         .word      LINK
                           0008DC  1870 LINK = . 
      00895C 02                    1871         .byte      2
      00895D 31 2B                 1872         .ascii     "1+"
      00895F                       1873 ONEP:
      00895F 90 93            [ 1] 1874         LDW Y,X
      008961 90 FE            [ 2] 1875 	LDW Y,(Y)
      008963 90 5C            [ 2] 1876         INCW Y
      008965 FF               [ 2] 1877         LDW (X),Y
      008966 81               [ 4] 1878         RET
                                   1879 
                                   1880 ;       1-      ( a -- a )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



                                   1881 ;       Subtract 2 from address.
      008967 89 5C                 1882         .word      LINK
                           0008E9  1883 LINK = . 
      008969 02                    1884         .byte      2
      00896A 31 2D                 1885         .ascii     "1-"
      00896C                       1886 ONEM:
      00896C 90 93            [ 1] 1887         LDW Y,X
      00896E 90 FE            [ 2] 1888 	LDW Y,(Y)
      008970 90 5A            [ 2] 1889         DECW Y
      008972 FF               [ 2] 1890         LDW (X),Y
      008973 81               [ 4] 1891         RET
                                   1892 
                                   1893 ;  shift left n times 
                                   1894 ; LSHIFT ( n1 n2 -- n1<<n2 )
      008974 89 69                 1895         .word LINK 
                           0008F6  1896         LINK=.
      008976 06                    1897         .byte 6 
      008977 4C 53 48 49 46 54     1898         .ascii "LSHIFT"
      00897D                       1899 LSHIFT:
      00897D E6 01            [ 1] 1900         ld a,(1,x)
      00897F 1C 00 02         [ 2] 1901         addw x,#CELLL 
      008982 90 93            [ 1] 1902         ldw y,x 
      008984 90 FE            [ 2] 1903         ldw y,(y)
      008986                       1904 LSHIFT1:
      008986 4D               [ 1] 1905         tnz a 
      008987 27 05            [ 1] 1906         jreq LSHIFT4 
      008989 90 58            [ 2] 1907         sllw y 
      00898B 4A               [ 1] 1908         dec a 
      00898C 20 F8            [ 2] 1909         jra LSHIFT1 
      00898E                       1910 LSHIFT4:
      00898E FF               [ 2] 1911         ldw (x),y 
      00898F 81               [ 4] 1912         ret 
                                   1913 
                                   1914 ; shift right n times                 
                                   1915 ; RSHIFT (n1 n2 -- n1>>n2 )
      008990 89 76                 1916         .word LINK 
                           000912  1917         LINK=.
      008992 06                    1918         .byte 6
      008993 52 53 48 49 46 54     1919         .ascii "RSHIFT"
      008999                       1920 RSHIFT:
      008999 E6 01            [ 1] 1921         ld a,(1,x)
      00899B 1C 00 02         [ 2] 1922         addw x,#CELLL 
      00899E 90 93            [ 1] 1923         ldw y,x 
      0089A0 90 FE            [ 2] 1924         ldw y,(y)
      0089A2                       1925 RSHIFT1:
      0089A2 4D               [ 1] 1926         tnz a 
      0089A3 27 05            [ 1] 1927         jreq RSHIFT4 
      0089A5 90 54            [ 2] 1928         srlw y 
      0089A7 4A               [ 1] 1929         dec a 
      0089A8 20 F8            [ 2] 1930         jra RSHIFT1 
      0089AA                       1931 RSHIFT4:
      0089AA FF               [ 2] 1932         ldw (x),y 
      0089AB 81               [ 4] 1933         ret 
                                   1934 
                                   1935 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



                                   1936 ;       2/      ( n -- n )
                                   1937 ;       Multiply tos by 2.
      0089AC 89 92                 1938         .word      LINK
                           00092E  1939 LINK = . 
      0089AE 02                    1940         .byte      2
      0089AF 32 2F                 1941         .ascii     "2/"
      0089B1                       1942 TWOSL:
      0089B1 90 93            [ 1] 1943         LDW Y,X
      0089B3 90 FE            [ 2] 1944 	LDW Y,(Y)
      0089B5 90 57            [ 2] 1945         SRAW Y
      0089B7 FF               [ 2] 1946         LDW (X),Y
      0089B8 81               [ 4] 1947         RET
                                   1948 
                                   1949 ;       BL      ( -- 32 )
                                   1950 ;       Return 32,  blank character.
      0089B9 89 AE                 1951         .word      LINK
                           00093B  1952 LINK = . 
      0089BB 02                    1953         .byte      2
      0089BC 42 4C                 1954         .ascii     "BL"
      0089BE                       1955 BLANK:
      0089BE 1D 00 02         [ 2] 1956         SUBW X,#2
      0089C1 90 AE 00 20      [ 2] 1957 	LDW Y,#32
      0089C5 FF               [ 2] 1958         LDW (X),Y
      0089C6 81               [ 4] 1959         RET
                                   1960 
                                   1961 ;         0     ( -- 0)
                                   1962 ;         Return 0.
      0089C7 89 BB                 1963         .word      LINK
                           000949  1964 LINK = . 
      0089C9 01                    1965         .byte       1
      0089CA 30                    1966         .ascii     "0"
      0089CB                       1967 ZERO:
      0089CB 1D 00 02         [ 2] 1968         SUBW X,#2
      0089CE 90 5F            [ 1] 1969 	CLRW Y
      0089D0 FF               [ 2] 1970         LDW (X),Y
      0089D1 81               [ 4] 1971         RET
                                   1972 
                                   1973 ;         1     ( -- 1)
                                   1974 ;         Return 1.
      0089D2 89 C9                 1975         .word      LINK
                           000954  1976 LINK = . 
      0089D4 01                    1977         .byte       1
      0089D5 31                    1978         .ascii     "1"
      0089D6                       1979 ONE:
      0089D6 1D 00 02         [ 2] 1980         SUBW X,#2
      0089D9 90 AE 00 01      [ 2] 1981 	LDW Y,#1
      0089DD FF               [ 2] 1982         LDW (X),Y
      0089DE 81               [ 4] 1983         RET
                                   1984 
                                   1985 ;         -1    ( -- -1)
                                   1986 ;         Return 32,  blank character.
      0089DF 89 D4                 1987         .word      LINK
                           000961  1988 LINK = . 
      0089E1 02                    1989         .byte       2
      0089E2 2D 31                 1990         .ascii     "-1"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



      0089E4                       1991 MONE:
      0089E4 1D 00 02         [ 2] 1992         SUBW X,#2
      0089E7 90 AE FF FF      [ 2] 1993 	LDW Y,#0xFFFF
      0089EB FF               [ 2] 1994         LDW (X),Y
      0089EC 81               [ 4] 1995         RET
                                   1996 
                                   1997 ;       >CHAR   ( c -- c )
                                   1998 ;       Filter non-printing characters.
      0089ED 89 E1                 1999         .word      LINK
                           00096F  2000 LINK = . 
      0089EF 05                    2001         .byte      5
      0089F0 3E 43 48 41 52        2002         .ascii     ">CHAR"
      0089F5                       2003 TCHAR:
                           000001  2004 .if CONVERT_TO_CODE
      0089F5 E6 01            [ 1] 2005         ld a,(1,x)
      0089F7 A1 20            [ 1] 2006         cp a,#32  
      0089F9 2B 05            [ 1] 2007         jrmi 1$ 
      0089FB A1 7F            [ 1] 2008         cp a,#127 
      0089FD 2A 01            [ 1] 2009         jrpl 1$ 
      0089FF 81               [ 4] 2010         ret 
      008A00 A6 5F            [ 1] 2011 1$:     ld a,#'_ 
      008A02 E7 01            [ 1] 2012         ld (1,x),a 
      008A04 81               [ 4] 2013         ret 
                           000000  2014 .else
                                   2015         CALL     DOLIT
                                   2016         .word       0x7F
                                   2017         CALL     ANDD
                                   2018         CALL     DUPP    ;mask msb
                                   2019         CALL     DOLIT
                                   2020         .word      127
                                   2021         CALL     BLANK
                                   2022         CALL     WITHI   ;check for printable
                                   2023         CALL     QBRAN
                                   2024         .word    TCHA1
                                   2025         CALL     DROP
                                   2026         CALL     DOLIT
                                   2027         .word     0x5F		; "_"     ;replace non-printables
                                   2028 .endif 
      008A05 81               [ 4] 2029 TCHA1:  RET
                                   2030 
                                   2031 ;       DEPTH   ( -- n )
                                   2032 ;       Return  depth of  data stack.
      008A06 89 EF                 2033         .word      LINK
                           000988  2034 LINK = . 
      008A08 05                    2035         .byte      5
      008A09 44 45 50 54 48        2036         .ascii     "DEPTH"
      008A0E                       2037 DEPTH: 
      008A0E 90 BE 28         [ 2] 2038         LDW Y,SP0    ;save data stack ptr
      008A11 BF 20            [ 2] 2039 	LDW XTEMP,X
      008A13 72 B2 00 20      [ 2] 2040         SUBW Y,XTEMP     ;#bytes = SP0 - X
      008A17 90 57            [ 2] 2041         SRAW Y    ;Y = #stack items
                           000001  2042 .if PICATOUT_MOD
                                   2043 ; why ? 
                                   2044 ;      	DECW Y
                                   2045 .endif 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



      008A19 1D 00 02         [ 2] 2046 	SUBW X,#2
      008A1C FF               [ 2] 2047         LDW (X),Y     ; if neg, underflow
      008A1D 81               [ 4] 2048         RET
                                   2049 
                                   2050 ;       PICK    ( ... +n -- ... w )
                                   2051 ;       Copy  nth stack item to tos.
      008A1E 8A 08                 2052         .word      LINK
                           0009A0  2053 LINK = . 
      008A20 04                    2054         .byte      4
      008A21 50 49 43 4B           2055         .ascii     "PICK"
      008A25                       2056 PICK:
      008A25 90 93            [ 1] 2057         LDW Y,X   ;D = n1
      008A27 90 FE            [ 2] 2058         LDW Y,(Y)
      008A29 90 58            [ 2] 2059         SLAW Y
      008A2B BF 20            [ 2] 2060         LDW XTEMP,X
      008A2D 72 B9 00 20      [ 2] 2061         ADDW Y,XTEMP
      008A31 90 FE            [ 2] 2062         LDW Y,(Y)
      008A33 FF               [ 2] 2063         LDW (X),Y
      008A34 81               [ 4] 2064         RET
                                   2065 
                                   2066 ;; Memory access
                                   2067 
                                   2068 ;       +!      ( n a -- )
                                   2069 ;       Add n to  contents at address a.
      008A35 8A 20                 2070         .word      LINK
                           0009B7  2071 LINK = . 
      008A37 02                    2072         .byte      2
      008A38 2B 21                 2073         .ascii     "+!"
      008A3A                       2074 PSTOR:
                           000001  2075 .if CONVERT_TO_CODE
      008A3A 90 93            [ 1] 2076         ldw y,x 
      008A3C 90 FE            [ 2] 2077         ldw y,(y)
      008A3E 90 BF 22         [ 2] 2078         ldw YTEMP,y  ; address
      008A41 90 FE            [ 2] 2079         ldw y,(y)  
      008A43 90 89            [ 2] 2080         pushw y  ; value at address 
      008A45 90 93            [ 1] 2081         ldw y,x 
      008A47 90 EE 02         [ 2] 2082         ldw y,(2,y) ; n 
      008A4A 72 F9 01         [ 2] 2083         addw y,(1,sp) ; n+value
      008A4D 91 CF 22         [ 5] 2084         ldw [YTEMP],y ;  a!
      008A50 90 85            [ 2] 2085         popw y    ;drop local var
      008A52 1C 00 04         [ 2] 2086         addw x,#4 ; DDROP 
      008A55 81               [ 4] 2087         ret 
                           000000  2088 .else
                                   2089         CALL	SWAPP
                                   2090         CALL	OVER
                                   2091         CALL	AT
                                   2092         CALL	PLUS
                                   2093         CALL	SWAPP
                                   2094         JP	STORE
                                   2095 .endif 
                                   2096 
                                   2097 ;       2!      ( d a -- )
                                   2098 ;       Store  double integer to address a.
      008A56 8A 37                 2099         .word      LINK
                           0009D8  2100 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



      008A58 02                    2101         .byte      2
      008A59 32 21                 2102         .ascii     "2!"
      008A5B                       2103 DSTOR:
                           000001  2104 .if CONVERT_TO_CODE
      008A5B 90 93            [ 1] 2105         ldw y,x 
      008A5D 90 FE            [ 2] 2106         ldw y,(y)
      008A5F 90 BF 22         [ 2] 2107         ldw YTEMP,y ; address 
      008A62 1C 00 02         [ 2] 2108         addw x,#CELLL ; drop a 
      008A65 90 93            [ 1] 2109         ldw y,x 
      008A67 90 FE            [ 2] 2110         ldw y,(y) ; hi word 
      008A69 89               [ 2] 2111         pushw x 
      008A6A EE 02            [ 2] 2112         ldw x,(2,x) ; lo word 
      008A6C 91 CF 22         [ 5] 2113         ldw [YTEMP],y
      008A6F 90 93            [ 1] 2114         ldw y,x 
      008A71 AE 00 02         [ 2] 2115         ldw x,#2 
      008A74 92 DF 22         [ 5] 2116         ldw ([YTEMP],x),y 
      008A77 85               [ 2] 2117         popw x 
      008A78 1C 00 04         [ 2] 2118         addw x,#4 ; DDROP 
      008A7B 81               [ 4] 2119         ret 
                           000000  2120 .else
                                   2121         CALL	SWAPP
                                   2122         CALL	OVER
                                   2123         CALL	STORE
                                   2124         CALL	CELLP
                                   2125         JP	STORE
                                   2126 .endif 
                                   2127 ;       2@      ( a -- d )
                                   2128 ;       Fetch double integer from address a.
      008A7C 8A 58                 2129         .word      LINK
                           0009FE  2130 LINK = . 
      008A7E 02                    2131         .byte      2
      008A7F 32 40                 2132         .ascii     "2@"
      008A81                       2133 DAT:
                           000001  2134 .if CONVERT_TO_CODE
      008A81 90 93            [ 1] 2135         ldw y,x 
      008A83 90 FE            [ 2] 2136         ldw y,(y) ;address 
      008A85 90 BF 22         [ 2] 2137         ldw YTEMP,y 
      008A88 1D 00 02         [ 2] 2138         subw x,#CELLL ; space for udh 
      008A8B 91 CE 22         [ 5] 2139         ldw y,[YTEMP] ; udh 
      008A8E FF               [ 2] 2140         ldw (x),y 
      008A8F 90 AE 00 02      [ 2] 2141         ldw y,#2
      008A93 91 DE 22         [ 5] 2142         ldw y,([YTEMP],y) ; udl 
      008A96 EF 02            [ 2] 2143         ldw (2,x),y
      008A98 81               [ 4] 2144         ret 
                           000000  2145 .else 
                                   2146         CALL	DUPP
                                   2147         CALL	CELLP
                                   2148         CALL	AT
                                   2149         CALL	SWAPP
                                   2150         JP	AT
                                   2151 .endif 
                                   2152 
                                   2153 ;       COUNT   ( b -- b +n )
                                   2154 ;       Return count byte of a string
                                   2155 ;       and add 1 to byte address.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



      008A99 8A 7E                 2156         .word      LINK
                           000A1B  2157 LINK = . 
      008A9B 05                    2158         .byte      5
      008A9C 43 4F 55 4E 54        2159         .ascii     "COUNT"
      008AA1                       2160 COUNT:
                           000001  2161 .if CONVERT_TO_CODE
      008AA1 90 93            [ 1] 2162         ldw y,x 
      008AA3 90 FE            [ 2] 2163         ldw y,(y) ; address 
      008AA5 90 F6            [ 1] 2164         ld a,(y)  ; count 
      008AA7 90 5C            [ 2] 2165         incw y 
      008AA9 FF               [ 2] 2166         ldw (x),y 
      008AAA 1D 00 02         [ 2] 2167         subw x,#CELLL 
      008AAD E7 01            [ 1] 2168         ld (1,x),a 
      008AAF 7F               [ 1] 2169         clr (x)
      008AB0 81               [ 4] 2170         ret 
                           000000  2171 .else 
                                   2172         CALL     DUPP
                                   2173         CALL     ONEP
                                   2174         CALL     SWAPP
                                   2175         JP     CAT
                                   2176 .endif 
                                   2177 
                                   2178 ;       HERE    ( -- a )
                                   2179 ;       Return  top of  variables
      008AB1 8A 9B                 2180         .word      LINK
                           000A33  2181 LINK = . 
      008AB3 04                    2182         .byte      4
      008AB4 48 45 52 45           2183         .ascii     "HERE"
      008AB8                       2184 HERE:
                           000001  2185 .if CONVERT_TO_CODE
      008AB8 90 AE 00 16      [ 2] 2186       	ldw y,#UVP 
      008ABC 90 FE            [ 2] 2187         ldw y,(y)
      008ABE 1D 00 02         [ 2] 2188         subw x,#CELLL 
      008AC1 FF               [ 2] 2189         ldw (x),y 
      008AC2 81               [ 4] 2190         ret 
                           000000  2191 .else
                                   2192         CALL     VPP
                                   2193         JP     AT
                                   2194 .endif 
                                   2195 
                                   2196 ;       PAD     ( -- a )
                                   2197 ;       Return address of text buffer
                                   2198 ;       above  code dictionary.
      008AC3 8A B3                 2199         .word      LINK
                           000A45  2200 LINK = . 
      008AC5 03                    2201         .byte      3
      008AC6 50 41 44              2202         .ascii     "PAD"
      008AC9                       2203 PAD:
      008AC9 CD 8A B8         [ 4] 2204         CALL     HERE
      008ACC CD 83 69         [ 4] 2205         CALL     DOLIT
      008ACF 00 50                 2206         .word      80
      008AD1 CC 86 80         [ 2] 2207         JP     PLUS
                                   2208 
                                   2209 ;       TIB     ( -- a )
                                   2210 ;       Return address of terminal input buffer.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



      008AD4 8A C5                 2211         .word      LINK
                           000A56  2212 LINK = . 
      008AD6 03                    2213         .byte      3
      008AD7 54 49 42              2214         .ascii     "TIB"
      008ADA                       2215 TIB:
      008ADA CD 85 83         [ 4] 2216         CALL     NTIB
      008ADD CD 89 34         [ 4] 2217         CALL     CELLP
      008AE0 CC 83 F1         [ 2] 2218         JP     AT
                                   2219 
                                   2220 ;       @EXECUTE        ( a -- )
                                   2221 ;       Execute vector stored in address a.
      008AE3 8A D6                 2222         .word      LINK
                           000A65  2223 LINK = . 
      008AE5 08                    2224         .byte      8
      008AE6 40 45 58 45 43 55 54  2225         .ascii     "@EXECUTE"
             45
      008AEE                       2226 ATEXE:
      008AEE CD 83 F1         [ 4] 2227         CALL     AT
      008AF1 CD 86 2F         [ 4] 2228         CALL     QDUP    ;?address or zero
      008AF4 CD 83 9C         [ 4] 2229         CALL     QBRAN
      008AF7 8A FC                 2230         .word      EXE1
      008AF9 CD 83 C3         [ 4] 2231         CALL     EXECU   ;execute if non-zero
      008AFC 81               [ 4] 2232 EXE1:   RET     ;do nothing if zero
                                   2233 
                                   2234 ;       CMOVE   ( b1 b2 u -- )
                                   2235 ;       Copy u bytes from b1 to b2.
      008AFD 8A E5                 2236         .word      LINK
                           000A7F  2237 LINK = . 
      008AFF 05                    2238         .byte      5
      008B00 43 4D 4F 56 45        2239         .ascii     "CMOVE"
      008B05                       2240 CMOVE:
      008B05 CD 84 61         [ 4] 2241         CALL	TOR
      008B08 CD 83 B3         [ 4] 2242         CALL	BRAN
      008B0B 8B 25                 2243         .word	CMOV2
      008B0D CD 84 61         [ 4] 2244 CMOV1:	CALL	TOR
      008B10 CD 84 98         [ 4] 2245         CALL	DUPP
      008B13 CD 84 0F         [ 4] 2246         CALL	CAT
      008B16 CD 84 55         [ 4] 2247         CALL	RAT
      008B19 CD 83 FE         [ 4] 2248         CALL	CSTOR
      008B1C CD 89 5F         [ 4] 2249         CALL	ONEP
      008B1F CD 84 42         [ 4] 2250         CALL	RFROM
      008B22 CD 89 5F         [ 4] 2251         CALL	ONEP
      008B25 CD 83 7D         [ 4] 2252 CMOV2:	CALL	DONXT
      008B28 8B 0D                 2253         .word	CMOV1
      008B2A CC 86 60         [ 2] 2254         JP	DDROP
                                   2255 
                                   2256 ;       FILL    ( b u c -- )
                                   2257 ;       Fill u bytes of character c
                                   2258 ;       to area beginning at b.
      008B2D 8A FF                 2259         .word       LINK
                           000AAF  2260 LINK = . 
      008B2F 04                    2261         .byte       4
      008B30 46 49 4C 4C           2262         .ascii     "FILL"
      008B34                       2263 FILL:
                           000001  2264 .if CONVERT_TO_CODE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



      008B34 90 93            [ 1] 2265         ldw y,x 
      008B36 90 E6 01         [ 1] 2266         ld a,(1,y) ; c 
      008B39 1C 00 02         [ 2] 2267         addw x,#CELLL ; drop c 
      008B3C 90 93            [ 1] 2268         ldw y,x 
      008B3E 90 FE            [ 2] 2269         ldw y,(y) ; count
      008B40 90 89            [ 2] 2270         pushw y 
      008B42 1C 00 02         [ 2] 2271         addw x,#CELLL ; drop u 
      008B45 90 93            [ 1] 2272         ldw y,x 
      008B47 1C 00 02         [ 2] 2273         addw x,#CELLL ; drop b 
      008B4A 90 FE            [ 2] 2274         ldw y,(y) ; address
      008B4C 90 BF 22         [ 2] 2275         ldw YTEMP,y
      008B4F 90 85            [ 2] 2276         popw y ; count 
      008B51                       2277 FILL1:  
      008B51 92 C7 22         [ 4] 2278         ld [YTEMP],a 
      008B54 3C 23            [ 1] 2279         inc YTEMP+1
      008B56 24 02            [ 1] 2280         jrnc FILL2 
      008B58 3C 22            [ 1] 2281         inc YTEMP
      008B5A                       2282 FILL2: 
      008B5A 90 5A            [ 2] 2283         decw y ; count 
      008B5C 26 F3            [ 1] 2284         jrne FILL1  
      008B5E 81               [ 4] 2285         ret 
                           000000  2286 .else 
                                   2287         CALL	SWAPP
                                   2288         CALL	TOR
                                   2289         CALL	SWAPP
                                   2290         CALL	BRAN
                                   2291         .word	FILL2
                                   2292 FILL1:	CALL	DDUP
                                   2293         CALL	CSTOR
                                   2294         CALL	ONEP
                                   2295 FILL2:	CALL	DONXT
                                   2296         .word	FILL1
                                   2297         JP	DDROP
                                   2298 .endif
                                   2299 
                                   2300 ;       ERASE   ( b u -- )
                                   2301 ;       Erase u bytes beginning at b.
      008B5F 8B 2F                 2302         .word      LINK
                           000AE1  2303 LINK = . 
      008B61 05                    2304         .byte      5
      008B62 45 52 41 53 45        2305         .ascii     "ERASE"
      008B67                       2306 ERASE:
                           000001  2307 .if CONVERT_TO_CODE
      008B67 90 5F            [ 1] 2308         clrw y 
      008B69 1D 00 02         [ 2] 2309         subw x,#CELLL 
      008B6C FF               [ 2] 2310         ldw (x),y 
      008B6D CC 8B 34         [ 2] 2311         jp FILL 
                           000000  2312 .else 
                                   2313         CALL     ZERO
                                   2314         JP     FILL
                                   2315 .endif 
                                   2316 ;       PACK0x   ( b u a -- a )
                                   2317 ;       Build a counted string with
                                   2318 ;       u characters from b. Null fill.
      008B70 8B 61                 2319         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



                           000AF2  2320 LINK = . 
      008B72 05                    2321         .byte      5
      008B73 50 41 43 4B 30 58     2322         .ascii     "PACK0X"
      008B79                       2323 PACKS:
      008B79 CD 84 98         [ 4] 2324         CALL     DUPP
      008B7C CD 84 61         [ 4] 2325         CALL     TOR     ;strings only on cell boundary
      008B7F CD 86 6B         [ 4] 2326         CALL     DDUP
      008B82 CD 83 FE         [ 4] 2327         CALL     CSTOR
      008B85 CD 89 5F         [ 4] 2328         CALL     ONEP ;save count
      008B88 CD 84 A8         [ 4] 2329         CALL     SWAPP
      008B8B CD 8B 05         [ 4] 2330         CALL     CMOVE
      008B8E CD 84 42         [ 4] 2331         CALL     RFROM
      008B91 81               [ 4] 2332         RET
                                   2333 
                                   2334 ;; Numeric output, single precision
                                   2335 
                                   2336 ;       DIGIT   ( u -- c )
                                   2337 ;       Convert digit u to a character.
      008B92 8B 72                 2338         .word      LINK
                           000B14  2339 LINK = . 
      008B94 05                    2340         .byte      5
      008B95 44 49 47 49 54        2341         .ascii     "DIGIT"
      008B9A                       2342 DIGIT:
      008B9A CD 83 69         [ 4] 2343         CALL	DOLIT
      008B9D 00 09                 2344         .word	9
      008B9F CD 84 C2         [ 4] 2345         CALL	OVER
      008BA2 CD 87 43         [ 4] 2346         CALL	LESS
      008BA5 CD 83 69         [ 4] 2347         CALL	DOLIT
      008BA8 00 07                 2348         .word	7
      008BAA CD 84 E4         [ 4] 2349         CALL	ANDD
      008BAD CD 86 80         [ 4] 2350         CALL	PLUS
      008BB0 CD 83 69         [ 4] 2351         CALL	DOLIT
      008BB3 00 30                 2352         .word	48	;'0'
      008BB5 CC 86 80         [ 2] 2353         JP	PLUS
                                   2354 
                                   2355 ;       EXTRACT ( n base -- n c )
                                   2356 ;       Extract least significant digit from n.
      008BB8 8B 94                 2357         .word      LINK
                           000B3A  2358 LINK = . 
      008BBA 07                    2359         .byte      7
      008BBB 45 58 54 52 41 43 54  2360         .ascii     "EXTRACT"
      008BC2                       2361 EXTRC:
      008BC2 CD 89 CB         [ 4] 2362         CALL     ZERO
      008BC5 CD 84 A8         [ 4] 2363         CALL     SWAPP
      008BC8 CD 87 BB         [ 4] 2364         CALL     UMMOD
      008BCB CD 84 A8         [ 4] 2365         CALL     SWAPP
      008BCE CC 8B 9A         [ 2] 2366         JP     DIGIT
                                   2367 
                                   2368 ;       <#      ( -- )
                                   2369 ;       Initiate  numeric output process.
      008BD1 8B BA                 2370         .word      LINK
                           000B53  2371 LINK = . 
      008BD3 02                    2372         .byte      2
      008BD4 3C 23                 2373         .ascii     "<#"
      008BD6                       2374 BDIGS:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



      008BD6 CD 8A C9         [ 4] 2375         CALL     PAD
      008BD9 CD 85 C5         [ 4] 2376         CALL     HLD
      008BDC CC 83 DA         [ 2] 2377         JP     STORE
                                   2378 
                                   2379 ;       HOLD    ( c -- )
                                   2380 ;       Insert a character into output string.
      008BDF 8B D3                 2381         .word      LINK
                           000B61  2382 LINK = . 
      008BE1 04                    2383         .byte      4
      008BE2 48 4F 4C 44           2384         .ascii     "HOLD"
      008BE6                       2385 HOLD:
      008BE6 CD 85 C5         [ 4] 2386         CALL     HLD
      008BE9 CD 83 F1         [ 4] 2387         CALL     AT
      008BEC CD 89 6C         [ 4] 2388         CALL     ONEM
      008BEF CD 84 98         [ 4] 2389         CALL     DUPP
      008BF2 CD 85 C5         [ 4] 2390         CALL     HLD
      008BF5 CD 83 DA         [ 4] 2391         CALL     STORE
      008BF8 CC 83 FE         [ 2] 2392         JP     CSTOR
                                   2393 
                                   2394 ;       #       ( u -- u )
                                   2395 ;       Extract one digit from u and
                                   2396 ;       append digit to output string.
      008BFB 8B E1                 2397         .word      LINK
                           000B7D  2398 LINK = . 
      008BFD 01                    2399         .byte      1
      008BFE 23                    2400         .ascii     "#"
      008BFF                       2401 DIG:
      008BFF CD 85 55         [ 4] 2402         CALL     BASE
      008C02 CD 83 F1         [ 4] 2403         CALL     AT
      008C05 CD 8B C2         [ 4] 2404         CALL     EXTRC
      008C08 CC 8B E6         [ 2] 2405         JP     HOLD
                                   2406 
                                   2407 ;       #S      ( u -- 0 )
                                   2408 ;       Convert u until all digits
                                   2409 ;       are added to output string.
      008C0B 8B FD                 2410         .word      LINK
                           000B8D  2411 LINK = . 
      008C0D 02                    2412         .byte      2
      008C0E 23 53                 2413         .ascii     "#S"
      008C10                       2414 DIGS:
      008C10 CD 8B FF         [ 4] 2415 DIGS1:  CALL     DIG
      008C13 CD 84 98         [ 4] 2416         CALL     DUPP
      008C16 CD 83 9C         [ 4] 2417         CALL     QBRAN
      008C19 8C 1D                 2418         .word      DIGS2
      008C1B 20 F3            [ 2] 2419         JRA     DIGS1
      008C1D 81               [ 4] 2420 DIGS2:  RET
                                   2421 
                                   2422 ;       SIGN    ( n -- )
                                   2423 ;       Add a minus sign to
                                   2424 ;       numeric output string.
      008C1E 8C 0D                 2425         .word      LINK
                           000BA0  2426 LINK = . 
      008C20 04                    2427         .byte      4
      008C21 53 49 47 4E           2428         .ascii     "SIGN"
      008C25                       2429 SIGN:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      008C25 CD 84 D1         [ 4] 2430         CALL     ZLESS
      008C28 CD 83 9C         [ 4] 2431         CALL     QBRAN
      008C2B 8C 35                 2432         .word      SIGN1
      008C2D CD 83 69         [ 4] 2433         CALL     DOLIT
      008C30 00 2D                 2434         .word      45	;"-"
      008C32 CC 8B E6         [ 2] 2435         JP     HOLD
      008C35 81               [ 4] 2436 SIGN1:  RET
                                   2437 
                                   2438 ;       #>      ( w -- b u )
                                   2439 ;       Prepare output string.
      008C36 8C 20                 2440         .word      LINK
                           000BB8  2441 LINK = . 
      008C38 02                    2442         .byte      2
      008C39 23 3E                 2443         .ascii     "#>"
      008C3B                       2444 EDIGS:
      008C3B CD 84 8E         [ 4] 2445         CALL     DROP
      008C3E CD 85 C5         [ 4] 2446         CALL     HLD
      008C41 CD 83 F1         [ 4] 2447         CALL     AT
      008C44 CD 8A C9         [ 4] 2448         CALL     PAD
      008C47 CD 84 C2         [ 4] 2449         CALL     OVER
      008C4A CC 86 DE         [ 2] 2450         JP     SUBB
                                   2451 
                                   2452 ;       str     ( w -- b u )
                                   2453 ;       Convert a signed integer
                                   2454 ;       to a numeric string.
      008C4D 8C 38                 2455         .word      LINK
                           000BCF  2456 LINK = . 
      008C4F 03                    2457         .byte      3
      008C50 53 54 52              2458         .ascii     "STR"
      008C53                       2459 STR:
      008C53 CD 84 98         [ 4] 2460         CALL     DUPP
      008C56 CD 84 61         [ 4] 2461         CALL     TOR
      008C59 CD 86 F8         [ 4] 2462         CALL     ABSS
      008C5C CD 8B D6         [ 4] 2463         CALL     BDIGS
      008C5F CD 8C 10         [ 4] 2464         CALL     DIGS
      008C62 CD 84 42         [ 4] 2465         CALL     RFROM
      008C65 CD 8C 25         [ 4] 2466         CALL     SIGN
      008C68 CC 8C 3B         [ 2] 2467         JP     EDIGS
                                   2468 
                                   2469 ;       HEX     ( -- )
                                   2470 ;       Use radix 16 as base for
                                   2471 ;       numeric conversions.
      008C6B 8C 4F                 2472         .word      LINK
                           000BED  2473 LINK = . 
      008C6D 03                    2474         .byte      3
      008C6E 48 45 58              2475         .ascii     "HEX"
      008C71                       2476 HEX:
      008C71 CD 83 69         [ 4] 2477         CALL     DOLIT
      008C74 00 10                 2478         .word      16
      008C76 CD 85 55         [ 4] 2479         CALL     BASE
      008C79 CC 83 DA         [ 2] 2480         JP     STORE
                                   2481 
                                   2482 ;       DECIMAL ( -- )
                                   2483 ;       Use radix 10 as base
                                   2484 ;       for numeric conversions.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      008C7C 8C 6D                 2485         .word      LINK
                           000BFE  2486 LINK = . 
      008C7E 07                    2487         .byte      7
      008C7F 44 45 43 49 4D 41 4C  2488         .ascii     "DECIMAL"
      008C86                       2489 DECIM:
      008C86 CD 83 69         [ 4] 2490         CALL     DOLIT
      008C89 00 0A                 2491         .word      10
      008C8B CD 85 55         [ 4] 2492         CALL     BASE
      008C8E CC 83 DA         [ 2] 2493         JP     STORE
                                   2494 
                                   2495 ;; Numeric input, single precision
                                   2496 
                                   2497 ;       DIGIT?  ( c base -- u t )
                                   2498 ;       Convert a character to its numeric
                                   2499 ;       value. A flag indicates success.
      008C91 8C 7E                 2500         .word      LINK
                           000C13  2501 LINK = . 
      008C93 06                    2502         .byte       6
      008C94 44 49 47 49 54 3F     2503         .ascii     "DIGIT?"
      008C9A                       2504 DIGTQ:
      008C9A CD 84 61         [ 4] 2505         CALL     TOR
      008C9D CD 83 69         [ 4] 2506         CALL     DOLIT
      008CA0 00 30                 2507         .word     48	; "0"
      008CA2 CD 86 DE         [ 4] 2508         CALL     SUBB
      008CA5 CD 83 69         [ 4] 2509         CALL     DOLIT
      008CA8 00 09                 2510         .word      9
      008CAA CD 84 C2         [ 4] 2511         CALL     OVER
      008CAD CD 87 43         [ 4] 2512         CALL     LESS
      008CB0 CD 83 9C         [ 4] 2513         CALL     QBRAN
      008CB3 8C CB                 2514         .word      DGTQ1
      008CB5 CD 83 69         [ 4] 2515         CALL     DOLIT
      008CB8 00 07                 2516         .word      7
      008CBA CD 86 DE         [ 4] 2517         CALL     SUBB
      008CBD CD 84 98         [ 4] 2518         CALL     DUPP
      008CC0 CD 83 69         [ 4] 2519         CALL     DOLIT
      008CC3 00 0A                 2520         .word      10
      008CC5 CD 87 43         [ 4] 2521         CALL     LESS
      008CC8 CD 84 F8         [ 4] 2522         CALL     ORR
      008CCB CD 84 98         [ 4] 2523 DGTQ1:  CALL     DUPP
      008CCE CD 84 42         [ 4] 2524         CALL     RFROM
      008CD1 CC 87 25         [ 2] 2525         JP     ULESS
                                   2526 
                                   2527 ;       NUMBER? ( a -- n T | a F )
                                   2528 ;       Convert a number string to
                                   2529 ;       integer. Push a flag on tos.
      008CD4 8C 93                 2530         .word      LINK
                           000C56  2531 LINK = . 
      008CD6 07                    2532         .byte      7
      008CD7 4E 55 4D 42 45 52 3F  2533         .ascii     "NUMBER?"
      008CDE                       2534 NUMBQ:
      008CDE CD 85 55         [ 4] 2535         CALL     BASE
      008CE1 CD 83 F1         [ 4] 2536         CALL     AT
      008CE4 CD 84 61         [ 4] 2537         CALL     TOR
      008CE7 CD 89 CB         [ 4] 2538         CALL     ZERO
      008CEA CD 84 C2         [ 4] 2539         CALL     OVER
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



      008CED CD 8A A1         [ 4] 2540         CALL     COUNT
      008CF0 CD 84 C2         [ 4] 2541         CALL     OVER
      008CF3 CD 84 0F         [ 4] 2542         CALL     CAT
      008CF6 CD 83 69         [ 4] 2543         CALL     DOLIT
      008CF9 00 24                 2544         .word     36	; "0x"
      008CFB CD 87 06         [ 4] 2545         CALL     EQUAL
      008CFE CD 83 9C         [ 4] 2546         CALL     QBRAN
      008D01 8D 12                 2547         .word      NUMQ1
      008D03 CD 8C 71         [ 4] 2548         CALL     HEX
      008D06 CD 84 A8         [ 4] 2549         CALL     SWAPP
      008D09 CD 89 5F         [ 4] 2550         CALL     ONEP
      008D0C CD 84 A8         [ 4] 2551         CALL     SWAPP
      008D0F CD 89 6C         [ 4] 2552         CALL     ONEM
      008D12 CD 84 C2         [ 4] 2553 NUMQ1:  CALL     OVER
      008D15 CD 84 0F         [ 4] 2554         CALL     CAT
      008D18 CD 83 69         [ 4] 2555         CALL     DOLIT
      008D1B 00 2D                 2556         .word     45	; "-"
      008D1D CD 87 06         [ 4] 2557         CALL     EQUAL
      008D20 CD 84 61         [ 4] 2558         CALL     TOR
      008D23 CD 84 A8         [ 4] 2559         CALL     SWAPP
      008D26 CD 84 55         [ 4] 2560         CALL     RAT
      008D29 CD 86 DE         [ 4] 2561         CALL     SUBB
      008D2C CD 84 A8         [ 4] 2562         CALL     SWAPP
      008D2F CD 84 55         [ 4] 2563         CALL     RAT
      008D32 CD 86 80         [ 4] 2564         CALL     PLUS
      008D35 CD 86 2F         [ 4] 2565         CALL     QDUP
      008D38 CD 83 9C         [ 4] 2566         CALL     QBRAN
      008D3B 8D 9C                 2567         .word      NUMQ6
      008D3D CD 89 6C         [ 4] 2568         CALL     ONEM
      008D40 CD 84 61         [ 4] 2569         CALL     TOR
      008D43 CD 84 98         [ 4] 2570 NUMQ2:  CALL     DUPP
      008D46 CD 84 61         [ 4] 2571         CALL     TOR
      008D49 CD 84 0F         [ 4] 2572         CALL     CAT
      008D4C CD 85 55         [ 4] 2573         CALL     BASE
      008D4F CD 83 F1         [ 4] 2574         CALL     AT
      008D52 CD 8C 9A         [ 4] 2575         CALL     DIGTQ
      008D55 CD 83 9C         [ 4] 2576         CALL     QBRAN
      008D58 8D 8A                 2577         .word      NUMQ4
      008D5A CD 84 A8         [ 4] 2578         CALL     SWAPP
      008D5D CD 85 55         [ 4] 2579         CALL     BASE
      008D60 CD 83 F1         [ 4] 2580         CALL     AT
      008D63 CD 88 DE         [ 4] 2581         CALL     STAR
      008D66 CD 86 80         [ 4] 2582         CALL     PLUS
      008D69 CD 84 42         [ 4] 2583         CALL     RFROM
      008D6C CD 89 5F         [ 4] 2584         CALL     ONEP
      008D6F CD 83 7D         [ 4] 2585         CALL     DONXT
      008D72 8D 43                 2586         .word      NUMQ2
      008D74 CD 84 55         [ 4] 2587         CALL     RAT
      008D77 CD 84 A8         [ 4] 2588         CALL     SWAPP
      008D7A CD 84 8E         [ 4] 2589         CALL     DROP
      008D7D CD 83 9C         [ 4] 2590         CALL     QBRAN
      008D80 8D 85                 2591         .word      NUMQ3
      008D82 CD 86 AB         [ 4] 2592         CALL     NEGAT
      008D85 CD 84 A8         [ 4] 2593 NUMQ3:  CALL     SWAPP
      008D88 20 0F            [ 2] 2594         JRA     NUMQ5
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      008D8A CD 84 42         [ 4] 2595 NUMQ4:  CALL     RFROM
      008D8D CD 84 42         [ 4] 2596         CALL     RFROM
      008D90 CD 86 60         [ 4] 2597         CALL     DDROP
      008D93 CD 86 60         [ 4] 2598         CALL     DDROP
      008D96 CD 89 CB         [ 4] 2599         CALL     ZERO
      008D99 CD 84 98         [ 4] 2600 NUMQ5:  CALL     DUPP
      008D9C CD 84 42         [ 4] 2601 NUMQ6:  CALL     RFROM
      008D9F CD 86 60         [ 4] 2602         CALL     DDROP
      008DA2 CD 84 42         [ 4] 2603         CALL     RFROM
      008DA5 CD 85 55         [ 4] 2604         CALL     BASE
      008DA8 CC 83 DA         [ 2] 2605         JP     STORE
                                   2606 
                                   2607 ;; Basic I/O
                                   2608 
                                   2609 ;       KEY     ( -- c )
                                   2610 ;       Wait for and return an
                                   2611 ;       input character.
      008DAB 8C D6                 2612         .word      LINK
                           000D2D  2613 LINK = . 
      008DAD 03                    2614         .byte      3
      008DAE 4B 45 59              2615         .ascii     "KEY"
      008DB1                       2616 KEY:
                           000001  2617 .if CONVERT_TO_CODE
      008DB1 72 0B 52 30 FB   [ 2] 2618         btjf UART1_SR,#UART_SR_RXNE,. 
      008DB6 C6 52 31         [ 1] 2619         ld a,UART1_DR 
      008DB9 1D 00 02         [ 2] 2620         subw x,#CELLL 
      008DBC E7 01            [ 1] 2621         ld (1,x),a 
      008DBE 7F               [ 1] 2622         clr (x)
      008DBF 81               [ 4] 2623         ret 
                           000000  2624 .else 
                                   2625 KEY1:   CALL     QKEY
                                   2626         CALL     QBRAN
                                   2627         .word      KEY1
                                   2628         RET
                                   2629 .endif 
                                   2630 
                                   2631 ;       NUF?    ( -- t )
                                   2632 ;       Return false if no input,
                                   2633 ;       else pause and if CR return true.
      008DC0 8D AD                 2634         .word      LINK
                           000D42  2635 LINK = . 
      008DC2 04                    2636         .byte      4
      008DC3 4E 55 46 3F           2637         .ascii     "NUF?"
      008DC7                       2638 NUFQ:
      008DC7 CD 83 35         [ 4] 2639         CALL     QKEY
      008DCA CD 84 98         [ 4] 2640         CALL     DUPP
      008DCD CD 83 9C         [ 4] 2641         CALL     QBRAN
      008DD0 8D E0                 2642         .word    NUFQ1
      008DD2 CD 86 60         [ 4] 2643         CALL     DDROP
      008DD5 CD 8D B1         [ 4] 2644         CALL     KEY
      008DD8 CD 83 69         [ 4] 2645         CALL     DOLIT
      008DDB 00 0D                 2646         .word      CRR
      008DDD CC 87 06         [ 2] 2647         JP     EQUAL
      008DE0 81               [ 4] 2648 NUFQ1:  RET
                                   2649 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



                                   2650 ;       SPACE   ( -- )
                                   2651 ;       Send  blank character to
                                   2652 ;       output device.
      008DE1 8D C2                 2653         .word      LINK
                           000D63  2654 LINK = . 
      008DE3 05                    2655         .byte      5
      008DE4 53 50 41 43 45        2656         .ascii     "SPACE"
      008DE9                       2657 SPACE:
      008DE9 CD 89 BE         [ 4] 2658         CALL     BLANK
      008DEC CC 83 53         [ 2] 2659         JP     EMIT
                                   2660 
                                   2661 ;       SPACES  ( +n -- )
                                   2662 ;       Send n spaces to output device.
      008DEF 8D E3                 2663         .word      LINK
                           000D71  2664 LINK = . 
      008DF1 06                    2665         .byte      6
      008DF2 53 50 41 43 45 53     2666         .ascii     "SPACES"
      008DF8                       2667 SPACS:
      008DF8 CD 89 CB         [ 4] 2668         CALL     ZERO
      008DFB CD 87 63         [ 4] 2669         CALL     MAX
      008DFE CD 84 61         [ 4] 2670         CALL     TOR
      008E01 20 03            [ 2] 2671         JRA      CHAR2
      008E03 CD 8D E9         [ 4] 2672 CHAR1:  CALL     SPACE
      008E06 CD 83 7D         [ 4] 2673 CHAR2:  CALL     DONXT
      008E09 8E 03                 2674         .word    CHAR1
      008E0B 81               [ 4] 2675         RET
                                   2676 
                                   2677 ;       TYPE    ( b u -- )
                                   2678 ;       Output u characters from b.
      008E0C 8D F1                 2679         .word      LINK
                           000D8E  2680 LINK = . 
      008E0E 04                    2681         .byte      4
      008E0F 54 59 50 45           2682         .ascii     "TYPE"
      008E13                       2683 TYPES:
      008E13 CD 84 61         [ 4] 2684         CALL     TOR
      008E16 20 0C            [ 2] 2685         JRA     TYPE2
      008E18 CD 84 98         [ 4] 2686 TYPE1:  CALL     DUPP
      008E1B CD 84 0F         [ 4] 2687         CALL     CAT
      008E1E CD 83 53         [ 4] 2688         CALL     EMIT
      008E21 CD 89 5F         [ 4] 2689         CALL     ONEP
      008E24 CD 83 7D         [ 4] 2690 TYPE2:  CALL     DONXT
      008E27 8E 18                 2691         .word      TYPE1
      008E29 CC 84 8E         [ 2] 2692         JP     DROP
                                   2693 
                                   2694 ;       CR      ( -- )
                                   2695 ;       Output a carriage return
                                   2696 ;       and a line feed.
      008E2C 8E 0E                 2697         .word      LINK
                           000DAE  2698 LINK = . 
      008E2E 02                    2699         .byte      2
      008E2F 43 52                 2700         .ascii     "CR"
      008E31                       2701 CR:
      008E31 CD 83 69         [ 4] 2702         CALL     DOLIT
      008E34 00 0D                 2703         .word      CRR
      008E36 CD 83 53         [ 4] 2704         CALL     EMIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



      008E39 CD 83 69         [ 4] 2705         CALL     DOLIT
      008E3C 00 0A                 2706         .word      LF
      008E3E CC 83 53         [ 2] 2707         JP     EMIT
                                   2708 
                                   2709 ;       do$     ( -- a )
                                   2710 ;       Return  address of a compiled
                                   2711 ;       string.
      008E41 8E 2E                 2712         .word      LINK
                           000DC3  2713 LINK = . 
      008E43 43                    2714 	.byte      COMPO+3
      008E44 44 4F 24              2715         .ascii     "DO$"
      008E47                       2716 DOSTR:
      008E47 CD 84 42         [ 4] 2717         CALL     RFROM
      008E4A CD 84 55         [ 4] 2718         CALL     RAT
      008E4D CD 84 42         [ 4] 2719         CALL     RFROM
      008E50 CD 8A A1         [ 4] 2720         CALL     COUNT
      008E53 CD 86 80         [ 4] 2721         CALL     PLUS
      008E56 CD 84 61         [ 4] 2722         CALL     TOR
      008E59 CD 84 A8         [ 4] 2723         CALL     SWAPP
      008E5C CD 84 61         [ 4] 2724         CALL     TOR
      008E5F 81               [ 4] 2725         RET
                                   2726 
                                   2727 ;       $"|     ( -- a )
                                   2728 ;       Run time routine compiled by $".
                                   2729 ;       Return address of a compiled string.
      008E60 8E 43                 2730         .word      LINK
                           000DE2  2731 LINK = . 
      008E62 43                    2732 	.byte      COMPO+3
      008E63 24 22 7C              2733         .byte     '$','"','|'
      008E66                       2734 STRQP:
      008E66 CD 8E 47         [ 4] 2735         CALL     DOSTR
      008E69 81               [ 4] 2736         RET
                                   2737 
                                   2738 ;       ."|     ( -- )
                                   2739 ;       Run time routine of ." .
                                   2740 ;       Output a compiled string.
      008E6A 8E 62                 2741         .word      LINK
                           000DEC  2742 LINK = . 
      008E6C 43                    2743 	.byte      COMPO+3
      008E6D 2E 22 7C              2744         .byte     '.','"','|'
      008E70                       2745 DOTQP:
      008E70 CD 8E 47         [ 4] 2746         CALL     DOSTR
      008E73 CD 8A A1         [ 4] 2747         CALL     COUNT
      008E76 CC 8E 13         [ 2] 2748         JP     TYPES
                                   2749 
                                   2750 ;       .R      ( n +n -- )
                                   2751 ;       Display an integer in a field
                                   2752 ;       of n columns, right justified.
      008E79 8E 6C                 2753         .word      LINK
                           000DFB  2754 LINK = . 
      008E7B 02                    2755         .byte      2
      008E7C 2E 52                 2756         .ascii     ".R"
      008E7E                       2757 DOTR:
      008E7E CD 84 61         [ 4] 2758         CALL     TOR
      008E81 CD 8C 53         [ 4] 2759         CALL     STR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



      008E84 CD 84 42         [ 4] 2760         CALL     RFROM
      008E87 CD 84 C2         [ 4] 2761         CALL     OVER
      008E8A CD 86 DE         [ 4] 2762         CALL     SUBB
      008E8D CD 8D F8         [ 4] 2763         CALL     SPACS
      008E90 CC 8E 13         [ 2] 2764         JP     TYPES
                                   2765 
                                   2766 ;       U.R     ( u +n -- )
                                   2767 ;       Display an unsigned integer
                                   2768 ;       in n column, right justified.
      008E93 8E 7B                 2769         .word      LINK
                           000E15  2770 LINK = . 
      008E95 03                    2771         .byte      3
      008E96 55 2E 52              2772         .ascii     "U.R"
      008E99                       2773 UDOTR:
      008E99 CD 84 61         [ 4] 2774         CALL     TOR
      008E9C CD 8B D6         [ 4] 2775         CALL     BDIGS
      008E9F CD 8C 10         [ 4] 2776         CALL     DIGS
      008EA2 CD 8C 3B         [ 4] 2777         CALL     EDIGS
      008EA5 CD 84 42         [ 4] 2778         CALL     RFROM
      008EA8 CD 84 C2         [ 4] 2779         CALL     OVER
      008EAB CD 86 DE         [ 4] 2780         CALL     SUBB
      008EAE CD 8D F8         [ 4] 2781         CALL     SPACS
      008EB1 CC 8E 13         [ 2] 2782         JP     TYPES
                                   2783 
                                   2784 ;       U.      ( u -- )
                                   2785 ;       Display an unsigned integer
                                   2786 ;       in free format.
      008EB4 8E 95                 2787         .word      LINK
                           000E36  2788 LINK = . 
      008EB6 02                    2789         .byte      2
      008EB7 55 2E                 2790         .ascii     "U."
      008EB9                       2791 UDOT:
      008EB9 CD 8B D6         [ 4] 2792         CALL     BDIGS
      008EBC CD 8C 10         [ 4] 2793         CALL     DIGS
      008EBF CD 8C 3B         [ 4] 2794         CALL     EDIGS
      008EC2 CD 8D E9         [ 4] 2795         CALL     SPACE
      008EC5 CC 8E 13         [ 2] 2796         JP     TYPES
                                   2797 
                                   2798 ;       .       ( w -- )
                                   2799 ;       Display an integer in free
                                   2800 ;       format, preceeded by a space.
      008EC8 8E B6                 2801         .word      LINK
                           000E4A  2802 LINK = . 
      008ECA 01                    2803         .byte      1
      008ECB 2E                    2804         .ascii     "."
      008ECC                       2805 DOT:
      008ECC CD 85 55         [ 4] 2806         CALL     BASE
      008ECF CD 83 F1         [ 4] 2807         CALL     AT
      008ED2 CD 83 69         [ 4] 2808         CALL     DOLIT
      008ED5 00 0A                 2809         .word      10
      008ED7 CD 85 0D         [ 4] 2810         CALL     XORR    ;?decimal
      008EDA CD 83 9C         [ 4] 2811         CALL     QBRAN
      008EDD 8E E2                 2812         .word      DOT1
      008EDF CC 8E B9         [ 2] 2813         JP     UDOT
      008EE2 CD 8C 53         [ 4] 2814 DOT1:   CALL     STR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



      008EE5 CD 8D E9         [ 4] 2815         CALL     SPACE
      008EE8 CC 8E 13         [ 2] 2816         JP     TYPES
                                   2817 
                                   2818 ;       ?       ( a -- )
                                   2819 ;       Display contents in memory cell.
      008EEB 8E CA                 2820         .word      LINK
                                   2821         
                           000E6D  2822 LINK = . 
      008EED 01                    2823         .byte      1
      008EEE 3F                    2824         .ascii     "?"
      008EEF                       2825 QUEST:
      008EEF CD 83 F1         [ 4] 2826         CALL     AT
      008EF2 CC 8E CC         [ 2] 2827         JP     DOT
                                   2828 
                                   2829 ;; Parsing
                                   2830 
                                   2831 ;       parse   ( b u c -- b u delta ; <string> )
                                   2832 ;       Scan string delimited by c.
                                   2833 ;       Return found string and its offset.
      008EF5 8E ED                 2834         .word      LINK
                           000E77  2835 LINK = . 
      008EF7 05                    2836         .byte      5
      008EF8 70 61 72 73 65        2837         .ascii     "parse"
      008EFD                       2838 PARS:
      008EFD CD 85 64         [ 4] 2839         CALL     TEMP
      008F00 CD 83 DA         [ 4] 2840         CALL     STORE
      008F03 CD 84 C2         [ 4] 2841         CALL     OVER
      008F06 CD 84 61         [ 4] 2842         CALL     TOR
      008F09 CD 84 98         [ 4] 2843         CALL     DUPP
      008F0C CD 83 9C         [ 4] 2844         CALL     QBRAN
      008F0F 8F B5                 2845         .word    PARS8
      008F11 CD 89 6C         [ 4] 2846         CALL     ONEM
      008F14 CD 85 64         [ 4] 2847         CALL     TEMP
      008F17 CD 83 F1         [ 4] 2848         CALL     AT
      008F1A CD 89 BE         [ 4] 2849         CALL     BLANK
      008F1D CD 87 06         [ 4] 2850         CALL     EQUAL
      008F20 CD 83 9C         [ 4] 2851         CALL     QBRAN
      008F23 8F 56                 2852         .word      PARS3
      008F25 CD 84 61         [ 4] 2853         CALL     TOR
      008F28 CD 89 BE         [ 4] 2854 PARS1:  CALL     BLANK
      008F2B CD 84 C2         [ 4] 2855         CALL     OVER
      008F2E CD 84 0F         [ 4] 2856         CALL     CAT     ;skip leading blanks ONLY
      008F31 CD 86 DE         [ 4] 2857         CALL     SUBB
      008F34 CD 84 D1         [ 4] 2858         CALL     ZLESS
      008F37 CD 86 9A         [ 4] 2859         CALL     INVER
      008F3A CD 83 9C         [ 4] 2860         CALL     QBRAN
      008F3D 8F 53                 2861         .word      PARS2
      008F3F CD 89 5F         [ 4] 2862         CALL     ONEP
      008F42 CD 83 7D         [ 4] 2863         CALL     DONXT
      008F45 8F 28                 2864         .word      PARS1
      008F47 CD 84 42         [ 4] 2865         CALL     RFROM
      008F4A CD 84 8E         [ 4] 2866         CALL     DROP
      008F4D CD 89 CB         [ 4] 2867         CALL     ZERO
      008F50 CC 84 98         [ 2] 2868         JP     DUPP
      008F53 CD 84 42         [ 4] 2869 PARS2:  CALL     RFROM
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



      008F56 CD 84 C2         [ 4] 2870 PARS3:  CALL     OVER
      008F59 CD 84 A8         [ 4] 2871         CALL     SWAPP
      008F5C CD 84 61         [ 4] 2872         CALL     TOR
      008F5F CD 85 64         [ 4] 2873 PARS4:  CALL     TEMP
      008F62 CD 83 F1         [ 4] 2874         CALL     AT
      008F65 CD 84 C2         [ 4] 2875         CALL     OVER
      008F68 CD 84 0F         [ 4] 2876         CALL     CAT
      008F6B CD 86 DE         [ 4] 2877         CALL     SUBB    ;scan for delimiter
      008F6E CD 85 64         [ 4] 2878         CALL     TEMP
      008F71 CD 83 F1         [ 4] 2879         CALL     AT
      008F74 CD 89 BE         [ 4] 2880         CALL     BLANK
      008F77 CD 87 06         [ 4] 2881         CALL     EQUAL
      008F7A CD 83 9C         [ 4] 2882         CALL     QBRAN
      008F7D 8F 82                 2883         .word      PARS5
      008F7F CD 84 D1         [ 4] 2884         CALL     ZLESS
      008F82 CD 83 9C         [ 4] 2885 PARS5:  CALL     QBRAN
      008F85 8F 97                 2886         .word      PARS6
      008F87 CD 89 5F         [ 4] 2887         CALL     ONEP
      008F8A CD 83 7D         [ 4] 2888         CALL     DONXT
      008F8D 8F 5F                 2889         .word      PARS4
      008F8F CD 84 98         [ 4] 2890         CALL     DUPP
      008F92 CD 84 61         [ 4] 2891         CALL     TOR
      008F95 20 0F            [ 2] 2892         JRA     PARS7
      008F97 CD 84 42         [ 4] 2893 PARS6:  CALL     RFROM
      008F9A CD 84 8E         [ 4] 2894         CALL     DROP
      008F9D CD 84 98         [ 4] 2895         CALL     DUPP
      008FA0 CD 89 5F         [ 4] 2896         CALL     ONEP
      008FA3 CD 84 61         [ 4] 2897         CALL     TOR
      008FA6 CD 84 C2         [ 4] 2898 PARS7:  CALL     OVER
      008FA9 CD 86 DE         [ 4] 2899         CALL     SUBB
      008FAC CD 84 42         [ 4] 2900         CALL     RFROM
      008FAF CD 84 42         [ 4] 2901         CALL     RFROM
      008FB2 CC 86 DE         [ 2] 2902         JP     SUBB
      008FB5 CD 84 C2         [ 4] 2903 PARS8:  CALL     OVER
      008FB8 CD 84 42         [ 4] 2904         CALL     RFROM
      008FBB CC 86 DE         [ 2] 2905         JP     SUBB
                                   2906 
                                   2907 ;       PARSE   ( c -- b u ; <string> )
                                   2908 ;       Scan input stream and return
                                   2909 ;       counted string delimited by c.
      008FBE 8E F7                 2910         .word      LINK
                           000F40  2911 LINK = . 
      008FC0 05                    2912         .byte      5
      008FC1 50 41 52 53 45        2913         .ascii     "PARSE"
      008FC6                       2914 PARSE:
      008FC6 CD 84 61         [ 4] 2915         CALL     TOR
      008FC9 CD 8A DA         [ 4] 2916         CALL     TIB
      008FCC CD 85 73         [ 4] 2917         CALL     INN
      008FCF CD 83 F1         [ 4] 2918         CALL     AT
      008FD2 CD 86 80         [ 4] 2919         CALL     PLUS    ;current input buffer pointer
      008FD5 CD 85 83         [ 4] 2920         CALL     NTIB
      008FD8 CD 83 F1         [ 4] 2921         CALL     AT
      008FDB CD 85 73         [ 4] 2922         CALL     INN
      008FDE CD 83 F1         [ 4] 2923         CALL     AT
      008FE1 CD 86 DE         [ 4] 2924         CALL     SUBB    ;remaining count
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      008FE4 CD 84 42         [ 4] 2925         CALL     RFROM
      008FE7 CD 8E FD         [ 4] 2926         CALL     PARS
      008FEA CD 85 73         [ 4] 2927         CALL     INN
      008FED CC 8A 3A         [ 2] 2928         JP     PSTOR
                                   2929 
                                   2930 ;       .(      ( -- )
                                   2931 ;       Output following string up to next ) .
      008FF0 8F C0                 2932         .word      LINK
                           000F72  2933 LINK = . 
      008FF2 82                    2934 	.byte      IMEDD+2
      008FF3 2E 28                 2935         .ascii     ".("
      008FF5                       2936 DOTPR:
      008FF5 CD 83 69         [ 4] 2937         CALL     DOLIT
      008FF8 00 29                 2938         .word     41	; ")"
      008FFA CD 8F C6         [ 4] 2939         CALL     PARSE
      008FFD CC 8E 13         [ 2] 2940         JP     TYPES
                                   2941 
                                   2942 ;       (       ( -- )
                                   2943 ;       Ignore following string up to next ).
                                   2944 ;       A comment.
      009000 8F F2                 2945         .word      LINK
                           000F82  2946 LINK = . 
      009002 81                    2947 	.byte      IMEDD+1
      009003 28                    2948         .ascii     "("
      009004                       2949 PAREN:
      009004 CD 83 69         [ 4] 2950         CALL     DOLIT
      009007 00 29                 2951         .word     41	; ")"
      009009 CD 8F C6         [ 4] 2952         CALL     PARSE
      00900C CC 86 60         [ 2] 2953         JP     DDROP
                                   2954 
                                   2955 ;       \       ( -- )
                                   2956 ;       Ignore following text till
                                   2957 ;       end of line.
      00900F 90 02                 2958         .word      LINK
                           000F91  2959 LINK = . 
      009011 81                    2960 	.byte      IMEDD+1
      009012 5C                    2961         .ascii     "\"
      009013                       2962 BKSLA:
                           000001  2963 .if CONVERT_TO_CODE
      009013 90 AE 00 0C      [ 2] 2964         ldw y,#UCTIB ; #TIB  
      009017 90 FE            [ 2] 2965         ldw y,(y)
      009019 90 89            [ 2] 2966         pushw y ; count in TIB 
      00901B 90 AE 00 0A      [ 2] 2967         ldw y,#UINN ; >IN 
      00901F 90 BF 22         [ 2] 2968         ldw YTEMP,y
      009022 90 85            [ 2] 2969         popw y 
      009024 91 CF 22         [ 5] 2970         ldw [YTEMP],y
      009027 81               [ 4] 2971         ret 
                           000000  2972 .else
                                   2973         CALL     NTIB
                                   2974         CALL     AT
                                   2975         CALL     INN
                                   2976         JP     STORE
                                   2977 .endif 
                                   2978 
                                   2979 ;       WORD    ( c -- a ; <string> )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



                                   2980 ;       Parse a word from input stream
                                   2981 ;       and copy it to code dictionary.
      009028 90 11                 2982         .word      LINK
                           000FAA  2983 LINK = . 
      00902A 04                    2984         .byte      4
      00902B 57 4F 52 44           2985         .ascii     "WORD"
      00902F                       2986 WORDD:
      00902F CD 8F C6         [ 4] 2987         CALL     PARSE
      009032 CD 8A B8         [ 4] 2988         CALL     HERE
      009035 CD 89 34         [ 4] 2989         CALL     CELLP
      009038 CC 8B 79         [ 2] 2990         JP     PACKS
                                   2991 
                                   2992 ;       TOKEN   ( -- a ; <string> )
                                   2993 ;       Parse a word from input stream
                                   2994 ;       and copy it to name dictionary.
      00903B 90 2A                 2995         .word      LINK
                           000FBD  2996 LINK = . 
      00903D 05                    2997         .byte      5
      00903E 54 4F 4B 45 4E        2998         .ascii     "TOKEN"
      009043                       2999 TOKEN:
      009043 CD 89 BE         [ 4] 3000         CALL     BLANK
      009046 CC 90 2F         [ 2] 3001         JP     WORDD
                                   3002 
                                   3003 ;; Dictionary search
                                   3004 
                                   3005 ;       NAME>   ( na -- ca )
                                   3006 ;       Return a code address given
                                   3007 ;       a name address.
      009049 90 3D                 3008         .word      LINK
                           000FCB  3009 LINK = . 
      00904B 05                    3010         .byte      5
      00904C 4E 41 4D 45 3E        3011         .ascii     "NAME>"
      009051                       3012 NAMET:
      009051 CD 8A A1         [ 4] 3013         CALL     COUNT
      009054 CD 83 69         [ 4] 3014         CALL     DOLIT
      009057 00 1F                 3015         .word      31
      009059 CD 84 E4         [ 4] 3016         CALL     ANDD
      00905C CC 86 80         [ 2] 3017         JP     PLUS
                                   3018 
                                   3019 ;       SAME?   ( a a u -- a a f \ -0+ )
                                   3020 ;       Compare u cells in two
                                   3021 ;       strings. Return 0 if identical.
      00905F 90 4B                 3022         .word      LINK
                           000FE1  3023 LINK = . 
      009061 05                    3024         .byte       5
      009062 53 41 4D 45 3F        3025         .ascii     "SAME?"
      009067                       3026 SAMEQ:
      009067 CD 89 6C         [ 4] 3027         CALL     ONEM
      00906A CD 84 61         [ 4] 3028         CALL     TOR
      00906D 20 29            [ 2] 3029         JRA     SAME2
      00906F CD 84 C2         [ 4] 3030 SAME1:  CALL     OVER
      009072 CD 84 55         [ 4] 3031         CALL     RAT
      009075 CD 86 80         [ 4] 3032         CALL     PLUS
      009078 CD 84 0F         [ 4] 3033         CALL     CAT
      00907B CD 84 C2         [ 4] 3034         CALL     OVER
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      00907E CD 84 55         [ 4] 3035         CALL     RAT
      009081 CD 86 80         [ 4] 3036         CALL     PLUS
      009084 CD 84 0F         [ 4] 3037         CALL     CAT
      009087 CD 86 DE         [ 4] 3038         CALL     SUBB
      00908A CD 86 2F         [ 4] 3039         CALL     QDUP
      00908D CD 83 9C         [ 4] 3040         CALL     QBRAN
      009090 90 98                 3041         .word      SAME2
      009092 CD 84 42         [ 4] 3042         CALL     RFROM
      009095 CC 84 8E         [ 2] 3043         JP     DROP
      009098 CD 83 7D         [ 4] 3044 SAME2:  CALL     DONXT
      00909B 90 6F                 3045         .word      SAME1
      00909D CC 89 CB         [ 2] 3046         JP     ZERO
                                   3047 
                                   3048 ;       find    ( a va -- ca na | a F )
                                   3049 ;       Search vocabulary for string.
                                   3050 ;       Return ca and na if succeeded.
      0090A0 90 61                 3051         .word      LINK
                           001022  3052 LINK = . 
      0090A2 04                    3053         .byte      4
      0090A3 46 49 4E 44           3054         .ascii     "FIND"
      0090A7                       3055 FIND:
      0090A7 CD 84 A8         [ 4] 3056         CALL     SWAPP
      0090AA CD 84 98         [ 4] 3057         CALL     DUPP
      0090AD CD 84 0F         [ 4] 3058         CALL     CAT
      0090B0 CD 85 64         [ 4] 3059         CALL     TEMP
      0090B3 CD 83 DA         [ 4] 3060         CALL     STORE
      0090B6 CD 84 98         [ 4] 3061         CALL     DUPP
      0090B9 CD 83 F1         [ 4] 3062         CALL     AT
      0090BC CD 84 61         [ 4] 3063         CALL     TOR
      0090BF CD 89 34         [ 4] 3064         CALL     CELLP
      0090C2 CD 84 A8         [ 4] 3065         CALL     SWAPP
      0090C5 CD 83 F1         [ 4] 3066 FIND1:  CALL     AT
      0090C8 CD 84 98         [ 4] 3067         CALL     DUPP
      0090CB CD 83 9C         [ 4] 3068         CALL     QBRAN
      0090CE 91 04                 3069         .word      FIND6
      0090D0 CD 84 98         [ 4] 3070         CALL     DUPP
      0090D3 CD 83 F1         [ 4] 3071         CALL     AT
      0090D6 CD 83 69         [ 4] 3072         CALL     DOLIT
      0090D9 1F 7F                 3073         .word      MASKK
      0090DB CD 84 E4         [ 4] 3074         CALL     ANDD
      0090DE CD 84 55         [ 4] 3075         CALL     RAT
      0090E1 CD 85 0D         [ 4] 3076         CALL     XORR
      0090E4 CD 83 9C         [ 4] 3077         CALL     QBRAN
      0090E7 90 F3                 3078         .word      FIND2
      0090E9 CD 89 34         [ 4] 3079         CALL     CELLP
      0090EC CD 83 69         [ 4] 3080         CALL     DOLIT
      0090EF FF FF                 3081         .word     0xFFFF
      0090F1 20 0C            [ 2] 3082         JRA     FIND3
      0090F3 CD 89 34         [ 4] 3083 FIND2:  CALL     CELLP
      0090F6 CD 85 64         [ 4] 3084         CALL     TEMP
      0090F9 CD 83 F1         [ 4] 3085         CALL     AT
      0090FC CD 90 67         [ 4] 3086         CALL     SAMEQ
      0090FF CD 83 B3         [ 4] 3087 FIND3:  CALL     BRAN
      009102 91 13                 3088         .word      FIND4
      009104 CD 84 42         [ 4] 3089 FIND6:  CALL     RFROM
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



      009107 CD 84 8E         [ 4] 3090         CALL     DROP
      00910A CD 84 A8         [ 4] 3091         CALL     SWAPP
      00910D CD 89 43         [ 4] 3092         CALL     CELLM
      009110 CC 84 A8         [ 2] 3093         JP     SWAPP
      009113 CD 83 9C         [ 4] 3094 FIND4:  CALL     QBRAN
      009116 91 20                 3095         .word      FIND5
      009118 CD 89 43         [ 4] 3096         CALL     CELLM
      00911B CD 89 43         [ 4] 3097         CALL     CELLM
      00911E 20 A5            [ 2] 3098         JRA     FIND1
      009120 CD 84 42         [ 4] 3099 FIND5:  CALL     RFROM
      009123 CD 84 8E         [ 4] 3100         CALL     DROP
      009126 CD 84 A8         [ 4] 3101         CALL     SWAPP
      009129 CD 84 8E         [ 4] 3102         CALL     DROP
      00912C CD 89 43         [ 4] 3103         CALL     CELLM
      00912F CD 84 98         [ 4] 3104         CALL     DUPP
      009132 CD 90 51         [ 4] 3105         CALL     NAMET
      009135 CC 84 A8         [ 2] 3106         JP     SWAPP
                                   3107 
                                   3108 ;       NAME?   ( a -- ca na | a F )
                                   3109 ;       Search vocabularies for a string.
      009138 90 A2                 3110         .word      LINK
                           0010BA  3111 LINK = . 
      00913A 05                    3112         .byte      5
      00913B 4E 41 4D 45 3F        3113         .ascii     "NAME?"
      009140                       3114 NAMEQ:
      009140 CD 85 D8         [ 4] 3115         CALL   CNTXT
      009143 CC 90 A7         [ 2] 3116         JP     FIND
                                   3117 
                                   3118 ;; Terminal response
                                   3119 
                                   3120 ;       ^H      ( bot eot cur -- bot eot cur )
                                   3121 ;       Backup cursor by one character.
      009146 91 3A                 3122         .word      LINK
                           0010C8  3123 LINK = . 
      009148 02                    3124         .byte      2
      009149 5E 48                 3125         .ascii     "^H"
      00914B                       3126 BKSP:
      00914B CD 84 61         [ 4] 3127         CALL     TOR
      00914E CD 84 C2         [ 4] 3128         CALL     OVER
      009151 CD 84 42         [ 4] 3129         CALL     RFROM
      009154 CD 84 A8         [ 4] 3130         CALL     SWAPP
      009157 CD 84 C2         [ 4] 3131         CALL     OVER
      00915A CD 85 0D         [ 4] 3132         CALL     XORR
      00915D CD 83 9C         [ 4] 3133         CALL     QBRAN
      009160 91 7B                 3134         .word      BACK1
      009162 CD 83 69         [ 4] 3135         CALL     DOLIT
      009165 00 08                 3136         .word      BKSPP
      009167 CD 83 53         [ 4] 3137         CALL     EMIT
      00916A CD 89 6C         [ 4] 3138         CALL     ONEM
      00916D CD 89 BE         [ 4] 3139         CALL     BLANK
      009170 CD 83 53         [ 4] 3140         CALL     EMIT
      009173 CD 83 69         [ 4] 3141         CALL     DOLIT
      009176 00 08                 3142         .word      BKSPP
      009178 CC 83 53         [ 2] 3143         JP     EMIT
      00917B 81               [ 4] 3144 BACK1:  RET
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



                                   3145 
                                   3146 ;       TAP     ( bot eot cur c -- bot eot cur )
                                   3147 ;       Accept and echo key stroke
                                   3148 ;       and bump cursor.
      00917C 91 48                 3149         .word      LINK
                           0010FE  3150 LINK = . 
      00917E 03                    3151         .byte      3
      00917F 54 41 50              3152         .ascii     "TAP"
      009182                       3153 TAP:
      009182 CD 84 98         [ 4] 3154         CALL     DUPP
      009185 CD 83 53         [ 4] 3155         CALL     EMIT
      009188 CD 84 C2         [ 4] 3156         CALL     OVER
      00918B CD 83 FE         [ 4] 3157         CALL     CSTOR
      00918E CC 89 5F         [ 2] 3158         JP     ONEP
                                   3159 
                                   3160 ;       kTAP    ( bot eot cur c -- bot eot cur )
                                   3161 ;       Process a key stroke,
                                   3162 ;       CR or backspace.
      009191 91 7E                 3163         .word      LINK
                           001113  3164 LINK = . 
      009193 04                    3165         .byte      4
      009194 4B 54 41 50           3166         .ascii     "KTAP"
      009198                       3167 KTAP:
      009198 CD 84 98         [ 4] 3168         CALL     DUPP
      00919B CD 83 69         [ 4] 3169         CALL     DOLIT
      00919E 00 0D                 3170         .word      CRR
      0091A0 CD 85 0D         [ 4] 3171         CALL     XORR
      0091A3 CD 83 9C         [ 4] 3172         CALL     QBRAN
      0091A6 91 BE                 3173         .word      KTAP2
      0091A8 CD 83 69         [ 4] 3174         CALL     DOLIT
      0091AB 00 08                 3175         .word      BKSPP
      0091AD CD 85 0D         [ 4] 3176         CALL     XORR
      0091B0 CD 83 9C         [ 4] 3177         CALL     QBRAN
      0091B3 91 BB                 3178         .word      KTAP1
      0091B5 CD 89 BE         [ 4] 3179         CALL     BLANK
      0091B8 CC 91 82         [ 2] 3180         JP     TAP
      0091BB CC 91 4B         [ 2] 3181 KTAP1:  JP     BKSP
      0091BE CD 84 8E         [ 4] 3182 KTAP2:  CALL     DROP
      0091C1 CD 84 A8         [ 4] 3183         CALL     SWAPP
      0091C4 CD 84 8E         [ 4] 3184         CALL     DROP
      0091C7 CC 84 98         [ 2] 3185         JP     DUPP
                                   3186 
                                   3187 ;       accept  ( b u -- b u )
                                   3188 ;       Accept characters to input
                                   3189 ;       buffer. Return with actual count.
      0091CA 91 93                 3190         .word      LINK
                           00114C  3191 LINK = . 
      0091CC 06                    3192         .byte      6
      0091CD 41 43 43 45 50 54     3193         .ascii     "ACCEPT"
      0091D3                       3194 ACCEP:
      0091D3 CD 84 C2         [ 4] 3195         CALL     OVER
      0091D6 CD 86 80         [ 4] 3196         CALL     PLUS
      0091D9 CD 84 C2         [ 4] 3197         CALL     OVER
      0091DC CD 86 6B         [ 4] 3198 ACCP1:  CALL     DDUP
      0091DF CD 85 0D         [ 4] 3199         CALL     XORR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



      0091E2 CD 83 9C         [ 4] 3200         CALL     QBRAN
      0091E5 92 07                 3201         .word      ACCP4
      0091E7 CD 8D B1         [ 4] 3202         CALL     KEY
      0091EA CD 84 98         [ 4] 3203         CALL     DUPP
      0091ED CD 89 BE         [ 4] 3204         CALL     BLANK
      0091F0 CD 83 69         [ 4] 3205         CALL     DOLIT
      0091F3 00 7F                 3206         .word      127
      0091F5 CD 87 A0         [ 4] 3207         CALL     WITHI
      0091F8 CD 83 9C         [ 4] 3208         CALL     QBRAN
      0091FB 92 02                 3209         .word      ACCP2
      0091FD CD 91 82         [ 4] 3210         CALL     TAP
      009200 20 03            [ 2] 3211         JRA     ACCP3
      009202 CD 91 98         [ 4] 3212 ACCP2:  CALL     KTAP
      009205 20 D5            [ 2] 3213 ACCP3:  JRA     ACCP1
      009207 CD 84 8E         [ 4] 3214 ACCP4:  CALL     DROP
      00920A CD 84 C2         [ 4] 3215         CALL     OVER
      00920D CC 86 DE         [ 2] 3216         JP     SUBB
                                   3217 
                                   3218 ;       QUERY   ( -- )
                                   3219 ;       Accept input stream to
                                   3220 ;       terminal input buffer.
      009210 91 CC                 3221         .word      LINK
                                   3222         
                           001192  3223 LINK = . 
      009212 05                    3224         .byte      5
      009213 51 55 45 52 59        3225         .ascii     "QUERY"
      009218                       3226 QUERY:
      009218 CD 8A DA         [ 4] 3227         CALL     TIB
      00921B CD 83 69         [ 4] 3228         CALL     DOLIT
      00921E 00 50                 3229         .word      80
      009220 CD 91 D3         [ 4] 3230         CALL     ACCEP
      009223 CD 85 83         [ 4] 3231         CALL     NTIB
      009226 CD 83 DA         [ 4] 3232         CALL     STORE
      009229 CD 84 8E         [ 4] 3233         CALL     DROP
      00922C CD 89 CB         [ 4] 3234         CALL     ZERO
      00922F CD 85 73         [ 4] 3235         CALL     INN
      009232 CC 83 DA         [ 2] 3236         JP     STORE
                                   3237 
                                   3238 ;       ABORT   ( -- )
                                   3239 ;       Reset data stack and
                                   3240 ;       jump to QUIT.
      009235 92 12                 3241         .word      LINK
                           0011B7  3242 LINK = . 
      009237 05                    3243         .byte      5
      009238 41 42 4F 52 54        3244         .ascii     "ABORT"
      00923D                       3245 ABORT:
      00923D CD 93 34         [ 4] 3246         CALL     PRESE
      009240 CC 93 51         [ 2] 3247         JP     QUIT
                                   3248 
                                   3249 ;       abort"  ( f -- )
                                   3250 ;       Run time routine of ABORT".
                                   3251 ;       Abort with a message.
      009243 92 37                 3252         .word      LINK
                           0011C5  3253 LINK = . 
      009245 46                    3254 	.byte      COMPO+6
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      009246 41 42 4F 52 54        3255         .ascii     "ABORT"
      00924B 22                    3256         .byte      '"'
      00924C                       3257 ABORQ:
      00924C CD 83 9C         [ 4] 3258         CALL     QBRAN
      00924F 92 6B                 3259         .word      ABOR2   ;text flag
      009251 CD 8E 47         [ 4] 3260         CALL     DOSTR
      009254 CD 8D E9         [ 4] 3261 ABOR1:  CALL     SPACE
      009257 CD 8A A1         [ 4] 3262         CALL     COUNT
      00925A CD 8E 13         [ 4] 3263         CALL     TYPES
      00925D CD 83 69         [ 4] 3264         CALL     DOLIT
      009260 00 3F                 3265         .word     63 ; "?"
      009262 CD 83 53         [ 4] 3266         CALL     EMIT
      009265 CD 8E 31         [ 4] 3267         CALL     CR
      009268 CC 92 3D         [ 2] 3268         JP     ABORT   ;pass error string
      00926B CD 8E 47         [ 4] 3269 ABOR2:  CALL     DOSTR
      00926E CC 84 8E         [ 2] 3270         JP     DROP
                                   3271 
                                   3272 ;; The text interpreter
                                   3273 
                                   3274 ;       $INTERPRET      ( a -- )
                                   3275 ;       Interpret a word. If failed,
                                   3276 ;       try to convert it to an integer.
      009271 92 45                 3277         .word      LINK
                           0011F3  3278 LINK = . 
      009273 0A                    3279         .byte      10
      009274 24 49 4E 54 45 52 50  3280         .ascii     "$INTERPRET"
             52 45 54
      00927E                       3281 INTER:
      00927E CD 91 40         [ 4] 3282         CALL     NAMEQ
      009281 CD 86 2F         [ 4] 3283         CALL     QDUP    ;?defined
      009284 CD 83 9C         [ 4] 3284         CALL     QBRAN
      009287 92 A8                 3285         .word      INTE1
      009289 CD 83 F1         [ 4] 3286         CALL     AT
      00928C CD 83 69         [ 4] 3287         CALL     DOLIT
      00928F 40 00                 3288 	.word       0x4000	; COMPO*256
      009291 CD 84 E4         [ 4] 3289         CALL     ANDD    ;?compile only lexicon bits
      009294 CD 92 4C         [ 4] 3290         CALL     ABORQ
      009297 0D                    3291         .byte      13
      009298 20 63 6F 6D 70 69 6C  3292         .ascii     " compile only"
             65 20 6F 6E 6C 79
      0092A5 CC 83 C3         [ 2] 3293         JP     EXECU
      0092A8 CD 8C DE         [ 4] 3294 INTE1:  CALL     NUMBQ   ;convert a number
      0092AB CD 83 9C         [ 4] 3295         CALL     QBRAN
      0092AE 92 54                 3296         .word    ABOR1
      0092B0 81               [ 4] 3297         RET
                                   3298 
                                   3299 ;       [       ( -- )
                                   3300 ;       Start  text interpreter.
      0092B1 92 73                 3301         .word      LINK
                           001233  3302 LINK = . 
      0092B3 81                    3303 	.byte      IMEDD+1
      0092B4 5B                    3304         .ascii     "["
      0092B5                       3305 LBRAC:
      0092B5 CD 83 69         [ 4] 3306         CALL   DOLIT
      0092B8 92 7E                 3307         .word  INTER
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      0092BA CD 85 B6         [ 4] 3308         CALL   TEVAL
      0092BD CC 83 DA         [ 2] 3309         JP     STORE
                                   3310 
                                   3311 ;       .OK     ( -- )
                                   3312 ;       Display 'ok' while interpreting.
      0092C0 92 B3                 3313         .word      LINK
                           001242  3314 LINK = . 
      0092C2 03                    3315         .byte      3
      0092C3 2E 4F 4B              3316         .ascii     ".OK"
      0092C6                       3317 DOTOK:
      0092C6 CD 83 69         [ 4] 3318         CALL     DOLIT
      0092C9 92 7E                 3319         .word      INTER
      0092CB CD 85 B6         [ 4] 3320         CALL     TEVAL
      0092CE CD 83 F1         [ 4] 3321         CALL     AT
      0092D1 CD 87 06         [ 4] 3322         CALL     EQUAL
      0092D4 CD 83 9C         [ 4] 3323         CALL     QBRAN
      0092D7 92 E0                 3324         .word      DOTO1
      0092D9 CD 8E 70         [ 4] 3325         CALL     DOTQP
      0092DC 03                    3326         .byte      3
      0092DD 20 6F 6B              3327         .ascii     " ok"
      0092E0 CC 8E 31         [ 2] 3328 DOTO1:  JP     CR
                                   3329 
                                   3330 ;       ?STACK  ( -- )
                                   3331 ;       Abort if stack underflows.
      0092E3 92 C2                 3332         .word      LINK
                           001265  3333 LINK = . 
      0092E5 06                    3334         .byte      6
      0092E6 3F 53 54 41 43 4B     3335         .ascii     "?STACK"
      0092EC                       3336 QSTAC: 
      0092EC CD 8A 0E         [ 4] 3337         CALL     DEPTH
      0092EF CD 84 D1         [ 4] 3338         CALL     ZLESS   ;check only for underflow
      0092F2 CD 92 4C         [ 4] 3339         CALL     ABORQ
      0092F5 0B                    3340         .byte      11
      0092F6 20 75 6E 64 65 72 66  3341         .ascii     " underflow "
             6C 6F 77 20
      009301 81               [ 4] 3342         RET
                                   3343 
                                   3344 ;       EVAL    ( -- )
                                   3345 ;       Interpret  input stream.
      009302 92 E5                 3346         .word      LINK
                           001284  3347 LINK = . 
      009304 04                    3348         .byte      4
      009305 45 56 41 4C           3349         .ascii     "EVAL"
      009309                       3350 EVAL:
      009309 CD 90 43         [ 4] 3351 EVAL1:  CALL     TOKEN
      00930C CD 84 98         [ 4] 3352         CALL     DUPP
      00930F CD 84 0F         [ 4] 3353         CALL     CAT     ;?input stream empty
      009312 CD 83 9C         [ 4] 3354         CALL     QBRAN
      009315 93 25                 3355         .word    EVAL2
      009317 CD 85 B6         [ 4] 3356         CALL     TEVAL
      00931A CD 8A EE         [ 4] 3357         CALL     ATEXE
      00931D CD 92 EC         [ 4] 3358         CALL     QSTAC   ;evaluate input, check stack
      009320 CD 83 B3         [ 4] 3359         CALL     BRAN
      009323 93 09                 3360         .word    EVAL1
      009325 CD 84 8E         [ 4] 3361 EVAL2:  CALL     DROP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      009328 CC 92 C6         [ 2] 3362         JP       DOTOK
                                   3363 
                                   3364 ;       PRESET  ( -- )
                                   3365 ;       Reset data stack pointer and
                                   3366 ;       terminal input buffer.
      00932B 93 04                 3367         .word      LINK
                           0012AD  3368 LINK = . 
      00932D 06                    3369         .byte      6
      00932E 50 52 45 53 45 54     3370         .ascii     "PRESET"
      009334                       3371 PRESE:
      009334 CD 83 69         [ 4] 3372         CALL     DOLIT
      009337 16 70                 3373         .word      SPP
      009339 CD 84 85         [ 4] 3374         CALL     SPSTO
      00933C CD 83 69         [ 4] 3375         CALL     DOLIT
      00933F 17 00                 3376         .word      TIBB
      009341 CD 85 83         [ 4] 3377         CALL     NTIB
      009344 CD 89 34         [ 4] 3378         CALL     CELLP
      009347 CC 83 DA         [ 2] 3379         JP     STORE
                                   3380 
                                   3381 ;       QUIT    ( -- )
                                   3382 ;       Reset return stack pointer
                                   3383 ;       and start text interpreter.
      00934A 93 2D                 3384         .word      LINK
                           0012CC  3385 LINK = . 
      00934C 04                    3386         .byte      4
      00934D 51 55 49 54           3387         .ascii     "QUIT"
      009351                       3388 QUIT:
      009351 CD 83 69         [ 4] 3389         CALL     DOLIT
      009354 17 FF                 3390         .word      RPP
      009356 CD 84 2C         [ 4] 3391         CALL     RPSTO   ;reset return stack pointer
      009359 CD 92 B5         [ 4] 3392 QUIT1:  CALL     LBRAC   ;start interpretation
      00935C CD 92 18         [ 4] 3393 QUIT2:  CALL     QUERY   ;get input
      00935F CD 93 09         [ 4] 3394         CALL     EVAL
      009362 20 F8            [ 2] 3395         JRA     QUIT2   ;continue till error
                                   3396 
                                   3397 ;; The compiler
                                   3398 
                                   3399 ;       '       ( -- ca )
                                   3400 ;       Search vocabularies for
                                   3401 ;       next word in input stream.
      009364 93 4C                 3402         .word      LINK
                           0012E6  3403 LINK = . 
      009366 01                    3404         .byte      1
      009367 27                    3405         .ascii     "'"
      009368                       3406 TICK:
      009368 CD 90 43         [ 4] 3407         CALL     TOKEN
      00936B CD 91 40         [ 4] 3408         CALL     NAMEQ   ;?defined
      00936E CD 83 9C         [ 4] 3409         CALL     QBRAN
      009371 92 54                 3410         .word      ABOR1
      009373 81               [ 4] 3411         RET     ;yes, push code address
                                   3412 
                                   3413 ;       ALLOT   ( n -- )
                           000001  3414 .if PICATOUT_MOD
                                   3415 ;       Allocate n bytes to RAM 
                           000000  3416 .else 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



                                   3417 ;       Allocate n bytes to  code dictionary.
                                   3418 .endif 
      009374 93 66                 3419         .word      LINK
                           0012F6  3420 LINK = . 
      009376 05                    3421         .byte      5
      009377 41 4C 4C 4F 54        3422         .ascii     "ALLOT"
      00937C                       3423 ALLOT:
      00937C CD 85 E6         [ 4] 3424         CALL     VPP
                           000001  3425 .if PICATOUT_MOD
                                   3426 ; must update APP_VP each time VP is modidied
      00937F CD 8A 3A         [ 4] 3427         call PSTOR 
      009382 CD 9A 5A         [ 4] 3428         call UPDATVP 
                           000000  3429 .else
                                   3430         JP     PSTOR
                                   3431 .endif ;PICATOUT_MOD
                                   3432 
                                   3433 ;       ,       ( w -- )
                                   3434 ;         Compile an integer into
                                   3435 ;         variable space.
      009385 93 76                 3436         .word      LINK
                           001307  3437 LINK = . 
      009387 01                    3438         .byte      1
      009388 2C                    3439         .ascii     ","
      009389                       3440 COMMA:
      009389 CD 8A B8         [ 4] 3441         CALL     HERE
      00938C CD 84 98         [ 4] 3442         CALL     DUPP
      00938F CD 89 34         [ 4] 3443         CALL     CELLP   ;cell boundary
      009392 CD 85 E6         [ 4] 3444         CALL     VPP
      009395 CD 83 DA         [ 4] 3445         CALL     STORE
      009398 CC 83 DA         [ 2] 3446         JP     STORE
                                   3447 
                                   3448 ;       C,      ( c -- )
                                   3449 ;       Compile a byte into
                                   3450 ;       variables space.
      00939B 93 87                 3451        .word      LINK
                           00131D  3452 LINK = . 
      00939D 02                    3453         .byte      2
      00939E 43 2C                 3454         .ascii     "C,"
      0093A0                       3455 CCOMMA:
      0093A0 CD 8A B8         [ 4] 3456         CALL     HERE
      0093A3 CD 84 98         [ 4] 3457         CALL     DUPP
      0093A6 CD 89 5F         [ 4] 3458         CALL     ONEP
      0093A9 CD 85 E6         [ 4] 3459         CALL     VPP
      0093AC CD 83 DA         [ 4] 3460         CALL     STORE
      0093AF CC 83 FE         [ 2] 3461         JP     CSTOR
                                   3462 
                                   3463 ;       [COMPILE]       ( -- ; <string> )
                                   3464 ;       Compile next immediate
                                   3465 ;       word into code dictionary.
      0093B2 93 9D                 3466         .word      LINK
                           001334  3467 LINK = . 
      0093B4 89                    3468 	.byte      IMEDD+9
      0093B5 5B 43 4F 4D 50 49 4C  3469         .ascii     "[COMPILE]"
             45 5D
      0093BE                       3470 BCOMP:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      0093BE CD 93 68         [ 4] 3471         CALL     TICK
      0093C1 CC 96 81         [ 2] 3472         JP     JSRC
                                   3473 
                                   3474 ;       COMPILE ( -- )
                                   3475 ;       Compile next jsr in
                                   3476 ;       colon list to code dictionary.
      0093C4 93 B4                 3477         .word      LINK
                           001346  3478 LINK = . 
      0093C6 47                    3479 	.byte      COMPO+7
      0093C7 43 4F 4D 50 49 4C 45  3480         .ascii     "COMPILE"
      0093CE                       3481 COMPI:
      0093CE CD 84 42         [ 4] 3482         CALL     RFROM
                           000001  3483 .if PICATOUT_MOD
                                   3484 ; no need to increment
                           000000  3485 .else
                                   3486         CALL     ONEP
                                   3487 .endif 
      0093D1 CD 84 98         [ 4] 3488         CALL     DUPP
      0093D4 CD 83 F1         [ 4] 3489         CALL     AT
      0093D7 CD 96 81         [ 4] 3490         CALL     JSRC    ;compile subroutine
      0093DA CD 89 34         [ 4] 3491         CALL     CELLP
                           000001  3492 .if PICATOUT_MOD
      0093DD 90 93            [ 1] 3493         ldw y,x 
      0093DF 90 FE            [ 2] 3494         ldw y,(y)
      0093E1 1C 00 02         [ 2] 3495         addw x,#CELLL 
      0093E4 90 FC            [ 2] 3496         jp (y)
                           000000  3497 .else 
                                   3498         JP     TOR
                                   3499 .endif 
                                   3500 
                                   3501 ;       LITERAL ( w -- )
                                   3502 ;       Compile tos to dictionary
                                   3503 ;       as an integer literal.
      0093E6 93 C6                 3504         .word      LINK
                           001368  3505 LINK = . 
      0093E8 87                    3506 	.byte      IMEDD+7
      0093E9 4C 49 54 45 52 41 4C  3507         .ascii     "LITERAL"
      0093F0                       3508 LITER:
      0093F0 CD 93 CE         [ 4] 3509         CALL     COMPI
                           000001  3510 .if PICATOUT_MOD
      0093F3 83 69                 3511         .word DOLIT 
                           000000  3512 .else         
                                   3513         CALL     DOLIT
                                   3514 .endif 
      0093F5 CC 93 89         [ 2] 3515         JP     COMMA
                                   3516 
                                   3517 ;       $,"     ( -- )
                                   3518 ;       Compile a literal string
                                   3519 ;       up to next " .
      0093F8 93 E8                 3520         .word      LINK
                           00137A  3521 LINK = . 
      0093FA 03                    3522         .byte      3
      0093FB 24 2C 22              3523         .byte     '$',',','"'
      0093FE                       3524 STRCQ:
      0093FE CD 83 69         [ 4] 3525         CALL     DOLIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      009401 00 22                 3526         .word     34	; "
      009403 CD 8F C6         [ 4] 3527         CALL     PARSE
      009406 CD 8A B8         [ 4] 3528         CALL     HERE
      009409 CD 8B 79         [ 4] 3529         CALL     PACKS   ;string to code dictionary
      00940C CD 8A A1         [ 4] 3530         CALL     COUNT
      00940F CD 86 80         [ 4] 3531         CALL     PLUS    ;calculate aligned end of string
      009412 CD 85 E6         [ 4] 3532         CALL     VPP
      009415 CC 83 DA         [ 2] 3533         JP     STORE
                                   3534 
                                   3535 ;; Structures
                                   3536 
                                   3537 ;       FOR     ( -- a )
                                   3538 ;       Start a FOR-NEXT loop
                                   3539 ;       structure in a colon definition.
      009418 93 FA                 3540         .word      LINK
                           00139A  3541 LINK = . 
      00941A 83                    3542 	.byte      IMEDD+3
      00941B 46 4F 52              3543         .ascii     "FOR"
      00941E                       3544 FOR:
      00941E CD 93 CE         [ 4] 3545         CALL     COMPI
                           000001  3546 .if PICATOUT_MOD
      009421 84 61                 3547         .word TOR 
                           000000  3548 .else
                                   3549         CALL     TOR
                                   3550 .endif
      009423 CC 8A B8         [ 2] 3551         JP     HERE
                                   3552 
                                   3553 ;       NEXT    ( a -- )
                                   3554 ;       Terminate a FOR-NEXT loop.
      009426 94 1A                 3555         .word      LINK
                           0013A8  3556 LINK = . 
      009428 84                    3557 	.byte      IMEDD+4
      009429 4E 45 58 54           3558         .ascii     "NEXT"
      00942D                       3559 NEXT:
      00942D CD 93 CE         [ 4] 3560         CALL     COMPI
                           000001  3561 .if PICATOUT_MOD
      009430 83 7D                 3562         .word DONXT 
                           000000  3563 .else 
                                   3564         CALL     DONXT
                                   3565 .endif         
                           000001  3566 .if PICATOUT_MOD
      009432 CD 86 1F         [ 4] 3567         call ADRADJ
                                   3568 .endif ; PICATOUT_MOD
      009435 CC 93 89         [ 2] 3569         JP     COMMA
                                   3570 
                                   3571 ;       I ( -- n )
                                   3572 ;       stack FOR-NEXT COUNTER 
      009438 94 28                 3573         .word LINK 
                           0013BA  3574         LINK=.
      00943A 01                    3575         .byte 1 
      00943B 49                    3576         .ascii "I"
      00943C                       3577 IFETCH: 
      00943C 1D 00 02         [ 2] 3578         subw x,#CELLL 
      00943F 16 03            [ 2] 3579         ldw y,(3,sp)
      009441 FF               [ 2] 3580         ldw (x),y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      009442 81               [ 4] 3581         ret 
                                   3582 
                                   3583 ;       BEGIN   ( -- a )
                                   3584 ;       Start an infinite or
                                   3585 ;       indefinite loop structure.
      009443 94 3A                 3586         .word      LINK
                           0013C5  3587 LINK = . 
      009445 85                    3588 	.byte      IMEDD+5
      009446 42 45 47 49 4E        3589         .ascii     "BEGIN"
      00944B                       3590 BEGIN:
      00944B CC 8A B8         [ 2] 3591         JP     HERE
                                   3592 
                                   3593 ;       UNTIL   ( a -- )
                                   3594 ;       Terminate a BEGIN-UNTIL
                                   3595 ;       indefinite loop structure.
      00944E 94 45                 3596         .word      LINK
                           0013D0  3597 LINK = . 
      009450 85                    3598 	.byte      IMEDD+5
      009451 55 4E 54 49 4C        3599         .ascii     "UNTIL"
      009456                       3600 UNTIL:
      009456 CD 93 CE         [ 4] 3601         CALL     COMPI
                           000001  3602 .if PICATOUT_MOD
      009459 83 9C                 3603         .word    QBRAN 
                           000000  3604 .else 
                                   3605         CALL     QBRAN
                                   3606 .endif 
                           000001  3607 .if PICATOUT_MOD 
      00945B CD 86 1F         [ 4] 3608         call ADRADJ
                                   3609 .endif ; PICATOUT_MOD
      00945E CC 93 89         [ 2] 3610         JP     COMMA
                                   3611 
                                   3612 ;       AGAIN   ( a -- )
                                   3613 ;       Terminate a BEGIN-AGAIN
                                   3614 ;       infinite loop structure.
      009461 94 50                 3615         .word      LINK
                           0013E3  3616 LINK = . 
      009463 85                    3617 	.byte      IMEDD+5
      009464 41 47 41 49 4E        3618         .ascii     "AGAIN"
      009469                       3619 AGAIN:
      009469 CD 93 CE         [ 4] 3620         CALL     COMPI
                           000001  3621 .if PICATOUT_MOD
      00946C 83 B3                 3622         .word BRAN
                           000000  3623 .else
                                   3624         CALL     BRAN
                                   3625 .endif 
                           000001  3626 .if PICATOUT_MOD 
      00946E CD 86 1F         [ 4] 3627         call ADRADJ 
                                   3628 .endif ; PICATOUT_MOD
      009471 CC 93 89         [ 2] 3629         JP     COMMA
                                   3630 
                                   3631 ;       IF      ( -- A )
                                   3632 ;       Begin a conditional branch.
      009474 94 63                 3633         .word      LINK
                           0013F6  3634 LINK = . 
      009476 82                    3635 	.byte      IMEDD+2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



      009477 49 46                 3636         .ascii     "IF"
      009479                       3637 IFF:
      009479 CD 93 CE         [ 4] 3638         CALL     COMPI
                           000001  3639 .if PICATOUT_MOD
      00947C 83 9C                 3640         .word QBRAN
                           000000  3641 .else
                                   3642         CALL     QBRAN
                                   3643 .endif 
      00947E CD 8A B8         [ 4] 3644         CALL     HERE
      009481 CD 89 CB         [ 4] 3645         CALL     ZERO
      009484 CC 93 89         [ 2] 3646         JP     COMMA
                                   3647 
                                   3648 ;       THEN        ( A -- )
                                   3649 ;       Terminate a conditional branch structure.
      009487 94 76                 3650         .word      LINK
                           001409  3651 LINK = . 
      009489 84                    3652 	.byte      IMEDD+4
      00948A 54 48 45 4E           3653         .ascii     "THEN"
      00948E                       3654 THENN:
      00948E CD 8A B8         [ 4] 3655         CALL     HERE
                           000001  3656 .if PICATOUT_MOD 
      009491 CD 86 1F         [ 4] 3657         call ADRADJ 
                                   3658 .endif ; PICATOUT_MOD
      009494 CD 84 A8         [ 4] 3659         CALL     SWAPP
      009497 CC 83 DA         [ 2] 3660         JP     STORE
                                   3661 
                                   3662 ;       ELSE        ( A -- A )
                                   3663 ;       Start the false clause in an IF-ELSE-THEN structure.
      00949A 94 89                 3664         .word      LINK
                           00141C  3665 LINK = . 
      00949C 84                    3666 	.byte      IMEDD+4
      00949D 45 4C 53 45           3667         .ascii     "ELSE"
      0094A1                       3668 ELSEE:
      0094A1 CD 93 CE         [ 4] 3669         CALL     COMPI
                           000001  3670 .if PICATOUT_MOD
      0094A4 83 B3                 3671         .word BRAN
                           000000  3672 .else
                                   3673         CALL     BRAN
                                   3674 .endif 
      0094A6 CD 8A B8         [ 4] 3675         CALL     HERE
      0094A9 CD 89 CB         [ 4] 3676         CALL     ZERO
      0094AC CD 93 89         [ 4] 3677         CALL     COMMA
      0094AF CD 84 A8         [ 4] 3678         CALL     SWAPP
      0094B2 CD 8A B8         [ 4] 3679         CALL     HERE
                           000001  3680 .if PICATOUT_MOD 
      0094B5 CD 86 1F         [ 4] 3681         call ADRADJ 
                                   3682 .endif ; PICATOUT_MOD
      0094B8 CD 84 A8         [ 4] 3683         CALL     SWAPP
      0094BB CC 83 DA         [ 2] 3684         JP     STORE
                                   3685 
                                   3686 ;       AHEAD       ( -- A )
                                   3687 ;       Compile a forward branch instruction.
      0094BE 94 9C                 3688         .word      LINK
                           001440  3689 LINK = . 
      0094C0 85                    3690 	.byte      IMEDD+5
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      0094C1 41 48 45 41 44        3691         .ascii     "AHEAD"
      0094C6                       3692 AHEAD:
      0094C6 CD 93 CE         [ 4] 3693         CALL     COMPI
                           000001  3694 .if PICATOUT_MOD
      0094C9 83 B3                 3695         .word BRAN
                           000000  3696 .else
                                   3697         CALL     BRAN
                                   3698 .endif 
      0094CB CD 8A B8         [ 4] 3699         CALL     HERE
      0094CE CD 89 CB         [ 4] 3700         CALL     ZERO
      0094D1 CC 93 89         [ 2] 3701         JP     COMMA
                                   3702 
                                   3703 ;       WHILE       ( a -- A a )
                                   3704 ;       Conditional branch out of a BEGIN-WHILE-REPEAT loop.
      0094D4 94 C0                 3705         .word      LINK
                           001456  3706 LINK = . 
      0094D6 85                    3707 	.byte      IMEDD+5
      0094D7 57 48 49 4C 45        3708         .ascii     "WHILE"
      0094DC                       3709 WHILE:
      0094DC CD 93 CE         [ 4] 3710         CALL     COMPI
                           000001  3711 .if PICATOUT_MOD
      0094DF 83 9C                 3712         .word QBRAN
                           000000  3713 .else
                                   3714         CALL     QBRAN
                                   3715 .endif 
      0094E1 CD 8A B8         [ 4] 3716         CALL     HERE
      0094E4 CD 89 CB         [ 4] 3717         CALL     ZERO
      0094E7 CD 93 89         [ 4] 3718         CALL     COMMA
      0094EA CC 84 A8         [ 2] 3719         JP     SWAPP
                                   3720 
                                   3721 ;       REPEAT      ( A a -- )
                                   3722 ;       Terminate a BEGIN-WHILE-REPEAT indefinite loop.
      0094ED 94 D6                 3723         .word      LINK
                           00146F  3724 LINK = . 
      0094EF 86                    3725         .byte      IMEDD+6
      0094F0 52 45 50 45 41 54     3726         .ascii     "REPEAT"
      0094F6                       3727 REPEA:
      0094F6 CD 93 CE         [ 4] 3728         CALL     COMPI
                           000001  3729 .if PICATOUT_MOD
      0094F9 83 B3                 3730         .word BRAN
                           000000  3731 .else
                                   3732         CALL     BRAN
                                   3733 .endif 
                           000001  3734 .if PICATOUT_MOD 
      0094FB CD 86 1F         [ 4] 3735         call ADRADJ 
                                   3736 .endif ; PICATOUT_MOD
      0094FE CD 93 89         [ 4] 3737         CALL     COMMA
      009501 CD 8A B8         [ 4] 3738         CALL     HERE
                           000001  3739 .if PICATOUT_MOD 
      009504 CD 86 1F         [ 4] 3740         call ADRADJ 
                                   3741 .endif ; PICATOUT_MOD
      009507 CD 84 A8         [ 4] 3742         CALL     SWAPP
      00950A CC 83 DA         [ 2] 3743         JP     STORE
                                   3744 
                                   3745 ;       AFT         ( a -- a A )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



                                   3746 ;       Jump to THEN in a FOR-AFT-THEN-NEXT loop the first time through.
      00950D 94 EF                 3747         .word      LINK
                           00148F  3748 LINK = . 
      00950F 83                    3749 	.byte      IMEDD+3
      009510 41 46 54              3750         .ascii     "AFT"
      009513                       3751 AFT:
      009513 CD 84 8E         [ 4] 3752         CALL     DROP
      009516 CD 94 C6         [ 4] 3753         CALL     AHEAD
      009519 CD 8A B8         [ 4] 3754         CALL     HERE
      00951C CC 84 A8         [ 2] 3755         JP     SWAPP
                                   3756 
                                   3757 ;       ABORT"      ( -- ; <string> )
                                   3758 ;       Conditional abort with an error message.
      00951F 95 0F                 3759         .word      LINK
                           0014A1  3760 LINK = . 
      009521 86                    3761 	.byte      IMEDD+6
      009522 41 42 4F 52 54        3762         .ascii     "ABORT"
      009527 22                    3763         .byte      '"'
      009528                       3764 ABRTQ:
      009528 CD 93 CE         [ 4] 3765         CALL     COMPI
                           000001  3766 .if PICATOUT_MOD
      00952B 92 4C                 3767         .word ABORQ
                           000000  3768 .else
                                   3769         CALL     ABORQ
                                   3770 .endif
      00952D CC 93 FE         [ 2] 3771         JP     STRCQ
                                   3772 
                                   3773 ;       $"     ( -- ; <string> )
                                   3774 ;       Compile an inline string literal.
      009530 95 21                 3775         .word      LINK
                           0014B2  3776 LINK = . 
      009532 82                    3777 	.byte      IMEDD+2
      009533 24 22                 3778         .byte     '$','"'
      009535                       3779 STRQ:
      009535 CD 93 CE         [ 4] 3780         CALL     COMPI
                           000001  3781 .if PICATOUT_MOD
      009538 8E 66                 3782         .word STRQP 
                           000000  3783 .else
                                   3784         CALL     STRQP
                                   3785 .endif
      00953A CC 93 FE         [ 2] 3786         JP     STRCQ
                                   3787 
                                   3788 ;       ."          ( -- ; <string> )
                                   3789 ;       Compile an inline string literal to be typed out at run time.
      00953D 95 32                 3790         .word      LINK
                           0014BF  3791 LINK = . 
      00953F 82                    3792 	.byte      IMEDD+2
      009540 2E 22                 3793         .byte     '.','"'
      009542                       3794 DOTQ:
      009542 CD 93 CE         [ 4] 3795         CALL     COMPI
                           000001  3796 .if PICATOUT_MOD
      009545 8E 70                 3797         .word DOTQP 
                           000000  3798 .else
                                   3799         CALL     DOTQP
                                   3800 .endif 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      009547 CC 93 FE         [ 2] 3801         JP     STRCQ
                                   3802 
                                   3803 ;; Name compiler
                                   3804 
                                   3805 ;       ?UNIQUE ( a -- a )
                                   3806 ;       Display a warning message
                                   3807 ;       if word already exists.
      00954A 95 3F                 3808         .word      LINK
                           0014CC  3809 LINK = . 
      00954C 07                    3810         .byte      7
      00954D 3F 55 4E 49 51 55 45  3811         .ascii     "?UNIQUE"
      009554                       3812 UNIQU:
      009554 CD 84 98         [ 4] 3813         CALL     DUPP
      009557 CD 91 40         [ 4] 3814         CALL     NAMEQ   ;?name exists
      00955A CD 83 9C         [ 4] 3815         CALL     QBRAN
      00955D 95 73                 3816         .word      UNIQ1
      00955F CD 8E 70         [ 4] 3817         CALL     DOTQP   ;redef are OK
      009562 07                    3818         .byte       7
      009563 20 72 65 44 65 66 20  3819         .ascii     " reDef "       
      00956A CD 84 C2         [ 4] 3820         CALL     OVER
      00956D CD 8A A1         [ 4] 3821         CALL     COUNT
      009570 CD 8E 13         [ 4] 3822         CALL     TYPES   ;just in case
      009573 CC 84 8E         [ 2] 3823 UNIQ1:  JP     DROP
                                   3824 
                                   3825 ;       $,n     ( na -- )
                                   3826 ;       Build a new dictionary name
                                   3827 ;       using string at na.
                           000001  3828 .if PICATOUT_MOD
                                   3829 ; compile dans l'espace des variables 
                                   3830 .endif 
      009576 95 4C                 3831         .word      LINK
                           0014F8  3832 LINK = . 
      009578 03                    3833         .byte      3
      009579 24 2C 6E              3834         .ascii     "$,n"
      00957C                       3835 SNAME:
      00957C CD 84 98         [ 4] 3836         CALL     DUPP
      00957F CD 84 0F         [ 4] 3837         CALL     CAT     ;?null input
      009582 CD 83 9C         [ 4] 3838         CALL     QBRAN
      009585 95 B2                 3839         .word      PNAM1
      009587 CD 95 54         [ 4] 3840         CALL     UNIQU   ;?redefinition
      00958A CD 84 98         [ 4] 3841         CALL     DUPP
      00958D CD 8A A1         [ 4] 3842         CALL     COUNT
      009590 CD 86 80         [ 4] 3843         CALL     PLUS
      009593 CD 85 E6         [ 4] 3844         CALL     VPP
      009596 CD 83 DA         [ 4] 3845         CALL     STORE
      009599 CD 84 98         [ 4] 3846         CALL     DUPP
      00959C CD 86 04         [ 4] 3847         CALL     LAST
      00959F CD 83 DA         [ 4] 3848         CALL     STORE   ;save na for vocabulary link
      0095A2 CD 89 43         [ 4] 3849         CALL     CELLM   ;link address
      0095A5 CD 85 D8         [ 4] 3850         CALL     CNTXT
      0095A8 CD 83 F1         [ 4] 3851         CALL     AT
      0095AB CD 84 A8         [ 4] 3852         CALL     SWAPP
      0095AE CD 83 DA         [ 4] 3853         CALL     STORE
      0095B1 81               [ 4] 3854         RET     ;save code pointer
      0095B2 CD 8E 66         [ 4] 3855 PNAM1:  CALL     STRQP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



      0095B5 05                    3856         .byte      5
      0095B6 20 6E 61 6D 65        3857         .ascii     " name" ;null input
      0095BB CC 92 54         [ 2] 3858         JP     ABOR1
                                   3859 
                                   3860 ;; FORTH compiler
                                   3861 
                                   3862 ;       $COMPILE        ( a -- )
                                   3863 ;       Compile next word to
                                   3864 ;       dictionary as a token or literal.
      0095BE 95 78                 3865         .word      LINK
                           001540  3866 LINK = . 
      0095C0 08                    3867         .byte      8
      0095C1 24 43 4F 4D 50 49 4C  3868         .ascii     "$COMPILE"
             45
      0095C9                       3869 SCOMP:
      0095C9 CD 91 40         [ 4] 3870         CALL     NAMEQ
      0095CC CD 86 2F         [ 4] 3871         CALL     QDUP    ;?defined
      0095CF CD 83 9C         [ 4] 3872         CALL     QBRAN
      0095D2 95 EA                 3873         .word      SCOM2
      0095D4 CD 83 F1         [ 4] 3874         CALL     AT
      0095D7 CD 83 69         [ 4] 3875         CALL     DOLIT
      0095DA 80 00                 3876         .word     0x8000	;  IMEDD*256
      0095DC CD 84 E4         [ 4] 3877         CALL     ANDD    ;?immediate
      0095DF CD 83 9C         [ 4] 3878         CALL     QBRAN
      0095E2 95 E7                 3879         .word      SCOM1
      0095E4 CC 83 C3         [ 2] 3880         JP     EXECU
      0095E7 CC 96 81         [ 2] 3881 SCOM1:  JP     JSRC
      0095EA CD 8C DE         [ 4] 3882 SCOM2:  CALL     NUMBQ   ;try to convert to number
      0095ED CD 83 9C         [ 4] 3883         CALL     QBRAN
      0095F0 92 54                 3884         .word      ABOR1
      0095F2 CC 93 F0         [ 2] 3885         JP     LITER
                                   3886 
                                   3887 ;       OVERT   ( -- )
                                   3888 ;       Link a new word into vocabulary.
      0095F5 95 C0                 3889         .word      LINK
                           001577  3890 LINK = . 
      0095F7 05                    3891         .byte      5
      0095F8 4F 56 45 52 54        3892         .ascii     "OVERT"
      0095FD                       3893 OVERT:
      0095FD CD 86 04         [ 4] 3894         CALL     LAST
      009600 CD 83 F1         [ 4] 3895         CALL     AT
      009603 CD 85 D8         [ 4] 3896         CALL     CNTXT
      009606 CC 83 DA         [ 2] 3897         JP     STORE
                                   3898 
                                   3899 ;       ;       ( -- )
                                   3900 ;       Terminate a colon definition.
      009609 95 F7                 3901         .word      LINK
                           00158B  3902 LINK = . 
      00960B C1                    3903 	.byte      IMEDD+COMPO+1
      00960C 3B                    3904         .ascii     ";"
      00960D                       3905 SEMIS:
      00960D CD 93 CE         [ 4] 3906         CALL     COMPI
                           000001  3907 .if PICATOUT_MOD
      009610 83 D3                 3908         .word EXIT 
                           000000  3909 .else
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



                                   3910         CALL     EXIT
                                   3911 .endif 
      009612 CD 92 B5         [ 4] 3912         CALL     LBRAC
                           000001  3913 .if PICATOUT_MOD
      009615 CD 95 FD         [ 4] 3914         call OVERT 
      009618 CD 9F 26         [ 4] 3915         CALL FMOVE
      00961B CD 86 2F         [ 4] 3916         call QDUP 
      00961E CD 83 9C         [ 4] 3917         call QBRAN 
      009621 96 26                 3918         .word 1$ 
      009623 CD 9F BA         [ 4] 3919         CALL UPDATPTR 
      009626 81               [ 4] 3920 1$:     RET 
                           000000  3921 .else 
                                   3922         JP     OVERT
                                   3923 .endif 
                                   3924 
                           000001  3925 .if PICATOUT_MOD
                                   3926 ;       Terminate an ISR definition 
                                   3927 ;       retourn ca of ISR as double
                                   3928 ;       I; ( -- ud )
      009627 96 0B                 3929         .word LINK 
                           0015A9  3930         LINK=.
      009629 C2                    3931         .byte 2+IMEDD+COMPO 
      00962A 49 3B                 3932         .ascii "I;" 
      00962C                       3933 ISEMI:
      00962C 1D 00 02         [ 2] 3934         subw x,#CELLL  
      00962F 90 AE 00 80      [ 2] 3935         ldw y,#IRET_CODE 
      009633 FF               [ 2] 3936         ldw (x),y 
      009634 CD 93 A0         [ 4] 3937         call CCOMMA
      009637 CD 92 B5         [ 4] 3938         call LBRAC 
      00963A CD 9F FF         [ 4] 3939         call IFMOVE
      00963D CD 86 2F         [ 4] 3940         call QDUP 
      009640 CD 83 9C         [ 4] 3941         CALL QBRAN 
      009643 96 69                 3942         .word 1$ 
      009645 CD 85 F4         [ 4] 3943         CALL CPP
      009648 CD 83 F1         [ 4] 3944         call AT 
      00964B CD 84 A8         [ 4] 3945         call SWAPP 
      00964E CD 85 F4         [ 4] 3946         CALL CPP 
      009651 CD 83 DA         [ 4] 3947         call STORE 
      009654 CD 9A 43         [ 4] 3948         call UPDATCP 
      009657 CD 9A 00         [ 4] 3949         call EEPVP 
      00965A CD 84 8E         [ 4] 3950         call DROP 
      00965D CD 83 F1         [ 4] 3951         call AT 
      009660 CD 85 E6         [ 4] 3952         call VPP 
      009663 CD 83 DA         [ 4] 3953         call STORE 
      009666 CC 89 CB         [ 2] 3954         jp ZERO
      009669 81               [ 4] 3955 1$:     ret           
                                   3956         
                                   3957 .endif ;PICATOUT_MOD
                                   3958 
                                   3959 ;       ]       ( -- )
                                   3960 ;       Start compiling words in
                                   3961 ;       input stream.
      00966A 96 29                 3962         .word      LINK
                           0015EC  3963 LINK = . 
      00966C 01                    3964         .byte      1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      00966D 5D                    3965         .ascii     "]"
      00966E                       3966 RBRAC:
      00966E CD 83 69         [ 4] 3967         CALL   DOLIT
      009671 95 C9                 3968         .word  SCOMP
      009673 CD 85 B6         [ 4] 3969         CALL   TEVAL
      009676 CC 83 DA         [ 2] 3970         JP     STORE
                                   3971 
                                   3972 ;       CALL,    ( ca -- )
                                   3973 ;       Compile a subroutine call.
      009679 96 6C                 3974         .word      LINK
                           0015FB  3975 LINK = . 
      00967B 04                    3976         .byte      4
      00967C 43 41 4C 4C 2C        3977         .ascii     "CALL,"
      009681                       3978 JSRC:
      009681 CD 83 69         [ 4] 3979         CALL     DOLIT
      009684 00 CD                 3980         .word     CALLL     ;CALL
      009686 CD 93 A0         [ 4] 3981         CALL     CCOMMA
      009689 CC 93 89         [ 2] 3982         JP     COMMA
                                   3983 
                           000001  3984 .if PICATOUT_MOD
                                   3985 ;       INIT-OFS ( -- )
                                   3986 ;       compute offset to adjust jump address 
                                   3987 ;       set variable OFFSET 
      00968C 96 7B                 3988         .word LINK 
                           00160E  3989         LINK=.
      00968E 08                    3990         .byte 8 
      00968F 49 4E 49 54 2D 4F 46  3991         .ascii "INIT-OFS" 
             53
      009697                       3992 INITOFS:
      009697 CD 85 A5         [ 4] 3993         call TFLASH 
      00969A CD 83 F1         [ 4] 3994         CALL AT 
      00969D CD 84 98         [ 4] 3995         CALL DUPP 
      0096A0 CD 83 9C         [ 4] 3996         call QBRAN
      0096A3 96 B4                 3997         .word 1$
      0096A5 CD 84 8E         [ 4] 3998         call DROP  
      0096A8 CD 85 F4         [ 4] 3999         call CPP 
      0096AB CD 83 F1         [ 4] 4000         call AT 
      0096AE CD 8A B8         [ 4] 4001         call HERE
      0096B1 CD 86 DE         [ 4] 4002         call SUBB 
      0096B4 CD 86 16         [ 4] 4003 1$:     call OFFSET 
      0096B7 CC 83 DA         [ 2] 4004         jp STORE  
                                   4005 .endif 
                                   4006 
                                   4007 ;       :       ( -- ; <string> )
                                   4008 ;       Start a new colon definition
                                   4009 ;       using next word as its name.
      0096BA 96 8E                 4010         .word      LINK
                           00163C  4011 LINK = . 
      0096BC 01                    4012         .byte      1
      0096BD 3A                    4013         .ascii     ":"
      0096BE                       4014 COLON:
                           000001  4015 .if PICATOUT_MOD
      0096BE CD 96 97         [ 4] 4016         call INITOFS       
                                   4017 .endif ; PICATOUT_MOD
      0096C1 CD 90 43         [ 4] 4018         CALL   TOKEN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      0096C4 CD 95 7C         [ 4] 4019         CALL   SNAME
      0096C7 CC 96 6E         [ 2] 4020         JP     RBRAC
                                   4021 
                           000001  4022 .if PICATOUT_MOD 
                                   4023 ;       I:  ( -- )
                                   4024 ;       Start interrupt service routine definition
                                   4025 ;       those definition have no name.
      0096CA 96 BC                 4026         .word LINK
                           00164C  4027         LINK=.
      0096CC 02                    4028         .byte 2 
      0096CD 49 3A                 4029         .ascii "I:" 
      0096CF                       4030 ICOLON:
      0096CF CD 96 97         [ 4] 4031         call INITOFS 
      0096D2 CC 96 6E         [ 2] 4032         jp RBRAC  
                                   4033 .endif ; PICATOUT_MOD
                                   4034 
                                   4035 ;       IMMEDIATE       ( -- )
                                   4036 ;       Make last compiled word
                                   4037 ;       an immediate word.
      0096D5 96 CC                 4038         .word      LINK
                           001657  4039 LINK = . 
      0096D7 09                    4040         .byte      9
      0096D8 49 4D 4D 45 44 49 41  4041         .ascii     "IMMEDIATE"
             54 45
      0096E1                       4042 IMMED:
      0096E1 CD 83 69         [ 4] 4043         CALL     DOLIT
      0096E4 80 00                 4044         .word     0x8000	;  IMEDD*256
      0096E6 CD 86 04         [ 4] 4045         CALL     LAST
      0096E9 CD 83 F1         [ 4] 4046         CALL     AT
      0096EC CD 83 F1         [ 4] 4047         CALL     AT
      0096EF CD 84 F8         [ 4] 4048         CALL     ORR
      0096F2 CD 86 04         [ 4] 4049         CALL     LAST
      0096F5 CD 83 F1         [ 4] 4050         CALL     AT
      0096F8 CC 83 DA         [ 2] 4051         JP     STORE
                                   4052 
                                   4053 ;; Defining words
                                   4054 
                                   4055 ;       CREATE  ( -- ; <string> )
                                   4056 ;       Compile a new array
                                   4057 ;       without allocating space.
      0096FB 96 D7                 4058         .word      LINK
                           00167D  4059 LINK = . 
      0096FD 06                    4060         .byte      6
      0096FE 43 52 45 41 54 45     4061         .ascii     "CREATE"
      009704                       4062 CREAT:
      009704 CD 90 43         [ 4] 4063         CALL     TOKEN
      009707 CD 95 7C         [ 4] 4064         CALL     SNAME
      00970A CD 95 FD         [ 4] 4065         CALL     OVERT        
      00970D CD 93 CE         [ 4] 4066         CALL     COMPI 
                           000001  4067 .if PICATOUT_MOD
      009710 85 45                 4068         .word DOVAR 
                           000000  4069 .else
                                   4070         CALL     DOVAR
                                   4071 .endif 
      009712 81               [ 4] 4072         RET
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



                                   4073 
                                   4074 ;       VARIABLE        ( -- ; <string> )
                                   4075 ;       Compile a new variable
                                   4076 ;       initialized to 0.
      009713 96 FD                 4077         .word      LINK
                           001695  4078 LINK = . 
      009715 08                    4079         .byte      8
      009716 56 41 52 49 41 42 4C  4080         .ascii     "VARIABLE"
             45
      00971E                       4081 VARIA:
                           000001  4082 .if PICATOUT_MOD
                                   4083 ; indirect variable so that VARIABLE definition can be compiled in FLASH 
      00971E CD 8A B8         [ 4] 4084         CALL HERE
      009721 CD 84 98         [ 4] 4085         CALL DUPP 
      009724 CD 89 34         [ 4] 4086         CALL CELLP
      009727 CD 85 E6         [ 4] 4087         CALL VPP 
      00972A CD 83 DA         [ 4] 4088         CALL STORE
      00972D CD 9A 5A         [ 4] 4089         call UPDATVP 
                                   4090 .endif         
      009730 CD 97 04         [ 4] 4091         CALL CREAT
      009733 CD 84 98         [ 4] 4092         CALL DUPP
      009736 CD 93 89         [ 4] 4093         CALL COMMA
      009739 CD 89 CB         [ 4] 4094         CALL ZERO
                           000001  4095 .if PICATOUT_MOD 
      00973C CD 84 A8         [ 4] 4096         call SWAPP 
      00973F CD 83 DA         [ 4] 4097         CALL STORE 
      009742 CD 9F 26         [ 4] 4098         CALL FMOVE ; move definition to FLASH
      009745 CD 86 2F         [ 4] 4099         CALL QDUP 
      009748 CD 83 9C         [ 4] 4100         CALL QBRAN 
      00974B 97 50                 4101         .word 1$
      00974D CD 9F BA         [ 4] 4102         CALL UPDATPTR
      009750 81               [ 4] 4103 1$:     RET 
                                   4104 .endif ;PICATOUT_MOD        
                                   4105 
                           000001  4106 .if PICATOUT_MOD
                                   4107 ;       CONSTANT  ( n -- ; <string> )
                                   4108 ;       Compile a new constant 
                                   4109 ;       n CONSTANT name 
      009751 97 15                 4110         .word LINK 
                           0016D3  4111         LINK=. 
      009753 08                    4112         .byte 8 
      009754 43 4F 4E 53 54 41 4E  4113         .ascii "CONSTANT" 
             54
      00975C                       4114 CONSTANT:          
      00975C CD 90 43         [ 4] 4115         CALL TOKEN
      00975F CD 95 7C         [ 4] 4116         CALL SNAME 
      009762 CD 95 FD         [ 4] 4117         CALL OVERT 
      009765 CD 93 CE         [ 4] 4118         CALL COMPI 
                           000001  4119 .if PICATOUT_MOD
      009768 97 86                 4120         .word DOCONST
                           000000  4121 .else
                                   4122         CALL DOCONST
                                   4123 .endif 
      00976A CD 93 89         [ 4] 4124         CALL COMMA 
      00976D CD 9F 26         [ 4] 4125         CALL FMOVE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



      009770 CD 86 2F         [ 4] 4126         CALL QDUP 
      009773 CD 83 9C         [ 4] 4127         CALL QBRAN 
      009776 97 7B                 4128         .word 1$ 
      009778 CD 9F BA         [ 4] 4129         CALL UPDATPTR  
      00977B 81               [ 4] 4130 1$:     RET          
                                   4131 
                                   4132 ; CONSTANT runtime semantic 
                                   4133 ; doCONST  ( -- n )
      00977C 97 53                 4134         .word LINK 
                           0016FE  4135         LINK=.
      00977E 07                    4136         .byte 7
      00977F 44 4F 43 4F 4E 53 54  4137         .ascii "DOCONST"
      009786                       4138 DOCONST:
      009786 1D 00 02         [ 2] 4139         subw x,#CELLL
      009789 90 85            [ 2] 4140         popw y 
      00978B 90 FE            [ 2] 4141         ldw y,(y) 
      00978D FF               [ 2] 4142         ldw (x),y 
      00978E 81               [ 4] 4143         ret 
                                   4144 .endif ;PICATOUT_MOD
                                   4145 
                                   4146 
                                   4147 ;; Tools
                                   4148 
                                   4149 ;       _TYPE   ( b u -- )
                                   4150 ;       Display a string. Filter
                                   4151 ;       non-printing characters.
      00978F 97 7E                 4152         .word      LINK
                           001711  4153 LINK = . 
      009791 05                    4154         .byte      5
      009792 5F 54 59 50 45        4155         .ascii     "_TYPE"
      009797                       4156 UTYPE:
      009797 CD 84 61         [ 4] 4157         CALL     TOR     ;start count down loop
      00979A 20 0F            [ 2] 4158         JRA     UTYP2   ;skip first pass
      00979C CD 84 98         [ 4] 4159 UTYP1:  CALL     DUPP
      00979F CD 84 0F         [ 4] 4160         CALL     CAT
      0097A2 CD 89 F5         [ 4] 4161         CALL     TCHAR
      0097A5 CD 83 53         [ 4] 4162         CALL     EMIT    ;display only printable
      0097A8 CD 89 5F         [ 4] 4163         CALL     ONEP    ;increment address
      0097AB CD 83 7D         [ 4] 4164 UTYP2:  CALL     DONXT
      0097AE 97 9C                 4165         .word      UTYP1   ;loop till done
      0097B0 CC 84 8E         [ 2] 4166         JP     DROP
                                   4167 
                                   4168 ;       dm+     ( a u -- a )
                                   4169 ;       Dump u bytes from ,
                                   4170 ;       leaving a+u on  stack.
      0097B3 97 91                 4171         .word      LINK
                           001735  4172 LINK = . 
      0097B5 03                    4173         .byte      3
      0097B6 64 6D 2B              4174         .ascii     "dm+"
      0097B9                       4175 DUMPP:
      0097B9 CD 84 C2         [ 4] 4176         CALL     OVER
      0097BC CD 83 69         [ 4] 4177         CALL     DOLIT
      0097BF 00 04                 4178         .word      4
      0097C1 CD 8E 99         [ 4] 4179         CALL     UDOTR   ;display address
      0097C4 CD 8D E9         [ 4] 4180         CALL     SPACE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



      0097C7 CD 84 61         [ 4] 4181         CALL     TOR     ;start count down loop
      0097CA 20 11            [ 2] 4182         JRA     PDUM2   ;skip first pass
      0097CC CD 84 98         [ 4] 4183 PDUM1:  CALL     DUPP
      0097CF CD 84 0F         [ 4] 4184         CALL     CAT
      0097D2 CD 83 69         [ 4] 4185         CALL     DOLIT
      0097D5 00 03                 4186         .word      3
      0097D7 CD 8E 99         [ 4] 4187         CALL     UDOTR   ;display numeric data
      0097DA CD 89 5F         [ 4] 4188         CALL     ONEP    ;increment address
      0097DD CD 83 7D         [ 4] 4189 PDUM2:  CALL     DONXT
      0097E0 97 CC                 4190         .word      PDUM1   ;loop till done
      0097E2 81               [ 4] 4191         RET
                                   4192 
                                   4193 ;       DUMP    ( a u -- )
                                   4194 ;       Dump u bytes from a,
                                   4195 ;       in a formatted manner.
      0097E3 97 B5                 4196         .word      LINK
                           001765  4197 LINK = . 
      0097E5 04                    4198         .byte      4
      0097E6 44 55 4D 50           4199         .ascii     "DUMP"
      0097EA                       4200 DUMP:
      0097EA CD 85 55         [ 4] 4201         CALL     BASE
      0097ED CD 83 F1         [ 4] 4202         CALL     AT
      0097F0 CD 84 61         [ 4] 4203         CALL     TOR
      0097F3 CD 8C 71         [ 4] 4204         CALL     HEX     ;save radix, set hex
      0097F6 CD 83 69         [ 4] 4205         CALL     DOLIT
      0097F9 00 10                 4206         .word      16
      0097FB CD 88 85         [ 4] 4207         CALL     SLASH   ;change count to lines
      0097FE CD 84 61         [ 4] 4208         CALL     TOR     ;start count down loop
      009801 CD 8E 31         [ 4] 4209 DUMP1:  CALL     CR
      009804 CD 83 69         [ 4] 4210         CALL     DOLIT
      009807 00 10                 4211         .word      16
      009809 CD 86 6B         [ 4] 4212         CALL     DDUP
      00980C CD 97 B9         [ 4] 4213         CALL     DUMPP   ;display numeric
      00980F CD 86 40         [ 4] 4214         CALL     ROT
      009812 CD 86 40         [ 4] 4215         CALL     ROT
      009815 CD 8D E9         [ 4] 4216         CALL     SPACE
      009818 CD 8D E9         [ 4] 4217         CALL     SPACE
      00981B CD 97 97         [ 4] 4218         CALL     UTYPE   ;display printable characters
      00981E CD 83 7D         [ 4] 4219         CALL     DONXT
      009821 98 01                 4220         .word      DUMP1   ;loop till done
      009823 CD 84 8E         [ 4] 4221 DUMP3:  CALL     DROP
      009826 CD 84 42         [ 4] 4222         CALL     RFROM
      009829 CD 85 55         [ 4] 4223         CALL     BASE
      00982C CC 83 DA         [ 2] 4224         JP     STORE   ;restore radix
                                   4225 
                                   4226 ;       .S      ( ... -- ... )
                                   4227 ;        Display  contents of stack.
      00982F 97 E5                 4228         .word      LINK
                           0017B1  4229 LINK = . 
      009831 02                    4230         .byte      2
      009832 2E 53                 4231         .ascii     ".S"
      009834                       4232 DOTS:
      009834 CD 8E 31         [ 4] 4233         CALL     CR
      009837 CD 8A 0E         [ 4] 4234         CALL     DEPTH   ;stack depth
      00983A CD 84 61         [ 4] 4235         CALL     TOR     ;start count down loop
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



      00983D 20 0C            [ 2] 4236         JRA     DOTS2   ;skip first pass
      00983F CD 84 55         [ 4] 4237 DOTS1:  CALL     RAT
      009842 CD 89 5F         [ 4] 4238         CALL ONEP
      009845 CD 8A 25         [ 4] 4239 	CALL     PICK
      009848 CD 8E CC         [ 4] 4240         CALL     DOT     ;index stack, display contents
      00984B CD 83 7D         [ 4] 4241 DOTS2:  CALL     DONXT
      00984E 98 3F                 4242         .word      DOTS1   ;loop till done
      009850 CD 8E 70         [ 4] 4243         CALL     DOTQP
      009853 05                    4244         .byte      5
      009854 20 3C 73 70 20        4245         .ascii     " <sp "
      009859 81               [ 4] 4246         RET
                                   4247 
                                   4248 ;       >NAME   ( ca -- na | F )
                                   4249 ;       Convert code address
                                   4250 ;       to a name address.
      00985A 98 31                 4251         .word      LINK
                           0017DC  4252 LINK = . 
      00985C 05                    4253         .byte      5
      00985D 3E 4E 41 4D 45        4254         .ascii     ">NAME"
      009862                       4255 TNAME:
      009862 CD 85 D8         [ 4] 4256         CALL     CNTXT   ;vocabulary link
      009865 CD 83 F1         [ 4] 4257 TNAM2:  CALL     AT
      009868 CD 84 98         [ 4] 4258         CALL     DUPP    ;?last word in a vocabulary
      00986B CD 83 9C         [ 4] 4259         CALL     QBRAN
      00986E 98 89                 4260         .word      TNAM4
      009870 CD 86 6B         [ 4] 4261         CALL     DDUP
      009873 CD 90 51         [ 4] 4262         CALL     NAMET
      009876 CD 85 0D         [ 4] 4263         CALL     XORR    ;compare
      009879 CD 83 9C         [ 4] 4264         CALL     QBRAN
      00987C 98 83                 4265         .word      TNAM3
      00987E CD 89 43         [ 4] 4266         CALL     CELLM   ;continue with next word
      009881 20 E2            [ 2] 4267         JRA     TNAM2
      009883 CD 84 A8         [ 4] 4268 TNAM3:  CALL     SWAPP
      009886 CC 84 8E         [ 2] 4269         JP     DROP
      009889 CD 86 60         [ 4] 4270 TNAM4:  CALL     DDROP
      00988C CC 89 CB         [ 2] 4271         JP     ZERO
                                   4272 
                                   4273 ;       .ID     ( na -- )
                                   4274 ;        Display  name at address.
      00988F 98 5C                 4275         .word      LINK
                           001811  4276 LINK = . 
      009891 03                    4277         .byte      3
      009892 2E 49 44              4278         .ascii     ".ID"
      009895                       4279 DOTID:
      009895 CD 86 2F         [ 4] 4280         CALL     QDUP    ;if zero no name
      009898 CD 83 9C         [ 4] 4281         CALL     QBRAN
      00989B 98 AB                 4282         .word      DOTI1
      00989D CD 8A A1         [ 4] 4283         CALL     COUNT
      0098A0 CD 83 69         [ 4] 4284         CALL     DOLIT
      0098A3 00 1F                 4285         .word      0x1F
      0098A5 CD 84 E4         [ 4] 4286         CALL     ANDD    ;mask lexicon bits
      0098A8 CC 97 97         [ 2] 4287         JP     UTYPE
      0098AB CD 8E 70         [ 4] 4288 DOTI1:  CALL     DOTQP
      0098AE 09                    4289         .byte      9
      0098AF 20 6E 6F 4E 61 6D 65  4290         .ascii     " noName"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal  81-Bits]



      0098B7 98               [ 4] 4291         RET
                                   4292 
                           000000  4293 WANT_SEE=0 
                           000000  4294 .if WANT_SEE 
                                   4295 ;       SEE     ( -- ; <string> )
                                   4296 ;       A simple decompiler.
                                   4297 ;       Updated for byte machines.
                                   4298         .word      LINK
                                   4299 LINK = . 
                                   4300         .byte      3
                                   4301         .ascii     "SEE"
                                   4302 SEE:
                                   4303         CALL     TICK    ;starting address
                                   4304         CALL     CR
                                   4305         CALL     ONEM
                                   4306 SEE1:   CALL     ONEP
                                   4307         CALL     DUPP
                                   4308         CALL     AT
                                   4309         CALL     DUPP    ;?does it contain a zero
                                   4310         CALL     QBRAN
                                   4311         .word    SEE2
                                   4312         CALL     TNAME   ;?is it a name
                                   4313 SEE2:   CALL     QDUP    ;name address or zero
                                   4314         CALL     QBRAN
                                   4315         .word    SEE3
                                   4316         CALL     SPACE
                                   4317         CALL     DOTID   ;display name
                                   4318         CALL     ONEP
                                   4319         JRA      SEE4
                                   4320 SEE3:   CALL     DUPP
                                   4321         CALL     CAT
                                   4322         CALL     UDOT    ;display number
                                   4323 SEE4:   CALL     NUFQ    ;user control
                                   4324         CALL     QBRAN
                                   4325         .word    SEE1
                                   4326         JP     DROP
                                   4327 .endif ; WANT_SEE 
                                   4328 
                                   4329 ;       WORDS   ( -- )
                                   4330 ;       Display names in vocabulary.
      0098B8 91 05                 4331         .word      LINK
                           001839  4332 LINK = . 
      0098BA 57                    4333         .byte      5
      0098BB 4F 52 44 53 53        4334         .ascii     "WORDS"
      0098BF                       4335 WORDS:
      0098BF CD 8E 31         [ 4] 4336         CALL     CR
      0098C2 CD 85 D8         [ 4] 4337         CALL     CNTXT   ;only in context
      0098C5 CD 83 F1         [ 4] 4338 WORS1:  CALL     AT
      0098C8 CD 86 2F         [ 4] 4339         CALL     QDUP    ;?at end of list
      0098CB CD 83 9C         [ 4] 4340         CALL     QBRAN
      0098CE 98 E4                 4341         .word      WORS2
      0098D0 CD 84 98         [ 4] 4342         CALL     DUPP
      0098D3 CD 8D E9         [ 4] 4343         CALL     SPACE
      0098D6 CD 98 95         [ 4] 4344         CALL     DOTID   ;display a name
      0098D9 CD 89 43         [ 4] 4345         CALL     CELLM
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



      0098DC CD 83 B3         [ 4] 4346         CALL     BRAN
      0098DF 98 C5                 4347         .word      WORS1
      0098E1 CD 84 8E         [ 4] 4348         CALL     DROP
      0098E4 81               [ 4] 4349 WORS2:  RET
                                   4350 
                                   4351         
                                   4352 ;; Hardware reset
                                   4353 
                                   4354 ;       hi      ( -- )
                                   4355 ;       Display sign-on message.
      0098E5 98 B9                 4356         .word      LINK
                           001867  4357 LINK = . 
      0098E7 02                    4358         .byte      2
      0098E8 68 69                 4359         .ascii     "hi"
      0098EA                       4360 HI:
      0098EA CD 8E 31         [ 4] 4361         CALL     CR
      0098ED CD 8E 70         [ 4] 4362         CALL     DOTQP   ;initialize I/O
      0098F0 0F                    4363         .byte      15
      0098F1 73 74 6D 38 65 46 6F  4364         .ascii     "stm8eForth v"
             72 74 68 20 76
      0098FD 33                    4365 	.byte      VER+'0'
      0098FE 2E                    4366         .byte      '.' 
      0098FF 30                    4367 	.byte      EXT+'0' ;version
      009900 CC 8E 31         [ 2] 4368         JP     CR
                                   4369 
                           000000  4370 WANT_DEBUG=0
                           000000  4371 .if WANT_DEBUG 
                                   4372 ;       DEBUG      ( -- )
                                   4373 ;       Display sign-on message.
                                   4374 ;        .word      LINK
                                   4375 LINK = . 
                                   4376         .byte      5
                                   4377         .ascii     "DEBUG"
                                   4378 DEBUG:
                                   4379 	CALL DOLIT
                                   4380 	.word 0x65
                                   4381 	CALL EMIT
                                   4382 	CALL DOLIT
                                   4383 	.word 0
                                   4384  	CALL ZLESS 
                                   4385 	CALL DOLIT
                                   4386 	.word 0xFFFE
                                   4387 	CALL ZLESS 
                                   4388 	CALL UPLUS 
                                   4389  	CALL DROP 
                                   4390 	CALL DOLIT
                                   4391 	.word 3
                                   4392 	CALL UPLUS 
                                   4393 	CALL UPLUS 
                                   4394  	CALL DROP
                                   4395 	CALL DOLIT
                                   4396 	.word 0x43
                                   4397 	CALL UPLUS 
                                   4398  	CALL DROP
                                   4399 	CALL EMIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



                                   4400 	CALL DOLIT
                                   4401 	.word 0x4F
                                   4402 	CALL DOLIT
                                   4403 	.word 0x6F
                                   4404  	CALL XORR
                                   4405 	CALL DOLIT
                                   4406 	.word 0xF0
                                   4407  	CALL ANDD
                                   4408 	CALL DOLIT
                                   4409 	.word 0x4F
                                   4410  	CALL ORR
                                   4411 	CALL EMIT
                                   4412 	CALL DOLIT
                                   4413 	.word 8
                                   4414 	CALL DOLIT
                                   4415 	.word 6
                                   4416  	CALL SWAPP
                                   4417 	CALL OVER
                                   4418 	CALL XORR
                                   4419 	CALL DOLIT
                                   4420 	.word 3
                                   4421 	CALL ANDD 
                                   4422 	CALL ANDD
                                   4423 	CALL DOLIT
                                   4424 	.word 0x70
                                   4425 	CALL UPLUS 
                                   4426 	CALL DROP
                                   4427 	CALL EMIT
                                   4428 	CALL DOLIT
                                   4429 	.word 0
                                   4430 	CALL QBRAN
                                   4431 	.word DEBUG1
                                   4432 	CALL DOLIT
                                   4433 	.word 0x3F
                                   4434 DEBUG1:
                                   4435 	CALL DOLIT
                                   4436 	.word 0xFFFF
                                   4437 	CALL QBRAN
                                   4438 	.word DEBUG2
                                   4439 	CALL DOLIT
                                   4440 	.word 0x74
                                   4441 	CALL BRAN
                                   4442 	.word DEBUG3
                                   4443 DEBUG2:
                                   4444 	CALL DOLIT
                                   4445 	.word 0x21
                                   4446 DEBUG3:
                                   4447 	CALL EMIT
                                   4448 	CALL DOLIT
                                   4449 	.word 0x68
                                   4450 	CALL DOLIT
                                   4451 	.word 0x80
                                   4452 	CALL STORE
                                   4453 	CALL DOLIT
                                   4454 	.word 0x80
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



                                   4455 	CALL AT
                                   4456 	CALL EMIT
                                   4457 	CALL DOLIT
                                   4458 	.word 0x4D
                                   4459 	CALL TOR
                                   4460 	CALL RAT
                                   4461 	CALL RFROM
                                   4462 	CALL ANDD
                                   4463 	CALL EMIT
                                   4464 	CALL DOLIT
                                   4465 	.word 0x61
                                   4466 	CALL DOLIT
                                   4467 	.word 0xA
                                   4468 	CALL TOR
                                   4469 DEBUG4:
                                   4470 	CALL DOLIT
                                   4471 	.word 1
                                   4472 	CALL UPLUS 
                                   4473 	CALL DROP
                                   4474 	CALL DONXT
                                   4475 	.word DEBUG4
                                   4476 	CALL EMIT
                                   4477 	CALL DOLIT
                                   4478 	.word 0x656D
                                   4479 	CALL DOLIT
                                   4480 	.word 0x100
                                   4481 	CALL UMSTA
                                   4482 	CALL SWAPP
                                   4483 	CALL DOLIT
                                   4484 	.word 0x100
                                   4485 	CALL UMSTA
                                   4486 	CALL SWAPP 
                                   4487 	CALL DROP
                                   4488 	CALL EMIT
                                   4489 	CALL EMIT
                                   4490 	CALL DOLIT
                                   4491 	.word 0x2043
                                   4492 	CALL DOLIT
                                   4493 	.word 0
                                   4494 	CALL DOLIT
                                   4495 	.word 0x100
                                   4496 	CALL UMMOD
                                   4497 	CALL EMIT
                                   4498 	CALL EMIT
                                   4499 	;JP ORIG
                                   4500 	RET
                                   4501 .endif ; WANT_DEBUG 
                                   4502 
                                   4503 
                                   4504 ;       'BOOT   ( -- a )
                                   4505 ;       The application startup vector.
      009903 98 E7                 4506         .word      LINK
                           001885  4507 LINK = . 
      009905 05                    4508         .byte      5
      009906 27 42 4F 4F 54        4509         .ascii     "'BOOT"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



      00990B                       4510 TBOOT:
      00990B CD 85 45         [ 4] 4511         CALL     DOVAR
      00990E 40 02                 4512         .word    APP_RUN      ;application to boot
                                   4513 
                                   4514 ;       COLD    ( -- )
                                   4515 ;       The hilevel cold start s=ence.
      009910 99 05                 4516         .word      LINK
                           001892  4517         LINK = . 
      009912 04                    4518         .byte      4
      009913 43 4F 4C 44           4519         .ascii     "COLD"
      009917                       4520 COLD:
                           000000  4521 .if WANT_DEBUG
                                   4522         CALL DEBUG
                                   4523 .endif 
      009917 CD 83 69         [ 4] 4524 COLD1:  CALL     DOLIT
      00991A 80 A7                 4525         .word      UZERO
      00991C CD 83 69         [ 4] 4526 	CALL     DOLIT
      00991F 00 06                 4527         .word      UPP
      009921 CD 83 69         [ 4] 4528         CALL     DOLIT
      009924 00 1A                 4529 	.word      UEND-UZERO
      009926 CD 8B 05         [ 4] 4530         CALL     CMOVE   ;initialize user area
                                   4531 
                           000001  4532 .if PICATOUT_MOD
                                   4533 ; if APP_RUN==0 initialize with ca de 'hi'  
      009929 90 CE 40 02      [ 2] 4534         ldw y,APP_RUN 
      00992D 26 0B            [ 1] 4535         jrne 0$
      00992F 1D 00 02         [ 2] 4536         subw x,#CELLL 
      009932 90 AE 98 EA      [ 2] 4537         ldw y,#HI  
      009936 FF               [ 2] 4538         ldw (x),y
      009937 CD 9A 32         [ 4] 4539         call UPDATRUN 
      00993A                       4540 0$:        
                                   4541 ; update LAST with APP_LAST 
                                   4542 ; if APP_LAST > LAST else do the opposite
      00993A 90 CE 40 00      [ 2] 4543         ldw y,APP_LAST 
      00993E 90 B3 1A         [ 2] 4544         cpw y,ULAST 
      009941 22 05            [ 1] 4545         jrugt 1$ 
                                   4546 ; save LAST at APP_LAST  
      009943 CD 9A 1A         [ 4] 4547         call UPDATLAST 
      009946 20 06            [ 2] 4548         jra 2$
      009948                       4549 1$: ; update LAST with APP_LAST 
      009948 90 BF 1A         [ 2] 4550         ldw ULAST,y
      00994B 90 BF 14         [ 2] 4551         ldw UCNTXT,y 
      00994E                       4552 2$:  
                                   4553 ; update APP_CP if < app_space 
      00994E 90 CE 40 04      [ 2] 4554         ldw y,APP_CP  
      009952 90 B3 18         [ 2] 4555         cpw y,UCP   
      009955 24 06            [ 1] 4556         jruge 3$ 
      009957 CD 9A 43         [ 4] 4557         call UPDATCP
      00995A 90 BE 18         [ 2] 4558         ldw y,UCP   
      00995D                       4559 3$:
      00995D 90 BF 18         [ 2] 4560         ldw UCP,y                 
                                   4561 ; update UVP with APP_VP  
                                   4562 ; if APP_VP>UVP else do the opposite 
      009960 90 CE 40 06      [ 2] 4563         ldw y,APP_VP 
      009964 90 B3 16         [ 2] 4564         cpw y,UVP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



      009967 22 05            [ 1] 4565         jrugt 4$
      009969 CD 9A 5A         [ 4] 4566         call UPDATVP 
      00996C 20 03            [ 2] 4567         jra 6$
      00996E                       4568 4$: ; update UVP with APP_VP 
      00996E 90 BF 16         [ 2] 4569         ldw UVP,y 
      009971                       4570 6$:      
                                   4571 .endif ; PICATOUT_MOD
      009971 CD 93 34         [ 4] 4572         CALL     PRESE   ;initialize data stack and TIB
      009974 CD 99 0B         [ 4] 4573         CALL     TBOOT
      009977 CD 8A EE         [ 4] 4574         CALL     ATEXE   ;application boot
      00997A CD 95 FD         [ 4] 4575         CALL     OVERT
      00997D CC 93 51         [ 2] 4576         JP     QUIT    ;start interpretation
                                   4577 
                           000001  4578 .if PICATOUT_MOD
                                   4579         ; keep this include at end 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



                                   4580         .include "flash.asm"
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
      009980 99 12                   30     .word LINK 
                           001902    31     LINK=.
      009982 03                      32     .byte 3 
      009983 46 50 21                33     .ascii "FP!"
      009986                         34 fptr_store:
      009986 90 93            [ 1]   35     ldw y,x
      009988 90 FE            [ 2]   36     ldw y,(y)
      00998A 90 9F            [ 1]   37     ld a,yl 
      00998C B7 30            [ 1]   38     ld FPTR,a 
      00998E 1C 00 02         [ 2]   39     addw x,#CELLL 
      009991 90 93            [ 1]   40     ldw y,x 
      009993 90 FE            [ 2]   41     ldw y,(y)
      009995 90 BF 31         [ 2]   42     ldw PTR16,y
      009998 1C 00 02         [ 2]   43     addw x,#CELLL 
      00999B 81               [ 4]   44     ret 
                                     45 
                                     46 ;-----------------------------------
                                     47 ; return EEPROM base address 
                                     48 ; as a double 
                                     49 ;  EEPROM  ( -- ud )
                                     50 ;-----------------------------------
      00999C 99 82                   51     .word LINK 
                           00191E    52 LINK=.
      00999E 06                      53     .byte 6 
      00999F 45 45 50 52 4F 4D       54     .ascii "EEPROM"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



      0099A5                         55 EEPROM: 
      0099A5 90 AE 40 00      [ 2]   56     ldw y,#EEPROM_BASE
      0099A9 1D 00 04         [ 2]   57     subw x,#2*CELLL 
      0099AC EF 02            [ 2]   58     ldw (2,x),y 
      0099AE 90 5F            [ 1]   59     clrw y 
      0099B0 FF               [ 2]   60     ldw (x),y 
      0099B1 81               [ 4]   61     ret
                                     62 
                                     63 ;---------------------------------
                                     64 ; return APP_LAST pointer as double
                                     65 ; EEP-LAST ( -- ud )
                                     66 ;---------------------------------
      0099B2 99 9E                   67 	.word LINK 
                           001934    68 	LINK=.
      0099B4 08                      69 	.byte 8 
      0099B5 45 45 50 2D 4C 41 53    70 	.ascii "EEP-LAST"
             54
      0099BD                         71 EEPLAST:
      0099BD 1D 00 04         [ 2]   72 	subw x,#2*CELLL 
      0099C0 90 AE 40 00      [ 2]   73 	ldw y,#APP_LAST 
      0099C4 EF 02            [ 2]   74 	ldw (2,x),y 
      0099C6 90 5F            [ 1]   75 	clrw y 
      0099C8 FF               [ 2]   76 	ldw (x),y 
      0099C9 81               [ 4]   77 	ret 
                                     78 
                                     79 ;----------------------------------
                                     80 ; return APP_RUN pointer as double	
                                     81 ; EEP-RUN ( -- ud )
                                     82 ;-----------------------------------
      0099CA 99 B4                   83 	.word LINK 
                           00194C    84 	LINK=.
      0099CC 07                      85 	.byte 7
      0099CD 45 45 50 2D 52 55 4E    86 	.ascii "EEP-RUN"
      0099D4                         87 EEPRUN:
      0099D4 1D 00 04         [ 2]   88 	subw x,#2*CELLL 
      0099D7 90 AE 40 02      [ 2]   89 	ldw y,#APP_RUN 
      0099DB EF 02            [ 2]   90 	ldw (2,x),y 
      0099DD 90 5F            [ 1]   91 	clrw y 
      0099DF FF               [ 2]   92 	ldw (x),y 
      0099E0 81               [ 4]   93 	ret 
                                     94 
                                     95 ;------------------------------------
                                     96 ; return APP_CP pointer as double 
                                     97 ; EEP-CP ( -- ud )
                                     98 ;------------------------------------
      0099E1 99 CC                   99 	.word LINK
                           001963   100 	LINK=.
      0099E3 06                     101 	.byte 6 
      0099E4 45 45 50 2D 43 50      102 	.ascii "EEP-CP"
      0099EA                        103 EEPCP:
      0099EA 1D 00 04         [ 2]  104 	subw x,#2*CELLL 
      0099ED 90 AE 40 04      [ 2]  105 	ldw y,#APP_CP  
      0099F1 EF 02            [ 2]  106 	ldw (2,x),y 
      0099F3 90 5F            [ 1]  107 	clrw y 
      0099F5 FF               [ 2]  108 	ldw (x),y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



      0099F6 81               [ 4]  109 	ret 
                                    110 
                                    111 ;------------------------------------
                                    112 ; return APP_VP pointer as double 
                                    113 ; EEP-VP ( -- ud )
                                    114 ;-------------------------------------
      0099F7 99 E3                  115 	.word LINK
                           001979   116 	LINK=.
      0099F9 06                     117 	.byte 6
      0099FA 45 45 50 2D 56 50      118 	.ascii "EEP-VP"
      009A00                        119 EEPVP:
      009A00 1D 00 04         [ 2]  120 	subw x,#2*CELLL 
      009A03 90 AE 40 06      [ 2]  121 	ldw y,#APP_VP  
      009A07 EF 02            [ 2]  122 	ldw (2,x),y 
      009A09 90 5F            [ 1]  123 	clrw y 
      009A0B FF               [ 2]  124 	ldw (x),y 
      009A0C 81               [ 4]  125 	ret 
                                    126 
                                    127 ;----------------------------------
                                    128 ; update APP_LAST with LAST 
                                    129 ; UPDAT-LAST ( -- )
                                    130 ;----------------------------------
      009A0D 99 F9                  131 	.word LINK 
                           00198F   132 	LINK=.
      009A0F 0A                     133 	.byte 10
      009A10 55 50 44 41 54 2D 4C   134 	.ascii "UPDAT-LAST"
             41 53 54
      009A1A                        135 UPDATLAST:
      009A1A CD 86 04         [ 4]  136 	call LAST
      009A1D CD 83 F1         [ 4]  137 	call AT  
      009A20 CD 99 BD         [ 4]  138 	call EEPLAST
      009A23 CC 9B 96         [ 2]  139 	jp ee_store 
                                    140 
                                    141 ;---------------------------------
                                    142 ; update APP_RUN 
                                    143 ; UPDAT-RUN ( a -- )
                                    144 ;---------------------------------
      009A26 9A 0F                  145 	.word LINK
                           0019A8   146 	LINK=.
      009A28 09                     147 	.byte 9
      009A29 55 50 44 41 54 2D 52   148 	.ascii "UPDAT-RUN"
             55 4E
      009A32                        149 UPDATRUN:
      009A32 CD 99 D4         [ 4]  150 	call EEPRUN
      009A35 CC 9B 96         [ 2]  151 	jp ee_store 
                                    152 	
                                    153 ;---------------------------------
                                    154 ; update APP_CP with CP 
                                    155 ; UPDAT-CP ( -- )
                                    156 ;---------------------------------
      009A38 9A 28                  157 	.word LINK 
                           0019BA   158 	LINK=.
      009A3A 08                     159 	.byte 8 
      009A3B 55 50 44 41 54 2D 43   160 	.ascii "UPDAT-CP"
             50
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



      009A43                        161 UPDATCP:
      009A43 CD 85 F4         [ 4]  162 	call CPP 
      009A46 CD 83 F1         [ 4]  163 	call AT 
      009A49 CD 99 EA         [ 4]  164 	call EEPCP 
      009A4C CC 9B 96         [ 2]  165 	jp ee_store 
                                    166 
                                    167 ;----------------------------------
                                    168 ; update APP_VP with VP 
                                    169 ; UPDAT-VP ( -- )
                                    170 ;----------------------------------
      009A4F 9A 3A                  171 	.word LINK
                           0019D1   172 	LINK=.
      009A51 08                     173 	.byte 8 
      009A52 55 50 44 41 54 2D 56   174 	.ascii "UPDAT-VP" 
             50
      009A5A                        175 UPDATVP:
      009A5A CD 85 E6         [ 4]  176 	call VPP 
      009A5D CD 83 F1         [ 4]  177 	call AT
      009A60 CD 9A 00         [ 4]  178 	call EEPVP 
      009A63 CC 9B 96         [ 2]  179 	jp ee_store
                                    180 	
                                    181 
                                    182 ;----------------------------------
                                    183 ; fetch integer at address over 65535
                                    184 ;  F@   ( ud -- n )
                                    185 ;----------------------------------
      009A66 9A 51                  186     .word LINK 
                           0019E8   187 LINK=.
      009A68 02                     188     .byte 2
      009A69 46 40                  189     .ascii "F@"
      009A6B                        190 farat:
      009A6B CD 99 86         [ 4]  191     call fptr_store
      009A6E 92 BC 00 30      [ 5]  192     ldf a,[FPTR]
      009A72 1D 00 02         [ 2]  193     subw x,#CELLL 
      009A75 F7               [ 1]  194     ld (x),a 
      009A76 90 AE 00 01      [ 2]  195     ldw y,#1
      009A7A 91 AF 00 30      [ 1]  196     ldf a,([FPTR],y)
      009A7E E7 01            [ 1]  197     ld (1,x),a
      009A80 81               [ 4]  198     ret 
                                    199 
                                    200 ;-------------------------------------
                                    201 ; fetch C at address over 65535 
                                    202 ; FC@ ( ud -- c)
                                    203 ;-------------------------------------
      009A81 9A 68                  204     .word LINK
                           001A03   205     LINK=.
      009A83 03                     206     .byte 3 
      009A84 46 43 40               207     .ascii "FC@" 
      009A87                        208 farcat:
      009A87 CD 99 86         [ 4]  209     call fptr_store 
      009A8A 92 BC 00 30      [ 5]  210     ldf a,[FPTR]
      009A8E 1D 00 02         [ 2]  211     subw x,#CELLL 
      009A91 E7 01            [ 1]  212     ld (1,x),a 
      009A93 7F               [ 1]  213     clr (x)
      009A94 81               [ 4]  214     ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



                                    215     
                                    216 ;----------------------------------
                                    217 ; unlock EEPROM/OPT for writing/erasing
                                    218 ; wait endlessly for FLASH_IAPSR_DUL bit.
                                    219 ;  UNLKEE   ( -- )
                                    220 ;----------------------------------
      009A95 9A 83                  221     .word LINK 
                           001A17   222 LINK=.
      009A97 06                     223     .byte 6 
      009A98 55 4E 4C 4B 45 45      224     .ascii "UNLKEE"
      009A9E                        225 unlock_eeprom:
      009A9E 35 00 50 5B      [ 1]  226 	mov FLASH_CR2,#0 
      009AA2 35 FF 50 5C      [ 1]  227 	mov FLASH_NCR2,#0xFF 
      009AA6 35 AE 50 64      [ 1]  228 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      009AAA 35 56 50 64      [ 1]  229     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      009AAE 72 07 50 5F FB   [ 2]  230 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      009AB3 81               [ 4]  231 	ret
                                    232 
                                    233 ;----------------------------------
                                    234 ; unlock FLASH for writing/erasing
                                    235 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                    236 ; UNLKFL  ( -- )
                                    237 ;----------------------------------
      009AB4 9A 97                  238     .word LINK 
                           001A36   239 LINK=. 
      009AB6 06                     240     .byte 6 
      009AB7 55 4E 4C 4B 46 4C      241     .ascii "UNLKFL"    
      009ABD                        242 unlock_flash:
      009ABD 35 00 50 5B      [ 1]  243 	mov FLASH_CR2,#0 
      009AC1 35 FF 50 5C      [ 1]  244 	mov FLASH_NCR2,#0xFF 
      009AC5 35 56 50 62      [ 1]  245 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      009AC9 35 AE 50 62      [ 1]  246 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      009ACD 72 03 50 5F FB   [ 2]  247 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      009AD2 81               [ 4]  248 	ret
                                    249 
                                    250 ;-----------------------------
                                    251 ; unlock FLASH or EEPROM 
                                    252 ; according to FPTR address 
                                    253 ;  UNLOCK ( -- )
                                    254 ;-----------------------------
      009AD3 9A B6                  255 	.word LINK 
                           001A55   256 	LINK=.
      009AD5 06                     257 	.byte 6
      009AD6 55 4E 4C 4F 43 4B      258 	.ascii "UNLOCK"
      009ADC                        259 unlock:
                                    260 ; put addr[15:0] in Y, for bounds check.
      009ADC 90 BE 31         [ 2]  261 	ldw y,PTR16   ; Y=addr15:0
                                    262 ; check addr[23:16], if <> 0 then it is extened flash memory
      009ADF 3D 30            [ 1]  263 	tnz FPTR 
      009AE1 26 16            [ 1]  264 	jrne 4$
      009AE3 90 A3 80 00      [ 2]  265     cpw y,#FLASH_BASE
      009AE7 24 10            [ 1]  266     jruge 4$
      009AE9 90 A3 40 00      [ 2]  267 	cpw y,#EEPROM_BASE  
      009AED 25 0D            [ 1]  268     jrult 9$
      009AEF 90 A3 48 7F      [ 2]  269 	cpw y,#OPTION_END 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



      009AF3 22 07            [ 1]  270 	jrugt 9$
      009AF5 CD 9A 9E         [ 4]  271 	call unlock_eeprom
      009AF8 81               [ 4]  272 	ret 
      009AF9 CD 9A BD         [ 4]  273 4$: call unlock_flash
      009AFC 81               [ 4]  274 9$: ret 
                                    275 
                                    276 ;-------------------------
                                    277 ; lock write access to 
                                    278 ; FLASH and EEPROM 
                                    279 ; LOCK ( -- )
                                    280 ;-------------------------
      009AFD 9A D5                  281 	.word LINK 
                           001A7F   282 	LINK=.
      009AFF 04                     283 	.byte 4 
      009B00 4C 4F 43 4B            284 	.ascii "LOCK" 
      009B04                        285 lock: 
      009B04 72 13 50 5F      [ 1]  286 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      009B08 72 17 50 5F      [ 1]  287 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009B0C 81               [ 4]  288 	ret 
                                    289 
                                    290 ;-------------------------
                                    291 ; increment FPTR 
                                    292 ; INC-FPTR ( -- )
                                    293 ;-------------------------
      009B0D 9A FF                  294 	.word LINK 
                           001A8F   295 	LINK=. 
      009B0F 08                     296 	.byte 8 
      009B10 49 4E 43 2D 46 50 54   297 	.ascii "INC-FPTR" 
             52
      009B18                        298 inc_fptr:
      009B18 3C 32            [ 1]  299 	inc PTR8 
      009B1A 26 08            [ 1]  300 	jrne 1$
      009B1C 90 BE 30         [ 2]  301 	ldw y,FPTR 
      009B1F 90 5C            [ 2]  302 	incw y 
      009B21 90 BF 30         [ 2]  303 	ldw FPTR,y 
      009B24 81               [ 4]  304 1$: ret 
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
      009B25 9B 0F                  315 	.word LINK 
                           001AA7   316 	LINK=. 
      009B27 07                     317 	.byte 7 
      009B28 57 52 2D 42 59 54 45   318 	.ascii "WR-BYTE" 
                                    319 
      009B2F                        320 write_byte:
      009B2F 90 93            [ 1]  321 	ldw y,x 
      009B31 90 FE            [ 2]  322 	ldw y,(y)
      009B33 1C 00 02         [ 2]  323 	addw x,#CELLL 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



      009B36 90 9F            [ 1]  324 	ld a,yl
      009B38 92 BD 00 30      [ 4]  325 	ldf [FPTR],a
      009B3C 72 05 50 5F FB   [ 2]  326 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009B41 20 D5            [ 2]  327 	jra inc_fptr 
                                    328 
                                    329 
                                    330 
                                    331 ;---------------------------------------
                                    332 ; write a byte to FLASH or EEPROM/OPTION  
                                    333 ; EEC!  (c ud -- )
                                    334 ;---------------------------------------
      009B43 9B 27                  335     .word LINK 
                           001AC5   336 	LINK=.
      009B45 04                     337     .byte 4 
      009B46 45 45 43 21            338     .ascii "EEC!"
                                    339 	; local variables 
                           000001   340 	BTW = 1   ; byte to write offset on stack
                           000002   341     OPT = 2 
                           000002   342 	VSIZE = 2
      009B4A                        343 ee_cstore:
      009B4A 52 02            [ 2]  344 	sub sp,#VSIZE
      009B4C CD 99 86         [ 4]  345     call fptr_store
      009B4F E6 01            [ 1]  346 	ld a,(1,x)
      009B51 43               [ 1]  347 	cpl a 
      009B52 6B 01            [ 1]  348 	ld (BTW,sp),a ; byte to write 
      009B54 0F 02            [ 1]  349 	clr (OPT,sp)  ; OPTION flag
      009B56 CD 9A DC         [ 4]  350 	call unlock 
                                    351 	; check if option
      009B59 3D 30            [ 1]  352 	tnz FPTR 
      009B5B 26 19            [ 1]  353 	jrne 2$
      009B5D 90 BE 31         [ 2]  354 	ldw y,PTR16 
      009B60 90 A3 48 00      [ 2]  355 	cpw y,#OPTION_BASE
      009B64 2B 10            [ 1]  356 	jrmi 2$
      009B66 90 A3 48 80      [ 2]  357 	cpw y,#OPTION_END+1
      009B6A 2A 0A            [ 1]  358 	jrpl 2$
      009B6C 03 02            [ 1]  359 	cpl (OPT,sp)
                                    360 	; OPTION WRITE require this unlock 
      009B6E 72 1E 50 5B      [ 1]  361     bset FLASH_CR2,#FLASH_CR2_OPT
      009B72 72 1F 50 5C      [ 1]  362     bres FLASH_NCR2,#FLASH_CR2_OPT 
      009B76                        363 2$: 
      009B76 CD 9B 2F         [ 4]  364 	call write_byte 	
      009B79 0D 02            [ 1]  365 	tnz (OPT,sp)
      009B7B 27 0D            [ 1]  366 	jreq 3$ 
      009B7D 7B 01            [ 1]  367     ld a,(BTW,sp)
      009B7F 90 5F            [ 1]  368     clrw y
      009B81 90 97            [ 1]  369 	ld yl,a 
      009B83 1D 00 02         [ 2]  370 	subw x,#CELLL 
      009B86 FF               [ 2]  371 	ldw (x),y 
      009B87 CD 9B 2F         [ 4]  372 	call write_byte
      009B8A                        373 3$: 
      009B8A CD 9B 04         [ 4]  374 	call lock 
      009B8D 5B 02            [ 2]  375 	addw sp,#VSIZE 
      009B8F 81               [ 4]  376     ret
                                    377 
                                    378 ;------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



                                    379 ; write integer in FLASH|EEPROM
                                    380 ; EE! ( n ud -- )
                                    381 ;------------------------------
      009B90 9B 45                  382 	.word LINK 
                           001B12   383 	LINK=.
      009B92 03                     384 	.byte 3 
      009B93 45 45 21               385 	.ascii "EE!"
      009B96                        386 ee_store:
      009B96 CD 99 86         [ 4]  387 	call fptr_store 
      009B99 CD 9A DC         [ 4]  388 	call unlock 
      009B9C 90 93            [ 1]  389 	ldw y,x 
      009B9E 90 FE            [ 2]  390 	ldw y,(y)
      009BA0 90 89            [ 2]  391 	pushw y 
      009BA2 90 5E            [ 1]  392 	swapw y 
      009BA4 FF               [ 2]  393 	ldw (x),y 
      009BA5 CD 9B 2F         [ 4]  394 	call write_byte 
      009BA8 90 85            [ 2]  395 	popw y 
      009BAA 1D 00 02         [ 2]  396 	subw x,#CELLL
      009BAD FF               [ 2]  397 	ldw (x),y 
      009BAE CD 9B 2F         [ 4]  398 	call write_byte
      009BB1 CC 9B 04         [ 2]  399 	jp lock 
                                    400 
                                    401 
                                    402 ;----------------------------
                                    403 ; Erase flash memory row 
                                    404 ; stm8s208 as 128 bytes rows
                                    405 ; ROW-ERASE ( ud -- )
                                    406 ;----------------------------
      009BB4 9B 92                  407 	.word LINK 
                           001B36   408 	LINK=. 
      009BB6 09                     409 	.byte 9 
      009BB7 52 4F 57 2D 45 52 41   410 	.ascii "ROW-ERASE" 
             53 45
      009BC0                        411 row_erase:
      009BC0 CD 99 86         [ 4]  412 	call fptr_store
                                    413 ;code must be execute from RAM 
                                    414 ;copy routine to PAD 
      009BC3 1D 00 02         [ 2]  415 	subw x,#CELLL 
      009BC6 90 AE 9C 0D      [ 2]  416 	ldw y,#row_erase_proc
      009BCA FF               [ 2]  417 	ldw (x),y 
      009BCB CD 8A C9         [ 4]  418 	call PAD 
      009BCE 90 AE 9C 34      [ 2]  419 	ldw y,#row_erase_proc_end 
      009BD2 72 A2 9C 0D      [ 2]  420 	subw y,#row_erase_proc
      009BD6 1D 00 02         [ 2]  421 	subw x,#CELLL 
      009BD9 FF               [ 2]  422 	ldw (x),y 
      009BDA CD 8B 05         [ 4]  423 	call CMOVE 
      009BDD                        424 block_erase:
      009BDD 90 BE 31         [ 2]  425 	ldw y,FPTR+1
      009BE0 90 A3 A0 80      [ 2]  426 	cpw y,#app_space 
      009BE4 2A 13            [ 1]  427 	jrpl erase_flash 
                                    428 ; erase EEPROM block
      009BE6 90 A3 40 00      [ 2]  429 	cpw y,#EEPROM_BASE 
      009BEA 24 01            [ 1]  430 	jruge 1$
      009BEC 81               [ 4]  431 	ret ; bad address 
      009BED 90 A3 47 FF      [ 2]  432 1$: cpw y,#EEPROM_END 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



      009BF1 23 01            [ 2]  433 	jrule 2$ 
      009BF3 81               [ 4]  434 	ret ; bad address 
      009BF4                        435 2$:	
      009BF4 CD 9A 9E         [ 4]  436 	call unlock_eeprom 
      009BF7 20 03            [ 2]  437 	jra proceed_erase
                                    438 ; erase flash block:
      009BF9                        439 erase_flash:
      009BF9 CD 9A BD         [ 4]  440 	call unlock_flash 
      009BFC                        441 proceed_erase:
      009BFC CD 8A C9         [ 4]  442 	call PAD 
      009BFF 90 93            [ 1]  443 	ldw y,x
      009C01 90 FE            [ 2]  444 	ldw y,(y)
      009C03 1C 00 02         [ 2]  445 	addw x,#CELLL  
      009C06 90 FD            [ 4]  446 	call (y) 
      009C08 72 17 50 5F      [ 1]  447 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009C0C 81               [ 4]  448 	ret 
                                    449 
                                    450 ; this routine is to be copied to PAD 
      009C0D                        451 row_erase_proc:
      009C0D 35 20 50 5B      [ 1]  452 	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
      009C11 35 DF 50 5C      [ 1]  453 	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
      009C15 4F               [ 1]  454 	clr a 
      009C16 90 5F            [ 1]  455 	clrw y 
      009C18 91 A7 00 30      [ 1]  456 	ldf ([FPTR],y),a
      009C1C 90 5C            [ 2]  457     incw y
      009C1E 91 A7 00 30      [ 1]  458 	ldf ([FPTR],y),a
      009C22 90 5C            [ 2]  459     incw y
      009C24 91 A7 00 30      [ 1]  460 	ldf ([FPTR],y),a
      009C28 90 5C            [ 2]  461     incw y
      009C2A 91 A7 00 30      [ 1]  462 	ldf ([FPTR],y),a
      009C2E 72 05 50 5F FB   [ 2]  463 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009C33 81               [ 4]  464 	ret
      009C34                        465 row_erase_proc_end:
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
      009C34                        478 copy_buffer:
      009C34 4B 80            [ 1]  479 	push #BLOCK_SIZE  
                                    480 ;enable block programming 
      009C36 72 10 50 5B      [ 1]  481 	bset FLASH_CR2,#FLASH_CR2_PRG 
      009C3A 72 11 50 5C      [ 1]  482 	bres FLASH_NCR2,#FLASH_CR2_PRG
      009C3E 90 5F            [ 1]  483 	clrw y
      009C40 F6               [ 1]  484 1$:	ld a,(x)
      009C41 91 A7 00 30      [ 1]  485 	ldf ([FPTR],y),a
      009C45 5C               [ 2]  486 	incw x 
      009C46 90 5C            [ 2]  487 	incw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



      009C48 0A 01            [ 1]  488 	dec (BCNT,sp)
      009C4A 26 F4            [ 1]  489 	jrne 1$
                                    490 ; wait EOP bit 
      009C4C 72 05 50 5F FB   [ 2]  491 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. 
      009C51 84               [ 1]  492 	pop a ; remove BCNT from stack 
      009C52 81               [ 4]  493 	ret 
      009C53                        494 copy_buffer_end:
                                    495 
                                    496 ;-------------------------
                                    497 ; move program_row to RAM 
                                    498 ; in TIB 
                                    499 ;------------------------
      009C53                        500 copy_prog_to_ram:
      009C53 1D 00 06         [ 2]  501 	subw x,#6
      009C56 90 AE 9C 34      [ 2]  502 	ldw y,#copy_buffer 
      009C5A EF 04            [ 2]  503 	ldw (4,x),y 
      009C5C 90 AE 17 00      [ 2]  504 	ldw y,#TIBBASE
      009C60 EF 02            [ 2]  505 	ldw (2,x),y 
      009C62 90 AE 9C 53      [ 2]  506 	ldw y,#copy_buffer_end 
      009C66 72 A2 9C 34      [ 2]  507 	subw y,#copy_buffer  
      009C6A FF               [ 2]  508 	ldw (x),y 
      009C6B CD 8B 05         [ 4]  509 	call CMOVE 
      009C6E 81               [ 4]  510 	ret 
                                    511 
                                    512 
                                    513 ;-----------------------------
                                    514 ; write a row in FLASH/EEPROM 
                                    515 ; WR-ROW ( a ud -- )
                                    516 ; a -> address 128 byte buffer to write 
                                    517 ; ud ->  row address in FLASH|EEPROM 
                                    518 ;-----------------------------
      009C6F 9B B6                  519 	.word LINK 
                           001BF1   520 	LINK=.
      009C71 06                     521 	.byte 6 
      009C72 57 52 2D 52 4F 57      522 	.ascii "WR-ROW"
      009C78                        523 write_row:
      009C78 CD 99 86         [ 4]  524 	call fptr_store
                                    525 ; align to FLASH block 
      009C7B A6 80            [ 1]  526 	ld a,#0x80 
      009C7D B4 32            [ 1]  527 	and a,PTR8 
      009C7F B7 32            [ 1]  528 	ld PTR8,a  
      009C81 CD 9C 53         [ 4]  529 	call copy_prog_to_ram
      009C84 CD 9A DC         [ 4]  530 	call unlock
      009C87 90 93            [ 1]  531 	ldw y,x 
      009C89 90 FE            [ 2]  532 	ldw y,(y)
      009C8B 1C 00 02         [ 2]  533 	addw x,#CELLL 
      009C8E 89               [ 2]  534 	pushw x 
      009C8F 93               [ 1]  535 	ldw x,y ; buffer address in x 
      009C90 CD 17 00         [ 4]  536 	call TIBBASE
      009C93 CD 9B 04         [ 4]  537 	call lock
      009C96 85               [ 2]  538 	popw x 
      009C97 81               [ 4]  539 	ret 
                                    540 
                                    541 ;-------------------------------------
                                    542 ; change value of OPTION register 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



                                    543 ; SET-OPT (c n -- ) 
                                    544 ; c new value.
                                    545 ; n OPT  number {1..7}
                                    546 ;--------------------------------------
      009C98 9C 71                  547 		.word LINK 
                           001C1A   548 		LINK=.
      009C9A 07                     549 		.byte 7 
      009C9B 53 45 54 2D 4F 50 54   550 		.ascii "SET-OPT" 
      009CA2                        551 set_option: 
      009CA2 90 93            [ 1]  552 		ldw y,x 
      009CA4 90 FE            [ 2]  553 		ldw y,(y)
      009CA6 27 06            [ 1]  554 		jreq 1$
      009CA8 90 A3 00 07      [ 2]  555 		cpw y,#7 
      009CAC 23 04            [ 2]  556 		jrule 2$ 
                                    557 ; invalid OPTION number 		
      009CAE 1C 00 04         [ 2]  558 1$:		addw x,#2*CELLL
      009CB1 81               [ 4]  559 		ret
      009CB2 90 58            [ 2]  560 2$:		sllw y 
      009CB4 72 A9 47 FF      [ 2]  561 		addw y,#OPTION_BASE-1
      009CB8 FF               [ 2]  562 		ldw (x),y 
      009CB9 1D 00 02         [ 2]  563 		subw x,#CELLL 
      009CBC 90 5F            [ 1]  564 		clrw y 
      009CBE FF               [ 2]  565 		ldw (x),y 
      009CBF CD 9B 4A         [ 4]  566 		call ee_cstore
      009CC2 81               [ 4]  567 		ret 
                                    568 
                                    569 
                                    570 
                                    571 ;--------------------------------------
                                    572 ; reset system to its original state 
                                    573 ; before any user modification
                                    574 ; PRISTINE ( -- )
                                    575 ;-------------------------------------
      009CC3 9C 9A                  576 	.word LINK  
                           001C45   577 	LINK=.
      009CC5 08                     578 	.byte 8 
      009CC6 50 52 49 53 54 49 4E   579 	.ascii "PRISTINE"
             45
      009CCE                        580 pristine:
                                    581 ;;; erase EEPROM
      009CCE CD 99 A5         [ 4]  582 	call EEPROM 
      009CD1 CD 86 6B         [ 4]  583 1$:	call DDUP 
      009CD4 CD 9B C0         [ 4]  584 	call row_erase
      009CD7 90 93            [ 1]  585 	ldw y,x 
      009CD9 90 EE 02         [ 2]  586 	ldw y,(2,y)
      009CDC 72 A9 00 80      [ 2]  587 	addw y,#BLOCK_SIZE
      009CE0 EF 02            [ 2]  588 	ldw (2,x),y
      009CE2 90 A3 48 00      [ 2]  589 	cpw y,#OPTION_BASE 
      009CE6 25 E9            [ 1]  590 	jrult 1$
                                    591 ;;; reset OPTION to default values
      009CE8 90 AE 00 01      [ 2]  592 	ldw y,#1 ; OPT1 
      009CEC FF               [ 2]  593 2$:	ldw (x),y   
      009CED 90 5F            [ 1]  594 	clrw y 
      009CEF EF 02            [ 2]  595 	ldw (2,x),y  ; ( 0 1 -- ) 
      009CF1 CD 86 6B         [ 4]  596 	call DDUP    ; ( 0 1 0 1 -- )  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



      009CF4 CD 9C A2         [ 4]  597 	call set_option
      009CF7 90 93            [ 1]  598 	ldw y,x 
      009CF9 90 FE            [ 2]  599 	ldw y,(y)
      009CFB 90 5C            [ 2]  600 	incw y  ; next OPTION 
      009CFD 90 A3 00 08      [ 2]  601 	cpw y,#8 
      009D01 25 E9            [ 1]  602 	jrult 2$
                                    603 ;;; erase first row of app_space 	
      009D03 90 AE A0 80      [ 2]  604 	ldw y,#app_space
      009D07 EF 02            [ 2]  605 	ldw (2,x),y  
      009D09 90 5F            [ 1]  606 	clrw y 
      009D0B FF               [ 2]  607 	ldw (x),y ; ( app_space 0 -- )
      009D0C CD 9B C0         [ 4]  608 	call row_erase 
                                    609 ; reset interrupt vectors 
      009D0F 1D 00 02         [ 2]  610 	subw x,#CELLL 
      009D12 90 5F            [ 1]  611 	clrw y  
      009D14 FF               [ 2]  612 4$:	ldw (x),y  ; ( n -- ) int# 
      009D15 CD 84 98         [ 4]  613 	call DUPP  
      009D18 CD 9D 35         [ 4]  614 	call reset_vector
      009D1B 90 93            [ 1]  615 	ldw y,x 
      009D1D 90 FE            [ 2]  616 	ldw y,(y)
      009D1F 90 5C            [ 2]  617 	incw y   ; next vector 
      009D21 90 A3 00 19      [ 2]  618 	cpw y,#25 
      009D25 25 ED            [ 1]  619 	jrult 4$
      009D27 CC 80 80         [ 2]  620 	jp NonHandledInterrupt ; reset MCU
                                    621 
                                    622 ;------------------------------
                                    623 ; reset an interrupt vector 
                                    624 ; to its initial value 
                                    625 ; i.e. NonHandledInterrupt
                                    626 ; RST-IVEC ( n -- )
                                    627 ;-----------------------------
      009D2A 9C C5                  628 	.word LINK 
                           001CAC   629 	LINK=. 
      009D2C 08                     630 	.byte 8 
      009D2D 52 53 54 2D 49 56 45   631 	.ascii "RST-IVEC"
             43
      009D35                        632 reset_vector:
      009D35 90 93            [ 1]  633 	ldw y,x
      009D37 1C 00 02         [ 2]  634 	addw x,#CELLL 
      009D3A 90 FE            [ 2]  635 	ldw y,(y)
      009D3C 90 A3 00 17      [ 2]  636 	cpw y,#23 
      009D40 27 3A            [ 1]  637 	jreq 9$
      009D42 90 A3 00 1D      [ 2]  638 	cpw y,#29 ; last vector
      009D46 22 34            [ 1]  639 	jrugt 9$  
      009D48 90 58            [ 2]  640 	sllw y 
      009D4A 90 58            [ 2]  641 	sllw y 
      009D4C 72 A9 80 08      [ 2]  642 	addw y,#0x8008 ; irq0 address 
      009D50 90 BF 22         [ 2]  643 	ldw YTEMP,y
      009D53 1D 00 06         [ 2]  644 	subw x,#3*CELLL 
      009D56 EF 02            [ 2]  645 	ldw (2,x),y 
      009D58 90 5F            [ 1]  646 	clrw y
      009D5A FF               [ 2]  647 	ldw (x),y 
      009D5B A6 82            [ 1]  648 	ld a,#0x82 
      009D5D 90 95            [ 1]  649 	ld yh,a
      009D5F EF 04            [ 2]  650 	ldw (4,x),y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



      009D61 CD 9B 96         [ 4]  651 	call ee_store
      009D64 1D 00 06         [ 2]  652 	subw x,#3*CELLL
      009D67 90 5F            [ 1]  653 	clrw y 
      009D69 FF               [ 2]  654 	ldw (x),y 
      009D6A 90 AE 80 80      [ 2]  655 	ldw y,#NonHandledInterrupt
      009D6E EF 04            [ 2]  656 	ldw (4,x),y 
      009D70 90 BE 22         [ 2]  657 	ldw y,YTEMP  
      009D73 72 A9 00 02      [ 2]  658 	addw y,#2
      009D77 EF 02            [ 2]  659 	ldw (2,x),y 
      009D79 CD 9B 96         [ 4]  660 	call ee_store
      009D7C 81               [ 4]  661 9$:	ret 
                                    662 
                                    663 
                                    664 ;------------------------------
                                    665 ; all interrupt vector with 
                                    666 ; an address >= ca are resetted 
                                    667 ; to default
                                    668 ; CHKIVEC ( ca -- )
                                    669 ;------------------------------
      009D7D 9D 2C                  670 	.word LINK 
                           001CFF   671 	LINK=.
      009D7F 07                     672 	.byte 7
      009D80 43 48 4B 49 56 45 43   673 	.ascii "CHKIVEC"
                                    674 ;local variables 
                           000001   675 	SSP=1
                           000003   676 	CADR=3
                           000005   677 	OFS=5
                           000006   678 	VSIZE=6  
      009D87                        679 CHKIVEC:
      009D87 52 06            [ 2]  680 	sub sp,#VSIZE ;alloc local variables 
      009D89 90 93            [ 1]  681 	ldw y,x 
      009D8B 90 FE            [ 2]  682 	ldw y,(y)
      009D8D 17 03            [ 2]  683 	ldw (CADR,sp),y ; ca 
      009D8F 1F 01            [ 2]  684 	ldw (SSP,sp),x 
      009D91 AE 80 0A         [ 2]  685 	ldw x,#0x800a ; irq0 address 
      009D94 BF 31            [ 2]  686 	ldw PTR16,X
      009D96 AE FF FC         [ 2]  687 	ldw x,#-4 
      009D99 1C 00 04         [ 2]  688 1$:	addw x,#4
      009D9C A3 00 78         [ 2]  689 	cpw x,#30*4 ; irq0-29 
      009D9F 27 22            [ 1]  690 	jreq 9$
      009DA1 90 93            [ 1]  691 	ldw y,x  
      009DA3 91 D6 31         [ 4]  692 	ld a,([PTR16],y)
      009DA6 11 03            [ 1]  693 	cp a,(CADR,sp)
      009DA8 25 EF            [ 1]  694 	jrult 1$
      009DAA 90 5C            [ 2]  695 	incw y 
      009DAC 91 D6 31         [ 4]  696 	ld a,([PTR16],y)
      009DAF 11 04            [ 1]  697 	cp a,(CADR+1,sp) 
      009DB1 25 E6            [ 1]  698 	jrult 1$ 
      009DB3 1F 05            [ 2]  699 	ldw (OFS,sp),x 
      009DB5 54               [ 2]  700 	srlw x
      009DB6 54               [ 2]  701 	srlw x 
      009DB7 90 93            [ 1]  702 	ldw y,x 
      009DB9 1E 01            [ 2]  703 	ldw x,(SSP,sp)
      009DBB FF               [ 2]  704 	ldw (x),y
      009DBC CD 9D 35         [ 4]  705 	call reset_vector
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



      009DBF 1E 05            [ 2]  706 	ldw x,(OFS,sp) 
      009DC1 20 D6            [ 2]  707 	jra 1$
      009DC3 1E 01            [ 2]  708 9$:	ldw x,(SSP,sp) 
      009DC5 1C 00 02         [ 2]  709 	addw x,#CELLL 
      009DC8 5B 06            [ 2]  710 	addw sp,#VSIZE ; drop local variables  
      009DCA 81               [ 4]  711 	ret 
                                    712 
                                    713 ;------------------------------
                                    714 ; set interrupt vector 
                                    715 ; SET-IVEC ( ud n -- )
                                    716 ;  ud Handler address
                                    717 ;  n  vector # 0 .. 29 
                                    718 ;-----------------------------
      009DCB 9D 7F                  719 	.word LINK
                           001D4D   720 	LINK=.
      009DCD 08                     721 	.byte 8 
      009DCE 53 45 54 2D 49 56 45   722 	.ascii "SET-IVEC" 
             43
      009DD6                        723 set_vector:
      009DD6 90 93            [ 1]  724     ldw y,x 
      009DD8 1C 00 02         [ 2]  725 	addw x,#CELLL 
      009DDB 90 FE            [ 2]  726 	ldw y,(y) ; vector #
      009DDD 90 A3 00 1D      [ 2]  727 	cpw y,#29 ; last vector
      009DE1 23 04            [ 2]  728 	jrule 2$
      009DE3 1C 00 04         [ 2]  729 	addw x,#2*CELLL 
      009DE6 81               [ 4]  730 	ret
      009DE7 90 58            [ 2]  731 2$:	sllw y 
      009DE9 90 58            [ 2]  732 	sllw y 
      009DEB 72 A9 80 08      [ 2]  733 	addw y,#0X8008 ; IRQ0 vector address 
      009DEF 90 BF 22         [ 2]  734 	ldw YTEMP,y ; vector address 
      009DF2 A6 82            [ 1]  735 	ld a,#0x82 
      009DF4 90 95            [ 1]  736 	ld yh,a 
      009DF6 E6 01            [ 1]  737 	ld a,(1,x) ; isr address bits 23..16 
      009DF8 90 97            [ 1]  738 	ld yl,a 
                                    739 ;  write 0x82 + most significant byte of int address	
      009DFA 1D 00 06         [ 2]  740 	subw x,#3*CELLL 
      009DFD EF 04            [ 2]  741 	ldw (4,x),y 
      009DFF 90 BE 22         [ 2]  742 	ldw y,YTEMP
      009E02 EF 02            [ 2]  743 	ldw (2,x),y ; vector address 
      009E04 90 5F            [ 1]  744 	clrw y 
      009E06 FF               [ 2]  745 	ldw (x),y   ; as a double 
      009E07 CD 9B 96         [ 4]  746 	call ee_store 
      009E0A 90 93            [ 1]  747 	ldw y,x 
      009E0C 90 EE 02         [ 2]  748 	ldw y,(2,y) ; bits 15..0 int vector 
      009E0F 1D 00 06         [ 2]  749 	subw x,#3*CELLL 
      009E12 EF 04            [ 2]  750 	ldw (4,x),y 
      009E14 90 BE 22         [ 2]  751 	ldw y,YTEMP 
      009E17 72 A9 00 02      [ 2]  752 	addw y,#2 
      009E1B EF 02            [ 2]  753 	ldw (2,x),y 
      009E1D 90 5F            [ 1]  754 	clrw y 
      009E1F FF               [ 2]  755 	ldw (x),y 
      009E20 CD 9B 96         [ 4]  756 	call ee_store
      009E23 1C 00 04         [ 2]  757 	addw x,#2*CELLL  
      009E26 81               [ 4]  758 9$: ret 
                                    759 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



                                    760 
                                    761 ;------------------------
                                    762 ; Compile word to flash
                                    763 ; EE, (w -- )
                                    764 ;-----------------------
      009E27 9D CD                  765 	.word LINK
                           001DA9   766 	LINK=.
      009E29 03                     767 	.byte 3
      009E2A 45 45 2C               768 	.ascii "EE,"
      009E2D                        769 ee_comma:
      009E2D 1D 00 04         [ 2]  770 	subw x,#2*CELLL 
      009E30 90 BE 18         [ 2]  771 	ldw y,UCP
      009E33 90 89            [ 2]  772 	pushw y 
      009E35 EF 02            [ 2]  773 	ldw (2,x),y 
      009E37 90 5F            [ 1]  774 	clrw y 
      009E39 FF               [ 2]  775 	ldw (x),y
      009E3A CD 9B 96         [ 4]  776 	call ee_store
      009E3D 90 85            [ 2]  777 	popw y 
      009E3F 72 A9 00 02      [ 2]  778 	addw y,#2
      009E43 90 BF 18         [ 2]  779 	ldw UCP,y
      009E46 81               [ 4]  780 	ret 
                                    781 
                                    782 ;-------------------------
                                    783 ; Compile byte to flash 
                                    784 ; EEC, ( c -- )	
                                    785 ;-------------------------
      009E47 9E 29                  786 	.word LINK 
                           001DC9   787 	LINK=.
      009E49 04                     788 	.byte 4 
      009E4A 45 45 43 2C            789 	.ascii "EEC,"
      009E4E                        790 ee_ccomma:
      009E4E 1D 00 04         [ 2]  791 	subw x,#2*CELLL 
      009E51 90 BE 18         [ 2]  792 	ldw y,UCP
      009E54 90 89            [ 2]  793 	pushw y 
      009E56 EF 02            [ 2]  794 	ldw (2,x),y 
      009E58 90 5F            [ 1]  795 	clrw y 
      009E5A FF               [ 2]  796 	ldw (x),y
      009E5B CD 9B 4A         [ 4]  797 	call ee_cstore
      009E5E 90 85            [ 2]  798 	popw y 
      009E60 90 5C            [ 2]  799 	incw y 
      009E62 90 BF 18         [ 2]  800 	ldw UCP,y
      009E65 81               [ 4]  801 	ret 
                                    802 
                                    803 
                                    804 ;--------------------------
                                    805 ; copy FLASH block to ROWBUF
                                    806 ; ROW2BUF ( ud -- )
                                    807 ;--------------------------
      009E66 9E 49                  808 	.word LINK 
                           001DE8   809 	LINK=.
      009E68 07                     810 	.byte 7 
      009E69 52 4F 57 32 42 55 46   811 	.ascii "ROW2BUF"
      009E70                        812 ROW2BUF: 
      009E70 CD 99 86         [ 4]  813 	call fptr_store 
      009E73 A6 80            [ 1]  814 	ld a,#BLOCK_SIZE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



      009E75 88               [ 1]  815 	push a 
      009E76 B4 32            [ 1]  816 	and a,PTR8 ; block align 
      009E78 B7 32            [ 1]  817 	ld PTR8,a
      009E7A 90 AE 16 80      [ 2]  818 	ldw y,#ROWBUFF 
      009E7E 92 BC 00 30      [ 5]  819 1$: ldf a,[FPTR]
      009E82 90 F7            [ 1]  820 	ld (y),a
      009E84 CD 9B 18         [ 4]  821 	call inc_fptr
      009E87 90 5C            [ 2]  822 	incw y 
      009E89 0A 01            [ 1]  823 	dec (1,sp)
      009E8B 26 F1            [ 1]  824 	jrne 1$ 
      009E8D 84               [ 1]  825 	pop a 
      009E8E 81               [ 4]  826 	ret 
                                    827 
                                    828 
                                    829 ;---------------------------
                                    830 ; copy ROWBUFF to flash 
                                    831 ; BUF2ROW ( ud -- )
                                    832 ; ud is row address as double 
                                    833 ;---------------------------
      009E8F 9E 68                  834 	.word LINK 
                           001E11   835 	LINK=.
      009E91 07                     836 	.byte 7 
      009E92 42 55 46 32 52 4F 57   837 	.ascii "BUF2ROW" 
      009E99                        838 BUF2ROW:
      009E99 CD 85 93         [ 4]  839 	call TBUF ; ( ud rb -- )
      009E9C CD 86 40         [ 4]  840 	call ROT 
      009E9F CD 86 40         [ 4]  841 	call ROT  ; ( rb ud -- )
      009EA2 CD 9C 78         [ 4]  842 	call write_row 
      009EA5 81               [ 4]  843 	ret 
                                    844 
                                    845 ;---------------------------------
                                    846 ; how many byte free in that row 
                                    847 ; RFREE ( a -- n )
                                    848 ; a is least byte of target address
                                    849 ;----------------------------------
      009EA6 9E 91                  850 	.word LINK 
                           001E28   851 	LINK=.
      009EA8 05                     852 	.byte 5 
      009EA9 52 46 52 45 45         853 	.ascii "RFREE"
      009EAE                        854 RFREE:
      009EAE E6 01            [ 1]  855 	ld a,(1,x)
      009EB0 A4 7F            [ 1]  856 	and a,#BLOCK_SIZE-1 
      009EB2 B7 22            [ 1]  857 	ld YTEMP,a 
      009EB4 A6 80            [ 1]  858 	ld a,#BLOCK_SIZE 
      009EB6 B0 22            [ 1]  859 	sub a,YTEMP 
      009EB8 90 5F            [ 1]  860 	clrw y 
      009EBA 90 97            [ 1]  861 	ld yl,a
      009EBC FF               [ 2]  862 	ldw (x),y 
      009EBD 81               [ 4]  863 	ret 
                                    864 
                                    865 ;---------------------------------
                                    866 ; write u bytes to flash/EEPROM 
                                    867 ; constraint to row limit 
                                    868 ; RAM2EE ( ud a u -- u2 )
                                    869 ; ud flash address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



                                    870 ; a ram address 
                                    871 ; u bytes count
                                    872 ; return u2 bytes written  
                                    873 ;-------------------------------
      009EBE 9E A8                  874 	.word LINK 
                           001E40   875 	LINK=. 
      009EC0 06                     876 	.byte 6
      009EC1 52 41 4D 32 45 45      877 	.ascii "RAM2EE"
                                    878 	
      009EC7                        879 RAM2EE:
                                    880 ; copy ud on top 
      009EC7 90 93            [ 1]  881 	ldw y,x 
      009EC9 90 EE 06         [ 2]  882 	ldw y,(6,y) ; LSW of ud  
      009ECC 90 BF 22         [ 2]  883 	ldw YTEMP,y 
      009ECF 90 93            [ 1]  884 	ldw y,x 
      009ED1 90 EE 04         [ 2]  885 	ldw y,(4,y)  ; MSW of ud 
      009ED4 1D 00 04         [ 2]  886 	subw x,#2*CELLL 
      009ED7 FF               [ 2]  887 	ldw (x),y 
      009ED8 90 BE 22         [ 2]  888 	ldw y,YTEMP 
      009EDB EF 02            [ 2]  889 	ldw (2,x),y 
      009EDD CD 9E 70         [ 4]  890 	call ROW2BUF 
      009EE0 90 93            [ 1]  891 	ldw y,x 
      009EE2 90 EE 06         [ 2]  892 	ldw y,(6,y)
      009EE5 90 89            [ 2]  893 	pushw y ; udl 
      009EE7 90 9F            [ 1]  894 	ld a,yl
      009EE9 A4 7F            [ 1]  895 	and a,#BLOCK_SIZE-1 
      009EEB 90 5F            [ 1]  896 	clrw y 
      009EED 90 97            [ 1]  897 	ld yl,a 
      009EEF 72 A9 16 80      [ 2]  898 	addw y,#ROWBUFF 
      009EF3 1D 00 02         [ 2]  899 	subw x,#CELLL 
      009EF6 FF               [ 2]  900 	ldw (x),y  
      009EF7 CD 84 A8         [ 4]  901 	call SWAPP ;  ( ud a ra u -- )
      009EFA CD 84 42         [ 4]  902 	call RFROM  
      009EFD CD 9E AE         [ 4]  903 	call RFREE 
      009F00 CD 87 80         [ 4]  904 	call MIN
      009F03 CD 84 98         [ 4]  905 	call DUPP 
      009F06 CD 84 61         [ 4]  906 	call TOR  
      009F09 CD 8B 05         [ 4]  907 	call CMOVE
      009F0C CD 9E 99         [ 4]  908 	call BUF2ROW 
      009F0F CD 84 42         [ 4]  909 	call RFROM 
      009F12 81               [ 4]  910 	ret 
                                    911 
                                    912 ;--------------------------
                                    913 ; expand 16 bit address 
                                    914 ; to 32 bit address 
                                    915 ; FADDR ( a -- ud )
                                    916 ;--------------------------
      009F13 9E C0                  917 	.word LINK 
                           001E95   918 	LINK=. 
      009F15 05                     919 	.byte 5 
      009F16 46 41 44 44 52         920 	.ascii "FADDR"
      009F1B                        921 FADDR:
      009F1B CC 89 CB         [ 2]  922 	jp ZERO 
                                    923 
                                    924 ;--------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
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
      009F1E 9F 15                  938 	.word LINK 
                           001EA0   939 	LINK=.
      009F20 05                     940 	.byte 5 
      009F21 46 4D 4F 56 45         941 	.ascii "FMOVE" 
      009F26                        942 FMOVE:
      009F26 CD 85 A5         [ 4]  943 	call TFLASH 
      009F29 CD 83 F1         [ 4]  944 	CALL AT 
      009F2C CD 83 9C         [ 4]  945 	CALL QBRAN 
      009F2F 9F AA                  946 	.word no_move  
      009F31 CD 85 F4         [ 4]  947 	call CPP
      009F34 CD 83 F1         [ 4]  948 	call AT  
      009F37 CD 84 98         [ 4]  949 	call DUPP ; ( udl udl -- )
      009F3A CD 85 D8         [ 4]  950 	call CNTXT 
      009F3D CD 83 F1         [ 4]  951 	call AT 
      009F40 CD 83 69         [ 4]  952 	call DOLIT 
      009F43 00 02                  953 	.word 2 
      009F45 CD 86 DE         [ 4]  954 	call SUBB ; ( udl udl a -- )
      009F48 CD 84 A8         [ 4]  955 	call SWAPP 
      009F4B CD 9F 1B         [ 4]  956 	call FADDR 
      009F4E CD 86 40         [ 4]  957 	call ROT  ; ( udl ud a -- )
      009F51 CD 84 98         [ 4]  958 	call DUPP 
      009F54 CD 84 61         [ 4]  959 	call TOR    ; R: a 
      009F57                        960 FMOVE2: 
      009F57 CD 8A B8         [ 4]  961 	call HERE 
      009F5A CD 84 55         [ 4]  962 	call RAT 
      009F5D CD 86 DE         [ 4]  963 	call SUBB ; (udl ud a wl -- )
      009F60                        964 next_row:
      009F60 CD 84 98         [ 4]  965 	call DUPP 
      009F63 CD 84 61         [ 4]  966 	call TOR  ; ( udl ud a wl -- ) R: a wl
      009F66 CD 9E C7         [ 4]  967 	call RAM2EE ; ( udl a u -- udl u2 ) u2 is byte written to FLASH 
      009F69 CD 84 98         [ 4]  968 	call DUPP 
      009F6C CD 84 61         [ 4]  969 	call TOR
      009F6F CD 86 80         [ 4]  970 	call PLUS  ; ( udl+ ) 
      009F72 CD 84 98         [ 4]  971 	call DUPP 
      009F75 CD 89 CB         [ 4]  972 	call ZERO   ; ( udl+ ud -- )
      009F78 CD 84 42         [ 4]  973 	call RFROM  ; ( udl+ ud u2  R: a wl ) 
      009F7B CD 84 42         [ 4]  974 	call RFROM  ; ( udl+ ud u2 wl R: a ) 
      009F7E CD 84 C2         [ 4]  975 	call OVER   ; ( udl+ ud u2 wl u2 -- )
      009F81 CD 86 DE         [ 4]  976 	call SUBB  ; ( udl+ ud u2 wl- R: a )
      009F84 CD 84 98         [ 4]  977 	call DUPP 
      009F87 CD 83 9C         [ 4]  978 	call QBRAN
      009F8A 9F A3                  979 	.word fmove_done 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



      009F8C CD 84 A8         [ 4]  980 	call SWAPP  ; ( udl+ ud wl- u2 R: a )
      009F8F CD 84 42         [ 4]  981 	call RFROM ; ( udl+ ud wl- u2 a -- ) 
      009F92 CD 86 80         [ 4]  982 	call PLUS  ; ( udl+2 ud wl- a+ )
      009F95 CD 84 98         [ 4]  983 	call DUPP 
      009F98 CD 84 61         [ 4]  984 	call TOR   ; ( udl+2 ud wl- a+ ) R: a+
      009F9B CD 84 A8         [ 4]  985 	call SWAPP 
      009F9E CD 83 B3         [ 4]  986 	call BRAN
      009FA1 9F 60                  987 	.word next_row  
      009FA3                        988 fmove_done:	
      009FA3 CD 84 42         [ 4]  989 	call RFROM  ; ( -- udl+ ud u2 wl- a  )
      009FA6 1C 00 0A         [ 2]  990 	addw x,#5*CELLL ; (  -- udl+ ) new CP 
      009FA9 81               [ 4]  991  	ret  
      009FAA                        992 no_move:
      009FAA CD 89 CB         [ 4]  993 	call ZERO
      009FAD 81               [ 4]  994 	ret 
                                    995 
                                    996 ;------------------------------------------
                                    997 ; adjust pointers after **FMOVE** operetion.
                                    998 ; UPDAT-PTR ( cp+ -- )
                                    999 ; cp+ is new CP position after FMOVE 
                                   1000 ;-------------------------------------------
      009FAE 9F 20                 1001 	.word LINK 
                           001F30  1002 	LINK=.
      009FB0 09                    1003 	.byte 9
      009FB1 55 50 44 41 54 2D 50  1004 	.ascii "UPDAT-PTR" 
             54 52
      009FBA                       1005 UPDATPTR:
                                   1006 ;reset VP to previous position  
      009FBA CD 9A 00         [ 4] 1007 	call EEPVP 
      009FBD CD 84 8E         [ 4] 1008 	call DROP 
      009FC0 CD 83 F1         [ 4] 1009 	call AT
      009FC3 CD 85 E6         [ 4] 1010 	call VPP 
      009FC6 CD 83 DA         [ 4] 1011 	call STORE
                                   1012 ;update CONTEXT and LAST 
      009FC9 CD 99 EA         [ 4] 1013 	call EEPCP 
      009FCC CD 84 8E         [ 4] 1014 	call DROP
      009FCF CD 83 F1         [ 4] 1015 	call AT
      009FD2 CD 83 69         [ 4] 1016 	call DOLIT 
      009FD5 00 02                 1017 	.word 2 
      009FD7 CD 86 80         [ 4] 1018 	call PLUS 
      009FDA CD 84 98         [ 4] 1019 	call DUPP 
      009FDD CD 85 D8         [ 4] 1020 	call CNTXT 
      009FE0 CD 83 DA         [ 4] 1021 	call STORE
      009FE3 CD 86 04         [ 4] 1022 	call LAST
      009FE6 CD 83 DA         [ 4] 1023 	call STORE 
      009FE9 CD 9A 1A         [ 4] 1024 	call UPDATLAST 
                                   1025 ;update CP 
      009FEC CD 85 F4         [ 4] 1026 	call CPP 
      009FEF CD 83 DA         [ 4] 1027 	call STORE
      009FF2 CD 9A 43         [ 4] 1028 	call UPDATCP 
      009FF5 81               [ 4] 1029 	ret 
                                   1030 
                                   1031 ;-----------------------------
                                   1032 ; move interrupt sub-routine
                                   1033 ; in flash memory
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



                                   1034 ;----------------------------- 
      009FF6 9F B0                 1035 	.word LINK 
                           001F78  1036 	LINK=. 
      009FF8 06                    1037 	.byte 6
      009FF9 49 46 4D 4F 56 45     1038 	.ascii "IFMOVE" 
      009FFF                       1039 IFMOVE:
      009FFF CD 85 A5         [ 4] 1040 	call TFLASH 
      00A002 CD 83 F1         [ 4] 1041 	CALL AT 
      00A005 CD 83 9C         [ 4] 1042 	CALL QBRAN 
      00A008 9F AA                 1043 	.word no_move 
      00A00A CD 85 F4         [ 4] 1044 	call CPP 
      00A00D CD 83 F1         [ 4] 1045 	call AT 
      00A010 CD 84 98         [ 4] 1046 	call DUPP ; ( udl udl -- )
      00A013 CD 9A 00         [ 4] 1047 	call EEPVP 
      00A016 CD 84 8E         [ 4] 1048 	call DROP
      00A019 CD 83 F1         [ 4] 1049 	call AT  ; ( udl udl a )
      00A01C CD 84 61         [ 4] 1050 	call TOR 
      00A01F CD 9F 1B         [ 4] 1051 	call FADDR
      00A022 CD 84 55         [ 4] 1052 	call RAT ; ( udl ud a -- ) R: a 
      00A025 CC 9F 57         [ 2] 1053 	jp FMOVE2 
                                   1054 
                                   1055 
                                   1056 ; application code begin here
      00A080                       1057 	.bndry 128 ; align on flash block  
      00A080                       1058 app_space: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



                                   4581 .endif ; PICATOUT_MOD
                                   4582 
                                   4583 ;===============================================================
                                   4584 
                           001F78  4585 LASTN =	LINK   ;last name defined
                                   4586 
                                   4587 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   6 AB1        000681 R   |   6 ABOR1      0011D4 R
  6 ABOR2      0011EB R   |   6 ABORQ      0011CC R   |   6 ABORT      0011BD R
  6 ABRTQ      0014A8 R   |   6 ABSS       000678 R   |   6 ACCEP      001153 R
  6 ACCP1      00115C R   |   6 ACCP2      001182 R   |   6 ACCP3      001185 R
  6 ACCP4      001187 R   |     ADC_CR1 =  005401     |     ADC_CR1_=  000000 
    ADC_CR1_=  000001     |     ADC_CR1_=  000004     |     ADC_CR1_=  000005 
    ADC_CR1_=  000006     |     ADC_CR2 =  005402     |     ADC_CR2_=  000003 
    ADC_CR2_=  000004     |     ADC_CR2_=  000005     |     ADC_CR2_=  000006 
    ADC_CR2_=  000001     |     ADC_CR3 =  005403     |     ADC_CR3_=  000007 
    ADC_CR3_=  000006     |     ADC_CSR =  005400     |     ADC_CSR_=  000006 
    ADC_CSR_=  000004     |     ADC_CSR_=  000000     |     ADC_CSR_=  000001 
    ADC_CSR_=  000002     |     ADC_CSR_=  000003     |     ADC_CSR_=  000007 
    ADC_CSR_=  000005     |     ADC_DRH =  005404     |     ADC_DRL =  005405 
    ADC_TDRH=  005406     |     ADC_TDRL=  005407     |   6 ADRADJ     00059F R
    AFR     =  004803     |     AFR0_ADC=  000000     |     AFR1_TIM=  000001 
    AFR2_CCO=  000002     |     AFR3_TIM=  000003     |     AFR4_TIM=  000004 
    AFR5_TIM=  000005     |     AFR6_I2C=  000006     |     AFR7_BEE=  000007 
  6 AFT        001493 R   |   6 AGAIN      0013E9 R   |   6 AHEAD      001446 R
  6 ALLOT      0012FC R   |   6 ANDD       000464 R   |     APP_CP  =  004004 
    APP_LAST=  004000     |     APP_RUN =  004002     |     APP_VP  =  004006 
  6 AT         000371 R   |   6 ATEXE      000A6E R   |   6 AUTORUN    000123 R
    AWU_APR =  0050F1     |     AWU_CSR =  0050F0     |     AWU_TBR =  0050F2 
    B0_MASK =  000001     |     B115200 =  000006     |     B19200  =  000003 
    B1_MASK =  000002     |     B230400 =  000007     |     B2400   =  000000 
    B2_MASK =  000004     |     B38400  =  000004     |     B3_MASK =  000008 
    B460800 =  000008     |     B4800   =  000001     |     B4_MASK =  000010 
    B57600  =  000005     |     B5_MASK =  000020     |     B6_MASK =  000040 
    B7_MASK =  000080     |     B921600 =  000009     |     B9600   =  000002 
  6 BACK1      0010FB R   |   6 BASE       0004D5 R   |     BASEE   =  00000A 
    BCNT    =  000001     |   6 BCOMP      00133E R   |   6 BDIGS      000B56 R
    BEEP_BIT=  000004     |     BEEP_CSR=  0050F3     |     BEEP_MAS=  000010 
    BEEP_POR=  00000F     |   6 BEGIN      0013CB R   |     BIT0    =  000000 
    BIT1    =  000001     |     BIT2    =  000002     |     BIT3    =  000003 
    BIT4    =  000004     |     BIT5    =  000005     |     BIT6    =  000006 
    BIT7    =  000007     |   6 BKSLA      000F93 R   |   6 BKSP       0010CB R
    BKSPP   =  000008     |   6 BLANK      00093E R   |     BLOCK_SI=  000080 
    BOOT_ROM=  006000     |     BOOT_ROM=  007FFF     |   6 BRAN       000333 R
    BTW     =  000001     |   6 BUF2ROW    001E19 R   |   6 BYE        0000B0 R
    CADR    =  000003     |     CALLL   =  0000CD     |   6 CANT_FOR   0001CE R
    CAN_DGR =  005426     |     CAN_FPSR=  005427     |     CAN_IER =  005425 
    CAN_MCR =  005420     |     CAN_MSR =  005421     |     CAN_P0  =  005428 
    CAN_P1  =  005429     |     CAN_P2  =  00542A     |     CAN_P3  =  00542B 
    CAN_P4  =  00542C     |     CAN_P5  =  00542D     |     CAN_P6  =  00542E 
    CAN_P7  =  00542F     |     CAN_P8  =  005430     |     CAN_P9  =  005431 
    CAN_PA  =  005432     |     CAN_PB  =  005433     |     CAN_PC  =  005434 
    CAN_PD  =  005435     |     CAN_PE  =  005436     |     CAN_PF  =  005437 
    CAN_RFR =  005424     |     CAN_TPR =  005423     |     CAN_TSR =  005422 
    CARRY   =  000026     |   6 CAT        00038F R   |   6 CCOMMA     001320 R
    CC_C    =  000000     |     CC_H    =  000004     |     CC_I0   =  000003 
    CC_I1   =  000005     |     CC_N    =  000002     |     CC_V    =  000007 
    CC_Z    =  000001     |     CELLL   =  000002     |   6 CELLM      0008C3 R
  6 CELLP      0008B4 R   |   6 CELLS      0008D2 R   |     CFG_GCR =  007F60 
    CFG_GCR_=  000001     |     CFG_GCR_=  000000     |   6 CHAR1      000D83 R
  6 CHAR2      000D86 R   |   6 CHKIVEC    001D07 R   |     CLKOPT  =  004807 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]

Symbol Table

    CLKOPT_C=  000002     |     CLKOPT_E=  000003     |     CLKOPT_P=  000000 
    CLKOPT_P=  000001     |     CLK_CCOR=  0050C9     |     CLK_CKDI=  0050C6 
    CLK_CKDI=  000000     |     CLK_CKDI=  000001     |     CLK_CKDI=  000002 
    CLK_CKDI=  000003     |     CLK_CKDI=  000004     |     CLK_CMSR=  0050C3 
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
    CLK_SWR_=  0000E1     |     CLK_SWR_=  0000D2     |   6 CMOV1      000A8D R
  6 CMOV2      000AA5 R   |   6 CMOVE      000A85 R   |     CNTDWN  =  00002E 
  6 CNTXT      000558 R   |   6 COLD       001897 R   |   6 COLD1      001897 R
  6 COLON      00163E R   |   6 COMMA      001309 R   |   6 COMPI      00134E R
    COMPO   =  000040     |   6 CONSTANT   0016DC R   |     CONVERT_=  000001 
  6 COUNT      000A21 R   |   6 CPP        000574 R   |     CPU_A   =  007F00 
    CPU_CCR =  007F0A     |     CPU_PCE =  007F01     |     CPU_PCH =  007F02 
    CPU_PCL =  007F03     |     CPU_SPH =  007F08     |     CPU_SPL =  007F09 
    CPU_XH  =  007F04     |     CPU_XL  =  007F05     |     CPU_YH  =  007F06 
    CPU_YL  =  007F07     |   6 CR         000DB1 R   |   6 CREAT      001684 R
    CRR     =  00000D     |   6 CSTOR      00037E R   |     CTOP    =  000080 
  6 DAT        000A01 R   |     DATSTK  =  001670     |   6 DDROP      0005E0 R
  6 DDUP       0005EB R   |     DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF 
  6 DECIM      000C06 R   |   6 DEPTH      00098E R   |     DEVID_BA=  0048CD 
    DEVID_EN=  0048D8     |     DEVID_LO=  0048D2     |     DEVID_LO=  0048D3 
    DEVID_LO=  0048D4     |     DEVID_LO=  0048D5     |     DEVID_LO=  0048D6 
    DEVID_LO=  0048D7     |     DEVID_LO=  0048D8     |     DEVID_WA=  0048D1 
    DEVID_XH=  0048CE     |     DEVID_XL=  0048CD     |     DEVID_YH=  0048D0 
    DEVID_YL=  0048CF     |   6 DGTQ1      000C4B R   |   6 DI         0000BE R
  6 DIG        000B7F R   |   6 DIGIT      000B1A R   |   6 DIGS       000B90 R
  6 DIGS1      000B90 R   |   6 DIGS2      000B9D R   |   6 DIGTQ      000C1A R
    DM_BK1RE=  007F90     |     DM_BK1RH=  007F91     |     DM_BK1RL=  007F92 
    DM_BK2RE=  007F93     |     DM_BK2RH=  007F94     |     DM_BK2RL=  007F95 
    DM_CR1  =  007F96     |     DM_CR2  =  007F97     |     DM_CSR1 =  007F98 
    DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A     |   6 DN1        000658 R
  6 DNEGA      00063D R   |   6 DOCONST    001706 R   |   6 DOLIT      0002E9 R
  6 DONXT      0002FD R   |   6 DOSTR      000DC7 R   |   6 DOT        000E4C R
  6 DOT1       000E62 R   |   6 DOTI1      00182B R   |   6 DOTID      001815 R
  6 DOTO1      001260 R   |   6 DOTOK      001246 R   |   6 DOTPR      000F75 R
  6 DOTQ       0014C2 R   |   6 DOTQP      000DF0 R   |   6 DOTR       000DFE R
  6 DOTS       0017B4 R   |   6 DOTS1      0017BF R   |   6 DOTS2      0017CB R
  6 DOVAR      0004C5 R   |   6 DROP       00040E R   |   6 DSTOR      0009DB R
  6 DUMP       00176A R   |   6 DUMP1      001781 R   |   6 DUMP3      0017A3 R
  6 DUMPP      001739 R   |   6 DUPP       000418 R   |   6 EDIGS      000BBB R
  6 EEPCP      00196A R   |   6 EEPLAST    00193D R   |   6 EEPROM     001925 R
    EEPROM_B=  004000     |     EEPROM_E=  0047FF     |     EEPROM_S=  000800 
  6 EEPRUN     001954 R   |   6 EEPVP      001980 R   |   6 EI         0000B7 R
  6 ELSEE      001421 R   |   6 EMIT       0002D3 R   |   6 EQ1        00069C R
  6 EQUAL      000686 R   |   6 ERASE      000AE7 R   |     ERR     =  00001B 
  6 EVAL       001289 R   |   6 EVAL1      001289 R   |   6 EVAL2      0012A5 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]

Symbol Table

  6 EXE1       000A7C R   |   6 EXECU      000343 R   |   6 EXIT       000353 R
    EXT     =  000000     |     EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1 
  6 EXTRC      000B42 R   |   6 FADDR      001E9B R   |     FHSE    =  7A1200 
    FHSI    =  F42400     |   6 FILL       000AB4 R   |   6 FILL1      000AD1 R
  6 FILL2      000ADA R   |   6 FIND       001027 R   |   6 FIND1      001045 R
  6 FIND2      001073 R   |   6 FIND3      00107F R   |   6 FIND4      001093 R
  6 FIND5      0010A0 R   |   6 FIND6      001084 R   |     FLASH_BA=  008000 
    FLASH_CR=  00505A     |     FLASH_CR=  000002     |     FLASH_CR=  000000 
    FLASH_CR=  000003     |     FLASH_CR=  000001     |     FLASH_CR=  00505B 
    FLASH_CR=  000005     |     FLASH_CR=  000004     |     FLASH_CR=  000007 
    FLASH_CR=  000000     |     FLASH_CR=  000006     |     FLASH_DU=  005064 
    FLASH_DU=  0000AE     |     FLASH_DU=  000056     |     FLASH_EN=  027FFF 
    FLASH_FP=  00505D     |     FLASH_FP=  000000     |     FLASH_FP=  000001 
    FLASH_FP=  000002     |     FLASH_FP=  000003     |     FLASH_FP=  000004 
    FLASH_FP=  000005     |     FLASH_IA=  00505F     |     FLASH_IA=  000003 
    FLASH_IA=  000002     |     FLASH_IA=  000006     |     FLASH_IA=  000001 
    FLASH_IA=  000000     |     FLASH_NC=  00505C     |     FLASH_NF=  00505E 
    FLASH_NF=  000000     |     FLASH_NF=  000001     |     FLASH_NF=  000002 
    FLASH_NF=  000003     |     FLASH_NF=  000004     |     FLASH_NF=  000005 
    FLASH_PU=  005062     |     FLASH_PU=  000056     |     FLASH_PU=  0000AE 
    FLASH_SI=  020000     |     FLASH_WS=  00480D     |     FLSI    =  01F400 
  6 FMOVE      001EA6 R   |   6 FMOVE2     001ED7 R   |   6 FOR        00139E R
  6 FORGET     000154 R   |   6 FORGET1    000186 R   |   6 FORGET2    0001DC R
  6 FORGET4    0001E5 R   |     FPTR    =  000030     |   6 FREEVAR    0001F2 R
  6 FREEVAR4   000228 R   |     GPIO_BAS=  005000     |     GPIO_CR1=  000003 
    GPIO_CR2=  000004     |     GPIO_DDR=  000002     |     GPIO_IDR=  000001 
    GPIO_ODR=  000000     |     GPIO_SIZ=  000005     |   6 HERE       000A38 R
  6 HEX        000BF1 R   |   6 HI         00186A R   |   6 HLD        000545 R
  6 HOLD       000B66 R   |     HSECNT  =  004809     |     I2C_CCRH=  00521C 
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
    I2C_TRIS=  000011     |     I2C_WRIT=  000000     |   6 ICOLON     00164F R
  6 IFETCH     0013BC R   |   6 IFF        0013F9 R   |   6 IFMOVE     001F7F R
    IMEDD   =  000080     |   6 IMMED      001661 R   |   6 INCH       0002C7 R
  6 INITOFS    001617 R   |   6 INN        0004F3 R   |     INPUT_DI=  000000 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]

Symbol Table

    INPUT_EI=  000001     |     INPUT_FL=  000000     |     INPUT_PU=  000001 
  6 INTE1      001228 R   |   6 INTER      0011FE R   |     INT_ADC2=  000016 
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
  6 INVER      00061A R   |     IPR0    =  000002     |     IPR1    =  000001 
    IPR2    =  000000     |     IPR3    =  000003     |     IPR_MASK=  000003 
    IRET_COD=  000080     |   6 ISEMI      0015AC R   |     ITC_SPR1=  007F70 
    ITC_SPR2=  007F71     |     ITC_SPR3=  007F72     |     ITC_SPR4=  007F73 
    ITC_SPR5=  007F74     |     ITC_SPR6=  007F75     |     ITC_SPR7=  007F76 
    ITC_SPR8=  007F77     |     IWDG_KR =  0050E0     |     IWDG_PR =  0050E1 
    IWDG_RLR=  0050E2     |   6 JSRC       001601 R   |   6 KEY        000D31 R
  6 KTAP       001118 R   |   6 KTAP1      00113B R   |   6 KTAP2      00113E R
  6 LAST       000584 R   |   6 LASTN   =  001F78 R   |   6 LBRAC      001235 R
    LED2_BIT=  000005     |     LED2_MAS=  000020     |     LED2_POR=  00500A 
  6 LESS       0006C3 R   |     LF      =  00000A     |   6 LINK    =  001F78 R
  6 LITER      001370 R   |   6 LSHIFT     0008FD R   |   6 LSHIFT1    000906 R
  6 LSHIFT4    00090E R   |   6 LT1        0006D9 R   |     MASKK   =  001F7F 
  6 MAX        0006E3 R   |   6 MAX1       0006F6 R   |   6 MIN        000700 R
  6 MIN1       000713 R   |   6 MMOD1      0007B6 R   |   6 MMOD2      0007CA R
  6 MMOD3      0007E1 R   |   6 MMSM1      00075D R   |   6 MMSM2      000771 R
  6 MMSM3      000773 R   |   6 MMSM4      00077B R   |   6 MODD       0007FB R
  6 MONE       000964 R   |     MS      =  00002C     |   6 MSEC       000232 R
  6 MSMOD      000799 R   |   6 MSTA1      00088C R   |   6 MSTAR      000869 R
    NAFR    =  004804     |   6 NAMEQ      0010C0 R   |   6 NAMET      000FD1 R
    NCLKOPT =  004808     |   6 NEGAT      00062B R   |   6 NEX1       00030A R
  6 NEXT       0013AD R   |     NFLASH_W=  00480E     |     NHSECNT =  00480A 
    NOPT1   =  004802     |     NOPT2   =  004804     |     NOPT3   =  004806 
    NOPT4   =  004808     |     NOPT5   =  00480A     |     NOPT6   =  00480C 
    NOPT7   =  00480E     |     NOPTBL  =  00487F     |   6 NTIB       000503 R
    NUBC    =  004802     |   6 NUFQ       000D47 R   |   6 NUFQ1      000D60 R
  6 NUMBQ      000C5E R   |   6 NUMQ1      000C92 R   |   6 NUMQ2      000CC3 R
  6 NUMQ3      000D05 R   |   6 NUMQ4      000D0A R   |   6 NUMQ5      000D19 R
  6 NUMQ6      000D1C R   |     NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD 
    NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE 
  6 NonHandl   000000 R   |   6 OFFSET     000596 R   |     OFS     =  000005 
  6 ONE        000956 R   |   6 ONEM       0008EC R   |   6 ONEP       0008DF R
    OPT     =  000002     |     OPT0    =  004800     |     OPT1    =  004801 
    OPT2    =  004803     |     OPT3    =  004805     |     OPT4    =  004807 
    OPT5    =  004809     |     OPT6    =  00480B     |     OPT7    =  00480D 
    OPTBL   =  00487E     |     OPTION_B=  004800     |     OPTION_E=  00487F 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]

Symbol Table

    OPTION_S=  000080     |   6 ORIG       000043 R   |   6 ORR        000478 R
  6 OUTPUT     0002D8 R   |     OUTPUT_F=  000001     |     OUTPUT_O=  000000 
    OUTPUT_P=  000001     |     OUTPUT_S=  000000     |   6 OVER       000442 R
  6 OVERT      00157D R   |     PA      =  000000     |   6 PACKS      000AF9 R
  6 PAD        000A49 R   |   6 PAREN      000F84 R   |   6 PARS       000E7D R
  6 PARS1      000EA8 R   |   6 PARS2      000ED3 R   |   6 PARS3      000ED6 R
  6 PARS4      000EDF R   |   6 PARS5      000F02 R   |   6 PARS6      000F17 R
  6 PARS7      000F26 R   |   6 PARS8      000F35 R   |   6 PARSE      000F46 R
  6 PAUSE      000242 R   |     PA_BASE =  005000     |     PA_CR1  =  005003 
    PA_CR2  =  005004     |     PA_DDR  =  005002     |     PA_IDR  =  005001 
    PA_ODR  =  005000     |     PB      =  000005     |     PB_BASE =  005005 
    PB_CR1  =  005008     |     PB_CR2  =  005009     |     PB_DDR  =  005007 
    PB_IDR  =  005006     |     PB_ODR  =  005005     |     PC      =  00000A 
    PC_BASE =  00500A     |     PC_CR1  =  00500D     |     PC_CR2  =  00500E 
    PC_DDR  =  00500C     |     PC_IDR  =  00500B     |     PC_ODR  =  00500A 
    PD      =  00000F     |   6 PDUM1      00174C R   |   6 PDUM2      00175D R
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
  6 PICK       0009A5 R   |     PI_BASE =  005028     |     PI_CR1  =  00502B 
    PI_CR2  =  00502C     |     PI_DDR  =  00502A     |     PI_IDR  =  005029 
    PI_ODR  =  005028     |   6 PLUS       000600 R   |   6 PNAM1      001532 R
  6 PRESE      0012B4 R   |     PROD1   =  000020     |     PROD2   =  000022 
    PROD3   =  000024     |   6 PSTOR      0009BA R   |     PTR16   =  000031 
    PTR8    =  000032     |   6 QBRAN      00031C R   |   6 QDUP       0005AF R
  6 QDUP1      0005B9 R   |   6 QKEY       0002B5 R   |   6 QSTAC      00126C R
  6 QUERY      001198 R   |   6 QUEST      000E6F R   |   6 QUIT       0012D1 R
  6 QUIT1      0012D9 R   |   6 QUIT2      0012DC R   |   6 RAM2EE     001E47 R
    RAMBASE =  000000     |     RAM_BASE=  000000     |     RAM_END =  0017FF 
    RAM_SIZE=  001800     |   6 RAT        0003D5 R   |   6 RBRAC      0015EE R
  6 REPEA      001476 R   |   6 RFREE      001E2E R   |   6 RFROM      0003C2 R
    ROP     =  004800     |   6 ROT        0005C0 R   |   6 ROW2BUF    001DF0 R
    ROWBUFF =  001680     |     RP0     =  00002A     |   6 RPAT       00039F R
    RPP     =  0017FF     |   6 RPSTO      0003AC R   |   6 RSHIFT     000919 R
  6 RSHIFT1    000922 R   |   6 RSHIFT4    00092A R   |     RST_SR  =  0050B3 
  6 SAME1      000FEF R   |   6 SAME2      001018 R   |   6 SAMEQ      000FE7 R
  6 SCOM1      001567 R   |   6 SCOM2      00156A R   |   6 SCOMP      001549 R
  6 SEMIS      00158D R   |   6 SETISP     0000CA R   |     SFR_BASE=  005000 
    SFR_END =  0057FF     |   6 SIGN       000BA5 R   |   6 SIGN1      000BB5 R
  6 SLASH      000805 R   |   6 SLMOD      0007E9 R   |   6 SNAME      0014FC R
    SP0     =  000028     |   6 SPACE      000D69 R   |   6 SPACS      000D78 R
  6 SPAT       0003F8 R   |     SPI_CR1 =  005200     |     SPI_CR2 =  005201 
    SPI_CRCP=  005205     |     SPI_DR  =  005204     |     SPI_ICR =  005202 
    SPI_RXCR=  005206     |     SPI_SR  =  005203     |     SPI_TXCR=  005207 
    SPP     =  001670     |   6 SPSTO      000405 R   |   6 SSMOD      000895 R
    SSP     =  000001     |     STACK   =  0017FF     |   6 STAR       00085E R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]

Symbol Table

  6 STASL      0008A6 R   |   6 STORE      00035A R   |   6 STR        000BD3 R
  6 STRCQ      00137E R   |   6 STRQ       0014B5 R   |   6 STRQP      000DE6 R
  6 SUBB       00065E R   |   6 SWAPP      000428 R   |     SWIM_CSR=  007F80 
  6 TAP        001102 R   |   6 TBOOT      00188B R   |   6 TBUF       000513 R
    TBUFFBAS=  001680     |   6 TCHA1      000985 R   |   6 TCHAR      000975 R
  6 TEMP       0004E4 R   |   6 TEVAL      000536 R   |   6 TFLASH     000525 R
  6 THENN      00140E R   |   6 TIB        000A5A R   |     TIBB    =  001700 
    TIBBASE =  001700     |     TIC     =  000027     |   6 TICK       0012E8 R
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]

Symbol Table

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
    TIM4_PSC=  000001     |     TIM4_PSC=  000005     |     TIM4_PSC=  000002 
    TIM4_PSC=  000006     |     TIM4_PSC=  000003     |     TIM4_PSC=  000000 
    TIM4_PSC=  000001     |     TIM4_PSC=  000002     |     TIM4_SR =  005342 
    TIM4_SR_=  000000     |   6 TIMEOUTQ   000272 R   |   6 TIMER      00025C R
    TIM_CR1_=  000007     |     TIM_CR1_=  000000     |     TIM_CR1_=  000006 
    TIM_CR1_=  000005     |     TIM_CR1_=  000004     |     TIM_CR1_=  000003 
    TIM_CR1_=  000001     |     TIM_CR1_=  000002     |   6 TNAM2      0017E5 R
  6 TNAM3      001803 R   |   6 TNAM4      001809 R   |   6 TNAME      0017E2 R
  6 TOFLASH    000297 R   |   6 TOKEN      000FC3 R   |   6 TOR        0003E1 R
  6 TORAM      0002A8 R   |     TRUEE   =  00FFFF     |   6 TWOSL      000931 R
  6 TYPE1      000D98 R   |   6 TYPE2      000DA4 R   |   6 TYPES      000D93 R
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
    UART_CR2=  000005     |     UART_CR2=  000004     |     UART_CR2=  000002 
    UART_CR2=  000005     |     UART_CR2=  000001     |     UART_CR2=  000000 
    UART_CR2=  000006     |     UART_CR2=  000003     |     UART_CR2=  000007 
    UART_CR3=  000006     |     UART_CR3=  000003     |     UART_CR3=  000001 
    UART_CR3=  000002     |     UART_CR3=  000000     |     UART_CR3=  000006 
    UART_CR3=  000004     |     UART_CR3=  000005     |     UART_CR4=  000007 
    UART_CR4=  000000     |     UART_CR4=  000001     |     UART_CR4=  000002 
    UART_CR4=  000003     |     UART_CR4=  000004     |     UART_CR4=  000006 
    UART_CR4=  000005     |     UART_CR5=  000008     |     UART_CR5=  000003 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]

Symbol Table

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
    UD3     =  000003     |     UD4     =  000004     |   6 UDOT       000E39 R
  6 UDOTR      000E19 R   |   6 UEND       000041 R   |     UHLD    =  000012 
    UINN    =  00000A     |     UINTER  =  000010     |     ULAST   =  00001A 
  6 ULES1      0006BB R   |   6 ULESS      0006A5 R   |   6 UMMOD      00073B R
  6 UMSTA      000814 R   |   6 UNIQ1      0014F3 R   |   6 UNIQU      0014D4 R
  6 UNTIL      0013D6 R   |     UOFFSET =  00001C     |   6 UPDATCP    0019C3 R
  6 UPDATLAS   00199A R   |   6 UPDATPTR   001F3A R   |   6 UPDATRUN   0019B2 R
  6 UPDATVP    0019DA R   |   6 UPL1       0004B9 R   |   6 UPLUS      0004A2 R
    UPP     =  000006     |     USR_BTN_=  000004     |     USR_BTN_=  000010 
    USR_BTN_=  005015     |     UTFLASH =  00001E     |     UTIB    =  00000E 
    UTMP    =  000008     |   6 UTYP1      00171C R   |   6 UTYP2      00172B R
  6 UTYPE      001717 R   |     UVP     =  000016     |   6 UZERO      000027 R
  6 VARIA      00169E R   |     VER     =  000003     |   6 VPP        000566 R
    VSIZE   =  000006     |     WANT_DEB=  000000     |     WANT_SEE=  000000 
    WDGOPT  =  004805     |     WDGOPT_I=  000002     |     WDGOPT_L=  000003 
    WDGOPT_W=  000000     |     WDGOPT_W=  000001     |   6 WHILE      00145C R
  6 WITHI      000720 R   |   6 WORDD      000FAF R   |   6 WORDS      00183F R
  6 WORS1      001845 R   |   6 WORS2      001864 R   |     WWDG_CR =  0050D1 
    WWDG_WR =  0050D2     |   6 XORR       00048D R   |     XTEMP   =  000020 
    YTEMP   =  000022     |   6 ZERO       00094B R   |   6 ZL1        00045A R
  6 ZLESS      000451 R   |   6 app_spac   002000 R   |   6 block_er   001B5D R
  6 clear_ra   000019 R   |   6 clock_in   00005E R   |   6 copy_buf   001BB4 R
  6 copy_buf   001BD3 R   |   6 copy_pro   001BD3 R   |     da      =  000002 
    db      =  000003     |     dc      =  000000     |     dd      =  000001 
  6 ee_ccomm   001DCE R   |   6 ee_comma   001DAD R   |   6 ee_cstor   001ACA R
  6 ee_store   001B16 R   |   6 erase_fl   001B79 R   |   6 farat      0019EB R
  6 farcat     001A07 R   |   6 fmove_do   001F23 R   |   6 fptr_sto   001906 R
  6 inc_fptr   001A98 R   |   6 lock       001A84 R   |   6 main       000016 R
  6 next_row   001EE0 R   |   6 no_move    001F2A R   |   6 pristine   001C4E R
  6 proceed_   001B7C R   |   6 reboot     000289 R   |   6 reset_ve   001CB5 R
  6 row_eras   001B40 R   |   6 row_eras   001B8D R   |   6 row_eras   001BB4 R
  6 set_opti   001C22 R   |   6 set_vect   001D56 R   |   6 uart1_in   000070 R
  6 unlock     001A5C R   |   6 unlock_e   001A1E R   |   6 unlock_f   001A3D R
  6 write_by   001AAF R   |   6 write_ro   001BF8 R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 DATA       size      0   flags    8
   2 DATA0      size      0   flags    8
   3 SSEG       size      0   flags    8
   4 SSEG1      size    100   flags    8
   5 HOME       size     80   flags    0
   6 CODE       size   2000   flags    0

