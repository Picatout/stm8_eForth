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
      0080B5 93 6D                  275         .word      INTER   ;'EVAL
      0080B7 00 00                  276         .word      0       ;HLD
      0080B9 A1 A1                  277         .word      LASTN  ;CNTXT pointer
      0080BB 00 80                  278         .word      VAR_BASE   ;variables free space pointer 
      0080BD A2 00                  279         .word      app_space ; FLASH free space pointer 
      0080BF A1 A1                  280         .word      LASTN   ;LAST
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
      00812B CC 9A 0F         [ 2]  332         jp  COLD   ;default=MN1
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
      008171 CD 85 83         [ 4]  393         call OVER ; ( level reg lshift rval lshift -- )
      008174 CD 84 34         [ 4]  394         call DOLIT 
      008177 00 03                  395         .word 3
      008179 CD 85 69         [ 4]  396         call SWAPP  ; ( level reg lshift rval 3 lshift )
      00817C CD 8A 6C         [ 4]  397         call LSHIFT ; creat slot mask 
      00817F CD 87 6E         [ 4]  398         call INVER  ; ( level reg lshift rval mask )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 9.
Hexadecimal [24-Bits]



      008182 CD 85 A5         [ 4]  399         call ANDD ; ( level reg lshift slot_masked )
      008185 CD 85 22         [ 4]  400         call TOR  ; ( level reg lshift -- R: slot_masked )
      008188 CD 87 14         [ 4]  401         call ROT  ; ( reg lshift level )
      00818B CD 85 69         [ 4]  402         call SWAPP ; ( reg level lshift )
      00818E CD 8A 6C         [ 4]  403         call LSHIFT  ; ( reg slot_level -- )
      008191 CD 85 03         [ 4]  404         call RFROM ; ( reg slot_level masked_val )
      008194 CD 85 B9         [ 4]  405         call ORR   ; ( reg updated_rval )
      008197 CD 85 69         [ 4]  406         call SWAPP 
      00819A CD 84 BF         [ 4]  407         call CSTOR
                                    408 
                                    409 ; sélectionne l'application 
                                    410 ; qui démarre automatique lors 
                                    411 ; d'un COLD start 
      00819D 81 46                  412         .word LINK 
                           00011F   413         LINK=.
      00819F 07                     414         .byte 7
      0081A0 41 55 54 4F 52 55 4E   415         .ascii "AUTORUN"
      0081A7                        416 AUTORUN:
      0081A7 CD 91 32         [ 4]  417         call TOKEN 
      0081AA CD 85 59         [ 4]  418         call DUPP 
      0081AD CD 84 67         [ 4]  419         call QBRAN 
      0081B0 82 8D                  420         .word FORGET2
      0081B2 CD 92 2F         [ 4]  421         call NAMEQ
      0081B5 CD 87 03         [ 4]  422         call QDUP 
      0081B8 CD 84 67         [ 4]  423         call QBRAN 
      0081BB 82 8D                  424         .word FORGET2
      0081BD CD 85 4F         [ 4]  425         call DROP 
      0081C0 1D 00 04         [ 2]  426         subw x,#2*CELLL 
      0081C3 90 5F            [ 1]  427         clrw y 
      0081C5 FF               [ 2]  428         ldw (x),y 
      0081C6 90 AE 40 02      [ 2]  429         ldw y,#APP_RUN 
      0081CA EF 02            [ 2]  430         ldw (2,x),y 
      0081CC CC 9D 3F         [ 2]  431         jp ee_store 
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
      0081D8 CD 91 32         [ 4]  442         call TOKEN
      0081DB CD 85 59         [ 4]  443         call DUPP 
      0081DE CD 84 67         [ 4]  444         call QBRAN 
      0081E1 82 8D                  445         .word FORGET2
      0081E3 CD 92 2F         [ 4]  446         call NAMEQ ; ( a -- ca na | a F )
      0081E6 CD 87 03         [ 4]  447         call QDUP 
      0081E9 CD 84 67         [ 4]  448         call QBRAN 
      0081EC 82 8D                  449         .word FORGET2
                                    450 ; only forget users words 
      0081EE CD 85 59         [ 4]  451         call DUPP ; ( ca na na )
      0081F1 CD 84 34         [ 4]  452         call DOLIT 
      0081F4 A2 00                  453         .word app_space 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



      0081F6 CD 85 69         [ 4]  454         call SWAPP 
      0081F9 CD 88 14         [ 4]  455         call  ULESS 
      0081FC CD 84 67         [ 4]  456         call QBRAN 
      0081FF 82 4F                  457         .word FORGET6 
                                    458 ; ( ca na -- )        
                                    459 ;reset ivec with address >= ca
      008201 CD 85 69         [ 4]  460         call SWAPP ; ( na ca -- ) 
      008204 CD 9F 30         [ 4]  461         call CHKIVEC ; ( na -- ) 
                                    462 ; start at LAST and link back to na 
                                    463 ; if variable found reset VP at that point.
      008207                        464 FORGET1:
      008207 CD 86 C5         [ 4]  465         call LAST 
      00820A CD 84 B2         [ 4]  466         call AT 
      00820D CD 85 59         [ 4]  467         call DUPP  ; ( -- na last last )
      008210 CD 82 A3         [ 4]  468         call FREEVAR ; ( -- na last )
      008213 CD 85 59         [ 4]  469         call DUPP 
      008216 CD 84 34         [ 4]  470         call DOLIT 
      008219 00 02                  471         .word 2 
      00821B CD 87 CD         [ 4]  472         call SUBB ; ( na last -- na last lfa ) link address 
      00821E CD 84 B2         [ 4]  473         call AT 
      008221 CD 85 59         [ 4]  474         call DUPP ; ( -- na last a a )
      008224 CD 86 99         [ 4]  475         call CNTXT 
      008227 CD 84 9B         [ 4]  476         call STORE
      00822A CD 86 C5         [ 4]  477         call LAST  
      00822D CD 84 9B         [ 4]  478         call STORE ; ( --  na last )
      008230 CD 85 83         [ 4]  479         call OVER 
      008233 CD 87 F5         [ 4]  480         call EQUAL ; ( na last na -- na T|F ) 
      008236 CD 84 67         [ 4]  481         call QBRAN 
      008239 82 07                  482         .word FORGET1 
                                    483 ; ( na -- )
      00823B CD 84 34         [ 4]  484         call DOLIT 
      00823E 00 02                  485         .word 2 
      008240 CD 87 CD         [ 4]  486         call SUBB 
      008243 CD 86 B5         [ 4]  487         call CPP 
      008246 CD 84 9B         [ 4]  488         call STORE  
      008249 CD 9B EC         [ 4]  489         call UPDATCP 
      00824C CC 9B C3         [ 2]  490         jp UPDATLAST 
      00824F                        491 FORGET6: ; tried to forget a RAM or system word 
                                    492 ; ( ca na -- )
      00824F 1D 00 02         [ 2]  493         subw x,#CELLL 
      008252 90 BE 2A         [ 2]  494         ldw y,SP0 
      008255 FF               [ 2]  495         ldw (x),y  
      008256 CD 88 14         [ 4]  496         call ULESS
      008259 CD 84 67         [ 4]  497         call QBRAN 
      00825C 82 7F                  498         .word PROTECTED 
      00825E CD 93 3B         [ 4]  499         call ABORQ 
      008261 1D                     500         .byte 29
      008262 20 46 6F 72 20 52 41   501         .ascii " For RAM definition do REBOOT"
             4D 20 64 65 66 69 6E
             69 74 69 6F 6E 20 64
             6F 20 52 45 42 4F 4F
             54
      00827F                        502 PROTECTED:
      00827F CD 93 3B         [ 4]  503         call ABORQ
      008282 0A                     504         .byte 10
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



      008283 20 50 72 6F 74 65 63   505         .ascii " Protected"
             74 65 64
      00828D                        506 FORGET2: ; no name or not found in dictionary 
      00828D CD 93 3B         [ 4]  507         call ABORQ
      008290 05                     508         .byte 5
      008291 20 77 68 61 74         509         .ascii " what"
      008296                        510 FORGET4:
      008296 CC 85 4F         [ 2]  511         jp DROP 
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
      0082A3 CD 85 59         [ 4]  524         call DUPP ; ( na na -- )
      0082A6 CD 84 D0         [ 4]  525         CALL CAT  ; ( na c -- )
      0082A9 CD 8A 4E         [ 4]  526         call ONEP ;
      0082AC CD 87 54         [ 4]  527         CALL PLUS ; ( na c+1 -- ca ) 
      0082AF CD 8A 4E         [ 4]  528         call ONEP ; ( ca+ -- ) to get routne address 
      0082B2 CD 85 59         [ 4]  529         call DUPP ; ( ca+ ca+ -- )
      0082B5 CD 84 B2         [ 4]  530         CALL AT   ; ( ca+ fnaddr -- ) ; fnaddr is routine address 
      0082B8 CD 84 34         [ 4]  531         call DOLIT 
      0082BB 86 06                  532         .word DOVAR ; if routine address is DOVAR then variable 
      0082BD CD 87 F5         [ 4]  533         call EQUAL  ; ( ca+ fnaddr DOVAR -- ca+ T|F ) 
      0082C0 CD 84 67         [ 4]  534         call QBRAN 
      0082C3 82 D9                  535         .word FREEVAR4 
      0082C5 CD 84 34         [ 4]  536         call DOLIT 
      0082C8 00 02                  537         .word 2 
      0082CA CD 87 54         [ 4]  538         call PLUS  ; ( ca+ 2 -- da ) da is data address 
      0082CD CD 84 B2         [ 4]  539         call AT 
      0082D0 CD 86 A7         [ 4]  540         call VPP   
      0082D3 CD 84 9B         [ 4]  541         call STORE 
      0082D6 CC 9C 03         [ 2]  542         jp UPDATVP 
      0082D9                        543 FREEVAR4: ; not variable
      0082D9 CC 85 4F         [ 2]  544         jp  DROP 
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
      0083B3 CD 86 D8         [ 4]  704         call RAMLAST 
      0083B6 CD 84 B2         [ 4]  705         call AT 
      0083B9 CD 87 03         [ 4]  706         call QDUP 
      0083BC CD 84 67         [ 4]  707         call QBRAN
      0083BF 83 E2                  708         .word 1$
      0083C1 CD 93 3B         [ 4]  709         call ABORQ 
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
      008444 6E 65 78 74            782         .ascii     "next"
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
                           000000   838 .else 
                                    839 ;       EXIT    ( -- )
                                    840 ;       Terminate a colon definition.
                                    841         .word      LINK
                                    842 LINK = .
                                    843         .byte      4
                                    844         .ascii     "EXIT"
                                    845 EXIT:
                                    846         POPW Y
                                    847         RET
                                    848 .endif 
                                    849 
                                    850 ;       !       ( w a -- )
                                    851 ;       Pop  data stack to memory.
      008497 84 86                  852         .word      LINK
                           000419   853 LINK = .
      008499 01                     854         .byte      1
      00849A 21                     855         .ascii     "!"
      00849B                        856 STORE:
      00849B 90 93            [ 1]  857         LDW Y,X
      00849D 90 FE            [ 2]  858         LDW Y,(Y)    ;Y=a
      00849F 90 BF 24         [ 2]  859         LDW YTEMP,Y
      0084A2 90 93            [ 1]  860         LDW Y,X
      0084A4 90 EE 02         [ 2]  861         LDW Y,(2,Y)
      0084A7 91 CF 24         [ 5]  862         LDW [YTEMP],Y ;store w at a
      0084AA 1C 00 04         [ 2]  863         ADDW X,#4 ; DDROP 
      0084AD 81               [ 4]  864         RET     
                                    865 
                                    866 ;       @       ( a -- w )
                                    867 ;       Push memory location to stack.
      0084AE 84 99                  868         .word      LINK
                           000430   869 LINK	= 	.
      0084B0 01                     870         .byte    1
      0084B1 40                     871         .ascii	"@"
      0084B2                        872 AT:
      0084B2 90 93            [ 1]  873         LDW Y,X     ;Y = a
      0084B4 90 FE            [ 2]  874         LDW Y,(Y)   ; address 
      0084B6 90 FE            [ 2]  875         LDW Y,(Y)   ; value 
      0084B8 FF               [ 2]  876         LDW (X),Y ;w = @Y
      0084B9 81               [ 4]  877         RET     
                                    878 
                                    879 ;       C!      ( c b -- )
                                    880 ;       Pop  data stack to byte memory.
      0084BA 84 B0                  881         .word      LINK
                           00043C   882 LINK	= .
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
Hexadecimal [24-Bits]



      0084BC 02                     883         .byte      2
      0084BD 43 21                  884         .ascii     "C!"
      0084BF                        885 CSTOR:
      0084BF 90 93            [ 1]  886         LDW Y,X
      0084C1 90 FE            [ 2]  887 	LDW Y,(Y)    ;Y=b
      0084C3 E6 03            [ 1]  888         LD A,(3,X)    ;D = c
      0084C5 90 F7            [ 1]  889         LD  (Y),A     ;store c at b
      0084C7 1C 00 04         [ 2]  890 	ADDW X,#4 ; DDROP 
      0084CA 81               [ 4]  891         RET     
                                    892 
                                    893 ;       C@      ( b -- c )
                                    894 ;       Push byte in memory to  stack.
      0084CB 84 BC                  895         .word      LINK
                           00044D   896 LINK	= 	.
      0084CD 02                     897         .byte      2
      0084CE 43 40                  898         .ascii     "C@"
      0084D0                        899 CAT:
      0084D0 90 93            [ 1]  900         LDW Y,X     ;Y=b
      0084D2 90 FE            [ 2]  901         LDW Y,(Y)
      0084D4 90 F6            [ 1]  902         LD A,(Y)
      0084D6 E7 01            [ 1]  903         LD (1,X),A
      0084D8 7F               [ 1]  904         CLR (X)
      0084D9 81               [ 4]  905         RET     
                                    906 
                                    907 ;       RP@     ( -- a )
                                    908 ;       Push current RP to data stack.
      0084DA 84 CD                  909         .word      LINK
                           00045C   910 LINK	= .
      0084DC 03                     911         .byte      3
      0084DD 52 50 40               912         .ascii     "RP@"
      0084E0                        913 RPAT:
      0084E0 90 96            [ 1]  914         LDW Y,SP    ;save return addr
      0084E2 1D 00 02         [ 2]  915         SUBW X,#2
      0084E5 FF               [ 2]  916         LDW (X),Y
      0084E6 81               [ 4]  917         RET     
                                    918 
                                    919 ;       RP!     ( a -- )
                                    920 ;       Set  return stack pointer.
      0084E7 84 DC                  921         .word      LINK
                           000469   922 LINK	= 	. 
      0084E9 43                     923 	.byte      COMPO+3
      0084EA 52 50 21               924         .ascii     "RP!"
      0084ED                        925 RPSTO:
      0084ED 90 85            [ 2]  926         POPW Y
      0084EF 90 BF 24         [ 2]  927         LDW YTEMP,Y
      0084F2 90 93            [ 1]  928         LDW Y,X
      0084F4 90 FE            [ 2]  929         LDW Y,(Y)
      0084F6 90 94            [ 1]  930         LDW SP,Y
      0084F8 1C 00 02         [ 2]  931         ADDW x,#CELLL ; a was not dropped, Picatout 2020-05-24
      0084FB 92 CC 24         [ 5]  932         JP [YTEMP]
                                    933 
                                    934 ;       R>      ( -- w )
                                    935 ;       Pop return stack to data stack.
      0084FE 84 E9                  936         .word      LINK
                           000480   937 LINK	= 	. 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]



      008500 42                     938 	.byte      COMPO+2
      008501 52 3E                  939         .ascii     "R>"
      008503                        940 RFROM:
      008503 90 85            [ 2]  941         POPW Y    ;save return addr
      008505 90 BF 24         [ 2]  942         LDW YTEMP,Y
      008508 90 85            [ 2]  943         POPW Y
      00850A 1D 00 02         [ 2]  944         SUBW X,#2
      00850D FF               [ 2]  945         LDW (X),Y
      00850E 92 CC 24         [ 5]  946         JP [YTEMP]
                                    947 
                                    948 ;       R@      ( -- w )
                                    949 ;       Copy top of return stack to stack.
      008511 85 00                  950         .word      LINK
                           000493   951 LINK	= 	. 
      008513 02                     952         .byte      2
      008514 52 40                  953         .ascii     "R@"
      008516                        954 RAT:
      008516 16 03            [ 2]  955         ldw y,(3,sp)
      008518 1D 00 02         [ 2]  956         subw x,#CELLL 
      00851B FF               [ 2]  957         ldw (x),y 
      00851C 81               [ 4]  958         ret 
                                    959 
                                    960 ;       >R      ( w -- )
                                    961 ;       Push data stack to return stack.
      00851D 85 13                  962         .word      LINK
                           00049F   963 LINK	= 	. 
      00851F 42                     964 	.byte      COMPO+2
      008520 3E 52                  965         .ascii     ">R"
      008522                        966 TOR:
      008522 90 85            [ 2]  967         POPW Y    ;save return addr
      008524 90 BF 24         [ 2]  968         LDW YTEMP,Y
      008527 90 93            [ 1]  969         LDW Y,X
      008529 90 FE            [ 2]  970         LDW Y,(Y)
      00852B 90 89            [ 2]  971         PUSHW Y    ;restore return addr
      00852D 1C 00 02         [ 2]  972         ADDW X,#2
      008530 92 CC 24         [ 5]  973         JP [YTEMP]
                                    974 
                                    975 ;       SP@     ( -- a )
                                    976 ;       Push current stack pointer.
      008533 85 1F                  977         .word      LINK
                           0004B5   978 LINK	= 	. 
      008535 03                     979         .byte      3
      008536 53 50 40               980         .ascii     "SP@"
      008539                        981 SPAT:
      008539 90 93            [ 1]  982 	LDW Y,X
      00853B 1D 00 02         [ 2]  983         SUBW X,#2
      00853E FF               [ 2]  984 	LDW (X),Y
      00853F 81               [ 4]  985         RET     
                                    986 
                                    987 ;       SP!     ( a -- )
                                    988 ;       Set  data stack pointer.
      008540 85 35                  989         .word      LINK
                           0004C2   990 LINK	= 	. 
      008542 03                     991         .byte      3
      008543 53 50 21               992         .ascii     "SP!"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]



      008546                        993 SPSTO:
      008546 FE               [ 2]  994         LDW     X,(X)     ;X = a
      008547 81               [ 4]  995         RET     
                                    996 
                                    997 ;       DROP    ( w -- )
                                    998 ;       Discard top stack item.
      008548 85 42                  999         .word      LINK
                           0004CA  1000 LINK	= 	. 
      00854A 04                    1001         .byte      4
      00854B 44 52 4F 50           1002         .ascii     "DROP"
      00854F                       1003 DROP:
      00854F 1C 00 02         [ 2] 1004         ADDW X,#2     
      008552 81               [ 4] 1005         RET     
                                   1006 
                                   1007 ;       DUP     ( w -- w w )
                                   1008 ;       Duplicate  top stack item.
      008553 85 4A                 1009         .word      LINK
                           0004D5  1010 LINK	= 	. 
      008555 03                    1011         .byte      3
      008556 44 55 50              1012         .ascii     "DUP"
      008559                       1013 DUPP:
      008559 90 93            [ 1] 1014 	LDW Y,X
      00855B 1D 00 02         [ 2] 1015         SUBW X,#2
      00855E 90 FE            [ 2] 1016 	LDW Y,(Y)
      008560 FF               [ 2] 1017 	LDW (X),Y
      008561 81               [ 4] 1018         RET     
                                   1019 
                                   1020 ;       SWAP    ( w1 w2 -- w2 w1 )
                                   1021 ;       Exchange top two stack items.
      008562 85 55                 1022         .word      LINK
                           0004E4  1023 LINK	= 	. 
      008564 04                    1024         .byte      4
      008565 53 57 41 50           1025         .ascii     "SWAP"
      008569                       1026 SWAPP:
      008569 90 93            [ 1] 1027         LDW Y,X
      00856B 90 FE            [ 2] 1028         LDW Y,(Y)
      00856D 90 BF 24         [ 2] 1029         LDW YTEMP,Y
      008570 90 93            [ 1] 1030         LDW Y,X
      008572 90 EE 02         [ 2] 1031         LDW Y,(2,Y)
      008575 FF               [ 2] 1032         LDW (X),Y
      008576 90 BE 24         [ 2] 1033         LDW Y,YTEMP
      008579 EF 02            [ 2] 1034         LDW (2,X),Y
      00857B 81               [ 4] 1035         RET     
                                   1036 
                                   1037 ;       OVER    ( w1 w2 -- w1 w2 w1 )
                                   1038 ;       Copy second stack item to top.
      00857C 85 64                 1039         .word      LINK
                           0004FE  1040 LINK	= . 
      00857E 04                    1041         .byte      4
      00857F 4F 56 45 52           1042         .ascii     "OVER"
      008583                       1043 OVER:
      008583 1D 00 02         [ 2] 1044         SUBW X,#2
      008586 90 93            [ 1] 1045         LDW Y,X
      008588 90 EE 04         [ 2] 1046         LDW Y,(4,Y)
      00858B FF               [ 2] 1047         LDW (X),Y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



      00858C 81               [ 4] 1048         RET     
                                   1049 
                                   1050 ;       0<      ( n -- t )
                                   1051 ;       Return true if n is negative.
      00858D 85 7E                 1052         .word      LINK
                           00050F  1053 LINK	= . 
      00858F 02                    1054         .byte      2
      008590 30 3C                 1055         .ascii     "0<"
      008592                       1056 ZLESS:
      008592 A6 FF            [ 1] 1057         LD A,#0xFF
      008594 90 93            [ 1] 1058         LDW Y,X
      008596 90 FE            [ 2] 1059         LDW Y,(Y)
      008598 2B 01            [ 1] 1060         JRMI     ZL1
      00859A 4F               [ 1] 1061         CLR A   ;false
      00859B F7               [ 1] 1062 ZL1:    LD     (X),A
      00859C E7 01            [ 1] 1063         LD (1,X),A
      00859E 81               [ 4] 1064 	RET     
                                   1065 
                                   1066 ;       AND     ( w w -- w )
                                   1067 ;       Bitwise AND.
      00859F 85 8F                 1068         .word      LINK
                           000521  1069 LINK	= . 
      0085A1 03                    1070         .byte      3
      0085A2 41 4E 44              1071         .ascii     "AND"
      0085A5                       1072 ANDD:
      0085A5 F6               [ 1] 1073         LD  A,(X)    ;D=w
      0085A6 E4 02            [ 1] 1074         AND A,(2,X)
      0085A8 E7 02            [ 1] 1075         LD (2,X),A
      0085AA E6 01            [ 1] 1076         LD A,(1,X)
      0085AC E4 03            [ 1] 1077         AND A,(3,X)
      0085AE E7 03            [ 1] 1078         LD (3,X),A
      0085B0 1C 00 02         [ 2] 1079         ADDW X,#2
      0085B3 81               [ 4] 1080         RET
                                   1081 
                                   1082 ;       OR      ( w w -- w )
                                   1083 ;       Bitwise inclusive OR.
      0085B4 85 A1                 1084         .word      LINK
                           000536  1085 LINK = . 
      0085B6 02                    1086         .byte      2
      0085B7 4F 52                 1087         .ascii     "OR"
      0085B9                       1088 ORR:
      0085B9 F6               [ 1] 1089         LD A,(X)    ;D=w
      0085BA EA 02            [ 1] 1090         OR A,(2,X)
      0085BC E7 02            [ 1] 1091         LD (2,X),A
      0085BE E6 01            [ 1] 1092         LD A,(1,X)
      0085C0 EA 03            [ 1] 1093         OR A,(3,X)
      0085C2 E7 03            [ 1] 1094         LD (3,X),A
      0085C4 1C 00 02         [ 2] 1095         ADDW X,#2
      0085C7 81               [ 4] 1096         RET
                                   1097 
                                   1098 ;       XOR     ( w w -- w )
                                   1099 ;       Bitwise exclusive OR.
      0085C8 85 B6                 1100         .word      LINK
                           00054A  1101 LINK	= . 
      0085CA 03                    1102         .byte      3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]



      0085CB 58 4F 52              1103         .ascii     "XOR"
      0085CE                       1104 XORR:
      0085CE F6               [ 1] 1105         LD A,(X)    ;D=w
      0085CF E8 02            [ 1] 1106         XOR A,(2,X)
      0085D1 E7 02            [ 1] 1107         LD (2,X),A
      0085D3 E6 01            [ 1] 1108         LD A,(1,X)
      0085D5 E8 03            [ 1] 1109         XOR A,(3,X)
      0085D7 E7 03            [ 1] 1110         LD (3,X),A
      0085D9 1C 00 02         [ 2] 1111         ADDW X,#2
      0085DC 81               [ 4] 1112         RET
                                   1113 
                                   1114 ;       UM+     ( u u -- udsum )
                                   1115 ;       Add two unsigned single
                                   1116 ;       and return a double sum.
      0085DD 85 CA                 1117         .word      LINK
                           00055F  1118 LINK	= . 
      0085DF 03                    1119         .byte      3
      0085E0 55 4D 2B              1120         .ascii     "UM+"
      0085E3                       1121 UPLUS:
      0085E3 A6 01            [ 1] 1122         LD A,#1
      0085E5 90 93            [ 1] 1123         LDW Y,X
      0085E7 90 EE 02         [ 2] 1124         LDW Y,(2,Y)
      0085EA 90 BF 24         [ 2] 1125         LDW YTEMP,Y
      0085ED 90 93            [ 1] 1126         LDW Y,X
      0085EF 90 FE            [ 2] 1127         LDW Y,(Y)
      0085F1 72 B9 00 24      [ 2] 1128         ADDW Y,YTEMP
      0085F5 EF 02            [ 2] 1129         LDW (2,X),Y
      0085F7 25 01            [ 1] 1130         JRC     UPL1
      0085F9 4F               [ 1] 1131         CLR A
      0085FA E7 01            [ 1] 1132 UPL1:   LD     (1,X),A
      0085FC 7F               [ 1] 1133         CLR (X)
      0085FD 81               [ 4] 1134         RET
                                   1135 
                                   1136 ;; System and user variables
                                   1137 
                                   1138 ;       doVAR   ( -- a )
                                   1139 ;       Code for VARIABLE and CREATE.
      0085FE 85 DF                 1140         .word      LINK
                           000580  1141 LINK	= . 
      008600 45                    1142 	.byte      COMPO+5
      008601 44 4F 56 41 52        1143         .ascii     "DOVAR"
      008606                       1144 DOVAR:
      008606 1D 00 02         [ 2] 1145 	SUBW X,#2
      008609 90 85            [ 2] 1146         POPW Y    ;get return addr (pfa)
      00860B 90 FE            [ 2] 1147         LDW Y,(Y) ; indirect address 
      00860D FF               [ 2] 1148         LDW (X),Y    ;push on stack
      00860E 81               [ 4] 1149         RET     ;go to RET of EXEC
                                   1150 
                                   1151 ;       BASE    ( -- a )
                                   1152 ;       Radix base for numeric I/O.
      00860F 86 00                 1153         .word      LINK        
                           000591  1154 LINK = . 
      008611 04                    1155         .byte      4
      008612 42 41 53 45           1156         .ascii     "BASE"
      008616                       1157 BASE:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



      008616 90 AE 00 06      [ 2] 1158 	LDW Y,#UBASE 
      00861A 1D 00 02         [ 2] 1159 	SUBW X,#2
      00861D FF               [ 2] 1160         LDW (X),Y
      00861E 81               [ 4] 1161         RET
                                   1162 
                                   1163 ;       tmp     ( -- a )
                                   1164 ;       A temporary storage.
      00861F 86 11                 1165         .word      LINK
                                   1166         
                           0005A1  1167 LINK = . 
      008621 03                    1168 	.byte      3
      008622 54 4D 50              1169         .ascii     "TMP"
      008625                       1170 TEMP:
      008625 90 AE 00 08      [ 2] 1171 	LDW Y,#UTMP
      008629 1D 00 02         [ 2] 1172 	SUBW X,#2
      00862C FF               [ 2] 1173         LDW (X),Y
      00862D 81               [ 4] 1174         RET
                                   1175 
                                   1176 ;       >IN     ( -- a )
                                   1177 ;        Hold parsing pointer.
      00862E 86 21                 1178         .word      LINK
                           0005B0  1179 LINK = . 
      008630 03                    1180         .byte      3
      008631 3E 49 4E              1181         .ascii    ">IN"
      008634                       1182 INN:
      008634 90 AE 00 0A      [ 2] 1183 	LDW Y,#UINN 
      008638 1D 00 02         [ 2] 1184 	SUBW X,#2
      00863B FF               [ 2] 1185         LDW (X),Y
      00863C 81               [ 4] 1186         RET
                                   1187 
                                   1188 ;       #TIB    ( -- a )
                                   1189 ;       Count in terminal input buffer.
      00863D 86 30                 1190         .word      LINK
                           0005BF  1191 LINK = . 
      00863F 04                    1192         .byte      4
      008640 23 54 49 42           1193         .ascii     "#TIB"
      008644                       1194 NTIB:
      008644 90 AE 00 0C      [ 2] 1195 	LDW Y,#UCTIB 
      008648 1D 00 02         [ 2] 1196 	SUBW X,#2
      00864B FF               [ 2] 1197         LDW (X),Y
      00864C 81               [ 4] 1198         RET
                                   1199 
                                   1200 ;       TBUF ( -- a )
                                   1201 ;       address of 128 bytes transaction buffer 
      00864D 86 3F                 1202         .word LINK 
                           0005CF  1203         LINK=.
      00864F 04                    1204         .byte 4 
      008650 54 42 55 46           1205         .ascii "TBUF"
      008654                       1206 TBUF:
      008654 90 AE 16 80      [ 2] 1207         ldw y,#ROWBUFF
      008658 1D 00 02         [ 2] 1208         subw x,#CELLL
      00865B FF               [ 2] 1209         ldw (x),y 
      00865C 81               [ 4] 1210         ret 
                                   1211 
                                   1212 ; systeme variable 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]



                                   1213 ; compilation destination 
                                   1214 ; TFLASH ( -- A )
      00865D 86 4F                 1215         .word LINK 
                           0005DF  1216         LINK=.
      00865F 06                    1217         .byte 6 
      008660 54 46 4C 41 53 48     1218         .ascii "TFLASH"         
      008666                       1219 TFLASH:
      008666 1D 00 02         [ 2] 1220         subw x,#CELLL 
      008669 90 AE 00 1E      [ 2] 1221         ldw y,#UTFLASH
      00866D FF               [ 2] 1222         ldw (x),y 
      00866E 81               [ 4] 1223         ret 
                                   1224 
                                   1225 ;       "EVAL   ( -- a )
                                   1226 ;       Execution vector of EVAL.
      00866F 86 5F                 1227         .word      LINK
                           0005F1  1228 LINK = . 
      008671 05                    1229         .byte      5
      008672 27 45 56 41 4C        1230         .ascii     "'EVAL"
      008677                       1231 TEVAL:
      008677 90 AE 00 10      [ 2] 1232 	LDW Y,#UINTER 
      00867B 1D 00 02         [ 2] 1233 	SUBW X,#2
      00867E FF               [ 2] 1234         LDW (X),Y
      00867F 81               [ 4] 1235         RET
                                   1236 
                                   1237 ;       HLD     ( -- a )
                                   1238 ;       Hold a pointer of output string.
      008680 86 71                 1239         .word      LINK
                           000602  1240 LINK = . 
      008682 03                    1241         .byte      3
      008683 48 4C 44              1242         .ascii     "HLD"
      008686                       1243 HLD:
      008686 90 AE 00 12      [ 2] 1244 	LDW Y,#UHLD 
      00868A 1D 00 02         [ 2] 1245 	SUBW X,#2
      00868D FF               [ 2] 1246         LDW (X),Y
      00868E 81               [ 4] 1247         RET
                                   1248 
                                   1249 ;       CONTEXT ( -- a )
                                   1250 ;       Start vocabulary search.
      00868F 86 82                 1251         .word      LINK
                           000611  1252 LINK = . 
      008691 07                    1253         .byte      7
      008692 43 4F 4E 54 45 58 54  1254         .ascii     "CONTEXT"
      008699                       1255 CNTXT:
      008699 90 AE 00 14      [ 2] 1256 	LDW Y,#UCNTXT
      00869D 1D 00 02         [ 2] 1257 	SUBW X,#2
      0086A0 FF               [ 2] 1258         LDW (X),Y
      0086A1 81               [ 4] 1259         RET
                                   1260 
                                   1261 ;       VP      ( -- a )
                                   1262 ;       Point to top of variables
      0086A2 86 91                 1263         .word      LINK
                           000624  1264 LINK = . 
      0086A4 02                    1265         .byte      2
      0086A5 56 50                 1266         .ascii     "VP"
      0086A7                       1267 VPP:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



      0086A7 90 AE 00 16      [ 2] 1268 	LDW Y,#UVP 
      0086AB 1D 00 02         [ 2] 1269 	SUBW X,#2
      0086AE FF               [ 2] 1270         LDW (X),Y
      0086AF 81               [ 4] 1271         RET
                                   1272 
                                   1273 ;       CP    ( -- a )
                                   1274 ;       Pointer to top of FLASH 
      0086B0 86 A4                 1275         .word LINK 
                           000632  1276         LINK=.
      0086B2 02                    1277         .byte 2 
      0086B3 43 50                 1278         .ascii "CP"
      0086B5                       1279 CPP: 
      0086B5 90 AE 00 18      [ 2] 1280         ldw y,#UCP 
      0086B9 1D 00 02         [ 2] 1281         subw x,#CELLL 
      0086BC FF               [ 2] 1282         ldw (x),y 
      0086BD 81               [ 4] 1283         ret                
                                   1284 
                                   1285 ;       LAST    ( -- a )
                                   1286 ;       Point to last name in dictionary.
      0086BE 86 B2                 1287         .word      LINK
                           000640  1288 LINK = . 
      0086C0 04                    1289         .byte      4
      0086C1 4C 41 53 54           1290         .ascii     "LAST"
      0086C5                       1291 LAST:
      0086C5 90 AE 00 1A      [ 2] 1292 	LDW Y,#ULAST 
      0086C9 1D 00 02         [ 2] 1293 	SUBW X,#2
      0086CC FF               [ 2] 1294         LDW (X),Y
      0086CD 81               [ 4] 1295         RET
                                   1296 
                                   1297 ; address of system variable URLAST 
                                   1298 ;       RAMLAST ( -- a )
                                   1299 ; RAM dictionary context 
      0086CE 86 C0                 1300         .word LINK 
                           000650  1301         LINK=. 
      0086D0 07                    1302         .byte 7  
      0086D1 52 41 4D 4C 41 53 54  1303         .ascii "RAMLAST" 
      0086D8                       1304 RAMLAST: 
      0086D8 90 AE 00 20      [ 2] 1305         ldw y,#URLAST 
      0086DC 1D 00 02         [ 2] 1306         subw x,#CELLL 
      0086DF FF               [ 2] 1307         ldw (x),y 
      0086E0 81               [ 4] 1308         ret 
                                   1309 
                                   1310 ; OFFSET ( -- a )
                                   1311 ; address of system variable OFFSET 
      0086E1 86 D0                 1312         .word LINK 
                           000663  1313         LINK=.
      0086E3 06                    1314         .byte 6
      0086E4 4F 46 46 53 45 54     1315         .ascii "OFFSET" 
      0086EA                       1316 OFFSET: 
      0086EA 1D 00 02         [ 2] 1317         subw x,#CELLL
      0086ED 90 AE 00 1C      [ 2] 1318         ldw y,#UOFFSET 
      0086F1 FF               [ 2] 1319         ldw (x),y 
      0086F2 81               [ 4] 1320         ret 
                                   1321 
                                   1322 ; adjust jump address adding OFFSET
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



                                   1323 ; ADR-ADJ ( a -- a+offset )
      0086F3                       1324 ADRADJ: 
      0086F3 CD 86 EA         [ 4] 1325         call OFFSET 
      0086F6 CD 84 B2         [ 4] 1326         call AT 
      0086F9 CC 87 54         [ 2] 1327         jp PLUS 
                                   1328 
                                   1329 
                                   1330 ;; Common functions
                                   1331 
                                   1332 ;       ?DUP    ( w -- w w | 0 )
                                   1333 ;       Dup tos if its is not zero.
      0086FC 86 E3                 1334         .word      LINK
                           00067E  1335 LINK = . 
      0086FE 04                    1336         .byte      4
      0086FF 3F 44 55 50           1337         .ascii     "?DUP"
      008703                       1338 QDUP:
      008703 90 93            [ 1] 1339         LDW Y,X
      008705 90 FE            [ 2] 1340 	LDW Y,(Y)
      008707 27 04            [ 1] 1341         JREQ     QDUP1
      008709 1D 00 02         [ 2] 1342 	SUBW X,#2
      00870C FF               [ 2] 1343         LDW (X),Y
      00870D 81               [ 4] 1344 QDUP1:  RET
                                   1345 
                                   1346 ;       ROT     ( w1 w2 w3 -- w2 w3 w1 )
                                   1347 ;       Rot 3rd item to top.
      00870E 86 FE                 1348         .word      LINK
                           000690  1349 LINK = . 
      008710 03                    1350         .byte      3
      008711 52 4F 54              1351         .ascii     "ROT"
      008714                       1352 ROT:
      008714 90 93            [ 1] 1353         ldw y,x 
      008716 90 FE            [ 2] 1354         ldw y,(y)
      008718 90 89            [ 2] 1355         pushw y 
      00871A 90 93            [ 1] 1356         ldw y,x 
      00871C 90 EE 04         [ 2] 1357         ldw y,(4,y)
      00871F FF               [ 2] 1358         ldw (x),y 
      008720 90 93            [ 1] 1359         ldw y,x 
      008722 90 EE 02         [ 2] 1360         ldw y,(2,y)
      008725 EF 04            [ 2] 1361         ldw (4,x),y 
      008727 90 85            [ 2] 1362         popw y 
      008729 EF 02            [ 2] 1363         ldw (2,x),y
      00872B 81               [ 4] 1364         ret 
                                   1365 
                                   1366 ;       2DROP   ( w w -- )
                                   1367 ;       Discard two items on stack.
      00872C 87 10                 1368         .word      LINK
                           0006AE  1369 LINK = . 
      00872E 05                    1370         .byte      5
      00872F 32 44 52 4F 50        1371         .ascii     "2DROP"
      008734                       1372 DDROP:
      008734 1C 00 04         [ 2] 1373         ADDW X,#4
      008737 81               [ 4] 1374         RET
                                   1375 
                                   1376 ;       2DUP    ( w1 w2 -- w1 w2 w1 w2 )
                                   1377 ;       Duplicate top two items.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal [24-Bits]



      008738 87 2E                 1378         .word      LINK
                           0006BA  1379 LINK = . 
      00873A 04                    1380         .byte      4
      00873B 32 44 55 50           1381         .ascii     "2DUP"
      00873F                       1382 DDUP:
      00873F 1D 00 04         [ 2] 1383         SUBW X,#4
      008742 90 93            [ 1] 1384         LDW Y,X
      008744 90 EE 06         [ 2] 1385         LDW Y,(6,Y)
      008747 EF 02            [ 2] 1386         LDW (2,X),Y
      008749 90 93            [ 1] 1387         LDW Y,X
      00874B 90 EE 04         [ 2] 1388         LDW Y,(4,Y)
      00874E FF               [ 2] 1389         LDW (X),Y
      00874F 81               [ 4] 1390         RET
                                   1391 
                                   1392 ;       +       ( w w -- sum )
                                   1393 ;       Add top two items.
      008750 87 3A                 1394         .word      LINK
                           0006D2  1395 LINK = . 
      008752 01                    1396         .byte      1
      008753 2B                    1397         .ascii     "+"
      008754                       1398 PLUS:
      008754 90 93            [ 1] 1399         LDW Y,X
      008756 90 FE            [ 2] 1400         LDW Y,(Y)
      008758 90 BF 24         [ 2] 1401         LDW YTEMP,Y
      00875B 1C 00 02         [ 2] 1402         ADDW X,#2
      00875E 90 93            [ 1] 1403         LDW Y,X
      008760 90 FE            [ 2] 1404         LDW Y,(Y)
      008762 72 B9 00 24      [ 2] 1405         ADDW Y,YTEMP
      008766 FF               [ 2] 1406         LDW (X),Y
      008767 81               [ 4] 1407         RET
                                   1408 
                                   1409 ;       NOT     ( w -- w )
                                   1410 ;       One's complement of tos.
      008768 87 52                 1411         .word      LINK
                           0006EA  1412 LINK = . 
      00876A 03                    1413         .byte      3
      00876B 4E 4F 54              1414         .ascii     "NOT"
      00876E                       1415 INVER:
      00876E 90 93            [ 1] 1416         LDW Y,X
      008770 90 FE            [ 2] 1417         LDW Y,(Y)
      008772 90 53            [ 2] 1418         CPLW Y
      008774 FF               [ 2] 1419         LDW (X),Y
      008775 81               [ 4] 1420         RET
                                   1421 
                                   1422 ;       NEGATE  ( n -- -n )
                                   1423 ;       Two's complement of tos.
      008776 87 6A                 1424         .word      LINK
                           0006F8  1425 LINK = . 
      008778 06                    1426         .byte      6
      008779 4E 45 47 41 54 45     1427         .ascii     "NEGATE"
      00877F                       1428 NEGAT:
      00877F 90 93            [ 1] 1429         LDW Y,X
      008781 90 FE            [ 2] 1430         LDW Y,(Y)
      008783 90 50            [ 2] 1431         NEGW Y
      008785 FF               [ 2] 1432         LDW (X),Y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



      008786 81               [ 4] 1433         RET
                                   1434 
                                   1435 ;       DNEGATE ( d -- -d )
                                   1436 ;       Two's complement of top double.
      008787 87 78                 1437         .word      LINK
                           000709  1438 LINK = . 
      008789 07                    1439         .byte      7
      00878A 44 4E 45 47 41 54 45  1440         .ascii     "DNEGATE"
      008791                       1441 DNEGA:
      008791 90 93            [ 1] 1442         LDW Y,X
      008793 90 FE            [ 2] 1443 	LDW Y,(Y)
      008795 90 53            [ 2] 1444         CPLW Y     
      008797 90 BF 24         [ 2] 1445 	LDW YTEMP,Y
      00879A 90 93            [ 1] 1446         LDW Y,X
      00879C 90 EE 02         [ 2] 1447         LDW Y,(2,Y)
      00879F 90 53            [ 2] 1448         CPLW Y
      0087A1 72 A9 00 01      [ 2] 1449         addw y,#1
      0087A5 EF 02            [ 2] 1450         LDW (2,X),Y
      0087A7 90 BE 24         [ 2] 1451         LDW Y,YTEMP
      0087AA 24 02            [ 1] 1452         JRNC DN1 
      0087AC 90 5C            [ 2] 1453         INCW Y
      0087AE FF               [ 2] 1454 DN1:    LDW (X),Y
      0087AF 81               [ 4] 1455         RET
                                   1456 
                                   1457 
                                   1458 ;       S>D ( n -- d )
                                   1459 ; convert single integer to double 
      0087B0 87 89                 1460         .word LINK 
                           000732  1461         LINK=. 
      0087B2 03                    1462         .byte 3 
      0087B3 53 3E 44              1463         .ascii "S>D"
      0087B6                       1464 STOD: 
      0087B6 1D 00 02         [ 2] 1465         subw x,#CELLL 
      0087B9 90 5F            [ 1] 1466         clrw y 
      0087BB FF               [ 2] 1467         ldw (x),y 
      0087BC 90 93            [ 1] 1468         ldw y,x 
      0087BE 90 EE 02         [ 2] 1469         ldw y,(2,y)
      0087C1 2A 05            [ 1] 1470         jrpl 1$ 
      0087C3 90 AE FF FF      [ 2] 1471         ldw y,#-1
      0087C7 FF               [ 2] 1472         ldw (x),y 
      0087C8 81               [ 4] 1473 1$:     ret 
                                   1474 
                                   1475 
                                   1476 
                                   1477 
                                   1478 ;       -       ( n1 n2 -- n1-n2 )
                                   1479 ;       Subtraction.
      0087C9 87 B2                 1480         .word      LINK
                           00074B  1481 LINK = . 
      0087CB 01                    1482         .byte      1
      0087CC 2D                    1483         .ascii     "-"
      0087CD                       1484 SUBB:
      0087CD 90 93            [ 1] 1485         LDW Y,X
      0087CF 90 FE            [ 2] 1486         LDW Y,(Y)
      0087D1 90 BF 24         [ 2] 1487         LDW YTEMP,Y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



      0087D4 1C 00 02         [ 2] 1488         ADDW X,#2
      0087D7 90 93            [ 1] 1489         LDW Y,X
      0087D9 90 FE            [ 2] 1490         LDW Y,(Y)
      0087DB 72 B2 00 24      [ 2] 1491         SUBW Y,YTEMP
      0087DF FF               [ 2] 1492         LDW (X),Y
      0087E0 81               [ 4] 1493         RET
                                   1494 
                                   1495 ;       ABS     ( n -- n )
                                   1496 ;       Return  absolute value of n.
      0087E1 87 CB                 1497         .word      LINK
                           000763  1498 LINK = . 
      0087E3 03                    1499         .byte      3
      0087E4 41 42 53              1500         .ascii     "ABS"
      0087E7                       1501 ABSS:
      0087E7 90 93            [ 1] 1502         LDW Y,X
      0087E9 90 FE            [ 2] 1503 	LDW Y,(Y)
      0087EB 2A 03            [ 1] 1504         JRPL     AB1     ;negate:
      0087ED 90 50            [ 2] 1505         NEGW     Y     ;else negate hi byte
      0087EF FF               [ 2] 1506         LDW (X),Y
      0087F0 81               [ 4] 1507 AB1:    RET
                                   1508 
                                   1509 ;       =       ( w w -- t )
                                   1510 ;       Return true if top two are =al.
      0087F1 87 E3                 1511         .word      LINK
                           000773  1512 LINK = . 
      0087F3 01                    1513         .byte      1
      0087F4 3D                    1514         .ascii     "="
      0087F5                       1515 EQUAL:
      0087F5 A6 FF            [ 1] 1516         LD A,#0xFF  ;true
      0087F7 90 93            [ 1] 1517         LDW Y,X    ;D = n2
      0087F9 90 FE            [ 2] 1518         LDW Y,(Y)
      0087FB 90 BF 24         [ 2] 1519         LDW YTEMP,Y
      0087FE 1C 00 02         [ 2] 1520         ADDW X,#2
      008801 90 93            [ 1] 1521         LDW Y,X
      008803 90 FE            [ 2] 1522         LDW Y,(Y)
      008805 90 B3 24         [ 2] 1523         CPW Y,YTEMP     ;if n2 <> n1
      008808 27 01            [ 1] 1524         JREQ     EQ1
      00880A 4F               [ 1] 1525         CLR A
      00880B F7               [ 1] 1526 EQ1:    LD (X),A
      00880C E7 01            [ 1] 1527         LD (1,X),A
      00880E 81               [ 4] 1528 	RET     
                                   1529 
                                   1530 ;       U<      ( u u -- t )
                                   1531 ;       Unsigned compare of top two items.
      00880F 87 F3                 1532         .word      LINK
                           000791  1533 LINK = . 
      008811 02                    1534         .byte      2
      008812 55 3C                 1535         .ascii     "U<"
      008814                       1536 ULESS:
      008814 A6 FF            [ 1] 1537         LD A,#0xFF  ;true
      008816 90 93            [ 1] 1538         LDW Y,X    ;D = n2
      008818 90 FE            [ 2] 1539         LDW Y,(Y)
      00881A 90 BF 24         [ 2] 1540         LDW YTEMP,Y
      00881D 1C 00 02         [ 2] 1541         ADDW X,#2
      008820 90 93            [ 1] 1542         LDW Y,X
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



      008822 90 FE            [ 2] 1543         LDW Y,(Y)
      008824 90 B3 24         [ 2] 1544         CPW Y,YTEMP     ;if n2 <> n1
      008827 25 01            [ 1] 1545         JRULT     ULES1
      008829 4F               [ 1] 1546         CLR A
      00882A F7               [ 1] 1547 ULES1:  LD (X),A
      00882B E7 01            [ 1] 1548         LD (1,X),A
      00882D 81               [ 4] 1549 	RET     
                                   1550 
                                   1551 ;       <       ( n1 n2 -- t )
                                   1552 ;       Signed compare of top two items.
      00882E 88 11                 1553         .word      LINK
                           0007B0  1554 LINK = . 
      008830 01                    1555         .byte      1
      008831 3C                    1556         .ascii     "<"
      008832                       1557 LESS:
      008832 A6 FF            [ 1] 1558         LD A,#0xFF  ;true
      008834 90 93            [ 1] 1559         LDW Y,X    ;D = n2
      008836 90 FE            [ 2] 1560         LDW Y,(Y)
      008838 90 BF 24         [ 2] 1561         LDW YTEMP,Y
      00883B 1C 00 02         [ 2] 1562         ADDW X,#2
      00883E 90 93            [ 1] 1563         LDW Y,X
      008840 90 FE            [ 2] 1564         LDW Y,(Y)
      008842 90 B3 24         [ 2] 1565         CPW Y,YTEMP     ;if n2 <> n1
      008845 2F 01            [ 1] 1566         JRSLT     LT1
      008847 4F               [ 1] 1567         CLR A
      008848 F7               [ 1] 1568 LT1:    LD (X),A
      008849 E7 01            [ 1] 1569         LD (1,X),A
      00884B 81               [ 4] 1570 	RET     
                                   1571 
                                   1572 ;       MAX     ( n n -- n )
                                   1573 ;       Return greater of two top items.
      00884C 88 30                 1574         .word      LINK
                           0007CE  1575 LINK = . 
      00884E 03                    1576         .byte      3
      00884F 4D 41 58              1577         .ascii     "MAX"
      008852                       1578 MAX:
      008852 90 93            [ 1] 1579         LDW Y,X    ;D = n2
      008854 90 EE 02         [ 2] 1580         LDW Y,(2,Y)
      008857 90 BF 24         [ 2] 1581         LDW YTEMP,Y
      00885A 90 93            [ 1] 1582         LDW Y,X
      00885C 90 FE            [ 2] 1583         LDW Y,(Y)
      00885E 90 B3 24         [ 2] 1584         CPW Y,YTEMP     ;if n2 <> n1
      008861 2F 02            [ 1] 1585         JRSLT     MAX1
      008863 EF 02            [ 2] 1586         LDW (2,X),Y
      008865 1C 00 02         [ 2] 1587 MAX1:   ADDW X,#2
      008868 81               [ 4] 1588 	RET     
                                   1589 
                                   1590 ;       MIN     ( n n -- n )
                                   1591 ;       Return smaller of top two items.
      008869 88 4E                 1592         .word      LINK
                           0007EB  1593 LINK = . 
      00886B 03                    1594         .byte      3
      00886C 4D 49 4E              1595         .ascii     "MIN"
      00886F                       1596 MIN:
      00886F 90 93            [ 1] 1597         LDW Y,X    ;D = n2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



      008871 90 EE 02         [ 2] 1598         LDW Y,(2,Y)
      008874 90 BF 24         [ 2] 1599         LDW YTEMP,Y
      008877 90 93            [ 1] 1600         LDW Y,X
      008879 90 FE            [ 2] 1601         LDW Y,(Y)
      00887B 90 B3 24         [ 2] 1602         CPW Y,YTEMP     ;if n2 <> n1
      00887E 2C 02            [ 1] 1603         JRSGT     MIN1
      008880 EF 02            [ 2] 1604         LDW (2,X),Y
      008882 1C 00 02         [ 2] 1605 MIN1:	ADDW X,#2
      008885 81               [ 4] 1606 	RET     
                                   1607 
                                   1608 ;       WITHIN  ( u ul uh -- t )
                                   1609 ;       Return true if u is within
                                   1610 ;       range of ul and uh. ( ul <= u < uh )
      008886 88 6B                 1611         .word      LINK
                           000808  1612 LINK = . 
      008888 06                    1613         .byte      6
      008889 57 49 54 48 49 4E     1614         .ascii     "WITHIN"
      00888F                       1615 WITHI:
      00888F CD 85 83         [ 4] 1616         CALL     OVER
      008892 CD 87 CD         [ 4] 1617         CALL     SUBB
      008895 CD 85 22         [ 4] 1618         CALL     TOR
      008898 CD 87 CD         [ 4] 1619         CALL     SUBB
      00889B CD 85 03         [ 4] 1620         CALL     RFROM
      00889E CC 88 14         [ 2] 1621         JP     ULESS
                                   1622 
                                   1623 ;; Divide
                                   1624 
                                   1625 ;       UM/MOD  ( udl udh un -- ur uq )
                                   1626 ;       Unsigned divide of a double by a
                                   1627 ;       single. Return mod and quotient.
      0088A1 88 88                 1628         .word      LINK
                           000823  1629 LINK = . 
      0088A3 06                    1630         .byte      6
      0088A4 55 4D 2F 4D 4F 44     1631         .ascii     "UM/MOD"
      0088AA                       1632 UMMOD:
      0088AA BF 22            [ 2] 1633 	LDW XTEMP,X	; save stack pointer
      0088AC FE               [ 2] 1634 	LDW X,(X)	; un
      0088AD BF 24            [ 2] 1635 	LDW YTEMP,X     ; save un
      0088AF 90 BE 22         [ 2] 1636 	LDW Y,XTEMP	; stack pointer
      0088B2 90 EE 04         [ 2] 1637 	LDW Y,(4,Y)     ; Y=udl
      0088B5 BE 22            [ 2] 1638 	LDW X,XTEMP
      0088B7 EE 02            [ 2] 1639 	LDW X,(2,X)	; X=udh
      0088B9 B3 24            [ 2] 1640 	CPW X,YTEMP
      0088BB 23 0F            [ 2] 1641 	JRULE MMSM1
      0088BD BE 22            [ 2] 1642 	LDW X,XTEMP
      0088BF 1C 00 02         [ 2] 1643 	ADDW X,#2	; pop off 1 level
      0088C2 90 AE FF FF      [ 2] 1644 	LDW Y,#0xFFFF
      0088C6 FF               [ 2] 1645 	LDW (X),Y
      0088C7 90 5F            [ 1] 1646 	CLRW Y
      0088C9 EF 02            [ 2] 1647 	LDW (2,X),Y
      0088CB 81               [ 4] 1648 	RET
      0088CC                       1649 MMSM1:
                                   1650 ; take advantage of divw x,y when udh==0
      0088CC 5D               [ 2] 1651         tnzw x  ; is udh==0?
      0088CD 26 11            [ 1] 1652         jrne MMSM2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



      0088CF 93               [ 1] 1653         ldw x,y    ;udl 
      0088D0 90 BE 24         [ 2] 1654         ldw y,YTEMP ; divisor 
      0088D3 65               [ 2] 1655         divw x,y 
      0088D4 89               [ 2] 1656         pushw x     ; quotient 
      0088D5 BE 22            [ 2] 1657         ldw x,XTEMP 
      0088D7 1C 00 02         [ 2] 1658         addw x,#CELLL 
      0088DA EF 02            [ 2] 1659         ldw (2,x),y  ; ur
      0088DC 90 85            [ 2] 1660         popw y 
      0088DE FF               [ 2] 1661         ldw (x),y ; uq 
      0088DF 81               [ 4] 1662         ret 
      0088E0                       1663 MMSM2:        
      0088E0 A6 11            [ 1] 1664 	LD A,#17	; loop count
      0088E2                       1665 MMSM3:
      0088E2 B3 24            [ 2] 1666 	CPW X,YTEMP	; compare udh to un
      0088E4 25 04            [ 1] 1667 	JRULT MMSM4	; can't subtract
      0088E6 72 B0 00 24      [ 2] 1668 	SUBW X,YTEMP	; can subtract
      0088EA                       1669 MMSM4:
      0088EA 8C               [ 1] 1670 	CCF	; quotient bit
      0088EB 90 59            [ 2] 1671 	RLCW Y	; rotate into quotient
      0088ED 59               [ 2] 1672 	RLCW X	; rotate into remainder
      0088EE 4A               [ 1] 1673 	DEC A	; repeat
      0088EF 22 F1            [ 1] 1674 	JRUGT MMSM3
      0088F1 56               [ 2] 1675         RRCW X 
      0088F2 BF 24            [ 2] 1676 	LDW YTEMP,X	; done, save remainder
      0088F4 BE 22            [ 2] 1677 	LDW X,XTEMP
      0088F6 1C 00 02         [ 2] 1678 	ADDW X,#2	; drop
      0088F9 FF               [ 2] 1679 	LDW (X),Y
      0088FA 90 BE 24         [ 2] 1680 	LDW Y,YTEMP	; save quotient
      0088FD EF 02            [ 2] 1681 	LDW (2,X),Y
      0088FF 81               [ 4] 1682 	RET
                                   1683 	
                                   1684 ;       M/MOD   ( d n -- r q )
                                   1685 ;       Signed floored divide of double by
                                   1686 ;       single. Return mod and quotient.
      008900 88 A3                 1687         .word      LINK
                           000882  1688 LINK = . 
      008902 05                    1689         .byte      5
      008903 4D 2F 4D 4F 44        1690         .ascii     "M/MOD"
      008908                       1691 MSMOD:  
      008908 CD 85 59         [ 4] 1692         CALL	DUPP
      00890B CD 85 92         [ 4] 1693         CALL	ZLESS
      00890E CD 85 59         [ 4] 1694         CALL	DUPP
      008911 CD 85 22         [ 4] 1695         CALL	TOR
      008914 CD 84 67         [ 4] 1696         CALL	QBRAN
      008917 89 25                 1697         .word	MMOD1
      008919 CD 87 7F         [ 4] 1698         CALL	NEGAT
      00891C CD 85 22         [ 4] 1699         CALL	TOR
      00891F CD 87 91         [ 4] 1700         CALL	DNEGA
      008922 CD 85 03         [ 4] 1701         CALL	RFROM
      008925 CD 85 22         [ 4] 1702 MMOD1:	CALL	TOR
      008928 CD 85 59         [ 4] 1703         CALL	DUPP
      00892B CD 85 92         [ 4] 1704         CALL	ZLESS
      00892E CD 84 67         [ 4] 1705         CALL	QBRAN
      008931 89 39                 1706         .word	MMOD2
      008933 CD 85 16         [ 4] 1707         CALL	RAT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



      008936 CD 87 54         [ 4] 1708         CALL	PLUS
      008939 CD 85 03         [ 4] 1709 MMOD2:	CALL	RFROM
      00893C CD 88 AA         [ 4] 1710         CALL	UMMOD
      00893F CD 85 03         [ 4] 1711         CALL	RFROM
      008942 CD 84 67         [ 4] 1712         CALL	QBRAN
      008945 89 50                 1713         .word	MMOD3
      008947 CD 85 69         [ 4] 1714         CALL	SWAPP
      00894A CD 87 7F         [ 4] 1715         CALL	NEGAT
      00894D CD 85 69         [ 4] 1716         CALL	SWAPP
      008950 81               [ 4] 1717 MMOD3:	RET
                                   1718 
                                   1719 ;       /MOD    ( n n -- r q )
                                   1720 ;       Signed divide. Return mod and quotient.
      008951 89 02                 1721         .word      LINK
                           0008D3  1722 LINK = . 
      008953 04                    1723         .byte      4
      008954 2F 4D 4F 44           1724         .ascii     "/MOD"
      008958                       1725 SLMOD:
      008958 CD 85 83         [ 4] 1726         CALL	OVER
      00895B CD 85 92         [ 4] 1727         CALL	ZLESS
      00895E CD 85 69         [ 4] 1728         CALL	SWAPP
      008961 CC 89 08         [ 2] 1729         JP	MSMOD
                                   1730 
                                   1731 ;       MOD     ( n n -- r )
                                   1732 ;       Signed divide. Return mod only.
      008964 89 53                 1733         .word      LINK
                           0008E6  1734 LINK = . 
      008966 03                    1735         .byte      3
      008967 4D 4F 44              1736         .ascii     "MOD"
      00896A                       1737 MODD:
      00896A CD 89 58         [ 4] 1738 	CALL	SLMOD
      00896D CC 85 4F         [ 2] 1739 	JP	DROP
                                   1740 
                                   1741 ;       /       ( n n -- q )
                                   1742 ;       Signed divide. Return quotient only.
      008970 89 66                 1743         .word      LINK
                           0008F2  1744 LINK = . 
      008972 01                    1745         .byte      1
      008973 2F                    1746         .ascii     "/"
      008974                       1747 SLASH:
      008974 CD 89 58         [ 4] 1748         CALL	SLMOD
      008977 CD 85 69         [ 4] 1749         CALL	SWAPP
      00897A CC 85 4F         [ 2] 1750         JP	DROP
                                   1751 
                                   1752 ;; Multiply
                                   1753 
                                   1754 ;       UM*     ( u u -- ud )
                                   1755 ;       Unsigned multiply. Return double product.
      00897D 89 72                 1756         .word      LINK
                           0008FF  1757 LINK = . 
      00897F 03                    1758         .byte      3
      008980 55 4D 2A              1759         .ascii     "UM*"
      008983                       1760 UMSTA:	; stack have 4 bytes u1=a,b u2=c,d
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
      008983 90 5F            [ 1] 1775         clrw y 
      008985 90 89            [ 2] 1776         pushw y  ; bits 15..0
      008987 90 89            [ 2] 1777         pushw y  ; bits 31..16 
      008989 E6 03            [ 1] 1778         ld a,(db,x) ; b 
      00898B 90 97            [ 1] 1779         ld yl,a 
      00898D E6 01            [ 1] 1780         ld a,(dd,x)   ; d
      00898F 90 42            [ 4] 1781         mul y,a    ; b*d  
      008991 17 03            [ 2] 1782         ldw (UD3,sp),y ; lowest weight product 
      008993 E6 03            [ 1] 1783         ld a,(db,x)
      008995 90 97            [ 1] 1784         ld yl,a 
      008997 E6 00            [ 1] 1785         ld a,(dc,x)
      008999 90 42            [ 4] 1786         mul y,a  ; b*c 
                                   1787         ;;; do the partial sum 
      00899B 72 F9 02         [ 2] 1788         addw y,(UD2,sp)
      00899E 4F               [ 1] 1789         clr a 
      00899F 49               [ 1] 1790         rlc a
      0089A0 6B 01            [ 1] 1791         ld (UD1,sp),a 
      0089A2 17 02            [ 2] 1792         ldw (UD2,sp),y 
      0089A4 E6 02            [ 1] 1793         ld a,(da,x)
      0089A6 90 97            [ 1] 1794         ld yl,a 
      0089A8 E6 01            [ 1] 1795         ld a,(dd,x)
      0089AA 90 42            [ 4] 1796         mul y,a   ; a*d 
                                   1797         ;; do partial sum 
      0089AC 72 F9 02         [ 2] 1798         addw y,(UD2,sp)
      0089AF 4F               [ 1] 1799         clr a 
      0089B0 19 01            [ 1] 1800         adc a,(UD1,sp)
      0089B2 6B 01            [ 1] 1801         ld (UD1,sp),a  
      0089B4 17 02            [ 2] 1802         ldw (UD2,sp),y 
      0089B6 E6 02            [ 1] 1803         ld a,(da,x)
      0089B8 90 97            [ 1] 1804         ld yl,a 
      0089BA E6 00            [ 1] 1805         ld a,(dc,x)
      0089BC 90 42            [ 4] 1806         mul y,a  ;  a*c highest weight product 
                                   1807         ;;; do partial sum 
      0089BE 72 F9 01         [ 2] 1808         addw y,(UD1,sp)
      0089C1 FF               [ 2] 1809         ldw (x),y  ; udh 
      0089C2 16 03            [ 2] 1810         ldw y,(UD3,sp)
      0089C4 EF 02            [ 2] 1811         ldw (2,x),y  ; udl  
      0089C6 5B 04            [ 2] 1812         addw sp,#4 ; drop local variable 
      0089C8 81               [ 4] 1813         ret  
                                   1814 
                                   1815 
                                   1816 ;       *       ( n n -- n )
                                   1817 ;       Signed multiply. Return single product.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



      0089C9 89 7F                 1818         .word      LINK
                           00094B  1819 LINK = . 
      0089CB 01                    1820         .byte      1
      0089CC 2A                    1821         .ascii     "*"
      0089CD                       1822 STAR:
      0089CD CD 89 83         [ 4] 1823 	CALL	UMSTA
      0089D0 CC 85 4F         [ 2] 1824 	JP	DROP
                                   1825 
                                   1826 ;       M*      ( n n -- d )
                                   1827 ;       Signed multiply. Return double product.
      0089D3 89 CB                 1828         .word      LINK
                           000955  1829 LINK = . 
      0089D5 02                    1830         .byte      2
      0089D6 4D 2A                 1831         .ascii     "M*"
      0089D8                       1832 MSTAR:      
      0089D8 CD 87 3F         [ 4] 1833         CALL	DDUP
      0089DB CD 85 CE         [ 4] 1834         CALL	XORR
      0089DE CD 85 92         [ 4] 1835         CALL	ZLESS
      0089E1 CD 85 22         [ 4] 1836         CALL	TOR
      0089E4 CD 87 E7         [ 4] 1837         CALL	ABSS
      0089E7 CD 85 69         [ 4] 1838         CALL	SWAPP
      0089EA CD 87 E7         [ 4] 1839         CALL	ABSS
      0089ED CD 89 83         [ 4] 1840         CALL	UMSTA
      0089F0 CD 85 03         [ 4] 1841         CALL	RFROM
      0089F3 CD 84 67         [ 4] 1842         CALL	QBRAN
      0089F6 89 FB                 1843         .word	MSTA1
      0089F8 CD 87 91         [ 4] 1844         CALL	DNEGA
      0089FB 81               [ 4] 1845 MSTA1:	RET
                                   1846 
                                   1847 ;       */MOD   ( n1 n2 n3 -- r q )
                                   1848 ;       Multiply n1 and n2, then divide
                                   1849 ;       by n3. Return mod and quotient.
      0089FC 89 D5                 1850         .word      LINK
                           00097E  1851 LINK = . 
      0089FE 05                    1852         .byte      5
      0089FF 2A 2F 4D 4F 44        1853         .ascii     "*/MOD"
      008A04                       1854 SSMOD:
      008A04 CD 85 22         [ 4] 1855         CALL     TOR
      008A07 CD 89 D8         [ 4] 1856         CALL     MSTAR
      008A0A CD 85 03         [ 4] 1857         CALL     RFROM
      008A0D CC 89 08         [ 2] 1858         JP     MSMOD
                                   1859 
                                   1860 ;       */      ( n1 n2 n3 -- q )
                                   1861 ;       Multiply n1 by n2, then divide
                                   1862 ;       by n3. Return quotient only.
      008A10 89 FE                 1863         .word      LINK
                           000992  1864 LINK = . 
      008A12 02                    1865         .byte      2
      008A13 2A 2F                 1866         .ascii     "*/"
      008A15                       1867 STASL:
      008A15 CD 8A 04         [ 4] 1868         CALL	SSMOD
      008A18 CD 85 69         [ 4] 1869         CALL	SWAPP
      008A1B CC 85 4F         [ 2] 1870         JP	DROP
                                   1871 
                                   1872 ;; Miscellaneous
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



                                   1873 
                                   1874 ;       CELL+   ( a -- a )
                                   1875 ;       Add cell size in byte to address.
      008A1E 8A 12                 1876         .word      LINK
                           0009A0  1877 LINK = . 
      008A20 02                    1878         .byte       2
      008A21 32 2B                 1879         .ascii     "2+"
      008A23                       1880 CELLP:
      008A23 90 93            [ 1] 1881         LDW Y,X
      008A25 90 FE            [ 2] 1882 	LDW Y,(Y)
      008A27 72 A9 00 02      [ 2] 1883         ADDW Y,#CELLL 
      008A2B FF               [ 2] 1884         LDW (X),Y
      008A2C 81               [ 4] 1885         RET
                                   1886 
                                   1887 ;       CELL-   ( a -- a )
                                   1888 ;       Subtract 2 from address.
      008A2D 8A 20                 1889         .word      LINK
                           0009AF  1890 LINK = . 
      008A2F 02                    1891         .byte       2
      008A30 32 2D                 1892         .ascii     "2-"
      008A32                       1893 CELLM:
      008A32 90 93            [ 1] 1894         LDW Y,X
      008A34 90 FE            [ 2] 1895 	LDW Y,(Y)
      008A36 72 A2 00 02      [ 2] 1896         SUBW Y,#CELLL
      008A3A FF               [ 2] 1897         LDW (X),Y
      008A3B 81               [ 4] 1898         RET
                                   1899 
                                   1900 ;       CELLS   ( n -- n )
                                   1901 ;       Multiply tos by 2.
      008A3C 8A 2F                 1902         .word      LINK
                           0009BE  1903 LINK = . 
      008A3E 02                    1904         .byte       2
      008A3F 32 2A                 1905         .ascii     "2*"
      008A41                       1906 CELLS:
      008A41 90 93            [ 1] 1907         LDW Y,X
      008A43 90 FE            [ 2] 1908 	LDW Y,(Y)
      008A45 90 58            [ 2] 1909         SLAW Y
      008A47 FF               [ 2] 1910         LDW (X),Y
      008A48 81               [ 4] 1911         RET
                                   1912 
                                   1913 ;       1+      ( a -- a )
                                   1914 ;       Add cell size in byte to address.
      008A49 8A 3E                 1915         .word      LINK
                           0009CB  1916 LINK = . 
      008A4B 02                    1917         .byte      2
      008A4C 31 2B                 1918         .ascii     "1+"
      008A4E                       1919 ONEP:
      008A4E 90 93            [ 1] 1920         LDW Y,X
      008A50 90 FE            [ 2] 1921 	LDW Y,(Y)
      008A52 90 5C            [ 2] 1922         INCW Y
      008A54 FF               [ 2] 1923         LDW (X),Y
      008A55 81               [ 4] 1924         RET
                                   1925 
                                   1926 ;       1-      ( a -- a )
                                   1927 ;       Subtract 2 from address.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



      008A56 8A 4B                 1928         .word      LINK
                           0009D8  1929 LINK = . 
      008A58 02                    1930         .byte      2
      008A59 31 2D                 1931         .ascii     "1-"
      008A5B                       1932 ONEM:
      008A5B 90 93            [ 1] 1933         LDW Y,X
      008A5D 90 FE            [ 2] 1934 	LDW Y,(Y)
      008A5F 90 5A            [ 2] 1935         DECW Y
      008A61 FF               [ 2] 1936         LDW (X),Y
      008A62 81               [ 4] 1937         RET
                                   1938 
                                   1939 ;  shift left n times 
                                   1940 ; LSHIFT ( n1 n2 -- n1<<n2 )
      008A63 8A 58                 1941         .word LINK 
                           0009E5  1942         LINK=.
      008A65 06                    1943         .byte 6 
      008A66 4C 53 48 49 46 54     1944         .ascii "LSHIFT"
      008A6C                       1945 LSHIFT:
      008A6C E6 01            [ 1] 1946         ld a,(1,x)
      008A6E 1C 00 02         [ 2] 1947         addw x,#CELLL 
      008A71 90 93            [ 1] 1948         ldw y,x 
      008A73 90 FE            [ 2] 1949         ldw y,(y)
      008A75                       1950 LSHIFT1:
      008A75 4D               [ 1] 1951         tnz a 
      008A76 27 05            [ 1] 1952         jreq LSHIFT4 
      008A78 90 58            [ 2] 1953         sllw y 
      008A7A 4A               [ 1] 1954         dec a 
      008A7B 20 F8            [ 2] 1955         jra LSHIFT1 
      008A7D                       1956 LSHIFT4:
      008A7D FF               [ 2] 1957         ldw (x),y 
      008A7E 81               [ 4] 1958         ret 
                                   1959 
                                   1960 ; shift right n times                 
                                   1961 ; RSHIFT (n1 n2 -- n1>>n2 )
      008A7F 8A 65                 1962         .word LINK 
                           000A01  1963         LINK=.
      008A81 06                    1964         .byte 6
      008A82 52 53 48 49 46 54     1965         .ascii "RSHIFT"
      008A88                       1966 RSHIFT:
      008A88 E6 01            [ 1] 1967         ld a,(1,x)
      008A8A 1C 00 02         [ 2] 1968         addw x,#CELLL 
      008A8D 90 93            [ 1] 1969         ldw y,x 
      008A8F 90 FE            [ 2] 1970         ldw y,(y)
      008A91                       1971 RSHIFT1:
      008A91 4D               [ 1] 1972         tnz a 
      008A92 27 05            [ 1] 1973         jreq RSHIFT4 
      008A94 90 54            [ 2] 1974         srlw y 
      008A96 4A               [ 1] 1975         dec a 
      008A97 20 F8            [ 2] 1976         jra RSHIFT1 
      008A99                       1977 RSHIFT4:
      008A99 FF               [ 2] 1978         ldw (x),y 
      008A9A 81               [ 4] 1979         ret 
                                   1980 
                                   1981 
                                   1982 ;       2/      ( n -- n )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



                                   1983 ;       divide  tos by 2.
      008A9B 8A 81                 1984         .word      LINK
                           000A1D  1985 LINK = . 
      008A9D 02                    1986         .byte      2
      008A9E 32 2F                 1987         .ascii     "2/"
      008AA0                       1988 TWOSL:
      008AA0 90 93            [ 1] 1989         LDW Y,X
      008AA2 90 FE            [ 2] 1990 	LDW Y,(Y)
      008AA4 90 57            [ 2] 1991         SRAW Y
      008AA6 FF               [ 2] 1992         LDW (X),Y
      008AA7 81               [ 4] 1993         RET
                                   1994 
                                   1995 ;       BL      ( -- 32 )
                                   1996 ;       Return 32,  blank character.
      008AA8 8A 9D                 1997         .word      LINK
                           000A2A  1998 LINK = . 
      008AAA 02                    1999         .byte      2
      008AAB 42 4C                 2000         .ascii     "BL"
      008AAD                       2001 BLANK:
      008AAD 1D 00 02         [ 2] 2002         SUBW X,#2
      008AB0 90 AE 00 20      [ 2] 2003 	LDW Y,#32
      008AB4 FF               [ 2] 2004         LDW (X),Y
      008AB5 81               [ 4] 2005         RET
                                   2006 
                                   2007 ;         0     ( -- 0)
                                   2008 ;         Return 0.
      008AB6 8A AA                 2009         .word      LINK
                           000A38  2010 LINK = . 
      008AB8 01                    2011         .byte       1
      008AB9 30                    2012         .ascii     "0"
      008ABA                       2013 ZERO:
      008ABA 1D 00 02         [ 2] 2014         SUBW X,#2
      008ABD 90 5F            [ 1] 2015 	CLRW Y
      008ABF FF               [ 2] 2016         LDW (X),Y
      008AC0 81               [ 4] 2017         RET
                                   2018 
                                   2019 ;         1     ( -- 1)
                                   2020 ;         Return 1.
      008AC1 8A B8                 2021         .word      LINK
                           000A43  2022 LINK = . 
      008AC3 01                    2023         .byte       1
      008AC4 31                    2024         .ascii     "1"
      008AC5                       2025 ONE:
      008AC5 1D 00 02         [ 2] 2026         SUBW X,#2
      008AC8 90 AE 00 01      [ 2] 2027 	LDW Y,#1
      008ACC FF               [ 2] 2028         LDW (X),Y
      008ACD 81               [ 4] 2029         RET
                                   2030 
                                   2031 ;         -1    ( -- -1)
                                   2032 ;         Return 32,  blank character.
      008ACE 8A C3                 2033         .word      LINK
                           000A50  2034 LINK = . 
      008AD0 02                    2035         .byte       2
      008AD1 2D 31                 2036         .ascii     "-1"
      008AD3                       2037 MONE:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



      008AD3 1D 00 02         [ 2] 2038         SUBW X,#2
      008AD6 90 AE FF FF      [ 2] 2039 	LDW Y,#0xFFFF
      008ADA FF               [ 2] 2040         LDW (X),Y
      008ADB 81               [ 4] 2041         RET
                                   2042 
                                   2043 ;       >CHAR   ( c -- c )
                                   2044 ;       Filter non-printing characters.
      008ADC 8A D0                 2045         .word      LINK
                           000A5E  2046 LINK = . 
      008ADE 05                    2047         .byte      5
      008ADF 3E 43 48 41 52        2048         .ascii     ">CHAR"
      008AE4                       2049 TCHAR:
      008AE4 E6 01            [ 1] 2050         ld a,(1,x)
      008AE6 A1 20            [ 1] 2051         cp a,#32  
      008AE8 2B 05            [ 1] 2052         jrmi 1$ 
      008AEA A1 7F            [ 1] 2053         cp a,#127 
      008AEC 2A 01            [ 1] 2054         jrpl 1$ 
      008AEE 81               [ 4] 2055         ret 
      008AEF A6 5F            [ 1] 2056 1$:     ld a,#'_ 
      008AF1 E7 01            [ 1] 2057         ld (1,x),a 
      008AF3 81               [ 4] 2058         ret 
                                   2059 
                                   2060 ;       DEPTH   ( -- n )
                                   2061 ;       Return  depth of  data stack.
      008AF4 8A DE                 2062         .word      LINK
                           000A76  2063 LINK = . 
      008AF6 05                    2064         .byte      5
      008AF7 44 45 50 54 48        2065         .ascii     "DEPTH"
      008AFC                       2066 DEPTH: 
      008AFC 90 BE 2A         [ 2] 2067         LDW Y,SP0    ;save data stack ptr
      008AFF BF 22            [ 2] 2068 	LDW XTEMP,X
      008B01 72 B2 00 22      [ 2] 2069         SUBW Y,XTEMP     ;#bytes = SP0 - X
      008B05 90 57            [ 2] 2070         SRAW Y    ;Y = #stack items
      008B07 1D 00 02         [ 2] 2071 	SUBW X,#2
      008B0A FF               [ 2] 2072         LDW (X),Y     ; if neg, underflow
      008B0B 81               [ 4] 2073         RET
                                   2074 
                                   2075 ;       PICK    ( ... +n -- ... w )
                                   2076 ;       Copy  nth stack item to tos.
      008B0C 8A F6                 2077         .word      LINK
                           000A8E  2078 LINK = . 
      008B0E 04                    2079         .byte      4
      008B0F 50 49 43 4B           2080         .ascii     "PICK"
      008B13                       2081 PICK:
      008B13 90 93            [ 1] 2082         LDW Y,X   ;D = n1
      008B15 90 FE            [ 2] 2083         LDW Y,(Y)
                                   2084 ; modified for standard compliance          
                                   2085 ; 0 PICK must be equivalent to DUP 
      008B17 90 5C            [ 2] 2086         INCW Y 
      008B19 90 58            [ 2] 2087         SLAW Y
      008B1B BF 22            [ 2] 2088         LDW XTEMP,X
      008B1D 72 B9 00 22      [ 2] 2089         ADDW Y,XTEMP
      008B21 90 FE            [ 2] 2090         LDW Y,(Y)
      008B23 FF               [ 2] 2091         LDW (X),Y
      008B24 81               [ 4] 2092         RET
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



                                   2093 
                                   2094 ;; Memory access
                                   2095 
                                   2096 ;       +!      ( n a -- )
                                   2097 ;       Add n to  contents at address a.
      008B25 8B 0E                 2098         .word      LINK
                           000AA7  2099 LINK = . 
      008B27 02                    2100         .byte      2
      008B28 2B 21                 2101         .ascii     "+!"
      008B2A                       2102 PSTOR:
      008B2A 90 93            [ 1] 2103         ldw y,x 
      008B2C 90 FE            [ 2] 2104         ldw y,(y)
      008B2E 90 BF 24         [ 2] 2105         ldw YTEMP,y  ; address
      008B31 90 FE            [ 2] 2106         ldw y,(y)  
      008B33 90 89            [ 2] 2107         pushw y  ; value at address 
      008B35 90 93            [ 1] 2108         ldw y,x 
      008B37 90 EE 02         [ 2] 2109         ldw y,(2,y) ; n 
      008B3A 72 F9 01         [ 2] 2110         addw y,(1,sp) ; n+value
      008B3D 91 CF 24         [ 5] 2111         ldw [YTEMP],y ;  a!
      008B40 90 85            [ 2] 2112         popw y    ;drop local var
      008B42 1C 00 04         [ 2] 2113         addw x,#4 ; DDROP 
      008B45 81               [ 4] 2114         ret 
                                   2115 
                                   2116 ;       2!      ( d a -- )
                                   2117 ;       Store  double integer to address a.
      008B46 8B 27                 2118         .word      LINK
                           000AC8  2119 LINK = . 
      008B48 02                    2120         .byte      2
      008B49 32 21                 2121         .ascii     "2!"
      008B4B                       2122 DSTOR:
      008B4B 90 93            [ 1] 2123         ldw y,x 
      008B4D 90 FE            [ 2] 2124         ldw y,(y)
      008B4F 90 BF 24         [ 2] 2125         ldw YTEMP,y ; address 
      008B52 1C 00 02         [ 2] 2126         addw x,#CELLL ; drop a 
      008B55 90 93            [ 1] 2127         ldw y,x 
      008B57 90 FE            [ 2] 2128         ldw y,(y) ; hi word 
      008B59 89               [ 2] 2129         pushw x 
      008B5A EE 02            [ 2] 2130         ldw x,(2,x) ; lo word 
      008B5C 91 CF 24         [ 5] 2131         ldw [YTEMP],y
      008B5F 90 93            [ 1] 2132         ldw y,x 
      008B61 AE 00 02         [ 2] 2133         ldw x,#2 
      008B64 92 DF 24         [ 5] 2134         ldw ([YTEMP],x),y 
      008B67 85               [ 2] 2135         popw x 
      008B68 1C 00 04         [ 2] 2136         addw x,#4 ; DDROP 
      008B6B 81               [ 4] 2137         ret 
                                   2138 
                                   2139 ;       2@      ( a -- d )
                                   2140 ;       Fetch double integer from address a.
      008B6C 8B 48                 2141         .word      LINK
                           000AEE  2142 LINK = . 
      008B6E 02                    2143         .byte      2
      008B6F 32 40                 2144         .ascii     "2@"
      008B71                       2145 DAT:
      008B71 90 93            [ 1] 2146         ldw y,x 
      008B73 90 FE            [ 2] 2147         ldw y,(y) ;address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



      008B75 90 BF 24         [ 2] 2148         ldw YTEMP,y 
      008B78 1D 00 02         [ 2] 2149         subw x,#CELLL ; space for udh 
      008B7B 91 CE 24         [ 5] 2150         ldw y,[YTEMP] ; udh 
      008B7E FF               [ 2] 2151         ldw (x),y 
      008B7F 90 AE 00 02      [ 2] 2152         ldw y,#2
      008B83 91 DE 24         [ 5] 2153         ldw y,([YTEMP],y) ; udl 
      008B86 EF 02            [ 2] 2154         ldw (2,x),y
      008B88 81               [ 4] 2155         ret 
                                   2156 
                                   2157 ;       COUNT   ( b -- b +n )
                                   2158 ;       Return count byte of a string
                                   2159 ;       and add 1 to byte address.
      008B89 8B 6E                 2160         .word      LINK
                           000B0B  2161 LINK = . 
      008B8B 05                    2162         .byte      5
      008B8C 43 4F 55 4E 54        2163         .ascii     "COUNT"
      008B91                       2164 COUNT:
      008B91 90 93            [ 1] 2165         ldw y,x 
      008B93 90 FE            [ 2] 2166         ldw y,(y) ; address 
      008B95 90 F6            [ 1] 2167         ld a,(y)  ; count 
      008B97 90 5C            [ 2] 2168         incw y 
      008B99 FF               [ 2] 2169         ldw (x),y 
      008B9A 1D 00 02         [ 2] 2170         subw x,#CELLL 
      008B9D E7 01            [ 1] 2171         ld (1,x),a 
      008B9F 7F               [ 1] 2172         clr (x)
      008BA0 81               [ 4] 2173         ret 
                                   2174 
                                   2175 ;       HERE    ( -- a )
                                   2176 ;       Return  top of  variables
      008BA1 8B 8B                 2177         .word      LINK
                           000B23  2178 LINK = . 
      008BA3 04                    2179         .byte      4
      008BA4 48 45 52 45           2180         .ascii     "HERE"
      008BA8                       2181 HERE:
      008BA8 90 AE 00 16      [ 2] 2182       	ldw y,#UVP 
      008BAC 90 FE            [ 2] 2183         ldw y,(y)
      008BAE 1D 00 02         [ 2] 2184         subw x,#CELLL 
      008BB1 FF               [ 2] 2185         ldw (x),y 
      008BB2 81               [ 4] 2186         ret 
                                   2187 
                                   2188 ;       PAD     ( -- a )
                                   2189 ;       Return address of text buffer
                                   2190 ;       above  code dictionary.
      008BB3 8B A3                 2191         .word      LINK
                           000B35  2192 LINK = . 
      008BB5 03                    2193         .byte      3
      008BB6 50 41 44              2194         .ascii     "PAD"
      008BB9                       2195 PAD:
      008BB9 CD 8B A8         [ 4] 2196         CALL     HERE
      008BBC CD 84 34         [ 4] 2197         CALL     DOLIT
      008BBF 00 50                 2198         .word      80
      008BC1 CC 87 54         [ 2] 2199         JP     PLUS
                                   2200 
                                   2201 ;       TIB     ( -- a )
                                   2202 ;       Return address of terminal input buffer.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



      008BC4 8B B5                 2203         .word      LINK
                           000B46  2204 LINK = . 
      008BC6 03                    2205         .byte      3
      008BC7 54 49 42              2206         .ascii     "TIB"
      008BCA                       2207 TIB:
      008BCA CD 86 44         [ 4] 2208         CALL     NTIB
      008BCD CD 8A 23         [ 4] 2209         CALL     CELLP
      008BD0 CC 84 B2         [ 2] 2210         JP     AT
                                   2211 
                                   2212 ;       @EXECUTE        ( a -- )
                                   2213 ;       Execute vector stored in address a.
      008BD3 8B C6                 2214         .word      LINK
                           000B55  2215 LINK = . 
      008BD5 08                    2216         .byte      8
      008BD6 40 45 58 45 43 55 54  2217         .ascii     "@EXECUTE"
             45
      008BDE                       2218 ATEXE:
      008BDE CD 84 B2         [ 4] 2219         CALL     AT
      008BE1 CD 87 03         [ 4] 2220         CALL     QDUP    ;?address or zero
      008BE4 CD 84 67         [ 4] 2221         CALL     QBRAN
      008BE7 8B EC                 2222         .word      EXE1
      008BE9 CD 84 8E         [ 4] 2223         CALL     EXECU   ;execute if non-zero
      008BEC 81               [ 4] 2224 EXE1:   RET     ;do nothing if zero
                                   2225 
                                   2226 ;       CMOVE   ( b1 b2 u -- )
                                   2227 ;       Copy u bytes from b1 to b2.
      008BED 8B D5                 2228         .word      LINK
                           000B6F  2229 LINK = . 
      008BEF 05                    2230         .byte      5
      008BF0 43 4D 4F 56 45        2231         .ascii     "CMOVE"
      008BF5                       2232 CMOVE:
      008BF5 CD 85 22         [ 4] 2233         CALL	TOR
      008BF8 CD 84 7E         [ 4] 2234         CALL	BRAN
      008BFB 8C 15                 2235         .word	CMOV2
      008BFD CD 85 22         [ 4] 2236 CMOV1:	CALL	TOR
      008C00 CD 85 59         [ 4] 2237         CALL	DUPP
      008C03 CD 84 D0         [ 4] 2238         CALL	CAT
      008C06 CD 85 16         [ 4] 2239         CALL	RAT
      008C09 CD 84 BF         [ 4] 2240         CALL	CSTOR
      008C0C CD 8A 4E         [ 4] 2241         CALL	ONEP
      008C0F CD 85 03         [ 4] 2242         CALL	RFROM
      008C12 CD 8A 4E         [ 4] 2243         CALL	ONEP
      008C15 CD 84 48         [ 4] 2244 CMOV2:	CALL	DONXT
      008C18 8B FD                 2245         .word	CMOV1
      008C1A CC 87 34         [ 2] 2246         JP	DDROP
                                   2247 
                                   2248 ;       FILL    ( b u c -- )
                                   2249 ;       Fill u bytes of character c
                                   2250 ;       to area beginning at b.
      008C1D 8B EF                 2251         .word       LINK
                           000B9F  2252 LINK = . 
      008C1F 04                    2253         .byte       4
      008C20 46 49 4C 4C           2254         .ascii     "FILL"
      008C24                       2255 FILL:
      008C24 90 93            [ 1] 2256         ldw y,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



      008C26 90 E6 01         [ 1] 2257         ld a,(1,y) ; c 
      008C29 1C 00 02         [ 2] 2258         addw x,#CELLL ; drop c 
      008C2C 90 93            [ 1] 2259         ldw y,x 
      008C2E 90 FE            [ 2] 2260         ldw y,(y) ; count
      008C30 90 89            [ 2] 2261         pushw y 
      008C32 1C 00 02         [ 2] 2262         addw x,#CELLL ; drop u 
      008C35 90 93            [ 1] 2263         ldw y,x 
      008C37 1C 00 02         [ 2] 2264         addw x,#CELLL ; drop b 
      008C3A 90 FE            [ 2] 2265         ldw y,(y) ; address
      008C3C 90 BF 24         [ 2] 2266         ldw YTEMP,y
      008C3F 90 85            [ 2] 2267         popw y ; count 
      008C41                       2268 FILL1:  
      008C41 92 C7 24         [ 4] 2269         ld [YTEMP],a 
      008C44 3C 25            [ 1] 2270         inc YTEMP+1
      008C46 24 02            [ 1] 2271         jrnc FILL2 
      008C48 3C 24            [ 1] 2272         inc YTEMP
      008C4A                       2273 FILL2: 
      008C4A 90 5A            [ 2] 2274         decw y ; count 
      008C4C 26 F3            [ 1] 2275         jrne FILL1  
      008C4E 81               [ 4] 2276         ret 
                                   2277 
                                   2278 ;       ERASE   ( b u -- )
                                   2279 ;       Erase u bytes beginning at b.
      008C4F 8C 1F                 2280         .word      LINK
                           000BD1  2281 LINK = . 
      008C51 05                    2282         .byte      5
      008C52 45 52 41 53 45        2283         .ascii     "ERASE"
      008C57                       2284 ERASE:
      008C57 90 5F            [ 1] 2285         clrw y 
      008C59 1D 00 02         [ 2] 2286         subw x,#CELLL 
      008C5C FF               [ 2] 2287         ldw (x),y 
      008C5D CC 8C 24         [ 2] 2288         jp FILL 
                                   2289 
                                   2290 
                                   2291 ;       PACK0   ( b u a -- a )
                                   2292 ;       Build a counted string with
                                   2293 ;       u characters from b. Null fill.
      008C60 8C 51                 2294         .word      LINK
                           000BE2  2295 LINK = . 
      008C62 05                    2296         .byte      5
      008C63 50 41 43 4B 30        2297         .ascii     "PACK0"
      008C68                       2298 PACKS:
      008C68 CD 85 59         [ 4] 2299         CALL     DUPP
      008C6B CD 85 22         [ 4] 2300         CALL     TOR     ;strings only on cell boundary
      008C6E CD 87 3F         [ 4] 2301         CALL     DDUP
      008C71 CD 84 BF         [ 4] 2302         CALL     CSTOR
      008C74 CD 8A 4E         [ 4] 2303         CALL     ONEP ;save count
      008C77 CD 85 69         [ 4] 2304         CALL     SWAPP
      008C7A CD 8B F5         [ 4] 2305         CALL     CMOVE
      008C7D CD 85 03         [ 4] 2306         CALL     RFROM
      008C80 81               [ 4] 2307         RET
                                   2308 
                                   2309 ;; Numeric output, single precision
                                   2310 
                                   2311 ;       DIGIT   ( u -- c )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



                                   2312 ;       Convert digit u to a character.
      008C81 8C 62                 2313         .word      LINK
                           000C03  2314 LINK = . 
      008C83 05                    2315         .byte      5
      008C84 44 49 47 49 54        2316         .ascii     "DIGIT"
      008C89                       2317 DIGIT:
      008C89 CD 84 34         [ 4] 2318         CALL	DOLIT
      008C8C 00 09                 2319         .word	9
      008C8E CD 85 83         [ 4] 2320         CALL	OVER
      008C91 CD 88 32         [ 4] 2321         CALL	LESS
      008C94 CD 84 34         [ 4] 2322         CALL	DOLIT
      008C97 00 07                 2323         .word	7
      008C99 CD 85 A5         [ 4] 2324         CALL	ANDD
      008C9C CD 87 54         [ 4] 2325         CALL	PLUS
      008C9F CD 84 34         [ 4] 2326         CALL	DOLIT
      008CA2 00 30                 2327         .word	48	;'0'
      008CA4 CC 87 54         [ 2] 2328         JP	PLUS
                                   2329 
                                   2330 ;       EXTRACT ( n base -- n c )
                                   2331 ;       Extract least significant digit from n.
      008CA7 8C 83                 2332         .word      LINK
                           000C29  2333 LINK = . 
      008CA9 07                    2334         .byte      7
      008CAA 45 58 54 52 41 43 54  2335         .ascii     "EXTRACT"
      008CB1                       2336 EXTRC:
      008CB1 CD 8A BA         [ 4] 2337         CALL     ZERO
      008CB4 CD 85 69         [ 4] 2338         CALL     SWAPP
      008CB7 CD 88 AA         [ 4] 2339         CALL     UMMOD
      008CBA CD 85 69         [ 4] 2340         CALL     SWAPP
      008CBD CC 8C 89         [ 2] 2341         JP     DIGIT
                                   2342 
                                   2343 ;       <#      ( -- )
                                   2344 ;       Initiate  numeric output process.
      008CC0 8C A9                 2345         .word      LINK
                           000C42  2346 LINK = . 
      008CC2 02                    2347         .byte      2
      008CC3 3C 23                 2348         .ascii     "<#"
      008CC5                       2349 BDIGS:
      008CC5 CD 8B B9         [ 4] 2350         CALL     PAD
      008CC8 CD 86 86         [ 4] 2351         CALL     HLD
      008CCB CC 84 9B         [ 2] 2352         JP     STORE
                                   2353 
                                   2354 ;       HOLD    ( c -- )
                                   2355 ;       Insert a character into output string.
      008CCE 8C C2                 2356         .word      LINK
                           000C50  2357 LINK = . 
      008CD0 04                    2358         .byte      4
      008CD1 48 4F 4C 44           2359         .ascii     "HOLD"
      008CD5                       2360 HOLD:
      008CD5 CD 86 86         [ 4] 2361         CALL     HLD
      008CD8 CD 84 B2         [ 4] 2362         CALL     AT
      008CDB CD 8A 5B         [ 4] 2363         CALL     ONEM
      008CDE CD 85 59         [ 4] 2364         CALL     DUPP
      008CE1 CD 86 86         [ 4] 2365         CALL     HLD
      008CE4 CD 84 9B         [ 4] 2366         CALL     STORE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



      008CE7 CC 84 BF         [ 2] 2367         JP     CSTOR
                                   2368 
                                   2369 ;       #       ( u -- u )
                                   2370 ;       Extract one digit from u and
                                   2371 ;       append digit to output string.
      008CEA 8C D0                 2372         .word      LINK
                           000C6C  2373 LINK = . 
      008CEC 01                    2374         .byte      1
      008CED 23                    2375         .ascii     "#"
      008CEE                       2376 DIG:
      008CEE CD 86 16         [ 4] 2377         CALL     BASE
      008CF1 CD 84 B2         [ 4] 2378         CALL     AT
      008CF4 CD 8C B1         [ 4] 2379         CALL     EXTRC
      008CF7 CC 8C D5         [ 2] 2380         JP     HOLD
                                   2381 
                                   2382 ;       #S      ( u -- 0 )
                                   2383 ;       Convert u until all digits
                                   2384 ;       are added to output string.
      008CFA 8C EC                 2385         .word      LINK
                           000C7C  2386 LINK = . 
      008CFC 02                    2387         .byte      2
      008CFD 23 53                 2388         .ascii     "#S"
      008CFF                       2389 DIGS:
      008CFF CD 8C EE         [ 4] 2390 DIGS1:  CALL     DIG
      008D02 CD 85 59         [ 4] 2391         CALL     DUPP
      008D05 CD 84 67         [ 4] 2392         CALL     QBRAN
      008D08 8D 0C                 2393         .word      DIGS2
      008D0A 20 F3            [ 2] 2394         JRA     DIGS1
      008D0C 81               [ 4] 2395 DIGS2:  RET
                                   2396 
                                   2397 ;       SIGN    ( n -- )
                                   2398 ;       Add a minus sign to
                                   2399 ;       numeric output string.
      008D0D 8C FC                 2400         .word      LINK
                           000C8F  2401 LINK = . 
      008D0F 04                    2402         .byte      4
      008D10 53 49 47 4E           2403         .ascii     "SIGN"
      008D14                       2404 SIGN:
      008D14 CD 85 92         [ 4] 2405         CALL     ZLESS
      008D17 CD 84 67         [ 4] 2406         CALL     QBRAN
      008D1A 8D 24                 2407         .word      SIGN1
      008D1C CD 84 34         [ 4] 2408         CALL     DOLIT
      008D1F 00 2D                 2409         .word      45	;"-"
      008D21 CC 8C D5         [ 2] 2410         JP     HOLD
      008D24 81               [ 4] 2411 SIGN1:  RET
                                   2412 
                                   2413 ;       #>      ( w -- b u )
                                   2414 ;       Prepare output string.
      008D25 8D 0F                 2415         .word      LINK
                           000CA7  2416 LINK = . 
      008D27 02                    2417         .byte      2
      008D28 23 3E                 2418         .ascii     "#>"
      008D2A                       2419 EDIGS:
      008D2A CD 85 4F         [ 4] 2420         CALL     DROP
      008D2D CD 86 86         [ 4] 2421         CALL     HLD
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      008D30 CD 84 B2         [ 4] 2422         CALL     AT
      008D33 CD 8B B9         [ 4] 2423         CALL     PAD
      008D36 CD 85 83         [ 4] 2424         CALL     OVER
      008D39 CC 87 CD         [ 2] 2425         JP     SUBB
                                   2426 
                                   2427 ;       str     ( w -- b u )
                                   2428 ;       Convert a signed integer
                                   2429 ;       to a numeric string.
      008D3C 8D 27                 2430         .word      LINK
                           000CBE  2431 LINK = . 
      008D3E 03                    2432         .byte      3
      008D3F 53 54 52              2433         .ascii     "STR"
      008D42                       2434 STR:
      008D42 CD 85 59         [ 4] 2435         CALL     DUPP
      008D45 CD 85 22         [ 4] 2436         CALL     TOR
      008D48 CD 87 E7         [ 4] 2437         CALL     ABSS
      008D4B CD 8C C5         [ 4] 2438         CALL     BDIGS
      008D4E CD 8C FF         [ 4] 2439         CALL     DIGS
      008D51 CD 85 03         [ 4] 2440         CALL     RFROM
      008D54 CD 8D 14         [ 4] 2441         CALL     SIGN
      008D57 CC 8D 2A         [ 2] 2442         JP     EDIGS
                                   2443 
                                   2444 ;       HEX     ( -- )
                                   2445 ;       Use radix 16 as base for
                                   2446 ;       numeric conversions.
      008D5A 8D 3E                 2447         .word      LINK
                           000CDC  2448 LINK = . 
      008D5C 03                    2449         .byte      3
      008D5D 48 45 58              2450         .ascii     "HEX"
      008D60                       2451 HEX:
      008D60 CD 84 34         [ 4] 2452         CALL     DOLIT
      008D63 00 10                 2453         .word      16
      008D65 CD 86 16         [ 4] 2454         CALL     BASE
      008D68 CC 84 9B         [ 2] 2455         JP     STORE
                                   2456 
                                   2457 ;       DECIMAL ( -- )
                                   2458 ;       Use radix 10 as base
                                   2459 ;       for numeric conversions.
      008D6B 8D 5C                 2460         .word      LINK
                           000CED  2461 LINK = . 
      008D6D 07                    2462         .byte      7
      008D6E 44 45 43 49 4D 41 4C  2463         .ascii     "DECIMAL"
      008D75                       2464 DECIM:
      008D75 CD 84 34         [ 4] 2465         CALL     DOLIT
      008D78 00 0A                 2466         .word      10
      008D7A CD 86 16         [ 4] 2467         CALL     BASE
      008D7D CC 84 9B         [ 2] 2468         JP     STORE
                                   2469 
                                   2470 ;; Numeric input, single precision
                                   2471 
                                   2472 ;       DIGIT?  ( c base -- u t )
                                   2473 ;       Convert a character to its numeric
                                   2474 ;       value. A flag indicates success.
      008D80 8D 6D                 2475         .word      LINK
                           000D02  2476 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      008D82 06                    2477         .byte       6
      008D83 44 49 47 49 54 3F     2478         .ascii     "DIGIT?"
      008D89                       2479 DIGTQ:
      008D89 CD 85 22         [ 4] 2480         CALL     TOR
      008D8C CD 84 34         [ 4] 2481         CALL     DOLIT
      008D8F 00 30                 2482         .word     48	; "0"
      008D91 CD 87 CD         [ 4] 2483         CALL     SUBB
      008D94 CD 84 34         [ 4] 2484         CALL     DOLIT
      008D97 00 09                 2485         .word      9
      008D99 CD 85 83         [ 4] 2486         CALL     OVER
      008D9C CD 88 32         [ 4] 2487         CALL     LESS
      008D9F CD 84 67         [ 4] 2488         CALL     QBRAN
      008DA2 8D BA                 2489         .word      DGTQ1
      008DA4 CD 84 34         [ 4] 2490         CALL     DOLIT
      008DA7 00 07                 2491         .word      7
      008DA9 CD 87 CD         [ 4] 2492         CALL     SUBB
      008DAC CD 85 59         [ 4] 2493         CALL     DUPP
      008DAF CD 84 34         [ 4] 2494         CALL     DOLIT
      008DB2 00 0A                 2495         .word      10
      008DB4 CD 88 32         [ 4] 2496         CALL     LESS
      008DB7 CD 85 B9         [ 4] 2497         CALL     ORR
      008DBA CD 85 59         [ 4] 2498 DGTQ1:  CALL     DUPP
      008DBD CD 85 03         [ 4] 2499         CALL     RFROM
      008DC0 CC 88 14         [ 2] 2500         JP     ULESS
                                   2501 
                                   2502 ;       NUMBER? ( a -- n T | a F )
                                   2503 ;       Convert a number string to
                                   2504 ;       integer. Push a flag on tos.
      008DC3 8D 82                 2505         .word      LINK
                           000D45  2506 LINK = . 
      008DC5 07                    2507         .byte      7
      008DC6 4E 55 4D 42 45 52 3F  2508         .ascii     "NUMBER?"
      008DCD                       2509 NUMBQ:
      008DCD CD 86 16         [ 4] 2510         CALL     BASE
      008DD0 CD 84 B2         [ 4] 2511         CALL     AT
      008DD3 CD 85 22         [ 4] 2512         CALL     TOR
      008DD6 CD 8A BA         [ 4] 2513         CALL     ZERO
      008DD9 CD 85 83         [ 4] 2514         CALL     OVER
      008DDC CD 8B 91         [ 4] 2515         CALL     COUNT
      008DDF CD 85 83         [ 4] 2516         CALL     OVER
      008DE2 CD 84 D0         [ 4] 2517         CALL     CAT
      008DE5 CD 84 34         [ 4] 2518         CALL     DOLIT
      008DE8 00 24                 2519         .word     36	; "0x"
      008DEA CD 87 F5         [ 4] 2520         CALL     EQUAL
      008DED CD 84 67         [ 4] 2521         CALL     QBRAN
      008DF0 8E 01                 2522         .word      NUMQ1
      008DF2 CD 8D 60         [ 4] 2523         CALL     HEX
      008DF5 CD 85 69         [ 4] 2524         CALL     SWAPP
      008DF8 CD 8A 4E         [ 4] 2525         CALL     ONEP
      008DFB CD 85 69         [ 4] 2526         CALL     SWAPP
      008DFE CD 8A 5B         [ 4] 2527         CALL     ONEM
      008E01 CD 85 83         [ 4] 2528 NUMQ1:  CALL     OVER
      008E04 CD 84 D0         [ 4] 2529         CALL     CAT
      008E07 CD 84 34         [ 4] 2530         CALL     DOLIT
      008E0A 00 2D                 2531         .word     45	; "-"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



      008E0C CD 87 F5         [ 4] 2532         CALL     EQUAL
      008E0F CD 85 22         [ 4] 2533         CALL     TOR
      008E12 CD 85 69         [ 4] 2534         CALL     SWAPP
      008E15 CD 85 16         [ 4] 2535         CALL     RAT
      008E18 CD 87 CD         [ 4] 2536         CALL     SUBB
      008E1B CD 85 69         [ 4] 2537         CALL     SWAPP
      008E1E CD 85 16         [ 4] 2538         CALL     RAT
      008E21 CD 87 54         [ 4] 2539         CALL     PLUS
      008E24 CD 87 03         [ 4] 2540         CALL     QDUP
      008E27 CD 84 67         [ 4] 2541         CALL     QBRAN
      008E2A 8E 8B                 2542         .word      NUMQ6
      008E2C CD 8A 5B         [ 4] 2543         CALL     ONEM
      008E2F CD 85 22         [ 4] 2544         CALL     TOR
      008E32 CD 85 59         [ 4] 2545 NUMQ2:  CALL     DUPP
      008E35 CD 85 22         [ 4] 2546         CALL     TOR
      008E38 CD 84 D0         [ 4] 2547         CALL     CAT
      008E3B CD 86 16         [ 4] 2548         CALL     BASE
      008E3E CD 84 B2         [ 4] 2549         CALL     AT
      008E41 CD 8D 89         [ 4] 2550         CALL     DIGTQ
      008E44 CD 84 67         [ 4] 2551         CALL     QBRAN
      008E47 8E 79                 2552         .word      NUMQ4
      008E49 CD 85 69         [ 4] 2553         CALL     SWAPP
      008E4C CD 86 16         [ 4] 2554         CALL     BASE
      008E4F CD 84 B2         [ 4] 2555         CALL     AT
      008E52 CD 89 CD         [ 4] 2556         CALL     STAR
      008E55 CD 87 54         [ 4] 2557         CALL     PLUS
      008E58 CD 85 03         [ 4] 2558         CALL     RFROM
      008E5B CD 8A 4E         [ 4] 2559         CALL     ONEP
      008E5E CD 84 48         [ 4] 2560         CALL     DONXT
      008E61 8E 32                 2561         .word      NUMQ2
      008E63 CD 85 16         [ 4] 2562         CALL     RAT
      008E66 CD 85 69         [ 4] 2563         CALL     SWAPP
      008E69 CD 85 4F         [ 4] 2564         CALL     DROP
      008E6C CD 84 67         [ 4] 2565         CALL     QBRAN
      008E6F 8E 74                 2566         .word      NUMQ3
      008E71 CD 87 7F         [ 4] 2567         CALL     NEGAT
      008E74 CD 85 69         [ 4] 2568 NUMQ3:  CALL     SWAPP
      008E77 20 0F            [ 2] 2569         JRA     NUMQ5
      008E79 CD 85 03         [ 4] 2570 NUMQ4:  CALL     RFROM
      008E7C CD 85 03         [ 4] 2571         CALL     RFROM
      008E7F CD 87 34         [ 4] 2572         CALL     DDROP
      008E82 CD 87 34         [ 4] 2573         CALL     DDROP
      008E85 CD 8A BA         [ 4] 2574         CALL     ZERO
      008E88 CD 85 59         [ 4] 2575 NUMQ5:  CALL     DUPP
      008E8B CD 85 03         [ 4] 2576 NUMQ6:  CALL     RFROM
      008E8E CD 87 34         [ 4] 2577         CALL     DDROP
      008E91 CD 85 03         [ 4] 2578         CALL     RFROM
      008E94 CD 86 16         [ 4] 2579         CALL     BASE
      008E97 CC 84 9B         [ 2] 2580         JP     STORE
                                   2581 
                                   2582 ;; Basic I/O
                                   2583 
                                   2584 ;       KEY     ( -- c )
                                   2585 ;       Wait for and return an
                                   2586 ;       input character.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      008E9A 8D C5                 2587         .word      LINK
                           000E1C  2588 LINK = . 
      008E9C 03                    2589         .byte      3
      008E9D 4B 45 59              2590         .ascii     "KEY"
      008EA0                       2591 KEY:
      008EA0 72 0B 52 30 FB   [ 2] 2592         btjf UART1_SR,#UART_SR_RXNE,. 
      008EA5 C6 52 31         [ 1] 2593         ld a,UART1_DR 
      008EA8 1D 00 02         [ 2] 2594         subw x,#CELLL 
      008EAB E7 01            [ 1] 2595         ld (1,x),a 
      008EAD 7F               [ 1] 2596         clr (x)
      008EAE 81               [ 4] 2597         ret 
                                   2598 
                                   2599 ;       NUF?    ( -- t )
                                   2600 ;       Return false if no input,
                                   2601 ;       else pause and if CR return true.
      008EAF 8E 9C                 2602         .word      LINK
                           000E31  2603 LINK = . 
      008EB1 04                    2604         .byte      4
      008EB2 4E 55 46 3F           2605         .ascii     "NUF?"
      008EB6                       2606 NUFQ:
      008EB6 CD 84 00         [ 4] 2607         CALL     QKEY
      008EB9 CD 85 59         [ 4] 2608         CALL     DUPP
      008EBC CD 84 67         [ 4] 2609         CALL     QBRAN
      008EBF 8E CF                 2610         .word    NUFQ1
      008EC1 CD 87 34         [ 4] 2611         CALL     DDROP
      008EC4 CD 8E A0         [ 4] 2612         CALL     KEY
      008EC7 CD 84 34         [ 4] 2613         CALL     DOLIT
      008ECA 00 0D                 2614         .word      CRR
      008ECC CC 87 F5         [ 2] 2615         JP     EQUAL
      008ECF 81               [ 4] 2616 NUFQ1:  RET
                                   2617 
                                   2618 ;       SPACE   ( -- )
                                   2619 ;       Send  blank character to
                                   2620 ;       output device.
      008ED0 8E B1                 2621         .word      LINK
                           000E52  2622 LINK = . 
      008ED2 05                    2623         .byte      5
      008ED3 53 50 41 43 45        2624         .ascii     "SPACE"
      008ED8                       2625 SPACE:
      008ED8 CD 8A AD         [ 4] 2626         CALL     BLANK
      008EDB CC 84 1E         [ 2] 2627         JP     EMIT
                                   2628 
                                   2629 ;       SPACES  ( +n -- )
                                   2630 ;       Send n spaces to output device.
      008EDE 8E D2                 2631         .word      LINK
                           000E60  2632 LINK = . 
      008EE0 06                    2633         .byte      6
      008EE1 53 50 41 43 45 53     2634         .ascii     "SPACES"
      008EE7                       2635 SPACS:
      008EE7 CD 8A BA         [ 4] 2636         CALL     ZERO
      008EEA CD 88 52         [ 4] 2637         CALL     MAX
      008EED CD 85 22         [ 4] 2638         CALL     TOR
      008EF0 20 03            [ 2] 2639         JRA      CHAR2
      008EF2 CD 8E D8         [ 4] 2640 CHAR1:  CALL     SPACE
      008EF5 CD 84 48         [ 4] 2641 CHAR2:  CALL     DONXT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



      008EF8 8E F2                 2642         .word    CHAR1
      008EFA 81               [ 4] 2643         RET
                                   2644 
                                   2645 ;       TYPE    ( b u -- )
                                   2646 ;       Output u characters from b.
      008EFB 8E E0                 2647         .word      LINK
                           000E7D  2648 LINK = . 
      008EFD 04                    2649         .byte      4
      008EFE 54 59 50 45           2650         .ascii     "TYPE"
      008F02                       2651 TYPES:
      008F02 CD 85 22         [ 4] 2652         CALL     TOR
      008F05 20 0C            [ 2] 2653         JRA     TYPE2
      008F07 CD 85 59         [ 4] 2654 TYPE1:  CALL     DUPP
      008F0A CD 84 D0         [ 4] 2655         CALL     CAT
      008F0D CD 84 1E         [ 4] 2656         CALL     EMIT
      008F10 CD 8A 4E         [ 4] 2657         CALL     ONEP
      008F13 CD 84 48         [ 4] 2658 TYPE2:  CALL     DONXT
      008F16 8F 07                 2659         .word      TYPE1
      008F18 CC 85 4F         [ 2] 2660         JP     DROP
                                   2661 
                                   2662 ;       CR      ( -- )
                                   2663 ;       Output a carriage return
                                   2664 ;       and a line feed.
      008F1B 8E FD                 2665         .word      LINK
                           000E9D  2666 LINK = . 
      008F1D 02                    2667         .byte      2
      008F1E 43 52                 2668         .ascii     "CR"
      008F20                       2669 CR:
      008F20 CD 84 34         [ 4] 2670         CALL     DOLIT
      008F23 00 0D                 2671         .word      CRR
      008F25 CD 84 1E         [ 4] 2672         CALL     EMIT
      008F28 CD 84 34         [ 4] 2673         CALL     DOLIT
      008F2B 00 0A                 2674         .word      LF
      008F2D CC 84 1E         [ 2] 2675         JP     EMIT
                                   2676 
                                   2677 ;       do$     ( -- a )
                                   2678 ;       Return  address of a compiled
                                   2679 ;       string.
      008F30 8F 1D                 2680         .word      LINK
                           000EB2  2681 LINK = . 
      008F32 43                    2682 	.byte      COMPO+3
      008F33 44 4F 24              2683         .ascii     "DO$"
      008F36                       2684 DOSTR:
      008F36 CD 85 03         [ 4] 2685         CALL     RFROM
      008F39 CD 85 16         [ 4] 2686         CALL     RAT
      008F3C CD 85 03         [ 4] 2687         CALL     RFROM
      008F3F CD 8B 91         [ 4] 2688         CALL     COUNT
      008F42 CD 87 54         [ 4] 2689         CALL     PLUS
      008F45 CD 85 22         [ 4] 2690         CALL     TOR
      008F48 CD 85 69         [ 4] 2691         CALL     SWAPP
      008F4B CD 85 22         [ 4] 2692         CALL     TOR
      008F4E 81               [ 4] 2693         RET
                                   2694 
                                   2695 ;       $"|     ( -- a )
                                   2696 ;       Run time routine compiled by $".
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



                                   2697 ;       Return address of a compiled string.
      008F4F 8F 32                 2698         .word      LINK
                           000ED1  2699 LINK = . 
      008F51 43                    2700 	.byte      COMPO+3
      008F52 24 22 7C              2701         .byte     '$','"','|'
      008F55                       2702 STRQP:
      008F55 CD 8F 36         [ 4] 2703         CALL     DOSTR
      008F58 81               [ 4] 2704         RET
                                   2705 
                                   2706 ;       ."|     ( -- )
                                   2707 ;       Run time routine of ." .
                                   2708 ;       Output a compiled string.
      008F59 8F 51                 2709         .word      LINK
                           000EDB  2710 LINK = . 
      008F5B 43                    2711 	.byte      COMPO+3
      008F5C 2E 22 7C              2712         .byte     '.','"','|'
      008F5F                       2713 DOTQP:
      008F5F CD 8F 36         [ 4] 2714         CALL     DOSTR
      008F62 CD 8B 91         [ 4] 2715         CALL     COUNT
      008F65 CC 8F 02         [ 2] 2716         JP     TYPES
                                   2717 
                                   2718 ;       .R      ( n +n -- )
                                   2719 ;       Display an integer in a field
                                   2720 ;       of n columns, right justified.
      008F68 8F 5B                 2721         .word      LINK
                           000EEA  2722 LINK = . 
      008F6A 02                    2723         .byte      2
      008F6B 2E 52                 2724         .ascii     ".R"
      008F6D                       2725 DOTR:
      008F6D CD 85 22         [ 4] 2726         CALL     TOR
      008F70 CD 8D 42         [ 4] 2727         CALL     STR
      008F73 CD 85 03         [ 4] 2728         CALL     RFROM
      008F76 CD 85 83         [ 4] 2729         CALL     OVER
      008F79 CD 87 CD         [ 4] 2730         CALL     SUBB
      008F7C CD 8E E7         [ 4] 2731         CALL     SPACS
      008F7F CC 8F 02         [ 2] 2732         JP     TYPES
                                   2733 
                                   2734 ;       U.R     ( u +n -- )
                                   2735 ;       Display an unsigned integer
                                   2736 ;       in n column, right justified.
      008F82 8F 6A                 2737         .word      LINK
                           000F04  2738 LINK = . 
      008F84 03                    2739         .byte      3
      008F85 55 2E 52              2740         .ascii     "U.R"
      008F88                       2741 UDOTR:
      008F88 CD 85 22         [ 4] 2742         CALL     TOR
      008F8B CD 8C C5         [ 4] 2743         CALL     BDIGS
      008F8E CD 8C FF         [ 4] 2744         CALL     DIGS
      008F91 CD 8D 2A         [ 4] 2745         CALL     EDIGS
      008F94 CD 85 03         [ 4] 2746         CALL     RFROM
      008F97 CD 85 83         [ 4] 2747         CALL     OVER
      008F9A CD 87 CD         [ 4] 2748         CALL     SUBB
      008F9D CD 8E E7         [ 4] 2749         CALL     SPACS
      008FA0 CC 8F 02         [ 2] 2750         JP     TYPES
                                   2751 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



                                   2752 ;       U.      ( u -- )
                                   2753 ;       Display an unsigned integer
                                   2754 ;       in free format.
      008FA3 8F 84                 2755         .word      LINK
                           000F25  2756 LINK = . 
      008FA5 02                    2757         .byte      2
      008FA6 55 2E                 2758         .ascii     "U."
      008FA8                       2759 UDOT:
      008FA8 CD 8C C5         [ 4] 2760         CALL     BDIGS
      008FAB CD 8C FF         [ 4] 2761         CALL     DIGS
      008FAE CD 8D 2A         [ 4] 2762         CALL     EDIGS
      008FB1 CD 8E D8         [ 4] 2763         CALL     SPACE
      008FB4 CC 8F 02         [ 2] 2764         JP     TYPES
                                   2765 
                                   2766 ;       .       ( w -- )
                                   2767 ;       Display an integer in free
                                   2768 ;       format, preceeded by a space.
      008FB7 8F A5                 2769         .word      LINK
                           000F39  2770 LINK = . 
      008FB9 01                    2771         .byte      1
      008FBA 2E                    2772         .ascii     "."
      008FBB                       2773 DOT:
      008FBB CD 86 16         [ 4] 2774         CALL     BASE
      008FBE CD 84 B2         [ 4] 2775         CALL     AT
      008FC1 CD 84 34         [ 4] 2776         CALL     DOLIT
      008FC4 00 0A                 2777         .word      10
      008FC6 CD 85 CE         [ 4] 2778         CALL     XORR    ;?decimal
      008FC9 CD 84 67         [ 4] 2779         CALL     QBRAN
      008FCC 8F D1                 2780         .word      DOT1
      008FCE CC 8F A8         [ 2] 2781         JP     UDOT
      008FD1 CD 8D 42         [ 4] 2782 DOT1:   CALL     STR
      008FD4 CD 8E D8         [ 4] 2783         CALL     SPACE
      008FD7 CC 8F 02         [ 2] 2784         JP     TYPES
                                   2785 
                                   2786 ;       ?       ( a -- )
                                   2787 ;       Display contents in memory cell.
      008FDA 8F B9                 2788         .word      LINK
                                   2789         
                           000F5C  2790 LINK = . 
      008FDC 01                    2791         .byte      1
      008FDD 3F                    2792         .ascii     "?"
      008FDE                       2793 QUEST:
      008FDE CD 84 B2         [ 4] 2794         CALL     AT
      008FE1 CC 8F BB         [ 2] 2795         JP     DOT
                                   2796 
                                   2797 ;; Parsing
                                   2798 
                                   2799 ;       parse   ( b u c -- b u delta ; <string> )
                                   2800 ;       Scan string delimited by c.
                                   2801 ;       Return found string and its offset.
      008FE4 8F DC                 2802         .word      LINK
                           000F66  2803 LINK = . 
      008FE6 05                    2804         .byte      5
      008FE7 70 61 72 73 65        2805         .ascii     "parse"
      008FEC                       2806 PARS:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



      008FEC CD 86 25         [ 4] 2807         CALL     TEMP
      008FEF CD 84 9B         [ 4] 2808         CALL     STORE
      008FF2 CD 85 83         [ 4] 2809         CALL     OVER
      008FF5 CD 85 22         [ 4] 2810         CALL     TOR
      008FF8 CD 85 59         [ 4] 2811         CALL     DUPP
      008FFB CD 84 67         [ 4] 2812         CALL     QBRAN
      008FFE 90 A4                 2813         .word    PARS8
      009000 CD 8A 5B         [ 4] 2814         CALL     ONEM
      009003 CD 86 25         [ 4] 2815         CALL     TEMP
      009006 CD 84 B2         [ 4] 2816         CALL     AT
      009009 CD 8A AD         [ 4] 2817         CALL     BLANK
      00900C CD 87 F5         [ 4] 2818         CALL     EQUAL
      00900F CD 84 67         [ 4] 2819         CALL     QBRAN
      009012 90 45                 2820         .word      PARS3
      009014 CD 85 22         [ 4] 2821         CALL     TOR
      009017 CD 8A AD         [ 4] 2822 PARS1:  CALL     BLANK
      00901A CD 85 83         [ 4] 2823         CALL     OVER
      00901D CD 84 D0         [ 4] 2824         CALL     CAT     ;skip leading blanks ONLY
      009020 CD 87 CD         [ 4] 2825         CALL     SUBB
      009023 CD 85 92         [ 4] 2826         CALL     ZLESS
      009026 CD 87 6E         [ 4] 2827         CALL     INVER
      009029 CD 84 67         [ 4] 2828         CALL     QBRAN
      00902C 90 42                 2829         .word      PARS2
      00902E CD 8A 4E         [ 4] 2830         CALL     ONEP
      009031 CD 84 48         [ 4] 2831         CALL     DONXT
      009034 90 17                 2832         .word      PARS1
      009036 CD 85 03         [ 4] 2833         CALL     RFROM
      009039 CD 85 4F         [ 4] 2834         CALL     DROP
      00903C CD 8A BA         [ 4] 2835         CALL     ZERO
      00903F CC 85 59         [ 2] 2836         JP     DUPP
      009042 CD 85 03         [ 4] 2837 PARS2:  CALL     RFROM
      009045 CD 85 83         [ 4] 2838 PARS3:  CALL     OVER
      009048 CD 85 69         [ 4] 2839         CALL     SWAPP
      00904B CD 85 22         [ 4] 2840         CALL     TOR
      00904E CD 86 25         [ 4] 2841 PARS4:  CALL     TEMP
      009051 CD 84 B2         [ 4] 2842         CALL     AT
      009054 CD 85 83         [ 4] 2843         CALL     OVER
      009057 CD 84 D0         [ 4] 2844         CALL     CAT
      00905A CD 87 CD         [ 4] 2845         CALL     SUBB    ;scan for delimiter
      00905D CD 86 25         [ 4] 2846         CALL     TEMP
      009060 CD 84 B2         [ 4] 2847         CALL     AT
      009063 CD 8A AD         [ 4] 2848         CALL     BLANK
      009066 CD 87 F5         [ 4] 2849         CALL     EQUAL
      009069 CD 84 67         [ 4] 2850         CALL     QBRAN
      00906C 90 71                 2851         .word      PARS5
      00906E CD 85 92         [ 4] 2852         CALL     ZLESS
      009071 CD 84 67         [ 4] 2853 PARS5:  CALL     QBRAN
      009074 90 86                 2854         .word      PARS6
      009076 CD 8A 4E         [ 4] 2855         CALL     ONEP
      009079 CD 84 48         [ 4] 2856         CALL     DONXT
      00907C 90 4E                 2857         .word      PARS4
      00907E CD 85 59         [ 4] 2858         CALL     DUPP
      009081 CD 85 22         [ 4] 2859         CALL     TOR
      009084 20 0F            [ 2] 2860         JRA     PARS7
      009086 CD 85 03         [ 4] 2861 PARS6:  CALL     RFROM
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



      009089 CD 85 4F         [ 4] 2862         CALL     DROP
      00908C CD 85 59         [ 4] 2863         CALL     DUPP
      00908F CD 8A 4E         [ 4] 2864         CALL     ONEP
      009092 CD 85 22         [ 4] 2865         CALL     TOR
      009095 CD 85 83         [ 4] 2866 PARS7:  CALL     OVER
      009098 CD 87 CD         [ 4] 2867         CALL     SUBB
      00909B CD 85 03         [ 4] 2868         CALL     RFROM
      00909E CD 85 03         [ 4] 2869         CALL     RFROM
      0090A1 CC 87 CD         [ 2] 2870         JP     SUBB
      0090A4 CD 85 83         [ 4] 2871 PARS8:  CALL     OVER
      0090A7 CD 85 03         [ 4] 2872         CALL     RFROM
      0090AA CC 87 CD         [ 2] 2873         JP     SUBB
                                   2874 
                                   2875 ;       PARSE   ( c -- b u ; <string> )
                                   2876 ;       Scan input stream and return
                                   2877 ;       counted string delimited by c.
      0090AD 8F E6                 2878         .word      LINK
                           00102F  2879 LINK = . 
      0090AF 05                    2880         .byte      5
      0090B0 50 41 52 53 45        2881         .ascii     "PARSE"
      0090B5                       2882 PARSE:
      0090B5 CD 85 22         [ 4] 2883         CALL     TOR
      0090B8 CD 8B CA         [ 4] 2884         CALL     TIB
      0090BB CD 86 34         [ 4] 2885         CALL     INN
      0090BE CD 84 B2         [ 4] 2886         CALL     AT
      0090C1 CD 87 54         [ 4] 2887         CALL     PLUS    ;current input buffer pointer
      0090C4 CD 86 44         [ 4] 2888         CALL     NTIB
      0090C7 CD 84 B2         [ 4] 2889         CALL     AT
      0090CA CD 86 34         [ 4] 2890         CALL     INN
      0090CD CD 84 B2         [ 4] 2891         CALL     AT
      0090D0 CD 87 CD         [ 4] 2892         CALL     SUBB    ;remaining count
      0090D3 CD 85 03         [ 4] 2893         CALL     RFROM
      0090D6 CD 8F EC         [ 4] 2894         CALL     PARS
      0090D9 CD 86 34         [ 4] 2895         CALL     INN
      0090DC CC 8B 2A         [ 2] 2896         JP     PSTOR
                                   2897 
                                   2898 ;       .(      ( -- )
                                   2899 ;       Output following string up to next ) .
      0090DF 90 AF                 2900         .word      LINK
                           001061  2901 LINK = . 
      0090E1 82                    2902 	.byte      IMEDD+2
      0090E2 2E 28                 2903         .ascii     ".("
      0090E4                       2904 DOTPR:
      0090E4 CD 84 34         [ 4] 2905         CALL     DOLIT
      0090E7 00 29                 2906         .word     41	; ")"
      0090E9 CD 90 B5         [ 4] 2907         CALL     PARSE
      0090EC CC 8F 02         [ 2] 2908         JP     TYPES
                                   2909 
                                   2910 ;       (       ( -- )
                                   2911 ;       Ignore following string up to next ).
                                   2912 ;       A comment.
      0090EF 90 E1                 2913         .word      LINK
                           001071  2914 LINK = . 
      0090F1 81                    2915 	.byte      IMEDD+1
      0090F2 28                    2916         .ascii     "("
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      0090F3                       2917 PAREN:
      0090F3 CD 84 34         [ 4] 2918         CALL     DOLIT
      0090F6 00 29                 2919         .word     41	; ")"
      0090F8 CD 90 B5         [ 4] 2920         CALL     PARSE
      0090FB CC 87 34         [ 2] 2921         JP     DDROP
                                   2922 
                                   2923 ;       \       ( -- )
                                   2924 ;       Ignore following text till
                                   2925 ;       end of line.
      0090FE 90 F1                 2926         .word      LINK
                           001080  2927 LINK = . 
      009100 81                    2928 	.byte      IMEDD+1
      009101 5C                    2929         .ascii     "\"
      009102                       2930 BKSLA:
      009102 90 AE 00 0C      [ 2] 2931         ldw y,#UCTIB ; #TIB  
      009106 90 FE            [ 2] 2932         ldw y,(y)
      009108 90 89            [ 2] 2933         pushw y ; count in TIB 
      00910A 90 AE 00 0A      [ 2] 2934         ldw y,#UINN ; >IN 
      00910E 90 BF 24         [ 2] 2935         ldw YTEMP,y
      009111 90 85            [ 2] 2936         popw y 
      009113 91 CF 24         [ 5] 2937         ldw [YTEMP],y
      009116 81               [ 4] 2938         ret 
                                   2939 
                                   2940 ;       WORD    ( c -- a ; <string> )
                                   2941 ;       Parse a word from input stream
                                   2942 ;       and copy it to code dictionary.
      009117 91 00                 2943         .word      LINK
                           001099  2944 LINK = . 
      009119 04                    2945         .byte      4
      00911A 57 4F 52 44           2946         .ascii     "WORD"
      00911E                       2947 WORDD:
      00911E CD 90 B5         [ 4] 2948         CALL     PARSE
      009121 CD 8B A8         [ 4] 2949         CALL     HERE
      009124 CD 8A 23         [ 4] 2950         CALL     CELLP
      009127 CC 8C 68         [ 2] 2951         JP     PACKS
                                   2952 
                                   2953 ;       TOKEN   ( -- a ; <string> )
                                   2954 ;       Parse a word from input stream
                                   2955 ;       and copy it to name dictionary.
      00912A 91 19                 2956         .word      LINK
                           0010AC  2957 LINK = . 
      00912C 05                    2958         .byte      5
      00912D 54 4F 4B 45 4E        2959         .ascii     "TOKEN"
      009132                       2960 TOKEN:
      009132 CD 8A AD         [ 4] 2961         CALL     BLANK
      009135 CC 91 1E         [ 2] 2962         JP     WORDD
                                   2963 
                                   2964 ;; Dictionary search
                                   2965 
                                   2966 ;       NAME>   ( na -- ca )
                                   2967 ;       Return a code address given
                                   2968 ;       a name address.
      009138 91 2C                 2969         .word      LINK
                           0010BA  2970 LINK = . 
      00913A 05                    2971         .byte      5
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      00913B 4E 41 4D 45 3E        2972         .ascii     "NAME>"
      009140                       2973 NAMET:
      009140 CD 8B 91         [ 4] 2974         CALL     COUNT
      009143 CD 84 34         [ 4] 2975         CALL     DOLIT
      009146 00 1F                 2976         .word      31
      009148 CD 85 A5         [ 4] 2977         CALL     ANDD
      00914B CC 87 54         [ 2] 2978         JP     PLUS
                                   2979 
                                   2980 ;       SAME?   ( a a u -- a a f \ -0+ )
                                   2981 ;       Compare u cells in two
                                   2982 ;       strings. Return 0 if identical.
      00914E 91 3A                 2983         .word      LINK
                           0010D0  2984 LINK = . 
      009150 05                    2985         .byte       5
      009151 53 41 4D 45 3F        2986         .ascii     "SAME?"
      009156                       2987 SAMEQ:
      009156 CD 8A 5B         [ 4] 2988         CALL     ONEM
      009159 CD 85 22         [ 4] 2989         CALL     TOR
      00915C 20 29            [ 2] 2990         JRA     SAME2
      00915E CD 85 83         [ 4] 2991 SAME1:  CALL     OVER
      009161 CD 85 16         [ 4] 2992         CALL     RAT
      009164 CD 87 54         [ 4] 2993         CALL     PLUS
      009167 CD 84 D0         [ 4] 2994         CALL     CAT
      00916A CD 85 83         [ 4] 2995         CALL     OVER
      00916D CD 85 16         [ 4] 2996         CALL     RAT
      009170 CD 87 54         [ 4] 2997         CALL     PLUS
      009173 CD 84 D0         [ 4] 2998         CALL     CAT
      009176 CD 87 CD         [ 4] 2999         CALL     SUBB
      009179 CD 87 03         [ 4] 3000         CALL     QDUP
      00917C CD 84 67         [ 4] 3001         CALL     QBRAN
      00917F 91 87                 3002         .word      SAME2
      009181 CD 85 03         [ 4] 3003         CALL     RFROM
      009184 CC 85 4F         [ 2] 3004         JP     DROP
      009187 CD 84 48         [ 4] 3005 SAME2:  CALL     DONXT
      00918A 91 5E                 3006         .word      SAME1
      00918C CC 8A BA         [ 2] 3007         JP     ZERO
                                   3008 
                                   3009 ;       find    ( a va -- ca na | a F )
                                   3010 ;       Search vocabulary for string.
                                   3011 ;       Return ca and na if succeeded.
      00918F 91 50                 3012         .word      LINK
                           001111  3013 LINK = . 
      009191 04                    3014         .byte      4
      009192 46 49 4E 44           3015         .ascii     "FIND"
      009196                       3016 FIND:
      009196 CD 85 69         [ 4] 3017         CALL     SWAPP
      009199 CD 85 59         [ 4] 3018         CALL     DUPP
      00919C CD 84 D0         [ 4] 3019         CALL     CAT
      00919F CD 86 25         [ 4] 3020         CALL     TEMP
      0091A2 CD 84 9B         [ 4] 3021         CALL     STORE
      0091A5 CD 85 59         [ 4] 3022         CALL     DUPP
      0091A8 CD 84 B2         [ 4] 3023         CALL     AT
      0091AB CD 85 22         [ 4] 3024         CALL     TOR
      0091AE CD 8A 23         [ 4] 3025         CALL     CELLP
      0091B1 CD 85 69         [ 4] 3026         CALL     SWAPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      0091B4 CD 84 B2         [ 4] 3027 FIND1:  CALL     AT
      0091B7 CD 85 59         [ 4] 3028         CALL     DUPP
      0091BA CD 84 67         [ 4] 3029         CALL     QBRAN
      0091BD 91 F3                 3030         .word      FIND6
      0091BF CD 85 59         [ 4] 3031         CALL     DUPP
      0091C2 CD 84 B2         [ 4] 3032         CALL     AT
      0091C5 CD 84 34         [ 4] 3033         CALL     DOLIT
      0091C8 1F 7F                 3034         .word      MASKK
      0091CA CD 85 A5         [ 4] 3035         CALL     ANDD
      0091CD CD 85 16         [ 4] 3036         CALL     RAT
      0091D0 CD 85 CE         [ 4] 3037         CALL     XORR
      0091D3 CD 84 67         [ 4] 3038         CALL     QBRAN
      0091D6 91 E2                 3039         .word      FIND2
      0091D8 CD 8A 23         [ 4] 3040         CALL     CELLP
      0091DB CD 84 34         [ 4] 3041         CALL     DOLIT
      0091DE FF FF                 3042         .word     0xFFFF
      0091E0 20 0C            [ 2] 3043         JRA     FIND3
      0091E2 CD 8A 23         [ 4] 3044 FIND2:  CALL     CELLP
      0091E5 CD 86 25         [ 4] 3045         CALL     TEMP
      0091E8 CD 84 B2         [ 4] 3046         CALL     AT
      0091EB CD 91 56         [ 4] 3047         CALL     SAMEQ
      0091EE CD 84 7E         [ 4] 3048 FIND3:  CALL     BRAN
      0091F1 92 02                 3049         .word      FIND4
      0091F3 CD 85 03         [ 4] 3050 FIND6:  CALL     RFROM
      0091F6 CD 85 4F         [ 4] 3051         CALL     DROP
      0091F9 CD 85 69         [ 4] 3052         CALL     SWAPP
      0091FC CD 8A 32         [ 4] 3053         CALL     CELLM
      0091FF CC 85 69         [ 2] 3054         JP     SWAPP
      009202 CD 84 67         [ 4] 3055 FIND4:  CALL     QBRAN
      009205 92 0F                 3056         .word      FIND5
      009207 CD 8A 32         [ 4] 3057         CALL     CELLM
      00920A CD 8A 32         [ 4] 3058         CALL     CELLM
      00920D 20 A5            [ 2] 3059         JRA     FIND1
      00920F CD 85 03         [ 4] 3060 FIND5:  CALL     RFROM
      009212 CD 85 4F         [ 4] 3061         CALL     DROP
      009215 CD 85 69         [ 4] 3062         CALL     SWAPP
      009218 CD 85 4F         [ 4] 3063         CALL     DROP
      00921B CD 8A 32         [ 4] 3064         CALL     CELLM
      00921E CD 85 59         [ 4] 3065         CALL     DUPP
      009221 CD 91 40         [ 4] 3066         CALL     NAMET
      009224 CC 85 69         [ 2] 3067         JP     SWAPP
                                   3068 
                                   3069 ;       NAME?   ( a -- ca na | a F )
                                   3070 ;       Search vocabularies for a string.
      009227 91 91                 3071         .word      LINK
                           0011A9  3072 LINK = . 
      009229 05                    3073         .byte      5
      00922A 4E 41 4D 45 3F        3074         .ascii     "NAME?"
      00922F                       3075 NAMEQ:
      00922F CD 86 99         [ 4] 3076         CALL   CNTXT
      009232 CC 91 96         [ 2] 3077         JP     FIND
                                   3078 
                                   3079 ;; Terminal response
                                   3080 
                                   3081 ;       ^H      ( bot eot cur -- bot eot cur )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



                                   3082 ;       Backup cursor by one character.
      009235 92 29                 3083         .word      LINK
                           0011B7  3084 LINK = . 
      009237 02                    3085         .byte      2
      009238 5E 48                 3086         .ascii     "^H"
      00923A                       3087 BKSP:
      00923A CD 85 22         [ 4] 3088         CALL     TOR
      00923D CD 85 83         [ 4] 3089         CALL     OVER
      009240 CD 85 03         [ 4] 3090         CALL     RFROM
      009243 CD 85 69         [ 4] 3091         CALL     SWAPP
      009246 CD 85 83         [ 4] 3092         CALL     OVER
      009249 CD 85 CE         [ 4] 3093         CALL     XORR
      00924C CD 84 67         [ 4] 3094         CALL     QBRAN
      00924F 92 6A                 3095         .word      BACK1
      009251 CD 84 34         [ 4] 3096         CALL     DOLIT
      009254 00 08                 3097         .word      BKSPP
      009256 CD 84 1E         [ 4] 3098         CALL     EMIT
      009259 CD 8A 5B         [ 4] 3099         CALL     ONEM
      00925C CD 8A AD         [ 4] 3100         CALL     BLANK
      00925F CD 84 1E         [ 4] 3101         CALL     EMIT
      009262 CD 84 34         [ 4] 3102         CALL     DOLIT
      009265 00 08                 3103         .word      BKSPP
      009267 CC 84 1E         [ 2] 3104         JP     EMIT
      00926A 81               [ 4] 3105 BACK1:  RET
                                   3106 
                                   3107 ;       TAP    ( bot eot cur c -- bot eot cur )
                                   3108 ;       Accept and echo key stroke
                                   3109 ;       and bump cursor.
      00926B 92 37                 3110         .word      LINK
                           0011ED  3111 LINK = . 
      00926D 03                    3112         .byte      3
      00926E 54 41 50              3113         .ascii     "TAP"
      009271                       3114 TAP:
      009271 CD 85 59         [ 4] 3115         CALL     DUPP
      009274 CD 84 1E         [ 4] 3116         CALL     EMIT
      009277 CD 85 83         [ 4] 3117         CALL     OVER
      00927A CD 84 BF         [ 4] 3118         CALL     CSTOR
      00927D CC 8A 4E         [ 2] 3119         JP     ONEP
                                   3120 
                                   3121 ;       kTAP    ( bot eot cur c -- bot eot cur )
                                   3122 ;       Process a key stroke,
                                   3123 ;       CR or backspace.
      009280 92 6D                 3124         .word      LINK
                           001202  3125 LINK = . 
      009282 04                    3126         .byte      4
      009283 4B 54 41 50           3127         .ascii     "KTAP"
      009287                       3128 KTAP:
      009287 CD 85 59         [ 4] 3129         CALL     DUPP
      00928A CD 84 34         [ 4] 3130         CALL     DOLIT
      00928D 00 0D                 3131         .word      CRR
      00928F CD 85 CE         [ 4] 3132         CALL     XORR
      009292 CD 84 67         [ 4] 3133         CALL     QBRAN
      009295 92 AD                 3134         .word      KTAP2
      009297 CD 84 34         [ 4] 3135         CALL     DOLIT
      00929A 00 08                 3136         .word      BKSPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      00929C CD 85 CE         [ 4] 3137         CALL     XORR
      00929F CD 84 67         [ 4] 3138         CALL     QBRAN
      0092A2 92 AA                 3139         .word      KTAP1
      0092A4 CD 8A AD         [ 4] 3140         CALL     BLANK
      0092A7 CC 92 71         [ 2] 3141         JP     TAP
      0092AA CC 92 3A         [ 2] 3142 KTAP1:  JP     BKSP
      0092AD CD 85 4F         [ 4] 3143 KTAP2:  CALL     DROP
      0092B0 CD 85 69         [ 4] 3144         CALL     SWAPP
      0092B3 CD 85 4F         [ 4] 3145         CALL     DROP
      0092B6 CC 85 59         [ 2] 3146         JP     DUPP
                                   3147 
                                   3148 ;       accept  ( b u -- b u )
                                   3149 ;       Accept characters to input
                                   3150 ;       buffer. Return with actual count.
      0092B9 92 82                 3151         .word      LINK
                           00123B  3152 LINK = . 
      0092BB 06                    3153         .byte      6
      0092BC 41 43 43 45 50 54     3154         .ascii     "ACCEPT"
      0092C2                       3155 ACCEP:
      0092C2 CD 85 83         [ 4] 3156         CALL     OVER
      0092C5 CD 87 54         [ 4] 3157         CALL     PLUS
      0092C8 CD 85 83         [ 4] 3158         CALL     OVER
      0092CB CD 87 3F         [ 4] 3159 ACCP1:  CALL     DDUP
      0092CE CD 85 CE         [ 4] 3160         CALL     XORR
      0092D1 CD 84 67         [ 4] 3161         CALL     QBRAN
      0092D4 92 F6                 3162         .word      ACCP4
      0092D6 CD 8E A0         [ 4] 3163         CALL     KEY
      0092D9 CD 85 59         [ 4] 3164         CALL     DUPP
      0092DC CD 8A AD         [ 4] 3165         CALL     BLANK
      0092DF CD 84 34         [ 4] 3166         CALL     DOLIT
      0092E2 00 7F                 3167         .word      127
      0092E4 CD 88 8F         [ 4] 3168         CALL     WITHI
      0092E7 CD 84 67         [ 4] 3169         CALL     QBRAN
      0092EA 92 F1                 3170         .word      ACCP2
      0092EC CD 92 71         [ 4] 3171         CALL     TAP
      0092EF 20 03            [ 2] 3172         JRA     ACCP3
      0092F1 CD 92 87         [ 4] 3173 ACCP2:  CALL     KTAP
      0092F4 20 D5            [ 2] 3174 ACCP3:  JRA     ACCP1
      0092F6 CD 85 4F         [ 4] 3175 ACCP4:  CALL     DROP
      0092F9 CD 85 83         [ 4] 3176         CALL     OVER
      0092FC CC 87 CD         [ 2] 3177         JP     SUBB
                                   3178 
                                   3179 ;       QUERY   ( -- )
                                   3180 ;       Accept input stream to
                                   3181 ;       terminal input buffer.
      0092FF 92 BB                 3182         .word      LINK
                                   3183         
                           001281  3184 LINK = . 
      009301 05                    3185         .byte      5
      009302 51 55 45 52 59        3186         .ascii     "QUERY"
      009307                       3187 QUERY:
      009307 CD 8B CA         [ 4] 3188         CALL     TIB
      00930A CD 84 34         [ 4] 3189         CALL     DOLIT
      00930D 00 50                 3190         .word      80
      00930F CD 92 C2         [ 4] 3191         CALL     ACCEP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



      009312 CD 86 44         [ 4] 3192         CALL     NTIB
      009315 CD 84 9B         [ 4] 3193         CALL     STORE
      009318 CD 85 4F         [ 4] 3194         CALL     DROP
      00931B CD 8A BA         [ 4] 3195         CALL     ZERO
      00931E CD 86 34         [ 4] 3196         CALL     INN
      009321 CC 84 9B         [ 2] 3197         JP     STORE
                                   3198 
                                   3199 ;       ABORT   ( -- )
                                   3200 ;       Reset data stack and
                                   3201 ;       jump to QUIT.
      009324 93 01                 3202         .word      LINK
                           0012A6  3203 LINK = . 
      009326 05                    3204         .byte      5
      009327 41 42 4F 52 54        3205         .ascii     "ABORT"
      00932C                       3206 ABORT:
      00932C CD 94 23         [ 4] 3207         CALL     PRESE
      00932F CC 94 40         [ 2] 3208         JP     QUIT
                                   3209 
                                   3210 ;       abort"  ( f -- )
                                   3211 ;       Run time routine of ABORT".
                                   3212 ;       Abort with a message.
      009332 93 26                 3213         .word      LINK
                           0012B4  3214 LINK = . 
      009334 46                    3215 	.byte      COMPO+6
      009335 41 42 4F 52 54        3216         .ascii     "ABORT"
      00933A 22                    3217         .byte      '"'
      00933B                       3218 ABORQ:
      00933B CD 84 67         [ 4] 3219         CALL     QBRAN
      00933E 93 5A                 3220         .word      ABOR2   ;text flag
      009340 CD 8F 36         [ 4] 3221         CALL     DOSTR
      009343 CD 8E D8         [ 4] 3222 ABOR1:  CALL     SPACE
      009346 CD 8B 91         [ 4] 3223         CALL     COUNT
      009349 CD 8F 02         [ 4] 3224         CALL     TYPES
      00934C CD 84 34         [ 4] 3225         CALL     DOLIT
      00934F 00 3F                 3226         .word     63 ; "?"
      009351 CD 84 1E         [ 4] 3227         CALL     EMIT
      009354 CD 8F 20         [ 4] 3228         CALL     CR
      009357 CC 93 2C         [ 2] 3229         JP     ABORT   ;pass error string
      00935A CD 8F 36         [ 4] 3230 ABOR2:  CALL     DOSTR
      00935D CC 85 4F         [ 2] 3231         JP     DROP
                                   3232 
                                   3233 ;; The text interpreter
                                   3234 
                                   3235 ;       $INTERPRET      ( a -- )
                                   3236 ;       Interpret a word. If failed,
                                   3237 ;       try to convert it to an integer.
      009360 93 34                 3238         .word      LINK
                           0012E2  3239 LINK = . 
      009362 0A                    3240         .byte      10
      009363 24 49 4E 54 45 52 50  3241         .ascii     "$INTERPRET"
             52 45 54
      00936D                       3242 INTER:
      00936D CD 92 2F         [ 4] 3243         CALL     NAMEQ
      009370 CD 87 03         [ 4] 3244         CALL     QDUP    ;?defined
      009373 CD 84 67         [ 4] 3245         CALL     QBRAN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      009376 93 97                 3246         .word      INTE1
      009378 CD 84 B2         [ 4] 3247         CALL     AT
      00937B CD 84 34         [ 4] 3248         CALL     DOLIT
      00937E 40 00                 3249 	.word       0x4000	; COMPO*256
      009380 CD 85 A5         [ 4] 3250         CALL     ANDD    ;?compile only lexicon bits
      009383 CD 93 3B         [ 4] 3251         CALL     ABORQ
      009386 0D                    3252         .byte      13
      009387 20 63 6F 6D 70 69 6C  3253         .ascii     " compile only"
             65 20 6F 6E 6C 79
      009394 CC 84 8E         [ 2] 3254         JP     EXECU
      009397 CD 8D CD         [ 4] 3255 INTE1:  CALL     NUMBQ   ;convert a number
      00939A CD 84 67         [ 4] 3256         CALL     QBRAN
      00939D 93 43                 3257         .word    ABOR1
      00939F 81               [ 4] 3258         RET
                                   3259 
                                   3260 ;       [       ( -- )
                                   3261 ;       Start  text interpreter.
      0093A0 93 62                 3262         .word      LINK
                           001322  3263 LINK = . 
      0093A2 81                    3264 	.byte      IMEDD+1
      0093A3 5B                    3265         .ascii     "["
      0093A4                       3266 LBRAC:
      0093A4 CD 84 34         [ 4] 3267         CALL   DOLIT
      0093A7 93 6D                 3268         .word  INTER
      0093A9 CD 86 77         [ 4] 3269         CALL   TEVAL
      0093AC CC 84 9B         [ 2] 3270         JP     STORE
                                   3271 
                                   3272 ;       .OK     ( -- )
                                   3273 ;       Display 'ok' while interpreting.
      0093AF 93 A2                 3274         .word      LINK
                           001331  3275 LINK = . 
      0093B1 03                    3276         .byte      3
      0093B2 2E 4F 4B              3277         .ascii     ".OK"
      0093B5                       3278 DOTOK:
      0093B5 CD 84 34         [ 4] 3279         CALL     DOLIT
      0093B8 93 6D                 3280         .word      INTER
      0093BA CD 86 77         [ 4] 3281         CALL     TEVAL
      0093BD CD 84 B2         [ 4] 3282         CALL     AT
      0093C0 CD 87 F5         [ 4] 3283         CALL     EQUAL
      0093C3 CD 84 67         [ 4] 3284         CALL     QBRAN
      0093C6 93 CF                 3285         .word      DOTO1
      0093C8 CD 8F 5F         [ 4] 3286         CALL     DOTQP
      0093CB 03                    3287         .byte      3
      0093CC 20 6F 6B              3288         .ascii     " ok"
      0093CF CC 8F 20         [ 2] 3289 DOTO1:  JP     CR
                                   3290 
                                   3291 ;       ?STACK  ( -- )
                                   3292 ;       Abort if stack underflows.
      0093D2 93 B1                 3293         .word      LINK
                           001354  3294 LINK = . 
      0093D4 06                    3295         .byte      6
      0093D5 3F 53 54 41 43 4B     3296         .ascii     "?STACK"
      0093DB                       3297 QSTAC: 
      0093DB CD 8A FC         [ 4] 3298         CALL     DEPTH
      0093DE CD 85 92         [ 4] 3299         CALL     ZLESS   ;check only for underflow
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      0093E1 CD 93 3B         [ 4] 3300         CALL     ABORQ
      0093E4 0B                    3301         .byte      11
      0093E5 20 75 6E 64 65 72 66  3302         .ascii     " underflow "
             6C 6F 77 20
      0093F0 81               [ 4] 3303         RET
                                   3304 
                                   3305 ;       EVAL    ( -- )
                                   3306 ;       Interpret  input stream.
      0093F1 93 D4                 3307         .word      LINK
                           001373  3308 LINK = . 
      0093F3 04                    3309         .byte      4
      0093F4 45 56 41 4C           3310         .ascii     "EVAL"
      0093F8                       3311 EVAL:
      0093F8 CD 91 32         [ 4] 3312 EVAL1:  CALL     TOKEN
      0093FB CD 85 59         [ 4] 3313         CALL     DUPP
      0093FE CD 84 D0         [ 4] 3314         CALL     CAT     ;?input stream empty
      009401 CD 84 67         [ 4] 3315         CALL     QBRAN
      009404 94 14                 3316         .word    EVAL2
      009406 CD 86 77         [ 4] 3317         CALL     TEVAL
      009409 CD 8B DE         [ 4] 3318         CALL     ATEXE
      00940C CD 93 DB         [ 4] 3319         CALL     QSTAC   ;evaluate input, check stack
      00940F CD 84 7E         [ 4] 3320         CALL     BRAN
      009412 93 F8                 3321         .word    EVAL1
      009414 CD 85 4F         [ 4] 3322 EVAL2:  CALL     DROP
      009417 CC 93 B5         [ 2] 3323         JP       DOTOK
                                   3324 
                                   3325 ;       PRESET  ( -- )
                                   3326 ;       Reset data stack pointer and
                                   3327 ;       terminal input buffer.
      00941A 93 F3                 3328         .word      LINK
                           00139C  3329 LINK = . 
      00941C 06                    3330         .byte      6
      00941D 50 52 45 53 45 54     3331         .ascii     "PRESET"
      009423                       3332 PRESE:
      009423 CD 84 34         [ 4] 3333         CALL     DOLIT
      009426 16 80                 3334         .word      SPP
      009428 CD 85 46         [ 4] 3335         CALL     SPSTO
      00942B CD 84 34         [ 4] 3336         CALL     DOLIT
      00942E 17 00                 3337         .word      TIBB
      009430 CD 86 44         [ 4] 3338         CALL     NTIB
      009433 CD 8A 23         [ 4] 3339         CALL     CELLP
      009436 CC 84 9B         [ 2] 3340         JP     STORE
                                   3341 
                                   3342 ;       QUIT    ( -- )
                                   3343 ;       Reset return stack pointer
                                   3344 ;       and start text interpreter.
      009439 94 1C                 3345         .word      LINK
                           0013BB  3346 LINK = . 
      00943B 04                    3347         .byte      4
      00943C 51 55 49 54           3348         .ascii     "QUIT"
      009440                       3349 QUIT:
      009440 CD 84 34         [ 4] 3350         CALL     DOLIT
      009443 17 FF                 3351         .word      RPP
      009445 CD 84 ED         [ 4] 3352         CALL     RPSTO   ;reset return stack pointer
      009448 CD 93 A4         [ 4] 3353 QUIT1:  CALL     LBRAC   ;start interpretation
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      00944B CD 93 07         [ 4] 3354 QUIT2:  CALL     QUERY   ;get input
      00944E CD 93 F8         [ 4] 3355         CALL     EVAL
      009451 20 F8            [ 2] 3356         JRA     QUIT2   ;continue till error
                                   3357 
                                   3358 ;; The compiler
                                   3359 
                                   3360 ;       '       ( -- ca )
                                   3361 ;       Search vocabularies for
                                   3362 ;       next word in input stream.
      009453 94 3B                 3363         .word      LINK
                           0013D5  3364 LINK = . 
      009455 01                    3365         .byte      1
      009456 27                    3366         .ascii     "'"
      009457                       3367 TICK:
      009457 CD 91 32         [ 4] 3368         CALL     TOKEN
      00945A CD 92 2F         [ 4] 3369         CALL     NAMEQ   ;?defined
      00945D CD 84 67         [ 4] 3370         CALL     QBRAN
      009460 93 43                 3371         .word      ABOR1
      009462 81               [ 4] 3372         RET     ;yes, push code address
                                   3373 
                                   3374 ;       ALLOT   ( n -- )
                                   3375 ;       Allocate n bytes to RAM 
      009463 94 55                 3376         .word      LINK
                           0013E5  3377         LINK = . 
      009465 05                    3378         .byte      5
      009466 41 4C 4C 4F 54        3379         .ascii     "ALLOT"
      00946B                       3380 ALLOT:
      00946B CD 86 A7         [ 4] 3381         CALL     VPP
                                   3382 ; must update APP_VP each time VP is modidied
      00946E CD 8B 2A         [ 4] 3383         call PSTOR 
      009471 CC 9C 03         [ 2] 3384         jp UPDATVP 
                                   3385 
                                   3386 ;       ,       ( w -- )
                                   3387 ;         Compile an integer into
                                   3388 ;         variable space.
      009474 94 65                 3389         .word      LINK
                           0013F6  3390 LINK = . 
      009476 01                    3391         .byte      1
      009477 2C                    3392         .ascii     ","
      009478                       3393 COMMA:
      009478 CD 8B A8         [ 4] 3394         CALL     HERE
      00947B CD 85 59         [ 4] 3395         CALL     DUPP
      00947E CD 8A 23         [ 4] 3396         CALL     CELLP   ;cell boundary
      009481 CD 86 A7         [ 4] 3397         CALL     VPP
      009484 CD 84 9B         [ 4] 3398         CALL     STORE
      009487 CC 84 9B         [ 2] 3399         JP     STORE
                                   3400 
                                   3401 ;       C,      ( c -- )
                                   3402 ;       Compile a byte into
                                   3403 ;       variables space.
      00948A 94 76                 3404        .word      LINK
                           00140C  3405 LINK = . 
      00948C 02                    3406         .byte      2
      00948D 43 2C                 3407         .ascii     "C,"
      00948F                       3408 CCOMMA:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



      00948F CD 8B A8         [ 4] 3409         CALL     HERE
      009492 CD 85 59         [ 4] 3410         CALL     DUPP
      009495 CD 8A 4E         [ 4] 3411         CALL     ONEP
      009498 CD 86 A7         [ 4] 3412         CALL     VPP
      00949B CD 84 9B         [ 4] 3413         CALL     STORE
      00949E CC 84 BF         [ 2] 3414         JP     CSTOR
                                   3415 
                                   3416 ;       [COMPILE]       ( -- ; <string> )
                                   3417 ;       Compile next immediate
                                   3418 ;       word into code dictionary.
      0094A1 94 8C                 3419         .word      LINK
                           001423  3420 LINK = . 
      0094A3 89                    3421 	.byte      IMEDD+9
      0094A4 5B 43 4F 4D 50 49 4C  3422         .ascii     "[COMPILE]"
             45 5D
      0094AD                       3423 BCOMP:
      0094AD CD 94 57         [ 4] 3424         CALL     TICK
      0094B0 CC 97 73         [ 2] 3425         JP     JSRC
                                   3426 
                                   3427 ;       COMPILE ( -- )
                                   3428 ;       Compile next jsr in
                                   3429 ;       colon list to code dictionary.
      0094B3 94 A3                 3430         .word      LINK
                           001435  3431 LINK = . 
      0094B5 47                    3432 	.byte      COMPO+7
      0094B6 43 4F 4D 50 49 4C 45  3433         .ascii     "COMPILE"
      0094BD                       3434 COMPI:
      0094BD CD 85 03         [ 4] 3435         CALL     RFROM
      0094C0 CD 85 59         [ 4] 3436         CALL     DUPP
      0094C3 CD 84 B2         [ 4] 3437         CALL     AT
      0094C6 CD 97 73         [ 4] 3438         CALL     JSRC    ;compile subroutine
      0094C9 CD 8A 23         [ 4] 3439         CALL     CELLP
      0094CC 90 93            [ 1] 3440         ldw y,x 
      0094CE 90 FE            [ 2] 3441         ldw y,(y)
      0094D0 1C 00 02         [ 2] 3442         addw x,#CELLL 
      0094D3 90 FC            [ 2] 3443         jp (y)
                                   3444 
                                   3445 ;       LITERAL ( w -- )
                                   3446 ;       Compile tos to dictionary
                                   3447 ;       as an integer literal.
      0094D5 94 B5                 3448         .word      LINK
                           001457  3449 LINK = . 
      0094D7 87                    3450 	.byte      IMEDD+7
      0094D8 4C 49 54 45 52 41 4C  3451         .ascii     "LITERAL"
      0094DF                       3452 LITER:
      0094DF CD 94 BD         [ 4] 3453         CALL     COMPI
      0094E2 84 34                 3454         .word DOLIT 
      0094E4 CC 94 78         [ 2] 3455         JP     COMMA
                                   3456 
                                   3457 ;       $,"     ( -- )
                                   3458 ;       Compile a literal string
                                   3459 ;       up to next " .
      0094E7 94 D7                 3460         .word      LINK
                           001469  3461 LINK = . 
      0094E9 03                    3462         .byte      3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      0094EA 24 2C 22              3463         .byte     '$',',','"'
      0094ED                       3464 STRCQ:
      0094ED CD 84 34         [ 4] 3465         CALL     DOLIT
      0094F0 00 22                 3466         .word     34	; "
      0094F2 CD 90 B5         [ 4] 3467         CALL     PARSE
      0094F5 CD 8B A8         [ 4] 3468         CALL     HERE
      0094F8 CD 8C 68         [ 4] 3469         CALL     PACKS   ;string to code dictionary
      0094FB CD 8B 91         [ 4] 3470         CALL     COUNT
      0094FE CD 87 54         [ 4] 3471         CALL     PLUS    ;calculate aligned end of string
      009501 CD 86 A7         [ 4] 3472         CALL     VPP
      009504 CC 84 9B         [ 2] 3473         JP     STORE
                                   3474 
                                   3475 ;; Structures
                                   3476 
                                   3477 ;       FOR     ( -- a )
                                   3478 ;       Start a FOR-NEXT loop
                                   3479 ;       structure in a colon definition.
      009507 94 E9                 3480         .word      LINK
                           001489  3481 LINK = . 
      009509 83                    3482 	.byte      IMEDD+3
      00950A 46 4F 52              3483         .ascii     "FOR"
      00950D                       3484 FOR:
      00950D CD 94 BD         [ 4] 3485         CALL     COMPI
      009510 85 22                 3486         .word TOR 
      009512 CC 8B A8         [ 2] 3487         JP     HERE
                                   3488 
                                   3489 ;       NEXT    ( a -- )
                                   3490 ;       Terminate a FOR-NEXT loop.
      009515 95 09                 3491         .word      LINK
                           001497  3492 LINK = . 
      009517 84                    3493 	.byte      IMEDD+4
      009518 4E 45 58 54           3494         .ascii     "NEXT"
      00951C                       3495 NEXT:
      00951C CD 94 BD         [ 4] 3496         CALL     COMPI
      00951F 84 48                 3497         .word DONXT 
      009521 CD 86 F3         [ 4] 3498         call ADRADJ
      009524 CC 94 78         [ 2] 3499         JP     COMMA
                                   3500 
                                   3501 ;       I ( -- n )
                                   3502 ;       stack FOR-NEXT COUNTER 
      009527 95 17                 3503         .word LINK 
                           0014A9  3504         LINK=.
      009529 01                    3505         .byte 1 
      00952A 49                    3506         .ascii "I"
      00952B                       3507 IFETCH: 
      00952B 1D 00 02         [ 2] 3508         subw x,#CELLL 
      00952E 16 03            [ 2] 3509         ldw y,(3,sp)
      009530 FF               [ 2] 3510         ldw (x),y 
      009531 81               [ 4] 3511         ret 
                                   3512 
                                   3513 ;       BEGIN   ( -- a )
                                   3514 ;       Start an infinite or
                                   3515 ;       indefinite loop structure.
      009532 95 29                 3516         .word      LINK
                           0014B4  3517 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      009534 85                    3518 	.byte      IMEDD+5
      009535 42 45 47 49 4E        3519         .ascii     "BEGIN"
      00953A                       3520 BEGIN:
      00953A CC 8B A8         [ 2] 3521         JP     HERE
                                   3522 
                                   3523 ;       UNTIL   ( a -- )
                                   3524 ;       Terminate a BEGIN-UNTIL
                                   3525 ;       indefinite loop structure.
      00953D 95 34                 3526         .word      LINK
                           0014BF  3527 LINK = . 
      00953F 85                    3528 	.byte      IMEDD+5
      009540 55 4E 54 49 4C        3529         .ascii     "UNTIL"
      009545                       3530 UNTIL:
      009545 CD 94 BD         [ 4] 3531         CALL     COMPI
      009548 84 67                 3532         .word    QBRAN 
      00954A CD 86 F3         [ 4] 3533         call ADRADJ
      00954D CC 94 78         [ 2] 3534         JP     COMMA
                                   3535 
                                   3536 ;       AGAIN   ( a -- )
                                   3537 ;       Terminate a BEGIN-AGAIN
                                   3538 ;       infinite loop structure.
      009550 95 3F                 3539         .word      LINK
                           0014D2  3540 LINK = . 
      009552 85                    3541 	.byte      IMEDD+5
      009553 41 47 41 49 4E        3542         .ascii     "AGAIN"
      009558                       3543 AGAIN:
      009558 CD 94 BD         [ 4] 3544         CALL     COMPI
      00955B 84 7E                 3545         .word BRAN
      00955D CD 86 F3         [ 4] 3546         call ADRADJ 
      009560 CC 94 78         [ 2] 3547         JP     COMMA
                                   3548 
                                   3549 ;       IF      ( -- A )
                                   3550 ;       Begin a conditional branch.
      009563 95 52                 3551         .word      LINK
                           0014E5  3552 LINK = . 
      009565 82                    3553 	.byte      IMEDD+2
      009566 49 46                 3554         .ascii     "IF"
      009568                       3555 IFF:
      009568 CD 94 BD         [ 4] 3556         CALL     COMPI
      00956B 84 67                 3557         .word QBRAN
      00956D CD 8B A8         [ 4] 3558         CALL     HERE
      009570 CD 8A BA         [ 4] 3559         CALL     ZERO
      009573 CC 94 78         [ 2] 3560         JP     COMMA
                                   3561 
                                   3562 ;       THEN        ( A -- )
                                   3563 ;       Terminate a conditional branch structure.
      009576 95 65                 3564         .word      LINK
                           0014F8  3565 LINK = . 
      009578 84                    3566 	.byte      IMEDD+4
      009579 54 48 45 4E           3567         .ascii     "THEN"
      00957D                       3568 THENN:
      00957D CD 8B A8         [ 4] 3569         CALL     HERE
      009580 CD 86 F3         [ 4] 3570         call ADRADJ 
      009583 CD 85 69         [ 4] 3571         CALL     SWAPP
      009586 CC 84 9B         [ 2] 3572         JP     STORE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



                                   3573 
                                   3574 ;       ELSE        ( A -- A )
                                   3575 ;       Start the false clause in an IF-ELSE-THEN structure.
      009589 95 78                 3576         .word      LINK
                           00150B  3577 LINK = . 
      00958B 84                    3578 	.byte      IMEDD+4
      00958C 45 4C 53 45           3579         .ascii     "ELSE"
      009590                       3580 ELSEE:
      009590 CD 94 BD         [ 4] 3581         CALL     COMPI
      009593 84 7E                 3582         .word BRAN
      009595 CD 8B A8         [ 4] 3583         CALL     HERE
      009598 CD 8A BA         [ 4] 3584         CALL     ZERO
      00959B CD 94 78         [ 4] 3585         CALL     COMMA
      00959E CD 85 69         [ 4] 3586         CALL     SWAPP
      0095A1 CD 8B A8         [ 4] 3587         CALL     HERE
      0095A4 CD 86 F3         [ 4] 3588         call ADRADJ 
      0095A7 CD 85 69         [ 4] 3589         CALL     SWAPP
      0095AA CC 84 9B         [ 2] 3590         JP     STORE
                                   3591 
                                   3592 ;       AHEAD       ( -- A )
                                   3593 ;       Compile a forward branch instruction.
      0095AD 95 8B                 3594         .word      LINK
                           00152F  3595 LINK = . 
      0095AF 85                    3596 	.byte      IMEDD+5
      0095B0 41 48 45 41 44        3597         .ascii     "AHEAD"
      0095B5                       3598 AHEAD:
      0095B5 CD 94 BD         [ 4] 3599         CALL     COMPI
      0095B8 84 7E                 3600         .word BRAN
      0095BA CD 8B A8         [ 4] 3601         CALL     HERE
      0095BD CD 8A BA         [ 4] 3602         CALL     ZERO
      0095C0 CC 94 78         [ 2] 3603         JP     COMMA
                                   3604 
                                   3605 ;       WHILE       ( a -- A a )
                                   3606 ;       Conditional branch out of a BEGIN-WHILE-REPEAT loop.
      0095C3 95 AF                 3607         .word      LINK
                           001545  3608 LINK = . 
      0095C5 85                    3609 	.byte      IMEDD+5
      0095C6 57 48 49 4C 45        3610         .ascii     "WHILE"
      0095CB                       3611 WHILE:
      0095CB CD 94 BD         [ 4] 3612         CALL     COMPI
      0095CE 84 67                 3613         .word QBRAN
      0095D0 CD 8B A8         [ 4] 3614         CALL     HERE
      0095D3 CD 8A BA         [ 4] 3615         CALL     ZERO
      0095D6 CD 94 78         [ 4] 3616         CALL     COMMA
      0095D9 CC 85 69         [ 2] 3617         JP     SWAPP
                                   3618 
                                   3619 ;       REPEAT      ( A a -- )
                                   3620 ;       Terminate a BEGIN-WHILE-REPEAT indefinite loop.
      0095DC 95 C5                 3621         .word      LINK
                           00155E  3622 LINK = . 
      0095DE 86                    3623         .byte      IMEDD+6
      0095DF 52 45 50 45 41 54     3624         .ascii     "REPEAT"
      0095E5                       3625 REPEA:
      0095E5 CD 94 BD         [ 4] 3626         CALL     COMPI
      0095E8 84 7E                 3627         .word BRAN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



      0095EA CD 86 F3         [ 4] 3628         call ADRADJ 
      0095ED CD 94 78         [ 4] 3629         CALL     COMMA
      0095F0 CD 8B A8         [ 4] 3630         CALL     HERE
      0095F3 CD 86 F3         [ 4] 3631         call ADRADJ 
      0095F6 CD 85 69         [ 4] 3632         CALL     SWAPP
      0095F9 CC 84 9B         [ 2] 3633         JP     STORE
                                   3634 
                                   3635 ;       AFT         ( a -- a A )
                                   3636 ;       Jump to THEN in a FOR-AFT-THEN-NEXT loop the first time through.
      0095FC 95 DE                 3637         .word      LINK
                           00157E  3638 LINK = . 
      0095FE 83                    3639 	.byte      IMEDD+3
      0095FF 41 46 54              3640         .ascii     "AFT"
      009602                       3641 AFT:
      009602 CD 85 4F         [ 4] 3642         CALL     DROP
      009605 CD 95 B5         [ 4] 3643         CALL     AHEAD
      009608 CD 8B A8         [ 4] 3644         CALL     HERE
      00960B CC 85 69         [ 2] 3645         JP     SWAPP
                                   3646 
                                   3647 ;       ABORT"      ( -- ; <string> )
                                   3648 ;       Conditional abort with an error message.
      00960E 95 FE                 3649         .word      LINK
                           001590  3650 LINK = . 
      009610 86                    3651 	.byte      IMEDD+6
      009611 41 42 4F 52 54        3652         .ascii     "ABORT"
      009616 22                    3653         .byte      '"'
      009617                       3654 ABRTQ:
      009617 CD 94 BD         [ 4] 3655         CALL     COMPI
      00961A 93 3B                 3656         .word ABORQ
      00961C CC 94 ED         [ 2] 3657         JP     STRCQ
                                   3658 
                                   3659 ;       $"     ( -- ; <string> )
                                   3660 ;       Compile an inline string literal.
      00961F 96 10                 3661         .word      LINK
                           0015A1  3662 LINK = . 
      009621 82                    3663 	.byte      IMEDD+2
      009622 24 22                 3664         .byte     '$','"'
      009624                       3665 STRQ:
      009624 CD 94 BD         [ 4] 3666         CALL     COMPI
      009627 8F 55                 3667         .word STRQP 
      009629 CC 94 ED         [ 2] 3668         JP     STRCQ
                                   3669 
                                   3670 ;       ."          ( -- ; <string> )
                                   3671 ;       Compile an inline string literal to be typed out at run time.
      00962C 96 21                 3672         .word      LINK
                           0015AE  3673 LINK = . 
      00962E 82                    3674 	.byte      IMEDD+2
      00962F 2E 22                 3675         .byte     '.','"'
      009631                       3676 DOTQ:
      009631 CD 94 BD         [ 4] 3677         CALL     COMPI
      009634 8F 5F                 3678         .word DOTQP 
      009636 CC 94 ED         [ 2] 3679         JP     STRCQ
                                   3680 
                                   3681 ;; Name compiler
                                   3682 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



                                   3683 ;       ?UNIQUE ( a -- a )
                                   3684 ;       Display a warning message
                                   3685 ;       if word already exists.
      009639 96 2E                 3686         .word      LINK
                           0015BB  3687 LINK = . 
      00963B 07                    3688         .byte      7
      00963C 3F 55 4E 49 51 55 45  3689         .ascii     "?UNIQUE"
      009643                       3690 UNIQU:
      009643 CD 85 59         [ 4] 3691         CALL     DUPP
      009646 CD 92 2F         [ 4] 3692         CALL     NAMEQ   ;?name exists
      009649 CD 84 67         [ 4] 3693         CALL     QBRAN
      00964C 96 62                 3694         .word      UNIQ1
      00964E CD 8F 5F         [ 4] 3695         CALL     DOTQP   ;redef are OK
      009651 07                    3696         .byte       7
      009652 20 72 65 44 65 66 20  3697         .ascii     " reDef "       
      009659 CD 85 83         [ 4] 3698         CALL     OVER
      00965C CD 8B 91         [ 4] 3699         CALL     COUNT
      00965F CD 8F 02         [ 4] 3700         CALL     TYPES   ;just in case
      009662 CC 85 4F         [ 2] 3701 UNIQ1:  JP     DROP
                                   3702 
                                   3703 ;       $,n     ( na -- )
                                   3704 ;       Build a new dictionary name
                                   3705 ;       using string at na.
                                   3706 ; compile dans l'espace des variables 
      009665 96 3B                 3707         .word      LINK
                           0015E7  3708 LINK = . 
      009667 03                    3709         .byte      3
      009668 24 2C 6E              3710         .ascii     "$,n"
      00966B                       3711 SNAME:
      00966B CD 85 59         [ 4] 3712         CALL     DUPP
      00966E CD 84 D0         [ 4] 3713         CALL     CAT     ;?null input
      009671 CD 84 67         [ 4] 3714         CALL     QBRAN
      009674 96 A1                 3715         .word      PNAM1
      009676 CD 96 43         [ 4] 3716         CALL     UNIQU   ;?redefinition
      009679 CD 85 59         [ 4] 3717         CALL     DUPP
      00967C CD 8B 91         [ 4] 3718         CALL     COUNT
      00967F CD 87 54         [ 4] 3719         CALL     PLUS
      009682 CD 86 A7         [ 4] 3720         CALL     VPP
      009685 CD 84 9B         [ 4] 3721         CALL     STORE
      009688 CD 85 59         [ 4] 3722         CALL     DUPP
      00968B CD 86 C5         [ 4] 3723         CALL     LAST
      00968E CD 84 9B         [ 4] 3724         CALL     STORE   ;save na for vocabulary link
      009691 CD 8A 32         [ 4] 3725         CALL     CELLM   ;link address
      009694 CD 86 99         [ 4] 3726         CALL     CNTXT
      009697 CD 84 B2         [ 4] 3727         CALL     AT
      00969A CD 85 69         [ 4] 3728         CALL     SWAPP
      00969D CD 84 9B         [ 4] 3729         CALL     STORE
      0096A0 81               [ 4] 3730         RET     ;save code pointer
      0096A1 CD 8F 55         [ 4] 3731 PNAM1:  CALL     STRQP
      0096A4 05                    3732         .byte      5
      0096A5 20 6E 61 6D 65        3733         .ascii     " name" ;null input
      0096AA CC 93 43         [ 2] 3734         JP     ABOR1
                                   3735 
                                   3736 ;; FORTH compiler
                                   3737 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



                                   3738 ;       $COMPILE        ( a -- )
                                   3739 ;       Compile next word to
                                   3740 ;       dictionary as a token or literal.
      0096AD 96 67                 3741         .word      LINK
                           00162F  3742 LINK = . 
      0096AF 08                    3743         .byte      8
      0096B0 24 43 4F 4D 50 49 4C  3744         .ascii     "$COMPILE"
             45
      0096B8                       3745 SCOMP:
      0096B8 CD 92 2F         [ 4] 3746         CALL     NAMEQ
      0096BB CD 87 03         [ 4] 3747         CALL     QDUP    ;?defined
      0096BE CD 84 67         [ 4] 3748         CALL     QBRAN
      0096C1 96 D9                 3749         .word      SCOM2
      0096C3 CD 84 B2         [ 4] 3750         CALL     AT
      0096C6 CD 84 34         [ 4] 3751         CALL     DOLIT
      0096C9 80 00                 3752         .word     0x8000	;  IMEDD*256
      0096CB CD 85 A5         [ 4] 3753         CALL     ANDD    ;?immediate
      0096CE CD 84 67         [ 4] 3754         CALL     QBRAN
      0096D1 96 D6                 3755         .word      SCOM1
      0096D3 CC 84 8E         [ 2] 3756         JP     EXECU
      0096D6 CC 97 73         [ 2] 3757 SCOM1:  JP     JSRC
      0096D9 CD 8D CD         [ 4] 3758 SCOM2:  CALL     NUMBQ   ;try to convert to number
      0096DC CD 84 67         [ 4] 3759         CALL     QBRAN
      0096DF 93 43                 3760         .word      ABOR1
      0096E1 CC 94 DF         [ 2] 3761         JP     LITER
                                   3762 
                                   3763 ;       OVERT   ( -- )
                                   3764 ;       Link a new word into vocabulary.
      0096E4 96 AF                 3765         .word      LINK
                           001666  3766 LINK = . 
      0096E6 05                    3767         .byte      5
      0096E7 4F 56 45 52 54        3768         .ascii     "OVERT"
      0096EC                       3769 OVERT:
      0096EC CD 86 C5         [ 4] 3770         CALL     LAST
      0096EF CD 84 B2         [ 4] 3771         CALL     AT
      0096F2 CD 86 99         [ 4] 3772         CALL     CNTXT
      0096F5 CC 84 9B         [ 2] 3773         JP     STORE
                                   3774 
                                   3775 ;       ;       ( -- )
                                   3776 ;       Terminate a colon definition.
      0096F8 96 E6                 3777         .word      LINK
                           00167A  3778 LINK = . 
      0096FA C1                    3779 	.byte      IMEDD+COMPO+1
      0096FB 3B                    3780         .ascii     ";"
      0096FC                       3781 SEMIS:
                           000001  3782 .if OPTIMIZE ; more compact and faster
      0096FC CD 84 34         [ 4] 3783         call DOLIT 
      0096FF 00 81                 3784         .word 0x81   ; opcode for RET 
      009701 CD 94 8F         [ 4] 3785         call CCOMMA 
                           000000  3786 .else
                                   3787         CALL     COMPI
                                   3788         .word EXIT 
                                   3789 .endif 
      009704 CD 93 A4         [ 4] 3790         CALL     LBRAC
      009707 CD 96 EC         [ 4] 3791         call OVERT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      00970A CD A0 CF         [ 4] 3792         CALL FMOVE
      00970D CD 87 03         [ 4] 3793         call QDUP 
      009710 CD 84 67         [ 4] 3794         call QBRAN 
      009713 98 43                 3795         .word SET_RAMLAST 
      009715 CD A1 63         [ 4] 3796         CALL UPDATPTR
      009718 81               [ 4] 3797         RET 
                                   3798 
                                   3799 
                                   3800 ;       Terminate an ISR definition 
                                   3801 ;       retourn ca of ISR as double
                                   3802 ;       I; ( -- ud )
      009719 96 FA                 3803         .word LINK 
                           00169B  3804         LINK=.
      00971B C2                    3805         .byte 2+IMEDD+COMPO 
      00971C 49 3B                 3806         .ascii "I;" 
      00971E                       3807 ISEMI:
      00971E 1D 00 02         [ 2] 3808         subw x,#CELLL  
      009721 90 AE 00 80      [ 2] 3809         ldw y,#IRET_CODE 
      009725 FF               [ 2] 3810         ldw (x),y 
      009726 CD 94 8F         [ 4] 3811         call CCOMMA
      009729 CD 93 A4         [ 4] 3812         call LBRAC 
      00972C CD A1 A8         [ 4] 3813         call IFMOVE
      00972F CD 87 03         [ 4] 3814         call QDUP 
      009732 CD 84 67         [ 4] 3815         CALL QBRAN 
      009735 98 43                 3816         .word SET_RAMLAST
      009737 CD 86 B5         [ 4] 3817         CALL CPP
      00973A CD 84 B2         [ 4] 3818         call AT 
      00973D CD 85 69         [ 4] 3819         call SWAPP 
      009740 CD 86 B5         [ 4] 3820         CALL CPP 
      009743 CD 84 9B         [ 4] 3821         call STORE 
      009746 CD 9B EC         [ 4] 3822         call UPDATCP 
      009749 CD 9B A9         [ 4] 3823         call EEPVP 
      00974C CD 85 4F         [ 4] 3824         call DROP 
      00974F CD 84 B2         [ 4] 3825         call AT 
      009752 CD 86 A7         [ 4] 3826         call VPP 
      009755 CD 84 9B         [ 4] 3827         call STORE 
      009758 CC 8A BA         [ 2] 3828         jp ZERO
      00975B 81               [ 4] 3829         ret           
                                   3830         
                                   3831 
                                   3832 ;       ]       ( -- )
                                   3833 ;       Start compiling words in
                                   3834 ;       input stream.
      00975C 97 1B                 3835         .word      LINK
                           0016DE  3836 LINK = . 
      00975E 01                    3837         .byte      1
      00975F 5D                    3838         .ascii     "]"
      009760                       3839 RBRAC:
      009760 CD 84 34         [ 4] 3840         CALL   DOLIT
      009763 96 B8                 3841         .word  SCOMP
      009765 CD 86 77         [ 4] 3842         CALL   TEVAL
      009768 CC 84 9B         [ 2] 3843         JP     STORE
                                   3844 
                                   3845 ;       CALL,    ( ca -- )
                                   3846 ;       Compile a subroutine call.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



      00976B 97 5E                 3847         .word      LINK
                           0016ED  3848 LINK = . 
      00976D 05                    3849         .byte      5
      00976E 43 41 4C 4C 2C        3850         .ascii     "CALL,"
      009773                       3851 JSRC:
      009773 CD 84 34         [ 4] 3852         CALL     DOLIT
      009776 00 CD                 3853         .word     CALLL     ;CALL
      009778 CD 94 8F         [ 4] 3854         CALL     CCOMMA
      00977B CC 94 78         [ 2] 3855         JP     COMMA
                                   3856 
                                   3857 ;       INIT-OFS ( -- )
                                   3858 ;       compute offset to adjust jump address 
                                   3859 ;       set variable OFFSET 
      00977E 97 6D                 3860         .word LINK 
                           001700  3861         LINK=.
      009780 08                    3862         .byte 8 
      009781 49 4E 49 54 2D 4F 46  3863         .ascii "INIT-OFS" 
             53
      009789                       3864 INITOFS:
      009789 CD 86 66         [ 4] 3865         call TFLASH 
      00978C CD 84 B2         [ 4] 3866         CALL AT 
      00978F CD 85 59         [ 4] 3867         CALL DUPP 
      009792 CD 84 67         [ 4] 3868         call QBRAN
      009795 97 A6                 3869         .word 1$
      009797 CD 85 4F         [ 4] 3870         call DROP  
      00979A CD 86 B5         [ 4] 3871         call CPP 
      00979D CD 84 B2         [ 4] 3872         call AT 
      0097A0 CD 8B A8         [ 4] 3873         call HERE
      0097A3 CD 87 CD         [ 4] 3874         call SUBB 
      0097A6 CD 86 EA         [ 4] 3875 1$:     call OFFSET 
      0097A9 CC 84 9B         [ 2] 3876         jp STORE  
                                   3877 
                                   3878 ;       :       ( -- ; <string> )
                                   3879 ;       Start a new colon definition
                                   3880 ;       using next word as its name.
      0097AC 97 80                 3881         .word      LINK
                           00172E  3882 LINK = . 
      0097AE 01                    3883         .byte      1
      0097AF 3A                    3884         .ascii     ":"
      0097B0                       3885 COLON:
      0097B0 CD 97 89         [ 4] 3886         call INITOFS       
      0097B3 CD 91 32         [ 4] 3887         CALL   TOKEN
      0097B6 CD 96 6B         [ 4] 3888         CALL   SNAME
      0097B9 CC 97 60         [ 2] 3889         JP     RBRAC
                                   3890 
                                   3891 ;       I:  ( -- )
                                   3892 ;       Start interrupt service routine definition
                                   3893 ;       those definition have no name.
      0097BC 97 AE                 3894         .word LINK
                           00173E  3895         LINK=.
      0097BE 02                    3896         .byte 2 
      0097BF 49 3A                 3897         .ascii "I:" 
      0097C1                       3898 ICOLON:
      0097C1 CD 97 89         [ 4] 3899         call INITOFS 
      0097C4 CC 97 60         [ 2] 3900         jp RBRAC  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



                                   3901 
                                   3902 ;       IMMEDIATE       ( -- )
                                   3903 ;       Make last compiled word
                                   3904 ;       an immediate word.
      0097C7 97 BE                 3905         .word      LINK
                           001749  3906 LINK = . 
      0097C9 09                    3907         .byte      9
      0097CA 49 4D 4D 45 44 49 41  3908         .ascii     "IMMEDIATE"
             54 45
      0097D3                       3909 IMMED:
      0097D3 CD 84 34         [ 4] 3910         CALL     DOLIT
      0097D6 80 00                 3911         .word     0x8000	;  IMEDD*256
      0097D8 CD 86 C5         [ 4] 3912         CALL     LAST
      0097DB CD 84 B2         [ 4] 3913         CALL     AT
      0097DE CD 84 B2         [ 4] 3914         CALL     AT
      0097E1 CD 85 B9         [ 4] 3915         CALL     ORR
      0097E4 CD 86 C5         [ 4] 3916         CALL     LAST
      0097E7 CD 84 B2         [ 4] 3917         CALL     AT
      0097EA CC 84 9B         [ 2] 3918         JP     STORE
                                   3919 
                                   3920 ;; Defining words
                                   3921 
                                   3922 ;       CREATE  ( -- ; <string> )
                                   3923 ;       Compile a new array
                                   3924 ;       without allocating space.
      0097ED 97 C9                 3925         .word      LINK
                           00176F  3926 LINK = . 
      0097EF 06                    3927         .byte      6
      0097F0 43 52 45 41 54 45     3928         .ascii     "CREATE"
      0097F6                       3929 CREAT:
      0097F6 CD 91 32         [ 4] 3930         CALL     TOKEN
      0097F9 CD 96 6B         [ 4] 3931         CALL     SNAME
      0097FC CD 96 EC         [ 4] 3932         CALL     OVERT        
      0097FF CD 94 BD         [ 4] 3933         CALL     COMPI 
      009802 86 06                 3934         .word DOVAR 
      009804 81               [ 4] 3935         RET
                                   3936 
                                   3937 ;       VARIABLE        ( -- ; <string> )
                                   3938 ;       Compile a new variable
                                   3939 ;       initialized to 0.
      009805 97 EF                 3940         .word      LINK
                           001787  3941 LINK = . 
      009807 08                    3942         .byte      8
      009808 56 41 52 49 41 42 4C  3943         .ascii     "VARIABLE"
             45
      009810                       3944 VARIA:
                                   3945 ; indirect variable so that VARIABLE definition can be compiled in FLASH 
      009810 CD 8B A8         [ 4] 3946         CALL HERE
      009813 CD 85 59         [ 4] 3947         CALL DUPP 
      009816 CD 8A 23         [ 4] 3948         CALL CELLP
      009819 CD 86 A7         [ 4] 3949         CALL VPP 
      00981C CD 84 9B         [ 4] 3950         CALL STORE
      00981F CD 97 F6         [ 4] 3951         CALL CREAT
      009822 CD 85 59         [ 4] 3952         CALL DUPP
      009825 CD 94 78         [ 4] 3953         CALL COMMA
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      009828 CD 8A BA         [ 4] 3954         CALL ZERO
      00982B CD 85 69         [ 4] 3955         call SWAPP 
      00982E CD 84 9B         [ 4] 3956         CALL STORE
      009831 CD A0 CF         [ 4] 3957         CALL FMOVE ; move definition to FLASH
      009834 CD 87 03         [ 4] 3958         CALL QDUP 
      009837 CD 84 67         [ 4] 3959         CALL QBRAN 
      00983A 98 43                 3960         .word SET_RAMLAST   
      00983C CD 9C 03         [ 4] 3961         call UPDATVP  ; don't update if variable kept in RAM.
      00983F CD A1 63         [ 4] 3962         CALL UPDATPTR
      009842 81               [ 4] 3963         RET         
      009843                       3964 SET_RAMLAST: 
      009843 CD 86 C5         [ 4] 3965         CALL LAST 
      009846 CD 84 B2         [ 4] 3966         CALL AT 
      009849 CD 86 D8         [ 4] 3967         CALL RAMLAST 
      00984C CC 84 9B         [ 2] 3968         jp STORE  
                                   3969 
                                   3970 
                                   3971 ;       CONSTANT  ( n -- ; <string> )
                                   3972 ;       Compile a new constant 
                                   3973 ;       n CONSTANT name 
      00984F 98 07                 3974         .word LINK 
                           0017D1  3975         LINK=. 
      009851 08                    3976         .byte 8 
      009852 43 4F 4E 53 54 41 4E  3977         .ascii "CONSTANT" 
             54
      00985A                       3978 CONSTANT:          
      00985A CD 91 32         [ 4] 3979         CALL TOKEN
      00985D CD 96 6B         [ 4] 3980         CALL SNAME 
      009860 CD 96 EC         [ 4] 3981         CALL OVERT 
      009863 CD 94 BD         [ 4] 3982         CALL COMPI 
      009866 98 84                 3983         .word DOCONST
      009868 CD 94 78         [ 4] 3984         CALL COMMA 
      00986B CD A0 CF         [ 4] 3985         CALL FMOVE
      00986E CD 87 03         [ 4] 3986         CALL QDUP 
      009871 CD 84 67         [ 4] 3987         CALL QBRAN 
      009874 98 43                 3988         .word SET_RAMLAST  
      009876 CD A1 63         [ 4] 3989         CALL UPDATPTR  
      009879 81               [ 4] 3990 1$:     RET          
                                   3991 
                                   3992 ; CONSTANT runtime semantic 
                                   3993 ; doCONST  ( -- n )
      00987A 98 51                 3994         .word LINK 
                           0017FC  3995         LINK=.
      00987C 07                    3996         .byte 7
      00987D 44 4F 43 4F 4E 53 54  3997         .ascii "DOCONST"
      009884                       3998 DOCONST:
      009884 1D 00 02         [ 2] 3999         subw x,#CELLL
      009887 90 85            [ 2] 4000         popw y 
      009889 90 FE            [ 2] 4001         ldw y,(y) 
      00988B FF               [ 2] 4002         ldw (x),y 
      00988C 81               [ 4] 4003         ret 
                                   4004 
                                   4005 
                                   4006 ;; Tools
                                   4007 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



                                   4008 ;       _TYPE   ( b u -- )
                                   4009 ;       Display a string. Filter
                                   4010 ;       non-printing characters.
      00988D 98 7C                 4011         .word      LINK
                           00180F  4012 LINK = . 
      00988F 05                    4013         .byte      5
      009890 5F 54 59 50 45        4014         .ascii     "_TYPE"
      009895                       4015 UTYPE:
      009895 CD 85 22         [ 4] 4016         CALL     TOR     ;start count down loop
      009898 20 0F            [ 2] 4017         JRA     UTYP2   ;skip first pass
      00989A CD 85 59         [ 4] 4018 UTYP1:  CALL     DUPP
      00989D CD 84 D0         [ 4] 4019         CALL     CAT
      0098A0 CD 8A E4         [ 4] 4020         CALL     TCHAR
      0098A3 CD 84 1E         [ 4] 4021         CALL     EMIT    ;display only printable
      0098A6 CD 8A 4E         [ 4] 4022         CALL     ONEP    ;increment address
      0098A9 CD 84 48         [ 4] 4023 UTYP2:  CALL     DONXT
      0098AC 98 9A                 4024         .word      UTYP1   ;loop till done
      0098AE CC 85 4F         [ 2] 4025         JP     DROP
                                   4026 
                                   4027 ;       dm+     ( a u -- a )
                                   4028 ;       Dump u bytes from ,
                                   4029 ;       leaving a+u on  stack.
      0098B1 98 8F                 4030         .word      LINK
                           001833  4031 LINK = . 
      0098B3 03                    4032         .byte      3
      0098B4 64 6D 2B              4033         .ascii     "dm+"
      0098B7                       4034 DUMPP:
      0098B7 CD 85 83         [ 4] 4035         CALL     OVER
      0098BA CD 84 34         [ 4] 4036         CALL     DOLIT
      0098BD 00 04                 4037         .word      4
      0098BF CD 8F 88         [ 4] 4038         CALL     UDOTR   ;display address
      0098C2 CD 8E D8         [ 4] 4039         CALL     SPACE
      0098C5 CD 85 22         [ 4] 4040         CALL     TOR     ;start count down loop
      0098C8 20 11            [ 2] 4041         JRA     PDUM2   ;skip first pass
      0098CA CD 85 59         [ 4] 4042 PDUM1:  CALL     DUPP
      0098CD CD 84 D0         [ 4] 4043         CALL     CAT
      0098D0 CD 84 34         [ 4] 4044         CALL     DOLIT
      0098D3 00 03                 4045         .word      3
      0098D5 CD 8F 88         [ 4] 4046         CALL     UDOTR   ;display numeric data
      0098D8 CD 8A 4E         [ 4] 4047         CALL     ONEP    ;increment address
      0098DB CD 84 48         [ 4] 4048 PDUM2:  CALL     DONXT
      0098DE 98 CA                 4049         .word      PDUM1   ;loop till done
      0098E0 81               [ 4] 4050         RET
                                   4051 
                                   4052 ;       DUMP    ( a u -- )
                                   4053 ;       Dump u bytes from a,
                                   4054 ;       in a formatted manner.
      0098E1 98 B3                 4055         .word      LINK
                           001863  4056 LINK = . 
      0098E3 04                    4057         .byte      4
      0098E4 44 55 4D 50           4058         .ascii     "DUMP"
      0098E8                       4059 DUMP:
      0098E8 CD 86 16         [ 4] 4060         CALL     BASE
      0098EB CD 84 B2         [ 4] 4061         CALL     AT
      0098EE CD 85 22         [ 4] 4062         CALL     TOR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



      0098F1 CD 8D 60         [ 4] 4063         CALL     HEX     ;save radix, set hex
      0098F4 CD 84 34         [ 4] 4064         CALL     DOLIT
      0098F7 00 10                 4065         .word      16
      0098F9 CD 89 74         [ 4] 4066         CALL     SLASH   ;change count to lines
      0098FC CD 85 22         [ 4] 4067         CALL     TOR     ;start count down loop
      0098FF CD 8F 20         [ 4] 4068 DUMP1:  CALL     CR
      009902 CD 84 34         [ 4] 4069         CALL     DOLIT
      009905 00 10                 4070         .word      16
      009907 CD 87 3F         [ 4] 4071         CALL     DDUP
      00990A CD 98 B7         [ 4] 4072         CALL     DUMPP   ;display numeric
      00990D CD 87 14         [ 4] 4073         CALL     ROT
      009910 CD 87 14         [ 4] 4074         CALL     ROT
      009913 CD 8E D8         [ 4] 4075         CALL     SPACE
      009916 CD 8E D8         [ 4] 4076         CALL     SPACE
      009919 CD 98 95         [ 4] 4077         CALL     UTYPE   ;display printable characters
      00991C CD 84 48         [ 4] 4078         CALL     DONXT
      00991F 98 FF                 4079         .word      DUMP1   ;loop till done
      009921 CD 85 4F         [ 4] 4080 DUMP3:  CALL     DROP
      009924 CD 85 03         [ 4] 4081         CALL     RFROM
      009927 CD 86 16         [ 4] 4082         CALL     BASE
      00992A CC 84 9B         [ 2] 4083         JP     STORE   ;restore radix
                                   4084 
                                   4085 ;       .S      ( ... -- ... )
                                   4086 ;        Display  contents of stack.
      00992D 98 E3                 4087         .word      LINK
                           0018AF  4088 LINK = . 
      00992F 02                    4089         .byte      2
      009930 2E 53                 4090         .ascii     ".S"
      009932                       4091 DOTS:
      009932 CD 8F 20         [ 4] 4092         CALL     CR
      009935 CD 8A FC         [ 4] 4093         CALL     DEPTH   ;stack depth
      009938 CD 85 22         [ 4] 4094         CALL     TOR     ;start count down loop
      00993B 20 09            [ 2] 4095         JRA     DOTS2   ;skip first pass
      00993D CD 85 16         [ 4] 4096 DOTS1:  CALL     RAT
      009940 CD 8B 13         [ 4] 4097 	CALL     PICK
      009943 CD 8F BB         [ 4] 4098         CALL     DOT     ;index stack, display contents
      009946 CD 84 48         [ 4] 4099 DOTS2:  CALL     DONXT
      009949 99 3D                 4100         .word      DOTS1   ;loop till done
      00994B CD 8F 5F         [ 4] 4101         CALL     DOTQP
      00994E 05                    4102         .byte      5
      00994F 20 3C 73 70 20        4103         .ascii     " <sp "
      009954 81               [ 4] 4104         RET
                                   4105 
                                   4106 ;       >NAME   ( ca -- na | F )
                                   4107 ;       Convert code address
                                   4108 ;       to a name address.
      009955 99 2F                 4109         .word      LINK
                           0018D7  4110 LINK = . 
      009957 05                    4111         .byte      5
      009958 3E 4E 41 4D 45        4112         .ascii     ">NAME"
      00995D                       4113 TNAME:
      00995D CD 86 99         [ 4] 4114         CALL     CNTXT   ;vocabulary link
      009960 CD 84 B2         [ 4] 4115 TNAM2:  CALL     AT
      009963 CD 85 59         [ 4] 4116         CALL     DUPP    ;?last word in a vocabulary
      009966 CD 84 67         [ 4] 4117         CALL     QBRAN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



      009969 99 84                 4118         .word      TNAM4
      00996B CD 87 3F         [ 4] 4119         CALL     DDUP
      00996E CD 91 40         [ 4] 4120         CALL     NAMET
      009971 CD 85 CE         [ 4] 4121         CALL     XORR    ;compare
      009974 CD 84 67         [ 4] 4122         CALL     QBRAN
      009977 99 7E                 4123         .word      TNAM3
      009979 CD 8A 32         [ 4] 4124         CALL     CELLM   ;continue with next word
      00997C 20 E2            [ 2] 4125         JRA     TNAM2
      00997E CD 85 69         [ 4] 4126 TNAM3:  CALL     SWAPP
      009981 CC 85 4F         [ 2] 4127         JP     DROP
      009984 CD 87 34         [ 4] 4128 TNAM4:  CALL     DDROP
      009987 CC 8A BA         [ 2] 4129         JP     ZERO
                                   4130 
                                   4131 ;       .ID     ( na -- )
                                   4132 ;        Display  name at address.
      00998A 99 57                 4133         .word      LINK
                           00190C  4134 LINK = . 
      00998C 03                    4135         .byte      3
      00998D 2E 49 44              4136         .ascii     ".ID"
      009990                       4137 DOTID:
      009990 CD 87 03         [ 4] 4138         CALL     QDUP    ;if zero no name
      009993 CD 84 67         [ 4] 4139         CALL     QBRAN
      009996 99 A6                 4140         .word      DOTI1
      009998 CD 8B 91         [ 4] 4141         CALL     COUNT
      00999B CD 84 34         [ 4] 4142         CALL     DOLIT
      00999E 00 1F                 4143         .word      0x1F
      0099A0 CD 85 A5         [ 4] 4144         CALL     ANDD    ;mask lexicon bits
      0099A3 CC 98 95         [ 2] 4145         JP     UTYPE
      0099A6 CD 8F 5F         [ 4] 4146 DOTI1:  CALL     DOTQP
      0099A9 09                    4147         .byte      9
      0099AA 20 6E 6F 4E 61 6D 65  4148         .ascii     " noName"
      0099B1 81               [ 4] 4149         RET
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
      0099B2 99 8C                 4189         .word      LINK
                           001934  4190 LINK = . 
      0099B4 05                    4191         .byte      5
      0099B5 57 4F 52 44 53        4192         .ascii     "WORDS"
      0099BA                       4193 WORDS:
      0099BA CD 8F 20         [ 4] 4194         CALL     CR
      0099BD CD 86 99         [ 4] 4195         CALL     CNTXT   ;only in context
      0099C0 CD 84 B2         [ 4] 4196 WORS1:  CALL     AT
      0099C3 CD 87 03         [ 4] 4197         CALL     QDUP    ;?at end of list
      0099C6 CD 84 67         [ 4] 4198         CALL     QBRAN
      0099C9 99 DC                 4199         .word      WORS2
      0099CB CD 85 59         [ 4] 4200         CALL     DUPP
      0099CE CD 8E D8         [ 4] 4201         CALL     SPACE
      0099D1 CD 99 90         [ 4] 4202         CALL     DOTID   ;display a name
      0099D4 CD 8A 32         [ 4] 4203         CALL     CELLM
      0099D7 CD 84 7E         [ 4] 4204         CALL     BRAN
      0099DA 99 C0                 4205         .word      WORS1
      0099DC 81               [ 4] 4206 WORS2:  RET
                                   4207 
                                   4208         
                                   4209 ;; Hardware reset
                                   4210 
                                   4211 ;       hi      ( -- )
                                   4212 ;       Display sign-on message.
      0099DD 99 B4                 4213         .word      LINK
                           00195F  4214 LINK = . 
      0099DF 02                    4215         .byte      2
      0099E0 68 69                 4216         .ascii     "hi"
      0099E2                       4217 HI:
      0099E2 CD 8F 20         [ 4] 4218         CALL     CR
      0099E5 CD 8F 5F         [ 4] 4219         CALL     DOTQP   ;initialize I/O
      0099E8 0F                    4220         .byte      15
      0099E9 73 74 6D 38 65 46 6F  4221         .ascii     "stm8eForth v"
             72 74 68 20 76
      0099F5 33                    4222 	.byte      VER+'0'
      0099F6 2E                    4223         .byte      '.' 
      0099F7 30                    4224 	.byte      EXT+'0' ;version
      0099F8 CC 8F 20         [ 2] 4225         JP     CR
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
      0099FB 99 DF                 4363         .word      LINK
                           00197D  4364 LINK = . 
      0099FD 05                    4365         .byte      5
      0099FE 27 42 4F 4F 54        4366         .ascii     "'BOOT"
      009A03                       4367 TBOOT:
      009A03 CD 86 06         [ 4] 4368         CALL     DOVAR
      009A06 40 02                 4369         .word    APP_RUN      ;application to boot
                                   4370 
                                   4371 ;       COLD    ( -- )
                                   4372 ;       The hilevel cold start s=ence.
      009A08 99 FD                 4373         .word      LINK
                           00198A  4374         LINK = . 
      009A0A 04                    4375         .byte      4
      009A0B 43 4F 4C 44           4376         .ascii     "COLD"
      009A0F                       4377 COLD:
                           000000  4378 .if WANT_DEBUG
                                   4379         CALL DEBUG
                                   4380 .endif ; WANT_DEBUG
      009A0F CD 84 34         [ 4] 4381 COLD1:  CALL     DOLIT
      009A12 80 AB                 4382         .word      UZERO
      009A14 CD 84 34         [ 4] 4383 	CALL     DOLIT
      009A17 00 06                 4384         .word      UPP
      009A19 CD 84 34         [ 4] 4385         CALL     DOLIT
      009A1C 00 1A                 4386 	.word      UEND-UZERO
      009A1E CD 8B F5         [ 4] 4387         CALL     CMOVE   ;initialize user area
                                   4388 
                                   4389 ; if APP_RUN==0 initialize with ca de 'hi'  
      009A21 90 CE 40 02      [ 2] 4390         ldw y,APP_RUN 
      009A25 26 0B            [ 1] 4391         jrne 0$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



      009A27 1D 00 02         [ 2] 4392         subw x,#CELLL 
      009A2A 90 AE 99 E2      [ 2] 4393         ldw y,#HI  
      009A2E FF               [ 2] 4394         ldw (x),y
      009A2F CD 9B DB         [ 4] 4395         call UPDATRUN 
      009A32                       4396 0$:        
                                   4397 ; update LAST with APP_LAST 
                                   4398 ; if APP_LAST > LAST else do the opposite
      009A32 90 CE 40 00      [ 2] 4399         ldw y,APP_LAST 
      009A36 90 B3 1A         [ 2] 4400         cpw y,ULAST 
      009A39 22 05            [ 1] 4401         jrugt 1$ 
                                   4402 ; save LAST at APP_LAST  
      009A3B CD 9B C3         [ 4] 4403         call UPDATLAST 
      009A3E 20 06            [ 2] 4404         jra 2$
      009A40                       4405 1$: ; update LAST with APP_LAST 
      009A40 90 BF 1A         [ 2] 4406         ldw ULAST,y
      009A43 90 BF 14         [ 2] 4407         ldw UCNTXT,y
      009A46                       4408 2$:  
                                   4409 ; update APP_CP if < app_space 
      009A46 90 CE 40 04      [ 2] 4410         ldw y,APP_CP  
      009A4A 90 B3 18         [ 2] 4411         cpw y,UCP   
      009A4D 24 06            [ 1] 4412         jruge 3$ 
      009A4F CD 9B EC         [ 4] 4413         call UPDATCP
      009A52 90 BE 18         [ 2] 4414         ldw y,UCP   
      009A55                       4415 3$:
      009A55 90 BF 18         [ 2] 4416         ldw UCP,y                 
                                   4417 ; update UVP with APP_VP  
                                   4418 ; if APP_VP>UVP else do the opposite 
      009A58 90 CE 40 06      [ 2] 4419         ldw y,APP_VP 
      009A5C 90 B3 16         [ 2] 4420         cpw y,UVP 
      009A5F 22 05            [ 1] 4421         jrugt 4$
      009A61 CD 9C 03         [ 4] 4422         call UPDATVP 
      009A64 20 03            [ 2] 4423         jra 6$
      009A66                       4424 4$: ; update UVP with APP_VP 
      009A66 90 BF 16         [ 2] 4425         ldw UVP,y 
      009A69                       4426 6$:      
      009A69 CD 94 23         [ 4] 4427         CALL     PRESE   ;initialize data stack and TIB
      009A6C CD 9A 03         [ 4] 4428         CALL     TBOOT
      009A6F CD 8B DE         [ 4] 4429         CALL     ATEXE   ;application boot
      009A72 CD 96 EC         [ 4] 4430         CALL     OVERT
      009A75 CC 94 40         [ 2] 4431         JP     QUIT    ;start interpretation
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
      009A78 9A 0A                   31         .word LINK 
                           0019FA    32         LINK=.
      009A7A 02                      33         .byte 2
      009A7B 50 49                   34         .ascii "PI" 
      009A7D                         35 PII:
      009A7D 1D 00 04         [ 2]   36         subw x,#2*CELLL 
      009A80 90 AE 01 63      [ 2]   37         ldw y,#355 
      009A84 EF 02            [ 2]   38         ldw (2,x),y 
      009A86 90 AE 00 71      [ 2]   39         ldw y,#113 
      009A8A FF               [ 2]   40         ldw (x),y 
      009A8B 81               [ 4]   41         ret 
                                     42 
                                     43 ;      SQRT2 ( -- 19601  13860 )
                                     44 ; precision: 1.5e-9 
                                     45 ; usage example to compute Voltage peek to peek from Vrms 
                                     46 ; : VPP SQRT2 */ 2 * ;
                                     47 ;
      009A8C 9A 7A                   48         .word LINK 
                           001A0E    49         LINK=.
      009A8E 05                      50         .byte 5 
      009A8F 53 51 52 54 32          51         .ascii "SQRT2" 
      009A94                         52 SQRT2:
      009A94 1D 00 04         [ 2]   53         subw x,#2*CELLL 
      009A97 90 AE 4C 91      [ 2]   54         ldw y,#19601 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



      009A9B EF 02            [ 2]   55         ldw (2,x),y 
      009A9D 90 AE 36 24      [ 2]   56         ldw y,#13860 
      009AA1 FF               [ 2]   57         ldw (x),y 
      009AA2 81               [ 4]   58         ret 
                                     59 
                                     60 ;   SQRT3 ( -- 18817 10864 )
                                     61 ; precision: 1.1e-9
                                     62 ;
      009AA3 9A 8E                   63         .word LINK 
                           001A25    64         LINK=.
      009AA5 05                      65         .byte 5
      009AA6 53 51 52 54 33          66         .ascii "SQRT3" 
      009AAB                         67 SQRT3: 
      009AAB 1D 00 04         [ 2]   68     subw x,#2*CELLL 
      009AAE 90 AE 49 81      [ 2]   69     ldw y,#18817 
      009AB2 EF 02            [ 2]   70     ldw (2,x),y 
      009AB4 90 AE 2A 70      [ 2]   71     ldw y,#10864 
      009AB8 FF               [ 2]   72     ldw (x),y 
      009AB9 81               [ 4]   73     ret 
                                     74 
                                     75 ;   E ( -- 28667 10546 )
                                     76 ; precision: 5.5e-9 
                                     77 ; natural log base 
      009ABA 9A A5                   78         .word LINK 
                           001A3C    79         LINK=.
      009ABC 01                      80         .byte 1
      009ABD 45                      81         .ascii "E" 
      009ABE                         82 ENEPER:
      009ABE 1D 00 04         [ 2]   83     subw x,#2*CELLL 
      009AC1 90 AE 6F FB      [ 2]   84     ldw y,#28667 
      009AC5 EF 02            [ 2]   85     ldw (2,x),y 
      009AC7 90 AE 29 32      [ 2]   86     ldw y,#10546 
      009ACB FF               [ 2]   87     ldw (x),y 
      009ACC 81               [ 4]   88     ret 
                                     89 
                                     90 ;   SQRT10 ( -- 22936 7253 )
                                     91 ; precision: 5.7e-9 
      009ACD 9A BC                   92         .word LINK 
                           001A4F    93         LINK=.
      009ACF 06                      94         .byte 6 
      009AD0 53 51 52 54 31 30       95         .ascii "SQRT10" 
      009AD6                         96 SQRT10:
      009AD6 1D 00 04         [ 2]   97     subw x,#2*CELLL
      009AD9 90 AE 59 98      [ 2]   98     ldw y,#22936 
      009ADD EF 02            [ 2]   99     ldw (2,x),y 
      009ADF 90 AE 1C 55      [ 2]  100     ldw y,#7253
      009AE3 FF               [ 2]  101     ldw (x),y 
      009AE4 81               [ 4]  102     ret 
                                    103 
                                    104 ;   12RT2 ( -- 26797 25293 )
                                    105 ; precision: 1.0e-9 
                                    106 ; used in music to compute well tempered scale
      009AE5 9A CF                  107         .word LINK 
                           001A67   108         LINK=. 
      009AE7 05                     109         .byte 5 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



      009AE8 31 32 52 54 32         110         .ascii "12RT2"
      009AED                        111 RT12_2:
      009AED 1D 00 04         [ 2]  112     subw x,#2*CELLL 
      009AF0 90 AE 68 AD      [ 2]  113     ldw y,#26797
      009AF4 EF 02            [ 2]  114     ldw (2,x),y 
      009AF6 90 AE 62 CD      [ 2]  115     ldw y,#25293
      009AFA FF               [ 2]  116     ldw (x),y 
      009AFB 81               [ 4]  117     ret 
                                    118 
                                    119 ;   LOG2s ( -- 2040 11103 )
                                    120 ; log(2)/1.6384
                                    121 ; precision: 1.1e-8
      009AFC 9A E7                  122         .word LINK 
                           001A7E   123         LINK=.
      009AFE 05                     124         .byte 5 
      009AFF 4C 4F 47 32 53         125         .ascii "LOG2S" 
      009B04                        126 LOG2S:
      009B04 1D 00 04         [ 2]  127     subw x,#2*CELLL
      009B07 90 AE 07 F8      [ 2]  128     ldw y,#2040 
      009B0B EF 02            [ 2]  129     ldw (2,x),y 
      009B0D 90 AE 2B 5F      [ 2]  130     ldw y,#11103 
      009B11 FF               [ 2]  131     ldw (x),y 
      009B12 81               [ 4]  132     ret 
                                    133 
                                    134 ;   LN2 ( -- 485 11464 )
                                    135 ; ln(2)/16.384 
                                    136 ; precision: 1.0e-7 
      009B13 9A FE                  137         .word LINK 
                           001A95   138         LINK=.
      009B15 04                     139         .byte 4 
      009B16 4C 4E 32 53            140         .ascii "LN2S" 
      009B1A                        141 LN2S: 
      009B1A 1D 00 04         [ 2]  142     subw x,#2*CELLL
      009B1D 90 AE 01 E5      [ 2]  143     ldw y,#485
      009B21 EF 02            [ 2]  144     ldw (2,x),y 
      009B23 90 AE 2C C8      [ 2]  145     ldw y,#11464 
      009B27 FF               [ 2]  146     ldw (x),y 
      009B28 81               [ 4]  147     ret 
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
      009B29 9B 15                   30     .word LINK 
                           001AAB    31     LINK=.
      009B2B 03                      32     .byte 3 
      009B2C 46 50 21                33     .ascii "FP!"
      009B2F                         34 fptr_store:
      009B2F 90 93            [ 1]   35     ldw y,x
      009B31 90 FE            [ 2]   36     ldw y,(y)
      009B33 90 9F            [ 1]   37     ld a,yl 
      009B35 B7 32            [ 1]   38     ld FPTR,a 
      009B37 1C 00 02         [ 2]   39     addw x,#CELLL 
      009B3A 90 93            [ 1]   40     ldw y,x 
      009B3C 90 FE            [ 2]   41     ldw y,(y)
      009B3E 90 BF 33         [ 2]   42     ldw PTR16,y
      009B41 1C 00 02         [ 2]   43     addw x,#CELLL 
      009B44 81               [ 4]   44     ret 
                                     45 
                                     46 ;-----------------------------------
                                     47 ; return EEPROM base address 
                                     48 ; as a double 
                                     49 ;  EEPROM  ( -- ud )
                                     50 ;-----------------------------------
      009B45 9B 2B                   51     .word LINK 
                           001AC7    52 LINK=.
      009B47 06                      53     .byte 6 
      009B48 45 45 50 52 4F 4D       54     .ascii "EEPROM"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



      009B4E                         55 EEPROM: 
      009B4E 90 AE 40 00      [ 2]   56     ldw y,#EEPROM_BASE
      009B52 1D 00 04         [ 2]   57     subw x,#2*CELLL 
      009B55 EF 02            [ 2]   58     ldw (2,x),y 
      009B57 90 5F            [ 1]   59     clrw y 
      009B59 FF               [ 2]   60     ldw (x),y 
      009B5A 81               [ 4]   61     ret
                                     62 
                                     63 ;---------------------------------
                                     64 ; return APP_LAST pointer as double
                                     65 ; EEP-LAST ( -- ud )
                                     66 ;---------------------------------
      009B5B 9B 47                   67 	.word LINK 
                           001ADD    68 	LINK=.
      009B5D 08                      69 	.byte 8 
      009B5E 45 45 50 2D 4C 41 53    70 	.ascii "EEP-LAST"
             54
      009B66                         71 EEPLAST:
      009B66 1D 00 04         [ 2]   72 	subw x,#2*CELLL 
      009B69 90 AE 40 00      [ 2]   73 	ldw y,#APP_LAST 
      009B6D EF 02            [ 2]   74 	ldw (2,x),y 
      009B6F 90 5F            [ 1]   75 	clrw y 
      009B71 FF               [ 2]   76 	ldw (x),y 
      009B72 81               [ 4]   77 	ret 
                                     78 
                                     79 ;----------------------------------
                                     80 ; return APP_RUN pointer as double	
                                     81 ; EEP-RUN ( -- ud )
                                     82 ;-----------------------------------
      009B73 9B 5D                   83 	.word LINK 
                           001AF5    84 	LINK=.
      009B75 07                      85 	.byte 7
      009B76 45 45 50 2D 52 55 4E    86 	.ascii "EEP-RUN"
      009B7D                         87 EEPRUN:
      009B7D 1D 00 04         [ 2]   88 	subw x,#2*CELLL 
      009B80 90 AE 40 02      [ 2]   89 	ldw y,#APP_RUN 
      009B84 EF 02            [ 2]   90 	ldw (2,x),y 
      009B86 90 5F            [ 1]   91 	clrw y 
      009B88 FF               [ 2]   92 	ldw (x),y 
      009B89 81               [ 4]   93 	ret 
                                     94 
                                     95 ;------------------------------------
                                     96 ; return APP_CP pointer as double 
                                     97 ; EEP-CP ( -- ud )
                                     98 ;------------------------------------
      009B8A 9B 75                   99 	.word LINK
                           001B0C   100 	LINK=.
      009B8C 06                     101 	.byte 6 
      009B8D 45 45 50 2D 43 50      102 	.ascii "EEP-CP"
      009B93                        103 EEPCP:
      009B93 1D 00 04         [ 2]  104 	subw x,#2*CELLL 
      009B96 90 AE 40 04      [ 2]  105 	ldw y,#APP_CP  
      009B9A EF 02            [ 2]  106 	ldw (2,x),y 
      009B9C 90 5F            [ 1]  107 	clrw y 
      009B9E FF               [ 2]  108 	ldw (x),y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



      009B9F 81               [ 4]  109 	ret 
                                    110 
                                    111 ;------------------------------------
                                    112 ; return APP_VP pointer as double 
                                    113 ; EEP-VP ( -- ud )
                                    114 ;-------------------------------------
      009BA0 9B 8C                  115 	.word LINK
                           001B22   116 	LINK=.
      009BA2 06                     117 	.byte 6
      009BA3 45 45 50 2D 56 50      118 	.ascii "EEP-VP"
      009BA9                        119 EEPVP:
      009BA9 1D 00 04         [ 2]  120 	subw x,#2*CELLL 
      009BAC 90 AE 40 06      [ 2]  121 	ldw y,#APP_VP  
      009BB0 EF 02            [ 2]  122 	ldw (2,x),y 
      009BB2 90 5F            [ 1]  123 	clrw y 
      009BB4 FF               [ 2]  124 	ldw (x),y 
      009BB5 81               [ 4]  125 	ret 
                                    126 
                                    127 ;----------------------------------
                                    128 ; update APP_LAST with LAST 
                                    129 ; UPDAT-LAST ( -- )
                                    130 ;----------------------------------
      009BB6 9B A2                  131 	.word LINK 
                           001B38   132 	LINK=.
      009BB8 0A                     133 	.byte 10
      009BB9 55 50 44 41 54 2D 4C   134 	.ascii "UPDAT-LAST"
             41 53 54
      009BC3                        135 UPDATLAST:
      009BC3 CD 86 C5         [ 4]  136 	call LAST
      009BC6 CD 84 B2         [ 4]  137 	call AT  
      009BC9 CD 9B 66         [ 4]  138 	call EEPLAST
      009BCC CC 9D 3F         [ 2]  139 	jp ee_store 
                                    140 
                                    141 ;---------------------------------
                                    142 ; update APP_RUN 
                                    143 ; UPDAT-RUN ( a -- )
                                    144 ;---------------------------------
      009BCF 9B B8                  145 	.word LINK
                           001B51   146 	LINK=.
      009BD1 09                     147 	.byte 9
      009BD2 55 50 44 41 54 2D 52   148 	.ascii "UPDAT-RUN"
             55 4E
      009BDB                        149 UPDATRUN:
      009BDB CD 9B 7D         [ 4]  150 	call EEPRUN
      009BDE CC 9D 3F         [ 2]  151 	jp ee_store 
                                    152 	
                                    153 ;---------------------------------
                                    154 ; update APP_CP with CP 
                                    155 ; UPDAT-CP ( -- )
                                    156 ;---------------------------------
      009BE1 9B D1                  157 	.word LINK 
                           001B63   158 	LINK=.
      009BE3 08                     159 	.byte 8 
      009BE4 55 50 44 41 54 2D 43   160 	.ascii "UPDAT-CP"
             50
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      009BEC                        161 UPDATCP:
      009BEC CD 86 B5         [ 4]  162 	call CPP 
      009BEF CD 84 B2         [ 4]  163 	call AT 
      009BF2 CD 9B 93         [ 4]  164 	call EEPCP 
      009BF5 CC 9D 3F         [ 2]  165 	jp ee_store 
                                    166 
                                    167 ;----------------------------------
                                    168 ; update APP_VP with VP 
                                    169 ; UPDAT-VP ( -- )
                                    170 ;----------------------------------
      009BF8 9B E3                  171 	.word LINK
                           001B7A   172 	LINK=.
      009BFA 08                     173 	.byte 8 
      009BFB 55 50 44 41 54 2D 56   174 	.ascii "UPDAT-VP" 
             50
      009C03                        175 UPDATVP:
      009C03 CD 86 A7         [ 4]  176 	call VPP 
      009C06 CD 84 B2         [ 4]  177 	call AT
      009C09 CD 9B A9         [ 4]  178 	call EEPVP 
      009C0C CC 9D 3F         [ 2]  179 	jp ee_store
                                    180 	
                                    181 
                                    182 ;----------------------------------
                                    183 ; fetch integer at address over 65535
                                    184 ;  F@   ( ud -- n )
                                    185 ;----------------------------------
      009C0F 9B FA                  186     .word LINK 
                           001B91   187 LINK=.
      009C11 02                     188     .byte 2
      009C12 46 40                  189     .ascii "F@"
      009C14                        190 farat:
      009C14 CD 9B 2F         [ 4]  191     call fptr_store
      009C17 92 BC 00 32      [ 5]  192     ldf a,[FPTR]
      009C1B 1D 00 02         [ 2]  193     subw x,#CELLL 
      009C1E F7               [ 1]  194     ld (x),a 
      009C1F 90 AE 00 01      [ 2]  195     ldw y,#1
      009C23 91 AF 00 32      [ 1]  196     ldf a,([FPTR],y)
      009C27 E7 01            [ 1]  197     ld (1,x),a
      009C29 81               [ 4]  198     ret 
                                    199 
                                    200 ;-------------------------------------
                                    201 ; fetch C at address over 65535 
                                    202 ; FC@ ( ud -- c)
                                    203 ;-------------------------------------
      009C2A 9C 11                  204     .word LINK
                           001BAC   205     LINK=.
      009C2C 03                     206     .byte 3 
      009C2D 46 43 40               207     .ascii "FC@" 
      009C30                        208 farcat:
      009C30 CD 9B 2F         [ 4]  209     call fptr_store 
      009C33 92 BC 00 32      [ 5]  210     ldf a,[FPTR]
      009C37 1D 00 02         [ 2]  211     subw x,#CELLL 
      009C3A E7 01            [ 1]  212     ld (1,x),a 
      009C3C 7F               [ 1]  213     clr (x)
      009C3D 81               [ 4]  214     ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



                                    215     
                                    216 ;----------------------------------
                                    217 ; unlock EEPROM/OPT for writing/erasing
                                    218 ; wait endlessly for FLASH_IAPSR_DUL bit.
                                    219 ;  UNLKEE   ( -- )
                                    220 ;----------------------------------
      009C3E 9C 2C                  221     .word LINK 
                           001BC0   222 LINK=.
      009C40 06                     223     .byte 6 
      009C41 55 4E 4C 4B 45 45      224     .ascii "UNLKEE"
      009C47                        225 unlock_eeprom:
      009C47 35 00 50 5B      [ 1]  226 	mov FLASH_CR2,#0 
      009C4B 35 FF 50 5C      [ 1]  227 	mov FLASH_NCR2,#0xFF 
      009C4F 35 AE 50 64      [ 1]  228 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      009C53 35 56 50 64      [ 1]  229     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      009C57 72 07 50 5F FB   [ 2]  230 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      009C5C 81               [ 4]  231 	ret
                                    232 
                                    233 ;----------------------------------
                                    234 ; unlock FLASH for writing/erasing
                                    235 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                    236 ; UNLKFL  ( -- )
                                    237 ;----------------------------------
      009C5D 9C 40                  238     .word LINK 
                           001BDF   239 LINK=. 
      009C5F 06                     240     .byte 6 
      009C60 55 4E 4C 4B 46 4C      241     .ascii "UNLKFL"    
      009C66                        242 unlock_flash:
      009C66 35 00 50 5B      [ 1]  243 	mov FLASH_CR2,#0 
      009C6A 35 FF 50 5C      [ 1]  244 	mov FLASH_NCR2,#0xFF 
      009C6E 35 56 50 62      [ 1]  245 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      009C72 35 AE 50 62      [ 1]  246 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      009C76 72 03 50 5F FB   [ 2]  247 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      009C7B 81               [ 4]  248 	ret
                                    249 
                                    250 ;-----------------------------
                                    251 ; unlock FLASH or EEPROM 
                                    252 ; according to FPTR address 
                                    253 ;  UNLOCK ( -- )
                                    254 ;-----------------------------
      009C7C 9C 5F                  255 	.word LINK 
                           001BFE   256 	LINK=.
      009C7E 06                     257 	.byte 6
      009C7F 55 4E 4C 4F 43 4B      258 	.ascii "UNLOCK"
      009C85                        259 unlock:
                                    260 ; put addr[15:0] in Y, for bounds check.
      009C85 90 BE 33         [ 2]  261 	ldw y,PTR16   ; Y=addr15:0
                                    262 ; check addr[23:16], if <> 0 then it is extened flash memory
      009C88 3D 32            [ 1]  263 	tnz FPTR 
      009C8A 26 16            [ 1]  264 	jrne 4$
      009C8C 90 A3 80 00      [ 2]  265     cpw y,#FLASH_BASE
      009C90 24 10            [ 1]  266     jruge 4$
      009C92 90 A3 40 00      [ 2]  267 	cpw y,#EEPROM_BASE  
      009C96 25 0D            [ 1]  268     jrult 9$
      009C98 90 A3 48 7F      [ 2]  269 	cpw y,#OPTION_END 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



      009C9C 22 07            [ 1]  270 	jrugt 9$
      009C9E CD 9C 47         [ 4]  271 	call unlock_eeprom
      009CA1 81               [ 4]  272 	ret 
      009CA2 CD 9C 66         [ 4]  273 4$: call unlock_flash
      009CA5 81               [ 4]  274 9$: ret 
                                    275 
                                    276 ;-------------------------
                                    277 ; lock write access to 
                                    278 ; FLASH and EEPROM 
                                    279 ; LOCK ( -- )
                                    280 ;-------------------------
      009CA6 9C 7E                  281 	.word LINK 
                           001C28   282 	LINK=.
      009CA8 04                     283 	.byte 4 
      009CA9 4C 4F 43 4B            284 	.ascii "LOCK" 
      009CAD                        285 lock: 
      009CAD 72 13 50 5F      [ 1]  286 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      009CB1 72 17 50 5F      [ 1]  287 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009CB5 81               [ 4]  288 	ret 
                                    289 
                                    290 ;-------------------------
                                    291 ; increment FPTR 
                                    292 ; INC-FPTR ( -- )
                                    293 ;-------------------------
      009CB6 9C A8                  294 	.word LINK 
                           001C38   295 	LINK=. 
      009CB8 08                     296 	.byte 8 
      009CB9 49 4E 43 2D 46 50 54   297 	.ascii "INC-FPTR" 
             52
      009CC1                        298 inc_fptr:
      009CC1 3C 34            [ 1]  299 	inc PTR8 
      009CC3 26 08            [ 1]  300 	jrne 1$
      009CC5 90 BE 32         [ 2]  301 	ldw y,FPTR 
      009CC8 90 5C            [ 2]  302 	incw y 
      009CCA 90 BF 32         [ 2]  303 	ldw FPTR,y 
      009CCD 81               [ 4]  304 1$: ret 
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
      009CCE 9C B8                  315 	.word LINK 
                           001C50   316 	LINK=. 
      009CD0 07                     317 	.byte 7 
      009CD1 57 52 2D 42 59 54 45   318 	.ascii "WR-BYTE" 
                                    319 
      009CD8                        320 write_byte:
      009CD8 90 93            [ 1]  321 	ldw y,x 
      009CDA 90 FE            [ 2]  322 	ldw y,(y)
      009CDC 1C 00 02         [ 2]  323 	addw x,#CELLL 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      009CDF 90 9F            [ 1]  324 	ld a,yl
      009CE1 92 BD 00 32      [ 4]  325 	ldf [FPTR],a
      009CE5 72 05 50 5F FB   [ 2]  326 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009CEA 20 D5            [ 2]  327 	jra inc_fptr 
                                    328 
                                    329 
                                    330 
                                    331 ;---------------------------------------
                                    332 ; write a byte to FLASH or EEPROM/OPTION  
                                    333 ; EEC!  (c ud -- )
                                    334 ;---------------------------------------
      009CEC 9C D0                  335     .word LINK 
                           001C6E   336 	LINK=.
      009CEE 04                     337     .byte 4 
      009CEF 45 45 43 21            338     .ascii "EEC!"
                                    339 	; local variables 
                           000001   340 	BTW = 1   ; byte to write offset on stack
                           000002   341     OPT = 2 
                           000002   342 	VSIZE = 2
      009CF3                        343 ee_cstore:
      009CF3 52 02            [ 2]  344 	sub sp,#VSIZE
      009CF5 CD 9B 2F         [ 4]  345     call fptr_store
      009CF8 E6 01            [ 1]  346 	ld a,(1,x)
      009CFA 43               [ 1]  347 	cpl a 
      009CFB 6B 01            [ 1]  348 	ld (BTW,sp),a ; byte to write 
      009CFD 0F 02            [ 1]  349 	clr (OPT,sp)  ; OPTION flag
      009CFF CD 9C 85         [ 4]  350 	call unlock 
                                    351 	; check if option
      009D02 3D 32            [ 1]  352 	tnz FPTR 
      009D04 26 19            [ 1]  353 	jrne 2$
      009D06 90 BE 33         [ 2]  354 	ldw y,PTR16 
      009D09 90 A3 48 00      [ 2]  355 	cpw y,#OPTION_BASE
      009D0D 2B 10            [ 1]  356 	jrmi 2$
      009D0F 90 A3 48 80      [ 2]  357 	cpw y,#OPTION_END+1
      009D13 2A 0A            [ 1]  358 	jrpl 2$
      009D15 03 02            [ 1]  359 	cpl (OPT,sp)
                                    360 	; OPTION WRITE require this unlock 
      009D17 72 1E 50 5B      [ 1]  361     bset FLASH_CR2,#FLASH_CR2_OPT
      009D1B 72 1F 50 5C      [ 1]  362     bres FLASH_NCR2,#FLASH_CR2_OPT 
      009D1F                        363 2$: 
      009D1F CD 9C D8         [ 4]  364 	call write_byte 	
      009D22 0D 02            [ 1]  365 	tnz (OPT,sp)
      009D24 27 0D            [ 1]  366 	jreq 3$ 
      009D26 7B 01            [ 1]  367     ld a,(BTW,sp)
      009D28 90 5F            [ 1]  368     clrw y
      009D2A 90 97            [ 1]  369 	ld yl,a 
      009D2C 1D 00 02         [ 2]  370 	subw x,#CELLL 
      009D2F FF               [ 2]  371 	ldw (x),y 
      009D30 CD 9C D8         [ 4]  372 	call write_byte
      009D33                        373 3$: 
      009D33 CD 9C AD         [ 4]  374 	call lock 
      009D36 5B 02            [ 2]  375 	addw sp,#VSIZE 
      009D38 81               [ 4]  376     ret
                                    377 
                                    378 ;------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



                                    379 ; write integer in FLASH|EEPROM
                                    380 ; EE! ( n ud -- )
                                    381 ;------------------------------
      009D39 9C EE                  382 	.word LINK 
                           001CBB   383 	LINK=.
      009D3B 03                     384 	.byte 3 
      009D3C 45 45 21               385 	.ascii "EE!"
      009D3F                        386 ee_store:
      009D3F CD 9B 2F         [ 4]  387 	call fptr_store 
      009D42 CD 9C 85         [ 4]  388 	call unlock 
      009D45 90 93            [ 1]  389 	ldw y,x 
      009D47 90 FE            [ 2]  390 	ldw y,(y)
      009D49 90 89            [ 2]  391 	pushw y 
      009D4B 90 5E            [ 1]  392 	swapw y 
      009D4D FF               [ 2]  393 	ldw (x),y 
      009D4E CD 9C D8         [ 4]  394 	call write_byte 
      009D51 90 85            [ 2]  395 	popw y 
      009D53 1D 00 02         [ 2]  396 	subw x,#CELLL
      009D56 FF               [ 2]  397 	ldw (x),y 
      009D57 CD 9C D8         [ 4]  398 	call write_byte
      009D5A CC 9C AD         [ 2]  399 	jp lock 
                                    400 
                                    401 
                                    402 ;----------------------------
                                    403 ; Erase flash memory row 
                                    404 ; stm8s208 as 128 bytes rows
                                    405 ; ROW-ERASE ( ud -- )
                                    406 ;----------------------------
      009D5D 9D 3B                  407 	.word LINK 
                           001CDF   408 	LINK=. 
      009D5F 09                     409 	.byte 9 
      009D60 52 4F 57 2D 45 52 41   410 	.ascii "ROW-ERASE" 
             53 45
      009D69                        411 row_erase:
      009D69 CD 9B 2F         [ 4]  412 	call fptr_store
                                    413 ;code must be execute from RAM 
                                    414 ;copy routine to PAD 
      009D6C 1D 00 02         [ 2]  415 	subw x,#CELLL 
      009D6F 90 AE 9D B6      [ 2]  416 	ldw y,#row_erase_proc
      009D73 FF               [ 2]  417 	ldw (x),y 
      009D74 CD 8B B9         [ 4]  418 	call PAD 
      009D77 90 AE 9D DD      [ 2]  419 	ldw y,#row_erase_proc_end 
      009D7B 72 A2 9D B6      [ 2]  420 	subw y,#row_erase_proc
      009D7F 1D 00 02         [ 2]  421 	subw x,#CELLL 
      009D82 FF               [ 2]  422 	ldw (x),y 
      009D83 CD 8B F5         [ 4]  423 	call CMOVE 
      009D86                        424 block_erase:
      009D86 90 BE 33         [ 2]  425 	ldw y,FPTR+1
      009D89 90 A3 A2 00      [ 2]  426 	cpw y,#app_space 
      009D8D 2A 13            [ 1]  427 	jrpl erase_flash 
                                    428 ; erase EEPROM block
      009D8F 90 A3 40 00      [ 2]  429 	cpw y,#EEPROM_BASE 
      009D93 24 01            [ 1]  430 	jruge 1$
      009D95 81               [ 4]  431 	ret ; bad address 
      009D96 90 A3 47 FF      [ 2]  432 1$: cpw y,#EEPROM_END 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



      009D9A 23 01            [ 2]  433 	jrule 2$ 
      009D9C 81               [ 4]  434 	ret ; bad address 
      009D9D                        435 2$:	
      009D9D CD 9C 47         [ 4]  436 	call unlock_eeprom 
      009DA0 20 03            [ 2]  437 	jra proceed_erase
                                    438 ; erase flash block:
      009DA2                        439 erase_flash:
      009DA2 CD 9C 66         [ 4]  440 	call unlock_flash 
      009DA5                        441 proceed_erase:
      009DA5 CD 8B B9         [ 4]  442 	call PAD 
      009DA8 90 93            [ 1]  443 	ldw y,x
      009DAA 90 FE            [ 2]  444 	ldw y,(y)
      009DAC 1C 00 02         [ 2]  445 	addw x,#CELLL  
      009DAF 90 FD            [ 4]  446 	call (y) 
      009DB1 72 17 50 5F      [ 1]  447 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009DB5 81               [ 4]  448 	ret 
                                    449 
                                    450 ; this routine is to be copied to PAD 
      009DB6                        451 row_erase_proc:
      009DB6 35 20 50 5B      [ 1]  452 	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
      009DBA 35 DF 50 5C      [ 1]  453 	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
      009DBE 4F               [ 1]  454 	clr a 
      009DBF 90 5F            [ 1]  455 	clrw y 
      009DC1 91 A7 00 32      [ 1]  456 	ldf ([FPTR],y),a
      009DC5 90 5C            [ 2]  457     incw y
      009DC7 91 A7 00 32      [ 1]  458 	ldf ([FPTR],y),a
      009DCB 90 5C            [ 2]  459     incw y
      009DCD 91 A7 00 32      [ 1]  460 	ldf ([FPTR],y),a
      009DD1 90 5C            [ 2]  461     incw y
      009DD3 91 A7 00 32      [ 1]  462 	ldf ([FPTR],y),a
      009DD7 72 05 50 5F FB   [ 2]  463 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009DDC 81               [ 4]  464 	ret
      009DDD                        465 row_erase_proc_end:
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
      009DDD                        478 copy_buffer:
      009DDD 4B 80            [ 1]  479 	push #BLOCK_SIZE  
                                    480 ;enable block programming 
      009DDF 72 10 50 5B      [ 1]  481 	bset FLASH_CR2,#FLASH_CR2_PRG 
      009DE3 72 11 50 5C      [ 1]  482 	bres FLASH_NCR2,#FLASH_CR2_PRG
      009DE7 90 5F            [ 1]  483 	clrw y
      009DE9 F6               [ 1]  484 1$:	ld a,(x)
      009DEA 91 A7 00 32      [ 1]  485 	ldf ([FPTR],y),a
      009DEE 5C               [ 2]  486 	incw x 
      009DEF 90 5C            [ 2]  487 	incw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



      009DF1 0A 01            [ 1]  488 	dec (BCNT,sp)
      009DF3 26 F4            [ 1]  489 	jrne 1$
                                    490 ; wait EOP bit 
      009DF5 72 05 50 5F FB   [ 2]  491 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. 
      009DFA 84               [ 1]  492 	pop a ; remove BCNT from stack 
      009DFB 81               [ 4]  493 	ret 
      009DFC                        494 copy_buffer_end:
                                    495 
                                    496 ;-------------------------
                                    497 ; move program_row to RAM 
                                    498 ; in TIB 
                                    499 ;------------------------
      009DFC                        500 copy_prog_to_ram:
      009DFC 1D 00 06         [ 2]  501 	subw x,#6
      009DFF 90 AE 9D DD      [ 2]  502 	ldw y,#copy_buffer 
      009E03 EF 04            [ 2]  503 	ldw (4,x),y 
      009E05 90 AE 17 00      [ 2]  504 	ldw y,#TIBBASE
      009E09 EF 02            [ 2]  505 	ldw (2,x),y 
      009E0B 90 AE 9D FC      [ 2]  506 	ldw y,#copy_buffer_end 
      009E0F 72 A2 9D DD      [ 2]  507 	subw y,#copy_buffer  
      009E13 FF               [ 2]  508 	ldw (x),y 
      009E14 CD 8B F5         [ 4]  509 	call CMOVE 
      009E17 81               [ 4]  510 	ret 
                                    511 
                                    512 
                                    513 ;-----------------------------
                                    514 ; write a row in FLASH/EEPROM 
                                    515 ; WR-ROW ( a ud -- )
                                    516 ; a -> address 128 byte buffer to write 
                                    517 ; ud ->  row address in FLASH|EEPROM 
                                    518 ;-----------------------------
      009E18 9D 5F                  519 	.word LINK 
                           001D9A   520 	LINK=.
      009E1A 06                     521 	.byte 6 
      009E1B 57 52 2D 52 4F 57      522 	.ascii "WR-ROW"
      009E21                        523 write_row:
      009E21 CD 9B 2F         [ 4]  524 	call fptr_store
                                    525 ; align to FLASH block 
      009E24 A6 80            [ 1]  526 	ld a,#0x80 
      009E26 B4 34            [ 1]  527 	and a,PTR8 
      009E28 B7 34            [ 1]  528 	ld PTR8,a  
      009E2A CD 9D FC         [ 4]  529 	call copy_prog_to_ram
      009E2D CD 9C 85         [ 4]  530 	call unlock
      009E30 90 93            [ 1]  531 	ldw y,x 
      009E32 90 FE            [ 2]  532 	ldw y,(y)
      009E34 1C 00 02         [ 2]  533 	addw x,#CELLL 
      009E37 89               [ 2]  534 	pushw x 
      009E38 93               [ 1]  535 	ldw x,y ; buffer address in x 
      009E39 CD 17 00         [ 4]  536 	call TIBBASE
      009E3C CD 9C AD         [ 4]  537 	call lock
      009E3F 85               [ 2]  538 	popw x 
      009E40 81               [ 4]  539 	ret 
                                    540 
                                    541 ;-------------------------------------
                                    542 ; change value of OPTION register 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



                                    543 ; SET-OPT (c n -- ) 
                                    544 ; c new value.
                                    545 ; n OPT  number {1..7}
                                    546 ;--------------------------------------
      009E41 9E 1A                  547 		.word LINK 
                           001DC3   548 		LINK=.
      009E43 07                     549 		.byte 7 
      009E44 53 45 54 2D 4F 50 54   550 		.ascii "SET-OPT" 
      009E4B                        551 set_option: 
      009E4B 90 93            [ 1]  552 		ldw y,x 
      009E4D 90 FE            [ 2]  553 		ldw y,(y)
      009E4F 27 06            [ 1]  554 		jreq 1$
      009E51 90 A3 00 07      [ 2]  555 		cpw y,#7 
      009E55 23 04            [ 2]  556 		jrule 2$ 
                                    557 ; invalid OPTION number 		
      009E57 1C 00 04         [ 2]  558 1$:		addw x,#2*CELLL
      009E5A 81               [ 4]  559 		ret
      009E5B 90 58            [ 2]  560 2$:		sllw y 
      009E5D 72 A9 47 FF      [ 2]  561 		addw y,#OPTION_BASE-1
      009E61 FF               [ 2]  562 		ldw (x),y 
      009E62 1D 00 02         [ 2]  563 		subw x,#CELLL 
      009E65 90 5F            [ 1]  564 		clrw y 
      009E67 FF               [ 2]  565 		ldw (x),y 
      009E68 CD 9C F3         [ 4]  566 		call ee_cstore
      009E6B 81               [ 4]  567 		ret 
                                    568 
                                    569 
                                    570 
                                    571 ;--------------------------------------
                                    572 ; reset system to its original state 
                                    573 ; before any user modification
                                    574 ; PRISTINE ( -- )
                                    575 ;-------------------------------------
      009E6C 9E 43                  576 	.word LINK  
                           001DEE   577 	LINK=.
      009E6E 08                     578 	.byte 8 
      009E6F 50 52 49 53 54 49 4E   579 	.ascii "PRISTINE"
             45
      009E77                        580 pristine:
                                    581 ;;; erase EEPROM
      009E77 CD 9B 4E         [ 4]  582 	call EEPROM 
      009E7A CD 87 3F         [ 4]  583 1$:	call DDUP 
      009E7D CD 9D 69         [ 4]  584 	call row_erase
      009E80 90 93            [ 1]  585 	ldw y,x 
      009E82 90 EE 02         [ 2]  586 	ldw y,(2,y)
      009E85 72 A9 00 80      [ 2]  587 	addw y,#BLOCK_SIZE
      009E89 EF 02            [ 2]  588 	ldw (2,x),y
      009E8B 90 A3 48 00      [ 2]  589 	cpw y,#OPTION_BASE 
      009E8F 25 E9            [ 1]  590 	jrult 1$
                                    591 ;;; reset OPTION to default values
      009E91 90 AE 00 01      [ 2]  592 	ldw y,#1 ; OPT1 
      009E95 FF               [ 2]  593 2$:	ldw (x),y   
      009E96 90 5F            [ 1]  594 	clrw y 
      009E98 EF 02            [ 2]  595 	ldw (2,x),y  ; ( 0 1 -- ) 
      009E9A CD 87 3F         [ 4]  596 	call DDUP    ; ( 0 1 0 1 -- )  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



      009E9D CD 9E 4B         [ 4]  597 	call set_option
      009EA0 90 93            [ 1]  598 	ldw y,x 
      009EA2 90 FE            [ 2]  599 	ldw y,(y)
      009EA4 90 5C            [ 2]  600 	incw y  ; next OPTION 
      009EA6 90 A3 00 08      [ 2]  601 	cpw y,#8 
      009EAA 25 E9            [ 1]  602 	jrult 2$
                                    603 ;;; erase first row of app_space 	
      009EAC 90 AE A2 00      [ 2]  604 	ldw y,#app_space
      009EB0 EF 02            [ 2]  605 	ldw (2,x),y  
      009EB2 90 5F            [ 1]  606 	clrw y 
      009EB4 FF               [ 2]  607 	ldw (x),y ; ( app_space 0 -- )
      009EB5 CD 9D 69         [ 4]  608 	call row_erase 
                                    609 ; reset interrupt vectors 
      009EB8 1D 00 02         [ 2]  610 	subw x,#CELLL 
      009EBB 90 5F            [ 1]  611 	clrw y  
      009EBD FF               [ 2]  612 4$:	ldw (x),y  ; ( n -- ) int# 
      009EBE CD 85 59         [ 4]  613 	call DUPP  
      009EC1 CD 9E DE         [ 4]  614 	call reset_vector
      009EC4 90 93            [ 1]  615 	ldw y,x 
      009EC6 90 FE            [ 2]  616 	ldw y,(y)
      009EC8 90 5C            [ 2]  617 	incw y   ; next vector 
      009ECA 90 A3 00 19      [ 2]  618 	cpw y,#25 
      009ECE 25 ED            [ 1]  619 	jrult 4$
      009ED0 CC 80 80         [ 2]  620 	jp NonHandledInterrupt ; reset MCU
                                    621 
                                    622 ;------------------------------
                                    623 ; reset an interrupt vector 
                                    624 ; to its initial value 
                                    625 ; i.e. NonHandledInterrupt
                                    626 ; RST-IVEC ( n -- )
                                    627 ;-----------------------------
      009ED3 9E 6E                  628 	.word LINK 
                           001E55   629 	LINK=. 
      009ED5 08                     630 	.byte 8 
      009ED6 52 53 54 2D 49 56 45   631 	.ascii "RST-IVEC"
             43
      009EDE                        632 reset_vector:
      009EDE 90 93            [ 1]  633 	ldw y,x
      009EE0 1C 00 02         [ 2]  634 	addw x,#CELLL 
      009EE3 90 FE            [ 2]  635 	ldw y,(y)
      009EE5 90 A3 00 17      [ 2]  636 	cpw y,#23 
      009EE9 27 3A            [ 1]  637 	jreq 9$
      009EEB 90 A3 00 1D      [ 2]  638 	cpw y,#29 ; last vector
      009EEF 22 34            [ 1]  639 	jrugt 9$  
      009EF1 90 58            [ 2]  640 	sllw y 
      009EF3 90 58            [ 2]  641 	sllw y 
      009EF5 72 A9 80 08      [ 2]  642 	addw y,#0x8008 ; irq0 address 
      009EF9 90 BF 24         [ 2]  643 	ldw YTEMP,y
      009EFC 1D 00 06         [ 2]  644 	subw x,#3*CELLL 
      009EFF EF 02            [ 2]  645 	ldw (2,x),y 
      009F01 90 5F            [ 1]  646 	clrw y
      009F03 FF               [ 2]  647 	ldw (x),y 
      009F04 A6 82            [ 1]  648 	ld a,#0x82 
      009F06 90 95            [ 1]  649 	ld yh,a
      009F08 EF 04            [ 2]  650 	ldw (4,x),y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



      009F0A CD 9D 3F         [ 4]  651 	call ee_store
      009F0D 1D 00 06         [ 2]  652 	subw x,#3*CELLL
      009F10 90 5F            [ 1]  653 	clrw y 
      009F12 FF               [ 2]  654 	ldw (x),y 
      009F13 90 AE 80 80      [ 2]  655 	ldw y,#NonHandledInterrupt
      009F17 EF 04            [ 2]  656 	ldw (4,x),y 
      009F19 90 BE 24         [ 2]  657 	ldw y,YTEMP  
      009F1C 72 A9 00 02      [ 2]  658 	addw y,#2
      009F20 EF 02            [ 2]  659 	ldw (2,x),y 
      009F22 CD 9D 3F         [ 4]  660 	call ee_store
      009F25 81               [ 4]  661 9$:	ret 
                                    662 
                                    663 
                                    664 ;------------------------------
                                    665 ; all interrupt vector with 
                                    666 ; an address >= a are resetted 
                                    667 ; to default
                                    668 ; CHKIVEC ( a -- )
                                    669 ;------------------------------
      009F26 9E D5                  670 	.word LINK 
                           001EA8   671 	LINK=.
      009F28 07                     672 	.byte 7
      009F29 43 48 4B 49 56 45 43   673 	.ascii "CHKIVEC"
                                    674 ;local variables 
                           000001   675 	SSP=1
                           000003   676 	CADR=3
                           000005   677 	OFS=5
                           000006   678 	VSIZE=6  
      009F30                        679 CHKIVEC:
      009F30 52 06            [ 2]  680 	sub sp,#VSIZE ;alloc local variables 
      009F32 90 93            [ 1]  681 	ldw y,x 
      009F34 90 FE            [ 2]  682 	ldw y,(y)
      009F36 17 03            [ 2]  683 	ldw (CADR,sp),y ; ca 
      009F38 1F 01            [ 2]  684 	ldw (SSP,sp),x 
      009F3A AE 80 0A         [ 2]  685 	ldw x,#0x800a ; irq0 address 
      009F3D BF 33            [ 2]  686 	ldw PTR16,X
      009F3F AE FF FC         [ 2]  687 	ldw x,#-4 
      009F42 1C 00 04         [ 2]  688 1$:	addw x,#4
      009F45 A3 00 78         [ 2]  689 	cpw x,#30*4 ; irq0-29 
      009F48 27 22            [ 1]  690 	jreq 9$
      009F4A 90 93            [ 1]  691 	ldw y,x  
      009F4C 91 D6 33         [ 4]  692 	ld a,([PTR16],y)
      009F4F 11 03            [ 1]  693 	cp a,(CADR,sp)
      009F51 25 EF            [ 1]  694 	jrult 1$
      009F53 90 5C            [ 2]  695 	incw y 
      009F55 91 D6 33         [ 4]  696 	ld a,([PTR16],y)
      009F58 11 04            [ 1]  697 	cp a,(CADR+1,sp) 
      009F5A 25 E6            [ 1]  698 	jrult 1$ 
      009F5C 1F 05            [ 2]  699 	ldw (OFS,sp),x 
      009F5E 54               [ 2]  700 	srlw x
      009F5F 54               [ 2]  701 	srlw x 
      009F60 90 93            [ 1]  702 	ldw y,x 
      009F62 1E 01            [ 2]  703 	ldw x,(SSP,sp)
      009F64 FF               [ 2]  704 	ldw (x),y
      009F65 CD 9E DE         [ 4]  705 	call reset_vector
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



      009F68 1E 05            [ 2]  706 	ldw x,(OFS,sp) 
      009F6A 20 D6            [ 2]  707 	jra 1$
      009F6C 1E 01            [ 2]  708 9$:	ldw x,(SSP,sp) 
      009F6E 1C 00 02         [ 2]  709 	addw x,#CELLL 
      009F71 5B 06            [ 2]  710 	addw sp,#VSIZE ; drop local variables  
      009F73 81               [ 4]  711 	ret 
                                    712 
                                    713 ;------------------------------
                                    714 ; set interrupt vector 
                                    715 ; SET-IVEC ( ud n -- )
                                    716 ;  ud Handler address
                                    717 ;  n  vector # 0 .. 29 
                                    718 ;-----------------------------
      009F74 9F 28                  719 	.word LINK
                           001EF6   720 	LINK=.
      009F76 08                     721 	.byte 8 
      009F77 53 45 54 2D 49 56 45   722 	.ascii "SET-IVEC" 
             43
      009F7F                        723 set_vector:
      009F7F 90 93            [ 1]  724     ldw y,x 
      009F81 1C 00 02         [ 2]  725 	addw x,#CELLL 
      009F84 90 FE            [ 2]  726 	ldw y,(y) ; vector #
      009F86 90 A3 00 1D      [ 2]  727 	cpw y,#29 ; last vector
      009F8A 23 04            [ 2]  728 	jrule 2$
      009F8C 1C 00 04         [ 2]  729 	addw x,#2*CELLL 
      009F8F 81               [ 4]  730 	ret
      009F90 90 58            [ 2]  731 2$:	sllw y 
      009F92 90 58            [ 2]  732 	sllw y 
      009F94 72 A9 80 08      [ 2]  733 	addw y,#0X8008 ; IRQ0 vector address 
      009F98 90 BF 24         [ 2]  734 	ldw YTEMP,y ; vector address 
      009F9B A6 82            [ 1]  735 	ld a,#0x82 
      009F9D 90 95            [ 1]  736 	ld yh,a 
      009F9F E6 01            [ 1]  737 	ld a,(1,x) ; isr address bits 23..16 
      009FA1 90 97            [ 1]  738 	ld yl,a 
                                    739 ;  write 0x82 + most significant byte of int address	
      009FA3 1D 00 06         [ 2]  740 	subw x,#3*CELLL 
      009FA6 EF 04            [ 2]  741 	ldw (4,x),y 
      009FA8 90 BE 24         [ 2]  742 	ldw y,YTEMP
      009FAB EF 02            [ 2]  743 	ldw (2,x),y ; vector address 
      009FAD 90 5F            [ 1]  744 	clrw y 
      009FAF FF               [ 2]  745 	ldw (x),y   ; as a double 
      009FB0 CD 9D 3F         [ 4]  746 	call ee_store 
      009FB3 90 93            [ 1]  747 	ldw y,x 
      009FB5 90 EE 02         [ 2]  748 	ldw y,(2,y) ; bits 15..0 int vector 
      009FB8 1D 00 06         [ 2]  749 	subw x,#3*CELLL 
      009FBB EF 04            [ 2]  750 	ldw (4,x),y 
      009FBD 90 BE 24         [ 2]  751 	ldw y,YTEMP 
      009FC0 72 A9 00 02      [ 2]  752 	addw y,#2 
      009FC4 EF 02            [ 2]  753 	ldw (2,x),y 
      009FC6 90 5F            [ 1]  754 	clrw y 
      009FC8 FF               [ 2]  755 	ldw (x),y 
      009FC9 CD 9D 3F         [ 4]  756 	call ee_store
      009FCC 1C 00 04         [ 2]  757 	addw x,#2*CELLL  
      009FCF 81               [ 4]  758 9$: ret 
                                    759 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



                                    760 
                                    761 ;------------------------
                                    762 ; Compile word to flash
                                    763 ; EE, (w -- )
                                    764 ;-----------------------
      009FD0 9F 76                  765 	.word LINK
                           001F52   766 	LINK=.
      009FD2 03                     767 	.byte 3
      009FD3 45 45 2C               768 	.ascii "EE,"
      009FD6                        769 ee_comma:
      009FD6 1D 00 04         [ 2]  770 	subw x,#2*CELLL 
      009FD9 90 BE 18         [ 2]  771 	ldw y,UCP
      009FDC 90 89            [ 2]  772 	pushw y 
      009FDE EF 02            [ 2]  773 	ldw (2,x),y 
      009FE0 90 5F            [ 1]  774 	clrw y 
      009FE2 FF               [ 2]  775 	ldw (x),y
      009FE3 CD 9D 3F         [ 4]  776 	call ee_store
      009FE6 90 85            [ 2]  777 	popw y 
      009FE8 72 A9 00 02      [ 2]  778 	addw y,#2
      009FEC 90 BF 18         [ 2]  779 	ldw UCP,y
      009FEF 81               [ 4]  780 	ret 
                                    781 
                                    782 
                                    783 ;-------------------------
                                    784 ; Compile byte to flash 
                                    785 ; EEC, ( c -- )	
                                    786 ;-------------------------
      009FF0 9F D2                  787 	.word LINK 
                           001F72   788 	LINK=.
      009FF2 04                     789 	.byte 4 
      009FF3 45 45 43 2C            790 	.ascii "EEC,"
      009FF7                        791 ee_ccomma:
      009FF7 1D 00 04         [ 2]  792 	subw x,#2*CELLL 
      009FFA 90 BE 18         [ 2]  793 	ldw y,UCP
      009FFD 90 89            [ 2]  794 	pushw y 
      009FFF EF 02            [ 2]  795 	ldw (2,x),y 
      00A001 90 5F            [ 1]  796 	clrw y 
      00A003 FF               [ 2]  797 	ldw (x),y
      00A004 CD 9C F3         [ 4]  798 	call ee_cstore
      00A007 90 85            [ 2]  799 	popw y 
      00A009 90 5C            [ 2]  800 	incw y 
      00A00B 90 BF 18         [ 2]  801 	ldw UCP,y
      00A00E 81               [ 4]  802 	ret 
                                    803 
                                    804 
                                    805 ;--------------------------
                                    806 ; copy FLASH block to ROWBUF
                                    807 ; ROW>BUF ( ud -- )
                                    808 ;--------------------------
      00A00F 9F F2                  809 	.word LINK 
                           001F91   810 	LINK=.
      00A011 07                     811 	.byte 7 
      00A012 52 4F 57 3E 42 55 46   812 	.ascii "ROW>BUF"
      00A019                        813 ROW2BUF: 
      00A019 CD 9B 2F         [ 4]  814 	call fptr_store 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



      00A01C A6 80            [ 1]  815 	ld a,#BLOCK_SIZE
      00A01E 88               [ 1]  816 	push a 
      00A01F B4 34            [ 1]  817 	and a,PTR8 ; block align 
      00A021 B7 34            [ 1]  818 	ld PTR8,a
      00A023 90 AE 16 80      [ 2]  819 	ldw y,#ROWBUFF 
      00A027 92 BC 00 32      [ 5]  820 1$: ldf a,[FPTR]
      00A02B 90 F7            [ 1]  821 	ld (y),a
      00A02D CD 9C C1         [ 4]  822 	call inc_fptr
      00A030 90 5C            [ 2]  823 	incw y 
      00A032 0A 01            [ 1]  824 	dec (1,sp)
      00A034 26 F1            [ 1]  825 	jrne 1$ 
      00A036 84               [ 1]  826 	pop a 
      00A037 81               [ 4]  827 	ret 
                                    828 
                                    829 
                                    830 ;---------------------------
                                    831 ; copy ROWBUFF to flash 
                                    832 ; BUF>ROW ( ud -- )
                                    833 ; ud is row address as double 
                                    834 ;---------------------------
      00A038 A0 11                  835 	.word LINK 
                           001FBA   836 	LINK=.
      00A03A 07                     837 	.byte 7 
      00A03B 42 55 46 3E 52 4F 57   838 	.ascii "BUF>ROW" 
      00A042                        839 BUF2ROW:
      00A042 CD 86 54         [ 4]  840 	call TBUF ; ( ud rb -- )
      00A045 CD 87 14         [ 4]  841 	call ROT 
      00A048 CD 87 14         [ 4]  842 	call ROT  ; ( rb ud -- )
      00A04B CD 9E 21         [ 4]  843 	call write_row 
      00A04E 81               [ 4]  844 	ret 
                                    845 
                                    846 ;---------------------------------
                                    847 ; how many byte free in that row 
                                    848 ; RFREE ( a -- n )
                                    849 ; a is least byte of target address
                                    850 ;----------------------------------
      00A04F A0 3A                  851 	.word LINK 
                           001FD1   852 	LINK=.
      00A051 05                     853 	.byte 5 
      00A052 52 46 52 45 45         854 	.ascii "RFREE"
      00A057                        855 RFREE:
      00A057 E6 01            [ 1]  856 	ld a,(1,x)
      00A059 A4 7F            [ 1]  857 	and a,#BLOCK_SIZE-1 
      00A05B B7 24            [ 1]  858 	ld YTEMP,a 
      00A05D A6 80            [ 1]  859 	ld a,#BLOCK_SIZE 
      00A05F B0 24            [ 1]  860 	sub a,YTEMP 
      00A061 90 5F            [ 1]  861 	clrw y 
      00A063 90 97            [ 1]  862 	ld yl,a
      00A065 FF               [ 2]  863 	ldw (x),y 
      00A066 81               [ 4]  864 	ret 
                                    865 
                                    866 ;---------------------------------
                                    867 ; write u bytes to flash/EEPROM 
                                    868 ; constraint to row limit 
                                    869 ; RAM>EE ( ud a u -- u2 )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



                                    870 ; ud flash address 
                                    871 ; a ram address 
                                    872 ; u bytes count
                                    873 ; return u2 bytes written  
                                    874 ;-------------------------------
      00A067 A0 51                  875 	.word LINK 
                           001FE9   876 	LINK=. 
      00A069 06                     877 	.byte 6
      00A06A 52 41 4D 3E 45 45      878 	.ascii "RAM>EE"
                                    879 	
      00A070                        880 RAM2EE:
                                    881 ; copy ud on top 
      00A070 90 93            [ 1]  882 	ldw y,x 
      00A072 90 EE 06         [ 2]  883 	ldw y,(6,y) ; LSW of ud  
      00A075 90 BF 24         [ 2]  884 	ldw YTEMP,y 
      00A078 90 93            [ 1]  885 	ldw y,x 
      00A07A 90 EE 04         [ 2]  886 	ldw y,(4,y)  ; MSW of ud 
      00A07D 1D 00 04         [ 2]  887 	subw x,#2*CELLL 
      00A080 FF               [ 2]  888 	ldw (x),y 
      00A081 90 BE 24         [ 2]  889 	ldw y,YTEMP 
      00A084 EF 02            [ 2]  890 	ldw (2,x),y 
      00A086 CD A0 19         [ 4]  891 	call ROW2BUF 
      00A089 90 93            [ 1]  892 	ldw y,x 
      00A08B 90 EE 06         [ 2]  893 	ldw y,(6,y)
      00A08E 90 89            [ 2]  894 	pushw y ; udl 
      00A090 90 9F            [ 1]  895 	ld a,yl
      00A092 A4 7F            [ 1]  896 	and a,#BLOCK_SIZE-1 
      00A094 90 5F            [ 1]  897 	clrw y 
      00A096 90 97            [ 1]  898 	ld yl,a 
      00A098 72 A9 16 80      [ 2]  899 	addw y,#ROWBUFF 
      00A09C 1D 00 02         [ 2]  900 	subw x,#CELLL 
      00A09F FF               [ 2]  901 	ldw (x),y  
      00A0A0 CD 85 69         [ 4]  902 	call SWAPP ;  ( ud a ra u -- )
      00A0A3 CD 85 03         [ 4]  903 	call RFROM  
      00A0A6 CD A0 57         [ 4]  904 	call RFREE 
      00A0A9 CD 88 6F         [ 4]  905 	call MIN
      00A0AC CD 85 59         [ 4]  906 	call DUPP 
      00A0AF CD 85 22         [ 4]  907 	call TOR  
      00A0B2 CD 8B F5         [ 4]  908 	call CMOVE
      00A0B5 CD A0 42         [ 4]  909 	call BUF2ROW 
      00A0B8 CD 85 03         [ 4]  910 	call RFROM 
      00A0BB 81               [ 4]  911 	ret 
                                    912 
                                    913 ;--------------------------
                                    914 ; expand 16 bit address 
                                    915 ; to 32 bit address 
                                    916 ; FADDR ( a -- ud )
                                    917 ;--------------------------
      00A0BC A0 69                  918 	.word LINK 
                           00203E   919 	LINK=. 
      00A0BE 05                     920 	.byte 5 
      00A0BF 46 41 44 44 52         921 	.ascii "FADDR"
      00A0C4                        922 FADDR:
      00A0C4 CC 8A BA         [ 2]  923 	jp ZERO 
                                    924 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



                                    925 ;--------------------------
                                    926 ; move new colon definition to FLASH 
                                    927 ; using WR-ROW for efficiency 
                                    928 ; preserving bytes already used 
                                    929 ; in the current block. 
                                    930 ; At this point the compiler as completed
                                    931 ; in RAM and pointers CP and CNTXT updated.
                                    932 ; CNTXT point to nfa of new word and  
                                    933 ; CP is after compiled word so CP-CNTXT+2=count to write 
                                    934 ; 
                                    935 ; FMOVE ( -- cp+ )
                                    936 ; 
                                    937 ;--------------------------
      00A0C7 A0 BE                  938 	.word LINK 
                           002049   939 	LINK=.
      00A0C9 05                     940 	.byte 5 
      00A0CA 46 4D 4F 56 45         941 	.ascii "FMOVE" 
      00A0CF                        942 FMOVE:
      00A0CF CD 86 66         [ 4]  943 	call TFLASH 
      00A0D2 CD 84 B2         [ 4]  944 	CALL AT 
      00A0D5 CD 84 67         [ 4]  945 	CALL QBRAN 
      00A0D8 A1 53                  946 	.word no_move  
      00A0DA CD 86 B5         [ 4]  947 	call CPP
      00A0DD CD 84 B2         [ 4]  948 	call AT  
      00A0E0 CD 85 59         [ 4]  949 	call DUPP ; ( udl udl -- )
      00A0E3 CD 86 99         [ 4]  950 	call CNTXT 
      00A0E6 CD 84 B2         [ 4]  951 	call AT 
      00A0E9 CD 84 34         [ 4]  952 	call DOLIT 
      00A0EC 00 02                  953 	.word 2 
      00A0EE CD 87 CD         [ 4]  954 	call SUBB ; ( udl udl a -- )
      00A0F1 CD 85 69         [ 4]  955 	call SWAPP 
      00A0F4 CD A0 C4         [ 4]  956 	call FADDR 
      00A0F7 CD 87 14         [ 4]  957 	call ROT  ; ( udl ud a -- )
      00A0FA CD 85 59         [ 4]  958 	call DUPP 
      00A0FD CD 85 22         [ 4]  959 	call TOR    ; R: a 
      00A100                        960 FMOVE2: 
      00A100 CD 8B A8         [ 4]  961 	call HERE 
      00A103 CD 85 16         [ 4]  962 	call RAT 
      00A106 CD 87 CD         [ 4]  963 	call SUBB ; (udl ud a wl -- )
      00A109                        964 next_row:
      00A109 CD 85 59         [ 4]  965 	call DUPP 
      00A10C CD 85 22         [ 4]  966 	call TOR  ; ( udl ud a wl -- ) R: a wl
      00A10F CD A0 70         [ 4]  967 	call RAM2EE ; ( udl a u -- udl u2 ) u2 is byte written to FLASH 
      00A112 CD 85 59         [ 4]  968 	call DUPP 
      00A115 CD 85 22         [ 4]  969 	call TOR
      00A118 CD 87 54         [ 4]  970 	call PLUS  ; ( udl+ ) 
      00A11B CD 85 59         [ 4]  971 	call DUPP 
      00A11E CD 8A BA         [ 4]  972 	call ZERO   ; ( udl+ ud -- )
      00A121 CD 85 03         [ 4]  973 	call RFROM  ; ( udl+ ud u2  R: a wl ) 
      00A124 CD 85 03         [ 4]  974 	call RFROM  ; ( udl+ ud u2 wl R: a ) 
      00A127 CD 85 83         [ 4]  975 	call OVER   ; ( udl+ ud u2 wl u2 -- )
      00A12A CD 87 CD         [ 4]  976 	call SUBB  ; ( udl+ ud u2 wl- R: a )
      00A12D CD 85 59         [ 4]  977 	call DUPP 
      00A130 CD 84 67         [ 4]  978 	call QBRAN
      00A133 A1 4C                  979 	.word fmove_done 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      00A135 CD 85 69         [ 4]  980 	call SWAPP  ; ( udl+ ud wl- u2 R: a )
      00A138 CD 85 03         [ 4]  981 	call RFROM ; ( udl+ ud wl- u2 a -- ) 
      00A13B CD 87 54         [ 4]  982 	call PLUS  ; ( udl+2 ud wl- a+ )
      00A13E CD 85 59         [ 4]  983 	call DUPP 
      00A141 CD 85 22         [ 4]  984 	call TOR   ; ( udl+2 ud wl- a+ ) R: a+
      00A144 CD 85 69         [ 4]  985 	call SWAPP 
      00A147 CD 84 7E         [ 4]  986 	call BRAN
      00A14A A1 09                  987 	.word next_row  
      00A14C                        988 fmove_done:	
      00A14C CD 85 03         [ 4]  989 	call RFROM  ; ( -- udl+ ud u2 wl- a  )
      00A14F 1C 00 0A         [ 2]  990 	addw x,#5*CELLL ; (  -- cp+ ) new CP 
      00A152 81               [ 4]  991  	ret  
      00A153                        992 no_move:
      00A153 CD 8A BA         [ 4]  993 	call ZERO
      00A156 81               [ 4]  994 	ret 
                                    995 
                                    996 ;------------------------------------------
                                    997 ; adjust pointers after **FMOVE** operetion.
                                    998 ; UPDAT-PTR ( cp+ -- )
                                    999 ; cp+ is new CP position after FMOVE 
                                   1000 ;-------------------------------------------
      00A157 A0 C9                 1001 	.word LINK 
                           0020D9  1002 	LINK=.
      00A159 09                    1003 	.byte 9
      00A15A 55 50 44 41 54 2D 50  1004 	.ascii "UPDAT-PTR" 
             54 52
      00A163                       1005 UPDATPTR:
                                   1006 ;reset VP to previous position  
      00A163 CD 9B A9         [ 4] 1007 	call EEPVP 
      00A166 CD 85 4F         [ 4] 1008 	call DROP 
      00A169 CD 84 B2         [ 4] 1009 	call AT
      00A16C CD 86 A7         [ 4] 1010 	call VPP 
      00A16F CD 84 9B         [ 4] 1011 	call STORE
                                   1012 ;update CONTEXT and LAST 
      00A172 CD 9B 93         [ 4] 1013 	call EEPCP 
      00A175 CD 85 4F         [ 4] 1014 	call DROP
      00A178 CD 84 B2         [ 4] 1015 	call AT
      00A17B CD 84 34         [ 4] 1016 	call DOLIT 
      00A17E 00 02                 1017 	.word 2 
      00A180 CD 87 54         [ 4] 1018 	call PLUS 
      00A183 CD 85 59         [ 4] 1019 	call DUPP 
      00A186 CD 86 99         [ 4] 1020 	call CNTXT 
      00A189 CD 84 9B         [ 4] 1021 	call STORE
      00A18C CD 86 C5         [ 4] 1022 	call LAST
      00A18F CD 84 9B         [ 4] 1023 	call STORE 
      00A192 CD 9B C3         [ 4] 1024 	call UPDATLAST 
                                   1025 ;update CP 
      00A195 CD 86 B5         [ 4] 1026 	call CPP 
      00A198 CD 84 9B         [ 4] 1027 	call STORE
      00A19B CD 9B EC         [ 4] 1028 	call UPDATCP 
      00A19E 81               [ 4] 1029 	ret 
                                   1030 
                                   1031 ;-----------------------------
                                   1032 ; move interrupt sub-routine
                                   1033 ; in flash memory
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



                                   1034 ;----------------------------- 
      00A19F A1 59                 1035 	.word LINK 
                           002121  1036 	LINK=. 
      00A1A1 06                    1037 	.byte 6
      00A1A2 49 46 4D 4F 56 45     1038 	.ascii "IFMOVE" 
      00A1A8                       1039 IFMOVE:
      00A1A8 CD 86 66         [ 4] 1040 	call TFLASH 
      00A1AB CD 84 B2         [ 4] 1041 	CALL AT 
      00A1AE CD 84 67         [ 4] 1042 	CALL QBRAN 
      00A1B1 A1 53                 1043 	.word no_move 
      00A1B3 CD 86 B5         [ 4] 1044 	call CPP 
      00A1B6 CD 84 B2         [ 4] 1045 	call AT 
      00A1B9 CD 85 59         [ 4] 1046 	call DUPP ; ( udl udl -- )
      00A1BC CD 9B A9         [ 4] 1047 	call EEPVP 
      00A1BF CD 85 4F         [ 4] 1048 	call DROP
      00A1C2 CD 84 B2         [ 4] 1049 	call AT  ; ( udl udl a )
      00A1C5 CD 85 22         [ 4] 1050 	call TOR 
      00A1C8 CD A0 C4         [ 4] 1051 	call FADDR
      00A1CB CD 85 16         [ 4] 1052 	call RAT ; ( udl ud a -- ) R: a 
      00A1CE CC A1 00         [ 2] 1053 	jp FMOVE2 
                                   1054 
                                   1055 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



                                   4441 
                                   4442 ;===============================================================
                                   4443 
                           002121  4444 LASTN =	LINK   ;last name defined
                                   4445 
                                   4446 ; application code begin here
      00A200                       4447 	.bndry 128 ; align on flash block  
      00A200                       4448 app_space: 
                                   4449 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   6 AB1        000770 R   |   6 ABOR1      0012C3 R
  6 ABOR2      0012DA R   |   6 ABORQ      0012BB R   |   6 ABORT      0012AC R
  6 ABRTQ      001597 R   |   6 ABSS       000767 R   |   6 ACCEP      001242 R
  6 ACCP1      00124B R   |   6 ACCP2      001271 R   |   6 ACCP3      001274 R
  6 ACCP4      001276 R   |     ADC_CR1 =  005401     |     ADC_CR1_=  000000 
    ADC_CR1_=  000001     |     ADC_CR1_=  000004     |     ADC_CR1_=  000005 
    ADC_CR1_=  000006     |     ADC_CR2 =  005402     |     ADC_CR2_=  000003 
    ADC_CR2_=  000004     |     ADC_CR2_=  000005     |     ADC_CR2_=  000006 
    ADC_CR2_=  000001     |     ADC_CR3 =  005403     |     ADC_CR3_=  000007 
    ADC_CR3_=  000006     |     ADC_CSR =  005400     |     ADC_CSR_=  000006 
    ADC_CSR_=  000004     |     ADC_CSR_=  000000     |     ADC_CSR_=  000001 
    ADC_CSR_=  000002     |     ADC_CSR_=  000003     |     ADC_CSR_=  000007 
    ADC_CSR_=  000005     |     ADC_DRH =  005404     |     ADC_DRL =  005405 
    ADC_TDRH=  005406     |     ADC_TDRL=  005407     |   6 ADRADJ     000673 R
    AFR     =  004803     |     AFR0_ADC=  000000     |     AFR1_TIM=  000001 
    AFR2_CCO=  000002     |     AFR3_TIM=  000003     |     AFR4_TIM=  000004 
    AFR5_TIM=  000005     |     AFR6_I2C=  000006     |     AFR7_BEE=  000007 
  6 AFT        001582 R   |   6 AGAIN      0014D8 R   |   6 AHEAD      001535 R
  6 ALLOT      0013EB R   |   6 ANDD       000525 R   |     APP_CP  =  004004 
    APP_LAST=  004000     |     APP_RUN =  004002     |     APP_VP  =  004006 
  6 AT         000432 R   |   6 ATEXE      000B5E R   |   6 AUTORUN    000127 R
    AWU_APR =  0050F1     |     AWU_CSR =  0050F0     |     AWU_TBR =  0050F2 
    B0_MASK =  000001     |     B115200 =  000006     |     B19200  =  000003 
    B1_MASK =  000002     |     B230400 =  000007     |     B2400   =  000000 
    B2_MASK =  000004     |     B38400  =  000004     |     B3_MASK =  000008 
    B460800 =  000008     |     B4800   =  000001     |     B4_MASK =  000010 
    B57600  =  000005     |     B5_MASK =  000020     |     B6_MASK =  000040 
    B7_MASK =  000080     |     B921600 =  000009     |     B9600   =  000002 
  6 BACK1      0011EA R   |   6 BASE       000596 R   |     BASEE   =  00000A 
    BCNT    =  000001     |   6 BCOMP      00142D R   |   6 BDIGS      000C45 R
    BEEP_BIT=  000004     |     BEEP_CSR=  0050F3     |     BEEP_MAS=  000010 
    BEEP_POR=  00000F     |   6 BEGIN      0014BA R   |     BIT0    =  000000 
    BIT1    =  000001     |     BIT2    =  000002     |     BIT3    =  000003 
    BIT4    =  000004     |     BIT5    =  000005     |     BIT6    =  000006 
    BIT7    =  000007     |   6 BKSLA      001082 R   |   6 BKSP       0011BA R
    BKSPP   =  000008     |   6 BLANK      000A2D R   |     BLOCK_SI=  000080 
    BOOT_ROM=  006000     |     BOOT_ROM=  007FFF     |   6 BRAN       0003FE R
    BTW     =  000001     |   6 BUF2ROW    001FC2 R   |   6 BYE        0000B4 R
    CADR    =  000003     |     CALLL   =  0000CD     |     CAN_DGR =  005426 
    CAN_FPSR=  005427     |     CAN_IER =  005425     |     CAN_MCR =  005420 
    CAN_MSR =  005421     |     CAN_P0  =  005428     |     CAN_P1  =  005429 
    CAN_P2  =  00542A     |     CAN_P3  =  00542B     |     CAN_P4  =  00542C 
    CAN_P5  =  00542D     |     CAN_P6  =  00542E     |     CAN_P7  =  00542F 
    CAN_P8  =  005430     |     CAN_P9  =  005431     |     CAN_PA  =  005432 
    CAN_PB  =  005433     |     CAN_PC  =  005434     |     CAN_PD  =  005435 
    CAN_PE  =  005436     |     CAN_PF  =  005437     |     CAN_RFR =  005424 
    CAN_TPR =  005423     |     CAN_TSR =  005422     |     CARRY   =  000028 
  6 CAT        000450 R   |   6 CCOMMA     00140F R   |     CC_C    =  000000 
    CC_H    =  000004     |     CC_I0   =  000003     |     CC_I1   =  000005 
    CC_N    =  000002     |     CC_V    =  000007     |     CC_Z    =  000001 
    CELLL   =  000002     |   6 CELLM      0009B2 R   |   6 CELLP      0009A3 R
  6 CELLS      0009C1 R   |     CFG_GCR =  007F60     |     CFG_GCR_=  000001 
    CFG_GCR_=  000000     |   6 CHAR1      000E72 R   |   6 CHAR2      000E75 R
  6 CHKIVEC    001EB0 R   |     CLKOPT  =  004807     |     CLKOPT_C=  000002 
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
    CLK_SWR_=  0000D2     |   6 CMOV1      000B7D R   |   6 CMOV2      000B95 R
  6 CMOVE      000B75 R   |     CNTDWN  =  000030     |   6 CNTXT      000619 R
  6 COLD       00198F R   |   6 COLD1      00198F R   |   6 COLON      001730 R
  6 COMMA      0013F8 R   |   6 COMPI      00143D R   |     COMPO   =  000040 
  6 CONSTANT   0017DA R   |   6 COUNT      000B11 R   |   6 CPP        000635 R
    CPU_A   =  007F00     |     CPU_CCR =  007F0A     |     CPU_PCE =  007F01 
    CPU_PCH =  007F02     |     CPU_PCL =  007F03     |     CPU_SPH =  007F08 
    CPU_SPL =  007F09     |     CPU_XH  =  007F04     |     CPU_XL  =  007F05 
    CPU_YH  =  007F06     |     CPU_YL  =  007F07     |   6 CR         000EA0 R
  6 CREAT      001776 R   |     CRR     =  00000D     |   6 CSTOR      00043F R
  6 DAT        000AF1 R   |     DATSTK  =  001680     |   6 DDROP      0006B4 R
  6 DDUP       0006BF R   |     DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF 
  6 DECIM      000CF5 R   |   6 DEPTH      000A7C R   |     DEVID_BA=  0048CD 
    DEVID_EN=  0048D8     |     DEVID_LO=  0048D2     |     DEVID_LO=  0048D3 
    DEVID_LO=  0048D4     |     DEVID_LO=  0048D5     |     DEVID_LO=  0048D6 
    DEVID_LO=  0048D7     |     DEVID_LO=  0048D8     |     DEVID_WA=  0048D1 
    DEVID_XH=  0048CE     |     DEVID_XL=  0048CD     |     DEVID_YH=  0048D0 
    DEVID_YL=  0048CF     |   6 DGTQ1      000D3A R   |   6 DI         0000C2 R
  6 DIG        000C6E R   |   6 DIGIT      000C09 R   |   6 DIGS       000C7F R
  6 DIGS1      000C7F R   |   6 DIGS2      000C8C R   |   6 DIGTQ      000D09 R
    DM_BK1RE=  007F90     |     DM_BK1RH=  007F91     |     DM_BK1RL=  007F92 
    DM_BK2RE=  007F93     |     DM_BK2RH=  007F94     |     DM_BK2RL=  007F95 
    DM_CR1  =  007F96     |     DM_CR2  =  007F97     |     DM_CSR1 =  007F98 
    DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A     |   6 DN1        00072E R
  6 DNEGA      000711 R   |   6 DOCONST    001804 R   |   6 DOLIT      0003B4 R
  6 DONXT      0003C8 R   |   6 DOSTR      000EB6 R   |   6 DOT        000F3B R
  6 DOT1       000F51 R   |   6 DOTI1      001926 R   |   6 DOTID      001910 R
  6 DOTO1      00134F R   |   6 DOTOK      001335 R   |   6 DOTPR      001064 R
  6 DOTQ       0015B1 R   |   6 DOTQP      000EDF R   |   6 DOTR       000EED R
  6 DOTS       0018B2 R   |   6 DOTS1      0018BD R   |   6 DOTS2      0018C6 R
  6 DOVAR      000586 R   |   6 DROP       0004CF R   |   6 DSTOR      000ACB R
  6 DUMP       001868 R   |   6 DUMP1      00187F R   |   6 DUMP3      0018A1 R
  6 DUMPP      001837 R   |   6 DUPP       0004D9 R   |   6 EDIGS      000CAA R
  6 EEPCP      001B13 R   |   6 EEPLAST    001AE6 R   |   6 EEPROM     001ACE R
    EEPROM_B=  004000     |     EEPROM_E=  0047FF     |     EEPROM_S=  000800 
  6 EEPRUN     001AFD R   |   6 EEPVP      001B29 R   |   6 EI         0000BB R
  6 ELSEE      001510 R   |   6 EMIT       00039E R   |   6 ENEPER     001A3E R
  6 EQ1        00078B R   |   6 EQUAL      000775 R   |   6 ERASE      000BD7 R
    ERR     =  00001B     |   6 EVAL       001378 R   |   6 EVAL1      001378 R
  6 EVAL2      001394 R   |   6 EXE1       000B6C R   |   6 EXECU      00040E R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]

