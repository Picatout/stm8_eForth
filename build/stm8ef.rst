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
      0080B5 93 77                  275         .word      INTER   ;'EVAL
      0080B7 00 00                  276         .word      0       ;HLD
      0080B9 A1 AB                  277         .word      LASTN  ;CNTXT pointer
      0080BB 00 80                  278         .word      VAR_BASE   ;variables free space pointer 
      0080BD A2 00                  279         .word      app_space ; FLASH free space pointer 
      0080BF A1 AB                  280         .word      LASTN   ;LAST
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
      00812B CC 9A 19         [ 2]  332         jp  COLD   ;default=MN1
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
      0081A7 CD 91 3C         [ 4]  417         call TOKEN 
      0081AA CD 85 63         [ 4]  418         call DUPP 
      0081AD CD 84 67         [ 4]  419         call QBRAN 
      0081B0 82 8D                  420         .word FORGET2
      0081B2 CD 92 39         [ 4]  421         call NAMEQ
      0081B5 CD 87 0D         [ 4]  422         call QDUP 
      0081B8 CD 84 67         [ 4]  423         call QBRAN 
      0081BB 82 8D                  424         .word FORGET2
      0081BD CD 85 59         [ 4]  425         call DROP 
      0081C0 1D 00 04         [ 2]  426         subw x,#2*CELLL 
      0081C3 90 5F            [ 1]  427         clrw y 
      0081C5 FF               [ 2]  428         ldw (x),y 
      0081C6 90 AE 40 02      [ 2]  429         ldw y,#APP_RUN 
      0081CA EF 02            [ 2]  430         ldw (2,x),y 
      0081CC CC 9D 49         [ 2]  431         jp ee_store 
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
      0081D8 CD 91 3C         [ 4]  442         call TOKEN
      0081DB CD 85 63         [ 4]  443         call DUPP 
      0081DE CD 84 67         [ 4]  444         call QBRAN 
      0081E1 82 8D                  445         .word FORGET2
      0081E3 CD 92 39         [ 4]  446         call NAMEQ ; ( a -- ca na | a F )
      0081E6 CD 87 0D         [ 4]  447         call QDUP 
      0081E9 CD 84 67         [ 4]  448         call QBRAN 
      0081EC 82 8D                  449         .word FORGET2
                                    450 ; only forget users words 
      0081EE CD 85 63         [ 4]  451         call DUPP ; ( ca na na )
      0081F1 CD 84 34         [ 4]  452         call DOLIT 
      0081F4 A2 00                  453         .word app_space 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



      0081F6 CD 85 73         [ 4]  454         call SWAPP 
      0081F9 CD 88 1E         [ 4]  455         call  ULESS 
      0081FC CD 84 67         [ 4]  456         call QBRAN 
      0081FF 82 4F                  457         .word FORGET6 
                                    458 ; ( ca na -- )        
                                    459 ;reset ivec with address >= ca
      008201 CD 85 73         [ 4]  460         call SWAPP ; ( na ca -- ) 
      008204 CD 9F 3A         [ 4]  461         call CHKIVEC ; ( na -- ) 
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
      008249 CD 9B F6         [ 4]  489         call UPDATCP 
      00824C CC 9B CD         [ 2]  490         jp UPDATLAST 
      00824F                        491 FORGET6: ; tried to forget a RAM or system word 
                                    492 ; ( ca na -- )
      00824F 1D 00 02         [ 2]  493         subw x,#CELLL 
      008252 90 BE 2A         [ 2]  494         ldw y,SP0 
      008255 FF               [ 2]  495         ldw (x),y  
      008256 CD 88 1E         [ 4]  496         call ULESS
      008259 CD 84 67         [ 4]  497         call QBRAN 
      00825C 82 7F                  498         .word PROTECTED 
      00825E CD 93 45         [ 4]  499         call ABORQ 
      008261 1D                     500         .byte 29
      008262 20 46 6F 72 20 52 41   501         .ascii " For RAM definition do REBOOT"
             4D 20 64 65 66 69 6E
             69 74 69 6F 6E 20 64
             6F 20 52 45 42 4F 4F
             54
      00827F                        502 PROTECTED:
      00827F CD 93 45         [ 4]  503         call ABORQ
      008282 0A                     504         .byte 10
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



      008283 20 50 72 6F 74 65 63   505         .ascii " Protected"
             74 65 64
      00828D                        506 FORGET2: ; no name or not found in dictionary 
      00828D CD 93 45         [ 4]  507         call ABORQ
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
      0082D6 CC 9C 0D         [ 2]  542         jp UPDATVP 
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
      0083C1 CD 93 45         [ 4]  709         call ABORQ 
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
                                   2291 ;       PACK0   ( b u a -- a )
                                   2292 ;       Build a counted string with
                                   2293 ;       u characters from b. Null fill.
      008C6A 8C 5B                 2294         .word      LINK
                           000BEC  2295 LINK = . 
      008C6C 05                    2296         .byte      5
      008C6D 50 41 43 4B 30        2297         .ascii     "PACK0"
      008C72                       2298 PACKS:
      008C72 CD 85 63         [ 4] 2299         CALL     DUPP
      008C75 CD 85 2C         [ 4] 2300         CALL     TOR     ;strings only on cell boundary
      008C78 CD 87 49         [ 4] 2301         CALL     DDUP
      008C7B CD 84 C9         [ 4] 2302         CALL     CSTOR
      008C7E CD 8A 58         [ 4] 2303         CALL     ONEP ;save count
      008C81 CD 85 73         [ 4] 2304         CALL     SWAPP
      008C84 CD 8B FF         [ 4] 2305         CALL     CMOVE
      008C87 CD 85 0D         [ 4] 2306         CALL     RFROM
      008C8A 81               [ 4] 2307         RET
                                   2308 
                                   2309 ;; Numeric output, single precision
                                   2310 
                                   2311 ;       DIGIT   ( u -- c )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



                                   2312 ;       Convert digit u to a character.
      008C8B 8C 6C                 2313         .word      LINK
                           000C0D  2314 LINK = . 
      008C8D 05                    2315         .byte      5
      008C8E 44 49 47 49 54        2316         .ascii     "DIGIT"
      008C93                       2317 DIGIT:
      008C93 CD 84 34         [ 4] 2318         CALL	DOLIT
      008C96 00 09                 2319         .word	9
      008C98 CD 85 8D         [ 4] 2320         CALL	OVER
      008C9B CD 88 3C         [ 4] 2321         CALL	LESS
      008C9E CD 84 34         [ 4] 2322         CALL	DOLIT
      008CA1 00 07                 2323         .word	7
      008CA3 CD 85 AF         [ 4] 2324         CALL	ANDD
      008CA6 CD 87 5E         [ 4] 2325         CALL	PLUS
      008CA9 CD 84 34         [ 4] 2326         CALL	DOLIT
      008CAC 00 30                 2327         .word	48	;'0'
      008CAE CC 87 5E         [ 2] 2328         JP	PLUS
                                   2329 
                                   2330 ;       EXTRACT ( n base -- n c )
                                   2331 ;       Extract least significant digit from n.
      008CB1 8C 8D                 2332         .word      LINK
                           000C33  2333 LINK = . 
      008CB3 07                    2334         .byte      7
      008CB4 45 58 54 52 41 43 54  2335         .ascii     "EXTRACT"
      008CBB                       2336 EXTRC:
      008CBB CD 8A C4         [ 4] 2337         CALL     ZERO
      008CBE CD 85 73         [ 4] 2338         CALL     SWAPP
      008CC1 CD 88 B4         [ 4] 2339         CALL     UMMOD
      008CC4 CD 85 73         [ 4] 2340         CALL     SWAPP
      008CC7 CC 8C 93         [ 2] 2341         JP     DIGIT
                                   2342 
                                   2343 ;       <#      ( -- )
                                   2344 ;       Initiate  numeric output process.
      008CCA 8C B3                 2345         .word      LINK
                           000C4C  2346 LINK = . 
      008CCC 02                    2347         .byte      2
      008CCD 3C 23                 2348         .ascii     "<#"
      008CCF                       2349 BDIGS:
      008CCF CD 8B C3         [ 4] 2350         CALL     PAD
      008CD2 CD 86 90         [ 4] 2351         CALL     HLD
      008CD5 CC 84 A5         [ 2] 2352         JP     STORE
                                   2353 
                                   2354 ;       HOLD    ( c -- )
                                   2355 ;       Insert a character into output string.
      008CD8 8C CC                 2356         .word      LINK
                           000C5A  2357 LINK = . 
      008CDA 04                    2358         .byte      4
      008CDB 48 4F 4C 44           2359         .ascii     "HOLD"
      008CDF                       2360 HOLD:
      008CDF CD 86 90         [ 4] 2361         CALL     HLD
      008CE2 CD 84 BC         [ 4] 2362         CALL     AT
      008CE5 CD 8A 65         [ 4] 2363         CALL     ONEM
      008CE8 CD 85 63         [ 4] 2364         CALL     DUPP
      008CEB CD 86 90         [ 4] 2365         CALL     HLD
      008CEE CD 84 A5         [ 4] 2366         CALL     STORE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



      008CF1 CC 84 C9         [ 2] 2367         JP     CSTOR
                                   2368 
                                   2369 ;       #       ( u -- u )
                                   2370 ;       Extract one digit from u and
                                   2371 ;       append digit to output string.
      008CF4 8C DA                 2372         .word      LINK
                           000C76  2373 LINK = . 
      008CF6 01                    2374         .byte      1
      008CF7 23                    2375         .ascii     "#"
      008CF8                       2376 DIG:
      008CF8 CD 86 20         [ 4] 2377         CALL     BASE
      008CFB CD 84 BC         [ 4] 2378         CALL     AT
      008CFE CD 8C BB         [ 4] 2379         CALL     EXTRC
      008D01 CC 8C DF         [ 2] 2380         JP     HOLD
                                   2381 
                                   2382 ;       #S      ( u -- 0 )
                                   2383 ;       Convert u until all digits
                                   2384 ;       are added to output string.
      008D04 8C F6                 2385         .word      LINK
                           000C86  2386 LINK = . 
      008D06 02                    2387         .byte      2
      008D07 23 53                 2388         .ascii     "#S"
      008D09                       2389 DIGS:
      008D09 CD 8C F8         [ 4] 2390 DIGS1:  CALL     DIG
      008D0C CD 85 63         [ 4] 2391         CALL     DUPP
      008D0F CD 84 67         [ 4] 2392         CALL     QBRAN
      008D12 8D 16                 2393         .word      DIGS2
      008D14 20 F3            [ 2] 2394         JRA     DIGS1
      008D16 81               [ 4] 2395 DIGS2:  RET
                                   2396 
                                   2397 ;       SIGN    ( n -- )
                                   2398 ;       Add a minus sign to
                                   2399 ;       numeric output string.
      008D17 8D 06                 2400         .word      LINK
                           000C99  2401 LINK = . 
      008D19 04                    2402         .byte      4
      008D1A 53 49 47 4E           2403         .ascii     "SIGN"
      008D1E                       2404 SIGN:
      008D1E CD 85 9C         [ 4] 2405         CALL     ZLESS
      008D21 CD 84 67         [ 4] 2406         CALL     QBRAN
      008D24 8D 2E                 2407         .word      SIGN1
      008D26 CD 84 34         [ 4] 2408         CALL     DOLIT
      008D29 00 2D                 2409         .word      45	;"-"
      008D2B CC 8C DF         [ 2] 2410         JP     HOLD
      008D2E 81               [ 4] 2411 SIGN1:  RET
                                   2412 
                                   2413 ;       #>      ( w -- b u )
                                   2414 ;       Prepare output string.
      008D2F 8D 19                 2415         .word      LINK
                           000CB1  2416 LINK = . 
      008D31 02                    2417         .byte      2
      008D32 23 3E                 2418         .ascii     "#>"
      008D34                       2419 EDIGS:
      008D34 CD 85 59         [ 4] 2420         CALL     DROP
      008D37 CD 86 90         [ 4] 2421         CALL     HLD
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      008D3A CD 84 BC         [ 4] 2422         CALL     AT
      008D3D CD 8B C3         [ 4] 2423         CALL     PAD
      008D40 CD 85 8D         [ 4] 2424         CALL     OVER
      008D43 CC 87 D7         [ 2] 2425         JP     SUBB
                                   2426 
                                   2427 ;       str     ( w -- b u )
                                   2428 ;       Convert a signed integer
                                   2429 ;       to a numeric string.
      008D46 8D 31                 2430         .word      LINK
                           000CC8  2431 LINK = . 
      008D48 03                    2432         .byte      3
      008D49 53 54 52              2433         .ascii     "STR"
      008D4C                       2434 STR:
      008D4C CD 85 63         [ 4] 2435         CALL     DUPP
      008D4F CD 85 2C         [ 4] 2436         CALL     TOR
      008D52 CD 87 F1         [ 4] 2437         CALL     ABSS
      008D55 CD 8C CF         [ 4] 2438         CALL     BDIGS
      008D58 CD 8D 09         [ 4] 2439         CALL     DIGS
      008D5B CD 85 0D         [ 4] 2440         CALL     RFROM
      008D5E CD 8D 1E         [ 4] 2441         CALL     SIGN
      008D61 CC 8D 34         [ 2] 2442         JP     EDIGS
                                   2443 
                                   2444 ;       HEX     ( -- )
                                   2445 ;       Use radix 16 as base for
                                   2446 ;       numeric conversions.
      008D64 8D 48                 2447         .word      LINK
                           000CE6  2448 LINK = . 
      008D66 03                    2449         .byte      3
      008D67 48 45 58              2450         .ascii     "HEX"
      008D6A                       2451 HEX:
      008D6A CD 84 34         [ 4] 2452         CALL     DOLIT
      008D6D 00 10                 2453         .word      16
      008D6F CD 86 20         [ 4] 2454         CALL     BASE
      008D72 CC 84 A5         [ 2] 2455         JP     STORE
                                   2456 
                                   2457 ;       DECIMAL ( -- )
                                   2458 ;       Use radix 10 as base
                                   2459 ;       for numeric conversions.
      008D75 8D 66                 2460         .word      LINK
                           000CF7  2461 LINK = . 
      008D77 07                    2462         .byte      7
      008D78 44 45 43 49 4D 41 4C  2463         .ascii     "DECIMAL"
      008D7F                       2464 DECIM:
      008D7F CD 84 34         [ 4] 2465         CALL     DOLIT
      008D82 00 0A                 2466         .word      10
      008D84 CD 86 20         [ 4] 2467         CALL     BASE
      008D87 CC 84 A5         [ 2] 2468         JP     STORE
                                   2469 
                                   2470 ;; Numeric input, single precision
                                   2471 
                                   2472 ;       DIGIT?  ( c base -- u t )
                                   2473 ;       Convert a character to its numeric
                                   2474 ;       value. A flag indicates success.
      008D8A 8D 77                 2475         .word      LINK
                           000D0C  2476 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      008D8C 06                    2477         .byte       6
      008D8D 44 49 47 49 54 3F     2478         .ascii     "DIGIT?"
      008D93                       2479 DIGTQ:
      008D93 CD 85 2C         [ 4] 2480         CALL     TOR
      008D96 CD 84 34         [ 4] 2481         CALL     DOLIT
      008D99 00 30                 2482         .word     48	; "0"
      008D9B CD 87 D7         [ 4] 2483         CALL     SUBB
      008D9E CD 84 34         [ 4] 2484         CALL     DOLIT
      008DA1 00 09                 2485         .word      9
      008DA3 CD 85 8D         [ 4] 2486         CALL     OVER
      008DA6 CD 88 3C         [ 4] 2487         CALL     LESS
      008DA9 CD 84 67         [ 4] 2488         CALL     QBRAN
      008DAC 8D C4                 2489         .word      DGTQ1
      008DAE CD 84 34         [ 4] 2490         CALL     DOLIT
      008DB1 00 07                 2491         .word      7
      008DB3 CD 87 D7         [ 4] 2492         CALL     SUBB
      008DB6 CD 85 63         [ 4] 2493         CALL     DUPP
      008DB9 CD 84 34         [ 4] 2494         CALL     DOLIT
      008DBC 00 0A                 2495         .word      10
      008DBE CD 88 3C         [ 4] 2496         CALL     LESS
      008DC1 CD 85 C3         [ 4] 2497         CALL     ORR
      008DC4 CD 85 63         [ 4] 2498 DGTQ1:  CALL     DUPP
      008DC7 CD 85 0D         [ 4] 2499         CALL     RFROM
      008DCA CC 88 1E         [ 2] 2500         JP     ULESS
                                   2501 
                                   2502 ;       NUMBER? ( a -- n T | a F )
                                   2503 ;       Convert a number string to
                                   2504 ;       integer. Push a flag on tos.
      008DCD 8D 8C                 2505         .word      LINK
                           000D4F  2506 LINK = . 
      008DCF 07                    2507         .byte      7
      008DD0 4E 55 4D 42 45 52 3F  2508         .ascii     "NUMBER?"
      008DD7                       2509 NUMBQ:
      008DD7 CD 86 20         [ 4] 2510         CALL     BASE
      008DDA CD 84 BC         [ 4] 2511         CALL     AT
      008DDD CD 85 2C         [ 4] 2512         CALL     TOR
      008DE0 CD 8A C4         [ 4] 2513         CALL     ZERO
      008DE3 CD 85 8D         [ 4] 2514         CALL     OVER
      008DE6 CD 8B 9B         [ 4] 2515         CALL     COUNT
      008DE9 CD 85 8D         [ 4] 2516         CALL     OVER
      008DEC CD 84 DA         [ 4] 2517         CALL     CAT
      008DEF CD 84 34         [ 4] 2518         CALL     DOLIT
      008DF2 00 24                 2519         .word     36	; "0x"
      008DF4 CD 87 FF         [ 4] 2520         CALL     EQUAL
      008DF7 CD 84 67         [ 4] 2521         CALL     QBRAN
      008DFA 8E 0B                 2522         .word      NUMQ1
      008DFC CD 8D 6A         [ 4] 2523         CALL     HEX
      008DFF CD 85 73         [ 4] 2524         CALL     SWAPP
      008E02 CD 8A 58         [ 4] 2525         CALL     ONEP
      008E05 CD 85 73         [ 4] 2526         CALL     SWAPP
      008E08 CD 8A 65         [ 4] 2527         CALL     ONEM
      008E0B CD 85 8D         [ 4] 2528 NUMQ1:  CALL     OVER
      008E0E CD 84 DA         [ 4] 2529         CALL     CAT
      008E11 CD 84 34         [ 4] 2530         CALL     DOLIT
      008E14 00 2D                 2531         .word     45	; "-"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



      008E16 CD 87 FF         [ 4] 2532         CALL     EQUAL
      008E19 CD 85 2C         [ 4] 2533         CALL     TOR
      008E1C CD 85 73         [ 4] 2534         CALL     SWAPP
      008E1F CD 85 20         [ 4] 2535         CALL     RAT
      008E22 CD 87 D7         [ 4] 2536         CALL     SUBB
      008E25 CD 85 73         [ 4] 2537         CALL     SWAPP
      008E28 CD 85 20         [ 4] 2538         CALL     RAT
      008E2B CD 87 5E         [ 4] 2539         CALL     PLUS
      008E2E CD 87 0D         [ 4] 2540         CALL     QDUP
      008E31 CD 84 67         [ 4] 2541         CALL     QBRAN
      008E34 8E 95                 2542         .word      NUMQ6
      008E36 CD 8A 65         [ 4] 2543         CALL     ONEM
      008E39 CD 85 2C         [ 4] 2544         CALL     TOR
      008E3C CD 85 63         [ 4] 2545 NUMQ2:  CALL     DUPP
      008E3F CD 85 2C         [ 4] 2546         CALL     TOR
      008E42 CD 84 DA         [ 4] 2547         CALL     CAT
      008E45 CD 86 20         [ 4] 2548         CALL     BASE
      008E48 CD 84 BC         [ 4] 2549         CALL     AT
      008E4B CD 8D 93         [ 4] 2550         CALL     DIGTQ
      008E4E CD 84 67         [ 4] 2551         CALL     QBRAN
      008E51 8E 83                 2552         .word      NUMQ4
      008E53 CD 85 73         [ 4] 2553         CALL     SWAPP
      008E56 CD 86 20         [ 4] 2554         CALL     BASE
      008E59 CD 84 BC         [ 4] 2555         CALL     AT
      008E5C CD 89 D7         [ 4] 2556         CALL     STAR
      008E5F CD 87 5E         [ 4] 2557         CALL     PLUS
      008E62 CD 85 0D         [ 4] 2558         CALL     RFROM
      008E65 CD 8A 58         [ 4] 2559         CALL     ONEP
      008E68 CD 84 48         [ 4] 2560         CALL     DONXT
      008E6B 8E 3C                 2561         .word      NUMQ2
      008E6D CD 85 20         [ 4] 2562         CALL     RAT
      008E70 CD 85 73         [ 4] 2563         CALL     SWAPP
      008E73 CD 85 59         [ 4] 2564         CALL     DROP
      008E76 CD 84 67         [ 4] 2565         CALL     QBRAN
      008E79 8E 7E                 2566         .word      NUMQ3
      008E7B CD 87 89         [ 4] 2567         CALL     NEGAT
      008E7E CD 85 73         [ 4] 2568 NUMQ3:  CALL     SWAPP
      008E81 20 0F            [ 2] 2569         JRA     NUMQ5
      008E83 CD 85 0D         [ 4] 2570 NUMQ4:  CALL     RFROM
      008E86 CD 85 0D         [ 4] 2571         CALL     RFROM
      008E89 CD 87 3E         [ 4] 2572         CALL     DDROP
      008E8C CD 87 3E         [ 4] 2573         CALL     DDROP
      008E8F CD 8A C4         [ 4] 2574         CALL     ZERO
      008E92 CD 85 63         [ 4] 2575 NUMQ5:  CALL     DUPP
      008E95 CD 85 0D         [ 4] 2576 NUMQ6:  CALL     RFROM
      008E98 CD 87 3E         [ 4] 2577         CALL     DDROP
      008E9B CD 85 0D         [ 4] 2578         CALL     RFROM
      008E9E CD 86 20         [ 4] 2579         CALL     BASE
      008EA1 CC 84 A5         [ 2] 2580         JP     STORE
                                   2581 
                                   2582 ;; Basic I/O
                                   2583 
                                   2584 ;       KEY     ( -- c )
                                   2585 ;       Wait for and return an
                                   2586 ;       input character.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      008EA4 8D CF                 2587         .word      LINK
                           000E26  2588 LINK = . 
      008EA6 03                    2589         .byte      3
      008EA7 4B 45 59              2590         .ascii     "KEY"
      008EAA                       2591 KEY:
      008EAA 72 0B 52 30 FB   [ 2] 2592         btjf UART1_SR,#UART_SR_RXNE,. 
      008EAF C6 52 31         [ 1] 2593         ld a,UART1_DR 
      008EB2 1D 00 02         [ 2] 2594         subw x,#CELLL 
      008EB5 E7 01            [ 1] 2595         ld (1,x),a 
      008EB7 7F               [ 1] 2596         clr (x)
      008EB8 81               [ 4] 2597         ret 
                                   2598 
                                   2599 ;       NUF?    ( -- t )
                                   2600 ;       Return false if no input,
                                   2601 ;       else pause and if CR return true.
      008EB9 8E A6                 2602         .word      LINK
                           000E3B  2603 LINK = . 
      008EBB 04                    2604         .byte      4
      008EBC 4E 55 46 3F           2605         .ascii     "NUF?"
      008EC0                       2606 NUFQ:
      008EC0 CD 84 00         [ 4] 2607         CALL     QKEY
      008EC3 CD 85 63         [ 4] 2608         CALL     DUPP
      008EC6 CD 84 67         [ 4] 2609         CALL     QBRAN
      008EC9 8E D9                 2610         .word    NUFQ1
      008ECB CD 87 3E         [ 4] 2611         CALL     DDROP
      008ECE CD 8E AA         [ 4] 2612         CALL     KEY
      008ED1 CD 84 34         [ 4] 2613         CALL     DOLIT
      008ED4 00 0D                 2614         .word      CRR
      008ED6 CC 87 FF         [ 2] 2615         JP     EQUAL
      008ED9 81               [ 4] 2616 NUFQ1:  RET
                                   2617 
                                   2618 ;       SPACE   ( -- )
                                   2619 ;       Send  blank character to
                                   2620 ;       output device.
      008EDA 8E BB                 2621         .word      LINK
                           000E5C  2622 LINK = . 
      008EDC 05                    2623         .byte      5
      008EDD 53 50 41 43 45        2624         .ascii     "SPACE"
      008EE2                       2625 SPACE:
      008EE2 CD 8A B7         [ 4] 2626         CALL     BLANK
      008EE5 CC 84 1E         [ 2] 2627         JP     EMIT
                                   2628 
                                   2629 ;       SPACES  ( +n -- )
                                   2630 ;       Send n spaces to output device.
      008EE8 8E DC                 2631         .word      LINK
                           000E6A  2632 LINK = . 
      008EEA 06                    2633         .byte      6
      008EEB 53 50 41 43 45 53     2634         .ascii     "SPACES"
      008EF1                       2635 SPACS:
      008EF1 CD 8A C4         [ 4] 2636         CALL     ZERO
      008EF4 CD 88 5C         [ 4] 2637         CALL     MAX
      008EF7 CD 85 2C         [ 4] 2638         CALL     TOR
      008EFA 20 03            [ 2] 2639         JRA      CHAR2
      008EFC CD 8E E2         [ 4] 2640 CHAR1:  CALL     SPACE
      008EFF CD 84 48         [ 4] 2641 CHAR2:  CALL     DONXT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



      008F02 8E FC                 2642         .word    CHAR1
      008F04 81               [ 4] 2643         RET
                                   2644 
                                   2645 ;       TYPE    ( b u -- )
                                   2646 ;       Output u characters from b.
      008F05 8E EA                 2647         .word      LINK
                           000E87  2648 LINK = . 
      008F07 04                    2649         .byte      4
      008F08 54 59 50 45           2650         .ascii     "TYPE"
      008F0C                       2651 TYPES:
      008F0C CD 85 2C         [ 4] 2652         CALL     TOR
      008F0F 20 0C            [ 2] 2653         JRA     TYPE2
      008F11 CD 85 63         [ 4] 2654 TYPE1:  CALL     DUPP
      008F14 CD 84 DA         [ 4] 2655         CALL     CAT
      008F17 CD 84 1E         [ 4] 2656         CALL     EMIT
      008F1A CD 8A 58         [ 4] 2657         CALL     ONEP
      008F1D CD 84 48         [ 4] 2658 TYPE2:  CALL     DONXT
      008F20 8F 11                 2659         .word      TYPE1
      008F22 CC 85 59         [ 2] 2660         JP     DROP
                                   2661 
                                   2662 ;       CR      ( -- )
                                   2663 ;       Output a carriage return
                                   2664 ;       and a line feed.
      008F25 8F 07                 2665         .word      LINK
                           000EA7  2666 LINK = . 
      008F27 02                    2667         .byte      2
      008F28 43 52                 2668         .ascii     "CR"
      008F2A                       2669 CR:
      008F2A CD 84 34         [ 4] 2670         CALL     DOLIT
      008F2D 00 0D                 2671         .word      CRR
      008F2F CD 84 1E         [ 4] 2672         CALL     EMIT
      008F32 CD 84 34         [ 4] 2673         CALL     DOLIT
      008F35 00 0A                 2674         .word      LF
      008F37 CC 84 1E         [ 2] 2675         JP     EMIT
                                   2676 
                                   2677 ;       do$     ( -- a )
                                   2678 ;       Return  address of a compiled
                                   2679 ;       string.
      008F3A 8F 27                 2680         .word      LINK
                           000EBC  2681 LINK = . 
      008F3C 43                    2682 	.byte      COMPO+3
      008F3D 44 4F 24              2683         .ascii     "DO$"
      008F40                       2684 DOSTR:
      008F40 CD 85 0D         [ 4] 2685         CALL     RFROM
      008F43 CD 85 20         [ 4] 2686         CALL     RAT
      008F46 CD 85 0D         [ 4] 2687         CALL     RFROM
      008F49 CD 8B 9B         [ 4] 2688         CALL     COUNT
      008F4C CD 87 5E         [ 4] 2689         CALL     PLUS
      008F4F CD 85 2C         [ 4] 2690         CALL     TOR
      008F52 CD 85 73         [ 4] 2691         CALL     SWAPP
      008F55 CD 85 2C         [ 4] 2692         CALL     TOR
      008F58 81               [ 4] 2693         RET
                                   2694 
                                   2695 ;       $"|     ( -- a )
                                   2696 ;       Run time routine compiled by $".
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



                                   2697 ;       Return address of a compiled string.
      008F59 8F 3C                 2698         .word      LINK
                           000EDB  2699 LINK = . 
      008F5B 43                    2700 	.byte      COMPO+3
      008F5C 24 22 7C              2701         .byte     '$','"','|'
      008F5F                       2702 STRQP:
      008F5F CD 8F 40         [ 4] 2703         CALL     DOSTR
      008F62 81               [ 4] 2704         RET
                                   2705 
                                   2706 ;       ."|     ( -- )
                                   2707 ;       Run time routine of ." .
                                   2708 ;       Output a compiled string.
      008F63 8F 5B                 2709         .word      LINK
                           000EE5  2710 LINK = . 
      008F65 43                    2711 	.byte      COMPO+3
      008F66 2E 22 7C              2712         .byte     '.','"','|'
      008F69                       2713 DOTQP:
      008F69 CD 8F 40         [ 4] 2714         CALL     DOSTR
      008F6C CD 8B 9B         [ 4] 2715         CALL     COUNT
      008F6F CC 8F 0C         [ 2] 2716         JP     TYPES
                                   2717 
                                   2718 ;       .R      ( n +n -- )
                                   2719 ;       Display an integer in a field
                                   2720 ;       of n columns, right justified.
      008F72 8F 65                 2721         .word      LINK
                           000EF4  2722 LINK = . 
      008F74 02                    2723         .byte      2
      008F75 2E 52                 2724         .ascii     ".R"
      008F77                       2725 DOTR:
      008F77 CD 85 2C         [ 4] 2726         CALL     TOR
      008F7A CD 8D 4C         [ 4] 2727         CALL     STR
      008F7D CD 85 0D         [ 4] 2728         CALL     RFROM
      008F80 CD 85 8D         [ 4] 2729         CALL     OVER
      008F83 CD 87 D7         [ 4] 2730         CALL     SUBB
      008F86 CD 8E F1         [ 4] 2731         CALL     SPACS
      008F89 CC 8F 0C         [ 2] 2732         JP     TYPES
                                   2733 
                                   2734 ;       U.R     ( u +n -- )
                                   2735 ;       Display an unsigned integer
                                   2736 ;       in n column, right justified.
      008F8C 8F 74                 2737         .word      LINK
                           000F0E  2738 LINK = . 
      008F8E 03                    2739         .byte      3
      008F8F 55 2E 52              2740         .ascii     "U.R"
      008F92                       2741 UDOTR:
      008F92 CD 85 2C         [ 4] 2742         CALL     TOR
      008F95 CD 8C CF         [ 4] 2743         CALL     BDIGS
      008F98 CD 8D 09         [ 4] 2744         CALL     DIGS
      008F9B CD 8D 34         [ 4] 2745         CALL     EDIGS
      008F9E CD 85 0D         [ 4] 2746         CALL     RFROM
      008FA1 CD 85 8D         [ 4] 2747         CALL     OVER
      008FA4 CD 87 D7         [ 4] 2748         CALL     SUBB
      008FA7 CD 8E F1         [ 4] 2749         CALL     SPACS
      008FAA CC 8F 0C         [ 2] 2750         JP     TYPES
                                   2751 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



                                   2752 ;       U.      ( u -- )
                                   2753 ;       Display an unsigned integer
                                   2754 ;       in free format.
      008FAD 8F 8E                 2755         .word      LINK
                           000F2F  2756 LINK = . 
      008FAF 02                    2757         .byte      2
      008FB0 55 2E                 2758         .ascii     "U."
      008FB2                       2759 UDOT:
      008FB2 CD 8C CF         [ 4] 2760         CALL     BDIGS
      008FB5 CD 8D 09         [ 4] 2761         CALL     DIGS
      008FB8 CD 8D 34         [ 4] 2762         CALL     EDIGS
      008FBB CD 8E E2         [ 4] 2763         CALL     SPACE
      008FBE CC 8F 0C         [ 2] 2764         JP     TYPES
                                   2765 
                                   2766 ;       .       ( w -- )
                                   2767 ;       Display an integer in free
                                   2768 ;       format, preceeded by a space.
      008FC1 8F AF                 2769         .word      LINK
                           000F43  2770 LINK = . 
      008FC3 01                    2771         .byte      1
      008FC4 2E                    2772         .ascii     "."
      008FC5                       2773 DOT:
      008FC5 CD 86 20         [ 4] 2774         CALL     BASE
      008FC8 CD 84 BC         [ 4] 2775         CALL     AT
      008FCB CD 84 34         [ 4] 2776         CALL     DOLIT
      008FCE 00 0A                 2777         .word      10
      008FD0 CD 85 D8         [ 4] 2778         CALL     XORR    ;?decimal
      008FD3 CD 84 67         [ 4] 2779         CALL     QBRAN
      008FD6 8F DB                 2780         .word      DOT1
      008FD8 CC 8F B2         [ 2] 2781         JP     UDOT
      008FDB CD 8D 4C         [ 4] 2782 DOT1:   CALL     STR
      008FDE CD 8E E2         [ 4] 2783         CALL     SPACE
      008FE1 CC 8F 0C         [ 2] 2784         JP     TYPES
                                   2785 
                                   2786 ;       ?       ( a -- )
                                   2787 ;       Display contents in memory cell.
      008FE4 8F C3                 2788         .word      LINK
                                   2789         
                           000F66  2790 LINK = . 
      008FE6 01                    2791         .byte      1
      008FE7 3F                    2792         .ascii     "?"
      008FE8                       2793 QUEST:
      008FE8 CD 84 BC         [ 4] 2794         CALL     AT
      008FEB CC 8F C5         [ 2] 2795         JP     DOT
                                   2796 
                                   2797 ;; Parsing
                                   2798 
                                   2799 ;       parse   ( b u c -- b u delta ; <string> )
                                   2800 ;       Scan string delimited by c.
                                   2801 ;       Return found string and its offset.
      008FEE 8F E6                 2802         .word      LINK
                           000F70  2803 LINK = . 
      008FF0 05                    2804         .byte      5
      008FF1 70 61 72 73 65        2805         .ascii     "parse"
      008FF6                       2806 PARS:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



      008FF6 CD 86 2F         [ 4] 2807         CALL     TEMP
      008FF9 CD 84 A5         [ 4] 2808         CALL     STORE
      008FFC CD 85 8D         [ 4] 2809         CALL     OVER
      008FFF CD 85 2C         [ 4] 2810         CALL     TOR
      009002 CD 85 63         [ 4] 2811         CALL     DUPP
      009005 CD 84 67         [ 4] 2812         CALL     QBRAN
      009008 90 AE                 2813         .word    PARS8
      00900A CD 8A 65         [ 4] 2814         CALL     ONEM
      00900D CD 86 2F         [ 4] 2815         CALL     TEMP
      009010 CD 84 BC         [ 4] 2816         CALL     AT
      009013 CD 8A B7         [ 4] 2817         CALL     BLANK
      009016 CD 87 FF         [ 4] 2818         CALL     EQUAL
      009019 CD 84 67         [ 4] 2819         CALL     QBRAN
      00901C 90 4F                 2820         .word      PARS3
      00901E CD 85 2C         [ 4] 2821         CALL     TOR
      009021 CD 8A B7         [ 4] 2822 PARS1:  CALL     BLANK
      009024 CD 85 8D         [ 4] 2823         CALL     OVER
      009027 CD 84 DA         [ 4] 2824         CALL     CAT     ;skip leading blanks ONLY
      00902A CD 87 D7         [ 4] 2825         CALL     SUBB
      00902D CD 85 9C         [ 4] 2826         CALL     ZLESS
      009030 CD 87 78         [ 4] 2827         CALL     INVER
      009033 CD 84 67         [ 4] 2828         CALL     QBRAN
      009036 90 4C                 2829         .word      PARS2
      009038 CD 8A 58         [ 4] 2830         CALL     ONEP
      00903B CD 84 48         [ 4] 2831         CALL     DONXT
      00903E 90 21                 2832         .word      PARS1
      009040 CD 85 0D         [ 4] 2833         CALL     RFROM
      009043 CD 85 59         [ 4] 2834         CALL     DROP
      009046 CD 8A C4         [ 4] 2835         CALL     ZERO
      009049 CC 85 63         [ 2] 2836         JP     DUPP
      00904C CD 85 0D         [ 4] 2837 PARS2:  CALL     RFROM
      00904F CD 85 8D         [ 4] 2838 PARS3:  CALL     OVER
      009052 CD 85 73         [ 4] 2839         CALL     SWAPP
      009055 CD 85 2C         [ 4] 2840         CALL     TOR
      009058 CD 86 2F         [ 4] 2841 PARS4:  CALL     TEMP
      00905B CD 84 BC         [ 4] 2842         CALL     AT
      00905E CD 85 8D         [ 4] 2843         CALL     OVER
      009061 CD 84 DA         [ 4] 2844         CALL     CAT
      009064 CD 87 D7         [ 4] 2845         CALL     SUBB    ;scan for delimiter
      009067 CD 86 2F         [ 4] 2846         CALL     TEMP
      00906A CD 84 BC         [ 4] 2847         CALL     AT
      00906D CD 8A B7         [ 4] 2848         CALL     BLANK
      009070 CD 87 FF         [ 4] 2849         CALL     EQUAL
      009073 CD 84 67         [ 4] 2850         CALL     QBRAN
      009076 90 7B                 2851         .word      PARS5
      009078 CD 85 9C         [ 4] 2852         CALL     ZLESS
      00907B CD 84 67         [ 4] 2853 PARS5:  CALL     QBRAN
      00907E 90 90                 2854         .word      PARS6
      009080 CD 8A 58         [ 4] 2855         CALL     ONEP
      009083 CD 84 48         [ 4] 2856         CALL     DONXT
      009086 90 58                 2857         .word      PARS4
      009088 CD 85 63         [ 4] 2858         CALL     DUPP
      00908B CD 85 2C         [ 4] 2859         CALL     TOR
      00908E 20 0F            [ 2] 2860         JRA     PARS7
      009090 CD 85 0D         [ 4] 2861 PARS6:  CALL     RFROM
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



      009093 CD 85 59         [ 4] 2862         CALL     DROP
      009096 CD 85 63         [ 4] 2863         CALL     DUPP
      009099 CD 8A 58         [ 4] 2864         CALL     ONEP
      00909C CD 85 2C         [ 4] 2865         CALL     TOR
      00909F CD 85 8D         [ 4] 2866 PARS7:  CALL     OVER
      0090A2 CD 87 D7         [ 4] 2867         CALL     SUBB
      0090A5 CD 85 0D         [ 4] 2868         CALL     RFROM
      0090A8 CD 85 0D         [ 4] 2869         CALL     RFROM
      0090AB CC 87 D7         [ 2] 2870         JP     SUBB
      0090AE CD 85 8D         [ 4] 2871 PARS8:  CALL     OVER
      0090B1 CD 85 0D         [ 4] 2872         CALL     RFROM
      0090B4 CC 87 D7         [ 2] 2873         JP     SUBB
                                   2874 
                                   2875 ;       PARSE   ( c -- b u ; <string> )
                                   2876 ;       Scan input stream and return
                                   2877 ;       counted string delimited by c.
      0090B7 8F F0                 2878         .word      LINK
                           001039  2879 LINK = . 
      0090B9 05                    2880         .byte      5
      0090BA 50 41 52 53 45        2881         .ascii     "PARSE"
      0090BF                       2882 PARSE:
      0090BF CD 85 2C         [ 4] 2883         CALL     TOR
      0090C2 CD 8B D4         [ 4] 2884         CALL     TIB
      0090C5 CD 86 3E         [ 4] 2885         CALL     INN
      0090C8 CD 84 BC         [ 4] 2886         CALL     AT
      0090CB CD 87 5E         [ 4] 2887         CALL     PLUS    ;current input buffer pointer
      0090CE CD 86 4E         [ 4] 2888         CALL     NTIB
      0090D1 CD 84 BC         [ 4] 2889         CALL     AT
      0090D4 CD 86 3E         [ 4] 2890         CALL     INN
      0090D7 CD 84 BC         [ 4] 2891         CALL     AT
      0090DA CD 87 D7         [ 4] 2892         CALL     SUBB    ;remaining count
      0090DD CD 85 0D         [ 4] 2893         CALL     RFROM
      0090E0 CD 8F F6         [ 4] 2894         CALL     PARS
      0090E3 CD 86 3E         [ 4] 2895         CALL     INN
      0090E6 CC 8B 34         [ 2] 2896         JP     PSTOR
                                   2897 
                                   2898 ;       .(      ( -- )
                                   2899 ;       Output following string up to next ) .
      0090E9 90 B9                 2900         .word      LINK
                           00106B  2901 LINK = . 
      0090EB 82                    2902 	.byte      IMEDD+2
      0090EC 2E 28                 2903         .ascii     ".("
      0090EE                       2904 DOTPR:
      0090EE CD 84 34         [ 4] 2905         CALL     DOLIT
      0090F1 00 29                 2906         .word     41	; ")"
      0090F3 CD 90 BF         [ 4] 2907         CALL     PARSE
      0090F6 CC 8F 0C         [ 2] 2908         JP     TYPES
                                   2909 
                                   2910 ;       (       ( -- )
                                   2911 ;       Ignore following string up to next ).
                                   2912 ;       A comment.
      0090F9 90 EB                 2913         .word      LINK
                           00107B  2914 LINK = . 
      0090FB 81                    2915 	.byte      IMEDD+1
      0090FC 28                    2916         .ascii     "("
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      0090FD                       2917 PAREN:
      0090FD CD 84 34         [ 4] 2918         CALL     DOLIT
      009100 00 29                 2919         .word     41	; ")"
      009102 CD 90 BF         [ 4] 2920         CALL     PARSE
      009105 CC 87 3E         [ 2] 2921         JP     DDROP
                                   2922 
                                   2923 ;       \       ( -- )
                                   2924 ;       Ignore following text till
                                   2925 ;       end of line.
      009108 90 FB                 2926         .word      LINK
                           00108A  2927 LINK = . 
      00910A 81                    2928 	.byte      IMEDD+1
      00910B 5C                    2929         .ascii     "\"
      00910C                       2930 BKSLA:
      00910C 90 AE 00 0C      [ 2] 2931         ldw y,#UCTIB ; #TIB  
      009110 90 FE            [ 2] 2932         ldw y,(y)
      009112 90 89            [ 2] 2933         pushw y ; count in TIB 
      009114 90 AE 00 0A      [ 2] 2934         ldw y,#UINN ; >IN 
      009118 90 BF 24         [ 2] 2935         ldw YTEMP,y
      00911B 90 85            [ 2] 2936         popw y 
      00911D 91 CF 24         [ 5] 2937         ldw [YTEMP],y
      009120 81               [ 4] 2938         ret 
                                   2939 
                                   2940 ;       WORD    ( c -- a ; <string> )
                                   2941 ;       Parse a word from input stream
                                   2942 ;       and copy it to code dictionary.
      009121 91 0A                 2943         .word      LINK
                           0010A3  2944 LINK = . 
      009123 04                    2945         .byte      4
      009124 57 4F 52 44           2946         .ascii     "WORD"
      009128                       2947 WORDD:
      009128 CD 90 BF         [ 4] 2948         CALL     PARSE
      00912B CD 8B B2         [ 4] 2949         CALL     HERE
      00912E CD 8A 2D         [ 4] 2950         CALL     CELLP
      009131 CC 8C 72         [ 2] 2951         JP     PACKS
                                   2952 
                                   2953 ;       TOKEN   ( -- a ; <string> )
                                   2954 ;       Parse a word from input stream
                                   2955 ;       and copy it to name dictionary.
      009134 91 23                 2956         .word      LINK
                           0010B6  2957 LINK = . 
      009136 05                    2958         .byte      5
      009137 54 4F 4B 45 4E        2959         .ascii     "TOKEN"
      00913C                       2960 TOKEN:
      00913C CD 8A B7         [ 4] 2961         CALL     BLANK
      00913F CC 91 28         [ 2] 2962         JP     WORDD
                                   2963 
                                   2964 ;; Dictionary search
                                   2965 
                                   2966 ;       NAME>   ( na -- ca )
                                   2967 ;       Return a code address given
                                   2968 ;       a name address.
      009142 91 36                 2969         .word      LINK
                           0010C4  2970 LINK = . 
      009144 05                    2971         .byte      5
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      009145 4E 41 4D 45 3E        2972         .ascii     "NAME>"
      00914A                       2973 NAMET:
      00914A CD 8B 9B         [ 4] 2974         CALL     COUNT
      00914D CD 84 34         [ 4] 2975         CALL     DOLIT
      009150 00 1F                 2976         .word      31
      009152 CD 85 AF         [ 4] 2977         CALL     ANDD
      009155 CC 87 5E         [ 2] 2978         JP     PLUS
                                   2979 
                                   2980 ;       SAME?   ( a a u -- a a f \ -0+ )
                                   2981 ;       Compare u cells in two
                                   2982 ;       strings. Return 0 if identical.
      009158 91 44                 2983         .word      LINK
                           0010DA  2984 LINK = . 
      00915A 05                    2985         .byte       5
      00915B 53 41 4D 45 3F        2986         .ascii     "SAME?"
      009160                       2987 SAMEQ:
      009160 CD 8A 65         [ 4] 2988         CALL     ONEM
      009163 CD 85 2C         [ 4] 2989         CALL     TOR
      009166 20 29            [ 2] 2990         JRA     SAME2
      009168 CD 85 8D         [ 4] 2991 SAME1:  CALL     OVER
      00916B CD 85 20         [ 4] 2992         CALL     RAT
      00916E CD 87 5E         [ 4] 2993         CALL     PLUS
      009171 CD 84 DA         [ 4] 2994         CALL     CAT
      009174 CD 85 8D         [ 4] 2995         CALL     OVER
      009177 CD 85 20         [ 4] 2996         CALL     RAT
      00917A CD 87 5E         [ 4] 2997         CALL     PLUS
      00917D CD 84 DA         [ 4] 2998         CALL     CAT
      009180 CD 87 D7         [ 4] 2999         CALL     SUBB
      009183 CD 87 0D         [ 4] 3000         CALL     QDUP
      009186 CD 84 67         [ 4] 3001         CALL     QBRAN
      009189 91 91                 3002         .word      SAME2
      00918B CD 85 0D         [ 4] 3003         CALL     RFROM
      00918E CC 85 59         [ 2] 3004         JP     DROP
      009191 CD 84 48         [ 4] 3005 SAME2:  CALL     DONXT
      009194 91 68                 3006         .word      SAME1
      009196 CC 8A C4         [ 2] 3007         JP     ZERO
                                   3008 
                                   3009 ;       find    ( a va -- ca na | a F )
                                   3010 ;       Search vocabulary for string.
                                   3011 ;       Return ca and na if succeeded.
      009199 91 5A                 3012         .word      LINK
                           00111B  3013 LINK = . 
      00919B 04                    3014         .byte      4
      00919C 46 49 4E 44           3015         .ascii     "FIND"
      0091A0                       3016 FIND:
      0091A0 CD 85 73         [ 4] 3017         CALL     SWAPP
      0091A3 CD 85 63         [ 4] 3018         CALL     DUPP
      0091A6 CD 84 DA         [ 4] 3019         CALL     CAT
      0091A9 CD 86 2F         [ 4] 3020         CALL     TEMP
      0091AC CD 84 A5         [ 4] 3021         CALL     STORE
      0091AF CD 85 63         [ 4] 3022         CALL     DUPP
      0091B2 CD 84 BC         [ 4] 3023         CALL     AT
      0091B5 CD 85 2C         [ 4] 3024         CALL     TOR
      0091B8 CD 8A 2D         [ 4] 3025         CALL     CELLP
      0091BB CD 85 73         [ 4] 3026         CALL     SWAPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      0091BE CD 84 BC         [ 4] 3027 FIND1:  CALL     AT
      0091C1 CD 85 63         [ 4] 3028         CALL     DUPP
      0091C4 CD 84 67         [ 4] 3029         CALL     QBRAN
      0091C7 91 FD                 3030         .word      FIND6
      0091C9 CD 85 63         [ 4] 3031         CALL     DUPP
      0091CC CD 84 BC         [ 4] 3032         CALL     AT
      0091CF CD 84 34         [ 4] 3033         CALL     DOLIT
      0091D2 1F 7F                 3034         .word      MASKK
      0091D4 CD 85 AF         [ 4] 3035         CALL     ANDD
      0091D7 CD 85 20         [ 4] 3036         CALL     RAT
      0091DA CD 85 D8         [ 4] 3037         CALL     XORR
      0091DD CD 84 67         [ 4] 3038         CALL     QBRAN
      0091E0 91 EC                 3039         .word      FIND2
      0091E2 CD 8A 2D         [ 4] 3040         CALL     CELLP
      0091E5 CD 84 34         [ 4] 3041         CALL     DOLIT
      0091E8 FF FF                 3042         .word     0xFFFF
      0091EA 20 0C            [ 2] 3043         JRA     FIND3
      0091EC CD 8A 2D         [ 4] 3044 FIND2:  CALL     CELLP
      0091EF CD 86 2F         [ 4] 3045         CALL     TEMP
      0091F2 CD 84 BC         [ 4] 3046         CALL     AT
      0091F5 CD 91 60         [ 4] 3047         CALL     SAMEQ
      0091F8 CD 84 7E         [ 4] 3048 FIND3:  CALL     BRAN
      0091FB 92 0C                 3049         .word      FIND4
      0091FD CD 85 0D         [ 4] 3050 FIND6:  CALL     RFROM
      009200 CD 85 59         [ 4] 3051         CALL     DROP
      009203 CD 85 73         [ 4] 3052         CALL     SWAPP
      009206 CD 8A 3C         [ 4] 3053         CALL     CELLM
      009209 CC 85 73         [ 2] 3054         JP     SWAPP
      00920C CD 84 67         [ 4] 3055 FIND4:  CALL     QBRAN
      00920F 92 19                 3056         .word      FIND5
      009211 CD 8A 3C         [ 4] 3057         CALL     CELLM
      009214 CD 8A 3C         [ 4] 3058         CALL     CELLM
      009217 20 A5            [ 2] 3059         JRA     FIND1
      009219 CD 85 0D         [ 4] 3060 FIND5:  CALL     RFROM
      00921C CD 85 59         [ 4] 3061         CALL     DROP
      00921F CD 85 73         [ 4] 3062         CALL     SWAPP
      009222 CD 85 59         [ 4] 3063         CALL     DROP
      009225 CD 8A 3C         [ 4] 3064         CALL     CELLM
      009228 CD 85 63         [ 4] 3065         CALL     DUPP
      00922B CD 91 4A         [ 4] 3066         CALL     NAMET
      00922E CC 85 73         [ 2] 3067         JP     SWAPP
                                   3068 
                                   3069 ;       NAME?   ( a -- ca na | a F )
                                   3070 ;       Search vocabularies for a string.
      009231 91 9B                 3071         .word      LINK
                           0011B3  3072 LINK = . 
      009233 05                    3073         .byte      5
      009234 4E 41 4D 45 3F        3074         .ascii     "NAME?"
      009239                       3075 NAMEQ:
      009239 CD 86 A3         [ 4] 3076         CALL   CNTXT
      00923C CC 91 A0         [ 2] 3077         JP     FIND
                                   3078 
                                   3079 ;; Terminal response
                                   3080 
                                   3081 ;       ^H      ( bot eot cur -- bot eot cur )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



                                   3082 ;       Backup cursor by one character.
      00923F 92 33                 3083         .word      LINK
                           0011C1  3084 LINK = . 
      009241 02                    3085         .byte      2
      009242 5E 48                 3086         .ascii     "^H"
      009244                       3087 BKSP:
      009244 CD 85 2C         [ 4] 3088         CALL     TOR
      009247 CD 85 8D         [ 4] 3089         CALL     OVER
      00924A CD 85 0D         [ 4] 3090         CALL     RFROM
      00924D CD 85 73         [ 4] 3091         CALL     SWAPP
      009250 CD 85 8D         [ 4] 3092         CALL     OVER
      009253 CD 85 D8         [ 4] 3093         CALL     XORR
      009256 CD 84 67         [ 4] 3094         CALL     QBRAN
      009259 92 74                 3095         .word      BACK1
      00925B CD 84 34         [ 4] 3096         CALL     DOLIT
      00925E 00 08                 3097         .word      BKSPP
      009260 CD 84 1E         [ 4] 3098         CALL     EMIT
      009263 CD 8A 65         [ 4] 3099         CALL     ONEM
      009266 CD 8A B7         [ 4] 3100         CALL     BLANK
      009269 CD 84 1E         [ 4] 3101         CALL     EMIT
      00926C CD 84 34         [ 4] 3102         CALL     DOLIT
      00926F 00 08                 3103         .word      BKSPP
      009271 CC 84 1E         [ 2] 3104         JP     EMIT
      009274 81               [ 4] 3105 BACK1:  RET
                                   3106 
                                   3107 ;       TAP    ( bot eot cur c -- bot eot cur )
                                   3108 ;       Accept and echo key stroke
                                   3109 ;       and bump cursor.
      009275 92 41                 3110         .word      LINK
                           0011F7  3111 LINK = . 
      009277 03                    3112         .byte      3
      009278 54 41 50              3113         .ascii     "TAP"
      00927B                       3114 TAP:
      00927B CD 85 63         [ 4] 3115         CALL     DUPP
      00927E CD 84 1E         [ 4] 3116         CALL     EMIT
      009281 CD 85 8D         [ 4] 3117         CALL     OVER
      009284 CD 84 C9         [ 4] 3118         CALL     CSTOR
      009287 CC 8A 58         [ 2] 3119         JP     ONEP
                                   3120 
                                   3121 ;       kTAP    ( bot eot cur c -- bot eot cur )
                                   3122 ;       Process a key stroke,
                                   3123 ;       CR or backspace.
      00928A 92 77                 3124         .word      LINK
                           00120C  3125 LINK = . 
      00928C 04                    3126         .byte      4
      00928D 4B 54 41 50           3127         .ascii     "KTAP"
      009291                       3128 KTAP:
      009291 CD 85 63         [ 4] 3129         CALL     DUPP
      009294 CD 84 34         [ 4] 3130         CALL     DOLIT
      009297 00 0D                 3131         .word      CRR
      009299 CD 85 D8         [ 4] 3132         CALL     XORR
      00929C CD 84 67         [ 4] 3133         CALL     QBRAN
      00929F 92 B7                 3134         .word      KTAP2
      0092A1 CD 84 34         [ 4] 3135         CALL     DOLIT
      0092A4 00 08                 3136         .word      BKSPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      0092A6 CD 85 D8         [ 4] 3137         CALL     XORR
      0092A9 CD 84 67         [ 4] 3138         CALL     QBRAN
      0092AC 92 B4                 3139         .word      KTAP1
      0092AE CD 8A B7         [ 4] 3140         CALL     BLANK
      0092B1 CC 92 7B         [ 2] 3141         JP     TAP
      0092B4 CC 92 44         [ 2] 3142 KTAP1:  JP     BKSP
      0092B7 CD 85 59         [ 4] 3143 KTAP2:  CALL     DROP
      0092BA CD 85 73         [ 4] 3144         CALL     SWAPP
      0092BD CD 85 59         [ 4] 3145         CALL     DROP
      0092C0 CC 85 63         [ 2] 3146         JP     DUPP
                                   3147 
                                   3148 ;       accept  ( b u -- b u )
                                   3149 ;       Accept characters to input
                                   3150 ;       buffer. Return with actual count.
      0092C3 92 8C                 3151         .word      LINK
                           001245  3152 LINK = . 
      0092C5 06                    3153         .byte      6
      0092C6 41 43 43 45 50 54     3154         .ascii     "ACCEPT"
      0092CC                       3155 ACCEP:
      0092CC CD 85 8D         [ 4] 3156         CALL     OVER
      0092CF CD 87 5E         [ 4] 3157         CALL     PLUS
      0092D2 CD 85 8D         [ 4] 3158         CALL     OVER
      0092D5 CD 87 49         [ 4] 3159 ACCP1:  CALL     DDUP
      0092D8 CD 85 D8         [ 4] 3160         CALL     XORR
      0092DB CD 84 67         [ 4] 3161         CALL     QBRAN
      0092DE 93 00                 3162         .word      ACCP4
      0092E0 CD 8E AA         [ 4] 3163         CALL     KEY
      0092E3 CD 85 63         [ 4] 3164         CALL     DUPP
      0092E6 CD 8A B7         [ 4] 3165         CALL     BLANK
      0092E9 CD 84 34         [ 4] 3166         CALL     DOLIT
      0092EC 00 7F                 3167         .word      127
      0092EE CD 88 99         [ 4] 3168         CALL     WITHI
      0092F1 CD 84 67         [ 4] 3169         CALL     QBRAN
      0092F4 92 FB                 3170         .word      ACCP2
      0092F6 CD 92 7B         [ 4] 3171         CALL     TAP
      0092F9 20 03            [ 2] 3172         JRA     ACCP3
      0092FB CD 92 91         [ 4] 3173 ACCP2:  CALL     KTAP
      0092FE 20 D5            [ 2] 3174 ACCP3:  JRA     ACCP1
      009300 CD 85 59         [ 4] 3175 ACCP4:  CALL     DROP
      009303 CD 85 8D         [ 4] 3176         CALL     OVER
      009306 CC 87 D7         [ 2] 3177         JP     SUBB
                                   3178 
                                   3179 ;       QUERY   ( -- )
                                   3180 ;       Accept input stream to
                                   3181 ;       terminal input buffer.
      009309 92 C5                 3182         .word      LINK
                                   3183         
                           00128B  3184 LINK = . 
      00930B 05                    3185         .byte      5
      00930C 51 55 45 52 59        3186         .ascii     "QUERY"
      009311                       3187 QUERY:
      009311 CD 8B D4         [ 4] 3188         CALL     TIB
      009314 CD 84 34         [ 4] 3189         CALL     DOLIT
      009317 00 50                 3190         .word      80
      009319 CD 92 CC         [ 4] 3191         CALL     ACCEP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



      00931C CD 86 4E         [ 4] 3192         CALL     NTIB
      00931F CD 84 A5         [ 4] 3193         CALL     STORE
      009322 CD 85 59         [ 4] 3194         CALL     DROP
      009325 CD 8A C4         [ 4] 3195         CALL     ZERO
      009328 CD 86 3E         [ 4] 3196         CALL     INN
      00932B CC 84 A5         [ 2] 3197         JP     STORE
                                   3198 
                                   3199 ;       ABORT   ( -- )
                                   3200 ;       Reset data stack and
                                   3201 ;       jump to QUIT.
      00932E 93 0B                 3202         .word      LINK
                           0012B0  3203 LINK = . 
      009330 05                    3204         .byte      5
      009331 41 42 4F 52 54        3205         .ascii     "ABORT"
      009336                       3206 ABORT:
      009336 CD 94 2D         [ 4] 3207         CALL     PRESE
      009339 CC 94 4A         [ 2] 3208         JP     QUIT
                                   3209 
                                   3210 ;       abort"  ( f -- )
                                   3211 ;       Run time routine of ABORT".
                                   3212 ;       Abort with a message.
      00933C 93 30                 3213         .word      LINK
                           0012BE  3214 LINK = . 
      00933E 46                    3215 	.byte      COMPO+6
      00933F 41 42 4F 52 54        3216         .ascii     "ABORT"
      009344 22                    3217         .byte      '"'
      009345                       3218 ABORQ:
      009345 CD 84 67         [ 4] 3219         CALL     QBRAN
      009348 93 64                 3220         .word      ABOR2   ;text flag
      00934A CD 8F 40         [ 4] 3221         CALL     DOSTR
      00934D CD 8E E2         [ 4] 3222 ABOR1:  CALL     SPACE
      009350 CD 8B 9B         [ 4] 3223         CALL     COUNT
      009353 CD 8F 0C         [ 4] 3224         CALL     TYPES
      009356 CD 84 34         [ 4] 3225         CALL     DOLIT
      009359 00 3F                 3226         .word     63 ; "?"
      00935B CD 84 1E         [ 4] 3227         CALL     EMIT
      00935E CD 8F 2A         [ 4] 3228         CALL     CR
      009361 CC 93 36         [ 2] 3229         JP     ABORT   ;pass error string
      009364 CD 8F 40         [ 4] 3230 ABOR2:  CALL     DOSTR
      009367 CC 85 59         [ 2] 3231         JP     DROP
                                   3232 
                                   3233 ;; The text interpreter
                                   3234 
                                   3235 ;       $INTERPRET      ( a -- )
                                   3236 ;       Interpret a word. If failed,
                                   3237 ;       try to convert it to an integer.
      00936A 93 3E                 3238         .word      LINK
                           0012EC  3239 LINK = . 
      00936C 0A                    3240         .byte      10
      00936D 24 49 4E 54 45 52 50  3241         .ascii     "$INTERPRET"
             52 45 54
      009377                       3242 INTER:
      009377 CD 92 39         [ 4] 3243         CALL     NAMEQ
      00937A CD 87 0D         [ 4] 3244         CALL     QDUP    ;?defined
      00937D CD 84 67         [ 4] 3245         CALL     QBRAN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      009380 93 A1                 3246         .word      INTE1
      009382 CD 84 BC         [ 4] 3247         CALL     AT
      009385 CD 84 34         [ 4] 3248         CALL     DOLIT
      009388 40 00                 3249 	.word       0x4000	; COMPO*256
      00938A CD 85 AF         [ 4] 3250         CALL     ANDD    ;?compile only lexicon bits
      00938D CD 93 45         [ 4] 3251         CALL     ABORQ
      009390 0D                    3252         .byte      13
      009391 20 63 6F 6D 70 69 6C  3253         .ascii     " compile only"
             65 20 6F 6E 6C 79
      00939E CC 84 8E         [ 2] 3254         JP     EXECU
      0093A1 CD 8D D7         [ 4] 3255 INTE1:  CALL     NUMBQ   ;convert a number
      0093A4 CD 84 67         [ 4] 3256         CALL     QBRAN
      0093A7 93 4D                 3257         .word    ABOR1
      0093A9 81               [ 4] 3258         RET
                                   3259 
                                   3260 ;       [       ( -- )
                                   3261 ;       Start  text interpreter.
      0093AA 93 6C                 3262         .word      LINK
                           00132C  3263 LINK = . 
      0093AC 81                    3264 	.byte      IMEDD+1
      0093AD 5B                    3265         .ascii     "["
      0093AE                       3266 LBRAC:
      0093AE CD 84 34         [ 4] 3267         CALL   DOLIT
      0093B1 93 77                 3268         .word  INTER
      0093B3 CD 86 81         [ 4] 3269         CALL   TEVAL
      0093B6 CC 84 A5         [ 2] 3270         JP     STORE
                                   3271 
                                   3272 ;       .OK     ( -- )
                                   3273 ;       Display 'ok' while interpreting.
      0093B9 93 AC                 3274         .word      LINK
                           00133B  3275 LINK = . 
      0093BB 03                    3276         .byte      3
      0093BC 2E 4F 4B              3277         .ascii     ".OK"
      0093BF                       3278 DOTOK:
      0093BF CD 84 34         [ 4] 3279         CALL     DOLIT
      0093C2 93 77                 3280         .word      INTER
      0093C4 CD 86 81         [ 4] 3281         CALL     TEVAL
      0093C7 CD 84 BC         [ 4] 3282         CALL     AT
      0093CA CD 87 FF         [ 4] 3283         CALL     EQUAL
      0093CD CD 84 67         [ 4] 3284         CALL     QBRAN
      0093D0 93 D9                 3285         .word      DOTO1
      0093D2 CD 8F 69         [ 4] 3286         CALL     DOTQP
      0093D5 03                    3287         .byte      3
      0093D6 20 6F 6B              3288         .ascii     " ok"
      0093D9 CC 8F 2A         [ 2] 3289 DOTO1:  JP     CR
                                   3290 
                                   3291 ;       ?STACK  ( -- )
                                   3292 ;       Abort if stack underflows.
      0093DC 93 BB                 3293         .word      LINK
                           00135E  3294 LINK = . 
      0093DE 06                    3295         .byte      6
      0093DF 3F 53 54 41 43 4B     3296         .ascii     "?STACK"
      0093E5                       3297 QSTAC: 
      0093E5 CD 8B 06         [ 4] 3298         CALL     DEPTH
      0093E8 CD 85 9C         [ 4] 3299         CALL     ZLESS   ;check only for underflow
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      0093EB CD 93 45         [ 4] 3300         CALL     ABORQ
      0093EE 0B                    3301         .byte      11
      0093EF 20 75 6E 64 65 72 66  3302         .ascii     " underflow "
             6C 6F 77 20
      0093FA 81               [ 4] 3303         RET
                                   3304 
                                   3305 ;       EVAL    ( -- )
                                   3306 ;       Interpret  input stream.
      0093FB 93 DE                 3307         .word      LINK
                           00137D  3308 LINK = . 
      0093FD 04                    3309         .byte      4
      0093FE 45 56 41 4C           3310         .ascii     "EVAL"
      009402                       3311 EVAL:
      009402 CD 91 3C         [ 4] 3312 EVAL1:  CALL     TOKEN
      009405 CD 85 63         [ 4] 3313         CALL     DUPP
      009408 CD 84 DA         [ 4] 3314         CALL     CAT     ;?input stream empty
      00940B CD 84 67         [ 4] 3315         CALL     QBRAN
      00940E 94 1E                 3316         .word    EVAL2
      009410 CD 86 81         [ 4] 3317         CALL     TEVAL
      009413 CD 8B E8         [ 4] 3318         CALL     ATEXE
      009416 CD 93 E5         [ 4] 3319         CALL     QSTAC   ;evaluate input, check stack
      009419 CD 84 7E         [ 4] 3320         CALL     BRAN
      00941C 94 02                 3321         .word    EVAL1
      00941E CD 85 59         [ 4] 3322 EVAL2:  CALL     DROP
      009421 CC 93 BF         [ 2] 3323         JP       DOTOK
                                   3324 
                                   3325 ;       PRESET  ( -- )
                                   3326 ;       Reset data stack pointer and
                                   3327 ;       terminal input buffer.
      009424 93 FD                 3328         .word      LINK
                           0013A6  3329 LINK = . 
      009426 06                    3330         .byte      6
      009427 50 52 45 53 45 54     3331         .ascii     "PRESET"
      00942D                       3332 PRESE:
      00942D CD 84 34         [ 4] 3333         CALL     DOLIT
      009430 16 80                 3334         .word      SPP
      009432 CD 85 50         [ 4] 3335         CALL     SPSTO
      009435 CD 84 34         [ 4] 3336         CALL     DOLIT
      009438 17 00                 3337         .word      TIBB
      00943A CD 86 4E         [ 4] 3338         CALL     NTIB
      00943D CD 8A 2D         [ 4] 3339         CALL     CELLP
      009440 CC 84 A5         [ 2] 3340         JP     STORE
                                   3341 
                                   3342 ;       QUIT    ( -- )
                                   3343 ;       Reset return stack pointer
                                   3344 ;       and start text interpreter.
      009443 94 26                 3345         .word      LINK
                           0013C5  3346 LINK = . 
      009445 04                    3347         .byte      4
      009446 51 55 49 54           3348         .ascii     "QUIT"
      00944A                       3349 QUIT:
      00944A CD 84 34         [ 4] 3350         CALL     DOLIT
      00944D 17 FF                 3351         .word      RPP
      00944F CD 84 F7         [ 4] 3352         CALL     RPSTO   ;reset return stack pointer
      009452 CD 93 AE         [ 4] 3353 QUIT1:  CALL     LBRAC   ;start interpretation
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      009455 CD 93 11         [ 4] 3354 QUIT2:  CALL     QUERY   ;get input
      009458 CD 94 02         [ 4] 3355         CALL     EVAL
      00945B 20 F8            [ 2] 3356         JRA     QUIT2   ;continue till error
                                   3357 
                                   3358 ;; The compiler
                                   3359 
                                   3360 ;       '       ( -- ca )
                                   3361 ;       Search vocabularies for
                                   3362 ;       next word in input stream.
      00945D 94 45                 3363         .word      LINK
                           0013DF  3364 LINK = . 
      00945F 01                    3365         .byte      1
      009460 27                    3366         .ascii     "'"
      009461                       3367 TICK:
      009461 CD 91 3C         [ 4] 3368         CALL     TOKEN
      009464 CD 92 39         [ 4] 3369         CALL     NAMEQ   ;?defined
      009467 CD 84 67         [ 4] 3370         CALL     QBRAN
      00946A 93 4D                 3371         .word      ABOR1
      00946C 81               [ 4] 3372         RET     ;yes, push code address
                                   3373 
                                   3374 ;       ALLOT   ( n -- )
                                   3375 ;       Allocate n bytes to RAM 
      00946D 94 5F                 3376         .word      LINK
                           0013EF  3377         LINK = . 
      00946F 05                    3378         .byte      5
      009470 41 4C 4C 4F 54        3379         .ascii     "ALLOT"
      009475                       3380 ALLOT:
      009475 CD 86 B1         [ 4] 3381         CALL     VPP
                                   3382 ; must update APP_VP each time VP is modidied
      009478 CD 8B 34         [ 4] 3383         call PSTOR 
      00947B CC 9C 0D         [ 2] 3384         jp UPDATVP 
                                   3385 
                                   3386 ;       ,       ( w -- )
                                   3387 ;         Compile an integer into
                                   3388 ;         variable space.
      00947E 94 6F                 3389         .word      LINK
                           001400  3390 LINK = . 
      009480 01                    3391         .byte      1
      009481 2C                    3392         .ascii     ","
      009482                       3393 COMMA:
      009482 CD 8B B2         [ 4] 3394         CALL     HERE
      009485 CD 85 63         [ 4] 3395         CALL     DUPP
      009488 CD 8A 2D         [ 4] 3396         CALL     CELLP   ;cell boundary
      00948B CD 86 B1         [ 4] 3397         CALL     VPP
      00948E CD 84 A5         [ 4] 3398         CALL     STORE
      009491 CC 84 A5         [ 2] 3399         JP     STORE
                                   3400 
                                   3401 ;       C,      ( c -- )
                                   3402 ;       Compile a byte into
                                   3403 ;       variables space.
      009494 94 80                 3404        .word      LINK
                           001416  3405 LINK = . 
      009496 02                    3406         .byte      2
      009497 43 2C                 3407         .ascii     "C,"
      009499                       3408 CCOMMA:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



      009499 CD 8B B2         [ 4] 3409         CALL     HERE
      00949C CD 85 63         [ 4] 3410         CALL     DUPP
      00949F CD 8A 58         [ 4] 3411         CALL     ONEP
      0094A2 CD 86 B1         [ 4] 3412         CALL     VPP
      0094A5 CD 84 A5         [ 4] 3413         CALL     STORE
      0094A8 CC 84 C9         [ 2] 3414         JP     CSTOR
                                   3415 
                                   3416 ;       [COMPILE]       ( -- ; <string> )
                                   3417 ;       Compile next immediate
                                   3418 ;       word into code dictionary.
      0094AB 94 96                 3419         .word      LINK
                           00142D  3420 LINK = . 
      0094AD 89                    3421 	.byte      IMEDD+9
      0094AE 5B 43 4F 4D 50 49 4C  3422         .ascii     "[COMPILE]"
             45 5D
      0094B7                       3423 BCOMP:
      0094B7 CD 94 61         [ 4] 3424         CALL     TICK
      0094BA CC 97 7D         [ 2] 3425         JP     JSRC
                                   3426 
                                   3427 ;       COMPILE ( -- )
                                   3428 ;       Compile next jsr in
                                   3429 ;       colon list to code dictionary.
      0094BD 94 AD                 3430         .word      LINK
                           00143F  3431 LINK = . 
      0094BF 47                    3432 	.byte      COMPO+7
      0094C0 43 4F 4D 50 49 4C 45  3433         .ascii     "COMPILE"
      0094C7                       3434 COMPI:
      0094C7 CD 85 0D         [ 4] 3435         CALL     RFROM
      0094CA CD 85 63         [ 4] 3436         CALL     DUPP
      0094CD CD 84 BC         [ 4] 3437         CALL     AT
      0094D0 CD 97 7D         [ 4] 3438         CALL     JSRC    ;compile subroutine
      0094D3 CD 8A 2D         [ 4] 3439         CALL     CELLP
      0094D6 90 93            [ 1] 3440         ldw y,x 
      0094D8 90 FE            [ 2] 3441         ldw y,(y)
      0094DA 1C 00 02         [ 2] 3442         addw x,#CELLL 
      0094DD 90 FC            [ 2] 3443         jp (y)
                                   3444 
                                   3445 ;       LITERAL ( w -- )
                                   3446 ;       Compile tos to dictionary
                                   3447 ;       as an integer literal.
      0094DF 94 BF                 3448         .word      LINK
                           001461  3449 LINK = . 
      0094E1 87                    3450 	.byte      IMEDD+7
      0094E2 4C 49 54 45 52 41 4C  3451         .ascii     "LITERAL"
      0094E9                       3452 LITER:
      0094E9 CD 94 C7         [ 4] 3453         CALL     COMPI
      0094EC 84 34                 3454         .word DOLIT 
      0094EE CC 94 82         [ 2] 3455         JP     COMMA
                                   3456 
                                   3457 ;       $,"     ( -- )
                                   3458 ;       Compile a literal string
                                   3459 ;       up to next " .
      0094F1 94 E1                 3460         .word      LINK
                           001473  3461 LINK = . 
      0094F3 03                    3462         .byte      3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      0094F4 24 2C 22              3463         .byte     '$',',','"'
      0094F7                       3464 STRCQ:
      0094F7 CD 84 34         [ 4] 3465         CALL     DOLIT
      0094FA 00 22                 3466         .word     34	; "
      0094FC CD 90 BF         [ 4] 3467         CALL     PARSE
      0094FF CD 8B B2         [ 4] 3468         CALL     HERE
      009502 CD 8C 72         [ 4] 3469         CALL     PACKS   ;string to code dictionary
      009505 CD 8B 9B         [ 4] 3470         CALL     COUNT
      009508 CD 87 5E         [ 4] 3471         CALL     PLUS    ;calculate aligned end of string
      00950B CD 86 B1         [ 4] 3472         CALL     VPP
      00950E CC 84 A5         [ 2] 3473         JP     STORE
                                   3474 
                                   3475 ;; Structures
                                   3476 
                                   3477 ;       FOR     ( -- a )
                                   3478 ;       Start a FOR-NEXT loop
                                   3479 ;       structure in a colon definition.
      009511 94 F3                 3480         .word      LINK
                           001493  3481 LINK = . 
      009513 83                    3482 	.byte      IMEDD+3
      009514 46 4F 52              3483         .ascii     "FOR"
      009517                       3484 FOR:
      009517 CD 94 C7         [ 4] 3485         CALL     COMPI
      00951A 85 2C                 3486         .word TOR 
      00951C CC 8B B2         [ 2] 3487         JP     HERE
                                   3488 
                                   3489 ;       NEXT    ( a -- )
                                   3490 ;       Terminate a FOR-NEXT loop.
      00951F 95 13                 3491         .word      LINK
                           0014A1  3492 LINK = . 
      009521 84                    3493 	.byte      IMEDD+4
      009522 4E 45 58 54           3494         .ascii     "NEXT"
      009526                       3495 NEXT:
      009526 CD 94 C7         [ 4] 3496         CALL     COMPI
      009529 84 48                 3497         .word DONXT 
      00952B CD 86 FD         [ 4] 3498         call ADRADJ
      00952E CC 94 82         [ 2] 3499         JP     COMMA
                                   3500 
                                   3501 ;       I ( -- n )
                                   3502 ;       stack FOR-NEXT COUNTER 
      009531 95 21                 3503         .word LINK 
                           0014B3  3504         LINK=.
      009533 01                    3505         .byte 1 
      009534 49                    3506         .ascii "I"
      009535                       3507 IFETCH: 
      009535 1D 00 02         [ 2] 3508         subw x,#CELLL 
      009538 16 03            [ 2] 3509         ldw y,(3,sp)
      00953A FF               [ 2] 3510         ldw (x),y 
      00953B 81               [ 4] 3511         ret 
                                   3512 
                                   3513 ;       BEGIN   ( -- a )
                                   3514 ;       Start an infinite or
                                   3515 ;       indefinite loop structure.
      00953C 95 33                 3516         .word      LINK
                           0014BE  3517 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      00953E 85                    3518 	.byte      IMEDD+5
      00953F 42 45 47 49 4E        3519         .ascii     "BEGIN"
      009544                       3520 BEGIN:
      009544 CC 8B B2         [ 2] 3521         JP     HERE
                                   3522 
                                   3523 ;       UNTIL   ( a -- )
                                   3524 ;       Terminate a BEGIN-UNTIL
                                   3525 ;       indefinite loop structure.
      009547 95 3E                 3526         .word      LINK
                           0014C9  3527 LINK = . 
      009549 85                    3528 	.byte      IMEDD+5
      00954A 55 4E 54 49 4C        3529         .ascii     "UNTIL"
      00954F                       3530 UNTIL:
      00954F CD 94 C7         [ 4] 3531         CALL     COMPI
      009552 84 67                 3532         .word    QBRAN 
      009554 CD 86 FD         [ 4] 3533         call ADRADJ
      009557 CC 94 82         [ 2] 3534         JP     COMMA
                                   3535 
                                   3536 ;       AGAIN   ( a -- )
                                   3537 ;       Terminate a BEGIN-AGAIN
                                   3538 ;       infinite loop structure.
      00955A 95 49                 3539         .word      LINK
                           0014DC  3540 LINK = . 
      00955C 85                    3541 	.byte      IMEDD+5
      00955D 41 47 41 49 4E        3542         .ascii     "AGAIN"
      009562                       3543 AGAIN:
      009562 CD 94 C7         [ 4] 3544         CALL     COMPI
      009565 84 7E                 3545         .word BRAN
      009567 CD 86 FD         [ 4] 3546         call ADRADJ 
      00956A CC 94 82         [ 2] 3547         JP     COMMA
                                   3548 
                                   3549 ;       IF      ( -- A )
                                   3550 ;       Begin a conditional branch.
      00956D 95 5C                 3551         .word      LINK
                           0014EF  3552 LINK = . 
      00956F 82                    3553 	.byte      IMEDD+2
      009570 49 46                 3554         .ascii     "IF"
      009572                       3555 IFF:
      009572 CD 94 C7         [ 4] 3556         CALL     COMPI
      009575 84 67                 3557         .word QBRAN
      009577 CD 8B B2         [ 4] 3558         CALL     HERE
      00957A CD 8A C4         [ 4] 3559         CALL     ZERO
      00957D CC 94 82         [ 2] 3560         JP     COMMA
                                   3561 
                                   3562 ;       THEN        ( A -- )
                                   3563 ;       Terminate a conditional branch structure.
      009580 95 6F                 3564         .word      LINK
                           001502  3565 LINK = . 
      009582 84                    3566 	.byte      IMEDD+4
      009583 54 48 45 4E           3567         .ascii     "THEN"
      009587                       3568 THENN:
      009587 CD 8B B2         [ 4] 3569         CALL     HERE
      00958A CD 86 FD         [ 4] 3570         call ADRADJ 
      00958D CD 85 73         [ 4] 3571         CALL     SWAPP
      009590 CC 84 A5         [ 2] 3572         JP     STORE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



                                   3573 
                                   3574 ;       ELSE        ( A -- A )
                                   3575 ;       Start the false clause in an IF-ELSE-THEN structure.
      009593 95 82                 3576         .word      LINK
                           001515  3577 LINK = . 
      009595 84                    3578 	.byte      IMEDD+4
      009596 45 4C 53 45           3579         .ascii     "ELSE"
      00959A                       3580 ELSEE:
      00959A CD 94 C7         [ 4] 3581         CALL     COMPI
      00959D 84 7E                 3582         .word BRAN
      00959F CD 8B B2         [ 4] 3583         CALL     HERE
      0095A2 CD 8A C4         [ 4] 3584         CALL     ZERO
      0095A5 CD 94 82         [ 4] 3585         CALL     COMMA
      0095A8 CD 85 73         [ 4] 3586         CALL     SWAPP
      0095AB CD 8B B2         [ 4] 3587         CALL     HERE
      0095AE CD 86 FD         [ 4] 3588         call ADRADJ 
      0095B1 CD 85 73         [ 4] 3589         CALL     SWAPP
      0095B4 CC 84 A5         [ 2] 3590         JP     STORE
                                   3591 
                                   3592 ;       AHEAD       ( -- A )
                                   3593 ;       Compile a forward branch instruction.
      0095B7 95 95                 3594         .word      LINK
                           001539  3595 LINK = . 
      0095B9 85                    3596 	.byte      IMEDD+5
      0095BA 41 48 45 41 44        3597         .ascii     "AHEAD"
      0095BF                       3598 AHEAD:
      0095BF CD 94 C7         [ 4] 3599         CALL     COMPI
      0095C2 84 7E                 3600         .word BRAN
      0095C4 CD 8B B2         [ 4] 3601         CALL     HERE
      0095C7 CD 8A C4         [ 4] 3602         CALL     ZERO
      0095CA CC 94 82         [ 2] 3603         JP     COMMA
                                   3604 
                                   3605 ;       WHILE       ( a -- A a )
                                   3606 ;       Conditional branch out of a BEGIN-WHILE-REPEAT loop.
      0095CD 95 B9                 3607         .word      LINK
                           00154F  3608 LINK = . 
      0095CF 85                    3609 	.byte      IMEDD+5
      0095D0 57 48 49 4C 45        3610         .ascii     "WHILE"
      0095D5                       3611 WHILE:
      0095D5 CD 94 C7         [ 4] 3612         CALL     COMPI
      0095D8 84 67                 3613         .word QBRAN
      0095DA CD 8B B2         [ 4] 3614         CALL     HERE
      0095DD CD 8A C4         [ 4] 3615         CALL     ZERO
      0095E0 CD 94 82         [ 4] 3616         CALL     COMMA
      0095E3 CC 85 73         [ 2] 3617         JP     SWAPP
                                   3618 
                                   3619 ;       REPEAT      ( A a -- )
                                   3620 ;       Terminate a BEGIN-WHILE-REPEAT indefinite loop.
      0095E6 95 CF                 3621         .word      LINK
                           001568  3622 LINK = . 
      0095E8 86                    3623         .byte      IMEDD+6
      0095E9 52 45 50 45 41 54     3624         .ascii     "REPEAT"
      0095EF                       3625 REPEA:
      0095EF CD 94 C7         [ 4] 3626         CALL     COMPI
      0095F2 84 7E                 3627         .word BRAN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



      0095F4 CD 86 FD         [ 4] 3628         call ADRADJ 
      0095F7 CD 94 82         [ 4] 3629         CALL     COMMA
      0095FA CD 8B B2         [ 4] 3630         CALL     HERE
      0095FD CD 86 FD         [ 4] 3631         call ADRADJ 
      009600 CD 85 73         [ 4] 3632         CALL     SWAPP
      009603 CC 84 A5         [ 2] 3633         JP     STORE
                                   3634 
                                   3635 ;       AFT         ( a -- a A )
                                   3636 ;       Jump to THEN in a FOR-AFT-THEN-NEXT loop the first time through.
      009606 95 E8                 3637         .word      LINK
                           001588  3638 LINK = . 
      009608 83                    3639 	.byte      IMEDD+3
      009609 41 46 54              3640         .ascii     "AFT"
      00960C                       3641 AFT:
      00960C CD 85 59         [ 4] 3642         CALL     DROP
      00960F CD 95 BF         [ 4] 3643         CALL     AHEAD
      009612 CD 8B B2         [ 4] 3644         CALL     HERE
      009615 CC 85 73         [ 2] 3645         JP     SWAPP
                                   3646 
                                   3647 ;       ABORT"      ( -- ; <string> )
                                   3648 ;       Conditional abort with an error message.
      009618 96 08                 3649         .word      LINK
                           00159A  3650 LINK = . 
      00961A 86                    3651 	.byte      IMEDD+6
      00961B 41 42 4F 52 54        3652         .ascii     "ABORT"
      009620 22                    3653         .byte      '"'
      009621                       3654 ABRTQ:
      009621 CD 94 C7         [ 4] 3655         CALL     COMPI
      009624 93 45                 3656         .word ABORQ
      009626 CC 94 F7         [ 2] 3657         JP     STRCQ
                                   3658 
                                   3659 ;       $"     ( -- ; <string> )
                                   3660 ;       Compile an inline string literal.
      009629 96 1A                 3661         .word      LINK
                           0015AB  3662 LINK = . 
      00962B 82                    3663 	.byte      IMEDD+2
      00962C 24 22                 3664         .byte     '$','"'
      00962E                       3665 STRQ:
      00962E CD 94 C7         [ 4] 3666         CALL     COMPI
      009631 8F 5F                 3667         .word STRQP 
      009633 CC 94 F7         [ 2] 3668         JP     STRCQ
                                   3669 
                                   3670 ;       ."          ( -- ; <string> )
                                   3671 ;       Compile an inline string literal to be typed out at run time.
      009636 96 2B                 3672         .word      LINK
                           0015B8  3673 LINK = . 
      009638 82                    3674 	.byte      IMEDD+2
      009639 2E 22                 3675         .byte     '.','"'
      00963B                       3676 DOTQ:
      00963B CD 94 C7         [ 4] 3677         CALL     COMPI
      00963E 8F 69                 3678         .word DOTQP 
      009640 CC 94 F7         [ 2] 3679         JP     STRCQ
                                   3680 
                                   3681 ;; Name compiler
                                   3682 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



                                   3683 ;       ?UNIQUE ( a -- a )
                                   3684 ;       Display a warning message
                                   3685 ;       if word already exists.
      009643 96 38                 3686         .word      LINK
                           0015C5  3687 LINK = . 
      009645 07                    3688         .byte      7
      009646 3F 55 4E 49 51 55 45  3689         .ascii     "?UNIQUE"
      00964D                       3690 UNIQU:
      00964D CD 85 63         [ 4] 3691         CALL     DUPP
      009650 CD 92 39         [ 4] 3692         CALL     NAMEQ   ;?name exists
      009653 CD 84 67         [ 4] 3693         CALL     QBRAN
      009656 96 6C                 3694         .word      UNIQ1
      009658 CD 8F 69         [ 4] 3695         CALL     DOTQP   ;redef are OK
      00965B 07                    3696         .byte       7
      00965C 20 72 65 44 65 66 20  3697         .ascii     " reDef "       
      009663 CD 85 8D         [ 4] 3698         CALL     OVER
      009666 CD 8B 9B         [ 4] 3699         CALL     COUNT
      009669 CD 8F 0C         [ 4] 3700         CALL     TYPES   ;just in case
      00966C CC 85 59         [ 2] 3701 UNIQ1:  JP     DROP
                                   3702 
                                   3703 ;       $,n     ( na -- )
                                   3704 ;       Build a new dictionary name
                                   3705 ;       using string at na.
                                   3706 ; compile dans l'espace des variables 
      00966F 96 45                 3707         .word      LINK
                           0015F1  3708 LINK = . 
      009671 03                    3709         .byte      3
      009672 24 2C 6E              3710         .ascii     "$,n"
      009675                       3711 SNAME:
      009675 CD 85 63         [ 4] 3712         CALL     DUPP
      009678 CD 84 DA         [ 4] 3713         CALL     CAT     ;?null input
      00967B CD 84 67         [ 4] 3714         CALL     QBRAN
      00967E 96 AB                 3715         .word      PNAM1
      009680 CD 96 4D         [ 4] 3716         CALL     UNIQU   ;?redefinition
      009683 CD 85 63         [ 4] 3717         CALL     DUPP
      009686 CD 8B 9B         [ 4] 3718         CALL     COUNT
      009689 CD 87 5E         [ 4] 3719         CALL     PLUS
      00968C CD 86 B1         [ 4] 3720         CALL     VPP
      00968F CD 84 A5         [ 4] 3721         CALL     STORE
      009692 CD 85 63         [ 4] 3722         CALL     DUPP
      009695 CD 86 CF         [ 4] 3723         CALL     LAST
      009698 CD 84 A5         [ 4] 3724         CALL     STORE   ;save na for vocabulary link
      00969B CD 8A 3C         [ 4] 3725         CALL     CELLM   ;link address
      00969E CD 86 A3         [ 4] 3726         CALL     CNTXT
      0096A1 CD 84 BC         [ 4] 3727         CALL     AT
      0096A4 CD 85 73         [ 4] 3728         CALL     SWAPP
      0096A7 CD 84 A5         [ 4] 3729         CALL     STORE
      0096AA 81               [ 4] 3730         RET     ;save code pointer
      0096AB CD 8F 5F         [ 4] 3731 PNAM1:  CALL     STRQP
      0096AE 05                    3732         .byte      5
      0096AF 20 6E 61 6D 65        3733         .ascii     " name" ;null input
      0096B4 CC 93 4D         [ 2] 3734         JP     ABOR1
                                   3735 
                                   3736 ;; FORTH compiler
                                   3737 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



                                   3738 ;       $COMPILE        ( a -- )
                                   3739 ;       Compile next word to
                                   3740 ;       dictionary as a token or literal.
      0096B7 96 71                 3741         .word      LINK
                           001639  3742 LINK = . 
      0096B9 08                    3743         .byte      8
      0096BA 24 43 4F 4D 50 49 4C  3744         .ascii     "$COMPILE"
             45
      0096C2                       3745 SCOMP:
      0096C2 CD 92 39         [ 4] 3746         CALL     NAMEQ
      0096C5 CD 87 0D         [ 4] 3747         CALL     QDUP    ;?defined
      0096C8 CD 84 67         [ 4] 3748         CALL     QBRAN
      0096CB 96 E3                 3749         .word      SCOM2
      0096CD CD 84 BC         [ 4] 3750         CALL     AT
      0096D0 CD 84 34         [ 4] 3751         CALL     DOLIT
      0096D3 80 00                 3752         .word     0x8000	;  IMEDD*256
      0096D5 CD 85 AF         [ 4] 3753         CALL     ANDD    ;?immediate
      0096D8 CD 84 67         [ 4] 3754         CALL     QBRAN
      0096DB 96 E0                 3755         .word      SCOM1
      0096DD CC 84 8E         [ 2] 3756         JP     EXECU
      0096E0 CC 97 7D         [ 2] 3757 SCOM1:  JP     JSRC
      0096E3 CD 8D D7         [ 4] 3758 SCOM2:  CALL     NUMBQ   ;try to convert to number
      0096E6 CD 84 67         [ 4] 3759         CALL     QBRAN
      0096E9 93 4D                 3760         .word      ABOR1
      0096EB CC 94 E9         [ 2] 3761         JP     LITER
                                   3762 
                                   3763 ;       OVERT   ( -- )
                                   3764 ;       Link a new word into vocabulary.
      0096EE 96 B9                 3765         .word      LINK
                           001670  3766 LINK = . 
      0096F0 05                    3767         .byte      5
      0096F1 4F 56 45 52 54        3768         .ascii     "OVERT"
      0096F6                       3769 OVERT:
      0096F6 CD 86 CF         [ 4] 3770         CALL     LAST
      0096F9 CD 84 BC         [ 4] 3771         CALL     AT
      0096FC CD 86 A3         [ 4] 3772         CALL     CNTXT
      0096FF CC 84 A5         [ 2] 3773         JP     STORE
                                   3774 
                                   3775 ;       ;       ( -- )
                                   3776 ;       Terminate a colon definition.
      009702 96 F0                 3777         .word      LINK
                           001684  3778 LINK = . 
      009704 C1                    3779 	.byte      IMEDD+COMPO+1
      009705 3B                    3780         .ascii     ";"
      009706                       3781 SEMIS:
                           000001  3782 .if OPTIMIZE ; more compact and faster
      009706 CD 84 34         [ 4] 3783         call DOLIT 
      009709 00 81                 3784         .word 0x81   ; opcode for RET 
      00970B CD 94 99         [ 4] 3785         call CCOMMA 
                           000000  3786 .else
                                   3787         CALL     COMPI
                                   3788         .word EXIT 
                                   3789 .endif 
      00970E CD 93 AE         [ 4] 3790         CALL     LBRAC
      009711 CD 96 F6         [ 4] 3791         call OVERT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      009714 CD A0 D9         [ 4] 3792         CALL FMOVE
      009717 CD 87 0D         [ 4] 3793         call QDUP 
      00971A CD 84 67         [ 4] 3794         call QBRAN 
      00971D 98 4D                 3795         .word SET_RAMLAST 
      00971F CD A1 6D         [ 4] 3796         CALL UPDATPTR
      009722 81               [ 4] 3797         RET 
                                   3798 
                                   3799 
                                   3800 ;       Terminate an ISR definition 
                                   3801 ;       retourn ca of ISR as double
                                   3802 ;       I; ( -- ud )
      009723 97 04                 3803         .word LINK 
                           0016A5  3804         LINK=.
      009725 C2                    3805         .byte 2+IMEDD+COMPO 
      009726 49 3B                 3806         .ascii "I;" 
      009728                       3807 ISEMI:
      009728 1D 00 02         [ 2] 3808         subw x,#CELLL  
      00972B 90 AE 00 80      [ 2] 3809         ldw y,#IRET_CODE 
      00972F FF               [ 2] 3810         ldw (x),y 
      009730 CD 94 99         [ 4] 3811         call CCOMMA
      009733 CD 93 AE         [ 4] 3812         call LBRAC 
      009736 CD A1 B2         [ 4] 3813         call IFMOVE
      009739 CD 87 0D         [ 4] 3814         call QDUP 
      00973C CD 84 67         [ 4] 3815         CALL QBRAN 
      00973F 98 4D                 3816         .word SET_RAMLAST
      009741 CD 86 BF         [ 4] 3817         CALL CPP
      009744 CD 84 BC         [ 4] 3818         call AT 
      009747 CD 85 73         [ 4] 3819         call SWAPP 
      00974A CD 86 BF         [ 4] 3820         CALL CPP 
      00974D CD 84 A5         [ 4] 3821         call STORE 
      009750 CD 9B F6         [ 4] 3822         call UPDATCP 
      009753 CD 9B B3         [ 4] 3823         call EEPVP 
      009756 CD 85 59         [ 4] 3824         call DROP 
      009759 CD 84 BC         [ 4] 3825         call AT 
      00975C CD 86 B1         [ 4] 3826         call VPP 
      00975F CD 84 A5         [ 4] 3827         call STORE 
      009762 CC 8A C4         [ 2] 3828         jp ZERO
      009765 81               [ 4] 3829         ret           
                                   3830         
                                   3831 
                                   3832 ;       ]       ( -- )
                                   3833 ;       Start compiling words in
                                   3834 ;       input stream.
      009766 97 25                 3835         .word      LINK
                           0016E8  3836 LINK = . 
      009768 01                    3837         .byte      1
      009769 5D                    3838         .ascii     "]"
      00976A                       3839 RBRAC:
      00976A CD 84 34         [ 4] 3840         CALL   DOLIT
      00976D 96 C2                 3841         .word  SCOMP
      00976F CD 86 81         [ 4] 3842         CALL   TEVAL
      009772 CC 84 A5         [ 2] 3843         JP     STORE
                                   3844 
                                   3845 ;       CALL,    ( ca -- )
                                   3846 ;       Compile a subroutine call.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



      009775 97 68                 3847         .word      LINK
                           0016F7  3848 LINK = . 
      009777 05                    3849         .byte      5
      009778 43 41 4C 4C 2C        3850         .ascii     "CALL,"
      00977D                       3851 JSRC:
      00977D CD 84 34         [ 4] 3852         CALL     DOLIT
      009780 00 CD                 3853         .word     CALLL     ;CALL
      009782 CD 94 99         [ 4] 3854         CALL     CCOMMA
      009785 CC 94 82         [ 2] 3855         JP     COMMA
                                   3856 
                                   3857 ;       INIT-OFS ( -- )
                                   3858 ;       compute offset to adjust jump address 
                                   3859 ;       set variable OFFSET 
      009788 97 77                 3860         .word LINK 
                           00170A  3861         LINK=.
      00978A 08                    3862         .byte 8 
      00978B 49 4E 49 54 2D 4F 46  3863         .ascii "INIT-OFS" 
             53
      009793                       3864 INITOFS:
      009793 CD 86 70         [ 4] 3865         call TFLASH 
      009796 CD 84 BC         [ 4] 3866         CALL AT 
      009799 CD 85 63         [ 4] 3867         CALL DUPP 
      00979C CD 84 67         [ 4] 3868         call QBRAN
      00979F 97 B0                 3869         .word 1$
      0097A1 CD 85 59         [ 4] 3870         call DROP  
      0097A4 CD 86 BF         [ 4] 3871         call CPP 
      0097A7 CD 84 BC         [ 4] 3872         call AT 
      0097AA CD 8B B2         [ 4] 3873         call HERE
      0097AD CD 87 D7         [ 4] 3874         call SUBB 
      0097B0 CD 86 F4         [ 4] 3875 1$:     call OFFSET 
      0097B3 CC 84 A5         [ 2] 3876         jp STORE  
                                   3877 
                                   3878 ;       :       ( -- ; <string> )
                                   3879 ;       Start a new colon definition
                                   3880 ;       using next word as its name.
      0097B6 97 8A                 3881         .word      LINK
                           001738  3882 LINK = . 
      0097B8 01                    3883         .byte      1
      0097B9 3A                    3884         .ascii     ":"
      0097BA                       3885 COLON:
      0097BA CD 97 93         [ 4] 3886         call INITOFS       
      0097BD CD 91 3C         [ 4] 3887         CALL   TOKEN
      0097C0 CD 96 75         [ 4] 3888         CALL   SNAME
      0097C3 CC 97 6A         [ 2] 3889         JP     RBRAC
                                   3890 
                                   3891 ;       I:  ( -- )
                                   3892 ;       Start interrupt service routine definition
                                   3893 ;       those definition have no name.
      0097C6 97 B8                 3894         .word LINK
                           001748  3895         LINK=.
      0097C8 02                    3896         .byte 2 
      0097C9 49 3A                 3897         .ascii "I:" 
      0097CB                       3898 ICOLON:
      0097CB CD 97 93         [ 4] 3899         call INITOFS 
      0097CE CC 97 6A         [ 2] 3900         jp RBRAC  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



                                   3901 
                                   3902 ;       IMMEDIATE       ( -- )
                                   3903 ;       Make last compiled word
                                   3904 ;       an immediate word.
      0097D1 97 C8                 3905         .word      LINK
                           001753  3906 LINK = . 
      0097D3 09                    3907         .byte      9
      0097D4 49 4D 4D 45 44 49 41  3908         .ascii     "IMMEDIATE"
             54 45
      0097DD                       3909 IMMED:
      0097DD CD 84 34         [ 4] 3910         CALL     DOLIT
      0097E0 80 00                 3911         .word     0x8000	;  IMEDD*256
      0097E2 CD 86 CF         [ 4] 3912         CALL     LAST
      0097E5 CD 84 BC         [ 4] 3913         CALL     AT
      0097E8 CD 84 BC         [ 4] 3914         CALL     AT
      0097EB CD 85 C3         [ 4] 3915         CALL     ORR
      0097EE CD 86 CF         [ 4] 3916         CALL     LAST
      0097F1 CD 84 BC         [ 4] 3917         CALL     AT
      0097F4 CC 84 A5         [ 2] 3918         JP     STORE
                                   3919 
                                   3920 ;; Defining words
                                   3921 
                                   3922 ;       CREATE  ( -- ; <string> )
                                   3923 ;       Compile a new array
                                   3924 ;       without allocating space.
      0097F7 97 D3                 3925         .word      LINK
                           001779  3926 LINK = . 
      0097F9 06                    3927         .byte      6
      0097FA 43 52 45 41 54 45     3928         .ascii     "CREATE"
      009800                       3929 CREAT:
      009800 CD 91 3C         [ 4] 3930         CALL     TOKEN
      009803 CD 96 75         [ 4] 3931         CALL     SNAME
      009806 CD 96 F6         [ 4] 3932         CALL     OVERT        
      009809 CD 94 C7         [ 4] 3933         CALL     COMPI 
      00980C 86 10                 3934         .word DOVAR 
      00980E 81               [ 4] 3935         RET
                                   3936 
                                   3937 ;       VARIABLE        ( -- ; <string> )
                                   3938 ;       Compile a new variable
                                   3939 ;       initialized to 0.
      00980F 97 F9                 3940         .word      LINK
                           001791  3941 LINK = . 
      009811 08                    3942         .byte      8
      009812 56 41 52 49 41 42 4C  3943         .ascii     "VARIABLE"
             45
      00981A                       3944 VARIA:
                                   3945 ; indirect variable so that VARIABLE definition can be compiled in FLASH 
      00981A CD 8B B2         [ 4] 3946         CALL HERE
      00981D CD 85 63         [ 4] 3947         CALL DUPP 
      009820 CD 8A 2D         [ 4] 3948         CALL CELLP
      009823 CD 86 B1         [ 4] 3949         CALL VPP 
      009826 CD 84 A5         [ 4] 3950         CALL STORE
      009829 CD 98 00         [ 4] 3951         CALL CREAT
      00982C CD 85 63         [ 4] 3952         CALL DUPP
      00982F CD 94 82         [ 4] 3953         CALL COMMA
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      009832 CD 8A C4         [ 4] 3954         CALL ZERO
      009835 CD 85 73         [ 4] 3955         call SWAPP 
      009838 CD 84 A5         [ 4] 3956         CALL STORE
      00983B CD A0 D9         [ 4] 3957         CALL FMOVE ; move definition to FLASH
      00983E CD 87 0D         [ 4] 3958         CALL QDUP 
      009841 CD 84 67         [ 4] 3959         CALL QBRAN 
      009844 98 4D                 3960         .word SET_RAMLAST   
      009846 CD 9C 0D         [ 4] 3961         call UPDATVP  ; don't update if variable kept in RAM.
      009849 CD A1 6D         [ 4] 3962         CALL UPDATPTR
      00984C 81               [ 4] 3963         RET         
      00984D                       3964 SET_RAMLAST: 
      00984D CD 86 CF         [ 4] 3965         CALL LAST 
      009850 CD 84 BC         [ 4] 3966         CALL AT 
      009853 CD 86 E2         [ 4] 3967         CALL RAMLAST 
      009856 CC 84 A5         [ 2] 3968         jp STORE  
                                   3969 
                                   3970 
                                   3971 ;       CONSTANT  ( n -- ; <string> )
                                   3972 ;       Compile a new constant 
                                   3973 ;       n CONSTANT name 
      009859 98 11                 3974         .word LINK 
                           0017DB  3975         LINK=. 
      00985B 08                    3976         .byte 8 
      00985C 43 4F 4E 53 54 41 4E  3977         .ascii "CONSTANT" 
             54
      009864                       3978 CONSTANT:          
      009864 CD 91 3C         [ 4] 3979         CALL TOKEN
      009867 CD 96 75         [ 4] 3980         CALL SNAME 
      00986A CD 96 F6         [ 4] 3981         CALL OVERT 
      00986D CD 94 C7         [ 4] 3982         CALL COMPI 
      009870 98 8E                 3983         .word DOCONST
      009872 CD 94 82         [ 4] 3984         CALL COMMA 
      009875 CD A0 D9         [ 4] 3985         CALL FMOVE
      009878 CD 87 0D         [ 4] 3986         CALL QDUP 
      00987B CD 84 67         [ 4] 3987         CALL QBRAN 
      00987E 98 4D                 3988         .word SET_RAMLAST  
      009880 CD A1 6D         [ 4] 3989         CALL UPDATPTR  
      009883 81               [ 4] 3990 1$:     RET          
                                   3991 
                                   3992 ; CONSTANT runtime semantic 
                                   3993 ; doCONST  ( -- n )
      009884 98 5B                 3994         .word LINK 
                           001806  3995         LINK=.
      009886 07                    3996         .byte 7
      009887 44 4F 43 4F 4E 53 54  3997         .ascii "DOCONST"
      00988E                       3998 DOCONST:
      00988E 1D 00 02         [ 2] 3999         subw x,#CELLL
      009891 90 85            [ 2] 4000         popw y 
      009893 90 FE            [ 2] 4001         ldw y,(y) 
      009895 FF               [ 2] 4002         ldw (x),y 
      009896 81               [ 4] 4003         ret 
                                   4004 
                                   4005 
                                   4006 ;; Tools
                                   4007 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



                                   4008 ;       _TYPE   ( b u -- )
                                   4009 ;       Display a string. Filter
                                   4010 ;       non-printing characters.
      009897 98 86                 4011         .word      LINK
                           001819  4012 LINK = . 
      009899 05                    4013         .byte      5
      00989A 5F 54 59 50 45        4014         .ascii     "_TYPE"
      00989F                       4015 UTYPE:
      00989F CD 85 2C         [ 4] 4016         CALL     TOR     ;start count down loop
      0098A2 20 0F            [ 2] 4017         JRA     UTYP2   ;skip first pass
      0098A4 CD 85 63         [ 4] 4018 UTYP1:  CALL     DUPP
      0098A7 CD 84 DA         [ 4] 4019         CALL     CAT
      0098AA CD 8A EE         [ 4] 4020         CALL     TCHAR
      0098AD CD 84 1E         [ 4] 4021         CALL     EMIT    ;display only printable
      0098B0 CD 8A 58         [ 4] 4022         CALL     ONEP    ;increment address
      0098B3 CD 84 48         [ 4] 4023 UTYP2:  CALL     DONXT
      0098B6 98 A4                 4024         .word      UTYP1   ;loop till done
      0098B8 CC 85 59         [ 2] 4025         JP     DROP
                                   4026 
                                   4027 ;       dm+     ( a u -- a )
                                   4028 ;       Dump u bytes from ,
                                   4029 ;       leaving a+u on  stack.
      0098BB 98 99                 4030         .word      LINK
                           00183D  4031 LINK = . 
      0098BD 03                    4032         .byte      3
      0098BE 64 6D 2B              4033         .ascii     "dm+"
      0098C1                       4034 DUMPP:
      0098C1 CD 85 8D         [ 4] 4035         CALL     OVER
      0098C4 CD 84 34         [ 4] 4036         CALL     DOLIT
      0098C7 00 04                 4037         .word      4
      0098C9 CD 8F 92         [ 4] 4038         CALL     UDOTR   ;display address
      0098CC CD 8E E2         [ 4] 4039         CALL     SPACE
      0098CF CD 85 2C         [ 4] 4040         CALL     TOR     ;start count down loop
      0098D2 20 11            [ 2] 4041         JRA     PDUM2   ;skip first pass
      0098D4 CD 85 63         [ 4] 4042 PDUM1:  CALL     DUPP
      0098D7 CD 84 DA         [ 4] 4043         CALL     CAT
      0098DA CD 84 34         [ 4] 4044         CALL     DOLIT
      0098DD 00 03                 4045         .word      3
      0098DF CD 8F 92         [ 4] 4046         CALL     UDOTR   ;display numeric data
      0098E2 CD 8A 58         [ 4] 4047         CALL     ONEP    ;increment address
      0098E5 CD 84 48         [ 4] 4048 PDUM2:  CALL     DONXT
      0098E8 98 D4                 4049         .word      PDUM1   ;loop till done
      0098EA 81               [ 4] 4050         RET
                                   4051 
                                   4052 ;       DUMP    ( a u -- )
                                   4053 ;       Dump u bytes from a,
                                   4054 ;       in a formatted manner.
      0098EB 98 BD                 4055         .word      LINK
                           00186D  4056 LINK = . 
      0098ED 04                    4057         .byte      4
      0098EE 44 55 4D 50           4058         .ascii     "DUMP"
      0098F2                       4059 DUMP:
      0098F2 CD 86 20         [ 4] 4060         CALL     BASE
      0098F5 CD 84 BC         [ 4] 4061         CALL     AT
      0098F8 CD 85 2C         [ 4] 4062         CALL     TOR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



      0098FB CD 8D 6A         [ 4] 4063         CALL     HEX     ;save radix, set hex
      0098FE CD 84 34         [ 4] 4064         CALL     DOLIT
      009901 00 10                 4065         .word      16
      009903 CD 89 7E         [ 4] 4066         CALL     SLASH   ;change count to lines
      009906 CD 85 2C         [ 4] 4067         CALL     TOR     ;start count down loop
      009909 CD 8F 2A         [ 4] 4068 DUMP1:  CALL     CR
      00990C CD 84 34         [ 4] 4069         CALL     DOLIT
      00990F 00 10                 4070         .word      16
      009911 CD 87 49         [ 4] 4071         CALL     DDUP
      009914 CD 98 C1         [ 4] 4072         CALL     DUMPP   ;display numeric
      009917 CD 87 1E         [ 4] 4073         CALL     ROT
      00991A CD 87 1E         [ 4] 4074         CALL     ROT
      00991D CD 8E E2         [ 4] 4075         CALL     SPACE
      009920 CD 8E E2         [ 4] 4076         CALL     SPACE
      009923 CD 98 9F         [ 4] 4077         CALL     UTYPE   ;display printable characters
      009926 CD 84 48         [ 4] 4078         CALL     DONXT
      009929 99 09                 4079         .word      DUMP1   ;loop till done
      00992B CD 85 59         [ 4] 4080 DUMP3:  CALL     DROP
      00992E CD 85 0D         [ 4] 4081         CALL     RFROM
      009931 CD 86 20         [ 4] 4082         CALL     BASE
      009934 CC 84 A5         [ 2] 4083         JP     STORE   ;restore radix
                                   4084 
                                   4085 ;       .S      ( ... -- ... )
                                   4086 ;        Display  contents of stack.
      009937 98 ED                 4087         .word      LINK
                           0018B9  4088 LINK = . 
      009939 02                    4089         .byte      2
      00993A 2E 53                 4090         .ascii     ".S"
      00993C                       4091 DOTS:
      00993C CD 8F 2A         [ 4] 4092         CALL     CR
      00993F CD 8B 06         [ 4] 4093         CALL     DEPTH   ;stack depth
      009942 CD 85 2C         [ 4] 4094         CALL     TOR     ;start count down loop
      009945 20 09            [ 2] 4095         JRA     DOTS2   ;skip first pass
      009947 CD 85 20         [ 4] 4096 DOTS1:  CALL     RAT
      00994A CD 8B 1D         [ 4] 4097 	CALL     PICK
      00994D CD 8F C5         [ 4] 4098         CALL     DOT     ;index stack, display contents
      009950 CD 84 48         [ 4] 4099 DOTS2:  CALL     DONXT
      009953 99 47                 4100         .word      DOTS1   ;loop till done
      009955 CD 8F 69         [ 4] 4101         CALL     DOTQP
      009958 05                    4102         .byte      5
      009959 20 3C 73 70 20        4103         .ascii     " <sp "
      00995E 81               [ 4] 4104         RET
                                   4105 
                                   4106 ;       >NAME   ( ca -- na | F )
                                   4107 ;       Convert code address
                                   4108 ;       to a name address.
      00995F 99 39                 4109         .word      LINK
                           0018E1  4110 LINK = . 
      009961 05                    4111         .byte      5
      009962 3E 4E 41 4D 45        4112         .ascii     ">NAME"
      009967                       4113 TNAME:
      009967 CD 86 A3         [ 4] 4114         CALL     CNTXT   ;vocabulary link
      00996A CD 84 BC         [ 4] 4115 TNAM2:  CALL     AT
      00996D CD 85 63         [ 4] 4116         CALL     DUPP    ;?last word in a vocabulary
      009970 CD 84 67         [ 4] 4117         CALL     QBRAN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



      009973 99 8E                 4118         .word      TNAM4
      009975 CD 87 49         [ 4] 4119         CALL     DDUP
      009978 CD 91 4A         [ 4] 4120         CALL     NAMET
      00997B CD 85 D8         [ 4] 4121         CALL     XORR    ;compare
      00997E CD 84 67         [ 4] 4122         CALL     QBRAN
      009981 99 88                 4123         .word      TNAM3
      009983 CD 8A 3C         [ 4] 4124         CALL     CELLM   ;continue with next word
      009986 20 E2            [ 2] 4125         JRA     TNAM2
      009988 CD 85 73         [ 4] 4126 TNAM3:  CALL     SWAPP
      00998B CC 85 59         [ 2] 4127         JP     DROP
      00998E CD 87 3E         [ 4] 4128 TNAM4:  CALL     DDROP
      009991 CC 8A C4         [ 2] 4129         JP     ZERO
                                   4130 
                                   4131 ;       .ID     ( na -- )
                                   4132 ;        Display  name at address.
      009994 99 61                 4133         .word      LINK
                           001916  4134 LINK = . 
      009996 03                    4135         .byte      3
      009997 2E 49 44              4136         .ascii     ".ID"
      00999A                       4137 DOTID:
      00999A CD 87 0D         [ 4] 4138         CALL     QDUP    ;if zero no name
      00999D CD 84 67         [ 4] 4139         CALL     QBRAN
      0099A0 99 B0                 4140         .word      DOTI1
      0099A2 CD 8B 9B         [ 4] 4141         CALL     COUNT
      0099A5 CD 84 34         [ 4] 4142         CALL     DOLIT
      0099A8 00 1F                 4143         .word      0x1F
      0099AA CD 85 AF         [ 4] 4144         CALL     ANDD    ;mask lexicon bits
      0099AD CC 98 9F         [ 2] 4145         JP     UTYPE
      0099B0 CD 8F 69         [ 4] 4146 DOTI1:  CALL     DOTQP
      0099B3 09                    4147         .byte      9
      0099B4 20 6E 6F 4E 61 6D 65  4148         .ascii     " noName"
      0099BB 81               [ 4] 4149         RET
                                   4150 
                           000000  4151 WANT_SEE=0
                           000000  4152 .if WANT_SEE 
                                   4153 ;       SEE     ( -- ; <string> )
                                   4154 ;       A simple decompiler.
                                   4155 ;       Updated for byte machines.
                                   4156         .word      LINK
                                   4157 LINK = . 
                                   4158         .byte      3
                                   4159         .ascii     "SEE"
                                   4160 SEE:
                                   4161         CALL     TICK    ;starting address
                                   4162         CALL     CR
                                   4163         CALL     ONEM
                                   4164 SEE1:   CALL     ONEP
                                   4165         CALL     DUPP
                                   4166         CALL     AT
                                   4167         CALL     DUPP
                                   4168         CALL     QBRAN
                                   4169         .word    SEE2
                                   4170         CALL     TNAME   ;?is it a name
                                   4171 SEE2:   CALL     QDUP    ;name address or zero
                                   4172         CALL     QBRAN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



                                   4173         .word    SEE3
                                   4174         CALL     SPACE
                                   4175         CALL     DOTID   ;display name
                                   4176         CALL     ONEP
                                   4177         JRA      SEE4
                                   4178 SEE3:   CALL     DUPP
                                   4179         CALL     CAT
                                   4180         CALL     UDOT    ;display number
                                   4181 SEE4:   CALL     NUFQ    ;user control
                                   4182         CALL     QBRAN
                                   4183         .word    SEE1
                                   4184         JP     DROP
                                   4185 .endif ; WANT_SEE 
                                   4186 
                                   4187 ;       WORDS   ( -- )
                                   4188 ;       Display names in vocabulary.
      0099BC 99 96                 4189         .word      LINK
                           00193E  4190 LINK = . 
      0099BE 05                    4191         .byte      5
      0099BF 57 4F 52 44 53        4192         .ascii     "WORDS"
      0099C4                       4193 WORDS:
      0099C4 CD 8F 2A         [ 4] 4194         CALL     CR
      0099C7 CD 86 A3         [ 4] 4195         CALL     CNTXT   ;only in context
      0099CA CD 84 BC         [ 4] 4196 WORS1:  CALL     AT
      0099CD CD 87 0D         [ 4] 4197         CALL     QDUP    ;?at end of list
      0099D0 CD 84 67         [ 4] 4198         CALL     QBRAN
      0099D3 99 E6                 4199         .word      WORS2
      0099D5 CD 85 63         [ 4] 4200         CALL     DUPP
      0099D8 CD 8E E2         [ 4] 4201         CALL     SPACE
      0099DB CD 99 9A         [ 4] 4202         CALL     DOTID   ;display a name
      0099DE CD 8A 3C         [ 4] 4203         CALL     CELLM
      0099E1 CD 84 7E         [ 4] 4204         CALL     BRAN
      0099E4 99 CA                 4205         .word      WORS1
      0099E6 81               [ 4] 4206 WORS2:  RET
                                   4207 
                                   4208         
                                   4209 ;; Hardware reset
                                   4210 
                                   4211 ;       hi      ( -- )
                                   4212 ;       Display sign-on message.
      0099E7 99 BE                 4213         .word      LINK
                           001969  4214 LINK = . 
      0099E9 02                    4215         .byte      2
      0099EA 68 69                 4216         .ascii     "hi"
      0099EC                       4217 HI:
      0099EC CD 8F 2A         [ 4] 4218         CALL     CR
      0099EF CD 8F 69         [ 4] 4219         CALL     DOTQP   ;initialize I/O
      0099F2 0F                    4220         .byte      15
      0099F3 73 74 6D 38 65 46 6F  4221         .ascii     "stm8eForth v"
             72 74 68 20 76
      0099FF 33                    4222 	.byte      VER+'0'
      009A00 2E                    4223         .byte      '.' 
      009A01 30                    4224 	.byte      EXT+'0' ;version
      009A02 CC 8F 2A         [ 2] 4225         JP     CR
                                   4226 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



                           000000  4227 WANT_DEBUG=0
                           000000  4228 .if WANT_DEBUG 
                                   4229 ;       DEBUG      ( -- )
                                   4230 ;       Display sign-on message.
                                   4231 ;        .word      LINK
                                   4232 LINK = . 
                                   4233         .byte      5
                                   4234         .ascii     "DEBUG"
                                   4235 DEBUG:
                                   4236 	CALL DOLIT
                                   4237 	.word 0x65
                                   4238 	CALL EMIT
                                   4239 	CALL DOLIT
                                   4240 	.word 0
                                   4241  	CALL ZLESS 
                                   4242 	CALL DOLIT
                                   4243 	.word 0xFFFE
                                   4244 	CALL ZLESS 
                                   4245 	CALL UPLUS 
                                   4246  	CALL DROP 
                                   4247 	CALL DOLIT
                                   4248 	.word 3
                                   4249 	CALL UPLUS 
                                   4250 	CALL UPLUS 
                                   4251  	CALL DROP
                                   4252 	CALL DOLIT
                                   4253 	.word 0x43
                                   4254 	CALL UPLUS 
                                   4255  	CALL DROP
                                   4256 	CALL EMIT
                                   4257 	CALL DOLIT
                                   4258 	.word 0x4F
                                   4259 	CALL DOLIT
                                   4260 	.word 0x6F
                                   4261  	CALL XORR
                                   4262 	CALL DOLIT
                                   4263 	.word 0xF0
                                   4264  	CALL ANDD
                                   4265 	CALL DOLIT
                                   4266 	.word 0x4F
                                   4267  	CALL ORR
                                   4268 	CALL EMIT
                                   4269 	CALL DOLIT
                                   4270 	.word 8
                                   4271 	CALL DOLIT
                                   4272 	.word 6
                                   4273  	CALL SWAPP
                                   4274 	CALL OVER
                                   4275 	CALL XORR
                                   4276 	CALL DOLIT
                                   4277 	.word 3
                                   4278 	CALL ANDD 
                                   4279 	CALL ANDD
                                   4280 	CALL DOLIT
                                   4281 	.word 0x70
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



                                   4282 	CALL UPLUS 
                                   4283 	CALL DROP
                                   4284 	CALL EMIT
                                   4285 	CALL DOLIT
                                   4286 	.word 0
                                   4287 	CALL QBRAN
                                   4288 	.word DEBUG1
                                   4289 	CALL DOLIT
                                   4290 	.word 0x3F
                                   4291 DEBUG1:
                                   4292 	CALL DOLIT
                                   4293 	.word 0xFFFF
                                   4294 	CALL QBRAN
                                   4295 	.word DEBUG2
                                   4296 	CALL DOLIT
                                   4297 	.word 0x74
                                   4298 	CALL BRAN
                                   4299 	.word DEBUG3
                                   4300 DEBUG2:
                                   4301 	CALL DOLIT
                                   4302 	.word 0x21
                                   4303 DEBUG3:
                                   4304 	CALL EMIT
                                   4305 	CALL DOLIT
                                   4306 	.word 0x68
                                   4307 	CALL DOLIT
                                   4308 	.word 0x80
                                   4309 	CALL STORE
                                   4310 	CALL DOLIT
                                   4311 	.word 0x80
                                   4312 	CALL AT
                                   4313 	CALL EMIT
                                   4314 	CALL DOLIT
                                   4315 	.word 0x4D
                                   4316 	CALL TOR
                                   4317 	CALL RAT
                                   4318 	CALL RFROM
                                   4319 	CALL ANDD
                                   4320 	CALL EMIT
                                   4321 	CALL DOLIT
                                   4322 	.word 0x61
                                   4323 	CALL DOLIT
                                   4324 	.word 0xA
                                   4325 	CALL TOR
                                   4326 DEBUG4:
                                   4327 	CALL DOLIT
                                   4328 	.word 1
                                   4329 	CALL UPLUS 
                                   4330 	CALL DROP
                                   4331 	CALL DONXT
                                   4332 	.word DEBUG4
                                   4333 	CALL EMIT
                                   4334 	CALL DOLIT
                                   4335 	.word 0x656D
                                   4336 	CALL DOLIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



                                   4337 	.word 0x100
                                   4338 	CALL UMSTA
                                   4339 	CALL SWAPP
                                   4340 	CALL DOLIT
                                   4341 	.word 0x100
                                   4342 	CALL UMSTA
                                   4343 	CALL SWAPP 
                                   4344 	CALL DROP
                                   4345 	CALL EMIT
                                   4346 	CALL EMIT
                                   4347 	CALL DOLIT
                                   4348 	.word 0x2043
                                   4349 	CALL DOLIT
                                   4350 	.word 0
                                   4351 	CALL DOLIT
                                   4352 	.word 0x100
                                   4353 	CALL UMMOD
                                   4354 	CALL EMIT
                                   4355 	CALL EMIT
                                   4356 	;JP ORIG
                                   4357 	RET
                                   4358 .endif ; WANT_DEBUG 
                                   4359 
                                   4360 
                                   4361 ;       'BOOT   ( -- a )
                                   4362 ;       The application startup vector.
      009A05 99 E9                 4363         .word      LINK
                           001987  4364 LINK = . 
      009A07 05                    4365         .byte      5
      009A08 27 42 4F 4F 54        4366         .ascii     "'BOOT"
      009A0D                       4367 TBOOT:
      009A0D CD 86 10         [ 4] 4368         CALL     DOVAR
      009A10 40 02                 4369         .word    APP_RUN      ;application to boot
                                   4370 
                                   4371 ;       COLD    ( -- )
                                   4372 ;       The hilevel cold start s=ence.
      009A12 9A 07                 4373         .word      LINK
                           001994  4374         LINK = . 
      009A14 04                    4375         .byte      4
      009A15 43 4F 4C 44           4376         .ascii     "COLD"
      009A19                       4377 COLD:
                           000000  4378 .if WANT_DEBUG
                                   4379         CALL DEBUG
                                   4380 .endif ; WANT_DEBUG
      009A19 CD 84 34         [ 4] 4381 COLD1:  CALL     DOLIT
      009A1C 80 AB                 4382         .word      UZERO
      009A1E CD 84 34         [ 4] 4383 	CALL     DOLIT
      009A21 00 06                 4384         .word      UPP
      009A23 CD 84 34         [ 4] 4385         CALL     DOLIT
      009A26 00 1A                 4386 	.word      UEND-UZERO
      009A28 CD 8B FF         [ 4] 4387         CALL     CMOVE   ;initialize user area
                                   4388 
                                   4389 ; if APP_RUN==0 initialize with ca de 'hi'  
      009A2B 90 CE 40 02      [ 2] 4390         ldw y,APP_RUN 
      009A2F 26 0B            [ 1] 4391         jrne 0$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



      009A31 1D 00 02         [ 2] 4392         subw x,#CELLL 
      009A34 90 AE 99 EC      [ 2] 4393         ldw y,#HI  
      009A38 FF               [ 2] 4394         ldw (x),y
      009A39 CD 9B E5         [ 4] 4395         call UPDATRUN 
      009A3C                       4396 0$:        
                                   4397 ; update LAST with APP_LAST 
                                   4398 ; if APP_LAST > LAST else do the opposite
      009A3C 90 CE 40 00      [ 2] 4399         ldw y,APP_LAST 
      009A40 90 B3 1A         [ 2] 4400         cpw y,ULAST 
      009A43 22 05            [ 1] 4401         jrugt 1$ 
                                   4402 ; save LAST at APP_LAST  
      009A45 CD 9B CD         [ 4] 4403         call UPDATLAST 
      009A48 20 06            [ 2] 4404         jra 2$
      009A4A                       4405 1$: ; update LAST with APP_LAST 
      009A4A 90 BF 1A         [ 2] 4406         ldw ULAST,y
      009A4D 90 BF 14         [ 2] 4407         ldw UCNTXT,y
      009A50                       4408 2$:  
                                   4409 ; update APP_CP if < app_space 
      009A50 90 CE 40 04      [ 2] 4410         ldw y,APP_CP  
      009A54 90 B3 18         [ 2] 4411         cpw y,UCP   
      009A57 24 06            [ 1] 4412         jruge 3$ 
      009A59 CD 9B F6         [ 4] 4413         call UPDATCP
      009A5C 90 BE 18         [ 2] 4414         ldw y,UCP   
      009A5F                       4415 3$:
      009A5F 90 BF 18         [ 2] 4416         ldw UCP,y                 
                                   4417 ; update UVP with APP_VP  
                                   4418 ; if APP_VP>UVP else do the opposite 
      009A62 90 CE 40 06      [ 2] 4419         ldw y,APP_VP 
      009A66 90 B3 16         [ 2] 4420         cpw y,UVP 
      009A69 22 05            [ 1] 4421         jrugt 4$
      009A6B CD 9C 0D         [ 4] 4422         call UPDATVP 
      009A6E 20 03            [ 2] 4423         jra 6$
      009A70                       4424 4$: ; update UVP with APP_VP 
      009A70 90 BF 16         [ 2] 4425         ldw UVP,y 
      009A73                       4426 6$:      
      009A73 CD 94 2D         [ 4] 4427         CALL     PRESE   ;initialize data stack and TIB
      009A76 CD 9A 0D         [ 4] 4428         CALL     TBOOT
      009A79 CD 8B E8         [ 4] 4429         CALL     ATEXE   ;application boot
      009A7C CD 96 F6         [ 4] 4430         CALL     OVERT
      009A7F CC 94 4A         [ 2] 4431         JP     QUIT    ;start interpretation
                                   4432 
                           000001  4433 WANT_MATH_CONST = 1 
                           000001  4434 .if WANT_MATH_CONST 
                                   4435         ; irrational constants 
                                   4436         ; approximation by integers ratio.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



                                   4437         .include "const_ratio.asm"
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
      009A82 9A 14                   31         .word LINK 
                           001A04    32         LINK=.
      009A84 02                      33         .byte 2
      009A85 50 49                   34         .ascii "PI" 
      009A87                         35 PII:
      009A87 1D 00 04         [ 2]   36         subw x,#2*CELLL 
      009A8A 90 AE 01 63      [ 2]   37         ldw y,#355 
      009A8E EF 02            [ 2]   38         ldw (2,x),y 
      009A90 90 AE 00 71      [ 2]   39         ldw y,#113 
      009A94 FF               [ 2]   40         ldw (x),y 
      009A95 81               [ 4]   41         ret 
                                     42 
                                     43 ;      SQRT2 ( -- 19601  13860 )
                                     44 ; precision: 1.5e-9 
                                     45 ; usage example to compute Voltage peek to peek from Vrms 
                                     46 ; : VPP SQRT2 */ 2 * ;
                                     47 ;
      009A96 9A 84                   48         .word LINK 
                           001A18    49         LINK=.
      009A98 05                      50         .byte 5 
      009A99 53 51 52 54 32          51         .ascii "SQRT2" 
      009A9E                         52 SQRT2:
      009A9E 1D 00 04         [ 2]   53         subw x,#2*CELLL 
      009AA1 90 AE 4C 91      [ 2]   54         ldw y,#19601 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



      009AA5 EF 02            [ 2]   55         ldw (2,x),y 
      009AA7 90 AE 36 24      [ 2]   56         ldw y,#13860 
      009AAB FF               [ 2]   57         ldw (x),y 
      009AAC 81               [ 4]   58         ret 
                                     59 
                                     60 ;   SQRT3 ( -- 18817 10864 )
                                     61 ; precision: 1.1e-9
                                     62 ;
      009AAD 9A 98                   63         .word LINK 
                           001A2F    64         LINK=.
      009AAF 05                      65         .byte 5
      009AB0 53 51 52 54 33          66         .ascii "SQRT3" 
      009AB5                         67 SQRT3: 
      009AB5 1D 00 04         [ 2]   68     subw x,#2*CELLL 
      009AB8 90 AE 49 81      [ 2]   69     ldw y,#18817 
      009ABC EF 02            [ 2]   70     ldw (2,x),y 
      009ABE 90 AE 2A 70      [ 2]   71     ldw y,#10864 
      009AC2 FF               [ 2]   72     ldw (x),y 
      009AC3 81               [ 4]   73     ret 
                                     74 
                                     75 ;   E ( -- 28667 10546 )
                                     76 ; precision: 5.5e-9 
                                     77 ; natural log base 
      009AC4 9A AF                   78         .word LINK 
                           001A46    79         LINK=.
      009AC6 01                      80         .byte 1
      009AC7 45                      81         .ascii "E" 
      009AC8                         82 ENEPER:
      009AC8 1D 00 04         [ 2]   83     subw x,#2*CELLL 
      009ACB 90 AE 6F FB      [ 2]   84     ldw y,#28667 
      009ACF EF 02            [ 2]   85     ldw (2,x),y 
      009AD1 90 AE 29 32      [ 2]   86     ldw y,#10546 
      009AD5 FF               [ 2]   87     ldw (x),y 
      009AD6 81               [ 4]   88     ret 
                                     89 
                                     90 ;   SQRT10 ( -- 22936 7253 )
                                     91 ; precision: 5.7e-9 
      009AD7 9A C6                   92         .word LINK 
                           001A59    93         LINK=.
      009AD9 06                      94         .byte 6 
      009ADA 53 51 52 54 31 30       95         .ascii "SQRT10" 
      009AE0                         96 SQRT10:
      009AE0 1D 00 04         [ 2]   97     subw x,#2*CELLL
      009AE3 90 AE 59 98      [ 2]   98     ldw y,#22936 
      009AE7 EF 02            [ 2]   99     ldw (2,x),y 
      009AE9 90 AE 1C 55      [ 2]  100     ldw y,#7253
      009AED FF               [ 2]  101     ldw (x),y 
      009AEE 81               [ 4]  102     ret 
                                    103 
                                    104 ;   SQRT12 ( -- 26797 25293 )
                                    105 ; precision: 1.0e-9 
                                    106 ; used in music to compute well tempered scale
      009AEF 9A D9                  107         .word LINK 
                           001A71   108         LINK=. 
      009AF1 05                     109         .byte 5 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



      009AF2 31 32 52 54 32         110         .ascii "12RT2"
      009AF7                        111 RT12_2:
      009AF7 1D 00 04         [ 2]  112     subw x,#2*CELLL 
      009AFA 90 AE 68 AD      [ 2]  113     ldw y,#26797
      009AFE EF 02            [ 2]  114     ldw (2,x),y 
      009B00 90 AE 62 CD      [ 2]  115     ldw y,#25293
      009B04 FF               [ 2]  116     ldw (x),y 
      009B05 81               [ 4]  117     ret 
                                    118 
                                    119 ;   LOG2s ( -- 2040 11103 )
                                    120 ; log(2)/1.6384
                                    121 ; precision: 1.1e-8
      009B06 9A F1                  122         .word LINK 
                           001A88   123         LINK=.
      009B08 05                     124         .byte 5 
      009B09 4C 4F 47 32 53         125         .ascii "LOG2S" 
      009B0E                        126 LOG2S:
      009B0E 1D 00 04         [ 2]  127     subw x,#2*CELLL
      009B11 90 AE 07 F8      [ 2]  128     ldw y,#2040 
      009B15 EF 02            [ 2]  129     ldw (2,x),y 
      009B17 90 AE 2B 5F      [ 2]  130     ldw y,#11103 
      009B1B FF               [ 2]  131     ldw (x),y 
      009B1C 81               [ 4]  132     ret 
                                    133 
                                    134 ;   LN2 ( -- 485 11464 )
                                    135 ; ln(2)/16.384 
                                    136 ; precision: 1.0e-7 
      009B1D 9B 08                  137         .word LINK 
                           001A9F   138         LINK=.
      009B1F 04                     139         .byte 4 
      009B20 4C 4E 32 53            140         .ascii "LN2S" 
      009B24                        141 LN2S: 
      009B24 1D 00 04         [ 2]  142     subw x,#2*CELLL
      009B27 90 AE 01 E5      [ 2]  143     ldw y,#485
      009B2B EF 02            [ 2]  144     ldw (2,x),y 
      009B2D 90 AE 2C C8      [ 2]  145     ldw y,#11464 
      009B31 FF               [ 2]  146     ldw (x),y 
      009B32 81               [ 4]  147     ret 
                                    148 
                                    149 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



                                   4438 .endif ; WANT_MATH_CONST
                                   4439 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



                                   4440         .include "flash.asm"
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
      009B33 9B 1F                   30     .word LINK 
                           001AB5    31     LINK=.
      009B35 03                      32     .byte 3 
      009B36 46 50 21                33     .ascii "FP!"
      009B39                         34 fptr_store:
      009B39 90 93            [ 1]   35     ldw y,x
      009B3B 90 FE            [ 2]   36     ldw y,(y)
      009B3D 90 9F            [ 1]   37     ld a,yl 
      009B3F B7 32            [ 1]   38     ld FPTR,a 
      009B41 1C 00 02         [ 2]   39     addw x,#CELLL 
      009B44 90 93            [ 1]   40     ldw y,x 
      009B46 90 FE            [ 2]   41     ldw y,(y)
      009B48 90 BF 33         [ 2]   42     ldw PTR16,y
      009B4B 1C 00 02         [ 2]   43     addw x,#CELLL 
      009B4E 81               [ 4]   44     ret 
                                     45 
                                     46 ;-----------------------------------
                                     47 ; return EEPROM base address 
                                     48 ; as a double 
                                     49 ;  EEPROM  ( -- ud )
                                     50 ;-----------------------------------
      009B4F 9B 35                   51     .word LINK 
                           001AD1    52 LINK=.
      009B51 06                      53     .byte 6 
      009B52 45 45 50 52 4F 4D       54     .ascii "EEPROM"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



      009B58                         55 EEPROM: 
      009B58 90 AE 40 00      [ 2]   56     ldw y,#EEPROM_BASE
      009B5C 1D 00 04         [ 2]   57     subw x,#2*CELLL 
      009B5F EF 02            [ 2]   58     ldw (2,x),y 
      009B61 90 5F            [ 1]   59     clrw y 
      009B63 FF               [ 2]   60     ldw (x),y 
      009B64 81               [ 4]   61     ret
                                     62 
                                     63 ;---------------------------------
                                     64 ; return APP_LAST pointer as double
                                     65 ; EEP-LAST ( -- ud )
                                     66 ;---------------------------------
      009B65 9B 51                   67 	.word LINK 
                           001AE7    68 	LINK=.
      009B67 08                      69 	.byte 8 
      009B68 45 45 50 2D 4C 41 53    70 	.ascii "EEP-LAST"
             54
      009B70                         71 EEPLAST:
      009B70 1D 00 04         [ 2]   72 	subw x,#2*CELLL 
      009B73 90 AE 40 00      [ 2]   73 	ldw y,#APP_LAST 
      009B77 EF 02            [ 2]   74 	ldw (2,x),y 
      009B79 90 5F            [ 1]   75 	clrw y 
      009B7B FF               [ 2]   76 	ldw (x),y 
      009B7C 81               [ 4]   77 	ret 
                                     78 
                                     79 ;----------------------------------
                                     80 ; return APP_RUN pointer as double	
                                     81 ; EEP-RUN ( -- ud )
                                     82 ;-----------------------------------
      009B7D 9B 67                   83 	.word LINK 
                           001AFF    84 	LINK=.
      009B7F 07                      85 	.byte 7
      009B80 45 45 50 2D 52 55 4E    86 	.ascii "EEP-RUN"
      009B87                         87 EEPRUN:
      009B87 1D 00 04         [ 2]   88 	subw x,#2*CELLL 
      009B8A 90 AE 40 02      [ 2]   89 	ldw y,#APP_RUN 
      009B8E EF 02            [ 2]   90 	ldw (2,x),y 
      009B90 90 5F            [ 1]   91 	clrw y 
      009B92 FF               [ 2]   92 	ldw (x),y 
      009B93 81               [ 4]   93 	ret 
                                     94 
                                     95 ;------------------------------------
                                     96 ; return APP_CP pointer as double 
                                     97 ; EEP-CP ( -- ud )
                                     98 ;------------------------------------
      009B94 9B 7F                   99 	.word LINK
                           001B16   100 	LINK=.
      009B96 06                     101 	.byte 6 
      009B97 45 45 50 2D 43 50      102 	.ascii "EEP-CP"
      009B9D                        103 EEPCP:
      009B9D 1D 00 04         [ 2]  104 	subw x,#2*CELLL 
      009BA0 90 AE 40 04      [ 2]  105 	ldw y,#APP_CP  
      009BA4 EF 02            [ 2]  106 	ldw (2,x),y 
      009BA6 90 5F            [ 1]  107 	clrw y 
      009BA8 FF               [ 2]  108 	ldw (x),y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



      009BA9 81               [ 4]  109 	ret 
                                    110 
                                    111 ;------------------------------------
                                    112 ; return APP_VP pointer as double 
                                    113 ; EEP-VP ( -- ud )
                                    114 ;-------------------------------------
      009BAA 9B 96                  115 	.word LINK
                           001B2C   116 	LINK=.
      009BAC 06                     117 	.byte 6
      009BAD 45 45 50 2D 56 50      118 	.ascii "EEP-VP"
      009BB3                        119 EEPVP:
      009BB3 1D 00 04         [ 2]  120 	subw x,#2*CELLL 
      009BB6 90 AE 40 06      [ 2]  121 	ldw y,#APP_VP  
      009BBA EF 02            [ 2]  122 	ldw (2,x),y 
      009BBC 90 5F            [ 1]  123 	clrw y 
      009BBE FF               [ 2]  124 	ldw (x),y 
      009BBF 81               [ 4]  125 	ret 
                                    126 
                                    127 ;----------------------------------
                                    128 ; update APP_LAST with LAST 
                                    129 ; UPDAT-LAST ( -- )
                                    130 ;----------------------------------
      009BC0 9B AC                  131 	.word LINK 
                           001B42   132 	LINK=.
      009BC2 0A                     133 	.byte 10
      009BC3 55 50 44 41 54 2D 4C   134 	.ascii "UPDAT-LAST"
             41 53 54
      009BCD                        135 UPDATLAST:
      009BCD CD 86 CF         [ 4]  136 	call LAST
      009BD0 CD 84 BC         [ 4]  137 	call AT  
      009BD3 CD 9B 70         [ 4]  138 	call EEPLAST
      009BD6 CC 9D 49         [ 2]  139 	jp ee_store 
                                    140 
                                    141 ;---------------------------------
                                    142 ; update APP_RUN 
                                    143 ; UPDAT-RUN ( a -- )
                                    144 ;---------------------------------
      009BD9 9B C2                  145 	.word LINK
                           001B5B   146 	LINK=.
      009BDB 09                     147 	.byte 9
      009BDC 55 50 44 41 54 2D 52   148 	.ascii "UPDAT-RUN"
             55 4E
      009BE5                        149 UPDATRUN:
      009BE5 CD 9B 87         [ 4]  150 	call EEPRUN
      009BE8 CC 9D 49         [ 2]  151 	jp ee_store 
                                    152 	
                                    153 ;---------------------------------
                                    154 ; update APP_CP with CP 
                                    155 ; UPDAT-CP ( -- )
                                    156 ;---------------------------------
      009BEB 9B DB                  157 	.word LINK 
                           001B6D   158 	LINK=.
      009BED 08                     159 	.byte 8 
      009BEE 55 50 44 41 54 2D 43   160 	.ascii "UPDAT-CP"
             50
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      009BF6                        161 UPDATCP:
      009BF6 CD 86 BF         [ 4]  162 	call CPP 
      009BF9 CD 84 BC         [ 4]  163 	call AT 
      009BFC CD 9B 9D         [ 4]  164 	call EEPCP 
      009BFF CC 9D 49         [ 2]  165 	jp ee_store 
                                    166 
                                    167 ;----------------------------------
                                    168 ; update APP_VP with VP 
                                    169 ; UPDAT-VP ( -- )
                                    170 ;----------------------------------
      009C02 9B ED                  171 	.word LINK
                           001B84   172 	LINK=.
      009C04 08                     173 	.byte 8 
      009C05 55 50 44 41 54 2D 56   174 	.ascii "UPDAT-VP" 
             50
      009C0D                        175 UPDATVP:
      009C0D CD 86 B1         [ 4]  176 	call VPP 
      009C10 CD 84 BC         [ 4]  177 	call AT
      009C13 CD 9B B3         [ 4]  178 	call EEPVP 
      009C16 CC 9D 49         [ 2]  179 	jp ee_store
                                    180 	
                                    181 
                                    182 ;----------------------------------
                                    183 ; fetch integer at address over 65535
                                    184 ;  F@   ( ud -- n )
                                    185 ;----------------------------------
      009C19 9C 04                  186     .word LINK 
                           001B9B   187 LINK=.
      009C1B 02                     188     .byte 2
      009C1C 46 40                  189     .ascii "F@"
      009C1E                        190 farat:
      009C1E CD 9B 39         [ 4]  191     call fptr_store
      009C21 92 BC 00 32      [ 5]  192     ldf a,[FPTR]
      009C25 1D 00 02         [ 2]  193     subw x,#CELLL 
      009C28 F7               [ 1]  194     ld (x),a 
      009C29 90 AE 00 01      [ 2]  195     ldw y,#1
      009C2D 91 AF 00 32      [ 1]  196     ldf a,([FPTR],y)
      009C31 E7 01            [ 1]  197     ld (1,x),a
      009C33 81               [ 4]  198     ret 
                                    199 
                                    200 ;-------------------------------------
                                    201 ; fetch C at address over 65535 
                                    202 ; FC@ ( ud -- c)
                                    203 ;-------------------------------------
      009C34 9C 1B                  204     .word LINK
                           001BB6   205     LINK=.
      009C36 03                     206     .byte 3 
      009C37 46 43 40               207     .ascii "FC@" 
      009C3A                        208 farcat:
      009C3A CD 9B 39         [ 4]  209     call fptr_store 
      009C3D 92 BC 00 32      [ 5]  210     ldf a,[FPTR]
      009C41 1D 00 02         [ 2]  211     subw x,#CELLL 
      009C44 E7 01            [ 1]  212     ld (1,x),a 
      009C46 7F               [ 1]  213     clr (x)
      009C47 81               [ 4]  214     ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



                                    215     
                                    216 ;----------------------------------
                                    217 ; unlock EEPROM/OPT for writing/erasing
                                    218 ; wait endlessly for FLASH_IAPSR_DUL bit.
                                    219 ;  UNLKEE   ( -- )
                                    220 ;----------------------------------
      009C48 9C 36                  221     .word LINK 
                           001BCA   222 LINK=.
      009C4A 06                     223     .byte 6 
      009C4B 55 4E 4C 4B 45 45      224     .ascii "UNLKEE"
      009C51                        225 unlock_eeprom:
      009C51 35 00 50 5B      [ 1]  226 	mov FLASH_CR2,#0 
      009C55 35 FF 50 5C      [ 1]  227 	mov FLASH_NCR2,#0xFF 
      009C59 35 AE 50 64      [ 1]  228 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      009C5D 35 56 50 64      [ 1]  229     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      009C61 72 07 50 5F FB   [ 2]  230 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      009C66 81               [ 4]  231 	ret
                                    232 
                                    233 ;----------------------------------
                                    234 ; unlock FLASH for writing/erasing
                                    235 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                    236 ; UNLKFL  ( -- )
                                    237 ;----------------------------------
      009C67 9C 4A                  238     .word LINK 
                           001BE9   239 LINK=. 
      009C69 06                     240     .byte 6 
      009C6A 55 4E 4C 4B 46 4C      241     .ascii "UNLKFL"    
      009C70                        242 unlock_flash:
      009C70 35 00 50 5B      [ 1]  243 	mov FLASH_CR2,#0 
      009C74 35 FF 50 5C      [ 1]  244 	mov FLASH_NCR2,#0xFF 
      009C78 35 56 50 62      [ 1]  245 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      009C7C 35 AE 50 62      [ 1]  246 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      009C80 72 03 50 5F FB   [ 2]  247 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      009C85 81               [ 4]  248 	ret
                                    249 
                                    250 ;-----------------------------
                                    251 ; unlock FLASH or EEPROM 
                                    252 ; according to FPTR address 
                                    253 ;  UNLOCK ( -- )
                                    254 ;-----------------------------
      009C86 9C 69                  255 	.word LINK 
                           001C08   256 	LINK=.
      009C88 06                     257 	.byte 6
      009C89 55 4E 4C 4F 43 4B      258 	.ascii "UNLOCK"
      009C8F                        259 unlock:
                                    260 ; put addr[15:0] in Y, for bounds check.
      009C8F 90 BE 33         [ 2]  261 	ldw y,PTR16   ; Y=addr15:0
                                    262 ; check addr[23:16], if <> 0 then it is extened flash memory
      009C92 3D 32            [ 1]  263 	tnz FPTR 
      009C94 26 16            [ 1]  264 	jrne 4$
      009C96 90 A3 80 00      [ 2]  265     cpw y,#FLASH_BASE
      009C9A 24 10            [ 1]  266     jruge 4$
      009C9C 90 A3 40 00      [ 2]  267 	cpw y,#EEPROM_BASE  
      009CA0 25 0D            [ 1]  268     jrult 9$
      009CA2 90 A3 48 7F      [ 2]  269 	cpw y,#OPTION_END 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



      009CA6 22 07            [ 1]  270 	jrugt 9$
      009CA8 CD 9C 51         [ 4]  271 	call unlock_eeprom
      009CAB 81               [ 4]  272 	ret 
      009CAC CD 9C 70         [ 4]  273 4$: call unlock_flash
      009CAF 81               [ 4]  274 9$: ret 
                                    275 
                                    276 ;-------------------------
                                    277 ; lock write access to 
                                    278 ; FLASH and EEPROM 
                                    279 ; LOCK ( -- )
                                    280 ;-------------------------
      009CB0 9C 88                  281 	.word LINK 
                           001C32   282 	LINK=.
      009CB2 04                     283 	.byte 4 
      009CB3 4C 4F 43 4B            284 	.ascii "LOCK" 
      009CB7                        285 lock: 
      009CB7 72 13 50 5F      [ 1]  286 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      009CBB 72 17 50 5F      [ 1]  287 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009CBF 81               [ 4]  288 	ret 
                                    289 
                                    290 ;-------------------------
                                    291 ; increment FPTR 
                                    292 ; INC-FPTR ( -- )
                                    293 ;-------------------------
      009CC0 9C B2                  294 	.word LINK 
                           001C42   295 	LINK=. 
      009CC2 08                     296 	.byte 8 
      009CC3 49 4E 43 2D 46 50 54   297 	.ascii "INC-FPTR" 
             52
      009CCB                        298 inc_fptr:
      009CCB 3C 34            [ 1]  299 	inc PTR8 
      009CCD 26 08            [ 1]  300 	jrne 1$
      009CCF 90 BE 32         [ 2]  301 	ldw y,FPTR 
      009CD2 90 5C            [ 2]  302 	incw y 
      009CD4 90 BF 32         [ 2]  303 	ldw FPTR,y 
      009CD7 81               [ 4]  304 1$: ret 
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
      009CD8 9C C2                  315 	.word LINK 
                           001C5A   316 	LINK=. 
      009CDA 07                     317 	.byte 7 
      009CDB 57 52 2D 42 59 54 45   318 	.ascii "WR-BYTE" 
                                    319 
      009CE2                        320 write_byte:
      009CE2 90 93            [ 1]  321 	ldw y,x 
      009CE4 90 FE            [ 2]  322 	ldw y,(y)
      009CE6 1C 00 02         [ 2]  323 	addw x,#CELLL 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      009CE9 90 9F            [ 1]  324 	ld a,yl
      009CEB 92 BD 00 32      [ 4]  325 	ldf [FPTR],a
      009CEF 72 05 50 5F FB   [ 2]  326 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009CF4 20 D5            [ 2]  327 	jra inc_fptr 
                                    328 
                                    329 
                                    330 
                                    331 ;---------------------------------------
                                    332 ; write a byte to FLASH or EEPROM/OPTION  
                                    333 ; EEC!  (c ud -- )
                                    334 ;---------------------------------------
      009CF6 9C DA                  335     .word LINK 
                           001C78   336 	LINK=.
      009CF8 04                     337     .byte 4 
      009CF9 45 45 43 21            338     .ascii "EEC!"
                                    339 	; local variables 
                           000001   340 	BTW = 1   ; byte to write offset on stack
                           000002   341     OPT = 2 
                           000002   342 	VSIZE = 2
      009CFD                        343 ee_cstore:
      009CFD 52 02            [ 2]  344 	sub sp,#VSIZE
      009CFF CD 9B 39         [ 4]  345     call fptr_store
      009D02 E6 01            [ 1]  346 	ld a,(1,x)
      009D04 43               [ 1]  347 	cpl a 
      009D05 6B 01            [ 1]  348 	ld (BTW,sp),a ; byte to write 
      009D07 0F 02            [ 1]  349 	clr (OPT,sp)  ; OPTION flag
      009D09 CD 9C 8F         [ 4]  350 	call unlock 
                                    351 	; check if option
      009D0C 3D 32            [ 1]  352 	tnz FPTR 
      009D0E 26 19            [ 1]  353 	jrne 2$
      009D10 90 BE 33         [ 2]  354 	ldw y,PTR16 
      009D13 90 A3 48 00      [ 2]  355 	cpw y,#OPTION_BASE
      009D17 2B 10            [ 1]  356 	jrmi 2$
      009D19 90 A3 48 80      [ 2]  357 	cpw y,#OPTION_END+1
      009D1D 2A 0A            [ 1]  358 	jrpl 2$
      009D1F 03 02            [ 1]  359 	cpl (OPT,sp)
                                    360 	; OPTION WRITE require this unlock 
      009D21 72 1E 50 5B      [ 1]  361     bset FLASH_CR2,#FLASH_CR2_OPT
      009D25 72 1F 50 5C      [ 1]  362     bres FLASH_NCR2,#FLASH_CR2_OPT 
      009D29                        363 2$: 
      009D29 CD 9C E2         [ 4]  364 	call write_byte 	
      009D2C 0D 02            [ 1]  365 	tnz (OPT,sp)
      009D2E 27 0D            [ 1]  366 	jreq 3$ 
      009D30 7B 01            [ 1]  367     ld a,(BTW,sp)
      009D32 90 5F            [ 1]  368     clrw y
      009D34 90 97            [ 1]  369 	ld yl,a 
      009D36 1D 00 02         [ 2]  370 	subw x,#CELLL 
      009D39 FF               [ 2]  371 	ldw (x),y 
      009D3A CD 9C E2         [ 4]  372 	call write_byte
      009D3D                        373 3$: 
      009D3D CD 9C B7         [ 4]  374 	call lock 
      009D40 5B 02            [ 2]  375 	addw sp,#VSIZE 
      009D42 81               [ 4]  376     ret
                                    377 
                                    378 ;------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



                                    379 ; write integer in FLASH|EEPROM
                                    380 ; EE! ( n ud -- )
                                    381 ;------------------------------
      009D43 9C F8                  382 	.word LINK 
                           001CC5   383 	LINK=.
      009D45 03                     384 	.byte 3 
      009D46 45 45 21               385 	.ascii "EE!"
      009D49                        386 ee_store:
      009D49 CD 9B 39         [ 4]  387 	call fptr_store 
      009D4C CD 9C 8F         [ 4]  388 	call unlock 
      009D4F 90 93            [ 1]  389 	ldw y,x 
      009D51 90 FE            [ 2]  390 	ldw y,(y)
      009D53 90 89            [ 2]  391 	pushw y 
      009D55 90 5E            [ 1]  392 	swapw y 
      009D57 FF               [ 2]  393 	ldw (x),y 
      009D58 CD 9C E2         [ 4]  394 	call write_byte 
      009D5B 90 85            [ 2]  395 	popw y 
      009D5D 1D 00 02         [ 2]  396 	subw x,#CELLL
      009D60 FF               [ 2]  397 	ldw (x),y 
      009D61 CD 9C E2         [ 4]  398 	call write_byte
      009D64 CC 9C B7         [ 2]  399 	jp lock 
                                    400 
                                    401 
                                    402 ;----------------------------
                                    403 ; Erase flash memory row 
                                    404 ; stm8s208 as 128 bytes rows
                                    405 ; ROW-ERASE ( ud -- )
                                    406 ;----------------------------
      009D67 9D 45                  407 	.word LINK 
                           001CE9   408 	LINK=. 
      009D69 09                     409 	.byte 9 
      009D6A 52 4F 57 2D 45 52 41   410 	.ascii "ROW-ERASE" 
             53 45
      009D73                        411 row_erase:
      009D73 CD 9B 39         [ 4]  412 	call fptr_store
                                    413 ;code must be execute from RAM 
                                    414 ;copy routine to PAD 
      009D76 1D 00 02         [ 2]  415 	subw x,#CELLL 
      009D79 90 AE 9D C0      [ 2]  416 	ldw y,#row_erase_proc
      009D7D FF               [ 2]  417 	ldw (x),y 
      009D7E CD 8B C3         [ 4]  418 	call PAD 
      009D81 90 AE 9D E7      [ 2]  419 	ldw y,#row_erase_proc_end 
      009D85 72 A2 9D C0      [ 2]  420 	subw y,#row_erase_proc
      009D89 1D 00 02         [ 2]  421 	subw x,#CELLL 
      009D8C FF               [ 2]  422 	ldw (x),y 
      009D8D CD 8B FF         [ 4]  423 	call CMOVE 
      009D90                        424 block_erase:
      009D90 90 BE 33         [ 2]  425 	ldw y,FPTR+1
      009D93 90 A3 A2 00      [ 2]  426 	cpw y,#app_space 
      009D97 2A 13            [ 1]  427 	jrpl erase_flash 
                                    428 ; erase EEPROM block
      009D99 90 A3 40 00      [ 2]  429 	cpw y,#EEPROM_BASE 
      009D9D 24 01            [ 1]  430 	jruge 1$
      009D9F 81               [ 4]  431 	ret ; bad address 
      009DA0 90 A3 47 FF      [ 2]  432 1$: cpw y,#EEPROM_END 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



      009DA4 23 01            [ 2]  433 	jrule 2$ 
      009DA6 81               [ 4]  434 	ret ; bad address 
      009DA7                        435 2$:	
      009DA7 CD 9C 51         [ 4]  436 	call unlock_eeprom 
      009DAA 20 03            [ 2]  437 	jra proceed_erase
                                    438 ; erase flash block:
      009DAC                        439 erase_flash:
      009DAC CD 9C 70         [ 4]  440 	call unlock_flash 
      009DAF                        441 proceed_erase:
      009DAF CD 8B C3         [ 4]  442 	call PAD 
      009DB2 90 93            [ 1]  443 	ldw y,x
      009DB4 90 FE            [ 2]  444 	ldw y,(y)
      009DB6 1C 00 02         [ 2]  445 	addw x,#CELLL  
      009DB9 90 FD            [ 4]  446 	call (y) 
      009DBB 72 17 50 5F      [ 1]  447 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009DBF 81               [ 4]  448 	ret 
                                    449 
                                    450 ; this routine is to be copied to PAD 
      009DC0                        451 row_erase_proc:
      009DC0 35 20 50 5B      [ 1]  452 	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
      009DC4 35 DF 50 5C      [ 1]  453 	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
      009DC8 4F               [ 1]  454 	clr a 
      009DC9 90 5F            [ 1]  455 	clrw y 
      009DCB 91 A7 00 32      [ 1]  456 	ldf ([FPTR],y),a
      009DCF 90 5C            [ 2]  457     incw y
      009DD1 91 A7 00 32      [ 1]  458 	ldf ([FPTR],y),a
      009DD5 90 5C            [ 2]  459     incw y
      009DD7 91 A7 00 32      [ 1]  460 	ldf ([FPTR],y),a
      009DDB 90 5C            [ 2]  461     incw y
      009DDD 91 A7 00 32      [ 1]  462 	ldf ([FPTR],y),a
      009DE1 72 05 50 5F FB   [ 2]  463 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009DE6 81               [ 4]  464 	ret
      009DE7                        465 row_erase_proc_end:
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
      009DE7                        478 copy_buffer:
      009DE7 4B 80            [ 1]  479 	push #BLOCK_SIZE  
                                    480 ;enable block programming 
      009DE9 72 10 50 5B      [ 1]  481 	bset FLASH_CR2,#FLASH_CR2_PRG 
      009DED 72 11 50 5C      [ 1]  482 	bres FLASH_NCR2,#FLASH_CR2_PRG
      009DF1 90 5F            [ 1]  483 	clrw y
      009DF3 F6               [ 1]  484 1$:	ld a,(x)
      009DF4 91 A7 00 32      [ 1]  485 	ldf ([FPTR],y),a
      009DF8 5C               [ 2]  486 	incw x 
      009DF9 90 5C            [ 2]  487 	incw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



      009DFB 0A 01            [ 1]  488 	dec (BCNT,sp)
      009DFD 26 F4            [ 1]  489 	jrne 1$
                                    490 ; wait EOP bit 
      009DFF 72 05 50 5F FB   [ 2]  491 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. 
      009E04 84               [ 1]  492 	pop a ; remove BCNT from stack 
      009E05 81               [ 4]  493 	ret 
      009E06                        494 copy_buffer_end:
                                    495 
                                    496 ;-------------------------
                                    497 ; move program_row to RAM 
                                    498 ; in TIB 
                                    499 ;------------------------
      009E06                        500 copy_prog_to_ram:
      009E06 1D 00 06         [ 2]  501 	subw x,#6
      009E09 90 AE 9D E7      [ 2]  502 	ldw y,#copy_buffer 
      009E0D EF 04            [ 2]  503 	ldw (4,x),y 
      009E0F 90 AE 17 00      [ 2]  504 	ldw y,#TIBBASE
      009E13 EF 02            [ 2]  505 	ldw (2,x),y 
      009E15 90 AE 9E 06      [ 2]  506 	ldw y,#copy_buffer_end 
      009E19 72 A2 9D E7      [ 2]  507 	subw y,#copy_buffer  
      009E1D FF               [ 2]  508 	ldw (x),y 
      009E1E CD 8B FF         [ 4]  509 	call CMOVE 
      009E21 81               [ 4]  510 	ret 
                                    511 
                                    512 
                                    513 ;-----------------------------
                                    514 ; write a row in FLASH/EEPROM 
                                    515 ; WR-ROW ( a ud -- )
                                    516 ; a -> address 128 byte buffer to write 
                                    517 ; ud ->  row address in FLASH|EEPROM 
                                    518 ;-----------------------------
      009E22 9D 69                  519 	.word LINK 
                           001DA4   520 	LINK=.
      009E24 06                     521 	.byte 6 
      009E25 57 52 2D 52 4F 57      522 	.ascii "WR-ROW"
      009E2B                        523 write_row:
      009E2B CD 9B 39         [ 4]  524 	call fptr_store
                                    525 ; align to FLASH block 
      009E2E A6 80            [ 1]  526 	ld a,#0x80 
      009E30 B4 34            [ 1]  527 	and a,PTR8 
      009E32 B7 34            [ 1]  528 	ld PTR8,a  
      009E34 CD 9E 06         [ 4]  529 	call copy_prog_to_ram
      009E37 CD 9C 8F         [ 4]  530 	call unlock
      009E3A 90 93            [ 1]  531 	ldw y,x 
      009E3C 90 FE            [ 2]  532 	ldw y,(y)
      009E3E 1C 00 02         [ 2]  533 	addw x,#CELLL 
      009E41 89               [ 2]  534 	pushw x 
      009E42 93               [ 1]  535 	ldw x,y ; buffer address in x 
      009E43 CD 17 00         [ 4]  536 	call TIBBASE
      009E46 CD 9C B7         [ 4]  537 	call lock
      009E49 85               [ 2]  538 	popw x 
      009E4A 81               [ 4]  539 	ret 
                                    540 
                                    541 ;-------------------------------------
                                    542 ; change value of OPTION register 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



                                    543 ; SET-OPT (c n -- ) 
                                    544 ; c new value.
                                    545 ; n OPT  number {1..7}
                                    546 ;--------------------------------------
      009E4B 9E 24                  547 		.word LINK 
                           001DCD   548 		LINK=.
      009E4D 07                     549 		.byte 7 
      009E4E 53 45 54 2D 4F 50 54   550 		.ascii "SET-OPT" 
      009E55                        551 set_option: 
      009E55 90 93            [ 1]  552 		ldw y,x 
      009E57 90 FE            [ 2]  553 		ldw y,(y)
      009E59 27 06            [ 1]  554 		jreq 1$
      009E5B 90 A3 00 07      [ 2]  555 		cpw y,#7 
      009E5F 23 04            [ 2]  556 		jrule 2$ 
                                    557 ; invalid OPTION number 		
      009E61 1C 00 04         [ 2]  558 1$:		addw x,#2*CELLL
      009E64 81               [ 4]  559 		ret
      009E65 90 58            [ 2]  560 2$:		sllw y 
      009E67 72 A9 47 FF      [ 2]  561 		addw y,#OPTION_BASE-1
      009E6B FF               [ 2]  562 		ldw (x),y 
      009E6C 1D 00 02         [ 2]  563 		subw x,#CELLL 
      009E6F 90 5F            [ 1]  564 		clrw y 
      009E71 FF               [ 2]  565 		ldw (x),y 
      009E72 CD 9C FD         [ 4]  566 		call ee_cstore
      009E75 81               [ 4]  567 		ret 
                                    568 
                                    569 
                                    570 
                                    571 ;--------------------------------------
                                    572 ; reset system to its original state 
                                    573 ; before any user modification
                                    574 ; PRISTINE ( -- )
                                    575 ;-------------------------------------
      009E76 9E 4D                  576 	.word LINK  
                           001DF8   577 	LINK=.
      009E78 08                     578 	.byte 8 
      009E79 50 52 49 53 54 49 4E   579 	.ascii "PRISTINE"
             45
      009E81                        580 pristine:
                                    581 ;;; erase EEPROM
      009E81 CD 9B 58         [ 4]  582 	call EEPROM 
      009E84 CD 87 49         [ 4]  583 1$:	call DDUP 
      009E87 CD 9D 73         [ 4]  584 	call row_erase
      009E8A 90 93            [ 1]  585 	ldw y,x 
      009E8C 90 EE 02         [ 2]  586 	ldw y,(2,y)
      009E8F 72 A9 00 80      [ 2]  587 	addw y,#BLOCK_SIZE
      009E93 EF 02            [ 2]  588 	ldw (2,x),y
      009E95 90 A3 48 00      [ 2]  589 	cpw y,#OPTION_BASE 
      009E99 25 E9            [ 1]  590 	jrult 1$
                                    591 ;;; reset OPTION to default values
      009E9B 90 AE 00 01      [ 2]  592 	ldw y,#1 ; OPT1 
      009E9F FF               [ 2]  593 2$:	ldw (x),y   
      009EA0 90 5F            [ 1]  594 	clrw y 
      009EA2 EF 02            [ 2]  595 	ldw (2,x),y  ; ( 0 1 -- ) 
      009EA4 CD 87 49         [ 4]  596 	call DDUP    ; ( 0 1 0 1 -- )  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



      009EA7 CD 9E 55         [ 4]  597 	call set_option
      009EAA 90 93            [ 1]  598 	ldw y,x 
      009EAC 90 FE            [ 2]  599 	ldw y,(y)
      009EAE 90 5C            [ 2]  600 	incw y  ; next OPTION 
      009EB0 90 A3 00 08      [ 2]  601 	cpw y,#8 
      009EB4 25 E9            [ 1]  602 	jrult 2$
                                    603 ;;; erase first row of app_space 	
      009EB6 90 AE A2 00      [ 2]  604 	ldw y,#app_space
      009EBA EF 02            [ 2]  605 	ldw (2,x),y  
      009EBC 90 5F            [ 1]  606 	clrw y 
      009EBE FF               [ 2]  607 	ldw (x),y ; ( app_space 0 -- )
      009EBF CD 9D 73         [ 4]  608 	call row_erase 
                                    609 ; reset interrupt vectors 
      009EC2 1D 00 02         [ 2]  610 	subw x,#CELLL 
      009EC5 90 5F            [ 1]  611 	clrw y  
      009EC7 FF               [ 2]  612 4$:	ldw (x),y  ; ( n -- ) int# 
      009EC8 CD 85 63         [ 4]  613 	call DUPP  
      009ECB CD 9E E8         [ 4]  614 	call reset_vector
      009ECE 90 93            [ 1]  615 	ldw y,x 
      009ED0 90 FE            [ 2]  616 	ldw y,(y)
      009ED2 90 5C            [ 2]  617 	incw y   ; next vector 
      009ED4 90 A3 00 19      [ 2]  618 	cpw y,#25 
      009ED8 25 ED            [ 1]  619 	jrult 4$
      009EDA CC 80 80         [ 2]  620 	jp NonHandledInterrupt ; reset MCU
                                    621 
                                    622 ;------------------------------
                                    623 ; reset an interrupt vector 
                                    624 ; to its initial value 
                                    625 ; i.e. NonHandledInterrupt
                                    626 ; RST-IVEC ( n -- )
                                    627 ;-----------------------------
      009EDD 9E 78                  628 	.word LINK 
                           001E5F   629 	LINK=. 
      009EDF 08                     630 	.byte 8 
      009EE0 52 53 54 2D 49 56 45   631 	.ascii "RST-IVEC"
             43
      009EE8                        632 reset_vector:
      009EE8 90 93            [ 1]  633 	ldw y,x
      009EEA 1C 00 02         [ 2]  634 	addw x,#CELLL 
      009EED 90 FE            [ 2]  635 	ldw y,(y)
      009EEF 90 A3 00 17      [ 2]  636 	cpw y,#23 
      009EF3 27 3A            [ 1]  637 	jreq 9$
      009EF5 90 A3 00 1D      [ 2]  638 	cpw y,#29 ; last vector
      009EF9 22 34            [ 1]  639 	jrugt 9$  
      009EFB 90 58            [ 2]  640 	sllw y 
      009EFD 90 58            [ 2]  641 	sllw y 
      009EFF 72 A9 80 08      [ 2]  642 	addw y,#0x8008 ; irq0 address 
      009F03 90 BF 24         [ 2]  643 	ldw YTEMP,y
      009F06 1D 00 06         [ 2]  644 	subw x,#3*CELLL 
      009F09 EF 02            [ 2]  645 	ldw (2,x),y 
      009F0B 90 5F            [ 1]  646 	clrw y
      009F0D FF               [ 2]  647 	ldw (x),y 
      009F0E A6 82            [ 1]  648 	ld a,#0x82 
      009F10 90 95            [ 1]  649 	ld yh,a
      009F12 EF 04            [ 2]  650 	ldw (4,x),y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



      009F14 CD 9D 49         [ 4]  651 	call ee_store
      009F17 1D 00 06         [ 2]  652 	subw x,#3*CELLL
      009F1A 90 5F            [ 1]  653 	clrw y 
      009F1C FF               [ 2]  654 	ldw (x),y 
      009F1D 90 AE 80 80      [ 2]  655 	ldw y,#NonHandledInterrupt
      009F21 EF 04            [ 2]  656 	ldw (4,x),y 
      009F23 90 BE 24         [ 2]  657 	ldw y,YTEMP  
      009F26 72 A9 00 02      [ 2]  658 	addw y,#2
      009F2A EF 02            [ 2]  659 	ldw (2,x),y 
      009F2C CD 9D 49         [ 4]  660 	call ee_store
      009F2F 81               [ 4]  661 9$:	ret 
                                    662 
                                    663 
                                    664 ;------------------------------
                                    665 ; all interrupt vector with 
                                    666 ; an address >= a are resetted 
                                    667 ; to default
                                    668 ; CHKIVEC ( a -- )
                                    669 ;------------------------------
      009F30 9E DF                  670 	.word LINK 
                           001EB2   671 	LINK=.
      009F32 07                     672 	.byte 7
      009F33 43 48 4B 49 56 45 43   673 	.ascii "CHKIVEC"
                                    674 ;local variables 
                           000001   675 	SSP=1
                           000003   676 	CADR=3
                           000005   677 	OFS=5
                           000006   678 	VSIZE=6  
      009F3A                        679 CHKIVEC:
      009F3A 52 06            [ 2]  680 	sub sp,#VSIZE ;alloc local variables 
      009F3C 90 93            [ 1]  681 	ldw y,x 
      009F3E 90 FE            [ 2]  682 	ldw y,(y)
      009F40 17 03            [ 2]  683 	ldw (CADR,sp),y ; ca 
      009F42 1F 01            [ 2]  684 	ldw (SSP,sp),x 
      009F44 AE 80 0A         [ 2]  685 	ldw x,#0x800a ; irq0 address 
      009F47 BF 33            [ 2]  686 	ldw PTR16,X
      009F49 AE FF FC         [ 2]  687 	ldw x,#-4 
      009F4C 1C 00 04         [ 2]  688 1$:	addw x,#4
      009F4F A3 00 78         [ 2]  689 	cpw x,#30*4 ; irq0-29 
      009F52 27 22            [ 1]  690 	jreq 9$
      009F54 90 93            [ 1]  691 	ldw y,x  
      009F56 91 D6 33         [ 4]  692 	ld a,([PTR16],y)
      009F59 11 03            [ 1]  693 	cp a,(CADR,sp)
      009F5B 25 EF            [ 1]  694 	jrult 1$
      009F5D 90 5C            [ 2]  695 	incw y 
      009F5F 91 D6 33         [ 4]  696 	ld a,([PTR16],y)
      009F62 11 04            [ 1]  697 	cp a,(CADR+1,sp) 
      009F64 25 E6            [ 1]  698 	jrult 1$ 
      009F66 1F 05            [ 2]  699 	ldw (OFS,sp),x 
      009F68 54               [ 2]  700 	srlw x
      009F69 54               [ 2]  701 	srlw x 
      009F6A 90 93            [ 1]  702 	ldw y,x 
      009F6C 1E 01            [ 2]  703 	ldw x,(SSP,sp)
      009F6E FF               [ 2]  704 	ldw (x),y
      009F6F CD 9E E8         [ 4]  705 	call reset_vector
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



      009F72 1E 05            [ 2]  706 	ldw x,(OFS,sp) 
      009F74 20 D6            [ 2]  707 	jra 1$
      009F76 1E 01            [ 2]  708 9$:	ldw x,(SSP,sp) 
      009F78 1C 00 02         [ 2]  709 	addw x,#CELLL 
      009F7B 5B 06            [ 2]  710 	addw sp,#VSIZE ; drop local variables  
      009F7D 81               [ 4]  711 	ret 
                                    712 
                                    713 ;------------------------------
                                    714 ; set interrupt vector 
                                    715 ; SET-IVEC ( ud n -- )
                                    716 ;  ud Handler address
                                    717 ;  n  vector # 0 .. 29 
                                    718 ;-----------------------------
      009F7E 9F 32                  719 	.word LINK
                           001F00   720 	LINK=.
      009F80 08                     721 	.byte 8 
      009F81 53 45 54 2D 49 56 45   722 	.ascii "SET-IVEC" 
             43
      009F89                        723 set_vector:
      009F89 90 93            [ 1]  724     ldw y,x 
      009F8B 1C 00 02         [ 2]  725 	addw x,#CELLL 
      009F8E 90 FE            [ 2]  726 	ldw y,(y) ; vector #
      009F90 90 A3 00 1D      [ 2]  727 	cpw y,#29 ; last vector
      009F94 23 04            [ 2]  728 	jrule 2$
      009F96 1C 00 04         [ 2]  729 	addw x,#2*CELLL 
      009F99 81               [ 4]  730 	ret
      009F9A 90 58            [ 2]  731 2$:	sllw y 
      009F9C 90 58            [ 2]  732 	sllw y 
      009F9E 72 A9 80 08      [ 2]  733 	addw y,#0X8008 ; IRQ0 vector address 
      009FA2 90 BF 24         [ 2]  734 	ldw YTEMP,y ; vector address 
      009FA5 A6 82            [ 1]  735 	ld a,#0x82 
      009FA7 90 95            [ 1]  736 	ld yh,a 
      009FA9 E6 01            [ 1]  737 	ld a,(1,x) ; isr address bits 23..16 
      009FAB 90 97            [ 1]  738 	ld yl,a 
                                    739 ;  write 0x82 + most significant byte of int address	
      009FAD 1D 00 06         [ 2]  740 	subw x,#3*CELLL 
      009FB0 EF 04            [ 2]  741 	ldw (4,x),y 
      009FB2 90 BE 24         [ 2]  742 	ldw y,YTEMP
      009FB5 EF 02            [ 2]  743 	ldw (2,x),y ; vector address 
      009FB7 90 5F            [ 1]  744 	clrw y 
      009FB9 FF               [ 2]  745 	ldw (x),y   ; as a double 
      009FBA CD 9D 49         [ 4]  746 	call ee_store 
      009FBD 90 93            [ 1]  747 	ldw y,x 
      009FBF 90 EE 02         [ 2]  748 	ldw y,(2,y) ; bits 15..0 int vector 
      009FC2 1D 00 06         [ 2]  749 	subw x,#3*CELLL 
      009FC5 EF 04            [ 2]  750 	ldw (4,x),y 
      009FC7 90 BE 24         [ 2]  751 	ldw y,YTEMP 
      009FCA 72 A9 00 02      [ 2]  752 	addw y,#2 
      009FCE EF 02            [ 2]  753 	ldw (2,x),y 
      009FD0 90 5F            [ 1]  754 	clrw y 
      009FD2 FF               [ 2]  755 	ldw (x),y 
      009FD3 CD 9D 49         [ 4]  756 	call ee_store
      009FD6 1C 00 04         [ 2]  757 	addw x,#2*CELLL  
      009FD9 81               [ 4]  758 9$: ret 
                                    759 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



                                    760 
                                    761 ;------------------------
                                    762 ; Compile word to flash
                                    763 ; EE, (w -- )
                                    764 ;-----------------------
      009FDA 9F 80                  765 	.word LINK
                           001F5C   766 	LINK=.
      009FDC 03                     767 	.byte 3
      009FDD 45 45 2C               768 	.ascii "EE,"
      009FE0                        769 ee_comma:
      009FE0 1D 00 04         [ 2]  770 	subw x,#2*CELLL 
      009FE3 90 BE 18         [ 2]  771 	ldw y,UCP
      009FE6 90 89            [ 2]  772 	pushw y 
      009FE8 EF 02            [ 2]  773 	ldw (2,x),y 
      009FEA 90 5F            [ 1]  774 	clrw y 
      009FEC FF               [ 2]  775 	ldw (x),y
      009FED CD 9D 49         [ 4]  776 	call ee_store
      009FF0 90 85            [ 2]  777 	popw y 
      009FF2 72 A9 00 02      [ 2]  778 	addw y,#2
      009FF6 90 BF 18         [ 2]  779 	ldw UCP,y
      009FF9 81               [ 4]  780 	ret 
                                    781 
                                    782 
                                    783 ;-------------------------
                                    784 ; Compile byte to flash 
                                    785 ; EEC, ( c -- )	
                                    786 ;-------------------------
      009FFA 9F DC                  787 	.word LINK 
                           001F7C   788 	LINK=.
      009FFC 04                     789 	.byte 4 
      009FFD 45 45 43 2C            790 	.ascii "EEC,"
      00A001                        791 ee_ccomma:
      00A001 1D 00 04         [ 2]  792 	subw x,#2*CELLL 
      00A004 90 BE 18         [ 2]  793 	ldw y,UCP
      00A007 90 89            [ 2]  794 	pushw y 
      00A009 EF 02            [ 2]  795 	ldw (2,x),y 
      00A00B 90 5F            [ 1]  796 	clrw y 
      00A00D FF               [ 2]  797 	ldw (x),y
      00A00E CD 9C FD         [ 4]  798 	call ee_cstore
      00A011 90 85            [ 2]  799 	popw y 
      00A013 90 5C            [ 2]  800 	incw y 
      00A015 90 BF 18         [ 2]  801 	ldw UCP,y
      00A018 81               [ 4]  802 	ret 
                                    803 
                                    804 
                                    805 ;--------------------------
                                    806 ; copy FLASH block to ROWBUF
                                    807 ; ROW2BUF ( ud -- )
                                    808 ;--------------------------
      00A019 9F FC                  809 	.word LINK 
                           001F9B   810 	LINK=.
      00A01B 07                     811 	.byte 7 
      00A01C 52 4F 57 32 42 55 46   812 	.ascii "ROW2BUF"
      00A023                        813 ROW2BUF: 
      00A023 CD 9B 39         [ 4]  814 	call fptr_store 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



      00A026 A6 80            [ 1]  815 	ld a,#BLOCK_SIZE
      00A028 88               [ 1]  816 	push a 
      00A029 B4 34            [ 1]  817 	and a,PTR8 ; block align 
      00A02B B7 34            [ 1]  818 	ld PTR8,a
      00A02D 90 AE 16 80      [ 2]  819 	ldw y,#ROWBUFF 
      00A031 92 BC 00 32      [ 5]  820 1$: ldf a,[FPTR]
      00A035 90 F7            [ 1]  821 	ld (y),a
      00A037 CD 9C CB         [ 4]  822 	call inc_fptr
      00A03A 90 5C            [ 2]  823 	incw y 
      00A03C 0A 01            [ 1]  824 	dec (1,sp)
      00A03E 26 F1            [ 1]  825 	jrne 1$ 
      00A040 84               [ 1]  826 	pop a 
      00A041 81               [ 4]  827 	ret 
                                    828 
                                    829 
                                    830 ;---------------------------
                                    831 ; copy ROWBUFF to flash 
                                    832 ; BUF2ROW ( ud -- )
                                    833 ; ud is row address as double 
                                    834 ;---------------------------
      00A042 A0 1B                  835 	.word LINK 
                           001FC4   836 	LINK=.
      00A044 07                     837 	.byte 7 
      00A045 42 55 46 32 52 4F 57   838 	.ascii "BUF2ROW" 
      00A04C                        839 BUF2ROW:
      00A04C CD 86 5E         [ 4]  840 	call TBUF ; ( ud rb -- )
      00A04F CD 87 1E         [ 4]  841 	call ROT 
      00A052 CD 87 1E         [ 4]  842 	call ROT  ; ( rb ud -- )
      00A055 CD 9E 2B         [ 4]  843 	call write_row 
      00A058 81               [ 4]  844 	ret 
                                    845 
                                    846 ;---------------------------------
                                    847 ; how many byte free in that row 
                                    848 ; RFREE ( a -- n )
                                    849 ; a is least byte of target address
                                    850 ;----------------------------------
      00A059 A0 44                  851 	.word LINK 
                           001FDB   852 	LINK=.
      00A05B 05                     853 	.byte 5 
      00A05C 52 46 52 45 45         854 	.ascii "RFREE"
      00A061                        855 RFREE:
      00A061 E6 01            [ 1]  856 	ld a,(1,x)
      00A063 A4 7F            [ 1]  857 	and a,#BLOCK_SIZE-1 
      00A065 B7 24            [ 1]  858 	ld YTEMP,a 
      00A067 A6 80            [ 1]  859 	ld a,#BLOCK_SIZE 
      00A069 B0 24            [ 1]  860 	sub a,YTEMP 
      00A06B 90 5F            [ 1]  861 	clrw y 
      00A06D 90 97            [ 1]  862 	ld yl,a
      00A06F FF               [ 2]  863 	ldw (x),y 
      00A070 81               [ 4]  864 	ret 
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
      00A071 A0 5B                  875 	.word LINK 
                           001FF3   876 	LINK=. 
      00A073 06                     877 	.byte 6
      00A074 52 41 4D 32 45 45      878 	.ascii "RAM2EE"
                                    879 	
      00A07A                        880 RAM2EE:
                                    881 ; copy ud on top 
      00A07A 90 93            [ 1]  882 	ldw y,x 
      00A07C 90 EE 06         [ 2]  883 	ldw y,(6,y) ; LSW of ud  
      00A07F 90 BF 24         [ 2]  884 	ldw YTEMP,y 
      00A082 90 93            [ 1]  885 	ldw y,x 
      00A084 90 EE 04         [ 2]  886 	ldw y,(4,y)  ; MSW of ud 
      00A087 1D 00 04         [ 2]  887 	subw x,#2*CELLL 
      00A08A FF               [ 2]  888 	ldw (x),y 
      00A08B 90 BE 24         [ 2]  889 	ldw y,YTEMP 
      00A08E EF 02            [ 2]  890 	ldw (2,x),y 
      00A090 CD A0 23         [ 4]  891 	call ROW2BUF 
      00A093 90 93            [ 1]  892 	ldw y,x 
      00A095 90 EE 06         [ 2]  893 	ldw y,(6,y)
      00A098 90 89            [ 2]  894 	pushw y ; udl 
      00A09A 90 9F            [ 1]  895 	ld a,yl
      00A09C A4 7F            [ 1]  896 	and a,#BLOCK_SIZE-1 
      00A09E 90 5F            [ 1]  897 	clrw y 
      00A0A0 90 97            [ 1]  898 	ld yl,a 
      00A0A2 72 A9 16 80      [ 2]  899 	addw y,#ROWBUFF 
      00A0A6 1D 00 02         [ 2]  900 	subw x,#CELLL 
      00A0A9 FF               [ 2]  901 	ldw (x),y  
      00A0AA CD 85 73         [ 4]  902 	call SWAPP ;  ( ud a ra u -- )
      00A0AD CD 85 0D         [ 4]  903 	call RFROM  
      00A0B0 CD A0 61         [ 4]  904 	call RFREE 
      00A0B3 CD 88 79         [ 4]  905 	call MIN
      00A0B6 CD 85 63         [ 4]  906 	call DUPP 
      00A0B9 CD 85 2C         [ 4]  907 	call TOR  
      00A0BC CD 8B FF         [ 4]  908 	call CMOVE
      00A0BF CD A0 4C         [ 4]  909 	call BUF2ROW 
      00A0C2 CD 85 0D         [ 4]  910 	call RFROM 
      00A0C5 81               [ 4]  911 	ret 
                                    912 
                                    913 ;--------------------------
                                    914 ; expand 16 bit address 
                                    915 ; to 32 bit address 
                                    916 ; FADDR ( a -- ud )
                                    917 ;--------------------------
      00A0C6 A0 73                  918 	.word LINK 
                           002048   919 	LINK=. 
      00A0C8 05                     920 	.byte 5 
      00A0C9 46 41 44 44 52         921 	.ascii "FADDR"
      00A0CE                        922 FADDR:
      00A0CE CC 8A C4         [ 2]  923 	jp ZERO 
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
      00A0D1 A0 C8                  939 	.word LINK 
                           002053   940 	LINK=.
      00A0D3 05                     941 	.byte 5 
      00A0D4 46 4D 4F 56 45         942 	.ascii "FMOVE" 
      00A0D9                        943 FMOVE:
      00A0D9 CD 86 70         [ 4]  944 	call TFLASH 
      00A0DC CD 84 BC         [ 4]  945 	CALL AT 
      00A0DF CD 84 67         [ 4]  946 	CALL QBRAN 
      00A0E2 A1 5D                  947 	.word no_move  
      00A0E4 CD 86 BF         [ 4]  948 	call CPP
      00A0E7 CD 84 BC         [ 4]  949 	call AT  
      00A0EA CD 85 63         [ 4]  950 	call DUPP ; ( udl udl -- )
      00A0ED CD 86 A3         [ 4]  951 	call CNTXT 
      00A0F0 CD 84 BC         [ 4]  952 	call AT 
      00A0F3 CD 84 34         [ 4]  953 	call DOLIT 
      00A0F6 00 02                  954 	.word 2 
      00A0F8 CD 87 D7         [ 4]  955 	call SUBB ; ( udl udl a -- )
      00A0FB CD 85 73         [ 4]  956 	call SWAPP 
      00A0FE CD A0 CE         [ 4]  957 	call FADDR 
      00A101 CD 87 1E         [ 4]  958 	call ROT  ; ( udl ud a -- )
      00A104 CD 85 63         [ 4]  959 	call DUPP 
      00A107 CD 85 2C         [ 4]  960 	call TOR    ; R: a 
      00A10A                        961 FMOVE2: 
      00A10A CD 8B B2         [ 4]  962 	call HERE 
      00A10D CD 85 20         [ 4]  963 	call RAT 
      00A110 CD 87 D7         [ 4]  964 	call SUBB ; (udl ud a wl -- )
      00A113                        965 next_row:
      00A113 CD 85 63         [ 4]  966 	call DUPP 
      00A116 CD 85 2C         [ 4]  967 	call TOR  ; ( udl ud a wl -- ) R: a wl
      00A119 CD A0 7A         [ 4]  968 	call RAM2EE ; ( udl a u -- udl u2 ) u2 is byte written to FLASH 
      00A11C CD 85 63         [ 4]  969 	call DUPP 
      00A11F CD 85 2C         [ 4]  970 	call TOR
      00A122 CD 87 5E         [ 4]  971 	call PLUS  ; ( udl+ ) 
      00A125 CD 85 63         [ 4]  972 	call DUPP 
      00A128 CD 8A C4         [ 4]  973 	call ZERO   ; ( udl+ ud -- )
      00A12B CD 85 0D         [ 4]  974 	call RFROM  ; ( udl+ ud u2  R: a wl ) 
      00A12E CD 85 0D         [ 4]  975 	call RFROM  ; ( udl+ ud u2 wl R: a ) 
      00A131 CD 85 8D         [ 4]  976 	call OVER   ; ( udl+ ud u2 wl u2 -- )
      00A134 CD 87 D7         [ 4]  977 	call SUBB  ; ( udl+ ud u2 wl- R: a )
      00A137 CD 85 63         [ 4]  978 	call DUPP 
      00A13A CD 84 67         [ 4]  979 	call QBRAN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      00A13D A1 56                  980 	.word fmove_done 
      00A13F CD 85 73         [ 4]  981 	call SWAPP  ; ( udl+ ud wl- u2 R: a )
      00A142 CD 85 0D         [ 4]  982 	call RFROM ; ( udl+ ud wl- u2 a -- ) 
      00A145 CD 87 5E         [ 4]  983 	call PLUS  ; ( udl+2 ud wl- a+ )
      00A148 CD 85 63         [ 4]  984 	call DUPP 
      00A14B CD 85 2C         [ 4]  985 	call TOR   ; ( udl+2 ud wl- a+ ) R: a+
      00A14E CD 85 73         [ 4]  986 	call SWAPP 
      00A151 CD 84 7E         [ 4]  987 	call BRAN
      00A154 A1 13                  988 	.word next_row  
      00A156                        989 fmove_done:	
      00A156 CD 85 0D         [ 4]  990 	call RFROM  ; ( -- udl+ ud u2 wl- a  )
      00A159 1C 00 0A         [ 2]  991 	addw x,#5*CELLL ; (  -- cp+ ) new CP 
      00A15C 81               [ 4]  992  	ret  
      00A15D                        993 no_move:
      00A15D CD 8A C4         [ 4]  994 	call ZERO
      00A160 81               [ 4]  995 	ret 
                                    996 
                                    997 ;------------------------------------------
                                    998 ; adjust pointers after **FMOVE** operetion.
                                    999 ; UPDAT-PTR ( cp+ -- )
                                   1000 ; cp+ is new CP position after FMOVE 
                                   1001 ;-------------------------------------------
      00A161 A0 D3                 1002 	.word LINK 
                           0020E3  1003 	LINK=.
      00A163 09                    1004 	.byte 9
      00A164 55 50 44 41 54 2D 50  1005 	.ascii "UPDAT-PTR" 
             54 52
      00A16D                       1006 UPDATPTR:
                                   1007 ;reset VP to previous position  
      00A16D CD 9B B3         [ 4] 1008 	call EEPVP 
      00A170 CD 85 59         [ 4] 1009 	call DROP 
      00A173 CD 84 BC         [ 4] 1010 	call AT
      00A176 CD 86 B1         [ 4] 1011 	call VPP 
      00A179 CD 84 A5         [ 4] 1012 	call STORE
                                   1013 ;update CONTEXT and LAST 
      00A17C CD 9B 9D         [ 4] 1014 	call EEPCP 
      00A17F CD 85 59         [ 4] 1015 	call DROP
      00A182 CD 84 BC         [ 4] 1016 	call AT
      00A185 CD 84 34         [ 4] 1017 	call DOLIT 
      00A188 00 02                 1018 	.word 2 
      00A18A CD 87 5E         [ 4] 1019 	call PLUS 
      00A18D CD 85 63         [ 4] 1020 	call DUPP 
      00A190 CD 86 A3         [ 4] 1021 	call CNTXT 
      00A193 CD 84 A5         [ 4] 1022 	call STORE
      00A196 CD 86 CF         [ 4] 1023 	call LAST
      00A199 CD 84 A5         [ 4] 1024 	call STORE 
      00A19C CD 9B CD         [ 4] 1025 	call UPDATLAST 
                                   1026 ;update CP 
      00A19F CD 86 BF         [ 4] 1027 	call CPP 
      00A1A2 CD 84 A5         [ 4] 1028 	call STORE
      00A1A5 CD 9B F6         [ 4] 1029 	call UPDATCP 
      00A1A8 81               [ 4] 1030 	ret 
                                   1031 
                                   1032 ;-----------------------------
                                   1033 ; move interrupt sub-routine
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



                                   1034 ; in flash memory
                                   1035 ;----------------------------- 
      00A1A9 A1 63                 1036 	.word LINK 
                           00212B  1037 	LINK=. 
      00A1AB 06                    1038 	.byte 6
      00A1AC 49 46 4D 4F 56 45     1039 	.ascii "IFMOVE" 
      00A1B2                       1040 IFMOVE:
      00A1B2 CD 86 70         [ 4] 1041 	call TFLASH 
      00A1B5 CD 84 BC         [ 4] 1042 	CALL AT 
      00A1B8 CD 84 67         [ 4] 1043 	CALL QBRAN 
      00A1BB A1 5D                 1044 	.word no_move 
      00A1BD CD 86 BF         [ 4] 1045 	call CPP 
      00A1C0 CD 84 BC         [ 4] 1046 	call AT 
      00A1C3 CD 85 63         [ 4] 1047 	call DUPP ; ( udl udl -- )
      00A1C6 CD 9B B3         [ 4] 1048 	call EEPVP 
      00A1C9 CD 85 59         [ 4] 1049 	call DROP
      00A1CC CD 84 BC         [ 4] 1050 	call AT  ; ( udl udl a )
      00A1CF CD 85 2C         [ 4] 1051 	call TOR 
      00A1D2 CD A0 CE         [ 4] 1052 	call FADDR
      00A1D5 CD 85 20         [ 4] 1053 	call RAT ; ( udl ud a -- ) R: a 
      00A1D8 CC A1 0A         [ 2] 1054 	jp FMOVE2 
                                   1055 
                                   1056 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



                                   4441 
                                   4442 ;===============================================================
                                   4443 
                           00212B  4444 LASTN =	LINK   ;last name defined
                                   4445 
                                   4446 ; application code begin here
      00A200                       4447 	.bndry 128 ; align on flash block  
      00A200                       4448 app_space: 
                                   4449 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   6 AB1        00077A R   |   6 ABOR1      0012CD R
  6 ABOR2      0012E4 R   |   6 ABORQ      0012C5 R   |   6 ABORT      0012B6 R
  6 ABRTQ      0015A1 R   |   6 ABSS       000771 R   |   6 ACCEP      00124C R
  6 ACCP1      001255 R   |   6 ACCP2      00127B R   |   6 ACCP3      00127E R
  6 ACCP4      001280 R   |     ADC_CR1 =  005401     |     ADC_CR1_=  000000 
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
  6 AFT        00158C R   |   6 AGAIN      0014E2 R   |   6 AHEAD      00153F R
  6 ALLOT      0013F5 R   |   6 ANDD       00052F R   |     APP_CP  =  004004 
    APP_LAST=  004000     |     APP_RUN =  004002     |     APP_VP  =  004006 
  6 AT         00043C R   |   6 ATEXE      000B68 R   |   6 AUTORUN    000127 R
    AWU_APR =  0050F1     |     AWU_CSR =  0050F0     |     AWU_TBR =  0050F2 
    B0_MASK =  000001     |     B115200 =  000006     |     B19200  =  000003 
    B1_MASK =  000002     |     B230400 =  000007     |     B2400   =  000000 
    B2_MASK =  000004     |     B38400  =  000004     |     B3_MASK =  000008 
    B460800 =  000008     |     B4800   =  000001     |     B4_MASK =  000010 
    B57600  =  000005     |     B5_MASK =  000020     |     B6_MASK =  000040 
    B7_MASK =  000080     |     B921600 =  000009     |     B9600   =  000002 
  6 BACK1      0011F4 R   |   6 BASE       0005A0 R   |     BASEE   =  00000A 
    BCNT    =  000001     |   6 BCOMP      001437 R   |   6 BDIGS      000C4F R
    BEEP_BIT=  000004     |     BEEP_CSR=  0050F3     |     BEEP_MAS=  000010 
    BEEP_POR=  00000F     |   6 BEGIN      0014C4 R   |     BIT0    =  000000 
    BIT1    =  000001     |     BIT2    =  000002     |     BIT3    =  000003 
    BIT4    =  000004     |     BIT5    =  000005     |     BIT6    =  000006 
    BIT7    =  000007     |   6 BKSLA      00108C R   |   6 BKSP       0011C4 R
    BKSPP   =  000008     |   6 BLANK      000A37 R   |     BLOCK_SI=  000080 
    BOOT_ROM=  006000     |     BOOT_ROM=  007FFF     |   6 BRAN       0003FE R
    BTW     =  000001     |   6 BUF2ROW    001FCC R   |   6 BYE        0000B4 R
    CADR    =  000003     |     CALLL   =  0000CD     |     CAN_DGR =  005426 
    CAN_FPSR=  005427     |     CAN_IER =  005425     |     CAN_MCR =  005420 
    CAN_MSR =  005421     |     CAN_P0  =  005428     |     CAN_P1  =  005429 
    CAN_P2  =  00542A     |     CAN_P3  =  00542B     |     CAN_P4  =  00542C 
    CAN_P5  =  00542D     |     CAN_P6  =  00542E     |     CAN_P7  =  00542F 
    CAN_P8  =  005430     |     CAN_P9  =  005431     |     CAN_PA  =  005432 
    CAN_PB  =  005433     |     CAN_PC  =  005434     |     CAN_PD  =  005435 
    CAN_PE  =  005436     |     CAN_PF  =  005437     |     CAN_RFR =  005424 
    CAN_TPR =  005423     |     CAN_TSR =  005422     |     CARRY   =  000028 
  6 CAT        00045A R   |   6 CCOMMA     001419 R   |     CC_C    =  000000 
    CC_H    =  000004     |     CC_I0   =  000003     |     CC_I1   =  000005 
    CC_N    =  000002     |     CC_V    =  000007     |     CC_Z    =  000001 
    CELLL   =  000002     |   6 CELLM      0009BC R   |   6 CELLP      0009AD R
  6 CELLS      0009CB R   |     CFG_GCR =  007F60     |     CFG_GCR_=  000001 
    CFG_GCR_=  000000     |   6 CHAR1      000E7C R   |   6 CHAR2      000E7F R
  6 CHKIVEC    001EBA R   |     CLKOPT  =  004807     |     CLKOPT_C=  000002 
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
  6 COLD       001999 R   |   6 COLD1      001999 R   |   6 COLON      00173A R
  6 COMMA      001402 R   |   6 COMPI      001447 R   |     COMPO   =  000040 
  6 CONSTANT   0017E4 R   |   6 COUNT      000B1B R   |   6 CPP        00063F R
    CPU_A   =  007F00     |     CPU_CCR =  007F0A     |     CPU_PCE =  007F01 
    CPU_PCH =  007F02     |     CPU_PCL =  007F03     |     CPU_SPH =  007F08 
    CPU_SPL =  007F09     |     CPU_XH  =  007F04     |     CPU_XL  =  007F05 
    CPU_YH  =  007F06     |     CPU_YL  =  007F07     |   6 CR         000EAA R
  6 CREAT      001780 R   |     CRR     =  00000D     |   6 CSTOR      000449 R
  6 DAT        000AFB R   |     DATSTK  =  001680     |   6 DDROP      0006BE R
  6 DDUP       0006C9 R   |     DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF 
  6 DECIM      000CFF R   |   6 DEPTH      000A86 R   |     DEVID_BA=  0048CD 
    DEVID_EN=  0048D8     |     DEVID_LO=  0048D2     |     DEVID_LO=  0048D3 
    DEVID_LO=  0048D4     |     DEVID_LO=  0048D5     |     DEVID_LO=  0048D6 
    DEVID_LO=  0048D7     |     DEVID_LO=  0048D8     |     DEVID_WA=  0048D1 
    DEVID_XH=  0048CE     |     DEVID_XL=  0048CD     |     DEVID_YH=  0048D0 
    DEVID_YL=  0048CF     |   6 DGTQ1      000D44 R   |   6 DI         0000C2 R
  6 DIG        000C78 R   |   6 DIGIT      000C13 R   |   6 DIGS       000C89 R
  6 DIGS1      000C89 R   |   6 DIGS2      000C96 R   |   6 DIGTQ      000D13 R
    DM_BK1RE=  007F90     |     DM_BK1RH=  007F91     |     DM_BK1RL=  007F92 
    DM_BK2RE=  007F93     |     DM_BK2RH=  007F94     |     DM_BK2RL=  007F95 
    DM_CR1  =  007F96     |     DM_CR2  =  007F97     |     DM_CSR1 =  007F98 
    DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A     |   6 DN1        000738 R
  6 DNEGA      00071B R   |   6 DOCONST    00180E R   |   6 DOLIT      0003B4 R
  6 DONXT      0003C8 R   |   6 DOSTR      000EC0 R   |   6 DOT        000F45 R
  6 DOT1       000F5B R   |   6 DOTI1      001930 R   |   6 DOTID      00191A R
  6 DOTO1      001359 R   |   6 DOTOK      00133F R   |   6 DOTPR      00106E R
  6 DOTQ       0015BB R   |   6 DOTQP      000EE9 R   |   6 DOTR       000EF7 R
  6 DOTS       0018BC R   |   6 DOTS1      0018C7 R   |   6 DOTS2      0018D0 R
  6 DOVAR      000590 R   |   6 DROP       0004D9 R   |   6 DSTOR      000AD5 R
  6 DUMP       001872 R   |   6 DUMP1      001889 R   |   6 DUMP3      0018AB R
  6 DUMPP      001841 R   |   6 DUPP       0004E3 R   |   6 EDIGS      000CB4 R
  6 EEPCP      001B1D R   |   6 EEPLAST    001AF0 R   |   6 EEPROM     001AD8 R
    EEPROM_B=  004000     |     EEPROM_E=  0047FF     |     EEPROM_S=  000800 
  6 EEPRUN     001B07 R   |   6 EEPVP      001B33 R   |   6 EI         0000BB R
  6 ELSEE      00151A R   |   6 EMIT       00039E R   |   6 ENEPER     001A48 R
  6 EQ1        000795 R   |   6 EQUAL      00077F R   |   6 ERASE      000BE1 R
    ERR     =  00001B     |   6 EVAL       001382 R   |   6 EVAL1      001382 R
  6 EVAL2      00139E R   |   6 EXE1       000B76 R   |   6 EXECU      00040E R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]

