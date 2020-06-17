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
      0080B5 93 79                  275         .word      INTER   ;'EVAL
      0080B7 00 00                  276         .word      0       ;HLD
      0080B9 A1 AA                  277         .word      LASTN  ;CNTXT pointer
      0080BB 00 80                  278         .word      VAR_BASE   ;variables free space pointer 
      0080BD A2 00                  279         .word      app_space ; FLASH free space pointer 
      0080BF A1 AA                  280         .word      LASTN   ;LAST
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
      00812B CC 9A 18         [ 2]  332         jp  COLD   ;default=MN1
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
      0081A7 CD 91 3E         [ 4]  417         call TOKEN 
      0081AA CD 85 63         [ 4]  418         call DUPP 
      0081AD CD 84 67         [ 4]  419         call QBRAN 
      0081B0 82 8D                  420         .word FORGET2
      0081B2 CD 92 3B         [ 4]  421         call NAMEQ
      0081B5 CD 87 0D         [ 4]  422         call QDUP 
      0081B8 CD 84 67         [ 4]  423         call QBRAN 
      0081BB 82 8D                  424         .word FORGET2
      0081BD CD 85 59         [ 4]  425         call DROP 
      0081C0 1D 00 04         [ 2]  426         subw x,#2*CELLL 
      0081C3 90 5F            [ 1]  427         clrw y 
      0081C5 FF               [ 2]  428         ldw (x),y 
      0081C6 90 AE 40 02      [ 2]  429         ldw y,#APP_RUN 
      0081CA EF 02            [ 2]  430         ldw (2,x),y 
      0081CC CC 9D 48         [ 2]  431         jp ee_store 
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
      0081D8 CD 91 3E         [ 4]  442         call TOKEN
      0081DB CD 85 63         [ 4]  443         call DUPP 
      0081DE CD 84 67         [ 4]  444         call QBRAN 
      0081E1 82 8D                  445         .word FORGET2
      0081E3 CD 92 3B         [ 4]  446         call NAMEQ ; ( a -- ca na | a F )
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
      008204 CD 9F 39         [ 4]  461         call CHKIVEC ; ( na -- ) 
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
      008249 CD 9B F5         [ 4]  489         call UPDATCP 
      00824C CC 9B CC         [ 2]  490         jp UPDATLAST 
      00824F                        491 FORGET6: ; tried to forget a RAM or system word 
                                    492 ; ( ca na -- )
      00824F 1D 00 02         [ 2]  493         subw x,#CELLL 
      008252 90 BE 2A         [ 2]  494         ldw y,SP0 
      008255 FF               [ 2]  495         ldw (x),y  
      008256 CD 88 1E         [ 4]  496         call ULESS
      008259 CD 84 67         [ 4]  497         call QBRAN 
      00825C 82 7F                  498         .word PROTECTED 
      00825E CD 93 47         [ 4]  499         call ABORQ 
      008261 1D                     500         .byte 29
      008262 20 46 6F 72 20 52 41   501         .ascii " For RAM definition do REBOOT"
             4D 20 64 65 66 69 6E
             69 74 69 6F 6E 20 64
             6F 20 52 45 42 4F 4F
             54
      00827F                        502 PROTECTED:
      00827F CD 93 47         [ 4]  503         call ABORQ
      008282 0A                     504         .byte 10
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



      008283 20 50 72 6F 74 65 63   505         .ascii " Protected"
             74 65 64
      00828D                        506 FORGET2: ; no name or not found in dictionary 
      00828D CD 93 47         [ 4]  507         call ABORQ
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
      0082D6 CC 9C 0C         [ 2]  542         jp UPDATVP 
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
      0083C1 CD 93 47         [ 4]  709         call ABORQ 
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
                                    833 ;       EXIT    ( -- )
                                    834 ;       Terminate a colon definition.
      008497 84 86                  835         .word      LINK
                           000419   836 LINK = .
      008499 04                     837         .byte      4
      00849A 45 58 49 54            838         .ascii     "EXIT"
      00849E                        839 EXIT:
      00849E 90 85            [ 2]  840         POPW Y
      0084A0 81               [ 4]  841         RET
                                    842 
                                    843 ;       !       ( w a -- )
                                    844 ;       Pop  data stack to memory.
      0084A1 84 99                  845         .word      LINK
                           000423   846 LINK = .
      0084A3 01                     847         .byte      1
      0084A4 21                     848         .ascii     "!"
      0084A5                        849 STORE:
      0084A5 90 93            [ 1]  850         LDW Y,X
      0084A7 90 FE            [ 2]  851         LDW Y,(Y)    ;Y=a
      0084A9 90 BF 24         [ 2]  852         LDW YTEMP,Y
      0084AC 90 93            [ 1]  853         LDW Y,X
      0084AE 90 EE 02         [ 2]  854         LDW Y,(2,Y)
      0084B1 91 CF 24         [ 5]  855         LDW [YTEMP],Y ;store w at a
      0084B4 1C 00 04         [ 2]  856         ADDW X,#4 ; DDROP 
      0084B7 81               [ 4]  857         RET     
                                    858 
                                    859 ;       @       ( a -- w )
                                    860 ;       Push memory location to stack.
      0084B8 84 A3                  861         .word      LINK
                           00043A   862 LINK	= 	.
      0084BA 01                     863         .byte    1
      0084BB 40                     864         .ascii	"@"
      0084BC                        865 AT:
      0084BC 90 93            [ 1]  866         LDW Y,X     ;Y = a
      0084BE 90 FE            [ 2]  867         LDW Y,(Y)   ; address 
      0084C0 90 FE            [ 2]  868         LDW Y,(Y)   ; value 
      0084C2 FF               [ 2]  869         LDW (X),Y ;w = @Y
      0084C3 81               [ 4]  870         RET     
                                    871 
                                    872 ;       C!      ( c b -- )
                                    873 ;       Pop  data stack to byte memory.
      0084C4 84 BA                  874         .word      LINK
                           000446   875 LINK	= .
      0084C6 02                     876         .byte      2
      0084C7 43 21                  877         .ascii     "C!"
      0084C9                        878 CSTOR:
      0084C9 90 93            [ 1]  879         LDW Y,X
      0084CB 90 FE            [ 2]  880 	LDW Y,(Y)    ;Y=b
      0084CD E6 03            [ 1]  881         LD A,(3,X)    ;D = c
      0084CF 90 F7            [ 1]  882         LD  (Y),A     ;store c at b
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
Hexadecimal [24-Bits]



      0084D1 1C 00 04         [ 2]  883 	ADDW X,#4 ; DDROP 
      0084D4 81               [ 4]  884         RET     
                                    885 
                                    886 ;       C@      ( b -- c )
                                    887 ;       Push byte in memory to  stack.
      0084D5 84 C6                  888         .word      LINK
                           000457   889 LINK	= 	.
      0084D7 02                     890         .byte      2
      0084D8 43 40                  891         .ascii     "C@"
      0084DA                        892 CAT:
      0084DA 90 93            [ 1]  893         LDW Y,X     ;Y=b
      0084DC 90 FE            [ 2]  894         LDW Y,(Y)
      0084DE 90 F6            [ 1]  895         LD A,(Y)
      0084E0 E7 01            [ 1]  896         LD (1,X),A
      0084E2 7F               [ 1]  897         CLR (X)
      0084E3 81               [ 4]  898         RET     
                                    899 
                                    900 ;       RP@     ( -- a )
                                    901 ;       Push current RP to data stack.
      0084E4 84 D7                  902         .word      LINK
                           000466   903 LINK	= .
      0084E6 03                     904         .byte      3
      0084E7 52 50 40               905         .ascii     "RP@"
      0084EA                        906 RPAT:
      0084EA 90 96            [ 1]  907         LDW Y,SP    ;save return addr
      0084EC 1D 00 02         [ 2]  908         SUBW X,#2
      0084EF FF               [ 2]  909         LDW (X),Y
      0084F0 81               [ 4]  910         RET     
                                    911 
                                    912 ;       RP!     ( a -- )
                                    913 ;       Set  return stack pointer.
      0084F1 84 E6                  914         .word      LINK
                           000473   915 LINK	= 	. 
      0084F3 43                     916 	.byte      COMPO+3
      0084F4 52 50 21               917         .ascii     "RP!"
      0084F7                        918 RPSTO:
      0084F7 90 85            [ 2]  919         POPW Y
      0084F9 90 BF 24         [ 2]  920         LDW YTEMP,Y
      0084FC 90 93            [ 1]  921         LDW Y,X
      0084FE 90 FE            [ 2]  922         LDW Y,(Y)
      008500 90 94            [ 1]  923         LDW SP,Y
      008502 1C 00 02         [ 2]  924         ADDW x,#CELLL ; a was not dropped, Picatout 2020-05-24
      008505 92 CC 24         [ 5]  925         JP [YTEMP]
                                    926 
                                    927 ;       R>      ( -- w )
                                    928 ;       Pop return stack to data stack.
      008508 84 F3                  929         .word      LINK
                           00048A   930 LINK	= 	. 
      00850A 42                     931 	.byte      COMPO+2
      00850B 52 3E                  932         .ascii     "R>"
      00850D                        933 RFROM:
      00850D 90 85            [ 2]  934         POPW Y    ;save return addr
      00850F 90 BF 24         [ 2]  935         LDW YTEMP,Y
      008512 90 85            [ 2]  936         POPW Y
      008514 1D 00 02         [ 2]  937         SUBW X,#2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]



      008517 FF               [ 2]  938         LDW (X),Y
      008518 92 CC 24         [ 5]  939         JP [YTEMP]
                                    940 
                                    941 ;       R@      ( -- w )
                                    942 ;       Copy top of return stack to stack.
      00851B 85 0A                  943         .word      LINK
                           00049D   944 LINK	= 	. 
      00851D 02                     945         .byte      2
      00851E 52 40                  946         .ascii     "R@"
      008520                        947 RAT:
      008520 16 03            [ 2]  948         ldw y,(3,sp)
      008522 1D 00 02         [ 2]  949         subw x,#CELLL 
      008525 FF               [ 2]  950         ldw (x),y 
      008526 81               [ 4]  951         ret 
                                    952 
                                    953 ;       >R      ( w -- )
                                    954 ;       Push data stack to return stack.
      008527 85 1D                  955         .word      LINK
                           0004A9   956 LINK	= 	. 
      008529 42                     957 	.byte      COMPO+2
      00852A 3E 52                  958         .ascii     ">R"
      00852C                        959 TOR:
      00852C 90 85            [ 2]  960         POPW Y    ;save return addr
      00852E 90 BF 24         [ 2]  961         LDW YTEMP,Y
      008531 90 93            [ 1]  962         LDW Y,X
      008533 90 FE            [ 2]  963         LDW Y,(Y)
      008535 90 89            [ 2]  964         PUSHW Y    ;restore return addr
      008537 1C 00 02         [ 2]  965         ADDW X,#2
      00853A 92 CC 24         [ 5]  966         JP [YTEMP]
                                    967 
                                    968 ;       SP@     ( -- a )
                                    969 ;       Push current stack pointer.
      00853D 85 29                  970         .word      LINK
                           0004BF   971 LINK	= 	. 
      00853F 03                     972         .byte      3
      008540 53 50 40               973         .ascii     "SP@"
      008543                        974 SPAT:
      008543 90 93            [ 1]  975 	LDW Y,X
      008545 1D 00 02         [ 2]  976         SUBW X,#2
      008548 FF               [ 2]  977 	LDW (X),Y
      008549 81               [ 4]  978         RET     
                                    979 
                                    980 ;       SP!     ( a -- )
                                    981 ;       Set  data stack pointer.
      00854A 85 3F                  982         .word      LINK
                           0004CC   983 LINK	= 	. 
      00854C 03                     984         .byte      3
      00854D 53 50 21               985         .ascii     "SP!"
      008550                        986 SPSTO:
      008550 FE               [ 2]  987         LDW     X,(X)     ;X = a
      008551 81               [ 4]  988         RET     
                                    989 
                                    990 ;       DROP    ( w -- )
                                    991 ;       Discard top stack item.
      008552 85 4C                  992         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]



                           0004D4   993 LINK	= 	. 
      008554 04                     994         .byte      4
      008555 44 52 4F 50            995         .ascii     "DROP"
      008559                        996 DROP:
      008559 1C 00 02         [ 2]  997         ADDW X,#2     
      00855C 81               [ 4]  998         RET     
                                    999 
                                   1000 ;       DUP     ( w -- w w )
                                   1001 ;       Duplicate  top stack item.
      00855D 85 54                 1002         .word      LINK
                           0004DF  1003 LINK	= 	. 
      00855F 03                    1004         .byte      3
      008560 44 55 50              1005         .ascii     "DUP"
      008563                       1006 DUPP:
      008563 90 93            [ 1] 1007 	LDW Y,X
      008565 1D 00 02         [ 2] 1008         SUBW X,#2
      008568 90 FE            [ 2] 1009 	LDW Y,(Y)
      00856A FF               [ 2] 1010 	LDW (X),Y
      00856B 81               [ 4] 1011         RET     
                                   1012 
                                   1013 ;       SWAP    ( w1 w2 -- w2 w1 )
                                   1014 ;       Exchange top two stack items.
      00856C 85 5F                 1015         .word      LINK
                           0004EE  1016 LINK	= 	. 
      00856E 04                    1017         .byte      4
      00856F 53 57 41 50           1018         .ascii     "SWAP"
      008573                       1019 SWAPP:
      008573 90 93            [ 1] 1020         LDW Y,X
      008575 90 FE            [ 2] 1021         LDW Y,(Y)
      008577 90 BF 24         [ 2] 1022         LDW YTEMP,Y
      00857A 90 93            [ 1] 1023         LDW Y,X
      00857C 90 EE 02         [ 2] 1024         LDW Y,(2,Y)
      00857F FF               [ 2] 1025         LDW (X),Y
      008580 90 BE 24         [ 2] 1026         LDW Y,YTEMP
      008583 EF 02            [ 2] 1027         LDW (2,X),Y
      008585 81               [ 4] 1028         RET     
                                   1029 
                                   1030 ;       OVER    ( w1 w2 -- w1 w2 w1 )
                                   1031 ;       Copy second stack item to top.
      008586 85 6E                 1032         .word      LINK
                           000508  1033 LINK	= . 
      008588 04                    1034         .byte      4
      008589 4F 56 45 52           1035         .ascii     "OVER"
      00858D                       1036 OVER:
      00858D 1D 00 02         [ 2] 1037         SUBW X,#2
      008590 90 93            [ 1] 1038         LDW Y,X
      008592 90 EE 04         [ 2] 1039         LDW Y,(4,Y)
      008595 FF               [ 2] 1040         LDW (X),Y
      008596 81               [ 4] 1041         RET     
                                   1042 
                                   1043 ;       0<      ( n -- t )
                                   1044 ;       Return true if n is negative.
      008597 85 88                 1045         .word      LINK
                           000519  1046 LINK	= . 
      008599 02                    1047         .byte      2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



      00859A 30 3C                 1048         .ascii     "0<"
      00859C                       1049 ZLESS:
      00859C A6 FF            [ 1] 1050         LD A,#0xFF
      00859E 90 93            [ 1] 1051         LDW Y,X
      0085A0 90 FE            [ 2] 1052         LDW Y,(Y)
      0085A2 2B 01            [ 1] 1053         JRMI     ZL1
      0085A4 4F               [ 1] 1054         CLR A   ;false
      0085A5 F7               [ 1] 1055 ZL1:    LD     (X),A
      0085A6 E7 01            [ 1] 1056         LD (1,X),A
      0085A8 81               [ 4] 1057 	RET     
                                   1058 
                                   1059 ;       AND     ( w w -- w )
                                   1060 ;       Bitwise AND.
      0085A9 85 99                 1061         .word      LINK
                           00052B  1062 LINK	= . 
      0085AB 03                    1063         .byte      3
      0085AC 41 4E 44              1064         .ascii     "AND"
      0085AF                       1065 ANDD:
      0085AF F6               [ 1] 1066         LD  A,(X)    ;D=w
      0085B0 E4 02            [ 1] 1067         AND A,(2,X)
      0085B2 E7 02            [ 1] 1068         LD (2,X),A
      0085B4 E6 01            [ 1] 1069         LD A,(1,X)
      0085B6 E4 03            [ 1] 1070         AND A,(3,X)
      0085B8 E7 03            [ 1] 1071         LD (3,X),A
      0085BA 1C 00 02         [ 2] 1072         ADDW X,#2
      0085BD 81               [ 4] 1073         RET
                                   1074 
                                   1075 ;       OR      ( w w -- w )
                                   1076 ;       Bitwise inclusive OR.
      0085BE 85 AB                 1077         .word      LINK
                           000540  1078 LINK = . 
      0085C0 02                    1079         .byte      2
      0085C1 4F 52                 1080         .ascii     "OR"
      0085C3                       1081 ORR:
      0085C3 F6               [ 1] 1082         LD A,(X)    ;D=w
      0085C4 EA 02            [ 1] 1083         OR A,(2,X)
      0085C6 E7 02            [ 1] 1084         LD (2,X),A
      0085C8 E6 01            [ 1] 1085         LD A,(1,X)
      0085CA EA 03            [ 1] 1086         OR A,(3,X)
      0085CC E7 03            [ 1] 1087         LD (3,X),A
      0085CE 1C 00 02         [ 2] 1088         ADDW X,#2
      0085D1 81               [ 4] 1089         RET
                                   1090 
                                   1091 ;       XOR     ( w w -- w )
                                   1092 ;       Bitwise exclusive OR.
      0085D2 85 C0                 1093         .word      LINK
                           000554  1094 LINK	= . 
      0085D4 03                    1095         .byte      3
      0085D5 58 4F 52              1096         .ascii     "XOR"
      0085D8                       1097 XORR:
      0085D8 F6               [ 1] 1098         LD A,(X)    ;D=w
      0085D9 E8 02            [ 1] 1099         XOR A,(2,X)
      0085DB E7 02            [ 1] 1100         LD (2,X),A
      0085DD E6 01            [ 1] 1101         LD A,(1,X)
      0085DF E8 03            [ 1] 1102         XOR A,(3,X)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]



      0085E1 E7 03            [ 1] 1103         LD (3,X),A
      0085E3 1C 00 02         [ 2] 1104         ADDW X,#2
      0085E6 81               [ 4] 1105         RET
                                   1106 
                                   1107 ;       UM+     ( u u -- udsum )
                                   1108 ;       Add two unsigned single
                                   1109 ;       and return a double sum.
      0085E7 85 D4                 1110         .word      LINK
                           000569  1111 LINK	= . 
      0085E9 03                    1112         .byte      3
      0085EA 55 4D 2B              1113         .ascii     "UM+"
      0085ED                       1114 UPLUS:
      0085ED A6 01            [ 1] 1115         LD A,#1
      0085EF 90 93            [ 1] 1116         LDW Y,X
      0085F1 90 EE 02         [ 2] 1117         LDW Y,(2,Y)
      0085F4 90 BF 24         [ 2] 1118         LDW YTEMP,Y
      0085F7 90 93            [ 1] 1119         LDW Y,X
      0085F9 90 FE            [ 2] 1120         LDW Y,(Y)
      0085FB 72 B9 00 24      [ 2] 1121         ADDW Y,YTEMP
      0085FF EF 02            [ 2] 1122         LDW (2,X),Y
      008601 25 01            [ 1] 1123         JRC     UPL1
      008603 4F               [ 1] 1124         CLR A
      008604 E7 01            [ 1] 1125 UPL1:   LD     (1,X),A
      008606 7F               [ 1] 1126         CLR (X)
      008607 81               [ 4] 1127         RET
                                   1128 
                                   1129 ;; System and user variables
                                   1130 
                                   1131 ;       doVAR   ( -- a )
                                   1132 ;       Code for VARIABLE and CREATE.
      008608 85 E9                 1133         .word      LINK
                           00058A  1134 LINK	= . 
      00860A 45                    1135 	.byte      COMPO+5
      00860B 44 4F 56 41 52        1136         .ascii     "DOVAR"
      008610                       1137 DOVAR:
      008610 1D 00 02         [ 2] 1138 	SUBW X,#2
      008613 90 85            [ 2] 1139         POPW Y    ;get return addr (pfa)
      008615 90 FE            [ 2] 1140         LDW Y,(Y) ; indirect address 
      008617 FF               [ 2] 1141         LDW (X),Y    ;push on stack
      008618 81               [ 4] 1142         RET     ;go to RET of EXEC
                                   1143 
                                   1144 ;       BASE    ( -- a )
                                   1145 ;       Radix base for numeric I/O.
      008619 86 0A                 1146         .word      LINK        
                           00059B  1147 LINK = . 
      00861B 04                    1148         .byte      4
      00861C 42 41 53 45           1149         .ascii     "BASE"
      008620                       1150 BASE:
      008620 90 AE 00 06      [ 2] 1151 	LDW Y,#UBASE 
      008624 1D 00 02         [ 2] 1152 	SUBW X,#2
      008627 FF               [ 2] 1153         LDW (X),Y
      008628 81               [ 4] 1154         RET
                                   1155 
                                   1156 ;       tmp     ( -- a )
                                   1157 ;       A temporary storage.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



      008629 86 1B                 1158         .word      LINK
                                   1159         
                           0005AB  1160 LINK = . 
      00862B 03                    1161 	.byte      3
      00862C 54 4D 50              1162         .ascii     "TMP"
      00862F                       1163 TEMP:
      00862F 90 AE 00 08      [ 2] 1164 	LDW Y,#UTMP
      008633 1D 00 02         [ 2] 1165 	SUBW X,#2
      008636 FF               [ 2] 1166         LDW (X),Y
      008637 81               [ 4] 1167         RET
                                   1168 
                                   1169 ;       >IN     ( -- a )
                                   1170 ;        Hold parsing pointer.
      008638 86 2B                 1171         .word      LINK
                           0005BA  1172 LINK = . 
      00863A 03                    1173         .byte      3
      00863B 3E 49 4E              1174         .ascii    ">IN"
      00863E                       1175 INN:
      00863E 90 AE 00 0A      [ 2] 1176 	LDW Y,#UINN 
      008642 1D 00 02         [ 2] 1177 	SUBW X,#2
      008645 FF               [ 2] 1178         LDW (X),Y
      008646 81               [ 4] 1179         RET
                                   1180 
                                   1181 ;       #TIB    ( -- a )
                                   1182 ;       Count in terminal input buffer.
      008647 86 3A                 1183         .word      LINK
                           0005C9  1184 LINK = . 
      008649 04                    1185         .byte      4
      00864A 23 54 49 42           1186         .ascii     "#TIB"
      00864E                       1187 NTIB:
      00864E 90 AE 00 0C      [ 2] 1188 	LDW Y,#UCTIB 
      008652 1D 00 02         [ 2] 1189 	SUBW X,#2
      008655 FF               [ 2] 1190         LDW (X),Y
      008656 81               [ 4] 1191         RET
                                   1192 
                                   1193 ;       TBUF ( -- a )
                                   1194 ;       address of 128 bytes transaction buffer 
      008657 86 49                 1195         .word LINK 
                           0005D9  1196         LINK=.
      008659 04                    1197         .byte 4 
      00865A 54 42 55 46           1198         .ascii "TBUF"
      00865E                       1199 TBUF:
      00865E 90 AE 16 80      [ 2] 1200         ldw y,#ROWBUFF
      008662 1D 00 02         [ 2] 1201         subw x,#CELLL
      008665 FF               [ 2] 1202         ldw (x),y 
      008666 81               [ 4] 1203         ret 
                                   1204 
                                   1205 ; systeme variable 
                                   1206 ; compilation destination 
                                   1207 ; TFLASH ( -- A )
      008667 86 59                 1208         .word LINK 
                           0005E9  1209         LINK=.
      008669 06                    1210         .byte 6 
      00866A 54 46 4C 41 53 48     1211         .ascii "TFLASH"         
      008670                       1212 TFLASH:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]



      008670 1D 00 02         [ 2] 1213         subw x,#CELLL 
      008673 90 AE 00 1E      [ 2] 1214         ldw y,#UTFLASH
      008677 FF               [ 2] 1215         ldw (x),y 
      008678 81               [ 4] 1216         ret 
                                   1217 
                                   1218 ;       "EVAL   ( -- a )
                                   1219 ;       Execution vector of EVAL.
      008679 86 69                 1220         .word      LINK
                           0005FB  1221 LINK = . 
      00867B 05                    1222         .byte      5
      00867C 27 45 56 41 4C        1223         .ascii     "'EVAL"
      008681                       1224 TEVAL:
      008681 90 AE 00 10      [ 2] 1225 	LDW Y,#UINTER 
      008685 1D 00 02         [ 2] 1226 	SUBW X,#2
      008688 FF               [ 2] 1227         LDW (X),Y
      008689 81               [ 4] 1228         RET
                                   1229 
                                   1230 ;       HLD     ( -- a )
                                   1231 ;       Hold a pointer of output string.
      00868A 86 7B                 1232         .word      LINK
                           00060C  1233 LINK = . 
      00868C 03                    1234         .byte      3
      00868D 48 4C 44              1235         .ascii     "HLD"
      008690                       1236 HLD:
      008690 90 AE 00 12      [ 2] 1237 	LDW Y,#UHLD 
      008694 1D 00 02         [ 2] 1238 	SUBW X,#2
      008697 FF               [ 2] 1239         LDW (X),Y
      008698 81               [ 4] 1240         RET
                                   1241 
                                   1242 ;       CONTEXT ( -- a )
                                   1243 ;       Start vocabulary search.
      008699 86 8C                 1244         .word      LINK
                           00061B  1245 LINK = . 
      00869B 07                    1246         .byte      7
      00869C 43 4F 4E 54 45 58 54  1247         .ascii     "CONTEXT"
      0086A3                       1248 CNTXT:
      0086A3 90 AE 00 14      [ 2] 1249 	LDW Y,#UCNTXT
      0086A7 1D 00 02         [ 2] 1250 	SUBW X,#2
      0086AA FF               [ 2] 1251         LDW (X),Y
      0086AB 81               [ 4] 1252         RET
                                   1253 
                                   1254 ;       VP      ( -- a )
                                   1255 ;       Point to top of variables
      0086AC 86 9B                 1256         .word      LINK
                           00062E  1257 LINK = . 
      0086AE 02                    1258         .byte      2
      0086AF 56 50                 1259         .ascii     "VP"
      0086B1                       1260 VPP:
      0086B1 90 AE 00 16      [ 2] 1261 	LDW Y,#UVP 
      0086B5 1D 00 02         [ 2] 1262 	SUBW X,#2
      0086B8 FF               [ 2] 1263         LDW (X),Y
      0086B9 81               [ 4] 1264         RET
                                   1265 
                                   1266 ;       CP    ( -- a )
                                   1267 ;       Pointer to top of FLASH 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



      0086BA 86 AE                 1268         .word LINK 
                           00063C  1269         LINK=.
      0086BC 02                    1270         .byte 2 
      0086BD 43 50                 1271         .ascii "CP"
      0086BF                       1272 CPP: 
      0086BF 90 AE 00 18      [ 2] 1273         ldw y,#UCP 
      0086C3 1D 00 02         [ 2] 1274         subw x,#CELLL 
      0086C6 FF               [ 2] 1275         ldw (x),y 
      0086C7 81               [ 4] 1276         ret                
                                   1277 
                                   1278 ;       LAST    ( -- a )
                                   1279 ;       Point to last name in dictionary.
      0086C8 86 BC                 1280         .word      LINK
                           00064A  1281 LINK = . 
      0086CA 04                    1282         .byte      4
      0086CB 4C 41 53 54           1283         .ascii     "LAST"
      0086CF                       1284 LAST:
      0086CF 90 AE 00 1A      [ 2] 1285 	LDW Y,#ULAST 
      0086D3 1D 00 02         [ 2] 1286 	SUBW X,#2
      0086D6 FF               [ 2] 1287         LDW (X),Y
      0086D7 81               [ 4] 1288         RET
                                   1289 
                                   1290 ; address of system variable URLAST 
                                   1291 ;       RAMLAST ( -- a )
                                   1292 ; RAM dictionary context 
      0086D8 86 CA                 1293         .word LINK 
                           00065A  1294         LINK=. 
      0086DA 07                    1295         .byte 7  
      0086DB 52 41 4D 4C 41 53 54  1296         .ascii "RAMLAST" 
      0086E2                       1297 RAMLAST: 
      0086E2 90 AE 00 20      [ 2] 1298         ldw y,#URLAST 
      0086E6 1D 00 02         [ 2] 1299         subw x,#CELLL 
      0086E9 FF               [ 2] 1300         ldw (x),y 
      0086EA 81               [ 4] 1301         ret 
                                   1302 
                                   1303 ; OFFSET ( -- a )
                                   1304 ; address of system variable OFFSET 
      0086EB 86 DA                 1305         .word LINK 
                           00066D  1306         LINK=.
      0086ED 06                    1307         .byte 6
      0086EE 4F 46 46 53 45 54     1308         .ascii "OFFSET" 
      0086F4                       1309 OFFSET: 
      0086F4 1D 00 02         [ 2] 1310         subw x,#CELLL
      0086F7 90 AE 00 1C      [ 2] 1311         ldw y,#UOFFSET 
      0086FB FF               [ 2] 1312         ldw (x),y 
      0086FC 81               [ 4] 1313         ret 
                                   1314 
                                   1315 ; adjust jump address adding OFFSET
                                   1316 ; ADR-ADJ ( a -- a+offset )
      0086FD                       1317 ADRADJ: 
      0086FD CD 86 F4         [ 4] 1318         call OFFSET 
      008700 CD 84 BC         [ 4] 1319         call AT 
      008703 CC 87 5E         [ 2] 1320         jp PLUS 
                                   1321 
                                   1322 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



                                   1323 ;; Common functions
                                   1324 
                                   1325 ;       ?DUP    ( w -- w w | 0 )
                                   1326 ;       Dup tos if its is not zero.
      008706 86 ED                 1327         .word      LINK
                           000688  1328 LINK = . 
      008708 04                    1329         .byte      4
      008709 3F 44 55 50           1330         .ascii     "?DUP"
      00870D                       1331 QDUP:
      00870D 90 93            [ 1] 1332         LDW Y,X
      00870F 90 FE            [ 2] 1333 	LDW Y,(Y)
      008711 27 04            [ 1] 1334         JREQ     QDUP1
      008713 1D 00 02         [ 2] 1335 	SUBW X,#2
      008716 FF               [ 2] 1336         LDW (X),Y
      008717 81               [ 4] 1337 QDUP1:  RET
                                   1338 
                                   1339 ;       ROT     ( w1 w2 w3 -- w2 w3 w1 )
                                   1340 ;       Rot 3rd item to top.
      008718 87 08                 1341         .word      LINK
                           00069A  1342 LINK = . 
      00871A 03                    1343         .byte      3
      00871B 52 4F 54              1344         .ascii     "ROT"
      00871E                       1345 ROT:
      00871E 90 93            [ 1] 1346         ldw y,x 
      008720 90 FE            [ 2] 1347         ldw y,(y)
      008722 90 89            [ 2] 1348         pushw y 
      008724 90 93            [ 1] 1349         ldw y,x 
      008726 90 EE 04         [ 2] 1350         ldw y,(4,y)
      008729 FF               [ 2] 1351         ldw (x),y 
      00872A 90 93            [ 1] 1352         ldw y,x 
      00872C 90 EE 02         [ 2] 1353         ldw y,(2,y)
      00872F EF 04            [ 2] 1354         ldw (4,x),y 
      008731 90 85            [ 2] 1355         popw y 
      008733 EF 02            [ 2] 1356         ldw (2,x),y
      008735 81               [ 4] 1357         ret 
                                   1358 
                                   1359 ;       2DROP   ( w w -- )
                                   1360 ;       Discard two items on stack.
      008736 87 1A                 1361         .word      LINK
                           0006B8  1362 LINK = . 
      008738 05                    1363         .byte      5
      008739 32 44 52 4F 50        1364         .ascii     "2DROP"
      00873E                       1365 DDROP:
      00873E 1C 00 04         [ 2] 1366         ADDW X,#4
      008741 81               [ 4] 1367         RET
                                   1368 
                                   1369 ;       2DUP    ( w1 w2 -- w1 w2 w1 w2 )
                                   1370 ;       Duplicate top two items.
      008742 87 38                 1371         .word      LINK
                           0006C4  1372 LINK = . 
      008744 04                    1373         .byte      4
      008745 32 44 55 50           1374         .ascii     "2DUP"
      008749                       1375 DDUP:
      008749 1D 00 04         [ 2] 1376         SUBW X,#4
      00874C 90 93            [ 1] 1377         LDW Y,X
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal [24-Bits]



      00874E 90 EE 06         [ 2] 1378         LDW Y,(6,Y)
      008751 EF 02            [ 2] 1379         LDW (2,X),Y
      008753 90 93            [ 1] 1380         LDW Y,X
      008755 90 EE 04         [ 2] 1381         LDW Y,(4,Y)
      008758 FF               [ 2] 1382         LDW (X),Y
      008759 81               [ 4] 1383         RET
                                   1384 
                                   1385 ;       +       ( w w -- sum )
                                   1386 ;       Add top two items.
      00875A 87 44                 1387         .word      LINK
                           0006DC  1388 LINK = . 
      00875C 01                    1389         .byte      1
      00875D 2B                    1390         .ascii     "+"
      00875E                       1391 PLUS:
      00875E 90 93            [ 1] 1392         LDW Y,X
      008760 90 FE            [ 2] 1393         LDW Y,(Y)
      008762 90 BF 24         [ 2] 1394         LDW YTEMP,Y
      008765 1C 00 02         [ 2] 1395         ADDW X,#2
      008768 90 93            [ 1] 1396         LDW Y,X
      00876A 90 FE            [ 2] 1397         LDW Y,(Y)
      00876C 72 B9 00 24      [ 2] 1398         ADDW Y,YTEMP
      008770 FF               [ 2] 1399         LDW (X),Y
      008771 81               [ 4] 1400         RET
                                   1401 
                                   1402 ;       NOT     ( w -- w )
                                   1403 ;       One's complement of tos.
      008772 87 5C                 1404         .word      LINK
                           0006F4  1405 LINK = . 
      008774 03                    1406         .byte      3
      008775 4E 4F 54              1407         .ascii     "NOT"
      008778                       1408 INVER:
      008778 90 93            [ 1] 1409         LDW Y,X
      00877A 90 FE            [ 2] 1410         LDW Y,(Y)
      00877C 90 53            [ 2] 1411         CPLW Y
      00877E FF               [ 2] 1412         LDW (X),Y
      00877F 81               [ 4] 1413         RET
                                   1414 
                                   1415 ;       NEGATE  ( n -- -n )
                                   1416 ;       Two's complement of tos.
      008780 87 74                 1417         .word      LINK
                           000702  1418 LINK = . 
      008782 06                    1419         .byte      6
      008783 4E 45 47 41 54 45     1420         .ascii     "NEGATE"
      008789                       1421 NEGAT:
      008789 90 93            [ 1] 1422         LDW Y,X
      00878B 90 FE            [ 2] 1423         LDW Y,(Y)
      00878D 90 50            [ 2] 1424         NEGW Y
      00878F FF               [ 2] 1425         LDW (X),Y
      008790 81               [ 4] 1426         RET
                                   1427 
                                   1428 ;       DNEGATE ( d -- -d )
                                   1429 ;       Two's complement of top double.
      008791 87 82                 1430         .word      LINK
                           000713  1431 LINK = . 
      008793 07                    1432         .byte      7
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



      008794 44 4E 45 47 41 54 45  1433         .ascii     "DNEGATE"
      00879B                       1434 DNEGA:
      00879B 90 93            [ 1] 1435         LDW Y,X
      00879D 90 FE            [ 2] 1436 	LDW Y,(Y)
      00879F 90 53            [ 2] 1437         CPLW Y     
      0087A1 90 BF 24         [ 2] 1438 	LDW YTEMP,Y
      0087A4 90 93            [ 1] 1439         LDW Y,X
      0087A6 90 EE 02         [ 2] 1440         LDW Y,(2,Y)
      0087A9 90 53            [ 2] 1441         CPLW Y
      0087AB 72 A9 00 01      [ 2] 1442         addw y,#1
      0087AF EF 02            [ 2] 1443         LDW (2,X),Y
      0087B1 90 BE 24         [ 2] 1444         LDW Y,YTEMP
      0087B4 24 02            [ 1] 1445         JRNC DN1 
      0087B6 90 5C            [ 2] 1446         INCW Y
      0087B8 FF               [ 2] 1447 DN1:    LDW (X),Y
      0087B9 81               [ 4] 1448         RET
                                   1449 
                                   1450 
                                   1451 ;       S>D ( n -- d )
                                   1452 ; convert single integer to double 
      0087BA 87 93                 1453         .word LINK 
                           00073C  1454         LINK=. 
      0087BC 03                    1455         .byte 3 
      0087BD 53 3E 44              1456         .ascii "S>D"
      0087C0                       1457 STOD: 
      0087C0 1D 00 02         [ 2] 1458         subw x,#CELLL 
      0087C3 90 5F            [ 1] 1459         clrw y 
      0087C5 FF               [ 2] 1460         ldw (x),y 
      0087C6 90 93            [ 1] 1461         ldw y,x 
      0087C8 90 EE 02         [ 2] 1462         ldw y,(2,y)
      0087CB 2A 05            [ 1] 1463         jrpl 1$ 
      0087CD 90 AE FF FF      [ 2] 1464         ldw y,#-1
      0087D1 FF               [ 2] 1465         ldw (x),y 
      0087D2 81               [ 4] 1466 1$:     ret 
                                   1467 
                                   1468 
                                   1469 
                                   1470 
                                   1471 ;       -       ( n1 n2 -- n1-n2 )
                                   1472 ;       Subtraction.
      0087D3 87 BC                 1473         .word      LINK
                           000755  1474 LINK = . 
      0087D5 01                    1475         .byte      1
      0087D6 2D                    1476         .ascii     "-"
      0087D7                       1477 SUBB:
      0087D7 90 93            [ 1] 1478         LDW Y,X
      0087D9 90 FE            [ 2] 1479         LDW Y,(Y)
      0087DB 90 BF 24         [ 2] 1480         LDW YTEMP,Y
      0087DE 1C 00 02         [ 2] 1481         ADDW X,#2
      0087E1 90 93            [ 1] 1482         LDW Y,X
      0087E3 90 FE            [ 2] 1483         LDW Y,(Y)
      0087E5 72 B2 00 24      [ 2] 1484         SUBW Y,YTEMP
      0087E9 FF               [ 2] 1485         LDW (X),Y
      0087EA 81               [ 4] 1486         RET
                                   1487 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



                                   1488 ;       ABS     ( n -- n )
                                   1489 ;       Return  absolute value of n.
      0087EB 87 D5                 1490         .word      LINK
                           00076D  1491 LINK = . 
      0087ED 03                    1492         .byte      3
      0087EE 41 42 53              1493         .ascii     "ABS"
      0087F1                       1494 ABSS:
      0087F1 90 93            [ 1] 1495         LDW Y,X
      0087F3 90 FE            [ 2] 1496 	LDW Y,(Y)
      0087F5 2A 03            [ 1] 1497         JRPL     AB1     ;negate:
      0087F7 90 50            [ 2] 1498         NEGW     Y     ;else negate hi byte
      0087F9 FF               [ 2] 1499         LDW (X),Y
      0087FA 81               [ 4] 1500 AB1:    RET
                                   1501 
                                   1502 ;       =       ( w w -- t )
                                   1503 ;       Return true if top two are =al.
      0087FB 87 ED                 1504         .word      LINK
                           00077D  1505 LINK = . 
      0087FD 01                    1506         .byte      1
      0087FE 3D                    1507         .ascii     "="
      0087FF                       1508 EQUAL:
      0087FF A6 FF            [ 1] 1509         LD A,#0xFF  ;true
      008801 90 93            [ 1] 1510         LDW Y,X    ;D = n2
      008803 90 FE            [ 2] 1511         LDW Y,(Y)
      008805 90 BF 24         [ 2] 1512         LDW YTEMP,Y
      008808 1C 00 02         [ 2] 1513         ADDW X,#2
      00880B 90 93            [ 1] 1514         LDW Y,X
      00880D 90 FE            [ 2] 1515         LDW Y,(Y)
      00880F 90 B3 24         [ 2] 1516         CPW Y,YTEMP     ;if n2 <> n1
      008812 27 01            [ 1] 1517         JREQ     EQ1
      008814 4F               [ 1] 1518         CLR A
      008815 F7               [ 1] 1519 EQ1:    LD (X),A
      008816 E7 01            [ 1] 1520         LD (1,X),A
      008818 81               [ 4] 1521 	RET     
                                   1522 
                                   1523 ;       U<      ( u u -- t )
                                   1524 ;       Unsigned compare of top two items.
      008819 87 FD                 1525         .word      LINK
                           00079B  1526 LINK = . 
      00881B 02                    1527         .byte      2
      00881C 55 3C                 1528         .ascii     "U<"
      00881E                       1529 ULESS:
      00881E A6 FF            [ 1] 1530         LD A,#0xFF  ;true
      008820 90 93            [ 1] 1531         LDW Y,X    ;D = n2
      008822 90 FE            [ 2] 1532         LDW Y,(Y)
      008824 90 BF 24         [ 2] 1533         LDW YTEMP,Y
      008827 1C 00 02         [ 2] 1534         ADDW X,#2
      00882A 90 93            [ 1] 1535         LDW Y,X
      00882C 90 FE            [ 2] 1536         LDW Y,(Y)
      00882E 90 B3 24         [ 2] 1537         CPW Y,YTEMP     ;if n2 <> n1
      008831 25 01            [ 1] 1538         JRULT     ULES1
      008833 4F               [ 1] 1539         CLR A
      008834 F7               [ 1] 1540 ULES1:  LD (X),A
      008835 E7 01            [ 1] 1541         LD (1,X),A
      008837 81               [ 4] 1542 	RET     
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



                                   1543 
                                   1544 ;       <       ( n1 n2 -- t )
                                   1545 ;       Signed compare of top two items.
      008838 88 1B                 1546         .word      LINK
                           0007BA  1547 LINK = . 
      00883A 01                    1548         .byte      1
      00883B 3C                    1549         .ascii     "<"
      00883C                       1550 LESS:
      00883C A6 FF            [ 1] 1551         LD A,#0xFF  ;true
      00883E 90 93            [ 1] 1552         LDW Y,X    ;D = n2
      008840 90 FE            [ 2] 1553         LDW Y,(Y)
      008842 90 BF 24         [ 2] 1554         LDW YTEMP,Y
      008845 1C 00 02         [ 2] 1555         ADDW X,#2
      008848 90 93            [ 1] 1556         LDW Y,X
      00884A 90 FE            [ 2] 1557         LDW Y,(Y)
      00884C 90 B3 24         [ 2] 1558         CPW Y,YTEMP     ;if n2 <> n1
      00884F 2F 01            [ 1] 1559         JRSLT     LT1
      008851 4F               [ 1] 1560         CLR A
      008852 F7               [ 1] 1561 LT1:    LD (X),A
      008853 E7 01            [ 1] 1562         LD (1,X),A
      008855 81               [ 4] 1563 	RET     
                                   1564 
                                   1565 ;       MAX     ( n n -- n )
                                   1566 ;       Return greater of two top items.
      008856 88 3A                 1567         .word      LINK
                           0007D8  1568 LINK = . 
      008858 03                    1569         .byte      3
      008859 4D 41 58              1570         .ascii     "MAX"
      00885C                       1571 MAX:
      00885C 90 93            [ 1] 1572         LDW Y,X    ;D = n2
      00885E 90 EE 02         [ 2] 1573         LDW Y,(2,Y)
      008861 90 BF 24         [ 2] 1574         LDW YTEMP,Y
      008864 90 93            [ 1] 1575         LDW Y,X
      008866 90 FE            [ 2] 1576         LDW Y,(Y)
      008868 90 B3 24         [ 2] 1577         CPW Y,YTEMP     ;if n2 <> n1
      00886B 2F 02            [ 1] 1578         JRSLT     MAX1
      00886D EF 02            [ 2] 1579         LDW (2,X),Y
      00886F 1C 00 02         [ 2] 1580 MAX1:   ADDW X,#2
      008872 81               [ 4] 1581 	RET     
                                   1582 
                                   1583 ;       MIN     ( n n -- n )
                                   1584 ;       Return smaller of top two items.
      008873 88 58                 1585         .word      LINK
                           0007F5  1586 LINK = . 
      008875 03                    1587         .byte      3
      008876 4D 49 4E              1588         .ascii     "MIN"
      008879                       1589 MIN:
      008879 90 93            [ 1] 1590         LDW Y,X    ;D = n2
      00887B 90 EE 02         [ 2] 1591         LDW Y,(2,Y)
      00887E 90 BF 24         [ 2] 1592         LDW YTEMP,Y
      008881 90 93            [ 1] 1593         LDW Y,X
      008883 90 FE            [ 2] 1594         LDW Y,(Y)
      008885 90 B3 24         [ 2] 1595         CPW Y,YTEMP     ;if n2 <> n1
      008888 2C 02            [ 1] 1596         JRSGT     MIN1
      00888A EF 02            [ 2] 1597         LDW (2,X),Y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



      00888C 1C 00 02         [ 2] 1598 MIN1:	ADDW X,#2
      00888F 81               [ 4] 1599 	RET     
                                   1600 
                                   1601 ;       WITHIN  ( u ul uh -- t )
                                   1602 ;       Return true if u is within
                                   1603 ;       range of ul and uh. ( ul <= u < uh )
      008890 88 75                 1604         .word      LINK
                           000812  1605 LINK = . 
      008892 06                    1606         .byte      6
      008893 57 49 54 48 49 4E     1607         .ascii     "WITHIN"
      008899                       1608 WITHI:
      008899 CD 85 8D         [ 4] 1609         CALL     OVER
      00889C CD 87 D7         [ 4] 1610         CALL     SUBB
      00889F CD 85 2C         [ 4] 1611         CALL     TOR
      0088A2 CD 87 D7         [ 4] 1612         CALL     SUBB
      0088A5 CD 85 0D         [ 4] 1613         CALL     RFROM
      0088A8 CC 88 1E         [ 2] 1614         JP     ULESS
                                   1615 
                                   1616 ;; Divide
                                   1617 
                                   1618 ;       UM/MOD  ( udl udh un -- ur uq )
                                   1619 ;       Unsigned divide of a double by a
                                   1620 ;       single. Return mod and quotient.
      0088AB 88 92                 1621         .word      LINK
                           00082D  1622 LINK = . 
      0088AD 06                    1623         .byte      6
      0088AE 55 4D 2F 4D 4F 44     1624         .ascii     "UM/MOD"
      0088B4                       1625 UMMOD:
      0088B4 BF 22            [ 2] 1626 	LDW XTEMP,X	; save stack pointer
      0088B6 FE               [ 2] 1627 	LDW X,(X)	; un
      0088B7 BF 24            [ 2] 1628 	LDW YTEMP,X     ; save un
      0088B9 90 BE 22         [ 2] 1629 	LDW Y,XTEMP	; stack pointer
      0088BC 90 EE 04         [ 2] 1630 	LDW Y,(4,Y)     ; Y=udl
      0088BF BE 22            [ 2] 1631 	LDW X,XTEMP
      0088C1 EE 02            [ 2] 1632 	LDW X,(2,X)	; X=udh
      0088C3 B3 24            [ 2] 1633 	CPW X,YTEMP
      0088C5 23 0F            [ 2] 1634 	JRULE MMSM1
      0088C7 BE 22            [ 2] 1635 	LDW X,XTEMP
      0088C9 1C 00 02         [ 2] 1636 	ADDW X,#2	; pop off 1 level
      0088CC 90 AE FF FF      [ 2] 1637 	LDW Y,#0xFFFF
      0088D0 FF               [ 2] 1638 	LDW (X),Y
      0088D1 90 5F            [ 1] 1639 	CLRW Y
      0088D3 EF 02            [ 2] 1640 	LDW (2,X),Y
      0088D5 81               [ 4] 1641 	RET
      0088D6                       1642 MMSM1:
                                   1643 ; take advantage of divw x,y when udh==0
      0088D6 5D               [ 2] 1644         tnzw x  ; is udh==0?
      0088D7 26 11            [ 1] 1645         jrne MMSM2 
      0088D9 93               [ 1] 1646         ldw x,y    ;udl 
      0088DA 90 BE 24         [ 2] 1647         ldw y,YTEMP ; divisor 
      0088DD 65               [ 2] 1648         divw x,y 
      0088DE 89               [ 2] 1649         pushw x     ; quotient 
      0088DF BE 22            [ 2] 1650         ldw x,XTEMP 
      0088E1 1C 00 02         [ 2] 1651         addw x,#CELLL 
      0088E4 EF 02            [ 2] 1652         ldw (2,x),y  ; ur
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



      0088E6 90 85            [ 2] 1653         popw y 
      0088E8 FF               [ 2] 1654         ldw (x),y ; uq 
      0088E9 81               [ 4] 1655         ret 
      0088EA                       1656 MMSM2:        
      0088EA A6 11            [ 1] 1657 	LD A,#17	; loop count
      0088EC                       1658 MMSM3:
      0088EC B3 24            [ 2] 1659 	CPW X,YTEMP	; compare udh to un
      0088EE 25 04            [ 1] 1660 	JRULT MMSM4	; can't subtract
      0088F0 72 B0 00 24      [ 2] 1661 	SUBW X,YTEMP	; can subtract
      0088F4                       1662 MMSM4:
      0088F4 8C               [ 1] 1663 	CCF	; quotient bit
      0088F5 90 59            [ 2] 1664 	RLCW Y	; rotate into quotient
      0088F7 59               [ 2] 1665 	RLCW X	; rotate into remainder
      0088F8 4A               [ 1] 1666 	DEC A	; repeat
      0088F9 22 F1            [ 1] 1667 	JRUGT MMSM3
      0088FB 56               [ 2] 1668         RRCW X 
      0088FC BF 24            [ 2] 1669 	LDW YTEMP,X	; done, save remainder
      0088FE BE 22            [ 2] 1670 	LDW X,XTEMP
      008900 1C 00 02         [ 2] 1671 	ADDW X,#2	; drop
      008903 FF               [ 2] 1672 	LDW (X),Y
      008904 90 BE 24         [ 2] 1673 	LDW Y,YTEMP	; save quotient
      008907 EF 02            [ 2] 1674 	LDW (2,X),Y
      008909 81               [ 4] 1675 	RET
                                   1676 	
                                   1677 ;       M/MOD   ( d n -- r q )
                                   1678 ;       Signed floored divide of double by
                                   1679 ;       single. Return mod and quotient.
      00890A 88 AD                 1680         .word      LINK
                           00088C  1681 LINK = . 
      00890C 05                    1682         .byte      5
      00890D 4D 2F 4D 4F 44        1683         .ascii     "M/MOD"
      008912                       1684 MSMOD:  
      008912 CD 85 63         [ 4] 1685         CALL	DUPP
      008915 CD 85 9C         [ 4] 1686         CALL	ZLESS
      008918 CD 85 63         [ 4] 1687         CALL	DUPP
      00891B CD 85 2C         [ 4] 1688         CALL	TOR
      00891E CD 84 67         [ 4] 1689         CALL	QBRAN
      008921 89 2F                 1690         .word	MMOD1
      008923 CD 87 89         [ 4] 1691         CALL	NEGAT
      008926 CD 85 2C         [ 4] 1692         CALL	TOR
      008929 CD 87 9B         [ 4] 1693         CALL	DNEGA
      00892C CD 85 0D         [ 4] 1694         CALL	RFROM
      00892F CD 85 2C         [ 4] 1695 MMOD1:	CALL	TOR
      008932 CD 85 63         [ 4] 1696         CALL	DUPP
      008935 CD 85 9C         [ 4] 1697         CALL	ZLESS
      008938 CD 84 67         [ 4] 1698         CALL	QBRAN
      00893B 89 43                 1699         .word	MMOD2
      00893D CD 85 20         [ 4] 1700         CALL	RAT
      008940 CD 87 5E         [ 4] 1701         CALL	PLUS
      008943 CD 85 0D         [ 4] 1702 MMOD2:	CALL	RFROM
      008946 CD 88 B4         [ 4] 1703         CALL	UMMOD
      008949 CD 85 0D         [ 4] 1704         CALL	RFROM
      00894C CD 84 67         [ 4] 1705         CALL	QBRAN
      00894F 89 5A                 1706         .word	MMOD3
      008951 CD 85 73         [ 4] 1707         CALL	SWAPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



      008954 CD 87 89         [ 4] 1708         CALL	NEGAT
      008957 CD 85 73         [ 4] 1709         CALL	SWAPP
      00895A 81               [ 4] 1710 MMOD3:	RET
                                   1711 
                                   1712 ;       /MOD    ( n n -- r q )
                                   1713 ;       Signed divide. Return mod and quotient.
      00895B 89 0C                 1714         .word      LINK
                           0008DD  1715 LINK = . 
      00895D 04                    1716         .byte      4
      00895E 2F 4D 4F 44           1717         .ascii     "/MOD"
      008962                       1718 SLMOD:
      008962 CD 85 8D         [ 4] 1719         CALL	OVER
      008965 CD 85 9C         [ 4] 1720         CALL	ZLESS
      008968 CD 85 73         [ 4] 1721         CALL	SWAPP
      00896B CC 89 12         [ 2] 1722         JP	MSMOD
                                   1723 
                                   1724 ;       MOD     ( n n -- r )
                                   1725 ;       Signed divide. Return mod only.
      00896E 89 5D                 1726         .word      LINK
                           0008F0  1727 LINK = . 
      008970 03                    1728         .byte      3
      008971 4D 4F 44              1729         .ascii     "MOD"
      008974                       1730 MODD:
      008974 CD 89 62         [ 4] 1731 	CALL	SLMOD
      008977 CC 85 59         [ 2] 1732 	JP	DROP
                                   1733 
                                   1734 ;       /       ( n n -- q )
                                   1735 ;       Signed divide. Return quotient only.
      00897A 89 70                 1736         .word      LINK
                           0008FC  1737 LINK = . 
      00897C 01                    1738         .byte      1
      00897D 2F                    1739         .ascii     "/"
      00897E                       1740 SLASH:
      00897E CD 89 62         [ 4] 1741         CALL	SLMOD
      008981 CD 85 73         [ 4] 1742         CALL	SWAPP
      008984 CC 85 59         [ 2] 1743         JP	DROP
                                   1744 
                                   1745 ;; Multiply
                                   1746 
                                   1747 ;       UM*     ( u u -- ud )
                                   1748 ;       Unsigned multiply. Return double product.
      008987 89 7C                 1749         .word      LINK
                           000909  1750 LINK = . 
      008989 03                    1751         .byte      3
      00898A 55 4D 2A              1752         .ascii     "UM*"
      00898D                       1753 UMSTA:	; stack have 4 bytes u1=a,b u2=c,d
                                   1754 ; take advantage of SP addressing modes
                                   1755 ; these PRODx in RAM are not required
                                   1756 ; the product is kept on stack as local variable 
                                   1757         ;; bytes offset on data stack 
                           000002  1758         da=2 
                           000003  1759         db=3 
                           000000  1760         dc=0 
                           000001  1761         dd=1 
                                   1762         ;; product bytes offset on return stack 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



                           000001  1763         UD1=1  ; ud bits 31..24
                           000002  1764         UD2=2  ; ud bits 23..16
                           000003  1765         UD3=3  ; ud bits 15..8 
                           000004  1766         UD4=4  ; ud bits 7..0 
                                   1767         ;; local variable for product set to zero   
      00898D 90 5F            [ 1] 1768         clrw y 
      00898F 90 89            [ 2] 1769         pushw y  ; bits 15..0
      008991 90 89            [ 2] 1770         pushw y  ; bits 31..16 
      008993 E6 03            [ 1] 1771         ld a,(db,x) ; b 
      008995 90 97            [ 1] 1772         ld yl,a 
      008997 E6 01            [ 1] 1773         ld a,(dd,x)   ; d
      008999 90 42            [ 4] 1774         mul y,a    ; b*d  
      00899B 17 03            [ 2] 1775         ldw (UD3,sp),y ; lowest weight product 
      00899D E6 03            [ 1] 1776         ld a,(db,x)
      00899F 90 97            [ 1] 1777         ld yl,a 
      0089A1 E6 00            [ 1] 1778         ld a,(dc,x)
      0089A3 90 42            [ 4] 1779         mul y,a  ; b*c 
                                   1780         ;;; do the partial sum 
      0089A5 72 F9 02         [ 2] 1781         addw y,(UD2,sp)
      0089A8 4F               [ 1] 1782         clr a 
      0089A9 49               [ 1] 1783         rlc a
      0089AA 6B 01            [ 1] 1784         ld (UD1,sp),a 
      0089AC 17 02            [ 2] 1785         ldw (UD2,sp),y 
      0089AE E6 02            [ 1] 1786         ld a,(da,x)
      0089B0 90 97            [ 1] 1787         ld yl,a 
      0089B2 E6 01            [ 1] 1788         ld a,(dd,x)
      0089B4 90 42            [ 4] 1789         mul y,a   ; a*d 
                                   1790         ;; do partial sum 
      0089B6 72 F9 02         [ 2] 1791         addw y,(UD2,sp)
      0089B9 4F               [ 1] 1792         clr a 
      0089BA 19 01            [ 1] 1793         adc a,(UD1,sp)
      0089BC 6B 01            [ 1] 1794         ld (UD1,sp),a  
      0089BE 17 02            [ 2] 1795         ldw (UD2,sp),y 
      0089C0 E6 02            [ 1] 1796         ld a,(da,x)
      0089C2 90 97            [ 1] 1797         ld yl,a 
      0089C4 E6 00            [ 1] 1798         ld a,(dc,x)
      0089C6 90 42            [ 4] 1799         mul y,a  ;  a*c highest weight product 
                                   1800         ;;; do partial sum 
      0089C8 72 F9 01         [ 2] 1801         addw y,(UD1,sp)
      0089CB FF               [ 2] 1802         ldw (x),y  ; udh 
      0089CC 16 03            [ 2] 1803         ldw y,(UD3,sp)
      0089CE EF 02            [ 2] 1804         ldw (2,x),y  ; udl  
      0089D0 5B 04            [ 2] 1805         addw sp,#4 ; drop local variable 
      0089D2 81               [ 4] 1806         ret  
                                   1807 
                                   1808 
                                   1809 ;       *       ( n n -- n )
                                   1810 ;       Signed multiply. Return single product.
      0089D3 89 89                 1811         .word      LINK
                           000955  1812 LINK = . 
      0089D5 01                    1813         .byte      1
      0089D6 2A                    1814         .ascii     "*"
      0089D7                       1815 STAR:
      0089D7 CD 89 8D         [ 4] 1816 	CALL	UMSTA
      0089DA CC 85 59         [ 2] 1817 	JP	DROP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



                                   1818 
                                   1819 ;       M*      ( n n -- d )
                                   1820 ;       Signed multiply. Return double product.
      0089DD 89 D5                 1821         .word      LINK
                           00095F  1822 LINK = . 
      0089DF 02                    1823         .byte      2
      0089E0 4D 2A                 1824         .ascii     "M*"
      0089E2                       1825 MSTAR:      
      0089E2 CD 87 49         [ 4] 1826         CALL	DDUP
      0089E5 CD 85 D8         [ 4] 1827         CALL	XORR
      0089E8 CD 85 9C         [ 4] 1828         CALL	ZLESS
      0089EB CD 85 2C         [ 4] 1829         CALL	TOR
      0089EE CD 87 F1         [ 4] 1830         CALL	ABSS
      0089F1 CD 85 73         [ 4] 1831         CALL	SWAPP
      0089F4 CD 87 F1         [ 4] 1832         CALL	ABSS
      0089F7 CD 89 8D         [ 4] 1833         CALL	UMSTA
      0089FA CD 85 0D         [ 4] 1834         CALL	RFROM
      0089FD CD 84 67         [ 4] 1835         CALL	QBRAN
      008A00 8A 05                 1836         .word	MSTA1
      008A02 CD 87 9B         [ 4] 1837         CALL	DNEGA
      008A05 81               [ 4] 1838 MSTA1:	RET
                                   1839 
                                   1840 ;       */MOD   ( n1 n2 n3 -- r q )
                                   1841 ;       Multiply n1 and n2, then divide
                                   1842 ;       by n3. Return mod and quotient.
      008A06 89 DF                 1843         .word      LINK
                           000988  1844 LINK = . 
      008A08 05                    1845         .byte      5
      008A09 2A 2F 4D 4F 44        1846         .ascii     "*/MOD"
      008A0E                       1847 SSMOD:
      008A0E CD 85 2C         [ 4] 1848         CALL     TOR
      008A11 CD 89 E2         [ 4] 1849         CALL     MSTAR
      008A14 CD 85 0D         [ 4] 1850         CALL     RFROM
      008A17 CC 89 12         [ 2] 1851         JP     MSMOD
                                   1852 
                                   1853 ;       */      ( n1 n2 n3 -- q )
                                   1854 ;       Multiply n1 by n2, then divide
                                   1855 ;       by n3. Return quotient only.
      008A1A 8A 08                 1856         .word      LINK
                           00099C  1857 LINK = . 
      008A1C 02                    1858         .byte      2
      008A1D 2A 2F                 1859         .ascii     "*/"
      008A1F                       1860 STASL:
      008A1F CD 8A 0E         [ 4] 1861         CALL	SSMOD
      008A22 CD 85 73         [ 4] 1862         CALL	SWAPP
      008A25 CC 85 59         [ 2] 1863         JP	DROP
                                   1864 
                                   1865 ;; Miscellaneous
                                   1866 
                                   1867 ;       CELL+   ( a -- a )
                                   1868 ;       Add cell size in byte to address.
      008A28 8A 1C                 1869         .word      LINK
                           0009AA  1870 LINK = . 
      008A2A 02                    1871         .byte       2
      008A2B 32 2B                 1872         .ascii     "2+"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



      008A2D                       1873 CELLP:
      008A2D 90 93            [ 1] 1874         LDW Y,X
      008A2F 90 FE            [ 2] 1875 	LDW Y,(Y)
      008A31 72 A9 00 02      [ 2] 1876         ADDW Y,#CELLL 
      008A35 FF               [ 2] 1877         LDW (X),Y
      008A36 81               [ 4] 1878         RET
                                   1879 
                                   1880 ;       CELL-   ( a -- a )
                                   1881 ;       Subtract 2 from address.
      008A37 8A 2A                 1882         .word      LINK
                           0009B9  1883 LINK = . 
      008A39 02                    1884         .byte       2
      008A3A 32 2D                 1885         .ascii     "2-"
      008A3C                       1886 CELLM:
      008A3C 90 93            [ 1] 1887         LDW Y,X
      008A3E 90 FE            [ 2] 1888 	LDW Y,(Y)
      008A40 72 A2 00 02      [ 2] 1889         SUBW Y,#CELLL
      008A44 FF               [ 2] 1890         LDW (X),Y
      008A45 81               [ 4] 1891         RET
                                   1892 
                                   1893 ;       CELLS   ( n -- n )
                                   1894 ;       Multiply tos by 2.
      008A46 8A 39                 1895         .word      LINK
                           0009C8  1896 LINK = . 
      008A48 02                    1897         .byte       2
      008A49 32 2A                 1898         .ascii     "2*"
      008A4B                       1899 CELLS:
      008A4B 90 93            [ 1] 1900         LDW Y,X
      008A4D 90 FE            [ 2] 1901 	LDW Y,(Y)
      008A4F 90 58            [ 2] 1902         SLAW Y
      008A51 FF               [ 2] 1903         LDW (X),Y
      008A52 81               [ 4] 1904         RET
                                   1905 
                                   1906 ;       1+      ( a -- a )
                                   1907 ;       Add cell size in byte to address.
      008A53 8A 48                 1908         .word      LINK
                           0009D5  1909 LINK = . 
      008A55 02                    1910         .byte      2
      008A56 31 2B                 1911         .ascii     "1+"
      008A58                       1912 ONEP:
      008A58 90 93            [ 1] 1913         LDW Y,X
      008A5A 90 FE            [ 2] 1914 	LDW Y,(Y)
      008A5C 90 5C            [ 2] 1915         INCW Y
      008A5E FF               [ 2] 1916         LDW (X),Y
      008A5F 81               [ 4] 1917         RET
                                   1918 
                                   1919 ;       1-      ( a -- a )
                                   1920 ;       Subtract 2 from address.
      008A60 8A 55                 1921         .word      LINK
                           0009E2  1922 LINK = . 
      008A62 02                    1923         .byte      2
      008A63 31 2D                 1924         .ascii     "1-"
      008A65                       1925 ONEM:
      008A65 90 93            [ 1] 1926         LDW Y,X
      008A67 90 FE            [ 2] 1927 	LDW Y,(Y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



      008A69 90 5A            [ 2] 1928         DECW Y
      008A6B FF               [ 2] 1929         LDW (X),Y
      008A6C 81               [ 4] 1930         RET
                                   1931 
                                   1932 ;  shift left n times 
                                   1933 ; LSHIFT ( n1 n2 -- n1<<n2 )
      008A6D 8A 62                 1934         .word LINK 
                           0009EF  1935         LINK=.
      008A6F 06                    1936         .byte 6 
      008A70 4C 53 48 49 46 54     1937         .ascii "LSHIFT"
      008A76                       1938 LSHIFT:
      008A76 E6 01            [ 1] 1939         ld a,(1,x)
      008A78 1C 00 02         [ 2] 1940         addw x,#CELLL 
      008A7B 90 93            [ 1] 1941         ldw y,x 
      008A7D 90 FE            [ 2] 1942         ldw y,(y)
      008A7F                       1943 LSHIFT1:
      008A7F 4D               [ 1] 1944         tnz a 
      008A80 27 05            [ 1] 1945         jreq LSHIFT4 
      008A82 90 58            [ 2] 1946         sllw y 
      008A84 4A               [ 1] 1947         dec a 
      008A85 20 F8            [ 2] 1948         jra LSHIFT1 
      008A87                       1949 LSHIFT4:
      008A87 FF               [ 2] 1950         ldw (x),y 
      008A88 81               [ 4] 1951         ret 
                                   1952 
                                   1953 ; shift right n times                 
                                   1954 ; RSHIFT (n1 n2 -- n1>>n2 )
      008A89 8A 6F                 1955         .word LINK 
                           000A0B  1956         LINK=.
      008A8B 06                    1957         .byte 6
      008A8C 52 53 48 49 46 54     1958         .ascii "RSHIFT"
      008A92                       1959 RSHIFT:
      008A92 E6 01            [ 1] 1960         ld a,(1,x)
      008A94 1C 00 02         [ 2] 1961         addw x,#CELLL 
      008A97 90 93            [ 1] 1962         ldw y,x 
      008A99 90 FE            [ 2] 1963         ldw y,(y)
      008A9B                       1964 RSHIFT1:
      008A9B 4D               [ 1] 1965         tnz a 
      008A9C 27 05            [ 1] 1966         jreq RSHIFT4 
      008A9E 90 54            [ 2] 1967         srlw y 
      008AA0 4A               [ 1] 1968         dec a 
      008AA1 20 F8            [ 2] 1969         jra RSHIFT1 
      008AA3                       1970 RSHIFT4:
      008AA3 FF               [ 2] 1971         ldw (x),y 
      008AA4 81               [ 4] 1972         ret 
                                   1973 
                                   1974 
                                   1975 ;       2/      ( n -- n )
                                   1976 ;       divide  tos by 2.
      008AA5 8A 8B                 1977         .word      LINK
                           000A27  1978 LINK = . 
      008AA7 02                    1979         .byte      2
      008AA8 32 2F                 1980         .ascii     "2/"
      008AAA                       1981 TWOSL:
      008AAA 90 93            [ 1] 1982         LDW Y,X
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



      008AAC 90 FE            [ 2] 1983 	LDW Y,(Y)
      008AAE 90 57            [ 2] 1984         SRAW Y
      008AB0 FF               [ 2] 1985         LDW (X),Y
      008AB1 81               [ 4] 1986         RET
                                   1987 
                                   1988 ;       BL      ( -- 32 )
                                   1989 ;       Return 32,  blank character.
      008AB2 8A A7                 1990         .word      LINK
                           000A34  1991 LINK = . 
      008AB4 02                    1992         .byte      2
      008AB5 42 4C                 1993         .ascii     "BL"
      008AB7                       1994 BLANK:
      008AB7 1D 00 02         [ 2] 1995         SUBW X,#2
      008ABA 90 AE 00 20      [ 2] 1996 	LDW Y,#32
      008ABE FF               [ 2] 1997         LDW (X),Y
      008ABF 81               [ 4] 1998         RET
                                   1999 
                                   2000 ;         0     ( -- 0)
                                   2001 ;         Return 0.
      008AC0 8A B4                 2002         .word      LINK
                           000A42  2003 LINK = . 
      008AC2 01                    2004         .byte       1
      008AC3 30                    2005         .ascii     "0"
      008AC4                       2006 ZERO:
      008AC4 1D 00 02         [ 2] 2007         SUBW X,#2
      008AC7 90 5F            [ 1] 2008 	CLRW Y
      008AC9 FF               [ 2] 2009         LDW (X),Y
      008ACA 81               [ 4] 2010         RET
                                   2011 
                                   2012 ;         1     ( -- 1)
                                   2013 ;         Return 1.
      008ACB 8A C2                 2014         .word      LINK
                           000A4D  2015 LINK = . 
      008ACD 01                    2016         .byte       1
      008ACE 31                    2017         .ascii     "1"
      008ACF                       2018 ONE:
      008ACF 1D 00 02         [ 2] 2019         SUBW X,#2
      008AD2 90 AE 00 01      [ 2] 2020 	LDW Y,#1
      008AD6 FF               [ 2] 2021         LDW (X),Y
      008AD7 81               [ 4] 2022         RET
                                   2023 
                                   2024 ;         -1    ( -- -1)
                                   2025 ;         Return 32,  blank character.
      008AD8 8A CD                 2026         .word      LINK
                           000A5A  2027 LINK = . 
      008ADA 02                    2028         .byte       2
      008ADB 2D 31                 2029         .ascii     "-1"
      008ADD                       2030 MONE:
      008ADD 1D 00 02         [ 2] 2031         SUBW X,#2
      008AE0 90 AE FF FF      [ 2] 2032 	LDW Y,#0xFFFF
      008AE4 FF               [ 2] 2033         LDW (X),Y
      008AE5 81               [ 4] 2034         RET
                                   2035 
                                   2036 ;       >CHAR   ( c -- c )
                                   2037 ;       Filter non-printing characters.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



      008AE6 8A DA                 2038         .word      LINK
                           000A68  2039 LINK = . 
      008AE8 05                    2040         .byte      5
      008AE9 3E 43 48 41 52        2041         .ascii     ">CHAR"
      008AEE                       2042 TCHAR:
      008AEE E6 01            [ 1] 2043         ld a,(1,x)
      008AF0 A1 20            [ 1] 2044         cp a,#32  
      008AF2 2B 05            [ 1] 2045         jrmi 1$ 
      008AF4 A1 7F            [ 1] 2046         cp a,#127 
      008AF6 2A 01            [ 1] 2047         jrpl 1$ 
      008AF8 81               [ 4] 2048         ret 
      008AF9 A6 5F            [ 1] 2049 1$:     ld a,#'_ 
      008AFB E7 01            [ 1] 2050         ld (1,x),a 
      008AFD 81               [ 4] 2051         ret 
      008AFE 81               [ 4] 2052 TCHA1:  RET
                                   2053 
                                   2054 ;       DEPTH   ( -- n )
                                   2055 ;       Return  depth of  data stack.
      008AFF 8A E8                 2056         .word      LINK
                           000A81  2057 LINK = . 
      008B01 05                    2058         .byte      5
      008B02 44 45 50 54 48        2059         .ascii     "DEPTH"
      008B07                       2060 DEPTH: 
      008B07 90 BE 2A         [ 2] 2061         LDW Y,SP0    ;save data stack ptr
      008B0A BF 22            [ 2] 2062 	LDW XTEMP,X
      008B0C 72 B2 00 22      [ 2] 2063         SUBW Y,XTEMP     ;#bytes = SP0 - X
      008B10 90 57            [ 2] 2064         SRAW Y    ;Y = #stack items
      008B12 1D 00 02         [ 2] 2065 	SUBW X,#2
      008B15 FF               [ 2] 2066         LDW (X),Y     ; if neg, underflow
      008B16 81               [ 4] 2067         RET
                                   2068 
                                   2069 ;       PICK    ( ... +n -- ... w )
                                   2070 ;       Copy  nth stack item to tos.
      008B17 8B 01                 2071         .word      LINK
                           000A99  2072 LINK = . 
      008B19 04                    2073         .byte      4
      008B1A 50 49 43 4B           2074         .ascii     "PICK"
      008B1E                       2075 PICK:
      008B1E 90 93            [ 1] 2076         LDW Y,X   ;D = n1
      008B20 90 FE            [ 2] 2077         LDW Y,(Y)
                                   2078 ; modified for standard compliance          
                                   2079 ; 0 PICK must be equivalent to DUP 
      008B22 90 5C            [ 2] 2080         INCW Y 
      008B24 90 58            [ 2] 2081         SLAW Y
      008B26 BF 22            [ 2] 2082         LDW XTEMP,X
      008B28 72 B9 00 22      [ 2] 2083         ADDW Y,XTEMP
      008B2C 90 FE            [ 2] 2084         LDW Y,(Y)
      008B2E FF               [ 2] 2085         LDW (X),Y
      008B2F 81               [ 4] 2086         RET
                                   2087 
                                   2088 ;; Memory access
                                   2089 
                                   2090 ;       +!      ( n a -- )
                                   2091 ;       Add n to  contents at address a.
      008B30 8B 19                 2092         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



                           000AB2  2093 LINK = . 
      008B32 02                    2094         .byte      2
      008B33 2B 21                 2095         .ascii     "+!"
      008B35                       2096 PSTOR:
      008B35 90 93            [ 1] 2097         ldw y,x 
      008B37 90 FE            [ 2] 2098         ldw y,(y)
      008B39 90 BF 24         [ 2] 2099         ldw YTEMP,y  ; address
      008B3C 90 FE            [ 2] 2100         ldw y,(y)  
      008B3E 90 89            [ 2] 2101         pushw y  ; value at address 
      008B40 90 93            [ 1] 2102         ldw y,x 
      008B42 90 EE 02         [ 2] 2103         ldw y,(2,y) ; n 
      008B45 72 F9 01         [ 2] 2104         addw y,(1,sp) ; n+value
      008B48 91 CF 24         [ 5] 2105         ldw [YTEMP],y ;  a!
      008B4B 90 85            [ 2] 2106         popw y    ;drop local var
      008B4D 1C 00 04         [ 2] 2107         addw x,#4 ; DDROP 
      008B50 81               [ 4] 2108         ret 
                                   2109 
                                   2110 ;       2!      ( d a -- )
                                   2111 ;       Store  double integer to address a.
      008B51 8B 32                 2112         .word      LINK
                           000AD3  2113 LINK = . 
      008B53 02                    2114         .byte      2
      008B54 32 21                 2115         .ascii     "2!"
      008B56                       2116 DSTOR:
      008B56 90 93            [ 1] 2117         ldw y,x 
      008B58 90 FE            [ 2] 2118         ldw y,(y)
      008B5A 90 BF 24         [ 2] 2119         ldw YTEMP,y ; address 
      008B5D 1C 00 02         [ 2] 2120         addw x,#CELLL ; drop a 
      008B60 90 93            [ 1] 2121         ldw y,x 
      008B62 90 FE            [ 2] 2122         ldw y,(y) ; hi word 
      008B64 89               [ 2] 2123         pushw x 
      008B65 EE 02            [ 2] 2124         ldw x,(2,x) ; lo word 
      008B67 91 CF 24         [ 5] 2125         ldw [YTEMP],y
      008B6A 90 93            [ 1] 2126         ldw y,x 
      008B6C AE 00 02         [ 2] 2127         ldw x,#2 
      008B6F 92 DF 24         [ 5] 2128         ldw ([YTEMP],x),y 
      008B72 85               [ 2] 2129         popw x 
      008B73 1C 00 04         [ 2] 2130         addw x,#4 ; DDROP 
      008B76 81               [ 4] 2131         ret 
                                   2132 
                                   2133 ;       2@      ( a -- d )
                                   2134 ;       Fetch double integer from address a.
      008B77 8B 53                 2135         .word      LINK
                           000AF9  2136 LINK = . 
      008B79 02                    2137         .byte      2
      008B7A 32 40                 2138         .ascii     "2@"
      008B7C                       2139 DAT:
      008B7C 90 93            [ 1] 2140         ldw y,x 
      008B7E 90 FE            [ 2] 2141         ldw y,(y) ;address 
      008B80 90 BF 24         [ 2] 2142         ldw YTEMP,y 
      008B83 1D 00 02         [ 2] 2143         subw x,#CELLL ; space for udh 
      008B86 91 CE 24         [ 5] 2144         ldw y,[YTEMP] ; udh 
      008B89 FF               [ 2] 2145         ldw (x),y 
      008B8A 90 AE 00 02      [ 2] 2146         ldw y,#2
      008B8E 91 DE 24         [ 5] 2147         ldw y,([YTEMP],y) ; udl 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



      008B91 EF 02            [ 2] 2148         ldw (2,x),y
      008B93 81               [ 4] 2149         ret 
                                   2150 
                                   2151 ;       COUNT   ( b -- b +n )
                                   2152 ;       Return count byte of a string
                                   2153 ;       and add 1 to byte address.
      008B94 8B 79                 2154         .word      LINK
                           000B16  2155 LINK = . 
      008B96 05                    2156         .byte      5
      008B97 43 4F 55 4E 54        2157         .ascii     "COUNT"
      008B9C                       2158 COUNT:
      008B9C 90 93            [ 1] 2159         ldw y,x 
      008B9E 90 FE            [ 2] 2160         ldw y,(y) ; address 
      008BA0 90 F6            [ 1] 2161         ld a,(y)  ; count 
      008BA2 90 5C            [ 2] 2162         incw y 
      008BA4 FF               [ 2] 2163         ldw (x),y 
      008BA5 1D 00 02         [ 2] 2164         subw x,#CELLL 
      008BA8 E7 01            [ 1] 2165         ld (1,x),a 
      008BAA 7F               [ 1] 2166         clr (x)
      008BAB 81               [ 4] 2167         ret 
                                   2168 
                                   2169 ;       HERE    ( -- a )
                                   2170 ;       Return  top of  variables
      008BAC 8B 96                 2171         .word      LINK
                           000B2E  2172 LINK = . 
      008BAE 04                    2173         .byte      4
      008BAF 48 45 52 45           2174         .ascii     "HERE"
      008BB3                       2175 HERE:
      008BB3 90 AE 00 16      [ 2] 2176       	ldw y,#UVP 
      008BB7 90 FE            [ 2] 2177         ldw y,(y)
      008BB9 1D 00 02         [ 2] 2178         subw x,#CELLL 
      008BBC FF               [ 2] 2179         ldw (x),y 
      008BBD 81               [ 4] 2180         ret 
                                   2181 
                                   2182 ;       PAD     ( -- a )
                                   2183 ;       Return address of text buffer
                                   2184 ;       above  code dictionary.
      008BBE 8B AE                 2185         .word      LINK
                           000B40  2186 LINK = . 
      008BC0 03                    2187         .byte      3
      008BC1 50 41 44              2188         .ascii     "PAD"
      008BC4                       2189 PAD:
      008BC4 CD 8B B3         [ 4] 2190         CALL     HERE
      008BC7 CD 84 34         [ 4] 2191         CALL     DOLIT
      008BCA 00 50                 2192         .word      80
      008BCC CC 87 5E         [ 2] 2193         JP     PLUS
                                   2194 
                                   2195 ;       TIB     ( -- a )
                                   2196 ;       Return address of terminal input buffer.
      008BCF 8B C0                 2197         .word      LINK
                           000B51  2198 LINK = . 
      008BD1 03                    2199         .byte      3
      008BD2 54 49 42              2200         .ascii     "TIB"
      008BD5                       2201 TIB:
      008BD5 CD 86 4E         [ 4] 2202         CALL     NTIB
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



      008BD8 CD 8A 2D         [ 4] 2203         CALL     CELLP
      008BDB CC 84 BC         [ 2] 2204         JP     AT
                                   2205 
                                   2206 ;       @EXECUTE        ( a -- )
                                   2207 ;       Execute vector stored in address a.
      008BDE 8B D1                 2208         .word      LINK
                           000B60  2209 LINK = . 
      008BE0 08                    2210         .byte      8
      008BE1 40 45 58 45 43 55 54  2211         .ascii     "@EXECUTE"
             45
      008BE9                       2212 ATEXE:
      008BE9 CD 84 BC         [ 4] 2213         CALL     AT
      008BEC CD 87 0D         [ 4] 2214         CALL     QDUP    ;?address or zero
      008BEF CD 84 67         [ 4] 2215         CALL     QBRAN
      008BF2 8B F7                 2216         .word      EXE1
      008BF4 CD 84 8E         [ 4] 2217         CALL     EXECU   ;execute if non-zero
      008BF7 81               [ 4] 2218 EXE1:   RET     ;do nothing if zero
                                   2219 
                                   2220 ;       CMOVE   ( b1 b2 u -- )
                                   2221 ;       Copy u bytes from b1 to b2.
      008BF8 8B E0                 2222         .word      LINK
                           000B7A  2223 LINK = . 
      008BFA 05                    2224         .byte      5
      008BFB 43 4D 4F 56 45        2225         .ascii     "CMOVE"
      008C00                       2226 CMOVE:
      008C00 CD 85 2C         [ 4] 2227         CALL	TOR
      008C03 CD 84 7E         [ 4] 2228         CALL	BRAN
      008C06 8C 20                 2229         .word	CMOV2
      008C08 CD 85 2C         [ 4] 2230 CMOV1:	CALL	TOR
      008C0B CD 85 63         [ 4] 2231         CALL	DUPP
      008C0E CD 84 DA         [ 4] 2232         CALL	CAT
      008C11 CD 85 20         [ 4] 2233         CALL	RAT
      008C14 CD 84 C9         [ 4] 2234         CALL	CSTOR
      008C17 CD 8A 58         [ 4] 2235         CALL	ONEP
      008C1A CD 85 0D         [ 4] 2236         CALL	RFROM
      008C1D CD 8A 58         [ 4] 2237         CALL	ONEP
      008C20 CD 84 48         [ 4] 2238 CMOV2:	CALL	DONXT
      008C23 8C 08                 2239         .word	CMOV1
      008C25 CC 87 3E         [ 2] 2240         JP	DDROP
                                   2241 
                                   2242 ;       FILL    ( b u c -- )
                                   2243 ;       Fill u bytes of character c
                                   2244 ;       to area beginning at b.
      008C28 8B FA                 2245         .word       LINK
                           000BAA  2246 LINK = . 
      008C2A 04                    2247         .byte       4
      008C2B 46 49 4C 4C           2248         .ascii     "FILL"
      008C2F                       2249 FILL:
      008C2F 90 93            [ 1] 2250         ldw y,x 
      008C31 90 E6 01         [ 1] 2251         ld a,(1,y) ; c 
      008C34 1C 00 02         [ 2] 2252         addw x,#CELLL ; drop c 
      008C37 90 93            [ 1] 2253         ldw y,x 
      008C39 90 FE            [ 2] 2254         ldw y,(y) ; count
      008C3B 90 89            [ 2] 2255         pushw y 
      008C3D 1C 00 02         [ 2] 2256         addw x,#CELLL ; drop u 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



      008C40 90 93            [ 1] 2257         ldw y,x 
      008C42 1C 00 02         [ 2] 2258         addw x,#CELLL ; drop b 
      008C45 90 FE            [ 2] 2259         ldw y,(y) ; address
      008C47 90 BF 24         [ 2] 2260         ldw YTEMP,y
      008C4A 90 85            [ 2] 2261         popw y ; count 
      008C4C                       2262 FILL1:  
      008C4C 92 C7 24         [ 4] 2263         ld [YTEMP],a 
      008C4F 3C 25            [ 1] 2264         inc YTEMP+1
      008C51 24 02            [ 1] 2265         jrnc FILL2 
      008C53 3C 24            [ 1] 2266         inc YTEMP
      008C55                       2267 FILL2: 
      008C55 90 5A            [ 2] 2268         decw y ; count 
      008C57 26 F3            [ 1] 2269         jrne FILL1  
      008C59 81               [ 4] 2270         ret 
                                   2271 
                                   2272 ;       ERASE   ( b u -- )
                                   2273 ;       Erase u bytes beginning at b.
      008C5A 8C 2A                 2274         .word      LINK
                           000BDC  2275 LINK = . 
      008C5C 05                    2276         .byte      5
      008C5D 45 52 41 53 45        2277         .ascii     "ERASE"
      008C62                       2278 ERASE:
      008C62 90 5F            [ 1] 2279         clrw y 
      008C64 1D 00 02         [ 2] 2280         subw x,#CELLL 
      008C67 FF               [ 2] 2281         ldw (x),y 
      008C68 CC 8C 2F         [ 2] 2282         jp FILL 
                                   2283 
                                   2284 
                                   2285 ;       PACK0x   ( b u a -- a )
                                   2286 ;       Build a counted string with
                                   2287 ;       u characters from b. Null fill.
      008C6B 8C 5C                 2288         .word      LINK
                           000BED  2289 LINK = . 
      008C6D 05                    2290         .byte      5
      008C6E 50 41 43 4B 30 58     2291         .ascii     "PACK0X"
      008C74                       2292 PACKS:
      008C74 CD 85 63         [ 4] 2293         CALL     DUPP
      008C77 CD 85 2C         [ 4] 2294         CALL     TOR     ;strings only on cell boundary
      008C7A CD 87 49         [ 4] 2295         CALL     DDUP
      008C7D CD 84 C9         [ 4] 2296         CALL     CSTOR
      008C80 CD 8A 58         [ 4] 2297         CALL     ONEP ;save count
      008C83 CD 85 73         [ 4] 2298         CALL     SWAPP
      008C86 CD 8C 00         [ 4] 2299         CALL     CMOVE
      008C89 CD 85 0D         [ 4] 2300         CALL     RFROM
      008C8C 81               [ 4] 2301         RET
                                   2302 
                                   2303 ;; Numeric output, single precision
                                   2304 
                                   2305 ;       DIGIT   ( u -- c )
                                   2306 ;       Convert digit u to a character.
      008C8D 8C 6D                 2307         .word      LINK
                           000C0F  2308 LINK = . 
      008C8F 05                    2309         .byte      5
      008C90 44 49 47 49 54        2310         .ascii     "DIGIT"
      008C95                       2311 DIGIT:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



      008C95 CD 84 34         [ 4] 2312         CALL	DOLIT
      008C98 00 09                 2313         .word	9
      008C9A CD 85 8D         [ 4] 2314         CALL	OVER
      008C9D CD 88 3C         [ 4] 2315         CALL	LESS
      008CA0 CD 84 34         [ 4] 2316         CALL	DOLIT
      008CA3 00 07                 2317         .word	7
      008CA5 CD 85 AF         [ 4] 2318         CALL	ANDD
      008CA8 CD 87 5E         [ 4] 2319         CALL	PLUS
      008CAB CD 84 34         [ 4] 2320         CALL	DOLIT
      008CAE 00 30                 2321         .word	48	;'0'
      008CB0 CC 87 5E         [ 2] 2322         JP	PLUS
                                   2323 
                                   2324 ;       EXTRACT ( n base -- n c )
                                   2325 ;       Extract least significant digit from n.
      008CB3 8C 8F                 2326         .word      LINK
                           000C35  2327 LINK = . 
      008CB5 07                    2328         .byte      7
      008CB6 45 58 54 52 41 43 54  2329         .ascii     "EXTRACT"
      008CBD                       2330 EXTRC:
      008CBD CD 8A C4         [ 4] 2331         CALL     ZERO
      008CC0 CD 85 73         [ 4] 2332         CALL     SWAPP
      008CC3 CD 88 B4         [ 4] 2333         CALL     UMMOD
      008CC6 CD 85 73         [ 4] 2334         CALL     SWAPP
      008CC9 CC 8C 95         [ 2] 2335         JP     DIGIT
                                   2336 
                                   2337 ;       <#      ( -- )
                                   2338 ;       Initiate  numeric output process.
      008CCC 8C B5                 2339         .word      LINK
                           000C4E  2340 LINK = . 
      008CCE 02                    2341         .byte      2
      008CCF 3C 23                 2342         .ascii     "<#"
      008CD1                       2343 BDIGS:
      008CD1 CD 8B C4         [ 4] 2344         CALL     PAD
      008CD4 CD 86 90         [ 4] 2345         CALL     HLD
      008CD7 CC 84 A5         [ 2] 2346         JP     STORE
                                   2347 
                                   2348 ;       HOLD    ( c -- )
                                   2349 ;       Insert a character into output string.
      008CDA 8C CE                 2350         .word      LINK
                           000C5C  2351 LINK = . 
      008CDC 04                    2352         .byte      4
      008CDD 48 4F 4C 44           2353         .ascii     "HOLD"
      008CE1                       2354 HOLD:
      008CE1 CD 86 90         [ 4] 2355         CALL     HLD
      008CE4 CD 84 BC         [ 4] 2356         CALL     AT
      008CE7 CD 8A 65         [ 4] 2357         CALL     ONEM
      008CEA CD 85 63         [ 4] 2358         CALL     DUPP
      008CED CD 86 90         [ 4] 2359         CALL     HLD
      008CF0 CD 84 A5         [ 4] 2360         CALL     STORE
      008CF3 CC 84 C9         [ 2] 2361         JP     CSTOR
                                   2362 
                                   2363 ;       #       ( u -- u )
                                   2364 ;       Extract one digit from u and
                                   2365 ;       append digit to output string.
      008CF6 8C DC                 2366         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



                           000C78  2367 LINK = . 
      008CF8 01                    2368         .byte      1
      008CF9 23                    2369         .ascii     "#"
      008CFA                       2370 DIG:
      008CFA CD 86 20         [ 4] 2371         CALL     BASE
      008CFD CD 84 BC         [ 4] 2372         CALL     AT
      008D00 CD 8C BD         [ 4] 2373         CALL     EXTRC
      008D03 CC 8C E1         [ 2] 2374         JP     HOLD
                                   2375 
                                   2376 ;       #S      ( u -- 0 )
                                   2377 ;       Convert u until all digits
                                   2378 ;       are added to output string.
      008D06 8C F8                 2379         .word      LINK
                           000C88  2380 LINK = . 
      008D08 02                    2381         .byte      2
      008D09 23 53                 2382         .ascii     "#S"
      008D0B                       2383 DIGS:
      008D0B CD 8C FA         [ 4] 2384 DIGS1:  CALL     DIG
      008D0E CD 85 63         [ 4] 2385         CALL     DUPP
      008D11 CD 84 67         [ 4] 2386         CALL     QBRAN
      008D14 8D 18                 2387         .word      DIGS2
      008D16 20 F3            [ 2] 2388         JRA     DIGS1
      008D18 81               [ 4] 2389 DIGS2:  RET
                                   2390 
                                   2391 ;       SIGN    ( n -- )
                                   2392 ;       Add a minus sign to
                                   2393 ;       numeric output string.
      008D19 8D 08                 2394         .word      LINK
                           000C9B  2395 LINK = . 
      008D1B 04                    2396         .byte      4
      008D1C 53 49 47 4E           2397         .ascii     "SIGN"
      008D20                       2398 SIGN:
      008D20 CD 85 9C         [ 4] 2399         CALL     ZLESS
      008D23 CD 84 67         [ 4] 2400         CALL     QBRAN
      008D26 8D 30                 2401         .word      SIGN1
      008D28 CD 84 34         [ 4] 2402         CALL     DOLIT
      008D2B 00 2D                 2403         .word      45	;"-"
      008D2D CC 8C E1         [ 2] 2404         JP     HOLD
      008D30 81               [ 4] 2405 SIGN1:  RET
                                   2406 
                                   2407 ;       #>      ( w -- b u )
                                   2408 ;       Prepare output string.
      008D31 8D 1B                 2409         .word      LINK
                           000CB3  2410 LINK = . 
      008D33 02                    2411         .byte      2
      008D34 23 3E                 2412         .ascii     "#>"
      008D36                       2413 EDIGS:
      008D36 CD 85 59         [ 4] 2414         CALL     DROP
      008D39 CD 86 90         [ 4] 2415         CALL     HLD
      008D3C CD 84 BC         [ 4] 2416         CALL     AT
      008D3F CD 8B C4         [ 4] 2417         CALL     PAD
      008D42 CD 85 8D         [ 4] 2418         CALL     OVER
      008D45 CC 87 D7         [ 2] 2419         JP     SUBB
                                   2420 
                                   2421 ;       str     ( w -- b u )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



                                   2422 ;       Convert a signed integer
                                   2423 ;       to a numeric string.
      008D48 8D 33                 2424         .word      LINK
                           000CCA  2425 LINK = . 
      008D4A 03                    2426         .byte      3
      008D4B 53 54 52              2427         .ascii     "STR"
      008D4E                       2428 STR:
      008D4E CD 85 63         [ 4] 2429         CALL     DUPP
      008D51 CD 85 2C         [ 4] 2430         CALL     TOR
      008D54 CD 87 F1         [ 4] 2431         CALL     ABSS
      008D57 CD 8C D1         [ 4] 2432         CALL     BDIGS
      008D5A CD 8D 0B         [ 4] 2433         CALL     DIGS
      008D5D CD 85 0D         [ 4] 2434         CALL     RFROM
      008D60 CD 8D 20         [ 4] 2435         CALL     SIGN
      008D63 CC 8D 36         [ 2] 2436         JP     EDIGS
                                   2437 
                                   2438 ;       HEX     ( -- )
                                   2439 ;       Use radix 16 as base for
                                   2440 ;       numeric conversions.
      008D66 8D 4A                 2441         .word      LINK
                           000CE8  2442 LINK = . 
      008D68 03                    2443         .byte      3
      008D69 48 45 58              2444         .ascii     "HEX"
      008D6C                       2445 HEX:
      008D6C CD 84 34         [ 4] 2446         CALL     DOLIT
      008D6F 00 10                 2447         .word      16
      008D71 CD 86 20         [ 4] 2448         CALL     BASE
      008D74 CC 84 A5         [ 2] 2449         JP     STORE
                                   2450 
                                   2451 ;       DECIMAL ( -- )
                                   2452 ;       Use radix 10 as base
                                   2453 ;       for numeric conversions.
      008D77 8D 68                 2454         .word      LINK
                           000CF9  2455 LINK = . 
      008D79 07                    2456         .byte      7
      008D7A 44 45 43 49 4D 41 4C  2457         .ascii     "DECIMAL"
      008D81                       2458 DECIM:
      008D81 CD 84 34         [ 4] 2459         CALL     DOLIT
      008D84 00 0A                 2460         .word      10
      008D86 CD 86 20         [ 4] 2461         CALL     BASE
      008D89 CC 84 A5         [ 2] 2462         JP     STORE
                                   2463 
                                   2464 ;; Numeric input, single precision
                                   2465 
                                   2466 ;       DIGIT?  ( c base -- u t )
                                   2467 ;       Convert a character to its numeric
                                   2468 ;       value. A flag indicates success.
      008D8C 8D 79                 2469         .word      LINK
                           000D0E  2470 LINK = . 
      008D8E 06                    2471         .byte       6
      008D8F 44 49 47 49 54 3F     2472         .ascii     "DIGIT?"
      008D95                       2473 DIGTQ:
      008D95 CD 85 2C         [ 4] 2474         CALL     TOR
      008D98 CD 84 34         [ 4] 2475         CALL     DOLIT
      008D9B 00 30                 2476         .word     48	; "0"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      008D9D CD 87 D7         [ 4] 2477         CALL     SUBB
      008DA0 CD 84 34         [ 4] 2478         CALL     DOLIT
      008DA3 00 09                 2479         .word      9
      008DA5 CD 85 8D         [ 4] 2480         CALL     OVER
      008DA8 CD 88 3C         [ 4] 2481         CALL     LESS
      008DAB CD 84 67         [ 4] 2482         CALL     QBRAN
      008DAE 8D C6                 2483         .word      DGTQ1
      008DB0 CD 84 34         [ 4] 2484         CALL     DOLIT
      008DB3 00 07                 2485         .word      7
      008DB5 CD 87 D7         [ 4] 2486         CALL     SUBB
      008DB8 CD 85 63         [ 4] 2487         CALL     DUPP
      008DBB CD 84 34         [ 4] 2488         CALL     DOLIT
      008DBE 00 0A                 2489         .word      10
      008DC0 CD 88 3C         [ 4] 2490         CALL     LESS
      008DC3 CD 85 C3         [ 4] 2491         CALL     ORR
      008DC6 CD 85 63         [ 4] 2492 DGTQ1:  CALL     DUPP
      008DC9 CD 85 0D         [ 4] 2493         CALL     RFROM
      008DCC CC 88 1E         [ 2] 2494         JP     ULESS
                                   2495 
                                   2496 ;       NUMBER? ( a -- n T | a F )
                                   2497 ;       Convert a number string to
                                   2498 ;       integer. Push a flag on tos.
      008DCF 8D 8E                 2499         .word      LINK
                           000D51  2500 LINK = . 
      008DD1 07                    2501         .byte      7
      008DD2 4E 55 4D 42 45 52 3F  2502         .ascii     "NUMBER?"
      008DD9                       2503 NUMBQ:
      008DD9 CD 86 20         [ 4] 2504         CALL     BASE
      008DDC CD 84 BC         [ 4] 2505         CALL     AT
      008DDF CD 85 2C         [ 4] 2506         CALL     TOR
      008DE2 CD 8A C4         [ 4] 2507         CALL     ZERO
      008DE5 CD 85 8D         [ 4] 2508         CALL     OVER
      008DE8 CD 8B 9C         [ 4] 2509         CALL     COUNT
      008DEB CD 85 8D         [ 4] 2510         CALL     OVER
      008DEE CD 84 DA         [ 4] 2511         CALL     CAT
      008DF1 CD 84 34         [ 4] 2512         CALL     DOLIT
      008DF4 00 24                 2513         .word     36	; "0x"
      008DF6 CD 87 FF         [ 4] 2514         CALL     EQUAL
      008DF9 CD 84 67         [ 4] 2515         CALL     QBRAN
      008DFC 8E 0D                 2516         .word      NUMQ1
      008DFE CD 8D 6C         [ 4] 2517         CALL     HEX
      008E01 CD 85 73         [ 4] 2518         CALL     SWAPP
      008E04 CD 8A 58         [ 4] 2519         CALL     ONEP
      008E07 CD 85 73         [ 4] 2520         CALL     SWAPP
      008E0A CD 8A 65         [ 4] 2521         CALL     ONEM
      008E0D CD 85 8D         [ 4] 2522 NUMQ1:  CALL     OVER
      008E10 CD 84 DA         [ 4] 2523         CALL     CAT
      008E13 CD 84 34         [ 4] 2524         CALL     DOLIT
      008E16 00 2D                 2525         .word     45	; "-"
      008E18 CD 87 FF         [ 4] 2526         CALL     EQUAL
      008E1B CD 85 2C         [ 4] 2527         CALL     TOR
      008E1E CD 85 73         [ 4] 2528         CALL     SWAPP
      008E21 CD 85 20         [ 4] 2529         CALL     RAT
      008E24 CD 87 D7         [ 4] 2530         CALL     SUBB
      008E27 CD 85 73         [ 4] 2531         CALL     SWAPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



      008E2A CD 85 20         [ 4] 2532         CALL     RAT
      008E2D CD 87 5E         [ 4] 2533         CALL     PLUS
      008E30 CD 87 0D         [ 4] 2534         CALL     QDUP
      008E33 CD 84 67         [ 4] 2535         CALL     QBRAN
      008E36 8E 97                 2536         .word      NUMQ6
      008E38 CD 8A 65         [ 4] 2537         CALL     ONEM
      008E3B CD 85 2C         [ 4] 2538         CALL     TOR
      008E3E CD 85 63         [ 4] 2539 NUMQ2:  CALL     DUPP
      008E41 CD 85 2C         [ 4] 2540         CALL     TOR
      008E44 CD 84 DA         [ 4] 2541         CALL     CAT
      008E47 CD 86 20         [ 4] 2542         CALL     BASE
      008E4A CD 84 BC         [ 4] 2543         CALL     AT
      008E4D CD 8D 95         [ 4] 2544         CALL     DIGTQ
      008E50 CD 84 67         [ 4] 2545         CALL     QBRAN
      008E53 8E 85                 2546         .word      NUMQ4
      008E55 CD 85 73         [ 4] 2547         CALL     SWAPP
      008E58 CD 86 20         [ 4] 2548         CALL     BASE
      008E5B CD 84 BC         [ 4] 2549         CALL     AT
      008E5E CD 89 D7         [ 4] 2550         CALL     STAR
      008E61 CD 87 5E         [ 4] 2551         CALL     PLUS
      008E64 CD 85 0D         [ 4] 2552         CALL     RFROM
      008E67 CD 8A 58         [ 4] 2553         CALL     ONEP
      008E6A CD 84 48         [ 4] 2554         CALL     DONXT
      008E6D 8E 3E                 2555         .word      NUMQ2
      008E6F CD 85 20         [ 4] 2556         CALL     RAT
      008E72 CD 85 73         [ 4] 2557         CALL     SWAPP
      008E75 CD 85 59         [ 4] 2558         CALL     DROP
      008E78 CD 84 67         [ 4] 2559         CALL     QBRAN
      008E7B 8E 80                 2560         .word      NUMQ3
      008E7D CD 87 89         [ 4] 2561         CALL     NEGAT
      008E80 CD 85 73         [ 4] 2562 NUMQ3:  CALL     SWAPP
      008E83 20 0F            [ 2] 2563         JRA     NUMQ5
      008E85 CD 85 0D         [ 4] 2564 NUMQ4:  CALL     RFROM
      008E88 CD 85 0D         [ 4] 2565         CALL     RFROM
      008E8B CD 87 3E         [ 4] 2566         CALL     DDROP
      008E8E CD 87 3E         [ 4] 2567         CALL     DDROP
      008E91 CD 8A C4         [ 4] 2568         CALL     ZERO
      008E94 CD 85 63         [ 4] 2569 NUMQ5:  CALL     DUPP
      008E97 CD 85 0D         [ 4] 2570 NUMQ6:  CALL     RFROM
      008E9A CD 87 3E         [ 4] 2571         CALL     DDROP
      008E9D CD 85 0D         [ 4] 2572         CALL     RFROM
      008EA0 CD 86 20         [ 4] 2573         CALL     BASE
      008EA3 CC 84 A5         [ 2] 2574         JP     STORE
                                   2575 
                                   2576 ;; Basic I/O
                                   2577 
                                   2578 ;       KEY     ( -- c )
                                   2579 ;       Wait for and return an
                                   2580 ;       input character.
      008EA6 8D D1                 2581         .word      LINK
                           000E28  2582 LINK = . 
      008EA8 03                    2583         .byte      3
      008EA9 4B 45 59              2584         .ascii     "KEY"
      008EAC                       2585 KEY:
      008EAC 72 0B 52 30 FB   [ 2] 2586         btjf UART1_SR,#UART_SR_RXNE,. 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      008EB1 C6 52 31         [ 1] 2587         ld a,UART1_DR 
      008EB4 1D 00 02         [ 2] 2588         subw x,#CELLL 
      008EB7 E7 01            [ 1] 2589         ld (1,x),a 
      008EB9 7F               [ 1] 2590         clr (x)
      008EBA 81               [ 4] 2591         ret 
                                   2592 
                                   2593 ;       NUF?    ( -- t )
                                   2594 ;       Return false if no input,
                                   2595 ;       else pause and if CR return true.
      008EBB 8E A8                 2596         .word      LINK
                           000E3D  2597 LINK = . 
      008EBD 04                    2598         .byte      4
      008EBE 4E 55 46 3F           2599         .ascii     "NUF?"
      008EC2                       2600 NUFQ:
      008EC2 CD 84 00         [ 4] 2601         CALL     QKEY
      008EC5 CD 85 63         [ 4] 2602         CALL     DUPP
      008EC8 CD 84 67         [ 4] 2603         CALL     QBRAN
      008ECB 8E DB                 2604         .word    NUFQ1
      008ECD CD 87 3E         [ 4] 2605         CALL     DDROP
      008ED0 CD 8E AC         [ 4] 2606         CALL     KEY
      008ED3 CD 84 34         [ 4] 2607         CALL     DOLIT
      008ED6 00 0D                 2608         .word      CRR
      008ED8 CC 87 FF         [ 2] 2609         JP     EQUAL
      008EDB 81               [ 4] 2610 NUFQ1:  RET
                                   2611 
                                   2612 ;       SPACE   ( -- )
                                   2613 ;       Send  blank character to
                                   2614 ;       output device.
      008EDC 8E BD                 2615         .word      LINK
                           000E5E  2616 LINK = . 
      008EDE 05                    2617         .byte      5
      008EDF 53 50 41 43 45        2618         .ascii     "SPACE"
      008EE4                       2619 SPACE:
      008EE4 CD 8A B7         [ 4] 2620         CALL     BLANK
      008EE7 CC 84 1E         [ 2] 2621         JP     EMIT
                                   2622 
                                   2623 ;       SPACES  ( +n -- )
                                   2624 ;       Send n spaces to output device.
      008EEA 8E DE                 2625         .word      LINK
                           000E6C  2626 LINK = . 
      008EEC 06                    2627         .byte      6
      008EED 53 50 41 43 45 53     2628         .ascii     "SPACES"
      008EF3                       2629 SPACS:
      008EF3 CD 8A C4         [ 4] 2630         CALL     ZERO
      008EF6 CD 88 5C         [ 4] 2631         CALL     MAX
      008EF9 CD 85 2C         [ 4] 2632         CALL     TOR
      008EFC 20 03            [ 2] 2633         JRA      CHAR2
      008EFE CD 8E E4         [ 4] 2634 CHAR1:  CALL     SPACE
      008F01 CD 84 48         [ 4] 2635 CHAR2:  CALL     DONXT
      008F04 8E FE                 2636         .word    CHAR1
      008F06 81               [ 4] 2637         RET
                                   2638 
                                   2639 ;       TYPE    ( b u -- )
                                   2640 ;       Output u characters from b.
      008F07 8E EC                 2641         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



                           000E89  2642 LINK = . 
      008F09 04                    2643         .byte      4
      008F0A 54 59 50 45           2644         .ascii     "TYPE"
      008F0E                       2645 TYPES:
      008F0E CD 85 2C         [ 4] 2646         CALL     TOR
      008F11 20 0C            [ 2] 2647         JRA     TYPE2
      008F13 CD 85 63         [ 4] 2648 TYPE1:  CALL     DUPP
      008F16 CD 84 DA         [ 4] 2649         CALL     CAT
      008F19 CD 84 1E         [ 4] 2650         CALL     EMIT
      008F1C CD 8A 58         [ 4] 2651         CALL     ONEP
      008F1F CD 84 48         [ 4] 2652 TYPE2:  CALL     DONXT
      008F22 8F 13                 2653         .word      TYPE1
      008F24 CC 85 59         [ 2] 2654         JP     DROP
                                   2655 
                                   2656 ;       CR      ( -- )
                                   2657 ;       Output a carriage return
                                   2658 ;       and a line feed.
      008F27 8F 09                 2659         .word      LINK
                           000EA9  2660 LINK = . 
      008F29 02                    2661         .byte      2
      008F2A 43 52                 2662         .ascii     "CR"
      008F2C                       2663 CR:
      008F2C CD 84 34         [ 4] 2664         CALL     DOLIT
      008F2F 00 0D                 2665         .word      CRR
      008F31 CD 84 1E         [ 4] 2666         CALL     EMIT
      008F34 CD 84 34         [ 4] 2667         CALL     DOLIT
      008F37 00 0A                 2668         .word      LF
      008F39 CC 84 1E         [ 2] 2669         JP     EMIT
                                   2670 
                                   2671 ;       do$     ( -- a )
                                   2672 ;       Return  address of a compiled
                                   2673 ;       string.
      008F3C 8F 29                 2674         .word      LINK
                           000EBE  2675 LINK = . 
      008F3E 43                    2676 	.byte      COMPO+3
      008F3F 44 4F 24              2677         .ascii     "DO$"
      008F42                       2678 DOSTR:
      008F42 CD 85 0D         [ 4] 2679         CALL     RFROM
      008F45 CD 85 20         [ 4] 2680         CALL     RAT
      008F48 CD 85 0D         [ 4] 2681         CALL     RFROM
      008F4B CD 8B 9C         [ 4] 2682         CALL     COUNT
      008F4E CD 87 5E         [ 4] 2683         CALL     PLUS
      008F51 CD 85 2C         [ 4] 2684         CALL     TOR
      008F54 CD 85 73         [ 4] 2685         CALL     SWAPP
      008F57 CD 85 2C         [ 4] 2686         CALL     TOR
      008F5A 81               [ 4] 2687         RET
                                   2688 
                                   2689 ;       $"|     ( -- a )
                                   2690 ;       Run time routine compiled by $".
                                   2691 ;       Return address of a compiled string.
      008F5B 8F 3E                 2692         .word      LINK
                           000EDD  2693 LINK = . 
      008F5D 43                    2694 	.byte      COMPO+3
      008F5E 24 22 7C              2695         .byte     '$','"','|'
      008F61                       2696 STRQP:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



      008F61 CD 8F 42         [ 4] 2697         CALL     DOSTR
      008F64 81               [ 4] 2698         RET
                                   2699 
                                   2700 ;       ."|     ( -- )
                                   2701 ;       Run time routine of ." .
                                   2702 ;       Output a compiled string.
      008F65 8F 5D                 2703         .word      LINK
                           000EE7  2704 LINK = . 
      008F67 43                    2705 	.byte      COMPO+3
      008F68 2E 22 7C              2706         .byte     '.','"','|'
      008F6B                       2707 DOTQP:
      008F6B CD 8F 42         [ 4] 2708         CALL     DOSTR
      008F6E CD 8B 9C         [ 4] 2709         CALL     COUNT
      008F71 CC 8F 0E         [ 2] 2710         JP     TYPES
                                   2711 
                                   2712 ;       .R      ( n +n -- )
                                   2713 ;       Display an integer in a field
                                   2714 ;       of n columns, right justified.
      008F74 8F 67                 2715         .word      LINK
                           000EF6  2716 LINK = . 
      008F76 02                    2717         .byte      2
      008F77 2E 52                 2718         .ascii     ".R"
      008F79                       2719 DOTR:
      008F79 CD 85 2C         [ 4] 2720         CALL     TOR
      008F7C CD 8D 4E         [ 4] 2721         CALL     STR
      008F7F CD 85 0D         [ 4] 2722         CALL     RFROM
      008F82 CD 85 8D         [ 4] 2723         CALL     OVER
      008F85 CD 87 D7         [ 4] 2724         CALL     SUBB
      008F88 CD 8E F3         [ 4] 2725         CALL     SPACS
      008F8B CC 8F 0E         [ 2] 2726         JP     TYPES
                                   2727 
                                   2728 ;       U.R     ( u +n -- )
                                   2729 ;       Display an unsigned integer
                                   2730 ;       in n column, right justified.
      008F8E 8F 76                 2731         .word      LINK
                           000F10  2732 LINK = . 
      008F90 03                    2733         .byte      3
      008F91 55 2E 52              2734         .ascii     "U.R"
      008F94                       2735 UDOTR:
      008F94 CD 85 2C         [ 4] 2736         CALL     TOR
      008F97 CD 8C D1         [ 4] 2737         CALL     BDIGS
      008F9A CD 8D 0B         [ 4] 2738         CALL     DIGS
      008F9D CD 8D 36         [ 4] 2739         CALL     EDIGS
      008FA0 CD 85 0D         [ 4] 2740         CALL     RFROM
      008FA3 CD 85 8D         [ 4] 2741         CALL     OVER
      008FA6 CD 87 D7         [ 4] 2742         CALL     SUBB
      008FA9 CD 8E F3         [ 4] 2743         CALL     SPACS
      008FAC CC 8F 0E         [ 2] 2744         JP     TYPES
                                   2745 
                                   2746 ;       U.      ( u -- )
                                   2747 ;       Display an unsigned integer
                                   2748 ;       in free format.
      008FAF 8F 90                 2749         .word      LINK
                           000F31  2750 LINK = . 
      008FB1 02                    2751         .byte      2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



      008FB2 55 2E                 2752         .ascii     "U."
      008FB4                       2753 UDOT:
      008FB4 CD 8C D1         [ 4] 2754         CALL     BDIGS
      008FB7 CD 8D 0B         [ 4] 2755         CALL     DIGS
      008FBA CD 8D 36         [ 4] 2756         CALL     EDIGS
      008FBD CD 8E E4         [ 4] 2757         CALL     SPACE
      008FC0 CC 8F 0E         [ 2] 2758         JP     TYPES
                                   2759 
                                   2760 ;       .       ( w -- )
                                   2761 ;       Display an integer in free
                                   2762 ;       format, preceeded by a space.
      008FC3 8F B1                 2763         .word      LINK
                           000F45  2764 LINK = . 
      008FC5 01                    2765         .byte      1
      008FC6 2E                    2766         .ascii     "."
      008FC7                       2767 DOT:
      008FC7 CD 86 20         [ 4] 2768         CALL     BASE
      008FCA CD 84 BC         [ 4] 2769         CALL     AT
      008FCD CD 84 34         [ 4] 2770         CALL     DOLIT
      008FD0 00 0A                 2771         .word      10
      008FD2 CD 85 D8         [ 4] 2772         CALL     XORR    ;?decimal
      008FD5 CD 84 67         [ 4] 2773         CALL     QBRAN
      008FD8 8F DD                 2774         .word      DOT1
      008FDA CC 8F B4         [ 2] 2775         JP     UDOT
      008FDD CD 8D 4E         [ 4] 2776 DOT1:   CALL     STR
      008FE0 CD 8E E4         [ 4] 2777         CALL     SPACE
      008FE3 CC 8F 0E         [ 2] 2778         JP     TYPES
                                   2779 
                                   2780 ;       ?       ( a -- )
                                   2781 ;       Display contents in memory cell.
      008FE6 8F C5                 2782         .word      LINK
                                   2783         
                           000F68  2784 LINK = . 
      008FE8 01                    2785         .byte      1
      008FE9 3F                    2786         .ascii     "?"
      008FEA                       2787 QUEST:
      008FEA CD 84 BC         [ 4] 2788         CALL     AT
      008FED CC 8F C7         [ 2] 2789         JP     DOT
                                   2790 
                                   2791 ;; Parsing
                                   2792 
                                   2793 ;       parse   ( b u c -- b u delta ; <string> )
                                   2794 ;       Scan string delimited by c.
                                   2795 ;       Return found string and its offset.
      008FF0 8F E8                 2796         .word      LINK
                           000F72  2797 LINK = . 
      008FF2 05                    2798         .byte      5
      008FF3 70 61 72 73 65        2799         .ascii     "parse"
      008FF8                       2800 PARS:
      008FF8 CD 86 2F         [ 4] 2801         CALL     TEMP
      008FFB CD 84 A5         [ 4] 2802         CALL     STORE
      008FFE CD 85 8D         [ 4] 2803         CALL     OVER
      009001 CD 85 2C         [ 4] 2804         CALL     TOR
      009004 CD 85 63         [ 4] 2805         CALL     DUPP
      009007 CD 84 67         [ 4] 2806         CALL     QBRAN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



      00900A 90 B0                 2807         .word    PARS8
      00900C CD 8A 65         [ 4] 2808         CALL     ONEM
      00900F CD 86 2F         [ 4] 2809         CALL     TEMP
      009012 CD 84 BC         [ 4] 2810         CALL     AT
      009015 CD 8A B7         [ 4] 2811         CALL     BLANK
      009018 CD 87 FF         [ 4] 2812         CALL     EQUAL
      00901B CD 84 67         [ 4] 2813         CALL     QBRAN
      00901E 90 51                 2814         .word      PARS3
      009020 CD 85 2C         [ 4] 2815         CALL     TOR
      009023 CD 8A B7         [ 4] 2816 PARS1:  CALL     BLANK
      009026 CD 85 8D         [ 4] 2817         CALL     OVER
      009029 CD 84 DA         [ 4] 2818         CALL     CAT     ;skip leading blanks ONLY
      00902C CD 87 D7         [ 4] 2819         CALL     SUBB
      00902F CD 85 9C         [ 4] 2820         CALL     ZLESS
      009032 CD 87 78         [ 4] 2821         CALL     INVER
      009035 CD 84 67         [ 4] 2822         CALL     QBRAN
      009038 90 4E                 2823         .word      PARS2
      00903A CD 8A 58         [ 4] 2824         CALL     ONEP
      00903D CD 84 48         [ 4] 2825         CALL     DONXT
      009040 90 23                 2826         .word      PARS1
      009042 CD 85 0D         [ 4] 2827         CALL     RFROM
      009045 CD 85 59         [ 4] 2828         CALL     DROP
      009048 CD 8A C4         [ 4] 2829         CALL     ZERO
      00904B CC 85 63         [ 2] 2830         JP     DUPP
      00904E CD 85 0D         [ 4] 2831 PARS2:  CALL     RFROM
      009051 CD 85 8D         [ 4] 2832 PARS3:  CALL     OVER
      009054 CD 85 73         [ 4] 2833         CALL     SWAPP
      009057 CD 85 2C         [ 4] 2834         CALL     TOR
      00905A CD 86 2F         [ 4] 2835 PARS4:  CALL     TEMP
      00905D CD 84 BC         [ 4] 2836         CALL     AT
      009060 CD 85 8D         [ 4] 2837         CALL     OVER
      009063 CD 84 DA         [ 4] 2838         CALL     CAT
      009066 CD 87 D7         [ 4] 2839         CALL     SUBB    ;scan for delimiter
      009069 CD 86 2F         [ 4] 2840         CALL     TEMP
      00906C CD 84 BC         [ 4] 2841         CALL     AT
      00906F CD 8A B7         [ 4] 2842         CALL     BLANK
      009072 CD 87 FF         [ 4] 2843         CALL     EQUAL
      009075 CD 84 67         [ 4] 2844         CALL     QBRAN
      009078 90 7D                 2845         .word      PARS5
      00907A CD 85 9C         [ 4] 2846         CALL     ZLESS
      00907D CD 84 67         [ 4] 2847 PARS5:  CALL     QBRAN
      009080 90 92                 2848         .word      PARS6
      009082 CD 8A 58         [ 4] 2849         CALL     ONEP
      009085 CD 84 48         [ 4] 2850         CALL     DONXT
      009088 90 5A                 2851         .word      PARS4
      00908A CD 85 63         [ 4] 2852         CALL     DUPP
      00908D CD 85 2C         [ 4] 2853         CALL     TOR
      009090 20 0F            [ 2] 2854         JRA     PARS7
      009092 CD 85 0D         [ 4] 2855 PARS6:  CALL     RFROM
      009095 CD 85 59         [ 4] 2856         CALL     DROP
      009098 CD 85 63         [ 4] 2857         CALL     DUPP
      00909B CD 8A 58         [ 4] 2858         CALL     ONEP
      00909E CD 85 2C         [ 4] 2859         CALL     TOR
      0090A1 CD 85 8D         [ 4] 2860 PARS7:  CALL     OVER
      0090A4 CD 87 D7         [ 4] 2861         CALL     SUBB
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



      0090A7 CD 85 0D         [ 4] 2862         CALL     RFROM
      0090AA CD 85 0D         [ 4] 2863         CALL     RFROM
      0090AD CC 87 D7         [ 2] 2864         JP     SUBB
      0090B0 CD 85 8D         [ 4] 2865 PARS8:  CALL     OVER
      0090B3 CD 85 0D         [ 4] 2866         CALL     RFROM
      0090B6 CC 87 D7         [ 2] 2867         JP     SUBB
                                   2868 
                                   2869 ;       PARSE   ( c -- b u ; <string> )
                                   2870 ;       Scan input stream and return
                                   2871 ;       counted string delimited by c.
      0090B9 8F F2                 2872         .word      LINK
                           00103B  2873 LINK = . 
      0090BB 05                    2874         .byte      5
      0090BC 50 41 52 53 45        2875         .ascii     "PARSE"
      0090C1                       2876 PARSE:
      0090C1 CD 85 2C         [ 4] 2877         CALL     TOR
      0090C4 CD 8B D5         [ 4] 2878         CALL     TIB
      0090C7 CD 86 3E         [ 4] 2879         CALL     INN
      0090CA CD 84 BC         [ 4] 2880         CALL     AT
      0090CD CD 87 5E         [ 4] 2881         CALL     PLUS    ;current input buffer pointer
      0090D0 CD 86 4E         [ 4] 2882         CALL     NTIB
      0090D3 CD 84 BC         [ 4] 2883         CALL     AT
      0090D6 CD 86 3E         [ 4] 2884         CALL     INN
      0090D9 CD 84 BC         [ 4] 2885         CALL     AT
      0090DC CD 87 D7         [ 4] 2886         CALL     SUBB    ;remaining count
      0090DF CD 85 0D         [ 4] 2887         CALL     RFROM
      0090E2 CD 8F F8         [ 4] 2888         CALL     PARS
      0090E5 CD 86 3E         [ 4] 2889         CALL     INN
      0090E8 CC 8B 35         [ 2] 2890         JP     PSTOR
                                   2891 
                                   2892 ;       .(      ( -- )
                                   2893 ;       Output following string up to next ) .
      0090EB 90 BB                 2894         .word      LINK
                           00106D  2895 LINK = . 
      0090ED 82                    2896 	.byte      IMEDD+2
      0090EE 2E 28                 2897         .ascii     ".("
      0090F0                       2898 DOTPR:
      0090F0 CD 84 34         [ 4] 2899         CALL     DOLIT
      0090F3 00 29                 2900         .word     41	; ")"
      0090F5 CD 90 C1         [ 4] 2901         CALL     PARSE
      0090F8 CC 8F 0E         [ 2] 2902         JP     TYPES
                                   2903 
                                   2904 ;       (       ( -- )
                                   2905 ;       Ignore following string up to next ).
                                   2906 ;       A comment.
      0090FB 90 ED                 2907         .word      LINK
                           00107D  2908 LINK = . 
      0090FD 81                    2909 	.byte      IMEDD+1
      0090FE 28                    2910         .ascii     "("
      0090FF                       2911 PAREN:
      0090FF CD 84 34         [ 4] 2912         CALL     DOLIT
      009102 00 29                 2913         .word     41	; ")"
      009104 CD 90 C1         [ 4] 2914         CALL     PARSE
      009107 CC 87 3E         [ 2] 2915         JP     DDROP
                                   2916 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



                                   2917 ;       \       ( -- )
                                   2918 ;       Ignore following text till
                                   2919 ;       end of line.
      00910A 90 FD                 2920         .word      LINK
                           00108C  2921 LINK = . 
      00910C 81                    2922 	.byte      IMEDD+1
      00910D 5C                    2923         .ascii     "\"
      00910E                       2924 BKSLA:
      00910E 90 AE 00 0C      [ 2] 2925         ldw y,#UCTIB ; #TIB  
      009112 90 FE            [ 2] 2926         ldw y,(y)
      009114 90 89            [ 2] 2927         pushw y ; count in TIB 
      009116 90 AE 00 0A      [ 2] 2928         ldw y,#UINN ; >IN 
      00911A 90 BF 24         [ 2] 2929         ldw YTEMP,y
      00911D 90 85            [ 2] 2930         popw y 
      00911F 91 CF 24         [ 5] 2931         ldw [YTEMP],y
      009122 81               [ 4] 2932         ret 
                                   2933 
                                   2934 ;       WORD    ( c -- a ; <string> )
                                   2935 ;       Parse a word from input stream
                                   2936 ;       and copy it to code dictionary.
      009123 91 0C                 2937         .word      LINK
                           0010A5  2938 LINK = . 
      009125 04                    2939         .byte      4
      009126 57 4F 52 44           2940         .ascii     "WORD"
      00912A                       2941 WORDD:
      00912A CD 90 C1         [ 4] 2942         CALL     PARSE
      00912D CD 8B B3         [ 4] 2943         CALL     HERE
      009130 CD 8A 2D         [ 4] 2944         CALL     CELLP
      009133 CC 8C 74         [ 2] 2945         JP     PACKS
                                   2946 
                                   2947 ;       TOKEN   ( -- a ; <string> )
                                   2948 ;       Parse a word from input stream
                                   2949 ;       and copy it to name dictionary.
      009136 91 25                 2950         .word      LINK
                           0010B8  2951 LINK = . 
      009138 05                    2952         .byte      5
      009139 54 4F 4B 45 4E        2953         .ascii     "TOKEN"
      00913E                       2954 TOKEN:
      00913E CD 8A B7         [ 4] 2955         CALL     BLANK
      009141 CC 91 2A         [ 2] 2956         JP     WORDD
                                   2957 
                                   2958 ;; Dictionary search
                                   2959 
                                   2960 ;       NAME>   ( na -- ca )
                                   2961 ;       Return a code address given
                                   2962 ;       a name address.
      009144 91 38                 2963         .word      LINK
                           0010C6  2964 LINK = . 
      009146 05                    2965         .byte      5
      009147 4E 41 4D 45 3E        2966         .ascii     "NAME>"
      00914C                       2967 NAMET:
      00914C CD 8B 9C         [ 4] 2968         CALL     COUNT
      00914F CD 84 34         [ 4] 2969         CALL     DOLIT
      009152 00 1F                 2970         .word      31
      009154 CD 85 AF         [ 4] 2971         CALL     ANDD
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      009157 CC 87 5E         [ 2] 2972         JP     PLUS
                                   2973 
                                   2974 ;       SAME?   ( a a u -- a a f \ -0+ )
                                   2975 ;       Compare u cells in two
                                   2976 ;       strings. Return 0 if identical.
      00915A 91 46                 2977         .word      LINK
                           0010DC  2978 LINK = . 
      00915C 05                    2979         .byte       5
      00915D 53 41 4D 45 3F        2980         .ascii     "SAME?"
      009162                       2981 SAMEQ:
      009162 CD 8A 65         [ 4] 2982         CALL     ONEM
      009165 CD 85 2C         [ 4] 2983         CALL     TOR
      009168 20 29            [ 2] 2984         JRA     SAME2
      00916A CD 85 8D         [ 4] 2985 SAME1:  CALL     OVER
      00916D CD 85 20         [ 4] 2986         CALL     RAT
      009170 CD 87 5E         [ 4] 2987         CALL     PLUS
      009173 CD 84 DA         [ 4] 2988         CALL     CAT
      009176 CD 85 8D         [ 4] 2989         CALL     OVER
      009179 CD 85 20         [ 4] 2990         CALL     RAT
      00917C CD 87 5E         [ 4] 2991         CALL     PLUS
      00917F CD 84 DA         [ 4] 2992         CALL     CAT
      009182 CD 87 D7         [ 4] 2993         CALL     SUBB
      009185 CD 87 0D         [ 4] 2994         CALL     QDUP
      009188 CD 84 67         [ 4] 2995         CALL     QBRAN
      00918B 91 93                 2996         .word      SAME2
      00918D CD 85 0D         [ 4] 2997         CALL     RFROM
      009190 CC 85 59         [ 2] 2998         JP     DROP
      009193 CD 84 48         [ 4] 2999 SAME2:  CALL     DONXT
      009196 91 6A                 3000         .word      SAME1
      009198 CC 8A C4         [ 2] 3001         JP     ZERO
                                   3002 
                                   3003 ;       find    ( a va -- ca na | a F )
                                   3004 ;       Search vocabulary for string.
                                   3005 ;       Return ca and na if succeeded.
      00919B 91 5C                 3006         .word      LINK
                           00111D  3007 LINK = . 
      00919D 04                    3008         .byte      4
      00919E 46 49 4E 44           3009         .ascii     "FIND"
      0091A2                       3010 FIND:
      0091A2 CD 85 73         [ 4] 3011         CALL     SWAPP
      0091A5 CD 85 63         [ 4] 3012         CALL     DUPP
      0091A8 CD 84 DA         [ 4] 3013         CALL     CAT
      0091AB CD 86 2F         [ 4] 3014         CALL     TEMP
      0091AE CD 84 A5         [ 4] 3015         CALL     STORE
      0091B1 CD 85 63         [ 4] 3016         CALL     DUPP
      0091B4 CD 84 BC         [ 4] 3017         CALL     AT
      0091B7 CD 85 2C         [ 4] 3018         CALL     TOR
      0091BA CD 8A 2D         [ 4] 3019         CALL     CELLP
      0091BD CD 85 73         [ 4] 3020         CALL     SWAPP
      0091C0 CD 84 BC         [ 4] 3021 FIND1:  CALL     AT
      0091C3 CD 85 63         [ 4] 3022         CALL     DUPP
      0091C6 CD 84 67         [ 4] 3023         CALL     QBRAN
      0091C9 91 FF                 3024         .word      FIND6
      0091CB CD 85 63         [ 4] 3025         CALL     DUPP
      0091CE CD 84 BC         [ 4] 3026         CALL     AT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      0091D1 CD 84 34         [ 4] 3027         CALL     DOLIT
      0091D4 1F 7F                 3028         .word      MASKK
      0091D6 CD 85 AF         [ 4] 3029         CALL     ANDD
      0091D9 CD 85 20         [ 4] 3030         CALL     RAT
      0091DC CD 85 D8         [ 4] 3031         CALL     XORR
      0091DF CD 84 67         [ 4] 3032         CALL     QBRAN
      0091E2 91 EE                 3033         .word      FIND2
      0091E4 CD 8A 2D         [ 4] 3034         CALL     CELLP
      0091E7 CD 84 34         [ 4] 3035         CALL     DOLIT
      0091EA FF FF                 3036         .word     0xFFFF
      0091EC 20 0C            [ 2] 3037         JRA     FIND3
      0091EE CD 8A 2D         [ 4] 3038 FIND2:  CALL     CELLP
      0091F1 CD 86 2F         [ 4] 3039         CALL     TEMP
      0091F4 CD 84 BC         [ 4] 3040         CALL     AT
      0091F7 CD 91 62         [ 4] 3041         CALL     SAMEQ
      0091FA CD 84 7E         [ 4] 3042 FIND3:  CALL     BRAN
      0091FD 92 0E                 3043         .word      FIND4
      0091FF CD 85 0D         [ 4] 3044 FIND6:  CALL     RFROM
      009202 CD 85 59         [ 4] 3045         CALL     DROP
      009205 CD 85 73         [ 4] 3046         CALL     SWAPP
      009208 CD 8A 3C         [ 4] 3047         CALL     CELLM
      00920B CC 85 73         [ 2] 3048         JP     SWAPP
      00920E CD 84 67         [ 4] 3049 FIND4:  CALL     QBRAN
      009211 92 1B                 3050         .word      FIND5
      009213 CD 8A 3C         [ 4] 3051         CALL     CELLM
      009216 CD 8A 3C         [ 4] 3052         CALL     CELLM
      009219 20 A5            [ 2] 3053         JRA     FIND1
      00921B CD 85 0D         [ 4] 3054 FIND5:  CALL     RFROM
      00921E CD 85 59         [ 4] 3055         CALL     DROP
      009221 CD 85 73         [ 4] 3056         CALL     SWAPP
      009224 CD 85 59         [ 4] 3057         CALL     DROP
      009227 CD 8A 3C         [ 4] 3058         CALL     CELLM
      00922A CD 85 63         [ 4] 3059         CALL     DUPP
      00922D CD 91 4C         [ 4] 3060         CALL     NAMET
      009230 CC 85 73         [ 2] 3061         JP     SWAPP
                                   3062 
                                   3063 ;       NAME?   ( a -- ca na | a F )
                                   3064 ;       Search vocabularies for a string.
      009233 91 9D                 3065         .word      LINK
                           0011B5  3066 LINK = . 
      009235 05                    3067         .byte      5
      009236 4E 41 4D 45 3F        3068         .ascii     "NAME?"
      00923B                       3069 NAMEQ:
      00923B CD 86 A3         [ 4] 3070         CALL   CNTXT
      00923E CC 91 A2         [ 2] 3071         JP     FIND
                                   3072 
                                   3073 ;; Terminal response
                                   3074 
                                   3075 ;       ^H      ( bot eot cur -- bot eot cur )
                                   3076 ;       Backup cursor by one character.
      009241 92 35                 3077         .word      LINK
                           0011C3  3078 LINK = . 
      009243 02                    3079         .byte      2
      009244 5E 48                 3080         .ascii     "^H"
      009246                       3081 BKSP:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



      009246 CD 85 2C         [ 4] 3082         CALL     TOR
      009249 CD 85 8D         [ 4] 3083         CALL     OVER
      00924C CD 85 0D         [ 4] 3084         CALL     RFROM
      00924F CD 85 73         [ 4] 3085         CALL     SWAPP
      009252 CD 85 8D         [ 4] 3086         CALL     OVER
      009255 CD 85 D8         [ 4] 3087         CALL     XORR
      009258 CD 84 67         [ 4] 3088         CALL     QBRAN
      00925B 92 76                 3089         .word      BACK1
      00925D CD 84 34         [ 4] 3090         CALL     DOLIT
      009260 00 08                 3091         .word      BKSPP
      009262 CD 84 1E         [ 4] 3092         CALL     EMIT
      009265 CD 8A 65         [ 4] 3093         CALL     ONEM
      009268 CD 8A B7         [ 4] 3094         CALL     BLANK
      00926B CD 84 1E         [ 4] 3095         CALL     EMIT
      00926E CD 84 34         [ 4] 3096         CALL     DOLIT
      009271 00 08                 3097         .word      BKSPP
      009273 CC 84 1E         [ 2] 3098         JP     EMIT
      009276 81               [ 4] 3099 BACK1:  RET
                                   3100 
                                   3101 ;       TAP    ( bot eot cur c -- bot eot cur )
                                   3102 ;       Accept and echo key stroke
                                   3103 ;       and bump cursor.
      009277 92 43                 3104         .word      LINK
                           0011F9  3105 LINK = . 
      009279 03                    3106         .byte      3
      00927A 54 41 50              3107         .ascii     "TAP"
      00927D                       3108 TAP:
      00927D CD 85 63         [ 4] 3109         CALL     DUPP
      009280 CD 84 1E         [ 4] 3110         CALL     EMIT
      009283 CD 85 8D         [ 4] 3111         CALL     OVER
      009286 CD 84 C9         [ 4] 3112         CALL     CSTOR
      009289 CC 8A 58         [ 2] 3113         JP     ONEP
                                   3114 
                                   3115 ;       kTAP    ( bot eot cur c -- bot eot cur )
                                   3116 ;       Process a key stroke,
                                   3117 ;       CR or backspace.
      00928C 92 79                 3118         .word      LINK
                           00120E  3119 LINK = . 
      00928E 04                    3120         .byte      4
      00928F 4B 54 41 50           3121         .ascii     "KTAP"
      009293                       3122 KTAP:
      009293 CD 85 63         [ 4] 3123         CALL     DUPP
      009296 CD 84 34         [ 4] 3124         CALL     DOLIT
      009299 00 0D                 3125         .word      CRR
      00929B CD 85 D8         [ 4] 3126         CALL     XORR
      00929E CD 84 67         [ 4] 3127         CALL     QBRAN
      0092A1 92 B9                 3128         .word      KTAP2
      0092A3 CD 84 34         [ 4] 3129         CALL     DOLIT
      0092A6 00 08                 3130         .word      BKSPP
      0092A8 CD 85 D8         [ 4] 3131         CALL     XORR
      0092AB CD 84 67         [ 4] 3132         CALL     QBRAN
      0092AE 92 B6                 3133         .word      KTAP1
      0092B0 CD 8A B7         [ 4] 3134         CALL     BLANK
      0092B3 CC 92 7D         [ 2] 3135         JP     TAP
      0092B6 CC 92 46         [ 2] 3136 KTAP1:  JP     BKSP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      0092B9 CD 85 59         [ 4] 3137 KTAP2:  CALL     DROP
      0092BC CD 85 73         [ 4] 3138         CALL     SWAPP
      0092BF CD 85 59         [ 4] 3139         CALL     DROP
      0092C2 CC 85 63         [ 2] 3140         JP     DUPP
                                   3141 
                                   3142 ;       accept  ( b u -- b u )
                                   3143 ;       Accept characters to input
                                   3144 ;       buffer. Return with actual count.
      0092C5 92 8E                 3145         .word      LINK
                           001247  3146 LINK = . 
      0092C7 06                    3147         .byte      6
      0092C8 41 43 43 45 50 54     3148         .ascii     "ACCEPT"
      0092CE                       3149 ACCEP:
      0092CE CD 85 8D         [ 4] 3150         CALL     OVER
      0092D1 CD 87 5E         [ 4] 3151         CALL     PLUS
      0092D4 CD 85 8D         [ 4] 3152         CALL     OVER
      0092D7 CD 87 49         [ 4] 3153 ACCP1:  CALL     DDUP
      0092DA CD 85 D8         [ 4] 3154         CALL     XORR
      0092DD CD 84 67         [ 4] 3155         CALL     QBRAN
      0092E0 93 02                 3156         .word      ACCP4
      0092E2 CD 8E AC         [ 4] 3157         CALL     KEY
      0092E5 CD 85 63         [ 4] 3158         CALL     DUPP
      0092E8 CD 8A B7         [ 4] 3159         CALL     BLANK
      0092EB CD 84 34         [ 4] 3160         CALL     DOLIT
      0092EE 00 7F                 3161         .word      127
      0092F0 CD 88 99         [ 4] 3162         CALL     WITHI
      0092F3 CD 84 67         [ 4] 3163         CALL     QBRAN
      0092F6 92 FD                 3164         .word      ACCP2
      0092F8 CD 92 7D         [ 4] 3165         CALL     TAP
      0092FB 20 03            [ 2] 3166         JRA     ACCP3
      0092FD CD 92 93         [ 4] 3167 ACCP2:  CALL     KTAP
      009300 20 D5            [ 2] 3168 ACCP3:  JRA     ACCP1
      009302 CD 85 59         [ 4] 3169 ACCP4:  CALL     DROP
      009305 CD 85 8D         [ 4] 3170         CALL     OVER
      009308 CC 87 D7         [ 2] 3171         JP     SUBB
                                   3172 
                                   3173 ;       QUERY   ( -- )
                                   3174 ;       Accept input stream to
                                   3175 ;       terminal input buffer.
      00930B 92 C7                 3176         .word      LINK
                                   3177         
                           00128D  3178 LINK = . 
      00930D 05                    3179         .byte      5
      00930E 51 55 45 52 59        3180         .ascii     "QUERY"
      009313                       3181 QUERY:
      009313 CD 8B D5         [ 4] 3182         CALL     TIB
      009316 CD 84 34         [ 4] 3183         CALL     DOLIT
      009319 00 50                 3184         .word      80
      00931B CD 92 CE         [ 4] 3185         CALL     ACCEP
      00931E CD 86 4E         [ 4] 3186         CALL     NTIB
      009321 CD 84 A5         [ 4] 3187         CALL     STORE
      009324 CD 85 59         [ 4] 3188         CALL     DROP
      009327 CD 8A C4         [ 4] 3189         CALL     ZERO
      00932A CD 86 3E         [ 4] 3190         CALL     INN
      00932D CC 84 A5         [ 2] 3191         JP     STORE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



                                   3192 
                                   3193 ;       ABORT   ( -- )
                                   3194 ;       Reset data stack and
                                   3195 ;       jump to QUIT.
      009330 93 0D                 3196         .word      LINK
                           0012B2  3197 LINK = . 
      009332 05                    3198         .byte      5
      009333 41 42 4F 52 54        3199         .ascii     "ABORT"
      009338                       3200 ABORT:
      009338 CD 94 2F         [ 4] 3201         CALL     PRESE
      00933B CC 94 4C         [ 2] 3202         JP     QUIT
                                   3203 
                                   3204 ;       abort"  ( f -- )
                                   3205 ;       Run time routine of ABORT".
                                   3206 ;       Abort with a message.
      00933E 93 32                 3207         .word      LINK
                           0012C0  3208 LINK = . 
      009340 46                    3209 	.byte      COMPO+6
      009341 41 42 4F 52 54        3210         .ascii     "ABORT"
      009346 22                    3211         .byte      '"'
      009347                       3212 ABORQ:
      009347 CD 84 67         [ 4] 3213         CALL     QBRAN
      00934A 93 66                 3214         .word      ABOR2   ;text flag
      00934C CD 8F 42         [ 4] 3215         CALL     DOSTR
      00934F CD 8E E4         [ 4] 3216 ABOR1:  CALL     SPACE
      009352 CD 8B 9C         [ 4] 3217         CALL     COUNT
      009355 CD 8F 0E         [ 4] 3218         CALL     TYPES
      009358 CD 84 34         [ 4] 3219         CALL     DOLIT
      00935B 00 3F                 3220         .word     63 ; "?"
      00935D CD 84 1E         [ 4] 3221         CALL     EMIT
      009360 CD 8F 2C         [ 4] 3222         CALL     CR
      009363 CC 93 38         [ 2] 3223         JP     ABORT   ;pass error string
      009366 CD 8F 42         [ 4] 3224 ABOR2:  CALL     DOSTR
      009369 CC 85 59         [ 2] 3225         JP     DROP
                                   3226 
                                   3227 ;; The text interpreter
                                   3228 
                                   3229 ;       $INTERPRET      ( a -- )
                                   3230 ;       Interpret a word. If failed,
                                   3231 ;       try to convert it to an integer.
      00936C 93 40                 3232         .word      LINK
                           0012EE  3233 LINK = . 
      00936E 0A                    3234         .byte      10
      00936F 24 49 4E 54 45 52 50  3235         .ascii     "$INTERPRET"
             52 45 54
      009379                       3236 INTER:
      009379 CD 92 3B         [ 4] 3237         CALL     NAMEQ
      00937C CD 87 0D         [ 4] 3238         CALL     QDUP    ;?defined
      00937F CD 84 67         [ 4] 3239         CALL     QBRAN
      009382 93 A3                 3240         .word      INTE1
      009384 CD 84 BC         [ 4] 3241         CALL     AT
      009387 CD 84 34         [ 4] 3242         CALL     DOLIT
      00938A 40 00                 3243 	.word       0x4000	; COMPO*256
      00938C CD 85 AF         [ 4] 3244         CALL     ANDD    ;?compile only lexicon bits
      00938F CD 93 47         [ 4] 3245         CALL     ABORQ
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      009392 0D                    3246         .byte      13
      009393 20 63 6F 6D 70 69 6C  3247         .ascii     " compile only"
             65 20 6F 6E 6C 79
      0093A0 CC 84 8E         [ 2] 3248         JP     EXECU
      0093A3 CD 8D D9         [ 4] 3249 INTE1:  CALL     NUMBQ   ;convert a number
      0093A6 CD 84 67         [ 4] 3250         CALL     QBRAN
      0093A9 93 4F                 3251         .word    ABOR1
      0093AB 81               [ 4] 3252         RET
                                   3253 
                                   3254 ;       [       ( -- )
                                   3255 ;       Start  text interpreter.
      0093AC 93 6E                 3256         .word      LINK
                           00132E  3257 LINK = . 
      0093AE 81                    3258 	.byte      IMEDD+1
      0093AF 5B                    3259         .ascii     "["
      0093B0                       3260 LBRAC:
      0093B0 CD 84 34         [ 4] 3261         CALL   DOLIT
      0093B3 93 79                 3262         .word  INTER
      0093B5 CD 86 81         [ 4] 3263         CALL   TEVAL
      0093B8 CC 84 A5         [ 2] 3264         JP     STORE
                                   3265 
                                   3266 ;       .OK     ( -- )
                                   3267 ;       Display 'ok' while interpreting.
      0093BB 93 AE                 3268         .word      LINK
                           00133D  3269 LINK = . 
      0093BD 03                    3270         .byte      3
      0093BE 2E 4F 4B              3271         .ascii     ".OK"
      0093C1                       3272 DOTOK:
      0093C1 CD 84 34         [ 4] 3273         CALL     DOLIT
      0093C4 93 79                 3274         .word      INTER
      0093C6 CD 86 81         [ 4] 3275         CALL     TEVAL
      0093C9 CD 84 BC         [ 4] 3276         CALL     AT
      0093CC CD 87 FF         [ 4] 3277         CALL     EQUAL
      0093CF CD 84 67         [ 4] 3278         CALL     QBRAN
      0093D2 93 DB                 3279         .word      DOTO1
      0093D4 CD 8F 6B         [ 4] 3280         CALL     DOTQP
      0093D7 03                    3281         .byte      3
      0093D8 20 6F 6B              3282         .ascii     " ok"
      0093DB CC 8F 2C         [ 2] 3283 DOTO1:  JP     CR
                                   3284 
                                   3285 ;       ?STACK  ( -- )
                                   3286 ;       Abort if stack underflows.
      0093DE 93 BD                 3287         .word      LINK
                           001360  3288 LINK = . 
      0093E0 06                    3289         .byte      6
      0093E1 3F 53 54 41 43 4B     3290         .ascii     "?STACK"
      0093E7                       3291 QSTAC: 
      0093E7 CD 8B 07         [ 4] 3292         CALL     DEPTH
      0093EA CD 85 9C         [ 4] 3293         CALL     ZLESS   ;check only for underflow
      0093ED CD 93 47         [ 4] 3294         CALL     ABORQ
      0093F0 0B                    3295         .byte      11
      0093F1 20 75 6E 64 65 72 66  3296         .ascii     " underflow "
             6C 6F 77 20
      0093FC 81               [ 4] 3297         RET
                                   3298 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



                                   3299 ;       EVAL    ( -- )
                                   3300 ;       Interpret  input stream.
      0093FD 93 E0                 3301         .word      LINK
                           00137F  3302 LINK = . 
      0093FF 04                    3303         .byte      4
      009400 45 56 41 4C           3304         .ascii     "EVAL"
      009404                       3305 EVAL:
      009404 CD 91 3E         [ 4] 3306 EVAL1:  CALL     TOKEN
      009407 CD 85 63         [ 4] 3307         CALL     DUPP
      00940A CD 84 DA         [ 4] 3308         CALL     CAT     ;?input stream empty
      00940D CD 84 67         [ 4] 3309         CALL     QBRAN
      009410 94 20                 3310         .word    EVAL2
      009412 CD 86 81         [ 4] 3311         CALL     TEVAL
      009415 CD 8B E9         [ 4] 3312         CALL     ATEXE
      009418 CD 93 E7         [ 4] 3313         CALL     QSTAC   ;evaluate input, check stack
      00941B CD 84 7E         [ 4] 3314         CALL     BRAN
      00941E 94 04                 3315         .word    EVAL1
      009420 CD 85 59         [ 4] 3316 EVAL2:  CALL     DROP
      009423 CC 93 C1         [ 2] 3317         JP       DOTOK
                                   3318 
                                   3319 ;       PRESET  ( -- )
                                   3320 ;       Reset data stack pointer and
                                   3321 ;       terminal input buffer.
      009426 93 FF                 3322         .word      LINK
                           0013A8  3323 LINK = . 
      009428 06                    3324         .byte      6
      009429 50 52 45 53 45 54     3325         .ascii     "PRESET"
      00942F                       3326 PRESE:
      00942F CD 84 34         [ 4] 3327         CALL     DOLIT
      009432 16 80                 3328         .word      SPP
      009434 CD 85 50         [ 4] 3329         CALL     SPSTO
      009437 CD 84 34         [ 4] 3330         CALL     DOLIT
      00943A 17 00                 3331         .word      TIBB
      00943C CD 86 4E         [ 4] 3332         CALL     NTIB
      00943F CD 8A 2D         [ 4] 3333         CALL     CELLP
      009442 CC 84 A5         [ 2] 3334         JP     STORE
                                   3335 
                                   3336 ;       QUIT    ( -- )
                                   3337 ;       Reset return stack pointer
                                   3338 ;       and start text interpreter.
      009445 94 28                 3339         .word      LINK
                           0013C7  3340 LINK = . 
      009447 04                    3341         .byte      4
      009448 51 55 49 54           3342         .ascii     "QUIT"
      00944C                       3343 QUIT:
      00944C CD 84 34         [ 4] 3344         CALL     DOLIT
      00944F 17 FF                 3345         .word      RPP
      009451 CD 84 F7         [ 4] 3346         CALL     RPSTO   ;reset return stack pointer
      009454 CD 93 B0         [ 4] 3347 QUIT1:  CALL     LBRAC   ;start interpretation
      009457 CD 93 13         [ 4] 3348 QUIT2:  CALL     QUERY   ;get input
      00945A CD 94 04         [ 4] 3349         CALL     EVAL
      00945D 20 F8            [ 2] 3350         JRA     QUIT2   ;continue till error
                                   3351 
                                   3352 ;; The compiler
                                   3353 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



                                   3354 ;       '       ( -- ca )
                                   3355 ;       Search vocabularies for
                                   3356 ;       next word in input stream.
      00945F 94 47                 3357         .word      LINK
                           0013E1  3358 LINK = . 
      009461 01                    3359         .byte      1
      009462 27                    3360         .ascii     "'"
      009463                       3361 TICK:
      009463 CD 91 3E         [ 4] 3362         CALL     TOKEN
      009466 CD 92 3B         [ 4] 3363         CALL     NAMEQ   ;?defined
      009469 CD 84 67         [ 4] 3364         CALL     QBRAN
      00946C 93 4F                 3365         .word      ABOR1
      00946E 81               [ 4] 3366         RET     ;yes, push code address
                                   3367 
                                   3368 ;       ALLOT   ( n -- )
                                   3369 ;       Allocate n bytes to RAM 
      00946F 94 61                 3370         .word      LINK
                           0013F1  3371         LINK = . 
      009471 05                    3372         .byte      5
      009472 41 4C 4C 4F 54        3373         .ascii     "ALLOT"
      009477                       3374 ALLOT:
      009477 CD 86 B1         [ 4] 3375         CALL     VPP
                                   3376 ; must update APP_VP each time VP is modidied
      00947A CD 8B 35         [ 4] 3377         call PSTOR 
      00947D CC 9C 0C         [ 2] 3378         jp UPDATVP 
                                   3379 
                                   3380 ;       ,       ( w -- )
                                   3381 ;         Compile an integer into
                                   3382 ;         variable space.
      009480 94 71                 3383         .word      LINK
                           001402  3384 LINK = . 
      009482 01                    3385         .byte      1
      009483 2C                    3386         .ascii     ","
      009484                       3387 COMMA:
      009484 CD 8B B3         [ 4] 3388         CALL     HERE
      009487 CD 85 63         [ 4] 3389         CALL     DUPP
      00948A CD 8A 2D         [ 4] 3390         CALL     CELLP   ;cell boundary
      00948D CD 86 B1         [ 4] 3391         CALL     VPP
      009490 CD 84 A5         [ 4] 3392         CALL     STORE
      009493 CC 84 A5         [ 2] 3393         JP     STORE
                                   3394 
                                   3395 ;       C,      ( c -- )
                                   3396 ;       Compile a byte into
                                   3397 ;       variables space.
      009496 94 82                 3398        .word      LINK
                           001418  3399 LINK = . 
      009498 02                    3400         .byte      2
      009499 43 2C                 3401         .ascii     "C,"
      00949B                       3402 CCOMMA:
      00949B CD 8B B3         [ 4] 3403         CALL     HERE
      00949E CD 85 63         [ 4] 3404         CALL     DUPP
      0094A1 CD 8A 58         [ 4] 3405         CALL     ONEP
      0094A4 CD 86 B1         [ 4] 3406         CALL     VPP
      0094A7 CD 84 A5         [ 4] 3407         CALL     STORE
      0094AA CC 84 C9         [ 2] 3408         JP     CSTOR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



                                   3409 
                                   3410 ;       [COMPILE]       ( -- ; <string> )
                                   3411 ;       Compile next immediate
                                   3412 ;       word into code dictionary.
      0094AD 94 98                 3413         .word      LINK
                           00142F  3414 LINK = . 
      0094AF 89                    3415 	.byte      IMEDD+9
      0094B0 5B 43 4F 4D 50 49 4C  3416         .ascii     "[COMPILE]"
             45 5D
      0094B9                       3417 BCOMP:
      0094B9 CD 94 63         [ 4] 3418         CALL     TICK
      0094BC CC 97 7C         [ 2] 3419         JP     JSRC
                                   3420 
                                   3421 ;       COMPILE ( -- )
                                   3422 ;       Compile next jsr in
                                   3423 ;       colon list to code dictionary.
      0094BF 94 AF                 3424         .word      LINK
                           001441  3425 LINK = . 
      0094C1 47                    3426 	.byte      COMPO+7
      0094C2 43 4F 4D 50 49 4C 45  3427         .ascii     "COMPILE"
      0094C9                       3428 COMPI:
      0094C9 CD 85 0D         [ 4] 3429         CALL     RFROM
      0094CC CD 85 63         [ 4] 3430         CALL     DUPP
      0094CF CD 84 BC         [ 4] 3431         CALL     AT
      0094D2 CD 97 7C         [ 4] 3432         CALL     JSRC    ;compile subroutine
      0094D5 CD 8A 2D         [ 4] 3433         CALL     CELLP
      0094D8 90 93            [ 1] 3434         ldw y,x 
      0094DA 90 FE            [ 2] 3435         ldw y,(y)
      0094DC 1C 00 02         [ 2] 3436         addw x,#CELLL 
      0094DF 90 FC            [ 2] 3437         jp (y)
                                   3438 
                                   3439 ;       LITERAL ( w -- )
                                   3440 ;       Compile tos to dictionary
                                   3441 ;       as an integer literal.
      0094E1 94 C1                 3442         .word      LINK
                           001463  3443 LINK = . 
      0094E3 87                    3444 	.byte      IMEDD+7
      0094E4 4C 49 54 45 52 41 4C  3445         .ascii     "LITERAL"
      0094EB                       3446 LITER:
      0094EB CD 94 C9         [ 4] 3447         CALL     COMPI
      0094EE 84 34                 3448         .word DOLIT 
      0094F0 CC 94 84         [ 2] 3449         JP     COMMA
                                   3450 
                                   3451 ;       $,"     ( -- )
                                   3452 ;       Compile a literal string
                                   3453 ;       up to next " .
      0094F3 94 E3                 3454         .word      LINK
                           001475  3455 LINK = . 
      0094F5 03                    3456         .byte      3
      0094F6 24 2C 22              3457         .byte     '$',',','"'
      0094F9                       3458 STRCQ:
      0094F9 CD 84 34         [ 4] 3459         CALL     DOLIT
      0094FC 00 22                 3460         .word     34	; "
      0094FE CD 90 C1         [ 4] 3461         CALL     PARSE
      009501 CD 8B B3         [ 4] 3462         CALL     HERE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      009504 CD 8C 74         [ 4] 3463         CALL     PACKS   ;string to code dictionary
      009507 CD 8B 9C         [ 4] 3464         CALL     COUNT
      00950A CD 87 5E         [ 4] 3465         CALL     PLUS    ;calculate aligned end of string
      00950D CD 86 B1         [ 4] 3466         CALL     VPP
      009510 CC 84 A5         [ 2] 3467         JP     STORE
                                   3468 
                                   3469 ;; Structures
                                   3470 
                                   3471 ;       FOR     ( -- a )
                                   3472 ;       Start a FOR-NEXT loop
                                   3473 ;       structure in a colon definition.
      009513 94 F5                 3474         .word      LINK
                           001495  3475 LINK = . 
      009515 83                    3476 	.byte      IMEDD+3
      009516 46 4F 52              3477         .ascii     "FOR"
      009519                       3478 FOR:
      009519 CD 94 C9         [ 4] 3479         CALL     COMPI
      00951C 85 2C                 3480         .word TOR 
      00951E CC 8B B3         [ 2] 3481         JP     HERE
                                   3482 
                                   3483 ;       NEXT    ( a -- )
                                   3484 ;       Terminate a FOR-NEXT loop.
      009521 95 15                 3485         .word      LINK
                           0014A3  3486 LINK = . 
      009523 84                    3487 	.byte      IMEDD+4
      009524 4E 45 58 54           3488         .ascii     "NEXT"
      009528                       3489 NEXT:
      009528 CD 94 C9         [ 4] 3490         CALL     COMPI
      00952B 84 48                 3491         .word DONXT 
      00952D CD 86 FD         [ 4] 3492         call ADRADJ
      009530 CC 94 84         [ 2] 3493         JP     COMMA
                                   3494 
                                   3495 ;       I ( -- n )
                                   3496 ;       stack FOR-NEXT COUNTER 
      009533 95 23                 3497         .word LINK 
                           0014B5  3498         LINK=.
      009535 01                    3499         .byte 1 
      009536 49                    3500         .ascii "I"
      009537                       3501 IFETCH: 
      009537 1D 00 02         [ 2] 3502         subw x,#CELLL 
      00953A 16 03            [ 2] 3503         ldw y,(3,sp)
      00953C FF               [ 2] 3504         ldw (x),y 
      00953D 81               [ 4] 3505         ret 
                                   3506 
                                   3507 ;       BEGIN   ( -- a )
                                   3508 ;       Start an infinite or
                                   3509 ;       indefinite loop structure.
      00953E 95 35                 3510         .word      LINK
                           0014C0  3511 LINK = . 
      009540 85                    3512 	.byte      IMEDD+5
      009541 42 45 47 49 4E        3513         .ascii     "BEGIN"
      009546                       3514 BEGIN:
      009546 CC 8B B3         [ 2] 3515         JP     HERE
                                   3516 
                                   3517 ;       UNTIL   ( a -- )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



                                   3518 ;       Terminate a BEGIN-UNTIL
                                   3519 ;       indefinite loop structure.
      009549 95 40                 3520         .word      LINK
                           0014CB  3521 LINK = . 
      00954B 85                    3522 	.byte      IMEDD+5
      00954C 55 4E 54 49 4C        3523         .ascii     "UNTIL"
      009551                       3524 UNTIL:
      009551 CD 94 C9         [ 4] 3525         CALL     COMPI
      009554 84 67                 3526         .word    QBRAN 
      009556 CD 86 FD         [ 4] 3527         call ADRADJ
      009559 CC 94 84         [ 2] 3528         JP     COMMA
                                   3529 
                                   3530 ;       AGAIN   ( a -- )
                                   3531 ;       Terminate a BEGIN-AGAIN
                                   3532 ;       infinite loop structure.
      00955C 95 4B                 3533         .word      LINK
                           0014DE  3534 LINK = . 
      00955E 85                    3535 	.byte      IMEDD+5
      00955F 41 47 41 49 4E        3536         .ascii     "AGAIN"
      009564                       3537 AGAIN:
      009564 CD 94 C9         [ 4] 3538         CALL     COMPI
      009567 84 7E                 3539         .word BRAN
      009569 CD 86 FD         [ 4] 3540         call ADRADJ 
      00956C CC 94 84         [ 2] 3541         JP     COMMA
                                   3542 
                                   3543 ;       IF      ( -- A )
                                   3544 ;       Begin a conditional branch.
      00956F 95 5E                 3545         .word      LINK
                           0014F1  3546 LINK = . 
      009571 82                    3547 	.byte      IMEDD+2
      009572 49 46                 3548         .ascii     "IF"
      009574                       3549 IFF:
      009574 CD 94 C9         [ 4] 3550         CALL     COMPI
      009577 84 67                 3551         .word QBRAN
      009579 CD 8B B3         [ 4] 3552         CALL     HERE
      00957C CD 8A C4         [ 4] 3553         CALL     ZERO
      00957F CC 94 84         [ 2] 3554         JP     COMMA
                                   3555 
                                   3556 ;       THEN        ( A -- )
                                   3557 ;       Terminate a conditional branch structure.
      009582 95 71                 3558         .word      LINK
                           001504  3559 LINK = . 
      009584 84                    3560 	.byte      IMEDD+4
      009585 54 48 45 4E           3561         .ascii     "THEN"
      009589                       3562 THENN:
      009589 CD 8B B3         [ 4] 3563         CALL     HERE
      00958C CD 86 FD         [ 4] 3564         call ADRADJ 
      00958F CD 85 73         [ 4] 3565         CALL     SWAPP
      009592 CC 84 A5         [ 2] 3566         JP     STORE
                                   3567 
                                   3568 ;       ELSE        ( A -- A )
                                   3569 ;       Start the false clause in an IF-ELSE-THEN structure.
      009595 95 84                 3570         .word      LINK
                           001517  3571 LINK = . 
      009597 84                    3572 	.byte      IMEDD+4
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      009598 45 4C 53 45           3573         .ascii     "ELSE"
      00959C                       3574 ELSEE:
      00959C CD 94 C9         [ 4] 3575         CALL     COMPI
      00959F 84 7E                 3576         .word BRAN
      0095A1 CD 8B B3         [ 4] 3577         CALL     HERE
      0095A4 CD 8A C4         [ 4] 3578         CALL     ZERO
      0095A7 CD 94 84         [ 4] 3579         CALL     COMMA
      0095AA CD 85 73         [ 4] 3580         CALL     SWAPP
      0095AD CD 8B B3         [ 4] 3581         CALL     HERE
      0095B0 CD 86 FD         [ 4] 3582         call ADRADJ 
      0095B3 CD 85 73         [ 4] 3583         CALL     SWAPP
      0095B6 CC 84 A5         [ 2] 3584         JP     STORE
                                   3585 
                                   3586 ;       AHEAD       ( -- A )
                                   3587 ;       Compile a forward branch instruction.
      0095B9 95 97                 3588         .word      LINK
                           00153B  3589 LINK = . 
      0095BB 85                    3590 	.byte      IMEDD+5
      0095BC 41 48 45 41 44        3591         .ascii     "AHEAD"
      0095C1                       3592 AHEAD:
      0095C1 CD 94 C9         [ 4] 3593         CALL     COMPI
      0095C4 84 7E                 3594         .word BRAN
      0095C6 CD 8B B3         [ 4] 3595         CALL     HERE
      0095C9 CD 8A C4         [ 4] 3596         CALL     ZERO
      0095CC CC 94 84         [ 2] 3597         JP     COMMA
                                   3598 
                                   3599 ;       WHILE       ( a -- A a )
                                   3600 ;       Conditional branch out of a BEGIN-WHILE-REPEAT loop.
      0095CF 95 BB                 3601         .word      LINK
                           001551  3602 LINK = . 
      0095D1 85                    3603 	.byte      IMEDD+5
      0095D2 57 48 49 4C 45        3604         .ascii     "WHILE"
      0095D7                       3605 WHILE:
      0095D7 CD 94 C9         [ 4] 3606         CALL     COMPI
      0095DA 84 67                 3607         .word QBRAN
      0095DC CD 8B B3         [ 4] 3608         CALL     HERE
      0095DF CD 8A C4         [ 4] 3609         CALL     ZERO
      0095E2 CD 94 84         [ 4] 3610         CALL     COMMA
      0095E5 CC 85 73         [ 2] 3611         JP     SWAPP
                                   3612 
                                   3613 ;       REPEAT      ( A a -- )
                                   3614 ;       Terminate a BEGIN-WHILE-REPEAT indefinite loop.
      0095E8 95 D1                 3615         .word      LINK
                           00156A  3616 LINK = . 
      0095EA 86                    3617         .byte      IMEDD+6
      0095EB 52 45 50 45 41 54     3618         .ascii     "REPEAT"
      0095F1                       3619 REPEA:
      0095F1 CD 94 C9         [ 4] 3620         CALL     COMPI
      0095F4 84 7E                 3621         .word BRAN
      0095F6 CD 86 FD         [ 4] 3622         call ADRADJ 
      0095F9 CD 94 84         [ 4] 3623         CALL     COMMA
      0095FC CD 8B B3         [ 4] 3624         CALL     HERE
      0095FF CD 86 FD         [ 4] 3625         call ADRADJ 
      009602 CD 85 73         [ 4] 3626         CALL     SWAPP
      009605 CC 84 A5         [ 2] 3627         JP     STORE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



                                   3628 
                                   3629 ;       AFT         ( a -- a A )
                                   3630 ;       Jump to THEN in a FOR-AFT-THEN-NEXT loop the first time through.
      009608 95 EA                 3631         .word      LINK
                           00158A  3632 LINK = . 
      00960A 83                    3633 	.byte      IMEDD+3
      00960B 41 46 54              3634         .ascii     "AFT"
      00960E                       3635 AFT:
      00960E CD 85 59         [ 4] 3636         CALL     DROP
      009611 CD 95 C1         [ 4] 3637         CALL     AHEAD
      009614 CD 8B B3         [ 4] 3638         CALL     HERE
      009617 CC 85 73         [ 2] 3639         JP     SWAPP
                                   3640 
                                   3641 ;       ABORT"      ( -- ; <string> )
                                   3642 ;       Conditional abort with an error message.
      00961A 96 0A                 3643         .word      LINK
                           00159C  3644 LINK = . 
      00961C 86                    3645 	.byte      IMEDD+6
      00961D 41 42 4F 52 54        3646         .ascii     "ABORT"
      009622 22                    3647         .byte      '"'
      009623                       3648 ABRTQ:
      009623 CD 94 C9         [ 4] 3649         CALL     COMPI
      009626 93 47                 3650         .word ABORQ
      009628 CC 94 F9         [ 2] 3651         JP     STRCQ
                                   3652 
                                   3653 ;       $"     ( -- ; <string> )
                                   3654 ;       Compile an inline string literal.
      00962B 96 1C                 3655         .word      LINK
                           0015AD  3656 LINK = . 
      00962D 82                    3657 	.byte      IMEDD+2
      00962E 24 22                 3658         .byte     '$','"'
      009630                       3659 STRQ:
      009630 CD 94 C9         [ 4] 3660         CALL     COMPI
      009633 8F 61                 3661         .word STRQP 
      009635 CC 94 F9         [ 2] 3662         JP     STRCQ
                                   3663 
                                   3664 ;       ."          ( -- ; <string> )
                                   3665 ;       Compile an inline string literal to be typed out at run time.
      009638 96 2D                 3666         .word      LINK
                           0015BA  3667 LINK = . 
      00963A 82                    3668 	.byte      IMEDD+2
      00963B 2E 22                 3669         .byte     '.','"'
      00963D                       3670 DOTQ:
      00963D CD 94 C9         [ 4] 3671         CALL     COMPI
      009640 8F 6B                 3672         .word DOTQP 
      009642 CC 94 F9         [ 2] 3673         JP     STRCQ
                                   3674 
                                   3675 ;; Name compiler
                                   3676 
                                   3677 ;       ?UNIQUE ( a -- a )
                                   3678 ;       Display a warning message
                                   3679 ;       if word already exists.
      009645 96 3A                 3680         .word      LINK
                           0015C7  3681 LINK = . 
      009647 07                    3682         .byte      7
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      009648 3F 55 4E 49 51 55 45  3683         .ascii     "?UNIQUE"
      00964F                       3684 UNIQU:
      00964F CD 85 63         [ 4] 3685         CALL     DUPP
      009652 CD 92 3B         [ 4] 3686         CALL     NAMEQ   ;?name exists
      009655 CD 84 67         [ 4] 3687         CALL     QBRAN
      009658 96 6E                 3688         .word      UNIQ1
      00965A CD 8F 6B         [ 4] 3689         CALL     DOTQP   ;redef are OK
      00965D 07                    3690         .byte       7
      00965E 20 72 65 44 65 66 20  3691         .ascii     " reDef "       
      009665 CD 85 8D         [ 4] 3692         CALL     OVER
      009668 CD 8B 9C         [ 4] 3693         CALL     COUNT
      00966B CD 8F 0E         [ 4] 3694         CALL     TYPES   ;just in case
      00966E CC 85 59         [ 2] 3695 UNIQ1:  JP     DROP
                                   3696 
                                   3697 ;       $,n     ( na -- )
                                   3698 ;       Build a new dictionary name
                                   3699 ;       using string at na.
                                   3700 ; compile dans l'espace des variables 
      009671 96 47                 3701         .word      LINK
                           0015F3  3702 LINK = . 
      009673 03                    3703         .byte      3
      009674 24 2C 6E              3704         .ascii     "$,n"
      009677                       3705 SNAME:
      009677 CD 85 63         [ 4] 3706         CALL     DUPP
      00967A CD 84 DA         [ 4] 3707         CALL     CAT     ;?null input
      00967D CD 84 67         [ 4] 3708         CALL     QBRAN
      009680 96 AD                 3709         .word      PNAM1
      009682 CD 96 4F         [ 4] 3710         CALL     UNIQU   ;?redefinition
      009685 CD 85 63         [ 4] 3711         CALL     DUPP
      009688 CD 8B 9C         [ 4] 3712         CALL     COUNT
      00968B CD 87 5E         [ 4] 3713         CALL     PLUS
      00968E CD 86 B1         [ 4] 3714         CALL     VPP
      009691 CD 84 A5         [ 4] 3715         CALL     STORE
      009694 CD 85 63         [ 4] 3716         CALL     DUPP
      009697 CD 86 CF         [ 4] 3717         CALL     LAST
      00969A CD 84 A5         [ 4] 3718         CALL     STORE   ;save na for vocabulary link
      00969D CD 8A 3C         [ 4] 3719         CALL     CELLM   ;link address
      0096A0 CD 86 A3         [ 4] 3720         CALL     CNTXT
      0096A3 CD 84 BC         [ 4] 3721         CALL     AT
      0096A6 CD 85 73         [ 4] 3722         CALL     SWAPP
      0096A9 CD 84 A5         [ 4] 3723         CALL     STORE
      0096AC 81               [ 4] 3724         RET     ;save code pointer
      0096AD CD 8F 61         [ 4] 3725 PNAM1:  CALL     STRQP
      0096B0 05                    3726         .byte      5
      0096B1 20 6E 61 6D 65        3727         .ascii     " name" ;null input
      0096B6 CC 93 4F         [ 2] 3728         JP     ABOR1
                                   3729 
                                   3730 ;; FORTH compiler
                                   3731 
                                   3732 ;       $COMPILE        ( a -- )
                                   3733 ;       Compile next word to
                                   3734 ;       dictionary as a token or literal.
      0096B9 96 73                 3735         .word      LINK
                           00163B  3736 LINK = . 
      0096BB 08                    3737         .byte      8
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      0096BC 24 43 4F 4D 50 49 4C  3738         .ascii     "$COMPILE"
             45
      0096C4                       3739 SCOMP:
      0096C4 CD 92 3B         [ 4] 3740         CALL     NAMEQ
      0096C7 CD 87 0D         [ 4] 3741         CALL     QDUP    ;?defined
      0096CA CD 84 67         [ 4] 3742         CALL     QBRAN
      0096CD 96 E5                 3743         .word      SCOM2
      0096CF CD 84 BC         [ 4] 3744         CALL     AT
      0096D2 CD 84 34         [ 4] 3745         CALL     DOLIT
      0096D5 80 00                 3746         .word     0x8000	;  IMEDD*256
      0096D7 CD 85 AF         [ 4] 3747         CALL     ANDD    ;?immediate
      0096DA CD 84 67         [ 4] 3748         CALL     QBRAN
      0096DD 96 E2                 3749         .word      SCOM1
      0096DF CC 84 8E         [ 2] 3750         JP     EXECU
      0096E2 CC 97 7C         [ 2] 3751 SCOM1:  JP     JSRC
      0096E5 CD 8D D9         [ 4] 3752 SCOM2:  CALL     NUMBQ   ;try to convert to number
      0096E8 CD 84 67         [ 4] 3753         CALL     QBRAN
      0096EB 93 4F                 3754         .word      ABOR1
      0096ED CC 94 EB         [ 2] 3755         JP     LITER
                                   3756 
                                   3757 ;       OVERT   ( -- )
                                   3758 ;       Link a new word into vocabulary.
      0096F0 96 BB                 3759         .word      LINK
                           001672  3760 LINK = . 
      0096F2 05                    3761         .byte      5
      0096F3 4F 56 45 52 54        3762         .ascii     "OVERT"
      0096F8                       3763 OVERT:
      0096F8 CD 86 CF         [ 4] 3764         CALL     LAST
      0096FB CD 84 BC         [ 4] 3765         CALL     AT
      0096FE CD 86 A3         [ 4] 3766         CALL     CNTXT
      009701 CC 84 A5         [ 2] 3767         JP     STORE
                                   3768 
                                   3769 ;       ;       ( -- )
                                   3770 ;       Terminate a colon definition.
      009704 96 F2                 3771         .word      LINK
                           001686  3772 LINK = . 
      009706 C1                    3773 	.byte      IMEDD+COMPO+1
      009707 3B                    3774         .ascii     ";"
      009708                       3775 SEMIS:
      009708 CD 94 C9         [ 4] 3776         CALL     COMPI
      00970B 84 9E                 3777         .word EXIT 
      00970D CD 93 B0         [ 4] 3778         CALL     LBRAC
      009710 CD 96 F8         [ 4] 3779         call OVERT 
      009713 CD A0 D8         [ 4] 3780         CALL FMOVE
      009716 CD 87 0D         [ 4] 3781         call QDUP 
      009719 CD 84 67         [ 4] 3782         call QBRAN 
      00971C 98 4C                 3783         .word SET_RAMLAST 
      00971E CD A1 6C         [ 4] 3784         CALL UPDATPTR
      009721 81               [ 4] 3785         RET 
                                   3786 
                                   3787 
                                   3788 ;       Terminate an ISR definition 
                                   3789 ;       retourn ca of ISR as double
                                   3790 ;       I; ( -- ud )
      009722 97 06                 3791         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



                           0016A4  3792         LINK=.
      009724 C2                    3793         .byte 2+IMEDD+COMPO 
      009725 49 3B                 3794         .ascii "I;" 
      009727                       3795 ISEMI:
      009727 1D 00 02         [ 2] 3796         subw x,#CELLL  
      00972A 90 AE 00 80      [ 2] 3797         ldw y,#IRET_CODE 
      00972E FF               [ 2] 3798         ldw (x),y 
      00972F CD 94 9B         [ 4] 3799         call CCOMMA
      009732 CD 93 B0         [ 4] 3800         call LBRAC 
      009735 CD A1 B1         [ 4] 3801         call IFMOVE
      009738 CD 87 0D         [ 4] 3802         call QDUP 
      00973B CD 84 67         [ 4] 3803         CALL QBRAN 
      00973E 98 4C                 3804         .word SET_RAMLAST
      009740 CD 86 BF         [ 4] 3805         CALL CPP
      009743 CD 84 BC         [ 4] 3806         call AT 
      009746 CD 85 73         [ 4] 3807         call SWAPP 
      009749 CD 86 BF         [ 4] 3808         CALL CPP 
      00974C CD 84 A5         [ 4] 3809         call STORE 
      00974F CD 9B F5         [ 4] 3810         call UPDATCP 
      009752 CD 9B B2         [ 4] 3811         call EEPVP 
      009755 CD 85 59         [ 4] 3812         call DROP 
      009758 CD 84 BC         [ 4] 3813         call AT 
      00975B CD 86 B1         [ 4] 3814         call VPP 
      00975E CD 84 A5         [ 4] 3815         call STORE 
      009761 CC 8A C4         [ 2] 3816         jp ZERO
      009764 81               [ 4] 3817         ret           
                                   3818         
                                   3819 
                                   3820 ;       ]       ( -- )
                                   3821 ;       Start compiling words in
                                   3822 ;       input stream.
      009765 97 24                 3823         .word      LINK
                           0016E7  3824 LINK = . 
      009767 01                    3825         .byte      1
      009768 5D                    3826         .ascii     "]"
      009769                       3827 RBRAC:
      009769 CD 84 34         [ 4] 3828         CALL   DOLIT
      00976C 96 C4                 3829         .word  SCOMP
      00976E CD 86 81         [ 4] 3830         CALL   TEVAL
      009771 CC 84 A5         [ 2] 3831         JP     STORE
                                   3832 
                                   3833 ;       CALL,    ( ca -- )
                                   3834 ;       Compile a subroutine call.
      009774 97 67                 3835         .word      LINK
                           0016F6  3836 LINK = . 
      009776 05                    3837         .byte      5
      009777 43 41 4C 4C 2C        3838         .ascii     "CALL,"
      00977C                       3839 JSRC:
      00977C CD 84 34         [ 4] 3840         CALL     DOLIT
      00977F 00 CD                 3841         .word     CALLL     ;CALL
      009781 CD 94 9B         [ 4] 3842         CALL     CCOMMA
      009784 CC 94 84         [ 2] 3843         JP     COMMA
                                   3844 
                                   3845 ;       INIT-OFS ( -- )
                                   3846 ;       compute offset to adjust jump address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



                                   3847 ;       set variable OFFSET 
      009787 97 76                 3848         .word LINK 
                           001709  3849         LINK=.
      009789 08                    3850         .byte 8 
      00978A 49 4E 49 54 2D 4F 46  3851         .ascii "INIT-OFS" 
             53
      009792                       3852 INITOFS:
      009792 CD 86 70         [ 4] 3853         call TFLASH 
      009795 CD 84 BC         [ 4] 3854         CALL AT 
      009798 CD 85 63         [ 4] 3855         CALL DUPP 
      00979B CD 84 67         [ 4] 3856         call QBRAN
      00979E 97 AF                 3857         .word 1$
      0097A0 CD 85 59         [ 4] 3858         call DROP  
      0097A3 CD 86 BF         [ 4] 3859         call CPP 
      0097A6 CD 84 BC         [ 4] 3860         call AT 
      0097A9 CD 8B B3         [ 4] 3861         call HERE
      0097AC CD 87 D7         [ 4] 3862         call SUBB 
      0097AF CD 86 F4         [ 4] 3863 1$:     call OFFSET 
      0097B2 CC 84 A5         [ 2] 3864         jp STORE  
                                   3865 
                                   3866 ;       :       ( -- ; <string> )
                                   3867 ;       Start a new colon definition
                                   3868 ;       using next word as its name.
      0097B5 97 89                 3869         .word      LINK
                           001737  3870 LINK = . 
      0097B7 01                    3871         .byte      1
      0097B8 3A                    3872         .ascii     ":"
      0097B9                       3873 COLON:
      0097B9 CD 97 92         [ 4] 3874         call INITOFS       
      0097BC CD 91 3E         [ 4] 3875         CALL   TOKEN
      0097BF CD 96 77         [ 4] 3876         CALL   SNAME
      0097C2 CC 97 69         [ 2] 3877         JP     RBRAC
                                   3878 
                                   3879 ;       I:  ( -- )
                                   3880 ;       Start interrupt service routine definition
                                   3881 ;       those definition have no name.
      0097C5 97 B7                 3882         .word LINK
                           001747  3883         LINK=.
      0097C7 02                    3884         .byte 2 
      0097C8 49 3A                 3885         .ascii "I:" 
      0097CA                       3886 ICOLON:
      0097CA CD 97 92         [ 4] 3887         call INITOFS 
      0097CD CC 97 69         [ 2] 3888         jp RBRAC  
                                   3889 
                                   3890 ;       IMMEDIATE       ( -- )
                                   3891 ;       Make last compiled word
                                   3892 ;       an immediate word.
      0097D0 97 C7                 3893         .word      LINK
                           001752  3894 LINK = . 
      0097D2 09                    3895         .byte      9
      0097D3 49 4D 4D 45 44 49 41  3896         .ascii     "IMMEDIATE"
             54 45
      0097DC                       3897 IMMED:
      0097DC CD 84 34         [ 4] 3898         CALL     DOLIT
      0097DF 80 00                 3899         .word     0x8000	;  IMEDD*256
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



      0097E1 CD 86 CF         [ 4] 3900         CALL     LAST
      0097E4 CD 84 BC         [ 4] 3901         CALL     AT
      0097E7 CD 84 BC         [ 4] 3902         CALL     AT
      0097EA CD 85 C3         [ 4] 3903         CALL     ORR
      0097ED CD 86 CF         [ 4] 3904         CALL     LAST
      0097F0 CD 84 BC         [ 4] 3905         CALL     AT
      0097F3 CC 84 A5         [ 2] 3906         JP     STORE
                                   3907 
                                   3908 ;; Defining words
                                   3909 
                                   3910 ;       CREATE  ( -- ; <string> )
                                   3911 ;       Compile a new array
                                   3912 ;       without allocating space.
      0097F6 97 D2                 3913         .word      LINK
                           001778  3914 LINK = . 
      0097F8 06                    3915         .byte      6
      0097F9 43 52 45 41 54 45     3916         .ascii     "CREATE"
      0097FF                       3917 CREAT:
      0097FF CD 91 3E         [ 4] 3918         CALL     TOKEN
      009802 CD 96 77         [ 4] 3919         CALL     SNAME
      009805 CD 96 F8         [ 4] 3920         CALL     OVERT        
      009808 CD 94 C9         [ 4] 3921         CALL     COMPI 
      00980B 86 10                 3922         .word DOVAR 
      00980D 81               [ 4] 3923         RET
                                   3924 
                                   3925 ;       VARIABLE        ( -- ; <string> )
                                   3926 ;       Compile a new variable
                                   3927 ;       initialized to 0.
      00980E 97 F8                 3928         .word      LINK
                           001790  3929 LINK = . 
      009810 08                    3930         .byte      8
      009811 56 41 52 49 41 42 4C  3931         .ascii     "VARIABLE"
             45
      009819                       3932 VARIA:
                                   3933 ; indirect variable so that VARIABLE definition can be compiled in FLASH 
      009819 CD 8B B3         [ 4] 3934         CALL HERE
      00981C CD 85 63         [ 4] 3935         CALL DUPP 
      00981F CD 8A 2D         [ 4] 3936         CALL CELLP
      009822 CD 86 B1         [ 4] 3937         CALL VPP 
      009825 CD 84 A5         [ 4] 3938         CALL STORE
      009828 CD 97 FF         [ 4] 3939         CALL CREAT
      00982B CD 85 63         [ 4] 3940         CALL DUPP
      00982E CD 94 84         [ 4] 3941         CALL COMMA
      009831 CD 8A C4         [ 4] 3942         CALL ZERO
      009834 CD 85 73         [ 4] 3943         call SWAPP 
      009837 CD 84 A5         [ 4] 3944         CALL STORE
      00983A CD A0 D8         [ 4] 3945         CALL FMOVE ; move definition to FLASH
      00983D CD 87 0D         [ 4] 3946         CALL QDUP 
      009840 CD 84 67         [ 4] 3947         CALL QBRAN 
      009843 98 4C                 3948         .word SET_RAMLAST   
      009845 CD 9C 0C         [ 4] 3949         call UPDATVP  ; don't update if variable kept in RAM.
      009848 CD A1 6C         [ 4] 3950         CALL UPDATPTR
      00984B 81               [ 4] 3951         RET         
      00984C                       3952 SET_RAMLAST: 
      00984C CD 86 CF         [ 4] 3953         CALL LAST 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      00984F CD 84 BC         [ 4] 3954         CALL AT 
      009852 CD 86 E2         [ 4] 3955         CALL RAMLAST 
      009855 CC 84 A5         [ 2] 3956         jp STORE  
                                   3957 
                                   3958 
                                   3959 ;       CONSTANT  ( n -- ; <string> )
                                   3960 ;       Compile a new constant 
                                   3961 ;       n CONSTANT name 
      009858 98 10                 3962         .word LINK 
                           0017DA  3963         LINK=. 
      00985A 08                    3964         .byte 8 
      00985B 43 4F 4E 53 54 41 4E  3965         .ascii "CONSTANT" 
             54
      009863                       3966 CONSTANT:          
      009863 CD 91 3E         [ 4] 3967         CALL TOKEN
      009866 CD 96 77         [ 4] 3968         CALL SNAME 
      009869 CD 96 F8         [ 4] 3969         CALL OVERT 
      00986C CD 94 C9         [ 4] 3970         CALL COMPI 
      00986F 98 8D                 3971         .word DOCONST
      009871 CD 94 84         [ 4] 3972         CALL COMMA 
      009874 CD A0 D8         [ 4] 3973         CALL FMOVE
      009877 CD 87 0D         [ 4] 3974         CALL QDUP 
      00987A CD 84 67         [ 4] 3975         CALL QBRAN 
      00987D 98 4C                 3976         .word SET_RAMLAST  
      00987F CD A1 6C         [ 4] 3977         CALL UPDATPTR  
      009882 81               [ 4] 3978 1$:     RET          
                                   3979 
                                   3980 ; CONSTANT runtime semantic 
                                   3981 ; doCONST  ( -- n )
      009883 98 5A                 3982         .word LINK 
                           001805  3983         LINK=.
      009885 07                    3984         .byte 7
      009886 44 4F 43 4F 4E 53 54  3985         .ascii "DOCONST"
      00988D                       3986 DOCONST:
      00988D 1D 00 02         [ 2] 3987         subw x,#CELLL
      009890 90 85            [ 2] 3988         popw y 
      009892 90 FE            [ 2] 3989         ldw y,(y) 
      009894 FF               [ 2] 3990         ldw (x),y 
      009895 81               [ 4] 3991         ret 
                                   3992 
                                   3993 
                                   3994 ;; Tools
                                   3995 
                                   3996 ;       _TYPE   ( b u -- )
                                   3997 ;       Display a string. Filter
                                   3998 ;       non-printing characters.
      009896 98 85                 3999         .word      LINK
                           001818  4000 LINK = . 
      009898 05                    4001         .byte      5
      009899 5F 54 59 50 45        4002         .ascii     "_TYPE"
      00989E                       4003 UTYPE:
      00989E CD 85 2C         [ 4] 4004         CALL     TOR     ;start count down loop
      0098A1 20 0F            [ 2] 4005         JRA     UTYP2   ;skip first pass
      0098A3 CD 85 63         [ 4] 4006 UTYP1:  CALL     DUPP
      0098A6 CD 84 DA         [ 4] 4007         CALL     CAT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      0098A9 CD 8A EE         [ 4] 4008         CALL     TCHAR
      0098AC CD 84 1E         [ 4] 4009         CALL     EMIT    ;display only printable
      0098AF CD 8A 58         [ 4] 4010         CALL     ONEP    ;increment address
      0098B2 CD 84 48         [ 4] 4011 UTYP2:  CALL     DONXT
      0098B5 98 A3                 4012         .word      UTYP1   ;loop till done
      0098B7 CC 85 59         [ 2] 4013         JP     DROP
                                   4014 
                                   4015 ;       dm+     ( a u -- a )
                                   4016 ;       Dump u bytes from ,
                                   4017 ;       leaving a+u on  stack.
      0098BA 98 98                 4018         .word      LINK
                           00183C  4019 LINK = . 
      0098BC 03                    4020         .byte      3
      0098BD 64 6D 2B              4021         .ascii     "dm+"
      0098C0                       4022 DUMPP:
      0098C0 CD 85 8D         [ 4] 4023         CALL     OVER
      0098C3 CD 84 34         [ 4] 4024         CALL     DOLIT
      0098C6 00 04                 4025         .word      4
      0098C8 CD 8F 94         [ 4] 4026         CALL     UDOTR   ;display address
      0098CB CD 8E E4         [ 4] 4027         CALL     SPACE
      0098CE CD 85 2C         [ 4] 4028         CALL     TOR     ;start count down loop
      0098D1 20 11            [ 2] 4029         JRA     PDUM2   ;skip first pass
      0098D3 CD 85 63         [ 4] 4030 PDUM1:  CALL     DUPP
      0098D6 CD 84 DA         [ 4] 4031         CALL     CAT
      0098D9 CD 84 34         [ 4] 4032         CALL     DOLIT
      0098DC 00 03                 4033         .word      3
      0098DE CD 8F 94         [ 4] 4034         CALL     UDOTR   ;display numeric data
      0098E1 CD 8A 58         [ 4] 4035         CALL     ONEP    ;increment address
      0098E4 CD 84 48         [ 4] 4036 PDUM2:  CALL     DONXT
      0098E7 98 D3                 4037         .word      PDUM1   ;loop till done
      0098E9 81               [ 4] 4038         RET
                                   4039 
                                   4040 ;       DUMP    ( a u -- )
                                   4041 ;       Dump u bytes from a,
                                   4042 ;       in a formatted manner.
      0098EA 98 BC                 4043         .word      LINK
                           00186C  4044 LINK = . 
      0098EC 04                    4045         .byte      4
      0098ED 44 55 4D 50           4046         .ascii     "DUMP"
      0098F1                       4047 DUMP:
      0098F1 CD 86 20         [ 4] 4048         CALL     BASE
      0098F4 CD 84 BC         [ 4] 4049         CALL     AT
      0098F7 CD 85 2C         [ 4] 4050         CALL     TOR
      0098FA CD 8D 6C         [ 4] 4051         CALL     HEX     ;save radix, set hex
      0098FD CD 84 34         [ 4] 4052         CALL     DOLIT
      009900 00 10                 4053         .word      16
      009902 CD 89 7E         [ 4] 4054         CALL     SLASH   ;change count to lines
      009905 CD 85 2C         [ 4] 4055         CALL     TOR     ;start count down loop
      009908 CD 8F 2C         [ 4] 4056 DUMP1:  CALL     CR
      00990B CD 84 34         [ 4] 4057         CALL     DOLIT
      00990E 00 10                 4058         .word      16
      009910 CD 87 49         [ 4] 4059         CALL     DDUP
      009913 CD 98 C0         [ 4] 4060         CALL     DUMPP   ;display numeric
      009916 CD 87 1E         [ 4] 4061         CALL     ROT
      009919 CD 87 1E         [ 4] 4062         CALL     ROT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



      00991C CD 8E E4         [ 4] 4063         CALL     SPACE
      00991F CD 8E E4         [ 4] 4064         CALL     SPACE
      009922 CD 98 9E         [ 4] 4065         CALL     UTYPE   ;display printable characters
      009925 CD 84 48         [ 4] 4066         CALL     DONXT
      009928 99 08                 4067         .word      DUMP1   ;loop till done
      00992A CD 85 59         [ 4] 4068 DUMP3:  CALL     DROP
      00992D CD 85 0D         [ 4] 4069         CALL     RFROM
      009930 CD 86 20         [ 4] 4070         CALL     BASE
      009933 CC 84 A5         [ 2] 4071         JP     STORE   ;restore radix
                                   4072 
                                   4073 ;       .S      ( ... -- ... )
                                   4074 ;        Display  contents of stack.
      009936 98 EC                 4075         .word      LINK
                           0018B8  4076 LINK = . 
      009938 02                    4077         .byte      2
      009939 2E 53                 4078         .ascii     ".S"
      00993B                       4079 DOTS:
      00993B CD 8F 2C         [ 4] 4080         CALL     CR
      00993E CD 8B 07         [ 4] 4081         CALL     DEPTH   ;stack depth
      009941 CD 85 2C         [ 4] 4082         CALL     TOR     ;start count down loop
      009944 20 09            [ 2] 4083         JRA     DOTS2   ;skip first pass
      009946 CD 85 20         [ 4] 4084 DOTS1:  CALL     RAT
      009949 CD 8B 1E         [ 4] 4085 	CALL     PICK
      00994C CD 8F C7         [ 4] 4086         CALL     DOT     ;index stack, display contents
      00994F CD 84 48         [ 4] 4087 DOTS2:  CALL     DONXT
      009952 99 46                 4088         .word      DOTS1   ;loop till done
      009954 CD 8F 6B         [ 4] 4089         CALL     DOTQP
      009957 05                    4090         .byte      5
      009958 20 3C 73 70 20        4091         .ascii     " <sp "
      00995D 81               [ 4] 4092         RET
                                   4093 
                                   4094 ;       >NAME   ( ca -- na | F )
                                   4095 ;       Convert code address
                                   4096 ;       to a name address.
      00995E 99 38                 4097         .word      LINK
                           0018E0  4098 LINK = . 
      009960 05                    4099         .byte      5
      009961 3E 4E 41 4D 45        4100         .ascii     ">NAME"
      009966                       4101 TNAME:
      009966 CD 86 A3         [ 4] 4102         CALL     CNTXT   ;vocabulary link
      009969 CD 84 BC         [ 4] 4103 TNAM2:  CALL     AT
      00996C CD 85 63         [ 4] 4104         CALL     DUPP    ;?last word in a vocabulary
      00996F CD 84 67         [ 4] 4105         CALL     QBRAN
      009972 99 8D                 4106         .word      TNAM4
      009974 CD 87 49         [ 4] 4107         CALL     DDUP
      009977 CD 91 4C         [ 4] 4108         CALL     NAMET
      00997A CD 85 D8         [ 4] 4109         CALL     XORR    ;compare
      00997D CD 84 67         [ 4] 4110         CALL     QBRAN
      009980 99 87                 4111         .word      TNAM3
      009982 CD 8A 3C         [ 4] 4112         CALL     CELLM   ;continue with next word
      009985 20 E2            [ 2] 4113         JRA     TNAM2
      009987 CD 85 73         [ 4] 4114 TNAM3:  CALL     SWAPP
      00998A CC 85 59         [ 2] 4115         JP     DROP
      00998D CD 87 3E         [ 4] 4116 TNAM4:  CALL     DDROP
      009990 CC 8A C4         [ 2] 4117         JP     ZERO
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



                                   4118 
                                   4119 ;       .ID     ( na -- )
                                   4120 ;        Display  name at address.
      009993 99 60                 4121         .word      LINK
                           001915  4122 LINK = . 
      009995 03                    4123         .byte      3
      009996 2E 49 44              4124         .ascii     ".ID"
      009999                       4125 DOTID:
      009999 CD 87 0D         [ 4] 4126         CALL     QDUP    ;if zero no name
      00999C CD 84 67         [ 4] 4127         CALL     QBRAN
      00999F 99 AF                 4128         .word      DOTI1
      0099A1 CD 8B 9C         [ 4] 4129         CALL     COUNT
      0099A4 CD 84 34         [ 4] 4130         CALL     DOLIT
      0099A7 00 1F                 4131         .word      0x1F
      0099A9 CD 85 AF         [ 4] 4132         CALL     ANDD    ;mask lexicon bits
      0099AC CC 98 9E         [ 2] 4133         JP     UTYPE
      0099AF CD 8F 6B         [ 4] 4134 DOTI1:  CALL     DOTQP
      0099B2 09                    4135         .byte      9
      0099B3 20 6E 6F 4E 61 6D 65  4136         .ascii     " noName"
      0099BA 81               [ 4] 4137         RET
                                   4138 
                           000000  4139 WANT_SEE=0 
                           000000  4140 .if WANT_SEE 
                                   4141 ;       SEE     ( -- ; <string> )
                                   4142 ;       A simple decompiler.
                                   4143 ;       Updated for byte machines.
                                   4144         .word      LINK
                                   4145 LINK = . 
                                   4146         .byte      3
                                   4147         .ascii     "SEE"
                                   4148 SEE:
                                   4149         CALL     TICK    ;starting address
                                   4150         CALL     CR
                                   4151         CALL     ONEM
                                   4152 SEE1:   CALL     ONEP
                                   4153         CALL     DUPP
                                   4154         CALL     AT
                                   4155         CALL     DUPP    ;?does it contain a zero
                                   4156         CALL     QBRAN
                                   4157         .word    SEE2
                                   4158         CALL     TNAME   ;?is it a name
                                   4159 SEE2:   CALL     QDUP    ;name address or zero
                                   4160         CALL     QBRAN
                                   4161         .word    SEE3
                                   4162         CALL     SPACE
                                   4163         CALL     DOTID   ;display name
                                   4164         CALL     ONEP
                                   4165         JRA      SEE4
                                   4166 SEE3:   CALL     DUPP
                                   4167         CALL     CAT
                                   4168         CALL     UDOT    ;display number
                                   4169 SEE4:   CALL     NUFQ    ;user control
                                   4170         CALL     QBRAN
                                   4171         .word    SEE1
                                   4172         JP     DROP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



                                   4173 .endif ; WANT_SEE 
                                   4174 
                                   4175 ;       WORDS   ( -- )
                                   4176 ;       Display names in vocabulary.
      0099BB 99 95                 4177         .word      LINK
                           00193D  4178 LINK = . 
      0099BD 05                    4179         .byte      5
      0099BE 57 4F 52 44 53        4180         .ascii     "WORDS"
      0099C3                       4181 WORDS:
      0099C3 CD 8F 2C         [ 4] 4182         CALL     CR
      0099C6 CD 86 A3         [ 4] 4183         CALL     CNTXT   ;only in context
      0099C9 CD 84 BC         [ 4] 4184 WORS1:  CALL     AT
      0099CC CD 87 0D         [ 4] 4185         CALL     QDUP    ;?at end of list
      0099CF CD 84 67         [ 4] 4186         CALL     QBRAN
      0099D2 99 E5                 4187         .word      WORS2
      0099D4 CD 85 63         [ 4] 4188         CALL     DUPP
      0099D7 CD 8E E4         [ 4] 4189         CALL     SPACE
      0099DA CD 99 99         [ 4] 4190         CALL     DOTID   ;display a name
      0099DD CD 8A 3C         [ 4] 4191         CALL     CELLM
      0099E0 CD 84 7E         [ 4] 4192         CALL     BRAN
      0099E3 99 C9                 4193         .word      WORS1
      0099E5 81               [ 4] 4194 WORS2:  RET
                                   4195 
                                   4196         
                                   4197 ;; Hardware reset
                                   4198 
                                   4199 ;       hi      ( -- )
                                   4200 ;       Display sign-on message.
      0099E6 99 BD                 4201         .word      LINK
                           001968  4202 LINK = . 
      0099E8 02                    4203         .byte      2
      0099E9 68 69                 4204         .ascii     "hi"
      0099EB                       4205 HI:
      0099EB CD 8F 2C         [ 4] 4206         CALL     CR
      0099EE CD 8F 6B         [ 4] 4207         CALL     DOTQP   ;initialize I/O
      0099F1 0F                    4208         .byte      15
      0099F2 73 74 6D 38 65 46 6F  4209         .ascii     "stm8eForth v"
             72 74 68 20 76
      0099FE 33                    4210 	.byte      VER+'0'
      0099FF 2E                    4211         .byte      '.' 
      009A00 30                    4212 	.byte      EXT+'0' ;version
      009A01 CC 8F 2C         [ 2] 4213         JP     CR
                                   4214 
                           000000  4215 WANT_DEBUG=0
                           000000  4216 .if WANT_DEBUG 
                                   4217 ;       DEBUG      ( -- )
                                   4218 ;       Display sign-on message.
                                   4219 ;        .word      LINK
                                   4220 LINK = . 
                                   4221         .byte      5
                                   4222         .ascii     "DEBUG"
                                   4223 DEBUG:
                                   4224 	CALL DOLIT
                                   4225 	.word 0x65
                                   4226 	CALL EMIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



                                   4227 	CALL DOLIT
                                   4228 	.word 0
                                   4229  	CALL ZLESS 
                                   4230 	CALL DOLIT
                                   4231 	.word 0xFFFE
                                   4232 	CALL ZLESS 
                                   4233 	CALL UPLUS 
                                   4234  	CALL DROP 
                                   4235 	CALL DOLIT
                                   4236 	.word 3
                                   4237 	CALL UPLUS 
                                   4238 	CALL UPLUS 
                                   4239  	CALL DROP
                                   4240 	CALL DOLIT
                                   4241 	.word 0x43
                                   4242 	CALL UPLUS 
                                   4243  	CALL DROP
                                   4244 	CALL EMIT
                                   4245 	CALL DOLIT
                                   4246 	.word 0x4F
                                   4247 	CALL DOLIT
                                   4248 	.word 0x6F
                                   4249  	CALL XORR
                                   4250 	CALL DOLIT
                                   4251 	.word 0xF0
                                   4252  	CALL ANDD
                                   4253 	CALL DOLIT
                                   4254 	.word 0x4F
                                   4255  	CALL ORR
                                   4256 	CALL EMIT
                                   4257 	CALL DOLIT
                                   4258 	.word 8
                                   4259 	CALL DOLIT
                                   4260 	.word 6
                                   4261  	CALL SWAPP
                                   4262 	CALL OVER
                                   4263 	CALL XORR
                                   4264 	CALL DOLIT
                                   4265 	.word 3
                                   4266 	CALL ANDD 
                                   4267 	CALL ANDD
                                   4268 	CALL DOLIT
                                   4269 	.word 0x70
                                   4270 	CALL UPLUS 
                                   4271 	CALL DROP
                                   4272 	CALL EMIT
                                   4273 	CALL DOLIT
                                   4274 	.word 0
                                   4275 	CALL QBRAN
                                   4276 	.word DEBUG1
                                   4277 	CALL DOLIT
                                   4278 	.word 0x3F
                                   4279 DEBUG1:
                                   4280 	CALL DOLIT
                                   4281 	.word 0xFFFF
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



                                   4282 	CALL QBRAN
                                   4283 	.word DEBUG2
                                   4284 	CALL DOLIT
                                   4285 	.word 0x74
                                   4286 	CALL BRAN
                                   4287 	.word DEBUG3
                                   4288 DEBUG2:
                                   4289 	CALL DOLIT
                                   4290 	.word 0x21
                                   4291 DEBUG3:
                                   4292 	CALL EMIT
                                   4293 	CALL DOLIT
                                   4294 	.word 0x68
                                   4295 	CALL DOLIT
                                   4296 	.word 0x80
                                   4297 	CALL STORE
                                   4298 	CALL DOLIT
                                   4299 	.word 0x80
                                   4300 	CALL AT
                                   4301 	CALL EMIT
                                   4302 	CALL DOLIT
                                   4303 	.word 0x4D
                                   4304 	CALL TOR
                                   4305 	CALL RAT
                                   4306 	CALL RFROM
                                   4307 	CALL ANDD
                                   4308 	CALL EMIT
                                   4309 	CALL DOLIT
                                   4310 	.word 0x61
                                   4311 	CALL DOLIT
                                   4312 	.word 0xA
                                   4313 	CALL TOR
                                   4314 DEBUG4:
                                   4315 	CALL DOLIT
                                   4316 	.word 1
                                   4317 	CALL UPLUS 
                                   4318 	CALL DROP
                                   4319 	CALL DONXT
                                   4320 	.word DEBUG4
                                   4321 	CALL EMIT
                                   4322 	CALL DOLIT
                                   4323 	.word 0x656D
                                   4324 	CALL DOLIT
                                   4325 	.word 0x100
                                   4326 	CALL UMSTA
                                   4327 	CALL SWAPP
                                   4328 	CALL DOLIT
                                   4329 	.word 0x100
                                   4330 	CALL UMSTA
                                   4331 	CALL SWAPP 
                                   4332 	CALL DROP
                                   4333 	CALL EMIT
                                   4334 	CALL EMIT
                                   4335 	CALL DOLIT
                                   4336 	.word 0x2043
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



                                   4337 	CALL DOLIT
                                   4338 	.word 0
                                   4339 	CALL DOLIT
                                   4340 	.word 0x100
                                   4341 	CALL UMMOD
                                   4342 	CALL EMIT
                                   4343 	CALL EMIT
                                   4344 	;JP ORIG
                                   4345 	RET
                                   4346 .endif ; WANT_DEBUG 
                                   4347 
                                   4348 
                                   4349 ;       'BOOT   ( -- a )
                                   4350 ;       The application startup vector.
      009A04 99 E8                 4351         .word      LINK
                           001986  4352 LINK = . 
      009A06 05                    4353         .byte      5
      009A07 27 42 4F 4F 54        4354         .ascii     "'BOOT"
      009A0C                       4355 TBOOT:
      009A0C CD 86 10         [ 4] 4356         CALL     DOVAR
      009A0F 40 02                 4357         .word    APP_RUN      ;application to boot
                                   4358 
                                   4359 ;       COLD    ( -- )
                                   4360 ;       The hilevel cold start s=ence.
      009A11 9A 06                 4361         .word      LINK
                           001993  4362         LINK = . 
      009A13 04                    4363         .byte      4
      009A14 43 4F 4C 44           4364         .ascii     "COLD"
      009A18                       4365 COLD:
                           000000  4366 .if WANT_DEBUG
                                   4367         CALL DEBUG
                                   4368 .endif ; WANT_DEBUG
      009A18 CD 84 34         [ 4] 4369 COLD1:  CALL     DOLIT
      009A1B 80 AB                 4370         .word      UZERO
      009A1D CD 84 34         [ 4] 4371 	CALL     DOLIT
      009A20 00 06                 4372         .word      UPP
      009A22 CD 84 34         [ 4] 4373         CALL     DOLIT
      009A25 00 1A                 4374 	.word      UEND-UZERO
      009A27 CD 8C 00         [ 4] 4375         CALL     CMOVE   ;initialize user area
                                   4376 
                                   4377 ; if APP_RUN==0 initialize with ca de 'hi'  
      009A2A 90 CE 40 02      [ 2] 4378         ldw y,APP_RUN 
      009A2E 26 0B            [ 1] 4379         jrne 0$
      009A30 1D 00 02         [ 2] 4380         subw x,#CELLL 
      009A33 90 AE 99 EB      [ 2] 4381         ldw y,#HI  
      009A37 FF               [ 2] 4382         ldw (x),y
      009A38 CD 9B E4         [ 4] 4383         call UPDATRUN 
      009A3B                       4384 0$:        
                                   4385 ; update LAST with APP_LAST 
                                   4386 ; if APP_LAST > LAST else do the opposite
      009A3B 90 CE 40 00      [ 2] 4387         ldw y,APP_LAST 
      009A3F 90 B3 1A         [ 2] 4388         cpw y,ULAST 
      009A42 22 05            [ 1] 4389         jrugt 1$ 
                                   4390 ; save LAST at APP_LAST  
      009A44 CD 9B CC         [ 4] 4391         call UPDATLAST 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



      009A47 20 06            [ 2] 4392         jra 2$
      009A49                       4393 1$: ; update LAST with APP_LAST 
      009A49 90 BF 1A         [ 2] 4394         ldw ULAST,y
      009A4C 90 BF 14         [ 2] 4395         ldw UCNTXT,y
      009A4F                       4396 2$:  
                                   4397 ; update APP_CP if < app_space 
      009A4F 90 CE 40 04      [ 2] 4398         ldw y,APP_CP  
      009A53 90 B3 18         [ 2] 4399         cpw y,UCP   
      009A56 24 06            [ 1] 4400         jruge 3$ 
      009A58 CD 9B F5         [ 4] 4401         call UPDATCP
      009A5B 90 BE 18         [ 2] 4402         ldw y,UCP   
      009A5E                       4403 3$:
      009A5E 90 BF 18         [ 2] 4404         ldw UCP,y                 
                                   4405 ; update UVP with APP_VP  
                                   4406 ; if APP_VP>UVP else do the opposite 
      009A61 90 CE 40 06      [ 2] 4407         ldw y,APP_VP 
      009A65 90 B3 16         [ 2] 4408         cpw y,UVP 
      009A68 22 05            [ 1] 4409         jrugt 4$
      009A6A CD 9C 0C         [ 4] 4410         call UPDATVP 
      009A6D 20 03            [ 2] 4411         jra 6$
      009A6F                       4412 4$: ; update UVP with APP_VP 
      009A6F 90 BF 16         [ 2] 4413         ldw UVP,y 
      009A72                       4414 6$:      
      009A72 CD 94 2F         [ 4] 4415         CALL     PRESE   ;initialize data stack and TIB
      009A75 CD 9A 0C         [ 4] 4416         CALL     TBOOT
      009A78 CD 8B E9         [ 4] 4417         CALL     ATEXE   ;application boot
      009A7B CD 96 F8         [ 4] 4418         CALL     OVERT
      009A7E CC 94 4C         [ 2] 4419         JP     QUIT    ;start interpretation
                                   4420 
                           000001  4421 WANT_MATH_CONST = 1 
                           000001  4422 .if WANT_MATH_CONST 
                                   4423         ; irrational constants 
                                   4424         ; approximation by integers ratio.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



                                   4425         .include "const_ratio.asm"
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
      009A81 9A 13                   31         .word LINK 
                           001A03    32         LINK=.
      009A83 02                      33         .byte 2
      009A84 50 49                   34         .ascii "PI" 
      009A86                         35 PII:
      009A86 1D 00 04         [ 2]   36         subw x,#2*CELLL 
      009A89 90 AE 01 63      [ 2]   37         ldw y,#355 
      009A8D EF 02            [ 2]   38         ldw (2,x),y 
      009A8F 90 AE 00 71      [ 2]   39         ldw y,#113 
      009A93 FF               [ 2]   40         ldw (x),y 
      009A94 81               [ 4]   41         ret 
                                     42 
                                     43 ;      SQRT2 ( -- 19601  13860 )
                                     44 ; precision: 1.5e-9 
                                     45 ; usage example to compute Voltage peek to peek from Vrms 
                                     46 ; : VPP SQRT2 */ 2 * ;
                                     47 ;
      009A95 9A 83                   48         .word LINK 
                           001A17    49         LINK=.
      009A97 05                      50         .byte 5 
      009A98 53 51 52 54 32          51         .ascii "SQRT2" 
      009A9D                         52 SQRT2:
      009A9D 1D 00 04         [ 2]   53         subw x,#2*CELLL 
      009AA0 90 AE 4C 91      [ 2]   54         ldw y,#19601 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



      009AA4 EF 02            [ 2]   55         ldw (2,x),y 
      009AA6 90 AE 36 24      [ 2]   56         ldw y,#13860 
      009AAA FF               [ 2]   57         ldw (x),y 
      009AAB 81               [ 4]   58         ret 
                                     59 
                                     60 ;   SQRT3 ( -- 18817 10864 )
                                     61 ; precision: 1.1e-9
                                     62 ;
      009AAC 9A 97                   63         .word LINK 
                           001A2E    64         LINK=.
      009AAE 05                      65         .byte 5
      009AAF 53 51 52 54 33          66         .ascii "SQRT3" 
      009AB4                         67 SQRT3: 
      009AB4 1D 00 04         [ 2]   68     subw x,#2*CELLL 
      009AB7 90 AE 49 81      [ 2]   69     ldw y,#18817 
      009ABB EF 02            [ 2]   70     ldw (2,x),y 
      009ABD 90 AE 2A 70      [ 2]   71     ldw y,#10864 
      009AC1 FF               [ 2]   72     ldw (x),y 
      009AC2 81               [ 4]   73     ret 
                                     74 
                                     75 ;   E ( -- 28667 10546 )
                                     76 ; precision: 5.5e-9 
                                     77 ; natural log base 
      009AC3 9A AE                   78         .word LINK 
                           001A45    79         LINK=.
      009AC5 01                      80         .byte 1
      009AC6 45                      81         .ascii "E" 
      009AC7                         82 ENEPER:
      009AC7 1D 00 04         [ 2]   83     subw x,#2*CELLL 
      009ACA 90 AE 6F FB      [ 2]   84     ldw y,#28667 
      009ACE EF 02            [ 2]   85     ldw (2,x),y 
      009AD0 90 AE 29 32      [ 2]   86     ldw y,#10546 
      009AD4 FF               [ 2]   87     ldw (x),y 
      009AD5 81               [ 4]   88     ret 
                                     89 
                                     90 ;   SQRT10 ( -- 22936 7253 )
                                     91 ; precision: 5.7e-9 
      009AD6 9A C5                   92         .word LINK 
                           001A58    93         LINK=.
      009AD8 06                      94         .byte 6 
      009AD9 53 51 52 54 31 30       95         .ascii "SQRT10" 
      009ADF                         96 SQRT10:
      009ADF 1D 00 04         [ 2]   97     subw x,#2*CELLL
      009AE2 90 AE 59 98      [ 2]   98     ldw y,#22936 
      009AE6 EF 02            [ 2]   99     ldw (2,x),y 
      009AE8 90 AE 1C 55      [ 2]  100     ldw y,#7253
      009AEC FF               [ 2]  101     ldw (x),y 
      009AED 81               [ 4]  102     ret 
                                    103 
                                    104 ;   SQRT12 ( -- 26797 25293 )
                                    105 ; precision: 1.0e-9 
                                    106 ; used in music to compute well tempered scale
      009AEE 9A D8                  107         .word LINK 
                           001A70   108         LINK=. 
      009AF0 05                     109         .byte 5 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



      009AF1 31 32 52 54 32         110         .ascii "12RT2"
      009AF6                        111 RT12_2:
      009AF6 1D 00 04         [ 2]  112     subw x,#2*CELLL 
      009AF9 90 AE 68 AD      [ 2]  113     ldw y,#26797
      009AFD EF 02            [ 2]  114     ldw (2,x),y 
      009AFF 90 AE 62 CD      [ 2]  115     ldw y,#25293
      009B03 FF               [ 2]  116     ldw (x),y 
      009B04 81               [ 4]  117     ret 
                                    118 
                                    119 ;   LOG2s ( -- 2040 11103 )
                                    120 ; log(2)/1.6384
                                    121 ; precision: 1.1e-8
      009B05 9A F0                  122         .word LINK 
                           001A87   123         LINK=.
      009B07 05                     124         .byte 5 
      009B08 4C 4F 47 32 53         125         .ascii "LOG2S" 
      009B0D                        126 LOG2S:
      009B0D 1D 00 04         [ 2]  127     subw x,#2*CELLL
      009B10 90 AE 07 F8      [ 2]  128     ldw y,#2040 
      009B14 EF 02            [ 2]  129     ldw (2,x),y 
      009B16 90 AE 2B 5F      [ 2]  130     ldw y,#11103 
      009B1A FF               [ 2]  131     ldw (x),y 
      009B1B 81               [ 4]  132     ret 
                                    133 
                                    134 ;   LN2 ( -- 485 11464 )
                                    135 ; ln(2)/16.384 
                                    136 ; precision: 1.0e-7 
      009B1C 9B 07                  137         .word LINK 
                           001A9E   138         LINK=.
      009B1E 04                     139         .byte 4 
      009B1F 4C 4E 32 53            140         .ascii "LN2S" 
      009B23                        141 LN2S: 
      009B23 1D 00 04         [ 2]  142     subw x,#2*CELLL
      009B26 90 AE 01 E5      [ 2]  143     ldw y,#485
      009B2A EF 02            [ 2]  144     ldw (2,x),y 
      009B2C 90 AE 2C C8      [ 2]  145     ldw y,#11464 
      009B30 FF               [ 2]  146     ldw (x),y 
      009B31 81               [ 4]  147     ret 
                                    148 
                                    149 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



                                   4426 .endif ; WANT_MATH_CONST
                                   4427 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



                                   4428         .include "flash.asm"
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
      009B32 9B 1E                   30     .word LINK 
                           001AB4    31     LINK=.
      009B34 03                      32     .byte 3 
      009B35 46 50 21                33     .ascii "FP!"
      009B38                         34 fptr_store:
      009B38 90 93            [ 1]   35     ldw y,x
      009B3A 90 FE            [ 2]   36     ldw y,(y)
      009B3C 90 9F            [ 1]   37     ld a,yl 
      009B3E B7 32            [ 1]   38     ld FPTR,a 
      009B40 1C 00 02         [ 2]   39     addw x,#CELLL 
      009B43 90 93            [ 1]   40     ldw y,x 
      009B45 90 FE            [ 2]   41     ldw y,(y)
      009B47 90 BF 33         [ 2]   42     ldw PTR16,y
      009B4A 1C 00 02         [ 2]   43     addw x,#CELLL 
      009B4D 81               [ 4]   44     ret 
                                     45 
                                     46 ;-----------------------------------
                                     47 ; return EEPROM base address 
                                     48 ; as a double 
                                     49 ;  EEPROM  ( -- ud )
                                     50 ;-----------------------------------
      009B4E 9B 34                   51     .word LINK 
                           001AD0    52 LINK=.
      009B50 06                      53     .byte 6 
      009B51 45 45 50 52 4F 4D       54     .ascii "EEPROM"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



      009B57                         55 EEPROM: 
      009B57 90 AE 40 00      [ 2]   56     ldw y,#EEPROM_BASE
      009B5B 1D 00 04         [ 2]   57     subw x,#2*CELLL 
      009B5E EF 02            [ 2]   58     ldw (2,x),y 
      009B60 90 5F            [ 1]   59     clrw y 
      009B62 FF               [ 2]   60     ldw (x),y 
      009B63 81               [ 4]   61     ret
                                     62 
                                     63 ;---------------------------------
                                     64 ; return APP_LAST pointer as double
                                     65 ; EEP-LAST ( -- ud )
                                     66 ;---------------------------------
      009B64 9B 50                   67 	.word LINK 
                           001AE6    68 	LINK=.
      009B66 08                      69 	.byte 8 
      009B67 45 45 50 2D 4C 41 53    70 	.ascii "EEP-LAST"
             54
      009B6F                         71 EEPLAST:
      009B6F 1D 00 04         [ 2]   72 	subw x,#2*CELLL 
      009B72 90 AE 40 00      [ 2]   73 	ldw y,#APP_LAST 
      009B76 EF 02            [ 2]   74 	ldw (2,x),y 
      009B78 90 5F            [ 1]   75 	clrw y 
      009B7A FF               [ 2]   76 	ldw (x),y 
      009B7B 81               [ 4]   77 	ret 
                                     78 
                                     79 ;----------------------------------
                                     80 ; return APP_RUN pointer as double	
                                     81 ; EEP-RUN ( -- ud )
                                     82 ;-----------------------------------
      009B7C 9B 66                   83 	.word LINK 
                           001AFE    84 	LINK=.
      009B7E 07                      85 	.byte 7
      009B7F 45 45 50 2D 52 55 4E    86 	.ascii "EEP-RUN"
      009B86                         87 EEPRUN:
      009B86 1D 00 04         [ 2]   88 	subw x,#2*CELLL 
      009B89 90 AE 40 02      [ 2]   89 	ldw y,#APP_RUN 
      009B8D EF 02            [ 2]   90 	ldw (2,x),y 
      009B8F 90 5F            [ 1]   91 	clrw y 
      009B91 FF               [ 2]   92 	ldw (x),y 
      009B92 81               [ 4]   93 	ret 
                                     94 
                                     95 ;------------------------------------
                                     96 ; return APP_CP pointer as double 
                                     97 ; EEP-CP ( -- ud )
                                     98 ;------------------------------------
      009B93 9B 7E                   99 	.word LINK
                           001B15   100 	LINK=.
      009B95 06                     101 	.byte 6 
      009B96 45 45 50 2D 43 50      102 	.ascii "EEP-CP"
      009B9C                        103 EEPCP:
      009B9C 1D 00 04         [ 2]  104 	subw x,#2*CELLL 
      009B9F 90 AE 40 04      [ 2]  105 	ldw y,#APP_CP  
      009BA3 EF 02            [ 2]  106 	ldw (2,x),y 
      009BA5 90 5F            [ 1]  107 	clrw y 
      009BA7 FF               [ 2]  108 	ldw (x),y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



      009BA8 81               [ 4]  109 	ret 
                                    110 
                                    111 ;------------------------------------
                                    112 ; return APP_VP pointer as double 
                                    113 ; EEP-VP ( -- ud )
                                    114 ;-------------------------------------
      009BA9 9B 95                  115 	.word LINK
                           001B2B   116 	LINK=.
      009BAB 06                     117 	.byte 6
      009BAC 45 45 50 2D 56 50      118 	.ascii "EEP-VP"
      009BB2                        119 EEPVP:
      009BB2 1D 00 04         [ 2]  120 	subw x,#2*CELLL 
      009BB5 90 AE 40 06      [ 2]  121 	ldw y,#APP_VP  
      009BB9 EF 02            [ 2]  122 	ldw (2,x),y 
      009BBB 90 5F            [ 1]  123 	clrw y 
      009BBD FF               [ 2]  124 	ldw (x),y 
      009BBE 81               [ 4]  125 	ret 
                                    126 
                                    127 ;----------------------------------
                                    128 ; update APP_LAST with LAST 
                                    129 ; UPDAT-LAST ( -- )
                                    130 ;----------------------------------
      009BBF 9B AB                  131 	.word LINK 
                           001B41   132 	LINK=.
      009BC1 0A                     133 	.byte 10
      009BC2 55 50 44 41 54 2D 4C   134 	.ascii "UPDAT-LAST"
             41 53 54
      009BCC                        135 UPDATLAST:
      009BCC CD 86 CF         [ 4]  136 	call LAST
      009BCF CD 84 BC         [ 4]  137 	call AT  
      009BD2 CD 9B 6F         [ 4]  138 	call EEPLAST
      009BD5 CC 9D 48         [ 2]  139 	jp ee_store 
                                    140 
                                    141 ;---------------------------------
                                    142 ; update APP_RUN 
                                    143 ; UPDAT-RUN ( a -- )
                                    144 ;---------------------------------
      009BD8 9B C1                  145 	.word LINK
                           001B5A   146 	LINK=.
      009BDA 09                     147 	.byte 9
      009BDB 55 50 44 41 54 2D 52   148 	.ascii "UPDAT-RUN"
             55 4E
      009BE4                        149 UPDATRUN:
      009BE4 CD 9B 86         [ 4]  150 	call EEPRUN
      009BE7 CC 9D 48         [ 2]  151 	jp ee_store 
                                    152 	
                                    153 ;---------------------------------
                                    154 ; update APP_CP with CP 
                                    155 ; UPDAT-CP ( -- )
                                    156 ;---------------------------------
      009BEA 9B DA                  157 	.word LINK 
                           001B6C   158 	LINK=.
      009BEC 08                     159 	.byte 8 
      009BED 55 50 44 41 54 2D 43   160 	.ascii "UPDAT-CP"
             50
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      009BF5                        161 UPDATCP:
      009BF5 CD 86 BF         [ 4]  162 	call CPP 
      009BF8 CD 84 BC         [ 4]  163 	call AT 
      009BFB CD 9B 9C         [ 4]  164 	call EEPCP 
      009BFE CC 9D 48         [ 2]  165 	jp ee_store 
                                    166 
                                    167 ;----------------------------------
                                    168 ; update APP_VP with VP 
                                    169 ; UPDAT-VP ( -- )
                                    170 ;----------------------------------
      009C01 9B EC                  171 	.word LINK
                           001B83   172 	LINK=.
      009C03 08                     173 	.byte 8 
      009C04 55 50 44 41 54 2D 56   174 	.ascii "UPDAT-VP" 
             50
      009C0C                        175 UPDATVP:
      009C0C CD 86 B1         [ 4]  176 	call VPP 
      009C0F CD 84 BC         [ 4]  177 	call AT
      009C12 CD 9B B2         [ 4]  178 	call EEPVP 
      009C15 CC 9D 48         [ 2]  179 	jp ee_store
                                    180 	
                                    181 
                                    182 ;----------------------------------
                                    183 ; fetch integer at address over 65535
                                    184 ;  F@   ( ud -- n )
                                    185 ;----------------------------------
      009C18 9C 03                  186     .word LINK 
                           001B9A   187 LINK=.
      009C1A 02                     188     .byte 2
      009C1B 46 40                  189     .ascii "F@"
      009C1D                        190 farat:
      009C1D CD 9B 38         [ 4]  191     call fptr_store
      009C20 92 BC 00 32      [ 5]  192     ldf a,[FPTR]
      009C24 1D 00 02         [ 2]  193     subw x,#CELLL 
      009C27 F7               [ 1]  194     ld (x),a 
      009C28 90 AE 00 01      [ 2]  195     ldw y,#1
      009C2C 91 AF 00 32      [ 1]  196     ldf a,([FPTR],y)
      009C30 E7 01            [ 1]  197     ld (1,x),a
      009C32 81               [ 4]  198     ret 
                                    199 
                                    200 ;-------------------------------------
                                    201 ; fetch C at address over 65535 
                                    202 ; FC@ ( ud -- c)
                                    203 ;-------------------------------------
      009C33 9C 1A                  204     .word LINK
                           001BB5   205     LINK=.
      009C35 03                     206     .byte 3 
      009C36 46 43 40               207     .ascii "FC@" 
      009C39                        208 farcat:
      009C39 CD 9B 38         [ 4]  209     call fptr_store 
      009C3C 92 BC 00 32      [ 5]  210     ldf a,[FPTR]
      009C40 1D 00 02         [ 2]  211     subw x,#CELLL 
      009C43 E7 01            [ 1]  212     ld (1,x),a 
      009C45 7F               [ 1]  213     clr (x)
      009C46 81               [ 4]  214     ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



                                    215     
                                    216 ;----------------------------------
                                    217 ; unlock EEPROM/OPT for writing/erasing
                                    218 ; wait endlessly for FLASH_IAPSR_DUL bit.
                                    219 ;  UNLKEE   ( -- )
                                    220 ;----------------------------------
      009C47 9C 35                  221     .word LINK 
                           001BC9   222 LINK=.
      009C49 06                     223     .byte 6 
      009C4A 55 4E 4C 4B 45 45      224     .ascii "UNLKEE"
      009C50                        225 unlock_eeprom:
      009C50 35 00 50 5B      [ 1]  226 	mov FLASH_CR2,#0 
      009C54 35 FF 50 5C      [ 1]  227 	mov FLASH_NCR2,#0xFF 
      009C58 35 AE 50 64      [ 1]  228 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      009C5C 35 56 50 64      [ 1]  229     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      009C60 72 07 50 5F FB   [ 2]  230 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      009C65 81               [ 4]  231 	ret
                                    232 
                                    233 ;----------------------------------
                                    234 ; unlock FLASH for writing/erasing
                                    235 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                    236 ; UNLKFL  ( -- )
                                    237 ;----------------------------------
      009C66 9C 49                  238     .word LINK 
                           001BE8   239 LINK=. 
      009C68 06                     240     .byte 6 
      009C69 55 4E 4C 4B 46 4C      241     .ascii "UNLKFL"    
      009C6F                        242 unlock_flash:
      009C6F 35 00 50 5B      [ 1]  243 	mov FLASH_CR2,#0 
      009C73 35 FF 50 5C      [ 1]  244 	mov FLASH_NCR2,#0xFF 
      009C77 35 56 50 62      [ 1]  245 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      009C7B 35 AE 50 62      [ 1]  246 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      009C7F 72 03 50 5F FB   [ 2]  247 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      009C84 81               [ 4]  248 	ret
                                    249 
                                    250 ;-----------------------------
                                    251 ; unlock FLASH or EEPROM 
                                    252 ; according to FPTR address 
                                    253 ;  UNLOCK ( -- )
                                    254 ;-----------------------------
      009C85 9C 68                  255 	.word LINK 
                           001C07   256 	LINK=.
      009C87 06                     257 	.byte 6
      009C88 55 4E 4C 4F 43 4B      258 	.ascii "UNLOCK"
      009C8E                        259 unlock:
                                    260 ; put addr[15:0] in Y, for bounds check.
      009C8E 90 BE 33         [ 2]  261 	ldw y,PTR16   ; Y=addr15:0
                                    262 ; check addr[23:16], if <> 0 then it is extened flash memory
      009C91 3D 32            [ 1]  263 	tnz FPTR 
      009C93 26 16            [ 1]  264 	jrne 4$
      009C95 90 A3 80 00      [ 2]  265     cpw y,#FLASH_BASE
      009C99 24 10            [ 1]  266     jruge 4$
      009C9B 90 A3 40 00      [ 2]  267 	cpw y,#EEPROM_BASE  
      009C9F 25 0D            [ 1]  268     jrult 9$
      009CA1 90 A3 48 7F      [ 2]  269 	cpw y,#OPTION_END 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



      009CA5 22 07            [ 1]  270 	jrugt 9$
      009CA7 CD 9C 50         [ 4]  271 	call unlock_eeprom
      009CAA 81               [ 4]  272 	ret 
      009CAB CD 9C 6F         [ 4]  273 4$: call unlock_flash
      009CAE 81               [ 4]  274 9$: ret 
                                    275 
                                    276 ;-------------------------
                                    277 ; lock write access to 
                                    278 ; FLASH and EEPROM 
                                    279 ; LOCK ( -- )
                                    280 ;-------------------------
      009CAF 9C 87                  281 	.word LINK 
                           001C31   282 	LINK=.
      009CB1 04                     283 	.byte 4 
      009CB2 4C 4F 43 4B            284 	.ascii "LOCK" 
      009CB6                        285 lock: 
      009CB6 72 13 50 5F      [ 1]  286 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      009CBA 72 17 50 5F      [ 1]  287 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009CBE 81               [ 4]  288 	ret 
                                    289 
                                    290 ;-------------------------
                                    291 ; increment FPTR 
                                    292 ; INC-FPTR ( -- )
                                    293 ;-------------------------
      009CBF 9C B1                  294 	.word LINK 
                           001C41   295 	LINK=. 
      009CC1 08                     296 	.byte 8 
      009CC2 49 4E 43 2D 46 50 54   297 	.ascii "INC-FPTR" 
             52
      009CCA                        298 inc_fptr:
      009CCA 3C 34            [ 1]  299 	inc PTR8 
      009CCC 26 08            [ 1]  300 	jrne 1$
      009CCE 90 BE 32         [ 2]  301 	ldw y,FPTR 
      009CD1 90 5C            [ 2]  302 	incw y 
      009CD3 90 BF 32         [ 2]  303 	ldw FPTR,y 
      009CD6 81               [ 4]  304 1$: ret 
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
      009CD7 9C C1                  315 	.word LINK 
                           001C59   316 	LINK=. 
      009CD9 07                     317 	.byte 7 
      009CDA 57 52 2D 42 59 54 45   318 	.ascii "WR-BYTE" 
                                    319 
      009CE1                        320 write_byte:
      009CE1 90 93            [ 1]  321 	ldw y,x 
      009CE3 90 FE            [ 2]  322 	ldw y,(y)
      009CE5 1C 00 02         [ 2]  323 	addw x,#CELLL 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      009CE8 90 9F            [ 1]  324 	ld a,yl
      009CEA 92 BD 00 32      [ 4]  325 	ldf [FPTR],a
      009CEE 72 05 50 5F FB   [ 2]  326 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009CF3 20 D5            [ 2]  327 	jra inc_fptr 
                                    328 
                                    329 
                                    330 
                                    331 ;---------------------------------------
                                    332 ; write a byte to FLASH or EEPROM/OPTION  
                                    333 ; EEC!  (c ud -- )
                                    334 ;---------------------------------------
      009CF5 9C D9                  335     .word LINK 
                           001C77   336 	LINK=.
      009CF7 04                     337     .byte 4 
      009CF8 45 45 43 21            338     .ascii "EEC!"
                                    339 	; local variables 
                           000001   340 	BTW = 1   ; byte to write offset on stack
                           000002   341     OPT = 2 
                           000002   342 	VSIZE = 2
      009CFC                        343 ee_cstore:
      009CFC 52 02            [ 2]  344 	sub sp,#VSIZE
      009CFE CD 9B 38         [ 4]  345     call fptr_store
      009D01 E6 01            [ 1]  346 	ld a,(1,x)
      009D03 43               [ 1]  347 	cpl a 
      009D04 6B 01            [ 1]  348 	ld (BTW,sp),a ; byte to write 
      009D06 0F 02            [ 1]  349 	clr (OPT,sp)  ; OPTION flag
      009D08 CD 9C 8E         [ 4]  350 	call unlock 
                                    351 	; check if option
      009D0B 3D 32            [ 1]  352 	tnz FPTR 
      009D0D 26 19            [ 1]  353 	jrne 2$
      009D0F 90 BE 33         [ 2]  354 	ldw y,PTR16 
      009D12 90 A3 48 00      [ 2]  355 	cpw y,#OPTION_BASE
      009D16 2B 10            [ 1]  356 	jrmi 2$
      009D18 90 A3 48 80      [ 2]  357 	cpw y,#OPTION_END+1
      009D1C 2A 0A            [ 1]  358 	jrpl 2$
      009D1E 03 02            [ 1]  359 	cpl (OPT,sp)
                                    360 	; OPTION WRITE require this unlock 
      009D20 72 1E 50 5B      [ 1]  361     bset FLASH_CR2,#FLASH_CR2_OPT
      009D24 72 1F 50 5C      [ 1]  362     bres FLASH_NCR2,#FLASH_CR2_OPT 
      009D28                        363 2$: 
      009D28 CD 9C E1         [ 4]  364 	call write_byte 	
      009D2B 0D 02            [ 1]  365 	tnz (OPT,sp)
      009D2D 27 0D            [ 1]  366 	jreq 3$ 
      009D2F 7B 01            [ 1]  367     ld a,(BTW,sp)
      009D31 90 5F            [ 1]  368     clrw y
      009D33 90 97            [ 1]  369 	ld yl,a 
      009D35 1D 00 02         [ 2]  370 	subw x,#CELLL 
      009D38 FF               [ 2]  371 	ldw (x),y 
      009D39 CD 9C E1         [ 4]  372 	call write_byte
      009D3C                        373 3$: 
      009D3C CD 9C B6         [ 4]  374 	call lock 
      009D3F 5B 02            [ 2]  375 	addw sp,#VSIZE 
      009D41 81               [ 4]  376     ret
                                    377 
                                    378 ;------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



                                    379 ; write integer in FLASH|EEPROM
                                    380 ; EE! ( n ud -- )
                                    381 ;------------------------------
      009D42 9C F7                  382 	.word LINK 
                           001CC4   383 	LINK=.
      009D44 03                     384 	.byte 3 
      009D45 45 45 21               385 	.ascii "EE!"
      009D48                        386 ee_store:
      009D48 CD 9B 38         [ 4]  387 	call fptr_store 
      009D4B CD 9C 8E         [ 4]  388 	call unlock 
      009D4E 90 93            [ 1]  389 	ldw y,x 
      009D50 90 FE            [ 2]  390 	ldw y,(y)
      009D52 90 89            [ 2]  391 	pushw y 
      009D54 90 5E            [ 1]  392 	swapw y 
      009D56 FF               [ 2]  393 	ldw (x),y 
      009D57 CD 9C E1         [ 4]  394 	call write_byte 
      009D5A 90 85            [ 2]  395 	popw y 
      009D5C 1D 00 02         [ 2]  396 	subw x,#CELLL
      009D5F FF               [ 2]  397 	ldw (x),y 
      009D60 CD 9C E1         [ 4]  398 	call write_byte
      009D63 CC 9C B6         [ 2]  399 	jp lock 
                                    400 
                                    401 
                                    402 ;----------------------------
                                    403 ; Erase flash memory row 
                                    404 ; stm8s208 as 128 bytes rows
                                    405 ; ROW-ERASE ( ud -- )
                                    406 ;----------------------------
      009D66 9D 44                  407 	.word LINK 
                           001CE8   408 	LINK=. 
      009D68 09                     409 	.byte 9 
      009D69 52 4F 57 2D 45 52 41   410 	.ascii "ROW-ERASE" 
             53 45
      009D72                        411 row_erase:
      009D72 CD 9B 38         [ 4]  412 	call fptr_store
                                    413 ;code must be execute from RAM 
                                    414 ;copy routine to PAD 
      009D75 1D 00 02         [ 2]  415 	subw x,#CELLL 
      009D78 90 AE 9D BF      [ 2]  416 	ldw y,#row_erase_proc
      009D7C FF               [ 2]  417 	ldw (x),y 
      009D7D CD 8B C4         [ 4]  418 	call PAD 
      009D80 90 AE 9D E6      [ 2]  419 	ldw y,#row_erase_proc_end 
      009D84 72 A2 9D BF      [ 2]  420 	subw y,#row_erase_proc
      009D88 1D 00 02         [ 2]  421 	subw x,#CELLL 
      009D8B FF               [ 2]  422 	ldw (x),y 
      009D8C CD 8C 00         [ 4]  423 	call CMOVE 
      009D8F                        424 block_erase:
      009D8F 90 BE 33         [ 2]  425 	ldw y,FPTR+1
      009D92 90 A3 A2 00      [ 2]  426 	cpw y,#app_space 
      009D96 2A 13            [ 1]  427 	jrpl erase_flash 
                                    428 ; erase EEPROM block
      009D98 90 A3 40 00      [ 2]  429 	cpw y,#EEPROM_BASE 
      009D9C 24 01            [ 1]  430 	jruge 1$
      009D9E 81               [ 4]  431 	ret ; bad address 
      009D9F 90 A3 47 FF      [ 2]  432 1$: cpw y,#EEPROM_END 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



      009DA3 23 01            [ 2]  433 	jrule 2$ 
      009DA5 81               [ 4]  434 	ret ; bad address 
      009DA6                        435 2$:	
      009DA6 CD 9C 50         [ 4]  436 	call unlock_eeprom 
      009DA9 20 03            [ 2]  437 	jra proceed_erase
                                    438 ; erase flash block:
      009DAB                        439 erase_flash:
      009DAB CD 9C 6F         [ 4]  440 	call unlock_flash 
      009DAE                        441 proceed_erase:
      009DAE CD 8B C4         [ 4]  442 	call PAD 
      009DB1 90 93            [ 1]  443 	ldw y,x
      009DB3 90 FE            [ 2]  444 	ldw y,(y)
      009DB5 1C 00 02         [ 2]  445 	addw x,#CELLL  
      009DB8 90 FD            [ 4]  446 	call (y) 
      009DBA 72 17 50 5F      [ 1]  447 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009DBE 81               [ 4]  448 	ret 
                                    449 
                                    450 ; this routine is to be copied to PAD 
      009DBF                        451 row_erase_proc:
      009DBF 35 20 50 5B      [ 1]  452 	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
      009DC3 35 DF 50 5C      [ 1]  453 	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
      009DC7 4F               [ 1]  454 	clr a 
      009DC8 90 5F            [ 1]  455 	clrw y 
      009DCA 91 A7 00 32      [ 1]  456 	ldf ([FPTR],y),a
      009DCE 90 5C            [ 2]  457     incw y
      009DD0 91 A7 00 32      [ 1]  458 	ldf ([FPTR],y),a
      009DD4 90 5C            [ 2]  459     incw y
      009DD6 91 A7 00 32      [ 1]  460 	ldf ([FPTR],y),a
      009DDA 90 5C            [ 2]  461     incw y
      009DDC 91 A7 00 32      [ 1]  462 	ldf ([FPTR],y),a
      009DE0 72 05 50 5F FB   [ 2]  463 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009DE5 81               [ 4]  464 	ret
      009DE6                        465 row_erase_proc_end:
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
      009DE6                        478 copy_buffer:
      009DE6 4B 80            [ 1]  479 	push #BLOCK_SIZE  
                                    480 ;enable block programming 
      009DE8 72 10 50 5B      [ 1]  481 	bset FLASH_CR2,#FLASH_CR2_PRG 
      009DEC 72 11 50 5C      [ 1]  482 	bres FLASH_NCR2,#FLASH_CR2_PRG
      009DF0 90 5F            [ 1]  483 	clrw y
      009DF2 F6               [ 1]  484 1$:	ld a,(x)
      009DF3 91 A7 00 32      [ 1]  485 	ldf ([FPTR],y),a
      009DF7 5C               [ 2]  486 	incw x 
      009DF8 90 5C            [ 2]  487 	incw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



      009DFA 0A 01            [ 1]  488 	dec (BCNT,sp)
      009DFC 26 F4            [ 1]  489 	jrne 1$
                                    490 ; wait EOP bit 
      009DFE 72 05 50 5F FB   [ 2]  491 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. 
      009E03 84               [ 1]  492 	pop a ; remove BCNT from stack 
      009E04 81               [ 4]  493 	ret 
      009E05                        494 copy_buffer_end:
                                    495 
                                    496 ;-------------------------
                                    497 ; move program_row to RAM 
                                    498 ; in TIB 
                                    499 ;------------------------
      009E05                        500 copy_prog_to_ram:
      009E05 1D 00 06         [ 2]  501 	subw x,#6
      009E08 90 AE 9D E6      [ 2]  502 	ldw y,#copy_buffer 
      009E0C EF 04            [ 2]  503 	ldw (4,x),y 
      009E0E 90 AE 17 00      [ 2]  504 	ldw y,#TIBBASE
      009E12 EF 02            [ 2]  505 	ldw (2,x),y 
      009E14 90 AE 9E 05      [ 2]  506 	ldw y,#copy_buffer_end 
      009E18 72 A2 9D E6      [ 2]  507 	subw y,#copy_buffer  
      009E1C FF               [ 2]  508 	ldw (x),y 
      009E1D CD 8C 00         [ 4]  509 	call CMOVE 
      009E20 81               [ 4]  510 	ret 
                                    511 
                                    512 
                                    513 ;-----------------------------
                                    514 ; write a row in FLASH/EEPROM 
                                    515 ; WR-ROW ( a ud -- )
                                    516 ; a -> address 128 byte buffer to write 
                                    517 ; ud ->  row address in FLASH|EEPROM 
                                    518 ;-----------------------------
      009E21 9D 68                  519 	.word LINK 
                           001DA3   520 	LINK=.
      009E23 06                     521 	.byte 6 
      009E24 57 52 2D 52 4F 57      522 	.ascii "WR-ROW"
      009E2A                        523 write_row:
      009E2A CD 9B 38         [ 4]  524 	call fptr_store
                                    525 ; align to FLASH block 
      009E2D A6 80            [ 1]  526 	ld a,#0x80 
      009E2F B4 34            [ 1]  527 	and a,PTR8 
      009E31 B7 34            [ 1]  528 	ld PTR8,a  
      009E33 CD 9E 05         [ 4]  529 	call copy_prog_to_ram
      009E36 CD 9C 8E         [ 4]  530 	call unlock
      009E39 90 93            [ 1]  531 	ldw y,x 
      009E3B 90 FE            [ 2]  532 	ldw y,(y)
      009E3D 1C 00 02         [ 2]  533 	addw x,#CELLL 
      009E40 89               [ 2]  534 	pushw x 
      009E41 93               [ 1]  535 	ldw x,y ; buffer address in x 
      009E42 CD 17 00         [ 4]  536 	call TIBBASE
      009E45 CD 9C B6         [ 4]  537 	call lock
      009E48 85               [ 2]  538 	popw x 
      009E49 81               [ 4]  539 	ret 
                                    540 
                                    541 ;-------------------------------------
                                    542 ; change value of OPTION register 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



                                    543 ; SET-OPT (c n -- ) 
                                    544 ; c new value.
                                    545 ; n OPT  number {1..7}
                                    546 ;--------------------------------------
      009E4A 9E 23                  547 		.word LINK 
                           001DCC   548 		LINK=.
      009E4C 07                     549 		.byte 7 
      009E4D 53 45 54 2D 4F 50 54   550 		.ascii "SET-OPT" 
      009E54                        551 set_option: 
      009E54 90 93            [ 1]  552 		ldw y,x 
      009E56 90 FE            [ 2]  553 		ldw y,(y)
      009E58 27 06            [ 1]  554 		jreq 1$
      009E5A 90 A3 00 07      [ 2]  555 		cpw y,#7 
      009E5E 23 04            [ 2]  556 		jrule 2$ 
                                    557 ; invalid OPTION number 		
      009E60 1C 00 04         [ 2]  558 1$:		addw x,#2*CELLL
      009E63 81               [ 4]  559 		ret
      009E64 90 58            [ 2]  560 2$:		sllw y 
      009E66 72 A9 47 FF      [ 2]  561 		addw y,#OPTION_BASE-1
      009E6A FF               [ 2]  562 		ldw (x),y 
      009E6B 1D 00 02         [ 2]  563 		subw x,#CELLL 
      009E6E 90 5F            [ 1]  564 		clrw y 
      009E70 FF               [ 2]  565 		ldw (x),y 
      009E71 CD 9C FC         [ 4]  566 		call ee_cstore
      009E74 81               [ 4]  567 		ret 
                                    568 
                                    569 
                                    570 
                                    571 ;--------------------------------------
                                    572 ; reset system to its original state 
                                    573 ; before any user modification
                                    574 ; PRISTINE ( -- )
                                    575 ;-------------------------------------
      009E75 9E 4C                  576 	.word LINK  
                           001DF7   577 	LINK=.
      009E77 08                     578 	.byte 8 
      009E78 50 52 49 53 54 49 4E   579 	.ascii "PRISTINE"
             45
      009E80                        580 pristine:
                                    581 ;;; erase EEPROM
      009E80 CD 9B 57         [ 4]  582 	call EEPROM 
      009E83 CD 87 49         [ 4]  583 1$:	call DDUP 
      009E86 CD 9D 72         [ 4]  584 	call row_erase
      009E89 90 93            [ 1]  585 	ldw y,x 
      009E8B 90 EE 02         [ 2]  586 	ldw y,(2,y)
      009E8E 72 A9 00 80      [ 2]  587 	addw y,#BLOCK_SIZE
      009E92 EF 02            [ 2]  588 	ldw (2,x),y
      009E94 90 A3 48 00      [ 2]  589 	cpw y,#OPTION_BASE 
      009E98 25 E9            [ 1]  590 	jrult 1$
                                    591 ;;; reset OPTION to default values
      009E9A 90 AE 00 01      [ 2]  592 	ldw y,#1 ; OPT1 
      009E9E FF               [ 2]  593 2$:	ldw (x),y   
      009E9F 90 5F            [ 1]  594 	clrw y 
      009EA1 EF 02            [ 2]  595 	ldw (2,x),y  ; ( 0 1 -- ) 
      009EA3 CD 87 49         [ 4]  596 	call DDUP    ; ( 0 1 0 1 -- )  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



      009EA6 CD 9E 54         [ 4]  597 	call set_option
      009EA9 90 93            [ 1]  598 	ldw y,x 
      009EAB 90 FE            [ 2]  599 	ldw y,(y)
      009EAD 90 5C            [ 2]  600 	incw y  ; next OPTION 
      009EAF 90 A3 00 08      [ 2]  601 	cpw y,#8 
      009EB3 25 E9            [ 1]  602 	jrult 2$
                                    603 ;;; erase first row of app_space 	
      009EB5 90 AE A2 00      [ 2]  604 	ldw y,#app_space
      009EB9 EF 02            [ 2]  605 	ldw (2,x),y  
      009EBB 90 5F            [ 1]  606 	clrw y 
      009EBD FF               [ 2]  607 	ldw (x),y ; ( app_space 0 -- )
      009EBE CD 9D 72         [ 4]  608 	call row_erase 
                                    609 ; reset interrupt vectors 
      009EC1 1D 00 02         [ 2]  610 	subw x,#CELLL 
      009EC4 90 5F            [ 1]  611 	clrw y  
      009EC6 FF               [ 2]  612 4$:	ldw (x),y  ; ( n -- ) int# 
      009EC7 CD 85 63         [ 4]  613 	call DUPP  
      009ECA CD 9E E7         [ 4]  614 	call reset_vector
      009ECD 90 93            [ 1]  615 	ldw y,x 
      009ECF 90 FE            [ 2]  616 	ldw y,(y)
      009ED1 90 5C            [ 2]  617 	incw y   ; next vector 
      009ED3 90 A3 00 19      [ 2]  618 	cpw y,#25 
      009ED7 25 ED            [ 1]  619 	jrult 4$
      009ED9 CC 80 80         [ 2]  620 	jp NonHandledInterrupt ; reset MCU
                                    621 
                                    622 ;------------------------------
                                    623 ; reset an interrupt vector 
                                    624 ; to its initial value 
                                    625 ; i.e. NonHandledInterrupt
                                    626 ; RST-IVEC ( n -- )
                                    627 ;-----------------------------
      009EDC 9E 77                  628 	.word LINK 
                           001E5E   629 	LINK=. 
      009EDE 08                     630 	.byte 8 
      009EDF 52 53 54 2D 49 56 45   631 	.ascii "RST-IVEC"
             43
      009EE7                        632 reset_vector:
      009EE7 90 93            [ 1]  633 	ldw y,x
      009EE9 1C 00 02         [ 2]  634 	addw x,#CELLL 
      009EEC 90 FE            [ 2]  635 	ldw y,(y)
      009EEE 90 A3 00 17      [ 2]  636 	cpw y,#23 
      009EF2 27 3A            [ 1]  637 	jreq 9$
      009EF4 90 A3 00 1D      [ 2]  638 	cpw y,#29 ; last vector
      009EF8 22 34            [ 1]  639 	jrugt 9$  
      009EFA 90 58            [ 2]  640 	sllw y 
      009EFC 90 58            [ 2]  641 	sllw y 
      009EFE 72 A9 80 08      [ 2]  642 	addw y,#0x8008 ; irq0 address 
      009F02 90 BF 24         [ 2]  643 	ldw YTEMP,y
      009F05 1D 00 06         [ 2]  644 	subw x,#3*CELLL 
      009F08 EF 02            [ 2]  645 	ldw (2,x),y 
      009F0A 90 5F            [ 1]  646 	clrw y
      009F0C FF               [ 2]  647 	ldw (x),y 
      009F0D A6 82            [ 1]  648 	ld a,#0x82 
      009F0F 90 95            [ 1]  649 	ld yh,a
      009F11 EF 04            [ 2]  650 	ldw (4,x),y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



      009F13 CD 9D 48         [ 4]  651 	call ee_store
      009F16 1D 00 06         [ 2]  652 	subw x,#3*CELLL
      009F19 90 5F            [ 1]  653 	clrw y 
      009F1B FF               [ 2]  654 	ldw (x),y 
      009F1C 90 AE 80 80      [ 2]  655 	ldw y,#NonHandledInterrupt
      009F20 EF 04            [ 2]  656 	ldw (4,x),y 
      009F22 90 BE 24         [ 2]  657 	ldw y,YTEMP  
      009F25 72 A9 00 02      [ 2]  658 	addw y,#2
      009F29 EF 02            [ 2]  659 	ldw (2,x),y 
      009F2B CD 9D 48         [ 4]  660 	call ee_store
      009F2E 81               [ 4]  661 9$:	ret 
                                    662 
                                    663 
                                    664 ;------------------------------
                                    665 ; all interrupt vector with 
                                    666 ; an address >= a are resetted 
                                    667 ; to default
                                    668 ; CHKIVEC ( a -- )
                                    669 ;------------------------------
      009F2F 9E DE                  670 	.word LINK 
                           001EB1   671 	LINK=.
      009F31 07                     672 	.byte 7
      009F32 43 48 4B 49 56 45 43   673 	.ascii "CHKIVEC"
                                    674 ;local variables 
                           000001   675 	SSP=1
                           000003   676 	CADR=3
                           000005   677 	OFS=5
                           000006   678 	VSIZE=6  
      009F39                        679 CHKIVEC:
      009F39 52 06            [ 2]  680 	sub sp,#VSIZE ;alloc local variables 
      009F3B 90 93            [ 1]  681 	ldw y,x 
      009F3D 90 FE            [ 2]  682 	ldw y,(y)
      009F3F 17 03            [ 2]  683 	ldw (CADR,sp),y ; ca 
      009F41 1F 01            [ 2]  684 	ldw (SSP,sp),x 
      009F43 AE 80 0A         [ 2]  685 	ldw x,#0x800a ; irq0 address 
      009F46 BF 33            [ 2]  686 	ldw PTR16,X
      009F48 AE FF FC         [ 2]  687 	ldw x,#-4 
      009F4B 1C 00 04         [ 2]  688 1$:	addw x,#4
      009F4E A3 00 78         [ 2]  689 	cpw x,#30*4 ; irq0-29 
      009F51 27 22            [ 1]  690 	jreq 9$
      009F53 90 93            [ 1]  691 	ldw y,x  
      009F55 91 D6 33         [ 4]  692 	ld a,([PTR16],y)
      009F58 11 03            [ 1]  693 	cp a,(CADR,sp)
      009F5A 25 EF            [ 1]  694 	jrult 1$
      009F5C 90 5C            [ 2]  695 	incw y 
      009F5E 91 D6 33         [ 4]  696 	ld a,([PTR16],y)
      009F61 11 04            [ 1]  697 	cp a,(CADR+1,sp) 
      009F63 25 E6            [ 1]  698 	jrult 1$ 
      009F65 1F 05            [ 2]  699 	ldw (OFS,sp),x 
      009F67 54               [ 2]  700 	srlw x
      009F68 54               [ 2]  701 	srlw x 
      009F69 90 93            [ 1]  702 	ldw y,x 
      009F6B 1E 01            [ 2]  703 	ldw x,(SSP,sp)
      009F6D FF               [ 2]  704 	ldw (x),y
      009F6E CD 9E E7         [ 4]  705 	call reset_vector
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



      009F71 1E 05            [ 2]  706 	ldw x,(OFS,sp) 
      009F73 20 D6            [ 2]  707 	jra 1$
      009F75 1E 01            [ 2]  708 9$:	ldw x,(SSP,sp) 
      009F77 1C 00 02         [ 2]  709 	addw x,#CELLL 
      009F7A 5B 06            [ 2]  710 	addw sp,#VSIZE ; drop local variables  
      009F7C 81               [ 4]  711 	ret 
                                    712 
                                    713 ;------------------------------
                                    714 ; set interrupt vector 
                                    715 ; SET-IVEC ( ud n -- )
                                    716 ;  ud Handler address
                                    717 ;  n  vector # 0 .. 29 
                                    718 ;-----------------------------
      009F7D 9F 31                  719 	.word LINK
                           001EFF   720 	LINK=.
      009F7F 08                     721 	.byte 8 
      009F80 53 45 54 2D 49 56 45   722 	.ascii "SET-IVEC" 
             43
      009F88                        723 set_vector:
      009F88 90 93            [ 1]  724     ldw y,x 
      009F8A 1C 00 02         [ 2]  725 	addw x,#CELLL 
      009F8D 90 FE            [ 2]  726 	ldw y,(y) ; vector #
      009F8F 90 A3 00 1D      [ 2]  727 	cpw y,#29 ; last vector
      009F93 23 04            [ 2]  728 	jrule 2$
      009F95 1C 00 04         [ 2]  729 	addw x,#2*CELLL 
      009F98 81               [ 4]  730 	ret
      009F99 90 58            [ 2]  731 2$:	sllw y 
      009F9B 90 58            [ 2]  732 	sllw y 
      009F9D 72 A9 80 08      [ 2]  733 	addw y,#0X8008 ; IRQ0 vector address 
      009FA1 90 BF 24         [ 2]  734 	ldw YTEMP,y ; vector address 
      009FA4 A6 82            [ 1]  735 	ld a,#0x82 
      009FA6 90 95            [ 1]  736 	ld yh,a 
      009FA8 E6 01            [ 1]  737 	ld a,(1,x) ; isr address bits 23..16 
      009FAA 90 97            [ 1]  738 	ld yl,a 
                                    739 ;  write 0x82 + most significant byte of int address	
      009FAC 1D 00 06         [ 2]  740 	subw x,#3*CELLL 
      009FAF EF 04            [ 2]  741 	ldw (4,x),y 
      009FB1 90 BE 24         [ 2]  742 	ldw y,YTEMP
      009FB4 EF 02            [ 2]  743 	ldw (2,x),y ; vector address 
      009FB6 90 5F            [ 1]  744 	clrw y 
      009FB8 FF               [ 2]  745 	ldw (x),y   ; as a double 
      009FB9 CD 9D 48         [ 4]  746 	call ee_store 
      009FBC 90 93            [ 1]  747 	ldw y,x 
      009FBE 90 EE 02         [ 2]  748 	ldw y,(2,y) ; bits 15..0 int vector 
      009FC1 1D 00 06         [ 2]  749 	subw x,#3*CELLL 
      009FC4 EF 04            [ 2]  750 	ldw (4,x),y 
      009FC6 90 BE 24         [ 2]  751 	ldw y,YTEMP 
      009FC9 72 A9 00 02      [ 2]  752 	addw y,#2 
      009FCD EF 02            [ 2]  753 	ldw (2,x),y 
      009FCF 90 5F            [ 1]  754 	clrw y 
      009FD1 FF               [ 2]  755 	ldw (x),y 
      009FD2 CD 9D 48         [ 4]  756 	call ee_store
      009FD5 1C 00 04         [ 2]  757 	addw x,#2*CELLL  
      009FD8 81               [ 4]  758 9$: ret 
                                    759 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



                                    760 
                                    761 ;------------------------
                                    762 ; Compile word to flash
                                    763 ; EE, (w -- )
                                    764 ;-----------------------
      009FD9 9F 7F                  765 	.word LINK
                           001F5B   766 	LINK=.
      009FDB 03                     767 	.byte 3
      009FDC 45 45 2C               768 	.ascii "EE,"
      009FDF                        769 ee_comma:
      009FDF 1D 00 04         [ 2]  770 	subw x,#2*CELLL 
      009FE2 90 BE 18         [ 2]  771 	ldw y,UCP
      009FE5 90 89            [ 2]  772 	pushw y 
      009FE7 EF 02            [ 2]  773 	ldw (2,x),y 
      009FE9 90 5F            [ 1]  774 	clrw y 
      009FEB FF               [ 2]  775 	ldw (x),y
      009FEC CD 9D 48         [ 4]  776 	call ee_store
      009FEF 90 85            [ 2]  777 	popw y 
      009FF1 72 A9 00 02      [ 2]  778 	addw y,#2
      009FF5 90 BF 18         [ 2]  779 	ldw UCP,y
      009FF8 81               [ 4]  780 	ret 
                                    781 
                                    782 
                                    783 ;-------------------------
                                    784 ; Compile byte to flash 
                                    785 ; EEC, ( c -- )	
                                    786 ;-------------------------
      009FF9 9F DB                  787 	.word LINK 
                           001F7B   788 	LINK=.
      009FFB 04                     789 	.byte 4 
      009FFC 45 45 43 2C            790 	.ascii "EEC,"
      00A000                        791 ee_ccomma:
      00A000 1D 00 04         [ 2]  792 	subw x,#2*CELLL 
      00A003 90 BE 18         [ 2]  793 	ldw y,UCP
      00A006 90 89            [ 2]  794 	pushw y 
      00A008 EF 02            [ 2]  795 	ldw (2,x),y 
      00A00A 90 5F            [ 1]  796 	clrw y 
      00A00C FF               [ 2]  797 	ldw (x),y
      00A00D CD 9C FC         [ 4]  798 	call ee_cstore
      00A010 90 85            [ 2]  799 	popw y 
      00A012 90 5C            [ 2]  800 	incw y 
      00A014 90 BF 18         [ 2]  801 	ldw UCP,y
      00A017 81               [ 4]  802 	ret 
                                    803 
                                    804 
                                    805 ;--------------------------
                                    806 ; copy FLASH block to ROWBUF
                                    807 ; ROW2BUF ( ud -- )
                                    808 ;--------------------------
      00A018 9F FB                  809 	.word LINK 
                           001F9A   810 	LINK=.
      00A01A 07                     811 	.byte 7 
      00A01B 52 4F 57 32 42 55 46   812 	.ascii "ROW2BUF"
      00A022                        813 ROW2BUF: 
      00A022 CD 9B 38         [ 4]  814 	call fptr_store 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



      00A025 A6 80            [ 1]  815 	ld a,#BLOCK_SIZE
      00A027 88               [ 1]  816 	push a 
      00A028 B4 34            [ 1]  817 	and a,PTR8 ; block align 
      00A02A B7 34            [ 1]  818 	ld PTR8,a
      00A02C 90 AE 16 80      [ 2]  819 	ldw y,#ROWBUFF 
      00A030 92 BC 00 32      [ 5]  820 1$: ldf a,[FPTR]
      00A034 90 F7            [ 1]  821 	ld (y),a
      00A036 CD 9C CA         [ 4]  822 	call inc_fptr
      00A039 90 5C            [ 2]  823 	incw y 
      00A03B 0A 01            [ 1]  824 	dec (1,sp)
      00A03D 26 F1            [ 1]  825 	jrne 1$ 
      00A03F 84               [ 1]  826 	pop a 
      00A040 81               [ 4]  827 	ret 
                                    828 
                                    829 
                                    830 ;---------------------------
                                    831 ; copy ROWBUFF to flash 
                                    832 ; BUF2ROW ( ud -- )
                                    833 ; ud is row address as double 
                                    834 ;---------------------------
      00A041 A0 1A                  835 	.word LINK 
                           001FC3   836 	LINK=.
      00A043 07                     837 	.byte 7 
      00A044 42 55 46 32 52 4F 57   838 	.ascii "BUF2ROW" 
      00A04B                        839 BUF2ROW:
      00A04B CD 86 5E         [ 4]  840 	call TBUF ; ( ud rb -- )
      00A04E CD 87 1E         [ 4]  841 	call ROT 
      00A051 CD 87 1E         [ 4]  842 	call ROT  ; ( rb ud -- )
      00A054 CD 9E 2A         [ 4]  843 	call write_row 
      00A057 81               [ 4]  844 	ret 
                                    845 
                                    846 ;---------------------------------
                                    847 ; how many byte free in that row 
                                    848 ; RFREE ( a -- n )
                                    849 ; a is least byte of target address
                                    850 ;----------------------------------
      00A058 A0 43                  851 	.word LINK 
                           001FDA   852 	LINK=.
      00A05A 05                     853 	.byte 5 
      00A05B 52 46 52 45 45         854 	.ascii "RFREE"
      00A060                        855 RFREE:
      00A060 E6 01            [ 1]  856 	ld a,(1,x)
      00A062 A4 7F            [ 1]  857 	and a,#BLOCK_SIZE-1 
      00A064 B7 24            [ 1]  858 	ld YTEMP,a 
      00A066 A6 80            [ 1]  859 	ld a,#BLOCK_SIZE 
      00A068 B0 24            [ 1]  860 	sub a,YTEMP 
      00A06A 90 5F            [ 1]  861 	clrw y 
      00A06C 90 97            [ 1]  862 	ld yl,a
      00A06E FF               [ 2]  863 	ldw (x),y 
      00A06F 81               [ 4]  864 	ret 
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
      00A070 A0 5A                  875 	.word LINK 
                           001FF2   876 	LINK=. 
      00A072 06                     877 	.byte 6
      00A073 52 41 4D 32 45 45      878 	.ascii "RAM2EE"
                                    879 	
      00A079                        880 RAM2EE:
                                    881 ; copy ud on top 
      00A079 90 93            [ 1]  882 	ldw y,x 
      00A07B 90 EE 06         [ 2]  883 	ldw y,(6,y) ; LSW of ud  
      00A07E 90 BF 24         [ 2]  884 	ldw YTEMP,y 
      00A081 90 93            [ 1]  885 	ldw y,x 
      00A083 90 EE 04         [ 2]  886 	ldw y,(4,y)  ; MSW of ud 
      00A086 1D 00 04         [ 2]  887 	subw x,#2*CELLL 
      00A089 FF               [ 2]  888 	ldw (x),y 
      00A08A 90 BE 24         [ 2]  889 	ldw y,YTEMP 
      00A08D EF 02            [ 2]  890 	ldw (2,x),y 
      00A08F CD A0 22         [ 4]  891 	call ROW2BUF 
      00A092 90 93            [ 1]  892 	ldw y,x 
      00A094 90 EE 06         [ 2]  893 	ldw y,(6,y)
      00A097 90 89            [ 2]  894 	pushw y ; udl 
      00A099 90 9F            [ 1]  895 	ld a,yl
      00A09B A4 7F            [ 1]  896 	and a,#BLOCK_SIZE-1 
      00A09D 90 5F            [ 1]  897 	clrw y 
      00A09F 90 97            [ 1]  898 	ld yl,a 
      00A0A1 72 A9 16 80      [ 2]  899 	addw y,#ROWBUFF 
      00A0A5 1D 00 02         [ 2]  900 	subw x,#CELLL 
      00A0A8 FF               [ 2]  901 	ldw (x),y  
      00A0A9 CD 85 73         [ 4]  902 	call SWAPP ;  ( ud a ra u -- )
      00A0AC CD 85 0D         [ 4]  903 	call RFROM  
      00A0AF CD A0 60         [ 4]  904 	call RFREE 
      00A0B2 CD 88 79         [ 4]  905 	call MIN
      00A0B5 CD 85 63         [ 4]  906 	call DUPP 
      00A0B8 CD 85 2C         [ 4]  907 	call TOR  
      00A0BB CD 8C 00         [ 4]  908 	call CMOVE
      00A0BE CD A0 4B         [ 4]  909 	call BUF2ROW 
      00A0C1 CD 85 0D         [ 4]  910 	call RFROM 
      00A0C4 81               [ 4]  911 	ret 
                                    912 
                                    913 ;--------------------------
                                    914 ; expand 16 bit address 
                                    915 ; to 32 bit address 
                                    916 ; FADDR ( a -- ud )
                                    917 ;--------------------------
      00A0C5 A0 72                  918 	.word LINK 
                           002047   919 	LINK=. 
      00A0C7 05                     920 	.byte 5 
      00A0C8 46 41 44 44 52         921 	.ascii "FADDR"
      00A0CD                        922 FADDR:
      00A0CD CC 8A C4         [ 2]  923 	jp ZERO 
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
      00A0D0 A0 C7                  939 	.word LINK 
                           002052   940 	LINK=.
      00A0D2 05                     941 	.byte 5 
      00A0D3 46 4D 4F 56 45         942 	.ascii "FMOVE" 
      00A0D8                        943 FMOVE:
      00A0D8 CD 86 70         [ 4]  944 	call TFLASH 
      00A0DB CD 84 BC         [ 4]  945 	CALL AT 
      00A0DE CD 84 67         [ 4]  946 	CALL QBRAN 
      00A0E1 A1 5C                  947 	.word no_move  
      00A0E3 CD 86 BF         [ 4]  948 	call CPP
      00A0E6 CD 84 BC         [ 4]  949 	call AT  
      00A0E9 CD 85 63         [ 4]  950 	call DUPP ; ( udl udl -- )
      00A0EC CD 86 A3         [ 4]  951 	call CNTXT 
      00A0EF CD 84 BC         [ 4]  952 	call AT 
      00A0F2 CD 84 34         [ 4]  953 	call DOLIT 
      00A0F5 00 02                  954 	.word 2 
      00A0F7 CD 87 D7         [ 4]  955 	call SUBB ; ( udl udl a -- )
      00A0FA CD 85 73         [ 4]  956 	call SWAPP 
      00A0FD CD A0 CD         [ 4]  957 	call FADDR 
      00A100 CD 87 1E         [ 4]  958 	call ROT  ; ( udl ud a -- )
      00A103 CD 85 63         [ 4]  959 	call DUPP 
      00A106 CD 85 2C         [ 4]  960 	call TOR    ; R: a 
      00A109                        961 FMOVE2: 
      00A109 CD 8B B3         [ 4]  962 	call HERE 
      00A10C CD 85 20         [ 4]  963 	call RAT 
      00A10F CD 87 D7         [ 4]  964 	call SUBB ; (udl ud a wl -- )
      00A112                        965 next_row:
      00A112 CD 85 63         [ 4]  966 	call DUPP 
      00A115 CD 85 2C         [ 4]  967 	call TOR  ; ( udl ud a wl -- ) R: a wl
      00A118 CD A0 79         [ 4]  968 	call RAM2EE ; ( udl a u -- udl u2 ) u2 is byte written to FLASH 
      00A11B CD 85 63         [ 4]  969 	call DUPP 
      00A11E CD 85 2C         [ 4]  970 	call TOR
      00A121 CD 87 5E         [ 4]  971 	call PLUS  ; ( udl+ ) 
      00A124 CD 85 63         [ 4]  972 	call DUPP 
      00A127 CD 8A C4         [ 4]  973 	call ZERO   ; ( udl+ ud -- )
      00A12A CD 85 0D         [ 4]  974 	call RFROM  ; ( udl+ ud u2  R: a wl ) 
      00A12D CD 85 0D         [ 4]  975 	call RFROM  ; ( udl+ ud u2 wl R: a ) 
      00A130 CD 85 8D         [ 4]  976 	call OVER   ; ( udl+ ud u2 wl u2 -- )
      00A133 CD 87 D7         [ 4]  977 	call SUBB  ; ( udl+ ud u2 wl- R: a )
      00A136 CD 85 63         [ 4]  978 	call DUPP 
      00A139 CD 84 67         [ 4]  979 	call QBRAN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      00A13C A1 55                  980 	.word fmove_done 
      00A13E CD 85 73         [ 4]  981 	call SWAPP  ; ( udl+ ud wl- u2 R: a )
      00A141 CD 85 0D         [ 4]  982 	call RFROM ; ( udl+ ud wl- u2 a -- ) 
      00A144 CD 87 5E         [ 4]  983 	call PLUS  ; ( udl+2 ud wl- a+ )
      00A147 CD 85 63         [ 4]  984 	call DUPP 
      00A14A CD 85 2C         [ 4]  985 	call TOR   ; ( udl+2 ud wl- a+ ) R: a+
      00A14D CD 85 73         [ 4]  986 	call SWAPP 
      00A150 CD 84 7E         [ 4]  987 	call BRAN
      00A153 A1 12                  988 	.word next_row  
      00A155                        989 fmove_done:	
      00A155 CD 85 0D         [ 4]  990 	call RFROM  ; ( -- udl+ ud u2 wl- a  )
      00A158 1C 00 0A         [ 2]  991 	addw x,#5*CELLL ; (  -- cp+ ) new CP 
      00A15B 81               [ 4]  992  	ret  
      00A15C                        993 no_move:
      00A15C CD 8A C4         [ 4]  994 	call ZERO
      00A15F 81               [ 4]  995 	ret 
                                    996 
                                    997 ;------------------------------------------
                                    998 ; adjust pointers after **FMOVE** operetion.
                                    999 ; UPDAT-PTR ( cp+ -- )
                                   1000 ; cp+ is new CP position after FMOVE 
                                   1001 ;-------------------------------------------
      00A160 A0 D2                 1002 	.word LINK 
                           0020E2  1003 	LINK=.
      00A162 09                    1004 	.byte 9
      00A163 55 50 44 41 54 2D 50  1005 	.ascii "UPDAT-PTR" 
             54 52
      00A16C                       1006 UPDATPTR:
                                   1007 ;reset VP to previous position  
      00A16C CD 9B B2         [ 4] 1008 	call EEPVP 
      00A16F CD 85 59         [ 4] 1009 	call DROP 
      00A172 CD 84 BC         [ 4] 1010 	call AT
      00A175 CD 86 B1         [ 4] 1011 	call VPP 
      00A178 CD 84 A5         [ 4] 1012 	call STORE
                                   1013 ;update CONTEXT and LAST 
      00A17B CD 9B 9C         [ 4] 1014 	call EEPCP 
      00A17E CD 85 59         [ 4] 1015 	call DROP
      00A181 CD 84 BC         [ 4] 1016 	call AT
      00A184 CD 84 34         [ 4] 1017 	call DOLIT 
      00A187 00 02                 1018 	.word 2 
      00A189 CD 87 5E         [ 4] 1019 	call PLUS 
      00A18C CD 85 63         [ 4] 1020 	call DUPP 
      00A18F CD 86 A3         [ 4] 1021 	call CNTXT 
      00A192 CD 84 A5         [ 4] 1022 	call STORE
      00A195 CD 86 CF         [ 4] 1023 	call LAST
      00A198 CD 84 A5         [ 4] 1024 	call STORE 
      00A19B CD 9B CC         [ 4] 1025 	call UPDATLAST 
                                   1026 ;update CP 
      00A19E CD 86 BF         [ 4] 1027 	call CPP 
      00A1A1 CD 84 A5         [ 4] 1028 	call STORE
      00A1A4 CD 9B F5         [ 4] 1029 	call UPDATCP 
      00A1A7 81               [ 4] 1030 	ret 
                                   1031 
                                   1032 ;-----------------------------
                                   1033 ; move interrupt sub-routine
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



                                   1034 ; in flash memory
                                   1035 ;----------------------------- 
      00A1A8 A1 62                 1036 	.word LINK 
                           00212A  1037 	LINK=. 
      00A1AA 06                    1038 	.byte 6
      00A1AB 49 46 4D 4F 56 45     1039 	.ascii "IFMOVE" 
      00A1B1                       1040 IFMOVE:
      00A1B1 CD 86 70         [ 4] 1041 	call TFLASH 
      00A1B4 CD 84 BC         [ 4] 1042 	CALL AT 
      00A1B7 CD 84 67         [ 4] 1043 	CALL QBRAN 
      00A1BA A1 5C                 1044 	.word no_move 
      00A1BC CD 86 BF         [ 4] 1045 	call CPP 
      00A1BF CD 84 BC         [ 4] 1046 	call AT 
      00A1C2 CD 85 63         [ 4] 1047 	call DUPP ; ( udl udl -- )
      00A1C5 CD 9B B2         [ 4] 1048 	call EEPVP 
      00A1C8 CD 85 59         [ 4] 1049 	call DROP
      00A1CB CD 84 BC         [ 4] 1050 	call AT  ; ( udl udl a )
      00A1CE CD 85 2C         [ 4] 1051 	call TOR 
      00A1D1 CD A0 CD         [ 4] 1052 	call FADDR
      00A1D4 CD 85 20         [ 4] 1053 	call RAT ; ( udl ud a -- ) R: a 
      00A1D7 CC A1 09         [ 2] 1054 	jp FMOVE2 
                                   1055 
                                   1056 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



                                   4429 
                                   4430 ;===============================================================
                                   4431 
                           00212A  4432 LASTN =	LINK   ;last name defined
                                   4433 
                                   4434 ; application code begin here
      00A200                       4435 	.bndry 128 ; align on flash block  
      00A200                       4436 app_space: 
                                   4437 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   6 AB1        00077A R   |   6 ABOR1      0012CF R
  6 ABOR2      0012E6 R   |   6 ABORQ      0012C7 R   |   6 ABORT      0012B8 R
  6 ABRTQ      0015A3 R   |   6 ABSS       000771 R   |   6 ACCEP      00124E R
  6 ACCP1      001257 R   |   6 ACCP2      00127D R   |   6 ACCP3      001280 R
  6 ACCP4      001282 R   |     ADC_CR1 =  005401     |     ADC_CR1_=  000000 
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
  6 AFT        00158E R   |   6 AGAIN      0014E4 R   |   6 AHEAD      001541 R
  6 ALLOT      0013F7 R   |   6 ANDD       00052F R   |     APP_CP  =  004004 
    APP_LAST=  004000     |     APP_RUN =  004002     |     APP_VP  =  004006 
  6 AT         00043C R   |   6 ATEXE      000B69 R   |   6 AUTORUN    000127 R
    AWU_APR =  0050F1     |     AWU_CSR =  0050F0     |     AWU_TBR =  0050F2 
    B0_MASK =  000001     |     B115200 =  000006     |     B19200  =  000003 
    B1_MASK =  000002     |     B230400 =  000007     |     B2400   =  000000 
    B2_MASK =  000004     |     B38400  =  000004     |     B3_MASK =  000008 
    B460800 =  000008     |     B4800   =  000001     |     B4_MASK =  000010 
    B57600  =  000005     |     B5_MASK =  000020     |     B6_MASK =  000040 
    B7_MASK =  000080     |     B921600 =  000009     |     B9600   =  000002 
  6 BACK1      0011F6 R   |   6 BASE       0005A0 R   |     BASEE   =  00000A 
    BCNT    =  000001     |   6 BCOMP      001439 R   |   6 BDIGS      000C51 R
    BEEP_BIT=  000004     |     BEEP_CSR=  0050F3     |     BEEP_MAS=  000010 
    BEEP_POR=  00000F     |   6 BEGIN      0014C6 R   |     BIT0    =  000000 
    BIT1    =  000001     |     BIT2    =  000002     |     BIT3    =  000003 
    BIT4    =  000004     |     BIT5    =  000005     |     BIT6    =  000006 
    BIT7    =  000007     |   6 BKSLA      00108E R   |   6 BKSP       0011C6 R
    BKSPP   =  000008     |   6 BLANK      000A37 R   |     BLOCK_SI=  000080 
    BOOT_ROM=  006000     |     BOOT_ROM=  007FFF     |   6 BRAN       0003FE R
    BTW     =  000001     |   6 BUF2ROW    001FCB R   |   6 BYE        0000B4 R
    CADR    =  000003     |     CALLL   =  0000CD     |     CAN_DGR =  005426 
    CAN_FPSR=  005427     |     CAN_IER =  005425     |     CAN_MCR =  005420 
    CAN_MSR =  005421     |     CAN_P0  =  005428     |     CAN_P1  =  005429 
    CAN_P2  =  00542A     |     CAN_P3  =  00542B     |     CAN_P4  =  00542C 
    CAN_P5  =  00542D     |     CAN_P6  =  00542E     |     CAN_P7  =  00542F 
    CAN_P8  =  005430     |     CAN_P9  =  005431     |     CAN_PA  =  005432 
    CAN_PB  =  005433     |     CAN_PC  =  005434     |     CAN_PD  =  005435 
    CAN_PE  =  005436     |     CAN_PF  =  005437     |     CAN_RFR =  005424 
    CAN_TPR =  005423     |     CAN_TSR =  005422     |     CARRY   =  000028 
  6 CAT        00045A R   |   6 CCOMMA     00141B R   |     CC_C    =  000000 
    CC_H    =  000004     |     CC_I0   =  000003     |     CC_I1   =  000005 
    CC_N    =  000002     |     CC_V    =  000007     |     CC_Z    =  000001 
    CELLL   =  000002     |   6 CELLM      0009BC R   |   6 CELLP      0009AD R
  6 CELLS      0009CB R   |     CFG_GCR =  007F60     |     CFG_GCR_=  000001 
    CFG_GCR_=  000000     |   6 CHAR1      000E7E R   |   6 CHAR2      000E81 R
  6 CHKIVEC    001EB9 R   |     CLKOPT  =  004807     |     CLKOPT_C=  000002 
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
    CLK_SWR_=  0000D2     |   6 CMOV1      000B88 R   |   6 CMOV2      000BA0 R
  6 CMOVE      000B80 R   |     CNTDWN  =  000030     |   6 CNTXT      000623 R
  6 COLD       001998 R   |   6 COLD1      001998 R   |   6 COLON      001739 R
  6 COMMA      001404 R   |   6 COMPI      001449 R   |     COMPO   =  000040 
  6 CONSTANT   0017E3 R   |   6 COUNT      000B1C R   |   6 CPP        00063F R
    CPU_A   =  007F00     |     CPU_CCR =  007F0A     |     CPU_PCE =  007F01 
    CPU_PCH =  007F02     |     CPU_PCL =  007F03     |     CPU_SPH =  007F08 
    CPU_SPL =  007F09     |     CPU_XH  =  007F04     |     CPU_XL  =  007F05 
    CPU_YH  =  007F06     |     CPU_YL  =  007F07     |   6 CR         000EAC R
  6 CREAT      00177F R   |     CRR     =  00000D     |   6 CSTOR      000449 R
  6 DAT        000AFC R   |     DATSTK  =  001680     |   6 DDROP      0006BE R
  6 DDUP       0006C9 R   |     DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF 
  6 DECIM      000D01 R   |   6 DEPTH      000A87 R   |     DEVID_BA=  0048CD 
    DEVID_EN=  0048D8     |     DEVID_LO=  0048D2     |     DEVID_LO=  0048D3 
    DEVID_LO=  0048D4     |     DEVID_LO=  0048D5     |     DEVID_LO=  0048D6 
    DEVID_LO=  0048D7     |     DEVID_LO=  0048D8     |     DEVID_WA=  0048D1 
    DEVID_XH=  0048CE     |     DEVID_XL=  0048CD     |     DEVID_YH=  0048D0 
    DEVID_YL=  0048CF     |   6 DGTQ1      000D46 R   |   6 DI         0000C2 R
  6 DIG        000C7A R   |   6 DIGIT      000C15 R   |   6 DIGS       000C8B R
  6 DIGS1      000C8B R   |   6 DIGS2      000C98 R   |   6 DIGTQ      000D15 R
    DM_BK1RE=  007F90     |     DM_BK1RH=  007F91     |     DM_BK1RL=  007F92 
    DM_BK2RE=  007F93     |     DM_BK2RH=  007F94     |     DM_BK2RL=  007F95 
    DM_CR1  =  007F96     |     DM_CR2  =  007F97     |     DM_CSR1 =  007F98 
    DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A     |   6 DN1        000738 R
  6 DNEGA      00071B R   |   6 DOCONST    00180D R   |   6 DOLIT      0003B4 R
  6 DONXT      0003C8 R   |   6 DOSTR      000EC2 R   |   6 DOT        000F47 R
  6 DOT1       000F5D R   |   6 DOTI1      00192F R   |   6 DOTID      001919 R
  6 DOTO1      00135B R   |   6 DOTOK      001341 R   |   6 DOTPR      001070 R
  6 DOTQ       0015BD R   |   6 DOTQP      000EEB R   |   6 DOTR       000EF9 R
  6 DOTS       0018BB R   |   6 DOTS1      0018C6 R   |   6 DOTS2      0018CF R
  6 DOVAR      000590 R   |   6 DROP       0004D9 R   |   6 DSTOR      000AD6 R
  6 DUMP       001871 R   |   6 DUMP1      001888 R   |   6 DUMP3      0018AA R
  6 DUMPP      001840 R   |   6 DUPP       0004E3 R   |   6 EDIGS      000CB6 R
  6 EEPCP      001B1C R   |   6 EEPLAST    001AEF R   |   6 EEPROM     001AD7 R
    EEPROM_B=  004000     |     EEPROM_E=  0047FF     |     EEPROM_S=  000800 
  6 EEPRUN     001B06 R   |   6 EEPVP      001B32 R   |   6 EI         0000BB R
  6 ELSEE      00151C R   |   6 EMIT       00039E R   |   6 ENEPER     001A47 R
  6 EQ1        000795 R   |   6 EQUAL      00077F R   |   6 ERASE      000BE2 R
    ERR     =  00001B     |   6 EVAL       001384 R   |   6 EVAL1      001384 R
  6 EVAL2      0013A0 R   |   6 EXE1       000B77 R   |   6 EXECU      00040E R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]