Symbol Table

    EXT     =  000000     |     EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1 
  6 EXTRC      000C31 R   |   6 FADDR      002044 R   |     FHSE    =  7A1200 
    FHSI    =  F42400     |   6 FILL       000BA4 R   |   6 FILL1      000BC1 R
  6 FILL2      000BCA R   |   6 FIND       001116 R   |   6 FIND1      001134 R
  6 FIND2      001162 R   |   6 FIND3      00116E R   |   6 FIND4      001182 R
  6 FIND5      00118F R   |   6 FIND6      001173 R   |     FLASH_BA=  008000 
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
  6 FMOVE      00204F R   |   6 FMOVE2     002080 R   |   6 FOR        00148D R
  6 FORGET     000158 R   |   6 FORGET1    000187 R   |   6 FORGET2    00020D R
  6 FORGET4    000216 R   |   6 FORGET6    0001CF R   |     FPTR    =  000032 
  6 FREEVAR    000223 R   |   6 FREEVAR4   000259 R   |     GPIO_BAS=  005000 
    GPIO_CR1=  000003     |     GPIO_CR2=  000004     |     GPIO_DDR=  000002 
    GPIO_IDR=  000001     |     GPIO_ODR=  000000     |     GPIO_SIZ=  000005 
  6 HERE       000B28 R   |   6 HEX        000CE0 R   |   6 HI         001962 R
  6 HLD        000606 R   |   6 HOLD       000C55 R   |     HSECNT  =  004809 
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
  6 ICOLON     001741 R   |   6 IFETCH     0014AB R   |   6 IFF        0014E8 R
  6 IFMOVE     002128 R   |     IMEDD   =  000080     |   6 IMMED      001753 R
  6 INCH       000392 R   |   6 INITOFS    001709 R   |   6 INN        0005B4 R
    INPUT_DI=  000000     |     INPUT_EI=  000001     |     INPUT_FL=  000000 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]

