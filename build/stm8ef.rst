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
                                    174 
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
      0080B1 90 83                  277         .word      INTER   ;'EVAL
      0080B3 00 00                  278         .word      0       ;HLD
      0080B5 9C 4F                  279         .word      LASTN  ;CNTXT pointer
      0080B7 00 80                  280         .word      CTOP   ;CP in RAM
      0080B9 9D 80                  281         .word      app_space ; CP in FLASH 
      0080BB 9C 4F                  282         .word      LASTN   ;LAST
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
      008118 9A               [ 1]  325         rim
      008119 CC 96 93         [ 2]  326         jp  COLD   ;default=MN1
                                    327 
                                    328 
                                    329 ;; get millisecond counter 
                                    330 ;; msec ( -- u )
                                    331 ;; Added by Picatout 2020-04-26
      00811C 00 00                  332         .word 0 
                           00009E   333 LINK = . 
      00811E 04                     334         .byte 4
      00811F 4D 53 45 43            335         .ascii "MSEC"
      008123                        336 MSEC: 
      008123 1D 00 02         [ 2]  337         subw x,#CELLL 
      008126 90 BE 2A         [ 2]  338         ldw y,MS 
      008129 FF               [ 2]  339         ldw (x),y 
      00812A 81               [ 4]  340         ret 
                                    341 
                                    342 ; suspend execution for u msec 
                                    343 ;  pause ( u -- )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 8.
Hexadecimal [24-Bits]



      00812B 81 1E                  344         .word LINK 
                           0000AD   345         LINK=.
      00812D 05                     346         .byte 5 
      00812E 50 41 55 53 45         347         .ascii "PAUSE"
      008133                        348 PAUSE:
      008133 90 93            [ 1]  349         ldw y,x
      008135 90 FE            [ 2]  350         ldw y,(y)
      008137 72 B9 00 2A      [ 2]  351         addw y,MS 
      00813B 8F               [10]  352 1$:     wfi  
      00813C 90 B3 2A         [ 2]  353         cpw y,MS  
      00813F 26 FA            [ 1]  354         jrne 1$        
      008141 1C 00 02         [ 2]  355         addw x,#CELLL 
      008144 81               [ 4]  356         ret 
                                    357 
                                    358 ; initialize count down timer 
                                    359 ;  TIMER ( u -- )  milliseconds 
      008145 81 2D                  360         .word LINK 
                           0000C7   361         LINK=.
      008147 05                     362         .byte 5 
      008148 54 49 4D 45 52         363         .ascii "TIMER" 
      00814D                        364 TIMER:
      00814D 90 93            [ 1]  365         ldw y,x
      00814F 90 FE            [ 2]  366         ldw y,(y) 
      008151 90 BF 2C         [ 2]  367         ldw CNTDWN,y
      008154 1C 00 02         [ 2]  368         addw x,#CELLL 
      008157 81               [ 4]  369         ret 
                                    370 
                                    371 ; check for TIMER exiparition 
                                    372 ;  TIMEOUT? ( -- 0|-1 )
      008158 81 47                  373         .word LINK 
                           0000DA   374         LINK=. 
      00815A 08                     375         .byte 8 
      00815B 54 49 4D 45 4F 55 54   376         .ascii "TIMEOUT?"
             3F
      008163                        377 TIMEOUTQ: 
      008163 4F               [ 1]  378         clr a
      008164 1D 00 02         [ 2]  379         subw x,#CELLL 
      008167 90 BE 2C         [ 2]  380         ldw y,CNTDWN 
      00816A 26 01            [ 1]  381         jrne 1$ 
      00816C 43               [ 1]  382         cpl a 
      00816D E7 01            [ 1]  383 1$:     ld (1,x),a 
      00816F F7               [ 1]  384         ld (x),a 
      008170 81               [ 4]  385         ret         
                                    386 
                                    387 ; reboot MCU 
                                    388 ; REBOOT ( -- )
      008171 81 5A                  389         .word LINK 
                           0000F3   390         LINK=. 
      008173 06                     391         .byte 6 
      008174 52 45 42 4F 4F 54      392         .ascii "REBOOT"
      00817A                        393 reboot:
      00817A CC 80 80         [ 2]  394         jp NonHandledInterrupt
                                    395         
                                    396 
                                    397 ;; Device dependent I/O
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 9.
Hexadecimal [24-Bits]



                                    398 ;       ?RX     ( -- c T | F )
                                    399 ;         Return input byte and true, or false.
      00817D 81 73                  400         .word      LINK 
                           0000FF   401 LINK	= .
      00817F 04                     402         .byte      4
      008180 3F 4B 45 59            403         .ascii     "?KEY"
      008184                        404 QKEY:
      008184 90 5F            [ 1]  405         CLRW Y 
      008186 72 0B 52 30 0B   [ 2]  406         BTJF UART1_SR,#UART_SR_RXNE,INCH   ;check status
      00818B C6 52 31         [ 1]  407         LD    A,UART1_DR   ;get char in A
      00818E 1D 00 02         [ 2]  408 	SUBW	X,#2
      008191 E7 01            [ 1]  409         LD     (1,X),A
      008193 7F               [ 1]  410 	CLR	(X)
      008194 90 53            [ 2]  411         CPLW     Y
      008196                        412 INCH:
      008196 1D 00 02         [ 2]  413 	SUBW	X,#2
      008199 FF               [ 2]  414         LDW     (X),Y
      00819A 81               [ 4]  415         RET
                                    416 
                                    417 ;       TX!     ( c -- )
                                    418 ;       Send character c to  output device.
      00819B 81 7F                  419         .word      LINK
                           00011D   420 LINK	= .
      00819D 04                     421         .byte      4
      00819E 45 4D 49 54            422         .ascii     "EMIT"
      0081A2                        423 EMIT:
      0081A2 E6 01            [ 1]  424         LD     A,(1,X)
      0081A4 1C 00 02         [ 2]  425 	ADDW	X,#2
      0081A7 72 0F 52 30 FB   [ 2]  426 OUTPUT: BTJF UART1_SR,#UART_SR_TXE,OUTPUT  ;loop until tdre
      0081AC C7 52 31         [ 1]  427         LD    UART1_DR,A   ;send A
      0081AF 81               [ 4]  428         RET
                                    429 
                                    430 ;; The kernel
                                    431 
                                    432 ;       doLIT   ( -- w )
                                    433 ;       Push an inline literal.
      0081B0 81 9D                  434         .word      LINK
                           000132   435 LINK	= 	.
      0081B2 45                     436 	.byte      COMPO+5
      0081B3 44 4F 4C 49 54         437         .ascii     "DOLIT"
      0081B8                        438 DOLIT:
      0081B8 1D 00 02         [ 2]  439 	SUBW X,#2
                           000001   440 .if PICATOUT_MOD 
      0081BB 16 01            [ 2]  441         ldw y,(1,sp)
      0081BD 90 FE            [ 2]  442         ldw y,(y)
      0081BF FF               [ 2]  443         ldw (x),y
      0081C0 90 85            [ 2]  444         popw y 
      0081C2 90 EC 02         [ 2]  445         jp (2,y)
                           000000   446 .else 
                                    447         POPW Y
                                    448 	LDW YTEMP,Y
                                    449 	LDW Y,(Y)
                                    450         LDW (X),Y
                                    451         LDW Y,YTEMP
                                    452 	JP (2,Y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



                                    453 .endif 
                                    454 
                                    455 ;       next    ( -- )
                                    456 ;       Code for  single index loop.
      0081C5 81 B2                  457         .word      LINK
                           000147   458 LINK	= 	.
      0081C7 44                     459 	.byte      COMPO+4
      0081C8 4E 45 58 54            460         .ascii     "NEXT"
      0081CC                        461 DONXT:
      0081CC 16 03            [ 2]  462 	LDW Y,(3,SP)
      0081CE 90 5A            [ 2]  463 	DECW Y
      0081D0 2A 07            [ 1]  464 	JRPL NEX1 ; jump if N=0
      0081D2 90 85            [ 2]  465 	POPW Y
                           000001   466 .if PICATOUT_MOD
      0081D4 5B 02            [ 2]  467         addw sp,#2
                           000000   468 .else        
                                    469 	POP A
                                    470 	POP A
                                    471 .endif         
      0081D6 90 EC 02         [ 2]  472         JP (2,Y)
      0081D9                        473 NEX1:
      0081D9 17 03            [ 2]  474         LDW (3,SP),Y
      0081DB 90 85            [ 2]  475         POPW Y
      0081DD 90 FE            [ 2]  476 	LDW Y,(Y)
      0081DF 90 FC            [ 2]  477 	JP (Y)
                                    478 
                                    479 ;       ?branch ( f -- )
                                    480 ;       Branch if flag is zero.
      0081E1 81 C7                  481         .word      LINK
                           000163   482 LINK	= 	.
      0081E3 47                     483 	.byte      COMPO+7
      0081E4 3F 42 52 41 4E 43 48   484         .ascii     "?BRANCH"
      0081EB                        485 QBRAN:	
      0081EB 90 93            [ 1]  486         LDW Y,X
      0081ED 1C 00 02         [ 2]  487 	ADDW X,#2
      0081F0 90 FE            [ 2]  488 	LDW Y,(Y)
      0081F2 27 0E            [ 1]  489         JREQ     BRAN
      0081F4 90 85            [ 2]  490 	POPW Y
      0081F6 90 EC 02         [ 2]  491 	JP (2,Y)
                                    492         
                                    493 ;       branch  ( -- )
                                    494 ;       Branch to an inline address.
      0081F9 81 E3                  495         .word      LINK
                           00017B   496 LINK	= 	.
      0081FB 46                     497 	.byte      COMPO+6
      0081FC 42 52 41 4E 43 48      498         .ascii     "BRANCH"
      008202                        499 BRAN:
      008202 90 85            [ 2]  500         POPW Y
      008204 90 FE            [ 2]  501 	LDW Y,(Y)
      008206 90 FC            [ 2]  502         JP     (Y)
                                    503 
                                    504 ;       EXECUTE ( ca -- )
                                    505 ;       Execute  word at ca.
      008208 81 FB                  506         .word      LINK
                           00018A   507 LINK	= 	.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



      00820A 07                     508         .byte       7
      00820B 45 58 45 43 55 54 45   509         .ascii     "EXECUTE"
      008212                        510 EXECU:
      008212 90 93            [ 1]  511         LDW Y,X
      008214 1C 00 02         [ 2]  512 	ADDW X,#2
      008217 90 FE            [ 2]  513 	LDW  Y,(Y)
      008219 90 FC            [ 2]  514         JP   (Y)
                                    515 
                                    516 ;       EXIT    ( -- )
                                    517 ;       Terminate a colon definition.
      00821B 82 0A                  518         .word      LINK
                           00019D   519 LINK = .
      00821D 04                     520         .byte      4
      00821E 45 58 49 54            521         .ascii     "EXIT"
      008222                        522 EXIT:
      008222 90 85            [ 2]  523         POPW Y
      008224 81               [ 4]  524         RET
                                    525 
                                    526 ;       !       ( w a -- )
                                    527 ;       Pop  data stack to memory.
      008225 82 1D                  528         .word      LINK
                           0001A7   529 LINK = .
      008227 01                     530         .byte      1
      008228 21                     531         .ascii     "!"
      008229                        532 STORE:
      008229 90 93            [ 1]  533         LDW Y,X
      00822B 90 FE            [ 2]  534         LDW Y,(Y)    ;Y=a
      00822D 90 BF 20         [ 2]  535         LDW YTEMP,Y
      008230 90 93            [ 1]  536         LDW Y,X
      008232 90 EE 02         [ 2]  537         LDW Y,(2,Y)
      008235 91 CF 20         [ 5]  538         LDW [YTEMP],Y ;store w at a
      008238 1C 00 04         [ 2]  539         ADDW X,#4 ; DDROP 
      00823B 81               [ 4]  540         RET     
                                    541 
                                    542 ;       @       ( a -- w )
                                    543 ;       Push memory location to stack.
      00823C 82 27                  544         .word      LINK
                           0001BE   545 LINK	= 	.
      00823E 01                     546         .byte    1
      00823F 40                     547         .ascii	"@"
      008240                        548 AT:
      008240 90 93            [ 1]  549         LDW Y,X     ;Y = a
      008242 90 FE            [ 2]  550         LDW Y,(Y)   ; address 
      008244 90 FE            [ 2]  551         LDW Y,(Y)   ; value 
      008246 FF               [ 2]  552         LDW (X),Y ;w = @Y
      008247 81               [ 4]  553         RET     
                                    554 
                                    555 ;       C!      ( c b -- )
                                    556 ;       Pop  data stack to byte memory.
      008248 82 3E                  557         .word      LINK
                           0001CA   558 LINK	= .
      00824A 02                     559         .byte      2
      00824B 43 21                  560         .ascii     "C!"
      00824D                        561 CSTOR:
      00824D 90 93            [ 1]  562         LDW Y,X
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]



      00824F 90 FE            [ 2]  563 	LDW Y,(Y)    ;Y=b
      008251 E6 03            [ 1]  564         LD A,(3,X)    ;D = c
      008253 90 F7            [ 1]  565         LD  (Y),A     ;store c at b
      008255 1C 00 04         [ 2]  566 	ADDW X,#4 ; DDROP 
      008258 81               [ 4]  567         RET     
                                    568 
                                    569 ;       C@      ( b -- c )
                                    570 ;       Push byte in memory to  stack.
      008259 82 4A                  571         .word      LINK
                           0001DB   572 LINK	= 	.
      00825B 02                     573         .byte      2
      00825C 43 40                  574         .ascii     "C@"
      00825E                        575 CAT:
      00825E 90 93            [ 1]  576         LDW Y,X     ;Y=b
      008260 90 FE            [ 2]  577         LDW Y,(Y)
      008262 90 F6            [ 1]  578         LD A,(Y)
      008264 E7 01            [ 1]  579         LD (1,X),A
      008266 7F               [ 1]  580         CLR (X)
      008267 81               [ 4]  581         RET     
                                    582 
                                    583 ;       RP@     ( -- a )
                                    584 ;       Push current RP to data stack.
      008268 82 5B                  585         .word      LINK
                           0001EA   586 LINK	= .
      00826A 03                     587         .byte      3
      00826B 52 50 40               588         .ascii     "RP@"
      00826E                        589 RPAT:
      00826E 90 96            [ 1]  590         LDW Y,SP    ;save return addr
      008270 1D 00 02         [ 2]  591         SUBW X,#2
      008273 FF               [ 2]  592         LDW (X),Y
      008274 81               [ 4]  593         RET     
                                    594 
                                    595 ;       RP!     ( a -- )
                                    596 ;       Set  return stack pointer.
      008275 82 6A                  597         .word      LINK
                           0001F7   598 LINK	= 	. 
      008277 43                     599 	.byte      COMPO+3
      008278 52 50 21               600         .ascii     "RP!"
      00827B                        601 RPSTO:
      00827B 90 85            [ 2]  602         POPW Y
      00827D 90 BF 20         [ 2]  603         LDW YTEMP,Y
      008280 90 93            [ 1]  604         LDW Y,X
      008282 90 FE            [ 2]  605         LDW Y,(Y)
      008284 90 94            [ 1]  606         LDW SP,Y
      008286 1C 00 02         [ 2]  607         ADDW x,#CELLL ; a was not dropped, Picatout 2020-05-24
      008289 92 CC 20         [ 5]  608         JP [YTEMP]
                                    609 
                                    610 ;       R>      ( -- w )
                                    611 ;       Pop return stack to data stack.
      00828C 82 77                  612         .word      LINK
                           00020E   613 LINK	= 	. 
      00828E 42                     614 	.byte      COMPO+2
      00828F 52 3E                  615         .ascii     "R>"
      008291                        616 RFROM:
      008291 90 85            [ 2]  617         POPW Y    ;save return addr
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 13.
Hexadecimal [24-Bits]



      008293 90 BF 20         [ 2]  618         LDW YTEMP,Y
      008296 90 85            [ 2]  619         POPW Y
      008298 1D 00 02         [ 2]  620         SUBW X,#2
      00829B FF               [ 2]  621         LDW (X),Y
      00829C 92 CC 20         [ 5]  622         JP [YTEMP]
                                    623 
                                    624 ;       R@      ( -- w )
                                    625 ;       Copy top of return stack to stack.
      00829F 82 8E                  626         .word      LINK
                           000221   627 LINK	= 	. 
      0082A1 02                     628         .byte      2
      0082A2 52 40                  629         .ascii     "R@"
      0082A4                        630 RAT:
                           000001   631 .if PICATOUT_MOD
      0082A4 16 03            [ 2]  632         ldw y,(3,sp)
      0082A6 1D 00 02         [ 2]  633         subw x,#CELLL 
      0082A9 FF               [ 2]  634         ldw (x),y 
      0082AA 81               [ 4]  635         ret 
                           000000   636 .else 
                                    637         POPW Y
                                    638         LDW YTEMP,Y
                                    639         POPW Y
                                    640         PUSHW Y
                                    641         SUBW X,#2
                                    642         LDW (X),Y
                                    643         JP [YTEMP]
                                    644 .endif         
                                    645 
                                    646 ;       >R      ( w -- )
                                    647 ;       Push data stack to return stack.
      0082AB 82 A1                  648         .word      LINK
                           00022D   649 LINK	= 	. 
      0082AD 42                     650 	.byte      COMPO+2
      0082AE 3E 52                  651         .ascii     ">R"
      0082B0                        652 TOR:
      0082B0 90 85            [ 2]  653         POPW Y    ;save return addr
      0082B2 90 BF 20         [ 2]  654         LDW YTEMP,Y
      0082B5 90 93            [ 1]  655         LDW Y,X
      0082B7 90 FE            [ 2]  656         LDW Y,(Y)
      0082B9 90 89            [ 2]  657         PUSHW Y    ;restore return addr
      0082BB 1C 00 02         [ 2]  658         ADDW X,#2
      0082BE 92 CC 20         [ 5]  659         JP [YTEMP]
                                    660 
                                    661 ;       SP@     ( -- a )
                                    662 ;       Push current stack pointer.
      0082C1 82 AD                  663         .word      LINK
                           000243   664 LINK	= 	. 
      0082C3 03                     665         .byte      3
      0082C4 53 50 40               666         .ascii     "SP@"
      0082C7                        667 SPAT:
      0082C7 90 93            [ 1]  668 	LDW Y,X
      0082C9 1D 00 02         [ 2]  669         SUBW X,#2
      0082CC FF               [ 2]  670 	LDW (X),Y
      0082CD 81               [ 4]  671         RET     
                                    672 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 14.
Hexadecimal [24-Bits]



                                    673 ;       SP!     ( a -- )
                                    674 ;       Set  data stack pointer.
      0082CE 82 C3                  675         .word      LINK
                           000250   676 LINK	= 	. 
      0082D0 03                     677         .byte      3
      0082D1 53 50 21               678         .ascii     "SP!"
      0082D4                        679 SPSTO:
      0082D4 FE               [ 2]  680         LDW     X,(X)     ;X = a
      0082D5 81               [ 4]  681         RET     
                                    682 
                                    683 ;       DROP    ( w -- )
                                    684 ;       Discard top stack item.
      0082D6 82 D0                  685         .word      LINK
                           000258   686 LINK	= 	. 
      0082D8 04                     687         .byte      4
      0082D9 44 52 4F 50            688         .ascii     "DROP"
      0082DD                        689 DROP:
      0082DD 1C 00 02         [ 2]  690         ADDW X,#2     
      0082E0 81               [ 4]  691         RET     
                                    692 
                                    693 ;       DUP     ( w -- w w )
                                    694 ;       Duplicate  top stack item.
      0082E1 82 D8                  695         .word      LINK
                           000263   696 LINK	= 	. 
      0082E3 03                     697         .byte      3
      0082E4 44 55 50               698         .ascii     "DUP"
      0082E7                        699 DUPP:
      0082E7 90 93            [ 1]  700 	LDW Y,X
      0082E9 1D 00 02         [ 2]  701         SUBW X,#2
      0082EC 90 FE            [ 2]  702 	LDW Y,(Y)
      0082EE FF               [ 2]  703 	LDW (X),Y
      0082EF 81               [ 4]  704         RET     
                                    705 
                                    706 ;       SWAP    ( w1 w2 -- w2 w1 )
                                    707 ;       Exchange top two stack items.
      0082F0 82 E3                  708         .word      LINK
                           000272   709 LINK	= 	. 
      0082F2 04                     710         .byte      4
      0082F3 53 57 41 50            711         .ascii     "SWAP"
      0082F7                        712 SWAPP:
      0082F7 90 93            [ 1]  713         LDW Y,X
      0082F9 90 FE            [ 2]  714         LDW Y,(Y)
      0082FB 90 BF 20         [ 2]  715         LDW YTEMP,Y
      0082FE 90 93            [ 1]  716         LDW Y,X
      008300 90 EE 02         [ 2]  717         LDW Y,(2,Y)
      008303 FF               [ 2]  718         LDW (X),Y
      008304 90 BE 20         [ 2]  719         LDW Y,YTEMP
      008307 EF 02            [ 2]  720         LDW (2,X),Y
      008309 81               [ 4]  721         RET     
                                    722 
                                    723 ;       OVER    ( w1 w2 -- w1 w2 w1 )
                                    724 ;       Copy second stack item to top.
      00830A 82 F2                  725         .word      LINK
                           00028C   726 LINK	= . 
      00830C 04                     727         .byte      4
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 15.
Hexadecimal [24-Bits]



      00830D 4F 56 45 52            728         .ascii     "OVER"
      008311                        729 OVER:
      008311 1D 00 02         [ 2]  730         SUBW X,#2
      008314 90 93            [ 1]  731         LDW Y,X
      008316 90 EE 04         [ 2]  732         LDW Y,(4,Y)
      008319 FF               [ 2]  733         LDW (X),Y
      00831A 81               [ 4]  734         RET     
                                    735 
                                    736 ;       0<      ( n -- t )
                                    737 ;       Return true if n is negative.
      00831B 83 0C                  738         .word      LINK
                           00029D   739 LINK	= . 
      00831D 02                     740         .byte      2
      00831E 30 3C                  741         .ascii     "0<"
      008320                        742 ZLESS:
      008320 A6 FF            [ 1]  743         LD A,#0xFF
      008322 90 93            [ 1]  744         LDW Y,X
      008324 90 FE            [ 2]  745         LDW Y,(Y)
      008326 2B 01            [ 1]  746         JRMI     ZL1
      008328 4F               [ 1]  747         CLR A   ;false
      008329 F7               [ 1]  748 ZL1:    LD     (X),A
      00832A E7 01            [ 1]  749         LD (1,X),A
      00832C 81               [ 4]  750 	RET     
                                    751 
                                    752 ;       AND     ( w w -- w )
                                    753 ;       Bitwise AND.
      00832D 83 1D                  754         .word      LINK
                           0002AF   755 LINK	= . 
      00832F 03                     756         .byte      3
      008330 41 4E 44               757         .ascii     "AND"
      008333                        758 ANDD:
      008333 F6               [ 1]  759         LD  A,(X)    ;D=w
      008334 E4 02            [ 1]  760         AND A,(2,X)
      008336 E7 02            [ 1]  761         LD (2,X),A
      008338 E6 01            [ 1]  762         LD A,(1,X)
      00833A E4 03            [ 1]  763         AND A,(3,X)
      00833C E7 03            [ 1]  764         LD (3,X),A
      00833E 1C 00 02         [ 2]  765         ADDW X,#2
      008341 81               [ 4]  766         RET
                                    767 
                                    768 ;       OR      ( w w -- w )
                                    769 ;       Bitwise inclusive OR.
      008342 83 2F                  770         .word      LINK
                           0002C4   771 LINK = . 
      008344 02                     772         .byte      2
      008345 4F 52                  773         .ascii     "OR"
      008347                        774 ORR:
      008347 F6               [ 1]  775         LD A,(X)    ;D=w
      008348 EA 02            [ 1]  776         OR A,(2,X)
      00834A E7 02            [ 1]  777         LD (2,X),A
      00834C E6 01            [ 1]  778         LD A,(1,X)
      00834E EA 03            [ 1]  779         OR A,(3,X)
      008350 E7 03            [ 1]  780         LD (3,X),A
      008352 1C 00 02         [ 2]  781         ADDW X,#2
      008355 81               [ 4]  782         RET
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 16.
Hexadecimal [24-Bits]



                                    783 
                                    784 ;       XOR     ( w w -- w )
                                    785 ;       Bitwise exclusive OR.
      008356 83 44                  786         .word      LINK
                           0002D8   787 LINK	= . 
      008358 03                     788         .byte      3
      008359 58 4F 52               789         .ascii     "XOR"
      00835C                        790 XORR:
      00835C F6               [ 1]  791         LD A,(X)    ;D=w
      00835D E8 02            [ 1]  792         XOR A,(2,X)
      00835F E7 02            [ 1]  793         LD (2,X),A
      008361 E6 01            [ 1]  794         LD A,(1,X)
      008363 E8 03            [ 1]  795         XOR A,(3,X)
      008365 E7 03            [ 1]  796         LD (3,X),A
      008367 1C 00 02         [ 2]  797         ADDW X,#2
      00836A 81               [ 4]  798         RET
                                    799 
                                    800 ;       UM+     ( u u -- udsum )
                                    801 ;       Add two unsigned single
                                    802 ;       and return a double sum.
      00836B 83 58                  803         .word      LINK
                           0002ED   804 LINK	= . 
      00836D 03                     805         .byte      3
      00836E 55 4D 2B               806         .ascii     "UM+"
      008371                        807 UPLUS:
      008371 A6 01            [ 1]  808         LD A,#1
      008373 90 93            [ 1]  809         LDW Y,X
      008375 90 EE 02         [ 2]  810         LDW Y,(2,Y)
      008378 90 BF 20         [ 2]  811         LDW YTEMP,Y
      00837B 90 93            [ 1]  812         LDW Y,X
      00837D 90 FE            [ 2]  813         LDW Y,(Y)
      00837F 72 B9 00 20      [ 2]  814         ADDW Y,YTEMP
      008383 EF 02            [ 2]  815         LDW (2,X),Y
      008385 25 01            [ 1]  816         JRC     UPL1
      008387 4F               [ 1]  817         CLR A
      008388 E7 01            [ 1]  818 UPL1:   LD     (1,X),A
      00838A 7F               [ 1]  819         CLR (X)
      00838B 81               [ 4]  820         RET
                                    821 
                                    822 ;; System and user variables
                                    823 
                                    824 ;       doVAR   ( -- a )
                                    825 ;       Code for VARIABLE and CREATE.
      00838C 83 6D                  826         .word      LINK
                           00030E   827 LINK	= . 
      00838E 45                     828 	.byte      COMPO+5
      00838F 44 4F 56 41 52         829         .ascii     "DOVAR"
      008394                        830 DOVAR:
      008394 1D 00 02         [ 2]  831 	SUBW X,#2
      008397 90 85            [ 2]  832         POPW Y    ;get return addr (pfa)
                           000001   833 .if PICATOUT_MOD
      008399 90 FE            [ 2]  834         LDW Y,(Y) ; indirect address 
                                    835 .endif ;PICATOUT_MOD        
      00839B FF               [ 2]  836         LDW (X),Y    ;push on stack
      00839C 81               [ 4]  837         RET     ;go to RET of EXEC
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 17.
Hexadecimal [24-Bits]



                                    838 
                                    839 ;       BASE    ( -- a )
                                    840 ;       Radix base for numeric I/O.
      00839D 83 8E                  841         .word      LINK        
                           00031F   842 LINK = . 
      00839F 04                     843         .byte      4
      0083A0 42 41 53 45            844         .ascii     "BASE"
      0083A4                        845 BASE:
      0083A4 90 AE 00 06      [ 2]  846 	LDW Y,#UBASE 
      0083A8 1D 00 02         [ 2]  847 	SUBW X,#2
      0083AB FF               [ 2]  848         LDW (X),Y
      0083AC 81               [ 4]  849         RET
                                    850 
                                    851 ;       tmp     ( -- a )
                                    852 ;       A temporary storage.
      0083AD 83 9F                  853         .word      LINK
                                    854         
                           00032F   855 LINK = . 
      0083AF 03                     856 	.byte      3
      0083B0 54 4D 50               857         .ascii     "TMP"
      0083B3                        858 TEMP:
      0083B3 90 AE 00 08      [ 2]  859 	LDW Y,#UTMP
      0083B7 1D 00 02         [ 2]  860 	SUBW X,#2
      0083BA FF               [ 2]  861         LDW (X),Y
      0083BB 81               [ 4]  862         RET
                                    863 
                                    864 ;       >IN     ( -- a )
                                    865 ;        Hold parsing pointer.
      0083BC 83 AF                  866         .word      LINK
                           00033E   867 LINK = . 
      0083BE 03                     868         .byte      3
      0083BF 3E 49 4E               869         .ascii    ">IN"
      0083C2                        870 INN:
      0083C2 90 AE 00 0A      [ 2]  871 	LDW Y,#UINN 
      0083C6 1D 00 02         [ 2]  872 	SUBW X,#2
      0083C9 FF               [ 2]  873         LDW (X),Y
      0083CA 81               [ 4]  874         RET
                                    875 
                                    876 ;       #TIB    ( -- a )
                                    877 ;       Count in terminal input buffer.
      0083CB 83 BE                  878         .word      LINK
                           00034D   879 LINK = . 
      0083CD 04                     880         .byte      4
      0083CE 23 54 49 42            881         .ascii     "#TIB"
      0083D2                        882 NTIB:
      0083D2 90 AE 00 0C      [ 2]  883 	LDW Y,#UCTIB 
      0083D6 1D 00 02         [ 2]  884 	SUBW X,#2
      0083D9 FF               [ 2]  885         LDW (X),Y
      0083DA 81               [ 4]  886         RET
                                    887 
                           000001   888 .if PICATOUT_MOD
                                    889 ;       TBUF ( -- a )
                                    890 ;       address of 128 bytes transaction buffer 
      0083DB 83 CD                  891         .word LINK 
                           00035D   892         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
