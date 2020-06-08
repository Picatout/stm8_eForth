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
      0080B1 92 80                  279         .word      INTER   ;'EVAL
      0080B3 00 00                  280         .word      0       ;HLD
      0080B5 9F F7                  281         .word      LASTN  ;CNTXT pointer
      0080B7 00 80                  282         .word      CTOP   ;CP in RAM
      0080B9 A0 80                  283         .word      app_space ; CP in FLASH 
      0080BB 9F F7                  284         .word      LASTN   ;LAST
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
      008127 CC 99 16         [ 2]  335         jp  COLD   ;default=MN1
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
      0081A3 CD 90 45         [ 4]  420         call TOKEN 
      0081A6 CD 84 98         [ 4]  421         call DUPP 
      0081A9 CD 83 9C         [ 4]  422         call QBRAN 
      0081AC 82 5C                  423         .word FORGET2
      0081AE CD 91 42         [ 4]  424         call NAMEQ
      0081B1 CD 86 2F         [ 4]  425         call QDUP 
      0081B4 CD 83 9C         [ 4]  426         call QBRAN 
      0081B7 82 5C                  427         .word FORGET2
      0081B9 CD 84 8E         [ 4]  428         call DROP 
      0081BC 1D 00 04         [ 2]  429         subw x,#2*CELLL 
      0081BF 90 5F            [ 1]  430         clrw y 
      0081C1 FF               [ 2]  431         ldw (x),y 
      0081C2 90 AE 40 02      [ 2]  432         ldw y,#APP_RUN 
      0081C6 EF 02            [ 2]  433         ldw (2,x),y 
      0081C8 CC 9B 95         [ 2]  434         jp ee_store 
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
      0081D4 CD 90 45         [ 4]  446         call TOKEN
      0081D7 CD 84 98         [ 4]  447         call DUPP 
      0081DA CD 83 9C         [ 4]  448         call QBRAN 
      0081DD 82 5C                  449         .word FORGET2
      0081DF CD 91 42         [ 4]  450         call NAMEQ ; ( a -- ca na | a F )
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
      008203 CD 9D 86         [ 4]  466         call CHKIVEC ; ( na -- ) 
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
      008248 CD 9A 42         [ 4]  494         call UPDATCP 
      00824B CC 9A 19         [ 2]  495         jp UPDATLAST 
      00824E                        496 CANT_FORGET:
      00824E CD 92 4E         [ 4]  497         call ABORQ
      008251 0A                     498         .byte 10
      008252 20 50 72 6F 74 65 63   499         .ascii " Protected"
             74 65 64
      00825C                        500 FORGET2:
      00825C CD 92 4E         [ 4]  501         call ABORQ
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
      0082A5 CC 9A 59         [ 2]  535         jp UPDATVP 
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
      008A29 90 5C            [ 2] 2059         INCW Y ; PICATOUT_MOD for standard compliance 
      008A2B 90 58            [ 2] 2060         SLAW Y
      008A2D BF 20            [ 2] 2061         LDW XTEMP,X
      008A2F 72 B9 00 20      [ 2] 2062         ADDW Y,XTEMP
      008A33 90 FE            [ 2] 2063         LDW Y,(Y)
      008A35 FF               [ 2] 2064         LDW (X),Y
      008A36 81               [ 4] 2065         RET
                                   2066 
                                   2067 ;; Memory access
                                   2068 
                                   2069 ;       +!      ( n a -- )
                                   2070 ;       Add n to  contents at address a.
      008A37 8A 20                 2071         .word      LINK
                           0009B9  2072 LINK = . 
      008A39 02                    2073         .byte      2
      008A3A 2B 21                 2074         .ascii     "+!"
      008A3C                       2075 PSTOR:
                           000001  2076 .if CONVERT_TO_CODE
      008A3C 90 93            [ 1] 2077         ldw y,x 
      008A3E 90 FE            [ 2] 2078         ldw y,(y)
      008A40 90 BF 22         [ 2] 2079         ldw YTEMP,y  ; address
      008A43 90 FE            [ 2] 2080         ldw y,(y)  
      008A45 90 89            [ 2] 2081         pushw y  ; value at address 
      008A47 90 93            [ 1] 2082         ldw y,x 
      008A49 90 EE 02         [ 2] 2083         ldw y,(2,y) ; n 
      008A4C 72 F9 01         [ 2] 2084         addw y,(1,sp) ; n+value
      008A4F 91 CF 22         [ 5] 2085         ldw [YTEMP],y ;  a!
      008A52 90 85            [ 2] 2086         popw y    ;drop local var
      008A54 1C 00 04         [ 2] 2087         addw x,#4 ; DDROP 
      008A57 81               [ 4] 2088         ret 
                           000000  2089 .else
                                   2090         CALL	SWAPP
                                   2091         CALL	OVER
                                   2092         CALL	AT
                                   2093         CALL	PLUS
                                   2094         CALL	SWAPP
                                   2095         JP	STORE
                                   2096 .endif 
                                   2097 
                                   2098 ;       2!      ( d a -- )
                                   2099 ;       Store  double integer to address a.
      008A58 8A 39                 2100         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



                           0009DA  2101 LINK = . 
      008A5A 02                    2102         .byte      2
      008A5B 32 21                 2103         .ascii     "2!"
      008A5D                       2104 DSTOR:
                           000001  2105 .if CONVERT_TO_CODE
      008A5D 90 93            [ 1] 2106         ldw y,x 
      008A5F 90 FE            [ 2] 2107         ldw y,(y)
      008A61 90 BF 22         [ 2] 2108         ldw YTEMP,y ; address 
      008A64 1C 00 02         [ 2] 2109         addw x,#CELLL ; drop a 
      008A67 90 93            [ 1] 2110         ldw y,x 
      008A69 90 FE            [ 2] 2111         ldw y,(y) ; hi word 
      008A6B 89               [ 2] 2112         pushw x 
      008A6C EE 02            [ 2] 2113         ldw x,(2,x) ; lo word 
      008A6E 91 CF 22         [ 5] 2114         ldw [YTEMP],y
      008A71 90 93            [ 1] 2115         ldw y,x 
      008A73 AE 00 02         [ 2] 2116         ldw x,#2 
      008A76 92 DF 22         [ 5] 2117         ldw ([YTEMP],x),y 
      008A79 85               [ 2] 2118         popw x 
      008A7A 1C 00 04         [ 2] 2119         addw x,#4 ; DDROP 
      008A7D 81               [ 4] 2120         ret 
                           000000  2121 .else
                                   2122         CALL	SWAPP
                                   2123         CALL	OVER
                                   2124         CALL	STORE
                                   2125         CALL	CELLP
                                   2126         JP	STORE
                                   2127 .endif 
                                   2128 ;       2@      ( a -- d )
                                   2129 ;       Fetch double integer from address a.
      008A7E 8A 5A                 2130         .word      LINK
                           000A00  2131 LINK = . 
      008A80 02                    2132         .byte      2
      008A81 32 40                 2133         .ascii     "2@"
      008A83                       2134 DAT:
                           000001  2135 .if CONVERT_TO_CODE
      008A83 90 93            [ 1] 2136         ldw y,x 
      008A85 90 FE            [ 2] 2137         ldw y,(y) ;address 
      008A87 90 BF 22         [ 2] 2138         ldw YTEMP,y 
      008A8A 1D 00 02         [ 2] 2139         subw x,#CELLL ; space for udh 
      008A8D 91 CE 22         [ 5] 2140         ldw y,[YTEMP] ; udh 
      008A90 FF               [ 2] 2141         ldw (x),y 
      008A91 90 AE 00 02      [ 2] 2142         ldw y,#2
      008A95 91 DE 22         [ 5] 2143         ldw y,([YTEMP],y) ; udl 
      008A98 EF 02            [ 2] 2144         ldw (2,x),y
      008A9A 81               [ 4] 2145         ret 
                           000000  2146 .else 
                                   2147         CALL	DUPP
                                   2148         CALL	CELLP
                                   2149         CALL	AT
                                   2150         CALL	SWAPP
                                   2151         JP	AT
                                   2152 .endif 
                                   2153 
                                   2154 ;       COUNT   ( b -- b +n )
                                   2155 ;       Return count byte of a string
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



                                   2156 ;       and add 1 to byte address.
      008A9B 8A 80                 2157         .word      LINK
                           000A1D  2158 LINK = . 
      008A9D 05                    2159         .byte      5
      008A9E 43 4F 55 4E 54        2160         .ascii     "COUNT"
      008AA3                       2161 COUNT:
                           000001  2162 .if CONVERT_TO_CODE
      008AA3 90 93            [ 1] 2163         ldw y,x 
      008AA5 90 FE            [ 2] 2164         ldw y,(y) ; address 
      008AA7 90 F6            [ 1] 2165         ld a,(y)  ; count 
      008AA9 90 5C            [ 2] 2166         incw y 
      008AAB FF               [ 2] 2167         ldw (x),y 
      008AAC 1D 00 02         [ 2] 2168         subw x,#CELLL 
      008AAF E7 01            [ 1] 2169         ld (1,x),a 
      008AB1 7F               [ 1] 2170         clr (x)
      008AB2 81               [ 4] 2171         ret 
                           000000  2172 .else 
                                   2173         CALL     DUPP
                                   2174         CALL     ONEP
                                   2175         CALL     SWAPP
                                   2176         JP     CAT
                                   2177 .endif 
                                   2178 
                                   2179 ;       HERE    ( -- a )
                                   2180 ;       Return  top of  variables
      008AB3 8A 9D                 2181         .word      LINK
                           000A35  2182 LINK = . 
      008AB5 04                    2183         .byte      4
      008AB6 48 45 52 45           2184         .ascii     "HERE"
      008ABA                       2185 HERE:
                           000001  2186 .if CONVERT_TO_CODE
      008ABA 90 AE 00 16      [ 2] 2187       	ldw y,#UVP 
      008ABE 90 FE            [ 2] 2188         ldw y,(y)
      008AC0 1D 00 02         [ 2] 2189         subw x,#CELLL 
      008AC3 FF               [ 2] 2190         ldw (x),y 
      008AC4 81               [ 4] 2191         ret 
                           000000  2192 .else
                                   2193         CALL     VPP
                                   2194         JP     AT
                                   2195 .endif 
                                   2196 
                                   2197 ;       PAD     ( -- a )
                                   2198 ;       Return address of text buffer
                                   2199 ;       above  code dictionary.
      008AC5 8A B5                 2200         .word      LINK
                           000A47  2201 LINK = . 
      008AC7 03                    2202         .byte      3
      008AC8 50 41 44              2203         .ascii     "PAD"
      008ACB                       2204 PAD:
      008ACB CD 8A BA         [ 4] 2205         CALL     HERE
      008ACE CD 83 69         [ 4] 2206         CALL     DOLIT
      008AD1 00 50                 2207         .word      80
      008AD3 CC 86 80         [ 2] 2208         JP     PLUS
                                   2209 
                                   2210 ;       TIB     ( -- a )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



                                   2211 ;       Return address of terminal input buffer.
      008AD6 8A C7                 2212         .word      LINK
                           000A58  2213 LINK = . 
      008AD8 03                    2214         .byte      3
      008AD9 54 49 42              2215         .ascii     "TIB"
      008ADC                       2216 TIB:
      008ADC CD 85 83         [ 4] 2217         CALL     NTIB
      008ADF CD 89 34         [ 4] 2218         CALL     CELLP
      008AE2 CC 83 F1         [ 2] 2219         JP     AT
                                   2220 
                                   2221 ;       @EXECUTE        ( a -- )
                                   2222 ;       Execute vector stored in address a.
      008AE5 8A D8                 2223         .word      LINK
                           000A67  2224 LINK = . 
      008AE7 08                    2225         .byte      8
      008AE8 40 45 58 45 43 55 54  2226         .ascii     "@EXECUTE"
             45
      008AF0                       2227 ATEXE:
      008AF0 CD 83 F1         [ 4] 2228         CALL     AT
      008AF3 CD 86 2F         [ 4] 2229         CALL     QDUP    ;?address or zero
      008AF6 CD 83 9C         [ 4] 2230         CALL     QBRAN
      008AF9 8A FE                 2231         .word      EXE1
      008AFB CD 83 C3         [ 4] 2232         CALL     EXECU   ;execute if non-zero
      008AFE 81               [ 4] 2233 EXE1:   RET     ;do nothing if zero
                                   2234 
                                   2235 ;       CMOVE   ( b1 b2 u -- )
                                   2236 ;       Copy u bytes from b1 to b2.
      008AFF 8A E7                 2237         .word      LINK
                           000A81  2238 LINK = . 
      008B01 05                    2239         .byte      5
      008B02 43 4D 4F 56 45        2240         .ascii     "CMOVE"
      008B07                       2241 CMOVE:
      008B07 CD 84 61         [ 4] 2242         CALL	TOR
      008B0A CD 83 B3         [ 4] 2243         CALL	BRAN
      008B0D 8B 27                 2244         .word	CMOV2
      008B0F CD 84 61         [ 4] 2245 CMOV1:	CALL	TOR
      008B12 CD 84 98         [ 4] 2246         CALL	DUPP
      008B15 CD 84 0F         [ 4] 2247         CALL	CAT
      008B18 CD 84 55         [ 4] 2248         CALL	RAT
      008B1B CD 83 FE         [ 4] 2249         CALL	CSTOR
      008B1E CD 89 5F         [ 4] 2250         CALL	ONEP
      008B21 CD 84 42         [ 4] 2251         CALL	RFROM
      008B24 CD 89 5F         [ 4] 2252         CALL	ONEP
      008B27 CD 83 7D         [ 4] 2253 CMOV2:	CALL	DONXT
      008B2A 8B 0F                 2254         .word	CMOV1
      008B2C CC 86 60         [ 2] 2255         JP	DDROP
                                   2256 
                                   2257 ;       FILL    ( b u c -- )
                                   2258 ;       Fill u bytes of character c
                                   2259 ;       to area beginning at b.
      008B2F 8B 01                 2260         .word       LINK
                           000AB1  2261 LINK = . 
      008B31 04                    2262         .byte       4
      008B32 46 49 4C 4C           2263         .ascii     "FILL"
      008B36                       2264 FILL:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



                           000001  2265 .if CONVERT_TO_CODE
      008B36 90 93            [ 1] 2266         ldw y,x 
      008B38 90 E6 01         [ 1] 2267         ld a,(1,y) ; c 
      008B3B 1C 00 02         [ 2] 2268         addw x,#CELLL ; drop c 
      008B3E 90 93            [ 1] 2269         ldw y,x 
      008B40 90 FE            [ 2] 2270         ldw y,(y) ; count
      008B42 90 89            [ 2] 2271         pushw y 
      008B44 1C 00 02         [ 2] 2272         addw x,#CELLL ; drop u 
      008B47 90 93            [ 1] 2273         ldw y,x 
      008B49 1C 00 02         [ 2] 2274         addw x,#CELLL ; drop b 
      008B4C 90 FE            [ 2] 2275         ldw y,(y) ; address
      008B4E 90 BF 22         [ 2] 2276         ldw YTEMP,y
      008B51 90 85            [ 2] 2277         popw y ; count 
      008B53                       2278 FILL1:  
      008B53 92 C7 22         [ 4] 2279         ld [YTEMP],a 
      008B56 3C 23            [ 1] 2280         inc YTEMP+1
      008B58 24 02            [ 1] 2281         jrnc FILL2 
      008B5A 3C 22            [ 1] 2282         inc YTEMP
      008B5C                       2283 FILL2: 
      008B5C 90 5A            [ 2] 2284         decw y ; count 
      008B5E 26 F3            [ 1] 2285         jrne FILL1  
      008B60 81               [ 4] 2286         ret 
                           000000  2287 .else 
                                   2288         CALL	SWAPP
                                   2289         CALL	TOR
                                   2290         CALL	SWAPP
                                   2291         CALL	BRAN
                                   2292         .word	FILL2
                                   2293 FILL1:	CALL	DDUP
                                   2294         CALL	CSTOR
                                   2295         CALL	ONEP
                                   2296 FILL2:	CALL	DONXT
                                   2297         .word	FILL1
                                   2298         JP	DDROP
                                   2299 .endif
                                   2300 
                                   2301 ;       ERASE   ( b u -- )
                                   2302 ;       Erase u bytes beginning at b.
      008B61 8B 31                 2303         .word      LINK
                           000AE3  2304 LINK = . 
      008B63 05                    2305         .byte      5
      008B64 45 52 41 53 45        2306         .ascii     "ERASE"
      008B69                       2307 ERASE:
                           000001  2308 .if CONVERT_TO_CODE
      008B69 90 5F            [ 1] 2309         clrw y 
      008B6B 1D 00 02         [ 2] 2310         subw x,#CELLL 
      008B6E FF               [ 2] 2311         ldw (x),y 
      008B6F CC 8B 36         [ 2] 2312         jp FILL 
                           000000  2313 .else 
                                   2314         CALL     ZERO
                                   2315         JP     FILL
                                   2316 .endif 
                                   2317 ;       PACK0x   ( b u a -- a )
                                   2318 ;       Build a counted string with
                                   2319 ;       u characters from b. Null fill.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



      008B72 8B 63                 2320         .word      LINK
                           000AF4  2321 LINK = . 
      008B74 05                    2322         .byte      5
      008B75 50 41 43 4B 30 58     2323         .ascii     "PACK0X"
      008B7B                       2324 PACKS:
      008B7B CD 84 98         [ 4] 2325         CALL     DUPP
      008B7E CD 84 61         [ 4] 2326         CALL     TOR     ;strings only on cell boundary
      008B81 CD 86 6B         [ 4] 2327         CALL     DDUP
      008B84 CD 83 FE         [ 4] 2328         CALL     CSTOR
      008B87 CD 89 5F         [ 4] 2329         CALL     ONEP ;save count
      008B8A CD 84 A8         [ 4] 2330         CALL     SWAPP
      008B8D CD 8B 07         [ 4] 2331         CALL     CMOVE
      008B90 CD 84 42         [ 4] 2332         CALL     RFROM
      008B93 81               [ 4] 2333         RET
                                   2334 
                                   2335 ;; Numeric output, single precision
                                   2336 
                                   2337 ;       DIGIT   ( u -- c )
                                   2338 ;       Convert digit u to a character.
      008B94 8B 74                 2339         .word      LINK
                           000B16  2340 LINK = . 
      008B96 05                    2341         .byte      5
      008B97 44 49 47 49 54        2342         .ascii     "DIGIT"
      008B9C                       2343 DIGIT:
      008B9C CD 83 69         [ 4] 2344         CALL	DOLIT
      008B9F 00 09                 2345         .word	9
      008BA1 CD 84 C2         [ 4] 2346         CALL	OVER
      008BA4 CD 87 43         [ 4] 2347         CALL	LESS
      008BA7 CD 83 69         [ 4] 2348         CALL	DOLIT
      008BAA 00 07                 2349         .word	7
      008BAC CD 84 E4         [ 4] 2350         CALL	ANDD
      008BAF CD 86 80         [ 4] 2351         CALL	PLUS
      008BB2 CD 83 69         [ 4] 2352         CALL	DOLIT
      008BB5 00 30                 2353         .word	48	;'0'
      008BB7 CC 86 80         [ 2] 2354         JP	PLUS
                                   2355 
                                   2356 ;       EXTRACT ( n base -- n c )
                                   2357 ;       Extract least significant digit from n.
      008BBA 8B 96                 2358         .word      LINK
                           000B3C  2359 LINK = . 
      008BBC 07                    2360         .byte      7
      008BBD 45 58 54 52 41 43 54  2361         .ascii     "EXTRACT"
      008BC4                       2362 EXTRC:
      008BC4 CD 89 CB         [ 4] 2363         CALL     ZERO
      008BC7 CD 84 A8         [ 4] 2364         CALL     SWAPP
      008BCA CD 87 BB         [ 4] 2365         CALL     UMMOD
      008BCD CD 84 A8         [ 4] 2366         CALL     SWAPP
      008BD0 CC 8B 9C         [ 2] 2367         JP     DIGIT
                                   2368 
                                   2369 ;       <#      ( -- )
                                   2370 ;       Initiate  numeric output process.
      008BD3 8B BC                 2371         .word      LINK
                           000B55  2372 LINK = . 
      008BD5 02                    2373         .byte      2
      008BD6 3C 23                 2374         .ascii     "<#"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



      008BD8                       2375 BDIGS:
      008BD8 CD 8A CB         [ 4] 2376         CALL     PAD
      008BDB CD 85 C5         [ 4] 2377         CALL     HLD
      008BDE CC 83 DA         [ 2] 2378         JP     STORE
                                   2379 
                                   2380 ;       HOLD    ( c -- )
                                   2381 ;       Insert a character into output string.
      008BE1 8B D5                 2382         .word      LINK
                           000B63  2383 LINK = . 
      008BE3 04                    2384         .byte      4
      008BE4 48 4F 4C 44           2385         .ascii     "HOLD"
      008BE8                       2386 HOLD:
      008BE8 CD 85 C5         [ 4] 2387         CALL     HLD
      008BEB CD 83 F1         [ 4] 2388         CALL     AT
      008BEE CD 89 6C         [ 4] 2389         CALL     ONEM
      008BF1 CD 84 98         [ 4] 2390         CALL     DUPP
      008BF4 CD 85 C5         [ 4] 2391         CALL     HLD
      008BF7 CD 83 DA         [ 4] 2392         CALL     STORE
      008BFA CC 83 FE         [ 2] 2393         JP     CSTOR
                                   2394 
                                   2395 ;       #       ( u -- u )
                                   2396 ;       Extract one digit from u and
                                   2397 ;       append digit to output string.
      008BFD 8B E3                 2398         .word      LINK
                           000B7F  2399 LINK = . 
      008BFF 01                    2400         .byte      1
      008C00 23                    2401         .ascii     "#"
      008C01                       2402 DIG:
      008C01 CD 85 55         [ 4] 2403         CALL     BASE
      008C04 CD 83 F1         [ 4] 2404         CALL     AT
      008C07 CD 8B C4         [ 4] 2405         CALL     EXTRC
      008C0A CC 8B E8         [ 2] 2406         JP     HOLD
                                   2407 
                                   2408 ;       #S      ( u -- 0 )
                                   2409 ;       Convert u until all digits
                                   2410 ;       are added to output string.
      008C0D 8B FF                 2411         .word      LINK
                           000B8F  2412 LINK = . 
      008C0F 02                    2413         .byte      2
      008C10 23 53                 2414         .ascii     "#S"
      008C12                       2415 DIGS:
      008C12 CD 8C 01         [ 4] 2416 DIGS1:  CALL     DIG
      008C15 CD 84 98         [ 4] 2417         CALL     DUPP
      008C18 CD 83 9C         [ 4] 2418         CALL     QBRAN
      008C1B 8C 1F                 2419         .word      DIGS2
      008C1D 20 F3            [ 2] 2420         JRA     DIGS1
      008C1F 81               [ 4] 2421 DIGS2:  RET
                                   2422 
                                   2423 ;       SIGN    ( n -- )
                                   2424 ;       Add a minus sign to
                                   2425 ;       numeric output string.
      008C20 8C 0F                 2426         .word      LINK
                           000BA2  2427 LINK = . 
      008C22 04                    2428         .byte      4
      008C23 53 49 47 4E           2429         .ascii     "SIGN"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      008C27                       2430 SIGN:
      008C27 CD 84 D1         [ 4] 2431         CALL     ZLESS
      008C2A CD 83 9C         [ 4] 2432         CALL     QBRAN
      008C2D 8C 37                 2433         .word      SIGN1
      008C2F CD 83 69         [ 4] 2434         CALL     DOLIT
      008C32 00 2D                 2435         .word      45	;"-"
      008C34 CC 8B E8         [ 2] 2436         JP     HOLD
      008C37 81               [ 4] 2437 SIGN1:  RET
                                   2438 
                                   2439 ;       #>      ( w -- b u )
                                   2440 ;       Prepare output string.
      008C38 8C 22                 2441         .word      LINK
                           000BBA  2442 LINK = . 
      008C3A 02                    2443         .byte      2
      008C3B 23 3E                 2444         .ascii     "#>"
      008C3D                       2445 EDIGS:
      008C3D CD 84 8E         [ 4] 2446         CALL     DROP
      008C40 CD 85 C5         [ 4] 2447         CALL     HLD
      008C43 CD 83 F1         [ 4] 2448         CALL     AT
      008C46 CD 8A CB         [ 4] 2449         CALL     PAD
      008C49 CD 84 C2         [ 4] 2450         CALL     OVER
      008C4C CC 86 DE         [ 2] 2451         JP     SUBB
                                   2452 
                                   2453 ;       str     ( w -- b u )
                                   2454 ;       Convert a signed integer
                                   2455 ;       to a numeric string.
      008C4F 8C 3A                 2456         .word      LINK
                           000BD1  2457 LINK = . 
      008C51 03                    2458         .byte      3
      008C52 53 54 52              2459         .ascii     "STR"
      008C55                       2460 STR:
      008C55 CD 84 98         [ 4] 2461         CALL     DUPP
      008C58 CD 84 61         [ 4] 2462         CALL     TOR
      008C5B CD 86 F8         [ 4] 2463         CALL     ABSS
      008C5E CD 8B D8         [ 4] 2464         CALL     BDIGS
      008C61 CD 8C 12         [ 4] 2465         CALL     DIGS
      008C64 CD 84 42         [ 4] 2466         CALL     RFROM
      008C67 CD 8C 27         [ 4] 2467         CALL     SIGN
      008C6A CC 8C 3D         [ 2] 2468         JP     EDIGS
                                   2469 
                                   2470 ;       HEX     ( -- )
                                   2471 ;       Use radix 16 as base for
                                   2472 ;       numeric conversions.
      008C6D 8C 51                 2473         .word      LINK
                           000BEF  2474 LINK = . 
      008C6F 03                    2475         .byte      3
      008C70 48 45 58              2476         .ascii     "HEX"
      008C73                       2477 HEX:
      008C73 CD 83 69         [ 4] 2478         CALL     DOLIT
      008C76 00 10                 2479         .word      16
      008C78 CD 85 55         [ 4] 2480         CALL     BASE
      008C7B CC 83 DA         [ 2] 2481         JP     STORE
                                   2482 
                                   2483 ;       DECIMAL ( -- )
                                   2484 ;       Use radix 10 as base
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



                                   2485 ;       for numeric conversions.
      008C7E 8C 6F                 2486         .word      LINK
                           000C00  2487 LINK = . 
      008C80 07                    2488         .byte      7
      008C81 44 45 43 49 4D 41 4C  2489         .ascii     "DECIMAL"
      008C88                       2490 DECIM:
      008C88 CD 83 69         [ 4] 2491         CALL     DOLIT
      008C8B 00 0A                 2492         .word      10
      008C8D CD 85 55         [ 4] 2493         CALL     BASE
      008C90 CC 83 DA         [ 2] 2494         JP     STORE
                                   2495 
                                   2496 ;; Numeric input, single precision
                                   2497 
                                   2498 ;       DIGIT?  ( c base -- u t )
                                   2499 ;       Convert a character to its numeric
                                   2500 ;       value. A flag indicates success.
      008C93 8C 80                 2501         .word      LINK
                           000C15  2502 LINK = . 
      008C95 06                    2503         .byte       6
      008C96 44 49 47 49 54 3F     2504         .ascii     "DIGIT?"
      008C9C                       2505 DIGTQ:
      008C9C CD 84 61         [ 4] 2506         CALL     TOR
      008C9F CD 83 69         [ 4] 2507         CALL     DOLIT
      008CA2 00 30                 2508         .word     48	; "0"
      008CA4 CD 86 DE         [ 4] 2509         CALL     SUBB
      008CA7 CD 83 69         [ 4] 2510         CALL     DOLIT
      008CAA 00 09                 2511         .word      9
      008CAC CD 84 C2         [ 4] 2512         CALL     OVER
      008CAF CD 87 43         [ 4] 2513         CALL     LESS
      008CB2 CD 83 9C         [ 4] 2514         CALL     QBRAN
      008CB5 8C CD                 2515         .word      DGTQ1
      008CB7 CD 83 69         [ 4] 2516         CALL     DOLIT
      008CBA 00 07                 2517         .word      7
      008CBC CD 86 DE         [ 4] 2518         CALL     SUBB
      008CBF CD 84 98         [ 4] 2519         CALL     DUPP
      008CC2 CD 83 69         [ 4] 2520         CALL     DOLIT
      008CC5 00 0A                 2521         .word      10
      008CC7 CD 87 43         [ 4] 2522         CALL     LESS
      008CCA CD 84 F8         [ 4] 2523         CALL     ORR
      008CCD CD 84 98         [ 4] 2524 DGTQ1:  CALL     DUPP
      008CD0 CD 84 42         [ 4] 2525         CALL     RFROM
      008CD3 CC 87 25         [ 2] 2526         JP     ULESS
                                   2527 
                                   2528 ;       NUMBER? ( a -- n T | a F )
                                   2529 ;       Convert a number string to
                                   2530 ;       integer. Push a flag on tos.
      008CD6 8C 95                 2531         .word      LINK
                           000C58  2532 LINK = . 
      008CD8 07                    2533         .byte      7
      008CD9 4E 55 4D 42 45 52 3F  2534         .ascii     "NUMBER?"
      008CE0                       2535 NUMBQ:
      008CE0 CD 85 55         [ 4] 2536         CALL     BASE
      008CE3 CD 83 F1         [ 4] 2537         CALL     AT
      008CE6 CD 84 61         [ 4] 2538         CALL     TOR
      008CE9 CD 89 CB         [ 4] 2539         CALL     ZERO
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



      008CEC CD 84 C2         [ 4] 2540         CALL     OVER
      008CEF CD 8A A3         [ 4] 2541         CALL     COUNT
      008CF2 CD 84 C2         [ 4] 2542         CALL     OVER
      008CF5 CD 84 0F         [ 4] 2543         CALL     CAT
      008CF8 CD 83 69         [ 4] 2544         CALL     DOLIT
      008CFB 00 24                 2545         .word     36	; "0x"
      008CFD CD 87 06         [ 4] 2546         CALL     EQUAL
      008D00 CD 83 9C         [ 4] 2547         CALL     QBRAN
      008D03 8D 14                 2548         .word      NUMQ1
      008D05 CD 8C 73         [ 4] 2549         CALL     HEX
      008D08 CD 84 A8         [ 4] 2550         CALL     SWAPP
      008D0B CD 89 5F         [ 4] 2551         CALL     ONEP
      008D0E CD 84 A8         [ 4] 2552         CALL     SWAPP
      008D11 CD 89 6C         [ 4] 2553         CALL     ONEM
      008D14 CD 84 C2         [ 4] 2554 NUMQ1:  CALL     OVER
      008D17 CD 84 0F         [ 4] 2555         CALL     CAT
      008D1A CD 83 69         [ 4] 2556         CALL     DOLIT
      008D1D 00 2D                 2557         .word     45	; "-"
      008D1F CD 87 06         [ 4] 2558         CALL     EQUAL
      008D22 CD 84 61         [ 4] 2559         CALL     TOR
      008D25 CD 84 A8         [ 4] 2560         CALL     SWAPP
      008D28 CD 84 55         [ 4] 2561         CALL     RAT
      008D2B CD 86 DE         [ 4] 2562         CALL     SUBB
      008D2E CD 84 A8         [ 4] 2563         CALL     SWAPP
      008D31 CD 84 55         [ 4] 2564         CALL     RAT
      008D34 CD 86 80         [ 4] 2565         CALL     PLUS
      008D37 CD 86 2F         [ 4] 2566         CALL     QDUP
      008D3A CD 83 9C         [ 4] 2567         CALL     QBRAN
      008D3D 8D 9E                 2568         .word      NUMQ6
      008D3F CD 89 6C         [ 4] 2569         CALL     ONEM
      008D42 CD 84 61         [ 4] 2570         CALL     TOR
      008D45 CD 84 98         [ 4] 2571 NUMQ2:  CALL     DUPP
      008D48 CD 84 61         [ 4] 2572         CALL     TOR
      008D4B CD 84 0F         [ 4] 2573         CALL     CAT
      008D4E CD 85 55         [ 4] 2574         CALL     BASE
      008D51 CD 83 F1         [ 4] 2575         CALL     AT
      008D54 CD 8C 9C         [ 4] 2576         CALL     DIGTQ
      008D57 CD 83 9C         [ 4] 2577         CALL     QBRAN
      008D5A 8D 8C                 2578         .word      NUMQ4
      008D5C CD 84 A8         [ 4] 2579         CALL     SWAPP
      008D5F CD 85 55         [ 4] 2580         CALL     BASE
      008D62 CD 83 F1         [ 4] 2581         CALL     AT
      008D65 CD 88 DE         [ 4] 2582         CALL     STAR
      008D68 CD 86 80         [ 4] 2583         CALL     PLUS
      008D6B CD 84 42         [ 4] 2584         CALL     RFROM
      008D6E CD 89 5F         [ 4] 2585         CALL     ONEP
      008D71 CD 83 7D         [ 4] 2586         CALL     DONXT
      008D74 8D 45                 2587         .word      NUMQ2
      008D76 CD 84 55         [ 4] 2588         CALL     RAT
      008D79 CD 84 A8         [ 4] 2589         CALL     SWAPP
      008D7C CD 84 8E         [ 4] 2590         CALL     DROP
      008D7F CD 83 9C         [ 4] 2591         CALL     QBRAN
      008D82 8D 87                 2592         .word      NUMQ3
      008D84 CD 86 AB         [ 4] 2593         CALL     NEGAT
      008D87 CD 84 A8         [ 4] 2594 NUMQ3:  CALL     SWAPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      008D8A 20 0F            [ 2] 2595         JRA     NUMQ5
      008D8C CD 84 42         [ 4] 2596 NUMQ4:  CALL     RFROM
      008D8F CD 84 42         [ 4] 2597         CALL     RFROM
      008D92 CD 86 60         [ 4] 2598         CALL     DDROP
      008D95 CD 86 60         [ 4] 2599         CALL     DDROP
      008D98 CD 89 CB         [ 4] 2600         CALL     ZERO
      008D9B CD 84 98         [ 4] 2601 NUMQ5:  CALL     DUPP
      008D9E CD 84 42         [ 4] 2602 NUMQ6:  CALL     RFROM
      008DA1 CD 86 60         [ 4] 2603         CALL     DDROP
      008DA4 CD 84 42         [ 4] 2604         CALL     RFROM
      008DA7 CD 85 55         [ 4] 2605         CALL     BASE
      008DAA CC 83 DA         [ 2] 2606         JP     STORE
                                   2607 
                                   2608 ;; Basic I/O
                                   2609 
                                   2610 ;       KEY     ( -- c )
                                   2611 ;       Wait for and return an
                                   2612 ;       input character.
      008DAD 8C D8                 2613         .word      LINK
                           000D2F  2614 LINK = . 
      008DAF 03                    2615         .byte      3
      008DB0 4B 45 59              2616         .ascii     "KEY"
      008DB3                       2617 KEY:
                           000001  2618 .if CONVERT_TO_CODE
      008DB3 72 0B 52 30 FB   [ 2] 2619         btjf UART1_SR,#UART_SR_RXNE,. 
      008DB8 C6 52 31         [ 1] 2620         ld a,UART1_DR 
      008DBB 1D 00 02         [ 2] 2621         subw x,#CELLL 
      008DBE E7 01            [ 1] 2622         ld (1,x),a 
      008DC0 7F               [ 1] 2623         clr (x)
      008DC1 81               [ 4] 2624         ret 
                           000000  2625 .else 
                                   2626 KEY1:   CALL     QKEY
                                   2627         CALL     QBRAN
                                   2628         .word      KEY1
                                   2629         RET
                                   2630 .endif 
                                   2631 
                                   2632 ;       NUF?    ( -- t )
                                   2633 ;       Return false if no input,
                                   2634 ;       else pause and if CR return true.
      008DC2 8D AF                 2635         .word      LINK
                           000D44  2636 LINK = . 
      008DC4 04                    2637         .byte      4
      008DC5 4E 55 46 3F           2638         .ascii     "NUF?"
      008DC9                       2639 NUFQ:
      008DC9 CD 83 35         [ 4] 2640         CALL     QKEY
      008DCC CD 84 98         [ 4] 2641         CALL     DUPP
      008DCF CD 83 9C         [ 4] 2642         CALL     QBRAN
      008DD2 8D E2                 2643         .word    NUFQ1
      008DD4 CD 86 60         [ 4] 2644         CALL     DDROP
      008DD7 CD 8D B3         [ 4] 2645         CALL     KEY
      008DDA CD 83 69         [ 4] 2646         CALL     DOLIT
      008DDD 00 0D                 2647         .word      CRR
      008DDF CC 87 06         [ 2] 2648         JP     EQUAL
      008DE2 81               [ 4] 2649 NUFQ1:  RET
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



                                   2650 
                                   2651 ;       SPACE   ( -- )
                                   2652 ;       Send  blank character to
                                   2653 ;       output device.
      008DE3 8D C4                 2654         .word      LINK
                           000D65  2655 LINK = . 
      008DE5 05                    2656         .byte      5
      008DE6 53 50 41 43 45        2657         .ascii     "SPACE"
      008DEB                       2658 SPACE:
      008DEB CD 89 BE         [ 4] 2659         CALL     BLANK
      008DEE CC 83 53         [ 2] 2660         JP     EMIT
                                   2661 
                                   2662 ;       SPACES  ( +n -- )
                                   2663 ;       Send n spaces to output device.
      008DF1 8D E5                 2664         .word      LINK
                           000D73  2665 LINK = . 
      008DF3 06                    2666         .byte      6
      008DF4 53 50 41 43 45 53     2667         .ascii     "SPACES"
      008DFA                       2668 SPACS:
      008DFA CD 89 CB         [ 4] 2669         CALL     ZERO
      008DFD CD 87 63         [ 4] 2670         CALL     MAX
      008E00 CD 84 61         [ 4] 2671         CALL     TOR
      008E03 20 03            [ 2] 2672         JRA      CHAR2
      008E05 CD 8D EB         [ 4] 2673 CHAR1:  CALL     SPACE
      008E08 CD 83 7D         [ 4] 2674 CHAR2:  CALL     DONXT
      008E0B 8E 05                 2675         .word    CHAR1
      008E0D 81               [ 4] 2676         RET
                                   2677 
                                   2678 ;       TYPE    ( b u -- )
                                   2679 ;       Output u characters from b.
      008E0E 8D F3                 2680         .word      LINK
                           000D90  2681 LINK = . 
      008E10 04                    2682         .byte      4
      008E11 54 59 50 45           2683         .ascii     "TYPE"
      008E15                       2684 TYPES:
      008E15 CD 84 61         [ 4] 2685         CALL     TOR
      008E18 20 0C            [ 2] 2686         JRA     TYPE2
      008E1A CD 84 98         [ 4] 2687 TYPE1:  CALL     DUPP
      008E1D CD 84 0F         [ 4] 2688         CALL     CAT
      008E20 CD 83 53         [ 4] 2689         CALL     EMIT
      008E23 CD 89 5F         [ 4] 2690         CALL     ONEP
      008E26 CD 83 7D         [ 4] 2691 TYPE2:  CALL     DONXT
      008E29 8E 1A                 2692         .word      TYPE1
      008E2B CC 84 8E         [ 2] 2693         JP     DROP
                                   2694 
                                   2695 ;       CR      ( -- )
                                   2696 ;       Output a carriage return
                                   2697 ;       and a line feed.
      008E2E 8E 10                 2698         .word      LINK
                           000DB0  2699 LINK = . 
      008E30 02                    2700         .byte      2
      008E31 43 52                 2701         .ascii     "CR"
      008E33                       2702 CR:
      008E33 CD 83 69         [ 4] 2703         CALL     DOLIT
      008E36 00 0D                 2704         .word      CRR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



      008E38 CD 83 53         [ 4] 2705         CALL     EMIT
      008E3B CD 83 69         [ 4] 2706         CALL     DOLIT
      008E3E 00 0A                 2707         .word      LF
      008E40 CC 83 53         [ 2] 2708         JP     EMIT
                                   2709 
                                   2710 ;       do$     ( -- a )
                                   2711 ;       Return  address of a compiled
                                   2712 ;       string.
      008E43 8E 30                 2713         .word      LINK
                           000DC5  2714 LINK = . 
      008E45 43                    2715 	.byte      COMPO+3
      008E46 44 4F 24              2716         .ascii     "DO$"
      008E49                       2717 DOSTR:
      008E49 CD 84 42         [ 4] 2718         CALL     RFROM
      008E4C CD 84 55         [ 4] 2719         CALL     RAT
      008E4F CD 84 42         [ 4] 2720         CALL     RFROM
      008E52 CD 8A A3         [ 4] 2721         CALL     COUNT
      008E55 CD 86 80         [ 4] 2722         CALL     PLUS
      008E58 CD 84 61         [ 4] 2723         CALL     TOR
      008E5B CD 84 A8         [ 4] 2724         CALL     SWAPP
      008E5E CD 84 61         [ 4] 2725         CALL     TOR
      008E61 81               [ 4] 2726         RET
                                   2727 
                                   2728 ;       $"|     ( -- a )
                                   2729 ;       Run time routine compiled by $".
                                   2730 ;       Return address of a compiled string.
      008E62 8E 45                 2731         .word      LINK
                           000DE4  2732 LINK = . 
      008E64 43                    2733 	.byte      COMPO+3
      008E65 24 22 7C              2734         .byte     '$','"','|'
      008E68                       2735 STRQP:
      008E68 CD 8E 49         [ 4] 2736         CALL     DOSTR
      008E6B 81               [ 4] 2737         RET
                                   2738 
                                   2739 ;       ."|     ( -- )
                                   2740 ;       Run time routine of ." .
                                   2741 ;       Output a compiled string.
      008E6C 8E 64                 2742         .word      LINK
                           000DEE  2743 LINK = . 
      008E6E 43                    2744 	.byte      COMPO+3
      008E6F 2E 22 7C              2745         .byte     '.','"','|'
      008E72                       2746 DOTQP:
      008E72 CD 8E 49         [ 4] 2747         CALL     DOSTR
      008E75 CD 8A A3         [ 4] 2748         CALL     COUNT
      008E78 CC 8E 15         [ 2] 2749         JP     TYPES
                                   2750 
                                   2751 ;       .R      ( n +n -- )
                                   2752 ;       Display an integer in a field
                                   2753 ;       of n columns, right justified.
      008E7B 8E 6E                 2754         .word      LINK
                           000DFD  2755 LINK = . 
      008E7D 02                    2756         .byte      2
      008E7E 2E 52                 2757         .ascii     ".R"
      008E80                       2758 DOTR:
      008E80 CD 84 61         [ 4] 2759         CALL     TOR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



      008E83 CD 8C 55         [ 4] 2760         CALL     STR
      008E86 CD 84 42         [ 4] 2761         CALL     RFROM
      008E89 CD 84 C2         [ 4] 2762         CALL     OVER
      008E8C CD 86 DE         [ 4] 2763         CALL     SUBB
      008E8F CD 8D FA         [ 4] 2764         CALL     SPACS
      008E92 CC 8E 15         [ 2] 2765         JP     TYPES
                                   2766 
                                   2767 ;       U.R     ( u +n -- )
                                   2768 ;       Display an unsigned integer
                                   2769 ;       in n column, right justified.
      008E95 8E 7D                 2770         .word      LINK
                           000E17  2771 LINK = . 
      008E97 03                    2772         .byte      3
      008E98 55 2E 52              2773         .ascii     "U.R"
      008E9B                       2774 UDOTR:
      008E9B CD 84 61         [ 4] 2775         CALL     TOR
      008E9E CD 8B D8         [ 4] 2776         CALL     BDIGS
      008EA1 CD 8C 12         [ 4] 2777         CALL     DIGS
      008EA4 CD 8C 3D         [ 4] 2778         CALL     EDIGS
      008EA7 CD 84 42         [ 4] 2779         CALL     RFROM
      008EAA CD 84 C2         [ 4] 2780         CALL     OVER
      008EAD CD 86 DE         [ 4] 2781         CALL     SUBB
      008EB0 CD 8D FA         [ 4] 2782         CALL     SPACS
      008EB3 CC 8E 15         [ 2] 2783         JP     TYPES
                                   2784 
                                   2785 ;       U.      ( u -- )
                                   2786 ;       Display an unsigned integer
                                   2787 ;       in free format.
      008EB6 8E 97                 2788         .word      LINK
                           000E38  2789 LINK = . 
      008EB8 02                    2790         .byte      2
      008EB9 55 2E                 2791         .ascii     "U."
      008EBB                       2792 UDOT:
      008EBB CD 8B D8         [ 4] 2793         CALL     BDIGS
      008EBE CD 8C 12         [ 4] 2794         CALL     DIGS
      008EC1 CD 8C 3D         [ 4] 2795         CALL     EDIGS
      008EC4 CD 8D EB         [ 4] 2796         CALL     SPACE
      008EC7 CC 8E 15         [ 2] 2797         JP     TYPES
                                   2798 
                                   2799 ;       .       ( w -- )
                                   2800 ;       Display an integer in free
                                   2801 ;       format, preceeded by a space.
      008ECA 8E B8                 2802         .word      LINK
                           000E4C  2803 LINK = . 
      008ECC 01                    2804         .byte      1
      008ECD 2E                    2805         .ascii     "."
      008ECE                       2806 DOT:
      008ECE CD 85 55         [ 4] 2807         CALL     BASE
      008ED1 CD 83 F1         [ 4] 2808         CALL     AT
      008ED4 CD 83 69         [ 4] 2809         CALL     DOLIT
      008ED7 00 0A                 2810         .word      10
      008ED9 CD 85 0D         [ 4] 2811         CALL     XORR    ;?decimal
      008EDC CD 83 9C         [ 4] 2812         CALL     QBRAN
      008EDF 8E E4                 2813         .word      DOT1
      008EE1 CC 8E BB         [ 2] 2814         JP     UDOT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



      008EE4 CD 8C 55         [ 4] 2815 DOT1:   CALL     STR
      008EE7 CD 8D EB         [ 4] 2816         CALL     SPACE
      008EEA CC 8E 15         [ 2] 2817         JP     TYPES
                                   2818 
                                   2819 ;       ?       ( a -- )
                                   2820 ;       Display contents in memory cell.
      008EED 8E CC                 2821         .word      LINK
                                   2822         
                           000E6F  2823 LINK = . 
      008EEF 01                    2824         .byte      1
      008EF0 3F                    2825         .ascii     "?"
      008EF1                       2826 QUEST:
      008EF1 CD 83 F1         [ 4] 2827         CALL     AT
      008EF4 CC 8E CE         [ 2] 2828         JP     DOT
                                   2829 
                                   2830 ;; Parsing
                                   2831 
                                   2832 ;       parse   ( b u c -- b u delta ; <string> )
                                   2833 ;       Scan string delimited by c.
                                   2834 ;       Return found string and its offset.
      008EF7 8E EF                 2835         .word      LINK
                           000E79  2836 LINK = . 
      008EF9 05                    2837         .byte      5
      008EFA 70 61 72 73 65        2838         .ascii     "parse"
      008EFF                       2839 PARS:
      008EFF CD 85 64         [ 4] 2840         CALL     TEMP
      008F02 CD 83 DA         [ 4] 2841         CALL     STORE
      008F05 CD 84 C2         [ 4] 2842         CALL     OVER
      008F08 CD 84 61         [ 4] 2843         CALL     TOR
      008F0B CD 84 98         [ 4] 2844         CALL     DUPP
      008F0E CD 83 9C         [ 4] 2845         CALL     QBRAN
      008F11 8F B7                 2846         .word    PARS8
      008F13 CD 89 6C         [ 4] 2847         CALL     ONEM
      008F16 CD 85 64         [ 4] 2848         CALL     TEMP
      008F19 CD 83 F1         [ 4] 2849         CALL     AT
      008F1C CD 89 BE         [ 4] 2850         CALL     BLANK
      008F1F CD 87 06         [ 4] 2851         CALL     EQUAL
      008F22 CD 83 9C         [ 4] 2852         CALL     QBRAN
      008F25 8F 58                 2853         .word      PARS3
      008F27 CD 84 61         [ 4] 2854         CALL     TOR
      008F2A CD 89 BE         [ 4] 2855 PARS1:  CALL     BLANK
      008F2D CD 84 C2         [ 4] 2856         CALL     OVER
      008F30 CD 84 0F         [ 4] 2857         CALL     CAT     ;skip leading blanks ONLY
      008F33 CD 86 DE         [ 4] 2858         CALL     SUBB
      008F36 CD 84 D1         [ 4] 2859         CALL     ZLESS
      008F39 CD 86 9A         [ 4] 2860         CALL     INVER
      008F3C CD 83 9C         [ 4] 2861         CALL     QBRAN
      008F3F 8F 55                 2862         .word      PARS2
      008F41 CD 89 5F         [ 4] 2863         CALL     ONEP
      008F44 CD 83 7D         [ 4] 2864         CALL     DONXT
      008F47 8F 2A                 2865         .word      PARS1
      008F49 CD 84 42         [ 4] 2866         CALL     RFROM
      008F4C CD 84 8E         [ 4] 2867         CALL     DROP
      008F4F CD 89 CB         [ 4] 2868         CALL     ZERO
      008F52 CC 84 98         [ 2] 2869         JP     DUPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



      008F55 CD 84 42         [ 4] 2870 PARS2:  CALL     RFROM
      008F58 CD 84 C2         [ 4] 2871 PARS3:  CALL     OVER
      008F5B CD 84 A8         [ 4] 2872         CALL     SWAPP
      008F5E CD 84 61         [ 4] 2873         CALL     TOR
      008F61 CD 85 64         [ 4] 2874 PARS4:  CALL     TEMP
      008F64 CD 83 F1         [ 4] 2875         CALL     AT
      008F67 CD 84 C2         [ 4] 2876         CALL     OVER
      008F6A CD 84 0F         [ 4] 2877         CALL     CAT
      008F6D CD 86 DE         [ 4] 2878         CALL     SUBB    ;scan for delimiter
      008F70 CD 85 64         [ 4] 2879         CALL     TEMP
      008F73 CD 83 F1         [ 4] 2880         CALL     AT
      008F76 CD 89 BE         [ 4] 2881         CALL     BLANK
      008F79 CD 87 06         [ 4] 2882         CALL     EQUAL
      008F7C CD 83 9C         [ 4] 2883         CALL     QBRAN
      008F7F 8F 84                 2884         .word      PARS5
      008F81 CD 84 D1         [ 4] 2885         CALL     ZLESS
      008F84 CD 83 9C         [ 4] 2886 PARS5:  CALL     QBRAN
      008F87 8F 99                 2887         .word      PARS6
      008F89 CD 89 5F         [ 4] 2888         CALL     ONEP
      008F8C CD 83 7D         [ 4] 2889         CALL     DONXT
      008F8F 8F 61                 2890         .word      PARS4
      008F91 CD 84 98         [ 4] 2891         CALL     DUPP
      008F94 CD 84 61         [ 4] 2892         CALL     TOR
      008F97 20 0F            [ 2] 2893         JRA     PARS7
      008F99 CD 84 42         [ 4] 2894 PARS6:  CALL     RFROM
      008F9C CD 84 8E         [ 4] 2895         CALL     DROP
      008F9F CD 84 98         [ 4] 2896         CALL     DUPP
      008FA2 CD 89 5F         [ 4] 2897         CALL     ONEP
      008FA5 CD 84 61         [ 4] 2898         CALL     TOR
      008FA8 CD 84 C2         [ 4] 2899 PARS7:  CALL     OVER
      008FAB CD 86 DE         [ 4] 2900         CALL     SUBB
      008FAE CD 84 42         [ 4] 2901         CALL     RFROM
      008FB1 CD 84 42         [ 4] 2902         CALL     RFROM
      008FB4 CC 86 DE         [ 2] 2903         JP     SUBB
      008FB7 CD 84 C2         [ 4] 2904 PARS8:  CALL     OVER
      008FBA CD 84 42         [ 4] 2905         CALL     RFROM
      008FBD CC 86 DE         [ 2] 2906         JP     SUBB
                                   2907 
                                   2908 ;       PARSE   ( c -- b u ; <string> )
                                   2909 ;       Scan input stream and return
                                   2910 ;       counted string delimited by c.
      008FC0 8E F9                 2911         .word      LINK
                           000F42  2912 LINK = . 
      008FC2 05                    2913         .byte      5
      008FC3 50 41 52 53 45        2914         .ascii     "PARSE"
      008FC8                       2915 PARSE:
      008FC8 CD 84 61         [ 4] 2916         CALL     TOR
      008FCB CD 8A DC         [ 4] 2917         CALL     TIB
      008FCE CD 85 73         [ 4] 2918         CALL     INN
      008FD1 CD 83 F1         [ 4] 2919         CALL     AT
      008FD4 CD 86 80         [ 4] 2920         CALL     PLUS    ;current input buffer pointer
      008FD7 CD 85 83         [ 4] 2921         CALL     NTIB
      008FDA CD 83 F1         [ 4] 2922         CALL     AT
      008FDD CD 85 73         [ 4] 2923         CALL     INN
      008FE0 CD 83 F1         [ 4] 2924         CALL     AT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      008FE3 CD 86 DE         [ 4] 2925         CALL     SUBB    ;remaining count
      008FE6 CD 84 42         [ 4] 2926         CALL     RFROM
      008FE9 CD 8E FF         [ 4] 2927         CALL     PARS
      008FEC CD 85 73         [ 4] 2928         CALL     INN
      008FEF CC 8A 3C         [ 2] 2929         JP     PSTOR
                                   2930 
                                   2931 ;       .(      ( -- )
                                   2932 ;       Output following string up to next ) .
      008FF2 8F C2                 2933         .word      LINK
                           000F74  2934 LINK = . 
      008FF4 82                    2935 	.byte      IMEDD+2
      008FF5 2E 28                 2936         .ascii     ".("
      008FF7                       2937 DOTPR:
      008FF7 CD 83 69         [ 4] 2938         CALL     DOLIT
      008FFA 00 29                 2939         .word     41	; ")"
      008FFC CD 8F C8         [ 4] 2940         CALL     PARSE
      008FFF CC 8E 15         [ 2] 2941         JP     TYPES
                                   2942 
                                   2943 ;       (       ( -- )
                                   2944 ;       Ignore following string up to next ).
                                   2945 ;       A comment.
      009002 8F F4                 2946         .word      LINK
                           000F84  2947 LINK = . 
      009004 81                    2948 	.byte      IMEDD+1
      009005 28                    2949         .ascii     "("
      009006                       2950 PAREN:
      009006 CD 83 69         [ 4] 2951         CALL     DOLIT
      009009 00 29                 2952         .word     41	; ")"
      00900B CD 8F C8         [ 4] 2953         CALL     PARSE
      00900E CC 86 60         [ 2] 2954         JP     DDROP
                                   2955 
                                   2956 ;       \       ( -- )
                                   2957 ;       Ignore following text till
                                   2958 ;       end of line.
      009011 90 04                 2959         .word      LINK
                           000F93  2960 LINK = . 
      009013 81                    2961 	.byte      IMEDD+1
      009014 5C                    2962         .ascii     "\"
      009015                       2963 BKSLA:
                           000001  2964 .if CONVERT_TO_CODE
      009015 90 AE 00 0C      [ 2] 2965         ldw y,#UCTIB ; #TIB  
      009019 90 FE            [ 2] 2966         ldw y,(y)
      00901B 90 89            [ 2] 2967         pushw y ; count in TIB 
      00901D 90 AE 00 0A      [ 2] 2968         ldw y,#UINN ; >IN 
      009021 90 BF 22         [ 2] 2969         ldw YTEMP,y
      009024 90 85            [ 2] 2970         popw y 
      009026 91 CF 22         [ 5] 2971         ldw [YTEMP],y
      009029 81               [ 4] 2972         ret 
                           000000  2973 .else
                                   2974         CALL     NTIB
                                   2975         CALL     AT
                                   2976         CALL     INN
                                   2977         JP     STORE
                                   2978 .endif 
                                   2979 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



                                   2980 ;       WORD    ( c -- a ; <string> )
                                   2981 ;       Parse a word from input stream
                                   2982 ;       and copy it to code dictionary.
      00902A 90 13                 2983         .word      LINK
                           000FAC  2984 LINK = . 
      00902C 04                    2985         .byte      4
      00902D 57 4F 52 44           2986         .ascii     "WORD"
      009031                       2987 WORDD:
      009031 CD 8F C8         [ 4] 2988         CALL     PARSE
      009034 CD 8A BA         [ 4] 2989         CALL     HERE
      009037 CD 89 34         [ 4] 2990         CALL     CELLP
      00903A CC 8B 7B         [ 2] 2991         JP     PACKS
                                   2992 
                                   2993 ;       TOKEN   ( -- a ; <string> )
                                   2994 ;       Parse a word from input stream
                                   2995 ;       and copy it to name dictionary.
      00903D 90 2C                 2996         .word      LINK
                           000FBF  2997 LINK = . 
      00903F 05                    2998         .byte      5
      009040 54 4F 4B 45 4E        2999         .ascii     "TOKEN"
      009045                       3000 TOKEN:
      009045 CD 89 BE         [ 4] 3001         CALL     BLANK
      009048 CC 90 31         [ 2] 3002         JP     WORDD
                                   3003 
                                   3004 ;; Dictionary search
                                   3005 
                                   3006 ;       NAME>   ( na -- ca )
                                   3007 ;       Return a code address given
                                   3008 ;       a name address.
      00904B 90 3F                 3009         .word      LINK
                           000FCD  3010 LINK = . 
      00904D 05                    3011         .byte      5
      00904E 4E 41 4D 45 3E        3012         .ascii     "NAME>"
      009053                       3013 NAMET:
      009053 CD 8A A3         [ 4] 3014         CALL     COUNT
      009056 CD 83 69         [ 4] 3015         CALL     DOLIT
      009059 00 1F                 3016         .word      31
      00905B CD 84 E4         [ 4] 3017         CALL     ANDD
      00905E CC 86 80         [ 2] 3018         JP     PLUS
                                   3019 
                                   3020 ;       SAME?   ( a a u -- a a f \ -0+ )
                                   3021 ;       Compare u cells in two
                                   3022 ;       strings. Return 0 if identical.
      009061 90 4D                 3023         .word      LINK
                           000FE3  3024 LINK = . 
      009063 05                    3025         .byte       5
      009064 53 41 4D 45 3F        3026         .ascii     "SAME?"
      009069                       3027 SAMEQ:
      009069 CD 89 6C         [ 4] 3028         CALL     ONEM
      00906C CD 84 61         [ 4] 3029         CALL     TOR
      00906F 20 29            [ 2] 3030         JRA     SAME2
      009071 CD 84 C2         [ 4] 3031 SAME1:  CALL     OVER
      009074 CD 84 55         [ 4] 3032         CALL     RAT
      009077 CD 86 80         [ 4] 3033         CALL     PLUS
      00907A CD 84 0F         [ 4] 3034         CALL     CAT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      00907D CD 84 C2         [ 4] 3035         CALL     OVER
      009080 CD 84 55         [ 4] 3036         CALL     RAT
      009083 CD 86 80         [ 4] 3037         CALL     PLUS
      009086 CD 84 0F         [ 4] 3038         CALL     CAT
      009089 CD 86 DE         [ 4] 3039         CALL     SUBB
      00908C CD 86 2F         [ 4] 3040         CALL     QDUP
      00908F CD 83 9C         [ 4] 3041         CALL     QBRAN
      009092 90 9A                 3042         .word      SAME2
      009094 CD 84 42         [ 4] 3043         CALL     RFROM
      009097 CC 84 8E         [ 2] 3044         JP     DROP
      00909A CD 83 7D         [ 4] 3045 SAME2:  CALL     DONXT
      00909D 90 71                 3046         .word      SAME1
      00909F CC 89 CB         [ 2] 3047         JP     ZERO
                                   3048 
                                   3049 ;       find    ( a va -- ca na | a F )
                                   3050 ;       Search vocabulary for string.
                                   3051 ;       Return ca and na if succeeded.
      0090A2 90 63                 3052         .word      LINK
                           001024  3053 LINK = . 
      0090A4 04                    3054         .byte      4
      0090A5 46 49 4E 44           3055         .ascii     "FIND"
      0090A9                       3056 FIND:
      0090A9 CD 84 A8         [ 4] 3057         CALL     SWAPP
      0090AC CD 84 98         [ 4] 3058         CALL     DUPP
      0090AF CD 84 0F         [ 4] 3059         CALL     CAT
      0090B2 CD 85 64         [ 4] 3060         CALL     TEMP
      0090B5 CD 83 DA         [ 4] 3061         CALL     STORE
      0090B8 CD 84 98         [ 4] 3062         CALL     DUPP
      0090BB CD 83 F1         [ 4] 3063         CALL     AT
      0090BE CD 84 61         [ 4] 3064         CALL     TOR
      0090C1 CD 89 34         [ 4] 3065         CALL     CELLP
      0090C4 CD 84 A8         [ 4] 3066         CALL     SWAPP
      0090C7 CD 83 F1         [ 4] 3067 FIND1:  CALL     AT
      0090CA CD 84 98         [ 4] 3068         CALL     DUPP
      0090CD CD 83 9C         [ 4] 3069         CALL     QBRAN
      0090D0 91 06                 3070         .word      FIND6
      0090D2 CD 84 98         [ 4] 3071         CALL     DUPP
      0090D5 CD 83 F1         [ 4] 3072         CALL     AT
      0090D8 CD 83 69         [ 4] 3073         CALL     DOLIT
      0090DB 1F 7F                 3074         .word      MASKK
      0090DD CD 84 E4         [ 4] 3075         CALL     ANDD
      0090E0 CD 84 55         [ 4] 3076         CALL     RAT
      0090E3 CD 85 0D         [ 4] 3077         CALL     XORR
      0090E6 CD 83 9C         [ 4] 3078         CALL     QBRAN
      0090E9 90 F5                 3079         .word      FIND2
      0090EB CD 89 34         [ 4] 3080         CALL     CELLP
      0090EE CD 83 69         [ 4] 3081         CALL     DOLIT
      0090F1 FF FF                 3082         .word     0xFFFF
      0090F3 20 0C            [ 2] 3083         JRA     FIND3
      0090F5 CD 89 34         [ 4] 3084 FIND2:  CALL     CELLP
      0090F8 CD 85 64         [ 4] 3085         CALL     TEMP
      0090FB CD 83 F1         [ 4] 3086         CALL     AT
      0090FE CD 90 69         [ 4] 3087         CALL     SAMEQ
      009101 CD 83 B3         [ 4] 3088 FIND3:  CALL     BRAN
      009104 91 15                 3089         .word      FIND4
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



      009106 CD 84 42         [ 4] 3090 FIND6:  CALL     RFROM
      009109 CD 84 8E         [ 4] 3091         CALL     DROP
      00910C CD 84 A8         [ 4] 3092         CALL     SWAPP
      00910F CD 89 43         [ 4] 3093         CALL     CELLM
      009112 CC 84 A8         [ 2] 3094         JP     SWAPP
      009115 CD 83 9C         [ 4] 3095 FIND4:  CALL     QBRAN
      009118 91 22                 3096         .word      FIND5
      00911A CD 89 43         [ 4] 3097         CALL     CELLM
      00911D CD 89 43         [ 4] 3098         CALL     CELLM
      009120 20 A5            [ 2] 3099         JRA     FIND1
      009122 CD 84 42         [ 4] 3100 FIND5:  CALL     RFROM
      009125 CD 84 8E         [ 4] 3101         CALL     DROP
      009128 CD 84 A8         [ 4] 3102         CALL     SWAPP
      00912B CD 84 8E         [ 4] 3103         CALL     DROP
      00912E CD 89 43         [ 4] 3104         CALL     CELLM
      009131 CD 84 98         [ 4] 3105         CALL     DUPP
      009134 CD 90 53         [ 4] 3106         CALL     NAMET
      009137 CC 84 A8         [ 2] 3107         JP     SWAPP
                                   3108 
                                   3109 ;       NAME?   ( a -- ca na | a F )
                                   3110 ;       Search vocabularies for a string.
      00913A 90 A4                 3111         .word      LINK
                           0010BC  3112 LINK = . 
      00913C 05                    3113         .byte      5
      00913D 4E 41 4D 45 3F        3114         .ascii     "NAME?"
      009142                       3115 NAMEQ:
      009142 CD 85 D8         [ 4] 3116         CALL   CNTXT
      009145 CC 90 A9         [ 2] 3117         JP     FIND
                                   3118 
                                   3119 ;; Terminal response
                                   3120 
                                   3121 ;       ^H      ( bot eot cur -- bot eot cur )
                                   3122 ;       Backup cursor by one character.
      009148 91 3C                 3123         .word      LINK
                           0010CA  3124 LINK = . 
      00914A 02                    3125         .byte      2
      00914B 5E 48                 3126         .ascii     "^H"
      00914D                       3127 BKSP:
      00914D CD 84 61         [ 4] 3128         CALL     TOR
      009150 CD 84 C2         [ 4] 3129         CALL     OVER
      009153 CD 84 42         [ 4] 3130         CALL     RFROM
      009156 CD 84 A8         [ 4] 3131         CALL     SWAPP
      009159 CD 84 C2         [ 4] 3132         CALL     OVER
      00915C CD 85 0D         [ 4] 3133         CALL     XORR
      00915F CD 83 9C         [ 4] 3134         CALL     QBRAN
      009162 91 7D                 3135         .word      BACK1
      009164 CD 83 69         [ 4] 3136         CALL     DOLIT
      009167 00 08                 3137         .word      BKSPP
      009169 CD 83 53         [ 4] 3138         CALL     EMIT
      00916C CD 89 6C         [ 4] 3139         CALL     ONEM
      00916F CD 89 BE         [ 4] 3140         CALL     BLANK
      009172 CD 83 53         [ 4] 3141         CALL     EMIT
      009175 CD 83 69         [ 4] 3142         CALL     DOLIT
      009178 00 08                 3143         .word      BKSPP
      00917A CC 83 53         [ 2] 3144         JP     EMIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      00917D 81               [ 4] 3145 BACK1:  RET
                                   3146 
                                   3147 ;       TAP     ( bot eot cur c -- bot eot cur )
                                   3148 ;       Accept and echo key stroke
                                   3149 ;       and bump cursor.
      00917E 91 4A                 3150         .word      LINK
                           001100  3151 LINK = . 
      009180 03                    3152         .byte      3
      009181 54 41 50              3153         .ascii     "TAP"
      009184                       3154 TAP:
      009184 CD 84 98         [ 4] 3155         CALL     DUPP
      009187 CD 83 53         [ 4] 3156         CALL     EMIT
      00918A CD 84 C2         [ 4] 3157         CALL     OVER
      00918D CD 83 FE         [ 4] 3158         CALL     CSTOR
      009190 CC 89 5F         [ 2] 3159         JP     ONEP
                                   3160 
                                   3161 ;       kTAP    ( bot eot cur c -- bot eot cur )
                                   3162 ;       Process a key stroke,
                                   3163 ;       CR or backspace.
      009193 91 80                 3164         .word      LINK
                           001115  3165 LINK = . 
      009195 04                    3166         .byte      4
      009196 4B 54 41 50           3167         .ascii     "KTAP"
      00919A                       3168 KTAP:
      00919A CD 84 98         [ 4] 3169         CALL     DUPP
      00919D CD 83 69         [ 4] 3170         CALL     DOLIT
      0091A0 00 0D                 3171         .word      CRR
      0091A2 CD 85 0D         [ 4] 3172         CALL     XORR
      0091A5 CD 83 9C         [ 4] 3173         CALL     QBRAN
      0091A8 91 C0                 3174         .word      KTAP2
      0091AA CD 83 69         [ 4] 3175         CALL     DOLIT
      0091AD 00 08                 3176         .word      BKSPP
      0091AF CD 85 0D         [ 4] 3177         CALL     XORR
      0091B2 CD 83 9C         [ 4] 3178         CALL     QBRAN
      0091B5 91 BD                 3179         .word      KTAP1
      0091B7 CD 89 BE         [ 4] 3180         CALL     BLANK
      0091BA CC 91 84         [ 2] 3181         JP     TAP
      0091BD CC 91 4D         [ 2] 3182 KTAP1:  JP     BKSP
      0091C0 CD 84 8E         [ 4] 3183 KTAP2:  CALL     DROP
      0091C3 CD 84 A8         [ 4] 3184         CALL     SWAPP
      0091C6 CD 84 8E         [ 4] 3185         CALL     DROP
      0091C9 CC 84 98         [ 2] 3186         JP     DUPP
                                   3187 
                                   3188 ;       accept  ( b u -- b u )
                                   3189 ;       Accept characters to input
                                   3190 ;       buffer. Return with actual count.
      0091CC 91 95                 3191         .word      LINK
                           00114E  3192 LINK = . 
      0091CE 06                    3193         .byte      6
      0091CF 41 43 43 45 50 54     3194         .ascii     "ACCEPT"
      0091D5                       3195 ACCEP:
      0091D5 CD 84 C2         [ 4] 3196         CALL     OVER
      0091D8 CD 86 80         [ 4] 3197         CALL     PLUS
      0091DB CD 84 C2         [ 4] 3198         CALL     OVER
      0091DE CD 86 6B         [ 4] 3199 ACCP1:  CALL     DDUP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



      0091E1 CD 85 0D         [ 4] 3200         CALL     XORR
      0091E4 CD 83 9C         [ 4] 3201         CALL     QBRAN
      0091E7 92 09                 3202         .word      ACCP4
      0091E9 CD 8D B3         [ 4] 3203         CALL     KEY
      0091EC CD 84 98         [ 4] 3204         CALL     DUPP
      0091EF CD 89 BE         [ 4] 3205         CALL     BLANK
      0091F2 CD 83 69         [ 4] 3206         CALL     DOLIT
      0091F5 00 7F                 3207         .word      127
      0091F7 CD 87 A0         [ 4] 3208         CALL     WITHI
      0091FA CD 83 9C         [ 4] 3209         CALL     QBRAN
      0091FD 92 04                 3210         .word      ACCP2
      0091FF CD 91 84         [ 4] 3211         CALL     TAP
      009202 20 03            [ 2] 3212         JRA     ACCP3
      009204 CD 91 9A         [ 4] 3213 ACCP2:  CALL     KTAP
      009207 20 D5            [ 2] 3214 ACCP3:  JRA     ACCP1
      009209 CD 84 8E         [ 4] 3215 ACCP4:  CALL     DROP
      00920C CD 84 C2         [ 4] 3216         CALL     OVER
      00920F CC 86 DE         [ 2] 3217         JP     SUBB
                                   3218 
                                   3219 ;       QUERY   ( -- )
                                   3220 ;       Accept input stream to
                                   3221 ;       terminal input buffer.
      009212 91 CE                 3222         .word      LINK
                                   3223         
                           001194  3224 LINK = . 
      009214 05                    3225         .byte      5
      009215 51 55 45 52 59        3226         .ascii     "QUERY"
      00921A                       3227 QUERY:
      00921A CD 8A DC         [ 4] 3228         CALL     TIB
      00921D CD 83 69         [ 4] 3229         CALL     DOLIT
      009220 00 50                 3230         .word      80
      009222 CD 91 D5         [ 4] 3231         CALL     ACCEP
      009225 CD 85 83         [ 4] 3232         CALL     NTIB
      009228 CD 83 DA         [ 4] 3233         CALL     STORE
      00922B CD 84 8E         [ 4] 3234         CALL     DROP
      00922E CD 89 CB         [ 4] 3235         CALL     ZERO
      009231 CD 85 73         [ 4] 3236         CALL     INN
      009234 CC 83 DA         [ 2] 3237         JP     STORE
                                   3238 
                                   3239 ;       ABORT   ( -- )
                                   3240 ;       Reset data stack and
                                   3241 ;       jump to QUIT.
      009237 92 14                 3242         .word      LINK
                           0011B9  3243 LINK = . 
      009239 05                    3244         .byte      5
      00923A 41 42 4F 52 54        3245         .ascii     "ABORT"
      00923F                       3246 ABORT:
      00923F CD 93 36         [ 4] 3247         CALL     PRESE
      009242 CC 93 53         [ 2] 3248         JP     QUIT
                                   3249 
                                   3250 ;       abort"  ( f -- )
                                   3251 ;       Run time routine of ABORT".
                                   3252 ;       Abort with a message.
      009245 92 39                 3253         .word      LINK
                           0011C7  3254 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      009247 46                    3255 	.byte      COMPO+6
      009248 41 42 4F 52 54        3256         .ascii     "ABORT"
      00924D 22                    3257         .byte      '"'
      00924E                       3258 ABORQ:
      00924E CD 83 9C         [ 4] 3259         CALL     QBRAN
      009251 92 6D                 3260         .word      ABOR2   ;text flag
      009253 CD 8E 49         [ 4] 3261         CALL     DOSTR
      009256 CD 8D EB         [ 4] 3262 ABOR1:  CALL     SPACE
      009259 CD 8A A3         [ 4] 3263         CALL     COUNT
      00925C CD 8E 15         [ 4] 3264         CALL     TYPES
      00925F CD 83 69         [ 4] 3265         CALL     DOLIT
      009262 00 3F                 3266         .word     63 ; "?"
      009264 CD 83 53         [ 4] 3267         CALL     EMIT
      009267 CD 8E 33         [ 4] 3268         CALL     CR
      00926A CC 92 3F         [ 2] 3269         JP     ABORT   ;pass error string
      00926D CD 8E 49         [ 4] 3270 ABOR2:  CALL     DOSTR
      009270 CC 84 8E         [ 2] 3271         JP     DROP
                                   3272 
                                   3273 ;; The text interpreter
                                   3274 
                                   3275 ;       $INTERPRET      ( a -- )
                                   3276 ;       Interpret a word. If failed,
                                   3277 ;       try to convert it to an integer.
      009273 92 47                 3278         .word      LINK
                           0011F5  3279 LINK = . 
      009275 0A                    3280         .byte      10
      009276 24 49 4E 54 45 52 50  3281         .ascii     "$INTERPRET"
             52 45 54
      009280                       3282 INTER:
      009280 CD 91 42         [ 4] 3283         CALL     NAMEQ
      009283 CD 86 2F         [ 4] 3284         CALL     QDUP    ;?defined
      009286 CD 83 9C         [ 4] 3285         CALL     QBRAN
      009289 92 AA                 3286         .word      INTE1
      00928B CD 83 F1         [ 4] 3287         CALL     AT
      00928E CD 83 69         [ 4] 3288         CALL     DOLIT
      009291 40 00                 3289 	.word       0x4000	; COMPO*256
      009293 CD 84 E4         [ 4] 3290         CALL     ANDD    ;?compile only lexicon bits
      009296 CD 92 4E         [ 4] 3291         CALL     ABORQ
      009299 0D                    3292         .byte      13
      00929A 20 63 6F 6D 70 69 6C  3293         .ascii     " compile only"
             65 20 6F 6E 6C 79
      0092A7 CC 83 C3         [ 2] 3294         JP     EXECU
      0092AA CD 8C E0         [ 4] 3295 INTE1:  CALL     NUMBQ   ;convert a number
      0092AD CD 83 9C         [ 4] 3296         CALL     QBRAN
      0092B0 92 56                 3297         .word    ABOR1
      0092B2 81               [ 4] 3298         RET
                                   3299 
                                   3300 ;       [       ( -- )
                                   3301 ;       Start  text interpreter.
      0092B3 92 75                 3302         .word      LINK
                           001235  3303 LINK = . 
      0092B5 81                    3304 	.byte      IMEDD+1
      0092B6 5B                    3305         .ascii     "["
      0092B7                       3306 LBRAC:
      0092B7 CD 83 69         [ 4] 3307         CALL   DOLIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      0092BA 92 80                 3308         .word  INTER
      0092BC CD 85 B6         [ 4] 3309         CALL   TEVAL
      0092BF CC 83 DA         [ 2] 3310         JP     STORE
                                   3311 
                                   3312 ;       .OK     ( -- )
                                   3313 ;       Display 'ok' while interpreting.
      0092C2 92 B5                 3314         .word      LINK
                           001244  3315 LINK = . 
      0092C4 03                    3316         .byte      3
      0092C5 2E 4F 4B              3317         .ascii     ".OK"
      0092C8                       3318 DOTOK:
      0092C8 CD 83 69         [ 4] 3319         CALL     DOLIT
      0092CB 92 80                 3320         .word      INTER
      0092CD CD 85 B6         [ 4] 3321         CALL     TEVAL
      0092D0 CD 83 F1         [ 4] 3322         CALL     AT
      0092D3 CD 87 06         [ 4] 3323         CALL     EQUAL
      0092D6 CD 83 9C         [ 4] 3324         CALL     QBRAN
      0092D9 92 E2                 3325         .word      DOTO1
      0092DB CD 8E 72         [ 4] 3326         CALL     DOTQP
      0092DE 03                    3327         .byte      3
      0092DF 20 6F 6B              3328         .ascii     " ok"
      0092E2 CC 8E 33         [ 2] 3329 DOTO1:  JP     CR
                                   3330 
                                   3331 ;       ?STACK  ( -- )
                                   3332 ;       Abort if stack underflows.
      0092E5 92 C4                 3333         .word      LINK
                           001267  3334 LINK = . 
      0092E7 06                    3335         .byte      6
      0092E8 3F 53 54 41 43 4B     3336         .ascii     "?STACK"
      0092EE                       3337 QSTAC: 
      0092EE CD 8A 0E         [ 4] 3338         CALL     DEPTH
      0092F1 CD 84 D1         [ 4] 3339         CALL     ZLESS   ;check only for underflow
      0092F4 CD 92 4E         [ 4] 3340         CALL     ABORQ
      0092F7 0B                    3341         .byte      11
      0092F8 20 75 6E 64 65 72 66  3342         .ascii     " underflow "
             6C 6F 77 20
      009303 81               [ 4] 3343         RET
                                   3344 
                                   3345 ;       EVAL    ( -- )
                                   3346 ;       Interpret  input stream.
      009304 92 E7                 3347         .word      LINK
                           001286  3348 LINK = . 
      009306 04                    3349         .byte      4
      009307 45 56 41 4C           3350         .ascii     "EVAL"
      00930B                       3351 EVAL:
      00930B CD 90 45         [ 4] 3352 EVAL1:  CALL     TOKEN
      00930E CD 84 98         [ 4] 3353         CALL     DUPP
      009311 CD 84 0F         [ 4] 3354         CALL     CAT     ;?input stream empty
      009314 CD 83 9C         [ 4] 3355         CALL     QBRAN
      009317 93 27                 3356         .word    EVAL2
      009319 CD 85 B6         [ 4] 3357         CALL     TEVAL
      00931C CD 8A F0         [ 4] 3358         CALL     ATEXE
      00931F CD 92 EE         [ 4] 3359         CALL     QSTAC   ;evaluate input, check stack
      009322 CD 83 B3         [ 4] 3360         CALL     BRAN
      009325 93 0B                 3361         .word    EVAL1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      009327 CD 84 8E         [ 4] 3362 EVAL2:  CALL     DROP
      00932A CC 92 C8         [ 2] 3363         JP       DOTOK
                                   3364 
                                   3365 ;       PRESET  ( -- )
                                   3366 ;       Reset data stack pointer and
                                   3367 ;       terminal input buffer.
      00932D 93 06                 3368         .word      LINK
                           0012AF  3369 LINK = . 
      00932F 06                    3370         .byte      6
      009330 50 52 45 53 45 54     3371         .ascii     "PRESET"
      009336                       3372 PRESE:
      009336 CD 83 69         [ 4] 3373         CALL     DOLIT
      009339 16 70                 3374         .word      SPP
      00933B CD 84 85         [ 4] 3375         CALL     SPSTO
      00933E CD 83 69         [ 4] 3376         CALL     DOLIT
      009341 17 00                 3377         .word      TIBB
      009343 CD 85 83         [ 4] 3378         CALL     NTIB
      009346 CD 89 34         [ 4] 3379         CALL     CELLP
      009349 CC 83 DA         [ 2] 3380         JP     STORE
                                   3381 
                                   3382 ;       QUIT    ( -- )
                                   3383 ;       Reset return stack pointer
                                   3384 ;       and start text interpreter.
      00934C 93 2F                 3385         .word      LINK
                           0012CE  3386 LINK = . 
      00934E 04                    3387         .byte      4
      00934F 51 55 49 54           3388         .ascii     "QUIT"
      009353                       3389 QUIT:
      009353 CD 83 69         [ 4] 3390         CALL     DOLIT
      009356 17 FF                 3391         .word      RPP
      009358 CD 84 2C         [ 4] 3392         CALL     RPSTO   ;reset return stack pointer
      00935B CD 92 B7         [ 4] 3393 QUIT1:  CALL     LBRAC   ;start interpretation
      00935E CD 92 1A         [ 4] 3394 QUIT2:  CALL     QUERY   ;get input
      009361 CD 93 0B         [ 4] 3395         CALL     EVAL
      009364 20 F8            [ 2] 3396         JRA     QUIT2   ;continue till error
                                   3397 
                                   3398 ;; The compiler
                                   3399 
                                   3400 ;       '       ( -- ca )
                                   3401 ;       Search vocabularies for
                                   3402 ;       next word in input stream.
      009366 93 4E                 3403         .word      LINK
                           0012E8  3404 LINK = . 
      009368 01                    3405         .byte      1
      009369 27                    3406         .ascii     "'"
      00936A                       3407 TICK:
      00936A CD 90 45         [ 4] 3408         CALL     TOKEN
      00936D CD 91 42         [ 4] 3409         CALL     NAMEQ   ;?defined
      009370 CD 83 9C         [ 4] 3410         CALL     QBRAN
      009373 92 56                 3411         .word      ABOR1
      009375 81               [ 4] 3412         RET     ;yes, push code address
                                   3413 
                                   3414 ;       ALLOT   ( n -- )
                           000001  3415 .if PICATOUT_MOD
                                   3416 ;       Allocate n bytes to RAM 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



                           000000  3417 .else 
                                   3418 ;       Allocate n bytes to  code dictionary.
                                   3419 .endif 
      009376 93 68                 3420         .word      LINK
                           0012F8  3421 LINK = . 
      009378 05                    3422         .byte      5
      009379 41 4C 4C 4F 54        3423         .ascii     "ALLOT"
      00937E                       3424 ALLOT:
      00937E CD 85 E6         [ 4] 3425         CALL     VPP
                           000001  3426 .if PICATOUT_MOD
                                   3427 ; must update APP_VP each time VP is modidied
      009381 CD 8A 3C         [ 4] 3428         call PSTOR 
      009384 CD 9A 59         [ 4] 3429         call UPDATVP 
                           000000  3430 .else
                                   3431         JP     PSTOR
                                   3432 .endif ;PICATOUT_MOD
                                   3433 
                                   3434 ;       ,       ( w -- )
                                   3435 ;         Compile an integer into
                                   3436 ;         variable space.
      009387 93 78                 3437         .word      LINK
                           001309  3438 LINK = . 
      009389 01                    3439         .byte      1
      00938A 2C                    3440         .ascii     ","
      00938B                       3441 COMMA:
      00938B CD 8A BA         [ 4] 3442         CALL     HERE
      00938E CD 84 98         [ 4] 3443         CALL     DUPP
      009391 CD 89 34         [ 4] 3444         CALL     CELLP   ;cell boundary
      009394 CD 85 E6         [ 4] 3445         CALL     VPP
      009397 CD 83 DA         [ 4] 3446         CALL     STORE
      00939A CC 83 DA         [ 2] 3447         JP     STORE
                                   3448 
                                   3449 ;       C,      ( c -- )
                                   3450 ;       Compile a byte into
                                   3451 ;       variables space.
      00939D 93 89                 3452        .word      LINK
                           00131F  3453 LINK = . 
      00939F 02                    3454         .byte      2
      0093A0 43 2C                 3455         .ascii     "C,"
      0093A2                       3456 CCOMMA:
      0093A2 CD 8A BA         [ 4] 3457         CALL     HERE
      0093A5 CD 84 98         [ 4] 3458         CALL     DUPP
      0093A8 CD 89 5F         [ 4] 3459         CALL     ONEP
      0093AB CD 85 E6         [ 4] 3460         CALL     VPP
      0093AE CD 83 DA         [ 4] 3461         CALL     STORE
      0093B1 CC 83 FE         [ 2] 3462         JP     CSTOR
                                   3463 
                                   3464 ;       [COMPILE]       ( -- ; <string> )
                                   3465 ;       Compile next immediate
                                   3466 ;       word into code dictionary.
      0093B4 93 9F                 3467         .word      LINK
                           001336  3468 LINK = . 
      0093B6 89                    3469 	.byte      IMEDD+9
      0093B7 5B 43 4F 4D 50 49 4C  3470         .ascii     "[COMPILE]"
             45 5D
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      0093C0                       3471 BCOMP:
      0093C0 CD 93 6A         [ 4] 3472         CALL     TICK
      0093C3 CC 96 83         [ 2] 3473         JP     JSRC
                                   3474 
                                   3475 ;       COMPILE ( -- )
                                   3476 ;       Compile next jsr in
                                   3477 ;       colon list to code dictionary.
      0093C6 93 B6                 3478         .word      LINK
                           001348  3479 LINK = . 
      0093C8 47                    3480 	.byte      COMPO+7
      0093C9 43 4F 4D 50 49 4C 45  3481         .ascii     "COMPILE"
      0093D0                       3482 COMPI:
      0093D0 CD 84 42         [ 4] 3483         CALL     RFROM
                           000001  3484 .if PICATOUT_MOD
                                   3485 ; no need to increment
                           000000  3486 .else
                                   3487         CALL     ONEP
                                   3488 .endif 
      0093D3 CD 84 98         [ 4] 3489         CALL     DUPP
      0093D6 CD 83 F1         [ 4] 3490         CALL     AT
      0093D9 CD 96 83         [ 4] 3491         CALL     JSRC    ;compile subroutine
      0093DC CD 89 34         [ 4] 3492         CALL     CELLP
                           000001  3493 .if PICATOUT_MOD
      0093DF 90 93            [ 1] 3494         ldw y,x 
      0093E1 90 FE            [ 2] 3495         ldw y,(y)
      0093E3 1C 00 02         [ 2] 3496         addw x,#CELLL 
      0093E6 90 FC            [ 2] 3497         jp (y)
                           000000  3498 .else 
                                   3499         JP     TOR
                                   3500 .endif 
                                   3501 
                                   3502 ;       LITERAL ( w -- )
                                   3503 ;       Compile tos to dictionary
                                   3504 ;       as an integer literal.
      0093E8 93 C8                 3505         .word      LINK
                           00136A  3506 LINK = . 
      0093EA 87                    3507 	.byte      IMEDD+7
      0093EB 4C 49 54 45 52 41 4C  3508         .ascii     "LITERAL"
      0093F2                       3509 LITER:
      0093F2 CD 93 D0         [ 4] 3510         CALL     COMPI
                           000001  3511 .if PICATOUT_MOD
      0093F5 83 69                 3512         .word DOLIT 
                           000000  3513 .else         
                                   3514         CALL     DOLIT
                                   3515 .endif 
      0093F7 CC 93 8B         [ 2] 3516         JP     COMMA
                                   3517 
                                   3518 ;       $,"     ( -- )
                                   3519 ;       Compile a literal string
                                   3520 ;       up to next " .
      0093FA 93 EA                 3521         .word      LINK
                           00137C  3522 LINK = . 
      0093FC 03                    3523         .byte      3
      0093FD 24 2C 22              3524         .byte     '$',',','"'
      009400                       3525 STRCQ:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      009400 CD 83 69         [ 4] 3526         CALL     DOLIT
      009403 00 22                 3527         .word     34	; "
      009405 CD 8F C8         [ 4] 3528         CALL     PARSE
      009408 CD 8A BA         [ 4] 3529         CALL     HERE
      00940B CD 8B 7B         [ 4] 3530         CALL     PACKS   ;string to code dictionary
      00940E CD 8A A3         [ 4] 3531         CALL     COUNT
      009411 CD 86 80         [ 4] 3532         CALL     PLUS    ;calculate aligned end of string
      009414 CD 85 E6         [ 4] 3533         CALL     VPP
      009417 CC 83 DA         [ 2] 3534         JP     STORE
                                   3535 
                                   3536 ;; Structures
                                   3537 
                                   3538 ;       FOR     ( -- a )
                                   3539 ;       Start a FOR-NEXT loop
                                   3540 ;       structure in a colon definition.
      00941A 93 FC                 3541         .word      LINK
                           00139C  3542 LINK = . 
      00941C 83                    3543 	.byte      IMEDD+3
      00941D 46 4F 52              3544         .ascii     "FOR"
      009420                       3545 FOR:
      009420 CD 93 D0         [ 4] 3546         CALL     COMPI
                           000001  3547 .if PICATOUT_MOD
      009423 84 61                 3548         .word TOR 
                           000000  3549 .else
                                   3550         CALL     TOR
                                   3551 .endif
      009425 CC 8A BA         [ 2] 3552         JP     HERE
                                   3553 
                                   3554 ;       NEXT    ( a -- )
                                   3555 ;       Terminate a FOR-NEXT loop.
      009428 94 1C                 3556         .word      LINK
                           0013AA  3557 LINK = . 
      00942A 84                    3558 	.byte      IMEDD+4
      00942B 4E 45 58 54           3559         .ascii     "NEXT"
      00942F                       3560 NEXT:
      00942F CD 93 D0         [ 4] 3561         CALL     COMPI
                           000001  3562 .if PICATOUT_MOD
      009432 83 7D                 3563         .word DONXT 
                           000000  3564 .else 
                                   3565         CALL     DONXT
                                   3566 .endif         
                           000001  3567 .if PICATOUT_MOD
      009434 CD 86 1F         [ 4] 3568         call ADRADJ
                                   3569 .endif ; PICATOUT_MOD
      009437 CC 93 8B         [ 2] 3570         JP     COMMA
                                   3571 
                                   3572 ;       I ( -- n )
                                   3573 ;       stack FOR-NEXT COUNTER 
      00943A 94 2A                 3574         .word LINK 
                           0013BC  3575         LINK=.
      00943C 01                    3576         .byte 1 
      00943D 49                    3577         .ascii "I"
      00943E                       3578 IFETCH: 
      00943E 1D 00 02         [ 2] 3579         subw x,#CELLL 
      009441 16 03            [ 2] 3580         ldw y,(3,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      009443 FF               [ 2] 3581         ldw (x),y 
      009444 81               [ 4] 3582         ret 
                                   3583 
                                   3584 ;       BEGIN   ( -- a )
                                   3585 ;       Start an infinite or
                                   3586 ;       indefinite loop structure.
      009445 94 3C                 3587         .word      LINK
                           0013C7  3588 LINK = . 
      009447 85                    3589 	.byte      IMEDD+5
      009448 42 45 47 49 4E        3590         .ascii     "BEGIN"
      00944D                       3591 BEGIN:
      00944D CC 8A BA         [ 2] 3592         JP     HERE
                                   3593 
                                   3594 ;       UNTIL   ( a -- )
                                   3595 ;       Terminate a BEGIN-UNTIL
                                   3596 ;       indefinite loop structure.
      009450 94 47                 3597         .word      LINK
                           0013D2  3598 LINK = . 
      009452 85                    3599 	.byte      IMEDD+5
      009453 55 4E 54 49 4C        3600         .ascii     "UNTIL"
      009458                       3601 UNTIL:
      009458 CD 93 D0         [ 4] 3602         CALL     COMPI
                           000001  3603 .if PICATOUT_MOD
      00945B 83 9C                 3604         .word    QBRAN 
                           000000  3605 .else 
                                   3606         CALL     QBRAN
                                   3607 .endif 
                           000001  3608 .if PICATOUT_MOD 
      00945D CD 86 1F         [ 4] 3609         call ADRADJ
                                   3610 .endif ; PICATOUT_MOD
      009460 CC 93 8B         [ 2] 3611         JP     COMMA
                                   3612 
                                   3613 ;       AGAIN   ( a -- )
                                   3614 ;       Terminate a BEGIN-AGAIN
                                   3615 ;       infinite loop structure.
      009463 94 52                 3616         .word      LINK
                           0013E5  3617 LINK = . 
      009465 85                    3618 	.byte      IMEDD+5
      009466 41 47 41 49 4E        3619         .ascii     "AGAIN"
      00946B                       3620 AGAIN:
      00946B CD 93 D0         [ 4] 3621         CALL     COMPI
                           000001  3622 .if PICATOUT_MOD
      00946E 83 B3                 3623         .word BRAN
                           000000  3624 .else
                                   3625         CALL     BRAN
                                   3626 .endif 
                           000001  3627 .if PICATOUT_MOD 
      009470 CD 86 1F         [ 4] 3628         call ADRADJ 
                                   3629 .endif ; PICATOUT_MOD
      009473 CC 93 8B         [ 2] 3630         JP     COMMA
                                   3631 
                                   3632 ;       IF      ( -- A )
                                   3633 ;       Begin a conditional branch.
      009476 94 65                 3634         .word      LINK
                           0013F8  3635 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



      009478 82                    3636 	.byte      IMEDD+2
      009479 49 46                 3637         .ascii     "IF"
      00947B                       3638 IFF:
      00947B CD 93 D0         [ 4] 3639         CALL     COMPI
                           000001  3640 .if PICATOUT_MOD
      00947E 83 9C                 3641         .word QBRAN
                           000000  3642 .else
                                   3643         CALL     QBRAN
                                   3644 .endif 
      009480 CD 8A BA         [ 4] 3645         CALL     HERE
      009483 CD 89 CB         [ 4] 3646         CALL     ZERO
      009486 CC 93 8B         [ 2] 3647         JP     COMMA
                                   3648 
                                   3649 ;       THEN        ( A -- )
                                   3650 ;       Terminate a conditional branch structure.
      009489 94 78                 3651         .word      LINK
                           00140B  3652 LINK = . 
      00948B 84                    3653 	.byte      IMEDD+4
      00948C 54 48 45 4E           3654         .ascii     "THEN"
      009490                       3655 THENN:
      009490 CD 8A BA         [ 4] 3656         CALL     HERE
                           000001  3657 .if PICATOUT_MOD 
      009493 CD 86 1F         [ 4] 3658         call ADRADJ 
                                   3659 .endif ; PICATOUT_MOD
      009496 CD 84 A8         [ 4] 3660         CALL     SWAPP
      009499 CC 83 DA         [ 2] 3661         JP     STORE
                                   3662 
                                   3663 ;       ELSE        ( A -- A )
                                   3664 ;       Start the false clause in an IF-ELSE-THEN structure.
      00949C 94 8B                 3665         .word      LINK
                           00141E  3666 LINK = . 
      00949E 84                    3667 	.byte      IMEDD+4
      00949F 45 4C 53 45           3668         .ascii     "ELSE"
      0094A3                       3669 ELSEE:
      0094A3 CD 93 D0         [ 4] 3670         CALL     COMPI
                           000001  3671 .if PICATOUT_MOD
      0094A6 83 B3                 3672         .word BRAN
                           000000  3673 .else
                                   3674         CALL     BRAN
                                   3675 .endif 
      0094A8 CD 8A BA         [ 4] 3676         CALL     HERE
      0094AB CD 89 CB         [ 4] 3677         CALL     ZERO
      0094AE CD 93 8B         [ 4] 3678         CALL     COMMA
      0094B1 CD 84 A8         [ 4] 3679         CALL     SWAPP
      0094B4 CD 8A BA         [ 4] 3680         CALL     HERE
                           000001  3681 .if PICATOUT_MOD 
      0094B7 CD 86 1F         [ 4] 3682         call ADRADJ 
                                   3683 .endif ; PICATOUT_MOD
      0094BA CD 84 A8         [ 4] 3684         CALL     SWAPP
      0094BD CC 83 DA         [ 2] 3685         JP     STORE
                                   3686 
                                   3687 ;       AHEAD       ( -- A )
                                   3688 ;       Compile a forward branch instruction.
      0094C0 94 9E                 3689         .word      LINK
                           001442  3690 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      0094C2 85                    3691 	.byte      IMEDD+5
      0094C3 41 48 45 41 44        3692         .ascii     "AHEAD"
      0094C8                       3693 AHEAD:
      0094C8 CD 93 D0         [ 4] 3694         CALL     COMPI
                           000001  3695 .if PICATOUT_MOD
      0094CB 83 B3                 3696         .word BRAN
                           000000  3697 .else
                                   3698         CALL     BRAN
                                   3699 .endif 
      0094CD CD 8A BA         [ 4] 3700         CALL     HERE
      0094D0 CD 89 CB         [ 4] 3701         CALL     ZERO
      0094D3 CC 93 8B         [ 2] 3702         JP     COMMA
                                   3703 
                                   3704 ;       WHILE       ( a -- A a )
                                   3705 ;       Conditional branch out of a BEGIN-WHILE-REPEAT loop.
      0094D6 94 C2                 3706         .word      LINK
                           001458  3707 LINK = . 
      0094D8 85                    3708 	.byte      IMEDD+5
      0094D9 57 48 49 4C 45        3709         .ascii     "WHILE"
      0094DE                       3710 WHILE:
      0094DE CD 93 D0         [ 4] 3711         CALL     COMPI
                           000001  3712 .if PICATOUT_MOD
      0094E1 83 9C                 3713         .word QBRAN
                           000000  3714 .else
                                   3715         CALL     QBRAN
                                   3716 .endif 
      0094E3 CD 8A BA         [ 4] 3717         CALL     HERE
      0094E6 CD 89 CB         [ 4] 3718         CALL     ZERO
      0094E9 CD 93 8B         [ 4] 3719         CALL     COMMA
      0094EC CC 84 A8         [ 2] 3720         JP     SWAPP
                                   3721 
                                   3722 ;       REPEAT      ( A a -- )
                                   3723 ;       Terminate a BEGIN-WHILE-REPEAT indefinite loop.
      0094EF 94 D8                 3724         .word      LINK
                           001471  3725 LINK = . 
      0094F1 86                    3726         .byte      IMEDD+6
      0094F2 52 45 50 45 41 54     3727         .ascii     "REPEAT"
      0094F8                       3728 REPEA:
      0094F8 CD 93 D0         [ 4] 3729         CALL     COMPI
                           000001  3730 .if PICATOUT_MOD
      0094FB 83 B3                 3731         .word BRAN
                           000000  3732 .else
                                   3733         CALL     BRAN
                                   3734 .endif 
                           000001  3735 .if PICATOUT_MOD 
      0094FD CD 86 1F         [ 4] 3736         call ADRADJ 
                                   3737 .endif ; PICATOUT_MOD
      009500 CD 93 8B         [ 4] 3738         CALL     COMMA
      009503 CD 8A BA         [ 4] 3739         CALL     HERE
                           000001  3740 .if PICATOUT_MOD 
      009506 CD 86 1F         [ 4] 3741         call ADRADJ 
                                   3742 .endif ; PICATOUT_MOD
      009509 CD 84 A8         [ 4] 3743         CALL     SWAPP
      00950C CC 83 DA         [ 2] 3744         JP     STORE
                                   3745 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



                                   3746 ;       AFT         ( a -- a A )
                                   3747 ;       Jump to THEN in a FOR-AFT-THEN-NEXT loop the first time through.
      00950F 94 F1                 3748         .word      LINK
                           001491  3749 LINK = . 
      009511 83                    3750 	.byte      IMEDD+3
      009512 41 46 54              3751         .ascii     "AFT"
      009515                       3752 AFT:
      009515 CD 84 8E         [ 4] 3753         CALL     DROP
      009518 CD 94 C8         [ 4] 3754         CALL     AHEAD
      00951B CD 8A BA         [ 4] 3755         CALL     HERE
      00951E CC 84 A8         [ 2] 3756         JP     SWAPP
                                   3757 
                                   3758 ;       ABORT"      ( -- ; <string> )
                                   3759 ;       Conditional abort with an error message.
      009521 95 11                 3760         .word      LINK
                           0014A3  3761 LINK = . 
      009523 86                    3762 	.byte      IMEDD+6
      009524 41 42 4F 52 54        3763         .ascii     "ABORT"
      009529 22                    3764         .byte      '"'
      00952A                       3765 ABRTQ:
      00952A CD 93 D0         [ 4] 3766         CALL     COMPI
                           000001  3767 .if PICATOUT_MOD
      00952D 92 4E                 3768         .word ABORQ
                           000000  3769 .else
                                   3770         CALL     ABORQ
                                   3771 .endif
      00952F CC 94 00         [ 2] 3772         JP     STRCQ
                                   3773 
                                   3774 ;       $"     ( -- ; <string> )
                                   3775 ;       Compile an inline string literal.
      009532 95 23                 3776         .word      LINK
                           0014B4  3777 LINK = . 
      009534 82                    3778 	.byte      IMEDD+2
      009535 24 22                 3779         .byte     '$','"'
      009537                       3780 STRQ:
      009537 CD 93 D0         [ 4] 3781         CALL     COMPI
                           000001  3782 .if PICATOUT_MOD
      00953A 8E 68                 3783         .word STRQP 
                           000000  3784 .else
                                   3785         CALL     STRQP
                                   3786 .endif
      00953C CC 94 00         [ 2] 3787         JP     STRCQ
                                   3788 
                                   3789 ;       ."          ( -- ; <string> )
                                   3790 ;       Compile an inline string literal to be typed out at run time.
      00953F 95 34                 3791         .word      LINK
                           0014C1  3792 LINK = . 
      009541 82                    3793 	.byte      IMEDD+2
      009542 2E 22                 3794         .byte     '.','"'
      009544                       3795 DOTQ:
      009544 CD 93 D0         [ 4] 3796         CALL     COMPI
                           000001  3797 .if PICATOUT_MOD
      009547 8E 72                 3798         .word DOTQP 
                           000000  3799 .else
                                   3800         CALL     DOTQP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



                                   3801 .endif 
      009549 CC 94 00         [ 2] 3802         JP     STRCQ
                                   3803 
                                   3804 ;; Name compiler
                                   3805 
                                   3806 ;       ?UNIQUE ( a -- a )
                                   3807 ;       Display a warning message
                                   3808 ;       if word already exists.
      00954C 95 41                 3809         .word      LINK
                           0014CE  3810 LINK = . 
      00954E 07                    3811         .byte      7
      00954F 3F 55 4E 49 51 55 45  3812         .ascii     "?UNIQUE"
      009556                       3813 UNIQU:
      009556 CD 84 98         [ 4] 3814         CALL     DUPP
      009559 CD 91 42         [ 4] 3815         CALL     NAMEQ   ;?name exists
      00955C CD 83 9C         [ 4] 3816         CALL     QBRAN
      00955F 95 75                 3817         .word      UNIQ1
      009561 CD 8E 72         [ 4] 3818         CALL     DOTQP   ;redef are OK
      009564 07                    3819         .byte       7
      009565 20 72 65 44 65 66 20  3820         .ascii     " reDef "       
      00956C CD 84 C2         [ 4] 3821         CALL     OVER
      00956F CD 8A A3         [ 4] 3822         CALL     COUNT
      009572 CD 8E 15         [ 4] 3823         CALL     TYPES   ;just in case
      009575 CC 84 8E         [ 2] 3824 UNIQ1:  JP     DROP
                                   3825 
                                   3826 ;       $,n     ( na -- )
                                   3827 ;       Build a new dictionary name
                                   3828 ;       using string at na.
                           000001  3829 .if PICATOUT_MOD
                                   3830 ; compile dans l'espace des variables 
                                   3831 .endif 
      009578 95 4E                 3832         .word      LINK
                           0014FA  3833 LINK = . 
      00957A 03                    3834         .byte      3
      00957B 24 2C 6E              3835         .ascii     "$,n"
      00957E                       3836 SNAME:
      00957E CD 84 98         [ 4] 3837         CALL     DUPP
      009581 CD 84 0F         [ 4] 3838         CALL     CAT     ;?null input
      009584 CD 83 9C         [ 4] 3839         CALL     QBRAN
      009587 95 B4                 3840         .word      PNAM1
      009589 CD 95 56         [ 4] 3841         CALL     UNIQU   ;?redefinition
      00958C CD 84 98         [ 4] 3842         CALL     DUPP
      00958F CD 8A A3         [ 4] 3843         CALL     COUNT
      009592 CD 86 80         [ 4] 3844         CALL     PLUS
      009595 CD 85 E6         [ 4] 3845         CALL     VPP
      009598 CD 83 DA         [ 4] 3846         CALL     STORE
      00959B CD 84 98         [ 4] 3847         CALL     DUPP
      00959E CD 86 04         [ 4] 3848         CALL     LAST
      0095A1 CD 83 DA         [ 4] 3849         CALL     STORE   ;save na for vocabulary link
      0095A4 CD 89 43         [ 4] 3850         CALL     CELLM   ;link address
      0095A7 CD 85 D8         [ 4] 3851         CALL     CNTXT
      0095AA CD 83 F1         [ 4] 3852         CALL     AT
      0095AD CD 84 A8         [ 4] 3853         CALL     SWAPP
      0095B0 CD 83 DA         [ 4] 3854         CALL     STORE
      0095B3 81               [ 4] 3855         RET     ;save code pointer
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



      0095B4 CD 8E 68         [ 4] 3856 PNAM1:  CALL     STRQP
      0095B7 05                    3857         .byte      5
      0095B8 20 6E 61 6D 65        3858         .ascii     " name" ;null input
      0095BD CC 92 56         [ 2] 3859         JP     ABOR1
                                   3860 
                                   3861 ;; FORTH compiler
                                   3862 
                                   3863 ;       $COMPILE        ( a -- )
                                   3864 ;       Compile next word to
                                   3865 ;       dictionary as a token or literal.
      0095C0 95 7A                 3866         .word      LINK
                           001542  3867 LINK = . 
      0095C2 08                    3868         .byte      8
      0095C3 24 43 4F 4D 50 49 4C  3869         .ascii     "$COMPILE"
             45
      0095CB                       3870 SCOMP:
      0095CB CD 91 42         [ 4] 3871         CALL     NAMEQ
      0095CE CD 86 2F         [ 4] 3872         CALL     QDUP    ;?defined
      0095D1 CD 83 9C         [ 4] 3873         CALL     QBRAN
      0095D4 95 EC                 3874         .word      SCOM2
      0095D6 CD 83 F1         [ 4] 3875         CALL     AT
      0095D9 CD 83 69         [ 4] 3876         CALL     DOLIT
      0095DC 80 00                 3877         .word     0x8000	;  IMEDD*256
      0095DE CD 84 E4         [ 4] 3878         CALL     ANDD    ;?immediate
      0095E1 CD 83 9C         [ 4] 3879         CALL     QBRAN
      0095E4 95 E9                 3880         .word      SCOM1
      0095E6 CC 83 C3         [ 2] 3881         JP     EXECU
      0095E9 CC 96 83         [ 2] 3882 SCOM1:  JP     JSRC
      0095EC CD 8C E0         [ 4] 3883 SCOM2:  CALL     NUMBQ   ;try to convert to number
      0095EF CD 83 9C         [ 4] 3884         CALL     QBRAN
      0095F2 92 56                 3885         .word      ABOR1
      0095F4 CC 93 F2         [ 2] 3886         JP     LITER
                                   3887 
                                   3888 ;       OVERT   ( -- )
                                   3889 ;       Link a new word into vocabulary.
      0095F7 95 C2                 3890         .word      LINK
                           001579  3891 LINK = . 
      0095F9 05                    3892         .byte      5
      0095FA 4F 56 45 52 54        3893         .ascii     "OVERT"
      0095FF                       3894 OVERT:
      0095FF CD 86 04         [ 4] 3895         CALL     LAST
      009602 CD 83 F1         [ 4] 3896         CALL     AT
      009605 CD 85 D8         [ 4] 3897         CALL     CNTXT
      009608 CC 83 DA         [ 2] 3898         JP     STORE
                                   3899 
                                   3900 ;       ;       ( -- )
                                   3901 ;       Terminate a colon definition.
      00960B 95 F9                 3902         .word      LINK
                           00158D  3903 LINK = . 
      00960D C1                    3904 	.byte      IMEDD+COMPO+1
      00960E 3B                    3905         .ascii     ";"
      00960F                       3906 SEMIS:
      00960F CD 93 D0         [ 4] 3907         CALL     COMPI
                           000001  3908 .if PICATOUT_MOD
      009612 83 D3                 3909         .word EXIT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



                           000000  3910 .else
                                   3911         CALL     EXIT
                                   3912 .endif 
      009614 CD 92 B7         [ 4] 3913         CALL     LBRAC
                           000001  3914 .if PICATOUT_MOD
      009617 CD 95 FF         [ 4] 3915         call OVERT 
      00961A CD 9F 25         [ 4] 3916         CALL FMOVE
      00961D CD 86 2F         [ 4] 3917         call QDUP 
      009620 CD 83 9C         [ 4] 3918         call QBRAN 
      009623 96 28                 3919         .word 1$ 
      009625 CD 9F B9         [ 4] 3920         CALL UPDATPTR 
      009628 81               [ 4] 3921 1$:     RET 
                           000000  3922 .else 
                                   3923         JP     OVERT
                                   3924 .endif 
                                   3925 
                           000001  3926 .if PICATOUT_MOD
                                   3927 ;       Terminate an ISR definition 
                                   3928 ;       retourn ca of ISR as double
                                   3929 ;       I; ( -- ud )
      009629 96 0D                 3930         .word LINK 
                           0015AB  3931         LINK=.
      00962B C2                    3932         .byte 2+IMEDD+COMPO 
      00962C 49 3B                 3933         .ascii "I;" 
      00962E                       3934 ISEMI:
      00962E 1D 00 02         [ 2] 3935         subw x,#CELLL  
      009631 90 AE 00 80      [ 2] 3936         ldw y,#IRET_CODE 
      009635 FF               [ 2] 3937         ldw (x),y 
      009636 CD 93 A2         [ 4] 3938         call CCOMMA
      009639 CD 92 B7         [ 4] 3939         call LBRAC 
      00963C CD 9F FE         [ 4] 3940         call IFMOVE
      00963F CD 86 2F         [ 4] 3941         call QDUP 
      009642 CD 83 9C         [ 4] 3942         CALL QBRAN 
      009645 96 6B                 3943         .word 1$ 
      009647 CD 85 F4         [ 4] 3944         CALL CPP
      00964A CD 83 F1         [ 4] 3945         call AT 
      00964D CD 84 A8         [ 4] 3946         call SWAPP 
      009650 CD 85 F4         [ 4] 3947         CALL CPP 
      009653 CD 83 DA         [ 4] 3948         call STORE 
      009656 CD 9A 42         [ 4] 3949         call UPDATCP 
      009659 CD 99 FF         [ 4] 3950         call EEPVP 
      00965C CD 84 8E         [ 4] 3951         call DROP 
      00965F CD 83 F1         [ 4] 3952         call AT 
      009662 CD 85 E6         [ 4] 3953         call VPP 
      009665 CD 83 DA         [ 4] 3954         call STORE 
      009668 CC 89 CB         [ 2] 3955         jp ZERO
      00966B 81               [ 4] 3956 1$:     ret           
                                   3957         
                                   3958 .endif ;PICATOUT_MOD
                                   3959 
                                   3960 ;       ]       ( -- )
                                   3961 ;       Start compiling words in
                                   3962 ;       input stream.
      00966C 96 2B                 3963         .word      LINK
                           0015EE  3964 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      00966E 01                    3965         .byte      1
      00966F 5D                    3966         .ascii     "]"
      009670                       3967 RBRAC:
      009670 CD 83 69         [ 4] 3968         CALL   DOLIT
      009673 95 CB                 3969         .word  SCOMP
      009675 CD 85 B6         [ 4] 3970         CALL   TEVAL
      009678 CC 83 DA         [ 2] 3971         JP     STORE
                                   3972 
                                   3973 ;       CALL,    ( ca -- )
                                   3974 ;       Compile a subroutine call.
      00967B 96 6E                 3975         .word      LINK
                           0015FD  3976 LINK = . 
      00967D 04                    3977         .byte      4
      00967E 43 41 4C 4C 2C        3978         .ascii     "CALL,"
      009683                       3979 JSRC:
      009683 CD 83 69         [ 4] 3980         CALL     DOLIT
      009686 00 CD                 3981         .word     CALLL     ;CALL
      009688 CD 93 A2         [ 4] 3982         CALL     CCOMMA
      00968B CC 93 8B         [ 2] 3983         JP     COMMA
                                   3984 
                           000001  3985 .if PICATOUT_MOD
                                   3986 ;       INIT-OFS ( -- )
                                   3987 ;       compute offset to adjust jump address 
                                   3988 ;       set variable OFFSET 
      00968E 96 7D                 3989         .word LINK 
                           001610  3990         LINK=.
      009690 08                    3991         .byte 8 
      009691 49 4E 49 54 2D 4F 46  3992         .ascii "INIT-OFS" 
             53
      009699                       3993 INITOFS:
      009699 CD 85 A5         [ 4] 3994         call TFLASH 
      00969C CD 83 F1         [ 4] 3995         CALL AT 
      00969F CD 84 98         [ 4] 3996         CALL DUPP 
      0096A2 CD 83 9C         [ 4] 3997         call QBRAN
      0096A5 96 B6                 3998         .word 1$
      0096A7 CD 84 8E         [ 4] 3999         call DROP  
      0096AA CD 85 F4         [ 4] 4000         call CPP 
      0096AD CD 83 F1         [ 4] 4001         call AT 
      0096B0 CD 8A BA         [ 4] 4002         call HERE
      0096B3 CD 86 DE         [ 4] 4003         call SUBB 
      0096B6 CD 86 16         [ 4] 4004 1$:     call OFFSET 
      0096B9 CC 83 DA         [ 2] 4005         jp STORE  
                                   4006 .endif 
                                   4007 
                                   4008 ;       :       ( -- ; <string> )
                                   4009 ;       Start a new colon definition
                                   4010 ;       using next word as its name.
      0096BC 96 90                 4011         .word      LINK
                           00163E  4012 LINK = . 
      0096BE 01                    4013         .byte      1
      0096BF 3A                    4014         .ascii     ":"
      0096C0                       4015 COLON:
                           000001  4016 .if PICATOUT_MOD
      0096C0 CD 96 99         [ 4] 4017         call INITOFS       
                                   4018 .endif ; PICATOUT_MOD
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      0096C3 CD 90 45         [ 4] 4019         CALL   TOKEN
      0096C6 CD 95 7E         [ 4] 4020         CALL   SNAME
      0096C9 CC 96 70         [ 2] 4021         JP     RBRAC
                                   4022 
                           000001  4023 .if PICATOUT_MOD 
                                   4024 ;       I:  ( -- )
                                   4025 ;       Start interrupt service routine definition
                                   4026 ;       those definition have no name.
      0096CC 96 BE                 4027         .word LINK
                           00164E  4028         LINK=.
      0096CE 02                    4029         .byte 2 
      0096CF 49 3A                 4030         .ascii "I:" 
      0096D1                       4031 ICOLON:
      0096D1 CD 96 99         [ 4] 4032         call INITOFS 
      0096D4 CC 96 70         [ 2] 4033         jp RBRAC  
                                   4034 .endif ; PICATOUT_MOD
                                   4035 
                                   4036 ;       IMMEDIATE       ( -- )
                                   4037 ;       Make last compiled word
                                   4038 ;       an immediate word.
      0096D7 96 CE                 4039         .word      LINK
                           001659  4040 LINK = . 
      0096D9 09                    4041         .byte      9
      0096DA 49 4D 4D 45 44 49 41  4042         .ascii     "IMMEDIATE"
             54 45
      0096E3                       4043 IMMED:
      0096E3 CD 83 69         [ 4] 4044         CALL     DOLIT
      0096E6 80 00                 4045         .word     0x8000	;  IMEDD*256
      0096E8 CD 86 04         [ 4] 4046         CALL     LAST
      0096EB CD 83 F1         [ 4] 4047         CALL     AT
      0096EE CD 83 F1         [ 4] 4048         CALL     AT
      0096F1 CD 84 F8         [ 4] 4049         CALL     ORR
      0096F4 CD 86 04         [ 4] 4050         CALL     LAST
      0096F7 CD 83 F1         [ 4] 4051         CALL     AT
      0096FA CC 83 DA         [ 2] 4052         JP     STORE
                                   4053 
                                   4054 ;; Defining words
                                   4055 
                                   4056 ;       CREATE  ( -- ; <string> )
                                   4057 ;       Compile a new array
                                   4058 ;       without allocating space.
      0096FD 96 D9                 4059         .word      LINK
                           00167F  4060 LINK = . 
      0096FF 06                    4061         .byte      6
      009700 43 52 45 41 54 45     4062         .ascii     "CREATE"
      009706                       4063 CREAT:
      009706 CD 90 45         [ 4] 4064         CALL     TOKEN
      009709 CD 95 7E         [ 4] 4065         CALL     SNAME
      00970C CD 95 FF         [ 4] 4066         CALL     OVERT        
      00970F CD 93 D0         [ 4] 4067         CALL     COMPI 
                           000001  4068 .if PICATOUT_MOD
      009712 85 45                 4069         .word DOVAR 
                           000000  4070 .else
                                   4071         CALL     DOVAR
                                   4072 .endif 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



      009714 81               [ 4] 4073         RET
                                   4074 
                                   4075 ;       VARIABLE        ( -- ; <string> )
                                   4076 ;       Compile a new variable
                                   4077 ;       initialized to 0.
      009715 96 FF                 4078         .word      LINK
                           001697  4079 LINK = . 
      009717 08                    4080         .byte      8
      009718 56 41 52 49 41 42 4C  4081         .ascii     "VARIABLE"
             45
      009720                       4082 VARIA:
                           000001  4083 .if PICATOUT_MOD
                                   4084 ; indirect variable so that VARIABLE definition can be compiled in FLASH 
      009720 CD 8A BA         [ 4] 4085         CALL HERE
      009723 CD 84 98         [ 4] 4086         CALL DUPP 
      009726 CD 89 34         [ 4] 4087         CALL CELLP
      009729 CD 85 E6         [ 4] 4088         CALL VPP 
      00972C CD 83 DA         [ 4] 4089         CALL STORE
      00972F CD 9A 59         [ 4] 4090         call UPDATVP 
                                   4091 .endif         
      009732 CD 97 06         [ 4] 4092         CALL CREAT
      009735 CD 84 98         [ 4] 4093         CALL DUPP
      009738 CD 93 8B         [ 4] 4094         CALL COMMA
      00973B CD 89 CB         [ 4] 4095         CALL ZERO
                           000001  4096 .if PICATOUT_MOD 
      00973E CD 84 A8         [ 4] 4097         call SWAPP 
      009741 CD 83 DA         [ 4] 4098         CALL STORE 
      009744 CD 9F 25         [ 4] 4099         CALL FMOVE ; move definition to FLASH
      009747 CD 86 2F         [ 4] 4100         CALL QDUP 
      00974A CD 83 9C         [ 4] 4101         CALL QBRAN 
      00974D 97 52                 4102         .word 1$
      00974F CD 9F B9         [ 4] 4103         CALL UPDATPTR
      009752 81               [ 4] 4104 1$:     RET 
                                   4105 .endif ;PICATOUT_MOD        
                                   4106 
                           000001  4107 .if PICATOUT_MOD
                                   4108 ;       CONSTANT  ( n -- ; <string> )
                                   4109 ;       Compile a new constant 
                                   4110 ;       n CONSTANT name 
      009753 97 17                 4111         .word LINK 
                           0016D5  4112         LINK=. 
      009755 08                    4113         .byte 8 
      009756 43 4F 4E 53 54 41 4E  4114         .ascii "CONSTANT" 
             54
      00975E                       4115 CONSTANT:          
      00975E CD 90 45         [ 4] 4116         CALL TOKEN
      009761 CD 95 7E         [ 4] 4117         CALL SNAME 
      009764 CD 95 FF         [ 4] 4118         CALL OVERT 
      009767 CD 93 D0         [ 4] 4119         CALL COMPI 
                           000001  4120 .if PICATOUT_MOD
      00976A 97 88                 4121         .word DOCONST
                           000000  4122 .else
                                   4123         CALL DOCONST
                                   4124 .endif 
      00976C CD 93 8B         [ 4] 4125         CALL COMMA 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



      00976F CD 9F 25         [ 4] 4126         CALL FMOVE
      009772 CD 86 2F         [ 4] 4127         CALL QDUP 
      009775 CD 83 9C         [ 4] 4128         CALL QBRAN 
      009778 97 7D                 4129         .word 1$ 
      00977A CD 9F B9         [ 4] 4130         CALL UPDATPTR  
      00977D 81               [ 4] 4131 1$:     RET          
                                   4132 
                                   4133 ; CONSTANT runtime semantic 
                                   4134 ; doCONST  ( -- n )
      00977E 97 55                 4135         .word LINK 
                           001700  4136         LINK=.
      009780 07                    4137         .byte 7
      009781 44 4F 43 4F 4E 53 54  4138         .ascii "DOCONST"
      009788                       4139 DOCONST:
      009788 1D 00 02         [ 2] 4140         subw x,#CELLL
      00978B 90 85            [ 2] 4141         popw y 
      00978D 90 FE            [ 2] 4142         ldw y,(y) 
      00978F FF               [ 2] 4143         ldw (x),y 
      009790 81               [ 4] 4144         ret 
                                   4145 .endif ;PICATOUT_MOD
                                   4146 
                                   4147 
                                   4148 ;; Tools
                                   4149 
                                   4150 ;       _TYPE   ( b u -- )
                                   4151 ;       Display a string. Filter
                                   4152 ;       non-printing characters.
      009791 97 80                 4153         .word      LINK
                           001713  4154 LINK = . 
      009793 05                    4155         .byte      5
      009794 5F 54 59 50 45        4156         .ascii     "_TYPE"
      009799                       4157 UTYPE:
      009799 CD 84 61         [ 4] 4158         CALL     TOR     ;start count down loop
      00979C 20 0F            [ 2] 4159         JRA     UTYP2   ;skip first pass
      00979E CD 84 98         [ 4] 4160 UTYP1:  CALL     DUPP
      0097A1 CD 84 0F         [ 4] 4161         CALL     CAT
      0097A4 CD 89 F5         [ 4] 4162         CALL     TCHAR
      0097A7 CD 83 53         [ 4] 4163         CALL     EMIT    ;display only printable
      0097AA CD 89 5F         [ 4] 4164         CALL     ONEP    ;increment address
      0097AD CD 83 7D         [ 4] 4165 UTYP2:  CALL     DONXT
      0097B0 97 9E                 4166         .word      UTYP1   ;loop till done
      0097B2 CC 84 8E         [ 2] 4167         JP     DROP
                                   4168 
                                   4169 ;       dm+     ( a u -- a )
                                   4170 ;       Dump u bytes from ,
                                   4171 ;       leaving a+u on  stack.
      0097B5 97 93                 4172         .word      LINK
                           001737  4173 LINK = . 
      0097B7 03                    4174         .byte      3
      0097B8 64 6D 2B              4175         .ascii     "dm+"
      0097BB                       4176 DUMPP:
      0097BB CD 84 C2         [ 4] 4177         CALL     OVER
      0097BE CD 83 69         [ 4] 4178         CALL     DOLIT
      0097C1 00 04                 4179         .word      4
      0097C3 CD 8E 9B         [ 4] 4180         CALL     UDOTR   ;display address
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



      0097C6 CD 8D EB         [ 4] 4181         CALL     SPACE
      0097C9 CD 84 61         [ 4] 4182         CALL     TOR     ;start count down loop
      0097CC 20 11            [ 2] 4183         JRA     PDUM2   ;skip first pass
      0097CE CD 84 98         [ 4] 4184 PDUM1:  CALL     DUPP
      0097D1 CD 84 0F         [ 4] 4185         CALL     CAT
      0097D4 CD 83 69         [ 4] 4186         CALL     DOLIT
      0097D7 00 03                 4187         .word      3
      0097D9 CD 8E 9B         [ 4] 4188         CALL     UDOTR   ;display numeric data
      0097DC CD 89 5F         [ 4] 4189         CALL     ONEP    ;increment address
      0097DF CD 83 7D         [ 4] 4190 PDUM2:  CALL     DONXT
      0097E2 97 CE                 4191         .word      PDUM1   ;loop till done
      0097E4 81               [ 4] 4192         RET
                                   4193 
                                   4194 ;       DUMP    ( a u -- )
                                   4195 ;       Dump u bytes from a,
                                   4196 ;       in a formatted manner.
      0097E5 97 B7                 4197         .word      LINK
                           001767  4198 LINK = . 
      0097E7 04                    4199         .byte      4
      0097E8 44 55 4D 50           4200         .ascii     "DUMP"
      0097EC                       4201 DUMP:
      0097EC CD 85 55         [ 4] 4202         CALL     BASE
      0097EF CD 83 F1         [ 4] 4203         CALL     AT
      0097F2 CD 84 61         [ 4] 4204         CALL     TOR
      0097F5 CD 8C 73         [ 4] 4205         CALL     HEX     ;save radix, set hex
      0097F8 CD 83 69         [ 4] 4206         CALL     DOLIT
      0097FB 00 10                 4207         .word      16
      0097FD CD 88 85         [ 4] 4208         CALL     SLASH   ;change count to lines
      009800 CD 84 61         [ 4] 4209         CALL     TOR     ;start count down loop
      009803 CD 8E 33         [ 4] 4210 DUMP1:  CALL     CR
      009806 CD 83 69         [ 4] 4211         CALL     DOLIT
      009809 00 10                 4212         .word      16
      00980B CD 86 6B         [ 4] 4213         CALL     DDUP
      00980E CD 97 BB         [ 4] 4214         CALL     DUMPP   ;display numeric
      009811 CD 86 40         [ 4] 4215         CALL     ROT
      009814 CD 86 40         [ 4] 4216         CALL     ROT
      009817 CD 8D EB         [ 4] 4217         CALL     SPACE
      00981A CD 8D EB         [ 4] 4218         CALL     SPACE
      00981D CD 97 99         [ 4] 4219         CALL     UTYPE   ;display printable characters
      009820 CD 83 7D         [ 4] 4220         CALL     DONXT
      009823 98 03                 4221         .word      DUMP1   ;loop till done
      009825 CD 84 8E         [ 4] 4222 DUMP3:  CALL     DROP
      009828 CD 84 42         [ 4] 4223         CALL     RFROM
      00982B CD 85 55         [ 4] 4224         CALL     BASE
      00982E CC 83 DA         [ 2] 4225         JP     STORE   ;restore radix
                                   4226 
                                   4227 ;       .S      ( ... -- ... )
                                   4228 ;        Display  contents of stack.
      009831 97 E7                 4229         .word      LINK
                           0017B3  4230 LINK = . 
      009833 02                    4231         .byte      2
      009834 2E 53                 4232         .ascii     ".S"
      009836                       4233 DOTS:
      009836 CD 8E 33         [ 4] 4234         CALL     CR
      009839 CD 8A 0E         [ 4] 4235         CALL     DEPTH   ;stack depth
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



      00983C CD 84 61         [ 4] 4236         CALL     TOR     ;start count down loop
      00983F 20 09            [ 2] 4237         JRA     DOTS2   ;skip first pass
      009841 CD 84 55         [ 4] 4238 DOTS1:  CALL     RAT
                                   4239 ;        CALL ONEP
      009844 CD 8A 25         [ 4] 4240 	CALL     PICK
      009847 CD 8E CE         [ 4] 4241         CALL     DOT     ;index stack, display contents
      00984A CD 83 7D         [ 4] 4242 DOTS2:  CALL     DONXT
      00984D 98 41                 4243         .word      DOTS1   ;loop till done
      00984F CD 8E 72         [ 4] 4244         CALL     DOTQP
      009852 05                    4245         .byte      5
      009853 20 3C 73 70 20        4246         .ascii     " <sp "
      009858 81               [ 4] 4247         RET
                                   4248 
                                   4249 ;       >NAME   ( ca -- na | F )
                                   4250 ;       Convert code address
                                   4251 ;       to a name address.
      009859 98 33                 4252         .word      LINK
                           0017DB  4253 LINK = . 
      00985B 05                    4254         .byte      5
      00985C 3E 4E 41 4D 45        4255         .ascii     ">NAME"
      009861                       4256 TNAME:
      009861 CD 85 D8         [ 4] 4257         CALL     CNTXT   ;vocabulary link
      009864 CD 83 F1         [ 4] 4258 TNAM2:  CALL     AT
      009867 CD 84 98         [ 4] 4259         CALL     DUPP    ;?last word in a vocabulary
      00986A CD 83 9C         [ 4] 4260         CALL     QBRAN
      00986D 98 88                 4261         .word      TNAM4
      00986F CD 86 6B         [ 4] 4262         CALL     DDUP
      009872 CD 90 53         [ 4] 4263         CALL     NAMET
      009875 CD 85 0D         [ 4] 4264         CALL     XORR    ;compare
      009878 CD 83 9C         [ 4] 4265         CALL     QBRAN
      00987B 98 82                 4266         .word      TNAM3
      00987D CD 89 43         [ 4] 4267         CALL     CELLM   ;continue with next word
      009880 20 E2            [ 2] 4268         JRA     TNAM2
      009882 CD 84 A8         [ 4] 4269 TNAM3:  CALL     SWAPP
      009885 CC 84 8E         [ 2] 4270         JP     DROP
      009888 CD 86 60         [ 4] 4271 TNAM4:  CALL     DDROP
      00988B CC 89 CB         [ 2] 4272         JP     ZERO
                                   4273 
                                   4274 ;       .ID     ( na -- )
                                   4275 ;        Display  name at address.
      00988E 98 5B                 4276         .word      LINK
                           001810  4277 LINK = . 
      009890 03                    4278         .byte      3
      009891 2E 49 44              4279         .ascii     ".ID"
      009894                       4280 DOTID:
      009894 CD 86 2F         [ 4] 4281         CALL     QDUP    ;if zero no name
      009897 CD 83 9C         [ 4] 4282         CALL     QBRAN
      00989A 98 AA                 4283         .word      DOTI1
      00989C CD 8A A3         [ 4] 4284         CALL     COUNT
      00989F CD 83 69         [ 4] 4285         CALL     DOLIT
      0098A2 00 1F                 4286         .word      0x1F
      0098A4 CD 84 E4         [ 4] 4287         CALL     ANDD    ;mask lexicon bits
      0098A7 CC 97 99         [ 2] 4288         JP     UTYPE
      0098AA CD 8E 72         [ 4] 4289 DOTI1:  CALL     DOTQP
      0098AD 09                    4290         .byte      9
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



      0098AE 20 6E 6F 4E 61 6D 65  4291         .ascii     " noName"
      0098B5 81               [ 4] 4292         RET
                                   4293 
                           000000  4294 WANT_SEE=0 
                           000000  4295 .if WANT_SEE 
                                   4296 ;       SEE     ( -- ; <string> )
                                   4297 ;       A simple decompiler.
                                   4298 ;       Updated for byte machines.
                                   4299         .word      LINK
                                   4300 LINK = . 
                                   4301         .byte      3
                                   4302         .ascii     "SEE"
                                   4303 SEE:
                                   4304         CALL     TICK    ;starting address
                                   4305         CALL     CR
                                   4306         CALL     ONEM
                                   4307 SEE1:   CALL     ONEP
                                   4308         CALL     DUPP
                                   4309         CALL     AT
                                   4310         CALL     DUPP    ;?does it contain a zero
                                   4311         CALL     QBRAN
                                   4312         .word    SEE2
                                   4313         CALL     TNAME   ;?is it a name
                                   4314 SEE2:   CALL     QDUP    ;name address or zero
                                   4315         CALL     QBRAN
                                   4316         .word    SEE3
                                   4317         CALL     SPACE
                                   4318         CALL     DOTID   ;display name
                                   4319         CALL     ONEP
                                   4320         JRA      SEE4
                                   4321 SEE3:   CALL     DUPP
                                   4322         CALL     CAT
                                   4323         CALL     UDOT    ;display number
                                   4324 SEE4:   CALL     NUFQ    ;user control
                                   4325         CALL     QBRAN
                                   4326         .word    SEE1
                                   4327         JP     DROP
                                   4328 .endif ; WANT_SEE 
                                   4329 
                                   4330 ;       WORDS   ( -- )
                                   4331 ;       Display names in vocabulary.
      0098B6 98 90                 4332         .word      LINK
                           001838  4333 LINK = . 
      0098B8 05                    4334         .byte      5
      0098B9 57 4F 52 44 53        4335         .ascii     "WORDS"
      0098BE                       4336 WORDS:
      0098BE CD 8E 33         [ 4] 4337         CALL     CR
      0098C1 CD 85 D8         [ 4] 4338         CALL     CNTXT   ;only in context
      0098C4 CD 83 F1         [ 4] 4339 WORS1:  CALL     AT
      0098C7 CD 86 2F         [ 4] 4340         CALL     QDUP    ;?at end of list
      0098CA CD 83 9C         [ 4] 4341         CALL     QBRAN
      0098CD 98 E3                 4342         .word      WORS2
      0098CF CD 84 98         [ 4] 4343         CALL     DUPP
      0098D2 CD 8D EB         [ 4] 4344         CALL     SPACE
      0098D5 CD 98 94         [ 4] 4345         CALL     DOTID   ;display a name
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



      0098D8 CD 89 43         [ 4] 4346         CALL     CELLM
      0098DB CD 83 B3         [ 4] 4347         CALL     BRAN
      0098DE 98 C4                 4348         .word      WORS1
      0098E0 CD 84 8E         [ 4] 4349         CALL     DROP
      0098E3 81               [ 4] 4350 WORS2:  RET
                                   4351 
                                   4352         
                                   4353 ;; Hardware reset
                                   4354 
                                   4355 ;       hi      ( -- )
                                   4356 ;       Display sign-on message.
      0098E4 98 B8                 4357         .word      LINK
                           001866  4358 LINK = . 
      0098E6 02                    4359         .byte      2
      0098E7 68 69                 4360         .ascii     "hi"
      0098E9                       4361 HI:
      0098E9 CD 8E 33         [ 4] 4362         CALL     CR
      0098EC CD 8E 72         [ 4] 4363         CALL     DOTQP   ;initialize I/O
      0098EF 0F                    4364         .byte      15
      0098F0 73 74 6D 38 65 46 6F  4365         .ascii     "stm8eForth v"
             72 74 68 20 76
      0098FC 33                    4366 	.byte      VER+'0'
      0098FD 2E                    4367         .byte      '.' 
      0098FE 30                    4368 	.byte      EXT+'0' ;version
      0098FF CC 8E 33         [ 2] 4369         JP     CR
                                   4370 
                           000000  4371 WANT_DEBUG=0
                           000000  4372 .if WANT_DEBUG 
                                   4373 ;       DEBUG      ( -- )
                                   4374 ;       Display sign-on message.
                                   4375 ;        .word      LINK
                                   4376 LINK = . 
                                   4377         .byte      5
                                   4378         .ascii     "DEBUG"
                                   4379 DEBUG:
                                   4380 	CALL DOLIT
                                   4381 	.word 0x65
                                   4382 	CALL EMIT
                                   4383 	CALL DOLIT
                                   4384 	.word 0
                                   4385  	CALL ZLESS 
                                   4386 	CALL DOLIT
                                   4387 	.word 0xFFFE
                                   4388 	CALL ZLESS 
                                   4389 	CALL UPLUS 
                                   4390  	CALL DROP 
                                   4391 	CALL DOLIT
                                   4392 	.word 3
                                   4393 	CALL UPLUS 
                                   4394 	CALL UPLUS 
                                   4395  	CALL DROP
                                   4396 	CALL DOLIT
                                   4397 	.word 0x43
                                   4398 	CALL UPLUS 
                                   4399  	CALL DROP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



                                   4400 	CALL EMIT
                                   4401 	CALL DOLIT
                                   4402 	.word 0x4F
                                   4403 	CALL DOLIT
                                   4404 	.word 0x6F
                                   4405  	CALL XORR
                                   4406 	CALL DOLIT
                                   4407 	.word 0xF0
                                   4408  	CALL ANDD
                                   4409 	CALL DOLIT
                                   4410 	.word 0x4F
                                   4411  	CALL ORR
                                   4412 	CALL EMIT
                                   4413 	CALL DOLIT
                                   4414 	.word 8
                                   4415 	CALL DOLIT
                                   4416 	.word 6
                                   4417  	CALL SWAPP
                                   4418 	CALL OVER
                                   4419 	CALL XORR
                                   4420 	CALL DOLIT
                                   4421 	.word 3
                                   4422 	CALL ANDD 
                                   4423 	CALL ANDD
                                   4424 	CALL DOLIT
                                   4425 	.word 0x70
                                   4426 	CALL UPLUS 
                                   4427 	CALL DROP
                                   4428 	CALL EMIT
                                   4429 	CALL DOLIT
                                   4430 	.word 0
                                   4431 	CALL QBRAN
                                   4432 	.word DEBUG1
                                   4433 	CALL DOLIT
                                   4434 	.word 0x3F
                                   4435 DEBUG1:
                                   4436 	CALL DOLIT
                                   4437 	.word 0xFFFF
                                   4438 	CALL QBRAN
                                   4439 	.word DEBUG2
                                   4440 	CALL DOLIT
                                   4441 	.word 0x74
                                   4442 	CALL BRAN
                                   4443 	.word DEBUG3
                                   4444 DEBUG2:
                                   4445 	CALL DOLIT
                                   4446 	.word 0x21
                                   4447 DEBUG3:
                                   4448 	CALL EMIT
                                   4449 	CALL DOLIT
                                   4450 	.word 0x68
                                   4451 	CALL DOLIT
                                   4452 	.word 0x80
                                   4453 	CALL STORE
                                   4454 	CALL DOLIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



                                   4455 	.word 0x80
                                   4456 	CALL AT
                                   4457 	CALL EMIT
                                   4458 	CALL DOLIT
                                   4459 	.word 0x4D
                                   4460 	CALL TOR
                                   4461 	CALL RAT
                                   4462 	CALL RFROM
                                   4463 	CALL ANDD
                                   4464 	CALL EMIT
                                   4465 	CALL DOLIT
                                   4466 	.word 0x61
                                   4467 	CALL DOLIT
                                   4468 	.word 0xA
                                   4469 	CALL TOR
                                   4470 DEBUG4:
                                   4471 	CALL DOLIT
                                   4472 	.word 1
                                   4473 	CALL UPLUS 
                                   4474 	CALL DROP
                                   4475 	CALL DONXT
                                   4476 	.word DEBUG4
                                   4477 	CALL EMIT
                                   4478 	CALL DOLIT
                                   4479 	.word 0x656D
                                   4480 	CALL DOLIT
                                   4481 	.word 0x100
                                   4482 	CALL UMSTA
                                   4483 	CALL SWAPP
                                   4484 	CALL DOLIT
                                   4485 	.word 0x100
                                   4486 	CALL UMSTA
                                   4487 	CALL SWAPP 
                                   4488 	CALL DROP
                                   4489 	CALL EMIT
                                   4490 	CALL EMIT
                                   4491 	CALL DOLIT
                                   4492 	.word 0x2043
                                   4493 	CALL DOLIT
                                   4494 	.word 0
                                   4495 	CALL DOLIT
                                   4496 	.word 0x100
                                   4497 	CALL UMMOD
                                   4498 	CALL EMIT
                                   4499 	CALL EMIT
                                   4500 	;JP ORIG
                                   4501 	RET
                                   4502 .endif ; WANT_DEBUG 
                                   4503 
                                   4504 
                                   4505 ;       'BOOT   ( -- a )
                                   4506 ;       The application startup vector.
      009902 98 E6                 4507         .word      LINK
                           001884  4508 LINK = . 
      009904 05                    4509         .byte      5
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



      009905 27 42 4F 4F 54        4510         .ascii     "'BOOT"
      00990A                       4511 TBOOT:
      00990A CD 85 45         [ 4] 4512         CALL     DOVAR
      00990D 40 02                 4513         .word    APP_RUN      ;application to boot
                                   4514 
                                   4515 ;       COLD    ( -- )
                                   4516 ;       The hilevel cold start s=ence.
      00990F 99 04                 4517         .word      LINK
                           001891  4518         LINK = . 
      009911 04                    4519         .byte      4
      009912 43 4F 4C 44           4520         .ascii     "COLD"
      009916                       4521 COLD:
                           000000  4522 .if WANT_DEBUG
                                   4523         CALL DEBUG
                                   4524 .endif 
      009916 CD 83 69         [ 4] 4525 COLD1:  CALL     DOLIT
      009919 80 A7                 4526         .word      UZERO
      00991B CD 83 69         [ 4] 4527 	CALL     DOLIT
      00991E 00 06                 4528         .word      UPP
      009920 CD 83 69         [ 4] 4529         CALL     DOLIT
      009923 00 1A                 4530 	.word      UEND-UZERO
      009925 CD 8B 07         [ 4] 4531         CALL     CMOVE   ;initialize user area
                                   4532 
                           000001  4533 .if PICATOUT_MOD
                                   4534 ; if APP_RUN==0 initialize with ca de 'hi'  
      009928 90 CE 40 02      [ 2] 4535         ldw y,APP_RUN 
      00992C 26 0B            [ 1] 4536         jrne 0$
      00992E 1D 00 02         [ 2] 4537         subw x,#CELLL 
      009931 90 AE 98 E9      [ 2] 4538         ldw y,#HI  
      009935 FF               [ 2] 4539         ldw (x),y
      009936 CD 9A 31         [ 4] 4540         call UPDATRUN 
      009939                       4541 0$:        
                                   4542 ; update LAST with APP_LAST 
                                   4543 ; if APP_LAST > LAST else do the opposite
      009939 90 CE 40 00      [ 2] 4544         ldw y,APP_LAST 
      00993D 90 B3 1A         [ 2] 4545         cpw y,ULAST 
      009940 22 05            [ 1] 4546         jrugt 1$ 
                                   4547 ; save LAST at APP_LAST  
      009942 CD 9A 19         [ 4] 4548         call UPDATLAST 
      009945 20 06            [ 2] 4549         jra 2$
      009947                       4550 1$: ; update LAST with APP_LAST 
      009947 90 BF 1A         [ 2] 4551         ldw ULAST,y
      00994A 90 BF 14         [ 2] 4552         ldw UCNTXT,y 
      00994D                       4553 2$:  
                                   4554 ; update APP_CP if < app_space 
      00994D 90 CE 40 04      [ 2] 4555         ldw y,APP_CP  
      009951 90 B3 18         [ 2] 4556         cpw y,UCP   
      009954 24 06            [ 1] 4557         jruge 3$ 
      009956 CD 9A 42         [ 4] 4558         call UPDATCP
      009959 90 BE 18         [ 2] 4559         ldw y,UCP   
      00995C                       4560 3$:
      00995C 90 BF 18         [ 2] 4561         ldw UCP,y                 
                                   4562 ; update UVP with APP_VP  
                                   4563 ; if APP_VP>UVP else do the opposite 
      00995F 90 CE 40 06      [ 2] 4564         ldw y,APP_VP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



      009963 90 B3 16         [ 2] 4565         cpw y,UVP 
      009966 22 05            [ 1] 4566         jrugt 4$
      009968 CD 9A 59         [ 4] 4567         call UPDATVP 
      00996B 20 03            [ 2] 4568         jra 6$
      00996D                       4569 4$: ; update UVP with APP_VP 
      00996D 90 BF 16         [ 2] 4570         ldw UVP,y 
      009970                       4571 6$:      
                                   4572 .endif ; PICATOUT_MOD
      009970 CD 93 36         [ 4] 4573         CALL     PRESE   ;initialize data stack and TIB
      009973 CD 99 0A         [ 4] 4574         CALL     TBOOT
      009976 CD 8A F0         [ 4] 4575         CALL     ATEXE   ;application boot
      009979 CD 95 FF         [ 4] 4576         CALL     OVERT
      00997C CC 93 53         [ 2] 4577         JP     QUIT    ;start interpretation
                                   4578 
                           000001  4579 .if PICATOUT_MOD
                                   4580         ; keep this include at end 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



                                   4581         .include "flash.asm"
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
      00997F 99 11                   30     .word LINK 
                           001901    31     LINK=.
      009981 03                      32     .byte 3 
      009982 46 50 21                33     .ascii "FP!"
      009985                         34 fptr_store:
      009985 90 93            [ 1]   35     ldw y,x
      009987 90 FE            [ 2]   36     ldw y,(y)
      009989 90 9F            [ 1]   37     ld a,yl 
      00998B B7 30            [ 1]   38     ld FPTR,a 
      00998D 1C 00 02         [ 2]   39     addw x,#CELLL 
      009990 90 93            [ 1]   40     ldw y,x 
      009992 90 FE            [ 2]   41     ldw y,(y)
      009994 90 BF 31         [ 2]   42     ldw PTR16,y
      009997 1C 00 02         [ 2]   43     addw x,#CELLL 
      00999A 81               [ 4]   44     ret 
                                     45 
                                     46 ;-----------------------------------
                                     47 ; return EEPROM base address 
                                     48 ; as a double 
                                     49 ;  EEPROM  ( -- ud )
                                     50 ;-----------------------------------
      00999B 99 81                   51     .word LINK 
                           00191D    52 LINK=.
      00999D 06                      53     .byte 6 
      00999E 45 45 50 52 4F 4D       54     .ascii "EEPROM"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



      0099A4                         55 EEPROM: 
      0099A4 90 AE 40 00      [ 2]   56     ldw y,#EEPROM_BASE
      0099A8 1D 00 04         [ 2]   57     subw x,#2*CELLL 
      0099AB EF 02            [ 2]   58     ldw (2,x),y 
      0099AD 90 5F            [ 1]   59     clrw y 
      0099AF FF               [ 2]   60     ldw (x),y 
      0099B0 81               [ 4]   61     ret
                                     62 
                                     63 ;---------------------------------
                                     64 ; return APP_LAST pointer as double
                                     65 ; EEP-LAST ( -- ud )
                                     66 ;---------------------------------
      0099B1 99 9D                   67 	.word LINK 
                           001933    68 	LINK=.
      0099B3 08                      69 	.byte 8 
      0099B4 45 45 50 2D 4C 41 53    70 	.ascii "EEP-LAST"
             54
      0099BC                         71 EEPLAST:
      0099BC 1D 00 04         [ 2]   72 	subw x,#2*CELLL 
      0099BF 90 AE 40 00      [ 2]   73 	ldw y,#APP_LAST 
      0099C3 EF 02            [ 2]   74 	ldw (2,x),y 
      0099C5 90 5F            [ 1]   75 	clrw y 
      0099C7 FF               [ 2]   76 	ldw (x),y 
      0099C8 81               [ 4]   77 	ret 
                                     78 
                                     79 ;----------------------------------
                                     80 ; return APP_RUN pointer as double	
                                     81 ; EEP-RUN ( -- ud )
                                     82 ;-----------------------------------
      0099C9 99 B3                   83 	.word LINK 
                           00194B    84 	LINK=.
      0099CB 07                      85 	.byte 7
      0099CC 45 45 50 2D 52 55 4E    86 	.ascii "EEP-RUN"
      0099D3                         87 EEPRUN:
      0099D3 1D 00 04         [ 2]   88 	subw x,#2*CELLL 
      0099D6 90 AE 40 02      [ 2]   89 	ldw y,#APP_RUN 
      0099DA EF 02            [ 2]   90 	ldw (2,x),y 
      0099DC 90 5F            [ 1]   91 	clrw y 
      0099DE FF               [ 2]   92 	ldw (x),y 
      0099DF 81               [ 4]   93 	ret 
                                     94 
                                     95 ;------------------------------------
                                     96 ; return APP_CP pointer as double 
                                     97 ; EEP-CP ( -- ud )
                                     98 ;------------------------------------
      0099E0 99 CB                   99 	.word LINK
                           001962   100 	LINK=.
      0099E2 06                     101 	.byte 6 
      0099E3 45 45 50 2D 43 50      102 	.ascii "EEP-CP"
      0099E9                        103 EEPCP:
      0099E9 1D 00 04         [ 2]  104 	subw x,#2*CELLL 
      0099EC 90 AE 40 04      [ 2]  105 	ldw y,#APP_CP  
      0099F0 EF 02            [ 2]  106 	ldw (2,x),y 
      0099F2 90 5F            [ 1]  107 	clrw y 
      0099F4 FF               [ 2]  108 	ldw (x),y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



      0099F5 81               [ 4]  109 	ret 
                                    110 
                                    111 ;------------------------------------
                                    112 ; return APP_VP pointer as double 
                                    113 ; EEP-VP ( -- ud )
                                    114 ;-------------------------------------
      0099F6 99 E2                  115 	.word LINK
                           001978   116 	LINK=.
      0099F8 06                     117 	.byte 6
      0099F9 45 45 50 2D 56 50      118 	.ascii "EEP-VP"
      0099FF                        119 EEPVP:
      0099FF 1D 00 04         [ 2]  120 	subw x,#2*CELLL 
      009A02 90 AE 40 06      [ 2]  121 	ldw y,#APP_VP  
      009A06 EF 02            [ 2]  122 	ldw (2,x),y 
      009A08 90 5F            [ 1]  123 	clrw y 
      009A0A FF               [ 2]  124 	ldw (x),y 
      009A0B 81               [ 4]  125 	ret 
                                    126 
                                    127 ;----------------------------------
                                    128 ; update APP_LAST with LAST 
                                    129 ; UPDAT-LAST ( -- )
                                    130 ;----------------------------------
      009A0C 99 F8                  131 	.word LINK 
                           00198E   132 	LINK=.
      009A0E 0A                     133 	.byte 10
      009A0F 55 50 44 41 54 2D 4C   134 	.ascii "UPDAT-LAST"
             41 53 54
      009A19                        135 UPDATLAST:
      009A19 CD 86 04         [ 4]  136 	call LAST
      009A1C CD 83 F1         [ 4]  137 	call AT  
      009A1F CD 99 BC         [ 4]  138 	call EEPLAST
      009A22 CC 9B 95         [ 2]  139 	jp ee_store 
                                    140 
                                    141 ;---------------------------------
                                    142 ; update APP_RUN 
                                    143 ; UPDAT-RUN ( a -- )
                                    144 ;---------------------------------
      009A25 9A 0E                  145 	.word LINK
                           0019A7   146 	LINK=.
      009A27 09                     147 	.byte 9
      009A28 55 50 44 41 54 2D 52   148 	.ascii "UPDAT-RUN"
             55 4E
      009A31                        149 UPDATRUN:
      009A31 CD 99 D3         [ 4]  150 	call EEPRUN
      009A34 CC 9B 95         [ 2]  151 	jp ee_store 
                                    152 	
                                    153 ;---------------------------------
                                    154 ; update APP_CP with CP 
                                    155 ; UPDAT-CP ( -- )
                                    156 ;---------------------------------
      009A37 9A 27                  157 	.word LINK 
                           0019B9   158 	LINK=.
      009A39 08                     159 	.byte 8 
      009A3A 55 50 44 41 54 2D 43   160 	.ascii "UPDAT-CP"
             50
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



      009A42                        161 UPDATCP:
      009A42 CD 85 F4         [ 4]  162 	call CPP 
      009A45 CD 83 F1         [ 4]  163 	call AT 
      009A48 CD 99 E9         [ 4]  164 	call EEPCP 
      009A4B CC 9B 95         [ 2]  165 	jp ee_store 
                                    166 
                                    167 ;----------------------------------
                                    168 ; update APP_VP with VP 
                                    169 ; UPDAT-VP ( -- )
                                    170 ;----------------------------------
      009A4E 9A 39                  171 	.word LINK
                           0019D0   172 	LINK=.
      009A50 08                     173 	.byte 8 
      009A51 55 50 44 41 54 2D 56   174 	.ascii "UPDAT-VP" 
             50
      009A59                        175 UPDATVP:
      009A59 CD 85 E6         [ 4]  176 	call VPP 
      009A5C CD 83 F1         [ 4]  177 	call AT
      009A5F CD 99 FF         [ 4]  178 	call EEPVP 
      009A62 CC 9B 95         [ 2]  179 	jp ee_store
                                    180 	
                                    181 
                                    182 ;----------------------------------
                                    183 ; fetch integer at address over 65535
                                    184 ;  F@   ( ud -- n )
                                    185 ;----------------------------------
      009A65 9A 50                  186     .word LINK 
                           0019E7   187 LINK=.
      009A67 02                     188     .byte 2
      009A68 46 40                  189     .ascii "F@"
      009A6A                        190 farat:
      009A6A CD 99 85         [ 4]  191     call fptr_store
      009A6D 92 BC 00 30      [ 5]  192     ldf a,[FPTR]
      009A71 1D 00 02         [ 2]  193     subw x,#CELLL 
      009A74 F7               [ 1]  194     ld (x),a 
      009A75 90 AE 00 01      [ 2]  195     ldw y,#1
      009A79 91 AF 00 30      [ 1]  196     ldf a,([FPTR],y)
      009A7D E7 01            [ 1]  197     ld (1,x),a
      009A7F 81               [ 4]  198     ret 
                                    199 
                                    200 ;-------------------------------------
                                    201 ; fetch C at address over 65535 
                                    202 ; FC@ ( ud -- c)
                                    203 ;-------------------------------------
      009A80 9A 67                  204     .word LINK
                           001A02   205     LINK=.
      009A82 03                     206     .byte 3 
      009A83 46 43 40               207     .ascii "FC@" 
      009A86                        208 farcat:
      009A86 CD 99 85         [ 4]  209     call fptr_store 
      009A89 92 BC 00 30      [ 5]  210     ldf a,[FPTR]
      009A8D 1D 00 02         [ 2]  211     subw x,#CELLL 
      009A90 E7 01            [ 1]  212     ld (1,x),a 
      009A92 7F               [ 1]  213     clr (x)
      009A93 81               [ 4]  214     ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



                                    215     
                                    216 ;----------------------------------
                                    217 ; unlock EEPROM/OPT for writing/erasing
                                    218 ; wait endlessly for FLASH_IAPSR_DUL bit.
                                    219 ;  UNLKEE   ( -- )
                                    220 ;----------------------------------
      009A94 9A 82                  221     .word LINK 
                           001A16   222 LINK=.
      009A96 06                     223     .byte 6 
      009A97 55 4E 4C 4B 45 45      224     .ascii "UNLKEE"
      009A9D                        225 unlock_eeprom:
      009A9D 35 00 50 5B      [ 1]  226 	mov FLASH_CR2,#0 
      009AA1 35 FF 50 5C      [ 1]  227 	mov FLASH_NCR2,#0xFF 
      009AA5 35 AE 50 64      [ 1]  228 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      009AA9 35 56 50 64      [ 1]  229     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      009AAD 72 07 50 5F FB   [ 2]  230 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      009AB2 81               [ 4]  231 	ret
                                    232 
                                    233 ;----------------------------------
                                    234 ; unlock FLASH for writing/erasing
                                    235 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                    236 ; UNLKFL  ( -- )
                                    237 ;----------------------------------
      009AB3 9A 96                  238     .word LINK 
                           001A35   239 LINK=. 
      009AB5 06                     240     .byte 6 
      009AB6 55 4E 4C 4B 46 4C      241     .ascii "UNLKFL"    
      009ABC                        242 unlock_flash:
      009ABC 35 00 50 5B      [ 1]  243 	mov FLASH_CR2,#0 
      009AC0 35 FF 50 5C      [ 1]  244 	mov FLASH_NCR2,#0xFF 
      009AC4 35 56 50 62      [ 1]  245 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      009AC8 35 AE 50 62      [ 1]  246 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      009ACC 72 03 50 5F FB   [ 2]  247 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      009AD1 81               [ 4]  248 	ret
                                    249 
                                    250 ;-----------------------------
                                    251 ; unlock FLASH or EEPROM 
                                    252 ; according to FPTR address 
                                    253 ;  UNLOCK ( -- )
                                    254 ;-----------------------------
      009AD2 9A B5                  255 	.word LINK 
                           001A54   256 	LINK=.
      009AD4 06                     257 	.byte 6
      009AD5 55 4E 4C 4F 43 4B      258 	.ascii "UNLOCK"
      009ADB                        259 unlock:
                                    260 ; put addr[15:0] in Y, for bounds check.
      009ADB 90 BE 31         [ 2]  261 	ldw y,PTR16   ; Y=addr15:0
                                    262 ; check addr[23:16], if <> 0 then it is extened flash memory
      009ADE 3D 30            [ 1]  263 	tnz FPTR 
      009AE0 26 16            [ 1]  264 	jrne 4$
      009AE2 90 A3 80 00      [ 2]  265     cpw y,#FLASH_BASE
      009AE6 24 10            [ 1]  266     jruge 4$
      009AE8 90 A3 40 00      [ 2]  267 	cpw y,#EEPROM_BASE  
      009AEC 25 0D            [ 1]  268     jrult 9$
      009AEE 90 A3 48 7F      [ 2]  269 	cpw y,#OPTION_END 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



      009AF2 22 07            [ 1]  270 	jrugt 9$
      009AF4 CD 9A 9D         [ 4]  271 	call unlock_eeprom
      009AF7 81               [ 4]  272 	ret 
      009AF8 CD 9A BC         [ 4]  273 4$: call unlock_flash
      009AFB 81               [ 4]  274 9$: ret 
                                    275 
                                    276 ;-------------------------
                                    277 ; lock write access to 
                                    278 ; FLASH and EEPROM 
                                    279 ; LOCK ( -- )
                                    280 ;-------------------------
      009AFC 9A D4                  281 	.word LINK 
                           001A7E   282 	LINK=.
      009AFE 04                     283 	.byte 4 
      009AFF 4C 4F 43 4B            284 	.ascii "LOCK" 
      009B03                        285 lock: 
      009B03 72 13 50 5F      [ 1]  286 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      009B07 72 17 50 5F      [ 1]  287 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009B0B 81               [ 4]  288 	ret 
                                    289 
                                    290 ;-------------------------
                                    291 ; increment FPTR 
                                    292 ; INC-FPTR ( -- )
                                    293 ;-------------------------
      009B0C 9A FE                  294 	.word LINK 
                           001A8E   295 	LINK=. 
      009B0E 08                     296 	.byte 8 
      009B0F 49 4E 43 2D 46 50 54   297 	.ascii "INC-FPTR" 
             52
      009B17                        298 inc_fptr:
      009B17 3C 32            [ 1]  299 	inc PTR8 
      009B19 26 08            [ 1]  300 	jrne 1$
      009B1B 90 BE 30         [ 2]  301 	ldw y,FPTR 
      009B1E 90 5C            [ 2]  302 	incw y 
      009B20 90 BF 30         [ 2]  303 	ldw FPTR,y 
      009B23 81               [ 4]  304 1$: ret 
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
      009B24 9B 0E                  315 	.word LINK 
                           001AA6   316 	LINK=. 
      009B26 07                     317 	.byte 7 
      009B27 57 52 2D 42 59 54 45   318 	.ascii "WR-BYTE" 
                                    319 
      009B2E                        320 write_byte:
      009B2E 90 93            [ 1]  321 	ldw y,x 
      009B30 90 FE            [ 2]  322 	ldw y,(y)
      009B32 1C 00 02         [ 2]  323 	addw x,#CELLL 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



      009B35 90 9F            [ 1]  324 	ld a,yl
      009B37 92 BD 00 30      [ 4]  325 	ldf [FPTR],a
      009B3B 72 05 50 5F FB   [ 2]  326 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009B40 20 D5            [ 2]  327 	jra inc_fptr 
                                    328 
                                    329 
                                    330 
                                    331 ;---------------------------------------
                                    332 ; write a byte to FLASH or EEPROM/OPTION  
                                    333 ; EEC!  (c ud -- )
                                    334 ;---------------------------------------
      009B42 9B 26                  335     .word LINK 
                           001AC4   336 	LINK=.
      009B44 04                     337     .byte 4 
      009B45 45 45 43 21            338     .ascii "EEC!"
                                    339 	; local variables 
                           000001   340 	BTW = 1   ; byte to write offset on stack
                           000002   341     OPT = 2 
                           000002   342 	VSIZE = 2
      009B49                        343 ee_cstore:
      009B49 52 02            [ 2]  344 	sub sp,#VSIZE
      009B4B CD 99 85         [ 4]  345     call fptr_store
      009B4E E6 01            [ 1]  346 	ld a,(1,x)
      009B50 43               [ 1]  347 	cpl a 
      009B51 6B 01            [ 1]  348 	ld (BTW,sp),a ; byte to write 
      009B53 0F 02            [ 1]  349 	clr (OPT,sp)  ; OPTION flag
      009B55 CD 9A DB         [ 4]  350 	call unlock 
                                    351 	; check if option
      009B58 3D 30            [ 1]  352 	tnz FPTR 
      009B5A 26 19            [ 1]  353 	jrne 2$
      009B5C 90 BE 31         [ 2]  354 	ldw y,PTR16 
      009B5F 90 A3 48 00      [ 2]  355 	cpw y,#OPTION_BASE
      009B63 2B 10            [ 1]  356 	jrmi 2$
      009B65 90 A3 48 80      [ 2]  357 	cpw y,#OPTION_END+1
      009B69 2A 0A            [ 1]  358 	jrpl 2$
      009B6B 03 02            [ 1]  359 	cpl (OPT,sp)
                                    360 	; OPTION WRITE require this unlock 
      009B6D 72 1E 50 5B      [ 1]  361     bset FLASH_CR2,#FLASH_CR2_OPT
      009B71 72 1F 50 5C      [ 1]  362     bres FLASH_NCR2,#FLASH_CR2_OPT 
      009B75                        363 2$: 
      009B75 CD 9B 2E         [ 4]  364 	call write_byte 	
      009B78 0D 02            [ 1]  365 	tnz (OPT,sp)
      009B7A 27 0D            [ 1]  366 	jreq 3$ 
      009B7C 7B 01            [ 1]  367     ld a,(BTW,sp)
      009B7E 90 5F            [ 1]  368     clrw y
      009B80 90 97            [ 1]  369 	ld yl,a 
      009B82 1D 00 02         [ 2]  370 	subw x,#CELLL 
      009B85 FF               [ 2]  371 	ldw (x),y 
      009B86 CD 9B 2E         [ 4]  372 	call write_byte
      009B89                        373 3$: 
      009B89 CD 9B 03         [ 4]  374 	call lock 
      009B8C 5B 02            [ 2]  375 	addw sp,#VSIZE 
      009B8E 81               [ 4]  376     ret
                                    377 
                                    378 ;------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



                                    379 ; write integer in FLASH|EEPROM
                                    380 ; EE! ( n ud -- )
                                    381 ;------------------------------
      009B8F 9B 44                  382 	.word LINK 
                           001B11   383 	LINK=.
      009B91 03                     384 	.byte 3 
      009B92 45 45 21               385 	.ascii "EE!"
      009B95                        386 ee_store:
      009B95 CD 99 85         [ 4]  387 	call fptr_store 
      009B98 CD 9A DB         [ 4]  388 	call unlock 
      009B9B 90 93            [ 1]  389 	ldw y,x 
      009B9D 90 FE            [ 2]  390 	ldw y,(y)
      009B9F 90 89            [ 2]  391 	pushw y 
      009BA1 90 5E            [ 1]  392 	swapw y 
      009BA3 FF               [ 2]  393 	ldw (x),y 
      009BA4 CD 9B 2E         [ 4]  394 	call write_byte 
      009BA7 90 85            [ 2]  395 	popw y 
      009BA9 1D 00 02         [ 2]  396 	subw x,#CELLL
      009BAC FF               [ 2]  397 	ldw (x),y 
      009BAD CD 9B 2E         [ 4]  398 	call write_byte
      009BB0 CC 9B 03         [ 2]  399 	jp lock 
                                    400 
                                    401 
                                    402 ;----------------------------
                                    403 ; Erase flash memory row 
                                    404 ; stm8s208 as 128 bytes rows
                                    405 ; ROW-ERASE ( ud -- )
                                    406 ;----------------------------
      009BB3 9B 91                  407 	.word LINK 
                           001B35   408 	LINK=. 
      009BB5 09                     409 	.byte 9 
      009BB6 52 4F 57 2D 45 52 41   410 	.ascii "ROW-ERASE" 
             53 45
      009BBF                        411 row_erase:
      009BBF CD 99 85         [ 4]  412 	call fptr_store
                                    413 ;code must be execute from RAM 
                                    414 ;copy routine to PAD 
      009BC2 1D 00 02         [ 2]  415 	subw x,#CELLL 
      009BC5 90 AE 9C 0C      [ 2]  416 	ldw y,#row_erase_proc
      009BC9 FF               [ 2]  417 	ldw (x),y 
      009BCA CD 8A CB         [ 4]  418 	call PAD 
      009BCD 90 AE 9C 33      [ 2]  419 	ldw y,#row_erase_proc_end 
      009BD1 72 A2 9C 0C      [ 2]  420 	subw y,#row_erase_proc
      009BD5 1D 00 02         [ 2]  421 	subw x,#CELLL 
      009BD8 FF               [ 2]  422 	ldw (x),y 
      009BD9 CD 8B 07         [ 4]  423 	call CMOVE 
      009BDC                        424 block_erase:
      009BDC 90 BE 31         [ 2]  425 	ldw y,FPTR+1
      009BDF 90 A3 A0 80      [ 2]  426 	cpw y,#app_space 
      009BE3 2A 13            [ 1]  427 	jrpl erase_flash 
                                    428 ; erase EEPROM block
      009BE5 90 A3 40 00      [ 2]  429 	cpw y,#EEPROM_BASE 
      009BE9 24 01            [ 1]  430 	jruge 1$
      009BEB 81               [ 4]  431 	ret ; bad address 
      009BEC 90 A3 47 FF      [ 2]  432 1$: cpw y,#EEPROM_END 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



      009BF0 23 01            [ 2]  433 	jrule 2$ 
      009BF2 81               [ 4]  434 	ret ; bad address 
      009BF3                        435 2$:	
      009BF3 CD 9A 9D         [ 4]  436 	call unlock_eeprom 
      009BF6 20 03            [ 2]  437 	jra proceed_erase
                                    438 ; erase flash block:
      009BF8                        439 erase_flash:
      009BF8 CD 9A BC         [ 4]  440 	call unlock_flash 
      009BFB                        441 proceed_erase:
      009BFB CD 8A CB         [ 4]  442 	call PAD 
      009BFE 90 93            [ 1]  443 	ldw y,x
      009C00 90 FE            [ 2]  444 	ldw y,(y)
      009C02 1C 00 02         [ 2]  445 	addw x,#CELLL  
      009C05 90 FD            [ 4]  446 	call (y) 
      009C07 72 17 50 5F      [ 1]  447 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009C0B 81               [ 4]  448 	ret 
                                    449 
                                    450 ; this routine is to be copied to PAD 
      009C0C                        451 row_erase_proc:
      009C0C 35 20 50 5B      [ 1]  452 	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
      009C10 35 DF 50 5C      [ 1]  453 	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
      009C14 4F               [ 1]  454 	clr a 
      009C15 90 5F            [ 1]  455 	clrw y 
      009C17 91 A7 00 30      [ 1]  456 	ldf ([FPTR],y),a
      009C1B 90 5C            [ 2]  457     incw y
      009C1D 91 A7 00 30      [ 1]  458 	ldf ([FPTR],y),a
      009C21 90 5C            [ 2]  459     incw y
      009C23 91 A7 00 30      [ 1]  460 	ldf ([FPTR],y),a
      009C27 90 5C            [ 2]  461     incw y
      009C29 91 A7 00 30      [ 1]  462 	ldf ([FPTR],y),a
      009C2D 72 05 50 5F FB   [ 2]  463 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009C32 81               [ 4]  464 	ret
      009C33                        465 row_erase_proc_end:
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
      009C33                        478 copy_buffer:
      009C33 4B 80            [ 1]  479 	push #BLOCK_SIZE  
                                    480 ;enable block programming 
      009C35 72 10 50 5B      [ 1]  481 	bset FLASH_CR2,#FLASH_CR2_PRG 
      009C39 72 11 50 5C      [ 1]  482 	bres FLASH_NCR2,#FLASH_CR2_PRG
      009C3D 90 5F            [ 1]  483 	clrw y
      009C3F F6               [ 1]  484 1$:	ld a,(x)
      009C40 91 A7 00 30      [ 1]  485 	ldf ([FPTR],y),a
      009C44 5C               [ 2]  486 	incw x 
      009C45 90 5C            [ 2]  487 	incw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



      009C47 0A 01            [ 1]  488 	dec (BCNT,sp)
      009C49 26 F4            [ 1]  489 	jrne 1$
                                    490 ; wait EOP bit 
      009C4B 72 05 50 5F FB   [ 2]  491 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. 
      009C50 84               [ 1]  492 	pop a ; remove BCNT from stack 
      009C51 81               [ 4]  493 	ret 
      009C52                        494 copy_buffer_end:
                                    495 
                                    496 ;-------------------------
                                    497 ; move program_row to RAM 
                                    498 ; in TIB 
                                    499 ;------------------------
      009C52                        500 copy_prog_to_ram:
      009C52 1D 00 06         [ 2]  501 	subw x,#6
      009C55 90 AE 9C 33      [ 2]  502 	ldw y,#copy_buffer 
      009C59 EF 04            [ 2]  503 	ldw (4,x),y 
      009C5B 90 AE 17 00      [ 2]  504 	ldw y,#TIBBASE
      009C5F EF 02            [ 2]  505 	ldw (2,x),y 
      009C61 90 AE 9C 52      [ 2]  506 	ldw y,#copy_buffer_end 
      009C65 72 A2 9C 33      [ 2]  507 	subw y,#copy_buffer  
      009C69 FF               [ 2]  508 	ldw (x),y 
      009C6A CD 8B 07         [ 4]  509 	call CMOVE 
      009C6D 81               [ 4]  510 	ret 
                                    511 
                                    512 
                                    513 ;-----------------------------
                                    514 ; write a row in FLASH/EEPROM 
                                    515 ; WR-ROW ( a ud -- )
                                    516 ; a -> address 128 byte buffer to write 
                                    517 ; ud ->  row address in FLASH|EEPROM 
                                    518 ;-----------------------------
      009C6E 9B B5                  519 	.word LINK 
                           001BF0   520 	LINK=.
      009C70 06                     521 	.byte 6 
      009C71 57 52 2D 52 4F 57      522 	.ascii "WR-ROW"
      009C77                        523 write_row:
      009C77 CD 99 85         [ 4]  524 	call fptr_store
                                    525 ; align to FLASH block 
      009C7A A6 80            [ 1]  526 	ld a,#0x80 
      009C7C B4 32            [ 1]  527 	and a,PTR8 
      009C7E B7 32            [ 1]  528 	ld PTR8,a  
      009C80 CD 9C 52         [ 4]  529 	call copy_prog_to_ram
      009C83 CD 9A DB         [ 4]  530 	call unlock
      009C86 90 93            [ 1]  531 	ldw y,x 
      009C88 90 FE            [ 2]  532 	ldw y,(y)
      009C8A 1C 00 02         [ 2]  533 	addw x,#CELLL 
      009C8D 89               [ 2]  534 	pushw x 
      009C8E 93               [ 1]  535 	ldw x,y ; buffer address in x 
      009C8F CD 17 00         [ 4]  536 	call TIBBASE
      009C92 CD 9B 03         [ 4]  537 	call lock
      009C95 85               [ 2]  538 	popw x 
      009C96 81               [ 4]  539 	ret 
                                    540 
                                    541 ;-------------------------------------
                                    542 ; change value of OPTION register 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



                                    543 ; SET-OPT (c n -- ) 
                                    544 ; c new value.
                                    545 ; n OPT  number {1..7}
                                    546 ;--------------------------------------
      009C97 9C 70                  547 		.word LINK 
                           001C19   548 		LINK=.
      009C99 07                     549 		.byte 7 
      009C9A 53 45 54 2D 4F 50 54   550 		.ascii "SET-OPT" 
      009CA1                        551 set_option: 
      009CA1 90 93            [ 1]  552 		ldw y,x 
      009CA3 90 FE            [ 2]  553 		ldw y,(y)
      009CA5 27 06            [ 1]  554 		jreq 1$
      009CA7 90 A3 00 07      [ 2]  555 		cpw y,#7 
      009CAB 23 04            [ 2]  556 		jrule 2$ 
                                    557 ; invalid OPTION number 		
      009CAD 1C 00 04         [ 2]  558 1$:		addw x,#2*CELLL
      009CB0 81               [ 4]  559 		ret
      009CB1 90 58            [ 2]  560 2$:		sllw y 
      009CB3 72 A9 47 FF      [ 2]  561 		addw y,#OPTION_BASE-1
      009CB7 FF               [ 2]  562 		ldw (x),y 
      009CB8 1D 00 02         [ 2]  563 		subw x,#CELLL 
      009CBB 90 5F            [ 1]  564 		clrw y 
      009CBD FF               [ 2]  565 		ldw (x),y 
      009CBE CD 9B 49         [ 4]  566 		call ee_cstore
      009CC1 81               [ 4]  567 		ret 
                                    568 
                                    569 
                                    570 
                                    571 ;--------------------------------------
                                    572 ; reset system to its original state 
                                    573 ; before any user modification
                                    574 ; PRISTINE ( -- )
                                    575 ;-------------------------------------
      009CC2 9C 99                  576 	.word LINK  
                           001C44   577 	LINK=.
      009CC4 08                     578 	.byte 8 
      009CC5 50 52 49 53 54 49 4E   579 	.ascii "PRISTINE"
             45
      009CCD                        580 pristine:
                                    581 ;;; erase EEPROM
      009CCD CD 99 A4         [ 4]  582 	call EEPROM 
      009CD0 CD 86 6B         [ 4]  583 1$:	call DDUP 
      009CD3 CD 9B BF         [ 4]  584 	call row_erase
      009CD6 90 93            [ 1]  585 	ldw y,x 
      009CD8 90 EE 02         [ 2]  586 	ldw y,(2,y)
      009CDB 72 A9 00 80      [ 2]  587 	addw y,#BLOCK_SIZE
      009CDF EF 02            [ 2]  588 	ldw (2,x),y
      009CE1 90 A3 48 00      [ 2]  589 	cpw y,#OPTION_BASE 
      009CE5 25 E9            [ 1]  590 	jrult 1$
                                    591 ;;; reset OPTION to default values
      009CE7 90 AE 00 01      [ 2]  592 	ldw y,#1 ; OPT1 
      009CEB FF               [ 2]  593 2$:	ldw (x),y   
      009CEC 90 5F            [ 1]  594 	clrw y 
      009CEE EF 02            [ 2]  595 	ldw (2,x),y  ; ( 0 1 -- ) 
      009CF0 CD 86 6B         [ 4]  596 	call DDUP    ; ( 0 1 0 1 -- )  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



      009CF3 CD 9C A1         [ 4]  597 	call set_option
      009CF6 90 93            [ 1]  598 	ldw y,x 
      009CF8 90 FE            [ 2]  599 	ldw y,(y)
      009CFA 90 5C            [ 2]  600 	incw y  ; next OPTION 
      009CFC 90 A3 00 08      [ 2]  601 	cpw y,#8 
      009D00 25 E9            [ 1]  602 	jrult 2$
                                    603 ;;; erase first row of app_space 	
      009D02 90 AE A0 80      [ 2]  604 	ldw y,#app_space
      009D06 EF 02            [ 2]  605 	ldw (2,x),y  
      009D08 90 5F            [ 1]  606 	clrw y 
      009D0A FF               [ 2]  607 	ldw (x),y ; ( app_space 0 -- )
      009D0B CD 9B BF         [ 4]  608 	call row_erase 
                                    609 ; reset interrupt vectors 
      009D0E 1D 00 02         [ 2]  610 	subw x,#CELLL 
      009D11 90 5F            [ 1]  611 	clrw y  
      009D13 FF               [ 2]  612 4$:	ldw (x),y  ; ( n -- ) int# 
      009D14 CD 84 98         [ 4]  613 	call DUPP  
      009D17 CD 9D 34         [ 4]  614 	call reset_vector
      009D1A 90 93            [ 1]  615 	ldw y,x 
      009D1C 90 FE            [ 2]  616 	ldw y,(y)
      009D1E 90 5C            [ 2]  617 	incw y   ; next vector 
      009D20 90 A3 00 19      [ 2]  618 	cpw y,#25 
      009D24 25 ED            [ 1]  619 	jrult 4$
      009D26 CC 80 80         [ 2]  620 	jp NonHandledInterrupt ; reset MCU
                                    621 
                                    622 ;------------------------------
                                    623 ; reset an interrupt vector 
                                    624 ; to its initial value 
                                    625 ; i.e. NonHandledInterrupt
                                    626 ; RST-IVEC ( n -- )
                                    627 ;-----------------------------
      009D29 9C C4                  628 	.word LINK 
                           001CAB   629 	LINK=. 
      009D2B 08                     630 	.byte 8 
      009D2C 52 53 54 2D 49 56 45   631 	.ascii "RST-IVEC"
             43
      009D34                        632 reset_vector:
      009D34 90 93            [ 1]  633 	ldw y,x
      009D36 1C 00 02         [ 2]  634 	addw x,#CELLL 
      009D39 90 FE            [ 2]  635 	ldw y,(y)
      009D3B 90 A3 00 17      [ 2]  636 	cpw y,#23 
      009D3F 27 3A            [ 1]  637 	jreq 9$
      009D41 90 A3 00 1D      [ 2]  638 	cpw y,#29 ; last vector
      009D45 22 34            [ 1]  639 	jrugt 9$  
      009D47 90 58            [ 2]  640 	sllw y 
      009D49 90 58            [ 2]  641 	sllw y 
      009D4B 72 A9 80 08      [ 2]  642 	addw y,#0x8008 ; irq0 address 
      009D4F 90 BF 22         [ 2]  643 	ldw YTEMP,y
      009D52 1D 00 06         [ 2]  644 	subw x,#3*CELLL 
      009D55 EF 02            [ 2]  645 	ldw (2,x),y 
      009D57 90 5F            [ 1]  646 	clrw y
      009D59 FF               [ 2]  647 	ldw (x),y 
      009D5A A6 82            [ 1]  648 	ld a,#0x82 
      009D5C 90 95            [ 1]  649 	ld yh,a
      009D5E EF 04            [ 2]  650 	ldw (4,x),y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



      009D60 CD 9B 95         [ 4]  651 	call ee_store
      009D63 1D 00 06         [ 2]  652 	subw x,#3*CELLL
      009D66 90 5F            [ 1]  653 	clrw y 
      009D68 FF               [ 2]  654 	ldw (x),y 
      009D69 90 AE 80 80      [ 2]  655 	ldw y,#NonHandledInterrupt
      009D6D EF 04            [ 2]  656 	ldw (4,x),y 
      009D6F 90 BE 22         [ 2]  657 	ldw y,YTEMP  
      009D72 72 A9 00 02      [ 2]  658 	addw y,#2
      009D76 EF 02            [ 2]  659 	ldw (2,x),y 
      009D78 CD 9B 95         [ 4]  660 	call ee_store
      009D7B 81               [ 4]  661 9$:	ret 
                                    662 
                                    663 
                                    664 ;------------------------------
                                    665 ; all interrupt vector with 
                                    666 ; an address >= ca are resetted 
                                    667 ; to default
                                    668 ; CHKIVEC ( ca -- )
                                    669 ;------------------------------
      009D7C 9D 2B                  670 	.word LINK 
                           001CFE   671 	LINK=.
      009D7E 07                     672 	.byte 7
      009D7F 43 48 4B 49 56 45 43   673 	.ascii "CHKIVEC"
                                    674 ;local variables 
                           000001   675 	SSP=1
                           000003   676 	CADR=3
                           000005   677 	OFS=5
                           000006   678 	VSIZE=6  
      009D86                        679 CHKIVEC:
      009D86 52 06            [ 2]  680 	sub sp,#VSIZE ;alloc local variables 
      009D88 90 93            [ 1]  681 	ldw y,x 
      009D8A 90 FE            [ 2]  682 	ldw y,(y)
      009D8C 17 03            [ 2]  683 	ldw (CADR,sp),y ; ca 
      009D8E 1F 01            [ 2]  684 	ldw (SSP,sp),x 
      009D90 AE 80 0A         [ 2]  685 	ldw x,#0x800a ; irq0 address 
      009D93 BF 31            [ 2]  686 	ldw PTR16,X
      009D95 AE FF FC         [ 2]  687 	ldw x,#-4 
      009D98 1C 00 04         [ 2]  688 1$:	addw x,#4
      009D9B A3 00 78         [ 2]  689 	cpw x,#30*4 ; irq0-29 
      009D9E 27 22            [ 1]  690 	jreq 9$
      009DA0 90 93            [ 1]  691 	ldw y,x  
      009DA2 91 D6 31         [ 4]  692 	ld a,([PTR16],y)
      009DA5 11 03            [ 1]  693 	cp a,(CADR,sp)
      009DA7 25 EF            [ 1]  694 	jrult 1$
      009DA9 90 5C            [ 2]  695 	incw y 
      009DAB 91 D6 31         [ 4]  696 	ld a,([PTR16],y)
      009DAE 11 04            [ 1]  697 	cp a,(CADR+1,sp) 
      009DB0 25 E6            [ 1]  698 	jrult 1$ 
      009DB2 1F 05            [ 2]  699 	ldw (OFS,sp),x 
      009DB4 54               [ 2]  700 	srlw x
      009DB5 54               [ 2]  701 	srlw x 
      009DB6 90 93            [ 1]  702 	ldw y,x 
      009DB8 1E 01            [ 2]  703 	ldw x,(SSP,sp)
      009DBA FF               [ 2]  704 	ldw (x),y
      009DBB CD 9D 34         [ 4]  705 	call reset_vector
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



      009DBE 1E 05            [ 2]  706 	ldw x,(OFS,sp) 
      009DC0 20 D6            [ 2]  707 	jra 1$
      009DC2 1E 01            [ 2]  708 9$:	ldw x,(SSP,sp) 
      009DC4 1C 00 02         [ 2]  709 	addw x,#CELLL 
      009DC7 5B 06            [ 2]  710 	addw sp,#VSIZE ; drop local variables  
      009DC9 81               [ 4]  711 	ret 
                                    712 
                                    713 ;------------------------------
                                    714 ; set interrupt vector 
                                    715 ; SET-IVEC ( ud n -- )
                                    716 ;  ud Handler address
                                    717 ;  n  vector # 0 .. 29 
                                    718 ;-----------------------------
      009DCA 9D 7E                  719 	.word LINK
                           001D4C   720 	LINK=.
      009DCC 08                     721 	.byte 8 
      009DCD 53 45 54 2D 49 56 45   722 	.ascii "SET-IVEC" 
             43
      009DD5                        723 set_vector:
      009DD5 90 93            [ 1]  724     ldw y,x 
      009DD7 1C 00 02         [ 2]  725 	addw x,#CELLL 
      009DDA 90 FE            [ 2]  726 	ldw y,(y) ; vector #
      009DDC 90 A3 00 1D      [ 2]  727 	cpw y,#29 ; last vector
      009DE0 23 04            [ 2]  728 	jrule 2$
      009DE2 1C 00 04         [ 2]  729 	addw x,#2*CELLL 
      009DE5 81               [ 4]  730 	ret
      009DE6 90 58            [ 2]  731 2$:	sllw y 
      009DE8 90 58            [ 2]  732 	sllw y 
      009DEA 72 A9 80 08      [ 2]  733 	addw y,#0X8008 ; IRQ0 vector address 
      009DEE 90 BF 22         [ 2]  734 	ldw YTEMP,y ; vector address 
      009DF1 A6 82            [ 1]  735 	ld a,#0x82 
      009DF3 90 95            [ 1]  736 	ld yh,a 
      009DF5 E6 01            [ 1]  737 	ld a,(1,x) ; isr address bits 23..16 
      009DF7 90 97            [ 1]  738 	ld yl,a 
                                    739 ;  write 0x82 + most significant byte of int address	
      009DF9 1D 00 06         [ 2]  740 	subw x,#3*CELLL 
      009DFC EF 04            [ 2]  741 	ldw (4,x),y 
      009DFE 90 BE 22         [ 2]  742 	ldw y,YTEMP
      009E01 EF 02            [ 2]  743 	ldw (2,x),y ; vector address 
      009E03 90 5F            [ 1]  744 	clrw y 
      009E05 FF               [ 2]  745 	ldw (x),y   ; as a double 
      009E06 CD 9B 95         [ 4]  746 	call ee_store 
      009E09 90 93            [ 1]  747 	ldw y,x 
      009E0B 90 EE 02         [ 2]  748 	ldw y,(2,y) ; bits 15..0 int vector 
      009E0E 1D 00 06         [ 2]  749 	subw x,#3*CELLL 
      009E11 EF 04            [ 2]  750 	ldw (4,x),y 
      009E13 90 BE 22         [ 2]  751 	ldw y,YTEMP 
      009E16 72 A9 00 02      [ 2]  752 	addw y,#2 
      009E1A EF 02            [ 2]  753 	ldw (2,x),y 
      009E1C 90 5F            [ 1]  754 	clrw y 
      009E1E FF               [ 2]  755 	ldw (x),y 
      009E1F CD 9B 95         [ 4]  756 	call ee_store
      009E22 1C 00 04         [ 2]  757 	addw x,#2*CELLL  
      009E25 81               [ 4]  758 9$: ret 
                                    759 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



                                    760 
                                    761 ;------------------------
                                    762 ; Compile word to flash
                                    763 ; EE, (w -- )
                                    764 ;-----------------------
      009E26 9D CC                  765 	.word LINK
                           001DA8   766 	LINK=.
      009E28 03                     767 	.byte 3
      009E29 45 45 2C               768 	.ascii "EE,"
      009E2C                        769 ee_comma:
      009E2C 1D 00 04         [ 2]  770 	subw x,#2*CELLL 
      009E2F 90 BE 18         [ 2]  771 	ldw y,UCP
      009E32 90 89            [ 2]  772 	pushw y 
      009E34 EF 02            [ 2]  773 	ldw (2,x),y 
      009E36 90 5F            [ 1]  774 	clrw y 
      009E38 FF               [ 2]  775 	ldw (x),y
      009E39 CD 9B 95         [ 4]  776 	call ee_store
      009E3C 90 85            [ 2]  777 	popw y 
      009E3E 72 A9 00 02      [ 2]  778 	addw y,#2
      009E42 90 BF 18         [ 2]  779 	ldw UCP,y
      009E45 81               [ 4]  780 	ret 
                                    781 
                                    782 ;-------------------------
                                    783 ; Compile byte to flash 
                                    784 ; EEC, ( c -- )	
                                    785 ;-------------------------
      009E46 9E 28                  786 	.word LINK 
                           001DC8   787 	LINK=.
      009E48 04                     788 	.byte 4 
      009E49 45 45 43 2C            789 	.ascii "EEC,"
      009E4D                        790 ee_ccomma:
      009E4D 1D 00 04         [ 2]  791 	subw x,#2*CELLL 
      009E50 90 BE 18         [ 2]  792 	ldw y,UCP
      009E53 90 89            [ 2]  793 	pushw y 
      009E55 EF 02            [ 2]  794 	ldw (2,x),y 
      009E57 90 5F            [ 1]  795 	clrw y 
      009E59 FF               [ 2]  796 	ldw (x),y
      009E5A CD 9B 49         [ 4]  797 	call ee_cstore
      009E5D 90 85            [ 2]  798 	popw y 
      009E5F 90 5C            [ 2]  799 	incw y 
      009E61 90 BF 18         [ 2]  800 	ldw UCP,y
      009E64 81               [ 4]  801 	ret 
                                    802 
                                    803 
                                    804 ;--------------------------
                                    805 ; copy FLASH block to ROWBUF
                                    806 ; ROW2BUF ( ud -- )
                                    807 ;--------------------------
      009E65 9E 48                  808 	.word LINK 
                           001DE7   809 	LINK=.
      009E67 07                     810 	.byte 7 
      009E68 52 4F 57 32 42 55 46   811 	.ascii "ROW2BUF"
      009E6F                        812 ROW2BUF: 
      009E6F CD 99 85         [ 4]  813 	call fptr_store 
      009E72 A6 80            [ 1]  814 	ld a,#BLOCK_SIZE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



      009E74 88               [ 1]  815 	push a 
      009E75 B4 32            [ 1]  816 	and a,PTR8 ; block align 
      009E77 B7 32            [ 1]  817 	ld PTR8,a
      009E79 90 AE 16 80      [ 2]  818 	ldw y,#ROWBUFF 
      009E7D 92 BC 00 30      [ 5]  819 1$: ldf a,[FPTR]
      009E81 90 F7            [ 1]  820 	ld (y),a
      009E83 CD 9B 17         [ 4]  821 	call inc_fptr
      009E86 90 5C            [ 2]  822 	incw y 
      009E88 0A 01            [ 1]  823 	dec (1,sp)
      009E8A 26 F1            [ 1]  824 	jrne 1$ 
      009E8C 84               [ 1]  825 	pop a 
      009E8D 81               [ 4]  826 	ret 
                                    827 
                                    828 
                                    829 ;---------------------------
                                    830 ; copy ROWBUFF to flash 
                                    831 ; BUF2ROW ( ud -- )
                                    832 ; ud is row address as double 
                                    833 ;---------------------------
      009E8E 9E 67                  834 	.word LINK 
                           001E10   835 	LINK=.
      009E90 07                     836 	.byte 7 
      009E91 42 55 46 32 52 4F 57   837 	.ascii "BUF2ROW" 
      009E98                        838 BUF2ROW:
      009E98 CD 85 93         [ 4]  839 	call TBUF ; ( ud rb -- )
      009E9B CD 86 40         [ 4]  840 	call ROT 
      009E9E CD 86 40         [ 4]  841 	call ROT  ; ( rb ud -- )
      009EA1 CD 9C 77         [ 4]  842 	call write_row 
      009EA4 81               [ 4]  843 	ret 
                                    844 
                                    845 ;---------------------------------
                                    846 ; how many byte free in that row 
                                    847 ; RFREE ( a -- n )
                                    848 ; a is least byte of target address
                                    849 ;----------------------------------
      009EA5 9E 90                  850 	.word LINK 
                           001E27   851 	LINK=.
      009EA7 05                     852 	.byte 5 
      009EA8 52 46 52 45 45         853 	.ascii "RFREE"
      009EAD                        854 RFREE:
      009EAD E6 01            [ 1]  855 	ld a,(1,x)
      009EAF A4 7F            [ 1]  856 	and a,#BLOCK_SIZE-1 
      009EB1 B7 22            [ 1]  857 	ld YTEMP,a 
      009EB3 A6 80            [ 1]  858 	ld a,#BLOCK_SIZE 
      009EB5 B0 22            [ 1]  859 	sub a,YTEMP 
      009EB7 90 5F            [ 1]  860 	clrw y 
      009EB9 90 97            [ 1]  861 	ld yl,a
      009EBB FF               [ 2]  862 	ldw (x),y 
      009EBC 81               [ 4]  863 	ret 
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
      009EBD 9E A7                  874 	.word LINK 
                           001E3F   875 	LINK=. 
      009EBF 06                     876 	.byte 6
      009EC0 52 41 4D 32 45 45      877 	.ascii "RAM2EE"
                                    878 	
      009EC6                        879 RAM2EE:
                                    880 ; copy ud on top 
      009EC6 90 93            [ 1]  881 	ldw y,x 
      009EC8 90 EE 06         [ 2]  882 	ldw y,(6,y) ; LSW of ud  
      009ECB 90 BF 22         [ 2]  883 	ldw YTEMP,y 
      009ECE 90 93            [ 1]  884 	ldw y,x 
      009ED0 90 EE 04         [ 2]  885 	ldw y,(4,y)  ; MSW of ud 
      009ED3 1D 00 04         [ 2]  886 	subw x,#2*CELLL 
      009ED6 FF               [ 2]  887 	ldw (x),y 
      009ED7 90 BE 22         [ 2]  888 	ldw y,YTEMP 
      009EDA EF 02            [ 2]  889 	ldw (2,x),y 
      009EDC CD 9E 6F         [ 4]  890 	call ROW2BUF 
      009EDF 90 93            [ 1]  891 	ldw y,x 
      009EE1 90 EE 06         [ 2]  892 	ldw y,(6,y)
      009EE4 90 89            [ 2]  893 	pushw y ; udl 
      009EE6 90 9F            [ 1]  894 	ld a,yl
      009EE8 A4 7F            [ 1]  895 	and a,#BLOCK_SIZE-1 
      009EEA 90 5F            [ 1]  896 	clrw y 
      009EEC 90 97            [ 1]  897 	ld yl,a 
      009EEE 72 A9 16 80      [ 2]  898 	addw y,#ROWBUFF 
      009EF2 1D 00 02         [ 2]  899 	subw x,#CELLL 
      009EF5 FF               [ 2]  900 	ldw (x),y  
      009EF6 CD 84 A8         [ 4]  901 	call SWAPP ;  ( ud a ra u -- )
      009EF9 CD 84 42         [ 4]  902 	call RFROM  
      009EFC CD 9E AD         [ 4]  903 	call RFREE 
      009EFF CD 87 80         [ 4]  904 	call MIN
      009F02 CD 84 98         [ 4]  905 	call DUPP 
      009F05 CD 84 61         [ 4]  906 	call TOR  
      009F08 CD 8B 07         [ 4]  907 	call CMOVE
      009F0B CD 9E 98         [ 4]  908 	call BUF2ROW 
      009F0E CD 84 42         [ 4]  909 	call RFROM 
      009F11 81               [ 4]  910 	ret 
                                    911 
                                    912 ;--------------------------
                                    913 ; expand 16 bit address 
                                    914 ; to 32 bit address 
                                    915 ; FADDR ( a -- ud )
                                    916 ;--------------------------
      009F12 9E BF                  917 	.word LINK 
                           001E94   918 	LINK=. 
      009F14 05                     919 	.byte 5 
      009F15 46 41 44 44 52         920 	.ascii "FADDR"
      009F1A                        921 FADDR:
      009F1A CC 89 CB         [ 2]  922 	jp ZERO 
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
      009F1D 9F 14                  938 	.word LINK 
                           001E9F   939 	LINK=.
      009F1F 05                     940 	.byte 5 
      009F20 46 4D 4F 56 45         941 	.ascii "FMOVE" 
      009F25                        942 FMOVE:
      009F25 CD 85 A5         [ 4]  943 	call TFLASH 
      009F28 CD 83 F1         [ 4]  944 	CALL AT 
      009F2B CD 83 9C         [ 4]  945 	CALL QBRAN 
      009F2E 9F A9                  946 	.word no_move  
      009F30 CD 85 F4         [ 4]  947 	call CPP
      009F33 CD 83 F1         [ 4]  948 	call AT  
      009F36 CD 84 98         [ 4]  949 	call DUPP ; ( udl udl -- )
      009F39 CD 85 D8         [ 4]  950 	call CNTXT 
      009F3C CD 83 F1         [ 4]  951 	call AT 
      009F3F CD 83 69         [ 4]  952 	call DOLIT 
      009F42 00 02                  953 	.word 2 
      009F44 CD 86 DE         [ 4]  954 	call SUBB ; ( udl udl a -- )
      009F47 CD 84 A8         [ 4]  955 	call SWAPP 
      009F4A CD 9F 1A         [ 4]  956 	call FADDR 
      009F4D CD 86 40         [ 4]  957 	call ROT  ; ( udl ud a -- )
      009F50 CD 84 98         [ 4]  958 	call DUPP 
      009F53 CD 84 61         [ 4]  959 	call TOR    ; R: a 
      009F56                        960 FMOVE2: 
      009F56 CD 8A BA         [ 4]  961 	call HERE 
      009F59 CD 84 55         [ 4]  962 	call RAT 
      009F5C CD 86 DE         [ 4]  963 	call SUBB ; (udl ud a wl -- )
      009F5F                        964 next_row:
      009F5F CD 84 98         [ 4]  965 	call DUPP 
      009F62 CD 84 61         [ 4]  966 	call TOR  ; ( udl ud a wl -- ) R: a wl
      009F65 CD 9E C6         [ 4]  967 	call RAM2EE ; ( udl a u -- udl u2 ) u2 is byte written to FLASH 
      009F68 CD 84 98         [ 4]  968 	call DUPP 
      009F6B CD 84 61         [ 4]  969 	call TOR
      009F6E CD 86 80         [ 4]  970 	call PLUS  ; ( udl+ ) 
      009F71 CD 84 98         [ 4]  971 	call DUPP 
      009F74 CD 89 CB         [ 4]  972 	call ZERO   ; ( udl+ ud -- )
      009F77 CD 84 42         [ 4]  973 	call RFROM  ; ( udl+ ud u2  R: a wl ) 
      009F7A CD 84 42         [ 4]  974 	call RFROM  ; ( udl+ ud u2 wl R: a ) 
      009F7D CD 84 C2         [ 4]  975 	call OVER   ; ( udl+ ud u2 wl u2 -- )
      009F80 CD 86 DE         [ 4]  976 	call SUBB  ; ( udl+ ud u2 wl- R: a )
      009F83 CD 84 98         [ 4]  977 	call DUPP 
      009F86 CD 83 9C         [ 4]  978 	call QBRAN
      009F89 9F A2                  979 	.word fmove_done 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



      009F8B CD 84 A8         [ 4]  980 	call SWAPP  ; ( udl+ ud wl- u2 R: a )
      009F8E CD 84 42         [ 4]  981 	call RFROM ; ( udl+ ud wl- u2 a -- ) 
      009F91 CD 86 80         [ 4]  982 	call PLUS  ; ( udl+2 ud wl- a+ )
      009F94 CD 84 98         [ 4]  983 	call DUPP 
      009F97 CD 84 61         [ 4]  984 	call TOR   ; ( udl+2 ud wl- a+ ) R: a+
      009F9A CD 84 A8         [ 4]  985 	call SWAPP 
      009F9D CD 83 B3         [ 4]  986 	call BRAN
      009FA0 9F 5F                  987 	.word next_row  
      009FA2                        988 fmove_done:	
      009FA2 CD 84 42         [ 4]  989 	call RFROM  ; ( -- udl+ ud u2 wl- a  )
      009FA5 1C 00 0A         [ 2]  990 	addw x,#5*CELLL ; (  -- udl+ ) new CP 
      009FA8 81               [ 4]  991  	ret  
      009FA9                        992 no_move:
      009FA9 CD 89 CB         [ 4]  993 	call ZERO
      009FAC 81               [ 4]  994 	ret 
                                    995 
                                    996 ;------------------------------------------
                                    997 ; adjust pointers after **FMOVE** operetion.
                                    998 ; UPDAT-PTR ( cp+ -- )
                                    999 ; cp+ is new CP position after FMOVE 
                                   1000 ;-------------------------------------------
      009FAD 9F 1F                 1001 	.word LINK 
                           001F2F  1002 	LINK=.
      009FAF 09                    1003 	.byte 9
      009FB0 55 50 44 41 54 2D 50  1004 	.ascii "UPDAT-PTR" 
             54 52
      009FB9                       1005 UPDATPTR:
                                   1006 ;reset VP to previous position  
      009FB9 CD 99 FF         [ 4] 1007 	call EEPVP 
      009FBC CD 84 8E         [ 4] 1008 	call DROP 
      009FBF CD 83 F1         [ 4] 1009 	call AT
      009FC2 CD 85 E6         [ 4] 1010 	call VPP 
      009FC5 CD 83 DA         [ 4] 1011 	call STORE
                                   1012 ;update CONTEXT and LAST 
      009FC8 CD 99 E9         [ 4] 1013 	call EEPCP 
      009FCB CD 84 8E         [ 4] 1014 	call DROP
      009FCE CD 83 F1         [ 4] 1015 	call AT
      009FD1 CD 83 69         [ 4] 1016 	call DOLIT 
      009FD4 00 02                 1017 	.word 2 
      009FD6 CD 86 80         [ 4] 1018 	call PLUS 
      009FD9 CD 84 98         [ 4] 1019 	call DUPP 
      009FDC CD 85 D8         [ 4] 1020 	call CNTXT 
      009FDF CD 83 DA         [ 4] 1021 	call STORE
      009FE2 CD 86 04         [ 4] 1022 	call LAST
      009FE5 CD 83 DA         [ 4] 1023 	call STORE 
      009FE8 CD 9A 19         [ 4] 1024 	call UPDATLAST 
                                   1025 ;update CP 
      009FEB CD 85 F4         [ 4] 1026 	call CPP 
      009FEE CD 83 DA         [ 4] 1027 	call STORE
      009FF1 CD 9A 42         [ 4] 1028 	call UPDATCP 
      009FF4 81               [ 4] 1029 	ret 
                                   1030 
                                   1031 ;-----------------------------
                                   1032 ; move interrupt sub-routine
                                   1033 ; in flash memory
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



                                   1034 ;----------------------------- 
      009FF5 9F AF                 1035 	.word LINK 
                           001F77  1036 	LINK=. 
      009FF7 06                    1037 	.byte 6
      009FF8 49 46 4D 4F 56 45     1038 	.ascii "IFMOVE" 
      009FFE                       1039 IFMOVE:
      009FFE CD 85 A5         [ 4] 1040 	call TFLASH 
      00A001 CD 83 F1         [ 4] 1041 	CALL AT 
      00A004 CD 83 9C         [ 4] 1042 	CALL QBRAN 
      00A007 9F A9                 1043 	.word no_move 
      00A009 CD 85 F4         [ 4] 1044 	call CPP 
      00A00C CD 83 F1         [ 4] 1045 	call AT 
      00A00F CD 84 98         [ 4] 1046 	call DUPP ; ( udl udl -- )
      00A012 CD 99 FF         [ 4] 1047 	call EEPVP 
      00A015 CD 84 8E         [ 4] 1048 	call DROP
      00A018 CD 83 F1         [ 4] 1049 	call AT  ; ( udl udl a )
      00A01B CD 84 61         [ 4] 1050 	call TOR 
      00A01E CD 9F 1A         [ 4] 1051 	call FADDR
      00A021 CD 84 55         [ 4] 1052 	call RAT ; ( udl ud a -- ) R: a 
      00A024 CC 9F 56         [ 2] 1053 	jp FMOVE2 
                                   1054 
                                   1055 
                                   1056 ; application code begin here
      00A080                       1057 	.bndry 128 ; align on flash block  
      00A080                       1058 app_space: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



                                   4582 .endif ; PICATOUT_MOD
                                   4583 
                                   4584 ;===============================================================
                                   4585 
                           001F77  4586 LASTN =	LINK   ;last name defined
                                   4587 
                                   4588 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   6 AB1        000681 R   |   6 ABOR1      0011D6 R
  6 ABOR2      0011ED R   |   6 ABORQ      0011CE R   |   6 ABORT      0011BF R
  6 ABRTQ      0014AA R   |   6 ABSS       000678 R   |   6 ACCEP      001155 R
  6 ACCP1      00115E R   |   6 ACCP2      001184 R   |   6 ACCP3      001187 R
  6 ACCP4      001189 R   |     ADC_CR1 =  005401     |     ADC_CR1_=  000000 
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
  6 AFT        001495 R   |   6 AGAIN      0013EB R   |   6 AHEAD      001448 R
  6 ALLOT      0012FE R   |   6 ANDD       000464 R   |     APP_CP  =  004004 
    APP_LAST=  004000     |     APP_RUN =  004002     |     APP_VP  =  004006 
  6 AT         000371 R   |   6 ATEXE      000A70 R   |   6 AUTORUN    000123 R
    AWU_APR =  0050F1     |     AWU_CSR =  0050F0     |     AWU_TBR =  0050F2 
    B0_MASK =  000001     |     B115200 =  000006     |     B19200  =  000003 
    B1_MASK =  000002     |     B230400 =  000007     |     B2400   =  000000 
    B2_MASK =  000004     |     B38400  =  000004     |     B3_MASK =  000008 
    B460800 =  000008     |     B4800   =  000001     |     B4_MASK =  000010 
    B57600  =  000005     |     B5_MASK =  000020     |     B6_MASK =  000040 
    B7_MASK =  000080     |     B921600 =  000009     |     B9600   =  000002 
  6 BACK1      0010FD R   |   6 BASE       0004D5 R   |     BASEE   =  00000A 
    BCNT    =  000001     |   6 BCOMP      001340 R   |   6 BDIGS      000B58 R
    BEEP_BIT=  000004     |     BEEP_CSR=  0050F3     |     BEEP_MAS=  000010 
    BEEP_POR=  00000F     |   6 BEGIN      0013CD R   |     BIT0    =  000000 
    BIT1    =  000001     |     BIT2    =  000002     |     BIT3    =  000003 
    BIT4    =  000004     |     BIT5    =  000005     |     BIT6    =  000006 
    BIT7    =  000007     |   6 BKSLA      000F95 R   |   6 BKSP       0010CD R
    BKSPP   =  000008     |   6 BLANK      00093E R   |     BLOCK_SI=  000080 
    BOOT_ROM=  006000     |     BOOT_ROM=  007FFF     |   6 BRAN       000333 R
    BTW     =  000001     |   6 BUF2ROW    001E18 R   |   6 BYE        0000B0 R
    CADR    =  000003     |     CALLL   =  0000CD     |   6 CANT_FOR   0001CE R
    CAN_DGR =  005426     |     CAN_FPSR=  005427     |     CAN_IER =  005425 
    CAN_MCR =  005420     |     CAN_MSR =  005421     |     CAN_P0  =  005428 
    CAN_P1  =  005429     |     CAN_P2  =  00542A     |     CAN_P3  =  00542B 
    CAN_P4  =  00542C     |     CAN_P5  =  00542D     |     CAN_P6  =  00542E 
    CAN_P7  =  00542F     |     CAN_P8  =  005430     |     CAN_P9  =  005431 
    CAN_PA  =  005432     |     CAN_PB  =  005433     |     CAN_PC  =  005434 
    CAN_PD  =  005435     |     CAN_PE  =  005436     |     CAN_PF  =  005437 
    CAN_RFR =  005424     |     CAN_TPR =  005423     |     CAN_TSR =  005422 
    CARRY   =  000026     |   6 CAT        00038F R   |   6 CCOMMA     001322 R
    CC_C    =  000000     |     CC_H    =  000004     |     CC_I0   =  000003 
    CC_I1   =  000005     |     CC_N    =  000002     |     CC_V    =  000007 
    CC_Z    =  000001     |     CELLL   =  000002     |   6 CELLM      0008C3 R
  6 CELLP      0008B4 R   |   6 CELLS      0008D2 R   |     CFG_GCR =  007F60 
    CFG_GCR_=  000001     |     CFG_GCR_=  000000     |   6 CHAR1      000D85 R
  6 CHAR2      000D88 R   |   6 CHKIVEC    001D06 R   |     CLKOPT  =  004807 
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
    CLK_SWR_=  0000E1     |     CLK_SWR_=  0000D2     |   6 CMOV1      000A8F R
  6 CMOV2      000AA7 R   |   6 CMOVE      000A87 R   |     CNTDWN  =  00002E 
  6 CNTXT      000558 R   |   6 COLD       001896 R   |   6 COLD1      001896 R
  6 COLON      001640 R   |   6 COMMA      00130B R   |   6 COMPI      001350 R
    COMPO   =  000040     |   6 CONSTANT   0016DE R   |     CONVERT_=  000001 
  6 COUNT      000A23 R   |   6 CPP        000574 R   |     CPU_A   =  007F00 
    CPU_CCR =  007F0A     |     CPU_PCE =  007F01     |     CPU_PCH =  007F02 
    CPU_PCL =  007F03     |     CPU_SPH =  007F08     |     CPU_SPL =  007F09 
    CPU_XH  =  007F04     |     CPU_XL  =  007F05     |     CPU_YH  =  007F06 
    CPU_YL  =  007F07     |   6 CR         000DB3 R   |   6 CREAT      001686 R
    CRR     =  00000D     |   6 CSTOR      00037E R   |     CTOP    =  000080 
  6 DAT        000A03 R   |     DATSTK  =  001670     |   6 DDROP      0005E0 R
  6 DDUP       0005EB R   |     DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF 
  6 DECIM      000C08 R   |   6 DEPTH      00098E R   |     DEVID_BA=  0048CD 
    DEVID_EN=  0048D8     |     DEVID_LO=  0048D2     |     DEVID_LO=  0048D3 
    DEVID_LO=  0048D4     |     DEVID_LO=  0048D5     |     DEVID_LO=  0048D6 
    DEVID_LO=  0048D7     |     DEVID_LO=  0048D8     |     DEVID_WA=  0048D1 
    DEVID_XH=  0048CE     |     DEVID_XL=  0048CD     |     DEVID_YH=  0048D0 
    DEVID_YL=  0048CF     |   6 DGTQ1      000C4D R   |   6 DI         0000BE R
  6 DIG        000B81 R   |   6 DIGIT      000B1C R   |   6 DIGS       000B92 R
  6 DIGS1      000B92 R   |   6 DIGS2      000B9F R   |   6 DIGTQ      000C1C R
    DM_BK1RE=  007F90     |     DM_BK1RH=  007F91     |     DM_BK1RL=  007F92 
    DM_BK2RE=  007F93     |     DM_BK2RH=  007F94     |     DM_BK2RL=  007F95 
    DM_CR1  =  007F96     |     DM_CR2  =  007F97     |     DM_CSR1 =  007F98 
    DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A     |   6 DN1        000658 R
  6 DNEGA      00063D R   |   6 DOCONST    001708 R   |   6 DOLIT      0002E9 R
  6 DONXT      0002FD R   |   6 DOSTR      000DC9 R   |   6 DOT        000E4E R
  6 DOT1       000E64 R   |   6 DOTI1      00182A R   |   6 DOTID      001814 R
  6 DOTO1      001262 R   |   6 DOTOK      001248 R   |   6 DOTPR      000F77 R
  6 DOTQ       0014C4 R   |   6 DOTQP      000DF2 R   |   6 DOTR       000E00 R
  6 DOTS       0017B6 R   |   6 DOTS1      0017C1 R   |   6 DOTS2      0017CA R
  6 DOVAR      0004C5 R   |   6 DROP       00040E R   |   6 DSTOR      0009DD R
  6 DUMP       00176C R   |   6 DUMP1      001783 R   |   6 DUMP3      0017A5 R
  6 DUMPP      00173B R   |   6 DUPP       000418 R   |   6 EDIGS      000BBD R
  6 EEPCP      001969 R   |   6 EEPLAST    00193C R   |   6 EEPROM     001924 R
    EEPROM_B=  004000     |     EEPROM_E=  0047FF     |     EEPROM_S=  000800 
  6 EEPRUN     001953 R   |   6 EEPVP      00197F R   |   6 EI         0000B7 R
  6 ELSEE      001423 R   |   6 EMIT       0002D3 R   |   6 EQ1        00069C R
  6 EQUAL      000686 R   |   6 ERASE      000AE9 R   |     ERR     =  00001B 
  6 EVAL       00128B R   |   6 EVAL1      00128B R   |   6 EVAL2      0012A7 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]