Symbol Table

  6 EXIT       00041E R   |     EXT     =  000000     |     EXTI_CR1=  0050A0 
    EXTI_CR2=  0050A1     |   6 EXTRC      000C3D R   |   6 FADDR      00204D R
    FHSE    =  7A1200     |     FHSI    =  F42400     |   6 FILL       000BAF R
  6 FILL1      000BCC R   |   6 FILL2      000BD5 R   |   6 FIND       001122 R
  6 FIND1      001140 R   |   6 FIND2      00116E R   |   6 FIND3      00117A R
  6 FIND4      00118E R   |   6 FIND5      00119B R   |   6 FIND6      00117F R
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
    FLSI    =  01F400     |   6 FMOVE      002058 R   |   6 FMOVE2     002089 R
  6 FOR        001499 R   |   6 FORGET     000158 R   |   6 FORGET1    000187 R
  6 FORGET2    00020D R   |   6 FORGET4    000216 R   |   6 FORGET6    0001CF R
    FPTR    =  000032     |   6 FREEVAR    000223 R   |   6 FREEVAR4   000259 R
    GPIO_BAS=  005000     |     GPIO_CR1=  000003     |     GPIO_CR2=  000004 
    GPIO_DDR=  000002     |     GPIO_IDR=  000001     |     GPIO_ODR=  000000 
    GPIO_SIZ=  000005     |   6 HERE       000B33 R   |   6 HEX        000CEC R
  6 HI         00196B R   |   6 HLD        000610 R   |   6 HOLD       000C61 R
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
    I2C_WRIT=  000000     |   6 ICOLON     00174A R   |   6 IFETCH     0014B7 R
  6 IFF        0014F4 R   |   6 IFMOVE     002131 R   |     IMEDD   =  000080 
  6 IMMED      00175C R   |   6 INCH       000392 R   |   6 INITOFS    001712 R
  6 INN        0005BE R   |     INPUT_DI=  000000     |     INPUT_EI=  000001 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]

