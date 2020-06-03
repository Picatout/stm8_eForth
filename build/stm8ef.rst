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
      0080B5 9B 84                  278         .word      LASTN  ;CNTXT pointer
      0080B7 00 80                  279         .word      CTOP   ;CP in RAM
      0080B9 9C 00                  280         .word      app_space ; CP in FLASH 
      0080BB 9B 84                  281         .word      LASTN   ;LAST
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
      008119 CC 96 46         [ 2]  325         jp  COLD   ;default=MN1
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
      0081C2 90 EC 02         [ 2]  444         jp (2,y)
                           000000   445 .else 
                                    446         POPW Y
                                    447 	LDW YTEMP,Y
                                    448 	LDW Y,(Y)
                                    449         LDW (X),Y
                                    450         LDW Y,YTEMP
                                    451 	JP (2,Y)
                                    452 .endif 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



                                    453 
                                    454 ;       next    ( -- )
                                    455 ;       Code for  single index loop.
      0081C5 81 B2                  456         .word      LINK
                           000147   457 LINK	= 	.
      0081C7 44                     458 	.byte      COMPO+4
      0081C8 4E 45 58 54            459         .ascii     "NEXT"
      0081CC                        460 DONXT:
      0081CC 16 03            [ 2]  461 	LDW Y,(3,SP)
      0081CE 90 5A            [ 2]  462 	DECW Y
      0081D0 2A 07            [ 1]  463 	JRPL NEX1 ; jump if N=0
      0081D2 90 85            [ 2]  464 	POPW Y
                           000001   465 .if PICATOUT_MOD
      0081D4 5B 02            [ 2]  466         addw sp,#2
                           000000   467 .else        
                                    468 	POP A
                                    469 	POP A
                                    470 .endif         
      0081D6 90 EC 02         [ 2]  471         JP (2,Y)
      0081D9                        472 NEX1:
      0081D9 17 03            [ 2]  473         LDW (3,SP),Y
      0081DB 90 85            [ 2]  474         POPW Y
      0081DD 90 FE            [ 2]  475 	LDW Y,(Y)
      0081DF 90 FC            [ 2]  476 	JP (Y)
                                    477 
                                    478 ;       ?branch ( f -- )
                                    479 ;       Branch if flag is zero.
      0081E1 81 C7                  480         .word      LINK
                           000163   481 LINK	= 	.
      0081E3 47                     482 	.byte      COMPO+7
      0081E4 3F 42 52 41 4E 43 48   483         .ascii     "?BRANCH"
      0081EB                        484 QBRAN:	
      0081EB 90 93            [ 1]  485         LDW Y,X
      0081ED 1C 00 02         [ 2]  486 	ADDW X,#2
      0081F0 90 FE            [ 2]  487 	LDW Y,(Y)
      0081F2 27 0E            [ 1]  488         JREQ     BRAN
      0081F4 90 85            [ 2]  489 	POPW Y
      0081F6 90 EC 02         [ 2]  490 	JP (2,Y)
                                    491         
                                    492 ;       branch  ( -- )
                                    493 ;       Branch to an inline address.
      0081F9 81 E3                  494         .word      LINK
                           00017B   495 LINK	= 	.
      0081FB 46                     496 	.byte      COMPO+6
      0081FC 42 52 41 4E 43 48      497         .ascii     "BRANCH"
      008202                        498 BRAN:
      008202 90 85            [ 2]  499         POPW Y
      008204 90 FE            [ 2]  500 	LDW Y,(Y)
      008206 90 FC            [ 2]  501         JP     (Y)
                                    502 
                                    503 ;       EXECUTE ( ca -- )
                                    504 ;       Execute  word at ca.
      008208 81 FB                  505         .word      LINK
                           00018A   506 LINK	= 	.
      00820A 07                     507         .byte       7
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



      00820B 45 58 45 43 55 54 45   508         .ascii     "EXECUTE"
      008212                        509 EXECU:
      008212 90 93            [ 1]  510         LDW Y,X
      008214 1C 00 02         [ 2]  511 	ADDW X,#2
      008217 90 FE            [ 2]  512 	LDW  Y,(Y)
      008219 90 FC            [ 2]  513         JP   (Y)
                                    514 
                                    515 ;       EXIT    ( -- )
                                    516 ;       Terminate a colon definition.
      00821B 82 0A                  517         .word      LINK
                           00019D   518 LINK = .
      00821D 04                     519         .byte      4
      00821E 45 58 49 54            520         .ascii     "EXIT"
      008222                        521 EXIT:
      008222 90 85            [ 2]  522         POPW Y
      008224 81               [ 4]  523         RET
                                    524 
                                    525 ;       !       ( w a -- )
                                    526 ;       Pop  data stack to memory.
      008225 82 1D                  527         .word      LINK
                           0001A7   528 LINK = .
      008227 01                     529         .byte      1
      008228 21                     530         .ascii     "!"
      008229                        531 STORE:
      008229 90 93            [ 1]  532         LDW Y,X
      00822B 90 FE            [ 2]  533         LDW Y,(Y)    ;Y=a
      00822D 90 BF 1E         [ 2]  534         LDW YTEMP,Y
      008230 90 93            [ 1]  535         LDW Y,X
      008232 90 EE 02         [ 2]  536         LDW Y,(2,Y)
      008235 91 CF 1E         [ 5]  537         LDW [YTEMP],Y ;store w at a
      008238 1C 00 04         [ 2]  538         ADDW X,#4 ; DDROP 
      00823B 81               [ 4]  539         RET     
                                    540 
                                    541 ;       @       ( a -- w )
                                    542 ;       Push memory location to stack.
      00823C 82 27                  543         .word      LINK
                           0001BE   544 LINK	= 	.
      00823E 01                     545         .byte    1
      00823F 40                     546         .ascii	"@"
      008240                        547 AT:
      008240 90 93            [ 1]  548         LDW Y,X     ;Y = a
      008242 90 FE            [ 2]  549         LDW Y,(Y)   ; address 
      008244 90 FE            [ 2]  550         LDW Y,(Y)   ; value 
      008246 FF               [ 2]  551         LDW (X),Y ;w = @Y
      008247 81               [ 4]  552         RET     
                                    553 
                                    554 ;       C!      ( c b -- )
                                    555 ;       Pop  data stack to byte memory.
      008248 82 3E                  556         .word      LINK
                           0001CA   557 LINK	= .
      00824A 02                     558         .byte      2
      00824B 43 21                  559         .ascii     "C!"
      00824D                        560 CSTOR:
      00824D 90 93            [ 1]  561         LDW Y,X
      00824F 90 FE            [ 2]  562 	LDW Y,(Y)    ;Y=b
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]



      008251 E6 03            [ 1]  563         LD A,(3,X)    ;D = c
      008253 90 F7            [ 1]  564         LD  (Y),A     ;store c at b
      008255 1C 00 04         [ 2]  565 	ADDW X,#4 ; DDROP 
      008258 81               [ 4]  566         RET     
                                    567 
                                    568 ;       C@      ( b -- c )
                                    569 ;       Push byte in memory to  stack.
      008259 82 4A                  570         .word      LINK
                           0001DB   571 LINK	= 	.
      00825B 02                     572         .byte      2
      00825C 43 40                  573         .ascii     "C@"
      00825E                        574 CAT:
      00825E 90 93            [ 1]  575         LDW Y,X     ;Y=b
      008260 90 FE            [ 2]  576         LDW Y,(Y)
      008262 90 F6            [ 1]  577         LD A,(Y)
      008264 E7 01            [ 1]  578         LD (1,X),A
      008266 7F               [ 1]  579         CLR (X)
      008267 81               [ 4]  580         RET     
                                    581 
                                    582 ;       RP@     ( -- a )
                                    583 ;       Push current RP to data stack.
      008268 82 5B                  584         .word      LINK
                           0001EA   585 LINK	= .
      00826A 03                     586         .byte      3
      00826B 52 50 40               587         .ascii     "RP@"
      00826E                        588 RPAT:
      00826E 90 96            [ 1]  589         LDW Y,SP    ;save return addr
      008270 1D 00 02         [ 2]  590         SUBW X,#2
      008273 FF               [ 2]  591         LDW (X),Y
      008274 81               [ 4]  592         RET     
                                    593 
                                    594 ;       RP!     ( a -- )
                                    595 ;       Set  return stack pointer.
      008275 82 6A                  596         .word      LINK
                           0001F7   597 LINK	= 	. 
      008277 43                     598 	.byte      COMPO+3
      008278 52 50 21               599         .ascii     "RP!"
      00827B                        600 RPSTO:
      00827B 90 85            [ 2]  601         POPW Y
      00827D 90 BF 1E         [ 2]  602         LDW YTEMP,Y
      008280 90 93            [ 1]  603         LDW Y,X
      008282 90 FE            [ 2]  604         LDW Y,(Y)
      008284 90 94            [ 1]  605         LDW SP,Y
      008286 1C 00 02         [ 2]  606         ADDW x,#CELLL ; a was not dropped, Picatout 2020-05-24
      008289 92 CC 1E         [ 5]  607         JP [YTEMP]
                                    608 
                                    609 ;       R>      ( -- w )
                                    610 ;       Pop return stack to data stack.
      00828C 82 77                  611         .word      LINK
                           00020E   612 LINK	= 	. 
      00828E 42                     613 	.byte      COMPO+2
      00828F 52 3E                  614         .ascii     "R>"
      008291                        615 RFROM:
      008291 90 85            [ 2]  616         POPW Y    ;save return addr
      008293 90 BF 1E         [ 2]  617         LDW YTEMP,Y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 13.
Hexadecimal [24-Bits]



      008296 90 85            [ 2]  618         POPW Y
      008298 1D 00 02         [ 2]  619         SUBW X,#2
      00829B FF               [ 2]  620         LDW (X),Y
      00829C 92 CC 1E         [ 5]  621         JP [YTEMP]
                                    622 
                                    623 ;       R@      ( -- w )
                                    624 ;       Copy top of return stack to stack.
      00829F 82 8E                  625         .word      LINK
                           000221   626 LINK	= 	. 
      0082A1 02                     627         .byte      2
      0082A2 52 40                  628         .ascii     "R@"
      0082A4                        629 RAT:
                           000001   630 .if PICATOUT_MOD
      0082A4 16 03            [ 2]  631         ldw y,(3,sp)
      0082A6 1D 00 02         [ 2]  632         subw x,#CELLL 
      0082A9 FF               [ 2]  633         ldw (x),y 
      0082AA 81               [ 4]  634         ret 
                           000000   635 .else 
                                    636         POPW Y
                                    637         LDW YTEMP,Y
                                    638         POPW Y
                                    639         PUSHW Y
                                    640         SUBW X,#2
                                    641         LDW (X),Y
                                    642         JP [YTEMP]
                                    643 .endif         
                                    644 
                                    645 ;       >R      ( w -- )
                                    646 ;       Push data stack to return stack.
      0082AB 82 A1                  647         .word      LINK
                           00022D   648 LINK	= 	. 
      0082AD 42                     649 	.byte      COMPO+2
      0082AE 3E 52                  650         .ascii     ">R"
      0082B0                        651 TOR:
      0082B0 90 85            [ 2]  652         POPW Y    ;save return addr
      0082B2 90 BF 1E         [ 2]  653         LDW YTEMP,Y
      0082B5 90 93            [ 1]  654         LDW Y,X
      0082B7 90 FE            [ 2]  655         LDW Y,(Y)
      0082B9 90 89            [ 2]  656         PUSHW Y    ;restore return addr
      0082BB 1C 00 02         [ 2]  657         ADDW X,#2
      0082BE 92 CC 1E         [ 5]  658         JP [YTEMP]
                                    659 
                                    660 ;       SP@     ( -- a )
                                    661 ;       Push current stack pointer.
      0082C1 82 AD                  662         .word      LINK
                           000243   663 LINK	= 	. 
      0082C3 03                     664         .byte      3
      0082C4 53 50 40               665         .ascii     "SP@"
      0082C7                        666 SPAT:
      0082C7 90 93            [ 1]  667 	LDW Y,X
      0082C9 1D 00 02         [ 2]  668         SUBW X,#2
      0082CC FF               [ 2]  669 	LDW (X),Y
      0082CD 81               [ 4]  670         RET     
                                    671 
                                    672 ;       SP!     ( a -- )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 14.
Hexadecimal [24-Bits]



                                    673 ;       Set  data stack pointer.
      0082CE 82 C3                  674         .word      LINK
                           000250   675 LINK	= 	. 
      0082D0 03                     676         .byte      3
      0082D1 53 50 21               677         .ascii     "SP!"
      0082D4                        678 SPSTO:
      0082D4 FE               [ 2]  679         LDW     X,(X)     ;X = a
      0082D5 81               [ 4]  680         RET     
                                    681 
                                    682 ;       DROP    ( w -- )
                                    683 ;       Discard top stack item.
      0082D6 82 D0                  684         .word      LINK
                           000258   685 LINK	= 	. 
      0082D8 04                     686         .byte      4
      0082D9 44 52 4F 50            687         .ascii     "DROP"
      0082DD                        688 DROP:
      0082DD 1C 00 02         [ 2]  689         ADDW X,#2     
      0082E0 81               [ 4]  690         RET     
                                    691 
                                    692 ;       DUP     ( w -- w w )
                                    693 ;       Duplicate  top stack item.
      0082E1 82 D8                  694         .word      LINK
                           000263   695 LINK	= 	. 
      0082E3 03                     696         .byte      3
      0082E4 44 55 50               697         .ascii     "DUP"
      0082E7                        698 DUPP:
      0082E7 90 93            [ 1]  699 	LDW Y,X
      0082E9 1D 00 02         [ 2]  700         SUBW X,#2
      0082EC 90 FE            [ 2]  701 	LDW Y,(Y)
      0082EE FF               [ 2]  702 	LDW (X),Y
      0082EF 81               [ 4]  703         RET     
                                    704 
                                    705 ;       SWAP    ( w1 w2 -- w2 w1 )
                                    706 ;       Exchange top two stack items.
      0082F0 82 E3                  707         .word      LINK
                           000272   708 LINK	= 	. 
      0082F2 04                     709         .byte      4
      0082F3 53 57 41 50            710         .ascii     "SWAP"
      0082F7                        711 SWAPP:
      0082F7 90 93            [ 1]  712         LDW Y,X
      0082F9 90 FE            [ 2]  713         LDW Y,(Y)
      0082FB 90 BF 1E         [ 2]  714         LDW YTEMP,Y
      0082FE 90 93            [ 1]  715         LDW Y,X
      008300 90 EE 02         [ 2]  716         LDW Y,(2,Y)
      008303 FF               [ 2]  717         LDW (X),Y
      008304 90 BE 1E         [ 2]  718         LDW Y,YTEMP
      008307 EF 02            [ 2]  719         LDW (2,X),Y
      008309 81               [ 4]  720         RET     
                                    721 
                                    722 ;       OVER    ( w1 w2 -- w1 w2 w1 )
                                    723 ;       Copy second stack item to top.
      00830A 82 F2                  724         .word      LINK
                           00028C   725 LINK	= . 
      00830C 04                     726         .byte      4
      00830D 4F 56 45 52            727         .ascii     "OVER"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 15.
Hexadecimal [24-Bits]



      008311                        728 OVER:
      008311 1D 00 02         [ 2]  729         SUBW X,#2
      008314 90 93            [ 1]  730         LDW Y,X
      008316 90 EE 04         [ 2]  731         LDW Y,(4,Y)
      008319 FF               [ 2]  732         LDW (X),Y
      00831A 81               [ 4]  733         RET     
                                    734 
                                    735 ;       0<      ( n -- t )
                                    736 ;       Return true if n is negative.
      00831B 83 0C                  737         .word      LINK
                           00029D   738 LINK	= . 
      00831D 02                     739         .byte      2
      00831E 30 3C                  740         .ascii     "0<"
      008320                        741 ZLESS:
      008320 A6 FF            [ 1]  742         LD A,#0xFF
      008322 90 93            [ 1]  743         LDW Y,X
      008324 90 FE            [ 2]  744         LDW Y,(Y)
      008326 2B 01            [ 1]  745         JRMI     ZL1
      008328 4F               [ 1]  746         CLR A   ;false
      008329 F7               [ 1]  747 ZL1:    LD     (X),A
      00832A E7 01            [ 1]  748         LD (1,X),A
      00832C 81               [ 4]  749 	RET     
                                    750 
                                    751 ;       AND     ( w w -- w )
                                    752 ;       Bitwise AND.
      00832D 83 1D                  753         .word      LINK
                           0002AF   754 LINK	= . 
      00832F 03                     755         .byte      3
      008330 41 4E 44               756         .ascii     "AND"
      008333                        757 ANDD:
      008333 F6               [ 1]  758         LD  A,(X)    ;D=w
      008334 E4 02            [ 1]  759         AND A,(2,X)
      008336 E7 02            [ 1]  760         LD (2,X),A
      008338 E6 01            [ 1]  761         LD A,(1,X)
      00833A E4 03            [ 1]  762         AND A,(3,X)
      00833C E7 03            [ 1]  763         LD (3,X),A
      00833E 1C 00 02         [ 2]  764         ADDW X,#2
      008341 81               [ 4]  765         RET
                                    766 
                                    767 ;       OR      ( w w -- w )
                                    768 ;       Bitwise inclusive OR.
      008342 83 2F                  769         .word      LINK
                           0002C4   770 LINK = . 
      008344 02                     771         .byte      2
      008345 4F 52                  772         .ascii     "OR"
      008347                        773 ORR:
      008347 F6               [ 1]  774         LD A,(X)    ;D=w
      008348 EA 02            [ 1]  775         OR A,(2,X)
      00834A E7 02            [ 1]  776         LD (2,X),A
      00834C E6 01            [ 1]  777         LD A,(1,X)
      00834E EA 03            [ 1]  778         OR A,(3,X)
      008350 E7 03            [ 1]  779         LD (3,X),A
      008352 1C 00 02         [ 2]  780         ADDW X,#2
      008355 81               [ 4]  781         RET
                                    782 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 16.
Hexadecimal [24-Bits]



                                    783 ;       XOR     ( w w -- w )
                                    784 ;       Bitwise exclusive OR.
      008356 83 44                  785         .word      LINK
                           0002D8   786 LINK	= . 
      008358 03                     787         .byte      3
      008359 58 4F 52               788         .ascii     "XOR"
      00835C                        789 XORR:
      00835C F6               [ 1]  790         LD A,(X)    ;D=w
      00835D E8 02            [ 1]  791         XOR A,(2,X)
      00835F E7 02            [ 1]  792         LD (2,X),A
      008361 E6 01            [ 1]  793         LD A,(1,X)
      008363 E8 03            [ 1]  794         XOR A,(3,X)
      008365 E7 03            [ 1]  795         LD (3,X),A
      008367 1C 00 02         [ 2]  796         ADDW X,#2
      00836A 81               [ 4]  797         RET
                                    798 
                                    799 ;       UM+     ( u u -- udsum )
                                    800 ;       Add two unsigned single
                                    801 ;       and return a double sum.
      00836B 83 58                  802         .word      LINK
                           0002ED   803 LINK	= . 
      00836D 03                     804         .byte      3
      00836E 55 4D 2B               805         .ascii     "UM+"
      008371                        806 UPLUS:
      008371 A6 01            [ 1]  807         LD A,#1
      008373 90 93            [ 1]  808         LDW Y,X
      008375 90 EE 02         [ 2]  809         LDW Y,(2,Y)
      008378 90 BF 1E         [ 2]  810         LDW YTEMP,Y
      00837B 90 93            [ 1]  811         LDW Y,X
      00837D 90 FE            [ 2]  812         LDW Y,(Y)
      00837F 72 B9 00 1E      [ 2]  813         ADDW Y,YTEMP
      008383 EF 02            [ 2]  814         LDW (2,X),Y
      008385 25 01            [ 1]  815         JRC     UPL1
      008387 4F               [ 1]  816         CLR A
      008388 E7 01            [ 1]  817 UPL1:   LD     (1,X),A
      00838A 7F               [ 1]  818         CLR (X)
      00838B 81               [ 4]  819         RET
                                    820 
                                    821 ;; System and user variables
                                    822 
                                    823 ;       doVAR   ( -- a )
                                    824 ;       Code for VARIABLE and CREATE.
      00838C 83 6D                  825         .word      LINK
                           00030E   826 LINK	= . 
      00838E 45                     827 	.byte      COMPO+5
      00838F 44 4F 56 41 52         828         .ascii     "DOVAR"
      008394                        829 DOVAR:
      008394 1D 00 02         [ 2]  830 	SUBW X,#2
      008397 90 85            [ 2]  831         POPW Y    ;get return addr (pfa)
                           000001   832 .if PICATOUT_MOD
      008399 90 FE            [ 2]  833         LDW Y,(Y) ; indirect address 
                                    834 .endif ;PICATOUT_MOD        
      00839B FF               [ 2]  835         LDW (X),Y    ;push on stack
      00839C 81               [ 4]  836         RET     ;go to RET of EXEC
                                    837 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 17.
Hexadecimal [24-Bits]



                                    838 ;       BASE    ( -- a )
                                    839 ;       Radix base for numeric I/O.
      00839D 83 8E                  840         .word      LINK        
                           00031F   841 LINK = . 
      00839F 04                     842         .byte      4
      0083A0 42 41 53 45            843         .ascii     "BASE"
      0083A4                        844 BASE:
      0083A4 90 AE 00 06      [ 2]  845 	LDW Y,#UBASE 
      0083A8 1D 00 02         [ 2]  846 	SUBW X,#2
      0083AB FF               [ 2]  847         LDW (X),Y
      0083AC 81               [ 4]  848         RET
                                    849 
                                    850 ;       tmp     ( -- a )
                                    851 ;       A temporary storage.
      0083AD 83 9F                  852         .word      LINK
                                    853         
                           00032F   854 LINK = . 
      0083AF 03                     855 	.byte      3
      0083B0 54 4D 50               856         .ascii     "TMP"
      0083B3                        857 TEMP:
      0083B3 90 AE 00 08      [ 2]  858 	LDW Y,#UTMP
      0083B7 1D 00 02         [ 2]  859 	SUBW X,#2
      0083BA FF               [ 2]  860         LDW (X),Y
      0083BB 81               [ 4]  861         RET
                                    862 
                                    863 ;       >IN     ( -- a )
                                    864 ;        Hold parsing pointer.
      0083BC 83 AF                  865         .word      LINK
                           00033E   866 LINK = . 
      0083BE 03                     867         .byte      3
      0083BF 3E 49 4E               868         .ascii    ">IN"
      0083C2                        869 INN:
      0083C2 90 AE 00 0A      [ 2]  870 	LDW Y,#UINN 
      0083C6 1D 00 02         [ 2]  871 	SUBW X,#2
      0083C9 FF               [ 2]  872         LDW (X),Y
      0083CA 81               [ 4]  873         RET
                                    874 
                                    875 ;       #TIB    ( -- a )
                                    876 ;       Count in terminal input buffer.
      0083CB 83 BE                  877         .word      LINK
                           00034D   878 LINK = . 
      0083CD 04                     879         .byte      4
      0083CE 23 54 49 42            880         .ascii     "#TIB"
      0083D2                        881 NTIB:
      0083D2 90 AE 00 0C      [ 2]  882 	LDW Y,#UCTIB 
      0083D6 1D 00 02         [ 2]  883 	SUBW X,#2
      0083D9 FF               [ 2]  884         LDW (X),Y
      0083DA 81               [ 4]  885         RET
                                    886 
                           000001   887 .if PICATOUT_MOD
                                    888 ;       TBUF ( -- a )
                                    889 ;       address of 128 bytes transaction buffer 
      0083DB 83 CD                  890         .word LINK 
                           00035D   891         LINK=.
      0083DD 04                     892         .byte 4 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
