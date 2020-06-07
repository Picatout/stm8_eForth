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
                                    128 .endif ; PICATOUT_MOD
                                    129 
                                    130 ;******  System Variables  ******
                           00001E   131 XTEMP	=	UOFFSET+2;address called by CREATE
                           000020   132 YTEMP	=	XTEMP+2	;address called by CREATE
                           00001E   133 PROD1 = XTEMP	;space for UM*
                           000020   134 PROD2 = PROD1+2
                           000022   135 PROD3 = PROD2+2
                           000024   136 CARRY = PROD3+2
                           000026   137 SP0	= CARRY+2	;initial data stack pointer
                           000028   138 RP0	= SP0+2		;initial return stack pointer
                           00002A   139 MS    =   RP0+2         ; millisecond counter 
                           00002C   140 CNTDWN =  MS+2          ; count down timer 
                           00002E   141 FPTR = CNTDWN+2         ; 24 bits farptr 
                           00002F   142 PTR16 = FPTR+1          ; middle byte of farptr 
                           000030   143 PTR8 = FPTR+2           ; least byte of farptr 
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
      008089 BE 2A            [ 2]  248         ldw x,MS 
      00808B 5C               [ 2]  249         incw x 
      00808C BF 2A            [ 2]  250         ldw MS,x
      00808E BE 2C            [ 2]  251         ldw x,CNTDWN 
      008090 27 03            [ 1]  252         jreq 1$
      008092 5A               [ 2]  253         decw x 
      008093 BF 2C            [ 2]  254         ldw CNTDWN,x 
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
      0080A4 CC 80 BF         [ 2]  270 	jp ORIG
                                    271 
                                    272 ; COLD initialize these variables.
      0080A7                        273 UZERO:
      0080A7 00 0A                  274         .word      BASEE   ;BASE
      0080A9 00 00                  275         .word      0       ;tmp
      0080AB 00 00                  276         .word      0       ;>IN
      0080AD 00 00                  277         .word      0       ;#TIB
      0080AF 17 00                  278         .word      TIBB    ;TIB
      0080B1 92 46                  279         .word      INTER   ;'EVAL
      0080B3 00 00                  280         .word      0       ;HLD
      0080B5 9F 80                  281         .word      LASTN  ;CNTXT pointer
      0080B7 00 80                  282         .word      CTOP   ;CP in RAM
      0080B9 A0 00                  283         .word      app_space ; CP in FLASH 
      0080BB 9F 80                  284         .word      LASTN   ;LAST
      0080BD 00 00                  285 UEND:  .word      0
                                    286 
      0080BF                        287 ORIG:   
                                    288 ; initialize SP
      0080BF AE 17 FF         [ 2]  289         LDW     X,#STACK  ;initialize return stack
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 7.
Hexadecimal [24-Bits]



      0080C2 94               [ 1]  290         LDW     SP,X
      0080C3 BF 28            [ 2]  291         LDW     RP0,X
      0080C5 AE 16 70         [ 2]  292         LDW     X,#DATSTK ;initialize data stack
      0080C8 BF 26            [ 2]  293         LDW     SP0,X
                                    294 ; initialize PC_5 as output to control LED2
                                    295 ; added by Picatout 
      0080CA 72 1A 50 0D      [ 1]  296         bset PC_CR1,#LED2_BIT
      0080CE 72 1A 50 0E      [ 1]  297         bset PC_CR2,#LED2_BIT
      0080D2 72 1A 50 0C      [ 1]  298         bset PC_DDR,#LED2_BIT
      000056                        299         _ledoff
      0080D6 72 1B 50 0A      [ 1]    1         bres PC_ODR,#LED2_BIT
                                    300 ; initialize clock to HSI
                                    301 ; no divisor 16Mhz 
                                    302 ; Added by Picatout 
      0080DA                        303 clock_init:
      0080DA 72 5F 50 C6      [ 1]  304         clr CLK_CKDIVR
      0080DE 72 12 50 C5      [ 1]  305 	bset CLK_SWCR,#CLK_SWCR_SWEN
      0080E2 A6 E1            [ 1]  306 	ld a,#CLK_SWR_HSI
      0080E4 C7 50 C4         [ 1]  307 	ld CLK_SWR,a
      0080E7 C1 50 C3         [ 1]  308 1$:	cp a,CLK_CMSR
      0080EA 26 FB            [ 1]  309 	jrne 1$
                                    310         
                                    311 ; initialize UART1, 115200 8N1
      0080EC                        312 uart1_init:
      0080EC 72 14 50 C7      [ 1]  313 	bset CLK_PCKENR1,#CLK_PCKENR1_UART1
                                    314 	; configure tx pin
      0080F0 72 1A 50 02      [ 1]  315 	bset PA_DDR,#UART1_TX_PIN ; tx pin
      0080F4 72 1A 50 03      [ 1]  316 	bset PA_CR1,#UART1_TX_PIN ; push-pull output
      0080F8 72 1A 50 04      [ 1]  317 	bset PA_CR2,#UART1_TX_PIN ; fast output
                                    318 	; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
      0080FC 35 0B 52 33      [ 1]  319 	mov UART1_BRR2,#0x0b ; must be loaded first
      008100 35 08 52 32      [ 1]  320 	mov UART1_BRR1,#0x8
      008104 35 0C 52 35      [ 1]  321 	mov UART1_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN));|(1<<UART_CR2_RIEN))
                                    322 ; initialize timer4, used for millisecond interrupt  
      008108 35 07 53 45      [ 1]  323 	mov TIM4_PSCR,#7 ; prescale 128  
      00810C 35 7D 53 46      [ 1]  324 	mov TIM4_ARR,#125 ; set for 1msec.
      008110 35 05 53 40      [ 1]  325 	mov TIM4_CR1,#((1<<TIM4_CR1_CEN)|(1<<TIM4_CR1_URS))
      008114 72 10 53 41      [ 1]  326 	bset TIM4_IER,#TIM4_IER_UIE 
                                    327 ; set TIM4 interrupt priority to highest
      008118 A6 3F            [ 1]  328         ld a,#~(IPR_MASK<<6)
      00811A C4 7F 75         [ 1]  329         and a,ITC_SPR6
      00811D AA C0            [ 1]  330         or a,#(IPR3<<6)
      00811F C7 7F 75         [ 1]  331         ld ITC_SPR6,a 
      008122 9A               [ 1]  332         rim
      008123 CC 98 AE         [ 2]  333         jp  COLD   ;default=MN1
                                    334 
                                    335 
                                    336 ;; place MCU in sleep mode with
                                    337 ;; halt opcode 
                                    338 ;; BYE ( -- )
      008126 00 00                  339         .word 0
                           0000A8   340         LINK=.
      008128 03                     341         .byte 3 
      008129 42 59 45               342         .ascii "BYE"
      00812C                        343 BYE: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 8.
Hexadecimal [24-Bits]



      00812C 8E               [10]  344         halt 
      00812D 81               [ 4]  345         ret 
                                    346 
                                    347 ; Enable interrupts 
                                    348 ; EI ( -- )
      00812E 81 28                  349         .word LINK 
                           0000B0   350         LINK=.
      008130 02                     351         .byte 2
      008131 45 49                  352         .ascii "EI"
      008133                        353 EI:
      008133 9A               [ 1]  354         rim 
      008134 81               [ 4]  355         ret 
                                    356 
                                    357 ; Disable interrupts
                                    358 ; DI ( -- )
      008135 81 30                  359         .word LINK 
                           0000B7   360         LINK=.
      008137 02                     361         .byte 2 
      008138 44 49                  362         .ascii "DI"
      00813A                        363 DI:
      00813A 9B               [ 1]  364         sim 
      00813B 81               [ 4]  365         ret 
                                    366 
                                    367 ; set interrupt priority level 
                                    368 ; SET-ISP ( n1 n2 -- )
                                    369 ; n1 level {1..3}
                                    370 ; n2 vector {0..29}
      00813C 81 37                  371         .word LINK 
                           0000BE   372         LINK=.
      00813E 07                     373         .byte 7 
      00813F 53 45 54 2D 49 53 50   374         .ascii "SET-ISP"
      008146                        375 SETISP:
      008146 90 93            [ 1]  376         ldw y,x 
      008148 90 FE            [ 2]  377         ldw y,(y)
      00814A A6 04            [ 1]  378         ld a,#4 ; 4 slot per register 
                                    379 ;  quotient select register, remainder select slot in register.        
      00814C 90 62            [ 2]  380         div y,a ; register=ITC_SPR1[Y], lshift=2*A 
      00814E A4 03            [ 1]  381         and a,#3 
      008150 48               [ 1]  382         sll a ; 2*SLOT  lshift 
      008151 72 A9 7F 70      [ 2]  383         addw y,#ITC_SPR1 
      008155 FF               [ 2]  384         ldw (x),y  ; ( level reg -- )
      008156 90 5F            [ 1]  385         clrw y 
      008158 90 97            [ 1]  386         ld yl,a 
      00815A 1D 00 02         [ 2]  387         subw x,#CELLL 
      00815D FF               [ 2]  388         ldw (x),y  ; ( level reg lshift -- )
      00815E 90 93            [ 1]  389         ldw y,x 
      008160 90 EE 02         [ 2]  390         ldw y,(2,y) 
      008163 90 F6            [ 1]  391         ld a,(y)   ; reg_value
      008165 1D 00 02         [ 2]  392         subw x,#CELLL 
      008168 FF               [ 2]  393         ldw (x),y ; ( level reg lshift rval -- )
      008169 CD 84 9C         [ 4]  394         call OVER ; ( level reg lshift rval lshift -- )
      00816C CD 83 43         [ 4]  395         call DOLIT 
      00816F 00 03                  396         .word 3
      008171 CD 84 82         [ 4]  397         call SWAPP  ; ( level reg lshift rval 3 lshift )
      008174 CD 89 45         [ 4]  398         call LSHIFT ; creat slot mask 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 9.
Hexadecimal [24-Bits]



      008177 CD 86 62         [ 4]  399         call INVER  ; ( level reg lshift rval mask )
      00817A CD 84 BE         [ 4]  400         call ANDD ; ( level reg lshift slot_masked )
      00817D CD 84 3B         [ 4]  401         call TOR  ; ( level reg lshift -- R: slot_masked )
      008180 CD 86 08         [ 4]  402         call ROT  ; ( reg lshift level )
      008183 CD 84 82         [ 4]  403         call SWAPP ; ( reg level lshift )
      008186 CD 89 45         [ 4]  404         call LSHIFT  ; ( reg slot_level -- )
      008189 CD 84 1C         [ 4]  405         call RFROM ; ( reg slot_level masked_val )
      00818C CD 84 D2         [ 4]  406         call ORR   ; ( reg updated_rval )
      00818F CD 84 82         [ 4]  407         call SWAPP 
      008192 CD 83 D8         [ 4]  408         call CSTOR
                                    409 
                                    410 ; sélectionne l'application 
                                    411 ; qui démarre automatique lors 
                                    412 ; d'un COLD start 
      008195 81 3E                  413         .word LINK 
                           000117   414         LINK=.
      008197 07                     415         .byte 7
      008198 41 55 54 4F 52 55 4E   416         .ascii "AUTORUN"
      00819F                        417 AUTORUN:
      00819F CD 90 0B         [ 4]  418         call TOKEN 
      0081A2 CD 84 72         [ 4]  419         call DUPP 
      0081A5 CD 83 76         [ 4]  420         call QBRAN 
      0081A8 82 58                  421         .word FORGET2
      0081AA CD 91 08         [ 4]  422         call NAMEQ
      0081AD CD 85 F7         [ 4]  423         call QDUP 
      0081B0 CD 83 76         [ 4]  424         call QBRAN 
      0081B3 82 58                  425         .word FORGET2
      0081B5 CD 84 68         [ 4]  426         call DROP 
      0081B8 1D 00 04         [ 2]  427         subw x,#2*CELLL 
      0081BB 90 5F            [ 1]  428         clrw y 
      0081BD FF               [ 2]  429         ldw (x),y 
      0081BE 90 AE 40 02      [ 2]  430         ldw y,#APP_RUN 
      0081C2 EF 02            [ 2]  431         ldw (2,x),y 
      0081C4 CC 9B 2D         [ 2]  432         jp ee_store 
                                    433 
                                    434 
                                    435 ;; Reset dictionary pointer before 
                                    436 ;; forgotten word. RAM SPACE and 
                                    437 ;; interrupt vector defineD after 
                                    438 ;; must be resetted also.
      0081C7 81 97                  439         .word LINK 
                           000149   440         LINK=.
      0081C9 06                     441         .byte 6
      0081CA 46 4F 52 47 45 54      442         .ascii "FORGET" 
      0081D0                        443 FORGET: 
      0081D0 CD 90 0B         [ 4]  444         call TOKEN
      0081D3 CD 84 72         [ 4]  445         call DUPP 
      0081D6 CD 83 76         [ 4]  446         call QBRAN 
      0081D9 82 58                  447         .word FORGET2
      0081DB CD 91 08         [ 4]  448         call NAMEQ ; ( a -- ca na | a F )
      0081DE CD 85 F7         [ 4]  449         call QDUP 
      0081E1 CD 83 76         [ 4]  450         call QBRAN 
      0081E4 82 58                  451         .word FORGET2
                                    452 ; only forget users words 
      0081E6 CD 84 72         [ 4]  453         call DUPP ; ( ca na na )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



      0081E9 CD 83 43         [ 4]  454         call DOLIT 
      0081EC A0 00                  455         .word app_space 
      0081EE CD 84 82         [ 4]  456         call SWAPP 
      0081F1 CD 86 A6         [ 4]  457         call SUBB 
      0081F4 CD 84 AB         [ 4]  458         call  ZLESS 
      0081F7 CD 83 76         [ 4]  459         call QBRAN 
      0081FA 82 4A                  460         .word CANT_FORGET 
                                    461 ; ( ca na -- )        
                                    462 ;reset ivec with address >= ca
      0081FC CD 84 82         [ 4]  463         call SWAPP ; ( na ca -- ) 
      0081FF CD 9D 1E         [ 4]  464         call CHKIVEC ; ( na -- ) 
                                    465 ; start at LAST and link back to na 
                                    466 ; if variable found reset VP at that point.
      008202                        467 FORGET1:
      008202 CD 85 CC         [ 4]  468         call LAST 
      008205 CD 83 CB         [ 4]  469         call AT 
      008208 CD 84 72         [ 4]  470         call DUPP  ; ( -- na last last )
      00820B CD 82 6E         [ 4]  471         call FREEVAR ; ( -- na last )
      00820E CD 84 72         [ 4]  472         call DUPP 
      008211 CD 83 43         [ 4]  473         call DOLIT 
      008214 00 02                  474         .word 2 
      008216 CD 86 A6         [ 4]  475         call SUBB ; ( na last -- na last lfa ) link address 
      008219 CD 83 CB         [ 4]  476         call AT 
      00821C CD 84 72         [ 4]  477         call DUPP ; ( -- na last a a )
      00821F CD 85 A0         [ 4]  478         call CNTXT 
      008222 CD 83 B4         [ 4]  479         call STORE
      008225 CD 85 CC         [ 4]  480         call LAST  
      008228 CD 83 B4         [ 4]  481         call STORE ; ( --  na last )
      00822B CD 84 9C         [ 4]  482         call OVER 
      00822E CD 86 CE         [ 4]  483         call EQUAL ; ( na last na -- na T|F ) 
      008231 CD 83 76         [ 4]  484         call QBRAN 
      008234 82 02                  485         .word FORGET1 
                                    486 ; ( na -- )
      008236 CD 83 43         [ 4]  487         call DOLIT 
      008239 00 02                  488         .word 2 
      00823B CD 86 A6         [ 4]  489         call SUBB 
      00823E CD 85 BC         [ 4]  490         call CPP 
      008241 CD 83 B4         [ 4]  491         call STORE  
      008244 CD 99 DA         [ 4]  492         call UPDATCP 
      008247 CC 99 B1         [ 2]  493         jp UPDATLAST 
      00824A                        494 CANT_FORGET:
      00824A CD 92 14         [ 4]  495         call ABORQ
      00824D 0A                     496         .byte 10
      00824E 20 50 72 6F 74 65 63   497         .ascii " Protected"
             74 65 64
      008258                        498 FORGET2:
      008258 CD 92 14         [ 4]  499         call ABORQ
      00825B 05                     500         .byte 5
      00825C 20 77 68 61 74         501         .ascii " what"
      008261                        502 FORGET4:
      008261 CC 84 68         [ 2]  503         jp DROP 
                                    504 
                                    505 ;---------------------------------
                                    506 ; if na is variable 
                                    507 ; free variable data  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



                                    508 ; FREEVAR ( na -- )
                                    509 ;---------------------------------
      008264 81 C9                  510         .word LINK 
                           0001E6   511         LINK=.
      008266 07                     512         .byte 7 
      008267 46 52 45 45 56 41 52   513         .ascii "FREEVAR"
      00826E                        514 FREEVAR:
      00826E CD 84 72         [ 4]  515         call DUPP ; ( na na -- )
      008271 CD 83 E9         [ 4]  516         CALL CAT  ; ( na c -- )
      008274 CD 89 27         [ 4]  517         call ONEP ;
      008277 CD 86 48         [ 4]  518         CALL PLUS ; ( na c+1 -- ca ) 
      00827A CD 89 27         [ 4]  519         call ONEP ; ( ca+ -- ) to get routne address 
      00827D CD 84 72         [ 4]  520         call DUPP ; ( ca+ ca+ -- )
      008280 CD 83 CB         [ 4]  521         CALL AT   ; ( ca+ fnaddr -- ) ; fnaddr is routine address 
      008283 CD 83 43         [ 4]  522         call DOLIT 
      008286 85 1F                  523         .word DOVAR ; if routine address is DOVAR then variable 
      008288 CD 86 CE         [ 4]  524         call EQUAL  ; ( ca+ fnaddr DOVAR -- ca+ T|F ) 
      00828B CD 83 76         [ 4]  525         call QBRAN 
      00828E 82 A4                  526         .word FREEVAR4 
      008290 CD 83 43         [ 4]  527         call DOLIT 
      008293 00 02                  528         .word 2 
      008295 CD 86 48         [ 4]  529         call PLUS  ; ( ca+ 2 -- da ) da is data address 
      008298 CD 83 CB         [ 4]  530         call AT 
      00829B CD 85 AE         [ 4]  531         call VPP   
      00829E CD 83 B4         [ 4]  532         call STORE 
      0082A1 CC 99 F1         [ 2]  533         jp UPDATVP 
      0082A4                        534 FREEVAR4: ; not variable
      0082A4 CC 84 68         [ 2]  535         jp  DROP 
                                    536 
                                    537 ;;
                                    538 ;; get millisecond counter 
                                    539 ;; msec ( -- u )
                                    540 ;; Added by Picatout 2020-04-26
      0082A7 82 66                  541         .word LINK  
                           000229   542         LINK = . 
      0082A9 04                     543         .byte 4
      0082AA 4D 53 45 43            544         .ascii "MSEC"
      0082AE                        545 MSEC: 
      0082AE 1D 00 02         [ 2]  546         subw x,#CELLL 
      0082B1 90 BE 2A         [ 2]  547         ldw y,MS 
      0082B4 FF               [ 2]  548         ldw (x),y 
      0082B5 81               [ 4]  549         ret 
                                    550 
                                    551 ; suspend execution for u msec 
                                    552 ;  pause ( u -- )
      0082B6 82 A9                  553         .word LINK 
                           000238   554         LINK=.
      0082B8 05                     555         .byte 5 
      0082B9 50 41 55 53 45         556         .ascii "PAUSE"
      0082BE                        557 PAUSE:
      0082BE 90 93            [ 1]  558         ldw y,x
      0082C0 90 FE            [ 2]  559         ldw y,(y)
      0082C2 72 B9 00 2A      [ 2]  560         addw y,MS 
      0082C6 8F               [10]  561 1$:     wfi  
      0082C7 90 B3 2A         [ 2]  562         cpw y,MS  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]



      0082CA 26 FA            [ 1]  563         jrne 1$        
      0082CC 1C 00 02         [ 2]  564         addw x,#CELLL 
      0082CF 81               [ 4]  565         ret 
                                    566 
                                    567 ; initialize count down timer 
                                    568 ;  TIMER ( u -- )  milliseconds 
      0082D0 82 B8                  569         .word LINK 
                           000252   570         LINK=.
      0082D2 05                     571         .byte 5 
      0082D3 54 49 4D 45 52         572         .ascii "TIMER" 
      0082D8                        573 TIMER:
      0082D8 90 93            [ 1]  574         ldw y,x
      0082DA 90 FE            [ 2]  575         ldw y,(y) 
      0082DC 90 BF 2C         [ 2]  576         ldw CNTDWN,y
      0082DF 1C 00 02         [ 2]  577         addw x,#CELLL 
      0082E2 81               [ 4]  578         ret 
                                    579 
                                    580 ; check for TIMER exiparition 
                                    581 ;  TIMEOUT? ( -- 0|-1 )
      0082E3 82 D2                  582         .word LINK 
                           000265   583         LINK=. 
      0082E5 08                     584         .byte 8 
      0082E6 54 49 4D 45 4F 55 54   585         .ascii "TIMEOUT?"
             3F
      0082EE                        586 TIMEOUTQ: 
      0082EE 4F               [ 1]  587         clr a
      0082EF 1D 00 02         [ 2]  588         subw x,#CELLL 
      0082F2 90 BE 2C         [ 2]  589         ldw y,CNTDWN 
      0082F5 26 01            [ 1]  590         jrne 1$ 
      0082F7 43               [ 1]  591         cpl a 
      0082F8 E7 01            [ 1]  592 1$:     ld (1,x),a 
      0082FA F7               [ 1]  593         ld (x),a 
      0082FB 81               [ 4]  594         ret         
                                    595 
                                    596 ; reboot MCU 
                                    597 ; REBOOT ( -- )
      0082FC 82 E5                  598         .word LINK 
                           00027E   599         LINK=. 
      0082FE 06                     600         .byte 6 
      0082FF 52 45 42 4F 4F 54      601         .ascii "REBOOT"
      008305                        602 reboot:
      008305 CC 80 80         [ 2]  603         jp NonHandledInterrupt
                                    604         
                                    605 
                                    606 ;; Device dependent I/O
                                    607 ;       ?RX     ( -- c T | F )
                                    608 ;         Return input byte and true, or false.
      008308 82 FE                  609         .word      LINK 
                           00028A   610 LINK	= .
      00830A 04                     611         .byte      4
      00830B 3F 4B 45 59            612         .ascii     "?KEY"
      00830F                        613 QKEY:
      00830F 90 5F            [ 1]  614         CLRW Y 
      008311 72 0B 52 30 0B   [ 2]  615         BTJF UART1_SR,#UART_SR_RXNE,INCH   ;check status
      008316 C6 52 31         [ 1]  616         LD    A,UART1_DR   ;get char in A
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 13.
Hexadecimal [24-Bits]



      008319 1D 00 02         [ 2]  617 	SUBW	X,#2
      00831C E7 01            [ 1]  618         LD     (1,X),A
      00831E 7F               [ 1]  619 	CLR	(X)
      00831F 90 53            [ 2]  620         CPLW     Y
      008321                        621 INCH:
      008321 1D 00 02         [ 2]  622 	SUBW	X,#2
      008324 FF               [ 2]  623         LDW     (X),Y
      008325 81               [ 4]  624         RET
                                    625 
                                    626 ;       TX!     ( c -- )
                                    627 ;       Send character c to  output device.
      008326 83 0A                  628         .word      LINK
                           0002A8   629 LINK	= .
      008328 04                     630         .byte      4
      008329 45 4D 49 54            631         .ascii     "EMIT"
      00832D                        632 EMIT:
      00832D E6 01            [ 1]  633         LD     A,(1,X)
      00832F 1C 00 02         [ 2]  634 	ADDW	X,#2
      008332 72 0F 52 30 FB   [ 2]  635 OUTPUT: BTJF UART1_SR,#UART_SR_TXE,OUTPUT  ;loop until tdre
      008337 C7 52 31         [ 1]  636         LD    UART1_DR,A   ;send A
      00833A 81               [ 4]  637         RET
                                    638 
                                    639 ;; The kernel
                                    640 
                                    641 ;       doLIT   ( -- w )
                                    642 ;       Push an inline literal.
      00833B 83 28                  643         .word      LINK
                           0002BD   644 LINK	= 	.
      00833D 45                     645 	.byte      COMPO+5
      00833E 44 4F 4C 49 54         646         .ascii     "DOLIT"
      008343                        647 DOLIT:
      008343 1D 00 02         [ 2]  648 	SUBW X,#2
                           000001   649 .if PICATOUT_MOD 
      008346 16 01            [ 2]  650         ldw y,(1,sp)
      008348 90 FE            [ 2]  651         ldw y,(y)
      00834A FF               [ 2]  652         ldw (x),y
      00834B 90 85            [ 2]  653         popw y 
      00834D 90 EC 02         [ 2]  654         jp (2,y)
                           000000   655 .else 
                                    656         POPW Y
                                    657 	LDW YTEMP,Y
                                    658 	LDW Y,(Y)
                                    659         LDW (X),Y
                                    660         LDW Y,YTEMP
                                    661 	JP (2,Y)
                                    662 .endif 
                                    663 
                                    664 ;       next    ( -- )
                                    665 ;       Code for  single index loop.
      008350 83 3D                  666         .word      LINK
                           0002D2   667 LINK	= 	.
      008352 44                     668 	.byte      COMPO+4
      008353 4E 45 58 54            669         .ascii     "NEXT"
      008357                        670 DONXT:
      008357 16 03            [ 2]  671 	LDW Y,(3,SP)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 14.
Hexadecimal [24-Bits]



      008359 90 5A            [ 2]  672 	DECW Y
      00835B 2A 07            [ 1]  673 	JRPL NEX1 ; jump if N=0
      00835D 90 85            [ 2]  674 	POPW Y
                           000001   675 .if PICATOUT_MOD
      00835F 5B 02            [ 2]  676         addw sp,#2
                           000000   677 .else        
                                    678 	POP A
                                    679 	POP A
                                    680 .endif         
      008361 90 EC 02         [ 2]  681         JP (2,Y)
      008364                        682 NEX1:
      008364 17 03            [ 2]  683         LDW (3,SP),Y
      008366 90 85            [ 2]  684         POPW Y
      008368 90 FE            [ 2]  685 	LDW Y,(Y)
      00836A 90 FC            [ 2]  686 	JP (Y)
                                    687 
                                    688 ;       ?branch ( f -- )
                                    689 ;       Branch if flag is zero.
      00836C 83 52                  690         .word      LINK
                           0002EE   691 LINK	= 	.
      00836E 47                     692 	.byte      COMPO+7
      00836F 3F 42 52 41 4E 43 48   693         .ascii     "?BRANCH"
      008376                        694 QBRAN:	
      008376 90 93            [ 1]  695         LDW Y,X
      008378 1C 00 02         [ 2]  696 	ADDW X,#2
      00837B 90 FE            [ 2]  697 	LDW Y,(Y)
      00837D 27 0E            [ 1]  698         JREQ     BRAN
      00837F 90 85            [ 2]  699 	POPW Y
      008381 90 EC 02         [ 2]  700 	JP (2,Y)
                                    701         
                                    702 ;       branch  ( -- )
                                    703 ;       Branch to an inline address.
      008384 83 6E                  704         .word      LINK
                           000306   705 LINK	= 	.
      008386 46                     706 	.byte      COMPO+6
      008387 42 52 41 4E 43 48      707         .ascii     "BRANCH"
      00838D                        708 BRAN:
      00838D 90 85            [ 2]  709         POPW Y
      00838F 90 FE            [ 2]  710 	LDW Y,(Y)
      008391 90 FC            [ 2]  711         JP     (Y)
                                    712 
                                    713 ;       EXECUTE ( ca -- )
                                    714 ;       Execute  word at ca.
      008393 83 86                  715         .word      LINK
                           000315   716 LINK	= 	.
      008395 07                     717         .byte       7
      008396 45 58 45 43 55 54 45   718         .ascii     "EXECUTE"
      00839D                        719 EXECU:
      00839D 90 93            [ 1]  720         LDW Y,X
      00839F 1C 00 02         [ 2]  721 	ADDW X,#2
      0083A2 90 FE            [ 2]  722 	LDW  Y,(Y)
      0083A4 90 FC            [ 2]  723         JP   (Y)
                                    724 
                                    725 ;       EXIT    ( -- )
                                    726 ;       Terminate a colon definition.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 15.
Hexadecimal [24-Bits]



      0083A6 83 95                  727         .word      LINK
                           000328   728 LINK = .
      0083A8 04                     729         .byte      4
      0083A9 45 58 49 54            730         .ascii     "EXIT"
      0083AD                        731 EXIT:
      0083AD 90 85            [ 2]  732         POPW Y
      0083AF 81               [ 4]  733         RET
                                    734 
                                    735 ;       !       ( w a -- )
                                    736 ;       Pop  data stack to memory.
      0083B0 83 A8                  737         .word      LINK
                           000332   738 LINK = .
      0083B2 01                     739         .byte      1
      0083B3 21                     740         .ascii     "!"
      0083B4                        741 STORE:
      0083B4 90 93            [ 1]  742         LDW Y,X
      0083B6 90 FE            [ 2]  743         LDW Y,(Y)    ;Y=a
      0083B8 90 BF 20         [ 2]  744         LDW YTEMP,Y
      0083BB 90 93            [ 1]  745         LDW Y,X
      0083BD 90 EE 02         [ 2]  746         LDW Y,(2,Y)
      0083C0 91 CF 20         [ 5]  747         LDW [YTEMP],Y ;store w at a
      0083C3 1C 00 04         [ 2]  748         ADDW X,#4 ; DDROP 
      0083C6 81               [ 4]  749         RET     
                                    750 
                                    751 ;       @       ( a -- w )
                                    752 ;       Push memory location to stack.
      0083C7 83 B2                  753         .word      LINK
                           000349   754 LINK	= 	.
      0083C9 01                     755         .byte    1
      0083CA 40                     756         .ascii	"@"
      0083CB                        757 AT:
      0083CB 90 93            [ 1]  758         LDW Y,X     ;Y = a
      0083CD 90 FE            [ 2]  759         LDW Y,(Y)   ; address 
      0083CF 90 FE            [ 2]  760         LDW Y,(Y)   ; value 
      0083D1 FF               [ 2]  761         LDW (X),Y ;w = @Y
      0083D2 81               [ 4]  762         RET     
                                    763 
                                    764 ;       C!      ( c b -- )
                                    765 ;       Pop  data stack to byte memory.
      0083D3 83 C9                  766         .word      LINK
                           000355   767 LINK	= .
      0083D5 02                     768         .byte      2
      0083D6 43 21                  769         .ascii     "C!"
      0083D8                        770 CSTOR:
      0083D8 90 93            [ 1]  771         LDW Y,X
      0083DA 90 FE            [ 2]  772 	LDW Y,(Y)    ;Y=b
      0083DC E6 03            [ 1]  773         LD A,(3,X)    ;D = c
      0083DE 90 F7            [ 1]  774         LD  (Y),A     ;store c at b
      0083E0 1C 00 04         [ 2]  775 	ADDW X,#4 ; DDROP 
      0083E3 81               [ 4]  776         RET     
                                    777 
                                    778 ;       C@      ( b -- c )
                                    779 ;       Push byte in memory to  stack.
      0083E4 83 D5                  780         .word      LINK
                           000366   781 LINK	= 	.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 16.
Hexadecimal [24-Bits]



      0083E6 02                     782         .byte      2
      0083E7 43 40                  783         .ascii     "C@"
      0083E9                        784 CAT:
      0083E9 90 93            [ 1]  785         LDW Y,X     ;Y=b
      0083EB 90 FE            [ 2]  786         LDW Y,(Y)
      0083ED 90 F6            [ 1]  787         LD A,(Y)
      0083EF E7 01            [ 1]  788         LD (1,X),A
      0083F1 7F               [ 1]  789         CLR (X)
      0083F2 81               [ 4]  790         RET     
                                    791 
                                    792 ;       RP@     ( -- a )
                                    793 ;       Push current RP to data stack.
      0083F3 83 E6                  794         .word      LINK
                           000375   795 LINK	= .
      0083F5 03                     796         .byte      3
      0083F6 52 50 40               797         .ascii     "RP@"
      0083F9                        798 RPAT:
      0083F9 90 96            [ 1]  799         LDW Y,SP    ;save return addr
      0083FB 1D 00 02         [ 2]  800         SUBW X,#2
      0083FE FF               [ 2]  801         LDW (X),Y
      0083FF 81               [ 4]  802         RET     
                                    803 
                                    804 ;       RP!     ( a -- )
                                    805 ;       Set  return stack pointer.
      008400 83 F5                  806         .word      LINK
                           000382   807 LINK	= 	. 
      008402 43                     808 	.byte      COMPO+3
      008403 52 50 21               809         .ascii     "RP!"
      008406                        810 RPSTO:
      008406 90 85            [ 2]  811         POPW Y
      008408 90 BF 20         [ 2]  812         LDW YTEMP,Y
      00840B 90 93            [ 1]  813         LDW Y,X
      00840D 90 FE            [ 2]  814         LDW Y,(Y)
      00840F 90 94            [ 1]  815         LDW SP,Y
      008411 1C 00 02         [ 2]  816         ADDW x,#CELLL ; a was not dropped, Picatout 2020-05-24
      008414 92 CC 20         [ 5]  817         JP [YTEMP]
                                    818 
                                    819 ;       R>      ( -- w )
                                    820 ;       Pop return stack to data stack.
      008417 84 02                  821         .word      LINK
                           000399   822 LINK	= 	. 
      008419 42                     823 	.byte      COMPO+2
      00841A 52 3E                  824         .ascii     "R>"
      00841C                        825 RFROM:
      00841C 90 85            [ 2]  826         POPW Y    ;save return addr
      00841E 90 BF 20         [ 2]  827         LDW YTEMP,Y
      008421 90 85            [ 2]  828         POPW Y
      008423 1D 00 02         [ 2]  829         SUBW X,#2
      008426 FF               [ 2]  830         LDW (X),Y
      008427 92 CC 20         [ 5]  831         JP [YTEMP]
                                    832 
                                    833 ;       R@      ( -- w )
                                    834 ;       Copy top of return stack to stack.
      00842A 84 19                  835         .word      LINK
                           0003AC   836 LINK	= 	. 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 17.
Hexadecimal [24-Bits]



      00842C 02                     837         .byte      2
      00842D 52 40                  838         .ascii     "R@"
      00842F                        839 RAT:
                           000001   840 .if PICATOUT_MOD
      00842F 16 03            [ 2]  841         ldw y,(3,sp)
      008431 1D 00 02         [ 2]  842         subw x,#CELLL 
      008434 FF               [ 2]  843         ldw (x),y 
      008435 81               [ 4]  844         ret 
                           000000   845 .else 
                                    846         POPW Y
                                    847         LDW YTEMP,Y
                                    848         POPW Y
                                    849         PUSHW Y
                                    850         SUBW X,#2
                                    851         LDW (X),Y
                                    852         JP [YTEMP]
                                    853 .endif         
                                    854 
                                    855 ;       >R      ( w -- )
                                    856 ;       Push data stack to return stack.
      008436 84 2C                  857         .word      LINK
                           0003B8   858 LINK	= 	. 
      008438 42                     859 	.byte      COMPO+2
      008439 3E 52                  860         .ascii     ">R"
      00843B                        861 TOR:
      00843B 90 85            [ 2]  862         POPW Y    ;save return addr
      00843D 90 BF 20         [ 2]  863         LDW YTEMP,Y
      008440 90 93            [ 1]  864         LDW Y,X
      008442 90 FE            [ 2]  865         LDW Y,(Y)
      008444 90 89            [ 2]  866         PUSHW Y    ;restore return addr
      008446 1C 00 02         [ 2]  867         ADDW X,#2
      008449 92 CC 20         [ 5]  868         JP [YTEMP]
                                    869 
                                    870 ;       SP@     ( -- a )
                                    871 ;       Push current stack pointer.
      00844C 84 38                  872         .word      LINK
                           0003CE   873 LINK	= 	. 
      00844E 03                     874         .byte      3
      00844F 53 50 40               875         .ascii     "SP@"
      008452                        876 SPAT:
      008452 90 93            [ 1]  877 	LDW Y,X
      008454 1D 00 02         [ 2]  878         SUBW X,#2
      008457 FF               [ 2]  879 	LDW (X),Y
      008458 81               [ 4]  880         RET     
                                    881 
                                    882 ;       SP!     ( a -- )
                                    883 ;       Set  data stack pointer.
      008459 84 4E                  884         .word      LINK
                           0003DB   885 LINK	= 	. 
      00845B 03                     886         .byte      3
      00845C 53 50 21               887         .ascii     "SP!"
      00845F                        888 SPSTO:
      00845F FE               [ 2]  889         LDW     X,(X)     ;X = a
      008460 81               [ 4]  890         RET     
                                    891 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
Hexadecimal [24-Bits]



                                    892 ;       DROP    ( w -- )
                                    893 ;       Discard top stack item.
      008461 84 5B                  894         .word      LINK
                           0003E3   895 LINK	= 	. 
      008463 04                     896         .byte      4
      008464 44 52 4F 50            897         .ascii     "DROP"
      008468                        898 DROP:
      008468 1C 00 02         [ 2]  899         ADDW X,#2     
      00846B 81               [ 4]  900         RET     
                                    901 
                                    902 ;       DUP     ( w -- w w )
                                    903 ;       Duplicate  top stack item.
      00846C 84 63                  904         .word      LINK
                           0003EE   905 LINK	= 	. 
      00846E 03                     906         .byte      3
      00846F 44 55 50               907         .ascii     "DUP"
      008472                        908 DUPP:
      008472 90 93            [ 1]  909 	LDW Y,X
      008474 1D 00 02         [ 2]  910         SUBW X,#2
      008477 90 FE            [ 2]  911 	LDW Y,(Y)
      008479 FF               [ 2]  912 	LDW (X),Y
      00847A 81               [ 4]  913         RET     
                                    914 
                                    915 ;       SWAP    ( w1 w2 -- w2 w1 )
                                    916 ;       Exchange top two stack items.
      00847B 84 6E                  917         .word      LINK
                           0003FD   918 LINK	= 	. 
      00847D 04                     919         .byte      4
      00847E 53 57 41 50            920         .ascii     "SWAP"
      008482                        921 SWAPP:
      008482 90 93            [ 1]  922         LDW Y,X
      008484 90 FE            [ 2]  923         LDW Y,(Y)
      008486 90 BF 20         [ 2]  924         LDW YTEMP,Y
      008489 90 93            [ 1]  925         LDW Y,X
      00848B 90 EE 02         [ 2]  926         LDW Y,(2,Y)
      00848E FF               [ 2]  927         LDW (X),Y
      00848F 90 BE 20         [ 2]  928         LDW Y,YTEMP
      008492 EF 02            [ 2]  929         LDW (2,X),Y
      008494 81               [ 4]  930         RET     
                                    931 
                                    932 ;       OVER    ( w1 w2 -- w1 w2 w1 )
                                    933 ;       Copy second stack item to top.
      008495 84 7D                  934         .word      LINK
                           000417   935 LINK	= . 
      008497 04                     936         .byte      4
      008498 4F 56 45 52            937         .ascii     "OVER"
      00849C                        938 OVER:
      00849C 1D 00 02         [ 2]  939         SUBW X,#2
      00849F 90 93            [ 1]  940         LDW Y,X
      0084A1 90 EE 04         [ 2]  941         LDW Y,(4,Y)
      0084A4 FF               [ 2]  942         LDW (X),Y
      0084A5 81               [ 4]  943         RET     
                                    944 
                                    945 ;       0<      ( n -- t )
                                    946 ;       Return true if n is negative.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]



      0084A6 84 97                  947         .word      LINK
                           000428   948 LINK	= . 
      0084A8 02                     949         .byte      2
      0084A9 30 3C                  950         .ascii     "0<"
      0084AB                        951 ZLESS:
      0084AB A6 FF            [ 1]  952         LD A,#0xFF
      0084AD 90 93            [ 1]  953         LDW Y,X
      0084AF 90 FE            [ 2]  954         LDW Y,(Y)
      0084B1 2B 01            [ 1]  955         JRMI     ZL1
      0084B3 4F               [ 1]  956         CLR A   ;false
      0084B4 F7               [ 1]  957 ZL1:    LD     (X),A
      0084B5 E7 01            [ 1]  958         LD (1,X),A
      0084B7 81               [ 4]  959 	RET     
                                    960 
                                    961 ;       AND     ( w w -- w )
                                    962 ;       Bitwise AND.
      0084B8 84 A8                  963         .word      LINK
                           00043A   964 LINK	= . 
      0084BA 03                     965         .byte      3
      0084BB 41 4E 44               966         .ascii     "AND"
      0084BE                        967 ANDD:
      0084BE F6               [ 1]  968         LD  A,(X)    ;D=w
      0084BF E4 02            [ 1]  969         AND A,(2,X)
      0084C1 E7 02            [ 1]  970         LD (2,X),A
      0084C3 E6 01            [ 1]  971         LD A,(1,X)
      0084C5 E4 03            [ 1]  972         AND A,(3,X)
      0084C7 E7 03            [ 1]  973         LD (3,X),A
      0084C9 1C 00 02         [ 2]  974         ADDW X,#2
      0084CC 81               [ 4]  975         RET
                                    976 
                                    977 ;       OR      ( w w -- w )
                                    978 ;       Bitwise inclusive OR.
      0084CD 84 BA                  979         .word      LINK
                           00044F   980 LINK = . 
      0084CF 02                     981         .byte      2
      0084D0 4F 52                  982         .ascii     "OR"
      0084D2                        983 ORR:
      0084D2 F6               [ 1]  984         LD A,(X)    ;D=w
      0084D3 EA 02            [ 1]  985         OR A,(2,X)
      0084D5 E7 02            [ 1]  986         LD (2,X),A
      0084D7 E6 01            [ 1]  987         LD A,(1,X)
      0084D9 EA 03            [ 1]  988         OR A,(3,X)
      0084DB E7 03            [ 1]  989         LD (3,X),A
      0084DD 1C 00 02         [ 2]  990         ADDW X,#2
      0084E0 81               [ 4]  991         RET
                                    992 
                                    993 ;       XOR     ( w w -- w )
                                    994 ;       Bitwise exclusive OR.
      0084E1 84 CF                  995         .word      LINK
                           000463   996 LINK	= . 
      0084E3 03                     997         .byte      3
      0084E4 58 4F 52               998         .ascii     "XOR"
      0084E7                        999 XORR:
      0084E7 F6               [ 1] 1000         LD A,(X)    ;D=w
      0084E8 E8 02            [ 1] 1001         XOR A,(2,X)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]



      0084EA E7 02            [ 1] 1002         LD (2,X),A
      0084EC E6 01            [ 1] 1003         LD A,(1,X)
      0084EE E8 03            [ 1] 1004         XOR A,(3,X)
      0084F0 E7 03            [ 1] 1005         LD (3,X),A
      0084F2 1C 00 02         [ 2] 1006         ADDW X,#2
      0084F5 81               [ 4] 1007         RET
                                   1008 
                                   1009 ;       UM+     ( u u -- udsum )
                                   1010 ;       Add two unsigned single
                                   1011 ;       and return a double sum.
      0084F6 84 E3                 1012         .word      LINK
                           000478  1013 LINK	= . 
      0084F8 03                    1014         .byte      3
      0084F9 55 4D 2B              1015         .ascii     "UM+"
      0084FC                       1016 UPLUS:
      0084FC A6 01            [ 1] 1017         LD A,#1
      0084FE 90 93            [ 1] 1018         LDW Y,X
      008500 90 EE 02         [ 2] 1019         LDW Y,(2,Y)
      008503 90 BF 20         [ 2] 1020         LDW YTEMP,Y
      008506 90 93            [ 1] 1021         LDW Y,X
      008508 90 FE            [ 2] 1022         LDW Y,(Y)
      00850A 72 B9 00 20      [ 2] 1023         ADDW Y,YTEMP
      00850E EF 02            [ 2] 1024         LDW (2,X),Y
      008510 25 01            [ 1] 1025         JRC     UPL1
      008512 4F               [ 1] 1026         CLR A
      008513 E7 01            [ 1] 1027 UPL1:   LD     (1,X),A
      008515 7F               [ 1] 1028         CLR (X)
      008516 81               [ 4] 1029         RET
                                   1030 
                                   1031 ;; System and user variables
                                   1032 
                                   1033 ;       doVAR   ( -- a )
                                   1034 ;       Code for VARIABLE and CREATE.
      008517 84 F8                 1035         .word      LINK
                           000499  1036 LINK	= . 
      008519 45                    1037 	.byte      COMPO+5
      00851A 44 4F 56 41 52        1038         .ascii     "DOVAR"
      00851F                       1039 DOVAR:
      00851F 1D 00 02         [ 2] 1040 	SUBW X,#2
      008522 90 85            [ 2] 1041         POPW Y    ;get return addr (pfa)
                           000001  1042 .if PICATOUT_MOD
      008524 90 FE            [ 2] 1043         LDW Y,(Y) ; indirect address 
                                   1044 .endif ;PICATOUT_MOD        
      008526 FF               [ 2] 1045         LDW (X),Y    ;push on stack
      008527 81               [ 4] 1046         RET     ;go to RET of EXEC
                                   1047 
                                   1048 ;       BASE    ( -- a )
                                   1049 ;       Radix base for numeric I/O.
      008528 85 19                 1050         .word      LINK        
                           0004AA  1051 LINK = . 
      00852A 04                    1052         .byte      4
      00852B 42 41 53 45           1053         .ascii     "BASE"
      00852F                       1054 BASE:
      00852F 90 AE 00 06      [ 2] 1055 	LDW Y,#UBASE 
      008533 1D 00 02         [ 2] 1056 	SUBW X,#2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



      008536 FF               [ 2] 1057         LDW (X),Y
      008537 81               [ 4] 1058         RET
                                   1059 
                                   1060 ;       tmp     ( -- a )
                                   1061 ;       A temporary storage.
      008538 85 2A                 1062         .word      LINK
                                   1063         
                           0004BA  1064 LINK = . 
      00853A 03                    1065 	.byte      3
      00853B 54 4D 50              1066         .ascii     "TMP"
      00853E                       1067 TEMP:
      00853E 90 AE 00 08      [ 2] 1068 	LDW Y,#UTMP
      008542 1D 00 02         [ 2] 1069 	SUBW X,#2
      008545 FF               [ 2] 1070         LDW (X),Y
      008546 81               [ 4] 1071         RET
                                   1072 
                                   1073 ;       >IN     ( -- a )
                                   1074 ;        Hold parsing pointer.
      008547 85 3A                 1075         .word      LINK
                           0004C9  1076 LINK = . 
      008549 03                    1077         .byte      3
      00854A 3E 49 4E              1078         .ascii    ">IN"
      00854D                       1079 INN:
      00854D 90 AE 00 0A      [ 2] 1080 	LDW Y,#UINN 
      008551 1D 00 02         [ 2] 1081 	SUBW X,#2
      008554 FF               [ 2] 1082         LDW (X),Y
      008555 81               [ 4] 1083         RET
                                   1084 
                                   1085 ;       #TIB    ( -- a )
                                   1086 ;       Count in terminal input buffer.
      008556 85 49                 1087         .word      LINK
                           0004D8  1088 LINK = . 
      008558 04                    1089         .byte      4
      008559 23 54 49 42           1090         .ascii     "#TIB"
      00855D                       1091 NTIB:
      00855D 90 AE 00 0C      [ 2] 1092 	LDW Y,#UCTIB 
      008561 1D 00 02         [ 2] 1093 	SUBW X,#2
      008564 FF               [ 2] 1094         LDW (X),Y
      008565 81               [ 4] 1095         RET
                                   1096 
                           000001  1097 .if PICATOUT_MOD
                                   1098 ;       TBUF ( -- a )
                                   1099 ;       address of 128 bytes transaction buffer 
      008566 85 58                 1100         .word LINK 
                           0004E8  1101         LINK=.
      008568 04                    1102         .byte 4 
      008569 54 42 55 46           1103         .ascii "TBUF"
      00856D                       1104 TBUF:
      00856D 90 AE 16 80      [ 2] 1105         ldw y,#ROWBUFF
      008571 1D 00 02         [ 2] 1106         subw x,#CELLL
      008574 FF               [ 2] 1107         ldw (x),y 
      008575 81               [ 4] 1108         ret 
                                   1109 
                                   1110 
                                   1111 .endif ;PICATOUT_MOD
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]



                                   1112 
                                   1113 ;       "EVAL   ( -- a )
                                   1114 ;       Execution vector of EVAL.
      008576 85 68                 1115         .word      LINK
                           0004F8  1116 LINK = . 
      008578 05                    1117         .byte      5
      008579 27 45 56 41 4C        1118         .ascii     "'EVAL"
      00857E                       1119 TEVAL:
      00857E 90 AE 00 10      [ 2] 1120 	LDW Y,#UINTER 
      008582 1D 00 02         [ 2] 1121 	SUBW X,#2
      008585 FF               [ 2] 1122         LDW (X),Y
      008586 81               [ 4] 1123         RET
                                   1124 
                                   1125 ;       HLD     ( -- a )
                                   1126 ;       Hold a pointer of output string.
      008587 85 78                 1127         .word      LINK
                           000509  1128 LINK = . 
      008589 03                    1129         .byte      3
      00858A 48 4C 44              1130         .ascii     "HLD"
      00858D                       1131 HLD:
      00858D 90 AE 00 12      [ 2] 1132 	LDW Y,#UHLD 
      008591 1D 00 02         [ 2] 1133 	SUBW X,#2
      008594 FF               [ 2] 1134         LDW (X),Y
      008595 81               [ 4] 1135         RET
                                   1136 
                                   1137 ;       CONTEXT ( -- a )
                                   1138 ;       Start vocabulary search.
      008596 85 89                 1139         .word      LINK
                           000518  1140 LINK = . 
      008598 07                    1141         .byte      7
      008599 43 4F 4E 54 45 58 54  1142         .ascii     "CONTEXT"
      0085A0                       1143 CNTXT:
      0085A0 90 AE 00 14      [ 2] 1144 	LDW Y,#UCNTXT
      0085A4 1D 00 02         [ 2] 1145 	SUBW X,#2
      0085A7 FF               [ 2] 1146         LDW (X),Y
      0085A8 81               [ 4] 1147         RET
                                   1148 
                                   1149 ;       VP      ( -- a )
                                   1150 ;       Point to top of variables
      0085A9 85 98                 1151         .word      LINK
                           00052B  1152 LINK = . 
      0085AB 02                    1153         .byte      2
      0085AC 56 50                 1154         .ascii     "VP"
      0085AE                       1155 VPP:
      0085AE 90 AE 00 16      [ 2] 1156 	LDW Y,#UVP 
      0085B2 1D 00 02         [ 2] 1157 	SUBW X,#2
      0085B5 FF               [ 2] 1158         LDW (X),Y
      0085B6 81               [ 4] 1159         RET
                                   1160 
                           000001  1161 .if PICATOUT_MOD
                                   1162 ;       CP    ( -- a )
                                   1163 ;       Pointer to top of FLASH 
      0085B7 85 AB                 1164         .word LINK 
                           000539  1165         LINK=.
      0085B9 03                    1166         .byte 3 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



      0085BA 43 50                 1167         .ascii "CP"
      0085BC                       1168 CPP: 
      0085BC 90 AE 00 18      [ 2] 1169         ldw y,#UCP 
      0085C0 1D 00 02         [ 2] 1170         subw x,#CELLL 
      0085C3 FF               [ 2] 1171         ldw (x),y 
      0085C4 81               [ 4] 1172         ret                
                                   1173 .endif ;PICATOUT_MOD
                                   1174 
                                   1175 ;       LAST    ( -- a )
                                   1176 ;       Point to last name in dictionary.
      0085C5 85 B9                 1177         .word      LINK
                           000547  1178 LINK = . 
      0085C7 04                    1179         .byte      4
      0085C8 4C 41 53 54           1180         .ascii     "LAST"
      0085CC                       1181 LAST:
      0085CC 90 AE 00 1A      [ 2] 1182 	LDW Y,#ULAST 
      0085D0 1D 00 02         [ 2] 1183 	SUBW X,#2
      0085D3 FF               [ 2] 1184         LDW (X),Y
      0085D4 81               [ 4] 1185         RET
                                   1186 
                           000001  1187 .if PICATOUT_MOD
      0085D5 85 C7                 1188         .word LINK 
                           000557  1189         LINK=.
      0085D7 06                    1190         .byte 6
      0085D8 4F 46 46 53 45 54     1191         .ascii "OFFSET" 
      0085DE                       1192 OFFSET: 
      0085DE 1D 00 02         [ 2] 1193         subw x,#CELLL
      0085E1 90 AE 00 1C      [ 2] 1194         ldw y,#UOFFSET 
      0085E5 FF               [ 2] 1195         ldw (x),y 
      0085E6 81               [ 4] 1196         ret 
                                   1197 
                                   1198 ; adjust jump address adding OFFSET
                                   1199 ; ADR-ADJ ( a -- a+offset )
      0085E7                       1200 ADRADJ: 
      0085E7 CD 85 DE         [ 4] 1201         call OFFSET 
      0085EA CD 83 CB         [ 4] 1202         call AT 
      0085ED CC 86 48         [ 2] 1203         jp PLUS 
                                   1204 
                                   1205 .endif ; PICATOUT_MOD
                                   1206 
                                   1207 ;; Common functions
                                   1208 
                                   1209 ;       ?DUP    ( w -- w w | 0 )
                                   1210 ;       Dup tos if its is not zero.
      0085F0 85 D7                 1211         .word      LINK
                           000572  1212 LINK = . 
      0085F2 04                    1213         .byte      4
      0085F3 3F 44 55 50           1214         .ascii     "?DUP"
      0085F7                       1215 QDUP:
      0085F7 90 93            [ 1] 1216         LDW Y,X
      0085F9 90 FE            [ 2] 1217 	LDW Y,(Y)
      0085FB 27 04            [ 1] 1218         JREQ     QDUP1
      0085FD 1D 00 02         [ 2] 1219 	SUBW X,#2
      008600 FF               [ 2] 1220         LDW (X),Y
      008601 81               [ 4] 1221 QDUP1:  RET
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]



                                   1222 
                                   1223 ;       ROT     ( w1 w2 w3 -- w2 w3 w1 )
                                   1224 ;       Rot 3rd item to top.
      008602 85 F2                 1225         .word      LINK
                           000584  1226 LINK = . 
      008604 03                    1227         .byte      3
      008605 52 4F 54              1228         .ascii     "ROT"
      008608                       1229 ROT:
                           000001  1230 .if PICATOUT_MOD
      008608 90 93            [ 1] 1231         ldw y,x 
      00860A 90 FE            [ 2] 1232         ldw y,(y)
      00860C 90 89            [ 2] 1233         pushw y 
      00860E 90 93            [ 1] 1234         ldw y,x 
      008610 90 EE 04         [ 2] 1235         ldw y,(4,y)
      008613 FF               [ 2] 1236         ldw (x),y 
      008614 90 93            [ 1] 1237         ldw y,x 
      008616 90 EE 02         [ 2] 1238         ldw y,(2,y)
      008619 EF 04            [ 2] 1239         ldw (4,x),y 
      00861B 90 85            [ 2] 1240         popw y 
      00861D EF 02            [ 2] 1241         ldw (2,x),y
      00861F 81               [ 4] 1242         ret 
                           000000  1243 .else 
                                   1244         LDW Y,X
                                   1245 	LDW Y,(4,Y)
                                   1246 	LDW YTEMP,Y
                                   1247         LDW Y,X
                                   1248         LDW Y,(2,Y)
                                   1249         LDW XTEMP,Y
                                   1250         LDW Y,X
                                   1251         LDW Y,(Y)
                                   1252         LDW (2,X),Y
                                   1253         LDW Y,XTEMP
                                   1254         LDW (4,X),Y
                                   1255         LDW Y,YTEMP
                                   1256         LDW (X),Y
                                   1257         RET
                                   1258 .endif 
                                   1259 
                                   1260 ;       2DROP   ( w w -- )
                                   1261 ;       Discard two items on stack.
      008620 86 04                 1262         .word      LINK
                           0005A2  1263 LINK = . 
      008622 05                    1264         .byte      5
      008623 32 44 52 4F 50        1265         .ascii     "2DROP"
      008628                       1266 DDROP:
      008628 1C 00 04         [ 2] 1267         ADDW X,#4
      00862B 81               [ 4] 1268         RET
                                   1269 
                                   1270 ;       2DUP    ( w1 w2 -- w1 w2 w1 w2 )
                                   1271 ;       Duplicate top two items.
      00862C 86 22                 1272         .word      LINK
                           0005AE  1273 LINK = . 
      00862E 04                    1274         .byte      4
      00862F 32 44 55 50           1275         .ascii     "2DUP"
      008633                       1276 DDUP:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



      008633 1D 00 04         [ 2] 1277         SUBW X,#4
      008636 90 93            [ 1] 1278         LDW Y,X
      008638 90 EE 06         [ 2] 1279         LDW Y,(6,Y)
      00863B EF 02            [ 2] 1280         LDW (2,X),Y
      00863D 90 93            [ 1] 1281         LDW Y,X
      00863F 90 EE 04         [ 2] 1282         LDW Y,(4,Y)
      008642 FF               [ 2] 1283         LDW (X),Y
      008643 81               [ 4] 1284         RET
                                   1285 
                                   1286 ;       +       ( w w -- sum )
                                   1287 ;       Add top two items.
      008644 86 2E                 1288         .word      LINK
                           0005C6  1289 LINK = . 
      008646 01                    1290         .byte      1
      008647 2B                    1291         .ascii     "+"
      008648                       1292 PLUS:
      008648 90 93            [ 1] 1293         LDW Y,X
      00864A 90 FE            [ 2] 1294         LDW Y,(Y)
      00864C 90 BF 20         [ 2] 1295         LDW YTEMP,Y
      00864F 1C 00 02         [ 2] 1296         ADDW X,#2
      008652 90 93            [ 1] 1297         LDW Y,X
      008654 90 FE            [ 2] 1298         LDW Y,(Y)
      008656 72 B9 00 20      [ 2] 1299         ADDW Y,YTEMP
      00865A FF               [ 2] 1300         LDW (X),Y
      00865B 81               [ 4] 1301         RET
                                   1302 
                                   1303 ;       NOT     ( w -- w )
                                   1304 ;       One's complement of tos.
      00865C 86 46                 1305         .word      LINK
                           0005DE  1306 LINK = . 
      00865E 03                    1307         .byte      3
      00865F 4E 4F 54              1308         .ascii     "NOT"
      008662                       1309 INVER:
      008662 90 93            [ 1] 1310         LDW Y,X
      008664 90 FE            [ 2] 1311         LDW Y,(Y)
      008666 90 53            [ 2] 1312         CPLW Y
      008668 FF               [ 2] 1313         LDW (X),Y
      008669 81               [ 4] 1314         RET
                                   1315 
                                   1316 ;       NEGATE  ( n -- -n )
                                   1317 ;       Two's complement of tos.
      00866A 86 5E                 1318         .word      LINK
                           0005EC  1319 LINK = . 
      00866C 06                    1320         .byte      6
      00866D 4E 45 47 41 54 45     1321         .ascii     "NEGATE"
      008673                       1322 NEGAT:
      008673 90 93            [ 1] 1323         LDW Y,X
      008675 90 FE            [ 2] 1324         LDW Y,(Y)
      008677 90 50            [ 2] 1325         NEGW Y
      008679 FF               [ 2] 1326         LDW (X),Y
      00867A 81               [ 4] 1327         RET
                                   1328 
                                   1329 ;       DNEGATE ( d -- -d )
                                   1330 ;       Two's complement of top double.
      00867B 86 6C                 1331         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



                           0005FD  1332 LINK = . 
      00867D 07                    1333         .byte      7
      00867E 44 4E 45 47 41 54 45  1334         .ascii     "DNEGATE"
      008685                       1335 DNEGA:
      008685 90 93            [ 1] 1336         LDW Y,X
      008687 90 FE            [ 2] 1337 	LDW Y,(Y)
      008689 90 53            [ 2] 1338         CPLW Y     
      00868B 90 BF 20         [ 2] 1339 	LDW YTEMP,Y
      00868E 90 93            [ 1] 1340         LDW Y,X
      008690 90 EE 02         [ 2] 1341         LDW Y,(2,Y)
      008693 90 53            [ 2] 1342         CPLW Y
      008695 90 5C            [ 2] 1343         INCW Y
      008697 EF 02            [ 2] 1344         LDW (2,X),Y
      008699 90 BE 20         [ 2] 1345         LDW Y,YTEMP
      00869C 24 02            [ 1] 1346         JRNC DN1 
      00869E 90 5C            [ 2] 1347         INCW Y
      0086A0 FF               [ 2] 1348 DN1:    LDW (X),Y
      0086A1 81               [ 4] 1349         RET
                                   1350 
                                   1351 ;       -       ( n1 n2 -- n1-n2 )
                                   1352 ;       Subtraction.
      0086A2 86 7D                 1353         .word      LINK
                           000624  1354 LINK = . 
      0086A4 01                    1355         .byte      1
      0086A5 2D                    1356         .ascii     "-"
      0086A6                       1357 SUBB:
      0086A6 90 93            [ 1] 1358         LDW Y,X
      0086A8 90 FE            [ 2] 1359         LDW Y,(Y)
      0086AA 90 BF 20         [ 2] 1360         LDW YTEMP,Y
      0086AD 1C 00 02         [ 2] 1361         ADDW X,#2
      0086B0 90 93            [ 1] 1362         LDW Y,X
      0086B2 90 FE            [ 2] 1363         LDW Y,(Y)
      0086B4 72 B2 00 20      [ 2] 1364         SUBW Y,YTEMP
      0086B8 FF               [ 2] 1365         LDW (X),Y
      0086B9 81               [ 4] 1366         RET
                                   1367 
                                   1368 ;       ABS     ( n -- n )
                                   1369 ;       Return  absolute value of n.
      0086BA 86 A4                 1370         .word      LINK
                           00063C  1371 LINK = . 
      0086BC 03                    1372         .byte      3
      0086BD 41 42 53              1373         .ascii     "ABS"
      0086C0                       1374 ABSS:
      0086C0 90 93            [ 1] 1375         LDW Y,X
      0086C2 90 FE            [ 2] 1376 	LDW Y,(Y)
      0086C4 2A 03            [ 1] 1377         JRPL     AB1     ;negate:
      0086C6 90 50            [ 2] 1378         NEGW     Y     ;else negate hi byte
      0086C8 FF               [ 2] 1379         LDW (X),Y
      0086C9 81               [ 4] 1380 AB1:    RET
                                   1381 
                                   1382 ;       =       ( w w -- t )
                                   1383 ;       Return true if top two are =al.
      0086CA 86 BC                 1384         .word      LINK
                           00064C  1385 LINK = . 
      0086CC 01                    1386         .byte      1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal [24-Bits]



      0086CD 3D                    1387         .ascii     "="
      0086CE                       1388 EQUAL:
      0086CE A6 FF            [ 1] 1389         LD A,#0xFF  ;true
      0086D0 90 93            [ 1] 1390         LDW Y,X    ;D = n2
      0086D2 90 FE            [ 2] 1391         LDW Y,(Y)
      0086D4 90 BF 20         [ 2] 1392         LDW YTEMP,Y
      0086D7 1C 00 02         [ 2] 1393         ADDW X,#2
      0086DA 90 93            [ 1] 1394         LDW Y,X
      0086DC 90 FE            [ 2] 1395         LDW Y,(Y)
      0086DE 90 B3 20         [ 2] 1396         CPW Y,YTEMP     ;if n2 <> n1
      0086E1 27 01            [ 1] 1397         JREQ     EQ1
      0086E3 4F               [ 1] 1398         CLR A
      0086E4 F7               [ 1] 1399 EQ1:    LD (X),A
      0086E5 E7 01            [ 1] 1400         LD (1,X),A
      0086E7 81               [ 4] 1401 	RET     
                                   1402 
                                   1403 ;       U<      ( u u -- t )
                                   1404 ;       Unsigned compare of top two items.
      0086E8 86 CC                 1405         .word      LINK
                           00066A  1406 LINK = . 
      0086EA 02                    1407         .byte      2
      0086EB 55 3C                 1408         .ascii     "U<"
      0086ED                       1409 ULESS:
      0086ED A6 FF            [ 1] 1410         LD A,#0xFF  ;true
      0086EF 90 93            [ 1] 1411         LDW Y,X    ;D = n2
      0086F1 90 FE            [ 2] 1412         LDW Y,(Y)
      0086F3 90 BF 20         [ 2] 1413         LDW YTEMP,Y
      0086F6 1C 00 02         [ 2] 1414         ADDW X,#2
      0086F9 90 93            [ 1] 1415         LDW Y,X
      0086FB 90 FE            [ 2] 1416         LDW Y,(Y)
      0086FD 90 B3 20         [ 2] 1417         CPW Y,YTEMP     ;if n2 <> n1
      008700 25 01            [ 1] 1418         JRULT     ULES1
      008702 4F               [ 1] 1419         CLR A
      008703 F7               [ 1] 1420 ULES1:  LD (X),A
      008704 E7 01            [ 1] 1421         LD (1,X),A
      008706 81               [ 4] 1422 	RET     
                                   1423 
                                   1424 ;       <       ( n1 n2 -- t )
                                   1425 ;       Signed compare of top two items.
      008707 86 EA                 1426         .word      LINK
                           000689  1427 LINK = . 
      008709 01                    1428         .byte      1
      00870A 3C                    1429         .ascii     "<"
      00870B                       1430 LESS:
      00870B A6 FF            [ 1] 1431         LD A,#0xFF  ;true
      00870D 90 93            [ 1] 1432         LDW Y,X    ;D = n2
      00870F 90 FE            [ 2] 1433         LDW Y,(Y)
      008711 90 BF 20         [ 2] 1434         LDW YTEMP,Y
      008714 1C 00 02         [ 2] 1435         ADDW X,#2
      008717 90 93            [ 1] 1436         LDW Y,X
      008719 90 FE            [ 2] 1437         LDW Y,(Y)
      00871B 90 B3 20         [ 2] 1438         CPW Y,YTEMP     ;if n2 <> n1
      00871E 2F 01            [ 1] 1439         JRSLT     LT1
      008720 4F               [ 1] 1440         CLR A
      008721 F7               [ 1] 1441 LT1:    LD (X),A
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



      008722 E7 01            [ 1] 1442         LD (1,X),A
      008724 81               [ 4] 1443 	RET     
                                   1444 
                                   1445 ;       MAX     ( n n -- n )
                                   1446 ;       Return greater of two top items.
      008725 87 09                 1447         .word      LINK
                           0006A7  1448 LINK = . 
      008727 03                    1449         .byte      3
      008728 4D 41 58              1450         .ascii     "MAX"
      00872B                       1451 MAX:
      00872B 90 93            [ 1] 1452         LDW Y,X    ;D = n2
      00872D 90 EE 02         [ 2] 1453         LDW Y,(2,Y)
      008730 90 BF 20         [ 2] 1454         LDW YTEMP,Y
      008733 90 93            [ 1] 1455         LDW Y,X
      008735 90 FE            [ 2] 1456         LDW Y,(Y)
      008737 90 B3 20         [ 2] 1457         CPW Y,YTEMP     ;if n2 <> n1
      00873A 2F 02            [ 1] 1458         JRSLT     MAX1
      00873C EF 02            [ 2] 1459         LDW (2,X),Y
      00873E 1C 00 02         [ 2] 1460 MAX1:   ADDW X,#2
      008741 81               [ 4] 1461 	RET     
                                   1462 
                                   1463 ;       MIN     ( n n -- n )
                                   1464 ;       Return smaller of top two items.
      008742 87 27                 1465         .word      LINK
                           0006C4  1466 LINK = . 
      008744 03                    1467         .byte      3
      008745 4D 49 4E              1468         .ascii     "MIN"
      008748                       1469 MIN:
      008748 90 93            [ 1] 1470         LDW Y,X    ;D = n2
      00874A 90 EE 02         [ 2] 1471         LDW Y,(2,Y)
      00874D 90 BF 20         [ 2] 1472         LDW YTEMP,Y
      008750 90 93            [ 1] 1473         LDW Y,X
      008752 90 FE            [ 2] 1474         LDW Y,(Y)
      008754 90 B3 20         [ 2] 1475         CPW Y,YTEMP     ;if n2 <> n1
      008757 2C 02            [ 1] 1476         JRSGT     MIN1
      008759 EF 02            [ 2] 1477         LDW (2,X),Y
      00875B 1C 00 02         [ 2] 1478 MIN1:	ADDW X,#2
      00875E 81               [ 4] 1479 	RET     
                                   1480 
                                   1481 ;       WITHIN  ( u ul uh -- t )
                                   1482 ;       Return true if u is within
                                   1483 ;       range of ul and uh. ( ul <= u < uh )
      00875F 87 44                 1484         .word      LINK
                           0006E1  1485 LINK = . 
      008761 06                    1486         .byte      6
      008762 57 49 54 48 49 4E     1487         .ascii     "WITHIN"
      008768                       1488 WITHI:
      008768 CD 84 9C         [ 4] 1489         CALL     OVER
      00876B CD 86 A6         [ 4] 1490         CALL     SUBB
      00876E CD 84 3B         [ 4] 1491         CALL     TOR
      008771 CD 86 A6         [ 4] 1492         CALL     SUBB
      008774 CD 84 1C         [ 4] 1493         CALL     RFROM
      008777 CC 86 ED         [ 2] 1494         JP     ULESS
                                   1495 
                                   1496 ;; Divide
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



                                   1497 
                                   1498 ;       UM/MOD  ( udl udh un -- ur uq )
                                   1499 ;       Unsigned divide of a double by a
                                   1500 ;       single. Return mod and quotient.
      00877A 87 61                 1501         .word      LINK
                           0006FC  1502 LINK = . 
      00877C 06                    1503         .byte      6
      00877D 55 4D 2F 4D 4F 44     1504         .ascii     "UM/MOD"
      008783                       1505 UMMOD:
      008783 BF 1E            [ 2] 1506 	LDW XTEMP,X	; save stack pointer
      008785 FE               [ 2] 1507 	LDW X,(X)	; un
      008786 BF 20            [ 2] 1508 	LDW YTEMP,X     ; save un
      008788 90 BE 1E         [ 2] 1509 	LDW Y,XTEMP	; stack pointer
      00878B 90 EE 04         [ 2] 1510 	LDW Y,(4,Y)     ; Y=udl
      00878E BE 1E            [ 2] 1511 	LDW X,XTEMP
      008790 EE 02            [ 2] 1512 	LDW X,(2,X)	; X=udh
      008792 B3 20            [ 2] 1513 	CPW X,YTEMP
      008794 23 0F            [ 2] 1514 	JRULE MMSM1
      008796 BE 1E            [ 2] 1515 	LDW X,XTEMP
      008798 1C 00 02         [ 2] 1516 	ADDW X,#2	; pop off 1 level
      00879B 90 AE FF FF      [ 2] 1517 	LDW Y,#0xFFFF
      00879F FF               [ 2] 1518 	LDW (X),Y
      0087A0 90 5F            [ 1] 1519 	CLRW Y
      0087A2 EF 02            [ 2] 1520 	LDW (2,X),Y
      0087A4 81               [ 4] 1521 	RET
      0087A5                       1522 MMSM1:
                           000001  1523 .if  PICATOUT_MOD 
                                   1524 ; take advantage of divw x,y when udh==0
      0087A5 5D               [ 2] 1525         tnzw x  ; is udh==0?
      0087A6 26 11            [ 1] 1526         jrne MMSM2 
      0087A8 93               [ 1] 1527         ldw x,y    ;udl 
      0087A9 90 BE 20         [ 2] 1528         ldw y,YTEMP ; divisor 
      0087AC 65               [ 2] 1529         divw x,y 
      0087AD 89               [ 2] 1530         pushw x     ; quotient 
      0087AE BE 1E            [ 2] 1531         ldw x,XTEMP 
      0087B0 1C 00 02         [ 2] 1532         addw x,#CELLL 
      0087B3 EF 02            [ 2] 1533         ldw (2,x),y  ; ur
      0087B5 90 85            [ 2] 1534         popw y 
      0087B7 FF               [ 2] 1535         ldw (x),y ; uq 
      0087B8 81               [ 4] 1536         ret 
      0087B9                       1537 MMSM2:        
                                   1538 .endif 
      0087B9 A6 11            [ 1] 1539 	LD A,#17	; loop count
      0087BB                       1540 MMSM3:
      0087BB B3 20            [ 2] 1541 	CPW X,YTEMP	; compare udh to un
      0087BD 25 04            [ 1] 1542 	JRULT MMSM4	; can't subtract
      0087BF 72 B0 00 20      [ 2] 1543 	SUBW X,YTEMP	; can subtract
      0087C3                       1544 MMSM4:
      0087C3 8C               [ 1] 1545 	CCF	; quotient bit
      0087C4 90 59            [ 2] 1546 	RLCW Y	; rotate into quotient
      0087C6 59               [ 2] 1547 	RLCW X	; rotate into remainder
      0087C7 4A               [ 1] 1548 	DEC A	; repeat
      0087C8 22 F1            [ 1] 1549 	JRUGT MMSM3
      0087CA 57               [ 2] 1550 	SRAW X
      0087CB BF 20            [ 2] 1551 	LDW YTEMP,X	; done, save remainder
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



      0087CD BE 1E            [ 2] 1552 	LDW X,XTEMP
      0087CF 1C 00 02         [ 2] 1553 	ADDW X,#2	; drop
      0087D2 FF               [ 2] 1554 	LDW (X),Y
      0087D3 90 BE 20         [ 2] 1555 	LDW Y,YTEMP	; save quotient
      0087D6 EF 02            [ 2] 1556 	LDW (2,X),Y
      0087D8 81               [ 4] 1557 	RET
                                   1558 	
                                   1559 ;       M/MOD   ( d n -- r q )
                                   1560 ;       Signed floored divide of double by
                                   1561 ;       single. Return mod and quotient.
      0087D9 87 7C                 1562         .word      LINK
                           00075B  1563 LINK = . 
      0087DB 05                    1564         .byte      5
      0087DC 4D 2F 4D 4F 44        1565         .ascii     "M/MOD"
      0087E1                       1566 MSMOD:  
      0087E1 CD 84 72         [ 4] 1567         CALL	DUPP
      0087E4 CD 84 AB         [ 4] 1568         CALL	ZLESS
      0087E7 CD 84 72         [ 4] 1569         CALL	DUPP
      0087EA CD 84 3B         [ 4] 1570         CALL	TOR
      0087ED CD 83 76         [ 4] 1571         CALL	QBRAN
      0087F0 87 FE                 1572         .word	MMOD1
      0087F2 CD 86 73         [ 4] 1573         CALL	NEGAT
      0087F5 CD 84 3B         [ 4] 1574         CALL	TOR
      0087F8 CD 86 85         [ 4] 1575         CALL	DNEGA
      0087FB CD 84 1C         [ 4] 1576         CALL	RFROM
      0087FE CD 84 3B         [ 4] 1577 MMOD1:	CALL	TOR
      008801 CD 84 72         [ 4] 1578         CALL	DUPP
      008804 CD 84 AB         [ 4] 1579         CALL	ZLESS
      008807 CD 83 76         [ 4] 1580         CALL	QBRAN
      00880A 88 12                 1581         .word	MMOD2
      00880C CD 84 2F         [ 4] 1582         CALL	RAT
      00880F CD 86 48         [ 4] 1583         CALL	PLUS
      008812 CD 84 1C         [ 4] 1584 MMOD2:	CALL	RFROM
      008815 CD 87 83         [ 4] 1585         CALL	UMMOD
      008818 CD 84 1C         [ 4] 1586         CALL	RFROM
      00881B CD 83 76         [ 4] 1587         CALL	QBRAN
      00881E 88 29                 1588         .word	MMOD3
      008820 CD 84 82         [ 4] 1589         CALL	SWAPP
      008823 CD 86 73         [ 4] 1590         CALL	NEGAT
      008826 CD 84 82         [ 4] 1591         CALL	SWAPP
      008829 81               [ 4] 1592 MMOD3:	RET
                                   1593 
                                   1594 ;       /MOD    ( n n -- r q )
                                   1595 ;       Signed divide. Return mod and quotient.
      00882A 87 DB                 1596         .word      LINK
                           0007AC  1597 LINK = . 
      00882C 04                    1598         .byte      4
      00882D 2F 4D 4F 44           1599         .ascii     "/MOD"
      008831                       1600 SLMOD:
      008831 CD 84 9C         [ 4] 1601         CALL	OVER
      008834 CD 84 AB         [ 4] 1602         CALL	ZLESS
      008837 CD 84 82         [ 4] 1603         CALL	SWAPP
      00883A CC 87 E1         [ 2] 1604         JP	MSMOD
                                   1605 
                                   1606 ;       MOD     ( n n -- r )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



                                   1607 ;       Signed divide. Return mod only.
      00883D 88 2C                 1608         .word      LINK
                           0007BF  1609 LINK = . 
      00883F 03                    1610         .byte      3
      008840 4D 4F 44              1611         .ascii     "MOD"
      008843                       1612 MODD:
      008843 CD 88 31         [ 4] 1613 	CALL	SLMOD
      008846 CC 84 68         [ 2] 1614 	JP	DROP
                                   1615 
                                   1616 ;       /       ( n n -- q )
                                   1617 ;       Signed divide. Return quotient only.
      008849 88 3F                 1618         .word      LINK
                           0007CB  1619 LINK = . 
      00884B 01                    1620         .byte      1
      00884C 2F                    1621         .ascii     "/"
      00884D                       1622 SLASH:
      00884D CD 88 31         [ 4] 1623         CALL	SLMOD
      008850 CD 84 82         [ 4] 1624         CALL	SWAPP
      008853 CC 84 68         [ 2] 1625         JP	DROP
                                   1626 
                                   1627 ;; Multiply
                                   1628 
                                   1629 ;       UM*     ( u u -- ud )
                                   1630 ;       Unsigned multiply. Return double product.
      008856 88 4B                 1631         .word      LINK
                           0007D8  1632 LINK = . 
      008858 03                    1633         .byte      3
      008859 55 4D 2A              1634         .ascii     "UM*"
      00885C                       1635 UMSTA:	; stack have 4 bytes u1=a,b u2=c,d
                           000001  1636 .if PICATOUT_MOD 
                                   1637 ; take advantage of SP addressing modes
                                   1638 ; these PRODx in RAM are not required
                                   1639 ; the product is kept on stack as local variable 
                                   1640         ;; bytes offset on data stack 
                           000002  1641         da=2 
                           000003  1642         db=3 
                           000000  1643         dc=0 
                           000001  1644         dd=1 
                                   1645         ;; product bytes offset on return stack 
                           000001  1646         UD1=1  ; ud bits 31..24
                           000002  1647         UD2=2  ; ud bits 23..16
                           000003  1648         UD3=3  ; ud bits 15..8 
                           000004  1649         UD4=4  ; ud bits 7..0 
                                   1650         ;; local variable for product set to zero   
      00885C 90 5F            [ 1] 1651         clrw y 
      00885E 90 89            [ 2] 1652         pushw y  ; bits 15..0
      008860 90 89            [ 2] 1653         pushw y  ; bits 31..16 
      008862 E6 03            [ 1] 1654         ld a,(db,x) ; b 
      008864 90 97            [ 1] 1655         ld yl,a 
      008866 E6 01            [ 1] 1656         ld a,(dd,x)   ; d
      008868 90 42            [ 4] 1657         mul y,a    ; b*d  
      00886A 17 03            [ 2] 1658         ldw (UD3,sp),y ; lowest weight product 
      00886C E6 03            [ 1] 1659         ld a,(db,x)
      00886E 90 97            [ 1] 1660         ld yl,a 
      008870 E6 00            [ 1] 1661         ld a,(dc,x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



      008872 90 42            [ 4] 1662         mul y,a  ; b*c 
                                   1663         ;;; do the partial sum 
      008874 72 F9 02         [ 2] 1664         addw y,(UD2,sp)
      008877 4F               [ 1] 1665         clr a 
      008878 49               [ 1] 1666         rlc a
      008879 6B 01            [ 1] 1667         ld (UD1,sp),a 
      00887B 17 02            [ 2] 1668         ldw (UD2,sp),y 
      00887D E6 02            [ 1] 1669         ld a,(da,x)
      00887F 90 97            [ 1] 1670         ld yl,a 
      008881 E6 01            [ 1] 1671         ld a,(dd,x)
      008883 90 42            [ 4] 1672         mul y,a   ; a*d 
                                   1673         ;; do partial sum 
      008885 72 F9 02         [ 2] 1674         addw y,(UD2,sp)
      008888 4F               [ 1] 1675         clr a 
      008889 19 01            [ 1] 1676         adc a,(UD1,sp)
      00888B 6B 01            [ 1] 1677         ld (UD1,sp),a  
      00888D 17 02            [ 2] 1678         ldw (UD2,sp),y 
      00888F E6 02            [ 1] 1679         ld a,(da,x)
      008891 90 97            [ 1] 1680         ld yl,a 
      008893 E6 00            [ 1] 1681         ld a,(dc,x)
      008895 90 42            [ 4] 1682         mul y,a  ;  a*c highest weight product 
                                   1683         ;;; do partial sum 
      008897 72 F9 01         [ 2] 1684         addw y,(UD1,sp)
      00889A FF               [ 2] 1685         ldw (x),y  ; udh 
      00889B 16 03            [ 2] 1686         ldw y,(UD3,sp)
      00889D EF 02            [ 2] 1687         ldw (2,x),y  ; udl  
      00889F 5B 04            [ 2] 1688         addw sp,#4 ; drop local variable 
      0088A1 81               [ 4] 1689         ret  
                           000000  1690 .else
                                   1691 	LD A,(2,X)	; b
                                   1692 	LD YL,A
                                   1693 	LD A,(X)	; d
                                   1694 	MUL Y,A
                                   1695 	LDW PROD1,Y
                                   1696 	LD A,(3,X)	; a
                                   1697 	LD YL,A
                                   1698 	LD A,(X)	; d
                                   1699 	MUL Y,A
                                   1700 	LDW PROD2,Y
                                   1701 	LD A,(2,X)	; b
                                   1702 	LD YL,A
                                   1703 	LD A,(1,X)	; c
                                   1704 	MUL Y,A
                                   1705 	LDW PROD3,Y
                                   1706 	LD A,(3,X)	; a
                                   1707 	LD YL,A
                                   1708 	LD A,(1,X)	; c
                                   1709 	MUL Y,A	; least signifiant product
                                   1710 	CLR A
                                   1711 	RRWA Y
                                   1712 	LD (3,X),A	; store least significant byte
                                   1713 	ADDW Y,PROD3
                                   1714 	CLR A
                                   1715 	ADC A,#0	; save carry
                                   1716 	LD CARRY,A
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



                                   1717 	ADDW Y,PROD2
                                   1718 	LD A,CARRY
                                   1719 	ADC A,#0	; add 2nd carry
                                   1720 	LD CARRY,A
                                   1721 	CLR A
                                   1722 	RRWA Y
                                   1723 	LD (2,X),A	; 2nd product byte
                                   1724 	ADDW Y,PROD1
                                   1725 	RRWA Y
                                   1726 	LD (1,X),A	; 3rd product byte
                                   1727 	RRWA Y  	; 4th product byte now in A
                                   1728 	ADC A,CARRY	; fill in carry bits
                                   1729 	LD (X),A
                                   1730 	RET
                                   1731 .endif 
                                   1732 
                                   1733 
                                   1734 ;       *       ( n n -- n )
                                   1735 ;       Signed multiply. Return single product.
      0088A2 88 58                 1736         .word      LINK
                           000824  1737 LINK = . 
      0088A4 01                    1738         .byte      1
      0088A5 2A                    1739         .ascii     "*"
      0088A6                       1740 STAR:
      0088A6 CD 88 5C         [ 4] 1741 	CALL	UMSTA
      0088A9 CC 84 68         [ 2] 1742 	JP	DROP
                                   1743 
                                   1744 ;       M*      ( n n -- d )
                                   1745 ;       Signed multiply. Return double product.
      0088AC 88 A4                 1746         .word      LINK
                           00082E  1747 LINK = . 
      0088AE 02                    1748         .byte      2
      0088AF 4D 2A                 1749         .ascii     "M*"
      0088B1                       1750 MSTAR:      
      0088B1 CD 86 33         [ 4] 1751         CALL	DDUP
      0088B4 CD 84 E7         [ 4] 1752         CALL	XORR
      0088B7 CD 84 AB         [ 4] 1753         CALL	ZLESS
      0088BA CD 84 3B         [ 4] 1754         CALL	TOR
      0088BD CD 86 C0         [ 4] 1755         CALL	ABSS
      0088C0 CD 84 82         [ 4] 1756         CALL	SWAPP
      0088C3 CD 86 C0         [ 4] 1757         CALL	ABSS
      0088C6 CD 88 5C         [ 4] 1758         CALL	UMSTA
      0088C9 CD 84 1C         [ 4] 1759         CALL	RFROM
      0088CC CD 83 76         [ 4] 1760         CALL	QBRAN
      0088CF 88 D4                 1761         .word	MSTA1
      0088D1 CD 86 85         [ 4] 1762         CALL	DNEGA
      0088D4 81               [ 4] 1763 MSTA1:	RET
                                   1764 
                                   1765 ;       . /MOD   ( n1 n2 n3 -- r q )
                                   1766 ;       Multiply n1 and n2, then divide
                                   1767 ;       by n3. Return mod and quotient.
      0088D5 88 AE                 1768         .word      LINK
                           000857  1769 LINK = . 
      0088D7 05                    1770         .byte      5
      0088D8 2A 2F 4D 4F 44        1771         .ascii     "*/MOD"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



      0088DD                       1772 SSMOD:
      0088DD CD 84 3B         [ 4] 1773         CALL     TOR
      0088E0 CD 88 B1         [ 4] 1774         CALL     MSTAR
      0088E3 CD 84 1C         [ 4] 1775         CALL     RFROM
      0088E6 CC 87 E1         [ 2] 1776         JP     MSMOD
                                   1777 
                                   1778 ;       */      ( n1 n2 n3 -- q )
                                   1779 ;       Multiply n1 by n2, then divide
                                   1780 ;       by n3. Return quotient only.
      0088E9 88 D7                 1781         .word      LINK
                           00086B  1782 LINK = . 
      0088EB 02                    1783         .byte      2
      0088EC 2A 2F                 1784         .ascii     "*/"
      0088EE                       1785 STASL:
      0088EE CD 88 DD         [ 4] 1786         CALL	SSMOD
      0088F1 CD 84 82         [ 4] 1787         CALL	SWAPP
      0088F4 CC 84 68         [ 2] 1788         JP	DROP
                                   1789 
                                   1790 ;; Miscellaneous
                                   1791 
                                   1792 ;       CELL+   ( a -- a )
                                   1793 ;       Add cell size in byte to address.
      0088F7 88 EB                 1794         .word      LINK
                           000879  1795 LINK = . 
      0088F9 02                    1796         .byte       2
      0088FA 32 2B                 1797         .ascii     "2+"
      0088FC                       1798 CELLP:
      0088FC 90 93            [ 1] 1799         LDW Y,X
      0088FE 90 FE            [ 2] 1800 	LDW Y,(Y)
      008900 72 A9 00 02      [ 2] 1801         ADDW Y,#CELLL 
      008904 FF               [ 2] 1802         LDW (X),Y
      008905 81               [ 4] 1803         RET
                                   1804 
                                   1805 ;       CELL-   ( a -- a )
                                   1806 ;       Subtract 2 from address.
      008906 88 F9                 1807         .word      LINK
                           000888  1808 LINK = . 
      008908 02                    1809         .byte       2
      008909 32 2D                 1810         .ascii     "2-"
      00890B                       1811 CELLM:
      00890B 90 93            [ 1] 1812         LDW Y,X
      00890D 90 FE            [ 2] 1813 	LDW Y,(Y)
      00890F 72 A2 00 02      [ 2] 1814         SUBW Y,#CELLL
      008913 FF               [ 2] 1815         LDW (X),Y
      008914 81               [ 4] 1816         RET
                                   1817 
                                   1818 ;       CELLS   ( n -- n )
                                   1819 ;       Multiply tos by 2.
      008915 89 08                 1820         .word      LINK
                           000897  1821 LINK = . 
      008917 02                    1822         .byte       2
      008918 32 2A                 1823         .ascii     "2*"
      00891A                       1824 CELLS:
      00891A 90 93            [ 1] 1825         LDW Y,X
      00891C 90 FE            [ 2] 1826 	LDW Y,(Y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



      00891E 90 58            [ 2] 1827         SLAW Y
      008920 FF               [ 2] 1828         LDW (X),Y
      008921 81               [ 4] 1829         RET
                                   1830 
                                   1831 ;       1+      ( a -- a )
                                   1832 ;       Add cell size in byte to address.
      008922 89 17                 1833         .word      LINK
                           0008A4  1834 LINK = . 
      008924 02                    1835         .byte      2
      008925 31 2B                 1836         .ascii     "1+"
      008927                       1837 ONEP:
      008927 90 93            [ 1] 1838         LDW Y,X
      008929 90 FE            [ 2] 1839 	LDW Y,(Y)
      00892B 90 5C            [ 2] 1840         INCW Y
      00892D FF               [ 2] 1841         LDW (X),Y
      00892E 81               [ 4] 1842         RET
                                   1843 
                                   1844 ;       1-      ( a -- a )
                                   1845 ;       Subtract 2 from address.
      00892F 89 24                 1846         .word      LINK
                           0008B1  1847 LINK = . 
      008931 02                    1848         .byte      2
      008932 31 2D                 1849         .ascii     "1-"
      008934                       1850 ONEM:
      008934 90 93            [ 1] 1851         LDW Y,X
      008936 90 FE            [ 2] 1852 	LDW Y,(Y)
      008938 90 5A            [ 2] 1853         DECW Y
      00893A FF               [ 2] 1854         LDW (X),Y
      00893B 81               [ 4] 1855         RET
                                   1856 
                                   1857 ;  shift left n times 
                                   1858 ; LSHIFT ( n1 n2 -- n1<<n2 )
      00893C 89 31                 1859         .word LINK 
                           0008BE  1860         LINK=.
      00893E 06                    1861         .byte 6 
      00893F 4C 53 48 49 46 54     1862         .ascii "LSHIFT"
      008945                       1863 LSHIFT:
      008945 E6 01            [ 1] 1864         ld a,(1,x)
      008947 1C 00 02         [ 2] 1865         addw x,#CELLL 
      00894A 90 93            [ 1] 1866         ldw y,x 
      00894C 90 FE            [ 2] 1867         ldw y,(y)
      00894E                       1868 LSHIFT1:
      00894E 4D               [ 1] 1869         tnz a 
      00894F 27 05            [ 1] 1870         jreq LSHIFT4 
      008951 90 58            [ 2] 1871         sllw y 
      008953 4A               [ 1] 1872         dec a 
      008954 20 F8            [ 2] 1873         jra LSHIFT1 
      008956                       1874 LSHIFT4:
      008956 FF               [ 2] 1875         ldw (x),y 
      008957 81               [ 4] 1876         ret 
                                   1877 
                                   1878 ; shift right n times                 
                                   1879 ; RSHIFT (n1 n2 -- n1>>n2 )
      008958 89 3E                 1880         .word LINK 
                           0008DA  1881         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



      00895A 06                    1882         .byte 6
      00895B 52 53 48 49 46 54     1883         .ascii "RSHIFT"
      008961                       1884 RSHIFT:
      008961 E6 01            [ 1] 1885         ld a,(1,x)
      008963 1C 00 02         [ 2] 1886         addw x,#CELLL 
      008966 90 93            [ 1] 1887         ldw y,x 
      008968 90 FE            [ 2] 1888         ldw y,(y)
      00896A                       1889 RSHIFT1:
      00896A 4D               [ 1] 1890         tnz a 
      00896B 27 05            [ 1] 1891         jreq RSHIFT4 
      00896D 90 54            [ 2] 1892         srlw y 
      00896F 4A               [ 1] 1893         dec a 
      008970 20 F8            [ 2] 1894         jra RSHIFT1 
      008972                       1895 RSHIFT4:
      008972 FF               [ 2] 1896         ldw (x),y 
      008973 81               [ 4] 1897         ret 
                                   1898 
                                   1899 
                                   1900 ;       2/      ( n -- n )
                                   1901 ;       Multiply tos by 2.
      008974 89 5A                 1902         .word      LINK
                           0008F6  1903 LINK = . 
      008976 02                    1904         .byte      2
      008977 32 2F                 1905         .ascii     "2/"
      008979                       1906 TWOSL:
      008979 90 93            [ 1] 1907         LDW Y,X
      00897B 90 FE            [ 2] 1908 	LDW Y,(Y)
      00897D 90 57            [ 2] 1909         SRAW Y
      00897F FF               [ 2] 1910         LDW (X),Y
      008980 81               [ 4] 1911         RET
                                   1912 
                                   1913 ;       BL      ( -- 32 )
                                   1914 ;       Return 32,  blank character.
      008981 89 76                 1915         .word      LINK
                           000903  1916 LINK = . 
      008983 02                    1917         .byte      2
      008984 42 4C                 1918         .ascii     "BL"
      008986                       1919 BLANK:
      008986 1D 00 02         [ 2] 1920         SUBW X,#2
      008989 90 AE 00 20      [ 2] 1921 	LDW Y,#32
      00898D FF               [ 2] 1922         LDW (X),Y
      00898E 81               [ 4] 1923         RET
                                   1924 
                                   1925 ;         0     ( -- 0)
                                   1926 ;         Return 0.
      00898F 89 83                 1927         .word      LINK
                           000911  1928 LINK = . 
      008991 01                    1929         .byte       1
      008992 30                    1930         .ascii     "0"
      008993                       1931 ZERO:
      008993 1D 00 02         [ 2] 1932         SUBW X,#2
      008996 90 5F            [ 1] 1933 	CLRW Y
      008998 FF               [ 2] 1934         LDW (X),Y
      008999 81               [ 4] 1935         RET
                                   1936 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



                                   1937 ;         1     ( -- 1)
                                   1938 ;         Return 1.
      00899A 89 91                 1939         .word      LINK
                           00091C  1940 LINK = . 
      00899C 01                    1941         .byte       1
      00899D 31                    1942         .ascii     "1"
      00899E                       1943 ONE:
      00899E 1D 00 02         [ 2] 1944         SUBW X,#2
      0089A1 90 AE 00 01      [ 2] 1945 	LDW Y,#1
      0089A5 FF               [ 2] 1946         LDW (X),Y
      0089A6 81               [ 4] 1947         RET
                                   1948 
                                   1949 ;         -1    ( -- -1)
                                   1950 ;         Return 32,  blank character.
      0089A7 89 9C                 1951         .word      LINK
                           000929  1952 LINK = . 
      0089A9 02                    1953         .byte       2
      0089AA 2D 31                 1954         .ascii     "-1"
      0089AC                       1955 MONE:
      0089AC 1D 00 02         [ 2] 1956         SUBW X,#2
      0089AF 90 AE FF FF      [ 2] 1957 	LDW Y,#0xFFFF
      0089B3 FF               [ 2] 1958         LDW (X),Y
      0089B4 81               [ 4] 1959         RET
                                   1960 
                                   1961 ;       >CHAR   ( c -- c )
                                   1962 ;       Filter non-printing characters.
      0089B5 89 A9                 1963         .word      LINK
                           000937  1964 LINK = . 
      0089B7 05                    1965         .byte      5
      0089B8 3E 43 48 41 52        1966         .ascii     ">CHAR"
      0089BD                       1967 TCHAR:
                           000001  1968 .if CONVERT_TO_CODE
      0089BD E6 01            [ 1] 1969         ld a,(1,x)
      0089BF A1 20            [ 1] 1970         cp a,#32  
      0089C1 2B 05            [ 1] 1971         jrmi 1$ 
      0089C3 A1 7F            [ 1] 1972         cp a,#127 
      0089C5 2A 01            [ 1] 1973         jrpl 1$ 
      0089C7 81               [ 4] 1974         ret 
      0089C8 A6 5F            [ 1] 1975 1$:     ld a,#'_ 
      0089CA E7 01            [ 1] 1976         ld (1,x),a 
      0089CC 81               [ 4] 1977         ret 
                           000000  1978 .else
                                   1979         CALL     DOLIT
                                   1980         .word       0x7F
                                   1981         CALL     ANDD
                                   1982         CALL     DUPP    ;mask msb
                                   1983         CALL     DOLIT
                                   1984         .word      127
                                   1985         CALL     BLANK
                                   1986         CALL     WITHI   ;check for printable
                                   1987         CALL     QBRAN
                                   1988         .word    TCHA1
                                   1989         CALL     DROP
                                   1990         CALL     DOLIT
                                   1991         .word     0x5F		; "_"     ;replace non-printables
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



                                   1992 .endif 
      0089CD 81               [ 4] 1993 TCHA1:  RET
                                   1994 
                                   1995 ;       DEPTH   ( -- n )
                                   1996 ;       Return  depth of  data stack.
      0089CE 89 B7                 1997         .word      LINK
                           000950  1998 LINK = . 
      0089D0 05                    1999         .byte      5
      0089D1 44 45 50 54 48        2000         .ascii     "DEPTH"
      0089D6                       2001 DEPTH: 
      0089D6 90 BE 26         [ 2] 2002         LDW Y,SP0    ;save data stack ptr
      0089D9 BF 1E            [ 2] 2003 	LDW XTEMP,X
      0089DB 72 B2 00 1E      [ 2] 2004         SUBW Y,XTEMP     ;#bytes = SP0 - X
      0089DF 90 57            [ 2] 2005         SRAW Y    ;Y = #stack items
                           000001  2006 .if PICATOUT_MOD
                                   2007 ; why ? 
                                   2008 ;      	DECW Y
                                   2009 .endif 
      0089E1 1D 00 02         [ 2] 2010 	SUBW X,#2
      0089E4 FF               [ 2] 2011         LDW (X),Y     ; if neg, underflow
      0089E5 81               [ 4] 2012         RET
                                   2013 
                                   2014 ;       PICK    ( ... +n -- ... w )
                                   2015 ;       Copy  nth stack item to tos.
      0089E6 89 D0                 2016         .word      LINK
                           000968  2017 LINK = . 
      0089E8 04                    2018         .byte      4
      0089E9 50 49 43 4B           2019         .ascii     "PICK"
      0089ED                       2020 PICK:
      0089ED 90 93            [ 1] 2021         LDW Y,X   ;D = n1
      0089EF 90 FE            [ 2] 2022         LDW Y,(Y)
      0089F1 90 58            [ 2] 2023         SLAW Y
      0089F3 BF 1E            [ 2] 2024         LDW XTEMP,X
      0089F5 72 B9 00 1E      [ 2] 2025         ADDW Y,XTEMP
      0089F9 90 FE            [ 2] 2026         LDW Y,(Y)
      0089FB FF               [ 2] 2027         LDW (X),Y
      0089FC 81               [ 4] 2028         RET
                                   2029 
                                   2030 ;; Memory access
                                   2031 
                                   2032 ;       +!      ( n a -- )
                                   2033 ;       Add n to  contents at address a.
      0089FD 89 E8                 2034         .word      LINK
                           00097F  2035 LINK = . 
      0089FF 02                    2036         .byte      2
      008A00 2B 21                 2037         .ascii     "+!"
      008A02                       2038 PSTOR:
                           000001  2039 .if CONVERT_TO_CODE
      008A02 90 93            [ 1] 2040         ldw y,x 
      008A04 90 FE            [ 2] 2041         ldw y,(y)
      008A06 90 BF 20         [ 2] 2042         ldw YTEMP,y  ; address
      008A09 90 FE            [ 2] 2043         ldw y,(y)  
      008A0B 90 89            [ 2] 2044         pushw y  ; value at address 
      008A0D 90 93            [ 1] 2045         ldw y,x 
      008A0F 90 EE 02         [ 2] 2046         ldw y,(2,y) ; n 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



      008A12 72 F9 01         [ 2] 2047         addw y,(1,sp) ; n+value
      008A15 91 CF 20         [ 5] 2048         ldw [YTEMP],y ;  a!
      008A18 90 85            [ 2] 2049         popw y    ;drop local var
      008A1A 1C 00 04         [ 2] 2050         addw x,#4 ; DDROP 
      008A1D 81               [ 4] 2051         ret 
                           000000  2052 .else
                                   2053         CALL	SWAPP
                                   2054         CALL	OVER
                                   2055         CALL	AT
                                   2056         CALL	PLUS
                                   2057         CALL	SWAPP
                                   2058         JP	STORE
                                   2059 .endif 
                                   2060 
                                   2061 ;       2!      ( d a -- )
                                   2062 ;       Store  double integer to address a.
      008A1E 89 FF                 2063         .word      LINK
                           0009A0  2064 LINK = . 
      008A20 02                    2065         .byte      2
      008A21 32 21                 2066         .ascii     "2!"
      008A23                       2067 DSTOR:
                           000001  2068 .if CONVERT_TO_CODE
      008A23 90 93            [ 1] 2069         ldw y,x 
      008A25 90 FE            [ 2] 2070         ldw y,(y)
      008A27 90 BF 20         [ 2] 2071         ldw YTEMP,y ; address 
      008A2A 1C 00 02         [ 2] 2072         addw x,#CELLL ; drop a 
      008A2D 90 93            [ 1] 2073         ldw y,x 
      008A2F 90 FE            [ 2] 2074         ldw y,(y) ; hi word 
      008A31 89               [ 2] 2075         pushw x 
      008A32 EE 02            [ 2] 2076         ldw x,(2,x) ; lo word 
      008A34 91 CF 20         [ 5] 2077         ldw [YTEMP],y
      008A37 90 93            [ 1] 2078         ldw y,x 
      008A39 AE 00 02         [ 2] 2079         ldw x,#2 
      008A3C 92 DF 20         [ 5] 2080         ldw ([YTEMP],x),y 
      008A3F 85               [ 2] 2081         popw x 
      008A40 1C 00 04         [ 2] 2082         addw x,#4 ; DDROP 
      008A43 81               [ 4] 2083         ret 
                           000000  2084 .else
                                   2085         CALL	SWAPP
                                   2086         CALL	OVER
                                   2087         CALL	STORE
                                   2088         CALL	CELLP
                                   2089         JP	STORE
                                   2090 .endif 
                                   2091 ;       2@      ( a -- d )
                                   2092 ;       Fetch double integer from address a.
      008A44 8A 20                 2093         .word      LINK
                           0009C6  2094 LINK = . 
      008A46 02                    2095         .byte      2
      008A47 32 40                 2096         .ascii     "2@"
      008A49                       2097 DAT:
                           000001  2098 .if CONVERT_TO_CODE
      008A49 90 93            [ 1] 2099         ldw y,x 
      008A4B 90 FE            [ 2] 2100         ldw y,(y) ;address 
      008A4D 90 BF 20         [ 2] 2101         ldw YTEMP,y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



      008A50 1D 00 02         [ 2] 2102         subw x,#CELLL ; space for udh 
      008A53 91 CE 20         [ 5] 2103         ldw y,[YTEMP] ; udh 
      008A56 FF               [ 2] 2104         ldw (x),y 
      008A57 90 AE 00 02      [ 2] 2105         ldw y,#2
      008A5B 91 DE 20         [ 5] 2106         ldw y,([YTEMP],y) ; udl 
      008A5E EF 02            [ 2] 2107         ldw (2,x),y
      008A60 81               [ 4] 2108         ret 
                           000000  2109 .else 
                                   2110         CALL	DUPP
                                   2111         CALL	CELLP
                                   2112         CALL	AT
                                   2113         CALL	SWAPP
                                   2114         JP	AT
                                   2115 .endif 
                                   2116 
                                   2117 ;       COUNT   ( b -- b +n )
                                   2118 ;       Return count byte of a string
                                   2119 ;       and add 1 to byte address.
      008A61 8A 46                 2120         .word      LINK
                           0009E3  2121 LINK = . 
      008A63 05                    2122         .byte      5
      008A64 43 4F 55 4E 54        2123         .ascii     "COUNT"
      008A69                       2124 COUNT:
                           000001  2125 .if CONVERT_TO_CODE
      008A69 90 93            [ 1] 2126         ldw y,x 
      008A6B 90 FE            [ 2] 2127         ldw y,(y) ; address 
      008A6D 90 F6            [ 1] 2128         ld a,(y)  ; count 
      008A6F 90 5C            [ 2] 2129         incw y 
      008A71 FF               [ 2] 2130         ldw (x),y 
      008A72 1D 00 02         [ 2] 2131         subw x,#CELLL 
      008A75 E7 01            [ 1] 2132         ld (1,x),a 
      008A77 7F               [ 1] 2133         clr (x)
      008A78 81               [ 4] 2134         ret 
                           000000  2135 .else 
                                   2136         CALL     DUPP
                                   2137         CALL     ONEP
                                   2138         CALL     SWAPP
                                   2139         JP     CAT
                                   2140 .endif 
                                   2141 
                                   2142 ;       HERE    ( -- a )
                                   2143 ;       Return  top of  variables
      008A79 8A 63                 2144         .word      LINK
                           0009FB  2145 LINK = . 
      008A7B 04                    2146         .byte      4
      008A7C 48 45 52 45           2147         .ascii     "HERE"
      008A80                       2148 HERE:
                           000001  2149 .if CONVERT_TO_CODE
      008A80 90 AE 00 16      [ 2] 2150       	ldw y,#UVP 
      008A84 90 FE            [ 2] 2151         ldw y,(y)
      008A86 1D 00 02         [ 2] 2152         subw x,#CELLL 
      008A89 FF               [ 2] 2153         ldw (x),y 
      008A8A 81               [ 4] 2154         ret 
                           000000  2155 .else
                                   2156         CALL     VPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



                                   2157         JP     AT
                                   2158 .endif 
                                   2159 
                                   2160 ;       PAD     ( -- a )
                                   2161 ;       Return address of text buffer
                                   2162 ;       above  code dictionary.
      008A8B 8A 7B                 2163         .word      LINK
                           000A0D  2164 LINK = . 
      008A8D 03                    2165         .byte      3
      008A8E 50 41 44              2166         .ascii     "PAD"
      008A91                       2167 PAD:
      008A91 CD 8A 80         [ 4] 2168         CALL     HERE
      008A94 CD 83 43         [ 4] 2169         CALL     DOLIT
      008A97 00 50                 2170         .word      80
      008A99 CC 86 48         [ 2] 2171         JP     PLUS
                                   2172 
                                   2173 ;       TIB     ( -- a )
                                   2174 ;       Return address of terminal input buffer.
      008A9C 8A 8D                 2175         .word      LINK
                           000A1E  2176 LINK = . 
      008A9E 03                    2177         .byte      3
      008A9F 54 49 42              2178         .ascii     "TIB"
      008AA2                       2179 TIB:
      008AA2 CD 85 5D         [ 4] 2180         CALL     NTIB
      008AA5 CD 88 FC         [ 4] 2181         CALL     CELLP
      008AA8 CC 83 CB         [ 2] 2182         JP     AT
                                   2183 
                                   2184 ;       @EXECUTE        ( a -- )
                                   2185 ;       Execute vector stored in address a.
      008AAB 8A 9E                 2186         .word      LINK
                           000A2D  2187 LINK = . 
      008AAD 08                    2188         .byte      8
      008AAE 40 45 58 45 43 55 54  2189         .ascii     "@EXECUTE"
             45
      008AB6                       2190 ATEXE:
      008AB6 CD 83 CB         [ 4] 2191         CALL     AT
      008AB9 CD 85 F7         [ 4] 2192         CALL     QDUP    ;?address or zero
      008ABC CD 83 76         [ 4] 2193         CALL     QBRAN
      008ABF 8A C4                 2194         .word      EXE1
      008AC1 CD 83 9D         [ 4] 2195         CALL     EXECU   ;execute if non-zero
      008AC4 81               [ 4] 2196 EXE1:   RET     ;do nothing if zero
                                   2197 
                                   2198 ;       CMOVE   ( b1 b2 u -- )
                                   2199 ;       Copy u bytes from b1 to b2.
      008AC5 8A AD                 2200         .word      LINK
                           000A47  2201 LINK = . 
      008AC7 05                    2202         .byte      5
      008AC8 43 4D 4F 56 45        2203         .ascii     "CMOVE"
      008ACD                       2204 CMOVE:
      008ACD CD 84 3B         [ 4] 2205         CALL	TOR
      008AD0 CD 83 8D         [ 4] 2206         CALL	BRAN
      008AD3 8A ED                 2207         .word	CMOV2
      008AD5 CD 84 3B         [ 4] 2208 CMOV1:	CALL	TOR
      008AD8 CD 84 72         [ 4] 2209         CALL	DUPP
      008ADB CD 83 E9         [ 4] 2210         CALL	CAT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



      008ADE CD 84 2F         [ 4] 2211         CALL	RAT
      008AE1 CD 83 D8         [ 4] 2212         CALL	CSTOR
      008AE4 CD 89 27         [ 4] 2213         CALL	ONEP
      008AE7 CD 84 1C         [ 4] 2214         CALL	RFROM
      008AEA CD 89 27         [ 4] 2215         CALL	ONEP
      008AED CD 83 57         [ 4] 2216 CMOV2:	CALL	DONXT
      008AF0 8A D5                 2217         .word	CMOV1
      008AF2 CC 86 28         [ 2] 2218         JP	DDROP
                                   2219 
                                   2220 ;       FILL    ( b u c -- )
                                   2221 ;       Fill u bytes of character c
                                   2222 ;       to area beginning at b.
      008AF5 8A C7                 2223         .word       LINK
                           000A77  2224 LINK = . 
      008AF7 04                    2225         .byte       4
      008AF8 46 49 4C 4C           2226         .ascii     "FILL"
      008AFC                       2227 FILL:
                           000001  2228 .if CONVERT_TO_CODE
      008AFC 90 93            [ 1] 2229         ldw y,x 
      008AFE 90 E6 01         [ 1] 2230         ld a,(1,y) ; c 
      008B01 1C 00 02         [ 2] 2231         addw x,#CELLL ; drop c 
      008B04 90 93            [ 1] 2232         ldw y,x 
      008B06 90 FE            [ 2] 2233         ldw y,(y) ; count
      008B08 90 89            [ 2] 2234         pushw y 
      008B0A 1C 00 02         [ 2] 2235         addw x,#CELLL ; drop u 
      008B0D 90 93            [ 1] 2236         ldw y,x 
      008B0F 1C 00 02         [ 2] 2237         addw x,#CELLL ; drop b 
      008B12 90 FE            [ 2] 2238         ldw y,(y) ; address
      008B14 90 BF 20         [ 2] 2239         ldw YTEMP,y
      008B17 90 85            [ 2] 2240         popw y ; count 
      008B19                       2241 FILL1:  
      008B19 92 C7 20         [ 4] 2242         ld [YTEMP],a 
      008B1C 3C 21            [ 1] 2243         inc YTEMP+1
      008B1E 24 02            [ 1] 2244         jrnc FILL2 
      008B20 3C 20            [ 1] 2245         inc YTEMP
      008B22                       2246 FILL2: 
      008B22 90 5A            [ 2] 2247         decw y ; count 
      008B24 26 F3            [ 1] 2248         jrne FILL1  
      008B26 81               [ 4] 2249         ret 
                           000000  2250 .else 
                                   2251         CALL	SWAPP
                                   2252         CALL	TOR
                                   2253         CALL	SWAPP
                                   2254         CALL	BRAN
                                   2255         .word	FILL2
                                   2256 FILL1:	CALL	DDUP
                                   2257         CALL	CSTOR
                                   2258         CALL	ONEP
                                   2259 FILL2:	CALL	DONXT
                                   2260         .word	FILL1
                                   2261         JP	DDROP
                                   2262 .endif
                                   2263 
                                   2264 ;       ERASE   ( b u -- )
                                   2265 ;       Erase u bytes beginning at b.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



      008B27 8A F7                 2266         .word      LINK
                           000AA9  2267 LINK = . 
      008B29 05                    2268         .byte      5
      008B2A 45 52 41 53 45        2269         .ascii     "ERASE"
      008B2F                       2270 ERASE:
                           000001  2271 .if CONVERT_TO_CODE
      008B2F 90 5F            [ 1] 2272         clrw y 
      008B31 1D 00 02         [ 2] 2273         subw x,#CELLL 
      008B34 FF               [ 2] 2274         ldw (x),y 
      008B35 CC 8A FC         [ 2] 2275         jp FILL 
                           000000  2276 .else 
                                   2277         CALL     ZERO
                                   2278         JP     FILL
                                   2279 .endif 
                                   2280 ;       PACK0x   ( b u a -- a )
                                   2281 ;       Build a counted string with
                                   2282 ;       u characters from b. Null fill.
      008B38 8B 29                 2283         .word      LINK
                           000ABA  2284 LINK = . 
      008B3A 05                    2285         .byte      5
      008B3B 50 41 43 4B 30 58     2286         .ascii     "PACK0X"
      008B41                       2287 PACKS:
      008B41 CD 84 72         [ 4] 2288         CALL     DUPP
      008B44 CD 84 3B         [ 4] 2289         CALL     TOR     ;strings only on cell boundary
      008B47 CD 86 33         [ 4] 2290         CALL     DDUP
      008B4A CD 83 D8         [ 4] 2291         CALL     CSTOR
      008B4D CD 89 27         [ 4] 2292         CALL     ONEP ;save count
      008B50 CD 84 82         [ 4] 2293         CALL     SWAPP
      008B53 CD 8A CD         [ 4] 2294         CALL     CMOVE
      008B56 CD 84 1C         [ 4] 2295         CALL     RFROM
      008B59 81               [ 4] 2296         RET
                                   2297 
                                   2298 ;; Numeric output, single precision
                                   2299 
                                   2300 ;       DIGIT   ( u -- c )
                                   2301 ;       Convert digit u to a character.
      008B5A 8B 3A                 2302         .word      LINK
                           000ADC  2303 LINK = . 
      008B5C 05                    2304         .byte      5
      008B5D 44 49 47 49 54        2305         .ascii     "DIGIT"
      008B62                       2306 DIGIT:
      008B62 CD 83 43         [ 4] 2307         CALL	DOLIT
      008B65 00 09                 2308         .word	9
      008B67 CD 84 9C         [ 4] 2309         CALL	OVER
      008B6A CD 87 0B         [ 4] 2310         CALL	LESS
      008B6D CD 83 43         [ 4] 2311         CALL	DOLIT
      008B70 00 07                 2312         .word	7
      008B72 CD 84 BE         [ 4] 2313         CALL	ANDD
      008B75 CD 86 48         [ 4] 2314         CALL	PLUS
      008B78 CD 83 43         [ 4] 2315         CALL	DOLIT
      008B7B 00 30                 2316         .word	48	;'0'
      008B7D CC 86 48         [ 2] 2317         JP	PLUS
                                   2318 
                                   2319 ;       EXTRACT ( n base -- n c )
                                   2320 ;       Extract least significant digit from n.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



      008B80 8B 5C                 2321         .word      LINK
                           000B02  2322 LINK = . 
      008B82 07                    2323         .byte      7
      008B83 45 58 54 52 41 43 54  2324         .ascii     "EXTRACT"
      008B8A                       2325 EXTRC:
      008B8A CD 89 93         [ 4] 2326         CALL     ZERO
      008B8D CD 84 82         [ 4] 2327         CALL     SWAPP
      008B90 CD 87 83         [ 4] 2328         CALL     UMMOD
      008B93 CD 84 82         [ 4] 2329         CALL     SWAPP
      008B96 CC 8B 62         [ 2] 2330         JP     DIGIT
                                   2331 
                                   2332 ;       <#      ( -- )
                                   2333 ;       Initiate  numeric output process.
      008B99 8B 82                 2334         .word      LINK
                           000B1B  2335 LINK = . 
      008B9B 02                    2336         .byte      2
      008B9C 3C 23                 2337         .ascii     "<#"
      008B9E                       2338 BDIGS:
      008B9E CD 8A 91         [ 4] 2339         CALL     PAD
      008BA1 CD 85 8D         [ 4] 2340         CALL     HLD
      008BA4 CC 83 B4         [ 2] 2341         JP     STORE
                                   2342 
                                   2343 ;       HOLD    ( c -- )
                                   2344 ;       Insert a character into output string.
      008BA7 8B 9B                 2345         .word      LINK
                           000B29  2346 LINK = . 
      008BA9 04                    2347         .byte      4
      008BAA 48 4F 4C 44           2348         .ascii     "HOLD"
      008BAE                       2349 HOLD:
      008BAE CD 85 8D         [ 4] 2350         CALL     HLD
      008BB1 CD 83 CB         [ 4] 2351         CALL     AT
      008BB4 CD 89 34         [ 4] 2352         CALL     ONEM
      008BB7 CD 84 72         [ 4] 2353         CALL     DUPP
      008BBA CD 85 8D         [ 4] 2354         CALL     HLD
      008BBD CD 83 B4         [ 4] 2355         CALL     STORE
      008BC0 CC 83 D8         [ 2] 2356         JP     CSTOR
                                   2357 
                                   2358 ;       #       ( u -- u )
                                   2359 ;       Extract one digit from u and
                                   2360 ;       append digit to output string.
      008BC3 8B A9                 2361         .word      LINK
                           000B45  2362 LINK = . 
      008BC5 01                    2363         .byte      1
      008BC6 23                    2364         .ascii     "#"
      008BC7                       2365 DIG:
      008BC7 CD 85 2F         [ 4] 2366         CALL     BASE
      008BCA CD 83 CB         [ 4] 2367         CALL     AT
      008BCD CD 8B 8A         [ 4] 2368         CALL     EXTRC
      008BD0 CC 8B AE         [ 2] 2369         JP     HOLD
                                   2370 
                                   2371 ;       #S      ( u -- 0 )
                                   2372 ;       Convert u until all digits
                                   2373 ;       are added to output string.
      008BD3 8B C5                 2374         .word      LINK
                           000B55  2375 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



      008BD5 02                    2376         .byte      2
      008BD6 23 53                 2377         .ascii     "#S"
      008BD8                       2378 DIGS:
      008BD8 CD 8B C7         [ 4] 2379 DIGS1:  CALL     DIG
      008BDB CD 84 72         [ 4] 2380         CALL     DUPP
      008BDE CD 83 76         [ 4] 2381         CALL     QBRAN
      008BE1 8B E5                 2382         .word      DIGS2
      008BE3 20 F3            [ 2] 2383         JRA     DIGS1
      008BE5 81               [ 4] 2384 DIGS2:  RET
                                   2385 
                                   2386 ;       SIGN    ( n -- )
                                   2387 ;       Add a minus sign to
                                   2388 ;       numeric output string.
      008BE6 8B D5                 2389         .word      LINK
                           000B68  2390 LINK = . 
      008BE8 04                    2391         .byte      4
      008BE9 53 49 47 4E           2392         .ascii     "SIGN"
      008BED                       2393 SIGN:
      008BED CD 84 AB         [ 4] 2394         CALL     ZLESS
      008BF0 CD 83 76         [ 4] 2395         CALL     QBRAN
      008BF3 8B FD                 2396         .word      SIGN1
      008BF5 CD 83 43         [ 4] 2397         CALL     DOLIT
      008BF8 00 2D                 2398         .word      45	;"-"
      008BFA CC 8B AE         [ 2] 2399         JP     HOLD
      008BFD 81               [ 4] 2400 SIGN1:  RET
                                   2401 
                                   2402 ;       #>      ( w -- b u )
                                   2403 ;       Prepare output string.
      008BFE 8B E8                 2404         .word      LINK
                           000B80  2405 LINK = . 
      008C00 02                    2406         .byte      2
      008C01 23 3E                 2407         .ascii     "#>"
      008C03                       2408 EDIGS:
      008C03 CD 84 68         [ 4] 2409         CALL     DROP
      008C06 CD 85 8D         [ 4] 2410         CALL     HLD
      008C09 CD 83 CB         [ 4] 2411         CALL     AT
      008C0C CD 8A 91         [ 4] 2412         CALL     PAD
      008C0F CD 84 9C         [ 4] 2413         CALL     OVER
      008C12 CC 86 A6         [ 2] 2414         JP     SUBB
                                   2415 
                                   2416 ;       str     ( w -- b u )
                                   2417 ;       Convert a signed integer
                                   2418 ;       to a numeric string.
      008C15 8C 00                 2419         .word      LINK
                           000B97  2420 LINK = . 
      008C17 03                    2421         .byte      3
      008C18 53 54 52              2422         .ascii     "STR"
      008C1B                       2423 STR:
      008C1B CD 84 72         [ 4] 2424         CALL     DUPP
      008C1E CD 84 3B         [ 4] 2425         CALL     TOR
      008C21 CD 86 C0         [ 4] 2426         CALL     ABSS
      008C24 CD 8B 9E         [ 4] 2427         CALL     BDIGS
      008C27 CD 8B D8         [ 4] 2428         CALL     DIGS
      008C2A CD 84 1C         [ 4] 2429         CALL     RFROM
      008C2D CD 8B ED         [ 4] 2430         CALL     SIGN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      008C30 CC 8C 03         [ 2] 2431         JP     EDIGS
                                   2432 
                                   2433 ;       HEX     ( -- )
                                   2434 ;       Use radix 16 as base for
                                   2435 ;       numeric conversions.
      008C33 8C 17                 2436         .word      LINK
                           000BB5  2437 LINK = . 
      008C35 03                    2438         .byte      3
      008C36 48 45 58              2439         .ascii     "HEX"
      008C39                       2440 HEX:
      008C39 CD 83 43         [ 4] 2441         CALL     DOLIT
      008C3C 00 10                 2442         .word      16
      008C3E CD 85 2F         [ 4] 2443         CALL     BASE
      008C41 CC 83 B4         [ 2] 2444         JP     STORE
                                   2445 
                                   2446 ;       DECIMAL ( -- )
                                   2447 ;       Use radix 10 as base
                                   2448 ;       for numeric conversions.
      008C44 8C 35                 2449         .word      LINK
                           000BC6  2450 LINK = . 
      008C46 07                    2451         .byte      7
      008C47 44 45 43 49 4D 41 4C  2452         .ascii     "DECIMAL"
      008C4E                       2453 DECIM:
      008C4E CD 83 43         [ 4] 2454         CALL     DOLIT
      008C51 00 0A                 2455         .word      10
      008C53 CD 85 2F         [ 4] 2456         CALL     BASE
      008C56 CC 83 B4         [ 2] 2457         JP     STORE
                                   2458 
                                   2459 ;; Numeric input, single precision
                                   2460 
                                   2461 ;       DIGIT?  ( c base -- u t )
                                   2462 ;       Convert a character to its numeric
                                   2463 ;       value. A flag indicates success.
      008C59 8C 46                 2464         .word      LINK
                           000BDB  2465 LINK = . 
      008C5B 06                    2466         .byte       6
      008C5C 44 49 47 49 54 3F     2467         .ascii     "DIGIT?"
      008C62                       2468 DIGTQ:
      008C62 CD 84 3B         [ 4] 2469         CALL     TOR
      008C65 CD 83 43         [ 4] 2470         CALL     DOLIT
      008C68 00 30                 2471         .word     48	; "0"
      008C6A CD 86 A6         [ 4] 2472         CALL     SUBB
      008C6D CD 83 43         [ 4] 2473         CALL     DOLIT
      008C70 00 09                 2474         .word      9
      008C72 CD 84 9C         [ 4] 2475         CALL     OVER
      008C75 CD 87 0B         [ 4] 2476         CALL     LESS
      008C78 CD 83 76         [ 4] 2477         CALL     QBRAN
      008C7B 8C 93                 2478         .word      DGTQ1
      008C7D CD 83 43         [ 4] 2479         CALL     DOLIT
      008C80 00 07                 2480         .word      7
      008C82 CD 86 A6         [ 4] 2481         CALL     SUBB
      008C85 CD 84 72         [ 4] 2482         CALL     DUPP
      008C88 CD 83 43         [ 4] 2483         CALL     DOLIT
      008C8B 00 0A                 2484         .word      10
      008C8D CD 87 0B         [ 4] 2485         CALL     LESS
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      008C90 CD 84 D2         [ 4] 2486         CALL     ORR
      008C93 CD 84 72         [ 4] 2487 DGTQ1:  CALL     DUPP
      008C96 CD 84 1C         [ 4] 2488         CALL     RFROM
      008C99 CC 86 ED         [ 2] 2489         JP     ULESS
                                   2490 
                                   2491 ;       NUMBER? ( a -- n T | a F )
                                   2492 ;       Convert a number string to
                                   2493 ;       integer. Push a flag on tos.
      008C9C 8C 5B                 2494         .word      LINK
                           000C1E  2495 LINK = . 
      008C9E 07                    2496         .byte      7
      008C9F 4E 55 4D 42 45 52 3F  2497         .ascii     "NUMBER?"
      008CA6                       2498 NUMBQ:
      008CA6 CD 85 2F         [ 4] 2499         CALL     BASE
      008CA9 CD 83 CB         [ 4] 2500         CALL     AT
      008CAC CD 84 3B         [ 4] 2501         CALL     TOR
      008CAF CD 89 93         [ 4] 2502         CALL     ZERO
      008CB2 CD 84 9C         [ 4] 2503         CALL     OVER
      008CB5 CD 8A 69         [ 4] 2504         CALL     COUNT
      008CB8 CD 84 9C         [ 4] 2505         CALL     OVER
      008CBB CD 83 E9         [ 4] 2506         CALL     CAT
      008CBE CD 83 43         [ 4] 2507         CALL     DOLIT
      008CC1 00 24                 2508         .word     36	; "0x"
      008CC3 CD 86 CE         [ 4] 2509         CALL     EQUAL
      008CC6 CD 83 76         [ 4] 2510         CALL     QBRAN
      008CC9 8C DA                 2511         .word      NUMQ1
      008CCB CD 8C 39         [ 4] 2512         CALL     HEX
      008CCE CD 84 82         [ 4] 2513         CALL     SWAPP
      008CD1 CD 89 27         [ 4] 2514         CALL     ONEP
      008CD4 CD 84 82         [ 4] 2515         CALL     SWAPP
      008CD7 CD 89 34         [ 4] 2516         CALL     ONEM
      008CDA CD 84 9C         [ 4] 2517 NUMQ1:  CALL     OVER
      008CDD CD 83 E9         [ 4] 2518         CALL     CAT
      008CE0 CD 83 43         [ 4] 2519         CALL     DOLIT
      008CE3 00 2D                 2520         .word     45	; "-"
      008CE5 CD 86 CE         [ 4] 2521         CALL     EQUAL
      008CE8 CD 84 3B         [ 4] 2522         CALL     TOR
      008CEB CD 84 82         [ 4] 2523         CALL     SWAPP
      008CEE CD 84 2F         [ 4] 2524         CALL     RAT
      008CF1 CD 86 A6         [ 4] 2525         CALL     SUBB
      008CF4 CD 84 82         [ 4] 2526         CALL     SWAPP
      008CF7 CD 84 2F         [ 4] 2527         CALL     RAT
      008CFA CD 86 48         [ 4] 2528         CALL     PLUS
      008CFD CD 85 F7         [ 4] 2529         CALL     QDUP
      008D00 CD 83 76         [ 4] 2530         CALL     QBRAN
      008D03 8D 64                 2531         .word      NUMQ6
      008D05 CD 89 34         [ 4] 2532         CALL     ONEM
      008D08 CD 84 3B         [ 4] 2533         CALL     TOR
      008D0B CD 84 72         [ 4] 2534 NUMQ2:  CALL     DUPP
      008D0E CD 84 3B         [ 4] 2535         CALL     TOR
      008D11 CD 83 E9         [ 4] 2536         CALL     CAT
      008D14 CD 85 2F         [ 4] 2537         CALL     BASE
      008D17 CD 83 CB         [ 4] 2538         CALL     AT
      008D1A CD 8C 62         [ 4] 2539         CALL     DIGTQ
      008D1D CD 83 76         [ 4] 2540         CALL     QBRAN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



      008D20 8D 52                 2541         .word      NUMQ4
      008D22 CD 84 82         [ 4] 2542         CALL     SWAPP
      008D25 CD 85 2F         [ 4] 2543         CALL     BASE
      008D28 CD 83 CB         [ 4] 2544         CALL     AT
      008D2B CD 88 A6         [ 4] 2545         CALL     STAR
      008D2E CD 86 48         [ 4] 2546         CALL     PLUS
      008D31 CD 84 1C         [ 4] 2547         CALL     RFROM
      008D34 CD 89 27         [ 4] 2548         CALL     ONEP
      008D37 CD 83 57         [ 4] 2549         CALL     DONXT
      008D3A 8D 0B                 2550         .word      NUMQ2
      008D3C CD 84 2F         [ 4] 2551         CALL     RAT
      008D3F CD 84 82         [ 4] 2552         CALL     SWAPP
      008D42 CD 84 68         [ 4] 2553         CALL     DROP
      008D45 CD 83 76         [ 4] 2554         CALL     QBRAN
      008D48 8D 4D                 2555         .word      NUMQ3
      008D4A CD 86 73         [ 4] 2556         CALL     NEGAT
      008D4D CD 84 82         [ 4] 2557 NUMQ3:  CALL     SWAPP
      008D50 20 0F            [ 2] 2558         JRA     NUMQ5
      008D52 CD 84 1C         [ 4] 2559 NUMQ4:  CALL     RFROM
      008D55 CD 84 1C         [ 4] 2560         CALL     RFROM
      008D58 CD 86 28         [ 4] 2561         CALL     DDROP
      008D5B CD 86 28         [ 4] 2562         CALL     DDROP
      008D5E CD 89 93         [ 4] 2563         CALL     ZERO
      008D61 CD 84 72         [ 4] 2564 NUMQ5:  CALL     DUPP
      008D64 CD 84 1C         [ 4] 2565 NUMQ6:  CALL     RFROM
      008D67 CD 86 28         [ 4] 2566         CALL     DDROP
      008D6A CD 84 1C         [ 4] 2567         CALL     RFROM
      008D6D CD 85 2F         [ 4] 2568         CALL     BASE
      008D70 CC 83 B4         [ 2] 2569         JP     STORE
                                   2570 
                                   2571 ;; Basic I/O
                                   2572 
                                   2573 ;       KEY     ( -- c )
                                   2574 ;       Wait for and return an
                                   2575 ;       input character.
      008D73 8C 9E                 2576         .word      LINK
                           000CF5  2577 LINK = . 
      008D75 03                    2578         .byte      3
      008D76 4B 45 59              2579         .ascii     "KEY"
      008D79                       2580 KEY:
                           000001  2581 .if CONVERT_TO_CODE
      008D79 72 0B 52 30 FB   [ 2] 2582         btjf UART1_SR,#UART_SR_RXNE,. 
      008D7E C6 52 31         [ 1] 2583         ld a,UART1_DR 
      008D81 1D 00 02         [ 2] 2584         subw x,#CELLL 
      008D84 E7 01            [ 1] 2585         ld (1,x),a 
      008D86 7F               [ 1] 2586         clr (x)
      008D87 81               [ 4] 2587         ret 
                           000000  2588 .else 
                                   2589 KEY1:   CALL     QKEY
                                   2590         CALL     QBRAN
                                   2591         .word      KEY1
                                   2592         RET
                                   2593 .endif 
                                   2594 
                                   2595 ;       NUF?    ( -- t )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



                                   2596 ;       Return false if no input,
                                   2597 ;       else pause and if CR return true.
      008D88 8D 75                 2598         .word      LINK
                           000D0A  2599 LINK = . 
      008D8A 04                    2600         .byte      4
      008D8B 4E 55 46 3F           2601         .ascii     "NUF?"
      008D8F                       2602 NUFQ:
      008D8F CD 83 0F         [ 4] 2603         CALL     QKEY
      008D92 CD 84 72         [ 4] 2604         CALL     DUPP
      008D95 CD 83 76         [ 4] 2605         CALL     QBRAN
      008D98 8D A8                 2606         .word    NUFQ1
      008D9A CD 86 28         [ 4] 2607         CALL     DDROP
      008D9D CD 8D 79         [ 4] 2608         CALL     KEY
      008DA0 CD 83 43         [ 4] 2609         CALL     DOLIT
      008DA3 00 0D                 2610         .word      CRR
      008DA5 CC 86 CE         [ 2] 2611         JP     EQUAL
      008DA8 81               [ 4] 2612 NUFQ1:  RET
                                   2613 
                                   2614 ;       SPACE   ( -- )
                                   2615 ;       Send  blank character to
                                   2616 ;       output device.
      008DA9 8D 8A                 2617         .word      LINK
                           000D2B  2618 LINK = . 
      008DAB 05                    2619         .byte      5
      008DAC 53 50 41 43 45        2620         .ascii     "SPACE"
      008DB1                       2621 SPACE:
      008DB1 CD 89 86         [ 4] 2622         CALL     BLANK
      008DB4 CC 83 2D         [ 2] 2623         JP     EMIT
                                   2624 
                                   2625 ;       SPACES  ( +n -- )
                                   2626 ;       Send n spaces to output device.
      008DB7 8D AB                 2627         .word      LINK
                           000D39  2628 LINK = . 
      008DB9 06                    2629         .byte      6
      008DBA 53 50 41 43 45 53     2630         .ascii     "SPACES"
      008DC0                       2631 SPACS:
      008DC0 CD 89 93         [ 4] 2632         CALL     ZERO
      008DC3 CD 87 2B         [ 4] 2633         CALL     MAX
      008DC6 CD 84 3B         [ 4] 2634         CALL     TOR
      008DC9 20 03            [ 2] 2635         JRA      CHAR2
      008DCB CD 8D B1         [ 4] 2636 CHAR1:  CALL     SPACE
      008DCE CD 83 57         [ 4] 2637 CHAR2:  CALL     DONXT
      008DD1 8D CB                 2638         .word    CHAR1
      008DD3 81               [ 4] 2639         RET
                                   2640 
                                   2641 ;       TYPE    ( b u -- )
                                   2642 ;       Output u characters from b.
      008DD4 8D B9                 2643         .word      LINK
                           000D56  2644 LINK = . 
      008DD6 04                    2645         .byte      4
      008DD7 54 59 50 45           2646         .ascii     "TYPE"
      008DDB                       2647 TYPES:
      008DDB CD 84 3B         [ 4] 2648         CALL     TOR
      008DDE 20 0C            [ 2] 2649         JRA     TYPE2
      008DE0 CD 84 72         [ 4] 2650 TYPE1:  CALL     DUPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



      008DE3 CD 83 E9         [ 4] 2651         CALL     CAT
      008DE6 CD 83 2D         [ 4] 2652         CALL     EMIT
      008DE9 CD 89 27         [ 4] 2653         CALL     ONEP
      008DEC CD 83 57         [ 4] 2654 TYPE2:  CALL     DONXT
      008DEF 8D E0                 2655         .word      TYPE1
      008DF1 CC 84 68         [ 2] 2656         JP     DROP
                                   2657 
                                   2658 ;       CR      ( -- )
                                   2659 ;       Output a carriage return
                                   2660 ;       and a line feed.
      008DF4 8D D6                 2661         .word      LINK
                           000D76  2662 LINK = . 
      008DF6 02                    2663         .byte      2
      008DF7 43 52                 2664         .ascii     "CR"
      008DF9                       2665 CR:
      008DF9 CD 83 43         [ 4] 2666         CALL     DOLIT
      008DFC 00 0D                 2667         .word      CRR
      008DFE CD 83 2D         [ 4] 2668         CALL     EMIT
      008E01 CD 83 43         [ 4] 2669         CALL     DOLIT
      008E04 00 0A                 2670         .word      LF
      008E06 CC 83 2D         [ 2] 2671         JP     EMIT
                                   2672 
                                   2673 ;       do$     ( -- a )
                                   2674 ;       Return  address of a compiled
                                   2675 ;       string.
      008E09 8D F6                 2676         .word      LINK
                           000D8B  2677 LINK = . 
      008E0B 43                    2678 	.byte      COMPO+3
      008E0C 44 4F 24              2679         .ascii     "DO$"
      008E0F                       2680 DOSTR:
      008E0F CD 84 1C         [ 4] 2681         CALL     RFROM
      008E12 CD 84 2F         [ 4] 2682         CALL     RAT
      008E15 CD 84 1C         [ 4] 2683         CALL     RFROM
      008E18 CD 8A 69         [ 4] 2684         CALL     COUNT
      008E1B CD 86 48         [ 4] 2685         CALL     PLUS
      008E1E CD 84 3B         [ 4] 2686         CALL     TOR
      008E21 CD 84 82         [ 4] 2687         CALL     SWAPP
      008E24 CD 84 3B         [ 4] 2688         CALL     TOR
      008E27 81               [ 4] 2689         RET
                                   2690 
                                   2691 ;       $"|     ( -- a )
                                   2692 ;       Run time routine compiled by $".
                                   2693 ;       Return address of a compiled string.
      008E28 8E 0B                 2694         .word      LINK
                           000DAA  2695 LINK = . 
      008E2A 43                    2696 	.byte      COMPO+3
      008E2B 24 22 7C              2697         .byte     '$','"','|'
      008E2E                       2698 STRQP:
      008E2E CD 8E 0F         [ 4] 2699         CALL     DOSTR
      008E31 81               [ 4] 2700         RET
                                   2701 
                                   2702 ;       ."|     ( -- )
                                   2703 ;       Run time routine of ." .
                                   2704 ;       Output a compiled string.
      008E32 8E 2A                 2705         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



                           000DB4  2706 LINK = . 
      008E34 43                    2707 	.byte      COMPO+3
      008E35 2E 22 7C              2708         .byte     '.','"','|'
      008E38                       2709 DOTQP:
      008E38 CD 8E 0F         [ 4] 2710         CALL     DOSTR
      008E3B CD 8A 69         [ 4] 2711         CALL     COUNT
      008E3E CC 8D DB         [ 2] 2712         JP     TYPES
                                   2713 
                                   2714 ;       .R      ( n +n -- )
                                   2715 ;       Display an integer in a field
                                   2716 ;       of n columns, right justified.
      008E41 8E 34                 2717         .word      LINK
                           000DC3  2718 LINK = . 
      008E43 02                    2719         .byte      2
      008E44 2E 52                 2720         .ascii     ".R"
      008E46                       2721 DOTR:
      008E46 CD 84 3B         [ 4] 2722         CALL     TOR
      008E49 CD 8C 1B         [ 4] 2723         CALL     STR
      008E4C CD 84 1C         [ 4] 2724         CALL     RFROM
      008E4F CD 84 9C         [ 4] 2725         CALL     OVER
      008E52 CD 86 A6         [ 4] 2726         CALL     SUBB
      008E55 CD 8D C0         [ 4] 2727         CALL     SPACS
      008E58 CC 8D DB         [ 2] 2728         JP     TYPES
                                   2729 
                                   2730 ;       U.R     ( u +n -- )
                                   2731 ;       Display an unsigned integer
                                   2732 ;       in n column, right justified.
      008E5B 8E 43                 2733         .word      LINK
                           000DDD  2734 LINK = . 
      008E5D 03                    2735         .byte      3
      008E5E 55 2E 52              2736         .ascii     "U.R"
      008E61                       2737 UDOTR:
      008E61 CD 84 3B         [ 4] 2738         CALL     TOR
      008E64 CD 8B 9E         [ 4] 2739         CALL     BDIGS
      008E67 CD 8B D8         [ 4] 2740         CALL     DIGS
      008E6A CD 8C 03         [ 4] 2741         CALL     EDIGS
      008E6D CD 84 1C         [ 4] 2742         CALL     RFROM
      008E70 CD 84 9C         [ 4] 2743         CALL     OVER
      008E73 CD 86 A6         [ 4] 2744         CALL     SUBB
      008E76 CD 8D C0         [ 4] 2745         CALL     SPACS
      008E79 CC 8D DB         [ 2] 2746         JP     TYPES
                                   2747 
                                   2748 ;       U.      ( u -- )
                                   2749 ;       Display an unsigned integer
                                   2750 ;       in free format.
      008E7C 8E 5D                 2751         .word      LINK
                           000DFE  2752 LINK = . 
      008E7E 02                    2753         .byte      2
      008E7F 55 2E                 2754         .ascii     "U."
      008E81                       2755 UDOT:
      008E81 CD 8B 9E         [ 4] 2756         CALL     BDIGS
      008E84 CD 8B D8         [ 4] 2757         CALL     DIGS
      008E87 CD 8C 03         [ 4] 2758         CALL     EDIGS
      008E8A CD 8D B1         [ 4] 2759         CALL     SPACE
      008E8D CC 8D DB         [ 2] 2760         JP     TYPES
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



                                   2761 
                                   2762 ;       .       ( w -- )
                                   2763 ;       Display an integer in free
                                   2764 ;       format, preceeded by a space.
      008E90 8E 7E                 2765         .word      LINK
                           000E12  2766 LINK = . 
      008E92 01                    2767         .byte      1
      008E93 2E                    2768         .ascii     "."
      008E94                       2769 DOT:
      008E94 CD 85 2F         [ 4] 2770         CALL     BASE
      008E97 CD 83 CB         [ 4] 2771         CALL     AT
      008E9A CD 83 43         [ 4] 2772         CALL     DOLIT
      008E9D 00 0A                 2773         .word      10
      008E9F CD 84 E7         [ 4] 2774         CALL     XORR    ;?decimal
      008EA2 CD 83 76         [ 4] 2775         CALL     QBRAN
      008EA5 8E AA                 2776         .word      DOT1
      008EA7 CC 8E 81         [ 2] 2777         JP     UDOT
      008EAA CD 8C 1B         [ 4] 2778 DOT1:   CALL     STR
      008EAD CD 8D B1         [ 4] 2779         CALL     SPACE
      008EB0 CC 8D DB         [ 2] 2780         JP     TYPES
                                   2781 
                                   2782 ;       ?       ( a -- )
                                   2783 ;       Display contents in memory cell.
      008EB3 8E 92                 2784         .word      LINK
                                   2785         
                           000E35  2786 LINK = . 
      008EB5 01                    2787         .byte      1
      008EB6 3F                    2788         .ascii     "?"
      008EB7                       2789 QUEST:
      008EB7 CD 83 CB         [ 4] 2790         CALL     AT
      008EBA CC 8E 94         [ 2] 2791         JP     DOT
                                   2792 
                                   2793 ;; Parsing
                                   2794 
                                   2795 ;       parse   ( b u c -- b u delta ; <string> )
                                   2796 ;       Scan string delimited by c.
                                   2797 ;       Return found string and its offset.
      008EBD 8E B5                 2798         .word      LINK
                           000E3F  2799 LINK = . 
      008EBF 05                    2800         .byte      5
      008EC0 70 61 72 73 65        2801         .ascii     "parse"
      008EC5                       2802 PARS:
      008EC5 CD 85 3E         [ 4] 2803         CALL     TEMP
      008EC8 CD 83 B4         [ 4] 2804         CALL     STORE
      008ECB CD 84 9C         [ 4] 2805         CALL     OVER
      008ECE CD 84 3B         [ 4] 2806         CALL     TOR
      008ED1 CD 84 72         [ 4] 2807         CALL     DUPP
      008ED4 CD 83 76         [ 4] 2808         CALL     QBRAN
      008ED7 8F 7D                 2809         .word    PARS8
      008ED9 CD 89 34         [ 4] 2810         CALL     ONEM
      008EDC CD 85 3E         [ 4] 2811         CALL     TEMP
      008EDF CD 83 CB         [ 4] 2812         CALL     AT
      008EE2 CD 89 86         [ 4] 2813         CALL     BLANK
      008EE5 CD 86 CE         [ 4] 2814         CALL     EQUAL
      008EE8 CD 83 76         [ 4] 2815         CALL     QBRAN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



      008EEB 8F 1E                 2816         .word      PARS3
      008EED CD 84 3B         [ 4] 2817         CALL     TOR
      008EF0 CD 89 86         [ 4] 2818 PARS1:  CALL     BLANK
      008EF3 CD 84 9C         [ 4] 2819         CALL     OVER
      008EF6 CD 83 E9         [ 4] 2820         CALL     CAT     ;skip leading blanks ONLY
      008EF9 CD 86 A6         [ 4] 2821         CALL     SUBB
      008EFC CD 84 AB         [ 4] 2822         CALL     ZLESS
      008EFF CD 86 62         [ 4] 2823         CALL     INVER
      008F02 CD 83 76         [ 4] 2824         CALL     QBRAN
      008F05 8F 1B                 2825         .word      PARS2
      008F07 CD 89 27         [ 4] 2826         CALL     ONEP
      008F0A CD 83 57         [ 4] 2827         CALL     DONXT
      008F0D 8E F0                 2828         .word      PARS1
      008F0F CD 84 1C         [ 4] 2829         CALL     RFROM
      008F12 CD 84 68         [ 4] 2830         CALL     DROP
      008F15 CD 89 93         [ 4] 2831         CALL     ZERO
      008F18 CC 84 72         [ 2] 2832         JP     DUPP
      008F1B CD 84 1C         [ 4] 2833 PARS2:  CALL     RFROM
      008F1E CD 84 9C         [ 4] 2834 PARS3:  CALL     OVER
      008F21 CD 84 82         [ 4] 2835         CALL     SWAPP
      008F24 CD 84 3B         [ 4] 2836         CALL     TOR
      008F27 CD 85 3E         [ 4] 2837 PARS4:  CALL     TEMP
      008F2A CD 83 CB         [ 4] 2838         CALL     AT
      008F2D CD 84 9C         [ 4] 2839         CALL     OVER
      008F30 CD 83 E9         [ 4] 2840         CALL     CAT
      008F33 CD 86 A6         [ 4] 2841         CALL     SUBB    ;scan for delimiter
      008F36 CD 85 3E         [ 4] 2842         CALL     TEMP
      008F39 CD 83 CB         [ 4] 2843         CALL     AT
      008F3C CD 89 86         [ 4] 2844         CALL     BLANK
      008F3F CD 86 CE         [ 4] 2845         CALL     EQUAL
      008F42 CD 83 76         [ 4] 2846         CALL     QBRAN
      008F45 8F 4A                 2847         .word      PARS5
      008F47 CD 84 AB         [ 4] 2848         CALL     ZLESS
      008F4A CD 83 76         [ 4] 2849 PARS5:  CALL     QBRAN
      008F4D 8F 5F                 2850         .word      PARS6
      008F4F CD 89 27         [ 4] 2851         CALL     ONEP
      008F52 CD 83 57         [ 4] 2852         CALL     DONXT
      008F55 8F 27                 2853         .word      PARS4
      008F57 CD 84 72         [ 4] 2854         CALL     DUPP
      008F5A CD 84 3B         [ 4] 2855         CALL     TOR
      008F5D 20 0F            [ 2] 2856         JRA     PARS7
      008F5F CD 84 1C         [ 4] 2857 PARS6:  CALL     RFROM
      008F62 CD 84 68         [ 4] 2858         CALL     DROP
      008F65 CD 84 72         [ 4] 2859         CALL     DUPP
      008F68 CD 89 27         [ 4] 2860         CALL     ONEP
      008F6B CD 84 3B         [ 4] 2861         CALL     TOR
      008F6E CD 84 9C         [ 4] 2862 PARS7:  CALL     OVER
      008F71 CD 86 A6         [ 4] 2863         CALL     SUBB
      008F74 CD 84 1C         [ 4] 2864         CALL     RFROM
      008F77 CD 84 1C         [ 4] 2865         CALL     RFROM
      008F7A CC 86 A6         [ 2] 2866         JP     SUBB
      008F7D CD 84 9C         [ 4] 2867 PARS8:  CALL     OVER
      008F80 CD 84 1C         [ 4] 2868         CALL     RFROM
      008F83 CC 86 A6         [ 2] 2869         JP     SUBB
                                   2870 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



                                   2871 ;       PARSE   ( c -- b u ; <string> )
                                   2872 ;       Scan input stream and return
                                   2873 ;       counted string delimited by c.
      008F86 8E BF                 2874         .word      LINK
                           000F08  2875 LINK = . 
      008F88 05                    2876         .byte      5
      008F89 50 41 52 53 45        2877         .ascii     "PARSE"
      008F8E                       2878 PARSE:
      008F8E CD 84 3B         [ 4] 2879         CALL     TOR
      008F91 CD 8A A2         [ 4] 2880         CALL     TIB
      008F94 CD 85 4D         [ 4] 2881         CALL     INN
      008F97 CD 83 CB         [ 4] 2882         CALL     AT
      008F9A CD 86 48         [ 4] 2883         CALL     PLUS    ;current input buffer pointer
      008F9D CD 85 5D         [ 4] 2884         CALL     NTIB
      008FA0 CD 83 CB         [ 4] 2885         CALL     AT
      008FA3 CD 85 4D         [ 4] 2886         CALL     INN
      008FA6 CD 83 CB         [ 4] 2887         CALL     AT
      008FA9 CD 86 A6         [ 4] 2888         CALL     SUBB    ;remaining count
      008FAC CD 84 1C         [ 4] 2889         CALL     RFROM
      008FAF CD 8E C5         [ 4] 2890         CALL     PARS
      008FB2 CD 85 4D         [ 4] 2891         CALL     INN
      008FB5 CC 8A 02         [ 2] 2892         JP     PSTOR
                                   2893 
                                   2894 ;       .(      ( -- )
                                   2895 ;       Output following string up to next ) .
      008FB8 8F 88                 2896         .word      LINK
                           000F3A  2897 LINK = . 
      008FBA 82                    2898 	.byte      IMEDD+2
      008FBB 2E 28                 2899         .ascii     ".("
      008FBD                       2900 DOTPR:
      008FBD CD 83 43         [ 4] 2901         CALL     DOLIT
      008FC0 00 29                 2902         .word     41	; ")"
      008FC2 CD 8F 8E         [ 4] 2903         CALL     PARSE
      008FC5 CC 8D DB         [ 2] 2904         JP     TYPES
                                   2905 
                                   2906 ;       (       ( -- )
                                   2907 ;       Ignore following string up to next ).
                                   2908 ;       A comment.
      008FC8 8F BA                 2909         .word      LINK
                           000F4A  2910 LINK = . 
      008FCA 81                    2911 	.byte      IMEDD+1
      008FCB 28                    2912         .ascii     "("
      008FCC                       2913 PAREN:
      008FCC CD 83 43         [ 4] 2914         CALL     DOLIT
      008FCF 00 29                 2915         .word     41	; ")"
      008FD1 CD 8F 8E         [ 4] 2916         CALL     PARSE
      008FD4 CC 86 28         [ 2] 2917         JP     DDROP
                                   2918 
                                   2919 ;       \       ( -- )
                                   2920 ;       Ignore following text till
                                   2921 ;       end of line.
      008FD7 8F CA                 2922         .word      LINK
                           000F59  2923 LINK = . 
      008FD9 81                    2924 	.byte      IMEDD+1
      008FDA 5C                    2925         .ascii     "\"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      008FDB                       2926 BKSLA:
                           000001  2927 .if CONVERT_TO_CODE
      008FDB 90 AE 00 0C      [ 2] 2928         ldw y,#UCTIB ; #TIB  
      008FDF 90 FE            [ 2] 2929         ldw y,(y)
      008FE1 90 89            [ 2] 2930         pushw y ; count in TIB 
      008FE3 90 AE 00 0A      [ 2] 2931         ldw y,#UINN ; >IN 
      008FE7 90 BF 20         [ 2] 2932         ldw YTEMP,y
      008FEA 90 85            [ 2] 2933         popw y 
      008FEC 91 CF 20         [ 5] 2934         ldw [YTEMP],y
      008FEF 81               [ 4] 2935         ret 
                           000000  2936 .else
                                   2937         CALL     NTIB
                                   2938         CALL     AT
                                   2939         CALL     INN
                                   2940         JP     STORE
                                   2941 .endif 
                                   2942 
                                   2943 ;       WORD    ( c -- a ; <string> )
                                   2944 ;       Parse a word from input stream
                                   2945 ;       and copy it to code dictionary.
      008FF0 8F D9                 2946         .word      LINK
                           000F72  2947 LINK = . 
      008FF2 04                    2948         .byte      4
      008FF3 57 4F 52 44           2949         .ascii     "WORD"
      008FF7                       2950 WORDD:
      008FF7 CD 8F 8E         [ 4] 2951         CALL     PARSE
      008FFA CD 8A 80         [ 4] 2952         CALL     HERE
      008FFD CD 88 FC         [ 4] 2953         CALL     CELLP
      009000 CC 8B 41         [ 2] 2954         JP     PACKS
                                   2955 
                                   2956 ;       TOKEN   ( -- a ; <string> )
                                   2957 ;       Parse a word from input stream
                                   2958 ;       and copy it to name dictionary.
      009003 8F F2                 2959         .word      LINK
                           000F85  2960 LINK = . 
      009005 05                    2961         .byte      5
      009006 54 4F 4B 45 4E        2962         .ascii     "TOKEN"
      00900B                       2963 TOKEN:
      00900B CD 89 86         [ 4] 2964         CALL     BLANK
      00900E CC 8F F7         [ 2] 2965         JP     WORDD
                                   2966 
                                   2967 ;; Dictionary search
                                   2968 
                                   2969 ;       NAME>   ( na -- ca )
                                   2970 ;       Return a code address given
                                   2971 ;       a name address.
      009011 90 05                 2972         .word      LINK
                           000F93  2973 LINK = . 
      009013 05                    2974         .byte      5
      009014 4E 41 4D 45 3E        2975         .ascii     "NAME>"
      009019                       2976 NAMET:
      009019 CD 8A 69         [ 4] 2977         CALL     COUNT
      00901C CD 83 43         [ 4] 2978         CALL     DOLIT
      00901F 00 1F                 2979         .word      31
      009021 CD 84 BE         [ 4] 2980         CALL     ANDD
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      009024 CC 86 48         [ 2] 2981         JP     PLUS
                                   2982 
                                   2983 ;       SAME?   ( a a u -- a a f \ -0+ )
                                   2984 ;       Compare u cells in two
                                   2985 ;       strings. Return 0 if identical.
      009027 90 13                 2986         .word      LINK
                           000FA9  2987 LINK = . 
      009029 05                    2988         .byte       5
      00902A 53 41 4D 45 3F        2989         .ascii     "SAME?"
      00902F                       2990 SAMEQ:
      00902F CD 89 34         [ 4] 2991         CALL     ONEM
      009032 CD 84 3B         [ 4] 2992         CALL     TOR
      009035 20 29            [ 2] 2993         JRA     SAME2
      009037 CD 84 9C         [ 4] 2994 SAME1:  CALL     OVER
      00903A CD 84 2F         [ 4] 2995         CALL     RAT
      00903D CD 86 48         [ 4] 2996         CALL     PLUS
      009040 CD 83 E9         [ 4] 2997         CALL     CAT
      009043 CD 84 9C         [ 4] 2998         CALL     OVER
      009046 CD 84 2F         [ 4] 2999         CALL     RAT
      009049 CD 86 48         [ 4] 3000         CALL     PLUS
      00904C CD 83 E9         [ 4] 3001         CALL     CAT
      00904F CD 86 A6         [ 4] 3002         CALL     SUBB
      009052 CD 85 F7         [ 4] 3003         CALL     QDUP
      009055 CD 83 76         [ 4] 3004         CALL     QBRAN
      009058 90 60                 3005         .word      SAME2
      00905A CD 84 1C         [ 4] 3006         CALL     RFROM
      00905D CC 84 68         [ 2] 3007         JP     DROP
      009060 CD 83 57         [ 4] 3008 SAME2:  CALL     DONXT
      009063 90 37                 3009         .word      SAME1
      009065 CC 89 93         [ 2] 3010         JP     ZERO
                                   3011 
                                   3012 ;       find    ( a va -- ca na | a F )
                                   3013 ;       Search vocabulary for string.
                                   3014 ;       Return ca and na if succeeded.
      009068 90 29                 3015         .word      LINK
                           000FEA  3016 LINK = . 
      00906A 04                    3017         .byte      4
      00906B 46 49 4E 44           3018         .ascii     "FIND"
      00906F                       3019 FIND:
      00906F CD 84 82         [ 4] 3020         CALL     SWAPP
      009072 CD 84 72         [ 4] 3021         CALL     DUPP
      009075 CD 83 E9         [ 4] 3022         CALL     CAT
      009078 CD 85 3E         [ 4] 3023         CALL     TEMP
      00907B CD 83 B4         [ 4] 3024         CALL     STORE
      00907E CD 84 72         [ 4] 3025         CALL     DUPP
      009081 CD 83 CB         [ 4] 3026         CALL     AT
      009084 CD 84 3B         [ 4] 3027         CALL     TOR
      009087 CD 88 FC         [ 4] 3028         CALL     CELLP
      00908A CD 84 82         [ 4] 3029         CALL     SWAPP
      00908D CD 83 CB         [ 4] 3030 FIND1:  CALL     AT
      009090 CD 84 72         [ 4] 3031         CALL     DUPP
      009093 CD 83 76         [ 4] 3032         CALL     QBRAN
      009096 90 CC                 3033         .word      FIND6
      009098 CD 84 72         [ 4] 3034         CALL     DUPP
      00909B CD 83 CB         [ 4] 3035         CALL     AT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      00909E CD 83 43         [ 4] 3036         CALL     DOLIT
      0090A1 1F 7F                 3037         .word      MASKK
      0090A3 CD 84 BE         [ 4] 3038         CALL     ANDD
      0090A6 CD 84 2F         [ 4] 3039         CALL     RAT
      0090A9 CD 84 E7         [ 4] 3040         CALL     XORR
      0090AC CD 83 76         [ 4] 3041         CALL     QBRAN
      0090AF 90 BB                 3042         .word      FIND2
      0090B1 CD 88 FC         [ 4] 3043         CALL     CELLP
      0090B4 CD 83 43         [ 4] 3044         CALL     DOLIT
      0090B7 FF FF                 3045         .word     0xFFFF
      0090B9 20 0C            [ 2] 3046         JRA     FIND3
      0090BB CD 88 FC         [ 4] 3047 FIND2:  CALL     CELLP
      0090BE CD 85 3E         [ 4] 3048         CALL     TEMP
      0090C1 CD 83 CB         [ 4] 3049         CALL     AT
      0090C4 CD 90 2F         [ 4] 3050         CALL     SAMEQ
      0090C7 CD 83 8D         [ 4] 3051 FIND3:  CALL     BRAN
      0090CA 90 DB                 3052         .word      FIND4
      0090CC CD 84 1C         [ 4] 3053 FIND6:  CALL     RFROM
      0090CF CD 84 68         [ 4] 3054         CALL     DROP
      0090D2 CD 84 82         [ 4] 3055         CALL     SWAPP
      0090D5 CD 89 0B         [ 4] 3056         CALL     CELLM
      0090D8 CC 84 82         [ 2] 3057         JP     SWAPP
      0090DB CD 83 76         [ 4] 3058 FIND4:  CALL     QBRAN
      0090DE 90 E8                 3059         .word      FIND5
      0090E0 CD 89 0B         [ 4] 3060         CALL     CELLM
      0090E3 CD 89 0B         [ 4] 3061         CALL     CELLM
      0090E6 20 A5            [ 2] 3062         JRA     FIND1
      0090E8 CD 84 1C         [ 4] 3063 FIND5:  CALL     RFROM
      0090EB CD 84 68         [ 4] 3064         CALL     DROP
      0090EE CD 84 82         [ 4] 3065         CALL     SWAPP
      0090F1 CD 84 68         [ 4] 3066         CALL     DROP
      0090F4 CD 89 0B         [ 4] 3067         CALL     CELLM
      0090F7 CD 84 72         [ 4] 3068         CALL     DUPP
      0090FA CD 90 19         [ 4] 3069         CALL     NAMET
      0090FD CC 84 82         [ 2] 3070         JP     SWAPP
                                   3071 
                                   3072 ;       NAME?   ( a -- ca na | a F )
                                   3073 ;       Search vocabularies for a string.
      009100 90 6A                 3074         .word      LINK
                           001082  3075 LINK = . 
      009102 05                    3076         .byte      5
      009103 4E 41 4D 45 3F        3077         .ascii     "NAME?"
      009108                       3078 NAMEQ:
      009108 CD 85 A0         [ 4] 3079         CALL   CNTXT
      00910B CC 90 6F         [ 2] 3080         JP     FIND
                                   3081 
                                   3082 ;; Terminal response
                                   3083 
                                   3084 ;       ^H      ( bot eot cur -- bot eot cur )
                                   3085 ;       Backup cursor by one character.
      00910E 91 02                 3086         .word      LINK
                           001090  3087 LINK = . 
      009110 02                    3088         .byte      2
      009111 5E 48                 3089         .ascii     "^H"
      009113                       3090 BKSP:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



      009113 CD 84 3B         [ 4] 3091         CALL     TOR
      009116 CD 84 9C         [ 4] 3092         CALL     OVER
      009119 CD 84 1C         [ 4] 3093         CALL     RFROM
      00911C CD 84 82         [ 4] 3094         CALL     SWAPP
      00911F CD 84 9C         [ 4] 3095         CALL     OVER
      009122 CD 84 E7         [ 4] 3096         CALL     XORR
      009125 CD 83 76         [ 4] 3097         CALL     QBRAN
      009128 91 43                 3098         .word      BACK1
      00912A CD 83 43         [ 4] 3099         CALL     DOLIT
      00912D 00 08                 3100         .word      BKSPP
      00912F CD 83 2D         [ 4] 3101         CALL     EMIT
      009132 CD 89 34         [ 4] 3102         CALL     ONEM
      009135 CD 89 86         [ 4] 3103         CALL     BLANK
      009138 CD 83 2D         [ 4] 3104         CALL     EMIT
      00913B CD 83 43         [ 4] 3105         CALL     DOLIT
      00913E 00 08                 3106         .word      BKSPP
      009140 CC 83 2D         [ 2] 3107         JP     EMIT
      009143 81               [ 4] 3108 BACK1:  RET
                                   3109 
                                   3110 ;       TAP     ( bot eot cur c -- bot eot cur )
                                   3111 ;       Accept and echo key stroke
                                   3112 ;       and bump cursor.
      009144 91 10                 3113         .word      LINK
                           0010C6  3114 LINK = . 
      009146 03                    3115         .byte      3
      009147 54 41 50              3116         .ascii     "TAP"
      00914A                       3117 TAP:
      00914A CD 84 72         [ 4] 3118         CALL     DUPP
      00914D CD 83 2D         [ 4] 3119         CALL     EMIT
      009150 CD 84 9C         [ 4] 3120         CALL     OVER
      009153 CD 83 D8         [ 4] 3121         CALL     CSTOR
      009156 CC 89 27         [ 2] 3122         JP     ONEP
                                   3123 
                                   3124 ;       kTAP    ( bot eot cur c -- bot eot cur )
                                   3125 ;       Process a key stroke,
                                   3126 ;       CR or backspace.
      009159 91 46                 3127         .word      LINK
                           0010DB  3128 LINK = . 
      00915B 04                    3129         .byte      4
      00915C 4B 54 41 50           3130         .ascii     "KTAP"
      009160                       3131 KTAP:
      009160 CD 84 72         [ 4] 3132         CALL     DUPP
      009163 CD 83 43         [ 4] 3133         CALL     DOLIT
      009166 00 0D                 3134         .word      CRR
      009168 CD 84 E7         [ 4] 3135         CALL     XORR
      00916B CD 83 76         [ 4] 3136         CALL     QBRAN
      00916E 91 86                 3137         .word      KTAP2
      009170 CD 83 43         [ 4] 3138         CALL     DOLIT
      009173 00 08                 3139         .word      BKSPP
      009175 CD 84 E7         [ 4] 3140         CALL     XORR
      009178 CD 83 76         [ 4] 3141         CALL     QBRAN
      00917B 91 83                 3142         .word      KTAP1
      00917D CD 89 86         [ 4] 3143         CALL     BLANK
      009180 CC 91 4A         [ 2] 3144         JP     TAP
      009183 CC 91 13         [ 2] 3145 KTAP1:  JP     BKSP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      009186 CD 84 68         [ 4] 3146 KTAP2:  CALL     DROP
      009189 CD 84 82         [ 4] 3147         CALL     SWAPP
      00918C CD 84 68         [ 4] 3148         CALL     DROP
      00918F CC 84 72         [ 2] 3149         JP     DUPP
                                   3150 
                                   3151 ;       accept  ( b u -- b u )
                                   3152 ;       Accept characters to input
                                   3153 ;       buffer. Return with actual count.
      009192 91 5B                 3154         .word      LINK
                           001114  3155 LINK = . 
      009194 06                    3156         .byte      6
      009195 41 43 43 45 50 54     3157         .ascii     "ACCEPT"
      00919B                       3158 ACCEP:
      00919B CD 84 9C         [ 4] 3159         CALL     OVER
      00919E CD 86 48         [ 4] 3160         CALL     PLUS
      0091A1 CD 84 9C         [ 4] 3161         CALL     OVER
      0091A4 CD 86 33         [ 4] 3162 ACCP1:  CALL     DDUP
      0091A7 CD 84 E7         [ 4] 3163         CALL     XORR
      0091AA CD 83 76         [ 4] 3164         CALL     QBRAN
      0091AD 91 CF                 3165         .word      ACCP4
      0091AF CD 8D 79         [ 4] 3166         CALL     KEY
      0091B2 CD 84 72         [ 4] 3167         CALL     DUPP
      0091B5 CD 89 86         [ 4] 3168         CALL     BLANK
      0091B8 CD 83 43         [ 4] 3169         CALL     DOLIT
      0091BB 00 7F                 3170         .word      127
      0091BD CD 87 68         [ 4] 3171         CALL     WITHI
      0091C0 CD 83 76         [ 4] 3172         CALL     QBRAN
      0091C3 91 CA                 3173         .word      ACCP2
      0091C5 CD 91 4A         [ 4] 3174         CALL     TAP
      0091C8 20 03            [ 2] 3175         JRA     ACCP3
      0091CA CD 91 60         [ 4] 3176 ACCP2:  CALL     KTAP
      0091CD 20 D5            [ 2] 3177 ACCP3:  JRA     ACCP1
      0091CF CD 84 68         [ 4] 3178 ACCP4:  CALL     DROP
      0091D2 CD 84 9C         [ 4] 3179         CALL     OVER
      0091D5 CC 86 A6         [ 2] 3180         JP     SUBB
                                   3181 
                                   3182 ;       QUERY   ( -- )
                                   3183 ;       Accept input stream to
                                   3184 ;       terminal input buffer.
      0091D8 91 94                 3185         .word      LINK
                                   3186         
                           00115A  3187 LINK = . 
      0091DA 05                    3188         .byte      5
      0091DB 51 55 45 52 59        3189         .ascii     "QUERY"
      0091E0                       3190 QUERY:
      0091E0 CD 8A A2         [ 4] 3191         CALL     TIB
      0091E3 CD 83 43         [ 4] 3192         CALL     DOLIT
      0091E6 00 50                 3193         .word      80
      0091E8 CD 91 9B         [ 4] 3194         CALL     ACCEP
      0091EB CD 85 5D         [ 4] 3195         CALL     NTIB
      0091EE CD 83 B4         [ 4] 3196         CALL     STORE
      0091F1 CD 84 68         [ 4] 3197         CALL     DROP
      0091F4 CD 89 93         [ 4] 3198         CALL     ZERO
      0091F7 CD 85 4D         [ 4] 3199         CALL     INN
      0091FA CC 83 B4         [ 2] 3200         JP     STORE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



                                   3201 
                                   3202 ;       ABORT   ( -- )
                                   3203 ;       Reset data stack and
                                   3204 ;       jump to QUIT.
      0091FD 91 DA                 3205         .word      LINK
                           00117F  3206 LINK = . 
      0091FF 05                    3207         .byte      5
      009200 41 42 4F 52 54        3208         .ascii     "ABORT"
      009205                       3209 ABORT:
      009205 CD 92 FC         [ 4] 3210         CALL     PRESE
      009208 CC 93 19         [ 2] 3211         JP     QUIT
                                   3212 
                                   3213 ;       abort"  ( f -- )
                                   3214 ;       Run time routine of ABORT".
                                   3215 ;       Abort with a message.
      00920B 91 FF                 3216         .word      LINK
                           00118D  3217 LINK = . 
      00920D 46                    3218 	.byte      COMPO+6
      00920E 41 42 4F 52 54        3219         .ascii     "ABORT"
      009213 22                    3220         .byte      '"'
      009214                       3221 ABORQ:
      009214 CD 83 76         [ 4] 3222         CALL     QBRAN
      009217 92 33                 3223         .word      ABOR2   ;text flag
      009219 CD 8E 0F         [ 4] 3224         CALL     DOSTR
      00921C CD 8D B1         [ 4] 3225 ABOR1:  CALL     SPACE
      00921F CD 8A 69         [ 4] 3226         CALL     COUNT
      009222 CD 8D DB         [ 4] 3227         CALL     TYPES
      009225 CD 83 43         [ 4] 3228         CALL     DOLIT
      009228 00 3F                 3229         .word     63 ; "?"
      00922A CD 83 2D         [ 4] 3230         CALL     EMIT
      00922D CD 8D F9         [ 4] 3231         CALL     CR
      009230 CC 92 05         [ 2] 3232         JP     ABORT   ;pass error string
      009233 CD 8E 0F         [ 4] 3233 ABOR2:  CALL     DOSTR
      009236 CC 84 68         [ 2] 3234         JP     DROP
                                   3235 
                                   3236 ;; The text interpreter
                                   3237 
                                   3238 ;       $INTERPRET      ( a -- )
                                   3239 ;       Interpret a word. If failed,
                                   3240 ;       try to convert it to an integer.
      009239 92 0D                 3241         .word      LINK
                           0011BB  3242 LINK = . 
      00923B 0A                    3243         .byte      10
      00923C 24 49 4E 54 45 52 50  3244         .ascii     "$INTERPRET"
             52 45 54
      009246                       3245 INTER:
      009246 CD 91 08         [ 4] 3246         CALL     NAMEQ
      009249 CD 85 F7         [ 4] 3247         CALL     QDUP    ;?defined
      00924C CD 83 76         [ 4] 3248         CALL     QBRAN
      00924F 92 70                 3249         .word      INTE1
      009251 CD 83 CB         [ 4] 3250         CALL     AT
      009254 CD 83 43         [ 4] 3251         CALL     DOLIT
      009257 40 00                 3252 	.word       0x4000	; COMPO*256
      009259 CD 84 BE         [ 4] 3253         CALL     ANDD    ;?compile only lexicon bits
      00925C CD 92 14         [ 4] 3254         CALL     ABORQ
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      00925F 0D                    3255         .byte      13
      009260 20 63 6F 6D 70 69 6C  3256         .ascii     " compile only"
             65 20 6F 6E 6C 79
      00926D CC 83 9D         [ 2] 3257         JP     EXECU
      009270 CD 8C A6         [ 4] 3258 INTE1:  CALL     NUMBQ   ;convert a number
      009273 CD 83 76         [ 4] 3259         CALL     QBRAN
      009276 92 1C                 3260         .word    ABOR1
      009278 81               [ 4] 3261         RET
                                   3262 
                                   3263 ;       [       ( -- )
                                   3264 ;       Start  text interpreter.
      009279 92 3B                 3265         .word      LINK
                           0011FB  3266 LINK = . 
      00927B 81                    3267 	.byte      IMEDD+1
      00927C 5B                    3268         .ascii     "["
      00927D                       3269 LBRAC:
      00927D CD 83 43         [ 4] 3270         CALL   DOLIT
      009280 92 46                 3271         .word  INTER
      009282 CD 85 7E         [ 4] 3272         CALL   TEVAL
      009285 CC 83 B4         [ 2] 3273         JP     STORE
                                   3274 
                                   3275 ;       .OK     ( -- )
                                   3276 ;       Display 'ok' while interpreting.
      009288 92 7B                 3277         .word      LINK
                           00120A  3278 LINK = . 
      00928A 03                    3279         .byte      3
      00928B 2E 4F 4B              3280         .ascii     ".OK"
      00928E                       3281 DOTOK:
      00928E CD 83 43         [ 4] 3282         CALL     DOLIT
      009291 92 46                 3283         .word      INTER
      009293 CD 85 7E         [ 4] 3284         CALL     TEVAL
      009296 CD 83 CB         [ 4] 3285         CALL     AT
      009299 CD 86 CE         [ 4] 3286         CALL     EQUAL
      00929C CD 83 76         [ 4] 3287         CALL     QBRAN
      00929F 92 A8                 3288         .word      DOTO1
      0092A1 CD 8E 38         [ 4] 3289         CALL     DOTQP
      0092A4 03                    3290         .byte      3
      0092A5 20 6F 6B              3291         .ascii     " ok"
      0092A8 CC 8D F9         [ 2] 3292 DOTO1:  JP     CR
                                   3293 
                                   3294 ;       ?STACK  ( -- )
                                   3295 ;       Abort if stack underflows.
      0092AB 92 8A                 3296         .word      LINK
                           00122D  3297 LINK = . 
      0092AD 06                    3298         .byte      6
      0092AE 3F 53 54 41 43 4B     3299         .ascii     "?STACK"
      0092B4                       3300 QSTAC: 
      0092B4 CD 89 D6         [ 4] 3301         CALL     DEPTH
      0092B7 CD 84 AB         [ 4] 3302         CALL     ZLESS   ;check only for underflow
      0092BA CD 92 14         [ 4] 3303         CALL     ABORQ
      0092BD 0B                    3304         .byte      11
      0092BE 20 75 6E 64 65 72 66  3305         .ascii     " underflow "
             6C 6F 77 20
      0092C9 81               [ 4] 3306         RET
                                   3307 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



                                   3308 ;       EVAL    ( -- )
                                   3309 ;       Interpret  input stream.
      0092CA 92 AD                 3310         .word      LINK
                           00124C  3311 LINK = . 
      0092CC 04                    3312         .byte      4
      0092CD 45 56 41 4C           3313         .ascii     "EVAL"
      0092D1                       3314 EVAL:
      0092D1 CD 90 0B         [ 4] 3315 EVAL1:  CALL     TOKEN
      0092D4 CD 84 72         [ 4] 3316         CALL     DUPP
      0092D7 CD 83 E9         [ 4] 3317         CALL     CAT     ;?input stream empty
      0092DA CD 83 76         [ 4] 3318         CALL     QBRAN
      0092DD 92 ED                 3319         .word    EVAL2
      0092DF CD 85 7E         [ 4] 3320         CALL     TEVAL
      0092E2 CD 8A B6         [ 4] 3321         CALL     ATEXE
      0092E5 CD 92 B4         [ 4] 3322         CALL     QSTAC   ;evaluate input, check stack
      0092E8 CD 83 8D         [ 4] 3323         CALL     BRAN
      0092EB 92 D1                 3324         .word    EVAL1
      0092ED CD 84 68         [ 4] 3325 EVAL2:  CALL     DROP
      0092F0 CC 92 8E         [ 2] 3326         JP       DOTOK
                                   3327 
                                   3328 ;       PRESET  ( -- )
                                   3329 ;       Reset data stack pointer and
                                   3330 ;       terminal input buffer.
      0092F3 92 CC                 3331         .word      LINK
                           001275  3332 LINK = . 
      0092F5 06                    3333         .byte      6
      0092F6 50 52 45 53 45 54     3334         .ascii     "PRESET"
      0092FC                       3335 PRESE:
      0092FC CD 83 43         [ 4] 3336         CALL     DOLIT
      0092FF 16 70                 3337         .word      SPP
      009301 CD 84 5F         [ 4] 3338         CALL     SPSTO
      009304 CD 83 43         [ 4] 3339         CALL     DOLIT
      009307 17 00                 3340         .word      TIBB
      009309 CD 85 5D         [ 4] 3341         CALL     NTIB
      00930C CD 88 FC         [ 4] 3342         CALL     CELLP
      00930F CC 83 B4         [ 2] 3343         JP     STORE
                                   3344 
                                   3345 ;       QUIT    ( -- )
                                   3346 ;       Reset return stack pointer
                                   3347 ;       and start text interpreter.
      009312 92 F5                 3348         .word      LINK
                           001294  3349 LINK = . 
      009314 04                    3350         .byte      4
      009315 51 55 49 54           3351         .ascii     "QUIT"
      009319                       3352 QUIT:
      009319 CD 83 43         [ 4] 3353         CALL     DOLIT
      00931C 17 FF                 3354         .word      RPP
      00931E CD 84 06         [ 4] 3355         CALL     RPSTO   ;reset return stack pointer
      009321 CD 92 7D         [ 4] 3356 QUIT1:  CALL     LBRAC   ;start interpretation
      009324 CD 91 E0         [ 4] 3357 QUIT2:  CALL     QUERY   ;get input
      009327 CD 92 D1         [ 4] 3358         CALL     EVAL
      00932A 20 F8            [ 2] 3359         JRA     QUIT2   ;continue till error
                                   3360 
                                   3361 ;; The compiler
                                   3362 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



                                   3363 ;       '       ( -- ca )
                                   3364 ;       Search vocabularies for
                                   3365 ;       next word in input stream.
      00932C 93 14                 3366         .word      LINK
                           0012AE  3367 LINK = . 
      00932E 01                    3368         .byte      1
      00932F 27                    3369         .ascii     "'"
      009330                       3370 TICK:
      009330 CD 90 0B         [ 4] 3371         CALL     TOKEN
      009333 CD 91 08         [ 4] 3372         CALL     NAMEQ   ;?defined
      009336 CD 83 76         [ 4] 3373         CALL     QBRAN
      009339 92 1C                 3374         .word      ABOR1
      00933B 81               [ 4] 3375         RET     ;yes, push code address
                                   3376 
                                   3377 ;       ALLOT   ( n -- )
                           000001  3378 .if PICATOUT_MOD
                                   3379 ;       Allocate n bytes to RAM 
                           000000  3380 .else 
                                   3381 ;       Allocate n bytes to  code dictionary.
                                   3382 .endif 
      00933C 93 2E                 3383         .word      LINK
                           0012BE  3384 LINK = . 
      00933E 05                    3385         .byte      5
      00933F 41 4C 4C 4F 54        3386         .ascii     "ALLOT"
      009344                       3387 ALLOT:
      009344 CD 85 AE         [ 4] 3388         CALL     VPP
                           000001  3389 .if PICATOUT_MOD
                                   3390 ; must update APP_VP each time VP is modidied
      009347 CD 8A 02         [ 4] 3391         call PSTOR 
      00934A CD 99 F1         [ 4] 3392         call UPDATVP 
                           000000  3393 .else
                                   3394         JP     PSTOR
                                   3395 .endif ;PICATOUT_MOD
                                   3396 
                                   3397 ;       ,       ( w -- )
                                   3398 ;         Compile an integer into
                                   3399 ;         variable space.
      00934D 93 3E                 3400         .word      LINK
                           0012CF  3401 LINK = . 
      00934F 01                    3402         .byte      1
      009350 2C                    3403         .ascii     ","
      009351                       3404 COMMA:
      009351 CD 8A 80         [ 4] 3405         CALL     HERE
      009354 CD 84 72         [ 4] 3406         CALL     DUPP
      009357 CD 88 FC         [ 4] 3407         CALL     CELLP   ;cell boundary
      00935A CD 85 AE         [ 4] 3408         CALL     VPP
      00935D CD 83 B4         [ 4] 3409         CALL     STORE
      009360 CC 83 B4         [ 2] 3410         JP     STORE
                                   3411 
                                   3412 ;       C,      ( c -- )
                                   3413 ;       Compile a byte into
                                   3414 ;       variables space.
      009363 93 4F                 3415        .word      LINK
                           0012E5  3416 LINK = . 
      009365 02                    3417         .byte      2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



      009366 43 2C                 3418         .ascii     "C,"
      009368                       3419 CCOMMA:
      009368 CD 8A 80         [ 4] 3420         CALL     HERE
      00936B CD 84 72         [ 4] 3421         CALL     DUPP
      00936E CD 89 27         [ 4] 3422         CALL     ONEP
      009371 CD 85 AE         [ 4] 3423         CALL     VPP
      009374 CD 83 B4         [ 4] 3424         CALL     STORE
      009377 CC 83 D8         [ 2] 3425         JP     CSTOR
                                   3426 
                                   3427 ;       [COMPILE]       ( -- ; <string> )
                                   3428 ;       Compile next immediate
                                   3429 ;       word into code dictionary.
      00937A 93 65                 3430         .word      LINK
                           0012FC  3431 LINK = . 
      00937C 89                    3432 	.byte      IMEDD+9
      00937D 5B 43 4F 4D 50 49 4C  3433         .ascii     "[COMPILE]"
             45 5D
      009386                       3434 BCOMP:
      009386 CD 93 30         [ 4] 3435         CALL     TICK
      009389 CC 96 38         [ 2] 3436         JP     JSRC
                                   3437 
                                   3438 ;       COMPILE ( -- )
                                   3439 ;       Compile next jsr in
                                   3440 ;       colon list to code dictionary.
      00938C 93 7C                 3441         .word      LINK
                           00130E  3442 LINK = . 
      00938E 47                    3443 	.byte      COMPO+7
      00938F 43 4F 4D 50 49 4C 45  3444         .ascii     "COMPILE"
      009396                       3445 COMPI:
      009396 CD 84 1C         [ 4] 3446         CALL     RFROM
                           000001  3447 .if PICATOUT_MOD
                                   3448 ; no need to increment
                           000000  3449 .else
                                   3450         CALL     ONEP
                                   3451 .endif 
      009399 CD 84 72         [ 4] 3452         CALL     DUPP
      00939C CD 83 CB         [ 4] 3453         CALL     AT
      00939F CD 96 38         [ 4] 3454         CALL     JSRC    ;compile subroutine
      0093A2 CD 88 FC         [ 4] 3455         CALL     CELLP
                           000001  3456 .if PICATOUT_MOD
      0093A5 90 93            [ 1] 3457         ldw y,x 
      0093A7 90 FE            [ 2] 3458         ldw y,(y)
      0093A9 1C 00 02         [ 2] 3459         addw x,#CELLL 
      0093AC 90 FC            [ 2] 3460         jp (y)
                           000000  3461 .else 
                                   3462         JP     TOR
                                   3463 .endif 
                                   3464 
                                   3465 ;       LITERAL ( w -- )
                                   3466 ;       Compile tos to dictionary
                                   3467 ;       as an integer literal.
      0093AE 93 8E                 3468         .word      LINK
                           001330  3469 LINK = . 
      0093B0 87                    3470 	.byte      IMEDD+7
      0093B1 4C 49 54 45 52 41 4C  3471         .ascii     "LITERAL"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      0093B8                       3472 LITER:
      0093B8 CD 93 96         [ 4] 3473         CALL     COMPI
                           000001  3474 .if PICATOUT_MOD
      0093BB 83 43                 3475         .word DOLIT 
                           000000  3476 .else         
                                   3477         CALL     DOLIT
                                   3478 .endif 
      0093BD CC 93 51         [ 2] 3479         JP     COMMA
                                   3480 
                                   3481 ;       $,"     ( -- )
                                   3482 ;       Compile a literal string
                                   3483 ;       up to next " .
      0093C0 93 B0                 3484         .word      LINK
                           001342  3485 LINK = . 
      0093C2 03                    3486         .byte      3
      0093C3 24 2C 22              3487         .byte     '$',',','"'
      0093C6                       3488 STRCQ:
      0093C6 CD 83 43         [ 4] 3489         CALL     DOLIT
      0093C9 00 22                 3490         .word     34	; "
      0093CB CD 8F 8E         [ 4] 3491         CALL     PARSE
      0093CE CD 8A 80         [ 4] 3492         CALL     HERE
      0093D1 CD 8B 41         [ 4] 3493         CALL     PACKS   ;string to code dictionary
      0093D4 CD 8A 69         [ 4] 3494         CALL     COUNT
      0093D7 CD 86 48         [ 4] 3495         CALL     PLUS    ;calculate aligned end of string
      0093DA CD 85 AE         [ 4] 3496         CALL     VPP
      0093DD CC 83 B4         [ 2] 3497         JP     STORE
                                   3498 
                                   3499 ;; Structures
                                   3500 
                                   3501 ;       FOR     ( -- a )
                                   3502 ;       Start a FOR-NEXT loop
                                   3503 ;       structure in a colon definition.
      0093E0 93 C2                 3504         .word      LINK
                           001362  3505 LINK = . 
      0093E2 83                    3506 	.byte      IMEDD+3
      0093E3 46 4F 52              3507         .ascii     "FOR"
      0093E6                       3508 FOR:
      0093E6 CD 93 96         [ 4] 3509         CALL     COMPI
                           000001  3510 .if PICATOUT_MOD
      0093E9 84 3B                 3511         .word TOR 
                           000000  3512 .else
                                   3513         CALL     TOR
                                   3514 .endif
      0093EB CC 8A 80         [ 2] 3515         JP     HERE
                                   3516 
                                   3517 ;       NEXT    ( a -- )
                                   3518 ;       Terminate a FOR-NEXT loop.
      0093EE 93 E2                 3519         .word      LINK
                           001370  3520 LINK = . 
      0093F0 84                    3521 	.byte      IMEDD+4
      0093F1 4E 45 58 54           3522         .ascii     "NEXT"
      0093F5                       3523 NEXT:
      0093F5 CD 93 96         [ 4] 3524         CALL     COMPI
                           000001  3525 .if PICATOUT_MOD
      0093F8 83 57                 3526         .word DONXT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



                           000000  3527 .else 
                                   3528         CALL     DONXT
                                   3529 .endif         
                           000001  3530 .if PICATOUT_MOD
      0093FA CD 85 E7         [ 4] 3531         call ADRADJ
                                   3532 .endif ; PICATOUT_MOD
      0093FD CC 93 51         [ 2] 3533         JP     COMMA
                                   3534 
                                   3535 ;       I ( -- n )
                                   3536 ;       stack FOR-NEXT COUNTER 
      009400 93 F0                 3537         .word LINK 
                           001382  3538         LINK=.
      009402 01                    3539         .byte 1 
      009403 49                    3540         .ascii "I"
      009404                       3541 IFETCH: 
      009404 1D 00 02         [ 2] 3542         subw x,#CELLL 
      009407 16 03            [ 2] 3543         ldw y,(3,sp)
      009409 FF               [ 2] 3544         ldw (x),y 
      00940A 81               [ 4] 3545         ret 
                                   3546 
                                   3547 ;       BEGIN   ( -- a )
                                   3548 ;       Start an infinite or
                                   3549 ;       indefinite loop structure.
      00940B 94 02                 3550         .word      LINK
                           00138D  3551 LINK = . 
      00940D 85                    3552 	.byte      IMEDD+5
      00940E 42 45 47 49 4E        3553         .ascii     "BEGIN"
      009413                       3554 BEGIN:
      009413 CC 8A 80         [ 2] 3555         JP     HERE
                                   3556 
                                   3557 ;       UNTIL   ( a -- )
                                   3558 ;       Terminate a BEGIN-UNTIL
                                   3559 ;       indefinite loop structure.
      009416 94 0D                 3560         .word      LINK
                           001398  3561 LINK = . 
      009418 85                    3562 	.byte      IMEDD+5
      009419 55 4E 54 49 4C        3563         .ascii     "UNTIL"
      00941E                       3564 UNTIL:
      00941E CD 93 96         [ 4] 3565         CALL     COMPI
                           000001  3566 .if PICATOUT_MOD
      009421 83 76                 3567         .word    QBRAN 
                           000000  3568 .else 
                                   3569         CALL     QBRAN
                                   3570 .endif 
                           000001  3571 .if PICATOUT_MOD 
      009423 CD 85 E7         [ 4] 3572         call ADRADJ
                                   3573 .endif ; PICATOUT_MOD
      009426 CC 93 51         [ 2] 3574         JP     COMMA
                                   3575 
                                   3576 ;       AGAIN   ( a -- )
                                   3577 ;       Terminate a BEGIN-AGAIN
                                   3578 ;       infinite loop structure.
      009429 94 18                 3579         .word      LINK
                           0013AB  3580 LINK = . 
      00942B 85                    3581 	.byte      IMEDD+5
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      00942C 41 47 41 49 4E        3582         .ascii     "AGAIN"
      009431                       3583 AGAIN:
      009431 CD 93 96         [ 4] 3584         CALL     COMPI
                           000001  3585 .if PICATOUT_MOD
      009434 83 8D                 3586         .word BRAN
                           000000  3587 .else
                                   3588         CALL     BRAN
                                   3589 .endif 
                           000001  3590 .if PICATOUT_MOD 
      009436 CD 85 E7         [ 4] 3591         call ADRADJ 
                                   3592 .endif ; PICATOUT_MOD
      009439 CC 93 51         [ 2] 3593         JP     COMMA
                                   3594 
                                   3595 ;       IF      ( -- A )
                                   3596 ;       Begin a conditional branch.
      00943C 94 2B                 3597         .word      LINK
                           0013BE  3598 LINK = . 
      00943E 82                    3599 	.byte      IMEDD+2
      00943F 49 46                 3600         .ascii     "IF"
      009441                       3601 IFF:
      009441 CD 93 96         [ 4] 3602         CALL     COMPI
                           000001  3603 .if PICATOUT_MOD
      009444 83 76                 3604         .word QBRAN
                           000000  3605 .else
                                   3606         CALL     QBRAN
                                   3607 .endif 
      009446 CD 8A 80         [ 4] 3608         CALL     HERE
      009449 CD 89 93         [ 4] 3609         CALL     ZERO
      00944C CC 93 51         [ 2] 3610         JP     COMMA
                                   3611 
                                   3612 ;       THEN        ( A -- )
                                   3613 ;       Terminate a conditional branch structure.
      00944F 94 3E                 3614         .word      LINK
                           0013D1  3615 LINK = . 
      009451 84                    3616 	.byte      IMEDD+4
      009452 54 48 45 4E           3617         .ascii     "THEN"
      009456                       3618 THENN:
      009456 CD 8A 80         [ 4] 3619         CALL     HERE
                           000001  3620 .if PICATOUT_MOD 
      009459 CD 85 E7         [ 4] 3621         call ADRADJ 
                                   3622 .endif ; PICATOUT_MOD
      00945C CD 84 82         [ 4] 3623         CALL     SWAPP
      00945F CC 83 B4         [ 2] 3624         JP     STORE
                                   3625 
                                   3626 ;       ELSE        ( A -- A )
                                   3627 ;       Start the false clause in an IF-ELSE-THEN structure.
      009462 94 51                 3628         .word      LINK
                           0013E4  3629 LINK = . 
      009464 84                    3630 	.byte      IMEDD+4
      009465 45 4C 53 45           3631         .ascii     "ELSE"
      009469                       3632 ELSEE:
      009469 CD 93 96         [ 4] 3633         CALL     COMPI
                           000001  3634 .if PICATOUT_MOD
      00946C 83 8D                 3635         .word BRAN
                           000000  3636 .else
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



                                   3637         CALL     BRAN
                                   3638 .endif 
      00946E CD 8A 80         [ 4] 3639         CALL     HERE
      009471 CD 89 93         [ 4] 3640         CALL     ZERO
      009474 CD 93 51         [ 4] 3641         CALL     COMMA
      009477 CD 84 82         [ 4] 3642         CALL     SWAPP
      00947A CD 8A 80         [ 4] 3643         CALL     HERE
                           000001  3644 .if PICATOUT_MOD 
      00947D CD 85 E7         [ 4] 3645         call ADRADJ 
                                   3646 .endif ; PICATOUT_MOD
      009480 CD 84 82         [ 4] 3647         CALL     SWAPP
      009483 CC 83 B4         [ 2] 3648         JP     STORE
                                   3649 
                                   3650 ;       AHEAD       ( -- A )
                                   3651 ;       Compile a forward branch instruction.
      009486 94 64                 3652         .word      LINK
                           001408  3653 LINK = . 
      009488 85                    3654 	.byte      IMEDD+5
      009489 41 48 45 41 44        3655         .ascii     "AHEAD"
      00948E                       3656 AHEAD:
      00948E CD 93 96         [ 4] 3657         CALL     COMPI
                           000001  3658 .if PICATOUT_MOD
      009491 83 8D                 3659         .word BRAN
                           000000  3660 .else
                                   3661         CALL     BRAN
                                   3662 .endif 
      009493 CD 8A 80         [ 4] 3663         CALL     HERE
      009496 CD 89 93         [ 4] 3664         CALL     ZERO
      009499 CC 93 51         [ 2] 3665         JP     COMMA
                                   3666 
                                   3667 ;       WHILE       ( a -- A a )
                                   3668 ;       Conditional branch out of a BEGIN-WHILE-REPEAT loop.
      00949C 94 88                 3669         .word      LINK
                           00141E  3670 LINK = . 
      00949E 85                    3671 	.byte      IMEDD+5
      00949F 57 48 49 4C 45        3672         .ascii     "WHILE"
      0094A4                       3673 WHILE:
      0094A4 CD 93 96         [ 4] 3674         CALL     COMPI
                           000001  3675 .if PICATOUT_MOD
      0094A7 83 76                 3676         .word QBRAN
                           000000  3677 .else
                                   3678         CALL     QBRAN
                                   3679 .endif 
      0094A9 CD 8A 80         [ 4] 3680         CALL     HERE
      0094AC CD 89 93         [ 4] 3681         CALL     ZERO
      0094AF CD 93 51         [ 4] 3682         CALL     COMMA
      0094B2 CC 84 82         [ 2] 3683         JP     SWAPP
                                   3684 
                                   3685 ;       REPEAT      ( A a -- )
                                   3686 ;       Terminate a BEGIN-WHILE-REPEAT indefinite loop.
      0094B5 94 9E                 3687         .word      LINK
                           001437  3688 LINK = . 
      0094B7 86                    3689         .byte      IMEDD+6
      0094B8 52 45 50 45 41 54     3690         .ascii     "REPEAT"
      0094BE                       3691 REPEA:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      0094BE CD 93 96         [ 4] 3692         CALL     COMPI
                           000001  3693 .if PICATOUT_MOD
      0094C1 83 8D                 3694         .word BRAN
                           000000  3695 .else
                                   3696         CALL     BRAN
                                   3697 .endif 
                           000001  3698 .if PICATOUT_MOD 
      0094C3 CD 85 E7         [ 4] 3699         call ADRADJ 
                                   3700 .endif ; PICATOUT_MOD
      0094C6 CD 93 51         [ 4] 3701         CALL     COMMA
      0094C9 CD 8A 80         [ 4] 3702         CALL     HERE
                           000001  3703 .if PICATOUT_MOD 
      0094CC CD 85 E7         [ 4] 3704         call ADRADJ 
                                   3705 .endif ; PICATOUT_MOD
      0094CF CD 84 82         [ 4] 3706         CALL     SWAPP
      0094D2 CC 83 B4         [ 2] 3707         JP     STORE
                                   3708 
                                   3709 ;       AFT         ( a -- a A )
                                   3710 ;       Jump to THEN in a FOR-AFT-THEN-NEXT loop the first time through.
      0094D5 94 B7                 3711         .word      LINK
                           001457  3712 LINK = . 
      0094D7 83                    3713 	.byte      IMEDD+3
      0094D8 41 46 54              3714         .ascii     "AFT"
      0094DB                       3715 AFT:
      0094DB CD 84 68         [ 4] 3716         CALL     DROP
      0094DE CD 94 8E         [ 4] 3717         CALL     AHEAD
      0094E1 CD 8A 80         [ 4] 3718         CALL     HERE
      0094E4 CC 84 82         [ 2] 3719         JP     SWAPP
                                   3720 
                                   3721 ;       ABORT"      ( -- ; <string> )
                                   3722 ;       Conditional abort with an error message.
      0094E7 94 D7                 3723         .word      LINK
                           001469  3724 LINK = . 
      0094E9 86                    3725 	.byte      IMEDD+6
      0094EA 41 42 4F 52 54        3726         .ascii     "ABORT"
      0094EF 22                    3727         .byte      '"'
      0094F0                       3728 ABRTQ:
      0094F0 CD 93 96         [ 4] 3729         CALL     COMPI
                           000001  3730 .if PICATOUT_MOD
      0094F3 92 14                 3731         .word ABORQ
                           000000  3732 .else
                                   3733         CALL     ABORQ
                                   3734 .endif
      0094F5 CC 93 C6         [ 2] 3735         JP     STRCQ
                                   3736 
                                   3737 ;       $"     ( -- ; <string> )
                                   3738 ;       Compile an inline string literal.
      0094F8 94 E9                 3739         .word      LINK
                           00147A  3740 LINK = . 
      0094FA 82                    3741 	.byte      IMEDD+2
      0094FB 24 22                 3742         .byte     '$','"'
      0094FD                       3743 STRQ:
      0094FD CD 93 96         [ 4] 3744         CALL     COMPI
                           000001  3745 .if PICATOUT_MOD
      009500 8E 2E                 3746         .word STRQP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



                           000000  3747 .else
                                   3748         CALL     STRQP
                                   3749 .endif
      009502 CC 93 C6         [ 2] 3750         JP     STRCQ
                                   3751 
                                   3752 ;       ."          ( -- ; <string> )
                                   3753 ;       Compile an inline string literal to be typed out at run time.
      009505 94 FA                 3754         .word      LINK
                           001487  3755 LINK = . 
      009507 82                    3756 	.byte      IMEDD+2
      009508 2E 22                 3757         .byte     '.','"'
      00950A                       3758 DOTQ:
      00950A CD 93 96         [ 4] 3759         CALL     COMPI
                           000001  3760 .if PICATOUT_MOD
      00950D 8E 38                 3761         .word DOTQP 
                           000000  3762 .else
                                   3763         CALL     DOTQP
                                   3764 .endif 
      00950F CC 93 C6         [ 2] 3765         JP     STRCQ
                                   3766 
                                   3767 ;; Name compiler
                                   3768 
                                   3769 ;       ?UNIQUE ( a -- a )
                                   3770 ;       Display a warning message
                                   3771 ;       if word already exists.
      009512 95 07                 3772         .word      LINK
                           001494  3773 LINK = . 
      009514 07                    3774         .byte      7
      009515 3F 55 4E 49 51 55 45  3775         .ascii     "?UNIQUE"
      00951C                       3776 UNIQU:
      00951C CD 84 72         [ 4] 3777         CALL     DUPP
      00951F CD 91 08         [ 4] 3778         CALL     NAMEQ   ;?name exists
      009522 CD 83 76         [ 4] 3779         CALL     QBRAN
      009525 95 3B                 3780         .word      UNIQ1
      009527 CD 8E 38         [ 4] 3781         CALL     DOTQP   ;redef are OK
      00952A 07                    3782         .byte       7
      00952B 20 72 65 44 65 66 20  3783         .ascii     " reDef "       
      009532 CD 84 9C         [ 4] 3784         CALL     OVER
      009535 CD 8A 69         [ 4] 3785         CALL     COUNT
      009538 CD 8D DB         [ 4] 3786         CALL     TYPES   ;just in case
      00953B CC 84 68         [ 2] 3787 UNIQ1:  JP     DROP
                                   3788 
                                   3789 ;       $,n     ( na -- )
                                   3790 ;       Build a new dictionary name
                                   3791 ;       using string at na.
                           000001  3792 .if PICATOUT_MOD
                                   3793 ; compile dans l'espace des variables 
                                   3794 .endif 
      00953E 95 14                 3795         .word      LINK
                           0014C0  3796 LINK = . 
      009540 03                    3797         .byte      3
      009541 24 2C 6E              3798         .ascii     "$,n"
      009544                       3799 SNAME:
      009544 CD 84 72         [ 4] 3800         CALL     DUPP
      009547 CD 83 E9         [ 4] 3801         CALL     CAT     ;?null input
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      00954A CD 83 76         [ 4] 3802         CALL     QBRAN
      00954D 95 7A                 3803         .word      PNAM1
      00954F CD 95 1C         [ 4] 3804         CALL     UNIQU   ;?redefinition
      009552 CD 84 72         [ 4] 3805         CALL     DUPP
      009555 CD 8A 69         [ 4] 3806         CALL     COUNT
      009558 CD 86 48         [ 4] 3807         CALL     PLUS
      00955B CD 85 AE         [ 4] 3808         CALL     VPP
      00955E CD 83 B4         [ 4] 3809         CALL     STORE
      009561 CD 84 72         [ 4] 3810         CALL     DUPP
      009564 CD 85 CC         [ 4] 3811         CALL     LAST
      009567 CD 83 B4         [ 4] 3812         CALL     STORE   ;save na for vocabulary link
      00956A CD 89 0B         [ 4] 3813         CALL     CELLM   ;link address
      00956D CD 85 A0         [ 4] 3814         CALL     CNTXT
      009570 CD 83 CB         [ 4] 3815         CALL     AT
      009573 CD 84 82         [ 4] 3816         CALL     SWAPP
      009576 CD 83 B4         [ 4] 3817         CALL     STORE
      009579 81               [ 4] 3818         RET     ;save code pointer
      00957A CD 8E 2E         [ 4] 3819 PNAM1:  CALL     STRQP
      00957D 05                    3820         .byte      5
      00957E 20 6E 61 6D 65        3821         .ascii     " name" ;null input
      009583 CC 92 1C         [ 2] 3822         JP     ABOR1
                                   3823 
                                   3824 ;; FORTH compiler
                                   3825 
                                   3826 ;       $COMPILE        ( a -- )
                                   3827 ;       Compile next word to
                                   3828 ;       dictionary as a token or literal.
      009586 95 40                 3829         .word      LINK
                           001508  3830 LINK = . 
      009588 08                    3831         .byte      8
      009589 24 43 4F 4D 50 49 4C  3832         .ascii     "$COMPILE"
             45
      009591                       3833 SCOMP:
      009591 CD 91 08         [ 4] 3834         CALL     NAMEQ
      009594 CD 85 F7         [ 4] 3835         CALL     QDUP    ;?defined
      009597 CD 83 76         [ 4] 3836         CALL     QBRAN
      00959A 95 B2                 3837         .word      SCOM2
      00959C CD 83 CB         [ 4] 3838         CALL     AT
      00959F CD 83 43         [ 4] 3839         CALL     DOLIT
      0095A2 80 00                 3840         .word     0x8000	;  IMEDD*256
      0095A4 CD 84 BE         [ 4] 3841         CALL     ANDD    ;?immediate
      0095A7 CD 83 76         [ 4] 3842         CALL     QBRAN
      0095AA 95 AF                 3843         .word      SCOM1
      0095AC CC 83 9D         [ 2] 3844         JP     EXECU
      0095AF CC 96 38         [ 2] 3845 SCOM1:  JP     JSRC
      0095B2 CD 8C A6         [ 4] 3846 SCOM2:  CALL     NUMBQ   ;try to convert to number
      0095B5 CD 83 76         [ 4] 3847         CALL     QBRAN
      0095B8 92 1C                 3848         .word      ABOR1
      0095BA CC 93 B8         [ 2] 3849         JP     LITER
                                   3850 
                                   3851 ;       OVERT   ( -- )
                                   3852 ;       Link a new word into vocabulary.
      0095BD 95 88                 3853         .word      LINK
                           00153F  3854 LINK = . 
      0095BF 05                    3855         .byte      5
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



      0095C0 4F 56 45 52 54        3856         .ascii     "OVERT"
      0095C5                       3857 OVERT:
      0095C5 CD 85 CC         [ 4] 3858         CALL     LAST
      0095C8 CD 83 CB         [ 4] 3859         CALL     AT
      0095CB CD 85 A0         [ 4] 3860         CALL     CNTXT
      0095CE CC 83 B4         [ 2] 3861         JP     STORE
                                   3862 
                                   3863 ;       ;       ( -- )
                                   3864 ;       Terminate a colon definition.
      0095D1 95 BF                 3865         .word      LINK
                           001553  3866 LINK = . 
      0095D3 C1                    3867 	.byte      IMEDD+COMPO+1
      0095D4 3B                    3868         .ascii     ";"
      0095D5                       3869 SEMIS:
      0095D5 CD 93 96         [ 4] 3870         CALL     COMPI
                           000001  3871 .if PICATOUT_MOD
      0095D8 83 AD                 3872         .word EXIT 
                           000000  3873 .else
                                   3874         CALL     EXIT
                                   3875 .endif 
      0095DA CD 92 7D         [ 4] 3876         CALL     LBRAC
                           000001  3877 .if PICATOUT_MOD
      0095DD CD 95 C5         [ 4] 3878         call OVERT 
      0095E0 CD 9E BD         [ 4] 3879         CALL FMOVE
      0095E3 CD 9F 42         [ 4] 3880         CALL UPDATPTR 
      0095E6 81               [ 4] 3881         RET 
                           000000  3882 .else 
                                   3883         JP     OVERT
                                   3884 .endif 
                                   3885 
                           000001  3886 .if PICATOUT_MOD
                                   3887 ;       Terminate an ISR definition 
                                   3888 ;       retourn ca of ISR as double
                                   3889 ;       I; ( -- ud )
      0095E7 95 D3                 3890         .word LINK 
                           001569  3891         LINK=.
      0095E9 C2                    3892         .byte 2+IMEDD+COMPO 
      0095EA 49 3B                 3893         .ascii "I;" 
      0095EC                       3894 ISEMI:
      0095EC 1D 00 02         [ 2] 3895         subw x,#CELLL  
      0095EF 90 AE 00 80      [ 2] 3896         ldw y,#IRET_CODE 
      0095F3 FF               [ 2] 3897         ldw (x),y 
      0095F4 CD 93 68         [ 4] 3898         call CCOMMA
      0095F7 CD 92 7D         [ 4] 3899         call LBRAC 
      0095FA CD 9F 87         [ 4] 3900         call IFMOVE 
      0095FD CD 85 BC         [ 4] 3901         CALL CPP
      009600 CD 83 CB         [ 4] 3902         call AT 
      009603 CD 84 82         [ 4] 3903         call SWAPP 
      009606 CD 85 BC         [ 4] 3904         CALL CPP 
      009609 CD 83 B4         [ 4] 3905         call STORE 
      00960C CD 99 DA         [ 4] 3906         call UPDATCP 
      00960F CD 99 97         [ 4] 3907         call EEPVP 
      009612 CD 84 68         [ 4] 3908         call DROP 
      009615 CD 83 CB         [ 4] 3909         call AT 
      009618 CD 85 AE         [ 4] 3910         call VPP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



      00961B CD 83 B4         [ 4] 3911         call STORE 
      00961E CC 89 93         [ 2] 3912         jp ZERO
                                   3913           
                                   3914         
                                   3915 .endif ;PICATOUT_MOD
                                   3916 
                                   3917 ;       ]       ( -- )
                                   3918 ;       Start compiling words in
                                   3919 ;       input stream.
      009621 95 E9                 3920         .word      LINK
                           0015A3  3921 LINK = . 
      009623 01                    3922         .byte      1
      009624 5D                    3923         .ascii     "]"
      009625                       3924 RBRAC:
      009625 CD 83 43         [ 4] 3925         CALL   DOLIT
      009628 95 91                 3926         .word  SCOMP
      00962A CD 85 7E         [ 4] 3927         CALL   TEVAL
      00962D CC 83 B4         [ 2] 3928         JP     STORE
                                   3929 
                                   3930 ;       CALL,    ( ca -- )
                                   3931 ;       Compile a subroutine call.
      009630 96 23                 3932         .word      LINK
                           0015B2  3933 LINK = . 
      009632 04                    3934         .byte      4
      009633 43 41 4C 4C 2C        3935         .ascii     "CALL,"
      009638                       3936 JSRC:
      009638 CD 83 43         [ 4] 3937         CALL     DOLIT
      00963B 00 CD                 3938         .word     CALLL     ;CALL
      00963D CD 93 68         [ 4] 3939         CALL     CCOMMA
      009640 CC 93 51         [ 2] 3940         JP     COMMA
                                   3941 
                           000001  3942 .if PICATOUT_MOD
                                   3943 ;       INIT-OFS ( -- )
                                   3944 ;       compute offset to adjust jump address 
                                   3945 ;       set variable OFFSET 
      009643 96 32                 3946         .word LINK 
                           0015C5  3947         LINK=.
      009645 08                    3948         .byte 8 
      009646 49 4E 49 54 2D 4F 46  3949         .ascii "INIT-OFS" 
             53
      00964E                       3950 INITOFS:
      00964E CD 85 BC         [ 4] 3951         call CPP 
      009651 CD 83 CB         [ 4] 3952         call AT 
      009654 CD 8A 80         [ 4] 3953         call HERE
      009657 CD 86 A6         [ 4] 3954         call SUBB 
      00965A CD 85 DE         [ 4] 3955         call OFFSET 
      00965D CD 83 B4         [ 4] 3956         call STORE 
      009660 81               [ 4] 3957         ret 
                                   3958 .endif 
                                   3959 
                                   3960 ;       :       ( -- ; <string> )
                                   3961 ;       Start a new colon definition
                                   3962 ;       using next word as its name.
      009661 96 45                 3963         .word      LINK
                           0015E3  3964 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      009663 01                    3965         .byte      1
      009664 3A                    3966         .ascii     ":"
      009665                       3967 COLON:
                           000001  3968 .if PICATOUT_MOD
      009665 CD 96 4E         [ 4] 3969         call INITOFS 
                                   3970 .endif ; PICATOUT_MOD
      009668 CD 90 0B         [ 4] 3971         CALL   TOKEN
      00966B CD 95 44         [ 4] 3972         CALL   SNAME
      00966E CC 96 25         [ 2] 3973         JP     RBRAC
                                   3974 
                           000001  3975 .if PICATOUT_MOD 
                                   3976 ;       I:  ( -- )
                                   3977 ;       Start interrupt service routine definition
                                   3978 ;       those definition have no name.
      009671 96 63                 3979         .word LINK
                           0015F3  3980         LINK=.
      009673 02                    3981         .byte 2 
      009674 49 3A                 3982         .ascii "I:" 
      009676                       3983 ICOLON:
      009676 CD 96 4E         [ 4] 3984         call INITOFS 
      009679 CC 96 25         [ 2] 3985         jp RBRAC  
                                   3986 .endif ; PICATOUT_MOD
                                   3987 
                                   3988 ;       IMMEDIATE       ( -- )
                                   3989 ;       Make last compiled word
                                   3990 ;       an immediate word.
      00967C 96 73                 3991         .word      LINK
                           0015FE  3992 LINK = . 
      00967E 09                    3993         .byte      9
      00967F 49 4D 4D 45 44 49 41  3994         .ascii     "IMMEDIATE"
             54 45
      009688                       3995 IMMED:
      009688 CD 83 43         [ 4] 3996         CALL     DOLIT
      00968B 80 00                 3997         .word     0x8000	;  IMEDD*256
      00968D CD 85 CC         [ 4] 3998         CALL     LAST
      009690 CD 83 CB         [ 4] 3999         CALL     AT
      009693 CD 83 CB         [ 4] 4000         CALL     AT
      009696 CD 84 D2         [ 4] 4001         CALL     ORR
      009699 CD 85 CC         [ 4] 4002         CALL     LAST
      00969C CD 83 CB         [ 4] 4003         CALL     AT
      00969F CC 83 B4         [ 2] 4004         JP     STORE
                                   4005 
                                   4006 ;; Defining words
                                   4007 
                                   4008 ;       CREATE  ( -- ; <string> )
                                   4009 ;       Compile a new array
                                   4010 ;       without allocating space.
      0096A2 96 7E                 4011         .word      LINK
                           001624  4012 LINK = . 
      0096A4 06                    4013         .byte      6
      0096A5 43 52 45 41 54 45     4014         .ascii     "CREATE"
      0096AB                       4015 CREAT:
      0096AB CD 90 0B         [ 4] 4016         CALL     TOKEN
      0096AE CD 95 44         [ 4] 4017         CALL     SNAME
      0096B1 CD 95 C5         [ 4] 4018         CALL     OVERT        
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      0096B4 CD 93 96         [ 4] 4019         CALL     COMPI 
                           000001  4020 .if PICATOUT_MOD
      0096B7 85 1F                 4021         .word DOVAR 
                           000000  4022 .else
                                   4023         CALL     DOVAR
                                   4024 .endif 
      0096B9 81               [ 4] 4025         RET
                                   4026 
                                   4027 ;       VARIABLE        ( -- ; <string> )
                                   4028 ;       Compile a new variable
                                   4029 ;       initialized to 0.
      0096BA 96 A4                 4030         .word      LINK
                           00163C  4031 LINK = . 
      0096BC 08                    4032         .byte      8
      0096BD 56 41 52 49 41 42 4C  4033         .ascii     "VARIABLE"
             45
      0096C5                       4034 VARIA:
                           000001  4035 .if PICATOUT_MOD
                                   4036 ; indirect variable so that VARIABLE definition can be compiled in FLASH 
      0096C5 CD 8A 80         [ 4] 4037         CALL HERE
      0096C8 CD 84 72         [ 4] 4038         CALL DUPP 
      0096CB CD 88 FC         [ 4] 4039         CALL CELLP
      0096CE CD 85 AE         [ 4] 4040         CALL VPP 
      0096D1 CD 83 B4         [ 4] 4041         CALL STORE
      0096D4 CD 99 F1         [ 4] 4042         call UPDATVP 
                                   4043 .endif         
      0096D7 CD 96 AB         [ 4] 4044         CALL CREAT
      0096DA CD 84 72         [ 4] 4045         CALL DUPP
      0096DD CD 93 51         [ 4] 4046         CALL COMMA
      0096E0 CD 89 93         [ 4] 4047         CALL ZERO
                           000001  4048 .if PICATOUT_MOD 
      0096E3 CD 84 82         [ 4] 4049         call SWAPP 
      0096E6 CD 83 B4         [ 4] 4050         CALL STORE 
      0096E9 CD 9E BD         [ 4] 4051         CALL FMOVE ; move definition to FLASH
      0096EC CD 9F 42         [ 4] 4052         CALL UPDATPTR
      0096EF 81               [ 4] 4053         RET 
                                   4054 .endif ;PICATOUT_MOD        
                                   4055 
                           000001  4056 .if PICATOUT_MOD
                                   4057 ;       CONSTANT  ( n -- ; <string> )
                                   4058 ;       Compile a new constant 
                                   4059 ;       n CONSTANT name 
      0096F0 96 BC                 4060         .word LINK 
                           001672  4061         LINK=. 
      0096F2 08                    4062         .byte 8 
      0096F3 43 4F 4E 53 54 41 4E  4063         .ascii "CONSTANT" 
             54
      0096FB                       4064 CONSTANT:          
      0096FB CD 90 0B         [ 4] 4065         CALL TOKEN
      0096FE CD 95 44         [ 4] 4066         CALL SNAME 
      009701 CD 95 C5         [ 4] 4067         CALL OVERT 
      009704 CD 93 96         [ 4] 4068         CALL COMPI 
                           000001  4069 .if PICATOUT_MOD
      009707 97 1D                 4070         .word DOCONST
                           000000  4071 .else
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



                                   4072         CALL DOCONST
                                   4073 .endif 
      009709 CD 93 51         [ 4] 4074         CALL COMMA 
      00970C CD 9E BD         [ 4] 4075         CALL FMOVE
      00970F CD 9F 42         [ 4] 4076         CALL UPDATPTR  
      009712 81               [ 4] 4077         RET          
                                   4078 
                                   4079 ; CONSTANT runtime semantic 
                                   4080 ; doCONST  ( -- n )
      009713 96 F2                 4081         .word LINK 
                           001695  4082         LINK=.
      009715 07                    4083         .byte 7
      009716 44 4F 43 4F 4E 53 54  4084         .ascii "DOCONST"
      00971D                       4085 DOCONST:
      00971D 1D 00 02         [ 2] 4086         subw x,#CELLL
      009720 90 85            [ 2] 4087         popw y 
      009722 90 FE            [ 2] 4088         ldw y,(y) 
      009724 FF               [ 2] 4089         ldw (x),y 
      009725 81               [ 4] 4090         ret 
                                   4091 .endif ;PICATOUT_MOD
                                   4092 
                                   4093 
                                   4094 ;; Tools
                                   4095 
                                   4096 ;       _TYPE   ( b u -- )
                                   4097 ;       Display a string. Filter
                                   4098 ;       non-printing characters.
      009726 97 15                 4099         .word      LINK
                           0016A8  4100 LINK = . 
      009728 05                    4101         .byte      5
      009729 5F 54 59 50 45        4102         .ascii     "_TYPE"
      00972E                       4103 UTYPE:
      00972E CD 84 3B         [ 4] 4104         CALL     TOR     ;start count down loop
      009731 20 0F            [ 2] 4105         JRA     UTYP2   ;skip first pass
      009733 CD 84 72         [ 4] 4106 UTYP1:  CALL     DUPP
      009736 CD 83 E9         [ 4] 4107         CALL     CAT
      009739 CD 89 BD         [ 4] 4108         CALL     TCHAR
      00973C CD 83 2D         [ 4] 4109         CALL     EMIT    ;display only printable
      00973F CD 89 27         [ 4] 4110         CALL     ONEP    ;increment address
      009742 CD 83 57         [ 4] 4111 UTYP2:  CALL     DONXT
      009745 97 33                 4112         .word      UTYP1   ;loop till done
      009747 CC 84 68         [ 2] 4113         JP     DROP
                                   4114 
                                   4115 ;       dm+     ( a u -- a )
                                   4116 ;       Dump u bytes from ,
                                   4117 ;       leaving a+u on  stack.
      00974A 97 28                 4118         .word      LINK
                           0016CC  4119 LINK = . 
      00974C 03                    4120         .byte      3
      00974D 64 6D 2B              4121         .ascii     "dm+"
      009750                       4122 DUMPP:
      009750 CD 84 9C         [ 4] 4123         CALL     OVER
      009753 CD 83 43         [ 4] 4124         CALL     DOLIT
      009756 00 04                 4125         .word      4
      009758 CD 8E 61         [ 4] 4126         CALL     UDOTR   ;display address
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



      00975B CD 8D B1         [ 4] 4127         CALL     SPACE
      00975E CD 84 3B         [ 4] 4128         CALL     TOR     ;start count down loop
      009761 20 11            [ 2] 4129         JRA     PDUM2   ;skip first pass
      009763 CD 84 72         [ 4] 4130 PDUM1:  CALL     DUPP
      009766 CD 83 E9         [ 4] 4131         CALL     CAT
      009769 CD 83 43         [ 4] 4132         CALL     DOLIT
      00976C 00 03                 4133         .word      3
      00976E CD 8E 61         [ 4] 4134         CALL     UDOTR   ;display numeric data
      009771 CD 89 27         [ 4] 4135         CALL     ONEP    ;increment address
      009774 CD 83 57         [ 4] 4136 PDUM2:  CALL     DONXT
      009777 97 63                 4137         .word      PDUM1   ;loop till done
      009779 81               [ 4] 4138         RET
                                   4139 
                                   4140 ;       DUMP    ( a u -- )
                                   4141 ;       Dump u bytes from a,
                                   4142 ;       in a formatted manner.
      00977A 97 4C                 4143         .word      LINK
                           0016FC  4144 LINK = . 
      00977C 04                    4145         .byte      4
      00977D 44 55 4D 50           4146         .ascii     "DUMP"
      009781                       4147 DUMP:
      009781 CD 85 2F         [ 4] 4148         CALL     BASE
      009784 CD 83 CB         [ 4] 4149         CALL     AT
      009787 CD 84 3B         [ 4] 4150         CALL     TOR
      00978A CD 8C 39         [ 4] 4151         CALL     HEX     ;save radix, set hex
      00978D CD 83 43         [ 4] 4152         CALL     DOLIT
      009790 00 10                 4153         .word      16
      009792 CD 88 4D         [ 4] 4154         CALL     SLASH   ;change count to lines
      009795 CD 84 3B         [ 4] 4155         CALL     TOR     ;start count down loop
      009798 CD 8D F9         [ 4] 4156 DUMP1:  CALL     CR
      00979B CD 83 43         [ 4] 4157         CALL     DOLIT
      00979E 00 10                 4158         .word      16
      0097A0 CD 86 33         [ 4] 4159         CALL     DDUP
      0097A3 CD 97 50         [ 4] 4160         CALL     DUMPP   ;display numeric
      0097A6 CD 86 08         [ 4] 4161         CALL     ROT
      0097A9 CD 86 08         [ 4] 4162         CALL     ROT
      0097AC CD 8D B1         [ 4] 4163         CALL     SPACE
      0097AF CD 8D B1         [ 4] 4164         CALL     SPACE
      0097B2 CD 97 2E         [ 4] 4165         CALL     UTYPE   ;display printable characters
      0097B5 CD 83 57         [ 4] 4166         CALL     DONXT
      0097B8 97 98                 4167         .word      DUMP1   ;loop till done
      0097BA CD 84 68         [ 4] 4168 DUMP3:  CALL     DROP
      0097BD CD 84 1C         [ 4] 4169         CALL     RFROM
      0097C0 CD 85 2F         [ 4] 4170         CALL     BASE
      0097C3 CC 83 B4         [ 2] 4171         JP     STORE   ;restore radix
                                   4172 
                                   4173 ;       .S      ( ... -- ... )
                                   4174 ;        Display  contents of stack.
      0097C6 97 7C                 4175         .word      LINK
                           001748  4176 LINK = . 
      0097C8 02                    4177         .byte      2
      0097C9 2E 53                 4178         .ascii     ".S"
      0097CB                       4179 DOTS:
      0097CB CD 8D F9         [ 4] 4180         CALL     CR
      0097CE CD 89 D6         [ 4] 4181         CALL     DEPTH   ;stack depth
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



      0097D1 CD 84 3B         [ 4] 4182         CALL     TOR     ;start count down loop
      0097D4 20 0C            [ 2] 4183         JRA     DOTS2   ;skip first pass
      0097D6 CD 84 2F         [ 4] 4184 DOTS1:  CALL     RAT
      0097D9 CD 89 27         [ 4] 4185         CALL ONEP
      0097DC CD 89 ED         [ 4] 4186 	CALL     PICK
      0097DF CD 8E 94         [ 4] 4187         CALL     DOT     ;index stack, display contents
      0097E2 CD 83 57         [ 4] 4188 DOTS2:  CALL     DONXT
      0097E5 97 D6                 4189         .word      DOTS1   ;loop till done
      0097E7 CD 8E 38         [ 4] 4190         CALL     DOTQP
      0097EA 05                    4191         .byte      5
      0097EB 20 3C 73 70 20        4192         .ascii     " <sp "
      0097F0 81               [ 4] 4193         RET
                                   4194 
                                   4195 ;       >NAME   ( ca -- na | F )
                                   4196 ;       Convert code address
                                   4197 ;       to a name address.
      0097F1 97 C8                 4198         .word      LINK
                           001773  4199 LINK = . 
      0097F3 05                    4200         .byte      5
      0097F4 3E 4E 41 4D 45        4201         .ascii     ">NAME"
      0097F9                       4202 TNAME:
      0097F9 CD 85 A0         [ 4] 4203         CALL     CNTXT   ;vocabulary link
      0097FC CD 83 CB         [ 4] 4204 TNAM2:  CALL     AT
      0097FF CD 84 72         [ 4] 4205         CALL     DUPP    ;?last word in a vocabulary
      009802 CD 83 76         [ 4] 4206         CALL     QBRAN
      009805 98 20                 4207         .word      TNAM4
      009807 CD 86 33         [ 4] 4208         CALL     DDUP
      00980A CD 90 19         [ 4] 4209         CALL     NAMET
      00980D CD 84 E7         [ 4] 4210         CALL     XORR    ;compare
      009810 CD 83 76         [ 4] 4211         CALL     QBRAN
      009813 98 1A                 4212         .word      TNAM3
      009815 CD 89 0B         [ 4] 4213         CALL     CELLM   ;continue with next word
      009818 20 E2            [ 2] 4214         JRA     TNAM2
      00981A CD 84 82         [ 4] 4215 TNAM3:  CALL     SWAPP
      00981D CC 84 68         [ 2] 4216         JP     DROP
      009820 CD 86 28         [ 4] 4217 TNAM4:  CALL     DDROP
      009823 CC 89 93         [ 2] 4218         JP     ZERO
                                   4219 
                                   4220 ;       .ID     ( na -- )
                                   4221 ;        Display  name at address.
      009826 97 F3                 4222         .word      LINK
                           0017A8  4223 LINK = . 
      009828 03                    4224         .byte      3
      009829 2E 49 44              4225         .ascii     ".ID"
      00982C                       4226 DOTID:
      00982C CD 85 F7         [ 4] 4227         CALL     QDUP    ;if zero no name
      00982F CD 83 76         [ 4] 4228         CALL     QBRAN
      009832 98 42                 4229         .word      DOTI1
      009834 CD 8A 69         [ 4] 4230         CALL     COUNT
      009837 CD 83 43         [ 4] 4231         CALL     DOLIT
      00983A 00 1F                 4232         .word      0x1F
      00983C CD 84 BE         [ 4] 4233         CALL     ANDD    ;mask lexicon bits
      00983F CC 97 2E         [ 2] 4234         JP     UTYPE
      009842 CD 8E 38         [ 4] 4235 DOTI1:  CALL     DOTQP
      009845 09                    4236         .byte      9
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



      009846 20 6E 6F 4E 61 6D 65  4237         .ascii     " noName"
      00984D 81               [ 4] 4238         RET
                                   4239 
                           000000  4240 WANT_SEE=0 
                           000000  4241 .if WANT_SEE 
                                   4242 ;       SEE     ( -- ; <string> )
                                   4243 ;       A simple decompiler.
                                   4244 ;       Updated for byte machines.
                                   4245         .word      LINK
                                   4246 LINK = . 
                                   4247         .byte      3
                                   4248         .ascii     "SEE"
                                   4249 SEE:
                                   4250         CALL     TICK    ;starting address
                                   4251         CALL     CR
                                   4252         CALL     ONEM
                                   4253 SEE1:   CALL     ONEP
                                   4254         CALL     DUPP
                                   4255         CALL     AT
                                   4256         CALL     DUPP    ;?does it contain a zero
                                   4257         CALL     QBRAN
                                   4258         .word    SEE2
                                   4259         CALL     TNAME   ;?is it a name
                                   4260 SEE2:   CALL     QDUP    ;name address or zero
                                   4261         CALL     QBRAN
                                   4262         .word    SEE3
                                   4263         CALL     SPACE
                                   4264         CALL     DOTID   ;display name
                                   4265         CALL     ONEP
                                   4266         JRA      SEE4
                                   4267 SEE3:   CALL     DUPP
                                   4268         CALL     CAT
                                   4269         CALL     UDOT    ;display number
                                   4270 SEE4:   CALL     NUFQ    ;user control
                                   4271         CALL     QBRAN
                                   4272         .word    SEE1
                                   4273         JP     DROP
                                   4274 .endif ; WANT_SEE 
                                   4275 
                                   4276 ;       WORDS   ( -- )
                                   4277 ;       Display names in vocabulary.
      00984E 98 28                 4278         .word      LINK
                           0017D0  4279 LINK = . 
      009850 05                    4280         .byte      5
      009851 57 4F 52 44 53        4281         .ascii     "WORDS"
      009856                       4282 WORDS:
      009856 CD 8D F9         [ 4] 4283         CALL     CR
      009859 CD 85 A0         [ 4] 4284         CALL     CNTXT   ;only in context
      00985C CD 83 CB         [ 4] 4285 WORS1:  CALL     AT
      00985F CD 85 F7         [ 4] 4286         CALL     QDUP    ;?at end of list
      009862 CD 83 76         [ 4] 4287         CALL     QBRAN
      009865 98 7B                 4288         .word      WORS2
      009867 CD 84 72         [ 4] 4289         CALL     DUPP
      00986A CD 8D B1         [ 4] 4290         CALL     SPACE
      00986D CD 98 2C         [ 4] 4291         CALL     DOTID   ;display a name
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



      009870 CD 89 0B         [ 4] 4292         CALL     CELLM
      009873 CD 83 8D         [ 4] 4293         CALL     BRAN
      009876 98 5C                 4294         .word      WORS1
      009878 CD 84 68         [ 4] 4295         CALL     DROP
      00987B 81               [ 4] 4296 WORS2:  RET
                                   4297 
                                   4298         
                                   4299 ;; Hardware reset
                                   4300 
                                   4301 ;       hi      ( -- )
                                   4302 ;       Display sign-on message.
      00987C 98 50                 4303         .word      LINK
                           0017FE  4304 LINK = . 
      00987E 02                    4305         .byte      2
      00987F 68 69                 4306         .ascii     "hi"
      009881                       4307 HI:
      009881 CD 8D F9         [ 4] 4308         CALL     CR
      009884 CD 8E 38         [ 4] 4309         CALL     DOTQP   ;initialize I/O
      009887 0F                    4310         .byte      15
      009888 73 74 6D 38 65 46 6F  4311         .ascii     "stm8eForth v"
             72 74 68 20 76
      009894 33                    4312 	.byte      VER+'0'
      009895 2E                    4313         .byte      '.' 
      009896 30                    4314 	.byte      EXT+'0' ;version
      009897 CC 8D F9         [ 2] 4315         JP     CR
                                   4316 
                           000000  4317 WANT_DEBUG=0
                           000000  4318 .if WANT_DEBUG 
                                   4319 ;       DEBUG      ( -- )
                                   4320 ;       Display sign-on message.
                                   4321 ;        .word      LINK
                                   4322 LINK = . 
                                   4323         .byte      5
                                   4324         .ascii     "DEBUG"
                                   4325 DEBUG:
                                   4326 	CALL DOLIT
                                   4327 	.word 0x65
                                   4328 	CALL EMIT
                                   4329 	CALL DOLIT
                                   4330 	.word 0
                                   4331  	CALL ZLESS 
                                   4332 	CALL DOLIT
                                   4333 	.word 0xFFFE
                                   4334 	CALL ZLESS 
                                   4335 	CALL UPLUS 
                                   4336  	CALL DROP 
                                   4337 	CALL DOLIT
                                   4338 	.word 3
                                   4339 	CALL UPLUS 
                                   4340 	CALL UPLUS 
                                   4341  	CALL DROP
                                   4342 	CALL DOLIT
                                   4343 	.word 0x43
                                   4344 	CALL UPLUS 
                                   4345  	CALL DROP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



                                   4346 	CALL EMIT
                                   4347 	CALL DOLIT
                                   4348 	.word 0x4F
                                   4349 	CALL DOLIT
                                   4350 	.word 0x6F
                                   4351  	CALL XORR
                                   4352 	CALL DOLIT
                                   4353 	.word 0xF0
                                   4354  	CALL ANDD
                                   4355 	CALL DOLIT
                                   4356 	.word 0x4F
                                   4357  	CALL ORR
                                   4358 	CALL EMIT
                                   4359 	CALL DOLIT
                                   4360 	.word 8
                                   4361 	CALL DOLIT
                                   4362 	.word 6
                                   4363  	CALL SWAPP
                                   4364 	CALL OVER
                                   4365 	CALL XORR
                                   4366 	CALL DOLIT
                                   4367 	.word 3
                                   4368 	CALL ANDD 
                                   4369 	CALL ANDD
                                   4370 	CALL DOLIT
                                   4371 	.word 0x70
                                   4372 	CALL UPLUS 
                                   4373 	CALL DROP
                                   4374 	CALL EMIT
                                   4375 	CALL DOLIT
                                   4376 	.word 0
                                   4377 	CALL QBRAN
                                   4378 	.word DEBUG1
                                   4379 	CALL DOLIT
                                   4380 	.word 0x3F
                                   4381 DEBUG1:
                                   4382 	CALL DOLIT
                                   4383 	.word 0xFFFF
                                   4384 	CALL QBRAN
                                   4385 	.word DEBUG2
                                   4386 	CALL DOLIT
                                   4387 	.word 0x74
                                   4388 	CALL BRAN
                                   4389 	.word DEBUG3
                                   4390 DEBUG2:
                                   4391 	CALL DOLIT
                                   4392 	.word 0x21
                                   4393 DEBUG3:
                                   4394 	CALL EMIT
                                   4395 	CALL DOLIT
                                   4396 	.word 0x68
                                   4397 	CALL DOLIT
                                   4398 	.word 0x80
                                   4399 	CALL STORE
                                   4400 	CALL DOLIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



                                   4401 	.word 0x80
                                   4402 	CALL AT
                                   4403 	CALL EMIT
                                   4404 	CALL DOLIT
                                   4405 	.word 0x4D
                                   4406 	CALL TOR
                                   4407 	CALL RAT
                                   4408 	CALL RFROM
                                   4409 	CALL ANDD
                                   4410 	CALL EMIT
                                   4411 	CALL DOLIT
                                   4412 	.word 0x61
                                   4413 	CALL DOLIT
                                   4414 	.word 0xA
                                   4415 	CALL TOR
                                   4416 DEBUG4:
                                   4417 	CALL DOLIT
                                   4418 	.word 1
                                   4419 	CALL UPLUS 
                                   4420 	CALL DROP
                                   4421 	CALL DONXT
                                   4422 	.word DEBUG4
                                   4423 	CALL EMIT
                                   4424 	CALL DOLIT
                                   4425 	.word 0x656D
                                   4426 	CALL DOLIT
                                   4427 	.word 0x100
                                   4428 	CALL UMSTA
                                   4429 	CALL SWAPP
                                   4430 	CALL DOLIT
                                   4431 	.word 0x100
                                   4432 	CALL UMSTA
                                   4433 	CALL SWAPP 
                                   4434 	CALL DROP
                                   4435 	CALL EMIT
                                   4436 	CALL EMIT
                                   4437 	CALL DOLIT
                                   4438 	.word 0x2043
                                   4439 	CALL DOLIT
                                   4440 	.word 0
                                   4441 	CALL DOLIT
                                   4442 	.word 0x100
                                   4443 	CALL UMMOD
                                   4444 	CALL EMIT
                                   4445 	CALL EMIT
                                   4446 	;JP ORIG
                                   4447 	RET
                                   4448 .endif ; WANT_DEBUG 
                                   4449 
                                   4450 
                                   4451 ;       'BOOT   ( -- a )
                                   4452 ;       The application startup vector.
      00989A 98 7E                 4453         .word      LINK
                           00181C  4454 LINK = . 
      00989C 05                    4455         .byte      5
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



      00989D 27 42 4F 4F 54        4456         .ascii     "'BOOT"
      0098A2                       4457 TBOOT:
      0098A2 CD 85 1F         [ 4] 4458         CALL     DOVAR
      0098A5 40 02                 4459         .word    APP_RUN      ;application to boot
                                   4460 
                                   4461 ;       COLD    ( -- )
                                   4462 ;       The hilevel cold start s=ence.
      0098A7 98 9C                 4463         .word      LINK
                           001829  4464         LINK = . 
      0098A9 04                    4465         .byte      4
      0098AA 43 4F 4C 44           4466         .ascii     "COLD"
      0098AE                       4467 COLD:
                           000000  4468 .if WANT_DEBUG
                                   4469         CALL DEBUG
                                   4470 .endif 
      0098AE CD 83 43         [ 4] 4471 COLD1:  CALL     DOLIT
      0098B1 80 A7                 4472         .word      UZERO
      0098B3 CD 83 43         [ 4] 4473 	CALL     DOLIT
      0098B6 00 06                 4474         .word      UPP
      0098B8 CD 83 43         [ 4] 4475         CALL     DOLIT
      0098BB 00 16                 4476 	.word      UEND-UZERO
      0098BD CD 8A CD         [ 4] 4477         CALL     CMOVE   ;initialize user area
                                   4478 
                           000001  4479 .if PICATOUT_MOD
                                   4480 ; if APP_RUN==0 initialize with ca de 'hi'  
      0098C0 90 CE 40 02      [ 2] 4481         ldw y,APP_RUN 
      0098C4 26 0B            [ 1] 4482         jrne 0$
      0098C6 1D 00 02         [ 2] 4483         subw x,#CELLL 
      0098C9 90 AE 98 81      [ 2] 4484         ldw y,#HI  
      0098CD FF               [ 2] 4485         ldw (x),y
      0098CE CD 99 C9         [ 4] 4486         call UPDATRUN 
      0098D1                       4487 0$:        
                                   4488 ; update LAST with APP_LAST 
                                   4489 ; if APP_LAST > LAST else do the opposite
      0098D1 90 CE 40 00      [ 2] 4490         ldw y,APP_LAST 
      0098D5 90 B3 1A         [ 2] 4491         cpw y,ULAST 
      0098D8 22 05            [ 1] 4492         jrugt 1$ 
                                   4493 ; save LAST at APP_LAST  
      0098DA CD 99 B1         [ 4] 4494         call UPDATLAST 
      0098DD 20 06            [ 2] 4495         jra 2$
      0098DF                       4496 1$: ; update LAST with APP_LAST 
      0098DF 90 BF 1A         [ 2] 4497         ldw ULAST,y
      0098E2 90 BF 14         [ 2] 4498         ldw UCNTXT,y 
      0098E5                       4499 2$:  
                                   4500 ; update APP_CP if < app_space 
      0098E5 90 CE 40 04      [ 2] 4501         ldw y,APP_CP  
      0098E9 90 B3 18         [ 2] 4502         cpw y,UCP   
      0098EC 24 06            [ 1] 4503         jruge 3$ 
      0098EE CD 99 DA         [ 4] 4504         call UPDATCP
      0098F1 90 BE 18         [ 2] 4505         ldw y,UCP   
      0098F4                       4506 3$:
      0098F4 90 BF 18         [ 2] 4507         ldw UCP,y                 
                                   4508 ; update UVP with APP_VP  
                                   4509 ; if APP_VP>UVP else do the opposite 
      0098F7 90 CE 40 06      [ 2] 4510         ldw y,APP_VP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



      0098FB 90 B3 16         [ 2] 4511         cpw y,UVP 
      0098FE 22 05            [ 1] 4512         jrugt 4$
      009900 CD 99 F1         [ 4] 4513         call UPDATVP 
      009903 20 03            [ 2] 4514         jra 6$
      009905                       4515 4$: ; update UVP with APP_VP 
      009905 90 BF 16         [ 2] 4516         ldw UVP,y 
      009908                       4517 6$:      
                                   4518 .endif ; PICATOUT_MOD
      009908 CD 92 FC         [ 4] 4519         CALL     PRESE   ;initialize data stack and TIB
      00990B CD 98 A2         [ 4] 4520         CALL     TBOOT
      00990E CD 8A B6         [ 4] 4521         CALL     ATEXE   ;application boot
      009911 CD 95 C5         [ 4] 4522         CALL     OVERT
      009914 CC 93 19         [ 2] 4523         JP     QUIT    ;start interpretation
                                   4524 
                           000001  4525 .if PICATOUT_MOD
                                   4526         ; keep this include at end 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



                                   4527         .include "flash.asm"
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
      009917 98 A9                   30     .word LINK 
                           001899    31     LINK=.
      009919 03                      32     .byte 3 
      00991A 46 50 21                33     .ascii "FP!"
      00991D                         34 fptr_store:
      00991D 90 93            [ 1]   35     ldw y,x
      00991F 90 FE            [ 2]   36     ldw y,(y)
      009921 90 9F            [ 1]   37     ld a,yl 
      009923 B7 2E            [ 1]   38     ld FPTR,a 
      009925 1C 00 02         [ 2]   39     addw x,#CELLL 
      009928 90 93            [ 1]   40     ldw y,x 
      00992A 90 FE            [ 2]   41     ldw y,(y)
      00992C 90 BF 2F         [ 2]   42     ldw PTR16,y
      00992F 1C 00 02         [ 2]   43     addw x,#CELLL 
      009932 81               [ 4]   44     ret 
                                     45 
                                     46 ;-----------------------------------
                                     47 ; return EEPROM base address 
                                     48 ; as a double 
                                     49 ;  EEPROM  ( -- ud )
                                     50 ;-----------------------------------
      009933 99 19                   51     .word LINK 
                           0018B5    52 LINK=.
      009935 06                      53     .byte 6 
      009936 45 45 50 52 4F 4D       54     .ascii "EEPROM"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      00993C                         55 EEPROM: 
      00993C 90 AE 40 00      [ 2]   56     ldw y,#EEPROM_BASE
      009940 1D 00 04         [ 2]   57     subw x,#2*CELLL 
      009943 EF 02            [ 2]   58     ldw (2,x),y 
      009945 90 5F            [ 1]   59     clrw y 
      009947 FF               [ 2]   60     ldw (x),y 
      009948 81               [ 4]   61     ret
                                     62 
                                     63 ;---------------------------------
                                     64 ; return APP_LAST pointer as double
                                     65 ; EEP-LAST ( -- ud )
                                     66 ;---------------------------------
      009949 99 35                   67 	.word LINK 
                           0018CB    68 	LINK=.
      00994B 08                      69 	.byte 8 
      00994C 45 45 50 2D 4C 41 53    70 	.ascii "EEP-LAST"
             54
      009954                         71 EEPLAST:
      009954 1D 00 04         [ 2]   72 	subw x,#2*CELLL 
      009957 90 AE 40 00      [ 2]   73 	ldw y,#APP_LAST 
      00995B EF 02            [ 2]   74 	ldw (2,x),y 
      00995D 90 5F            [ 1]   75 	clrw y 
      00995F FF               [ 2]   76 	ldw (x),y 
      009960 81               [ 4]   77 	ret 
                                     78 
                                     79 ;----------------------------------
                                     80 ; return APP_RUN pointer as double	
                                     81 ; EEP-RUN ( -- ud )
                                     82 ;-----------------------------------
      009961 99 4B                   83 	.word LINK 
                           0018E3    84 	LINK=.
      009963 07                      85 	.byte 7
      009964 45 45 50 2D 52 55 4E    86 	.ascii "EEP-RUN"
      00996B                         87 EEPRUN:
      00996B 1D 00 04         [ 2]   88 	subw x,#2*CELLL 
      00996E 90 AE 40 02      [ 2]   89 	ldw y,#APP_RUN 
      009972 EF 02            [ 2]   90 	ldw (2,x),y 
      009974 90 5F            [ 1]   91 	clrw y 
      009976 FF               [ 2]   92 	ldw (x),y 
      009977 81               [ 4]   93 	ret 
                                     94 
                                     95 ;------------------------------------
                                     96 ; return APP_CP pointer as double 
                                     97 ; EEP-CP ( -- ud )
                                     98 ;------------------------------------
      009978 99 63                   99 	.word LINK
                           0018FA   100 	LINK=.
      00997A 06                     101 	.byte 6 
      00997B 45 45 50 2D 43 50      102 	.ascii "EEP-CP"
      009981                        103 EEPCP:
      009981 1D 00 04         [ 2]  104 	subw x,#2*CELLL 
      009984 90 AE 40 04      [ 2]  105 	ldw y,#APP_CP  
      009988 EF 02            [ 2]  106 	ldw (2,x),y 
      00998A 90 5F            [ 1]  107 	clrw y 
      00998C FF               [ 2]  108 	ldw (x),y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



      00998D 81               [ 4]  109 	ret 
                                    110 
                                    111 ;------------------------------------
                                    112 ; return APP_VP pointer as double 
                                    113 ; EEP-VP ( -- ud )
                                    114 ;-------------------------------------
      00998E 99 7A                  115 	.word LINK
                           001910   116 	LINK=.
      009990 06                     117 	.byte 6
      009991 45 45 50 2D 56 50      118 	.ascii "EEP-VP"
      009997                        119 EEPVP:
      009997 1D 00 04         [ 2]  120 	subw x,#2*CELLL 
      00999A 90 AE 40 06      [ 2]  121 	ldw y,#APP_VP  
      00999E EF 02            [ 2]  122 	ldw (2,x),y 
      0099A0 90 5F            [ 1]  123 	clrw y 
      0099A2 FF               [ 2]  124 	ldw (x),y 
      0099A3 81               [ 4]  125 	ret 
                                    126 
                                    127 ;----------------------------------
                                    128 ; update APP_LAST with LAST 
                                    129 ; UPDAT-LAST ( -- )
                                    130 ;----------------------------------
      0099A4 99 90                  131 	.word LINK 
                           001926   132 	LINK=.
      0099A6 0A                     133 	.byte 10
      0099A7 55 50 44 41 54 2D 4C   134 	.ascii "UPDAT-LAST"
             41 53 54
      0099B1                        135 UPDATLAST:
      0099B1 CD 85 CC         [ 4]  136 	call LAST
      0099B4 CD 83 CB         [ 4]  137 	call AT  
      0099B7 CD 99 54         [ 4]  138 	call EEPLAST
      0099BA CC 9B 2D         [ 2]  139 	jp ee_store 
                                    140 
                                    141 ;---------------------------------
                                    142 ; update APP_RUN 
                                    143 ; UPDAT-RUN ( a -- )
                                    144 ;---------------------------------
      0099BD 99 A6                  145 	.word LINK
                           00193F   146 	LINK=.
      0099BF 09                     147 	.byte 9
      0099C0 55 50 44 41 54 2D 52   148 	.ascii "UPDAT-RUN"
             55 4E
      0099C9                        149 UPDATRUN:
      0099C9 CD 99 6B         [ 4]  150 	call EEPRUN
      0099CC CC 9B 2D         [ 2]  151 	jp ee_store 
                                    152 	
                                    153 ;---------------------------------
                                    154 ; update APP_CP with CP 
                                    155 ; UPDAT-CP ( -- )
                                    156 ;---------------------------------
      0099CF 99 BF                  157 	.word LINK 
                           001951   158 	LINK=.
      0099D1 08                     159 	.byte 8 
      0099D2 55 50 44 41 54 2D 43   160 	.ascii "UPDAT-CP"
             50
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



      0099DA                        161 UPDATCP:
      0099DA CD 85 BC         [ 4]  162 	call CPP 
      0099DD CD 83 CB         [ 4]  163 	call AT 
      0099E0 CD 99 81         [ 4]  164 	call EEPCP 
      0099E3 CC 9B 2D         [ 2]  165 	jp ee_store 
                                    166 
                                    167 ;----------------------------------
                                    168 ; update APP_VP with VP 
                                    169 ; UPDAT-VP ( -- )
                                    170 ;----------------------------------
      0099E6 99 D1                  171 	.word LINK
                           001968   172 	LINK=.
      0099E8 08                     173 	.byte 8 
      0099E9 55 50 44 41 54 2D 56   174 	.ascii "UPDAT-VP" 
             50
      0099F1                        175 UPDATVP:
      0099F1 CD 85 AE         [ 4]  176 	call VPP 
      0099F4 CD 83 CB         [ 4]  177 	call AT
      0099F7 CD 99 97         [ 4]  178 	call EEPVP 
      0099FA CC 9B 2D         [ 2]  179 	jp ee_store
                                    180 	
                                    181 
                                    182 ;----------------------------------
                                    183 ; fetch integer at address over 65535
                                    184 ;  F@   ( ud -- n )
                                    185 ;----------------------------------
      0099FD 99 E8                  186     .word LINK 
                           00197F   187 LINK=.
      0099FF 02                     188     .byte 2
      009A00 46 40                  189     .ascii "F@"
      009A02                        190 farat:
      009A02 CD 99 1D         [ 4]  191     call fptr_store
      009A05 92 BC 00 2E      [ 5]  192     ldf a,[FPTR]
      009A09 1D 00 02         [ 2]  193     subw x,#CELLL 
      009A0C F7               [ 1]  194     ld (x),a 
      009A0D 90 AE 00 01      [ 2]  195     ldw y,#1
      009A11 91 AF 00 2E      [ 1]  196     ldf a,([FPTR],y)
      009A15 E7 01            [ 1]  197     ld (1,x),a
      009A17 81               [ 4]  198     ret 
                                    199 
                                    200 ;-------------------------------------
                                    201 ; fetch C at address over 65535 
                                    202 ; FC@ ( ud -- c)
                                    203 ;-------------------------------------
      009A18 99 FF                  204     .word LINK
                           00199A   205     LINK=.
      009A1A 03                     206     .byte 3 
      009A1B 46 43 40               207     .ascii "FC@" 
      009A1E                        208 farcat:
      009A1E CD 99 1D         [ 4]  209     call fptr_store 
      009A21 92 BC 00 2E      [ 5]  210     ldf a,[FPTR]
      009A25 1D 00 02         [ 2]  211     subw x,#CELLL 
      009A28 E7 01            [ 1]  212     ld (1,x),a 
      009A2A 7F               [ 1]  213     clr (x)
      009A2B 81               [ 4]  214     ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



                                    215     
                                    216 ;----------------------------------
                                    217 ; unlock EEPROM/OPT for writing/erasing
                                    218 ; wait endlessly for FLASH_IAPSR_DUL bit.
                                    219 ;  UNLKEE   ( -- )
                                    220 ;----------------------------------
      009A2C 9A 1A                  221     .word LINK 
                           0019AE   222 LINK=.
      009A2E 06                     223     .byte 6 
      009A2F 55 4E 4C 4B 45 45      224     .ascii "UNLKEE"
      009A35                        225 unlock_eeprom:
      009A35 35 00 50 5B      [ 1]  226 	mov FLASH_CR2,#0 
      009A39 35 FF 50 5C      [ 1]  227 	mov FLASH_NCR2,#0xFF 
      009A3D 35 AE 50 64      [ 1]  228 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      009A41 35 56 50 64      [ 1]  229     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      009A45 72 07 50 5F FB   [ 2]  230 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      009A4A 81               [ 4]  231 	ret
                                    232 
                                    233 ;----------------------------------
                                    234 ; unlock FLASH for writing/erasing
                                    235 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                    236 ; UNLKFL  ( -- )
                                    237 ;----------------------------------
      009A4B 9A 2E                  238     .word LINK 
                           0019CD   239 LINK=. 
      009A4D 06                     240     .byte 6 
      009A4E 55 4E 4C 4B 46 4C      241     .ascii "UNLKFL"    
      009A54                        242 unlock_flash:
      009A54 35 00 50 5B      [ 1]  243 	mov FLASH_CR2,#0 
      009A58 35 FF 50 5C      [ 1]  244 	mov FLASH_NCR2,#0xFF 
      009A5C 35 56 50 62      [ 1]  245 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      009A60 35 AE 50 62      [ 1]  246 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      009A64 72 03 50 5F FB   [ 2]  247 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      009A69 81               [ 4]  248 	ret
                                    249 
                                    250 ;-----------------------------
                                    251 ; unlock FLASH or EEPROM 
                                    252 ; according to FPTR address 
                                    253 ;  UNLOCK ( -- )
                                    254 ;-----------------------------
      009A6A 9A 4D                  255 	.word LINK 
                           0019EC   256 	LINK=.
      009A6C 06                     257 	.byte 6
      009A6D 55 4E 4C 4F 43 4B      258 	.ascii "UNLOCK"
      009A73                        259 unlock:
                                    260 ; put addr[15:0] in Y, for bounds check.
      009A73 90 BE 2F         [ 2]  261 	ldw y,PTR16   ; Y=addr15:0
                                    262 ; check addr[23:16], if <> 0 then it is extened flash memory
      009A76 3D 2E            [ 1]  263 	tnz FPTR 
      009A78 26 16            [ 1]  264 	jrne 4$
      009A7A 90 A3 80 00      [ 2]  265     cpw y,#FLASH_BASE
      009A7E 24 10            [ 1]  266     jruge 4$
      009A80 90 A3 40 00      [ 2]  267 	cpw y,#EEPROM_BASE  
      009A84 25 0D            [ 1]  268     jrult 9$
      009A86 90 A3 48 7F      [ 2]  269 	cpw y,#OPTION_END 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      009A8A 22 07            [ 1]  270 	jrugt 9$
      009A8C CD 9A 35         [ 4]  271 	call unlock_eeprom
      009A8F 81               [ 4]  272 	ret 
      009A90 CD 9A 54         [ 4]  273 4$: call unlock_flash
      009A93 81               [ 4]  274 9$: ret 
                                    275 
                                    276 ;-------------------------
                                    277 ; lock write access to 
                                    278 ; FLASH and EEPROM 
                                    279 ; LOCK ( -- )
                                    280 ;-------------------------
      009A94 9A 6C                  281 	.word LINK 
                           001A16   282 	LINK=.
      009A96 04                     283 	.byte 4 
      009A97 4C 4F 43 4B            284 	.ascii "LOCK" 
      009A9B                        285 lock: 
      009A9B 72 13 50 5F      [ 1]  286 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      009A9F 72 17 50 5F      [ 1]  287 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009AA3 81               [ 4]  288 	ret 
                                    289 
                                    290 ;-------------------------
                                    291 ; increment FPTR 
                                    292 ; INC-FPTR ( -- )
                                    293 ;-------------------------
      009AA4 9A 96                  294 	.word LINK 
                           001A26   295 	LINK=. 
      009AA6 08                     296 	.byte 8 
      009AA7 49 4E 43 2D 46 50 54   297 	.ascii "INC-FPTR" 
             52
      009AAF                        298 inc_fptr:
      009AAF 3C 30            [ 1]  299 	inc PTR8 
      009AB1 26 08            [ 1]  300 	jrne 1$
      009AB3 90 BE 2E         [ 2]  301 	ldw y,FPTR 
      009AB6 90 5C            [ 2]  302 	incw y 
      009AB8 90 BF 2E         [ 2]  303 	ldw FPTR,y 
      009ABB 81               [ 4]  304 1$: ret 
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
      009ABC 9A A6                  315 	.word LINK 
                           001A3E   316 	LINK=. 
      009ABE 07                     317 	.byte 7 
      009ABF 57 52 2D 42 59 54 45   318 	.ascii "WR-BYTE" 
                                    319 
      009AC6                        320 write_byte:
      009AC6 90 93            [ 1]  321 	ldw y,x 
      009AC8 90 FE            [ 2]  322 	ldw y,(y)
      009ACA 1C 00 02         [ 2]  323 	addw x,#CELLL 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



      009ACD 90 9F            [ 1]  324 	ld a,yl
      009ACF 92 BD 00 2E      [ 4]  325 	ldf [FPTR],a
      009AD3 72 05 50 5F FB   [ 2]  326 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009AD8 20 D5            [ 2]  327 	jra inc_fptr 
                                    328 
                                    329 
                                    330 
                                    331 ;---------------------------------------
                                    332 ; write a byte to FLASH or EEPROM/OPTION  
                                    333 ; EEC!  (c ud -- )
                                    334 ;---------------------------------------
      009ADA 9A BE                  335     .word LINK 
                           001A5C   336 	LINK=.
      009ADC 04                     337     .byte 4 
      009ADD 45 45 43 21            338     .ascii "EEC!"
                                    339 	; local variables 
                           000001   340 	BTW = 1   ; byte to write offset on stack
                           000002   341     OPT = 2 
                           000002   342 	VSIZE = 2
      009AE1                        343 ee_cstore:
      009AE1 52 02            [ 2]  344 	sub sp,#VSIZE
      009AE3 CD 99 1D         [ 4]  345     call fptr_store
      009AE6 E6 01            [ 1]  346 	ld a,(1,x)
      009AE8 43               [ 1]  347 	cpl a 
      009AE9 6B 01            [ 1]  348 	ld (BTW,sp),a ; byte to write 
      009AEB 0F 02            [ 1]  349 	clr (OPT,sp)  ; OPTION flag
      009AED CD 9A 73         [ 4]  350 	call unlock 
                                    351 	; check if option
      009AF0 3D 2E            [ 1]  352 	tnz FPTR 
      009AF2 26 19            [ 1]  353 	jrne 2$
      009AF4 90 BE 2F         [ 2]  354 	ldw y,PTR16 
      009AF7 90 A3 48 00      [ 2]  355 	cpw y,#OPTION_BASE
      009AFB 2B 10            [ 1]  356 	jrmi 2$
      009AFD 90 A3 48 80      [ 2]  357 	cpw y,#OPTION_END+1
      009B01 2A 0A            [ 1]  358 	jrpl 2$
      009B03 03 02            [ 1]  359 	cpl (OPT,sp)
                                    360 	; OPTION WRITE require this unlock 
      009B05 72 1E 50 5B      [ 1]  361     bset FLASH_CR2,#FLASH_CR2_OPT
      009B09 72 1F 50 5C      [ 1]  362     bres FLASH_NCR2,#FLASH_CR2_OPT 
      009B0D                        363 2$: 
      009B0D CD 9A C6         [ 4]  364 	call write_byte 	
      009B10 0D 02            [ 1]  365 	tnz (OPT,sp)
      009B12 27 0D            [ 1]  366 	jreq 3$ 
      009B14 7B 01            [ 1]  367     ld a,(BTW,sp)
      009B16 90 5F            [ 1]  368     clrw y
      009B18 90 97            [ 1]  369 	ld yl,a 
      009B1A 1D 00 02         [ 2]  370 	subw x,#CELLL 
      009B1D FF               [ 2]  371 	ldw (x),y 
      009B1E CD 9A C6         [ 4]  372 	call write_byte
      009B21                        373 3$: 
      009B21 CD 9A 9B         [ 4]  374 	call lock 
      009B24 5B 02            [ 2]  375 	addw sp,#VSIZE 
      009B26 81               [ 4]  376     ret
                                    377 
                                    378 ;------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



                                    379 ; write integer in FLASH|EEPROM
                                    380 ; EE! ( n ud -- )
                                    381 ;------------------------------
      009B27 9A DC                  382 	.word LINK 
                           001AA9   383 	LINK=.
      009B29 03                     384 	.byte 3 
      009B2A 45 45 21               385 	.ascii "EE!"
      009B2D                        386 ee_store:
      009B2D CD 99 1D         [ 4]  387 	call fptr_store 
      009B30 CD 9A 73         [ 4]  388 	call unlock 
      009B33 90 93            [ 1]  389 	ldw y,x 
      009B35 90 FE            [ 2]  390 	ldw y,(y)
      009B37 90 89            [ 2]  391 	pushw y 
      009B39 90 5E            [ 1]  392 	swapw y 
      009B3B FF               [ 2]  393 	ldw (x),y 
      009B3C CD 9A C6         [ 4]  394 	call write_byte 
      009B3F 90 85            [ 2]  395 	popw y 
      009B41 1D 00 02         [ 2]  396 	subw x,#CELLL
      009B44 FF               [ 2]  397 	ldw (x),y 
      009B45 CD 9A C6         [ 4]  398 	call write_byte
      009B48 CC 9A 9B         [ 2]  399 	jp lock 
                                    400 
                                    401 
                                    402 ;----------------------------
                                    403 ; Erase flash memory row 
                                    404 ; stm8s208 as 128 bytes rows
                                    405 ; ROW-ERASE ( ud -- )
                                    406 ;----------------------------
      009B4B 9B 29                  407 	.word LINK 
                           001ACD   408 	LINK=. 
      009B4D 09                     409 	.byte 9 
      009B4E 52 4F 57 2D 45 52 41   410 	.ascii "ROW-ERASE" 
             53 45
      009B57                        411 row_erase:
      009B57 CD 99 1D         [ 4]  412 	call fptr_store
                                    413 ;code must be execute from RAM 
                                    414 ;copy routine to PAD 
      009B5A 1D 00 02         [ 2]  415 	subw x,#CELLL 
      009B5D 90 AE 9B A4      [ 2]  416 	ldw y,#row_erase_proc
      009B61 FF               [ 2]  417 	ldw (x),y 
      009B62 CD 8A 91         [ 4]  418 	call PAD 
      009B65 90 AE 9B CB      [ 2]  419 	ldw y,#row_erase_proc_end 
      009B69 72 A2 9B A4      [ 2]  420 	subw y,#row_erase_proc
      009B6D 1D 00 02         [ 2]  421 	subw x,#CELLL 
      009B70 FF               [ 2]  422 	ldw (x),y 
      009B71 CD 8A CD         [ 4]  423 	call CMOVE 
      009B74                        424 block_erase:
      009B74 90 BE 2F         [ 2]  425 	ldw y,FPTR+1
      009B77 90 A3 A0 00      [ 2]  426 	cpw y,#app_space 
      009B7B 2A 13            [ 1]  427 	jrpl erase_flash 
                                    428 ; erase EEPROM block
      009B7D 90 A3 40 00      [ 2]  429 	cpw y,#EEPROM_BASE 
      009B81 24 01            [ 1]  430 	jruge 1$
      009B83 81               [ 4]  431 	ret ; bad address 
      009B84 90 A3 47 FF      [ 2]  432 1$: cpw y,#EEPROM_END 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      009B88 23 01            [ 2]  433 	jrule 2$ 
      009B8A 81               [ 4]  434 	ret ; bad address 
      009B8B                        435 2$:	
      009B8B CD 9A 35         [ 4]  436 	call unlock_eeprom 
      009B8E 20 03            [ 2]  437 	jra proceed_erase
                                    438 ; erase flash block:
      009B90                        439 erase_flash:
      009B90 CD 9A 54         [ 4]  440 	call unlock_flash 
      009B93                        441 proceed_erase:
      009B93 CD 8A 91         [ 4]  442 	call PAD 
      009B96 90 93            [ 1]  443 	ldw y,x
      009B98 90 FE            [ 2]  444 	ldw y,(y)
      009B9A 1C 00 02         [ 2]  445 	addw x,#CELLL  
      009B9D 90 FD            [ 4]  446 	call (y) 
      009B9F 72 17 50 5F      [ 1]  447 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009BA3 81               [ 4]  448 	ret 
                                    449 
                                    450 ; this routine is to be copied to PAD 
      009BA4                        451 row_erase_proc:
      009BA4 35 20 50 5B      [ 1]  452 	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
      009BA8 35 DF 50 5C      [ 1]  453 	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
      009BAC 4F               [ 1]  454 	clr a 
      009BAD 90 5F            [ 1]  455 	clrw y 
      009BAF 91 A7 00 2E      [ 1]  456 	ldf ([FPTR],y),a
      009BB3 90 5C            [ 2]  457     incw y
      009BB5 91 A7 00 2E      [ 1]  458 	ldf ([FPTR],y),a
      009BB9 90 5C            [ 2]  459     incw y
      009BBB 91 A7 00 2E      [ 1]  460 	ldf ([FPTR],y),a
      009BBF 90 5C            [ 2]  461     incw y
      009BC1 91 A7 00 2E      [ 1]  462 	ldf ([FPTR],y),a
      009BC5 72 05 50 5F FB   [ 2]  463 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009BCA 81               [ 4]  464 	ret
      009BCB                        465 row_erase_proc_end:
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
      009BCB                        478 copy_buffer:
      009BCB 4B 80            [ 1]  479 	push #BLOCK_SIZE  
                                    480 ;enable block programming 
      009BCD 72 10 50 5B      [ 1]  481 	bset FLASH_CR2,#FLASH_CR2_PRG 
      009BD1 72 11 50 5C      [ 1]  482 	bres FLASH_NCR2,#FLASH_CR2_PRG
      009BD5 90 5F            [ 1]  483 	clrw y
      009BD7 F6               [ 1]  484 1$:	ld a,(x)
      009BD8 91 A7 00 2E      [ 1]  485 	ldf ([FPTR],y),a
      009BDC 5C               [ 2]  486 	incw x 
      009BDD 90 5C            [ 2]  487 	incw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



      009BDF 0A 01            [ 1]  488 	dec (BCNT,sp)
      009BE1 26 F4            [ 1]  489 	jrne 1$
                                    490 ; wait EOP bit 
      009BE3 72 05 50 5F FB   [ 2]  491 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. 
      009BE8 84               [ 1]  492 	pop a ; remove BCNT from stack 
      009BE9 81               [ 4]  493 	ret 
      009BEA                        494 copy_buffer_end:
                                    495 
                                    496 ;-------------------------
                                    497 ; move program_row to RAM 
                                    498 ; in TIB 
                                    499 ;------------------------
      009BEA                        500 copy_prog_to_ram:
      009BEA 1D 00 06         [ 2]  501 	subw x,#6
      009BED 90 AE 9B CB      [ 2]  502 	ldw y,#copy_buffer 
      009BF1 EF 04            [ 2]  503 	ldw (4,x),y 
      009BF3 90 AE 17 00      [ 2]  504 	ldw y,#TIBBASE
      009BF7 EF 02            [ 2]  505 	ldw (2,x),y 
      009BF9 90 AE 9B EA      [ 2]  506 	ldw y,#copy_buffer_end 
      009BFD 72 A2 9B CB      [ 2]  507 	subw y,#copy_buffer  
      009C01 FF               [ 2]  508 	ldw (x),y 
      009C02 CD 8A CD         [ 4]  509 	call CMOVE 
      009C05 81               [ 4]  510 	ret 
                                    511 
                                    512 
                                    513 ;-----------------------------
                                    514 ; write a row in FLASH/EEPROM 
                                    515 ; WR-ROW ( a ud -- )
                                    516 ; a -> address 128 byte buffer to write 
                                    517 ; ud ->  row address in FLASH|EEPROM 
                                    518 ;-----------------------------
      009C06 9B 4D                  519 	.word LINK 
                           001B88   520 	LINK=.
      009C08 06                     521 	.byte 6 
      009C09 57 52 2D 52 4F 57      522 	.ascii "WR-ROW"
      009C0F                        523 write_row:
      009C0F CD 99 1D         [ 4]  524 	call fptr_store
                                    525 ; align to FLASH block 
      009C12 A6 80            [ 1]  526 	ld a,#0x80 
      009C14 B4 30            [ 1]  527 	and a,PTR8 
      009C16 B7 30            [ 1]  528 	ld PTR8,a  
      009C18 CD 9B EA         [ 4]  529 	call copy_prog_to_ram
      009C1B CD 9A 73         [ 4]  530 	call unlock
      009C1E 90 93            [ 1]  531 	ldw y,x 
      009C20 90 FE            [ 2]  532 	ldw y,(y)
      009C22 1C 00 02         [ 2]  533 	addw x,#CELLL 
      009C25 89               [ 2]  534 	pushw x 
      009C26 93               [ 1]  535 	ldw x,y ; buffer address in x 
      009C27 CD 17 00         [ 4]  536 	call TIBBASE
      009C2A CD 9A 9B         [ 4]  537 	call lock
      009C2D 85               [ 2]  538 	popw x 
      009C2E 81               [ 4]  539 	ret 
                                    540 
                                    541 ;-------------------------------------
                                    542 ; change value of OPTION register 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



                                    543 ; SET-OPT (c n -- ) 
                                    544 ; c new value.
                                    545 ; n OPT  number {1..7}
                                    546 ;--------------------------------------
      009C2F 9C 08                  547 		.word LINK 
                           001BB1   548 		LINK=.
      009C31 07                     549 		.byte 7 
      009C32 53 45 54 2D 4F 50 54   550 		.ascii "SET-OPT" 
      009C39                        551 set_option: 
      009C39 90 93            [ 1]  552 		ldw y,x 
      009C3B 90 FE            [ 2]  553 		ldw y,(y)
      009C3D 27 06            [ 1]  554 		jreq 1$
      009C3F 90 A3 00 07      [ 2]  555 		cpw y,#7 
      009C43 23 04            [ 2]  556 		jrule 2$ 
                                    557 ; invalid OPTION number 		
      009C45 1C 00 04         [ 2]  558 1$:		addw x,#2*CELLL
      009C48 81               [ 4]  559 		ret
      009C49 90 58            [ 2]  560 2$:		sllw y 
      009C4B 72 A9 47 FF      [ 2]  561 		addw y,#OPTION_BASE-1
      009C4F FF               [ 2]  562 		ldw (x),y 
      009C50 1D 00 02         [ 2]  563 		subw x,#CELLL 
      009C53 90 5F            [ 1]  564 		clrw y 
      009C55 FF               [ 2]  565 		ldw (x),y 
      009C56 CD 9A E1         [ 4]  566 		call ee_cstore
      009C59 81               [ 4]  567 		ret 
                                    568 
                                    569 
                                    570 
                                    571 ;--------------------------------------
                                    572 ; reset system to its original state 
                                    573 ; before any user modification
                                    574 ; PRISTINE ( -- )
                                    575 ;-------------------------------------
      009C5A 9C 31                  576 	.word LINK  
                           001BDC   577 	LINK=.
      009C5C 08                     578 	.byte 8 
      009C5D 50 52 49 53 54 49 4E   579 	.ascii "PRISTINE"
             45
      009C65                        580 pristine:
                                    581 ;;; erase EEPROM
      009C65 CD 99 3C         [ 4]  582 	call EEPROM 
      009C68 CD 86 33         [ 4]  583 1$:	call DDUP 
      009C6B CD 9B 57         [ 4]  584 	call row_erase
      009C6E 90 93            [ 1]  585 	ldw y,x 
      009C70 90 EE 02         [ 2]  586 	ldw y,(2,y)
      009C73 72 A9 00 80      [ 2]  587 	addw y,#BLOCK_SIZE
      009C77 EF 02            [ 2]  588 	ldw (2,x),y
      009C79 90 A3 48 00      [ 2]  589 	cpw y,#OPTION_BASE 
      009C7D 25 E9            [ 1]  590 	jrult 1$
                                    591 ;;; reset OPTION to default values
      009C7F 90 AE 00 01      [ 2]  592 	ldw y,#1 ; OPT1 
      009C83 FF               [ 2]  593 2$:	ldw (x),y   
      009C84 90 5F            [ 1]  594 	clrw y 
      009C86 EF 02            [ 2]  595 	ldw (2,x),y  ; ( 0 1 -- ) 
      009C88 CD 86 33         [ 4]  596 	call DDUP    ; ( 0 1 0 1 -- )  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



      009C8B CD 9C 39         [ 4]  597 	call set_option
      009C8E 90 93            [ 1]  598 	ldw y,x 
      009C90 90 FE            [ 2]  599 	ldw y,(y)
      009C92 90 5C            [ 2]  600 	incw y  ; next OPTION 
      009C94 90 A3 00 08      [ 2]  601 	cpw y,#8 
      009C98 25 E9            [ 1]  602 	jrult 2$
                                    603 ;;; erase first row of app_space 	
      009C9A 90 AE A0 00      [ 2]  604 	ldw y,#app_space
      009C9E EF 02            [ 2]  605 	ldw (2,x),y  
      009CA0 90 5F            [ 1]  606 	clrw y 
      009CA2 FF               [ 2]  607 	ldw (x),y ; ( app_space 0 -- )
      009CA3 CD 9B 57         [ 4]  608 	call row_erase 
                                    609 ; reset interrupt vectors 
      009CA6 1D 00 02         [ 2]  610 	subw x,#CELLL 
      009CA9 90 5F            [ 1]  611 	clrw y  
      009CAB FF               [ 2]  612 4$:	ldw (x),y  ; ( n -- ) int# 
      009CAC CD 84 72         [ 4]  613 	call DUPP  
      009CAF CD 9C CC         [ 4]  614 	call reset_vector
      009CB2 90 93            [ 1]  615 	ldw y,x 
      009CB4 90 FE            [ 2]  616 	ldw y,(y)
      009CB6 90 5C            [ 2]  617 	incw y   ; next vector 
      009CB8 90 A3 00 19      [ 2]  618 	cpw y,#25 
      009CBC 25 ED            [ 1]  619 	jrult 4$
      009CBE CC 80 80         [ 2]  620 	jp NonHandledInterrupt ; reset MCU
                                    621 
                                    622 ;------------------------------
                                    623 ; reset an interrupt vector 
                                    624 ; to its initial value 
                                    625 ; i.e. NonHandledInterrupt
                                    626 ; RST-IVEC ( n -- )
                                    627 ;-----------------------------
      009CC1 9C 5C                  628 	.word LINK 
                           001C43   629 	LINK=. 
      009CC3 08                     630 	.byte 8 
      009CC4 52 53 54 2D 49 56 45   631 	.ascii "RST-IVEC"
             43
      009CCC                        632 reset_vector:
      009CCC 90 93            [ 1]  633 	ldw y,x
      009CCE 1C 00 02         [ 2]  634 	addw x,#CELLL 
      009CD1 90 FE            [ 2]  635 	ldw y,(y)
      009CD3 90 A3 00 17      [ 2]  636 	cpw y,#23 
      009CD7 27 3A            [ 1]  637 	jreq 9$
      009CD9 90 A3 00 1D      [ 2]  638 	cpw y,#29 ; last vector
      009CDD 22 34            [ 1]  639 	jrugt 9$  
      009CDF 90 58            [ 2]  640 	sllw y 
      009CE1 90 58            [ 2]  641 	sllw y 
      009CE3 72 A9 80 08      [ 2]  642 	addw y,#0x8008 ; irq0 address 
      009CE7 90 BF 20         [ 2]  643 	ldw YTEMP,y
      009CEA 1D 00 06         [ 2]  644 	subw x,#3*CELLL 
      009CED EF 02            [ 2]  645 	ldw (2,x),y 
      009CEF 90 5F            [ 1]  646 	clrw y
      009CF1 FF               [ 2]  647 	ldw (x),y 
      009CF2 A6 82            [ 1]  648 	ld a,#0x82 
      009CF4 90 95            [ 1]  649 	ld yh,a
      009CF6 EF 04            [ 2]  650 	ldw (4,x),y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



      009CF8 CD 9B 2D         [ 4]  651 	call ee_store
      009CFB 1D 00 06         [ 2]  652 	subw x,#3*CELLL
      009CFE 90 5F            [ 1]  653 	clrw y 
      009D00 FF               [ 2]  654 	ldw (x),y 
      009D01 90 AE 80 80      [ 2]  655 	ldw y,#NonHandledInterrupt
      009D05 EF 04            [ 2]  656 	ldw (4,x),y 
      009D07 90 BE 20         [ 2]  657 	ldw y,YTEMP  
      009D0A 72 A9 00 02      [ 2]  658 	addw y,#2
      009D0E EF 02            [ 2]  659 	ldw (2,x),y 
      009D10 CD 9B 2D         [ 4]  660 	call ee_store
      009D13 81               [ 4]  661 9$:	ret 
                                    662 
                                    663 
                                    664 ;------------------------------
                                    665 ; all interrupt vector with 
                                    666 ; an address >= ca are resetted 
                                    667 ; to default
                                    668 ; CHKIVEC ( ca -- )
                                    669 ;------------------------------
      009D14 9C C3                  670 	.word LINK 
                           001C96   671 	LINK=.
      009D16 07                     672 	.byte 7
      009D17 43 48 4B 49 56 45 43   673 	.ascii "CHKIVEC"
                                    674 ;local variables 
                           000001   675 	SSP=1
                           000003   676 	CADR=3
                           000005   677 	OFS=5
                           000006   678 	VSIZE=6  
      009D1E                        679 CHKIVEC:
      009D1E 52 06            [ 2]  680 	sub sp,#VSIZE ;alloc local variables 
      009D20 90 93            [ 1]  681 	ldw y,x 
      009D22 90 FE            [ 2]  682 	ldw y,(y)
      009D24 17 03            [ 2]  683 	ldw (CADR,sp),y ; ca 
      009D26 1F 01            [ 2]  684 	ldw (SSP,sp),x 
      009D28 AE 80 0A         [ 2]  685 	ldw x,#0x800a ; irq0 address 
      009D2B BF 2F            [ 2]  686 	ldw PTR16,X
      009D2D AE FF FC         [ 2]  687 	ldw x,#-4 
      009D30 1C 00 04         [ 2]  688 1$:	addw x,#4
      009D33 A3 00 78         [ 2]  689 	cpw x,#30*4 ; irq0-29 
      009D36 27 22            [ 1]  690 	jreq 9$
      009D38 90 93            [ 1]  691 	ldw y,x  
      009D3A 91 D6 2F         [ 4]  692 	ld a,([PTR16],y)
      009D3D 11 03            [ 1]  693 	cp a,(CADR,sp)
      009D3F 25 EF            [ 1]  694 	jrult 1$
      009D41 90 5C            [ 2]  695 	incw y 
      009D43 91 D6 2F         [ 4]  696 	ld a,([PTR16],y)
      009D46 11 04            [ 1]  697 	cp a,(CADR+1,sp) 
      009D48 25 E6            [ 1]  698 	jrult 1$ 
      009D4A 1F 05            [ 2]  699 	ldw (OFS,sp),x 
      009D4C 54               [ 2]  700 	srlw x
      009D4D 54               [ 2]  701 	srlw x 
      009D4E 90 93            [ 1]  702 	ldw y,x 
      009D50 1E 01            [ 2]  703 	ldw x,(SSP,sp)
      009D52 FF               [ 2]  704 	ldw (x),y
      009D53 CD 9C CC         [ 4]  705 	call reset_vector
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



      009D56 1E 05            [ 2]  706 	ldw x,(OFS,sp) 
      009D58 20 D6            [ 2]  707 	jra 1$
      009D5A 1E 01            [ 2]  708 9$:	ldw x,(SSP,sp) 
      009D5C 1C 00 02         [ 2]  709 	addw x,#CELLL 
      009D5F 5B 06            [ 2]  710 	addw sp,#VSIZE ; drop local variables  
      009D61 81               [ 4]  711 	ret 
                                    712 
                                    713 ;------------------------------
                                    714 ; set interrupt vector 
                                    715 ; SET-IVEC ( ud n -- )
                                    716 ;  ud Handler address
                                    717 ;  n  vector # 0 .. 29 
                                    718 ;-----------------------------
      009D62 9D 16                  719 	.word LINK
                           001CE4   720 	LINK=.
      009D64 08                     721 	.byte 8 
      009D65 53 45 54 2D 49 56 45   722 	.ascii "SET-IVEC" 
             43
      009D6D                        723 set_vector:
      009D6D 90 93            [ 1]  724     ldw y,x 
      009D6F 1C 00 02         [ 2]  725 	addw x,#CELLL 
      009D72 90 FE            [ 2]  726 	ldw y,(y) ; vector #
      009D74 90 A3 00 1D      [ 2]  727 	cpw y,#29 ; last vector
      009D78 23 04            [ 2]  728 	jrule 2$
      009D7A 1C 00 04         [ 2]  729 	addw x,#2*CELLL 
      009D7D 81               [ 4]  730 	ret
      009D7E 90 58            [ 2]  731 2$:	sllw y 
      009D80 90 58            [ 2]  732 	sllw y 
      009D82 72 A9 80 08      [ 2]  733 	addw y,#0X8008 ; IRQ0 vector address 
      009D86 90 BF 20         [ 2]  734 	ldw YTEMP,y ; vector address 
      009D89 A6 82            [ 1]  735 	ld a,#0x82 
      009D8B 90 95            [ 1]  736 	ld yh,a 
      009D8D E6 01            [ 1]  737 	ld a,(1,x) ; isr address bits 23..16 
      009D8F 90 97            [ 1]  738 	ld yl,a 
                                    739 ;  write 0x82 + most significant byte of int address	
      009D91 1D 00 06         [ 2]  740 	subw x,#3*CELLL 
      009D94 EF 04            [ 2]  741 	ldw (4,x),y 
      009D96 90 BE 20         [ 2]  742 	ldw y,YTEMP
      009D99 EF 02            [ 2]  743 	ldw (2,x),y ; vector address 
      009D9B 90 5F            [ 1]  744 	clrw y 
      009D9D FF               [ 2]  745 	ldw (x),y   ; as a double 
      009D9E CD 9B 2D         [ 4]  746 	call ee_store 
      009DA1 90 93            [ 1]  747 	ldw y,x 
      009DA3 90 EE 02         [ 2]  748 	ldw y,(2,y) ; bits 15..0 int vector 
      009DA6 1D 00 06         [ 2]  749 	subw x,#3*CELLL 
      009DA9 EF 04            [ 2]  750 	ldw (4,x),y 
      009DAB 90 BE 20         [ 2]  751 	ldw y,YTEMP 
      009DAE 72 A9 00 02      [ 2]  752 	addw y,#2 
      009DB2 EF 02            [ 2]  753 	ldw (2,x),y 
      009DB4 90 5F            [ 1]  754 	clrw y 
      009DB6 FF               [ 2]  755 	ldw (x),y 
      009DB7 CD 9B 2D         [ 4]  756 	call ee_store
      009DBA 1C 00 04         [ 2]  757 	addw x,#2*CELLL  
      009DBD 81               [ 4]  758 9$: ret 
                                    759 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



                                    760 
                                    761 ;------------------------
                                    762 ; Compile word to flash
                                    763 ; EE, (w -- )
                                    764 ;-----------------------
      009DBE 9D 64                  765 	.word LINK
                           001D40   766 	LINK=.
      009DC0 03                     767 	.byte 3
      009DC1 45 45 2C               768 	.ascii "EE,"
      009DC4                        769 ee_comma:
      009DC4 1D 00 04         [ 2]  770 	subw x,#2*CELLL 
      009DC7 90 BE 18         [ 2]  771 	ldw y,UCP
      009DCA 90 89            [ 2]  772 	pushw y 
      009DCC EF 02            [ 2]  773 	ldw (2,x),y 
      009DCE 90 5F            [ 1]  774 	clrw y 
      009DD0 FF               [ 2]  775 	ldw (x),y
      009DD1 CD 9B 2D         [ 4]  776 	call ee_store
      009DD4 90 85            [ 2]  777 	popw y 
      009DD6 72 A9 00 02      [ 2]  778 	addw y,#2
      009DDA 90 BF 18         [ 2]  779 	ldw UCP,y
      009DDD 81               [ 4]  780 	ret 
                                    781 
                                    782 ;-------------------------
                                    783 ; Compile byte to flash 
                                    784 ; EEC, ( c -- )	
                                    785 ;-------------------------
      009DDE 9D C0                  786 	.word LINK 
                           001D60   787 	LINK=.
      009DE0 04                     788 	.byte 4 
      009DE1 45 45 43 2C            789 	.ascii "EEC,"
      009DE5                        790 ee_ccomma:
      009DE5 1D 00 04         [ 2]  791 	subw x,#2*CELLL 
      009DE8 90 BE 18         [ 2]  792 	ldw y,UCP
      009DEB 90 89            [ 2]  793 	pushw y 
      009DED EF 02            [ 2]  794 	ldw (2,x),y 
      009DEF 90 5F            [ 1]  795 	clrw y 
      009DF1 FF               [ 2]  796 	ldw (x),y
      009DF2 CD 9A E1         [ 4]  797 	call ee_cstore
      009DF5 90 85            [ 2]  798 	popw y 
      009DF7 90 5C            [ 2]  799 	incw y 
      009DF9 90 BF 18         [ 2]  800 	ldw UCP,y
      009DFC 81               [ 4]  801 	ret 
                                    802 
                                    803 
                                    804 ;--------------------------
                                    805 ; copy FLASH block to ROWBUF
                                    806 ; ROW2BUF ( ud -- )
                                    807 ;--------------------------
      009DFD 9D E0                  808 	.word LINK 
                           001D7F   809 	LINK=.
      009DFF 07                     810 	.byte 7 
      009E00 52 4F 57 32 42 55 46   811 	.ascii "ROW2BUF"
      009E07                        812 ROW2BUF: 
      009E07 CD 99 1D         [ 4]  813 	call fptr_store 
      009E0A A6 80            [ 1]  814 	ld a,#BLOCK_SIZE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



      009E0C 88               [ 1]  815 	push a 
      009E0D B4 30            [ 1]  816 	and a,PTR8 ; block align 
      009E0F B7 30            [ 1]  817 	ld PTR8,a
      009E11 90 AE 16 80      [ 2]  818 	ldw y,#ROWBUFF 
      009E15 92 BC 00 2E      [ 5]  819 1$: ldf a,[FPTR]
      009E19 90 F7            [ 1]  820 	ld (y),a
      009E1B CD 9A AF         [ 4]  821 	call inc_fptr
      009E1E 90 5C            [ 2]  822 	incw y 
      009E20 0A 01            [ 1]  823 	dec (1,sp)
      009E22 26 F1            [ 1]  824 	jrne 1$ 
      009E24 84               [ 1]  825 	pop a 
      009E25 81               [ 4]  826 	ret 
                                    827 
                                    828 
                                    829 ;---------------------------
                                    830 ; copy ROWBUFF to flash 
                                    831 ; BUF2ROW ( ud -- )
                                    832 ; ud is row address as double 
                                    833 ;---------------------------
      009E26 9D FF                  834 	.word LINK 
                           001DA8   835 	LINK=.
      009E28 07                     836 	.byte 7 
      009E29 42 55 46 32 52 4F 57   837 	.ascii "BUF2ROW" 
      009E30                        838 BUF2ROW:
      009E30 CD 85 6D         [ 4]  839 	call TBUF ; ( ud rb -- )
      009E33 CD 86 08         [ 4]  840 	call ROT 
      009E36 CD 86 08         [ 4]  841 	call ROT  ; ( rb ud -- )
      009E39 CD 9C 0F         [ 4]  842 	call write_row 
      009E3C 81               [ 4]  843 	ret 
                                    844 
                                    845 ;---------------------------------
                                    846 ; how many byte free in that row 
                                    847 ; RFREE ( a -- n )
                                    848 ; a is least byte of target address
                                    849 ;----------------------------------
      009E3D 9E 28                  850 	.word LINK 
                           001DBF   851 	LINK=.
      009E3F 05                     852 	.byte 5 
      009E40 52 46 52 45 45         853 	.ascii "RFREE"
      009E45                        854 RFREE:
      009E45 E6 01            [ 1]  855 	ld a,(1,x)
      009E47 A4 7F            [ 1]  856 	and a,#BLOCK_SIZE-1 
      009E49 B7 20            [ 1]  857 	ld YTEMP,a 
      009E4B A6 80            [ 1]  858 	ld a,#BLOCK_SIZE 
      009E4D B0 20            [ 1]  859 	sub a,YTEMP 
      009E4F 90 5F            [ 1]  860 	clrw y 
      009E51 90 97            [ 1]  861 	ld yl,a
      009E53 FF               [ 2]  862 	ldw (x),y 
      009E54 81               [ 4]  863 	ret 
                                    864 
                                    865 ;---------------------------------
                                    866 ; write u bytes to flash/EEPROM 
                                    867 ; constraint to row limit 
                                    868 ; RAM2EE ( ud a u -- u2 )
                                    869 ; ud flash address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



                                    870 ; a ram address 
                                    871 ; u bytes count
                                    872 ; return u2 bytes written  
                                    873 ;-------------------------------
      009E55 9E 3F                  874 	.word LINK 
                           001DD7   875 	LINK=. 
      009E57 06                     876 	.byte 6
      009E58 52 41 4D 32 45 45      877 	.ascii "RAM2EE"
                                    878 	
      009E5E                        879 RAM2EE:
                                    880 ; copy ud on top 
      009E5E 90 93            [ 1]  881 	ldw y,x 
      009E60 90 EE 06         [ 2]  882 	ldw y,(6,y) ; LSW of ud  
      009E63 90 BF 20         [ 2]  883 	ldw YTEMP,y 
      009E66 90 93            [ 1]  884 	ldw y,x 
      009E68 90 EE 04         [ 2]  885 	ldw y,(4,y)  ; MSW of ud 
      009E6B 1D 00 04         [ 2]  886 	subw x,#2*CELLL 
      009E6E FF               [ 2]  887 	ldw (x),y 
      009E6F 90 BE 20         [ 2]  888 	ldw y,YTEMP 
      009E72 EF 02            [ 2]  889 	ldw (2,x),y 
      009E74 CD 9E 07         [ 4]  890 	call ROW2BUF 
      009E77 90 93            [ 1]  891 	ldw y,x 
      009E79 90 EE 06         [ 2]  892 	ldw y,(6,y)
      009E7C 90 89            [ 2]  893 	pushw y ; udl 
      009E7E 90 9F            [ 1]  894 	ld a,yl
      009E80 A4 7F            [ 1]  895 	and a,#BLOCK_SIZE-1 
      009E82 90 5F            [ 1]  896 	clrw y 
      009E84 90 97            [ 1]  897 	ld yl,a 
      009E86 72 A9 16 80      [ 2]  898 	addw y,#ROWBUFF 
      009E8A 1D 00 02         [ 2]  899 	subw x,#CELLL 
      009E8D FF               [ 2]  900 	ldw (x),y  
      009E8E CD 84 82         [ 4]  901 	call SWAPP ;  ( ud a ra u -- )
      009E91 CD 84 1C         [ 4]  902 	call RFROM  
      009E94 CD 9E 45         [ 4]  903 	call RFREE 
      009E97 CD 87 48         [ 4]  904 	call MIN
      009E9A CD 84 72         [ 4]  905 	call DUPP 
      009E9D CD 84 3B         [ 4]  906 	call TOR  
      009EA0 CD 8A CD         [ 4]  907 	call CMOVE
      009EA3 CD 9E 30         [ 4]  908 	call BUF2ROW 
      009EA6 CD 84 1C         [ 4]  909 	call RFROM 
      009EA9 81               [ 4]  910 	ret 
                                    911 
                                    912 ;--------------------------
                                    913 ; expand 16 bit address 
                                    914 ; to 32 bit address 
                                    915 ; FADDR ( a -- ud )
                                    916 ;--------------------------
      009EAA 9E 57                  917 	.word LINK 
                           001E2C   918 	LINK=. 
      009EAC 05                     919 	.byte 5 
      009EAD 46 41 44 44 52         920 	.ascii "FADDR"
      009EB2                        921 FADDR:
      009EB2 CC 89 93         [ 2]  922 	jp ZERO 
                                    923 
                                    924 ;--------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
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
      009EB5 9E AC                  938 	.word LINK 
                           001E37   939 	LINK=.
      009EB7 05                     940 	.byte 5 
      009EB8 46 4D 4F 56 45         941 	.ascii "FMOVE" 
      009EBD                        942 FMOVE:
      009EBD CD 85 BC         [ 4]  943 	call CPP
      009EC0 CD 83 CB         [ 4]  944 	call AT  
      009EC3 CD 84 72         [ 4]  945 	call DUPP ; ( udl udl -- )
      009EC6 CD 85 A0         [ 4]  946 	call CNTXT 
      009EC9 CD 83 CB         [ 4]  947 	call AT 
      009ECC CD 83 43         [ 4]  948 	call DOLIT 
      009ECF 00 02                  949 	.word 2 
      009ED1 CD 86 A6         [ 4]  950 	call SUBB ; ( udl udl a -- )
      009ED4 CD 84 82         [ 4]  951 	call SWAPP 
      009ED7 CD 9E B2         [ 4]  952 	call FADDR 
      009EDA CD 86 08         [ 4]  953 	call ROT  ; ( udl ud a -- )
      009EDD CD 84 72         [ 4]  954 	call DUPP 
      009EE0 CD 84 3B         [ 4]  955 	call TOR    ; R: a 
      009EE3                        956 FMOVE2: 
      009EE3 CD 8A 80         [ 4]  957 	call HERE 
      009EE6 CD 84 2F         [ 4]  958 	call RAT 
      009EE9 CD 86 A6         [ 4]  959 	call SUBB ; (udl ud a wl -- )
      009EEC                        960 next_row:
      009EEC CD 84 72         [ 4]  961 	call DUPP 
      009EEF CD 84 3B         [ 4]  962 	call TOR  ; ( udl ud a wl -- ) R: a wl
      009EF2 CD 9E 5E         [ 4]  963 	call RAM2EE ; ( udl a u -- udl u2 ) u2 is byte written to FLASH 
      009EF5 CD 84 72         [ 4]  964 	call DUPP 
      009EF8 CD 84 3B         [ 4]  965 	call TOR
      009EFB CD 86 48         [ 4]  966 	call PLUS  ; ( udl+ ) 
      009EFE CD 84 72         [ 4]  967 	call DUPP 
      009F01 CD 89 93         [ 4]  968 	call ZERO   ; ( udl+ ud -- )
      009F04 CD 84 1C         [ 4]  969 	call RFROM  ; ( udl+ ud u2  R: a wl ) 
      009F07 CD 84 1C         [ 4]  970 	call RFROM  ; ( udl+ ud u2 wl R: a ) 
      009F0A CD 84 9C         [ 4]  971 	call OVER   ; ( udl+ ud u2 wl u2 -- )
      009F0D CD 86 A6         [ 4]  972 	call SUBB  ; ( udl+ ud u2 wl- R: a )
      009F10 CD 84 72         [ 4]  973 	call DUPP 
      009F13 CD 83 76         [ 4]  974 	call QBRAN
      009F16 9F 2F                  975 	.word fmove_done 
      009F18 CD 84 82         [ 4]  976 	call SWAPP  ; ( udl+ ud wl- u2 R: a )
      009F1B CD 84 1C         [ 4]  977 	call RFROM ; ( udl+ ud wl- u2 a -- ) 
      009F1E CD 86 48         [ 4]  978 	call PLUS  ; ( udl+2 ud wl- a+ )
      009F21 CD 84 72         [ 4]  979 	call DUPP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



      009F24 CD 84 3B         [ 4]  980 	call TOR   ; ( udl+2 ud wl- a+ ) R: a+
      009F27 CD 84 82         [ 4]  981 	call SWAPP 
      009F2A CD 83 8D         [ 4]  982 	call BRAN
      009F2D 9E EC                  983 	.word next_row  
      009F2F                        984 fmove_done:	
      009F2F CD 84 1C         [ 4]  985 	call RFROM  ; ( -- udl+ ud u2 wl- a  )
      009F32 1C 00 0A         [ 2]  986 	addw x,#5*CELLL ; (  -- udl+ ) new CP 
      009F35 81               [ 4]  987  	ret  
                                    988 
                                    989 ;------------------------------------------
                                    990 ; adjust pointers after **FMOVE** operetion.
                                    991 ; UPDAT-PTR ( cp+ -- )
                                    992 ; cp+ is new CP position after FMOVE 
                                    993 ;-------------------------------------------
      009F36 9E B7                  994 	.word LINK 
                           001EB8   995 	LINK=.
      009F38 09                     996 	.byte 9
      009F39 55 50 44 41 54 2D 50   997 	.ascii "UPDAT-PTR" 
             54 52
      009F42                        998 UPDATPTR:
                                    999 ;reset VP to previous position  
      009F42 CD 99 97         [ 4] 1000 	call EEPVP 
      009F45 CD 84 68         [ 4] 1001 	call DROP 
      009F48 CD 83 CB         [ 4] 1002 	call AT
      009F4B CD 85 AE         [ 4] 1003 	call VPP 
      009F4E CD 83 B4         [ 4] 1004 	call STORE
                                   1005 ;update CONTEXT and LAST 
      009F51 CD 99 81         [ 4] 1006 	call EEPCP 
      009F54 CD 84 68         [ 4] 1007 	call DROP
      009F57 CD 83 CB         [ 4] 1008 	call AT
      009F5A CD 83 43         [ 4] 1009 	call DOLIT 
      009F5D 00 02                 1010 	.word 2 
      009F5F CD 86 48         [ 4] 1011 	call PLUS 
      009F62 CD 84 72         [ 4] 1012 	call DUPP 
      009F65 CD 85 A0         [ 4] 1013 	call CNTXT 
      009F68 CD 83 B4         [ 4] 1014 	call STORE
      009F6B CD 85 CC         [ 4] 1015 	call LAST
      009F6E CD 83 B4         [ 4] 1016 	call STORE 
      009F71 CD 99 B1         [ 4] 1017 	call UPDATLAST 
                                   1018 ;update CP 
      009F74 CD 85 BC         [ 4] 1019 	call CPP 
      009F77 CD 83 B4         [ 4] 1020 	call STORE
      009F7A CD 99 DA         [ 4] 1021 	call UPDATCP 
      009F7D 81               [ 4] 1022 	ret 
                                   1023 
                                   1024 ;-----------------------------
                                   1025 ; move interrupt sub-routine
                                   1026 ; in flash memory
                                   1027 ;----------------------------- 
      009F7E 9F 38                 1028 	.word LINK 
                           001F00  1029 	LINK=. 
      009F80 06                    1030 	.byte 6
      009F81 49 46 4D 4F 56 45     1031 	.ascii "IFMOVE" 
      009F87                       1032 IFMOVE:
      009F87 CD 85 BC         [ 4] 1033 	call CPP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



      009F8A CD 83 CB         [ 4] 1034 	call AT 
      009F8D CD 84 72         [ 4] 1035 	call DUPP ; ( udl udl -- )
      009F90 CD 99 97         [ 4] 1036 	call EEPVP 
      009F93 CD 84 68         [ 4] 1037 	call DROP
      009F96 CD 83 CB         [ 4] 1038 	call AT  ; ( udl udl a )
      009F99 CD 84 3B         [ 4] 1039 	call TOR 
      009F9C CD 9E B2         [ 4] 1040 	call FADDR
      009F9F CD 84 2F         [ 4] 1041 	call RAT ; ( udl ud a -- ) R: a 
      009FA2 CC 9E E3         [ 2] 1042 	jp FMOVE2 
                                   1043 
                                   1044 
                                   1045 ; application code begin here
      00A000                       1046 	.bndry 128 ; align on flash block  
      00A000                       1047 app_space: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



                                   4528 .endif ; PICATOUT_MOD
                                   4529 
                                   4530 ;===============================================================
                                   4531 
                           001F00  4532 LASTN =	LINK   ;last name defined
                                   4533 
                                   4534 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   6 AB1        000649 R   |   6 ABOR1      00119C R
  6 ABOR2      0011B3 R   |   6 ABORQ      001194 R   |   6 ABORT      001185 R
  6 ABRTQ      001470 R   |   6 ABSS       000640 R   |   6 ACCEP      00111B R
  6 ACCP1      001124 R   |   6 ACCP2      00114A R   |   6 ACCP3      00114D R
  6 ACCP4      00114F R   |     ADC_CR1 =  005401     |     ADC_CR1_=  000000 
    ADC_CR1_=  000001     |     ADC_CR1_=  000004     |     ADC_CR1_=  000005 
    ADC_CR1_=  000006     |     ADC_CR2 =  005402     |     ADC_CR2_=  000003 
    ADC_CR2_=  000004     |     ADC_CR2_=  000005     |     ADC_CR2_=  000006 
    ADC_CR2_=  000001     |     ADC_CR3 =  005403     |     ADC_CR3_=  000007 
    ADC_CR3_=  000006     |     ADC_CSR =  005400     |     ADC_CSR_=  000006 
    ADC_CSR_=  000004     |     ADC_CSR_=  000000     |     ADC_CSR_=  000001 
    ADC_CSR_=  000002     |     ADC_CSR_=  000003     |     ADC_CSR_=  000007 
    ADC_CSR_=  000005     |     ADC_DRH =  005404     |     ADC_DRL =  005405 
    ADC_TDRH=  005406     |     ADC_TDRL=  005407     |   6 ADRADJ     000567 R
    AFR     =  004803     |     AFR0_ADC=  000000     |     AFR1_TIM=  000001 
    AFR2_CCO=  000002     |     AFR3_TIM=  000003     |     AFR4_TIM=  000004 
    AFR5_TIM=  000005     |     AFR6_I2C=  000006     |     AFR7_BEE=  000007 
  6 AFT        00145B R   |   6 AGAIN      0013B1 R   |   6 AHEAD      00140E R
  6 ALLOT      0012C4 R   |   6 ANDD       00043E R   |     APP_CP  =  004004 
    APP_LAST=  004000     |     APP_RUN =  004002     |     APP_VP  =  004006 
  6 AT         00034B R   |   6 ATEXE      000A36 R   |   6 AUTORUN    00011F R
    AWU_APR =  0050F1     |     AWU_CSR =  0050F0     |     AWU_TBR =  0050F2 
    B0_MASK =  000001     |     B115200 =  000006     |     B19200  =  000003 
    B1_MASK =  000002     |     B230400 =  000007     |     B2400   =  000000 
    B2_MASK =  000004     |     B38400  =  000004     |     B3_MASK =  000008 
    B460800 =  000008     |     B4800   =  000001     |     B4_MASK =  000010 
    B57600  =  000005     |     B5_MASK =  000020     |     B6_MASK =  000040 
    B7_MASK =  000080     |     B921600 =  000009     |     B9600   =  000002 
  6 BACK1      0010C3 R   |   6 BASE       0004AF R   |     BASEE   =  00000A 
    BCNT    =  000001     |   6 BCOMP      001306 R   |   6 BDIGS      000B1E R
    BEEP_BIT=  000004     |     BEEP_CSR=  0050F3     |     BEEP_MAS=  000010 
    BEEP_POR=  00000F     |   6 BEGIN      001393 R   |     BIT0    =  000000 
    BIT1    =  000001     |     BIT2    =  000002     |     BIT3    =  000003 
    BIT4    =  000004     |     BIT5    =  000005     |     BIT6    =  000006 
    BIT7    =  000007     |   6 BKSLA      000F5B R   |   6 BKSP       001093 R
    BKSPP   =  000008     |   6 BLANK      000906 R   |     BLOCK_SI=  000080 
    BOOT_ROM=  006000     |     BOOT_ROM=  007FFF     |   6 BRAN       00030D R
    BTW     =  000001     |   6 BUF2ROW    001DB0 R   |   6 BYE        0000AC R
    CADR    =  000003     |     CALLL   =  0000CD     |   6 CANT_FOR   0001CA R
    CAN_DGR =  005426     |     CAN_FPSR=  005427     |     CAN_IER =  005425 
    CAN_MCR =  005420     |     CAN_MSR =  005421     |     CAN_P0  =  005428 
    CAN_P1  =  005429     |     CAN_P2  =  00542A     |     CAN_P3  =  00542B 
    CAN_P4  =  00542C     |     CAN_P5  =  00542D     |     CAN_P6  =  00542E 
    CAN_P7  =  00542F     |     CAN_P8  =  005430     |     CAN_P9  =  005431 
    CAN_PA  =  005432     |     CAN_PB  =  005433     |     CAN_PC  =  005434 
    CAN_PD  =  005435     |     CAN_PE  =  005436     |     CAN_PF  =  005437 
    CAN_RFR =  005424     |     CAN_TPR =  005423     |     CAN_TSR =  005422 
    CARRY   =  000024     |   6 CAT        000369 R   |   6 CCOMMA     0012E8 R
    CC_C    =  000000     |     CC_H    =  000004     |     CC_I0   =  000003 
    CC_I1   =  000005     |     CC_N    =  000002     |     CC_V    =  000007 
    CC_Z    =  000001     |     CELLL   =  000002     |   6 CELLM      00088B R
  6 CELLP      00087C R   |   6 CELLS      00089A R   |     CFG_GCR =  007F60 
    CFG_GCR_=  000001     |     CFG_GCR_=  000000     |   6 CHAR1      000D4B R
  6 CHAR2      000D4E R   |   6 CHKIVEC    001C9E R   |     CLKOPT  =  004807 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
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
    CLK_SWR_=  0000E1     |     CLK_SWR_=  0000D2     |   6 CMOV1      000A55 R
  6 CMOV2      000A6D R   |   6 CMOVE      000A4D R   |     CNTDWN  =  00002C 
  6 CNTXT      000520 R   |   6 COLD       00182E R   |   6 COLD1      00182E R
  6 COLON      0015E5 R   |   6 COMMA      0012D1 R   |   6 COMPI      001316 R
    COMPO   =  000040     |   6 CONSTANT   00167B R   |     CONVERT_=  000001 
  6 COUNT      0009E9 R   |   6 CPP        00053C R   |     CPU_A   =  007F00 
    CPU_CCR =  007F0A     |     CPU_PCE =  007F01     |     CPU_PCH =  007F02 
    CPU_PCL =  007F03     |     CPU_SPH =  007F08     |     CPU_SPL =  007F09 
    CPU_XH  =  007F04     |     CPU_XL  =  007F05     |     CPU_YH  =  007F06 
    CPU_YL  =  007F07     |   6 CR         000D79 R   |   6 CREAT      00162B R
    CRR     =  00000D     |   6 CSTOR      000358 R   |     CTOP    =  000080 
  6 DAT        0009C9 R   |     DATSTK  =  001670     |   6 DDROP      0005A8 R
  6 DDUP       0005B3 R   |     DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF 
  6 DECIM      000BCE R   |   6 DEPTH      000956 R   |     DEVID_BA=  0048CD 
    DEVID_EN=  0048D8     |     DEVID_LO=  0048D2     |     DEVID_LO=  0048D3 
    DEVID_LO=  0048D4     |     DEVID_LO=  0048D5     |     DEVID_LO=  0048D6 
    DEVID_LO=  0048D7     |     DEVID_LO=  0048D8     |     DEVID_WA=  0048D1 
    DEVID_XH=  0048CE     |     DEVID_XL=  0048CD     |     DEVID_YH=  0048D0 
    DEVID_YL=  0048CF     |   6 DGTQ1      000C13 R   |   6 DI         0000BA R
  6 DIG        000B47 R   |   6 DIGIT      000AE2 R   |   6 DIGS       000B58 R
  6 DIGS1      000B58 R   |   6 DIGS2      000B65 R   |   6 DIGTQ      000BE2 R
    DM_BK1RE=  007F90     |     DM_BK1RH=  007F91     |     DM_BK1RL=  007F92 
    DM_BK2RE=  007F93     |     DM_BK2RH=  007F94     |     DM_BK2RL=  007F95 
    DM_CR1  =  007F96     |     DM_CR2  =  007F97     |     DM_CSR1 =  007F98 
    DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A     |   6 DN1        000620 R
  6 DNEGA      000605 R   |   6 DOCONST    00169D R   |   6 DOLIT      0002C3 R
  6 DONXT      0002D7 R   |   6 DOSTR      000D8F R   |   6 DOT        000E14 R
  6 DOT1       000E2A R   |   6 DOTI1      0017C2 R   |   6 DOTID      0017AC R
  6 DOTO1      001228 R   |   6 DOTOK      00120E R   |   6 DOTPR      000F3D R
  6 DOTQ       00148A R   |   6 DOTQP      000DB8 R   |   6 DOTR       000DC6 R
  6 DOTS       00174B R   |   6 DOTS1      001756 R   |   6 DOTS2      001762 R
  6 DOVAR      00049F R   |   6 DROP       0003E8 R   |   6 DSTOR      0009A3 R
  6 DUMP       001701 R   |   6 DUMP1      001718 R   |   6 DUMP3      00173A R
  6 DUMPP      0016D0 R   |   6 DUPP       0003F2 R   |   6 EDIGS      000B83 R
  6 EEPCP      001901 R   |   6 EEPLAST    0018D4 R   |   6 EEPROM     0018BC R
    EEPROM_B=  004000     |     EEPROM_E=  0047FF     |     EEPROM_S=  000800 
  6 EEPRUN     0018EB R   |   6 EEPVP      001917 R   |   6 EI         0000B3 R
  6 ELSEE      0013E9 R   |   6 EMIT       0002AD R   |   6 EQ1        000664 R
  6 EQUAL      00064E R   |   6 ERASE      000AAF R   |     ERR     =  00001B 
  6 EVAL       001251 R   |   6 EVAL1      001251 R   |   6 EVAL2      00126D R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]

Symbol Table

  6 EXE1       000A44 R   |   6 EXECU      00031D R   |   6 EXIT       00032D R
    EXT     =  000000     |     EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1 
  6 EXTRC      000B0A R   |   6 FADDR      001E32 R   |     FHSE    =  7A1200 
    FHSI    =  F42400     |   6 FILL       000A7C R   |   6 FILL1      000A99 R
  6 FILL2      000AA2 R   |   6 FIND       000FEF R   |   6 FIND1      00100D R
  6 FIND2      00103B R   |   6 FIND3      001047 R   |   6 FIND4      00105B R
  6 FIND5      001068 R   |   6 FIND6      00104C R   |     FLASH_BA=  008000 
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
  6 FMOVE      001E3D R   |   6 FMOVE2     001E63 R   |   6 FOR        001366 R
  6 FORGET     000150 R   |   6 FORGET1    000182 R   |   6 FORGET2    0001D8 R
  6 FORGET4    0001E1 R   |     FPTR    =  00002E     |   6 FREEVAR    0001EE R
  6 FREEVAR4   000224 R   |     GPIO_BAS=  005000     |     GPIO_CR1=  000003 
    GPIO_CR2=  000004     |     GPIO_DDR=  000002     |     GPIO_IDR=  000001 
    GPIO_ODR=  000000     |     GPIO_SIZ=  000005     |   6 HERE       000A00 R
  6 HEX        000BB9 R   |   6 HI         001801 R   |   6 HLD        00050D R
  6 HOLD       000B2E R   |     HSECNT  =  004809     |     I2C_CCRH=  00521C 
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
    I2C_TRIS=  000011     |     I2C_WRIT=  000000     |   6 ICOLON     0015F6 R
  6 IFETCH     001384 R   |   6 IFF        0013C1 R   |   6 IFMOVE     001F07 R
    IMEDD   =  000080     |   6 IMMED      001608 R   |   6 INCH       0002A1 R
  6 INITOFS    0015CE R   |   6 INN        0004CD R   |     INPUT_DI=  000000 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]

Symbol Table

    INPUT_EI=  000001     |     INPUT_FL=  000000     |     INPUT_PU=  000001 
  6 INTE1      0011F0 R   |   6 INTER      0011C6 R   |     INT_ADC2=  000016 
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
  6 INVER      0005E2 R   |     IPR0    =  000002     |     IPR1    =  000001 
    IPR2    =  000000     |     IPR3    =  000003     |     IPR_MASK=  000003 
    IRET_COD=  000080     |   6 ISEMI      00156C R   |     ITC_SPR1=  007F70 
    ITC_SPR2=  007F71     |     ITC_SPR3=  007F72     |     ITC_SPR4=  007F73 
    ITC_SPR5=  007F74     |     ITC_SPR6=  007F75     |     ITC_SPR7=  007F76 
    ITC_SPR8=  007F77     |     IWDG_KR =  0050E0     |     IWDG_PR =  0050E1 
    IWDG_RLR=  0050E2     |   6 JSRC       0015B8 R   |   6 KEY        000CF9 R
  6 KTAP       0010E0 R   |   6 KTAP1      001103 R   |   6 KTAP2      001106 R
  6 LAST       00054C R   |   6 LASTN   =  001F00 R   |   6 LBRAC      0011FD R
    LED2_BIT=  000005     |     LED2_MAS=  000020     |     LED2_POR=  00500A 
  6 LESS       00068B R   |     LF      =  00000A     |   6 LINK    =  001F00 R
  6 LITER      001338 R   |   6 LSHIFT     0008C5 R   |   6 LSHIFT1    0008CE R
  6 LSHIFT4    0008D6 R   |   6 LT1        0006A1 R   |     MASKK   =  001F7F 
  6 MAX        0006AB R   |   6 MAX1       0006BE R   |   6 MIN        0006C8 R
  6 MIN1       0006DB R   |   6 MMOD1      00077E R   |   6 MMOD2      000792 R
  6 MMOD3      0007A9 R   |   6 MMSM1      000725 R   |   6 MMSM2      000739 R
  6 MMSM3      00073B R   |   6 MMSM4      000743 R   |   6 MODD       0007C3 R
  6 MONE       00092C R   |     MS      =  00002A     |   6 MSEC       00022E R
  6 MSMOD      000761 R   |   6 MSTA1      000854 R   |   6 MSTAR      000831 R
    NAFR    =  004804     |   6 NAMEQ      001088 R   |   6 NAMET      000F99 R
    NCLKOPT =  004808     |   6 NEGAT      0005F3 R   |   6 NEX1       0002E4 R
  6 NEXT       001375 R   |     NFLASH_W=  00480E     |     NHSECNT =  00480A 
    NOPT1   =  004802     |     NOPT2   =  004804     |     NOPT3   =  004806 
    NOPT4   =  004808     |     NOPT5   =  00480A     |     NOPT6   =  00480C 
    NOPT7   =  00480E     |     NOPTBL  =  00487F     |   6 NTIB       0004DD R
    NUBC    =  004802     |   6 NUFQ       000D0F R   |   6 NUFQ1      000D28 R
  6 NUMBQ      000C26 R   |   6 NUMQ1      000C5A R   |   6 NUMQ2      000C8B R
  6 NUMQ3      000CCD R   |   6 NUMQ4      000CD2 R   |   6 NUMQ5      000CE1 R
  6 NUMQ6      000CE4 R   |     NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD 
    NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE 
  6 NonHandl   000000 R   |   6 OFFSET     00055E R   |     OFS     =  000005 
  6 ONE        00091E R   |   6 ONEM       0008B4 R   |   6 ONEP       0008A7 R
    OPT     =  000002     |     OPT0    =  004800     |     OPT1    =  004801 
    OPT2    =  004803     |     OPT3    =  004805     |     OPT4    =  004807 
    OPT5    =  004809     |     OPT6    =  00480B     |     OPT7    =  00480D 
    OPTBL   =  00487E     |     OPTION_B=  004800     |     OPTION_E=  00487F 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]

Symbol Table

    OPTION_S=  000080     |   6 ORIG       00003F R   |   6 ORR        000452 R
  6 OUTPUT     0002B2 R   |     OUTPUT_F=  000001     |     OUTPUT_O=  000000 
    OUTPUT_P=  000001     |     OUTPUT_S=  000000     |   6 OVER       00041C R
  6 OVERT      001545 R   |     PA      =  000000     |   6 PACKS      000AC1 R
  6 PAD        000A11 R   |   6 PAREN      000F4C R   |   6 PARS       000E45 R
  6 PARS1      000E70 R   |   6 PARS2      000E9B R   |   6 PARS3      000E9E R
  6 PARS4      000EA7 R   |   6 PARS5      000ECA R   |   6 PARS6      000EDF R
  6 PARS7      000EEE R   |   6 PARS8      000EFD R   |   6 PARSE      000F0E R
  6 PAUSE      00023E R   |     PA_BASE =  005000     |     PA_CR1  =  005003 
    PA_CR2  =  005004     |     PA_DDR  =  005002     |     PA_IDR  =  005001 
    PA_ODR  =  005000     |     PB      =  000005     |     PB_BASE =  005005 
    PB_CR1  =  005008     |     PB_CR2  =  005009     |     PB_DDR  =  005007 
    PB_IDR  =  005006     |     PB_ODR  =  005005     |     PC      =  00000A 
    PC_BASE =  00500A     |     PC_CR1  =  00500D     |     PC_CR2  =  00500E 
    PC_DDR  =  00500C     |     PC_IDR  =  00500B     |     PC_ODR  =  00500A 
    PD      =  00000F     |   6 PDUM1      0016E3 R   |   6 PDUM2      0016F4 R
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
  6 PICK       00096D R   |     PI_BASE =  005028     |     PI_CR1  =  00502B 
    PI_CR2  =  00502C     |     PI_DDR  =  00502A     |     PI_IDR  =  005029 
    PI_ODR  =  005028     |   6 PLUS       0005C8 R   |   6 PNAM1      0014FA R
  6 PRESE      00127C R   |     PROD1   =  00001E     |     PROD2   =  000020 
    PROD3   =  000022     |   6 PSTOR      000982 R   |     PTR16   =  00002F 
    PTR8    =  000030     |   6 QBRAN      0002F6 R   |   6 QDUP       000577 R
  6 QDUP1      000581 R   |   6 QKEY       00028F R   |   6 QSTAC      001234 R
  6 QUERY      001160 R   |   6 QUEST      000E37 R   |   6 QUIT       001299 R
  6 QUIT1      0012A1 R   |   6 QUIT2      0012A4 R   |   6 RAM2EE     001DDE R
    RAMBASE =  000000     |     RAM_BASE=  000000     |     RAM_END =  0017FF 
    RAM_SIZE=  001800     |   6 RAT        0003AF R   |   6 RBRAC      0015A5 R
  6 REPEA      00143E R   |   6 RFREE      001DC5 R   |   6 RFROM      00039C R
    ROP     =  004800     |   6 ROT        000588 R   |   6 ROW2BUF    001D87 R
    ROWBUFF =  001680     |     RP0     =  000028     |   6 RPAT       000379 R
    RPP     =  0017FF     |   6 RPSTO      000386 R   |   6 RSHIFT     0008E1 R
  6 RSHIFT1    0008EA R   |   6 RSHIFT4    0008F2 R   |     RST_SR  =  0050B3 
  6 SAME1      000FB7 R   |   6 SAME2      000FE0 R   |   6 SAMEQ      000FAF R
  6 SCOM1      00152F R   |   6 SCOM2      001532 R   |   6 SCOMP      001511 R
  6 SEMIS      001555 R   |   6 SETISP     0000C6 R   |     SFR_BASE=  005000 
    SFR_END =  0057FF     |   6 SIGN       000B6D R   |   6 SIGN1      000B7D R
  6 SLASH      0007CD R   |   6 SLMOD      0007B1 R   |   6 SNAME      0014C4 R
    SP0     =  000026     |   6 SPACE      000D31 R   |   6 SPACS      000D40 R
  6 SPAT       0003D2 R   |     SPI_CR1 =  005200     |     SPI_CR2 =  005201 
    SPI_CRCP=  005205     |     SPI_DR  =  005204     |     SPI_ICR =  005202 
    SPI_RXCR=  005206     |     SPI_SR  =  005203     |     SPI_TXCR=  005207 
    SPP     =  001670     |   6 SPSTO      0003DF R   |   6 SSMOD      00085D R
    SSP     =  000001     |     STACK   =  0017FF     |   6 STAR       000826 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]

Symbol Table

  6 STASL      00086E R   |   6 STORE      000334 R   |   6 STR        000B9B R
  6 STRCQ      001346 R   |   6 STRQ       00147D R   |   6 STRQP      000DAE R
  6 SUBB       000626 R   |   6 SWAPP      000402 R   |     SWIM_CSR=  007F80 
  6 TAP        0010CA R   |   6 TBOOT      001822 R   |   6 TBUF       0004ED R
    TBUFFBAS=  001680     |   6 TCHA1      00094D R   |   6 TCHAR      00093D R
  6 TEMP       0004BE R   |   6 TEVAL      0004FE R   |   6 THENN      0013D6 R
  6 TIB        000A22 R   |     TIBB    =  001700     |     TIBBASE =  001700 
    TIC     =  000027     |   6 TICK       0012B0 R   |     TIM1_ARR=  005262 
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
    TIM1_SR1=  000000     |     TIM1_SR2=  005256     |     TIM1_SR2=  000001 
    TIM1_SR2=  000002     |     TIM1_SR2=  000003     |     TIM1_SR2=  000004 
    TIM2_ARR=  00530D     |     TIM2_ARR=  00530E     |     TIM2_CCE=  005308 
    TIM2_CCE=  005309     |     TIM2_CCM=  005305     |     TIM2_CCM=  005306 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]

Symbol Table

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
    TIM4_PSC=  000003     |     TIM4_PSC=  000000     |     TIM4_PSC=  000001 
    TIM4_PSC=  000002     |     TIM4_SR =  005342     |     TIM4_SR_=  000000 
  6 TIMEOUTQ   00026E R   |   6 TIMER      000258 R   |     TIM_CR1_=  000007 
    TIM_CR1_=  000000     |     TIM_CR1_=  000006     |     TIM_CR1_=  000005 
    TIM_CR1_=  000004     |     TIM_CR1_=  000003     |     TIM_CR1_=  000001 
    TIM_CR1_=  000002     |   6 TNAM2      00177C R   |   6 TNAM3      00179A R
  6 TNAM4      0017A0 R   |   6 TNAME      001779 R   |   6 TOKEN      000F8B R
  6 TOR        0003BB R   |     TRUEE   =  00FFFF     |   6 TWOSL      0008F9 R
  6 TYPE1      000D60 R   |   6 TYPE2      000D6C R   |   6 TYPES      000D5B R
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
    UART_CR5=  000001     |     UART_CR5=  000002     |     UART_CR5=  000004 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]

Symbol Table

    UART_CR5=  000005     |     UART_CR6=  000009     |     UART_CR6=  000004 
    UART_CR6=  000007     |     UART_CR6=  000001     |     UART_CR6=  000002 
    UART_CR6=  000000     |     UART_CR6=  000005     |     UART_DR =  000001 
    UART_GTR=  000009     |     UART_PSC=  00000A     |     UART_SR =  000000 
    UART_SR_=  000001     |     UART_SR_=  000004     |     UART_SR_=  000002 
    UART_SR_=  000003     |     UART_SR_=  000000     |     UART_SR_=  000005 
    UART_SR_=  000006     |     UART_SR_=  000007     |     UBASE   =  000006 
    UBC     =  004801     |     UCNTXT  =  000014     |     UCP     =  000018 
    UCTIB   =  00000C     |     UD1     =  000001     |     UD2     =  000002 
    UD3     =  000003     |     UD4     =  000004     |   6 UDOT       000E01 R
  6 UDOTR      000DE1 R   |   6 UEND       00003D R   |     UHLD    =  000012 
    UINN    =  00000A     |     UINTER  =  000010     |     ULAST   =  00001A 
  6 ULES1      000683 R   |   6 ULESS      00066D R   |   6 UMMOD      000703 R
  6 UMSTA      0007DC R   |   6 UNIQ1      0014BB R   |   6 UNIQU      00149C R
  6 UNTIL      00139E R   |     UOFFSET =  00001C     |   6 UPDATCP    00195A R
  6 UPDATLAS   001931 R   |   6 UPDATPTR   001EC2 R   |   6 UPDATRUN   001949 R
  6 UPDATVP    001971 R   |   6 UPL1       000493 R   |   6 UPLUS      00047C R
    UPP     =  000006     |     USR_BTN_=  000004     |     USR_BTN_=  000010 
    USR_BTN_=  005015     |     UTIB    =  00000E     |     UTMP    =  000008 
  6 UTYP1      0016B3 R   |   6 UTYP2      0016C2 R   |   6 UTYPE      0016AE R
    UVP     =  000016     |   6 UZERO      000027 R   |   6 VARIA      001645 R
    VER     =  000003     |   6 VPP        00052E R   |     VSIZE   =  000006 
    WANT_DEB=  000000     |     WANT_SEE=  000000     |     WDGOPT  =  004805 
    WDGOPT_I=  000002     |     WDGOPT_L=  000003     |     WDGOPT_W=  000000 
    WDGOPT_W=  000001     |   6 WHILE      001424 R   |   6 WITHI      0006E8 R
  6 WORDD      000F77 R   |   6 WORDS      0017D6 R   |   6 WORS1      0017DC R
  6 WORS2      0017FB R   |     WWDG_CR =  0050D1     |     WWDG_WR =  0050D2 
  6 XORR       000467 R   |     XTEMP   =  00001E     |     YTEMP   =  000020 
  6 ZERO       000913 R   |   6 ZL1        000434 R   |   6 ZLESS      00042B R
  6 app_spac   001F80 R   |   6 block_er   001AF4 R   |   6 clear_ra   000019 R
  6 clock_in   00005A R   |   6 copy_buf   001B4B R   |   6 copy_buf   001B6A R
  6 copy_pro   001B6A R   |     da      =  000002     |     db      =  000003 
    dc      =  000000     |     dd      =  000001     |   6 ee_ccomm   001D65 R
  6 ee_comma   001D44 R   |   6 ee_cstor   001A61 R   |   6 ee_store   001AAD R
  6 erase_fl   001B10 R   |   6 farat      001982 R   |   6 farcat     00199E R
  6 fmove_do   001EAF R   |   6 fptr_sto   00189D R   |   6 inc_fptr   001A2F R
  6 lock       001A1B R   |   6 main       000016 R   |   6 next_row   001E6C R
  6 pristine   001BE5 R   |   6 proceed_   001B13 R   |   6 reboot     000285 R
  6 reset_ve   001C4C R   |   6 row_eras   001AD7 R   |   6 row_eras   001B24 R
  6 row_eras   001B4B R   |   6 set_opti   001BB9 R   |   6 set_vect   001CED R
  6 uart1_in   00006C R   |   6 unlock     0019F3 R   |   6 unlock_e   0019B5 R
  6 unlock_f   0019D4 R   |   6 write_by   001A46 R   |   6 write_ro   001B8F R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 DATA       size      0   flags    8
   2 DATA0      size      0   flags    8
   3 SSEG       size      0   flags    8
   4 SSEG1      size    100   flags    8
   5 HOME       size     80   flags    0
   6 CODE       size   1F80   flags    0