Symbol Table

  6 EXE1       000A7E R   |   6 EXECU      000343 R   |   6 EXIT       000353 R
    EXT     =  000000     |     EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1 
  6 EXTRC      000B44 R   |   6 FADDR      001E9A R   |     FHSE    =  7A1200 
    FHSI    =  F42400     |   6 FILL       000AB6 R   |   6 FILL1      000AD3 R
  6 FILL2      000ADC R   |   6 FIND       001029 R   |   6 FIND1      001047 R
  6 FIND2      001075 R   |   6 FIND3      001081 R   |   6 FIND4      001095 R
  6 FIND5      0010A2 R   |   6 FIND6      001086 R   |     FLASH_BA=  008000 
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
  6 FMOVE      001EA5 R   |   6 FMOVE2     001ED6 R   |   6 FOR        0013A0 R
  6 FORGET     000154 R   |   6 FORGET1    000186 R   |   6 FORGET2    0001DC R
  6 FORGET4    0001E5 R   |     FPTR    =  000030     |   6 FREEVAR    0001F2 R
  6 FREEVAR4   000228 R   |     GPIO_BAS=  005000     |     GPIO_CR1=  000003 
    GPIO_CR2=  000004     |     GPIO_DDR=  000002     |     GPIO_IDR=  000001 
    GPIO_ODR=  000000     |     GPIO_SIZ=  000005     |   6 HERE       000A3A R
  6 HEX        000BF3 R   |   6 HI         001869 R   |   6 HLD        000545 R
  6 HOLD       000B68 R   |     HSECNT  =  004809     |     I2C_CCRH=  00521C 
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
    I2C_TRIS=  000011     |     I2C_WRIT=  000000     |   6 ICOLON     001651 R
  6 IFETCH     0013BE R   |   6 IFF        0013FB R   |   6 IFMOVE     001F7E R
    IMEDD   =  000080     |   6 IMMED      001663 R   |   6 INCH       0002C7 R
  6 INITOFS    001619 R   |   6 INN        0004F3 R   |     INPUT_DI=  000000 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]