Symbol Table

  6 EXIT       00041E R   |     EXT     =  000000     |     EXTI_CR1=  0050A0 
    EXTI_CR2=  0050A1     |   6 EXTRC      000C3B R   |   6 FADDR      00204E R
    FHSE    =  7A1200     |     FHSI    =  F42400     |   6 FILL       000BAE R
  6 FILL1      000BCB R   |   6 FILL2      000BD4 R   |   6 FIND       001120 R
  6 FIND1      00113E R   |   6 FIND2      00116C R   |   6 FIND3      001178 R
  6 FIND4      00118C R   |   6 FIND5      001199 R   |   6 FIND6      00117D R
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
    FLSI    =  01F400     |   6 FMOVE      002059 R   |   6 FMOVE2     00208A R
  6 FOR        001497 R   |   6 FORGET     000158 R   |   6 FORGET1    000187 R
  6 FORGET2    00020D R   |   6 FORGET4    000216 R   |   6 FORGET6    0001CF R
    FPTR    =  000032     |   6 FREEVAR    000223 R   |   6 FREEVAR4   000259 R
    GPIO_BAS=  005000     |     GPIO_CR1=  000003     |     GPIO_CR2=  000004 
    GPIO_DDR=  000002     |     GPIO_IDR=  000001     |     GPIO_ODR=  000000 
    GPIO_SIZ=  000005     |   6 HERE       000B32 R   |   6 HEX        000CEA R
  6 HI         00196C R   |   6 HLD        000610 R   |   6 HOLD       000C5F R
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
    I2C_WRIT=  000000     |   6 ICOLON     00174B R   |   6 IFETCH     0014B5 R
  6 IFF        0014F2 R   |   6 IFMOVE     002132 R   |     IMEDD   =  000080 
  6 IMMED      00175D R   |   6 INCH       000392 R   |   6 INITOFS    001713 R
  6 INN        0005BE R   |     INPUT_DI=  000000     |     INPUT_EI=  000001 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]