Symbol Table

    INPUT_PU=  000001     |   6 INTE1      001317 R   |   6 INTER      0012ED R
    INT_ADC2=  000016     |     INT_AUAR=  000012     |     INT_AWU =  000001 
    INT_CAN_=  000008     |     INT_CAN_=  000009     |     INT_CLK =  000002 
    INT_EXTI=  000003     |     INT_EXTI=  000004     |     INT_EXTI=  000005 
    INT_EXTI=  000006     |     INT_EXTI=  000007     |     INT_FLAS=  000018 
    INT_I2C =  000013     |     INT_SPI =  00000A     |     INT_TIM1=  00000C 
    INT_TIM1=  00000B     |     INT_TIM2=  00000E     |     INT_TIM2=  00000D 
    INT_TIM3=  000010     |     INT_TIM3=  00000F     |     INT_TIM4=  000017 
    INT_TLI =  000000     |     INT_UART=  000011     |     INT_UART=  000015 
    INT_UART=  000014     |     INT_VECT=  008060     |     INT_VECT=  00800C 
    INT_VECT=  008028     |     INT_VECT=  00802C     |     INT_VECT=  008010 
    INT_VECT=  008014     |     INT_VECT=  008018     |     INT_VECT=  00801C 
    INT_VECT=  008020     |     INT_VECT=  008024     |     INT_VECT=  008068 
    INT_VECT=  008054     |     INT_VECT=  008000     |     INT_VECT=  008030 
    INT_VECT=  008038     |     INT_VECT=  008034     |     INT_VECT=  008040 
    INT_VECT=  00803C     |     INT_VECT=  008048     |     INT_VECT=  008044 
    INT_VECT=  008064     |     INT_VECT=  008008     |     INT_VECT=  008004 
    INT_VECT=  008050     |     INT_VECT=  00804C     |     INT_VECT=  00805C 
    INT_VECT=  008058     |   6 INVER      0006EE R   |     IPR0    =  000002 
    IPR1    =  000001     |     IPR2    =  000000     |     IPR3    =  000003 
    IPR_MASK=  000003     |     IRET_COD=  000080     |   6 ISEMI      00169E R
    ITC_SPR1=  007F70     |     ITC_SPR2=  007F71     |     ITC_SPR3=  007F72 
    ITC_SPR4=  007F73     |     ITC_SPR5=  007F74     |     ITC_SPR6=  007F75 
    ITC_SPR7=  007F76     |     ITC_SPR8=  007F77     |     IWDG_KR =  0050E0 
    IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2     |   6 JSRC       0016F3 R
  6 KEY        000E20 R   |   6 KTAP       001207 R   |   6 KTAP1      00122A R
  6 KTAP2      00122D R   |   6 LAST       000645 R   |   6 LASTN   =  002121 R
  6 LBRAC      001324 R   |     LED2_BIT=  000005     |     LED2_MAS=  000020 
    LED2_POR=  00500A     |   6 LESS       0007B2 R   |     LF      =  00000A 
  6 LINK    =  002121 R   |   6 LITER      00145F R   |   6 LN2S       001A9A R
  6 LOG2S      001A84 R   |   6 LSHIFT     0009EC R   |   6 LSHIFT1    0009F5 R
  6 LSHIFT4    0009FD R   |   6 LT1        0007C8 R   |     MASKK   =  001F7F 
  6 MAX        0007D2 R   |   6 MAX1       0007E5 R   |   6 MIN        0007EF R
  6 MIN1       000802 R   |   6 MMOD1      0008A5 R   |   6 MMOD2      0008B9 R
  6 MMOD3      0008D0 R   |   6 MMSM1      00084C R   |   6 MMSM2      000860 R
  6 MMSM3      000862 R   |   6 MMSM4      00086A R   |   6 MODD       0008EA R
  6 MONE       000A53 R   |     MS      =  00002E     |   6 MSEC       0002CE R
  6 MSMOD      000888 R   |   6 MSTA1      00097B R   |   6 MSTAR      000958 R
    NAFR    =  004804     |   6 NAMEQ      0011AF R   |   6 NAMET      0010C0 R
    NCLKOPT =  004808     |   6 NEGAT      0006FF R   |   6 NEX1       0003D5 R
  6 NEXT       00149C R   |     NFLASH_W=  00480E     |     NHSECNT =  00480A 
    NOPT1   =  004802     |     NOPT2   =  004804     |     NOPT3   =  004806 
    NOPT4   =  004808     |     NOPT5   =  00480A     |     NOPT6   =  00480C 
    NOPT7   =  00480E     |     NOPTBL  =  00487F     |   6 NTIB       0005C4 R
    NUBC    =  004802     |   6 NUFQ       000E36 R   |   6 NUFQ1      000E4F R
  6 NUMBQ      000D4D R   |   6 NUMQ1      000D81 R   |   6 NUMQ2      000DB2 R
  6 NUMQ3      000DF4 R   |   6 NUMQ4      000DF9 R   |   6 NUMQ5      000E08 R
  6 NUMQ6      000E0B R   |     NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD 
    NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE 
  6 NonHandl   000000 R   |   6 OFFSET     00066A R   |     OFS     =  000005 
  6 ONE        000A45 R   |   6 ONEM       0009DB R   |   6 ONEP       0009CE R
    OPT     =  000002     |     OPT0    =  004800     |     OPT1    =  004801 
    OPT2    =  004803     |     OPT3    =  004805     |     OPT4    =  004807 
    OPT5    =  004809     |     OPT6    =  00480B     |     OPT7    =  00480D 
    OPTBL   =  00487E     |     OPTIMIZE=  000001     |     OPTION_B=  004800 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]

