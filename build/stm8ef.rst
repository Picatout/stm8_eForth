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
                           000016   122 UCP = UCNTXT+2    ; ram dictionary pointer 
                           000018   123 UFCP = UCP+2      ; flash code pointer 
                           00001A   124 ULAST = UFCP+2    ; flash dictionary pointer 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 4.
Hexadecimal [24-Bits]



                                    125 .endif ; PICATOUT_MOD
                                    126 
                                    127 ;******  System Variables  ******
                           00001C   128 XTEMP	=	ULAST+2	;address called by CREATE
                           00001E   129 YTEMP	=	XTEMP+2	;address called by CREATE
                           00001C   130 PROD1 = XTEMP	;space for UM*
                           00001E   131 PROD2 = PROD1+2
                           000020   132 PROD3 = PROD2+2
                           000022   133 CARRY = PROD3+2
                           000024   134 SP0	= CARRY+2	;initial data stack pointer
                           000026   135 RP0	= SP0+2		;initial return stack pointer
                           000028   136 MS    =   RP0+2         ; millisecond counter 
                           00002A   137 CNTDWN =  MS+2          ; count down timer 
                           00002C   138 FPTR = CNTDWN+2         ; 24 bits farptr 
                           00002D   139 PTR16 = FPTR+1          ; middle byte of farptr 
                           00002E   140 PTR8 = FPTR+2           ; least byte of farptr 
                                    141 
                           000001   142 .if PICATOUT_MOD
                                    143 ; EEPROM persistant data  
                           004000   144 APP_LAST = EEPROM_BASE ; Application last word pointer  
                           004002   145 APP_RUN = APP_LAST+2   ; application autorun address 
                           004004   146 APP_HERE = APP_RUN+2   ; free application space pointer 
                           004006   147 VAR_HERE = APP_HERE+2  ; free data space pointer 
                                    148 .endif ;PICATOUT_MOD
                                    149 
                                    150 
                                    151 ;***********************************************
                                    152 ;; Version control
                                    153 
                           000002   154 VER     =     2         ;major release version
                           000001   155 EXT     =     1         ;minor extension
                                    156 
                                    157 ;; Constants
                                    158 
                           00FFFF   159 TRUEE   =     0xFFFF      ;true flag
                                    160 
                           000040   161 COMPO   =     0x40     ;lexicon compile only bit
                           000080   162 IMEDD   =     0x80     ;lexicon immediate bit
                           001F7F   163 MASKK   =     0x1F7F  ;lexicon bit mask
                                    164 
                           000002   165 CELLL   =     2       ;size of a cell
                           00000A   166 BASEE   =     10      ;default radix
                           000008   167 BKSPP   =     8       ;back space
                           00000A   168 LF      =     10      ;line feed
                           00000D   169 CRR     =     13      ;carriage return
                           00001B   170 ERR     =     27      ;error escape
                           000027   171 TIC     =     39      ;tick
                           0000CD   172 CALLL   =     0xCD     ;CALL opcodes
                                    173 
                                    174 
                                    175         .macro _ledon
                                    176         bset PC_ODR,#LED2_BIT
                                    177         .endm
                                    178 
                                    179         .macro _ledoff
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 5.
Hexadecimal [24-Bits]



                                    180         bres PC_ODR,#LED2_BIT
                                    181         .endm
                                    182 
                                    183 ;**********************************************************
                                    184         .area DATA (ABS)
      000000                        185         .org RAMBASE 
                                    186 ;**********************************************************
                                    187 
                                    188 ;**********************************************************
                                    189         .area SSEG (ABS) ; STACK
      001700                        190         .org 0x1700
      001700                        191         .ds 256 
                                    192 ; space for DATSTK,TIB and STACK         
                                    193 ;**********************************************************
                                    194 
                                    195 ;**********************************************************
                                    196         .area HOME ; vectors table
                                    197 ;**********************************************************
      008000 82 00 80 96            198 	int main	        ; reset
      008004 82 00 80 80            199 	int NonHandledInterrupt	; trap
      008008 82 00 80 80            200 	int NonHandledInterrupt	; irq0
      00800C 82 00 80 80            201 	int NonHandledInterrupt	; irq1
      008010 82 00 80 80            202 	int NonHandledInterrupt	; irq2
      008014 82 00 80 80            203 	int NonHandledInterrupt	; irq3
      008018 82 00 80 80            204 	int NonHandledInterrupt	; irq4
      00801C 82 00 80 80            205 	int NonHandledInterrupt	; irq5
      008020 82 00 80 80            206 	int NonHandledInterrupt	; irq6
      008024 82 00 80 80            207 	int NonHandledInterrupt	; irq7
      008028 82 00 80 80            208 	int NonHandledInterrupt	; irq8
      00802C 82 00 80 80            209 	int NonHandledInterrupt	; irq9
      008030 82 00 80 80            210 	int NonHandledInterrupt	; irq10
      008034 82 00 80 80            211 	int NonHandledInterrupt	; irq11
      008038 82 00 80 80            212 	int NonHandledInterrupt	; irq12
      00803C 82 00 80 80            213 	int NonHandledInterrupt	; irq13
      008040 82 00 80 80            214 	int NonHandledInterrupt	; irq14
      008044 82 00 80 80            215 	int NonHandledInterrupt	; irq15
      008048 82 00 80 80            216 	int NonHandledInterrupt	; irq16
      00804C 82 00 80 80            217 	int NonHandledInterrupt	; irq17
      008050 82 00 80 80            218 	int NonHandledInterrupt	; irq18
      008054 82 00 80 80            219 	int NonHandledInterrupt	; irq19
      008058 82 00 80 80            220 	int NonHandledInterrupt	; irq20
      00805C 82 00 80 80            221 	int NonHandledInterrupt	; irq21
      008060 82 00 80 80            222 	int NonHandledInterrupt	; irq22
      008064 82 00 80 85            223 	int Timer4Handler	; irq23
      008068 82 00 80 80            224 	int NonHandledInterrupt	; irq24
      00806C 82 00 80 80            225 	int NonHandledInterrupt	; irq25
      008070 82 00 80 80            226 	int NonHandledInterrupt	; irq26
      008074 82 00 80 80            227 	int NonHandledInterrupt	; irq27
      008078 82 00 80 80            228 	int NonHandledInterrupt	; irq28
      00807C 82 00 80 80            229 	int NonHandledInterrupt	; irq29
                                    230 
                                    231 ;**********************************************************
                                    232         .area CODE
                                    233 ;**********************************************************
                                    234 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 6.
Hexadecimal [24-Bits]



                                    235 ; non handled interrupt reset MCU
      008080                        236 NonHandledInterrupt:
      008080 A6 80            [ 1]  237         ld a, #0x80
      008082 C7 50 D1         [ 1]  238         ld WWDG_CR,a ; WWDG_CR used to reset mcu
                                    239 	;iret
                                    240 
                                    241 ; used for milliseconds counter 
                                    242 ; MS is 16 bits counter 
      008085                        243 Timer4Handler:
      008085 72 5F 53 42      [ 1]  244 	clr TIM4_SR 
      008089 BE 28            [ 2]  245         ldw x,MS 
      00808B 5C               [ 2]  246         incw x 
      00808C BF 28            [ 2]  247         ldw MS,x
      00808E BE 2A            [ 2]  248         ldw x,CNTDWN 
      008090 27 03            [ 1]  249         jreq 1$
      008092 5A               [ 2]  250         decw x 
      008093 BF 2A            [ 2]  251         ldw CNTDWN,x 
      008095                        252 1$:         
      008095 80               [11]  253         iret 
                                    254 
                                    255 
                                    256 ;; Main entry points and COLD start data
      008096                        257 main:
                                    258 ; clear all RAM
      008096 AE 00 00         [ 2]  259 	ldw X,#RAMBASE
      008099                        260 clear_ram0:
      008099 7F               [ 1]  261 	clr (X)
      00809A 5C               [ 2]  262 	incw X
      00809B A3 17 FF         [ 2]  263 	cpw X,#RAM_END
      00809E 23 F9            [ 2]  264 	jrule clear_ram0
      0080A0 AE 17 FF         [ 2]  265         ldw x,#RPP
      0080A3 94               [ 1]  266         ldw sp,x 
      0080A4 CC 80 BF         [ 2]  267 	jp ORIG
                                    268 
                                    269 ; COLD initialize these variables.
      0080A7                        270 UZERO:
      0080A7 00 0A                  271         .word      BASEE   ;BASE
      0080A9 00 00                  272         .word      0       ;tmp
      0080AB 00 00                  273         .word      0       ;>IN
      0080AD 00 00                  274         .word      0       ;#TIB
      0080AF 17 00                  275         .word      TIBB    ;TIB
      0080B1 90 69                  276         .word      INTER   ;'EVAL
      0080B3 00 00                  277         .word      0       ;HLD
      0080B5 9A ED                  278         .word      LASTN  ;CNTXT pointer
      0080B7 00 80                  279         .word      CTOP   ;CP in RAM
      0080B9 9B 00                  280         .word      app_space ; CP in FLASH 
      0080BB 9A ED                  281         .word      LASTN   ;LAST
      0080BD 00 00                  282 UEND:  .word      0
                                    283 
      0080BF                        284 ORIG:   
                                    285 ; initialize SP
      0080BF AE 17 FF         [ 2]  286         LDW     X,#STACK  ;initialize return stack
      0080C2 94               [ 1]  287         LDW     SP,X
      0080C3 BF 26            [ 2]  288         LDW     RP0,X
      0080C5 AE 16 70         [ 2]  289         LDW     X,#DATSTK ;initialize data stack
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 7.
Hexadecimal [24-Bits]



      0080C8 BF 24            [ 2]  290         LDW     SP0,X
                                    291 ; initialize PC_5 as output to control LED2
                                    292 ; added by Picatout 
      0080CA 72 1A 50 0D      [ 1]  293         bset PC_CR1,#LED2_BIT
      0080CE 72 1A 50 0E      [ 1]  294         bset PC_CR2,#LED2_BIT
      0080D2 72 1A 50 0C      [ 1]  295         bset PC_DDR,#LED2_BIT
      000056                        296         _ledoff
      0080D6 72 1B 50 0A      [ 1]    1         bres PC_ODR,#LED2_BIT
                                    297 ; initialize clock to HSI
                                    298 ; no divisor 16Mhz 
                                    299 ; Added by Picatout 
      0080DA                        300 clock_init:
      0080DA 72 5F 50 C6      [ 1]  301         clr CLK_CKDIVR
      0080DE 72 12 50 C5      [ 1]  302 	bset CLK_SWCR,#CLK_SWCR_SWEN
      0080E2 A6 E1            [ 1]  303 	ld a,#CLK_SWR_HSI
      0080E4 C7 50 C4         [ 1]  304 	ld CLK_SWR,a
      0080E7 C1 50 C3         [ 1]  305 1$:	cp a,CLK_CMSR
      0080EA 26 FB            [ 1]  306 	jrne 1$
                                    307         
                                    308 ; initialize UART1, 115200 8N1
      0080EC                        309 uart1_init:
      0080EC 72 14 50 C7      [ 1]  310 	bset CLK_PCKENR1,#CLK_PCKENR1_UART1
                                    311 	; configure tx pin
      0080F0 72 1A 50 02      [ 1]  312 	bset PA_DDR,#UART1_TX_PIN ; tx pin
      0080F4 72 1A 50 03      [ 1]  313 	bset PA_CR1,#UART1_TX_PIN ; push-pull output
      0080F8 72 1A 50 04      [ 1]  314 	bset PA_CR2,#UART1_TX_PIN ; fast output
                                    315 	; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
      0080FC 35 0B 52 33      [ 1]  316 	mov UART1_BRR2,#0x0b ; must be loaded first
      008100 35 08 52 32      [ 1]  317 	mov UART1_BRR1,#0x8
      008104 35 0C 52 35      [ 1]  318 	mov UART1_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN));|(1<<UART_CR2_RIEN))
                                    319 ; initialize timer4, used for millisecond interrupt  
      008108 35 07 53 45      [ 1]  320 	mov TIM4_PSCR,#7 ; prescale 128  
      00810C 35 7D 53 46      [ 1]  321 	mov TIM4_ARR,#125 ; set for 1msec.
      008110 35 05 53 40      [ 1]  322 	mov TIM4_CR1,#((1<<TIM4_CR1_CEN)|(1<<TIM4_CR1_URS))
      008114 72 10 53 41      [ 1]  323 	bset TIM4_IER,#TIM4_IER_UIE 
      008118 9A               [ 1]  324         rim
      008119 CC 96 42         [ 2]  325         jp  COLD   ;default=MN1
                                    326 
                                    327 
                                    328 ;; get millisecond counter 
                                    329 ;; msec ( -- u )
                                    330 ;; Added by Picatout 2020-04-26
      00811C 00 00                  331         .word 0 
                           00009E   332 LINK = . 
      00811E 04                     333         .byte 4
      00811F 4D 53 45 43            334         .ascii "MSEC"
      008123                        335 MSEC: 
      008123 1D 00 02         [ 2]  336         subw x,#CELLL 
      008126 90 BE 28         [ 2]  337         ldw y,MS 
      008129 FF               [ 2]  338         ldw (x),y 
      00812A 81               [ 4]  339         ret 
                                    340 
                                    341 ; suspend execution for u msec 
                                    342 ;  pause ( u -- )
      00812B 81 1E                  343         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 8.
Hexadecimal [24-Bits]



                           0000AD   344         LINK=.
      00812D 05                     345         .byte 5 
      00812E 50 41 55 53 45         346         .ascii "PAUSE"
      008133                        347 PAUSE:
      008133 90 93            [ 1]  348         ldw y,x
      008135 90 FE            [ 2]  349         ldw y,(y)
      008137 72 B9 00 28      [ 2]  350         addw y,MS 
      00813B 8F               [10]  351 1$:     wfi  
      00813C 90 B3 28         [ 2]  352         cpw y,MS  
      00813F 26 FA            [ 1]  353         jrne 1$        
      008141 1C 00 02         [ 2]  354         addw x,#CELLL 
      008144 81               [ 4]  355         ret 
                                    356 
                                    357 ; initialize count down timer 
                                    358 ;  TIMER ( u -- )  milliseconds 
      008145 81 2D                  359         .word LINK 
                           0000C7   360         LINK=.
      008147 05                     361         .byte 5 
      008148 54 49 4D 45 52         362         .ascii "TIMER" 
      00814D                        363 TIMER:
      00814D 90 93            [ 1]  364         ldw y,x
      00814F 90 FE            [ 2]  365         ldw y,(y) 
      008151 90 BF 2A         [ 2]  366         ldw CNTDWN,y
      008154 1C 00 02         [ 2]  367         addw x,#CELLL 
      008157 81               [ 4]  368         ret 
                                    369 
                                    370 ; check for TIMER exiparition 
                                    371 ;  TIMEOUT? ( -- 0|-1 )
      008158 81 47                  372         .word LINK 
                           0000DA   373         LINK=. 
      00815A 08                     374         .byte 8 
      00815B 54 49 4D 45 4F 55 54   375         .ascii "TIMEOUT?"
             3F
      008163                        376 TIMEOUTQ: 
      008163 4F               [ 1]  377         clr a
      008164 1D 00 02         [ 2]  378         subw x,#CELLL 
      008167 90 BE 2A         [ 2]  379         ldw y,CNTDWN 
      00816A 26 01            [ 1]  380         jrne 1$ 
      00816C 43               [ 1]  381         cpl a 
      00816D E7 01            [ 1]  382 1$:     ld (1,x),a 
      00816F F7               [ 1]  383         ld (x),a 
      008170 81               [ 4]  384         ret         
                                    385 
                                    386 ; reboot MCU 
                                    387 ; REBOOT ( -- )
      008171 81 5A                  388         .word LINK 
                           0000F3   389         LINK=. 
      008173 06                     390         .byte 6 
      008174 52 45 42 4F 4F 54      391         .ascii "REBOOT"
      00817A                        392 reboot:
      00817A CC 80 80         [ 2]  393         jp NonHandledInterrupt
                                    394         
                                    395 
                                    396 ;; Device dependent I/O
                                    397 ;       ?RX     ( -- c T | F )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 9.
Hexadecimal [24-Bits]



                                    398 ;         Return input byte and true, or false.
      00817D 81 73                  399         .word      LINK 
                           0000FF   400 LINK	= .
      00817F 04                     401         .byte      4
      008180 3F 4B 45 59            402         .ascii     "?KEY"
      008184                        403 QKEY:
      008184 90 5F            [ 1]  404         CLRW Y 
      008186 72 0B 52 30 0B   [ 2]  405         BTJF UART1_SR,#UART_SR_RXNE,INCH   ;check status
      00818B C6 52 31         [ 1]  406         LD    A,UART1_DR   ;get char in A
      00818E 1D 00 02         [ 2]  407 	SUBW	X,#2
      008191 E7 01            [ 1]  408         LD     (1,X),A
      008193 7F               [ 1]  409 	CLR	(X)
      008194 90 53            [ 2]  410         CPLW     Y
      008196                        411 INCH:
      008196 1D 00 02         [ 2]  412 	SUBW	X,#2
      008199 FF               [ 2]  413         LDW     (X),Y
      00819A 81               [ 4]  414         RET
                                    415 
                                    416 ;       TX!     ( c -- )
                                    417 ;       Send character c to  output device.
      00819B 81 7F                  418         .word      LINK
                           00011D   419 LINK	= .
      00819D 04                     420         .byte      4
      00819E 45 4D 49 54            421         .ascii     "EMIT"
      0081A2                        422 EMIT:
      0081A2 E6 01            [ 1]  423         LD     A,(1,X)
      0081A4 1C 00 02         [ 2]  424 	ADDW	X,#2
      0081A7 72 0F 52 30 FB   [ 2]  425 OUTPUT: BTJF UART1_SR,#UART_SR_TXE,OUTPUT  ;loop until tdre
      0081AC C7 52 31         [ 1]  426         LD    UART1_DR,A   ;send A
      0081AF 81               [ 4]  427         RET
                                    428 
                                    429 ;; The kernel
                                    430 
                                    431 ;       doLIT   ( -- w )
                                    432 ;       Push an inline literal.
      0081B0 81 9D                  433         .word      LINK
                           000132   434 LINK	= 	.
      0081B2 45                     435 	.byte      COMPO+5
      0081B3 44 4F 4C 49 54         436         .ascii     "DOLIT"
      0081B8                        437 DOLIT:
      0081B8 1D 00 02         [ 2]  438 	SUBW X,#2
                           000001   439 .if PICATOUT_MOD 
      0081BB 16 01            [ 2]  440         ldw y,(1,sp)
      0081BD 90 FE            [ 2]  441         ldw y,(y)
      0081BF FF               [ 2]  442         ldw (x),y
      0081C0 90 85            [ 2]  443         popw y 
                           000000   444 .else 
                                    445         POPW Y
                                    446 	LDW YTEMP,Y
                                    447 	LDW Y,(Y)
                                    448         LDW (X),Y
                                    449         LDW Y,YTEMP
                                    450 .endif 
      0081C2 90 EC 02         [ 2]  451 	JP (2,Y)
                                    452 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



                                    453 ;       next    ( -- )
                                    454 ;       Code for  single index loop.
      0081C5 81 B2                  455         .word      LINK
                           000147   456 LINK	= 	.
      0081C7 44                     457 	.byte      COMPO+4
      0081C8 4E 45 58 54            458         .ascii     "NEXT"
      0081CC                        459 DONXT:
      0081CC 16 03            [ 2]  460 	LDW Y,(3,SP)
      0081CE 90 5A            [ 2]  461 	DECW Y
      0081D0 2A 07            [ 1]  462 	JRPL NEX1 ; jump if N=0
      0081D2 90 85            [ 2]  463 	POPW Y
                           000001   464 .if PICATOUT_MOD
      0081D4 5B 02            [ 2]  465         addw sp,#2
                           000000   466 .else        
                                    467 	POP A
                                    468 	POP A
                                    469 .endif         
      0081D6 90 EC 02         [ 2]  470         JP (2,Y)
      0081D9                        471 NEX1:
      0081D9 17 03            [ 2]  472         LDW (3,SP),Y
      0081DB 90 85            [ 2]  473         POPW Y
      0081DD 90 FE            [ 2]  474 	LDW Y,(Y)
      0081DF 90 FC            [ 2]  475 	JP (Y)
                                    476 
                                    477 ;       ?branch ( f -- )
                                    478 ;       Branch if flag is zero.
      0081E1 81 C7                  479         .word      LINK
                           000163   480 LINK	= 	.
      0081E3 47                     481 	.byte      COMPO+7
      0081E4 3F 42 52 41 4E 43 48   482         .ascii     "?BRANCH"
      0081EB                        483 QBRAN:	
      0081EB 90 93            [ 1]  484         LDW Y,X
      0081ED 1C 00 02         [ 2]  485 	ADDW X,#2
      0081F0 90 FE            [ 2]  486 	LDW Y,(Y)
      0081F2 27 0E            [ 1]  487         JREQ     BRAN
      0081F4 90 85            [ 2]  488 	POPW Y
      0081F6 90 EC 02         [ 2]  489 	JP (2,Y)
                                    490         
                                    491 ;       branch  ( -- )
                                    492 ;       Branch to an inline address.
      0081F9 81 E3                  493         .word      LINK
                           00017B   494 LINK	= 	.
      0081FB 46                     495 	.byte      COMPO+6
      0081FC 42 52 41 4E 43 48      496         .ascii     "BRANCH"
      008202                        497 BRAN:
      008202 90 85            [ 2]  498         POPW Y
      008204 90 FE            [ 2]  499 	LDW Y,(Y)
      008206 90 FC            [ 2]  500         JP     (Y)
                                    501 
                                    502 ;       EXECUTE ( ca -- )
                                    503 ;       Execute  word at ca.
      008208 81 FB                  504         .word      LINK
                           00018A   505 LINK	= 	.
      00820A 07                     506         .byte       7
      00820B 45 58 45 43 55 54 45   507         .ascii     "EXECUTE"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



      008212                        508 EXECU:
      008212 90 93            [ 1]  509         LDW Y,X
      008214 1C 00 02         [ 2]  510 	ADDW X,#2
      008217 90 FE            [ 2]  511 	LDW  Y,(Y)
      008219 90 FC            [ 2]  512         JP   (Y)
                                    513 
                                    514 ;       EXIT    ( -- )
                                    515 ;       Terminate a colon definition.
      00821B 82 0A                  516         .word      LINK
                           00019D   517 LINK = .
      00821D 04                     518         .byte      4
      00821E 45 58 49 54            519         .ascii     "EXIT"
      008222                        520 EXIT:
      008222 90 85            [ 2]  521         POPW Y
      008224 81               [ 4]  522         RET
                                    523 
                                    524 ;       !       ( w a -- )
                                    525 ;       Pop  data stack to memory.
      008225 82 1D                  526         .word      LINK
                           0001A7   527 LINK = .
      008227 01                     528         .byte      1
      008228 21                     529         .ascii     "!"
      008229                        530 STORE:
      008229 90 93            [ 1]  531         LDW Y,X
      00822B 90 FE            [ 2]  532         LDW Y,(Y)    ;Y=a
      00822D 90 BF 1E         [ 2]  533         LDW YTEMP,Y
      008230 90 93            [ 1]  534         LDW Y,X
      008232 90 EE 02         [ 2]  535         LDW Y,(2,Y)
      008235 91 CF 1E         [ 5]  536         LDW [YTEMP],Y ;store w at a
      008238 1C 00 04         [ 2]  537         ADDW X,#4 ; DDROP 
      00823B 81               [ 4]  538         RET     
                                    539 
                                    540 ;       @       ( a -- w )
                                    541 ;       Push memory location to stack.
      00823C 82 27                  542         .word      LINK
                           0001BE   543 LINK	= 	.
      00823E 01                     544         .byte    1
      00823F 40                     545         .ascii	"@"
      008240                        546 AT:
      008240 90 93            [ 1]  547         LDW Y,X     ;Y = a
      008242 90 FE            [ 2]  548         LDW Y,(Y)   ; address 
      008244 90 FE            [ 2]  549         LDW Y,(Y)   ; value 
      008246 FF               [ 2]  550         LDW (X),Y ;w = @Y
      008247 81               [ 4]  551         RET     
                                    552 
                                    553 ;       C!      ( c b -- )
                                    554 ;       Pop  data stack to byte memory.
      008248 82 3E                  555         .word      LINK
                           0001CA   556 LINK	= .
      00824A 02                     557         .byte      2
      00824B 43 21                  558         .ascii     "C!"
      00824D                        559 CSTOR:
      00824D 90 93            [ 1]  560         LDW Y,X
      00824F 90 FE            [ 2]  561 	LDW Y,(Y)    ;Y=b
      008251 E6 03            [ 1]  562         LD A,(3,X)    ;D = c
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]



      008253 90 F7            [ 1]  563         LD  (Y),A     ;store c at b
      008255 1C 00 04         [ 2]  564 	ADDW X,#4 ; DDROP 
      008258 81               [ 4]  565         RET     
                                    566 
                                    567 ;       C@      ( b -- c )
                                    568 ;       Push byte in memory to  stack.
      008259 82 4A                  569         .word      LINK
                           0001DB   570 LINK	= 	.
      00825B 02                     571         .byte      2
      00825C 43 40                  572         .ascii     "C@"
      00825E                        573 CAT:
      00825E 90 93            [ 1]  574         LDW Y,X     ;Y=b
      008260 90 FE            [ 2]  575         LDW Y,(Y)
      008262 90 F6            [ 1]  576         LD A,(Y)
      008264 E7 01            [ 1]  577         LD (1,X),A
      008266 7F               [ 1]  578         CLR (X)
      008267 81               [ 4]  579         RET     
                                    580 
                                    581 ;       RP@     ( -- a )
                                    582 ;       Push current RP to data stack.
      008268 82 5B                  583         .word      LINK
                           0001EA   584 LINK	= .
      00826A 03                     585         .byte      3
      00826B 52 50 40               586         .ascii     "RP@"
      00826E                        587 RPAT:
      00826E 90 96            [ 1]  588         LDW Y,SP    ;save return addr
      008270 1D 00 02         [ 2]  589         SUBW X,#2
      008273 FF               [ 2]  590         LDW (X),Y
      008274 81               [ 4]  591         RET     
                                    592 
                                    593 ;       RP!     ( a -- )
                                    594 ;       Set  return stack pointer.
      008275 82 6A                  595         .word      LINK
                           0001F7   596 LINK	= 	. 
      008277 43                     597 	.byte      COMPO+3
      008278 52 50 21               598         .ascii     "RP!"
      00827B                        599 RPSTO:
      00827B 90 85            [ 2]  600         POPW Y
      00827D 90 BF 1E         [ 2]  601         LDW YTEMP,Y
      008280 90 93            [ 1]  602         LDW Y,X
      008282 90 FE            [ 2]  603         LDW Y,(Y)
      008284 90 94            [ 1]  604         LDW SP,Y
      008286 1C 00 02         [ 2]  605         ADDW x,#CELLL ; a was not dropped, Picatout 2020-05-24
      008289 92 CC 1E         [ 5]  606         JP [YTEMP]
                                    607 
                                    608 ;       R>      ( -- w )
                                    609 ;       Pop return stack to data stack.
      00828C 82 77                  610         .word      LINK
                           00020E   611 LINK	= 	. 
      00828E 42                     612 	.byte      COMPO+2
      00828F 52 3E                  613         .ascii     "R>"
      008291                        614 RFROM:
      008291 90 85            [ 2]  615         POPW Y    ;save return addr
      008293 90 BF 1E         [ 2]  616         LDW YTEMP,Y
      008296 90 85            [ 2]  617         POPW Y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 13.
Hexadecimal [24-Bits]



      008298 1D 00 02         [ 2]  618         SUBW X,#2
      00829B FF               [ 2]  619         LDW (X),Y
      00829C 92 CC 1E         [ 5]  620         JP [YTEMP]
                                    621 
                                    622 ;       R@      ( -- w )
                                    623 ;       Copy top of return stack to stack.
      00829F 82 8E                  624         .word      LINK
                           000221   625 LINK	= 	. 
      0082A1 02                     626         .byte      2
      0082A2 52 40                  627         .ascii     "R@"
      0082A4                        628 RAT:
                           000001   629 .if PICATOUT_MOD
      0082A4 16 03            [ 2]  630         ldw y,(3,sp)
      0082A6 1D 00 02         [ 2]  631         subw x,#CELLL 
      0082A9 FF               [ 2]  632         ldw (x),y 
      0082AA 81               [ 4]  633         ret 
                           000000   634 .else 
                                    635         POPW Y
                                    636         LDW YTEMP,Y
                                    637         POPW Y
                                    638         PUSHW Y
                                    639         SUBW X,#2
                                    640         LDW (X),Y
                                    641         JP [YTEMP]
                                    642 .endif         
                                    643 
                                    644 ;       >R      ( w -- )
                                    645 ;       Push data stack to return stack.
      0082AB 82 A1                  646         .word      LINK
                           00022D   647 LINK	= 	. 
      0082AD 42                     648 	.byte      COMPO+2
      0082AE 3E 52                  649         .ascii     ">R"
      0082B0                        650 TOR:
      0082B0 90 85            [ 2]  651         POPW Y    ;save return addr
      0082B2 90 BF 1E         [ 2]  652         LDW YTEMP,Y
      0082B5 90 93            [ 1]  653         LDW Y,X
      0082B7 90 FE            [ 2]  654         LDW Y,(Y)
      0082B9 90 89            [ 2]  655         PUSHW Y    ;restore return addr
      0082BB 1C 00 02         [ 2]  656         ADDW X,#2
      0082BE 92 CC 1E         [ 5]  657         JP [YTEMP]
                                    658 
                                    659 ;       SP@     ( -- a )
                                    660 ;       Push current stack pointer.
      0082C1 82 AD                  661         .word      LINK
                           000243   662 LINK	= 	. 
      0082C3 03                     663         .byte      3
      0082C4 53 50 40               664         .ascii     "SP@"
      0082C7                        665 SPAT:
      0082C7 90 93            [ 1]  666 	LDW Y,X
      0082C9 1D 00 02         [ 2]  667         SUBW X,#2
      0082CC FF               [ 2]  668 	LDW (X),Y
      0082CD 81               [ 4]  669         RET     
                                    670 
                                    671 ;       SP!     ( a -- )
                                    672 ;       Set  data stack pointer.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 14.
Hexadecimal [24-Bits]



      0082CE 82 C3                  673         .word      LINK
                           000250   674 LINK	= 	. 
      0082D0 03                     675         .byte      3
      0082D1 53 50 21               676         .ascii     "SP!"
      0082D4                        677 SPSTO:
      0082D4 FE               [ 2]  678         LDW     X,(X)     ;X = a
      0082D5 81               [ 4]  679         RET     
                                    680 
                                    681 ;       DROP    ( w -- )
                                    682 ;       Discard top stack item.
      0082D6 82 D0                  683         .word      LINK
                           000258   684 LINK	= 	. 
      0082D8 04                     685         .byte      4
      0082D9 44 52 4F 50            686         .ascii     "DROP"
      0082DD                        687 DROP:
      0082DD 1C 00 02         [ 2]  688         ADDW X,#2     
      0082E0 81               [ 4]  689         RET     
                                    690 
                                    691 ;       DUP     ( w -- w w )
                                    692 ;       Duplicate  top stack item.
      0082E1 82 D8                  693         .word      LINK
                           000263   694 LINK	= 	. 
      0082E3 03                     695         .byte      3
      0082E4 44 55 50               696         .ascii     "DUP"
      0082E7                        697 DUPP:
      0082E7 90 93            [ 1]  698 	LDW Y,X
      0082E9 1D 00 02         [ 2]  699         SUBW X,#2
      0082EC 90 FE            [ 2]  700 	LDW Y,(Y)
      0082EE FF               [ 2]  701 	LDW (X),Y
      0082EF 81               [ 4]  702         RET     
                                    703 
                                    704 ;       SWAP    ( w1 w2 -- w2 w1 )
                                    705 ;       Exchange top two stack items.
      0082F0 82 E3                  706         .word      LINK
                           000272   707 LINK	= 	. 
      0082F2 04                     708         .byte      4
      0082F3 53 57 41 50            709         .ascii     "SWAP"
      0082F7                        710 SWAPP:
      0082F7 90 93            [ 1]  711         LDW Y,X
      0082F9 90 FE            [ 2]  712         LDW Y,(Y)
      0082FB 90 BF 1E         [ 2]  713         LDW YTEMP,Y
      0082FE 90 93            [ 1]  714         LDW Y,X
      008300 90 EE 02         [ 2]  715         LDW Y,(2,Y)
      008303 FF               [ 2]  716         LDW (X),Y
      008304 90 BE 1E         [ 2]  717         LDW Y,YTEMP
      008307 EF 02            [ 2]  718         LDW (2,X),Y
      008309 81               [ 4]  719         RET     
                                    720 
                                    721 ;       OVER    ( w1 w2 -- w1 w2 w1 )
                                    722 ;       Copy second stack item to top.
      00830A 82 F2                  723         .word      LINK
                           00028C   724 LINK	= . 
      00830C 04                     725         .byte      4
      00830D 4F 56 45 52            726         .ascii     "OVER"
      008311                        727 OVER:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 15.
Hexadecimal [24-Bits]



      008311 1D 00 02         [ 2]  728         SUBW X,#2
      008314 90 93            [ 1]  729         LDW Y,X
      008316 90 EE 04         [ 2]  730         LDW Y,(4,Y)
      008319 FF               [ 2]  731         LDW (X),Y
      00831A 81               [ 4]  732         RET     
                                    733 
                                    734 ;       0<      ( n -- t )
                                    735 ;       Return true if n is negative.
      00831B 83 0C                  736         .word      LINK
                           00029D   737 LINK	= . 
      00831D 02                     738         .byte      2
      00831E 30 3C                  739         .ascii     "0<"
      008320                        740 ZLESS:
      008320 A6 FF            [ 1]  741         LD A,#0xFF
      008322 90 93            [ 1]  742         LDW Y,X
      008324 90 FE            [ 2]  743         LDW Y,(Y)
      008326 2B 01            [ 1]  744         JRMI     ZL1
      008328 4F               [ 1]  745         CLR A   ;false
      008329 F7               [ 1]  746 ZL1:    LD     (X),A
      00832A E7 01            [ 1]  747         LD (1,X),A
      00832C 81               [ 4]  748 	RET     
                                    749 
                                    750 ;       AND     ( w w -- w )
                                    751 ;       Bitwise AND.
      00832D 83 1D                  752         .word      LINK
                           0002AF   753 LINK	= . 
      00832F 03                     754         .byte      3
      008330 41 4E 44               755         .ascii     "AND"
      008333                        756 ANDD:
      008333 F6               [ 1]  757         LD  A,(X)    ;D=w
      008334 E4 02            [ 1]  758         AND A,(2,X)
      008336 E7 02            [ 1]  759         LD (2,X),A
      008338 E6 01            [ 1]  760         LD A,(1,X)
      00833A E4 03            [ 1]  761         AND A,(3,X)
      00833C E7 03            [ 1]  762         LD (3,X),A
      00833E 1C 00 02         [ 2]  763         ADDW X,#2
      008341 81               [ 4]  764         RET
                                    765 
                                    766 ;       OR      ( w w -- w )
                                    767 ;       Bitwise inclusive OR.
      008342 83 2F                  768         .word      LINK
                           0002C4   769 LINK = . 
      008344 02                     770         .byte      2
      008345 4F 52                  771         .ascii     "OR"
      008347                        772 ORR:
      008347 F6               [ 1]  773         LD A,(X)    ;D=w
      008348 EA 02            [ 1]  774         OR A,(2,X)
      00834A E7 02            [ 1]  775         LD (2,X),A
      00834C E6 01            [ 1]  776         LD A,(1,X)
      00834E EA 03            [ 1]  777         OR A,(3,X)
      008350 E7 03            [ 1]  778         LD (3,X),A
      008352 1C 00 02         [ 2]  779         ADDW X,#2
      008355 81               [ 4]  780         RET
                                    781 
                                    782 ;       XOR     ( w w -- w )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 16.