Hexadecimal [24-Bits]



      0083DE 54 42 55 46            893         .ascii "TBUF"
      0083E2                        894 TBUF:
      0083E2 90 AE 16 80      [ 2]  895         ldw y,#ROWBUFF
      0083E6 1D 00 02         [ 2]  896         subw x,#CELLL
      0083E9 FF               [ 2]  897         ldw (x),y 
      0083EA 81               [ 4]  898         ret 
                                    899 
                                    900 
                                    901 .endif ;PICATOUT_MOD
                                    902 
                                    903 ;       "EVAL   ( -- a )
                                    904 ;       Execution vector of EVAL.
      0083EB 83 DD                  905         .word      LINK
                           00036D   906 LINK = . 
      0083ED 05                     907         .byte      5
      0083EE 27 45 56 41 4C         908         .ascii     "'EVAL"
      0083F3                        909 TEVAL:
      0083F3 90 AE 00 10      [ 2]  910 	LDW Y,#UINTER 
      0083F7 1D 00 02         [ 2]  911 	SUBW X,#2
      0083FA FF               [ 2]  912         LDW (X),Y
      0083FB 81               [ 4]  913         RET
                                    914 
                                    915 ;       HLD     ( -- a )
                                    916 ;       Hold a pointer of output string.
      0083FC 83 ED                  917         .word      LINK
                           00037E   918 LINK = . 
      0083FE 03                     919         .byte      3
      0083FF 48 4C 44               920         .ascii     "HLD"
      008402                        921 HLD:
      008402 90 AE 00 12      [ 2]  922 	LDW Y,#UHLD 
      008406 1D 00 02         [ 2]  923 	SUBW X,#2
      008409 FF               [ 2]  924         LDW (X),Y
      00840A 81               [ 4]  925         RET
                                    926 
                                    927 ;       CONTEXT ( -- a )
                                    928 ;       Start vocabulary search.
      00840B 83 FE                  929         .word      LINK
                           00038D   930 LINK = . 
      00840D 07                     931         .byte      7
      00840E 43 4F 4E 54 45 58 54   932         .ascii     "CONTEXT"
      008415                        933 CNTXT:
      008415 90 AE 00 14      [ 2]  934 	LDW Y,#UCNTXT
      008419 1D 00 02         [ 2]  935 	SUBW X,#2
      00841C FF               [ 2]  936         LDW (X),Y
      00841D 81               [ 4]  937         RET
                                    938 
                                    939 ;       CP      ( -- a )
                           000001   940 .if PICATOUT_MOD 
                                    941 ;       Point to top of variables
                           000000   942 .else 
                                    943 ;       Point to top of dictionary.
                                    944 .endif ; PICATOUT_MOD
      00841E 84 0D                  945         .word      LINK
                           0003A0   946 LINK = . 
      008420 02                     947         .byte      2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]



      008421 43 50                  948         .ascii     "CP"
      008423                        949 CPP:
      008423 90 AE 00 16      [ 2]  950 	LDW Y,#UCP 
      008427 1D 00 02         [ 2]  951 	SUBW X,#2
      00842A FF               [ 2]  952         LDW (X),Y
      00842B 81               [ 4]  953         RET
                                    954 
                           000001   955 .if PICATOUT_MOD
                                    956 ;       FCP    ( -- a )
                                    957 ;       Pointer to top of FLASH 
      00842C 84 20                  958         .word LINK 
                           0003AE   959         LINK=.
      00842E 03                     960         .byte 3 
      00842F 46 43 50               961         .ascii "FCP"
      008432                        962 FCP: 
      008432 90 AE 00 18      [ 2]  963         ldw y,#UFCP 
      008436 1D 00 02         [ 2]  964         subw x,#CELLL 
      008439 FF               [ 2]  965         ldw (x),y 
      00843A 81               [ 4]  966         ret                
                                    967 .endif ;PICATOUT_MOD
                                    968 
                                    969 ;       LAST    ( -- a )
                                    970 ;       Point to last name in dictionary.
      00843B 84 2E                  971         .word      LINK
                           0003BD   972 LINK = . 
      00843D 04                     973         .byte      4
      00843E 4C 41 53 54            974         .ascii     "LAST"
      008442                        975 LAST:
      008442 90 AE 00 1A      [ 2]  976 	LDW Y,#ULAST 
      008446 1D 00 02         [ 2]  977 	SUBW X,#2
      008449 FF               [ 2]  978         LDW (X),Y
      00844A 81               [ 4]  979         RET
                                    980 
                                    981 ;; Common functions
                                    982 
                                    983 ;       ?DUP    ( w -- w w | 0 )
                                    984 ;       Dup tos if its is not zero.
      00844B 84 3D                  985         .word      LINK
                           0003CD   986 LINK = . 
      00844D 04                     987         .byte      4
      00844E 3F 44 55 50            988         .ascii     "?DUP"
      008452                        989 QDUP:
      008452 90 93            [ 1]  990         LDW Y,X
      008454 90 FE            [ 2]  991 	LDW Y,(Y)
      008456 27 04            [ 1]  992         JREQ     QDUP1
      008458 1D 00 02         [ 2]  993 	SUBW X,#2
      00845B FF               [ 2]  994         LDW (X),Y
      00845C 81               [ 4]  995 QDUP1:  RET
                                    996 
                                    997 ;       ROT     ( w1 w2 w3 -- w2 w3 w1 )
                                    998 ;       Rot 3rd item to top.
      00845D 84 4D                  999         .word      LINK
                           0003DF  1000 LINK = . 
      00845F 03                    1001         .byte      3
      008460 52 4F 54              1002         .ascii     "ROT"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]



      008463                       1003 ROT:
                           000001  1004 .if PICATOUT_MOD
      008463 90 93            [ 1] 1005         ldw y,x 
      008465 90 FE            [ 2] 1006         ldw y,(y)
      008467 90 89            [ 2] 1007         pushw y 
      008469 90 93            [ 1] 1008         ldw y,x 
      00846B 90 EE 04         [ 2] 1009         ldw y,(4,y)
      00846E FF               [ 2] 1010         ldw (x),y 
      00846F 90 93            [ 1] 1011         ldw y,x 
      008471 90 EE 02         [ 2] 1012         ldw y,(2,y)
      008474 EF 04            [ 2] 1013         ldw (4,x),y 
      008476 90 85            [ 2] 1014         popw y 
      008478 EF 02            [ 2] 1015         ldw (2,x),y
      00847A 81               [ 4] 1016         ret 
                           000000  1017 .else 
                                   1018         LDW Y,X
                                   1019 	LDW Y,(4,Y)
                                   1020 	LDW YTEMP,Y
                                   1021         LDW Y,X
                                   1022         LDW Y,(2,Y)
                                   1023         LDW XTEMP,Y
                                   1024         LDW Y,X
                                   1025         LDW Y,(Y)
                                   1026         LDW (2,X),Y
                                   1027         LDW Y,XTEMP
                                   1028         LDW (4,X),Y
                                   1029         LDW Y,YTEMP
                                   1030         LDW (X),Y
                                   1031         RET
                                   1032 .endif 
                                   1033 
                                   1034 ;       2DROP   ( w w -- )
                                   1035 ;       Discard two items on stack.
      00847B 84 5F                 1036         .word      LINK
                           0003FD  1037 LINK = . 
      00847D 05                    1038         .byte      5
      00847E 32 44 52 4F 50        1039         .ascii     "2DROP"
      008483                       1040 DDROP:
      008483 1C 00 04         [ 2] 1041         ADDW X,#4
      008486 81               [ 4] 1042         RET
                                   1043 
                                   1044 ;       2DUP    ( w1 w2 -- w1 w2 w1 w2 )
                                   1045 ;       Duplicate top two items.
      008487 84 7D                 1046         .word      LINK
                           000409  1047 LINK = . 
      008489 04                    1048         .byte      4
      00848A 32 44 55 50           1049         .ascii     "2DUP"
      00848E                       1050 DDUP:
      00848E 1D 00 04         [ 2] 1051         SUBW X,#4
      008491 90 93            [ 1] 1052         LDW Y,X
      008493 90 EE 06         [ 2] 1053         LDW Y,(6,Y)
      008496 EF 02            [ 2] 1054         LDW (2,X),Y
      008498 90 93            [ 1] 1055         LDW Y,X
      00849A 90 EE 04         [ 2] 1056         LDW Y,(4,Y)
      00849D FF               [ 2] 1057         LDW (X),Y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



      00849E 81               [ 4] 1058         RET
                                   1059 
                                   1060 ;       +       ( w w -- sum )
                                   1061 ;       Add top two items.
      00849F 84 89                 1062         .word      LINK
                           000421  1063 LINK = . 
      0084A1 01                    1064         .byte      1
      0084A2 2B                    1065         .ascii     "+"
      0084A3                       1066 PLUS:
      0084A3 90 93            [ 1] 1067         LDW Y,X
      0084A5 90 FE            [ 2] 1068         LDW Y,(Y)
      0084A7 90 BF 1E         [ 2] 1069         LDW YTEMP,Y
      0084AA 1C 00 02         [ 2] 1070         ADDW X,#2
      0084AD 90 93            [ 1] 1071         LDW Y,X
      0084AF 90 FE            [ 2] 1072         LDW Y,(Y)
      0084B1 72 B9 00 1E      [ 2] 1073         ADDW Y,YTEMP
      0084B5 FF               [ 2] 1074         LDW (X),Y
      0084B6 81               [ 4] 1075         RET
                                   1076 
                                   1077 ;       NOT     ( w -- w )
                                   1078 ;       One's complement of tos.
      0084B7 84 A1                 1079         .word      LINK
                           000439  1080 LINK = . 
      0084B9 03                    1081         .byte      3
      0084BA 4E 4F 54              1082         .ascii     "NOT"
      0084BD                       1083 INVER:
      0084BD 90 93            [ 1] 1084         LDW Y,X
      0084BF 90 FE            [ 2] 1085         LDW Y,(Y)
      0084C1 90 53            [ 2] 1086         CPLW Y
      0084C3 FF               [ 2] 1087         LDW (X),Y
      0084C4 81               [ 4] 1088         RET
                                   1089 
                                   1090 ;       NEGATE  ( n -- -n )
                                   1091 ;       Two's complement of tos.
      0084C5 84 B9                 1092         .word      LINK
                           000447  1093 LINK = . 
      0084C7 06                    1094         .byte      6
      0084C8 4E 45 47 41 54 45     1095         .ascii     "NEGATE"
      0084CE                       1096 NEGAT:
      0084CE 90 93            [ 1] 1097         LDW Y,X
      0084D0 90 FE            [ 2] 1098         LDW Y,(Y)
      0084D2 90 50            [ 2] 1099         NEGW Y
      0084D4 FF               [ 2] 1100         LDW (X),Y
      0084D5 81               [ 4] 1101         RET
                                   1102 
                                   1103 ;       DNEGATE ( d -- -d )
                                   1104 ;       Two's complement of top double.
      0084D6 84 C7                 1105         .word      LINK
                           000458  1106 LINK = . 
      0084D8 07                    1107         .byte      7
      0084D9 44 4E 45 47 41 54 45  1108         .ascii     "DNEGATE"
      0084E0                       1109 DNEGA:
      0084E0 90 93            [ 1] 1110         LDW Y,X
      0084E2 90 FE            [ 2] 1111 	LDW Y,(Y)
      0084E4 90 53            [ 2] 1112         CPLW Y     
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]



      0084E6 90 BF 1E         [ 2] 1113 	LDW YTEMP,Y
      0084E9 90 93            [ 1] 1114         LDW Y,X
      0084EB 90 EE 02         [ 2] 1115         LDW Y,(2,Y)
      0084EE 90 53            [ 2] 1116         CPLW Y
      0084F0 90 5C            [ 2] 1117         INCW Y
      0084F2 EF 02            [ 2] 1118         LDW (2,X),Y
      0084F4 90 BE 1E         [ 2] 1119         LDW Y,YTEMP
      0084F7 24 02            [ 1] 1120         JRNC DN1 
      0084F9 90 5C            [ 2] 1121         INCW Y
      0084FB FF               [ 2] 1122 DN1:    LDW (X),Y
      0084FC 81               [ 4] 1123         RET
                                   1124 
                                   1125 ;       -       ( n1 n2 -- n1-n2 )
                                   1126 ;       Subtraction.
      0084FD 84 D8                 1127         .word      LINK
                           00047F  1128 LINK = . 
      0084FF 01                    1129         .byte      1
      008500 2D                    1130         .ascii     "-"
      008501                       1131 SUBB:
      008501 90 93            [ 1] 1132         LDW Y,X
      008503 90 FE            [ 2] 1133         LDW Y,(Y)
      008505 90 BF 1E         [ 2] 1134         LDW YTEMP,Y
      008508 1C 00 02         [ 2] 1135         ADDW X,#2
      00850B 90 93            [ 1] 1136         LDW Y,X
      00850D 90 FE            [ 2] 1137         LDW Y,(Y)
      00850F 72 B2 00 1E      [ 2] 1138         SUBW Y,YTEMP
      008513 FF               [ 2] 1139         LDW (X),Y
      008514 81               [ 4] 1140         RET
                                   1141 
                                   1142 ;       ABS     ( n -- n )
                                   1143 ;       Return  absolute value of n.
      008515 84 FF                 1144         .word      LINK
                           000497  1145 LINK = . 
      008517 03                    1146         .byte      3
      008518 41 42 53              1147         .ascii     "ABS"
      00851B                       1148 ABSS:
      00851B 90 93            [ 1] 1149         LDW Y,X
      00851D 90 FE            [ 2] 1150 	LDW Y,(Y)
      00851F 2A 03            [ 1] 1151         JRPL     AB1     ;negate:
      008521 90 50            [ 2] 1152         NEGW     Y     ;else negate hi byte
      008523 FF               [ 2] 1153         LDW (X),Y
      008524 81               [ 4] 1154 AB1:    RET
                                   1155 
                                   1156 ;       =       ( w w -- t )
                                   1157 ;       Return true if top two are =al.
      008525 85 17                 1158         .word      LINK
                           0004A7  1159 LINK = . 
      008527 01                    1160         .byte      1
      008528 3D                    1161         .ascii     "="
      008529                       1162 EQUAL:
      008529 A6 FF            [ 1] 1163         LD A,#0xFF  ;true
      00852B 90 93            [ 1] 1164         LDW Y,X    ;D = n2
      00852D 90 FE            [ 2] 1165         LDW Y,(Y)
      00852F 90 BF 1E         [ 2] 1166         LDW YTEMP,Y
      008532 1C 00 02         [ 2] 1167         ADDW X,#2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



      008535 90 93            [ 1] 1168         LDW Y,X
      008537 90 FE            [ 2] 1169         LDW Y,(Y)
      008539 90 B3 1E         [ 2] 1170         CPW Y,YTEMP     ;if n2 <> n1
      00853C 27 01            [ 1] 1171         JREQ     EQ1
      00853E 4F               [ 1] 1172         CLR A
      00853F F7               [ 1] 1173 EQ1:    LD (X),A
      008540 E7 01            [ 1] 1174         LD (1,X),A
      008542 81               [ 4] 1175 	RET     
                                   1176 
                                   1177 ;       U<      ( u u -- t )
                                   1178 ;       Unsigned compare of top two items.
      008543 85 27                 1179         .word      LINK
                           0004C5  1180 LINK = . 
      008545 02                    1181         .byte      2
      008546 55 3C                 1182         .ascii     "U<"
      008548                       1183 ULESS:
      008548 A6 FF            [ 1] 1184         LD A,#0xFF  ;true
      00854A 90 93            [ 1] 1185         LDW Y,X    ;D = n2
      00854C 90 FE            [ 2] 1186         LDW Y,(Y)
      00854E 90 BF 1E         [ 2] 1187         LDW YTEMP,Y
      008551 1C 00 02         [ 2] 1188         ADDW X,#2
      008554 90 93            [ 1] 1189         LDW Y,X
      008556 90 FE            [ 2] 1190         LDW Y,(Y)
      008558 90 B3 1E         [ 2] 1191         CPW Y,YTEMP     ;if n2 <> n1
      00855B 25 01            [ 1] 1192         JRULT     ULES1
      00855D 4F               [ 1] 1193         CLR A
      00855E F7               [ 1] 1194 ULES1:  LD (X),A
      00855F E7 01            [ 1] 1195         LD (1,X),A
      008561 81               [ 4] 1196 	RET     
                                   1197 
                                   1198 ;       <       ( n1 n2 -- t )
                                   1199 ;       Signed compare of top two items.
      008562 85 45                 1200         .word      LINK
                           0004E4  1201 LINK = . 
      008564 01                    1202         .byte      1
      008565 3C                    1203         .ascii     "<"
      008566                       1204 LESS:
      008566 A6 FF            [ 1] 1205         LD A,#0xFF  ;true
      008568 90 93            [ 1] 1206         LDW Y,X    ;D = n2
      00856A 90 FE            [ 2] 1207         LDW Y,(Y)
      00856C 90 BF 1E         [ 2] 1208         LDW YTEMP,Y
      00856F 1C 00 02         [ 2] 1209         ADDW X,#2
      008572 90 93            [ 1] 1210         LDW Y,X
      008574 90 FE            [ 2] 1211         LDW Y,(Y)
      008576 90 B3 1E         [ 2] 1212         CPW Y,YTEMP     ;if n2 <> n1
      008579 2F 01            [ 1] 1213         JRSLT     LT1
      00857B 4F               [ 1] 1214         CLR A
      00857C F7               [ 1] 1215 LT1:    LD (X),A
      00857D E7 01            [ 1] 1216         LD (1,X),A
      00857F 81               [ 4] 1217 	RET     
                                   1218 
                                   1219 ;       MAX     ( n n -- n )
                                   1220 ;       Return greater of two top items.
      008580 85 64                 1221         .word      LINK
                           000502  1222 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]



      008582 03                    1223         .byte      3
      008583 4D 41 58              1224         .ascii     "MAX"
      008586                       1225 MAX:
      008586 90 93            [ 1] 1226         LDW Y,X    ;D = n2
      008588 90 EE 02         [ 2] 1227         LDW Y,(2,Y)
      00858B 90 BF 1E         [ 2] 1228         LDW YTEMP,Y
      00858E 90 93            [ 1] 1229         LDW Y,X
      008590 90 FE            [ 2] 1230         LDW Y,(Y)
      008592 90 B3 1E         [ 2] 1231         CPW Y,YTEMP     ;if n2 <> n1
      008595 2F 02            [ 1] 1232         JRSLT     MAX1
      008597 EF 02            [ 2] 1233         LDW (2,X),Y
      008599 1C 00 02         [ 2] 1234 MAX1:   ADDW X,#2
      00859C 81               [ 4] 1235 	RET     
                                   1236 
                                   1237 ;       MIN     ( n n -- n )
                                   1238 ;       Return smaller of top two items.
      00859D 85 82                 1239         .word      LINK
                           00051F  1240 LINK = . 
      00859F 03                    1241         .byte      3
      0085A0 4D 49 4E              1242         .ascii     "MIN"
      0085A3                       1243 MIN:
      0085A3 90 93            [ 1] 1244         LDW Y,X    ;D = n2
      0085A5 90 EE 02         [ 2] 1245         LDW Y,(2,Y)
      0085A8 90 BF 1E         [ 2] 1246         LDW YTEMP,Y
      0085AB 90 93            [ 1] 1247         LDW Y,X
      0085AD 90 FE            [ 2] 1248         LDW Y,(Y)
      0085AF 90 B3 1E         [ 2] 1249         CPW Y,YTEMP     ;if n2 <> n1
      0085B2 2C 02            [ 1] 1250         JRSGT     MIN1
      0085B4 EF 02            [ 2] 1251         LDW (2,X),Y
      0085B6 1C 00 02         [ 2] 1252 MIN1:	ADDW X,#2
      0085B9 81               [ 4] 1253 	RET     
                                   1254 
                                   1255 ;       WITHIN  ( u ul uh -- t )
                                   1256 ;       Return true if u is within
                                   1257 ;       range of ul and uh. ( ul <= u < uh )
      0085BA 85 9F                 1258         .word      LINK
                           00053C  1259 LINK = . 
      0085BC 06                    1260         .byte      6
      0085BD 57 49 54 48 49 4E     1261         .ascii     "WITHIN"
      0085C3                       1262 WITHI:
      0085C3 CD 83 11         [ 4] 1263         CALL     OVER
      0085C6 CD 85 01         [ 4] 1264         CALL     SUBB
      0085C9 CD 82 B0         [ 4] 1265         CALL     TOR
      0085CC CD 85 01         [ 4] 1266         CALL     SUBB
      0085CF CD 82 91         [ 4] 1267         CALL     RFROM
      0085D2 CC 85 48         [ 2] 1268         JP     ULESS
                                   1269 
                                   1270 ;; Divide
                                   1271 
                                   1272 ;       UM/MOD  ( udl udh un -- ur uq )
                                   1273 ;       Unsigned divide of a double by a
                                   1274 ;       single. Return mod and quotient.
      0085D5 85 BC                 1275         .word      LINK
                           000557  1276 LINK = . 
      0085D7 06                    1277         .byte      6
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



      0085D8 55 4D 2F 4D 4F 44     1278         .ascii     "UM/MOD"
      0085DE                       1279 UMMOD:
      0085DE BF 1C            [ 2] 1280 	LDW XTEMP,X	; save stack pointer
      0085E0 FE               [ 2] 1281 	LDW X,(X)	; un
      0085E1 BF 1E            [ 2] 1282 	LDW YTEMP,X     ; save un
      0085E3 90 BE 1C         [ 2] 1283 	LDW Y,XTEMP	; stack pointer
      0085E6 90 EE 04         [ 2] 1284 	LDW Y,(4,Y)     ; Y=udl
      0085E9 BE 1C            [ 2] 1285 	LDW X,XTEMP
      0085EB EE 02            [ 2] 1286 	LDW X,(2,X)	; X=udh
      0085ED B3 1E            [ 2] 1287 	CPW X,YTEMP
      0085EF 23 0F            [ 2] 1288 	JRULE MMSM1
      0085F1 BE 1C            [ 2] 1289 	LDW X,XTEMP
      0085F3 1C 00 02         [ 2] 1290 	ADDW X,#2	; pop off 1 level
      0085F6 90 AE FF FF      [ 2] 1291 	LDW Y,#0xFFFF
      0085FA FF               [ 2] 1292 	LDW (X),Y
      0085FB 90 5F            [ 1] 1293 	CLRW Y
      0085FD EF 02            [ 2] 1294 	LDW (2,X),Y
      0085FF 81               [ 4] 1295 	RET
      008600                       1296 MMSM1:
                           000001  1297 .if  PICATOUT_MOD 
                                   1298 ; take advantage of divw x,y when udh==0
      008600 5D               [ 2] 1299         tnzw x  ; is udh==0?
      008601 26 11            [ 1] 1300         jrne MMSM2 
      008603 93               [ 1] 1301         ldw x,y    ;udl 
      008604 90 BE 1E         [ 2] 1302         ldw y,YTEMP ; divisor 
      008607 65               [ 2] 1303         divw x,y 
      008608 89               [ 2] 1304         pushw x     ; quotient 
      008609 BE 1C            [ 2] 1305         ldw x,XTEMP 
      00860B 1C 00 02         [ 2] 1306         addw x,#CELLL 
      00860E EF 02            [ 2] 1307         ldw (2,x),y  ; ur
      008610 90 85            [ 2] 1308         popw y 
      008612 FF               [ 2] 1309         ldw (x),y ; uq 
      008613 81               [ 4] 1310         ret 
      008614                       1311 MMSM2:        
                                   1312 .endif 
      008614 A6 11            [ 1] 1313 	LD A,#17	; loop count
      008616                       1314 MMSM3:
      008616 B3 1E            [ 2] 1315 	CPW X,YTEMP	; compare udh to un
      008618 25 04            [ 1] 1316 	JRULT MMSM4	; can't subtract
      00861A 72 B0 00 1E      [ 2] 1317 	SUBW X,YTEMP	; can subtract
      00861E                       1318 MMSM4:
      00861E 8C               [ 1] 1319 	CCF	; quotient bit
      00861F 90 59            [ 2] 1320 	RLCW Y	; rotate into quotient
      008621 59               [ 2] 1321 	RLCW X	; rotate into remainder
      008622 4A               [ 1] 1322 	DEC A	; repeat
      008623 22 F1            [ 1] 1323 	JRUGT MMSM3
      008625 57               [ 2] 1324 	SRAW X
      008626 BF 1E            [ 2] 1325 	LDW YTEMP,X	; done, save remainder
      008628 BE 1C            [ 2] 1326 	LDW X,XTEMP
      00862A 1C 00 02         [ 2] 1327 	ADDW X,#2	; drop
      00862D FF               [ 2] 1328 	LDW (X),Y
      00862E 90 BE 1E         [ 2] 1329 	LDW Y,YTEMP	; save quotient
      008631 EF 02            [ 2] 1330 	LDW (2,X),Y
      008633 81               [ 4] 1331 	RET
                                   1332 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



                                   1333 ;       M/MOD   ( d n -- r q )
                                   1334 ;       Signed floored divide of double by
                                   1335 ;       single. Return mod and quotient.
      008634 85 D7                 1336         .word      LINK
                           0005B6  1337 LINK = . 
      008636 05                    1338         .byte      5
      008637 4D 2F 4D 4F 44        1339         .ascii     "M/MOD"
      00863C                       1340 MSMOD:  
      00863C CD 82 E7         [ 4] 1341         CALL	DUPP
      00863F CD 83 20         [ 4] 1342         CALL	ZLESS
      008642 CD 82 E7         [ 4] 1343         CALL	DUPP
      008645 CD 82 B0         [ 4] 1344         CALL	TOR
      008648 CD 81 EB         [ 4] 1345         CALL	QBRAN
      00864B 86 59                 1346         .word	MMOD1
      00864D CD 84 CE         [ 4] 1347         CALL	NEGAT
      008650 CD 82 B0         [ 4] 1348         CALL	TOR
      008653 CD 84 E0         [ 4] 1349         CALL	DNEGA
      008656 CD 82 91         [ 4] 1350         CALL	RFROM
      008659 CD 82 B0         [ 4] 1351 MMOD1:	CALL	TOR
      00865C CD 82 E7         [ 4] 1352         CALL	DUPP
      00865F CD 83 20         [ 4] 1353         CALL	ZLESS
      008662 CD 81 EB         [ 4] 1354         CALL	QBRAN
      008665 86 6D                 1355         .word	MMOD2
      008667 CD 82 A4         [ 4] 1356         CALL	RAT
      00866A CD 84 A3         [ 4] 1357         CALL	PLUS
      00866D CD 82 91         [ 4] 1358 MMOD2:	CALL	RFROM
      008670 CD 85 DE         [ 4] 1359         CALL	UMMOD
      008673 CD 82 91         [ 4] 1360         CALL	RFROM
      008676 CD 81 EB         [ 4] 1361         CALL	QBRAN
      008679 86 84                 1362         .word	MMOD3
      00867B CD 82 F7         [ 4] 1363         CALL	SWAPP
      00867E CD 84 CE         [ 4] 1364         CALL	NEGAT
      008681 CD 82 F7         [ 4] 1365         CALL	SWAPP
      008684 81               [ 4] 1366 MMOD3:	RET
                                   1367 
                                   1368 ;       /MOD    ( n n -- r q )
                                   1369 ;       Signed divide. Return mod and quotient.
      008685 86 36                 1370         .word      LINK
                           000607  1371 LINK = . 
      008687 04                    1372         .byte      4
      008688 2F 4D 4F 44           1373         .ascii     "/MOD"
      00868C                       1374 SLMOD:
      00868C CD 83 11         [ 4] 1375         CALL	OVER
      00868F CD 83 20         [ 4] 1376         CALL	ZLESS
      008692 CD 82 F7         [ 4] 1377         CALL	SWAPP
      008695 CC 86 3C         [ 2] 1378         JP	MSMOD
                                   1379 
                                   1380 ;       MOD     ( n n -- r )
                                   1381 ;       Signed divide. Return mod only.
      008698 86 87                 1382         .word      LINK
                           00061A  1383 LINK = . 
      00869A 03                    1384         .byte      3
      00869B 4D 4F 44              1385         .ascii     "MOD"
      00869E                       1386 MODD:
      00869E CD 86 8C         [ 4] 1387 	CALL	SLMOD
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal [24-Bits]



      0086A1 CC 82 DD         [ 2] 1388 	JP	DROP
                                   1389 
                                   1390 ;       /       ( n n -- q )
                                   1391 ;       Signed divide. Return quotient only.
      0086A4 86 9A                 1392         .word      LINK
                           000626  1393 LINK = . 
      0086A6 01                    1394         .byte      1
      0086A7 2F                    1395         .ascii     "/"
      0086A8                       1396 SLASH:
      0086A8 CD 86 8C         [ 4] 1397         CALL	SLMOD
      0086AB CD 82 F7         [ 4] 1398         CALL	SWAPP
      0086AE CC 82 DD         [ 2] 1399         JP	DROP
                                   1400 
                                   1401 ;; Multiply
                                   1402 
                                   1403 ;       UM*     ( u u -- ud )
                                   1404 ;       Unsigned multiply. Return double product.
      0086B1 86 A6                 1405         .word      LINK
                           000633  1406 LINK = . 
      0086B3 03                    1407         .byte      3
      0086B4 55 4D 2A              1408         .ascii     "UM*"
      0086B7                       1409 UMSTA:	; stack have 4 bytes u1=a,b u2=c,d
                           000001  1410 .if PICATOUT_MOD 
                                   1411 ; take advantage of SP addressing modes
                                   1412 ; these PRODx in RAM are not required
                                   1413 ; the product is kept on stack as local variable 
                                   1414         ;; bytes offset on data stack 
                           000002  1415         da=2 
                           000003  1416         db=3 
                           000000  1417         dc=0 
                           000001  1418         dd=1 
                                   1419         ;; product bytes offset on return stack 
                           000001  1420         UD1=1  ; ud bits 31..24
                           000002  1421         UD2=2  ; ud bits 23..16
                           000003  1422         UD3=3  ; ud bits 15..8 
                           000004  1423         UD4=4  ; ud bits 7..0 
                                   1424         ;; local variable for product set to zero   
      0086B7 90 5F            [ 1] 1425         clrw y 
      0086B9 90 89            [ 2] 1426         pushw y  ; bits 15..0
      0086BB 90 89            [ 2] 1427         pushw y  ; bits 31..16 
      0086BD E6 03            [ 1] 1428         ld a,(db,x) ; b 
      0086BF 90 97            [ 1] 1429         ld yl,a 
      0086C1 E6 01            [ 1] 1430         ld a,(dd,x)   ; d
      0086C3 90 42            [ 4] 1431         mul y,a    ; b*d  
      0086C5 17 03            [ 2] 1432         ldw (UD3,sp),y ; lowest weight product 
      0086C7 E6 03            [ 1] 1433         ld a,(db,x)
      0086C9 90 97            [ 1] 1434         ld yl,a 
      0086CB E6 00            [ 1] 1435         ld a,(dc,x)
      0086CD 90 42            [ 4] 1436         mul y,a  ; b*c 
                                   1437         ;;; do the partial sum 
      0086CF 72 F9 02         [ 2] 1438         addw y,(UD2,sp)
      0086D2 4F               [ 1] 1439         clr a 
      0086D3 49               [ 1] 1440         rlc a
      0086D4 6B 01            [ 1] 1441         ld (UD1,sp),a 
      0086D6 17 02            [ 2] 1442         ldw (UD2,sp),y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



      0086D8 E6 02            [ 1] 1443         ld a,(da,x)
      0086DA 90 97            [ 1] 1444         ld yl,a 
      0086DC E6 01            [ 1] 1445         ld a,(dd,x)
      0086DE 90 42            [ 4] 1446         mul y,a   ; a*d 
                                   1447         ;; do partial sum 
      0086E0 72 F9 02         [ 2] 1448         addw y,(UD2,sp)
      0086E3 4F               [ 1] 1449         clr a 
      0086E4 19 01            [ 1] 1450         adc a,(UD1,sp)
      0086E6 6B 01            [ 1] 1451         ld (UD1,sp),a  
      0086E8 17 02            [ 2] 1452         ldw (UD2,sp),y 
      0086EA E6 02            [ 1] 1453         ld a,(da,x)
      0086EC 90 97            [ 1] 1454         ld yl,a 
      0086EE E6 00            [ 1] 1455         ld a,(dc,x)
      0086F0 90 42            [ 4] 1456         mul y,a  ;  a*c highest weight product 
                                   1457         ;;; do partial sum 
      0086F2 72 F9 01         [ 2] 1458         addw y,(UD1,sp)
      0086F5 FF               [ 2] 1459         ldw (x),y  ; udh 
      0086F6 16 03            [ 2] 1460         ldw y,(UD3,sp)
      0086F8 EF 02            [ 2] 1461         ldw (2,x),y  ; udl  
      0086FA 5B 04            [ 2] 1462         addw sp,#4 ; drop local variable 
      0086FC 81               [ 4] 1463         ret  
                           000000  1464 .else
                                   1465 	LD A,(2,X)	; b
                                   1466 	LD YL,A
                                   1467 	LD A,(X)	; d
                                   1468 	MUL Y,A
                                   1469 	LDW PROD1,Y
                                   1470 	LD A,(3,X)	; a
                                   1471 	LD YL,A
                                   1472 	LD A,(X)	; d
                                   1473 	MUL Y,A
                                   1474 	LDW PROD2,Y
                                   1475 	LD A,(2,X)	; b
                                   1476 	LD YL,A
                                   1477 	LD A,(1,X)	; c
                                   1478 	MUL Y,A
                                   1479 	LDW PROD3,Y
                                   1480 	LD A,(3,X)	; a
                                   1481 	LD YL,A
                                   1482 	LD A,(1,X)	; c
                                   1483 	MUL Y,A	; least signifiant product
                                   1484 	CLR A
                                   1485 	RRWA Y
                                   1486 	LD (3,X),A	; store least significant byte
                                   1487 	ADDW Y,PROD3
                                   1488 	CLR A
                                   1489 	ADC A,#0	; save carry
                                   1490 	LD CARRY,A
                                   1491 	ADDW Y,PROD2
                                   1492 	LD A,CARRY
                                   1493 	ADC A,#0	; add 2nd carry
                                   1494 	LD CARRY,A
                                   1495 	CLR A
                                   1496 	RRWA Y
                                   1497 	LD (2,X),A	; 2nd product byte
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



                                   1498 	ADDW Y,PROD1
                                   1499 	RRWA Y
                                   1500 	LD (1,X),A	; 3rd product byte
                                   1501 	RRWA Y  	; 4th product byte now in A
                                   1502 	ADC A,CARRY	; fill in carry bits
                                   1503 	LD (X),A
                                   1504 	RET
                                   1505 .endif 
                                   1506 
                                   1507 
                                   1508 ;       *       ( n n -- n )
                                   1509 ;       Signed multiply. Return single product.
      0086FD 86 B3                 1510         .word      LINK
                           00067F  1511 LINK = . 
      0086FF 01                    1512         .byte      1
      008700 2A                    1513         .ascii     "*"
      008701                       1514 STAR:
      008701 CD 86 B7         [ 4] 1515 	CALL	UMSTA
      008704 CC 82 DD         [ 2] 1516 	JP	DROP
                                   1517 
                                   1518 ;       M*      ( n n -- d )
                                   1519 ;       Signed multiply. Return double product.
      008707 86 FF                 1520         .word      LINK
                           000689  1521 LINK = . 
      008709 02                    1522         .byte      2
      00870A 4D 2A                 1523         .ascii     "M*"
      00870C                       1524 MSTAR:      
      00870C CD 84 8E         [ 4] 1525         CALL	DDUP
      00870F CD 83 5C         [ 4] 1526         CALL	XORR
      008712 CD 83 20         [ 4] 1527         CALL	ZLESS
      008715 CD 82 B0         [ 4] 1528         CALL	TOR
      008718 CD 85 1B         [ 4] 1529         CALL	ABSS
      00871B CD 82 F7         [ 4] 1530         CALL	SWAPP
      00871E CD 85 1B         [ 4] 1531         CALL	ABSS
      008721 CD 86 B7         [ 4] 1532         CALL	UMSTA
      008724 CD 82 91         [ 4] 1533         CALL	RFROM
      008727 CD 81 EB         [ 4] 1534         CALL	QBRAN
      00872A 87 2F                 1535         .word	MSTA1
      00872C CD 84 E0         [ 4] 1536         CALL	DNEGA
      00872F 81               [ 4] 1537 MSTA1:	RET
                                   1538 
                                   1539 ;       . /MOD   ( n1 n2 n3 -- r q )
                                   1540 ;       Multiply n1 and n2, then divide
                                   1541 ;       by n3. Return mod and quotient.
      008730 87 09                 1542         .word      LINK
                           0006B2  1543 LINK = . 
      008732 05                    1544         .byte      5
      008733 2A 2F 4D 4F 44        1545         .ascii     "*/MOD"
      008738                       1546 SSMOD:
      008738 CD 82 B0         [ 4] 1547         CALL     TOR
      00873B CD 87 0C         [ 4] 1548         CALL     MSTAR
      00873E CD 82 91         [ 4] 1549         CALL     RFROM
      008741 CC 86 3C         [ 2] 1550         JP     MSMOD
                                   1551 
                                   1552 ;       */      ( n1 n2 n3 -- q )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



                                   1553 ;       Multiply n1 by n2, then divide
                                   1554 ;       by n3. Return quotient only.
      008744 87 32                 1555         .word      LINK
                           0006C6  1556 LINK = . 
      008746 02                    1557         .byte      2
      008747 2A 2F                 1558         .ascii     "*/"
      008749                       1559 STASL:
      008749 CD 87 38         [ 4] 1560         CALL	SSMOD
      00874C CD 82 F7         [ 4] 1561         CALL	SWAPP
      00874F CC 82 DD         [ 2] 1562         JP	DROP
                                   1563 
                                   1564 ;; Miscellaneous
                                   1565 
                                   1566 ;       CELL+   ( a -- a )
                                   1567 ;       Add cell size in byte to address.
      008752 87 46                 1568         .word      LINK
                           0006D4  1569 LINK = . 
      008754 02                    1570         .byte       2
      008755 32 2B                 1571         .ascii     "2+"
      008757                       1572 CELLP:
      008757 90 93            [ 1] 1573         LDW Y,X
      008759 90 FE            [ 2] 1574 	LDW Y,(Y)
      00875B 72 A9 00 02      [ 2] 1575         ADDW Y,#CELLL 
      00875F FF               [ 2] 1576         LDW (X),Y
      008760 81               [ 4] 1577         RET
                                   1578 
                                   1579 ;       CELL-   ( a -- a )
                                   1580 ;       Subtract 2 from address.
      008761 87 54                 1581         .word      LINK
                           0006E3  1582 LINK = . 
      008763 02                    1583         .byte       2
      008764 32 2D                 1584         .ascii     "2-"
      008766                       1585 CELLM:
      008766 90 93            [ 1] 1586         LDW Y,X
      008768 90 FE            [ 2] 1587 	LDW Y,(Y)
      00876A 72 A2 00 02      [ 2] 1588         SUBW Y,#CELLL
      00876E FF               [ 2] 1589         LDW (X),Y
      00876F 81               [ 4] 1590         RET
                                   1591 
                                   1592 ;       CELLS   ( n -- n )
                                   1593 ;       Multiply tos by 2.
      008770 87 63                 1594         .word      LINK
                           0006F2  1595 LINK = . 
      008772 02                    1596         .byte       2
      008773 32 2A                 1597         .ascii     "2*"
      008775                       1598 CELLS:
      008775 90 93            [ 1] 1599         LDW Y,X
      008777 90 FE            [ 2] 1600 	LDW Y,(Y)
      008779 90 58            [ 2] 1601         SLAW Y
      00877B FF               [ 2] 1602         LDW (X),Y
      00877C 81               [ 4] 1603         RET
                                   1604 
                                   1605 ;       1+      ( a -- a )
                                   1606 ;       Add cell size in byte to address.
      00877D 87 72                 1607         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



                           0006FF  1608 LINK = . 
      00877F 02                    1609         .byte      2
      008780 31 2B                 1610         .ascii     "1+"
      008782                       1611 ONEP:
      008782 90 93            [ 1] 1612         LDW Y,X
      008784 90 FE            [ 2] 1613 	LDW Y,(Y)
      008786 90 5C            [ 2] 1614         INCW Y
      008788 FF               [ 2] 1615         LDW (X),Y
      008789 81               [ 4] 1616         RET
                                   1617 
                                   1618 ;       1-      ( a -- a )
                                   1619 ;       Subtract 2 from address.
      00878A 87 7F                 1620         .word      LINK
                           00070C  1621 LINK = . 
      00878C 02                    1622         .byte      2
      00878D 31 2D                 1623         .ascii     "1-"
      00878F                       1624 ONEM:
      00878F 90 93            [ 1] 1625         LDW Y,X
      008791 90 FE            [ 2] 1626 	LDW Y,(Y)
      008793 90 5A            [ 2] 1627         DECW Y
      008795 FF               [ 2] 1628         LDW (X),Y
      008796 81               [ 4] 1629         RET
                                   1630 
                                   1631 ;       2/      ( n -- n )
                                   1632 ;       Multiply tos by 2.
      008797 87 8C                 1633         .word      LINK
                           000719  1634 LINK = . 
      008799 02                    1635         .byte      2
      00879A 32 2F                 1636         .ascii     "2/"
      00879C                       1637 TWOSL:
      00879C 90 93            [ 1] 1638         LDW Y,X
      00879E 90 FE            [ 2] 1639 	LDW Y,(Y)
      0087A0 90 57            [ 2] 1640         SRAW Y
      0087A2 FF               [ 2] 1641         LDW (X),Y
      0087A3 81               [ 4] 1642         RET
                                   1643 
                                   1644 ;       BL      ( -- 32 )
                                   1645 ;       Return 32,  blank character.
      0087A4 87 99                 1646         .word      LINK
                           000726  1647 LINK = . 
      0087A6 02                    1648         .byte      2
      0087A7 42 4C                 1649         .ascii     "BL"
      0087A9                       1650 BLANK:
      0087A9 1D 00 02         [ 2] 1651         SUBW X,#2
      0087AC 90 AE 00 20      [ 2] 1652 	LDW Y,#32
      0087B0 FF               [ 2] 1653         LDW (X),Y
      0087B1 81               [ 4] 1654         RET
                                   1655 
                                   1656 ;         0     ( -- 0)
                                   1657 ;         Return 0.
      0087B2 87 A6                 1658         .word      LINK
                           000734  1659 LINK = . 
      0087B4 01                    1660         .byte       1
      0087B5 30                    1661         .ascii     "0"
      0087B6                       1662 ZERO:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



      0087B6 1D 00 02         [ 2] 1663         SUBW X,#2
      0087B9 90 5F            [ 1] 1664 	CLRW Y
      0087BB FF               [ 2] 1665         LDW (X),Y
      0087BC 81               [ 4] 1666         RET
                                   1667 
                                   1668 ;         1     ( -- 1)
                                   1669 ;         Return 1.
      0087BD 87 B4                 1670         .word      LINK
                           00073F  1671 LINK = . 
      0087BF 01                    1672         .byte       1
      0087C0 31                    1673         .ascii     "1"
      0087C1                       1674 ONE:
      0087C1 1D 00 02         [ 2] 1675         SUBW X,#2
      0087C4 90 AE 00 01      [ 2] 1676 	LDW Y,#1
      0087C8 FF               [ 2] 1677         LDW (X),Y
      0087C9 81               [ 4] 1678         RET
                                   1679 
                                   1680 ;         -1    ( -- -1)
                                   1681 ;         Return 32,  blank character.
      0087CA 87 BF                 1682         .word      LINK
                           00074C  1683 LINK = . 
      0087CC 02                    1684         .byte       2
      0087CD 2D 31                 1685         .ascii     "-1"
      0087CF                       1686 MONE:
      0087CF 1D 00 02         [ 2] 1687         SUBW X,#2
      0087D2 90 AE FF FF      [ 2] 1688 	LDW Y,#0xFFFF
      0087D6 FF               [ 2] 1689         LDW (X),Y
      0087D7 81               [ 4] 1690         RET
                                   1691 
                                   1692 ;       >CHAR   ( c -- c )
                                   1693 ;       Filter non-printing characters.
      0087D8 87 CC                 1694         .word      LINK
                           00075A  1695 LINK = . 
      0087DA 05                    1696         .byte      5
      0087DB 3E 43 48 41 52        1697         .ascii     ">CHAR"
      0087E0                       1698 TCHAR:
                           000001  1699 .if CONVERT_TO_CODE
      0087E0 E6 01            [ 1] 1700         ld a,(1,x)
      0087E2 A1 20            [ 1] 1701         cp a,#32  
      0087E4 2B 05            [ 1] 1702         jrmi 1$ 
      0087E6 A1 7F            [ 1] 1703         cp a,#127 
      0087E8 2A 01            [ 1] 1704         jrpl 1$ 
      0087EA 81               [ 4] 1705         ret 
      0087EB A6 5F            [ 1] 1706 1$:     ld a,#'_ 
      0087ED E7 01            [ 1] 1707         ld (1,x),a 
      0087EF 81               [ 4] 1708         ret 
                           000000  1709 .else
                                   1710         CALL     DOLIT
                                   1711         .word       0x7F
                                   1712         CALL     ANDD
                                   1713         CALL     DUPP    ;mask msb
                                   1714         CALL     DOLIT
                                   1715         .word      127
                                   1716         CALL     BLANK
                                   1717         CALL     WITHI   ;check for printable
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



                                   1718         CALL     QBRAN
                                   1719         .word    TCHA1
                                   1720         CALL     DROP
                                   1721         CALL     DOLIT
                                   1722         .word     0x5F		; "_"     ;replace non-printables
                                   1723 .endif 
      0087F0 81               [ 4] 1724 TCHA1:  RET
                                   1725 
                                   1726 ;       DEPTH   ( -- n )
                                   1727 ;       Return  depth of  data stack.
      0087F1 87 DA                 1728         .word      LINK
                           000773  1729 LINK = . 
      0087F3 05                    1730         .byte      5
      0087F4 44 45 50 54 48        1731         .ascii     "DEPTH"
      0087F9                       1732 DEPTH: 
      0087F9 90 BE 24         [ 2] 1733         LDW Y,SP0    ;save data stack ptr
      0087FC BF 1C            [ 2] 1734 	LDW XTEMP,X
      0087FE 72 B2 00 1C      [ 2] 1735         SUBW Y,XTEMP     ;#bytes = SP0 - X
      008802 90 57            [ 2] 1736         SRAW Y    ;Y = #stack items
                           000001  1737 .if PICATOUT_MOD
                                   1738 ; why ? 
                                   1739 ;      	DECW Y
                                   1740 .endif 
      008804 1D 00 02         [ 2] 1741 	SUBW X,#2
      008807 FF               [ 2] 1742         LDW (X),Y     ; if neg, underflow
      008808 81               [ 4] 1743         RET
                                   1744 
                                   1745 ;       PICK    ( ... +n -- ... w )
                                   1746 ;       Copy  nth stack item to tos.
      008809 87 F3                 1747         .word      LINK
                           00078B  1748 LINK = . 
      00880B 04                    1749         .byte      4
      00880C 50 49 43 4B           1750         .ascii     "PICK"
      008810                       1751 PICK:
      008810 90 93            [ 1] 1752         LDW Y,X   ;D = n1
      008812 90 FE            [ 2] 1753         LDW Y,(Y)
      008814 90 58            [ 2] 1754         SLAW Y
      008816 BF 1C            [ 2] 1755         LDW XTEMP,X
      008818 72 B9 00 1C      [ 2] 1756         ADDW Y,XTEMP
      00881C 90 FE            [ 2] 1757         LDW Y,(Y)
      00881E FF               [ 2] 1758         LDW (X),Y
      00881F 81               [ 4] 1759         RET
                                   1760 
                                   1761 ;; Memory access
                                   1762 
                                   1763 ;       +!      ( n a -- )
                                   1764 ;       Add n to  contents at address a.
      008820 88 0B                 1765         .word      LINK
                           0007A2  1766 LINK = . 
      008822 02                    1767         .byte      2
      008823 2B 21                 1768         .ascii     "+!"
      008825                       1769 PSTOR:
                           000001  1770 .if CONVERT_TO_CODE
      008825 90 93            [ 1] 1771         ldw y,x 
      008827 90 FE            [ 2] 1772         ldw y,(y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



      008829 90 BF 1E         [ 2] 1773         ldw YTEMP,y  ; address
      00882C 90 FE            [ 2] 1774         ldw y,(y)  
      00882E 90 89            [ 2] 1775         pushw y  ; value at address 
      008830 90 93            [ 1] 1776         ldw y,x 
      008832 90 EE 02         [ 2] 1777         ldw y,(2,y) ; n 
      008835 72 F9 01         [ 2] 1778         addw y,(1,sp) ; n+value
      008838 91 CF 1E         [ 5] 1779         ldw [YTEMP],y ;  a!
      00883B 90 85            [ 2] 1780         popw y    ;drop local var
      00883D 1C 00 04         [ 2] 1781         addw x,#4 ; DDROP 
      008840 81               [ 4] 1782         ret 
                           000000  1783 .else
                                   1784         CALL	SWAPP
                                   1785         CALL	OVER
                                   1786         CALL	AT
                                   1787         CALL	PLUS
                                   1788         CALL	SWAPP
                                   1789         JP	STORE
                                   1790 .endif 
                                   1791 ;       2!      ( d a -- )
                                   1792 ;       Store  double integer to address a.
      008841 88 22                 1793         .word      LINK
                           0007C3  1794 LINK = . 
      008843 02                    1795         .byte      2
      008844 32 21                 1796         .ascii     "2!"
      008846                       1797 DSTOR:
                           000001  1798 .if CONVERT_TO_CODE
      008846 90 93            [ 1] 1799         ldw y,x 
      008848 90 FE            [ 2] 1800         ldw y,(y)
      00884A 90 BF 1E         [ 2] 1801         ldw YTEMP,y ; address 
      00884D 1C 00 02         [ 2] 1802         addw x,#CELLL ; drop a 
      008850 90 93            [ 1] 1803         ldw y,x 
      008852 90 FE            [ 2] 1804         ldw y,(y) ; hi word 
      008854 89               [ 2] 1805         pushw x 
      008855 EE 02            [ 2] 1806         ldw x,(2,x) ; lo word 
      008857 91 CF 1E         [ 5] 1807         ldw [YTEMP],y
      00885A 90 93            [ 1] 1808         ldw y,x 
      00885C AE 00 02         [ 2] 1809         ldw x,#2 
      00885F 92 DF 1E         [ 5] 1810         ldw ([YTEMP],x),y 
      008862 85               [ 2] 1811         popw x 
      008863 1C 00 04         [ 2] 1812         addw x,#4 ; DDROP 
      008866 81               [ 4] 1813         ret 
                           000000  1814 .else
                                   1815         CALL	SWAPP
                                   1816         CALL	OVER
                                   1817         CALL	STORE
                                   1818         CALL	CELLP
                                   1819         JP	STORE
                                   1820 .endif 
                                   1821 ;       2@      ( a -- d )
                                   1822 ;       Fetch double integer from address a.
      008867 88 43                 1823         .word      LINK
                           0007E9  1824 LINK = . 
      008869 02                    1825         .byte      2
      00886A 32 40                 1826         .ascii     "2@"
      00886C                       1827 DAT:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



                           000001  1828 .if CONVERT_TO_CODE
      00886C 90 93            [ 1] 1829         ldw y,x 
      00886E 90 FE            [ 2] 1830         ldw y,(y) ;address 
      008870 90 BF 1E         [ 2] 1831         ldw YTEMP,y 
      008873 1D 00 02         [ 2] 1832         subw x,#CELLL ; space for udh 
      008876 91 CE 1E         [ 5] 1833         ldw y,[YTEMP] ; udh 
      008879 FF               [ 2] 1834         ldw (x),y 
      00887A 90 AE 00 02      [ 2] 1835         ldw y,#2
      00887E 91 DE 1E         [ 5] 1836         ldw y,([YTEMP],y) ; udl 
      008881 EF 02            [ 2] 1837         ldw (2,x),y
      008883 81               [ 4] 1838         ret 
                           000000  1839 .else 
                                   1840         CALL	DUPP
                                   1841         CALL	CELLP
                                   1842         CALL	AT
                                   1843         CALL	SWAPP
                                   1844         JP	AT
                                   1845 .endif 
                                   1846 
                                   1847 ;       COUNT   ( b -- b +n )
                                   1848 ;       Return count byte of a string
                                   1849 ;       and add 1 to byte address.
      008884 88 69                 1850         .word      LINK
                           000806  1851 LINK = . 
      008886 05                    1852         .byte      5
      008887 43 4F 55 4E 54        1853         .ascii     "COUNT"
      00888C                       1854 COUNT:
                           000001  1855 .if CONVERT_TO_CODE
      00888C 90 93            [ 1] 1856         ldw y,x 
      00888E 90 FE            [ 2] 1857         ldw y,(y) ; address 
      008890 90 F6            [ 1] 1858         ld a,(y)  ; count 
      008892 90 5C            [ 2] 1859         incw y 
      008894 FF               [ 2] 1860         ldw (x),y 
      008895 1D 00 02         [ 2] 1861         subw x,#CELLL 
      008898 E7 01            [ 1] 1862         ld (1,x),a 
      00889A 7F               [ 1] 1863         clr (x)
      00889B 81               [ 4] 1864         ret 
                           000000  1865 .else 
                                   1866         CALL     DUPP
                                   1867         CALL     ONEP
                                   1868         CALL     SWAPP
                                   1869         JP     CAT
                                   1870 .endif 
                                   1871 
                                   1872 ;       HERE    ( -- a )
                                   1873 ;       Return  top of  code dictionary.
      00889C 88 86                 1874         .word      LINK
                           00081E  1875 LINK = . 
      00889E 04                    1876         .byte      4
      00889F 48 45 52 45           1877         .ascii     "HERE"
      0088A3                       1878 HERE:
                           000001  1879 .if CONVERT_TO_CODE
      0088A3 90 AE 00 16      [ 2] 1880       	ldw y,#UCP 
      0088A7 90 FE            [ 2] 1881         ldw y,(y)
      0088A9 1D 00 02         [ 2] 1882         subw x,#CELLL 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



      0088AC FF               [ 2] 1883         ldw (x),y 
      0088AD 81               [ 4] 1884         ret 
                           000000  1885 .else
                                   1886         CALL     CPP
                                   1887         JP     AT
                                   1888 .endif 
                                   1889 
                                   1890 ;       PAD     ( -- a )
                                   1891 ;       Return address of text buffer
                                   1892 ;       above  code dictionary.
      0088AE 88 9E                 1893         .word      LINK
                           000830  1894 LINK = . 
      0088B0 03                    1895         .byte      3
      0088B1 50 41 44              1896         .ascii     "PAD"
      0088B4                       1897 PAD:
      0088B4 CD 88 A3         [ 4] 1898         CALL     HERE
      0088B7 CD 81 B8         [ 4] 1899         CALL     DOLIT
      0088BA 00 50                 1900         .word      80
      0088BC CC 84 A3         [ 2] 1901         JP     PLUS
                                   1902 
                                   1903 ;       TIB     ( -- a )
                                   1904 ;       Return address of terminal input buffer.
      0088BF 88 B0                 1905         .word      LINK
                           000841  1906 LINK = . 
      0088C1 03                    1907         .byte      3
      0088C2 54 49 42              1908         .ascii     "TIB"
      0088C5                       1909 TIB:
      0088C5 CD 83 D2         [ 4] 1910         CALL     NTIB
      0088C8 CD 87 57         [ 4] 1911         CALL     CELLP
      0088CB CC 82 40         [ 2] 1912         JP     AT
                                   1913 
                                   1914 ;       @EXECUTE        ( a -- )
                                   1915 ;       Execute vector stored in address a.
      0088CE 88 C1                 1916         .word      LINK
                           000850  1917 LINK = . 
      0088D0 08                    1918         .byte      8
      0088D1 40 45 58 45 43 55 54  1919         .ascii     "@EXECUTE"
             45
      0088D9                       1920 ATEXE:
      0088D9 CD 82 40         [ 4] 1921         CALL     AT
      0088DC CD 84 52         [ 4] 1922         CALL     QDUP    ;?address or zero
      0088DF CD 81 EB         [ 4] 1923         CALL     QBRAN
      0088E2 88 E7                 1924         .word      EXE1
      0088E4 CD 82 12         [ 4] 1925         CALL     EXECU   ;execute if non-zero
      0088E7 81               [ 4] 1926 EXE1:   RET     ;do nothing if zero
                                   1927 
                                   1928 ;       CMOVE   ( b1 b2 u -- )
                                   1929 ;       Copy u bytes from b1 to b2.
      0088E8 88 D0                 1930         .word      LINK
                           00086A  1931 LINK = . 
      0088EA 05                    1932         .byte      5
      0088EB 43 4D 4F 56 45        1933         .ascii     "CMOVE"
      0088F0                       1934 CMOVE:
      0088F0 CD 82 B0         [ 4] 1935         CALL	TOR
      0088F3 CD 82 02         [ 4] 1936         CALL	BRAN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



      0088F6 89 10                 1937         .word	CMOV2
      0088F8 CD 82 B0         [ 4] 1938 CMOV1:	CALL	TOR
      0088FB CD 82 E7         [ 4] 1939         CALL	DUPP
      0088FE CD 82 5E         [ 4] 1940         CALL	CAT
      008901 CD 82 A4         [ 4] 1941         CALL	RAT
      008904 CD 82 4D         [ 4] 1942         CALL	CSTOR
      008907 CD 87 82         [ 4] 1943         CALL	ONEP
      00890A CD 82 91         [ 4] 1944         CALL	RFROM
      00890D CD 87 82         [ 4] 1945         CALL	ONEP
      008910 CD 81 CC         [ 4] 1946 CMOV2:	CALL	DONXT
      008913 88 F8                 1947         .word	CMOV1
      008915 CC 84 83         [ 2] 1948         JP	DDROP
                                   1949 
                                   1950 ;       FILL    ( b u c -- )
                                   1951 ;       Fill u bytes of character c
                                   1952 ;       to area beginning at b.
      008918 88 EA                 1953         .word       LINK
                           00089A  1954 LINK = . 
      00891A 04                    1955         .byte       4
      00891B 46 49 4C 4C           1956         .ascii     "FILL"
      00891F                       1957 FILL:
                           000001  1958 .if CONVERT_TO_CODE
      00891F 90 93            [ 1] 1959         ldw y,x 
      008921 90 E6 01         [ 1] 1960         ld a,(1,y) ; c 
      008924 1C 00 02         [ 2] 1961         addw x,#CELLL ; drop c 
      008927 90 93            [ 1] 1962         ldw y,x 
      008929 90 FE            [ 2] 1963         ldw y,(y) ; count
      00892B 90 89            [ 2] 1964         pushw y 
      00892D 1C 00 02         [ 2] 1965         addw x,#CELLL ; drop u 
      008930 90 93            [ 1] 1966         ldw y,x 
      008932 1C 00 02         [ 2] 1967         addw x,#CELLL ; drop b 
      008935 90 FE            [ 2] 1968         ldw y,(y) ; address
      008937 90 BF 1E         [ 2] 1969         ldw YTEMP,y
      00893A 90 85            [ 2] 1970         popw y ; count 
      00893C                       1971 FILL1:  
      00893C 92 C7 1E         [ 4] 1972         ld [YTEMP],a 
      00893F 3C 1F            [ 1] 1973         inc YTEMP+1
      008941 24 02            [ 1] 1974         jrnc FILL2 
      008943 3C 1E            [ 1] 1975         inc YTEMP
      008945                       1976 FILL2: 
      008945 90 5A            [ 2] 1977         decw y ; count 
      008947 26 F3            [ 1] 1978         jrne FILL1  
      008949 81               [ 4] 1979         ret 
                           000000  1980 .else 
                                   1981         CALL	SWAPP
                                   1982         CALL	TOR
                                   1983         CALL	SWAPP
                                   1984         CALL	BRAN
                                   1985         .word	FILL2
                                   1986 FILL1:	CALL	DDUP
                                   1987         CALL	CSTOR
                                   1988         CALL	ONEP
                                   1989 FILL2:	CALL	DONXT
                                   1990         .word	FILL1
                                   1991         JP	DDROP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



                                   1992 .endif
                                   1993 
                                   1994 ;       ERASE   ( b u -- )
                                   1995 ;       Erase u bytes beginning at b.
      00894A 89 1A                 1996         .word      LINK
                           0008CC  1997 LINK = . 
      00894C 05                    1998         .byte      5
      00894D 45 52 41 53 45        1999         .ascii     "ERASE"
      008952                       2000 ERASE:
                           000001  2001 .if CONVERT_TO_CODE
      008952 90 5F            [ 1] 2002         clrw y 
      008954 1D 00 02         [ 2] 2003         subw x,#CELLL 
      008957 FF               [ 2] 2004         ldw (x),y 
      008958 CC 89 1F         [ 2] 2005         jp FILL 
                           000000  2006 .else 
                                   2007         CALL     ZERO
                                   2008         JP     FILL
                                   2009 .endif 
                                   2010 ;       PACK0x   ( b u a -- a )
                                   2011 ;       Build a counted string with
                                   2012 ;       u characters from b. Null fill.
      00895B 89 4C                 2013         .word      LINK
                           0008DD  2014 LINK = . 
      00895D 05                    2015         .byte      5
      00895E 50 41 43 4B 30 58     2016         .ascii     "PACK0X"
      008964                       2017 PACKS:
      008964 CD 82 E7         [ 4] 2018         CALL     DUPP
      008967 CD 82 B0         [ 4] 2019         CALL     TOR     ;strings only on cell boundary
      00896A CD 84 8E         [ 4] 2020         CALL     DDUP
      00896D CD 82 4D         [ 4] 2021         CALL     CSTOR
      008970 CD 87 82         [ 4] 2022         CALL     ONEP ;save count
      008973 CD 82 F7         [ 4] 2023         CALL     SWAPP
      008976 CD 88 F0         [ 4] 2024         CALL     CMOVE
      008979 CD 82 91         [ 4] 2025         CALL     RFROM
      00897C 81               [ 4] 2026         RET
                                   2027 
                                   2028 ;; Numeric output, single precision
                                   2029 
                                   2030 ;       DIGIT   ( u -- c )
                                   2031 ;       Convert digit u to a character.
      00897D 89 5D                 2032         .word      LINK
                           0008FF  2033 LINK = . 
      00897F 05                    2034         .byte      5
      008980 44 49 47 49 54        2035         .ascii     "DIGIT"
      008985                       2036 DIGIT:
      008985 CD 81 B8         [ 4] 2037         CALL	DOLIT
      008988 00 09                 2038         .word	9
      00898A CD 83 11         [ 4] 2039         CALL	OVER
      00898D CD 85 66         [ 4] 2040         CALL	LESS
      008990 CD 81 B8         [ 4] 2041         CALL	DOLIT
      008993 00 07                 2042         .word	7
      008995 CD 83 33         [ 4] 2043         CALL	ANDD
      008998 CD 84 A3         [ 4] 2044         CALL	PLUS
      00899B CD 81 B8         [ 4] 2045         CALL	DOLIT
      00899E 00 30                 2046         .word	48	;'0'
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



      0089A0 CC 84 A3         [ 2] 2047         JP	PLUS
                                   2048 
                                   2049 ;       EXTRACT ( n base -- n c )
                                   2050 ;       Extract least significant digit from n.
      0089A3 89 7F                 2051         .word      LINK
                           000925  2052 LINK = . 
      0089A5 07                    2053         .byte      7
      0089A6 45 58 54 52 41 43 54  2054         .ascii     "EXTRACT"
      0089AD                       2055 EXTRC:
      0089AD CD 87 B6         [ 4] 2056         CALL     ZERO
      0089B0 CD 82 F7         [ 4] 2057         CALL     SWAPP
      0089B3 CD 85 DE         [ 4] 2058         CALL     UMMOD
      0089B6 CD 82 F7         [ 4] 2059         CALL     SWAPP
      0089B9 CC 89 85         [ 2] 2060         JP     DIGIT
                                   2061 
                                   2062 ;       <#      ( -- )
                                   2063 ;       Initiate  numeric output process.
      0089BC 89 A5                 2064         .word      LINK
                           00093E  2065 LINK = . 
      0089BE 02                    2066         .byte      2
      0089BF 3C 23                 2067         .ascii     "<#"
      0089C1                       2068 BDIGS:
      0089C1 CD 88 B4         [ 4] 2069         CALL     PAD
      0089C4 CD 84 02         [ 4] 2070         CALL     HLD
      0089C7 CC 82 29         [ 2] 2071         JP     STORE
                                   2072 
                                   2073 ;       HOLD    ( c -- )
                                   2074 ;       Insert a character into output string.
      0089CA 89 BE                 2075         .word      LINK
                           00094C  2076 LINK = . 
      0089CC 04                    2077         .byte      4
      0089CD 48 4F 4C 44           2078         .ascii     "HOLD"
      0089D1                       2079 HOLD:
      0089D1 CD 84 02         [ 4] 2080         CALL     HLD
      0089D4 CD 82 40         [ 4] 2081         CALL     AT
      0089D7 CD 87 8F         [ 4] 2082         CALL     ONEM
      0089DA CD 82 E7         [ 4] 2083         CALL     DUPP
      0089DD CD 84 02         [ 4] 2084         CALL     HLD
      0089E0 CD 82 29         [ 4] 2085         CALL     STORE
      0089E3 CC 82 4D         [ 2] 2086         JP     CSTOR
                                   2087 
                                   2088 ;       #       ( u -- u )
                                   2089 ;       Extract one digit from u and
                                   2090 ;       append digit to output string.
      0089E6 89 CC                 2091         .word      LINK
                           000968  2092 LINK = . 
      0089E8 01                    2093         .byte      1
      0089E9 23                    2094         .ascii     "#"
      0089EA                       2095 DIG:
      0089EA CD 83 A4         [ 4] 2096         CALL     BASE
      0089ED CD 82 40         [ 4] 2097         CALL     AT
      0089F0 CD 89 AD         [ 4] 2098         CALL     EXTRC
      0089F3 CC 89 D1         [ 2] 2099         JP     HOLD
                                   2100 
                                   2101 ;       #S      ( u -- 0 )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



                                   2102 ;       Convert u until all digits
                                   2103 ;       are added to output string.
      0089F6 89 E8                 2104         .word      LINK
                           000978  2105 LINK = . 
      0089F8 02                    2106         .byte      2
      0089F9 23 53                 2107         .ascii     "#S"
      0089FB                       2108 DIGS:
      0089FB CD 89 EA         [ 4] 2109 DIGS1:  CALL     DIG
      0089FE CD 82 E7         [ 4] 2110         CALL     DUPP
      008A01 CD 81 EB         [ 4] 2111         CALL     QBRAN
      008A04 8A 08                 2112         .word      DIGS2
      008A06 20 F3            [ 2] 2113         JRA     DIGS1
      008A08 81               [ 4] 2114 DIGS2:  RET
                                   2115 
                                   2116 ;       SIGN    ( n -- )
                                   2117 ;       Add a minus sign to
                                   2118 ;       numeric output string.
      008A09 89 F8                 2119         .word      LINK
                           00098B  2120 LINK = . 
      008A0B 04                    2121         .byte      4
      008A0C 53 49 47 4E           2122         .ascii     "SIGN"
      008A10                       2123 SIGN:
      008A10 CD 83 20         [ 4] 2124         CALL     ZLESS
      008A13 CD 81 EB         [ 4] 2125         CALL     QBRAN
      008A16 8A 20                 2126         .word      SIGN1
      008A18 CD 81 B8         [ 4] 2127         CALL     DOLIT
      008A1B 00 2D                 2128         .word      45	;"-"
      008A1D CC 89 D1         [ 2] 2129         JP     HOLD
      008A20 81               [ 4] 2130 SIGN1:  RET
                                   2131 
                                   2132 ;       #>      ( w -- b u )
                                   2133 ;       Prepare output string.
      008A21 8A 0B                 2134         .word      LINK
                           0009A3  2135 LINK = . 
      008A23 02                    2136         .byte      2
      008A24 23 3E                 2137         .ascii     "#>"
      008A26                       2138 EDIGS:
      008A26 CD 82 DD         [ 4] 2139         CALL     DROP
      008A29 CD 84 02         [ 4] 2140         CALL     HLD
      008A2C CD 82 40         [ 4] 2141         CALL     AT
      008A2F CD 88 B4         [ 4] 2142         CALL     PAD
      008A32 CD 83 11         [ 4] 2143         CALL     OVER
      008A35 CC 85 01         [ 2] 2144         JP     SUBB
                                   2145 
                                   2146 ;       str     ( w -- b u )
                                   2147 ;       Convert a signed integer
                                   2148 ;       to a numeric string.
      008A38 8A 23                 2149         .word      LINK
                           0009BA  2150 LINK = . 
      008A3A 03                    2151         .byte      3
      008A3B 53 54 52              2152         .ascii     "STR"
      008A3E                       2153 STR:
      008A3E CD 82 E7         [ 4] 2154         CALL     DUPP
      008A41 CD 82 B0         [ 4] 2155         CALL     TOR
      008A44 CD 85 1B         [ 4] 2156         CALL     ABSS
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



      008A47 CD 89 C1         [ 4] 2157         CALL     BDIGS
      008A4A CD 89 FB         [ 4] 2158         CALL     DIGS
      008A4D CD 82 91         [ 4] 2159         CALL     RFROM
      008A50 CD 8A 10         [ 4] 2160         CALL     SIGN
      008A53 CC 8A 26         [ 2] 2161         JP     EDIGS
                                   2162 
                                   2163 ;       HEX     ( -- )
                                   2164 ;       Use radix 16 as base for
                                   2165 ;       numeric conversions.
      008A56 8A 3A                 2166         .word      LINK
                           0009D8  2167 LINK = . 
      008A58 03                    2168         .byte      3
      008A59 48 45 58              2169         .ascii     "HEX"
      008A5C                       2170 HEX:
      008A5C CD 81 B8         [ 4] 2171         CALL     DOLIT
      008A5F 00 10                 2172         .word      16
      008A61 CD 83 A4         [ 4] 2173         CALL     BASE
      008A64 CC 82 29         [ 2] 2174         JP     STORE
                                   2175 
                                   2176 ;       DECIMAL ( -- )
                                   2177 ;       Use radix 10 as base
                                   2178 ;       for numeric conversions.
      008A67 8A 58                 2179         .word      LINK
                           0009E9  2180 LINK = . 
      008A69 07                    2181         .byte      7
      008A6A 44 45 43 49 4D 41 4C  2182         .ascii     "DECIMAL"
      008A71                       2183 DECIM:
      008A71 CD 81 B8         [ 4] 2184         CALL     DOLIT
      008A74 00 0A                 2185         .word      10
      008A76 CD 83 A4         [ 4] 2186         CALL     BASE
      008A79 CC 82 29         [ 2] 2187         JP     STORE
                                   2188 
                                   2189 ;; Numeric input, single precision
                                   2190 
                                   2191 ;       DIGIT?  ( c base -- u t )
                                   2192 ;       Convert a character to its numeric
                                   2193 ;       value. A flag indicates success.
      008A7C 8A 69                 2194         .word      LINK
                           0009FE  2195 LINK = . 
      008A7E 06                    2196         .byte       6
      008A7F 44 49 47 49 54 3F     2197         .ascii     "DIGIT?"
      008A85                       2198 DIGTQ:
      008A85 CD 82 B0         [ 4] 2199         CALL     TOR
      008A88 CD 81 B8         [ 4] 2200         CALL     DOLIT
      008A8B 00 30                 2201         .word     48	; "0"
      008A8D CD 85 01         [ 4] 2202         CALL     SUBB
      008A90 CD 81 B8         [ 4] 2203         CALL     DOLIT
      008A93 00 09                 2204         .word      9
      008A95 CD 83 11         [ 4] 2205         CALL     OVER
      008A98 CD 85 66         [ 4] 2206         CALL     LESS
      008A9B CD 81 EB         [ 4] 2207         CALL     QBRAN
      008A9E 8A B6                 2208         .word      DGTQ1
      008AA0 CD 81 B8         [ 4] 2209         CALL     DOLIT
      008AA3 00 07                 2210         .word      7
      008AA5 CD 85 01         [ 4] 2211         CALL     SUBB
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



      008AA8 CD 82 E7         [ 4] 2212         CALL     DUPP
      008AAB CD 81 B8         [ 4] 2213         CALL     DOLIT
      008AAE 00 0A                 2214         .word      10
      008AB0 CD 85 66         [ 4] 2215         CALL     LESS
      008AB3 CD 83 47         [ 4] 2216         CALL     ORR
      008AB6 CD 82 E7         [ 4] 2217 DGTQ1:  CALL     DUPP
      008AB9 CD 82 91         [ 4] 2218         CALL     RFROM
      008ABC CC 85 48         [ 2] 2219         JP     ULESS
                                   2220 
                                   2221 ;       NUMBER? ( a -- n T | a F )
                                   2222 ;       Convert a number string to
                                   2223 ;       integer. Push a flag on tos.
      008ABF 8A 7E                 2224         .word      LINK
                           000A41  2225 LINK = . 
      008AC1 07                    2226         .byte      7
      008AC2 4E 55 4D 42 45 52 3F  2227         .ascii     "NUMBER?"
      008AC9                       2228 NUMBQ:
      008AC9 CD 83 A4         [ 4] 2229         CALL     BASE
      008ACC CD 82 40         [ 4] 2230         CALL     AT
      008ACF CD 82 B0         [ 4] 2231         CALL     TOR
      008AD2 CD 87 B6         [ 4] 2232         CALL     ZERO
      008AD5 CD 83 11         [ 4] 2233         CALL     OVER
      008AD8 CD 88 8C         [ 4] 2234         CALL     COUNT
      008ADB CD 83 11         [ 4] 2235         CALL     OVER
      008ADE CD 82 5E         [ 4] 2236         CALL     CAT
      008AE1 CD 81 B8         [ 4] 2237         CALL     DOLIT
      008AE4 00 24                 2238         .word     36	; "0x"
      008AE6 CD 85 29         [ 4] 2239         CALL     EQUAL
      008AE9 CD 81 EB         [ 4] 2240         CALL     QBRAN
      008AEC 8A FD                 2241         .word      NUMQ1
      008AEE CD 8A 5C         [ 4] 2242         CALL     HEX
      008AF1 CD 82 F7         [ 4] 2243         CALL     SWAPP
      008AF4 CD 87 82         [ 4] 2244         CALL     ONEP
      008AF7 CD 82 F7         [ 4] 2245         CALL     SWAPP
      008AFA CD 87 8F         [ 4] 2246         CALL     ONEM
      008AFD CD 83 11         [ 4] 2247 NUMQ1:  CALL     OVER
      008B00 CD 82 5E         [ 4] 2248         CALL     CAT
      008B03 CD 81 B8         [ 4] 2249         CALL     DOLIT
      008B06 00 2D                 2250         .word     45	; "-"
      008B08 CD 85 29         [ 4] 2251         CALL     EQUAL
      008B0B CD 82 B0         [ 4] 2252         CALL     TOR
      008B0E CD 82 F7         [ 4] 2253         CALL     SWAPP
      008B11 CD 82 A4         [ 4] 2254         CALL     RAT
      008B14 CD 85 01         [ 4] 2255         CALL     SUBB
      008B17 CD 82 F7         [ 4] 2256         CALL     SWAPP
      008B1A CD 82 A4         [ 4] 2257         CALL     RAT
      008B1D CD 84 A3         [ 4] 2258         CALL     PLUS
      008B20 CD 84 52         [ 4] 2259         CALL     QDUP
      008B23 CD 81 EB         [ 4] 2260         CALL     QBRAN
      008B26 8B 87                 2261         .word      NUMQ6
      008B28 CD 87 8F         [ 4] 2262         CALL     ONEM
      008B2B CD 82 B0         [ 4] 2263         CALL     TOR
      008B2E CD 82 E7         [ 4] 2264 NUMQ2:  CALL     DUPP
      008B31 CD 82 B0         [ 4] 2265         CALL     TOR
      008B34 CD 82 5E         [ 4] 2266         CALL     CAT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



      008B37 CD 83 A4         [ 4] 2267         CALL     BASE
      008B3A CD 82 40         [ 4] 2268         CALL     AT
      008B3D CD 8A 85         [ 4] 2269         CALL     DIGTQ
      008B40 CD 81 EB         [ 4] 2270         CALL     QBRAN
      008B43 8B 75                 2271         .word      NUMQ4
      008B45 CD 82 F7         [ 4] 2272         CALL     SWAPP
      008B48 CD 83 A4         [ 4] 2273         CALL     BASE
      008B4B CD 82 40         [ 4] 2274         CALL     AT
      008B4E CD 87 01         [ 4] 2275         CALL     STAR
      008B51 CD 84 A3         [ 4] 2276         CALL     PLUS
      008B54 CD 82 91         [ 4] 2277         CALL     RFROM
      008B57 CD 87 82         [ 4] 2278         CALL     ONEP
      008B5A CD 81 CC         [ 4] 2279         CALL     DONXT
      008B5D 8B 2E                 2280         .word      NUMQ2
      008B5F CD 82 A4         [ 4] 2281         CALL     RAT
      008B62 CD 82 F7         [ 4] 2282         CALL     SWAPP
      008B65 CD 82 DD         [ 4] 2283         CALL     DROP
      008B68 CD 81 EB         [ 4] 2284         CALL     QBRAN
      008B6B 8B 70                 2285         .word      NUMQ3
      008B6D CD 84 CE         [ 4] 2286         CALL     NEGAT
      008B70 CD 82 F7         [ 4] 2287 NUMQ3:  CALL     SWAPP
      008B73 20 0F            [ 2] 2288         JRA     NUMQ5
      008B75 CD 82 91         [ 4] 2289 NUMQ4:  CALL     RFROM
      008B78 CD 82 91         [ 4] 2290         CALL     RFROM
      008B7B CD 84 83         [ 4] 2291         CALL     DDROP
      008B7E CD 84 83         [ 4] 2292         CALL     DDROP
      008B81 CD 87 B6         [ 4] 2293         CALL     ZERO
      008B84 CD 82 E7         [ 4] 2294 NUMQ5:  CALL     DUPP
      008B87 CD 82 91         [ 4] 2295 NUMQ6:  CALL     RFROM
      008B8A CD 84 83         [ 4] 2296         CALL     DDROP
      008B8D CD 82 91         [ 4] 2297         CALL     RFROM
      008B90 CD 83 A4         [ 4] 2298         CALL     BASE
      008B93 CC 82 29         [ 2] 2299         JP     STORE
                                   2300 
                                   2301 ;; Basic I/O
                                   2302 
                                   2303 ;       KEY     ( -- c )
                                   2304 ;       Wait for and return an
                                   2305 ;       input character.
      008B96 8A C1                 2306         .word      LINK
                           000B18  2307 LINK = . 
      008B98 03                    2308         .byte      3
      008B99 4B 45 59              2309         .ascii     "KEY"
      008B9C                       2310 KEY:
                           000001  2311 .if CONVERT_TO_CODE
      008B9C 72 0B 52 30 FB   [ 2] 2312         btjf UART1_SR,#UART_SR_RXNE,. 
      008BA1 C6 52 31         [ 1] 2313         ld a,UART1_DR 
      008BA4 1D 00 02         [ 2] 2314         subw x,#CELLL 
      008BA7 E7 01            [ 1] 2315         ld (1,x),a 
      008BA9 7F               [ 1] 2316         clr (x)
      008BAA 81               [ 4] 2317         ret 
                           000000  2318 .else 
                                   2319 KEY1:   CALL     QKEY
                                   2320         CALL     QBRAN
                                   2321         .word      KEY1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



                                   2322         RET
                                   2323 .endif 
                                   2324 
                                   2325 ;       NUF?    ( -- t )
                                   2326 ;       Return false if no input,
                                   2327 ;       else pause and if CR return true.
      008BAB 8B 98                 2328         .word      LINK
                           000B2D  2329 LINK = . 
      008BAD 04                    2330         .byte      4
      008BAE 4E 55 46 3F           2331         .ascii     "NUF?"
      008BB2                       2332 NUFQ:
      008BB2 CD 81 84         [ 4] 2333         CALL     QKEY
      008BB5 CD 82 E7         [ 4] 2334         CALL     DUPP
      008BB8 CD 81 EB         [ 4] 2335         CALL     QBRAN
      008BBB 8B CB                 2336         .word    NUFQ1
      008BBD CD 84 83         [ 4] 2337         CALL     DDROP
      008BC0 CD 8B 9C         [ 4] 2338         CALL     KEY
      008BC3 CD 81 B8         [ 4] 2339         CALL     DOLIT
      008BC6 00 0D                 2340         .word      CRR
      008BC8 CC 85 29         [ 2] 2341         JP     EQUAL
      008BCB 81               [ 4] 2342 NUFQ1:  RET
                                   2343 
                                   2344 ;       SPACE   ( -- )
                                   2345 ;       Send  blank character to
                                   2346 ;       output device.
      008BCC 8B AD                 2347         .word      LINK
                           000B4E  2348 LINK = . 
      008BCE 05                    2349         .byte      5
      008BCF 53 50 41 43 45        2350         .ascii     "SPACE"
      008BD4                       2351 SPACE:
      008BD4 CD 87 A9         [ 4] 2352         CALL     BLANK
      008BD7 CC 81 A2         [ 2] 2353         JP     EMIT
                                   2354 
                                   2355 ;       SPACES  ( +n -- )
                                   2356 ;       Send n spaces to output device.
      008BDA 8B CE                 2357         .word      LINK
                           000B5C  2358 LINK = . 
      008BDC 06                    2359         .byte      6
      008BDD 53 50 41 43 45 53     2360         .ascii     "SPACES"
      008BE3                       2361 SPACS:
      008BE3 CD 87 B6         [ 4] 2362         CALL     ZERO
      008BE6 CD 85 86         [ 4] 2363         CALL     MAX
      008BE9 CD 82 B0         [ 4] 2364         CALL     TOR
      008BEC 20 03            [ 2] 2365         JRA      CHAR2
      008BEE CD 8B D4         [ 4] 2366 CHAR1:  CALL     SPACE
      008BF1 CD 81 CC         [ 4] 2367 CHAR2:  CALL     DONXT
      008BF4 8B EE                 2368         .word    CHAR1
      008BF6 81               [ 4] 2369         RET
                                   2370 
                                   2371 ;       TYPE    ( b u -- )
                                   2372 ;       Output u characters from b.
      008BF7 8B DC                 2373         .word      LINK
                           000B79  2374 LINK = . 
      008BF9 04                    2375         .byte      4
      008BFA 54 59 50 45           2376         .ascii     "TYPE"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



      008BFE                       2377 TYPES:
      008BFE CD 82 B0         [ 4] 2378         CALL     TOR
      008C01 20 0C            [ 2] 2379         JRA     TYPE2
      008C03 CD 82 E7         [ 4] 2380 TYPE1:  CALL     DUPP
      008C06 CD 82 5E         [ 4] 2381         CALL     CAT
      008C09 CD 81 A2         [ 4] 2382         CALL     EMIT
      008C0C CD 87 82         [ 4] 2383         CALL     ONEP
      008C0F CD 81 CC         [ 4] 2384 TYPE2:  CALL     DONXT
      008C12 8C 03                 2385         .word      TYPE1
      008C14 CC 82 DD         [ 2] 2386         JP     DROP
                                   2387 
                                   2388 ;       CR      ( -- )
                                   2389 ;       Output a carriage return
                                   2390 ;       and a line feed.
      008C17 8B F9                 2391         .word      LINK
                           000B99  2392 LINK = . 
      008C19 02                    2393         .byte      2
      008C1A 43 52                 2394         .ascii     "CR"
      008C1C                       2395 CR:
      008C1C CD 81 B8         [ 4] 2396         CALL     DOLIT
      008C1F 00 0D                 2397         .word      CRR
      008C21 CD 81 A2         [ 4] 2398         CALL     EMIT
      008C24 CD 81 B8         [ 4] 2399         CALL     DOLIT
      008C27 00 0A                 2400         .word      LF
      008C29 CC 81 A2         [ 2] 2401         JP     EMIT
                                   2402 
                                   2403 ;       do$     ( -- a )
                                   2404 ;       Return  address of a compiled
                                   2405 ;       string.
      008C2C 8C 19                 2406         .word      LINK
                           000BAE  2407 LINK = . 
      008C2E 43                    2408 	.byte      COMPO+3
      008C2F 44 4F 24              2409         .ascii     "DO$"
      008C32                       2410 DOSTR:
      008C32 CD 82 91         [ 4] 2411         CALL     RFROM
      008C35 CD 82 A4         [ 4] 2412         CALL     RAT
      008C38 CD 82 91         [ 4] 2413         CALL     RFROM
      008C3B CD 88 8C         [ 4] 2414         CALL     COUNT
      008C3E CD 84 A3         [ 4] 2415         CALL     PLUS
      008C41 CD 82 B0         [ 4] 2416         CALL     TOR
      008C44 CD 82 F7         [ 4] 2417         CALL     SWAPP
      008C47 CD 82 B0         [ 4] 2418         CALL     TOR
      008C4A 81               [ 4] 2419         RET
                                   2420 
                                   2421 ;       $"|     ( -- a )
                                   2422 ;       Run time routine compiled by $".
                                   2423 ;       Return address of a compiled string.
      008C4B 8C 2E                 2424         .word      LINK
                           000BCD  2425 LINK = . 
      008C4D 43                    2426 	.byte      COMPO+3
      008C4E 24 22 7C              2427         .byte     '$','"','|'
      008C51                       2428 STRQP:
      008C51 CD 8C 32         [ 4] 2429         CALL     DOSTR
      008C54 81               [ 4] 2430         RET
                                   2431 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



                                   2432 ;       ."|     ( -- )
                                   2433 ;       Run time routine of ." .
                                   2434 ;       Output a compiled string.
      008C55 8C 4D                 2435         .word      LINK
                           000BD7  2436 LINK = . 
      008C57 43                    2437 	.byte      COMPO+3
      008C58 2E 22 7C              2438         .byte     '.','"','|'
      008C5B                       2439 DOTQP:
      008C5B CD 8C 32         [ 4] 2440         CALL     DOSTR
      008C5E CD 88 8C         [ 4] 2441         CALL     COUNT
      008C61 CC 8B FE         [ 2] 2442         JP     TYPES
                                   2443 
                                   2444 ;       .R      ( n +n -- )
                                   2445 ;       Display an integer in a field
                                   2446 ;       of n columns, right justified.
      008C64 8C 57                 2447         .word      LINK
                           000BE6  2448 LINK = . 
      008C66 02                    2449         .byte      2
      008C67 2E 52                 2450         .ascii     ".R"
      008C69                       2451 DOTR:
      008C69 CD 82 B0         [ 4] 2452         CALL     TOR
      008C6C CD 8A 3E         [ 4] 2453         CALL     STR
      008C6F CD 82 91         [ 4] 2454         CALL     RFROM
      008C72 CD 83 11         [ 4] 2455         CALL     OVER
      008C75 CD 85 01         [ 4] 2456         CALL     SUBB
      008C78 CD 8B E3         [ 4] 2457         CALL     SPACS
      008C7B CC 8B FE         [ 2] 2458         JP     TYPES
                                   2459 
                                   2460 ;       U.R     ( u +n -- )
                                   2461 ;       Display an unsigned integer
                                   2462 ;       in n column, right justified.
      008C7E 8C 66                 2463         .word      LINK
                           000C00  2464 LINK = . 
      008C80 03                    2465         .byte      3
      008C81 55 2E 52              2466         .ascii     "U.R"
      008C84                       2467 UDOTR:
      008C84 CD 82 B0         [ 4] 2468         CALL     TOR
      008C87 CD 89 C1         [ 4] 2469         CALL     BDIGS
      008C8A CD 89 FB         [ 4] 2470         CALL     DIGS
      008C8D CD 8A 26         [ 4] 2471         CALL     EDIGS
      008C90 CD 82 91         [ 4] 2472         CALL     RFROM
      008C93 CD 83 11         [ 4] 2473         CALL     OVER
      008C96 CD 85 01         [ 4] 2474         CALL     SUBB
      008C99 CD 8B E3         [ 4] 2475         CALL     SPACS
      008C9C CC 8B FE         [ 2] 2476         JP     TYPES
                                   2477 
                                   2478 ;       U.      ( u -- )
                                   2479 ;       Display an unsigned integer
                                   2480 ;       in free format.
      008C9F 8C 80                 2481         .word      LINK
                           000C21  2482 LINK = . 
      008CA1 02                    2483         .byte      2
      008CA2 55 2E                 2484         .ascii     "U."
      008CA4                       2485 UDOT:
      008CA4 CD 89 C1         [ 4] 2486         CALL     BDIGS
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      008CA7 CD 89 FB         [ 4] 2487         CALL     DIGS
      008CAA CD 8A 26         [ 4] 2488         CALL     EDIGS
      008CAD CD 8B D4         [ 4] 2489         CALL     SPACE
      008CB0 CC 8B FE         [ 2] 2490         JP     TYPES
                                   2491 
                                   2492 ;       .       ( w -- )
                                   2493 ;       Display an integer in free
                                   2494 ;       format, preceeded by a space.
      008CB3 8C A1                 2495         .word      LINK
                           000C35  2496 LINK = . 
      008CB5 01                    2497         .byte      1
      008CB6 2E                    2498         .ascii     "."
      008CB7                       2499 DOT:
      008CB7 CD 83 A4         [ 4] 2500         CALL     BASE
      008CBA CD 82 40         [ 4] 2501         CALL     AT
      008CBD CD 81 B8         [ 4] 2502         CALL     DOLIT
      008CC0 00 0A                 2503         .word      10
      008CC2 CD 83 5C         [ 4] 2504         CALL     XORR    ;?decimal
      008CC5 CD 81 EB         [ 4] 2505         CALL     QBRAN
      008CC8 8C CD                 2506         .word      DOT1
      008CCA CC 8C A4         [ 2] 2507         JP     UDOT
      008CCD CD 8A 3E         [ 4] 2508 DOT1:   CALL     STR
      008CD0 CD 8B D4         [ 4] 2509         CALL     SPACE
      008CD3 CC 8B FE         [ 2] 2510         JP     TYPES
                                   2511 
                                   2512 ;       ?       ( a -- )
                                   2513 ;       Display contents in memory cell.
      008CD6 8C B5                 2514         .word      LINK
                                   2515         
                           000C58  2516 LINK = . 
      008CD8 01                    2517         .byte      1
      008CD9 3F                    2518         .ascii     "?"
      008CDA                       2519 QUEST:
      008CDA CD 82 40         [ 4] 2520         CALL     AT
      008CDD CC 8C B7         [ 2] 2521         JP     DOT
                                   2522 
                                   2523 ;; Parsing
                                   2524 
                                   2525 ;       parse   ( b u c -- b u delta ; <string> )
                                   2526 ;       Scan string delimited by c.
                                   2527 ;       Return found string and its offset.
      008CE0 8C D8                 2528         .word      LINK
                           000C62  2529 LINK = . 
      008CE2 05                    2530         .byte      5
      008CE3 70 61 72 73 65        2531         .ascii     "parse"
      008CE8                       2532 PARS:
      008CE8 CD 83 B3         [ 4] 2533         CALL     TEMP
      008CEB CD 82 29         [ 4] 2534         CALL     STORE
      008CEE CD 83 11         [ 4] 2535         CALL     OVER
      008CF1 CD 82 B0         [ 4] 2536         CALL     TOR
      008CF4 CD 82 E7         [ 4] 2537         CALL     DUPP
      008CF7 CD 81 EB         [ 4] 2538         CALL     QBRAN
      008CFA 8D A0                 2539         .word    PARS8
      008CFC CD 87 8F         [ 4] 2540         CALL     ONEM
      008CFF CD 83 B3         [ 4] 2541         CALL     TEMP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



      008D02 CD 82 40         [ 4] 2542         CALL     AT
      008D05 CD 87 A9         [ 4] 2543         CALL     BLANK
      008D08 CD 85 29         [ 4] 2544         CALL     EQUAL
      008D0B CD 81 EB         [ 4] 2545         CALL     QBRAN
      008D0E 8D 41                 2546         .word      PARS3
      008D10 CD 82 B0         [ 4] 2547         CALL     TOR
      008D13 CD 87 A9         [ 4] 2548 PARS1:  CALL     BLANK
      008D16 CD 83 11         [ 4] 2549         CALL     OVER
      008D19 CD 82 5E         [ 4] 2550         CALL     CAT     ;skip leading blanks ONLY
      008D1C CD 85 01         [ 4] 2551         CALL     SUBB
      008D1F CD 83 20         [ 4] 2552         CALL     ZLESS
      008D22 CD 84 BD         [ 4] 2553         CALL     INVER
      008D25 CD 81 EB         [ 4] 2554         CALL     QBRAN
      008D28 8D 3E                 2555         .word      PARS2
      008D2A CD 87 82         [ 4] 2556         CALL     ONEP
      008D2D CD 81 CC         [ 4] 2557         CALL     DONXT
      008D30 8D 13                 2558         .word      PARS1
      008D32 CD 82 91         [ 4] 2559         CALL     RFROM
      008D35 CD 82 DD         [ 4] 2560         CALL     DROP
      008D38 CD 87 B6         [ 4] 2561         CALL     ZERO
      008D3B CC 82 E7         [ 2] 2562         JP     DUPP
      008D3E CD 82 91         [ 4] 2563 PARS2:  CALL     RFROM
      008D41 CD 83 11         [ 4] 2564 PARS3:  CALL     OVER
      008D44 CD 82 F7         [ 4] 2565         CALL     SWAPP
      008D47 CD 82 B0         [ 4] 2566         CALL     TOR
      008D4A CD 83 B3         [ 4] 2567 PARS4:  CALL     TEMP
      008D4D CD 82 40         [ 4] 2568         CALL     AT
      008D50 CD 83 11         [ 4] 2569         CALL     OVER
      008D53 CD 82 5E         [ 4] 2570         CALL     CAT
      008D56 CD 85 01         [ 4] 2571         CALL     SUBB    ;scan for delimiter
      008D59 CD 83 B3         [ 4] 2572         CALL     TEMP
      008D5C CD 82 40         [ 4] 2573         CALL     AT
      008D5F CD 87 A9         [ 4] 2574         CALL     BLANK
      008D62 CD 85 29         [ 4] 2575         CALL     EQUAL
      008D65 CD 81 EB         [ 4] 2576         CALL     QBRAN
      008D68 8D 6D                 2577         .word      PARS5
      008D6A CD 83 20         [ 4] 2578         CALL     ZLESS
      008D6D CD 81 EB         [ 4] 2579 PARS5:  CALL     QBRAN
      008D70 8D 82                 2580         .word      PARS6
      008D72 CD 87 82         [ 4] 2581         CALL     ONEP
      008D75 CD 81 CC         [ 4] 2582         CALL     DONXT
      008D78 8D 4A                 2583         .word      PARS4
      008D7A CD 82 E7         [ 4] 2584         CALL     DUPP
      008D7D CD 82 B0         [ 4] 2585         CALL     TOR
      008D80 20 0F            [ 2] 2586         JRA     PARS7
      008D82 CD 82 91         [ 4] 2587 PARS6:  CALL     RFROM
      008D85 CD 82 DD         [ 4] 2588         CALL     DROP
      008D88 CD 82 E7         [ 4] 2589         CALL     DUPP
      008D8B CD 87 82         [ 4] 2590         CALL     ONEP
      008D8E CD 82 B0         [ 4] 2591         CALL     TOR
      008D91 CD 83 11         [ 4] 2592 PARS7:  CALL     OVER
      008D94 CD 85 01         [ 4] 2593         CALL     SUBB
      008D97 CD 82 91         [ 4] 2594         CALL     RFROM
      008D9A CD 82 91         [ 4] 2595         CALL     RFROM
      008D9D CC 85 01         [ 2] 2596         JP     SUBB
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      008DA0 CD 83 11         [ 4] 2597 PARS8:  CALL     OVER
      008DA3 CD 82 91         [ 4] 2598         CALL     RFROM
      008DA6 CC 85 01         [ 2] 2599         JP     SUBB
                                   2600 
                                   2601 ;       PARSE   ( c -- b u ; <string> )
                                   2602 ;       Scan input stream and return
                                   2603 ;       counted string delimited by c.
      008DA9 8C E2                 2604         .word      LINK
                           000D2B  2605 LINK = . 
      008DAB 05                    2606         .byte      5
      008DAC 50 41 52 53 45        2607         .ascii     "PARSE"
      008DB1                       2608 PARSE:
      008DB1 CD 82 B0         [ 4] 2609         CALL     TOR
      008DB4 CD 88 C5         [ 4] 2610         CALL     TIB
      008DB7 CD 83 C2         [ 4] 2611         CALL     INN
      008DBA CD 82 40         [ 4] 2612         CALL     AT
      008DBD CD 84 A3         [ 4] 2613         CALL     PLUS    ;current input buffer pointer
      008DC0 CD 83 D2         [ 4] 2614         CALL     NTIB
      008DC3 CD 82 40         [ 4] 2615         CALL     AT
      008DC6 CD 83 C2         [ 4] 2616         CALL     INN
      008DC9 CD 82 40         [ 4] 2617         CALL     AT
      008DCC CD 85 01         [ 4] 2618         CALL     SUBB    ;remaining count
      008DCF CD 82 91         [ 4] 2619         CALL     RFROM
      008DD2 CD 8C E8         [ 4] 2620         CALL     PARS
      008DD5 CD 83 C2         [ 4] 2621         CALL     INN
      008DD8 CC 88 25         [ 2] 2622         JP     PSTOR
                                   2623 
                                   2624 ;       .(      ( -- )
                                   2625 ;       Output following string up to next ) .
      008DDB 8D AB                 2626         .word      LINK
                           000D5D  2627 LINK = . 
      008DDD 82                    2628 	.byte      IMEDD+2
      008DDE 2E 28                 2629         .ascii     ".("
      008DE0                       2630 DOTPR:
      008DE0 CD 81 B8         [ 4] 2631         CALL     DOLIT
      008DE3 00 29                 2632         .word     41	; ")"
      008DE5 CD 8D B1         [ 4] 2633         CALL     PARSE
      008DE8 CC 8B FE         [ 2] 2634         JP     TYPES
                                   2635 
                                   2636 ;       (       ( -- )
                                   2637 ;       Ignore following string up to next ).
                                   2638 ;       A comment.
      008DEB 8D DD                 2639         .word      LINK
                           000D6D  2640 LINK = . 
      008DED 81                    2641 	.byte      IMEDD+1
      008DEE 28                    2642         .ascii     "("
      008DEF                       2643 PAREN:
      008DEF CD 81 B8         [ 4] 2644         CALL     DOLIT
      008DF2 00 29                 2645         .word     41	; ")"
      008DF4 CD 8D B1         [ 4] 2646         CALL     PARSE
      008DF7 CC 84 83         [ 2] 2647         JP     DDROP
                                   2648 
                                   2649 ;       \       ( -- )
                                   2650 ;       Ignore following text till
                                   2651 ;       end of line.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



      008DFA 8D ED                 2652         .word      LINK
                           000D7C  2653 LINK = . 
      008DFC 81                    2654 	.byte      IMEDD+1
      008DFD 5C                    2655         .ascii     "\"
      008DFE                       2656 BKSLA:
                           000001  2657 .if CONVERT_TO_CODE
      008DFE 90 AE 00 0C      [ 2] 2658         ldw y,#UCTIB ; #TIB  
      008E02 90 FE            [ 2] 2659         ldw y,(y)
      008E04 90 89            [ 2] 2660         pushw y ; count in TIB 
      008E06 90 AE 00 0A      [ 2] 2661         ldw y,#UINN ; >IN 
      008E0A 90 BF 1E         [ 2] 2662         ldw YTEMP,y
      008E0D 90 85            [ 2] 2663         popw y 
      008E0F 91 CF 1E         [ 5] 2664         ldw [YTEMP],y
      008E12 81               [ 4] 2665         ret 
                           000000  2666 .else
                                   2667         CALL     NTIB
                                   2668         CALL     AT
                                   2669         CALL     INN
                                   2670         JP     STORE
                                   2671 .endif 
                                   2672 
                                   2673 ;       WORD    ( c -- a ; <string> )
                                   2674 ;       Parse a word from input stream
                                   2675 ;       and copy it to code dictionary.
      008E13 8D FC                 2676         .word      LINK
                           000D95  2677 LINK = . 
      008E15 04                    2678         .byte      4
      008E16 57 4F 52 44           2679         .ascii     "WORD"
      008E1A                       2680 WORDD:
      008E1A CD 8D B1         [ 4] 2681         CALL     PARSE
      008E1D CD 88 A3         [ 4] 2682         CALL     HERE
      008E20 CD 87 57         [ 4] 2683         CALL     CELLP
      008E23 CC 89 64         [ 2] 2684         JP     PACKS
                                   2685 
                                   2686 ;       TOKEN   ( -- a ; <string> )
                                   2687 ;       Parse a word from input stream
                                   2688 ;       and copy it to name dictionary.
      008E26 8E 15                 2689         .word      LINK
                           000DA8  2690 LINK = . 
      008E28 05                    2691         .byte      5
      008E29 54 4F 4B 45 4E        2692         .ascii     "TOKEN"
      008E2E                       2693 TOKEN:
      008E2E CD 87 A9         [ 4] 2694         CALL     BLANK
      008E31 CC 8E 1A         [ 2] 2695         JP     WORDD
                                   2696 
                                   2697 ;; Dictionary search
                                   2698 
                                   2699 ;       NAME>   ( na -- ca )
                                   2700 ;       Return a code address given
                                   2701 ;       a name address.
      008E34 8E 28                 2702         .word      LINK
                           000DB6  2703 LINK = . 
      008E36 05                    2704         .byte      5
      008E37 4E 41 4D 45 3E        2705         .ascii     "NAME>"
      008E3C                       2706 NAMET:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



      008E3C CD 88 8C         [ 4] 2707         CALL     COUNT
      008E3F CD 81 B8         [ 4] 2708         CALL     DOLIT
      008E42 00 1F                 2709         .word      31
      008E44 CD 83 33         [ 4] 2710         CALL     ANDD
      008E47 CC 84 A3         [ 2] 2711         JP     PLUS
                                   2712 
                                   2713 ;       SAME?   ( a a u -- a a f \ -0+ )
                                   2714 ;       Compare u cells in two
                                   2715 ;       strings. Return 0 if identical.
      008E4A 8E 36                 2716         .word      LINK
                           000DCC  2717 LINK = . 
      008E4C 05                    2718         .byte       5
      008E4D 53 41 4D 45 3F        2719         .ascii     "SAME?"
      008E52                       2720 SAMEQ:
      008E52 CD 87 8F         [ 4] 2721         CALL     ONEM
      008E55 CD 82 B0         [ 4] 2722         CALL     TOR
      008E58 20 29            [ 2] 2723         JRA     SAME2
      008E5A CD 83 11         [ 4] 2724 SAME1:  CALL     OVER
      008E5D CD 82 A4         [ 4] 2725         CALL     RAT
      008E60 CD 84 A3         [ 4] 2726         CALL     PLUS
      008E63 CD 82 5E         [ 4] 2727         CALL     CAT
      008E66 CD 83 11         [ 4] 2728         CALL     OVER
      008E69 CD 82 A4         [ 4] 2729         CALL     RAT
      008E6C CD 84 A3         [ 4] 2730         CALL     PLUS
      008E6F CD 82 5E         [ 4] 2731         CALL     CAT
      008E72 CD 85 01         [ 4] 2732         CALL     SUBB
      008E75 CD 84 52         [ 4] 2733         CALL     QDUP
      008E78 CD 81 EB         [ 4] 2734         CALL     QBRAN
      008E7B 8E 83                 2735         .word      SAME2
      008E7D CD 82 91         [ 4] 2736         CALL     RFROM
      008E80 CC 82 DD         [ 2] 2737         JP     DROP
      008E83 CD 81 CC         [ 4] 2738 SAME2:  CALL     DONXT
      008E86 8E 5A                 2739         .word      SAME1
      008E88 CC 87 B6         [ 2] 2740         JP     ZERO
                                   2741 
                                   2742 ;       find    ( a va -- ca na | a F )
                                   2743 ;       Search vocabulary for string.
                                   2744 ;       Return ca and na if succeeded.
      008E8B 8E 4C                 2745         .word      LINK
                           000E0D  2746 LINK = . 
      008E8D 04                    2747         .byte      4
      008E8E 46 49 4E 44           2748         .ascii     "FIND"
      008E92                       2749 FIND:
      008E92 CD 82 F7         [ 4] 2750         CALL     SWAPP
      008E95 CD 82 E7         [ 4] 2751         CALL     DUPP
      008E98 CD 82 5E         [ 4] 2752         CALL     CAT
      008E9B CD 83 B3         [ 4] 2753         CALL     TEMP
      008E9E CD 82 29         [ 4] 2754         CALL     STORE
      008EA1 CD 82 E7         [ 4] 2755         CALL     DUPP
      008EA4 CD 82 40         [ 4] 2756         CALL     AT
      008EA7 CD 82 B0         [ 4] 2757         CALL     TOR
      008EAA CD 87 57         [ 4] 2758         CALL     CELLP
      008EAD CD 82 F7         [ 4] 2759         CALL     SWAPP
      008EB0 CD 82 40         [ 4] 2760 FIND1:  CALL     AT
      008EB3 CD 82 E7         [ 4] 2761         CALL     DUPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



      008EB6 CD 81 EB         [ 4] 2762         CALL     QBRAN
      008EB9 8E EF                 2763         .word      FIND6
      008EBB CD 82 E7         [ 4] 2764         CALL     DUPP
      008EBE CD 82 40         [ 4] 2765         CALL     AT
      008EC1 CD 81 B8         [ 4] 2766         CALL     DOLIT
      008EC4 1F 7F                 2767         .word      MASKK
      008EC6 CD 83 33         [ 4] 2768         CALL     ANDD
      008EC9 CD 82 A4         [ 4] 2769         CALL     RAT
      008ECC CD 83 5C         [ 4] 2770         CALL     XORR
      008ECF CD 81 EB         [ 4] 2771         CALL     QBRAN
      008ED2 8E DE                 2772         .word      FIND2
      008ED4 CD 87 57         [ 4] 2773         CALL     CELLP
      008ED7 CD 81 B8         [ 4] 2774         CALL     DOLIT
      008EDA FF FF                 2775         .word     0xFFFF
      008EDC 20 0C            [ 2] 2776         JRA     FIND3
      008EDE CD 87 57         [ 4] 2777 FIND2:  CALL     CELLP
      008EE1 CD 83 B3         [ 4] 2778         CALL     TEMP
      008EE4 CD 82 40         [ 4] 2779         CALL     AT
      008EE7 CD 8E 52         [ 4] 2780         CALL     SAMEQ
      008EEA CD 82 02         [ 4] 2781 FIND3:  CALL     BRAN
      008EED 8E FE                 2782         .word      FIND4
      008EEF CD 82 91         [ 4] 2783 FIND6:  CALL     RFROM
      008EF2 CD 82 DD         [ 4] 2784         CALL     DROP
      008EF5 CD 82 F7         [ 4] 2785         CALL     SWAPP
      008EF8 CD 87 66         [ 4] 2786         CALL     CELLM
      008EFB CC 82 F7         [ 2] 2787         JP     SWAPP
      008EFE CD 81 EB         [ 4] 2788 FIND4:  CALL     QBRAN
      008F01 8F 0B                 2789         .word      FIND5
      008F03 CD 87 66         [ 4] 2790         CALL     CELLM
      008F06 CD 87 66         [ 4] 2791         CALL     CELLM
      008F09 20 A5            [ 2] 2792         JRA     FIND1
      008F0B CD 82 91         [ 4] 2793 FIND5:  CALL     RFROM
      008F0E CD 82 DD         [ 4] 2794         CALL     DROP
      008F11 CD 82 F7         [ 4] 2795         CALL     SWAPP
      008F14 CD 82 DD         [ 4] 2796         CALL     DROP
      008F17 CD 87 66         [ 4] 2797         CALL     CELLM
      008F1A CD 82 E7         [ 4] 2798         CALL     DUPP
      008F1D CD 8E 3C         [ 4] 2799         CALL     NAMET
      008F20 CC 82 F7         [ 2] 2800         JP     SWAPP
                                   2801 
                                   2802 ;       NAME?   ( a -- ca na | a F )
                                   2803 ;       Search vocabularies for a string.
      008F23 8E 8D                 2804         .word      LINK
                           000EA5  2805 LINK = . 
      008F25 05                    2806         .byte      5
      008F26 4E 41 4D 45 3F        2807         .ascii     "NAME?"
      008F2B                       2808 NAMEQ:
      008F2B CD 84 15         [ 4] 2809         CALL   CNTXT
      008F2E CC 8E 92         [ 2] 2810         JP     FIND
                                   2811 
                                   2812 ;; Terminal response
                                   2813 
                                   2814 ;       ^H      ( bot eot cur -- bot eot cur )
                                   2815 ;       Backup cursor by one character.
      008F31 8F 25                 2816         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



                           000EB3  2817 LINK = . 
      008F33 02                    2818         .byte      2
      008F34 5E 48                 2819         .ascii     "^H"
      008F36                       2820 BKSP:
      008F36 CD 82 B0         [ 4] 2821         CALL     TOR
      008F39 CD 83 11         [ 4] 2822         CALL     OVER
      008F3C CD 82 91         [ 4] 2823         CALL     RFROM
      008F3F CD 82 F7         [ 4] 2824         CALL     SWAPP
      008F42 CD 83 11         [ 4] 2825         CALL     OVER
      008F45 CD 83 5C         [ 4] 2826         CALL     XORR
      008F48 CD 81 EB         [ 4] 2827         CALL     QBRAN
      008F4B 8F 66                 2828         .word      BACK1
      008F4D CD 81 B8         [ 4] 2829         CALL     DOLIT
      008F50 00 08                 2830         .word      BKSPP
      008F52 CD 81 A2         [ 4] 2831         CALL     EMIT
      008F55 CD 87 8F         [ 4] 2832         CALL     ONEM
      008F58 CD 87 A9         [ 4] 2833         CALL     BLANK
      008F5B CD 81 A2         [ 4] 2834         CALL     EMIT
      008F5E CD 81 B8         [ 4] 2835         CALL     DOLIT
      008F61 00 08                 2836         .word      BKSPP
      008F63 CC 81 A2         [ 2] 2837         JP     EMIT
      008F66 81               [ 4] 2838 BACK1:  RET
                                   2839 
                                   2840 ;       TAP     ( bot eot cur c -- bot eot cur )
                                   2841 ;       Accept and echo key stroke
                                   2842 ;       and bump cursor.
      008F67 8F 33                 2843         .word      LINK
                           000EE9  2844 LINK = . 
      008F69 03                    2845         .byte      3
      008F6A 54 41 50              2846         .ascii     "TAP"
      008F6D                       2847 TAP:
      008F6D CD 82 E7         [ 4] 2848         CALL     DUPP
      008F70 CD 81 A2         [ 4] 2849         CALL     EMIT
      008F73 CD 83 11         [ 4] 2850         CALL     OVER
      008F76 CD 82 4D         [ 4] 2851         CALL     CSTOR
      008F79 CC 87 82         [ 2] 2852         JP     ONEP
                                   2853 
                                   2854 ;       kTAP    ( bot eot cur c -- bot eot cur )
                                   2855 ;       Process a key stroke,
                                   2856 ;       CR or backspace.
      008F7C 8F 69                 2857         .word      LINK
                           000EFE  2858 LINK = . 
      008F7E 04                    2859         .byte      4
      008F7F 4B 54 41 50           2860         .ascii     "KTAP"
      008F83                       2861 KTAP:
      008F83 CD 82 E7         [ 4] 2862         CALL     DUPP
      008F86 CD 81 B8         [ 4] 2863         CALL     DOLIT
      008F89 00 0D                 2864         .word      CRR
      008F8B CD 83 5C         [ 4] 2865         CALL     XORR
      008F8E CD 81 EB         [ 4] 2866         CALL     QBRAN
      008F91 8F A9                 2867         .word      KTAP2
      008F93 CD 81 B8         [ 4] 2868         CALL     DOLIT
      008F96 00 08                 2869         .word      BKSPP
      008F98 CD 83 5C         [ 4] 2870         CALL     XORR
      008F9B CD 81 EB         [ 4] 2871         CALL     QBRAN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



      008F9E 8F A6                 2872         .word      KTAP1
      008FA0 CD 87 A9         [ 4] 2873         CALL     BLANK
      008FA3 CC 8F 6D         [ 2] 2874         JP     TAP
      008FA6 CC 8F 36         [ 2] 2875 KTAP1:  JP     BKSP
      008FA9 CD 82 DD         [ 4] 2876 KTAP2:  CALL     DROP
      008FAC CD 82 F7         [ 4] 2877         CALL     SWAPP
      008FAF CD 82 DD         [ 4] 2878         CALL     DROP
      008FB2 CC 82 E7         [ 2] 2879         JP     DUPP
                                   2880 
                                   2881 ;       accept  ( b u -- b u )
                                   2882 ;       Accept characters to input
                                   2883 ;       buffer. Return with actual count.
      008FB5 8F 7E                 2884         .word      LINK
                           000F37  2885 LINK = . 
      008FB7 06                    2886         .byte      6
      008FB8 41 43 43 45 50 54     2887         .ascii     "ACCEPT"
      008FBE                       2888 ACCEP:
      008FBE CD 83 11         [ 4] 2889         CALL     OVER
      008FC1 CD 84 A3         [ 4] 2890         CALL     PLUS
      008FC4 CD 83 11         [ 4] 2891         CALL     OVER
      008FC7 CD 84 8E         [ 4] 2892 ACCP1:  CALL     DDUP
      008FCA CD 83 5C         [ 4] 2893         CALL     XORR
      008FCD CD 81 EB         [ 4] 2894         CALL     QBRAN
      008FD0 8F F2                 2895         .word      ACCP4
      008FD2 CD 8B 9C         [ 4] 2896         CALL     KEY
      008FD5 CD 82 E7         [ 4] 2897         CALL     DUPP
      008FD8 CD 87 A9         [ 4] 2898         CALL     BLANK
      008FDB CD 81 B8         [ 4] 2899         CALL     DOLIT
      008FDE 00 7F                 2900         .word      127
      008FE0 CD 85 C3         [ 4] 2901         CALL     WITHI
      008FE3 CD 81 EB         [ 4] 2902         CALL     QBRAN
      008FE6 8F ED                 2903         .word      ACCP2
      008FE8 CD 8F 6D         [ 4] 2904         CALL     TAP
      008FEB 20 03            [ 2] 2905         JRA     ACCP3
      008FED CD 8F 83         [ 4] 2906 ACCP2:  CALL     KTAP
      008FF0 20 D5            [ 2] 2907 ACCP3:  JRA     ACCP1
      008FF2 CD 82 DD         [ 4] 2908 ACCP4:  CALL     DROP
      008FF5 CD 83 11         [ 4] 2909         CALL     OVER
      008FF8 CC 85 01         [ 2] 2910         JP     SUBB
                                   2911 
                                   2912 ;       QUERY   ( -- )
                                   2913 ;       Accept input stream to
                                   2914 ;       terminal input buffer.
      008FFB 8F B7                 2915         .word      LINK
                                   2916         
                           000F7D  2917 LINK = . 
      008FFD 05                    2918         .byte      5
      008FFE 51 55 45 52 59        2919         .ascii     "QUERY"
      009003                       2920 QUERY:
      009003 CD 88 C5         [ 4] 2921         CALL     TIB
      009006 CD 81 B8         [ 4] 2922         CALL     DOLIT
      009009 00 50                 2923         .word      80
      00900B CD 8F BE         [ 4] 2924         CALL     ACCEP
      00900E CD 83 D2         [ 4] 2925         CALL     NTIB
      009011 CD 82 29         [ 4] 2926         CALL     STORE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      009014 CD 82 DD         [ 4] 2927         CALL     DROP
      009017 CD 87 B6         [ 4] 2928         CALL     ZERO
      00901A CD 83 C2         [ 4] 2929         CALL     INN
      00901D CC 82 29         [ 2] 2930         JP     STORE
                                   2931 
                                   2932 ;       ABORT   ( -- )
                                   2933 ;       Reset data stack and
                                   2934 ;       jump to QUIT.
      009020 8F FD                 2935         .word      LINK
                           000FA2  2936 LINK = . 
      009022 05                    2937         .byte      5
      009023 41 42 4F 52 54        2938         .ascii     "ABORT"
      009028                       2939 ABORT:
      009028 CD 91 1F         [ 4] 2940         CALL     PRESE
      00902B CC 91 3C         [ 2] 2941         JP     QUIT
                                   2942 
                                   2943 ;       abort"  ( f -- )
                                   2944 ;       Run time routine of ABORT".
                                   2945 ;       Abort with a message.
      00902E 90 22                 2946         .word      LINK
                           000FB0  2947 LINK = . 
      009030 46                    2948 	.byte      COMPO+6
      009031 41 42 4F 52 54        2949         .ascii     "ABORT"
      009036 22                    2950         .byte      '"'
      009037                       2951 ABORQ:
      009037 CD 81 EB         [ 4] 2952         CALL     QBRAN
      00903A 90 56                 2953         .word      ABOR2   ;text flag
      00903C CD 8C 32         [ 4] 2954         CALL     DOSTR
      00903F CD 8B D4         [ 4] 2955 ABOR1:  CALL     SPACE
      009042 CD 88 8C         [ 4] 2956         CALL     COUNT
      009045 CD 8B FE         [ 4] 2957         CALL     TYPES
      009048 CD 81 B8         [ 4] 2958         CALL     DOLIT
      00904B 00 3F                 2959         .word     63 ; "?"
      00904D CD 81 A2         [ 4] 2960         CALL     EMIT
      009050 CD 8C 1C         [ 4] 2961         CALL     CR
      009053 CC 90 28         [ 2] 2962         JP     ABORT   ;pass error string
      009056 CD 8C 32         [ 4] 2963 ABOR2:  CALL     DOSTR
      009059 CC 82 DD         [ 2] 2964         JP     DROP
                                   2965 
                                   2966 ;; The text interpreter
                                   2967 
                                   2968 ;       $INTERPRET      ( a -- )
                                   2969 ;       Interpret a word. If failed,
                                   2970 ;       try to convert it to an integer.
      00905C 90 30                 2971         .word      LINK
                           000FDE  2972 LINK = . 
      00905E 0A                    2973         .byte      10
      00905F 24 49 4E 54 45 52 50  2974         .ascii     "$INTERPRET"
             52 45 54
      009069                       2975 INTER:
      009069 CD 8F 2B         [ 4] 2976         CALL     NAMEQ
      00906C CD 84 52         [ 4] 2977         CALL     QDUP    ;?defined
      00906F CD 81 EB         [ 4] 2978         CALL     QBRAN
      009072 90 93                 2979         .word      INTE1
      009074 CD 82 40         [ 4] 2980         CALL     AT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      009077 CD 81 B8         [ 4] 2981         CALL     DOLIT
      00907A 40 00                 2982 	.word       0x4000	; COMPO*256
      00907C CD 83 33         [ 4] 2983         CALL     ANDD    ;?compile only lexicon bits
      00907F CD 90 37         [ 4] 2984         CALL     ABORQ
      009082 0D                    2985         .byte      13
      009083 20 63 6F 6D 70 69 6C  2986         .ascii     " compile only"
             65 20 6F 6E 6C 79
      009090 CC 82 12         [ 2] 2987         JP     EXECU
      009093 CD 8A C9         [ 4] 2988 INTE1:  CALL     NUMBQ   ;convert a number
      009096 CD 81 EB         [ 4] 2989         CALL     QBRAN
      009099 90 3F                 2990         .word    ABOR1
      00909B 81               [ 4] 2991         RET
                                   2992 
                                   2993 ;       [       ( -- )
                                   2994 ;       Start  text interpreter.
      00909C 90 5E                 2995         .word      LINK
                           00101E  2996 LINK = . 
      00909E 81                    2997 	.byte      IMEDD+1
      00909F 5B                    2998         .ascii     "["
      0090A0                       2999 LBRAC:
      0090A0 CD 81 B8         [ 4] 3000         CALL   DOLIT
      0090A3 90 69                 3001         .word  INTER
      0090A5 CD 83 F3         [ 4] 3002         CALL   TEVAL
      0090A8 CC 82 29         [ 2] 3003         JP     STORE
                                   3004 
                                   3005 ;       .OK     ( -- )
                                   3006 ;       Display 'ok' while interpreting.
      0090AB 90 9E                 3007         .word      LINK
                           00102D  3008 LINK = . 
      0090AD 03                    3009         .byte      3
      0090AE 2E 4F 4B              3010         .ascii     ".OK"
      0090B1                       3011 DOTOK:
      0090B1 CD 81 B8         [ 4] 3012         CALL     DOLIT
      0090B4 90 69                 3013         .word      INTER
      0090B6 CD 83 F3         [ 4] 3014         CALL     TEVAL
      0090B9 CD 82 40         [ 4] 3015         CALL     AT
      0090BC CD 85 29         [ 4] 3016         CALL     EQUAL
      0090BF CD 81 EB         [ 4] 3017         CALL     QBRAN
      0090C2 90 CB                 3018         .word      DOTO1
      0090C4 CD 8C 5B         [ 4] 3019         CALL     DOTQP
      0090C7 03                    3020         .byte      3
      0090C8 20 6F 6B              3021         .ascii     " ok"
      0090CB CC 8C 1C         [ 2] 3022 DOTO1:  JP     CR
                                   3023 
                                   3024 ;       ?STACK  ( -- )
                                   3025 ;       Abort if stack underflows.
      0090CE 90 AD                 3026         .word      LINK
                           001050  3027 LINK = . 
      0090D0 06                    3028         .byte      6
      0090D1 3F 53 54 41 43 4B     3029         .ascii     "?STACK"
      0090D7                       3030 QSTAC: 
      0090D7 CD 87 F9         [ 4] 3031         CALL     DEPTH
      0090DA CD 83 20         [ 4] 3032         CALL     ZLESS   ;check only for underflow
      0090DD CD 90 37         [ 4] 3033         CALL     ABORQ
      0090E0 0B                    3034         .byte      11
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      0090E1 20 75 6E 64 65 72 66  3035         .ascii     " underflow "
             6C 6F 77 20
      0090EC 81               [ 4] 3036         RET
                                   3037 
                                   3038 ;       EVAL    ( -- )
                                   3039 ;       Interpret  input stream.
      0090ED 90 D0                 3040         .word      LINK
                           00106F  3041 LINK = . 
      0090EF 04                    3042         .byte      4
      0090F0 45 56 41 4C           3043         .ascii     "EVAL"
      0090F4                       3044 EVAL:
      0090F4 CD 8E 2E         [ 4] 3045 EVAL1:  CALL     TOKEN
      0090F7 CD 82 E7         [ 4] 3046         CALL     DUPP
      0090FA CD 82 5E         [ 4] 3047         CALL     CAT     ;?input stream empty
      0090FD CD 81 EB         [ 4] 3048         CALL     QBRAN
      009100 91 10                 3049         .word    EVAL2
      009102 CD 83 F3         [ 4] 3050         CALL     TEVAL
      009105 CD 88 D9         [ 4] 3051         CALL     ATEXE
      009108 CD 90 D7         [ 4] 3052         CALL     QSTAC   ;evaluate input, check stack
      00910B CD 82 02         [ 4] 3053         CALL     BRAN
      00910E 90 F4                 3054         .word    EVAL1
      009110 CD 82 DD         [ 4] 3055 EVAL2:  CALL     DROP
      009113 CC 90 B1         [ 2] 3056         JP       DOTOK
                                   3057 
                                   3058 ;       PRESET  ( -- )
                                   3059 ;       Reset data stack pointer and
                                   3060 ;       terminal input buffer.
      009116 90 EF                 3061         .word      LINK
                           001098  3062 LINK = . 
      009118 06                    3063         .byte      6
      009119 50 52 45 53 45 54     3064         .ascii     "PRESET"
      00911F                       3065 PRESE:
      00911F CD 81 B8         [ 4] 3066         CALL     DOLIT
      009122 16 70                 3067         .word      SPP
      009124 CD 82 D4         [ 4] 3068         CALL     SPSTO
      009127 CD 81 B8         [ 4] 3069         CALL     DOLIT
      00912A 17 00                 3070         .word      TIBB
      00912C CD 83 D2         [ 4] 3071         CALL     NTIB
      00912F CD 87 57         [ 4] 3072         CALL     CELLP
      009132 CC 82 29         [ 2] 3073         JP     STORE
                                   3074 
                                   3075 ;       QUIT    ( -- )
                                   3076 ;       Reset return stack pointer
                                   3077 ;       and start text interpreter.
      009135 91 18                 3078         .word      LINK
                           0010B7  3079 LINK = . 
      009137 04                    3080         .byte      4
      009138 51 55 49 54           3081         .ascii     "QUIT"
      00913C                       3082 QUIT:
      00913C CD 81 B8         [ 4] 3083         CALL     DOLIT
      00913F 17 FF                 3084         .word      RPP
      009141 CD 82 7B         [ 4] 3085         CALL     RPSTO   ;reset return stack pointer
      009144 CD 90 A0         [ 4] 3086 QUIT1:  CALL     LBRAC   ;start interpretation
      009147 CD 90 03         [ 4] 3087 QUIT2:  CALL     QUERY   ;get input
      00914A CD 90 F4         [ 4] 3088         CALL     EVAL
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



      00914D 20 F8            [ 2] 3089         JRA     QUIT2   ;continue till error
                                   3090 
                                   3091 ;; The compiler
                                   3092 
                                   3093 ;       '       ( -- ca )
                                   3094 ;       Search vocabularies for
                                   3095 ;       next word in input stream.
      00914F 91 37                 3096         .word      LINK
                           0010D1  3097 LINK = . 
      009151 01                    3098         .byte      1
      009152 27                    3099         .ascii     "'"
      009153                       3100 TICK:
      009153 CD 8E 2E         [ 4] 3101         CALL     TOKEN
      009156 CD 8F 2B         [ 4] 3102         CALL     NAMEQ   ;?defined
      009159 CD 81 EB         [ 4] 3103         CALL     QBRAN
      00915C 90 3F                 3104         .word      ABOR1
      00915E 81               [ 4] 3105         RET     ;yes, push code address
                                   3106 
                                   3107 ;       ALLOT   ( n -- )
                           000001  3108 .if PICATOUT_MOD
                                   3109 ;       Allocate n bytes to RAM 
                           000000  3110 .else 
                                   3111 ;       Allocate n bytes to  code dictionary.
                                   3112 .endif 
      00915F 91 51                 3113         .word      LINK
                           0010E1  3114 LINK = . 
      009161 05                    3115         .byte      5
      009162 41 4C 4C 4F 54        3116         .ascii     "ALLOT"
      009167                       3117 ALLOT:
      009167 CD 84 23         [ 4] 3118         CALL     CPP
      00916A CC 88 25         [ 2] 3119         JP     PSTOR
                                   3120 
                                   3121 ;       ,       ( w -- )
                                   3122 ;         Compile an integer into
                                   3123 ;         code dictionary.
      00916D 91 61                 3124         .word      LINK
                           0010EF  3125 LINK = . 
      00916F 01                    3126         .byte      1
      009170 2C                    3127         .ascii     ","
      009171                       3128 COMMA:
      009171 CD 88 A3         [ 4] 3129         CALL     HERE
      009174 CD 82 E7         [ 4] 3130         CALL     DUPP
      009177 CD 87 57         [ 4] 3131         CALL     CELLP   ;cell boundary
      00917A CD 84 23         [ 4] 3132         CALL     CPP
      00917D CD 82 29         [ 4] 3133         CALL     STORE
      009180 CC 82 29         [ 2] 3134         JP     STORE
                                   3135 
                                   3136 ;       C,      ( c -- )
                                   3137 ;       Compile a byte into
                                   3138 ;       code dictionary.
      009183 91 6F                 3139        .word      LINK
                           001105  3140 LINK = . 
      009185 02                    3141         .byte      2
      009186 43 2C                 3142         .ascii     "C,"
      009188                       3143 CCOMMA:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      009188 CD 88 A3         [ 4] 3144         CALL     HERE
      00918B CD 82 E7         [ 4] 3145         CALL     DUPP
      00918E CD 87 82         [ 4] 3146         CALL     ONEP
      009191 CD 84 23         [ 4] 3147         CALL     CPP
      009194 CD 82 29         [ 4] 3148         CALL     STORE
      009197 CC 82 4D         [ 2] 3149         JP     CSTOR
                                   3150 
                                   3151 ;       [COMPILE]       ( -- ; <string> )
                                   3152 ;       Compile next immediate
                                   3153 ;       word into code dictionary.
      00919A 91 85                 3154         .word      LINK
                           00111C  3155 LINK = . 
      00919C 89                    3156 	.byte      IMEDD+9
      00919D 5B 43 4F 4D 50 49 4C  3157         .ascii     "[COMPILE]"
             45 5D
      0091A6                       3158 BCOMP:
      0091A6 CD 91 53         [ 4] 3159         CALL     TICK
      0091A9 CC 94 06         [ 2] 3160         JP     JSRC
                                   3161 
                                   3162 ;       COMPILE ( -- )
                                   3163 ;       Compile next jsr in
                                   3164 ;       colon list to code dictionary.
      0091AC 91 9C                 3165         .word      LINK
                           00112E  3166 LINK = . 
      0091AE 47                    3167 	.byte      COMPO+7
      0091AF 43 4F 4D 50 49 4C 45  3168         .ascii     "COMPILE"
      0091B6                       3169 COMPI:
      0091B6 CD 82 91         [ 4] 3170         CALL     RFROM
      0091B9 CD 87 82         [ 4] 3171         CALL     ONEP
      0091BC CD 82 E7         [ 4] 3172         CALL     DUPP
      0091BF CD 82 40         [ 4] 3173         CALL     AT
      0091C2 CD 94 06         [ 4] 3174         CALL     JSRC    ;compile subroutine
      0091C5 CD 87 57         [ 4] 3175         CALL     CELLP
      0091C8 CC 82 B0         [ 2] 3176         JP     TOR
                                   3177 
                                   3178 ;       LITERAL ( w -- )
                                   3179 ;       Compile tos to dictionary
                                   3180 ;       as an integer literal.
      0091CB 91 AE                 3181         .word      LINK
                           00114D  3182 LINK = . 
      0091CD 87                    3183 	.byte      IMEDD+7
      0091CE 4C 49 54 45 52 41 4C  3184         .ascii     "LITERAL"
      0091D5                       3185 LITER:
      0091D5 CD 91 B6         [ 4] 3186         CALL     COMPI
      0091D8 CD 81 B8         [ 4] 3187         CALL     DOLIT
      0091DB CC 91 71         [ 2] 3188         JP     COMMA
                                   3189 
                                   3190 ;       $,"     ( -- )
                                   3191 ;       Compile a literal string
                                   3192 ;       up to next " .
      0091DE 91 CD                 3193         .word      LINK
                           001160  3194 LINK = . 
      0091E0 03                    3195         .byte      3
      0091E1 24 2C 22              3196         .byte     '$',',','"'
      0091E4                       3197 STRCQ:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



      0091E4 CD 81 B8         [ 4] 3198         CALL     DOLIT
      0091E7 00 22                 3199         .word     34	; "
      0091E9 CD 8D B1         [ 4] 3200         CALL     PARSE
      0091EC CD 88 A3         [ 4] 3201         CALL     HERE
      0091EF CD 89 64         [ 4] 3202         CALL     PACKS   ;string to code dictionary
      0091F2 CD 88 8C         [ 4] 3203         CALL     COUNT
      0091F5 CD 84 A3         [ 4] 3204         CALL     PLUS    ;calculate aligned end of string
      0091F8 CD 84 23         [ 4] 3205         CALL     CPP
      0091FB CC 82 29         [ 2] 3206         JP     STORE
                                   3207 
                                   3208 ;; Structures
                                   3209 
                                   3210 ;       FOR     ( -- a )
                                   3211 ;       Start a FOR-NEXT loop
                                   3212 ;       structure in a colon definition.
      0091FE 91 E0                 3213         .word      LINK
                           001180  3214 LINK = . 
      009200 83                    3215 	.byte      IMEDD+3
      009201 46 4F 52              3216         .ascii     "FOR"
      009204                       3217 FOR:
      009204 CD 91 B6         [ 4] 3218         CALL     COMPI
      009207 CD 82 B0         [ 4] 3219         CALL     TOR
      00920A CC 88 A3         [ 2] 3220         JP     HERE
                                   3221 
                                   3222 ;       NEXT    ( a -- )
                                   3223 ;       Terminate a FOR-NEXT loop.
      00920D 92 00                 3224         .word      LINK
                           00118F  3225 LINK = . 
      00920F 84                    3226 	.byte      IMEDD+4
      009210 4E 45 58 54           3227         .ascii     "NEXT"
      009214                       3228 NEXT:
      009214 CD 91 B6         [ 4] 3229         CALL     COMPI
      009217 CD 81 CC         [ 4] 3230         CALL     DONXT
      00921A CC 91 71         [ 2] 3231         JP     COMMA
                                   3232 
                                   3233 ;       BEGIN   ( -- a )
                                   3234 ;       Start an infinite or
                                   3235 ;       indefinite loop structure.
      00921D 92 0F                 3236         .word      LINK
                           00119F  3237 LINK = . 
      00921F 85                    3238 	.byte      IMEDD+5
      009220 42 45 47 49 4E        3239         .ascii     "BEGIN"
      009225                       3240 BEGIN:
      009225 CC 88 A3         [ 2] 3241         JP     HERE
                                   3242 
                                   3243 ;       UNTIL   ( a -- )
                                   3244 ;       Terminate a BEGIN-UNTIL
                                   3245 ;       indefinite loop structure.
      009228 92 1F                 3246         .word      LINK
                           0011AA  3247 LINK = . 
      00922A 85                    3248 	.byte      IMEDD+5
      00922B 55 4E 54 49 4C        3249         .ascii     "UNTIL"
      009230                       3250 UNTIL:
      009230 CD 91 B6         [ 4] 3251         CALL     COMPI
      009233 CD 81 EB         [ 4] 3252         CALL     QBRAN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      009236 CC 91 71         [ 2] 3253         JP     COMMA
                                   3254 
                                   3255 ;       AGAIN   ( a -- )
                                   3256 ;       Terminate a BEGIN-AGAIN
                                   3257 ;       infinite loop structure.
      009239 92 2A                 3258         .word      LINK
                           0011BB  3259 LINK = . 
      00923B 85                    3260 	.byte      IMEDD+5
      00923C 41 47 41 49 4E        3261         .ascii     "AGAIN"
      009241                       3262 AGAIN:
      009241 CD 91 B6         [ 4] 3263         CALL     COMPI
      009244 CD 82 02         [ 4] 3264         CALL     BRAN
      009247 CC 91 71         [ 2] 3265         JP     COMMA
                                   3266 
                                   3267 ;       IF      ( -- A )
                                   3268 ;       Begin a conditional branch.
      00924A 92 3B                 3269         .word      LINK
                           0011CC  3270 LINK = . 
      00924C 82                    3271 	.byte      IMEDD+2
      00924D 49 46                 3272         .ascii     "IF"
      00924F                       3273 IFF:
      00924F CD 91 B6         [ 4] 3274         CALL     COMPI
      009252 CD 81 EB         [ 4] 3275         CALL     QBRAN
      009255 CD 88 A3         [ 4] 3276         CALL     HERE
      009258 CD 87 B6         [ 4] 3277         CALL     ZERO
      00925B CC 91 71         [ 2] 3278         JP     COMMA
                                   3279 
                                   3280 ;       THEN        ( A -- )
                                   3281 ;       Terminate a conditional branch structure.
      00925E 92 4C                 3282         .word      LINK
                           0011E0  3283 LINK = . 
      009260 84                    3284 	.byte      IMEDD+4
      009261 54 48 45 4E           3285         .ascii     "THEN"
      009265                       3286 THENN:
      009265 CD 88 A3         [ 4] 3287         CALL     HERE
      009268 CD 82 F7         [ 4] 3288         CALL     SWAPP
      00926B CC 82 29         [ 2] 3289         JP     STORE
                                   3290 
                                   3291 ;       ELSE        ( A -- A )
                                   3292 ;       Start the false clause in an IF-ELSE-THEN structure.
      00926E 92 60                 3293         .word      LINK
                           0011F0  3294 LINK = . 
      009270 84                    3295 	.byte      IMEDD+4
      009271 45 4C 53 45           3296         .ascii     "ELSE"
      009275                       3297 ELSEE:
      009275 CD 91 B6         [ 4] 3298         CALL     COMPI
      009278 CD 82 02         [ 4] 3299         CALL     BRAN
      00927B CD 88 A3         [ 4] 3300         CALL     HERE
      00927E CD 87 B6         [ 4] 3301         CALL     ZERO
      009281 CD 91 71         [ 4] 3302         CALL     COMMA
      009284 CD 82 F7         [ 4] 3303         CALL     SWAPP
      009287 CD 88 A3         [ 4] 3304         CALL     HERE
      00928A CD 82 F7         [ 4] 3305         CALL     SWAPP
      00928D CC 82 29         [ 2] 3306         JP     STORE
                                   3307 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



                                   3308 ;       AHEAD       ( -- A )
                                   3309 ;       Compile a forward branch instruction.
      009290 92 70                 3310         .word      LINK
                           001212  3311 LINK = . 
      009292 85                    3312 	.byte      IMEDD+5
      009293 41 48 45 41 44        3313         .ascii     "AHEAD"
      009298                       3314 AHEAD:
      009298 CD 91 B6         [ 4] 3315         CALL     COMPI
      00929B CD 82 02         [ 4] 3316         CALL     BRAN
      00929E CD 88 A3         [ 4] 3317         CALL     HERE
      0092A1 CD 87 B6         [ 4] 3318         CALL     ZERO
      0092A4 CC 91 71         [ 2] 3319         JP     COMMA
                                   3320 
                                   3321 ;       WHILE       ( a -- A a )
                                   3322 ;       Conditional branch out of a BEGIN-WHILE-REPEAT loop.
      0092A7 92 92                 3323         .word      LINK
                           001229  3324 LINK = . 
      0092A9 85                    3325 	.byte      IMEDD+5
      0092AA 57 48 49 4C 45        3326         .ascii     "WHILE"
      0092AF                       3327 WHILE:
      0092AF CD 91 B6         [ 4] 3328         CALL     COMPI
      0092B2 CD 81 EB         [ 4] 3329         CALL     QBRAN
      0092B5 CD 88 A3         [ 4] 3330         CALL     HERE
      0092B8 CD 87 B6         [ 4] 3331         CALL     ZERO
      0092BB CD 91 71         [ 4] 3332         CALL     COMMA
      0092BE CC 82 F7         [ 2] 3333         JP     SWAPP
                                   3334 
                                   3335 ;       REPEAT      ( A a -- )
                                   3336 ;       Terminate a BEGIN-WHILE-REPEAT indefinite loop.
      0092C1 92 A9                 3337         .word      LINK
                           001243  3338 LINK = . 
      0092C3 86                    3339         .byte      IMEDD+6
      0092C4 52 45 50 45 41 54     3340         .ascii     "REPEAT"
      0092CA                       3341 REPEA:
      0092CA CD 91 B6         [ 4] 3342         CALL     COMPI
      0092CD CD 82 02         [ 4] 3343         CALL     BRAN
      0092D0 CD 91 71         [ 4] 3344         CALL     COMMA
      0092D3 CD 88 A3         [ 4] 3345         CALL     HERE
      0092D6 CD 82 F7         [ 4] 3346         CALL     SWAPP
      0092D9 CC 82 29         [ 2] 3347         JP     STORE
                                   3348 
                                   3349 ;       AFT         ( a -- a A )
                                   3350 ;       Jump to THEN in a FOR-AFT-THEN-NEXT loop the first time through.
      0092DC 92 C3                 3351         .word      LINK
                           00125E  3352 LINK = . 
      0092DE 83                    3353 	.byte      IMEDD+3
      0092DF 41 46 54              3354         .ascii     "AFT"
      0092E2                       3355 AFT:
      0092E2 CD 82 DD         [ 4] 3356         CALL     DROP
      0092E5 CD 92 98         [ 4] 3357         CALL     AHEAD
      0092E8 CD 88 A3         [ 4] 3358         CALL     HERE
      0092EB CC 82 F7         [ 2] 3359         JP     SWAPP
                                   3360 
                                   3361 ;       ABORT"      ( -- ; <string> )
                                   3362 ;       Conditional abort with an error message.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      0092EE 92 DE                 3363         .word      LINK
                           001270  3364 LINK = . 
      0092F0 86                    3365 	.byte      IMEDD+6
      0092F1 41 42 4F 52 54        3366         .ascii     "ABORT"
      0092F6 22                    3367         .byte      '"'
      0092F7                       3368 ABRTQ:
      0092F7 CD 91 B6         [ 4] 3369         CALL     COMPI
      0092FA CD 90 37         [ 4] 3370         CALL     ABORQ
      0092FD CC 91 E4         [ 2] 3371         JP     STRCQ
                                   3372 
                                   3373 ;       $"     ( -- ; <string> )
                                   3374 ;       Compile an inline string literal.
      009300 92 F0                 3375         .word      LINK
                           001282  3376 LINK = . 
      009302 82                    3377 	.byte      IMEDD+2
      009303 24 22                 3378         .byte     '$','"'
      009305                       3379 STRQ:
      009305 CD 91 B6         [ 4] 3380         CALL     COMPI
      009308 CD 8C 51         [ 4] 3381         CALL     STRQP
      00930B CC 91 E4         [ 2] 3382         JP     STRCQ
                                   3383 
                                   3384 ;       ."          ( -- ; <string> )
                                   3385 ;       Compile an inline string literal to be typed out at run time.
      00930E 93 02                 3386         .word      LINK
                           001290  3387 LINK = . 
      009310 82                    3388 	.byte      IMEDD+2
      009311 2E 22                 3389         .byte     '.','"'
      009313                       3390 DOTQ:
      009313 CD 91 B6         [ 4] 3391         CALL     COMPI
      009316 CD 8C 5B         [ 4] 3392         CALL     DOTQP
      009319 CC 91 E4         [ 2] 3393         JP     STRCQ
                                   3394 
                                   3395 ;; Name compiler
                                   3396 
                                   3397 ;       ?UNIQUE ( a -- a )
                                   3398 ;       Display a warning message
                                   3399 ;       if word already exists.
      00931C 93 10                 3400         .word      LINK
                           00129E  3401 LINK = . 
      00931E 07                    3402         .byte      7
      00931F 3F 55 4E 49 51 55 45  3403         .ascii     "?UNIQUE"
      009326                       3404 UNIQU:
      009326 CD 82 E7         [ 4] 3405         CALL     DUPP
      009329 CD 8F 2B         [ 4] 3406         CALL     NAMEQ   ;?name exists
      00932C CD 81 EB         [ 4] 3407         CALL     QBRAN
      00932F 93 45                 3408         .word      UNIQ1
      009331 CD 8C 5B         [ 4] 3409         CALL     DOTQP   ;redef are OK
      009334 07                    3410         .byte       7
      009335 20 72 65 44 65 66 20  3411         .ascii     " reDef "       
      00933C CD 83 11         [ 4] 3412         CALL     OVER
      00933F CD 88 8C         [ 4] 3413         CALL     COUNT
      009342 CD 8B FE         [ 4] 3414         CALL     TYPES   ;just in case
      009345 CC 82 DD         [ 2] 3415 UNIQ1:  JP     DROP
                                   3416 
                                   3417 ;       $,n     ( na -- )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



                                   3418 ;       Build a new dictionary name
                                   3419 ;       using string at na.
      009348 93 1E                 3420         .word      LINK
                           0012CA  3421 LINK = . 
      00934A 03                    3422         .byte      3
      00934B 24 2C 6E              3423         .ascii     "$,n"
      00934E                       3424 SNAME:
      00934E CD 82 E7         [ 4] 3425         CALL     DUPP
      009351 CD 82 5E         [ 4] 3426         CALL     CAT     ;?null input
      009354 CD 81 EB         [ 4] 3427         CALL     QBRAN
      009357 93 84                 3428         .word      PNAM1
      009359 CD 93 26         [ 4] 3429         CALL     UNIQU   ;?redefinition
      00935C CD 82 E7         [ 4] 3430         CALL     DUPP
      00935F CD 88 8C         [ 4] 3431         CALL     COUNT
      009362 CD 84 A3         [ 4] 3432         CALL     PLUS
      009365 CD 84 23         [ 4] 3433         CALL     CPP
      009368 CD 82 29         [ 4] 3434         CALL     STORE
      00936B CD 82 E7         [ 4] 3435         CALL     DUPP
      00936E CD 84 42         [ 4] 3436         CALL     LAST
      009371 CD 82 29         [ 4] 3437         CALL     STORE   ;save na for vocabulary link
      009374 CD 87 66         [ 4] 3438         CALL     CELLM   ;link address
      009377 CD 84 15         [ 4] 3439         CALL     CNTXT
      00937A CD 82 40         [ 4] 3440         CALL     AT
      00937D CD 82 F7         [ 4] 3441         CALL     SWAPP
      009380 CD 82 29         [ 4] 3442         CALL     STORE
      009383 81               [ 4] 3443         RET     ;save code pointer
      009384 CD 8C 51         [ 4] 3444 PNAM1:  CALL     STRQP
      009387 05                    3445         .byte      5
      009388 20 6E 61 6D 65        3446         .ascii     " name" ;null input
      00938D CC 90 3F         [ 2] 3447         JP     ABOR1
                                   3448 
                                   3449 ;; FORTH compiler
                                   3450 
                                   3451 ;       $COMPILE        ( a -- )
                                   3452 ;       Compile next word to
                                   3453 ;       dictionary as a token or literal.
      009390 93 4A                 3454         .word      LINK
                           001312  3455 LINK = . 
      009392 08                    3456         .byte      8
      009393 24 43 4F 4D 50 49 4C  3457         .ascii     "$COMPILE"
             45
      00939B                       3458 SCOMP:
      00939B CD 8F 2B         [ 4] 3459         CALL     NAMEQ
      00939E CD 84 52         [ 4] 3460         CALL     QDUP    ;?defined
      0093A1 CD 81 EB         [ 4] 3461         CALL     QBRAN
      0093A4 93 BC                 3462         .word      SCOM2
      0093A6 CD 82 40         [ 4] 3463         CALL     AT
      0093A9 CD 81 B8         [ 4] 3464         CALL     DOLIT
      0093AC 80 00                 3465         .word     0x8000	;  IMEDD*256
      0093AE CD 83 33         [ 4] 3466         CALL     ANDD    ;?immediate
      0093B1 CD 81 EB         [ 4] 3467         CALL     QBRAN
      0093B4 93 B9                 3468         .word      SCOM1
      0093B6 CC 82 12         [ 2] 3469         JP     EXECU
      0093B9 CC 94 06         [ 2] 3470 SCOM1:  JP     JSRC
      0093BC CD 8A C9         [ 4] 3471 SCOM2:  CALL     NUMBQ   ;try to convert to number
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      0093BF CD 81 EB         [ 4] 3472         CALL     QBRAN
      0093C2 90 3F                 3473         .word      ABOR1
      0093C4 CC 91 D5         [ 2] 3474         JP     LITER
                                   3475 
                                   3476 ;       OVERT   ( -- )
                                   3477 ;       Link a new word into vocabulary.
      0093C7 93 92                 3478         .word      LINK
                           001349  3479 LINK = . 
      0093C9 05                    3480         .byte      5
      0093CA 4F 56 45 52 54        3481         .ascii     "OVERT"
      0093CF                       3482 OVERT:
      0093CF CD 84 42         [ 4] 3483         CALL     LAST
      0093D2 CD 82 40         [ 4] 3484         CALL     AT
      0093D5 CD 84 15         [ 4] 3485         CALL     CNTXT
      0093D8 CC 82 29         [ 2] 3486         JP     STORE
                                   3487 
                                   3488 ;       ;       ( -- )
                                   3489 ;       Terminate a colon definition.
      0093DB 93 C9                 3490         .word      LINK
                           00135D  3491 LINK = . 
      0093DD C1                    3492 	.byte      IMEDD+COMPO+1
      0093DE 3B                    3493         .ascii     ";"
      0093DF                       3494 SEMIS:
      0093DF CD 91 B6         [ 4] 3495         CALL     COMPI
      0093E2 CD 82 22         [ 4] 3496         CALL     EXIT
      0093E5 CD 90 A0         [ 4] 3497         CALL     LBRAC
                           000001  3498 .if PICATOUT_MOD
      0093E8 CD 93 CF         [ 4] 3499         call OVERT 
      0093EB CD 9B 8A         [ 4] 3500         CALL FMOVE 
      0093EE 81               [ 4] 3501         RET 
                           000000  3502 .else 
                                   3503         JP     OVERT
                                   3504 .endif 
                                   3505 
                                   3506 ;       ]       ( -- )
                                   3507 ;       Start compiling words in
                                   3508 ;       input stream.
      0093EF 93 DD                 3509         .word      LINK
                           001371  3510 LINK = . 
      0093F1 01                    3511         .byte      1
      0093F2 5D                    3512         .ascii     "]"
      0093F3                       3513 RBRAC:
      0093F3 CD 81 B8         [ 4] 3514         CALL   DOLIT
      0093F6 93 9B                 3515         .word  SCOMP
      0093F8 CD 83 F3         [ 4] 3516         CALL   TEVAL
      0093FB CC 82 29         [ 2] 3517         JP     STORE
                                   3518 
                                   3519 ;       CALL,    ( ca -- )
                                   3520 ;       Compile a subroutine call.
      0093FE 93 F1                 3521         .word      LINK
                           001380  3522 LINK = . 
      009400 04                    3523         .byte      4
      009401 43 41 4C 4C 2C        3524         .ascii     "CALL,"
      009406                       3525 JSRC:
      009406 CD 81 B8         [ 4] 3526         CALL     DOLIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      009409 00 CD                 3527         .word     CALLL     ;CALL
      00940B CD 91 88         [ 4] 3528         CALL     CCOMMA
      00940E CC 91 71         [ 2] 3529         JP     COMMA
                                   3530 
                                   3531 ;       :       ( -- ; <string> )
                                   3532 ;       Start a new colon definition
                                   3533 ;       using next word as its name.
      009411 94 00                 3534         .word      LINK
                           001393  3535 LINK = . 
      009413 01                    3536         .byte      1
      009414 3A                    3537         .ascii     ":"
      009415                       3538 COLON:
      009415 CD 8E 2E         [ 4] 3539         CALL   TOKEN
      009418 CD 93 4E         [ 4] 3540         CALL   SNAME
      00941B CC 93 F3         [ 2] 3541         JP     RBRAC
                                   3542 
                                   3543 ;       IMMEDIATE       ( -- )
                                   3544 ;       Make last compiled word
                                   3545 ;       an immediate word.
      00941E 94 13                 3546         .word      LINK
                           0013A0  3547 LINK = . 
      009420 09                    3548         .byte      9
      009421 49 4D 4D 45 44 49 41  3549         .ascii     "IMMEDIATE"
             54 45
      00942A                       3550 IMMED:
      00942A CD 81 B8         [ 4] 3551         CALL     DOLIT
      00942D 80 00                 3552         .word     0x8000	;  IMEDD*256
      00942F CD 84 42         [ 4] 3553         CALL     LAST
      009432 CD 82 40         [ 4] 3554         CALL     AT
      009435 CD 82 40         [ 4] 3555         CALL     AT
      009438 CD 83 47         [ 4] 3556         CALL     ORR
      00943B CD 84 42         [ 4] 3557         CALL     LAST
      00943E CD 82 40         [ 4] 3558         CALL     AT
      009441 CC 82 29         [ 2] 3559         JP     STORE
                                   3560 
                                   3561 ;; Defining words
                                   3562 
                                   3563 ;       CREATE  ( -- ; <string> )
                                   3564 ;       Compile a new array
                                   3565 ;       without allocating space.
      009444 94 20                 3566         .word      LINK
                           0013C6  3567 LINK = . 
      009446 06                    3568         .byte      6
      009447 43 52 45 41 54 45     3569         .ascii     "CREATE"
      00944D                       3570 CREAT:
      00944D CD 8E 2E         [ 4] 3571         CALL     TOKEN
      009450 CD 93 4E         [ 4] 3572         CALL     SNAME
      009453 CD 93 CF         [ 4] 3573         CALL     OVERT        
      009456 CD 91 B6         [ 4] 3574         CALL     COMPI 
      009459 CD 83 94         [ 4] 3575         CALL     DOVAR
      00945C 81               [ 4] 3576         RET
                                   3577 
                                   3578 ;       VARIABLE        ( -- ; <string> )
                                   3579 ;       Compile a new variable
                                   3580 ;       initialized to 0.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      00945D 94 46                 3581         .word      LINK
                           0013DF  3582 LINK = . 
      00945F 08                    3583         .byte      8
      009460 56 41 52 49 41 42 4C  3584         .ascii     "VARIABLE"
             45
      009468                       3585 VARIA:
                           000001  3586 .if PICATOUT_MOD
                                   3587 ; indirect variable so that VARIABLE definition can be compiled in FLASH 
      009468 CD 88 A3         [ 4] 3588         CALL HERE
      00946B CD 82 E7         [ 4] 3589         CALL DUPP 
      00946E CD 87 57         [ 4] 3590         CALL CELLP 
      009471 CD 84 23         [ 4] 3591         CALL CPP 
      009474 CD 82 29         [ 4] 3592         CALL STORE 
                                   3593 .endif         
      009477 CD 94 4D         [ 4] 3594         CALL     CREAT
      00947A CD 82 E7         [ 4] 3595         CALL DUPP
      00947D CD 91 71         [ 4] 3596         CALL COMMA
      009480 CD 87 B6         [ 4] 3597         CALL     ZERO
                           000001  3598 .if PICATOUT_MOD 
      009483 CD 82 F7         [ 4] 3599         call SWAPP 
      009486 CD 82 29         [ 4] 3600         CALL   STORE 
      009489 CD 9B 8A         [ 4] 3601         CALL FMOVE ; move definition to FLASH
      00948C 81               [ 4] 3602         RET 
                                   3603 .endif ;PICATOUT_MOD        
                                   3604 
                           000001  3605 .if PICATOUT_MOD
                                   3606 ;       CONSTANT  ( n -- ; <string> )
                                   3607 ;       Compile a new constant 
                                   3608 ;       n CONSTANT name 
      00948D 94 5F                 3609         .word LINK 
                           00140F  3610         LINK=. 
      00948F 08                    3611         .byte 8 
      009490 43 4F 4E 53 54 41 4E  3612         .ascii "CONSTANT" 
             54
      009498                       3613 constant:          
      009498 CD 8E 2E         [ 4] 3614         CALL TOKEN
      00949B CD 93 4E         [ 4] 3615         CALL SNAME 
      00949E CD 93 CF         [ 4] 3616         CALL OVERT 
      0094A1 CD 91 B6         [ 4] 3617         CALL COMPI 
      0094A4 CD 94 B5         [ 4] 3618         CALL DOCONST
      0094A7 CD 91 71         [ 4] 3619         CALL COMMA 
      0094AA 81               [ 4] 3620         RET          
                                   3621 
                                   3622 ; CONSTANT runtime semantic 
                                   3623 ; doCONST  ( -- n )
      0094AB 94 8F                 3624         .word LINK 
                           00142D  3625         LINK=.
      0094AD 07                    3626         .byte 7
      0094AE 44 4F 43 4F 4E 53 54  3627         .ascii "DOCONST"
      0094B5                       3628 DOCONST:
      0094B5 1D 00 02         [ 2] 3629         subw x,#CELLL
      0094B8 90 85            [ 2] 3630         popw y 
      0094BA 90 FE            [ 2] 3631         ldw y,(y) 
      0094BC FF               [ 2] 3632         ldw (x),y 
      0094BD 81               [ 4] 3633         ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



                                   3634 .endif ;PICATOUT_MOD
                                   3635 
                                   3636 
                                   3637 ;; Tools
                                   3638 
                                   3639 ;       _TYPE   ( b u -- )
                                   3640 ;       Display a string. Filter
                                   3641 ;       non-printing characters.
      0094BE 94 AD                 3642         .word      LINK
                           001440  3643 LINK = . 
      0094C0 05                    3644         .byte      5
      0094C1 5F 54 59 50 45        3645         .ascii     "_TYPE"
      0094C6                       3646 UTYPE:
      0094C6 CD 82 B0         [ 4] 3647         CALL     TOR     ;start count down loop
      0094C9 20 0F            [ 2] 3648         JRA     UTYP2   ;skip first pass
      0094CB CD 82 E7         [ 4] 3649 UTYP1:  CALL     DUPP
      0094CE CD 82 5E         [ 4] 3650         CALL     CAT
      0094D1 CD 87 E0         [ 4] 3651         CALL     TCHAR
      0094D4 CD 81 A2         [ 4] 3652         CALL     EMIT    ;display only printable
      0094D7 CD 87 82         [ 4] 3653         CALL     ONEP    ;increment address
      0094DA CD 81 CC         [ 4] 3654 UTYP2:  CALL     DONXT
      0094DD 94 CB                 3655         .word      UTYP1   ;loop till done
      0094DF CC 82 DD         [ 2] 3656         JP     DROP
                                   3657 
                                   3658 ;       dm+     ( a u -- a )
                                   3659 ;       Dump u bytes from ,
                                   3660 ;       leaving a+u on  stack.
      0094E2 94 C0                 3661         .word      LINK
                           001464  3662 LINK = . 
      0094E4 03                    3663         .byte      3
      0094E5 64 6D 2B              3664         .ascii     "dm+"
      0094E8                       3665 DUMPP:
      0094E8 CD 83 11         [ 4] 3666         CALL     OVER
      0094EB CD 81 B8         [ 4] 3667         CALL     DOLIT
      0094EE 00 04                 3668         .word      4
      0094F0 CD 8C 84         [ 4] 3669         CALL     UDOTR   ;display address
      0094F3 CD 8B D4         [ 4] 3670         CALL     SPACE
      0094F6 CD 82 B0         [ 4] 3671         CALL     TOR     ;start count down loop
      0094F9 20 11            [ 2] 3672         JRA     PDUM2   ;skip first pass
      0094FB CD 82 E7         [ 4] 3673 PDUM1:  CALL     DUPP
      0094FE CD 82 5E         [ 4] 3674         CALL     CAT
      009501 CD 81 B8         [ 4] 3675         CALL     DOLIT
      009504 00 03                 3676         .word      3
      009506 CD 8C 84         [ 4] 3677         CALL     UDOTR   ;display numeric data
      009509 CD 87 82         [ 4] 3678         CALL     ONEP    ;increment address
      00950C CD 81 CC         [ 4] 3679 PDUM2:  CALL     DONXT
      00950F 94 FB                 3680         .word      PDUM1   ;loop till done
      009511 81               [ 4] 3681         RET
                                   3682 
                                   3683 ;       DUMP    ( a u -- )
                                   3684 ;       Dump u bytes from a,
                                   3685 ;       in a formatted manner.
      009512 94 E4                 3686         .word      LINK
                           001494  3687 LINK = . 
      009514 04                    3688         .byte      4
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      009515 44 55 4D 50           3689         .ascii     "DUMP"
      009519                       3690 DUMP:
      009519 CD 83 A4         [ 4] 3691         CALL     BASE
      00951C CD 82 40         [ 4] 3692         CALL     AT
      00951F CD 82 B0         [ 4] 3693         CALL     TOR
      009522 CD 8A 5C         [ 4] 3694         CALL     HEX     ;save radix, set hex
      009525 CD 81 B8         [ 4] 3695         CALL     DOLIT
      009528 00 10                 3696         .word      16
      00952A CD 86 A8         [ 4] 3697         CALL     SLASH   ;change count to lines
      00952D CD 82 B0         [ 4] 3698         CALL     TOR     ;start count down loop
      009530 CD 8C 1C         [ 4] 3699 DUMP1:  CALL     CR
      009533 CD 81 B8         [ 4] 3700         CALL     DOLIT
      009536 00 10                 3701         .word      16
      009538 CD 84 8E         [ 4] 3702         CALL     DDUP
      00953B CD 94 E8         [ 4] 3703         CALL     DUMPP   ;display numeric
      00953E CD 84 63         [ 4] 3704         CALL     ROT
      009541 CD 84 63         [ 4] 3705         CALL     ROT
      009544 CD 8B D4         [ 4] 3706         CALL     SPACE
      009547 CD 8B D4         [ 4] 3707         CALL     SPACE
      00954A CD 94 C6         [ 4] 3708         CALL     UTYPE   ;display printable characters
      00954D CD 81 CC         [ 4] 3709         CALL     DONXT
      009550 95 30                 3710         .word      DUMP1   ;loop till done
      009552 CD 82 DD         [ 4] 3711 DUMP3:  CALL     DROP
      009555 CD 82 91         [ 4] 3712         CALL     RFROM
      009558 CD 83 A4         [ 4] 3713         CALL     BASE
      00955B CC 82 29         [ 2] 3714         JP     STORE   ;restore radix
                                   3715 
                                   3716 ;       .S      ( ... -- ... )
                                   3717 ;        Display  contents of stack.
      00955E 95 14                 3718         .word      LINK
                           0014E0  3719 LINK = . 
      009560 02                    3720         .byte      2
      009561 2E 53                 3721         .ascii     ".S"
      009563                       3722 DOTS:
      009563 CD 8C 1C         [ 4] 3723         CALL     CR
      009566 CD 87 F9         [ 4] 3724         CALL     DEPTH   ;stack depth
      009569 CD 82 B0         [ 4] 3725         CALL     TOR     ;start count down loop
      00956C 20 0C            [ 2] 3726         JRA     DOTS2   ;skip first pass
      00956E CD 82 A4         [ 4] 3727 DOTS1:  CALL     RAT
      009571 CD 87 82         [ 4] 3728         CALL ONEP
      009574 CD 88 10         [ 4] 3729 	CALL     PICK
      009577 CD 8C B7         [ 4] 3730         CALL     DOT     ;index stack, display contents
      00957A CD 81 CC         [ 4] 3731 DOTS2:  CALL     DONXT
      00957D 95 6E                 3732         .word      DOTS1   ;loop till done
      00957F CD 8C 5B         [ 4] 3733         CALL     DOTQP
      009582 05                    3734         .byte      5
      009583 20 3C 73 70 20        3735         .ascii     " <sp "
      009588 81               [ 4] 3736         RET
                                   3737 
                                   3738 ;       >NAME   ( ca -- na | F )
                                   3739 ;       Convert code address
                                   3740 ;       to a name address.
      009589 95 60                 3741         .word      LINK
                           00150B  3742 LINK = . 
      00958B 05                    3743         .byte      5
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      00958C 3E 4E 41 4D 45        3744         .ascii     ">NAME"
      009591                       3745 TNAME:
      009591 CD 84 15         [ 4] 3746         CALL     CNTXT   ;vocabulary link
      009594 CD 82 40         [ 4] 3747 TNAM2:  CALL     AT
      009597 CD 82 E7         [ 4] 3748         CALL     DUPP    ;?last word in a vocabulary
      00959A CD 81 EB         [ 4] 3749         CALL     QBRAN
      00959D 95 B8                 3750         .word      TNAM4
      00959F CD 84 8E         [ 4] 3751         CALL     DDUP
      0095A2 CD 8E 3C         [ 4] 3752         CALL     NAMET
      0095A5 CD 83 5C         [ 4] 3753         CALL     XORR    ;compare
      0095A8 CD 81 EB         [ 4] 3754         CALL     QBRAN
      0095AB 95 B2                 3755         .word      TNAM3
      0095AD CD 87 66         [ 4] 3756         CALL     CELLM   ;continue with next word
      0095B0 20 E2            [ 2] 3757         JRA     TNAM2
      0095B2 CD 82 F7         [ 4] 3758 TNAM3:  CALL     SWAPP
      0095B5 CC 82 DD         [ 2] 3759         JP     DROP
      0095B8 CD 84 83         [ 4] 3760 TNAM4:  CALL     DDROP
      0095BB CC 87 B6         [ 2] 3761         JP     ZERO
                                   3762 
                                   3763 ;       .ID     ( na -- )
                                   3764 ;        Display  name at address.
      0095BE 95 8B                 3765         .word      LINK
                           001540  3766 LINK = . 
      0095C0 03                    3767         .byte      3
      0095C1 2E 49 44              3768         .ascii     ".ID"
      0095C4                       3769 DOTID:
      0095C4 CD 84 52         [ 4] 3770         CALL     QDUP    ;if zero no name
      0095C7 CD 81 EB         [ 4] 3771         CALL     QBRAN
      0095CA 95 DA                 3772         .word      DOTI1
      0095CC CD 88 8C         [ 4] 3773         CALL     COUNT
      0095CF CD 81 B8         [ 4] 3774         CALL     DOLIT
      0095D2 00 1F                 3775         .word      0x1F
      0095D4 CD 83 33         [ 4] 3776         CALL     ANDD    ;mask lexicon bits
      0095D7 CC 94 C6         [ 2] 3777         JP     UTYPE
      0095DA CD 8C 5B         [ 4] 3778 DOTI1:  CALL     DOTQP
      0095DD 09                    3779         .byte      9
      0095DE 20 6E 6F 4E 61 6D 65  3780         .ascii     " noName"
      0095E5 81               [ 4] 3781         RET
                                   3782 
                           000000  3783 WANT_SEE=0 
                           000000  3784 .if WANT_SEE 
                                   3785 ;       SEE     ( -- ; <string> )
                                   3786 ;       A simple decompiler.
                                   3787 ;       Updated for byte machines.
                                   3788         .word      LINK
                                   3789 LINK = . 
                                   3790         .byte      3
                                   3791         .ascii     "SEE"
                                   3792 SEE:
                                   3793         CALL     TICK    ;starting address
                                   3794         CALL     CR
                                   3795         CALL     ONEM
                                   3796 SEE1:   CALL     ONEP
                                   3797         CALL     DUPP
                                   3798         CALL     AT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



                                   3799         CALL     DUPP    ;?does it contain a zero
                                   3800         CALL     QBRAN
                                   3801         .word    SEE2
                                   3802         CALL     TNAME   ;?is it a name
                                   3803 SEE2:   CALL     QDUP    ;name address or zero
                                   3804         CALL     QBRAN
                                   3805         .word    SEE3
                                   3806         CALL     SPACE
                                   3807         CALL     DOTID   ;display name
                                   3808         CALL     ONEP
                                   3809         JRA      SEE4
                                   3810 SEE3:   CALL     DUPP
                                   3811         CALL     CAT
                                   3812         CALL     UDOT    ;display number
                                   3813 SEE4:   CALL     NUFQ    ;user control
                                   3814         CALL     QBRAN
                                   3815         .word    SEE1
                                   3816         JP     DROP
                                   3817 .endif ; WANT_SEE 
                                   3818 
                                   3819 ;       WORDS   ( -- )
                                   3820 ;       Display names in vocabulary.
      0095E6 95 C0                 3821         .word      LINK
                           001568  3822 LINK = . 
      0095E8 05                    3823         .byte      5
      0095E9 57 4F 52 44 53        3824         .ascii     "WORDS"
      0095EE                       3825 WORDS:
      0095EE CD 8C 1C         [ 4] 3826         CALL     CR
      0095F1 CD 84 15         [ 4] 3827         CALL     CNTXT   ;only in context
      0095F4 CD 82 40         [ 4] 3828 WORS1:  CALL     AT
      0095F7 CD 84 52         [ 4] 3829         CALL     QDUP    ;?at end of list
      0095FA CD 81 EB         [ 4] 3830         CALL     QBRAN
      0095FD 96 13                 3831         .word      WORS2
      0095FF CD 82 E7         [ 4] 3832         CALL     DUPP
      009602 CD 8B D4         [ 4] 3833         CALL     SPACE
      009605 CD 95 C4         [ 4] 3834         CALL     DOTID   ;display a name
      009608 CD 87 66         [ 4] 3835         CALL     CELLM
      00960B CD 82 02         [ 4] 3836         CALL     BRAN
      00960E 95 F4                 3837         .word      WORS1
      009610 CD 82 DD         [ 4] 3838         CALL     DROP
      009613 81               [ 4] 3839 WORS2:  RET
                                   3840 
                                   3841         
                                   3842 ;; Hardware reset
                                   3843 
                                   3844 ;       hi      ( -- )
                                   3845 ;       Display sign-on message.
      009614 95 E8                 3846         .word      LINK
                           001596  3847 LINK = . 
      009616 02                    3848         .byte      2
      009617 68 69                 3849         .ascii     "hi"
      009619                       3850 HI:
      009619 CD 8C 1C         [ 4] 3851         CALL     CR
      00961C CD 8C 5B         [ 4] 3852         CALL     DOTQP   ;initialize I/O
      00961F 0F                    3853         .byte      15
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



      009620 73 74 6D 38 65 46 6F  3854         .ascii     "stm8eForth v"
             72 74 68 20 76
      00962C 32                    3855 	.byte      VER+'0'
      00962D 2E                    3856         .byte      '.' 
      00962E 31                    3857 	.byte      EXT+'0' ;version
      00962F CC 8C 1C         [ 2] 3858         JP     CR
                                   3859 
                           000000  3860 WANT_DEBUG=0
                           000000  3861 .if WANT_DEBUG 
                                   3862 ;       DEBUG      ( -- )
                                   3863 ;       Display sign-on message.
                                   3864 ;        .word      LINK
                                   3865 LINK = . 
                                   3866         .byte      5
                                   3867         .ascii     "DEBUG"
                                   3868 DEBUG:
                                   3869 	CALL DOLIT
                                   3870 	.word 0x65
                                   3871 	CALL EMIT
                                   3872 	CALL DOLIT
                                   3873 	.word 0
                                   3874  	CALL ZLESS 
                                   3875 	CALL DOLIT
                                   3876 	.word 0xFFFE
                                   3877 	CALL ZLESS 
                                   3878 	CALL UPLUS 
                                   3879  	CALL DROP 
                                   3880 	CALL DOLIT
                                   3881 	.word 3
                                   3882 	CALL UPLUS 
                                   3883 	CALL UPLUS 
                                   3884  	CALL DROP
                                   3885 	CALL DOLIT
                                   3886 	.word 0x43
                                   3887 	CALL UPLUS 
                                   3888  	CALL DROP
                                   3889 	CALL EMIT
                                   3890 	CALL DOLIT
                                   3891 	.word 0x4F
                                   3892 	CALL DOLIT
                                   3893 	.word 0x6F
                                   3894  	CALL XORR
                                   3895 	CALL DOLIT
                                   3896 	.word 0xF0
                                   3897  	CALL ANDD
                                   3898 	CALL DOLIT
                                   3899 	.word 0x4F
                                   3900  	CALL ORR
                                   3901 	CALL EMIT
                                   3902 	CALL DOLIT
                                   3903 	.word 8
                                   3904 	CALL DOLIT
                                   3905 	.word 6
                                   3906  	CALL SWAPP
                                   3907 	CALL OVER
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



                                   3908 	CALL XORR
                                   3909 	CALL DOLIT
                                   3910 	.word 3
                                   3911 	CALL ANDD 
                                   3912 	CALL ANDD
                                   3913 	CALL DOLIT
                                   3914 	.word 0x70
                                   3915 	CALL UPLUS 
                                   3916 	CALL DROP
                                   3917 	CALL EMIT
                                   3918 	CALL DOLIT
                                   3919 	.word 0
                                   3920 	CALL QBRAN
                                   3921 	.word DEBUG1
                                   3922 	CALL DOLIT
                                   3923 	.word 0x3F
                                   3924 DEBUG1:
                                   3925 	CALL DOLIT
                                   3926 	.word 0xFFFF
                                   3927 	CALL QBRAN
                                   3928 	.word DEBUG2
                                   3929 	CALL DOLIT
                                   3930 	.word 0x74
                                   3931 	CALL BRAN
                                   3932 	.word DEBUG3
                                   3933 DEBUG2:
                                   3934 	CALL DOLIT
                                   3935 	.word 0x21
                                   3936 DEBUG3:
                                   3937 	CALL EMIT
                                   3938 	CALL DOLIT
                                   3939 	.word 0x68
                                   3940 	CALL DOLIT
                                   3941 	.word 0x80
                                   3942 	CALL STORE
                                   3943 	CALL DOLIT
                                   3944 	.word 0x80
                                   3945 	CALL AT
                                   3946 	CALL EMIT
                                   3947 	CALL DOLIT
                                   3948 	.word 0x4D
                                   3949 	CALL TOR
                                   3950 	CALL RAT
                                   3951 	CALL RFROM
                                   3952 	CALL ANDD
                                   3953 	CALL EMIT
                                   3954 	CALL DOLIT
                                   3955 	.word 0x61
                                   3956 	CALL DOLIT
                                   3957 	.word 0xA
                                   3958 	CALL TOR
                                   3959 DEBUG4:
                                   3960 	CALL DOLIT
                                   3961 	.word 1
                                   3962 	CALL UPLUS 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



                                   3963 	CALL DROP
                                   3964 	CALL DONXT
                                   3965 	.word DEBUG4
                                   3966 	CALL EMIT
                                   3967 	CALL DOLIT
                                   3968 	.word 0x656D
                                   3969 	CALL DOLIT
                                   3970 	.word 0x100
                                   3971 	CALL UMSTA
                                   3972 	CALL SWAPP
                                   3973 	CALL DOLIT
                                   3974 	.word 0x100
                                   3975 	CALL UMSTA
                                   3976 	CALL SWAPP 
                                   3977 	CALL DROP
                                   3978 	CALL EMIT
                                   3979 	CALL EMIT
                                   3980 	CALL DOLIT
                                   3981 	.word 0x2043
                                   3982 	CALL DOLIT
                                   3983 	.word 0
                                   3984 	CALL DOLIT
                                   3985 	.word 0x100
                                   3986 	CALL UMMOD
                                   3987 	CALL EMIT
                                   3988 	CALL EMIT
                                   3989 	;JP ORIG
                                   3990 	RET
                                   3991 .endif ; WANT_DEBUG 
                                   3992 
                                   3993 
                                   3994 ;       'BOOT   ( -- a )
                                   3995 ;       The application startup vector.
      009632 96 16                 3996         .word      LINK
                           0015B4  3997 LINK = . 
      009634 05                    3998         .byte      5
      009635 27 42 4F 4F 54        3999         .ascii     "'BOOT"
      00963A                       4000 TBOOT:
      00963A CD 83 94         [ 4] 4001         CALL     DOVAR
      00963D 40 02                 4002         .word    APP_RUN      ;application to boot
                                   4003 
                                   4004 ;       COLD    ( -- )
                                   4005 ;       The hilevel cold start s=ence.
      00963F 96 34                 4006         .word      LINK
                           0015C1  4007 LINK = . 
      009641 04                    4008         .byte      4
      009642 43 4F 4C 44           4009         .ascii     "COLD"
      009646                       4010 COLD:
                           000000  4011 .if WANT_DEBUG
                                   4012         CALL DEBUG
                                   4013 .endif 
      009646 CD 81 B8         [ 4] 4014 COLD1:  CALL     DOLIT
      009649 80 A7                 4015         .word      UZERO
      00964B CD 81 B8         [ 4] 4016 	CALL     DOLIT
      00964E 00 06                 4017         .word      UPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      009650 CD 81 B8         [ 4] 4018         CALL     DOLIT
      009653 00 16                 4019 	.word      UEND-UZERO
      009655 CD 88 F0         [ 4] 4020         CALL     CMOVE   ;initialize user area
                                   4021 
                           000001  4022 .if PICATOUT_MOD
                                   4023 ; if APP_RUN==0 initialize with ca de 'hi'  
      009658 90 CE 40 02      [ 2] 4024         ldw y,APP_RUN 
      00965C 26 15            [ 1] 4025         jrne 0$
      00965E 1D 00 06         [ 2] 4026         subw x,#3*CELLL 
      009661 90 AE 40 02      [ 2] 4027         ldw y,#APP_RUN 
      009665 EF 02            [ 2] 4028         ldw (2,x),y
      009667 90 5F            [ 1] 4029         clrw y 
      009669 FF               [ 2] 4030         ldw (x),y
      00966A 90 AE 96 19      [ 2] 4031         ldw y,#HI 
      00966E EF 04            [ 2] 4032         ldw (4,x),y 
      009670 CD 98 47         [ 4] 4033         call ee_store 
      009673                       4034 0$:        
                                   4035 ; update LAST with APP_LAST 
                                   4036 ; if APP_LAST > LAST else do the opposite
      009673 90 CE 40 00      [ 2] 4037         ldw y,APP_LAST 
      009677 90 B3 1A         [ 2] 4038         cpw y,ULAST 
      00967A 22 0E            [ 1] 4039         jrugt 1$ 
                                   4040 ; save LAST at APP_LAST  
      00967C CD 84 42         [ 4] 4041         call LAST 
      00967F CD 82 40         [ 4] 4042         call AT  
      009682 CD 97 0A         [ 4] 4043         call eeprom 
      009685 CD 98 47         [ 4] 4044         call ee_store 
      009688 20 03            [ 2] 4045         jra 2$
      00968A                       4046 1$: ; update LAST with APP_LAST 
      00968A 90 BF 1A         [ 2] 4047         ldw ULAST,y
      00968D                       4048 2$:  
                                   4049 ; update APP_HERE if < app_space 
      00968D 90 CE 40 04      [ 2] 4050         ldw y,APP_HERE 
      009691 90 A3 9C 00      [ 2] 4051         cpw y,#app_space 
      009695 24 19            [ 1] 4052         jruge 3$ 
      009697 1D 00 06         [ 2] 4053         subw x,#6 
      00969A 90 AE 9C 00      [ 2] 4054         ldw y,#app_space 
      00969E EF 04            [ 2] 4055         ldw (4,x),y 
      0096A0 90 AE 40 04      [ 2] 4056         ldw y,#APP_HERE 
      0096A4 EF 02            [ 2] 4057         ldw (2,x),y
      0096A6 90 5F            [ 1] 4058         clrw y 
      0096A8 FF               [ 2] 4059         ldw (x),y
      0096A9 CD 98 47         [ 4] 4060         call ee_store
      0096AC 90 AE 9C 00      [ 2] 4061         ldw y,#app_space
      0096B0                       4062 3$:
      0096B0 90 BF 18         [ 2] 4063         ldw UFCP,y         
                                   4064 ; update UCP with VAR_APP 
                                   4065 ; if VAR_APP>UCP else do the opposite 
      0096B3 90 CE 40 06      [ 2] 4066         ldw y,VAR_HERE 
      0096B7 90 B3 16         [ 2] 4067         cpw y,UCP 
      0096BA 22 17            [ 1] 4068         jrugt 4$
      0096BC CD 84 23         [ 4] 4069         call CPP 
      0096BF CD 82 40         [ 4] 4070         call AT 
      0096C2 1D 00 04         [ 2] 4071         subw x,#2*CELLL 
      0096C5 90 AE 40 06      [ 2] 4072         ldw y,#VAR_HERE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



      0096C9 EF 02            [ 2] 4073         ldw (2,x),y 
      0096CB 90 5F            [ 1] 4074         clrw y 
      0096CD FF               [ 2] 4075         ldw (x),y 
      0096CE CD 98 47         [ 4] 4076         call ee_store
      0096D1 20 03            [ 2] 4077         jra 6$
      0096D3                       4078 4$: ; update UCP with VAR_HERE 
      0096D3 90 BF 16         [ 2] 4079         ldw UCP,y 
      0096D6                       4080 6$:      
                                   4081 .endif ; PICATOUT_MOD
      0096D6 CD 91 1F         [ 4] 4082         CALL     PRESE   ;initialize data stack and TIB
      0096D9 CD 96 3A         [ 4] 4083         CALL     TBOOT
      0096DC CD 88 D9         [ 4] 4084         CALL     ATEXE   ;application boot
      0096DF CD 93 CF         [ 4] 4085         CALL     OVERT
      0096E2 CC 91 3C         [ 2] 4086         JP     QUIT    ;start interpretation
                                   4087 
                           000001  4088 .if PICATOUT_MOD
                                   4089         ; keep this include at end 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



                                   4090         .include "flash.asm"
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
      0096E5 96 41                   30     .word LINK 
                           001667    31     LINK=.
      0096E7 03                      32     .byte 3 
      0096E8 46 50 21                33     .ascii "FP!"
      0096EB                         34 fptr_store:
      0096EB 90 93            [ 1]   35     ldw y,x
      0096ED 90 FE            [ 2]   36     ldw y,(y)
      0096EF 90 9F            [ 1]   37     ld a,yl 
      0096F1 B7 2C            [ 1]   38     ld FPTR,a 
      0096F3 1C 00 02         [ 2]   39     addw x,#CELLL 
      0096F6 90 93            [ 1]   40     ldw y,x 
      0096F8 90 FE            [ 2]   41     ldw y,(y)
      0096FA 90 BF 2D         [ 2]   42     ldw PTR16,y
      0096FD 1C 00 02         [ 2]   43     addw x,#CELLL 
      009700 81               [ 4]   44     ret 
                                     45 
                                     46 ;-----------------------------------
                                     47 ; return EEPROM base address 
                                     48 ; as a double 
                                     49 ;  EEPROM  ( -- ud )
                                     50 ;-----------------------------------
      009701 96 E7                   51     .word LINK 
                           001683    52 LINK=.
      009703 06                      53     .byte 6 
      009704 45 45 50 52 4F 4D       54     .ascii "EEPROM"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



      00970A                         55 eeprom: 
      00970A 90 AE 40 00      [ 2]   56     ldw y,#EEPROM_BASE
      00970E 1D 00 04         [ 2]   57     subw x,#2*CELLL 
      009711 EF 02            [ 2]   58     ldw (2,x),y 
      009713 90 5F            [ 1]   59     clrw y 
      009715 FF               [ 2]   60     ldw (x),y 
      009716 81               [ 4]   61     ret
                                     62 
                                     63 ;----------------------------------
                                     64 ; fetch integer at address over 65535
                                     65 ;  F@   ( ud -- n )
                                     66 ;----------------------------------
      009717 97 03                   67     .word LINK 
                           001699    68 LINK=.
      009719 02                      69     .byte 2
      00971A 46 40                   70     .ascii "F@"
      00971C                         71 farat:
      00971C CD 96 EB         [ 4]   72     call fptr_store
      00971F 92 BC 00 2C      [ 5]   73     ldf a,[FPTR]
      009723 1D 00 02         [ 2]   74     subw x,#CELLL 
      009726 F7               [ 1]   75     ld (x),a 
      009727 90 AE 00 01      [ 2]   76     ldw y,#1
      00972B 91 AF 00 2C      [ 1]   77     ldf a,([FPTR],y)
      00972F E7 01            [ 1]   78     ld (1,x),a
      009731 81               [ 4]   79     ret 
                                     80 
                                     81 ;-------------------------------------
                                     82 ; fetch C at address over 65535 
                                     83 ; FC@ ( ud -- c)
                                     84 ;-------------------------------------
      009732 97 19                   85     .word LINK
                           0016B4    86     LINK=.
      009734 03                      87     .byte 3 
      009735 46 43 40                88     .ascii "FC@" 
      009738                         89 farcat:
      009738 CD 96 EB         [ 4]   90     call fptr_store 
      00973B 92 BC 00 2C      [ 5]   91     ldf a,[FPTR]
      00973F 1D 00 02         [ 2]   92     subw x,#CELLL 
      009742 E7 01            [ 1]   93     ld (1,x),a 
      009744 7F               [ 1]   94     clr (x)
      009745 81               [ 4]   95     ret 
                                     96     
                                     97 ;----------------------------------
                                     98 ; unlock EEPROM/OPT for writing/erasing
                                     99 ; wait endlessly for FLASH_IAPSR_DUL bit.
                                    100 ;  UNLKEE   ( -- )
                                    101 ;----------------------------------
      009746 97 34                  102     .word LINK 
                           0016C8   103 LINK=.
      009748 06                     104     .byte 6 
      009749 55 4E 4C 4B 45 45      105     .ascii "UNLKEE"
      00974F                        106 unlock_eeprom:
      00974F 35 00 50 5B      [ 1]  107 	mov FLASH_CR2,#0 
      009753 35 FF 50 5C      [ 1]  108 	mov FLASH_NCR2,#0xFF 
      009757 35 AE 50 64      [ 1]  109 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



      00975B 35 56 50 64      [ 1]  110     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      00975F 72 07 50 5F FB   [ 2]  111 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      009764 81               [ 4]  112 	ret
                                    113 
                                    114 ;----------------------------------
                                    115 ; unlock FLASH for writing/erasing
                                    116 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                    117 ; UNLKFL  ( -- )
                                    118 ;----------------------------------
      009765 97 48                  119     .word LINK 
                           0016E7   120 LINK=. 
      009767 06                     121     .byte 6 
      009768 55 4E 4C 4B 46 4C      122     .ascii "UNLKFL"    
      00976E                        123 unlock_flash:
      00976E 35 00 50 5B      [ 1]  124 	mov FLASH_CR2,#0 
      009772 35 FF 50 5C      [ 1]  125 	mov FLASH_NCR2,#0xFF 
      009776 35 56 50 62      [ 1]  126 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      00977A 35 AE 50 62      [ 1]  127 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      00977E 72 03 50 5F FB   [ 2]  128 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      009783 81               [ 4]  129 	ret
                                    130 
                                    131 ;-----------------------------
                                    132 ; unlock FLASH or EEPROM 
                                    133 ; according to FPTR address 
                                    134 ;  UNLOCK ( -- )
                                    135 ;-----------------------------
      009784 97 67                  136 	.word LINK 
                           001706   137 	LINK=.
      009786 06                     138 	.byte 6
      009787 55 4E 4C 4F 43 4B      139 	.ascii "UNLOCK"
      00978D                        140 unlock:
                                    141 ; put addr[15:0] in Y, for bounds check.
      00978D 90 BE 2D         [ 2]  142 	ldw y,PTR16   ; Y=addr15:0
                                    143 ; check addr[23:16], if <> 0 then it is extened flash memory
      009790 3D 2C            [ 1]  144 	tnz FPTR 
      009792 26 16            [ 1]  145 	jrne 4$
      009794 90 A3 80 00      [ 2]  146     cpw y,#FLASH_BASE
      009798 24 10            [ 1]  147     jruge 4$
      00979A 90 A3 40 00      [ 2]  148 	cpw y,#EEPROM_BASE  
      00979E 25 0D            [ 1]  149     jrult 9$
      0097A0 90 A3 48 7F      [ 2]  150 	cpw y,#OPTION_END 
      0097A4 22 07            [ 1]  151 	jrugt 9$
      0097A6 CD 97 4F         [ 4]  152 	call unlock_eeprom
      0097A9 81               [ 4]  153 	ret 
      0097AA CD 97 6E         [ 4]  154 4$: call unlock_flash
      0097AD 81               [ 4]  155 9$: ret 
                                    156 
                                    157 ;-------------------------
                                    158 ; lock write access to 
                                    159 ; FLASH and EEPROM 
                                    160 ; LOCK ( -- )
                                    161 ;-------------------------
      0097AE 97 86                  162 	.word LINK 
                           001730   163 	LINK=.
      0097B0 04                     164 	.byte 4 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



      0097B1 4C 4F 43 4B            165 	.ascii "LOCK" 
      0097B5                        166 lock: 
      0097B5 72 13 50 5F      [ 1]  167 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      0097B9 72 17 50 5F      [ 1]  168 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      0097BD 81               [ 4]  169 	ret 
                                    170 
                                    171 ;-------------------------
                                    172 ; increment FPTR 
                                    173 ; INC-FPTR ( -- )
                                    174 ;-------------------------
      0097BE 97 B0                  175 	.word LINK 
                           001740   176 	LINK=. 
      0097C0 08                     177 	.byte 8 
      0097C1 49 4E 43 2D 46 50 54   178 	.ascii "INC-FPTR" 
             52
      0097C9                        179 inc_fptr:
      0097C9 3C 2E            [ 1]  180 	inc PTR8 
      0097CB 26 08            [ 1]  181 	jrne 1$
      0097CD 90 BE 2C         [ 2]  182 	ldw y,FPTR 
      0097D0 90 5C            [ 2]  183 	incw y 
      0097D2 90 BF 2C         [ 2]  184 	ldw FPTR,y 
      0097D5 81               [ 4]  185 1$: ret 
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
      0097D6 97 C0                  196 	.word LINK 
                           001758   197 	LINK=. 
      0097D8 07                     198 	.byte 7 
      0097D9 57 52 2D 42 59 54 45   199 	.ascii "WR-BYTE" 
                                    200 
      0097E0                        201 write_byte:
      0097E0 90 93            [ 1]  202 	ldw y,x 
      0097E2 90 FE            [ 2]  203 	ldw y,(y)
      0097E4 1C 00 02         [ 2]  204 	addw x,#CELLL 
      0097E7 90 9F            [ 1]  205 	ld a,yl
      0097E9 92 BD 00 2C      [ 4]  206 	ldf [FPTR],a
      0097ED 72 05 50 5F FB   [ 2]  207 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      0097F2 20 D5            [ 2]  208 	jra inc_fptr 
                                    209 
                                    210 
                                    211 
                                    212 ;---------------------------------------
                                    213 ; write a byte to FLASH or EEPROM/OPTION  
                                    214 ; EEC!  (c ud -- )
                                    215 ;---------------------------------------
      0097F4 97 D8                  216     .word LINK 
                           001776   217 	LINK=.
      0097F6 04                     218     .byte 4 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



      0097F7 45 45 43 21            219     .ascii "EEC!"
                                    220 	; local variables 
                           000001   221 	BTW = 1   ; byte to write offset on stack
                           000002   222     OPT = 2 
                           000002   223 	VSIZE = 2
      0097FB                        224 ee_cstore:
      0097FB 52 02            [ 2]  225 	sub sp,#VSIZE
      0097FD CD 96 EB         [ 4]  226     call fptr_store
      009800 E6 01            [ 1]  227 	ld a,(1,x)
      009802 43               [ 1]  228 	cpl a 
      009803 6B 01            [ 1]  229 	ld (BTW,sp),a ; byte to write 
      009805 0F 02            [ 1]  230 	clr (OPT,sp)  ; OPTION flag
      009807 CD 97 8D         [ 4]  231 	call unlock 
                                    232 	; check if option
      00980A 3D 2C            [ 1]  233 	tnz FPTR 
      00980C 26 19            [ 1]  234 	jrne 2$
      00980E 90 BE 2D         [ 2]  235 	ldw y,PTR16 
      009811 90 A3 48 00      [ 2]  236 	cpw y,#OPTION_BASE
      009815 2B 10            [ 1]  237 	jrmi 2$
      009817 90 A3 48 80      [ 2]  238 	cpw y,#OPTION_END+1
      00981B 2A 0A            [ 1]  239 	jrpl 2$
      00981D 03 02            [ 1]  240 	cpl (OPT,sp)
                                    241 	; OPTION WRITE require this unlock 
      00981F 72 1E 50 5B      [ 1]  242     bset FLASH_CR2,#FLASH_CR2_OPT
      009823 72 1F 50 5C      [ 1]  243     bres FLASH_NCR2,#FLASH_CR2_OPT 
      009827                        244 2$: 
      009827 CD 97 E0         [ 4]  245 	call write_byte 	
      00982A 0D 02            [ 1]  246 	tnz (OPT,sp)
      00982C 27 0D            [ 1]  247 	jreq 3$ 
      00982E 7B 01            [ 1]  248     ld a,(BTW,sp)
      009830 90 5F            [ 1]  249     clrw y
      009832 90 97            [ 1]  250 	ld yl,a 
      009834 1D 00 02         [ 2]  251 	subw x,#CELLL 
      009837 FF               [ 2]  252 	ldw (x),y 
      009838 CD 97 E0         [ 4]  253 	call write_byte
      00983B                        254 3$: 
      00983B CD 97 B5         [ 4]  255 	call lock 
      00983E 5B 02            [ 2]  256 	addw sp,#VSIZE 
      009840 81               [ 4]  257     ret
                                    258 
                                    259 ;------------------------------
                                    260 ; write integer in FLASH|EEPROM
                                    261 ; EE! ( n ud -- )
                                    262 ;------------------------------
      009841 97 F6                  263 	.word LINK 
                           0017C3   264 	LINK=.
      009843 03                     265 	.byte 3 
      009844 45 45 21               266 	.ascii "EE!"
      009847                        267 ee_store:
      009847 CD 96 EB         [ 4]  268 	call fptr_store 
      00984A CD 97 8D         [ 4]  269 	call unlock 
      00984D 90 93            [ 1]  270 	ldw y,x 
      00984F 90 FE            [ 2]  271 	ldw y,(y)
      009851 90 89            [ 2]  272 	pushw y 
      009853 90 5E            [ 1]  273 	swapw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



      009855 FF               [ 2]  274 	ldw (x),y 
      009856 CD 97 E0         [ 4]  275 	call write_byte 
      009859 90 85            [ 2]  276 	popw y 
      00985B 1D 00 02         [ 2]  277 	subw x,#CELLL
      00985E FF               [ 2]  278 	ldw (x),y 
      00985F CD 97 E0         [ 4]  279 	call write_byte
      009862 CC 97 B5         [ 2]  280 	jp lock 
                                    281 
                                    282 
                                    283 ;----------------------------
                                    284 ; Erase flash memory row 
                                    285 ; stm8s208 as 128 bytes rows
                                    286 ; ROW-ERASE ( ud -- )
                                    287 ;----------------------------
      009865 98 43                  288 	.word LINK 
                           0017E7   289 	LINK=. 
      009867 09                     290 	.byte 9 
      009868 52 4F 57 2D 45 52 41   291 	.ascii "ROW-ERASE" 
             53 45
      009871                        292 row_erase:
      009871 CD 96 EB         [ 4]  293 	call fptr_store
                                    294 ;code must be execute from RAM 
                                    295 ;copy routine to PAD 
      009874 1D 00 02         [ 2]  296 	subw x,#CELLL 
      009877 90 AE 98 BE      [ 2]  297 	ldw y,#row_erase_proc
      00987B FF               [ 2]  298 	ldw (x),y 
      00987C CD 88 B4         [ 4]  299 	call PAD 
      00987F 90 AE 98 E5      [ 2]  300 	ldw y,#row_erase_proc_end 
      009883 72 A2 98 BE      [ 2]  301 	subw y,#row_erase_proc
      009887 1D 00 02         [ 2]  302 	subw x,#CELLL 
      00988A FF               [ 2]  303 	ldw (x),y 
      00988B CD 88 F0         [ 4]  304 	call CMOVE 
      00988E                        305 block_erase:
      00988E 90 BE 2D         [ 2]  306 	ldw y,FPTR+1
      009891 90 A3 9C 00      [ 2]  307 	cpw y,#app_space 
      009895 2A 13            [ 1]  308 	jrpl erase_flash 
                                    309 ; erase eeprom block
      009897 90 A3 40 00      [ 2]  310 	cpw y,#EEPROM_BASE 
      00989B 24 01            [ 1]  311 	jruge 1$
      00989D 81               [ 4]  312 	ret ; bad address 
      00989E 90 A3 47 FF      [ 2]  313 1$: cpw y,#EEPROM_END 
      0098A2 23 01            [ 2]  314 	jrule 2$ 
      0098A4 81               [ 4]  315 	ret ; bad address 
      0098A5                        316 2$:	
      0098A5 CD 97 4F         [ 4]  317 	call unlock_eeprom 
      0098A8 20 03            [ 2]  318 	jra proceed_erase
                                    319 ; erase flash block:
      0098AA                        320 erase_flash:
      0098AA CD 97 6E         [ 4]  321 	call unlock_flash 
      0098AD                        322 proceed_erase:
      0098AD CD 88 B4         [ 4]  323 	call PAD 
      0098B0 90 93            [ 1]  324 	ldw y,x
      0098B2 90 FE            [ 2]  325 	ldw y,(y)
      0098B4 1C 00 02         [ 2]  326 	addw x,#CELLL  
      0098B7 90 FD            [ 4]  327 	call (y) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



      0098B9 72 17 50 5F      [ 1]  328 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      0098BD 81               [ 4]  329 	ret 
                                    330 
                                    331 ; this routine is to be copied to PAD 
      0098BE                        332 row_erase_proc:
      0098BE 35 20 50 5B      [ 1]  333 	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
      0098C2 35 DF 50 5C      [ 1]  334 	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
      0098C6 4F               [ 1]  335 	clr a 
      0098C7 90 5F            [ 1]  336 	clrw y 
      0098C9 91 A7 00 2C      [ 1]  337 	ldf ([FPTR],y),a
      0098CD 90 5C            [ 2]  338     incw y
      0098CF 91 A7 00 2C      [ 1]  339 	ldf ([FPTR],y),a
      0098D3 90 5C            [ 2]  340     incw y
      0098D5 91 A7 00 2C      [ 1]  341 	ldf ([FPTR],y),a
      0098D9 90 5C            [ 2]  342     incw y
      0098DB 91 A7 00 2C      [ 1]  343 	ldf ([FPTR],y),a
      0098DF 72 05 50 5F FB   [ 2]  344 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      0098E4 81               [ 4]  345 	ret
      0098E5                        346 row_erase_proc_end:
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
      0098E5                        359 copy_buffer:
      0098E5 4B 80            [ 1]  360 	push #BLOCK_SIZE  
                                    361 ;enable block programming 
      0098E7 72 10 50 5B      [ 1]  362 	bset FLASH_CR2,#FLASH_CR2_PRG 
      0098EB 72 11 50 5C      [ 1]  363 	bres FLASH_NCR2,#FLASH_CR2_PRG
      0098EF 90 5F            [ 1]  364 	clrw y
      0098F1 F6               [ 1]  365 1$:	ld a,(x)
      0098F2 91 A7 00 2C      [ 1]  366 	ldf ([FPTR],y),a
      0098F6 5C               [ 2]  367 	incw x 
      0098F7 90 5C            [ 2]  368 	incw y 
      0098F9 0A 01            [ 1]  369 	dec (BCNT,sp)
      0098FB 26 F4            [ 1]  370 	jrne 1$
                                    371 ; wait EOP bit 
      0098FD 72 05 50 5F FB   [ 2]  372 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. 
      009902 84               [ 1]  373 	pop a ; remove BCNT from stack 
      009903 81               [ 4]  374 	ret 
      009904                        375 copy_buffer_end:
                                    376 
                                    377 ;-------------------------
                                    378 ; move program_row to RAM 
                                    379 ; in TIB 
                                    380 ;------------------------
      009904                        381 copy_prog_to_ram:
      009904 1D 00 06         [ 2]  382 	subw x,#6
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



      009907 90 AE 98 E5      [ 2]  383 	ldw y,#copy_buffer 
      00990B EF 04            [ 2]  384 	ldw (4,x),y 
      00990D 90 AE 17 00      [ 2]  385 	ldw y,#TIBBASE
      009911 EF 02            [ 2]  386 	ldw (2,x),y 
      009913 90 AE 99 04      [ 2]  387 	ldw y,#copy_buffer_end 
      009917 72 A2 98 E5      [ 2]  388 	subw y,#copy_buffer  
      00991B FF               [ 2]  389 	ldw (x),y 
      00991C CD 88 F0         [ 4]  390 	call CMOVE 
      00991F 81               [ 4]  391 	ret 
                                    392 
                                    393 
                                    394 ;-----------------------------
                                    395 ; write a row in FLASH/EEPROM 
                                    396 ; WR-ROW ( a ud -- )
                                    397 ; a -> address 128 byte buffer to write 
                                    398 ; ud ->  row address in FLASH|EEPROM 
                                    399 ;-----------------------------
      009920 98 67                  400 	.word LINK 
                           0018A2   401 	LINK=.
      009922 06                     402 	.byte 6 
      009923 57 52 2D 52 4F 57      403 	.ascii "WR-ROW"
      009929                        404 write_row:
      009929 CD 96 EB         [ 4]  405 	call fptr_store
                                    406 ; align to FLASH block 
      00992C A6 80            [ 1]  407 	ld a,#0x80 
      00992E B4 2E            [ 1]  408 	and a,PTR8 
      009930 B7 2E            [ 1]  409 	ld PTR8,a  
      009932 CD 99 04         [ 4]  410 	call copy_prog_to_ram
      009935 CD 97 8D         [ 4]  411 	call unlock
      009938 90 93            [ 1]  412 	ldw y,x 
      00993A 90 FE            [ 2]  413 	ldw y,(y)
      00993C 1C 00 02         [ 2]  414 	addw x,#CELLL 
      00993F 89               [ 2]  415 	pushw x 
      009940 93               [ 1]  416 	ldw x,y ; buffer address in x 
      009941 CD 17 00         [ 4]  417 	call TIBBASE
      009944 CD 97 B5         [ 4]  418 	call lock
      009947 85               [ 2]  419 	popw x 
      009948 81               [ 4]  420 	ret 
                                    421 
                                    422 ;-------------------------------------
                                    423 ; change value of OPTION register 
                                    424 ; SET-OPT (c n -- ) 
                                    425 ; c new value.
                                    426 ; n OPT  number {1..7}
                                    427 ;--------------------------------------
      009949 99 22                  428 		.word LINK 
                           0018CB   429 		LINK=.
      00994B 07                     430 		.byte 7 
      00994C 53 45 54 2D 4F 50 54   431 		.ascii "SET-OPT" 
      009953                        432 set_option: 
      009953 90 93            [ 1]  433 		ldw y,x 
      009955 90 FE            [ 2]  434 		ldw y,(y)
      009957 27 06            [ 1]  435 		jreq 1$
      009959 90 A3 00 07      [ 2]  436 		cpw y,#7 
      00995D 23 04            [ 2]  437 		jrule 2$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



                                    438 ; invalid OPTION number 		
      00995F 1C 00 04         [ 2]  439 1$:		addw x,#2*CELLL
      009962 81               [ 4]  440 		ret
      009963 90 58            [ 2]  441 2$:		sllw y 
      009965 72 A9 47 FF      [ 2]  442 		addw y,#OPTION_BASE-1
      009969 FF               [ 2]  443 		ldw (x),y 
      00996A 1D 00 02         [ 2]  444 		subw x,#CELLL 
      00996D 90 5F            [ 1]  445 		clrw y 
      00996F FF               [ 2]  446 		ldw (x),y 
      009970 CD 97 FB         [ 4]  447 		call ee_cstore
      009973 81               [ 4]  448 		ret 
                                    449 
                                    450 
                                    451 
                                    452 ;--------------------------------------
                                    453 ; reset system to its original state 
                                    454 ; before any user modification
                                    455 ; PRISTINE ( -- )
                                    456 ;-------------------------------------
      009974 99 4B                  457 	.word LINK  
                           0018F6   458 	LINK=.
      009976 08                     459 	.byte 8 
      009977 50 52 49 53 54 49 4E   460 	.ascii "PRISTINE"
             45
      00997F                        461 pristine:
                                    462 ;;; erase EEPROM
      00997F CD 97 0A         [ 4]  463 	call eeprom 
      009982 CD 84 8E         [ 4]  464 1$:	call DDUP 
      009985 CD 98 71         [ 4]  465 	call row_erase
      009988 90 93            [ 1]  466 	ldw y,x 
      00998A 90 EE 02         [ 2]  467 	ldw y,(2,y)
      00998D 72 A9 00 80      [ 2]  468 	addw y,#BLOCK_SIZE
      009991 EF 02            [ 2]  469 	ldw (2,x),y
      009993 90 A3 48 00      [ 2]  470 	cpw y,#OPTION_BASE 
      009997 25 E9            [ 1]  471 	jrult 1$
                                    472 ;;; reset OPTION to default values
      009999 90 AE 00 01      [ 2]  473 	ldw y,#1 ; OPT1 
      00999D FF               [ 2]  474 2$:	ldw (x),y   
      00999E 90 5F            [ 1]  475 	clrw y 
      0099A0 EF 02            [ 2]  476 	ldw (2,x),y  ; ( 0 1 -- ) 
      0099A2 CD 84 8E         [ 4]  477 	call DDUP    ; ( 0 1 0 1 -- )  
      0099A5 CD 99 53         [ 4]  478 	call set_option
      0099A8 90 93            [ 1]  479 	ldw y,x 
      0099AA 90 FE            [ 2]  480 	ldw y,(y)
      0099AC 90 5C            [ 2]  481 	incw y  ; next OPTION 
      0099AE 90 A3 00 08      [ 2]  482 	cpw y,#8 
      0099B2 25 E9            [ 1]  483 	jrult 2$
                                    484 ;;; erase first row of app_space 	
      0099B4 90 AE 9C 00      [ 2]  485 	ldw y,#app_space
      0099B8 EF 02            [ 2]  486 	ldw (2,x),y  
      0099BA 90 5F            [ 1]  487 	clrw y 
      0099BC FF               [ 2]  488 	ldw (x),y ; ( app_space 0 -- )
      0099BD CD 98 71         [ 4]  489 	call row_erase 
                                    490 ; reset interrupt vectors 
      0099C0 1D 00 02         [ 2]  491 	subw x,#CELLL 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      0099C3 90 5F            [ 1]  492 	clrw y  
      0099C5 FF               [ 2]  493 4$:	ldw (x),y  ; ( n -- ) int# 
      0099C6 CD 82 E7         [ 4]  494 	call DUPP  
      0099C9 CD 99 E6         [ 4]  495 	call reset_vector
      0099CC 90 93            [ 1]  496 	ldw y,x 
      0099CE 90 FE            [ 2]  497 	ldw y,(y)
      0099D0 90 5C            [ 2]  498 	incw y   ; next vector 
      0099D2 90 A3 00 19      [ 2]  499 	cpw y,#25 
      0099D6 25 ED            [ 1]  500 	jrult 4$
      0099D8 CC 80 80         [ 2]  501 	jp NonHandledInterrupt ; reset MCU
                                    502 
                                    503 ;------------------------------
                                    504 ; reset an interrupt vector 
                                    505 ; to its initial value 
                                    506 ; i.e. NonHandledInterrupt
                                    507 ; RST-IVEC ( n -- )
                                    508 ;-----------------------------
      0099DB 99 76                  509 	.word LINK 
                           00195D   510 	LINK=. 
      0099DD 08                     511 	.byte 8 
      0099DE 52 53 54 2D 49 56 45   512 	.ascii "RST-IVEC"
             43
      0099E6                        513 reset_vector:
      0099E6 90 93            [ 1]  514 	ldw y,x
      0099E8 1C 00 02         [ 2]  515 	addw x,#CELLL 
      0099EB 90 FE            [ 2]  516 	ldw y,(y)
      0099ED 90 A3 00 17      [ 2]  517 	cpw y,#23 
      0099F1 27 3A            [ 1]  518 	jreq 9$
      0099F3 90 A3 00 18      [ 2]  519 	cpw y,#24 ; last vector for stm8s208 
      0099F7 22 34            [ 1]  520 	jrugt 9$  
      0099F9 90 58            [ 2]  521 	sllw y 
      0099FB 90 58            [ 2]  522 	sllw y 
      0099FD 72 A9 80 08      [ 2]  523 	addw y,#0x8008 ; irq0 address 
      009A01 90 BF 1E         [ 2]  524 	ldw YTEMP,y
      009A04 1D 00 06         [ 2]  525 	subw x,#3*CELLL 
      009A07 EF 02            [ 2]  526 	ldw (2,x),y 
      009A09 90 5F            [ 1]  527 	clrw y
      009A0B FF               [ 2]  528 	ldw (x),y 
      009A0C A6 82            [ 1]  529 	ld a,#0x82 
      009A0E 90 95            [ 1]  530 	ld yh,a
      009A10 EF 04            [ 2]  531 	ldw (4,x),y
      009A12 CD 98 47         [ 4]  532 	call ee_store
      009A15 1D 00 06         [ 2]  533 	subw x,#3*CELLL
      009A18 90 5F            [ 1]  534 	clrw y 
      009A1A FF               [ 2]  535 	ldw (x),y 
      009A1B 90 AE 80 80      [ 2]  536 	ldw y,#NonHandledInterrupt
      009A1F EF 04            [ 2]  537 	ldw (4,x),y 
      009A21 90 BE 1E         [ 2]  538 	ldw y,YTEMP  
      009A24 72 A9 00 02      [ 2]  539 	addw y,#2
      009A28 EF 02            [ 2]  540 	ldw (2,x),y 
      009A2A CD 98 47         [ 4]  541 	call ee_store
      009A2D 81               [ 4]  542 9$:	ret 
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
      009A2E 99 DD                  552 	.word LINK
                           0019B0   553 	LINK=.
      009A30 08                     554 	.byte 8 
      009A31 53 45 54 2D 49 56 45   555 	.ascii "SET-IVEC" 
             43
      009A39                        556 set_vector:
      009A39 90 93            [ 1]  557     ldw y,x 
      009A3B 1C 00 02         [ 2]  558 	addw x,#CELLL 
      009A3E 90 FE            [ 2]  559 	ldw y,(y) ; vector #
      009A40 90 A3 00 18      [ 2]  560 	cpw y,#24 ; last vector for stm8s208  
      009A44 23 04            [ 2]  561 	jrule 2$
      009A46 1C 00 04         [ 2]  562 	addw x,#2*CELLL 
      009A49 81               [ 4]  563 	ret
      009A4A 90 58            [ 2]  564 2$:	sllw y 
      009A4C 90 58            [ 2]  565 	sllw y 
      009A4E 72 A9 80 08      [ 2]  566 	addw y,#0X8008 ; IRQ0 vector address 
      009A52 90 BF 1E         [ 2]  567 	ldw YTEMP,y ; vector address 
      009A55 A6 82            [ 1]  568 	ld a,#0x82 
      009A57 90 95            [ 1]  569 	ld yh,a 
      009A59 E6 01            [ 1]  570 	ld a,(1,x) ; isr address bits 23..16 
      009A5B 90 97            [ 1]  571 	ld yl,a 
                                    572 ;  write 0x82 + most significant byte of int address	
      009A5D 1D 00 06         [ 2]  573 	subw x,#3*CELLL 
      009A60 EF 04            [ 2]  574 	ldw (4,x),y 
      009A62 90 BE 1E         [ 2]  575 	ldw y,YTEMP
      009A65 EF 02            [ 2]  576 	ldw (2,x),y ; vector address 
      009A67 90 5F            [ 1]  577 	clrw y 
      009A69 FF               [ 2]  578 	ldw (x),y   ; as a double 
      009A6A CD 98 47         [ 4]  579 	call ee_store 
      009A6D 90 93            [ 1]  580 	ldw y,x 
      009A6F 90 EE 02         [ 2]  581 	ldw y,(2,y) ; bits 15..0 int vector 
      009A72 1D 00 06         [ 2]  582 	subw x,#3*CELLL 
      009A75 EF 04            [ 2]  583 	ldw (4,x),y 
      009A77 90 BE 1E         [ 2]  584 	ldw y,YTEMP 
      009A7A 72 A9 00 02      [ 2]  585 	addw y,#2 
      009A7E EF 02            [ 2]  586 	ldw (2,x),y 
      009A80 90 5F            [ 1]  587 	clrw y 
      009A82 FF               [ 2]  588 	ldw (x),y 
      009A83 CD 98 47         [ 4]  589 	call ee_store 
      009A86 81               [ 4]  590 9$: ret 
                                    591 
                                    592 
                                    593 ;------------------------
                                    594 ; Compile word to flash
                                    595 ; EE, (w -- )
                                    596 ;-----------------------
      009A87 9A 30                  597 	.word LINK
                           001A09   598 	LINK=.
      009A89 03                     599 	.byte 3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



      009A8A 45 45 2C               600 	.ascii "EE,"
      009A8D                        601 ee_comma:
      009A8D 1D 00 04         [ 2]  602 	subw x,#2*CELLL 
      009A90 90 BE 18         [ 2]  603 	ldw y,UFCP
      009A93 90 89            [ 2]  604 	pushw y 
      009A95 EF 02            [ 2]  605 	ldw (2,x),y 
      009A97 90 5F            [ 1]  606 	clrw y 
      009A99 FF               [ 2]  607 	ldw (x),y
      009A9A CD 98 47         [ 4]  608 	call ee_store
      009A9D 90 85            [ 2]  609 	popw y 
      009A9F 72 A9 00 02      [ 2]  610 	addw y,#2
      009AA3 90 BF 18         [ 2]  611 	ldw UFCP,y
      009AA6 81               [ 4]  612 	ret 
                                    613 
                                    614 ;-------------------------
                                    615 ; Compile byte to flash 
                                    616 ; EEC, ( c -- )	
                                    617 ;-------------------------
      009AA7 9A 89                  618 	.word LINK 
                           001A29   619 	LINK=.
      009AA9 04                     620 	.byte 4 
      009AAA 45 45 43 2C            621 	.ascii "EEC,"
      009AAE                        622 ee_ccomma:
      009AAE 1D 00 04         [ 2]  623 	subw x,#2*CELLL 
      009AB1 90 BE 18         [ 2]  624 	ldw y,UFCP
      009AB4 90 89            [ 2]  625 	pushw y 
      009AB6 EF 02            [ 2]  626 	ldw (2,x),y 
      009AB8 90 5F            [ 1]  627 	clrw y 
      009ABA FF               [ 2]  628 	ldw (x),y
      009ABB CD 97 FB         [ 4]  629 	call ee_cstore
      009ABE 90 85            [ 2]  630 	popw y 
      009AC0 90 5C            [ 2]  631 	incw y 
      009AC2 90 BF 18         [ 2]  632 	ldw UFCP,y
      009AC5 81               [ 4]  633 	ret 
                                    634 
                                    635 
                                    636 ;--------------------------
                                    637 ; copy FLASH block to ROWBUF
                                    638 ; ROW2BUF ( ud -- )
                                    639 ;--------------------------
      009AC6 9A A9                  640 	.word LINK 
                           001A48   641 	LINK=.
      009AC8 07                     642 	.byte 7 
      009AC9 52 4F 57 32 42 55 46   643 	.ascii "ROW2BUF"
      009AD0                        644 ROW2BUF: 
      009AD0 CD 96 EB         [ 4]  645 	call fptr_store 
      009AD3 A6 80            [ 1]  646 	ld a,#BLOCK_SIZE
      009AD5 88               [ 1]  647 	push a 
      009AD6 B4 2E            [ 1]  648 	and a,PTR8 ; block align 
      009AD8 B7 2E            [ 1]  649 	ld PTR8,a
      009ADA 90 AE 16 80      [ 2]  650 	ldw y,#ROWBUFF 
      009ADE 92 BC 00 2C      [ 5]  651 1$: ldf a,[FPTR]
      009AE2 90 F7            [ 1]  652 	ld (y),a
      009AE4 CD 97 C9         [ 4]  653 	call inc_fptr
      009AE7 90 5C            [ 2]  654 	incw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



      009AE9 0A 01            [ 1]  655 	dec (1,sp)
      009AEB 26 F1            [ 1]  656 	jrne 1$ 
      009AED 84               [ 1]  657 	pop a 
      009AEE 81               [ 4]  658 	ret 
                                    659 
                                    660 
                                    661 ;---------------------------
                                    662 ; copy ROWBUFF to flash 
                                    663 ; BUF2ROW ( ud -- )
                                    664 ; ud is row address as double 
                                    665 ;---------------------------
      009AEF 9A C8                  666 	.word LINK 
                           001A71   667 	LINK=.
      009AF1 07                     668 	.byte 7 
      009AF2 42 55 46 32 52 4F 57   669 	.ascii "BUF2ROW" 
      009AF9                        670 BUF2ROW:
      009AF9 CD 83 E2         [ 4]  671 	call TBUF ; ( ud rb -- )
      009AFC CD 84 63         [ 4]  672 	call ROT 
      009AFF CD 84 63         [ 4]  673 	call ROT  ; ( rb ud -- )
      009B02 CD 99 29         [ 4]  674 	call write_row 
      009B05 81               [ 4]  675 	ret 
                                    676 
                                    677 ;---------------------------------
                                    678 ; how many byte free in that row 
                                    679 ; RFREE ( a -- n )
                                    680 ; a is least byte of target address
                                    681 ;----------------------------------
      009B06 9A F1                  682 	.word LINK 
                           001A88   683 	LINK=.
      009B08 05                     684 	.byte 5 
      009B09 52 46 52 45 45         685 	.ascii "RFREE"
      009B0E                        686 RFREE:
      009B0E E6 01            [ 1]  687 	ld a,(1,x)
      009B10 A4 7F            [ 1]  688 	and a,#BLOCK_SIZE-1 
      009B12 B7 1E            [ 1]  689 	ld YTEMP,a 
      009B14 A6 80            [ 1]  690 	ld a,#BLOCK_SIZE 
      009B16 B0 1E            [ 1]  691 	sub a,YTEMP 
      009B18 90 5F            [ 1]  692 	clrw y 
      009B1A 90 97            [ 1]  693 	ld yl,a
      009B1C FF               [ 2]  694 	ldw (x),y 
      009B1D 81               [ 4]  695 	ret 
                                    696 
                                    697 ;---------------------------------
                                    698 ; write u bytes to flash/eeprom 
                                    699 ; constraint to row limit 
                                    700 ; RAM2EE ( ud a u -- u2 )
                                    701 ; ud flash address 
                                    702 ; a ram address 
                                    703 ; u bytes count
                                    704 ; return u2 bytes written  
                                    705 ;-------------------------------
      009B1E 9B 08                  706 	.word LINK 
                           001AA0   707 	LINK=. 
      009B20 06                     708 	.byte 6
      009B21 52 41 4D 32 45 45      709 	.ascii "RAM2EE"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



                                    710 	
      009B27                        711 RAM2EE:
                                    712 ; copy ud on top 
      009B27 90 93            [ 1]  713 	ldw y,x 
      009B29 90 EE 06         [ 2]  714 	ldw y,(6,y) ; LSW of ud  
      009B2C 90 BF 1E         [ 2]  715 	ldw YTEMP,y 
      009B2F 90 93            [ 1]  716 	ldw y,x 
      009B31 90 EE 04         [ 2]  717 	ldw y,(4,y)  ; MSW of ud 
      009B34 1D 00 04         [ 2]  718 	subw x,#2*CELLL 
      009B37 FF               [ 2]  719 	ldw (x),y 
      009B38 90 BE 1E         [ 2]  720 	ldw y,YTEMP 
      009B3B EF 02            [ 2]  721 	ldw (2,x),y 
      009B3D CD 9A D0         [ 4]  722 	call ROW2BUF 
      009B40 90 93            [ 1]  723 	ldw y,x 
      009B42 90 EE 06         [ 2]  724 	ldw y,(6,y)
      009B45 90 89            [ 2]  725 	pushw y ; udl 
      009B47 90 9F            [ 1]  726 	ld a,yl
      009B49 A4 7F            [ 1]  727 	and a,#BLOCK_SIZE-1 
      009B4B 90 5F            [ 1]  728 	clrw y 
      009B4D 90 97            [ 1]  729 	ld yl,a 
      009B4F 72 A9 16 80      [ 2]  730 	addw y,#ROWBUFF 
      009B53 1D 00 02         [ 2]  731 	subw x,#CELLL 
      009B56 FF               [ 2]  732 	ldw (x),y  
      009B57 CD 82 F7         [ 4]  733 	call SWAPP ;  ( ud a ra u -- )
      009B5A CD 82 91         [ 4]  734 	call RFROM  
      009B5D CD 9B 0E         [ 4]  735 	call RFREE 
      009B60 CD 85 A3         [ 4]  736 	call MIN
      009B63 CD 82 E7         [ 4]  737 	call DUPP 
      009B66 CD 82 B0         [ 4]  738 	call TOR  
      009B69 CD 88 F0         [ 4]  739 	call CMOVE
      009B6C CD 9A F9         [ 4]  740 	call BUF2ROW 
      009B6F CD 82 91         [ 4]  741 	call RFROM 
      009B72 81               [ 4]  742 	ret 
                                    743 
                                    744 ;--------------------------
                                    745 ; expand 16 bit address 
                                    746 ; to 32 bit address 
                                    747 ; FADDR ( a -- ud )
                                    748 ;--------------------------
      009B73 9B 20                  749 	.word LINK 
                           001AF5   750 	LINK=. 
      009B75 05                     751 	.byte 5 
      009B76 46 41 44 44 52         752 	.ascii "FADDR"
      009B7B                        753 FADDR:
      009B7B 1D 00 02         [ 2]  754 	subw x,#CELLL 
      009B7E 90 5F            [ 1]  755 	clrw y 
      009B80 FF               [ 2]  756 	ldw (x),y 
      009B81 81               [ 4]  757 	ret
                                    758 
                                    759 ;--------------------------
                                    760 ; move new colon definition to FLASH 
                                    761 ; using WR-ROW for efficiency 
                                    762 ; preserving bytes already used 
                                    763 ; in the current block. 
                                    764 ; ud+c must not exceed block boundary 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



                                    765 ; at this point the compiler as completed
                                    766 ; in RAM and pointers CP and CNTXT updated.
                                    767 ; CNTXT point to nfa of new word and  
                                    768 ; CP is after compiled word so CP-CNTXT+2=count to write 
                                    769 ; 
                                    770 ; FMOVE ( -- )
                                    771 ;--------------------------
      009B82 9B 75                  772 	.word LINK 
                           001B04   773 	LINK=.
      009B84 05                     774 	.byte 5 
      009B85 46 4D 4F 56 45         775 	.ascii "FMOVE" 
      009B8A                        776 FMOVE:
      009B8A CD 84 32         [ 4]  777 	call FCP
      009B8D CD 82 40         [ 4]  778 	call AT  
      009B90 CD 82 E7         [ 4]  779 	call DUPP ; ( udl udl -- )
      009B93 CD 84 15         [ 4]  780 	call CNTXT 
      009B96 CD 82 40         [ 4]  781 	call AT 
      009B99 CD 81 B8         [ 4]  782 	call DOLIT 
      009B9C 00 02                  783 	.word 2 
      009B9E CD 85 01         [ 4]  784 	call SUBB ; ( udl udl a -- )
      009BA1 CD 82 F7         [ 4]  785 	call SWAPP 
      009BA4 CD 9B 7B         [ 4]  786 	call FADDR 
      009BA7 CD 84 63         [ 4]  787 	call ROT  ; ( udl ud a -- )
      009BAA CD 82 E7         [ 4]  788 	call DUPP 
      009BAD CD 82 B0         [ 4]  789 	call TOR    ; R: a 
      009BB0 CD 88 A3         [ 4]  790 	call HERE 
      009BB3 CD 82 A4         [ 4]  791 	call RAT 
      009BB6 CD 85 01         [ 4]  792 	call SUBB ; (udl ud a wl -- )
      009BB9 CD 82 E7         [ 4]  793 	call DUPP 
      009BBC CD 82 B0         [ 4]  794 	call TOR  ; ( udl ud a wl -- ) R: a wl
      009BBF CD 9B 27         [ 4]  795 	call RAM2EE ; ( udl a u -- u2 ) u2 is byte written to FLASH 
      009BC2 CD 82 91         [ 4]  796 	call RFROM 
      009BC5 CD 82 91         [ 4]  797 	call RFROM
      009BC8 81               [ 4]  798 	ret 
                           000000   799 .if 0
                                    800  
                                    801 ; now adjust CNTXT,FCP,HERE and APP_HERE 	
                                    802 
                                    803 	ldw UCP,Y  ; adjust HERE 
                                    804 	ldw y,UFCP
                                    805 	addw y,#2 
                                    806 	ldw UCNTXT,y  
                                    807 	addw y,YTEMP 
                                    808 	subw y,#2 
                                    809 	ldw UFCP,y ;new FCP 
                                    810 ; update APP_HERE 
                                    811 	ldw (4,x),y ; new value of fcp to write to eeprom 
                                    812 	ldw y,#APP_HERE 
                                    813 	ldw (2,x),y 
                                    814 	clrw y 
                                    815 	ldw (x),y 
                                    816 	call ee_store 
                                    817 ; update APP_LAST 
                                    818 	subw x,#3*CELLL 
                                    819 	ldw y,UCNTXT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



                                    820 	ldw (4,x),y 
                                    821 	ldw y,#APP_LAST 
                                    822 	ldw (2,x),y 
                                    823 	clrw y 
                                    824 	ldw (x),y 
                                    825 	call ee_store 
                                    826 .endif  	
      009BC9 81               [ 4]  827 	ret 
                                    828 
                                    829 
                                    830 ; application code begin here
      009C00                        831 	.bndry 128 ; align on flash block  
      009C00                        832 app_space: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



                                   4091 .endif ; PICATOUT_MOD
                                   4092 
                                   4093 ;===============================================================
                                   4094 
                           001B04  4095 LASTN =	LINK   ;last name defined
                                   4096 
                                   4097 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
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
    BTW     =  000001     |   6 BUF2ROW    001A79 R   |     CALLL   =  0000CD 
    CAN_DGR =  005426     |     CAN_FPSR=  005427     |     CAN_IER =  005425 
    CAN_MCR =  005420     |     CAN_MSR =  005421     |     CAN_P0  =  005428 
    CAN_P1  =  005429     |     CAN_P2  =  00542A     |     CAN_P3  =  00542B 
    CAN_P4  =  00542C     |     CAN_P5  =  00542D     |     CAN_P6  =  00542E 
    CAN_P7  =  00542F     |     CAN_P8  =  005430     |     CAN_P9  =  005431 
    CAN_PA  =  005432     |     CAN_PB  =  005433     |     CAN_PC  =  005434 
    CAN_PD  =  005435     |     CAN_PE  =  005436     |     CAN_PF  =  005437 
    CAN_RFR =  005424     |     CAN_TPR =  005423     |     CAN_TSR =  005422 
    CARRY   =  000022     |   6 CAT        0001DE R   |   6 CCOMMA     001108 R
    CC_C    =  000000     |     CC_H    =  000004     |     CC_I0   =  000003 
    CC_I1   =  000005     |     CC_N    =  000002     |     CC_V    =  000007 
    CC_Z    =  000001     |     CELLL   =  000002     |   6 CELLM      0006E6 R
  6 CELLP      0006D7 R   |   6 CELLS      0006F5 R   |     CFG_GCR =  007F60 
    CFG_GCR_=  000001     |     CFG_GCR_=  000000     |   6 CHAR1      000B6E R
  6 CHAR2      000B71 R   |     CLKOPT  =  004807     |     CLKOPT_C=  000002 
    CLKOPT_E=  000003     |     CLKOPT_P=  000000     |     CLKOPT_P=  000001 
    CLK_CCOR=  0050C9     |     CLK_CKDI=  0050C6     |     CLK_CKDI=  000000 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]