Symbol Table

    OPTION_E=  00487F     |     OPTION_S=  000080     |   6 ORIG       000047 R
  6 ORR        000539 R   |   6 OUTPUT     0003A3 R   |     OUTPUT_F=  000001 
    OUTPUT_O=  000000     |     OUTPUT_P=  000001     |     OUTPUT_S=  000000 
  6 OVER       000503 R   |   6 OVERT      00166C R   |     PA      =  000000 
  6 PACKS      000BE8 R   |   6 PAD        000B39 R   |   6 PAREN      001073 R
  6 PARS       000F6C R   |   6 PARS1      000F97 R   |   6 PARS2      000FC2 R
  6 PARS3      000FC5 R   |   6 PARS4      000FCE R   |   6 PARS5      000FF1 R
  6 PARS6      001006 R   |   6 PARS7      001015 R   |   6 PARS8      001024 R
  6 PARSE      001035 R   |   6 PAUSE      0002DE R   |     PA_BASE =  005000 
    PA_CR1  =  005003     |     PA_CR2  =  005004     |     PA_DDR  =  005002 
    PA_IDR  =  005001     |     PA_ODR  =  005000     |     PB      =  000005 
    PB_BASE =  005005     |     PB_CR1  =  005008     |     PB_CR2  =  005009 
    PB_DDR  =  005007     |     PB_IDR  =  005006     |     PB_ODR  =  005005 
    PC      =  00000A     |     PC_BASE =  00500A     |     PC_CR1  =  00500D 
    PC_CR2  =  00500E     |     PC_DDR  =  00500C     |     PC_IDR  =  00500B 
    PC_ODR  =  00500A     |     PD      =  00000F     |   6 PDUM1      00184A R
  6 PDUM2      00185B R   |     PD_BASE =  00500F     |     PD_CR1  =  005012 
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
  6 PICK       000A93 R   |   6 PII        0019FD R   |     PI_BASE =  005028 
    PI_CR1  =  00502B     |     PI_CR2  =  00502C     |     PI_DDR  =  00502A 
    PI_IDR  =  005029     |     PI_ODR  =  005028     |   6 PLUS       0006D4 R
  6 PNAM1      001621 R   |   6 PRESE      0013A3 R   |     PROD1   =  000022 
    PROD2   =  000024     |     PROD3   =  000026     |   6 PROTECTE   0001FF R
  6 PSTOR      000AAA R   |     PTR16   =  000033     |     PTR8    =  000034 
  6 QBRAN      0003E7 R   |   6 QDUP       000683 R   |   6 QDUP1      00068D R
  6 QKEY       000380 R   |   6 QSTAC      00135B R   |   6 QUERY      001287 R
  6 QUEST      000F5E R   |   6 QUIT       0013C0 R   |   6 QUIT1      0013C8 R
  6 QUIT2      0013CB R   |   6 RAM2EE     001FF0 R   |     RAMBASE =  000000 
  6 RAMLAST    000658 R   |     RAM_BASE=  000000     |     RAM_END =  0017FF 
    RAM_SIZE=  001800     |   6 RANDOM     00027C R   |   6 RAT        000496 R
  6 RBRAC      0016E0 R   |   6 REPEA      001565 R   |   6 RFREE      001FD7 R
  6 RFROM      000483 R   |     ROP     =  004800     |   6 ROT        000694 R
  6 ROW2BUF    001F99 R   |     ROWBUFF =  001680     |     RP0     =  00002C 
  6 RPAT       000460 R   |     RPP     =  0017FF     |   6 RPSTO      00046D R
  6 RSHIFT     000A08 R   |   6 RSHIFT1    000A11 R   |   6 RSHIFT4    000A19 R
    RST_SR  =  0050B3     |   6 RT12_2     001A6D R   |   6 SAME1      0010DE R
  6 SAME2      001107 R   |   6 SAMEQ      0010D6 R   |   6 SCOM1      001656 R
  6 SCOM2      001659 R   |   6 SCOMP      001638 R   |   6 SEED       000263 R
    SEEDX   =  000036     |     SEEDY   =  000038     |   6 SEMIS      00167C R
  6 SETISP     0000CE R   |   6 SET_RAML   0017C3 R   |     SFR_BASE=  005000 
    SFR_END =  0057FF     |   6 SIGN       000C94 R   |   6 SIGN1      000CA4 R
  6 SLASH      0008F4 R   |   6 SLMOD      0008D8 R   |   6 SNAME      0015EB R
    SP0     =  00002A     |   6 SPACE      000E58 R   |   6 SPACS      000E67 R
  6 SPAT       0004B9 R   |     SPI_CR1 =  005200     |     SPI_CR2 =  005201 
    SPI_CRCP=  005205     |     SPI_DR  =  005204     |     SPI_ICR =  005202 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]

