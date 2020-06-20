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
                                     85 
                                     86 ;*********************************************************
                                     87 ;	Assembler constants
                                     88 ;*********************************************************
                           000000    89 RAMBASE =	0x0000	   ;ram base
                           0017FF    90 STACK   =	0x17FF 	;system (return) stack empty 
                           001680    91 DATSTK  =	0x1680	;data stack  empty
                           001680    92 TBUFFBASE =     0x1680  ; flash read/write transaction buffer address  
                           001700    93 TIBBASE =       0X1700  ; transaction input buffer addr.
                                     94 
                                     95 
                                     96 
                                     97 ;; Memory allocation
                                     98 
                           000006    99 UPP     =     RAMBASE+6          ; systeme variables base address 
                           001680   100 SPP     =     RAMBASE+DATSTK     ; data stack bottom 
                           0017FF   101 RPP     =     RAMBASE+STACK      ;  return stack bottom
                           001680   102 ROWBUFF =     RAMBASE+TBUFFBASE ; flash write buffer 
                           001700   103 TIBB    =     RAMBASE+TIBBASE  ; transaction input buffer
                           000080   104 VAR_BASE =    RAMBASE+0x80  ; user variables start here .
                           0017BF   105 VAR_TOP =     STACK-32*CELLL  ; reserve 32 cells for data stack. 
                                    106 
                                    107 ; user variables constants 
                           000006   108 UBASE = UPP       ; numeric base 
                           000008   109 UTMP = UBASE+2    ; temporary storage
                           00000A   110 UINN = UTMP+2     ; >IN tib pointer 
                           00000C   111 UCTIB = UINN+2    ; tib count 
                           00000E   112 UTIB = UCTIB+2    ; tib address 
                           000010   113 UINTER = UTIB+2   ; interpreter vector 
                           000012   114 UHLD = UINTER+2   ; hold 
                           000014   115 UCNTXT = UHLD+2   ; context, dictionary first link 
                           000016   116 UVP = UCNTXT+2    ; variable pointer 
                           000018   117 UCP = UVP+2      ; code pointer
                           00001A   118 ULAST = UCP+2    ; last dictionary pointer 
                           00001C   119 UOFFSET = ULAST+2 ; distance between CP and VP to adjust jump address at compile time.
                           00001E   120 UTFLASH = UOFFSET+2 ; select where between FLASH and RAM for compilation destination. 
                           000020   121 URLAST = UTFLASH+2 ; context for dictionary in RAM memory 
                                    122 
                                    123 ;******  System Variables  ******
                           000022   124 XTEMP	=	URLAST +2;address called by CREATE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 4.
Hexadecimal [24-Bits]



                           000024   125 YTEMP	=	XTEMP+2	;address called by CREATE
                           000022   126 PROD1 = XTEMP	;space for UM*
                           000024   127 PROD2 = PROD1+2
                           000026   128 PROD3 = PROD2+2
                           000028   129 CARRY = PROD3+2
                           00002A   130 SP0	= CARRY+2	;initial data stack pointer
                           00002C   131 RP0	= SP0+2		;initial return stack pointer
                           00002E   132 MS    =   RP0+2         ; millisecond counter 
                           000030   133 CNTDWN =  MS+2          ; count down timer 
                           000032   134 FPTR = CNTDWN+2         ; 24 bits farptr 
                           000033   135 PTR16 = FPTR+1          ; middle byte of farptr 
                           000034   136 PTR8 = FPTR+2           ; least byte of farptr 
                           000036   137 SEEDX = PTR8+2          ; PRNG seed X 
                           000038   138 SEEDY = SEEDX+2         ; PRNG seed Y 
                                    139 
                                    140 ; EEPROM persistant data  
                           004000   141 APP_LAST = EEPROM_BASE ; Application last word pointer  
                           004002   142 APP_RUN = APP_LAST+2   ; application autorun address 
                           004004   143 APP_CP = APP_RUN+2   ; free application space pointer 
                           004006   144 APP_VP = APP_CP+2  ; free data space pointer 
                                    145 
                                    146 
                                    147 ;***********************************************
                                    148 ;; Version control
                                    149 
                           000003   150 VER     =     3         ;major release version
                           000000   151 EXT     =     0         ;minor extension
                                    152 
                                    153 ;; Constants
                                    154 
                           00FFFF   155 TRUEE   =     0xFFFF      ;true flag
                                    156 
                           000040   157 COMPO   =     0x40     ;lexicon compile only bit
                           000080   158 IMEDD   =     0x80     ;lexicon immediate bit
                           001F7F   159 MASKK   =     0x1F7F  ;lexicon bit mask
                                    160 
                           000002   161 CELLL   =     2       ;size of a cell
                           00000A   162 BASEE   =     10      ;default radix
                           000008   163 BKSPP   =     8       ;back space
                           00000A   164 LF      =     10      ;line feed
                           00000D   165 CRR     =     13      ;carriage return
                           00001B   166 ERR     =     27      ;error escape
                           000027   167 TIC     =     39      ;tick
                           0000CD   168 CALLL   =     0xCD     ;CALL opcodes
                           000080   169 IRET_CODE =   0x80    ; IRET opcode 
                                    170 
                                    171         .macro _ledon
                                    172         bset PC_ODR,#LED2_BIT
                                    173         .endm
                                    174 
                                    175         .macro _ledoff
                                    176         bres PC_ODR,#LED2_BIT
                                    177         .endm
                                    178 
                                    179 ;**********************************************************
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 5.
Hexadecimal [24-Bits]



                                    180         .area DATA (ABS)
      000000                        181         .org RAMBASE 
                                    182 ;**********************************************************
                                    183 
                                    184 ;**********************************************************
                                    185         .area SSEG (ABS) ; STACK
      001700                        186         .org 0x1700
      001700                        187         .ds 256 
                                    188 ; space for DATSTK,TIB and STACK         
                                    189 ;**********************************************************
                                    190 
                                    191 ;**********************************************************
                                    192         .area HOME ; vectors table
                                    193 ;**********************************************************
      008000 82 00 80 96            194 	int main	        ; reset
      008004 82 00 80 80            195 	int NonHandledInterrupt	; trap
      008008 82 00 80 80            196 	int NonHandledInterrupt	; irq0
      00800C 82 00 80 80            197 	int NonHandledInterrupt	; irq1
      008010 82 00 80 80            198 	int NonHandledInterrupt	; irq2
      008014 82 00 80 80            199 	int NonHandledInterrupt	; irq3
      008018 82 00 80 80            200 	int NonHandledInterrupt	; irq4
      00801C 82 00 80 80            201 	int NonHandledInterrupt	; irq5
      008020 82 00 80 80            202 	int NonHandledInterrupt	; irq6
      008024 82 00 80 80            203 	int NonHandledInterrupt	; irq7
      008028 82 00 80 80            204 	int NonHandledInterrupt	; irq8
      00802C 82 00 80 80            205 	int NonHandledInterrupt	; irq9
      008030 82 00 80 80            206 	int NonHandledInterrupt	; irq10
      008034 82 00 80 80            207 	int NonHandledInterrupt	; irq11
      008038 82 00 80 80            208 	int NonHandledInterrupt	; irq12
      00803C 82 00 80 80            209 	int NonHandledInterrupt	; irq13
      008040 82 00 80 80            210 	int NonHandledInterrupt	; irq14
      008044 82 00 80 80            211 	int NonHandledInterrupt	; irq15
      008048 82 00 80 80            212 	int NonHandledInterrupt	; irq16
      00804C 82 00 80 80            213 	int NonHandledInterrupt	; irq17
      008050 82 00 80 80            214 	int NonHandledInterrupt	; irq18
      008054 82 00 80 80            215 	int NonHandledInterrupt	; irq19
      008058 82 00 80 80            216 	int NonHandledInterrupt	; irq20
      00805C 82 00 80 80            217 	int NonHandledInterrupt	; irq21
      008060 82 00 80 80            218 	int NonHandledInterrupt	; irq22
      008064 82 00 80 85            219 	int Timer4Handler	; irq23
      008068 82 00 80 80            220 	int NonHandledInterrupt	; irq24
      00806C 82 00 80 80            221 	int NonHandledInterrupt	; irq25
      008070 82 00 80 80            222 	int NonHandledInterrupt	; irq26
      008074 82 00 80 80            223 	int NonHandledInterrupt	; irq27
      008078 82 00 80 80            224 	int NonHandledInterrupt	; irq28
      00807C 82 00 80 80            225 	int NonHandledInterrupt	; irq29
                                    226 
                                    227 ;**********************************************************
                                    228         .area CODE
                                    229 ;**********************************************************
                                    230 
                                    231 ; non handled interrupt reset MCU
      008080                        232 NonHandledInterrupt:
      008080 A6 80            [ 1]  233         ld a, #0x80
      008082 C7 50 D1         [ 1]  234         ld WWDG_CR,a ; WWDG_CR used to reset mcu
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 6.
Hexadecimal [24-Bits]



                                    235 	;iret
                                    236 
                                    237 ; used for milliseconds counter 
                                    238 ; MS is 16 bits counter 
      008085                        239 Timer4Handler:
      008085 72 5F 53 42      [ 1]  240 	clr TIM4_SR 
      008089 BE 2E            [ 2]  241         ldw x,MS 
      00808B 5C               [ 2]  242         incw x 
      00808C BF 2E            [ 2]  243         ldw MS,x
      00808E BE 30            [ 2]  244         ldw x,CNTDWN 
      008090 27 03            [ 1]  245         jreq 1$
      008092 5A               [ 2]  246         decw x 
      008093 BF 30            [ 2]  247         ldw CNTDWN,x 
      008095                        248 1$:         
      008095 80               [11]  249         iret 
                                    250 
                                    251 
                                    252 ;; Main entry points and COLD start data
      008096                        253 main:
                                    254 ; clear all RAM
      008096 AE 00 00         [ 2]  255 	ldw X,#RAMBASE
      008099                        256 clear_ram0:
      008099 7F               [ 1]  257 	clr (X)
      00809A 5C               [ 2]  258 	incw X
      00809B A3 17 FF         [ 2]  259 	cpw X,#RAM_END
      00809E 23 F9            [ 2]  260 	jrule clear_ram0
      0080A0 AE 17 FF         [ 2]  261         ldw x,#RPP
      0080A3 94               [ 1]  262         ldw sp,x
                                    263 ; set SEEDX and SEEDY to 1 
      0080A4 3C 37            [ 1]  264         inc SEEDX+1 
      0080A6 3C 39            [ 1]  265         inc SEEDY+1          
      0080A8 CC 80 C7         [ 2]  266 	jp ORIG
                                    267 
                                    268 ; COLD initialize these variables.
      0080AB                        269 UZERO:
      0080AB 00 0A                  270         .word      BASEE   ;BASE
      0080AD 00 00                  271         .word      0       ;tmp
      0080AF 00 00                  272         .word      0       ;>IN
      0080B1 00 00                  273         .word      0       ;#TIB
      0080B3 17 00                  274         .word      TIBB    ;TIB
      0080B5 93 78                  275         .word      INTER   ;'EVAL
      0080B7 00 00                  276         .word      0       ;HLD
      0080B9 A1 F6                  277         .word      LASTN  ;CNTXT pointer
      0080BB 00 80                  278         .word      VAR_BASE   ;variables free space pointer 
      0080BD A2 80                  279         .word      app_space ; FLASH free space pointer 
      0080BF A1 F6                  280         .word      LASTN   ;LAST
      0080C1 00 00                  281         .word      0        ; OFFSET 
      0080C3 00 00                  282         .word      0       ; TFLASH
                                    283 ;       .word      0       ; URLAST   
      0080C5 00 00                  284 UEND:   .word      0
                                    285 
      0080C7                        286 ORIG:   
                                    287 ; initialize SP
      0080C7 AE 17 FF         [ 2]  288         LDW     X,#STACK  ;initialize return stack
      0080CA 94               [ 1]  289         LDW     SP,X
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 7.
Hexadecimal [24-Bits]



      0080CB BF 2C            [ 2]  290         LDW     RP0,X
      0080CD AE 16 80         [ 2]  291         LDW     X,#DATSTK ;initialize data stack
      0080D0 BF 2A            [ 2]  292         LDW     SP0,X
                                    293 ; initialize PC_5 as output to control LED2
                                    294 ; added by Picatout 
      0080D2 72 1A 50 0D      [ 1]  295         bset PC_CR1,#LED2_BIT
      0080D6 72 1A 50 0E      [ 1]  296         bset PC_CR2,#LED2_BIT
      0080DA 72 1A 50 0C      [ 1]  297         bset PC_DDR,#LED2_BIT
      00005E                        298         _ledoff
      0080DE 72 1B 50 0A      [ 1]    1         bres PC_ODR,#LED2_BIT
                                    299 ; initialize clock to HSI
                                    300 ; no divisor 16Mhz 
                                    301 ; Added by Picatout 
      0080E2                        302 clock_init:
      0080E2 72 5F 50 C6      [ 1]  303         clr CLK_CKDIVR
      0080E6 72 12 50 C5      [ 1]  304 	bset CLK_SWCR,#CLK_SWCR_SWEN
      0080EA A6 E1            [ 1]  305 	ld a,#CLK_SWR_HSI
      0080EC C7 50 C4         [ 1]  306 	ld CLK_SWR,a
      0080EF C1 50 C3         [ 1]  307 1$:	cp a,CLK_CMSR
      0080F2 26 FB            [ 1]  308 	jrne 1$
                                    309         
                                    310 ; initialize UART1, 115200 8N1
      0080F4                        311 uart1_init:
      0080F4 72 14 50 C7      [ 1]  312 	bset CLK_PCKENR1,#CLK_PCKENR1_UART1
                                    313 	; configure tx pin
      0080F8 72 1A 50 02      [ 1]  314 	bset PA_DDR,#UART1_TX_PIN ; tx pin
      0080FC 72 1A 50 03      [ 1]  315 	bset PA_CR1,#UART1_TX_PIN ; push-pull output
      008100 72 1A 50 04      [ 1]  316 	bset PA_CR2,#UART1_TX_PIN ; fast output
                                    317 	; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
      008104 35 0B 52 33      [ 1]  318 	mov UART1_BRR2,#0x0b ; must be loaded first
      008108 35 08 52 32      [ 1]  319 	mov UART1_BRR1,#0x8
      00810C 35 0C 52 35      [ 1]  320 	mov UART1_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN));|(1<<UART_CR2_RIEN))
                                    321 ; initialize timer4, used for millisecond interrupt  
      008110 35 07 53 45      [ 1]  322 	mov TIM4_PSCR,#7 ; prescale 128  
      008114 35 7D 53 46      [ 1]  323 	mov TIM4_ARR,#125 ; set for 1msec.
      008118 35 05 53 40      [ 1]  324 	mov TIM4_CR1,#((1<<TIM4_CR1_CEN)|(1<<TIM4_CR1_URS))
      00811C 72 10 53 41      [ 1]  325 	bset TIM4_IER,#TIM4_IER_UIE 
                                    326 ; set TIM4 interrupt priority to highest
      008120 A6 3F            [ 1]  327         ld a,#~(IPR_MASK<<6)
      008122 C4 7F 75         [ 1]  328         and a,ITC_SPR6
      008125 AA C0            [ 1]  329         or a,#(IPR3<<6)
      008127 C7 7F 75         [ 1]  330         ld ITC_SPR6,a 
      00812A 9A               [ 1]  331         rim
      00812B CC 9A 64         [ 2]  332         jp  COLD   ;default=MN1
                                    333 
                                    334 
                                    335 ;; place MCU in sleep mode with
                                    336 ;; halt opcode 
                                    337 ;; BYE ( -- )
      00812E 00 00                  338         .word 0
                           0000B0   339         LINK=.
      008130 03                     340         .byte 3 
      008131 42 59 45               341         .ascii "BYE"
      008134                        342 BYE: 
      008134 8E               [10]  343         halt 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 8.
Hexadecimal [24-Bits]



      008135 81               [ 4]  344         ret 
                                    345 
                                    346 ; Enable interrupts 
                                    347 ; EI ( -- )
      008136 81 30                  348         .word LINK 
                           0000B8   349         LINK=.
      008138 02                     350         .byte 2
      008139 45 49                  351         .ascii "EI"
      00813B                        352 EI:
      00813B 9A               [ 1]  353         rim 
      00813C 81               [ 4]  354         ret 
                                    355 
                                    356 ; Disable interrupts
                                    357 ; DI ( -- )
      00813D 81 38                  358         .word LINK 
                           0000BF   359         LINK=.
      00813F 02                     360         .byte 2 
      008140 44 49                  361         .ascii "DI"
      008142                        362 DI:
      008142 9B               [ 1]  363         sim 
      008143 81               [ 4]  364         ret 
                                    365 
                                    366 ; set interrupt priority level 
                                    367 ; SET-ISP ( n1 n2 -- )
                                    368 ; n1 level {1..3}
                                    369 ; n2 vector {0..29}
      008144 81 3F                  370         .word LINK 
                           0000C6   371         LINK=.
      008146 07                     372         .byte 7 
      008147 53 45 54 2D 49 53 50   373         .ascii "SET-ISP"
      00814E                        374 SETISP:
      00814E 90 93            [ 1]  375         ldw y,x 
      008150 90 FE            [ 2]  376         ldw y,(y)
      008152 A6 04            [ 1]  377         ld a,#4 ; 4 slot per register 
                                    378 ;  quotient select register, remainder select slot in register.        
      008154 90 62            [ 2]  379         div y,a ; register=ITC_SPR1[Y], lshift=2*A 
      008156 A4 03            [ 1]  380         and a,#3 
      008158 48               [ 1]  381         sll a ; 2*SLOT  lshift 
      008159 72 A9 7F 70      [ 2]  382         addw y,#ITC_SPR1 
      00815D FF               [ 2]  383         ldw (x),y  ; ( level reg -- )
      00815E 90 5F            [ 1]  384         clrw y 
      008160 90 97            [ 1]  385         ld yl,a 
      008162 1D 00 02         [ 2]  386         subw x,#CELLL 
      008165 FF               [ 2]  387         ldw (x),y  ; ( level reg lshift -- )
      008166 90 93            [ 1]  388         ldw y,x 
      008168 90 EE 02         [ 2]  389         ldw y,(2,y) 
      00816B 90 F6            [ 1]  390         ld a,(y)   ; reg_value
      00816D 1D 00 02         [ 2]  391         subw x,#CELLL 
      008170 FF               [ 2]  392         ldw (x),y ; ( level reg lshift rval -- )
      008171 CD 85 8D         [ 4]  393         call OVER ; ( level reg lshift rval lshift -- )
      008174 CD 84 34         [ 4]  394         call DOLIT 
      008177 00 03                  395         .word 3
      008179 CD 85 73         [ 4]  396         call SWAPP  ; ( level reg lshift rval 3 lshift )
      00817C CD 8A 76         [ 4]  397         call LSHIFT ; creat slot mask 
      00817F CD 87 78         [ 4]  398         call INVER  ; ( level reg lshift rval mask )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 9.
Hexadecimal [24-Bits]



      008182 CD 85 AF         [ 4]  399         call ANDD ; ( level reg lshift slot_masked )
      008185 CD 85 2C         [ 4]  400         call TOR  ; ( level reg lshift -- R: slot_masked )
      008188 CD 87 1E         [ 4]  401         call ROT  ; ( reg lshift level )
      00818B CD 85 73         [ 4]  402         call SWAPP ; ( reg level lshift )
      00818E CD 8A 76         [ 4]  403         call LSHIFT  ; ( reg slot_level -- )
      008191 CD 85 0D         [ 4]  404         call RFROM ; ( reg slot_level masked_val )
      008194 CD 85 C3         [ 4]  405         call ORR   ; ( reg updated_rval )
      008197 CD 85 73         [ 4]  406         call SWAPP 
      00819A CD 84 C9         [ 4]  407         call CSTOR
                                    408 
                                    409 ; sélectionne l'application 
                                    410 ; qui démarre automatique lors 
                                    411 ; d'un COLD start 
      00819D 81 46                  412         .word LINK 
                           00011F   413         LINK=.
      00819F 07                     414         .byte 7
      0081A0 41 55 54 4F 52 55 4E   415         .ascii "AUTORUN"
      0081A7                        416 AUTORUN:
      0081A7 CD 91 3D         [ 4]  417         call TOKEN 
      0081AA CD 85 63         [ 4]  418         call DUPP 
      0081AD CD 84 67         [ 4]  419         call QBRAN 
      0081B0 82 8D                  420         .word FORGET2
      0081B2 CD 92 3A         [ 4]  421         call NAMEQ
      0081B5 CD 87 0D         [ 4]  422         call QDUP 
      0081B8 CD 84 67         [ 4]  423         call QBRAN 
      0081BB 82 8D                  424         .word FORGET2
      0081BD CD 85 59         [ 4]  425         call DROP 
      0081C0 1D 00 04         [ 2]  426         subw x,#2*CELLL 
      0081C3 90 5F            [ 1]  427         clrw y 
      0081C5 FF               [ 2]  428         ldw (x),y 
      0081C6 90 AE 40 02      [ 2]  429         ldw y,#APP_RUN 
      0081CA EF 02            [ 2]  430         ldw (2,x),y 
      0081CC CC 9D 94         [ 2]  431         jp ee_store 
                                    432 
                                    433 ;; Reset dictionary pointer before 
                                    434 ;; forgotten word. RAM space and 
                                    435 ;; interrupt vector defined after 
                                    436 ;; must be resetted also.
      0081CF 81 9F                  437         .word LINK 
                           000151   438         LINK=.
      0081D1 06                     439         .byte 6
      0081D2 46 4F 52 47 45 54      440         .ascii "FORGET" 
      0081D8                        441 FORGET: 
      0081D8 CD 91 3D         [ 4]  442         call TOKEN
      0081DB CD 85 63         [ 4]  443         call DUPP 
      0081DE CD 84 67         [ 4]  444         call QBRAN 
      0081E1 82 8D                  445         .word FORGET2
      0081E3 CD 92 3A         [ 4]  446         call NAMEQ ; ( a -- ca na | a F )
      0081E6 CD 87 0D         [ 4]  447         call QDUP 
      0081E9 CD 84 67         [ 4]  448         call QBRAN 
      0081EC 82 8D                  449         .word FORGET2
                                    450 ; only forget users words 
      0081EE CD 85 63         [ 4]  451         call DUPP ; ( ca na na )
      0081F1 CD 84 34         [ 4]  452         call DOLIT 
      0081F4 A2 80                  453         .word app_space 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



      0081F6 CD 85 73         [ 4]  454         call SWAPP 
      0081F9 CD 88 1E         [ 4]  455         call  ULESS 
      0081FC CD 84 67         [ 4]  456         call QBRAN 
      0081FF 82 4F                  457         .word FORGET6 
                                    458 ; ( ca na -- )        
                                    459 ;reset ivec with address >= ca
      008201 CD 85 73         [ 4]  460         call SWAPP ; ( na ca -- ) 
      008204 CD 9F 85         [ 4]  461         call CHKIVEC ; ( na -- ) 
                                    462 ; start at LAST and link back to na 
                                    463 ; if variable found reset VP at that point.
      008207                        464 FORGET1:
      008207 CD 86 CF         [ 4]  465         call LAST 
      00820A CD 84 BC         [ 4]  466         call AT 
      00820D CD 85 63         [ 4]  467         call DUPP  ; ( -- na last last )
      008210 CD 82 A3         [ 4]  468         call FREEVAR ; ( -- na last )
      008213 CD 85 63         [ 4]  469         call DUPP 
      008216 CD 84 34         [ 4]  470         call DOLIT 
      008219 00 02                  471         .word 2 
      00821B CD 87 D7         [ 4]  472         call SUBB ; ( na last -- na last lfa ) link address 
      00821E CD 84 BC         [ 4]  473         call AT 
      008221 CD 85 63         [ 4]  474         call DUPP ; ( -- na last a a )
      008224 CD 86 A3         [ 4]  475         call CNTXT 
      008227 CD 84 A5         [ 4]  476         call STORE
      00822A CD 86 CF         [ 4]  477         call LAST  
      00822D CD 84 A5         [ 4]  478         call STORE ; ( --  na last )
      008230 CD 85 8D         [ 4]  479         call OVER 
      008233 CD 87 FF         [ 4]  480         call EQUAL ; ( na last na -- na T|F ) 
      008236 CD 84 67         [ 4]  481         call QBRAN 
      008239 82 07                  482         .word FORGET1 
                                    483 ; ( na -- )
      00823B CD 84 34         [ 4]  484         call DOLIT 
      00823E 00 02                  485         .word 2 
      008240 CD 87 D7         [ 4]  486         call SUBB 
      008243 CD 86 BF         [ 4]  487         call CPP 
      008246 CD 84 A5         [ 4]  488         call STORE  
      008249 CD 9C 41         [ 4]  489         call UPDATCP 
      00824C CC 9C 18         [ 2]  490         jp UPDATLAST 
      00824F                        491 FORGET6: ; tried to forget a RAM or system word 
                                    492 ; ( ca na -- )
      00824F 1D 00 02         [ 2]  493         subw x,#CELLL 
      008252 90 BE 2A         [ 2]  494         ldw y,SP0 
      008255 FF               [ 2]  495         ldw (x),y  
      008256 CD 88 1E         [ 4]  496         call ULESS
      008259 CD 84 67         [ 4]  497         call QBRAN 
      00825C 82 7F                  498         .word PROTECTED 
      00825E CD 93 46         [ 4]  499         call ABORQ 
      008261 1D                     500         .byte 29
      008262 20 46 6F 72 20 52 41   501         .ascii " For RAM definition do REBOOT"
             4D 20 64 65 66 69 6E
             69 74 69 6F 6E 20 64
             6F 20 52 45 42 4F 4F
             54
      00827F                        502 PROTECTED:
      00827F CD 93 46         [ 4]  503         call ABORQ
      008282 0A                     504         .byte 10
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



      008283 20 50 72 6F 74 65 63   505         .ascii " Protected"
             74 65 64
      00828D                        506 FORGET2: ; no name or not found in dictionary 
      00828D CD 93 46         [ 4]  507         call ABORQ
      008290 05                     508         .byte 5
      008291 20 77 68 61 74         509         .ascii " what"
      008296                        510 FORGET4:
      008296 CC 85 59         [ 2]  511         jp DROP 
                                    512 
                                    513 
                                    514 ;---------------------------------
                                    515 ; if na is variable 
                                    516 ; free variable data  
                                    517 ; FREEVAR ( na -- )
                                    518 ;---------------------------------
      008299 81 D1                  519         .word LINK 
                           00021B   520         LINK=.
      00829B 07                     521         .byte 7 
      00829C 46 52 45 45 56 41 52   522         .ascii "FREEVAR"
      0082A3                        523 FREEVAR:
      0082A3 CD 85 63         [ 4]  524         call DUPP ; ( na na -- )
      0082A6 CD 84 DA         [ 4]  525         CALL CAT  ; ( na c -- )
      0082A9 CD 8A 58         [ 4]  526         call ONEP ;
      0082AC CD 87 5E         [ 4]  527         CALL PLUS ; ( na c+1 -- ca ) 
      0082AF CD 8A 58         [ 4]  528         call ONEP ; ( ca+ -- ) to get routne address 
      0082B2 CD 85 63         [ 4]  529         call DUPP ; ( ca+ ca+ -- )
      0082B5 CD 84 BC         [ 4]  530         CALL AT   ; ( ca+ fnaddr -- ) ; fnaddr is routine address 
      0082B8 CD 84 34         [ 4]  531         call DOLIT 
      0082BB 86 10                  532         .word DOVAR ; if routine address is DOVAR then variable 
      0082BD CD 87 FF         [ 4]  533         call EQUAL  ; ( ca+ fnaddr DOVAR -- ca+ T|F ) 
      0082C0 CD 84 67         [ 4]  534         call QBRAN 
      0082C3 82 D9                  535         .word FREEVAR4 
      0082C5 CD 84 34         [ 4]  536         call DOLIT 
      0082C8 00 02                  537         .word 2 
      0082CA CD 87 5E         [ 4]  538         call PLUS  ; ( ca+ 2 -- da ) da is data address 
      0082CD CD 84 BC         [ 4]  539         call AT 
      0082D0 CD 86 B1         [ 4]  540         call VPP   
      0082D3 CD 84 A5         [ 4]  541         call STORE 
      0082D6 CC 9C 58         [ 2]  542         jp UPDATVP 
      0082D9                        543 FREEVAR4: ; not variable
      0082D9 CC 85 59         [ 2]  544         jp  DROP 
                                    545 
                                    546 ;    SEED ( n -- )
                                    547 ; Initialize PRNG seed with n 
      0082DC 82 9B                  548         .word LINK 
                           00025E   549         LINK=. 
      0082DE 04                     550         .byte 4 
      0082DF 53 45 45 44            551         .ascii "SEED" 
      0082E3                        552 SEED:
      0082E3 90 93            [ 1]  553         ldw y,x 
      0082E5 1C 00 02         [ 2]  554         addw x,#CELLL
      0082E8 90 FE            [ 2]  555         ldw y,(y)
      0082EA 90 9E            [ 1]  556         ld a,yh 
      0082EC B7 36            [ 1]  557         ld SEEDX,a 
      0082EE 90 9F            [ 1]  558         ld a,yl 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]



      0082F0 B7 38            [ 1]  559         ld SEEDY,a 
      0082F2 81               [ 4]  560         ret 
                                    561 
                                    562 ;    RANDOM ( u1 -- u2 )
                                    563 ; Pseudo random number betwen 0 and u1-1
      0082F3 82 DE                  564         .word LINK 
                           000275   565         LINK=.
      0082F5 06                     566         .byte 6
      0082F6 52 41 4E 44 4F 4D      567         .ascii "RANDOM" 
      0082FC                        568 RANDOM:
                                    569 ;local variable 
                           000001   570         SPSAVE=1
                           000002   571         VSIZE=2 
      0082FC 52 02            [ 2]  572         sub sp,#VSIZE
      0082FE 1F 01            [ 2]  573         ldw (SPSAVE,sp),x  
                                    574 ; XTEMP=(SEEDX<<5)^SEEDX 
      008300 90 93            [ 1]  575         ldw y,x 
      008302 90 FE            [ 2]  576         ldw y,(y)
      008304 90 BF 24         [ 2]  577         ldw YTEMP,y 
      008307 BE 36            [ 2]  578 	ldw x,SEEDX 
      008309 58               [ 2]  579 	sllw x 
      00830A 58               [ 2]  580 	sllw x 
      00830B 58               [ 2]  581 	sllw x 
      00830C 58               [ 2]  582 	sllw x 
      00830D 58               [ 2]  583 	sllw x 
      00830E 9E               [ 1]  584 	ld a,xh 
      00830F B8 36            [ 1]  585 	xor a,SEEDX 
      008311 B7 22            [ 1]  586 	ld XTEMP,a 
      008313 9F               [ 1]  587 	ld a,xl 
      008314 B8 37            [ 1]  588 	xor a,SEEDX+1 
      008316 B7 23            [ 1]  589 	ld XTEMP+1,a 
                                    590 ; SEEDX=SEEDY 
      008318 BE 38            [ 2]  591 	ldw x,SEEDY 
      00831A BF 36            [ 2]  592 	ldw SEEDX,x  
                                    593 ; SEEDY=SEEDY^(SEEDY>>1)
      00831C 54               [ 2]  594 	srlw x 
      00831D 9E               [ 1]  595 	ld a,xh 
      00831E B8 38            [ 1]  596 	xor a,SEEDY 
      008320 B7 38            [ 1]  597 	ld SEEDY,a  
      008322 9F               [ 1]  598 	ld a,xl 
      008323 B8 39            [ 1]  599 	xor a,SEEDY+1 
      008325 B7 39            [ 1]  600 	ld SEEDY+1,a 
                                    601 ; XTEMP>>3 
      008327 BE 22            [ 2]  602 	ldw x,XTEMP 
      008329 54               [ 2]  603 	srlw x 
      00832A 54               [ 2]  604 	srlw x 
      00832B 54               [ 2]  605 	srlw x 
                                    606 ; x=XTEMP^x 
      00832C 9E               [ 1]  607 	ld a,xh 
      00832D B8 22            [ 1]  608 	xor a,XTEMP 
      00832F 95               [ 1]  609 	ld xh,a 
      008330 9F               [ 1]  610 	ld a,xl 
      008331 B8 23            [ 1]  611 	xor a,XTEMP+1  
      008333 97               [ 1]  612 	ld xl,a 
                                    613 ; SEEDY=x^SEEDY 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 13.
Hexadecimal [24-Bits]



      008334 B8 39            [ 1]  614 	xor a,SEEDY+1
      008336 97               [ 1]  615 	ld xl,a 
      008337 9E               [ 1]  616 	ld a,xh 
      008338 B8 38            [ 1]  617 	xor a,SEEDY
      00833A 95               [ 1]  618 	ld xh,a 
      00833B BF 38            [ 2]  619 	ldw SEEDY,x 
                                    620 ; return SEEDY modulo YTEMP  
      00833D 90 BE 24         [ 2]  621 	ldw y,YTEMP  
      008340 65               [ 2]  622 	divw x,y 
      008341 1E 01            [ 2]  623 	ldw x,(SPSAVE,sp)
      008343 FF               [ 2]  624         ldw (x),y 
      008344 5B 02            [ 2]  625         addw sp,#VSIZE 
      008346 81               [ 4]  626 	ret 
                                    627 
                                    628 
                                    629 ;;
                                    630 ;; get millisecond counter 
                                    631 ;; msec ( -- u )
                                    632 ;; Added by Picatout 2020-04-26
      008347 82 F5                  633         .word LINK  
                           0002C9   634         LINK = . 
      008349 04                     635         .byte 4
      00834A 4D 53 45 43            636         .ascii "MSEC"
      00834E                        637 MSEC: 
      00834E 1D 00 02         [ 2]  638         subw x,#CELLL 
      008351 90 BE 2E         [ 2]  639         ldw y,MS 
      008354 FF               [ 2]  640         ldw (x),y 
      008355 81               [ 4]  641         ret 
                                    642 
                                    643 ; suspend execution for u msec 
                                    644 ;  pause ( u -- )
      008356 83 49                  645         .word LINK 
                           0002D8   646         LINK=.
      008358 05                     647         .byte 5 
      008359 50 41 55 53 45         648         .ascii "PAUSE"
      00835E                        649 PAUSE:
      00835E 90 93            [ 1]  650         ldw y,x
      008360 90 FE            [ 2]  651         ldw y,(y)
      008362 72 B9 00 2E      [ 2]  652         addw y,MS 
      008366 8F               [10]  653 1$:     wfi  
      008367 90 B3 2E         [ 2]  654         cpw y,MS  
      00836A 26 FA            [ 1]  655         jrne 1$        
      00836C 1C 00 02         [ 2]  656         addw x,#CELLL 
      00836F 81               [ 4]  657         ret 
                                    658 
                                    659 ; initialize count down timer 
                                    660 ;  TIMER ( u -- )  milliseconds 
      008370 83 58                  661         .word LINK 
                           0002F2   662         LINK=.
      008372 05                     663         .byte 5 
      008373 54 49 4D 45 52         664         .ascii "TIMER" 
      008378                        665 TIMER:
      008378 90 93            [ 1]  666         ldw y,x
      00837A 90 FE            [ 2]  667         ldw y,(y) 
      00837C 90 BF 30         [ 2]  668         ldw CNTDWN,y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 14.
Hexadecimal [24-Bits]



      00837F 1C 00 02         [ 2]  669         addw x,#CELLL 
      008382 81               [ 4]  670         ret 
                                    671 
                                    672 ; check for TIMER exiparition 
                                    673 ;  TIMEOUT? ( -- 0|-1 )
      008383 83 72                  674         .word LINK 
                           000305   675         LINK=. 
      008385 08                     676         .byte 8 
      008386 54 49 4D 45 4F 55 54   677         .ascii "TIMEOUT?"
             3F
      00838E                        678 TIMEOUTQ: 
      00838E 4F               [ 1]  679         clr a
      00838F 1D 00 02         [ 2]  680         subw x,#CELLL 
      008392 90 BE 30         [ 2]  681         ldw y,CNTDWN 
      008395 26 01            [ 1]  682         jrne 1$ 
      008397 43               [ 1]  683         cpl a 
      008398 E7 01            [ 1]  684 1$:     ld (1,x),a 
      00839A F7               [ 1]  685         ld (x),a 
      00839B 81               [ 4]  686         ret         
                                    687 
                                    688 ; reboot MCU 
                                    689 ; REBOOT ( -- )
      00839C 83 85                  690         .word LINK 
                           00031E   691         LINK=. 
      00839E 06                     692         .byte 6 
      00839F 52 45 42 4F 4F 54      693         .ascii "REBOOT"
      0083A5                        694 reboot:
      0083A5 CC 80 80         [ 2]  695         jp NonHandledInterrupt
                                    696 
                                    697 ; compile to flash memory 
                                    698 ; TO-FLASH ( -- )
      0083A8 83 9E                  699         .word LINK 
                           00032A   700         LINK=.
      0083AA 08                     701         .byte 8
      0083AB 54 4F 2D 46 4C 41 53   702         .ascii "TO-FLASH"
             48
      0083B3                        703 TOFLASH:
      0083B3 CD 86 E2         [ 4]  704         call RAMLAST 
      0083B6 CD 84 BC         [ 4]  705         call AT 
      0083B9 CD 87 0D         [ 4]  706         call QDUP 
      0083BC CD 84 67         [ 4]  707         call QBRAN
      0083BF 83 E2                  708         .word 1$
      0083C1 CD 93 46         [ 4]  709         call ABORQ 
      0083C4 1D                     710         .byte 29
      0083C5 20 4E 6F 74 20 77 68   711         .ascii " Not while definitions in RAM"   
             69 6C 65 20 64 65 66
             69 6E 69 74 69 6F 6E
             73 20 69 6E 20 52 41
             4D
      0083E2 90 AE FF FF      [ 2]  712 1$:     ldw y,#-1 
      0083E6 90 BF 1E         [ 2]  713         ldw UTFLASH,y
      0083E9 81               [ 4]  714         ret 
                                    715 
                                    716 ; compile to RAM 
                                    717 ; TO-RAM ( -- )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 15.
Hexadecimal [24-Bits]



      0083EA 83 AA                  718         .word LINK 
                           00036C   719         LINK=.
      0083EC 06                     720         .byte 6 
      0083ED 54 4F 2D 52 41 4D      721         .ascii "TO-RAM"
      0083F3                        722 TORAM:
      0083F3 90 5F            [ 1]  723         clrw y 
      0083F5 90 BF 1E         [ 2]  724         ldw UTFLASH,y 
      0083F8 81               [ 4]  725         ret 
                                    726         
                                    727 
                                    728 ;; Device dependent I/O
                                    729 ;       ?RX     ( -- c T | F )
                                    730 ;         Return input byte and true, or false.
      0083F9 83 EC                  731         .word      LINK 
                           00037B   732 LINK	= .
      0083FB 04                     733         .byte      4
      0083FC 3F 4B 45 59            734         .ascii     "?KEY"
      008400                        735 QKEY:
      008400 90 5F            [ 1]  736         CLRW Y 
      008402 72 0B 52 30 0B   [ 2]  737         BTJF UART1_SR,#UART_SR_RXNE,INCH   ;check status
      008407 C6 52 31         [ 1]  738         LD    A,UART1_DR   ;get char in A
      00840A 1D 00 02         [ 2]  739 	SUBW	X,#2
      00840D E7 01            [ 1]  740         LD     (1,X),A
      00840F 7F               [ 1]  741 	CLR	(X)
      008410 90 53            [ 2]  742         CPLW     Y
      008412                        743 INCH:
      008412 1D 00 02         [ 2]  744 	SUBW	X,#2
      008415 FF               [ 2]  745         LDW     (X),Y
      008416 81               [ 4]  746         RET
                                    747 
                                    748 ;       TX!     ( c -- )
                                    749 ;       Send character c to  output device.
      008417 83 FB                  750         .word      LINK
                           000399   751 LINK	= .
      008419 04                     752         .byte      4
      00841A 45 4D 49 54            753         .ascii     "EMIT"
      00841E                        754 EMIT:
      00841E E6 01            [ 1]  755         LD     A,(1,X)
      008420 1C 00 02         [ 2]  756 	ADDW	X,#2
      008423 72 0F 52 30 FB   [ 2]  757 OUTPUT: BTJF UART1_SR,#UART_SR_TXE,OUTPUT  ;loop until tdre
      008428 C7 52 31         [ 1]  758         LD    UART1_DR,A   ;send A
      00842B 81               [ 4]  759         RET
                                    760 
                                    761 ;; The kernel
                                    762 
                                    763 ;       doLIT   ( -- w )
                                    764 ;       Push an inline literal.
      00842C 84 19                  765         .word      LINK
                           0003AE   766 LINK	= 	.
      00842E 45                     767 	.byte      COMPO+5
      00842F 44 4F 4C 49 54         768         .ascii     "DOLIT"
      008434                        769 DOLIT:
      008434 1D 00 02         [ 2]  770 	SUBW X,#2
      008437 16 01            [ 2]  771         ldw y,(1,sp)
      008439 90 FE            [ 2]  772         ldw y,(y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 16.
Hexadecimal [24-Bits]



      00843B FF               [ 2]  773         ldw (x),y
      00843C 90 85            [ 2]  774         popw y 
      00843E 90 EC 02         [ 2]  775         jp (2,y)
                                    776 
                                    777 ;       next    ( -- )
                                    778 ;       Code for  single index loop.
      008441 84 2E                  779         .word      LINK
                           0003C3   780 LINK	= 	.
      008443 44                     781 	.byte      COMPO+4
      008444 4E 45 58 54            782         .ascii     "NEXT"
      008448                        783 DONXT:
      008448 16 03            [ 2]  784 	LDW Y,(3,SP)
      00844A 90 5A            [ 2]  785 	DECW Y
      00844C 2A 07            [ 1]  786 	JRPL NEX1 ; jump if N=0
      00844E 90 85            [ 2]  787 	POPW Y
      008450 5B 02            [ 2]  788         addw sp,#2
      008452 90 EC 02         [ 2]  789         JP (2,Y)
      008455                        790 NEX1:
      008455 17 03            [ 2]  791         LDW (3,SP),Y
      008457 90 85            [ 2]  792         POPW Y
      008459 90 FE            [ 2]  793 	LDW Y,(Y)
      00845B 90 FC            [ 2]  794 	JP (Y)
                                    795 
                                    796 ;       ?branch ( f -- )
                                    797 ;       Branch if flag is zero.
      00845D 84 43                  798         .word      LINK
                           0003DF   799 LINK	= 	.
      00845F 47                     800 	.byte      COMPO+7
      008460 3F 42 52 41 4E 43 48   801         .ascii     "?BRANCH"
      008467                        802 QBRAN:	
      008467 90 93            [ 1]  803         LDW Y,X
      008469 1C 00 02         [ 2]  804 	ADDW X,#2
      00846C 90 FE            [ 2]  805 	LDW Y,(Y)
      00846E 27 0E            [ 1]  806         JREQ     BRAN
      008470 90 85            [ 2]  807 	POPW Y
      008472 90 EC 02         [ 2]  808 	JP (2,Y)
                                    809         
                                    810 ;       branch  ( -- )
                                    811 ;       Branch to an inline address.
      008475 84 5F                  812         .word      LINK
                           0003F7   813 LINK	= 	.
      008477 46                     814 	.byte      COMPO+6
      008478 42 52 41 4E 43 48      815         .ascii     "BRANCH"
      00847E                        816 BRAN:
      00847E 90 85            [ 2]  817         POPW Y
      008480 90 FE            [ 2]  818 	LDW Y,(Y)
      008482 90 FC            [ 2]  819         JP     (Y)
                                    820 
                                    821 ;       EXECUTE ( ca -- )
                                    822 ;       Execute  word at ca.
      008484 84 77                  823         .word      LINK
                           000406   824 LINK	= 	.
      008486 07                     825         .byte       7
      008487 45 58 45 43 55 54 45   826         .ascii     "EXECUTE"
      00848E                        827 EXECU:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 17.
Hexadecimal [24-Bits]



      00848E 90 93            [ 1]  828         LDW Y,X
      008490 1C 00 02         [ 2]  829 	ADDW X,#2
      008493 90 FE            [ 2]  830 	LDW  Y,(Y)
      008495 90 FC            [ 2]  831         JP   (Y)
                                    832 
                           000001   833 OPTIMIZE = 1
                           000001   834 .if OPTIMIZE 
                                    835 ; remplacement de CALL EXIT par 
                                    836 ; le opcode de RET.
                                    837 ; Voir modification au code de ";"
                                    838 ;
                                    839 ;       EXIT    ( -- )
                                    840 ;       Terminate a colon definition.
      008497 84 86                  841         .word      LINK
                           000419   842 LINK = .
      008499 04                     843         .byte      4
      00849A 45 58 49 54            844         .ascii     "EXIT"
      00849E                        845 EXIT:
      00849E 90 85            [ 2]  846         POPW Y
      0084A0 81               [ 4]  847         RET
                                    848 .endif 
                                    849 
                                    850 ;       !       ( w a -- )
                                    851 ;       Pop  data stack to memory.
      0084A1 84 99                  852         .word      LINK
                           000423   853 LINK = .
      0084A3 01                     854         .byte      1
      0084A4 21                     855         .ascii     "!"
      0084A5                        856 STORE:
      0084A5 90 93            [ 1]  857         LDW Y,X
      0084A7 90 FE            [ 2]  858         LDW Y,(Y)    ;Y=a
      0084A9 90 BF 24         [ 2]  859         LDW YTEMP,Y
      0084AC 90 93            [ 1]  860         LDW Y,X
      0084AE 90 EE 02         [ 2]  861         LDW Y,(2,Y)
      0084B1 91 CF 24         [ 5]  862         LDW [YTEMP],Y ;store w at a
      0084B4 1C 00 04         [ 2]  863         ADDW X,#4 ; DDROP 
      0084B7 81               [ 4]  864         RET     
                                    865 
                                    866 ;       @       ( a -- w )
                                    867 ;       Push memory location to stack.
      0084B8 84 A3                  868         .word      LINK
                           00043A   869 LINK	= 	.
      0084BA 01                     870         .byte    1
      0084BB 40                     871         .ascii	"@"
      0084BC                        872 AT:
      0084BC 90 93            [ 1]  873         LDW Y,X     ;Y = a
      0084BE 90 FE            [ 2]  874         LDW Y,(Y)   ; address 
      0084C0 90 FE            [ 2]  875         LDW Y,(Y)   ; value 
      0084C2 FF               [ 2]  876         LDW (X),Y ;w = @Y
      0084C3 81               [ 4]  877         RET     
                                    878 
                                    879 ;       C!      ( c b -- )
                                    880 ;       Pop  data stack to byte memory.
      0084C4 84 BA                  881         .word      LINK
                           000446   882 LINK	= .
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
Hexadecimal [24-Bits]



      0084C6 02                     883         .byte      2
      0084C7 43 21                  884         .ascii     "C!"
      0084C9                        885 CSTOR:
      0084C9 90 93            [ 1]  886         LDW Y,X
      0084CB 90 FE            [ 2]  887 	LDW Y,(Y)    ;Y=b
      0084CD E6 03            [ 1]  888         LD A,(3,X)    ;D = c
      0084CF 90 F7            [ 1]  889         LD  (Y),A     ;store c at b
      0084D1 1C 00 04         [ 2]  890 	ADDW X,#4 ; DDROP 
      0084D4 81               [ 4]  891         RET     
                                    892 
                                    893 ;       C@      ( b -- c )
                                    894 ;       Push byte in memory to  stack.
      0084D5 84 C6                  895         .word      LINK
                           000457   896 LINK	= 	.
      0084D7 02                     897         .byte      2
      0084D8 43 40                  898         .ascii     "C@"
      0084DA                        899 CAT:
      0084DA 90 93            [ 1]  900         LDW Y,X     ;Y=b
      0084DC 90 FE            [ 2]  901         LDW Y,(Y)
      0084DE 90 F6            [ 1]  902         LD A,(Y)
      0084E0 E7 01            [ 1]  903         LD (1,X),A
      0084E2 7F               [ 1]  904         CLR (X)
      0084E3 81               [ 4]  905         RET     
                                    906 
                                    907 ;       RP@     ( -- a )
                                    908 ;       Push current RP to data stack.
      0084E4 84 D7                  909         .word      LINK
                           000466   910 LINK	= .
      0084E6 03                     911         .byte      3
      0084E7 52 50 40               912         .ascii     "RP@"
      0084EA                        913 RPAT:
      0084EA 90 96            [ 1]  914         LDW Y,SP    ;save return addr
      0084EC 1D 00 02         [ 2]  915         SUBW X,#2
      0084EF FF               [ 2]  916         LDW (X),Y
      0084F0 81               [ 4]  917         RET     
                                    918 
                                    919 ;       RP!     ( a -- )
                                    920 ;       Set  return stack pointer.
      0084F1 84 E6                  921         .word      LINK
                           000473   922 LINK	= 	. 
      0084F3 43                     923 	.byte      COMPO+3
      0084F4 52 50 21               924         .ascii     "RP!"
      0084F7                        925 RPSTO:
      0084F7 90 85            [ 2]  926         POPW Y
      0084F9 90 BF 24         [ 2]  927         LDW YTEMP,Y
      0084FC 90 93            [ 1]  928         LDW Y,X
      0084FE 90 FE            [ 2]  929         LDW Y,(Y)
      008500 90 94            [ 1]  930         LDW SP,Y
      008502 1C 00 02         [ 2]  931         ADDW x,#CELLL ; a was not dropped, Picatout 2020-05-24
      008505 92 CC 24         [ 5]  932         JP [YTEMP]
                                    933 
                                    934 ;       R>      ( -- w )
                                    935 ;       Pop return stack to data stack.
      008508 84 F3                  936         .word      LINK
                           00048A   937 LINK	= 	. 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]



      00850A 42                     938 	.byte      COMPO+2
      00850B 52 3E                  939         .ascii     "R>"
      00850D                        940 RFROM:
      00850D 90 85            [ 2]  941         POPW Y    ;save return addr
      00850F 90 BF 24         [ 2]  942         LDW YTEMP,Y
      008512 90 85            [ 2]  943         POPW Y
      008514 1D 00 02         [ 2]  944         SUBW X,#2
      008517 FF               [ 2]  945         LDW (X),Y
      008518 92 CC 24         [ 5]  946         JP [YTEMP]
                                    947 
                                    948 ;       R@      ( -- w )
                                    949 ;       Copy top of return stack to stack.
      00851B 85 0A                  950         .word      LINK
                           00049D   951 LINK	= 	. 
      00851D 02                     952         .byte      2
      00851E 52 40                  953         .ascii     "R@"
      008520                        954 RAT:
      008520 16 03            [ 2]  955         ldw y,(3,sp)
      008522 1D 00 02         [ 2]  956         subw x,#CELLL 
      008525 FF               [ 2]  957         ldw (x),y 
      008526 81               [ 4]  958         ret 
                                    959 
                                    960 ;       >R      ( w -- )
                                    961 ;       Push data stack to return stack.
      008527 85 1D                  962         .word      LINK
                           0004A9   963 LINK	= 	. 
      008529 42                     964 	.byte      COMPO+2
      00852A 3E 52                  965         .ascii     ">R"
      00852C                        966 TOR:
      00852C 90 85            [ 2]  967         POPW Y    ;save return addr
      00852E 90 BF 24         [ 2]  968         LDW YTEMP,Y
      008531 90 93            [ 1]  969         LDW Y,X
      008533 90 FE            [ 2]  970         LDW Y,(Y)
      008535 90 89            [ 2]  971         PUSHW Y    ;restore return addr
      008537 1C 00 02         [ 2]  972         ADDW X,#2
      00853A 92 CC 24         [ 5]  973         JP [YTEMP]
                                    974 
                                    975 ;       SP@     ( -- a )
                                    976 ;       Push current stack pointer.
      00853D 85 29                  977         .word      LINK
                           0004BF   978 LINK	= 	. 
      00853F 03                     979         .byte      3
      008540 53 50 40               980         .ascii     "SP@"
      008543                        981 SPAT:
      008543 90 93            [ 1]  982 	LDW Y,X
      008545 1D 00 02         [ 2]  983         SUBW X,#2
      008548 FF               [ 2]  984 	LDW (X),Y
      008549 81               [ 4]  985         RET     
                                    986 
                                    987 ;       SP!     ( a -- )
                                    988 ;       Set  data stack pointer.
      00854A 85 3F                  989         .word      LINK
                           0004CC   990 LINK	= 	. 
      00854C 03                     991         .byte      3
      00854D 53 50 21               992         .ascii     "SP!"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]



      008550                        993 SPSTO:
      008550 FE               [ 2]  994         LDW     X,(X)     ;X = a
      008551 81               [ 4]  995         RET     
                                    996 
                                    997 ;       DROP    ( w -- )
                                    998 ;       Discard top stack item.
      008552 85 4C                  999         .word      LINK
                           0004D4  1000 LINK	= 	. 
      008554 04                    1001         .byte      4
      008555 44 52 4F 50           1002         .ascii     "DROP"
      008559                       1003 DROP:
      008559 1C 00 02         [ 2] 1004         ADDW X,#2     
      00855C 81               [ 4] 1005         RET     
                                   1006 
                                   1007 ;       DUP     ( w -- w w )
                                   1008 ;       Duplicate  top stack item.
      00855D 85 54                 1009         .word      LINK
                           0004DF  1010 LINK	= 	. 
      00855F 03                    1011         .byte      3
      008560 44 55 50              1012         .ascii     "DUP"
      008563                       1013 DUPP:
      008563 90 93            [ 1] 1014 	LDW Y,X
      008565 1D 00 02         [ 2] 1015         SUBW X,#2
      008568 90 FE            [ 2] 1016 	LDW Y,(Y)
      00856A FF               [ 2] 1017 	LDW (X),Y
      00856B 81               [ 4] 1018         RET     
                                   1019 
                                   1020 ;       SWAP    ( w1 w2 -- w2 w1 )
                                   1021 ;       Exchange top two stack items.
      00856C 85 5F                 1022         .word      LINK
                           0004EE  1023 LINK	= 	. 
      00856E 04                    1024         .byte      4
      00856F 53 57 41 50           1025         .ascii     "SWAP"
      008573                       1026 SWAPP:
      008573 90 93            [ 1] 1027         LDW Y,X
      008575 90 FE            [ 2] 1028         LDW Y,(Y)
      008577 90 BF 24         [ 2] 1029         LDW YTEMP,Y
      00857A 90 93            [ 1] 1030         LDW Y,X
      00857C 90 EE 02         [ 2] 1031         LDW Y,(2,Y)
      00857F FF               [ 2] 1032         LDW (X),Y
      008580 90 BE 24         [ 2] 1033         LDW Y,YTEMP
      008583 EF 02            [ 2] 1034         LDW (2,X),Y
      008585 81               [ 4] 1035         RET     
                                   1036 
                                   1037 ;       OVER    ( w1 w2 -- w1 w2 w1 )
                                   1038 ;       Copy second stack item to top.
      008586 85 6E                 1039         .word      LINK
                           000508  1040 LINK	= . 
      008588 04                    1041         .byte      4
      008589 4F 56 45 52           1042         .ascii     "OVER"
      00858D                       1043 OVER:
      00858D 1D 00 02         [ 2] 1044         SUBW X,#2
      008590 90 93            [ 1] 1045         LDW Y,X
      008592 90 EE 04         [ 2] 1046         LDW Y,(4,Y)
      008595 FF               [ 2] 1047         LDW (X),Y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



      008596 81               [ 4] 1048         RET     
                                   1049 
                                   1050 ;       0<      ( n -- t )
                                   1051 ;       Return true if n is negative.
      008597 85 88                 1052         .word      LINK
                           000519  1053 LINK	= . 
      008599 02                    1054         .byte      2
      00859A 30 3C                 1055         .ascii     "0<"
      00859C                       1056 ZLESS:
      00859C A6 FF            [ 1] 1057         LD A,#0xFF
      00859E 90 93            [ 1] 1058         LDW Y,X
      0085A0 90 FE            [ 2] 1059         LDW Y,(Y)
      0085A2 2B 01            [ 1] 1060         JRMI     ZL1
      0085A4 4F               [ 1] 1061         CLR A   ;false
      0085A5 F7               [ 1] 1062 ZL1:    LD     (X),A
      0085A6 E7 01            [ 1] 1063         LD (1,X),A
      0085A8 81               [ 4] 1064 	RET     
                                   1065 
                                   1066 ;       AND     ( w w -- w )
                                   1067 ;       Bitwise AND.
      0085A9 85 99                 1068         .word      LINK
                           00052B  1069 LINK	= . 
      0085AB 03                    1070         .byte      3
      0085AC 41 4E 44              1071         .ascii     "AND"
      0085AF                       1072 ANDD:
      0085AF F6               [ 1] 1073         LD  A,(X)    ;D=w
      0085B0 E4 02            [ 1] 1074         AND A,(2,X)
      0085B2 E7 02            [ 1] 1075         LD (2,X),A
      0085B4 E6 01            [ 1] 1076         LD A,(1,X)
      0085B6 E4 03            [ 1] 1077         AND A,(3,X)
      0085B8 E7 03            [ 1] 1078         LD (3,X),A
      0085BA 1C 00 02         [ 2] 1079         ADDW X,#2
      0085BD 81               [ 4] 1080         RET
                                   1081 
                                   1082 ;       OR      ( w w -- w )
                                   1083 ;       Bitwise inclusive OR.
      0085BE 85 AB                 1084         .word      LINK
                           000540  1085 LINK = . 
      0085C0 02                    1086         .byte      2
      0085C1 4F 52                 1087         .ascii     "OR"
      0085C3                       1088 ORR:
      0085C3 F6               [ 1] 1089         LD A,(X)    ;D=w
      0085C4 EA 02            [ 1] 1090         OR A,(2,X)
      0085C6 E7 02            [ 1] 1091         LD (2,X),A
      0085C8 E6 01            [ 1] 1092         LD A,(1,X)
      0085CA EA 03            [ 1] 1093         OR A,(3,X)
      0085CC E7 03            [ 1] 1094         LD (3,X),A
      0085CE 1C 00 02         [ 2] 1095         ADDW X,#2
      0085D1 81               [ 4] 1096         RET
                                   1097 
                                   1098 ;       XOR     ( w w -- w )
                                   1099 ;       Bitwise exclusive OR.
      0085D2 85 C0                 1100         .word      LINK
                           000554  1101 LINK	= . 
      0085D4 03                    1102         .byte      3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]



      0085D5 58 4F 52              1103         .ascii     "XOR"
      0085D8                       1104 XORR:
      0085D8 F6               [ 1] 1105         LD A,(X)    ;D=w
      0085D9 E8 02            [ 1] 1106         XOR A,(2,X)
      0085DB E7 02            [ 1] 1107         LD (2,X),A
      0085DD E6 01            [ 1] 1108         LD A,(1,X)
      0085DF E8 03            [ 1] 1109         XOR A,(3,X)
      0085E1 E7 03            [ 1] 1110         LD (3,X),A
      0085E3 1C 00 02         [ 2] 1111         ADDW X,#2
      0085E6 81               [ 4] 1112         RET
                                   1113 
                                   1114 ;       UM+     ( u u -- udsum )
                                   1115 ;       Add two unsigned single
                                   1116 ;       and return a double sum.
      0085E7 85 D4                 1117         .word      LINK
                           000569  1118 LINK	= . 
      0085E9 03                    1119         .byte      3
      0085EA 55 4D 2B              1120         .ascii     "UM+"
      0085ED                       1121 UPLUS:
      0085ED A6 01            [ 1] 1122         LD A,#1
      0085EF 90 93            [ 1] 1123         LDW Y,X
      0085F1 90 EE 02         [ 2] 1124         LDW Y,(2,Y)
      0085F4 90 BF 24         [ 2] 1125         LDW YTEMP,Y
      0085F7 90 93            [ 1] 1126         LDW Y,X
      0085F9 90 FE            [ 2] 1127         LDW Y,(Y)
      0085FB 72 B9 00 24      [ 2] 1128         ADDW Y,YTEMP
      0085FF EF 02            [ 2] 1129         LDW (2,X),Y
      008601 25 01            [ 1] 1130         JRC     UPL1
      008603 4F               [ 1] 1131         CLR A
      008604 E7 01            [ 1] 1132 UPL1:   LD     (1,X),A
      008606 7F               [ 1] 1133         CLR (X)
      008607 81               [ 4] 1134         RET
                                   1135 
                                   1136 ;; System and user variables
                                   1137 
                                   1138 ;       doVAR   ( -- a )
                                   1139 ;       Code for VARIABLE and CREATE.
      008608 85 E9                 1140         .word      LINK
                           00058A  1141 LINK	= . 
      00860A 45                    1142 	.byte      COMPO+5
      00860B 44 4F 56 41 52        1143         .ascii     "DOVAR"
      008610                       1144 DOVAR:
      008610 1D 00 02         [ 2] 1145 	SUBW X,#2
      008613 90 85            [ 2] 1146         POPW Y    ;get return addr (pfa)
      008615 90 FE            [ 2] 1147         LDW Y,(Y) ; indirect address 
      008617 FF               [ 2] 1148         LDW (X),Y    ;push on stack
      008618 81               [ 4] 1149         RET     ;go to RET of EXEC
                                   1150 
                                   1151 ;       BASE    ( -- a )
                                   1152 ;       Radix base for numeric I/O.
      008619 86 0A                 1153         .word      LINK        
                           00059B  1154 LINK = . 
      00861B 04                    1155         .byte      4
      00861C 42 41 53 45           1156         .ascii     "BASE"
      008620                       1157 BASE:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



      008620 90 AE 00 06      [ 2] 1158 	LDW Y,#UBASE 
      008624 1D 00 02         [ 2] 1159 	SUBW X,#2
      008627 FF               [ 2] 1160         LDW (X),Y
      008628 81               [ 4] 1161         RET
                                   1162 
                                   1163 ;       tmp     ( -- a )
                                   1164 ;       A temporary storage.
      008629 86 1B                 1165         .word      LINK
                                   1166         
                           0005AB  1167 LINK = . 
      00862B 03                    1168 	.byte      3
      00862C 54 4D 50              1169         .ascii     "TMP"
      00862F                       1170 TEMP:
      00862F 90 AE 00 08      [ 2] 1171 	LDW Y,#UTMP
      008633 1D 00 02         [ 2] 1172 	SUBW X,#2
      008636 FF               [ 2] 1173         LDW (X),Y
      008637 81               [ 4] 1174         RET
                                   1175 
                                   1176 ;       >IN     ( -- a )
                                   1177 ;        Hold parsing pointer.
      008638 86 2B                 1178         .word      LINK
                           0005BA  1179 LINK = . 
      00863A 03                    1180         .byte      3
      00863B 3E 49 4E              1181         .ascii    ">IN"
      00863E                       1182 INN:
      00863E 90 AE 00 0A      [ 2] 1183 	LDW Y,#UINN 
      008642 1D 00 02         [ 2] 1184 	SUBW X,#2
      008645 FF               [ 2] 1185         LDW (X),Y
      008646 81               [ 4] 1186         RET
                                   1187 
                                   1188 ;       #TIB    ( -- a )
                                   1189 ;       Count in terminal input buffer.
      008647 86 3A                 1190         .word      LINK
                           0005C9  1191 LINK = . 
      008649 04                    1192         .byte      4
      00864A 23 54 49 42           1193         .ascii     "#TIB"
      00864E                       1194 NTIB:
      00864E 90 AE 00 0C      [ 2] 1195 	LDW Y,#UCTIB 
      008652 1D 00 02         [ 2] 1196 	SUBW X,#2
      008655 FF               [ 2] 1197         LDW (X),Y
      008656 81               [ 4] 1198         RET
                                   1199 
                                   1200 ;       TBUF ( -- a )
                                   1201 ;       address of 128 bytes transaction buffer 
      008657 86 49                 1202         .word LINK 
                           0005D9  1203         LINK=.
      008659 04                    1204         .byte 4 
      00865A 54 42 55 46           1205         .ascii "TBUF"
      00865E                       1206 TBUF:
      00865E 90 AE 16 80      [ 2] 1207         ldw y,#ROWBUFF
      008662 1D 00 02         [ 2] 1208         subw x,#CELLL
      008665 FF               [ 2] 1209         ldw (x),y 
      008666 81               [ 4] 1210         ret 
                                   1211 
                                   1212 ; systeme variable 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]



                                   1213 ; compilation destination 
                                   1214 ; TFLASH ( -- A )
      008667 86 59                 1215         .word LINK 
                           0005E9  1216         LINK=.
      008669 06                    1217         .byte 6 
      00866A 54 46 4C 41 53 48     1218         .ascii "TFLASH"         
      008670                       1219 TFLASH:
      008670 1D 00 02         [ 2] 1220         subw x,#CELLL 
      008673 90 AE 00 1E      [ 2] 1221         ldw y,#UTFLASH
      008677 FF               [ 2] 1222         ldw (x),y 
      008678 81               [ 4] 1223         ret 
                                   1224 
                                   1225 ;       "EVAL   ( -- a )
                                   1226 ;       Execution vector of EVAL.
      008679 86 69                 1227         .word      LINK
                           0005FB  1228 LINK = . 
      00867B 05                    1229         .byte      5
      00867C 27 45 56 41 4C        1230         .ascii     "'EVAL"
      008681                       1231 TEVAL:
      008681 90 AE 00 10      [ 2] 1232 	LDW Y,#UINTER 
      008685 1D 00 02         [ 2] 1233 	SUBW X,#2
      008688 FF               [ 2] 1234         LDW (X),Y
      008689 81               [ 4] 1235         RET
                                   1236 
                                   1237 ;       HLD     ( -- a )
                                   1238 ;       Hold a pointer of output string.
      00868A 86 7B                 1239         .word      LINK
                           00060C  1240 LINK = . 
      00868C 03                    1241         .byte      3
      00868D 48 4C 44              1242         .ascii     "HLD"
      008690                       1243 HLD:
      008690 90 AE 00 12      [ 2] 1244 	LDW Y,#UHLD 
      008694 1D 00 02         [ 2] 1245 	SUBW X,#2
      008697 FF               [ 2] 1246         LDW (X),Y
      008698 81               [ 4] 1247         RET
                                   1248 
                                   1249 ;       CONTEXT ( -- a )
                                   1250 ;       Start vocabulary search.
      008699 86 8C                 1251         .word      LINK
                           00061B  1252 LINK = . 
      00869B 07                    1253         .byte      7
      00869C 43 4F 4E 54 45 58 54  1254         .ascii     "CONTEXT"
      0086A3                       1255 CNTXT:
      0086A3 90 AE 00 14      [ 2] 1256 	LDW Y,#UCNTXT
      0086A7 1D 00 02         [ 2] 1257 	SUBW X,#2
      0086AA FF               [ 2] 1258         LDW (X),Y
      0086AB 81               [ 4] 1259         RET
                                   1260 
                                   1261 ;       VP      ( -- a )
                                   1262 ;       Point to top of variables
      0086AC 86 9B                 1263         .word      LINK
                           00062E  1264 LINK = . 
      0086AE 02                    1265         .byte      2
      0086AF 56 50                 1266         .ascii     "VP"
      0086B1                       1267 VPP:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



      0086B1 90 AE 00 16      [ 2] 1268 	LDW Y,#UVP 
      0086B5 1D 00 02         [ 2] 1269 	SUBW X,#2
      0086B8 FF               [ 2] 1270         LDW (X),Y
      0086B9 81               [ 4] 1271         RET
                                   1272 
                                   1273 ;       CP    ( -- a )
                                   1274 ;       Pointer to top of FLASH 
      0086BA 86 AE                 1275         .word LINK 
                           00063C  1276         LINK=.
      0086BC 02                    1277         .byte 2 
      0086BD 43 50                 1278         .ascii "CP"
      0086BF                       1279 CPP: 
      0086BF 90 AE 00 18      [ 2] 1280         ldw y,#UCP 
      0086C3 1D 00 02         [ 2] 1281         subw x,#CELLL 
      0086C6 FF               [ 2] 1282         ldw (x),y 
      0086C7 81               [ 4] 1283         ret                
                                   1284 
                                   1285 ;       LAST    ( -- a )
                                   1286 ;       Point to last name in dictionary.
      0086C8 86 BC                 1287         .word      LINK
                           00064A  1288 LINK = . 
      0086CA 04                    1289         .byte      4
      0086CB 4C 41 53 54           1290         .ascii     "LAST"
      0086CF                       1291 LAST:
      0086CF 90 AE 00 1A      [ 2] 1292 	LDW Y,#ULAST 
      0086D3 1D 00 02         [ 2] 1293 	SUBW X,#2
      0086D6 FF               [ 2] 1294         LDW (X),Y
      0086D7 81               [ 4] 1295         RET
                                   1296 
                                   1297 ; address of system variable URLAST 
                                   1298 ;       RAMLAST ( -- a )
                                   1299 ; RAM dictionary context 
      0086D8 86 CA                 1300         .word LINK 
                           00065A  1301         LINK=. 
      0086DA 07                    1302         .byte 7  
      0086DB 52 41 4D 4C 41 53 54  1303         .ascii "RAMLAST" 
      0086E2                       1304 RAMLAST: 
      0086E2 90 AE 00 20      [ 2] 1305         ldw y,#URLAST 
      0086E6 1D 00 02         [ 2] 1306         subw x,#CELLL 
      0086E9 FF               [ 2] 1307         ldw (x),y 
      0086EA 81               [ 4] 1308         ret 
                                   1309 
                                   1310 ; OFFSET ( -- a )
                                   1311 ; address of system variable OFFSET 
      0086EB 86 DA                 1312         .word LINK 
                           00066D  1313         LINK=.
      0086ED 06                    1314         .byte 6
      0086EE 4F 46 46 53 45 54     1315         .ascii "OFFSET" 
      0086F4                       1316 OFFSET: 
      0086F4 1D 00 02         [ 2] 1317         subw x,#CELLL
      0086F7 90 AE 00 1C      [ 2] 1318         ldw y,#UOFFSET 
      0086FB FF               [ 2] 1319         ldw (x),y 
      0086FC 81               [ 4] 1320         ret 
                                   1321 
                                   1322 ; adjust jump address adding OFFSET
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



                                   1323 ; ADR-ADJ ( a -- a+offset )
      0086FD                       1324 ADRADJ: 
      0086FD CD 86 F4         [ 4] 1325         call OFFSET 
      008700 CD 84 BC         [ 4] 1326         call AT 
      008703 CC 87 5E         [ 2] 1327         jp PLUS 
                                   1328 
                                   1329 
                                   1330 ;; Common functions
                                   1331 
                                   1332 ;       ?DUP    ( w -- w w | 0 )
                                   1333 ;       Dup tos if its is not zero.
      008706 86 ED                 1334         .word      LINK
                           000688  1335 LINK = . 
      008708 04                    1336         .byte      4
      008709 3F 44 55 50           1337         .ascii     "?DUP"
      00870D                       1338 QDUP:
      00870D 90 93            [ 1] 1339         LDW Y,X
      00870F 90 FE            [ 2] 1340 	LDW Y,(Y)
      008711 27 04            [ 1] 1341         JREQ     QDUP1
      008713 1D 00 02         [ 2] 1342 	SUBW X,#2
      008716 FF               [ 2] 1343         LDW (X),Y
      008717 81               [ 4] 1344 QDUP1:  RET
                                   1345 
                                   1346 ;       ROT     ( w1 w2 w3 -- w2 w3 w1 )
                                   1347 ;       Rot 3rd item to top.
      008718 87 08                 1348         .word      LINK
                           00069A  1349 LINK = . 
      00871A 03                    1350         .byte      3
      00871B 52 4F 54              1351         .ascii     "ROT"
      00871E                       1352 ROT:
      00871E 90 93            [ 1] 1353         ldw y,x 
      008720 90 FE            [ 2] 1354         ldw y,(y)
      008722 90 89            [ 2] 1355         pushw y 
      008724 90 93            [ 1] 1356         ldw y,x 
      008726 90 EE 04         [ 2] 1357         ldw y,(4,y)
      008729 FF               [ 2] 1358         ldw (x),y 
      00872A 90 93            [ 1] 1359         ldw y,x 
      00872C 90 EE 02         [ 2] 1360         ldw y,(2,y)
      00872F EF 04            [ 2] 1361         ldw (4,x),y 
      008731 90 85            [ 2] 1362         popw y 
      008733 EF 02            [ 2] 1363         ldw (2,x),y
      008735 81               [ 4] 1364         ret 
                                   1365 
                                   1366 ;       2DROP   ( w w -- )
                                   1367 ;       Discard two items on stack.
      008736 87 1A                 1368         .word      LINK
                           0006B8  1369 LINK = . 
      008738 05                    1370         .byte      5
      008739 32 44 52 4F 50        1371         .ascii     "2DROP"
      00873E                       1372 DDROP:
      00873E 1C 00 04         [ 2] 1373         ADDW X,#4
      008741 81               [ 4] 1374         RET
                                   1375 
                                   1376 ;       2DUP    ( w1 w2 -- w1 w2 w1 w2 )
                                   1377 ;       Duplicate top two items.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal [24-Bits]



      008742 87 38                 1378         .word      LINK
                           0006C4  1379 LINK = . 
      008744 04                    1380         .byte      4
      008745 32 44 55 50           1381         .ascii     "2DUP"
      008749                       1382 DDUP:
      008749 1D 00 04         [ 2] 1383         SUBW X,#4
      00874C 90 93            [ 1] 1384         LDW Y,X
      00874E 90 EE 06         [ 2] 1385         LDW Y,(6,Y)
      008751 EF 02            [ 2] 1386         LDW (2,X),Y
      008753 90 93            [ 1] 1387         LDW Y,X
      008755 90 EE 04         [ 2] 1388         LDW Y,(4,Y)
      008758 FF               [ 2] 1389         LDW (X),Y
      008759 81               [ 4] 1390         RET
                                   1391 
                                   1392 ;       +       ( w w -- sum )
                                   1393 ;       Add top two items.
      00875A 87 44                 1394         .word      LINK
                           0006DC  1395 LINK = . 
      00875C 01                    1396         .byte      1
      00875D 2B                    1397         .ascii     "+"
      00875E                       1398 PLUS:
      00875E 90 93            [ 1] 1399         LDW Y,X
      008760 90 FE            [ 2] 1400         LDW Y,(Y)
      008762 90 BF 24         [ 2] 1401         LDW YTEMP,Y
      008765 1C 00 02         [ 2] 1402         ADDW X,#2
      008768 90 93            [ 1] 1403         LDW Y,X
      00876A 90 FE            [ 2] 1404         LDW Y,(Y)
      00876C 72 B9 00 24      [ 2] 1405         ADDW Y,YTEMP
      008770 FF               [ 2] 1406         LDW (X),Y
      008771 81               [ 4] 1407         RET
                                   1408 
                                   1409 ;       NOT     ( w -- w )
                                   1410 ;       One's complement of tos.
      008772 87 5C                 1411         .word      LINK
                           0006F4  1412 LINK = . 
      008774 03                    1413         .byte      3
      008775 4E 4F 54              1414         .ascii     "NOT"
      008778                       1415 INVER:
      008778 90 93            [ 1] 1416         LDW Y,X
      00877A 90 FE            [ 2] 1417         LDW Y,(Y)
      00877C 90 53            [ 2] 1418         CPLW Y
      00877E FF               [ 2] 1419         LDW (X),Y
      00877F 81               [ 4] 1420         RET
                                   1421 
                                   1422 ;       NEGATE  ( n -- -n )
                                   1423 ;       Two's complement of tos.
      008780 87 74                 1424         .word      LINK
                           000702  1425 LINK = . 
      008782 06                    1426         .byte      6
      008783 4E 45 47 41 54 45     1427         .ascii     "NEGATE"
      008789                       1428 NEGAT:
      008789 90 93            [ 1] 1429         LDW Y,X
      00878B 90 FE            [ 2] 1430         LDW Y,(Y)
      00878D 90 50            [ 2] 1431         NEGW Y
      00878F FF               [ 2] 1432         LDW (X),Y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



      008790 81               [ 4] 1433         RET
                                   1434 
                                   1435 ;       DNEGATE ( d -- -d )
                                   1436 ;       Two's complement of top double.
      008791 87 82                 1437         .word      LINK
                           000713  1438 LINK = . 
      008793 07                    1439         .byte      7
      008794 44 4E 45 47 41 54 45  1440         .ascii     "DNEGATE"
      00879B                       1441 DNEGA:
      00879B 90 93            [ 1] 1442         LDW Y,X
      00879D 90 FE            [ 2] 1443 	LDW Y,(Y)
      00879F 90 53            [ 2] 1444         CPLW Y     
      0087A1 90 BF 24         [ 2] 1445 	LDW YTEMP,Y
      0087A4 90 93            [ 1] 1446         LDW Y,X
      0087A6 90 EE 02         [ 2] 1447         LDW Y,(2,Y)
      0087A9 90 53            [ 2] 1448         CPLW Y
      0087AB 72 A9 00 01      [ 2] 1449         addw y,#1
      0087AF EF 02            [ 2] 1450         LDW (2,X),Y
      0087B1 90 BE 24         [ 2] 1451         LDW Y,YTEMP
      0087B4 24 02            [ 1] 1452         JRNC DN1 
      0087B6 90 5C            [ 2] 1453         INCW Y
      0087B8 FF               [ 2] 1454 DN1:    LDW (X),Y
      0087B9 81               [ 4] 1455         RET
                                   1456 
                                   1457 
                                   1458 ;       S>D ( n -- d )
                                   1459 ; convert single integer to double 
      0087BA 87 93                 1460         .word LINK 
                           00073C  1461         LINK=. 
      0087BC 03                    1462         .byte 3 
      0087BD 53 3E 44              1463         .ascii "S>D"
      0087C0                       1464 STOD: 
      0087C0 1D 00 02         [ 2] 1465         subw x,#CELLL 
      0087C3 90 5F            [ 1] 1466         clrw y 
      0087C5 FF               [ 2] 1467         ldw (x),y 
      0087C6 90 93            [ 1] 1468         ldw y,x 
      0087C8 90 EE 02         [ 2] 1469         ldw y,(2,y)
      0087CB 2A 05            [ 1] 1470         jrpl 1$ 
      0087CD 90 AE FF FF      [ 2] 1471         ldw y,#-1
      0087D1 FF               [ 2] 1472         ldw (x),y 
      0087D2 81               [ 4] 1473 1$:     ret 
                                   1474 
                                   1475 
                                   1476 
                                   1477 
                                   1478 ;       -       ( n1 n2 -- n1-n2 )
                                   1479 ;       Subtraction.
      0087D3 87 BC                 1480         .word      LINK
                           000755  1481 LINK = . 
      0087D5 01                    1482         .byte      1
      0087D6 2D                    1483         .ascii     "-"
      0087D7                       1484 SUBB:
      0087D7 90 93            [ 1] 1485         LDW Y,X
      0087D9 90 FE            [ 2] 1486         LDW Y,(Y)
      0087DB 90 BF 24         [ 2] 1487         LDW YTEMP,Y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



      0087DE 1C 00 02         [ 2] 1488         ADDW X,#2
      0087E1 90 93            [ 1] 1489         LDW Y,X
      0087E3 90 FE            [ 2] 1490         LDW Y,(Y)
      0087E5 72 B2 00 24      [ 2] 1491         SUBW Y,YTEMP
      0087E9 FF               [ 2] 1492         LDW (X),Y
      0087EA 81               [ 4] 1493         RET
                                   1494 
                                   1495 ;       ABS     ( n -- n )
                                   1496 ;       Return  absolute value of n.
      0087EB 87 D5                 1497         .word      LINK
                           00076D  1498 LINK = . 
      0087ED 03                    1499         .byte      3
      0087EE 41 42 53              1500         .ascii     "ABS"
      0087F1                       1501 ABSS:
      0087F1 90 93            [ 1] 1502         LDW Y,X
      0087F3 90 FE            [ 2] 1503 	LDW Y,(Y)
      0087F5 2A 03            [ 1] 1504         JRPL     AB1     ;negate:
      0087F7 90 50            [ 2] 1505         NEGW     Y     ;else negate hi byte
      0087F9 FF               [ 2] 1506         LDW (X),Y
      0087FA 81               [ 4] 1507 AB1:    RET
                                   1508 
                                   1509 ;       =       ( w w -- t )
                                   1510 ;       Return true if top two are =al.
      0087FB 87 ED                 1511         .word      LINK
                           00077D  1512 LINK = . 
      0087FD 01                    1513         .byte      1
      0087FE 3D                    1514         .ascii     "="
      0087FF                       1515 EQUAL:
      0087FF A6 FF            [ 1] 1516         LD A,#0xFF  ;true
      008801 90 93            [ 1] 1517         LDW Y,X    ;D = n2
      008803 90 FE            [ 2] 1518         LDW Y,(Y)
      008805 90 BF 24         [ 2] 1519         LDW YTEMP,Y
      008808 1C 00 02         [ 2] 1520         ADDW X,#2
      00880B 90 93            [ 1] 1521         LDW Y,X
      00880D 90 FE            [ 2] 1522         LDW Y,(Y)
      00880F 90 B3 24         [ 2] 1523         CPW Y,YTEMP     ;if n2 <> n1
      008812 27 01            [ 1] 1524         JREQ     EQ1
      008814 4F               [ 1] 1525         CLR A
      008815 F7               [ 1] 1526 EQ1:    LD (X),A
      008816 E7 01            [ 1] 1527         LD (1,X),A
      008818 81               [ 4] 1528 	RET     
                                   1529 
                                   1530 ;       U<      ( u u -- t )
                                   1531 ;       Unsigned compare of top two items.
      008819 87 FD                 1532         .word      LINK
                           00079B  1533 LINK = . 
      00881B 02                    1534         .byte      2
      00881C 55 3C                 1535         .ascii     "U<"
      00881E                       1536 ULESS:
      00881E A6 FF            [ 1] 1537         LD A,#0xFF  ;true
      008820 90 93            [ 1] 1538         LDW Y,X    ;D = n2
      008822 90 FE            [ 2] 1539         LDW Y,(Y)
      008824 90 BF 24         [ 2] 1540         LDW YTEMP,Y
      008827 1C 00 02         [ 2] 1541         ADDW X,#2
      00882A 90 93            [ 1] 1542         LDW Y,X
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



      00882C 90 FE            [ 2] 1543         LDW Y,(Y)
      00882E 90 B3 24         [ 2] 1544         CPW Y,YTEMP     ;if n2 <> n1
      008831 25 01            [ 1] 1545         JRULT     ULES1
      008833 4F               [ 1] 1546         CLR A
      008834 F7               [ 1] 1547 ULES1:  LD (X),A
      008835 E7 01            [ 1] 1548         LD (1,X),A
      008837 81               [ 4] 1549 	RET     
                                   1550 
                                   1551 ;       <       ( n1 n2 -- t )
                                   1552 ;       Signed compare of top two items.
      008838 88 1B                 1553         .word      LINK
                           0007BA  1554 LINK = . 
      00883A 01                    1555         .byte      1
      00883B 3C                    1556         .ascii     "<"
      00883C                       1557 LESS:
      00883C A6 FF            [ 1] 1558         LD A,#0xFF  ;true
      00883E 90 93            [ 1] 1559         LDW Y,X    ;D = n2
      008840 90 FE            [ 2] 1560         LDW Y,(Y)
      008842 90 BF 24         [ 2] 1561         LDW YTEMP,Y
      008845 1C 00 02         [ 2] 1562         ADDW X,#2
      008848 90 93            [ 1] 1563         LDW Y,X
      00884A 90 FE            [ 2] 1564         LDW Y,(Y)
      00884C 90 B3 24         [ 2] 1565         CPW Y,YTEMP     ;if n2 <> n1
      00884F 2F 01            [ 1] 1566         JRSLT     LT1
      008851 4F               [ 1] 1567         CLR A
      008852 F7               [ 1] 1568 LT1:    LD (X),A
      008853 E7 01            [ 1] 1569         LD (1,X),A
      008855 81               [ 4] 1570 	RET     
                                   1571 
                                   1572 ;       MAX     ( n n -- n )
                                   1573 ;       Return greater of two top items.
      008856 88 3A                 1574         .word      LINK
                           0007D8  1575 LINK = . 
      008858 03                    1576         .byte      3
      008859 4D 41 58              1577         .ascii     "MAX"
      00885C                       1578 MAX:
      00885C 90 93            [ 1] 1579         LDW Y,X    ;D = n2
      00885E 90 EE 02         [ 2] 1580         LDW Y,(2,Y)
      008861 90 BF 24         [ 2] 1581         LDW YTEMP,Y
      008864 90 93            [ 1] 1582         LDW Y,X
      008866 90 FE            [ 2] 1583         LDW Y,(Y)
      008868 90 B3 24         [ 2] 1584         CPW Y,YTEMP     ;if n2 <> n1
      00886B 2F 02            [ 1] 1585         JRSLT     MAX1
      00886D EF 02            [ 2] 1586         LDW (2,X),Y
      00886F 1C 00 02         [ 2] 1587 MAX1:   ADDW X,#2
      008872 81               [ 4] 1588 	RET     
                                   1589 
                                   1590 ;       MIN     ( n n -- n )
                                   1591 ;       Return smaller of top two items.
      008873 88 58                 1592         .word      LINK
                           0007F5  1593 LINK = . 
      008875 03                    1594         .byte      3
      008876 4D 49 4E              1595         .ascii     "MIN"
      008879                       1596 MIN:
      008879 90 93            [ 1] 1597         LDW Y,X    ;D = n2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



      00887B 90 EE 02         [ 2] 1598         LDW Y,(2,Y)
      00887E 90 BF 24         [ 2] 1599         LDW YTEMP,Y
      008881 90 93            [ 1] 1600         LDW Y,X
      008883 90 FE            [ 2] 1601         LDW Y,(Y)
      008885 90 B3 24         [ 2] 1602         CPW Y,YTEMP     ;if n2 <> n1
      008888 2C 02            [ 1] 1603         JRSGT     MIN1
      00888A EF 02            [ 2] 1604         LDW (2,X),Y
      00888C 1C 00 02         [ 2] 1605 MIN1:	ADDW X,#2
      00888F 81               [ 4] 1606 	RET     
                                   1607 
                                   1608 ;       WITHIN  ( u ul uh -- t )
                                   1609 ;       Return true if u is within
                                   1610 ;       range of ul and uh. ( ul <= u < uh )
      008890 88 75                 1611         .word      LINK
                           000812  1612 LINK = . 
      008892 06                    1613         .byte      6
      008893 57 49 54 48 49 4E     1614         .ascii     "WITHIN"
      008899                       1615 WITHI:
      008899 CD 85 8D         [ 4] 1616         CALL     OVER
      00889C CD 87 D7         [ 4] 1617         CALL     SUBB
      00889F CD 85 2C         [ 4] 1618         CALL     TOR
      0088A2 CD 87 D7         [ 4] 1619         CALL     SUBB
      0088A5 CD 85 0D         [ 4] 1620         CALL     RFROM
      0088A8 CC 88 1E         [ 2] 1621         JP     ULESS
                                   1622 
                                   1623 ;; Divide
                                   1624 
                                   1625 ;       UM/MOD  ( udl udh un -- ur uq )
                                   1626 ;       Unsigned divide of a double by a
                                   1627 ;       single. Return mod and quotient.
      0088AB 88 92                 1628         .word      LINK
                           00082D  1629 LINK = . 
      0088AD 06                    1630         .byte      6
      0088AE 55 4D 2F 4D 4F 44     1631         .ascii     "UM/MOD"
      0088B4                       1632 UMMOD:
      0088B4 BF 22            [ 2] 1633 	LDW XTEMP,X	; save stack pointer
      0088B6 FE               [ 2] 1634 	LDW X,(X)	; un
      0088B7 BF 24            [ 2] 1635 	LDW YTEMP,X     ; save un
      0088B9 90 BE 22         [ 2] 1636 	LDW Y,XTEMP	; stack pointer
      0088BC 90 EE 04         [ 2] 1637 	LDW Y,(4,Y)     ; Y=udl
      0088BF BE 22            [ 2] 1638 	LDW X,XTEMP
      0088C1 EE 02            [ 2] 1639 	LDW X,(2,X)	; X=udh
      0088C3 B3 24            [ 2] 1640 	CPW X,YTEMP
      0088C5 23 0F            [ 2] 1641 	JRULE MMSM1
      0088C7 BE 22            [ 2] 1642 	LDW X,XTEMP
      0088C9 1C 00 02         [ 2] 1643 	ADDW X,#2	; pop off 1 level
      0088CC 90 AE FF FF      [ 2] 1644 	LDW Y,#0xFFFF
      0088D0 FF               [ 2] 1645 	LDW (X),Y
      0088D1 90 5F            [ 1] 1646 	CLRW Y
      0088D3 EF 02            [ 2] 1647 	LDW (2,X),Y
      0088D5 81               [ 4] 1648 	RET
      0088D6                       1649 MMSM1:
                                   1650 ; take advantage of divw x,y when udh==0
      0088D6 5D               [ 2] 1651         tnzw x  ; is udh==0?
      0088D7 26 11            [ 1] 1652         jrne MMSM2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



      0088D9 93               [ 1] 1653         ldw x,y    ;udl 
      0088DA 90 BE 24         [ 2] 1654         ldw y,YTEMP ; divisor 
      0088DD 65               [ 2] 1655         divw x,y 
      0088DE 89               [ 2] 1656         pushw x     ; quotient 
      0088DF BE 22            [ 2] 1657         ldw x,XTEMP 
      0088E1 1C 00 02         [ 2] 1658         addw x,#CELLL 
      0088E4 EF 02            [ 2] 1659         ldw (2,x),y  ; ur
      0088E6 90 85            [ 2] 1660         popw y 
      0088E8 FF               [ 2] 1661         ldw (x),y ; uq 
      0088E9 81               [ 4] 1662         ret 
      0088EA                       1663 MMSM2:        
      0088EA A6 11            [ 1] 1664 	LD A,#17	; loop count
      0088EC                       1665 MMSM3:
      0088EC B3 24            [ 2] 1666 	CPW X,YTEMP	; compare udh to un
      0088EE 25 04            [ 1] 1667 	JRULT MMSM4	; can't subtract
      0088F0 72 B0 00 24      [ 2] 1668 	SUBW X,YTEMP	; can subtract
      0088F4                       1669 MMSM4:
      0088F4 8C               [ 1] 1670 	CCF	; quotient bit
      0088F5 90 59            [ 2] 1671 	RLCW Y	; rotate into quotient
      0088F7 59               [ 2] 1672 	RLCW X	; rotate into remainder
      0088F8 4A               [ 1] 1673 	DEC A	; repeat
      0088F9 22 F1            [ 1] 1674 	JRUGT MMSM3
      0088FB 56               [ 2] 1675         RRCW X 
      0088FC BF 24            [ 2] 1676 	LDW YTEMP,X	; done, save remainder
      0088FE BE 22            [ 2] 1677 	LDW X,XTEMP
      008900 1C 00 02         [ 2] 1678 	ADDW X,#2	; drop
      008903 FF               [ 2] 1679 	LDW (X),Y
      008904 90 BE 24         [ 2] 1680 	LDW Y,YTEMP	; save quotient
      008907 EF 02            [ 2] 1681 	LDW (2,X),Y
      008909 81               [ 4] 1682 	RET
                                   1683 	
                                   1684 ;       M/MOD   ( d n -- r q )
                                   1685 ;       Signed floored divide of double by
                                   1686 ;       single. Return mod and quotient.
      00890A 88 AD                 1687         .word      LINK
                           00088C  1688 LINK = . 
      00890C 05                    1689         .byte      5
      00890D 4D 2F 4D 4F 44        1690         .ascii     "M/MOD"
      008912                       1691 MSMOD:  
      008912 CD 85 63         [ 4] 1692         CALL	DUPP
      008915 CD 85 9C         [ 4] 1693         CALL	ZLESS
      008918 CD 85 63         [ 4] 1694         CALL	DUPP
      00891B CD 85 2C         [ 4] 1695         CALL	TOR
      00891E CD 84 67         [ 4] 1696         CALL	QBRAN
      008921 89 2F                 1697         .word	MMOD1
      008923 CD 87 89         [ 4] 1698         CALL	NEGAT
      008926 CD 85 2C         [ 4] 1699         CALL	TOR
      008929 CD 87 9B         [ 4] 1700         CALL	DNEGA
      00892C CD 85 0D         [ 4] 1701         CALL	RFROM
      00892F CD 85 2C         [ 4] 1702 MMOD1:	CALL	TOR
      008932 CD 85 63         [ 4] 1703         CALL	DUPP
      008935 CD 85 9C         [ 4] 1704         CALL	ZLESS
      008938 CD 84 67         [ 4] 1705         CALL	QBRAN
      00893B 89 43                 1706         .word	MMOD2
      00893D CD 85 20         [ 4] 1707         CALL	RAT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



      008940 CD 87 5E         [ 4] 1708         CALL	PLUS
      008943 CD 85 0D         [ 4] 1709 MMOD2:	CALL	RFROM
      008946 CD 88 B4         [ 4] 1710         CALL	UMMOD
      008949 CD 85 0D         [ 4] 1711         CALL	RFROM
      00894C CD 84 67         [ 4] 1712         CALL	QBRAN
      00894F 89 5A                 1713         .word	MMOD3
      008951 CD 85 73         [ 4] 1714         CALL	SWAPP
      008954 CD 87 89         [ 4] 1715         CALL	NEGAT
      008957 CD 85 73         [ 4] 1716         CALL	SWAPP
      00895A 81               [ 4] 1717 MMOD3:	RET
                                   1718 
                                   1719 ;       /MOD    ( n n -- r q )
                                   1720 ;       Signed divide. Return mod and quotient.
      00895B 89 0C                 1721         .word      LINK
                           0008DD  1722 LINK = . 
      00895D 04                    1723         .byte      4
      00895E 2F 4D 4F 44           1724         .ascii     "/MOD"
      008962                       1725 SLMOD:
      008962 CD 85 8D         [ 4] 1726         CALL	OVER
      008965 CD 85 9C         [ 4] 1727         CALL	ZLESS
      008968 CD 85 73         [ 4] 1728         CALL	SWAPP
      00896B CC 89 12         [ 2] 1729         JP	MSMOD
                                   1730 
                                   1731 ;       MOD     ( n n -- r )
                                   1732 ;       Signed divide. Return mod only.
      00896E 89 5D                 1733         .word      LINK
                           0008F0  1734 LINK = . 
      008970 03                    1735         .byte      3
      008971 4D 4F 44              1736         .ascii     "MOD"
      008974                       1737 MODD:
      008974 CD 89 62         [ 4] 1738 	CALL	SLMOD
      008977 CC 85 59         [ 2] 1739 	JP	DROP
                                   1740 
                                   1741 ;       /       ( n n -- q )
                                   1742 ;       Signed divide. Return quotient only.
      00897A 89 70                 1743         .word      LINK
                           0008FC  1744 LINK = . 
      00897C 01                    1745         .byte      1
      00897D 2F                    1746         .ascii     "/"
      00897E                       1747 SLASH:
      00897E CD 89 62         [ 4] 1748         CALL	SLMOD
      008981 CD 85 73         [ 4] 1749         CALL	SWAPP
      008984 CC 85 59         [ 2] 1750         JP	DROP
                                   1751 
                                   1752 ;; Multiply
                                   1753 
                                   1754 ;       UM*     ( u u -- ud )
                                   1755 ;       Unsigned multiply. Return double product.
      008987 89 7C                 1756         .word      LINK
                           000909  1757 LINK = . 
      008989 03                    1758         .byte      3
      00898A 55 4D 2A              1759         .ascii     "UM*"
      00898D                       1760 UMSTA:	; stack have 4 bytes u1=a,b u2=c,d
                                   1761 ; take advantage of SP addressing modes
                                   1762 ; these PRODx in RAM are not required
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



                                   1763 ; the product is kept on stack as local variable 
                                   1764         ;; bytes offset on data stack 
                           000002  1765         da=2 
                           000003  1766         db=3 
                           000000  1767         dc=0 
                           000001  1768         dd=1 
                                   1769         ;; product bytes offset on return stack 
                           000001  1770         UD1=1  ; ud bits 31..24
                           000002  1771         UD2=2  ; ud bits 23..16
                           000003  1772         UD3=3  ; ud bits 15..8 
                           000004  1773         UD4=4  ; ud bits 7..0 
                                   1774         ;; local variable for product set to zero   
      00898D 90 5F            [ 1] 1775         clrw y 
      00898F 90 89            [ 2] 1776         pushw y  ; bits 15..0
      008991 90 89            [ 2] 1777         pushw y  ; bits 31..16 
      008993 E6 03            [ 1] 1778         ld a,(db,x) ; b 
      008995 90 97            [ 1] 1779         ld yl,a 
      008997 E6 01            [ 1] 1780         ld a,(dd,x)   ; d
      008999 90 42            [ 4] 1781         mul y,a    ; b*d  
      00899B 17 03            [ 2] 1782         ldw (UD3,sp),y ; lowest weight product 
      00899D E6 03            [ 1] 1783         ld a,(db,x)
      00899F 90 97            [ 1] 1784         ld yl,a 
      0089A1 E6 00            [ 1] 1785         ld a,(dc,x)
      0089A3 90 42            [ 4] 1786         mul y,a  ; b*c 
                                   1787         ;;; do the partial sum 
      0089A5 72 F9 02         [ 2] 1788         addw y,(UD2,sp)
      0089A8 4F               [ 1] 1789         clr a 
      0089A9 49               [ 1] 1790         rlc a
      0089AA 6B 01            [ 1] 1791         ld (UD1,sp),a 
      0089AC 17 02            [ 2] 1792         ldw (UD2,sp),y 
      0089AE E6 02            [ 1] 1793         ld a,(da,x)
      0089B0 90 97            [ 1] 1794         ld yl,a 
      0089B2 E6 01            [ 1] 1795         ld a,(dd,x)
      0089B4 90 42            [ 4] 1796         mul y,a   ; a*d 
                                   1797         ;; do partial sum 
      0089B6 72 F9 02         [ 2] 1798         addw y,(UD2,sp)
      0089B9 4F               [ 1] 1799         clr a 
      0089BA 19 01            [ 1] 1800         adc a,(UD1,sp)
      0089BC 6B 01            [ 1] 1801         ld (UD1,sp),a  
      0089BE 17 02            [ 2] 1802         ldw (UD2,sp),y 
      0089C0 E6 02            [ 1] 1803         ld a,(da,x)
      0089C2 90 97            [ 1] 1804         ld yl,a 
      0089C4 E6 00            [ 1] 1805         ld a,(dc,x)
      0089C6 90 42            [ 4] 1806         mul y,a  ;  a*c highest weight product 
                                   1807         ;;; do partial sum 
      0089C8 72 F9 01         [ 2] 1808         addw y,(UD1,sp)
      0089CB FF               [ 2] 1809         ldw (x),y  ; udh 
      0089CC 16 03            [ 2] 1810         ldw y,(UD3,sp)
      0089CE EF 02            [ 2] 1811         ldw (2,x),y  ; udl  
      0089D0 5B 04            [ 2] 1812         addw sp,#4 ; drop local variable 
      0089D2 81               [ 4] 1813         ret  
                                   1814 
                                   1815 
                                   1816 ;       *       ( n n -- n )
                                   1817 ;       Signed multiply. Return single product.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



      0089D3 89 89                 1818         .word      LINK
                           000955  1819 LINK = . 
      0089D5 01                    1820         .byte      1
      0089D6 2A                    1821         .ascii     "*"
      0089D7                       1822 STAR:
      0089D7 CD 89 8D         [ 4] 1823 	CALL	UMSTA
      0089DA CC 85 59         [ 2] 1824 	JP	DROP
                                   1825 
                                   1826 ;       M*      ( n n -- d )
                                   1827 ;       Signed multiply. Return double product.
      0089DD 89 D5                 1828         .word      LINK
                           00095F  1829 LINK = . 
      0089DF 02                    1830         .byte      2
      0089E0 4D 2A                 1831         .ascii     "M*"
      0089E2                       1832 MSTAR:      
      0089E2 CD 87 49         [ 4] 1833         CALL	DDUP
      0089E5 CD 85 D8         [ 4] 1834         CALL	XORR
      0089E8 CD 85 9C         [ 4] 1835         CALL	ZLESS
      0089EB CD 85 2C         [ 4] 1836         CALL	TOR
      0089EE CD 87 F1         [ 4] 1837         CALL	ABSS
      0089F1 CD 85 73         [ 4] 1838         CALL	SWAPP
      0089F4 CD 87 F1         [ 4] 1839         CALL	ABSS
      0089F7 CD 89 8D         [ 4] 1840         CALL	UMSTA
      0089FA CD 85 0D         [ 4] 1841         CALL	RFROM
      0089FD CD 84 67         [ 4] 1842         CALL	QBRAN
      008A00 8A 05                 1843         .word	MSTA1
      008A02 CD 87 9B         [ 4] 1844         CALL	DNEGA
      008A05 81               [ 4] 1845 MSTA1:	RET
                                   1846 
                                   1847 ;       */MOD   ( n1 n2 n3 -- r q )
                                   1848 ;       Multiply n1 and n2, then divide
                                   1849 ;       by n3. Return mod and quotient.
      008A06 89 DF                 1850         .word      LINK
                           000988  1851 LINK = . 
      008A08 05                    1852         .byte      5
      008A09 2A 2F 4D 4F 44        1853         .ascii     "*/MOD"
      008A0E                       1854 SSMOD:
      008A0E CD 85 2C         [ 4] 1855         CALL     TOR
      008A11 CD 89 E2         [ 4] 1856         CALL     MSTAR
      008A14 CD 85 0D         [ 4] 1857         CALL     RFROM
      008A17 CC 89 12         [ 2] 1858         JP     MSMOD
                                   1859 
                                   1860 ;       */      ( n1 n2 n3 -- q )
                                   1861 ;       Multiply n1 by n2, then divide
                                   1862 ;       by n3. Return quotient only.
      008A1A 8A 08                 1863         .word      LINK
                           00099C  1864 LINK = . 
      008A1C 02                    1865         .byte      2
      008A1D 2A 2F                 1866         .ascii     "*/"
      008A1F                       1867 STASL:
      008A1F CD 8A 0E         [ 4] 1868         CALL	SSMOD
      008A22 CD 85 73         [ 4] 1869         CALL	SWAPP
      008A25 CC 85 59         [ 2] 1870         JP	DROP
                                   1871 
                                   1872 ;; Miscellaneous
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



                                   1873 
                                   1874 ;       CELL+   ( a -- a )
                                   1875 ;       Add cell size in byte to address.
      008A28 8A 1C                 1876         .word      LINK
                           0009AA  1877 LINK = . 
      008A2A 02                    1878         .byte       2
      008A2B 32 2B                 1879         .ascii     "2+"
      008A2D                       1880 CELLP:
      008A2D 90 93            [ 1] 1881         LDW Y,X
      008A2F 90 FE            [ 2] 1882 	LDW Y,(Y)
      008A31 72 A9 00 02      [ 2] 1883         ADDW Y,#CELLL 
      008A35 FF               [ 2] 1884         LDW (X),Y
      008A36 81               [ 4] 1885         RET
                                   1886 
                                   1887 ;       CELL-   ( a -- a )
                                   1888 ;       Subtract 2 from address.
      008A37 8A 2A                 1889         .word      LINK
                           0009B9  1890 LINK = . 
      008A39 02                    1891         .byte       2
      008A3A 32 2D                 1892         .ascii     "2-"
      008A3C                       1893 CELLM:
      008A3C 90 93            [ 1] 1894         LDW Y,X
      008A3E 90 FE            [ 2] 1895 	LDW Y,(Y)
      008A40 72 A2 00 02      [ 2] 1896         SUBW Y,#CELLL
      008A44 FF               [ 2] 1897         LDW (X),Y
      008A45 81               [ 4] 1898         RET
                                   1899 
                                   1900 ;       CELLS   ( n -- n )
                                   1901 ;       Multiply tos by 2.
      008A46 8A 39                 1902         .word      LINK
                           0009C8  1903 LINK = . 
      008A48 02                    1904         .byte       2
      008A49 32 2A                 1905         .ascii     "2*"
      008A4B                       1906 CELLS:
      008A4B 90 93            [ 1] 1907         LDW Y,X
      008A4D 90 FE            [ 2] 1908 	LDW Y,(Y)
      008A4F 90 58            [ 2] 1909         SLAW Y
      008A51 FF               [ 2] 1910         LDW (X),Y
      008A52 81               [ 4] 1911         RET
                                   1912 
                                   1913 ;       1+      ( a -- a )
                                   1914 ;       Add cell size in byte to address.
      008A53 8A 48                 1915         .word      LINK
                           0009D5  1916 LINK = . 
      008A55 02                    1917         .byte      2
      008A56 31 2B                 1918         .ascii     "1+"
      008A58                       1919 ONEP:
      008A58 90 93            [ 1] 1920         LDW Y,X
      008A5A 90 FE            [ 2] 1921 	LDW Y,(Y)
      008A5C 90 5C            [ 2] 1922         INCW Y
      008A5E FF               [ 2] 1923         LDW (X),Y
      008A5F 81               [ 4] 1924         RET
                                   1925 
                                   1926 ;       1-      ( a -- a )
                                   1927 ;       Subtract 2 from address.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



      008A60 8A 55                 1928         .word      LINK
                           0009E2  1929 LINK = . 
      008A62 02                    1930         .byte      2
      008A63 31 2D                 1931         .ascii     "1-"
      008A65                       1932 ONEM:
      008A65 90 93            [ 1] 1933         LDW Y,X
      008A67 90 FE            [ 2] 1934 	LDW Y,(Y)
      008A69 90 5A            [ 2] 1935         DECW Y
      008A6B FF               [ 2] 1936         LDW (X),Y
      008A6C 81               [ 4] 1937         RET
                                   1938 
                                   1939 ;  shift left n times 
                                   1940 ; LSHIFT ( n1 n2 -- n1<<n2 )
      008A6D 8A 62                 1941         .word LINK 
                           0009EF  1942         LINK=.
      008A6F 06                    1943         .byte 6 
      008A70 4C 53 48 49 46 54     1944         .ascii "LSHIFT"
      008A76                       1945 LSHIFT:
      008A76 E6 01            [ 1] 1946         ld a,(1,x)
      008A78 1C 00 02         [ 2] 1947         addw x,#CELLL 
      008A7B 90 93            [ 1] 1948         ldw y,x 
      008A7D 90 FE            [ 2] 1949         ldw y,(y)
      008A7F                       1950 LSHIFT1:
      008A7F 4D               [ 1] 1951         tnz a 
      008A80 27 05            [ 1] 1952         jreq LSHIFT4 
      008A82 90 58            [ 2] 1953         sllw y 
      008A84 4A               [ 1] 1954         dec a 
      008A85 20 F8            [ 2] 1955         jra LSHIFT1 
      008A87                       1956 LSHIFT4:
      008A87 FF               [ 2] 1957         ldw (x),y 
      008A88 81               [ 4] 1958         ret 
                                   1959 
                                   1960 ; shift right n times                 
                                   1961 ; RSHIFT (n1 n2 -- n1>>n2 )
      008A89 8A 6F                 1962         .word LINK 
                           000A0B  1963         LINK=.
      008A8B 06                    1964         .byte 6
      008A8C 52 53 48 49 46 54     1965         .ascii "RSHIFT"
      008A92                       1966 RSHIFT:
      008A92 E6 01            [ 1] 1967         ld a,(1,x)
      008A94 1C 00 02         [ 2] 1968         addw x,#CELLL 
      008A97 90 93            [ 1] 1969         ldw y,x 
      008A99 90 FE            [ 2] 1970         ldw y,(y)
      008A9B                       1971 RSHIFT1:
      008A9B 4D               [ 1] 1972         tnz a 
      008A9C 27 05            [ 1] 1973         jreq RSHIFT4 
      008A9E 90 54            [ 2] 1974         srlw y 
      008AA0 4A               [ 1] 1975         dec a 
      008AA1 20 F8            [ 2] 1976         jra RSHIFT1 
      008AA3                       1977 RSHIFT4:
      008AA3 FF               [ 2] 1978         ldw (x),y 
      008AA4 81               [ 4] 1979         ret 
                                   1980 
                                   1981 
                                   1982 ;       2/      ( n -- n )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



                                   1983 ;       divide  tos by 2.
      008AA5 8A 8B                 1984         .word      LINK
                           000A27  1985 LINK = . 
      008AA7 02                    1986         .byte      2
      008AA8 32 2F                 1987         .ascii     "2/"
      008AAA                       1988 TWOSL:
      008AAA 90 93            [ 1] 1989         LDW Y,X
      008AAC 90 FE            [ 2] 1990 	LDW Y,(Y)
      008AAE 90 57            [ 2] 1991         SRAW Y
      008AB0 FF               [ 2] 1992         LDW (X),Y
      008AB1 81               [ 4] 1993         RET
                                   1994 
                                   1995 ;       BL      ( -- 32 )
                                   1996 ;       Return 32,  blank character.
      008AB2 8A A7                 1997         .word      LINK
                           000A34  1998 LINK = . 
      008AB4 02                    1999         .byte      2
      008AB5 42 4C                 2000         .ascii     "BL"
      008AB7                       2001 BLANK:
      008AB7 1D 00 02         [ 2] 2002         SUBW X,#2
      008ABA 90 AE 00 20      [ 2] 2003 	LDW Y,#32
      008ABE FF               [ 2] 2004         LDW (X),Y
      008ABF 81               [ 4] 2005         RET
                                   2006 
                                   2007 ;         0     ( -- 0)
                                   2008 ;         Return 0.
      008AC0 8A B4                 2009         .word      LINK
                           000A42  2010 LINK = . 
      008AC2 01                    2011         .byte       1
      008AC3 30                    2012         .ascii     "0"
      008AC4                       2013 ZERO:
      008AC4 1D 00 02         [ 2] 2014         SUBW X,#2
      008AC7 90 5F            [ 1] 2015 	CLRW Y
      008AC9 FF               [ 2] 2016         LDW (X),Y
      008ACA 81               [ 4] 2017         RET
                                   2018 
                                   2019 ;         1     ( -- 1)
                                   2020 ;         Return 1.
      008ACB 8A C2                 2021         .word      LINK
                           000A4D  2022 LINK = . 
      008ACD 01                    2023         .byte       1
      008ACE 31                    2024         .ascii     "1"
      008ACF                       2025 ONE:
      008ACF 1D 00 02         [ 2] 2026         SUBW X,#2
      008AD2 90 AE 00 01      [ 2] 2027 	LDW Y,#1
      008AD6 FF               [ 2] 2028         LDW (X),Y
      008AD7 81               [ 4] 2029         RET
                                   2030 
                                   2031 ;         -1    ( -- -1)
                                   2032 ;         Return 32,  blank character.
      008AD8 8A CD                 2033         .word      LINK
                           000A5A  2034 LINK = . 
      008ADA 02                    2035         .byte       2
      008ADB 2D 31                 2036         .ascii     "-1"
      008ADD                       2037 MONE:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



      008ADD 1D 00 02         [ 2] 2038         SUBW X,#2
      008AE0 90 AE FF FF      [ 2] 2039 	LDW Y,#0xFFFF
      008AE4 FF               [ 2] 2040         LDW (X),Y
      008AE5 81               [ 4] 2041         RET
                                   2042 
                                   2043 ;       >CHAR   ( c -- c )
                                   2044 ;       Filter non-printing characters.
      008AE6 8A DA                 2045         .word      LINK
                           000A68  2046 LINK = . 
      008AE8 05                    2047         .byte      5
      008AE9 3E 43 48 41 52        2048         .ascii     ">CHAR"
      008AEE                       2049 TCHAR:
      008AEE E6 01            [ 1] 2050         ld a,(1,x)
      008AF0 A1 20            [ 1] 2051         cp a,#32  
      008AF2 2B 05            [ 1] 2052         jrmi 1$ 
      008AF4 A1 7F            [ 1] 2053         cp a,#127 
      008AF6 2A 01            [ 1] 2054         jrpl 1$ 
      008AF8 81               [ 4] 2055         ret 
      008AF9 A6 5F            [ 1] 2056 1$:     ld a,#'_ 
      008AFB E7 01            [ 1] 2057         ld (1,x),a 
      008AFD 81               [ 4] 2058         ret 
                                   2059 
                                   2060 ;       DEPTH   ( -- n )
                                   2061 ;       Return  depth of  data stack.
      008AFE 8A E8                 2062         .word      LINK
                           000A80  2063 LINK = . 
      008B00 05                    2064         .byte      5
      008B01 44 45 50 54 48        2065         .ascii     "DEPTH"
      008B06                       2066 DEPTH: 
      008B06 90 BE 2A         [ 2] 2067         LDW Y,SP0    ;save data stack ptr
      008B09 BF 22            [ 2] 2068 	LDW XTEMP,X
      008B0B 72 B2 00 22      [ 2] 2069         SUBW Y,XTEMP     ;#bytes = SP0 - X
      008B0F 90 57            [ 2] 2070         SRAW Y    ;Y = #stack items
      008B11 1D 00 02         [ 2] 2071 	SUBW X,#2
      008B14 FF               [ 2] 2072         LDW (X),Y     ; if neg, underflow
      008B15 81               [ 4] 2073         RET
                                   2074 
                                   2075 ;       PICK    ( ... +n -- ... w )
                                   2076 ;       Copy  nth stack item to tos.
      008B16 8B 00                 2077         .word      LINK
                           000A98  2078 LINK = . 
      008B18 04                    2079         .byte      4
      008B19 50 49 43 4B           2080         .ascii     "PICK"
      008B1D                       2081 PICK:
      008B1D 90 93            [ 1] 2082         LDW Y,X   ;D = n1
      008B1F 90 FE            [ 2] 2083         LDW Y,(Y)
                                   2084 ; modified for standard compliance          
                                   2085 ; 0 PICK must be equivalent to DUP 
      008B21 90 5C            [ 2] 2086         INCW Y 
      008B23 90 58            [ 2] 2087         SLAW Y
      008B25 BF 22            [ 2] 2088         LDW XTEMP,X
      008B27 72 B9 00 22      [ 2] 2089         ADDW Y,XTEMP
      008B2B 90 FE            [ 2] 2090         LDW Y,(Y)
      008B2D FF               [ 2] 2091         LDW (X),Y
      008B2E 81               [ 4] 2092         RET
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



                                   2093 
                                   2094 ;; Memory access
                                   2095 
                                   2096 ;       +!      ( n a -- )
                                   2097 ;       Add n to  contents at address a.
      008B2F 8B 18                 2098         .word      LINK
                           000AB1  2099 LINK = . 
      008B31 02                    2100         .byte      2
      008B32 2B 21                 2101         .ascii     "+!"
      008B34                       2102 PSTOR:
      008B34 90 93            [ 1] 2103         ldw y,x 
      008B36 90 FE            [ 2] 2104         ldw y,(y)
      008B38 90 BF 24         [ 2] 2105         ldw YTEMP,y  ; address
      008B3B 90 FE            [ 2] 2106         ldw y,(y)  
      008B3D 90 89            [ 2] 2107         pushw y  ; value at address 
      008B3F 90 93            [ 1] 2108         ldw y,x 
      008B41 90 EE 02         [ 2] 2109         ldw y,(2,y) ; n 
      008B44 72 F9 01         [ 2] 2110         addw y,(1,sp) ; n+value
      008B47 91 CF 24         [ 5] 2111         ldw [YTEMP],y ;  a!
      008B4A 90 85            [ 2] 2112         popw y    ;drop local var
      008B4C 1C 00 04         [ 2] 2113         addw x,#4 ; DDROP 
      008B4F 81               [ 4] 2114         ret 
                                   2115 
                                   2116 ;       2!      ( d a -- )
                                   2117 ;       Store  double integer to address a.
      008B50 8B 31                 2118         .word      LINK
                           000AD2  2119 LINK = . 
      008B52 02                    2120         .byte      2
      008B53 32 21                 2121         .ascii     "2!"
      008B55                       2122 DSTOR:
      008B55 90 93            [ 1] 2123         ldw y,x 
      008B57 90 FE            [ 2] 2124         ldw y,(y)
      008B59 90 BF 24         [ 2] 2125         ldw YTEMP,y ; address 
      008B5C 1C 00 02         [ 2] 2126         addw x,#CELLL ; drop a 
      008B5F 90 93            [ 1] 2127         ldw y,x 
      008B61 90 FE            [ 2] 2128         ldw y,(y) ; hi word 
      008B63 89               [ 2] 2129         pushw x 
      008B64 EE 02            [ 2] 2130         ldw x,(2,x) ; lo word 
      008B66 91 CF 24         [ 5] 2131         ldw [YTEMP],y
      008B69 90 93            [ 1] 2132         ldw y,x 
      008B6B AE 00 02         [ 2] 2133         ldw x,#2 
      008B6E 92 DF 24         [ 5] 2134         ldw ([YTEMP],x),y 
      008B71 85               [ 2] 2135         popw x 
      008B72 1C 00 04         [ 2] 2136         addw x,#4 ; DDROP 
      008B75 81               [ 4] 2137         ret 
                                   2138 
                                   2139 ;       2@      ( a -- d )
                                   2140 ;       Fetch double integer from address a.
      008B76 8B 52                 2141         .word      LINK
                           000AF8  2142 LINK = . 
      008B78 02                    2143         .byte      2
      008B79 32 40                 2144         .ascii     "2@"
      008B7B                       2145 DAT:
      008B7B 90 93            [ 1] 2146         ldw y,x 
      008B7D 90 FE            [ 2] 2147         ldw y,(y) ;address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



      008B7F 90 BF 24         [ 2] 2148         ldw YTEMP,y 
      008B82 1D 00 02         [ 2] 2149         subw x,#CELLL ; space for udh 
      008B85 91 CE 24         [ 5] 2150         ldw y,[YTEMP] ; udh 
      008B88 FF               [ 2] 2151         ldw (x),y 
      008B89 90 AE 00 02      [ 2] 2152         ldw y,#2
      008B8D 91 DE 24         [ 5] 2153         ldw y,([YTEMP],y) ; udl 
      008B90 EF 02            [ 2] 2154         ldw (2,x),y
      008B92 81               [ 4] 2155         ret 
                                   2156 
                                   2157 ;       COUNT   ( b -- b +n )
                                   2158 ;       Return count byte of a string
                                   2159 ;       and add 1 to byte address.
      008B93 8B 78                 2160         .word      LINK
                           000B15  2161 LINK = . 
      008B95 05                    2162         .byte      5
      008B96 43 4F 55 4E 54        2163         .ascii     "COUNT"
      008B9B                       2164 COUNT:
      008B9B 90 93            [ 1] 2165         ldw y,x 
      008B9D 90 FE            [ 2] 2166         ldw y,(y) ; address 
      008B9F 90 F6            [ 1] 2167         ld a,(y)  ; count 
      008BA1 90 5C            [ 2] 2168         incw y 
      008BA3 FF               [ 2] 2169         ldw (x),y 
      008BA4 1D 00 02         [ 2] 2170         subw x,#CELLL 
      008BA7 E7 01            [ 1] 2171         ld (1,x),a 
      008BA9 7F               [ 1] 2172         clr (x)
      008BAA 81               [ 4] 2173         ret 
                                   2174 
                                   2175 ;       HERE    ( -- a )
                                   2176 ;       Return  top of  variables
      008BAB 8B 95                 2177         .word      LINK
                           000B2D  2178 LINK = . 
      008BAD 04                    2179         .byte      4
      008BAE 48 45 52 45           2180         .ascii     "HERE"
      008BB2                       2181 HERE:
      008BB2 90 AE 00 16      [ 2] 2182       	ldw y,#UVP 
      008BB6 90 FE            [ 2] 2183         ldw y,(y)
      008BB8 1D 00 02         [ 2] 2184         subw x,#CELLL 
      008BBB FF               [ 2] 2185         ldw (x),y 
      008BBC 81               [ 4] 2186         ret 
                                   2187 
                                   2188 ;       PAD     ( -- a )
                                   2189 ;       Return address of text buffer
                                   2190 ;       above  code dictionary.
      008BBD 8B AD                 2191         .word      LINK
                           000B3F  2192 LINK = . 
      008BBF 03                    2193         .byte      3
      008BC0 50 41 44              2194         .ascii     "PAD"
      008BC3                       2195 PAD:
      008BC3 CD 8B B2         [ 4] 2196         CALL     HERE
      008BC6 CD 84 34         [ 4] 2197         CALL     DOLIT
      008BC9 00 50                 2198         .word      80
      008BCB CC 87 5E         [ 2] 2199         JP     PLUS
                                   2200 
                                   2201 ;       TIB     ( -- a )
                                   2202 ;       Return address of terminal input buffer.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



      008BCE 8B BF                 2203         .word      LINK
                           000B50  2204 LINK = . 
      008BD0 03                    2205         .byte      3
      008BD1 54 49 42              2206         .ascii     "TIB"
      008BD4                       2207 TIB:
      008BD4 CD 86 4E         [ 4] 2208         CALL     NTIB
      008BD7 CD 8A 2D         [ 4] 2209         CALL     CELLP
      008BDA CC 84 BC         [ 2] 2210         JP     AT
                                   2211 
                                   2212 ;       @EXECUTE        ( a -- )
                                   2213 ;       Execute vector stored in address a.
      008BDD 8B D0                 2214         .word      LINK
                           000B5F  2215 LINK = . 
      008BDF 08                    2216         .byte      8
      008BE0 40 45 58 45 43 55 54  2217         .ascii     "@EXECUTE"
             45
      008BE8                       2218 ATEXE:
      008BE8 CD 84 BC         [ 4] 2219         CALL     AT
      008BEB CD 87 0D         [ 4] 2220         CALL     QDUP    ;?address or zero
      008BEE CD 84 67         [ 4] 2221         CALL     QBRAN
      008BF1 8B F6                 2222         .word      EXE1
      008BF3 CD 84 8E         [ 4] 2223         CALL     EXECU   ;execute if non-zero
      008BF6 81               [ 4] 2224 EXE1:   RET     ;do nothing if zero
                                   2225 
                                   2226 ;       CMOVE   ( b1 b2 u -- )
                                   2227 ;       Copy u bytes from b1 to b2.
      008BF7 8B DF                 2228         .word      LINK
                           000B79  2229 LINK = . 
      008BF9 05                    2230         .byte      5
      008BFA 43 4D 4F 56 45        2231         .ascii     "CMOVE"
      008BFF                       2232 CMOVE:
      008BFF CD 85 2C         [ 4] 2233         CALL	TOR
      008C02 CD 84 7E         [ 4] 2234         CALL	BRAN
      008C05 8C 1F                 2235         .word	CMOV2
      008C07 CD 85 2C         [ 4] 2236 CMOV1:	CALL	TOR
      008C0A CD 85 63         [ 4] 2237         CALL	DUPP
      008C0D CD 84 DA         [ 4] 2238         CALL	CAT
      008C10 CD 85 20         [ 4] 2239         CALL	RAT
      008C13 CD 84 C9         [ 4] 2240         CALL	CSTOR
      008C16 CD 8A 58         [ 4] 2241         CALL	ONEP
      008C19 CD 85 0D         [ 4] 2242         CALL	RFROM
      008C1C CD 8A 58         [ 4] 2243         CALL	ONEP
      008C1F CD 84 48         [ 4] 2244 CMOV2:	CALL	DONXT
      008C22 8C 07                 2245         .word	CMOV1
      008C24 CC 87 3E         [ 2] 2246         JP	DDROP
                                   2247 
                                   2248 ;       FILL    ( b u c -- )
                                   2249 ;       Fill u bytes of character c
                                   2250 ;       to area beginning at b.
      008C27 8B F9                 2251         .word       LINK
                           000BA9  2252 LINK = . 
      008C29 04                    2253         .byte       4
      008C2A 46 49 4C 4C           2254         .ascii     "FILL"
      008C2E                       2255 FILL:
      008C2E 90 93            [ 1] 2256         ldw y,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



      008C30 90 E6 01         [ 1] 2257         ld a,(1,y) ; c 
      008C33 1C 00 02         [ 2] 2258         addw x,#CELLL ; drop c 
      008C36 90 93            [ 1] 2259         ldw y,x 
      008C38 90 FE            [ 2] 2260         ldw y,(y) ; count
      008C3A 90 89            [ 2] 2261         pushw y 
      008C3C 1C 00 02         [ 2] 2262         addw x,#CELLL ; drop u 
      008C3F 90 93            [ 1] 2263         ldw y,x 
      008C41 1C 00 02         [ 2] 2264         addw x,#CELLL ; drop b 
      008C44 90 FE            [ 2] 2265         ldw y,(y) ; address
      008C46 90 BF 24         [ 2] 2266         ldw YTEMP,y
      008C49 90 85            [ 2] 2267         popw y ; count 
      008C4B                       2268 FILL1:  
      008C4B 92 C7 24         [ 4] 2269         ld [YTEMP],a 
      008C4E 3C 25            [ 1] 2270         inc YTEMP+1
      008C50 24 02            [ 1] 2271         jrnc FILL2 
      008C52 3C 24            [ 1] 2272         inc YTEMP
      008C54                       2273 FILL2: 
      008C54 90 5A            [ 2] 2274         decw y ; count 
      008C56 26 F3            [ 1] 2275         jrne FILL1  
      008C58 81               [ 4] 2276         ret 
                                   2277 
                                   2278 ;       ERASE   ( b u -- )
                                   2279 ;       Erase u bytes beginning at b.
      008C59 8C 29                 2280         .word      LINK
                           000BDB  2281 LINK = . 
      008C5B 05                    2282         .byte      5
      008C5C 45 52 41 53 45        2283         .ascii     "ERASE"
      008C61                       2284 ERASE:
      008C61 90 5F            [ 1] 2285         clrw y 
      008C63 1D 00 02         [ 2] 2286         subw x,#CELLL 
      008C66 FF               [ 2] 2287         ldw (x),y 
      008C67 CC 8C 2E         [ 2] 2288         jp FILL 
                                   2289 
                                   2290 
                                   2291 ;       PACK0x   ( b u a -- a )
                                   2292 ;       Build a counted string with
                                   2293 ;       u characters from b. Null fill.
      008C6A 8C 5B                 2294         .word      LINK
                           000BEC  2295 LINK = . 
      008C6C 05                    2296         .byte      5
      008C6D 50 41 43 4B 30 58     2297         .ascii     "PACK0X"
      008C73                       2298 PACKS:
      008C73 CD 85 63         [ 4] 2299         CALL     DUPP
      008C76 CD 85 2C         [ 4] 2300         CALL     TOR     ;strings only on cell boundary
      008C79 CD 87 49         [ 4] 2301         CALL     DDUP
      008C7C CD 84 C9         [ 4] 2302         CALL     CSTOR
      008C7F CD 8A 58         [ 4] 2303         CALL     ONEP ;save count
      008C82 CD 85 73         [ 4] 2304         CALL     SWAPP
      008C85 CD 8B FF         [ 4] 2305         CALL     CMOVE
      008C88 CD 85 0D         [ 4] 2306         CALL     RFROM
      008C8B 81               [ 4] 2307         RET
                                   2308 
                                   2309 ;; Numeric output, single precision
                                   2310 
                                   2311 ;       DIGIT   ( u -- c )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



                                   2312 ;       Convert digit u to a character.
      008C8C 8C 6C                 2313         .word      LINK
                           000C0E  2314 LINK = . 
      008C8E 05                    2315         .byte      5
      008C8F 44 49 47 49 54        2316         .ascii     "DIGIT"
      008C94                       2317 DIGIT:
      008C94 CD 84 34         [ 4] 2318         CALL	DOLIT
      008C97 00 09                 2319         .word	9
      008C99 CD 85 8D         [ 4] 2320         CALL	OVER
      008C9C CD 88 3C         [ 4] 2321         CALL	LESS
      008C9F CD 84 34         [ 4] 2322         CALL	DOLIT
      008CA2 00 07                 2323         .word	7
      008CA4 CD 85 AF         [ 4] 2324         CALL	ANDD
      008CA7 CD 87 5E         [ 4] 2325         CALL	PLUS
      008CAA CD 84 34         [ 4] 2326         CALL	DOLIT
      008CAD 00 30                 2327         .word	48	;'0'
      008CAF CC 87 5E         [ 2] 2328         JP	PLUS
                                   2329 
                                   2330 ;       EXTRACT ( n base -- n c )
                                   2331 ;       Extract least significant digit from n.
      008CB2 8C 8E                 2332         .word      LINK
                           000C34  2333 LINK = . 
      008CB4 07                    2334         .byte      7
      008CB5 45 58 54 52 41 43 54  2335         .ascii     "EXTRACT"
      008CBC                       2336 EXTRC:
      008CBC CD 8A C4         [ 4] 2337         CALL     ZERO
      008CBF CD 85 73         [ 4] 2338         CALL     SWAPP
      008CC2 CD 88 B4         [ 4] 2339         CALL     UMMOD
      008CC5 CD 85 73         [ 4] 2340         CALL     SWAPP
      008CC8 CC 8C 94         [ 2] 2341         JP     DIGIT
                                   2342 
                                   2343 ;       <#      ( -- )
                                   2344 ;       Initiate  numeric output process.
      008CCB 8C B4                 2345         .word      LINK
                           000C4D  2346 LINK = . 
      008CCD 02                    2347         .byte      2
      008CCE 3C 23                 2348         .ascii     "<#"
      008CD0                       2349 BDIGS:
      008CD0 CD 8B C3         [ 4] 2350         CALL     PAD
      008CD3 CD 86 90         [ 4] 2351         CALL     HLD
      008CD6 CC 84 A5         [ 2] 2352         JP     STORE
                                   2353 
                                   2354 ;       HOLD    ( c -- )
                                   2355 ;       Insert a character into output string.
      008CD9 8C CD                 2356         .word      LINK
                           000C5B  2357 LINK = . 
      008CDB 04                    2358         .byte      4
      008CDC 48 4F 4C 44           2359         .ascii     "HOLD"
      008CE0                       2360 HOLD:
      008CE0 CD 86 90         [ 4] 2361         CALL     HLD
      008CE3 CD 84 BC         [ 4] 2362         CALL     AT
      008CE6 CD 8A 65         [ 4] 2363         CALL     ONEM
      008CE9 CD 85 63         [ 4] 2364         CALL     DUPP
      008CEC CD 86 90         [ 4] 2365         CALL     HLD
      008CEF CD 84 A5         [ 4] 2366         CALL     STORE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



      008CF2 CC 84 C9         [ 2] 2367         JP     CSTOR
                                   2368 
                                   2369 ;       #       ( u -- u )
                                   2370 ;       Extract one digit from u and
                                   2371 ;       append digit to output string.
      008CF5 8C DB                 2372         .word      LINK
                           000C77  2373 LINK = . 
      008CF7 01                    2374         .byte      1
      008CF8 23                    2375         .ascii     "#"
      008CF9                       2376 DIG:
      008CF9 CD 86 20         [ 4] 2377         CALL     BASE
      008CFC CD 84 BC         [ 4] 2378         CALL     AT
      008CFF CD 8C BC         [ 4] 2379         CALL     EXTRC
      008D02 CC 8C E0         [ 2] 2380         JP     HOLD
                                   2381 
                                   2382 ;       #S      ( u -- 0 )
                                   2383 ;       Convert u until all digits
                                   2384 ;       are added to output string.
      008D05 8C F7                 2385         .word      LINK
                           000C87  2386 LINK = . 
      008D07 02                    2387         .byte      2
      008D08 23 53                 2388         .ascii     "#S"
      008D0A                       2389 DIGS:
      008D0A CD 8C F9         [ 4] 2390 DIGS1:  CALL     DIG
      008D0D CD 85 63         [ 4] 2391         CALL     DUPP
      008D10 CD 84 67         [ 4] 2392         CALL     QBRAN
      008D13 8D 17                 2393         .word      DIGS2
      008D15 20 F3            [ 2] 2394         JRA     DIGS1
      008D17 81               [ 4] 2395 DIGS2:  RET
                                   2396 
                                   2397 ;       SIGN    ( n -- )
                                   2398 ;       Add a minus sign to
                                   2399 ;       numeric output string.
      008D18 8D 07                 2400         .word      LINK
                           000C9A  2401 LINK = . 
      008D1A 04                    2402         .byte      4
      008D1B 53 49 47 4E           2403         .ascii     "SIGN"
      008D1F                       2404 SIGN:
      008D1F CD 85 9C         [ 4] 2405         CALL     ZLESS
      008D22 CD 84 67         [ 4] 2406         CALL     QBRAN
      008D25 8D 2F                 2407         .word      SIGN1
      008D27 CD 84 34         [ 4] 2408         CALL     DOLIT
      008D2A 00 2D                 2409         .word      45	;"-"
      008D2C CC 8C E0         [ 2] 2410         JP     HOLD
      008D2F 81               [ 4] 2411 SIGN1:  RET
                                   2412 
                                   2413 ;       #>      ( w -- b u )
                                   2414 ;       Prepare output string.
      008D30 8D 1A                 2415         .word      LINK
                           000CB2  2416 LINK = . 
      008D32 02                    2417         .byte      2
      008D33 23 3E                 2418         .ascii     "#>"
      008D35                       2419 EDIGS:
      008D35 CD 85 59         [ 4] 2420         CALL     DROP
      008D38 CD 86 90         [ 4] 2421         CALL     HLD
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      008D3B CD 84 BC         [ 4] 2422         CALL     AT
      008D3E CD 8B C3         [ 4] 2423         CALL     PAD
      008D41 CD 85 8D         [ 4] 2424         CALL     OVER
      008D44 CC 87 D7         [ 2] 2425         JP     SUBB
                                   2426 
                                   2427 ;       str     ( w -- b u )
                                   2428 ;       Convert a signed integer
                                   2429 ;       to a numeric string.
      008D47 8D 32                 2430         .word      LINK
                           000CC9  2431 LINK = . 
      008D49 03                    2432         .byte      3
      008D4A 53 54 52              2433         .ascii     "STR"
      008D4D                       2434 STR:
      008D4D CD 85 63         [ 4] 2435         CALL     DUPP
      008D50 CD 85 2C         [ 4] 2436         CALL     TOR
      008D53 CD 87 F1         [ 4] 2437         CALL     ABSS
      008D56 CD 8C D0         [ 4] 2438         CALL     BDIGS
      008D59 CD 8D 0A         [ 4] 2439         CALL     DIGS
      008D5C CD 85 0D         [ 4] 2440         CALL     RFROM
      008D5F CD 8D 1F         [ 4] 2441         CALL     SIGN
      008D62 CC 8D 35         [ 2] 2442         JP     EDIGS
                                   2443 
                                   2444 ;       HEX     ( -- )
                                   2445 ;       Use radix 16 as base for
                                   2446 ;       numeric conversions.
      008D65 8D 49                 2447         .word      LINK
                           000CE7  2448 LINK = . 
      008D67 03                    2449         .byte      3
      008D68 48 45 58              2450         .ascii     "HEX"
      008D6B                       2451 HEX:
      008D6B CD 84 34         [ 4] 2452         CALL     DOLIT
      008D6E 00 10                 2453         .word      16
      008D70 CD 86 20         [ 4] 2454         CALL     BASE
      008D73 CC 84 A5         [ 2] 2455         JP     STORE
                                   2456 
                                   2457 ;       DECIMAL ( -- )
                                   2458 ;       Use radix 10 as base
                                   2459 ;       for numeric conversions.
      008D76 8D 67                 2460         .word      LINK
                           000CF8  2461 LINK = . 
      008D78 07                    2462         .byte      7
      008D79 44 45 43 49 4D 41 4C  2463         .ascii     "DECIMAL"
      008D80                       2464 DECIM:
      008D80 CD 84 34         [ 4] 2465         CALL     DOLIT
      008D83 00 0A                 2466         .word      10
      008D85 CD 86 20         [ 4] 2467         CALL     BASE
      008D88 CC 84 A5         [ 2] 2468         JP     STORE
                                   2469 
                                   2470 ;; Numeric input, single precision
                                   2471 
                                   2472 ;       DIGIT?  ( c base -- u t )
                                   2473 ;       Convert a character to its numeric
                                   2474 ;       value. A flag indicates success.
      008D8B 8D 78                 2475         .word      LINK
                           000D0D  2476 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      008D8D 06                    2477         .byte       6
      008D8E 44 49 47 49 54 3F     2478         .ascii     "DIGIT?"
      008D94                       2479 DIGTQ:
      008D94 CD 85 2C         [ 4] 2480         CALL     TOR
      008D97 CD 84 34         [ 4] 2481         CALL     DOLIT
      008D9A 00 30                 2482         .word     48	; "0"
      008D9C CD 87 D7         [ 4] 2483         CALL     SUBB
      008D9F CD 84 34         [ 4] 2484         CALL     DOLIT
      008DA2 00 09                 2485         .word      9
      008DA4 CD 85 8D         [ 4] 2486         CALL     OVER
      008DA7 CD 88 3C         [ 4] 2487         CALL     LESS
      008DAA CD 84 67         [ 4] 2488         CALL     QBRAN
      008DAD 8D C5                 2489         .word      DGTQ1
      008DAF CD 84 34         [ 4] 2490         CALL     DOLIT
      008DB2 00 07                 2491         .word      7
      008DB4 CD 87 D7         [ 4] 2492         CALL     SUBB
      008DB7 CD 85 63         [ 4] 2493         CALL     DUPP
      008DBA CD 84 34         [ 4] 2494         CALL     DOLIT
      008DBD 00 0A                 2495         .word      10
      008DBF CD 88 3C         [ 4] 2496         CALL     LESS
      008DC2 CD 85 C3         [ 4] 2497         CALL     ORR
      008DC5 CD 85 63         [ 4] 2498 DGTQ1:  CALL     DUPP
      008DC8 CD 85 0D         [ 4] 2499         CALL     RFROM
      008DCB CC 88 1E         [ 2] 2500         JP     ULESS
                                   2501 
                                   2502 ;       NUMBER? ( a -- n T | a F )
                                   2503 ;       Convert a number string to
                                   2504 ;       integer. Push a flag on tos.
      008DCE 8D 8D                 2505         .word      LINK
                           000D50  2506 LINK = . 
      008DD0 07                    2507         .byte      7
      008DD1 4E 55 4D 42 45 52 3F  2508         .ascii     "NUMBER?"
      008DD8                       2509 NUMBQ:
      008DD8 CD 86 20         [ 4] 2510         CALL     BASE
      008DDB CD 84 BC         [ 4] 2511         CALL     AT
      008DDE CD 85 2C         [ 4] 2512         CALL     TOR
      008DE1 CD 8A C4         [ 4] 2513         CALL     ZERO
      008DE4 CD 85 8D         [ 4] 2514         CALL     OVER
      008DE7 CD 8B 9B         [ 4] 2515         CALL     COUNT
      008DEA CD 85 8D         [ 4] 2516         CALL     OVER
      008DED CD 84 DA         [ 4] 2517         CALL     CAT
      008DF0 CD 84 34         [ 4] 2518         CALL     DOLIT
      008DF3 00 24                 2519         .word     36	; "0x"
      008DF5 CD 87 FF         [ 4] 2520         CALL     EQUAL
      008DF8 CD 84 67         [ 4] 2521         CALL     QBRAN
      008DFB 8E 0C                 2522         .word      NUMQ1
      008DFD CD 8D 6B         [ 4] 2523         CALL     HEX
      008E00 CD 85 73         [ 4] 2524         CALL     SWAPP
      008E03 CD 8A 58         [ 4] 2525         CALL     ONEP
      008E06 CD 85 73         [ 4] 2526         CALL     SWAPP
      008E09 CD 8A 65         [ 4] 2527         CALL     ONEM
      008E0C CD 85 8D         [ 4] 2528 NUMQ1:  CALL     OVER
      008E0F CD 84 DA         [ 4] 2529         CALL     CAT
      008E12 CD 84 34         [ 4] 2530         CALL     DOLIT
      008E15 00 2D                 2531         .word     45	; "-"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



      008E17 CD 87 FF         [ 4] 2532         CALL     EQUAL
      008E1A CD 85 2C         [ 4] 2533         CALL     TOR
      008E1D CD 85 73         [ 4] 2534         CALL     SWAPP
      008E20 CD 85 20         [ 4] 2535         CALL     RAT
      008E23 CD 87 D7         [ 4] 2536         CALL     SUBB
      008E26 CD 85 73         [ 4] 2537         CALL     SWAPP
      008E29 CD 85 20         [ 4] 2538         CALL     RAT
      008E2C CD 87 5E         [ 4] 2539         CALL     PLUS
      008E2F CD 87 0D         [ 4] 2540         CALL     QDUP
      008E32 CD 84 67         [ 4] 2541         CALL     QBRAN
      008E35 8E 96                 2542         .word      NUMQ6
      008E37 CD 8A 65         [ 4] 2543         CALL     ONEM
      008E3A CD 85 2C         [ 4] 2544         CALL     TOR
      008E3D CD 85 63         [ 4] 2545 NUMQ2:  CALL     DUPP
      008E40 CD 85 2C         [ 4] 2546         CALL     TOR
      008E43 CD 84 DA         [ 4] 2547         CALL     CAT
      008E46 CD 86 20         [ 4] 2548         CALL     BASE
      008E49 CD 84 BC         [ 4] 2549         CALL     AT
      008E4C CD 8D 94         [ 4] 2550         CALL     DIGTQ
      008E4F CD 84 67         [ 4] 2551         CALL     QBRAN
      008E52 8E 84                 2552         .word      NUMQ4
      008E54 CD 85 73         [ 4] 2553         CALL     SWAPP
      008E57 CD 86 20         [ 4] 2554         CALL     BASE
      008E5A CD 84 BC         [ 4] 2555         CALL     AT
      008E5D CD 89 D7         [ 4] 2556         CALL     STAR
      008E60 CD 87 5E         [ 4] 2557         CALL     PLUS
      008E63 CD 85 0D         [ 4] 2558         CALL     RFROM
      008E66 CD 8A 58         [ 4] 2559         CALL     ONEP
      008E69 CD 84 48         [ 4] 2560         CALL     DONXT
      008E6C 8E 3D                 2561         .word      NUMQ2
      008E6E CD 85 20         [ 4] 2562         CALL     RAT
      008E71 CD 85 73         [ 4] 2563         CALL     SWAPP
      008E74 CD 85 59         [ 4] 2564         CALL     DROP
      008E77 CD 84 67         [ 4] 2565         CALL     QBRAN
      008E7A 8E 7F                 2566         .word      NUMQ3
      008E7C CD 87 89         [ 4] 2567         CALL     NEGAT
      008E7F CD 85 73         [ 4] 2568 NUMQ3:  CALL     SWAPP
      008E82 20 0F            [ 2] 2569         JRA     NUMQ5
      008E84 CD 85 0D         [ 4] 2570 NUMQ4:  CALL     RFROM
      008E87 CD 85 0D         [ 4] 2571         CALL     RFROM
      008E8A CD 87 3E         [ 4] 2572         CALL     DDROP
      008E8D CD 87 3E         [ 4] 2573         CALL     DDROP
      008E90 CD 8A C4         [ 4] 2574         CALL     ZERO
      008E93 CD 85 63         [ 4] 2575 NUMQ5:  CALL     DUPP
      008E96 CD 85 0D         [ 4] 2576 NUMQ6:  CALL     RFROM
      008E99 CD 87 3E         [ 4] 2577         CALL     DDROP
      008E9C CD 85 0D         [ 4] 2578         CALL     RFROM
      008E9F CD 86 20         [ 4] 2579         CALL     BASE
      008EA2 CC 84 A5         [ 2] 2580         JP     STORE
                                   2581 
                                   2582 ;; Basic I/O
                                   2583 
                                   2584 ;       KEY     ( -- c )
                                   2585 ;       Wait for and return an
                                   2586 ;       input character.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      008EA5 8D D0                 2587         .word      LINK
                           000E27  2588 LINK = . 
      008EA7 03                    2589         .byte      3
      008EA8 4B 45 59              2590         .ascii     "KEY"
      008EAB                       2591 KEY:
      008EAB 72 0B 52 30 FB   [ 2] 2592         btjf UART1_SR,#UART_SR_RXNE,. 
      008EB0 C6 52 31         [ 1] 2593         ld a,UART1_DR 
      008EB3 1D 00 02         [ 2] 2594         subw x,#CELLL 
      008EB6 E7 01            [ 1] 2595         ld (1,x),a 
      008EB8 7F               [ 1] 2596         clr (x)
      008EB9 81               [ 4] 2597         ret 
                                   2598 
                           000001  2599 WANT_SEE=1
                           000001  2600 .if WANT_SEE 
                                   2601 ;       NUF?    ( -- t )
                                   2602 ;       Return false if no input,
                                   2603 ;       else pause and if CR return true.
      008EBA 8E A7                 2604         .word      LINK
                           000E3C  2605 LINK = . 
      008EBC 04                    2606         .byte      4
      008EBD 4E 55 46 3F           2607         .ascii     "NUF?"
      008EC1                       2608 NUFQ:
      008EC1 CD 84 00         [ 4] 2609         CALL     QKEY
      008EC4 CD 85 63         [ 4] 2610         CALL     DUPP
      008EC7 CD 84 67         [ 4] 2611         CALL     QBRAN
      008ECA 8E DA                 2612         .word    NUFQ1
      008ECC CD 87 3E         [ 4] 2613         CALL     DDROP
      008ECF CD 8E AB         [ 4] 2614         CALL     KEY
      008ED2 CD 84 34         [ 4] 2615         CALL     DOLIT
      008ED5 00 0D                 2616         .word      CRR
      008ED7 CC 87 FF         [ 2] 2617         JP     EQUAL
      008EDA 81               [ 4] 2618 NUFQ1:  RET
                                   2619 .endif ; WANT_SEE
                                   2620 
                                   2621 ;       SPACE   ( -- )
                                   2622 ;       Send  blank character to
                                   2623 ;       output device.
      008EDB 8E BC                 2624         .word      LINK
                           000E5D  2625 LINK = . 
      008EDD 05                    2626         .byte      5
      008EDE 53 50 41 43 45        2627         .ascii     "SPACE"
      008EE3                       2628 SPACE:
      008EE3 CD 8A B7         [ 4] 2629         CALL     BLANK
      008EE6 CC 84 1E         [ 2] 2630         JP     EMIT
                                   2631 
                                   2632 ;       SPACES  ( +n -- )
                                   2633 ;       Send n spaces to output device.
      008EE9 8E DD                 2634         .word      LINK
                           000E6B  2635 LINK = . 
      008EEB 06                    2636         .byte      6
      008EEC 53 50 41 43 45 53     2637         .ascii     "SPACES"
      008EF2                       2638 SPACS:
      008EF2 CD 8A C4         [ 4] 2639         CALL     ZERO
      008EF5 CD 88 5C         [ 4] 2640         CALL     MAX
      008EF8 CD 85 2C         [ 4] 2641         CALL     TOR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



      008EFB 20 03            [ 2] 2642         JRA      CHAR2
      008EFD CD 8E E3         [ 4] 2643 CHAR1:  CALL     SPACE
      008F00 CD 84 48         [ 4] 2644 CHAR2:  CALL     DONXT
      008F03 8E FD                 2645         .word    CHAR1
      008F05 81               [ 4] 2646         RET
                                   2647 
                                   2648 ;       TYPE    ( b u -- )
                                   2649 ;       Output u characters from b.
      008F06 8E EB                 2650         .word      LINK
                           000E88  2651 LINK = . 
      008F08 04                    2652         .byte      4
      008F09 54 59 50 45           2653         .ascii     "TYPE"
      008F0D                       2654 TYPES:
      008F0D CD 85 2C         [ 4] 2655         CALL     TOR
      008F10 20 0C            [ 2] 2656         JRA     TYPE2
      008F12 CD 85 63         [ 4] 2657 TYPE1:  CALL     DUPP
      008F15 CD 84 DA         [ 4] 2658         CALL     CAT
      008F18 CD 84 1E         [ 4] 2659         CALL     EMIT
      008F1B CD 8A 58         [ 4] 2660         CALL     ONEP
      008F1E CD 84 48         [ 4] 2661 TYPE2:  CALL     DONXT
      008F21 8F 12                 2662         .word      TYPE1
      008F23 CC 85 59         [ 2] 2663         JP     DROP
                                   2664 
                                   2665 ;       CR      ( -- )
                                   2666 ;       Output a carriage return
                                   2667 ;       and a line feed.
      008F26 8F 08                 2668         .word      LINK
                           000EA8  2669 LINK = . 
      008F28 02                    2670         .byte      2
      008F29 43 52                 2671         .ascii     "CR"
      008F2B                       2672 CR:
      008F2B CD 84 34         [ 4] 2673         CALL     DOLIT
      008F2E 00 0D                 2674         .word      CRR
      008F30 CD 84 1E         [ 4] 2675         CALL     EMIT
      008F33 CD 84 34         [ 4] 2676         CALL     DOLIT
      008F36 00 0A                 2677         .word      LF
      008F38 CC 84 1E         [ 2] 2678         JP     EMIT
                                   2679 
                                   2680 ;       do$     ( -- a )
                                   2681 ;       Return  address of a compiled
                                   2682 ;       string.
      008F3B 8F 28                 2683         .word      LINK
                           000EBD  2684 LINK = . 
      008F3D 43                    2685 	.byte      COMPO+3
      008F3E 44 4F 24              2686         .ascii     "DO$"
      008F41                       2687 DOSTR:
      008F41 CD 85 0D         [ 4] 2688         CALL     RFROM
      008F44 CD 85 20         [ 4] 2689         CALL     RAT
      008F47 CD 85 0D         [ 4] 2690         CALL     RFROM
      008F4A CD 8B 9B         [ 4] 2691         CALL     COUNT
      008F4D CD 87 5E         [ 4] 2692         CALL     PLUS
      008F50 CD 85 2C         [ 4] 2693         CALL     TOR
      008F53 CD 85 73         [ 4] 2694         CALL     SWAPP
      008F56 CD 85 2C         [ 4] 2695         CALL     TOR
      008F59 81               [ 4] 2696         RET
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



                                   2697 
                                   2698 ;       $"|     ( -- a )
                                   2699 ;       Run time routine compiled by $".
                                   2700 ;       Return address of a compiled string.
      008F5A 8F 3D                 2701         .word      LINK
                           000EDC  2702 LINK = . 
      008F5C 43                    2703 	.byte      COMPO+3
      008F5D 24 22 7C              2704         .byte     '$','"','|'
      008F60                       2705 STRQP:
      008F60 CD 8F 41         [ 4] 2706         CALL     DOSTR
      008F63 81               [ 4] 2707         RET
                                   2708 
                                   2709 ;       ."|     ( -- )
                                   2710 ;       Run time routine of ." .
                                   2711 ;       Output a compiled string.
      008F64 8F 5C                 2712         .word      LINK
                           000EE6  2713 LINK = . 
      008F66 43                    2714 	.byte      COMPO+3
      008F67 2E 22 7C              2715         .byte     '.','"','|'
      008F6A                       2716 DOTQP:
      008F6A CD 8F 41         [ 4] 2717         CALL     DOSTR
      008F6D CD 8B 9B         [ 4] 2718         CALL     COUNT
      008F70 CC 8F 0D         [ 2] 2719         JP     TYPES
                                   2720 
                                   2721 ;       .R      ( n +n -- )
                                   2722 ;       Display an integer in a field
                                   2723 ;       of n columns, right justified.
      008F73 8F 66                 2724         .word      LINK
                           000EF5  2725 LINK = . 
      008F75 02                    2726         .byte      2
      008F76 2E 52                 2727         .ascii     ".R"
      008F78                       2728 DOTR:
      008F78 CD 85 2C         [ 4] 2729         CALL     TOR
      008F7B CD 8D 4D         [ 4] 2730         CALL     STR
      008F7E CD 85 0D         [ 4] 2731         CALL     RFROM
      008F81 CD 85 8D         [ 4] 2732         CALL     OVER
      008F84 CD 87 D7         [ 4] 2733         CALL     SUBB
      008F87 CD 8E F2         [ 4] 2734         CALL     SPACS
      008F8A CC 8F 0D         [ 2] 2735         JP     TYPES
                                   2736 
                                   2737 ;       U.R     ( u +n -- )
                                   2738 ;       Display an unsigned integer
                                   2739 ;       in n column, right justified.
      008F8D 8F 75                 2740         .word      LINK
                           000F0F  2741 LINK = . 
      008F8F 03                    2742         .byte      3
      008F90 55 2E 52              2743         .ascii     "U.R"
      008F93                       2744 UDOTR:
      008F93 CD 85 2C         [ 4] 2745         CALL     TOR
      008F96 CD 8C D0         [ 4] 2746         CALL     BDIGS
      008F99 CD 8D 0A         [ 4] 2747         CALL     DIGS
      008F9C CD 8D 35         [ 4] 2748         CALL     EDIGS
      008F9F CD 85 0D         [ 4] 2749         CALL     RFROM
      008FA2 CD 85 8D         [ 4] 2750         CALL     OVER
      008FA5 CD 87 D7         [ 4] 2751         CALL     SUBB
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



      008FA8 CD 8E F2         [ 4] 2752         CALL     SPACS
      008FAB CC 8F 0D         [ 2] 2753         JP     TYPES
                                   2754 
                                   2755 ;       U.      ( u -- )
                                   2756 ;       Display an unsigned integer
                                   2757 ;       in free format.
      008FAE 8F 8F                 2758         .word      LINK
                           000F30  2759 LINK = . 
      008FB0 02                    2760         .byte      2
      008FB1 55 2E                 2761         .ascii     "U."
      008FB3                       2762 UDOT:
      008FB3 CD 8C D0         [ 4] 2763         CALL     BDIGS
      008FB6 CD 8D 0A         [ 4] 2764         CALL     DIGS
      008FB9 CD 8D 35         [ 4] 2765         CALL     EDIGS
      008FBC CD 8E E3         [ 4] 2766         CALL     SPACE
      008FBF CC 8F 0D         [ 2] 2767         JP     TYPES
                                   2768 
                                   2769 ;       .       ( w -- )
                                   2770 ;       Display an integer in free
                                   2771 ;       format, preceeded by a space.
      008FC2 8F B0                 2772         .word      LINK
                           000F44  2773 LINK = . 
      008FC4 01                    2774         .byte      1
      008FC5 2E                    2775         .ascii     "."
      008FC6                       2776 DOT:
      008FC6 CD 86 20         [ 4] 2777         CALL     BASE
      008FC9 CD 84 BC         [ 4] 2778         CALL     AT
      008FCC CD 84 34         [ 4] 2779         CALL     DOLIT
      008FCF 00 0A                 2780         .word      10
      008FD1 CD 85 D8         [ 4] 2781         CALL     XORR    ;?decimal
      008FD4 CD 84 67         [ 4] 2782         CALL     QBRAN
      008FD7 8F DC                 2783         .word      DOT1
      008FD9 CC 8F B3         [ 2] 2784         JP     UDOT
      008FDC CD 8D 4D         [ 4] 2785 DOT1:   CALL     STR
      008FDF CD 8E E3         [ 4] 2786         CALL     SPACE
      008FE2 CC 8F 0D         [ 2] 2787         JP     TYPES
                                   2788 
                                   2789 ;       ?       ( a -- )
                                   2790 ;       Display contents in memory cell.
      008FE5 8F C4                 2791         .word      LINK
                                   2792         
                           000F67  2793 LINK = . 
      008FE7 01                    2794         .byte      1
      008FE8 3F                    2795         .ascii     "?"
      008FE9                       2796 QUEST:
      008FE9 CD 84 BC         [ 4] 2797         CALL     AT
      008FEC CC 8F C6         [ 2] 2798         JP     DOT
                                   2799 
                                   2800 ;; Parsing
                                   2801 
                                   2802 ;       parse   ( b u c -- b u delta ; <string> )
                                   2803 ;       Scan string delimited by c.
                                   2804 ;       Return found string and its offset.
      008FEF 8F E7                 2805         .word      LINK
                           000F71  2806 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



      008FF1 05                    2807         .byte      5
      008FF2 70 61 72 73 65        2808         .ascii     "parse"
      008FF7                       2809 PARS:
      008FF7 CD 86 2F         [ 4] 2810         CALL     TEMP
      008FFA CD 84 A5         [ 4] 2811         CALL     STORE
      008FFD CD 85 8D         [ 4] 2812         CALL     OVER
      009000 CD 85 2C         [ 4] 2813         CALL     TOR
      009003 CD 85 63         [ 4] 2814         CALL     DUPP
      009006 CD 84 67         [ 4] 2815         CALL     QBRAN
      009009 90 AF                 2816         .word    PARS8
      00900B CD 8A 65         [ 4] 2817         CALL     ONEM
      00900E CD 86 2F         [ 4] 2818         CALL     TEMP
      009011 CD 84 BC         [ 4] 2819         CALL     AT
      009014 CD 8A B7         [ 4] 2820         CALL     BLANK
      009017 CD 87 FF         [ 4] 2821         CALL     EQUAL
      00901A CD 84 67         [ 4] 2822         CALL     QBRAN
      00901D 90 50                 2823         .word      PARS3
      00901F CD 85 2C         [ 4] 2824         CALL     TOR
      009022 CD 8A B7         [ 4] 2825 PARS1:  CALL     BLANK
      009025 CD 85 8D         [ 4] 2826         CALL     OVER
      009028 CD 84 DA         [ 4] 2827         CALL     CAT     ;skip leading blanks ONLY
      00902B CD 87 D7         [ 4] 2828         CALL     SUBB
      00902E CD 85 9C         [ 4] 2829         CALL     ZLESS
      009031 CD 87 78         [ 4] 2830         CALL     INVER
      009034 CD 84 67         [ 4] 2831         CALL     QBRAN
      009037 90 4D                 2832         .word      PARS2
      009039 CD 8A 58         [ 4] 2833         CALL     ONEP
      00903C CD 84 48         [ 4] 2834         CALL     DONXT
      00903F 90 22                 2835         .word      PARS1
      009041 CD 85 0D         [ 4] 2836         CALL     RFROM
      009044 CD 85 59         [ 4] 2837         CALL     DROP
      009047 CD 8A C4         [ 4] 2838         CALL     ZERO
      00904A CC 85 63         [ 2] 2839         JP     DUPP
      00904D CD 85 0D         [ 4] 2840 PARS2:  CALL     RFROM
      009050 CD 85 8D         [ 4] 2841 PARS3:  CALL     OVER
      009053 CD 85 73         [ 4] 2842         CALL     SWAPP
      009056 CD 85 2C         [ 4] 2843         CALL     TOR
      009059 CD 86 2F         [ 4] 2844 PARS4:  CALL     TEMP
      00905C CD 84 BC         [ 4] 2845         CALL     AT
      00905F CD 85 8D         [ 4] 2846         CALL     OVER
      009062 CD 84 DA         [ 4] 2847         CALL     CAT
      009065 CD 87 D7         [ 4] 2848         CALL     SUBB    ;scan for delimiter
      009068 CD 86 2F         [ 4] 2849         CALL     TEMP
      00906B CD 84 BC         [ 4] 2850         CALL     AT
      00906E CD 8A B7         [ 4] 2851         CALL     BLANK
      009071 CD 87 FF         [ 4] 2852         CALL     EQUAL
      009074 CD 84 67         [ 4] 2853         CALL     QBRAN
      009077 90 7C                 2854         .word      PARS5
      009079 CD 85 9C         [ 4] 2855         CALL     ZLESS
      00907C CD 84 67         [ 4] 2856 PARS5:  CALL     QBRAN
      00907F 90 91                 2857         .word      PARS6
      009081 CD 8A 58         [ 4] 2858         CALL     ONEP
      009084 CD 84 48         [ 4] 2859         CALL     DONXT
      009087 90 59                 2860         .word      PARS4
      009089 CD 85 63         [ 4] 2861         CALL     DUPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



      00908C CD 85 2C         [ 4] 2862         CALL     TOR
      00908F 20 0F            [ 2] 2863         JRA     PARS7
      009091 CD 85 0D         [ 4] 2864 PARS6:  CALL     RFROM
      009094 CD 85 59         [ 4] 2865         CALL     DROP
      009097 CD 85 63         [ 4] 2866         CALL     DUPP
      00909A CD 8A 58         [ 4] 2867         CALL     ONEP
      00909D CD 85 2C         [ 4] 2868         CALL     TOR
      0090A0 CD 85 8D         [ 4] 2869 PARS7:  CALL     OVER
      0090A3 CD 87 D7         [ 4] 2870         CALL     SUBB
      0090A6 CD 85 0D         [ 4] 2871         CALL     RFROM
      0090A9 CD 85 0D         [ 4] 2872         CALL     RFROM
      0090AC CC 87 D7         [ 2] 2873         JP     SUBB
      0090AF CD 85 8D         [ 4] 2874 PARS8:  CALL     OVER
      0090B2 CD 85 0D         [ 4] 2875         CALL     RFROM
      0090B5 CC 87 D7         [ 2] 2876         JP     SUBB
                                   2877 
                                   2878 ;       PARSE   ( c -- b u ; <string> )
                                   2879 ;       Scan input stream and return
                                   2880 ;       counted string delimited by c.
      0090B8 8F F1                 2881         .word      LINK
                           00103A  2882 LINK = . 
      0090BA 05                    2883         .byte      5
      0090BB 50 41 52 53 45        2884         .ascii     "PARSE"
      0090C0                       2885 PARSE:
      0090C0 CD 85 2C         [ 4] 2886         CALL     TOR
      0090C3 CD 8B D4         [ 4] 2887         CALL     TIB
      0090C6 CD 86 3E         [ 4] 2888         CALL     INN
      0090C9 CD 84 BC         [ 4] 2889         CALL     AT
      0090CC CD 87 5E         [ 4] 2890         CALL     PLUS    ;current input buffer pointer
      0090CF CD 86 4E         [ 4] 2891         CALL     NTIB
      0090D2 CD 84 BC         [ 4] 2892         CALL     AT
      0090D5 CD 86 3E         [ 4] 2893         CALL     INN
      0090D8 CD 84 BC         [ 4] 2894         CALL     AT
      0090DB CD 87 D7         [ 4] 2895         CALL     SUBB    ;remaining count
      0090DE CD 85 0D         [ 4] 2896         CALL     RFROM
      0090E1 CD 8F F7         [ 4] 2897         CALL     PARS
      0090E4 CD 86 3E         [ 4] 2898         CALL     INN
      0090E7 CC 8B 34         [ 2] 2899         JP     PSTOR
                                   2900 
                                   2901 ;       .(      ( -- )
                                   2902 ;       Output following string up to next ) .
      0090EA 90 BA                 2903         .word      LINK
                           00106C  2904 LINK = . 
      0090EC 82                    2905 	.byte      IMEDD+2
      0090ED 2E 28                 2906         .ascii     ".("
      0090EF                       2907 DOTPR:
      0090EF CD 84 34         [ 4] 2908         CALL     DOLIT
      0090F2 00 29                 2909         .word     41	; ")"
      0090F4 CD 90 C0         [ 4] 2910         CALL     PARSE
      0090F7 CC 8F 0D         [ 2] 2911         JP     TYPES
                                   2912 
                                   2913 ;       (       ( -- )
                                   2914 ;       Ignore following string up to next ).
                                   2915 ;       A comment.
      0090FA 90 EC                 2916         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



                           00107C  2917 LINK = . 
      0090FC 81                    2918 	.byte      IMEDD+1
      0090FD 28                    2919         .ascii     "("
      0090FE                       2920 PAREN:
      0090FE CD 84 34         [ 4] 2921         CALL     DOLIT
      009101 00 29                 2922         .word     41	; ")"
      009103 CD 90 C0         [ 4] 2923         CALL     PARSE
      009106 CC 87 3E         [ 2] 2924         JP     DDROP
                                   2925 
                                   2926 ;       \       ( -- )
                                   2927 ;       Ignore following text till
                                   2928 ;       end of line.
      009109 90 FC                 2929         .word      LINK
                           00108B  2930 LINK = . 
      00910B 81                    2931 	.byte      IMEDD+1
      00910C 5C                    2932         .ascii     "\"
      00910D                       2933 BKSLA:
      00910D 90 AE 00 0C      [ 2] 2934         ldw y,#UCTIB ; #TIB  
      009111 90 FE            [ 2] 2935         ldw y,(y)
      009113 90 89            [ 2] 2936         pushw y ; count in TIB 
      009115 90 AE 00 0A      [ 2] 2937         ldw y,#UINN ; >IN 
      009119 90 BF 24         [ 2] 2938         ldw YTEMP,y
      00911C 90 85            [ 2] 2939         popw y 
      00911E 91 CF 24         [ 5] 2940         ldw [YTEMP],y
      009121 81               [ 4] 2941         ret 
                                   2942 
                                   2943 ;       WORD    ( c -- a ; <string> )
                                   2944 ;       Parse a word from input stream
                                   2945 ;       and copy it to code dictionary.
      009122 91 0B                 2946         .word      LINK
                           0010A4  2947 LINK = . 
      009124 04                    2948         .byte      4
      009125 57 4F 52 44           2949         .ascii     "WORD"
      009129                       2950 WORDD:
      009129 CD 90 C0         [ 4] 2951         CALL     PARSE
      00912C CD 8B B2         [ 4] 2952         CALL     HERE
      00912F CD 8A 2D         [ 4] 2953         CALL     CELLP
      009132 CC 8C 73         [ 2] 2954         JP     PACKS
                                   2955 
                                   2956 ;       TOKEN   ( -- a ; <string> )
                                   2957 ;       Parse a word from input stream
                                   2958 ;       and copy it to name dictionary.
      009135 91 24                 2959         .word      LINK
                           0010B7  2960 LINK = . 
      009137 05                    2961         .byte      5
      009138 54 4F 4B 45 4E        2962         .ascii     "TOKEN"
      00913D                       2963 TOKEN:
      00913D CD 8A B7         [ 4] 2964         CALL     BLANK
      009140 CC 91 29         [ 2] 2965         JP     WORDD
                                   2966 
                                   2967 ;; Dictionary search
                                   2968 
                                   2969 ;       NAME>   ( na -- ca )
                                   2970 ;       Return a code address given
                                   2971 ;       a name address.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      009143 91 37                 2972         .word      LINK
                           0010C5  2973 LINK = . 
      009145 05                    2974         .byte      5
      009146 4E 41 4D 45 3E        2975         .ascii     "NAME>"
      00914B                       2976 NAMET:
      00914B CD 8B 9B         [ 4] 2977         CALL     COUNT
      00914E CD 84 34         [ 4] 2978         CALL     DOLIT
      009151 00 1F                 2979         .word      31
      009153 CD 85 AF         [ 4] 2980         CALL     ANDD
      009156 CC 87 5E         [ 2] 2981         JP     PLUS
                                   2982 
                                   2983 ;       SAME?   ( a a u -- a a f \ -0+ )
                                   2984 ;       Compare u cells in two
                                   2985 ;       strings. Return 0 if identical.
      009159 91 45                 2986         .word      LINK
                           0010DB  2987 LINK = . 
      00915B 05                    2988         .byte       5
      00915C 53 41 4D 45 3F        2989         .ascii     "SAME?"
      009161                       2990 SAMEQ:
      009161 CD 8A 65         [ 4] 2991         CALL     ONEM
      009164 CD 85 2C         [ 4] 2992         CALL     TOR
      009167 20 29            [ 2] 2993         JRA     SAME2
      009169 CD 85 8D         [ 4] 2994 SAME1:  CALL     OVER
      00916C CD 85 20         [ 4] 2995         CALL     RAT
      00916F CD 87 5E         [ 4] 2996         CALL     PLUS
      009172 CD 84 DA         [ 4] 2997         CALL     CAT
      009175 CD 85 8D         [ 4] 2998         CALL     OVER
      009178 CD 85 20         [ 4] 2999         CALL     RAT
      00917B CD 87 5E         [ 4] 3000         CALL     PLUS
      00917E CD 84 DA         [ 4] 3001         CALL     CAT
      009181 CD 87 D7         [ 4] 3002         CALL     SUBB
      009184 CD 87 0D         [ 4] 3003         CALL     QDUP
      009187 CD 84 67         [ 4] 3004         CALL     QBRAN
      00918A 91 92                 3005         .word      SAME2
      00918C CD 85 0D         [ 4] 3006         CALL     RFROM
      00918F CC 85 59         [ 2] 3007         JP     DROP
      009192 CD 84 48         [ 4] 3008 SAME2:  CALL     DONXT
      009195 91 69                 3009         .word      SAME1
      009197 CC 8A C4         [ 2] 3010         JP     ZERO
                                   3011 
                                   3012 ;       find    ( a va -- ca na | a F )
                                   3013 ;       Search vocabulary for string.
                                   3014 ;       Return ca and na if succeeded.
      00919A 91 5B                 3015         .word      LINK
                           00111C  3016 LINK = . 
      00919C 04                    3017         .byte      4
      00919D 46 49 4E 44           3018         .ascii     "FIND"
      0091A1                       3019 FIND:
      0091A1 CD 85 73         [ 4] 3020         CALL     SWAPP
      0091A4 CD 85 63         [ 4] 3021         CALL     DUPP
      0091A7 CD 84 DA         [ 4] 3022         CALL     CAT
      0091AA CD 86 2F         [ 4] 3023         CALL     TEMP
      0091AD CD 84 A5         [ 4] 3024         CALL     STORE
      0091B0 CD 85 63         [ 4] 3025         CALL     DUPP
      0091B3 CD 84 BC         [ 4] 3026         CALL     AT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      0091B6 CD 85 2C         [ 4] 3027         CALL     TOR
      0091B9 CD 8A 2D         [ 4] 3028         CALL     CELLP
      0091BC CD 85 73         [ 4] 3029         CALL     SWAPP
      0091BF CD 84 BC         [ 4] 3030 FIND1:  CALL     AT
      0091C2 CD 85 63         [ 4] 3031         CALL     DUPP
      0091C5 CD 84 67         [ 4] 3032         CALL     QBRAN
      0091C8 91 FE                 3033         .word      FIND6
      0091CA CD 85 63         [ 4] 3034         CALL     DUPP
      0091CD CD 84 BC         [ 4] 3035         CALL     AT
      0091D0 CD 84 34         [ 4] 3036         CALL     DOLIT
      0091D3 1F 7F                 3037         .word      MASKK
      0091D5 CD 85 AF         [ 4] 3038         CALL     ANDD
      0091D8 CD 85 20         [ 4] 3039         CALL     RAT
      0091DB CD 85 D8         [ 4] 3040         CALL     XORR
      0091DE CD 84 67         [ 4] 3041         CALL     QBRAN
      0091E1 91 ED                 3042         .word      FIND2
      0091E3 CD 8A 2D         [ 4] 3043         CALL     CELLP
      0091E6 CD 84 34         [ 4] 3044         CALL     DOLIT
      0091E9 FF FF                 3045         .word     0xFFFF
      0091EB 20 0C            [ 2] 3046         JRA     FIND3
      0091ED CD 8A 2D         [ 4] 3047 FIND2:  CALL     CELLP
      0091F0 CD 86 2F         [ 4] 3048         CALL     TEMP
      0091F3 CD 84 BC         [ 4] 3049         CALL     AT
      0091F6 CD 91 61         [ 4] 3050         CALL     SAMEQ
      0091F9 CD 84 7E         [ 4] 3051 FIND3:  CALL     BRAN
      0091FC 92 0D                 3052         .word      FIND4
      0091FE CD 85 0D         [ 4] 3053 FIND6:  CALL     RFROM
      009201 CD 85 59         [ 4] 3054         CALL     DROP
      009204 CD 85 73         [ 4] 3055         CALL     SWAPP
      009207 CD 8A 3C         [ 4] 3056         CALL     CELLM
      00920A CC 85 73         [ 2] 3057         JP     SWAPP
      00920D CD 84 67         [ 4] 3058 FIND4:  CALL     QBRAN
      009210 92 1A                 3059         .word      FIND5
      009212 CD 8A 3C         [ 4] 3060         CALL     CELLM
      009215 CD 8A 3C         [ 4] 3061         CALL     CELLM
      009218 20 A5            [ 2] 3062         JRA     FIND1
      00921A CD 85 0D         [ 4] 3063 FIND5:  CALL     RFROM
      00921D CD 85 59         [ 4] 3064         CALL     DROP
      009220 CD 85 73         [ 4] 3065         CALL     SWAPP
      009223 CD 85 59         [ 4] 3066         CALL     DROP
      009226 CD 8A 3C         [ 4] 3067         CALL     CELLM
      009229 CD 85 63         [ 4] 3068         CALL     DUPP
      00922C CD 91 4B         [ 4] 3069         CALL     NAMET
      00922F CC 85 73         [ 2] 3070         JP     SWAPP
                                   3071 
                                   3072 ;       NAME?   ( a -- ca na | a F )
                                   3073 ;       Search vocabularies for a string.
      009232 91 9C                 3074         .word      LINK
                           0011B4  3075 LINK = . 
      009234 05                    3076         .byte      5
      009235 4E 41 4D 45 3F        3077         .ascii     "NAME?"
      00923A                       3078 NAMEQ:
      00923A CD 86 A3         [ 4] 3079         CALL   CNTXT
      00923D CC 91 A1         [ 2] 3080         JP     FIND
                                   3081 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



                                   3082 ;; Terminal response
                                   3083 
                                   3084 ;       ^H      ( bot eot cur -- bot eot cur )
                                   3085 ;       Backup cursor by one character.
      009240 92 34                 3086         .word      LINK
                           0011C2  3087 LINK = . 
      009242 02                    3088         .byte      2
      009243 5E 48                 3089         .ascii     "^H"
      009245                       3090 BKSP:
      009245 CD 85 2C         [ 4] 3091         CALL     TOR
      009248 CD 85 8D         [ 4] 3092         CALL     OVER
      00924B CD 85 0D         [ 4] 3093         CALL     RFROM
      00924E CD 85 73         [ 4] 3094         CALL     SWAPP
      009251 CD 85 8D         [ 4] 3095         CALL     OVER
      009254 CD 85 D8         [ 4] 3096         CALL     XORR
      009257 CD 84 67         [ 4] 3097         CALL     QBRAN
      00925A 92 75                 3098         .word      BACK1
      00925C CD 84 34         [ 4] 3099         CALL     DOLIT
      00925F 00 08                 3100         .word      BKSPP
      009261 CD 84 1E         [ 4] 3101         CALL     EMIT
      009264 CD 8A 65         [ 4] 3102         CALL     ONEM
      009267 CD 8A B7         [ 4] 3103         CALL     BLANK
      00926A CD 84 1E         [ 4] 3104         CALL     EMIT
      00926D CD 84 34         [ 4] 3105         CALL     DOLIT
      009270 00 08                 3106         .word      BKSPP
      009272 CC 84 1E         [ 2] 3107         JP     EMIT
      009275 81               [ 4] 3108 BACK1:  RET
                                   3109 
                                   3110 ;       TAP    ( bot eot cur c -- bot eot cur )
                                   3111 ;       Accept and echo key stroke
                                   3112 ;       and bump cursor.
      009276 92 42                 3113         .word      LINK
                           0011F8  3114 LINK = . 
      009278 03                    3115         .byte      3
      009279 54 41 50              3116         .ascii     "TAP"
      00927C                       3117 TAP:
      00927C CD 85 63         [ 4] 3118         CALL     DUPP
      00927F CD 84 1E         [ 4] 3119         CALL     EMIT
      009282 CD 85 8D         [ 4] 3120         CALL     OVER
      009285 CD 84 C9         [ 4] 3121         CALL     CSTOR
      009288 CC 8A 58         [ 2] 3122         JP     ONEP
                                   3123 
                                   3124 ;       kTAP    ( bot eot cur c -- bot eot cur )
                                   3125 ;       Process a key stroke,
                                   3126 ;       CR or backspace.
      00928B 92 78                 3127         .word      LINK
                           00120D  3128 LINK = . 
      00928D 04                    3129         .byte      4
      00928E 4B 54 41 50           3130         .ascii     "KTAP"
      009292                       3131 KTAP:
      009292 CD 85 63         [ 4] 3132         CALL     DUPP
      009295 CD 84 34         [ 4] 3133         CALL     DOLIT
      009298 00 0D                 3134         .word      CRR
      00929A CD 85 D8         [ 4] 3135         CALL     XORR
      00929D CD 84 67         [ 4] 3136         CALL     QBRAN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      0092A0 92 B8                 3137         .word      KTAP2
      0092A2 CD 84 34         [ 4] 3138         CALL     DOLIT
      0092A5 00 08                 3139         .word      BKSPP
      0092A7 CD 85 D8         [ 4] 3140         CALL     XORR
      0092AA CD 84 67         [ 4] 3141         CALL     QBRAN
      0092AD 92 B5                 3142         .word      KTAP1
      0092AF CD 8A B7         [ 4] 3143         CALL     BLANK
      0092B2 CC 92 7C         [ 2] 3144         JP     TAP
      0092B5 CC 92 45         [ 2] 3145 KTAP1:  JP     BKSP
      0092B8 CD 85 59         [ 4] 3146 KTAP2:  CALL     DROP
      0092BB CD 85 73         [ 4] 3147         CALL     SWAPP
      0092BE CD 85 59         [ 4] 3148         CALL     DROP
      0092C1 CC 85 63         [ 2] 3149         JP     DUPP
                                   3150 
                                   3151 ;       accept  ( b u -- b u )
                                   3152 ;       Accept characters to input
                                   3153 ;       buffer. Return with actual count.
      0092C4 92 8D                 3154         .word      LINK
                           001246  3155 LINK = . 
      0092C6 06                    3156         .byte      6
      0092C7 41 43 43 45 50 54     3157         .ascii     "ACCEPT"
      0092CD                       3158 ACCEP:
      0092CD CD 85 8D         [ 4] 3159         CALL     OVER
      0092D0 CD 87 5E         [ 4] 3160         CALL     PLUS
      0092D3 CD 85 8D         [ 4] 3161         CALL     OVER
      0092D6 CD 87 49         [ 4] 3162 ACCP1:  CALL     DDUP
      0092D9 CD 85 D8         [ 4] 3163         CALL     XORR
      0092DC CD 84 67         [ 4] 3164         CALL     QBRAN
      0092DF 93 01                 3165         .word      ACCP4
      0092E1 CD 8E AB         [ 4] 3166         CALL     KEY
      0092E4 CD 85 63         [ 4] 3167         CALL     DUPP
      0092E7 CD 8A B7         [ 4] 3168         CALL     BLANK
      0092EA CD 84 34         [ 4] 3169         CALL     DOLIT
      0092ED 00 7F                 3170         .word      127
      0092EF CD 88 99         [ 4] 3171         CALL     WITHI
      0092F2 CD 84 67         [ 4] 3172         CALL     QBRAN
      0092F5 92 FC                 3173         .word      ACCP2
      0092F7 CD 92 7C         [ 4] 3174         CALL     TAP
      0092FA 20 03            [ 2] 3175         JRA     ACCP3
      0092FC CD 92 92         [ 4] 3176 ACCP2:  CALL     KTAP
      0092FF 20 D5            [ 2] 3177 ACCP3:  JRA     ACCP1
      009301 CD 85 59         [ 4] 3178 ACCP4:  CALL     DROP
      009304 CD 85 8D         [ 4] 3179         CALL     OVER
      009307 CC 87 D7         [ 2] 3180         JP     SUBB
                                   3181 
                                   3182 ;       QUERY   ( -- )
                                   3183 ;       Accept input stream to
                                   3184 ;       terminal input buffer.
      00930A 92 C6                 3185         .word      LINK
                                   3186         
                           00128C  3187 LINK = . 
      00930C 05                    3188         .byte      5
      00930D 51 55 45 52 59        3189         .ascii     "QUERY"
      009312                       3190 QUERY:
      009312 CD 8B D4         [ 4] 3191         CALL     TIB
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



      009315 CD 84 34         [ 4] 3192         CALL     DOLIT
      009318 00 50                 3193         .word      80
      00931A CD 92 CD         [ 4] 3194         CALL     ACCEP
      00931D CD 86 4E         [ 4] 3195         CALL     NTIB
      009320 CD 84 A5         [ 4] 3196         CALL     STORE
      009323 CD 85 59         [ 4] 3197         CALL     DROP
      009326 CD 8A C4         [ 4] 3198         CALL     ZERO
      009329 CD 86 3E         [ 4] 3199         CALL     INN
      00932C CC 84 A5         [ 2] 3200         JP     STORE
                                   3201 
                                   3202 ;       ABORT   ( -- )
                                   3203 ;       Reset data stack and
                                   3204 ;       jump to QUIT.
      00932F 93 0C                 3205         .word      LINK
                           0012B1  3206 LINK = . 
      009331 05                    3207         .byte      5
      009332 41 42 4F 52 54        3208         .ascii     "ABORT"
      009337                       3209 ABORT:
      009337 CD 94 2E         [ 4] 3210         CALL     PRESE
      00933A CC 94 4B         [ 2] 3211         JP     QUIT
                                   3212 
                                   3213 ;       abort"  ( f -- )
                                   3214 ;       Run time routine of ABORT".
                                   3215 ;       Abort with a message.
      00933D 93 31                 3216         .word      LINK
                           0012BF  3217 LINK = . 
      00933F 46                    3218 	.byte      COMPO+6
      009340 41 42 4F 52 54        3219         .ascii     "ABORT"
      009345 22                    3220         .byte      '"'
      009346                       3221 ABORQ:
      009346 CD 84 67         [ 4] 3222         CALL     QBRAN
      009349 93 65                 3223         .word      ABOR2   ;text flag
      00934B CD 8F 41         [ 4] 3224         CALL     DOSTR
      00934E CD 8E E3         [ 4] 3225 ABOR1:  CALL     SPACE
      009351 CD 8B 9B         [ 4] 3226         CALL     COUNT
      009354 CD 8F 0D         [ 4] 3227         CALL     TYPES
      009357 CD 84 34         [ 4] 3228         CALL     DOLIT
      00935A 00 3F                 3229         .word     63 ; "?"
      00935C CD 84 1E         [ 4] 3230         CALL     EMIT
      00935F CD 8F 2B         [ 4] 3231         CALL     CR
      009362 CC 93 37         [ 2] 3232         JP     ABORT   ;pass error string
      009365 CD 8F 41         [ 4] 3233 ABOR2:  CALL     DOSTR
      009368 CC 85 59         [ 2] 3234         JP     DROP
                                   3235 
                                   3236 ;; The text interpreter
                                   3237 
                                   3238 ;       $INTERPRET      ( a -- )
                                   3239 ;       Interpret a word. If failed,
                                   3240 ;       try to convert it to an integer.
      00936B 93 3F                 3241         .word      LINK
                           0012ED  3242 LINK = . 
      00936D 0A                    3243         .byte      10
      00936E 24 49 4E 54 45 52 50  3244         .ascii     "$INTERPRET"
             52 45 54
      009378                       3245 INTER:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      009378 CD 92 3A         [ 4] 3246         CALL     NAMEQ
      00937B CD 87 0D         [ 4] 3247         CALL     QDUP    ;?defined
      00937E CD 84 67         [ 4] 3248         CALL     QBRAN
      009381 93 A2                 3249         .word      INTE1
      009383 CD 84 BC         [ 4] 3250         CALL     AT
      009386 CD 84 34         [ 4] 3251         CALL     DOLIT
      009389 40 00                 3252 	.word       0x4000	; COMPO*256
      00938B CD 85 AF         [ 4] 3253         CALL     ANDD    ;?compile only lexicon bits
      00938E CD 93 46         [ 4] 3254         CALL     ABORQ
      009391 0D                    3255         .byte      13
      009392 20 63 6F 6D 70 69 6C  3256         .ascii     " compile only"
             65 20 6F 6E 6C 79
      00939F CC 84 8E         [ 2] 3257         JP     EXECU
      0093A2 CD 8D D8         [ 4] 3258 INTE1:  CALL     NUMBQ   ;convert a number
      0093A5 CD 84 67         [ 4] 3259         CALL     QBRAN
      0093A8 93 4E                 3260         .word    ABOR1
      0093AA 81               [ 4] 3261         RET
                                   3262 
                                   3263 ;       [       ( -- )
                                   3264 ;       Start  text interpreter.
      0093AB 93 6D                 3265         .word      LINK
                           00132D  3266 LINK = . 
      0093AD 81                    3267 	.byte      IMEDD+1
      0093AE 5B                    3268         .ascii     "["
      0093AF                       3269 LBRAC:
      0093AF CD 84 34         [ 4] 3270         CALL   DOLIT
      0093B2 93 78                 3271         .word  INTER
      0093B4 CD 86 81         [ 4] 3272         CALL   TEVAL
      0093B7 CC 84 A5         [ 2] 3273         JP     STORE
                                   3274 
                                   3275 ;       .OK     ( -- )
                                   3276 ;       Display 'ok' while interpreting.
      0093BA 93 AD                 3277         .word      LINK
                           00133C  3278 LINK = . 
      0093BC 03                    3279         .byte      3
      0093BD 2E 4F 4B              3280         .ascii     ".OK"
      0093C0                       3281 DOTOK:
      0093C0 CD 84 34         [ 4] 3282         CALL     DOLIT
      0093C3 93 78                 3283         .word      INTER
      0093C5 CD 86 81         [ 4] 3284         CALL     TEVAL
      0093C8 CD 84 BC         [ 4] 3285         CALL     AT
      0093CB CD 87 FF         [ 4] 3286         CALL     EQUAL
      0093CE CD 84 67         [ 4] 3287         CALL     QBRAN
      0093D1 93 DA                 3288         .word      DOTO1
      0093D3 CD 8F 6A         [ 4] 3289         CALL     DOTQP
      0093D6 03                    3290         .byte      3
      0093D7 20 6F 6B              3291         .ascii     " ok"
      0093DA CC 8F 2B         [ 2] 3292 DOTO1:  JP     CR
                                   3293 
                                   3294 ;       ?STACK  ( -- )
                                   3295 ;       Abort if stack underflows.
      0093DD 93 BC                 3296         .word      LINK
                           00135F  3297 LINK = . 
      0093DF 06                    3298         .byte      6
      0093E0 3F 53 54 41 43 4B     3299         .ascii     "?STACK"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      0093E6                       3300 QSTAC: 
      0093E6 CD 8B 06         [ 4] 3301         CALL     DEPTH
      0093E9 CD 85 9C         [ 4] 3302         CALL     ZLESS   ;check only for underflow
      0093EC CD 93 46         [ 4] 3303         CALL     ABORQ
      0093EF 0B                    3304         .byte      11
      0093F0 20 75 6E 64 65 72 66  3305         .ascii     " underflow "
             6C 6F 77 20
      0093FB 81               [ 4] 3306         RET
                                   3307 
                                   3308 ;       EVAL    ( -- )
                                   3309 ;       Interpret  input stream.
      0093FC 93 DF                 3310         .word      LINK
                           00137E  3311 LINK = . 
      0093FE 04                    3312         .byte      4
      0093FF 45 56 41 4C           3313         .ascii     "EVAL"
      009403                       3314 EVAL:
      009403 CD 91 3D         [ 4] 3315 EVAL1:  CALL     TOKEN
      009406 CD 85 63         [ 4] 3316         CALL     DUPP
      009409 CD 84 DA         [ 4] 3317         CALL     CAT     ;?input stream empty
      00940C CD 84 67         [ 4] 3318         CALL     QBRAN
      00940F 94 1F                 3319         .word    EVAL2
      009411 CD 86 81         [ 4] 3320         CALL     TEVAL
      009414 CD 8B E8         [ 4] 3321         CALL     ATEXE
      009417 CD 93 E6         [ 4] 3322         CALL     QSTAC   ;evaluate input, check stack
      00941A CD 84 7E         [ 4] 3323         CALL     BRAN
      00941D 94 03                 3324         .word    EVAL1
      00941F CD 85 59         [ 4] 3325 EVAL2:  CALL     DROP
      009422 CC 93 C0         [ 2] 3326         JP       DOTOK
                                   3327 
                                   3328 ;       PRESET  ( -- )
                                   3329 ;       Reset data stack pointer and
                                   3330 ;       terminal input buffer.
      009425 93 FE                 3331         .word      LINK
                           0013A7  3332 LINK = . 
      009427 06                    3333         .byte      6
      009428 50 52 45 53 45 54     3334         .ascii     "PRESET"
      00942E                       3335 PRESE:
      00942E CD 84 34         [ 4] 3336         CALL     DOLIT
      009431 16 80                 3337         .word      SPP
      009433 CD 85 50         [ 4] 3338         CALL     SPSTO
      009436 CD 84 34         [ 4] 3339         CALL     DOLIT
      009439 17 00                 3340         .word      TIBB
      00943B CD 86 4E         [ 4] 3341         CALL     NTIB
      00943E CD 8A 2D         [ 4] 3342         CALL     CELLP
      009441 CC 84 A5         [ 2] 3343         JP     STORE
                                   3344 
                                   3345 ;       QUIT    ( -- )
                                   3346 ;       Reset return stack pointer
                                   3347 ;       and start text interpreter.
      009444 94 27                 3348         .word      LINK
                           0013C6  3349 LINK = . 
      009446 04                    3350         .byte      4
      009447 51 55 49 54           3351         .ascii     "QUIT"
      00944B                       3352 QUIT:
      00944B CD 84 34         [ 4] 3353         CALL     DOLIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      00944E 17 FF                 3354         .word      RPP
      009450 CD 84 F7         [ 4] 3355         CALL     RPSTO   ;reset return stack pointer
      009453 CD 93 AF         [ 4] 3356 QUIT1:  CALL     LBRAC   ;start interpretation
      009456 CD 93 12         [ 4] 3357 QUIT2:  CALL     QUERY   ;get input
      009459 CD 94 03         [ 4] 3358         CALL     EVAL
      00945C 20 F8            [ 2] 3359         JRA     QUIT2   ;continue till error
                                   3360 
                                   3361 ;; The compiler
                                   3362 
                                   3363 ;       '       ( -- ca )
                                   3364 ;       Search vocabularies for
                                   3365 ;       next word in input stream.
      00945E 94 46                 3366         .word      LINK
                           0013E0  3367 LINK = . 
      009460 01                    3368         .byte      1
      009461 27                    3369         .ascii     "'"
      009462                       3370 TICK:
      009462 CD 91 3D         [ 4] 3371         CALL     TOKEN
      009465 CD 92 3A         [ 4] 3372         CALL     NAMEQ   ;?defined
      009468 CD 84 67         [ 4] 3373         CALL     QBRAN
      00946B 93 4E                 3374         .word      ABOR1
      00946D 81               [ 4] 3375         RET     ;yes, push code address
                                   3376 
                                   3377 ;       ALLOT   ( n -- )
                                   3378 ;       Allocate n bytes to RAM 
      00946E 94 60                 3379         .word      LINK
                           0013F0  3380         LINK = . 
      009470 05                    3381         .byte      5
      009471 41 4C 4C 4F 54        3382         .ascii     "ALLOT"
      009476                       3383 ALLOT:
      009476 CD 86 B1         [ 4] 3384         CALL     VPP
                                   3385 ; must update APP_VP each time VP is modidied
      009479 CD 8B 34         [ 4] 3386         call PSTOR 
      00947C CC 9C 58         [ 2] 3387         jp UPDATVP 
                                   3388 
                                   3389 ;       ,       ( w -- )
                                   3390 ;         Compile an integer into
                                   3391 ;         variable space.
      00947F 94 70                 3392         .word      LINK
                           001401  3393 LINK = . 
      009481 01                    3394         .byte      1
      009482 2C                    3395         .ascii     ","
      009483                       3396 COMMA:
      009483 CD 8B B2         [ 4] 3397         CALL     HERE
      009486 CD 85 63         [ 4] 3398         CALL     DUPP
      009489 CD 8A 2D         [ 4] 3399         CALL     CELLP   ;cell boundary
      00948C CD 86 B1         [ 4] 3400         CALL     VPP
      00948F CD 84 A5         [ 4] 3401         CALL     STORE
      009492 CC 84 A5         [ 2] 3402         JP     STORE
                                   3403 
                                   3404 ;       C,      ( c -- )
                                   3405 ;       Compile a byte into
                                   3406 ;       variables space.
      009495 94 81                 3407        .word      LINK
                           001417  3408 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



      009497 02                    3409         .byte      2
      009498 43 2C                 3410         .ascii     "C,"
      00949A                       3411 CCOMMA:
      00949A CD 8B B2         [ 4] 3412         CALL     HERE
      00949D CD 85 63         [ 4] 3413         CALL     DUPP
      0094A0 CD 8A 58         [ 4] 3414         CALL     ONEP
      0094A3 CD 86 B1         [ 4] 3415         CALL     VPP
      0094A6 CD 84 A5         [ 4] 3416         CALL     STORE
      0094A9 CC 84 C9         [ 2] 3417         JP     CSTOR
                                   3418 
                                   3419 ;       [COMPILE]       ( -- ; <string> )
                                   3420 ;       Compile next immediate
                                   3421 ;       word into code dictionary.
      0094AC 94 97                 3422         .word      LINK
                           00142E  3423 LINK = . 
      0094AE 89                    3424 	.byte      IMEDD+9
      0094AF 5B 43 4F 4D 50 49 4C  3425         .ascii     "[COMPILE]"
             45 5D
      0094B8                       3426 BCOMP:
      0094B8 CD 94 62         [ 4] 3427         CALL     TICK
      0094BB CC 97 7E         [ 2] 3428         JP     JSRC
                                   3429 
                                   3430 ;       COMPILE ( -- )
                                   3431 ;       Compile next jsr in
                                   3432 ;       colon list to code dictionary.
      0094BE 94 AE                 3433         .word      LINK
                           001440  3434 LINK = . 
      0094C0 47                    3435 	.byte      COMPO+7
      0094C1 43 4F 4D 50 49 4C 45  3436         .ascii     "COMPILE"
      0094C8                       3437 COMPI:
      0094C8 CD 85 0D         [ 4] 3438         CALL     RFROM
      0094CB CD 85 63         [ 4] 3439         CALL     DUPP
      0094CE CD 84 BC         [ 4] 3440         CALL     AT
      0094D1 CD 97 7E         [ 4] 3441         CALL     JSRC    ;compile subroutine
      0094D4 CD 8A 2D         [ 4] 3442         CALL     CELLP
      0094D7 90 93            [ 1] 3443         ldw y,x 
      0094D9 90 FE            [ 2] 3444         ldw y,(y)
      0094DB 1C 00 02         [ 2] 3445         addw x,#CELLL 
      0094DE 90 FC            [ 2] 3446         jp (y)
                                   3447 
                                   3448 ;       LITERAL ( w -- )
                                   3449 ;       Compile tos to dictionary
                                   3450 ;       as an integer literal.
      0094E0 94 C0                 3451         .word      LINK
                           001462  3452 LINK = . 
      0094E2 87                    3453 	.byte      IMEDD+7
      0094E3 4C 49 54 45 52 41 4C  3454         .ascii     "LITERAL"
      0094EA                       3455 LITER:
      0094EA CD 94 C8         [ 4] 3456         CALL     COMPI
      0094ED 84 34                 3457         .word DOLIT 
      0094EF CC 94 83         [ 2] 3458         JP     COMMA
                                   3459 
                                   3460 ;       $,"     ( -- )
                                   3461 ;       Compile a literal string
                                   3462 ;       up to next " .
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      0094F2 94 E2                 3463         .word      LINK
                           001474  3464 LINK = . 
      0094F4 03                    3465         .byte      3
      0094F5 24 2C 22              3466         .byte     '$',',','"'
      0094F8                       3467 STRCQ:
      0094F8 CD 84 34         [ 4] 3468         CALL     DOLIT
      0094FB 00 22                 3469         .word     34	; "
      0094FD CD 90 C0         [ 4] 3470         CALL     PARSE
      009500 CD 8B B2         [ 4] 3471         CALL     HERE
      009503 CD 8C 73         [ 4] 3472         CALL     PACKS   ;string to code dictionary
      009506 CD 8B 9B         [ 4] 3473         CALL     COUNT
      009509 CD 87 5E         [ 4] 3474         CALL     PLUS    ;calculate aligned end of string
      00950C CD 86 B1         [ 4] 3475         CALL     VPP
      00950F CC 84 A5         [ 2] 3476         JP     STORE
                                   3477 
                                   3478 ;; Structures
                                   3479 
                                   3480 ;       FOR     ( -- a )
                                   3481 ;       Start a FOR-NEXT loop
                                   3482 ;       structure in a colon definition.
      009512 94 F4                 3483         .word      LINK
                           001494  3484 LINK = . 
      009514 83                    3485 	.byte      IMEDD+3
      009515 46 4F 52              3486         .ascii     "FOR"
      009518                       3487 FOR:
      009518 CD 94 C8         [ 4] 3488         CALL     COMPI
      00951B 85 2C                 3489         .word TOR 
      00951D CC 8B B2         [ 2] 3490         JP     HERE
                                   3491 
                                   3492 ;       NEXT    ( a -- )
                                   3493 ;       Terminate a FOR-NEXT loop.
      009520 95 14                 3494         .word      LINK
                           0014A2  3495 LINK = . 
      009522 84                    3496 	.byte      IMEDD+4
      009523 4E 45 58 54           3497         .ascii     "NEXT"
      009527                       3498 NEXT:
      009527 CD 94 C8         [ 4] 3499         CALL     COMPI
      00952A 84 48                 3500         .word DONXT 
      00952C CD 86 FD         [ 4] 3501         call ADRADJ
      00952F CC 94 83         [ 2] 3502         JP     COMMA
                                   3503 
                                   3504 ;       I ( -- n )
                                   3505 ;       stack FOR-NEXT COUNTER 
      009532 95 22                 3506         .word LINK 
                           0014B4  3507         LINK=.
      009534 01                    3508         .byte 1 
      009535 49                    3509         .ascii "I"
      009536                       3510 IFETCH: 
      009536 1D 00 02         [ 2] 3511         subw x,#CELLL 
      009539 16 03            [ 2] 3512         ldw y,(3,sp)
      00953B FF               [ 2] 3513         ldw (x),y 
      00953C 81               [ 4] 3514         ret 
                                   3515 
                                   3516 ;       BEGIN   ( -- a )
                                   3517 ;       Start an infinite or
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



                                   3518 ;       indefinite loop structure.
      00953D 95 34                 3519         .word      LINK
                           0014BF  3520 LINK = . 
      00953F 85                    3521 	.byte      IMEDD+5
      009540 42 45 47 49 4E        3522         .ascii     "BEGIN"
      009545                       3523 BEGIN:
      009545 CC 8B B2         [ 2] 3524         JP     HERE
                                   3525 
                                   3526 ;       UNTIL   ( a -- )
                                   3527 ;       Terminate a BEGIN-UNTIL
                                   3528 ;       indefinite loop structure.
      009548 95 3F                 3529         .word      LINK
                           0014CA  3530 LINK = . 
      00954A 85                    3531 	.byte      IMEDD+5
      00954B 55 4E 54 49 4C        3532         .ascii     "UNTIL"
      009550                       3533 UNTIL:
      009550 CD 94 C8         [ 4] 3534         CALL     COMPI
      009553 84 67                 3535         .word    QBRAN 
      009555 CD 86 FD         [ 4] 3536         call ADRADJ
      009558 CC 94 83         [ 2] 3537         JP     COMMA
                                   3538 
                                   3539 ;       AGAIN   ( a -- )
                                   3540 ;       Terminate a BEGIN-AGAIN
                                   3541 ;       infinite loop structure.
      00955B 95 4A                 3542         .word      LINK
                           0014DD  3543 LINK = . 
      00955D 85                    3544 	.byte      IMEDD+5
      00955E 41 47 41 49 4E        3545         .ascii     "AGAIN"
      009563                       3546 AGAIN:
      009563 CD 94 C8         [ 4] 3547         CALL     COMPI
      009566 84 7E                 3548         .word BRAN
      009568 CD 86 FD         [ 4] 3549         call ADRADJ 
      00956B CC 94 83         [ 2] 3550         JP     COMMA
                                   3551 
                                   3552 ;       IF      ( -- A )
                                   3553 ;       Begin a conditional branch.
      00956E 95 5D                 3554         .word      LINK
                           0014F0  3555 LINK = . 
      009570 82                    3556 	.byte      IMEDD+2
      009571 49 46                 3557         .ascii     "IF"
      009573                       3558 IFF:
      009573 CD 94 C8         [ 4] 3559         CALL     COMPI
      009576 84 67                 3560         .word QBRAN
      009578 CD 8B B2         [ 4] 3561         CALL     HERE
      00957B CD 8A C4         [ 4] 3562         CALL     ZERO
      00957E CC 94 83         [ 2] 3563         JP     COMMA
                                   3564 
                                   3565 ;       THEN        ( A -- )
                                   3566 ;       Terminate a conditional branch structure.
      009581 95 70                 3567         .word      LINK
                           001503  3568 LINK = . 
      009583 84                    3569 	.byte      IMEDD+4
      009584 54 48 45 4E           3570         .ascii     "THEN"
      009588                       3571 THENN:
      009588 CD 8B B2         [ 4] 3572         CALL     HERE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      00958B CD 86 FD         [ 4] 3573         call ADRADJ 
      00958E CD 85 73         [ 4] 3574         CALL     SWAPP
      009591 CC 84 A5         [ 2] 3575         JP     STORE
                                   3576 
                                   3577 ;       ELSE        ( A -- A )
                                   3578 ;       Start the false clause in an IF-ELSE-THEN structure.
      009594 95 83                 3579         .word      LINK
                           001516  3580 LINK = . 
      009596 84                    3581 	.byte      IMEDD+4
      009597 45 4C 53 45           3582         .ascii     "ELSE"
      00959B                       3583 ELSEE:
      00959B CD 94 C8         [ 4] 3584         CALL     COMPI
      00959E 84 7E                 3585         .word BRAN
      0095A0 CD 8B B2         [ 4] 3586         CALL     HERE
      0095A3 CD 8A C4         [ 4] 3587         CALL     ZERO
      0095A6 CD 94 83         [ 4] 3588         CALL     COMMA
      0095A9 CD 85 73         [ 4] 3589         CALL     SWAPP
      0095AC CD 8B B2         [ 4] 3590         CALL     HERE
      0095AF CD 86 FD         [ 4] 3591         call ADRADJ 
      0095B2 CD 85 73         [ 4] 3592         CALL     SWAPP
      0095B5 CC 84 A5         [ 2] 3593         JP     STORE
                                   3594 
                                   3595 ;       AHEAD       ( -- A )
                                   3596 ;       Compile a forward branch instruction.
      0095B8 95 96                 3597         .word      LINK
                           00153A  3598 LINK = . 
      0095BA 85                    3599 	.byte      IMEDD+5
      0095BB 41 48 45 41 44        3600         .ascii     "AHEAD"
      0095C0                       3601 AHEAD:
      0095C0 CD 94 C8         [ 4] 3602         CALL     COMPI
      0095C3 84 7E                 3603         .word BRAN
      0095C5 CD 8B B2         [ 4] 3604         CALL     HERE
      0095C8 CD 8A C4         [ 4] 3605         CALL     ZERO
      0095CB CC 94 83         [ 2] 3606         JP     COMMA
                                   3607 
                                   3608 ;       WHILE       ( a -- A a )
                                   3609 ;       Conditional branch out of a BEGIN-WHILE-REPEAT loop.
      0095CE 95 BA                 3610         .word      LINK
                           001550  3611 LINK = . 
      0095D0 85                    3612 	.byte      IMEDD+5
      0095D1 57 48 49 4C 45        3613         .ascii     "WHILE"
      0095D6                       3614 WHILE:
      0095D6 CD 94 C8         [ 4] 3615         CALL     COMPI
      0095D9 84 67                 3616         .word QBRAN
      0095DB CD 8B B2         [ 4] 3617         CALL     HERE
      0095DE CD 8A C4         [ 4] 3618         CALL     ZERO
      0095E1 CD 94 83         [ 4] 3619         CALL     COMMA
      0095E4 CC 85 73         [ 2] 3620         JP     SWAPP
                                   3621 
                                   3622 ;       REPEAT      ( A a -- )
                                   3623 ;       Terminate a BEGIN-WHILE-REPEAT indefinite loop.
      0095E7 95 D0                 3624         .word      LINK
                           001569  3625 LINK = . 
      0095E9 86                    3626         .byte      IMEDD+6
      0095EA 52 45 50 45 41 54     3627         .ascii     "REPEAT"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



      0095F0                       3628 REPEA:
      0095F0 CD 94 C8         [ 4] 3629         CALL     COMPI
      0095F3 84 7E                 3630         .word BRAN
      0095F5 CD 86 FD         [ 4] 3631         call ADRADJ 
      0095F8 CD 94 83         [ 4] 3632         CALL     COMMA
      0095FB CD 8B B2         [ 4] 3633         CALL     HERE
      0095FE CD 86 FD         [ 4] 3634         call ADRADJ 
      009601 CD 85 73         [ 4] 3635         CALL     SWAPP
      009604 CC 84 A5         [ 2] 3636         JP     STORE
                                   3637 
                                   3638 ;       AFT         ( a -- a A )
                                   3639 ;       Jump to THEN in a FOR-AFT-THEN-NEXT loop the first time through.
      009607 95 E9                 3640         .word      LINK
                           001589  3641 LINK = . 
      009609 83                    3642 	.byte      IMEDD+3
      00960A 41 46 54              3643         .ascii     "AFT"
      00960D                       3644 AFT:
      00960D CD 85 59         [ 4] 3645         CALL     DROP
      009610 CD 95 C0         [ 4] 3646         CALL     AHEAD
      009613 CD 8B B2         [ 4] 3647         CALL     HERE
      009616 CC 85 73         [ 2] 3648         JP     SWAPP
                                   3649 
                                   3650 ;       ABORT"      ( -- ; <string> )
                                   3651 ;       Conditional abort with an error message.
      009619 96 09                 3652         .word      LINK
                           00159B  3653 LINK = . 
      00961B 86                    3654 	.byte      IMEDD+6
      00961C 41 42 4F 52 54        3655         .ascii     "ABORT"
      009621 22                    3656         .byte      '"'
      009622                       3657 ABRTQ:
      009622 CD 94 C8         [ 4] 3658         CALL     COMPI
      009625 93 46                 3659         .word ABORQ
      009627 CC 94 F8         [ 2] 3660         JP     STRCQ
                                   3661 
                                   3662 ;       $"     ( -- ; <string> )
                                   3663 ;       Compile an inline string literal.
      00962A 96 1B                 3664         .word      LINK
                           0015AC  3665 LINK = . 
      00962C 82                    3666 	.byte      IMEDD+2
      00962D 24 22                 3667         .byte     '$','"'
      00962F                       3668 STRQ:
      00962F CD 94 C8         [ 4] 3669         CALL     COMPI
      009632 8F 60                 3670         .word STRQP 
      009634 CC 94 F8         [ 2] 3671         JP     STRCQ
                                   3672 
                                   3673 ;       ."          ( -- ; <string> )
                                   3674 ;       Compile an inline string literal to be typed out at run time.
      009637 96 2C                 3675         .word      LINK
                           0015B9  3676 LINK = . 
      009639 82                    3677 	.byte      IMEDD+2
      00963A 2E 22                 3678         .byte     '.','"'
      00963C                       3679 DOTQ:
      00963C CD 94 C8         [ 4] 3680         CALL     COMPI
      00963F 8F 6A                 3681         .word DOTQP 
      009641 CC 94 F8         [ 2] 3682         JP     STRCQ
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



                                   3683 
                                   3684 ;; Name compiler
                                   3685 
                                   3686 ;       ?UNIQUE ( a -- a )
                                   3687 ;       Display a warning message
                                   3688 ;       if word already exists.
      009644 96 39                 3689         .word      LINK
                           0015C6  3690 LINK = . 
      009646 07                    3691         .byte      7
      009647 3F 55 4E 49 51 55 45  3692         .ascii     "?UNIQUE"
      00964E                       3693 UNIQU:
      00964E CD 85 63         [ 4] 3694         CALL     DUPP
      009651 CD 92 3A         [ 4] 3695         CALL     NAMEQ   ;?name exists
      009654 CD 84 67         [ 4] 3696         CALL     QBRAN
      009657 96 6D                 3697         .word      UNIQ1
      009659 CD 8F 6A         [ 4] 3698         CALL     DOTQP   ;redef are OK
      00965C 07                    3699         .byte       7
      00965D 20 72 65 44 65 66 20  3700         .ascii     " reDef "       
      009664 CD 85 8D         [ 4] 3701         CALL     OVER
      009667 CD 8B 9B         [ 4] 3702         CALL     COUNT
      00966A CD 8F 0D         [ 4] 3703         CALL     TYPES   ;just in case
      00966D CC 85 59         [ 2] 3704 UNIQ1:  JP     DROP
                                   3705 
                                   3706 ;       $,n     ( na -- )
                                   3707 ;       Build a new dictionary name
                                   3708 ;       using string at na.
                                   3709 ; compile dans l'espace des variables 
      009670 96 46                 3710         .word      LINK
                           0015F2  3711 LINK = . 
      009672 03                    3712         .byte      3
      009673 24 2C 6E              3713         .ascii     "$,n"
      009676                       3714 SNAME:
      009676 CD 85 63         [ 4] 3715         CALL     DUPP
      009679 CD 84 DA         [ 4] 3716         CALL     CAT     ;?null input
      00967C CD 84 67         [ 4] 3717         CALL     QBRAN
      00967F 96 AC                 3718         .word      PNAM1
      009681 CD 96 4E         [ 4] 3719         CALL     UNIQU   ;?redefinition
      009684 CD 85 63         [ 4] 3720         CALL     DUPP
      009687 CD 8B 9B         [ 4] 3721         CALL     COUNT
      00968A CD 87 5E         [ 4] 3722         CALL     PLUS
      00968D CD 86 B1         [ 4] 3723         CALL     VPP
      009690 CD 84 A5         [ 4] 3724         CALL     STORE
      009693 CD 85 63         [ 4] 3725         CALL     DUPP
      009696 CD 86 CF         [ 4] 3726         CALL     LAST
      009699 CD 84 A5         [ 4] 3727         CALL     STORE   ;save na for vocabulary link
      00969C CD 8A 3C         [ 4] 3728         CALL     CELLM   ;link address
      00969F CD 86 A3         [ 4] 3729         CALL     CNTXT
      0096A2 CD 84 BC         [ 4] 3730         CALL     AT
      0096A5 CD 85 73         [ 4] 3731         CALL     SWAPP
      0096A8 CD 84 A5         [ 4] 3732         CALL     STORE
      0096AB 81               [ 4] 3733         RET     ;save code pointer
      0096AC CD 8F 60         [ 4] 3734 PNAM1:  CALL     STRQP
      0096AF 05                    3735         .byte      5
      0096B0 20 6E 61 6D 65        3736         .ascii     " name" ;null input
      0096B5 CC 93 4E         [ 2] 3737         JP     ABOR1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



                                   3738 
                                   3739 ;; FORTH compiler
                                   3740 
                                   3741 ;       $COMPILE        ( a -- )
                                   3742 ;       Compile next word to
                                   3743 ;       dictionary as a token or literal.
      0096B8 96 72                 3744         .word      LINK
                           00163A  3745 LINK = . 
      0096BA 08                    3746         .byte      8
      0096BB 24 43 4F 4D 50 49 4C  3747         .ascii     "$COMPILE"
             45
      0096C3                       3748 SCOMP:
      0096C3 CD 92 3A         [ 4] 3749         CALL     NAMEQ
      0096C6 CD 87 0D         [ 4] 3750         CALL     QDUP    ;?defined
      0096C9 CD 84 67         [ 4] 3751         CALL     QBRAN
      0096CC 96 E4                 3752         .word      SCOM2
      0096CE CD 84 BC         [ 4] 3753         CALL     AT
      0096D1 CD 84 34         [ 4] 3754         CALL     DOLIT
      0096D4 80 00                 3755         .word     0x8000	;  IMEDD*256
      0096D6 CD 85 AF         [ 4] 3756         CALL     ANDD    ;?immediate
      0096D9 CD 84 67         [ 4] 3757         CALL     QBRAN
      0096DC 96 E1                 3758         .word      SCOM1
      0096DE CC 84 8E         [ 2] 3759         JP     EXECU
      0096E1 CC 97 7E         [ 2] 3760 SCOM1:  JP     JSRC
      0096E4 CD 8D D8         [ 4] 3761 SCOM2:  CALL     NUMBQ   ;try to convert to number
      0096E7 CD 84 67         [ 4] 3762         CALL     QBRAN
      0096EA 93 4E                 3763         .word      ABOR1
      0096EC CC 94 EA         [ 2] 3764         JP     LITER
                                   3765 
                                   3766 ;       OVERT   ( -- )
                                   3767 ;       Link a new word into vocabulary.
      0096EF 96 BA                 3768         .word      LINK
                           001671  3769 LINK = . 
      0096F1 05                    3770         .byte      5
      0096F2 4F 56 45 52 54        3771         .ascii     "OVERT"
      0096F7                       3772 OVERT:
      0096F7 CD 86 CF         [ 4] 3773         CALL     LAST
      0096FA CD 84 BC         [ 4] 3774         CALL     AT
      0096FD CD 86 A3         [ 4] 3775         CALL     CNTXT
      009700 CC 84 A5         [ 2] 3776         JP     STORE
                                   3777 
                                   3778 ;       ;       ( -- )
                                   3779 ;       Terminate a colon definition.
      009703 96 F1                 3780         .word      LINK
                           001685  3781 LINK = . 
      009705 C1                    3782 	.byte      IMEDD+COMPO+1
      009706 3B                    3783         .ascii     ";"
      009707                       3784 SEMIS:
                           000001  3785 .if OPTIMIZE ; more compact and faster
      009707 CD 84 34         [ 4] 3786         call DOLIT 
      00970A 00 81                 3787         .word 0x81   ; opcode for RET 
      00970C CD 94 9A         [ 4] 3788         call CCOMMA 
                           000000  3789 .else
                                   3790         CALL     COMPI
                                   3791         .word EXIT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



                                   3792 .endif 
      00970F CD 93 AF         [ 4] 3793         CALL     LBRAC
      009712 CD 96 F7         [ 4] 3794         call OVERT 
      009715 CD A1 24         [ 4] 3795         CALL FMOVE
      009718 CD 87 0D         [ 4] 3796         call QDUP 
      00971B CD 84 67         [ 4] 3797         call QBRAN 
      00971E 98 4E                 3798         .word SET_RAMLAST 
      009720 CD A1 B8         [ 4] 3799         CALL UPDATPTR
      009723 81               [ 4] 3800         RET 
                                   3801 
                                   3802 
                                   3803 ;       Terminate an ISR definition 
                                   3804 ;       retourn ca of ISR as double
                                   3805 ;       I; ( -- ud )
      009724 97 05                 3806         .word LINK 
                           0016A6  3807         LINK=.
      009726 C2                    3808         .byte 2+IMEDD+COMPO 
      009727 49 3B                 3809         .ascii "I;" 
      009729                       3810 ISEMI:
      009729 1D 00 02         [ 2] 3811         subw x,#CELLL  
      00972C 90 AE 00 80      [ 2] 3812         ldw y,#IRET_CODE 
      009730 FF               [ 2] 3813         ldw (x),y 
      009731 CD 94 9A         [ 4] 3814         call CCOMMA
      009734 CD 93 AF         [ 4] 3815         call LBRAC 
      009737 CD A1 FD         [ 4] 3816         call IFMOVE
      00973A CD 87 0D         [ 4] 3817         call QDUP 
      00973D CD 84 67         [ 4] 3818         CALL QBRAN 
      009740 98 4E                 3819         .word SET_RAMLAST
      009742 CD 86 BF         [ 4] 3820         CALL CPP
      009745 CD 84 BC         [ 4] 3821         call AT 
      009748 CD 85 73         [ 4] 3822         call SWAPP 
      00974B CD 86 BF         [ 4] 3823         CALL CPP 
      00974E CD 84 A5         [ 4] 3824         call STORE 
      009751 CD 9C 41         [ 4] 3825         call UPDATCP 
      009754 CD 9B FE         [ 4] 3826         call EEPVP 
      009757 CD 85 59         [ 4] 3827         call DROP 
      00975A CD 84 BC         [ 4] 3828         call AT 
      00975D CD 86 B1         [ 4] 3829         call VPP 
      009760 CD 84 A5         [ 4] 3830         call STORE 
      009763 CC 8A C4         [ 2] 3831         jp ZERO
      009766 81               [ 4] 3832         ret           
                                   3833         
                                   3834 
                                   3835 ;       ]       ( -- )
                                   3836 ;       Start compiling words in
                                   3837 ;       input stream.
      009767 97 26                 3838         .word      LINK
                           0016E9  3839 LINK = . 
      009769 01                    3840         .byte      1
      00976A 5D                    3841         .ascii     "]"
      00976B                       3842 RBRAC:
      00976B CD 84 34         [ 4] 3843         CALL   DOLIT
      00976E 96 C3                 3844         .word  SCOMP
      009770 CD 86 81         [ 4] 3845         CALL   TEVAL
      009773 CC 84 A5         [ 2] 3846         JP     STORE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



                                   3847 
                                   3848 ;       CALL,    ( ca -- )
                                   3849 ;       Compile a subroutine call.
      009776 97 69                 3850         .word      LINK
                           0016F8  3851 LINK = . 
      009778 05                    3852         .byte      5
      009779 43 41 4C 4C 2C        3853         .ascii     "CALL,"
      00977E                       3854 JSRC:
      00977E CD 84 34         [ 4] 3855         CALL     DOLIT
      009781 00 CD                 3856         .word     CALLL     ;CALL
      009783 CD 94 9A         [ 4] 3857         CALL     CCOMMA
      009786 CC 94 83         [ 2] 3858         JP     COMMA
                                   3859 
                                   3860 ;       INIT-OFS ( -- )
                                   3861 ;       compute offset to adjust jump address 
                                   3862 ;       set variable OFFSET 
      009789 97 78                 3863         .word LINK 
                           00170B  3864         LINK=.
      00978B 08                    3865         .byte 8 
      00978C 49 4E 49 54 2D 4F 46  3866         .ascii "INIT-OFS" 
             53
      009794                       3867 INITOFS:
      009794 CD 86 70         [ 4] 3868         call TFLASH 
      009797 CD 84 BC         [ 4] 3869         CALL AT 
      00979A CD 85 63         [ 4] 3870         CALL DUPP 
      00979D CD 84 67         [ 4] 3871         call QBRAN
      0097A0 97 B1                 3872         .word 1$
      0097A2 CD 85 59         [ 4] 3873         call DROP  
      0097A5 CD 86 BF         [ 4] 3874         call CPP 
      0097A8 CD 84 BC         [ 4] 3875         call AT 
      0097AB CD 8B B2         [ 4] 3876         call HERE
      0097AE CD 87 D7         [ 4] 3877         call SUBB 
      0097B1 CD 86 F4         [ 4] 3878 1$:     call OFFSET 
      0097B4 CC 84 A5         [ 2] 3879         jp STORE  
                                   3880 
                                   3881 ;       :       ( -- ; <string> )
                                   3882 ;       Start a new colon definition
                                   3883 ;       using next word as its name.
      0097B7 97 8B                 3884         .word      LINK
                           001739  3885 LINK = . 
      0097B9 01                    3886         .byte      1
      0097BA 3A                    3887         .ascii     ":"
      0097BB                       3888 COLON:
      0097BB CD 97 94         [ 4] 3889         call INITOFS       
      0097BE CD 91 3D         [ 4] 3890         CALL   TOKEN
      0097C1 CD 96 76         [ 4] 3891         CALL   SNAME
      0097C4 CC 97 6B         [ 2] 3892         JP     RBRAC
                                   3893 
                                   3894 ;       I:  ( -- )
                                   3895 ;       Start interrupt service routine definition
                                   3896 ;       those definition have no name.
      0097C7 97 B9                 3897         .word LINK
                           001749  3898         LINK=.
      0097C9 02                    3899         .byte 2 
      0097CA 49 3A                 3900         .ascii "I:" 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



      0097CC                       3901 ICOLON:
      0097CC CD 97 94         [ 4] 3902         call INITOFS 
      0097CF CC 97 6B         [ 2] 3903         jp RBRAC  
                                   3904 
                                   3905 ;       IMMEDIATE       ( -- )
                                   3906 ;       Make last compiled word
                                   3907 ;       an immediate word.
      0097D2 97 C9                 3908         .word      LINK
                           001754  3909 LINK = . 
      0097D4 09                    3910         .byte      9
      0097D5 49 4D 4D 45 44 49 41  3911         .ascii     "IMMEDIATE"
             54 45
      0097DE                       3912 IMMED:
      0097DE CD 84 34         [ 4] 3913         CALL     DOLIT
      0097E1 80 00                 3914         .word     0x8000	;  IMEDD*256
      0097E3 CD 86 CF         [ 4] 3915         CALL     LAST
      0097E6 CD 84 BC         [ 4] 3916         CALL     AT
      0097E9 CD 84 BC         [ 4] 3917         CALL     AT
      0097EC CD 85 C3         [ 4] 3918         CALL     ORR
      0097EF CD 86 CF         [ 4] 3919         CALL     LAST
      0097F2 CD 84 BC         [ 4] 3920         CALL     AT
      0097F5 CC 84 A5         [ 2] 3921         JP     STORE
                                   3922 
                                   3923 ;; Defining words
                                   3924 
                                   3925 ;       CREATE  ( -- ; <string> )
                                   3926 ;       Compile a new array
                                   3927 ;       without allocating space.
      0097F8 97 D4                 3928         .word      LINK
                           00177A  3929 LINK = . 
      0097FA 06                    3930         .byte      6
      0097FB 43 52 45 41 54 45     3931         .ascii     "CREATE"
      009801                       3932 CREAT:
      009801 CD 91 3D         [ 4] 3933         CALL     TOKEN
      009804 CD 96 76         [ 4] 3934         CALL     SNAME
      009807 CD 96 F7         [ 4] 3935         CALL     OVERT        
      00980A CD 94 C8         [ 4] 3936         CALL     COMPI 
      00980D 86 10                 3937         .word DOVAR 
      00980F 81               [ 4] 3938         RET
                                   3939 
                                   3940 ;       VARIABLE        ( -- ; <string> )
                                   3941 ;       Compile a new variable
                                   3942 ;       initialized to 0.
      009810 97 FA                 3943         .word      LINK
                           001792  3944 LINK = . 
      009812 08                    3945         .byte      8
      009813 56 41 52 49 41 42 4C  3946         .ascii     "VARIABLE"
             45
      00981B                       3947 VARIA:
                                   3948 ; indirect variable so that VARIABLE definition can be compiled in FLASH 
      00981B CD 8B B2         [ 4] 3949         CALL HERE
      00981E CD 85 63         [ 4] 3950         CALL DUPP 
      009821 CD 8A 2D         [ 4] 3951         CALL CELLP
      009824 CD 86 B1         [ 4] 3952         CALL VPP 
      009827 CD 84 A5         [ 4] 3953         CALL STORE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      00982A CD 98 01         [ 4] 3954         CALL CREAT
      00982D CD 85 63         [ 4] 3955         CALL DUPP
      009830 CD 94 83         [ 4] 3956         CALL COMMA
      009833 CD 8A C4         [ 4] 3957         CALL ZERO
      009836 CD 85 73         [ 4] 3958         call SWAPP 
      009839 CD 84 A5         [ 4] 3959         CALL STORE
      00983C CD A1 24         [ 4] 3960         CALL FMOVE ; move definition to FLASH
      00983F CD 87 0D         [ 4] 3961         CALL QDUP 
      009842 CD 84 67         [ 4] 3962         CALL QBRAN 
      009845 98 4E                 3963         .word SET_RAMLAST   
      009847 CD 9C 58         [ 4] 3964         call UPDATVP  ; don't update if variable kept in RAM.
      00984A CD A1 B8         [ 4] 3965         CALL UPDATPTR
      00984D 81               [ 4] 3966         RET         
      00984E                       3967 SET_RAMLAST: 
      00984E CD 86 CF         [ 4] 3968         CALL LAST 
      009851 CD 84 BC         [ 4] 3969         CALL AT 
      009854 CD 86 E2         [ 4] 3970         CALL RAMLAST 
      009857 CC 84 A5         [ 2] 3971         jp STORE  
                                   3972 
                                   3973 
                                   3974 ;       CONSTANT  ( n -- ; <string> )
                                   3975 ;       Compile a new constant 
                                   3976 ;       n CONSTANT name 
      00985A 98 12                 3977         .word LINK 
                           0017DC  3978         LINK=. 
      00985C 08                    3979         .byte 8 
      00985D 43 4F 4E 53 54 41 4E  3980         .ascii "CONSTANT" 
             54
      009865                       3981 CONSTANT:          
      009865 CD 91 3D         [ 4] 3982         CALL TOKEN
      009868 CD 96 76         [ 4] 3983         CALL SNAME 
      00986B CD 96 F7         [ 4] 3984         CALL OVERT 
      00986E CD 94 C8         [ 4] 3985         CALL COMPI 
      009871 98 8F                 3986         .word DOCONST
      009873 CD 94 83         [ 4] 3987         CALL COMMA 
      009876 CD A1 24         [ 4] 3988         CALL FMOVE
      009879 CD 87 0D         [ 4] 3989         CALL QDUP 
      00987C CD 84 67         [ 4] 3990         CALL QBRAN 
      00987F 98 4E                 3991         .word SET_RAMLAST  
      009881 CD A1 B8         [ 4] 3992         CALL UPDATPTR  
      009884 81               [ 4] 3993 1$:     RET          
                                   3994 
                                   3995 ; CONSTANT runtime semantic 
                                   3996 ; doCONST  ( -- n )
      009885 98 5C                 3997         .word LINK 
                           001807  3998         LINK=.
      009887 07                    3999         .byte 7
      009888 44 4F 43 4F 4E 53 54  4000         .ascii "DOCONST"
      00988F                       4001 DOCONST:
      00988F 1D 00 02         [ 2] 4002         subw x,#CELLL
      009892 90 85            [ 2] 4003         popw y 
      009894 90 FE            [ 2] 4004         ldw y,(y) 
      009896 FF               [ 2] 4005         ldw (x),y 
      009897 81               [ 4] 4006         ret 
                                   4007 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



                                   4008 
                                   4009 ;; Tools
                                   4010 
                                   4011 ;       _TYPE   ( b u -- )
                                   4012 ;       Display a string. Filter
                                   4013 ;       non-printing characters.
      009898 98 87                 4014         .word      LINK
                           00181A  4015 LINK = . 
      00989A 05                    4016         .byte      5
      00989B 5F 54 59 50 45        4017         .ascii     "_TYPE"
      0098A0                       4018 UTYPE:
      0098A0 CD 85 2C         [ 4] 4019         CALL     TOR     ;start count down loop
      0098A3 20 0F            [ 2] 4020         JRA     UTYP2   ;skip first pass
      0098A5 CD 85 63         [ 4] 4021 UTYP1:  CALL     DUPP
      0098A8 CD 84 DA         [ 4] 4022         CALL     CAT
      0098AB CD 8A EE         [ 4] 4023         CALL     TCHAR
      0098AE CD 84 1E         [ 4] 4024         CALL     EMIT    ;display only printable
      0098B1 CD 8A 58         [ 4] 4025         CALL     ONEP    ;increment address
      0098B4 CD 84 48         [ 4] 4026 UTYP2:  CALL     DONXT
      0098B7 98 A5                 4027         .word      UTYP1   ;loop till done
      0098B9 CC 85 59         [ 2] 4028         JP     DROP
                                   4029 
                                   4030 ;       dm+     ( a u -- a )
                                   4031 ;       Dump u bytes from ,
                                   4032 ;       leaving a+u on  stack.
      0098BC 98 9A                 4033         .word      LINK
                           00183E  4034 LINK = . 
      0098BE 03                    4035         .byte      3
      0098BF 64 6D 2B              4036         .ascii     "dm+"
      0098C2                       4037 DUMPP:
      0098C2 CD 85 8D         [ 4] 4038         CALL     OVER
      0098C5 CD 84 34         [ 4] 4039         CALL     DOLIT
      0098C8 00 04                 4040         .word      4
      0098CA CD 8F 93         [ 4] 4041         CALL     UDOTR   ;display address
      0098CD CD 8E E3         [ 4] 4042         CALL     SPACE
      0098D0 CD 85 2C         [ 4] 4043         CALL     TOR     ;start count down loop
      0098D3 20 11            [ 2] 4044         JRA     PDUM2   ;skip first pass
      0098D5 CD 85 63         [ 4] 4045 PDUM1:  CALL     DUPP
      0098D8 CD 84 DA         [ 4] 4046         CALL     CAT
      0098DB CD 84 34         [ 4] 4047         CALL     DOLIT
      0098DE 00 03                 4048         .word      3
      0098E0 CD 8F 93         [ 4] 4049         CALL     UDOTR   ;display numeric data
      0098E3 CD 8A 58         [ 4] 4050         CALL     ONEP    ;increment address
      0098E6 CD 84 48         [ 4] 4051 PDUM2:  CALL     DONXT
      0098E9 98 D5                 4052         .word      PDUM1   ;loop till done
      0098EB 81               [ 4] 4053         RET
                                   4054 
                                   4055 ;       DUMP    ( a u -- )
                                   4056 ;       Dump u bytes from a,
                                   4057 ;       in a formatted manner.
      0098EC 98 BE                 4058         .word      LINK
                           00186E  4059 LINK = . 
      0098EE 04                    4060         .byte      4
      0098EF 44 55 4D 50           4061         .ascii     "DUMP"
      0098F3                       4062 DUMP:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



      0098F3 CD 86 20         [ 4] 4063         CALL     BASE
      0098F6 CD 84 BC         [ 4] 4064         CALL     AT
      0098F9 CD 85 2C         [ 4] 4065         CALL     TOR
      0098FC CD 8D 6B         [ 4] 4066         CALL     HEX     ;save radix, set hex
      0098FF CD 84 34         [ 4] 4067         CALL     DOLIT
      009902 00 10                 4068         .word      16
      009904 CD 89 7E         [ 4] 4069         CALL     SLASH   ;change count to lines
      009907 CD 85 2C         [ 4] 4070         CALL     TOR     ;start count down loop
      00990A CD 8F 2B         [ 4] 4071 DUMP1:  CALL     CR
      00990D CD 84 34         [ 4] 4072         CALL     DOLIT
      009910 00 10                 4073         .word      16
      009912 CD 87 49         [ 4] 4074         CALL     DDUP
      009915 CD 98 C2         [ 4] 4075         CALL     DUMPP   ;display numeric
      009918 CD 87 1E         [ 4] 4076         CALL     ROT
      00991B CD 87 1E         [ 4] 4077         CALL     ROT
      00991E CD 8E E3         [ 4] 4078         CALL     SPACE
      009921 CD 8E E3         [ 4] 4079         CALL     SPACE
      009924 CD 98 A0         [ 4] 4080         CALL     UTYPE   ;display printable characters
      009927 CD 84 48         [ 4] 4081         CALL     DONXT
      00992A 99 0A                 4082         .word      DUMP1   ;loop till done
      00992C CD 85 59         [ 4] 4083 DUMP3:  CALL     DROP
      00992F CD 85 0D         [ 4] 4084         CALL     RFROM
      009932 CD 86 20         [ 4] 4085         CALL     BASE
      009935 CC 84 A5         [ 2] 4086         JP     STORE   ;restore radix
                                   4087 
                                   4088 ;       .S      ( ... -- ... )
                                   4089 ;        Display  contents of stack.
      009938 98 EE                 4090         .word      LINK
                           0018BA  4091 LINK = . 
      00993A 02                    4092         .byte      2
      00993B 2E 53                 4093         .ascii     ".S"
      00993D                       4094 DOTS:
      00993D CD 8F 2B         [ 4] 4095         CALL     CR
      009940 CD 8B 06         [ 4] 4096         CALL     DEPTH   ;stack depth
      009943 CD 85 2C         [ 4] 4097         CALL     TOR     ;start count down loop
      009946 20 09            [ 2] 4098         JRA     DOTS2   ;skip first pass
      009948 CD 85 20         [ 4] 4099 DOTS1:  CALL     RAT
      00994B CD 8B 1D         [ 4] 4100 	CALL     PICK
      00994E CD 8F C6         [ 4] 4101         CALL     DOT     ;index stack, display contents
      009951 CD 84 48         [ 4] 4102 DOTS2:  CALL     DONXT
      009954 99 48                 4103         .word      DOTS1   ;loop till done
      009956 CD 8F 6A         [ 4] 4104         CALL     DOTQP
      009959 05                    4105         .byte      5
      00995A 20 3C 73 70 20        4106         .ascii     " <sp "
      00995F 81               [ 4] 4107         RET
                                   4108 
                                   4109 ;       >NAME   ( ca -- na | F )
                                   4110 ;       Convert code address
                                   4111 ;       to a name address.
      009960 99 3A                 4112         .word      LINK
                           0018E2  4113 LINK = . 
      009962 05                    4114         .byte      5
      009963 3E 4E 41 4D 45        4115         .ascii     ">NAME"
      009968                       4116 TNAME:
      009968 CD 86 A3         [ 4] 4117         CALL     CNTXT   ;vocabulary link
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



      00996B CD 84 BC         [ 4] 4118 TNAM2:  CALL     AT
      00996E CD 85 63         [ 4] 4119         CALL     DUPP    ;?last word in a vocabulary
      009971 CD 84 67         [ 4] 4120         CALL     QBRAN
      009974 99 8F                 4121         .word      TNAM4
      009976 CD 87 49         [ 4] 4122         CALL     DDUP
      009979 CD 91 4B         [ 4] 4123         CALL     NAMET
      00997C CD 85 D8         [ 4] 4124         CALL     XORR    ;compare
      00997F CD 84 67         [ 4] 4125         CALL     QBRAN
      009982 99 89                 4126         .word      TNAM3
      009984 CD 8A 3C         [ 4] 4127         CALL     CELLM   ;continue with next word
      009987 20 E2            [ 2] 4128         JRA     TNAM2
      009989 CD 85 73         [ 4] 4129 TNAM3:  CALL     SWAPP
      00998C CC 85 59         [ 2] 4130         JP     DROP
      00998F CD 87 3E         [ 4] 4131 TNAM4:  CALL     DDROP
      009992 CC 8A C4         [ 2] 4132         JP     ZERO
                                   4133 
                                   4134 ;       .ID     ( na -- )
                                   4135 ;        Display  name at address.
      009995 99 62                 4136         .word      LINK
                           001917  4137 LINK = . 
      009997 03                    4138         .byte      3
      009998 2E 49 44              4139         .ascii     ".ID"
      00999B                       4140 DOTID:
      00999B CD 87 0D         [ 4] 4141         CALL     QDUP    ;if zero no name
      00999E CD 84 67         [ 4] 4142         CALL     QBRAN
      0099A1 99 B1                 4143         .word      DOTI1
      0099A3 CD 8B 9B         [ 4] 4144         CALL     COUNT
      0099A6 CD 84 34         [ 4] 4145         CALL     DOLIT
      0099A9 00 1F                 4146         .word      0x1F
      0099AB CD 85 AF         [ 4] 4147         CALL     ANDD    ;mask lexicon bits
      0099AE CC 98 A0         [ 2] 4148         JP     UTYPE
      0099B1 CD 8F 6A         [ 4] 4149 DOTI1:  CALL     DOTQP
      0099B4 09                    4150         .byte      9
      0099B5 20 6E 6F 4E 61 6D 65  4151         .ascii     " noName"
      0099BC 81               [ 4] 4152         RET
                                   4153 
                                   4154 
                           000001  4155 .if WANT_SEE 
                                   4156 ;       SEE     ( -- ; <string> )
                                   4157 ;       A simple decompiler.
                                   4158 ;       Updated for byte machines.
      0099BD 99 97                 4159         .word      LINK
                           00193F  4160 LINK = . 
      0099BF 03                    4161         .byte      3
      0099C0 53 45 45              4162         .ascii     "SEE"
      0099C3                       4163 SEE:
      0099C3 CD 94 62         [ 4] 4164         CALL     TICK    ;starting address
      0099C6 CD 8F 2B         [ 4] 4165         CALL     CR
      0099C9 CD 8A 65         [ 4] 4166         CALL     ONEM
      0099CC CD 8A 58         [ 4] 4167 SEE1:   CALL     ONEP
      0099CF CD 85 63         [ 4] 4168         CALL     DUPP
      0099D2 CD 84 BC         [ 4] 4169         CALL     AT
      0099D5 CD 85 63         [ 4] 4170         CALL     DUPP    ;?does it contain a zero
      0099D8 CD 84 67         [ 4] 4171         CALL     QBRAN
      0099DB 99 E0                 4172         .word    SEE2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



      0099DD CD 99 68         [ 4] 4173         CALL     TNAME   ;?is it a name
      0099E0 CD 87 0D         [ 4] 4174 SEE2:   CALL     QDUP    ;name address or zero
      0099E3 CD 84 67         [ 4] 4175         CALL     QBRAN
      0099E6 99 F3                 4176         .word    SEE3
      0099E8 CD 8E E3         [ 4] 4177         CALL     SPACE
      0099EB CD 99 9B         [ 4] 4178         CALL     DOTID   ;display name
      0099EE CD 8A 58         [ 4] 4179         CALL     ONEP
      0099F1 20 09            [ 2] 4180         JRA      SEE4
      0099F3 CD 85 63         [ 4] 4181 SEE3:   CALL     DUPP
      0099F6 CD 84 DA         [ 4] 4182         CALL     CAT
      0099F9 CD 8F B3         [ 4] 4183         CALL     UDOT    ;display number
      0099FC CD 8E C1         [ 4] 4184 SEE4:   CALL     NUFQ    ;user control
      0099FF CD 84 67         [ 4] 4185         CALL     QBRAN
      009A02 99 CC                 4186         .word    SEE1
      009A04 CC 85 59         [ 2] 4187         JP     DROP
                                   4188 .endif ; WANT_SEE 
                                   4189 
                                   4190 ;       WORDS   ( -- )
                                   4191 ;       Display names in vocabulary.
      009A07 99 BF                 4192         .word      LINK
                           001989  4193 LINK = . 
      009A09 05                    4194         .byte      5
      009A0A 57 4F 52 44 53        4195         .ascii     "WORDS"
      009A0F                       4196 WORDS:
      009A0F CD 8F 2B         [ 4] 4197         CALL     CR
      009A12 CD 86 A3         [ 4] 4198         CALL     CNTXT   ;only in context
      009A15 CD 84 BC         [ 4] 4199 WORS1:  CALL     AT
      009A18 CD 87 0D         [ 4] 4200         CALL     QDUP    ;?at end of list
      009A1B CD 84 67         [ 4] 4201         CALL     QBRAN
      009A1E 9A 31                 4202         .word      WORS2
      009A20 CD 85 63         [ 4] 4203         CALL     DUPP
      009A23 CD 8E E3         [ 4] 4204         CALL     SPACE
      009A26 CD 99 9B         [ 4] 4205         CALL     DOTID   ;display a name
      009A29 CD 8A 3C         [ 4] 4206         CALL     CELLM
      009A2C CD 84 7E         [ 4] 4207         CALL     BRAN
      009A2F 9A 15                 4208         .word      WORS1
      009A31 81               [ 4] 4209 WORS2:  RET
                                   4210 
                                   4211         
                                   4212 ;; Hardware reset
                                   4213 
                                   4214 ;       hi      ( -- )
                                   4215 ;       Display sign-on message.
      009A32 9A 09                 4216         .word      LINK
                           0019B4  4217 LINK = . 
      009A34 02                    4218         .byte      2
      009A35 68 69                 4219         .ascii     "hi"
      009A37                       4220 HI:
      009A37 CD 8F 2B         [ 4] 4221         CALL     CR
      009A3A CD 8F 6A         [ 4] 4222         CALL     DOTQP   ;initialize I/O
      009A3D 0F                    4223         .byte      15
      009A3E 73 74 6D 38 65 46 6F  4224         .ascii     "stm8eForth v"
             72 74 68 20 76
      009A4A 33                    4225 	.byte      VER+'0'
      009A4B 2E                    4226         .byte      '.' 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



      009A4C 30                    4227 	.byte      EXT+'0' ;version
      009A4D CC 8F 2B         [ 2] 4228         JP     CR
                                   4229 
                           000000  4230 WANT_DEBUG=0
                           000000  4231 .if WANT_DEBUG 
                                   4232 ;       DEBUG      ( -- )
                                   4233 ;       Display sign-on message.
                                   4234 ;        .word      LINK
                                   4235 LINK = . 
                                   4236         .byte      5
                                   4237         .ascii     "DEBUG"
                                   4238 DEBUG:
                                   4239 	CALL DOLIT
                                   4240 	.word 0x65
                                   4241 	CALL EMIT
                                   4242 	CALL DOLIT
                                   4243 	.word 0
                                   4244  	CALL ZLESS 
                                   4245 	CALL DOLIT
                                   4246 	.word 0xFFFE
                                   4247 	CALL ZLESS 
                                   4248 	CALL UPLUS 
                                   4249  	CALL DROP 
                                   4250 	CALL DOLIT
                                   4251 	.word 3
                                   4252 	CALL UPLUS 
                                   4253 	CALL UPLUS 
                                   4254  	CALL DROP
                                   4255 	CALL DOLIT
                                   4256 	.word 0x43
                                   4257 	CALL UPLUS 
                                   4258  	CALL DROP
                                   4259 	CALL EMIT
                                   4260 	CALL DOLIT
                                   4261 	.word 0x4F
                                   4262 	CALL DOLIT
                                   4263 	.word 0x6F
                                   4264  	CALL XORR
                                   4265 	CALL DOLIT
                                   4266 	.word 0xF0
                                   4267  	CALL ANDD
                                   4268 	CALL DOLIT
                                   4269 	.word 0x4F
                                   4270  	CALL ORR
                                   4271 	CALL EMIT
                                   4272 	CALL DOLIT
                                   4273 	.word 8
                                   4274 	CALL DOLIT
                                   4275 	.word 6
                                   4276  	CALL SWAPP
                                   4277 	CALL OVER
                                   4278 	CALL XORR
                                   4279 	CALL DOLIT
                                   4280 	.word 3
                                   4281 	CALL ANDD 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



                                   4282 	CALL ANDD
                                   4283 	CALL DOLIT
                                   4284 	.word 0x70
                                   4285 	CALL UPLUS 
                                   4286 	CALL DROP
                                   4287 	CALL EMIT
                                   4288 	CALL DOLIT
                                   4289 	.word 0
                                   4290 	CALL QBRAN
                                   4291 	.word DEBUG1
                                   4292 	CALL DOLIT
                                   4293 	.word 0x3F
                                   4294 DEBUG1:
                                   4295 	CALL DOLIT
                                   4296 	.word 0xFFFF
                                   4297 	CALL QBRAN
                                   4298 	.word DEBUG2
                                   4299 	CALL DOLIT
                                   4300 	.word 0x74
                                   4301 	CALL BRAN
                                   4302 	.word DEBUG3
                                   4303 DEBUG2:
                                   4304 	CALL DOLIT
                                   4305 	.word 0x21
                                   4306 DEBUG3:
                                   4307 	CALL EMIT
                                   4308 	CALL DOLIT
                                   4309 	.word 0x68
                                   4310 	CALL DOLIT
                                   4311 	.word 0x80
                                   4312 	CALL STORE
                                   4313 	CALL DOLIT
                                   4314 	.word 0x80
                                   4315 	CALL AT
                                   4316 	CALL EMIT
                                   4317 	CALL DOLIT
                                   4318 	.word 0x4D
                                   4319 	CALL TOR
                                   4320 	CALL RAT
                                   4321 	CALL RFROM
                                   4322 	CALL ANDD
                                   4323 	CALL EMIT
                                   4324 	CALL DOLIT
                                   4325 	.word 0x61
                                   4326 	CALL DOLIT
                                   4327 	.word 0xA
                                   4328 	CALL TOR
                                   4329 DEBUG4:
                                   4330 	CALL DOLIT
                                   4331 	.word 1
                                   4332 	CALL UPLUS 
                                   4333 	CALL DROP
                                   4334 	CALL DONXT
                                   4335 	.word DEBUG4
                                   4336 	CALL EMIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



                                   4337 	CALL DOLIT
                                   4338 	.word 0x656D
                                   4339 	CALL DOLIT
                                   4340 	.word 0x100
                                   4341 	CALL UMSTA
                                   4342 	CALL SWAPP
                                   4343 	CALL DOLIT
                                   4344 	.word 0x100
                                   4345 	CALL UMSTA
                                   4346 	CALL SWAPP 
                                   4347 	CALL DROP
                                   4348 	CALL EMIT
                                   4349 	CALL EMIT
                                   4350 	CALL DOLIT
                                   4351 	.word 0x2043
                                   4352 	CALL DOLIT
                                   4353 	.word 0
                                   4354 	CALL DOLIT
                                   4355 	.word 0x100
                                   4356 	CALL UMMOD
                                   4357 	CALL EMIT
                                   4358 	CALL EMIT
                                   4359 	;JP ORIG
                                   4360 	RET
                                   4361 .endif ; WANT_DEBUG 
                                   4362 
                                   4363 
                                   4364 ;       'BOOT   ( -- a )
                                   4365 ;       The application startup vector.
      009A50 9A 34                 4366         .word      LINK
                           0019D2  4367 LINK = . 
      009A52 05                    4368         .byte      5
      009A53 27 42 4F 4F 54        4369         .ascii     "'BOOT"
      009A58                       4370 TBOOT:
      009A58 CD 86 10         [ 4] 4371         CALL     DOVAR
      009A5B 40 02                 4372         .word    APP_RUN      ;application to boot
                                   4373 
                                   4374 ;       COLD    ( -- )
                                   4375 ;       The hilevel cold start s=ence.
      009A5D 9A 52                 4376         .word      LINK
                           0019DF  4377         LINK = . 
      009A5F 04                    4378         .byte      4
      009A60 43 4F 4C 44           4379         .ascii     "COLD"
      009A64                       4380 COLD:
                           000000  4381 .if WANT_DEBUG
                                   4382         CALL DEBUG
                                   4383 .endif ; WANT_DEBUG
      009A64 CD 84 34         [ 4] 4384 COLD1:  CALL     DOLIT
      009A67 80 AB                 4385         .word      UZERO
      009A69 CD 84 34         [ 4] 4386 	CALL     DOLIT
      009A6C 00 06                 4387         .word      UPP
      009A6E CD 84 34         [ 4] 4388         CALL     DOLIT
      009A71 00 1A                 4389 	.word      UEND-UZERO
      009A73 CD 8B FF         [ 4] 4390         CALL     CMOVE   ;initialize user area
                                   4391 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



                                   4392 ; if APP_RUN==0 initialize with ca de 'hi'  
      009A76 90 CE 40 02      [ 2] 4393         ldw y,APP_RUN 
      009A7A 26 0B            [ 1] 4394         jrne 0$
      009A7C 1D 00 02         [ 2] 4395         subw x,#CELLL 
      009A7F 90 AE 9A 37      [ 2] 4396         ldw y,#HI  
      009A83 FF               [ 2] 4397         ldw (x),y
      009A84 CD 9C 30         [ 4] 4398         call UPDATRUN 
      009A87                       4399 0$:        
                                   4400 ; update LAST with APP_LAST 
                                   4401 ; if APP_LAST > LAST else do the opposite
      009A87 90 CE 40 00      [ 2] 4402         ldw y,APP_LAST 
      009A8B 90 B3 1A         [ 2] 4403         cpw y,ULAST 
      009A8E 22 05            [ 1] 4404         jrugt 1$ 
                                   4405 ; save LAST at APP_LAST  
      009A90 CD 9C 18         [ 4] 4406         call UPDATLAST 
      009A93 20 06            [ 2] 4407         jra 2$
      009A95                       4408 1$: ; update LAST with APP_LAST 
      009A95 90 BF 1A         [ 2] 4409         ldw ULAST,y
      009A98 90 BF 14         [ 2] 4410         ldw UCNTXT,y
      009A9B                       4411 2$:  
                                   4412 ; update APP_CP if < app_space 
      009A9B 90 CE 40 04      [ 2] 4413         ldw y,APP_CP  
      009A9F 90 B3 18         [ 2] 4414         cpw y,UCP   
      009AA2 24 06            [ 1] 4415         jruge 3$ 
      009AA4 CD 9C 41         [ 4] 4416         call UPDATCP
      009AA7 90 BE 18         [ 2] 4417         ldw y,UCP   
      009AAA                       4418 3$:
      009AAA 90 BF 18         [ 2] 4419         ldw UCP,y                 
                                   4420 ; update UVP with APP_VP  
                                   4421 ; if APP_VP>UVP else do the opposite 
      009AAD 90 CE 40 06      [ 2] 4422         ldw y,APP_VP 
      009AB1 90 B3 16         [ 2] 4423         cpw y,UVP 
      009AB4 22 05            [ 1] 4424         jrugt 4$
      009AB6 CD 9C 58         [ 4] 4425         call UPDATVP 
      009AB9 20 03            [ 2] 4426         jra 6$
      009ABB                       4427 4$: ; update UVP with APP_VP 
      009ABB 90 BF 16         [ 2] 4428         ldw UVP,y 
      009ABE                       4429 6$:      
      009ABE CD 94 2E         [ 4] 4430         CALL     PRESE   ;initialize data stack and TIB
      009AC1 CD 9A 58         [ 4] 4431         CALL     TBOOT
      009AC4 CD 8B E8         [ 4] 4432         CALL     ATEXE   ;application boot
      009AC7 CD 96 F7         [ 4] 4433         CALL     OVERT
      009ACA CC 94 4B         [ 2] 4434         JP     QUIT    ;start interpretation
                                   4435 
                           000001  4436 WANT_MATH_CONST = 1 
                           000001  4437 .if WANT_MATH_CONST 
                                   4438         ; irrational constants 
                                   4439         ; approximation by integers ratio.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



                                   4440         .include "const_ratio.asm"
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
      009ACD 9A 5F                   31         .word LINK 
                           001A4F    32         LINK=.
      009ACF 02                      33         .byte 2
      009AD0 50 49                   34         .ascii "PI" 
      009AD2                         35 PII:
      009AD2 1D 00 04         [ 2]   36         subw x,#2*CELLL 
      009AD5 90 AE 01 63      [ 2]   37         ldw y,#355 
      009AD9 EF 02            [ 2]   38         ldw (2,x),y 
      009ADB 90 AE 00 71      [ 2]   39         ldw y,#113 
      009ADF FF               [ 2]   40         ldw (x),y 
      009AE0 81               [ 4]   41         ret 
                                     42 
                                     43 ;      SQRT2 ( -- 19601  13860 )
                                     44 ; precision: 1.5e-9 
                                     45 ; usage example to compute Voltage peek to peek from Vrms 
                                     46 ; : VPP SQRT2 */ 2 * ;
                                     47 ;
      009AE1 9A CF                   48         .word LINK 
                           001A63    49         LINK=.
      009AE3 05                      50         .byte 5 
      009AE4 53 51 52 54 32          51         .ascii "SQRT2" 
      009AE9                         52 SQRT2:
      009AE9 1D 00 04         [ 2]   53         subw x,#2*CELLL 
      009AEC 90 AE 4C 91      [ 2]   54         ldw y,#19601 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



      009AF0 EF 02            [ 2]   55         ldw (2,x),y 
      009AF2 90 AE 36 24      [ 2]   56         ldw y,#13860 
      009AF6 FF               [ 2]   57         ldw (x),y 
      009AF7 81               [ 4]   58         ret 
                                     59 
                                     60 ;   SQRT3 ( -- 18817 10864 )
                                     61 ; precision: 1.1e-9
                                     62 ;
      009AF8 9A E3                   63         .word LINK 
                           001A7A    64         LINK=.
      009AFA 05                      65         .byte 5
      009AFB 53 51 52 54 33          66         .ascii "SQRT3" 
      009B00                         67 SQRT3: 
      009B00 1D 00 04         [ 2]   68     subw x,#2*CELLL 
      009B03 90 AE 49 81      [ 2]   69     ldw y,#18817 
      009B07 EF 02            [ 2]   70     ldw (2,x),y 
      009B09 90 AE 2A 70      [ 2]   71     ldw y,#10864 
      009B0D FF               [ 2]   72     ldw (x),y 
      009B0E 81               [ 4]   73     ret 
                                     74 
                                     75 ;   E ( -- 28667 10546 )
                                     76 ; precision: 5.5e-9 
                                     77 ; natural log base 
      009B0F 9A FA                   78         .word LINK 
                           001A91    79         LINK=.
      009B11 01                      80         .byte 1
      009B12 45                      81         .ascii "E" 
      009B13                         82 ENEPER:
      009B13 1D 00 04         [ 2]   83     subw x,#2*CELLL 
      009B16 90 AE 6F FB      [ 2]   84     ldw y,#28667 
      009B1A EF 02            [ 2]   85     ldw (2,x),y 
      009B1C 90 AE 29 32      [ 2]   86     ldw y,#10546 
      009B20 FF               [ 2]   87     ldw (x),y 
      009B21 81               [ 4]   88     ret 
                                     89 
                                     90 ;   SQRT10 ( -- 22936 7253 )
                                     91 ; precision: 5.7e-9 
      009B22 9B 11                   92         .word LINK 
                           001AA4    93         LINK=.
      009B24 06                      94         .byte 6 
      009B25 53 51 52 54 31 30       95         .ascii "SQRT10" 
      009B2B                         96 SQRT10:
      009B2B 1D 00 04         [ 2]   97     subw x,#2*CELLL
      009B2E 90 AE 59 98      [ 2]   98     ldw y,#22936 
      009B32 EF 02            [ 2]   99     ldw (2,x),y 
      009B34 90 AE 1C 55      [ 2]  100     ldw y,#7253
      009B38 FF               [ 2]  101     ldw (x),y 
      009B39 81               [ 4]  102     ret 
                                    103 
                                    104 ;   SQRT12 ( -- 26797 25293 )
                                    105 ; precision: 1.0e-9 
                                    106 ; used in music to compute well tempered scale
      009B3A 9B 24                  107         .word LINK 
                           001ABC   108         LINK=. 
      009B3C 05                     109         .byte 5 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



      009B3D 31 32 52 54 32         110         .ascii "12RT2"
      009B42                        111 RT12_2:
      009B42 1D 00 04         [ 2]  112     subw x,#2*CELLL 
      009B45 90 AE 68 AD      [ 2]  113     ldw y,#26797
      009B49 EF 02            [ 2]  114     ldw (2,x),y 
      009B4B 90 AE 62 CD      [ 2]  115     ldw y,#25293
      009B4F FF               [ 2]  116     ldw (x),y 
      009B50 81               [ 4]  117     ret 
                                    118 
                                    119 ;   LOG2s ( -- 2040 11103 )
                                    120 ; log(2)/1.6384
                                    121 ; precision: 1.1e-8
      009B51 9B 3C                  122         .word LINK 
                           001AD3   123         LINK=.
      009B53 05                     124         .byte 5 
      009B54 4C 4F 47 32 53         125         .ascii "LOG2S" 
      009B59                        126 LOG2S:
      009B59 1D 00 04         [ 2]  127     subw x,#2*CELLL
      009B5C 90 AE 07 F8      [ 2]  128     ldw y,#2040 
      009B60 EF 02            [ 2]  129     ldw (2,x),y 
      009B62 90 AE 2B 5F      [ 2]  130     ldw y,#11103 
      009B66 FF               [ 2]  131     ldw (x),y 
      009B67 81               [ 4]  132     ret 
                                    133 
                                    134 ;   LN2 ( -- 485 11464 )
                                    135 ; ln(2)/16.384 
                                    136 ; precision: 1.0e-7 
      009B68 9B 53                  137         .word LINK 
                           001AEA   138         LINK=.
      009B6A 04                     139         .byte 4 
      009B6B 4C 4E 32 53            140         .ascii "LN2S" 
      009B6F                        141 LN2S: 
      009B6F 1D 00 04         [ 2]  142     subw x,#2*CELLL
      009B72 90 AE 01 E5      [ 2]  143     ldw y,#485
      009B76 EF 02            [ 2]  144     ldw (2,x),y 
      009B78 90 AE 2C C8      [ 2]  145     ldw y,#11464 
      009B7C FF               [ 2]  146     ldw (x),y 
      009B7D 81               [ 4]  147     ret 
                                    148 
                                    149 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



                                   4441 .endif ; WANT_MATH_CONST
                                   4442 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



                                   4443         .include "flash.asm"
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
      009B7E 9B 6A                   30     .word LINK 
                           001B00    31     LINK=.
      009B80 03                      32     .byte 3 
      009B81 46 50 21                33     .ascii "FP!"
      009B84                         34 fptr_store:
      009B84 90 93            [ 1]   35     ldw y,x
      009B86 90 FE            [ 2]   36     ldw y,(y)
      009B88 90 9F            [ 1]   37     ld a,yl 
      009B8A B7 32            [ 1]   38     ld FPTR,a 
      009B8C 1C 00 02         [ 2]   39     addw x,#CELLL 
      009B8F 90 93            [ 1]   40     ldw y,x 
      009B91 90 FE            [ 2]   41     ldw y,(y)
      009B93 90 BF 33         [ 2]   42     ldw PTR16,y
      009B96 1C 00 02         [ 2]   43     addw x,#CELLL 
      009B99 81               [ 4]   44     ret 
                                     45 
                                     46 ;-----------------------------------
                                     47 ; return EEPROM base address 
                                     48 ; as a double 
                                     49 ;  EEPROM  ( -- ud )
                                     50 ;-----------------------------------
      009B9A 9B 80                   51     .word LINK 
                           001B1C    52 LINK=.
      009B9C 06                      53     .byte 6 
      009B9D 45 45 50 52 4F 4D       54     .ascii "EEPROM"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



      009BA3                         55 EEPROM: 
      009BA3 90 AE 40 00      [ 2]   56     ldw y,#EEPROM_BASE
      009BA7 1D 00 04         [ 2]   57     subw x,#2*CELLL 
      009BAA EF 02            [ 2]   58     ldw (2,x),y 
      009BAC 90 5F            [ 1]   59     clrw y 
      009BAE FF               [ 2]   60     ldw (x),y 
      009BAF 81               [ 4]   61     ret
                                     62 
                                     63 ;---------------------------------
                                     64 ; return APP_LAST pointer as double
                                     65 ; EEP-LAST ( -- ud )
                                     66 ;---------------------------------
      009BB0 9B 9C                   67 	.word LINK 
                           001B32    68 	LINK=.
      009BB2 08                      69 	.byte 8 
      009BB3 45 45 50 2D 4C 41 53    70 	.ascii "EEP-LAST"
             54
      009BBB                         71 EEPLAST:
      009BBB 1D 00 04         [ 2]   72 	subw x,#2*CELLL 
      009BBE 90 AE 40 00      [ 2]   73 	ldw y,#APP_LAST 
      009BC2 EF 02            [ 2]   74 	ldw (2,x),y 
      009BC4 90 5F            [ 1]   75 	clrw y 
      009BC6 FF               [ 2]   76 	ldw (x),y 
      009BC7 81               [ 4]   77 	ret 
                                     78 
                                     79 ;----------------------------------
                                     80 ; return APP_RUN pointer as double	
                                     81 ; EEP-RUN ( -- ud )
                                     82 ;-----------------------------------
      009BC8 9B B2                   83 	.word LINK 
                           001B4A    84 	LINK=.
      009BCA 07                      85 	.byte 7
      009BCB 45 45 50 2D 52 55 4E    86 	.ascii "EEP-RUN"
      009BD2                         87 EEPRUN:
      009BD2 1D 00 04         [ 2]   88 	subw x,#2*CELLL 
      009BD5 90 AE 40 02      [ 2]   89 	ldw y,#APP_RUN 
      009BD9 EF 02            [ 2]   90 	ldw (2,x),y 
      009BDB 90 5F            [ 1]   91 	clrw y 
      009BDD FF               [ 2]   92 	ldw (x),y 
      009BDE 81               [ 4]   93 	ret 
                                     94 
                                     95 ;------------------------------------
                                     96 ; return APP_CP pointer as double 
                                     97 ; EEP-CP ( -- ud )
                                     98 ;------------------------------------
      009BDF 9B CA                   99 	.word LINK
                           001B61   100 	LINK=.
      009BE1 06                     101 	.byte 6 
      009BE2 45 45 50 2D 43 50      102 	.ascii "EEP-CP"
      009BE8                        103 EEPCP:
      009BE8 1D 00 04         [ 2]  104 	subw x,#2*CELLL 
      009BEB 90 AE 40 04      [ 2]  105 	ldw y,#APP_CP  
      009BEF EF 02            [ 2]  106 	ldw (2,x),y 
      009BF1 90 5F            [ 1]  107 	clrw y 
      009BF3 FF               [ 2]  108 	ldw (x),y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



      009BF4 81               [ 4]  109 	ret 
                                    110 
                                    111 ;------------------------------------
                                    112 ; return APP_VP pointer as double 
                                    113 ; EEP-VP ( -- ud )
                                    114 ;-------------------------------------
      009BF5 9B E1                  115 	.word LINK
                           001B77   116 	LINK=.
      009BF7 06                     117 	.byte 6
      009BF8 45 45 50 2D 56 50      118 	.ascii "EEP-VP"
      009BFE                        119 EEPVP:
      009BFE 1D 00 04         [ 2]  120 	subw x,#2*CELLL 
      009C01 90 AE 40 06      [ 2]  121 	ldw y,#APP_VP  
      009C05 EF 02            [ 2]  122 	ldw (2,x),y 
      009C07 90 5F            [ 1]  123 	clrw y 
      009C09 FF               [ 2]  124 	ldw (x),y 
      009C0A 81               [ 4]  125 	ret 
                                    126 
                                    127 ;----------------------------------
                                    128 ; update APP_LAST with LAST 
                                    129 ; UPDAT-LAST ( -- )
                                    130 ;----------------------------------
      009C0B 9B F7                  131 	.word LINK 
                           001B8D   132 	LINK=.
      009C0D 0A                     133 	.byte 10
      009C0E 55 50 44 41 54 2D 4C   134 	.ascii "UPDAT-LAST"
             41 53 54
      009C18                        135 UPDATLAST:
      009C18 CD 86 CF         [ 4]  136 	call LAST
      009C1B CD 84 BC         [ 4]  137 	call AT  
      009C1E CD 9B BB         [ 4]  138 	call EEPLAST
      009C21 CC 9D 94         [ 2]  139 	jp ee_store 
                                    140 
                                    141 ;---------------------------------
                                    142 ; update APP_RUN 
                                    143 ; UPDAT-RUN ( a -- )
                                    144 ;---------------------------------
      009C24 9C 0D                  145 	.word LINK
                           001BA6   146 	LINK=.
      009C26 09                     147 	.byte 9
      009C27 55 50 44 41 54 2D 52   148 	.ascii "UPDAT-RUN"
             55 4E
      009C30                        149 UPDATRUN:
      009C30 CD 9B D2         [ 4]  150 	call EEPRUN
      009C33 CC 9D 94         [ 2]  151 	jp ee_store 
                                    152 	
                                    153 ;---------------------------------
                                    154 ; update APP_CP with CP 
                                    155 ; UPDAT-CP ( -- )
                                    156 ;---------------------------------
      009C36 9C 26                  157 	.word LINK 
                           001BB8   158 	LINK=.
      009C38 08                     159 	.byte 8 
      009C39 55 50 44 41 54 2D 43   160 	.ascii "UPDAT-CP"
             50
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      009C41                        161 UPDATCP:
      009C41 CD 86 BF         [ 4]  162 	call CPP 
      009C44 CD 84 BC         [ 4]  163 	call AT 
      009C47 CD 9B E8         [ 4]  164 	call EEPCP 
      009C4A CC 9D 94         [ 2]  165 	jp ee_store 
                                    166 
                                    167 ;----------------------------------
                                    168 ; update APP_VP with VP 
                                    169 ; UPDAT-VP ( -- )
                                    170 ;----------------------------------
      009C4D 9C 38                  171 	.word LINK
                           001BCF   172 	LINK=.
      009C4F 08                     173 	.byte 8 
      009C50 55 50 44 41 54 2D 56   174 	.ascii "UPDAT-VP" 
             50
      009C58                        175 UPDATVP:
      009C58 CD 86 B1         [ 4]  176 	call VPP 
      009C5B CD 84 BC         [ 4]  177 	call AT
      009C5E CD 9B FE         [ 4]  178 	call EEPVP 
      009C61 CC 9D 94         [ 2]  179 	jp ee_store
                                    180 	
                                    181 
                                    182 ;----------------------------------
                                    183 ; fetch integer at address over 65535
                                    184 ;  F@   ( ud -- n )
                                    185 ;----------------------------------
      009C64 9C 4F                  186     .word LINK 
                           001BE6   187 LINK=.
      009C66 02                     188     .byte 2
      009C67 46 40                  189     .ascii "F@"
      009C69                        190 farat:
      009C69 CD 9B 84         [ 4]  191     call fptr_store
      009C6C 92 BC 00 32      [ 5]  192     ldf a,[FPTR]
      009C70 1D 00 02         [ 2]  193     subw x,#CELLL 
      009C73 F7               [ 1]  194     ld (x),a 
      009C74 90 AE 00 01      [ 2]  195     ldw y,#1
      009C78 91 AF 00 32      [ 1]  196     ldf a,([FPTR],y)
      009C7C E7 01            [ 1]  197     ld (1,x),a
      009C7E 81               [ 4]  198     ret 
                                    199 
                                    200 ;-------------------------------------
                                    201 ; fetch C at address over 65535 
                                    202 ; FC@ ( ud -- c)
                                    203 ;-------------------------------------
      009C7F 9C 66                  204     .word LINK
                           001C01   205     LINK=.
      009C81 03                     206     .byte 3 
      009C82 46 43 40               207     .ascii "FC@" 
      009C85                        208 farcat:
      009C85 CD 9B 84         [ 4]  209     call fptr_store 
      009C88 92 BC 00 32      [ 5]  210     ldf a,[FPTR]
      009C8C 1D 00 02         [ 2]  211     subw x,#CELLL 
      009C8F E7 01            [ 1]  212     ld (1,x),a 
      009C91 7F               [ 1]  213     clr (x)
      009C92 81               [ 4]  214     ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



                                    215     
                                    216 ;----------------------------------
                                    217 ; unlock EEPROM/OPT for writing/erasing
                                    218 ; wait endlessly for FLASH_IAPSR_DUL bit.
                                    219 ;  UNLKEE   ( -- )
                                    220 ;----------------------------------
      009C93 9C 81                  221     .word LINK 
                           001C15   222 LINK=.
      009C95 06                     223     .byte 6 
      009C96 55 4E 4C 4B 45 45      224     .ascii "UNLKEE"
      009C9C                        225 unlock_eeprom:
      009C9C 35 00 50 5B      [ 1]  226 	mov FLASH_CR2,#0 
      009CA0 35 FF 50 5C      [ 1]  227 	mov FLASH_NCR2,#0xFF 
      009CA4 35 AE 50 64      [ 1]  228 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      009CA8 35 56 50 64      [ 1]  229     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      009CAC 72 07 50 5F FB   [ 2]  230 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      009CB1 81               [ 4]  231 	ret
                                    232 
                                    233 ;----------------------------------
                                    234 ; unlock FLASH for writing/erasing
                                    235 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                    236 ; UNLKFL  ( -- )
                                    237 ;----------------------------------
      009CB2 9C 95                  238     .word LINK 
                           001C34   239 LINK=. 
      009CB4 06                     240     .byte 6 
      009CB5 55 4E 4C 4B 46 4C      241     .ascii "UNLKFL"    
      009CBB                        242 unlock_flash:
      009CBB 35 00 50 5B      [ 1]  243 	mov FLASH_CR2,#0 
      009CBF 35 FF 50 5C      [ 1]  244 	mov FLASH_NCR2,#0xFF 
      009CC3 35 56 50 62      [ 1]  245 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      009CC7 35 AE 50 62      [ 1]  246 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      009CCB 72 03 50 5F FB   [ 2]  247 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      009CD0 81               [ 4]  248 	ret
                                    249 
                                    250 ;-----------------------------
                                    251 ; unlock FLASH or EEPROM 
                                    252 ; according to FPTR address 
                                    253 ;  UNLOCK ( -- )
                                    254 ;-----------------------------
      009CD1 9C B4                  255 	.word LINK 
                           001C53   256 	LINK=.
      009CD3 06                     257 	.byte 6
      009CD4 55 4E 4C 4F 43 4B      258 	.ascii "UNLOCK"
      009CDA                        259 unlock:
                                    260 ; put addr[15:0] in Y, for bounds check.
      009CDA 90 BE 33         [ 2]  261 	ldw y,PTR16   ; Y=addr15:0
                                    262 ; check addr[23:16], if <> 0 then it is extened flash memory
      009CDD 3D 32            [ 1]  263 	tnz FPTR 
      009CDF 26 16            [ 1]  264 	jrne 4$
      009CE1 90 A3 80 00      [ 2]  265     cpw y,#FLASH_BASE
      009CE5 24 10            [ 1]  266     jruge 4$
      009CE7 90 A3 40 00      [ 2]  267 	cpw y,#EEPROM_BASE  
      009CEB 25 0D            [ 1]  268     jrult 9$
      009CED 90 A3 48 7F      [ 2]  269 	cpw y,#OPTION_END 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



      009CF1 22 07            [ 1]  270 	jrugt 9$
      009CF3 CD 9C 9C         [ 4]  271 	call unlock_eeprom
      009CF6 81               [ 4]  272 	ret 
      009CF7 CD 9C BB         [ 4]  273 4$: call unlock_flash
      009CFA 81               [ 4]  274 9$: ret 
                                    275 
                                    276 ;-------------------------
                                    277 ; lock write access to 
                                    278 ; FLASH and EEPROM 
                                    279 ; LOCK ( -- )
                                    280 ;-------------------------
      009CFB 9C D3                  281 	.word LINK 
                           001C7D   282 	LINK=.
      009CFD 04                     283 	.byte 4 
      009CFE 4C 4F 43 4B            284 	.ascii "LOCK" 
      009D02                        285 lock: 
      009D02 72 13 50 5F      [ 1]  286 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      009D06 72 17 50 5F      [ 1]  287 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009D0A 81               [ 4]  288 	ret 
                                    289 
                                    290 ;-------------------------
                                    291 ; increment FPTR 
                                    292 ; INC-FPTR ( -- )
                                    293 ;-------------------------
      009D0B 9C FD                  294 	.word LINK 
                           001C8D   295 	LINK=. 
      009D0D 08                     296 	.byte 8 
      009D0E 49 4E 43 2D 46 50 54   297 	.ascii "INC-FPTR" 
             52
      009D16                        298 inc_fptr:
      009D16 3C 34            [ 1]  299 	inc PTR8 
      009D18 26 08            [ 1]  300 	jrne 1$
      009D1A 90 BE 32         [ 2]  301 	ldw y,FPTR 
      009D1D 90 5C            [ 2]  302 	incw y 
      009D1F 90 BF 32         [ 2]  303 	ldw FPTR,y 
      009D22 81               [ 4]  304 1$: ret 
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
      009D23 9D 0D                  315 	.word LINK 
                           001CA5   316 	LINK=. 
      009D25 07                     317 	.byte 7 
      009D26 57 52 2D 42 59 54 45   318 	.ascii "WR-BYTE" 
                                    319 
      009D2D                        320 write_byte:
      009D2D 90 93            [ 1]  321 	ldw y,x 
      009D2F 90 FE            [ 2]  322 	ldw y,(y)
      009D31 1C 00 02         [ 2]  323 	addw x,#CELLL 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      009D34 90 9F            [ 1]  324 	ld a,yl
      009D36 92 BD 00 32      [ 4]  325 	ldf [FPTR],a
      009D3A 72 05 50 5F FB   [ 2]  326 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009D3F 20 D5            [ 2]  327 	jra inc_fptr 
                                    328 
                                    329 
                                    330 
                                    331 ;---------------------------------------
                                    332 ; write a byte to FLASH or EEPROM/OPTION  
                                    333 ; EEC!  (c ud -- )
                                    334 ;---------------------------------------
      009D41 9D 25                  335     .word LINK 
                           001CC3   336 	LINK=.
      009D43 04                     337     .byte 4 
      009D44 45 45 43 21            338     .ascii "EEC!"
                                    339 	; local variables 
                           000001   340 	BTW = 1   ; byte to write offset on stack
                           000002   341     OPT = 2 
                           000002   342 	VSIZE = 2
      009D48                        343 ee_cstore:
      009D48 52 02            [ 2]  344 	sub sp,#VSIZE
      009D4A CD 9B 84         [ 4]  345     call fptr_store
      009D4D E6 01            [ 1]  346 	ld a,(1,x)
      009D4F 43               [ 1]  347 	cpl a 
      009D50 6B 01            [ 1]  348 	ld (BTW,sp),a ; byte to write 
      009D52 0F 02            [ 1]  349 	clr (OPT,sp)  ; OPTION flag
      009D54 CD 9C DA         [ 4]  350 	call unlock 
                                    351 	; check if option
      009D57 3D 32            [ 1]  352 	tnz FPTR 
      009D59 26 19            [ 1]  353 	jrne 2$
      009D5B 90 BE 33         [ 2]  354 	ldw y,PTR16 
      009D5E 90 A3 48 00      [ 2]  355 	cpw y,#OPTION_BASE
      009D62 2B 10            [ 1]  356 	jrmi 2$
      009D64 90 A3 48 80      [ 2]  357 	cpw y,#OPTION_END+1
      009D68 2A 0A            [ 1]  358 	jrpl 2$
      009D6A 03 02            [ 1]  359 	cpl (OPT,sp)
                                    360 	; OPTION WRITE require this unlock 
      009D6C 72 1E 50 5B      [ 1]  361     bset FLASH_CR2,#FLASH_CR2_OPT
      009D70 72 1F 50 5C      [ 1]  362     bres FLASH_NCR2,#FLASH_CR2_OPT 
      009D74                        363 2$: 
      009D74 CD 9D 2D         [ 4]  364 	call write_byte 	
      009D77 0D 02            [ 1]  365 	tnz (OPT,sp)
      009D79 27 0D            [ 1]  366 	jreq 3$ 
      009D7B 7B 01            [ 1]  367     ld a,(BTW,sp)
      009D7D 90 5F            [ 1]  368     clrw y
      009D7F 90 97            [ 1]  369 	ld yl,a 
      009D81 1D 00 02         [ 2]  370 	subw x,#CELLL 
      009D84 FF               [ 2]  371 	ldw (x),y 
      009D85 CD 9D 2D         [ 4]  372 	call write_byte
      009D88                        373 3$: 
      009D88 CD 9D 02         [ 4]  374 	call lock 
      009D8B 5B 02            [ 2]  375 	addw sp,#VSIZE 
      009D8D 81               [ 4]  376     ret
                                    377 
                                    378 ;------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



                                    379 ; write integer in FLASH|EEPROM
                                    380 ; EE! ( n ud -- )
                                    381 ;------------------------------
      009D8E 9D 43                  382 	.word LINK 
                           001D10   383 	LINK=.
      009D90 03                     384 	.byte 3 
      009D91 45 45 21               385 	.ascii "EE!"
      009D94                        386 ee_store:
      009D94 CD 9B 84         [ 4]  387 	call fptr_store 
      009D97 CD 9C DA         [ 4]  388 	call unlock 
      009D9A 90 93            [ 1]  389 	ldw y,x 
      009D9C 90 FE            [ 2]  390 	ldw y,(y)
      009D9E 90 89            [ 2]  391 	pushw y 
      009DA0 90 5E            [ 1]  392 	swapw y 
      009DA2 FF               [ 2]  393 	ldw (x),y 
      009DA3 CD 9D 2D         [ 4]  394 	call write_byte 
      009DA6 90 85            [ 2]  395 	popw y 
      009DA8 1D 00 02         [ 2]  396 	subw x,#CELLL
      009DAB FF               [ 2]  397 	ldw (x),y 
      009DAC CD 9D 2D         [ 4]  398 	call write_byte
      009DAF CC 9D 02         [ 2]  399 	jp lock 
                                    400 
                                    401 
                                    402 ;----------------------------
                                    403 ; Erase flash memory row 
                                    404 ; stm8s208 as 128 bytes rows
                                    405 ; ROW-ERASE ( ud -- )
                                    406 ;----------------------------
      009DB2 9D 90                  407 	.word LINK 
                           001D34   408 	LINK=. 
      009DB4 09                     409 	.byte 9 
      009DB5 52 4F 57 2D 45 52 41   410 	.ascii "ROW-ERASE" 
             53 45
      009DBE                        411 row_erase:
      009DBE CD 9B 84         [ 4]  412 	call fptr_store
                                    413 ;code must be execute from RAM 
                                    414 ;copy routine to PAD 
      009DC1 1D 00 02         [ 2]  415 	subw x,#CELLL 
      009DC4 90 AE 9E 0B      [ 2]  416 	ldw y,#row_erase_proc
      009DC8 FF               [ 2]  417 	ldw (x),y 
      009DC9 CD 8B C3         [ 4]  418 	call PAD 
      009DCC 90 AE 9E 32      [ 2]  419 	ldw y,#row_erase_proc_end 
      009DD0 72 A2 9E 0B      [ 2]  420 	subw y,#row_erase_proc
      009DD4 1D 00 02         [ 2]  421 	subw x,#CELLL 
      009DD7 FF               [ 2]  422 	ldw (x),y 
      009DD8 CD 8B FF         [ 4]  423 	call CMOVE 
      009DDB                        424 block_erase:
      009DDB 90 BE 33         [ 2]  425 	ldw y,FPTR+1
      009DDE 90 A3 A2 80      [ 2]  426 	cpw y,#app_space 
      009DE2 2A 13            [ 1]  427 	jrpl erase_flash 
                                    428 ; erase EEPROM block
      009DE4 90 A3 40 00      [ 2]  429 	cpw y,#EEPROM_BASE 
      009DE8 24 01            [ 1]  430 	jruge 1$
      009DEA 81               [ 4]  431 	ret ; bad address 
      009DEB 90 A3 47 FF      [ 2]  432 1$: cpw y,#EEPROM_END 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



      009DEF 23 01            [ 2]  433 	jrule 2$ 
      009DF1 81               [ 4]  434 	ret ; bad address 
      009DF2                        435 2$:	
      009DF2 CD 9C 9C         [ 4]  436 	call unlock_eeprom 
      009DF5 20 03            [ 2]  437 	jra proceed_erase
                                    438 ; erase flash block:
      009DF7                        439 erase_flash:
      009DF7 CD 9C BB         [ 4]  440 	call unlock_flash 
      009DFA                        441 proceed_erase:
      009DFA CD 8B C3         [ 4]  442 	call PAD 
      009DFD 90 93            [ 1]  443 	ldw y,x
      009DFF 90 FE            [ 2]  444 	ldw y,(y)
      009E01 1C 00 02         [ 2]  445 	addw x,#CELLL  
      009E04 90 FD            [ 4]  446 	call (y) 
      009E06 72 17 50 5F      [ 1]  447 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009E0A 81               [ 4]  448 	ret 
                                    449 
                                    450 ; this routine is to be copied to PAD 
      009E0B                        451 row_erase_proc:
      009E0B 35 20 50 5B      [ 1]  452 	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
      009E0F 35 DF 50 5C      [ 1]  453 	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
      009E13 4F               [ 1]  454 	clr a 
      009E14 90 5F            [ 1]  455 	clrw y 
      009E16 91 A7 00 32      [ 1]  456 	ldf ([FPTR],y),a
      009E1A 90 5C            [ 2]  457     incw y
      009E1C 91 A7 00 32      [ 1]  458 	ldf ([FPTR],y),a
      009E20 90 5C            [ 2]  459     incw y
      009E22 91 A7 00 32      [ 1]  460 	ldf ([FPTR],y),a
      009E26 90 5C            [ 2]  461     incw y
      009E28 91 A7 00 32      [ 1]  462 	ldf ([FPTR],y),a
      009E2C 72 05 50 5F FB   [ 2]  463 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009E31 81               [ 4]  464 	ret
      009E32                        465 row_erase_proc_end:
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
      009E32                        478 copy_buffer:
      009E32 4B 80            [ 1]  479 	push #BLOCK_SIZE  
                                    480 ;enable block programming 
      009E34 72 10 50 5B      [ 1]  481 	bset FLASH_CR2,#FLASH_CR2_PRG 
      009E38 72 11 50 5C      [ 1]  482 	bres FLASH_NCR2,#FLASH_CR2_PRG
      009E3C 90 5F            [ 1]  483 	clrw y
      009E3E F6               [ 1]  484 1$:	ld a,(x)
      009E3F 91 A7 00 32      [ 1]  485 	ldf ([FPTR],y),a
      009E43 5C               [ 2]  486 	incw x 
      009E44 90 5C            [ 2]  487 	incw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



      009E46 0A 01            [ 1]  488 	dec (BCNT,sp)
      009E48 26 F4            [ 1]  489 	jrne 1$
                                    490 ; wait EOP bit 
      009E4A 72 05 50 5F FB   [ 2]  491 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. 
      009E4F 84               [ 1]  492 	pop a ; remove BCNT from stack 
      009E50 81               [ 4]  493 	ret 
      009E51                        494 copy_buffer_end:
                                    495 
                                    496 ;-------------------------
                                    497 ; move program_row to RAM 
                                    498 ; in TIB 
                                    499 ;------------------------
      009E51                        500 copy_prog_to_ram:
      009E51 1D 00 06         [ 2]  501 	subw x,#6
      009E54 90 AE 9E 32      [ 2]  502 	ldw y,#copy_buffer 
      009E58 EF 04            [ 2]  503 	ldw (4,x),y 
      009E5A 90 AE 17 00      [ 2]  504 	ldw y,#TIBBASE
      009E5E EF 02            [ 2]  505 	ldw (2,x),y 
      009E60 90 AE 9E 51      [ 2]  506 	ldw y,#copy_buffer_end 
      009E64 72 A2 9E 32      [ 2]  507 	subw y,#copy_buffer  
      009E68 FF               [ 2]  508 	ldw (x),y 
      009E69 CD 8B FF         [ 4]  509 	call CMOVE 
      009E6C 81               [ 4]  510 	ret 
                                    511 
                                    512 
                                    513 ;-----------------------------
                                    514 ; write a row in FLASH/EEPROM 
                                    515 ; WR-ROW ( a ud -- )
                                    516 ; a -> address 128 byte buffer to write 
                                    517 ; ud ->  row address in FLASH|EEPROM 
                                    518 ;-----------------------------
      009E6D 9D B4                  519 	.word LINK 
                           001DEF   520 	LINK=.
      009E6F 06                     521 	.byte 6 
      009E70 57 52 2D 52 4F 57      522 	.ascii "WR-ROW"
      009E76                        523 write_row:
      009E76 CD 9B 84         [ 4]  524 	call fptr_store
                                    525 ; align to FLASH block 
      009E79 A6 80            [ 1]  526 	ld a,#0x80 
      009E7B B4 34            [ 1]  527 	and a,PTR8 
      009E7D B7 34            [ 1]  528 	ld PTR8,a  
      009E7F CD 9E 51         [ 4]  529 	call copy_prog_to_ram
      009E82 CD 9C DA         [ 4]  530 	call unlock
      009E85 90 93            [ 1]  531 	ldw y,x 
      009E87 90 FE            [ 2]  532 	ldw y,(y)
      009E89 1C 00 02         [ 2]  533 	addw x,#CELLL 
      009E8C 89               [ 2]  534 	pushw x 
      009E8D 93               [ 1]  535 	ldw x,y ; buffer address in x 
      009E8E CD 17 00         [ 4]  536 	call TIBBASE
      009E91 CD 9D 02         [ 4]  537 	call lock
      009E94 85               [ 2]  538 	popw x 
      009E95 81               [ 4]  539 	ret 
                                    540 
                                    541 ;-------------------------------------
                                    542 ; change value of OPTION register 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



                                    543 ; SET-OPT (c n -- ) 
                                    544 ; c new value.
                                    545 ; n OPT  number {1..7}
                                    546 ;--------------------------------------
      009E96 9E 6F                  547 		.word LINK 
                           001E18   548 		LINK=.
      009E98 07                     549 		.byte 7 
      009E99 53 45 54 2D 4F 50 54   550 		.ascii "SET-OPT" 
      009EA0                        551 set_option: 
      009EA0 90 93            [ 1]  552 		ldw y,x 
      009EA2 90 FE            [ 2]  553 		ldw y,(y)
      009EA4 27 06            [ 1]  554 		jreq 1$
      009EA6 90 A3 00 07      [ 2]  555 		cpw y,#7 
      009EAA 23 04            [ 2]  556 		jrule 2$ 
                                    557 ; invalid OPTION number 		
      009EAC 1C 00 04         [ 2]  558 1$:		addw x,#2*CELLL
      009EAF 81               [ 4]  559 		ret
      009EB0 90 58            [ 2]  560 2$:		sllw y 
      009EB2 72 A9 47 FF      [ 2]  561 		addw y,#OPTION_BASE-1
      009EB6 FF               [ 2]  562 		ldw (x),y 
      009EB7 1D 00 02         [ 2]  563 		subw x,#CELLL 
      009EBA 90 5F            [ 1]  564 		clrw y 
      009EBC FF               [ 2]  565 		ldw (x),y 
      009EBD CD 9D 48         [ 4]  566 		call ee_cstore
      009EC0 81               [ 4]  567 		ret 
                                    568 
                                    569 
                                    570 
                                    571 ;--------------------------------------
                                    572 ; reset system to its original state 
                                    573 ; before any user modification
                                    574 ; PRISTINE ( -- )
                                    575 ;-------------------------------------
      009EC1 9E 98                  576 	.word LINK  
                           001E43   577 	LINK=.
      009EC3 08                     578 	.byte 8 
      009EC4 50 52 49 53 54 49 4E   579 	.ascii "PRISTINE"
             45
      009ECC                        580 pristine:
                                    581 ;;; erase EEPROM
      009ECC CD 9B A3         [ 4]  582 	call EEPROM 
      009ECF CD 87 49         [ 4]  583 1$:	call DDUP 
      009ED2 CD 9D BE         [ 4]  584 	call row_erase
      009ED5 90 93            [ 1]  585 	ldw y,x 
      009ED7 90 EE 02         [ 2]  586 	ldw y,(2,y)
      009EDA 72 A9 00 80      [ 2]  587 	addw y,#BLOCK_SIZE
      009EDE EF 02            [ 2]  588 	ldw (2,x),y
      009EE0 90 A3 48 00      [ 2]  589 	cpw y,#OPTION_BASE 
      009EE4 25 E9            [ 1]  590 	jrult 1$
                                    591 ;;; reset OPTION to default values
      009EE6 90 AE 00 01      [ 2]  592 	ldw y,#1 ; OPT1 
      009EEA FF               [ 2]  593 2$:	ldw (x),y   
      009EEB 90 5F            [ 1]  594 	clrw y 
      009EED EF 02            [ 2]  595 	ldw (2,x),y  ; ( 0 1 -- ) 
      009EEF CD 87 49         [ 4]  596 	call DDUP    ; ( 0 1 0 1 -- )  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



      009EF2 CD 9E A0         [ 4]  597 	call set_option
      009EF5 90 93            [ 1]  598 	ldw y,x 
      009EF7 90 FE            [ 2]  599 	ldw y,(y)
      009EF9 90 5C            [ 2]  600 	incw y  ; next OPTION 
      009EFB 90 A3 00 08      [ 2]  601 	cpw y,#8 
      009EFF 25 E9            [ 1]  602 	jrult 2$
                                    603 ;;; erase first row of app_space 	
      009F01 90 AE A2 80      [ 2]  604 	ldw y,#app_space
      009F05 EF 02            [ 2]  605 	ldw (2,x),y  
      009F07 90 5F            [ 1]  606 	clrw y 
      009F09 FF               [ 2]  607 	ldw (x),y ; ( app_space 0 -- )
      009F0A CD 9D BE         [ 4]  608 	call row_erase 
                                    609 ; reset interrupt vectors 
      009F0D 1D 00 02         [ 2]  610 	subw x,#CELLL 
      009F10 90 5F            [ 1]  611 	clrw y  
      009F12 FF               [ 2]  612 4$:	ldw (x),y  ; ( n -- ) int# 
      009F13 CD 85 63         [ 4]  613 	call DUPP  
      009F16 CD 9F 33         [ 4]  614 	call reset_vector
      009F19 90 93            [ 1]  615 	ldw y,x 
      009F1B 90 FE            [ 2]  616 	ldw y,(y)
      009F1D 90 5C            [ 2]  617 	incw y   ; next vector 
      009F1F 90 A3 00 19      [ 2]  618 	cpw y,#25 
      009F23 25 ED            [ 1]  619 	jrult 4$
      009F25 CC 80 80         [ 2]  620 	jp NonHandledInterrupt ; reset MCU
                                    621 
                                    622 ;------------------------------
                                    623 ; reset an interrupt vector 
                                    624 ; to its initial value 
                                    625 ; i.e. NonHandledInterrupt
                                    626 ; RST-IVEC ( n -- )
                                    627 ;-----------------------------
      009F28 9E C3                  628 	.word LINK 
                           001EAA   629 	LINK=. 
      009F2A 08                     630 	.byte 8 
      009F2B 52 53 54 2D 49 56 45   631 	.ascii "RST-IVEC"
             43
      009F33                        632 reset_vector:
      009F33 90 93            [ 1]  633 	ldw y,x
      009F35 1C 00 02         [ 2]  634 	addw x,#CELLL 
      009F38 90 FE            [ 2]  635 	ldw y,(y)
      009F3A 90 A3 00 17      [ 2]  636 	cpw y,#23 
      009F3E 27 3A            [ 1]  637 	jreq 9$
      009F40 90 A3 00 1D      [ 2]  638 	cpw y,#29 ; last vector
      009F44 22 34            [ 1]  639 	jrugt 9$  
      009F46 90 58            [ 2]  640 	sllw y 
      009F48 90 58            [ 2]  641 	sllw y 
      009F4A 72 A9 80 08      [ 2]  642 	addw y,#0x8008 ; irq0 address 
      009F4E 90 BF 24         [ 2]  643 	ldw YTEMP,y
      009F51 1D 00 06         [ 2]  644 	subw x,#3*CELLL 
      009F54 EF 02            [ 2]  645 	ldw (2,x),y 
      009F56 90 5F            [ 1]  646 	clrw y
      009F58 FF               [ 2]  647 	ldw (x),y 
      009F59 A6 82            [ 1]  648 	ld a,#0x82 
      009F5B 90 95            [ 1]  649 	ld yh,a
      009F5D EF 04            [ 2]  650 	ldw (4,x),y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



      009F5F CD 9D 94         [ 4]  651 	call ee_store
      009F62 1D 00 06         [ 2]  652 	subw x,#3*CELLL
      009F65 90 5F            [ 1]  653 	clrw y 
      009F67 FF               [ 2]  654 	ldw (x),y 
      009F68 90 AE 80 80      [ 2]  655 	ldw y,#NonHandledInterrupt
      009F6C EF 04            [ 2]  656 	ldw (4,x),y 
      009F6E 90 BE 24         [ 2]  657 	ldw y,YTEMP  
      009F71 72 A9 00 02      [ 2]  658 	addw y,#2
      009F75 EF 02            [ 2]  659 	ldw (2,x),y 
      009F77 CD 9D 94         [ 4]  660 	call ee_store
      009F7A 81               [ 4]  661 9$:	ret 
                                    662 
                                    663 
                                    664 ;------------------------------
                                    665 ; all interrupt vector with 
                                    666 ; an address >= a are resetted 
                                    667 ; to default
                                    668 ; CHKIVEC ( a -- )
                                    669 ;------------------------------
      009F7B 9F 2A                  670 	.word LINK 
                           001EFD   671 	LINK=.
      009F7D 07                     672 	.byte 7
      009F7E 43 48 4B 49 56 45 43   673 	.ascii "CHKIVEC"
                                    674 ;local variables 
                           000001   675 	SSP=1
                           000003   676 	CADR=3
                           000005   677 	OFS=5
                           000006   678 	VSIZE=6  
      009F85                        679 CHKIVEC:
      009F85 52 06            [ 2]  680 	sub sp,#VSIZE ;alloc local variables 
      009F87 90 93            [ 1]  681 	ldw y,x 
      009F89 90 FE            [ 2]  682 	ldw y,(y)
      009F8B 17 03            [ 2]  683 	ldw (CADR,sp),y ; ca 
      009F8D 1F 01            [ 2]  684 	ldw (SSP,sp),x 
      009F8F AE 80 0A         [ 2]  685 	ldw x,#0x800a ; irq0 address 
      009F92 BF 33            [ 2]  686 	ldw PTR16,X
      009F94 AE FF FC         [ 2]  687 	ldw x,#-4 
      009F97 1C 00 04         [ 2]  688 1$:	addw x,#4
      009F9A A3 00 78         [ 2]  689 	cpw x,#30*4 ; irq0-29 
      009F9D 27 22            [ 1]  690 	jreq 9$
      009F9F 90 93            [ 1]  691 	ldw y,x  
      009FA1 91 D6 33         [ 4]  692 	ld a,([PTR16],y)
      009FA4 11 03            [ 1]  693 	cp a,(CADR,sp)
      009FA6 25 EF            [ 1]  694 	jrult 1$
      009FA8 90 5C            [ 2]  695 	incw y 
      009FAA 91 D6 33         [ 4]  696 	ld a,([PTR16],y)
      009FAD 11 04            [ 1]  697 	cp a,(CADR+1,sp) 
      009FAF 25 E6            [ 1]  698 	jrult 1$ 
      009FB1 1F 05            [ 2]  699 	ldw (OFS,sp),x 
      009FB3 54               [ 2]  700 	srlw x
      009FB4 54               [ 2]  701 	srlw x 
      009FB5 90 93            [ 1]  702 	ldw y,x 
      009FB7 1E 01            [ 2]  703 	ldw x,(SSP,sp)
      009FB9 FF               [ 2]  704 	ldw (x),y
      009FBA CD 9F 33         [ 4]  705 	call reset_vector
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



      009FBD 1E 05            [ 2]  706 	ldw x,(OFS,sp) 
      009FBF 20 D6            [ 2]  707 	jra 1$
      009FC1 1E 01            [ 2]  708 9$:	ldw x,(SSP,sp) 
      009FC3 1C 00 02         [ 2]  709 	addw x,#CELLL 
      009FC6 5B 06            [ 2]  710 	addw sp,#VSIZE ; drop local variables  
      009FC8 81               [ 4]  711 	ret 
                                    712 
                                    713 ;------------------------------
                                    714 ; set interrupt vector 
                                    715 ; SET-IVEC ( ud n -- )
                                    716 ;  ud Handler address
                                    717 ;  n  vector # 0 .. 29 
                                    718 ;-----------------------------
      009FC9 9F 7D                  719 	.word LINK
                           001F4B   720 	LINK=.
      009FCB 08                     721 	.byte 8 
      009FCC 53 45 54 2D 49 56 45   722 	.ascii "SET-IVEC" 
             43
      009FD4                        723 set_vector:
      009FD4 90 93            [ 1]  724     ldw y,x 
      009FD6 1C 00 02         [ 2]  725 	addw x,#CELLL 
      009FD9 90 FE            [ 2]  726 	ldw y,(y) ; vector #
      009FDB 90 A3 00 1D      [ 2]  727 	cpw y,#29 ; last vector
      009FDF 23 04            [ 2]  728 	jrule 2$
      009FE1 1C 00 04         [ 2]  729 	addw x,#2*CELLL 
      009FE4 81               [ 4]  730 	ret
      009FE5 90 58            [ 2]  731 2$:	sllw y 
      009FE7 90 58            [ 2]  732 	sllw y 
      009FE9 72 A9 80 08      [ 2]  733 	addw y,#0X8008 ; IRQ0 vector address 
      009FED 90 BF 24         [ 2]  734 	ldw YTEMP,y ; vector address 
      009FF0 A6 82            [ 1]  735 	ld a,#0x82 
      009FF2 90 95            [ 1]  736 	ld yh,a 
      009FF4 E6 01            [ 1]  737 	ld a,(1,x) ; isr address bits 23..16 
      009FF6 90 97            [ 1]  738 	ld yl,a 
                                    739 ;  write 0x82 + most significant byte of int address	
      009FF8 1D 00 06         [ 2]  740 	subw x,#3*CELLL 
      009FFB EF 04            [ 2]  741 	ldw (4,x),y 
      009FFD 90 BE 24         [ 2]  742 	ldw y,YTEMP
      00A000 EF 02            [ 2]  743 	ldw (2,x),y ; vector address 
      00A002 90 5F            [ 1]  744 	clrw y 
      00A004 FF               [ 2]  745 	ldw (x),y   ; as a double 
      00A005 CD 9D 94         [ 4]  746 	call ee_store 
      00A008 90 93            [ 1]  747 	ldw y,x 
      00A00A 90 EE 02         [ 2]  748 	ldw y,(2,y) ; bits 15..0 int vector 
      00A00D 1D 00 06         [ 2]  749 	subw x,#3*CELLL 
      00A010 EF 04            [ 2]  750 	ldw (4,x),y 
      00A012 90 BE 24         [ 2]  751 	ldw y,YTEMP 
      00A015 72 A9 00 02      [ 2]  752 	addw y,#2 
      00A019 EF 02            [ 2]  753 	ldw (2,x),y 
      00A01B 90 5F            [ 1]  754 	clrw y 
      00A01D FF               [ 2]  755 	ldw (x),y 
      00A01E CD 9D 94         [ 4]  756 	call ee_store
      00A021 1C 00 04         [ 2]  757 	addw x,#2*CELLL  
      00A024 81               [ 4]  758 9$: ret 
                                    759 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



                                    760 
                                    761 ;------------------------
                                    762 ; Compile word to flash
                                    763 ; EE, (w -- )
                                    764 ;-----------------------
      00A025 9F CB                  765 	.word LINK
                           001FA7   766 	LINK=.
      00A027 03                     767 	.byte 3
      00A028 45 45 2C               768 	.ascii "EE,"
      00A02B                        769 ee_comma:
      00A02B 1D 00 04         [ 2]  770 	subw x,#2*CELLL 
      00A02E 90 BE 18         [ 2]  771 	ldw y,UCP
      00A031 90 89            [ 2]  772 	pushw y 
      00A033 EF 02            [ 2]  773 	ldw (2,x),y 
      00A035 90 5F            [ 1]  774 	clrw y 
      00A037 FF               [ 2]  775 	ldw (x),y
      00A038 CD 9D 94         [ 4]  776 	call ee_store
      00A03B 90 85            [ 2]  777 	popw y 
      00A03D 72 A9 00 02      [ 2]  778 	addw y,#2
      00A041 90 BF 18         [ 2]  779 	ldw UCP,y
      00A044 81               [ 4]  780 	ret 
                                    781 
                                    782 
                                    783 ;-------------------------
                                    784 ; Compile byte to flash 
                                    785 ; EEC, ( c -- )	
                                    786 ;-------------------------
      00A045 A0 27                  787 	.word LINK 
                           001FC7   788 	LINK=.
      00A047 04                     789 	.byte 4 
      00A048 45 45 43 2C            790 	.ascii "EEC,"
      00A04C                        791 ee_ccomma:
      00A04C 1D 00 04         [ 2]  792 	subw x,#2*CELLL 
      00A04F 90 BE 18         [ 2]  793 	ldw y,UCP
      00A052 90 89            [ 2]  794 	pushw y 
      00A054 EF 02            [ 2]  795 	ldw (2,x),y 
      00A056 90 5F            [ 1]  796 	clrw y 
      00A058 FF               [ 2]  797 	ldw (x),y
      00A059 CD 9D 48         [ 4]  798 	call ee_cstore
      00A05C 90 85            [ 2]  799 	popw y 
      00A05E 90 5C            [ 2]  800 	incw y 
      00A060 90 BF 18         [ 2]  801 	ldw UCP,y
      00A063 81               [ 4]  802 	ret 
                                    803 
                                    804 
                                    805 ;--------------------------
                                    806 ; copy FLASH block to ROWBUF
                                    807 ; ROW2BUF ( ud -- )
                                    808 ;--------------------------
      00A064 A0 47                  809 	.word LINK 
                           001FE6   810 	LINK=.
      00A066 07                     811 	.byte 7 
      00A067 52 4F 57 32 42 55 46   812 	.ascii "ROW2BUF"
      00A06E                        813 ROW2BUF: 
      00A06E CD 9B 84         [ 4]  814 	call fptr_store 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



      00A071 A6 80            [ 1]  815 	ld a,#BLOCK_SIZE
      00A073 88               [ 1]  816 	push a 
      00A074 B4 34            [ 1]  817 	and a,PTR8 ; block align 
      00A076 B7 34            [ 1]  818 	ld PTR8,a
      00A078 90 AE 16 80      [ 2]  819 	ldw y,#ROWBUFF 
      00A07C 92 BC 00 32      [ 5]  820 1$: ldf a,[FPTR]
      00A080 90 F7            [ 1]  821 	ld (y),a
      00A082 CD 9D 16         [ 4]  822 	call inc_fptr
      00A085 90 5C            [ 2]  823 	incw y 
      00A087 0A 01            [ 1]  824 	dec (1,sp)
      00A089 26 F1            [ 1]  825 	jrne 1$ 
      00A08B 84               [ 1]  826 	pop a 
      00A08C 81               [ 4]  827 	ret 
                                    828 
                                    829 
                                    830 ;---------------------------
                                    831 ; copy ROWBUFF to flash 
                                    832 ; BUF2ROW ( ud -- )
                                    833 ; ud is row address as double 
                                    834 ;---------------------------
      00A08D A0 66                  835 	.word LINK 
                           00200F   836 	LINK=.
      00A08F 07                     837 	.byte 7 
      00A090 42 55 46 32 52 4F 57   838 	.ascii "BUF2ROW" 
      00A097                        839 BUF2ROW:
      00A097 CD 86 5E         [ 4]  840 	call TBUF ; ( ud rb -- )
      00A09A CD 87 1E         [ 4]  841 	call ROT 
      00A09D CD 87 1E         [ 4]  842 	call ROT  ; ( rb ud -- )
      00A0A0 CD 9E 76         [ 4]  843 	call write_row 
      00A0A3 81               [ 4]  844 	ret 
                                    845 
                                    846 ;---------------------------------
                                    847 ; how many byte free in that row 
                                    848 ; RFREE ( a -- n )
                                    849 ; a is least byte of target address
                                    850 ;----------------------------------
      00A0A4 A0 8F                  851 	.word LINK 
                           002026   852 	LINK=.
      00A0A6 05                     853 	.byte 5 
      00A0A7 52 46 52 45 45         854 	.ascii "RFREE"
      00A0AC                        855 RFREE:
      00A0AC E6 01            [ 1]  856 	ld a,(1,x)
      00A0AE A4 7F            [ 1]  857 	and a,#BLOCK_SIZE-1 
      00A0B0 B7 24            [ 1]  858 	ld YTEMP,a 
      00A0B2 A6 80            [ 1]  859 	ld a,#BLOCK_SIZE 
      00A0B4 B0 24            [ 1]  860 	sub a,YTEMP 
      00A0B6 90 5F            [ 1]  861 	clrw y 
      00A0B8 90 97            [ 1]  862 	ld yl,a
      00A0BA FF               [ 2]  863 	ldw (x),y 
      00A0BB 81               [ 4]  864 	ret 
                                    865 
                                    866 ;---------------------------------
                                    867 ; write u bytes to flash/EEPROM 
                                    868 ; constraint to row limit 
                                    869 ; RAM2EE ( ud a u -- u2 )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



                                    870 ; ud flash address 
                                    871 ; a ram address 
                                    872 ; u bytes count
                                    873 ; return u2 bytes written  
                                    874 ;-------------------------------
      00A0BC A0 A6                  875 	.word LINK 
                           00203E   876 	LINK=. 
      00A0BE 06                     877 	.byte 6
      00A0BF 52 41 4D 32 45 45      878 	.ascii "RAM2EE"
                                    879 	
      00A0C5                        880 RAM2EE:
                                    881 ; copy ud on top 
      00A0C5 90 93            [ 1]  882 	ldw y,x 
      00A0C7 90 EE 06         [ 2]  883 	ldw y,(6,y) ; LSW of ud  
      00A0CA 90 BF 24         [ 2]  884 	ldw YTEMP,y 
      00A0CD 90 93            [ 1]  885 	ldw y,x 
      00A0CF 90 EE 04         [ 2]  886 	ldw y,(4,y)  ; MSW of ud 
      00A0D2 1D 00 04         [ 2]  887 	subw x,#2*CELLL 
      00A0D5 FF               [ 2]  888 	ldw (x),y 
      00A0D6 90 BE 24         [ 2]  889 	ldw y,YTEMP 
      00A0D9 EF 02            [ 2]  890 	ldw (2,x),y 
      00A0DB CD A0 6E         [ 4]  891 	call ROW2BUF 
      00A0DE 90 93            [ 1]  892 	ldw y,x 
      00A0E0 90 EE 06         [ 2]  893 	ldw y,(6,y)
      00A0E3 90 89            [ 2]  894 	pushw y ; udl 
      00A0E5 90 9F            [ 1]  895 	ld a,yl
      00A0E7 A4 7F            [ 1]  896 	and a,#BLOCK_SIZE-1 
      00A0E9 90 5F            [ 1]  897 	clrw y 
      00A0EB 90 97            [ 1]  898 	ld yl,a 
      00A0ED 72 A9 16 80      [ 2]  899 	addw y,#ROWBUFF 
      00A0F1 1D 00 02         [ 2]  900 	subw x,#CELLL 
      00A0F4 FF               [ 2]  901 	ldw (x),y  
      00A0F5 CD 85 73         [ 4]  902 	call SWAPP ;  ( ud a ra u -- )
      00A0F8 CD 85 0D         [ 4]  903 	call RFROM  
      00A0FB CD A0 AC         [ 4]  904 	call RFREE 
      00A0FE CD 88 79         [ 4]  905 	call MIN
      00A101 CD 85 63         [ 4]  906 	call DUPP 
      00A104 CD 85 2C         [ 4]  907 	call TOR  
      00A107 CD 8B FF         [ 4]  908 	call CMOVE
      00A10A CD A0 97         [ 4]  909 	call BUF2ROW 
      00A10D CD 85 0D         [ 4]  910 	call RFROM 
      00A110 81               [ 4]  911 	ret 
                                    912 
                                    913 ;--------------------------
                                    914 ; expand 16 bit address 
                                    915 ; to 32 bit address 
                                    916 ; FADDR ( a -- ud )
                                    917 ;--------------------------
      00A111 A0 BE                  918 	.word LINK 
                           002093   919 	LINK=. 
      00A113 05                     920 	.byte 5 
      00A114 46 41 44 44 52         921 	.ascii "FADDR"
      00A119                        922 FADDR:
      00A119 CC 8A C4         [ 2]  923 	jp ZERO 
                                    924 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
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
      00A11C A1 13                  939 	.word LINK 
                           00209E   940 	LINK=.
      00A11E 05                     941 	.byte 5 
      00A11F 46 4D 4F 56 45         942 	.ascii "FMOVE" 
      00A124                        943 FMOVE:
      00A124 CD 86 70         [ 4]  944 	call TFLASH 
      00A127 CD 84 BC         [ 4]  945 	CALL AT 
      00A12A CD 84 67         [ 4]  946 	CALL QBRAN 
      00A12D A1 A8                  947 	.word no_move  
      00A12F CD 86 BF         [ 4]  948 	call CPP
      00A132 CD 84 BC         [ 4]  949 	call AT  
      00A135 CD 85 63         [ 4]  950 	call DUPP ; ( udl udl -- )
      00A138 CD 86 A3         [ 4]  951 	call CNTXT 
      00A13B CD 84 BC         [ 4]  952 	call AT 
      00A13E CD 84 34         [ 4]  953 	call DOLIT 
      00A141 00 02                  954 	.word 2 
      00A143 CD 87 D7         [ 4]  955 	call SUBB ; ( udl udl a -- )
      00A146 CD 85 73         [ 4]  956 	call SWAPP 
      00A149 CD A1 19         [ 4]  957 	call FADDR 
      00A14C CD 87 1E         [ 4]  958 	call ROT  ; ( udl ud a -- )
      00A14F CD 85 63         [ 4]  959 	call DUPP 
      00A152 CD 85 2C         [ 4]  960 	call TOR    ; R: a 
      00A155                        961 FMOVE2: 
      00A155 CD 8B B2         [ 4]  962 	call HERE 
      00A158 CD 85 20         [ 4]  963 	call RAT 
      00A15B CD 87 D7         [ 4]  964 	call SUBB ; (udl ud a wl -- )
      00A15E                        965 next_row:
      00A15E CD 85 63         [ 4]  966 	call DUPP 
      00A161 CD 85 2C         [ 4]  967 	call TOR  ; ( udl ud a wl -- ) R: a wl
      00A164 CD A0 C5         [ 4]  968 	call RAM2EE ; ( udl a u -- udl u2 ) u2 is byte written to FLASH 
      00A167 CD 85 63         [ 4]  969 	call DUPP 
      00A16A CD 85 2C         [ 4]  970 	call TOR
      00A16D CD 87 5E         [ 4]  971 	call PLUS  ; ( udl+ ) 
      00A170 CD 85 63         [ 4]  972 	call DUPP 
      00A173 CD 8A C4         [ 4]  973 	call ZERO   ; ( udl+ ud -- )
      00A176 CD 85 0D         [ 4]  974 	call RFROM  ; ( udl+ ud u2  R: a wl ) 
      00A179 CD 85 0D         [ 4]  975 	call RFROM  ; ( udl+ ud u2 wl R: a ) 
      00A17C CD 85 8D         [ 4]  976 	call OVER   ; ( udl+ ud u2 wl u2 -- )
      00A17F CD 87 D7         [ 4]  977 	call SUBB  ; ( udl+ ud u2 wl- R: a )
      00A182 CD 85 63         [ 4]  978 	call DUPP 
      00A185 CD 84 67         [ 4]  979 	call QBRAN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      00A188 A1 A1                  980 	.word fmove_done 
      00A18A CD 85 73         [ 4]  981 	call SWAPP  ; ( udl+ ud wl- u2 R: a )
      00A18D CD 85 0D         [ 4]  982 	call RFROM ; ( udl+ ud wl- u2 a -- ) 
      00A190 CD 87 5E         [ 4]  983 	call PLUS  ; ( udl+2 ud wl- a+ )
      00A193 CD 85 63         [ 4]  984 	call DUPP 
      00A196 CD 85 2C         [ 4]  985 	call TOR   ; ( udl+2 ud wl- a+ ) R: a+
      00A199 CD 85 73         [ 4]  986 	call SWAPP 
      00A19C CD 84 7E         [ 4]  987 	call BRAN
      00A19F A1 5E                  988 	.word next_row  
      00A1A1                        989 fmove_done:	
      00A1A1 CD 85 0D         [ 4]  990 	call RFROM  ; ( -- udl+ ud u2 wl- a  )
      00A1A4 1C 00 0A         [ 2]  991 	addw x,#5*CELLL ; (  -- cp+ ) new CP 
      00A1A7 81               [ 4]  992  	ret  
      00A1A8                        993 no_move:
      00A1A8 CD 8A C4         [ 4]  994 	call ZERO
      00A1AB 81               [ 4]  995 	ret 
                                    996 
                                    997 ;------------------------------------------
                                    998 ; adjust pointers after **FMOVE** operetion.
                                    999 ; UPDAT-PTR ( cp+ -- )
                                   1000 ; cp+ is new CP position after FMOVE 
                                   1001 ;-------------------------------------------
      00A1AC A1 1E                 1002 	.word LINK 
                           00212E  1003 	LINK=.
      00A1AE 09                    1004 	.byte 9
      00A1AF 55 50 44 41 54 2D 50  1005 	.ascii "UPDAT-PTR" 
             54 52
      00A1B8                       1006 UPDATPTR:
                                   1007 ;reset VP to previous position  
      00A1B8 CD 9B FE         [ 4] 1008 	call EEPVP 
      00A1BB CD 85 59         [ 4] 1009 	call DROP 
      00A1BE CD 84 BC         [ 4] 1010 	call AT
      00A1C1 CD 86 B1         [ 4] 1011 	call VPP 
      00A1C4 CD 84 A5         [ 4] 1012 	call STORE
                                   1013 ;update CONTEXT and LAST 
      00A1C7 CD 9B E8         [ 4] 1014 	call EEPCP 
      00A1CA CD 85 59         [ 4] 1015 	call DROP
      00A1CD CD 84 BC         [ 4] 1016 	call AT
      00A1D0 CD 84 34         [ 4] 1017 	call DOLIT 
      00A1D3 00 02                 1018 	.word 2 
      00A1D5 CD 87 5E         [ 4] 1019 	call PLUS 
      00A1D8 CD 85 63         [ 4] 1020 	call DUPP 
      00A1DB CD 86 A3         [ 4] 1021 	call CNTXT 
      00A1DE CD 84 A5         [ 4] 1022 	call STORE
      00A1E1 CD 86 CF         [ 4] 1023 	call LAST
      00A1E4 CD 84 A5         [ 4] 1024 	call STORE 
      00A1E7 CD 9C 18         [ 4] 1025 	call UPDATLAST 
                                   1026 ;update CP 
      00A1EA CD 86 BF         [ 4] 1027 	call CPP 
      00A1ED CD 84 A5         [ 4] 1028 	call STORE
      00A1F0 CD 9C 41         [ 4] 1029 	call UPDATCP 
      00A1F3 81               [ 4] 1030 	ret 
                                   1031 
                                   1032 ;-----------------------------
                                   1033 ; move interrupt sub-routine
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



                                   1034 ; in flash memory
                                   1035 ;----------------------------- 
      00A1F4 A1 AE                 1036 	.word LINK 
                           002176  1037 	LINK=. 
      00A1F6 06                    1038 	.byte 6
      00A1F7 49 46 4D 4F 56 45     1039 	.ascii "IFMOVE" 
      00A1FD                       1040 IFMOVE:
      00A1FD CD 86 70         [ 4] 1041 	call TFLASH 
      00A200 CD 84 BC         [ 4] 1042 	CALL AT 
      00A203 CD 84 67         [ 4] 1043 	CALL QBRAN 
      00A206 A1 A8                 1044 	.word no_move 
      00A208 CD 86 BF         [ 4] 1045 	call CPP 
      00A20B CD 84 BC         [ 4] 1046 	call AT 
      00A20E CD 85 63         [ 4] 1047 	call DUPP ; ( udl udl -- )
      00A211 CD 9B FE         [ 4] 1048 	call EEPVP 
      00A214 CD 85 59         [ 4] 1049 	call DROP
      00A217 CD 84 BC         [ 4] 1050 	call AT  ; ( udl udl a )
      00A21A CD 85 2C         [ 4] 1051 	call TOR 
      00A21D CD A1 19         [ 4] 1052 	call FADDR
      00A220 CD 85 20         [ 4] 1053 	call RAT ; ( udl ud a -- ) R: a 
      00A223 CC A1 55         [ 2] 1054 	jp FMOVE2 
                                   1055 
                                   1056 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



                                   4444 
                                   4445 ;===============================================================
                                   4446 
                           002176  4447 LASTN =	LINK   ;last name defined
                                   4448 
                                   4449 ; application code begin here
      00A280                       4450 	.bndry 128 ; align on flash block  
      00A280                       4451 app_space: 
                                   4452 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   6 AB1        00077A R   |   6 ABOR1      0012CE R
  6 ABOR2      0012E5 R   |   6 ABORQ      0012C6 R   |   6 ABORT      0012B7 R
  6 ABRTQ      0015A2 R   |   6 ABSS       000771 R   |   6 ACCEP      00124D R
  6 ACCP1      001256 R   |   6 ACCP2      00127C R   |   6 ACCP3      00127F R
  6 ACCP4      001281 R   |     ADC_CR1 =  005401     |     ADC_CR1_=  000000 
    ADC_CR1_=  000001     |     ADC_CR1_=  000004     |     ADC_CR1_=  000005 
    ADC_CR1_=  000006     |     ADC_CR2 =  005402     |     ADC_CR2_=  000003 
    ADC_CR2_=  000004     |     ADC_CR2_=  000005     |     ADC_CR2_=  000006 
    ADC_CR2_=  000001     |     ADC_CR3 =  005403     |     ADC_CR3_=  000007 
    ADC_CR3_=  000006     |     ADC_CSR =  005400     |     ADC_CSR_=  000006 
    ADC_CSR_=  000004     |     ADC_CSR_=  000000     |     ADC_CSR_=  000001 
    ADC_CSR_=  000002     |     ADC_CSR_=  000003     |     ADC_CSR_=  000007 
    ADC_CSR_=  000005     |     ADC_DRH =  005404     |     ADC_DRL =  005405 
    ADC_TDRH=  005406     |     ADC_TDRL=  005407     |   6 ADRADJ     00067D R
    AFR     =  004803     |     AFR0_ADC=  000000     |     AFR1_TIM=  000001 
    AFR2_CCO=  000002     |     AFR3_TIM=  000003     |     AFR4_TIM=  000004 
    AFR5_TIM=  000005     |     AFR6_I2C=  000006     |     AFR7_BEE=  000007 
  6 AFT        00158D R   |   6 AGAIN      0014E3 R   |   6 AHEAD      001540 R
  6 ALLOT      0013F6 R   |   6 ANDD       00052F R   |     APP_CP  =  004004 
    APP_LAST=  004000     |     APP_RUN =  004002     |     APP_VP  =  004006 
  6 AT         00043C R   |   6 ATEXE      000B68 R   |   6 AUTORUN    000127 R
    AWU_APR =  0050F1     |     AWU_CSR =  0050F0     |     AWU_TBR =  0050F2 
    B0_MASK =  000001     |     B115200 =  000006     |     B19200  =  000003 
    B1_MASK =  000002     |     B230400 =  000007     |     B2400   =  000000 
    B2_MASK =  000004     |     B38400  =  000004     |     B3_MASK =  000008 
    B460800 =  000008     |     B4800   =  000001     |     B4_MASK =  000010 
    B57600  =  000005     |     B5_MASK =  000020     |     B6_MASK =  000040 
    B7_MASK =  000080     |     B921600 =  000009     |     B9600   =  000002 
  6 BACK1      0011F5 R   |   6 BASE       0005A0 R   |     BASEE   =  00000A 
    BCNT    =  000001     |   6 BCOMP      001438 R   |   6 BDIGS      000C50 R
    BEEP_BIT=  000004     |     BEEP_CSR=  0050F3     |     BEEP_MAS=  000010 
    BEEP_POR=  00000F     |   6 BEGIN      0014C5 R   |     BIT0    =  000000 
    BIT1    =  000001     |     BIT2    =  000002     |     BIT3    =  000003 
    BIT4    =  000004     |     BIT5    =  000005     |     BIT6    =  000006 
    BIT7    =  000007     |   6 BKSLA      00108D R   |   6 BKSP       0011C5 R
    BKSPP   =  000008     |   6 BLANK      000A37 R   |     BLOCK_SI=  000080 
    BOOT_ROM=  006000     |     BOOT_ROM=  007FFF     |   6 BRAN       0003FE R
    BTW     =  000001     |   6 BUF2ROW    002017 R   |   6 BYE        0000B4 R
    CADR    =  000003     |     CALLL   =  0000CD     |     CAN_DGR =  005426 
    CAN_FPSR=  005427     |     CAN_IER =  005425     |     CAN_MCR =  005420 
    CAN_MSR =  005421     |     CAN_P0  =  005428     |     CAN_P1  =  005429 
    CAN_P2  =  00542A     |     CAN_P3  =  00542B     |     CAN_P4  =  00542C 
    CAN_P5  =  00542D     |     CAN_P6  =  00542E     |     CAN_P7  =  00542F 
    CAN_P8  =  005430     |     CAN_P9  =  005431     |     CAN_PA  =  005432 
    CAN_PB  =  005433     |     CAN_PC  =  005434     |     CAN_PD  =  005435 
    CAN_PE  =  005436     |     CAN_PF  =  005437     |     CAN_RFR =  005424 
    CAN_TPR =  005423     |     CAN_TSR =  005422     |     CARRY   =  000028 
  6 CAT        00045A R   |   6 CCOMMA     00141A R   |     CC_C    =  000000 
    CC_H    =  000004     |     CC_I0   =  000003     |     CC_I1   =  000005 
    CC_N    =  000002     |     CC_V    =  000007     |     CC_Z    =  000001 
    CELLL   =  000002     |   6 CELLM      0009BC R   |   6 CELLP      0009AD R
  6 CELLS      0009CB R   |     CFG_GCR =  007F60     |     CFG_GCR_=  000001 
    CFG_GCR_=  000000     |   6 CHAR1      000E7D R   |   6 CHAR2      000E80 R
  6 CHKIVEC    001F05 R   |     CLKOPT  =  004807     |     CLKOPT_C=  000002 
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
    CLK_SWR_=  0000D2     |   6 CMOV1      000B87 R   |   6 CMOV2      000B9F R
  6 CMOVE      000B7F R   |     CNTDWN  =  000030     |   6 CNTXT      000623 R
  6 COLD       0019E4 R   |   6 COLD1      0019E4 R   |   6 COLON      00173B R
  6 COMMA      001403 R   |   6 COMPI      001448 R   |     COMPO   =  000040 
  6 CONSTANT   0017E5 R   |   6 COUNT      000B1B R   |   6 CPP        00063F R
    CPU_A   =  007F00     |     CPU_CCR =  007F0A     |     CPU_PCE =  007F01 
    CPU_PCH =  007F02     |     CPU_PCL =  007F03     |     CPU_SPH =  007F08 
    CPU_SPL =  007F09     |     CPU_XH  =  007F04     |     CPU_XL  =  007F05 
    CPU_YH  =  007F06     |     CPU_YL  =  007F07     |   6 CR         000EAB R
  6 CREAT      001781 R   |     CRR     =  00000D     |   6 CSTOR      000449 R
  6 DAT        000AFB R   |     DATSTK  =  001680     |   6 DDROP      0006BE R
  6 DDUP       0006C9 R   |     DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF 
  6 DECIM      000D00 R   |   6 DEPTH      000A86 R   |     DEVID_BA=  0048CD 
    DEVID_EN=  0048D8     |     DEVID_LO=  0048D2     |     DEVID_LO=  0048D3 
    DEVID_LO=  0048D4     |     DEVID_LO=  0048D5     |     DEVID_LO=  0048D6 
    DEVID_LO=  0048D7     |     DEVID_LO=  0048D8     |     DEVID_WA=  0048D1 
    DEVID_XH=  0048CE     |     DEVID_XL=  0048CD     |     DEVID_YH=  0048D0 
    DEVID_YL=  0048CF     |   6 DGTQ1      000D45 R   |   6 DI         0000C2 R
  6 DIG        000C79 R   |   6 DIGIT      000C14 R   |   6 DIGS       000C8A R
  6 DIGS1      000C8A R   |   6 DIGS2      000C97 R   |   6 DIGTQ      000D14 R
    DM_BK1RE=  007F90     |     DM_BK1RH=  007F91     |     DM_BK1RL=  007F92 
    DM_BK2RE=  007F93     |     DM_BK2RH=  007F94     |     DM_BK2RL=  007F95 
    DM_CR1  =  007F96     |     DM_CR2  =  007F97     |     DM_CSR1 =  007F98 
    DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A     |   6 DN1        000738 R
  6 DNEGA      00071B R   |   6 DOCONST    00180F R   |   6 DOLIT      0003B4 R
  6 DONXT      0003C8 R   |   6 DOSTR      000EC1 R   |   6 DOT        000F46 R
  6 DOT1       000F5C R   |   6 DOTI1      001931 R   |   6 DOTID      00191B R
  6 DOTO1      00135A R   |   6 DOTOK      001340 R   |   6 DOTPR      00106F R
  6 DOTQ       0015BC R   |   6 DOTQP      000EEA R   |   6 DOTR       000EF8 R
  6 DOTS       0018BD R   |   6 DOTS1      0018C8 R   |   6 DOTS2      0018D1 R
  6 DOVAR      000590 R   |   6 DROP       0004D9 R   |   6 DSTOR      000AD5 R
  6 DUMP       001873 R   |   6 DUMP1      00188A R   |   6 DUMP3      0018AC R
  6 DUMPP      001842 R   |   6 DUPP       0004E3 R   |   6 EDIGS      000CB5 R
  6 EEPCP      001B68 R   |   6 EEPLAST    001B3B R   |   6 EEPROM     001B23 R
    EEPROM_B=  004000     |     EEPROM_E=  0047FF     |     EEPROM_S=  000800 
  6 EEPRUN     001B52 R   |   6 EEPVP      001B7E R   |   6 EI         0000BB R
  6 ELSEE      00151B R   |   6 EMIT       00039E R   |   6 ENEPER     001A93 R
  6 EQ1        000795 R   |   6 EQUAL      00077F R   |   6 ERASE      000BE1 R
    ERR     =  00001B     |   6 EVAL       001383 R   |   6 EVAL1      001383 R
  6 EVAL2      00139F R   |   6 EXE1       000B76 R   |   6 EXECU      00040E R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]

Symbol Table

  6 EXIT       00041E R   |     EXT     =  000000     |     EXTI_CR1=  0050A0 
    EXTI_CR2=  0050A1     |   6 EXTRC      000C3C R   |   6 FADDR      002099 R
    FHSE    =  7A1200     |     FHSI    =  F42400     |   6 FILL       000BAE R
  6 FILL1      000BCB R   |   6 FILL2      000BD4 R   |   6 FIND       001121 R
  6 FIND1      00113F R   |   6 FIND2      00116D R   |   6 FIND3      001179 R
  6 FIND4      00118D R   |   6 FIND5      00119A R   |   6 FIND6      00117E R
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
    FLSI    =  01F400     |   6 FMOVE      0020A4 R   |   6 FMOVE2     0020D5 R
  6 FOR        001498 R   |   6 FORGET     000158 R   |   6 FORGET1    000187 R
  6 FORGET2    00020D R   |   6 FORGET4    000216 R   |   6 FORGET6    0001CF R
    FPTR    =  000032     |   6 FREEVAR    000223 R   |   6 FREEVAR4   000259 R
    GPIO_BAS=  005000     |     GPIO_CR1=  000003     |     GPIO_CR2=  000004 
    GPIO_DDR=  000002     |     GPIO_IDR=  000001     |     GPIO_ODR=  000000 
    GPIO_SIZ=  000005     |   6 HERE       000B32 R   |   6 HEX        000CEB R
  6 HI         0019B7 R   |   6 HLD        000610 R   |   6 HOLD       000C60 R
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
    I2C_WRIT=  000000     |   6 ICOLON     00174C R   |   6 IFETCH     0014B6 R
  6 IFF        0014F3 R   |   6 IFMOVE     00217D R   |     IMEDD   =  000080 
  6 IMMED      00175E R   |   6 INCH       000392 R   |   6 INITOFS    001714 R
  6 INN        0005BE R   |     INPUT_DI=  000000     |     INPUT_EI=  000001 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]

Symbol Table

    INPUT_FL=  000000     |     INPUT_PU=  000001     |   6 INTE1      001322 R
  6 INTER      0012F8 R   |     INT_ADC2=  000016     |     INT_AUAR=  000012 
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
    INT_VECT=  00805C     |     INT_VECT=  008058     |   6 INVER      0006F8 R
    IPR0    =  000002     |     IPR1    =  000001     |     IPR2    =  000000 
    IPR3    =  000003     |     IPR_MASK=  000003     |     IRET_COD=  000080 
  6 ISEMI      0016A9 R   |     ITC_SPR1=  007F70     |     ITC_SPR2=  007F71 
    ITC_SPR3=  007F72     |     ITC_SPR4=  007F73     |     ITC_SPR5=  007F74 
    ITC_SPR6=  007F75     |     ITC_SPR7=  007F76     |     ITC_SPR8=  007F77 
    IWDG_KR =  0050E0     |     IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2 
  6 JSRC       0016FE R   |   6 KEY        000E2B R   |   6 KTAP       001212 R
  6 KTAP1      001235 R   |   6 KTAP2      001238 R   |   6 LAST       00064F R
  6 LASTN   =  002176 R   |   6 LBRAC      00132F R   |     LED2_BIT=  000005 
    LED2_MAS=  000020     |     LED2_POR=  00500A     |   6 LESS       0007BC R
    LF      =  00000A     |   6 LINK    =  002176 R   |   6 LITER      00146A R
  6 LN2S       001AEF R   |   6 LOG2S      001AD9 R   |   6 LSHIFT     0009F6 R
  6 LSHIFT1    0009FF R   |   6 LSHIFT4    000A07 R   |   6 LT1        0007D2 R
    MASKK   =  001F7F     |   6 MAX        0007DC R   |   6 MAX1       0007EF R
  6 MIN        0007F9 R   |   6 MIN1       00080C R   |   6 MMOD1      0008AF R
  6 MMOD2      0008C3 R   |   6 MMOD3      0008DA R   |   6 MMSM1      000856 R
  6 MMSM2      00086A R   |   6 MMSM3      00086C R   |   6 MMSM4      000874 R
  6 MODD       0008F4 R   |   6 MONE       000A5D R   |     MS      =  00002E 
  6 MSEC       0002CE R   |   6 MSMOD      000892 R   |   6 MSTA1      000985 R
  6 MSTAR      000962 R   |     NAFR    =  004804     |   6 NAMEQ      0011BA R
  6 NAMET      0010CB R   |     NCLKOPT =  004808     |   6 NEGAT      000709 R
  6 NEX1       0003D5 R   |   6 NEXT       0014A7 R   |     NFLASH_W=  00480E 
    NHSECNT =  00480A     |     NOPT1   =  004802     |     NOPT2   =  004804 
    NOPT3   =  004806     |     NOPT4   =  004808     |     NOPT5   =  00480A 
    NOPT6   =  00480C     |     NOPT7   =  00480E     |     NOPTBL  =  00487F 
  6 NTIB       0005CE R   |     NUBC    =  004802     |   6 NUFQ       000E41 R
  6 NUFQ1      000E5A R   |   6 NUMBQ      000D58 R   |   6 NUMQ1      000D8C R
  6 NUMQ2      000DBD R   |   6 NUMQ3      000DFF R   |   6 NUMQ4      000E04 R
  6 NUMQ5      000E13 R   |   6 NUMQ6      000E16 R   |     NWDGOPT =  004806 
    NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF 
    NWDGOPT_=  FFFFFFFE     |   6 NonHandl   000000 R   |   6 OFFSET     000674 R
    OFS     =  000005     |   6 ONE        000A4F R   |   6 ONEM       0009E5 R
  6 ONEP       0009D8 R   |     OPT     =  000002     |     OPT0    =  004800 
    OPT1    =  004801     |     OPT2    =  004803     |     OPT3    =  004805 
    OPT4    =  004807     |     OPT5    =  004809     |     OPT6    =  00480B 
    OPT7    =  00480D     |     OPTBL   =  00487E     |     OPTIMIZE=  000001 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]

Symbol Table

    OPTION_B=  004800     |     OPTION_E=  00487F     |     OPTION_S=  000080 
  6 ORIG       000047 R   |   6 ORR        000543 R   |   6 OUTPUT     0003A3 R
    OUTPUT_F=  000001     |     OUTPUT_O=  000000     |     OUTPUT_P=  000001 
    OUTPUT_S=  000000     |   6 OVER       00050D R   |   6 OVERT      001677 R
    PA      =  000000     |   6 PACKS      000BF3 R   |   6 PAD        000B43 R
  6 PAREN      00107E R   |   6 PARS       000F77 R   |   6 PARS1      000FA2 R
  6 PARS2      000FCD R   |   6 PARS3      000FD0 R   |   6 PARS4      000FD9 R
  6 PARS5      000FFC R   |   6 PARS6      001011 R   |   6 PARS7      001020 R
  6 PARS8      00102F R   |   6 PARSE      001040 R   |   6 PAUSE      0002DE R
    PA_BASE =  005000     |     PA_CR1  =  005003     |     PA_CR2  =  005004 
    PA_DDR  =  005002     |     PA_IDR  =  005001     |     PA_ODR  =  005000 
    PB      =  000005     |     PB_BASE =  005005     |     PB_CR1  =  005008 
    PB_CR2  =  005009     |     PB_DDR  =  005007     |     PB_IDR  =  005006 
    PB_ODR  =  005005     |     PC      =  00000A     |     PC_BASE =  00500A 
    PC_CR1  =  00500D     |     PC_CR2  =  00500E     |     PC_DDR  =  00500C 
    PC_IDR  =  00500B     |     PC_ODR  =  00500A     |     PD      =  00000F 
  6 PDUM1      001855 R   |   6 PDUM2      001866 R   |     PD_BASE =  00500F 
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
    PI      =  000028     |   6 PICK       000A9D R   |   6 PII        001A52 R
    PI_BASE =  005028     |     PI_CR1  =  00502B     |     PI_CR2  =  00502C 
    PI_DDR  =  00502A     |     PI_IDR  =  005029     |     PI_ODR  =  005028 
  6 PLUS       0006DE R   |   6 PNAM1      00162C R   |   6 PRESE      0013AE R
    PROD1   =  000022     |     PROD2   =  000024     |     PROD3   =  000026 
  6 PROTECTE   0001FF R   |   6 PSTOR      000AB4 R   |     PTR16   =  000033 
    PTR8    =  000034     |   6 QBRAN      0003E7 R   |   6 QDUP       00068D R
  6 QDUP1      000697 R   |   6 QKEY       000380 R   |   6 QSTAC      001366 R
  6 QUERY      001292 R   |   6 QUEST      000F69 R   |   6 QUIT       0013CB R
  6 QUIT1      0013D3 R   |   6 QUIT2      0013D6 R   |   6 RAM2EE     002045 R
    RAMBASE =  000000     |   6 RAMLAST    000662 R   |     RAM_BASE=  000000 
    RAM_END =  0017FF     |     RAM_SIZE=  001800     |   6 RANDOM     00027C R
  6 RAT        0004A0 R   |   6 RBRAC      0016EB R   |   6 REPEA      001570 R
  6 RFREE      00202C R   |   6 RFROM      00048D R   |     ROP     =  004800 
  6 ROT        00069E R   |   6 ROW2BUF    001FEE R   |     ROWBUFF =  001680 
    RP0     =  00002C     |   6 RPAT       00046A R   |     RPP     =  0017FF 
  6 RPSTO      000477 R   |   6 RSHIFT     000A12 R   |   6 RSHIFT1    000A1B R
  6 RSHIFT4    000A23 R   |     RST_SR  =  0050B3     |   6 RT12_2     001AC2 R
  6 SAME1      0010E9 R   |   6 SAME2      001112 R   |   6 SAMEQ      0010E1 R
  6 SCOM1      001661 R   |   6 SCOM2      001664 R   |   6 SCOMP      001643 R
  6 SEE        001943 R   |   6 SEE1       00194C R   |   6 SEE2       001960 R
  6 SEE3       001973 R   |   6 SEE4       00197C R   |   6 SEED       000263 R
    SEEDX   =  000036     |     SEEDY   =  000038     |   6 SEMIS      001687 R
  6 SETISP     0000CE R   |   6 SET_RAML   0017CE R   |     SFR_BASE=  005000 
    SFR_END =  0057FF     |   6 SIGN       000C9F R   |   6 SIGN1      000CAF R
  6 SLASH      0008FE R   |   6 SLMOD      0008E2 R   |   6 SNAME      0015F6 R
    SP0     =  00002A     |   6 SPACE      000E63 R   |   6 SPACS      000E72 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]

Symbol Table

  6 SPAT       0004C3 R   |     SPI_CR1 =  005200     |     SPI_CR2 =  005201 
    SPI_CRCP=  005205     |     SPI_DR  =  005204     |     SPI_ICR =  005202 
    SPI_RXCR=  005206     |     SPI_SR  =  005203     |     SPI_TXCR=  005207 
    SPP     =  001680     |     SPSAVE  =  000001     |   6 SPSTO      0004D0 R
  6 SQRT10     001AAB R   |   6 SQRT2      001A69 R   |   6 SQRT3      001A80 R
  6 SSMOD      00098E R   |     SSP     =  000001     |     STACK   =  0017FF 
  6 STAR       000957 R   |   6 STASL      00099F R   |   6 STOD       000740 R
  6 STORE      000425 R   |   6 STR        000CCD R   |   6 STRCQ      001478 R
  6 STRQ       0015AF R   |   6 STRQP      000EE0 R   |   6 SUBB       000757 R
  6 SWAPP      0004F3 R   |     SWIM_CSR=  007F80     |   6 TAP        0011FC R
  6 TBOOT      0019D8 R   |   6 TBUF       0005DE R   |     TBUFFBAS=  001680 
  6 TCHAR      000A6E R   |   6 TEMP       0005AF R   |   6 TEVAL      000601 R
  6 TFLASH     0005F0 R   |   6 THENN      001508 R   |   6 TIB        000B54 R
    TIBB    =  001700     |     TIBBASE =  001700     |     TIC     =  000027 
  6 TICK       0013E2 R   |     TIM1_ARR=  005262     |     TIM1_ARR=  005263 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]

Symbol Table

    TIM1_SR1=  005255     |     TIM1_SR1=  000007     |     TIM1_SR1=  000001 
    TIM1_SR1=  000002     |     TIM1_SR1=  000003     |     TIM1_SR1=  000004 
    TIM1_SR1=  000005     |     TIM1_SR1=  000006     |     TIM1_SR1=  000000 
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
    TIM4_SR_=  000000     |   6 TIMEOUTQ   00030E R   |   6 TIMER      0002F8 R
    TIM_CR1_=  000007     |     TIM_CR1_=  000000     |     TIM_CR1_=  000006 
    TIM_CR1_=  000005     |     TIM_CR1_=  000004     |     TIM_CR1_=  000003 
    TIM_CR1_=  000001     |     TIM_CR1_=  000002     |   6 TNAM2      0018EB R
  6 TNAM3      001909 R   |   6 TNAM4      00190F R   |   6 TNAME      0018E8 R
  6 TOFLASH    000333 R   |   6 TOKEN      0010BD R   |   6 TOR        0004AC R
  6 TORAM      000373 R   |     TRUEE   =  00FFFF     |   6 TWOSL      000A2A R
  6 TYPE1      000E92 R   |   6 TYPE2      000E9E R   |   6 TYPES      000E8D R
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]

Symbol Table

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
    UBC     =  004801     |     UCNTXT  =  000014     |     UCP     =  000018 
    UCTIB   =  00000C     |     UD1     =  000001     |     UD2     =  000002 
    UD3     =  000003     |     UD4     =  000004     |   6 UDOT       000F33 R
  6 UDOTR      000F13 R   |   6 UEND       000045 R   |     UHLD    =  000012 
    UINN    =  00000A     |     UINTER  =  000010     |     ULAST   =  00001A 
  6 ULES1      0007B4 R   |   6 ULESS      00079E R   |   6 UMMOD      000834 R
  6 UMSTA      00090D R   |   6 UNIQ1      0015ED R   |   6 UNIQU      0015CE R
  6 UNTIL      0014D0 R   |     UOFFSET =  00001C     |   6 UPDATCP    001BC1 R
  6 UPDATLAS   001B98 R   |   6 UPDATPTR   002138 R   |   6 UPDATRUN   001BB0 R
  6 UPDATVP    001BD8 R   |   6 UPL1       000584 R   |   6 UPLUS      00056D R
    UPP     =  000006     |     URLAST  =  000020     |     USR_BTN_=  000004 
    USR_BTN_=  000010     |     USR_BTN_=  005015     |     UTFLASH =  00001E 
    UTIB    =  00000E     |     UTMP    =  000008     |   6 UTYP1      001825 R
  6 UTYP2      001834 R   |   6 UTYPE      001820 R   |     UVP     =  000016 
  6 UZERO      00002B R   |   6 VARIA      00179B R   |     VAR_BASE=  000080 
    VAR_TOP =  0017BF     |     VER     =  000003     |   6 VPP        000631 R
    VSIZE   =  000006     |     WANT_DEB=  000000     |     WANT_MAT=  000001 
    WANT_SEE=  000001     |     WDGOPT  =  004805     |     WDGOPT_I=  000002 
    WDGOPT_L=  000003     |     WDGOPT_W=  000000     |     WDGOPT_W=  000001 
  6 WHILE      001556 R   |   6 WITHI      000819 R   |   6 WORDD      0010A9 R
  6 WORDS      00198F R   |   6 WORS1      001995 R   |   6 WORS2      0019B1 R
    WWDG_CR =  0050D1     |     WWDG_WR =  0050D2     |   6 XORR       000558 R
    XTEMP   =  000022     |     YTEMP   =  000024     |   6 ZERO       000A44 R
  6 ZL1        000525 R   |   6 ZLESS      00051C R   |   6 app_spac   002200 R
  6 block_er   001D5B R   |   6 clear_ra   000019 R   |   6 clock_in   000062 R
  6 copy_buf   001DB2 R   |   6 copy_buf   001DD1 R   |   6 copy_pro   001DD1 R
    da      =  000002     |     db      =  000003     |     dc      =  000000 
    dd      =  000001     |   6 ee_ccomm   001FCC R   |   6 ee_comma   001FAB R
  6 ee_cstor   001CC8 R   |   6 ee_store   001D14 R   |   6 erase_fl   001D77 R
  6 farat      001BE9 R   |   6 farcat     001C05 R   |   6 fmove_do   002121 R
  6 fptr_sto   001B04 R   |   6 inc_fptr   001C96 R   |   6 lock       001C82 R
  6 main       000016 R   |   6 next_row   0020DE R   |   6 no_move    002128 R
  6 pristine   001E4C R   |   6 proceed_   001D7A R   |   6 reboot     000325 R
  6 reset_ve   001EB3 R   |   6 row_eras   001D3E R   |   6 row_eras   001D8B R
  6 row_eras   001DB2 R   |   6 set_opti   001E20 R   |   6 set_vect   001F54 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]

Symbol Table

  6 uart1_in   000074 R   |   6 unlock     001C5A R   |   6 unlock_e   001C1C R
  6 unlock_f   001C3B R   |   6 write_by   001CAD R   |   6 write_ro   001DF6 R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 DATA       size      0   flags    8
   2 DATA0      size      0   flags    8
   3 SSEG       size      0   flags    8
   4 SSEG1      size    100   flags    8
   5 HOME       size     80   flags    0
   6 CODE       size   2200   flags    0