Symbol Table

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
    CLK_SWR_=  0000D2     |   6 CMOV1      000878 R   |   6 CMOV2      000890 R
  6 CMOVE      000870 R   |     CNTDWN  =  00002A     |   6 CNTXT      000395 R
  6 COLD       0015C6 R   |   6 COLD1      0015C6 R   |   6 COLON      001395 R
  6 COMMA      0010F1 R   |   6 COMPI      001136 R   |     COMPO   =  000040 
    CONVERT_=  000001     |   6 COUNT      00080C R   |   6 CPP        0003A3 R
    CPU_A   =  007F00     |     CPU_CCR =  007F0A     |     CPU_PCE =  007F01 
    CPU_PCH =  007F02     |     CPU_PCL =  007F03     |     CPU_SPH =  007F08 
    CPU_SPL =  007F09     |     CPU_XH  =  007F04     |     CPU_XL  =  007F05 
    CPU_YH  =  007F06     |     CPU_YL  =  007F07     |   6 CR         000B9C R
  6 CREAT      0013CD R   |     CRR     =  00000D     |   6 CSTOR      0001CD R
    CTOP    =  000080     |   6 DAT        0007EC R   |     DATSTK  =  001670 
  6 DDROP      000403 R   |   6 DDUP       00040E R   |     DEBUG_BA=  007F00 
    DEBUG_EN=  007FFF     |   6 DECIM      0009F1 R   |   6 DEPTH      000779 R
    DEVID_BA=  0048CD     |     DEVID_EN=  0048D8     |     DEVID_LO=  0048D2 
    DEVID_LO=  0048D3     |     DEVID_LO=  0048D4     |     DEVID_LO=  0048D5 
    DEVID_LO=  0048D6     |     DEVID_LO=  0048D7     |     DEVID_LO=  0048D8 
    DEVID_WA=  0048D1     |     DEVID_XH=  0048CE     |     DEVID_XL=  0048CD 
    DEVID_YH=  0048D0     |     DEVID_YL=  0048CF     |   6 DGTQ1      000A36 R
  6 DIG        00096A R   |   6 DIGIT      000905 R   |   6 DIGS       00097B R
  6 DIGS1      00097B R   |   6 DIGS2      000988 R   |   6 DIGTQ      000A05 R
    DM_BK1RE=  007F90     |     DM_BK1RH=  007F91     |     DM_BK1RL=  007F92 
    DM_BK2RE=  007F93     |     DM_BK2RH=  007F94     |     DM_BK2RL=  007F95 
    DM_CR1  =  007F96     |     DM_CR2  =  007F97     |     DM_CSR1 =  007F98 
    DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A     |   6 DN1        00047B R
  6 DNEGA      000460 R   |   6 DOCONST    001435 R   |   6 DOLIT      000138 R
  6 DONXT      00014C R   |   6 DOSTR      000BB2 R   |   6 DOT        000C37 R
  6 DOT1       000C4D R   |   6 DOTI1      00155A R   |   6 DOTID      001544 R
  6 DOTO1      00104B R   |   6 DOTOK      001031 R   |   6 DOTPR      000D60 R
  6 DOTQ       001293 R   |   6 DOTQP      000BDB R   |   6 DOTR       000BE9 R
  6 DOTS       0014E3 R   |   6 DOTS1      0014EE R   |   6 DOTS2      0014FA R
  6 DOVAR      000314 R   |   6 DROP       00025D R   |   6 DSTOR      0007C6 R
  6 DUMP       001499 R   |   6 DUMP1      0014B0 R   |   6 DUMP3      0014D2 R
  6 DUMPP      001468 R   |   6 DUPP       000267 R   |   6 EDIGS      0009A6 R
    EEPROM_B=  004000     |     EEPROM_E=  0047FF     |     EEPROM_S=  000800 
  6 ELSEE      0011F5 R   |   6 EMIT       000122 R   |   6 EQ1        0004BF R
  6 EQUAL      0004A9 R   |   6 ERASE      0008D2 R   |     ERR     =  00001B 
  6 EVAL       001074 R   |   6 EVAL1      001074 R   |   6 EVAL2      001090 R
  6 EXE1       000867 R   |   6 EXECU      000192 R   |   6 EXIT       0001A2 R
    EXT     =  000001     |     EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1 
  6 EXTRC      00092D R   |   6 FADDR      001AFB R   |   6 FCP        0003B2 R
    FHSE    =  7A1200     |     FHSI    =  F42400     |   6 FILL       00089F R
  6 FILL1      0008BC R   |   6 FILL2      0008C5 R   |   6 FIND       000E12 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]