Hexadecimal [24-Bits]



                                    783 ;       Bitwise exclusive OR.
      008356 83 44                  784         .word      LINK
                           0002D8   785 LINK	= . 
      008358 03                     786         .byte      3
      008359 58 4F 52               787         .ascii     "XOR"
      00835C                        788 XORR:
      00835C F6               [ 1]  789         LD A,(X)    ;D=w
      00835D E8 02            [ 1]  790         XOR A,(2,X)
      00835F E7 02            [ 1]  791         LD (2,X),A
      008361 E6 01            [ 1]  792         LD A,(1,X)
      008363 E8 03            [ 1]  793         XOR A,(3,X)
      008365 E7 03            [ 1]  794         LD (3,X),A
      008367 1C 00 02         [ 2]  795         ADDW X,#2
      00836A 81               [ 4]  796         RET
                                    797 
                                    798 ;       UM+     ( u u -- udsum )
                                    799 ;       Add two unsigned single
                                    800 ;       and return a double sum.
      00836B 83 58                  801         .word      LINK
                           0002ED   802 LINK	= . 
      00836D 03                     803         .byte      3
      00836E 55 4D 2B               804         .ascii     "UM+"
      008371                        805 UPLUS:
      008371 A6 01            [ 1]  806         LD A,#1
      008373 90 93            [ 1]  807         LDW Y,X
      008375 90 EE 02         [ 2]  808         LDW Y,(2,Y)
      008378 90 BF 1E         [ 2]  809         LDW YTEMP,Y
      00837B 90 93            [ 1]  810         LDW Y,X
      00837D 90 FE            [ 2]  811         LDW Y,(Y)
      00837F 72 B9 00 1E      [ 2]  812         ADDW Y,YTEMP
      008383 EF 02            [ 2]  813         LDW (2,X),Y
      008385 25 01            [ 1]  814         JRC     UPL1
      008387 4F               [ 1]  815         CLR A
      008388 E7 01            [ 1]  816 UPL1:   LD     (1,X),A
      00838A 7F               [ 1]  817         CLR (X)
      00838B 81               [ 4]  818         RET
                                    819 
                                    820 ;; System and user variables
                                    821 
                                    822 ;       doVAR   ( -- a )
                                    823 ;       Code for VARIABLE and CREATE.
      00838C 83 6D                  824         .word      LINK
                           00030E   825 LINK	= . 
      00838E 45                     826 	.byte      COMPO+5
      00838F 44 4F 56 41 52         827         .ascii     "DOVAR"
      008394                        828 DOVAR:
      008394 1D 00 02         [ 2]  829 	SUBW X,#2
      008397 90 85            [ 2]  830         POPW Y    ;get return addr (pfa)
                           000001   831 .if PICATOUT_MOD
      008399 90 FE            [ 2]  832         LDW Y,(Y) ; indirect address 
                                    833 .endif ;PICATOUT_MOD        
      00839B FF               [ 2]  834         LDW (X),Y    ;push on stack
      00839C 81               [ 4]  835         RET     ;go to RET of EXEC
                                    836 
                                    837 ;       BASE    ( -- a )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 17.
Hexadecimal [24-Bits]



                                    838 ;       Radix base for numeric I/O.
      00839D 83 8E                  839         .word      LINK        
                           00031F   840 LINK = . 
      00839F 04                     841         .byte      4
      0083A0 42 41 53 45            842         .ascii     "BASE"
      0083A4                        843 BASE:
      0083A4 90 AE 00 06      [ 2]  844 	LDW Y,#UBASE 
      0083A8 1D 00 02         [ 2]  845 	SUBW X,#2
      0083AB FF               [ 2]  846         LDW (X),Y
      0083AC 81               [ 4]  847         RET
                                    848 
                                    849 ;       tmp     ( -- a )
                                    850 ;       A temporary storage.
      0083AD 83 9F                  851         .word      LINK
                                    852         
                           00032F   853 LINK = . 
      0083AF 03                     854 	.byte      3
      0083B0 54 4D 50               855         .ascii     "TMP"
      0083B3                        856 TEMP:
      0083B3 90 AE 00 08      [ 2]  857 	LDW Y,#UTMP
      0083B7 1D 00 02         [ 2]  858 	SUBW X,#2
      0083BA FF               [ 2]  859         LDW (X),Y
      0083BB 81               [ 4]  860         RET
                                    861 
                                    862 ;       >IN     ( -- a )
                                    863 ;        Hold parsing pointer.
      0083BC 83 AF                  864         .word      LINK
                           00033E   865 LINK = . 
      0083BE 03                     866         .byte      3
      0083BF 3E 49 4E               867         .ascii    ">IN"
      0083C2                        868 INN:
      0083C2 90 AE 00 0A      [ 2]  869 	LDW Y,#UINN 
      0083C6 1D 00 02         [ 2]  870 	SUBW X,#2
      0083C9 FF               [ 2]  871         LDW (X),Y
      0083CA 81               [ 4]  872         RET
                                    873 
                                    874 ;       #TIB    ( -- a )
                                    875 ;       Count in terminal input buffer.
      0083CB 83 BE                  876         .word      LINK
                           00034D   877 LINK = . 
      0083CD 04                     878         .byte      4
      0083CE 23 54 49 42            879         .ascii     "#TIB"
      0083D2                        880 NTIB:
      0083D2 90 AE 00 0C      [ 2]  881 	LDW Y,#UCTIB 
      0083D6 1D 00 02         [ 2]  882 	SUBW X,#2
      0083D9 FF               [ 2]  883         LDW (X),Y
      0083DA 81               [ 4]  884         RET
                                    885 
                           000001   886 .if PICATOUT_MOD
                                    887 ;       TBUF ( -- a )
                                    888 ;       address of 128 bytes transaction buffer 
      0083DB 83 CD                  889         .word LINK 
                           00035D   890         LINK=.
      0083DD 04                     891         .byte 4 
      0083DE 54 42 55 46            892         .ascii "TBUF"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