Symbol Table

    INPUT_EI=  000001     |     INPUT_FL=  000000     |     INPUT_PU=  000001 
  6 INTE1      00122A R   |   6 INTER      001200 R   |     INT_ADC2=  000016 
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
    IRET_COD=  000080     |   6 ISEMI      0015AE R   |     ITC_SPR1=  007F70 
    ITC_SPR2=  007F71     |     ITC_SPR3=  007F72     |     ITC_SPR4=  007F73 
    ITC_SPR5=  007F74     |     ITC_SPR6=  007F75     |     ITC_SPR7=  007F76 
    ITC_SPR8=  007F77     |     IWDG_KR =  0050E0     |     IWDG_PR =  0050E1 
    IWDG_RLR=  0050E2     |   6 JSRC       001603 R   |   6 KEY        000D33 R
  6 KTAP       00111A R   |   6 KTAP1      00113D R   |   6 KTAP2      001140 R
  6 LAST       000584 R   |   6 LASTN   =  001F77 R   |   6 LBRAC      001237 R
    LED2_BIT=  000005     |     LED2_MAS=  000020     |     LED2_POR=  00500A 
  6 LESS       0006C3 R   |     LF      =  00000A     |   6 LINK    =  001F77 R
  6 LITER      001372 R   |   6 LSHIFT     0008FD R   |   6 LSHIFT1    000906 R
  6 LSHIFT4    00090E R   |   6 LT1        0006D9 R   |     MASKK   =  001F7F 
  6 MAX        0006E3 R   |   6 MAX1       0006F6 R   |   6 MIN        000700 R
  6 MIN1       000713 R   |   6 MMOD1      0007B6 R   |   6 MMOD2      0007CA R
  6 MMOD3      0007E1 R   |   6 MMSM1      00075D R   |   6 MMSM2      000771 R
  6 MMSM3      000773 R   |   6 MMSM4      00077B R   |   6 MODD       0007FB R
  6 MONE       000964 R   |     MS      =  00002C     |   6 MSEC       000232 R
  6 MSMOD      000799 R   |   6 MSTA1      00088C R   |   6 MSTAR      000869 R
    NAFR    =  004804     |   6 NAMEQ      0010C2 R   |   6 NAMET      000FD3 R
    NCLKOPT =  004808     |   6 NEGAT      00062B R   |   6 NEX1       00030A R
  6 NEXT       0013AF R   |     NFLASH_W=  00480E     |     NHSECNT =  00480A 
    NOPT1   =  004802     |     NOPT2   =  004804     |     NOPT3   =  004806 
    NOPT4   =  004808     |     NOPT5   =  00480A     |     NOPT6   =  00480C 
    NOPT7   =  00480E     |     NOPTBL  =  00487F     |   6 NTIB       000503 R
    NUBC    =  004802     |   6 NUFQ       000D49 R   |   6 NUFQ1      000D62 R
  6 NUMBQ      000C60 R   |   6 NUMQ1      000C94 R   |   6 NUMQ2      000CC5 R
  6 NUMQ3      000D07 R   |   6 NUMQ4      000D0C R   |   6 NUMQ5      000D1B R
  6 NUMQ6      000D1E R   |     NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD 
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
  6 OVERT      00157F R   |     PA      =  000000     |   6 PACKS      000AFB R
  6 PAD        000A4B R   |   6 PAREN      000F86 R   |   6 PARS       000E7F R
  6 PARS1      000EAA R   |   6 PARS2      000ED5 R   |   6 PARS3      000ED8 R
  6 PARS4      000EE1 R   |   6 PARS5      000F04 R   |   6 PARS6      000F19 R
  6 PARS7      000F28 R   |   6 PARS8      000F37 R   |   6 PARSE      000F48 R
  6 PAUSE      000242 R   |     PA_BASE =  005000     |     PA_CR1  =  005003 
    PA_CR2  =  005004     |     PA_DDR  =  005002     |     PA_IDR  =  005001 
    PA_ODR  =  005000     |     PB      =  000005     |     PB_BASE =  005005 
    PB_CR1  =  005008     |     PB_CR2  =  005009     |     PB_DDR  =  005007 
    PB_IDR  =  005006     |     PB_ODR  =  005005     |     PC      =  00000A 
    PC_BASE =  00500A     |     PC_CR1  =  00500D     |     PC_CR2  =  00500E 
    PC_DDR  =  00500C     |     PC_IDR  =  00500B     |     PC_ODR  =  00500A 
    PD      =  00000F     |   6 PDUM1      00174E R   |   6 PDUM2      00175F R
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
    PI_ODR  =  005028     |   6 PLUS       000600 R   |   6 PNAM1      001534 R
  6 PRESE      0012B6 R   |     PROD1   =  000020     |     PROD2   =  000022 
    PROD3   =  000024     |   6 PSTOR      0009BC R   |     PTR16   =  000031 
    PTR8    =  000032     |   6 QBRAN      00031C R   |   6 QDUP       0005AF R
  6 QDUP1      0005B9 R   |   6 QKEY       0002B5 R   |   6 QSTAC      00126E R
  6 QUERY      00119A R   |   6 QUEST      000E71 R   |   6 QUIT       0012D3 R
  6 QUIT1      0012DB R   |   6 QUIT2      0012DE R   |   6 RAM2EE     001E46 R
    RAMBASE =  000000     |     RAM_BASE=  000000     |     RAM_END =  0017FF 
    RAM_SIZE=  001800     |   6 RAT        0003D5 R   |   6 RBRAC      0015F0 R
  6 REPEA      001478 R   |   6 RFREE      001E2D R   |   6 RFROM      0003C2 R
    ROP     =  004800     |   6 ROT        0005C0 R   |   6 ROW2BUF    001DEF R
    ROWBUFF =  001680     |     RP0     =  00002A     |   6 RPAT       00039F R
    RPP     =  0017FF     |   6 RPSTO      0003AC R   |   6 RSHIFT     000919 R
  6 RSHIFT1    000922 R   |   6 RSHIFT4    00092A R   |     RST_SR  =  0050B3 
  6 SAME1      000FF1 R   |   6 SAME2      00101A R   |   6 SAMEQ      000FE9 R
  6 SCOM1      001569 R   |   6 SCOM2      00156C R   |   6 SCOMP      00154B R
  6 SEMIS      00158F R   |   6 SETISP     0000CA R   |     SFR_BASE=  005000 
    SFR_END =  0057FF     |   6 SIGN       000BA7 R   |   6 SIGN1      000BB7 R
  6 SLASH      000805 R   |   6 SLMOD      0007E9 R   |   6 SNAME      0014FE R
    SP0     =  000028     |   6 SPACE      000D6B R   |   6 SPACS      000D7A R
  6 SPAT       0003F8 R   |     SPI_CR1 =  005200     |     SPI_CR2 =  005201 
    SPI_CRCP=  005205     |     SPI_DR  =  005204     |     SPI_ICR =  005202 
    SPI_RXCR=  005206     |     SPI_SR  =  005203     |     SPI_TXCR=  005207 
    SPP     =  001670     |   6 SPSTO      000405 R   |   6 SSMOD      000895 R
    SSP     =  000001     |     STACK   =  0017FF     |   6 STAR       00085E R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]