Symbol Table

    INPUT_FL=  000000     |     INPUT_PU=  000001     |   6 INTE1      001323 R
  6 INTER      0012F9 R   |     INT_ADC2=  000016     |     INT_AUAR=  000012 
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
  6 ISEMI      0016A7 R   |     ITC_SPR1=  007F70     |     ITC_SPR2=  007F71 
    ITC_SPR3=  007F72     |     ITC_SPR4=  007F73     |     ITC_SPR5=  007F74 
    ITC_SPR6=  007F75     |     ITC_SPR7=  007F76     |     ITC_SPR8=  007F77 
    IWDG_KR =  0050E0     |     IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2 
  6 JSRC       0016FC R   |   6 KEY        000E2C R   |   6 KTAP       001213 R
  6 KTAP1      001236 R   |   6 KTAP2      001239 R   |   6 LAST       00064F R
  6 LASTN   =  00212A R   |   6 LBRAC      001330 R   |     LED2_BIT=  000005 
    LED2_MAS=  000020     |     LED2_POR=  00500A     |   6 LESS       0007BC R
    LF      =  00000A     |   6 LINK    =  00212A R   |   6 LITER      00146B R
  6 LN2S       001AA3 R   |   6 LOG2S      001A8D R   |   6 LSHIFT     0009F6 R
  6 LSHIFT1    0009FF R   |   6 LSHIFT4    000A07 R   |   6 LT1        0007D2 R
    MASKK   =  001F7F     |   6 MAX        0007DC R   |   6 MAX1       0007EF R
  6 MIN        0007F9 R   |   6 MIN1       00080C R   |   6 MMOD1      0008AF R
  6 MMOD2      0008C3 R   |   6 MMOD3      0008DA R   |   6 MMSM1      000856 R
  6 MMSM2      00086A R   |   6 MMSM3      00086C R   |   6 MMSM4      000874 R
  6 MODD       0008F4 R   |   6 MONE       000A5D R   |     MS      =  00002E 
  6 MSEC       0002CE R   |   6 MSMOD      000892 R   |   6 MSTA1      000985 R
  6 MSTAR      000962 R   |     NAFR    =  004804     |   6 NAMEQ      0011BB R
  6 NAMET      0010CC R   |     NCLKOPT =  004808     |   6 NEGAT      000709 R
  6 NEX1       0003D5 R   |   6 NEXT       0014A8 R   |     NFLASH_W=  00480E 
    NHSECNT =  00480A     |     NOPT1   =  004802     |     NOPT2   =  004804 
    NOPT3   =  004806     |     NOPT4   =  004808     |     NOPT5   =  00480A 
    NOPT6   =  00480C     |     NOPT7   =  00480E     |     NOPTBL  =  00487F 
  6 NTIB       0005CE R   |     NUBC    =  004802     |   6 NUFQ       000E42 R
  6 NUFQ1      000E5B R   |   6 NUMBQ      000D59 R   |   6 NUMQ1      000D8D R
  6 NUMQ2      000DBE R   |   6 NUMQ3      000E00 R   |   6 NUMQ4      000E05 R
  6 NUMQ5      000E14 R   |   6 NUMQ6      000E17 R   |     NWDGOPT =  004806 
    NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF 
    NWDGOPT_=  FFFFFFFE     |   6 NonHandl   000000 R   |   6 OFFSET     000674 R
    OFS     =  000005     |   6 ONE        000A4F R   |   6 ONEM       0009E5 R
  6 ONEP       0009D8 R   |     OPT     =  000002     |     OPT0    =  004800 
    OPT1    =  004801     |     OPT2    =  004803     |     OPT3    =  004805 
    OPT4    =  004807     |     OPT5    =  004809     |     OPT6    =  00480B 
    OPT7    =  00480D     |     OPTBL   =  00487E     |     OPTION_B=  004800 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]