Hexadecimal [24-Bits]



      0083DD 04                     893         .byte 4 
      0083DE 54 42 55 46            894         .ascii "TBUF"
      0083E2                        895 TBUF:
      0083E2 90 AE 16 80      [ 2]  896         ldw y,#ROWBUFF
      0083E6 1D 00 02         [ 2]  897         subw x,#CELLL
      0083E9 FF               [ 2]  898         ldw (x),y 
      0083EA 81               [ 4]  899         ret 
                                    900 
                                    901 
                                    902 .endif ;PICATOUT_MOD
                                    903 
                                    904 ;       "EVAL   ( -- a )
                                    905 ;       Execution vector of EVAL.
      0083EB 83 DD                  906         .word      LINK
                           00036D   907 LINK = . 
      0083ED 05                     908         .byte      5
      0083EE 27 45 56 41 4C         909         .ascii     "'EVAL"
      0083F3                        910 TEVAL:
      0083F3 90 AE 00 10      [ 2]  911 	LDW Y,#UINTER 
      0083F7 1D 00 02         [ 2]  912 	SUBW X,#2
      0083FA FF               [ 2]  913         LDW (X),Y
      0083FB 81               [ 4]  914         RET
                                    915 
                                    916 ;       HLD     ( -- a )
                                    917 ;       Hold a pointer of output string.
      0083FC 83 ED                  918         .word      LINK
                           00037E   919 LINK = . 
      0083FE 03                     920         .byte      3
      0083FF 48 4C 44               921         .ascii     "HLD"
      008402                        922 HLD:
      008402 90 AE 00 12      [ 2]  923 	LDW Y,#UHLD 
      008406 1D 00 02         [ 2]  924 	SUBW X,#2
      008409 FF               [ 2]  925         LDW (X),Y
      00840A 81               [ 4]  926         RET
                                    927 
                                    928 ;       CONTEXT ( -- a )
                                    929 ;       Start vocabulary search.
      00840B 83 FE                  930         .word      LINK
                           00038D   931 LINK = . 
      00840D 07                     932         .byte      7
      00840E 43 4F 4E 54 45 58 54   933         .ascii     "CONTEXT"
      008415                        934 CNTXT:
      008415 90 AE 00 14      [ 2]  935 	LDW Y,#UCNTXT
      008419 1D 00 02         [ 2]  936 	SUBW X,#2
      00841C FF               [ 2]  937         LDW (X),Y
      00841D 81               [ 4]  938         RET
                                    939 
                                    940 ;       VP      ( -- a )
                                    941 ;       Point to top of variables
      00841E 84 0D                  942         .word      LINK
                           0003A0   943 LINK = . 
      008420 02                     944         .byte      2
      008421 56 50                  945         .ascii     "VP"
      008423                        946 VPP:
      008423 90 AE 00 16      [ 2]  947 	LDW Y,#UVP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]



      008427 1D 00 02         [ 2]  948 	SUBW X,#2
      00842A FF               [ 2]  949         LDW (X),Y
      00842B 81               [ 4]  950         RET
                                    951 
                           000001   952 .if PICATOUT_MOD
                                    953 ;       CP    ( -- a )
                                    954 ;       Pointer to top of FLASH 
      00842C 84 20                  955         .word LINK 
                           0003AE   956         LINK=.
      00842E 03                     957         .byte 3 
      00842F 43 50                  958         .ascii "CP"
      008431                        959 CPP: 
      008431 90 AE 00 18      [ 2]  960         ldw y,#UCP 
      008435 1D 00 02         [ 2]  961         subw x,#CELLL 
      008438 FF               [ 2]  962         ldw (x),y 
      008439 81               [ 4]  963         ret                
                                    964 .endif ;PICATOUT_MOD
                                    965 
                                    966 ;       LAST    ( -- a )
                                    967 ;       Point to last name in dictionary.
      00843A 84 2E                  968         .word      LINK
                           0003BC   969 LINK = . 
      00843C 04                     970         .byte      4
      00843D 4C 41 53 54            971         .ascii     "LAST"
      008441                        972 LAST:
      008441 90 AE 00 1A      [ 2]  973 	LDW Y,#ULAST 
      008445 1D 00 02         [ 2]  974 	SUBW X,#2
      008448 FF               [ 2]  975         LDW (X),Y
      008449 81               [ 4]  976         RET
                                    977 
                           000001   978 .if PICATOUT_MOD
      00844A 84 3C                  979         .word LINK 
                           0003CC   980         LINK=.
      00844C 06                     981         .byte 6
      00844D 4F 46 46 53 45 54      982         .ascii "OFFSET" 
      008453                        983 OFFSET: 
      008453 1D 00 02         [ 2]  984         subw x,#CELLL
      008456 90 AE 00 1C      [ 2]  985         ldw y,#UOFFSET 
      00845A FF               [ 2]  986         ldw (x),y 
      00845B 81               [ 4]  987         ret 
                                    988 
                                    989 ; adjust jump address adding OFFSET
                                    990 ; ADR-ADJ ( a -- a+offset )
      00845C                        991 ADRADJ: 
      00845C CD 84 53         [ 4]  992         call OFFSET 
      00845F CD 82 40         [ 4]  993         call AT 
      008462 CC 84 BD         [ 2]  994         jp PLUS 
                                    995 
                                    996 .endif ; PICATOUT_MOD
                                    997 
                                    998 ;; Common functions
                                    999 
                                   1000 ;       ?DUP    ( w -- w w | 0 )
                                   1001 ;       Dup tos if its is not zero.
      008465 84 4C                 1002         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]



                           0003E7  1003 LINK = . 
      008467 04                    1004         .byte      4
      008468 3F 44 55 50           1005         .ascii     "?DUP"
      00846C                       1006 QDUP:
      00846C 90 93            [ 1] 1007         LDW Y,X
      00846E 90 FE            [ 2] 1008 	LDW Y,(Y)
      008470 27 04            [ 1] 1009         JREQ     QDUP1
      008472 1D 00 02         [ 2] 1010 	SUBW X,#2
      008475 FF               [ 2] 1011         LDW (X),Y
      008476 81               [ 4] 1012 QDUP1:  RET
                                   1013 
                                   1014 ;       ROT     ( w1 w2 w3 -- w2 w3 w1 )
                                   1015 ;       Rot 3rd item to top.
      008477 84 67                 1016         .word      LINK
                           0003F9  1017 LINK = . 
      008479 03                    1018         .byte      3
      00847A 52 4F 54              1019         .ascii     "ROT"
      00847D                       1020 ROT:
                           000001  1021 .if PICATOUT_MOD
      00847D 90 93            [ 1] 1022         ldw y,x 
      00847F 90 FE            [ 2] 1023         ldw y,(y)
      008481 90 89            [ 2] 1024         pushw y 
      008483 90 93            [ 1] 1025         ldw y,x 
      008485 90 EE 04         [ 2] 1026         ldw y,(4,y)
      008488 FF               [ 2] 1027         ldw (x),y 
      008489 90 93            [ 1] 1028         ldw y,x 
      00848B 90 EE 02         [ 2] 1029         ldw y,(2,y)
      00848E EF 04            [ 2] 1030         ldw (4,x),y 
      008490 90 85            [ 2] 1031         popw y 
      008492 EF 02            [ 2] 1032         ldw (2,x),y
      008494 81               [ 4] 1033         ret 
                           000000  1034 .else 
                                   1035         LDW Y,X
                                   1036 	LDW Y,(4,Y)
                                   1037 	LDW YTEMP,Y
                                   1038         LDW Y,X
                                   1039         LDW Y,(2,Y)
                                   1040         LDW XTEMP,Y
                                   1041         LDW Y,X
                                   1042         LDW Y,(Y)
                                   1043         LDW (2,X),Y
                                   1044         LDW Y,XTEMP
                                   1045         LDW (4,X),Y
                                   1046         LDW Y,YTEMP
                                   1047         LDW (X),Y
                                   1048         RET
                                   1049 .endif 
                                   1050 
                                   1051 ;       2DROP   ( w w -- )
                                   1052 ;       Discard two items on stack.
      008495 84 79                 1053         .word      LINK
                           000417  1054 LINK = . 
      008497 05                    1055         .byte      5
      008498 32 44 52 4F 50        1056         .ascii     "2DROP"
      00849D                       1057 DDROP:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



      00849D 1C 00 04         [ 2] 1058         ADDW X,#4
      0084A0 81               [ 4] 1059         RET
                                   1060 
                                   1061 ;       2DUP    ( w1 w2 -- w1 w2 w1 w2 )
                                   1062 ;       Duplicate top two items.
      0084A1 84 97                 1063         .word      LINK
                           000423  1064 LINK = . 
      0084A3 04                    1065         .byte      4
      0084A4 32 44 55 50           1066         .ascii     "2DUP"
      0084A8                       1067 DDUP:
      0084A8 1D 00 04         [ 2] 1068         SUBW X,#4
      0084AB 90 93            [ 1] 1069         LDW Y,X
      0084AD 90 EE 06         [ 2] 1070         LDW Y,(6,Y)
      0084B0 EF 02            [ 2] 1071         LDW (2,X),Y
      0084B2 90 93            [ 1] 1072         LDW Y,X
      0084B4 90 EE 04         [ 2] 1073         LDW Y,(4,Y)
      0084B7 FF               [ 2] 1074         LDW (X),Y
      0084B8 81               [ 4] 1075         RET
                                   1076 
                                   1077 ;       +       ( w w -- sum )
                                   1078 ;       Add top two items.
      0084B9 84 A3                 1079         .word      LINK
                           00043B  1080 LINK = . 
      0084BB 01                    1081         .byte      1
      0084BC 2B                    1082         .ascii     "+"
      0084BD                       1083 PLUS:
      0084BD 90 93            [ 1] 1084         LDW Y,X
      0084BF 90 FE            [ 2] 1085         LDW Y,(Y)
      0084C1 90 BF 20         [ 2] 1086         LDW YTEMP,Y
      0084C4 1C 00 02         [ 2] 1087         ADDW X,#2
      0084C7 90 93            [ 1] 1088         LDW Y,X
      0084C9 90 FE            [ 2] 1089         LDW Y,(Y)
      0084CB 72 B9 00 20      [ 2] 1090         ADDW Y,YTEMP
      0084CF FF               [ 2] 1091         LDW (X),Y
      0084D0 81               [ 4] 1092         RET
                                   1093 
                                   1094 ;       NOT     ( w -- w )
                                   1095 ;       One's complement of tos.
      0084D1 84 BB                 1096         .word      LINK
                           000453  1097 LINK = . 
      0084D3 03                    1098         .byte      3
      0084D4 4E 4F 54              1099         .ascii     "NOT"
      0084D7                       1100 INVER:
      0084D7 90 93            [ 1] 1101         LDW Y,X
      0084D9 90 FE            [ 2] 1102         LDW Y,(Y)
      0084DB 90 53            [ 2] 1103         CPLW Y
      0084DD FF               [ 2] 1104         LDW (X),Y
      0084DE 81               [ 4] 1105         RET
                                   1106 
                                   1107 ;       NEGATE  ( n -- -n )
                                   1108 ;       Two's complement of tos.
      0084DF 84 D3                 1109         .word      LINK
                           000461  1110 LINK = . 
      0084E1 06                    1111         .byte      6
      0084E2 4E 45 47 41 54 45     1112         .ascii     "NEGATE"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]



      0084E8                       1113 NEGAT:
      0084E8 90 93            [ 1] 1114         LDW Y,X
      0084EA 90 FE            [ 2] 1115         LDW Y,(Y)
      0084EC 90 50            [ 2] 1116         NEGW Y
      0084EE FF               [ 2] 1117         LDW (X),Y
      0084EF 81               [ 4] 1118         RET
                                   1119 
                                   1120 ;       DNEGATE ( d -- -d )
                                   1121 ;       Two's complement of top double.
      0084F0 84 E1                 1122         .word      LINK
                           000472  1123 LINK = . 
      0084F2 07                    1124         .byte      7
      0084F3 44 4E 45 47 41 54 45  1125         .ascii     "DNEGATE"
      0084FA                       1126 DNEGA:
      0084FA 90 93            [ 1] 1127         LDW Y,X
      0084FC 90 FE            [ 2] 1128 	LDW Y,(Y)
      0084FE 90 53            [ 2] 1129         CPLW Y     
      008500 90 BF 20         [ 2] 1130 	LDW YTEMP,Y
      008503 90 93            [ 1] 1131         LDW Y,X
      008505 90 EE 02         [ 2] 1132         LDW Y,(2,Y)
      008508 90 53            [ 2] 1133         CPLW Y
      00850A 90 5C            [ 2] 1134         INCW Y
      00850C EF 02            [ 2] 1135         LDW (2,X),Y
      00850E 90 BE 20         [ 2] 1136         LDW Y,YTEMP
      008511 24 02            [ 1] 1137         JRNC DN1 
      008513 90 5C            [ 2] 1138         INCW Y
      008515 FF               [ 2] 1139 DN1:    LDW (X),Y
      008516 81               [ 4] 1140         RET
                                   1141 
                                   1142 ;       -       ( n1 n2 -- n1-n2 )
                                   1143 ;       Subtraction.
      008517 84 F2                 1144         .word      LINK
                           000499  1145 LINK = . 
      008519 01                    1146         .byte      1
      00851A 2D                    1147         .ascii     "-"
      00851B                       1148 SUBB:
      00851B 90 93            [ 1] 1149         LDW Y,X
      00851D 90 FE            [ 2] 1150         LDW Y,(Y)
      00851F 90 BF 20         [ 2] 1151         LDW YTEMP,Y
      008522 1C 00 02         [ 2] 1152         ADDW X,#2
      008525 90 93            [ 1] 1153         LDW Y,X
      008527 90 FE            [ 2] 1154         LDW Y,(Y)
      008529 72 B2 00 20      [ 2] 1155         SUBW Y,YTEMP
      00852D FF               [ 2] 1156         LDW (X),Y
      00852E 81               [ 4] 1157         RET
                                   1158 
                                   1159 ;       ABS     ( n -- n )
                                   1160 ;       Return  absolute value of n.
      00852F 85 19                 1161         .word      LINK
                           0004B1  1162 LINK = . 
      008531 03                    1163         .byte      3
      008532 41 42 53              1164         .ascii     "ABS"
      008535                       1165 ABSS:
      008535 90 93            [ 1] 1166         LDW Y,X
      008537 90 FE            [ 2] 1167 	LDW Y,(Y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



      008539 2A 03            [ 1] 1168         JRPL     AB1     ;negate:
      00853B 90 50            [ 2] 1169         NEGW     Y     ;else negate hi byte
      00853D FF               [ 2] 1170         LDW (X),Y
      00853E 81               [ 4] 1171 AB1:    RET
                                   1172 
                                   1173 ;       =       ( w w -- t )
                                   1174 ;       Return true if top two are =al.
      00853F 85 31                 1175         .word      LINK
                           0004C1  1176 LINK = . 
      008541 01                    1177         .byte      1
      008542 3D                    1178         .ascii     "="
      008543                       1179 EQUAL:
      008543 A6 FF            [ 1] 1180         LD A,#0xFF  ;true
      008545 90 93            [ 1] 1181         LDW Y,X    ;D = n2
      008547 90 FE            [ 2] 1182         LDW Y,(Y)
      008549 90 BF 20         [ 2] 1183         LDW YTEMP,Y
      00854C 1C 00 02         [ 2] 1184         ADDW X,#2
      00854F 90 93            [ 1] 1185         LDW Y,X
      008551 90 FE            [ 2] 1186         LDW Y,(Y)
      008553 90 B3 20         [ 2] 1187         CPW Y,YTEMP     ;if n2 <> n1
      008556 27 01            [ 1] 1188         JREQ     EQ1
      008558 4F               [ 1] 1189         CLR A
      008559 F7               [ 1] 1190 EQ1:    LD (X),A
      00855A E7 01            [ 1] 1191         LD (1,X),A
      00855C 81               [ 4] 1192 	RET     
                                   1193 
                                   1194 ;       U<      ( u u -- t )
                                   1195 ;       Unsigned compare of top two items.
      00855D 85 41                 1196         .word      LINK
                           0004DF  1197 LINK = . 
      00855F 02                    1198         .byte      2
      008560 55 3C                 1199         .ascii     "U<"
      008562                       1200 ULESS:
      008562 A6 FF            [ 1] 1201         LD A,#0xFF  ;true
      008564 90 93            [ 1] 1202         LDW Y,X    ;D = n2
      008566 90 FE            [ 2] 1203         LDW Y,(Y)
      008568 90 BF 20         [ 2] 1204         LDW YTEMP,Y
      00856B 1C 00 02         [ 2] 1205         ADDW X,#2
      00856E 90 93            [ 1] 1206         LDW Y,X
      008570 90 FE            [ 2] 1207         LDW Y,(Y)
      008572 90 B3 20         [ 2] 1208         CPW Y,YTEMP     ;if n2 <> n1
      008575 25 01            [ 1] 1209         JRULT     ULES1
      008577 4F               [ 1] 1210         CLR A
      008578 F7               [ 1] 1211 ULES1:  LD (X),A
      008579 E7 01            [ 1] 1212         LD (1,X),A
      00857B 81               [ 4] 1213 	RET     
                                   1214 
                                   1215 ;       <       ( n1 n2 -- t )
                                   1216 ;       Signed compare of top two items.
      00857C 85 5F                 1217         .word      LINK
                           0004FE  1218 LINK = . 
      00857E 01                    1219         .byte      1
      00857F 3C                    1220         .ascii     "<"
      008580                       1221 LESS:
      008580 A6 FF            [ 1] 1222         LD A,#0xFF  ;true
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]



      008582 90 93            [ 1] 1223         LDW Y,X    ;D = n2
      008584 90 FE            [ 2] 1224         LDW Y,(Y)
      008586 90 BF 20         [ 2] 1225         LDW YTEMP,Y
      008589 1C 00 02         [ 2] 1226         ADDW X,#2
      00858C 90 93            [ 1] 1227         LDW Y,X
      00858E 90 FE            [ 2] 1228         LDW Y,(Y)
      008590 90 B3 20         [ 2] 1229         CPW Y,YTEMP     ;if n2 <> n1
      008593 2F 01            [ 1] 1230         JRSLT     LT1
      008595 4F               [ 1] 1231         CLR A
      008596 F7               [ 1] 1232 LT1:    LD (X),A
      008597 E7 01            [ 1] 1233         LD (1,X),A
      008599 81               [ 4] 1234 	RET     
                                   1235 
                                   1236 ;       MAX     ( n n -- n )
                                   1237 ;       Return greater of two top items.
      00859A 85 7E                 1238         .word      LINK
                           00051C  1239 LINK = . 
      00859C 03                    1240         .byte      3
      00859D 4D 41 58              1241         .ascii     "MAX"
      0085A0                       1242 MAX:
      0085A0 90 93            [ 1] 1243         LDW Y,X    ;D = n2
      0085A2 90 EE 02         [ 2] 1244         LDW Y,(2,Y)
      0085A5 90 BF 20         [ 2] 1245         LDW YTEMP,Y
      0085A8 90 93            [ 1] 1246         LDW Y,X
      0085AA 90 FE            [ 2] 1247         LDW Y,(Y)
      0085AC 90 B3 20         [ 2] 1248         CPW Y,YTEMP     ;if n2 <> n1
      0085AF 2F 02            [ 1] 1249         JRSLT     MAX1
      0085B1 EF 02            [ 2] 1250         LDW (2,X),Y
      0085B3 1C 00 02         [ 2] 1251 MAX1:   ADDW X,#2
      0085B6 81               [ 4] 1252 	RET     
                                   1253 
                                   1254 ;       MIN     ( n n -- n )
                                   1255 ;       Return smaller of top two items.
      0085B7 85 9C                 1256         .word      LINK
                           000539  1257 LINK = . 
      0085B9 03                    1258         .byte      3
      0085BA 4D 49 4E              1259         .ascii     "MIN"
      0085BD                       1260 MIN:
      0085BD 90 93            [ 1] 1261         LDW Y,X    ;D = n2
      0085BF 90 EE 02         [ 2] 1262         LDW Y,(2,Y)
      0085C2 90 BF 20         [ 2] 1263         LDW YTEMP,Y
      0085C5 90 93            [ 1] 1264         LDW Y,X
      0085C7 90 FE            [ 2] 1265         LDW Y,(Y)
      0085C9 90 B3 20         [ 2] 1266         CPW Y,YTEMP     ;if n2 <> n1
      0085CC 2C 02            [ 1] 1267         JRSGT     MIN1
      0085CE EF 02            [ 2] 1268         LDW (2,X),Y
      0085D0 1C 00 02         [ 2] 1269 MIN1:	ADDW X,#2
      0085D3 81               [ 4] 1270 	RET     
                                   1271 
                                   1272 ;       WITHIN  ( u ul uh -- t )
                                   1273 ;       Return true if u is within
                                   1274 ;       range of ul and uh. ( ul <= u < uh )
      0085D4 85 B9                 1275         .word      LINK
                           000556  1276 LINK = . 
      0085D6 06                    1277         .byte      6
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



      0085D7 57 49 54 48 49 4E     1278         .ascii     "WITHIN"
      0085DD                       1279 WITHI:
      0085DD CD 83 11         [ 4] 1280         CALL     OVER
      0085E0 CD 85 1B         [ 4] 1281         CALL     SUBB
      0085E3 CD 82 B0         [ 4] 1282         CALL     TOR
      0085E6 CD 85 1B         [ 4] 1283         CALL     SUBB
      0085E9 CD 82 91         [ 4] 1284         CALL     RFROM
      0085EC CC 85 62         [ 2] 1285         JP     ULESS
                                   1286 
                                   1287 ;; Divide
                                   1288 
                                   1289 ;       UM/MOD  ( udl udh un -- ur uq )
                                   1290 ;       Unsigned divide of a double by a
                                   1291 ;       single. Return mod and quotient.
      0085EF 85 D6                 1292         .word      LINK
                           000571  1293 LINK = . 
      0085F1 06                    1294         .byte      6
      0085F2 55 4D 2F 4D 4F 44     1295         .ascii     "UM/MOD"
      0085F8                       1296 UMMOD:
      0085F8 BF 1E            [ 2] 1297 	LDW XTEMP,X	; save stack pointer
      0085FA FE               [ 2] 1298 	LDW X,(X)	; un
      0085FB BF 20            [ 2] 1299 	LDW YTEMP,X     ; save un
      0085FD 90 BE 1E         [ 2] 1300 	LDW Y,XTEMP	; stack pointer
      008600 90 EE 04         [ 2] 1301 	LDW Y,(4,Y)     ; Y=udl
      008603 BE 1E            [ 2] 1302 	LDW X,XTEMP
      008605 EE 02            [ 2] 1303 	LDW X,(2,X)	; X=udh
      008607 B3 20            [ 2] 1304 	CPW X,YTEMP
      008609 23 0F            [ 2] 1305 	JRULE MMSM1
      00860B BE 1E            [ 2] 1306 	LDW X,XTEMP
      00860D 1C 00 02         [ 2] 1307 	ADDW X,#2	; pop off 1 level
      008610 90 AE FF FF      [ 2] 1308 	LDW Y,#0xFFFF
      008614 FF               [ 2] 1309 	LDW (X),Y
      008615 90 5F            [ 1] 1310 	CLRW Y
      008617 EF 02            [ 2] 1311 	LDW (2,X),Y
      008619 81               [ 4] 1312 	RET
      00861A                       1313 MMSM1:
                           000001  1314 .if  PICATOUT_MOD 
                                   1315 ; take advantage of divw x,y when udh==0
      00861A 5D               [ 2] 1316         tnzw x  ; is udh==0?
      00861B 26 11            [ 1] 1317         jrne MMSM2 
      00861D 93               [ 1] 1318         ldw x,y    ;udl 
      00861E 90 BE 20         [ 2] 1319         ldw y,YTEMP ; divisor 
      008621 65               [ 2] 1320         divw x,y 
      008622 89               [ 2] 1321         pushw x     ; quotient 
      008623 BE 1E            [ 2] 1322         ldw x,XTEMP 
      008625 1C 00 02         [ 2] 1323         addw x,#CELLL 
      008628 EF 02            [ 2] 1324         ldw (2,x),y  ; ur
      00862A 90 85            [ 2] 1325         popw y 
      00862C FF               [ 2] 1326         ldw (x),y ; uq 
      00862D 81               [ 4] 1327         ret 
      00862E                       1328 MMSM2:        
                                   1329 .endif 
      00862E A6 11            [ 1] 1330 	LD A,#17	; loop count
      008630                       1331 MMSM3:
      008630 B3 20            [ 2] 1332 	CPW X,YTEMP	; compare udh to un
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



      008632 25 04            [ 1] 1333 	JRULT MMSM4	; can't subtract
      008634 72 B0 00 20      [ 2] 1334 	SUBW X,YTEMP	; can subtract
      008638                       1335 MMSM4:
      008638 8C               [ 1] 1336 	CCF	; quotient bit
      008639 90 59            [ 2] 1337 	RLCW Y	; rotate into quotient
      00863B 59               [ 2] 1338 	RLCW X	; rotate into remainder
      00863C 4A               [ 1] 1339 	DEC A	; repeat
      00863D 22 F1            [ 1] 1340 	JRUGT MMSM3
      00863F 57               [ 2] 1341 	SRAW X
      008640 BF 20            [ 2] 1342 	LDW YTEMP,X	; done, save remainder
      008642 BE 1E            [ 2] 1343 	LDW X,XTEMP
      008644 1C 00 02         [ 2] 1344 	ADDW X,#2	; drop
      008647 FF               [ 2] 1345 	LDW (X),Y
      008648 90 BE 20         [ 2] 1346 	LDW Y,YTEMP	; save quotient
      00864B EF 02            [ 2] 1347 	LDW (2,X),Y
      00864D 81               [ 4] 1348 	RET
                                   1349 	
                                   1350 ;       M/MOD   ( d n -- r q )
                                   1351 ;       Signed floored divide of double by
                                   1352 ;       single. Return mod and quotient.
      00864E 85 F1                 1353         .word      LINK
                           0005D0  1354 LINK = . 
      008650 05                    1355         .byte      5
      008651 4D 2F 4D 4F 44        1356         .ascii     "M/MOD"
      008656                       1357 MSMOD:  
      008656 CD 82 E7         [ 4] 1358         CALL	DUPP
      008659 CD 83 20         [ 4] 1359         CALL	ZLESS
      00865C CD 82 E7         [ 4] 1360         CALL	DUPP
      00865F CD 82 B0         [ 4] 1361         CALL	TOR
      008662 CD 81 EB         [ 4] 1362         CALL	QBRAN
      008665 86 73                 1363         .word	MMOD1
      008667 CD 84 E8         [ 4] 1364         CALL	NEGAT
      00866A CD 82 B0         [ 4] 1365         CALL	TOR
      00866D CD 84 FA         [ 4] 1366         CALL	DNEGA
      008670 CD 82 91         [ 4] 1367         CALL	RFROM
      008673 CD 82 B0         [ 4] 1368 MMOD1:	CALL	TOR
      008676 CD 82 E7         [ 4] 1369         CALL	DUPP
      008679 CD 83 20         [ 4] 1370         CALL	ZLESS
      00867C CD 81 EB         [ 4] 1371         CALL	QBRAN
      00867F 86 87                 1372         .word	MMOD2
      008681 CD 82 A4         [ 4] 1373         CALL	RAT
      008684 CD 84 BD         [ 4] 1374         CALL	PLUS
      008687 CD 82 91         [ 4] 1375 MMOD2:	CALL	RFROM
      00868A CD 85 F8         [ 4] 1376         CALL	UMMOD
      00868D CD 82 91         [ 4] 1377         CALL	RFROM
      008690 CD 81 EB         [ 4] 1378         CALL	QBRAN
      008693 86 9E                 1379         .word	MMOD3
      008695 CD 82 F7         [ 4] 1380         CALL	SWAPP
      008698 CD 84 E8         [ 4] 1381         CALL	NEGAT
      00869B CD 82 F7         [ 4] 1382         CALL	SWAPP
      00869E 81               [ 4] 1383 MMOD3:	RET
                                   1384 
                                   1385 ;       /MOD    ( n n -- r q )
                                   1386 ;       Signed divide. Return mod and quotient.
      00869F 86 50                 1387         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal [24-Bits]



                           000621  1388 LINK = . 
      0086A1 04                    1389         .byte      4
      0086A2 2F 4D 4F 44           1390         .ascii     "/MOD"
      0086A6                       1391 SLMOD:
      0086A6 CD 83 11         [ 4] 1392         CALL	OVER
      0086A9 CD 83 20         [ 4] 1393         CALL	ZLESS
      0086AC CD 82 F7         [ 4] 1394         CALL	SWAPP
      0086AF CC 86 56         [ 2] 1395         JP	MSMOD
                                   1396 
                                   1397 ;       MOD     ( n n -- r )
                                   1398 ;       Signed divide. Return mod only.
      0086B2 86 A1                 1399         .word      LINK
                           000634  1400 LINK = . 
      0086B4 03                    1401         .byte      3
      0086B5 4D 4F 44              1402         .ascii     "MOD"
      0086B8                       1403 MODD:
      0086B8 CD 86 A6         [ 4] 1404 	CALL	SLMOD
      0086BB CC 82 DD         [ 2] 1405 	JP	DROP
                                   1406 
                                   1407 ;       /       ( n n -- q )
                                   1408 ;       Signed divide. Return quotient only.
      0086BE 86 B4                 1409         .word      LINK
                           000640  1410 LINK = . 
      0086C0 01                    1411         .byte      1
      0086C1 2F                    1412         .ascii     "/"
      0086C2                       1413 SLASH:
      0086C2 CD 86 A6         [ 4] 1414         CALL	SLMOD
      0086C5 CD 82 F7         [ 4] 1415         CALL	SWAPP
      0086C8 CC 82 DD         [ 2] 1416         JP	DROP
                                   1417 
                                   1418 ;; Multiply
                                   1419 
                                   1420 ;       UM*     ( u u -- ud )
                                   1421 ;       Unsigned multiply. Return double product.
      0086CB 86 C0                 1422         .word      LINK
                           00064D  1423 LINK = . 
      0086CD 03                    1424         .byte      3
      0086CE 55 4D 2A              1425         .ascii     "UM*"
      0086D1                       1426 UMSTA:	; stack have 4 bytes u1=a,b u2=c,d
                           000001  1427 .if PICATOUT_MOD 
                                   1428 ; take advantage of SP addressing modes
                                   1429 ; these PRODx in RAM are not required
                                   1430 ; the product is kept on stack as local variable 
                                   1431         ;; bytes offset on data stack 
                           000002  1432         da=2 
                           000003  1433         db=3 
                           000000  1434         dc=0 
                           000001  1435         dd=1 
                                   1436         ;; product bytes offset on return stack 
                           000001  1437         UD1=1  ; ud bits 31..24
                           000002  1438         UD2=2  ; ud bits 23..16
                           000003  1439         UD3=3  ; ud bits 15..8 
                           000004  1440         UD4=4  ; ud bits 7..0 
                                   1441         ;; local variable for product set to zero   
      0086D1 90 5F            [ 1] 1442         clrw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



      0086D3 90 89            [ 2] 1443         pushw y  ; bits 15..0
      0086D5 90 89            [ 2] 1444         pushw y  ; bits 31..16 
      0086D7 E6 03            [ 1] 1445         ld a,(db,x) ; b 
      0086D9 90 97            [ 1] 1446         ld yl,a 
      0086DB E6 01            [ 1] 1447         ld a,(dd,x)   ; d
      0086DD 90 42            [ 4] 1448         mul y,a    ; b*d  
      0086DF 17 03            [ 2] 1449         ldw (UD3,sp),y ; lowest weight product 
      0086E1 E6 03            [ 1] 1450         ld a,(db,x)
      0086E3 90 97            [ 1] 1451         ld yl,a 
      0086E5 E6 00            [ 1] 1452         ld a,(dc,x)
      0086E7 90 42            [ 4] 1453         mul y,a  ; b*c 
                                   1454         ;;; do the partial sum 
      0086E9 72 F9 02         [ 2] 1455         addw y,(UD2,sp)
      0086EC 4F               [ 1] 1456         clr a 
      0086ED 49               [ 1] 1457         rlc a
      0086EE 6B 01            [ 1] 1458         ld (UD1,sp),a 
      0086F0 17 02            [ 2] 1459         ldw (UD2,sp),y 
      0086F2 E6 02            [ 1] 1460         ld a,(da,x)
      0086F4 90 97            [ 1] 1461         ld yl,a 
      0086F6 E6 01            [ 1] 1462         ld a,(dd,x)
      0086F8 90 42            [ 4] 1463         mul y,a   ; a*d 
                                   1464         ;; do partial sum 
      0086FA 72 F9 02         [ 2] 1465         addw y,(UD2,sp)
      0086FD 4F               [ 1] 1466         clr a 
      0086FE 19 01            [ 1] 1467         adc a,(UD1,sp)
      008700 6B 01            [ 1] 1468         ld (UD1,sp),a  
      008702 17 02            [ 2] 1469         ldw (UD2,sp),y 
      008704 E6 02            [ 1] 1470         ld a,(da,x)
      008706 90 97            [ 1] 1471         ld yl,a 
      008708 E6 00            [ 1] 1472         ld a,(dc,x)
      00870A 90 42            [ 4] 1473         mul y,a  ;  a*c highest weight product 
                                   1474         ;;; do partial sum 
      00870C 72 F9 01         [ 2] 1475         addw y,(UD1,sp)
      00870F FF               [ 2] 1476         ldw (x),y  ; udh 
      008710 16 03            [ 2] 1477         ldw y,(UD3,sp)
      008712 EF 02            [ 2] 1478         ldw (2,x),y  ; udl  
      008714 5B 04            [ 2] 1479         addw sp,#4 ; drop local variable 
      008716 81               [ 4] 1480         ret  
                           000000  1481 .else
                                   1482 	LD A,(2,X)	; b
                                   1483 	LD YL,A
                                   1484 	LD A,(X)	; d
                                   1485 	MUL Y,A
                                   1486 	LDW PROD1,Y
                                   1487 	LD A,(3,X)	; a
                                   1488 	LD YL,A
                                   1489 	LD A,(X)	; d
                                   1490 	MUL Y,A
                                   1491 	LDW PROD2,Y
                                   1492 	LD A,(2,X)	; b
                                   1493 	LD YL,A
                                   1494 	LD A,(1,X)	; c
                                   1495 	MUL Y,A
                                   1496 	LDW PROD3,Y
                                   1497 	LD A,(3,X)	; a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



                                   1498 	LD YL,A
                                   1499 	LD A,(1,X)	; c
                                   1500 	MUL Y,A	; least signifiant product
                                   1501 	CLR A
                                   1502 	RRWA Y
                                   1503 	LD (3,X),A	; store least significant byte
                                   1504 	ADDW Y,PROD3
                                   1505 	CLR A
                                   1506 	ADC A,#0	; save carry
                                   1507 	LD CARRY,A
                                   1508 	ADDW Y,PROD2
                                   1509 	LD A,CARRY
                                   1510 	ADC A,#0	; add 2nd carry
                                   1511 	LD CARRY,A
                                   1512 	CLR A
                                   1513 	RRWA Y
                                   1514 	LD (2,X),A	; 2nd product byte
                                   1515 	ADDW Y,PROD1
                                   1516 	RRWA Y
                                   1517 	LD (1,X),A	; 3rd product byte
                                   1518 	RRWA Y  	; 4th product byte now in A
                                   1519 	ADC A,CARRY	; fill in carry bits
                                   1520 	LD (X),A
                                   1521 	RET
                                   1522 .endif 
                                   1523 
                                   1524 
                                   1525 ;       *       ( n n -- n )
                                   1526 ;       Signed multiply. Return single product.
      008717 86 CD                 1527         .word      LINK
                           000699  1528 LINK = . 
      008719 01                    1529         .byte      1
      00871A 2A                    1530         .ascii     "*"
      00871B                       1531 STAR:
      00871B CD 86 D1         [ 4] 1532 	CALL	UMSTA
      00871E CC 82 DD         [ 2] 1533 	JP	DROP
                                   1534 
                                   1535 ;       M*      ( n n -- d )
                                   1536 ;       Signed multiply. Return double product.
      008721 87 19                 1537         .word      LINK
                           0006A3  1538 LINK = . 
      008723 02                    1539         .byte      2
      008724 4D 2A                 1540         .ascii     "M*"
      008726                       1541 MSTAR:      
      008726 CD 84 A8         [ 4] 1542         CALL	DDUP
      008729 CD 83 5C         [ 4] 1543         CALL	XORR
      00872C CD 83 20         [ 4] 1544         CALL	ZLESS
      00872F CD 82 B0         [ 4] 1545         CALL	TOR
      008732 CD 85 35         [ 4] 1546         CALL	ABSS
      008735 CD 82 F7         [ 4] 1547         CALL	SWAPP
      008738 CD 85 35         [ 4] 1548         CALL	ABSS
      00873B CD 86 D1         [ 4] 1549         CALL	UMSTA
      00873E CD 82 91         [ 4] 1550         CALL	RFROM
      008741 CD 81 EB         [ 4] 1551         CALL	QBRAN
      008744 87 49                 1552         .word	MSTA1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



      008746 CD 84 FA         [ 4] 1553         CALL	DNEGA
      008749 81               [ 4] 1554 MSTA1:	RET
                                   1555 
                                   1556 ;       . /MOD   ( n1 n2 n3 -- r q )
                                   1557 ;       Multiply n1 and n2, then divide
                                   1558 ;       by n3. Return mod and quotient.
      00874A 87 23                 1559         .word      LINK
                           0006CC  1560 LINK = . 
      00874C 05                    1561         .byte      5
      00874D 2A 2F 4D 4F 44        1562         .ascii     "*/MOD"
      008752                       1563 SSMOD:
      008752 CD 82 B0         [ 4] 1564         CALL     TOR
      008755 CD 87 26         [ 4] 1565         CALL     MSTAR
      008758 CD 82 91         [ 4] 1566         CALL     RFROM
      00875B CC 86 56         [ 2] 1567         JP     MSMOD
                                   1568 
                                   1569 ;       */      ( n1 n2 n3 -- q )
                                   1570 ;       Multiply n1 by n2, then divide
                                   1571 ;       by n3. Return quotient only.
      00875E 87 4C                 1572         .word      LINK
                           0006E0  1573 LINK = . 
      008760 02                    1574         .byte      2
      008761 2A 2F                 1575         .ascii     "*/"
      008763                       1576 STASL:
      008763 CD 87 52         [ 4] 1577         CALL	SSMOD
      008766 CD 82 F7         [ 4] 1578         CALL	SWAPP
      008769 CC 82 DD         [ 2] 1579         JP	DROP
                                   1580 
                                   1581 ;; Miscellaneous
                                   1582 
                                   1583 ;       CELL+   ( a -- a )
                                   1584 ;       Add cell size in byte to address.
      00876C 87 60                 1585         .word      LINK
                           0006EE  1586 LINK = . 
      00876E 02                    1587         .byte       2
      00876F 32 2B                 1588         .ascii     "2+"
      008771                       1589 CELLP:
      008771 90 93            [ 1] 1590         LDW Y,X
      008773 90 FE            [ 2] 1591 	LDW Y,(Y)
      008775 72 A9 00 02      [ 2] 1592         ADDW Y,#CELLL 
      008779 FF               [ 2] 1593         LDW (X),Y
      00877A 81               [ 4] 1594         RET
                                   1595 
                                   1596 ;       CELL-   ( a -- a )
                                   1597 ;       Subtract 2 from address.
      00877B 87 6E                 1598         .word      LINK
                           0006FD  1599 LINK = . 
      00877D 02                    1600         .byte       2
      00877E 32 2D                 1601         .ascii     "2-"
      008780                       1602 CELLM:
      008780 90 93            [ 1] 1603         LDW Y,X
      008782 90 FE            [ 2] 1604 	LDW Y,(Y)
      008784 72 A2 00 02      [ 2] 1605         SUBW Y,#CELLL
      008788 FF               [ 2] 1606         LDW (X),Y
      008789 81               [ 4] 1607         RET
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



                                   1608 
                                   1609 ;       CELLS   ( n -- n )
                                   1610 ;       Multiply tos by 2.
      00878A 87 7D                 1611         .word      LINK
                           00070C  1612 LINK = . 
      00878C 02                    1613         .byte       2
      00878D 32 2A                 1614         .ascii     "2*"
      00878F                       1615 CELLS:
      00878F 90 93            [ 1] 1616         LDW Y,X
      008791 90 FE            [ 2] 1617 	LDW Y,(Y)
      008793 90 58            [ 2] 1618         SLAW Y
      008795 FF               [ 2] 1619         LDW (X),Y
      008796 81               [ 4] 1620         RET
                                   1621 
                                   1622 ;       1+      ( a -- a )
                                   1623 ;       Add cell size in byte to address.
      008797 87 8C                 1624         .word      LINK
                           000719  1625 LINK = . 
      008799 02                    1626         .byte      2
      00879A 31 2B                 1627         .ascii     "1+"
      00879C                       1628 ONEP:
      00879C 90 93            [ 1] 1629         LDW Y,X
      00879E 90 FE            [ 2] 1630 	LDW Y,(Y)
      0087A0 90 5C            [ 2] 1631         INCW Y
      0087A2 FF               [ 2] 1632         LDW (X),Y
      0087A3 81               [ 4] 1633         RET
                                   1634 
                                   1635 ;       1-      ( a -- a )
                                   1636 ;       Subtract 2 from address.
      0087A4 87 99                 1637         .word      LINK
                           000726  1638 LINK = . 
      0087A6 02                    1639         .byte      2
      0087A7 31 2D                 1640         .ascii     "1-"
      0087A9                       1641 ONEM:
      0087A9 90 93            [ 1] 1642         LDW Y,X
      0087AB 90 FE            [ 2] 1643 	LDW Y,(Y)
      0087AD 90 5A            [ 2] 1644         DECW Y
      0087AF FF               [ 2] 1645         LDW (X),Y
      0087B0 81               [ 4] 1646         RET
                                   1647 
                                   1648 ;       2/      ( n -- n )
                                   1649 ;       Multiply tos by 2.
      0087B1 87 A6                 1650         .word      LINK
                           000733  1651 LINK = . 
      0087B3 02                    1652         .byte      2
      0087B4 32 2F                 1653         .ascii     "2/"
      0087B6                       1654 TWOSL:
      0087B6 90 93            [ 1] 1655         LDW Y,X
      0087B8 90 FE            [ 2] 1656 	LDW Y,(Y)
      0087BA 90 57            [ 2] 1657         SRAW Y
      0087BC FF               [ 2] 1658         LDW (X),Y
      0087BD 81               [ 4] 1659         RET
                                   1660 
                                   1661 ;       BL      ( -- 32 )
                                   1662 ;       Return 32,  blank character.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



      0087BE 87 B3                 1663         .word      LINK
                           000740  1664 LINK = . 
      0087C0 02                    1665         .byte      2
      0087C1 42 4C                 1666         .ascii     "BL"
      0087C3                       1667 BLANK:
      0087C3 1D 00 02         [ 2] 1668         SUBW X,#2
      0087C6 90 AE 00 20      [ 2] 1669 	LDW Y,#32
      0087CA FF               [ 2] 1670         LDW (X),Y
      0087CB 81               [ 4] 1671         RET
                                   1672 
                                   1673 ;         0     ( -- 0)
                                   1674 ;         Return 0.
      0087CC 87 C0                 1675         .word      LINK
                           00074E  1676 LINK = . 
      0087CE 01                    1677         .byte       1
      0087CF 30                    1678         .ascii     "0"
      0087D0                       1679 ZERO:
      0087D0 1D 00 02         [ 2] 1680         SUBW X,#2
      0087D3 90 5F            [ 1] 1681 	CLRW Y
      0087D5 FF               [ 2] 1682         LDW (X),Y
      0087D6 81               [ 4] 1683         RET
                                   1684 
                                   1685 ;         1     ( -- 1)
                                   1686 ;         Return 1.
      0087D7 87 CE                 1687         .word      LINK
                           000759  1688 LINK = . 
      0087D9 01                    1689         .byte       1
      0087DA 31                    1690         .ascii     "1"
      0087DB                       1691 ONE:
      0087DB 1D 00 02         [ 2] 1692         SUBW X,#2
      0087DE 90 AE 00 01      [ 2] 1693 	LDW Y,#1
      0087E2 FF               [ 2] 1694         LDW (X),Y
      0087E3 81               [ 4] 1695         RET
                                   1696 
                                   1697 ;         -1    ( -- -1)
                                   1698 ;         Return 32,  blank character.
      0087E4 87 D9                 1699         .word      LINK
                           000766  1700 LINK = . 
      0087E6 02                    1701         .byte       2
      0087E7 2D 31                 1702         .ascii     "-1"
      0087E9                       1703 MONE:
      0087E9 1D 00 02         [ 2] 1704         SUBW X,#2
      0087EC 90 AE FF FF      [ 2] 1705 	LDW Y,#0xFFFF
      0087F0 FF               [ 2] 1706         LDW (X),Y
      0087F1 81               [ 4] 1707         RET
                                   1708 
                                   1709 ;       >CHAR   ( c -- c )
                                   1710 ;       Filter non-printing characters.
      0087F2 87 E6                 1711         .word      LINK
                           000774  1712 LINK = . 
      0087F4 05                    1713         .byte      5
      0087F5 3E 43 48 41 52        1714         .ascii     ">CHAR"
      0087FA                       1715 TCHAR:
                           000001  1716 .if CONVERT_TO_CODE
      0087FA E6 01            [ 1] 1717         ld a,(1,x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



      0087FC A1 20            [ 1] 1718         cp a,#32  
      0087FE 2B 05            [ 1] 1719         jrmi 1$ 
      008800 A1 7F            [ 1] 1720         cp a,#127 
      008802 2A 01            [ 1] 1721         jrpl 1$ 
      008804 81               [ 4] 1722         ret 
      008805 A6 5F            [ 1] 1723 1$:     ld a,#'_ 
      008807 E7 01            [ 1] 1724         ld (1,x),a 
      008809 81               [ 4] 1725         ret 
                           000000  1726 .else
                                   1727         CALL     DOLIT
                                   1728         .word       0x7F
                                   1729         CALL     ANDD
                                   1730         CALL     DUPP    ;mask msb
                                   1731         CALL     DOLIT
                                   1732         .word      127
                                   1733         CALL     BLANK
                                   1734         CALL     WITHI   ;check for printable
                                   1735         CALL     QBRAN
                                   1736         .word    TCHA1
                                   1737         CALL     DROP
                                   1738         CALL     DOLIT
                                   1739         .word     0x5F		; "_"     ;replace non-printables
                                   1740 .endif 
      00880A 81               [ 4] 1741 TCHA1:  RET
                                   1742 
                                   1743 ;       DEPTH   ( -- n )
                                   1744 ;       Return  depth of  data stack.
      00880B 87 F4                 1745         .word      LINK
                           00078D  1746 LINK = . 
      00880D 05                    1747         .byte      5
      00880E 44 45 50 54 48        1748         .ascii     "DEPTH"
      008813                       1749 DEPTH: 
      008813 90 BE 26         [ 2] 1750         LDW Y,SP0    ;save data stack ptr
      008816 BF 1E            [ 2] 1751 	LDW XTEMP,X
      008818 72 B2 00 1E      [ 2] 1752         SUBW Y,XTEMP     ;#bytes = SP0 - X
      00881C 90 57            [ 2] 1753         SRAW Y    ;Y = #stack items
                           000001  1754 .if PICATOUT_MOD
                                   1755 ; why ? 
                                   1756 ;      	DECW Y
                                   1757 .endif 
      00881E 1D 00 02         [ 2] 1758 	SUBW X,#2
      008821 FF               [ 2] 1759         LDW (X),Y     ; if neg, underflow
      008822 81               [ 4] 1760         RET
                                   1761 
                                   1762 ;       PICK    ( ... +n -- ... w )
                                   1763 ;       Copy  nth stack item to tos.
      008823 88 0D                 1764         .word      LINK
                           0007A5  1765 LINK = . 
      008825 04                    1766         .byte      4
      008826 50 49 43 4B           1767         .ascii     "PICK"
      00882A                       1768 PICK:
      00882A 90 93            [ 1] 1769         LDW Y,X   ;D = n1
      00882C 90 FE            [ 2] 1770         LDW Y,(Y)
      00882E 90 58            [ 2] 1771         SLAW Y
      008830 BF 1E            [ 2] 1772         LDW XTEMP,X
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



      008832 72 B9 00 1E      [ 2] 1773         ADDW Y,XTEMP
      008836 90 FE            [ 2] 1774         LDW Y,(Y)
      008838 FF               [ 2] 1775         LDW (X),Y
      008839 81               [ 4] 1776         RET
                                   1777 
                                   1778 ;; Memory access
                                   1779 
                                   1780 ;       +!      ( n a -- )
                                   1781 ;       Add n to  contents at address a.
      00883A 88 25                 1782         .word      LINK
                           0007BC  1783 LINK = . 
      00883C 02                    1784         .byte      2
      00883D 2B 21                 1785         .ascii     "+!"
      00883F                       1786 PSTOR:
                           000001  1787 .if CONVERT_TO_CODE
      00883F 90 93            [ 1] 1788         ldw y,x 
      008841 90 FE            [ 2] 1789         ldw y,(y)
      008843 90 BF 20         [ 2] 1790         ldw YTEMP,y  ; address
      008846 90 FE            [ 2] 1791         ldw y,(y)  
      008848 90 89            [ 2] 1792         pushw y  ; value at address 
      00884A 90 93            [ 1] 1793         ldw y,x 
      00884C 90 EE 02         [ 2] 1794         ldw y,(2,y) ; n 
      00884F 72 F9 01         [ 2] 1795         addw y,(1,sp) ; n+value
      008852 91 CF 20         [ 5] 1796         ldw [YTEMP],y ;  a!
      008855 90 85            [ 2] 1797         popw y    ;drop local var
      008857 1C 00 04         [ 2] 1798         addw x,#4 ; DDROP 
      00885A 81               [ 4] 1799         ret 
                           000000  1800 .else
                                   1801         CALL	SWAPP
                                   1802         CALL	OVER
                                   1803         CALL	AT
                                   1804         CALL	PLUS
                                   1805         CALL	SWAPP
                                   1806         JP	STORE
                                   1807 .endif 
                                   1808 
                                   1809 ;       2!      ( d a -- )
                                   1810 ;       Store  double integer to address a.
      00885B 88 3C                 1811         .word      LINK
                           0007DD  1812 LINK = . 
      00885D 02                    1813         .byte      2
      00885E 32 21                 1814         .ascii     "2!"
      008860                       1815 DSTOR:
                           000001  1816 .if CONVERT_TO_CODE
      008860 90 93            [ 1] 1817         ldw y,x 
      008862 90 FE            [ 2] 1818         ldw y,(y)
      008864 90 BF 20         [ 2] 1819         ldw YTEMP,y ; address 
      008867 1C 00 02         [ 2] 1820         addw x,#CELLL ; drop a 
      00886A 90 93            [ 1] 1821         ldw y,x 
      00886C 90 FE            [ 2] 1822         ldw y,(y) ; hi word 
      00886E 89               [ 2] 1823         pushw x 
      00886F EE 02            [ 2] 1824         ldw x,(2,x) ; lo word 
      008871 91 CF 20         [ 5] 1825         ldw [YTEMP],y
      008874 90 93            [ 1] 1826         ldw y,x 
      008876 AE 00 02         [ 2] 1827         ldw x,#2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



      008879 92 DF 20         [ 5] 1828         ldw ([YTEMP],x),y 
      00887C 85               [ 2] 1829         popw x 
      00887D 1C 00 04         [ 2] 1830         addw x,#4 ; DDROP 
      008880 81               [ 4] 1831         ret 
                           000000  1832 .else
                                   1833         CALL	SWAPP
                                   1834         CALL	OVER
                                   1835         CALL	STORE
                                   1836         CALL	CELLP
                                   1837         JP	STORE
                                   1838 .endif 
                                   1839 ;       2@      ( a -- d )
                                   1840 ;       Fetch double integer from address a.
      008881 88 5D                 1841         .word      LINK
                           000803  1842 LINK = . 
      008883 02                    1843         .byte      2
      008884 32 40                 1844         .ascii     "2@"
      008886                       1845 DAT:
                           000001  1846 .if CONVERT_TO_CODE
      008886 90 93            [ 1] 1847         ldw y,x 
      008888 90 FE            [ 2] 1848         ldw y,(y) ;address 
      00888A 90 BF 20         [ 2] 1849         ldw YTEMP,y 
      00888D 1D 00 02         [ 2] 1850         subw x,#CELLL ; space for udh 
      008890 91 CE 20         [ 5] 1851         ldw y,[YTEMP] ; udh 
      008893 FF               [ 2] 1852         ldw (x),y 
      008894 90 AE 00 02      [ 2] 1853         ldw y,#2
      008898 91 DE 20         [ 5] 1854         ldw y,([YTEMP],y) ; udl 
      00889B EF 02            [ 2] 1855         ldw (2,x),y
      00889D 81               [ 4] 1856         ret 
                           000000  1857 .else 
                                   1858         CALL	DUPP
                                   1859         CALL	CELLP
                                   1860         CALL	AT
                                   1861         CALL	SWAPP
                                   1862         JP	AT
                                   1863 .endif 
                                   1864 
                                   1865 ;       COUNT   ( b -- b +n )
                                   1866 ;       Return count byte of a string
                                   1867 ;       and add 1 to byte address.
      00889E 88 83                 1868         .word      LINK
                           000820  1869 LINK = . 
      0088A0 05                    1870         .byte      5
      0088A1 43 4F 55 4E 54        1871         .ascii     "COUNT"
      0088A6                       1872 COUNT:
                           000001  1873 .if CONVERT_TO_CODE
      0088A6 90 93            [ 1] 1874         ldw y,x 
      0088A8 90 FE            [ 2] 1875         ldw y,(y) ; address 
      0088AA 90 F6            [ 1] 1876         ld a,(y)  ; count 
      0088AC 90 5C            [ 2] 1877         incw y 
      0088AE FF               [ 2] 1878         ldw (x),y 
      0088AF 1D 00 02         [ 2] 1879         subw x,#CELLL 
      0088B2 E7 01            [ 1] 1880         ld (1,x),a 
      0088B4 7F               [ 1] 1881         clr (x)
      0088B5 81               [ 4] 1882         ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



                           000000  1883 .else 
                                   1884         CALL     DUPP
                                   1885         CALL     ONEP
                                   1886         CALL     SWAPP
                                   1887         JP     CAT
                                   1888 .endif 
                                   1889 
                                   1890 ;       HERE    ( -- a )
                                   1891 ;       Return  top of  variables
      0088B6 88 A0                 1892         .word      LINK
                           000838  1893 LINK = . 
      0088B8 04                    1894         .byte      4
      0088B9 48 45 52 45           1895         .ascii     "HERE"
      0088BD                       1896 HERE:
                           000001  1897 .if CONVERT_TO_CODE
      0088BD 90 AE 00 16      [ 2] 1898       	ldw y,#UVP 
      0088C1 90 FE            [ 2] 1899         ldw y,(y)
      0088C3 1D 00 02         [ 2] 1900         subw x,#CELLL 
      0088C6 FF               [ 2] 1901         ldw (x),y 
      0088C7 81               [ 4] 1902         ret 
                           000000  1903 .else
                                   1904         CALL     VPP
                                   1905         JP     AT
                                   1906 .endif 
                                   1907 
                                   1908 ;       PAD     ( -- a )
                                   1909 ;       Return address of text buffer
                                   1910 ;       above  code dictionary.
      0088C8 88 B8                 1911         .word      LINK
                           00084A  1912 LINK = . 
      0088CA 03                    1913         .byte      3
      0088CB 50 41 44              1914         .ascii     "PAD"
      0088CE                       1915 PAD:
      0088CE CD 88 BD         [ 4] 1916         CALL     HERE
      0088D1 CD 81 B8         [ 4] 1917         CALL     DOLIT
      0088D4 00 50                 1918         .word      80
      0088D6 CC 84 BD         [ 2] 1919         JP     PLUS
                                   1920 
                                   1921 ;       TIB     ( -- a )
                                   1922 ;       Return address of terminal input buffer.
      0088D9 88 CA                 1923         .word      LINK
                           00085B  1924 LINK = . 
      0088DB 03                    1925         .byte      3
      0088DC 54 49 42              1926         .ascii     "TIB"
      0088DF                       1927 TIB:
      0088DF CD 83 D2         [ 4] 1928         CALL     NTIB
      0088E2 CD 87 71         [ 4] 1929         CALL     CELLP
      0088E5 CC 82 40         [ 2] 1930         JP     AT
                                   1931 
                                   1932 ;       @EXECUTE        ( a -- )
                                   1933 ;       Execute vector stored in address a.
      0088E8 88 DB                 1934         .word      LINK
                           00086A  1935 LINK = . 
      0088EA 08                    1936         .byte      8
      0088EB 40 45 58 45 43 55 54  1937         .ascii     "@EXECUTE"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal  45-Bits]



             45
      0088F3                       1938 ATEXE:
      0088F3 CD 82 40         [ 4] 1939         CALL     AT
      0088F6 CD 84 6C         [ 4] 1940         CALL     QDUP    ;?address or zero
      0088F9 CD 81 EB         [ 4] 1941         CALL     QBRAN
      0088FC 89 01                 1942         .word      EXE1
      0088FE CD 82 12         [ 4] 1943         CALL     EXECU   ;execute if non-zero
      008901 81               [ 4] 1944 EXE1:   RET     ;do nothing if zero
                                   1945 
                                   1946 ;       CMOVE   ( b1 b2 u -- )
                                   1947 ;       Copy u bytes from b1 to b2.
      008902 88 EA                 1948         .word      LINK
                           000884  1949 LINK = . 
      008904 05                    1950         .byte      5
      008905 43 4D 4F 56 45        1951         .ascii     "CMOVE"
      00890A                       1952 CMOVE:
      00890A CD 82 B0         [ 4] 1953         CALL	TOR
      00890D CD 82 02         [ 4] 1954         CALL	BRAN
      008910 89 2A                 1955         .word	CMOV2
      008912 CD 82 B0         [ 4] 1956 CMOV1:	CALL	TOR
      008915 CD 82 E7         [ 4] 1957         CALL	DUPP
      008918 CD 82 5E         [ 4] 1958         CALL	CAT
      00891B CD 82 A4         [ 4] 1959         CALL	RAT
      00891E CD 82 4D         [ 4] 1960         CALL	CSTOR
      008921 CD 87 9C         [ 4] 1961         CALL	ONEP
      008924 CD 82 91         [ 4] 1962         CALL	RFROM
      008927 CD 87 9C         [ 4] 1963         CALL	ONEP
      00892A CD 81 CC         [ 4] 1964 CMOV2:	CALL	DONXT
      00892D 89 12                 1965         .word	CMOV1
      00892F CC 84 9D         [ 2] 1966         JP	DDROP
                                   1967 
                                   1968 ;       FILL    ( b u c -- )
                                   1969 ;       Fill u bytes of character c
                                   1970 ;       to area beginning at b.
      008932 89 04                 1971         .word       LINK
                           0008B4  1972 LINK = . 
      008934 04                    1973         .byte       4
      008935 46 49 4C 4C           1974         .ascii     "FILL"
      008939                       1975 FILL:
                           000001  1976 .if CONVERT_TO_CODE
      008939 90 93            [ 1] 1977         ldw y,x 
      00893B 90 E6 01         [ 1] 1978         ld a,(1,y) ; c 
      00893E 1C 00 02         [ 2] 1979         addw x,#CELLL ; drop c 
      008941 90 93            [ 1] 1980         ldw y,x 
      008943 90 FE            [ 2] 1981         ldw y,(y) ; count
      008945 90 89            [ 2] 1982         pushw y 
      008947 1C 00 02         [ 2] 1983         addw x,#CELLL ; drop u 
      00894A 90 93            [ 1] 1984         ldw y,x 
      00894C 1C 00 02         [ 2] 1985         addw x,#CELLL ; drop b 
      00894F 90 FE            [ 2] 1986         ldw y,(y) ; address
      008951 90 BF 20         [ 2] 1987         ldw YTEMP,y
      008954 90 85            [ 2] 1988         popw y ; count 
      008956                       1989 FILL1:  
      008956 92 C7 20         [ 4] 1990         ld [YTEMP],a 
      008959 3C 21            [ 1] 1991         inc YTEMP+1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



      00895B 24 02            [ 1] 1992         jrnc FILL2 
      00895D 3C 20            [ 1] 1993         inc YTEMP
      00895F                       1994 FILL2: 
      00895F 90 5A            [ 2] 1995         decw y ; count 
      008961 26 F3            [ 1] 1996         jrne FILL1  
      008963 81               [ 4] 1997         ret 
                           000000  1998 .else 
                                   1999         CALL	SWAPP
                                   2000         CALL	TOR
                                   2001         CALL	SWAPP
                                   2002         CALL	BRAN
                                   2003         .word	FILL2
                                   2004 FILL1:	CALL	DDUP
                                   2005         CALL	CSTOR
                                   2006         CALL	ONEP
                                   2007 FILL2:	CALL	DONXT
                                   2008         .word	FILL1
                                   2009         JP	DDROP
                                   2010 .endif
                                   2011 
                                   2012 ;       ERASE   ( b u -- )
                                   2013 ;       Erase u bytes beginning at b.
      008964 89 34                 2014         .word      LINK
                           0008E6  2015 LINK = . 
      008966 05                    2016         .byte      5
      008967 45 52 41 53 45        2017         .ascii     "ERASE"
      00896C                       2018 ERASE:
                           000001  2019 .if CONVERT_TO_CODE
      00896C 90 5F            [ 1] 2020         clrw y 
      00896E 1D 00 02         [ 2] 2021         subw x,#CELLL 
      008971 FF               [ 2] 2022         ldw (x),y 
      008972 CC 89 39         [ 2] 2023         jp FILL 
                           000000  2024 .else 
                                   2025         CALL     ZERO
                                   2026         JP     FILL
                                   2027 .endif 
                                   2028 ;       PACK0x   ( b u a -- a )
                                   2029 ;       Build a counted string with
                                   2030 ;       u characters from b. Null fill.
      008975 89 66                 2031         .word      LINK
                           0008F7  2032 LINK = . 
      008977 05                    2033         .byte      5
      008978 50 41 43 4B 30 58     2034         .ascii     "PACK0X"
      00897E                       2035 PACKS:
      00897E CD 82 E7         [ 4] 2036         CALL     DUPP
      008981 CD 82 B0         [ 4] 2037         CALL     TOR     ;strings only on cell boundary
      008984 CD 84 A8         [ 4] 2038         CALL     DDUP
      008987 CD 82 4D         [ 4] 2039         CALL     CSTOR
      00898A CD 87 9C         [ 4] 2040         CALL     ONEP ;save count
      00898D CD 82 F7         [ 4] 2041         CALL     SWAPP
      008990 CD 89 0A         [ 4] 2042         CALL     CMOVE
      008993 CD 82 91         [ 4] 2043         CALL     RFROM
      008996 81               [ 4] 2044         RET
                                   2045 
                                   2046 ;; Numeric output, single precision
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



                                   2047 
                                   2048 ;       DIGIT   ( u -- c )
                                   2049 ;       Convert digit u to a character.
      008997 89 77                 2050         .word      LINK
                           000919  2051 LINK = . 
      008999 05                    2052         .byte      5
      00899A 44 49 47 49 54        2053         .ascii     "DIGIT"
      00899F                       2054 DIGIT:
      00899F CD 81 B8         [ 4] 2055         CALL	DOLIT
      0089A2 00 09                 2056         .word	9
      0089A4 CD 83 11         [ 4] 2057         CALL	OVER
      0089A7 CD 85 80         [ 4] 2058         CALL	LESS
      0089AA CD 81 B8         [ 4] 2059         CALL	DOLIT
      0089AD 00 07                 2060         .word	7
      0089AF CD 83 33         [ 4] 2061         CALL	ANDD
      0089B2 CD 84 BD         [ 4] 2062         CALL	PLUS
      0089B5 CD 81 B8         [ 4] 2063         CALL	DOLIT
      0089B8 00 30                 2064         .word	48	;'0'
      0089BA CC 84 BD         [ 2] 2065         JP	PLUS
                                   2066 
                                   2067 ;       EXTRACT ( n base -- n c )
                                   2068 ;       Extract least significant digit from n.
      0089BD 89 99                 2069         .word      LINK
                           00093F  2070 LINK = . 
      0089BF 07                    2071         .byte      7
      0089C0 45 58 54 52 41 43 54  2072         .ascii     "EXTRACT"
      0089C7                       2073 EXTRC:
      0089C7 CD 87 D0         [ 4] 2074         CALL     ZERO
      0089CA CD 82 F7         [ 4] 2075         CALL     SWAPP
      0089CD CD 85 F8         [ 4] 2076         CALL     UMMOD
      0089D0 CD 82 F7         [ 4] 2077         CALL     SWAPP
      0089D3 CC 89 9F         [ 2] 2078         JP     DIGIT
                                   2079 
                                   2080 ;       <#      ( -- )
                                   2081 ;       Initiate  numeric output process.
      0089D6 89 BF                 2082         .word      LINK
                           000958  2083 LINK = . 
      0089D8 02                    2084         .byte      2
      0089D9 3C 23                 2085         .ascii     "<#"
      0089DB                       2086 BDIGS:
      0089DB CD 88 CE         [ 4] 2087         CALL     PAD
      0089DE CD 84 02         [ 4] 2088         CALL     HLD
      0089E1 CC 82 29         [ 2] 2089         JP     STORE
                                   2090 
                                   2091 ;       HOLD    ( c -- )
                                   2092 ;       Insert a character into output string.
      0089E4 89 D8                 2093         .word      LINK
                           000966  2094 LINK = . 
      0089E6 04                    2095         .byte      4
      0089E7 48 4F 4C 44           2096         .ascii     "HOLD"
      0089EB                       2097 HOLD:
      0089EB CD 84 02         [ 4] 2098         CALL     HLD
      0089EE CD 82 40         [ 4] 2099         CALL     AT
      0089F1 CD 87 A9         [ 4] 2100         CALL     ONEM
      0089F4 CD 82 E7         [ 4] 2101         CALL     DUPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



      0089F7 CD 84 02         [ 4] 2102         CALL     HLD
      0089FA CD 82 29         [ 4] 2103         CALL     STORE
      0089FD CC 82 4D         [ 2] 2104         JP     CSTOR
                                   2105 
                                   2106 ;       #       ( u -- u )
                                   2107 ;       Extract one digit from u and
                                   2108 ;       append digit to output string.
      008A00 89 E6                 2109         .word      LINK
                           000982  2110 LINK = . 
      008A02 01                    2111         .byte      1
      008A03 23                    2112         .ascii     "#"
      008A04                       2113 DIG:
      008A04 CD 83 A4         [ 4] 2114         CALL     BASE
      008A07 CD 82 40         [ 4] 2115         CALL     AT
      008A0A CD 89 C7         [ 4] 2116         CALL     EXTRC
      008A0D CC 89 EB         [ 2] 2117         JP     HOLD
                                   2118 
                                   2119 ;       #S      ( u -- 0 )
                                   2120 ;       Convert u until all digits
                                   2121 ;       are added to output string.
      008A10 8A 02                 2122         .word      LINK
                           000992  2123 LINK = . 
      008A12 02                    2124         .byte      2
      008A13 23 53                 2125         .ascii     "#S"
      008A15                       2126 DIGS:
      008A15 CD 8A 04         [ 4] 2127 DIGS1:  CALL     DIG
      008A18 CD 82 E7         [ 4] 2128         CALL     DUPP
      008A1B CD 81 EB         [ 4] 2129         CALL     QBRAN
      008A1E 8A 22                 2130         .word      DIGS2
      008A20 20 F3            [ 2] 2131         JRA     DIGS1
      008A22 81               [ 4] 2132 DIGS2:  RET
                                   2133 
                                   2134 ;       SIGN    ( n -- )
                                   2135 ;       Add a minus sign to
                                   2136 ;       numeric output string.
      008A23 8A 12                 2137         .word      LINK
                           0009A5  2138 LINK = . 
      008A25 04                    2139         .byte      4
      008A26 53 49 47 4E           2140         .ascii     "SIGN"
      008A2A                       2141 SIGN:
      008A2A CD 83 20         [ 4] 2142         CALL     ZLESS
      008A2D CD 81 EB         [ 4] 2143         CALL     QBRAN
      008A30 8A 3A                 2144         .word      SIGN1
      008A32 CD 81 B8         [ 4] 2145         CALL     DOLIT
      008A35 00 2D                 2146         .word      45	;"-"
      008A37 CC 89 EB         [ 2] 2147         JP     HOLD
      008A3A 81               [ 4] 2148 SIGN1:  RET
                                   2149 
                                   2150 ;       #>      ( w -- b u )
                                   2151 ;       Prepare output string.
      008A3B 8A 25                 2152         .word      LINK
                           0009BD  2153 LINK = . 
      008A3D 02                    2154         .byte      2
      008A3E 23 3E                 2155         .ascii     "#>"
      008A40                       2156 EDIGS:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



      008A40 CD 82 DD         [ 4] 2157         CALL     DROP
      008A43 CD 84 02         [ 4] 2158         CALL     HLD
      008A46 CD 82 40         [ 4] 2159         CALL     AT
      008A49 CD 88 CE         [ 4] 2160         CALL     PAD
      008A4C CD 83 11         [ 4] 2161         CALL     OVER
      008A4F CC 85 1B         [ 2] 2162         JP     SUBB
                                   2163 
                                   2164 ;       str     ( w -- b u )
                                   2165 ;       Convert a signed integer
                                   2166 ;       to a numeric string.
      008A52 8A 3D                 2167         .word      LINK
                           0009D4  2168 LINK = . 
      008A54 03                    2169         .byte      3
      008A55 53 54 52              2170         .ascii     "STR"
      008A58                       2171 STR:
      008A58 CD 82 E7         [ 4] 2172         CALL     DUPP
      008A5B CD 82 B0         [ 4] 2173         CALL     TOR
      008A5E CD 85 35         [ 4] 2174         CALL     ABSS
      008A61 CD 89 DB         [ 4] 2175         CALL     BDIGS
      008A64 CD 8A 15         [ 4] 2176         CALL     DIGS
      008A67 CD 82 91         [ 4] 2177         CALL     RFROM
      008A6A CD 8A 2A         [ 4] 2178         CALL     SIGN
      008A6D CC 8A 40         [ 2] 2179         JP     EDIGS
                                   2180 
                                   2181 ;       HEX     ( -- )
                                   2182 ;       Use radix 16 as base for
                                   2183 ;       numeric conversions.
      008A70 8A 54                 2184         .word      LINK
                           0009F2  2185 LINK = . 
      008A72 03                    2186         .byte      3
      008A73 48 45 58              2187         .ascii     "HEX"
      008A76                       2188 HEX:
      008A76 CD 81 B8         [ 4] 2189         CALL     DOLIT
      008A79 00 10                 2190         .word      16
      008A7B CD 83 A4         [ 4] 2191         CALL     BASE
      008A7E CC 82 29         [ 2] 2192         JP     STORE
                                   2193 
                                   2194 ;       DECIMAL ( -- )
                                   2195 ;       Use radix 10 as base
                                   2196 ;       for numeric conversions.
      008A81 8A 72                 2197         .word      LINK
                           000A03  2198 LINK = . 
      008A83 07                    2199         .byte      7
      008A84 44 45 43 49 4D 41 4C  2200         .ascii     "DECIMAL"
      008A8B                       2201 DECIM:
      008A8B CD 81 B8         [ 4] 2202         CALL     DOLIT
      008A8E 00 0A                 2203         .word      10
      008A90 CD 83 A4         [ 4] 2204         CALL     BASE
      008A93 CC 82 29         [ 2] 2205         JP     STORE
                                   2206 
                                   2207 ;; Numeric input, single precision
                                   2208 
                                   2209 ;       DIGIT?  ( c base -- u t )
                                   2210 ;       Convert a character to its numeric
                                   2211 ;       value. A flag indicates success.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



      008A96 8A 83                 2212         .word      LINK
                           000A18  2213 LINK = . 
      008A98 06                    2214         .byte       6
      008A99 44 49 47 49 54 3F     2215         .ascii     "DIGIT?"
      008A9F                       2216 DIGTQ:
      008A9F CD 82 B0         [ 4] 2217         CALL     TOR
      008AA2 CD 81 B8         [ 4] 2218         CALL     DOLIT
      008AA5 00 30                 2219         .word     48	; "0"
      008AA7 CD 85 1B         [ 4] 2220         CALL     SUBB
      008AAA CD 81 B8         [ 4] 2221         CALL     DOLIT
      008AAD 00 09                 2222         .word      9
      008AAF CD 83 11         [ 4] 2223         CALL     OVER
      008AB2 CD 85 80         [ 4] 2224         CALL     LESS
      008AB5 CD 81 EB         [ 4] 2225         CALL     QBRAN
      008AB8 8A D0                 2226         .word      DGTQ1
      008ABA CD 81 B8         [ 4] 2227         CALL     DOLIT
      008ABD 00 07                 2228         .word      7
      008ABF CD 85 1B         [ 4] 2229         CALL     SUBB
      008AC2 CD 82 E7         [ 4] 2230         CALL     DUPP
      008AC5 CD 81 B8         [ 4] 2231         CALL     DOLIT
      008AC8 00 0A                 2232         .word      10
      008ACA CD 85 80         [ 4] 2233         CALL     LESS
      008ACD CD 83 47         [ 4] 2234         CALL     ORR
      008AD0 CD 82 E7         [ 4] 2235 DGTQ1:  CALL     DUPP
      008AD3 CD 82 91         [ 4] 2236         CALL     RFROM
      008AD6 CC 85 62         [ 2] 2237         JP     ULESS
                                   2238 
                                   2239 ;       NUMBER? ( a -- n T | a F )
                                   2240 ;       Convert a number string to
                                   2241 ;       integer. Push a flag on tos.
      008AD9 8A 98                 2242         .word      LINK
                           000A5B  2243 LINK = . 
      008ADB 07                    2244         .byte      7
      008ADC 4E 55 4D 42 45 52 3F  2245         .ascii     "NUMBER?"
      008AE3                       2246 NUMBQ:
      008AE3 CD 83 A4         [ 4] 2247         CALL     BASE
      008AE6 CD 82 40         [ 4] 2248         CALL     AT
      008AE9 CD 82 B0         [ 4] 2249         CALL     TOR
      008AEC CD 87 D0         [ 4] 2250         CALL     ZERO
      008AEF CD 83 11         [ 4] 2251         CALL     OVER
      008AF2 CD 88 A6         [ 4] 2252         CALL     COUNT
      008AF5 CD 83 11         [ 4] 2253         CALL     OVER
      008AF8 CD 82 5E         [ 4] 2254         CALL     CAT
      008AFB CD 81 B8         [ 4] 2255         CALL     DOLIT
      008AFE 00 24                 2256         .word     36	; "0x"
      008B00 CD 85 43         [ 4] 2257         CALL     EQUAL
      008B03 CD 81 EB         [ 4] 2258         CALL     QBRAN
      008B06 8B 17                 2259         .word      NUMQ1
      008B08 CD 8A 76         [ 4] 2260         CALL     HEX
      008B0B CD 82 F7         [ 4] 2261         CALL     SWAPP
      008B0E CD 87 9C         [ 4] 2262         CALL     ONEP
      008B11 CD 82 F7         [ 4] 2263         CALL     SWAPP
      008B14 CD 87 A9         [ 4] 2264         CALL     ONEM
      008B17 CD 83 11         [ 4] 2265 NUMQ1:  CALL     OVER
      008B1A CD 82 5E         [ 4] 2266         CALL     CAT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



      008B1D CD 81 B8         [ 4] 2267         CALL     DOLIT
      008B20 00 2D                 2268         .word     45	; "-"
      008B22 CD 85 43         [ 4] 2269         CALL     EQUAL
      008B25 CD 82 B0         [ 4] 2270         CALL     TOR
      008B28 CD 82 F7         [ 4] 2271         CALL     SWAPP
      008B2B CD 82 A4         [ 4] 2272         CALL     RAT
      008B2E CD 85 1B         [ 4] 2273         CALL     SUBB
      008B31 CD 82 F7         [ 4] 2274         CALL     SWAPP
      008B34 CD 82 A4         [ 4] 2275         CALL     RAT
      008B37 CD 84 BD         [ 4] 2276         CALL     PLUS
      008B3A CD 84 6C         [ 4] 2277         CALL     QDUP
      008B3D CD 81 EB         [ 4] 2278         CALL     QBRAN
      008B40 8B A1                 2279         .word      NUMQ6
      008B42 CD 87 A9         [ 4] 2280         CALL     ONEM
      008B45 CD 82 B0         [ 4] 2281         CALL     TOR
      008B48 CD 82 E7         [ 4] 2282 NUMQ2:  CALL     DUPP
      008B4B CD 82 B0         [ 4] 2283         CALL     TOR
      008B4E CD 82 5E         [ 4] 2284         CALL     CAT
      008B51 CD 83 A4         [ 4] 2285         CALL     BASE
      008B54 CD 82 40         [ 4] 2286         CALL     AT
      008B57 CD 8A 9F         [ 4] 2287         CALL     DIGTQ
      008B5A CD 81 EB         [ 4] 2288         CALL     QBRAN
      008B5D 8B 8F                 2289         .word      NUMQ4
      008B5F CD 82 F7         [ 4] 2290         CALL     SWAPP
      008B62 CD 83 A4         [ 4] 2291         CALL     BASE
      008B65 CD 82 40         [ 4] 2292         CALL     AT
      008B68 CD 87 1B         [ 4] 2293         CALL     STAR
      008B6B CD 84 BD         [ 4] 2294         CALL     PLUS
      008B6E CD 82 91         [ 4] 2295         CALL     RFROM
      008B71 CD 87 9C         [ 4] 2296         CALL     ONEP
      008B74 CD 81 CC         [ 4] 2297         CALL     DONXT
      008B77 8B 48                 2298         .word      NUMQ2
      008B79 CD 82 A4         [ 4] 2299         CALL     RAT
      008B7C CD 82 F7         [ 4] 2300         CALL     SWAPP
      008B7F CD 82 DD         [ 4] 2301         CALL     DROP
      008B82 CD 81 EB         [ 4] 2302         CALL     QBRAN
      008B85 8B 8A                 2303         .word      NUMQ3
      008B87 CD 84 E8         [ 4] 2304         CALL     NEGAT
      008B8A CD 82 F7         [ 4] 2305 NUMQ3:  CALL     SWAPP
      008B8D 20 0F            [ 2] 2306         JRA     NUMQ5
      008B8F CD 82 91         [ 4] 2307 NUMQ4:  CALL     RFROM
      008B92 CD 82 91         [ 4] 2308         CALL     RFROM
      008B95 CD 84 9D         [ 4] 2309         CALL     DDROP
      008B98 CD 84 9D         [ 4] 2310         CALL     DDROP
      008B9B CD 87 D0         [ 4] 2311         CALL     ZERO
      008B9E CD 82 E7         [ 4] 2312 NUMQ5:  CALL     DUPP
      008BA1 CD 82 91         [ 4] 2313 NUMQ6:  CALL     RFROM
      008BA4 CD 84 9D         [ 4] 2314         CALL     DDROP
      008BA7 CD 82 91         [ 4] 2315         CALL     RFROM
      008BAA CD 83 A4         [ 4] 2316         CALL     BASE
      008BAD CC 82 29         [ 2] 2317         JP     STORE
                                   2318 
                                   2319 ;; Basic I/O
                                   2320 
                                   2321 ;       KEY     ( -- c )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



                                   2322 ;       Wait for and return an
                                   2323 ;       input character.
      008BB0 8A DB                 2324         .word      LINK
                           000B32  2325 LINK = . 
      008BB2 03                    2326         .byte      3
      008BB3 4B 45 59              2327         .ascii     "KEY"
      008BB6                       2328 KEY:
                           000001  2329 .if CONVERT_TO_CODE
      008BB6 72 0B 52 30 FB   [ 2] 2330         btjf UART1_SR,#UART_SR_RXNE,. 
      008BBB C6 52 31         [ 1] 2331         ld a,UART1_DR 
      008BBE 1D 00 02         [ 2] 2332         subw x,#CELLL 
      008BC1 E7 01            [ 1] 2333         ld (1,x),a 
      008BC3 7F               [ 1] 2334         clr (x)
      008BC4 81               [ 4] 2335         ret 
                           000000  2336 .else 
                                   2337 KEY1:   CALL     QKEY
                                   2338         CALL     QBRAN
                                   2339         .word      KEY1
                                   2340         RET
                                   2341 .endif 
                                   2342 
                                   2343 ;       NUF?    ( -- t )
                                   2344 ;       Return false if no input,
                                   2345 ;       else pause and if CR return true.
      008BC5 8B B2                 2346         .word      LINK
                           000B47  2347 LINK = . 
      008BC7 04                    2348         .byte      4
      008BC8 4E 55 46 3F           2349         .ascii     "NUF?"
      008BCC                       2350 NUFQ:
      008BCC CD 81 84         [ 4] 2351         CALL     QKEY
      008BCF CD 82 E7         [ 4] 2352         CALL     DUPP
      008BD2 CD 81 EB         [ 4] 2353         CALL     QBRAN
      008BD5 8B E5                 2354         .word    NUFQ1
      008BD7 CD 84 9D         [ 4] 2355         CALL     DDROP
      008BDA CD 8B B6         [ 4] 2356         CALL     KEY
      008BDD CD 81 B8         [ 4] 2357         CALL     DOLIT
      008BE0 00 0D                 2358         .word      CRR
      008BE2 CC 85 43         [ 2] 2359         JP     EQUAL
      008BE5 81               [ 4] 2360 NUFQ1:  RET
                                   2361 
                                   2362 ;       SPACE   ( -- )
                                   2363 ;       Send  blank character to
                                   2364 ;       output device.
      008BE6 8B C7                 2365         .word      LINK
                           000B68  2366 LINK = . 
      008BE8 05                    2367         .byte      5
      008BE9 53 50 41 43 45        2368         .ascii     "SPACE"
      008BEE                       2369 SPACE:
      008BEE CD 87 C3         [ 4] 2370         CALL     BLANK
      008BF1 CC 81 A2         [ 2] 2371         JP     EMIT
                                   2372 
                                   2373 ;       SPACES  ( +n -- )
                                   2374 ;       Send n spaces to output device.
      008BF4 8B E8                 2375         .word      LINK
                           000B76  2376 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



      008BF6 06                    2377         .byte      6
      008BF7 53 50 41 43 45 53     2378         .ascii     "SPACES"
      008BFD                       2379 SPACS:
      008BFD CD 87 D0         [ 4] 2380         CALL     ZERO
      008C00 CD 85 A0         [ 4] 2381         CALL     MAX
      008C03 CD 82 B0         [ 4] 2382         CALL     TOR
      008C06 20 03            [ 2] 2383         JRA      CHAR2
      008C08 CD 8B EE         [ 4] 2384 CHAR1:  CALL     SPACE
      008C0B CD 81 CC         [ 4] 2385 CHAR2:  CALL     DONXT
      008C0E 8C 08                 2386         .word    CHAR1
      008C10 81               [ 4] 2387         RET
                                   2388 
                                   2389 ;       TYPE    ( b u -- )
                                   2390 ;       Output u characters from b.
      008C11 8B F6                 2391         .word      LINK
                           000B93  2392 LINK = . 
      008C13 04                    2393         .byte      4
      008C14 54 59 50 45           2394         .ascii     "TYPE"
      008C18                       2395 TYPES:
      008C18 CD 82 B0         [ 4] 2396         CALL     TOR
      008C1B 20 0C            [ 2] 2397         JRA     TYPE2
      008C1D CD 82 E7         [ 4] 2398 TYPE1:  CALL     DUPP
      008C20 CD 82 5E         [ 4] 2399         CALL     CAT
      008C23 CD 81 A2         [ 4] 2400         CALL     EMIT
      008C26 CD 87 9C         [ 4] 2401         CALL     ONEP
      008C29 CD 81 CC         [ 4] 2402 TYPE2:  CALL     DONXT
      008C2C 8C 1D                 2403         .word      TYPE1
      008C2E CC 82 DD         [ 2] 2404         JP     DROP
                                   2405 
                                   2406 ;       CR      ( -- )
                                   2407 ;       Output a carriage return
                                   2408 ;       and a line feed.
      008C31 8C 13                 2409         .word      LINK
                           000BB3  2410 LINK = . 
      008C33 02                    2411         .byte      2
      008C34 43 52                 2412         .ascii     "CR"
      008C36                       2413 CR:
      008C36 CD 81 B8         [ 4] 2414         CALL     DOLIT
      008C39 00 0D                 2415         .word      CRR
      008C3B CD 81 A2         [ 4] 2416         CALL     EMIT
      008C3E CD 81 B8         [ 4] 2417         CALL     DOLIT
      008C41 00 0A                 2418         .word      LF
      008C43 CC 81 A2         [ 2] 2419         JP     EMIT
                                   2420 
                                   2421 ;       do$     ( -- a )
                                   2422 ;       Return  address of a compiled
                                   2423 ;       string.
      008C46 8C 33                 2424         .word      LINK
                           000BC8  2425 LINK = . 
      008C48 43                    2426 	.byte      COMPO+3
      008C49 44 4F 24              2427         .ascii     "DO$"
      008C4C                       2428 DOSTR:
      008C4C CD 82 91         [ 4] 2429         CALL     RFROM
      008C4F CD 82 A4         [ 4] 2430         CALL     RAT
      008C52 CD 82 91         [ 4] 2431         CALL     RFROM
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      008C55 CD 88 A6         [ 4] 2432         CALL     COUNT
      008C58 CD 84 BD         [ 4] 2433         CALL     PLUS
      008C5B CD 82 B0         [ 4] 2434         CALL     TOR
      008C5E CD 82 F7         [ 4] 2435         CALL     SWAPP
      008C61 CD 82 B0         [ 4] 2436         CALL     TOR
      008C64 81               [ 4] 2437         RET
                                   2438 
                                   2439 ;       $"|     ( -- a )
                                   2440 ;       Run time routine compiled by $".
                                   2441 ;       Return address of a compiled string.
      008C65 8C 48                 2442         .word      LINK
                           000BE7  2443 LINK = . 
      008C67 43                    2444 	.byte      COMPO+3
      008C68 24 22 7C              2445         .byte     '$','"','|'
      008C6B                       2446 STRQP:
      008C6B CD 8C 4C         [ 4] 2447         CALL     DOSTR
      008C6E 81               [ 4] 2448         RET
                                   2449 
                                   2450 ;       ."|     ( -- )
                                   2451 ;       Run time routine of ." .
                                   2452 ;       Output a compiled string.
      008C6F 8C 67                 2453         .word      LINK
                           000BF1  2454 LINK = . 
      008C71 43                    2455 	.byte      COMPO+3
      008C72 2E 22 7C              2456         .byte     '.','"','|'
      008C75                       2457 DOTQP:
      008C75 CD 8C 4C         [ 4] 2458         CALL     DOSTR
      008C78 CD 88 A6         [ 4] 2459         CALL     COUNT
      008C7B CC 8C 18         [ 2] 2460         JP     TYPES
                                   2461 
                                   2462 ;       .R      ( n +n -- )
                                   2463 ;       Display an integer in a field
                                   2464 ;       of n columns, right justified.
      008C7E 8C 71                 2465         .word      LINK
                           000C00  2466 LINK = . 
      008C80 02                    2467         .byte      2
      008C81 2E 52                 2468         .ascii     ".R"
      008C83                       2469 DOTR:
      008C83 CD 82 B0         [ 4] 2470         CALL     TOR
      008C86 CD 8A 58         [ 4] 2471         CALL     STR
      008C89 CD 82 91         [ 4] 2472         CALL     RFROM
      008C8C CD 83 11         [ 4] 2473         CALL     OVER
      008C8F CD 85 1B         [ 4] 2474         CALL     SUBB
      008C92 CD 8B FD         [ 4] 2475         CALL     SPACS
      008C95 CC 8C 18         [ 2] 2476         JP     TYPES
                                   2477 
                                   2478 ;       U.R     ( u +n -- )
                                   2479 ;       Display an unsigned integer
                                   2480 ;       in n column, right justified.
      008C98 8C 80                 2481         .word      LINK
                           000C1A  2482 LINK = . 
      008C9A 03                    2483         .byte      3
      008C9B 55 2E 52              2484         .ascii     "U.R"
      008C9E                       2485 UDOTR:
      008C9E CD 82 B0         [ 4] 2486         CALL     TOR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      008CA1 CD 89 DB         [ 4] 2487         CALL     BDIGS
      008CA4 CD 8A 15         [ 4] 2488         CALL     DIGS
      008CA7 CD 8A 40         [ 4] 2489         CALL     EDIGS
      008CAA CD 82 91         [ 4] 2490         CALL     RFROM
      008CAD CD 83 11         [ 4] 2491         CALL     OVER
      008CB0 CD 85 1B         [ 4] 2492         CALL     SUBB
      008CB3 CD 8B FD         [ 4] 2493         CALL     SPACS
      008CB6 CC 8C 18         [ 2] 2494         JP     TYPES
                                   2495 
                                   2496 ;       U.      ( u -- )
                                   2497 ;       Display an unsigned integer
                                   2498 ;       in free format.
      008CB9 8C 9A                 2499         .word      LINK
                           000C3B  2500 LINK = . 
      008CBB 02                    2501         .byte      2
      008CBC 55 2E                 2502         .ascii     "U."
      008CBE                       2503 UDOT:
      008CBE CD 89 DB         [ 4] 2504         CALL     BDIGS
      008CC1 CD 8A 15         [ 4] 2505         CALL     DIGS
      008CC4 CD 8A 40         [ 4] 2506         CALL     EDIGS
      008CC7 CD 8B EE         [ 4] 2507         CALL     SPACE
      008CCA CC 8C 18         [ 2] 2508         JP     TYPES
                                   2509 
                                   2510 ;       .       ( w -- )
                                   2511 ;       Display an integer in free
                                   2512 ;       format, preceeded by a space.
      008CCD 8C BB                 2513         .word      LINK
                           000C4F  2514 LINK = . 
      008CCF 01                    2515         .byte      1
      008CD0 2E                    2516         .ascii     "."
      008CD1                       2517 DOT:
      008CD1 CD 83 A4         [ 4] 2518         CALL     BASE
      008CD4 CD 82 40         [ 4] 2519         CALL     AT
      008CD7 CD 81 B8         [ 4] 2520         CALL     DOLIT
      008CDA 00 0A                 2521         .word      10
      008CDC CD 83 5C         [ 4] 2522         CALL     XORR    ;?decimal
      008CDF CD 81 EB         [ 4] 2523         CALL     QBRAN
      008CE2 8C E7                 2524         .word      DOT1
      008CE4 CC 8C BE         [ 2] 2525         JP     UDOT
      008CE7 CD 8A 58         [ 4] 2526 DOT1:   CALL     STR
      008CEA CD 8B EE         [ 4] 2527         CALL     SPACE
      008CED CC 8C 18         [ 2] 2528         JP     TYPES
                                   2529 
                                   2530 ;       ?       ( a -- )
                                   2531 ;       Display contents in memory cell.
      008CF0 8C CF                 2532         .word      LINK
                                   2533         
                           000C72  2534 LINK = . 
      008CF2 01                    2535         .byte      1
      008CF3 3F                    2536         .ascii     "?"
      008CF4                       2537 QUEST:
      008CF4 CD 82 40         [ 4] 2538         CALL     AT
      008CF7 CC 8C D1         [ 2] 2539         JP     DOT
                                   2540 
                                   2541 ;; Parsing
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



                                   2542 
                                   2543 ;       parse   ( b u c -- b u delta ; <string> )
                                   2544 ;       Scan string delimited by c.
                                   2545 ;       Return found string and its offset.
      008CFA 8C F2                 2546         .word      LINK
                           000C7C  2547 LINK = . 
      008CFC 05                    2548         .byte      5
      008CFD 70 61 72 73 65        2549         .ascii     "parse"
      008D02                       2550 PARS:
      008D02 CD 83 B3         [ 4] 2551         CALL     TEMP
      008D05 CD 82 29         [ 4] 2552         CALL     STORE
      008D08 CD 83 11         [ 4] 2553         CALL     OVER
      008D0B CD 82 B0         [ 4] 2554         CALL     TOR
      008D0E CD 82 E7         [ 4] 2555         CALL     DUPP
      008D11 CD 81 EB         [ 4] 2556         CALL     QBRAN
      008D14 8D BA                 2557         .word    PARS8
      008D16 CD 87 A9         [ 4] 2558         CALL     ONEM
      008D19 CD 83 B3         [ 4] 2559         CALL     TEMP
      008D1C CD 82 40         [ 4] 2560         CALL     AT
      008D1F CD 87 C3         [ 4] 2561         CALL     BLANK
      008D22 CD 85 43         [ 4] 2562         CALL     EQUAL
      008D25 CD 81 EB         [ 4] 2563         CALL     QBRAN
      008D28 8D 5B                 2564         .word      PARS3
      008D2A CD 82 B0         [ 4] 2565         CALL     TOR
      008D2D CD 87 C3         [ 4] 2566 PARS1:  CALL     BLANK
      008D30 CD 83 11         [ 4] 2567         CALL     OVER
      008D33 CD 82 5E         [ 4] 2568         CALL     CAT     ;skip leading blanks ONLY
      008D36 CD 85 1B         [ 4] 2569         CALL     SUBB
      008D39 CD 83 20         [ 4] 2570         CALL     ZLESS
      008D3C CD 84 D7         [ 4] 2571         CALL     INVER
      008D3F CD 81 EB         [ 4] 2572         CALL     QBRAN
      008D42 8D 58                 2573         .word      PARS2
      008D44 CD 87 9C         [ 4] 2574         CALL     ONEP
      008D47 CD 81 CC         [ 4] 2575         CALL     DONXT
      008D4A 8D 2D                 2576         .word      PARS1
      008D4C CD 82 91         [ 4] 2577         CALL     RFROM
      008D4F CD 82 DD         [ 4] 2578         CALL     DROP
      008D52 CD 87 D0         [ 4] 2579         CALL     ZERO
      008D55 CC 82 E7         [ 2] 2580         JP     DUPP
      008D58 CD 82 91         [ 4] 2581 PARS2:  CALL     RFROM
      008D5B CD 83 11         [ 4] 2582 PARS3:  CALL     OVER
      008D5E CD 82 F7         [ 4] 2583         CALL     SWAPP
      008D61 CD 82 B0         [ 4] 2584         CALL     TOR
      008D64 CD 83 B3         [ 4] 2585 PARS4:  CALL     TEMP
      008D67 CD 82 40         [ 4] 2586         CALL     AT
      008D6A CD 83 11         [ 4] 2587         CALL     OVER
      008D6D CD 82 5E         [ 4] 2588         CALL     CAT
      008D70 CD 85 1B         [ 4] 2589         CALL     SUBB    ;scan for delimiter
      008D73 CD 83 B3         [ 4] 2590         CALL     TEMP
      008D76 CD 82 40         [ 4] 2591         CALL     AT
      008D79 CD 87 C3         [ 4] 2592         CALL     BLANK
      008D7C CD 85 43         [ 4] 2593         CALL     EQUAL
      008D7F CD 81 EB         [ 4] 2594         CALL     QBRAN
      008D82 8D 87                 2595         .word      PARS5
      008D84 CD 83 20         [ 4] 2596         CALL     ZLESS
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      008D87 CD 81 EB         [ 4] 2597 PARS5:  CALL     QBRAN
      008D8A 8D 9C                 2598         .word      PARS6
      008D8C CD 87 9C         [ 4] 2599         CALL     ONEP
      008D8F CD 81 CC         [ 4] 2600         CALL     DONXT
      008D92 8D 64                 2601         .word      PARS4
      008D94 CD 82 E7         [ 4] 2602         CALL     DUPP
      008D97 CD 82 B0         [ 4] 2603         CALL     TOR
      008D9A 20 0F            [ 2] 2604         JRA     PARS7
      008D9C CD 82 91         [ 4] 2605 PARS6:  CALL     RFROM
      008D9F CD 82 DD         [ 4] 2606         CALL     DROP
      008DA2 CD 82 E7         [ 4] 2607         CALL     DUPP
      008DA5 CD 87 9C         [ 4] 2608         CALL     ONEP
      008DA8 CD 82 B0         [ 4] 2609         CALL     TOR
      008DAB CD 83 11         [ 4] 2610 PARS7:  CALL     OVER
      008DAE CD 85 1B         [ 4] 2611         CALL     SUBB
      008DB1 CD 82 91         [ 4] 2612         CALL     RFROM
      008DB4 CD 82 91         [ 4] 2613         CALL     RFROM
      008DB7 CC 85 1B         [ 2] 2614         JP     SUBB
      008DBA CD 83 11         [ 4] 2615 PARS8:  CALL     OVER
      008DBD CD 82 91         [ 4] 2616         CALL     RFROM
      008DC0 CC 85 1B         [ 2] 2617         JP     SUBB
                                   2618 
                                   2619 ;       PARSE   ( c -- b u ; <string> )
                                   2620 ;       Scan input stream and return
                                   2621 ;       counted string delimited by c.
      008DC3 8C FC                 2622         .word      LINK
                           000D45  2623 LINK = . 
      008DC5 05                    2624         .byte      5
      008DC6 50 41 52 53 45        2625         .ascii     "PARSE"
      008DCB                       2626 PARSE:
      008DCB CD 82 B0         [ 4] 2627         CALL     TOR
      008DCE CD 88 DF         [ 4] 2628         CALL     TIB
      008DD1 CD 83 C2         [ 4] 2629         CALL     INN
      008DD4 CD 82 40         [ 4] 2630         CALL     AT
      008DD7 CD 84 BD         [ 4] 2631         CALL     PLUS    ;current input buffer pointer
      008DDA CD 83 D2         [ 4] 2632         CALL     NTIB
      008DDD CD 82 40         [ 4] 2633         CALL     AT
      008DE0 CD 83 C2         [ 4] 2634         CALL     INN
      008DE3 CD 82 40         [ 4] 2635         CALL     AT
      008DE6 CD 85 1B         [ 4] 2636         CALL     SUBB    ;remaining count
      008DE9 CD 82 91         [ 4] 2637         CALL     RFROM
      008DEC CD 8D 02         [ 4] 2638         CALL     PARS
      008DEF CD 83 C2         [ 4] 2639         CALL     INN
      008DF2 CC 88 3F         [ 2] 2640         JP     PSTOR
                                   2641 
                                   2642 ;       .(      ( -- )
                                   2643 ;       Output following string up to next ) .
      008DF5 8D C5                 2644         .word      LINK
                           000D77  2645 LINK = . 
      008DF7 82                    2646 	.byte      IMEDD+2
      008DF8 2E 28                 2647         .ascii     ".("
      008DFA                       2648 DOTPR:
      008DFA CD 81 B8         [ 4] 2649         CALL     DOLIT
      008DFD 00 29                 2650         .word     41	; ")"
      008DFF CD 8D CB         [ 4] 2651         CALL     PARSE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



      008E02 CC 8C 18         [ 2] 2652         JP     TYPES
                                   2653 
                                   2654 ;       (       ( -- )
                                   2655 ;       Ignore following string up to next ).
                                   2656 ;       A comment.
      008E05 8D F7                 2657         .word      LINK
                           000D87  2658 LINK = . 
      008E07 81                    2659 	.byte      IMEDD+1
      008E08 28                    2660         .ascii     "("
      008E09                       2661 PAREN:
      008E09 CD 81 B8         [ 4] 2662         CALL     DOLIT
      008E0C 00 29                 2663         .word     41	; ")"
      008E0E CD 8D CB         [ 4] 2664         CALL     PARSE
      008E11 CC 84 9D         [ 2] 2665         JP     DDROP
                                   2666 
                                   2667 ;       \       ( -- )
                                   2668 ;       Ignore following text till
                                   2669 ;       end of line.
      008E14 8E 07                 2670         .word      LINK
                           000D96  2671 LINK = . 
      008E16 81                    2672 	.byte      IMEDD+1
      008E17 5C                    2673         .ascii     "\"
      008E18                       2674 BKSLA:
                           000001  2675 .if CONVERT_TO_CODE
      008E18 90 AE 00 0C      [ 2] 2676         ldw y,#UCTIB ; #TIB  
      008E1C 90 FE            [ 2] 2677         ldw y,(y)
      008E1E 90 89            [ 2] 2678         pushw y ; count in TIB 
      008E20 90 AE 00 0A      [ 2] 2679         ldw y,#UINN ; >IN 
      008E24 90 BF 20         [ 2] 2680         ldw YTEMP,y
      008E27 90 85            [ 2] 2681         popw y 
      008E29 91 CF 20         [ 5] 2682         ldw [YTEMP],y
      008E2C 81               [ 4] 2683         ret 
                           000000  2684 .else
                                   2685         CALL     NTIB
                                   2686         CALL     AT
                                   2687         CALL     INN
                                   2688         JP     STORE
                                   2689 .endif 
                                   2690 
                                   2691 ;       WORD    ( c -- a ; <string> )
                                   2692 ;       Parse a word from input stream
                                   2693 ;       and copy it to code dictionary.
      008E2D 8E 16                 2694         .word      LINK
                           000DAF  2695 LINK = . 
      008E2F 04                    2696         .byte      4
      008E30 57 4F 52 44           2697         .ascii     "WORD"
      008E34                       2698 WORDD:
      008E34 CD 8D CB         [ 4] 2699         CALL     PARSE
      008E37 CD 88 BD         [ 4] 2700         CALL     HERE
      008E3A CD 87 71         [ 4] 2701         CALL     CELLP
      008E3D CC 89 7E         [ 2] 2702         JP     PACKS
                                   2703 
                                   2704 ;       TOKEN   ( -- a ; <string> )
                                   2705 ;       Parse a word from input stream
                                   2706 ;       and copy it to name dictionary.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



      008E40 8E 2F                 2707         .word      LINK
                           000DC2  2708 LINK = . 
      008E42 05                    2709         .byte      5
      008E43 54 4F 4B 45 4E        2710         .ascii     "TOKEN"
      008E48                       2711 TOKEN:
      008E48 CD 87 C3         [ 4] 2712         CALL     BLANK
      008E4B CC 8E 34         [ 2] 2713         JP     WORDD
                                   2714 
                                   2715 ;; Dictionary search
                                   2716 
                                   2717 ;       NAME>   ( na -- ca )
                                   2718 ;       Return a code address given
                                   2719 ;       a name address.
      008E4E 8E 42                 2720         .word      LINK
                           000DD0  2721 LINK = . 
      008E50 05                    2722         .byte      5
      008E51 4E 41 4D 45 3E        2723         .ascii     "NAME>"
      008E56                       2724 NAMET:
      008E56 CD 88 A6         [ 4] 2725         CALL     COUNT
      008E59 CD 81 B8         [ 4] 2726         CALL     DOLIT
      008E5C 00 1F                 2727         .word      31
      008E5E CD 83 33         [ 4] 2728         CALL     ANDD
      008E61 CC 84 BD         [ 2] 2729         JP     PLUS
                                   2730 
                                   2731 ;       SAME?   ( a a u -- a a f \ -0+ )
                                   2732 ;       Compare u cells in two
                                   2733 ;       strings. Return 0 if identical.
      008E64 8E 50                 2734         .word      LINK
                           000DE6  2735 LINK = . 
      008E66 05                    2736         .byte       5
      008E67 53 41 4D 45 3F        2737         .ascii     "SAME?"
      008E6C                       2738 SAMEQ:
      008E6C CD 87 A9         [ 4] 2739         CALL     ONEM
      008E6F CD 82 B0         [ 4] 2740         CALL     TOR
      008E72 20 29            [ 2] 2741         JRA     SAME2
      008E74 CD 83 11         [ 4] 2742 SAME1:  CALL     OVER
      008E77 CD 82 A4         [ 4] 2743         CALL     RAT
      008E7A CD 84 BD         [ 4] 2744         CALL     PLUS
      008E7D CD 82 5E         [ 4] 2745         CALL     CAT
      008E80 CD 83 11         [ 4] 2746         CALL     OVER
      008E83 CD 82 A4         [ 4] 2747         CALL     RAT
      008E86 CD 84 BD         [ 4] 2748         CALL     PLUS
      008E89 CD 82 5E         [ 4] 2749         CALL     CAT
      008E8C CD 85 1B         [ 4] 2750         CALL     SUBB
      008E8F CD 84 6C         [ 4] 2751         CALL     QDUP
      008E92 CD 81 EB         [ 4] 2752         CALL     QBRAN
      008E95 8E 9D                 2753         .word      SAME2
      008E97 CD 82 91         [ 4] 2754         CALL     RFROM
      008E9A CC 82 DD         [ 2] 2755         JP     DROP
      008E9D CD 81 CC         [ 4] 2756 SAME2:  CALL     DONXT
      008EA0 8E 74                 2757         .word      SAME1
      008EA2 CC 87 D0         [ 2] 2758         JP     ZERO
                                   2759 
                                   2760 ;       find    ( a va -- ca na | a F )
                                   2761 ;       Search vocabulary for string.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



                                   2762 ;       Return ca and na if succeeded.
      008EA5 8E 66                 2763         .word      LINK
                           000E27  2764 LINK = . 
      008EA7 04                    2765         .byte      4
      008EA8 46 49 4E 44           2766         .ascii     "FIND"
      008EAC                       2767 FIND:
      008EAC CD 82 F7         [ 4] 2768         CALL     SWAPP
      008EAF CD 82 E7         [ 4] 2769         CALL     DUPP
      008EB2 CD 82 5E         [ 4] 2770         CALL     CAT
      008EB5 CD 83 B3         [ 4] 2771         CALL     TEMP
      008EB8 CD 82 29         [ 4] 2772         CALL     STORE
      008EBB CD 82 E7         [ 4] 2773         CALL     DUPP
      008EBE CD 82 40         [ 4] 2774         CALL     AT
      008EC1 CD 82 B0         [ 4] 2775         CALL     TOR
      008EC4 CD 87 71         [ 4] 2776         CALL     CELLP
      008EC7 CD 82 F7         [ 4] 2777         CALL     SWAPP
      008ECA CD 82 40         [ 4] 2778 FIND1:  CALL     AT
      008ECD CD 82 E7         [ 4] 2779         CALL     DUPP
      008ED0 CD 81 EB         [ 4] 2780         CALL     QBRAN
      008ED3 8F 09                 2781         .word      FIND6
      008ED5 CD 82 E7         [ 4] 2782         CALL     DUPP
      008ED8 CD 82 40         [ 4] 2783         CALL     AT
      008EDB CD 81 B8         [ 4] 2784         CALL     DOLIT
      008EDE 1F 7F                 2785         .word      MASKK
      008EE0 CD 83 33         [ 4] 2786         CALL     ANDD
      008EE3 CD 82 A4         [ 4] 2787         CALL     RAT
      008EE6 CD 83 5C         [ 4] 2788         CALL     XORR
      008EE9 CD 81 EB         [ 4] 2789         CALL     QBRAN
      008EEC 8E F8                 2790         .word      FIND2
      008EEE CD 87 71         [ 4] 2791         CALL     CELLP
      008EF1 CD 81 B8         [ 4] 2792         CALL     DOLIT
      008EF4 FF FF                 2793         .word     0xFFFF
      008EF6 20 0C            [ 2] 2794         JRA     FIND3
      008EF8 CD 87 71         [ 4] 2795 FIND2:  CALL     CELLP
      008EFB CD 83 B3         [ 4] 2796         CALL     TEMP
      008EFE CD 82 40         [ 4] 2797         CALL     AT
      008F01 CD 8E 6C         [ 4] 2798         CALL     SAMEQ
      008F04 CD 82 02         [ 4] 2799 FIND3:  CALL     BRAN
      008F07 8F 18                 2800         .word      FIND4
      008F09 CD 82 91         [ 4] 2801 FIND6:  CALL     RFROM
      008F0C CD 82 DD         [ 4] 2802         CALL     DROP
      008F0F CD 82 F7         [ 4] 2803         CALL     SWAPP
      008F12 CD 87 80         [ 4] 2804         CALL     CELLM
      008F15 CC 82 F7         [ 2] 2805         JP     SWAPP
      008F18 CD 81 EB         [ 4] 2806 FIND4:  CALL     QBRAN
      008F1B 8F 25                 2807         .word      FIND5
      008F1D CD 87 80         [ 4] 2808         CALL     CELLM
      008F20 CD 87 80         [ 4] 2809         CALL     CELLM
      008F23 20 A5            [ 2] 2810         JRA     FIND1
      008F25 CD 82 91         [ 4] 2811 FIND5:  CALL     RFROM
      008F28 CD 82 DD         [ 4] 2812         CALL     DROP
      008F2B CD 82 F7         [ 4] 2813         CALL     SWAPP
      008F2E CD 82 DD         [ 4] 2814         CALL     DROP
      008F31 CD 87 80         [ 4] 2815         CALL     CELLM
      008F34 CD 82 E7         [ 4] 2816         CALL     DUPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



      008F37 CD 8E 56         [ 4] 2817         CALL     NAMET
      008F3A CC 82 F7         [ 2] 2818         JP     SWAPP
                                   2819 
                                   2820 ;       NAME?   ( a -- ca na | a F )
                                   2821 ;       Search vocabularies for a string.
      008F3D 8E A7                 2822         .word      LINK
                           000EBF  2823 LINK = . 
      008F3F 05                    2824         .byte      5
      008F40 4E 41 4D 45 3F        2825         .ascii     "NAME?"
      008F45                       2826 NAMEQ:
      008F45 CD 84 15         [ 4] 2827         CALL   CNTXT
      008F48 CC 8E AC         [ 2] 2828         JP     FIND
                                   2829 
                                   2830 ;; Terminal response
                                   2831 
                                   2832 ;       ^H      ( bot eot cur -- bot eot cur )
                                   2833 ;       Backup cursor by one character.
      008F4B 8F 3F                 2834         .word      LINK
                           000ECD  2835 LINK = . 
      008F4D 02                    2836         .byte      2
      008F4E 5E 48                 2837         .ascii     "^H"
      008F50                       2838 BKSP:
      008F50 CD 82 B0         [ 4] 2839         CALL     TOR
      008F53 CD 83 11         [ 4] 2840         CALL     OVER
      008F56 CD 82 91         [ 4] 2841         CALL     RFROM
      008F59 CD 82 F7         [ 4] 2842         CALL     SWAPP
      008F5C CD 83 11         [ 4] 2843         CALL     OVER
      008F5F CD 83 5C         [ 4] 2844         CALL     XORR
      008F62 CD 81 EB         [ 4] 2845         CALL     QBRAN
      008F65 8F 80                 2846         .word      BACK1
      008F67 CD 81 B8         [ 4] 2847         CALL     DOLIT
      008F6A 00 08                 2848         .word      BKSPP
      008F6C CD 81 A2         [ 4] 2849         CALL     EMIT
      008F6F CD 87 A9         [ 4] 2850         CALL     ONEM
      008F72 CD 87 C3         [ 4] 2851         CALL     BLANK
      008F75 CD 81 A2         [ 4] 2852         CALL     EMIT
      008F78 CD 81 B8         [ 4] 2853         CALL     DOLIT
      008F7B 00 08                 2854         .word      BKSPP
      008F7D CC 81 A2         [ 2] 2855         JP     EMIT
      008F80 81               [ 4] 2856 BACK1:  RET
                                   2857 
                                   2858 ;       TAP     ( bot eot cur c -- bot eot cur )
                                   2859 ;       Accept and echo key stroke
                                   2860 ;       and bump cursor.
      008F81 8F 4D                 2861         .word      LINK
                           000F03  2862 LINK = . 
      008F83 03                    2863         .byte      3
      008F84 54 41 50              2864         .ascii     "TAP"
      008F87                       2865 TAP:
      008F87 CD 82 E7         [ 4] 2866         CALL     DUPP
      008F8A CD 81 A2         [ 4] 2867         CALL     EMIT
      008F8D CD 83 11         [ 4] 2868         CALL     OVER
      008F90 CD 82 4D         [ 4] 2869         CALL     CSTOR
      008F93 CC 87 9C         [ 2] 2870         JP     ONEP
                                   2871 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



                                   2872 ;       kTAP    ( bot eot cur c -- bot eot cur )
                                   2873 ;       Process a key stroke,
                                   2874 ;       CR or backspace.
      008F96 8F 83                 2875         .word      LINK
                           000F18  2876 LINK = . 
      008F98 04                    2877         .byte      4
      008F99 4B 54 41 50           2878         .ascii     "KTAP"
      008F9D                       2879 KTAP:
      008F9D CD 82 E7         [ 4] 2880         CALL     DUPP
      008FA0 CD 81 B8         [ 4] 2881         CALL     DOLIT
      008FA3 00 0D                 2882         .word      CRR
      008FA5 CD 83 5C         [ 4] 2883         CALL     XORR
      008FA8 CD 81 EB         [ 4] 2884         CALL     QBRAN
      008FAB 8F C3                 2885         .word      KTAP2
      008FAD CD 81 B8         [ 4] 2886         CALL     DOLIT
      008FB0 00 08                 2887         .word      BKSPP
      008FB2 CD 83 5C         [ 4] 2888         CALL     XORR
      008FB5 CD 81 EB         [ 4] 2889         CALL     QBRAN
      008FB8 8F C0                 2890         .word      KTAP1
      008FBA CD 87 C3         [ 4] 2891         CALL     BLANK
      008FBD CC 8F 87         [ 2] 2892         JP     TAP
      008FC0 CC 8F 50         [ 2] 2893 KTAP1:  JP     BKSP
      008FC3 CD 82 DD         [ 4] 2894 KTAP2:  CALL     DROP
      008FC6 CD 82 F7         [ 4] 2895         CALL     SWAPP
      008FC9 CD 82 DD         [ 4] 2896         CALL     DROP
      008FCC CC 82 E7         [ 2] 2897         JP     DUPP
                                   2898 
                                   2899 ;       accept  ( b u -- b u )
                                   2900 ;       Accept characters to input
                                   2901 ;       buffer. Return with actual count.
      008FCF 8F 98                 2902         .word      LINK
                           000F51  2903 LINK = . 
      008FD1 06                    2904         .byte      6
      008FD2 41 43 43 45 50 54     2905         .ascii     "ACCEPT"
      008FD8                       2906 ACCEP:
      008FD8 CD 83 11         [ 4] 2907         CALL     OVER
      008FDB CD 84 BD         [ 4] 2908         CALL     PLUS
      008FDE CD 83 11         [ 4] 2909         CALL     OVER
      008FE1 CD 84 A8         [ 4] 2910 ACCP1:  CALL     DDUP
      008FE4 CD 83 5C         [ 4] 2911         CALL     XORR
      008FE7 CD 81 EB         [ 4] 2912         CALL     QBRAN
      008FEA 90 0C                 2913         .word      ACCP4
      008FEC CD 8B B6         [ 4] 2914         CALL     KEY
      008FEF CD 82 E7         [ 4] 2915         CALL     DUPP
      008FF2 CD 87 C3         [ 4] 2916         CALL     BLANK
      008FF5 CD 81 B8         [ 4] 2917         CALL     DOLIT
      008FF8 00 7F                 2918         .word      127
      008FFA CD 85 DD         [ 4] 2919         CALL     WITHI
      008FFD CD 81 EB         [ 4] 2920         CALL     QBRAN
      009000 90 07                 2921         .word      ACCP2
      009002 CD 8F 87         [ 4] 2922         CALL     TAP
      009005 20 03            [ 2] 2923         JRA     ACCP3
      009007 CD 8F 9D         [ 4] 2924 ACCP2:  CALL     KTAP
      00900A 20 D5            [ 2] 2925 ACCP3:  JRA     ACCP1
      00900C CD 82 DD         [ 4] 2926 ACCP4:  CALL     DROP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      00900F CD 83 11         [ 4] 2927         CALL     OVER
      009012 CC 85 1B         [ 2] 2928         JP     SUBB
                                   2929 
                                   2930 ;       QUERY   ( -- )
                                   2931 ;       Accept input stream to
                                   2932 ;       terminal input buffer.
      009015 8F D1                 2933         .word      LINK
                                   2934         
                           000F97  2935 LINK = . 
      009017 05                    2936         .byte      5
      009018 51 55 45 52 59        2937         .ascii     "QUERY"
      00901D                       2938 QUERY:
      00901D CD 88 DF         [ 4] 2939         CALL     TIB
      009020 CD 81 B8         [ 4] 2940         CALL     DOLIT
      009023 00 50                 2941         .word      80
      009025 CD 8F D8         [ 4] 2942         CALL     ACCEP
      009028 CD 83 D2         [ 4] 2943         CALL     NTIB
      00902B CD 82 29         [ 4] 2944         CALL     STORE
      00902E CD 82 DD         [ 4] 2945         CALL     DROP
      009031 CD 87 D0         [ 4] 2946         CALL     ZERO
      009034 CD 83 C2         [ 4] 2947         CALL     INN
      009037 CC 82 29         [ 2] 2948         JP     STORE
                                   2949 
                                   2950 ;       ABORT   ( -- )
                                   2951 ;       Reset data stack and
                                   2952 ;       jump to QUIT.
      00903A 90 17                 2953         .word      LINK
                           000FBC  2954 LINK = . 
      00903C 05                    2955         .byte      5
      00903D 41 42 4F 52 54        2956         .ascii     "ABORT"
      009042                       2957 ABORT:
      009042 CD 91 39         [ 4] 2958         CALL     PRESE
      009045 CC 91 56         [ 2] 2959         JP     QUIT
                                   2960 
                                   2961 ;       abort"  ( f -- )
                                   2962 ;       Run time routine of ABORT".
                                   2963 ;       Abort with a message.
      009048 90 3C                 2964         .word      LINK
                           000FCA  2965 LINK = . 
      00904A 46                    2966 	.byte      COMPO+6
      00904B 41 42 4F 52 54        2967         .ascii     "ABORT"
      009050 22                    2968         .byte      '"'
      009051                       2969 ABORQ:
      009051 CD 81 EB         [ 4] 2970         CALL     QBRAN
      009054 90 70                 2971         .word      ABOR2   ;text flag
      009056 CD 8C 4C         [ 4] 2972         CALL     DOSTR
      009059 CD 8B EE         [ 4] 2973 ABOR1:  CALL     SPACE
      00905C CD 88 A6         [ 4] 2974         CALL     COUNT
      00905F CD 8C 18         [ 4] 2975         CALL     TYPES
      009062 CD 81 B8         [ 4] 2976         CALL     DOLIT
      009065 00 3F                 2977         .word     63 ; "?"
      009067 CD 81 A2         [ 4] 2978         CALL     EMIT
      00906A CD 8C 36         [ 4] 2979         CALL     CR
      00906D CC 90 42         [ 2] 2980         JP     ABORT   ;pass error string
      009070 CD 8C 4C         [ 4] 2981 ABOR2:  CALL     DOSTR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      009073 CC 82 DD         [ 2] 2982         JP     DROP
                                   2983 
                                   2984 ;; The text interpreter
                                   2985 
                                   2986 ;       $INTERPRET      ( a -- )
                                   2987 ;       Interpret a word. If failed,
                                   2988 ;       try to convert it to an integer.
      009076 90 4A                 2989         .word      LINK
                           000FF8  2990 LINK = . 
      009078 0A                    2991         .byte      10
      009079 24 49 4E 54 45 52 50  2992         .ascii     "$INTERPRET"
             52 45 54
      009083                       2993 INTER:
      009083 CD 8F 45         [ 4] 2994         CALL     NAMEQ
      009086 CD 84 6C         [ 4] 2995         CALL     QDUP    ;?defined
      009089 CD 81 EB         [ 4] 2996         CALL     QBRAN
      00908C 90 AD                 2997         .word      INTE1
      00908E CD 82 40         [ 4] 2998         CALL     AT
      009091 CD 81 B8         [ 4] 2999         CALL     DOLIT
      009094 40 00                 3000 	.word       0x4000	; COMPO*256
      009096 CD 83 33         [ 4] 3001         CALL     ANDD    ;?compile only lexicon bits
      009099 CD 90 51         [ 4] 3002         CALL     ABORQ
      00909C 0D                    3003         .byte      13
      00909D 20 63 6F 6D 70 69 6C  3004         .ascii     " compile only"
             65 20 6F 6E 6C 79
      0090AA CC 82 12         [ 2] 3005         JP     EXECU
      0090AD CD 8A E3         [ 4] 3006 INTE1:  CALL     NUMBQ   ;convert a number
      0090B0 CD 81 EB         [ 4] 3007         CALL     QBRAN
      0090B3 90 59                 3008         .word    ABOR1
      0090B5 81               [ 4] 3009         RET
                                   3010 
                                   3011 ;       [       ( -- )
                                   3012 ;       Start  text interpreter.
      0090B6 90 78                 3013         .word      LINK
                           001038  3014 LINK = . 
      0090B8 81                    3015 	.byte      IMEDD+1
      0090B9 5B                    3016         .ascii     "["
      0090BA                       3017 LBRAC:
      0090BA CD 81 B8         [ 4] 3018         CALL   DOLIT
      0090BD 90 83                 3019         .word  INTER
      0090BF CD 83 F3         [ 4] 3020         CALL   TEVAL
      0090C2 CC 82 29         [ 2] 3021         JP     STORE
                                   3022 
                                   3023 ;       .OK     ( -- )
                                   3024 ;       Display 'ok' while interpreting.
      0090C5 90 B8                 3025         .word      LINK
                           001047  3026 LINK = . 
      0090C7 03                    3027         .byte      3
      0090C8 2E 4F 4B              3028         .ascii     ".OK"
      0090CB                       3029 DOTOK:
      0090CB CD 81 B8         [ 4] 3030         CALL     DOLIT
      0090CE 90 83                 3031         .word      INTER
      0090D0 CD 83 F3         [ 4] 3032         CALL     TEVAL
      0090D3 CD 82 40         [ 4] 3033         CALL     AT
      0090D6 CD 85 43         [ 4] 3034         CALL     EQUAL
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      0090D9 CD 81 EB         [ 4] 3035         CALL     QBRAN
      0090DC 90 E5                 3036         .word      DOTO1
      0090DE CD 8C 75         [ 4] 3037         CALL     DOTQP
      0090E1 03                    3038         .byte      3
      0090E2 20 6F 6B              3039         .ascii     " ok"
      0090E5 CC 8C 36         [ 2] 3040 DOTO1:  JP     CR
                                   3041 
                                   3042 ;       ?STACK  ( -- )
                                   3043 ;       Abort if stack underflows.
      0090E8 90 C7                 3044         .word      LINK
                           00106A  3045 LINK = . 
      0090EA 06                    3046         .byte      6
      0090EB 3F 53 54 41 43 4B     3047         .ascii     "?STACK"
      0090F1                       3048 QSTAC: 
      0090F1 CD 88 13         [ 4] 3049         CALL     DEPTH
      0090F4 CD 83 20         [ 4] 3050         CALL     ZLESS   ;check only for underflow
      0090F7 CD 90 51         [ 4] 3051         CALL     ABORQ
      0090FA 0B                    3052         .byte      11
      0090FB 20 75 6E 64 65 72 66  3053         .ascii     " underflow "
             6C 6F 77 20
      009106 81               [ 4] 3054         RET
                                   3055 
                                   3056 ;       EVAL    ( -- )
                                   3057 ;       Interpret  input stream.
      009107 90 EA                 3058         .word      LINK
                           001089  3059 LINK = . 
      009109 04                    3060         .byte      4
      00910A 45 56 41 4C           3061         .ascii     "EVAL"
      00910E                       3062 EVAL:
      00910E CD 8E 48         [ 4] 3063 EVAL1:  CALL     TOKEN
      009111 CD 82 E7         [ 4] 3064         CALL     DUPP
      009114 CD 82 5E         [ 4] 3065         CALL     CAT     ;?input stream empty
      009117 CD 81 EB         [ 4] 3066         CALL     QBRAN
      00911A 91 2A                 3067         .word    EVAL2
      00911C CD 83 F3         [ 4] 3068         CALL     TEVAL
      00911F CD 88 F3         [ 4] 3069         CALL     ATEXE
      009122 CD 90 F1         [ 4] 3070         CALL     QSTAC   ;evaluate input, check stack
      009125 CD 82 02         [ 4] 3071         CALL     BRAN
      009128 91 0E                 3072         .word    EVAL1
      00912A CD 82 DD         [ 4] 3073 EVAL2:  CALL     DROP
      00912D CC 90 CB         [ 2] 3074         JP       DOTOK
                                   3075 
                                   3076 ;       PRESET  ( -- )
                                   3077 ;       Reset data stack pointer and
                                   3078 ;       terminal input buffer.
      009130 91 09                 3079         .word      LINK
                           0010B2  3080 LINK = . 
      009132 06                    3081         .byte      6
      009133 50 52 45 53 45 54     3082         .ascii     "PRESET"
      009139                       3083 PRESE:
      009139 CD 81 B8         [ 4] 3084         CALL     DOLIT
      00913C 16 70                 3085         .word      SPP
      00913E CD 82 D4         [ 4] 3086         CALL     SPSTO
      009141 CD 81 B8         [ 4] 3087         CALL     DOLIT
      009144 17 00                 3088         .word      TIBB
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



      009146 CD 83 D2         [ 4] 3089         CALL     NTIB
      009149 CD 87 71         [ 4] 3090         CALL     CELLP
      00914C CC 82 29         [ 2] 3091         JP     STORE
                                   3092 
                                   3093 ;       QUIT    ( -- )
                                   3094 ;       Reset return stack pointer
                                   3095 ;       and start text interpreter.
      00914F 91 32                 3096         .word      LINK
                           0010D1  3097 LINK = . 
      009151 04                    3098         .byte      4
      009152 51 55 49 54           3099         .ascii     "QUIT"
      009156                       3100 QUIT:
      009156 CD 81 B8         [ 4] 3101         CALL     DOLIT
      009159 17 FF                 3102         .word      RPP
      00915B CD 82 7B         [ 4] 3103         CALL     RPSTO   ;reset return stack pointer
      00915E CD 90 BA         [ 4] 3104 QUIT1:  CALL     LBRAC   ;start interpretation
      009161 CD 90 1D         [ 4] 3105 QUIT2:  CALL     QUERY   ;get input
      009164 CD 91 0E         [ 4] 3106         CALL     EVAL
      009167 20 F8            [ 2] 3107         JRA     QUIT2   ;continue till error
                                   3108 
                                   3109 ;; The compiler
                                   3110 
                                   3111 ;       '       ( -- ca )
                                   3112 ;       Search vocabularies for
                                   3113 ;       next word in input stream.
      009169 91 51                 3114         .word      LINK
                           0010EB  3115 LINK = . 
      00916B 01                    3116         .byte      1
      00916C 27                    3117         .ascii     "'"
      00916D                       3118 TICK:
      00916D CD 8E 48         [ 4] 3119         CALL     TOKEN
      009170 CD 8F 45         [ 4] 3120         CALL     NAMEQ   ;?defined
      009173 CD 81 EB         [ 4] 3121         CALL     QBRAN
      009176 90 59                 3122         .word      ABOR1
      009178 81               [ 4] 3123         RET     ;yes, push code address
                                   3124 
                                   3125 ;       ALLOT   ( n -- )
                           000001  3126 .if PICATOUT_MOD
                                   3127 ;       Allocate n bytes to RAM 
                           000000  3128 .else 
                                   3129 ;       Allocate n bytes to  code dictionary.
                                   3130 .endif 
      009179 91 6B                 3131         .word      LINK
                           0010FB  3132 LINK = . 
      00917B 05                    3133         .byte      5
      00917C 41 4C 4C 4F 54        3134         .ascii     "ALLOT"
      009181                       3135 ALLOT:
      009181 CD 84 23         [ 4] 3136         CALL     VPP
                           000001  3137 .if PICATOUT_MOD
                                   3138 ; must update APP_VP each time VP is modidied
      009184 CD 88 3F         [ 4] 3139         call PSTOR 
      009187 CD 97 D6         [ 4] 3140         call UPDATVP 
                           000000  3141 .else
                                   3142         JP     PSTOR
                                   3143 .endif ;PICATOUT_MOD
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



                                   3144 
                                   3145 ;       ,       ( w -- )
                                   3146 ;         Compile an integer into
                                   3147 ;         variable space.
      00918A 91 7B                 3148         .word      LINK
                           00110C  3149 LINK = . 
      00918C 01                    3150         .byte      1
      00918D 2C                    3151         .ascii     ","
      00918E                       3152 COMMA:
      00918E CD 88 BD         [ 4] 3153         CALL     HERE
      009191 CD 82 E7         [ 4] 3154         CALL     DUPP
      009194 CD 87 71         [ 4] 3155         CALL     CELLP   ;cell boundary
      009197 CD 84 23         [ 4] 3156         CALL     VPP
      00919A CD 82 29         [ 4] 3157         CALL     STORE
      00919D CC 82 29         [ 2] 3158         JP     STORE
                                   3159 
                                   3160 ;       C,      ( c -- )
                                   3161 ;       Compile a byte into
                                   3162 ;       variables space.
      0091A0 91 8C                 3163        .word      LINK
                           001122  3164 LINK = . 
      0091A2 02                    3165         .byte      2
      0091A3 43 2C                 3166         .ascii     "C,"
      0091A5                       3167 CCOMMA:
      0091A5 CD 88 BD         [ 4] 3168         CALL     HERE
      0091A8 CD 82 E7         [ 4] 3169         CALL     DUPP
      0091AB CD 87 9C         [ 4] 3170         CALL     ONEP
      0091AE CD 84 23         [ 4] 3171         CALL     VPP
      0091B1 CD 82 29         [ 4] 3172         CALL     STORE
      0091B4 CC 82 4D         [ 2] 3173         JP     CSTOR
                                   3174 
                                   3175 ;       [COMPILE]       ( -- ; <string> )
                                   3176 ;       Compile next immediate
                                   3177 ;       word into code dictionary.
      0091B7 91 A2                 3178         .word      LINK
                           001139  3179 LINK = . 
      0091B9 89                    3180 	.byte      IMEDD+9
      0091BA 5B 43 4F 4D 50 49 4C  3181         .ascii     "[COMPILE]"
             45 5D
      0091C3                       3182 BCOMP:
      0091C3 CD 91 6D         [ 4] 3183         CALL     TICK
      0091C6 CC 94 3B         [ 2] 3184         JP     JSRC
                                   3185 
                                   3186 ;       COMPILE ( -- )
                                   3187 ;       Compile next jsr in
                                   3188 ;       colon list to code dictionary.
      0091C9 91 B9                 3189         .word      LINK
                           00114B  3190 LINK = . 
      0091CB 47                    3191 	.byte      COMPO+7
      0091CC 43 4F 4D 50 49 4C 45  3192         .ascii     "COMPILE"
      0091D3                       3193 COMPI:
      0091D3 CD 82 91         [ 4] 3194         CALL     RFROM
      0091D6 CD 87 9C         [ 4] 3195         CALL     ONEP
      0091D9 CD 82 E7         [ 4] 3196         CALL     DUPP
      0091DC CD 82 40         [ 4] 3197         CALL     AT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



      0091DF CD 94 3B         [ 4] 3198         CALL     JSRC    ;compile subroutine
      0091E2 CD 87 71         [ 4] 3199         CALL     CELLP
      0091E5 CC 82 B0         [ 2] 3200         JP     TOR
                                   3201 
                                   3202 ;       LITERAL ( w -- )
                                   3203 ;       Compile tos to dictionary
                                   3204 ;       as an integer literal.
      0091E8 91 CB                 3205         .word      LINK
                           00116A  3206 LINK = . 
      0091EA 87                    3207 	.byte      IMEDD+7
      0091EB 4C 49 54 45 52 41 4C  3208         .ascii     "LITERAL"
      0091F2                       3209 LITER:
      0091F2 CD 91 D3         [ 4] 3210         CALL     COMPI
      0091F5 CD 81 B8         [ 4] 3211         CALL     DOLIT
      0091F8 CC 91 8E         [ 2] 3212         JP     COMMA
                                   3213 
                                   3214 ;       $,"     ( -- )
                                   3215 ;       Compile a literal string
                                   3216 ;       up to next " .
      0091FB 91 EA                 3217         .word      LINK
                           00117D  3218 LINK = . 
      0091FD 03                    3219         .byte      3
      0091FE 24 2C 22              3220         .byte     '$',',','"'
      009201                       3221 STRCQ:
      009201 CD 81 B8         [ 4] 3222         CALL     DOLIT
      009204 00 22                 3223         .word     34	; "
      009206 CD 8D CB         [ 4] 3224         CALL     PARSE
      009209 CD 88 BD         [ 4] 3225         CALL     HERE
      00920C CD 89 7E         [ 4] 3226         CALL     PACKS   ;string to code dictionary
      00920F CD 88 A6         [ 4] 3227         CALL     COUNT
      009212 CD 84 BD         [ 4] 3228         CALL     PLUS    ;calculate aligned end of string
      009215 CD 84 23         [ 4] 3229         CALL     VPP
      009218 CC 82 29         [ 2] 3230         JP     STORE
                                   3231 
                                   3232 ;; Structures
                                   3233 
                                   3234 ;       FOR     ( -- a )
                                   3235 ;       Start a FOR-NEXT loop
                                   3236 ;       structure in a colon definition.
      00921B 91 FD                 3237         .word      LINK
                           00119D  3238 LINK = . 
      00921D 83                    3239 	.byte      IMEDD+3
      00921E 46 4F 52              3240         .ascii     "FOR"
      009221                       3241 FOR:
      009221 CD 91 D3         [ 4] 3242         CALL     COMPI
      009224 CD 82 B0         [ 4] 3243         CALL     TOR
      009227 CC 88 BD         [ 2] 3244         JP     HERE
                                   3245 
                                   3246 ;       NEXT    ( a -- )
                                   3247 ;       Terminate a FOR-NEXT loop.
      00922A 92 1D                 3248         .word      LINK
                           0011AC  3249 LINK = . 
      00922C 84                    3250 	.byte      IMEDD+4
      00922D 4E 45 58 54           3251         .ascii     "NEXT"
      009231                       3252 NEXT:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      009231 CD 91 D3         [ 4] 3253         CALL     COMPI
      009234 CD 81 CC         [ 4] 3254         CALL     DONXT
                           000001  3255 .if PICATOUT_MOD 
      009237 CD 84 5C         [ 4] 3256         call ADRADJ
                                   3257 .endif ; PICATOUT_MOD
      00923A CC 91 8E         [ 2] 3258         JP     COMMA
                                   3259 
                                   3260 ;       BEGIN   ( -- a )
                                   3261 ;       Start an infinite or
                                   3262 ;       indefinite loop structure.
      00923D 92 2C                 3263         .word      LINK
                           0011BF  3264 LINK = . 
      00923F 85                    3265 	.byte      IMEDD+5
      009240 42 45 47 49 4E        3266         .ascii     "BEGIN"
      009245                       3267 BEGIN:
      009245 CC 88 BD         [ 2] 3268         JP     HERE
                                   3269 
                                   3270 ;       UNTIL   ( a -- )
                                   3271 ;       Terminate a BEGIN-UNTIL
                                   3272 ;       indefinite loop structure.
      009248 92 3F                 3273         .word      LINK
                           0011CA  3274 LINK = . 
      00924A 85                    3275 	.byte      IMEDD+5
      00924B 55 4E 54 49 4C        3276         .ascii     "UNTIL"
      009250                       3277 UNTIL:
      009250 CD 91 D3         [ 4] 3278         CALL     COMPI
      009253 CD 81 EB         [ 4] 3279         CALL     QBRAN
                           000001  3280 .if PICATOUT_MOD 
      009256 CD 84 5C         [ 4] 3281         call ADRADJ
                                   3282 .endif ; PICATOUT_MOD
      009259 CC 91 8E         [ 2] 3283         JP     COMMA
                                   3284 
                                   3285 ;       AGAIN   ( a -- )
                                   3286 ;       Terminate a BEGIN-AGAIN
                                   3287 ;       infinite loop structure.
      00925C 92 4A                 3288         .word      LINK
                           0011DE  3289 LINK = . 
      00925E 85                    3290 	.byte      IMEDD+5
      00925F 41 47 41 49 4E        3291         .ascii     "AGAIN"
      009264                       3292 AGAIN:
      009264 CD 91 D3         [ 4] 3293         CALL     COMPI
      009267 CD 82 02         [ 4] 3294         CALL     BRAN
                           000001  3295 .if PICATOUT_MOD 
      00926A CD 84 5C         [ 4] 3296         call ADRADJ 
                                   3297 .endif ; PICATOUT_MOD
      00926D CC 91 8E         [ 2] 3298         JP     COMMA
                                   3299 
                                   3300 ;       IF      ( -- A )
                                   3301 ;       Begin a conditional branch.
      009270 92 5E                 3302         .word      LINK
                           0011F2  3303 LINK = . 
      009272 82                    3304 	.byte      IMEDD+2
      009273 49 46                 3305         .ascii     "IF"
      009275                       3306 IFF:
      009275 CD 91 D3         [ 4] 3307         CALL     COMPI
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      009278 CD 81 EB         [ 4] 3308         CALL     QBRAN
      00927B CD 88 BD         [ 4] 3309         CALL     HERE
      00927E CD 87 D0         [ 4] 3310         CALL     ZERO
      009281 CC 91 8E         [ 2] 3311         JP     COMMA
                                   3312 
                                   3313 ;       THEN        ( A -- )
                                   3314 ;       Terminate a conditional branch structure.
      009284 92 72                 3315         .word      LINK
                           001206  3316 LINK = . 
      009286 84                    3317 	.byte      IMEDD+4
      009287 54 48 45 4E           3318         .ascii     "THEN"
      00928B                       3319 THENN:
      00928B CD 88 BD         [ 4] 3320         CALL     HERE
                           000001  3321 .if PICATOUT_MOD 
      00928E CD 84 5C         [ 4] 3322         call ADRADJ 
                                   3323 .endif ; PICATOUT_MOD
      009291 CD 82 F7         [ 4] 3324         CALL     SWAPP
      009294 CC 82 29         [ 2] 3325         JP     STORE
                                   3326 
                                   3327 ;       ELSE        ( A -- A )
                                   3328 ;       Start the false clause in an IF-ELSE-THEN structure.
      009297 92 86                 3329         .word      LINK
                           001219  3330 LINK = . 
      009299 84                    3331 	.byte      IMEDD+4
      00929A 45 4C 53 45           3332         .ascii     "ELSE"
      00929E                       3333 ELSEE:
      00929E CD 91 D3         [ 4] 3334         CALL     COMPI
      0092A1 CD 82 02         [ 4] 3335         CALL     BRAN
      0092A4 CD 88 BD         [ 4] 3336         CALL     HERE
      0092A7 CD 87 D0         [ 4] 3337         CALL     ZERO
      0092AA CD 91 8E         [ 4] 3338         CALL     COMMA
      0092AD CD 82 F7         [ 4] 3339         CALL     SWAPP
      0092B0 CD 88 BD         [ 4] 3340         CALL     HERE
                           000001  3341 .if PICATOUT_MOD 
      0092B3 CD 84 5C         [ 4] 3342         call ADRADJ 
                                   3343 .endif ; PICATOUT_MOD
      0092B6 CD 82 F7         [ 4] 3344         CALL     SWAPP
      0092B9 CC 82 29         [ 2] 3345         JP     STORE
                                   3346 
                                   3347 ;       AHEAD       ( -- A )
                                   3348 ;       Compile a forward branch instruction.
      0092BC 92 99                 3349         .word      LINK
                           00123E  3350 LINK = . 
      0092BE 85                    3351 	.byte      IMEDD+5
      0092BF 41 48 45 41 44        3352         .ascii     "AHEAD"
      0092C4                       3353 AHEAD:
      0092C4 CD 91 D3         [ 4] 3354         CALL     COMPI
      0092C7 CD 82 02         [ 4] 3355         CALL     BRAN
      0092CA CD 88 BD         [ 4] 3356         CALL     HERE
      0092CD CD 87 D0         [ 4] 3357         CALL     ZERO
      0092D0 CC 91 8E         [ 2] 3358         JP     COMMA
                                   3359 
                                   3360 ;       WHILE       ( a -- A a )
                                   3361 ;       Conditional branch out of a BEGIN-WHILE-REPEAT loop.
      0092D3 92 BE                 3362         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



                           001255  3363 LINK = . 
      0092D5 85                    3364 	.byte      IMEDD+5
      0092D6 57 48 49 4C 45        3365         .ascii     "WHILE"
      0092DB                       3366 WHILE:
      0092DB CD 91 D3         [ 4] 3367         CALL     COMPI
      0092DE CD 81 EB         [ 4] 3368         CALL     QBRAN
      0092E1 CD 88 BD         [ 4] 3369         CALL     HERE
      0092E4 CD 87 D0         [ 4] 3370         CALL     ZERO
      0092E7 CD 91 8E         [ 4] 3371         CALL     COMMA
      0092EA CC 82 F7         [ 2] 3372         JP     SWAPP
                                   3373 
                                   3374 ;       REPEAT      ( A a -- )
                                   3375 ;       Terminate a BEGIN-WHILE-REPEAT indefinite loop.
      0092ED 92 D5                 3376         .word      LINK
                           00126F  3377 LINK = . 
      0092EF 86                    3378         .byte      IMEDD+6
      0092F0 52 45 50 45 41 54     3379         .ascii     "REPEAT"
      0092F6                       3380 REPEA:
      0092F6 CD 91 D3         [ 4] 3381         CALL     COMPI
      0092F9 CD 82 02         [ 4] 3382         CALL     BRAN
                           000001  3383 .if PICATOUT_MOD 
      0092FC CD 84 5C         [ 4] 3384         call ADRADJ 
                                   3385 .endif ; PICATOUT_MOD
      0092FF CD 91 8E         [ 4] 3386         CALL     COMMA
      009302 CD 88 BD         [ 4] 3387         CALL     HERE
                           000001  3388 .if PICATOUT_MOD 
      009305 CD 84 5C         [ 4] 3389         call ADRADJ 
                                   3390 .endif ; PICATOUT_MOD
      009308 CD 82 F7         [ 4] 3391         CALL     SWAPP
      00930B CC 82 29         [ 2] 3392         JP     STORE
                                   3393 
                                   3394 ;       AFT         ( a -- a A )
                                   3395 ;       Jump to THEN in a FOR-AFT-THEN-NEXT loop the first time through.
      00930E 92 EF                 3396         .word      LINK
                           001290  3397 LINK = . 
      009310 83                    3398 	.byte      IMEDD+3
      009311 41 46 54              3399         .ascii     "AFT"
      009314                       3400 AFT:
      009314 CD 82 DD         [ 4] 3401         CALL     DROP
      009317 CD 92 C4         [ 4] 3402         CALL     AHEAD
      00931A CD 88 BD         [ 4] 3403         CALL     HERE
                           000001  3404 .if PICATOUT_MOD 
      00931D CD 84 5C         [ 4] 3405         call ADRADJ 
                                   3406 .endif ; PICATOUT_MOD
      009320 CC 82 F7         [ 2] 3407         JP     SWAPP
                                   3408 
                                   3409 ;       ABORT"      ( -- ; <string> )
                                   3410 ;       Conditional abort with an error message.
      009323 93 10                 3411         .word      LINK
                           0012A5  3412 LINK = . 
      009325 86                    3413 	.byte      IMEDD+6
      009326 41 42 4F 52 54        3414         .ascii     "ABORT"
      00932B 22                    3415         .byte      '"'
      00932C                       3416 ABRTQ:
      00932C CD 91 D3         [ 4] 3417         CALL     COMPI
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



      00932F CD 90 51         [ 4] 3418         CALL     ABORQ
      009332 CC 92 01         [ 2] 3419         JP     STRCQ
                                   3420 
                                   3421 ;       $"     ( -- ; <string> )
                                   3422 ;       Compile an inline string literal.
      009335 93 25                 3423         .word      LINK
                           0012B7  3424 LINK = . 
      009337 82                    3425 	.byte      IMEDD+2
      009338 24 22                 3426         .byte     '$','"'
      00933A                       3427 STRQ:
      00933A CD 91 D3         [ 4] 3428         CALL     COMPI
      00933D CD 8C 6B         [ 4] 3429         CALL     STRQP
      009340 CC 92 01         [ 2] 3430         JP     STRCQ
                                   3431 
                                   3432 ;       ."          ( -- ; <string> )
                                   3433 ;       Compile an inline string literal to be typed out at run time.
      009343 93 37                 3434         .word      LINK
                           0012C5  3435 LINK = . 
      009345 82                    3436 	.byte      IMEDD+2
      009346 2E 22                 3437         .byte     '.','"'
      009348                       3438 DOTQ:
      009348 CD 91 D3         [ 4] 3439         CALL     COMPI
      00934B CD 8C 75         [ 4] 3440         CALL     DOTQP
      00934E CC 92 01         [ 2] 3441         JP     STRCQ
                                   3442 
                                   3443 ;; Name compiler
                                   3444 
                                   3445 ;       ?UNIQUE ( a -- a )
                                   3446 ;       Display a warning message
                                   3447 ;       if word already exists.
      009351 93 45                 3448         .word      LINK
                           0012D3  3449 LINK = . 
      009353 07                    3450         .byte      7
      009354 3F 55 4E 49 51 55 45  3451         .ascii     "?UNIQUE"
      00935B                       3452 UNIQU:
      00935B CD 82 E7         [ 4] 3453         CALL     DUPP
      00935E CD 8F 45         [ 4] 3454         CALL     NAMEQ   ;?name exists
      009361 CD 81 EB         [ 4] 3455         CALL     QBRAN
      009364 93 7A                 3456         .word      UNIQ1
      009366 CD 8C 75         [ 4] 3457         CALL     DOTQP   ;redef are OK
      009369 07                    3458         .byte       7
      00936A 20 72 65 44 65 66 20  3459         .ascii     " reDef "       
      009371 CD 83 11         [ 4] 3460         CALL     OVER
      009374 CD 88 A6         [ 4] 3461         CALL     COUNT
      009377 CD 8C 18         [ 4] 3462         CALL     TYPES   ;just in case
      00937A CC 82 DD         [ 2] 3463 UNIQ1:  JP     DROP
                                   3464 
                                   3465 ;       $,n     ( na -- )
                                   3466 ;       Build a new dictionary name
                                   3467 ;       using string at na.
                           000001  3468 .if PICATOUT_MOD
                                   3469 ; compile dans l'espace des variables 
                                   3470 .endif 
      00937D 93 53                 3471         .word      LINK
                           0012FF  3472 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      00937F 03                    3473         .byte      3
      009380 24 2C 6E              3474         .ascii     "$,n"
      009383                       3475 SNAME:
      009383 CD 82 E7         [ 4] 3476         CALL     DUPP
      009386 CD 82 5E         [ 4] 3477         CALL     CAT     ;?null input
      009389 CD 81 EB         [ 4] 3478         CALL     QBRAN
      00938C 93 B9                 3479         .word      PNAM1
      00938E CD 93 5B         [ 4] 3480         CALL     UNIQU   ;?redefinition
      009391 CD 82 E7         [ 4] 3481         CALL     DUPP
      009394 CD 88 A6         [ 4] 3482         CALL     COUNT
      009397 CD 84 BD         [ 4] 3483         CALL     PLUS
      00939A CD 84 23         [ 4] 3484         CALL     VPP
      00939D CD 82 29         [ 4] 3485         CALL     STORE
      0093A0 CD 82 E7         [ 4] 3486         CALL     DUPP
      0093A3 CD 84 41         [ 4] 3487         CALL     LAST
      0093A6 CD 82 29         [ 4] 3488         CALL     STORE   ;save na for vocabulary link
      0093A9 CD 87 80         [ 4] 3489         CALL     CELLM   ;link address
      0093AC CD 84 15         [ 4] 3490         CALL     CNTXT
      0093AF CD 82 40         [ 4] 3491         CALL     AT
      0093B2 CD 82 F7         [ 4] 3492         CALL     SWAPP
      0093B5 CD 82 29         [ 4] 3493         CALL     STORE
      0093B8 81               [ 4] 3494         RET     ;save code pointer
      0093B9 CD 8C 6B         [ 4] 3495 PNAM1:  CALL     STRQP
      0093BC 05                    3496         .byte      5
      0093BD 20 6E 61 6D 65        3497         .ascii     " name" ;null input
      0093C2 CC 90 59         [ 2] 3498         JP     ABOR1
                                   3499 
                                   3500 ;; FORTH compiler
                                   3501 
                                   3502 ;       $COMPILE        ( a -- )
                                   3503 ;       Compile next word to
                                   3504 ;       dictionary as a token or literal.
      0093C5 93 7F                 3505         .word      LINK
                           001347  3506 LINK = . 
      0093C7 08                    3507         .byte      8
      0093C8 24 43 4F 4D 50 49 4C  3508         .ascii     "$COMPILE"
             45
      0093D0                       3509 SCOMP:
      0093D0 CD 8F 45         [ 4] 3510         CALL     NAMEQ
      0093D3 CD 84 6C         [ 4] 3511         CALL     QDUP    ;?defined
      0093D6 CD 81 EB         [ 4] 3512         CALL     QBRAN
      0093D9 93 F1                 3513         .word      SCOM2
      0093DB CD 82 40         [ 4] 3514         CALL     AT
      0093DE CD 81 B8         [ 4] 3515         CALL     DOLIT
      0093E1 80 00                 3516         .word     0x8000	;  IMEDD*256
      0093E3 CD 83 33         [ 4] 3517         CALL     ANDD    ;?immediate
      0093E6 CD 81 EB         [ 4] 3518         CALL     QBRAN
      0093E9 93 EE                 3519         .word      SCOM1
      0093EB CC 82 12         [ 2] 3520         JP     EXECU
      0093EE CC 94 3B         [ 2] 3521 SCOM1:  JP     JSRC
      0093F1 CD 8A E3         [ 4] 3522 SCOM2:  CALL     NUMBQ   ;try to convert to number
      0093F4 CD 81 EB         [ 4] 3523         CALL     QBRAN
      0093F7 90 59                 3524         .word      ABOR1
      0093F9 CC 91 F2         [ 2] 3525         JP     LITER
                                   3526 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



                                   3527 ;       OVERT   ( -- )
                                   3528 ;       Link a new word into vocabulary.
      0093FC 93 C7                 3529         .word      LINK
                           00137E  3530 LINK = . 
      0093FE 05                    3531         .byte      5
      0093FF 4F 56 45 52 54        3532         .ascii     "OVERT"
      009404                       3533 OVERT:
      009404 CD 84 41         [ 4] 3534         CALL     LAST
      009407 CD 82 40         [ 4] 3535         CALL     AT
      00940A CD 84 15         [ 4] 3536         CALL     CNTXT
      00940D CC 82 29         [ 2] 3537         JP     STORE
                                   3538 
                                   3539 ;       ;       ( -- )
                                   3540 ;       Terminate a colon definition.
      009410 93 FE                 3541         .word      LINK
                           001392  3542 LINK = . 
      009412 C1                    3543 	.byte      IMEDD+COMPO+1
      009413 3B                    3544         .ascii     ";"
      009414                       3545 SEMIS:
      009414 CD 91 D3         [ 4] 3546         CALL     COMPI
      009417 CD 82 22         [ 4] 3547         CALL     EXIT
      00941A CD 90 BA         [ 4] 3548         CALL     LBRAC
                           000001  3549 .if PICATOUT_MOD
      00941D CD 94 04         [ 4] 3550         call OVERT 
      009420 CD 9C 55         [ 4] 3551         CALL FMOVE 
      009423 81               [ 4] 3552         RET 
                           000000  3553 .else 
                                   3554         JP     OVERT
                                   3555 .endif 
                                   3556 
                                   3557 ;       ]       ( -- )
                                   3558 ;       Start compiling words in
                                   3559 ;       input stream.
      009424 94 12                 3560         .word      LINK
                           0013A6  3561 LINK = . 
      009426 01                    3562         .byte      1
      009427 5D                    3563         .ascii     "]"
      009428                       3564 RBRAC:
      009428 CD 81 B8         [ 4] 3565         CALL   DOLIT
      00942B 93 D0                 3566         .word  SCOMP
      00942D CD 83 F3         [ 4] 3567         CALL   TEVAL
      009430 CC 82 29         [ 2] 3568         JP     STORE
                                   3569 
                                   3570 ;       CALL,    ( ca -- )
                                   3571 ;       Compile a subroutine call.
      009433 94 26                 3572         .word      LINK
                           0013B5  3573 LINK = . 
      009435 04                    3574         .byte      4
      009436 43 41 4C 4C 2C        3575         .ascii     "CALL,"
      00943B                       3576 JSRC:
      00943B CD 81 B8         [ 4] 3577         CALL     DOLIT
      00943E 00 CD                 3578         .word     CALLL     ;CALL
      009440 CD 91 A5         [ 4] 3579         CALL     CCOMMA
      009443 CC 91 8E         [ 2] 3580         JP     COMMA
                                   3581 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



                                   3582 ;       :       ( -- ; <string> )
                                   3583 ;       Start a new colon definition
                                   3584 ;       using next word as its name.
      009446 94 35                 3585         .word      LINK
                           0013C8  3586 LINK = . 
      009448 01                    3587         .byte      1
      009449 3A                    3588         .ascii     ":"
      00944A                       3589 COLON:
                           000001  3590 .if PICATOUT_MOD
                                   3591 ; compute offset to adjust jump address 
      00944A CD 84 31         [ 4] 3592         call CPP 
      00944D CD 82 40         [ 4] 3593         call AT 
      009450 CD 88 BD         [ 4] 3594         call HERE
      009453 CD 85 1B         [ 4] 3595         call SUBB 
      009456 CD 84 53         [ 4] 3596         call OFFSET 
      009459 CD 82 29         [ 4] 3597         call STORE 
                                   3598 .endif ; PICATOUT_MOD
      00945C CD 8E 48         [ 4] 3599         CALL   TOKEN
      00945F CD 93 83         [ 4] 3600         CALL   SNAME
      009462 CC 94 28         [ 2] 3601         JP     RBRAC
                                   3602 
                                   3603 ;       IMMEDIATE       ( -- )
                                   3604 ;       Make last compiled word
                                   3605 ;       an immediate word.
      009465 94 48                 3606         .word      LINK
                           0013E7  3607 LINK = . 
      009467 09                    3608         .byte      9
      009468 49 4D 4D 45 44 49 41  3609         .ascii     "IMMEDIATE"
             54 45
      009471                       3610 IMMED:
      009471 CD 81 B8         [ 4] 3611         CALL     DOLIT
      009474 80 00                 3612         .word     0x8000	;  IMEDD*256
      009476 CD 84 41         [ 4] 3613         CALL     LAST
      009479 CD 82 40         [ 4] 3614         CALL     AT
      00947C CD 82 40         [ 4] 3615         CALL     AT
      00947F CD 83 47         [ 4] 3616         CALL     ORR
      009482 CD 84 41         [ 4] 3617         CALL     LAST
      009485 CD 82 40         [ 4] 3618         CALL     AT
      009488 CC 82 29         [ 2] 3619         JP     STORE
                                   3620 
                                   3621 ;; Defining words
                                   3622 
                                   3623 ;       CREATE  ( -- ; <string> )
                                   3624 ;       Compile a new array
                                   3625 ;       without allocating space.
      00948B 94 67                 3626         .word      LINK
                           00140D  3627 LINK = . 
      00948D 06                    3628         .byte      6
      00948E 43 52 45 41 54 45     3629         .ascii     "CREATE"
      009494                       3630 CREAT:
      009494 CD 8E 48         [ 4] 3631         CALL     TOKEN
      009497 CD 93 83         [ 4] 3632         CALL     SNAME
      00949A CD 94 04         [ 4] 3633         CALL     OVERT        
      00949D CD 91 D3         [ 4] 3634         CALL     COMPI 
      0094A0 CD 83 94         [ 4] 3635         CALL     DOVAR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



      0094A3 81               [ 4] 3636         RET
                                   3637 
                                   3638 ;       VARIABLE        ( -- ; <string> )
                                   3639 ;       Compile a new variable
                                   3640 ;       initialized to 0.
      0094A4 94 8D                 3641         .word      LINK
                           001426  3642 LINK = . 
      0094A6 08                    3643         .byte      8
      0094A7 56 41 52 49 41 42 4C  3644         .ascii     "VARIABLE"
             45
      0094AF                       3645 VARIA:
                           000001  3646 .if PICATOUT_MOD
                                   3647 ; indirect variable so that VARIABLE definition can be compiled in FLASH 
      0094AF CD 88 BD         [ 4] 3648         CALL HERE
      0094B2 CD 82 E7         [ 4] 3649         CALL DUPP 
      0094B5 CD 87 71         [ 4] 3650         CALL CELLP
      0094B8 CD 84 23         [ 4] 3651         CALL VPP 
      0094BB CD 82 29         [ 4] 3652         CALL STORE
      0094BE CD 97 D6         [ 4] 3653         call UPDATVP 
                                   3654 .endif         
      0094C1 CD 94 94         [ 4] 3655         CALL CREAT
      0094C4 CD 82 E7         [ 4] 3656         CALL DUPP
      0094C7 CD 91 8E         [ 4] 3657         CALL COMMA
      0094CA CD 87 D0         [ 4] 3658         CALL ZERO
                           000001  3659 .if PICATOUT_MOD 
      0094CD CD 82 F7         [ 4] 3660         call SWAPP 
      0094D0 CD 82 29         [ 4] 3661         CALL STORE 
      0094D3 CD 9C 55         [ 4] 3662         CALL FMOVE ; move definition to FLASH
      0094D6 81               [ 4] 3663         RET 
                                   3664 .endif ;PICATOUT_MOD        
                                   3665 
                           000001  3666 .if PICATOUT_MOD
                                   3667 ;       CONSTANT  ( n -- ; <string> )
                                   3668 ;       Compile a new constant 
                                   3669 ;       n CONSTANT name 
      0094D7 94 A6                 3670         .word LINK 
                           001459  3671         LINK=. 
      0094D9 08                    3672         .byte 8 
      0094DA 43 4F 4E 53 54 41 4E  3673         .ascii "CONSTANT" 
             54
      0094E2                       3674 CONSTANT:          
      0094E2 CD 8E 48         [ 4] 3675         CALL TOKEN
      0094E5 CD 93 83         [ 4] 3676         CALL SNAME 
      0094E8 CD 94 04         [ 4] 3677         CALL OVERT 
      0094EB CD 91 D3         [ 4] 3678         CALL COMPI 
      0094EE CD 95 02         [ 4] 3679         CALL DOCONST
      0094F1 CD 91 8E         [ 4] 3680         CALL COMMA 
      0094F4 CD 9C 55         [ 4] 3681         CALL FMOVE 
      0094F7 81               [ 4] 3682         RET          
                                   3683 
                                   3684 ; CONSTANT runtime semantic 
                                   3685 ; doCONST  ( -- n )
      0094F8 94 D9                 3686         .word LINK 
                           00147A  3687         LINK=.
      0094FA 07                    3688         .byte 7
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      0094FB 44 4F 43 4F 4E 53 54  3689         .ascii "DOCONST"
      009502                       3690 DOCONST:
      009502 1D 00 02         [ 2] 3691         subw x,#CELLL
      009505 90 85            [ 2] 3692         popw y 
      009507 90 FE            [ 2] 3693         ldw y,(y) 
      009509 FF               [ 2] 3694         ldw (x),y 
      00950A 81               [ 4] 3695         ret 
                                   3696 .endif ;PICATOUT_MOD
                                   3697 
                                   3698 
                                   3699 ;; Tools
                                   3700 
                                   3701 ;       _TYPE   ( b u -- )
                                   3702 ;       Display a string. Filter
                                   3703 ;       non-printing characters.
      00950B 94 FA                 3704         .word      LINK
                           00148D  3705 LINK = . 
      00950D 05                    3706         .byte      5
      00950E 5F 54 59 50 45        3707         .ascii     "_TYPE"
      009513                       3708 UTYPE:
      009513 CD 82 B0         [ 4] 3709         CALL     TOR     ;start count down loop
      009516 20 0F            [ 2] 3710         JRA     UTYP2   ;skip first pass
      009518 CD 82 E7         [ 4] 3711 UTYP1:  CALL     DUPP
      00951B CD 82 5E         [ 4] 3712         CALL     CAT
      00951E CD 87 FA         [ 4] 3713         CALL     TCHAR
      009521 CD 81 A2         [ 4] 3714         CALL     EMIT    ;display only printable
      009524 CD 87 9C         [ 4] 3715         CALL     ONEP    ;increment address
      009527 CD 81 CC         [ 4] 3716 UTYP2:  CALL     DONXT
      00952A 95 18                 3717         .word      UTYP1   ;loop till done
      00952C CC 82 DD         [ 2] 3718         JP     DROP
                                   3719 
                                   3720 ;       dm+     ( a u -- a )
                                   3721 ;       Dump u bytes from ,
                                   3722 ;       leaving a+u on  stack.
      00952F 95 0D                 3723         .word      LINK
                           0014B1  3724 LINK = . 
      009531 03                    3725         .byte      3
      009532 64 6D 2B              3726         .ascii     "dm+"
      009535                       3727 DUMPP:
      009535 CD 83 11         [ 4] 3728         CALL     OVER
      009538 CD 81 B8         [ 4] 3729         CALL     DOLIT
      00953B 00 04                 3730         .word      4
      00953D CD 8C 9E         [ 4] 3731         CALL     UDOTR   ;display address
      009540 CD 8B EE         [ 4] 3732         CALL     SPACE
      009543 CD 82 B0         [ 4] 3733         CALL     TOR     ;start count down loop
      009546 20 11            [ 2] 3734         JRA     PDUM2   ;skip first pass
      009548 CD 82 E7         [ 4] 3735 PDUM1:  CALL     DUPP
      00954B CD 82 5E         [ 4] 3736         CALL     CAT
      00954E CD 81 B8         [ 4] 3737         CALL     DOLIT
      009551 00 03                 3738         .word      3
      009553 CD 8C 9E         [ 4] 3739         CALL     UDOTR   ;display numeric data
      009556 CD 87 9C         [ 4] 3740         CALL     ONEP    ;increment address
      009559 CD 81 CC         [ 4] 3741 PDUM2:  CALL     DONXT
      00955C 95 48                 3742         .word      PDUM1   ;loop till done
      00955E 81               [ 4] 3743         RET
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



                                   3744 
                                   3745 ;       DUMP    ( a u -- )
                                   3746 ;       Dump u bytes from a,
                                   3747 ;       in a formatted manner.
      00955F 95 31                 3748         .word      LINK
                           0014E1  3749 LINK = . 
      009561 04                    3750         .byte      4
      009562 44 55 4D 50           3751         .ascii     "DUMP"
      009566                       3752 DUMP:
      009566 CD 83 A4         [ 4] 3753         CALL     BASE
      009569 CD 82 40         [ 4] 3754         CALL     AT
      00956C CD 82 B0         [ 4] 3755         CALL     TOR
      00956F CD 8A 76         [ 4] 3756         CALL     HEX     ;save radix, set hex
      009572 CD 81 B8         [ 4] 3757         CALL     DOLIT
      009575 00 10                 3758         .word      16
      009577 CD 86 C2         [ 4] 3759         CALL     SLASH   ;change count to lines
      00957A CD 82 B0         [ 4] 3760         CALL     TOR     ;start count down loop
      00957D CD 8C 36         [ 4] 3761 DUMP1:  CALL     CR
      009580 CD 81 B8         [ 4] 3762         CALL     DOLIT
      009583 00 10                 3763         .word      16
      009585 CD 84 A8         [ 4] 3764         CALL     DDUP
      009588 CD 95 35         [ 4] 3765         CALL     DUMPP   ;display numeric
      00958B CD 84 7D         [ 4] 3766         CALL     ROT
      00958E CD 84 7D         [ 4] 3767         CALL     ROT
      009591 CD 8B EE         [ 4] 3768         CALL     SPACE
      009594 CD 8B EE         [ 4] 3769         CALL     SPACE
      009597 CD 95 13         [ 4] 3770         CALL     UTYPE   ;display printable characters
      00959A CD 81 CC         [ 4] 3771         CALL     DONXT
      00959D 95 7D                 3772         .word      DUMP1   ;loop till done
      00959F CD 82 DD         [ 4] 3773 DUMP3:  CALL     DROP
      0095A2 CD 82 91         [ 4] 3774         CALL     RFROM
      0095A5 CD 83 A4         [ 4] 3775         CALL     BASE
      0095A8 CC 82 29         [ 2] 3776         JP     STORE   ;restore radix
                                   3777 
                                   3778 ;       .S      ( ... -- ... )
                                   3779 ;        Display  contents of stack.
      0095AB 95 61                 3780         .word      LINK
                           00152D  3781 LINK = . 
      0095AD 02                    3782         .byte      2
      0095AE 2E 53                 3783         .ascii     ".S"
      0095B0                       3784 DOTS:
      0095B0 CD 8C 36         [ 4] 3785         CALL     CR
      0095B3 CD 88 13         [ 4] 3786         CALL     DEPTH   ;stack depth
      0095B6 CD 82 B0         [ 4] 3787         CALL     TOR     ;start count down loop
      0095B9 20 0C            [ 2] 3788         JRA     DOTS2   ;skip first pass
      0095BB CD 82 A4         [ 4] 3789 DOTS1:  CALL     RAT
      0095BE CD 87 9C         [ 4] 3790         CALL ONEP
      0095C1 CD 88 2A         [ 4] 3791 	CALL     PICK
      0095C4 CD 8C D1         [ 4] 3792         CALL     DOT     ;index stack, display contents
      0095C7 CD 81 CC         [ 4] 3793 DOTS2:  CALL     DONXT
      0095CA 95 BB                 3794         .word      DOTS1   ;loop till done
      0095CC CD 8C 75         [ 4] 3795         CALL     DOTQP
      0095CF 05                    3796         .byte      5
      0095D0 20 3C 73 70 20        3797         .ascii     " <sp "
      0095D5 81               [ 4] 3798         RET
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



                                   3799 
                                   3800 ;       >NAME   ( ca -- na | F )
                                   3801 ;       Convert code address
                                   3802 ;       to a name address.
      0095D6 95 AD                 3803         .word      LINK
                           001558  3804 LINK = . 
      0095D8 05                    3805         .byte      5
      0095D9 3E 4E 41 4D 45        3806         .ascii     ">NAME"
      0095DE                       3807 TNAME:
      0095DE CD 84 15         [ 4] 3808         CALL     CNTXT   ;vocabulary link
      0095E1 CD 82 40         [ 4] 3809 TNAM2:  CALL     AT
      0095E4 CD 82 E7         [ 4] 3810         CALL     DUPP    ;?last word in a vocabulary
      0095E7 CD 81 EB         [ 4] 3811         CALL     QBRAN
      0095EA 96 05                 3812         .word      TNAM4
      0095EC CD 84 A8         [ 4] 3813         CALL     DDUP
      0095EF CD 8E 56         [ 4] 3814         CALL     NAMET
      0095F2 CD 83 5C         [ 4] 3815         CALL     XORR    ;compare
      0095F5 CD 81 EB         [ 4] 3816         CALL     QBRAN
      0095F8 95 FF                 3817         .word      TNAM3
      0095FA CD 87 80         [ 4] 3818         CALL     CELLM   ;continue with next word
      0095FD 20 E2            [ 2] 3819         JRA     TNAM2
      0095FF CD 82 F7         [ 4] 3820 TNAM3:  CALL     SWAPP
      009602 CC 82 DD         [ 2] 3821         JP     DROP
      009605 CD 84 9D         [ 4] 3822 TNAM4:  CALL     DDROP
      009608 CC 87 D0         [ 2] 3823         JP     ZERO
                                   3824 
                                   3825 ;       .ID     ( na -- )
                                   3826 ;        Display  name at address.
      00960B 95 D8                 3827         .word      LINK
                           00158D  3828 LINK = . 
      00960D 03                    3829         .byte      3
      00960E 2E 49 44              3830         .ascii     ".ID"
      009611                       3831 DOTID:
      009611 CD 84 6C         [ 4] 3832         CALL     QDUP    ;if zero no name
      009614 CD 81 EB         [ 4] 3833         CALL     QBRAN
      009617 96 27                 3834         .word      DOTI1
      009619 CD 88 A6         [ 4] 3835         CALL     COUNT
      00961C CD 81 B8         [ 4] 3836         CALL     DOLIT
      00961F 00 1F                 3837         .word      0x1F
      009621 CD 83 33         [ 4] 3838         CALL     ANDD    ;mask lexicon bits
      009624 CC 95 13         [ 2] 3839         JP     UTYPE
      009627 CD 8C 75         [ 4] 3840 DOTI1:  CALL     DOTQP
      00962A 09                    3841         .byte      9
      00962B 20 6E 6F 4E 61 6D 65  3842         .ascii     " noName"
      009632 81               [ 4] 3843         RET
                                   3844 
                           000000  3845 WANT_SEE=0 
                           000000  3846 .if WANT_SEE 
                                   3847 ;       SEE     ( -- ; <string> )
                                   3848 ;       A simple decompiler.
                                   3849 ;       Updated for byte machines.
                                   3850         .word      LINK
                                   3851 LINK = . 
                                   3852         .byte      3
                                   3853         .ascii     "SEE"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



                                   3854 SEE:
                                   3855         CALL     TICK    ;starting address
                                   3856         CALL     CR
                                   3857         CALL     ONEM
                                   3858 SEE1:   CALL     ONEP
                                   3859         CALL     DUPP
                                   3860         CALL     AT
                                   3861         CALL     DUPP    ;?does it contain a zero
                                   3862         CALL     QBRAN
                                   3863         .word    SEE2
                                   3864         CALL     TNAME   ;?is it a name
                                   3865 SEE2:   CALL     QDUP    ;name address or zero
                                   3866         CALL     QBRAN
                                   3867         .word    SEE3
                                   3868         CALL     SPACE
                                   3869         CALL     DOTID   ;display name
                                   3870         CALL     ONEP
                                   3871         JRA      SEE4
                                   3872 SEE3:   CALL     DUPP
                                   3873         CALL     CAT
                                   3874         CALL     UDOT    ;display number
                                   3875 SEE4:   CALL     NUFQ    ;user control
                                   3876         CALL     QBRAN
                                   3877         .word    SEE1
                                   3878         JP     DROP
                                   3879 .endif ; WANT_SEE 
                                   3880 
                                   3881 ;       WORDS   ( -- )
                                   3882 ;       Display names in vocabulary.
      009633 96 0D                 3883         .word      LINK
                           0015B5  3884 LINK = . 
      009635 05                    3885         .byte      5
      009636 57 4F 52 44 53        3886         .ascii     "WORDS"
      00963B                       3887 WORDS:
      00963B CD 8C 36         [ 4] 3888         CALL     CR
      00963E CD 84 15         [ 4] 3889         CALL     CNTXT   ;only in context
      009641 CD 82 40         [ 4] 3890 WORS1:  CALL     AT
      009644 CD 84 6C         [ 4] 3891         CALL     QDUP    ;?at end of list
      009647 CD 81 EB         [ 4] 3892         CALL     QBRAN
      00964A 96 60                 3893         .word      WORS2
      00964C CD 82 E7         [ 4] 3894         CALL     DUPP
      00964F CD 8B EE         [ 4] 3895         CALL     SPACE
      009652 CD 96 11         [ 4] 3896         CALL     DOTID   ;display a name
      009655 CD 87 80         [ 4] 3897         CALL     CELLM
      009658 CD 82 02         [ 4] 3898         CALL     BRAN
      00965B 96 41                 3899         .word      WORS1
      00965D CD 82 DD         [ 4] 3900         CALL     DROP
      009660 81               [ 4] 3901 WORS2:  RET
                                   3902 
                                   3903         
                                   3904 ;; Hardware reset
                                   3905 
                                   3906 ;       hi      ( -- )
                                   3907 ;       Display sign-on message.
      009661 96 35                 3908         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



                           0015E3  3909 LINK = . 
      009663 02                    3910         .byte      2
      009664 68 69                 3911         .ascii     "hi"
      009666                       3912 HI:
      009666 CD 8C 36         [ 4] 3913         CALL     CR
      009669 CD 8C 75         [ 4] 3914         CALL     DOTQP   ;initialize I/O
      00966C 0F                    3915         .byte      15
      00966D 73 74 6D 38 65 46 6F  3916         .ascii     "stm8eForth v"
             72 74 68 20 76
      009679 32                    3917 	.byte      VER+'0'
      00967A 2E                    3918         .byte      '.' 
      00967B 31                    3919 	.byte      EXT+'0' ;version
      00967C CC 8C 36         [ 2] 3920         JP     CR
                                   3921 
                           000000  3922 WANT_DEBUG=0
                           000000  3923 .if WANT_DEBUG 
                                   3924 ;       DEBUG      ( -- )
                                   3925 ;       Display sign-on message.
                                   3926 ;        .word      LINK
                                   3927 LINK = . 
                                   3928         .byte      5
                                   3929         .ascii     "DEBUG"
                                   3930 DEBUG:
                                   3931 	CALL DOLIT
                                   3932 	.word 0x65
                                   3933 	CALL EMIT
                                   3934 	CALL DOLIT
                                   3935 	.word 0
                                   3936  	CALL ZLESS 
                                   3937 	CALL DOLIT
                                   3938 	.word 0xFFFE
                                   3939 	CALL ZLESS 
                                   3940 	CALL UPLUS 
                                   3941  	CALL DROP 
                                   3942 	CALL DOLIT
                                   3943 	.word 3
                                   3944 	CALL UPLUS 
                                   3945 	CALL UPLUS 
                                   3946  	CALL DROP
                                   3947 	CALL DOLIT
                                   3948 	.word 0x43
                                   3949 	CALL UPLUS 
                                   3950  	CALL DROP
                                   3951 	CALL EMIT
                                   3952 	CALL DOLIT
                                   3953 	.word 0x4F
                                   3954 	CALL DOLIT
                                   3955 	.word 0x6F
                                   3956  	CALL XORR
                                   3957 	CALL DOLIT
                                   3958 	.word 0xF0
                                   3959  	CALL ANDD
                                   3960 	CALL DOLIT
                                   3961 	.word 0x4F
                                   3962  	CALL ORR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



                                   3963 	CALL EMIT
                                   3964 	CALL DOLIT
                                   3965 	.word 8
                                   3966 	CALL DOLIT
                                   3967 	.word 6
                                   3968  	CALL SWAPP
                                   3969 	CALL OVER
                                   3970 	CALL XORR
                                   3971 	CALL DOLIT
                                   3972 	.word 3
                                   3973 	CALL ANDD 
                                   3974 	CALL ANDD
                                   3975 	CALL DOLIT
                                   3976 	.word 0x70
                                   3977 	CALL UPLUS 
                                   3978 	CALL DROP
                                   3979 	CALL EMIT
                                   3980 	CALL DOLIT
                                   3981 	.word 0
                                   3982 	CALL QBRAN
                                   3983 	.word DEBUG1
                                   3984 	CALL DOLIT
                                   3985 	.word 0x3F
                                   3986 DEBUG1:
                                   3987 	CALL DOLIT
                                   3988 	.word 0xFFFF
                                   3989 	CALL QBRAN
                                   3990 	.word DEBUG2
                                   3991 	CALL DOLIT
                                   3992 	.word 0x74
                                   3993 	CALL BRAN
                                   3994 	.word DEBUG3
                                   3995 DEBUG2:
                                   3996 	CALL DOLIT
                                   3997 	.word 0x21
                                   3998 DEBUG3:
                                   3999 	CALL EMIT
                                   4000 	CALL DOLIT
                                   4001 	.word 0x68
                                   4002 	CALL DOLIT
                                   4003 	.word 0x80
                                   4004 	CALL STORE
                                   4005 	CALL DOLIT
                                   4006 	.word 0x80
                                   4007 	CALL AT
                                   4008 	CALL EMIT
                                   4009 	CALL DOLIT
                                   4010 	.word 0x4D
                                   4011 	CALL TOR
                                   4012 	CALL RAT
                                   4013 	CALL RFROM
                                   4014 	CALL ANDD
                                   4015 	CALL EMIT
                                   4016 	CALL DOLIT
                                   4017 	.word 0x61
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



                                   4018 	CALL DOLIT
                                   4019 	.word 0xA
                                   4020 	CALL TOR
                                   4021 DEBUG4:
                                   4022 	CALL DOLIT
                                   4023 	.word 1
                                   4024 	CALL UPLUS 
                                   4025 	CALL DROP
                                   4026 	CALL DONXT
                                   4027 	.word DEBUG4
                                   4028 	CALL EMIT
                                   4029 	CALL DOLIT
                                   4030 	.word 0x656D
                                   4031 	CALL DOLIT
                                   4032 	.word 0x100
                                   4033 	CALL UMSTA
                                   4034 	CALL SWAPP
                                   4035 	CALL DOLIT
                                   4036 	.word 0x100
                                   4037 	CALL UMSTA
                                   4038 	CALL SWAPP 
                                   4039 	CALL DROP
                                   4040 	CALL EMIT
                                   4041 	CALL EMIT
                                   4042 	CALL DOLIT
                                   4043 	.word 0x2043
                                   4044 	CALL DOLIT
                                   4045 	.word 0
                                   4046 	CALL DOLIT
                                   4047 	.word 0x100
                                   4048 	CALL UMMOD
                                   4049 	CALL EMIT
                                   4050 	CALL EMIT
                                   4051 	;JP ORIG
                                   4052 	RET
                                   4053 .endif ; WANT_DEBUG 
                                   4054 
                                   4055 
                                   4056 ;       'BOOT   ( -- a )
                                   4057 ;       The application startup vector.
      00967F 96 63                 4058         .word      LINK
                           001601  4059 LINK = . 
      009681 05                    4060         .byte      5
      009682 27 42 4F 4F 54        4061         .ascii     "'BOOT"
      009687                       4062 TBOOT:
      009687 CD 83 94         [ 4] 4063         CALL     DOVAR
      00968A 40 02                 4064         .word    APP_RUN      ;application to boot
                                   4065 
                                   4066 ;       COLD    ( -- )
                                   4067 ;       The hilevel cold start s=ence.
      00968C 96 81                 4068         .word      LINK
                           00160E  4069 LINK = . 
      00968E 04                    4070         .byte      4
      00968F 43 4F 4C 44           4071         .ascii     "COLD"
      009693                       4072 COLD:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



                           000000  4073 .if WANT_DEBUG
                                   4074         CALL DEBUG
                                   4075 .endif 
      009693 CD 81 B8         [ 4] 4076 COLD1:  CALL     DOLIT
      009696 80 A7                 4077         .word      UZERO
      009698 CD 81 B8         [ 4] 4078 	CALL     DOLIT
      00969B 00 06                 4079         .word      UPP
      00969D CD 81 B8         [ 4] 4080         CALL     DOLIT
      0096A0 00 16                 4081 	.word      UEND-UZERO
      0096A2 CD 89 0A         [ 4] 4082         CALL     CMOVE   ;initialize user area
                                   4083 
                           000001  4084 .if PICATOUT_MOD
                                   4085 ; if APP_RUN==0 initialize with ca de 'hi'  
      0096A5 90 CE 40 02      [ 2] 4086         ldw y,APP_RUN 
      0096A9 26 0B            [ 1] 4087         jrne 0$
      0096AB 1D 00 02         [ 2] 4088         subw x,#CELLL 
      0096AE 90 AE 96 66      [ 2] 4089         ldw y,#HI  
      0096B2 FF               [ 2] 4090         ldw (x),y
      0096B3 CD 97 AE         [ 4] 4091         call UPDATRUN 
      0096B6                       4092 0$:        
                                   4093 ; update LAST with APP_LAST 
                                   4094 ; if APP_LAST > LAST else do the opposite
      0096B6 90 CE 40 00      [ 2] 4095         ldw y,APP_LAST 
      0096BA 90 B3 1A         [ 2] 4096         cpw y,ULAST 
      0096BD 22 05            [ 1] 4097         jrugt 1$ 
                                   4098 ; save LAST at APP_LAST  
      0096BF CD 97 96         [ 4] 4099         call UPDATLAST 
      0096C2 20 06            [ 2] 4100         jra 2$
      0096C4                       4101 1$: ; update LAST with APP_LAST 
      0096C4 90 BF 1A         [ 2] 4102         ldw ULAST,y
      0096C7 90 BF 14         [ 2] 4103         ldw UCNTXT,y 
      0096CA                       4104 2$:  
                                   4105 ; update APP_CP if < app_space 
      0096CA 90 CE 40 04      [ 2] 4106         ldw y,APP_CP  
      0096CE 90 B3 18         [ 2] 4107         cpw y,UCP   
      0096D1 24 06            [ 1] 4108         jruge 3$ 
      0096D3 CD 97 BF         [ 4] 4109         call UPDATCP
      0096D6 90 BE 18         [ 2] 4110         ldw y,UCP   
      0096D9                       4111 3$:
      0096D9 90 BF 18         [ 2] 4112         ldw UCP,y                 
                                   4113 ; update UVP with APP_VP  
                                   4114 ; if APP_VP>UVP else do the opposite 
      0096DC 90 CE 40 06      [ 2] 4115         ldw y,APP_VP 
      0096E0 90 B3 16         [ 2] 4116         cpw y,UVP 
      0096E3 22 05            [ 1] 4117         jrugt 4$
      0096E5 CD 97 D6         [ 4] 4118         call UPDATVP 
      0096E8 20 03            [ 2] 4119         jra 6$
      0096EA                       4120 4$: ; update UVP with APP_VP 
      0096EA 90 BF 16         [ 2] 4121         ldw UVP,y 
      0096ED                       4122 6$:      
                                   4123 .endif ; PICATOUT_MOD
      0096ED CD 91 39         [ 4] 4124         CALL     PRESE   ;initialize data stack and TIB
      0096F0 CD 96 87         [ 4] 4125         CALL     TBOOT
      0096F3 CD 88 F3         [ 4] 4126         CALL     ATEXE   ;application boot
      0096F6 CD 94 04         [ 4] 4127         CALL     OVERT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



      0096F9 CC 91 56         [ 2] 4128         JP     QUIT    ;start interpretation
                                   4129 
                           000001  4130 .if PICATOUT_MOD
                                   4131         ; keep this include at end 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



                                   4132         .include "flash.asm"
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
      0096FC 96 8E                   30     .word LINK 
                           00167E    31     LINK=.
      0096FE 03                      32     .byte 3 
      0096FF 46 50 21                33     .ascii "FP!"
      009702                         34 fptr_store:
      009702 90 93            [ 1]   35     ldw y,x
      009704 90 FE            [ 2]   36     ldw y,(y)
      009706 90 9F            [ 1]   37     ld a,yl 
      009708 B7 2E            [ 1]   38     ld FPTR,a 
      00970A 1C 00 02         [ 2]   39     addw x,#CELLL 
      00970D 90 93            [ 1]   40     ldw y,x 
      00970F 90 FE            [ 2]   41     ldw y,(y)
      009711 90 BF 2F         [ 2]   42     ldw PTR16,y
      009714 1C 00 02         [ 2]   43     addw x,#CELLL 
      009717 81               [ 4]   44     ret 
                                     45 
                                     46 ;-----------------------------------
                                     47 ; return EEPROM base address 
                                     48 ; as a double 
                                     49 ;  EEPROM  ( -- ud )
                                     50 ;-----------------------------------
      009718 96 FE                   51     .word LINK 
                           00169A    52 LINK=.
      00971A 06                      53     .byte 6 
      00971B 45 45 50 52 4F 4D       54     .ascii "EEPROM"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



      009721                         55 EEPROM: 
      009721 90 AE 40 00      [ 2]   56     ldw y,#EEPROM_BASE
      009725 1D 00 04         [ 2]   57     subw x,#2*CELLL 
      009728 EF 02            [ 2]   58     ldw (2,x),y 
      00972A 90 5F            [ 1]   59     clrw y 
      00972C FF               [ 2]   60     ldw (x),y 
      00972D 81               [ 4]   61     ret
                                     62 
                                     63 ;---------------------------------
                                     64 ; return APP_LAST pointer as double
                                     65 ; EEP-LAST ( -- ud )
                                     66 ;---------------------------------
      00972E 97 1A                   67 	.word LINK 
                           0016B0    68 	LINK=.
      009730 08                      69 	.byte 8 
      009731 45 45 50 2D 4C 41 53    70 	.ascii "EEP-LAST"
             54
      009739                         71 EEPLAST:
      009739 1D 00 04         [ 2]   72 	subw x,#2*CELLL 
      00973C 90 AE 40 00      [ 2]   73 	ldw y,#APP_LAST 
      009740 EF 02            [ 2]   74 	ldw (2,x),y 
      009742 90 5F            [ 1]   75 	clrw y 
      009744 FF               [ 2]   76 	ldw (x),y 
      009745 81               [ 4]   77 	ret 
                                     78 
                                     79 ;----------------------------------
                                     80 ; return APP_RUN pointer as double	
                                     81 ; EEP-RUN ( -- ud )
                                     82 ;-----------------------------------
      009746 97 30                   83 	.word LINK 
                           0016C8    84 	LINK=.
      009748 07                      85 	.byte 7
      009749 45 45 50 2D 52 55 4E    86 	.ascii "EEP-RUN"
      009750                         87 EEPRUN:
      009750 1D 00 04         [ 2]   88 	subw x,#2*CELLL 
      009753 90 AE 40 02      [ 2]   89 	ldw y,#APP_RUN 
      009757 EF 02            [ 2]   90 	ldw (2,x),y 
      009759 90 5F            [ 1]   91 	clrw y 
      00975B FF               [ 2]   92 	ldw (x),y 
      00975C 81               [ 4]   93 	ret 
                                     94 
                                     95 ;------------------------------------
                                     96 ; return APP_CP pointer as double 
                                     97 ; EEP-CP ( -- ud )
                                     98 ;------------------------------------
      00975D 97 48                   99 	.word LINK
                           0016DF   100 	LINK=.
      00975F 06                     101 	.byte 6 
      009760 45 45 50 2D 43 50      102 	.ascii "EEP-CP"
      009766                        103 EEPCP:
      009766 1D 00 04         [ 2]  104 	subw x,#2*CELLL 
      009769 90 AE 40 04      [ 2]  105 	ldw y,#APP_CP  
      00976D EF 02            [ 2]  106 	ldw (2,x),y 
      00976F 90 5F            [ 1]  107 	clrw y 
      009771 FF               [ 2]  108 	ldw (x),y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



      009772 81               [ 4]  109 	ret 
                                    110 
                                    111 ;------------------------------------
                                    112 ; return APP_VP pointer as double 
                                    113 ; EEP-VP ( -- ud )
                                    114 ;-------------------------------------
      009773 97 5F                  115 	.word LINK
                           0016F5   116 	LINK=.
      009775 06                     117 	.byte 6
      009776 45 45 50 2D 56 50      118 	.ascii "EEP-VP"
      00977C                        119 EEPVP:
      00977C 1D 00 04         [ 2]  120 	subw x,#2*CELLL 
      00977F 90 AE 40 06      [ 2]  121 	ldw y,#APP_VP  
      009783 EF 02            [ 2]  122 	ldw (2,x),y 
      009785 90 5F            [ 1]  123 	clrw y 
      009787 FF               [ 2]  124 	ldw (x),y 
      009788 81               [ 4]  125 	ret 
                                    126 
                                    127 ;----------------------------------
                                    128 ; update APP_LAST with LAST 
                                    129 ; UPDAT-LAST ( -- )
                                    130 ;----------------------------------
      009789 97 75                  131 	.word LINK 
                           00170B   132 	LINK=.
      00978B 0A                     133 	.byte 10
      00978C 55 50 44 41 54 2D 4C   134 	.ascii "UPDAT-LAST"
             41 53 54
      009796                        135 UPDATLAST:
      009796 CD 84 41         [ 4]  136 	call LAST
      009799 CD 82 40         [ 4]  137 	call AT  
      00979C CD 97 39         [ 4]  138 	call EEPLAST
      00979F CC 99 12         [ 2]  139 	jp ee_store 
                                    140 
                                    141 ;---------------------------------
                                    142 ; update APP_RUN 
                                    143 ; UPDAT-RUN ( a -- )
                                    144 ;---------------------------------
      0097A2 97 8B                  145 	.word LINK
                           001724   146 	LINK=.
      0097A4 09                     147 	.byte 9
      0097A5 55 50 44 41 54 2D 52   148 	.ascii "UPDAT-RUN"
             55 4E
      0097AE                        149 UPDATRUN:
      0097AE CD 97 50         [ 4]  150 	call EEPRUN
      0097B1 CC 99 12         [ 2]  151 	jp ee_store 
                                    152 	
                                    153 ;---------------------------------
                                    154 ; update APP_CP with CP 
                                    155 ; UPDAT-CP ( -- )
                                    156 ;---------------------------------
      0097B4 97 A4                  157 	.word LINK 
                           001736   158 	LINK=.
      0097B6 08                     159 	.byte 8 
      0097B7 55 50 44 41 54 2D 43   160 	.ascii "UPDAT-CP"
             50
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



      0097BF                        161 UPDATCP:
      0097BF CD 84 31         [ 4]  162 	call CPP 
      0097C2 CD 82 40         [ 4]  163 	call AT 
      0097C5 CD 97 66         [ 4]  164 	call EEPCP 
      0097C8 CC 99 12         [ 2]  165 	jp ee_store 
                                    166 
                                    167 ;----------------------------------
                                    168 ; update APP_VP with VP 
                                    169 ; UPDAT-VP ( -- )
                                    170 ;----------------------------------
      0097CB 97 B6                  171 	.word LINK
                           00174D   172 	LINK=.
      0097CD 08                     173 	.byte 8 
      0097CE 55 50 44 41 54 2D 56   174 	.ascii "UPDAT-VP" 
             50
      0097D6                        175 UPDATVP:
      0097D6 CD 84 23         [ 4]  176 	call VPP 
      0097D9 CD 82 40         [ 4]  177 	call AT
      0097DC CD 97 7C         [ 4]  178 	call EEPVP 
      0097DF CC 99 12         [ 2]  179 	jp ee_store
                                    180 	
                                    181 
                                    182 ;----------------------------------
                                    183 ; fetch integer at address over 65535
                                    184 ;  F@   ( ud -- n )
                                    185 ;----------------------------------
      0097E2 97 CD                  186     .word LINK 
                           001764   187 LINK=.
      0097E4 02                     188     .byte 2
      0097E5 46 40                  189     .ascii "F@"
      0097E7                        190 farat:
      0097E7 CD 97 02         [ 4]  191     call fptr_store
      0097EA 92 BC 00 2E      [ 5]  192     ldf a,[FPTR]
      0097EE 1D 00 02         [ 2]  193     subw x,#CELLL 
      0097F1 F7               [ 1]  194     ld (x),a 
      0097F2 90 AE 00 01      [ 2]  195     ldw y,#1
      0097F6 91 AF 00 2E      [ 1]  196     ldf a,([FPTR],y)
      0097FA E7 01            [ 1]  197     ld (1,x),a
      0097FC 81               [ 4]  198     ret 
                                    199 
                                    200 ;-------------------------------------
                                    201 ; fetch C at address over 65535 
                                    202 ; FC@ ( ud -- c)
                                    203 ;-------------------------------------
      0097FD 97 E4                  204     .word LINK
                           00177F   205     LINK=.
      0097FF 03                     206     .byte 3 
      009800 46 43 40               207     .ascii "FC@" 
      009803                        208 farcat:
      009803 CD 97 02         [ 4]  209     call fptr_store 
      009806 92 BC 00 2E      [ 5]  210     ldf a,[FPTR]
      00980A 1D 00 02         [ 2]  211     subw x,#CELLL 
      00980D E7 01            [ 1]  212     ld (1,x),a 
      00980F 7F               [ 1]  213     clr (x)
      009810 81               [ 4]  214     ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



                                    215     
                                    216 ;----------------------------------
                                    217 ; unlock EEPROM/OPT for writing/erasing
                                    218 ; wait endlessly for FLASH_IAPSR_DUL bit.
                                    219 ;  UNLKEE   ( -- )
                                    220 ;----------------------------------
      009811 97 FF                  221     .word LINK 
                           001793   222 LINK=.
      009813 06                     223     .byte 6 
      009814 55 4E 4C 4B 45 45      224     .ascii "UNLKEE"
      00981A                        225 unlock_eeprom:
      00981A 35 00 50 5B      [ 1]  226 	mov FLASH_CR2,#0 
      00981E 35 FF 50 5C      [ 1]  227 	mov FLASH_NCR2,#0xFF 
      009822 35 AE 50 64      [ 1]  228 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      009826 35 56 50 64      [ 1]  229     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      00982A 72 07 50 5F FB   [ 2]  230 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      00982F 81               [ 4]  231 	ret
                                    232 
                                    233 ;----------------------------------
                                    234 ; unlock FLASH for writing/erasing
                                    235 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                    236 ; UNLKFL  ( -- )
                                    237 ;----------------------------------
      009830 98 13                  238     .word LINK 
                           0017B2   239 LINK=. 
      009832 06                     240     .byte 6 
      009833 55 4E 4C 4B 46 4C      241     .ascii "UNLKFL"    
      009839                        242 unlock_flash:
      009839 35 00 50 5B      [ 1]  243 	mov FLASH_CR2,#0 
      00983D 35 FF 50 5C      [ 1]  244 	mov FLASH_NCR2,#0xFF 
      009841 35 56 50 62      [ 1]  245 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      009845 35 AE 50 62      [ 1]  246 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      009849 72 03 50 5F FB   [ 2]  247 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      00984E 81               [ 4]  248 	ret
                                    249 
                                    250 ;-----------------------------
                                    251 ; unlock FLASH or EEPROM 
                                    252 ; according to FPTR address 
                                    253 ;  UNLOCK ( -- )
                                    254 ;-----------------------------
      00984F 98 32                  255 	.word LINK 
                           0017D1   256 	LINK=.
      009851 06                     257 	.byte 6
      009852 55 4E 4C 4F 43 4B      258 	.ascii "UNLOCK"
      009858                        259 unlock:
                                    260 ; put addr[15:0] in Y, for bounds check.
      009858 90 BE 2F         [ 2]  261 	ldw y,PTR16   ; Y=addr15:0
                                    262 ; check addr[23:16], if <> 0 then it is extened flash memory
      00985B 3D 2E            [ 1]  263 	tnz FPTR 
      00985D 26 16            [ 1]  264 	jrne 4$
      00985F 90 A3 80 00      [ 2]  265     cpw y,#FLASH_BASE
      009863 24 10            [ 1]  266     jruge 4$
      009865 90 A3 40 00      [ 2]  267 	cpw y,#EEPROM_BASE  
      009869 25 0D            [ 1]  268     jrult 9$
      00986B 90 A3 48 7F      [ 2]  269 	cpw y,#OPTION_END 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



      00986F 22 07            [ 1]  270 	jrugt 9$
      009871 CD 98 1A         [ 4]  271 	call unlock_eeprom
      009874 81               [ 4]  272 	ret 
      009875 CD 98 39         [ 4]  273 4$: call unlock_flash
      009878 81               [ 4]  274 9$: ret 
                                    275 
                                    276 ;-------------------------
                                    277 ; lock write access to 
                                    278 ; FLASH and EEPROM 
                                    279 ; LOCK ( -- )
                                    280 ;-------------------------
      009879 98 51                  281 	.word LINK 
                           0017FB   282 	LINK=.
      00987B 04                     283 	.byte 4 
      00987C 4C 4F 43 4B            284 	.ascii "LOCK" 
      009880                        285 lock: 
      009880 72 13 50 5F      [ 1]  286 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      009884 72 17 50 5F      [ 1]  287 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009888 81               [ 4]  288 	ret 
                                    289 
                                    290 ;-------------------------
                                    291 ; increment FPTR 
                                    292 ; INC-FPTR ( -- )
                                    293 ;-------------------------
      009889 98 7B                  294 	.word LINK 
                           00180B   295 	LINK=. 
      00988B 08                     296 	.byte 8 
      00988C 49 4E 43 2D 46 50 54   297 	.ascii "INC-FPTR" 
             52
      009894                        298 inc_fptr:
      009894 3C 30            [ 1]  299 	inc PTR8 
      009896 26 08            [ 1]  300 	jrne 1$
      009898 90 BE 2E         [ 2]  301 	ldw y,FPTR 
      00989B 90 5C            [ 2]  302 	incw y 
      00989D 90 BF 2E         [ 2]  303 	ldw FPTR,y 
      0098A0 81               [ 4]  304 1$: ret 
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
      0098A1 98 8B                  315 	.word LINK 
                           001823   316 	LINK=. 
      0098A3 07                     317 	.byte 7 
      0098A4 57 52 2D 42 59 54 45   318 	.ascii "WR-BYTE" 
                                    319 
      0098AB                        320 write_byte:
      0098AB 90 93            [ 1]  321 	ldw y,x 
      0098AD 90 FE            [ 2]  322 	ldw y,(y)
      0098AF 1C 00 02         [ 2]  323 	addw x,#CELLL 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



      0098B2 90 9F            [ 1]  324 	ld a,yl
      0098B4 92 BD 00 2E      [ 4]  325 	ldf [FPTR],a
      0098B8 72 05 50 5F FB   [ 2]  326 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      0098BD 20 D5            [ 2]  327 	jra inc_fptr 
                                    328 
                                    329 
                                    330 
                                    331 ;---------------------------------------
                                    332 ; write a byte to FLASH or EEPROM/OPTION  
                                    333 ; EEC!  (c ud -- )
                                    334 ;---------------------------------------
      0098BF 98 A3                  335     .word LINK 
                           001841   336 	LINK=.
      0098C1 04                     337     .byte 4 
      0098C2 45 45 43 21            338     .ascii "EEC!"
                                    339 	; local variables 
                           000001   340 	BTW = 1   ; byte to write offset on stack
                           000002   341     OPT = 2 
                           000002   342 	VSIZE = 2
      0098C6                        343 ee_cstore:
      0098C6 52 02            [ 2]  344 	sub sp,#VSIZE
      0098C8 CD 97 02         [ 4]  345     call fptr_store
      0098CB E6 01            [ 1]  346 	ld a,(1,x)
      0098CD 43               [ 1]  347 	cpl a 
      0098CE 6B 01            [ 1]  348 	ld (BTW,sp),a ; byte to write 
      0098D0 0F 02            [ 1]  349 	clr (OPT,sp)  ; OPTION flag
      0098D2 CD 98 58         [ 4]  350 	call unlock 
                                    351 	; check if option
      0098D5 3D 2E            [ 1]  352 	tnz FPTR 
      0098D7 26 19            [ 1]  353 	jrne 2$
      0098D9 90 BE 2F         [ 2]  354 	ldw y,PTR16 
      0098DC 90 A3 48 00      [ 2]  355 	cpw y,#OPTION_BASE
      0098E0 2B 10            [ 1]  356 	jrmi 2$
      0098E2 90 A3 48 80      [ 2]  357 	cpw y,#OPTION_END+1
      0098E6 2A 0A            [ 1]  358 	jrpl 2$
      0098E8 03 02            [ 1]  359 	cpl (OPT,sp)
                                    360 	; OPTION WRITE require this unlock 
      0098EA 72 1E 50 5B      [ 1]  361     bset FLASH_CR2,#FLASH_CR2_OPT
      0098EE 72 1F 50 5C      [ 1]  362     bres FLASH_NCR2,#FLASH_CR2_OPT 
      0098F2                        363 2$: 
      0098F2 CD 98 AB         [ 4]  364 	call write_byte 	
      0098F5 0D 02            [ 1]  365 	tnz (OPT,sp)
      0098F7 27 0D            [ 1]  366 	jreq 3$ 
      0098F9 7B 01            [ 1]  367     ld a,(BTW,sp)
      0098FB 90 5F            [ 1]  368     clrw y
      0098FD 90 97            [ 1]  369 	ld yl,a 
      0098FF 1D 00 02         [ 2]  370 	subw x,#CELLL 
      009902 FF               [ 2]  371 	ldw (x),y 
      009903 CD 98 AB         [ 4]  372 	call write_byte
      009906                        373 3$: 
      009906 CD 98 80         [ 4]  374 	call lock 
      009909 5B 02            [ 2]  375 	addw sp,#VSIZE 
      00990B 81               [ 4]  376     ret
                                    377 
                                    378 ;------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



                                    379 ; write integer in FLASH|EEPROM
                                    380 ; EE! ( n ud -- )
                                    381 ;------------------------------
      00990C 98 C1                  382 	.word LINK 
                           00188E   383 	LINK=.
      00990E 03                     384 	.byte 3 
      00990F 45 45 21               385 	.ascii "EE!"
      009912                        386 ee_store:
      009912 CD 97 02         [ 4]  387 	call fptr_store 
      009915 CD 98 58         [ 4]  388 	call unlock 
      009918 90 93            [ 1]  389 	ldw y,x 
      00991A 90 FE            [ 2]  390 	ldw y,(y)
      00991C 90 89            [ 2]  391 	pushw y 
      00991E 90 5E            [ 1]  392 	swapw y 
      009920 FF               [ 2]  393 	ldw (x),y 
      009921 CD 98 AB         [ 4]  394 	call write_byte 
      009924 90 85            [ 2]  395 	popw y 
      009926 1D 00 02         [ 2]  396 	subw x,#CELLL
      009929 FF               [ 2]  397 	ldw (x),y 
      00992A CD 98 AB         [ 4]  398 	call write_byte
      00992D CC 98 80         [ 2]  399 	jp lock 
                                    400 
                                    401 
                                    402 ;----------------------------
                                    403 ; Erase flash memory row 
                                    404 ; stm8s208 as 128 bytes rows
                                    405 ; ROW-ERASE ( ud -- )
                                    406 ;----------------------------
      009930 99 0E                  407 	.word LINK 
                           0018B2   408 	LINK=. 
      009932 09                     409 	.byte 9 
      009933 52 4F 57 2D 45 52 41   410 	.ascii "ROW-ERASE" 
             53 45
      00993C                        411 row_erase:
      00993C CD 97 02         [ 4]  412 	call fptr_store
                                    413 ;code must be execute from RAM 
                                    414 ;copy routine to PAD 
      00993F 1D 00 02         [ 2]  415 	subw x,#CELLL 
      009942 90 AE 99 89      [ 2]  416 	ldw y,#row_erase_proc
      009946 FF               [ 2]  417 	ldw (x),y 
      009947 CD 88 CE         [ 4]  418 	call PAD 
      00994A 90 AE 99 B0      [ 2]  419 	ldw y,#row_erase_proc_end 
      00994E 72 A2 99 89      [ 2]  420 	subw y,#row_erase_proc
      009952 1D 00 02         [ 2]  421 	subw x,#CELLL 
      009955 FF               [ 2]  422 	ldw (x),y 
      009956 CD 89 0A         [ 4]  423 	call CMOVE 
      009959                        424 block_erase:
      009959 90 BE 2F         [ 2]  425 	ldw y,FPTR+1
      00995C 90 A3 9D 80      [ 2]  426 	cpw y,#app_space 
      009960 2A 13            [ 1]  427 	jrpl erase_flash 
                                    428 ; erase EEPROM block
      009962 90 A3 40 00      [ 2]  429 	cpw y,#EEPROM_BASE 
      009966 24 01            [ 1]  430 	jruge 1$
      009968 81               [ 4]  431 	ret ; bad address 
      009969 90 A3 47 FF      [ 2]  432 1$: cpw y,#EEPROM_END 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      00996D 23 01            [ 2]  433 	jrule 2$ 
      00996F 81               [ 4]  434 	ret ; bad address 
      009970                        435 2$:	
      009970 CD 98 1A         [ 4]  436 	call unlock_eeprom 
      009973 20 03            [ 2]  437 	jra proceed_erase
                                    438 ; erase flash block:
      009975                        439 erase_flash:
      009975 CD 98 39         [ 4]  440 	call unlock_flash 
      009978                        441 proceed_erase:
      009978 CD 88 CE         [ 4]  442 	call PAD 
      00997B 90 93            [ 1]  443 	ldw y,x
      00997D 90 FE            [ 2]  444 	ldw y,(y)
      00997F 1C 00 02         [ 2]  445 	addw x,#CELLL  
      009982 90 FD            [ 4]  446 	call (y) 
      009984 72 17 50 5F      [ 1]  447 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009988 81               [ 4]  448 	ret 
                                    449 
                                    450 ; this routine is to be copied to PAD 
      009989                        451 row_erase_proc:
      009989 35 20 50 5B      [ 1]  452 	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
      00998D 35 DF 50 5C      [ 1]  453 	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
      009991 4F               [ 1]  454 	clr a 
      009992 90 5F            [ 1]  455 	clrw y 
      009994 91 A7 00 2E      [ 1]  456 	ldf ([FPTR],y),a
      009998 90 5C            [ 2]  457     incw y
      00999A 91 A7 00 2E      [ 1]  458 	ldf ([FPTR],y),a
      00999E 90 5C            [ 2]  459     incw y
      0099A0 91 A7 00 2E      [ 1]  460 	ldf ([FPTR],y),a
      0099A4 90 5C            [ 2]  461     incw y
      0099A6 91 A7 00 2E      [ 1]  462 	ldf ([FPTR],y),a
      0099AA 72 05 50 5F FB   [ 2]  463 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      0099AF 81               [ 4]  464 	ret
      0099B0                        465 row_erase_proc_end:
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
      0099B0                        478 copy_buffer:
      0099B0 4B 80            [ 1]  479 	push #BLOCK_SIZE  
                                    480 ;enable block programming 
      0099B2 72 10 50 5B      [ 1]  481 	bset FLASH_CR2,#FLASH_CR2_PRG 
      0099B6 72 11 50 5C      [ 1]  482 	bres FLASH_NCR2,#FLASH_CR2_PRG
      0099BA 90 5F            [ 1]  483 	clrw y
      0099BC F6               [ 1]  484 1$:	ld a,(x)
      0099BD 91 A7 00 2E      [ 1]  485 	ldf ([FPTR],y),a
      0099C1 5C               [ 2]  486 	incw x 
      0099C2 90 5C            [ 2]  487 	incw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



      0099C4 0A 01            [ 1]  488 	dec (BCNT,sp)
      0099C6 26 F4            [ 1]  489 	jrne 1$
                                    490 ; wait EOP bit 
      0099C8 72 05 50 5F FB   [ 2]  491 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. 
      0099CD 84               [ 1]  492 	pop a ; remove BCNT from stack 
      0099CE 81               [ 4]  493 	ret 
      0099CF                        494 copy_buffer_end:
                                    495 
                                    496 ;-------------------------
                                    497 ; move program_row to RAM 
                                    498 ; in TIB 
                                    499 ;------------------------
      0099CF                        500 copy_prog_to_ram:
      0099CF 1D 00 06         [ 2]  501 	subw x,#6
      0099D2 90 AE 99 B0      [ 2]  502 	ldw y,#copy_buffer 
      0099D6 EF 04            [ 2]  503 	ldw (4,x),y 
      0099D8 90 AE 17 00      [ 2]  504 	ldw y,#TIBBASE
      0099DC EF 02            [ 2]  505 	ldw (2,x),y 
      0099DE 90 AE 99 CF      [ 2]  506 	ldw y,#copy_buffer_end 
      0099E2 72 A2 99 B0      [ 2]  507 	subw y,#copy_buffer  
      0099E6 FF               [ 2]  508 	ldw (x),y 
      0099E7 CD 89 0A         [ 4]  509 	call CMOVE 
      0099EA 81               [ 4]  510 	ret 
                                    511 
                                    512 
                                    513 ;-----------------------------
                                    514 ; write a row in FLASH/EEPROM 
                                    515 ; WR-ROW ( a ud -- )
                                    516 ; a -> address 128 byte buffer to write 
                                    517 ; ud ->  row address in FLASH|EEPROM 
                                    518 ;-----------------------------
      0099EB 99 32                  519 	.word LINK 
                           00196D   520 	LINK=.
      0099ED 06                     521 	.byte 6 
      0099EE 57 52 2D 52 4F 57      522 	.ascii "WR-ROW"
      0099F4                        523 write_row:
      0099F4 CD 97 02         [ 4]  524 	call fptr_store
                                    525 ; align to FLASH block 
      0099F7 A6 80            [ 1]  526 	ld a,#0x80 
      0099F9 B4 30            [ 1]  527 	and a,PTR8 
      0099FB B7 30            [ 1]  528 	ld PTR8,a  
      0099FD CD 99 CF         [ 4]  529 	call copy_prog_to_ram
      009A00 CD 98 58         [ 4]  530 	call unlock
      009A03 90 93            [ 1]  531 	ldw y,x 
      009A05 90 FE            [ 2]  532 	ldw y,(y)
      009A07 1C 00 02         [ 2]  533 	addw x,#CELLL 
      009A0A 89               [ 2]  534 	pushw x 
      009A0B 93               [ 1]  535 	ldw x,y ; buffer address in x 
      009A0C CD 17 00         [ 4]  536 	call TIBBASE
      009A0F CD 98 80         [ 4]  537 	call lock
      009A12 85               [ 2]  538 	popw x 
      009A13 81               [ 4]  539 	ret 
                                    540 
                                    541 ;-------------------------------------
                                    542 ; change value of OPTION register 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



                                    543 ; SET-OPT (c n -- ) 
                                    544 ; c new value.
                                    545 ; n OPT  number {1..7}
                                    546 ;--------------------------------------
      009A14 99 ED                  547 		.word LINK 
                           001996   548 		LINK=.
      009A16 07                     549 		.byte 7 
      009A17 53 45 54 2D 4F 50 54   550 		.ascii "SET-OPT" 
      009A1E                        551 set_option: 
      009A1E 90 93            [ 1]  552 		ldw y,x 
      009A20 90 FE            [ 2]  553 		ldw y,(y)
      009A22 27 06            [ 1]  554 		jreq 1$
      009A24 90 A3 00 07      [ 2]  555 		cpw y,#7 
      009A28 23 04            [ 2]  556 		jrule 2$ 
                                    557 ; invalid OPTION number 		
      009A2A 1C 00 04         [ 2]  558 1$:		addw x,#2*CELLL
      009A2D 81               [ 4]  559 		ret
      009A2E 90 58            [ 2]  560 2$:		sllw y 
      009A30 72 A9 47 FF      [ 2]  561 		addw y,#OPTION_BASE-1
      009A34 FF               [ 2]  562 		ldw (x),y 
      009A35 1D 00 02         [ 2]  563 		subw x,#CELLL 
      009A38 90 5F            [ 1]  564 		clrw y 
      009A3A FF               [ 2]  565 		ldw (x),y 
      009A3B CD 98 C6         [ 4]  566 		call ee_cstore
      009A3E 81               [ 4]  567 		ret 
                                    568 
                                    569 
                                    570 
                                    571 ;--------------------------------------
                                    572 ; reset system to its original state 
                                    573 ; before any user modification
                                    574 ; PRISTINE ( -- )
                                    575 ;-------------------------------------
      009A3F 9A 16                  576 	.word LINK  
                           0019C1   577 	LINK=.
      009A41 08                     578 	.byte 8 
      009A42 50 52 49 53 54 49 4E   579 	.ascii "PRISTINE"
             45
      009A4A                        580 pristine:
                                    581 ;;; erase EEPROM
      009A4A CD 97 21         [ 4]  582 	call EEPROM 
      009A4D CD 84 A8         [ 4]  583 1$:	call DDUP 
      009A50 CD 99 3C         [ 4]  584 	call row_erase
      009A53 90 93            [ 1]  585 	ldw y,x 
      009A55 90 EE 02         [ 2]  586 	ldw y,(2,y)
      009A58 72 A9 00 80      [ 2]  587 	addw y,#BLOCK_SIZE
      009A5C EF 02            [ 2]  588 	ldw (2,x),y
      009A5E 90 A3 48 00      [ 2]  589 	cpw y,#OPTION_BASE 
      009A62 25 E9            [ 1]  590 	jrult 1$
                                    591 ;;; reset OPTION to default values
      009A64 90 AE 00 01      [ 2]  592 	ldw y,#1 ; OPT1 
      009A68 FF               [ 2]  593 2$:	ldw (x),y   
      009A69 90 5F            [ 1]  594 	clrw y 
      009A6B EF 02            [ 2]  595 	ldw (2,x),y  ; ( 0 1 -- ) 
      009A6D CD 84 A8         [ 4]  596 	call DDUP    ; ( 0 1 0 1 -- )  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



      009A70 CD 9A 1E         [ 4]  597 	call set_option
      009A73 90 93            [ 1]  598 	ldw y,x 
      009A75 90 FE            [ 2]  599 	ldw y,(y)
      009A77 90 5C            [ 2]  600 	incw y  ; next OPTION 
      009A79 90 A3 00 08      [ 2]  601 	cpw y,#8 
      009A7D 25 E9            [ 1]  602 	jrult 2$
                                    603 ;;; erase first row of app_space 	
      009A7F 90 AE 9D 80      [ 2]  604 	ldw y,#app_space
      009A83 EF 02            [ 2]  605 	ldw (2,x),y  
      009A85 90 5F            [ 1]  606 	clrw y 
      009A87 FF               [ 2]  607 	ldw (x),y ; ( app_space 0 -- )
      009A88 CD 99 3C         [ 4]  608 	call row_erase 
                                    609 ; reset interrupt vectors 
      009A8B 1D 00 02         [ 2]  610 	subw x,#CELLL 
      009A8E 90 5F            [ 1]  611 	clrw y  
      009A90 FF               [ 2]  612 4$:	ldw (x),y  ; ( n -- ) int# 
      009A91 CD 82 E7         [ 4]  613 	call DUPP  
      009A94 CD 9A B1         [ 4]  614 	call reset_vector
      009A97 90 93            [ 1]  615 	ldw y,x 
      009A99 90 FE            [ 2]  616 	ldw y,(y)
      009A9B 90 5C            [ 2]  617 	incw y   ; next vector 
      009A9D 90 A3 00 19      [ 2]  618 	cpw y,#25 
      009AA1 25 ED            [ 1]  619 	jrult 4$
      009AA3 CC 80 80         [ 2]  620 	jp NonHandledInterrupt ; reset MCU
                                    621 
                                    622 ;------------------------------
                                    623 ; reset an interrupt vector 
                                    624 ; to its initial value 
                                    625 ; i.e. NonHandledInterrupt
                                    626 ; RST-IVEC ( n -- )
                                    627 ;-----------------------------
      009AA6 9A 41                  628 	.word LINK 
                           001A28   629 	LINK=. 
      009AA8 08                     630 	.byte 8 
      009AA9 52 53 54 2D 49 56 45   631 	.ascii "RST-IVEC"
             43
      009AB1                        632 reset_vector:
      009AB1 90 93            [ 1]  633 	ldw y,x
      009AB3 1C 00 02         [ 2]  634 	addw x,#CELLL 
      009AB6 90 FE            [ 2]  635 	ldw y,(y)
      009AB8 90 A3 00 17      [ 2]  636 	cpw y,#23 
      009ABC 27 3A            [ 1]  637 	jreq 9$
      009ABE 90 A3 00 18      [ 2]  638 	cpw y,#24 ; last vector for stm8s208 
      009AC2 22 34            [ 1]  639 	jrugt 9$  
      009AC4 90 58            [ 2]  640 	sllw y 
      009AC6 90 58            [ 2]  641 	sllw y 
      009AC8 72 A9 80 08      [ 2]  642 	addw y,#0x8008 ; irq0 address 
      009ACC 90 BF 20         [ 2]  643 	ldw YTEMP,y
      009ACF 1D 00 06         [ 2]  644 	subw x,#3*CELLL 
      009AD2 EF 02            [ 2]  645 	ldw (2,x),y 
      009AD4 90 5F            [ 1]  646 	clrw y
      009AD6 FF               [ 2]  647 	ldw (x),y 
      009AD7 A6 82            [ 1]  648 	ld a,#0x82 
      009AD9 90 95            [ 1]  649 	ld yh,a
      009ADB EF 04            [ 2]  650 	ldw (4,x),y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      009ADD CD 99 12         [ 4]  651 	call ee_store
      009AE0 1D 00 06         [ 2]  652 	subw x,#3*CELLL
      009AE3 90 5F            [ 1]  653 	clrw y 
      009AE5 FF               [ 2]  654 	ldw (x),y 
      009AE6 90 AE 80 80      [ 2]  655 	ldw y,#NonHandledInterrupt
      009AEA EF 04            [ 2]  656 	ldw (4,x),y 
      009AEC 90 BE 20         [ 2]  657 	ldw y,YTEMP  
      009AEF 72 A9 00 02      [ 2]  658 	addw y,#2
      009AF3 EF 02            [ 2]  659 	ldw (2,x),y 
      009AF5 CD 99 12         [ 4]  660 	call ee_store
      009AF8 81               [ 4]  661 9$:	ret 
                                    662 
                                    663 
                                    664 	
                                    665 ;------------------------------
                                    666 ; set interrupt vector 
                                    667 ; SET-IVEC ( ud n -- )
                                    668 ;  ud Handler address
                                    669 ;  n  vector # 0 .. 29 
                                    670 ;-----------------------------
      009AF9 9A A8                  671 	.word LINK
                           001A7B   672 	LINK=.
      009AFB 08                     673 	.byte 8 
      009AFC 53 45 54 2D 49 56 45   674 	.ascii "SET-IVEC" 
             43
      009B04                        675 set_vector:
      009B04 90 93            [ 1]  676     ldw y,x 
      009B06 1C 00 02         [ 2]  677 	addw x,#CELLL 
      009B09 90 FE            [ 2]  678 	ldw y,(y) ; vector #
      009B0B 90 A3 00 18      [ 2]  679 	cpw y,#24 ; last vector for stm8s208  
      009B0F 23 04            [ 2]  680 	jrule 2$
      009B11 1C 00 04         [ 2]  681 	addw x,#2*CELLL 
      009B14 81               [ 4]  682 	ret
      009B15 90 58            [ 2]  683 2$:	sllw y 
      009B17 90 58            [ 2]  684 	sllw y 
      009B19 72 A9 80 08      [ 2]  685 	addw y,#0X8008 ; IRQ0 vector address 
      009B1D 90 BF 20         [ 2]  686 	ldw YTEMP,y ; vector address 
      009B20 A6 82            [ 1]  687 	ld a,#0x82 
      009B22 90 95            [ 1]  688 	ld yh,a 
      009B24 E6 01            [ 1]  689 	ld a,(1,x) ; isr address bits 23..16 
      009B26 90 97            [ 1]  690 	ld yl,a 
                                    691 ;  write 0x82 + most significant byte of int address	
      009B28 1D 00 06         [ 2]  692 	subw x,#3*CELLL 
      009B2B EF 04            [ 2]  693 	ldw (4,x),y 
      009B2D 90 BE 20         [ 2]  694 	ldw y,YTEMP
      009B30 EF 02            [ 2]  695 	ldw (2,x),y ; vector address 
      009B32 90 5F            [ 1]  696 	clrw y 
      009B34 FF               [ 2]  697 	ldw (x),y   ; as a double 
      009B35 CD 99 12         [ 4]  698 	call ee_store 
      009B38 90 93            [ 1]  699 	ldw y,x 
      009B3A 90 EE 02         [ 2]  700 	ldw y,(2,y) ; bits 15..0 int vector 
      009B3D 1D 00 06         [ 2]  701 	subw x,#3*CELLL 
      009B40 EF 04            [ 2]  702 	ldw (4,x),y 
      009B42 90 BE 20         [ 2]  703 	ldw y,YTEMP 
      009B45 72 A9 00 02      [ 2]  704 	addw y,#2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



      009B49 EF 02            [ 2]  705 	ldw (2,x),y 
      009B4B 90 5F            [ 1]  706 	clrw y 
      009B4D FF               [ 2]  707 	ldw (x),y 
      009B4E CD 99 12         [ 4]  708 	call ee_store 
      009B51 81               [ 4]  709 9$: ret 
                                    710 
                                    711 
                                    712 ;------------------------
                                    713 ; Compile word to flash
                                    714 ; EE, (w -- )
                                    715 ;-----------------------
      009B52 9A FB                  716 	.word LINK
                           001AD4   717 	LINK=.
      009B54 03                     718 	.byte 3
      009B55 45 45 2C               719 	.ascii "EE,"
      009B58                        720 ee_comma:
      009B58 1D 00 04         [ 2]  721 	subw x,#2*CELLL 
      009B5B 90 BE 18         [ 2]  722 	ldw y,UCP
      009B5E 90 89            [ 2]  723 	pushw y 
      009B60 EF 02            [ 2]  724 	ldw (2,x),y 
      009B62 90 5F            [ 1]  725 	clrw y 
      009B64 FF               [ 2]  726 	ldw (x),y
      009B65 CD 99 12         [ 4]  727 	call ee_store
      009B68 90 85            [ 2]  728 	popw y 
      009B6A 72 A9 00 02      [ 2]  729 	addw y,#2
      009B6E 90 BF 18         [ 2]  730 	ldw UCP,y
      009B71 81               [ 4]  731 	ret 
                                    732 
                                    733 ;-------------------------
                                    734 ; Compile byte to flash 
                                    735 ; EEC, ( c -- )	
                                    736 ;-------------------------
      009B72 9B 54                  737 	.word LINK 
                           001AF4   738 	LINK=.
      009B74 04                     739 	.byte 4 
      009B75 45 45 43 2C            740 	.ascii "EEC,"
      009B79                        741 ee_ccomma:
      009B79 1D 00 04         [ 2]  742 	subw x,#2*CELLL 
      009B7C 90 BE 18         [ 2]  743 	ldw y,UCP
      009B7F 90 89            [ 2]  744 	pushw y 
      009B81 EF 02            [ 2]  745 	ldw (2,x),y 
      009B83 90 5F            [ 1]  746 	clrw y 
      009B85 FF               [ 2]  747 	ldw (x),y
      009B86 CD 98 C6         [ 4]  748 	call ee_cstore
      009B89 90 85            [ 2]  749 	popw y 
      009B8B 90 5C            [ 2]  750 	incw y 
      009B8D 90 BF 18         [ 2]  751 	ldw UCP,y
      009B90 81               [ 4]  752 	ret 
                                    753 
                                    754 
                                    755 ;--------------------------
                                    756 ; copy FLASH block to ROWBUF
                                    757 ; ROW2BUF ( ud -- )
                                    758 ;--------------------------
      009B91 9B 74                  759 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



                           001B13   760 	LINK=.
      009B93 07                     761 	.byte 7 
      009B94 52 4F 57 32 42 55 46   762 	.ascii "ROW2BUF"
      009B9B                        763 ROW2BUF: 
      009B9B CD 97 02         [ 4]  764 	call fptr_store 
      009B9E A6 80            [ 1]  765 	ld a,#BLOCK_SIZE
      009BA0 88               [ 1]  766 	push a 
      009BA1 B4 30            [ 1]  767 	and a,PTR8 ; block align 
      009BA3 B7 30            [ 1]  768 	ld PTR8,a
      009BA5 90 AE 16 80      [ 2]  769 	ldw y,#ROWBUFF 
      009BA9 92 BC 00 2E      [ 5]  770 1$: ldf a,[FPTR]
      009BAD 90 F7            [ 1]  771 	ld (y),a
      009BAF CD 98 94         [ 4]  772 	call inc_fptr
      009BB2 90 5C            [ 2]  773 	incw y 
      009BB4 0A 01            [ 1]  774 	dec (1,sp)
      009BB6 26 F1            [ 1]  775 	jrne 1$ 
      009BB8 84               [ 1]  776 	pop a 
      009BB9 81               [ 4]  777 	ret 
                                    778 
                                    779 
                                    780 ;---------------------------
                                    781 ; copy ROWBUFF to flash 
                                    782 ; BUF2ROW ( ud -- )
                                    783 ; ud is row address as double 
                                    784 ;---------------------------
      009BBA 9B 93                  785 	.word LINK 
                           001B3C   786 	LINK=.
      009BBC 07                     787 	.byte 7 
      009BBD 42 55 46 32 52 4F 57   788 	.ascii "BUF2ROW" 
      009BC4                        789 BUF2ROW:
      009BC4 CD 83 E2         [ 4]  790 	call TBUF ; ( ud rb -- )
      009BC7 CD 84 7D         [ 4]  791 	call ROT 
      009BCA CD 84 7D         [ 4]  792 	call ROT  ; ( rb ud -- )
      009BCD CD 99 F4         [ 4]  793 	call write_row 
      009BD0 81               [ 4]  794 	ret 
                                    795 
                                    796 ;---------------------------------
                                    797 ; how many byte free in that row 
                                    798 ; RFREE ( a -- n )
                                    799 ; a is least byte of target address
                                    800 ;----------------------------------
      009BD1 9B BC                  801 	.word LINK 
                           001B53   802 	LINK=.
      009BD3 05                     803 	.byte 5 
      009BD4 52 46 52 45 45         804 	.ascii "RFREE"
      009BD9                        805 RFREE:
      009BD9 E6 01            [ 1]  806 	ld a,(1,x)
      009BDB A4 7F            [ 1]  807 	and a,#BLOCK_SIZE-1 
      009BDD B7 20            [ 1]  808 	ld YTEMP,a 
      009BDF A6 80            [ 1]  809 	ld a,#BLOCK_SIZE 
      009BE1 B0 20            [ 1]  810 	sub a,YTEMP 
      009BE3 90 5F            [ 1]  811 	clrw y 
      009BE5 90 97            [ 1]  812 	ld yl,a
      009BE7 FF               [ 2]  813 	ldw (x),y 
      009BE8 81               [ 4]  814 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



                                    815 
                                    816 ;---------------------------------
                                    817 ; write u bytes to flash/EEPROM 
                                    818 ; constraint to row limit 
                                    819 ; RAM2EE ( ud a u -- u2 )
                                    820 ; ud flash address 
                                    821 ; a ram address 
                                    822 ; u bytes count
                                    823 ; return u2 bytes written  
                                    824 ;-------------------------------
      009BE9 9B D3                  825 	.word LINK 
                           001B6B   826 	LINK=. 
      009BEB 06                     827 	.byte 6
      009BEC 52 41 4D 32 45 45      828 	.ascii "RAM2EE"
                                    829 	
      009BF2                        830 RAM2EE:
                                    831 ; copy ud on top 
      009BF2 90 93            [ 1]  832 	ldw y,x 
      009BF4 90 EE 06         [ 2]  833 	ldw y,(6,y) ; LSW of ud  
      009BF7 90 BF 20         [ 2]  834 	ldw YTEMP,y 
      009BFA 90 93            [ 1]  835 	ldw y,x 
      009BFC 90 EE 04         [ 2]  836 	ldw y,(4,y)  ; MSW of ud 
      009BFF 1D 00 04         [ 2]  837 	subw x,#2*CELLL 
      009C02 FF               [ 2]  838 	ldw (x),y 
      009C03 90 BE 20         [ 2]  839 	ldw y,YTEMP 
      009C06 EF 02            [ 2]  840 	ldw (2,x),y 
      009C08 CD 9B 9B         [ 4]  841 	call ROW2BUF 
      009C0B 90 93            [ 1]  842 	ldw y,x 
      009C0D 90 EE 06         [ 2]  843 	ldw y,(6,y)
      009C10 90 89            [ 2]  844 	pushw y ; udl 
      009C12 90 9F            [ 1]  845 	ld a,yl
      009C14 A4 7F            [ 1]  846 	and a,#BLOCK_SIZE-1 
      009C16 90 5F            [ 1]  847 	clrw y 
      009C18 90 97            [ 1]  848 	ld yl,a 
      009C1A 72 A9 16 80      [ 2]  849 	addw y,#ROWBUFF 
      009C1E 1D 00 02         [ 2]  850 	subw x,#CELLL 
      009C21 FF               [ 2]  851 	ldw (x),y  
      009C22 CD 82 F7         [ 4]  852 	call SWAPP ;  ( ud a ra u -- )
      009C25 CD 82 91         [ 4]  853 	call RFROM  
      009C28 CD 9B D9         [ 4]  854 	call RFREE 
      009C2B CD 85 BD         [ 4]  855 	call MIN
      009C2E CD 82 E7         [ 4]  856 	call DUPP 
      009C31 CD 82 B0         [ 4]  857 	call TOR  
      009C34 CD 89 0A         [ 4]  858 	call CMOVE
      009C37 CD 9B C4         [ 4]  859 	call BUF2ROW 
      009C3A CD 82 91         [ 4]  860 	call RFROM 
      009C3D 81               [ 4]  861 	ret 
                                    862 
                                    863 ;--------------------------
                                    864 ; expand 16 bit address 
                                    865 ; to 32 bit address 
                                    866 ; FADDR ( a -- ud )
                                    867 ;--------------------------
      009C3E 9B EB                  868 	.word LINK 
                           001BC0   869 	LINK=. 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



      009C40 05                     870 	.byte 5 
      009C41 46 41 44 44 52         871 	.ascii "FADDR"
      009C46                        872 FADDR:
      009C46 1D 00 02         [ 2]  873 	subw x,#CELLL 
      009C49 90 5F            [ 1]  874 	clrw y 
      009C4B FF               [ 2]  875 	ldw (x),y 
      009C4C 81               [ 4]  876 	ret
                                    877 
                                    878 ;--------------------------
                                    879 ; move new colon definition to FLASH 
                                    880 ; using WR-ROW for efficiency 
                                    881 ; preserving bytes already used 
                                    882 ; in the current block. 
                                    883 ; ud+c must not exceed block boundary 
                                    884 ; at this point the compiler as completed
                                    885 ; in RAM and pointers CP and CNTXT updated.
                                    886 ; CNTXT point to nfa of new word and  
                                    887 ; CP is after compiled word so CP-CNTXT+2=count to write 
                                    888 ; 
                                    889 ; FMOVE ( -- )
                                    890 ;--------------------------
      009C4D 9C 40                  891 	.word LINK 
                           001BCF   892 	LINK=.
      009C4F 05                     893 	.byte 5 
      009C50 46 4D 4F 56 45         894 	.ascii "FMOVE" 
      009C55                        895 FMOVE:
      009C55 CD 84 31         [ 4]  896 	call CPP
      009C58 CD 82 40         [ 4]  897 	call AT  
      009C5B CD 82 E7         [ 4]  898 	call DUPP ; ( udl udl -- )
      009C5E CD 84 15         [ 4]  899 	call CNTXT 
      009C61 CD 82 40         [ 4]  900 	call AT 
      009C64 CD 81 B8         [ 4]  901 	call DOLIT 
      009C67 00 02                  902 	.word 2 
      009C69 CD 85 1B         [ 4]  903 	call SUBB ; ( udl udl a -- )
      009C6C CD 82 F7         [ 4]  904 	call SWAPP 
      009C6F CD 9C 46         [ 4]  905 	call FADDR 
      009C72 CD 84 7D         [ 4]  906 	call ROT  ; ( udl ud a -- )
      009C75 CD 82 E7         [ 4]  907 	call DUPP 
      009C78 CD 82 B0         [ 4]  908 	call TOR    ; R: a 
      009C7B CD 88 BD         [ 4]  909 	call HERE 
      009C7E CD 82 A4         [ 4]  910 	call RAT 
      009C81 CD 85 1B         [ 4]  911 	call SUBB ; (udl ud a wl -- )
      009C84                        912 next_row:
      009C84 CD 82 E7         [ 4]  913 	call DUPP 
      009C87 CD 82 B0         [ 4]  914 	call TOR  ; ( udl ud a wl -- ) R: a wl
      009C8A CD 9B F2         [ 4]  915 	call RAM2EE ; ( udl a u -- udl u2 ) u2 is byte written to FLASH 
      009C8D CD 82 E7         [ 4]  916 	call DUPP 
      009C90 CD 82 B0         [ 4]  917 	call TOR
      009C93 CD 84 BD         [ 4]  918 	call PLUS  ; ( udl+ ) 
      009C96 CD 82 E7         [ 4]  919 	call DUPP 
      009C99 CD 87 D0         [ 4]  920 	call ZERO   ; ( udl+ ud -- )
      009C9C CD 82 91         [ 4]  921 	call RFROM  ; ( udl+ ud u2  R: a wl ) 
      009C9F CD 82 91         [ 4]  922 	call RFROM  ; ( udl+ ud u2 wl R: a ) 
      009CA2 CD 83 11         [ 4]  923 	call OVER   ; ( udl+ ud u2 wl u2 -- )
      009CA5 CD 85 1B         [ 4]  924 	call SUBB  ; ( udl+ ud u2 wl- R: a )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



      009CA8 CD 82 E7         [ 4]  925 	call DUPP 
      009CAB CD 81 EB         [ 4]  926 	call QBRAN
      009CAE 9C C7                  927 	.word fmove_done 
      009CB0 CD 82 F7         [ 4]  928 	call SWAPP  ; ( udl+ ud wl- u2 R: a )
      009CB3 CD 82 91         [ 4]  929 	call RFROM ; ( udl+ ud wl- u2 a -- ) 
      009CB6 CD 84 BD         [ 4]  930 	call PLUS  ; ( udl+2 ud wl- a+ )
      009CB9 CD 82 E7         [ 4]  931 	call DUPP 
      009CBC CD 82 B0         [ 4]  932 	call TOR   ; ( udl+2 ud wl- a+ ) R: a+
      009CBF CD 82 F7         [ 4]  933 	call SWAPP 
      009CC2 CD 82 02         [ 4]  934 	call BRAN
      009CC5 9C 84                  935 	.word next_row  
      009CC7                        936 fmove_done:	
      009CC7 CD 82 91         [ 4]  937 	call RFROM  ; ( -- udl+ ud u2 wl- a  )
      009CCA 1C 00 0A         [ 2]  938 	addw x,#5*CELLL ; (  -- udl+ ) new CP 
                                    939 ; reset VP to previous position  
      009CCD CD 97 7C         [ 4]  940 	call EEPVP 
      009CD0 CD 82 DD         [ 4]  941 	call DROP 
      009CD3 CD 82 40         [ 4]  942 	call AT
      009CD6 CD 84 23         [ 4]  943 	call VPP 
      009CD9 CD 82 29         [ 4]  944 	call STORE
                                    945 ;update CONTEXT and LAST 
      009CDC CD 97 66         [ 4]  946 	call EEPCP 
      009CDF CD 82 DD         [ 4]  947 	call DROP
      009CE2 CD 82 40         [ 4]  948 	call AT
      009CE5 CD 81 B8         [ 4]  949 	call DOLIT 
      009CE8 00 02                  950 	.word 2 
      009CEA CD 84 BD         [ 4]  951 	call PLUS 
      009CED CD 82 E7         [ 4]  952 	call DUPP 
      009CF0 CD 84 15         [ 4]  953 	call CNTXT 
      009CF3 CD 82 29         [ 4]  954 	call STORE
      009CF6 CD 84 41         [ 4]  955 	call LAST
      009CF9 CD 82 29         [ 4]  956 	call STORE 
      009CFC CD 97 96         [ 4]  957 	call UPDATLAST 
                                    958 ;update CP 
      009CFF CD 84 31         [ 4]  959 	call CPP 
      009D02 CD 82 29         [ 4]  960 	call STORE
      009D05 CD 97 BF         [ 4]  961 	call UPDATCP 
      009D08 81               [ 4]  962 	ret 
                                    963 
                                    964 
                                    965 ; application code begin here
      009D80                        966 	.bndry 128 ; align on flash block  
      009D80                        967 app_space: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



                                   4133 .endif ; PICATOUT_MOD
                                   4134 
                                   4135 ;===============================================================
                                   4136 
                           001BCF  4137 LASTN =	LINK   ;last name defined
                                   4138 
                                   4139 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   6 AB1        0004BE R   |   6 ABOR1      000FD9 R
  6 ABOR2      000FF0 R   |   6 ABORQ      000FD1 R   |   6 ABORT      000FC2 R
  6 ABRTQ      0012AC R   |   6 ABSS       0004B5 R   |   6 ACCEP      000F58 R
  6 ACCP1      000F61 R   |   6 ACCP2      000F87 R   |   6 ACCP3      000F8A R
  6 ACCP4      000F8C R   |     ADC_CR1 =  005401     |     ADC_CR1_=  000000 
    ADC_CR1_=  000001     |     ADC_CR1_=  000004     |     ADC_CR1_=  000005 
    ADC_CR1_=  000006     |     ADC_CR2 =  005402     |     ADC_CR2_=  000003 
    ADC_CR2_=  000004     |     ADC_CR2_=  000005     |     ADC_CR2_=  000006 
    ADC_CR2_=  000001     |     ADC_CR3 =  005403     |     ADC_CR3_=  000007 
    ADC_CR3_=  000006     |     ADC_CSR =  005400     |     ADC_CSR_=  000006 
    ADC_CSR_=  000004     |     ADC_CSR_=  000000     |     ADC_CSR_=  000001 
    ADC_CSR_=  000002     |     ADC_CSR_=  000003     |     ADC_CSR_=  000007 
    ADC_CSR_=  000005     |     ADC_DRH =  005404     |     ADC_DRL =  005405 
    ADC_TDRH=  005406     |     ADC_TDRL=  005407     |   6 ADRADJ     0003DC R
    AFR     =  004803     |     AFR0_ADC=  000000     |     AFR1_TIM=  000001 
    AFR2_CCO=  000002     |     AFR3_TIM=  000003     |     AFR4_TIM=  000004 
    AFR5_TIM=  000005     |     AFR6_I2C=  000006     |     AFR7_BEE=  000007 
  6 AFT        001294 R   |   6 AGAIN      0011E4 R   |   6 AHEAD      001244 R
  6 ALLOT      001101 R   |   6 ANDD       0002B3 R   |     APP_CP  =  004004 
    APP_LAST=  004000     |     APP_RUN =  004002     |     APP_VP  =  004006 
  6 AT         0001C0 R   |   6 ATEXE      000873 R   |     AWU_APR =  0050F1 
    AWU_CSR =  0050F0     |     AWU_TBR =  0050F2     |     B0_MASK =  000001 
    B115200 =  000006     |     B19200  =  000003     |     B1_MASK =  000002 
    B230400 =  000007     |     B2400   =  000000     |     B2_MASK =  000004 
    B38400  =  000004     |     B3_MASK =  000008     |     B460800 =  000008 
    B4800   =  000001     |     B4_MASK =  000010     |     B57600  =  000005 
    B5_MASK =  000020     |     B6_MASK =  000040     |     B7_MASK =  000080 
    B921600 =  000009     |     B9600   =  000002     |   6 BACK1      000F00 R
  6 BASE       000324 R   |     BASEE   =  00000A     |     BCNT    =  000001 
  6 BCOMP      001143 R   |   6 BDIGS      00095B R   |     BEEP_BIT=  000004 
    BEEP_CSR=  0050F3     |     BEEP_MAS=  000010     |     BEEP_POR=  00000F 
  6 BEGIN      0011C5 R   |     BIT0    =  000000     |     BIT1    =  000001 
    BIT2    =  000002     |     BIT3    =  000003     |     BIT4    =  000004 
    BIT5    =  000005     |     BIT6    =  000006     |     BIT7    =  000007 
  6 BKSLA      000D98 R   |   6 BKSP       000ED0 R   |     BKSPP   =  000008 
  6 BLANK      000743 R   |     BLOCK_SI=  000080     |     BOOT_ROM=  006000 
    BOOT_ROM=  007FFF     |   6 BRAN       000182 R   |     BTW     =  000001 
  6 BUF2ROW    001B44 R   |     CALLL   =  0000CD     |     CAN_DGR =  005426 
    CAN_FPSR=  005427     |     CAN_IER =  005425     |     CAN_MCR =  005420 
    CAN_MSR =  005421     |     CAN_P0  =  005428     |     CAN_P1  =  005429 
    CAN_P2  =  00542A     |     CAN_P3  =  00542B     |     CAN_P4  =  00542C 
    CAN_P5  =  00542D     |     CAN_P6  =  00542E     |     CAN_P7  =  00542F 
    CAN_P8  =  005430     |     CAN_P9  =  005431     |     CAN_PA  =  005432 
    CAN_PB  =  005433     |     CAN_PC  =  005434     |     CAN_PD  =  005435 
    CAN_PE  =  005436     |     CAN_PF  =  005437     |     CAN_RFR =  005424 
    CAN_TPR =  005423     |     CAN_TSR =  005422     |     CARRY   =  000024 
  6 CAT        0001DE R   |   6 CCOMMA     001125 R   |     CC_C    =  000000 
    CC_H    =  000004     |     CC_I0   =  000003     |     CC_I1   =  000005 
    CC_N    =  000002     |     CC_V    =  000007     |     CC_Z    =  000001 
    CELLL   =  000002     |   6 CELLM      000700 R   |   6 CELLP      0006F1 R
  6 CELLS      00070F R   |     CFG_GCR =  007F60     |     CFG_GCR_=  000001 
    CFG_GCR_=  000000     |   6 CHAR1      000B88 R   |   6 CHAR2      000B8B R
    CLKOPT  =  004807     |     CLKOPT_C=  000002     |     CLKOPT_E=  000003 
    CLKOPT_P=  000000     |     CLKOPT_P=  000001     |     CLK_CCOR=  0050C9 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]