Symbol Table

  6 STASL      0008A6 R   |   6 STORE      00035A R   |   6 STR        000BD5 R
  6 STRCQ      001380 R   |   6 STRQ       0014B7 R   |   6 STRQP      000DE8 R
  6 SUBB       00065E R   |   6 SWAPP      000428 R   |     SWIM_CSR=  007F80 
  6 TAP        001104 R   |   6 TBOOT      00188A R   |   6 TBUF       000513 R
    TBUFFBAS=  001680     |   6 TCHA1      000985 R   |   6 TCHAR      000975 R
  6 TEMP       0004E4 R   |   6 TEVAL      000536 R   |   6 TFLASH     000525 R
  6 THENN      001410 R   |   6 TIB        000A5C R   |     TIBB    =  001700 
    TIBBASE =  001700     |     TIC     =  000027     |   6 TICK       0012EA R
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
    TIM_CR1_=  000001     |     TIM_CR1_=  000002     |   6 TNAM2      0017E4 R
  6 TNAM3      001802 R   |   6 TNAM4      001808 R   |   6 TNAME      0017E1 R
  6 TOFLASH    000297 R   |   6 TOKEN      000FC5 R   |   6 TOR        0003E1 R
  6 TORAM      0002A8 R   |     TRUEE   =  00FFFF     |   6 TWOSL      000931 R
  6 TYPE1      000D9A R   |   6 TYPE2      000DA6 R   |   6 TYPES      000D95 R
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
    UD3     =  000003     |     UD4     =  000004     |   6 UDOT       000E3B R
  6 UDOTR      000E1B R   |   6 UEND       000041 R   |     UHLD    =  000012 
    UINN    =  00000A     |     UINTER  =  000010     |     ULAST   =  00001A 
  6 ULES1      0006BB R   |   6 ULESS      0006A5 R   |   6 UMMOD      00073B R
  6 UMSTA      000814 R   |   6 UNIQ1      0014F5 R   |   6 UNIQU      0014D6 R
  6 UNTIL      0013D8 R   |     UOFFSET =  00001C     |   6 UPDATCP    0019C2 R
  6 UPDATLAS   001999 R   |   6 UPDATPTR   001F39 R   |   6 UPDATRUN   0019B1 R
  6 UPDATVP    0019D9 R   |   6 UPL1       0004B9 R   |   6 UPLUS      0004A2 R
    UPP     =  000006     |     USR_BTN_=  000004     |     USR_BTN_=  000010 
    USR_BTN_=  005015     |     UTFLASH =  00001E     |     UTIB    =  00000E 
    UTMP    =  000008     |   6 UTYP1      00171E R   |   6 UTYP2      00172D R
  6 UTYPE      001719 R   |     UVP     =  000016     |   6 UZERO      000027 R
  6 VARIA      0016A0 R   |     VER     =  000003     |   6 VPP        000566 R
    VSIZE   =  000006     |     WANT_DEB=  000000     |     WANT_SEE=  000000 
    WDGOPT  =  004805     |     WDGOPT_I=  000002     |     WDGOPT_L=  000003 
    WDGOPT_W=  000000     |     WDGOPT_W=  000001     |   6 WHILE      00145E R
  6 WITHI      000720 R   |   6 WORDD      000FB1 R   |   6 WORDS      00183E R
  6 WORS1      001844 R   |   6 WORS2      001863 R   |     WWDG_CR =  0050D1 
    WWDG_WR =  0050D2     |   6 XORR       00048D R   |     XTEMP   =  000020 
    YTEMP   =  000022     |   6 ZERO       00094B R   |   6 ZL1        00045A R
  6 ZLESS      000451 R   |   6 app_spac   002000 R   |   6 block_er   001B5C R
  6 clear_ra   000019 R   |   6 clock_in   00005E R   |   6 copy_buf   001BB3 R
  6 copy_buf   001BD2 R   |   6 copy_pro   001BD2 R   |     da      =  000002 
    db      =  000003     |     dc      =  000000     |     dd      =  000001 
  6 ee_ccomm   001DCD R   |   6 ee_comma   001DAC R   |   6 ee_cstor   001AC9 R
  6 ee_store   001B15 R   |   6 erase_fl   001B78 R   |   6 farat      0019EA R
  6 farcat     001A06 R   |   6 fmove_do   001F22 R   |   6 fptr_sto   001905 R
  6 inc_fptr   001A97 R   |   6 lock       001A83 R   |   6 main       000016 R
  6 next_row   001EDF R   |   6 no_move    001F29 R   |   6 pristine   001C4D R
  6 proceed_   001B7B R   |   6 reboot     000289 R   |   6 reset_ve   001CB4 R
  6 row_eras   001B3F R   |   6 row_eras   001B8C R   |   6 row_eras   001BB3 R
  6 set_opti   001C21 R   |   6 set_vect   001D55 R   |   6 uart1_in   000070 R
  6 unlock     001A5B R   |   6 unlock_e   001A1D R   |   6 unlock_f   001A3C R
  6 write_by   001AAE R   |   6 write_ro   001BF7 R

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