Symbol Table

    OPTION_E=  00487F     |     OPTION_S=  000080     |   6 ORIG       000047 R
  6 ORR        000543 R   |   6 OUTPUT     0003A3 R   |     OUTPUT_F=  000001 
    OUTPUT_O=  000000     |     OUTPUT_P=  000001     |     OUTPUT_S=  000000 
  6 OVER       00050D R   |   6 OVERT      001678 R   |     PA      =  000000 
  6 PACKS      000BF4 R   |   6 PAD        000B44 R   |   6 PAREN      00107F R
  6 PARS       000F78 R   |   6 PARS1      000FA3 R   |   6 PARS2      000FCE R
  6 PARS3      000FD1 R   |   6 PARS4      000FDA R   |   6 PARS5      000FFD R
  6 PARS6      001012 R   |   6 PARS7      001021 R   |   6 PARS8      001030 R
  6 PARSE      001041 R   |   6 PAUSE      0002DE R   |     PA_BASE =  005000 
    PA_CR1  =  005003     |     PA_CR2  =  005004     |     PA_DDR  =  005002 
    PA_IDR  =  005001     |     PA_ODR  =  005000     |     PB      =  000005 
    PB_BASE =  005005     |     PB_CR1  =  005008     |     PB_CR2  =  005009 
    PB_DDR  =  005007     |     PB_IDR  =  005006     |     PB_ODR  =  005005 
    PC      =  00000A     |     PC_BASE =  00500A     |     PC_CR1  =  00500D 
    PC_CR2  =  00500E     |     PC_DDR  =  00500C     |     PC_IDR  =  00500B 
    PC_ODR  =  00500A     |     PD      =  00000F     |   6 PDUM1      001853 R
  6 PDUM2      001864 R   |     PD_BASE =  00500F     |     PD_CR1  =  005012 
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
  6 PICK       000A9E R   |   6 PII        001A06 R   |     PI_BASE =  005028 
    PI_CR1  =  00502B     |     PI_CR2  =  00502C     |     PI_DDR  =  00502A 
    PI_IDR  =  005029     |     PI_ODR  =  005028     |   6 PLUS       0006DE R
  6 PNAM1      00162D R   |   6 PRESE      0013AF R   |     PROD1   =  000022 
    PROD2   =  000024     |     PROD3   =  000026     |   6 PROTECTE   0001FF R
  6 PSTOR      000AB5 R   |     PTR16   =  000033     |     PTR8    =  000034 
  6 QBRAN      0003E7 R   |   6 QDUP       00068D R   |   6 QDUP1      000697 R
  6 QKEY       000380 R   |   6 QSTAC      001367 R   |   6 QUERY      001293 R
  6 QUEST      000F6A R   |   6 QUIT       0013CC R   |   6 QUIT1      0013D4 R
  6 QUIT2      0013D7 R   |   6 RAM2EE     001FF9 R   |     RAMBASE =  000000 
  6 RAMLAST    000662 R   |     RAM_BASE=  000000     |     RAM_END =  0017FF 
    RAM_SIZE=  001800     |   6 RANDOM     00027C R   |   6 RAT        0004A0 R
  6 RBRAC      0016E9 R   |   6 REPEA      001571 R   |   6 RFREE      001FE0 R
  6 RFROM      00048D R   |     ROP     =  004800     |   6 ROT        00069E R
  6 ROW2BUF    001FA2 R   |     ROWBUFF =  001680     |     RP0     =  00002C 
  6 RPAT       00046A R   |     RPP     =  0017FF     |   6 RPSTO      000477 R
  6 RSHIFT     000A12 R   |   6 RSHIFT1    000A1B R   |   6 RSHIFT4    000A23 R
    RST_SR  =  0050B3     |   6 RT12_2     001A76 R   |   6 SAME1      0010EA R
  6 SAME2      001113 R   |   6 SAMEQ      0010E2 R   |   6 SCOM1      001662 R
  6 SCOM2      001665 R   |   6 SCOMP      001644 R   |   6 SEED       000263 R
    SEEDX   =  000036     |     SEEDY   =  000038     |   6 SEMIS      001688 R
  6 SETISP     0000CE R   |   6 SET_RAML   0017CC R   |     SFR_BASE=  005000 
    SFR_END =  0057FF     |   6 SIGN       000CA0 R   |   6 SIGN1      000CB0 R
  6 SLASH      0008FE R   |   6 SLMOD      0008E2 R   |   6 SNAME      0015F7 R
    SP0     =  00002A     |   6 SPACE      000E64 R   |   6 SPACS      000E73 R
  6 SPAT       0004C3 R   |     SPI_CR1 =  005200     |     SPI_CR2 =  005201 
    SPI_CRCP=  005205     |     SPI_DR  =  005204     |     SPI_ICR =  005202 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]