Symbol Table

    CLK_CKDI=  0050C6     |     CLK_CKDI=  000000     |     CLK_CKDI=  000001 
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
  6 CMOV1      000892 R   |   6 CMOV2      0008AA R   |   6 CMOVE      00088A R
    CNTDWN  =  00002C     |   6 CNTXT      000395 R   |   6 COLD       001613 R
  6 COLD1      001613 R   |   6 COLON      0013CA R   |   6 COMMA      00110E R
  6 COMPI      001153 R   |     COMPO   =  000040     |   6 CONSTANT   001462 R
    CONVERT_=  000001     |   6 COUNT      000826 R   |   6 CPP        0003B1 R
    CPU_A   =  007F00     |     CPU_CCR =  007F0A     |     CPU_PCE =  007F01 
    CPU_PCH =  007F02     |     CPU_PCL =  007F03     |     CPU_SPH =  007F08 
    CPU_SPL =  007F09     |     CPU_XH  =  007F04     |     CPU_XL  =  007F05 
    CPU_YH  =  007F06     |     CPU_YL  =  007F07     |   6 CR         000BB6 R
  6 CREAT      001414 R   |     CRR     =  00000D     |   6 CSTOR      0001CD R
    CTOP    =  000080     |   6 DAT        000806 R   |     DATSTK  =  001670 
  6 DDROP      00041D R   |   6 DDUP       000428 R   |     DEBUG_BA=  007F00 
    DEBUG_EN=  007FFF     |   6 DECIM      000A0B R   |   6 DEPTH      000793 R
    DEVID_BA=  0048CD     |     DEVID_EN=  0048D8     |     DEVID_LO=  0048D2 
    DEVID_LO=  0048D3     |     DEVID_LO=  0048D4     |     DEVID_LO=  0048D5 
    DEVID_LO=  0048D6     |     DEVID_LO=  0048D7     |     DEVID_LO=  0048D8 
    DEVID_WA=  0048D1     |     DEVID_XH=  0048CE     |     DEVID_XL=  0048CD 
    DEVID_YH=  0048D0     |     DEVID_YL=  0048CF     |   6 DGTQ1      000A50 R
  6 DIG        000984 R   |   6 DIGIT      00091F R   |   6 DIGS       000995 R
  6 DIGS1      000995 R   |   6 DIGS2      0009A2 R   |   6 DIGTQ      000A1F R
    DM_BK1RE=  007F90     |     DM_BK1RH=  007F91     |     DM_BK1RL=  007F92 
    DM_BK2RE=  007F93     |     DM_BK2RH=  007F94     |     DM_BK2RL=  007F95 
    DM_CR1  =  007F96     |     DM_CR2  =  007F97     |     DM_CSR1 =  007F98 
    DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A     |   6 DN1        000495 R
  6 DNEGA      00047A R   |   6 DOCONST    001482 R   |   6 DOLIT      000138 R
  6 DONXT      00014C R   |   6 DOSTR      000BCC R   |   6 DOT        000C51 R
  6 DOT1       000C67 R   |   6 DOTI1      0015A7 R   |   6 DOTID      001591 R
  6 DOTO1      001065 R   |   6 DOTOK      00104B R   |   6 DOTPR      000D7A R
  6 DOTQ       0012C8 R   |   6 DOTQP      000BF5 R   |   6 DOTR       000C03 R
  6 DOTS       001530 R   |   6 DOTS1      00153B R   |   6 DOTS2      001547 R
  6 DOVAR      000314 R   |   6 DROP       00025D R   |   6 DSTOR      0007E0 R
  6 DUMP       0014E6 R   |   6 DUMP1      0014FD R   |   6 DUMP3      00151F R
  6 DUMPP      0014B5 R   |   6 DUPP       000267 R   |   6 EDIGS      0009C0 R
  6 EEPCP      0016E6 R   |   6 EEPLAST    0016B9 R   |   6 EEPROM     0016A1 R
    EEPROM_B=  004000     |     EEPROM_E=  0047FF     |     EEPROM_S=  000800 
  6 EEPRUN     0016D0 R   |   6 EEPVP      0016FC R   |   6 ELSEE      00121E R
  6 EMIT       000122 R   |   6 EQ1        0004D9 R   |   6 EQUAL      0004C3 R
  6 ERASE      0008EC R   |     ERR     =  00001B     |   6 EVAL       00108E R
  6 EVAL1      00108E R   |   6 EVAL2      0010AA R   |   6 EXE1       000881 R
  6 EXECU      000192 R   |   6 EXIT       0001A2 R   |     EXT     =  000001 
    EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1     |   6 EXTRC      000947 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]