Symbol Table

    SPI_RXCR=  005206     |     SPI_SR  =  005203     |     SPI_TXCR=  005207 
    SPP     =  001680     |     SPSAVE  =  000001     |   6 SPSTO      0004C6 R
  6 SQRT10     001A56 R   |   6 SQRT2      001A14 R   |   6 SQRT3      001A2B R
  6 SSMOD      000984 R   |     SSP     =  000001     |     STACK   =  0017FF 
  6 STAR       00094D R   |   6 STASL      000995 R   |   6 STOD       000736 R
  6 STORE      00041B R   |   6 STR        000CC2 R   |   6 STRCQ      00146D R
  6 STRQ       0015A4 R   |   6 STRQP      000ED5 R   |   6 SUBB       00074D R
  6 SWAPP      0004E9 R   |     SWIM_CSR=  007F80     |   6 TAP        0011F1 R
  6 TBOOT      001983 R   |   6 TBUF       0005D4 R   |     TBUFFBAS=  001680 
  6 TCHAR      000A64 R   |   6 TEMP       0005A5 R   |   6 TEVAL      0005F7 R
  6 TFLASH     0005E6 R   |   6 THENN      0014FD R   |   6 TIB        000B4A R
    TIBB    =  001700     |     TIBBASE =  001700     |     TIC     =  000027 
  6 TICK       0013D7 R   |     TIM1_ARR=  005262     |     TIM1_ARR=  005263 
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
    TIM1_SR1=  005255     |     TIM1_SR1=  000007     |     TIM1_SR1=  000001 
    TIM1_SR1=  000002     |     TIM1_SR1=  000003     |     TIM1_SR1=  000004 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]