Hexadecimal [24-Bits]



      0083E2                        893 tbuff:
      0083E2 90 AE 16 80      [ 2]  894         ldw y,#ROWBUFF
      0083E6 1D 00 02         [ 2]  895         subw x,#CELLL
      0083E9 FF               [ 2]  896         ldw (x),y 
      0083EA 81               [ 4]  897         ret 
                                    898 
                                    899 
                                    900 .endif ;PICATOUT_MOD
                                    901 
                                    902 ;       "EVAL   ( -- a )
                                    903 ;       Execution vector of EVAL.
      0083EB 83 DD                  904         .word      LINK
                           00036D   905 LINK = . 
      0083ED 05                     906         .byte      5
      0083EE 27 45 56 41 4C         907         .ascii     "'EVAL"
      0083F3                        908 TEVAL:
      0083F3 90 AE 00 10      [ 2]  909 	LDW Y,#UINTER 
      0083F7 1D 00 02         [ 2]  910 	SUBW X,#2
      0083FA FF               [ 2]  911         LDW (X),Y
      0083FB 81               [ 4]  912         RET
                                    913 
                                    914 ;       HLD     ( -- a )
                                    915 ;       Hold a pointer of output string.
      0083FC 83 ED                  916         .word      LINK
                           00037E   917 LINK = . 
      0083FE 03                     918         .byte      3
      0083FF 48 4C 44               919         .ascii     "HLD"
      008402                        920 HLD:
      008402 90 AE 00 12      [ 2]  921 	LDW Y,#UHLD 
      008406 1D 00 02         [ 2]  922 	SUBW X,#2
      008409 FF               [ 2]  923         LDW (X),Y
      00840A 81               [ 4]  924         RET
                                    925 
                                    926 ;       CONTEXT ( -- a )
                                    927 ;       Start vocabulary search.
      00840B 83 FE                  928         .word      LINK
                           00038D   929 LINK = . 
      00840D 07                     930         .byte      7
      00840E 43 4F 4E 54 45 58 54   931         .ascii     "CONTEXT"
      008415                        932 CNTXT:
      008415 90 AE 00 14      [ 2]  933 	LDW Y,#UCNTXT
      008419 1D 00 02         [ 2]  934 	SUBW X,#2
      00841C FF               [ 2]  935         LDW (X),Y
      00841D 81               [ 4]  936         RET
                                    937 
                                    938 ;       CP      ( -- a )
                           000001   939 .if PICATOUT_MOD 
                                    940 ;       Point to top of variables
                           000000   941 .else 
                                    942 ;       Point to top of dictionary.
                                    943 .endif ; PICATOUT_MOD
      00841E 84 0D                  944         .word      LINK
                           0003A0   945 LINK = . 
      008420 02                     946         .byte      2
      008421 43 50                  947         .ascii     "CP"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]



      008423                        948 CPP:
      008423 90 AE 00 16      [ 2]  949 	LDW Y,#UCP 
      008427 1D 00 02         [ 2]  950 	SUBW X,#2
      00842A FF               [ 2]  951         LDW (X),Y
      00842B 81               [ 4]  952         RET
                                    953 
                           000001   954 .if PICATOUT_MOD
                                    955 ;       FCP    ( -- a )
                                    956 ;       Pointer to top of FLASH 
      00842C 84 20                  957         .word LINK 
                           0003AE   958         LINK=.
      00842E 03                     959         .byte 3 
      00842F 46 43 50               960         .ascii "FCP"
      008432                        961 FCP: 
      008432 90 AE 00 18      [ 2]  962         ldw y,#UFCP 
      008436 1D 00 02         [ 2]  963         subw x,#CELLL 
      008439 FF               [ 2]  964         ldw (x),y 
      00843A 81               [ 4]  965         ret                
                                    966 .endif ;PICATOUT_MOD
                                    967 
                                    968 ;       LAST    ( -- a )
                                    969 ;       Point to last name in dictionary.
      00843B 84 2E                  970         .word      LINK
                           0003BD   971 LINK = . 
      00843D 04                     972         .byte      4
      00843E 4C 41 53 54            973         .ascii     "LAST"
      008442                        974 LAST:
      008442 90 AE 00 1A      [ 2]  975 	LDW Y,#ULAST 
      008446 1D 00 02         [ 2]  976 	SUBW X,#2
      008449 FF               [ 2]  977         LDW (X),Y
      00844A 81               [ 4]  978         RET
                                    979 
                                    980 ;; Common functions
                                    981 
                                    982 ;       ?DUP    ( w -- w w | 0 )
                                    983 ;       Dup tos if its is not zero.
      00844B 84 3D                  984         .word      LINK
                           0003CD   985 LINK = . 
      00844D 04                     986         .byte      4
      00844E 3F 44 55 50            987         .ascii     "?DUP"
      008452                        988 QDUP:
      008452 90 93            [ 1]  989         LDW Y,X
      008454 90 FE            [ 2]  990 	LDW Y,(Y)
      008456 27 04            [ 1]  991         JREQ     QDUP1
      008458 1D 00 02         [ 2]  992 	SUBW X,#2
      00845B FF               [ 2]  993         LDW (X),Y
      00845C 81               [ 4]  994 QDUP1:  RET
                                    995 
                                    996 ;       ROT     ( w1 w2 w3 -- w2 w3 w1 )
                                    997 ;       Rot 3rd item to top.
      00845D 84 4D                  998         .word      LINK
                           0003DF   999 LINK = . 
      00845F 03                    1000         .byte      3
      008460 52 4F 54              1001         .ascii     "ROT"
      008463                       1002 ROT:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]



                           000001  1003 .if PICATOUT_MOD
      008463 90 93            [ 1] 1004         ldw y,x 
      008465 90 FE            [ 2] 1005         ldw y,(y)
      008467 90 89            [ 2] 1006         pushw y 
      008469 90 93            [ 1] 1007         ldw y,x 
      00846B 90 EE 04         [ 2] 1008         ldw y,(4,y)
      00846E FF               [ 2] 1009         ldw (x),y 
      00846F 90 93            [ 1] 1010         ldw y,x 
      008471 90 EE 02         [ 2] 1011         ldw y,(2,y)
      008474 EF 04            [ 2] 1012         ldw (4,x),y 
      008476 90 85            [ 2] 1013         popw y 
      008478 EF 02            [ 2] 1014         ldw (2,x),y
      00847A 81               [ 4] 1015         ret 
                           000000  1016 .else 
                                   1017         LDW Y,X
                                   1018 	LDW Y,(4,Y)
                                   1019 	LDW YTEMP,Y
                                   1020         LDW Y,X
                                   1021         LDW Y,(2,Y)
                                   1022         LDW XTEMP,Y
                                   1023         LDW Y,X
                                   1024         LDW Y,(Y)
                                   1025         LDW (2,X),Y
                                   1026         LDW Y,XTEMP
                                   1027         LDW (4,X),Y
                                   1028         LDW Y,YTEMP
                                   1029         LDW (X),Y
                                   1030         RET
                                   1031 .endif 
                                   1032 
                                   1033 ;       2DROP   ( w w -- )
                                   1034 ;       Discard two items on stack.
      00847B 84 5F                 1035         .word      LINK
                           0003FD  1036 LINK = . 
      00847D 05                    1037         .byte      5
      00847E 32 44 52 4F 50        1038         .ascii     "2DROP"
      008483                       1039 DDROP:
      008483 1C 00 04         [ 2] 1040         ADDW X,#4
      008486 81               [ 4] 1041         RET
                                   1042 
                                   1043 ;       2DUP    ( w1 w2 -- w1 w2 w1 w2 )
                                   1044 ;       Duplicate top two items.
      008487 84 7D                 1045         .word      LINK
                           000409  1046 LINK = . 
      008489 04                    1047         .byte      4
      00848A 32 44 55 50           1048         .ascii     "2DUP"
      00848E                       1049 DDUP:
      00848E 1D 00 04         [ 2] 1050         SUBW X,#4
      008491 90 93            [ 1] 1051         LDW Y,X
      008493 90 EE 06         [ 2] 1052         LDW Y,(6,Y)
      008496 EF 02            [ 2] 1053         LDW (2,X),Y
      008498 90 93            [ 1] 1054         LDW Y,X
      00849A 90 EE 04         [ 2] 1055         LDW Y,(4,Y)
      00849D FF               [ 2] 1056         LDW (X),Y
      00849E 81               [ 4] 1057         RET
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



                                   1058 
                                   1059 ;       +       ( w w -- sum )
                                   1060 ;       Add top two items.
      00849F 84 89                 1061         .word      LINK
                           000421  1062 LINK = . 
      0084A1 01                    1063         .byte      1
      0084A2 2B                    1064         .ascii     "+"
      0084A3                       1065 PLUS:
      0084A3 90 93            [ 1] 1066         LDW Y,X
      0084A5 90 FE            [ 2] 1067         LDW Y,(Y)
      0084A7 90 BF 1E         [ 2] 1068         LDW YTEMP,Y
      0084AA 1C 00 02         [ 2] 1069         ADDW X,#2
      0084AD 90 93            [ 1] 1070         LDW Y,X
      0084AF 90 FE            [ 2] 1071         LDW Y,(Y)
      0084B1 72 B9 00 1E      [ 2] 1072         ADDW Y,YTEMP
      0084B5 FF               [ 2] 1073         LDW (X),Y
      0084B6 81               [ 4] 1074         RET
                                   1075 
                                   1076 ;       NOT     ( w -- w )
                                   1077 ;       One's complement of tos.
      0084B7 84 A1                 1078         .word      LINK
                           000439  1079 LINK = . 
      0084B9 03                    1080         .byte      3
      0084BA 4E 4F 54              1081         .ascii     "NOT"
      0084BD                       1082 INVER:
      0084BD 90 93            [ 1] 1083         LDW Y,X
      0084BF 90 FE            [ 2] 1084         LDW Y,(Y)
      0084C1 90 53            [ 2] 1085         CPLW Y
      0084C3 FF               [ 2] 1086         LDW (X),Y
      0084C4 81               [ 4] 1087         RET
                                   1088 
                                   1089 ;       NEGATE  ( n -- -n )
                                   1090 ;       Two's complement of tos.
      0084C5 84 B9                 1091         .word      LINK
                           000447  1092 LINK = . 
      0084C7 06                    1093         .byte      6
      0084C8 4E 45 47 41 54 45     1094         .ascii     "NEGATE"
      0084CE                       1095 NEGAT:
      0084CE 90 93            [ 1] 1096         LDW Y,X
      0084D0 90 FE            [ 2] 1097         LDW Y,(Y)
      0084D2 90 50            [ 2] 1098         NEGW Y
      0084D4 FF               [ 2] 1099         LDW (X),Y
      0084D5 81               [ 4] 1100         RET
                                   1101 
                                   1102 ;       DNEGATE ( d -- -d )
                                   1103 ;       Two's complement of top double.
      0084D6 84 C7                 1104         .word      LINK
                           000458  1105 LINK = . 
      0084D8 07                    1106         .byte      7
      0084D9 44 4E 45 47 41 54 45  1107         .ascii     "DNEGATE"
      0084E0                       1108 DNEGA:
      0084E0 90 93            [ 1] 1109         LDW Y,X
      0084E2 90 FE            [ 2] 1110 	LDW Y,(Y)
      0084E4 90 53            [ 2] 1111         CPLW Y     
      0084E6 90 BF 1E         [ 2] 1112 	LDW YTEMP,Y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]



      0084E9 90 93            [ 1] 1113         LDW Y,X
      0084EB 90 EE 02         [ 2] 1114         LDW Y,(2,Y)
      0084EE 90 53            [ 2] 1115         CPLW Y
      0084F0 90 5C            [ 2] 1116         INCW Y
      0084F2 EF 02            [ 2] 1117         LDW (2,X),Y
      0084F4 90 BE 1E         [ 2] 1118         LDW Y,YTEMP
      0084F7 24 02            [ 1] 1119         JRNC DN1 
      0084F9 90 5C            [ 2] 1120         INCW Y
      0084FB FF               [ 2] 1121 DN1:    LDW (X),Y
      0084FC 81               [ 4] 1122         RET
                                   1123 
                                   1124 ;       -       ( n1 n2 -- n1-n2 )
                                   1125 ;       Subtraction.
      0084FD 84 D8                 1126         .word      LINK
                           00047F  1127 LINK = . 
      0084FF 01                    1128         .byte      1
      008500 2D                    1129         .ascii     "-"
      008501                       1130 SUBB:
      008501 90 93            [ 1] 1131         LDW Y,X
      008503 90 FE            [ 2] 1132         LDW Y,(Y)
      008505 90 BF 1E         [ 2] 1133         LDW YTEMP,Y
      008508 1C 00 02         [ 2] 1134         ADDW X,#2
      00850B 90 93            [ 1] 1135         LDW Y,X
      00850D 90 FE            [ 2] 1136         LDW Y,(Y)
      00850F 72 B2 00 1E      [ 2] 1137         SUBW Y,YTEMP
      008513 FF               [ 2] 1138         LDW (X),Y
      008514 81               [ 4] 1139         RET
                                   1140 
                                   1141 ;       ABS     ( n -- n )
                                   1142 ;       Return  absolute value of n.
      008515 84 FF                 1143         .word      LINK
                           000497  1144 LINK = . 
      008517 03                    1145         .byte      3
      008518 41 42 53              1146         .ascii     "ABS"
      00851B                       1147 ABSS:
      00851B 90 93            [ 1] 1148         LDW Y,X
      00851D 90 FE            [ 2] 1149 	LDW Y,(Y)
      00851F 2A 03            [ 1] 1150         JRPL     AB1     ;negate:
      008521 90 50            [ 2] 1151         NEGW     Y     ;else negate hi byte
      008523 FF               [ 2] 1152         LDW (X),Y
      008524 81               [ 4] 1153 AB1:    RET
                                   1154 
                                   1155 ;       =       ( w w -- t )
                                   1156 ;       Return true if top two are =al.
      008525 85 17                 1157         .word      LINK
                           0004A7  1158 LINK = . 
      008527 01                    1159         .byte      1
      008528 3D                    1160         .ascii     "="
      008529                       1161 EQUAL:
      008529 A6 FF            [ 1] 1162         LD A,#0xFF  ;true
      00852B 90 93            [ 1] 1163         LDW Y,X    ;D = n2
      00852D 90 FE            [ 2] 1164         LDW Y,(Y)
      00852F 90 BF 1E         [ 2] 1165         LDW YTEMP,Y
      008532 1C 00 02         [ 2] 1166         ADDW X,#2
      008535 90 93            [ 1] 1167         LDW Y,X
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



      008537 90 FE            [ 2] 1168         LDW Y,(Y)
      008539 90 B3 1E         [ 2] 1169         CPW Y,YTEMP     ;if n2 <> n1
      00853C 27 01            [ 1] 1170         JREQ     EQ1
      00853E 4F               [ 1] 1171         CLR A
      00853F F7               [ 1] 1172 EQ1:    LD (X),A
      008540 E7 01            [ 1] 1173         LD (1,X),A
      008542 81               [ 4] 1174 	RET     
                                   1175 
                                   1176 ;       U<      ( u u -- t )
                                   1177 ;       Unsigned compare of top two items.
      008543 85 27                 1178         .word      LINK
                           0004C5  1179 LINK = . 
      008545 02                    1180         .byte      2
      008546 55 3C                 1181         .ascii     "U<"
      008548                       1182 ULESS:
      008548 A6 FF            [ 1] 1183         LD A,#0xFF  ;true
      00854A 90 93            [ 1] 1184         LDW Y,X    ;D = n2
      00854C 90 FE            [ 2] 1185         LDW Y,(Y)
      00854E 90 BF 1E         [ 2] 1186         LDW YTEMP,Y
      008551 1C 00 02         [ 2] 1187         ADDW X,#2
      008554 90 93            [ 1] 1188         LDW Y,X
      008556 90 FE            [ 2] 1189         LDW Y,(Y)
      008558 90 B3 1E         [ 2] 1190         CPW Y,YTEMP     ;if n2 <> n1
      00855B 25 01            [ 1] 1191         JRULT     ULES1
      00855D 4F               [ 1] 1192         CLR A
      00855E F7               [ 1] 1193 ULES1:  LD (X),A
      00855F E7 01            [ 1] 1194         LD (1,X),A
      008561 81               [ 4] 1195 	RET     
                                   1196 
                                   1197 ;       <       ( n1 n2 -- t )
                                   1198 ;       Signed compare of top two items.
      008562 85 45                 1199         .word      LINK
                           0004E4  1200 LINK = . 
      008564 01                    1201         .byte      1
      008565 3C                    1202         .ascii     "<"
      008566                       1203 LESS:
      008566 A6 FF            [ 1] 1204         LD A,#0xFF  ;true
      008568 90 93            [ 1] 1205         LDW Y,X    ;D = n2
      00856A 90 FE            [ 2] 1206         LDW Y,(Y)
      00856C 90 BF 1E         [ 2] 1207         LDW YTEMP,Y
      00856F 1C 00 02         [ 2] 1208         ADDW X,#2
      008572 90 93            [ 1] 1209         LDW Y,X
      008574 90 FE            [ 2] 1210         LDW Y,(Y)
      008576 90 B3 1E         [ 2] 1211         CPW Y,YTEMP     ;if n2 <> n1
      008579 2F 01            [ 1] 1212         JRSLT     LT1
      00857B 4F               [ 1] 1213         CLR A
      00857C F7               [ 1] 1214 LT1:    LD (X),A
      00857D E7 01            [ 1] 1215         LD (1,X),A
      00857F 81               [ 4] 1216 	RET     
                                   1217 
                                   1218 ;       MAX     ( n n -- n )
                                   1219 ;       Return greater of two top items.
      008580 85 64                 1220         .word      LINK
                           000502  1221 LINK = . 
      008582 03                    1222         .byte      3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]



      008583 4D 41 58              1223         .ascii     "MAX"
      008586                       1224 MAX:
      008586 90 93            [ 1] 1225         LDW Y,X    ;D = n2
      008588 90 EE 02         [ 2] 1226         LDW Y,(2,Y)
      00858B 90 BF 1E         [ 2] 1227         LDW YTEMP,Y
      00858E 90 93            [ 1] 1228         LDW Y,X
      008590 90 FE            [ 2] 1229         LDW Y,(Y)
      008592 90 B3 1E         [ 2] 1230         CPW Y,YTEMP     ;if n2 <> n1
      008595 2F 02            [ 1] 1231         JRSLT     MAX1
      008597 EF 02            [ 2] 1232         LDW (2,X),Y
      008599 1C 00 02         [ 2] 1233 MAX1:   ADDW X,#2
      00859C 81               [ 4] 1234 	RET     
                                   1235 
                                   1236 ;       MIN     ( n n -- n )
                                   1237 ;       Return smaller of top two items.
      00859D 85 82                 1238         .word      LINK
                           00051F  1239 LINK = . 
      00859F 03                    1240         .byte      3
      0085A0 4D 49 4E              1241         .ascii     "MIN"
      0085A3                       1242 MIN:
      0085A3 90 93            [ 1] 1243         LDW Y,X    ;D = n2
      0085A5 90 EE 02         [ 2] 1244         LDW Y,(2,Y)
      0085A8 90 BF 1E         [ 2] 1245         LDW YTEMP,Y
      0085AB 90 93            [ 1] 1246         LDW Y,X
      0085AD 90 FE            [ 2] 1247         LDW Y,(Y)
      0085AF 90 B3 1E         [ 2] 1248         CPW Y,YTEMP     ;if n2 <> n1
      0085B2 2C 02            [ 1] 1249         JRSGT     MIN1
      0085B4 EF 02            [ 2] 1250         LDW (2,X),Y
      0085B6 1C 00 02         [ 2] 1251 MIN1:	ADDW X,#2
      0085B9 81               [ 4] 1252 	RET     
                                   1253 
                                   1254 ;       WITHIN  ( u ul uh -- t )
                                   1255 ;       Return true if u is within
                                   1256 ;       range of ul and uh. ( ul <= u < uh )
      0085BA 85 9F                 1257         .word      LINK
                           00053C  1258 LINK = . 
      0085BC 06                    1259         .byte      6
      0085BD 57 49 54 48 49 4E     1260         .ascii     "WITHIN"
      0085C3                       1261 WITHI:
      0085C3 CD 83 11         [ 4] 1262         CALL     OVER
      0085C6 CD 85 01         [ 4] 1263         CALL     SUBB
      0085C9 CD 82 B0         [ 4] 1264         CALL     TOR
      0085CC CD 85 01         [ 4] 1265         CALL     SUBB
      0085CF CD 82 91         [ 4] 1266         CALL     RFROM
      0085D2 CC 85 48         [ 2] 1267         JP     ULESS
                                   1268 
                                   1269 ;; Divide
                                   1270 
                                   1271 ;       UM/MOD  ( udl udh un -- ur uq )
                                   1272 ;       Unsigned divide of a double by a
                                   1273 ;       single. Return mod and quotient.
      0085D5 85 BC                 1274         .word      LINK
                           000557  1275 LINK = . 
      0085D7 06                    1276         .byte      6
      0085D8 55 4D 2F 4D 4F 44     1277         .ascii     "UM/MOD"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



      0085DE                       1278 UMMOD:
      0085DE BF 1C            [ 2] 1279 	LDW XTEMP,X	; save stack pointer
      0085E0 FE               [ 2] 1280 	LDW X,(X)	; un
      0085E1 BF 1E            [ 2] 1281 	LDW YTEMP,X     ; save un
      0085E3 90 BE 1C         [ 2] 1282 	LDW Y,XTEMP	; stack pointer
      0085E6 90 EE 04         [ 2] 1283 	LDW Y,(4,Y)     ; Y=udl
      0085E9 BE 1C            [ 2] 1284 	LDW X,XTEMP
      0085EB EE 02            [ 2] 1285 	LDW X,(2,X)	; X=udh
      0085ED B3 1E            [ 2] 1286 	CPW X,YTEMP
      0085EF 23 0F            [ 2] 1287 	JRULE MMSM1
      0085F1 BE 1C            [ 2] 1288 	LDW X,XTEMP
      0085F3 1C 00 02         [ 2] 1289 	ADDW X,#2	; pop off 1 level
      0085F6 90 AE FF FF      [ 2] 1290 	LDW Y,#0xFFFF
      0085FA FF               [ 2] 1291 	LDW (X),Y
      0085FB 90 5F            [ 1] 1292 	CLRW Y
      0085FD EF 02            [ 2] 1293 	LDW (2,X),Y
      0085FF 81               [ 4] 1294 	RET
      008600                       1295 MMSM1:
                           000001  1296 .if  PICATOUT_MOD 
                                   1297 ; take advantage of divw x,y when udh==0
      008600 5D               [ 2] 1298         tnzw x  ; is udh==0?
      008601 26 11            [ 1] 1299         jrne MMSM2 
      008603 93               [ 1] 1300         ldw x,y    ;udl 
      008604 90 BE 1E         [ 2] 1301         ldw y,YTEMP ; divisor 
      008607 65               [ 2] 1302         divw x,y 
      008608 89               [ 2] 1303         pushw x     ; quotient 
      008609 BE 1C            [ 2] 1304         ldw x,XTEMP 
      00860B 1C 00 02         [ 2] 1305         addw x,#CELLL 
      00860E EF 02            [ 2] 1306         ldw (2,x),y  ; ur
      008610 90 85            [ 2] 1307         popw y 
      008612 FF               [ 2] 1308         ldw (x),y ; uq 
      008613 81               [ 4] 1309         ret 
      008614                       1310 MMSM2:        
                                   1311 .endif 
      008614 A6 11            [ 1] 1312 	LD A,#17	; loop count
      008616                       1313 MMSM3:
      008616 B3 1E            [ 2] 1314 	CPW X,YTEMP	; compare udh to un
      008618 25 04            [ 1] 1315 	JRULT MMSM4	; can't subtract
      00861A 72 B0 00 1E      [ 2] 1316 	SUBW X,YTEMP	; can subtract
      00861E                       1317 MMSM4:
      00861E 8C               [ 1] 1318 	CCF	; quotient bit
      00861F 90 59            [ 2] 1319 	RLCW Y	; rotate into quotient
      008621 59               [ 2] 1320 	RLCW X	; rotate into remainder
      008622 4A               [ 1] 1321 	DEC A	; repeat
      008623 22 F1            [ 1] 1322 	JRUGT MMSM3
      008625 57               [ 2] 1323 	SRAW X
      008626 BF 1E            [ 2] 1324 	LDW YTEMP,X	; done, save remainder
      008628 BE 1C            [ 2] 1325 	LDW X,XTEMP
      00862A 1C 00 02         [ 2] 1326 	ADDW X,#2	; drop
      00862D FF               [ 2] 1327 	LDW (X),Y
      00862E 90 BE 1E         [ 2] 1328 	LDW Y,YTEMP	; save quotient
      008631 EF 02            [ 2] 1329 	LDW (2,X),Y
      008633 81               [ 4] 1330 	RET
                                   1331 	
                                   1332 ;       M/MOD   ( d n -- r q )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



                                   1333 ;       Signed floored divide of double by
                                   1334 ;       single. Return mod and quotient.
      008634 85 D7                 1335         .word      LINK
                           0005B6  1336 LINK = . 
      008636 05                    1337         .byte      5
      008637 4D 2F 4D 4F 44        1338         .ascii     "M/MOD"
      00863C                       1339 MSMOD:  
      00863C CD 82 E7         [ 4] 1340         CALL	DUPP
      00863F CD 83 20         [ 4] 1341         CALL	ZLESS
      008642 CD 82 E7         [ 4] 1342         CALL	DUPP
      008645 CD 82 B0         [ 4] 1343         CALL	TOR
      008648 CD 81 EB         [ 4] 1344         CALL	QBRAN
      00864B 86 59                 1345         .word	MMOD1
      00864D CD 84 CE         [ 4] 1346         CALL	NEGAT
      008650 CD 82 B0         [ 4] 1347         CALL	TOR
      008653 CD 84 E0         [ 4] 1348         CALL	DNEGA
      008656 CD 82 91         [ 4] 1349         CALL	RFROM
      008659 CD 82 B0         [ 4] 1350 MMOD1:	CALL	TOR
      00865C CD 82 E7         [ 4] 1351         CALL	DUPP
      00865F CD 83 20         [ 4] 1352         CALL	ZLESS
      008662 CD 81 EB         [ 4] 1353         CALL	QBRAN
      008665 86 6D                 1354         .word	MMOD2
      008667 CD 82 A4         [ 4] 1355         CALL	RAT
      00866A CD 84 A3         [ 4] 1356         CALL	PLUS
      00866D CD 82 91         [ 4] 1357 MMOD2:	CALL	RFROM
      008670 CD 85 DE         [ 4] 1358         CALL	UMMOD
      008673 CD 82 91         [ 4] 1359         CALL	RFROM
      008676 CD 81 EB         [ 4] 1360         CALL	QBRAN
      008679 86 84                 1361         .word	MMOD3
      00867B CD 82 F7         [ 4] 1362         CALL	SWAPP
      00867E CD 84 CE         [ 4] 1363         CALL	NEGAT
      008681 CD 82 F7         [ 4] 1364         CALL	SWAPP
      008684 81               [ 4] 1365 MMOD3:	RET
                                   1366 
                                   1367 ;       /MOD    ( n n -- r q )
                                   1368 ;       Signed divide. Return mod and quotient.
      008685 86 36                 1369         .word      LINK
                           000607  1370 LINK = . 
      008687 04                    1371         .byte      4
      008688 2F 4D 4F 44           1372         .ascii     "/MOD"
      00868C                       1373 SLMOD:
      00868C CD 83 11         [ 4] 1374         CALL	OVER
      00868F CD 83 20         [ 4] 1375         CALL	ZLESS
      008692 CD 82 F7         [ 4] 1376         CALL	SWAPP
      008695 CC 86 3C         [ 2] 1377         JP	MSMOD
                                   1378 
                                   1379 ;       MOD     ( n n -- r )
                                   1380 ;       Signed divide. Return mod only.
      008698 86 87                 1381         .word      LINK
                           00061A  1382 LINK = . 
      00869A 03                    1383         .byte      3
      00869B 4D 4F 44              1384         .ascii     "MOD"
      00869E                       1385 MODD:
      00869E CD 86 8C         [ 4] 1386 	CALL	SLMOD
      0086A1 CC 82 DD         [ 2] 1387 	JP	DROP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal [24-Bits]



                                   1388 
                                   1389 ;       /       ( n n -- q )
                                   1390 ;       Signed divide. Return quotient only.
      0086A4 86 9A                 1391         .word      LINK
                           000626  1392 LINK = . 
      0086A6 01                    1393         .byte      1
      0086A7 2F                    1394         .ascii     "/"
      0086A8                       1395 SLASH:
      0086A8 CD 86 8C         [ 4] 1396         CALL	SLMOD
      0086AB CD 82 F7         [ 4] 1397         CALL	SWAPP
      0086AE CC 82 DD         [ 2] 1398         JP	DROP
                                   1399 
                                   1400 ;; Multiply
                                   1401 
                                   1402 ;       UM*     ( u u -- ud )
                                   1403 ;       Unsigned multiply. Return double product.
      0086B1 86 A6                 1404         .word      LINK
                           000633  1405 LINK = . 
      0086B3 03                    1406         .byte      3
      0086B4 55 4D 2A              1407         .ascii     "UM*"
      0086B7                       1408 UMSTA:	; stack have 4 bytes u1=a,b u2=c,d
                           000001  1409 .if PICATOUT_MOD 
                                   1410 ; take advantage of SP addressing modes
                                   1411 ; these PRODx in RAM are not required
                                   1412 ; the product is kept on stack as local variable 
                                   1413         ;; bytes offset on data stack 
                           000002  1414         da=2 
                           000003  1415         db=3 
                           000000  1416         dc=0 
                           000001  1417         dd=1 
                                   1418         ;; product bytes offset on return stack 
                           000001  1419         UD1=1  ; ud bits 31..24
                           000002  1420         UD2=2  ; ud bits 23..16
                           000003  1421         UD3=3  ; ud bits 15..8 
                           000004  1422         UD4=4  ; ud bits 7..0 
                                   1423         ;; local variable for product set to zero   
      0086B7 90 5F            [ 1] 1424         clrw y 
      0086B9 90 89            [ 2] 1425         pushw y  ; bits 15..0
      0086BB 90 89            [ 2] 1426         pushw y  ; bits 31..16 
      0086BD E6 03            [ 1] 1427         ld a,(db,x) ; b 
      0086BF 90 97            [ 1] 1428         ld yl,a 
      0086C1 E6 01            [ 1] 1429         ld a,(dd,x)   ; d
      0086C3 90 42            [ 4] 1430         mul y,a    ; b*d  
      0086C5 17 03            [ 2] 1431         ldw (UD3,sp),y ; lowest weight product 
      0086C7 E6 03            [ 1] 1432         ld a,(db,x)
      0086C9 90 97            [ 1] 1433         ld yl,a 
      0086CB E6 00            [ 1] 1434         ld a,(dc,x)
      0086CD 90 42            [ 4] 1435         mul y,a  ; b*c 
                                   1436         ;;; do the partial sum 
      0086CF 72 F9 02         [ 2] 1437         addw y,(UD2,sp)
      0086D2 4F               [ 1] 1438         clr a 
      0086D3 49               [ 1] 1439         rlc a
      0086D4 6B 01            [ 1] 1440         ld (UD1,sp),a 
      0086D6 17 02            [ 2] 1441         ldw (UD2,sp),y 
      0086D8 E6 02            [ 1] 1442         ld a,(da,x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



      0086DA 90 97            [ 1] 1443         ld yl,a 
      0086DC E6 01            [ 1] 1444         ld a,(dd,x)
      0086DE 90 42            [ 4] 1445         mul y,a   ; a*d 
                                   1446         ;; do partial sum 
      0086E0 72 F9 02         [ 2] 1447         addw y,(UD2,sp)
      0086E3 4F               [ 1] 1448         clr a 
      0086E4 19 01            [ 1] 1449         adc a,(UD1,sp)
      0086E6 6B 01            [ 1] 1450         ld (UD1,sp),a  
      0086E8 17 02            [ 2] 1451         ldw (UD2,sp),y 
      0086EA E6 02            [ 1] 1452         ld a,(da,x)
      0086EC 90 97            [ 1] 1453         ld yl,a 
      0086EE E6 00            [ 1] 1454         ld a,(dc,x)
      0086F0 90 42            [ 4] 1455         mul y,a  ;  a*c highest weight product 
                                   1456         ;;; do partial sum 
      0086F2 72 F9 01         [ 2] 1457         addw y,(UD1,sp)
      0086F5 FF               [ 2] 1458         ldw (x),y  ; udh 
      0086F6 16 03            [ 2] 1459         ldw y,(UD3,sp)
      0086F8 EF 02            [ 2] 1460         ldw (2,x),y  ; udl  
      0086FA 5B 04            [ 2] 1461         addw sp,#4 ; drop local variable 
      0086FC 81               [ 4] 1462         ret  
                           000000  1463 .else
                                   1464 	LD A,(2,X)	; b
                                   1465 	LD YL,A
                                   1466 	LD A,(X)	; d
                                   1467 	MUL Y,A
                                   1468 	LDW PROD1,Y
                                   1469 	LD A,(3,X)	; a
                                   1470 	LD YL,A
                                   1471 	LD A,(X)	; d
                                   1472 	MUL Y,A
                                   1473 	LDW PROD2,Y
                                   1474 	LD A,(2,X)	; b
                                   1475 	LD YL,A
                                   1476 	LD A,(1,X)	; c
                                   1477 	MUL Y,A
                                   1478 	LDW PROD3,Y
                                   1479 	LD A,(3,X)	; a
                                   1480 	LD YL,A
                                   1481 	LD A,(1,X)	; c
                                   1482 	MUL Y,A	; least signifiant product
                                   1483 	CLR A
                                   1484 	RRWA Y
                                   1485 	LD (3,X),A	; store least significant byte
                                   1486 	ADDW Y,PROD3
                                   1487 	CLR A
                                   1488 	ADC A,#0	; save carry
                                   1489 	LD CARRY,A
                                   1490 	ADDW Y,PROD2
                                   1491 	LD A,CARRY
                                   1492 	ADC A,#0	; add 2nd carry
                                   1493 	LD CARRY,A
                                   1494 	CLR A
                                   1495 	RRWA Y
                                   1496 	LD (2,X),A	; 2nd product byte
                                   1497 	ADDW Y,PROD1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



                                   1498 	RRWA Y
                                   1499 	LD (1,X),A	; 3rd product byte
                                   1500 	RRWA Y  	; 4th product byte now in A
                                   1501 	ADC A,CARRY	; fill in carry bits
                                   1502 	LD (X),A
                                   1503 	RET
                                   1504 .endif 
                                   1505 
                                   1506 
                                   1507 ;       *       ( n n -- n )
                                   1508 ;       Signed multiply. Return single product.
      0086FD 86 B3                 1509         .word      LINK
                           00067F  1510 LINK = . 
      0086FF 01                    1511         .byte      1
      008700 2A                    1512         .ascii     "*"
      008701                       1513 STAR:
      008701 CD 86 B7         [ 4] 1514 	CALL	UMSTA
      008704 CC 82 DD         [ 2] 1515 	JP	DROP
                                   1516 
                                   1517 ;       M*      ( n n -- d )
                                   1518 ;       Signed multiply. Return double product.
      008707 86 FF                 1519         .word      LINK
                           000689  1520 LINK = . 
      008709 02                    1521         .byte      2
      00870A 4D 2A                 1522         .ascii     "M*"
      00870C                       1523 MSTAR:      
      00870C CD 84 8E         [ 4] 1524         CALL	DDUP
      00870F CD 83 5C         [ 4] 1525         CALL	XORR
      008712 CD 83 20         [ 4] 1526         CALL	ZLESS
      008715 CD 82 B0         [ 4] 1527         CALL	TOR
      008718 CD 85 1B         [ 4] 1528         CALL	ABSS
      00871B CD 82 F7         [ 4] 1529         CALL	SWAPP
      00871E CD 85 1B         [ 4] 1530         CALL	ABSS
      008721 CD 86 B7         [ 4] 1531         CALL	UMSTA
      008724 CD 82 91         [ 4] 1532         CALL	RFROM
      008727 CD 81 EB         [ 4] 1533         CALL	QBRAN
      00872A 87 2F                 1534         .word	MSTA1
      00872C CD 84 E0         [ 4] 1535         CALL	DNEGA
      00872F 81               [ 4] 1536 MSTA1:	RET
                                   1537 
                                   1538 ;       . /MOD   ( n1 n2 n3 -- r q )
                                   1539 ;       Multiply n1 and n2, then divide
                                   1540 ;       by n3. Return mod and quotient.
      008730 87 09                 1541         .word      LINK
                           0006B2  1542 LINK = . 
      008732 05                    1543         .byte      5
      008733 2A 2F 4D 4F 44        1544         .ascii     "*/MOD"
      008738                       1545 SSMOD:
      008738 CD 82 B0         [ 4] 1546         CALL     TOR
      00873B CD 87 0C         [ 4] 1547         CALL     MSTAR
      00873E CD 82 91         [ 4] 1548         CALL     RFROM
      008741 CC 86 3C         [ 2] 1549         JP     MSMOD
                                   1550 
                                   1551 ;       */      ( n1 n2 n3 -- q )
                                   1552 ;       Multiply n1 by n2, then divide
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



                                   1553 ;       by n3. Return quotient only.
      008744 87 32                 1554         .word      LINK
                           0006C6  1555 LINK = . 
      008746 02                    1556         .byte      2
      008747 2A 2F                 1557         .ascii     "*/"
      008749                       1558 STASL:
      008749 CD 87 38         [ 4] 1559         CALL	SSMOD
      00874C CD 82 F7         [ 4] 1560         CALL	SWAPP
      00874F CC 82 DD         [ 2] 1561         JP	DROP
                                   1562 
                                   1563 ;; Miscellaneous
                                   1564 
                                   1565 ;       CELL+   ( a -- a )
                                   1566 ;       Add cell size in byte to address.
      008752 87 46                 1567         .word      LINK
                           0006D4  1568 LINK = . 
      008754 02                    1569         .byte       2
      008755 32 2B                 1570         .ascii     "2+"
      008757                       1571 CELLP:
      008757 90 93            [ 1] 1572         LDW Y,X
      008759 90 FE            [ 2] 1573 	LDW Y,(Y)
      00875B 72 A9 00 02      [ 2] 1574         ADDW Y,#CELLL 
      00875F FF               [ 2] 1575         LDW (X),Y
      008760 81               [ 4] 1576         RET
                                   1577 
                                   1578 ;       CELL-   ( a -- a )
                                   1579 ;       Subtract 2 from address.
      008761 87 54                 1580         .word      LINK
                           0006E3  1581 LINK = . 
      008763 02                    1582         .byte       2
      008764 32 2D                 1583         .ascii     "2-"
      008766                       1584 CELLM:
      008766 90 93            [ 1] 1585         LDW Y,X
      008768 90 FE            [ 2] 1586 	LDW Y,(Y)
      00876A 72 A2 00 02      [ 2] 1587         SUBW Y,#CELLL
      00876E FF               [ 2] 1588         LDW (X),Y
      00876F 81               [ 4] 1589         RET
                                   1590 
                                   1591 ;       CELLS   ( n -- n )
                                   1592 ;       Multiply tos by 2.
      008770 87 63                 1593         .word      LINK
                           0006F2  1594 LINK = . 
      008772 02                    1595         .byte       2
      008773 32 2A                 1596         .ascii     "2*"
      008775                       1597 CELLS:
      008775 90 93            [ 1] 1598         LDW Y,X
      008777 90 FE            [ 2] 1599 	LDW Y,(Y)
      008779 90 58            [ 2] 1600         SLAW Y
      00877B FF               [ 2] 1601         LDW (X),Y
      00877C 81               [ 4] 1602         RET
                                   1603 
                                   1604 ;       1+      ( a -- a )
                                   1605 ;       Add cell size in byte to address.
      00877D 87 72                 1606         .word      LINK
                           0006FF  1607 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



      00877F 02                    1608         .byte      2
      008780 31 2B                 1609         .ascii     "1+"
      008782                       1610 ONEP:
      008782 90 93            [ 1] 1611         LDW Y,X
      008784 90 FE            [ 2] 1612 	LDW Y,(Y)
      008786 90 5C            [ 2] 1613         INCW Y
      008788 FF               [ 2] 1614         LDW (X),Y
      008789 81               [ 4] 1615         RET
                                   1616 
                                   1617 ;       1-      ( a -- a )
                                   1618 ;       Subtract 2 from address.
      00878A 87 7F                 1619         .word      LINK
                           00070C  1620 LINK = . 
      00878C 02                    1621         .byte      2
      00878D 31 2D                 1622         .ascii     "1-"
      00878F                       1623 ONEM:
      00878F 90 93            [ 1] 1624         LDW Y,X
      008791 90 FE            [ 2] 1625 	LDW Y,(Y)
      008793 90 5A            [ 2] 1626         DECW Y
      008795 FF               [ 2] 1627         LDW (X),Y
      008796 81               [ 4] 1628         RET
                                   1629 
                                   1630 ;       2/      ( n -- n )
                                   1631 ;       Multiply tos by 2.
      008797 87 8C                 1632         .word      LINK
                           000719  1633 LINK = . 
      008799 02                    1634         .byte      2
      00879A 32 2F                 1635         .ascii     "2/"
      00879C                       1636 TWOSL:
      00879C 90 93            [ 1] 1637         LDW Y,X
      00879E 90 FE            [ 2] 1638 	LDW Y,(Y)
      0087A0 90 57            [ 2] 1639         SRAW Y
      0087A2 FF               [ 2] 1640         LDW (X),Y
      0087A3 81               [ 4] 1641         RET
                                   1642 
                                   1643 ;       BL      ( -- 32 )
                                   1644 ;       Return 32,  blank character.
      0087A4 87 99                 1645         .word      LINK
                           000726  1646 LINK = . 
      0087A6 02                    1647         .byte      2
      0087A7 42 4C                 1648         .ascii     "BL"
      0087A9                       1649 BLANK:
      0087A9 1D 00 02         [ 2] 1650         SUBW X,#2
      0087AC 90 AE 00 20      [ 2] 1651 	LDW Y,#32
      0087B0 FF               [ 2] 1652         LDW (X),Y
      0087B1 81               [ 4] 1653         RET
                                   1654 
                                   1655 ;         0     ( -- 0)
                                   1656 ;         Return 0.
      0087B2 87 A6                 1657         .word      LINK
                           000734  1658 LINK = . 
      0087B4 01                    1659         .byte       1
      0087B5 30                    1660         .ascii     "0"
      0087B6                       1661 ZERO:
      0087B6 1D 00 02         [ 2] 1662         SUBW X,#2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



      0087B9 90 5F            [ 1] 1663 	CLRW Y
      0087BB FF               [ 2] 1664         LDW (X),Y
      0087BC 81               [ 4] 1665         RET
                                   1666 
                                   1667 ;         1     ( -- 1)
                                   1668 ;         Return 1.
      0087BD 87 B4                 1669         .word      LINK
                           00073F  1670 LINK = . 
      0087BF 01                    1671         .byte       1
      0087C0 31                    1672         .ascii     "1"
      0087C1                       1673 ONE:
      0087C1 1D 00 02         [ 2] 1674         SUBW X,#2
      0087C4 90 AE 00 01      [ 2] 1675 	LDW Y,#1
      0087C8 FF               [ 2] 1676         LDW (X),Y
      0087C9 81               [ 4] 1677         RET
                                   1678 
                                   1679 ;         -1    ( -- -1)
                                   1680 ;         Return 32,  blank character.
      0087CA 87 BF                 1681         .word      LINK
                           00074C  1682 LINK = . 
      0087CC 02                    1683         .byte       2
      0087CD 2D 31                 1684         .ascii     "-1"
      0087CF                       1685 MONE:
      0087CF 1D 00 02         [ 2] 1686         SUBW X,#2
      0087D2 90 AE FF FF      [ 2] 1687 	LDW Y,#0xFFFF
      0087D6 FF               [ 2] 1688         LDW (X),Y
      0087D7 81               [ 4] 1689         RET
                                   1690 
                                   1691 ;       >CHAR   ( c -- c )
                                   1692 ;       Filter non-printing characters.
      0087D8 87 CC                 1693         .word      LINK
                           00075A  1694 LINK = . 
      0087DA 05                    1695         .byte      5
      0087DB 3E 43 48 41 52        1696         .ascii     ">CHAR"
      0087E0                       1697 TCHAR:
                           000001  1698 .if CONVERT_TO_CODE
      0087E0 E6 01            [ 1] 1699         ld a,(1,x)
      0087E2 A1 20            [ 1] 1700         cp a,#32  
      0087E4 2B 05            [ 1] 1701         jrmi 1$ 
      0087E6 A1 7F            [ 1] 1702         cp a,#127 
      0087E8 2A 01            [ 1] 1703         jrpl 1$ 
      0087EA 81               [ 4] 1704         ret 
      0087EB A6 5F            [ 1] 1705 1$:     ld a,#'_ 
      0087ED E7 01            [ 1] 1706         ld (1,x),a 
      0087EF 81               [ 4] 1707         ret 
                           000000  1708 .else
                                   1709         CALL     DOLIT
                                   1710         .word       0x7F
                                   1711         CALL     ANDD
                                   1712         CALL     DUPP    ;mask msb
                                   1713         CALL     DOLIT
                                   1714         .word      127
                                   1715         CALL     BLANK
                                   1716         CALL     WITHI   ;check for printable
                                   1717         CALL     QBRAN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



                                   1718         .word    TCHA1
                                   1719         CALL     DROP
                                   1720         CALL     DOLIT
                                   1721         .word     0x5F		; "_"     ;replace non-printables
                                   1722 .endif 
      0087F0 81               [ 4] 1723 TCHA1:  RET
                                   1724 
                                   1725 ;       DEPTH   ( -- n )
                                   1726 ;       Return  depth of  data stack.
      0087F1 87 DA                 1727         .word      LINK
                           000773  1728 LINK = . 
      0087F3 05                    1729         .byte      5
      0087F4 44 45 50 54 48        1730         .ascii     "DEPTH"
      0087F9                       1731 DEPTH: 
      0087F9 90 BE 24         [ 2] 1732         LDW Y,SP0    ;save data stack ptr
      0087FC BF 1C            [ 2] 1733 	LDW XTEMP,X
      0087FE 72 B2 00 1C      [ 2] 1734         SUBW Y,XTEMP     ;#bytes = SP0 - X
      008802 90 57            [ 2] 1735         SRAW Y    ;Y = #stack items
                           000001  1736 .if PICATOUT_MOD
                                   1737 ; why ? 
                                   1738 ;      	DECW Y
                                   1739 .endif 
      008804 1D 00 02         [ 2] 1740 	SUBW X,#2
      008807 FF               [ 2] 1741         LDW (X),Y     ; if neg, underflow
      008808 81               [ 4] 1742         RET
                                   1743 
                                   1744 ;       PICK    ( ... +n -- ... w )
                                   1745 ;       Copy  nth stack item to tos.
      008809 87 F3                 1746         .word      LINK
                           00078B  1747 LINK = . 
      00880B 04                    1748         .byte      4
      00880C 50 49 43 4B           1749         .ascii     "PICK"
      008810                       1750 PICK:
      008810 90 93            [ 1] 1751         LDW Y,X   ;D = n1
      008812 90 FE            [ 2] 1752         LDW Y,(Y)
      008814 90 58            [ 2] 1753         SLAW Y
      008816 BF 1C            [ 2] 1754         LDW XTEMP,X
      008818 72 B9 00 1C      [ 2] 1755         ADDW Y,XTEMP
      00881C 90 FE            [ 2] 1756         LDW Y,(Y)
      00881E FF               [ 2] 1757         LDW (X),Y
      00881F 81               [ 4] 1758         RET
                                   1759 
                                   1760 ;; Memory access
                                   1761 
                                   1762 ;       +!      ( n a -- )
                                   1763 ;       Add n to  contents at address a.
      008820 88 0B                 1764         .word      LINK
                           0007A2  1765 LINK = . 
      008822 02                    1766         .byte      2
      008823 2B 21                 1767         .ascii     "+!"
      008825                       1768 PSTOR:
                           000001  1769 .if CONVERT_TO_CODE
      008825 90 93            [ 1] 1770         ldw y,x 
      008827 90 FE            [ 2] 1771         ldw y,(y)
      008829 90 BF 1E         [ 2] 1772         ldw YTEMP,y  ; address
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



      00882C 90 FE            [ 2] 1773         ldw y,(y)  
      00882E 90 89            [ 2] 1774         pushw y  ; value at address 
      008830 90 93            [ 1] 1775         ldw y,x 
      008832 90 EE 02         [ 2] 1776         ldw y,(2,y) ; n 
      008835 72 F9 01         [ 2] 1777         addw y,(1,sp) ; n+value
      008838 91 CF 1E         [ 5] 1778         ldw [YTEMP],y ;  a!
      00883B 90 85            [ 2] 1779         popw y    ;drop local var
      00883D 1C 00 04         [ 2] 1780         addw x,#4 ; DDROP 
      008840 81               [ 4] 1781         ret 
                           000000  1782 .else
                                   1783         CALL	SWAPP
                                   1784         CALL	OVER
                                   1785         CALL	AT
                                   1786         CALL	PLUS
                                   1787         CALL	SWAPP
                                   1788         JP	STORE
                                   1789 .endif 
                                   1790 ;       2!      ( d a -- )
                                   1791 ;       Store  double integer to address a.
      008841 88 22                 1792         .word      LINK
                           0007C3  1793 LINK = . 
      008843 02                    1794         .byte      2
      008844 32 21                 1795         .ascii     "2!"
      008846                       1796 DSTOR:
                           000001  1797 .if CONVERT_TO_CODE
      008846 90 93            [ 1] 1798         ldw y,x 
      008848 90 FE            [ 2] 1799         ldw y,(y)
      00884A 90 BF 1E         [ 2] 1800         ldw YTEMP,y ; address 
      00884D 1C 00 02         [ 2] 1801         addw x,#CELLL ; drop a 
      008850 90 93            [ 1] 1802         ldw y,x 
      008852 90 FE            [ 2] 1803         ldw y,(y) ; hi word 
      008854 89               [ 2] 1804         pushw x 
      008855 EE 02            [ 2] 1805         ldw x,(2,x) ; lo word 
      008857 91 CF 1E         [ 5] 1806         ldw [YTEMP],y
      00885A 90 93            [ 1] 1807         ldw y,x 
      00885C AE 00 02         [ 2] 1808         ldw x,#2 
      00885F 92 DF 1E         [ 5] 1809         ldw ([YTEMP],x),y 
      008862 85               [ 2] 1810         popw x 
      008863 1C 00 04         [ 2] 1811         addw x,#4 ; DDROP 
      008866 81               [ 4] 1812         ret 
                           000000  1813 .else
                                   1814         CALL	SWAPP
                                   1815         CALL	OVER
                                   1816         CALL	STORE
                                   1817         CALL	CELLP
                                   1818         JP	STORE
                                   1819 .endif 
                                   1820 ;       2@      ( a -- d )
                                   1821 ;       Fetch double integer from address a.
      008867 88 43                 1822         .word      LINK
                           0007E9  1823 LINK = . 
      008869 02                    1824         .byte      2
      00886A 32 40                 1825         .ascii     "2@"
      00886C                       1826 DAT:
                           000001  1827 .if CONVERT_TO_CODE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



      00886C 90 93            [ 1] 1828         ldw y,x 
      00886E 90 FE            [ 2] 1829         ldw y,(y) ;address 
      008870 90 BF 1E         [ 2] 1830         ldw YTEMP,y 
      008873 1D 00 02         [ 2] 1831         subw x,#CELLL ; space for udh 
      008876 91 CE 1E         [ 5] 1832         ldw y,[YTEMP] ; udh 
      008879 FF               [ 2] 1833         ldw (x),y 
      00887A 90 AE 00 02      [ 2] 1834         ldw y,#2
      00887E 91 DE 1E         [ 5] 1835         ldw y,([YTEMP],y) ; udl 
      008881 EF 02            [ 2] 1836         ldw (2,x),y
      008883 81               [ 4] 1837         ret 
                           000000  1838 .else 
                                   1839         CALL	DUPP
                                   1840         CALL	CELLP
                                   1841         CALL	AT
                                   1842         CALL	SWAPP
                                   1843         JP	AT
                                   1844 .endif 
                                   1845 
                                   1846 ;       COUNT   ( b -- b +n )
                                   1847 ;       Return count byte of a string
                                   1848 ;       and add 1 to byte address.
      008884 88 69                 1849         .word      LINK
                           000806  1850 LINK = . 
      008886 05                    1851         .byte      5
      008887 43 4F 55 4E 54        1852         .ascii     "COUNT"
      00888C                       1853 COUNT:
                           000001  1854 .if CONVERT_TO_CODE
      00888C 90 93            [ 1] 1855         ldw y,x 
      00888E 90 FE            [ 2] 1856         ldw y,(y) ; address 
      008890 90 F6            [ 1] 1857         ld a,(y)  ; count 
      008892 90 5C            [ 2] 1858         incw y 
      008894 FF               [ 2] 1859         ldw (x),y 
      008895 1D 00 02         [ 2] 1860         subw x,#CELLL 
      008898 E7 01            [ 1] 1861         ld (1,x),a 
      00889A 7F               [ 1] 1862         clr (x)
      00889B 81               [ 4] 1863         ret 
                           000000  1864 .else 
                                   1865         CALL     DUPP
                                   1866         CALL     ONEP
                                   1867         CALL     SWAPP
                                   1868         JP     CAT
                                   1869 .endif 
                                   1870 
                                   1871 ;       HERE    ( -- a )
                                   1872 ;       Return  top of  code dictionary.
      00889C 88 86                 1873         .word      LINK
                           00081E  1874 LINK = . 
      00889E 04                    1875         .byte      4
      00889F 48 45 52 45           1876         .ascii     "HERE"
      0088A3                       1877 HERE:
                           000001  1878 .if CONVERT_TO_CODE
      0088A3 90 AE 00 16      [ 2] 1879       	ldw y,#UCP 
      0088A7 90 FE            [ 2] 1880         ldw y,(y)
      0088A9 1D 00 02         [ 2] 1881         subw x,#CELLL 
      0088AC FF               [ 2] 1882         ldw (x),y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



      0088AD 81               [ 4] 1883         ret 
                           000000  1884 .else
                                   1885         CALL     CPP
                                   1886         JP     AT
                                   1887 .endif 
                                   1888 
                                   1889 ;       PAD     ( -- a )
                                   1890 ;       Return address of text buffer
                                   1891 ;       above  code dictionary.
      0088AE 88 9E                 1892         .word      LINK
                           000830  1893 LINK = . 
      0088B0 03                    1894         .byte      3
      0088B1 50 41 44              1895         .ascii     "PAD"
      0088B4                       1896 PAD:
      0088B4 CD 88 A3         [ 4] 1897         CALL     HERE
      0088B7 CD 81 B8         [ 4] 1898         CALL     DOLIT
      0088BA 00 50                 1899         .word      80
      0088BC CC 84 A3         [ 2] 1900         JP     PLUS
                                   1901 
                                   1902 ;       TIB     ( -- a )
                                   1903 ;       Return address of terminal input buffer.
      0088BF 88 B0                 1904         .word      LINK
                           000841  1905 LINK = . 
      0088C1 03                    1906         .byte      3
      0088C2 54 49 42              1907         .ascii     "TIB"
      0088C5                       1908 TIB:
      0088C5 CD 83 D2         [ 4] 1909         CALL     NTIB
      0088C8 CD 87 57         [ 4] 1910         CALL     CELLP
      0088CB CC 82 40         [ 2] 1911         JP     AT
                                   1912 
                                   1913 ;       @EXECUTE        ( a -- )
                                   1914 ;       Execute vector stored in address a.
      0088CE 88 C1                 1915         .word      LINK
                           000850  1916 LINK = . 
      0088D0 08                    1917         .byte      8
      0088D1 40 45 58 45 43 55 54  1918         .ascii     "@EXECUTE"
             45
      0088D9                       1919 ATEXE:
      0088D9 CD 82 40         [ 4] 1920         CALL     AT
      0088DC CD 84 52         [ 4] 1921         CALL     QDUP    ;?address or zero
      0088DF CD 81 EB         [ 4] 1922         CALL     QBRAN
      0088E2 88 E7                 1923         .word      EXE1
      0088E4 CD 82 12         [ 4] 1924         CALL     EXECU   ;execute if non-zero
      0088E7 81               [ 4] 1925 EXE1:   RET     ;do nothing if zero
                                   1926 
                                   1927 ;       CMOVE   ( b1 b2 u -- )
                                   1928 ;       Copy u bytes from b1 to b2.
      0088E8 88 D0                 1929         .word      LINK
                           00086A  1930 LINK = . 
      0088EA 05                    1931         .byte      5
      0088EB 43 4D 4F 56 45        1932         .ascii     "CMOVE"
      0088F0                       1933 CMOVE:
      0088F0 CD 82 B0         [ 4] 1934         CALL	TOR
      0088F3 CD 82 02         [ 4] 1935         CALL	BRAN
      0088F6 89 10                 1936         .word	CMOV2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



      0088F8 CD 82 B0         [ 4] 1937 CMOV1:	CALL	TOR
      0088FB CD 82 E7         [ 4] 1938         CALL	DUPP
      0088FE CD 82 5E         [ 4] 1939         CALL	CAT
      008901 CD 82 A4         [ 4] 1940         CALL	RAT
      008904 CD 82 4D         [ 4] 1941         CALL	CSTOR
      008907 CD 87 82         [ 4] 1942         CALL	ONEP
      00890A CD 82 91         [ 4] 1943         CALL	RFROM
      00890D CD 87 82         [ 4] 1944         CALL	ONEP
      008910 CD 81 CC         [ 4] 1945 CMOV2:	CALL	DONXT
      008913 88 F8                 1946         .word	CMOV1
      008915 CC 84 83         [ 2] 1947         JP	DDROP
                                   1948 
                                   1949 ;       FILL    ( b u c -- )
                                   1950 ;       Fill u bytes of character c
                                   1951 ;       to area beginning at b.
      008918 88 EA                 1952         .word       LINK
                           00089A  1953 LINK = . 
      00891A 04                    1954         .byte       4
      00891B 46 49 4C 4C           1955         .ascii     "FILL"
      00891F                       1956 FILL:
                           000001  1957 .if CONVERT_TO_CODE
      00891F 90 93            [ 1] 1958         ldw y,x 
      008921 90 E6 01         [ 1] 1959         ld a,(1,y) ; c 
      008924 1C 00 02         [ 2] 1960         addw x,#CELLL ; drop c 
      008927 90 93            [ 1] 1961         ldw y,x 
      008929 90 FE            [ 2] 1962         ldw y,(y) ; count
      00892B 90 89            [ 2] 1963         pushw y 
      00892D 1C 00 02         [ 2] 1964         addw x,#CELLL ; drop u 
      008930 90 93            [ 1] 1965         ldw y,x 
      008932 1C 00 02         [ 2] 1966         addw x,#CELLL ; drop b 
      008935 90 FE            [ 2] 1967         ldw y,(y) ; address
      008937 90 BF 1E         [ 2] 1968         ldw YTEMP,y
      00893A 90 85            [ 2] 1969         popw y ; count 
      00893C                       1970 FILL1:  
      00893C 92 C7 1E         [ 4] 1971         ld [YTEMP],a 
      00893F 3C 1F            [ 1] 1972         inc YTEMP+1
      008941 24 02            [ 1] 1973         jrnc FILL2 
      008943 3C 1E            [ 1] 1974         inc YTEMP
      008945                       1975 FILL2: 
      008945 90 5A            [ 2] 1976         decw y ; count 
      008947 26 F3            [ 1] 1977         jrne FILL1  
      008949 81               [ 4] 1978         ret 
                           000000  1979 .else 
                                   1980         CALL	SWAPP
                                   1981         CALL	TOR
                                   1982         CALL	SWAPP
                                   1983         CALL	BRAN
                                   1984         .word	FILL2
                                   1985 FILL1:	CALL	DDUP
                                   1986         CALL	CSTOR
                                   1987         CALL	ONEP
                                   1988 FILL2:	CALL	DONXT
                                   1989         .word	FILL1
                                   1990         JP	DDROP
                                   1991 .endif
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



                                   1992 
                                   1993 ;       ERASE   ( b u -- )
                                   1994 ;       Erase u bytes beginning at b.
      00894A 89 1A                 1995         .word      LINK
                           0008CC  1996 LINK = . 
      00894C 05                    1997         .byte      5
      00894D 45 52 41 53 45        1998         .ascii     "ERASE"
      008952                       1999 ERASE:
                           000001  2000 .if CONVERT_TO_CODE
      008952 90 5F            [ 1] 2001         clrw y 
      008954 1D 00 02         [ 2] 2002         subw x,#CELLL 
      008957 FF               [ 2] 2003         ldw (x),y 
      008958 CC 89 1F         [ 2] 2004         jp FILL 
                           000000  2005 .else 
                                   2006         CALL     ZERO
                                   2007         JP     FILL
                                   2008 .endif 
                                   2009 ;       PACK0x   ( b u a -- a )
                                   2010 ;       Build a counted string with
                                   2011 ;       u characters from b. Null fill.
      00895B 89 4C                 2012         .word      LINK
                           0008DD  2013 LINK = . 
      00895D 05                    2014         .byte      5
      00895E 50 41 43 4B 30 58     2015         .ascii     "PACK0X"
      008964                       2016 PACKS:
      008964 CD 82 E7         [ 4] 2017         CALL     DUPP
      008967 CD 82 B0         [ 4] 2018         CALL     TOR     ;strings only on cell boundary
      00896A CD 84 8E         [ 4] 2019         CALL     DDUP
      00896D CD 82 4D         [ 4] 2020         CALL     CSTOR
      008970 CD 87 82         [ 4] 2021         CALL     ONEP ;save count
      008973 CD 82 F7         [ 4] 2022         CALL     SWAPP
      008976 CD 88 F0         [ 4] 2023         CALL     CMOVE
      008979 CD 82 91         [ 4] 2024         CALL     RFROM
      00897C 81               [ 4] 2025         RET
                                   2026 
                                   2027 ;; Numeric output, single precision
                                   2028 
                                   2029 ;       DIGIT   ( u -- c )
                                   2030 ;       Convert digit u to a character.
      00897D 89 5D                 2031         .word      LINK
                           0008FF  2032 LINK = . 
      00897F 05                    2033         .byte      5
      008980 44 49 47 49 54        2034         .ascii     "DIGIT"
      008985                       2035 DIGIT:
      008985 CD 81 B8         [ 4] 2036         CALL	DOLIT
      008988 00 09                 2037         .word	9
      00898A CD 83 11         [ 4] 2038         CALL	OVER
      00898D CD 85 66         [ 4] 2039         CALL	LESS
      008990 CD 81 B8         [ 4] 2040         CALL	DOLIT
      008993 00 07                 2041         .word	7
      008995 CD 83 33         [ 4] 2042         CALL	ANDD
      008998 CD 84 A3         [ 4] 2043         CALL	PLUS
      00899B CD 81 B8         [ 4] 2044         CALL	DOLIT
      00899E 00 30                 2045         .word	48	;'0'
      0089A0 CC 84 A3         [ 2] 2046         JP	PLUS
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



                                   2047 
                                   2048 ;       EXTRACT ( n base -- n c )
                                   2049 ;       Extract least significant digit from n.
      0089A3 89 7F                 2050         .word      LINK
                           000925  2051 LINK = . 
      0089A5 07                    2052         .byte      7
      0089A6 45 58 54 52 41 43 54  2053         .ascii     "EXTRACT"
      0089AD                       2054 EXTRC:
      0089AD CD 87 B6         [ 4] 2055         CALL     ZERO
      0089B0 CD 82 F7         [ 4] 2056         CALL     SWAPP
      0089B3 CD 85 DE         [ 4] 2057         CALL     UMMOD
      0089B6 CD 82 F7         [ 4] 2058         CALL     SWAPP
      0089B9 CC 89 85         [ 2] 2059         JP     DIGIT
                                   2060 
                                   2061 ;       <#      ( -- )
                                   2062 ;       Initiate  numeric output process.
      0089BC 89 A5                 2063         .word      LINK
                           00093E  2064 LINK = . 
      0089BE 02                    2065         .byte      2
      0089BF 3C 23                 2066         .ascii     "<#"
      0089C1                       2067 BDIGS:
      0089C1 CD 88 B4         [ 4] 2068         CALL     PAD
      0089C4 CD 84 02         [ 4] 2069         CALL     HLD
      0089C7 CC 82 29         [ 2] 2070         JP     STORE
                                   2071 
                                   2072 ;       HOLD    ( c -- )
                                   2073 ;       Insert a character into output string.
      0089CA 89 BE                 2074         .word      LINK
                           00094C  2075 LINK = . 
      0089CC 04                    2076         .byte      4
      0089CD 48 4F 4C 44           2077         .ascii     "HOLD"
      0089D1                       2078 HOLD:
      0089D1 CD 84 02         [ 4] 2079         CALL     HLD
      0089D4 CD 82 40         [ 4] 2080         CALL     AT
      0089D7 CD 87 8F         [ 4] 2081         CALL     ONEM
      0089DA CD 82 E7         [ 4] 2082         CALL     DUPP
      0089DD CD 84 02         [ 4] 2083         CALL     HLD
      0089E0 CD 82 29         [ 4] 2084         CALL     STORE
      0089E3 CC 82 4D         [ 2] 2085         JP     CSTOR
                                   2086 
                                   2087 ;       #       ( u -- u )
                                   2088 ;       Extract one digit from u and
                                   2089 ;       append digit to output string.
      0089E6 89 CC                 2090         .word      LINK
                           000968  2091 LINK = . 
      0089E8 01                    2092         .byte      1
      0089E9 23                    2093         .ascii     "#"
      0089EA                       2094 DIG:
      0089EA CD 83 A4         [ 4] 2095         CALL     BASE
      0089ED CD 82 40         [ 4] 2096         CALL     AT
      0089F0 CD 89 AD         [ 4] 2097         CALL     EXTRC
      0089F3 CC 89 D1         [ 2] 2098         JP     HOLD
                                   2099 
                                   2100 ;       #S      ( u -- 0 )
                                   2101 ;       Convert u until all digits
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



                                   2102 ;       are added to output string.
      0089F6 89 E8                 2103         .word      LINK
                           000978  2104 LINK = . 
      0089F8 02                    2105         .byte      2
      0089F9 23 53                 2106         .ascii     "#S"
      0089FB                       2107 DIGS:
      0089FB CD 89 EA         [ 4] 2108 DIGS1:  CALL     DIG
      0089FE CD 82 E7         [ 4] 2109         CALL     DUPP
      008A01 CD 81 EB         [ 4] 2110         CALL     QBRAN
      008A04 8A 08                 2111         .word      DIGS2
      008A06 20 F3            [ 2] 2112         JRA     DIGS1
      008A08 81               [ 4] 2113 DIGS2:  RET
                                   2114 
                                   2115 ;       SIGN    ( n -- )
                                   2116 ;       Add a minus sign to
                                   2117 ;       numeric output string.
      008A09 89 F8                 2118         .word      LINK
                           00098B  2119 LINK = . 
      008A0B 04                    2120         .byte      4
      008A0C 53 49 47 4E           2121         .ascii     "SIGN"
      008A10                       2122 SIGN:
      008A10 CD 83 20         [ 4] 2123         CALL     ZLESS
      008A13 CD 81 EB         [ 4] 2124         CALL     QBRAN
      008A16 8A 20                 2125         .word      SIGN1
      008A18 CD 81 B8         [ 4] 2126         CALL     DOLIT
      008A1B 00 2D                 2127         .word      45	;"-"
      008A1D CC 89 D1         [ 2] 2128         JP     HOLD
      008A20 81               [ 4] 2129 SIGN1:  RET
                                   2130 
                                   2131 ;       #>      ( w -- b u )
                                   2132 ;       Prepare output string.
      008A21 8A 0B                 2133         .word      LINK
                           0009A3  2134 LINK = . 
      008A23 02                    2135         .byte      2
      008A24 23 3E                 2136         .ascii     "#>"
      008A26                       2137 EDIGS:
      008A26 CD 82 DD         [ 4] 2138         CALL     DROP
      008A29 CD 84 02         [ 4] 2139         CALL     HLD
      008A2C CD 82 40         [ 4] 2140         CALL     AT
      008A2F CD 88 B4         [ 4] 2141         CALL     PAD
      008A32 CD 83 11         [ 4] 2142         CALL     OVER
      008A35 CC 85 01         [ 2] 2143         JP     SUBB
                                   2144 
                                   2145 ;       str     ( w -- b u )
                                   2146 ;       Convert a signed integer
                                   2147 ;       to a numeric string.
      008A38 8A 23                 2148         .word      LINK
                           0009BA  2149 LINK = . 
      008A3A 03                    2150         .byte      3
      008A3B 53 54 52              2151         .ascii     "STR"
      008A3E                       2152 STR:
      008A3E CD 82 E7         [ 4] 2153         CALL     DUPP
      008A41 CD 82 B0         [ 4] 2154         CALL     TOR
      008A44 CD 85 1B         [ 4] 2155         CALL     ABSS
      008A47 CD 89 C1         [ 4] 2156         CALL     BDIGS
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



      008A4A CD 89 FB         [ 4] 2157         CALL     DIGS
      008A4D CD 82 91         [ 4] 2158         CALL     RFROM
      008A50 CD 8A 10         [ 4] 2159         CALL     SIGN
      008A53 CC 8A 26         [ 2] 2160         JP     EDIGS
                                   2161 
                                   2162 ;       HEX     ( -- )
                                   2163 ;       Use radix 16 as base for
                                   2164 ;       numeric conversions.
      008A56 8A 3A                 2165         .word      LINK
                           0009D8  2166 LINK = . 
      008A58 03                    2167         .byte      3
      008A59 48 45 58              2168         .ascii     "HEX"
      008A5C                       2169 HEX:
      008A5C CD 81 B8         [ 4] 2170         CALL     DOLIT
      008A5F 00 10                 2171         .word      16
      008A61 CD 83 A4         [ 4] 2172         CALL     BASE
      008A64 CC 82 29         [ 2] 2173         JP     STORE
                                   2174 
                                   2175 ;       DECIMAL ( -- )
                                   2176 ;       Use radix 10 as base
                                   2177 ;       for numeric conversions.
      008A67 8A 58                 2178         .word      LINK
                           0009E9  2179 LINK = . 
      008A69 07                    2180         .byte      7
      008A6A 44 45 43 49 4D 41 4C  2181         .ascii     "DECIMAL"
      008A71                       2182 DECIM:
      008A71 CD 81 B8         [ 4] 2183         CALL     DOLIT
      008A74 00 0A                 2184         .word      10
      008A76 CD 83 A4         [ 4] 2185         CALL     BASE
      008A79 CC 82 29         [ 2] 2186         JP     STORE
                                   2187 
                                   2188 ;; Numeric input, single precision
                                   2189 
                                   2190 ;       DIGIT?  ( c base -- u t )
                                   2191 ;       Convert a character to its numeric
                                   2192 ;       value. A flag indicates success.
      008A7C 8A 69                 2193         .word      LINK
                           0009FE  2194 LINK = . 
      008A7E 06                    2195         .byte       6
      008A7F 44 49 47 49 54 3F     2196         .ascii     "DIGIT?"
      008A85                       2197 DIGTQ:
      008A85 CD 82 B0         [ 4] 2198         CALL     TOR
      008A88 CD 81 B8         [ 4] 2199         CALL     DOLIT
      008A8B 00 30                 2200         .word     48	; "0"
      008A8D CD 85 01         [ 4] 2201         CALL     SUBB
      008A90 CD 81 B8         [ 4] 2202         CALL     DOLIT
      008A93 00 09                 2203         .word      9
      008A95 CD 83 11         [ 4] 2204         CALL     OVER
      008A98 CD 85 66         [ 4] 2205         CALL     LESS
      008A9B CD 81 EB         [ 4] 2206         CALL     QBRAN
      008A9E 8A B6                 2207         .word      DGTQ1
      008AA0 CD 81 B8         [ 4] 2208         CALL     DOLIT
      008AA3 00 07                 2209         .word      7
      008AA5 CD 85 01         [ 4] 2210         CALL     SUBB
      008AA8 CD 82 E7         [ 4] 2211         CALL     DUPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



      008AAB CD 81 B8         [ 4] 2212         CALL     DOLIT
      008AAE 00 0A                 2213         .word      10
      008AB0 CD 85 66         [ 4] 2214         CALL     LESS
      008AB3 CD 83 47         [ 4] 2215         CALL     ORR
      008AB6 CD 82 E7         [ 4] 2216 DGTQ1:  CALL     DUPP
      008AB9 CD 82 91         [ 4] 2217         CALL     RFROM
      008ABC CC 85 48         [ 2] 2218         JP     ULESS
                                   2219 
                                   2220 ;       NUMBER? ( a -- n T | a F )
                                   2221 ;       Convert a number string to
                                   2222 ;       integer. Push a flag on tos.
      008ABF 8A 7E                 2223         .word      LINK
                           000A41  2224 LINK = . 
      008AC1 07                    2225         .byte      7
      008AC2 4E 55 4D 42 45 52 3F  2226         .ascii     "NUMBER?"
      008AC9                       2227 NUMBQ:
      008AC9 CD 83 A4         [ 4] 2228         CALL     BASE
      008ACC CD 82 40         [ 4] 2229         CALL     AT
      008ACF CD 82 B0         [ 4] 2230         CALL     TOR
      008AD2 CD 87 B6         [ 4] 2231         CALL     ZERO
      008AD5 CD 83 11         [ 4] 2232         CALL     OVER
      008AD8 CD 88 8C         [ 4] 2233         CALL     COUNT
      008ADB CD 83 11         [ 4] 2234         CALL     OVER
      008ADE CD 82 5E         [ 4] 2235         CALL     CAT
      008AE1 CD 81 B8         [ 4] 2236         CALL     DOLIT
      008AE4 00 24                 2237         .word     36	; "0x"
      008AE6 CD 85 29         [ 4] 2238         CALL     EQUAL
      008AE9 CD 81 EB         [ 4] 2239         CALL     QBRAN
      008AEC 8A FD                 2240         .word      NUMQ1
      008AEE CD 8A 5C         [ 4] 2241         CALL     HEX
      008AF1 CD 82 F7         [ 4] 2242         CALL     SWAPP
      008AF4 CD 87 82         [ 4] 2243         CALL     ONEP
      008AF7 CD 82 F7         [ 4] 2244         CALL     SWAPP
      008AFA CD 87 8F         [ 4] 2245         CALL     ONEM
      008AFD CD 83 11         [ 4] 2246 NUMQ1:  CALL     OVER
      008B00 CD 82 5E         [ 4] 2247         CALL     CAT
      008B03 CD 81 B8         [ 4] 2248         CALL     DOLIT
      008B06 00 2D                 2249         .word     45	; "-"
      008B08 CD 85 29         [ 4] 2250         CALL     EQUAL
      008B0B CD 82 B0         [ 4] 2251         CALL     TOR
      008B0E CD 82 F7         [ 4] 2252         CALL     SWAPP
      008B11 CD 82 A4         [ 4] 2253         CALL     RAT
      008B14 CD 85 01         [ 4] 2254         CALL     SUBB
      008B17 CD 82 F7         [ 4] 2255         CALL     SWAPP
      008B1A CD 82 A4         [ 4] 2256         CALL     RAT
      008B1D CD 84 A3         [ 4] 2257         CALL     PLUS
      008B20 CD 84 52         [ 4] 2258         CALL     QDUP
      008B23 CD 81 EB         [ 4] 2259         CALL     QBRAN
      008B26 8B 87                 2260         .word      NUMQ6
      008B28 CD 87 8F         [ 4] 2261         CALL     ONEM
      008B2B CD 82 B0         [ 4] 2262         CALL     TOR
      008B2E CD 82 E7         [ 4] 2263 NUMQ2:  CALL     DUPP
      008B31 CD 82 B0         [ 4] 2264         CALL     TOR
      008B34 CD 82 5E         [ 4] 2265         CALL     CAT
      008B37 CD 83 A4         [ 4] 2266         CALL     BASE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



      008B3A CD 82 40         [ 4] 2267         CALL     AT
      008B3D CD 8A 85         [ 4] 2268         CALL     DIGTQ
      008B40 CD 81 EB         [ 4] 2269         CALL     QBRAN
      008B43 8B 75                 2270         .word      NUMQ4
      008B45 CD 82 F7         [ 4] 2271         CALL     SWAPP
      008B48 CD 83 A4         [ 4] 2272         CALL     BASE
      008B4B CD 82 40         [ 4] 2273         CALL     AT
      008B4E CD 87 01         [ 4] 2274         CALL     STAR
      008B51 CD 84 A3         [ 4] 2275         CALL     PLUS
      008B54 CD 82 91         [ 4] 2276         CALL     RFROM
      008B57 CD 87 82         [ 4] 2277         CALL     ONEP
      008B5A CD 81 CC         [ 4] 2278         CALL     DONXT
      008B5D 8B 2E                 2279         .word      NUMQ2
      008B5F CD 82 A4         [ 4] 2280         CALL     RAT
      008B62 CD 82 F7         [ 4] 2281         CALL     SWAPP
      008B65 CD 82 DD         [ 4] 2282         CALL     DROP
      008B68 CD 81 EB         [ 4] 2283         CALL     QBRAN
      008B6B 8B 70                 2284         .word      NUMQ3
      008B6D CD 84 CE         [ 4] 2285         CALL     NEGAT
      008B70 CD 82 F7         [ 4] 2286 NUMQ3:  CALL     SWAPP
      008B73 20 0F            [ 2] 2287         JRA     NUMQ5
      008B75 CD 82 91         [ 4] 2288 NUMQ4:  CALL     RFROM
      008B78 CD 82 91         [ 4] 2289         CALL     RFROM
      008B7B CD 84 83         [ 4] 2290         CALL     DDROP
      008B7E CD 84 83         [ 4] 2291         CALL     DDROP
      008B81 CD 87 B6         [ 4] 2292         CALL     ZERO
      008B84 CD 82 E7         [ 4] 2293 NUMQ5:  CALL     DUPP
      008B87 CD 82 91         [ 4] 2294 NUMQ6:  CALL     RFROM
      008B8A CD 84 83         [ 4] 2295         CALL     DDROP
      008B8D CD 82 91         [ 4] 2296         CALL     RFROM
      008B90 CD 83 A4         [ 4] 2297         CALL     BASE
      008B93 CC 82 29         [ 2] 2298         JP     STORE
                                   2299 
                                   2300 ;; Basic I/O
                                   2301 
                                   2302 ;       KEY     ( -- c )
                                   2303 ;       Wait for and return an
                                   2304 ;       input character.
      008B96 8A C1                 2305         .word      LINK
                           000B18  2306 LINK = . 
      008B98 03                    2307         .byte      3
      008B99 4B 45 59              2308         .ascii     "KEY"
      008B9C                       2309 KEY:
                           000001  2310 .if CONVERT_TO_CODE
      008B9C 72 0B 52 30 FB   [ 2] 2311         btjf UART1_SR,#UART_SR_RXNE,. 
      008BA1 C6 52 31         [ 1] 2312         ld a,UART1_DR 
      008BA4 1D 00 02         [ 2] 2313         subw x,#CELLL 
      008BA7 E7 01            [ 1] 2314         ld (1,x),a 
      008BA9 7F               [ 1] 2315         clr (x)
      008BAA 81               [ 4] 2316         ret 
                           000000  2317 .else 
                                   2318 KEY1:   CALL     QKEY
                                   2319         CALL     QBRAN
                                   2320         .word      KEY1
                                   2321         RET
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



                                   2322 .endif 
                                   2323 
                                   2324 ;       NUF?    ( -- t )
                                   2325 ;       Return false if no input,
                                   2326 ;       else pause and if CR return true.
      008BAB 8B 98                 2327         .word      LINK
                           000B2D  2328 LINK = . 
      008BAD 04                    2329         .byte      4
      008BAE 4E 55 46 3F           2330         .ascii     "NUF?"
      008BB2                       2331 NUFQ:
      008BB2 CD 81 84         [ 4] 2332         CALL     QKEY
      008BB5 CD 82 E7         [ 4] 2333         CALL     DUPP
      008BB8 CD 81 EB         [ 4] 2334         CALL     QBRAN
      008BBB 8B CB                 2335         .word    NUFQ1
      008BBD CD 84 83         [ 4] 2336         CALL     DDROP
      008BC0 CD 8B 9C         [ 4] 2337         CALL     KEY
      008BC3 CD 81 B8         [ 4] 2338         CALL     DOLIT
      008BC6 00 0D                 2339         .word      CRR
      008BC8 CC 85 29         [ 2] 2340         JP     EQUAL
      008BCB 81               [ 4] 2341 NUFQ1:  RET
                                   2342 
                                   2343 ;       SPACE   ( -- )
                                   2344 ;       Send  blank character to
                                   2345 ;       output device.
      008BCC 8B AD                 2346         .word      LINK
                           000B4E  2347 LINK = . 
      008BCE 05                    2348         .byte      5
      008BCF 53 50 41 43 45        2349         .ascii     "SPACE"
      008BD4                       2350 SPACE:
      008BD4 CD 87 A9         [ 4] 2351         CALL     BLANK
      008BD7 CC 81 A2         [ 2] 2352         JP     EMIT
                                   2353 
                                   2354 ;       SPACES  ( +n -- )
                                   2355 ;       Send n spaces to output device.
      008BDA 8B CE                 2356         .word      LINK
                           000B5C  2357 LINK = . 
      008BDC 06                    2358         .byte      6
      008BDD 53 50 41 43 45 53     2359         .ascii     "SPACES"
      008BE3                       2360 SPACS:
      008BE3 CD 87 B6         [ 4] 2361         CALL     ZERO
      008BE6 CD 85 86         [ 4] 2362         CALL     MAX
      008BE9 CD 82 B0         [ 4] 2363         CALL     TOR
      008BEC 20 03            [ 2] 2364         JRA      CHAR2
      008BEE CD 8B D4         [ 4] 2365 CHAR1:  CALL     SPACE
      008BF1 CD 81 CC         [ 4] 2366 CHAR2:  CALL     DONXT
      008BF4 8B EE                 2367         .word    CHAR1
      008BF6 81               [ 4] 2368         RET
                                   2369 
                                   2370 ;       TYPE    ( b u -- )
                                   2371 ;       Output u characters from b.
      008BF7 8B DC                 2372         .word      LINK
                           000B79  2373 LINK = . 
      008BF9 04                    2374         .byte      4
      008BFA 54 59 50 45           2375         .ascii     "TYPE"
      008BFE                       2376 TYPES:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



      008BFE CD 82 B0         [ 4] 2377         CALL     TOR
      008C01 20 0C            [ 2] 2378         JRA     TYPE2
      008C03 CD 82 E7         [ 4] 2379 TYPE1:  CALL     DUPP
      008C06 CD 82 5E         [ 4] 2380         CALL     CAT
      008C09 CD 81 A2         [ 4] 2381         CALL     EMIT
      008C0C CD 87 82         [ 4] 2382         CALL     ONEP
      008C0F CD 81 CC         [ 4] 2383 TYPE2:  CALL     DONXT
      008C12 8C 03                 2384         .word      TYPE1
      008C14 CC 82 DD         [ 2] 2385         JP     DROP
                                   2386 
                                   2387 ;       CR      ( -- )
                                   2388 ;       Output a carriage return
                                   2389 ;       and a line feed.
      008C17 8B F9                 2390         .word      LINK
                           000B99  2391 LINK = . 
      008C19 02                    2392         .byte      2
      008C1A 43 52                 2393         .ascii     "CR"
      008C1C                       2394 CR:
      008C1C CD 81 B8         [ 4] 2395         CALL     DOLIT
      008C1F 00 0D                 2396         .word      CRR
      008C21 CD 81 A2         [ 4] 2397         CALL     EMIT
      008C24 CD 81 B8         [ 4] 2398         CALL     DOLIT
      008C27 00 0A                 2399         .word      LF
      008C29 CC 81 A2         [ 2] 2400         JP     EMIT
                                   2401 
                                   2402 ;       do$     ( -- a )
                                   2403 ;       Return  address of a compiled
                                   2404 ;       string.
      008C2C 8C 19                 2405         .word      LINK
                           000BAE  2406 LINK = . 
      008C2E 43                    2407 	.byte      COMPO+3
      008C2F 44 4F 24              2408         .ascii     "DO$"
      008C32                       2409 DOSTR:
      008C32 CD 82 91         [ 4] 2410         CALL     RFROM
      008C35 CD 82 A4         [ 4] 2411         CALL     RAT
      008C38 CD 82 91         [ 4] 2412         CALL     RFROM
      008C3B CD 88 8C         [ 4] 2413         CALL     COUNT
      008C3E CD 84 A3         [ 4] 2414         CALL     PLUS
      008C41 CD 82 B0         [ 4] 2415         CALL     TOR
      008C44 CD 82 F7         [ 4] 2416         CALL     SWAPP
      008C47 CD 82 B0         [ 4] 2417         CALL     TOR
      008C4A 81               [ 4] 2418         RET
                                   2419 
                                   2420 ;       $"|     ( -- a )
                                   2421 ;       Run time routine compiled by $".
                                   2422 ;       Return address of a compiled string.
      008C4B 8C 2E                 2423         .word      LINK
                           000BCD  2424 LINK = . 
      008C4D 43                    2425 	.byte      COMPO+3
      008C4E 24 22 7C              2426         .byte     '$','"','|'
      008C51                       2427 STRQP:
      008C51 CD 8C 32         [ 4] 2428         CALL     DOSTR
      008C54 81               [ 4] 2429         RET
                                   2430 
                                   2431 ;       ."|     ( -- )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



                                   2432 ;       Run time routine of ." .
                                   2433 ;       Output a compiled string.
      008C55 8C 4D                 2434         .word      LINK
                           000BD7  2435 LINK = . 
      008C57 43                    2436 	.byte      COMPO+3
      008C58 2E 22 7C              2437         .byte     '.','"','|'
      008C5B                       2438 DOTQP:
      008C5B CD 8C 32         [ 4] 2439         CALL     DOSTR
      008C5E CD 88 8C         [ 4] 2440         CALL     COUNT
      008C61 CC 8B FE         [ 2] 2441         JP     TYPES
                                   2442 
                                   2443 ;       .R      ( n +n -- )
                                   2444 ;       Display an integer in a field
                                   2445 ;       of n columns, right justified.
      008C64 8C 57                 2446         .word      LINK
                           000BE6  2447 LINK = . 
      008C66 02                    2448         .byte      2
      008C67 2E 52                 2449         .ascii     ".R"
      008C69                       2450 DOTR:
      008C69 CD 82 B0         [ 4] 2451         CALL     TOR
      008C6C CD 8A 3E         [ 4] 2452         CALL     STR
      008C6F CD 82 91         [ 4] 2453         CALL     RFROM
      008C72 CD 83 11         [ 4] 2454         CALL     OVER
      008C75 CD 85 01         [ 4] 2455         CALL     SUBB
      008C78 CD 8B E3         [ 4] 2456         CALL     SPACS
      008C7B CC 8B FE         [ 2] 2457         JP     TYPES
                                   2458 
                                   2459 ;       U.R     ( u +n -- )
                                   2460 ;       Display an unsigned integer
                                   2461 ;       in n column, right justified.
      008C7E 8C 66                 2462         .word      LINK
                           000C00  2463 LINK = . 
      008C80 03                    2464         .byte      3
      008C81 55 2E 52              2465         .ascii     "U.R"
      008C84                       2466 UDOTR:
      008C84 CD 82 B0         [ 4] 2467         CALL     TOR
      008C87 CD 89 C1         [ 4] 2468         CALL     BDIGS
      008C8A CD 89 FB         [ 4] 2469         CALL     DIGS
      008C8D CD 8A 26         [ 4] 2470         CALL     EDIGS
      008C90 CD 82 91         [ 4] 2471         CALL     RFROM
      008C93 CD 83 11         [ 4] 2472         CALL     OVER
      008C96 CD 85 01         [ 4] 2473         CALL     SUBB
      008C99 CD 8B E3         [ 4] 2474         CALL     SPACS
      008C9C CC 8B FE         [ 2] 2475         JP     TYPES
                                   2476 
                                   2477 ;       U.      ( u -- )
                                   2478 ;       Display an unsigned integer
                                   2479 ;       in free format.
      008C9F 8C 80                 2480         .word      LINK
                           000C21  2481 LINK = . 
      008CA1 02                    2482         .byte      2
      008CA2 55 2E                 2483         .ascii     "U."
      008CA4                       2484 UDOT:
      008CA4 CD 89 C1         [ 4] 2485         CALL     BDIGS
      008CA7 CD 89 FB         [ 4] 2486         CALL     DIGS
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      008CAA CD 8A 26         [ 4] 2487         CALL     EDIGS
      008CAD CD 8B D4         [ 4] 2488         CALL     SPACE
      008CB0 CC 8B FE         [ 2] 2489         JP     TYPES
                                   2490 
                                   2491 ;       .       ( w -- )
                                   2492 ;       Display an integer in free
                                   2493 ;       format, preceeded by a space.
      008CB3 8C A1                 2494         .word      LINK
                           000C35  2495 LINK = . 
      008CB5 01                    2496         .byte      1
      008CB6 2E                    2497         .ascii     "."
      008CB7                       2498 DOT:
      008CB7 CD 83 A4         [ 4] 2499         CALL     BASE
      008CBA CD 82 40         [ 4] 2500         CALL     AT
      008CBD CD 81 B8         [ 4] 2501         CALL     DOLIT
      008CC0 00 0A                 2502         .word      10
      008CC2 CD 83 5C         [ 4] 2503         CALL     XORR    ;?decimal
      008CC5 CD 81 EB         [ 4] 2504         CALL     QBRAN
      008CC8 8C CD                 2505         .word      DOT1
      008CCA CC 8C A4         [ 2] 2506         JP     UDOT
      008CCD CD 8A 3E         [ 4] 2507 DOT1:   CALL     STR
      008CD0 CD 8B D4         [ 4] 2508         CALL     SPACE
      008CD3 CC 8B FE         [ 2] 2509         JP     TYPES
                                   2510 
                                   2511 ;       ?       ( a -- )
                                   2512 ;       Display contents in memory cell.
      008CD6 8C B5                 2513         .word      LINK
                                   2514         
                           000C58  2515 LINK = . 
      008CD8 01                    2516         .byte      1
      008CD9 3F                    2517         .ascii     "?"
      008CDA                       2518 QUEST:
      008CDA CD 82 40         [ 4] 2519         CALL     AT
      008CDD CC 8C B7         [ 2] 2520         JP     DOT
                                   2521 
                                   2522 ;; Parsing
                                   2523 
                                   2524 ;       parse   ( b u c -- b u delta ; <string> )
                                   2525 ;       Scan string delimited by c.
                                   2526 ;       Return found string and its offset.
      008CE0 8C D8                 2527         .word      LINK
                           000C62  2528 LINK = . 
      008CE2 05                    2529         .byte      5
      008CE3 70 61 72 73 65        2530         .ascii     "parse"
      008CE8                       2531 PARS:
      008CE8 CD 83 B3         [ 4] 2532         CALL     TEMP
      008CEB CD 82 29         [ 4] 2533         CALL     STORE
      008CEE CD 83 11         [ 4] 2534         CALL     OVER
      008CF1 CD 82 B0         [ 4] 2535         CALL     TOR
      008CF4 CD 82 E7         [ 4] 2536         CALL     DUPP
      008CF7 CD 81 EB         [ 4] 2537         CALL     QBRAN
      008CFA 8D A0                 2538         .word    PARS8
      008CFC CD 87 8F         [ 4] 2539         CALL     ONEM
      008CFF CD 83 B3         [ 4] 2540         CALL     TEMP
      008D02 CD 82 40         [ 4] 2541         CALL     AT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



      008D05 CD 87 A9         [ 4] 2542         CALL     BLANK
      008D08 CD 85 29         [ 4] 2543         CALL     EQUAL
      008D0B CD 81 EB         [ 4] 2544         CALL     QBRAN
      008D0E 8D 41                 2545         .word      PARS3
      008D10 CD 82 B0         [ 4] 2546         CALL     TOR
      008D13 CD 87 A9         [ 4] 2547 PARS1:  CALL     BLANK
      008D16 CD 83 11         [ 4] 2548         CALL     OVER
      008D19 CD 82 5E         [ 4] 2549         CALL     CAT     ;skip leading blanks ONLY
      008D1C CD 85 01         [ 4] 2550         CALL     SUBB
      008D1F CD 83 20         [ 4] 2551         CALL     ZLESS
      008D22 CD 84 BD         [ 4] 2552         CALL     INVER
      008D25 CD 81 EB         [ 4] 2553         CALL     QBRAN
      008D28 8D 3E                 2554         .word      PARS2
      008D2A CD 87 82         [ 4] 2555         CALL     ONEP
      008D2D CD 81 CC         [ 4] 2556         CALL     DONXT
      008D30 8D 13                 2557         .word      PARS1
      008D32 CD 82 91         [ 4] 2558         CALL     RFROM
      008D35 CD 82 DD         [ 4] 2559         CALL     DROP
      008D38 CD 87 B6         [ 4] 2560         CALL     ZERO
      008D3B CC 82 E7         [ 2] 2561         JP     DUPP
      008D3E CD 82 91         [ 4] 2562 PARS2:  CALL     RFROM
      008D41 CD 83 11         [ 4] 2563 PARS3:  CALL     OVER
      008D44 CD 82 F7         [ 4] 2564         CALL     SWAPP
      008D47 CD 82 B0         [ 4] 2565         CALL     TOR
      008D4A CD 83 B3         [ 4] 2566 PARS4:  CALL     TEMP
      008D4D CD 82 40         [ 4] 2567         CALL     AT
      008D50 CD 83 11         [ 4] 2568         CALL     OVER
      008D53 CD 82 5E         [ 4] 2569         CALL     CAT
      008D56 CD 85 01         [ 4] 2570         CALL     SUBB    ;scan for delimiter
      008D59 CD 83 B3         [ 4] 2571         CALL     TEMP
      008D5C CD 82 40         [ 4] 2572         CALL     AT
      008D5F CD 87 A9         [ 4] 2573         CALL     BLANK
      008D62 CD 85 29         [ 4] 2574         CALL     EQUAL
      008D65 CD 81 EB         [ 4] 2575         CALL     QBRAN
      008D68 8D 6D                 2576         .word      PARS5
      008D6A CD 83 20         [ 4] 2577         CALL     ZLESS
      008D6D CD 81 EB         [ 4] 2578 PARS5:  CALL     QBRAN
      008D70 8D 82                 2579         .word      PARS6
      008D72 CD 87 82         [ 4] 2580         CALL     ONEP
      008D75 CD 81 CC         [ 4] 2581         CALL     DONXT
      008D78 8D 4A                 2582         .word      PARS4
      008D7A CD 82 E7         [ 4] 2583         CALL     DUPP
      008D7D CD 82 B0         [ 4] 2584         CALL     TOR
      008D80 20 0F            [ 2] 2585         JRA     PARS7
      008D82 CD 82 91         [ 4] 2586 PARS6:  CALL     RFROM
      008D85 CD 82 DD         [ 4] 2587         CALL     DROP
      008D88 CD 82 E7         [ 4] 2588         CALL     DUPP
      008D8B CD 87 82         [ 4] 2589         CALL     ONEP
      008D8E CD 82 B0         [ 4] 2590         CALL     TOR
      008D91 CD 83 11         [ 4] 2591 PARS7:  CALL     OVER
      008D94 CD 85 01         [ 4] 2592         CALL     SUBB
      008D97 CD 82 91         [ 4] 2593         CALL     RFROM
      008D9A CD 82 91         [ 4] 2594         CALL     RFROM
      008D9D CC 85 01         [ 2] 2595         JP     SUBB
      008DA0 CD 83 11         [ 4] 2596 PARS8:  CALL     OVER
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      008DA3 CD 82 91         [ 4] 2597         CALL     RFROM
      008DA6 CC 85 01         [ 2] 2598         JP     SUBB
                                   2599 
                                   2600 ;       PARSE   ( c -- b u ; <string> )
                                   2601 ;       Scan input stream and return
                                   2602 ;       counted string delimited by c.
      008DA9 8C E2                 2603         .word      LINK
                           000D2B  2604 LINK = . 
      008DAB 05                    2605         .byte      5
      008DAC 50 41 52 53 45        2606         .ascii     "PARSE"
      008DB1                       2607 PARSE:
      008DB1 CD 82 B0         [ 4] 2608         CALL     TOR
      008DB4 CD 88 C5         [ 4] 2609         CALL     TIB
      008DB7 CD 83 C2         [ 4] 2610         CALL     INN
      008DBA CD 82 40         [ 4] 2611         CALL     AT
      008DBD CD 84 A3         [ 4] 2612         CALL     PLUS    ;current input buffer pointer
      008DC0 CD 83 D2         [ 4] 2613         CALL     NTIB
      008DC3 CD 82 40         [ 4] 2614         CALL     AT
      008DC6 CD 83 C2         [ 4] 2615         CALL     INN
      008DC9 CD 82 40         [ 4] 2616         CALL     AT
      008DCC CD 85 01         [ 4] 2617         CALL     SUBB    ;remaining count
      008DCF CD 82 91         [ 4] 2618         CALL     RFROM
      008DD2 CD 8C E8         [ 4] 2619         CALL     PARS
      008DD5 CD 83 C2         [ 4] 2620         CALL     INN
      008DD8 CC 88 25         [ 2] 2621         JP     PSTOR
                                   2622 
                                   2623 ;       .(      ( -- )
                                   2624 ;       Output following string up to next ) .
      008DDB 8D AB                 2625         .word      LINK
                           000D5D  2626 LINK = . 
      008DDD 82                    2627 	.byte      IMEDD+2
      008DDE 2E 28                 2628         .ascii     ".("
      008DE0                       2629 DOTPR:
      008DE0 CD 81 B8         [ 4] 2630         CALL     DOLIT
      008DE3 00 29                 2631         .word     41	; ")"
      008DE5 CD 8D B1         [ 4] 2632         CALL     PARSE
      008DE8 CC 8B FE         [ 2] 2633         JP     TYPES
                                   2634 
                                   2635 ;       (       ( -- )
                                   2636 ;       Ignore following string up to next ).
                                   2637 ;       A comment.
      008DEB 8D DD                 2638         .word      LINK
                           000D6D  2639 LINK = . 
      008DED 81                    2640 	.byte      IMEDD+1
      008DEE 28                    2641         .ascii     "("
      008DEF                       2642 PAREN:
      008DEF CD 81 B8         [ 4] 2643         CALL     DOLIT
      008DF2 00 29                 2644         .word     41	; ")"
      008DF4 CD 8D B1         [ 4] 2645         CALL     PARSE
      008DF7 CC 84 83         [ 2] 2646         JP     DDROP
                                   2647 
                                   2648 ;       \       ( -- )
                                   2649 ;       Ignore following text till
                                   2650 ;       end of line.
      008DFA 8D ED                 2651         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



                           000D7C  2652 LINK = . 
      008DFC 81                    2653 	.byte      IMEDD+1
      008DFD 5C                    2654         .ascii     "\"
      008DFE                       2655 BKSLA:
                           000001  2656 .if CONVERT_TO_CODE
      008DFE 90 AE 00 0C      [ 2] 2657         ldw y,#UCTIB ; #TIB  
      008E02 90 FE            [ 2] 2658         ldw y,(y)
      008E04 90 89            [ 2] 2659         pushw y ; count in TIB 
      008E06 90 AE 00 0A      [ 2] 2660         ldw y,#UINN ; >IN 
      008E0A 90 BF 1E         [ 2] 2661         ldw YTEMP,y
      008E0D 90 85            [ 2] 2662         popw y 
      008E0F 91 CF 1E         [ 5] 2663         ldw [YTEMP],y
      008E12 81               [ 4] 2664         ret 
                           000000  2665 .else
                                   2666         CALL     NTIB
                                   2667         CALL     AT
                                   2668         CALL     INN
                                   2669         JP     STORE
                                   2670 .endif 
                                   2671 
                                   2672 ;       WORD    ( c -- a ; <string> )
                                   2673 ;       Parse a word from input stream
                                   2674 ;       and copy it to code dictionary.
      008E13 8D FC                 2675         .word      LINK
                           000D95  2676 LINK = . 
      008E15 04                    2677         .byte      4
      008E16 57 4F 52 44           2678         .ascii     "WORD"
      008E1A                       2679 WORDD:
      008E1A CD 8D B1         [ 4] 2680         CALL     PARSE
      008E1D CD 88 A3         [ 4] 2681         CALL     HERE
      008E20 CD 87 57         [ 4] 2682         CALL     CELLP
      008E23 CC 89 64         [ 2] 2683         JP     PACKS
                                   2684 
                                   2685 ;       TOKEN   ( -- a ; <string> )
                                   2686 ;       Parse a word from input stream
                                   2687 ;       and copy it to name dictionary.
      008E26 8E 15                 2688         .word      LINK
                           000DA8  2689 LINK = . 
      008E28 05                    2690         .byte      5
      008E29 54 4F 4B 45 4E        2691         .ascii     "TOKEN"
      008E2E                       2692 TOKEN:
      008E2E CD 87 A9         [ 4] 2693         CALL     BLANK
      008E31 CC 8E 1A         [ 2] 2694         JP     WORDD
                                   2695 
                                   2696 ;; Dictionary search
                                   2697 
                                   2698 ;       NAME>   ( na -- ca )
                                   2699 ;       Return a code address given
                                   2700 ;       a name address.
      008E34 8E 28                 2701         .word      LINK
                           000DB6  2702 LINK = . 
      008E36 05                    2703         .byte      5
      008E37 4E 41 4D 45 3E        2704         .ascii     "NAME>"
      008E3C                       2705 NAMET:
      008E3C CD 88 8C         [ 4] 2706         CALL     COUNT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



      008E3F CD 81 B8         [ 4] 2707         CALL     DOLIT
      008E42 00 1F                 2708         .word      31
      008E44 CD 83 33         [ 4] 2709         CALL     ANDD
      008E47 CC 84 A3         [ 2] 2710         JP     PLUS
                                   2711 
                                   2712 ;       SAME?   ( a a u -- a a f \ -0+ )
                                   2713 ;       Compare u cells in two
                                   2714 ;       strings. Return 0 if identical.
      008E4A 8E 36                 2715         .word      LINK
                           000DCC  2716 LINK = . 
      008E4C 05                    2717         .byte       5
      008E4D 53 41 4D 45 3F        2718         .ascii     "SAME?"
      008E52                       2719 SAMEQ:
      008E52 CD 87 8F         [ 4] 2720         CALL     ONEM
      008E55 CD 82 B0         [ 4] 2721         CALL     TOR
      008E58 20 29            [ 2] 2722         JRA     SAME2
      008E5A CD 83 11         [ 4] 2723 SAME1:  CALL     OVER
      008E5D CD 82 A4         [ 4] 2724         CALL     RAT
      008E60 CD 84 A3         [ 4] 2725         CALL     PLUS
      008E63 CD 82 5E         [ 4] 2726         CALL     CAT
      008E66 CD 83 11         [ 4] 2727         CALL     OVER
      008E69 CD 82 A4         [ 4] 2728         CALL     RAT
      008E6C CD 84 A3         [ 4] 2729         CALL     PLUS
      008E6F CD 82 5E         [ 4] 2730         CALL     CAT
      008E72 CD 85 01         [ 4] 2731         CALL     SUBB
      008E75 CD 84 52         [ 4] 2732         CALL     QDUP
      008E78 CD 81 EB         [ 4] 2733         CALL     QBRAN
      008E7B 8E 83                 2734         .word      SAME2
      008E7D CD 82 91         [ 4] 2735         CALL     RFROM
      008E80 CC 82 DD         [ 2] 2736         JP     DROP
      008E83 CD 81 CC         [ 4] 2737 SAME2:  CALL     DONXT
      008E86 8E 5A                 2738         .word      SAME1
      008E88 CC 87 B6         [ 2] 2739         JP     ZERO
                                   2740 
                                   2741 ;       find    ( a va -- ca na | a F )
                                   2742 ;       Search vocabulary for string.
                                   2743 ;       Return ca and na if succeeded.
      008E8B 8E 4C                 2744         .word      LINK
                           000E0D  2745 LINK = . 
      008E8D 04                    2746         .byte      4
      008E8E 46 49 4E 44           2747         .ascii     "FIND"
      008E92                       2748 FIND:
      008E92 CD 82 F7         [ 4] 2749         CALL     SWAPP
      008E95 CD 82 E7         [ 4] 2750         CALL     DUPP
      008E98 CD 82 5E         [ 4] 2751         CALL     CAT
      008E9B CD 83 B3         [ 4] 2752         CALL     TEMP
      008E9E CD 82 29         [ 4] 2753         CALL     STORE
      008EA1 CD 82 E7         [ 4] 2754         CALL     DUPP
      008EA4 CD 82 40         [ 4] 2755         CALL     AT
      008EA7 CD 82 B0         [ 4] 2756         CALL     TOR
      008EAA CD 87 57         [ 4] 2757         CALL     CELLP
      008EAD CD 82 F7         [ 4] 2758         CALL     SWAPP
      008EB0 CD 82 40         [ 4] 2759 FIND1:  CALL     AT
      008EB3 CD 82 E7         [ 4] 2760         CALL     DUPP
      008EB6 CD 81 EB         [ 4] 2761         CALL     QBRAN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



      008EB9 8E EF                 2762         .word      FIND6
      008EBB CD 82 E7         [ 4] 2763         CALL     DUPP
      008EBE CD 82 40         [ 4] 2764         CALL     AT
      008EC1 CD 81 B8         [ 4] 2765         CALL     DOLIT
      008EC4 1F 7F                 2766         .word      MASKK
      008EC6 CD 83 33         [ 4] 2767         CALL     ANDD
      008EC9 CD 82 A4         [ 4] 2768         CALL     RAT
      008ECC CD 83 5C         [ 4] 2769         CALL     XORR
      008ECF CD 81 EB         [ 4] 2770         CALL     QBRAN
      008ED2 8E DE                 2771         .word      FIND2
      008ED4 CD 87 57         [ 4] 2772         CALL     CELLP
      008ED7 CD 81 B8         [ 4] 2773         CALL     DOLIT
      008EDA FF FF                 2774         .word     0xFFFF
      008EDC 20 0C            [ 2] 2775         JRA     FIND3
      008EDE CD 87 57         [ 4] 2776 FIND2:  CALL     CELLP
      008EE1 CD 83 B3         [ 4] 2777         CALL     TEMP
      008EE4 CD 82 40         [ 4] 2778         CALL     AT
      008EE7 CD 8E 52         [ 4] 2779         CALL     SAMEQ
      008EEA CD 82 02         [ 4] 2780 FIND3:  CALL     BRAN
      008EED 8E FE                 2781         .word      FIND4
      008EEF CD 82 91         [ 4] 2782 FIND6:  CALL     RFROM
      008EF2 CD 82 DD         [ 4] 2783         CALL     DROP
      008EF5 CD 82 F7         [ 4] 2784         CALL     SWAPP
      008EF8 CD 87 66         [ 4] 2785         CALL     CELLM
      008EFB CC 82 F7         [ 2] 2786         JP     SWAPP
      008EFE CD 81 EB         [ 4] 2787 FIND4:  CALL     QBRAN
      008F01 8F 0B                 2788         .word      FIND5
      008F03 CD 87 66         [ 4] 2789         CALL     CELLM
      008F06 CD 87 66         [ 4] 2790         CALL     CELLM
      008F09 20 A5            [ 2] 2791         JRA     FIND1
      008F0B CD 82 91         [ 4] 2792 FIND5:  CALL     RFROM
      008F0E CD 82 DD         [ 4] 2793         CALL     DROP
      008F11 CD 82 F7         [ 4] 2794         CALL     SWAPP
      008F14 CD 82 DD         [ 4] 2795         CALL     DROP
      008F17 CD 87 66         [ 4] 2796         CALL     CELLM
      008F1A CD 82 E7         [ 4] 2797         CALL     DUPP
      008F1D CD 8E 3C         [ 4] 2798         CALL     NAMET
      008F20 CC 82 F7         [ 2] 2799         JP     SWAPP
                                   2800 
                                   2801 ;       NAME?   ( a -- ca na | a F )
                                   2802 ;       Search vocabularies for a string.
      008F23 8E 8D                 2803         .word      LINK
                           000EA5  2804 LINK = . 
      008F25 05                    2805         .byte      5
      008F26 4E 41 4D 45 3F        2806         .ascii     "NAME?"
      008F2B                       2807 NAMEQ:
      008F2B CD 84 15         [ 4] 2808         CALL   CNTXT
      008F2E CC 8E 92         [ 2] 2809         JP     FIND
                                   2810 
                                   2811 ;; Terminal response
                                   2812 
                                   2813 ;       ^H      ( bot eot cur -- bot eot cur )
                                   2814 ;       Backup cursor by one character.
      008F31 8F 25                 2815         .word      LINK
                           000EB3  2816 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



      008F33 02                    2817         .byte      2
      008F34 5E 48                 2818         .ascii     "^H"
      008F36                       2819 BKSP:
      008F36 CD 82 B0         [ 4] 2820         CALL     TOR
      008F39 CD 83 11         [ 4] 2821         CALL     OVER
      008F3C CD 82 91         [ 4] 2822         CALL     RFROM
      008F3F CD 82 F7         [ 4] 2823         CALL     SWAPP
      008F42 CD 83 11         [ 4] 2824         CALL     OVER
      008F45 CD 83 5C         [ 4] 2825         CALL     XORR
      008F48 CD 81 EB         [ 4] 2826         CALL     QBRAN
      008F4B 8F 66                 2827         .word      BACK1
      008F4D CD 81 B8         [ 4] 2828         CALL     DOLIT
      008F50 00 08                 2829         .word      BKSPP
      008F52 CD 81 A2         [ 4] 2830         CALL     EMIT
      008F55 CD 87 8F         [ 4] 2831         CALL     ONEM
      008F58 CD 87 A9         [ 4] 2832         CALL     BLANK
      008F5B CD 81 A2         [ 4] 2833         CALL     EMIT
      008F5E CD 81 B8         [ 4] 2834         CALL     DOLIT
      008F61 00 08                 2835         .word      BKSPP
      008F63 CC 81 A2         [ 2] 2836         JP     EMIT
      008F66 81               [ 4] 2837 BACK1:  RET
                                   2838 
                                   2839 ;       TAP     ( bot eot cur c -- bot eot cur )
                                   2840 ;       Accept and echo key stroke
                                   2841 ;       and bump cursor.
      008F67 8F 33                 2842         .word      LINK
                           000EE9  2843 LINK = . 
      008F69 03                    2844         .byte      3
      008F6A 54 41 50              2845         .ascii     "TAP"
      008F6D                       2846 TAP:
      008F6D CD 82 E7         [ 4] 2847         CALL     DUPP
      008F70 CD 81 A2         [ 4] 2848         CALL     EMIT
      008F73 CD 83 11         [ 4] 2849         CALL     OVER
      008F76 CD 82 4D         [ 4] 2850         CALL     CSTOR
      008F79 CC 87 82         [ 2] 2851         JP     ONEP
                                   2852 
                                   2853 ;       kTAP    ( bot eot cur c -- bot eot cur )
                                   2854 ;       Process a key stroke,
                                   2855 ;       CR or backspace.
      008F7C 8F 69                 2856         .word      LINK
                           000EFE  2857 LINK = . 
      008F7E 04                    2858         .byte      4
      008F7F 4B 54 41 50           2859         .ascii     "KTAP"
      008F83                       2860 KTAP:
      008F83 CD 82 E7         [ 4] 2861         CALL     DUPP
      008F86 CD 81 B8         [ 4] 2862         CALL     DOLIT
      008F89 00 0D                 2863         .word      CRR
      008F8B CD 83 5C         [ 4] 2864         CALL     XORR
      008F8E CD 81 EB         [ 4] 2865         CALL     QBRAN
      008F91 8F A9                 2866         .word      KTAP2
      008F93 CD 81 B8         [ 4] 2867         CALL     DOLIT
      008F96 00 08                 2868         .word      BKSPP
      008F98 CD 83 5C         [ 4] 2869         CALL     XORR
      008F9B CD 81 EB         [ 4] 2870         CALL     QBRAN
      008F9E 8F A6                 2871         .word      KTAP1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



      008FA0 CD 87 A9         [ 4] 2872         CALL     BLANK
      008FA3 CC 8F 6D         [ 2] 2873         JP     TAP
      008FA6 CC 8F 36         [ 2] 2874 KTAP1:  JP     BKSP
      008FA9 CD 82 DD         [ 4] 2875 KTAP2:  CALL     DROP
      008FAC CD 82 F7         [ 4] 2876         CALL     SWAPP
      008FAF CD 82 DD         [ 4] 2877         CALL     DROP
      008FB2 CC 82 E7         [ 2] 2878         JP     DUPP
                                   2879 
                                   2880 ;       accept  ( b u -- b u )
                                   2881 ;       Accept characters to input
                                   2882 ;       buffer. Return with actual count.
      008FB5 8F 7E                 2883         .word      LINK
                           000F37  2884 LINK = . 
      008FB7 06                    2885         .byte      6
      008FB8 41 43 43 45 50 54     2886         .ascii     "ACCEPT"
      008FBE                       2887 ACCEP:
      008FBE CD 83 11         [ 4] 2888         CALL     OVER
      008FC1 CD 84 A3         [ 4] 2889         CALL     PLUS
      008FC4 CD 83 11         [ 4] 2890         CALL     OVER
      008FC7 CD 84 8E         [ 4] 2891 ACCP1:  CALL     DDUP
      008FCA CD 83 5C         [ 4] 2892         CALL     XORR
      008FCD CD 81 EB         [ 4] 2893         CALL     QBRAN
      008FD0 8F F2                 2894         .word      ACCP4
      008FD2 CD 8B 9C         [ 4] 2895         CALL     KEY
      008FD5 CD 82 E7         [ 4] 2896         CALL     DUPP
      008FD8 CD 87 A9         [ 4] 2897         CALL     BLANK
      008FDB CD 81 B8         [ 4] 2898         CALL     DOLIT
      008FDE 00 7F                 2899         .word      127
      008FE0 CD 85 C3         [ 4] 2900         CALL     WITHI
      008FE3 CD 81 EB         [ 4] 2901         CALL     QBRAN
      008FE6 8F ED                 2902         .word      ACCP2
      008FE8 CD 8F 6D         [ 4] 2903         CALL     TAP
      008FEB 20 03            [ 2] 2904         JRA     ACCP3
      008FED CD 8F 83         [ 4] 2905 ACCP2:  CALL     KTAP
      008FF0 20 D5            [ 2] 2906 ACCP3:  JRA     ACCP1
      008FF2 CD 82 DD         [ 4] 2907 ACCP4:  CALL     DROP
      008FF5 CD 83 11         [ 4] 2908         CALL     OVER
      008FF8 CC 85 01         [ 2] 2909         JP     SUBB
                                   2910 
                                   2911 ;       QUERY   ( -- )
                                   2912 ;       Accept input stream to
                                   2913 ;       terminal input buffer.
      008FFB 8F B7                 2914         .word      LINK
                                   2915         
                           000F7D  2916 LINK = . 
      008FFD 05                    2917         .byte      5
      008FFE 51 55 45 52 59        2918         .ascii     "QUERY"
      009003                       2919 QUERY:
      009003 CD 88 C5         [ 4] 2920         CALL     TIB
      009006 CD 81 B8         [ 4] 2921         CALL     DOLIT
      009009 00 50                 2922         .word      80
      00900B CD 8F BE         [ 4] 2923         CALL     ACCEP
      00900E CD 83 D2         [ 4] 2924         CALL     NTIB
      009011 CD 82 29         [ 4] 2925         CALL     STORE
      009014 CD 82 DD         [ 4] 2926         CALL     DROP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      009017 CD 87 B6         [ 4] 2927         CALL     ZERO
      00901A CD 83 C2         [ 4] 2928         CALL     INN
      00901D CC 82 29         [ 2] 2929         JP     STORE
                                   2930 
                                   2931 ;       ABORT   ( -- )
                                   2932 ;       Reset data stack and
                                   2933 ;       jump to QUIT.
      009020 8F FD                 2934         .word      LINK
                           000FA2  2935 LINK = . 
      009022 05                    2936         .byte      5
      009023 41 42 4F 52 54        2937         .ascii     "ABORT"
      009028                       2938 ABORT:
      009028 CD 91 1F         [ 4] 2939         CALL     PRESE
      00902B CC 91 3C         [ 2] 2940         JP     QUIT
                                   2941 
                                   2942 ;       abort"  ( f -- )
                                   2943 ;       Run time routine of ABORT".
                                   2944 ;       Abort with a message.
      00902E 90 22                 2945         .word      LINK
                           000FB0  2946 LINK = . 
      009030 46                    2947 	.byte      COMPO+6
      009031 41 42 4F 52 54        2948         .ascii     "ABORT"
      009036 22                    2949         .byte      '"'
      009037                       2950 ABORQ:
      009037 CD 81 EB         [ 4] 2951         CALL     QBRAN
      00903A 90 56                 2952         .word      ABOR2   ;text flag
      00903C CD 8C 32         [ 4] 2953         CALL     DOSTR
      00903F CD 8B D4         [ 4] 2954 ABOR1:  CALL     SPACE
      009042 CD 88 8C         [ 4] 2955         CALL     COUNT
      009045 CD 8B FE         [ 4] 2956         CALL     TYPES
      009048 CD 81 B8         [ 4] 2957         CALL     DOLIT
      00904B 00 3F                 2958         .word     63 ; "?"
      00904D CD 81 A2         [ 4] 2959         CALL     EMIT
      009050 CD 8C 1C         [ 4] 2960         CALL     CR
      009053 CC 90 28         [ 2] 2961         JP     ABORT   ;pass error string
      009056 CD 8C 32         [ 4] 2962 ABOR2:  CALL     DOSTR
      009059 CC 82 DD         [ 2] 2963         JP     DROP
                                   2964 
                                   2965 ;; The text interpreter
                                   2966 
                                   2967 ;       $INTERPRET      ( a -- )
                                   2968 ;       Interpret a word. If failed,
                                   2969 ;       try to convert it to an integer.
      00905C 90 30                 2970         .word      LINK
                           000FDE  2971 LINK = . 
      00905E 0A                    2972         .byte      10
      00905F 24 49 4E 54 45 52 50  2973         .ascii     "$INTERPRET"
             52 45 54
      009069                       2974 INTER:
      009069 CD 8F 2B         [ 4] 2975         CALL     NAMEQ
      00906C CD 84 52         [ 4] 2976         CALL     QDUP    ;?defined
      00906F CD 81 EB         [ 4] 2977         CALL     QBRAN
      009072 90 93                 2978         .word      INTE1
      009074 CD 82 40         [ 4] 2979         CALL     AT
      009077 CD 81 B8         [ 4] 2980         CALL     DOLIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      00907A 40 00                 2981 	.word       0x4000	; COMPO*256
      00907C CD 83 33         [ 4] 2982         CALL     ANDD    ;?compile only lexicon bits
      00907F CD 90 37         [ 4] 2983         CALL     ABORQ
      009082 0D                    2984         .byte      13
      009083 20 63 6F 6D 70 69 6C  2985         .ascii     " compile only"
             65 20 6F 6E 6C 79
      009090 CC 82 12         [ 2] 2986         JP     EXECU
      009093 CD 8A C9         [ 4] 2987 INTE1:  CALL     NUMBQ   ;convert a number
      009096 CD 81 EB         [ 4] 2988         CALL     QBRAN
      009099 90 3F                 2989         .word    ABOR1
      00909B 81               [ 4] 2990         RET
                                   2991 
                                   2992 ;       [       ( -- )
                                   2993 ;       Start  text interpreter.
      00909C 90 5E                 2994         .word      LINK
                           00101E  2995 LINK = . 
      00909E 81                    2996 	.byte      IMEDD+1
      00909F 5B                    2997         .ascii     "["
      0090A0                       2998 LBRAC:
      0090A0 CD 81 B8         [ 4] 2999         CALL     DOLIT
      0090A3 90 69                 3000         .word      INTER
      0090A5 CD 83 F3         [ 4] 3001         CALL     TEVAL
      0090A8 CC 82 29         [ 2] 3002         JP     STORE
                                   3003 
                                   3004 ;       .OK     ( -- )
                                   3005 ;       Display 'ok' while interpreting.
      0090AB 90 9E                 3006         .word      LINK
                           00102D  3007 LINK = . 
      0090AD 03                    3008         .byte      3
      0090AE 2E 4F 4B              3009         .ascii     ".OK"
      0090B1                       3010 DOTOK:
      0090B1 CD 81 B8         [ 4] 3011         CALL     DOLIT
      0090B4 90 69                 3012         .word      INTER
      0090B6 CD 83 F3         [ 4] 3013         CALL     TEVAL
      0090B9 CD 82 40         [ 4] 3014         CALL     AT
      0090BC CD 85 29         [ 4] 3015         CALL     EQUAL
      0090BF CD 81 EB         [ 4] 3016         CALL     QBRAN
      0090C2 90 CB                 3017         .word      DOTO1
      0090C4 CD 8C 5B         [ 4] 3018         CALL     DOTQP
      0090C7 03                    3019         .byte      3
      0090C8 20 6F 6B              3020         .ascii     " ok"
      0090CB CC 8C 1C         [ 2] 3021 DOTO1:  JP     CR
                                   3022 
                                   3023 ;       ?STACK  ( -- )
                                   3024 ;       Abort if stack underflows.
      0090CE 90 AD                 3025         .word      LINK
                           001050  3026 LINK = . 
      0090D0 06                    3027         .byte      6
      0090D1 3F 53 54 41 43 4B     3028         .ascii     "?STACK"
      0090D7                       3029 QSTAC: 
      0090D7 CD 87 F9         [ 4] 3030         CALL     DEPTH
      0090DA CD 83 20         [ 4] 3031         CALL     ZLESS   ;check only for underflow
      0090DD CD 90 37         [ 4] 3032         CALL     ABORQ
      0090E0 0B                    3033         .byte      11
      0090E1 20 75 6E 64 65 72 66  3034         .ascii     " underflow "
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal  6C-Bits]



             6C 6F 77 20
      0090E9 6F               [ 4] 3035         RET
                                   3036 
                                   3037 ;       EVAL    ( -- )
                                   3038 ;       Interpret  input stream.
      0090EA 77 20                 3039         .word      LINK
                           00106F  3040 LINK = . 
      0090EC 81                    3041         .byte      4
      0090ED 90 D0 04 45           3042         .ascii     "EVAL"
      001074                       3043 EVAL:
      0090F1 56 41 4C         [ 4] 3044 EVAL1:  CALL     TOKEN
      0090F4 CD 02 67         [ 4] 3045         CALL     DUPP
      0090F4 CD 8E 2E         [ 4] 3046         CALL     CAT     ;?input stream empty
      0090F7 CD 82 E7         [ 4] 3047         CALL     QBRAN
      0090FA CD 82                 3048         .word    EVAL2
      0090FC 5E CD 81         [ 4] 3049         CALL     TEVAL
      0090FF EB 91 10         [ 4] 3050         CALL     ATEXE
      009102 CD 83 F3         [ 4] 3051         CALL     QSTAC   ;evaluate input, check stack
      009105 CD 88 D9         [ 4] 3052         CALL     BRAN
      009108 CD 90                 3053         .word    EVAL1
      00910A D7 CD 82         [ 4] 3054 EVAL2:  CALL     DROP
      00910D 02 90 F4         [ 2] 3055         JP       DOTOK
                                   3056 
                                   3057 ;       PRESET  ( -- )
                                   3058 ;       Reset data stack pointer and
                                   3059 ;       terminal input buffer.
      009110 CD 82                 3060         .word      LINK
                           001098  3061 LINK = . 
      009112 DD                    3062         .byte      6
      009113 CC 90 B1 90 EF 06     3063         .ascii     "PRESET"
      00109F                       3064 PRESE:
      009119 50 52 45         [ 4] 3065         CALL     DOLIT
      00911C 53 45                 3066         .word      SPP
      00911E 54 02 54         [ 4] 3067         CALL     SPSTO
      00911F CD 01 38         [ 4] 3068         CALL     DOLIT
      00911F CD 81                 3069         .word      TIBB
      009121 B8 16 70         [ 4] 3070         CALL     NTIB
      009124 CD 82 D4         [ 4] 3071         CALL     CELLP
      009127 CD 81 B8         [ 2] 3072         JP     STORE
                                   3073 
                                   3074 ;       QUIT    ( -- )
                                   3075 ;       Reset return stack pointer
                                   3076 ;       and start text interpreter.
      00912A 17 00                 3077         .word      LINK
                           0010B7  3078 LINK = . 
      00912C CD                    3079         .byte      4
      00912D 83 D2 CD 87           3080         .ascii     "QUIT"
      0010BC                       3081 QUIT:
      009131 57 CC 82         [ 4] 3082         CALL     DOLIT
      009134 29 91                 3083         .word      RPP
      009136 18 04 51         [ 4] 3084         CALL     RPSTO   ;reset return stack pointer
      009139 55 49 54         [ 4] 3085 QUIT1:  CALL     LBRAC   ;start interpretation
      00913C CD 0F 83         [ 4] 3086 QUIT2:  CALL     QUERY   ;get input
      00913C CD 81 B8         [ 4] 3087         CALL     EVAL
      00913F 17 FF            [ 2] 3088         JRA     QUIT2   ;continue till error
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



                                   3089 
                                   3090 ;; The compiler
                                   3091 
                                   3092 ;       '       ( -- ca )
                                   3093 ;       Search vocabularies for
                                   3094 ;       next word in input stream.
      009141 CD 82                 3095         .word      LINK
                           0010D1  3096 LINK = . 
      009143 7B                    3097         .byte      1
      009144 CD                    3098         .ascii     "'"
      0010D3                       3099 TICK:
      009145 90 A0 CD         [ 4] 3100         CALL     TOKEN
      009148 90 03 CD         [ 4] 3101         CALL     NAMEQ   ;?defined
      00914B 90 F4 20         [ 4] 3102         CALL     QBRAN
      00914E F8 91                 3103         .word      ABOR1
      009150 37               [ 4] 3104         RET     ;yes, push code address
                                   3105 
                                   3106 ;       ALLOT   ( n -- )
                           000001  3107 .if PICATOUT_MOD
                                   3108 ;       Allocate n bytes to RAM 
                           000000  3109 .else 
                                   3110 ;       Allocate n bytes to  code dictionary.
                                   3111 .endif 
      009151 01 27                 3112         .word      LINK
                           0010E1  3113 LINK = . 
      009153 05                    3114         .byte      5
      009153 CD 8E 2E CD 8F        3115         .ascii     "ALLOT"
      0010E7                       3116 ALLOT:
      009158 2B CD 81         [ 4] 3117         CALL     CPP
      00915B EB 90 3F         [ 2] 3118         JP     PSTOR
                                   3119 
                                   3120 ;       ,       ( w -- )
                                   3121 ;         Compile an integer into
                                   3122 ;         code dictionary.
      00915E 81 91                 3123         .word      LINK
                           0010EF  3124 LINK = . 
      009160 51                    3125         .byte      1
      009161 05                    3126         .ascii     ","
      0010F1                       3127 COMMA:
      009162 41 4C 4C         [ 4] 3128         CALL     HERE
      009165 4F 54 67         [ 4] 3129         CALL     DUPP
      009167 CD 06 D7         [ 4] 3130         CALL     CELLP   ;cell boundary
      009167 CD 84 23         [ 4] 3131         CALL     CPP
      00916A CC 88 25         [ 4] 3132         CALL     STORE
      00916D 91 61 01         [ 2] 3133         JP     STORE
                                   3134 
                                   3135 ;       C,      ( c -- )
                                   3136 ;       Compile a byte into
                                   3137 ;       code dictionary.
      009170 2C EF                 3138        .word      LINK
                           001105  3139 LINK = . 
      009171 02                    3140         .byte      2
      009171 CD 88                 3141         .ascii     "C,"
      001108                       3142 CCOMMA:
      009173 A3 CD 82         [ 4] 3143         CALL     HERE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      009176 E7 CD 87         [ 4] 3144         CALL     DUPP
      009179 57 CD 84         [ 4] 3145         CALL     ONEP
      00917C 23 CD 82         [ 4] 3146         CALL     CPP
      00917F 29 CC 82         [ 4] 3147         CALL     STORE
      009182 29 91 6F         [ 2] 3148         JP     CSTOR
                                   3149 
                                   3150 ;       [COMPILE]       ( -- ; <string> )
                                   3151 ;       Compile next immediate
                                   3152 ;       word into code dictionary.
      009185 02 43                 3153         .word      LINK
                           00111C  3154 LINK = . 
      009187 2C                    3155 	.byte      IMEDD+9
      009188 5B 43 4F 4D 50 49 4C  3156         .ascii     "[COMPILE]"
             45 5D
      001126                       3157 BCOMP:
      009188 CD 88 A3         [ 4] 3158         CALL     TICK
      00918B CD 82 E7         [ 2] 3159         JP     JSRC
                                   3160 
                                   3161 ;       COMPILE ( -- )
                                   3162 ;       Compile next jsr in
                                   3163 ;       colon list to code dictionary.
      00918E CD 87                 3164         .word      LINK
                           00112E  3165 LINK = . 
      009190 82                    3166 	.byte      COMPO+7
      009191 CD 84 23 CD 82 29 CC  3167         .ascii     "COMPILE"
      001136                       3168 COMPI:
      009198 82 4D 91         [ 4] 3169         CALL     RFROM
      00919B 85 89 5B         [ 4] 3170         CALL     ONEP
      00919E 43 4F 4D         [ 4] 3171         CALL     DUPP
      0091A1 50 49 4C         [ 4] 3172         CALL     AT
      0091A4 45 5D 82         [ 4] 3173         CALL     JSRC    ;compile subroutine
      0091A6 CD 06 D7         [ 4] 3174         CALL     CELLP
      0091A6 CD 91 53         [ 2] 3175         JP     TOR
                                   3176 
                                   3177 ;       LITERAL ( w -- )
                                   3178 ;       Compile tos to dictionary
                                   3179 ;       as an integer literal.
      0091A9 CC 94                 3180         .word      LINK
                           00114D  3181 LINK = . 
      0091AB 02                    3182 	.byte      IMEDD+7
      0091AC 91 9C 47 43 4F 4D 50  3183         .ascii     "LITERAL"
      001155                       3184 LITER:
      0091B3 49 4C 45         [ 4] 3185         CALL     COMPI
      0091B6 CD 01 38         [ 4] 3186         CALL     DOLIT
      0091B6 CD 82 91         [ 2] 3187         JP     COMMA
                                   3188 
                                   3189 ;       $,"     ( -- )
                                   3190 ;       Compile a literal string
                                   3191 ;       up to next " .
      0091B9 CD 87                 3192         .word      LINK
                           001160  3193 LINK = . 
      0091BB 82                    3194         .byte      3
      0091BC CD 82 E7              3195         .byte     '$',',','"'
      001164                       3196 STRCQ:
      0091BF CD 82 40         [ 4] 3197         CALL     DOLIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



      0091C2 CD 94                 3198         .word     34	; "
      0091C4 02 CD 87         [ 4] 3199         CALL     PARSE
      0091C7 57 CC 82         [ 4] 3200         CALL     HERE
      0091CA B0 91 AE         [ 4] 3201         CALL     PACKS   ;string to code dictionary
      0091CD 87 4C 49         [ 4] 3202         CALL     COUNT
      0091D0 54 45 52         [ 4] 3203         CALL     PLUS    ;calculate aligned end of string
      0091D3 41 4C A3         [ 4] 3204         CALL     CPP
      0091D5 CC 01 A9         [ 2] 3205         JP     STORE
                                   3206 
                                   3207 ;; Structures
                                   3208 
                                   3209 ;       FOR     ( -- a )
                                   3210 ;       Start a FOR-NEXT loop
                                   3211 ;       structure in a colon definition.
      0091D5 CD 91                 3212         .word      LINK
                           001180  3213 LINK = . 
      0091D7 B6                    3214 	.byte      IMEDD+3
      0091D8 CD 81 B8              3215         .ascii     "FOR"
      001184                       3216 FOR:
      0091DB CC 91 71         [ 4] 3217         CALL     COMPI
      0091DE 91 CD 03         [ 4] 3218         CALL     TOR
      0091E1 24 2C 22         [ 2] 3219         JP     HERE
                                   3220 
                                   3221 ;       NEXT    ( a -- )
                                   3222 ;       Terminate a FOR-NEXT loop.
      0091E4 11 80                 3223         .word      LINK
                           00118F  3224 LINK = . 
      0091E4 CD                    3225 	.byte      IMEDD+4
      0091E5 81 B8 00 22           3226         .ascii     "NEXT"
      001194                       3227 NEXT:
      0091E9 CD 8D B1         [ 4] 3228         CALL     COMPI
      0091EC CD 88 A3         [ 4] 3229         CALL     DONXT
      0091EF CD 89 64         [ 2] 3230         JP     COMMA
                                   3231 
                                   3232 ;       BEGIN   ( -- a )
                                   3233 ;       Start an infinite or
                                   3234 ;       indefinite loop structure.
      0091F2 CD 88                 3235         .word      LINK
                           00119F  3236 LINK = . 
      0091F4 8C                    3237 	.byte      IMEDD+5
      0091F5 CD 84 A3 CD 84        3238         .ascii     "BEGIN"
      0011A5                       3239 BEGIN:
      0091FA 23 CC 82         [ 2] 3240         JP     HERE
                                   3241 
                                   3242 ;       UNTIL   ( a -- )
                                   3243 ;       Terminate a BEGIN-UNTIL
                                   3244 ;       indefinite loop structure.
      0091FD 29 91                 3245         .word      LINK
                           0011AA  3246 LINK = . 
      0091FF E0                    3247 	.byte      IMEDD+5
      009200 83 46 4F 52 4C        3248         .ascii     "UNTIL"
      009204                       3249 UNTIL:
      009204 CD 91 B6         [ 4] 3250         CALL     COMPI
      009207 CD 82 B0         [ 4] 3251         CALL     QBRAN
      00920A CC 88 A3         [ 2] 3252         JP     COMMA
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



                                   3253 
                                   3254 ;       AGAIN   ( a -- )
                                   3255 ;       Terminate a BEGIN-AGAIN
                                   3256 ;       infinite loop structure.
      00920D 92 00                 3257         .word      LINK
                           0011BB  3258 LINK = . 
      00920F 84                    3259 	.byte      IMEDD+5
      009210 4E 45 58 54 4E        3260         .ascii     "AGAIN"
      009214                       3261 AGAIN:
      009214 CD 91 B6         [ 4] 3262         CALL     COMPI
      009217 CD 81 CC         [ 4] 3263         CALL     BRAN
      00921A CC 91 71         [ 2] 3264         JP     COMMA
                                   3265 
                                   3266 ;       IF      ( -- A )
                                   3267 ;       Begin a conditional branch.
      00921D 92 0F                 3268         .word      LINK
                           0011CC  3269 LINK = . 
      00921F 85                    3270 	.byte      IMEDD+2
      009220 42 45                 3271         .ascii     "IF"
      0011CF                       3272 IFF:
      009222 47 49 4E         [ 4] 3273         CALL     COMPI
      009225 CD 01 6B         [ 4] 3274         CALL     QBRAN
      009225 CC 88 A3         [ 4] 3275         CALL     HERE
      009228 92 1F 85         [ 4] 3276         CALL     ZERO
      00922B 55 4E 54         [ 2] 3277         JP     COMMA
                                   3278 
                                   3279 ;       THEN        ( A -- )
                                   3280 ;       Terminate a conditional branch structure.
      00922E 49 4C                 3281         .word      LINK
                           0011E0  3282 LINK = . 
      009230 84                    3283 	.byte      IMEDD+4
      009230 CD 91 B6 CD           3284         .ascii     "THEN"
      0011E5                       3285 THENN:
      009234 81 EB CC         [ 4] 3286         CALL     HERE
      009237 91 71 92         [ 4] 3287         CALL     SWAPP
      00923A 2A 85 41         [ 2] 3288         JP     STORE
                                   3289 
                                   3290 ;       ELSE        ( A -- A )
                                   3291 ;       Start the false clause in an IF-ELSE-THEN structure.
      00923D 47 41                 3292         .word      LINK
                           0011F0  3293 LINK = . 
      00923F 49                    3294 	.byte      IMEDD+4
      009240 4E 4C 53 45           3295         .ascii     "ELSE"
      009241                       3296 ELSEE:
      009241 CD 91 B6         [ 4] 3297         CALL     COMPI
      009244 CD 82 02         [ 4] 3298         CALL     BRAN
      009247 CC 91 71         [ 4] 3299         CALL     HERE
      00924A 92 3B 82         [ 4] 3300         CALL     ZERO
      00924D 49 46 F1         [ 4] 3301         CALL     COMMA
      00924F CD 02 77         [ 4] 3302         CALL     SWAPP
      00924F CD 91 B6         [ 4] 3303         CALL     HERE
      009252 CD 81 EB         [ 4] 3304         CALL     SWAPP
      009255 CD 88 A3         [ 2] 3305         JP     STORE
                                   3306 
                                   3307 ;       AHEAD       ( -- A )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



                                   3308 ;       Compile a forward branch instruction.
      009258 CD 87                 3309         .word      LINK
                           001212  3310 LINK = . 
      00925A B6                    3311 	.byte      IMEDD+5
      00925B CC 91 71 92 4C        3312         .ascii     "AHEAD"
      001218                       3313 AHEAD:
      009260 84 54 48         [ 4] 3314         CALL     COMPI
      009263 45 4E 82         [ 4] 3315         CALL     BRAN
      009265 CD 08 23         [ 4] 3316         CALL     HERE
      009265 CD 88 A3         [ 4] 3317         CALL     ZERO
      009268 CD 82 F7         [ 2] 3318         JP     COMMA
                                   3319 
                                   3320 ;       WHILE       ( a -- A a )
                                   3321 ;       Conditional branch out of a BEGIN-WHILE-REPEAT loop.
      00926B CC 82                 3322         .word      LINK
                           001229  3323 LINK = . 
      00926D 29                    3324 	.byte      IMEDD+5
      00926E 92 60 84 45 4C        3325         .ascii     "WHILE"
      00122F                       3326 WHILE:
      009273 53 45 36         [ 4] 3327         CALL     COMPI
      009275 CD 01 6B         [ 4] 3328         CALL     QBRAN
      009275 CD 91 B6         [ 4] 3329         CALL     HERE
      009278 CD 82 02         [ 4] 3330         CALL     ZERO
      00927B CD 88 A3         [ 4] 3331         CALL     COMMA
      00927E CD 87 B6         [ 2] 3332         JP     SWAPP
                                   3333 
                                   3334 ;       REPEAT      ( A a -- )
                                   3335 ;       Terminate a BEGIN-WHILE-REPEAT indefinite loop.
      009281 CD 91                 3336         .word      LINK
                           001243  3337 LINK = . 
      009283 71                    3338         .byte      IMEDD+6
      009284 CD 82 F7 CD 88 A3     3339         .ascii     "REPEAT"
      00124A                       3340 REPEA:
      00928A CD 82 F7         [ 4] 3341         CALL     COMPI
      00928D CC 82 29         [ 4] 3342         CALL     BRAN
      009290 92 70 85         [ 4] 3343         CALL     COMMA
      009293 41 48 45         [ 4] 3344         CALL     HERE
      009296 41 44 77         [ 4] 3345         CALL     SWAPP
      009298 CC 01 A9         [ 2] 3346         JP     STORE
                                   3347 
                                   3348 ;       AFT         ( a -- a A )
                                   3349 ;       Jump to THEN in a FOR-AFT-THEN-NEXT loop the first time through.
      009298 CD 91                 3350         .word      LINK
                           00125E  3351 LINK = . 
      00929A B6                    3352 	.byte      IMEDD+3
      00929B CD 82 02              3353         .ascii     "AFT"
      001262                       3354 AFT:
      00929E CD 88 A3         [ 4] 3355         CALL     DROP
      0092A1 CD 87 B6         [ 4] 3356         CALL     AHEAD
      0092A4 CC 91 71         [ 4] 3357         CALL     HERE
      0092A7 92 92 85         [ 2] 3358         JP     SWAPP
                                   3359 
                                   3360 ;       ABORT"      ( -- ; <string> )
                                   3361 ;       Conditional abort with an error message.
      0092AA 57 48                 3362         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



                           001270  3363 LINK = . 
      0092AC 49                    3364 	.byte      IMEDD+6
      0092AD 4C 45 4F 52 54        3365         .ascii     "ABORT"
      0092AF 22                    3366         .byte      '"'
      001277                       3367 ABRTQ:
      0092AF CD 91 B6         [ 4] 3368         CALL     COMPI
      0092B2 CD 81 EB         [ 4] 3369         CALL     ABORQ
      0092B5 CD 88 A3         [ 2] 3370         JP     STRCQ
                                   3371 
                                   3372 ;       $"     ( -- ; <string> )
                                   3373 ;       Compile an inline string literal.
      0092B8 CD 87                 3374         .word      LINK
                           001282  3375 LINK = . 
      0092BA B6                    3376 	.byte      IMEDD+2
      0092BB CD 91                 3377         .byte     '$','"'
      001285                       3378 STRQ:
      0092BD 71 CC 82         [ 4] 3379         CALL     COMPI
      0092C0 F7 92 A9         [ 4] 3380         CALL     STRQP
      0092C3 86 52 45         [ 2] 3381         JP     STRCQ
                                   3382 
                                   3383 ;       ."          ( -- ; <string> )
                                   3384 ;       Compile an inline string literal to be typed out at run time.
      0092C6 50 45                 3385         .word      LINK
                           001290  3386 LINK = . 
      0092C8 41                    3387 	.byte      IMEDD+2
      0092C9 54 22                 3388         .byte     '.','"'
      0092CA                       3389 DOTQ:
      0092CA CD 91 B6         [ 4] 3390         CALL     COMPI
      0092CD CD 82 02         [ 4] 3391         CALL     DOTQP
      0092D0 CD 91 71         [ 2] 3392         JP     STRCQ
                                   3393 
                                   3394 ;; Name compiler
                                   3395 
                                   3396 ;       ?UNIQUE ( a -- a )
                                   3397 ;       Display a warning message
                                   3398 ;       if word already exists.
      0092D3 CD 88                 3399         .word      LINK
                           00129E  3400 LINK = . 
      0092D5 A3                    3401         .byte      7
      0092D6 CD 82 F7 CC 82 29 92  3402         .ascii     "?UNIQUE"
      0012A6                       3403 UNIQU:
      0092DD C3 83 41         [ 4] 3404         CALL     DUPP
      0092E0 46 54 AB         [ 4] 3405         CALL     NAMEQ   ;?name exists
      0092E2 CD 01 6B         [ 4] 3406         CALL     QBRAN
      0092E2 CD 82                 3407         .word      UNIQ1
      0092E4 DD CD 92         [ 4] 3408         CALL     DOTQP   ;redef are OK
      0092E7 98                    3409         .byte       7
      0092E8 CD 88 A3 CC 82 F7 92  3410         .ascii     " reDef "       
      0092EF DE 86 41         [ 4] 3411         CALL     OVER
      0092F2 42 4F 52         [ 4] 3412         CALL     COUNT
      0092F5 54 22 7E         [ 4] 3413         CALL     TYPES   ;just in case
      0092F7 CC 02 5D         [ 2] 3414 UNIQ1:  JP     DROP
                                   3415 
                                   3416 ;       $,n     ( na -- )
                                   3417 ;       Build a new dictionary name
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



                                   3418 ;       using string at na.
      0092F7 CD 91                 3419         .word      LINK
                           0012CA  3420 LINK = . 
      0092F9 B6                    3421         .byte      3
      0092FA CD 90 37              3422         .ascii     "$,n"
      0012CE                       3423 SNAME:
      0092FD CC 91 E4         [ 4] 3424         CALL     DUPP
      009300 92 F0 82         [ 4] 3425         CALL     CAT     ;?null input
      009303 24 22 6B         [ 4] 3426         CALL     QBRAN
      009305 13 04                 3427         .word      PNAM1
      009305 CD 91 B6         [ 4] 3428         CALL     UNIQU   ;?redefinition
      009308 CD 8C 51         [ 4] 3429         CALL     DUPP
      00930B CC 91 E4         [ 4] 3430         CALL     COUNT
      00930E 93 02 82         [ 4] 3431         CALL     PLUS
      009311 2E 22 A3         [ 4] 3432         CALL     CPP
      009313 CD 01 A9         [ 4] 3433         CALL     STORE
      009313 CD 91 B6         [ 4] 3434         CALL     DUPP
      009316 CD 8C 5B         [ 4] 3435         CALL     LAST
      009319 CC 91 E4         [ 4] 3436         CALL     STORE   ;save na for vocabulary link
      00931C 93 10 07         [ 4] 3437         CALL     CELLM   ;link address
      00931F 3F 55 4E         [ 4] 3438         CALL     CNTXT
      009322 49 51 55         [ 4] 3439         CALL     AT
      009325 45 02 77         [ 4] 3440         CALL     SWAPP
      009326 CD 01 A9         [ 4] 3441         CALL     STORE
      009326 CD               [ 4] 3442         RET     ;save code pointer
      009327 82 E7 CD         [ 4] 3443 PNAM1:  CALL     STRQP
      00932A 8F                    3444         .byte      5
      00932B 2B CD 81 EB 93        3445         .ascii     " name" ;null input
      009330 45 CD 8C         [ 2] 3446         JP     ABOR1
                                   3447 
                                   3448 ;; FORTH compiler
                                   3449 
                                   3450 ;       $COMPILE        ( a -- )
                                   3451 ;       Compile next word to
                                   3452 ;       dictionary as a token or literal.
      009333 5B 07                 3453         .word      LINK
                           001312  3454 LINK = . 
      009335 20                    3455         .byte      8
      009336 72 65 44 65 66 20 CD  3456         .ascii     "$COMPILE"
             83
      00131B                       3457 SCOMP:
      00933E 11 CD 88         [ 4] 3458         CALL     NAMEQ
      009341 8C CD 8B         [ 4] 3459         CALL     QDUP    ;?defined
      009344 FE CC 82         [ 4] 3460         CALL     QBRAN
      009347 DD 93                 3461         .word      SCOM2
      009349 1E 03 24         [ 4] 3462         CALL     AT
      00934C 2C 6E 38         [ 4] 3463         CALL     DOLIT
      00934E 80 00                 3464         .word     0x8000	;  IMEDD*256
      00934E CD 82 E7         [ 4] 3465         CALL     ANDD    ;?immediate
      009351 CD 82 5E         [ 4] 3466         CALL     QBRAN
      009354 CD 81                 3467         .word      SCOM1
      009356 EB 93 84         [ 2] 3468         JP     EXECU
      009359 CD 93 26         [ 2] 3469 SCOM1:  JP     JSRC
      00935C CD 82 E7         [ 4] 3470 SCOM2:  CALL     NUMBQ   ;try to convert to number
      00935F CD 88 8C         [ 4] 3471         CALL     QBRAN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      009362 CD 84                 3472         .word      ABOR1
      009364 A3 CD 84         [ 2] 3473         JP     LITER
                                   3474 
                                   3475 ;       OVERT   ( -- )
                                   3476 ;       Link a new word into vocabulary.
      009367 23 CD                 3477         .word      LINK
                           001349  3478 LINK = . 
      009369 82                    3479         .byte      5
      00936A 29 CD 82 E7 CD        3480         .ascii     "OVERT"
      00134F                       3481 OVERT:
      00936F 84 42 CD         [ 4] 3482         CALL     LAST
      009372 82 29 CD         [ 4] 3483         CALL     AT
      009375 87 66 CD         [ 4] 3484         CALL     CNTXT
      009378 84 15 CD         [ 2] 3485         JP     STORE
                                   3486 
                                   3487 ;       ;       ( -- )
                                   3488 ;       Terminate a colon definition.
      00937B 82 40                 3489         .word      LINK
                           00135D  3490 LINK = . 
      00937D CD                    3491 	.byte      IMEDD+COMPO+1
      00937E 82                    3492         .ascii     ";"
      00135F                       3493 SEMIS:
      00937F F7 CD 82         [ 4] 3494         CALL     COMPI
      009382 29 81 CD         [ 4] 3495         CALL     EXIT
      009385 8C 51 05         [ 4] 3496         CALL     LBRAC
      009388 20 6E 61         [ 2] 3497         JP     OVERT
                                   3498 
                                   3499 ;       ]       ( -- )
                                   3500 ;       Start compiling words in
                                   3501 ;       input stream.
      00938B 6D 65                 3502         .word      LINK
                           00136D  3503 LINK = . 
      00938D CC                    3504         .byte      1
      00938E 90                    3505         .ascii     "]"
      00136F                       3506 RBRAC:
      00938F 3F 93 4A         [ 4] 3507         CALL     DOLIT
      009392 08 24                 3508         .word      SCOMP
      009394 43 4F 4D         [ 4] 3509         CALL     TEVAL
      009397 50 49 4C         [ 2] 3510         JP     STORE
                                   3511 
                                   3512 ;       CALL,    ( ca -- )
                                   3513 ;       Compile a subroutine call.
      00939A 45 6D                 3514         .word      LINK
                           00137C  3515 LINK = . 
      00939B 04                    3516         .byte      4
      00939B CD 8F 2B CD 84        3517         .ascii     "CALL,"
      001382                       3518 JSRC:
      0093A0 52 CD 81         [ 4] 3519         CALL     DOLIT
      0093A3 EB 93                 3520         .word     CALLL     ;CALL
      0093A5 BC CD 82         [ 4] 3521         CALL     CCOMMA
      0093A8 40 CD 81         [ 2] 3522         JP     COMMA
                                   3523 
                                   3524 ;       :       ( -- ; <string> )
                                   3525 ;       Start a new colon definition
                                   3526 ;       using next word as its name.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      0093AB B8 80                 3527         .word      LINK
                           00138F  3528 LINK = . 
      0093AD 00                    3529         .byte      1
      0093AE CD                    3530         .ascii     ":"
      001391                       3531 COLON:
      0093AF 83 33 CD         [ 4] 3532         CALL     TOKEN
      0093B2 81 EB 93         [ 4] 3533         CALL     SNAME
      0093B5 B9 CC 82         [ 2] 3534         JP     RBRAC
                                   3535 
                                   3536 ;       IMMEDIATE       ( -- )
                                   3537 ;       Make last compiled word
                                   3538 ;       an immediate word.
      0093B8 12 CC                 3539         .word      LINK
                           00139C  3540 LINK = . 
      0093BA 94                    3541         .byte      9
      0093BB 02 CD 8A C9 CD 81 EB  3542         .ascii     "IMMEDIATE"
             90 3F
      0013A6                       3543 IMMED:
      0093C4 CC 91 D5         [ 4] 3544         CALL     DOLIT
      0093C7 93 92                 3545         .word     0x8000	;  IMEDD*256
      0093C9 05 4F 56         [ 4] 3546         CALL     LAST
      0093CC 45 52 54         [ 4] 3547         CALL     AT
      0093CF CD 01 C0         [ 4] 3548         CALL     AT
      0093CF CD 84 42         [ 4] 3549         CALL     ORR
      0093D2 CD 82 40         [ 4] 3550         CALL     LAST
      0093D5 CD 84 15         [ 4] 3551         CALL     AT
      0093D8 CC 82 29         [ 2] 3552         JP     STORE
                                   3553 
                                   3554 ;; Defining words
                                   3555 
                                   3556 ;       CREATE  ( -- ; <string> )
                                   3557 ;       Compile a new array
                                   3558 ;       without allocating space.
      0093DB 93 C9                 3559         .word      LINK
                           0013C2  3560 LINK = . 
      0093DD C1                    3561         .byte      6
      0093DE 3B 52 45 41 54 45     3562         .ascii     "CREATE"
      0093DF                       3563 CREAT:
      0093DF CD 91 B6         [ 4] 3564         CALL     TOKEN
      0093E2 CD 82 22         [ 4] 3565         CALL     SNAME
      0093E5 CD 90 A0         [ 4] 3566         CALL     OVERT        
      0093E8 CC 93 CF         [ 4] 3567         CALL     COMPI 
      0093EB 93 DD 01         [ 4] 3568         CALL     DOVAR
      0093EE 5D               [ 4] 3569         RET
                                   3570 
                                   3571 ;       VARIABLE        ( -- ; <string> )
                                   3572 ;       Compile a new variable
                                   3573 ;       initialized to 0.
      0093EF 13 C2                 3574         .word      LINK
                           0013DB  3575 LINK = . 
      0093EF CD                    3576         .byte      8
      0093F0 81 B8 93 9B CD 83 F3  3577         .ascii     "VARIABLE"
             CC
      0013E4                       3578 VARIA:
                           000001  3579 .if PICATOUT_MOD
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



                                   3580 ; indirect variable so that VARIABLE definition can be compiled in FLASH 
      0093F8 82 29 93         [ 4] 3581         CALL HERE
      0093FB ED 04 43         [ 4] 3582         CALL DUPP 
      0093FE 41 4C 4C         [ 4] 3583         CALL CELLP 
      009401 2C 03 A3         [ 4] 3584         CALL CPP 
      009402 CD 01 A9         [ 4] 3585         CALL STORE 
                                   3586 .endif         
      009402 CD 81 B8         [ 4] 3587         CALL     CREAT
      009405 00 CD CD         [ 4] 3588         CALL DUPP
      009408 91 88 CC         [ 4] 3589         CALL COMMA
      00940B 91 71 93         [ 4] 3590         CALL     ZERO
                           000001  3591 .if PICATOUT_MOD 
      00940E FC 01 3A         [ 4] 3592         call SWAPP 
      009411 CD 01 A9         [ 4] 3593         CALL   STORE 
      009411 CD 8E 2E         [ 4] 3594         CALL FMOVE ; move definition to FLASH
      009414 CD               [ 4] 3595         RET 
                                   3596 .endif ;PICATOUT_MOD        
                                   3597 
                           000001  3598 .if PICATOUT_MOD
                                   3599 ;       CONSTANT  ( n -- ; <string> )
                                   3600 ;       Compile a new constant 
                                   3601 ;       n CONSTANT name 
      009415 93 4E                 3602         .word LINK 
                           00140B  3603         LINK=. 
      009417 CC                    3604         .byte 8 
      009418 93 EF 94 0F 09 49 4D  3605         .ascii "CONSTANT" 
             4D
      001414                       3606 constant:          
      009420 45 44 49         [ 4] 3607         CALL TOKEN
      009423 41 54 45         [ 4] 3608         CALL SNAME 
      009426 CD 13 4F         [ 4] 3609         CALL OVERT 
      009426 CD 81 B8         [ 4] 3610         CALL COMPI 
      009429 80 00 CD         [ 4] 3611         CALL DOCONST
      00942C 84 42 CD         [ 4] 3612         CALL COMMA 
      00942F 82               [ 4] 3613         RET          
                                   3614 
                                   3615 ; CONSTANT runtime semantic 
                                   3616 ; doCONST  ( -- n )
      009430 40 CD                 3617         .word LINK 
                           001429  3618         LINK=.
      009432 82                    3619         .byte 7
      009433 40 CD 83 47 CD 84 42  3620         .ascii "DOCONST"
      001431                       3621 DOCONST:
      00943A CD 82 40         [ 2] 3622         subw x,#CELLL
      00943D CC 82            [ 2] 3623         popw y 
      00943F 29 94            [ 2] 3624         ldw y,(y) 
      009441 1C               [ 2] 3625         ldw (x),y 
      009442 06               [ 4] 3626         ret 
                                   3627 .endif ;PICATOUT_MOD
                                   3628 
                                   3629 
                                   3630 ;; Tools
                                   3631 
                                   3632 ;       _TYPE   ( b u -- )
                                   3633 ;       Display a string. Filter
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



                                   3634 ;       non-printing characters.
      009443 43 52                 3635         .word      LINK
                           00143C  3636 LINK = . 
      009445 45                    3637         .byte      5
      009446 41 54 45 50 45        3638         .ascii     "_TYPE"
      009449                       3639 UTYPE:
      009449 CD 8E 2E         [ 4] 3640         CALL     TOR     ;start count down loop
      00944C CD 93            [ 2] 3641         JRA     UTYP2   ;skip first pass
      00944E 4E CD 93         [ 4] 3642 UTYP1:  CALL     DUPP
      009451 CF CD 91         [ 4] 3643         CALL     CAT
      009454 B6 CD 83         [ 4] 3644         CALL     TCHAR
      009457 94 81 94         [ 4] 3645         CALL     EMIT    ;display only printable
      00945A 42 08 56         [ 4] 3646         CALL     ONEP    ;increment address
      00945D 41 52 49         [ 4] 3647 UTYP2:  CALL     DONXT
      009460 41 42                 3648         .word      UTYP1   ;loop till done
      009462 4C 45 5D         [ 2] 3649         JP     DROP
                                   3650 
                                   3651 ;       dm+     ( a u -- a )
                                   3652 ;       Dump u bytes from ,
                                   3653 ;       leaving a+u on  stack.
      009464 14 3C                 3654         .word      LINK
                           001460  3655 LINK = . 
      009464 CD                    3656         .byte      3
      009465 88 A3 CD              3657         .ascii     "dm+"
      001464                       3658 DUMPP:
      009468 82 E7 CD         [ 4] 3659         CALL     OVER
      00946B 87 57 CD         [ 4] 3660         CALL     DOLIT
      00946E 84 23                 3661         .word      4
      009470 CD 82 29         [ 4] 3662         CALL     UDOTR   ;display address
      009473 CD 94 49         [ 4] 3663         CALL     SPACE
      009476 CD 82 E7         [ 4] 3664         CALL     TOR     ;start count down loop
      009479 CD 91            [ 2] 3665         JRA     PDUM2   ;skip first pass
      00947B 71 CD 87         [ 4] 3666 PDUM1:  CALL     DUPP
      00947E B6 CD 82         [ 4] 3667         CALL     CAT
      009481 F7 CD 82         [ 4] 3668         CALL     DOLIT
      009484 29 CD                 3669         .word      3
      009486 9A F3 81         [ 4] 3670         CALL     UDOTR   ;display numeric data
      009489 94 5B 08         [ 4] 3671         CALL     ONEP    ;increment address
      00948C 43 4F 4E         [ 4] 3672 PDUM2:  CALL     DONXT
      00948F 53 54                 3673         .word      PDUM1   ;loop till done
      009491 41               [ 4] 3674         RET
                                   3675 
                                   3676 ;       DUMP    ( a u -- )
                                   3677 ;       Dump u bytes from a,
                                   3678 ;       in a formatted manner.
      009492 4E 54                 3679         .word      LINK
                           001490  3680 LINK = . 
      009494 04                    3681         .byte      4
      009494 CD 8E 2E CD           3682         .ascii     "DUMP"
      001495                       3683 DUMP:
      009498 93 4E CD         [ 4] 3684         CALL     BASE
      00949B 93 CF CD         [ 4] 3685         CALL     AT
      00949E 91 B6 CD         [ 4] 3686         CALL     TOR
      0094A1 94 B1 CD         [ 4] 3687         CALL     HEX     ;save radix, set hex
      0094A4 91 71 81         [ 4] 3688         CALL     DOLIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      0094A7 94 8B                 3689         .word      16
      0094A9 07 44 4F         [ 4] 3690         CALL     SLASH   ;change count to lines
      0094AC 43 4F 4E         [ 4] 3691         CALL     TOR     ;start count down loop
      0094AF 53 54 9C         [ 4] 3692 DUMP1:  CALL     CR
      0094B1 CD 01 38         [ 4] 3693         CALL     DOLIT
      0094B1 1D 00                 3694         .word      16
      0094B3 02 90 85         [ 4] 3695         CALL     DDUP
      0094B6 90 FE FF         [ 4] 3696         CALL     DUMPP   ;display numeric
      0094B9 81 94 A9         [ 4] 3697         CALL     ROT
      0094BC 05 5F 54         [ 4] 3698         CALL     ROT
      0094BF 59 50 45         [ 4] 3699         CALL     SPACE
      0094C2 CD 0B 54         [ 4] 3700         CALL     SPACE
      0094C2 CD 82 B0         [ 4] 3701         CALL     UTYPE   ;display printable characters
      0094C5 20 0F CD         [ 4] 3702         CALL     DONXT
      0094C8 82 E7                 3703         .word      DUMP1   ;loop till done
      0094CA CD 82 5E         [ 4] 3704 DUMP3:  CALL     DROP
      0094CD CD 87 E0         [ 4] 3705         CALL     RFROM
      0094D0 CD 81 A2         [ 4] 3706         CALL     BASE
      0094D3 CD 87 82         [ 2] 3707         JP     STORE   ;restore radix
                                   3708 
                                   3709 ;       .S      ( ... -- ... )
                                   3710 ;        Display  contents of stack.
      0094D6 CD 81                 3711         .word      LINK
                           0014DC  3712 LINK = . 
      0094D8 CC                    3713         .byte      2
      0094D9 94 C7                 3714         .ascii     ".S"
      0014DF                       3715 DOTS:
      0094DB CC 82 DD         [ 4] 3716         CALL     CR
      0094DE 94 BC 03         [ 4] 3717         CALL     DEPTH   ;stack depth
      0094E1 64 6D 2B         [ 4] 3718         CALL     TOR     ;start count down loop
      0094E4 20 0C            [ 2] 3719         JRA     DOTS2   ;skip first pass
      0094E4 CD 83 11         [ 4] 3720 DOTS1:  CALL     RAT
      0094E7 CD 81 B8         [ 4] 3721         CALL ONEP
      0094EA 00 04 CD         [ 4] 3722 	CALL     PICK
      0094ED 8C 84 CD         [ 4] 3723         CALL     DOT     ;index stack, display contents
      0094F0 8B D4 CD         [ 4] 3724 DOTS2:  CALL     DONXT
      0094F3 82 B0                 3725         .word      DOTS1   ;loop till done
      0094F5 20 11 CD         [ 4] 3726         CALL     DOTQP
      0094F8 82                    3727         .byte      5
      0094F9 E7 CD 82 5E CD        3728         .ascii     " <sp "
      0094FE 81               [ 4] 3729         RET
                                   3730 
                                   3731 ;       >NAME   ( ca -- na | F )
                                   3732 ;       Convert code address
                                   3733 ;       to a name address.
      0094FF B8 00                 3734         .word      LINK
                           001507  3735 LINK = . 
      009501 03                    3736         .byte      5
      009502 CD 8C 84 CD 87        3737         .ascii     ">NAME"
      00150D                       3738 TNAME:
      009507 82 CD 81         [ 4] 3739         CALL     CNTXT   ;vocabulary link
      00950A CC 94 F7         [ 4] 3740 TNAM2:  CALL     AT
      00950D 81 94 E0         [ 4] 3741         CALL     DUPP    ;?last word in a vocabulary
      009510 04 44 55         [ 4] 3742         CALL     QBRAN
      009513 4D 50                 3743         .word      TNAM4
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      009515 CD 04 0E         [ 4] 3744         CALL     DDUP
      009515 CD 83 A4         [ 4] 3745         CALL     NAMET
      009518 CD 82 40         [ 4] 3746         CALL     XORR    ;compare
      00951B CD 82 B0         [ 4] 3747         CALL     QBRAN
      00951E CD 8A                 3748         .word      TNAM3
      009520 5C CD 81         [ 4] 3749         CALL     CELLM   ;continue with next word
      009523 B8 00            [ 2] 3750         JRA     TNAM2
      009525 10 CD 86         [ 4] 3751 TNAM3:  CALL     SWAPP
      009528 A8 CD 82         [ 2] 3752         JP     DROP
      00952B B0 CD 8C         [ 4] 3753 TNAM4:  CALL     DDROP
      00952E 1C CD 81         [ 2] 3754         JP     ZERO
                                   3755 
                                   3756 ;       .ID     ( na -- )
                                   3757 ;        Display  name at address.
      009531 B8 00                 3758         .word      LINK
                           00153C  3759 LINK = . 
      009533 10                    3760         .byte      3
      009534 CD 84 8E              3761         .ascii     ".ID"
      001540                       3762 DOTID:
      009537 CD 94 E4         [ 4] 3763         CALL     QDUP    ;if zero no name
      00953A CD 84 63         [ 4] 3764         CALL     QBRAN
      00953D CD 84                 3765         .word      DOTI1
      00953F 63 CD 8B         [ 4] 3766         CALL     COUNT
      009542 D4 CD 8B         [ 4] 3767         CALL     DOLIT
      009545 D4 CD                 3768         .word      0x1F
      009547 94 C2 CD         [ 4] 3769         CALL     ANDD    ;mask lexicon bits
      00954A 81 CC 95         [ 2] 3770         JP     UTYPE
      00954D 2C CD 82         [ 4] 3771 DOTI1:  CALL     DOTQP
      009550 DD                    3772         .byte      9
      009551 CD 82 91 CD 83 A4 CC  3773         .ascii     " noName"
      009558 82               [ 4] 3774         RET
                                   3775 
                           000000  3776 WANT_SEE=0 
                           000000  3777 .if WANT_SEE 
                                   3778 ;       SEE     ( -- ; <string> )
                                   3779 ;       A simple decompiler.
                                   3780 ;       Updated for byte machines.
                                   3781         .word      LINK
                                   3782 LINK = . 
                                   3783         .byte      3
                                   3784         .ascii     "SEE"
                                   3785 SEE:
                                   3786         CALL     TICK    ;starting address
                                   3787         CALL     CR
                                   3788         CALL     ONEM
                                   3789 SEE1:   CALL     ONEP
                                   3790         CALL     DUPP
                                   3791         CALL     AT
                                   3792         CALL     DUPP    ;?does it contain a zero
                                   3793         CALL     QBRAN
                                   3794         .word    SEE2
                                   3795         CALL     TNAME   ;?is it a name
                                   3796 SEE2:   CALL     QDUP    ;name address or zero
                                   3797         CALL     QBRAN
                                   3798         .word    SEE3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



                                   3799         CALL     SPACE
                                   3800         CALL     DOTID   ;display name
                                   3801         CALL     ONEP
                                   3802         JRA      SEE4
                                   3803 SEE3:   CALL     DUPP
                                   3804         CALL     CAT
                                   3805         CALL     UDOT    ;display number
                                   3806 SEE4:   CALL     NUFQ    ;user control
                                   3807         CALL     QBRAN
                                   3808         .word    SEE1
                                   3809         JP     DROP
                                   3810 .endif ; WANT_SEE 
                                   3811 
                                   3812 ;       WORDS   ( -- )
                                   3813 ;       Display names in vocabulary.
      009559 29 95                 3814         .word      LINK
                           001564  3815 LINK = . 
      00955B 10                    3816         .byte      5
      00955C 02 2E 53 44 53        3817         .ascii     "WORDS"
      00955F                       3818 WORDS:
      00955F CD 8C 1C         [ 4] 3819         CALL     CR
      009562 CD 87 F9         [ 4] 3820         CALL     CNTXT   ;only in context
      009565 CD 82 B0         [ 4] 3821 WORS1:  CALL     AT
      009568 20 0C CD         [ 4] 3822         CALL     QDUP    ;?at end of list
      00956B 82 A4 CD         [ 4] 3823         CALL     QBRAN
      00956E 87 82                 3824         .word      WORS2
      009570 CD 88 10         [ 4] 3825         CALL     DUPP
      009573 CD 8C B7         [ 4] 3826         CALL     SPACE
      009576 CD 81 CC         [ 4] 3827         CALL     DOTID   ;display a name
      009579 95 6A CD         [ 4] 3828         CALL     CELLM
      00957C 8C 5B 05         [ 4] 3829         CALL     BRAN
      00957F 20 3C                 3830         .word      WORS1
      009581 73 70 20         [ 4] 3831         CALL     DROP
      009584 81               [ 4] 3832 WORS2:  RET
                                   3833 
                                   3834         
                                   3835 ;; Hardware reset
                                   3836 
                                   3837 ;       hi      ( -- )
                                   3838 ;       Display sign-on message.
      009585 95 5C                 3839         .word      LINK
                           001592  3840 LINK = . 
      009587 05                    3841         .byte      2
      009588 3E 4E                 3842         .ascii     "hi"
      001595                       3843 HI:
      00958A 41 4D 45         [ 4] 3844         CALL     CR
      00958D CD 0B DB         [ 4] 3845         CALL     DOTQP   ;initialize I/O
      00958D CD                    3846         .byte      15
      00958E 84 15 CD 82 40 CD 82  3847         .ascii     "stm8eForth v"
             E7 CD 81 EB 95
      00959A B4                    3848 	.byte      VER+'0'
      00959B CD                    3849         .byte      '.' 
      00959C 84                    3850 	.byte      EXT+'0' ;version
      00959D 8E CD 8E         [ 2] 3851         JP     CR
                                   3852 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



                           000000  3853 WANT_DEBUG=0
                           000000  3854 .if WANT_DEBUG 
                                   3855 ;       DEBUG      ( -- )
                                   3856 ;       Display sign-on message.
                                   3857 ;        .word      LINK
                                   3858 LINK = . 
                                   3859         .byte      5
                                   3860         .ascii     "DEBUG"
                                   3861 DEBUG:
                                   3862 	CALL DOLIT
                                   3863 	.word 0x65
                                   3864 	CALL EMIT
                                   3865 	CALL DOLIT
                                   3866 	.word 0
                                   3867  	CALL ZLESS 
                                   3868 	CALL DOLIT
                                   3869 	.word 0xFFFE
                                   3870 	CALL ZLESS 
                                   3871 	CALL UPLUS 
                                   3872  	CALL DROP 
                                   3873 	CALL DOLIT
                                   3874 	.word 3
                                   3875 	CALL UPLUS 
                                   3876 	CALL UPLUS 
                                   3877  	CALL DROP
                                   3878 	CALL DOLIT
                                   3879 	.word 0x43
                                   3880 	CALL UPLUS 
                                   3881  	CALL DROP
                                   3882 	CALL EMIT
                                   3883 	CALL DOLIT
                                   3884 	.word 0x4F
                                   3885 	CALL DOLIT
                                   3886 	.word 0x6F
                                   3887  	CALL XORR
                                   3888 	CALL DOLIT
                                   3889 	.word 0xF0
                                   3890  	CALL ANDD
                                   3891 	CALL DOLIT
                                   3892 	.word 0x4F
                                   3893  	CALL ORR
                                   3894 	CALL EMIT
                                   3895 	CALL DOLIT
                                   3896 	.word 8
                                   3897 	CALL DOLIT
                                   3898 	.word 6
                                   3899  	CALL SWAPP
                                   3900 	CALL OVER
                                   3901 	CALL XORR
                                   3902 	CALL DOLIT
                                   3903 	.word 3
                                   3904 	CALL ANDD 
                                   3905 	CALL ANDD
                                   3906 	CALL DOLIT
                                   3907 	.word 0x70
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



                                   3908 	CALL UPLUS 
                                   3909 	CALL DROP
                                   3910 	CALL EMIT
                                   3911 	CALL DOLIT
                                   3912 	.word 0
                                   3913 	CALL QBRAN
                                   3914 	.word DEBUG1
                                   3915 	CALL DOLIT
                                   3916 	.word 0x3F
                                   3917 DEBUG1:
                                   3918 	CALL DOLIT
                                   3919 	.word 0xFFFF
                                   3920 	CALL QBRAN
                                   3921 	.word DEBUG2
                                   3922 	CALL DOLIT
                                   3923 	.word 0x74
                                   3924 	CALL BRAN
                                   3925 	.word DEBUG3
                                   3926 DEBUG2:
                                   3927 	CALL DOLIT
                                   3928 	.word 0x21
                                   3929 DEBUG3:
                                   3930 	CALL EMIT
                                   3931 	CALL DOLIT
                                   3932 	.word 0x68
                                   3933 	CALL DOLIT
                                   3934 	.word 0x80
                                   3935 	CALL STORE
                                   3936 	CALL DOLIT
                                   3937 	.word 0x80
                                   3938 	CALL AT
                                   3939 	CALL EMIT
                                   3940 	CALL DOLIT
                                   3941 	.word 0x4D
                                   3942 	CALL TOR
                                   3943 	CALL RAT
                                   3944 	CALL RFROM
                                   3945 	CALL ANDD
                                   3946 	CALL EMIT
                                   3947 	CALL DOLIT
                                   3948 	.word 0x61
                                   3949 	CALL DOLIT
                                   3950 	.word 0xA
                                   3951 	CALL TOR
                                   3952 DEBUG4:
                                   3953 	CALL DOLIT
                                   3954 	.word 1
                                   3955 	CALL UPLUS 
                                   3956 	CALL DROP
                                   3957 	CALL DONXT
                                   3958 	.word DEBUG4
                                   3959 	CALL EMIT
                                   3960 	CALL DOLIT
                                   3961 	.word 0x656D
                                   3962 	CALL DOLIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



                                   3963 	.word 0x100
                                   3964 	CALL UMSTA
                                   3965 	CALL SWAPP
                                   3966 	CALL DOLIT
                                   3967 	.word 0x100
                                   3968 	CALL UMSTA
                                   3969 	CALL SWAPP 
                                   3970 	CALL DROP
                                   3971 	CALL EMIT
                                   3972 	CALL EMIT
                                   3973 	CALL DOLIT
                                   3974 	.word 0x2043
                                   3975 	CALL DOLIT
                                   3976 	.word 0
                                   3977 	CALL DOLIT
                                   3978 	.word 0x100
                                   3979 	CALL UMMOD
                                   3980 	CALL EMIT
                                   3981 	CALL EMIT
                                   3982 	;JP ORIG
                                   3983 	RET
                                   3984 .endif ; WANT_DEBUG 
                                   3985 
                                   3986 
                                   3987 ;       'BOOT   ( -- a )
                                   3988 ;       The application startup vector.
      0095A0 3C CD                 3989         .word      LINK
                           0015B0  3990 LINK = . 
      0095A2 83                    3991         .byte      5
      0095A3 5C CD 81 EB 95        3992         .ascii     "'BOOT"
      0015B6                       3993 TBOOT:
      0095A8 AE CD 87         [ 4] 3994         CALL     DOVAR
      0095AB 66 20                 3995         .word    APP_RUN      ;application to boot
                                   3996 
                                   3997 ;       COLD    ( -- )
                                   3998 ;       The hilevel cold start s=ence.
      0095AD E2 CD                 3999         .word      LINK
                           0015BD  4000 LINK = . 
      0095AF 82                    4001         .byte      4
      0095B0 F7 CC 82 DD           4002         .ascii     "COLD"
      0015C2                       4003 COLD:
                           000000  4004 .if WANT_DEBUG
                                   4005         CALL DEBUG
                                   4006 .endif 
      0095B4 CD 84 83         [ 4] 4007 COLD1:  CALL     DOLIT
      0095B7 CC 87                 4008         .word      UZERO
      0095B9 B6 95 87         [ 4] 4009 	CALL     DOLIT
      0095BC 03 2E                 4010         .word      UPP
      0095BE 49 44 38         [ 4] 4011         CALL     DOLIT
      0095C0 00 16                 4012 	.word      UEND-UZERO
      0095C0 CD 84 52         [ 4] 4013         CALL     CMOVE   ;initialize user area
                                   4014 
                           000001  4015 .if PICATOUT_MOD
                                   4016 ; if APP_RUN==0 initialize with ca de 'hi'  
      0095C3 CD 81 EB 95      [ 2] 4017         ldw y,APP_RUN 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      0095C7 D6 CD            [ 1] 4018         jrne 0$
      0095C9 88 8C CD         [ 2] 4019         subw x,#3*CELLL 
      0095CC 81 B8 00 1F      [ 2] 4020         ldw y,#APP_RUN 
      0095D0 CD 83            [ 2] 4021         ldw (2,x),y
      0095D2 33 CC            [ 1] 4022         clrw y 
      0095D4 94               [ 2] 4023         ldw (x),y
      0095D5 C2 CD 8C 5B      [ 2] 4024         ldw y,#HI 
      0095D9 09 20            [ 2] 4025         ldw (4,x),y 
      0095DB 6E 6F 4E         [ 4] 4026         call ee_store 
      0015EF                       4027 0$:        
                                   4028 ; update LAST with APP_LAST 
                                   4029 ; if APP_LAST > LAST else do the opposite
      0095DE 61 6D 65 81      [ 2] 4030         ldw y,APP_LAST 
      0095E2 95 BC 05         [ 2] 4031         cpw y,ULAST 
      0095E5 57 4F            [ 1] 4032         jrugt 1$ 
                                   4033 ; save LAST at APP_LAST  
      0095E7 52 44 53         [ 4] 4034         call LAST 
      0095EA CD 01 C0         [ 4] 4035         call AT  
      0095EA CD 8C 1C         [ 4] 4036         call eeprom 
      0095ED CD 84 15         [ 4] 4037         call ee_store 
      0095F0 CD 82            [ 2] 4038         jra 2$
      001606                       4039 1$: ; update LAST with APP_LAST 
      0095F2 40 CD 84         [ 2] 4040         ldw ULAST,y
      001609                       4041 2$:  
                                   4042 ; update APP_HERE if < app_space 
      0095F5 52 CD 81 EB      [ 2] 4043         ldw y,APP_HERE 
      0095F9 96 0F CD 82      [ 2] 4044         cpw y,#app_space 
      0095FD E7 CD            [ 1] 4045         jruge 3$ 
      0095FF 8B D4 CD         [ 2] 4046         subw x,#6 
      009602 95 C0 CD 87      [ 2] 4047         ldw y,#app_space 
      009606 66 CD            [ 2] 4048         ldw (4,x),y 
      009608 82 02 95 F0      [ 2] 4049         ldw y,#APP_HERE 
      00960C CD 82            [ 2] 4050         ldw (2,x),y
      00960E DD 81            [ 1] 4051         clrw y 
      009610 95               [ 2] 4052         ldw (x),y
      009611 E4 02 68         [ 4] 4053         call ee_store
      009614 69 AE 1A 80      [ 2] 4054         ldw y,#app_space
      009615                       4055 3$:
      009615 CD 8C 1C         [ 2] 4056         ldw UFCP,y         
                                   4057 ; update UCP with VAR_APP 
                                   4058 ; if VAR_APP>UCP else do the opposite 
      009618 CD 8C 5B 0F      [ 2] 4059         ldw y,VAR_HERE 
      00961C 73 74 6D         [ 2] 4060         cpw y,UCP 
      00961F 38 65            [ 1] 4061         jrugt 4$
      009621 46 6F 72         [ 4] 4062         call CPP 
      009624 74 68 20         [ 4] 4063         call AT 
      009627 76 32 2E         [ 2] 4064         subw x,#2*CELLL 
      00962A 31 CC 8C 1C      [ 2] 4065         ldw y,#VAR_HERE 
      00962E 96 12            [ 2] 4066         ldw (2,x),y 
      009630 05 27            [ 1] 4067         clrw y 
      009632 42               [ 2] 4068         ldw (x),y 
      009633 4F 4F 54         [ 4] 4069         call ee_store
      009636 20 03            [ 2] 4070         jra 6$
      00164F                       4071 4$: ; update UCP with VAR_HERE 
      009636 CD 83 94         [ 2] 4072         ldw UCP,y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



      001652                       4073 6$:      
                                   4074 .endif ; PICATOUT_MOD
      009639 40 02 96         [ 4] 4075         CALL     PRESE   ;initialize data stack and TIB
      00963C 30 04 43         [ 4] 4076         CALL     TBOOT
      00963F 4F 4C 44         [ 4] 4077         CALL     ATEXE   ;application boot
      009642 CD 13 4F         [ 4] 4078         CALL     OVERT
      009642 CD 81 B8         [ 2] 4079         JP     QUIT    ;start interpretation
                                   4080 
                           000001  4081 .if PICATOUT_MOD
                                   4082         ; keep this include at end 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



                                   4083         .include "flash.asm"
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
      009645 80 A7                   30     .word LINK 
                           001663    31     LINK=.
      009647 CD                      32     .byte 3 
      009648 81 B8 00                33     .ascii "FP!"
      001667                         34 fptr_store:
      00964B 06 CD            [ 1]   35     ldw y,x
      00964D 81 B8            [ 2]   36     ldw y,(y)
      00964F 00 16            [ 1]   37     ld a,yl 
      009651 CD 88            [ 1]   38     ld FPTR,a 
      009653 F0 90 CE         [ 2]   39     addw x,#CELLL 
      009656 40 02            [ 1]   40     ldw y,x 
      009658 26 15            [ 2]   41     ldw y,(y)
      00965A 1D 00 06         [ 2]   42     ldw PTR16,y
      00965D 90 AE 40         [ 2]   43     addw x,#CELLL 
      009660 02               [ 4]   44     ret 
                                     45 
                                     46 ;-----------------------------------
                                     47 ; return EEPROM base address 
                                     48 ; as a double 
                                     49 ;  EEPROM  ( -- ud )
                                     50 ;-----------------------------------
      009661 EF 02                   51     .word LINK 
                           00167F    52 LINK=.
      009663 90                      53     .byte 6 
      009664 5F FF 90 AE 96 15       54     .ascii "EEPROM"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



      001686                         55 eeprom: 
      00966A EF 04 CD 98      [ 2]   56     ldw y,#EEPROM_BASE
      00966E 43 00 04         [ 2]   57     subw x,#2*CELLL 
      00966F EF 02            [ 2]   58     ldw (2,x),y 
      00966F 90 CE            [ 1]   59     clrw y 
      009671 40               [ 2]   60     ldw (x),y 
      009672 00               [ 4]   61     ret
                                     62 
                                     63 ;----------------------------------
                                     64 ; fetch integer at address over 65535
                                     65 ;  F@   ( ud -- n )
                                     66 ;----------------------------------
      009673 90 B3                   67     .word LINK 
                           001695    68 LINK=.
      009675 1A                      69     .byte 2
      009676 22 0E                   70     .ascii "F@"
      001698                         71 farat:
      009678 CD 84 42         [ 4]   72     call fptr_store
      00967B CD 82 40 CD      [ 5]   73     ldf a,[FPTR]
      00967F 97 06 CD         [ 2]   74     subw x,#CELLL 
      009682 98               [ 1]   75     ld (x),a 
      009683 43 20 03 01      [ 2]   76     ldw y,#1
      009686 91 AF 00 2C      [ 1]   77     ldf a,([FPTR],y)
      009686 90 BF            [ 1]   78     ld (1,x),a
      009688 1A               [ 4]   79     ret 
                                     80 
                                     81 ;-------------------------------------
                                     82 ; fetch C at address over 65535 
                                     83 ; FC@ ( ud -- c)
                                     84 ;-------------------------------------
      009689 16 95                   85     .word LINK
                           0016B0    86     LINK=.
      009689 90                      87     .byte 3 
      00968A CE 40 04                88     .ascii "FC@" 
      0016B4                         89 farcat:
      00968D 90 A3 9B         [ 4]   90     call fptr_store 
      009690 00 24 19 1D      [ 5]   91     ldf a,[FPTR]
      009694 00 06 90         [ 2]   92     subw x,#CELLL 
      009697 AE 9B            [ 1]   93     ld (1,x),a 
      009699 00               [ 1]   94     clr (x)
      00969A EF               [ 4]   95     ret 
                                     96     
                                     97 ;----------------------------------
                                     98 ; unlock EEPROM/OPT for writing/erasing
                                     99 ; wait endlessly for FLASH_IAPSR_DUL bit.
                                    100 ;  UNLKEE   ( -- )
                                    101 ;----------------------------------
      00969B 04 90                  102     .word LINK 
                           0016C4   103 LINK=.
      00969D AE                     104     .byte 6 
      00969E 40 04 EF 02 90 5F      105     .ascii "UNLKEE"
      0016CB                        106 unlock_eeprom:
      0096A4 FF CD 98 43      [ 1]  107 	mov FLASH_CR2,#0 
      0096A8 90 AE 9B 00      [ 1]  108 	mov FLASH_NCR2,#0xFF 
      0096AC 35 AE 50 64      [ 1]  109 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



      0096AC 90 BF 18 90      [ 1]  110     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      0096B0 CE 40 06 90 B3   [ 2]  111 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      0096B5 16               [ 4]  112 	ret
                                    113 
                                    114 ;----------------------------------
                                    115 ; unlock FLASH for writing/erasing
                                    116 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                    117 ; UNLKFL  ( -- )
                                    118 ;----------------------------------
      0096B6 22 17                  119     .word LINK 
                           0016E3   120 LINK=. 
      0096B8 CD                     121     .byte 6 
      0096B9 84 23 CD 82 40 1D      122     .ascii "UNLKFL"    
      0016EA                        123 unlock_flash:
      0096BF 00 04 90 AE      [ 1]  124 	mov FLASH_CR2,#0 
      0096C3 40 06 EF 02      [ 1]  125 	mov FLASH_NCR2,#0xFF 
      0096C7 90 5F FF CD      [ 1]  126 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      0096CB 98 43 20 03      [ 1]  127 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      0096CF 72 03 50 5F FB   [ 2]  128 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      0096CF 90               [ 4]  129 	ret
                                    130 
                                    131 ;-----------------------------
                                    132 ; unlock FLASH or EEPROM 
                                    133 ; according to FPTR address 
                                    134 ;  UNLOCK ( -- )
                                    135 ;-----------------------------
      0096D0 BF 16                  136 	.word LINK 
                           001702   137 	LINK=.
      0096D2 06                     138 	.byte 6
      0096D2 CD 91 1F CD 96 36      139 	.ascii "UNLOCK"
      001709                        140 unlock:
                                    141 ; put addr[15:0] in Y, for bounds check.
      0096D8 CD 88 D9         [ 2]  142 	ldw y,PTR16   ; Y=addr15:0
                                    143 ; check addr[23:16], if <> 0 then it is extened flash memory
      0096DB CD 93            [ 1]  144 	tnz FPTR 
      0096DD CF CC            [ 1]  145 	jrne 4$
      0096DF 91 3C 96 3D      [ 2]  146     cpw y,#FLASH_BASE
      0096E3 03 46            [ 1]  147     jruge 4$
      0096E5 50 21 40 00      [ 2]  148 	cpw y,#EEPROM_BASE  
      0096E7 25 0D            [ 1]  149     jrult 9$
      0096E7 90 93 90 FE      [ 2]  150 	cpw y,#OPTION_END 
      0096EB 90 9F            [ 1]  151 	jrugt 9$
      0096ED B7 2C 1C         [ 4]  152 	call unlock_eeprom
      0096F0 00               [ 4]  153 	ret 
      0096F1 02 90 93         [ 4]  154 4$: call unlock_flash
      0096F4 90               [ 4]  155 9$: ret 
                                    156 
                                    157 ;-------------------------
                                    158 ; lock write access to 
                                    159 ; FLASH and EEPROM 
                                    160 ; LOCK ( -- )
                                    161 ;-------------------------
      0096F5 FE 90                  162 	.word LINK 
                           00172C   163 	LINK=.
      0096F7 BF                     164 	.byte 4 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



      0096F8 2D 1C 00 02            165 	.ascii "LOCK" 
      001731                        166 lock: 
      0096FC 81 96 E3 06      [ 1]  167 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      009700 45 45 50 52      [ 1]  168 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009704 4F               [ 4]  169 	ret 
                                    170 
                                    171 ;-------------------------
                                    172 ; increment FPTR 
                                    173 ; INC-FPTR ( -- )
                                    174 ;-------------------------
      009705 4D 2C                  175 	.word LINK 
                           00173C   176 	LINK=. 
      009706 08                     177 	.byte 8 
      009706 90 AE 40 00 1D 00 04   178 	.ascii "INC-FPTR" 
             EF
      001745                        179 inc_fptr:
      00970E 02 90            [ 1]  180 	inc PTR8 
      009710 5F FF            [ 1]  181 	jrne 1$
      009712 81 96 FF         [ 2]  182 	ldw y,FPTR 
      009715 02 46            [ 2]  183 	incw y 
      009717 40 BF 2C         [ 2]  184 	ldw FPTR,y 
      009718 81               [ 4]  185 1$: ret 
                                    186 
                                    187 
                                    188 ;----------------------------
                                    189 ; write a byte at address pointed 
                                    190 ; by FPTR and increment FPTR.
                                    191 ; Expect pointer already initialized 
                                    192 ; and memory unlocked 
                                    193 ; WR-BYTE ( c -- )
                                    194 ;----------------------------
                                    195 
      009718 CD 96                  196 	.word LINK 
                           001754   197 	LINK=. 
      00971A E7                     198 	.byte 7 
      00971B 92 BC 00 2C 1D 00 02   199 	.ascii "WR-BYTE" 
                                    200 
      00175C                        201 write_byte:
      009722 F7 90            [ 1]  202 	ldw y,x 
      009724 AE 00            [ 2]  203 	ldw y,(y)
      009726 01 91 AF         [ 2]  204 	addw x,#CELLL 
      009729 00 2C            [ 1]  205 	ld a,yl
      00972B E7 01 81 97      [ 4]  206 	ldf [FPTR],a
      00972F 15 03 46 43 40   [ 2]  207 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009734 20 D5            [ 2]  208 	jra inc_fptr 
                                    209 
                                    210 
                                    211 
                                    212 ;---------------------------------------
                                    213 ; write a byte to FLASH or EEPROM/OPTION  
                                    214 ; EEC!  (c ud -- )
                                    215 ;---------------------------------------
      009734 CD 96                  216     .word LINK 
                           001772   217 	LINK=.
      009736 E7                     218     .byte 4 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



      009737 92 BC 00 2C            219     .ascii "EEC!"
                                    220 	; local variables 
                           000001   221 	BTW = 1   ; byte to write offset on stack
                           000002   222     OPT = 2 
                           000002   223 	VSIZE = 2
      001777                        224 ee_cstore:
      00973B 1D 00            [ 2]  225 	sub sp,#VSIZE
      00973D 02 E7 01         [ 4]  226     call fptr_store
      009740 7F 81            [ 1]  227 	ld a,(1,x)
      009742 97               [ 1]  228 	cpl a 
      009743 30 06            [ 1]  229 	ld (BTW,sp),a ; byte to write 
      009745 55 4E            [ 1]  230 	clr (OPT,sp)  ; OPTION flag
      009747 4C 4B 45         [ 4]  231 	call unlock 
                                    232 	; check if option
      00974A 45 2C            [ 1]  233 	tnz FPTR 
      00974B 26 19            [ 1]  234 	jrne 2$
      00974B 35 00 50         [ 2]  235 	ldw y,PTR16 
      00974E 5B 35 FF 50      [ 2]  236 	cpw y,#OPTION_BASE
      009752 5C 35            [ 1]  237 	jrmi 2$
      009754 AE 50 64 35      [ 2]  238 	cpw y,#OPTION_END+1
      009758 56 50            [ 1]  239 	jrpl 2$
      00975A 64 72            [ 1]  240 	cpl (OPT,sp)
                                    241 	; OPTION WRITE require this unlock 
      00975C 07 50 5F FB      [ 1]  242     bset FLASH_CR2,#FLASH_CR2_OPT
      009760 81 97 44 06      [ 1]  243     bres FLASH_NCR2,#FLASH_CR2_OPT 
      0017A3                        244 2$: 
      009764 55 4E 4C         [ 4]  245 	call write_byte 	
      009767 4B 46            [ 1]  246 	tnz (OPT,sp)
      009769 4C 0D            [ 1]  247 	jreq 3$ 
      00976A 7B 01            [ 1]  248     ld a,(BTW,sp)
      00976A 35 00            [ 1]  249     clrw y
      00976C 50 5B            [ 1]  250 	ld yl,a 
      00976E 35 FF 50         [ 2]  251 	subw x,#CELLL 
      009771 5C               [ 2]  252 	ldw (x),y 
      009772 35 56 50         [ 4]  253 	call write_byte
      0017B7                        254 3$: 
      009775 62 35 AE         [ 4]  255 	call lock 
      009778 50 62            [ 2]  256 	addw sp,#VSIZE 
      00977A 72               [ 4]  257     ret
                                    258 
                                    259 ;------------------------------
                                    260 ; write integer in FLASH|EEPROM
                                    261 ; EE! ( n ud -- )
                                    262 ;------------------------------
      00977B 03 50                  263 	.word LINK 
                           0017BF   264 	LINK=.
      00977D 5F                     265 	.byte 3 
      00977E FB 81 97               266 	.ascii "EE!"
      0017C3                        267 ee_store:
      009781 63 06 55         [ 4]  268 	call fptr_store 
      009784 4E 4C 4F         [ 4]  269 	call unlock 
      009787 43 4B            [ 1]  270 	ldw y,x 
      009789 90 FE            [ 2]  271 	ldw y,(y)
      009789 90 BE            [ 2]  272 	pushw y 
      00978B 2D 3D            [ 1]  273 	swapw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



      00978D 2C               [ 2]  274 	ldw (x),y 
      00978E 26 16 90         [ 4]  275 	call write_byte 
      009791 A3 80            [ 2]  276 	popw y 
      009793 00 24 10         [ 2]  277 	subw x,#CELLL
      009796 90               [ 2]  278 	ldw (x),y 
      009797 A3 40 00         [ 4]  279 	call write_byte
      00979A 25 0D 90         [ 2]  280 	jp lock 
                                    281 
                                    282 
                                    283 ;----------------------------
                                    284 ; Erase flash memory row 
                                    285 ; stm8s208 as 128 bytes rows
                                    286 ; ROW-ERASE ( ud -- )
                                    287 ;----------------------------
      00979D A3 48                  288 	.word LINK 
                           0017E3   289 	LINK=. 
      00979F 7F                     290 	.byte 9 
      0097A0 22 07 CD 97 4B 81 CD   291 	.ascii "ROW-ERASE" 
             97 6A
      0017ED                        292 row_erase:
      0097A9 81 97 82         [ 4]  293 	call fptr_store
                                    294 ;code must be execute from RAM 
                                    295 ;copy routine to PAD 
      0097AC 04 4C 4F         [ 2]  296 	subw x,#CELLL 
      0097AF 43 4B 18 3A      [ 2]  297 	ldw y,#row_erase_proc
      0097B1 FF               [ 2]  298 	ldw (x),y 
      0097B1 72 13 50         [ 4]  299 	call PAD 
      0097B4 5F 72 17 50      [ 2]  300 	ldw y,#row_erase_proc_end 
      0097B8 5F 81 97 AC      [ 2]  301 	subw y,#row_erase_proc
      0097BC 08 49 4E         [ 2]  302 	subw x,#CELLL 
      0097BF 43               [ 2]  303 	ldw (x),y 
      0097C0 2D 46 50         [ 4]  304 	call CMOVE 
      00180A                        305 block_erase:
      0097C3 54 52 2D         [ 2]  306 	ldw y,FPTR+1
      0097C5 90 A3 1A 80      [ 2]  307 	cpw y,#app_space 
      0097C5 3C 2E            [ 1]  308 	jrpl erase_flash 
                                    309 ; erase eeprom block
      0097C7 26 08 90 BE      [ 2]  310 	cpw y,#EEPROM_BASE 
      0097CB 2C 90            [ 1]  311 	jruge 1$
      0097CD 5C               [ 4]  312 	ret ; bad address 
      0097CE 90 BF 2C 81      [ 2]  313 1$: cpw y,#EEPROM_END 
      0097D2 97 BC            [ 2]  314 	jrule 2$ 
      0097D4 07               [ 4]  315 	ret ; bad address 
      001821                        316 2$:	
      0097D5 57 52 2D         [ 4]  317 	call unlock_eeprom 
      0097D8 42 59            [ 2]  318 	jra proceed_erase
                                    319 ; erase flash block:
      001826                        320 erase_flash:
      0097DA 54 45 EA         [ 4]  321 	call unlock_flash 
      0097DC                        322 proceed_erase:
      0097DC 90 93 90         [ 4]  323 	call PAD 
      0097DF FE 1C            [ 1]  324 	ldw y,x
      0097E1 00 02            [ 2]  325 	ldw y,(y)
      0097E3 90 9F 92         [ 2]  326 	addw x,#CELLL  
      0097E6 BD 00            [ 4]  327 	call (y) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



      0097E8 2C 72 05 50      [ 1]  328 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      0097EC 5F               [ 4]  329 	ret 
                                    330 
                                    331 ; this routine is to be copied to PAD 
      00183A                        332 row_erase_proc:
      0097ED FB 20 D5 97      [ 1]  333 	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
      0097F1 D4 04 45 45      [ 1]  334 	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
      0097F5 43               [ 1]  335 	clr a 
      0097F6 21 5F            [ 1]  336 	clrw y 
      0097F7 91 A7 00 2C      [ 1]  337 	ldf ([FPTR],y),a
      0097F7 52 02            [ 2]  338     incw y
      0097F9 CD 96 E7 E6      [ 1]  339 	ldf ([FPTR],y),a
      0097FD 01 43            [ 2]  340     incw y
      0097FF 6B 01 0F 02      [ 1]  341 	ldf ([FPTR],y),a
      009803 CD 97            [ 2]  342     incw y
      009805 89 3D 2C 26      [ 1]  343 	ldf ([FPTR],y),a
      009809 19 90 BE 2D 90   [ 2]  344 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      00980E A3               [ 4]  345 	ret
      001861                        346 row_erase_proc_end:
                                    347 
                                    348 
                                    349 ;-----------------------------------
                                    350 ; block programming must be 
                                    351 ; executed from RAM 
                                    352 ; initial contidions: 
                                    353 ; 		memory unlocked
                                    354 ;       FPTR initialized 
                                    355 ; input: 
                                    356 ;    x   buffer address 
                                    357 ;-----------------------------------
                           000001   358 	BCNT=1 
      001861                        359 copy_buffer:
      00980F 48 00            [ 1]  360 	push #BLOCK_SIZE  
                                    361 ;enable block programming 
      009811 2B 10 90 A3      [ 1]  362 	bset FLASH_CR2,#FLASH_CR2_PRG 
      009815 48 80 2A 0A      [ 1]  363 	bres FLASH_NCR2,#FLASH_CR2_PRG
      009819 03 02            [ 1]  364 	clrw y
      00981B 72               [ 1]  365 1$:	ld a,(x)
      00981C 1E 50 5B 72      [ 1]  366 	ldf ([FPTR],y),a
      009820 1F               [ 2]  367 	incw x 
      009821 50 5C            [ 2]  368 	incw y 
      009823 0A 01            [ 1]  369 	dec (BCNT,sp)
      009823 CD 97            [ 1]  370 	jrne 1$
                                    371 ; wait EOP bit 
      009825 DC 0D 02 27 0D   [ 2]  372 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. 
      00982A 7B               [ 1]  373 	pop a ; remove BCNT from stack 
      00982B 01               [ 4]  374 	ret 
      001880                        375 copy_buffer_end:
                                    376 
                                    377 ;-------------------------
                                    378 ; move program_row to RAM 
                                    379 ; in TIB 
                                    380 ;------------------------
      001880                        381 copy_prog_to_ram:
      00982C 90 5F 90         [ 2]  382 	subw x,#6
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



      00982F 97 1D 00 02      [ 2]  383 	ldw y,#copy_buffer 
      009833 FF CD            [ 2]  384 	ldw (4,x),y 
      009835 97 DC 17 00      [ 2]  385 	ldw y,#TIBBASE
      009837 EF 02            [ 2]  386 	ldw (2,x),y 
      009837 CD 97 B1 5B      [ 2]  387 	ldw y,#copy_buffer_end 
      00983B 02 81 97 F2      [ 2]  388 	subw y,#copy_buffer  
      00983F 03               [ 2]  389 	ldw (x),y 
      009840 45 45 21         [ 4]  390 	call CMOVE 
      009843 81               [ 4]  391 	ret 
                                    392 
                                    393 
                                    394 ;-----------------------------
                                    395 ; write a row in FLASH/EEPROM 
                                    396 ; WR-ROW ( a ud -- )
                                    397 ; a -> address 128 byte buffer to write 
                                    398 ; ud ->  row address in FLASH|EEPROM 
                                    399 ;-----------------------------
      009843 CD 96                  400 	.word LINK 
                           00189E   401 	LINK=.
      009845 E7                     402 	.byte 6 
      009846 CD 97 89 90 93 90      403 	.ascii "WR-ROW"
      0018A5                        404 write_row:
      00984C FE 90 89         [ 4]  405 	call fptr_store
                                    406 ; align to FLASH block 
      00984F 90 5E            [ 1]  407 	ld a,#0x80 
      009851 FF CD            [ 1]  408 	and a,PTR8 
      009853 97 DC            [ 1]  409 	ld PTR8,a  
      009855 90 85 1D         [ 4]  410 	call copy_prog_to_ram
      009858 00 02 FF         [ 4]  411 	call unlock
      00985B CD 97            [ 1]  412 	ldw y,x 
      00985D DC CC            [ 2]  413 	ldw y,(y)
      00985F 97 B1 98         [ 2]  414 	addw x,#CELLL 
      009862 3F               [ 2]  415 	pushw x 
      009863 09               [ 1]  416 	ldw x,y ; buffer address in x 
      009864 52 4F 57         [ 4]  417 	call TIBBASE
      009867 2D 45 52         [ 4]  418 	call lock
      00986A 41               [ 2]  419 	popw x 
      00986B 53               [ 4]  420 	ret 
                                    421 
                                    422 ;-------------------------------------
                                    423 ; change value of OPTION register 
                                    424 ; SET-OPT (c n -- ) 
                                    425 ; c new value.
                                    426 ; n OPT  number {1..7}
                                    427 ;--------------------------------------
      00986C 45 9E                  428 		.word LINK 
                           0018C7   429 		LINK=.
      00986D 07                     430 		.byte 7 
      00986D CD 96 E7 1D 00 02 90   431 		.ascii "SET-OPT" 
      0018CF                        432 set_option: 
      009874 AE 98            [ 1]  433 		ldw y,x 
      009876 BA FF            [ 2]  434 		ldw y,(y)
      009878 CD 88            [ 1]  435 		jreq 1$
      00987A B4 90 AE 98      [ 2]  436 		cpw y,#7 
      00987E E1 72            [ 2]  437 		jrule 2$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



                                    438 ; invalid OPTION number 		
      009880 A2 98 BA         [ 2]  439 1$:		addw x,#2*CELLL
      009883 1D               [ 4]  440 		ret
      009884 00 02            [ 2]  441 2$:		sllw y 
      009886 FF CD 88 F0      [ 2]  442 		addw y,#OPTION_BASE-1
      00988A FF               [ 2]  443 		ldw (x),y 
      00988A 90 BE 2D         [ 2]  444 		subw x,#CELLL 
      00988D 90 A3            [ 1]  445 		clrw y 
      00988F 9B               [ 2]  446 		ldw (x),y 
      009890 00 2A 13         [ 4]  447 		call ee_cstore
      009893 90               [ 4]  448 		ret 
                                    449 
                                    450 
                                    451 
                                    452 ;--------------------------------------
                                    453 ; reset system to its original state 
                                    454 ; before any user modification
                                    455 ; PRISTINE ( -- )
                                    456 ;-------------------------------------
      009894 A3 40                  457 	.word LINK  
                           0018F2   458 	LINK=.
      009896 00                     459 	.byte 8 
      009897 24 01 81 90 A3 47 FF   460 	.ascii "PRISTINE"
             23
      0018FB                        461 pristine:
                                    462 ;;; erase EEPROM
      00989F 01 81 86         [ 4]  463 	call eeprom 
      0098A1 CD 04 0E         [ 4]  464 1$:	call DDUP 
      0098A1 CD 97 4B         [ 4]  465 	call row_erase
      0098A4 20 03            [ 1]  466 	ldw y,x 
      0098A6 90 EE 02         [ 2]  467 	ldw y,(2,y)
      0098A6 CD 97 6A 80      [ 2]  468 	addw y,#BLOCK_SIZE
      0098A9 EF 02            [ 2]  469 	ldw (2,x),y
      0098A9 CD 88 B4 90      [ 2]  470 	cpw y,#OPTION_BASE 
      0098AD 93 90            [ 1]  471 	jrult 1$
                                    472 ;;; reset OPTION to default values
      0098AF FE 1C 00 02      [ 2]  473 	ldw y,#1 ; OPT1 
      0098B3 90               [ 2]  474 2$:	ldw (x),y   
      0098B4 FD 72            [ 1]  475 	clrw y 
      0098B6 17 50            [ 2]  476 	ldw (2,x),y  ; ( 0 1 -- ) 
      0098B8 5F 81 0E         [ 4]  477 	call DDUP    ; ( 0 1 0 1 -- )  
      0098BA CD 18 CF         [ 4]  478 	call set_option
      0098BA 35 20            [ 1]  479 	ldw y,x 
      0098BC 50 5B            [ 2]  480 	ldw y,(y)
      0098BE 35 DF            [ 2]  481 	incw y  ; next OPTION 
      0098C0 50 5C 4F 90      [ 2]  482 	cpw y,#8 
      0098C4 5F 91            [ 1]  483 	jrult 2$
                                    484 ;;; erase first row of app_space 	
      0098C6 A7 00 2C 90      [ 2]  485 	ldw y,#app_space
      0098CA 5C 91            [ 2]  486 	ldw (2,x),y  
      0098CC A7 00            [ 1]  487 	clrw y 
      0098CE 2C               [ 2]  488 	ldw (x),y ; ( app_space 0 -- )
      0098CF 90 5C 91         [ 4]  489 	call row_erase 
                                    490 ; reset interrupt vectors 
      0098D2 A7 00 2C         [ 2]  491 	subw x,#CELLL 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      0098D5 90 5C            [ 1]  492 	clrw y  
      0098D7 91               [ 2]  493 4$:	ldw (x),y  ; ( n -- ) int# 
      0098D8 A7 00 2C         [ 4]  494 	call DUPP  
      0098DB 72 05 50         [ 4]  495 	call reset_vector
      0098DE 5F FB            [ 1]  496 	ldw y,x 
      0098E0 81 FE            [ 2]  497 	ldw y,(y)
      0098E1 90 5C            [ 2]  498 	incw y   ; next vector 
      0098E1 90 A3 00 19      [ 2]  499 	cpw y,#25 
      0098E1 4B 80            [ 1]  500 	jrult 4$
      0098E3 72 10 50         [ 2]  501 	jp NonHandledInterrupt ; reset MCU
                                    502 
                                    503 ;------------------------------
                                    504 ; reset an interrupt vector 
                                    505 ; to its initial value 
                                    506 ; i.e. NonHandledInterrupt
                                    507 ; RST-IVEC ( n -- )
                                    508 ;-----------------------------
      0098E6 5B 72                  509 	.word LINK 
                           001959   510 	LINK=. 
      0098E8 11                     511 	.byte 8 
      0098E9 50 5C 90 5F F6 91 A7   512 	.ascii "RST-IVEC"
             00
      001962                        513 reset_vector:
      0098F1 2C 5C            [ 1]  514 	ldw y,x
      0098F3 90 5C 0A         [ 2]  515 	addw x,#CELLL 
      0098F6 01 26            [ 2]  516 	ldw y,(y)
      0098F8 F4 72 05 50      [ 2]  517 	cpw y,#23 
      0098FC 5F FB            [ 1]  518 	jreq 9$
      0098FE 84 81 00 18      [ 2]  519 	cpw y,#24 ; last vector for stm8s208 
      009900 22 34            [ 1]  520 	jrugt 9$  
      009900 90 58            [ 2]  521 	sllw y 
      009900 1D 00            [ 2]  522 	sllw y 
      009902 06 90 AE 98      [ 2]  523 	addw y,#0x8008 ; irq0 address 
      009906 E1 EF 04         [ 2]  524 	ldw YTEMP,y
      009909 90 AE 17         [ 2]  525 	subw x,#3*CELLL 
      00990C 00 EF            [ 2]  526 	ldw (2,x),y 
      00990E 02 90            [ 1]  527 	clrw y
      009910 AE               [ 2]  528 	ldw (x),y 
      009911 99 00            [ 1]  529 	ld a,#0x82 
      009913 72 A2            [ 1]  530 	ld yh,a
      009915 98 E1            [ 2]  531 	ldw (4,x),y
      009917 FF CD 88         [ 4]  532 	call ee_store
      00991A F0 81 98         [ 2]  533 	subw x,#3*CELLL
      00991D 63 06            [ 1]  534 	clrw y 
      00991F 57               [ 2]  535 	ldw (x),y 
      009920 52 2D 52 4F      [ 2]  536 	ldw y,#NonHandledInterrupt
      009924 57 04            [ 2]  537 	ldw (4,x),y 
      009925 90 BE 1E         [ 2]  538 	ldw y,YTEMP  
      009925 CD 96 E7 A6      [ 2]  539 	addw y,#2
      009929 80 B4            [ 2]  540 	ldw (2,x),y 
      00992B 2E B7 2E         [ 4]  541 	call ee_store
      00992E CD               [ 4]  542 9$:	ret 
                                    543 
                                    544 
                                    545 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



                                    546 ;------------------------------
                                    547 ; set interrupt vector 
                                    548 ; SET-IVEC ( ud n -- )
                                    549 ;  ud Handler address
                                    550 ;  n  vector # 0 .. 29 
                                    551 ;-----------------------------
      00992F 99 00                  552 	.word LINK
                           0019AC   553 	LINK=.
      009931 CD                     554 	.byte 8 
      009932 97 89 90 93 90 FE 1C   555 	.ascii "SET-IVEC" 
             00
      0019B5                        556 set_vector:
      00993A 02 89            [ 1]  557     ldw y,x 
      00993C 93 CD 17         [ 2]  558 	addw x,#CELLL 
      00993F 00 CD            [ 2]  559 	ldw y,(y) ; vector #
      009941 97 B1 85 81      [ 2]  560 	cpw y,#24 ; last vector for stm8s208  
      009945 99 1E            [ 2]  561 	jrule 2$
      009947 07 53 45         [ 2]  562 	addw x,#2*CELLL 
      00994A 54               [ 4]  563 	ret
      00994B 2D 4F            [ 2]  564 2$:	sllw y 
      00994D 50 54            [ 2]  565 	sllw y 
      00994F 72 A9 80 08      [ 2]  566 	addw y,#0X8008 ; IRQ0 vector address 
      00994F 90 93 90         [ 2]  567 	ldw YTEMP,y ; vector address 
      009952 FE 27            [ 1]  568 	ld a,#0x82 
      009954 06 90            [ 1]  569 	ld yh,a 
      009956 A3 00            [ 1]  570 	ld a,(1,x) ; isr address bits 23..16 
      009958 07 23            [ 1]  571 	ld yl,a 
                                    572 ;  write 0x82 + most significant byte of int address	
      00995A 04 1C 00         [ 2]  573 	subw x,#3*CELLL 
      00995D 04 81            [ 2]  574 	ldw (4,x),y 
      00995F 90 58 72         [ 2]  575 	ldw y,YTEMP
      009962 A9 47            [ 2]  576 	ldw (2,x),y ; vector address 
      009964 FF FF            [ 1]  577 	clrw y 
      009966 1D               [ 2]  578 	ldw (x),y   ; as a double 
      009967 00 02 90         [ 4]  579 	call ee_store 
      00996A 5F FF            [ 1]  580 	ldw y,x 
      00996C CD 97 F7         [ 2]  581 	ldw y,(2,y) ; bits 15..0 int vector 
      00996F 81 99 47         [ 2]  582 	subw x,#3*CELLL 
      009972 08 50            [ 2]  583 	ldw (4,x),y 
      009974 52 49 53         [ 2]  584 	ldw y,YTEMP 
      009977 54 49 4E 45      [ 2]  585 	addw y,#2 
      00997B EF 02            [ 2]  586 	ldw (2,x),y 
      00997B CD 97            [ 1]  587 	clrw y 
      00997D 06               [ 2]  588 	ldw (x),y 
      00997E CD 84 8E         [ 4]  589 	call ee_store 
      009981 CD               [ 4]  590 9$: ret 
                                    591 
                                    592 
                                    593 ;------------------------
                                    594 ; Compile word to flash
                                    595 ; EE, (w -- )
                                    596 ;-----------------------
      009982 98 6D                  597 	.word LINK
                           001A05   598 	LINK=.
      009984 90                     599 	.byte 3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



      009985 93 90 EE               600 	.ascii "EE,"
      001A09                        601 ee_comma:
      009988 02 72 A9         [ 2]  602 	subw x,#2*CELLL 
      00998B 00 80 EF         [ 2]  603 	ldw y,UFCP
      00998E 02 90            [ 2]  604 	pushw y 
      009990 A3 48            [ 2]  605 	ldw (2,x),y 
      009992 00 25            [ 1]  606 	clrw y 
      009994 E9               [ 2]  607 	ldw (x),y
      009995 90 AE 00         [ 4]  608 	call ee_store
      009998 01 FF            [ 2]  609 	popw y 
      00999A 90 5F EF 02      [ 2]  610 	addw y,#2
      00999E CD 84 8E         [ 2]  611 	ldw UFCP,y
      0099A1 CD               [ 4]  612 	ret 
                                    613 
                                    614 ;-------------------------
                                    615 ; Compile byte to flash 
                                    616 ; EEC, ( c -- )	
                                    617 ;-------------------------
      0099A2 99 4F                  618 	.word LINK 
                           001A25   619 	LINK=.
      0099A4 90                     620 	.byte 4 
      0099A5 93 90 FE 90            621 	.ascii "EEC,"
      001A2A                        622 ee_ccomma:
      0099A9 5C 90 A3         [ 2]  623 	subw x,#2*CELLL 
      0099AC 00 08 25         [ 2]  624 	ldw y,UFCP
      0099AF E9 90            [ 2]  625 	pushw y 
      0099B1 AE 9B            [ 2]  626 	ldw (2,x),y 
      0099B3 00 EF            [ 1]  627 	clrw y 
      0099B5 02               [ 2]  628 	ldw (x),y
      0099B6 90 5F FF         [ 4]  629 	call ee_cstore
      0099B9 CD 98            [ 2]  630 	popw y 
      0099BB 6D 1D            [ 2]  631 	incw y 
      0099BD 00 02 90         [ 2]  632 	ldw UFCP,y
      0099C0 5F               [ 4]  633 	ret 
                                    634 
                                    635 
                                    636 ;--------------------------
                                    637 ; copy FLASH block to ROWBUF
                                    638 ; ROW2BUF ( ud -- )
                                    639 ;--------------------------
      0099C1 FF CD                  640 	.word LINK 
                           001A44   641 	LINK=.
      0099C3 82                     642 	.byte 7 
      0099C4 E7 CD 99 E2 90 93 90   643 	.ascii "ROW2BUF"
      001A4C                        644 ROW2BUF: 
      0099CB FE 90 5C         [ 4]  645 	call fptr_store 
      0099CE 90 A3            [ 1]  646 	ld a,#BLOCK_SIZE
      0099D0 00               [ 1]  647 	push a 
      0099D1 19 25            [ 1]  648 	and a,PTR8 ; block align 
      0099D3 ED CC            [ 1]  649 	ld PTR8,a
      0099D5 80 80 99 72      [ 2]  650 	ldw y,#ROWBUFF 
      0099D9 08 52 53 54      [ 5]  651 1$: ldf a,[FPTR]
      0099DD 2D 49            [ 1]  652 	ld (y),a
      0099DF 56 45 43         [ 4]  653 	call inc_fptr
      0099E2 90 5C            [ 2]  654 	incw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



      0099E2 90 93            [ 1]  655 	dec (1,sp)
      0099E4 1C 00            [ 1]  656 	jrne 1$ 
      0099E6 02               [ 1]  657 	pop a 
      0099E7 90               [ 4]  658 	ret 
                                    659 
                                    660 
                                    661 ;--------------------------
                                    662 ; move now colon definition to FLASH 
                                    663 ; preserving bytes already used 
                                    664 ; in the current block. 
                                    665 ; ud+c must not exceed block boundary 
                                    666 ; FMOVE ( a ud c -- )
                                    667 ;	a   RAM buffer address 
                                    668 ;   ud  FLASH address 
                                    669 ;   c   byte count {1..128}
                                    670 ;--------------------------
      0099E8 FE 90                  671 	.word LINK 
                           001A6D   672 	LINK=.
      0099EA A3                     673 	.byte 5 
      0099EB 00 17 27 3A 90         674 	.ascii "FMOVE" 
      001A73                        675 FMOVE:
                           000000   676 .if 0 ; to be done 
                                    677 ; bound c to 128 bytes 
                                    678 	subw x,#CELLL 
                                    679 	ldw y,#BLOCK_SIZE
                                    680 	ldw (x),y 
                                    681 	call MIN
                                    682 	ldw y,x 
                                    683 	ldw y,(x)
                                    684 	ldw XTEMP,y ; save c 
                                    685 	addw x,#CELLL 
                                    686 ; move FLASH block in ROWBUFF 
                                    687 	call DDUP 
                                    688 	call BLKCPY
                                    689 ; how many free in this block ?
                                    690 ; use MIN(c,bytes_free)
                                    691 	ldw y,x 
                                    692 	ld a,(3,y) ; ud least byte  
                                    693 	jreq 2$
                                    694 	cp a,#BLOCK_SIZE
                                    695 	jreq 2$ 
                                    696 	add a,#BLOCK_SIZE
                                    697 	and a,#0x80
                                    698 	subc a,(3,y) ; bytes free 
                                    699 	subw x,#2*CELLL 
                                    700 	clrw y 
                                    701 	ldw (2,x),y 
                                    702 	ldw y,XTEMP 
                                    703 	ldw (x),y
                                    704 	call MIN 
                                    705 2$: ; ud is block aligned, all bytes free  
                                    706 ; now copy bytes from a to ROWBUFF+n 
                                    707 	ldw y,x 
                                    708 	ldw y,(2,y)
                                    709 	andw y,#0x7f 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



                                    710 	addw y,#ROWBUFF
                                    711 	ldw YTEMP,y 
                                    712 	ldw y,x 
                                    713 	ldw y,()
                           000001   714 .else 
      0099F0 A3               [ 4]  715 	ret 
                                    716 .endif 
                                    717 
                                    718 
                                    719 
                                    720 ; application code begin here
      001A80                        721 	.bndry 128 ; align on flash block  
      001A80                        722 app_space: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



                                   4084 .endif ; PICATOUT_MOD
                                   4085 
                                   4086 ;===============================================================
                                   4087 
                           001A6D  4088 LASTN =	LINK   ;last name defined
                                   4089 
                                   4090 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   6 AB1        0004A4 R   |   6 ABOR1      000FBF R
  6 ABOR2      000FD6 R   |   6 ABORQ      000FB7 R   |   6 ABORT      000FA8 R
  6 ABRTQ      001277 R   |   6 ABSS       00049B R   |   6 ACCEP      000F3E R
  6 ACCP1      000F47 R   |   6 ACCP2      000F6D R   |   6 ACCP3      000F70 R
  6 ACCP4      000F72 R   |     ADC_CR1 =  005401     |     ADC_CR1_=  000000 
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
    AFR6_I2C=  000006     |     AFR7_BEE=  000007     |   6 AFT        001262 R
  6 AGAIN      0011C1 R   |   6 AHEAD      001218 R   |   6 ALLOT      0010E7 R
  6 ANDD       0002B3 R   |     APP_HERE=  004004     |     APP_LAST=  004000 
    APP_RUN =  004002     |   6 AT         0001C0 R   |   6 ATEXE      000859 R
    AWU_APR =  0050F1     |     AWU_CSR =  0050F0     |     AWU_TBR =  0050F2 
    B0_MASK =  000001     |     B115200 =  000006     |     B19200  =  000003 
    B1_MASK =  000002     |     B230400 =  000007     |     B2400   =  000000 
    B2_MASK =  000004     |     B38400  =  000004     |     B3_MASK =  000008 
    B460800 =  000008     |     B4800   =  000001     |     B4_MASK =  000010 
    B57600  =  000005     |     B5_MASK =  000020     |     B6_MASK =  000040 
    B7_MASK =  000080     |     B921600 =  000009     |     B9600   =  000002 
  6 BACK1      000EE6 R   |   6 BASE       000324 R   |     BASEE   =  00000A 
    BCNT    =  000001     |   6 BCOMP      001126 R   |   6 BDIGS      000941 R
    BEEP_BIT=  000004     |     BEEP_CSR=  0050F3     |     BEEP_MAS=  000010 
    BEEP_POR=  00000F     |   6 BEGIN      0011A5 R   |     BIT0    =  000000 
    BIT1    =  000001     |     BIT2    =  000002     |     BIT3    =  000003 
    BIT4    =  000004     |     BIT5    =  000005     |     BIT6    =  000006 
    BIT7    =  000007     |   6 BKSLA      000D7E R   |   6 BKSP       000EB6 R
    BKSPP   =  000008     |   6 BLANK      000729 R   |     BLOCK_SI=  000080 
    BOOT_ROM=  006000     |     BOOT_ROM=  007FFF     |   6 BRAN       000182 R
    BTW     =  000001     |     CALLL   =  0000CD     |     CAN_DGR =  005426 
    CAN_FPSR=  005427     |     CAN_IER =  005425     |     CAN_MCR =  005420 
    CAN_MSR =  005421     |     CAN_P0  =  005428     |     CAN_P1  =  005429 
    CAN_P2  =  00542A     |     CAN_P3  =  00542B     |     CAN_P4  =  00542C 
    CAN_P5  =  00542D     |     CAN_P6  =  00542E     |     CAN_P7  =  00542F 
    CAN_P8  =  005430     |     CAN_P9  =  005431     |     CAN_PA  =  005432 
    CAN_PB  =  005433     |     CAN_PC  =  005434     |     CAN_PD  =  005435 
    CAN_PE  =  005436     |     CAN_PF  =  005437     |     CAN_RFR =  005424 
    CAN_TPR =  005423     |     CAN_TSR =  005422     |     CARRY   =  000022 
  6 CAT        0001DE R   |   6 CCOMMA     001108 R   |     CC_C    =  000000 
    CC_H    =  000004     |     CC_I0   =  000003     |     CC_I1   =  000005 
    CC_N    =  000002     |     CC_V    =  000007     |     CC_Z    =  000001 
    CELLL   =  000002     |   6 CELLM      0006E6 R   |   6 CELLP      0006D7 R
  6 CELLS      0006F5 R   |     CFG_GCR =  007F60     |     CFG_GCR_=  000001 
    CFG_GCR_=  000000     |   6 CHAR1      000B6E R   |   6 CHAR2      000B71 R
    CLKOPT  =  004807     |     CLKOPT_C=  000002     |     CLKOPT_E=  000003 
    CLKOPT_P=  000000     |     CLKOPT_P=  000001     |     CLK_CCOR=  0050C9 
    CLK_CKDI=  0050C6     |     CLK_CKDI=  000000     |     CLK_CKDI=  000001 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
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
  6 CMOV1      000878 R   |   6 CMOV2      000890 R   |   6 CMOVE      000870 R
    CNTDWN  =  00002A     |   6 CNTXT      000395 R   |   6 COLD       0015C2 R
  6 COLD1      0015C2 R   |   6 COLON      001391 R   |   6 COMMA      0010F1 R
  6 COMPI      001136 R   |     COMPO   =  000040     |     CONVERT_=  000001 
  6 COUNT      00080C R   |   6 CPP        0003A3 R   |     CPU_A   =  007F00 
    CPU_CCR =  007F0A     |     CPU_PCE =  007F01     |     CPU_PCH =  007F02 
    CPU_PCL =  007F03     |     CPU_SPH =  007F08     |     CPU_SPL =  007F09 
    CPU_XH  =  007F04     |     CPU_XL  =  007F05     |     CPU_YH  =  007F06 
    CPU_YL  =  007F07     |   6 CR         000B9C R   |   6 CREAT      0013C9 R
    CRR     =  00000D     |   6 CSTOR      0001CD R   |     CTOP    =  000080 
  6 DAT        0007EC R   |     DATSTK  =  001670     |   6 DDROP      000403 R
  6 DDUP       00040E R   |     DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF 
  6 DECIM      0009F1 R   |   6 DEPTH      000779 R   |     DEVID_BA=  0048CD 
    DEVID_EN=  0048D8     |     DEVID_LO=  0048D2     |     DEVID_LO=  0048D3 
    DEVID_LO=  0048D4     |     DEVID_LO=  0048D5     |     DEVID_LO=  0048D6 
    DEVID_LO=  0048D7     |     DEVID_LO=  0048D8     |     DEVID_WA=  0048D1 
    DEVID_XH=  0048CE     |     DEVID_XL=  0048CD     |     DEVID_YH=  0048D0 
    DEVID_YL=  0048CF     |   6 DGTQ1      000A36 R   |   6 DIG        00096A R
  6 DIGIT      000905 R   |   6 DIGS       00097B R   |   6 DIGS1      00097B R
  6 DIGS2      000988 R   |   6 DIGTQ      000A05 R   |     DM_BK1RE=  007F90 
    DM_BK1RH=  007F91     |     DM_BK1RL=  007F92     |     DM_BK2RE=  007F93 
    DM_BK2RH=  007F94     |     DM_BK2RL=  007F95     |     DM_CR1  =  007F96 
    DM_CR2  =  007F97     |     DM_CSR1 =  007F98     |     DM_CSR2 =  007F99 
    DM_ENFCT=  007F9A     |   6 DN1        00047B R   |   6 DNEGA      000460 R
  6 DOCONST    001431 R   |   6 DOLIT      000138 R   |   6 DONXT      00014C R
  6 DOSTR      000BB2 R   |   6 DOT        000C37 R   |   6 DOT1       000C4D R
  6 DOTI1      001556 R   |   6 DOTID      001540 R   |   6 DOTO1      00104B R
  6 DOTOK      001031 R   |   6 DOTPR      000D60 R   |   6 DOTQ       001293 R
  6 DOTQP      000BDB R   |   6 DOTR       000BE9 R   |   6 DOTS       0014DF R
  6 DOTS1      0014EA R   |   6 DOTS2      0014F6 R   |   6 DOVAR      000314 R
  6 DROP       00025D R   |   6 DSTOR      0007C6 R   |   6 DUMP       001495 R
  6 DUMP1      0014AC R   |   6 DUMP3      0014CE R   |   6 DUMPP      001464 R
  6 DUPP       000267 R   |   6 EDIGS      0009A6 R   |     EEPROM_B=  004000 
    EEPROM_E=  0047FF     |     EEPROM_S=  000800     |   6 ELSEE      0011F5 R
  6 EMIT       000122 R   |   6 EQ1        0004BF R   |   6 EQUAL      0004A9 R
  6 ERASE      0008D2 R   |     ERR     =  00001B     |   6 EVAL       001074 R
  6 EVAL1      001074 R   |   6 EVAL2      001090 R   |   6 EXE1       000867 R
  6 EXECU      000192 R   |   6 EXIT       0001A2 R   |     EXT     =  000001 
    EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1     |   6 EXTRC      00092D R
  6 FCP        0003B2 R   |     FHSE    =  7A1200     |     FHSI    =  F42400 
  6 FILL       00089F R   |   6 FILL1      0008BC R   |   6 FILL2      0008C5 R
  6 FIND       000E12 R   |   6 FIND1      000E30 R   |   6 FIND2      000E5E R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]