Symbol Table

  6 FIND1      000E30 R   |   6 FIND2      000E5E R   |   6 FIND3      000E6A R
  6 FIND4      000E7E R   |   6 FIND5      000E8B R   |   6 FIND6      000E6F R
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
    FLSI    =  01F400     |   6 FMOVE      001B0A R   |   6 FOR        001184 R
    FPTR    =  00002C     |     GPIO_BAS=  005000     |     GPIO_CR1=  000003 
    GPIO_CR2=  000004     |     GPIO_DDR=  000002     |     GPIO_IDR=  000001 
    GPIO_ODR=  000000     |     GPIO_SIZ=  000005     |   6 HERE       000823 R
  6 HEX        0009DC R   |   6 HI         001599 R   |   6 HLD        000382 R
  6 HOLD       000951 R   |     HSECNT  =  004809     |     I2C_CCRH=  00521C 
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
    I2C_TRIS=  000011     |     I2C_WRIT=  000000     |   6 IFF        0011CF R
    IMEDD   =  000080     |   6 IMMED      0013AA R   |   6 INCH       000116 R
  6 INN        000342 R   |     INPUT_DI=  000000     |     INPUT_EI=  000001 
    INPUT_FL=  000000     |     INPUT_PU=  000001     |   6 INTE1      001013 R
  6 INTER      000FE9 R   |     INT_ADC2=  000016     |     INT_AUAR=  000012 
    INT_AWU =  000001     |     INT_CAN_=  000008     |     INT_CAN_=  000009 
    INT_CLK =  000002     |     INT_EXTI=  000003     |     INT_EXTI=  000004 
    INT_EXTI=  000005     |     INT_EXTI=  000006     |     INT_EXTI=  000007 
    INT_FLAS=  000018     |     INT_I2C =  000013     |     INT_SPI =  00000A 
    INT_TIM1=  00000C     |     INT_TIM1=  00000B     |     INT_TIM2=  00000E 
    INT_TIM2=  00000D     |     INT_TIM3=  000010     |     INT_TIM3=  00000F 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]