Symbol Table

    SPI_RXCR=  005206     |     SPI_SR  =  005203     |     SPI_TXCR=  005207 
    SPP     =  001680     |     SPSAVE  =  000001     |   6 SPSTO      0004D0 R
  6 SQRT10     001A5F R   |   6 SQRT2      001A1D R   |   6 SQRT3      001A34 R
  6 SSMOD      00098E R   |     SSP     =  000001     |     STACK   =  0017FF 
  6 STAR       000957 R   |   6 STASL      00099F R   |   6 STOD       000740 R
  6 STORE      000425 R   |   6 STR        000CCE R   |   6 STRCQ      001479 R
  6 STRQ       0015B0 R   |   6 STRQP      000EE1 R   |   6 SUBB       000757 R
  6 SWAPP      0004F3 R   |     SWIM_CSR=  007F80     |   6 TAP        0011FD R
  6 TBOOT      00198C R   |   6 TBUF       0005DE R   |     TBUFFBAS=  001680 
  6 TCHA1      000A7E R   |   6 TCHAR      000A6E R   |   6 TEMP       0005AF R
  6 TEVAL      000601 R   |   6 TFLASH     0005F0 R   |   6 THENN      001509 R
  6 TIB        000B55 R   |     TIBB    =  001700     |     TIBBASE =  001700 
    TIC     =  000027     |   6 TICK       0013E3 R   |     TIM1_ARR=  005262 
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
  6 TNAM2      0018E9 R   |   6 TNAM3      001907 R   |   6 TNAM4      00190D R
  6 TNAME      0018E6 R   |   6 TOFLASH    000333 R   |   6 TOKEN      0010BE R
  6 TOR        0004AC R   |   6 TORAM      000373 R   |     TRUEE   =  00FFFF 
  6 TWOSL      000A2A R   |   6 TYPE1      000E93 R   |   6 TYPE2      000E9F R
  6 TYPES      000E8E R   |   6 Timer4Ha   000005 R   |     UART1   =  000000 
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
  6 UDOT       000F34 R   |   6 UDOTR      000F14 R   |   6 UEND       000045 R
    UHLD    =  000012     |     UINN    =  00000A     |     UINTER  =  000010 
    ULAST   =  00001A     |   6 ULES1      0007B4 R   |   6 ULESS      00079E R
  6 UMMOD      000834 R   |   6 UMSTA      00090D R   |   6 UNIQ1      0015EE R
  6 UNIQU      0015CF R   |   6 UNTIL      0014D1 R   |     UOFFSET =  00001C 
  6 UPDATCP    001B75 R   |   6 UPDATLAS   001B4C R   |   6 UPDATPTR   0020EC R
  6 UPDATRUN   001B64 R   |   6 UPDATVP    001B8C R   |   6 UPL1       000584 R
  6 UPLUS      00056D R   |     UPP     =  000006     |     URLAST  =  000020 
    USR_BTN_=  000004     |     USR_BTN_=  000010     |     USR_BTN_=  005015 
    UTFLASH =  00001E     |     UTIB    =  00000E     |     UTMP    =  000008 
  6 UTYP1      001823 R   |   6 UTYP2      001832 R   |   6 UTYPE      00181E R
    UVP     =  000016     |   6 UZERO      00002B R   |   6 VARIA      001799 R
    VAR_BASE=  000080     |     VAR_TOP =  0017BF     |     VER     =  000003 
  6 VPP        000631 R   |     VSIZE   =  000006     |     WANT_DEB=  000000 
    WANT_MAT=  000001     |     WANT_SEE=  000000     |     WDGOPT  =  004805 
    WDGOPT_I=  000002     |     WDGOPT_L=  000003     |     WDGOPT_W=  000000 
    WDGOPT_W=  000001     |   6 WHILE      001557 R   |   6 WITHI      000819 R
  6 WORDD      0010AA R   |   6 WORDS      001943 R   |   6 WORS1      001949 R
  6 WORS2      001965 R   |     WWDG_CR =  0050D1     |     WWDG_WR =  0050D2 
  6 XORR       000558 R   |     XTEMP   =  000022     |     YTEMP   =  000024 
  6 ZERO       000A44 R   |   6 ZL1        000525 R   |   6 ZLESS      00051C R
  6 app_spac   002180 R   |   6 block_er   001D0F R   |   6 clear_ra   000019 R
  6 clock_in   000062 R   |   6 copy_buf   001D66 R   |   6 copy_buf   001D85 R
  6 copy_pro   001D85 R   |     da      =  000002     |     db      =  000003 
    dc      =  000000     |     dd      =  000001     |   6 ee_ccomm   001F80 R
  6 ee_comma   001F5F R   |   6 ee_cstor   001C7C R   |   6 ee_store   001CC8 R
  6 erase_fl   001D2B R   |   6 farat      001B9D R   |   6 farcat     001BB9 R
  6 fmove_do   0020D5 R   |   6 fptr_sto   001AB8 R   |   6 inc_fptr   001C4A R
  6 lock       001C36 R   |   6 main       000016 R   |   6 next_row   002092 R
  6 no_move    0020DC R   |   6 pristine   001E00 R   |   6 proceed_   001D2E R
  6 reboot     000325 R   |   6 reset_ve   001E67 R   |   6 row_eras   001CF2 R
  6 row_eras   001D3F R   |   6 row_eras   001D66 R   |   6 set_opti   001DD4 R
  6 set_vect   001F08 R   |   6 uart1_in   000074 R   |   6 unlock     001C0E R
  6 unlock_e   001BD0 R   |   6 unlock_f   001BEF R   |   6 write_by   001C61 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]

Symbol Table

  6 write_ro   001DAA R

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