Symbol Table

  6 FIND3      000E6A R   |   6 FIND4      000E7E R   |   6 FIND5      000E8B R
  6 FIND6      000E6F R   |     FLASH_BA=  008000     |     FLASH_CR=  00505A 
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
    FLASH_WS=  00480D     |     FLSI    =  01F400     |   6 FMOVE      001A73 R
  6 FOR        001184 R   |     FPTR    =  00002C     |     GPIO_BAS=  005000 
    GPIO_CR1=  000003     |     GPIO_CR2=  000004     |     GPIO_DDR=  000002 
    GPIO_IDR=  000001     |     GPIO_ODR=  000000     |     GPIO_SIZ=  000005 
  6 HERE       000823 R   |   6 HEX        0009DC R   |   6 HI         001595 R
  6 HLD        000382 R   |   6 HOLD       000951 R   |     HSECNT  =  004809 
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
  6 IFF        0011CF R   |     IMEDD   =  000080     |   6 IMMED      0013A6 R
  6 INCH       000116 R   |   6 INN        000342 R   |     INPUT_DI=  000000 
    INPUT_EI=  000001     |     INPUT_FL=  000000     |     INPUT_PU=  000001 
  6 INTE1      001013 R   |   6 INTER      000FE9 R   |     INT_ADC2=  000016 
    INT_AUAR=  000012     |     INT_AWU =  000001     |     INT_CAN_=  000008 
    INT_CAN_=  000009     |     INT_CLK =  000002     |     INT_EXTI=  000003 
    INT_EXTI=  000004     |     INT_EXTI=  000005     |     INT_EXTI=  000006 
    INT_EXTI=  000007     |     INT_FLAS=  000018     |     INT_I2C =  000013 
    INT_SPI =  00000A     |     INT_TIM1=  00000C     |     INT_TIM1=  00000B 
    INT_TIM2=  00000E     |     INT_TIM2=  00000D     |     INT_TIM3=  000010 
    INT_TIM3=  00000F     |     INT_TIM4=  000017     |     INT_TLI =  000000 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]