Symbol Table

    INPUT_FL=  000000     |     INPUT_PU=  000001     |   6 INTE1      001321 R
  6 INTER      0012F7 R   |     INT_ADC2=  000016     |     INT_AUAR=  000012 
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
  6 ISEMI      0016A8 R   |     ITC_SPR1=  007F70     |     ITC_SPR2=  007F71 
    ITC_SPR3=  007F72     |     ITC_SPR4=  007F73     |     ITC_SPR5=  007F74 
    ITC_SPR6=  007F75     |     ITC_SPR7=  007F76     |     ITC_SPR8=  007F77 
    IWDG_KR =  0050E0     |     IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2 
  6 JSRC       0016FD R   |   6 KEY        000E2A R   |   6 KTAP       001211 R
  6 KTAP1      001234 R   |   6 KTAP2      001237 R   |   6 LAST       00064F R
  6 LASTN   =  00212B R   |   6 LBRAC      00132E R   |     LED2_BIT=  000005 
    LED2_MAS=  000020     |     LED2_POR=  00500A     |   6 LESS       0007BC R
    LF      =  00000A     |   6 LINK    =  00212B R   |   6 LITER      001469 R
  6 LN2S       001AA4 R   |   6 LOG2S      001A8E R   |   6 LSHIFT     0009F6 R
  6 LSHIFT1    0009FF R   |   6 LSHIFT4    000A07 R   |   6 LT1        0007D2 R
    MASKK   =  001F7F     |   6 MAX        0007DC R   |   6 MAX1       0007EF R
  6 MIN        0007F9 R   |   6 MIN1       00080C R   |   6 MMOD1      0008AF R
  6 MMOD2      0008C3 R   |   6 MMOD3      0008DA R   |   6 MMSM1      000856 R
  6 MMSM2      00086A R   |   6 MMSM3      00086C R   |   6 MMSM4      000874 R
  6 MODD       0008F4 R   |   6 MONE       000A5D R   |     MS      =  00002E 
  6 MSEC       0002CE R   |   6 MSMOD      000892 R   |   6 MSTA1      000985 R
  6 MSTAR      000962 R   |     NAFR    =  004804     |   6 NAMEQ      0011B9 R
  6 NAMET      0010CA R   |     NCLKOPT =  004808     |   6 NEGAT      000709 R
  6 NEX1       0003D5 R   |   6 NEXT       0014A6 R   |     NFLASH_W=  00480E 
    NHSECNT =  00480A     |     NOPT1   =  004802     |     NOPT2   =  004804 
    NOPT3   =  004806     |     NOPT4   =  004808     |     NOPT5   =  00480A 
    NOPT6   =  00480C     |     NOPT7   =  00480E     |     NOPTBL  =  00487F 
  6 NTIB       0005CE R   |     NUBC    =  004802     |   6 NUFQ       000E40 R
  6 NUFQ1      000E59 R   |   6 NUMBQ      000D57 R   |   6 NUMQ1      000D8B R
  6 NUMQ2      000DBC R   |   6 NUMQ3      000DFE R   |   6 NUMQ4      000E03 R
  6 NUMQ5      000E12 R   |   6 NUMQ6      000E15 R   |     NWDGOPT =  004806 
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
    OUTPUT_S=  000000     |   6 OVER       00050D R   |   6 OVERT      001676 R
    PA      =  000000     |   6 PACKS      000BF2 R   |   6 PAD        000B43 R
  6 PAREN      00107D R   |   6 PARS       000F76 R   |   6 PARS1      000FA1 R
  6 PARS2      000FCC R   |   6 PARS3      000FCF R   |   6 PARS4      000FD8 R
  6 PARS5      000FFB R   |   6 PARS6      001010 R   |   6 PARS7      00101F R
  6 PARS8      00102E R   |   6 PARSE      00103F R   |   6 PAUSE      0002DE R
    PA_BASE =  005000     |     PA_CR1  =  005003     |     PA_CR2  =  005004 
    PA_DDR  =  005002     |     PA_IDR  =  005001     |     PA_ODR  =  005000 
    PB      =  000005     |     PB_BASE =  005005     |     PB_CR1  =  005008 
    PB_CR2  =  005009     |     PB_DDR  =  005007     |     PB_IDR  =  005006 
    PB_ODR  =  005005     |     PC      =  00000A     |     PC_BASE =  00500A 
    PC_CR1  =  00500D     |     PC_CR2  =  00500E     |     PC_DDR  =  00500C 
    PC_IDR  =  00500B     |     PC_ODR  =  00500A     |     PD      =  00000F 
  6 PDUM1      001854 R   |   6 PDUM2      001865 R   |     PD_BASE =  00500F 
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
    PI      =  000028     |   6 PICK       000A9D R   |   6 PII        001A07 R
    PI_BASE =  005028     |     PI_CR1  =  00502B     |     PI_CR2  =  00502C 
    PI_DDR  =  00502A     |     PI_IDR  =  005029     |     PI_ODR  =  005028 
  6 PLUS       0006DE R   |   6 PNAM1      00162B R   |   6 PRESE      0013AD R
    PROD1   =  000022     |     PROD2   =  000024     |     PROD3   =  000026 
  6 PROTECTE   0001FF R   |   6 PSTOR      000AB4 R   |     PTR16   =  000033 
    PTR8    =  000034     |   6 QBRAN      0003E7 R   |   6 QDUP       00068D R
  6 QDUP1      000697 R   |   6 QKEY       000380 R   |   6 QSTAC      001365 R
  6 QUERY      001291 R   |   6 QUEST      000F68 R   |   6 QUIT       0013CA R
  6 QUIT1      0013D2 R   |   6 QUIT2      0013D5 R   |   6 RAM2EE     001FFA R
    RAMBASE =  000000     |   6 RAMLAST    000662 R   |     RAM_BASE=  000000 
    RAM_END =  0017FF     |     RAM_SIZE=  001800     |   6 RANDOM     00027C R
  6 RAT        0004A0 R   |   6 RBRAC      0016EA R   |   6 REPEA      00156F R
  6 RFREE      001FE1 R   |   6 RFROM      00048D R   |     ROP     =  004800 
  6 ROT        00069E R   |   6 ROW2BUF    001FA3 R   |     ROWBUFF =  001680 
    RP0     =  00002C     |   6 RPAT       00046A R   |     RPP     =  0017FF 
  6 RPSTO      000477 R   |   6 RSHIFT     000A12 R   |   6 RSHIFT1    000A1B R
  6 RSHIFT4    000A23 R   |     RST_SR  =  0050B3     |   6 RT12_2     001A77 R
  6 SAME1      0010E8 R   |   6 SAME2      001111 R   |   6 SAMEQ      0010E0 R
  6 SCOM1      001660 R   |   6 SCOM2      001663 R   |   6 SCOMP      001642 R
  6 SEED       000263 R   |     SEEDX   =  000036     |     SEEDY   =  000038 
  6 SEMIS      001686 R   |   6 SETISP     0000CE R   |   6 SET_RAML   0017CD R
    SFR_BASE=  005000     |     SFR_END =  0057FF     |   6 SIGN       000C9E R
  6 SIGN1      000CAE R   |   6 SLASH      0008FE R   |   6 SLMOD      0008E2 R
  6 SNAME      0015F5 R   |     SP0     =  00002A     |   6 SPACE      000E62 R
  6 SPACS      000E71 R   |   6 SPAT       0004C3 R   |     SPI_CR1 =  005200 
    SPI_CR2 =  005201     |     SPI_CRCP=  005205     |     SPI_DR  =  005204 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]