Symbol Table

  6 FADDR      001BC6 R   |     FHSE    =  7A1200     |     FHSI    =  F42400 
  6 FILL       0008B9 R   |   6 FILL1      0008D6 R   |   6 FILL2      0008DF R
  6 FIND       000E2C R   |   6 FIND1      000E4A R   |   6 FIND2      000E78 R
  6 FIND3      000E84 R   |   6 FIND4      000E98 R   |   6 FIND5      000EA5 R
  6 FIND6      000E89 R   |     FLASH_BA=  008000     |     FLASH_CR=  00505A 
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
    FLASH_WS=  00480D     |     FLSI    =  01F400     |   6 FMOVE      001BD5 R
  6 FOR        0011A1 R   |     FPTR    =  00002E     |     GPIO_BAS=  005000 
    GPIO_CR1=  000003     |     GPIO_CR2=  000004     |     GPIO_DDR=  000002 
    GPIO_IDR=  000001     |     GPIO_ODR=  000000     |     GPIO_SIZ=  000005 
  6 HERE       00083D R   |   6 HEX        0009F6 R   |   6 HI         0015E6 R
  6 HLD        000382 R   |   6 HOLD       00096B R   |     HSECNT  =  004809 
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
  6 IFF        0011F5 R   |     IMEDD   =  000080     |   6 IMMED      0013F1 R
  6 INCH       000116 R   |   6 INN        000342 R   |     INPUT_DI=  000000 
    INPUT_EI=  000001     |     INPUT_FL=  000000     |     INPUT_PU=  000001 
  6 INTE1      00102D R   |   6 INTER      001003 R   |     INT_ADC2=  000016 
    INT_AUAR=  000012     |     INT_AWU =  000001     |     INT_CAN_=  000008 
    INT_CAN_=  000009     |     INT_CLK =  000002     |     INT_EXTI=  000003 
    INT_EXTI=  000004     |     INT_EXTI=  000005     |     INT_EXTI=  000006 
    INT_EXTI=  000007     |     INT_FLAS=  000018     |     INT_I2C =  000013 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]