Symbol Table

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
  6 INVER      00043D R   |     ITC_SPR1=  007F70     |     ITC_SPR2=  007F71 
    ITC_SPR3=  007F72     |     ITC_SPR4=  007F73     |     ITC_SPR5=  007F74 
    ITC_SPR6=  007F75     |     ITC_SPR7=  007F76     |     ITC_SPR8=  007F77 
    IWDG_KR =  0050E0     |     IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2 
  6 JSRC       001382 R   |   6 KEY        000B1C R   |   6 KTAP       000F03 R
  6 KTAP1      000F26 R   |   6 KTAP2      000F29 R   |   6 LAST       0003C2 R
  6 LASTN   =  001A6D R   |   6 LBRAC      001020 R   |     LED2_BIT=  000005 
    LED2_MAS=  000020     |     LED2_POR=  00500A     |   6 LESS       0004E6 R
    LF      =  00000A     |   6 LINK    =  001A6D R   |   6 LITER      001155 R
  6 LT1        0004FC R   |     MASKK   =  001F7F     |   6 MAX        000506 R
  6 MAX1       000519 R   |   6 MIN        000523 R   |   6 MIN1       000536 R
  6 MMOD1      0005D9 R   |   6 MMOD2      0005ED R   |   6 MMOD3      000604 R
  6 MMSM1      000580 R   |   6 MMSM2      000594 R   |   6 MMSM3      000596 R
  6 MMSM4      00059E R   |   6 MODD       00061E R   |   6 MONE       00074F R
    MS      =  000028     |   6 MSEC       0000A3 R   |   6 MSMOD      0005BC R
  6 MSTA1      0006AF R   |   6 MSTAR      00068C R   |     NAFR    =  004804 
  6 NAMEQ      000EAB R   |   6 NAMET      000DBC R   |     NCLKOPT =  004808 
  6 NEGAT      00044E R   |   6 NEX1       000159 R   |   6 NEXT       001194 R
    NFLASH_W=  00480E     |     NHSECNT =  00480A     |     NOPT1   =  004802 
    NOPT2   =  004804     |     NOPT3   =  004806     |     NOPT4   =  004808 
    NOPT5   =  00480A     |     NOPT6   =  00480C     |     NOPT7   =  00480E 
    NOPTBL  =  00487F     |   6 NTIB       000352 R   |     NUBC    =  004802 
  6 NUFQ       000B32 R   |   6 NUFQ1      000B4B R   |   6 NUMBQ      000A49 R
  6 NUMQ1      000A7D R   |   6 NUMQ2      000AAE R   |   6 NUMQ3      000AF0 R
  6 NUMQ4      000AF5 R   |   6 NUMQ5      000B04 R   |   6 NUMQ6      000B07 R
    NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC 
    NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE     |   6 NonHandl   000000 R
  6 ONE        000741 R   |   6 ONEM       00070F R   |   6 ONEP       000702 R
    OPT     =  000002     |     OPT0    =  004800     |     OPT1    =  004801 
    OPT2    =  004803     |     OPT3    =  004805     |     OPT4    =  004807 
    OPT5    =  004809     |     OPT6    =  00480B     |     OPT7    =  00480D 
    OPTBL   =  00487E     |     OPTION_B=  004800     |     OPTION_E=  00487F 
    OPTION_S=  000080     |   6 ORIG       00003F R   |   6 ORR        0002C7 R
  6 OUTPUT     000127 R   |     OUTPUT_F=  000001     |     OUTPUT_O=  000000 
    OUTPUT_P=  000001     |     OUTPUT_S=  000000     |   6 OVER       000291 R
  6 OVERT      00134F R   |     PA      =  000000     |   6 PACKS      0008E4 R
  6 PAD        000834 R   |   6 PAREN      000D6F R   |   6 PARS       000C68 R
  6 PARS1      000C93 R   |   6 PARS2      000CBE R   |   6 PARS3      000CC1 R
  6 PARS4      000CCA R   |   6 PARS5      000CED R   |   6 PARS6      000D02 R
  6 PARS7      000D11 R   |   6 PARS8      000D20 R   |   6 PARSE      000D31 R
  6 PAUSE      0000B3 R   |     PA_BASE =  005000     |     PA_CR1  =  005003 
    PA_CR2  =  005004     |     PA_DDR  =  005002     |     PA_IDR  =  005001 
    PA_ODR  =  005000     |     PB      =  000005     |     PB_BASE =  005005 
    PB_CR1  =  005008     |     PB_CR2  =  005009     |     PB_DDR  =  005007 
    PB_IDR  =  005006     |     PB_ODR  =  005005     |     PC      =  00000A 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]