Symbol Table

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
    TIM_CR1_=  000001     |     TIM_CR1_=  000002     |   6 TNAM2      0018E0 R
  6 TNAM3      0018FE R   |   6 TNAM4      001904 R   |   6 TNAME      0018DD R
  6 TOFLASH    000333 R   |   6 TOKEN      0010B2 R   |   6 TOR        0004A2 R
  6 TORAM      000373 R   |     TRUEE   =  00FFFF     |   6 TWOSL      000A20 R
  6 TYPE1      000E87 R   |   6 TYPE2      000E93 R   |   6 TYPES      000E82 R
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]

Symbol Table

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
    UD3     =  000003     |     UD4     =  000004     |   6 UDOT       000F28 R
  6 UDOTR      000F08 R   |   6 UEND       000045 R   |     UHLD    =  000012 
    UINN    =  00000A     |     UINTER  =  000010     |     ULAST   =  00001A 
  6 ULES1      0007AA R   |   6 ULESS      000794 R   |   6 UMMOD      00082A R
  6 UMSTA      000903 R   |   6 UNIQ1      0015E2 R   |   6 UNIQU      0015C3 R
  6 UNTIL      0014C5 R   |     UOFFSET =  00001C     |   6 UPDATCP    001B6C R
  6 UPDATLAS   001B43 R   |   6 UPDATPTR   0020E3 R   |   6 UPDATRUN   001B5B R
  6 UPDATVP    001B83 R   |   6 UPL1       00057A R   |   6 UPLUS      000563 R
    UPP     =  000006     |     URLAST  =  000020     |     USR_BTN_=  000004 
    USR_BTN_=  000010     |     USR_BTN_=  005015     |     UTFLASH =  00001E 
    UTIB    =  00000E     |     UTMP    =  000008     |   6 UTYP1      00181A R
  6 UTYP2      001829 R   |   6 UTYPE      001815 R   |     UVP     =  000016 
  6 UZERO      00002B R   |   6 VARIA      001790 R   |     VAR_BASE=  000080 
    VAR_TOP =  0017BF     |     VER     =  000003     |   6 VPP        000627 R
    VSIZE   =  000006     |     WANT_DEB=  000000     |     WANT_MAT=  000001 
    WANT_SEE=  000000     |     WDGOPT  =  004805     |     WDGOPT_I=  000002 
    WDGOPT_L=  000003     |     WDGOPT_W=  000000     |     WDGOPT_W=  000001 
  6 WHILE      00154B R   |   6 WITHI      00080F R   |   6 WORDD      00109E R
  6 WORDS      00193A R   |   6 WORS1      001940 R   |   6 WORS2      00195C R
    WWDG_CR =  0050D1     |     WWDG_WR =  0050D2     |   6 XORR       00054E R
    XTEMP   =  000022     |     YTEMP   =  000024     |   6 ZERO       000A3A R
  6 ZL1        00051B R   |   6 ZLESS      000512 R   |   6 app_spac   002180 R
  6 block_er   001D06 R   |   6 clear_ra   000019 R   |   6 clock_in   000062 R
  6 copy_buf   001D5D R   |   6 copy_buf   001D7C R   |   6 copy_pro   001D7C R
    da      =  000002     |     db      =  000003     |     dc      =  000000 
    dd      =  000001     |   6 ee_ccomm   001F77 R   |   6 ee_comma   001F56 R
  6 ee_cstor   001C73 R   |   6 ee_store   001CBF R   |   6 erase_fl   001D22 R
  6 farat      001B94 R   |   6 farcat     001BB0 R   |   6 fmove_do   0020CC R
  6 fptr_sto   001AAF R   |   6 inc_fptr   001C41 R   |   6 lock       001C2D R
  6 main       000016 R   |   6 next_row   002089 R   |   6 no_move    0020D3 R
  6 pristine   001DF7 R   |   6 proceed_   001D25 R   |   6 reboot     000325 R
  6 reset_ve   001E5E R   |   6 row_eras   001CE9 R   |   6 row_eras   001D36 R
  6 row_eras   001D5D R   |   6 set_opti   001DCB R   |   6 set_vect   001EFF R
  6 uart1_in   000074 R   |   6 unlock     001C05 R   |   6 unlock_e   001BC7 R
  6 unlock_f   001BE6 R   |   6 write_by   001C58 R   |   6 write_ro   001DA1 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]

Symbol Table


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