Symbol Table

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
    INT_VECT=  00805C     |     INT_VECT=  008058     |   6 INVER      00043D R
    ITC_SPR1=  007F70     |     ITC_SPR2=  007F71     |     ITC_SPR3=  007F72 
    ITC_SPR4=  007F73     |     ITC_SPR5=  007F74     |     ITC_SPR6=  007F75 
    ITC_SPR7=  007F76     |     ITC_SPR8=  007F77     |     IWDG_KR =  0050E0 
    IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2     |   6 JSRC       001386 R
  6 KEY        000B1C R   |   6 KTAP       000F03 R   |   6 KTAP1      000F26 R
  6 KTAP2      000F29 R   |   6 LAST       0003C2 R   |   6 LASTN   =  001B04 R
  6 LBRAC      001020 R   |     LED2_BIT=  000005     |     LED2_MAS=  000020 
    LED2_POR=  00500A     |   6 LESS       0004E6 R   |     LF      =  00000A 
  6 LINK    =  001B04 R   |   6 LITER      001155 R   |   6 LT1        0004FC R
    MASKK   =  001F7F     |   6 MAX        000506 R   |   6 MAX1       000519 R
  6 MIN        000523 R   |   6 MIN1       000536 R   |   6 MMOD1      0005D9 R
  6 MMOD2      0005ED R   |   6 MMOD3      000604 R   |   6 MMSM1      000580 R
  6 MMSM2      000594 R   |   6 MMSM3      000596 R   |   6 MMSM4      00059E R
  6 MODD       00061E R   |   6 MONE       00074F R   |     MS      =  000028 
  6 MSEC       0000A3 R   |   6 MSMOD      0005BC R   |   6 MSTA1      0006AF R
  6 MSTAR      00068C R   |     NAFR    =  004804     |   6 NAMEQ      000EAB R
  6 NAMET      000DBC R   |     NCLKOPT =  004808     |   6 NEGAT      00044E R
  6 NEX1       000159 R   |   6 NEXT       001194 R   |     NFLASH_W=  00480E 
    NHSECNT =  00480A     |     NOPT1   =  004802     |     NOPT2   =  004804 
    NOPT3   =  004806     |     NOPT4   =  004808     |     NOPT5   =  00480A 
    NOPT6   =  00480C     |     NOPT7   =  00480E     |     NOPTBL  =  00487F 
  6 NTIB       000352 R   |     NUBC    =  004802     |   6 NUFQ       000B32 R
  6 NUFQ1      000B4B R   |   6 NUMBQ      000A49 R   |   6 NUMQ1      000A7D R
  6 NUMQ2      000AAE R   |   6 NUMQ3      000AF0 R   |   6 NUMQ4      000AF5 R
  6 NUMQ5      000B04 R   |   6 NUMQ6      000B07 R   |     NWDGOPT =  004806 
    NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF 
    NWDGOPT_=  FFFFFFFE     |   6 NonHandl   000000 R   |   6 ONE        000741 R
  6 ONEM       00070F R   |   6 ONEP       000702 R   |     OPT     =  000002 
    OPT0    =  004800     |     OPT1    =  004801     |     OPT2    =  004803 
    OPT3    =  004805     |     OPT4    =  004807     |     OPT5    =  004809 
    OPT6    =  00480B     |     OPT7    =  00480D     |     OPTBL   =  00487E 
    OPTION_B=  004800     |     OPTION_E=  00487F     |     OPTION_S=  000080 
  6 ORIG       00003F R   |   6 ORR        0002C7 R   |   6 OUTPUT     000127 R
    OUTPUT_F=  000001     |     OUTPUT_O=  000000     |     OUTPUT_P=  000001 
    OUTPUT_S=  000000     |   6 OVER       000291 R   |   6 OVERT      00134F R
    PA      =  000000     |   6 PACKS      0008E4 R   |   6 PAD        000834 R
  6 PAREN      000D6F R   |   6 PARS       000C68 R   |   6 PARS1      000C93 R
  6 PARS2      000CBE R   |   6 PARS3      000CC1 R   |   6 PARS4      000CCA R
  6 PARS5      000CED R   |   6 PARS6      000D02 R   |   6 PARS7      000D11 R
  6 PARS8      000D20 R   |   6 PARSE      000D31 R   |   6 PAUSE      0000B3 R
    PA_BASE =  005000     |     PA_CR1  =  005003     |     PA_CR2  =  005004 
    PA_DDR  =  005002     |     PA_IDR  =  005001     |     PA_ODR  =  005000 
    PB      =  000005     |     PB_BASE =  005005     |     PB_CR1  =  005008 
    PB_CR2  =  005009     |     PB_DDR  =  005007     |     PB_IDR  =  005006 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]