Symbol Table

    PC_BASE =  00500A     |     PC_CR1  =  00500D     |     PC_CR2  =  00500E 
    PC_DDR  =  00500C     |     PC_IDR  =  00500B     |     PC_ODR  =  00500A 
    PD      =  00000F     |   6 PDUM1      001477 R   |   6 PDUM2      001488 R
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
  6 PICK       000790 R   |     PI_BASE =  005028     |     PI_CR1  =  00502B 
    PI_CR2  =  00502C     |     PI_DDR  =  00502A     |     PI_IDR  =  005029 
    PI_ODR  =  005028     |   6 PLUS       000423 R   |   6 PNAM1      001304 R
  6 PRESE      00109F R   |     PROD1   =  00001C     |     PROD2   =  00001E 
    PROD3   =  000020     |   6 PSTOR      0007A5 R   |     PTR16   =  00002D 
    PTR8    =  00002E     |   6 QBRAN      00016B R   |   6 QDUP       0003D2 R
  6 QDUP1      0003DC R   |   6 QKEY       000104 R   |   6 QSTAC      001057 R
  6 QUERY      000F83 R   |   6 QUEST      000C5A R   |   6 QUIT       0010BC R
  6 QUIT1      0010C4 R   |   6 QUIT2      0010C7 R   |     RAMBASE =  000000 
    RAM_BASE=  000000     |     RAM_END =  0017FF     |     RAM_SIZE=  001800 
  6 RAT        000224 R   |   6 RBRAC      00136F R   |   6 REPEA      00124A R
  6 RFROM      000211 R   |     ROP     =  004800     |   6 ROT        0003E3 R
  6 ROW2BUF    001A4C R   |     ROWBUFF =  001680     |     RP0     =  000026 
  6 RPAT       0001EE R   |     RPP     =  0017FF     |   6 RPSTO      0001FB R
    RST_SR  =  0050B3     |   6 SAME1      000DDA R   |   6 SAME2      000E03 R
  6 SAMEQ      000DD2 R   |   6 SCOM1      001339 R   |   6 SCOM2      00133C R
  6 SCOMP      00131B R   |   6 SEMIS      00135F R   |     SFR_BASE=  005000 
    SFR_END =  0057FF     |   6 SIGN       000990 R   |   6 SIGN1      0009A0 R
  6 SLASH      000628 R   |   6 SLMOD      00060C R   |   6 SNAME      0012CE R
    SP0     =  000024     |   6 SPACE      000B54 R   |   6 SPACS      000B63 R
  6 SPAT       000247 R   |     SPI_CR1 =  005200     |     SPI_CR2 =  005201 
    SPI_CRCP=  005205     |     SPI_DR  =  005204     |     SPI_ICR =  005202 
    SPI_RXCR=  005206     |     SPI_SR  =  005203     |     SPI_TXCR=  005207 
    SPP     =  001670     |   6 SPSTO      000254 R   |   6 SSMOD      0006B8 R
    STACK   =  0017FF     |   6 STAR       000681 R   |   6 STASL      0006C9 R
  6 STORE      0001A9 R   |   6 STR        0009BE R   |   6 STRCQ      001164 R
  6 STRQ       001285 R   |   6 STRQP      000BD1 R   |   6 SUBB       000481 R
  6 SWAPP      000277 R   |     SWIM_CSR=  007F80     |   6 TAP        000EED R
  6 TBOOT      0015B6 R   |     TBUFFBAS=  001680     |   6 TCHA1      000770 R
  6 TCHAR      000760 R   |   6 TEMP       000333 R   |   6 TEVAL      000373 R
  6 THENN      0011E5 R   |   6 TIB        000845 R   |     TIBB    =  001700 
    TIBBASE =  001700     |     TIC     =  000027     |   6 TICK       0010D3 R
    TIM1_ARR=  005262     |     TIM1_ARR=  005263     |     TIM1_BKR=  00526D 
    TIM1_CCE=  00525C     |     TIM1_CCE=  00525D     |     TIM1_CCM=  005258 
    TIM1_CCM=  000000     |     TIM1_CCM=  000001     |     TIM1_CCM=  000004 
    TIM1_CCM=  000005     |     TIM1_CCM=  000006     |     TIM1_CCM=  000007 
    TIM1_CCM=  000002     |     TIM1_CCM=  000003     |     TIM1_CCM=  000007 
    TIM1_CCM=  000002     |     TIM1_CCM=  000004     |     TIM1_CCM=  000005 
    TIM1_CCM=  000006     |     TIM1_CCM=  000003     |     TIM1_CCM=  005259 
    TIM1_CCM=  000000     |     TIM1_CCM=  000001     |     TIM1_CCM=  000004 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]