Symbol Table

    SPI_ICR =  005202     |     SPI_RXCR=  005206     |     SPI_SR  =  005203 
    SPI_TXCR=  005207     |     SPP     =  001680     |     SPSAVE  =  000001 
  6 SPSTO      0004D0 R   |   6 SQRT10     001A60 R   |   6 SQRT2      001A1E R
  6 SQRT3      001A35 R   |   6 SSMOD      00098E R   |     SSP     =  000001 
    STACK   =  0017FF     |   6 STAR       000957 R   |   6 STASL      00099F R
  6 STOD       000740 R   |   6 STORE      000425 R   |   6 STR        000CCC R
  6 STRCQ      001477 R   |   6 STRQ       0015AE R   |   6 STRQP      000EDF R
  6 SUBB       000757 R   |   6 SWAPP      0004F3 R   |     SWIM_CSR=  007F80 
  6 TAP        0011FB R   |   6 TBOOT      00198D R   |   6 TBUF       0005DE R
    TBUFFBAS=  001680     |   6 TCHAR      000A6E R   |   6 TEMP       0005AF R
  6 TEVAL      000601 R   |   6 TFLASH     0005F0 R   |   6 THENN      001507 R
  6 TIB        000B54 R   |     TIBB    =  001700     |     TIBBASE =  001700 
    TIC     =  000027     |   6 TICK       0013E1 R   |     TIM1_ARR=  005262 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]