Symbol Table

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
  6 INVER      000457 R   |     ITC_SPR1=  007F70     |     ITC_SPR2=  007F71 
    ITC_SPR3=  007F72     |     ITC_SPR4=  007F73     |     ITC_SPR5=  007F74 
    ITC_SPR6=  007F75     |     ITC_SPR7=  007F76     |     ITC_SPR8=  007F77 
    IWDG_KR =  0050E0     |     IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2 
  6 JSRC       0013BB R   |   6 KEY        000B36 R   |   6 KTAP       000F1D R
  6 KTAP1      000F40 R   |   6 KTAP2      000F43 R   |   6 LAST       0003C1 R
  6 LASTN   =  001BCF R   |   6 LBRAC      00103A R   |     LED2_BIT=  000005 
    LED2_MAS=  000020     |     LED2_POR=  00500A     |   6 LESS       000500 R
    LF      =  00000A     |   6 LINK    =  001BCF R   |   6 LITER      001172 R
  6 LT1        000516 R   |     MASKK   =  001F7F     |   6 MAX        000520 R
  6 MAX1       000533 R   |   6 MIN        00053D R   |   6 MIN1       000550 R
  6 MMOD1      0005F3 R   |   6 MMOD2      000607 R   |   6 MMOD3      00061E R
  6 MMSM1      00059A R   |   6 MMSM2      0005AE R   |   6 MMSM3      0005B0 R
  6 MMSM4      0005B8 R   |   6 MODD       000638 R   |   6 MONE       000769 R
    MS      =  00002A     |   6 MSEC       0000A3 R   |   6 MSMOD      0005D6 R
  6 MSTA1      0006C9 R   |   6 MSTAR      0006A6 R   |     NAFR    =  004804 
  6 NAMEQ      000EC5 R   |   6 NAMET      000DD6 R   |     NCLKOPT =  004808 
  6 NEGAT      000468 R   |   6 NEX1       000159 R   |   6 NEXT       0011B1 R
    NFLASH_W=  00480E     |     NHSECNT =  00480A     |     NOPT1   =  004802 
    NOPT2   =  004804     |     NOPT3   =  004806     |     NOPT4   =  004808 
    NOPT5   =  00480A     |     NOPT6   =  00480C     |     NOPT7   =  00480E 
    NOPTBL  =  00487F     |   6 NTIB       000352 R   |     NUBC    =  004802 
  6 NUFQ       000B4C R   |   6 NUFQ1      000B65 R   |   6 NUMBQ      000A63 R
  6 NUMQ1      000A97 R   |   6 NUMQ2      000AC8 R   |   6 NUMQ3      000B0A R
  6 NUMQ4      000B0F R   |   6 NUMQ5      000B1E R   |   6 NUMQ6      000B21 R
    NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC 
    NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE     |   6 NonHandl   000000 R
  6 OFFSET     0003D3 R   |   6 ONE        00075B R   |   6 ONEM       000729 R
  6 ONEP       00071C R   |     OPT     =  000002     |     OPT0    =  004800 
    OPT1    =  004801     |     OPT2    =  004803     |     OPT3    =  004805 
    OPT4    =  004807     |     OPT5    =  004809     |     OPT6    =  00480B 
    OPT7    =  00480D     |     OPTBL   =  00487E     |     OPTION_B=  004800 
    OPTION_E=  00487F     |     OPTION_S=  000080     |   6 ORIG       00003F R
  6 ORR        0002C7 R   |   6 OUTPUT     000127 R   |     OUTPUT_F=  000001 
    OUTPUT_O=  000000     |     OUTPUT_P=  000001     |     OUTPUT_S=  000000 
  6 OVER       000291 R   |   6 OVERT      001384 R   |     PA      =  000000 
  6 PACKS      0008FE R   |   6 PAD        00084E R   |   6 PAREN      000D89 R
  6 PARS       000C82 R   |   6 PARS1      000CAD R   |   6 PARS2      000CD8 R
  6 PARS3      000CDB R   |   6 PARS4      000CE4 R   |   6 PARS5      000D07 R
  6 PARS6      000D1C R   |   6 PARS7      000D2B R   |   6 PARS8      000D3A R
  6 PARSE      000D4B R   |   6 PAUSE      0000B3 R   |     PA_BASE =  005000 
    PA_CR1  =  005003     |     PA_CR2  =  005004     |     PA_DDR  =  005002 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]