Symbol Table

    PB_ODR  =  005005     |     PC      =  00000A     |     PC_BASE =  00500A 
    PC_CR1  =  00500D     |     PC_CR2  =  00500E     |     PC_DDR  =  00500C 
    PC_IDR  =  00500B     |     PC_ODR  =  00500A     |     PD      =  00000F 
  6 PDUM1      00147B R   |   6 PDUM2      00148C R   |     PD_BASE =  00500F 
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
    PI      =  000028     |     PICATOUT=  000001     |   6 PICK       000790 R
    PI_BASE =  005028     |     PI_CR1  =  00502B     |     PI_CR2  =  00502C 
    PI_DDR  =  00502A     |     PI_IDR  =  005029     |     PI_ODR  =  005028 
  6 PLUS       000423 R   |   6 PNAM1      001304 R   |   6 PRESE      00109F R
    PROD1   =  00001C     |     PROD2   =  00001E     |     PROD3   =  000020 
  6 PSTOR      0007A5 R   |     PTR16   =  00002D     |     PTR8    =  00002E 
  6 QBRAN      00016B R   |   6 QDUP       0003D2 R   |   6 QDUP1      0003DC R
  6 QKEY       000104 R   |   6 QSTAC      001057 R   |   6 QUERY      000F83 R
  6 QUEST      000C5A R   |   6 QUIT       0010BC R   |   6 QUIT1      0010C4 R
  6 QUIT2      0010C7 R   |   6 RAM2EE     001AA7 R   |     RAMBASE =  000000 
    RAM_BASE=  000000     |     RAM_END =  0017FF     |     RAM_SIZE=  001800 
  6 RAT        000224 R   |   6 RBRAC      001373 R   |   6 REPEA      00124A R
  6 RFREE      001A8E R   |   6 RFROM      000211 R   |     ROP     =  004800 
  6 ROT        0003E3 R   |   6 ROW2BUF    001A50 R   |     ROWBUFF =  001680 
    RP0     =  000026     |   6 RPAT       0001EE R   |     RPP     =  0017FF 
  6 RPSTO      0001FB R   |     RST_SR  =  0050B3     |   6 SAME1      000DDA R
  6 SAME2      000E03 R   |   6 SAMEQ      000DD2 R   |   6 SCOM1      001339 R
  6 SCOM2      00133C R   |   6 SCOMP      00131B R   |   6 SEMIS      00135F R
    SFR_BASE=  005000     |     SFR_END =  0057FF     |   6 SIGN       000990 R
  6 SIGN1      0009A0 R   |   6 SLASH      000628 R   |   6 SLMOD      00060C R
  6 SNAME      0012CE R   |     SP0     =  000024     |   6 SPACE      000B54 R
  6 SPACS      000B63 R   |   6 SPAT       000247 R   |     SPI_CR1 =  005200 
    SPI_CR2 =  005201     |     SPI_CRCP=  005205     |     SPI_DR  =  005204 
    SPI_ICR =  005202     |     SPI_RXCR=  005206     |     SPI_SR  =  005203 
    SPI_TXCR=  005207     |     SPP     =  001670     |   6 SPSTO      000254 R
  6 SSMOD      0006B8 R   |     STACK   =  0017FF     |   6 STAR       000681 R
  6 STASL      0006C9 R   |   6 STORE      0001A9 R   |   6 STR        0009BE R
  6 STRCQ      001164 R   |   6 STRQ       001285 R   |   6 STRQP      000BD1 R
  6 SUBB       000481 R   |   6 SWAPP      000277 R   |     SWIM_CSR=  007F80 
  6 TAP        000EED R   |   6 TBOOT      0015BA R   |   6 TBUF       000362 R
    TBUFFBAS=  001680     |   6 TCHA1      000770 R   |   6 TCHAR      000760 R
  6 TEMP       000333 R   |   6 TEVAL      000373 R   |   6 THENN      0011E5 R
  6 TIB        000845 R   |     TIBB    =  001700     |     TIBBASE =  001700 
    TIC     =  000027     |   6 TICK       0010D3 R   |     TIM1_ARR=  005262 
    TIM1_ARR=  005263     |     TIM1_BKR=  00526D     |     TIM1_CCE=  00525C 
    TIM1_CCE=  00525D     |     TIM1_CCM=  005258     |     TIM1_CCM=  000000 
    TIM1_CCM=  000001     |     TIM1_CCM=  000004     |     TIM1_CCM=  000005 
    TIM1_CCM=  000006     |     TIM1_CCM=  000007     |     TIM1_CCM=  000002 
    TIM1_CCM=  000003     |     TIM1_CCM=  000007     |     TIM1_CCM=  000002 
    TIM1_CCM=  000004     |     TIM1_CCM=  000005     |     TIM1_CCM=  000006 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]