Symbol Table

    TIM1_SR1=  000004     |     TIM1_SR1=  000005     |     TIM1_SR1=  000006 
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
    TIM4_SR =  005342     |     TIM4_SR_=  000000     |   6 TIMEOUTQ   00030E R
  6 TIMER      0002F8 R   |     TIM_CR1_=  000007     |     TIM_CR1_=  000000 
    TIM_CR1_=  000006     |     TIM_CR1_=  000005     |     TIM_CR1_=  000004 
    TIM_CR1_=  000003     |     TIM_CR1_=  000001     |     TIM_CR1_=  000002 
  6 TNAM2      0018EA R   |   6 TNAM3      001908 R   |   6 TNAM4      00190E R
  6 TNAME      0018E7 R   |   6 TOFLASH    000333 R   |   6 TOKEN      0010BC R
  6 TOR        0004AC R   |   6 TORAM      000373 R   |     TRUEE   =  00FFFF 
  6 TWOSL      000A2A R   |   6 TYPE1      000E91 R   |   6 TYPE2      000E9D R
  6 TYPES      000E8C R   |   6 Timer4Ha   000005 R   |     UART1   =  000000 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]

Symbol Table

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
    UCP     =  000018     |     UCTIB   =  00000C     |     UD1     =  000001 
    UD2     =  000002     |     UD3     =  000003     |     UD4     =  000004 
  6 UDOT       000F32 R   |   6 UDOTR      000F12 R   |   6 UEND       000045 R
    UHLD    =  000012     |     UINN    =  00000A     |     UINTER  =  000010 
    ULAST   =  00001A     |   6 ULES1      0007B4 R   |   6 ULESS      00079E R
  6 UMMOD      000834 R   |   6 UMSTA      00090D R   |   6 UNIQ1      0015EC R
  6 UNIQU      0015CD R   |   6 UNTIL      0014CF R   |     UOFFSET =  00001C 
  6 UPDATCP    001B76 R   |   6 UPDATLAS   001B4D R   |   6 UPDATPTR   0020ED R
  6 UPDATRUN   001B65 R   |   6 UPDATVP    001B8D R   |   6 UPL1       000584 R
  6 UPLUS      00056D R   |     UPP     =  000006     |     URLAST  =  000020 
    USR_BTN_=  000004     |     USR_BTN_=  000010     |     USR_BTN_=  005015 
    UTFLASH =  00001E     |     UTIB    =  00000E     |     UTMP    =  000008 
  6 UTYP1      001824 R   |   6 UTYP2      001833 R   |   6 UTYPE      00181F R
    UVP     =  000016     |   6 UZERO      00002B R   |   6 VARIA      00179A R
    VAR_BASE=  000080     |     VAR_TOP =  0017BF     |     VER     =  000003 
  6 VPP        000631 R   |     VSIZE   =  000006     |     WANT_DEB=  000000 
    WANT_MAT=  000001     |     WANT_SEE=  000000     |     WDGOPT  =  004805 
    WDGOPT_I=  000002     |     WDGOPT_L=  000003     |     WDGOPT_W=  000000 
    WDGOPT_W=  000001     |   6 WHILE      001555 R   |   6 WITHI      000819 R
  6 WORDD      0010A8 R   |   6 WORDS      001944 R   |   6 WORS1      00194A R
  6 WORS2      001966 R   |     WWDG_CR =  0050D1     |     WWDG_WR =  0050D2 
  6 XORR       000558 R   |     XTEMP   =  000022     |     YTEMP   =  000024 
  6 ZERO       000A44 R   |   6 ZL1        000525 R   |   6 ZLESS      00051C R
  6 app_spac   002180 R   |   6 block_er   001D10 R   |   6 clear_ra   000019 R
  6 clock_in   000062 R   |   6 copy_buf   001D67 R   |   6 copy_buf   001D86 R
  6 copy_pro   001D86 R   |     da      =  000002     |     db      =  000003 
    dc      =  000000     |     dd      =  000001     |   6 ee_ccomm   001F81 R
  6 ee_comma   001F60 R   |   6 ee_cstor   001C7D R   |   6 ee_store   001CC9 R
  6 erase_fl   001D2C R   |   6 farat      001B9E R   |   6 farcat     001BBA R
  6 fmove_do   0020D6 R   |   6 fptr_sto   001AB9 R   |   6 inc_fptr   001C4B R
  6 lock       001C37 R   |   6 main       000016 R   |   6 next_row   002093 R
  6 no_move    0020DD R   |   6 pristine   001E01 R   |   6 proceed_   001D2F R
  6 reboot     000325 R   |   6 reset_ve   001E68 R   |   6 row_eras   001CF3 R
  6 row_eras   001D40 R   |   6 row_eras   001D67 R   |   6 set_opti   001DD5 R
  6 set_vect   001F09 R   |   6 uart1_in   000074 R   |   6 unlock     001C0F R
  6 unlock_e   001BD1 R   |   6 unlock_f   001BF0 R   |   6 write_by   001C62 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]

Symbol Table

  6 write_ro   001DAB R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 DATA       size      0   flags    8
   2 DATA0      size      0   flags    8
   3 SSEG       size      0   flags    8
   4 SSEG1      size    100   flags    8
   5 HOME       size     80   flags    0
   6 CODE       size   2180   flags    0