Symbol Table

    PA_IDR  =  005001     |     PA_ODR  =  005000     |     PB      =  000005 
    PB_BASE =  005005     |     PB_CR1  =  005008     |     PB_CR2  =  005009 
    PB_DDR  =  005007     |     PB_IDR  =  005006     |     PB_ODR  =  005005 
    PC      =  00000A     |     PC_BASE =  00500A     |     PC_CR1  =  00500D 
    PC_CR2  =  00500E     |     PC_DDR  =  00500C     |     PC_IDR  =  00500B 
    PC_ODR  =  00500A     |     PD      =  00000F     |   6 PDUM1      0014C8 R
  6 PDUM2      0014D9 R   |     PD_BASE =  00500F     |     PD_CR1  =  005012 
    PD_CR2  =  005013     |     PD_DDR  =  005011     |     PD_IDR  =  005010 
    PD_ODR  =  00500F     |     PE      =  000014     |     PE_BASE =  005014 
    PE_CR1  =  005017     |     PE_CR2  =  005018     |     PE_DDR  =  005016 
    PE_IDR  =  005015     |     PE_ODR  =  005014     |     PF      =  000019 
    PF_BASE =  005019     |     PF_CR1  =  00501C     |     PF_CR2  =  00501D 
    PF_DDR  =  00501B     |     PF_IDR  =  00501A     |     PF_ODR  =  005019 
    PG      =  00001E     |     PG_BASE =  00501E     |     PG_CR1  =  005021 
    PG_CR2  =  005022     |     PG_DDR  =  005020     |     PG_IDR  =  00501F 
    PG_ODR  =  00501E     |     PH      =  000023     |     PH_BASE =  005023 
    PH_CR1  =  005026     |     PH_CR2  =  005027     |     PH_DDR  =  005025 
    PH_IDR  =  005024     |     PH_ODR  =  005023     |     PI      =  000028 
    PICATOUT=  000001     |   6 PICK       0007AA R   |     PI_BASE =  005028 
    PI_CR1  =  00502B     |     PI_CR2  =  00502C     |     PI_DDR  =  00502A 
    PI_IDR  =  005029     |     PI_ODR  =  005028     |   6 PLUS       00043D R
  6 PNAM1      001339 R   |   6 PRESE      0010B9 R   |     PROD1   =  00001E 
    PROD2   =  000020     |     PROD3   =  000022     |   6 PSTOR      0007BF R
    PTR16   =  00002F     |     PTR8    =  000030     |   6 QBRAN      00016B R
  6 QDUP       0003EC R   |   6 QDUP1      0003F6 R   |   6 QKEY       000104 R
  6 QSTAC      001071 R   |   6 QUERY      000F9D R   |   6 QUEST      000C74 R
  6 QUIT       0010D6 R   |   6 QUIT1      0010DE R   |   6 QUIT2      0010E1 R
  6 RAM2EE     001B72 R   |     RAMBASE =  000000     |     RAM_BASE=  000000 
    RAM_END =  0017FF     |     RAM_SIZE=  001800     |   6 RAT        000224 R
  6 RBRAC      0013A8 R   |   6 REPEA      001276 R   |   6 RFREE      001B59 R
  6 RFROM      000211 R   |     ROP     =  004800     |   6 ROT        0003FD R
  6 ROW2BUF    001B1B R   |     ROWBUFF =  001680     |     RP0     =  000028 
  6 RPAT       0001EE R   |     RPP     =  0017FF     |   6 RPSTO      0001FB R
    RST_SR  =  0050B3     |   6 SAME1      000DF4 R   |   6 SAME2      000E1D R
  6 SAMEQ      000DEC R   |   6 SCOM1      00136E R   |   6 SCOM2      001371 R
  6 SCOMP      001350 R   |   6 SEMIS      001394 R   |     SFR_BASE=  005000 
    SFR_END =  0057FF     |   6 SIGN       0009AA R   |   6 SIGN1      0009BA R
  6 SLASH      000642 R   |   6 SLMOD      000626 R   |   6 SNAME      001303 R
    SP0     =  000026     |   6 SPACE      000B6E R   |   6 SPACS      000B7D R
  6 SPAT       000247 R   |     SPI_CR1 =  005200     |     SPI_CR2 =  005201 
    SPI_CRCP=  005205     |     SPI_DR  =  005204     |     SPI_ICR =  005202 
    SPI_RXCR=  005206     |     SPI_SR  =  005203     |     SPI_TXCR=  005207 
    SPP     =  001670     |   6 SPSTO      000254 R   |   6 SSMOD      0006D2 R
    STACK   =  0017FF     |   6 STAR       00069B R   |   6 STASL      0006E3 R
  6 STORE      0001A9 R   |   6 STR        0009D8 R   |   6 STRCQ      001181 R
  6 STRQ       0012BA R   |   6 STRQP      000BEB R   |   6 SUBB       00049B R
  6 SWAPP      000277 R   |     SWIM_CSR=  007F80     |   6 TAP        000F07 R
  6 TBOOT      001607 R   |   6 TBUF       000362 R   |     TBUFFBAS=  001680 
  6 TCHA1      00078A R   |   6 TCHAR      00077A R   |   6 TEMP       000333 R
  6 TEVAL      000373 R   |   6 THENN      00120B R   |   6 TIB        00085F R
    TIBB    =  001700     |     TIBBASE =  001700     |     TIC     =  000027 
  6 TICK       0010ED R   |     TIM1_ARR=  005262     |     TIM1_ARR=  005263 
    TIM1_BKR=  00526D     |     TIM1_CCE=  00525C     |     TIM1_CCE=  00525D 
    TIM1_CCM=  005258     |     TIM1_CCM=  000000     |     TIM1_CCM=  000001 
    TIM1_CCM=  000004     |     TIM1_CCM=  000005     |     TIM1_CCM=  000006 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]