Symbol Table

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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]

Symbol Table

    TIM4_CNT=  005344     |     TIM4_CR1=  005340     |     TIM4_CR1=  000007 
    TIM4_CR1=  000000     |     TIM4_CR1=  000003     |     TIM4_CR1=  000001 
    TIM4_CR1=  000002     |     TIM4_EGR=  005343     |     TIM4_EGR=  000000 
    TIM4_IER=  005341     |     TIM4_IER=  000000     |     TIM4_PSC=  005345 
    TIM4_PSC=  000000     |     TIM4_PSC=  000007     |     TIM4_PSC=  000004 
    TIM4_PSC=  000001     |     TIM4_PSC=  000005     |     TIM4_PSC=  000002 
    TIM4_PSC=  000006     |     TIM4_PSC=  000003     |     TIM4_PSC=  000000 
    TIM4_PSC=  000001     |     TIM4_PSC=  000002     |     TIM4_SR =  005342 
    TIM4_SR_=  000000     |   6 TIMEOUTQ   0000E3 R   |   6 TIMER      0000CD R
    TIM_CR1_=  000007     |     TIM_CR1_=  000000     |     TIM_CR1_=  000006 
    TIM_CR1_=  000005     |     TIM_CR1_=  000004     |     TIM_CR1_=  000003 
    TIM_CR1_=  000001     |     TIM_CR1_=  000002     |   6 TNAM2      001510 R
  6 TNAM3      00152E R   |   6 TNAM4      001534 R   |   6 TNAME      00150D R
  6 TOKEN      000DAE R   |   6 TOR        000230 R   |     TRUEE   =  00FFFF 
  6 TWOSL      00071C R   |   6 TYPE1      000B83 R   |   6 TYPE2      000B8F R
  6 TYPES      000B7E R   |   6 Timer4Ha   000005 R   |     UART1   =  000000 
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
    UART_DR =  000001     |     UART_GTR=  000009     |     UART_PSC=  00000A 
    UART_SR =  000000     |     UART_SR_=  000001     |     UART_SR_=  000004 
    UART_SR_=  000002     |     UART_SR_=  000003     |     UART_SR_=  000000 
    UART_SR_=  000005     |     UART_SR_=  000006     |     UART_SR_=  000007 
    UBASE   =  000006     |     UBC     =  004801     |     UCNTXT  =  000014 
    UCP     =  000016     |     UCTIB   =  00000C     |     UD1     =  000001 
    UD2     =  000002     |     UD3     =  000003     |     UD4     =  000004 
  6 UDOT       000C24 R   |   6 UDOTR      000C04 R   |   6 UEND       00003D R
    UFCP    =  000018     |     UHLD    =  000012     |     UINN    =  00000A 
    UINTER  =  000010     |     ULAST   =  00001A     |   6 ULES1      0004DE R
  6 ULESS      0004C8 R   |   6 UMMOD      00055E R   |   6 UMSTA      000637 R
  6 UNIQ1      0012C5 R   |   6 UNIQU      0012A6 R   |   6 UNTIL      0011B0 R
  6 UPL1       000308 R   |   6 UPLUS      0002F1 R   |     UPP     =  000006 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]