Symbol Table

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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]

Symbol Table

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
  6 TIMEOUTQ   0000E3 R   |   6 TIMER      0000CD R   |     TIM_CR1_=  000007 
    TIM_CR1_=  000000     |     TIM_CR1_=  000006     |     TIM_CR1_=  000005 
    TIM_CR1_=  000004     |     TIM_CR1_=  000003     |     TIM_CR1_=  000001 
    TIM_CR1_=  000002     |   6 TNAM2      001514 R   |   6 TNAM3      001532 R
  6 TNAM4      001538 R   |   6 TNAME      001511 R   |   6 TOKEN      000DAE R
  6 TOR        000230 R   |     TRUEE   =  00FFFF     |   6 TWOSL      00071C R
  6 TYPE1      000B83 R   |   6 TYPE2      000B8F R   |   6 TYPES      000B7E R
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
    UART_CR5=  000005     |     UART_CR6=  000009     |     UART_CR6=  000004 
    UART_CR6=  000007     |     UART_CR6=  000001     |     UART_CR6=  000002 
    UART_CR6=  000000     |     UART_CR6=  000005     |     UART_DR =  000001 
    UART_GTR=  000009     |     UART_PSC=  00000A     |     UART_SR =  000000 
    UART_SR_=  000001     |     UART_SR_=  000004     |     UART_SR_=  000002 
    UART_SR_=  000003     |     UART_SR_=  000000     |     UART_SR_=  000005 
    UART_SR_=  000006     |     UART_SR_=  000007     |     UBASE   =  000006 
    UBC     =  004801     |     UCNTXT  =  000014     |     UCP     =  000016 
    UCTIB   =  00000C     |     UD1     =  000001     |     UD2     =  000002 
    UD3     =  000003     |     UD4     =  000004     |   6 UDOT       000C24 R
  6 UDOTR      000C04 R   |   6 UEND       00003D R   |     UFCP    =  000018 
    UHLD    =  000012     |     UINN    =  00000A     |     UINTER  =  000010 
    ULAST   =  00001A     |   6 ULES1      0004DE R   |   6 ULESS      0004C8 R
  6 UMMOD      00055E R   |   6 UMSTA      000637 R   |   6 UNIQ1      0012C5 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]