Symbol Table

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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]

Symbol Table

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
    TIM4_SR =  005342     |     TIM4_SR_=  000000     |   6 TIMEOUTQ   0000E3 R
  6 TIMER      0000CD R   |     TIM_CR1_=  000007     |     TIM_CR1_=  000000 
    TIM_CR1_=  000006     |     TIM_CR1_=  000005     |     TIM_CR1_=  000004 
    TIM_CR1_=  000003     |     TIM_CR1_=  000001     |     TIM_CR1_=  000002 
  6 TNAM2      001561 R   |   6 TNAM3      00157F R   |   6 TNAM4      001585 R
  6 TNAME      00155E R   |   6 TOKEN      000DC8 R   |   6 TOR        000230 R
    TRUEE   =  00FFFF     |   6 TWOSL      000736 R   |   6 TYPE1      000B9D R
  6 TYPE2      000BA9 R   |   6 TYPES      000B98 R   |   6 Timer4Ha   000005 R
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
    UCNTXT  =  000014     |     UCP     =  000018     |     UCTIB   =  00000C 
    UD1     =  000001     |     UD2     =  000002     |     UD3     =  000003 
    UD4     =  000004     |   6 UDOT       000C3E R   |   6 UDOTR      000C1E R
  6 UEND       00003D R   |     UHLD    =  000012     |     UINN    =  00000A 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]