Symbol Table

    USR_BTN_=  000004     |     USR_BTN_=  000010     |     USR_BTN_=  005015 
    UTIB    =  00000E     |     UTMP    =  000008     |   6 UTYP1      001447 R
  6 UTYP2      001456 R   |   6 UTYPE      001442 R   |   6 UZERO      000027 R
  6 VARIA      0013E4 R   |     VAR_HERE=  004006     |     VER     =  000002 
    VSIZE   =  000002     |     WANT_DEB=  000000     |     WANT_SEE=  000000 
    WDGOPT  =  004805     |     WDGOPT_I=  000002     |     WDGOPT_L=  000003 
    WDGOPT_W=  000000     |     WDGOPT_W=  000001     |   6 WHILE      00122F R
  6 WITHI      000543 R   |   6 WORDD      000D9A R   |   6 WORDS      00156A R
  6 WORS1      001570 R   |   6 WORS2      00158F R   |     WWDG_CR =  0050D1 
    WWDG_WR =  0050D2     |   6 XORR       0002DC R   |     XTEMP   =  00001C 
    YTEMP   =  00001E     |   6 ZERO       000736 R   |   6 ZL1        0002A9 R
  6 ZLESS      0002A0 R   |   6 app_spac   001A80 R   |   6 block_er   00180A R
  6 clear_ra   000019 R   |   6 clock_in   00005A R   |   6 constant   001414 R
  6 copy_buf   001861 R   |   6 copy_buf   001880 R   |   6 copy_pro   001880 R
    da      =  000002     |     db      =  000003     |     dc      =  000000 
    dd      =  000001     |   6 ee_ccomm   001A2A R   |   6 ee_comma   001A09 R
  6 ee_cstor   001777 R   |   6 ee_store   0017C3 R   |   6 eeprom     001686 R
  6 erase_fl   001826 R   |   6 farat      001698 R   |   6 farcat     0016B4 R
  6 fptr_sto   001667 R   |   6 inc_fptr   001745 R   |   6 lock       001731 R
  6 main       000016 R   |   6 pristine   0018FB R   |   6 proceed_   001829 R
  6 reboot     0000FA R   |   6 reset_ve   001962 R   |   6 row_eras   0017ED R
  6 row_eras   00183A R   |   6 row_eras   001861 R   |   6 set_opti   0018CF R
  6 set_vect   0019B5 R   |   6 tbuff      000362 R   |   6 uart1_in   00006C R
  6 unlock     001709 R   |   6 unlock_e   0016CB R   |   6 unlock_f   0016EA R
  6 write_by   00175C R   |   6 write_ro   0018A5 R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 DATA       size      0   flags    8
   2 DATA0      size      0   flags    8
   3 SSEG       size      0   flags    8
   4 SSEG1      size    100   flags    8
   5 HOME       size     80   flags    0
   6 CODE       size   1A80   flags    0

