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
                           001670    97 DATSTK  =	0x1670	;data stack  empty
                           001680    98 TBUFFBASE =     0x1680  ; flash read/write transaction buffer 
                           001700    99 TIBBASE =       0X1700  ; tib addr.
                                    100 
                                    101 
                                    102 
                                    103 ;; Memory allocation
                                    104 
                           000006   105 UPP     =     RAMBASE+6
                           001670   106 SPP     =     RAMBASE+DATSTK
                           0017FF   107 RPP     =     RAMBASE+STACK
                           001680   108 ROWBUFF =     RAMBASE+TBUFFBASE 
                           001700   109 TIBB    =     RAMBASE+TIBBASE
                           000080   110 CTOP    =     RAMBASE+0x80
                                    111 
                           000001   112 .if PICATOUT_MOD 
                                    113 ; user variables constants 
                           000006   114 UBASE = UPP       ; numeric base 
                           000008   115 UTMP = UBASE+2    ; temporary storage
                           00000A   116 UINN = UTMP+2     ; >IN tib pointer 
                           00000C   117 UCTIB = UINN+2    ; tib count 
                           00000E   118 UTIB = UCTIB+2    ; tib address 
                           000010   119 UINTER = UTIB+2   ; interpreter vector 
                           000012   120 UHLD = UINTER+2   ; hold 
                           000014   121 UCNTXT = UHLD+2   ; context, dictionary first link 
                           000016   122 UVP = UCNTXT+2    ; variable pointer 
                           000018   123 UCP = UVP+2      ; code pointer
                           00001A   124 ULAST = UCP+2    ; last dictionary pointer 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 4.
Hexadecimal [24-Bits]



                           00001C   125 UOFFSET = ULAST+2 ; distance between CP and VP to adjust jump address at compile time.
                                    126 .endif ; PICATOUT_MOD
                                    127 
                                    128 ;******  System Variables  ******
                           00001E   129 XTEMP	=	UOFFSET+2;address called by CREATE
                           000020   130 YTEMP	=	XTEMP+2	;address called by CREATE
                           00001E   131 PROD1 = XTEMP	;space for UM*
                           000020   132 PROD2 = PROD1+2
                           000022   133 PROD3 = PROD2+2
                           000024   134 CARRY = PROD3+2
                           000026   135 SP0	= CARRY+2	;initial data stack pointer
                           000028   136 RP0	= SP0+2		;initial return stack pointer
                           00002A   137 MS    =   RP0+2         ; millisecond counter 
                           00002C   138 CNTDWN =  MS+2          ; count down timer 
                           00002E   139 FPTR = CNTDWN+2         ; 24 bits farptr 
                           00002F   140 PTR16 = FPTR+1          ; middle byte of farptr 
                           000030   141 PTR8 = FPTR+2           ; least byte of farptr 
                                    142 
                           000001   143 .if PICATOUT_MOD
                                    144 ; EEPROM persistant data  
                           004000   145 APP_LAST = EEPROM_BASE ; Application last word pointer  
                           004002   146 APP_RUN = APP_LAST+2   ; application autorun address 
                           004004   147 APP_CP = APP_RUN+2   ; free application space pointer 
                           004006   148 APP_VP = APP_CP+2  ; free data space pointer 
                                    149 .endif ;PICATOUT_MOD
                                    150 
                                    151 
                                    152 ;***********************************************
                                    153 ;; Version control
                                    154 
                           000002   155 VER     =     2         ;major release version
                           000001   156 EXT     =     1         ;minor extension
                                    157 
                                    158 ;; Constants
                                    159 
                           00FFFF   160 TRUEE   =     0xFFFF      ;true flag
                                    161 
                           000040   162 COMPO   =     0x40     ;lexicon compile only bit
                           000080   163 IMEDD   =     0x80     ;lexicon immediate bit
                           001F7F   164 MASKK   =     0x1F7F  ;lexicon bit mask
                                    165 
                           000002   166 CELLL   =     2       ;size of a cell
                           00000A   167 BASEE   =     10      ;default radix
                           000008   168 BKSPP   =     8       ;back space
                           00000A   169 LF      =     10      ;line feed
                           00000D   170 CRR     =     13      ;carriage return
                           00001B   171 ERR     =     27      ;error escape
                           000027   172 TIC     =     39      ;tick
                           0000CD   173 CALLL   =     0xCD     ;CALL opcodes
                           000080   174 IRET_CODE =   0x80    ; IRET opcode 
                                    175 
                                    176         .macro _ledon
                                    177         bset PC_ODR,#LED2_BIT
                                    178         .endm
                                    179 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 5.
Hexadecimal [24-Bits]



                                    180         .macro _ledoff
                                    181         bres PC_ODR,#LED2_BIT
                                    182         .endm
                                    183 
                                    184 ;**********************************************************
                                    185         .area DATA (ABS)
      000000                        186         .org RAMBASE 
                                    187 ;**********************************************************
                                    188 
                                    189 ;**********************************************************
                                    190         .area SSEG (ABS) ; STACK
      001700                        191         .org 0x1700
      001700                        192         .ds 256 
                                    193 ; space for DATSTK,TIB and STACK         
                                    194 ;**********************************************************
                                    195 
                                    196 ;**********************************************************
                                    197         .area HOME ; vectors table
                                    198 ;**********************************************************
      008000 82 00 80 96            199 	int main	        ; reset
      008004 82 00 80 80            200 	int NonHandledInterrupt	; trap
      008008 82 00 80 80            201 	int NonHandledInterrupt	; irq0
      00800C 82 00 80 80            202 	int NonHandledInterrupt	; irq1
      008010 82 00 80 80            203 	int NonHandledInterrupt	; irq2
      008014 82 00 80 80            204 	int NonHandledInterrupt	; irq3
      008018 82 00 80 80            205 	int NonHandledInterrupt	; irq4
      00801C 82 00 80 80            206 	int NonHandledInterrupt	; irq5
      008020 82 00 80 80            207 	int NonHandledInterrupt	; irq6
      008024 82 00 80 80            208 	int NonHandledInterrupt	; irq7
      008028 82 00 80 80            209 	int NonHandledInterrupt	; irq8
      00802C 82 00 80 80            210 	int NonHandledInterrupt	; irq9
      008030 82 00 80 80            211 	int NonHandledInterrupt	; irq10
      008034 82 00 80 80            212 	int NonHandledInterrupt	; irq11
      008038 82 00 80 80            213 	int NonHandledInterrupt	; irq12
      00803C 82 00 80 80            214 	int NonHandledInterrupt	; irq13
      008040 82 00 80 80            215 	int NonHandledInterrupt	; irq14
      008044 82 00 80 80            216 	int NonHandledInterrupt	; irq15
      008048 82 00 80 80            217 	int NonHandledInterrupt	; irq16
      00804C 82 00 80 80            218 	int NonHandledInterrupt	; irq17
      008050 82 00 80 80            219 	int NonHandledInterrupt	; irq18
      008054 82 00 80 80            220 	int NonHandledInterrupt	; irq19
      008058 82 00 80 80            221 	int NonHandledInterrupt	; irq20
      00805C 82 00 80 80            222 	int NonHandledInterrupt	; irq21
      008060 82 00 80 80            223 	int NonHandledInterrupt	; irq22
      008064 82 00 80 85            224 	int Timer4Handler	; irq23
      008068 82 00 80 80            225 	int NonHandledInterrupt	; irq24
      00806C 82 00 80 80            226 	int NonHandledInterrupt	; irq25
      008070 82 00 80 80            227 	int NonHandledInterrupt	; irq26
      008074 82 00 80 80            228 	int NonHandledInterrupt	; irq27
      008078 82 00 80 80            229 	int NonHandledInterrupt	; irq28
      00807C 82 00 80 80            230 	int NonHandledInterrupt	; irq29
                                    231 
                                    232 ;**********************************************************
                                    233         .area CODE
                                    234 ;**********************************************************
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 6.
Hexadecimal [24-Bits]



                                    235 
                                    236 ; non handled interrupt reset MCU
      008080                        237 NonHandledInterrupt:
      008080 A6 80            [ 1]  238         ld a, #0x80
      008082 C7 50 D1         [ 1]  239         ld WWDG_CR,a ; WWDG_CR used to reset mcu
                                    240 	;iret
                                    241 
                                    242 ; used for milliseconds counter 
                                    243 ; MS is 16 bits counter 
      008085                        244 Timer4Handler:
      008085 72 5F 53 42      [ 1]  245 	clr TIM4_SR 
      008089 BE 2A            [ 2]  246         ldw x,MS 
      00808B 5C               [ 2]  247         incw x 
      00808C BF 2A            [ 2]  248         ldw MS,x
      00808E BE 2C            [ 2]  249         ldw x,CNTDWN 
      008090 27 03            [ 1]  250         jreq 1$
      008092 5A               [ 2]  251         decw x 
      008093 BF 2C            [ 2]  252         ldw CNTDWN,x 
      008095                        253 1$:         
      008095 80               [11]  254         iret 
                                    255 
                                    256 
                                    257 ;; Main entry points and COLD start data
      008096                        258 main:
                                    259 ; clear all RAM
      008096 AE 00 00         [ 2]  260 	ldw X,#RAMBASE
      008099                        261 clear_ram0:
      008099 7F               [ 1]  262 	clr (X)
      00809A 5C               [ 2]  263 	incw X
      00809B A3 17 FF         [ 2]  264 	cpw X,#RAM_END
      00809E 23 F9            [ 2]  265 	jrule clear_ram0
      0080A0 AE 17 FF         [ 2]  266         ldw x,#RPP
      0080A3 94               [ 1]  267         ldw sp,x 
      0080A4 CC 80 BF         [ 2]  268 	jp ORIG
                                    269 
                                    270 ; COLD initialize these variables.
      0080A7                        271 UZERO:
      0080A7 00 0A                  272         .word      BASEE   ;BASE
      0080A9 00 00                  273         .word      0       ;tmp
      0080AB 00 00                  274         .word      0       ;>IN
      0080AD 00 00                  275         .word      0       ;#TIB
      0080AF 17 00                  276         .word      TIBB    ;TIB
      0080B1 91 83                  277         .word      INTER   ;'EVAL
      0080B3 00 00                  278         .word      0       ;HLD
      0080B5 9E BD                  279         .word      LASTN  ;CNTXT pointer
      0080B7 00 80                  280         .word      CTOP   ;CP in RAM
      0080B9 9F 00                  281         .word      app_space ; CP in FLASH 
      0080BB 9E BD                  282         .word      LASTN   ;LAST
      0080BD 00 00                  283 UEND:  .word      0
                                    284 
      0080BF                        285 ORIG:   
                                    286 ; initialize SP
      0080BF AE 17 FF         [ 2]  287         LDW     X,#STACK  ;initialize return stack
      0080C2 94               [ 1]  288         LDW     SP,X
      0080C3 BF 28            [ 2]  289         LDW     RP0,X
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 7.
Hexadecimal [24-Bits]



      0080C5 AE 16 70         [ 2]  290         LDW     X,#DATSTK ;initialize data stack
      0080C8 BF 26            [ 2]  291         LDW     SP0,X
                                    292 ; initialize PC_5 as output to control LED2
                                    293 ; added by Picatout 
      0080CA 72 1A 50 0D      [ 1]  294         bset PC_CR1,#LED2_BIT
      0080CE 72 1A 50 0E      [ 1]  295         bset PC_CR2,#LED2_BIT
      0080D2 72 1A 50 0C      [ 1]  296         bset PC_DDR,#LED2_BIT
      000056                        297         _ledoff
      0080D6 72 1B 50 0A      [ 1]    1         bres PC_ODR,#LED2_BIT
                                    298 ; initialize clock to HSI
                                    299 ; no divisor 16Mhz 
                                    300 ; Added by Picatout 
      0080DA                        301 clock_init:
      0080DA 72 5F 50 C6      [ 1]  302         clr CLK_CKDIVR
      0080DE 72 12 50 C5      [ 1]  303 	bset CLK_SWCR,#CLK_SWCR_SWEN
      0080E2 A6 E1            [ 1]  304 	ld a,#CLK_SWR_HSI
      0080E4 C7 50 C4         [ 1]  305 	ld CLK_SWR,a
      0080E7 C1 50 C3         [ 1]  306 1$:	cp a,CLK_CMSR
      0080EA 26 FB            [ 1]  307 	jrne 1$
                                    308         
                                    309 ; initialize UART1, 115200 8N1
      0080EC                        310 uart1_init:
      0080EC 72 14 50 C7      [ 1]  311 	bset CLK_PCKENR1,#CLK_PCKENR1_UART1
                                    312 	; configure tx pin
      0080F0 72 1A 50 02      [ 1]  313 	bset PA_DDR,#UART1_TX_PIN ; tx pin
      0080F4 72 1A 50 03      [ 1]  314 	bset PA_CR1,#UART1_TX_PIN ; push-pull output
      0080F8 72 1A 50 04      [ 1]  315 	bset PA_CR2,#UART1_TX_PIN ; fast output
                                    316 	; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
      0080FC 35 0B 52 33      [ 1]  317 	mov UART1_BRR2,#0x0b ; must be loaded first
      008100 35 08 52 32      [ 1]  318 	mov UART1_BRR1,#0x8
      008104 35 0C 52 35      [ 1]  319 	mov UART1_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN));|(1<<UART_CR2_RIEN))
                                    320 ; initialize timer4, used for millisecond interrupt  
      008108 35 07 53 45      [ 1]  321 	mov TIM4_PSCR,#7 ; prescale 128  
      00810C 35 7D 53 46      [ 1]  322 	mov TIM4_ARR,#125 ; set for 1msec.
      008110 35 05 53 40      [ 1]  323 	mov TIM4_CR1,#((1<<TIM4_CR1_CEN)|(1<<TIM4_CR1_URS))
      008114 72 10 53 41      [ 1]  324 	bset TIM4_IER,#TIM4_IER_UIE 
                                    325 ; set TIM4 interrupt priority to highest
      008118 A6 3F            [ 1]  326         ld a,#~(IPR_MASK<<6)
      00811A C4 7F 75         [ 1]  327         and a,ITC_SPR6
      00811D AA C0            [ 1]  328         or a,#(IPR3<<6)
      00811F C7 7F 75         [ 1]  329         ld ITC_SPR6,a 
      008122 9A               [ 1]  330         rim
      008123 CC 97 EB         [ 2]  331         jp  COLD   ;default=MN1
                                    332 
                                    333 
                                    334 ;; place MCU in sleep mode with
                                    335 ;; halt opcode 
                                    336 ;; BYE ( -- )
      008126 00 00                  337         .word 0
                           0000A8   338         LINK=.
      008128 03                     339         .byte 3 
      008129 42 59 45               340         .ascii "BYE"
      00812C                        341 BYE: 
      00812C 8E               [10]  342         halt 
      00812D 81               [ 4]  343         ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 8.
Hexadecimal [24-Bits]



                                    344 
                                    345 ; Enable interrupts 
                                    346 ; EI ( -- )
      00812E 81 28                  347         .word LINK 
                           0000B0   348         LINK=.
      008130 02                     349         .byte 2
      008131 45 49                  350         .ascii "EI"
      008133                        351 EI:
      008133 9A               [ 1]  352         rim 
      008134 81               [ 4]  353         ret 
                                    354 
                                    355 ; Disable interrupts
                                    356 ; DI ( -- )
      008135 81 30                  357         .word LINK 
                           0000B7   358         LINK=.
      008137 02                     359         .byte 2 
      008138 44 49                  360         .ascii "DI"
      00813A                        361 DI:
      00813A 9B               [ 1]  362         sim 
      00813B 81               [ 4]  363         ret 
                                    364 
                                    365 ;; Reset dictionary pointer before 
                                    366 ;; forgotten word. RAM SPACE and 
                                    367 ;; interrupt vector defineD after 
                                    368 ;; must be resetted also.
      00813C 81 37                  369         .word LINK 
                           0000BE   370         LINK=.
      00813E 06                     371         .byte 6
      00813F 46 4F 52 47 45 54      372         .ascii "FORGET" 
      008145                        373 FORGET: 
      008145 CD 8F 48         [ 4]  374         call TOKEN
      008148 CD 83 E7         [ 4]  375         call DUPP 
      00814B CD 82 EB         [ 4]  376         call QBRAN 
      00814E 81 CD                  377         .word FORGET2
      008150 CD 90 45         [ 4]  378         call NAMEQ ; ( a -- ca na | a F )
      008153 CD 85 6C         [ 4]  379         call QDUP 
      008156 CD 82 EB         [ 4]  380         call QBRAN 
      008159 81 CD                  381         .word FORGET2
                                    382 ; only forget users words 
      00815B CD 83 E7         [ 4]  383         call DUPP ; ( ca na na )
      00815E CD 82 B8         [ 4]  384         call DOLIT 
      008161 9F 00                  385         .word app_space 
      008163 CD 83 F7         [ 4]  386         call SWAPP 
      008166 CD 86 1B         [ 4]  387         call SUBB 
      008169 CD 84 20         [ 4]  388         call  ZLESS 
      00816C CD 82 EB         [ 4]  389         call QBRAN 
      00816F 81 BF                  390         .word CANT_FORGET 
                                    391 ; ( ca na -- )        
                                    392 ;reset ivec with address >= ca
      008171 CD 83 F7         [ 4]  393         call SWAPP ; ( na ca -- ) 
      008174 CD 9C 5B         [ 4]  394         call CHKIVEC ; ( na -- ) 
                                    395 ; start at LAST and link back to na 
                                    396 ; if variable found reset VP at that point.
      008177                        397 FORGET1:
      008177 CD 85 41         [ 4]  398         call LAST 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 9.
Hexadecimal [24-Bits]



      00817A CD 83 40         [ 4]  399         call AT 
      00817D CD 83 E7         [ 4]  400         call DUPP  ; ( -- na last last )
      008180 CD 81 E3         [ 4]  401         call FREEVAR ; ( -- na last )
      008183 CD 83 E7         [ 4]  402         call DUPP 
      008186 CD 82 B8         [ 4]  403         call DOLIT 
      008189 00 02                  404         .word 2 
      00818B CD 86 1B         [ 4]  405         call SUBB ; ( na last -- na last lfa ) link address 
      00818E CD 83 40         [ 4]  406         call AT 
      008191 CD 83 E7         [ 4]  407         call DUPP ; ( -- na last a a )
      008194 CD 85 15         [ 4]  408         call CNTXT 
      008197 CD 83 29         [ 4]  409         call STORE
      00819A CD 85 41         [ 4]  410         call LAST  
      00819D CD 83 29         [ 4]  411         call STORE ; ( --  na last )
      0081A0 CD 84 11         [ 4]  412         call OVER 
      0081A3 CD 86 43         [ 4]  413         call EQUAL ; ( na last na -- na T|F ) 
      0081A6 CD 82 EB         [ 4]  414         call QBRAN 
      0081A9 81 77                  415         .word FORGET1 
                                    416 ; ( na -- )
      0081AB CD 82 B8         [ 4]  417         call DOLIT 
      0081AE 00 02                  418         .word 2 
      0081B0 CD 86 1B         [ 4]  419         call SUBB 
      0081B3 CD 85 31         [ 4]  420         call CPP 
      0081B6 CD 83 29         [ 4]  421         call STORE  
      0081B9 CD 99 17         [ 4]  422         call UPDATCP 
      0081BC CC 98 EE         [ 2]  423         jp UPDATLAST 
      0081BF                        424 CANT_FORGET:
      0081BF CD 91 51         [ 4]  425         call ABORQ
      0081C2 0A                     426         .byte 10
      0081C3 20 50 72 6F 74 65 63   427         .ascii " Protected"
             74 65 64
      0081CD                        428 FORGET2:
      0081CD CD 91 51         [ 4]  429         call ABORQ
      0081D0 05                     430         .byte 5
      0081D1 20 77 68 61 74         431         .ascii " what"
      0081D6                        432 FORGET4:
      0081D6 CC 83 DD         [ 2]  433         jp DROP 
                                    434 
                                    435 ;---------------------------------
                                    436 ; if na is variable 
                                    437 ; free variable data  
                                    438 ; FREEVAR ( na -- )
                                    439 ;---------------------------------
      0081D9 81 3E                  440         .word LINK 
                           00015B   441         LINK=.
      0081DB 07                     442         .byte 7 
      0081DC 46 52 45 45 56 41 52   443         .ascii "FREEVAR"
      0081E3                        444 FREEVAR:
      0081E3 CD 83 E7         [ 4]  445         call DUPP ; ( na na -- )
      0081E6 CD 83 5E         [ 4]  446         CALL CAT  ; ( na c -- )
      0081E9 CD 88 9C         [ 4]  447         call ONEP ;
      0081EC CD 85 BD         [ 4]  448         CALL PLUS ; ( na c+1 -- ca ) 
      0081EF CD 88 9C         [ 4]  449         call ONEP ; ( ca+ -- ) to get routne address 
      0081F2 CD 83 E7         [ 4]  450         call DUPP ; ( ca+ ca+ -- )
      0081F5 CD 83 40         [ 4]  451         CALL AT   ; ( ca+ fnaddr -- ) ; fnaddr is routine address 
      0081F8 CD 82 B8         [ 4]  452         call DOLIT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



      0081FB 84 94                  453         .word DOVAR ; if routine address is DOVAR then variable 
      0081FD CD 86 43         [ 4]  454         call EQUAL  ; ( ca+ fnaddr DOVAR -- ca+ T|F ) 
      008200 CD 82 EB         [ 4]  455         call QBRAN 
      008203 82 19                  456         .word FREEVAR4 
      008205 CD 82 B8         [ 4]  457         call DOLIT 
      008208 00 02                  458         .word 2 
      00820A CD 85 BD         [ 4]  459         call PLUS  ; ( ca+ 2 -- da ) da is data address 
      00820D CD 83 40         [ 4]  460         call AT 
      008210 CD 85 23         [ 4]  461         call VPP   
      008213 CD 83 29         [ 4]  462         call STORE 
      008216 CC 99 2E         [ 2]  463         jp UPDATVP 
      008219                        464 FREEVAR4: ; not variable
      008219 CC 83 DD         [ 2]  465         jp  DROP 
                                    466 
                                    467 ;;
                                    468 ;; get millisecond counter 
                                    469 ;; msec ( -- u )
                                    470 ;; Added by Picatout 2020-04-26
      00821C 81 DB                  471         .word LINK  
                           00019E   472         LINK = . 
      00821E 04                     473         .byte 4
      00821F 4D 53 45 43            474         .ascii "MSEC"
      008223                        475 MSEC: 
      008223 1D 00 02         [ 2]  476         subw x,#CELLL 
      008226 90 BE 2A         [ 2]  477         ldw y,MS 
      008229 FF               [ 2]  478         ldw (x),y 
      00822A 81               [ 4]  479         ret 
                                    480 
                                    481 ; suspend execution for u msec 
                                    482 ;  pause ( u -- )
      00822B 82 1E                  483         .word LINK 
                           0001AD   484         LINK=.
      00822D 05                     485         .byte 5 
      00822E 50 41 55 53 45         486         .ascii "PAUSE"
      008233                        487 PAUSE:
      008233 90 93            [ 1]  488         ldw y,x
      008235 90 FE            [ 2]  489         ldw y,(y)
      008237 72 B9 00 2A      [ 2]  490         addw y,MS 
      00823B 8F               [10]  491 1$:     wfi  
      00823C 90 B3 2A         [ 2]  492         cpw y,MS  
      00823F 26 FA            [ 1]  493         jrne 1$        
      008241 1C 00 02         [ 2]  494         addw x,#CELLL 
      008244 81               [ 4]  495         ret 
                                    496 
                                    497 ; initialize count down timer 
                                    498 ;  TIMER ( u -- )  milliseconds 
      008245 82 2D                  499         .word LINK 
                           0001C7   500         LINK=.
      008247 05                     501         .byte 5 
      008248 54 49 4D 45 52         502         .ascii "TIMER" 
      00824D                        503 TIMER:
      00824D 90 93            [ 1]  504         ldw y,x
      00824F 90 FE            [ 2]  505         ldw y,(y) 
      008251 90 BF 2C         [ 2]  506         ldw CNTDWN,y
      008254 1C 00 02         [ 2]  507         addw x,#CELLL 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



      008257 81               [ 4]  508         ret 
                                    509 
                                    510 ; check for TIMER exiparition 
                                    511 ;  TIMEOUT? ( -- 0|-1 )
      008258 82 47                  512         .word LINK 
                           0001DA   513         LINK=. 
      00825A 08                     514         .byte 8 
      00825B 54 49 4D 45 4F 55 54   515         .ascii "TIMEOUT?"
             3F
      008263                        516 TIMEOUTQ: 
      008263 4F               [ 1]  517         clr a
      008264 1D 00 02         [ 2]  518         subw x,#CELLL 
      008267 90 BE 2C         [ 2]  519         ldw y,CNTDWN 
      00826A 26 01            [ 1]  520         jrne 1$ 
      00826C 43               [ 1]  521         cpl a 
      00826D E7 01            [ 1]  522 1$:     ld (1,x),a 
      00826F F7               [ 1]  523         ld (x),a 
      008270 81               [ 4]  524         ret         
                                    525 
                                    526 ; reboot MCU 
                                    527 ; REBOOT ( -- )
      008271 82 5A                  528         .word LINK 
                           0001F3   529         LINK=. 
      008273 06                     530         .byte 6 
      008274 52 45 42 4F 4F 54      531         .ascii "REBOOT"
      00827A                        532 reboot:
      00827A CC 80 80         [ 2]  533         jp NonHandledInterrupt
                                    534         
                                    535 
                                    536 ;; Device dependent I/O
                                    537 ;       ?RX     ( -- c T | F )
                                    538 ;         Return input byte and true, or false.
      00827D 82 73                  539         .word      LINK 
                           0001FF   540 LINK	= .
      00827F 04                     541         .byte      4
      008280 3F 4B 45 59            542         .ascii     "?KEY"
      008284                        543 QKEY:
      008284 90 5F            [ 1]  544         CLRW Y 
      008286 72 0B 52 30 0B   [ 2]  545         BTJF UART1_SR,#UART_SR_RXNE,INCH   ;check status
      00828B C6 52 31         [ 1]  546         LD    A,UART1_DR   ;get char in A
      00828E 1D 00 02         [ 2]  547 	SUBW	X,#2
      008291 E7 01            [ 1]  548         LD     (1,X),A
      008293 7F               [ 1]  549 	CLR	(X)
      008294 90 53            [ 2]  550         CPLW     Y
      008296                        551 INCH:
      008296 1D 00 02         [ 2]  552 	SUBW	X,#2
      008299 FF               [ 2]  553         LDW     (X),Y
      00829A 81               [ 4]  554         RET
                                    555 
                                    556 ;       TX!     ( c -- )
                                    557 ;       Send character c to  output device.
      00829B 82 7F                  558         .word      LINK
                           00021D   559 LINK	= .
      00829D 04                     560         .byte      4
      00829E 45 4D 49 54            561         .ascii     "EMIT"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]



      0082A2                        562 EMIT:
      0082A2 E6 01            [ 1]  563         LD     A,(1,X)
      0082A4 1C 00 02         [ 2]  564 	ADDW	X,#2
      0082A7 72 0F 52 30 FB   [ 2]  565 OUTPUT: BTJF UART1_SR,#UART_SR_TXE,OUTPUT  ;loop until tdre
      0082AC C7 52 31         [ 1]  566         LD    UART1_DR,A   ;send A
      0082AF 81               [ 4]  567         RET
                                    568 
                                    569 ;; The kernel
                                    570 
                                    571 ;       doLIT   ( -- w )
                                    572 ;       Push an inline literal.
      0082B0 82 9D                  573         .word      LINK
                           000232   574 LINK	= 	.
      0082B2 45                     575 	.byte      COMPO+5
      0082B3 44 4F 4C 49 54         576         .ascii     "DOLIT"
      0082B8                        577 DOLIT:
      0082B8 1D 00 02         [ 2]  578 	SUBW X,#2
                           000001   579 .if PICATOUT_MOD 
      0082BB 16 01            [ 2]  580         ldw y,(1,sp)
      0082BD 90 FE            [ 2]  581         ldw y,(y)
      0082BF FF               [ 2]  582         ldw (x),y
      0082C0 90 85            [ 2]  583         popw y 
      0082C2 90 EC 02         [ 2]  584         jp (2,y)
                           000000   585 .else 
                                    586         POPW Y
                                    587 	LDW YTEMP,Y
                                    588 	LDW Y,(Y)
                                    589         LDW (X),Y
                                    590         LDW Y,YTEMP
                                    591 	JP (2,Y)
                                    592 .endif 
                                    593 
                                    594 ;       next    ( -- )
                                    595 ;       Code for  single index loop.
      0082C5 82 B2                  596         .word      LINK
                           000247   597 LINK	= 	.
      0082C7 44                     598 	.byte      COMPO+4
      0082C8 4E 45 58 54            599         .ascii     "NEXT"
      0082CC                        600 DONXT:
      0082CC 16 03            [ 2]  601 	LDW Y,(3,SP)
      0082CE 90 5A            [ 2]  602 	DECW Y
      0082D0 2A 07            [ 1]  603 	JRPL NEX1 ; jump if N=0
      0082D2 90 85            [ 2]  604 	POPW Y
                           000001   605 .if PICATOUT_MOD
      0082D4 5B 02            [ 2]  606         addw sp,#2
                           000000   607 .else        
                                    608 	POP A
                                    609 	POP A
                                    610 .endif         
      0082D6 90 EC 02         [ 2]  611         JP (2,Y)
      0082D9                        612 NEX1:
      0082D9 17 03            [ 2]  613         LDW (3,SP),Y
      0082DB 90 85            [ 2]  614         POPW Y
      0082DD 90 FE            [ 2]  615 	LDW Y,(Y)
      0082DF 90 FC            [ 2]  616 	JP (Y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 13.
Hexadecimal [24-Bits]



                                    617 
                                    618 ;       ?branch ( f -- )
                                    619 ;       Branch if flag is zero.
      0082E1 82 C7                  620         .word      LINK
                           000263   621 LINK	= 	.
      0082E3 47                     622 	.byte      COMPO+7
      0082E4 3F 42 52 41 4E 43 48   623         .ascii     "?BRANCH"
      0082EB                        624 QBRAN:	
      0082EB 90 93            [ 1]  625         LDW Y,X
      0082ED 1C 00 02         [ 2]  626 	ADDW X,#2
      0082F0 90 FE            [ 2]  627 	LDW Y,(Y)
      0082F2 27 0E            [ 1]  628         JREQ     BRAN
      0082F4 90 85            [ 2]  629 	POPW Y
      0082F6 90 EC 02         [ 2]  630 	JP (2,Y)
                                    631         
                                    632 ;       branch  ( -- )
                                    633 ;       Branch to an inline address.
      0082F9 82 E3                  634         .word      LINK
                           00027B   635 LINK	= 	.
      0082FB 46                     636 	.byte      COMPO+6
      0082FC 42 52 41 4E 43 48      637         .ascii     "BRANCH"
      008302                        638 BRAN:
      008302 90 85            [ 2]  639         POPW Y
      008304 90 FE            [ 2]  640 	LDW Y,(Y)
      008306 90 FC            [ 2]  641         JP     (Y)
                                    642 
                                    643 ;       EXECUTE ( ca -- )
                                    644 ;       Execute  word at ca.
      008308 82 FB                  645         .word      LINK
                           00028A   646 LINK	= 	.
      00830A 07                     647         .byte       7
      00830B 45 58 45 43 55 54 45   648         .ascii     "EXECUTE"
      008312                        649 EXECU:
      008312 90 93            [ 1]  650         LDW Y,X
      008314 1C 00 02         [ 2]  651 	ADDW X,#2
      008317 90 FE            [ 2]  652 	LDW  Y,(Y)
      008319 90 FC            [ 2]  653         JP   (Y)
                                    654 
                                    655 ;       EXIT    ( -- )
                                    656 ;       Terminate a colon definition.
      00831B 83 0A                  657         .word      LINK
                           00029D   658 LINK = .
      00831D 04                     659         .byte      4
      00831E 45 58 49 54            660         .ascii     "EXIT"
      008322                        661 EXIT:
      008322 90 85            [ 2]  662         POPW Y
      008324 81               [ 4]  663         RET
                                    664 
                                    665 ;       !       ( w a -- )
                                    666 ;       Pop  data stack to memory.
      008325 83 1D                  667         .word      LINK
                           0002A7   668 LINK = .
      008327 01                     669         .byte      1
      008328 21                     670         .ascii     "!"
      008329                        671 STORE:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 14.
Hexadecimal [24-Bits]



      008329 90 93            [ 1]  672         LDW Y,X
      00832B 90 FE            [ 2]  673         LDW Y,(Y)    ;Y=a
      00832D 90 BF 20         [ 2]  674         LDW YTEMP,Y
      008330 90 93            [ 1]  675         LDW Y,X
      008332 90 EE 02         [ 2]  676         LDW Y,(2,Y)
      008335 91 CF 20         [ 5]  677         LDW [YTEMP],Y ;store w at a
      008338 1C 00 04         [ 2]  678         ADDW X,#4 ; DDROP 
      00833B 81               [ 4]  679         RET     
                                    680 
                                    681 ;       @       ( a -- w )
                                    682 ;       Push memory location to stack.
      00833C 83 27                  683         .word      LINK
                           0002BE   684 LINK	= 	.
      00833E 01                     685         .byte    1
      00833F 40                     686         .ascii	"@"
      008340                        687 AT:
      008340 90 93            [ 1]  688         LDW Y,X     ;Y = a
      008342 90 FE            [ 2]  689         LDW Y,(Y)   ; address 
      008344 90 FE            [ 2]  690         LDW Y,(Y)   ; value 
      008346 FF               [ 2]  691         LDW (X),Y ;w = @Y
      008347 81               [ 4]  692         RET     
                                    693 
                                    694 ;       C!      ( c b -- )
                                    695 ;       Pop  data stack to byte memory.
      008348 83 3E                  696         .word      LINK
                           0002CA   697 LINK	= .
      00834A 02                     698         .byte      2
      00834B 43 21                  699         .ascii     "C!"
      00834D                        700 CSTOR:
      00834D 90 93            [ 1]  701         LDW Y,X
      00834F 90 FE            [ 2]  702 	LDW Y,(Y)    ;Y=b
      008351 E6 03            [ 1]  703         LD A,(3,X)    ;D = c
      008353 90 F7            [ 1]  704         LD  (Y),A     ;store c at b
      008355 1C 00 04         [ 2]  705 	ADDW X,#4 ; DDROP 
      008358 81               [ 4]  706         RET     
                                    707 
                                    708 ;       C@      ( b -- c )
                                    709 ;       Push byte in memory to  stack.
      008359 83 4A                  710         .word      LINK
                           0002DB   711 LINK	= 	.
      00835B 02                     712         .byte      2
      00835C 43 40                  713         .ascii     "C@"
      00835E                        714 CAT:
      00835E 90 93            [ 1]  715         LDW Y,X     ;Y=b
      008360 90 FE            [ 2]  716         LDW Y,(Y)
      008362 90 F6            [ 1]  717         LD A,(Y)
      008364 E7 01            [ 1]  718         LD (1,X),A
      008366 7F               [ 1]  719         CLR (X)
      008367 81               [ 4]  720         RET     
                                    721 
                                    722 ;       RP@     ( -- a )
                                    723 ;       Push current RP to data stack.
      008368 83 5B                  724         .word      LINK
                           0002EA   725 LINK	= .
      00836A 03                     726         .byte      3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 15.
Hexadecimal [24-Bits]



      00836B 52 50 40               727         .ascii     "RP@"
      00836E                        728 RPAT:
      00836E 90 96            [ 1]  729         LDW Y,SP    ;save return addr
      008370 1D 00 02         [ 2]  730         SUBW X,#2
      008373 FF               [ 2]  731         LDW (X),Y
      008374 81               [ 4]  732         RET     
                                    733 
                                    734 ;       RP!     ( a -- )
                                    735 ;       Set  return stack pointer.
      008375 83 6A                  736         .word      LINK
                           0002F7   737 LINK	= 	. 
      008377 43                     738 	.byte      COMPO+3
      008378 52 50 21               739         .ascii     "RP!"
      00837B                        740 RPSTO:
      00837B 90 85            [ 2]  741         POPW Y
      00837D 90 BF 20         [ 2]  742         LDW YTEMP,Y
      008380 90 93            [ 1]  743         LDW Y,X
      008382 90 FE            [ 2]  744         LDW Y,(Y)
      008384 90 94            [ 1]  745         LDW SP,Y
      008386 1C 00 02         [ 2]  746         ADDW x,#CELLL ; a was not dropped, Picatout 2020-05-24
      008389 92 CC 20         [ 5]  747         JP [YTEMP]
                                    748 
                                    749 ;       R>      ( -- w )
                                    750 ;       Pop return stack to data stack.
      00838C 83 77                  751         .word      LINK
                           00030E   752 LINK	= 	. 
      00838E 42                     753 	.byte      COMPO+2
      00838F 52 3E                  754         .ascii     "R>"
      008391                        755 RFROM:
      008391 90 85            [ 2]  756         POPW Y    ;save return addr
      008393 90 BF 20         [ 2]  757         LDW YTEMP,Y
      008396 90 85            [ 2]  758         POPW Y
      008398 1D 00 02         [ 2]  759         SUBW X,#2
      00839B FF               [ 2]  760         LDW (X),Y
      00839C 92 CC 20         [ 5]  761         JP [YTEMP]
                                    762 
                                    763 ;       R@      ( -- w )
                                    764 ;       Copy top of return stack to stack.
      00839F 83 8E                  765         .word      LINK
                           000321   766 LINK	= 	. 
      0083A1 02                     767         .byte      2
      0083A2 52 40                  768         .ascii     "R@"
      0083A4                        769 RAT:
                           000001   770 .if PICATOUT_MOD
      0083A4 16 03            [ 2]  771         ldw y,(3,sp)
      0083A6 1D 00 02         [ 2]  772         subw x,#CELLL 
      0083A9 FF               [ 2]  773         ldw (x),y 
      0083AA 81               [ 4]  774         ret 
                           000000   775 .else 
                                    776         POPW Y
                                    777         LDW YTEMP,Y
                                    778         POPW Y
                                    779         PUSHW Y
                                    780         SUBW X,#2
                                    781         LDW (X),Y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 16.
Hexadecimal [24-Bits]



                                    782         JP [YTEMP]
                                    783 .endif         
                                    784 
                                    785 ;       >R      ( w -- )
                                    786 ;       Push data stack to return stack.
      0083AB 83 A1                  787         .word      LINK
                           00032D   788 LINK	= 	. 
      0083AD 42                     789 	.byte      COMPO+2
      0083AE 3E 52                  790         .ascii     ">R"
      0083B0                        791 TOR:
      0083B0 90 85            [ 2]  792         POPW Y    ;save return addr
      0083B2 90 BF 20         [ 2]  793         LDW YTEMP,Y
      0083B5 90 93            [ 1]  794         LDW Y,X
      0083B7 90 FE            [ 2]  795         LDW Y,(Y)
      0083B9 90 89            [ 2]  796         PUSHW Y    ;restore return addr
      0083BB 1C 00 02         [ 2]  797         ADDW X,#2
      0083BE 92 CC 20         [ 5]  798         JP [YTEMP]
                                    799 
                                    800 ;       SP@     ( -- a )
                                    801 ;       Push current stack pointer.
      0083C1 83 AD                  802         .word      LINK
                           000343   803 LINK	= 	. 
      0083C3 03                     804         .byte      3
      0083C4 53 50 40               805         .ascii     "SP@"
      0083C7                        806 SPAT:
      0083C7 90 93            [ 1]  807 	LDW Y,X
      0083C9 1D 00 02         [ 2]  808         SUBW X,#2
      0083CC FF               [ 2]  809 	LDW (X),Y
      0083CD 81               [ 4]  810         RET     
                                    811 
                                    812 ;       SP!     ( a -- )
                                    813 ;       Set  data stack pointer.
      0083CE 83 C3                  814         .word      LINK
                           000350   815 LINK	= 	. 
      0083D0 03                     816         .byte      3
      0083D1 53 50 21               817         .ascii     "SP!"
      0083D4                        818 SPSTO:
      0083D4 FE               [ 2]  819         LDW     X,(X)     ;X = a
      0083D5 81               [ 4]  820         RET     
                                    821 
                                    822 ;       DROP    ( w -- )
                                    823 ;       Discard top stack item.
      0083D6 83 D0                  824         .word      LINK
                           000358   825 LINK	= 	. 
      0083D8 04                     826         .byte      4
      0083D9 44 52 4F 50            827         .ascii     "DROP"
      0083DD                        828 DROP:
      0083DD 1C 00 02         [ 2]  829         ADDW X,#2     
      0083E0 81               [ 4]  830         RET     
                                    831 
                                    832 ;       DUP     ( w -- w w )
                                    833 ;       Duplicate  top stack item.
      0083E1 83 D8                  834         .word      LINK
                           000363   835 LINK	= 	. 
      0083E3 03                     836         .byte      3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 17.
Hexadecimal [24-Bits]



      0083E4 44 55 50               837         .ascii     "DUP"
      0083E7                        838 DUPP:
      0083E7 90 93            [ 1]  839 	LDW Y,X
      0083E9 1D 00 02         [ 2]  840         SUBW X,#2
      0083EC 90 FE            [ 2]  841 	LDW Y,(Y)
      0083EE FF               [ 2]  842 	LDW (X),Y
      0083EF 81               [ 4]  843         RET     
                                    844 
                                    845 ;       SWAP    ( w1 w2 -- w2 w1 )
                                    846 ;       Exchange top two stack items.
      0083F0 83 E3                  847         .word      LINK
                           000372   848 LINK	= 	. 
      0083F2 04                     849         .byte      4
      0083F3 53 57 41 50            850         .ascii     "SWAP"
      0083F7                        851 SWAPP:
      0083F7 90 93            [ 1]  852         LDW Y,X
      0083F9 90 FE            [ 2]  853         LDW Y,(Y)
      0083FB 90 BF 20         [ 2]  854         LDW YTEMP,Y
      0083FE 90 93            [ 1]  855         LDW Y,X
      008400 90 EE 02         [ 2]  856         LDW Y,(2,Y)
      008403 FF               [ 2]  857         LDW (X),Y
      008404 90 BE 20         [ 2]  858         LDW Y,YTEMP
      008407 EF 02            [ 2]  859         LDW (2,X),Y
      008409 81               [ 4]  860         RET     
                                    861 
                                    862 ;       OVER    ( w1 w2 -- w1 w2 w1 )
                                    863 ;       Copy second stack item to top.
      00840A 83 F2                  864         .word      LINK
                           00038C   865 LINK	= . 
      00840C 04                     866         .byte      4
      00840D 4F 56 45 52            867         .ascii     "OVER"
      008411                        868 OVER:
      008411 1D 00 02         [ 2]  869         SUBW X,#2
      008414 90 93            [ 1]  870         LDW Y,X
      008416 90 EE 04         [ 2]  871         LDW Y,(4,Y)
      008419 FF               [ 2]  872         LDW (X),Y
      00841A 81               [ 4]  873         RET     
                                    874 
                                    875 ;       0<      ( n -- t )
                                    876 ;       Return true if n is negative.
      00841B 84 0C                  877         .word      LINK
                           00039D   878 LINK	= . 
      00841D 02                     879         .byte      2
      00841E 30 3C                  880         .ascii     "0<"
      008420                        881 ZLESS:
      008420 A6 FF            [ 1]  882         LD A,#0xFF
      008422 90 93            [ 1]  883         LDW Y,X
      008424 90 FE            [ 2]  884         LDW Y,(Y)
      008426 2B 01            [ 1]  885         JRMI     ZL1
      008428 4F               [ 1]  886         CLR A   ;false
      008429 F7               [ 1]  887 ZL1:    LD     (X),A
      00842A E7 01            [ 1]  888         LD (1,X),A
      00842C 81               [ 4]  889 	RET     
                                    890 
                                    891 ;       AND     ( w w -- w )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
Hexadecimal [24-Bits]



                                    892 ;       Bitwise AND.
      00842D 84 1D                  893         .word      LINK
                           0003AF   894 LINK	= . 
      00842F 03                     895         .byte      3
      008430 41 4E 44               896         .ascii     "AND"
      008433                        897 ANDD:
      008433 F6               [ 1]  898         LD  A,(X)    ;D=w
      008434 E4 02            [ 1]  899         AND A,(2,X)
      008436 E7 02            [ 1]  900         LD (2,X),A
      008438 E6 01            [ 1]  901         LD A,(1,X)
      00843A E4 03            [ 1]  902         AND A,(3,X)
      00843C E7 03            [ 1]  903         LD (3,X),A
      00843E 1C 00 02         [ 2]  904         ADDW X,#2
      008441 81               [ 4]  905         RET
                                    906 
                                    907 ;       OR      ( w w -- w )
                                    908 ;       Bitwise inclusive OR.
      008442 84 2F                  909         .word      LINK
                           0003C4   910 LINK = . 
      008444 02                     911         .byte      2
      008445 4F 52                  912         .ascii     "OR"
      008447                        913 ORR:
      008447 F6               [ 1]  914         LD A,(X)    ;D=w
      008448 EA 02            [ 1]  915         OR A,(2,X)
      00844A E7 02            [ 1]  916         LD (2,X),A
      00844C E6 01            [ 1]  917         LD A,(1,X)
      00844E EA 03            [ 1]  918         OR A,(3,X)
      008450 E7 03            [ 1]  919         LD (3,X),A
      008452 1C 00 02         [ 2]  920         ADDW X,#2
      008455 81               [ 4]  921         RET
                                    922 
                                    923 ;       XOR     ( w w -- w )
                                    924 ;       Bitwise exclusive OR.
      008456 84 44                  925         .word      LINK
                           0003D8   926 LINK	= . 
      008458 03                     927         .byte      3
      008459 58 4F 52               928         .ascii     "XOR"
      00845C                        929 XORR:
      00845C F6               [ 1]  930         LD A,(X)    ;D=w
      00845D E8 02            [ 1]  931         XOR A,(2,X)
      00845F E7 02            [ 1]  932         LD (2,X),A
      008461 E6 01            [ 1]  933         LD A,(1,X)
      008463 E8 03            [ 1]  934         XOR A,(3,X)
      008465 E7 03            [ 1]  935         LD (3,X),A
      008467 1C 00 02         [ 2]  936         ADDW X,#2
      00846A 81               [ 4]  937         RET
                                    938 
                                    939 ;       UM+     ( u u -- udsum )
                                    940 ;       Add two unsigned single
                                    941 ;       and return a double sum.
      00846B 84 58                  942         .word      LINK
                           0003ED   943 LINK	= . 
      00846D 03                     944         .byte      3
      00846E 55 4D 2B               945         .ascii     "UM+"
      008471                        946 UPLUS:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]



      008471 A6 01            [ 1]  947         LD A,#1
      008473 90 93            [ 1]  948         LDW Y,X
      008475 90 EE 02         [ 2]  949         LDW Y,(2,Y)
      008478 90 BF 20         [ 2]  950         LDW YTEMP,Y
      00847B 90 93            [ 1]  951         LDW Y,X
      00847D 90 FE            [ 2]  952         LDW Y,(Y)
      00847F 72 B9 00 20      [ 2]  953         ADDW Y,YTEMP
      008483 EF 02            [ 2]  954         LDW (2,X),Y
      008485 25 01            [ 1]  955         JRC     UPL1
      008487 4F               [ 1]  956         CLR A
      008488 E7 01            [ 1]  957 UPL1:   LD     (1,X),A
      00848A 7F               [ 1]  958         CLR (X)
      00848B 81               [ 4]  959         RET
                                    960 
                                    961 ;; System and user variables
                                    962 
                                    963 ;       doVAR   ( -- a )
                                    964 ;       Code for VARIABLE and CREATE.
      00848C 84 6D                  965         .word      LINK
                           00040E   966 LINK	= . 
      00848E 45                     967 	.byte      COMPO+5
      00848F 44 4F 56 41 52         968         .ascii     "DOVAR"
      008494                        969 DOVAR:
      008494 1D 00 02         [ 2]  970 	SUBW X,#2
      008497 90 85            [ 2]  971         POPW Y    ;get return addr (pfa)
                           000001   972 .if PICATOUT_MOD
      008499 90 FE            [ 2]  973         LDW Y,(Y) ; indirect address 
                                    974 .endif ;PICATOUT_MOD        
      00849B FF               [ 2]  975         LDW (X),Y    ;push on stack
      00849C 81               [ 4]  976         RET     ;go to RET of EXEC
                                    977 
                                    978 ;       BASE    ( -- a )
                                    979 ;       Radix base for numeric I/O.
      00849D 84 8E                  980         .word      LINK        
                           00041F   981 LINK = . 
      00849F 04                     982         .byte      4
      0084A0 42 41 53 45            983         .ascii     "BASE"
      0084A4                        984 BASE:
      0084A4 90 AE 00 06      [ 2]  985 	LDW Y,#UBASE 
      0084A8 1D 00 02         [ 2]  986 	SUBW X,#2
      0084AB FF               [ 2]  987         LDW (X),Y
      0084AC 81               [ 4]  988         RET
                                    989 
                                    990 ;       tmp     ( -- a )
                                    991 ;       A temporary storage.
      0084AD 84 9F                  992         .word      LINK
                                    993         
                           00042F   994 LINK = . 
      0084AF 03                     995 	.byte      3
      0084B0 54 4D 50               996         .ascii     "TMP"
      0084B3                        997 TEMP:
      0084B3 90 AE 00 08      [ 2]  998 	LDW Y,#UTMP
      0084B7 1D 00 02         [ 2]  999 	SUBW X,#2
      0084BA FF               [ 2] 1000         LDW (X),Y
      0084BB 81               [ 4] 1001         RET
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]



                                   1002 
                                   1003 ;       >IN     ( -- a )
                                   1004 ;        Hold parsing pointer.
      0084BC 84 AF                 1005         .word      LINK
                           00043E  1006 LINK = . 
      0084BE 03                    1007         .byte      3
      0084BF 3E 49 4E              1008         .ascii    ">IN"
      0084C2                       1009 INN:
      0084C2 90 AE 00 0A      [ 2] 1010 	LDW Y,#UINN 
      0084C6 1D 00 02         [ 2] 1011 	SUBW X,#2
      0084C9 FF               [ 2] 1012         LDW (X),Y
      0084CA 81               [ 4] 1013         RET
                                   1014 
                                   1015 ;       #TIB    ( -- a )
                                   1016 ;       Count in terminal input buffer.
      0084CB 84 BE                 1017         .word      LINK
                           00044D  1018 LINK = . 
      0084CD 04                    1019         .byte      4
      0084CE 23 54 49 42           1020         .ascii     "#TIB"
      0084D2                       1021 NTIB:
      0084D2 90 AE 00 0C      [ 2] 1022 	LDW Y,#UCTIB 
      0084D6 1D 00 02         [ 2] 1023 	SUBW X,#2
      0084D9 FF               [ 2] 1024         LDW (X),Y
      0084DA 81               [ 4] 1025         RET
                                   1026 
                           000001  1027 .if PICATOUT_MOD
                                   1028 ;       TBUF ( -- a )
                                   1029 ;       address of 128 bytes transaction buffer 
      0084DB 84 CD                 1030         .word LINK 
                           00045D  1031         LINK=.
      0084DD 04                    1032         .byte 4 
      0084DE 54 42 55 46           1033         .ascii "TBUF"
      0084E2                       1034 TBUF:
      0084E2 90 AE 16 80      [ 2] 1035         ldw y,#ROWBUFF
      0084E6 1D 00 02         [ 2] 1036         subw x,#CELLL
      0084E9 FF               [ 2] 1037         ldw (x),y 
      0084EA 81               [ 4] 1038         ret 
                                   1039 
                                   1040 
                                   1041 .endif ;PICATOUT_MOD
                                   1042 
                                   1043 ;       "EVAL   ( -- a )
                                   1044 ;       Execution vector of EVAL.
      0084EB 84 DD                 1045         .word      LINK
                           00046D  1046 LINK = . 
      0084ED 05                    1047         .byte      5
      0084EE 27 45 56 41 4C        1048         .ascii     "'EVAL"
      0084F3                       1049 TEVAL:
      0084F3 90 AE 00 10      [ 2] 1050 	LDW Y,#UINTER 
      0084F7 1D 00 02         [ 2] 1051 	SUBW X,#2
      0084FA FF               [ 2] 1052         LDW (X),Y
      0084FB 81               [ 4] 1053         RET
                                   1054 
                                   1055 ;       HLD     ( -- a )
                                   1056 ;       Hold a pointer of output string.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



      0084FC 84 ED                 1057         .word      LINK
                           00047E  1058 LINK = . 
      0084FE 03                    1059         .byte      3
      0084FF 48 4C 44              1060         .ascii     "HLD"
      008502                       1061 HLD:
      008502 90 AE 00 12      [ 2] 1062 	LDW Y,#UHLD 
      008506 1D 00 02         [ 2] 1063 	SUBW X,#2
      008509 FF               [ 2] 1064         LDW (X),Y
      00850A 81               [ 4] 1065         RET
                                   1066 
                                   1067 ;       CONTEXT ( -- a )
                                   1068 ;       Start vocabulary search.
      00850B 84 FE                 1069         .word      LINK
                           00048D  1070 LINK = . 
      00850D 07                    1071         .byte      7
      00850E 43 4F 4E 54 45 58 54  1072         .ascii     "CONTEXT"
      008515                       1073 CNTXT:
      008515 90 AE 00 14      [ 2] 1074 	LDW Y,#UCNTXT
      008519 1D 00 02         [ 2] 1075 	SUBW X,#2
      00851C FF               [ 2] 1076         LDW (X),Y
      00851D 81               [ 4] 1077         RET
                                   1078 
                                   1079 ;       VP      ( -- a )
                                   1080 ;       Point to top of variables
      00851E 85 0D                 1081         .word      LINK
                           0004A0  1082 LINK = . 
      008520 02                    1083         .byte      2
      008521 56 50                 1084         .ascii     "VP"
      008523                       1085 VPP:
      008523 90 AE 00 16      [ 2] 1086 	LDW Y,#UVP 
      008527 1D 00 02         [ 2] 1087 	SUBW X,#2
      00852A FF               [ 2] 1088         LDW (X),Y
      00852B 81               [ 4] 1089         RET
                                   1090 
                           000001  1091 .if PICATOUT_MOD
                                   1092 ;       CP    ( -- a )
                                   1093 ;       Pointer to top of FLASH 
      00852C 85 20                 1094         .word LINK 
                           0004AE  1095         LINK=.
      00852E 03                    1096         .byte 3 
      00852F 43 50                 1097         .ascii "CP"
      008531                       1098 CPP: 
      008531 90 AE 00 18      [ 2] 1099         ldw y,#UCP 
      008535 1D 00 02         [ 2] 1100         subw x,#CELLL 
      008538 FF               [ 2] 1101         ldw (x),y 
      008539 81               [ 4] 1102         ret                
                                   1103 .endif ;PICATOUT_MOD
                                   1104 
                                   1105 ;       LAST    ( -- a )
                                   1106 ;       Point to last name in dictionary.
      00853A 85 2E                 1107         .word      LINK
                           0004BC  1108 LINK = . 
      00853C 04                    1109         .byte      4
      00853D 4C 41 53 54           1110         .ascii     "LAST"
      008541                       1111 LAST:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]



      008541 90 AE 00 1A      [ 2] 1112 	LDW Y,#ULAST 
      008545 1D 00 02         [ 2] 1113 	SUBW X,#2
      008548 FF               [ 2] 1114         LDW (X),Y
      008549 81               [ 4] 1115         RET
                                   1116 
                           000001  1117 .if PICATOUT_MOD
      00854A 85 3C                 1118         .word LINK 
                           0004CC  1119         LINK=.
      00854C 06                    1120         .byte 6
      00854D 4F 46 46 53 45 54     1121         .ascii "OFFSET" 
      008553                       1122 OFFSET: 
      008553 1D 00 02         [ 2] 1123         subw x,#CELLL
      008556 90 AE 00 1C      [ 2] 1124         ldw y,#UOFFSET 
      00855A FF               [ 2] 1125         ldw (x),y 
      00855B 81               [ 4] 1126         ret 
                                   1127 
                                   1128 ; adjust jump address adding OFFSET
                                   1129 ; ADR-ADJ ( a -- a+offset )
      00855C                       1130 ADRADJ: 
      00855C CD 85 53         [ 4] 1131         call OFFSET 
      00855F CD 83 40         [ 4] 1132         call AT 
      008562 CC 85 BD         [ 2] 1133         jp PLUS 
                                   1134 
                                   1135 .endif ; PICATOUT_MOD
                                   1136 
                                   1137 ;; Common functions
                                   1138 
                                   1139 ;       ?DUP    ( w -- w w | 0 )
                                   1140 ;       Dup tos if its is not zero.
      008565 85 4C                 1141         .word      LINK
                           0004E7  1142 LINK = . 
      008567 04                    1143         .byte      4
      008568 3F 44 55 50           1144         .ascii     "?DUP"
      00856C                       1145 QDUP:
      00856C 90 93            [ 1] 1146         LDW Y,X
      00856E 90 FE            [ 2] 1147 	LDW Y,(Y)
      008570 27 04            [ 1] 1148         JREQ     QDUP1
      008572 1D 00 02         [ 2] 1149 	SUBW X,#2
      008575 FF               [ 2] 1150         LDW (X),Y
      008576 81               [ 4] 1151 QDUP1:  RET
                                   1152 
                                   1153 ;       ROT     ( w1 w2 w3 -- w2 w3 w1 )
                                   1154 ;       Rot 3rd item to top.
      008577 85 67                 1155         .word      LINK
                           0004F9  1156 LINK = . 
      008579 03                    1157         .byte      3
      00857A 52 4F 54              1158         .ascii     "ROT"
      00857D                       1159 ROT:
                           000001  1160 .if PICATOUT_MOD
      00857D 90 93            [ 1] 1161         ldw y,x 
      00857F 90 FE            [ 2] 1162         ldw y,(y)
      008581 90 89            [ 2] 1163         pushw y 
      008583 90 93            [ 1] 1164         ldw y,x 
      008585 90 EE 04         [ 2] 1165         ldw y,(4,y)
      008588 FF               [ 2] 1166         ldw (x),y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



      008589 90 93            [ 1] 1167         ldw y,x 
      00858B 90 EE 02         [ 2] 1168         ldw y,(2,y)
      00858E EF 04            [ 2] 1169         ldw (4,x),y 
      008590 90 85            [ 2] 1170         popw y 
      008592 EF 02            [ 2] 1171         ldw (2,x),y
      008594 81               [ 4] 1172         ret 
                           000000  1173 .else 
                                   1174         LDW Y,X
                                   1175 	LDW Y,(4,Y)
                                   1176 	LDW YTEMP,Y
                                   1177         LDW Y,X
                                   1178         LDW Y,(2,Y)
                                   1179         LDW XTEMP,Y
                                   1180         LDW Y,X
                                   1181         LDW Y,(Y)
                                   1182         LDW (2,X),Y
                                   1183         LDW Y,XTEMP
                                   1184         LDW (4,X),Y
                                   1185         LDW Y,YTEMP
                                   1186         LDW (X),Y
                                   1187         RET
                                   1188 .endif 
                                   1189 
                                   1190 ;       2DROP   ( w w -- )
                                   1191 ;       Discard two items on stack.
      008595 85 79                 1192         .word      LINK
                           000517  1193 LINK = . 
      008597 05                    1194         .byte      5
      008598 32 44 52 4F 50        1195         .ascii     "2DROP"
      00859D                       1196 DDROP:
      00859D 1C 00 04         [ 2] 1197         ADDW X,#4
      0085A0 81               [ 4] 1198         RET
                                   1199 
                                   1200 ;       2DUP    ( w1 w2 -- w1 w2 w1 w2 )
                                   1201 ;       Duplicate top two items.
      0085A1 85 97                 1202         .word      LINK
                           000523  1203 LINK = . 
      0085A3 04                    1204         .byte      4
      0085A4 32 44 55 50           1205         .ascii     "2DUP"
      0085A8                       1206 DDUP:
      0085A8 1D 00 04         [ 2] 1207         SUBW X,#4
      0085AB 90 93            [ 1] 1208         LDW Y,X
      0085AD 90 EE 06         [ 2] 1209         LDW Y,(6,Y)
      0085B0 EF 02            [ 2] 1210         LDW (2,X),Y
      0085B2 90 93            [ 1] 1211         LDW Y,X
      0085B4 90 EE 04         [ 2] 1212         LDW Y,(4,Y)
      0085B7 FF               [ 2] 1213         LDW (X),Y
      0085B8 81               [ 4] 1214         RET
                                   1215 
                                   1216 ;       +       ( w w -- sum )
                                   1217 ;       Add top two items.
      0085B9 85 A3                 1218         .word      LINK
                           00053B  1219 LINK = . 
      0085BB 01                    1220         .byte      1
      0085BC 2B                    1221         .ascii     "+"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]



      0085BD                       1222 PLUS:
      0085BD 90 93            [ 1] 1223         LDW Y,X
      0085BF 90 FE            [ 2] 1224         LDW Y,(Y)
      0085C1 90 BF 20         [ 2] 1225         LDW YTEMP,Y
      0085C4 1C 00 02         [ 2] 1226         ADDW X,#2
      0085C7 90 93            [ 1] 1227         LDW Y,X
      0085C9 90 FE            [ 2] 1228         LDW Y,(Y)
      0085CB 72 B9 00 20      [ 2] 1229         ADDW Y,YTEMP
      0085CF FF               [ 2] 1230         LDW (X),Y
      0085D0 81               [ 4] 1231         RET
                                   1232 
                                   1233 ;       NOT     ( w -- w )
                                   1234 ;       One's complement of tos.
      0085D1 85 BB                 1235         .word      LINK
                           000553  1236 LINK = . 
      0085D3 03                    1237         .byte      3
      0085D4 4E 4F 54              1238         .ascii     "NOT"
      0085D7                       1239 INVER:
      0085D7 90 93            [ 1] 1240         LDW Y,X
      0085D9 90 FE            [ 2] 1241         LDW Y,(Y)
      0085DB 90 53            [ 2] 1242         CPLW Y
      0085DD FF               [ 2] 1243         LDW (X),Y
      0085DE 81               [ 4] 1244         RET
                                   1245 
                                   1246 ;       NEGATE  ( n -- -n )
                                   1247 ;       Two's complement of tos.
      0085DF 85 D3                 1248         .word      LINK
                           000561  1249 LINK = . 
      0085E1 06                    1250         .byte      6
      0085E2 4E 45 47 41 54 45     1251         .ascii     "NEGATE"
      0085E8                       1252 NEGAT:
      0085E8 90 93            [ 1] 1253         LDW Y,X
      0085EA 90 FE            [ 2] 1254         LDW Y,(Y)
      0085EC 90 50            [ 2] 1255         NEGW Y
      0085EE FF               [ 2] 1256         LDW (X),Y
      0085EF 81               [ 4] 1257         RET
                                   1258 
                                   1259 ;       DNEGATE ( d -- -d )
                                   1260 ;       Two's complement of top double.
      0085F0 85 E1                 1261         .word      LINK
                           000572  1262 LINK = . 
      0085F2 07                    1263         .byte      7
      0085F3 44 4E 45 47 41 54 45  1264         .ascii     "DNEGATE"
      0085FA                       1265 DNEGA:
      0085FA 90 93            [ 1] 1266         LDW Y,X
      0085FC 90 FE            [ 2] 1267 	LDW Y,(Y)
      0085FE 90 53            [ 2] 1268         CPLW Y     
      008600 90 BF 20         [ 2] 1269 	LDW YTEMP,Y
      008603 90 93            [ 1] 1270         LDW Y,X
      008605 90 EE 02         [ 2] 1271         LDW Y,(2,Y)
      008608 90 53            [ 2] 1272         CPLW Y
      00860A 90 5C            [ 2] 1273         INCW Y
      00860C EF 02            [ 2] 1274         LDW (2,X),Y
      00860E 90 BE 20         [ 2] 1275         LDW Y,YTEMP
      008611 24 02            [ 1] 1276         JRNC DN1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



      008613 90 5C            [ 2] 1277         INCW Y
      008615 FF               [ 2] 1278 DN1:    LDW (X),Y
      008616 81               [ 4] 1279         RET
                                   1280 
                                   1281 ;       -       ( n1 n2 -- n1-n2 )
                                   1282 ;       Subtraction.
      008617 85 F2                 1283         .word      LINK
                           000599  1284 LINK = . 
      008619 01                    1285         .byte      1
      00861A 2D                    1286         .ascii     "-"
      00861B                       1287 SUBB:
      00861B 90 93            [ 1] 1288         LDW Y,X
      00861D 90 FE            [ 2] 1289         LDW Y,(Y)
      00861F 90 BF 20         [ 2] 1290         LDW YTEMP,Y
      008622 1C 00 02         [ 2] 1291         ADDW X,#2
      008625 90 93            [ 1] 1292         LDW Y,X
      008627 90 FE            [ 2] 1293         LDW Y,(Y)
      008629 72 B2 00 20      [ 2] 1294         SUBW Y,YTEMP
      00862D FF               [ 2] 1295         LDW (X),Y
      00862E 81               [ 4] 1296         RET
                                   1297 
                                   1298 ;       ABS     ( n -- n )
                                   1299 ;       Return  absolute value of n.
      00862F 86 19                 1300         .word      LINK
                           0005B1  1301 LINK = . 
      008631 03                    1302         .byte      3
      008632 41 42 53              1303         .ascii     "ABS"
      008635                       1304 ABSS:
      008635 90 93            [ 1] 1305         LDW Y,X
      008637 90 FE            [ 2] 1306 	LDW Y,(Y)
      008639 2A 03            [ 1] 1307         JRPL     AB1     ;negate:
      00863B 90 50            [ 2] 1308         NEGW     Y     ;else negate hi byte
      00863D FF               [ 2] 1309         LDW (X),Y
      00863E 81               [ 4] 1310 AB1:    RET
                                   1311 
                                   1312 ;       =       ( w w -- t )
                                   1313 ;       Return true if top two are =al.
      00863F 86 31                 1314         .word      LINK
                           0005C1  1315 LINK = . 
      008641 01                    1316         .byte      1
      008642 3D                    1317         .ascii     "="
      008643                       1318 EQUAL:
      008643 A6 FF            [ 1] 1319         LD A,#0xFF  ;true
      008645 90 93            [ 1] 1320         LDW Y,X    ;D = n2
      008647 90 FE            [ 2] 1321         LDW Y,(Y)
      008649 90 BF 20         [ 2] 1322         LDW YTEMP,Y
      00864C 1C 00 02         [ 2] 1323         ADDW X,#2
      00864F 90 93            [ 1] 1324         LDW Y,X
      008651 90 FE            [ 2] 1325         LDW Y,(Y)
      008653 90 B3 20         [ 2] 1326         CPW Y,YTEMP     ;if n2 <> n1
      008656 27 01            [ 1] 1327         JREQ     EQ1
      008658 4F               [ 1] 1328         CLR A
      008659 F7               [ 1] 1329 EQ1:    LD (X),A
      00865A E7 01            [ 1] 1330         LD (1,X),A
      00865C 81               [ 4] 1331 	RET     
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



                                   1332 
                                   1333 ;       U<      ( u u -- t )
                                   1334 ;       Unsigned compare of top two items.
      00865D 86 41                 1335         .word      LINK
                           0005DF  1336 LINK = . 
      00865F 02                    1337         .byte      2
      008660 55 3C                 1338         .ascii     "U<"
      008662                       1339 ULESS:
      008662 A6 FF            [ 1] 1340         LD A,#0xFF  ;true
      008664 90 93            [ 1] 1341         LDW Y,X    ;D = n2
      008666 90 FE            [ 2] 1342         LDW Y,(Y)
      008668 90 BF 20         [ 2] 1343         LDW YTEMP,Y
      00866B 1C 00 02         [ 2] 1344         ADDW X,#2
      00866E 90 93            [ 1] 1345         LDW Y,X
      008670 90 FE            [ 2] 1346         LDW Y,(Y)
      008672 90 B3 20         [ 2] 1347         CPW Y,YTEMP     ;if n2 <> n1
      008675 25 01            [ 1] 1348         JRULT     ULES1
      008677 4F               [ 1] 1349         CLR A
      008678 F7               [ 1] 1350 ULES1:  LD (X),A
      008679 E7 01            [ 1] 1351         LD (1,X),A
      00867B 81               [ 4] 1352 	RET     
                                   1353 
                                   1354 ;       <       ( n1 n2 -- t )
                                   1355 ;       Signed compare of top two items.
      00867C 86 5F                 1356         .word      LINK
                           0005FE  1357 LINK = . 
      00867E 01                    1358         .byte      1
      00867F 3C                    1359         .ascii     "<"
      008680                       1360 LESS:
      008680 A6 FF            [ 1] 1361         LD A,#0xFF  ;true
      008682 90 93            [ 1] 1362         LDW Y,X    ;D = n2
      008684 90 FE            [ 2] 1363         LDW Y,(Y)
      008686 90 BF 20         [ 2] 1364         LDW YTEMP,Y
      008689 1C 00 02         [ 2] 1365         ADDW X,#2
      00868C 90 93            [ 1] 1366         LDW Y,X
      00868E 90 FE            [ 2] 1367         LDW Y,(Y)
      008690 90 B3 20         [ 2] 1368         CPW Y,YTEMP     ;if n2 <> n1
      008693 2F 01            [ 1] 1369         JRSLT     LT1
      008695 4F               [ 1] 1370         CLR A
      008696 F7               [ 1] 1371 LT1:    LD (X),A
      008697 E7 01            [ 1] 1372         LD (1,X),A
      008699 81               [ 4] 1373 	RET     
                                   1374 
                                   1375 ;       MAX     ( n n -- n )
                                   1376 ;       Return greater of two top items.
      00869A 86 7E                 1377         .word      LINK
                           00061C  1378 LINK = . 
      00869C 03                    1379         .byte      3
      00869D 4D 41 58              1380         .ascii     "MAX"
      0086A0                       1381 MAX:
      0086A0 90 93            [ 1] 1382         LDW Y,X    ;D = n2
      0086A2 90 EE 02         [ 2] 1383         LDW Y,(2,Y)
      0086A5 90 BF 20         [ 2] 1384         LDW YTEMP,Y
      0086A8 90 93            [ 1] 1385         LDW Y,X
      0086AA 90 FE            [ 2] 1386         LDW Y,(Y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal [24-Bits]



      0086AC 90 B3 20         [ 2] 1387         CPW Y,YTEMP     ;if n2 <> n1
      0086AF 2F 02            [ 1] 1388         JRSLT     MAX1
      0086B1 EF 02            [ 2] 1389         LDW (2,X),Y
      0086B3 1C 00 02         [ 2] 1390 MAX1:   ADDW X,#2
      0086B6 81               [ 4] 1391 	RET     
                                   1392 
                                   1393 ;       MIN     ( n n -- n )
                                   1394 ;       Return smaller of top two items.
      0086B7 86 9C                 1395         .word      LINK
                           000639  1396 LINK = . 
      0086B9 03                    1397         .byte      3
      0086BA 4D 49 4E              1398         .ascii     "MIN"
      0086BD                       1399 MIN:
      0086BD 90 93            [ 1] 1400         LDW Y,X    ;D = n2
      0086BF 90 EE 02         [ 2] 1401         LDW Y,(2,Y)
      0086C2 90 BF 20         [ 2] 1402         LDW YTEMP,Y
      0086C5 90 93            [ 1] 1403         LDW Y,X
      0086C7 90 FE            [ 2] 1404         LDW Y,(Y)
      0086C9 90 B3 20         [ 2] 1405         CPW Y,YTEMP     ;if n2 <> n1
      0086CC 2C 02            [ 1] 1406         JRSGT     MIN1
      0086CE EF 02            [ 2] 1407         LDW (2,X),Y
      0086D0 1C 00 02         [ 2] 1408 MIN1:	ADDW X,#2
      0086D3 81               [ 4] 1409 	RET     
                                   1410 
                                   1411 ;       WITHIN  ( u ul uh -- t )
                                   1412 ;       Return true if u is within
                                   1413 ;       range of ul and uh. ( ul <= u < uh )
      0086D4 86 B9                 1414         .word      LINK
                           000656  1415 LINK = . 
      0086D6 06                    1416         .byte      6
      0086D7 57 49 54 48 49 4E     1417         .ascii     "WITHIN"
      0086DD                       1418 WITHI:
      0086DD CD 84 11         [ 4] 1419         CALL     OVER
      0086E0 CD 86 1B         [ 4] 1420         CALL     SUBB
      0086E3 CD 83 B0         [ 4] 1421         CALL     TOR
      0086E6 CD 86 1B         [ 4] 1422         CALL     SUBB
      0086E9 CD 83 91         [ 4] 1423         CALL     RFROM
      0086EC CC 86 62         [ 2] 1424         JP     ULESS
                                   1425 
                                   1426 ;; Divide
                                   1427 
                                   1428 ;       UM/MOD  ( udl udh un -- ur uq )
                                   1429 ;       Unsigned divide of a double by a
                                   1430 ;       single. Return mod and quotient.
      0086EF 86 D6                 1431         .word      LINK
                           000671  1432 LINK = . 
      0086F1 06                    1433         .byte      6
      0086F2 55 4D 2F 4D 4F 44     1434         .ascii     "UM/MOD"
      0086F8                       1435 UMMOD:
      0086F8 BF 1E            [ 2] 1436 	LDW XTEMP,X	; save stack pointer
      0086FA FE               [ 2] 1437 	LDW X,(X)	; un
      0086FB BF 20            [ 2] 1438 	LDW YTEMP,X     ; save un
      0086FD 90 BE 1E         [ 2] 1439 	LDW Y,XTEMP	; stack pointer
      008700 90 EE 04         [ 2] 1440 	LDW Y,(4,Y)     ; Y=udl
      008703 BE 1E            [ 2] 1441 	LDW X,XTEMP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



      008705 EE 02            [ 2] 1442 	LDW X,(2,X)	; X=udh
      008707 B3 20            [ 2] 1443 	CPW X,YTEMP
      008709 23 0F            [ 2] 1444 	JRULE MMSM1
      00870B BE 1E            [ 2] 1445 	LDW X,XTEMP
      00870D 1C 00 02         [ 2] 1446 	ADDW X,#2	; pop off 1 level
      008710 90 AE FF FF      [ 2] 1447 	LDW Y,#0xFFFF
      008714 FF               [ 2] 1448 	LDW (X),Y
      008715 90 5F            [ 1] 1449 	CLRW Y
      008717 EF 02            [ 2] 1450 	LDW (2,X),Y
      008719 81               [ 4] 1451 	RET
      00871A                       1452 MMSM1:
                           000001  1453 .if  PICATOUT_MOD 
                                   1454 ; take advantage of divw x,y when udh==0
      00871A 5D               [ 2] 1455         tnzw x  ; is udh==0?
      00871B 26 11            [ 1] 1456         jrne MMSM2 
      00871D 93               [ 1] 1457         ldw x,y    ;udl 
      00871E 90 BE 20         [ 2] 1458         ldw y,YTEMP ; divisor 
      008721 65               [ 2] 1459         divw x,y 
      008722 89               [ 2] 1460         pushw x     ; quotient 
      008723 BE 1E            [ 2] 1461         ldw x,XTEMP 
      008725 1C 00 02         [ 2] 1462         addw x,#CELLL 
      008728 EF 02            [ 2] 1463         ldw (2,x),y  ; ur
      00872A 90 85            [ 2] 1464         popw y 
      00872C FF               [ 2] 1465         ldw (x),y ; uq 
      00872D 81               [ 4] 1466         ret 
      00872E                       1467 MMSM2:        
                                   1468 .endif 
      00872E A6 11            [ 1] 1469 	LD A,#17	; loop count
      008730                       1470 MMSM3:
      008730 B3 20            [ 2] 1471 	CPW X,YTEMP	; compare udh to un
      008732 25 04            [ 1] 1472 	JRULT MMSM4	; can't subtract
      008734 72 B0 00 20      [ 2] 1473 	SUBW X,YTEMP	; can subtract
      008738                       1474 MMSM4:
      008738 8C               [ 1] 1475 	CCF	; quotient bit
      008739 90 59            [ 2] 1476 	RLCW Y	; rotate into quotient
      00873B 59               [ 2] 1477 	RLCW X	; rotate into remainder
      00873C 4A               [ 1] 1478 	DEC A	; repeat
      00873D 22 F1            [ 1] 1479 	JRUGT MMSM3
      00873F 57               [ 2] 1480 	SRAW X
      008740 BF 20            [ 2] 1481 	LDW YTEMP,X	; done, save remainder
      008742 BE 1E            [ 2] 1482 	LDW X,XTEMP
      008744 1C 00 02         [ 2] 1483 	ADDW X,#2	; drop
      008747 FF               [ 2] 1484 	LDW (X),Y
      008748 90 BE 20         [ 2] 1485 	LDW Y,YTEMP	; save quotient
      00874B EF 02            [ 2] 1486 	LDW (2,X),Y
      00874D 81               [ 4] 1487 	RET
                                   1488 	
                                   1489 ;       M/MOD   ( d n -- r q )
                                   1490 ;       Signed floored divide of double by
                                   1491 ;       single. Return mod and quotient.
      00874E 86 F1                 1492         .word      LINK
                           0006D0  1493 LINK = . 
      008750 05                    1494         .byte      5
      008751 4D 2F 4D 4F 44        1495         .ascii     "M/MOD"
      008756                       1496 MSMOD:  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



      008756 CD 83 E7         [ 4] 1497         CALL	DUPP
      008759 CD 84 20         [ 4] 1498         CALL	ZLESS
      00875C CD 83 E7         [ 4] 1499         CALL	DUPP
      00875F CD 83 B0         [ 4] 1500         CALL	TOR
      008762 CD 82 EB         [ 4] 1501         CALL	QBRAN
      008765 87 73                 1502         .word	MMOD1
      008767 CD 85 E8         [ 4] 1503         CALL	NEGAT
      00876A CD 83 B0         [ 4] 1504         CALL	TOR
      00876D CD 85 FA         [ 4] 1505         CALL	DNEGA
      008770 CD 83 91         [ 4] 1506         CALL	RFROM
      008773 CD 83 B0         [ 4] 1507 MMOD1:	CALL	TOR
      008776 CD 83 E7         [ 4] 1508         CALL	DUPP
      008779 CD 84 20         [ 4] 1509         CALL	ZLESS
      00877C CD 82 EB         [ 4] 1510         CALL	QBRAN
      00877F 87 87                 1511         .word	MMOD2
      008781 CD 83 A4         [ 4] 1512         CALL	RAT
      008784 CD 85 BD         [ 4] 1513         CALL	PLUS
      008787 CD 83 91         [ 4] 1514 MMOD2:	CALL	RFROM
      00878A CD 86 F8         [ 4] 1515         CALL	UMMOD
      00878D CD 83 91         [ 4] 1516         CALL	RFROM
      008790 CD 82 EB         [ 4] 1517         CALL	QBRAN
      008793 87 9E                 1518         .word	MMOD3
      008795 CD 83 F7         [ 4] 1519         CALL	SWAPP
      008798 CD 85 E8         [ 4] 1520         CALL	NEGAT
      00879B CD 83 F7         [ 4] 1521         CALL	SWAPP
      00879E 81               [ 4] 1522 MMOD3:	RET
                                   1523 
                                   1524 ;       /MOD    ( n n -- r q )
                                   1525 ;       Signed divide. Return mod and quotient.
      00879F 87 50                 1526         .word      LINK
                           000721  1527 LINK = . 
      0087A1 04                    1528         .byte      4
      0087A2 2F 4D 4F 44           1529         .ascii     "/MOD"
      0087A6                       1530 SLMOD:
      0087A6 CD 84 11         [ 4] 1531         CALL	OVER
      0087A9 CD 84 20         [ 4] 1532         CALL	ZLESS
      0087AC CD 83 F7         [ 4] 1533         CALL	SWAPP
      0087AF CC 87 56         [ 2] 1534         JP	MSMOD
                                   1535 
                                   1536 ;       MOD     ( n n -- r )
                                   1537 ;       Signed divide. Return mod only.
      0087B2 87 A1                 1538         .word      LINK
                           000734  1539 LINK = . 
      0087B4 03                    1540         .byte      3
      0087B5 4D 4F 44              1541         .ascii     "MOD"
      0087B8                       1542 MODD:
      0087B8 CD 87 A6         [ 4] 1543 	CALL	SLMOD
      0087BB CC 83 DD         [ 2] 1544 	JP	DROP
                                   1545 
                                   1546 ;       /       ( n n -- q )
                                   1547 ;       Signed divide. Return quotient only.
      0087BE 87 B4                 1548         .word      LINK
                           000740  1549 LINK = . 
      0087C0 01                    1550         .byte      1
      0087C1 2F                    1551         .ascii     "/"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



      0087C2                       1552 SLASH:
      0087C2 CD 87 A6         [ 4] 1553         CALL	SLMOD
      0087C5 CD 83 F7         [ 4] 1554         CALL	SWAPP
      0087C8 CC 83 DD         [ 2] 1555         JP	DROP
                                   1556 
                                   1557 ;; Multiply
                                   1558 
                                   1559 ;       UM*     ( u u -- ud )
                                   1560 ;       Unsigned multiply. Return double product.
      0087CB 87 C0                 1561         .word      LINK
                           00074D  1562 LINK = . 
      0087CD 03                    1563         .byte      3
      0087CE 55 4D 2A              1564         .ascii     "UM*"
      0087D1                       1565 UMSTA:	; stack have 4 bytes u1=a,b u2=c,d
                           000001  1566 .if PICATOUT_MOD 
                                   1567 ; take advantage of SP addressing modes
                                   1568 ; these PRODx in RAM are not required
                                   1569 ; the product is kept on stack as local variable 
                                   1570         ;; bytes offset on data stack 
                           000002  1571         da=2 
                           000003  1572         db=3 
                           000000  1573         dc=0 
                           000001  1574         dd=1 
                                   1575         ;; product bytes offset on return stack 
                           000001  1576         UD1=1  ; ud bits 31..24
                           000002  1577         UD2=2  ; ud bits 23..16
                           000003  1578         UD3=3  ; ud bits 15..8 
                           000004  1579         UD4=4  ; ud bits 7..0 
                                   1580         ;; local variable for product set to zero   
      0087D1 90 5F            [ 1] 1581         clrw y 
      0087D3 90 89            [ 2] 1582         pushw y  ; bits 15..0
      0087D5 90 89            [ 2] 1583         pushw y  ; bits 31..16 
      0087D7 E6 03            [ 1] 1584         ld a,(db,x) ; b 
      0087D9 90 97            [ 1] 1585         ld yl,a 
      0087DB E6 01            [ 1] 1586         ld a,(dd,x)   ; d
      0087DD 90 42            [ 4] 1587         mul y,a    ; b*d  
      0087DF 17 03            [ 2] 1588         ldw (UD3,sp),y ; lowest weight product 
      0087E1 E6 03            [ 1] 1589         ld a,(db,x)
      0087E3 90 97            [ 1] 1590         ld yl,a 
      0087E5 E6 00            [ 1] 1591         ld a,(dc,x)
      0087E7 90 42            [ 4] 1592         mul y,a  ; b*c 
                                   1593         ;;; do the partial sum 
      0087E9 72 F9 02         [ 2] 1594         addw y,(UD2,sp)
      0087EC 4F               [ 1] 1595         clr a 
      0087ED 49               [ 1] 1596         rlc a
      0087EE 6B 01            [ 1] 1597         ld (UD1,sp),a 
      0087F0 17 02            [ 2] 1598         ldw (UD2,sp),y 
      0087F2 E6 02            [ 1] 1599         ld a,(da,x)
      0087F4 90 97            [ 1] 1600         ld yl,a 
      0087F6 E6 01            [ 1] 1601         ld a,(dd,x)
      0087F8 90 42            [ 4] 1602         mul y,a   ; a*d 
                                   1603         ;; do partial sum 
      0087FA 72 F9 02         [ 2] 1604         addw y,(UD2,sp)
      0087FD 4F               [ 1] 1605         clr a 
      0087FE 19 01            [ 1] 1606         adc a,(UD1,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



      008800 6B 01            [ 1] 1607         ld (UD1,sp),a  
      008802 17 02            [ 2] 1608         ldw (UD2,sp),y 
      008804 E6 02            [ 1] 1609         ld a,(da,x)
      008806 90 97            [ 1] 1610         ld yl,a 
      008808 E6 00            [ 1] 1611         ld a,(dc,x)
      00880A 90 42            [ 4] 1612         mul y,a  ;  a*c highest weight product 
                                   1613         ;;; do partial sum 
      00880C 72 F9 01         [ 2] 1614         addw y,(UD1,sp)
      00880F FF               [ 2] 1615         ldw (x),y  ; udh 
      008810 16 03            [ 2] 1616         ldw y,(UD3,sp)
      008812 EF 02            [ 2] 1617         ldw (2,x),y  ; udl  
      008814 5B 04            [ 2] 1618         addw sp,#4 ; drop local variable 
      008816 81               [ 4] 1619         ret  
                           000000  1620 .else
                                   1621 	LD A,(2,X)	; b
                                   1622 	LD YL,A
                                   1623 	LD A,(X)	; d
                                   1624 	MUL Y,A
                                   1625 	LDW PROD1,Y
                                   1626 	LD A,(3,X)	; a
                                   1627 	LD YL,A
                                   1628 	LD A,(X)	; d
                                   1629 	MUL Y,A
                                   1630 	LDW PROD2,Y
                                   1631 	LD A,(2,X)	; b
                                   1632 	LD YL,A
                                   1633 	LD A,(1,X)	; c
                                   1634 	MUL Y,A
                                   1635 	LDW PROD3,Y
                                   1636 	LD A,(3,X)	; a
                                   1637 	LD YL,A
                                   1638 	LD A,(1,X)	; c
                                   1639 	MUL Y,A	; least signifiant product
                                   1640 	CLR A
                                   1641 	RRWA Y
                                   1642 	LD (3,X),A	; store least significant byte
                                   1643 	ADDW Y,PROD3
                                   1644 	CLR A
                                   1645 	ADC A,#0	; save carry
                                   1646 	LD CARRY,A
                                   1647 	ADDW Y,PROD2
                                   1648 	LD A,CARRY
                                   1649 	ADC A,#0	; add 2nd carry
                                   1650 	LD CARRY,A
                                   1651 	CLR A
                                   1652 	RRWA Y
                                   1653 	LD (2,X),A	; 2nd product byte
                                   1654 	ADDW Y,PROD1
                                   1655 	RRWA Y
                                   1656 	LD (1,X),A	; 3rd product byte
                                   1657 	RRWA Y  	; 4th product byte now in A
                                   1658 	ADC A,CARRY	; fill in carry bits
                                   1659 	LD (X),A
                                   1660 	RET
                                   1661 .endif 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



                                   1662 
                                   1663 
                                   1664 ;       *       ( n n -- n )
                                   1665 ;       Signed multiply. Return single product.
      008817 87 CD                 1666         .word      LINK
                           000799  1667 LINK = . 
      008819 01                    1668         .byte      1
      00881A 2A                    1669         .ascii     "*"
      00881B                       1670 STAR:
      00881B CD 87 D1         [ 4] 1671 	CALL	UMSTA
      00881E CC 83 DD         [ 2] 1672 	JP	DROP
                                   1673 
                                   1674 ;       M*      ( n n -- d )
                                   1675 ;       Signed multiply. Return double product.
      008821 88 19                 1676         .word      LINK
                           0007A3  1677 LINK = . 
      008823 02                    1678         .byte      2
      008824 4D 2A                 1679         .ascii     "M*"
      008826                       1680 MSTAR:      
      008826 CD 85 A8         [ 4] 1681         CALL	DDUP
      008829 CD 84 5C         [ 4] 1682         CALL	XORR
      00882C CD 84 20         [ 4] 1683         CALL	ZLESS
      00882F CD 83 B0         [ 4] 1684         CALL	TOR
      008832 CD 86 35         [ 4] 1685         CALL	ABSS
      008835 CD 83 F7         [ 4] 1686         CALL	SWAPP
      008838 CD 86 35         [ 4] 1687         CALL	ABSS
      00883B CD 87 D1         [ 4] 1688         CALL	UMSTA
      00883E CD 83 91         [ 4] 1689         CALL	RFROM
      008841 CD 82 EB         [ 4] 1690         CALL	QBRAN
      008844 88 49                 1691         .word	MSTA1
      008846 CD 85 FA         [ 4] 1692         CALL	DNEGA
      008849 81               [ 4] 1693 MSTA1:	RET
                                   1694 
                                   1695 ;       . /MOD   ( n1 n2 n3 -- r q )
                                   1696 ;       Multiply n1 and n2, then divide
                                   1697 ;       by n3. Return mod and quotient.
      00884A 88 23                 1698         .word      LINK
                           0007CC  1699 LINK = . 
      00884C 05                    1700         .byte      5
      00884D 2A 2F 4D 4F 44        1701         .ascii     "*/MOD"
      008852                       1702 SSMOD:
      008852 CD 83 B0         [ 4] 1703         CALL     TOR
      008855 CD 88 26         [ 4] 1704         CALL     MSTAR
      008858 CD 83 91         [ 4] 1705         CALL     RFROM
      00885B CC 87 56         [ 2] 1706         JP     MSMOD
                                   1707 
                                   1708 ;       */      ( n1 n2 n3 -- q )
                                   1709 ;       Multiply n1 by n2, then divide
                                   1710 ;       by n3. Return quotient only.
      00885E 88 4C                 1711         .word      LINK
                           0007E0  1712 LINK = . 
      008860 02                    1713         .byte      2
      008861 2A 2F                 1714         .ascii     "*/"
      008863                       1715 STASL:
      008863 CD 88 52         [ 4] 1716         CALL	SSMOD
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



      008866 CD 83 F7         [ 4] 1717         CALL	SWAPP
      008869 CC 83 DD         [ 2] 1718         JP	DROP
                                   1719 
                                   1720 ;; Miscellaneous
                                   1721 
                                   1722 ;       CELL+   ( a -- a )
                                   1723 ;       Add cell size in byte to address.
      00886C 88 60                 1724         .word      LINK
                           0007EE  1725 LINK = . 
      00886E 02                    1726         .byte       2
      00886F 32 2B                 1727         .ascii     "2+"
      008871                       1728 CELLP:
      008871 90 93            [ 1] 1729         LDW Y,X
      008873 90 FE            [ 2] 1730 	LDW Y,(Y)
      008875 72 A9 00 02      [ 2] 1731         ADDW Y,#CELLL 
      008879 FF               [ 2] 1732         LDW (X),Y
      00887A 81               [ 4] 1733         RET
                                   1734 
                                   1735 ;       CELL-   ( a -- a )
                                   1736 ;       Subtract 2 from address.
      00887B 88 6E                 1737         .word      LINK
                           0007FD  1738 LINK = . 
      00887D 02                    1739         .byte       2
      00887E 32 2D                 1740         .ascii     "2-"
      008880                       1741 CELLM:
      008880 90 93            [ 1] 1742         LDW Y,X
      008882 90 FE            [ 2] 1743 	LDW Y,(Y)
      008884 72 A2 00 02      [ 2] 1744         SUBW Y,#CELLL
      008888 FF               [ 2] 1745         LDW (X),Y
      008889 81               [ 4] 1746         RET
                                   1747 
                                   1748 ;       CELLS   ( n -- n )
                                   1749 ;       Multiply tos by 2.
      00888A 88 7D                 1750         .word      LINK
                           00080C  1751 LINK = . 
      00888C 02                    1752         .byte       2
      00888D 32 2A                 1753         .ascii     "2*"
      00888F                       1754 CELLS:
      00888F 90 93            [ 1] 1755         LDW Y,X
      008891 90 FE            [ 2] 1756 	LDW Y,(Y)
      008893 90 58            [ 2] 1757         SLAW Y
      008895 FF               [ 2] 1758         LDW (X),Y
      008896 81               [ 4] 1759         RET
                                   1760 
                                   1761 ;       1+      ( a -- a )
                                   1762 ;       Add cell size in byte to address.
      008897 88 8C                 1763         .word      LINK
                           000819  1764 LINK = . 
      008899 02                    1765         .byte      2
      00889A 31 2B                 1766         .ascii     "1+"
      00889C                       1767 ONEP:
      00889C 90 93            [ 1] 1768         LDW Y,X
      00889E 90 FE            [ 2] 1769 	LDW Y,(Y)
      0088A0 90 5C            [ 2] 1770         INCW Y
      0088A2 FF               [ 2] 1771         LDW (X),Y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



      0088A3 81               [ 4] 1772         RET
                                   1773 
                                   1774 ;       1-      ( a -- a )
                                   1775 ;       Subtract 2 from address.
      0088A4 88 99                 1776         .word      LINK
                           000826  1777 LINK = . 
      0088A6 02                    1778         .byte      2
      0088A7 31 2D                 1779         .ascii     "1-"
      0088A9                       1780 ONEM:
      0088A9 90 93            [ 1] 1781         LDW Y,X
      0088AB 90 FE            [ 2] 1782 	LDW Y,(Y)
      0088AD 90 5A            [ 2] 1783         DECW Y
      0088AF FF               [ 2] 1784         LDW (X),Y
      0088B0 81               [ 4] 1785         RET
                                   1786 
                                   1787 ;       2/      ( n -- n )
                                   1788 ;       Multiply tos by 2.
      0088B1 88 A6                 1789         .word      LINK
                           000833  1790 LINK = . 
      0088B3 02                    1791         .byte      2
      0088B4 32 2F                 1792         .ascii     "2/"
      0088B6                       1793 TWOSL:
      0088B6 90 93            [ 1] 1794         LDW Y,X
      0088B8 90 FE            [ 2] 1795 	LDW Y,(Y)
      0088BA 90 57            [ 2] 1796         SRAW Y
      0088BC FF               [ 2] 1797         LDW (X),Y
      0088BD 81               [ 4] 1798         RET
                                   1799 
                                   1800 ;       BL      ( -- 32 )
                                   1801 ;       Return 32,  blank character.
      0088BE 88 B3                 1802         .word      LINK
                           000840  1803 LINK = . 
      0088C0 02                    1804         .byte      2
      0088C1 42 4C                 1805         .ascii     "BL"
      0088C3                       1806 BLANK:
      0088C3 1D 00 02         [ 2] 1807         SUBW X,#2
      0088C6 90 AE 00 20      [ 2] 1808 	LDW Y,#32
      0088CA FF               [ 2] 1809         LDW (X),Y
      0088CB 81               [ 4] 1810         RET
                                   1811 
                                   1812 ;         0     ( -- 0)
                                   1813 ;         Return 0.
      0088CC 88 C0                 1814         .word      LINK
                           00084E  1815 LINK = . 
      0088CE 01                    1816         .byte       1
      0088CF 30                    1817         .ascii     "0"
      0088D0                       1818 ZERO:
      0088D0 1D 00 02         [ 2] 1819         SUBW X,#2
      0088D3 90 5F            [ 1] 1820 	CLRW Y
      0088D5 FF               [ 2] 1821         LDW (X),Y
      0088D6 81               [ 4] 1822         RET
                                   1823 
                                   1824 ;         1     ( -- 1)
                                   1825 ;         Return 1.
      0088D7 88 CE                 1826         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



                           000859  1827 LINK = . 
      0088D9 01                    1828         .byte       1
      0088DA 31                    1829         .ascii     "1"
      0088DB                       1830 ONE:
      0088DB 1D 00 02         [ 2] 1831         SUBW X,#2
      0088DE 90 AE 00 01      [ 2] 1832 	LDW Y,#1
      0088E2 FF               [ 2] 1833         LDW (X),Y
      0088E3 81               [ 4] 1834         RET
                                   1835 
                                   1836 ;         -1    ( -- -1)
                                   1837 ;         Return 32,  blank character.
      0088E4 88 D9                 1838         .word      LINK
                           000866  1839 LINK = . 
      0088E6 02                    1840         .byte       2
      0088E7 2D 31                 1841         .ascii     "-1"
      0088E9                       1842 MONE:
      0088E9 1D 00 02         [ 2] 1843         SUBW X,#2
      0088EC 90 AE FF FF      [ 2] 1844 	LDW Y,#0xFFFF
      0088F0 FF               [ 2] 1845         LDW (X),Y
      0088F1 81               [ 4] 1846         RET
                                   1847 
                                   1848 ;       >CHAR   ( c -- c )
                                   1849 ;       Filter non-printing characters.
      0088F2 88 E6                 1850         .word      LINK
                           000874  1851 LINK = . 
      0088F4 05                    1852         .byte      5
      0088F5 3E 43 48 41 52        1853         .ascii     ">CHAR"
      0088FA                       1854 TCHAR:
                           000001  1855 .if CONVERT_TO_CODE
      0088FA E6 01            [ 1] 1856         ld a,(1,x)
      0088FC A1 20            [ 1] 1857         cp a,#32  
      0088FE 2B 05            [ 1] 1858         jrmi 1$ 
      008900 A1 7F            [ 1] 1859         cp a,#127 
      008902 2A 01            [ 1] 1860         jrpl 1$ 
      008904 81               [ 4] 1861         ret 
      008905 A6 5F            [ 1] 1862 1$:     ld a,#'_ 
      008907 E7 01            [ 1] 1863         ld (1,x),a 
      008909 81               [ 4] 1864         ret 
                           000000  1865 .else
                                   1866         CALL     DOLIT
                                   1867         .word       0x7F
                                   1868         CALL     ANDD
                                   1869         CALL     DUPP    ;mask msb
                                   1870         CALL     DOLIT
                                   1871         .word      127
                                   1872         CALL     BLANK
                                   1873         CALL     WITHI   ;check for printable
                                   1874         CALL     QBRAN
                                   1875         .word    TCHA1
                                   1876         CALL     DROP
                                   1877         CALL     DOLIT
                                   1878         .word     0x5F		; "_"     ;replace non-printables
                                   1879 .endif 
      00890A 81               [ 4] 1880 TCHA1:  RET
                                   1881 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



                                   1882 ;       DEPTH   ( -- n )
                                   1883 ;       Return  depth of  data stack.
      00890B 88 F4                 1884         .word      LINK
                           00088D  1885 LINK = . 
      00890D 05                    1886         .byte      5
      00890E 44 45 50 54 48        1887         .ascii     "DEPTH"
      008913                       1888 DEPTH: 
      008913 90 BE 26         [ 2] 1889         LDW Y,SP0    ;save data stack ptr
      008916 BF 1E            [ 2] 1890 	LDW XTEMP,X
      008918 72 B2 00 1E      [ 2] 1891         SUBW Y,XTEMP     ;#bytes = SP0 - X
      00891C 90 57            [ 2] 1892         SRAW Y    ;Y = #stack items
                           000001  1893 .if PICATOUT_MOD
                                   1894 ; why ? 
                                   1895 ;      	DECW Y
                                   1896 .endif 
      00891E 1D 00 02         [ 2] 1897 	SUBW X,#2
      008921 FF               [ 2] 1898         LDW (X),Y     ; if neg, underflow
      008922 81               [ 4] 1899         RET
                                   1900 
                                   1901 ;       PICK    ( ... +n -- ... w )
                                   1902 ;       Copy  nth stack item to tos.
      008923 89 0D                 1903         .word      LINK
                           0008A5  1904 LINK = . 
      008925 04                    1905         .byte      4
      008926 50 49 43 4B           1906         .ascii     "PICK"
      00892A                       1907 PICK:
      00892A 90 93            [ 1] 1908         LDW Y,X   ;D = n1
      00892C 90 FE            [ 2] 1909         LDW Y,(Y)
      00892E 90 58            [ 2] 1910         SLAW Y
      008930 BF 1E            [ 2] 1911         LDW XTEMP,X
      008932 72 B9 00 1E      [ 2] 1912         ADDW Y,XTEMP
      008936 90 FE            [ 2] 1913         LDW Y,(Y)
      008938 FF               [ 2] 1914         LDW (X),Y
      008939 81               [ 4] 1915         RET
                                   1916 
                                   1917 ;; Memory access
                                   1918 
                                   1919 ;       +!      ( n a -- )
                                   1920 ;       Add n to  contents at address a.
      00893A 89 25                 1921         .word      LINK
                           0008BC  1922 LINK = . 
      00893C 02                    1923         .byte      2
      00893D 2B 21                 1924         .ascii     "+!"
      00893F                       1925 PSTOR:
                           000001  1926 .if CONVERT_TO_CODE
      00893F 90 93            [ 1] 1927         ldw y,x 
      008941 90 FE            [ 2] 1928         ldw y,(y)
      008943 90 BF 20         [ 2] 1929         ldw YTEMP,y  ; address
      008946 90 FE            [ 2] 1930         ldw y,(y)  
      008948 90 89            [ 2] 1931         pushw y  ; value at address 
      00894A 90 93            [ 1] 1932         ldw y,x 
      00894C 90 EE 02         [ 2] 1933         ldw y,(2,y) ; n 
      00894F 72 F9 01         [ 2] 1934         addw y,(1,sp) ; n+value
      008952 91 CF 20         [ 5] 1935         ldw [YTEMP],y ;  a!
      008955 90 85            [ 2] 1936         popw y    ;drop local var
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



      008957 1C 00 04         [ 2] 1937         addw x,#4 ; DDROP 
      00895A 81               [ 4] 1938         ret 
                           000000  1939 .else
                                   1940         CALL	SWAPP
                                   1941         CALL	OVER
                                   1942         CALL	AT
                                   1943         CALL	PLUS
                                   1944         CALL	SWAPP
                                   1945         JP	STORE
                                   1946 .endif 
                                   1947 
                                   1948 ;       2!      ( d a -- )
                                   1949 ;       Store  double integer to address a.
      00895B 89 3C                 1950         .word      LINK
                           0008DD  1951 LINK = . 
      00895D 02                    1952         .byte      2
      00895E 32 21                 1953         .ascii     "2!"
      008960                       1954 DSTOR:
                           000001  1955 .if CONVERT_TO_CODE
      008960 90 93            [ 1] 1956         ldw y,x 
      008962 90 FE            [ 2] 1957         ldw y,(y)
      008964 90 BF 20         [ 2] 1958         ldw YTEMP,y ; address 
      008967 1C 00 02         [ 2] 1959         addw x,#CELLL ; drop a 
      00896A 90 93            [ 1] 1960         ldw y,x 
      00896C 90 FE            [ 2] 1961         ldw y,(y) ; hi word 
      00896E 89               [ 2] 1962         pushw x 
      00896F EE 02            [ 2] 1963         ldw x,(2,x) ; lo word 
      008971 91 CF 20         [ 5] 1964         ldw [YTEMP],y
      008974 90 93            [ 1] 1965         ldw y,x 
      008976 AE 00 02         [ 2] 1966         ldw x,#2 
      008979 92 DF 20         [ 5] 1967         ldw ([YTEMP],x),y 
      00897C 85               [ 2] 1968         popw x 
      00897D 1C 00 04         [ 2] 1969         addw x,#4 ; DDROP 
      008980 81               [ 4] 1970         ret 
                           000000  1971 .else
                                   1972         CALL	SWAPP
                                   1973         CALL	OVER
                                   1974         CALL	STORE
                                   1975         CALL	CELLP
                                   1976         JP	STORE
                                   1977 .endif 
                                   1978 ;       2@      ( a -- d )
                                   1979 ;       Fetch double integer from address a.
      008981 89 5D                 1980         .word      LINK
                           000903  1981 LINK = . 
      008983 02                    1982         .byte      2
      008984 32 40                 1983         .ascii     "2@"
      008986                       1984 DAT:
                           000001  1985 .if CONVERT_TO_CODE
      008986 90 93            [ 1] 1986         ldw y,x 
      008988 90 FE            [ 2] 1987         ldw y,(y) ;address 
      00898A 90 BF 20         [ 2] 1988         ldw YTEMP,y 
      00898D 1D 00 02         [ 2] 1989         subw x,#CELLL ; space for udh 
      008990 91 CE 20         [ 5] 1990         ldw y,[YTEMP] ; udh 
      008993 FF               [ 2] 1991         ldw (x),y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



      008994 90 AE 00 02      [ 2] 1992         ldw y,#2
      008998 91 DE 20         [ 5] 1993         ldw y,([YTEMP],y) ; udl 
      00899B EF 02            [ 2] 1994         ldw (2,x),y
      00899D 81               [ 4] 1995         ret 
                           000000  1996 .else 
                                   1997         CALL	DUPP
                                   1998         CALL	CELLP
                                   1999         CALL	AT
                                   2000         CALL	SWAPP
                                   2001         JP	AT
                                   2002 .endif 
                                   2003 
                                   2004 ;       COUNT   ( b -- b +n )
                                   2005 ;       Return count byte of a string
                                   2006 ;       and add 1 to byte address.
      00899E 89 83                 2007         .word      LINK
                           000920  2008 LINK = . 
      0089A0 05                    2009         .byte      5
      0089A1 43 4F 55 4E 54        2010         .ascii     "COUNT"
      0089A6                       2011 COUNT:
                           000001  2012 .if CONVERT_TO_CODE
      0089A6 90 93            [ 1] 2013         ldw y,x 
      0089A8 90 FE            [ 2] 2014         ldw y,(y) ; address 
      0089AA 90 F6            [ 1] 2015         ld a,(y)  ; count 
      0089AC 90 5C            [ 2] 2016         incw y 
      0089AE FF               [ 2] 2017         ldw (x),y 
      0089AF 1D 00 02         [ 2] 2018         subw x,#CELLL 
      0089B2 E7 01            [ 1] 2019         ld (1,x),a 
      0089B4 7F               [ 1] 2020         clr (x)
      0089B5 81               [ 4] 2021         ret 
                           000000  2022 .else 
                                   2023         CALL     DUPP
                                   2024         CALL     ONEP
                                   2025         CALL     SWAPP
                                   2026         JP     CAT
                                   2027 .endif 
                                   2028 
                                   2029 ;       HERE    ( -- a )
                                   2030 ;       Return  top of  variables
      0089B6 89 A0                 2031         .word      LINK
                           000938  2032 LINK = . 
      0089B8 04                    2033         .byte      4
      0089B9 48 45 52 45           2034         .ascii     "HERE"
      0089BD                       2035 HERE:
                           000001  2036 .if CONVERT_TO_CODE
      0089BD 90 AE 00 16      [ 2] 2037       	ldw y,#UVP 
      0089C1 90 FE            [ 2] 2038         ldw y,(y)
      0089C3 1D 00 02         [ 2] 2039         subw x,#CELLL 
      0089C6 FF               [ 2] 2040         ldw (x),y 
      0089C7 81               [ 4] 2041         ret 
                           000000  2042 .else
                                   2043         CALL     VPP
                                   2044         JP     AT
                                   2045 .endif 
                                   2046 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



                                   2047 ;       PAD     ( -- a )
                                   2048 ;       Return address of text buffer
                                   2049 ;       above  code dictionary.
      0089C8 89 B8                 2050         .word      LINK
                           00094A  2051 LINK = . 
      0089CA 03                    2052         .byte      3
      0089CB 50 41 44              2053         .ascii     "PAD"
      0089CE                       2054 PAD:
      0089CE CD 89 BD         [ 4] 2055         CALL     HERE
      0089D1 CD 82 B8         [ 4] 2056         CALL     DOLIT
      0089D4 00 50                 2057         .word      80
      0089D6 CC 85 BD         [ 2] 2058         JP     PLUS
                                   2059 
                                   2060 ;       TIB     ( -- a )
                                   2061 ;       Return address of terminal input buffer.
      0089D9 89 CA                 2062         .word      LINK
                           00095B  2063 LINK = . 
      0089DB 03                    2064         .byte      3
      0089DC 54 49 42              2065         .ascii     "TIB"
      0089DF                       2066 TIB:
      0089DF CD 84 D2         [ 4] 2067         CALL     NTIB
      0089E2 CD 88 71         [ 4] 2068         CALL     CELLP
      0089E5 CC 83 40         [ 2] 2069         JP     AT
                                   2070 
                                   2071 ;       @EXECUTE        ( a -- )
                                   2072 ;       Execute vector stored in address a.
      0089E8 89 DB                 2073         .word      LINK
                           00096A  2074 LINK = . 
      0089EA 08                    2075         .byte      8
      0089EB 40 45 58 45 43 55 54  2076         .ascii     "@EXECUTE"
             45
      0089F3                       2077 ATEXE:
      0089F3 CD 83 40         [ 4] 2078         CALL     AT
      0089F6 CD 85 6C         [ 4] 2079         CALL     QDUP    ;?address or zero
      0089F9 CD 82 EB         [ 4] 2080         CALL     QBRAN
      0089FC 8A 01                 2081         .word      EXE1
      0089FE CD 83 12         [ 4] 2082         CALL     EXECU   ;execute if non-zero
      008A01 81               [ 4] 2083 EXE1:   RET     ;do nothing if zero
                                   2084 
                                   2085 ;       CMOVE   ( b1 b2 u -- )
                                   2086 ;       Copy u bytes from b1 to b2.
      008A02 89 EA                 2087         .word      LINK
                           000984  2088 LINK = . 
      008A04 05                    2089         .byte      5
      008A05 43 4D 4F 56 45        2090         .ascii     "CMOVE"
      008A0A                       2091 CMOVE:
      008A0A CD 83 B0         [ 4] 2092         CALL	TOR
      008A0D CD 83 02         [ 4] 2093         CALL	BRAN
      008A10 8A 2A                 2094         .word	CMOV2
      008A12 CD 83 B0         [ 4] 2095 CMOV1:	CALL	TOR
      008A15 CD 83 E7         [ 4] 2096         CALL	DUPP
      008A18 CD 83 5E         [ 4] 2097         CALL	CAT
      008A1B CD 83 A4         [ 4] 2098         CALL	RAT
      008A1E CD 83 4D         [ 4] 2099         CALL	CSTOR
      008A21 CD 88 9C         [ 4] 2100         CALL	ONEP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



      008A24 CD 83 91         [ 4] 2101         CALL	RFROM
      008A27 CD 88 9C         [ 4] 2102         CALL	ONEP
      008A2A CD 82 CC         [ 4] 2103 CMOV2:	CALL	DONXT
      008A2D 8A 12                 2104         .word	CMOV1
      008A2F CC 85 9D         [ 2] 2105         JP	DDROP
                                   2106 
                                   2107 ;       FILL    ( b u c -- )
                                   2108 ;       Fill u bytes of character c
                                   2109 ;       to area beginning at b.
      008A32 8A 04                 2110         .word       LINK
                           0009B4  2111 LINK = . 
      008A34 04                    2112         .byte       4
      008A35 46 49 4C 4C           2113         .ascii     "FILL"
      008A39                       2114 FILL:
                           000001  2115 .if CONVERT_TO_CODE
      008A39 90 93            [ 1] 2116         ldw y,x 
      008A3B 90 E6 01         [ 1] 2117         ld a,(1,y) ; c 
      008A3E 1C 00 02         [ 2] 2118         addw x,#CELLL ; drop c 
      008A41 90 93            [ 1] 2119         ldw y,x 
      008A43 90 FE            [ 2] 2120         ldw y,(y) ; count
      008A45 90 89            [ 2] 2121         pushw y 
      008A47 1C 00 02         [ 2] 2122         addw x,#CELLL ; drop u 
      008A4A 90 93            [ 1] 2123         ldw y,x 
      008A4C 1C 00 02         [ 2] 2124         addw x,#CELLL ; drop b 
      008A4F 90 FE            [ 2] 2125         ldw y,(y) ; address
      008A51 90 BF 20         [ 2] 2126         ldw YTEMP,y
      008A54 90 85            [ 2] 2127         popw y ; count 
      008A56                       2128 FILL1:  
      008A56 92 C7 20         [ 4] 2129         ld [YTEMP],a 
      008A59 3C 21            [ 1] 2130         inc YTEMP+1
      008A5B 24 02            [ 1] 2131         jrnc FILL2 
      008A5D 3C 20            [ 1] 2132         inc YTEMP
      008A5F                       2133 FILL2: 
      008A5F 90 5A            [ 2] 2134         decw y ; count 
      008A61 26 F3            [ 1] 2135         jrne FILL1  
      008A63 81               [ 4] 2136         ret 
                           000000  2137 .else 
                                   2138         CALL	SWAPP
                                   2139         CALL	TOR
                                   2140         CALL	SWAPP
                                   2141         CALL	BRAN
                                   2142         .word	FILL2
                                   2143 FILL1:	CALL	DDUP
                                   2144         CALL	CSTOR
                                   2145         CALL	ONEP
                                   2146 FILL2:	CALL	DONXT
                                   2147         .word	FILL1
                                   2148         JP	DDROP
                                   2149 .endif
                                   2150 
                                   2151 ;       ERASE   ( b u -- )
                                   2152 ;       Erase u bytes beginning at b.
      008A64 8A 34                 2153         .word      LINK
                           0009E6  2154 LINK = . 
      008A66 05                    2155         .byte      5
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



      008A67 45 52 41 53 45        2156         .ascii     "ERASE"
      008A6C                       2157 ERASE:
                           000001  2158 .if CONVERT_TO_CODE
      008A6C 90 5F            [ 1] 2159         clrw y 
      008A6E 1D 00 02         [ 2] 2160         subw x,#CELLL 
      008A71 FF               [ 2] 2161         ldw (x),y 
      008A72 CC 8A 39         [ 2] 2162         jp FILL 
                           000000  2163 .else 
                                   2164         CALL     ZERO
                                   2165         JP     FILL
                                   2166 .endif 
                                   2167 ;       PACK0x   ( b u a -- a )
                                   2168 ;       Build a counted string with
                                   2169 ;       u characters from b. Null fill.
      008A75 8A 66                 2170         .word      LINK
                           0009F7  2171 LINK = . 
      008A77 05                    2172         .byte      5
      008A78 50 41 43 4B 30 58     2173         .ascii     "PACK0X"
      008A7E                       2174 PACKS:
      008A7E CD 83 E7         [ 4] 2175         CALL     DUPP
      008A81 CD 83 B0         [ 4] 2176         CALL     TOR     ;strings only on cell boundary
      008A84 CD 85 A8         [ 4] 2177         CALL     DDUP
      008A87 CD 83 4D         [ 4] 2178         CALL     CSTOR
      008A8A CD 88 9C         [ 4] 2179         CALL     ONEP ;save count
      008A8D CD 83 F7         [ 4] 2180         CALL     SWAPP
      008A90 CD 8A 0A         [ 4] 2181         CALL     CMOVE
      008A93 CD 83 91         [ 4] 2182         CALL     RFROM
      008A96 81               [ 4] 2183         RET
                                   2184 
                                   2185 ;; Numeric output, single precision
                                   2186 
                                   2187 ;       DIGIT   ( u -- c )
                                   2188 ;       Convert digit u to a character.
      008A97 8A 77                 2189         .word      LINK
                           000A19  2190 LINK = . 
      008A99 05                    2191         .byte      5
      008A9A 44 49 47 49 54        2192         .ascii     "DIGIT"
      008A9F                       2193 DIGIT:
      008A9F CD 82 B8         [ 4] 2194         CALL	DOLIT
      008AA2 00 09                 2195         .word	9
      008AA4 CD 84 11         [ 4] 2196         CALL	OVER
      008AA7 CD 86 80         [ 4] 2197         CALL	LESS
      008AAA CD 82 B8         [ 4] 2198         CALL	DOLIT
      008AAD 00 07                 2199         .word	7
      008AAF CD 84 33         [ 4] 2200         CALL	ANDD
      008AB2 CD 85 BD         [ 4] 2201         CALL	PLUS
      008AB5 CD 82 B8         [ 4] 2202         CALL	DOLIT
      008AB8 00 30                 2203         .word	48	;'0'
      008ABA CC 85 BD         [ 2] 2204         JP	PLUS
                                   2205 
                                   2206 ;       EXTRACT ( n base -- n c )
                                   2207 ;       Extract least significant digit from n.
      008ABD 8A 99                 2208         .word      LINK
                           000A3F  2209 LINK = . 
      008ABF 07                    2210         .byte      7
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



      008AC0 45 58 54 52 41 43 54  2211         .ascii     "EXTRACT"
      008AC7                       2212 EXTRC:
      008AC7 CD 88 D0         [ 4] 2213         CALL     ZERO
      008ACA CD 83 F7         [ 4] 2214         CALL     SWAPP
      008ACD CD 86 F8         [ 4] 2215         CALL     UMMOD
      008AD0 CD 83 F7         [ 4] 2216         CALL     SWAPP
      008AD3 CC 8A 9F         [ 2] 2217         JP     DIGIT
                                   2218 
                                   2219 ;       <#      ( -- )
                                   2220 ;       Initiate  numeric output process.
      008AD6 8A BF                 2221         .word      LINK
                           000A58  2222 LINK = . 
      008AD8 02                    2223         .byte      2
      008AD9 3C 23                 2224         .ascii     "<#"
      008ADB                       2225 BDIGS:
      008ADB CD 89 CE         [ 4] 2226         CALL     PAD
      008ADE CD 85 02         [ 4] 2227         CALL     HLD
      008AE1 CC 83 29         [ 2] 2228         JP     STORE
                                   2229 
                                   2230 ;       HOLD    ( c -- )
                                   2231 ;       Insert a character into output string.
      008AE4 8A D8                 2232         .word      LINK
                           000A66  2233 LINK = . 
      008AE6 04                    2234         .byte      4
      008AE7 48 4F 4C 44           2235         .ascii     "HOLD"
      008AEB                       2236 HOLD:
      008AEB CD 85 02         [ 4] 2237         CALL     HLD
      008AEE CD 83 40         [ 4] 2238         CALL     AT
      008AF1 CD 88 A9         [ 4] 2239         CALL     ONEM
      008AF4 CD 83 E7         [ 4] 2240         CALL     DUPP
      008AF7 CD 85 02         [ 4] 2241         CALL     HLD
      008AFA CD 83 29         [ 4] 2242         CALL     STORE
      008AFD CC 83 4D         [ 2] 2243         JP     CSTOR
                                   2244 
                                   2245 ;       #       ( u -- u )
                                   2246 ;       Extract one digit from u and
                                   2247 ;       append digit to output string.
      008B00 8A E6                 2248         .word      LINK
                           000A82  2249 LINK = . 
      008B02 01                    2250         .byte      1
      008B03 23                    2251         .ascii     "#"
      008B04                       2252 DIG:
      008B04 CD 84 A4         [ 4] 2253         CALL     BASE
      008B07 CD 83 40         [ 4] 2254         CALL     AT
      008B0A CD 8A C7         [ 4] 2255         CALL     EXTRC
      008B0D CC 8A EB         [ 2] 2256         JP     HOLD
                                   2257 
                                   2258 ;       #S      ( u -- 0 )
                                   2259 ;       Convert u until all digits
                                   2260 ;       are added to output string.
      008B10 8B 02                 2261         .word      LINK
                           000A92  2262 LINK = . 
      008B12 02                    2263         .byte      2
      008B13 23 53                 2264         .ascii     "#S"
      008B15                       2265 DIGS:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



      008B15 CD 8B 04         [ 4] 2266 DIGS1:  CALL     DIG
      008B18 CD 83 E7         [ 4] 2267         CALL     DUPP
      008B1B CD 82 EB         [ 4] 2268         CALL     QBRAN
      008B1E 8B 22                 2269         .word      DIGS2
      008B20 20 F3            [ 2] 2270         JRA     DIGS1
      008B22 81               [ 4] 2271 DIGS2:  RET
                                   2272 
                                   2273 ;       SIGN    ( n -- )
                                   2274 ;       Add a minus sign to
                                   2275 ;       numeric output string.
      008B23 8B 12                 2276         .word      LINK
                           000AA5  2277 LINK = . 
      008B25 04                    2278         .byte      4
      008B26 53 49 47 4E           2279         .ascii     "SIGN"
      008B2A                       2280 SIGN:
      008B2A CD 84 20         [ 4] 2281         CALL     ZLESS
      008B2D CD 82 EB         [ 4] 2282         CALL     QBRAN
      008B30 8B 3A                 2283         .word      SIGN1
      008B32 CD 82 B8         [ 4] 2284         CALL     DOLIT
      008B35 00 2D                 2285         .word      45	;"-"
      008B37 CC 8A EB         [ 2] 2286         JP     HOLD
      008B3A 81               [ 4] 2287 SIGN1:  RET
                                   2288 
                                   2289 ;       #>      ( w -- b u )
                                   2290 ;       Prepare output string.
      008B3B 8B 25                 2291         .word      LINK
                           000ABD  2292 LINK = . 
      008B3D 02                    2293         .byte      2
      008B3E 23 3E                 2294         .ascii     "#>"
      008B40                       2295 EDIGS:
      008B40 CD 83 DD         [ 4] 2296         CALL     DROP
      008B43 CD 85 02         [ 4] 2297         CALL     HLD
      008B46 CD 83 40         [ 4] 2298         CALL     AT
      008B49 CD 89 CE         [ 4] 2299         CALL     PAD
      008B4C CD 84 11         [ 4] 2300         CALL     OVER
      008B4F CC 86 1B         [ 2] 2301         JP     SUBB
                                   2302 
                                   2303 ;       str     ( w -- b u )
                                   2304 ;       Convert a signed integer
                                   2305 ;       to a numeric string.
      008B52 8B 3D                 2306         .word      LINK
                           000AD4  2307 LINK = . 
      008B54 03                    2308         .byte      3
      008B55 53 54 52              2309         .ascii     "STR"
      008B58                       2310 STR:
      008B58 CD 83 E7         [ 4] 2311         CALL     DUPP
      008B5B CD 83 B0         [ 4] 2312         CALL     TOR
      008B5E CD 86 35         [ 4] 2313         CALL     ABSS
      008B61 CD 8A DB         [ 4] 2314         CALL     BDIGS
      008B64 CD 8B 15         [ 4] 2315         CALL     DIGS
      008B67 CD 83 91         [ 4] 2316         CALL     RFROM
      008B6A CD 8B 2A         [ 4] 2317         CALL     SIGN
      008B6D CC 8B 40         [ 2] 2318         JP     EDIGS
                                   2319 
                                   2320 ;       HEX     ( -- )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



                                   2321 ;       Use radix 16 as base for
                                   2322 ;       numeric conversions.
      008B70 8B 54                 2323         .word      LINK
                           000AF2  2324 LINK = . 
      008B72 03                    2325         .byte      3
      008B73 48 45 58              2326         .ascii     "HEX"
      008B76                       2327 HEX:
      008B76 CD 82 B8         [ 4] 2328         CALL     DOLIT
      008B79 00 10                 2329         .word      16
      008B7B CD 84 A4         [ 4] 2330         CALL     BASE
      008B7E CC 83 29         [ 2] 2331         JP     STORE
                                   2332 
                                   2333 ;       DECIMAL ( -- )
                                   2334 ;       Use radix 10 as base
                                   2335 ;       for numeric conversions.
      008B81 8B 72                 2336         .word      LINK
                           000B03  2337 LINK = . 
      008B83 07                    2338         .byte      7
      008B84 44 45 43 49 4D 41 4C  2339         .ascii     "DECIMAL"
      008B8B                       2340 DECIM:
      008B8B CD 82 B8         [ 4] 2341         CALL     DOLIT
      008B8E 00 0A                 2342         .word      10
      008B90 CD 84 A4         [ 4] 2343         CALL     BASE
      008B93 CC 83 29         [ 2] 2344         JP     STORE
                                   2345 
                                   2346 ;; Numeric input, single precision
                                   2347 
                                   2348 ;       DIGIT?  ( c base -- u t )
                                   2349 ;       Convert a character to its numeric
                                   2350 ;       value. A flag indicates success.
      008B96 8B 83                 2351         .word      LINK
                           000B18  2352 LINK = . 
      008B98 06                    2353         .byte       6
      008B99 44 49 47 49 54 3F     2354         .ascii     "DIGIT?"
      008B9F                       2355 DIGTQ:
      008B9F CD 83 B0         [ 4] 2356         CALL     TOR
      008BA2 CD 82 B8         [ 4] 2357         CALL     DOLIT
      008BA5 00 30                 2358         .word     48	; "0"
      008BA7 CD 86 1B         [ 4] 2359         CALL     SUBB
      008BAA CD 82 B8         [ 4] 2360         CALL     DOLIT
      008BAD 00 09                 2361         .word      9
      008BAF CD 84 11         [ 4] 2362         CALL     OVER
      008BB2 CD 86 80         [ 4] 2363         CALL     LESS
      008BB5 CD 82 EB         [ 4] 2364         CALL     QBRAN
      008BB8 8B D0                 2365         .word      DGTQ1
      008BBA CD 82 B8         [ 4] 2366         CALL     DOLIT
      008BBD 00 07                 2367         .word      7
      008BBF CD 86 1B         [ 4] 2368         CALL     SUBB
      008BC2 CD 83 E7         [ 4] 2369         CALL     DUPP
      008BC5 CD 82 B8         [ 4] 2370         CALL     DOLIT
      008BC8 00 0A                 2371         .word      10
      008BCA CD 86 80         [ 4] 2372         CALL     LESS
      008BCD CD 84 47         [ 4] 2373         CALL     ORR
      008BD0 CD 83 E7         [ 4] 2374 DGTQ1:  CALL     DUPP
      008BD3 CD 83 91         [ 4] 2375         CALL     RFROM
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



      008BD6 CC 86 62         [ 2] 2376         JP     ULESS
                                   2377 
                                   2378 ;       NUMBER? ( a -- n T | a F )
                                   2379 ;       Convert a number string to
                                   2380 ;       integer. Push a flag on tos.
      008BD9 8B 98                 2381         .word      LINK
                           000B5B  2382 LINK = . 
      008BDB 07                    2383         .byte      7
      008BDC 4E 55 4D 42 45 52 3F  2384         .ascii     "NUMBER?"
      008BE3                       2385 NUMBQ:
      008BE3 CD 84 A4         [ 4] 2386         CALL     BASE
      008BE6 CD 83 40         [ 4] 2387         CALL     AT
      008BE9 CD 83 B0         [ 4] 2388         CALL     TOR
      008BEC CD 88 D0         [ 4] 2389         CALL     ZERO
      008BEF CD 84 11         [ 4] 2390         CALL     OVER
      008BF2 CD 89 A6         [ 4] 2391         CALL     COUNT
      008BF5 CD 84 11         [ 4] 2392         CALL     OVER
      008BF8 CD 83 5E         [ 4] 2393         CALL     CAT
      008BFB CD 82 B8         [ 4] 2394         CALL     DOLIT
      008BFE 00 24                 2395         .word     36	; "0x"
      008C00 CD 86 43         [ 4] 2396         CALL     EQUAL
      008C03 CD 82 EB         [ 4] 2397         CALL     QBRAN
      008C06 8C 17                 2398         .word      NUMQ1
      008C08 CD 8B 76         [ 4] 2399         CALL     HEX
      008C0B CD 83 F7         [ 4] 2400         CALL     SWAPP
      008C0E CD 88 9C         [ 4] 2401         CALL     ONEP
      008C11 CD 83 F7         [ 4] 2402         CALL     SWAPP
      008C14 CD 88 A9         [ 4] 2403         CALL     ONEM
      008C17 CD 84 11         [ 4] 2404 NUMQ1:  CALL     OVER
      008C1A CD 83 5E         [ 4] 2405         CALL     CAT
      008C1D CD 82 B8         [ 4] 2406         CALL     DOLIT
      008C20 00 2D                 2407         .word     45	; "-"
      008C22 CD 86 43         [ 4] 2408         CALL     EQUAL
      008C25 CD 83 B0         [ 4] 2409         CALL     TOR
      008C28 CD 83 F7         [ 4] 2410         CALL     SWAPP
      008C2B CD 83 A4         [ 4] 2411         CALL     RAT
      008C2E CD 86 1B         [ 4] 2412         CALL     SUBB
      008C31 CD 83 F7         [ 4] 2413         CALL     SWAPP
      008C34 CD 83 A4         [ 4] 2414         CALL     RAT
      008C37 CD 85 BD         [ 4] 2415         CALL     PLUS
      008C3A CD 85 6C         [ 4] 2416         CALL     QDUP
      008C3D CD 82 EB         [ 4] 2417         CALL     QBRAN
      008C40 8C A1                 2418         .word      NUMQ6
      008C42 CD 88 A9         [ 4] 2419         CALL     ONEM
      008C45 CD 83 B0         [ 4] 2420         CALL     TOR
      008C48 CD 83 E7         [ 4] 2421 NUMQ2:  CALL     DUPP
      008C4B CD 83 B0         [ 4] 2422         CALL     TOR
      008C4E CD 83 5E         [ 4] 2423         CALL     CAT
      008C51 CD 84 A4         [ 4] 2424         CALL     BASE
      008C54 CD 83 40         [ 4] 2425         CALL     AT
      008C57 CD 8B 9F         [ 4] 2426         CALL     DIGTQ
      008C5A CD 82 EB         [ 4] 2427         CALL     QBRAN
      008C5D 8C 8F                 2428         .word      NUMQ4
      008C5F CD 83 F7         [ 4] 2429         CALL     SWAPP
      008C62 CD 84 A4         [ 4] 2430         CALL     BASE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      008C65 CD 83 40         [ 4] 2431         CALL     AT
      008C68 CD 88 1B         [ 4] 2432         CALL     STAR
      008C6B CD 85 BD         [ 4] 2433         CALL     PLUS
      008C6E CD 83 91         [ 4] 2434         CALL     RFROM
      008C71 CD 88 9C         [ 4] 2435         CALL     ONEP
      008C74 CD 82 CC         [ 4] 2436         CALL     DONXT
      008C77 8C 48                 2437         .word      NUMQ2
      008C79 CD 83 A4         [ 4] 2438         CALL     RAT
      008C7C CD 83 F7         [ 4] 2439         CALL     SWAPP
      008C7F CD 83 DD         [ 4] 2440         CALL     DROP
      008C82 CD 82 EB         [ 4] 2441         CALL     QBRAN
      008C85 8C 8A                 2442         .word      NUMQ3
      008C87 CD 85 E8         [ 4] 2443         CALL     NEGAT
      008C8A CD 83 F7         [ 4] 2444 NUMQ3:  CALL     SWAPP
      008C8D 20 0F            [ 2] 2445         JRA     NUMQ5
      008C8F CD 83 91         [ 4] 2446 NUMQ4:  CALL     RFROM
      008C92 CD 83 91         [ 4] 2447         CALL     RFROM
      008C95 CD 85 9D         [ 4] 2448         CALL     DDROP
      008C98 CD 85 9D         [ 4] 2449         CALL     DDROP
      008C9B CD 88 D0         [ 4] 2450         CALL     ZERO
      008C9E CD 83 E7         [ 4] 2451 NUMQ5:  CALL     DUPP
      008CA1 CD 83 91         [ 4] 2452 NUMQ6:  CALL     RFROM
      008CA4 CD 85 9D         [ 4] 2453         CALL     DDROP
      008CA7 CD 83 91         [ 4] 2454         CALL     RFROM
      008CAA CD 84 A4         [ 4] 2455         CALL     BASE
      008CAD CC 83 29         [ 2] 2456         JP     STORE
                                   2457 
                                   2458 ;; Basic I/O
                                   2459 
                                   2460 ;       KEY     ( -- c )
                                   2461 ;       Wait for and return an
                                   2462 ;       input character.
      008CB0 8B DB                 2463         .word      LINK
                           000C32  2464 LINK = . 
      008CB2 03                    2465         .byte      3
      008CB3 4B 45 59              2466         .ascii     "KEY"
      008CB6                       2467 KEY:
                           000001  2468 .if CONVERT_TO_CODE
      008CB6 72 0B 52 30 FB   [ 2] 2469         btjf UART1_SR,#UART_SR_RXNE,. 
      008CBB C6 52 31         [ 1] 2470         ld a,UART1_DR 
      008CBE 1D 00 02         [ 2] 2471         subw x,#CELLL 
      008CC1 E7 01            [ 1] 2472         ld (1,x),a 
      008CC3 7F               [ 1] 2473         clr (x)
      008CC4 81               [ 4] 2474         ret 
                           000000  2475 .else 
                                   2476 KEY1:   CALL     QKEY
                                   2477         CALL     QBRAN
                                   2478         .word      KEY1
                                   2479         RET
                                   2480 .endif 
                                   2481 
                                   2482 ;       NUF?    ( -- t )
                                   2483 ;       Return false if no input,
                                   2484 ;       else pause and if CR return true.
      008CC5 8C B2                 2485         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



                           000C47  2486 LINK = . 
      008CC7 04                    2487         .byte      4
      008CC8 4E 55 46 3F           2488         .ascii     "NUF?"
      008CCC                       2489 NUFQ:
      008CCC CD 82 84         [ 4] 2490         CALL     QKEY
      008CCF CD 83 E7         [ 4] 2491         CALL     DUPP
      008CD2 CD 82 EB         [ 4] 2492         CALL     QBRAN
      008CD5 8C E5                 2493         .word    NUFQ1
      008CD7 CD 85 9D         [ 4] 2494         CALL     DDROP
      008CDA CD 8C B6         [ 4] 2495         CALL     KEY
      008CDD CD 82 B8         [ 4] 2496         CALL     DOLIT
      008CE0 00 0D                 2497         .word      CRR
      008CE2 CC 86 43         [ 2] 2498         JP     EQUAL
      008CE5 81               [ 4] 2499 NUFQ1:  RET
                                   2500 
                                   2501 ;       SPACE   ( -- )
                                   2502 ;       Send  blank character to
                                   2503 ;       output device.
      008CE6 8C C7                 2504         .word      LINK
                           000C68  2505 LINK = . 
      008CE8 05                    2506         .byte      5
      008CE9 53 50 41 43 45        2507         .ascii     "SPACE"
      008CEE                       2508 SPACE:
      008CEE CD 88 C3         [ 4] 2509         CALL     BLANK
      008CF1 CC 82 A2         [ 2] 2510         JP     EMIT
                                   2511 
                                   2512 ;       SPACES  ( +n -- )
                                   2513 ;       Send n spaces to output device.
      008CF4 8C E8                 2514         .word      LINK
                           000C76  2515 LINK = . 
      008CF6 06                    2516         .byte      6
      008CF7 53 50 41 43 45 53     2517         .ascii     "SPACES"
      008CFD                       2518 SPACS:
      008CFD CD 88 D0         [ 4] 2519         CALL     ZERO
      008D00 CD 86 A0         [ 4] 2520         CALL     MAX
      008D03 CD 83 B0         [ 4] 2521         CALL     TOR
      008D06 20 03            [ 2] 2522         JRA      CHAR2
      008D08 CD 8C EE         [ 4] 2523 CHAR1:  CALL     SPACE
      008D0B CD 82 CC         [ 4] 2524 CHAR2:  CALL     DONXT
      008D0E 8D 08                 2525         .word    CHAR1
      008D10 81               [ 4] 2526         RET
                                   2527 
                                   2528 ;       TYPE    ( b u -- )
                                   2529 ;       Output u characters from b.
      008D11 8C F6                 2530         .word      LINK
                           000C93  2531 LINK = . 
      008D13 04                    2532         .byte      4
      008D14 54 59 50 45           2533         .ascii     "TYPE"
      008D18                       2534 TYPES:
      008D18 CD 83 B0         [ 4] 2535         CALL     TOR
      008D1B 20 0C            [ 2] 2536         JRA     TYPE2
      008D1D CD 83 E7         [ 4] 2537 TYPE1:  CALL     DUPP
      008D20 CD 83 5E         [ 4] 2538         CALL     CAT
      008D23 CD 82 A2         [ 4] 2539         CALL     EMIT
      008D26 CD 88 9C         [ 4] 2540         CALL     ONEP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



      008D29 CD 82 CC         [ 4] 2541 TYPE2:  CALL     DONXT
      008D2C 8D 1D                 2542         .word      TYPE1
      008D2E CC 83 DD         [ 2] 2543         JP     DROP
                                   2544 
                                   2545 ;       CR      ( -- )
                                   2546 ;       Output a carriage return
                                   2547 ;       and a line feed.
      008D31 8D 13                 2548         .word      LINK
                           000CB3  2549 LINK = . 
      008D33 02                    2550         .byte      2
      008D34 43 52                 2551         .ascii     "CR"
      008D36                       2552 CR:
      008D36 CD 82 B8         [ 4] 2553         CALL     DOLIT
      008D39 00 0D                 2554         .word      CRR
      008D3B CD 82 A2         [ 4] 2555         CALL     EMIT
      008D3E CD 82 B8         [ 4] 2556         CALL     DOLIT
      008D41 00 0A                 2557         .word      LF
      008D43 CC 82 A2         [ 2] 2558         JP     EMIT
                                   2559 
                                   2560 ;       do$     ( -- a )
                                   2561 ;       Return  address of a compiled
                                   2562 ;       string.
      008D46 8D 33                 2563         .word      LINK
                           000CC8  2564 LINK = . 
      008D48 43                    2565 	.byte      COMPO+3
      008D49 44 4F 24              2566         .ascii     "DO$"
      008D4C                       2567 DOSTR:
      008D4C CD 83 91         [ 4] 2568         CALL     RFROM
      008D4F CD 83 A4         [ 4] 2569         CALL     RAT
      008D52 CD 83 91         [ 4] 2570         CALL     RFROM
      008D55 CD 89 A6         [ 4] 2571         CALL     COUNT
      008D58 CD 85 BD         [ 4] 2572         CALL     PLUS
      008D5B CD 83 B0         [ 4] 2573         CALL     TOR
      008D5E CD 83 F7         [ 4] 2574         CALL     SWAPP
      008D61 CD 83 B0         [ 4] 2575         CALL     TOR
      008D64 81               [ 4] 2576         RET
                                   2577 
                                   2578 ;       $"|     ( -- a )
                                   2579 ;       Run time routine compiled by $".
                                   2580 ;       Return address of a compiled string.
      008D65 8D 48                 2581         .word      LINK
                           000CE7  2582 LINK = . 
      008D67 43                    2583 	.byte      COMPO+3
      008D68 24 22 7C              2584         .byte     '$','"','|'
      008D6B                       2585 STRQP:
      008D6B CD 8D 4C         [ 4] 2586         CALL     DOSTR
      008D6E 81               [ 4] 2587         RET
                                   2588 
                                   2589 ;       ."|     ( -- )
                                   2590 ;       Run time routine of ." .
                                   2591 ;       Output a compiled string.
      008D6F 8D 67                 2592         .word      LINK
                           000CF1  2593 LINK = . 
      008D71 43                    2594 	.byte      COMPO+3
      008D72 2E 22 7C              2595         .byte     '.','"','|'
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      008D75                       2596 DOTQP:
      008D75 CD 8D 4C         [ 4] 2597         CALL     DOSTR
      008D78 CD 89 A6         [ 4] 2598         CALL     COUNT
      008D7B CC 8D 18         [ 2] 2599         JP     TYPES
                                   2600 
                                   2601 ;       .R      ( n +n -- )
                                   2602 ;       Display an integer in a field
                                   2603 ;       of n columns, right justified.
      008D7E 8D 71                 2604         .word      LINK
                           000D00  2605 LINK = . 
      008D80 02                    2606         .byte      2
      008D81 2E 52                 2607         .ascii     ".R"
      008D83                       2608 DOTR:
      008D83 CD 83 B0         [ 4] 2609         CALL     TOR
      008D86 CD 8B 58         [ 4] 2610         CALL     STR
      008D89 CD 83 91         [ 4] 2611         CALL     RFROM
      008D8C CD 84 11         [ 4] 2612         CALL     OVER
      008D8F CD 86 1B         [ 4] 2613         CALL     SUBB
      008D92 CD 8C FD         [ 4] 2614         CALL     SPACS
      008D95 CC 8D 18         [ 2] 2615         JP     TYPES
                                   2616 
                                   2617 ;       U.R     ( u +n -- )
                                   2618 ;       Display an unsigned integer
                                   2619 ;       in n column, right justified.
      008D98 8D 80                 2620         .word      LINK
                           000D1A  2621 LINK = . 
      008D9A 03                    2622         .byte      3
      008D9B 55 2E 52              2623         .ascii     "U.R"
      008D9E                       2624 UDOTR:
      008D9E CD 83 B0         [ 4] 2625         CALL     TOR
      008DA1 CD 8A DB         [ 4] 2626         CALL     BDIGS
      008DA4 CD 8B 15         [ 4] 2627         CALL     DIGS
      008DA7 CD 8B 40         [ 4] 2628         CALL     EDIGS
      008DAA CD 83 91         [ 4] 2629         CALL     RFROM
      008DAD CD 84 11         [ 4] 2630         CALL     OVER
      008DB0 CD 86 1B         [ 4] 2631         CALL     SUBB
      008DB3 CD 8C FD         [ 4] 2632         CALL     SPACS
      008DB6 CC 8D 18         [ 2] 2633         JP     TYPES
                                   2634 
                                   2635 ;       U.      ( u -- )
                                   2636 ;       Display an unsigned integer
                                   2637 ;       in free format.
      008DB9 8D 9A                 2638         .word      LINK
                           000D3B  2639 LINK = . 
      008DBB 02                    2640         .byte      2
      008DBC 55 2E                 2641         .ascii     "U."
      008DBE                       2642 UDOT:
      008DBE CD 8A DB         [ 4] 2643         CALL     BDIGS
      008DC1 CD 8B 15         [ 4] 2644         CALL     DIGS
      008DC4 CD 8B 40         [ 4] 2645         CALL     EDIGS
      008DC7 CD 8C EE         [ 4] 2646         CALL     SPACE
      008DCA CC 8D 18         [ 2] 2647         JP     TYPES
                                   2648 
                                   2649 ;       .       ( w -- )
                                   2650 ;       Display an integer in free
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



                                   2651 ;       format, preceeded by a space.
      008DCD 8D BB                 2652         .word      LINK
                           000D4F  2653 LINK = . 
      008DCF 01                    2654         .byte      1
      008DD0 2E                    2655         .ascii     "."
      008DD1                       2656 DOT:
      008DD1 CD 84 A4         [ 4] 2657         CALL     BASE
      008DD4 CD 83 40         [ 4] 2658         CALL     AT
      008DD7 CD 82 B8         [ 4] 2659         CALL     DOLIT
      008DDA 00 0A                 2660         .word      10
      008DDC CD 84 5C         [ 4] 2661         CALL     XORR    ;?decimal
      008DDF CD 82 EB         [ 4] 2662         CALL     QBRAN
      008DE2 8D E7                 2663         .word      DOT1
      008DE4 CC 8D BE         [ 2] 2664         JP     UDOT
      008DE7 CD 8B 58         [ 4] 2665 DOT1:   CALL     STR
      008DEA CD 8C EE         [ 4] 2666         CALL     SPACE
      008DED CC 8D 18         [ 2] 2667         JP     TYPES
                                   2668 
                                   2669 ;       ?       ( a -- )
                                   2670 ;       Display contents in memory cell.
      008DF0 8D CF                 2671         .word      LINK
                                   2672         
                           000D72  2673 LINK = . 
      008DF2 01                    2674         .byte      1
      008DF3 3F                    2675         .ascii     "?"
      008DF4                       2676 QUEST:
      008DF4 CD 83 40         [ 4] 2677         CALL     AT
      008DF7 CC 8D D1         [ 2] 2678         JP     DOT
                                   2679 
                                   2680 ;; Parsing
                                   2681 
                                   2682 ;       parse   ( b u c -- b u delta ; <string> )
                                   2683 ;       Scan string delimited by c.
                                   2684 ;       Return found string and its offset.
      008DFA 8D F2                 2685         .word      LINK
                           000D7C  2686 LINK = . 
      008DFC 05                    2687         .byte      5
      008DFD 70 61 72 73 65        2688         .ascii     "parse"
      008E02                       2689 PARS:
      008E02 CD 84 B3         [ 4] 2690         CALL     TEMP
      008E05 CD 83 29         [ 4] 2691         CALL     STORE
      008E08 CD 84 11         [ 4] 2692         CALL     OVER
      008E0B CD 83 B0         [ 4] 2693         CALL     TOR
      008E0E CD 83 E7         [ 4] 2694         CALL     DUPP
      008E11 CD 82 EB         [ 4] 2695         CALL     QBRAN
      008E14 8E BA                 2696         .word    PARS8
      008E16 CD 88 A9         [ 4] 2697         CALL     ONEM
      008E19 CD 84 B3         [ 4] 2698         CALL     TEMP
      008E1C CD 83 40         [ 4] 2699         CALL     AT
      008E1F CD 88 C3         [ 4] 2700         CALL     BLANK
      008E22 CD 86 43         [ 4] 2701         CALL     EQUAL
      008E25 CD 82 EB         [ 4] 2702         CALL     QBRAN
      008E28 8E 5B                 2703         .word      PARS3
      008E2A CD 83 B0         [ 4] 2704         CALL     TOR
      008E2D CD 88 C3         [ 4] 2705 PARS1:  CALL     BLANK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



      008E30 CD 84 11         [ 4] 2706         CALL     OVER
      008E33 CD 83 5E         [ 4] 2707         CALL     CAT     ;skip leading blanks ONLY
      008E36 CD 86 1B         [ 4] 2708         CALL     SUBB
      008E39 CD 84 20         [ 4] 2709         CALL     ZLESS
      008E3C CD 85 D7         [ 4] 2710         CALL     INVER
      008E3F CD 82 EB         [ 4] 2711         CALL     QBRAN
      008E42 8E 58                 2712         .word      PARS2
      008E44 CD 88 9C         [ 4] 2713         CALL     ONEP
      008E47 CD 82 CC         [ 4] 2714         CALL     DONXT
      008E4A 8E 2D                 2715         .word      PARS1
      008E4C CD 83 91         [ 4] 2716         CALL     RFROM
      008E4F CD 83 DD         [ 4] 2717         CALL     DROP
      008E52 CD 88 D0         [ 4] 2718         CALL     ZERO
      008E55 CC 83 E7         [ 2] 2719         JP     DUPP
      008E58 CD 83 91         [ 4] 2720 PARS2:  CALL     RFROM
      008E5B CD 84 11         [ 4] 2721 PARS3:  CALL     OVER
      008E5E CD 83 F7         [ 4] 2722         CALL     SWAPP
      008E61 CD 83 B0         [ 4] 2723         CALL     TOR
      008E64 CD 84 B3         [ 4] 2724 PARS4:  CALL     TEMP
      008E67 CD 83 40         [ 4] 2725         CALL     AT
      008E6A CD 84 11         [ 4] 2726         CALL     OVER
      008E6D CD 83 5E         [ 4] 2727         CALL     CAT
      008E70 CD 86 1B         [ 4] 2728         CALL     SUBB    ;scan for delimiter
      008E73 CD 84 B3         [ 4] 2729         CALL     TEMP
      008E76 CD 83 40         [ 4] 2730         CALL     AT
      008E79 CD 88 C3         [ 4] 2731         CALL     BLANK
      008E7C CD 86 43         [ 4] 2732         CALL     EQUAL
      008E7F CD 82 EB         [ 4] 2733         CALL     QBRAN
      008E82 8E 87                 2734         .word      PARS5
      008E84 CD 84 20         [ 4] 2735         CALL     ZLESS
      008E87 CD 82 EB         [ 4] 2736 PARS5:  CALL     QBRAN
      008E8A 8E 9C                 2737         .word      PARS6
      008E8C CD 88 9C         [ 4] 2738         CALL     ONEP
      008E8F CD 82 CC         [ 4] 2739         CALL     DONXT
      008E92 8E 64                 2740         .word      PARS4
      008E94 CD 83 E7         [ 4] 2741         CALL     DUPP
      008E97 CD 83 B0         [ 4] 2742         CALL     TOR
      008E9A 20 0F            [ 2] 2743         JRA     PARS7
      008E9C CD 83 91         [ 4] 2744 PARS6:  CALL     RFROM
      008E9F CD 83 DD         [ 4] 2745         CALL     DROP
      008EA2 CD 83 E7         [ 4] 2746         CALL     DUPP
      008EA5 CD 88 9C         [ 4] 2747         CALL     ONEP
      008EA8 CD 83 B0         [ 4] 2748         CALL     TOR
      008EAB CD 84 11         [ 4] 2749 PARS7:  CALL     OVER
      008EAE CD 86 1B         [ 4] 2750         CALL     SUBB
      008EB1 CD 83 91         [ 4] 2751         CALL     RFROM
      008EB4 CD 83 91         [ 4] 2752         CALL     RFROM
      008EB7 CC 86 1B         [ 2] 2753         JP     SUBB
      008EBA CD 84 11         [ 4] 2754 PARS8:  CALL     OVER
      008EBD CD 83 91         [ 4] 2755         CALL     RFROM
      008EC0 CC 86 1B         [ 2] 2756         JP     SUBB
                                   2757 
                                   2758 ;       PARSE   ( c -- b u ; <string> )
                                   2759 ;       Scan input stream and return
                                   2760 ;       counted string delimited by c.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



      008EC3 8D FC                 2761         .word      LINK
                           000E45  2762 LINK = . 
      008EC5 05                    2763         .byte      5
      008EC6 50 41 52 53 45        2764         .ascii     "PARSE"
      008ECB                       2765 PARSE:
      008ECB CD 83 B0         [ 4] 2766         CALL     TOR
      008ECE CD 89 DF         [ 4] 2767         CALL     TIB
      008ED1 CD 84 C2         [ 4] 2768         CALL     INN
      008ED4 CD 83 40         [ 4] 2769         CALL     AT
      008ED7 CD 85 BD         [ 4] 2770         CALL     PLUS    ;current input buffer pointer
      008EDA CD 84 D2         [ 4] 2771         CALL     NTIB
      008EDD CD 83 40         [ 4] 2772         CALL     AT
      008EE0 CD 84 C2         [ 4] 2773         CALL     INN
      008EE3 CD 83 40         [ 4] 2774         CALL     AT
      008EE6 CD 86 1B         [ 4] 2775         CALL     SUBB    ;remaining count
      008EE9 CD 83 91         [ 4] 2776         CALL     RFROM
      008EEC CD 8E 02         [ 4] 2777         CALL     PARS
      008EEF CD 84 C2         [ 4] 2778         CALL     INN
      008EF2 CC 89 3F         [ 2] 2779         JP     PSTOR
                                   2780 
                                   2781 ;       .(      ( -- )
                                   2782 ;       Output following string up to next ) .
      008EF5 8E C5                 2783         .word      LINK
                           000E77  2784 LINK = . 
      008EF7 82                    2785 	.byte      IMEDD+2
      008EF8 2E 28                 2786         .ascii     ".("
      008EFA                       2787 DOTPR:
      008EFA CD 82 B8         [ 4] 2788         CALL     DOLIT
      008EFD 00 29                 2789         .word     41	; ")"
      008EFF CD 8E CB         [ 4] 2790         CALL     PARSE
      008F02 CC 8D 18         [ 2] 2791         JP     TYPES
                                   2792 
                                   2793 ;       (       ( -- )
                                   2794 ;       Ignore following string up to next ).
                                   2795 ;       A comment.
      008F05 8E F7                 2796         .word      LINK
                           000E87  2797 LINK = . 
      008F07 81                    2798 	.byte      IMEDD+1
      008F08 28                    2799         .ascii     "("
      008F09                       2800 PAREN:
      008F09 CD 82 B8         [ 4] 2801         CALL     DOLIT
      008F0C 00 29                 2802         .word     41	; ")"
      008F0E CD 8E CB         [ 4] 2803         CALL     PARSE
      008F11 CC 85 9D         [ 2] 2804         JP     DDROP
                                   2805 
                                   2806 ;       \       ( -- )
                                   2807 ;       Ignore following text till
                                   2808 ;       end of line.
      008F14 8F 07                 2809         .word      LINK
                           000E96  2810 LINK = . 
      008F16 81                    2811 	.byte      IMEDD+1
      008F17 5C                    2812         .ascii     "\"
      008F18                       2813 BKSLA:
                           000001  2814 .if CONVERT_TO_CODE
      008F18 90 AE 00 0C      [ 2] 2815         ldw y,#UCTIB ; #TIB  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



      008F1C 90 FE            [ 2] 2816         ldw y,(y)
      008F1E 90 89            [ 2] 2817         pushw y ; count in TIB 
      008F20 90 AE 00 0A      [ 2] 2818         ldw y,#UINN ; >IN 
      008F24 90 BF 20         [ 2] 2819         ldw YTEMP,y
      008F27 90 85            [ 2] 2820         popw y 
      008F29 91 CF 20         [ 5] 2821         ldw [YTEMP],y
      008F2C 81               [ 4] 2822         ret 
                           000000  2823 .else
                                   2824         CALL     NTIB
                                   2825         CALL     AT
                                   2826         CALL     INN
                                   2827         JP     STORE
                                   2828 .endif 
                                   2829 
                                   2830 ;       WORD    ( c -- a ; <string> )
                                   2831 ;       Parse a word from input stream
                                   2832 ;       and copy it to code dictionary.
      008F2D 8F 16                 2833         .word      LINK
                           000EAF  2834 LINK = . 
      008F2F 04                    2835         .byte      4
      008F30 57 4F 52 44           2836         .ascii     "WORD"
      008F34                       2837 WORDD:
      008F34 CD 8E CB         [ 4] 2838         CALL     PARSE
      008F37 CD 89 BD         [ 4] 2839         CALL     HERE
      008F3A CD 88 71         [ 4] 2840         CALL     CELLP
      008F3D CC 8A 7E         [ 2] 2841         JP     PACKS
                                   2842 
                                   2843 ;       TOKEN   ( -- a ; <string> )
                                   2844 ;       Parse a word from input stream
                                   2845 ;       and copy it to name dictionary.
      008F40 8F 2F                 2846         .word      LINK
                           000EC2  2847 LINK = . 
      008F42 05                    2848         .byte      5
      008F43 54 4F 4B 45 4E        2849         .ascii     "TOKEN"
      008F48                       2850 TOKEN:
      008F48 CD 88 C3         [ 4] 2851         CALL     BLANK
      008F4B CC 8F 34         [ 2] 2852         JP     WORDD
                                   2853 
                                   2854 ;; Dictionary search
                                   2855 
                                   2856 ;       NAME>   ( na -- ca )
                                   2857 ;       Return a code address given
                                   2858 ;       a name address.
      008F4E 8F 42                 2859         .word      LINK
                           000ED0  2860 LINK = . 
      008F50 05                    2861         .byte      5
      008F51 4E 41 4D 45 3E        2862         .ascii     "NAME>"
      008F56                       2863 NAMET:
      008F56 CD 89 A6         [ 4] 2864         CALL     COUNT
      008F59 CD 82 B8         [ 4] 2865         CALL     DOLIT
      008F5C 00 1F                 2866         .word      31
      008F5E CD 84 33         [ 4] 2867         CALL     ANDD
      008F61 CC 85 BD         [ 2] 2868         JP     PLUS
                                   2869 
                                   2870 ;       SAME?   ( a a u -- a a f \ -0+ )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



                                   2871 ;       Compare u cells in two
                                   2872 ;       strings. Return 0 if identical.
      008F64 8F 50                 2873         .word      LINK
                           000EE6  2874 LINK = . 
      008F66 05                    2875         .byte       5
      008F67 53 41 4D 45 3F        2876         .ascii     "SAME?"
      008F6C                       2877 SAMEQ:
      008F6C CD 88 A9         [ 4] 2878         CALL     ONEM
      008F6F CD 83 B0         [ 4] 2879         CALL     TOR
      008F72 20 29            [ 2] 2880         JRA     SAME2
      008F74 CD 84 11         [ 4] 2881 SAME1:  CALL     OVER
      008F77 CD 83 A4         [ 4] 2882         CALL     RAT
      008F7A CD 85 BD         [ 4] 2883         CALL     PLUS
      008F7D CD 83 5E         [ 4] 2884         CALL     CAT
      008F80 CD 84 11         [ 4] 2885         CALL     OVER
      008F83 CD 83 A4         [ 4] 2886         CALL     RAT
      008F86 CD 85 BD         [ 4] 2887         CALL     PLUS
      008F89 CD 83 5E         [ 4] 2888         CALL     CAT
      008F8C CD 86 1B         [ 4] 2889         CALL     SUBB
      008F8F CD 85 6C         [ 4] 2890         CALL     QDUP
      008F92 CD 82 EB         [ 4] 2891         CALL     QBRAN
      008F95 8F 9D                 2892         .word      SAME2
      008F97 CD 83 91         [ 4] 2893         CALL     RFROM
      008F9A CC 83 DD         [ 2] 2894         JP     DROP
      008F9D CD 82 CC         [ 4] 2895 SAME2:  CALL     DONXT
      008FA0 8F 74                 2896         .word      SAME1
      008FA2 CC 88 D0         [ 2] 2897         JP     ZERO
                                   2898 
                                   2899 ;       find    ( a va -- ca na | a F )
                                   2900 ;       Search vocabulary for string.
                                   2901 ;       Return ca and na if succeeded.
      008FA5 8F 66                 2902         .word      LINK
                           000F27  2903 LINK = . 
      008FA7 04                    2904         .byte      4
      008FA8 46 49 4E 44           2905         .ascii     "FIND"
      008FAC                       2906 FIND:
      008FAC CD 83 F7         [ 4] 2907         CALL     SWAPP
      008FAF CD 83 E7         [ 4] 2908         CALL     DUPP
      008FB2 CD 83 5E         [ 4] 2909         CALL     CAT
      008FB5 CD 84 B3         [ 4] 2910         CALL     TEMP
      008FB8 CD 83 29         [ 4] 2911         CALL     STORE
      008FBB CD 83 E7         [ 4] 2912         CALL     DUPP
      008FBE CD 83 40         [ 4] 2913         CALL     AT
      008FC1 CD 83 B0         [ 4] 2914         CALL     TOR
      008FC4 CD 88 71         [ 4] 2915         CALL     CELLP
      008FC7 CD 83 F7         [ 4] 2916         CALL     SWAPP
      008FCA CD 83 40         [ 4] 2917 FIND1:  CALL     AT
      008FCD CD 83 E7         [ 4] 2918         CALL     DUPP
      008FD0 CD 82 EB         [ 4] 2919         CALL     QBRAN
      008FD3 90 09                 2920         .word      FIND6
      008FD5 CD 83 E7         [ 4] 2921         CALL     DUPP
      008FD8 CD 83 40         [ 4] 2922         CALL     AT
      008FDB CD 82 B8         [ 4] 2923         CALL     DOLIT
      008FDE 1F 7F                 2924         .word      MASKK
      008FE0 CD 84 33         [ 4] 2925         CALL     ANDD
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      008FE3 CD 83 A4         [ 4] 2926         CALL     RAT
      008FE6 CD 84 5C         [ 4] 2927         CALL     XORR
      008FE9 CD 82 EB         [ 4] 2928         CALL     QBRAN
      008FEC 8F F8                 2929         .word      FIND2
      008FEE CD 88 71         [ 4] 2930         CALL     CELLP
      008FF1 CD 82 B8         [ 4] 2931         CALL     DOLIT
      008FF4 FF FF                 2932         .word     0xFFFF
      008FF6 20 0C            [ 2] 2933         JRA     FIND3
      008FF8 CD 88 71         [ 4] 2934 FIND2:  CALL     CELLP
      008FFB CD 84 B3         [ 4] 2935         CALL     TEMP
      008FFE CD 83 40         [ 4] 2936         CALL     AT
      009001 CD 8F 6C         [ 4] 2937         CALL     SAMEQ
      009004 CD 83 02         [ 4] 2938 FIND3:  CALL     BRAN
      009007 90 18                 2939         .word      FIND4
      009009 CD 83 91         [ 4] 2940 FIND6:  CALL     RFROM
      00900C CD 83 DD         [ 4] 2941         CALL     DROP
      00900F CD 83 F7         [ 4] 2942         CALL     SWAPP
      009012 CD 88 80         [ 4] 2943         CALL     CELLM
      009015 CC 83 F7         [ 2] 2944         JP     SWAPP
      009018 CD 82 EB         [ 4] 2945 FIND4:  CALL     QBRAN
      00901B 90 25                 2946         .word      FIND5
      00901D CD 88 80         [ 4] 2947         CALL     CELLM
      009020 CD 88 80         [ 4] 2948         CALL     CELLM
      009023 20 A5            [ 2] 2949         JRA     FIND1
      009025 CD 83 91         [ 4] 2950 FIND5:  CALL     RFROM
      009028 CD 83 DD         [ 4] 2951         CALL     DROP
      00902B CD 83 F7         [ 4] 2952         CALL     SWAPP
      00902E CD 83 DD         [ 4] 2953         CALL     DROP
      009031 CD 88 80         [ 4] 2954         CALL     CELLM
      009034 CD 83 E7         [ 4] 2955         CALL     DUPP
      009037 CD 8F 56         [ 4] 2956         CALL     NAMET
      00903A CC 83 F7         [ 2] 2957         JP     SWAPP
                                   2958 
                                   2959 ;       NAME?   ( a -- ca na | a F )
                                   2960 ;       Search vocabularies for a string.
      00903D 8F A7                 2961         .word      LINK
                           000FBF  2962 LINK = . 
      00903F 05                    2963         .byte      5
      009040 4E 41 4D 45 3F        2964         .ascii     "NAME?"
      009045                       2965 NAMEQ:
      009045 CD 85 15         [ 4] 2966         CALL   CNTXT
      009048 CC 8F AC         [ 2] 2967         JP     FIND
                                   2968 
                                   2969 ;; Terminal response
                                   2970 
                                   2971 ;       ^H      ( bot eot cur -- bot eot cur )
                                   2972 ;       Backup cursor by one character.
      00904B 90 3F                 2973         .word      LINK
                           000FCD  2974 LINK = . 
      00904D 02                    2975         .byte      2
      00904E 5E 48                 2976         .ascii     "^H"
      009050                       2977 BKSP:
      009050 CD 83 B0         [ 4] 2978         CALL     TOR
      009053 CD 84 11         [ 4] 2979         CALL     OVER
      009056 CD 83 91         [ 4] 2980         CALL     RFROM
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      009059 CD 83 F7         [ 4] 2981         CALL     SWAPP
      00905C CD 84 11         [ 4] 2982         CALL     OVER
      00905F CD 84 5C         [ 4] 2983         CALL     XORR
      009062 CD 82 EB         [ 4] 2984         CALL     QBRAN
      009065 90 80                 2985         .word      BACK1
      009067 CD 82 B8         [ 4] 2986         CALL     DOLIT
      00906A 00 08                 2987         .word      BKSPP
      00906C CD 82 A2         [ 4] 2988         CALL     EMIT
      00906F CD 88 A9         [ 4] 2989         CALL     ONEM
      009072 CD 88 C3         [ 4] 2990         CALL     BLANK
      009075 CD 82 A2         [ 4] 2991         CALL     EMIT
      009078 CD 82 B8         [ 4] 2992         CALL     DOLIT
      00907B 00 08                 2993         .word      BKSPP
      00907D CC 82 A2         [ 2] 2994         JP     EMIT
      009080 81               [ 4] 2995 BACK1:  RET
                                   2996 
                                   2997 ;       TAP     ( bot eot cur c -- bot eot cur )
                                   2998 ;       Accept and echo key stroke
                                   2999 ;       and bump cursor.
      009081 90 4D                 3000         .word      LINK
                           001003  3001 LINK = . 
      009083 03                    3002         .byte      3
      009084 54 41 50              3003         .ascii     "TAP"
      009087                       3004 TAP:
      009087 CD 83 E7         [ 4] 3005         CALL     DUPP
      00908A CD 82 A2         [ 4] 3006         CALL     EMIT
      00908D CD 84 11         [ 4] 3007         CALL     OVER
      009090 CD 83 4D         [ 4] 3008         CALL     CSTOR
      009093 CC 88 9C         [ 2] 3009         JP     ONEP
                                   3010 
                                   3011 ;       kTAP    ( bot eot cur c -- bot eot cur )
                                   3012 ;       Process a key stroke,
                                   3013 ;       CR or backspace.
      009096 90 83                 3014         .word      LINK
                           001018  3015 LINK = . 
      009098 04                    3016         .byte      4
      009099 4B 54 41 50           3017         .ascii     "KTAP"
      00909D                       3018 KTAP:
      00909D CD 83 E7         [ 4] 3019         CALL     DUPP
      0090A0 CD 82 B8         [ 4] 3020         CALL     DOLIT
      0090A3 00 0D                 3021         .word      CRR
      0090A5 CD 84 5C         [ 4] 3022         CALL     XORR
      0090A8 CD 82 EB         [ 4] 3023         CALL     QBRAN
      0090AB 90 C3                 3024         .word      KTAP2
      0090AD CD 82 B8         [ 4] 3025         CALL     DOLIT
      0090B0 00 08                 3026         .word      BKSPP
      0090B2 CD 84 5C         [ 4] 3027         CALL     XORR
      0090B5 CD 82 EB         [ 4] 3028         CALL     QBRAN
      0090B8 90 C0                 3029         .word      KTAP1
      0090BA CD 88 C3         [ 4] 3030         CALL     BLANK
      0090BD CC 90 87         [ 2] 3031         JP     TAP
      0090C0 CC 90 50         [ 2] 3032 KTAP1:  JP     BKSP
      0090C3 CD 83 DD         [ 4] 3033 KTAP2:  CALL     DROP
      0090C6 CD 83 F7         [ 4] 3034         CALL     SWAPP
      0090C9 CD 83 DD         [ 4] 3035         CALL     DROP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      0090CC CC 83 E7         [ 2] 3036         JP     DUPP
                                   3037 
                                   3038 ;       accept  ( b u -- b u )
                                   3039 ;       Accept characters to input
                                   3040 ;       buffer. Return with actual count.
      0090CF 90 98                 3041         .word      LINK
                           001051  3042 LINK = . 
      0090D1 06                    3043         .byte      6
      0090D2 41 43 43 45 50 54     3044         .ascii     "ACCEPT"
      0090D8                       3045 ACCEP:
      0090D8 CD 84 11         [ 4] 3046         CALL     OVER
      0090DB CD 85 BD         [ 4] 3047         CALL     PLUS
      0090DE CD 84 11         [ 4] 3048         CALL     OVER
      0090E1 CD 85 A8         [ 4] 3049 ACCP1:  CALL     DDUP
      0090E4 CD 84 5C         [ 4] 3050         CALL     XORR
      0090E7 CD 82 EB         [ 4] 3051         CALL     QBRAN
      0090EA 91 0C                 3052         .word      ACCP4
      0090EC CD 8C B6         [ 4] 3053         CALL     KEY
      0090EF CD 83 E7         [ 4] 3054         CALL     DUPP
      0090F2 CD 88 C3         [ 4] 3055         CALL     BLANK
      0090F5 CD 82 B8         [ 4] 3056         CALL     DOLIT
      0090F8 00 7F                 3057         .word      127
      0090FA CD 86 DD         [ 4] 3058         CALL     WITHI
      0090FD CD 82 EB         [ 4] 3059         CALL     QBRAN
      009100 91 07                 3060         .word      ACCP2
      009102 CD 90 87         [ 4] 3061         CALL     TAP
      009105 20 03            [ 2] 3062         JRA     ACCP3
      009107 CD 90 9D         [ 4] 3063 ACCP2:  CALL     KTAP
      00910A 20 D5            [ 2] 3064 ACCP3:  JRA     ACCP1
      00910C CD 83 DD         [ 4] 3065 ACCP4:  CALL     DROP
      00910F CD 84 11         [ 4] 3066         CALL     OVER
      009112 CC 86 1B         [ 2] 3067         JP     SUBB
                                   3068 
                                   3069 ;       QUERY   ( -- )
                                   3070 ;       Accept input stream to
                                   3071 ;       terminal input buffer.
      009115 90 D1                 3072         .word      LINK
                                   3073         
                           001097  3074 LINK = . 
      009117 05                    3075         .byte      5
      009118 51 55 45 52 59        3076         .ascii     "QUERY"
      00911D                       3077 QUERY:
      00911D CD 89 DF         [ 4] 3078         CALL     TIB
      009120 CD 82 B8         [ 4] 3079         CALL     DOLIT
      009123 00 50                 3080         .word      80
      009125 CD 90 D8         [ 4] 3081         CALL     ACCEP
      009128 CD 84 D2         [ 4] 3082         CALL     NTIB
      00912B CD 83 29         [ 4] 3083         CALL     STORE
      00912E CD 83 DD         [ 4] 3084         CALL     DROP
      009131 CD 88 D0         [ 4] 3085         CALL     ZERO
      009134 CD 84 C2         [ 4] 3086         CALL     INN
      009137 CC 83 29         [ 2] 3087         JP     STORE
                                   3088 
                                   3089 ;       ABORT   ( -- )
                                   3090 ;       Reset data stack and
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



                                   3091 ;       jump to QUIT.
      00913A 91 17                 3092         .word      LINK
                           0010BC  3093 LINK = . 
      00913C 05                    3094         .byte      5
      00913D 41 42 4F 52 54        3095         .ascii     "ABORT"
      009142                       3096 ABORT:
      009142 CD 92 39         [ 4] 3097         CALL     PRESE
      009145 CC 92 56         [ 2] 3098         JP     QUIT
                                   3099 
                                   3100 ;       abort"  ( f -- )
                                   3101 ;       Run time routine of ABORT".
                                   3102 ;       Abort with a message.
      009148 91 3C                 3103         .word      LINK
                           0010CA  3104 LINK = . 
      00914A 46                    3105 	.byte      COMPO+6
      00914B 41 42 4F 52 54        3106         .ascii     "ABORT"
      009150 22                    3107         .byte      '"'
      009151                       3108 ABORQ:
      009151 CD 82 EB         [ 4] 3109         CALL     QBRAN
      009154 91 70                 3110         .word      ABOR2   ;text flag
      009156 CD 8D 4C         [ 4] 3111         CALL     DOSTR
      009159 CD 8C EE         [ 4] 3112 ABOR1:  CALL     SPACE
      00915C CD 89 A6         [ 4] 3113         CALL     COUNT
      00915F CD 8D 18         [ 4] 3114         CALL     TYPES
      009162 CD 82 B8         [ 4] 3115         CALL     DOLIT
      009165 00 3F                 3116         .word     63 ; "?"
      009167 CD 82 A2         [ 4] 3117         CALL     EMIT
      00916A CD 8D 36         [ 4] 3118         CALL     CR
      00916D CC 91 42         [ 2] 3119         JP     ABORT   ;pass error string
      009170 CD 8D 4C         [ 4] 3120 ABOR2:  CALL     DOSTR
      009173 CC 83 DD         [ 2] 3121         JP     DROP
                                   3122 
                                   3123 ;; The text interpreter
                                   3124 
                                   3125 ;       $INTERPRET      ( a -- )
                                   3126 ;       Interpret a word. If failed,
                                   3127 ;       try to convert it to an integer.
      009176 91 4A                 3128         .word      LINK
                           0010F8  3129 LINK = . 
      009178 0A                    3130         .byte      10
      009179 24 49 4E 54 45 52 50  3131         .ascii     "$INTERPRET"
             52 45 54
      009183                       3132 INTER:
      009183 CD 90 45         [ 4] 3133         CALL     NAMEQ
      009186 CD 85 6C         [ 4] 3134         CALL     QDUP    ;?defined
      009189 CD 82 EB         [ 4] 3135         CALL     QBRAN
      00918C 91 AD                 3136         .word      INTE1
      00918E CD 83 40         [ 4] 3137         CALL     AT
      009191 CD 82 B8         [ 4] 3138         CALL     DOLIT
      009194 40 00                 3139 	.word       0x4000	; COMPO*256
      009196 CD 84 33         [ 4] 3140         CALL     ANDD    ;?compile only lexicon bits
      009199 CD 91 51         [ 4] 3141         CALL     ABORQ
      00919C 0D                    3142         .byte      13
      00919D 20 63 6F 6D 70 69 6C  3143         .ascii     " compile only"
             65 20 6F 6E 6C 79
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      0091AA CC 83 12         [ 2] 3144         JP     EXECU
      0091AD CD 8B E3         [ 4] 3145 INTE1:  CALL     NUMBQ   ;convert a number
      0091B0 CD 82 EB         [ 4] 3146         CALL     QBRAN
      0091B3 91 59                 3147         .word    ABOR1
      0091B5 81               [ 4] 3148         RET
                                   3149 
                                   3150 ;       [       ( -- )
                                   3151 ;       Start  text interpreter.
      0091B6 91 78                 3152         .word      LINK
                           001138  3153 LINK = . 
      0091B8 81                    3154 	.byte      IMEDD+1
      0091B9 5B                    3155         .ascii     "["
      0091BA                       3156 LBRAC:
      0091BA CD 82 B8         [ 4] 3157         CALL   DOLIT
      0091BD 91 83                 3158         .word  INTER
      0091BF CD 84 F3         [ 4] 3159         CALL   TEVAL
      0091C2 CC 83 29         [ 2] 3160         JP     STORE
                                   3161 
                                   3162 ;       .OK     ( -- )
                                   3163 ;       Display 'ok' while interpreting.
      0091C5 91 B8                 3164         .word      LINK
                           001147  3165 LINK = . 
      0091C7 03                    3166         .byte      3
      0091C8 2E 4F 4B              3167         .ascii     ".OK"
      0091CB                       3168 DOTOK:
      0091CB CD 82 B8         [ 4] 3169         CALL     DOLIT
      0091CE 91 83                 3170         .word      INTER
      0091D0 CD 84 F3         [ 4] 3171         CALL     TEVAL
      0091D3 CD 83 40         [ 4] 3172         CALL     AT
      0091D6 CD 86 43         [ 4] 3173         CALL     EQUAL
      0091D9 CD 82 EB         [ 4] 3174         CALL     QBRAN
      0091DC 91 E5                 3175         .word      DOTO1
      0091DE CD 8D 75         [ 4] 3176         CALL     DOTQP
      0091E1 03                    3177         .byte      3
      0091E2 20 6F 6B              3178         .ascii     " ok"
      0091E5 CC 8D 36         [ 2] 3179 DOTO1:  JP     CR
                                   3180 
                                   3181 ;       ?STACK  ( -- )
                                   3182 ;       Abort if stack underflows.
      0091E8 91 C7                 3183         .word      LINK
                           00116A  3184 LINK = . 
      0091EA 06                    3185         .byte      6
      0091EB 3F 53 54 41 43 4B     3186         .ascii     "?STACK"
      0091F1                       3187 QSTAC: 
      0091F1 CD 89 13         [ 4] 3188         CALL     DEPTH
      0091F4 CD 84 20         [ 4] 3189         CALL     ZLESS   ;check only for underflow
      0091F7 CD 91 51         [ 4] 3190         CALL     ABORQ
      0091FA 0B                    3191         .byte      11
      0091FB 20 75 6E 64 65 72 66  3192         .ascii     " underflow "
             6C 6F 77 20
      009206 81               [ 4] 3193         RET
                                   3194 
                                   3195 ;       EVAL    ( -- )
                                   3196 ;       Interpret  input stream.
      009207 91 EA                 3197         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



                           001189  3198 LINK = . 
      009209 04                    3199         .byte      4
      00920A 45 56 41 4C           3200         .ascii     "EVAL"
      00920E                       3201 EVAL:
      00920E CD 8F 48         [ 4] 3202 EVAL1:  CALL     TOKEN
      009211 CD 83 E7         [ 4] 3203         CALL     DUPP
      009214 CD 83 5E         [ 4] 3204         CALL     CAT     ;?input stream empty
      009217 CD 82 EB         [ 4] 3205         CALL     QBRAN
      00921A 92 2A                 3206         .word    EVAL2
      00921C CD 84 F3         [ 4] 3207         CALL     TEVAL
      00921F CD 89 F3         [ 4] 3208         CALL     ATEXE
      009222 CD 91 F1         [ 4] 3209         CALL     QSTAC   ;evaluate input, check stack
      009225 CD 83 02         [ 4] 3210         CALL     BRAN
      009228 92 0E                 3211         .word    EVAL1
      00922A CD 83 DD         [ 4] 3212 EVAL2:  CALL     DROP
      00922D CC 91 CB         [ 2] 3213         JP       DOTOK
                                   3214 
                                   3215 ;       PRESET  ( -- )
                                   3216 ;       Reset data stack pointer and
                                   3217 ;       terminal input buffer.
      009230 92 09                 3218         .word      LINK
                           0011B2  3219 LINK = . 
      009232 06                    3220         .byte      6
      009233 50 52 45 53 45 54     3221         .ascii     "PRESET"
      009239                       3222 PRESE:
      009239 CD 82 B8         [ 4] 3223         CALL     DOLIT
      00923C 16 70                 3224         .word      SPP
      00923E CD 83 D4         [ 4] 3225         CALL     SPSTO
      009241 CD 82 B8         [ 4] 3226         CALL     DOLIT
      009244 17 00                 3227         .word      TIBB
      009246 CD 84 D2         [ 4] 3228         CALL     NTIB
      009249 CD 88 71         [ 4] 3229         CALL     CELLP
      00924C CC 83 29         [ 2] 3230         JP     STORE
                                   3231 
                                   3232 ;       QUIT    ( -- )
                                   3233 ;       Reset return stack pointer
                                   3234 ;       and start text interpreter.
      00924F 92 32                 3235         .word      LINK
                           0011D1  3236 LINK = . 
      009251 04                    3237         .byte      4
      009252 51 55 49 54           3238         .ascii     "QUIT"
      009256                       3239 QUIT:
      009256 CD 82 B8         [ 4] 3240         CALL     DOLIT
      009259 17 FF                 3241         .word      RPP
      00925B CD 83 7B         [ 4] 3242         CALL     RPSTO   ;reset return stack pointer
      00925E CD 91 BA         [ 4] 3243 QUIT1:  CALL     LBRAC   ;start interpretation
      009261 CD 91 1D         [ 4] 3244 QUIT2:  CALL     QUERY   ;get input
      009264 CD 92 0E         [ 4] 3245         CALL     EVAL
      009267 20 F8            [ 2] 3246         JRA     QUIT2   ;continue till error
                                   3247 
                                   3248 ;; The compiler
                                   3249 
                                   3250 ;       '       ( -- ca )
                                   3251 ;       Search vocabularies for
                                   3252 ;       next word in input stream.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      009269 92 51                 3253         .word      LINK
                           0011EB  3254 LINK = . 
      00926B 01                    3255         .byte      1
      00926C 27                    3256         .ascii     "'"
      00926D                       3257 TICK:
      00926D CD 8F 48         [ 4] 3258         CALL     TOKEN
      009270 CD 90 45         [ 4] 3259         CALL     NAMEQ   ;?defined
      009273 CD 82 EB         [ 4] 3260         CALL     QBRAN
      009276 91 59                 3261         .word      ABOR1
      009278 81               [ 4] 3262         RET     ;yes, push code address
                                   3263 
                                   3264 ;       ALLOT   ( n -- )
                           000001  3265 .if PICATOUT_MOD
                                   3266 ;       Allocate n bytes to RAM 
                           000000  3267 .else 
                                   3268 ;       Allocate n bytes to  code dictionary.
                                   3269 .endif 
      009279 92 6B                 3270         .word      LINK
                           0011FB  3271 LINK = . 
      00927B 05                    3272         .byte      5
      00927C 41 4C 4C 4F 54        3273         .ascii     "ALLOT"
      009281                       3274 ALLOT:
      009281 CD 85 23         [ 4] 3275         CALL     VPP
                           000001  3276 .if PICATOUT_MOD
                                   3277 ; must update APP_VP each time VP is modidied
      009284 CD 89 3F         [ 4] 3278         call PSTOR 
      009287 CD 99 2E         [ 4] 3279         call UPDATVP 
                           000000  3280 .else
                                   3281         JP     PSTOR
                                   3282 .endif ;PICATOUT_MOD
                                   3283 
                                   3284 ;       ,       ( w -- )
                                   3285 ;         Compile an integer into
                                   3286 ;         variable space.
      00928A 92 7B                 3287         .word      LINK
                           00120C  3288 LINK = . 
      00928C 01                    3289         .byte      1
      00928D 2C                    3290         .ascii     ","
      00928E                       3291 COMMA:
      00928E CD 89 BD         [ 4] 3292         CALL     HERE
      009291 CD 83 E7         [ 4] 3293         CALL     DUPP
      009294 CD 88 71         [ 4] 3294         CALL     CELLP   ;cell boundary
      009297 CD 85 23         [ 4] 3295         CALL     VPP
      00929A CD 83 29         [ 4] 3296         CALL     STORE
      00929D CC 83 29         [ 2] 3297         JP     STORE
                                   3298 
                                   3299 ;       C,      ( c -- )
                                   3300 ;       Compile a byte into
                                   3301 ;       variables space.
      0092A0 92 8C                 3302        .word      LINK
                           001222  3303 LINK = . 
      0092A2 02                    3304         .byte      2
      0092A3 43 2C                 3305         .ascii     "C,"
      0092A5                       3306 CCOMMA:
      0092A5 CD 89 BD         [ 4] 3307         CALL     HERE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      0092A8 CD 83 E7         [ 4] 3308         CALL     DUPP
      0092AB CD 88 9C         [ 4] 3309         CALL     ONEP
      0092AE CD 85 23         [ 4] 3310         CALL     VPP
      0092B1 CD 83 29         [ 4] 3311         CALL     STORE
      0092B4 CC 83 4D         [ 2] 3312         JP     CSTOR
                                   3313 
                                   3314 ;       [COMPILE]       ( -- ; <string> )
                                   3315 ;       Compile next immediate
                                   3316 ;       word into code dictionary.
      0092B7 92 A2                 3317         .word      LINK
                           001239  3318 LINK = . 
      0092B9 89                    3319 	.byte      IMEDD+9
      0092BA 5B 43 4F 4D 50 49 4C  3320         .ascii     "[COMPILE]"
             45 5D
      0092C3                       3321 BCOMP:
      0092C3 CD 92 6D         [ 4] 3322         CALL     TICK
      0092C6 CC 95 75         [ 2] 3323         JP     JSRC
                                   3324 
                                   3325 ;       COMPILE ( -- )
                                   3326 ;       Compile next jsr in
                                   3327 ;       colon list to code dictionary.
      0092C9 92 B9                 3328         .word      LINK
                           00124B  3329 LINK = . 
      0092CB 47                    3330 	.byte      COMPO+7
      0092CC 43 4F 4D 50 49 4C 45  3331         .ascii     "COMPILE"
      0092D3                       3332 COMPI:
      0092D3 CD 83 91         [ 4] 3333         CALL     RFROM
                           000001  3334 .if PICATOUT_MOD
                                   3335 ; no need to increment
                           000000  3336 .else
                                   3337         CALL     ONEP
                                   3338 .endif 
      0092D6 CD 83 E7         [ 4] 3339         CALL     DUPP
      0092D9 CD 83 40         [ 4] 3340         CALL     AT
      0092DC CD 95 75         [ 4] 3341         CALL     JSRC    ;compile subroutine
      0092DF CD 88 71         [ 4] 3342         CALL     CELLP
                           000001  3343 .if PICATOUT_MOD
      0092E2 90 93            [ 1] 3344         ldw y,x 
      0092E4 90 FE            [ 2] 3345         ldw y,(y)
      0092E6 1C 00 02         [ 2] 3346         addw x,#CELLL 
      0092E9 90 FC            [ 2] 3347         jp (y)
                           000000  3348 .else 
                                   3349         JP     TOR
                                   3350 .endif 
                                   3351 
                                   3352 ;       LITERAL ( w -- )
                                   3353 ;       Compile tos to dictionary
                                   3354 ;       as an integer literal.
      0092EB 92 CB                 3355         .word      LINK
                           00126D  3356 LINK = . 
      0092ED 87                    3357 	.byte      IMEDD+7
      0092EE 4C 49 54 45 52 41 4C  3358         .ascii     "LITERAL"
      0092F5                       3359 LITER:
      0092F5 CD 92 D3         [ 4] 3360         CALL     COMPI
                           000001  3361 .if PICATOUT_MOD
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      0092F8 82 B8                 3362         .word DOLIT 
                           000000  3363 .else         
                                   3364         CALL     DOLIT
                                   3365 .endif 
      0092FA CC 92 8E         [ 2] 3366         JP     COMMA
                                   3367 
                                   3368 ;       $,"     ( -- )
                                   3369 ;       Compile a literal string
                                   3370 ;       up to next " .
      0092FD 92 ED                 3371         .word      LINK
                           00127F  3372 LINK = . 
      0092FF 03                    3373         .byte      3
      009300 24 2C 22              3374         .byte     '$',',','"'
      009303                       3375 STRCQ:
      009303 CD 82 B8         [ 4] 3376         CALL     DOLIT
      009306 00 22                 3377         .word     34	; "
      009308 CD 8E CB         [ 4] 3378         CALL     PARSE
      00930B CD 89 BD         [ 4] 3379         CALL     HERE
      00930E CD 8A 7E         [ 4] 3380         CALL     PACKS   ;string to code dictionary
      009311 CD 89 A6         [ 4] 3381         CALL     COUNT
      009314 CD 85 BD         [ 4] 3382         CALL     PLUS    ;calculate aligned end of string
      009317 CD 85 23         [ 4] 3383         CALL     VPP
      00931A CC 83 29         [ 2] 3384         JP     STORE
                                   3385 
                                   3386 ;; Structures
                                   3387 
                                   3388 ;       FOR     ( -- a )
                                   3389 ;       Start a FOR-NEXT loop
                                   3390 ;       structure in a colon definition.
      00931D 92 FF                 3391         .word      LINK
                           00129F  3392 LINK = . 
      00931F 83                    3393 	.byte      IMEDD+3
      009320 46 4F 52              3394         .ascii     "FOR"
      009323                       3395 FOR:
      009323 CD 92 D3         [ 4] 3396         CALL     COMPI
                           000001  3397 .if PICATOUT_MOD
      009326 83 B0                 3398         .word TOR 
                           000000  3399 .else
                                   3400         CALL     TOR
                                   3401 .endif
      009328 CC 89 BD         [ 2] 3402         JP     HERE
                                   3403 
                                   3404 ;       NEXT    ( a -- )
                                   3405 ;       Terminate a FOR-NEXT loop.
      00932B 93 1F                 3406         .word      LINK
                           0012AD  3407 LINK = . 
      00932D 84                    3408 	.byte      IMEDD+4
      00932E 4E 45 58 54           3409         .ascii     "NEXT"
      009332                       3410 NEXT:
      009332 CD 92 D3         [ 4] 3411         CALL     COMPI
                           000001  3412 .if PICATOUT_MOD
      009335 82 CC                 3413         .word DONXT 
                           000000  3414 .else 
                                   3415         CALL     DONXT
                                   3416 .endif         
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



                           000001  3417 .if PICATOUT_MOD
      009337 CD 85 5C         [ 4] 3418         call ADRADJ
                                   3419 .endif ; PICATOUT_MOD
      00933A CC 92 8E         [ 2] 3420         JP     COMMA
                                   3421 
                                   3422 ;       I ( -- n )
                                   3423 ;       stack FOR-NEXT COUNTER 
      00933D 93 2D                 3424         .word LINK 
                           0012BF  3425         LINK=.
      00933F 01                    3426         .byte 1 
      009340 49                    3427         .ascii "I"
      009341                       3428 IFETCH: 
      009341 1D 00 02         [ 2] 3429         subw x,#CELLL 
      009344 16 03            [ 2] 3430         ldw y,(3,sp)
      009346 FF               [ 2] 3431         ldw (x),y 
      009347 81               [ 4] 3432         ret 
                                   3433 
                                   3434 ;       BEGIN   ( -- a )
                                   3435 ;       Start an infinite or
                                   3436 ;       indefinite loop structure.
      009348 93 3F                 3437         .word      LINK
                           0012CA  3438 LINK = . 
      00934A 85                    3439 	.byte      IMEDD+5
      00934B 42 45 47 49 4E        3440         .ascii     "BEGIN"
      009350                       3441 BEGIN:
      009350 CC 89 BD         [ 2] 3442         JP     HERE
                                   3443 
                                   3444 ;       UNTIL   ( a -- )
                                   3445 ;       Terminate a BEGIN-UNTIL
                                   3446 ;       indefinite loop structure.
      009353 93 4A                 3447         .word      LINK
                           0012D5  3448 LINK = . 
      009355 85                    3449 	.byte      IMEDD+5
      009356 55 4E 54 49 4C        3450         .ascii     "UNTIL"
      00935B                       3451 UNTIL:
      00935B CD 92 D3         [ 4] 3452         CALL     COMPI
                           000001  3453 .if PICATOUT_MOD
      00935E 82 EB                 3454         .word    QBRAN 
                           000000  3455 .else 
                                   3456         CALL     QBRAN
                                   3457 .endif 
                           000001  3458 .if PICATOUT_MOD 
      009360 CD 85 5C         [ 4] 3459         call ADRADJ
                                   3460 .endif ; PICATOUT_MOD
      009363 CC 92 8E         [ 2] 3461         JP     COMMA
                                   3462 
                                   3463 ;       AGAIN   ( a -- )
                                   3464 ;       Terminate a BEGIN-AGAIN
                                   3465 ;       infinite loop structure.
      009366 93 55                 3466         .word      LINK
                           0012E8  3467 LINK = . 
      009368 85                    3468 	.byte      IMEDD+5
      009369 41 47 41 49 4E        3469         .ascii     "AGAIN"
      00936E                       3470 AGAIN:
      00936E CD 92 D3         [ 4] 3471         CALL     COMPI
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



                           000001  3472 .if PICATOUT_MOD
      009371 83 02                 3473         .word BRAN
                           000000  3474 .else
                                   3475         CALL     BRAN
                                   3476 .endif 
                           000001  3477 .if PICATOUT_MOD 
      009373 CD 85 5C         [ 4] 3478         call ADRADJ 
                                   3479 .endif ; PICATOUT_MOD
      009376 CC 92 8E         [ 2] 3480         JP     COMMA
                                   3481 
                                   3482 ;       IF      ( -- A )
                                   3483 ;       Begin a conditional branch.
      009379 93 68                 3484         .word      LINK
                           0012FB  3485 LINK = . 
      00937B 82                    3486 	.byte      IMEDD+2
      00937C 49 46                 3487         .ascii     "IF"
      00937E                       3488 IFF:
      00937E CD 92 D3         [ 4] 3489         CALL     COMPI
                           000001  3490 .if PICATOUT_MOD
      009381 82 EB                 3491         .word QBRAN
                           000000  3492 .else
                                   3493         CALL     QBRAN
                                   3494 .endif 
      009383 CD 89 BD         [ 4] 3495         CALL     HERE
      009386 CD 88 D0         [ 4] 3496         CALL     ZERO
      009389 CC 92 8E         [ 2] 3497         JP     COMMA
                                   3498 
                                   3499 ;       THEN        ( A -- )
                                   3500 ;       Terminate a conditional branch structure.
      00938C 93 7B                 3501         .word      LINK
                           00130E  3502 LINK = . 
      00938E 84                    3503 	.byte      IMEDD+4
      00938F 54 48 45 4E           3504         .ascii     "THEN"
      009393                       3505 THENN:
      009393 CD 89 BD         [ 4] 3506         CALL     HERE
                           000001  3507 .if PICATOUT_MOD 
      009396 CD 85 5C         [ 4] 3508         call ADRADJ 
                                   3509 .endif ; PICATOUT_MOD
      009399 CD 83 F7         [ 4] 3510         CALL     SWAPP
      00939C CC 83 29         [ 2] 3511         JP     STORE
                                   3512 
                                   3513 ;       ELSE        ( A -- A )
                                   3514 ;       Start the false clause in an IF-ELSE-THEN structure.
      00939F 93 8E                 3515         .word      LINK
                           001321  3516 LINK = . 
      0093A1 84                    3517 	.byte      IMEDD+4
      0093A2 45 4C 53 45           3518         .ascii     "ELSE"
      0093A6                       3519 ELSEE:
      0093A6 CD 92 D3         [ 4] 3520         CALL     COMPI
                           000001  3521 .if PICATOUT_MOD
      0093A9 83 02                 3522         .word BRAN
                           000000  3523 .else
                                   3524         CALL     BRAN
                                   3525 .endif 
      0093AB CD 89 BD         [ 4] 3526         CALL     HERE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      0093AE CD 88 D0         [ 4] 3527         CALL     ZERO
      0093B1 CD 92 8E         [ 4] 3528         CALL     COMMA
      0093B4 CD 83 F7         [ 4] 3529         CALL     SWAPP
      0093B7 CD 89 BD         [ 4] 3530         CALL     HERE
                           000001  3531 .if PICATOUT_MOD 
      0093BA CD 85 5C         [ 4] 3532         call ADRADJ 
                                   3533 .endif ; PICATOUT_MOD
      0093BD CD 83 F7         [ 4] 3534         CALL     SWAPP
      0093C0 CC 83 29         [ 2] 3535         JP     STORE
                                   3536 
                                   3537 ;       AHEAD       ( -- A )
                                   3538 ;       Compile a forward branch instruction.
      0093C3 93 A1                 3539         .word      LINK
                           001345  3540 LINK = . 
      0093C5 85                    3541 	.byte      IMEDD+5
      0093C6 41 48 45 41 44        3542         .ascii     "AHEAD"
      0093CB                       3543 AHEAD:
      0093CB CD 92 D3         [ 4] 3544         CALL     COMPI
                           000001  3545 .if PICATOUT_MOD
      0093CE 83 02                 3546         .word BRAN
                           000000  3547 .else
                                   3548         CALL     BRAN
                                   3549 .endif 
      0093D0 CD 89 BD         [ 4] 3550         CALL     HERE
      0093D3 CD 88 D0         [ 4] 3551         CALL     ZERO
      0093D6 CC 92 8E         [ 2] 3552         JP     COMMA
                                   3553 
                                   3554 ;       WHILE       ( a -- A a )
                                   3555 ;       Conditional branch out of a BEGIN-WHILE-REPEAT loop.
      0093D9 93 C5                 3556         .word      LINK
                           00135B  3557 LINK = . 
      0093DB 85                    3558 	.byte      IMEDD+5
      0093DC 57 48 49 4C 45        3559         .ascii     "WHILE"
      0093E1                       3560 WHILE:
      0093E1 CD 92 D3         [ 4] 3561         CALL     COMPI
                           000001  3562 .if PICATOUT_MOD
      0093E4 82 EB                 3563         .word QBRAN
                           000000  3564 .else
                                   3565         CALL     QBRAN
                                   3566 .endif 
      0093E6 CD 89 BD         [ 4] 3567         CALL     HERE
      0093E9 CD 88 D0         [ 4] 3568         CALL     ZERO
      0093EC CD 92 8E         [ 4] 3569         CALL     COMMA
      0093EF CC 83 F7         [ 2] 3570         JP     SWAPP
                                   3571 
                                   3572 ;       REPEAT      ( A a -- )
                                   3573 ;       Terminate a BEGIN-WHILE-REPEAT indefinite loop.
      0093F2 93 DB                 3574         .word      LINK
                           001374  3575 LINK = . 
      0093F4 86                    3576         .byte      IMEDD+6
      0093F5 52 45 50 45 41 54     3577         .ascii     "REPEAT"
      0093FB                       3578 REPEA:
      0093FB CD 92 D3         [ 4] 3579         CALL     COMPI
                           000001  3580 .if PICATOUT_MOD
      0093FE 83 02                 3581         .word BRAN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



                           000000  3582 .else
                                   3583         CALL     BRAN
                                   3584 .endif 
                           000001  3585 .if PICATOUT_MOD 
      009400 CD 85 5C         [ 4] 3586         call ADRADJ 
                                   3587 .endif ; PICATOUT_MOD
      009403 CD 92 8E         [ 4] 3588         CALL     COMMA
      009406 CD 89 BD         [ 4] 3589         CALL     HERE
                           000001  3590 .if PICATOUT_MOD 
      009409 CD 85 5C         [ 4] 3591         call ADRADJ 
                                   3592 .endif ; PICATOUT_MOD
      00940C CD 83 F7         [ 4] 3593         CALL     SWAPP
      00940F CC 83 29         [ 2] 3594         JP     STORE
                                   3595 
                                   3596 ;       AFT         ( a -- a A )
                                   3597 ;       Jump to THEN in a FOR-AFT-THEN-NEXT loop the first time through.
      009412 93 F4                 3598         .word      LINK
                           001394  3599 LINK = . 
      009414 83                    3600 	.byte      IMEDD+3
      009415 41 46 54              3601         .ascii     "AFT"
      009418                       3602 AFT:
      009418 CD 83 DD         [ 4] 3603         CALL     DROP
      00941B CD 93 CB         [ 4] 3604         CALL     AHEAD
      00941E CD 89 BD         [ 4] 3605         CALL     HERE
      009421 CC 83 F7         [ 2] 3606         JP     SWAPP
                                   3607 
                                   3608 ;       ABORT"      ( -- ; <string> )
                                   3609 ;       Conditional abort with an error message.
      009424 94 14                 3610         .word      LINK
                           0013A6  3611 LINK = . 
      009426 86                    3612 	.byte      IMEDD+6
      009427 41 42 4F 52 54        3613         .ascii     "ABORT"
      00942C 22                    3614         .byte      '"'
      00942D                       3615 ABRTQ:
      00942D CD 92 D3         [ 4] 3616         CALL     COMPI
                           000001  3617 .if PICATOUT_MOD
      009430 91 51                 3618         .word ABORQ
                           000000  3619 .else
                                   3620         CALL     ABORQ
                                   3621 .endif
      009432 CC 93 03         [ 2] 3622         JP     STRCQ
                                   3623 
                                   3624 ;       $"     ( -- ; <string> )
                                   3625 ;       Compile an inline string literal.
      009435 94 26                 3626         .word      LINK
                           0013B7  3627 LINK = . 
      009437 82                    3628 	.byte      IMEDD+2
      009438 24 22                 3629         .byte     '$','"'
      00943A                       3630 STRQ:
      00943A CD 92 D3         [ 4] 3631         CALL     COMPI
                           000001  3632 .if PICATOUT_MOD
      00943D 8D 6B                 3633         .word STRQP 
                           000000  3634 .else
                                   3635         CALL     STRQP
                                   3636 .endif
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



      00943F CC 93 03         [ 2] 3637         JP     STRCQ
                                   3638 
                                   3639 ;       ."          ( -- ; <string> )
                                   3640 ;       Compile an inline string literal to be typed out at run time.
      009442 94 37                 3641         .word      LINK
                           0013C4  3642 LINK = . 
      009444 82                    3643 	.byte      IMEDD+2
      009445 2E 22                 3644         .byte     '.','"'
      009447                       3645 DOTQ:
      009447 CD 92 D3         [ 4] 3646         CALL     COMPI
                           000001  3647 .if PICATOUT_MOD
      00944A 8D 75                 3648         .word DOTQP 
                           000000  3649 .else
                                   3650         CALL     DOTQP
                                   3651 .endif 
      00944C CC 93 03         [ 2] 3652         JP     STRCQ
                                   3653 
                                   3654 ;; Name compiler
                                   3655 
                                   3656 ;       ?UNIQUE ( a -- a )
                                   3657 ;       Display a warning message
                                   3658 ;       if word already exists.
      00944F 94 44                 3659         .word      LINK
                           0013D1  3660 LINK = . 
      009451 07                    3661         .byte      7
      009452 3F 55 4E 49 51 55 45  3662         .ascii     "?UNIQUE"
      009459                       3663 UNIQU:
      009459 CD 83 E7         [ 4] 3664         CALL     DUPP
      00945C CD 90 45         [ 4] 3665         CALL     NAMEQ   ;?name exists
      00945F CD 82 EB         [ 4] 3666         CALL     QBRAN
      009462 94 78                 3667         .word      UNIQ1
      009464 CD 8D 75         [ 4] 3668         CALL     DOTQP   ;redef are OK
      009467 07                    3669         .byte       7
      009468 20 72 65 44 65 66 20  3670         .ascii     " reDef "       
      00946F CD 84 11         [ 4] 3671         CALL     OVER
      009472 CD 89 A6         [ 4] 3672         CALL     COUNT
      009475 CD 8D 18         [ 4] 3673         CALL     TYPES   ;just in case
      009478 CC 83 DD         [ 2] 3674 UNIQ1:  JP     DROP
                                   3675 
                                   3676 ;       $,n     ( na -- )
                                   3677 ;       Build a new dictionary name
                                   3678 ;       using string at na.
                           000001  3679 .if PICATOUT_MOD
                                   3680 ; compile dans l'espace des variables 
                                   3681 .endif 
      00947B 94 51                 3682         .word      LINK
                           0013FD  3683 LINK = . 
      00947D 03                    3684         .byte      3
      00947E 24 2C 6E              3685         .ascii     "$,n"
      009481                       3686 SNAME:
      009481 CD 83 E7         [ 4] 3687         CALL     DUPP
      009484 CD 83 5E         [ 4] 3688         CALL     CAT     ;?null input
      009487 CD 82 EB         [ 4] 3689         CALL     QBRAN
      00948A 94 B7                 3690         .word      PNAM1
      00948C CD 94 59         [ 4] 3691         CALL     UNIQU   ;?redefinition
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      00948F CD 83 E7         [ 4] 3692         CALL     DUPP
      009492 CD 89 A6         [ 4] 3693         CALL     COUNT
      009495 CD 85 BD         [ 4] 3694         CALL     PLUS
      009498 CD 85 23         [ 4] 3695         CALL     VPP
      00949B CD 83 29         [ 4] 3696         CALL     STORE
      00949E CD 83 E7         [ 4] 3697         CALL     DUPP
      0094A1 CD 85 41         [ 4] 3698         CALL     LAST
      0094A4 CD 83 29         [ 4] 3699         CALL     STORE   ;save na for vocabulary link
      0094A7 CD 88 80         [ 4] 3700         CALL     CELLM   ;link address
      0094AA CD 85 15         [ 4] 3701         CALL     CNTXT
      0094AD CD 83 40         [ 4] 3702         CALL     AT
      0094B0 CD 83 F7         [ 4] 3703         CALL     SWAPP
      0094B3 CD 83 29         [ 4] 3704         CALL     STORE
      0094B6 81               [ 4] 3705         RET     ;save code pointer
      0094B7 CD 8D 6B         [ 4] 3706 PNAM1:  CALL     STRQP
      0094BA 05                    3707         .byte      5
      0094BB 20 6E 61 6D 65        3708         .ascii     " name" ;null input
      0094C0 CC 91 59         [ 2] 3709         JP     ABOR1
                                   3710 
                                   3711 ;; FORTH compiler
                                   3712 
                                   3713 ;       $COMPILE        ( a -- )
                                   3714 ;       Compile next word to
                                   3715 ;       dictionary as a token or literal.
      0094C3 94 7D                 3716         .word      LINK
                           001445  3717 LINK = . 
      0094C5 08                    3718         .byte      8
      0094C6 24 43 4F 4D 50 49 4C  3719         .ascii     "$COMPILE"
             45
      0094CE                       3720 SCOMP:
      0094CE CD 90 45         [ 4] 3721         CALL     NAMEQ
      0094D1 CD 85 6C         [ 4] 3722         CALL     QDUP    ;?defined
      0094D4 CD 82 EB         [ 4] 3723         CALL     QBRAN
      0094D7 94 EF                 3724         .word      SCOM2
      0094D9 CD 83 40         [ 4] 3725         CALL     AT
      0094DC CD 82 B8         [ 4] 3726         CALL     DOLIT
      0094DF 80 00                 3727         .word     0x8000	;  IMEDD*256
      0094E1 CD 84 33         [ 4] 3728         CALL     ANDD    ;?immediate
      0094E4 CD 82 EB         [ 4] 3729         CALL     QBRAN
      0094E7 94 EC                 3730         .word      SCOM1
      0094E9 CC 83 12         [ 2] 3731         JP     EXECU
      0094EC CC 95 75         [ 2] 3732 SCOM1:  JP     JSRC
      0094EF CD 8B E3         [ 4] 3733 SCOM2:  CALL     NUMBQ   ;try to convert to number
      0094F2 CD 82 EB         [ 4] 3734         CALL     QBRAN
      0094F5 91 59                 3735         .word      ABOR1
      0094F7 CC 92 F5         [ 2] 3736         JP     LITER
                                   3737 
                                   3738 ;       OVERT   ( -- )
                                   3739 ;       Link a new word into vocabulary.
      0094FA 94 C5                 3740         .word      LINK
                           00147C  3741 LINK = . 
      0094FC 05                    3742         .byte      5
      0094FD 4F 56 45 52 54        3743         .ascii     "OVERT"
      009502                       3744 OVERT:
      009502 CD 85 41         [ 4] 3745         CALL     LAST
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      009505 CD 83 40         [ 4] 3746         CALL     AT
      009508 CD 85 15         [ 4] 3747         CALL     CNTXT
      00950B CC 83 29         [ 2] 3748         JP     STORE
                                   3749 
                                   3750 ;       ;       ( -- )
                                   3751 ;       Terminate a colon definition.
      00950E 94 FC                 3752         .word      LINK
                           001490  3753 LINK = . 
      009510 C1                    3754 	.byte      IMEDD+COMPO+1
      009511 3B                    3755         .ascii     ";"
      009512                       3756 SEMIS:
      009512 CD 92 D3         [ 4] 3757         CALL     COMPI
                           000001  3758 .if PICATOUT_MOD
      009515 83 22                 3759         .word EXIT 
                           000000  3760 .else
                                   3761         CALL     EXIT
                                   3762 .endif 
      009517 CD 91 BA         [ 4] 3763         CALL     LBRAC
                           000001  3764 .if PICATOUT_MOD
      00951A CD 95 02         [ 4] 3765         call OVERT 
      00951D CD 9D FA         [ 4] 3766         CALL FMOVE
      009520 CD 9E 7F         [ 4] 3767         CALL UPDATPTR 
      009523 81               [ 4] 3768         RET 
                           000000  3769 .else 
                                   3770         JP     OVERT
                                   3771 .endif 
                                   3772 
                           000001  3773 .if PICATOUT_MOD
                                   3774 ;       Terminate an ISR definition 
                                   3775 ;       retourn ca of ISR as double
                                   3776 ;       I; ( -- ud )
      009524 95 10                 3777         .word LINK 
                           0014A6  3778         LINK=.
      009526 C2                    3779         .byte 2+IMEDD+COMPO 
      009527 49 3B                 3780         .ascii "I;" 
      009529                       3781 ISEMI:
      009529 1D 00 02         [ 2] 3782         subw x,#CELLL  
      00952C 90 AE 00 80      [ 2] 3783         ldw y,#IRET_CODE 
      009530 FF               [ 2] 3784         ldw (x),y 
      009531 CD 92 A5         [ 4] 3785         call CCOMMA
      009534 CD 91 BA         [ 4] 3786         call LBRAC 
      009537 CD 9E C4         [ 4] 3787         call IFMOVE 
      00953A CD 85 31         [ 4] 3788         CALL CPP
      00953D CD 83 40         [ 4] 3789         call AT 
      009540 CD 83 F7         [ 4] 3790         call SWAPP 
      009543 CD 85 31         [ 4] 3791         CALL CPP 
      009546 CD 83 29         [ 4] 3792         call STORE 
      009549 CD 99 17         [ 4] 3793         call UPDATCP 
      00954C CD 98 D4         [ 4] 3794         call EEPVP 
      00954F CD 83 DD         [ 4] 3795         call DROP 
      009552 CD 83 40         [ 4] 3796         call AT 
      009555 CD 85 23         [ 4] 3797         call VPP 
      009558 CD 83 29         [ 4] 3798         call STORE 
      00955B CC 88 D0         [ 2] 3799         jp ZERO
                                   3800           
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



                                   3801         
                                   3802 .endif ;PICATOUT_MOD
                                   3803 
                                   3804 ;       ]       ( -- )
                                   3805 ;       Start compiling words in
                                   3806 ;       input stream.
      00955E 95 26                 3807         .word      LINK
                           0014E0  3808 LINK = . 
      009560 01                    3809         .byte      1
      009561 5D                    3810         .ascii     "]"
      009562                       3811 RBRAC:
      009562 CD 82 B8         [ 4] 3812         CALL   DOLIT
      009565 94 CE                 3813         .word  SCOMP
      009567 CD 84 F3         [ 4] 3814         CALL   TEVAL
      00956A CC 83 29         [ 2] 3815         JP     STORE
                                   3816 
                                   3817 ;       CALL,    ( ca -- )
                                   3818 ;       Compile a subroutine call.
      00956D 95 60                 3819         .word      LINK
                           0014EF  3820 LINK = . 
      00956F 04                    3821         .byte      4
      009570 43 41 4C 4C 2C        3822         .ascii     "CALL,"
      009575                       3823 JSRC:
      009575 CD 82 B8         [ 4] 3824         CALL     DOLIT
      009578 00 CD                 3825         .word     CALLL     ;CALL
      00957A CD 92 A5         [ 4] 3826         CALL     CCOMMA
      00957D CC 92 8E         [ 2] 3827         JP     COMMA
                                   3828 
                           000001  3829 .if PICATOUT_MOD
                                   3830 ;       INIT-OFS ( -- )
                                   3831 ;       compute offset to adjust jump address 
                                   3832 ;       set variable OFFSET 
      009580 95 6F                 3833         .word LINK 
                           001502  3834         LINK=.
      009582 08                    3835         .byte 8 
      009583 49 4E 49 54 2D 4F 46  3836         .ascii "INIT-OFS" 
             53
      00958B                       3837 INITOFS:
      00958B CD 85 31         [ 4] 3838         call CPP 
      00958E CD 83 40         [ 4] 3839         call AT 
      009591 CD 89 BD         [ 4] 3840         call HERE
      009594 CD 86 1B         [ 4] 3841         call SUBB 
      009597 CD 85 53         [ 4] 3842         call OFFSET 
      00959A CD 83 29         [ 4] 3843         call STORE 
      00959D 81               [ 4] 3844         ret 
                                   3845 .endif 
                                   3846 
                                   3847 ;       :       ( -- ; <string> )
                                   3848 ;       Start a new colon definition
                                   3849 ;       using next word as its name.
      00959E 95 82                 3850         .word      LINK
                           001520  3851 LINK = . 
      0095A0 01                    3852         .byte      1
      0095A1 3A                    3853         .ascii     ":"
      0095A2                       3854 COLON:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



                           000001  3855 .if PICATOUT_MOD
      0095A2 CD 95 8B         [ 4] 3856         call INITOFS 
                                   3857 .endif ; PICATOUT_MOD
      0095A5 CD 8F 48         [ 4] 3858         CALL   TOKEN
      0095A8 CD 94 81         [ 4] 3859         CALL   SNAME
      0095AB CC 95 62         [ 2] 3860         JP     RBRAC
                                   3861 
                           000001  3862 .if PICATOUT_MOD 
                                   3863 ;       I:  ( -- )
                                   3864 ;       Start interrupt service routine definition
                                   3865 ;       those definition have no name.
      0095AE 95 A0                 3866         .word LINK
                           001530  3867         LINK=.
      0095B0 02                    3868         .byte 2 
      0095B1 49 3A                 3869         .ascii "I:" 
      0095B3                       3870 ICOLON:
      0095B3 CD 95 8B         [ 4] 3871         call INITOFS 
      0095B6 CC 95 62         [ 2] 3872         jp RBRAC  
                                   3873 .endif ; PICATOUT_MOD
                                   3874 
                                   3875 ;       IMMEDIATE       ( -- )
                                   3876 ;       Make last compiled word
                                   3877 ;       an immediate word.
      0095B9 95 B0                 3878         .word      LINK
                           00153B  3879 LINK = . 
      0095BB 09                    3880         .byte      9
      0095BC 49 4D 4D 45 44 49 41  3881         .ascii     "IMMEDIATE"
             54 45
      0095C5                       3882 IMMED:
      0095C5 CD 82 B8         [ 4] 3883         CALL     DOLIT
      0095C8 80 00                 3884         .word     0x8000	;  IMEDD*256
      0095CA CD 85 41         [ 4] 3885         CALL     LAST
      0095CD CD 83 40         [ 4] 3886         CALL     AT
      0095D0 CD 83 40         [ 4] 3887         CALL     AT
      0095D3 CD 84 47         [ 4] 3888         CALL     ORR
      0095D6 CD 85 41         [ 4] 3889         CALL     LAST
      0095D9 CD 83 40         [ 4] 3890         CALL     AT
      0095DC CC 83 29         [ 2] 3891         JP     STORE
                                   3892 
                                   3893 ;; Defining words
                                   3894 
                                   3895 ;       CREATE  ( -- ; <string> )
                                   3896 ;       Compile a new array
                                   3897 ;       without allocating space.
      0095DF 95 BB                 3898         .word      LINK
                           001561  3899 LINK = . 
      0095E1 06                    3900         .byte      6
      0095E2 43 52 45 41 54 45     3901         .ascii     "CREATE"
      0095E8                       3902 CREAT:
      0095E8 CD 8F 48         [ 4] 3903         CALL     TOKEN
      0095EB CD 94 81         [ 4] 3904         CALL     SNAME
      0095EE CD 95 02         [ 4] 3905         CALL     OVERT        
      0095F1 CD 92 D3         [ 4] 3906         CALL     COMPI 
                           000001  3907 .if PICATOUT_MOD
      0095F4 84 94                 3908         .word DOVAR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



                           000000  3909 .else
                                   3910         CALL     DOVAR
                                   3911 .endif 
      0095F6 81               [ 4] 3912         RET
                                   3913 
                                   3914 ;       VARIABLE        ( -- ; <string> )
                                   3915 ;       Compile a new variable
                                   3916 ;       initialized to 0.
      0095F7 95 E1                 3917         .word      LINK
                           001579  3918 LINK = . 
      0095F9 08                    3919         .byte      8
      0095FA 56 41 52 49 41 42 4C  3920         .ascii     "VARIABLE"
             45
      009602                       3921 VARIA:
                           000001  3922 .if PICATOUT_MOD
                                   3923 ; indirect variable so that VARIABLE definition can be compiled in FLASH 
      009602 CD 89 BD         [ 4] 3924         CALL HERE
      009605 CD 83 E7         [ 4] 3925         CALL DUPP 
      009608 CD 88 71         [ 4] 3926         CALL CELLP
      00960B CD 85 23         [ 4] 3927         CALL VPP 
      00960E CD 83 29         [ 4] 3928         CALL STORE
      009611 CD 99 2E         [ 4] 3929         call UPDATVP 
                                   3930 .endif         
      009614 CD 95 E8         [ 4] 3931         CALL CREAT
      009617 CD 83 E7         [ 4] 3932         CALL DUPP
      00961A CD 92 8E         [ 4] 3933         CALL COMMA
      00961D CD 88 D0         [ 4] 3934         CALL ZERO
                           000001  3935 .if PICATOUT_MOD 
      009620 CD 83 F7         [ 4] 3936         call SWAPP 
      009623 CD 83 29         [ 4] 3937         CALL STORE 
      009626 CD 9D FA         [ 4] 3938         CALL FMOVE ; move definition to FLASH
      009629 CD 9E 7F         [ 4] 3939         CALL UPDATPTR
      00962C 81               [ 4] 3940         RET 
                                   3941 .endif ;PICATOUT_MOD        
                                   3942 
                           000001  3943 .if PICATOUT_MOD
                                   3944 ;       CONSTANT  ( n -- ; <string> )
                                   3945 ;       Compile a new constant 
                                   3946 ;       n CONSTANT name 
      00962D 95 F9                 3947         .word LINK 
                           0015AF  3948         LINK=. 
      00962F 08                    3949         .byte 8 
      009630 43 4F 4E 53 54 41 4E  3950         .ascii "CONSTANT" 
             54
      009638                       3951 CONSTANT:          
      009638 CD 8F 48         [ 4] 3952         CALL TOKEN
      00963B CD 94 81         [ 4] 3953         CALL SNAME 
      00963E CD 95 02         [ 4] 3954         CALL OVERT 
      009641 CD 92 D3         [ 4] 3955         CALL COMPI 
                           000001  3956 .if PICATOUT_MOD
      009644 96 5A                 3957         .word DOCONST
                           000000  3958 .else
                                   3959         CALL DOCONST
                                   3960 .endif 
      009646 CD 92 8E         [ 4] 3961         CALL COMMA 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      009649 CD 9D FA         [ 4] 3962         CALL FMOVE
      00964C CD 9E 7F         [ 4] 3963         CALL UPDATPTR  
      00964F 81               [ 4] 3964         RET          
                                   3965 
                                   3966 ; CONSTANT runtime semantic 
                                   3967 ; doCONST  ( -- n )
      009650 96 2F                 3968         .word LINK 
                           0015D2  3969         LINK=.
      009652 07                    3970         .byte 7
      009653 44 4F 43 4F 4E 53 54  3971         .ascii "DOCONST"
      00965A                       3972 DOCONST:
      00965A 1D 00 02         [ 2] 3973         subw x,#CELLL
      00965D 90 85            [ 2] 3974         popw y 
      00965F 90 FE            [ 2] 3975         ldw y,(y) 
      009661 FF               [ 2] 3976         ldw (x),y 
      009662 81               [ 4] 3977         ret 
                                   3978 .endif ;PICATOUT_MOD
                                   3979 
                                   3980 
                                   3981 ;; Tools
                                   3982 
                                   3983 ;       _TYPE   ( b u -- )
                                   3984 ;       Display a string. Filter
                                   3985 ;       non-printing characters.
      009663 96 52                 3986         .word      LINK
                           0015E5  3987 LINK = . 
      009665 05                    3988         .byte      5
      009666 5F 54 59 50 45        3989         .ascii     "_TYPE"
      00966B                       3990 UTYPE:
      00966B CD 83 B0         [ 4] 3991         CALL     TOR     ;start count down loop
      00966E 20 0F            [ 2] 3992         JRA     UTYP2   ;skip first pass
      009670 CD 83 E7         [ 4] 3993 UTYP1:  CALL     DUPP
      009673 CD 83 5E         [ 4] 3994         CALL     CAT
      009676 CD 88 FA         [ 4] 3995         CALL     TCHAR
      009679 CD 82 A2         [ 4] 3996         CALL     EMIT    ;display only printable
      00967C CD 88 9C         [ 4] 3997         CALL     ONEP    ;increment address
      00967F CD 82 CC         [ 4] 3998 UTYP2:  CALL     DONXT
      009682 96 70                 3999         .word      UTYP1   ;loop till done
      009684 CC 83 DD         [ 2] 4000         JP     DROP
                                   4001 
                                   4002 ;       dm+     ( a u -- a )
                                   4003 ;       Dump u bytes from ,
                                   4004 ;       leaving a+u on  stack.
      009687 96 65                 4005         .word      LINK
                           001609  4006 LINK = . 
      009689 03                    4007         .byte      3
      00968A 64 6D 2B              4008         .ascii     "dm+"
      00968D                       4009 DUMPP:
      00968D CD 84 11         [ 4] 4010         CALL     OVER
      009690 CD 82 B8         [ 4] 4011         CALL     DOLIT
      009693 00 04                 4012         .word      4
      009695 CD 8D 9E         [ 4] 4013         CALL     UDOTR   ;display address
      009698 CD 8C EE         [ 4] 4014         CALL     SPACE
      00969B CD 83 B0         [ 4] 4015         CALL     TOR     ;start count down loop
      00969E 20 11            [ 2] 4016         JRA     PDUM2   ;skip first pass
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      0096A0 CD 83 E7         [ 4] 4017 PDUM1:  CALL     DUPP
      0096A3 CD 83 5E         [ 4] 4018         CALL     CAT
      0096A6 CD 82 B8         [ 4] 4019         CALL     DOLIT
      0096A9 00 03                 4020         .word      3
      0096AB CD 8D 9E         [ 4] 4021         CALL     UDOTR   ;display numeric data
      0096AE CD 88 9C         [ 4] 4022         CALL     ONEP    ;increment address
      0096B1 CD 82 CC         [ 4] 4023 PDUM2:  CALL     DONXT
      0096B4 96 A0                 4024         .word      PDUM1   ;loop till done
      0096B6 81               [ 4] 4025         RET
                                   4026 
                                   4027 ;       DUMP    ( a u -- )
                                   4028 ;       Dump u bytes from a,
                                   4029 ;       in a formatted manner.
      0096B7 96 89                 4030         .word      LINK
                           001639  4031 LINK = . 
      0096B9 04                    4032         .byte      4
      0096BA 44 55 4D 50           4033         .ascii     "DUMP"
      0096BE                       4034 DUMP:
      0096BE CD 84 A4         [ 4] 4035         CALL     BASE
      0096C1 CD 83 40         [ 4] 4036         CALL     AT
      0096C4 CD 83 B0         [ 4] 4037         CALL     TOR
      0096C7 CD 8B 76         [ 4] 4038         CALL     HEX     ;save radix, set hex
      0096CA CD 82 B8         [ 4] 4039         CALL     DOLIT
      0096CD 00 10                 4040         .word      16
      0096CF CD 87 C2         [ 4] 4041         CALL     SLASH   ;change count to lines
      0096D2 CD 83 B0         [ 4] 4042         CALL     TOR     ;start count down loop
      0096D5 CD 8D 36         [ 4] 4043 DUMP1:  CALL     CR
      0096D8 CD 82 B8         [ 4] 4044         CALL     DOLIT
      0096DB 00 10                 4045         .word      16
      0096DD CD 85 A8         [ 4] 4046         CALL     DDUP
      0096E0 CD 96 8D         [ 4] 4047         CALL     DUMPP   ;display numeric
      0096E3 CD 85 7D         [ 4] 4048         CALL     ROT
      0096E6 CD 85 7D         [ 4] 4049         CALL     ROT
      0096E9 CD 8C EE         [ 4] 4050         CALL     SPACE
      0096EC CD 8C EE         [ 4] 4051         CALL     SPACE
      0096EF CD 96 6B         [ 4] 4052         CALL     UTYPE   ;display printable characters
      0096F2 CD 82 CC         [ 4] 4053         CALL     DONXT
      0096F5 96 D5                 4054         .word      DUMP1   ;loop till done
      0096F7 CD 83 DD         [ 4] 4055 DUMP3:  CALL     DROP
      0096FA CD 83 91         [ 4] 4056         CALL     RFROM
      0096FD CD 84 A4         [ 4] 4057         CALL     BASE
      009700 CC 83 29         [ 2] 4058         JP     STORE   ;restore radix
                                   4059 
                                   4060 ;       .S      ( ... -- ... )
                                   4061 ;        Display  contents of stack.
      009703 96 B9                 4062         .word      LINK
                           001685  4063 LINK = . 
      009705 02                    4064         .byte      2
      009706 2E 53                 4065         .ascii     ".S"
      009708                       4066 DOTS:
      009708 CD 8D 36         [ 4] 4067         CALL     CR
      00970B CD 89 13         [ 4] 4068         CALL     DEPTH   ;stack depth
      00970E CD 83 B0         [ 4] 4069         CALL     TOR     ;start count down loop
      009711 20 0C            [ 2] 4070         JRA     DOTS2   ;skip first pass
      009713 CD 83 A4         [ 4] 4071 DOTS1:  CALL     RAT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



      009716 CD 88 9C         [ 4] 4072         CALL ONEP
      009719 CD 89 2A         [ 4] 4073 	CALL     PICK
      00971C CD 8D D1         [ 4] 4074         CALL     DOT     ;index stack, display contents
      00971F CD 82 CC         [ 4] 4075 DOTS2:  CALL     DONXT
      009722 97 13                 4076         .word      DOTS1   ;loop till done
      009724 CD 8D 75         [ 4] 4077         CALL     DOTQP
      009727 05                    4078         .byte      5
      009728 20 3C 73 70 20        4079         .ascii     " <sp "
      00972D 81               [ 4] 4080         RET
                                   4081 
                                   4082 ;       >NAME   ( ca -- na | F )
                                   4083 ;       Convert code address
                                   4084 ;       to a name address.
      00972E 97 05                 4085         .word      LINK
                           0016B0  4086 LINK = . 
      009730 05                    4087         .byte      5
      009731 3E 4E 41 4D 45        4088         .ascii     ">NAME"
      009736                       4089 TNAME:
      009736 CD 85 15         [ 4] 4090         CALL     CNTXT   ;vocabulary link
      009739 CD 83 40         [ 4] 4091 TNAM2:  CALL     AT
      00973C CD 83 E7         [ 4] 4092         CALL     DUPP    ;?last word in a vocabulary
      00973F CD 82 EB         [ 4] 4093         CALL     QBRAN
      009742 97 5D                 4094         .word      TNAM4
      009744 CD 85 A8         [ 4] 4095         CALL     DDUP
      009747 CD 8F 56         [ 4] 4096         CALL     NAMET
      00974A CD 84 5C         [ 4] 4097         CALL     XORR    ;compare
      00974D CD 82 EB         [ 4] 4098         CALL     QBRAN
      009750 97 57                 4099         .word      TNAM3
      009752 CD 88 80         [ 4] 4100         CALL     CELLM   ;continue with next word
      009755 20 E2            [ 2] 4101         JRA     TNAM2
      009757 CD 83 F7         [ 4] 4102 TNAM3:  CALL     SWAPP
      00975A CC 83 DD         [ 2] 4103         JP     DROP
      00975D CD 85 9D         [ 4] 4104 TNAM4:  CALL     DDROP
      009760 CC 88 D0         [ 2] 4105         JP     ZERO
                                   4106 
                                   4107 ;       .ID     ( na -- )
                                   4108 ;        Display  name at address.
      009763 97 30                 4109         .word      LINK
                           0016E5  4110 LINK = . 
      009765 03                    4111         .byte      3
      009766 2E 49 44              4112         .ascii     ".ID"
      009769                       4113 DOTID:
      009769 CD 85 6C         [ 4] 4114         CALL     QDUP    ;if zero no name
      00976C CD 82 EB         [ 4] 4115         CALL     QBRAN
      00976F 97 7F                 4116         .word      DOTI1
      009771 CD 89 A6         [ 4] 4117         CALL     COUNT
      009774 CD 82 B8         [ 4] 4118         CALL     DOLIT
      009777 00 1F                 4119         .word      0x1F
      009779 CD 84 33         [ 4] 4120         CALL     ANDD    ;mask lexicon bits
      00977C CC 96 6B         [ 2] 4121         JP     UTYPE
      00977F CD 8D 75         [ 4] 4122 DOTI1:  CALL     DOTQP
      009782 09                    4123         .byte      9
      009783 20 6E 6F 4E 61 6D 65  4124         .ascii     " noName"
      00978A 81               [ 4] 4125         RET
                                   4126 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



                           000000  4127 WANT_SEE=0 
                           000000  4128 .if WANT_SEE 
                                   4129 ;       SEE     ( -- ; <string> )
                                   4130 ;       A simple decompiler.
                                   4131 ;       Updated for byte machines.
                                   4132         .word      LINK
                                   4133 LINK = . 
                                   4134         .byte      3
                                   4135         .ascii     "SEE"
                                   4136 SEE:
                                   4137         CALL     TICK    ;starting address
                                   4138         CALL     CR
                                   4139         CALL     ONEM
                                   4140 SEE1:   CALL     ONEP
                                   4141         CALL     DUPP
                                   4142         CALL     AT
                                   4143         CALL     DUPP    ;?does it contain a zero
                                   4144         CALL     QBRAN
                                   4145         .word    SEE2
                                   4146         CALL     TNAME   ;?is it a name
                                   4147 SEE2:   CALL     QDUP    ;name address or zero
                                   4148         CALL     QBRAN
                                   4149         .word    SEE3
                                   4150         CALL     SPACE
                                   4151         CALL     DOTID   ;display name
                                   4152         CALL     ONEP
                                   4153         JRA      SEE4
                                   4154 SEE3:   CALL     DUPP
                                   4155         CALL     CAT
                                   4156         CALL     UDOT    ;display number
                                   4157 SEE4:   CALL     NUFQ    ;user control
                                   4158         CALL     QBRAN
                                   4159         .word    SEE1
                                   4160         JP     DROP
                                   4161 .endif ; WANT_SEE 
                                   4162 
                                   4163 ;       WORDS   ( -- )
                                   4164 ;       Display names in vocabulary.
      00978B 97 65                 4165         .word      LINK
                           00170D  4166 LINK = . 
      00978D 05                    4167         .byte      5
      00978E 57 4F 52 44 53        4168         .ascii     "WORDS"
      009793                       4169 WORDS:
      009793 CD 8D 36         [ 4] 4170         CALL     CR
      009796 CD 85 15         [ 4] 4171         CALL     CNTXT   ;only in context
      009799 CD 83 40         [ 4] 4172 WORS1:  CALL     AT
      00979C CD 85 6C         [ 4] 4173         CALL     QDUP    ;?at end of list
      00979F CD 82 EB         [ 4] 4174         CALL     QBRAN
      0097A2 97 B8                 4175         .word      WORS2
      0097A4 CD 83 E7         [ 4] 4176         CALL     DUPP
      0097A7 CD 8C EE         [ 4] 4177         CALL     SPACE
      0097AA CD 97 69         [ 4] 4178         CALL     DOTID   ;display a name
      0097AD CD 88 80         [ 4] 4179         CALL     CELLM
      0097B0 CD 83 02         [ 4] 4180         CALL     BRAN
      0097B3 97 99                 4181         .word      WORS1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



      0097B5 CD 83 DD         [ 4] 4182         CALL     DROP
      0097B8 81               [ 4] 4183 WORS2:  RET
                                   4184 
                                   4185         
                                   4186 ;; Hardware reset
                                   4187 
                                   4188 ;       hi      ( -- )
                                   4189 ;       Display sign-on message.
      0097B9 97 8D                 4190         .word      LINK
                           00173B  4191 LINK = . 
      0097BB 02                    4192         .byte      2
      0097BC 68 69                 4193         .ascii     "hi"
      0097BE                       4194 HI:
      0097BE CD 8D 36         [ 4] 4195         CALL     CR
      0097C1 CD 8D 75         [ 4] 4196         CALL     DOTQP   ;initialize I/O
      0097C4 0F                    4197         .byte      15
      0097C5 73 74 6D 38 65 46 6F  4198         .ascii     "stm8eForth v"
             72 74 68 20 76
      0097D1 32                    4199 	.byte      VER+'0'
      0097D2 2E                    4200         .byte      '.' 
      0097D3 31                    4201 	.byte      EXT+'0' ;version
      0097D4 CC 8D 36         [ 2] 4202         JP     CR
                                   4203 
                           000000  4204 WANT_DEBUG=0
                           000000  4205 .if WANT_DEBUG 
                                   4206 ;       DEBUG      ( -- )
                                   4207 ;       Display sign-on message.
                                   4208 ;        .word      LINK
                                   4209 LINK = . 
                                   4210         .byte      5
                                   4211         .ascii     "DEBUG"
                                   4212 DEBUG:
                                   4213 	CALL DOLIT
                                   4214 	.word 0x65
                                   4215 	CALL EMIT
                                   4216 	CALL DOLIT
                                   4217 	.word 0
                                   4218  	CALL ZLESS 
                                   4219 	CALL DOLIT
                                   4220 	.word 0xFFFE
                                   4221 	CALL ZLESS 
                                   4222 	CALL UPLUS 
                                   4223  	CALL DROP 
                                   4224 	CALL DOLIT
                                   4225 	.word 3
                                   4226 	CALL UPLUS 
                                   4227 	CALL UPLUS 
                                   4228  	CALL DROP
                                   4229 	CALL DOLIT
                                   4230 	.word 0x43
                                   4231 	CALL UPLUS 
                                   4232  	CALL DROP
                                   4233 	CALL EMIT
                                   4234 	CALL DOLIT
                                   4235 	.word 0x4F
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



                                   4236 	CALL DOLIT
                                   4237 	.word 0x6F
                                   4238  	CALL XORR
                                   4239 	CALL DOLIT
                                   4240 	.word 0xF0
                                   4241  	CALL ANDD
                                   4242 	CALL DOLIT
                                   4243 	.word 0x4F
                                   4244  	CALL ORR
                                   4245 	CALL EMIT
                                   4246 	CALL DOLIT
                                   4247 	.word 8
                                   4248 	CALL DOLIT
                                   4249 	.word 6
                                   4250  	CALL SWAPP
                                   4251 	CALL OVER
                                   4252 	CALL XORR
                                   4253 	CALL DOLIT
                                   4254 	.word 3
                                   4255 	CALL ANDD 
                                   4256 	CALL ANDD
                                   4257 	CALL DOLIT
                                   4258 	.word 0x70
                                   4259 	CALL UPLUS 
                                   4260 	CALL DROP
                                   4261 	CALL EMIT
                                   4262 	CALL DOLIT
                                   4263 	.word 0
                                   4264 	CALL QBRAN
                                   4265 	.word DEBUG1
                                   4266 	CALL DOLIT
                                   4267 	.word 0x3F
                                   4268 DEBUG1:
                                   4269 	CALL DOLIT
                                   4270 	.word 0xFFFF
                                   4271 	CALL QBRAN
                                   4272 	.word DEBUG2
                                   4273 	CALL DOLIT
                                   4274 	.word 0x74
                                   4275 	CALL BRAN
                                   4276 	.word DEBUG3
                                   4277 DEBUG2:
                                   4278 	CALL DOLIT
                                   4279 	.word 0x21
                                   4280 DEBUG3:
                                   4281 	CALL EMIT
                                   4282 	CALL DOLIT
                                   4283 	.word 0x68
                                   4284 	CALL DOLIT
                                   4285 	.word 0x80
                                   4286 	CALL STORE
                                   4287 	CALL DOLIT
                                   4288 	.word 0x80
                                   4289 	CALL AT
                                   4290 	CALL EMIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



                                   4291 	CALL DOLIT
                                   4292 	.word 0x4D
                                   4293 	CALL TOR
                                   4294 	CALL RAT
                                   4295 	CALL RFROM
                                   4296 	CALL ANDD
                                   4297 	CALL EMIT
                                   4298 	CALL DOLIT
                                   4299 	.word 0x61
                                   4300 	CALL DOLIT
                                   4301 	.word 0xA
                                   4302 	CALL TOR
                                   4303 DEBUG4:
                                   4304 	CALL DOLIT
                                   4305 	.word 1
                                   4306 	CALL UPLUS 
                                   4307 	CALL DROP
                                   4308 	CALL DONXT
                                   4309 	.word DEBUG4
                                   4310 	CALL EMIT
                                   4311 	CALL DOLIT
                                   4312 	.word 0x656D
                                   4313 	CALL DOLIT
                                   4314 	.word 0x100
                                   4315 	CALL UMSTA
                                   4316 	CALL SWAPP
                                   4317 	CALL DOLIT
                                   4318 	.word 0x100
                                   4319 	CALL UMSTA
                                   4320 	CALL SWAPP 
                                   4321 	CALL DROP
                                   4322 	CALL EMIT
                                   4323 	CALL EMIT
                                   4324 	CALL DOLIT
                                   4325 	.word 0x2043
                                   4326 	CALL DOLIT
                                   4327 	.word 0
                                   4328 	CALL DOLIT
                                   4329 	.word 0x100
                                   4330 	CALL UMMOD
                                   4331 	CALL EMIT
                                   4332 	CALL EMIT
                                   4333 	;JP ORIG
                                   4334 	RET
                                   4335 .endif ; WANT_DEBUG 
                                   4336 
                                   4337 
                                   4338 ;       'BOOT   ( -- a )
                                   4339 ;       The application startup vector.
      0097D7 97 BB                 4340         .word      LINK
                           001759  4341 LINK = . 
      0097D9 05                    4342         .byte      5
      0097DA 27 42 4F 4F 54        4343         .ascii     "'BOOT"
      0097DF                       4344 TBOOT:
      0097DF CD 84 94         [ 4] 4345         CALL     DOVAR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



      0097E2 40 02                 4346         .word    APP_RUN      ;application to boot
                                   4347 
                                   4348 ;       COLD    ( -- )
                                   4349 ;       The hilevel cold start s=ence.
      0097E4 97 D9                 4350         .word      LINK
                           001766  4351         LINK = . 
      0097E6 04                    4352         .byte      4
      0097E7 43 4F 4C 44           4353         .ascii     "COLD"
      0097EB                       4354 COLD:
                           000000  4355 .if WANT_DEBUG
                                   4356         CALL DEBUG
                                   4357 .endif 
      0097EB CD 82 B8         [ 4] 4358 COLD1:  CALL     DOLIT
      0097EE 80 A7                 4359         .word      UZERO
      0097F0 CD 82 B8         [ 4] 4360 	CALL     DOLIT
      0097F3 00 06                 4361         .word      UPP
      0097F5 CD 82 B8         [ 4] 4362         CALL     DOLIT
      0097F8 00 16                 4363 	.word      UEND-UZERO
      0097FA CD 8A 0A         [ 4] 4364         CALL     CMOVE   ;initialize user area
                                   4365 
                           000001  4366 .if PICATOUT_MOD
                                   4367 ; if APP_RUN==0 initialize with ca de 'hi'  
      0097FD 90 CE 40 02      [ 2] 4368         ldw y,APP_RUN 
      009801 26 0B            [ 1] 4369         jrne 0$
      009803 1D 00 02         [ 2] 4370         subw x,#CELLL 
      009806 90 AE 97 BE      [ 2] 4371         ldw y,#HI  
      00980A FF               [ 2] 4372         ldw (x),y
      00980B CD 99 06         [ 4] 4373         call UPDATRUN 
      00980E                       4374 0$:        
                                   4375 ; update LAST with APP_LAST 
                                   4376 ; if APP_LAST > LAST else do the opposite
      00980E 90 CE 40 00      [ 2] 4377         ldw y,APP_LAST 
      009812 90 B3 1A         [ 2] 4378         cpw y,ULAST 
      009815 22 05            [ 1] 4379         jrugt 1$ 
                                   4380 ; save LAST at APP_LAST  
      009817 CD 98 EE         [ 4] 4381         call UPDATLAST 
      00981A 20 06            [ 2] 4382         jra 2$
      00981C                       4383 1$: ; update LAST with APP_LAST 
      00981C 90 BF 1A         [ 2] 4384         ldw ULAST,y
      00981F 90 BF 14         [ 2] 4385         ldw UCNTXT,y 
      009822                       4386 2$:  
                                   4387 ; update APP_CP if < app_space 
      009822 90 CE 40 04      [ 2] 4388         ldw y,APP_CP  
      009826 90 B3 18         [ 2] 4389         cpw y,UCP   
      009829 24 06            [ 1] 4390         jruge 3$ 
      00982B CD 99 17         [ 4] 4391         call UPDATCP
      00982E 90 BE 18         [ 2] 4392         ldw y,UCP   
      009831                       4393 3$:
      009831 90 BF 18         [ 2] 4394         ldw UCP,y                 
                                   4395 ; update UVP with APP_VP  
                                   4396 ; if APP_VP>UVP else do the opposite 
      009834 90 CE 40 06      [ 2] 4397         ldw y,APP_VP 
      009838 90 B3 16         [ 2] 4398         cpw y,UVP 
      00983B 22 05            [ 1] 4399         jrugt 4$
      00983D CD 99 2E         [ 4] 4400         call UPDATVP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



      009840 20 03            [ 2] 4401         jra 6$
      009842                       4402 4$: ; update UVP with APP_VP 
      009842 90 BF 16         [ 2] 4403         ldw UVP,y 
      009845                       4404 6$:      
                                   4405 .endif ; PICATOUT_MOD
      009845 CD 92 39         [ 4] 4406         CALL     PRESE   ;initialize data stack and TIB
      009848 CD 97 DF         [ 4] 4407         CALL     TBOOT
      00984B CD 89 F3         [ 4] 4408         CALL     ATEXE   ;application boot
      00984E CD 95 02         [ 4] 4409         CALL     OVERT
      009851 CC 92 56         [ 2] 4410         JP     QUIT    ;start interpretation
                                   4411 
                           000001  4412 .if PICATOUT_MOD
                                   4413         ; keep this include at end 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



                                   4414         .include "flash.asm"
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
      009854 97 E6                   30     .word LINK 
                           0017D6    31     LINK=.
      009856 03                      32     .byte 3 
      009857 46 50 21                33     .ascii "FP!"
      00985A                         34 fptr_store:
      00985A 90 93            [ 1]   35     ldw y,x
      00985C 90 FE            [ 2]   36     ldw y,(y)
      00985E 90 9F            [ 1]   37     ld a,yl 
      009860 B7 2E            [ 1]   38     ld FPTR,a 
      009862 1C 00 02         [ 2]   39     addw x,#CELLL 
      009865 90 93            [ 1]   40     ldw y,x 
      009867 90 FE            [ 2]   41     ldw y,(y)
      009869 90 BF 2F         [ 2]   42     ldw PTR16,y
      00986C 1C 00 02         [ 2]   43     addw x,#CELLL 
      00986F 81               [ 4]   44     ret 
                                     45 
                                     46 ;-----------------------------------
                                     47 ; return EEPROM base address 
                                     48 ; as a double 
                                     49 ;  EEPROM  ( -- ud )
                                     50 ;-----------------------------------
      009870 98 56                   51     .word LINK 
                           0017F2    52 LINK=.
      009872 06                      53     .byte 6 
      009873 45 45 50 52 4F 4D       54     .ascii "EEPROM"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



      009879                         55 EEPROM: 
      009879 90 AE 40 00      [ 2]   56     ldw y,#EEPROM_BASE
      00987D 1D 00 04         [ 2]   57     subw x,#2*CELLL 
      009880 EF 02            [ 2]   58     ldw (2,x),y 
      009882 90 5F            [ 1]   59     clrw y 
      009884 FF               [ 2]   60     ldw (x),y 
      009885 81               [ 4]   61     ret
                                     62 
                                     63 ;---------------------------------
                                     64 ; return APP_LAST pointer as double
                                     65 ; EEP-LAST ( -- ud )
                                     66 ;---------------------------------
      009886 98 72                   67 	.word LINK 
                           001808    68 	LINK=.
      009888 08                      69 	.byte 8 
      009889 45 45 50 2D 4C 41 53    70 	.ascii "EEP-LAST"
             54
      009891                         71 EEPLAST:
      009891 1D 00 04         [ 2]   72 	subw x,#2*CELLL 
      009894 90 AE 40 00      [ 2]   73 	ldw y,#APP_LAST 
      009898 EF 02            [ 2]   74 	ldw (2,x),y 
      00989A 90 5F            [ 1]   75 	clrw y 
      00989C FF               [ 2]   76 	ldw (x),y 
      00989D 81               [ 4]   77 	ret 
                                     78 
                                     79 ;----------------------------------
                                     80 ; return APP_RUN pointer as double	
                                     81 ; EEP-RUN ( -- ud )
                                     82 ;-----------------------------------
      00989E 98 88                   83 	.word LINK 
                           001820    84 	LINK=.
      0098A0 07                      85 	.byte 7
      0098A1 45 45 50 2D 52 55 4E    86 	.ascii "EEP-RUN"
      0098A8                         87 EEPRUN:
      0098A8 1D 00 04         [ 2]   88 	subw x,#2*CELLL 
      0098AB 90 AE 40 02      [ 2]   89 	ldw y,#APP_RUN 
      0098AF EF 02            [ 2]   90 	ldw (2,x),y 
      0098B1 90 5F            [ 1]   91 	clrw y 
      0098B3 FF               [ 2]   92 	ldw (x),y 
      0098B4 81               [ 4]   93 	ret 
                                     94 
                                     95 ;------------------------------------
                                     96 ; return APP_CP pointer as double 
                                     97 ; EEP-CP ( -- ud )
                                     98 ;------------------------------------
      0098B5 98 A0                   99 	.word LINK
                           001837   100 	LINK=.
      0098B7 06                     101 	.byte 6 
      0098B8 45 45 50 2D 43 50      102 	.ascii "EEP-CP"
      0098BE                        103 EEPCP:
      0098BE 1D 00 04         [ 2]  104 	subw x,#2*CELLL 
      0098C1 90 AE 40 04      [ 2]  105 	ldw y,#APP_CP  
      0098C5 EF 02            [ 2]  106 	ldw (2,x),y 
      0098C7 90 5F            [ 1]  107 	clrw y 
      0098C9 FF               [ 2]  108 	ldw (x),y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



      0098CA 81               [ 4]  109 	ret 
                                    110 
                                    111 ;------------------------------------
                                    112 ; return APP_VP pointer as double 
                                    113 ; EEP-VP ( -- ud )
                                    114 ;-------------------------------------
      0098CB 98 B7                  115 	.word LINK
                           00184D   116 	LINK=.
      0098CD 06                     117 	.byte 6
      0098CE 45 45 50 2D 56 50      118 	.ascii "EEP-VP"
      0098D4                        119 EEPVP:
      0098D4 1D 00 04         [ 2]  120 	subw x,#2*CELLL 
      0098D7 90 AE 40 06      [ 2]  121 	ldw y,#APP_VP  
      0098DB EF 02            [ 2]  122 	ldw (2,x),y 
      0098DD 90 5F            [ 1]  123 	clrw y 
      0098DF FF               [ 2]  124 	ldw (x),y 
      0098E0 81               [ 4]  125 	ret 
                                    126 
                                    127 ;----------------------------------
                                    128 ; update APP_LAST with LAST 
                                    129 ; UPDAT-LAST ( -- )
                                    130 ;----------------------------------
      0098E1 98 CD                  131 	.word LINK 
                           001863   132 	LINK=.
      0098E3 0A                     133 	.byte 10
      0098E4 55 50 44 41 54 2D 4C   134 	.ascii "UPDAT-LAST"
             41 53 54
      0098EE                        135 UPDATLAST:
      0098EE CD 85 41         [ 4]  136 	call LAST
      0098F1 CD 83 40         [ 4]  137 	call AT  
      0098F4 CD 98 91         [ 4]  138 	call EEPLAST
      0098F7 CC 9A 6A         [ 2]  139 	jp ee_store 
                                    140 
                                    141 ;---------------------------------
                                    142 ; update APP_RUN 
                                    143 ; UPDAT-RUN ( a -- )
                                    144 ;---------------------------------
      0098FA 98 E3                  145 	.word LINK
                           00187C   146 	LINK=.
      0098FC 09                     147 	.byte 9
      0098FD 55 50 44 41 54 2D 52   148 	.ascii "UPDAT-RUN"
             55 4E
      009906                        149 UPDATRUN:
      009906 CD 98 A8         [ 4]  150 	call EEPRUN
      009909 CC 9A 6A         [ 2]  151 	jp ee_store 
                                    152 	
                                    153 ;---------------------------------
                                    154 ; update APP_CP with CP 
                                    155 ; UPDAT-CP ( -- )
                                    156 ;---------------------------------
      00990C 98 FC                  157 	.word LINK 
                           00188E   158 	LINK=.
      00990E 08                     159 	.byte 8 
      00990F 55 50 44 41 54 2D 43   160 	.ascii "UPDAT-CP"
             50
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      009917                        161 UPDATCP:
      009917 CD 85 31         [ 4]  162 	call CPP 
      00991A CD 83 40         [ 4]  163 	call AT 
      00991D CD 98 BE         [ 4]  164 	call EEPCP 
      009920 CC 9A 6A         [ 2]  165 	jp ee_store 
                                    166 
                                    167 ;----------------------------------
                                    168 ; update APP_VP with VP 
                                    169 ; UPDAT-VP ( -- )
                                    170 ;----------------------------------
      009923 99 0E                  171 	.word LINK
                           0018A5   172 	LINK=.
      009925 08                     173 	.byte 8 
      009926 55 50 44 41 54 2D 56   174 	.ascii "UPDAT-VP" 
             50
      00992E                        175 UPDATVP:
      00992E CD 85 23         [ 4]  176 	call VPP 
      009931 CD 83 40         [ 4]  177 	call AT
      009934 CD 98 D4         [ 4]  178 	call EEPVP 
      009937 CC 9A 6A         [ 2]  179 	jp ee_store
                                    180 	
                                    181 
                                    182 ;----------------------------------
                                    183 ; fetch integer at address over 65535
                                    184 ;  F@   ( ud -- n )
                                    185 ;----------------------------------
      00993A 99 25                  186     .word LINK 
                           0018BC   187 LINK=.
      00993C 02                     188     .byte 2
      00993D 46 40                  189     .ascii "F@"
      00993F                        190 farat:
      00993F CD 98 5A         [ 4]  191     call fptr_store
      009942 92 BC 00 2E      [ 5]  192     ldf a,[FPTR]
      009946 1D 00 02         [ 2]  193     subw x,#CELLL 
      009949 F7               [ 1]  194     ld (x),a 
      00994A 90 AE 00 01      [ 2]  195     ldw y,#1
      00994E 91 AF 00 2E      [ 1]  196     ldf a,([FPTR],y)
      009952 E7 01            [ 1]  197     ld (1,x),a
      009954 81               [ 4]  198     ret 
                                    199 
                                    200 ;-------------------------------------
                                    201 ; fetch C at address over 65535 
                                    202 ; FC@ ( ud -- c)
                                    203 ;-------------------------------------
      009955 99 3C                  204     .word LINK
                           0018D7   205     LINK=.
      009957 03                     206     .byte 3 
      009958 46 43 40               207     .ascii "FC@" 
      00995B                        208 farcat:
      00995B CD 98 5A         [ 4]  209     call fptr_store 
      00995E 92 BC 00 2E      [ 5]  210     ldf a,[FPTR]
      009962 1D 00 02         [ 2]  211     subw x,#CELLL 
      009965 E7 01            [ 1]  212     ld (1,x),a 
      009967 7F               [ 1]  213     clr (x)
      009968 81               [ 4]  214     ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



                                    215     
                                    216 ;----------------------------------
                                    217 ; unlock EEPROM/OPT for writing/erasing
                                    218 ; wait endlessly for FLASH_IAPSR_DUL bit.
                                    219 ;  UNLKEE   ( -- )
                                    220 ;----------------------------------
      009969 99 57                  221     .word LINK 
                           0018EB   222 LINK=.
      00996B 06                     223     .byte 6 
      00996C 55 4E 4C 4B 45 45      224     .ascii "UNLKEE"
      009972                        225 unlock_eeprom:
      009972 35 00 50 5B      [ 1]  226 	mov FLASH_CR2,#0 
      009976 35 FF 50 5C      [ 1]  227 	mov FLASH_NCR2,#0xFF 
      00997A 35 AE 50 64      [ 1]  228 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      00997E 35 56 50 64      [ 1]  229     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      009982 72 07 50 5F FB   [ 2]  230 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      009987 81               [ 4]  231 	ret
                                    232 
                                    233 ;----------------------------------
                                    234 ; unlock FLASH for writing/erasing
                                    235 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                    236 ; UNLKFL  ( -- )
                                    237 ;----------------------------------
      009988 99 6B                  238     .word LINK 
                           00190A   239 LINK=. 
      00998A 06                     240     .byte 6 
      00998B 55 4E 4C 4B 46 4C      241     .ascii "UNLKFL"    
      009991                        242 unlock_flash:
      009991 35 00 50 5B      [ 1]  243 	mov FLASH_CR2,#0 
      009995 35 FF 50 5C      [ 1]  244 	mov FLASH_NCR2,#0xFF 
      009999 35 56 50 62      [ 1]  245 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      00999D 35 AE 50 62      [ 1]  246 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      0099A1 72 03 50 5F FB   [ 2]  247 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      0099A6 81               [ 4]  248 	ret
                                    249 
                                    250 ;-----------------------------
                                    251 ; unlock FLASH or EEPROM 
                                    252 ; according to FPTR address 
                                    253 ;  UNLOCK ( -- )
                                    254 ;-----------------------------
      0099A7 99 8A                  255 	.word LINK 
                           001929   256 	LINK=.
      0099A9 06                     257 	.byte 6
      0099AA 55 4E 4C 4F 43 4B      258 	.ascii "UNLOCK"
      0099B0                        259 unlock:
                                    260 ; put addr[15:0] in Y, for bounds check.
      0099B0 90 BE 2F         [ 2]  261 	ldw y,PTR16   ; Y=addr15:0
                                    262 ; check addr[23:16], if <> 0 then it is extened flash memory
      0099B3 3D 2E            [ 1]  263 	tnz FPTR 
      0099B5 26 16            [ 1]  264 	jrne 4$
      0099B7 90 A3 80 00      [ 2]  265     cpw y,#FLASH_BASE
      0099BB 24 10            [ 1]  266     jruge 4$
      0099BD 90 A3 40 00      [ 2]  267 	cpw y,#EEPROM_BASE  
      0099C1 25 0D            [ 1]  268     jrult 9$
      0099C3 90 A3 48 7F      [ 2]  269 	cpw y,#OPTION_END 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



      0099C7 22 07            [ 1]  270 	jrugt 9$
      0099C9 CD 99 72         [ 4]  271 	call unlock_eeprom
      0099CC 81               [ 4]  272 	ret 
      0099CD CD 99 91         [ 4]  273 4$: call unlock_flash
      0099D0 81               [ 4]  274 9$: ret 
                                    275 
                                    276 ;-------------------------
                                    277 ; lock write access to 
                                    278 ; FLASH and EEPROM 
                                    279 ; LOCK ( -- )
                                    280 ;-------------------------
      0099D1 99 A9                  281 	.word LINK 
                           001953   282 	LINK=.
      0099D3 04                     283 	.byte 4 
      0099D4 4C 4F 43 4B            284 	.ascii "LOCK" 
      0099D8                        285 lock: 
      0099D8 72 13 50 5F      [ 1]  286 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      0099DC 72 17 50 5F      [ 1]  287 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      0099E0 81               [ 4]  288 	ret 
                                    289 
                                    290 ;-------------------------
                                    291 ; increment FPTR 
                                    292 ; INC-FPTR ( -- )
                                    293 ;-------------------------
      0099E1 99 D3                  294 	.word LINK 
                           001963   295 	LINK=. 
      0099E3 08                     296 	.byte 8 
      0099E4 49 4E 43 2D 46 50 54   297 	.ascii "INC-FPTR" 
             52
      0099EC                        298 inc_fptr:
      0099EC 3C 30            [ 1]  299 	inc PTR8 
      0099EE 26 08            [ 1]  300 	jrne 1$
      0099F0 90 BE 2E         [ 2]  301 	ldw y,FPTR 
      0099F3 90 5C            [ 2]  302 	incw y 
      0099F5 90 BF 2E         [ 2]  303 	ldw FPTR,y 
      0099F8 81               [ 4]  304 1$: ret 
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
      0099F9 99 E3                  315 	.word LINK 
                           00197B   316 	LINK=. 
      0099FB 07                     317 	.byte 7 
      0099FC 57 52 2D 42 59 54 45   318 	.ascii "WR-BYTE" 
                                    319 
      009A03                        320 write_byte:
      009A03 90 93            [ 1]  321 	ldw y,x 
      009A05 90 FE            [ 2]  322 	ldw y,(y)
      009A07 1C 00 02         [ 2]  323 	addw x,#CELLL 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



      009A0A 90 9F            [ 1]  324 	ld a,yl
      009A0C 92 BD 00 2E      [ 4]  325 	ldf [FPTR],a
      009A10 72 05 50 5F FB   [ 2]  326 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009A15 20 D5            [ 2]  327 	jra inc_fptr 
                                    328 
                                    329 
                                    330 
                                    331 ;---------------------------------------
                                    332 ; write a byte to FLASH or EEPROM/OPTION  
                                    333 ; EEC!  (c ud -- )
                                    334 ;---------------------------------------
      009A17 99 FB                  335     .word LINK 
                           001999   336 	LINK=.
      009A19 04                     337     .byte 4 
      009A1A 45 45 43 21            338     .ascii "EEC!"
                                    339 	; local variables 
                           000001   340 	BTW = 1   ; byte to write offset on stack
                           000002   341     OPT = 2 
                           000002   342 	VSIZE = 2
      009A1E                        343 ee_cstore:
      009A1E 52 02            [ 2]  344 	sub sp,#VSIZE
      009A20 CD 98 5A         [ 4]  345     call fptr_store
      009A23 E6 01            [ 1]  346 	ld a,(1,x)
      009A25 43               [ 1]  347 	cpl a 
      009A26 6B 01            [ 1]  348 	ld (BTW,sp),a ; byte to write 
      009A28 0F 02            [ 1]  349 	clr (OPT,sp)  ; OPTION flag
      009A2A CD 99 B0         [ 4]  350 	call unlock 
                                    351 	; check if option
      009A2D 3D 2E            [ 1]  352 	tnz FPTR 
      009A2F 26 19            [ 1]  353 	jrne 2$
      009A31 90 BE 2F         [ 2]  354 	ldw y,PTR16 
      009A34 90 A3 48 00      [ 2]  355 	cpw y,#OPTION_BASE
      009A38 2B 10            [ 1]  356 	jrmi 2$
      009A3A 90 A3 48 80      [ 2]  357 	cpw y,#OPTION_END+1
      009A3E 2A 0A            [ 1]  358 	jrpl 2$
      009A40 03 02            [ 1]  359 	cpl (OPT,sp)
                                    360 	; OPTION WRITE require this unlock 
      009A42 72 1E 50 5B      [ 1]  361     bset FLASH_CR2,#FLASH_CR2_OPT
      009A46 72 1F 50 5C      [ 1]  362     bres FLASH_NCR2,#FLASH_CR2_OPT 
      009A4A                        363 2$: 
      009A4A CD 9A 03         [ 4]  364 	call write_byte 	
      009A4D 0D 02            [ 1]  365 	tnz (OPT,sp)
      009A4F 27 0D            [ 1]  366 	jreq 3$ 
      009A51 7B 01            [ 1]  367     ld a,(BTW,sp)
      009A53 90 5F            [ 1]  368     clrw y
      009A55 90 97            [ 1]  369 	ld yl,a 
      009A57 1D 00 02         [ 2]  370 	subw x,#CELLL 
      009A5A FF               [ 2]  371 	ldw (x),y 
      009A5B CD 9A 03         [ 4]  372 	call write_byte
      009A5E                        373 3$: 
      009A5E CD 99 D8         [ 4]  374 	call lock 
      009A61 5B 02            [ 2]  375 	addw sp,#VSIZE 
      009A63 81               [ 4]  376     ret
                                    377 
                                    378 ;------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



                                    379 ; write integer in FLASH|EEPROM
                                    380 ; EE! ( n ud -- )
                                    381 ;------------------------------
      009A64 9A 19                  382 	.word LINK 
                           0019E6   383 	LINK=.
      009A66 03                     384 	.byte 3 
      009A67 45 45 21               385 	.ascii "EE!"
      009A6A                        386 ee_store:
      009A6A CD 98 5A         [ 4]  387 	call fptr_store 
      009A6D CD 99 B0         [ 4]  388 	call unlock 
      009A70 90 93            [ 1]  389 	ldw y,x 
      009A72 90 FE            [ 2]  390 	ldw y,(y)
      009A74 90 89            [ 2]  391 	pushw y 
      009A76 90 5E            [ 1]  392 	swapw y 
      009A78 FF               [ 2]  393 	ldw (x),y 
      009A79 CD 9A 03         [ 4]  394 	call write_byte 
      009A7C 90 85            [ 2]  395 	popw y 
      009A7E 1D 00 02         [ 2]  396 	subw x,#CELLL
      009A81 FF               [ 2]  397 	ldw (x),y 
      009A82 CD 9A 03         [ 4]  398 	call write_byte
      009A85 CC 99 D8         [ 2]  399 	jp lock 
                                    400 
                                    401 
                                    402 ;----------------------------
                                    403 ; Erase flash memory row 
                                    404 ; stm8s208 as 128 bytes rows
                                    405 ; ROW-ERASE ( ud -- )
                                    406 ;----------------------------
      009A88 9A 66                  407 	.word LINK 
                           001A0A   408 	LINK=. 
      009A8A 09                     409 	.byte 9 
      009A8B 52 4F 57 2D 45 52 41   410 	.ascii "ROW-ERASE" 
             53 45
      009A94                        411 row_erase:
      009A94 CD 98 5A         [ 4]  412 	call fptr_store
                                    413 ;code must be execute from RAM 
                                    414 ;copy routine to PAD 
      009A97 1D 00 02         [ 2]  415 	subw x,#CELLL 
      009A9A 90 AE 9A E1      [ 2]  416 	ldw y,#row_erase_proc
      009A9E FF               [ 2]  417 	ldw (x),y 
      009A9F CD 89 CE         [ 4]  418 	call PAD 
      009AA2 90 AE 9B 08      [ 2]  419 	ldw y,#row_erase_proc_end 
      009AA6 72 A2 9A E1      [ 2]  420 	subw y,#row_erase_proc
      009AAA 1D 00 02         [ 2]  421 	subw x,#CELLL 
      009AAD FF               [ 2]  422 	ldw (x),y 
      009AAE CD 8A 0A         [ 4]  423 	call CMOVE 
      009AB1                        424 block_erase:
      009AB1 90 BE 2F         [ 2]  425 	ldw y,FPTR+1
      009AB4 90 A3 9F 00      [ 2]  426 	cpw y,#app_space 
      009AB8 2A 13            [ 1]  427 	jrpl erase_flash 
                                    428 ; erase EEPROM block
      009ABA 90 A3 40 00      [ 2]  429 	cpw y,#EEPROM_BASE 
      009ABE 24 01            [ 1]  430 	jruge 1$
      009AC0 81               [ 4]  431 	ret ; bad address 
      009AC1 90 A3 47 FF      [ 2]  432 1$: cpw y,#EEPROM_END 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



      009AC5 23 01            [ 2]  433 	jrule 2$ 
      009AC7 81               [ 4]  434 	ret ; bad address 
      009AC8                        435 2$:	
      009AC8 CD 99 72         [ 4]  436 	call unlock_eeprom 
      009ACB 20 03            [ 2]  437 	jra proceed_erase
                                    438 ; erase flash block:
      009ACD                        439 erase_flash:
      009ACD CD 99 91         [ 4]  440 	call unlock_flash 
      009AD0                        441 proceed_erase:
      009AD0 CD 89 CE         [ 4]  442 	call PAD 
      009AD3 90 93            [ 1]  443 	ldw y,x
      009AD5 90 FE            [ 2]  444 	ldw y,(y)
      009AD7 1C 00 02         [ 2]  445 	addw x,#CELLL  
      009ADA 90 FD            [ 4]  446 	call (y) 
      009ADC 72 17 50 5F      [ 1]  447 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009AE0 81               [ 4]  448 	ret 
                                    449 
                                    450 ; this routine is to be copied to PAD 
      009AE1                        451 row_erase_proc:
      009AE1 35 20 50 5B      [ 1]  452 	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
      009AE5 35 DF 50 5C      [ 1]  453 	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
      009AE9 4F               [ 1]  454 	clr a 
      009AEA 90 5F            [ 1]  455 	clrw y 
      009AEC 91 A7 00 2E      [ 1]  456 	ldf ([FPTR],y),a
      009AF0 90 5C            [ 2]  457     incw y
      009AF2 91 A7 00 2E      [ 1]  458 	ldf ([FPTR],y),a
      009AF6 90 5C            [ 2]  459     incw y
      009AF8 91 A7 00 2E      [ 1]  460 	ldf ([FPTR],y),a
      009AFC 90 5C            [ 2]  461     incw y
      009AFE 91 A7 00 2E      [ 1]  462 	ldf ([FPTR],y),a
      009B02 72 05 50 5F FB   [ 2]  463 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009B07 81               [ 4]  464 	ret
      009B08                        465 row_erase_proc_end:
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
      009B08                        478 copy_buffer:
      009B08 4B 80            [ 1]  479 	push #BLOCK_SIZE  
                                    480 ;enable block programming 
      009B0A 72 10 50 5B      [ 1]  481 	bset FLASH_CR2,#FLASH_CR2_PRG 
      009B0E 72 11 50 5C      [ 1]  482 	bres FLASH_NCR2,#FLASH_CR2_PRG
      009B12 90 5F            [ 1]  483 	clrw y
      009B14 F6               [ 1]  484 1$:	ld a,(x)
      009B15 91 A7 00 2E      [ 1]  485 	ldf ([FPTR],y),a
      009B19 5C               [ 2]  486 	incw x 
      009B1A 90 5C            [ 2]  487 	incw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



      009B1C 0A 01            [ 1]  488 	dec (BCNT,sp)
      009B1E 26 F4            [ 1]  489 	jrne 1$
                                    490 ; wait EOP bit 
      009B20 72 05 50 5F FB   [ 2]  491 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. 
      009B25 84               [ 1]  492 	pop a ; remove BCNT from stack 
      009B26 81               [ 4]  493 	ret 
      009B27                        494 copy_buffer_end:
                                    495 
                                    496 ;-------------------------
                                    497 ; move program_row to RAM 
                                    498 ; in TIB 
                                    499 ;------------------------
      009B27                        500 copy_prog_to_ram:
      009B27 1D 00 06         [ 2]  501 	subw x,#6
      009B2A 90 AE 9B 08      [ 2]  502 	ldw y,#copy_buffer 
      009B2E EF 04            [ 2]  503 	ldw (4,x),y 
      009B30 90 AE 17 00      [ 2]  504 	ldw y,#TIBBASE
      009B34 EF 02            [ 2]  505 	ldw (2,x),y 
      009B36 90 AE 9B 27      [ 2]  506 	ldw y,#copy_buffer_end 
      009B3A 72 A2 9B 08      [ 2]  507 	subw y,#copy_buffer  
      009B3E FF               [ 2]  508 	ldw (x),y 
      009B3F CD 8A 0A         [ 4]  509 	call CMOVE 
      009B42 81               [ 4]  510 	ret 
                                    511 
                                    512 
                                    513 ;-----------------------------
                                    514 ; write a row in FLASH/EEPROM 
                                    515 ; WR-ROW ( a ud -- )
                                    516 ; a -> address 128 byte buffer to write 
                                    517 ; ud ->  row address in FLASH|EEPROM 
                                    518 ;-----------------------------
      009B43 9A 8A                  519 	.word LINK 
                           001AC5   520 	LINK=.
      009B45 06                     521 	.byte 6 
      009B46 57 52 2D 52 4F 57      522 	.ascii "WR-ROW"
      009B4C                        523 write_row:
      009B4C CD 98 5A         [ 4]  524 	call fptr_store
                                    525 ; align to FLASH block 
      009B4F A6 80            [ 1]  526 	ld a,#0x80 
      009B51 B4 30            [ 1]  527 	and a,PTR8 
      009B53 B7 30            [ 1]  528 	ld PTR8,a  
      009B55 CD 9B 27         [ 4]  529 	call copy_prog_to_ram
      009B58 CD 99 B0         [ 4]  530 	call unlock
      009B5B 90 93            [ 1]  531 	ldw y,x 
      009B5D 90 FE            [ 2]  532 	ldw y,(y)
      009B5F 1C 00 02         [ 2]  533 	addw x,#CELLL 
      009B62 89               [ 2]  534 	pushw x 
      009B63 93               [ 1]  535 	ldw x,y ; buffer address in x 
      009B64 CD 17 00         [ 4]  536 	call TIBBASE
      009B67 CD 99 D8         [ 4]  537 	call lock
      009B6A 85               [ 2]  538 	popw x 
      009B6B 81               [ 4]  539 	ret 
                                    540 
                                    541 ;-------------------------------------
                                    542 ; change value of OPTION register 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



                                    543 ; SET-OPT (c n -- ) 
                                    544 ; c new value.
                                    545 ; n OPT  number {1..7}
                                    546 ;--------------------------------------
      009B6C 9B 45                  547 		.word LINK 
                           001AEE   548 		LINK=.
      009B6E 07                     549 		.byte 7 
      009B6F 53 45 54 2D 4F 50 54   550 		.ascii "SET-OPT" 
      009B76                        551 set_option: 
      009B76 90 93            [ 1]  552 		ldw y,x 
      009B78 90 FE            [ 2]  553 		ldw y,(y)
      009B7A 27 06            [ 1]  554 		jreq 1$
      009B7C 90 A3 00 07      [ 2]  555 		cpw y,#7 
      009B80 23 04            [ 2]  556 		jrule 2$ 
                                    557 ; invalid OPTION number 		
      009B82 1C 00 04         [ 2]  558 1$:		addw x,#2*CELLL
      009B85 81               [ 4]  559 		ret
      009B86 90 58            [ 2]  560 2$:		sllw y 
      009B88 72 A9 47 FF      [ 2]  561 		addw y,#OPTION_BASE-1
      009B8C FF               [ 2]  562 		ldw (x),y 
      009B8D 1D 00 02         [ 2]  563 		subw x,#CELLL 
      009B90 90 5F            [ 1]  564 		clrw y 
      009B92 FF               [ 2]  565 		ldw (x),y 
      009B93 CD 9A 1E         [ 4]  566 		call ee_cstore
      009B96 81               [ 4]  567 		ret 
                                    568 
                                    569 
                                    570 
                                    571 ;--------------------------------------
                                    572 ; reset system to its original state 
                                    573 ; before any user modification
                                    574 ; PRISTINE ( -- )
                                    575 ;-------------------------------------
      009B97 9B 6E                  576 	.word LINK  
                           001B19   577 	LINK=.
      009B99 08                     578 	.byte 8 
      009B9A 50 52 49 53 54 49 4E   579 	.ascii "PRISTINE"
             45
      009BA2                        580 pristine:
                                    581 ;;; erase EEPROM
      009BA2 CD 98 79         [ 4]  582 	call EEPROM 
      009BA5 CD 85 A8         [ 4]  583 1$:	call DDUP 
      009BA8 CD 9A 94         [ 4]  584 	call row_erase
      009BAB 90 93            [ 1]  585 	ldw y,x 
      009BAD 90 EE 02         [ 2]  586 	ldw y,(2,y)
      009BB0 72 A9 00 80      [ 2]  587 	addw y,#BLOCK_SIZE
      009BB4 EF 02            [ 2]  588 	ldw (2,x),y
      009BB6 90 A3 48 00      [ 2]  589 	cpw y,#OPTION_BASE 
      009BBA 25 E9            [ 1]  590 	jrult 1$
                                    591 ;;; reset OPTION to default values
      009BBC 90 AE 00 01      [ 2]  592 	ldw y,#1 ; OPT1 
      009BC0 FF               [ 2]  593 2$:	ldw (x),y   
      009BC1 90 5F            [ 1]  594 	clrw y 
      009BC3 EF 02            [ 2]  595 	ldw (2,x),y  ; ( 0 1 -- ) 
      009BC5 CD 85 A8         [ 4]  596 	call DDUP    ; ( 0 1 0 1 -- )  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



      009BC8 CD 9B 76         [ 4]  597 	call set_option
      009BCB 90 93            [ 1]  598 	ldw y,x 
      009BCD 90 FE            [ 2]  599 	ldw y,(y)
      009BCF 90 5C            [ 2]  600 	incw y  ; next OPTION 
      009BD1 90 A3 00 08      [ 2]  601 	cpw y,#8 
      009BD5 25 E9            [ 1]  602 	jrult 2$
                                    603 ;;; erase first row of app_space 	
      009BD7 90 AE 9F 00      [ 2]  604 	ldw y,#app_space
      009BDB EF 02            [ 2]  605 	ldw (2,x),y  
      009BDD 90 5F            [ 1]  606 	clrw y 
      009BDF FF               [ 2]  607 	ldw (x),y ; ( app_space 0 -- )
      009BE0 CD 9A 94         [ 4]  608 	call row_erase 
                                    609 ; reset interrupt vectors 
      009BE3 1D 00 02         [ 2]  610 	subw x,#CELLL 
      009BE6 90 5F            [ 1]  611 	clrw y  
      009BE8 FF               [ 2]  612 4$:	ldw (x),y  ; ( n -- ) int# 
      009BE9 CD 83 E7         [ 4]  613 	call DUPP  
      009BEC CD 9C 09         [ 4]  614 	call reset_vector
      009BEF 90 93            [ 1]  615 	ldw y,x 
      009BF1 90 FE            [ 2]  616 	ldw y,(y)
      009BF3 90 5C            [ 2]  617 	incw y   ; next vector 
      009BF5 90 A3 00 19      [ 2]  618 	cpw y,#25 
      009BF9 25 ED            [ 1]  619 	jrult 4$
      009BFB CC 80 80         [ 2]  620 	jp NonHandledInterrupt ; reset MCU
                                    621 
                                    622 ;------------------------------
                                    623 ; reset an interrupt vector 
                                    624 ; to its initial value 
                                    625 ; i.e. NonHandledInterrupt
                                    626 ; RST-IVEC ( n -- )
                                    627 ;-----------------------------
      009BFE 9B 99                  628 	.word LINK 
                           001B80   629 	LINK=. 
      009C00 08                     630 	.byte 8 
      009C01 52 53 54 2D 49 56 45   631 	.ascii "RST-IVEC"
             43
      009C09                        632 reset_vector:
      009C09 90 93            [ 1]  633 	ldw y,x
      009C0B 1C 00 02         [ 2]  634 	addw x,#CELLL 
      009C0E 90 FE            [ 2]  635 	ldw y,(y)
      009C10 90 A3 00 17      [ 2]  636 	cpw y,#23 
      009C14 27 3A            [ 1]  637 	jreq 9$
      009C16 90 A3 00 1D      [ 2]  638 	cpw y,#29 ; last vector
      009C1A 22 34            [ 1]  639 	jrugt 9$  
      009C1C 90 58            [ 2]  640 	sllw y 
      009C1E 90 58            [ 2]  641 	sllw y 
      009C20 72 A9 80 08      [ 2]  642 	addw y,#0x8008 ; irq0 address 
      009C24 90 BF 20         [ 2]  643 	ldw YTEMP,y
      009C27 1D 00 06         [ 2]  644 	subw x,#3*CELLL 
      009C2A EF 02            [ 2]  645 	ldw (2,x),y 
      009C2C 90 5F            [ 1]  646 	clrw y
      009C2E FF               [ 2]  647 	ldw (x),y 
      009C2F A6 82            [ 1]  648 	ld a,#0x82 
      009C31 90 95            [ 1]  649 	ld yh,a
      009C33 EF 04            [ 2]  650 	ldw (4,x),y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



      009C35 CD 9A 6A         [ 4]  651 	call ee_store
      009C38 1D 00 06         [ 2]  652 	subw x,#3*CELLL
      009C3B 90 5F            [ 1]  653 	clrw y 
      009C3D FF               [ 2]  654 	ldw (x),y 
      009C3E 90 AE 80 80      [ 2]  655 	ldw y,#NonHandledInterrupt
      009C42 EF 04            [ 2]  656 	ldw (4,x),y 
      009C44 90 BE 20         [ 2]  657 	ldw y,YTEMP  
      009C47 72 A9 00 02      [ 2]  658 	addw y,#2
      009C4B EF 02            [ 2]  659 	ldw (2,x),y 
      009C4D CD 9A 6A         [ 4]  660 	call ee_store
      009C50 81               [ 4]  661 9$:	ret 
                                    662 
                                    663 
                                    664 ;------------------------------
                                    665 ; all interrupt vector with 
                                    666 ; an address >= ca are resetted 
                                    667 ; to default
                                    668 ; CHKIVEC ( ca -- )
                                    669 ;------------------------------
      009C51 9C 00                  670 	.word LINK 
                           001BD3   671 	LINK=.
      009C53 07                     672 	.byte 7
      009C54 43 48 4B 49 56 45 43   673 	.ascii "CHKIVEC"
                                    674 ;local variables 
                           000001   675 	SSP=1
                           000003   676 	CADR=3
                           000005   677 	OFS=5
                           000006   678 	VSIZE=6  
      009C5B                        679 CHKIVEC:
      009C5B 52 06            [ 2]  680 	sub sp,#VSIZE ;alloc local variables 
      009C5D 90 93            [ 1]  681 	ldw y,x 
      009C5F 90 FE            [ 2]  682 	ldw y,(y)
      009C61 17 03            [ 2]  683 	ldw (CADR,sp),y ; ca 
      009C63 1F 01            [ 2]  684 	ldw (SSP,sp),x 
      009C65 AE 80 0A         [ 2]  685 	ldw x,#0x800a ; irq0 address 
      009C68 BF 2F            [ 2]  686 	ldw PTR16,X
      009C6A AE FF FC         [ 2]  687 	ldw x,#-4 
      009C6D 1C 00 04         [ 2]  688 1$:	addw x,#4
      009C70 A3 00 78         [ 2]  689 	cpw x,#30*4 ; irq0-29 
      009C73 27 22            [ 1]  690 	jreq 9$
      009C75 90 93            [ 1]  691 	ldw y,x  
      009C77 91 D6 2F         [ 4]  692 	ld a,([PTR16],y)
      009C7A 11 03            [ 1]  693 	cp a,(CADR,sp)
      009C7C 25 EF            [ 1]  694 	jrult 1$
      009C7E 90 5C            [ 2]  695 	incw y 
      009C80 91 D6 2F         [ 4]  696 	ld a,([PTR16],y)
      009C83 11 04            [ 1]  697 	cp a,(CADR+1,sp) 
      009C85 25 E6            [ 1]  698 	jrult 1$ 
      009C87 1F 05            [ 2]  699 	ldw (OFS,sp),x 
      009C89 54               [ 2]  700 	srlw x
      009C8A 54               [ 2]  701 	srlw x 
      009C8B 90 93            [ 1]  702 	ldw y,x 
      009C8D 1E 01            [ 2]  703 	ldw x,(SSP,sp)
      009C8F FF               [ 2]  704 	ldw (x),y
      009C90 CD 9C 09         [ 4]  705 	call reset_vector
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



      009C93 1E 05            [ 2]  706 	ldw x,(OFS,sp) 
      009C95 20 D6            [ 2]  707 	jra 1$
      009C97 1E 01            [ 2]  708 9$:	ldw x,(SSP,sp) 
      009C99 1C 00 02         [ 2]  709 	addw x,#CELLL 
      009C9C 5B 06            [ 2]  710 	addw sp,#VSIZE ; drop local variables  
      009C9E 81               [ 4]  711 	ret 
                                    712 
                                    713 ;------------------------------
                                    714 ; set interrupt vector 
                                    715 ; SET-IVEC ( ud n -- )
                                    716 ;  ud Handler address
                                    717 ;  n  vector # 0 .. 29 
                                    718 ;-----------------------------
      009C9F 9C 53                  719 	.word LINK
                           001C21   720 	LINK=.
      009CA1 08                     721 	.byte 8 
      009CA2 53 45 54 2D 49 56 45   722 	.ascii "SET-IVEC" 
             43
      009CAA                        723 set_vector:
      009CAA 90 93            [ 1]  724     ldw y,x 
      009CAC 1C 00 02         [ 2]  725 	addw x,#CELLL 
      009CAF 90 FE            [ 2]  726 	ldw y,(y) ; vector #
      009CB1 90 A3 00 1D      [ 2]  727 	cpw y,#29 ; last vector
      009CB5 23 04            [ 2]  728 	jrule 2$
      009CB7 1C 00 04         [ 2]  729 	addw x,#2*CELLL 
      009CBA 81               [ 4]  730 	ret
      009CBB 90 58            [ 2]  731 2$:	sllw y 
      009CBD 90 58            [ 2]  732 	sllw y 
      009CBF 72 A9 80 08      [ 2]  733 	addw y,#0X8008 ; IRQ0 vector address 
      009CC3 90 BF 20         [ 2]  734 	ldw YTEMP,y ; vector address 
      009CC6 A6 82            [ 1]  735 	ld a,#0x82 
      009CC8 90 95            [ 1]  736 	ld yh,a 
      009CCA E6 01            [ 1]  737 	ld a,(1,x) ; isr address bits 23..16 
      009CCC 90 97            [ 1]  738 	ld yl,a 
                                    739 ;  write 0x82 + most significant byte of int address	
      009CCE 1D 00 06         [ 2]  740 	subw x,#3*CELLL 
      009CD1 EF 04            [ 2]  741 	ldw (4,x),y 
      009CD3 90 BE 20         [ 2]  742 	ldw y,YTEMP
      009CD6 EF 02            [ 2]  743 	ldw (2,x),y ; vector address 
      009CD8 90 5F            [ 1]  744 	clrw y 
      009CDA FF               [ 2]  745 	ldw (x),y   ; as a double 
      009CDB CD 9A 6A         [ 4]  746 	call ee_store 
      009CDE 90 93            [ 1]  747 	ldw y,x 
      009CE0 90 EE 02         [ 2]  748 	ldw y,(2,y) ; bits 15..0 int vector 
      009CE3 1D 00 06         [ 2]  749 	subw x,#3*CELLL 
      009CE6 EF 04            [ 2]  750 	ldw (4,x),y 
      009CE8 90 BE 20         [ 2]  751 	ldw y,YTEMP 
      009CEB 72 A9 00 02      [ 2]  752 	addw y,#2 
      009CEF EF 02            [ 2]  753 	ldw (2,x),y 
      009CF1 90 5F            [ 1]  754 	clrw y 
      009CF3 FF               [ 2]  755 	ldw (x),y 
      009CF4 CD 9A 6A         [ 4]  756 	call ee_store
      009CF7 1C 00 04         [ 2]  757 	addw x,#2*CELLL  
      009CFA 81               [ 4]  758 9$: ret 
                                    759 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



                                    760 
                                    761 ;------------------------
                                    762 ; Compile word to flash
                                    763 ; EE, (w -- )
                                    764 ;-----------------------
      009CFB 9C A1                  765 	.word LINK
                           001C7D   766 	LINK=.
      009CFD 03                     767 	.byte 3
      009CFE 45 45 2C               768 	.ascii "EE,"
      009D01                        769 ee_comma:
      009D01 1D 00 04         [ 2]  770 	subw x,#2*CELLL 
      009D04 90 BE 18         [ 2]  771 	ldw y,UCP
      009D07 90 89            [ 2]  772 	pushw y 
      009D09 EF 02            [ 2]  773 	ldw (2,x),y 
      009D0B 90 5F            [ 1]  774 	clrw y 
      009D0D FF               [ 2]  775 	ldw (x),y
      009D0E CD 9A 6A         [ 4]  776 	call ee_store
      009D11 90 85            [ 2]  777 	popw y 
      009D13 72 A9 00 02      [ 2]  778 	addw y,#2
      009D17 90 BF 18         [ 2]  779 	ldw UCP,y
      009D1A 81               [ 4]  780 	ret 
                                    781 
                                    782 ;-------------------------
                                    783 ; Compile byte to flash 
                                    784 ; EEC, ( c -- )	
                                    785 ;-------------------------
      009D1B 9C FD                  786 	.word LINK 
                           001C9D   787 	LINK=.
      009D1D 04                     788 	.byte 4 
      009D1E 45 45 43 2C            789 	.ascii "EEC,"
      009D22                        790 ee_ccomma:
      009D22 1D 00 04         [ 2]  791 	subw x,#2*CELLL 
      009D25 90 BE 18         [ 2]  792 	ldw y,UCP
      009D28 90 89            [ 2]  793 	pushw y 
      009D2A EF 02            [ 2]  794 	ldw (2,x),y 
      009D2C 90 5F            [ 1]  795 	clrw y 
      009D2E FF               [ 2]  796 	ldw (x),y
      009D2F CD 9A 1E         [ 4]  797 	call ee_cstore
      009D32 90 85            [ 2]  798 	popw y 
      009D34 90 5C            [ 2]  799 	incw y 
      009D36 90 BF 18         [ 2]  800 	ldw UCP,y
      009D39 81               [ 4]  801 	ret 
                                    802 
                                    803 
                                    804 ;--------------------------
                                    805 ; copy FLASH block to ROWBUF
                                    806 ; ROW2BUF ( ud -- )
                                    807 ;--------------------------
      009D3A 9D 1D                  808 	.word LINK 
                           001CBC   809 	LINK=.
      009D3C 07                     810 	.byte 7 
      009D3D 52 4F 57 32 42 55 46   811 	.ascii "ROW2BUF"
      009D44                        812 ROW2BUF: 
      009D44 CD 98 5A         [ 4]  813 	call fptr_store 
      009D47 A6 80            [ 1]  814 	ld a,#BLOCK_SIZE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



      009D49 88               [ 1]  815 	push a 
      009D4A B4 30            [ 1]  816 	and a,PTR8 ; block align 
      009D4C B7 30            [ 1]  817 	ld PTR8,a
      009D4E 90 AE 16 80      [ 2]  818 	ldw y,#ROWBUFF 
      009D52 92 BC 00 2E      [ 5]  819 1$: ldf a,[FPTR]
      009D56 90 F7            [ 1]  820 	ld (y),a
      009D58 CD 99 EC         [ 4]  821 	call inc_fptr
      009D5B 90 5C            [ 2]  822 	incw y 
      009D5D 0A 01            [ 1]  823 	dec (1,sp)
      009D5F 26 F1            [ 1]  824 	jrne 1$ 
      009D61 84               [ 1]  825 	pop a 
      009D62 81               [ 4]  826 	ret 
                                    827 
                                    828 
                                    829 ;---------------------------
                                    830 ; copy ROWBUFF to flash 
                                    831 ; BUF2ROW ( ud -- )
                                    832 ; ud is row address as double 
                                    833 ;---------------------------
      009D63 9D 3C                  834 	.word LINK 
                           001CE5   835 	LINK=.
      009D65 07                     836 	.byte 7 
      009D66 42 55 46 32 52 4F 57   837 	.ascii "BUF2ROW" 
      009D6D                        838 BUF2ROW:
      009D6D CD 84 E2         [ 4]  839 	call TBUF ; ( ud rb -- )
      009D70 CD 85 7D         [ 4]  840 	call ROT 
      009D73 CD 85 7D         [ 4]  841 	call ROT  ; ( rb ud -- )
      009D76 CD 9B 4C         [ 4]  842 	call write_row 
      009D79 81               [ 4]  843 	ret 
                                    844 
                                    845 ;---------------------------------
                                    846 ; how many byte free in that row 
                                    847 ; RFREE ( a -- n )
                                    848 ; a is least byte of target address
                                    849 ;----------------------------------
      009D7A 9D 65                  850 	.word LINK 
                           001CFC   851 	LINK=.
      009D7C 05                     852 	.byte 5 
      009D7D 52 46 52 45 45         853 	.ascii "RFREE"
      009D82                        854 RFREE:
      009D82 E6 01            [ 1]  855 	ld a,(1,x)
      009D84 A4 7F            [ 1]  856 	and a,#BLOCK_SIZE-1 
      009D86 B7 20            [ 1]  857 	ld YTEMP,a 
      009D88 A6 80            [ 1]  858 	ld a,#BLOCK_SIZE 
      009D8A B0 20            [ 1]  859 	sub a,YTEMP 
      009D8C 90 5F            [ 1]  860 	clrw y 
      009D8E 90 97            [ 1]  861 	ld yl,a
      009D90 FF               [ 2]  862 	ldw (x),y 
      009D91 81               [ 4]  863 	ret 
                                    864 
                                    865 ;---------------------------------
                                    866 ; write u bytes to flash/EEPROM 
                                    867 ; constraint to row limit 
                                    868 ; RAM2EE ( ud a u -- u2 )
                                    869 ; ud flash address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



                                    870 ; a ram address 
                                    871 ; u bytes count
                                    872 ; return u2 bytes written  
                                    873 ;-------------------------------
      009D92 9D 7C                  874 	.word LINK 
                           001D14   875 	LINK=. 
      009D94 06                     876 	.byte 6
      009D95 52 41 4D 32 45 45      877 	.ascii "RAM2EE"
                                    878 	
      009D9B                        879 RAM2EE:
                                    880 ; copy ud on top 
      009D9B 90 93            [ 1]  881 	ldw y,x 
      009D9D 90 EE 06         [ 2]  882 	ldw y,(6,y) ; LSW of ud  
      009DA0 90 BF 20         [ 2]  883 	ldw YTEMP,y 
      009DA3 90 93            [ 1]  884 	ldw y,x 
      009DA5 90 EE 04         [ 2]  885 	ldw y,(4,y)  ; MSW of ud 
      009DA8 1D 00 04         [ 2]  886 	subw x,#2*CELLL 
      009DAB FF               [ 2]  887 	ldw (x),y 
      009DAC 90 BE 20         [ 2]  888 	ldw y,YTEMP 
      009DAF EF 02            [ 2]  889 	ldw (2,x),y 
      009DB1 CD 9D 44         [ 4]  890 	call ROW2BUF 
      009DB4 90 93            [ 1]  891 	ldw y,x 
      009DB6 90 EE 06         [ 2]  892 	ldw y,(6,y)
      009DB9 90 89            [ 2]  893 	pushw y ; udl 
      009DBB 90 9F            [ 1]  894 	ld a,yl
      009DBD A4 7F            [ 1]  895 	and a,#BLOCK_SIZE-1 
      009DBF 90 5F            [ 1]  896 	clrw y 
      009DC1 90 97            [ 1]  897 	ld yl,a 
      009DC3 72 A9 16 80      [ 2]  898 	addw y,#ROWBUFF 
      009DC7 1D 00 02         [ 2]  899 	subw x,#CELLL 
      009DCA FF               [ 2]  900 	ldw (x),y  
      009DCB CD 83 F7         [ 4]  901 	call SWAPP ;  ( ud a ra u -- )
      009DCE CD 83 91         [ 4]  902 	call RFROM  
      009DD1 CD 9D 82         [ 4]  903 	call RFREE 
      009DD4 CD 86 BD         [ 4]  904 	call MIN
      009DD7 CD 83 E7         [ 4]  905 	call DUPP 
      009DDA CD 83 B0         [ 4]  906 	call TOR  
      009DDD CD 8A 0A         [ 4]  907 	call CMOVE
      009DE0 CD 9D 6D         [ 4]  908 	call BUF2ROW 
      009DE3 CD 83 91         [ 4]  909 	call RFROM 
      009DE6 81               [ 4]  910 	ret 
                                    911 
                                    912 ;--------------------------
                                    913 ; expand 16 bit address 
                                    914 ; to 32 bit address 
                                    915 ; FADDR ( a -- ud )
                                    916 ;--------------------------
      009DE7 9D 94                  917 	.word LINK 
                           001D69   918 	LINK=. 
      009DE9 05                     919 	.byte 5 
      009DEA 46 41 44 44 52         920 	.ascii "FADDR"
      009DEF                        921 FADDR:
      009DEF CC 88 D0         [ 2]  922 	jp ZERO 
                                    923 
                                    924 ;--------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
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
      009DF2 9D E9                  938 	.word LINK 
                           001D74   939 	LINK=.
      009DF4 05                     940 	.byte 5 
      009DF5 46 4D 4F 56 45         941 	.ascii "FMOVE" 
      009DFA                        942 FMOVE:
      009DFA CD 85 31         [ 4]  943 	call CPP
      009DFD CD 83 40         [ 4]  944 	call AT  
      009E00 CD 83 E7         [ 4]  945 	call DUPP ; ( udl udl -- )
      009E03 CD 85 15         [ 4]  946 	call CNTXT 
      009E06 CD 83 40         [ 4]  947 	call AT 
      009E09 CD 82 B8         [ 4]  948 	call DOLIT 
      009E0C 00 02                  949 	.word 2 
      009E0E CD 86 1B         [ 4]  950 	call SUBB ; ( udl udl a -- )
      009E11 CD 83 F7         [ 4]  951 	call SWAPP 
      009E14 CD 9D EF         [ 4]  952 	call FADDR 
      009E17 CD 85 7D         [ 4]  953 	call ROT  ; ( udl ud a -- )
      009E1A CD 83 E7         [ 4]  954 	call DUPP 
      009E1D CD 83 B0         [ 4]  955 	call TOR    ; R: a 
      009E20                        956 FMOVE2: 
      009E20 CD 89 BD         [ 4]  957 	call HERE 
      009E23 CD 83 A4         [ 4]  958 	call RAT 
      009E26 CD 86 1B         [ 4]  959 	call SUBB ; (udl ud a wl -- )
      009E29                        960 next_row:
      009E29 CD 83 E7         [ 4]  961 	call DUPP 
      009E2C CD 83 B0         [ 4]  962 	call TOR  ; ( udl ud a wl -- ) R: a wl
      009E2F CD 9D 9B         [ 4]  963 	call RAM2EE ; ( udl a u -- udl u2 ) u2 is byte written to FLASH 
      009E32 CD 83 E7         [ 4]  964 	call DUPP 
      009E35 CD 83 B0         [ 4]  965 	call TOR
      009E38 CD 85 BD         [ 4]  966 	call PLUS  ; ( udl+ ) 
      009E3B CD 83 E7         [ 4]  967 	call DUPP 
      009E3E CD 88 D0         [ 4]  968 	call ZERO   ; ( udl+ ud -- )
      009E41 CD 83 91         [ 4]  969 	call RFROM  ; ( udl+ ud u2  R: a wl ) 
      009E44 CD 83 91         [ 4]  970 	call RFROM  ; ( udl+ ud u2 wl R: a ) 
      009E47 CD 84 11         [ 4]  971 	call OVER   ; ( udl+ ud u2 wl u2 -- )
      009E4A CD 86 1B         [ 4]  972 	call SUBB  ; ( udl+ ud u2 wl- R: a )
      009E4D CD 83 E7         [ 4]  973 	call DUPP 
      009E50 CD 82 EB         [ 4]  974 	call QBRAN
      009E53 9E 6C                  975 	.word fmove_done 
      009E55 CD 83 F7         [ 4]  976 	call SWAPP  ; ( udl+ ud wl- u2 R: a )
      009E58 CD 83 91         [ 4]  977 	call RFROM ; ( udl+ ud wl- u2 a -- ) 
      009E5B CD 85 BD         [ 4]  978 	call PLUS  ; ( udl+2 ud wl- a+ )
      009E5E CD 83 E7         [ 4]  979 	call DUPP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



      009E61 CD 83 B0         [ 4]  980 	call TOR   ; ( udl+2 ud wl- a+ ) R: a+
      009E64 CD 83 F7         [ 4]  981 	call SWAPP 
      009E67 CD 83 02         [ 4]  982 	call BRAN
      009E6A 9E 29                  983 	.word next_row  
      009E6C                        984 fmove_done:	
      009E6C CD 83 91         [ 4]  985 	call RFROM  ; ( -- udl+ ud u2 wl- a  )
      009E6F 1C 00 0A         [ 2]  986 	addw x,#5*CELLL ; (  -- udl+ ) new CP 
      009E72 81               [ 4]  987  	ret  
                                    988 
                                    989 ;------------------------------------------
                                    990 ; adjust pointers after **FMOVE** operetion.
                                    991 ; UPDAT-PTR ( cp+ -- )
                                    992 ; cp+ is new CP position after FMOVE 
                                    993 ;-------------------------------------------
      009E73 9D F4                  994 	.word LINK 
                           001DF5   995 	LINK=.
      009E75 09                     996 	.byte 9
      009E76 55 50 44 41 54 2D 50   997 	.ascii "UPDAT-PTR" 
             54 52
      009E7F                        998 UPDATPTR:
                                    999 ;reset VP to previous position  
      009E7F CD 98 D4         [ 4] 1000 	call EEPVP 
      009E82 CD 83 DD         [ 4] 1001 	call DROP 
      009E85 CD 83 40         [ 4] 1002 	call AT
      009E88 CD 85 23         [ 4] 1003 	call VPP 
      009E8B CD 83 29         [ 4] 1004 	call STORE
                                   1005 ;update CONTEXT and LAST 
      009E8E CD 98 BE         [ 4] 1006 	call EEPCP 
      009E91 CD 83 DD         [ 4] 1007 	call DROP
      009E94 CD 83 40         [ 4] 1008 	call AT
      009E97 CD 82 B8         [ 4] 1009 	call DOLIT 
      009E9A 00 02                 1010 	.word 2 
      009E9C CD 85 BD         [ 4] 1011 	call PLUS 
      009E9F CD 83 E7         [ 4] 1012 	call DUPP 
      009EA2 CD 85 15         [ 4] 1013 	call CNTXT 
      009EA5 CD 83 29         [ 4] 1014 	call STORE
      009EA8 CD 85 41         [ 4] 1015 	call LAST
      009EAB CD 83 29         [ 4] 1016 	call STORE 
      009EAE CD 98 EE         [ 4] 1017 	call UPDATLAST 
                                   1018 ;update CP 
      009EB1 CD 85 31         [ 4] 1019 	call CPP 
      009EB4 CD 83 29         [ 4] 1020 	call STORE
      009EB7 CD 99 17         [ 4] 1021 	call UPDATCP 
      009EBA 81               [ 4] 1022 	ret 
                                   1023 
                                   1024 ;-----------------------------
                                   1025 ; move interrupt sub-routine
                                   1026 ; in flash memory
                                   1027 ;----------------------------- 
      009EBB 9E 75                 1028 	.word LINK 
                           001E3D  1029 	LINK=. 
      009EBD 06                    1030 	.byte 6
      009EBE 49 46 4D 4F 56 45     1031 	.ascii "IFMOVE" 
      009EC4                       1032 IFMOVE:
      009EC4 CD 85 31         [ 4] 1033 	call CPP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



      009EC7 CD 83 40         [ 4] 1034 	call AT 
      009ECA CD 83 E7         [ 4] 1035 	call DUPP ; ( udl udl -- )
      009ECD CD 98 D4         [ 4] 1036 	call EEPVP 
      009ED0 CD 83 DD         [ 4] 1037 	call DROP
      009ED3 CD 83 40         [ 4] 1038 	call AT  ; ( udl udl a )
      009ED6 CD 83 B0         [ 4] 1039 	call TOR 
      009ED9 CD 9D EF         [ 4] 1040 	call FADDR
      009EDC CD 83 A4         [ 4] 1041 	call RAT ; ( udl ud a -- ) R: a 
      009EDF CC 9E 20         [ 2] 1042 	jp FMOVE2 
                                   1043 
                                   1044 
                                   1045 ; application code begin here
      009F00                       1046 	.bndry 128 ; align on flash block  
      009F00                       1047 app_space: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



                                   4415 .endif ; PICATOUT_MOD
                                   4416 
                                   4417 ;===============================================================
                                   4418 
                           001E3D  4419 LASTN =	LINK   ;last name defined
                                   4420 
                                   4421 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   6 AB1        0005BE R   |   6 ABOR1      0010D9 R
  6 ABOR2      0010F0 R   |   6 ABORQ      0010D1 R   |   6 ABORT      0010C2 R
  6 ABRTQ      0013AD R   |   6 ABSS       0005B5 R   |   6 ACCEP      001058 R
  6 ACCP1      001061 R   |   6 ACCP2      001087 R   |   6 ACCP3      00108A R
  6 ACCP4      00108C R   |     ADC_CR1 =  005401     |     ADC_CR1_=  000000 
    ADC_CR1_=  000001     |     ADC_CR1_=  000004     |     ADC_CR1_=  000005 
    ADC_CR1_=  000006     |     ADC_CR2 =  005402     |     ADC_CR2_=  000003 
    ADC_CR2_=  000004     |     ADC_CR2_=  000005     |     ADC_CR2_=  000006 
    ADC_CR2_=  000001     |     ADC_CR3 =  005403     |     ADC_CR3_=  000007 
    ADC_CR3_=  000006     |     ADC_CSR =  005400     |     ADC_CSR_=  000006 
    ADC_CSR_=  000004     |     ADC_CSR_=  000000     |     ADC_CSR_=  000001 
    ADC_CSR_=  000002     |     ADC_CSR_=  000003     |     ADC_CSR_=  000007 
    ADC_CSR_=  000005     |     ADC_DRH =  005404     |     ADC_DRL =  005405 
    ADC_TDRH=  005406     |     ADC_TDRL=  005407     |   6 ADRADJ     0004DC R
    AFR     =  004803     |     AFR0_ADC=  000000     |     AFR1_TIM=  000001 
    AFR2_CCO=  000002     |     AFR3_TIM=  000003     |     AFR4_TIM=  000004 
    AFR5_TIM=  000005     |     AFR6_I2C=  000006     |     AFR7_BEE=  000007 
  6 AFT        001398 R   |   6 AGAIN      0012EE R   |   6 AHEAD      00134B R
  6 ALLOT      001201 R   |   6 ANDD       0003B3 R   |     APP_CP  =  004004 
    APP_LAST=  004000     |     APP_RUN =  004002     |     APP_VP  =  004006 
  6 AT         0002C0 R   |   6 ATEXE      000973 R   |     AWU_APR =  0050F1 
    AWU_CSR =  0050F0     |     AWU_TBR =  0050F2     |     B0_MASK =  000001 
    B115200 =  000006     |     B19200  =  000003     |     B1_MASK =  000002 
    B230400 =  000007     |     B2400   =  000000     |     B2_MASK =  000004 
    B38400  =  000004     |     B3_MASK =  000008     |     B460800 =  000008 
    B4800   =  000001     |     B4_MASK =  000010     |     B57600  =  000005 
    B5_MASK =  000020     |     B6_MASK =  000040     |     B7_MASK =  000080 
    B921600 =  000009     |     B9600   =  000002     |   6 BACK1      001000 R
  6 BASE       000424 R   |     BASEE   =  00000A     |     BCNT    =  000001 
  6 BCOMP      001243 R   |   6 BDIGS      000A5B R   |     BEEP_BIT=  000004 
    BEEP_CSR=  0050F3     |     BEEP_MAS=  000010     |     BEEP_POR=  00000F 
  6 BEGIN      0012D0 R   |     BIT0    =  000000     |     BIT1    =  000001 
    BIT2    =  000002     |     BIT3    =  000003     |     BIT4    =  000004 
    BIT5    =  000005     |     BIT6    =  000006     |     BIT7    =  000007 
  6 BKSLA      000E98 R   |   6 BKSP       000FD0 R   |     BKSPP   =  000008 
  6 BLANK      000843 R   |     BLOCK_SI=  000080     |     BOOT_ROM=  006000 
    BOOT_ROM=  007FFF     |   6 BRAN       000282 R   |     BTW     =  000001 
  6 BUF2ROW    001CED R   |   6 BYE        0000AC R   |     CADR    =  000003 
    CALLL   =  0000CD     |   6 CANT_FOR   00013F R   |     CAN_DGR =  005426 
    CAN_FPSR=  005427     |     CAN_IER =  005425     |     CAN_MCR =  005420 
    CAN_MSR =  005421     |     CAN_P0  =  005428     |     CAN_P1  =  005429 
    CAN_P2  =  00542A     |     CAN_P3  =  00542B     |     CAN_P4  =  00542C 
    CAN_P5  =  00542D     |     CAN_P6  =  00542E     |     CAN_P7  =  00542F 
    CAN_P8  =  005430     |     CAN_P9  =  005431     |     CAN_PA  =  005432 
    CAN_PB  =  005433     |     CAN_PC  =  005434     |     CAN_PD  =  005435 
    CAN_PE  =  005436     |     CAN_PF  =  005437     |     CAN_RFR =  005424 
    CAN_TPR =  005423     |     CAN_TSR =  005422     |     CARRY   =  000024 
  6 CAT        0002DE R   |   6 CCOMMA     001225 R   |     CC_C    =  000000 
    CC_H    =  000004     |     CC_I0   =  000003     |     CC_I1   =  000005 
    CC_N    =  000002     |     CC_V    =  000007     |     CC_Z    =  000001 
    CELLL   =  000002     |   6 CELLM      000800 R   |   6 CELLP      0007F1 R
  6 CELLS      00080F R   |     CFG_GCR =  007F60     |     CFG_GCR_=  000001 
    CFG_GCR_=  000000     |   6 CHAR1      000C88 R   |   6 CHAR2      000C8B R
  6 CHKIVEC    001BDB R   |     CLKOPT  =  004807     |     CLKOPT_C=  000002 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
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
    CLK_SWR_=  0000D2     |   6 CMOV1      000992 R   |   6 CMOV2      0009AA R
  6 CMOVE      00098A R   |     CNTDWN  =  00002C     |   6 CNTXT      000495 R
  6 COLD       00176B R   |   6 COLD1      00176B R   |   6 COLON      001522 R
  6 COMMA      00120E R   |   6 COMPI      001253 R   |     COMPO   =  000040 
  6 CONSTANT   0015B8 R   |     CONVERT_=  000001     |   6 COUNT      000926 R
  6 CPP        0004B1 R   |     CPU_A   =  007F00     |     CPU_CCR =  007F0A 
    CPU_PCE =  007F01     |     CPU_PCH =  007F02     |     CPU_PCL =  007F03 
    CPU_SPH =  007F08     |     CPU_SPL =  007F09     |     CPU_XH  =  007F04 
    CPU_XL  =  007F05     |     CPU_YH  =  007F06     |     CPU_YL  =  007F07 
  6 CR         000CB6 R   |   6 CREAT      001568 R   |     CRR     =  00000D 
  6 CSTOR      0002CD R   |     CTOP    =  000080     |   6 DAT        000906 R
    DATSTK  =  001670     |   6 DDROP      00051D R   |   6 DDUP       000528 R
    DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF     |   6 DECIM      000B0B R
  6 DEPTH      000893 R   |     DEVID_BA=  0048CD     |     DEVID_EN=  0048D8 
    DEVID_LO=  0048D2     |     DEVID_LO=  0048D3     |     DEVID_LO=  0048D4 
    DEVID_LO=  0048D5     |     DEVID_LO=  0048D6     |     DEVID_LO=  0048D7 
    DEVID_LO=  0048D8     |     DEVID_WA=  0048D1     |     DEVID_XH=  0048CE 
    DEVID_XL=  0048CD     |     DEVID_YH=  0048D0     |     DEVID_YL=  0048CF 
  6 DGTQ1      000B50 R   |   6 DI         0000BA R   |   6 DIG        000A84 R
  6 DIGIT      000A1F R   |   6 DIGS       000A95 R   |   6 DIGS1      000A95 R
  6 DIGS2      000AA2 R   |   6 DIGTQ      000B1F R   |     DM_BK1RE=  007F90 
    DM_BK1RH=  007F91     |     DM_BK1RL=  007F92     |     DM_BK2RE=  007F93 
    DM_BK2RH=  007F94     |     DM_BK2RL=  007F95     |     DM_CR1  =  007F96 
    DM_CR2  =  007F97     |     DM_CSR1 =  007F98     |     DM_CSR2 =  007F99 
    DM_ENFCT=  007F9A     |   6 DN1        000595 R   |   6 DNEGA      00057A R
  6 DOCONST    0015DA R   |   6 DOLIT      000238 R   |   6 DONXT      00024C R
  6 DOSTR      000CCC R   |   6 DOT        000D51 R   |   6 DOT1       000D67 R
  6 DOTI1      0016FF R   |   6 DOTID      0016E9 R   |   6 DOTO1      001165 R
  6 DOTOK      00114B R   |   6 DOTPR      000E7A R   |   6 DOTQ       0013C7 R
  6 DOTQP      000CF5 R   |   6 DOTR       000D03 R   |   6 DOTS       001688 R
  6 DOTS1      001693 R   |   6 DOTS2      00169F R   |   6 DOVAR      000414 R
  6 DROP       00035D R   |   6 DSTOR      0008E0 R   |   6 DUMP       00163E R
  6 DUMP1      001655 R   |   6 DUMP3      001677 R   |   6 DUMPP      00160D R
  6 DUPP       000367 R   |   6 EDIGS      000AC0 R   |   6 EEPCP      00183E R
  6 EEPLAST    001811 R   |   6 EEPROM     0017F9 R   |     EEPROM_B=  004000 
    EEPROM_E=  0047FF     |     EEPROM_S=  000800     |   6 EEPRUN     001828 R
  6 EEPVP      001854 R   |   6 EI         0000B3 R   |   6 ELSEE      001326 R
  6 EMIT       000222 R   |   6 EQ1        0005D9 R   |   6 EQUAL      0005C3 R
  6 ERASE      0009EC R   |     ERR     =  00001B     |   6 EVAL       00118E R
  6 EVAL1      00118E R   |   6 EVAL2      0011AA R   |   6 EXE1       000981 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]

Symbol Table

  6 EXECU      000292 R   |   6 EXIT       0002A2 R   |     EXT     =  000001 
    EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1     |   6 EXTRC      000A47 R
  6 FADDR      001D6F R   |     FHSE    =  7A1200     |     FHSI    =  F42400 
  6 FILL       0009B9 R   |   6 FILL1      0009D6 R   |   6 FILL2      0009DF R
  6 FIND       000F2C R   |   6 FIND1      000F4A R   |   6 FIND2      000F78 R
  6 FIND3      000F84 R   |   6 FIND4      000F98 R   |   6 FIND5      000FA5 R
  6 FIND6      000F89 R   |     FLASH_BA=  008000     |     FLASH_CR=  00505A 
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
    FLASH_WS=  00480D     |     FLSI    =  01F400     |   6 FMOVE      001D7A R
  6 FMOVE2     001DA0 R   |   6 FOR        0012A3 R   |   6 FORGET     0000C5 R
  6 FORGET1    0000F7 R   |   6 FORGET2    00014D R   |   6 FORGET4    000156 R
    FPTR    =  00002E     |   6 FREEVAR    000163 R   |   6 FREEVAR4   000199 R
    GPIO_BAS=  005000     |     GPIO_CR1=  000003     |     GPIO_CR2=  000004 
    GPIO_DDR=  000002     |     GPIO_IDR=  000001     |     GPIO_ODR=  000000 
    GPIO_SIZ=  000005     |   6 HERE       00093D R   |   6 HEX        000AF6 R
  6 HI         00173E R   |   6 HLD        000482 R   |   6 HOLD       000A6B R
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
    I2C_WRIT=  000000     |   6 ICOLON     001533 R   |   6 IFETCH     0012C1 R
  6 IFF        0012FE R   |   6 IFMOVE     001E44 R   |     IMEDD   =  000080 
  6 IMMED      001545 R   |   6 INCH       000216 R   |   6 INITOFS    00150B R
  6 INN        000442 R   |     INPUT_DI=  000000     |     INPUT_EI=  000001 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]

Symbol Table

    INPUT_FL=  000000     |     INPUT_PU=  000001     |   6 INTE1      00112D R
  6 INTER      001103 R   |     INT_ADC2=  000016     |     INT_AUAR=  000012 
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
    INT_VECT=  00805C     |     INT_VECT=  008058     |   6 INVER      000557 R
    IPR0    =  000002     |     IPR1    =  000001     |     IPR2    =  000000 
    IPR3    =  000003     |     IPR_MASK=  000003     |     IRET_COD=  000080 
  6 ISEMI      0014A9 R   |     ITC_SPR1=  007F70     |     ITC_SPR2=  007F71 
    ITC_SPR3=  007F72     |     ITC_SPR4=  007F73     |     ITC_SPR5=  007F74 
    ITC_SPR6=  007F75     |     ITC_SPR7=  007F76     |     ITC_SPR8=  007F77 
    IWDG_KR =  0050E0     |     IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2 
  6 JSRC       0014F5 R   |   6 KEY        000C36 R   |   6 KTAP       00101D R
  6 KTAP1      001040 R   |   6 KTAP2      001043 R   |   6 LAST       0004C1 R
  6 LASTN   =  001E3D R   |   6 LBRAC      00113A R   |     LED2_BIT=  000005 
    LED2_MAS=  000020     |     LED2_POR=  00500A     |   6 LESS       000600 R
    LF      =  00000A     |   6 LINK    =  001E3D R   |   6 LITER      001275 R
  6 LT1        000616 R   |     MASKK   =  001F7F     |   6 MAX        000620 R
  6 MAX1       000633 R   |   6 MIN        00063D R   |   6 MIN1       000650 R
  6 MMOD1      0006F3 R   |   6 MMOD2      000707 R   |   6 MMOD3      00071E R
  6 MMSM1      00069A R   |   6 MMSM2      0006AE R   |   6 MMSM3      0006B0 R
  6 MMSM4      0006B8 R   |   6 MODD       000738 R   |   6 MONE       000869 R
    MS      =  00002A     |   6 MSEC       0001A3 R   |   6 MSMOD      0006D6 R
  6 MSTA1      0007C9 R   |   6 MSTAR      0007A6 R   |     NAFR    =  004804 
  6 NAMEQ      000FC5 R   |   6 NAMET      000ED6 R   |     NCLKOPT =  004808 
  6 NEGAT      000568 R   |   6 NEX1       000259 R   |   6 NEXT       0012B2 R
    NFLASH_W=  00480E     |     NHSECNT =  00480A     |     NOPT1   =  004802 
    NOPT2   =  004804     |     NOPT3   =  004806     |     NOPT4   =  004808 
    NOPT5   =  00480A     |     NOPT6   =  00480C     |     NOPT7   =  00480E 
    NOPTBL  =  00487F     |   6 NTIB       000452 R   |     NUBC    =  004802 
  6 NUFQ       000C4C R   |   6 NUFQ1      000C65 R   |   6 NUMBQ      000B63 R
  6 NUMQ1      000B97 R   |   6 NUMQ2      000BC8 R   |   6 NUMQ3      000C0A R
  6 NUMQ4      000C0F R   |   6 NUMQ5      000C1E R   |   6 NUMQ6      000C21 R
    NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC 
    NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE     |   6 NonHandl   000000 R
  6 OFFSET     0004D3 R   |     OFS     =  000005     |   6 ONE        00085B R
  6 ONEM       000829 R   |   6 ONEP       00081C R   |     OPT     =  000002 
    OPT0    =  004800     |     OPT1    =  004801     |     OPT2    =  004803 
    OPT3    =  004805     |     OPT4    =  004807     |     OPT5    =  004809 
    OPT6    =  00480B     |     OPT7    =  00480D     |     OPTBL   =  00487E 
    OPTION_B=  004800     |     OPTION_E=  00487F     |     OPTION_S=  000080 
  6 ORIG       00003F R   |   6 ORR        0003C7 R   |   6 OUTPUT     000227 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]

Symbol Table

    OUTPUT_F=  000001     |     OUTPUT_O=  000000     |     OUTPUT_P=  000001 
    OUTPUT_S=  000000     |   6 OVER       000391 R   |   6 OVERT      001482 R
    PA      =  000000     |   6 PACKS      0009FE R   |   6 PAD        00094E R
  6 PAREN      000E89 R   |   6 PARS       000D82 R   |   6 PARS1      000DAD R
  6 PARS2      000DD8 R   |   6 PARS3      000DDB R   |   6 PARS4      000DE4 R
  6 PARS5      000E07 R   |   6 PARS6      000E1C R   |   6 PARS7      000E2B R
  6 PARS8      000E3A R   |   6 PARSE      000E4B R   |   6 PAUSE      0001B3 R
    PA_BASE =  005000     |     PA_CR1  =  005003     |     PA_CR2  =  005004 
    PA_DDR  =  005002     |     PA_IDR  =  005001     |     PA_ODR  =  005000 
    PB      =  000005     |     PB_BASE =  005005     |     PB_CR1  =  005008 
    PB_CR2  =  005009     |     PB_DDR  =  005007     |     PB_IDR  =  005006 
    PB_ODR  =  005005     |     PC      =  00000A     |     PC_BASE =  00500A 
    PC_CR1  =  00500D     |     PC_CR2  =  00500E     |     PC_DDR  =  00500C 
    PC_IDR  =  00500B     |     PC_ODR  =  00500A     |     PD      =  00000F 
  6 PDUM1      001620 R   |   6 PDUM2      001631 R   |     PD_BASE =  00500F 
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
    PI      =  000028     |     PICATOUT=  000001     |   6 PICK       0008AA R
    PI_BASE =  005028     |     PI_CR1  =  00502B     |     PI_CR2  =  00502C 
    PI_DDR  =  00502A     |     PI_IDR  =  005029     |     PI_ODR  =  005028 
  6 PLUS       00053D R   |   6 PNAM1      001437 R   |   6 PRESE      0011B9 R
    PROD1   =  00001E     |     PROD2   =  000020     |     PROD3   =  000022 
  6 PSTOR      0008BF R   |     PTR16   =  00002F     |     PTR8    =  000030 
  6 QBRAN      00026B R   |   6 QDUP       0004EC R   |   6 QDUP1      0004F6 R
  6 QKEY       000204 R   |   6 QSTAC      001171 R   |   6 QUERY      00109D R
  6 QUEST      000D74 R   |   6 QUIT       0011D6 R   |   6 QUIT1      0011DE R
  6 QUIT2      0011E1 R   |   6 RAM2EE     001D1B R   |     RAMBASE =  000000 
    RAM_BASE=  000000     |     RAM_END =  0017FF     |     RAM_SIZE=  001800 
  6 RAT        000324 R   |   6 RBRAC      0014E2 R   |   6 REPEA      00137B R
  6 RFREE      001D02 R   |   6 RFROM      000311 R   |     ROP     =  004800 
  6 ROT        0004FD R   |   6 ROW2BUF    001CC4 R   |     ROWBUFF =  001680 
    RP0     =  000028     |   6 RPAT       0002EE R   |     RPP     =  0017FF 
  6 RPSTO      0002FB R   |     RST_SR  =  0050B3     |   6 SAME1      000EF4 R
  6 SAME2      000F1D R   |   6 SAMEQ      000EEC R   |   6 SCOM1      00146C R
  6 SCOM2      00146F R   |   6 SCOMP      00144E R   |   6 SEMIS      001492 R
    SFR_BASE=  005000     |     SFR_END =  0057FF     |   6 SIGN       000AAA R
  6 SIGN1      000ABA R   |   6 SLASH      000742 R   |   6 SLMOD      000726 R
  6 SNAME      001401 R   |     SP0     =  000026     |   6 SPACE      000C6E R
  6 SPACS      000C7D R   |   6 SPAT       000347 R   |     SPI_CR1 =  005200 
    SPI_CR2 =  005201     |     SPI_CRCP=  005205     |     SPI_DR  =  005204 
    SPI_ICR =  005202     |     SPI_RXCR=  005206     |     SPI_SR  =  005203 
    SPI_TXCR=  005207     |     SPP     =  001670     |   6 SPSTO      000354 R
  6 SSMOD      0007D2 R   |     SSP     =  000001     |     STACK   =  0017FF 
  6 STAR       00079B R   |   6 STASL      0007E3 R   |   6 STORE      0002A9 R
  6 STR        000AD8 R   |   6 STRCQ      001283 R   |   6 STRQ       0013BA R
  6 STRQP      000CEB R   |   6 SUBB       00059B R   |   6 SWAPP      000377 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]

Symbol Table

    SWIM_CSR=  007F80     |   6 TAP        001007 R   |   6 TBOOT      00175F R
  6 TBUF       000462 R   |     TBUFFBAS=  001680     |   6 TCHA1      00088A R
  6 TCHAR      00087A R   |   6 TEMP       000433 R   |   6 TEVAL      000473 R
  6 THENN      001313 R   |   6 TIB        00095F R   |     TIBB    =  001700 
    TIBBASE =  001700     |     TIC     =  000027     |   6 TICK       0011ED R
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
    TIM2_CCM=  005306     |     TIM2_CCM=  005307     |     TIM2_CCR=  00530F 
    TIM2_CCR=  005310     |     TIM2_CCR=  005311     |     TIM2_CCR=  005312 
    TIM2_CCR=  005313     |     TIM2_CCR=  005314     |     TIM2_CNT=  00530A 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]

Symbol Table

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
    TIM4_SR_=  000000     |   6 TIMEOUTQ   0001E3 R   |   6 TIMER      0001CD R
    TIM_CR1_=  000007     |     TIM_CR1_=  000000     |     TIM_CR1_=  000006 
    TIM_CR1_=  000005     |     TIM_CR1_=  000004     |     TIM_CR1_=  000003 
    TIM_CR1_=  000001     |     TIM_CR1_=  000002     |   6 TNAM2      0016B9 R
  6 TNAM3      0016D7 R   |   6 TNAM4      0016DD R   |   6 TNAME      0016B6 R
  6 TOKEN      000EC8 R   |   6 TOR        000330 R   |     TRUEE   =  00FFFF 
  6 TWOSL      000836 R   |   6 TYPE1      000C9D R   |   6 TYPE2      000CA9 R
  6 TYPES      000C98 R   |   6 Timer4Ha   000005 R   |     UART1   =  000000 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]

Symbol Table

    UART_DR =  000001     |     UART_GTR=  000009     |     UART_PSC=  00000A 
    UART_SR =  000000     |     UART_SR_=  000001     |     UART_SR_=  000004 
    UART_SR_=  000002     |     UART_SR_=  000003     |     UART_SR_=  000000 
    UART_SR_=  000005     |     UART_SR_=  000006     |     UART_SR_=  000007 
    UBASE   =  000006     |     UBC     =  004801     |     UCNTXT  =  000014 
    UCP     =  000018     |     UCTIB   =  00000C     |     UD1     =  000001 
    UD2     =  000002     |     UD3     =  000003     |     UD4     =  000004 
  6 UDOT       000D3E R   |   6 UDOTR      000D1E R   |   6 UEND       00003D R
    UHLD    =  000012     |     UINN    =  00000A     |     UINTER  =  000010 
    ULAST   =  00001A     |   6 ULES1      0005F8 R   |   6 ULESS      0005E2 R
  6 UMMOD      000678 R   |   6 UMSTA      000751 R   |   6 UNIQ1      0013F8 R
  6 UNIQU      0013D9 R   |   6 UNTIL      0012DB R   |     UOFFSET =  00001C 
  6 UPDATCP    001897 R   |   6 UPDATLAS   00186E R   |   6 UPDATPTR   001DFF R
  6 UPDATRUN   001886 R   |   6 UPDATVP    0018AE R   |   6 UPL1       000408 R
  6 UPLUS      0003F1 R   |     UPP     =  000006     |     USR_BTN_=  000004 
    USR_BTN_=  000010     |     USR_BTN_=  005015     |     UTIB    =  00000E 
    UTMP    =  000008     |   6 UTYP1      0015F0 R   |   6 UTYP2      0015FF R
  6 UTYPE      0015EB R   |     UVP     =  000016     |   6 UZERO      000027 R
  6 VARIA      001582 R   |     VER     =  000002     |   6 VPP        0004A3 R
    VSIZE   =  000006     |     WANT_DEB=  000000     |     WANT_SEE=  000000 
    WDGOPT  =  004805     |     WDGOPT_I=  000002     |     WDGOPT_L=  000003 
    WDGOPT_W=  000000     |     WDGOPT_W=  000001     |   6 WHILE      001361 R
  6 WITHI      00065D R   |   6 WORDD      000EB4 R   |   6 WORDS      001713 R
  6 WORS1      001719 R   |   6 WORS2      001738 R   |     WWDG_CR =  0050D1 
    WWDG_WR =  0050D2     |   6 XORR       0003DC R   |     XTEMP   =  00001E 
    YTEMP   =  000020     |   6 ZERO       000850 R   |   6 ZL1        0003A9 R
  6 ZLESS      0003A0 R   |   6 app_spac   001E80 R   |   6 block_er   001A31 R
  6 clear_ra   000019 R   |   6 clock_in   00005A R   |   6 copy_buf   001A88 R
  6 copy_buf   001AA7 R   |   6 copy_pro   001AA7 R   |     da      =  000002 
    db      =  000003     |     dc      =  000000     |     dd      =  000001 
  6 ee_ccomm   001CA2 R   |   6 ee_comma   001C81 R   |   6 ee_cstor   00199E R
  6 ee_store   0019EA R   |   6 erase_fl   001A4D R   |   6 farat      0018BF R
  6 farcat     0018DB R   |   6 fmove_do   001DEC R   |   6 fptr_sto   0017DA R
  6 inc_fptr   00196C R   |   6 lock       001958 R   |   6 main       000016 R
  6 next_row   001DA9 R   |   6 pristine   001B22 R   |   6 proceed_   001A50 R
  6 reboot     0001FA R   |   6 reset_ve   001B89 R   |   6 row_eras   001A14 R
  6 row_eras   001A61 R   |   6 row_eras   001A88 R   |   6 set_opti   001AF6 R
  6 set_vect   001C2A R   |   6 uart1_in   00006C R   |   6 unlock     001930 R
  6 unlock_e   0018F2 R   |   6 unlock_f   001911 R   |   6 write_by   001983 R
  6 write_ro   001ACC R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 DATA       size      0   flags    8
   2 DATA0      size      0   flags    8
   3 SSEG       size      0   flags    8
   4 SSEG1      size    100   flags    8
   5 HOME       size     80   flags    0
   6 CODE       size   1E80   flags    0