Symbol Table

  6 UNIQU      0012A6 R   |   6 UNTIL      0011B0 R   |   6 UPL1       000308 R
  6 UPLUS      0002F1 R   |     UPP     =  000006     |     USR_BTN_=  000004 
    USR_BTN_=  000010     |     USR_BTN_=  005015     |     UTIB    =  00000E 
    UTMP    =  000008     |   6 UTYP1      00144B R   |   6 UTYP2      00145A R
  6 UTYPE      001446 R   |   6 UZERO      000027 R   |   6 VARIA      0013E8 R
    VAR_HERE=  004006     |     VER     =  000002     |     VSIZE   =  000002 
    WANT_DEB=  000000     |     WANT_SEE=  000000     |     WDGOPT  =  004805 
    WDGOPT_I=  000002     |     WDGOPT_L=  000003     |     WDGOPT_W=  000000 
    WDGOPT_W=  000001     |   6 WHILE      00122F R   |   6 WITHI      000543 R
  6 WORDD      000D9A R   |   6 WORDS      00156E R   |   6 WORS1      001574 R
  6 WORS2      001593 R   |     WWDG_CR =  0050D1     |     WWDG_WR =  0050D2 
  6 XORR       0002DC R   |     XTEMP   =  00001C     |     YTEMP   =  00001E 
  6 ZERO       000736 R   |   6 ZL1        0002A9 R   |   6 ZLESS      0002A0 R
  6 app_spac   001B80 R   |   6 block_er   00180E R   |   6 clear_ra   000019 R
  6 clock_in   00005A R   |   6 constant   001418 R   |   6 copy_buf   001865 R
  6 copy_buf   001884 R   |   6 copy_pro   001884 R   |     da      =  000002 
    db      =  000003     |     dc      =  000000     |     dd      =  000001 
  6 ee_ccomm   001A2E R   |   6 ee_comma   001A0D R   |   6 ee_cstor   00177B R
  6 ee_store   0017C7 R   |   6 eeprom     00168A R   |   6 erase_fl   00182A R
  6 farat      00169C R   |   6 farcat     0016B8 R   |   6 fptr_sto   00166B R
  6 inc_fptr   001749 R   |   6 lock       001735 R   |   6 main       000016 R
  6 pristine   0018FF R   |   6 proceed_   00182D R   |   6 reboot     0000FA R
  6 reset_ve   001966 R   |   6 row_eras   0017F1 R   |   6 row_eras   00183E R
  6 row_eras   001865 R   |   6 set_opti   0018D3 R   |   6 set_vect   0019B9 R
  6 uart1_in   00006C R   |   6 unlock     00170D R   |   6 unlock_e   0016CF R
  6 unlock_f   0016EE R   |   6 write_by   001760 R   |   6 write_ro   0018A9 R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 DATA       size      0   flags    8
   2 DATA0      size      0   flags    8
   3 SSEG       size      0   flags    8
   4 SSEG1      size    100   flags    8
   5 HOME       size     80   flags    0
   6 CODE       size   1B80   flags    0