Symbol Table

    UINTER  =  000010     |     ULAST   =  00001A     |   6 ULES1      0004F8 R
  6 ULESS      0004E2 R   |   6 UMMOD      000578 R   |   6 UMSTA      000651 R
  6 UNIQ1      0012FA R   |   6 UNIQU      0012DB R   |   6 UNTIL      0011D0 R
    UOFFSET =  00001C     |   6 UPDATCP    00173F R   |   6 UPDATLAS   001716 R
  6 UPDATRUN   00172E R   |   6 UPDATVP    001756 R   |   6 UPL1       000308 R
  6 UPLUS      0002F1 R   |     UPP     =  000006     |     USR_BTN_=  000004 
    USR_BTN_=  000010     |     USR_BTN_=  005015     |     UTIB    =  00000E 
    UTMP    =  000008     |   6 UTYP1      001498 R   |   6 UTYP2      0014A7 R
  6 UTYPE      001493 R   |     UVP     =  000016     |   6 UZERO      000027 R
  6 VARIA      00142F R   |     VER     =  000002     |   6 VPP        0003A3 R
    VSIZE   =  000002     |     WANT_DEB=  000000     |     WANT_SEE=  000000 
    WDGOPT  =  004805     |     WDGOPT_I=  000002     |     WDGOPT_L=  000003 
    WDGOPT_W=  000000     |     WDGOPT_W=  000001     |   6 WHILE      00125B R
  6 WITHI      00055D R   |   6 WORDD      000DB4 R   |   6 WORDS      0015BB R
  6 WORS1      0015C1 R   |   6 WORS2      0015E0 R   |     WWDG_CR =  0050D1 
    WWDG_WR =  0050D2     |   6 XORR       0002DC R   |     XTEMP   =  00001E 
    YTEMP   =  000020     |   6 ZERO       000750 R   |   6 ZL1        0002A9 R
  6 ZLESS      0002A0 R   |   6 app_spac   001D00 R   |   6 block_er   0018D9 R
  6 clear_ra   000019 R   |   6 clock_in   00005A R   |   6 copy_buf   001930 R
  6 copy_buf   00194F R   |   6 copy_pro   00194F R   |     da      =  000002 
    db      =  000003     |     dc      =  000000     |     dd      =  000001 
  6 ee_ccomm   001AF9 R   |   6 ee_comma   001AD8 R   |   6 ee_cstor   001846 R
  6 ee_store   001892 R   |   6 erase_fl   0018F5 R   |   6 farat      001767 R
  6 farcat     001783 R   |   6 fmove_do   001C47 R   |   6 fptr_sto   001682 R
  6 inc_fptr   001814 R   |   6 lock       001800 R   |   6 main       000016 R
  6 next_row   001C04 R   |   6 pristine   0019CA R   |   6 proceed_   0018F8 R
  6 reboot     0000FA R   |   6 reset_ve   001A31 R   |   6 row_eras   0018BC R
  6 row_eras   001909 R   |   6 row_eras   001930 R   |   6 set_opti   00199E R
  6 set_vect   001A84 R   |   6 uart1_in   00006C R   |   6 unlock     0017D8 R
  6 unlock_e   00179A R   |   6 unlock_f   0017B9 R   |   6 write_by   00182B R
  6 write_ro   001974 R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 DATA       size      0   flags    8
   2 DATA0      size      0   flags    8
   3 SSEG       size      0   flags    8
   4 SSEG1      size    100   flags    8
   5 HOME       size     80   flags    0
   6 CODE       size   1D00   flags    0

