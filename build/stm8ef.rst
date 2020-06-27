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
                                                .include "inc/config.inc" 
                                        ;;
                                        ; Copyright Jacques Deschênes 2019,2020 
                                        ; This file is part of stm8_eForth  
                                        ;
                                        ;     stm8_eForth is free software: you can redistribute it and/or modify
                                        ;     it under the terms of the GNU General Public License as published by
                                        ;     the Free Software Foundation, either version 3 of the License, or
                                        ;     (at your option) any later version.
                                        ;
                                        ;     stm8_eForth is distributed in the hope that it will be useful,
                                        ;     but WITHOUT ANY WARRANTY; without even the implied warranty of
                                        ;     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                                        ;     GNU General Public License for more details.
                                        ;
                                        ;     You should have received a copy of the GNU General Public License
                                        ;     along with stm8_eForth.  If not, see <http://www.gnu.org/licenses/>.
                                        ;;
                                        
                                        
                                        ; constants to select board
                                        ; to assemble for a specific 
                                        ; board set it to 1 and the other
                                        ; to 0. 
                                 
                                 
                                        
                                        ; set to 1 to include 
                                        ; scaling constants vocabulary
                                        ; see: const_ratio.asm 
                                 
                                        
                                        ; set to 1 to include 
                                        ; constants tables vocabulary 
                                        ; see: ctable.asm 
                                 
                                        
                                        ; how many bytes are reserved 
                                        ; by system at EEPROM base.
                                 
                                        
                                        ; size in bytes of EXTENDED MEMORY 
                                 
                                 
                                 
                                        XMEM_SIZE=0 
                                        .endif 
                                        
                                 
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
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        	.include "inc/stm8s105.inc"
                                        	.include "inc/stm8s_disco.inc"
                                        .endif 
                                     19 	.list
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 2.
Hexadecimal [24-Bits]



                                     21 
                                     22 ;===============================================================
                                     23 ;  Adaption to NUCLEO-8S208RB by Picatout
                                     24 ;  Date: 2020-06-07 
                                     25 ;       Suite aux nombreux changement remplacé le numéro de version pour 3.0
                                     26 ;  Date: 2019-10-26
                                     27 ;  Changes to memory map:
                                     28 ;       0x16f0  Data Stack, growing downward
                                     29 ;       0x1700  Terminal input buffer TIB
                                     30 ;       0x17ff  Return Stack, growing downard
                                     31 ;================================================================
                                     32 ;       STM8EF, Version 2.1, 13 July
                                     33 ;               Implemented on STM8S-Discovery Board.
                                     34 ;               Assembled by ST VisualDevelop STVD 
                                     35 ;               Bootup on internal 2 MHz clock
                                     36 ;               Switch to external 16 MHz crystal clock
                                     37 ;
                                     38 ; FORTH Virtual Machine:
                                     39 ; Subroutine threaded model
                                     40 ; SP Return stack pointer
                                     41 ; X Data stack pointer
                                     42 ; A,Y Scratch pad registers
                                     43 ;
                                     44 ; Memory Map:
                                     45 ; 0x0 RAM memory, system variables
                                     46 ; 0x80 Start of user defined words, linked to ROM dictionary
                                     47 ; 0x780 Data stack, growing downward
                                     48 ; 0x790 Terminal input buffer TIB
                                     49 ; 0x7FF Return stack, growing downward
                                     50 ; 0x8000 Interrupt vector table
                                     51 ; 0x8080 FORTH startup code
                                     52 ; 0x80E7 Start of FORTH dictionary in ROM
                                     53 ; 0x9584 End of FORTH dictionary
                                     54 ;
                                     55 ;       2020-04-26 Addapted for NUCLEO-8S208RB by Picatout 
                                     56 ;                  use UART1 instead of UART3 for communication with user.
                                     57 ;                  UART1 is available as ttyACM* device via USB connection.
                                     58 ;                  Use TIMER4 for millisecond interrupt to support MS counter 
                                     59 ;                  and MSEC word that return MS value.
                                     60 ;
                                     61 ;       EF12, Version 2.1, 18apr00cht
                                     62 ;               move to 8000H replacing WHYP.
                                     63 ;               copy interrupt vectors from WHYPFLSH.S19
                                     64 ;               to EF12.S19 before flashing
                                     65 ;               add TICKS1 and DELAY1 for motor stepping
                                     66 ;
                                     67 ;       EF12, 02/18/00, C. H. Ting
                                     68 ;       Adapt 86eForth v2.02 to 68HC12.
                                     69 ;               Use WHYP to seed EF12.ASM
                                     70 ;               Use AS12 native 68HC12 assembler:
                                     71 ;               as12 ef12.asm >ef12.lst
                                     72 ;       EF12A, add ADC code, 02mar00cht
                                     73 ;       EF12B, 01mar00cht
                                     74 ;               stack to 0x78, return stack to 0xf8.
                                     75 ;               add all port definitions
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 3.
Hexadecimal [24-Bits]



                                     76 ;               add PWM registers
                                     77 ;               add SPI registers and code
                                     78 ;       EF12C, 12mar00cht
                                     79 ;               add MAX5250 D/A converter
                                     80 ;       EF12D, 15mar00cht
                                     81 ;               add all the Lexel interface words
                                     82 ;       EF12E, 18apr00cht, save for reference
                                     83 ;
                                     84 ;       Copyright (c) 2000
                                     85 ;       Dr. C. H. Ting
                                     86 ;       156 14th Avenue
                                     87 ;       San Mateo, CA 94402
                                     88 ;       (650) 571-7639
                                     89 ;
                                     90 
                                     91 
                                     92 ;*********************************************************
                                     93 ;	Assembler constants
                                     94 ;*********************************************************
                           000000    95 RAMBASE =	0x0000	   ;ram base
                           000001    96 .if NUCLEO 
                           0017FF    97 STACK   =	0x17FF 	;system (return) stack empty 
                           001680    98 DATSTK  =	0x1680	;data stack  empty
                           001680    99 TBUFFBASE =     0x1680  ; flash read/write transaction buffer address  
                           001700   100 TIBBASE =       0X1700  ; transaction input buffer addr.
                           000000   101 .else ; DISCOVERY
                                    102 STACK   =	0x7FF 	;system (return) stack empty 
                                    103 DATSTK  =	0x680	;data stack  empty
                                    104 TBUFFBASE =     0x680  ; flash read/write transaction buffer address  
                                    105 TIBBASE =       0X700  ; transaction input buffer addr.
                                    106 .endif
                                    107 
                                    108 ;; Memory allocation
                           000006   109 UPP     =     RAMBASE+6          ; systeme variables base address 
                           001680   110 SPP     =     RAMBASE+DATSTK     ; data stack bottom 
                           0017FF   111 RPP     =     RAMBASE+STACK      ;  return stack bottom
                           001680   112 ROWBUFF =     RAMBASE+TBUFFBASE ; flash write buffer 
                           001700   113 TIBB    =     RAMBASE+TIBBASE  ; transaction input buffer
                           000080   114 VAR_BASE =    RAMBASE+0x80  ; user variables start here .
                           0017BF   115 VAR_TOP =     STACK-32*CELLL  ; reserve 32 cells for data stack. 
                                    116 
                                    117 ; user variables constants 
                           000006   118 UBASE = UPP       ; numeric base 
                           000008   119 UTMP = UBASE+2    ; temporary storage
                           00000A   120 UINN = UTMP+2     ; >IN tib pointer 
                           00000C   121 UCTIB = UINN+2    ; tib count 
                           00000E   122 UTIB = UCTIB+2    ; tib address 
                           000010   123 UINTER = UTIB+2   ; interpreter vector 
                           000012   124 UHLD = UINTER+2   ; hold 
                           000014   125 UCNTXT = UHLD+2   ; context, dictionary first link 
                           000016   126 UVP = UCNTXT+2    ; variable pointer 
                           000018   127 UCP = UVP+2      ; code pointer
                           00001A   128 ULAST = UCP+2    ; last dictionary pointer 
                           00001C   129 UOFFSET = ULAST+2 ; distance between CP and VP to adjust jump address at compile time.
                           00001E   130 UTFLASH = UOFFSET+2 ; select where between FLASH and RAM for compilation destination. 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 4.
Hexadecimal [24-Bits]



                           000020   131 URLAST = UTFLASH+2 ; context for dictionary in RAM memory 
                                    132 
                                    133 ;******  System Variables  ******
                           000022   134 XTEMP	=	URLAST +2;address called by CREATE
                           000024   135 YTEMP	=	XTEMP+2	;address called by CREATE
                           000022   136 PROD1 = XTEMP	;space for UM*
                           000024   137 PROD2 = PROD1+2
                           000026   138 PROD3 = PROD2+2
                           000028   139 CARRY = PROD3+2
                           00002A   140 SP0	= CARRY+2	;initial data stack pointer
                           00002C   141 RP0	= SP0+2		;initial return stack pointer
                           00002E   142 MS    =   RP0+2         ; millisecond counter 
                           000030   143 CNTDWN =  MS+2          ; count down timer 
                           000032   144 FPTR = CNTDWN+2         ; 24 bits farptr 
                           000033   145 PTR16 = FPTR+1          ; middle byte of farptr 
                           000034   146 PTR8 = FPTR+2           ; least byte of farptr 
                           000036   147 SEEDX = PTR8+2          ; PRNG seed X 
                           000038   148 SEEDY = SEEDX+2         ; PRNG seed Y 
                                    149 
                                    150 ; EEPROM persistant data  
                           004000   151 APP_LAST = EEPROM_BASE ; Application last word pointer  
                           004002   152 APP_RUN = APP_LAST+2   ; application autorun address 
                           004004   153 APP_CP = APP_RUN+2   ; free application space pointer 
                           004006   154 APP_VP = APP_CP+2  ; free data space pointer 
                                    155 
                                    156 
                                    157 ;***********************************************
                                    158 ;; Version control
                                    159 
                           000003   160 VER     =     3         ;major release version
                           000000   161 EXT     =     0         ;minor extension
                                    162 
                                    163 ;; Constants
                                    164 
                           00FFFF   165 TRUEE   =     0xFFFF      ;true flag
                                    166 
                           000040   167 COMPO   =     0x40     ;lexicon compile only bit
                           000080   168 IMEDD   =     0x80     ;lexicon immediate bit
                           001F7F   169 MASKK   =     0x1F7F  ;lexicon bit mask
                                    170 
                           000002   171 CELLL   =     2       ;size of a cell
                           00000A   172 BASEE   =     10      ;default radix
                           000008   173 BKSPP   =     8       ;back space
                           00000A   174 LF      =     10      ;line feed
                           00000D   175 CRR     =     13      ;carriage return
                           00001B   176 ERR     =     27      ;error escape
                           000027   177 TIC     =     39      ;tick
                           0000CD   178 CALLL   =     0xCD     ;CALL opcodes
                           000080   179 IRET_CODE =   0x80    ; IRET opcode 
                                    180 
                                    181         .macro _ledon
                                    182         bset PC_ODR,#LED2_BIT
                                    183         .endm
                                    184 
                                    185         .macro _ledoff
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 5.
Hexadecimal [24-Bits]



                                    186         bres PC_ODR,#LED2_BIT
                                    187         .endm
                                    188 
                                    189 ;**********************************************************
                                    190         .area DATA (ABS)
      000000                        191         .org RAMBASE 
                                    192 ;**********************************************************
                                    193 
                                    194 ;**********************************************************
                                    195         .area SSEG (ABS) ; STACK
      001700                        196         .org 0x1700
      001700                        197         .ds 256 
                                    198 ; space for DATSTK,TIB and STACK         
                                    199 ;**********************************************************
                                    200 
                                    201 ;**********************************************************
                                    202         .area HOME ; vectors table
                                    203 ;**********************************************************
      008000 82 00 80 96            204 	int main	        ; reset
      008004 82 00 80 80            205 	int NonHandledInterrupt	; trap
      008008 82 00 80 80            206 	int NonHandledInterrupt	; irq0
      00800C 82 00 80 80            207 	int NonHandledInterrupt	; irq1
      008010 82 00 80 80            208 	int NonHandledInterrupt	; irq2
      008014 82 00 80 80            209 	int NonHandledInterrupt	; irq3
      008018 82 00 80 80            210 	int NonHandledInterrupt	; irq4
      00801C 82 00 80 80            211 	int NonHandledInterrupt	; irq5
      008020 82 00 80 80            212 	int NonHandledInterrupt	; irq6
      008024 82 00 80 80            213 	int NonHandledInterrupt	; irq7
      008028 82 00 80 80            214 	int NonHandledInterrupt	; irq8
      00802C 82 00 80 80            215 	int NonHandledInterrupt	; irq9
      008030 82 00 80 80            216 	int NonHandledInterrupt	; irq10
      008034 82 00 80 80            217 	int NonHandledInterrupt	; irq11
      008038 82 00 80 80            218 	int NonHandledInterrupt	; irq12
      00803C 82 00 80 80            219 	int NonHandledInterrupt	; irq13
      008040 82 00 80 80            220 	int NonHandledInterrupt	; irq14
      008044 82 00 80 80            221 	int NonHandledInterrupt	; irq15
      008048 82 00 80 80            222 	int NonHandledInterrupt	; irq16
      00804C 82 00 80 80            223 	int NonHandledInterrupt	; irq17
      008050 82 00 80 80            224 	int NonHandledInterrupt	; irq18
      008054 82 00 80 80            225 	int NonHandledInterrupt	; irq19
      008058 82 00 80 80            226 	int NonHandledInterrupt	; irq20
      00805C 82 00 80 80            227 	int NonHandledInterrupt	; irq21
      008060 82 00 80 80            228 	int NonHandledInterrupt	; irq22
      008064 82 00 80 85            229 	int Timer4Handler	; irq23
      008068 82 00 80 80            230 	int NonHandledInterrupt	; irq24
      00806C 82 00 80 80            231 	int NonHandledInterrupt	; irq25
      008070 82 00 80 80            232 	int NonHandledInterrupt	; irq26
      008074 82 00 80 80            233 	int NonHandledInterrupt	; irq27
      008078 82 00 80 80            234 	int NonHandledInterrupt	; irq28
      00807C 82 00 80 80            235 	int NonHandledInterrupt	; irq29
                                    236 
                                    237 ;**********************************************************
                                    238         .area CODE
                                    239 ;**********************************************************
                                    240 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 6.
Hexadecimal [24-Bits]



                                    241 ; non handled interrupt reset MCU
      008080                        242 NonHandledInterrupt:
      008080 A6 80            [ 1]  243         ld a, #0x80
      008082 C7 50 D1         [ 1]  244         ld WWDG_CR,a ; WWDG_CR used to reset mcu
                                    245 	;iret
                                    246 
                                    247 ; used for milliseconds counter 
                                    248 ; MS is 16 bits counter 
      008085                        249 Timer4Handler:
      008085 72 5F 53 42      [ 1]  250 	clr TIM4_SR 
      008089 BE 2E            [ 2]  251         ldw x,MS 
      00808B 5C               [ 2]  252         incw x 
      00808C BF 2E            [ 2]  253         ldw MS,x
      00808E BE 30            [ 2]  254         ldw x,CNTDWN 
      008090 27 03            [ 1]  255         jreq 1$
      008092 5A               [ 2]  256         decw x 
      008093 BF 30            [ 2]  257         ldw CNTDWN,x 
      008095                        258 1$:         
      008095 80               [11]  259         iret 
                                    260 
                                    261 
                                    262 ;; Main entry points and COLD start data
      008096                        263 main:
                                    264 ; clear all RAM
      008096 AE 00 00         [ 2]  265 	ldw X,#RAMBASE
      008099                        266 clear_ram0:
      008099 7F               [ 1]  267 	clr (X)
      00809A 5C               [ 2]  268 	incw X
      00809B A3 17 FF         [ 2]  269 	cpw X,#RAM_END
      00809E 23 F9            [ 2]  270 	jrule clear_ram0
      0080A0 AE 17 FF         [ 2]  271         ldw x,#RPP
      0080A3 94               [ 1]  272         ldw sp,x
                                    273 ; set SEEDX and SEEDY to 1 
      0080A4 3C 37            [ 1]  274         inc SEEDX+1 
      0080A6 3C 39            [ 1]  275         inc SEEDY+1          
      0080A8 CC 80 C7         [ 2]  276 	jp ORIG
                                    277 
                                    278 ; COLD initialize these variables.
      0080AB                        279 UZERO:
      0080AB 00 0A                  280         .word      BASEE   ;BASE
      0080AD 00 00                  281         .word      0       ;tmp
      0080AF 00 00                  282         .word      0       ;>IN
      0080B1 00 00                  283         .word      0       ;#TIB
      0080B3 17 00                  284         .word      TIBB    ;TIB
      0080B5 93 6D                  285         .word      INTER   ;'EVAL
      0080B7 00 00                  286         .word      0       ;HLD
      0080B9 A3 86                  287         .word      LASTN  ;CNTXT pointer
      0080BB 00 80                  288         .word      VAR_BASE   ;variables free space pointer 
      0080BD A4 00                  289         .word      app_space ; FLASH free space pointer 
      0080BF A3 86                  290         .word      LASTN   ;LAST
      0080C1 00 00                  291         .word      0        ; OFFSET 
      0080C3 00 00                  292         .word      0       ; TFLASH
                                    293 ;       .word      0       ; URLAST   
      0080C5 00 00                  294 UEND:   .word      0
                                    295 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 7.
Hexadecimal [24-Bits]



      0080C7                        296 ORIG:   
                                    297 ; initialize SP
      0080C7 AE 17 FF         [ 2]  298         LDW     X,#STACK  ;initialize return stack
      0080CA 94               [ 1]  299         LDW     SP,X
      0080CB BF 2C            [ 2]  300         LDW     RP0,X
      0080CD AE 16 80         [ 2]  301         LDW     X,#DATSTK ;initialize data stack
      0080D0 BF 2A            [ 2]  302         LDW     SP0,X
                                    303 ; initialize PC_5 as output to control LED2
                                    304 ; added by Picatout 
      0080D2 72 1A 50 0D      [ 1]  305         bset PC_CR1,#LED2_BIT
      0080D6 72 1A 50 0E      [ 1]  306         bset PC_CR2,#LED2_BIT
      0080DA 72 1A 50 0C      [ 1]  307         bset PC_DDR,#LED2_BIT
      00005E                        308         _ledoff
      0080DE 72 1B 50 0A      [ 1]    1         bres PC_ODR,#LED2_BIT
                                    309 ; initialize clock to HSI
                                    310 ; no divisor 16Mhz 
                                    311 ; Added by Picatout 
      0080E2                        312 clock_init:
      0080E2 72 5F 50 C6      [ 1]  313         clr CLK_CKDIVR
      0080E6 72 12 50 C5      [ 1]  314 	bset CLK_SWCR,#CLK_SWCR_SWEN
                           000001   315 .if NUCLEO
      0080EA A6 E1            [ 1]  316 	ld a,#CLK_SWR_HSI
                           000000   317 .else ; DISCOVERY as 16Mhz crystal
                                    318 	ld a,#CLK_SWR_HSE
                                    319 .endif 
      0080EC C7 50 C4         [ 1]  320 	ld CLK_SWR,a
      0080EF C1 50 C3         [ 1]  321 1$:	cp a,CLK_CMSR
      0080F2 26 FB            [ 1]  322 	jrne 1$
                                    323         
                                    324 ; initialize UART, 115200 8N1
      0080F4                        325 uart_init:
                           000001   326 .if NUCLEO 
      0080F4 72 14 50 C7      [ 1]  327 	bset CLK_PCKENR1,#CLK_PCKENR1_UART1
                                    328 	; configure tx pin
      0080F8 72 1A 50 02      [ 1]  329 	bset PA_DDR,#UART1_TX_PIN ; tx pin
      0080FC 72 1A 50 03      [ 1]  330 	bset PA_CR1,#UART1_TX_PIN ; push-pull output
      008100 72 1A 50 04      [ 1]  331 	bset PA_CR2,#UART1_TX_PIN ; fast output
                                    332 	; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
      008104 35 0B 52 33      [ 1]  333 	mov UART1_BRR2,#0x0b ; must be loaded first
      008108 35 08 52 32      [ 1]  334 	mov UART1_BRR1,#0x8
      00810C 35 0C 52 35      [ 1]  335 	mov UART1_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN));|(1<<UART_CR2_RIEN))
                           000000   336 .else ; DISCOVERY use UART2 
                                    337 	bset CLK_PCKENR1,#CLK_PCKENR1_UART2
                                    338 	; configure tx pin
                                    339 	bset PD_DDR,#UART2_TX_PIN ; tx pin
                                    340 	bset PD_CR1,#UART2_TX_PIN ; push-pull output
                                    341 	bset PD_CR2,#UART2_TX_PIN ; fast output
                                    342 	; baud rate 115200 Fmaster=8Mhz  
                                    343 	mov UART2_BRR2,#0x0b ; must be loaded first
                                    344 	mov UART2_BRR1,#0x8
                                    345 	mov UART2_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN));|(1<<UART_CR2_RIEN))
                                    346 .endif
                                    347 ; initialize timer4, used for millisecond interrupt  
      008110 35 07 53 45      [ 1]  348 	mov TIM4_PSCR,#7 ; prescale 128  
      008114 35 7D 53 46      [ 1]  349 	mov TIM4_ARR,#125 ; set for 1msec.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 8.
Hexadecimal [24-Bits]



      008118 35 05 53 40      [ 1]  350 	mov TIM4_CR1,#((1<<TIM4_CR1_CEN)|(1<<TIM4_CR1_URS))
      00811C 72 10 53 41      [ 1]  351 	bset TIM4_IER,#TIM4_IER_UIE 
                                    352 ; set TIM4 interrupt priority to highest
      008120 A6 3F            [ 1]  353         ld a,#~(IPR_MASK<<6)
      008122 C4 7F 75         [ 1]  354         and a,ITC_SPR6
      008125 AA C0            [ 1]  355         or a,#(IPR3<<6)
      008127 C7 7F 75         [ 1]  356         ld ITC_SPR6,a 
      00812A 9A               [ 1]  357         rim
      00812B CC 9A 71         [ 2]  358         jp  COLD   ;default=MN1
                                    359 
                                    360 
                                    361 ;; place MCU in sleep mode with
                                    362 ;; halt opcode 
                                    363 ;; BYE ( -- )
      00812E 00 00                  364         .word 0
                           0000B0   365         LINK=.
      008130 03                     366         .byte 3 
      008131 42 59 45               367         .ascii "BYE"
      008134                        368 BYE: 
      008134 8E               [10]  369         halt 
      008135 81               [ 4]  370         ret 
                                    371 
                                    372 ; Enable interrupts 
                                    373 ; EI ( -- )
      008136 81 30                  374         .word LINK 
                           0000B8   375         LINK=.
      008138 02                     376         .byte 2
      008139 45 49                  377         .ascii "EI"
      00813B                        378 EI:
      00813B 9A               [ 1]  379         rim 
      00813C 81               [ 4]  380         ret 
                                    381 
                                    382 ; Disable interrupts
                                    383 ; DI ( -- )
      00813D 81 38                  384         .word LINK 
                           0000BF   385         LINK=.
      00813F 02                     386         .byte 2 
      008140 44 49                  387         .ascii "DI"
      008142                        388 DI:
      008142 9B               [ 1]  389         sim 
      008143 81               [ 4]  390         ret 
                                    391 
                                    392 ; set interrupt priority level 
                                    393 ; SET-ISP ( n1 n2 -- )
                                    394 ; n1 level {1..3}
                                    395 ; n2 vector {0..29}
      008144 81 3F                  396         .word LINK 
                           0000C6   397         LINK=.
      008146 07                     398         .byte 7 
      008147 53 45 54 2D 49 53 50   399         .ascii "SET-ISP"
      00814E                        400 SETISP:
      00814E 90 93            [ 1]  401         ldw y,x 
      008150 90 FE            [ 2]  402         ldw y,(y)
      008152 A6 04            [ 1]  403         ld a,#4 ; 4 slot per register 
                                    404 ;  quotient select register, remainder select slot in register.        
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 9.
Hexadecimal [24-Bits]



      008154 90 62            [ 2]  405         div y,a ; register=ITC_SPR1[Y], lshift=2*A 
      008156 A4 03            [ 1]  406         and a,#3 
      008158 48               [ 1]  407         sll a ; 2*SLOT  lshift 
      008159 72 A9 7F 70      [ 2]  408         addw y,#ITC_SPR1 
      00815D FF               [ 2]  409         ldw (x),y  ; ( level reg -- )
      00815E 90 5F            [ 1]  410         clrw y 
      008160 90 97            [ 1]  411         ld yl,a 
      008162 1D 00 02         [ 2]  412         subw x,#CELLL 
      008165 FF               [ 2]  413         ldw (x),y  ; ( level reg lshift -- )
      008166 90 93            [ 1]  414         ldw y,x 
      008168 90 EE 02         [ 2]  415         ldw y,(2,y) 
      00816B 90 F6            [ 1]  416         ld a,(y)   ; reg_value
      00816D 1D 00 02         [ 2]  417         subw x,#CELLL 
      008170 FF               [ 2]  418         ldw (x),y ; ( level reg lshift rval -- )
      008171 CD 85 83         [ 4]  419         call OVER ; ( level reg lshift rval lshift -- )
      008174 CD 84 34         [ 4]  420         call DOLIT 
      008177 00 03                  421         .word 3
      008179 CD 85 69         [ 4]  422         call SWAPP  ; ( level reg lshift rval 3 lshift )
      00817C CD 8A 6C         [ 4]  423         call LSHIFT ; creat slot mask 
      00817F CD 87 6E         [ 4]  424         call INVER  ; ( level reg lshift rval mask )
      008182 CD 85 A5         [ 4]  425         call ANDD ; ( level reg lshift slot_masked )
      008185 CD 85 22         [ 4]  426         call TOR  ; ( level reg lshift -- R: slot_masked )
      008188 CD 87 14         [ 4]  427         call ROT  ; ( reg lshift level )
      00818B CD 85 69         [ 4]  428         call SWAPP ; ( reg level lshift )
      00818E CD 8A 6C         [ 4]  429         call LSHIFT  ; ( reg slot_level -- )
      008191 CD 85 03         [ 4]  430         call RFROM ; ( reg slot_level masked_val )
      008194 CD 85 B9         [ 4]  431         call ORR   ; ( reg updated_rval )
      008197 CD 85 69         [ 4]  432         call SWAPP 
      00819A CD 84 BF         [ 4]  433         call CSTOR
                                    434 
                                    435 ; sélectionne l'application 
                                    436 ; qui démarre automatique lors 
                                    437 ; d'un COLD start 
      00819D 81 46                  438         .word LINK 
                           00011F   439         LINK=.
      00819F 07                     440         .byte 7
      0081A0 41 55 54 4F 52 55 4E   441         .ascii "AUTORUN"
      0081A7                        442 AUTORUN:
      0081A7 CD 91 32         [ 4]  443         call TOKEN 
      0081AA CD 85 59         [ 4]  444         call DUPP 
      0081AD CD 84 67         [ 4]  445         call QBRAN 
      0081B0 82 8D                  446         .word FORGET2
      0081B2 CD 92 2F         [ 4]  447         call NAMEQ
      0081B5 CD 87 03         [ 4]  448         call QDUP 
      0081B8 CD 84 67         [ 4]  449         call QBRAN 
      0081BB 82 8D                  450         .word FORGET2
      0081BD CD 85 4F         [ 4]  451         call DROP 
      0081C0 1D 00 04         [ 2]  452         subw x,#2*CELLL 
      0081C3 90 5F            [ 1]  453         clrw y 
      0081C5 FF               [ 2]  454         ldw (x),y 
      0081C6 90 AE 40 02      [ 2]  455         ldw y,#APP_RUN 
      0081CA EF 02            [ 2]  456         ldw (2,x),y 
      0081CC CC 9D 5E         [ 2]  457         jp ee_store 
                                    458 
                                    459 ;; Reset dictionary pointer before 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



                                    460 ;; forgotten word. RAM space and 
                                    461 ;; interrupt vector defined after 
                                    462 ;; must be resetted also.
      0081CF 81 9F                  463         .word LINK 
                           000151   464         LINK=.
      0081D1 06                     465         .byte 6
      0081D2 46 4F 52 47 45 54      466         .ascii "FORGET" 
      0081D8                        467 FORGET: 
      0081D8 CD 91 32         [ 4]  468         call TOKEN
      0081DB CD 85 59         [ 4]  469         call DUPP 
      0081DE CD 84 67         [ 4]  470         call QBRAN 
      0081E1 82 8D                  471         .word FORGET2
      0081E3 CD 92 2F         [ 4]  472         call NAMEQ ; ( a -- ca na | a F )
      0081E6 CD 87 03         [ 4]  473         call QDUP 
      0081E9 CD 84 67         [ 4]  474         call QBRAN 
      0081EC 82 8D                  475         .word FORGET2
                                    476 ; only forget users words 
      0081EE CD 85 59         [ 4]  477         call DUPP ; ( ca na na )
      0081F1 CD 84 34         [ 4]  478         call DOLIT 
      0081F4 A4 00                  479         .word app_space 
      0081F6 CD 85 69         [ 4]  480         call SWAPP 
      0081F9 CD 88 14         [ 4]  481         call  ULESS 
      0081FC CD 84 67         [ 4]  482         call QBRAN 
      0081FF 82 4F                  483         .word FORGET6 
                                    484 ; ( ca na -- )        
                                    485 ;reset ivec with address >= ca
      008201 CD 85 69         [ 4]  486         call SWAPP ; ( na ca -- ) 
      008204 CD 9F 4F         [ 4]  487         call CHKIVEC ; ( na -- ) 
                                    488 ; start at LAST and link back to na 
                                    489 ; if variable found reset VP at that point.
      008207                        490 FORGET1:
      008207 CD 86 C5         [ 4]  491         call LAST 
      00820A CD 84 B2         [ 4]  492         call AT 
      00820D CD 85 59         [ 4]  493         call DUPP  ; ( -- na last last )
      008210 CD 82 A3         [ 4]  494         call FREEVAR ; ( -- na last )
      008213 CD 85 59         [ 4]  495         call DUPP 
      008216 CD 84 34         [ 4]  496         call DOLIT 
      008219 00 02                  497         .word 2 
      00821B CD 87 CD         [ 4]  498         call SUBB ; ( na last -- na last lfa ) link address 
      00821E CD 84 B2         [ 4]  499         call AT 
      008221 CD 85 59         [ 4]  500         call DUPP ; ( -- na last a a )
      008224 CD 86 99         [ 4]  501         call CNTXT 
      008227 CD 84 9B         [ 4]  502         call STORE
      00822A CD 86 C5         [ 4]  503         call LAST  
      00822D CD 84 9B         [ 4]  504         call STORE ; ( --  na last )
      008230 CD 85 83         [ 4]  505         call OVER 
      008233 CD 87 F5         [ 4]  506         call EQUAL ; ( na last na -- na T|F ) 
      008236 CD 84 67         [ 4]  507         call QBRAN 
      008239 82 07                  508         .word FORGET1 
                                    509 ; ( na -- )
      00823B CD 84 34         [ 4]  510         call DOLIT 
      00823E 00 02                  511         .word 2 
      008240 CD 87 CD         [ 4]  512         call SUBB 
      008243 CD 86 B5         [ 4]  513         call CPP 
      008246 CD 84 9B         [ 4]  514         call STORE  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



      008249 CD 9B 9D         [ 4]  515         call UPDATCP 
      00824C CC 9B 74         [ 2]  516         jp UPDATLAST 
      00824F                        517 FORGET6: ; tried to forget a RAM or system word 
                                    518 ; ( ca na -- )
      00824F 1D 00 02         [ 2]  519         subw x,#CELLL 
      008252 90 BE 2A         [ 2]  520         ldw y,SP0 
      008255 FF               [ 2]  521         ldw (x),y  
      008256 CD 88 14         [ 4]  522         call ULESS
      008259 CD 84 67         [ 4]  523         call QBRAN 
      00825C 82 7F                  524         .word PROTECTED 
      00825E CD 93 3B         [ 4]  525         call ABORQ 
      008261 1D                     526         .byte 29
      008262 20 46 6F 72 20 52 41   527         .ascii " For RAM definition do REBOOT"
             4D 20 64 65 66 69 6E
             69 74 69 6F 6E 20 64
             6F 20 52 45 42 4F 4F
             54
      00827F                        528 PROTECTED:
      00827F CD 93 3B         [ 4]  529         call ABORQ
      008282 0A                     530         .byte 10
      008283 20 50 72 6F 74 65 63   531         .ascii " Protected"
             74 65 64
      00828D                        532 FORGET2: ; no name or not found in dictionary 
      00828D CD 93 3B         [ 4]  533         call ABORQ
      008290 05                     534         .byte 5
      008291 20 77 68 61 74         535         .ascii " what"
      008296                        536 FORGET4:
      008296 CC 85 4F         [ 2]  537         jp DROP 
                                    538 
                                    539 
                                    540 ;---------------------------------
                                    541 ; if na is variable 
                                    542 ; free variable data  
                                    543 ; FREEVAR ( na -- )
                                    544 ;---------------------------------
      008299 81 D1                  545         .word LINK 
                           00021B   546         LINK=.
      00829B 07                     547         .byte 7 
      00829C 46 52 45 45 56 41 52   548         .ascii "FREEVAR"
      0082A3                        549 FREEVAR:
      0082A3 CD 85 59         [ 4]  550         call DUPP ; ( na na -- )
      0082A6 CD 84 D0         [ 4]  551         CALL CAT  ; ( na c -- )
      0082A9 CD 8A 4E         [ 4]  552         call ONEP ;
      0082AC CD 87 54         [ 4]  553         CALL PLUS ; ( na c+1 -- ca ) 
      0082AF CD 8A 4E         [ 4]  554         call ONEP ; ( ca+ -- ) to get routne address 
      0082B2 CD 85 59         [ 4]  555         call DUPP ; ( ca+ ca+ -- )
      0082B5 CD 84 B2         [ 4]  556         CALL AT   ; ( ca+ fnaddr -- ) ; fnaddr is routine address 
      0082B8 CD 84 34         [ 4]  557         call DOLIT 
      0082BB 86 06                  558         .word DOVAR ; if routine address is DOVAR then variable 
      0082BD CD 87 F5         [ 4]  559         call EQUAL  ; ( ca+ fnaddr DOVAR -- ca+ T|F ) 
      0082C0 CD 84 67         [ 4]  560         call QBRAN 
      0082C3 82 D9                  561         .word FREEVAR4 
      0082C5 CD 84 34         [ 4]  562         call DOLIT 
      0082C8 00 02                  563         .word 2 
      0082CA CD 87 54         [ 4]  564         call PLUS  ; ( ca+ 2 -- da ) da is data address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]



      0082CD CD 84 B2         [ 4]  565         call AT 
      0082D0 CD 86 A7         [ 4]  566         call VPP   
      0082D3 CD 84 9B         [ 4]  567         call STORE 
      0082D6 CC 9B B4         [ 2]  568         jp UPDATVP 
      0082D9                        569 FREEVAR4: ; not variable
      0082D9 CC 85 4F         [ 2]  570         jp  DROP 
                                    571 
                                    572 ;    SEED ( n -- )
                                    573 ; Initialize PRNG seed with n 
      0082DC 82 9B                  574         .word LINK 
                           00025E   575         LINK=. 
      0082DE 04                     576         .byte 4 
      0082DF 53 45 45 44            577         .ascii "SEED" 
      0082E3                        578 SEED:
      0082E3 90 93            [ 1]  579         ldw y,x 
      0082E5 1C 00 02         [ 2]  580         addw x,#CELLL
      0082E8 90 FE            [ 2]  581         ldw y,(y)
      0082EA 90 9E            [ 1]  582         ld a,yh 
      0082EC B7 36            [ 1]  583         ld SEEDX,a 
      0082EE 90 9F            [ 1]  584         ld a,yl 
      0082F0 B7 38            [ 1]  585         ld SEEDY,a 
      0082F2 81               [ 4]  586         ret 
                                    587 
                                    588 ;    RANDOM ( u1 -- u2 )
                                    589 ; Pseudo random number betwen 0 and u1-1
      0082F3 82 DE                  590         .word LINK 
                           000275   591         LINK=.
      0082F5 06                     592         .byte 6
      0082F6 52 41 4E 44 4F 4D      593         .ascii "RANDOM" 
      0082FC                        594 RANDOM:
                                    595 ;local variable 
                           000001   596         SPSAVE=1
                           000002   597         VSIZE=2 
      0082FC 52 02            [ 2]  598         sub sp,#VSIZE
      0082FE 1F 01            [ 2]  599         ldw (SPSAVE,sp),x  
                                    600 ; XTEMP=(SEEDX<<5)^SEEDX 
      008300 90 93            [ 1]  601         ldw y,x 
      008302 90 FE            [ 2]  602         ldw y,(y)
      008304 90 BF 24         [ 2]  603         ldw YTEMP,y 
      008307 BE 36            [ 2]  604 	ldw x,SEEDX 
      008309 58               [ 2]  605 	sllw x 
      00830A 58               [ 2]  606 	sllw x 
      00830B 58               [ 2]  607 	sllw x 
      00830C 58               [ 2]  608 	sllw x 
      00830D 58               [ 2]  609 	sllw x 
      00830E 9E               [ 1]  610 	ld a,xh 
      00830F B8 36            [ 1]  611 	xor a,SEEDX 
      008311 B7 22            [ 1]  612 	ld XTEMP,a 
      008313 9F               [ 1]  613 	ld a,xl 
      008314 B8 37            [ 1]  614 	xor a,SEEDX+1 
      008316 B7 23            [ 1]  615 	ld XTEMP+1,a 
                                    616 ; SEEDX=SEEDY 
      008318 BE 38            [ 2]  617 	ldw x,SEEDY 
      00831A BF 36            [ 2]  618 	ldw SEEDX,x  
                                    619 ; SEEDY=SEEDY^(SEEDY>>1)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 13.
Hexadecimal [24-Bits]



      00831C 54               [ 2]  620 	srlw x 
      00831D 9E               [ 1]  621 	ld a,xh 
      00831E B8 38            [ 1]  622 	xor a,SEEDY 
      008320 B7 38            [ 1]  623 	ld SEEDY,a  
      008322 9F               [ 1]  624 	ld a,xl 
      008323 B8 39            [ 1]  625 	xor a,SEEDY+1 
      008325 B7 39            [ 1]  626 	ld SEEDY+1,a 
                                    627 ; XTEMP>>3 
      008327 BE 22            [ 2]  628 	ldw x,XTEMP 
      008329 54               [ 2]  629 	srlw x 
      00832A 54               [ 2]  630 	srlw x 
      00832B 54               [ 2]  631 	srlw x 
                                    632 ; x=XTEMP^x 
      00832C 9E               [ 1]  633 	ld a,xh 
      00832D B8 22            [ 1]  634 	xor a,XTEMP 
      00832F 95               [ 1]  635 	ld xh,a 
      008330 9F               [ 1]  636 	ld a,xl 
      008331 B8 23            [ 1]  637 	xor a,XTEMP+1  
      008333 97               [ 1]  638 	ld xl,a 
                                    639 ; SEEDY=x^SEEDY 
      008334 B8 39            [ 1]  640 	xor a,SEEDY+1
      008336 97               [ 1]  641 	ld xl,a 
      008337 9E               [ 1]  642 	ld a,xh 
      008338 B8 38            [ 1]  643 	xor a,SEEDY
      00833A 95               [ 1]  644 	ld xh,a 
      00833B BF 38            [ 2]  645 	ldw SEEDY,x 
                                    646 ; return SEEDY modulo YTEMP  
      00833D 90 BE 24         [ 2]  647 	ldw y,YTEMP  
      008340 65               [ 2]  648 	divw x,y 
      008341 1E 01            [ 2]  649 	ldw x,(SPSAVE,sp)
      008343 FF               [ 2]  650         ldw (x),y 
      008344 5B 02            [ 2]  651         addw sp,#VSIZE 
      008346 81               [ 4]  652 	ret 
                                    653 
                                    654 
                                    655 ;;
                                    656 ;; get millisecond counter 
                                    657 ;; msec ( -- u )
                                    658 ;; Added by Picatout 2020-04-26
      008347 82 F5                  659         .word LINK  
                           0002C9   660         LINK = . 
      008349 04                     661         .byte 4
      00834A 4D 53 45 43            662         .ascii "MSEC"
      00834E                        663 MSEC: 
      00834E 1D 00 02         [ 2]  664         subw x,#CELLL 
      008351 90 BE 2E         [ 2]  665         ldw y,MS 
      008354 FF               [ 2]  666         ldw (x),y 
      008355 81               [ 4]  667         ret 
                                    668 
                                    669 ; suspend execution for u msec 
                                    670 ;  pause ( u -- )
      008356 83 49                  671         .word LINK 
                           0002D8   672         LINK=.
      008358 05                     673         .byte 5 
      008359 50 41 55 53 45         674         .ascii "PAUSE"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 14.
Hexadecimal [24-Bits]



      00835E                        675 PAUSE:
      00835E 90 93            [ 1]  676         ldw y,x
      008360 90 FE            [ 2]  677         ldw y,(y)
      008362 72 B9 00 2E      [ 2]  678         addw y,MS 
      008366 8F               [10]  679 1$:     wfi  
      008367 90 B3 2E         [ 2]  680         cpw y,MS  
      00836A 26 FA            [ 1]  681         jrne 1$        
      00836C 1C 00 02         [ 2]  682         addw x,#CELLL 
      00836F 81               [ 4]  683         ret 
                                    684 
                                    685 ; initialize count down timer 
                                    686 ;  TIMER ( u -- )  milliseconds 
      008370 83 58                  687         .word LINK 
                           0002F2   688         LINK=.
      008372 05                     689         .byte 5 
      008373 54 49 4D 45 52         690         .ascii "TIMER" 
      008378                        691 TIMER:
      008378 90 93            [ 1]  692         ldw y,x
      00837A 90 FE            [ 2]  693         ldw y,(y) 
      00837C 90 BF 30         [ 2]  694         ldw CNTDWN,y
      00837F 1C 00 02         [ 2]  695         addw x,#CELLL 
      008382 81               [ 4]  696         ret 
                                    697 
                                    698 ; check for TIMER exiparition 
                                    699 ;  TIMEOUT? ( -- 0|-1 )
      008383 83 72                  700         .word LINK 
                           000305   701         LINK=. 
      008385 08                     702         .byte 8 
      008386 54 49 4D 45 4F 55 54   703         .ascii "TIMEOUT?"
             3F
      00838E                        704 TIMEOUTQ: 
      00838E 4F               [ 1]  705         clr a
      00838F 1D 00 02         [ 2]  706         subw x,#CELLL 
      008392 90 BE 30         [ 2]  707         ldw y,CNTDWN 
      008395 26 01            [ 1]  708         jrne 1$ 
      008397 43               [ 1]  709         cpl a 
      008398 E7 01            [ 1]  710 1$:     ld (1,x),a 
      00839A F7               [ 1]  711         ld (x),a 
      00839B 81               [ 4]  712         ret         
                                    713 
                                    714 ; reboot MCU 
                                    715 ; REBOOT ( -- )
      00839C 83 85                  716         .word LINK 
                           00031E   717         LINK=. 
      00839E 06                     718         .byte 6 
      00839F 52 45 42 4F 4F 54      719         .ascii "REBOOT"
      0083A5                        720 reboot:
      0083A5 CC 80 80         [ 2]  721         jp NonHandledInterrupt
                                    722 
                                    723 ; compile to flash memory 
                                    724 ; TO-FLASH ( -- )
      0083A8 83 9E                  725         .word LINK 
                           00032A   726         LINK=.
      0083AA 08                     727         .byte 8
      0083AB 54 4F 2D 46 4C 41 53   728         .ascii "TO-FLASH"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 15.
Hexadecimal  48-Bits]



             48
      0083B3                        729 TOFLASH:
      0083B3 CD 86 D8         [ 4]  730         call RAMLAST 
      0083B6 CD 84 B2         [ 4]  731         call AT 
      0083B9 CD 87 03         [ 4]  732         call QDUP 
      0083BC CD 84 67         [ 4]  733         call QBRAN
      0083BF 83 E2                  734         .word 1$
      0083C1 CD 93 3B         [ 4]  735         call ABORQ 
      0083C4 1D                     736         .byte 29
      0083C5 20 4E 6F 74 20 77 68   737         .ascii " Not while definitions in RAM"   
             69 6C 65 20 64 65 66
             69 6E 69 74 69 6F 6E
             73 20 69 6E 20 52 41
             4D
      0083E2 90 AE FF FF      [ 2]  738 1$:     ldw y,#-1 
      0083E6 90 BF 1E         [ 2]  739         ldw UTFLASH,y
      0083E9 81               [ 4]  740         ret 
                                    741 
                                    742 ; compile to RAM 
                                    743 ; TO-RAM ( -- )
      0083EA 83 AA                  744         .word LINK 
                           00036C   745         LINK=.
      0083EC 06                     746         .byte 6 
      0083ED 54 4F 2D 52 41 4D      747         .ascii "TO-RAM"
      0083F3                        748 TORAM:
      0083F3 90 5F            [ 1]  749         clrw y 
      0083F5 90 BF 1E         [ 2]  750         ldw UTFLASH,y 
      0083F8 81               [ 4]  751         ret 
                                    752         
                                    753 
                                    754 ;; Device dependent I/O
                                    755 ;       ?RX     ( -- c T | F )
                                    756 ;         Return input byte and true, or false.
      0083F9 83 EC                  757         .word      LINK 
                           00037B   758 LINK	= .
      0083FB 04                     759         .byte      4
      0083FC 3F 4B 45 59            760         .ascii     "?KEY"
      008400                        761 QKEY:
      008400 90 5F            [ 1]  762         CLRW Y 
      008402 72 0B 52 30 0B   [ 2]  763         BTJF UART1_SR,#UART_SR_RXNE,INCH   ;check status
      008407 C6 52 31         [ 1]  764         LD    A,UART1_DR   ;get char in A
      00840A 1D 00 02         [ 2]  765 	SUBW	X,#2
      00840D E7 01            [ 1]  766         LD     (1,X),A
      00840F 7F               [ 1]  767 	CLR	(X)
      008410 90 53            [ 2]  768         CPLW     Y
      008412                        769 INCH:
      008412 1D 00 02         [ 2]  770 	SUBW	X,#2
      008415 FF               [ 2]  771         LDW     (X),Y
      008416 81               [ 4]  772         RET
                                    773 
                                    774 ;       TX!     ( c -- )
                                    775 ;       Send character c to  output device.
      008417 83 FB                  776         .word      LINK
                           000399   777 LINK	= .
      008419 04                     778         .byte      4
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 16.
Hexadecimal [24-Bits]



      00841A 45 4D 49 54            779         .ascii     "EMIT"
      00841E                        780 EMIT:
      00841E E6 01            [ 1]  781         LD     A,(1,X)
      008420 1C 00 02         [ 2]  782 	ADDW	X,#2
      008423 72 0F 52 30 FB   [ 2]  783 OUTPUT: BTJF UART1_SR,#UART_SR_TXE,OUTPUT  ;loop until tdre
      008428 C7 52 31         [ 1]  784         LD    UART1_DR,A   ;send A
      00842B 81               [ 4]  785         RET
                                    786 
                                    787 ;; The kernel
                                    788 
                                    789 ;       doLIT   ( -- w )
                                    790 ;       Push an inline literal.
      00842C 84 19                  791         .word      LINK
                           0003AE   792 LINK	= 	.
      00842E 45                     793 	.byte      COMPO+5
      00842F 44 4F 4C 49 54         794         .ascii     "DOLIT"
      008434                        795 DOLIT:
      008434 1D 00 02         [ 2]  796 	SUBW X,#2
      008437 16 01            [ 2]  797         ldw y,(1,sp)
      008439 90 FE            [ 2]  798         ldw y,(y)
      00843B FF               [ 2]  799         ldw (x),y
      00843C 90 85            [ 2]  800         popw y 
      00843E 90 EC 02         [ 2]  801         jp (2,y)
                                    802 
                                    803 ;       next    ( -- )
                                    804 ;       Code for  single index loop.
      008441 84 2E                  805         .word      LINK
                           0003C3   806 LINK	= 	.
      008443 44                     807 	.byte      COMPO+4
      008444 6E 65 78 74            808         .ascii     "next"
      008448                        809 DONXT:
      008448 16 03            [ 2]  810 	LDW Y,(3,SP)
      00844A 90 5A            [ 2]  811 	DECW Y
      00844C 2A 07            [ 1]  812 	JRPL NEX1 ; jump if N=0
      00844E 90 85            [ 2]  813 	POPW Y
      008450 5B 02            [ 2]  814         addw sp,#2
      008452 90 EC 02         [ 2]  815         JP (2,Y)
      008455                        816 NEX1:
      008455 17 03            [ 2]  817         LDW (3,SP),Y
      008457 90 85            [ 2]  818         POPW Y
      008459 90 FE            [ 2]  819 	LDW Y,(Y)
      00845B 90 FC            [ 2]  820 	JP (Y)
                                    821 
                                    822 ;       ?branch ( f -- )
                                    823 ;       Branch if flag is zero.
      00845D 84 43                  824         .word      LINK
                           0003DF   825 LINK	= 	.
      00845F 47                     826 	.byte      COMPO+7
      008460 3F 42 52 41 4E 43 48   827         .ascii     "?BRANCH"
      008467                        828 QBRAN:	
      008467 90 93            [ 1]  829         LDW Y,X
      008469 1C 00 02         [ 2]  830 	ADDW X,#2
      00846C 90 FE            [ 2]  831 	LDW Y,(Y)
      00846E 27 0E            [ 1]  832         JREQ     BRAN
      008470 90 85            [ 2]  833 	POPW Y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 17.
Hexadecimal [24-Bits]



      008472 90 EC 02         [ 2]  834 	JP (2,Y)
                                    835         
                                    836 ;       branch  ( -- )
                                    837 ;       Branch to an inline address.
      008475 84 5F                  838         .word      LINK
                           0003F7   839 LINK	= 	.
      008477 46                     840 	.byte      COMPO+6
      008478 42 52 41 4E 43 48      841         .ascii     "BRANCH"
      00847E                        842 BRAN:
      00847E 90 85            [ 2]  843         POPW Y
      008480 90 FE            [ 2]  844 	LDW Y,(Y)
      008482 90 FC            [ 2]  845         JP     (Y)
                                    846 
                                    847 ;       EXECUTE ( ca -- )
                                    848 ;       Execute  word at ca.
      008484 84 77                  849         .word      LINK
                           000406   850 LINK	= 	.
      008486 07                     851         .byte       7
      008487 45 58 45 43 55 54 45   852         .ascii     "EXECUTE"
      00848E                        853 EXECU:
      00848E 90 93            [ 1]  854         LDW Y,X
      008490 1C 00 02         [ 2]  855 	ADDW X,#2
      008493 90 FE            [ 2]  856 	LDW  Y,(Y)
      008495 90 FC            [ 2]  857         JP   (Y)
                                    858 
                           000001   859 OPTIMIZE = 1
                           000001   860 .if OPTIMIZE 
                                    861 ; remplacement de CALL EXIT par 
                                    862 ; le opcode de RET.
                                    863 ; Voir modification au code de ";"
                           000000   864 .else 
                                    865 ;       EXIT    ( -- )
                                    866 ;       Terminate a colon definition.
                                    867         .word      LINK
                                    868 LINK = .
                                    869         .byte      4
                                    870         .ascii     "EXIT"
                                    871 EXIT:
                                    872         POPW Y
                                    873         RET
                                    874 .endif 
                                    875 
                                    876 ;       !       ( w a -- )
                                    877 ;       Pop  data stack to memory.
      008497 84 86                  878         .word      LINK
                           000419   879 LINK = .
      008499 01                     880         .byte      1
      00849A 21                     881         .ascii     "!"
      00849B                        882 STORE:
      00849B 90 93            [ 1]  883         LDW Y,X
      00849D 90 FE            [ 2]  884         LDW Y,(Y)    ;Y=a
      00849F 90 BF 24         [ 2]  885         LDW YTEMP,Y
      0084A2 90 93            [ 1]  886         LDW Y,X
      0084A4 90 EE 02         [ 2]  887         LDW Y,(2,Y)
      0084A7 91 CF 24         [ 5]  888         LDW [YTEMP],Y ;store w at a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
Hexadecimal [24-Bits]



      0084AA 1C 00 04         [ 2]  889         ADDW X,#4 ; DDROP 
      0084AD 81               [ 4]  890         RET     
                                    891 
                                    892 ;       @       ( a -- w )
                                    893 ;       Push memory location to stack.
      0084AE 84 99                  894         .word      LINK
                           000430   895 LINK	= 	.
      0084B0 01                     896         .byte    1
      0084B1 40                     897         .ascii	"@"
      0084B2                        898 AT:
      0084B2 90 93            [ 1]  899         LDW Y,X     ;Y = a
      0084B4 90 FE            [ 2]  900         LDW Y,(Y)   ; address 
      0084B6 90 FE            [ 2]  901         LDW Y,(Y)   ; value 
      0084B8 FF               [ 2]  902         LDW (X),Y ;w = @Y
      0084B9 81               [ 4]  903         RET     
                                    904 
                                    905 ;       C!      ( c b -- )
                                    906 ;       Pop  data stack to byte memory.
      0084BA 84 B0                  907         .word      LINK
                           00043C   908 LINK	= .
      0084BC 02                     909         .byte      2
      0084BD 43 21                  910         .ascii     "C!"
      0084BF                        911 CSTOR:
      0084BF 90 93            [ 1]  912         LDW Y,X
      0084C1 90 FE            [ 2]  913 	LDW Y,(Y)    ;Y=b
      0084C3 E6 03            [ 1]  914         LD A,(3,X)    ;D = c
      0084C5 90 F7            [ 1]  915         LD  (Y),A     ;store c at b
      0084C7 1C 00 04         [ 2]  916 	ADDW X,#4 ; DDROP 
      0084CA 81               [ 4]  917         RET     
                                    918 
                                    919 ;       C@      ( b -- c )
                                    920 ;       Push byte in memory to  stack.
      0084CB 84 BC                  921         .word      LINK
                           00044D   922 LINK	= 	.
      0084CD 02                     923         .byte      2
      0084CE 43 40                  924         .ascii     "C@"
      0084D0                        925 CAT:
      0084D0 90 93            [ 1]  926         LDW Y,X     ;Y=b
      0084D2 90 FE            [ 2]  927         LDW Y,(Y)
      0084D4 90 F6            [ 1]  928         LD A,(Y)
      0084D6 E7 01            [ 1]  929         LD (1,X),A
      0084D8 7F               [ 1]  930         CLR (X)
      0084D9 81               [ 4]  931         RET     
                                    932 
                                    933 ;       RP@     ( -- a )
                                    934 ;       Push current RP to data stack.
      0084DA 84 CD                  935         .word      LINK
                           00045C   936 LINK	= .
      0084DC 03                     937         .byte      3
      0084DD 52 50 40               938         .ascii     "RP@"
      0084E0                        939 RPAT:
      0084E0 90 96            [ 1]  940         LDW Y,SP    ;save return addr
      0084E2 1D 00 02         [ 2]  941         SUBW X,#2
      0084E5 FF               [ 2]  942         LDW (X),Y
      0084E6 81               [ 4]  943         RET     
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]



                                    944 
                                    945 ;       RP!     ( a -- )
                                    946 ;       Set  return stack pointer.
      0084E7 84 DC                  947         .word      LINK
                           000469   948 LINK	= 	. 
      0084E9 43                     949 	.byte      COMPO+3
      0084EA 52 50 21               950         .ascii     "RP!"
      0084ED                        951 RPSTO:
      0084ED 90 85            [ 2]  952         POPW Y
      0084EF 90 BF 24         [ 2]  953         LDW YTEMP,Y
      0084F2 90 93            [ 1]  954         LDW Y,X
      0084F4 90 FE            [ 2]  955         LDW Y,(Y)
      0084F6 90 94            [ 1]  956         LDW SP,Y
      0084F8 1C 00 02         [ 2]  957         ADDW x,#CELLL ; a was not dropped, Picatout 2020-05-24
      0084FB 92 CC 24         [ 5]  958         JP [YTEMP]
                                    959 
                                    960 ;       R>      ( -- w )
                                    961 ;       Pop return stack to data stack.
      0084FE 84 E9                  962         .word      LINK
                           000480   963 LINK	= 	. 
      008500 42                     964 	.byte      COMPO+2
      008501 52 3E                  965         .ascii     "R>"
      008503                        966 RFROM:
      008503 90 85            [ 2]  967         POPW Y    ;save return addr
      008505 90 BF 24         [ 2]  968         LDW YTEMP,Y
      008508 90 85            [ 2]  969         POPW Y
      00850A 1D 00 02         [ 2]  970         SUBW X,#2
      00850D FF               [ 2]  971         LDW (X),Y
      00850E 92 CC 24         [ 5]  972         JP [YTEMP]
                                    973 
                                    974 ;       R@      ( -- w )
                                    975 ;       Copy top of return stack to stack.
      008511 85 00                  976         .word      LINK
                           000493   977 LINK	= 	. 
      008513 02                     978         .byte      2
      008514 52 40                  979         .ascii     "R@"
      008516                        980 RAT:
      008516 16 03            [ 2]  981         ldw y,(3,sp)
      008518 1D 00 02         [ 2]  982         subw x,#CELLL 
      00851B FF               [ 2]  983         ldw (x),y 
      00851C 81               [ 4]  984         ret 
                                    985 
                                    986 ;       >R      ( w -- )
                                    987 ;       Push data stack to return stack.
      00851D 85 13                  988         .word      LINK
                           00049F   989 LINK	= 	. 
      00851F 42                     990 	.byte      COMPO+2
      008520 3E 52                  991         .ascii     ">R"
      008522                        992 TOR:
      008522 90 85            [ 2]  993         POPW Y    ;save return addr
      008524 90 BF 24         [ 2]  994         LDW YTEMP,Y
      008527 90 93            [ 1]  995         LDW Y,X
      008529 90 FE            [ 2]  996         LDW Y,(Y)
      00852B 90 89            [ 2]  997         PUSHW Y    ;restore return addr
      00852D 1C 00 02         [ 2]  998         ADDW X,#2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]



      008530 92 CC 24         [ 5]  999         JP [YTEMP]
                                   1000 
                                   1001 ;       SP@     ( -- a )
                                   1002 ;       Push current stack pointer.
      008533 85 1F                 1003         .word      LINK
                           0004B5  1004 LINK	= 	. 
      008535 03                    1005         .byte      3
      008536 53 50 40              1006         .ascii     "SP@"
      008539                       1007 SPAT:
      008539 90 93            [ 1] 1008 	LDW Y,X
      00853B 1D 00 02         [ 2] 1009         SUBW X,#2
      00853E FF               [ 2] 1010 	LDW (X),Y
      00853F 81               [ 4] 1011         RET     
                                   1012 
                                   1013 ;       SP!     ( a -- )
                                   1014 ;       Set  data stack pointer.
      008540 85 35                 1015         .word      LINK
                           0004C2  1016 LINK	= 	. 
      008542 03                    1017         .byte      3
      008543 53 50 21              1018         .ascii     "SP!"
      008546                       1019 SPSTO:
      008546 FE               [ 2] 1020         LDW     X,(X)     ;X = a
      008547 81               [ 4] 1021         RET     
                                   1022 
                                   1023 ;       DROP    ( w -- )
                                   1024 ;       Discard top stack item.
      008548 85 42                 1025         .word      LINK
                           0004CA  1026 LINK	= 	. 
      00854A 04                    1027         .byte      4
      00854B 44 52 4F 50           1028         .ascii     "DROP"
      00854F                       1029 DROP:
      00854F 1C 00 02         [ 2] 1030         ADDW X,#2     
      008552 81               [ 4] 1031         RET     
                                   1032 
                                   1033 ;       DUP     ( w -- w w )
                                   1034 ;       Duplicate  top stack item.
      008553 85 4A                 1035         .word      LINK
                           0004D5  1036 LINK	= 	. 
      008555 03                    1037         .byte      3
      008556 44 55 50              1038         .ascii     "DUP"
      008559                       1039 DUPP:
      008559 90 93            [ 1] 1040 	LDW Y,X
      00855B 1D 00 02         [ 2] 1041         SUBW X,#2
      00855E 90 FE            [ 2] 1042 	LDW Y,(Y)
      008560 FF               [ 2] 1043 	LDW (X),Y
      008561 81               [ 4] 1044         RET     
                                   1045 
                                   1046 ;       SWAP    ( w1 w2 -- w2 w1 )
                                   1047 ;       Exchange top two stack items.
      008562 85 55                 1048         .word      LINK
                           0004E4  1049 LINK	= 	. 
      008564 04                    1050         .byte      4
      008565 53 57 41 50           1051         .ascii     "SWAP"
      008569                       1052 SWAPP:
      008569 90 93            [ 1] 1053         LDW Y,X
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



      00856B 90 FE            [ 2] 1054         LDW Y,(Y)
      00856D 90 BF 24         [ 2] 1055         LDW YTEMP,Y
      008570 90 93            [ 1] 1056         LDW Y,X
      008572 90 EE 02         [ 2] 1057         LDW Y,(2,Y)
      008575 FF               [ 2] 1058         LDW (X),Y
      008576 90 BE 24         [ 2] 1059         LDW Y,YTEMP
      008579 EF 02            [ 2] 1060         LDW (2,X),Y
      00857B 81               [ 4] 1061         RET     
                                   1062 
                                   1063 ;       OVER    ( w1 w2 -- w1 w2 w1 )
                                   1064 ;       Copy second stack item to top.
      00857C 85 64                 1065         .word      LINK
                           0004FE  1066 LINK	= . 
      00857E 04                    1067         .byte      4
      00857F 4F 56 45 52           1068         .ascii     "OVER"
      008583                       1069 OVER:
      008583 1D 00 02         [ 2] 1070         SUBW X,#2
      008586 90 93            [ 1] 1071         LDW Y,X
      008588 90 EE 04         [ 2] 1072         LDW Y,(4,Y)
      00858B FF               [ 2] 1073         LDW (X),Y
      00858C 81               [ 4] 1074         RET     
                                   1075 
                                   1076 ;       0<      ( n -- t )
                                   1077 ;       Return true if n is negative.
      00858D 85 7E                 1078         .word      LINK
                           00050F  1079 LINK	= . 
      00858F 02                    1080         .byte      2
      008590 30 3C                 1081         .ascii     "0<"
      008592                       1082 ZLESS:
      008592 A6 FF            [ 1] 1083         LD A,#0xFF
      008594 90 93            [ 1] 1084         LDW Y,X
      008596 90 FE            [ 2] 1085         LDW Y,(Y)
      008598 2B 01            [ 1] 1086         JRMI     ZL1
      00859A 4F               [ 1] 1087         CLR A   ;false
      00859B F7               [ 1] 1088 ZL1:    LD     (X),A
      00859C E7 01            [ 1] 1089         LD (1,X),A
      00859E 81               [ 4] 1090 	RET     
                                   1091 
                                   1092 ;       AND     ( w w -- w )
                                   1093 ;       Bitwise AND.
      00859F 85 8F                 1094         .word      LINK
                           000521  1095 LINK	= . 
      0085A1 03                    1096         .byte      3
      0085A2 41 4E 44              1097         .ascii     "AND"
      0085A5                       1098 ANDD:
      0085A5 F6               [ 1] 1099         LD  A,(X)    ;D=w
      0085A6 E4 02            [ 1] 1100         AND A,(2,X)
      0085A8 E7 02            [ 1] 1101         LD (2,X),A
      0085AA E6 01            [ 1] 1102         LD A,(1,X)
      0085AC E4 03            [ 1] 1103         AND A,(3,X)
      0085AE E7 03            [ 1] 1104         LD (3,X),A
      0085B0 1C 00 02         [ 2] 1105         ADDW X,#2
      0085B3 81               [ 4] 1106         RET
                                   1107 
                                   1108 ;       OR      ( w w -- w )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]



                                   1109 ;       Bitwise inclusive OR.
      0085B4 85 A1                 1110         .word      LINK
                           000536  1111 LINK = . 
      0085B6 02                    1112         .byte      2
      0085B7 4F 52                 1113         .ascii     "OR"
      0085B9                       1114 ORR:
      0085B9 F6               [ 1] 1115         LD A,(X)    ;D=w
      0085BA EA 02            [ 1] 1116         OR A,(2,X)
      0085BC E7 02            [ 1] 1117         LD (2,X),A
      0085BE E6 01            [ 1] 1118         LD A,(1,X)
      0085C0 EA 03            [ 1] 1119         OR A,(3,X)
      0085C2 E7 03            [ 1] 1120         LD (3,X),A
      0085C4 1C 00 02         [ 2] 1121         ADDW X,#2
      0085C7 81               [ 4] 1122         RET
                                   1123 
                                   1124 ;       XOR     ( w w -- w )
                                   1125 ;       Bitwise exclusive OR.
      0085C8 85 B6                 1126         .word      LINK
                           00054A  1127 LINK	= . 
      0085CA 03                    1128         .byte      3
      0085CB 58 4F 52              1129         .ascii     "XOR"
      0085CE                       1130 XORR:
      0085CE F6               [ 1] 1131         LD A,(X)    ;D=w
      0085CF E8 02            [ 1] 1132         XOR A,(2,X)
      0085D1 E7 02            [ 1] 1133         LD (2,X),A
      0085D3 E6 01            [ 1] 1134         LD A,(1,X)
      0085D5 E8 03            [ 1] 1135         XOR A,(3,X)
      0085D7 E7 03            [ 1] 1136         LD (3,X),A
      0085D9 1C 00 02         [ 2] 1137         ADDW X,#2
      0085DC 81               [ 4] 1138         RET
                                   1139 
                                   1140 ;       UM+     ( u u -- udsum )
                                   1141 ;       Add two unsigned single
                                   1142 ;       and return a double sum.
      0085DD 85 CA                 1143         .word      LINK
                           00055F  1144 LINK	= . 
      0085DF 03                    1145         .byte      3
      0085E0 55 4D 2B              1146         .ascii     "UM+"
      0085E3                       1147 UPLUS:
      0085E3 A6 01            [ 1] 1148         LD A,#1
      0085E5 90 93            [ 1] 1149         LDW Y,X
      0085E7 90 EE 02         [ 2] 1150         LDW Y,(2,Y)
      0085EA 90 BF 24         [ 2] 1151         LDW YTEMP,Y
      0085ED 90 93            [ 1] 1152         LDW Y,X
      0085EF 90 FE            [ 2] 1153         LDW Y,(Y)
      0085F1 72 B9 00 24      [ 2] 1154         ADDW Y,YTEMP
      0085F5 EF 02            [ 2] 1155         LDW (2,X),Y
      0085F7 25 01            [ 1] 1156         JRC     UPL1
      0085F9 4F               [ 1] 1157         CLR A
      0085FA E7 01            [ 1] 1158 UPL1:   LD     (1,X),A
      0085FC 7F               [ 1] 1159         CLR (X)
      0085FD 81               [ 4] 1160         RET
                                   1161 
                                   1162 ;; System and user variables
                                   1163 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



                                   1164 ;       doVAR   ( -- a )
                                   1165 ;       Code for VARIABLE and CREATE.
      0085FE 85 DF                 1166         .word      LINK
                           000580  1167 LINK	= . 
      008600 45                    1168 	.byte      COMPO+5
      008601 44 4F 56 41 52        1169         .ascii     "DOVAR"
      008606                       1170 DOVAR:
      008606 1D 00 02         [ 2] 1171 	SUBW X,#2
      008609 90 85            [ 2] 1172         POPW Y    ;get return addr (pfa)
      00860B 90 FE            [ 2] 1173         LDW Y,(Y) ; indirect address 
      00860D FF               [ 2] 1174         LDW (X),Y    ;push on stack
      00860E 81               [ 4] 1175         RET     ;go to RET of EXEC
                                   1176 
                                   1177 ;       BASE    ( -- a )
                                   1178 ;       Radix base for numeric I/O.
      00860F 86 00                 1179         .word      LINK        
                           000591  1180 LINK = . 
      008611 04                    1181         .byte      4
      008612 42 41 53 45           1182         .ascii     "BASE"
      008616                       1183 BASE:
      008616 90 AE 00 06      [ 2] 1184 	LDW Y,#UBASE 
      00861A 1D 00 02         [ 2] 1185 	SUBW X,#2
      00861D FF               [ 2] 1186         LDW (X),Y
      00861E 81               [ 4] 1187         RET
                                   1188 
                                   1189 ;       tmp     ( -- a )
                                   1190 ;       A temporary storage.
      00861F 86 11                 1191         .word      LINK
                                   1192         
                           0005A1  1193 LINK = . 
      008621 03                    1194 	.byte      3
      008622 54 4D 50              1195         .ascii     "TMP"
      008625                       1196 TEMP:
      008625 90 AE 00 08      [ 2] 1197 	LDW Y,#UTMP
      008629 1D 00 02         [ 2] 1198 	SUBW X,#2
      00862C FF               [ 2] 1199         LDW (X),Y
      00862D 81               [ 4] 1200         RET
                                   1201 
                                   1202 ;       >IN     ( -- a )
                                   1203 ;        Hold parsing pointer.
      00862E 86 21                 1204         .word      LINK
                           0005B0  1205 LINK = . 
      008630 03                    1206         .byte      3
      008631 3E 49 4E              1207         .ascii    ">IN"
      008634                       1208 INN:
      008634 90 AE 00 0A      [ 2] 1209 	LDW Y,#UINN 
      008638 1D 00 02         [ 2] 1210 	SUBW X,#2
      00863B FF               [ 2] 1211         LDW (X),Y
      00863C 81               [ 4] 1212         RET
                                   1213 
                                   1214 ;       #TIB    ( -- a )
                                   1215 ;       Count in terminal input buffer.
      00863D 86 30                 1216         .word      LINK
                           0005BF  1217 LINK = . 
      00863F 04                    1218         .byte      4
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]



      008640 23 54 49 42           1219         .ascii     "#TIB"
      008644                       1220 NTIB:
      008644 90 AE 00 0C      [ 2] 1221 	LDW Y,#UCTIB 
      008648 1D 00 02         [ 2] 1222 	SUBW X,#2
      00864B FF               [ 2] 1223         LDW (X),Y
      00864C 81               [ 4] 1224         RET
                                   1225 
                                   1226 ;       TBUF ( -- a )
                                   1227 ;       address of 128 bytes transaction buffer 
      00864D 86 3F                 1228         .word LINK 
                           0005CF  1229         LINK=.
      00864F 04                    1230         .byte 4 
      008650 54 42 55 46           1231         .ascii "TBUF"
      008654                       1232 TBUF:
      008654 90 AE 16 80      [ 2] 1233         ldw y,#ROWBUFF
      008658 1D 00 02         [ 2] 1234         subw x,#CELLL
      00865B FF               [ 2] 1235         ldw (x),y 
      00865C 81               [ 4] 1236         ret 
                                   1237 
                                   1238 ; systeme variable 
                                   1239 ; compilation destination 
                                   1240 ; TFLASH ( -- A )
      00865D 86 4F                 1241         .word LINK 
                           0005DF  1242         LINK=.
      00865F 06                    1243         .byte 6 
      008660 54 46 4C 41 53 48     1244         .ascii "TFLASH"         
      008666                       1245 TFLASH:
      008666 1D 00 02         [ 2] 1246         subw x,#CELLL 
      008669 90 AE 00 1E      [ 2] 1247         ldw y,#UTFLASH
      00866D FF               [ 2] 1248         ldw (x),y 
      00866E 81               [ 4] 1249         ret 
                                   1250 
                                   1251 ;       "EVAL   ( -- a )
                                   1252 ;       Execution vector of EVAL.
      00866F 86 5F                 1253         .word      LINK
                           0005F1  1254 LINK = . 
      008671 05                    1255         .byte      5
      008672 27 45 56 41 4C        1256         .ascii     "'EVAL"
      008677                       1257 TEVAL:
      008677 90 AE 00 10      [ 2] 1258 	LDW Y,#UINTER 
      00867B 1D 00 02         [ 2] 1259 	SUBW X,#2
      00867E FF               [ 2] 1260         LDW (X),Y
      00867F 81               [ 4] 1261         RET
                                   1262 
                                   1263 ;       HLD     ( -- a )
                                   1264 ;       Hold a pointer of output string.
      008680 86 71                 1265         .word      LINK
                           000602  1266 LINK = . 
      008682 03                    1267         .byte      3
      008683 48 4C 44              1268         .ascii     "HLD"
      008686                       1269 HLD:
      008686 90 AE 00 12      [ 2] 1270 	LDW Y,#UHLD 
      00868A 1D 00 02         [ 2] 1271 	SUBW X,#2
      00868D FF               [ 2] 1272         LDW (X),Y
      00868E 81               [ 4] 1273         RET
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



                                   1274 
                                   1275 ;       CONTEXT ( -- a )
                                   1276 ;       Start vocabulary search.
      00868F 86 82                 1277         .word      LINK
                           000611  1278 LINK = . 
      008691 07                    1279         .byte      7
      008692 43 4F 4E 54 45 58 54  1280         .ascii     "CONTEXT"
      008699                       1281 CNTXT:
      008699 90 AE 00 14      [ 2] 1282 	LDW Y,#UCNTXT
      00869D 1D 00 02         [ 2] 1283 	SUBW X,#2
      0086A0 FF               [ 2] 1284         LDW (X),Y
      0086A1 81               [ 4] 1285         RET
                                   1286 
                                   1287 ;       VP      ( -- a )
                                   1288 ;       Point to top of variables
      0086A2 86 91                 1289         .word      LINK
                           000624  1290 LINK = . 
      0086A4 02                    1291         .byte      2
      0086A5 56 50                 1292         .ascii     "VP"
      0086A7                       1293 VPP:
      0086A7 90 AE 00 16      [ 2] 1294 	LDW Y,#UVP 
      0086AB 1D 00 02         [ 2] 1295 	SUBW X,#2
      0086AE FF               [ 2] 1296         LDW (X),Y
      0086AF 81               [ 4] 1297         RET
                                   1298 
                                   1299 ;       CP    ( -- a )
                                   1300 ;       Pointer to top of FLASH 
      0086B0 86 A4                 1301         .word LINK 
                           000632  1302         LINK=.
      0086B2 02                    1303         .byte 2 
      0086B3 43 50                 1304         .ascii "CP"
      0086B5                       1305 CPP: 
      0086B5 90 AE 00 18      [ 2] 1306         ldw y,#UCP 
      0086B9 1D 00 02         [ 2] 1307         subw x,#CELLL 
      0086BC FF               [ 2] 1308         ldw (x),y 
      0086BD 81               [ 4] 1309         ret                
                                   1310 
                                   1311 ;       LAST    ( -- a )
                                   1312 ;       Point to last name in dictionary.
      0086BE 86 B2                 1313         .word      LINK
                           000640  1314 LINK = . 
      0086C0 04                    1315         .byte      4
      0086C1 4C 41 53 54           1316         .ascii     "LAST"
      0086C5                       1317 LAST:
      0086C5 90 AE 00 1A      [ 2] 1318 	LDW Y,#ULAST 
      0086C9 1D 00 02         [ 2] 1319 	SUBW X,#2
      0086CC FF               [ 2] 1320         LDW (X),Y
      0086CD 81               [ 4] 1321         RET
                                   1322 
                                   1323 ; address of system variable URLAST 
                                   1324 ;       RAMLAST ( -- a )
                                   1325 ; RAM dictionary context 
      0086CE 86 C0                 1326         .word LINK 
                           000650  1327         LINK=. 
      0086D0 07                    1328         .byte 7  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



      0086D1 52 41 4D 4C 41 53 54  1329         .ascii "RAMLAST" 
      0086D8                       1330 RAMLAST: 
      0086D8 90 AE 00 20      [ 2] 1331         ldw y,#URLAST 
      0086DC 1D 00 02         [ 2] 1332         subw x,#CELLL 
      0086DF FF               [ 2] 1333         ldw (x),y 
      0086E0 81               [ 4] 1334         ret 
                                   1335 
                                   1336 ; OFFSET ( -- a )
                                   1337 ; address of system variable OFFSET 
      0086E1 86 D0                 1338         .word LINK 
                           000663  1339         LINK=.
      0086E3 06                    1340         .byte 6
      0086E4 4F 46 46 53 45 54     1341         .ascii "OFFSET" 
      0086EA                       1342 OFFSET: 
      0086EA 1D 00 02         [ 2] 1343         subw x,#CELLL
      0086ED 90 AE 00 1C      [ 2] 1344         ldw y,#UOFFSET 
      0086F1 FF               [ 2] 1345         ldw (x),y 
      0086F2 81               [ 4] 1346         ret 
                                   1347 
                                   1348 ; adjust jump address adding OFFSET
                                   1349 ; ADR-ADJ ( a -- a+offset )
      0086F3                       1350 ADRADJ: 
      0086F3 CD 86 EA         [ 4] 1351         call OFFSET 
      0086F6 CD 84 B2         [ 4] 1352         call AT 
      0086F9 CC 87 54         [ 2] 1353         jp PLUS 
                                   1354 
                                   1355 
                                   1356 ;; Common functions
                                   1357 
                                   1358 ;       ?DUP    ( w -- w w | 0 )
                                   1359 ;       Dup tos if its is not zero.
      0086FC 86 E3                 1360         .word      LINK
                           00067E  1361 LINK = . 
      0086FE 04                    1362         .byte      4
      0086FF 3F 44 55 50           1363         .ascii     "?DUP"
      008703                       1364 QDUP:
      008703 90 93            [ 1] 1365         LDW Y,X
      008705 90 FE            [ 2] 1366 	LDW Y,(Y)
      008707 27 04            [ 1] 1367         JREQ     QDUP1
      008709 1D 00 02         [ 2] 1368 	SUBW X,#2
      00870C FF               [ 2] 1369         LDW (X),Y
      00870D 81               [ 4] 1370 QDUP1:  RET
                                   1371 
                                   1372 ;       ROT     ( w1 w2 w3 -- w2 w3 w1 )
                                   1373 ;       Rot 3rd item to top.
      00870E 86 FE                 1374         .word      LINK
                           000690  1375 LINK = . 
      008710 03                    1376         .byte      3
      008711 52 4F 54              1377         .ascii     "ROT"
      008714                       1378 ROT:
      008714 90 93            [ 1] 1379         ldw y,x 
      008716 90 FE            [ 2] 1380         ldw y,(y)
      008718 90 89            [ 2] 1381         pushw y 
      00871A 90 93            [ 1] 1382         ldw y,x 
      00871C 90 EE 04         [ 2] 1383         ldw y,(4,y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal [24-Bits]



      00871F FF               [ 2] 1384         ldw (x),y 
      008720 90 93            [ 1] 1385         ldw y,x 
      008722 90 EE 02         [ 2] 1386         ldw y,(2,y)
      008725 EF 04            [ 2] 1387         ldw (4,x),y 
      008727 90 85            [ 2] 1388         popw y 
      008729 EF 02            [ 2] 1389         ldw (2,x),y
      00872B 81               [ 4] 1390         ret 
                                   1391 
                                   1392 ;       2DROP   ( w w -- )
                                   1393 ;       Discard two items on stack.
      00872C 87 10                 1394         .word      LINK
                           0006AE  1395 LINK = . 
      00872E 05                    1396         .byte      5
      00872F 32 44 52 4F 50        1397         .ascii     "2DROP"
      008734                       1398 DDROP:
      008734 1C 00 04         [ 2] 1399         ADDW X,#4
      008737 81               [ 4] 1400         RET
                                   1401 
                                   1402 ;       2DUP    ( w1 w2 -- w1 w2 w1 w2 )
                                   1403 ;       Duplicate top two items.
      008738 87 2E                 1404         .word      LINK
                           0006BA  1405 LINK = . 
      00873A 04                    1406         .byte      4
      00873B 32 44 55 50           1407         .ascii     "2DUP"
      00873F                       1408 DDUP:
      00873F 1D 00 04         [ 2] 1409         SUBW X,#4
      008742 90 93            [ 1] 1410         LDW Y,X
      008744 90 EE 06         [ 2] 1411         LDW Y,(6,Y)
      008747 EF 02            [ 2] 1412         LDW (2,X),Y
      008749 90 93            [ 1] 1413         LDW Y,X
      00874B 90 EE 04         [ 2] 1414         LDW Y,(4,Y)
      00874E FF               [ 2] 1415         LDW (X),Y
      00874F 81               [ 4] 1416         RET
                                   1417 
                                   1418 ;       +       ( w w -- sum )
                                   1419 ;       Add top two items.
      008750 87 3A                 1420         .word      LINK
                           0006D2  1421 LINK = . 
      008752 01                    1422         .byte      1
      008753 2B                    1423         .ascii     "+"
      008754                       1424 PLUS:
      008754 90 93            [ 1] 1425         LDW Y,X
      008756 90 FE            [ 2] 1426         LDW Y,(Y)
      008758 90 BF 24         [ 2] 1427         LDW YTEMP,Y
      00875B 1C 00 02         [ 2] 1428         ADDW X,#2
      00875E 90 93            [ 1] 1429         LDW Y,X
      008760 90 FE            [ 2] 1430         LDW Y,(Y)
      008762 72 B9 00 24      [ 2] 1431         ADDW Y,YTEMP
      008766 FF               [ 2] 1432         LDW (X),Y
      008767 81               [ 4] 1433         RET
                                   1434 
                                   1435 ;       NOT     ( w -- w )
                                   1436 ;       One's complement of tos.
      008768 87 52                 1437         .word      LINK
                           0006EA  1438 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



      00876A 03                    1439         .byte      3
      00876B 4E 4F 54              1440         .ascii     "NOT"
      00876E                       1441 INVER:
      00876E 90 93            [ 1] 1442         LDW Y,X
      008770 90 FE            [ 2] 1443         LDW Y,(Y)
      008772 90 53            [ 2] 1444         CPLW Y
      008774 FF               [ 2] 1445         LDW (X),Y
      008775 81               [ 4] 1446         RET
                                   1447 
                                   1448 ;       NEGATE  ( n -- -n )
                                   1449 ;       Two's complement of tos.
      008776 87 6A                 1450         .word      LINK
                           0006F8  1451 LINK = . 
      008778 06                    1452         .byte      6
      008779 4E 45 47 41 54 45     1453         .ascii     "NEGATE"
      00877F                       1454 NEGAT:
      00877F 90 93            [ 1] 1455         LDW Y,X
      008781 90 FE            [ 2] 1456         LDW Y,(Y)
      008783 90 50            [ 2] 1457         NEGW Y
      008785 FF               [ 2] 1458         LDW (X),Y
      008786 81               [ 4] 1459         RET
                                   1460 
                                   1461 ;       DNEGATE ( d -- -d )
                                   1462 ;       Two's complement of top double.
      008787 87 78                 1463         .word      LINK
                           000709  1464 LINK = . 
      008789 07                    1465         .byte      7
      00878A 44 4E 45 47 41 54 45  1466         .ascii     "DNEGATE"
      008791                       1467 DNEGA:
      008791 90 93            [ 1] 1468         LDW Y,X
      008793 90 FE            [ 2] 1469 	LDW Y,(Y)
      008795 90 53            [ 2] 1470         CPLW Y     
      008797 90 BF 24         [ 2] 1471 	LDW YTEMP,Y
      00879A 90 93            [ 1] 1472         LDW Y,X
      00879C 90 EE 02         [ 2] 1473         LDW Y,(2,Y)
      00879F 90 53            [ 2] 1474         CPLW Y
      0087A1 72 A9 00 01      [ 2] 1475         addw y,#1
      0087A5 EF 02            [ 2] 1476         LDW (2,X),Y
      0087A7 90 BE 24         [ 2] 1477         LDW Y,YTEMP
      0087AA 24 02            [ 1] 1478         JRNC DN1 
      0087AC 90 5C            [ 2] 1479         INCW Y
      0087AE FF               [ 2] 1480 DN1:    LDW (X),Y
      0087AF 81               [ 4] 1481         RET
                                   1482 
                                   1483 
                                   1484 ;       S>D ( n -- d )
                                   1485 ; convert single integer to double 
      0087B0 87 89                 1486         .word LINK 
                           000732  1487         LINK=. 
      0087B2 03                    1488         .byte 3 
      0087B3 53 3E 44              1489         .ascii "S>D"
      0087B6                       1490 STOD: 
      0087B6 1D 00 02         [ 2] 1491         subw x,#CELLL 
      0087B9 90 5F            [ 1] 1492         clrw y 
      0087BB FF               [ 2] 1493         ldw (x),y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



      0087BC 90 93            [ 1] 1494         ldw y,x 
      0087BE 90 EE 02         [ 2] 1495         ldw y,(2,y)
      0087C1 2A 05            [ 1] 1496         jrpl 1$ 
      0087C3 90 AE FF FF      [ 2] 1497         ldw y,#-1
      0087C7 FF               [ 2] 1498         ldw (x),y 
      0087C8 81               [ 4] 1499 1$:     ret 
                                   1500 
                                   1501 
                                   1502 
                                   1503 
                                   1504 ;       -       ( n1 n2 -- n1-n2 )
                                   1505 ;       Subtraction.
      0087C9 87 B2                 1506         .word      LINK
                           00074B  1507 LINK = . 
      0087CB 01                    1508         .byte      1
      0087CC 2D                    1509         .ascii     "-"
      0087CD                       1510 SUBB:
      0087CD 90 93            [ 1] 1511         LDW Y,X
      0087CF 90 FE            [ 2] 1512         LDW Y,(Y)
      0087D1 90 BF 24         [ 2] 1513         LDW YTEMP,Y
      0087D4 1C 00 02         [ 2] 1514         ADDW X,#2
      0087D7 90 93            [ 1] 1515         LDW Y,X
      0087D9 90 FE            [ 2] 1516         LDW Y,(Y)
      0087DB 72 B2 00 24      [ 2] 1517         SUBW Y,YTEMP
      0087DF FF               [ 2] 1518         LDW (X),Y
      0087E0 81               [ 4] 1519         RET
                                   1520 
                                   1521 ;       ABS     ( n -- n )
                                   1522 ;       Return  absolute value of n.
      0087E1 87 CB                 1523         .word      LINK
                           000763  1524 LINK = . 
      0087E3 03                    1525         .byte      3
      0087E4 41 42 53              1526         .ascii     "ABS"
      0087E7                       1527 ABSS:
      0087E7 90 93            [ 1] 1528         LDW Y,X
      0087E9 90 FE            [ 2] 1529 	LDW Y,(Y)
      0087EB 2A 03            [ 1] 1530         JRPL     AB1     ;negate:
      0087ED 90 50            [ 2] 1531         NEGW     Y     ;else negate hi byte
      0087EF FF               [ 2] 1532         LDW (X),Y
      0087F0 81               [ 4] 1533 AB1:    RET
                                   1534 
                                   1535 ;       =       ( w w -- t )
                                   1536 ;       Return true if top two are =al.
      0087F1 87 E3                 1537         .word      LINK
                           000773  1538 LINK = . 
      0087F3 01                    1539         .byte      1
      0087F4 3D                    1540         .ascii     "="
      0087F5                       1541 EQUAL:
      0087F5 A6 FF            [ 1] 1542         LD A,#0xFF  ;true
      0087F7 90 93            [ 1] 1543         LDW Y,X    ;D = n2
      0087F9 90 FE            [ 2] 1544         LDW Y,(Y)
      0087FB 90 BF 24         [ 2] 1545         LDW YTEMP,Y
      0087FE 1C 00 02         [ 2] 1546         ADDW X,#2
      008801 90 93            [ 1] 1547         LDW Y,X
      008803 90 FE            [ 2] 1548         LDW Y,(Y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



      008805 90 B3 24         [ 2] 1549         CPW Y,YTEMP     ;if n2 <> n1
      008808 27 01            [ 1] 1550         JREQ     EQ1
      00880A 4F               [ 1] 1551         CLR A
      00880B F7               [ 1] 1552 EQ1:    LD (X),A
      00880C E7 01            [ 1] 1553         LD (1,X),A
      00880E 81               [ 4] 1554 	RET     
                                   1555 
                                   1556 ;       U<      ( u u -- t )
                                   1557 ;       Unsigned compare of top two items.
      00880F 87 F3                 1558         .word      LINK
                           000791  1559 LINK = . 
      008811 02                    1560         .byte      2
      008812 55 3C                 1561         .ascii     "U<"
      008814                       1562 ULESS:
      008814 A6 FF            [ 1] 1563         LD A,#0xFF  ;true
      008816 90 93            [ 1] 1564         LDW Y,X    ;D = n2
      008818 90 FE            [ 2] 1565         LDW Y,(Y)
      00881A 90 BF 24         [ 2] 1566         LDW YTEMP,Y
      00881D 1C 00 02         [ 2] 1567         ADDW X,#2
      008820 90 93            [ 1] 1568         LDW Y,X
      008822 90 FE            [ 2] 1569         LDW Y,(Y)
      008824 90 B3 24         [ 2] 1570         CPW Y,YTEMP     ;if n2 <> n1
      008827 25 01            [ 1] 1571         JRULT     ULES1
      008829 4F               [ 1] 1572         CLR A
      00882A F7               [ 1] 1573 ULES1:  LD (X),A
      00882B E7 01            [ 1] 1574         LD (1,X),A
      00882D 81               [ 4] 1575 	RET     
                                   1576 
                                   1577 ;       <       ( n1 n2 -- t )
                                   1578 ;       Signed compare of top two items.
      00882E 88 11                 1579         .word      LINK
                           0007B0  1580 LINK = . 
      008830 01                    1581         .byte      1
      008831 3C                    1582         .ascii     "<"
      008832                       1583 LESS:
      008832 A6 FF            [ 1] 1584         LD A,#0xFF  ;true
      008834 90 93            [ 1] 1585         LDW Y,X    ;D = n2
      008836 90 FE            [ 2] 1586         LDW Y,(Y)
      008838 90 BF 24         [ 2] 1587         LDW YTEMP,Y
      00883B 1C 00 02         [ 2] 1588         ADDW X,#2
      00883E 90 93            [ 1] 1589         LDW Y,X
      008840 90 FE            [ 2] 1590         LDW Y,(Y)
      008842 90 B3 24         [ 2] 1591         CPW Y,YTEMP     ;if n2 <> n1
      008845 2F 01            [ 1] 1592         JRSLT     LT1
      008847 4F               [ 1] 1593         CLR A
      008848 F7               [ 1] 1594 LT1:    LD (X),A
      008849 E7 01            [ 1] 1595         LD (1,X),A
      00884B 81               [ 4] 1596 	RET     
                                   1597 
                                   1598 ;       MAX     ( n n -- n )
                                   1599 ;       Return greater of two top items.
      00884C 88 30                 1600         .word      LINK
                           0007CE  1601 LINK = . 
      00884E 03                    1602         .byte      3
      00884F 4D 41 58              1603         .ascii     "MAX"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



      008852                       1604 MAX:
      008852 90 93            [ 1] 1605         LDW Y,X    ;D = n2
      008854 90 EE 02         [ 2] 1606         LDW Y,(2,Y)
      008857 90 BF 24         [ 2] 1607         LDW YTEMP,Y
      00885A 90 93            [ 1] 1608         LDW Y,X
      00885C 90 FE            [ 2] 1609         LDW Y,(Y)
      00885E 90 B3 24         [ 2] 1610         CPW Y,YTEMP     ;if n2 <> n1
      008861 2F 02            [ 1] 1611         JRSLT     MAX1
      008863 EF 02            [ 2] 1612         LDW (2,X),Y
      008865 1C 00 02         [ 2] 1613 MAX1:   ADDW X,#2
      008868 81               [ 4] 1614 	RET     
                                   1615 
                                   1616 ;       MIN     ( n n -- n )
                                   1617 ;       Return smaller of top two items.
      008869 88 4E                 1618         .word      LINK
                           0007EB  1619 LINK = . 
      00886B 03                    1620         .byte      3
      00886C 4D 49 4E              1621         .ascii     "MIN"
      00886F                       1622 MIN:
      00886F 90 93            [ 1] 1623         LDW Y,X    ;D = n2
      008871 90 EE 02         [ 2] 1624         LDW Y,(2,Y)
      008874 90 BF 24         [ 2] 1625         LDW YTEMP,Y
      008877 90 93            [ 1] 1626         LDW Y,X
      008879 90 FE            [ 2] 1627         LDW Y,(Y)
      00887B 90 B3 24         [ 2] 1628         CPW Y,YTEMP     ;if n2 <> n1
      00887E 2C 02            [ 1] 1629         JRSGT     MIN1
      008880 EF 02            [ 2] 1630         LDW (2,X),Y
      008882 1C 00 02         [ 2] 1631 MIN1:	ADDW X,#2
      008885 81               [ 4] 1632 	RET     
                                   1633 
                                   1634 ;       WITHIN  ( u ul uh -- t )
                                   1635 ;       Return true if u is within
                                   1636 ;       range of ul and uh. ( ul <= u < uh )
      008886 88 6B                 1637         .word      LINK
                           000808  1638 LINK = . 
      008888 06                    1639         .byte      6
      008889 57 49 54 48 49 4E     1640         .ascii     "WITHIN"
      00888F                       1641 WITHI:
      00888F CD 85 83         [ 4] 1642         CALL     OVER
      008892 CD 87 CD         [ 4] 1643         CALL     SUBB
      008895 CD 85 22         [ 4] 1644         CALL     TOR
      008898 CD 87 CD         [ 4] 1645         CALL     SUBB
      00889B CD 85 03         [ 4] 1646         CALL     RFROM
      00889E CC 88 14         [ 2] 1647         JP     ULESS
                                   1648 
                                   1649 ;; Divide
                                   1650 
                                   1651 ;       UM/MOD  ( udl udh un -- ur uq )
                                   1652 ;       Unsigned divide of a double by a
                                   1653 ;       single. Return mod and quotient.
      0088A1 88 88                 1654         .word      LINK
                           000823  1655 LINK = . 
      0088A3 06                    1656         .byte      6
      0088A4 55 4D 2F 4D 4F 44     1657         .ascii     "UM/MOD"
      0088AA                       1658 UMMOD:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



      0088AA BF 22            [ 2] 1659 	LDW XTEMP,X	; save stack pointer
      0088AC FE               [ 2] 1660 	LDW X,(X)	; un
      0088AD BF 24            [ 2] 1661 	LDW YTEMP,X     ; save un
      0088AF 90 BE 22         [ 2] 1662 	LDW Y,XTEMP	; stack pointer
      0088B2 90 EE 04         [ 2] 1663 	LDW Y,(4,Y)     ; Y=udl
      0088B5 BE 22            [ 2] 1664 	LDW X,XTEMP
      0088B7 EE 02            [ 2] 1665 	LDW X,(2,X)	; X=udh
      0088B9 B3 24            [ 2] 1666 	CPW X,YTEMP
      0088BB 23 0F            [ 2] 1667 	JRULE MMSM1
      0088BD BE 22            [ 2] 1668 	LDW X,XTEMP
      0088BF 1C 00 02         [ 2] 1669 	ADDW X,#2	; pop off 1 level
      0088C2 90 AE FF FF      [ 2] 1670 	LDW Y,#0xFFFF
      0088C6 FF               [ 2] 1671 	LDW (X),Y
      0088C7 90 5F            [ 1] 1672 	CLRW Y
      0088C9 EF 02            [ 2] 1673 	LDW (2,X),Y
      0088CB 81               [ 4] 1674 	RET
      0088CC                       1675 MMSM1:
                                   1676 ; take advantage of divw x,y when udh==0
      0088CC 5D               [ 2] 1677         tnzw x  ; is udh==0?
      0088CD 26 11            [ 1] 1678         jrne MMSM2 
      0088CF 93               [ 1] 1679         ldw x,y    ;udl 
      0088D0 90 BE 24         [ 2] 1680         ldw y,YTEMP ; divisor 
      0088D3 65               [ 2] 1681         divw x,y 
      0088D4 89               [ 2] 1682         pushw x     ; quotient 
      0088D5 BE 22            [ 2] 1683         ldw x,XTEMP 
      0088D7 1C 00 02         [ 2] 1684         addw x,#CELLL 
      0088DA EF 02            [ 2] 1685         ldw (2,x),y  ; ur
      0088DC 90 85            [ 2] 1686         popw y 
      0088DE FF               [ 2] 1687         ldw (x),y ; uq 
      0088DF 81               [ 4] 1688         ret 
      0088E0                       1689 MMSM2:        
      0088E0 A6 11            [ 1] 1690 	LD A,#17	; loop count
      0088E2                       1691 MMSM3:
      0088E2 B3 24            [ 2] 1692 	CPW X,YTEMP	; compare udh to un
      0088E4 25 04            [ 1] 1693 	JRULT MMSM4	; can't subtract
      0088E6 72 B0 00 24      [ 2] 1694 	SUBW X,YTEMP	; can subtract
      0088EA                       1695 MMSM4:
      0088EA 8C               [ 1] 1696 	CCF	; quotient bit
      0088EB 90 59            [ 2] 1697 	RLCW Y	; rotate into quotient
      0088ED 59               [ 2] 1698 	RLCW X	; rotate into remainder
      0088EE 4A               [ 1] 1699 	DEC A	; repeat
      0088EF 22 F1            [ 1] 1700 	JRUGT MMSM3
      0088F1 56               [ 2] 1701         RRCW X 
      0088F2 BF 24            [ 2] 1702 	LDW YTEMP,X	; done, save remainder
      0088F4 BE 22            [ 2] 1703 	LDW X,XTEMP
      0088F6 1C 00 02         [ 2] 1704 	ADDW X,#2	; drop
      0088F9 FF               [ 2] 1705 	LDW (X),Y
      0088FA 90 BE 24         [ 2] 1706 	LDW Y,YTEMP	; save quotient
      0088FD EF 02            [ 2] 1707 	LDW (2,X),Y
      0088FF 81               [ 4] 1708 	RET
                                   1709 	
                                   1710 ;       M/MOD   ( d n -- r q )
                                   1711 ;       Signed floored divide of double by
                                   1712 ;       single. Return mod and quotient.
      008900 88 A3                 1713         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



                           000882  1714 LINK = . 
      008902 05                    1715         .byte      5
      008903 4D 2F 4D 4F 44        1716         .ascii     "M/MOD"
      008908                       1717 MSMOD:  
      008908 CD 85 59         [ 4] 1718         CALL	DUPP
      00890B CD 85 92         [ 4] 1719         CALL	ZLESS
      00890E CD 85 59         [ 4] 1720         CALL	DUPP
      008911 CD 85 22         [ 4] 1721         CALL	TOR
      008914 CD 84 67         [ 4] 1722         CALL	QBRAN
      008917 89 25                 1723         .word	MMOD1
      008919 CD 87 7F         [ 4] 1724         CALL	NEGAT
      00891C CD 85 22         [ 4] 1725         CALL	TOR
      00891F CD 87 91         [ 4] 1726         CALL	DNEGA
      008922 CD 85 03         [ 4] 1727         CALL	RFROM
      008925 CD 85 22         [ 4] 1728 MMOD1:	CALL	TOR
      008928 CD 85 59         [ 4] 1729         CALL	DUPP
      00892B CD 85 92         [ 4] 1730         CALL	ZLESS
      00892E CD 84 67         [ 4] 1731         CALL	QBRAN
      008931 89 39                 1732         .word	MMOD2
      008933 CD 85 16         [ 4] 1733         CALL	RAT
      008936 CD 87 54         [ 4] 1734         CALL	PLUS
      008939 CD 85 03         [ 4] 1735 MMOD2:	CALL	RFROM
      00893C CD 88 AA         [ 4] 1736         CALL	UMMOD
      00893F CD 85 03         [ 4] 1737         CALL	RFROM
      008942 CD 84 67         [ 4] 1738         CALL	QBRAN
      008945 89 50                 1739         .word	MMOD3
      008947 CD 85 69         [ 4] 1740         CALL	SWAPP
      00894A CD 87 7F         [ 4] 1741         CALL	NEGAT
      00894D CD 85 69         [ 4] 1742         CALL	SWAPP
      008950 81               [ 4] 1743 MMOD3:	RET
                                   1744 
                                   1745 ;       /MOD    ( n n -- r q )
                                   1746 ;       Signed divide. Return mod and quotient.
      008951 89 02                 1747         .word      LINK
                           0008D3  1748 LINK = . 
      008953 04                    1749         .byte      4
      008954 2F 4D 4F 44           1750         .ascii     "/MOD"
      008958                       1751 SLMOD:
      008958 CD 85 83         [ 4] 1752         CALL	OVER
      00895B CD 85 92         [ 4] 1753         CALL	ZLESS
      00895E CD 85 69         [ 4] 1754         CALL	SWAPP
      008961 CC 89 08         [ 2] 1755         JP	MSMOD
                                   1756 
                                   1757 ;       MOD     ( n n -- r )
                                   1758 ;       Signed divide. Return mod only.
      008964 89 53                 1759         .word      LINK
                           0008E6  1760 LINK = . 
      008966 03                    1761         .byte      3
      008967 4D 4F 44              1762         .ascii     "MOD"
      00896A                       1763 MODD:
      00896A CD 89 58         [ 4] 1764 	CALL	SLMOD
      00896D CC 85 4F         [ 2] 1765 	JP	DROP
                                   1766 
                                   1767 ;       /       ( n n -- q )
                                   1768 ;       Signed divide. Return quotient only.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



      008970 89 66                 1769         .word      LINK
                           0008F2  1770 LINK = . 
      008972 01                    1771         .byte      1
      008973 2F                    1772         .ascii     "/"
      008974                       1773 SLASH:
      008974 CD 89 58         [ 4] 1774         CALL	SLMOD
      008977 CD 85 69         [ 4] 1775         CALL	SWAPP
      00897A CC 85 4F         [ 2] 1776         JP	DROP
                                   1777 
                                   1778 ;; Multiply
                                   1779 
                                   1780 ;       UM*     ( u u -- ud )
                                   1781 ;       Unsigned multiply. Return double product.
      00897D 89 72                 1782         .word      LINK
                           0008FF  1783 LINK = . 
      00897F 03                    1784         .byte      3
      008980 55 4D 2A              1785         .ascii     "UM*"
      008983                       1786 UMSTA:	; stack have 4 bytes u1=a,b u2=c,d
                                   1787 ; take advantage of SP addressing modes
                                   1788 ; these PRODx in RAM are not required
                                   1789 ; the product is kept on stack as local variable 
                                   1790         ;; bytes offset on data stack 
                           000002  1791         da=2 
                           000003  1792         db=3 
                           000000  1793         dc=0 
                           000001  1794         dd=1 
                                   1795         ;; product bytes offset on return stack 
                           000001  1796         UD1=1  ; ud bits 31..24
                           000002  1797         UD2=2  ; ud bits 23..16
                           000003  1798         UD3=3  ; ud bits 15..8 
                           000004  1799         UD4=4  ; ud bits 7..0 
                                   1800         ;; local variable for product set to zero   
      008983 90 5F            [ 1] 1801         clrw y 
      008985 90 89            [ 2] 1802         pushw y  ; bits 15..0
      008987 90 89            [ 2] 1803         pushw y  ; bits 31..16 
      008989 E6 03            [ 1] 1804         ld a,(db,x) ; b 
      00898B 90 97            [ 1] 1805         ld yl,a 
      00898D E6 01            [ 1] 1806         ld a,(dd,x)   ; d
      00898F 90 42            [ 4] 1807         mul y,a    ; b*d  
      008991 17 03            [ 2] 1808         ldw (UD3,sp),y ; lowest weight product 
      008993 E6 03            [ 1] 1809         ld a,(db,x)
      008995 90 97            [ 1] 1810         ld yl,a 
      008997 E6 00            [ 1] 1811         ld a,(dc,x)
      008999 90 42            [ 4] 1812         mul y,a  ; b*c 
                                   1813         ;;; do the partial sum 
      00899B 72 F9 02         [ 2] 1814         addw y,(UD2,sp)
      00899E 4F               [ 1] 1815         clr a 
      00899F 49               [ 1] 1816         rlc a
      0089A0 6B 01            [ 1] 1817         ld (UD1,sp),a 
      0089A2 17 02            [ 2] 1818         ldw (UD2,sp),y 
      0089A4 E6 02            [ 1] 1819         ld a,(da,x)
      0089A6 90 97            [ 1] 1820         ld yl,a 
      0089A8 E6 01            [ 1] 1821         ld a,(dd,x)
      0089AA 90 42            [ 4] 1822         mul y,a   ; a*d 
                                   1823         ;; do partial sum 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



      0089AC 72 F9 02         [ 2] 1824         addw y,(UD2,sp)
      0089AF 4F               [ 1] 1825         clr a 
      0089B0 19 01            [ 1] 1826         adc a,(UD1,sp)
      0089B2 6B 01            [ 1] 1827         ld (UD1,sp),a  
      0089B4 17 02            [ 2] 1828         ldw (UD2,sp),y 
      0089B6 E6 02            [ 1] 1829         ld a,(da,x)
      0089B8 90 97            [ 1] 1830         ld yl,a 
      0089BA E6 00            [ 1] 1831         ld a,(dc,x)
      0089BC 90 42            [ 4] 1832         mul y,a  ;  a*c highest weight product 
                                   1833         ;;; do partial sum 
      0089BE 72 F9 01         [ 2] 1834         addw y,(UD1,sp)
      0089C1 FF               [ 2] 1835         ldw (x),y  ; udh 
      0089C2 16 03            [ 2] 1836         ldw y,(UD3,sp)
      0089C4 EF 02            [ 2] 1837         ldw (2,x),y  ; udl  
      0089C6 5B 04            [ 2] 1838         addw sp,#4 ; drop local variable 
      0089C8 81               [ 4] 1839         ret  
                                   1840 
                                   1841 
                                   1842 ;       *       ( n n -- n )
                                   1843 ;       Signed multiply. Return single product.
      0089C9 89 7F                 1844         .word      LINK
                           00094B  1845 LINK = . 
      0089CB 01                    1846         .byte      1
      0089CC 2A                    1847         .ascii     "*"
      0089CD                       1848 STAR:
      0089CD CD 89 83         [ 4] 1849 	CALL	UMSTA
      0089D0 CC 85 4F         [ 2] 1850 	JP	DROP
                                   1851 
                                   1852 ;       M*      ( n n -- d )
                                   1853 ;       Signed multiply. Return double product.
      0089D3 89 CB                 1854         .word      LINK
                           000955  1855 LINK = . 
      0089D5 02                    1856         .byte      2
      0089D6 4D 2A                 1857         .ascii     "M*"
      0089D8                       1858 MSTAR:      
      0089D8 CD 87 3F         [ 4] 1859         CALL	DDUP
      0089DB CD 85 CE         [ 4] 1860         CALL	XORR
      0089DE CD 85 92         [ 4] 1861         CALL	ZLESS
      0089E1 CD 85 22         [ 4] 1862         CALL	TOR
      0089E4 CD 87 E7         [ 4] 1863         CALL	ABSS
      0089E7 CD 85 69         [ 4] 1864         CALL	SWAPP
      0089EA CD 87 E7         [ 4] 1865         CALL	ABSS
      0089ED CD 89 83         [ 4] 1866         CALL	UMSTA
      0089F0 CD 85 03         [ 4] 1867         CALL	RFROM
      0089F3 CD 84 67         [ 4] 1868         CALL	QBRAN
      0089F6 89 FB                 1869         .word	MSTA1
      0089F8 CD 87 91         [ 4] 1870         CALL	DNEGA
      0089FB 81               [ 4] 1871 MSTA1:	RET
                                   1872 
                                   1873 ;       */MOD   ( n1 n2 n3 -- r q )
                                   1874 ;       Multiply n1 and n2, then divide
                                   1875 ;       by n3. Return mod and quotient.
      0089FC 89 D5                 1876         .word      LINK
                           00097E  1877 LINK = . 
      0089FE 05                    1878         .byte      5
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



      0089FF 2A 2F 4D 4F 44        1879         .ascii     "*/MOD"
      008A04                       1880 SSMOD:
      008A04 CD 85 22         [ 4] 1881         CALL     TOR
      008A07 CD 89 D8         [ 4] 1882         CALL     MSTAR
      008A0A CD 85 03         [ 4] 1883         CALL     RFROM
      008A0D CC 89 08         [ 2] 1884         JP     MSMOD
                                   1885 
                                   1886 ;       */      ( n1 n2 n3 -- q )
                                   1887 ;       Multiply n1 by n2, then divide
                                   1888 ;       by n3. Return quotient only.
      008A10 89 FE                 1889         .word      LINK
                           000992  1890 LINK = . 
      008A12 02                    1891         .byte      2
      008A13 2A 2F                 1892         .ascii     "*/"
      008A15                       1893 STASL:
      008A15 CD 8A 04         [ 4] 1894         CALL	SSMOD
      008A18 CD 85 69         [ 4] 1895         CALL	SWAPP
      008A1B CC 85 4F         [ 2] 1896         JP	DROP
                                   1897 
                                   1898 ;; Miscellaneous
                                   1899 
                                   1900 ;       CELL+   ( a -- a )
                                   1901 ;       Add cell size in byte to address.
      008A1E 8A 12                 1902         .word      LINK
                           0009A0  1903 LINK = . 
      008A20 02                    1904         .byte       2
      008A21 32 2B                 1905         .ascii     "2+"
      008A23                       1906 CELLP:
      008A23 90 93            [ 1] 1907         LDW Y,X
      008A25 90 FE            [ 2] 1908 	LDW Y,(Y)
      008A27 72 A9 00 02      [ 2] 1909         ADDW Y,#CELLL 
      008A2B FF               [ 2] 1910         LDW (X),Y
      008A2C 81               [ 4] 1911         RET
                                   1912 
                                   1913 ;       CELL-   ( a -- a )
                                   1914 ;       Subtract 2 from address.
      008A2D 8A 20                 1915         .word      LINK
                           0009AF  1916 LINK = . 
      008A2F 02                    1917         .byte       2
      008A30 32 2D                 1918         .ascii     "2-"
      008A32                       1919 CELLM:
      008A32 90 93            [ 1] 1920         LDW Y,X
      008A34 90 FE            [ 2] 1921 	LDW Y,(Y)
      008A36 72 A2 00 02      [ 2] 1922         SUBW Y,#CELLL
      008A3A FF               [ 2] 1923         LDW (X),Y
      008A3B 81               [ 4] 1924         RET
                                   1925 
                                   1926 ;       CELLS   ( n -- n )
                                   1927 ;       Multiply tos by 2.
      008A3C 8A 2F                 1928         .word      LINK
                           0009BE  1929 LINK = . 
      008A3E 02                    1930         .byte       2
      008A3F 32 2A                 1931         .ascii     "2*"
      008A41                       1932 CELLS:
      008A41 90 93            [ 1] 1933         LDW Y,X
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



      008A43 90 FE            [ 2] 1934 	LDW Y,(Y)
      008A45 90 58            [ 2] 1935         SLAW Y
      008A47 FF               [ 2] 1936         LDW (X),Y
      008A48 81               [ 4] 1937         RET
                                   1938 
                                   1939 ;       1+      ( a -- a )
                                   1940 ;       Add cell size in byte to address.
      008A49 8A 3E                 1941         .word      LINK
                           0009CB  1942 LINK = . 
      008A4B 02                    1943         .byte      2
      008A4C 31 2B                 1944         .ascii     "1+"
      008A4E                       1945 ONEP:
      008A4E 90 93            [ 1] 1946         LDW Y,X
      008A50 90 FE            [ 2] 1947 	LDW Y,(Y)
      008A52 90 5C            [ 2] 1948         INCW Y
      008A54 FF               [ 2] 1949         LDW (X),Y
      008A55 81               [ 4] 1950         RET
                                   1951 
                                   1952 ;       1-      ( a -- a )
                                   1953 ;       Subtract 2 from address.
      008A56 8A 4B                 1954         .word      LINK
                           0009D8  1955 LINK = . 
      008A58 02                    1956         .byte      2
      008A59 31 2D                 1957         .ascii     "1-"
      008A5B                       1958 ONEM:
      008A5B 90 93            [ 1] 1959         LDW Y,X
      008A5D 90 FE            [ 2] 1960 	LDW Y,(Y)
      008A5F 90 5A            [ 2] 1961         DECW Y
      008A61 FF               [ 2] 1962         LDW (X),Y
      008A62 81               [ 4] 1963         RET
                                   1964 
                                   1965 ;  shift left n times 
                                   1966 ; LSHIFT ( n1 n2 -- n1<<n2 )
      008A63 8A 58                 1967         .word LINK 
                           0009E5  1968         LINK=.
      008A65 06                    1969         .byte 6 
      008A66 4C 53 48 49 46 54     1970         .ascii "LSHIFT"
      008A6C                       1971 LSHIFT:
      008A6C E6 01            [ 1] 1972         ld a,(1,x)
      008A6E 1C 00 02         [ 2] 1973         addw x,#CELLL 
      008A71 90 93            [ 1] 1974         ldw y,x 
      008A73 90 FE            [ 2] 1975         ldw y,(y)
      008A75                       1976 LSHIFT1:
      008A75 4D               [ 1] 1977         tnz a 
      008A76 27 05            [ 1] 1978         jreq LSHIFT4 
      008A78 90 58            [ 2] 1979         sllw y 
      008A7A 4A               [ 1] 1980         dec a 
      008A7B 20 F8            [ 2] 1981         jra LSHIFT1 
      008A7D                       1982 LSHIFT4:
      008A7D FF               [ 2] 1983         ldw (x),y 
      008A7E 81               [ 4] 1984         ret 
                                   1985 
                                   1986 ; shift right n times                 
                                   1987 ; RSHIFT (n1 n2 -- n1>>n2 )
      008A7F 8A 65                 1988         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



                           000A01  1989         LINK=.
      008A81 06                    1990         .byte 6
      008A82 52 53 48 49 46 54     1991         .ascii "RSHIFT"
      008A88                       1992 RSHIFT:
      008A88 E6 01            [ 1] 1993         ld a,(1,x)
      008A8A 1C 00 02         [ 2] 1994         addw x,#CELLL 
      008A8D 90 93            [ 1] 1995         ldw y,x 
      008A8F 90 FE            [ 2] 1996         ldw y,(y)
      008A91                       1997 RSHIFT1:
      008A91 4D               [ 1] 1998         tnz a 
      008A92 27 05            [ 1] 1999         jreq RSHIFT4 
      008A94 90 54            [ 2] 2000         srlw y 
      008A96 4A               [ 1] 2001         dec a 
      008A97 20 F8            [ 2] 2002         jra RSHIFT1 
      008A99                       2003 RSHIFT4:
      008A99 FF               [ 2] 2004         ldw (x),y 
      008A9A 81               [ 4] 2005         ret 
                                   2006 
                                   2007 
                                   2008 ;       2/      ( n -- n )
                                   2009 ;       divide  tos by 2.
      008A9B 8A 81                 2010         .word      LINK
                           000A1D  2011 LINK = . 
      008A9D 02                    2012         .byte      2
      008A9E 32 2F                 2013         .ascii     "2/"
      008AA0                       2014 TWOSL:
      008AA0 90 93            [ 1] 2015         LDW Y,X
      008AA2 90 FE            [ 2] 2016 	LDW Y,(Y)
      008AA4 90 57            [ 2] 2017         SRAW Y
      008AA6 FF               [ 2] 2018         LDW (X),Y
      008AA7 81               [ 4] 2019         RET
                                   2020 
                                   2021 ;       BL      ( -- 32 )
                                   2022 ;       Return 32,  blank character.
      008AA8 8A 9D                 2023         .word      LINK
                           000A2A  2024 LINK = . 
      008AAA 02                    2025         .byte      2
      008AAB 42 4C                 2026         .ascii     "BL"
      008AAD                       2027 BLANK:
      008AAD 1D 00 02         [ 2] 2028         SUBW X,#2
      008AB0 90 AE 00 20      [ 2] 2029 	LDW Y,#32
      008AB4 FF               [ 2] 2030         LDW (X),Y
      008AB5 81               [ 4] 2031         RET
                                   2032 
                                   2033 ;         0     ( -- 0)
                                   2034 ;         Return 0.
      008AB6 8A AA                 2035         .word      LINK
                           000A38  2036 LINK = . 
      008AB8 01                    2037         .byte       1
      008AB9 30                    2038         .ascii     "0"
      008ABA                       2039 ZERO:
      008ABA 1D 00 02         [ 2] 2040         SUBW X,#2
      008ABD 90 5F            [ 1] 2041 	CLRW Y
      008ABF FF               [ 2] 2042         LDW (X),Y
      008AC0 81               [ 4] 2043         RET
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



                                   2044 
                                   2045 ;         1     ( -- 1)
                                   2046 ;         Return 1.
      008AC1 8A B8                 2047         .word      LINK
                           000A43  2048 LINK = . 
      008AC3 01                    2049         .byte       1
      008AC4 31                    2050         .ascii     "1"
      008AC5                       2051 ONE:
      008AC5 1D 00 02         [ 2] 2052         SUBW X,#2
      008AC8 90 AE 00 01      [ 2] 2053 	LDW Y,#1
      008ACC FF               [ 2] 2054         LDW (X),Y
      008ACD 81               [ 4] 2055         RET
                                   2056 
                                   2057 ;         -1    ( -- -1)
                                   2058 ;         Return 32,  blank character.
      008ACE 8A C3                 2059         .word      LINK
                           000A50  2060 LINK = . 
      008AD0 02                    2061         .byte       2
      008AD1 2D 31                 2062         .ascii     "-1"
      008AD3                       2063 MONE:
      008AD3 1D 00 02         [ 2] 2064         SUBW X,#2
      008AD6 90 AE FF FF      [ 2] 2065 	LDW Y,#0xFFFF
      008ADA FF               [ 2] 2066         LDW (X),Y
      008ADB 81               [ 4] 2067         RET
                                   2068 
                                   2069 ;       >CHAR   ( c -- c )
                                   2070 ;       Filter non-printing characters.
      008ADC 8A D0                 2071         .word      LINK
                           000A5E  2072 LINK = . 
      008ADE 05                    2073         .byte      5
      008ADF 3E 43 48 41 52        2074         .ascii     ">CHAR"
      008AE4                       2075 TCHAR:
      008AE4 E6 01            [ 1] 2076         ld a,(1,x)
      008AE6 A1 20            [ 1] 2077         cp a,#32  
      008AE8 2B 05            [ 1] 2078         jrmi 1$ 
      008AEA A1 7F            [ 1] 2079         cp a,#127 
      008AEC 2A 01            [ 1] 2080         jrpl 1$ 
      008AEE 81               [ 4] 2081         ret 
      008AEF A6 5F            [ 1] 2082 1$:     ld a,#'_ 
      008AF1 E7 01            [ 1] 2083         ld (1,x),a 
      008AF3 81               [ 4] 2084         ret 
                                   2085 
                                   2086 ;       DEPTH   ( -- n )
                                   2087 ;       Return  depth of  data stack.
      008AF4 8A DE                 2088         .word      LINK
                           000A76  2089 LINK = . 
      008AF6 05                    2090         .byte      5
      008AF7 44 45 50 54 48        2091         .ascii     "DEPTH"
      008AFC                       2092 DEPTH: 
      008AFC 90 BE 2A         [ 2] 2093         LDW Y,SP0    ;save data stack ptr
      008AFF BF 22            [ 2] 2094 	LDW XTEMP,X
      008B01 72 B2 00 22      [ 2] 2095         SUBW Y,XTEMP     ;#bytes = SP0 - X
      008B05 90 57            [ 2] 2096         SRAW Y    ;Y = #stack items
      008B07 1D 00 02         [ 2] 2097 	SUBW X,#2
      008B0A FF               [ 2] 2098         LDW (X),Y     ; if neg, underflow
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



      008B0B 81               [ 4] 2099         RET
                                   2100 
                                   2101 ;       PICK    ( ... +n -- ... w )
                                   2102 ;       Copy  nth stack item to tos.
      008B0C 8A F6                 2103         .word      LINK
                           000A8E  2104 LINK = . 
      008B0E 04                    2105         .byte      4
      008B0F 50 49 43 4B           2106         .ascii     "PICK"
      008B13                       2107 PICK:
      008B13 90 93            [ 1] 2108         LDW Y,X   ;D = n1
      008B15 90 FE            [ 2] 2109         LDW Y,(Y)
                                   2110 ; modified for standard compliance          
                                   2111 ; 0 PICK must be equivalent to DUP 
      008B17 90 5C            [ 2] 2112         INCW Y 
      008B19 90 58            [ 2] 2113         SLAW Y
      008B1B BF 22            [ 2] 2114         LDW XTEMP,X
      008B1D 72 B9 00 22      [ 2] 2115         ADDW Y,XTEMP
      008B21 90 FE            [ 2] 2116         LDW Y,(Y)
      008B23 FF               [ 2] 2117         LDW (X),Y
      008B24 81               [ 4] 2118         RET
                                   2119 
                                   2120 ;; Memory access
                                   2121 
                                   2122 ;       +!      ( n a -- )
                                   2123 ;       Add n to  contents at address a.
      008B25 8B 0E                 2124         .word      LINK
                           000AA7  2125 LINK = . 
      008B27 02                    2126         .byte      2
      008B28 2B 21                 2127         .ascii     "+!"
      008B2A                       2128 PSTOR:
      008B2A 90 93            [ 1] 2129         ldw y,x 
      008B2C 90 FE            [ 2] 2130         ldw y,(y)
      008B2E 90 BF 24         [ 2] 2131         ldw YTEMP,y  ; address
      008B31 90 FE            [ 2] 2132         ldw y,(y)  
      008B33 90 89            [ 2] 2133         pushw y  ; value at address 
      008B35 90 93            [ 1] 2134         ldw y,x 
      008B37 90 EE 02         [ 2] 2135         ldw y,(2,y) ; n 
      008B3A 72 F9 01         [ 2] 2136         addw y,(1,sp) ; n+value
      008B3D 91 CF 24         [ 5] 2137         ldw [YTEMP],y ;  a!
      008B40 90 85            [ 2] 2138         popw y    ;drop local var
      008B42 1C 00 04         [ 2] 2139         addw x,#4 ; DDROP 
      008B45 81               [ 4] 2140         ret 
                                   2141 
                                   2142 ;       2!      ( d a -- )
                                   2143 ;       Store  double integer to address a.
      008B46 8B 27                 2144         .word      LINK
                           000AC8  2145 LINK = . 
      008B48 02                    2146         .byte      2
      008B49 32 21                 2147         .ascii     "2!"
      008B4B                       2148 DSTOR:
      008B4B 90 93            [ 1] 2149         ldw y,x 
      008B4D 90 FE            [ 2] 2150         ldw y,(y)
      008B4F 90 BF 24         [ 2] 2151         ldw YTEMP,y ; address 
      008B52 1C 00 02         [ 2] 2152         addw x,#CELLL ; drop a 
      008B55 90 93            [ 1] 2153         ldw y,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



      008B57 90 FE            [ 2] 2154         ldw y,(y) ; hi word 
      008B59 89               [ 2] 2155         pushw x 
      008B5A EE 02            [ 2] 2156         ldw x,(2,x) ; lo word 
      008B5C 91 CF 24         [ 5] 2157         ldw [YTEMP],y
      008B5F 90 93            [ 1] 2158         ldw y,x 
      008B61 AE 00 02         [ 2] 2159         ldw x,#2 
      008B64 92 DF 24         [ 5] 2160         ldw ([YTEMP],x),y 
      008B67 85               [ 2] 2161         popw x 
      008B68 1C 00 04         [ 2] 2162         addw x,#4 ; DDROP 
      008B6B 81               [ 4] 2163         ret 
                                   2164 
                                   2165 ;       2@      ( a -- d )
                                   2166 ;       Fetch double integer from address a.
      008B6C 8B 48                 2167         .word      LINK
                           000AEE  2168 LINK = . 
      008B6E 02                    2169         .byte      2
      008B6F 32 40                 2170         .ascii     "2@"
      008B71                       2171 DAT:
      008B71 90 93            [ 1] 2172         ldw y,x 
      008B73 90 FE            [ 2] 2173         ldw y,(y) ;address 
      008B75 90 BF 24         [ 2] 2174         ldw YTEMP,y 
      008B78 1D 00 02         [ 2] 2175         subw x,#CELLL ; space for udh 
      008B7B 91 CE 24         [ 5] 2176         ldw y,[YTEMP] ; udh 
      008B7E FF               [ 2] 2177         ldw (x),y 
      008B7F 90 AE 00 02      [ 2] 2178         ldw y,#2
      008B83 91 DE 24         [ 5] 2179         ldw y,([YTEMP],y) ; udl 
      008B86 EF 02            [ 2] 2180         ldw (2,x),y
      008B88 81               [ 4] 2181         ret 
                                   2182 
                                   2183 ;       COUNT   ( b -- b +n )
                                   2184 ;       Return count byte of a string
                                   2185 ;       and add 1 to byte address.
      008B89 8B 6E                 2186         .word      LINK
                           000B0B  2187 LINK = . 
      008B8B 05                    2188         .byte      5
      008B8C 43 4F 55 4E 54        2189         .ascii     "COUNT"
      008B91                       2190 COUNT:
      008B91 90 93            [ 1] 2191         ldw y,x 
      008B93 90 FE            [ 2] 2192         ldw y,(y) ; address 
      008B95 90 F6            [ 1] 2193         ld a,(y)  ; count 
      008B97 90 5C            [ 2] 2194         incw y 
      008B99 FF               [ 2] 2195         ldw (x),y 
      008B9A 1D 00 02         [ 2] 2196         subw x,#CELLL 
      008B9D E7 01            [ 1] 2197         ld (1,x),a 
      008B9F 7F               [ 1] 2198         clr (x)
      008BA0 81               [ 4] 2199         ret 
                                   2200 
                                   2201 ;       HERE    ( -- a )
                                   2202 ;       Return  top of  variables
      008BA1 8B 8B                 2203         .word      LINK
                           000B23  2204 LINK = . 
      008BA3 04                    2205         .byte      4
      008BA4 48 45 52 45           2206         .ascii     "HERE"
      008BA8                       2207 HERE:
      008BA8 90 AE 00 16      [ 2] 2208       	ldw y,#UVP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



      008BAC 90 FE            [ 2] 2209         ldw y,(y)
      008BAE 1D 00 02         [ 2] 2210         subw x,#CELLL 
      008BB1 FF               [ 2] 2211         ldw (x),y 
      008BB2 81               [ 4] 2212         ret 
                                   2213 
                                   2214 ;       PAD     ( -- a )
                                   2215 ;       Return address of text buffer
                                   2216 ;       above  code dictionary.
      008BB3 8B A3                 2217         .word      LINK
                           000B35  2218 LINK = . 
      008BB5 03                    2219         .byte      3
      008BB6 50 41 44              2220         .ascii     "PAD"
      008BB9                       2221 PAD:
      008BB9 CD 8B A8         [ 4] 2222         CALL     HERE
      008BBC CD 84 34         [ 4] 2223         CALL     DOLIT
      008BBF 00 50                 2224         .word      80
      008BC1 CC 87 54         [ 2] 2225         JP     PLUS
                                   2226 
                                   2227 ;       TIB     ( -- a )
                                   2228 ;       Return address of terminal input buffer.
      008BC4 8B B5                 2229         .word      LINK
                           000B46  2230 LINK = . 
      008BC6 03                    2231         .byte      3
      008BC7 54 49 42              2232         .ascii     "TIB"
      008BCA                       2233 TIB:
      008BCA CD 86 44         [ 4] 2234         CALL     NTIB
      008BCD CD 8A 23         [ 4] 2235         CALL     CELLP
      008BD0 CC 84 B2         [ 2] 2236         JP     AT
                                   2237 
                                   2238 ;       @EXECUTE        ( a -- )
                                   2239 ;       Execute vector stored in address a.
      008BD3 8B C6                 2240         .word      LINK
                           000B55  2241 LINK = . 
      008BD5 08                    2242         .byte      8
      008BD6 40 45 58 45 43 55 54  2243         .ascii     "@EXECUTE"
             45
      008BDE                       2244 ATEXE:
      008BDE CD 84 B2         [ 4] 2245         CALL     AT
      008BE1 CD 87 03         [ 4] 2246         CALL     QDUP    ;?address or zero
      008BE4 CD 84 67         [ 4] 2247         CALL     QBRAN
      008BE7 8B EC                 2248         .word      EXE1
      008BE9 CD 84 8E         [ 4] 2249         CALL     EXECU   ;execute if non-zero
      008BEC 81               [ 4] 2250 EXE1:   RET     ;do nothing if zero
                                   2251 
                                   2252 ;       CMOVE   ( b1 b2 u -- )
                                   2253 ;       Copy u bytes from b1 to b2.
      008BED 8B D5                 2254         .word      LINK
                           000B6F  2255 LINK = . 
      008BEF 05                    2256         .byte      5
      008BF0 43 4D 4F 56 45        2257         .ascii     "CMOVE"
      008BF5                       2258 CMOVE:
      008BF5 CD 85 22         [ 4] 2259         CALL	TOR
      008BF8 CD 84 7E         [ 4] 2260         CALL	BRAN
      008BFB 8C 15                 2261         .word	CMOV2
      008BFD CD 85 22         [ 4] 2262 CMOV1:	CALL	TOR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



      008C00 CD 85 59         [ 4] 2263         CALL	DUPP
      008C03 CD 84 D0         [ 4] 2264         CALL	CAT
      008C06 CD 85 16         [ 4] 2265         CALL	RAT
      008C09 CD 84 BF         [ 4] 2266         CALL	CSTOR
      008C0C CD 8A 4E         [ 4] 2267         CALL	ONEP
      008C0F CD 85 03         [ 4] 2268         CALL	RFROM
      008C12 CD 8A 4E         [ 4] 2269         CALL	ONEP
      008C15 CD 84 48         [ 4] 2270 CMOV2:	CALL	DONXT
      008C18 8B FD                 2271         .word	CMOV1
      008C1A CC 87 34         [ 2] 2272         JP	DDROP
                                   2273 
                                   2274 ;       FILL    ( b u c -- )
                                   2275 ;       Fill u bytes of character c
                                   2276 ;       to area beginning at b.
      008C1D 8B EF                 2277         .word       LINK
                           000B9F  2278 LINK = . 
      008C1F 04                    2279         .byte       4
      008C20 46 49 4C 4C           2280         .ascii     "FILL"
      008C24                       2281 FILL:
      008C24 90 93            [ 1] 2282         ldw y,x 
      008C26 90 E6 01         [ 1] 2283         ld a,(1,y) ; c 
      008C29 1C 00 02         [ 2] 2284         addw x,#CELLL ; drop c 
      008C2C 90 93            [ 1] 2285         ldw y,x 
      008C2E 90 FE            [ 2] 2286         ldw y,(y) ; count
      008C30 90 89            [ 2] 2287         pushw y 
      008C32 1C 00 02         [ 2] 2288         addw x,#CELLL ; drop u 
      008C35 90 93            [ 1] 2289         ldw y,x 
      008C37 1C 00 02         [ 2] 2290         addw x,#CELLL ; drop b 
      008C3A 90 FE            [ 2] 2291         ldw y,(y) ; address
      008C3C 90 BF 24         [ 2] 2292         ldw YTEMP,y
      008C3F 90 85            [ 2] 2293         popw y ; count 
      008C41                       2294 FILL1:  
      008C41 92 C7 24         [ 4] 2295         ld [YTEMP],a 
      008C44 3C 25            [ 1] 2296         inc YTEMP+1
      008C46 24 02            [ 1] 2297         jrnc FILL2 
      008C48 3C 24            [ 1] 2298         inc YTEMP
      008C4A                       2299 FILL2: 
      008C4A 90 5A            [ 2] 2300         decw y ; count 
      008C4C 26 F3            [ 1] 2301         jrne FILL1  
      008C4E 81               [ 4] 2302         ret 
                                   2303 
                                   2304 ;       ERASE   ( b u -- )
                                   2305 ;       Erase u bytes beginning at b.
      008C4F 8C 1F                 2306         .word      LINK
                           000BD1  2307 LINK = . 
      008C51 05                    2308         .byte      5
      008C52 45 52 41 53 45        2309         .ascii     "ERASE"
      008C57                       2310 ERASE:
      008C57 90 5F            [ 1] 2311         clrw y 
      008C59 1D 00 02         [ 2] 2312         subw x,#CELLL 
      008C5C FF               [ 2] 2313         ldw (x),y 
      008C5D CC 8C 24         [ 2] 2314         jp FILL 
                                   2315 
                                   2316 
                                   2317 ;       PACK0   ( b u a -- a )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



                                   2318 ;       Build a counted string with
                                   2319 ;       u characters from b. Null fill.
      008C60 8C 51                 2320         .word      LINK
                           000BE2  2321 LINK = . 
      008C62 05                    2322         .byte      5
      008C63 50 41 43 4B 30        2323         .ascii     "PACK0"
      008C68                       2324 PACKS:
      008C68 CD 85 59         [ 4] 2325         CALL     DUPP
      008C6B CD 85 22         [ 4] 2326         CALL     TOR     ;strings only on cell boundary
      008C6E CD 87 3F         [ 4] 2327         CALL     DDUP
      008C71 CD 84 BF         [ 4] 2328         CALL     CSTOR
      008C74 CD 8A 4E         [ 4] 2329         CALL     ONEP ;save count
      008C77 CD 85 69         [ 4] 2330         CALL     SWAPP
      008C7A CD 8B F5         [ 4] 2331         CALL     CMOVE
      008C7D CD 85 03         [ 4] 2332         CALL     RFROM
      008C80 81               [ 4] 2333         RET
                                   2334 
                                   2335 ;; Numeric output, single precision
                                   2336 
                                   2337 ;       DIGIT   ( u -- c )
                                   2338 ;       Convert digit u to a character.
      008C81 8C 62                 2339         .word      LINK
                           000C03  2340 LINK = . 
      008C83 05                    2341         .byte      5
      008C84 44 49 47 49 54        2342         .ascii     "DIGIT"
      008C89                       2343 DIGIT:
      008C89 CD 84 34         [ 4] 2344         CALL	DOLIT
      008C8C 00 09                 2345         .word	9
      008C8E CD 85 83         [ 4] 2346         CALL	OVER
      008C91 CD 88 32         [ 4] 2347         CALL	LESS
      008C94 CD 84 34         [ 4] 2348         CALL	DOLIT
      008C97 00 07                 2349         .word	7
      008C99 CD 85 A5         [ 4] 2350         CALL	ANDD
      008C9C CD 87 54         [ 4] 2351         CALL	PLUS
      008C9F CD 84 34         [ 4] 2352         CALL	DOLIT
      008CA2 00 30                 2353         .word	48	;'0'
      008CA4 CC 87 54         [ 2] 2354         JP	PLUS
                                   2355 
                                   2356 ;       EXTRACT ( n base -- n c )
                                   2357 ;       Extract least significant digit from n.
      008CA7 8C 83                 2358         .word      LINK
                           000C29  2359 LINK = . 
      008CA9 07                    2360         .byte      7
      008CAA 45 58 54 52 41 43 54  2361         .ascii     "EXTRACT"
      008CB1                       2362 EXTRC:
      008CB1 CD 8A BA         [ 4] 2363         CALL     ZERO
      008CB4 CD 85 69         [ 4] 2364         CALL     SWAPP
      008CB7 CD 88 AA         [ 4] 2365         CALL     UMMOD
      008CBA CD 85 69         [ 4] 2366         CALL     SWAPP
      008CBD CC 8C 89         [ 2] 2367         JP     DIGIT
                                   2368 
                                   2369 ;       <#      ( -- )
                                   2370 ;       Initiate  numeric output process.
      008CC0 8C A9                 2371         .word      LINK
                           000C42  2372 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



      008CC2 02                    2373         .byte      2
      008CC3 3C 23                 2374         .ascii     "<#"
      008CC5                       2375 BDIGS:
      008CC5 CD 8B B9         [ 4] 2376         CALL     PAD
      008CC8 CD 86 86         [ 4] 2377         CALL     HLD
      008CCB CC 84 9B         [ 2] 2378         JP     STORE
                                   2379 
                                   2380 ;       HOLD    ( c -- )
                                   2381 ;       Insert a character into output string.
      008CCE 8C C2                 2382         .word      LINK
                           000C50  2383 LINK = . 
      008CD0 04                    2384         .byte      4
      008CD1 48 4F 4C 44           2385         .ascii     "HOLD"
      008CD5                       2386 HOLD:
      008CD5 CD 86 86         [ 4] 2387         CALL     HLD
      008CD8 CD 84 B2         [ 4] 2388         CALL     AT
      008CDB CD 8A 5B         [ 4] 2389         CALL     ONEM
      008CDE CD 85 59         [ 4] 2390         CALL     DUPP
      008CE1 CD 86 86         [ 4] 2391         CALL     HLD
      008CE4 CD 84 9B         [ 4] 2392         CALL     STORE
      008CE7 CC 84 BF         [ 2] 2393         JP     CSTOR
                                   2394 
                                   2395 ;       #       ( u -- u )
                                   2396 ;       Extract one digit from u and
                                   2397 ;       append digit to output string.
      008CEA 8C D0                 2398         .word      LINK
                           000C6C  2399 LINK = . 
      008CEC 01                    2400         .byte      1
      008CED 23                    2401         .ascii     "#"
      008CEE                       2402 DIG:
      008CEE CD 86 16         [ 4] 2403         CALL     BASE
      008CF1 CD 84 B2         [ 4] 2404         CALL     AT
      008CF4 CD 8C B1         [ 4] 2405         CALL     EXTRC
      008CF7 CC 8C D5         [ 2] 2406         JP     HOLD
                                   2407 
                                   2408 ;       #S      ( u -- 0 )
                                   2409 ;       Convert u until all digits
                                   2410 ;       are added to output string.
      008CFA 8C EC                 2411         .word      LINK
                           000C7C  2412 LINK = . 
      008CFC 02                    2413         .byte      2
      008CFD 23 53                 2414         .ascii     "#S"
      008CFF                       2415 DIGS:
      008CFF CD 8C EE         [ 4] 2416 DIGS1:  CALL     DIG
      008D02 CD 85 59         [ 4] 2417         CALL     DUPP
      008D05 CD 84 67         [ 4] 2418         CALL     QBRAN
      008D08 8D 0C                 2419         .word      DIGS2
      008D0A 20 F3            [ 2] 2420         JRA     DIGS1
      008D0C 81               [ 4] 2421 DIGS2:  RET
                                   2422 
                                   2423 ;       SIGN    ( n -- )
                                   2424 ;       Add a minus sign to
                                   2425 ;       numeric output string.
      008D0D 8C FC                 2426         .word      LINK
                           000C8F  2427 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      008D0F 04                    2428         .byte      4
      008D10 53 49 47 4E           2429         .ascii     "SIGN"
      008D14                       2430 SIGN:
      008D14 CD 85 92         [ 4] 2431         CALL     ZLESS
      008D17 CD 84 67         [ 4] 2432         CALL     QBRAN
      008D1A 8D 24                 2433         .word      SIGN1
      008D1C CD 84 34         [ 4] 2434         CALL     DOLIT
      008D1F 00 2D                 2435         .word      45	;"-"
      008D21 CC 8C D5         [ 2] 2436         JP     HOLD
      008D24 81               [ 4] 2437 SIGN1:  RET
                                   2438 
                                   2439 ;       #>      ( w -- b u )
                                   2440 ;       Prepare output string.
      008D25 8D 0F                 2441         .word      LINK
                           000CA7  2442 LINK = . 
      008D27 02                    2443         .byte      2
      008D28 23 3E                 2444         .ascii     "#>"
      008D2A                       2445 EDIGS:
      008D2A CD 85 4F         [ 4] 2446         CALL     DROP
      008D2D CD 86 86         [ 4] 2447         CALL     HLD
      008D30 CD 84 B2         [ 4] 2448         CALL     AT
      008D33 CD 8B B9         [ 4] 2449         CALL     PAD
      008D36 CD 85 83         [ 4] 2450         CALL     OVER
      008D39 CC 87 CD         [ 2] 2451         JP     SUBB
                                   2452 
                                   2453 ;       str     ( w -- b u )
                                   2454 ;       Convert a signed integer
                                   2455 ;       to a numeric string.
      008D3C 8D 27                 2456         .word      LINK
                           000CBE  2457 LINK = . 
      008D3E 03                    2458         .byte      3
      008D3F 53 54 52              2459         .ascii     "STR"
      008D42                       2460 STR:
      008D42 CD 85 59         [ 4] 2461         CALL     DUPP
      008D45 CD 85 22         [ 4] 2462         CALL     TOR
      008D48 CD 87 E7         [ 4] 2463         CALL     ABSS
      008D4B CD 8C C5         [ 4] 2464         CALL     BDIGS
      008D4E CD 8C FF         [ 4] 2465         CALL     DIGS
      008D51 CD 85 03         [ 4] 2466         CALL     RFROM
      008D54 CD 8D 14         [ 4] 2467         CALL     SIGN
      008D57 CC 8D 2A         [ 2] 2468         JP     EDIGS
                                   2469 
                                   2470 ;       HEX     ( -- )
                                   2471 ;       Use radix 16 as base for
                                   2472 ;       numeric conversions.
      008D5A 8D 3E                 2473         .word      LINK
                           000CDC  2474 LINK = . 
      008D5C 03                    2475         .byte      3
      008D5D 48 45 58              2476         .ascii     "HEX"
      008D60                       2477 HEX:
      008D60 CD 84 34         [ 4] 2478         CALL     DOLIT
      008D63 00 10                 2479         .word      16
      008D65 CD 86 16         [ 4] 2480         CALL     BASE
      008D68 CC 84 9B         [ 2] 2481         JP     STORE
                                   2482 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



                                   2483 ;       DECIMAL ( -- )
                                   2484 ;       Use radix 10 as base
                                   2485 ;       for numeric conversions.
      008D6B 8D 5C                 2486         .word      LINK
                           000CED  2487 LINK = . 
      008D6D 07                    2488         .byte      7
      008D6E 44 45 43 49 4D 41 4C  2489         .ascii     "DECIMAL"
      008D75                       2490 DECIM:
      008D75 CD 84 34         [ 4] 2491         CALL     DOLIT
      008D78 00 0A                 2492         .word      10
      008D7A CD 86 16         [ 4] 2493         CALL     BASE
      008D7D CC 84 9B         [ 2] 2494         JP     STORE
                                   2495 
                                   2496 ;; Numeric input, single precision
                                   2497 
                                   2498 ;       DIGIT?  ( c base -- u t )
                                   2499 ;       Convert a character to its numeric
                                   2500 ;       value. A flag indicates success.
      008D80 8D 6D                 2501         .word      LINK
                           000D02  2502 LINK = . 
      008D82 06                    2503         .byte       6
      008D83 44 49 47 49 54 3F     2504         .ascii     "DIGIT?"
      008D89                       2505 DIGTQ:
      008D89 CD 85 22         [ 4] 2506         CALL     TOR
      008D8C CD 84 34         [ 4] 2507         CALL     DOLIT
      008D8F 00 30                 2508         .word     48	; "0"
      008D91 CD 87 CD         [ 4] 2509         CALL     SUBB
      008D94 CD 84 34         [ 4] 2510         CALL     DOLIT
      008D97 00 09                 2511         .word      9
      008D99 CD 85 83         [ 4] 2512         CALL     OVER
      008D9C CD 88 32         [ 4] 2513         CALL     LESS
      008D9F CD 84 67         [ 4] 2514         CALL     QBRAN
      008DA2 8D BA                 2515         .word      DGTQ1
      008DA4 CD 84 34         [ 4] 2516         CALL     DOLIT
      008DA7 00 07                 2517         .word      7
      008DA9 CD 87 CD         [ 4] 2518         CALL     SUBB
      008DAC CD 85 59         [ 4] 2519         CALL     DUPP
      008DAF CD 84 34         [ 4] 2520         CALL     DOLIT
      008DB2 00 0A                 2521         .word      10
      008DB4 CD 88 32         [ 4] 2522         CALL     LESS
      008DB7 CD 85 B9         [ 4] 2523         CALL     ORR
      008DBA CD 85 59         [ 4] 2524 DGTQ1:  CALL     DUPP
      008DBD CD 85 03         [ 4] 2525         CALL     RFROM
      008DC0 CC 88 14         [ 2] 2526         JP     ULESS
                                   2527 
                                   2528 ;       NUMBER? ( a -- n T | a F )
                                   2529 ;       Convert a number string to
                                   2530 ;       integer. Push a flag on tos.
      008DC3 8D 82                 2531         .word      LINK
                           000D45  2532 LINK = . 
      008DC5 07                    2533         .byte      7
      008DC6 4E 55 4D 42 45 52 3F  2534         .ascii     "NUMBER?"
      008DCD                       2535 NUMBQ:
      008DCD CD 86 16         [ 4] 2536         CALL     BASE
      008DD0 CD 84 B2         [ 4] 2537         CALL     AT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



      008DD3 CD 85 22         [ 4] 2538         CALL     TOR
      008DD6 CD 8A BA         [ 4] 2539         CALL     ZERO
      008DD9 CD 85 83         [ 4] 2540         CALL     OVER
      008DDC CD 8B 91         [ 4] 2541         CALL     COUNT
      008DDF CD 85 83         [ 4] 2542         CALL     OVER
      008DE2 CD 84 D0         [ 4] 2543         CALL     CAT
      008DE5 CD 84 34         [ 4] 2544         CALL     DOLIT
      008DE8 00 24                 2545         .word     36	; "0x"
      008DEA CD 87 F5         [ 4] 2546         CALL     EQUAL
      008DED CD 84 67         [ 4] 2547         CALL     QBRAN
      008DF0 8E 01                 2548         .word      NUMQ1
      008DF2 CD 8D 60         [ 4] 2549         CALL     HEX
      008DF5 CD 85 69         [ 4] 2550         CALL     SWAPP
      008DF8 CD 8A 4E         [ 4] 2551         CALL     ONEP
      008DFB CD 85 69         [ 4] 2552         CALL     SWAPP
      008DFE CD 8A 5B         [ 4] 2553         CALL     ONEM
      008E01 CD 85 83         [ 4] 2554 NUMQ1:  CALL     OVER
      008E04 CD 84 D0         [ 4] 2555         CALL     CAT
      008E07 CD 84 34         [ 4] 2556         CALL     DOLIT
      008E0A 00 2D                 2557         .word     45	; "-"
      008E0C CD 87 F5         [ 4] 2558         CALL     EQUAL
      008E0F CD 85 22         [ 4] 2559         CALL     TOR
      008E12 CD 85 69         [ 4] 2560         CALL     SWAPP
      008E15 CD 85 16         [ 4] 2561         CALL     RAT
      008E18 CD 87 CD         [ 4] 2562         CALL     SUBB
      008E1B CD 85 69         [ 4] 2563         CALL     SWAPP
      008E1E CD 85 16         [ 4] 2564         CALL     RAT
      008E21 CD 87 54         [ 4] 2565         CALL     PLUS
      008E24 CD 87 03         [ 4] 2566         CALL     QDUP
      008E27 CD 84 67         [ 4] 2567         CALL     QBRAN
      008E2A 8E 8B                 2568         .word      NUMQ6
      008E2C CD 8A 5B         [ 4] 2569         CALL     ONEM
      008E2F CD 85 22         [ 4] 2570         CALL     TOR
      008E32 CD 85 59         [ 4] 2571 NUMQ2:  CALL     DUPP
      008E35 CD 85 22         [ 4] 2572         CALL     TOR
      008E38 CD 84 D0         [ 4] 2573         CALL     CAT
      008E3B CD 86 16         [ 4] 2574         CALL     BASE
      008E3E CD 84 B2         [ 4] 2575         CALL     AT
      008E41 CD 8D 89         [ 4] 2576         CALL     DIGTQ
      008E44 CD 84 67         [ 4] 2577         CALL     QBRAN
      008E47 8E 79                 2578         .word      NUMQ4
      008E49 CD 85 69         [ 4] 2579         CALL     SWAPP
      008E4C CD 86 16         [ 4] 2580         CALL     BASE
      008E4F CD 84 B2         [ 4] 2581         CALL     AT
      008E52 CD 89 CD         [ 4] 2582         CALL     STAR
      008E55 CD 87 54         [ 4] 2583         CALL     PLUS
      008E58 CD 85 03         [ 4] 2584         CALL     RFROM
      008E5B CD 8A 4E         [ 4] 2585         CALL     ONEP
      008E5E CD 84 48         [ 4] 2586         CALL     DONXT
      008E61 8E 32                 2587         .word      NUMQ2
      008E63 CD 85 16         [ 4] 2588         CALL     RAT
      008E66 CD 85 69         [ 4] 2589         CALL     SWAPP
      008E69 CD 85 4F         [ 4] 2590         CALL     DROP
      008E6C CD 84 67         [ 4] 2591         CALL     QBRAN
      008E6F 8E 74                 2592         .word      NUMQ3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      008E71 CD 87 7F         [ 4] 2593         CALL     NEGAT
      008E74 CD 85 69         [ 4] 2594 NUMQ3:  CALL     SWAPP
      008E77 20 0F            [ 2] 2595         JRA     NUMQ5
      008E79 CD 85 03         [ 4] 2596 NUMQ4:  CALL     RFROM
      008E7C CD 85 03         [ 4] 2597         CALL     RFROM
      008E7F CD 87 34         [ 4] 2598         CALL     DDROP
      008E82 CD 87 34         [ 4] 2599         CALL     DDROP
      008E85 CD 8A BA         [ 4] 2600         CALL     ZERO
      008E88 CD 85 59         [ 4] 2601 NUMQ5:  CALL     DUPP
      008E8B CD 85 03         [ 4] 2602 NUMQ6:  CALL     RFROM
      008E8E CD 87 34         [ 4] 2603         CALL     DDROP
      008E91 CD 85 03         [ 4] 2604         CALL     RFROM
      008E94 CD 86 16         [ 4] 2605         CALL     BASE
      008E97 CC 84 9B         [ 2] 2606         JP     STORE
                                   2607 
                                   2608 ;; Basic I/O
                                   2609 
                                   2610 ;       KEY     ( -- c )
                                   2611 ;       Wait for and return an
                                   2612 ;       input character.
      008E9A 8D C5                 2613         .word      LINK
                           000E1C  2614 LINK = . 
      008E9C 03                    2615         .byte      3
      008E9D 4B 45 59              2616         .ascii     "KEY"
      008EA0                       2617 KEY:
      008EA0 72 0B 52 30 FB   [ 2] 2618         btjf UART1_SR,#UART_SR_RXNE,. 
      008EA5 C6 52 31         [ 1] 2619         ld a,UART1_DR 
      008EA8 1D 00 02         [ 2] 2620         subw x,#CELLL 
      008EAB E7 01            [ 1] 2621         ld (1,x),a 
      008EAD 7F               [ 1] 2622         clr (x)
      008EAE 81               [ 4] 2623         ret 
                                   2624 
                                   2625 ;       NUF?    ( -- t )
                                   2626 ;       Return false if no input,
                                   2627 ;       else pause and if CR return true.
      008EAF 8E 9C                 2628         .word      LINK
                           000E31  2629 LINK = . 
      008EB1 04                    2630         .byte      4
      008EB2 4E 55 46 3F           2631         .ascii     "NUF?"
      008EB6                       2632 NUFQ:
      008EB6 CD 84 00         [ 4] 2633         CALL     QKEY
      008EB9 CD 85 59         [ 4] 2634         CALL     DUPP
      008EBC CD 84 67         [ 4] 2635         CALL     QBRAN
      008EBF 8E CF                 2636         .word    NUFQ1
      008EC1 CD 87 34         [ 4] 2637         CALL     DDROP
      008EC4 CD 8E A0         [ 4] 2638         CALL     KEY
      008EC7 CD 84 34         [ 4] 2639         CALL     DOLIT
      008ECA 00 0D                 2640         .word      CRR
      008ECC CC 87 F5         [ 2] 2641         JP     EQUAL
      008ECF 81               [ 4] 2642 NUFQ1:  RET
                                   2643 
                                   2644 ;       SPACE   ( -- )
                                   2645 ;       Send  blank character to
                                   2646 ;       output device.
      008ED0 8E B1                 2647         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



                           000E52  2648 LINK = . 
      008ED2 05                    2649         .byte      5
      008ED3 53 50 41 43 45        2650         .ascii     "SPACE"
      008ED8                       2651 SPACE:
      008ED8 CD 8A AD         [ 4] 2652         CALL     BLANK
      008EDB CC 84 1E         [ 2] 2653         JP     EMIT
                                   2654 
                                   2655 ;       SPACES  ( +n -- )
                                   2656 ;       Send n spaces to output device.
      008EDE 8E D2                 2657         .word      LINK
                           000E60  2658 LINK = . 
      008EE0 06                    2659         .byte      6
      008EE1 53 50 41 43 45 53     2660         .ascii     "SPACES"
      008EE7                       2661 SPACS:
      008EE7 CD 8A BA         [ 4] 2662         CALL     ZERO
      008EEA CD 88 52         [ 4] 2663         CALL     MAX
      008EED CD 85 22         [ 4] 2664         CALL     TOR
      008EF0 20 03            [ 2] 2665         JRA      CHAR2
      008EF2 CD 8E D8         [ 4] 2666 CHAR1:  CALL     SPACE
      008EF5 CD 84 48         [ 4] 2667 CHAR2:  CALL     DONXT
      008EF8 8E F2                 2668         .word    CHAR1
      008EFA 81               [ 4] 2669         RET
                                   2670 
                                   2671 ;       TYPE    ( b u -- )
                                   2672 ;       Output u characters from b.
      008EFB 8E E0                 2673         .word      LINK
                           000E7D  2674 LINK = . 
      008EFD 04                    2675         .byte      4
      008EFE 54 59 50 45           2676         .ascii     "TYPE"
      008F02                       2677 TYPES:
      008F02 CD 85 22         [ 4] 2678         CALL     TOR
      008F05 20 0C            [ 2] 2679         JRA     TYPE2
      008F07 CD 85 59         [ 4] 2680 TYPE1:  CALL     DUPP
      008F0A CD 84 D0         [ 4] 2681         CALL     CAT
      008F0D CD 84 1E         [ 4] 2682         CALL     EMIT
      008F10 CD 8A 4E         [ 4] 2683         CALL     ONEP
      008F13 CD 84 48         [ 4] 2684 TYPE2:  CALL     DONXT
      008F16 8F 07                 2685         .word      TYPE1
      008F18 CC 85 4F         [ 2] 2686         JP     DROP
                                   2687 
                                   2688 ;       CR      ( -- )
                                   2689 ;       Output a carriage return
                                   2690 ;       and a line feed.
      008F1B 8E FD                 2691         .word      LINK
                           000E9D  2692 LINK = . 
      008F1D 02                    2693         .byte      2
      008F1E 43 52                 2694         .ascii     "CR"
      008F20                       2695 CR:
      008F20 CD 84 34         [ 4] 2696         CALL     DOLIT
      008F23 00 0D                 2697         .word      CRR
      008F25 CD 84 1E         [ 4] 2698         CALL     EMIT
      008F28 CD 84 34         [ 4] 2699         CALL     DOLIT
      008F2B 00 0A                 2700         .word      LF
      008F2D CC 84 1E         [ 2] 2701         JP     EMIT
                                   2702 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



                                   2703 ;       do$     ( -- a )
                                   2704 ;       Return  address of a compiled
                                   2705 ;       string.
      008F30 8F 1D                 2706         .word      LINK
                           000EB2  2707 LINK = . 
      008F32 43                    2708 	.byte      COMPO+3
      008F33 44 4F 24              2709         .ascii     "DO$"
      008F36                       2710 DOSTR:
      008F36 CD 85 03         [ 4] 2711         CALL     RFROM
      008F39 CD 85 16         [ 4] 2712         CALL     RAT
      008F3C CD 85 03         [ 4] 2713         CALL     RFROM
      008F3F CD 8B 91         [ 4] 2714         CALL     COUNT
      008F42 CD 87 54         [ 4] 2715         CALL     PLUS
      008F45 CD 85 22         [ 4] 2716         CALL     TOR
      008F48 CD 85 69         [ 4] 2717         CALL     SWAPP
      008F4B CD 85 22         [ 4] 2718         CALL     TOR
      008F4E 81               [ 4] 2719         RET
                                   2720 
                                   2721 ;       $"|     ( -- a )
                                   2722 ;       Run time routine compiled by $".
                                   2723 ;       Return address of a compiled string.
      008F4F 8F 32                 2724         .word      LINK
                           000ED1  2725 LINK = . 
      008F51 43                    2726 	.byte      COMPO+3
      008F52 24 22 7C              2727         .byte     '$','"','|'
      008F55                       2728 STRQP:
      008F55 CD 8F 36         [ 4] 2729         CALL     DOSTR
      008F58 81               [ 4] 2730         RET
                                   2731 
                                   2732 ;       ."|     ( -- )
                                   2733 ;       Run time routine of ." .
                                   2734 ;       Output a compiled string.
      008F59 8F 51                 2735         .word      LINK
                           000EDB  2736 LINK = . 
      008F5B 43                    2737 	.byte      COMPO+3
      008F5C 2E 22 7C              2738         .byte     '.','"','|'
      008F5F                       2739 DOTQP:
      008F5F CD 8F 36         [ 4] 2740         CALL     DOSTR
      008F62 CD 8B 91         [ 4] 2741         CALL     COUNT
      008F65 CC 8F 02         [ 2] 2742         JP     TYPES
                                   2743 
                                   2744 ;       .R      ( n +n -- )
                                   2745 ;       Display an integer in a field
                                   2746 ;       of n columns, right justified.
      008F68 8F 5B                 2747         .word      LINK
                           000EEA  2748 LINK = . 
      008F6A 02                    2749         .byte      2
      008F6B 2E 52                 2750         .ascii     ".R"
      008F6D                       2751 DOTR:
      008F6D CD 85 22         [ 4] 2752         CALL     TOR
      008F70 CD 8D 42         [ 4] 2753         CALL     STR
      008F73 CD 85 03         [ 4] 2754         CALL     RFROM
      008F76 CD 85 83         [ 4] 2755         CALL     OVER
      008F79 CD 87 CD         [ 4] 2756         CALL     SUBB
      008F7C CD 8E E7         [ 4] 2757         CALL     SPACS
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



      008F7F CC 8F 02         [ 2] 2758         JP     TYPES
                                   2759 
                                   2760 ;       U.R     ( u +n -- )
                                   2761 ;       Display an unsigned integer
                                   2762 ;       in n column, right justified.
      008F82 8F 6A                 2763         .word      LINK
                           000F04  2764 LINK = . 
      008F84 03                    2765         .byte      3
      008F85 55 2E 52              2766         .ascii     "U.R"
      008F88                       2767 UDOTR:
      008F88 CD 85 22         [ 4] 2768         CALL     TOR
      008F8B CD 8C C5         [ 4] 2769         CALL     BDIGS
      008F8E CD 8C FF         [ 4] 2770         CALL     DIGS
      008F91 CD 8D 2A         [ 4] 2771         CALL     EDIGS
      008F94 CD 85 03         [ 4] 2772         CALL     RFROM
      008F97 CD 85 83         [ 4] 2773         CALL     OVER
      008F9A CD 87 CD         [ 4] 2774         CALL     SUBB
      008F9D CD 8E E7         [ 4] 2775         CALL     SPACS
      008FA0 CC 8F 02         [ 2] 2776         JP     TYPES
                                   2777 
                                   2778 ;       U.      ( u -- )
                                   2779 ;       Display an unsigned integer
                                   2780 ;       in free format.
      008FA3 8F 84                 2781         .word      LINK
                           000F25  2782 LINK = . 
      008FA5 02                    2783         .byte      2
      008FA6 55 2E                 2784         .ascii     "U."
      008FA8                       2785 UDOT:
      008FA8 CD 8C C5         [ 4] 2786         CALL     BDIGS
      008FAB CD 8C FF         [ 4] 2787         CALL     DIGS
      008FAE CD 8D 2A         [ 4] 2788         CALL     EDIGS
      008FB1 CD 8E D8         [ 4] 2789         CALL     SPACE
      008FB4 CC 8F 02         [ 2] 2790         JP     TYPES
                                   2791 
                                   2792 ;       .       ( w -- )
                                   2793 ;       Display an integer in free
                                   2794 ;       format, preceeded by a space.
      008FB7 8F A5                 2795         .word      LINK
                           000F39  2796 LINK = . 
      008FB9 01                    2797         .byte      1
      008FBA 2E                    2798         .ascii     "."
      008FBB                       2799 DOT:
      008FBB CD 86 16         [ 4] 2800         CALL     BASE
      008FBE CD 84 B2         [ 4] 2801         CALL     AT
      008FC1 CD 84 34         [ 4] 2802         CALL     DOLIT
      008FC4 00 0A                 2803         .word      10
      008FC6 CD 85 CE         [ 4] 2804         CALL     XORR    ;?decimal
      008FC9 CD 84 67         [ 4] 2805         CALL     QBRAN
      008FCC 8F D1                 2806         .word      DOT1
      008FCE CC 8F A8         [ 2] 2807         JP     UDOT
      008FD1 CD 8D 42         [ 4] 2808 DOT1:   CALL     STR
      008FD4 CD 8E D8         [ 4] 2809         CALL     SPACE
      008FD7 CC 8F 02         [ 2] 2810         JP     TYPES
                                   2811 
                                   2812 ;       ?       ( a -- )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



                                   2813 ;       Display contents in memory cell.
      008FDA 8F B9                 2814         .word      LINK
                                   2815         
                           000F5C  2816 LINK = . 
      008FDC 01                    2817         .byte      1
      008FDD 3F                    2818         .ascii     "?"
      008FDE                       2819 QUEST:
      008FDE CD 84 B2         [ 4] 2820         CALL     AT
      008FE1 CC 8F BB         [ 2] 2821         JP     DOT
                                   2822 
                                   2823 ;; Parsing
                                   2824 
                                   2825 ;       parse   ( b u c -- b u delta ; <string> )
                                   2826 ;       Scan string delimited by c.
                                   2827 ;       Return found string and its offset.
      008FE4 8F DC                 2828         .word      LINK
                           000F66  2829 LINK = . 
      008FE6 05                    2830         .byte      5
      008FE7 70 61 72 73 65        2831         .ascii     "parse"
      008FEC                       2832 PARS:
      008FEC CD 86 25         [ 4] 2833         CALL     TEMP
      008FEF CD 84 9B         [ 4] 2834         CALL     STORE
      008FF2 CD 85 83         [ 4] 2835         CALL     OVER
      008FF5 CD 85 22         [ 4] 2836         CALL     TOR
      008FF8 CD 85 59         [ 4] 2837         CALL     DUPP
      008FFB CD 84 67         [ 4] 2838         CALL     QBRAN
      008FFE 90 A4                 2839         .word    PARS8
      009000 CD 8A 5B         [ 4] 2840         CALL     ONEM
      009003 CD 86 25         [ 4] 2841         CALL     TEMP
      009006 CD 84 B2         [ 4] 2842         CALL     AT
      009009 CD 8A AD         [ 4] 2843         CALL     BLANK
      00900C CD 87 F5         [ 4] 2844         CALL     EQUAL
      00900F CD 84 67         [ 4] 2845         CALL     QBRAN
      009012 90 45                 2846         .word      PARS3
      009014 CD 85 22         [ 4] 2847         CALL     TOR
      009017 CD 8A AD         [ 4] 2848 PARS1:  CALL     BLANK
      00901A CD 85 83         [ 4] 2849         CALL     OVER
      00901D CD 84 D0         [ 4] 2850         CALL     CAT     ;skip leading blanks ONLY
      009020 CD 87 CD         [ 4] 2851         CALL     SUBB
      009023 CD 85 92         [ 4] 2852         CALL     ZLESS
      009026 CD 87 6E         [ 4] 2853         CALL     INVER
      009029 CD 84 67         [ 4] 2854         CALL     QBRAN
      00902C 90 42                 2855         .word      PARS2
      00902E CD 8A 4E         [ 4] 2856         CALL     ONEP
      009031 CD 84 48         [ 4] 2857         CALL     DONXT
      009034 90 17                 2858         .word      PARS1
      009036 CD 85 03         [ 4] 2859         CALL     RFROM
      009039 CD 85 4F         [ 4] 2860         CALL     DROP
      00903C CD 8A BA         [ 4] 2861         CALL     ZERO
      00903F CC 85 59         [ 2] 2862         JP     DUPP
      009042 CD 85 03         [ 4] 2863 PARS2:  CALL     RFROM
      009045 CD 85 83         [ 4] 2864 PARS3:  CALL     OVER
      009048 CD 85 69         [ 4] 2865         CALL     SWAPP
      00904B CD 85 22         [ 4] 2866         CALL     TOR
      00904E CD 86 25         [ 4] 2867 PARS4:  CALL     TEMP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



      009051 CD 84 B2         [ 4] 2868         CALL     AT
      009054 CD 85 83         [ 4] 2869         CALL     OVER
      009057 CD 84 D0         [ 4] 2870         CALL     CAT
      00905A CD 87 CD         [ 4] 2871         CALL     SUBB    ;scan for delimiter
      00905D CD 86 25         [ 4] 2872         CALL     TEMP
      009060 CD 84 B2         [ 4] 2873         CALL     AT
      009063 CD 8A AD         [ 4] 2874         CALL     BLANK
      009066 CD 87 F5         [ 4] 2875         CALL     EQUAL
      009069 CD 84 67         [ 4] 2876         CALL     QBRAN
      00906C 90 71                 2877         .word      PARS5
      00906E CD 85 92         [ 4] 2878         CALL     ZLESS
      009071 CD 84 67         [ 4] 2879 PARS5:  CALL     QBRAN
      009074 90 86                 2880         .word      PARS6
      009076 CD 8A 4E         [ 4] 2881         CALL     ONEP
      009079 CD 84 48         [ 4] 2882         CALL     DONXT
      00907C 90 4E                 2883         .word      PARS4
      00907E CD 85 59         [ 4] 2884         CALL     DUPP
      009081 CD 85 22         [ 4] 2885         CALL     TOR
      009084 20 0F            [ 2] 2886         JRA     PARS7
      009086 CD 85 03         [ 4] 2887 PARS6:  CALL     RFROM
      009089 CD 85 4F         [ 4] 2888         CALL     DROP
      00908C CD 85 59         [ 4] 2889         CALL     DUPP
      00908F CD 8A 4E         [ 4] 2890         CALL     ONEP
      009092 CD 85 22         [ 4] 2891         CALL     TOR
      009095 CD 85 83         [ 4] 2892 PARS7:  CALL     OVER
      009098 CD 87 CD         [ 4] 2893         CALL     SUBB
      00909B CD 85 03         [ 4] 2894         CALL     RFROM
      00909E CD 85 03         [ 4] 2895         CALL     RFROM
      0090A1 CC 87 CD         [ 2] 2896         JP     SUBB
      0090A4 CD 85 83         [ 4] 2897 PARS8:  CALL     OVER
      0090A7 CD 85 03         [ 4] 2898         CALL     RFROM
      0090AA CC 87 CD         [ 2] 2899         JP     SUBB
                                   2900 
                                   2901 ;       PARSE   ( c -- b u ; <string> )
                                   2902 ;       Scan input stream and return
                                   2903 ;       counted string delimited by c.
      0090AD 8F E6                 2904         .word      LINK
                           00102F  2905 LINK = . 
      0090AF 05                    2906         .byte      5
      0090B0 50 41 52 53 45        2907         .ascii     "PARSE"
      0090B5                       2908 PARSE:
      0090B5 CD 85 22         [ 4] 2909         CALL     TOR
      0090B8 CD 8B CA         [ 4] 2910         CALL     TIB
      0090BB CD 86 34         [ 4] 2911         CALL     INN
      0090BE CD 84 B2         [ 4] 2912         CALL     AT
      0090C1 CD 87 54         [ 4] 2913         CALL     PLUS    ;current input buffer pointer
      0090C4 CD 86 44         [ 4] 2914         CALL     NTIB
      0090C7 CD 84 B2         [ 4] 2915         CALL     AT
      0090CA CD 86 34         [ 4] 2916         CALL     INN
      0090CD CD 84 B2         [ 4] 2917         CALL     AT
      0090D0 CD 87 CD         [ 4] 2918         CALL     SUBB    ;remaining count
      0090D3 CD 85 03         [ 4] 2919         CALL     RFROM
      0090D6 CD 8F EC         [ 4] 2920         CALL     PARS
      0090D9 CD 86 34         [ 4] 2921         CALL     INN
      0090DC CC 8B 2A         [ 2] 2922         JP     PSTOR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



                                   2923 
                                   2924 ;       .(      ( -- )
                                   2925 ;       Output following string up to next ) .
      0090DF 90 AF                 2926         .word      LINK
                           001061  2927 LINK = . 
      0090E1 82                    2928 	.byte      IMEDD+2
      0090E2 2E 28                 2929         .ascii     ".("
      0090E4                       2930 DOTPR:
      0090E4 CD 84 34         [ 4] 2931         CALL     DOLIT
      0090E7 00 29                 2932         .word     41	; ")"
      0090E9 CD 90 B5         [ 4] 2933         CALL     PARSE
      0090EC CC 8F 02         [ 2] 2934         JP     TYPES
                                   2935 
                                   2936 ;       (       ( -- )
                                   2937 ;       Ignore following string up to next ).
                                   2938 ;       A comment.
      0090EF 90 E1                 2939         .word      LINK
                           001071  2940 LINK = . 
      0090F1 81                    2941 	.byte      IMEDD+1
      0090F2 28                    2942         .ascii     "("
      0090F3                       2943 PAREN:
      0090F3 CD 84 34         [ 4] 2944         CALL     DOLIT
      0090F6 00 29                 2945         .word     41	; ")"
      0090F8 CD 90 B5         [ 4] 2946         CALL     PARSE
      0090FB CC 87 34         [ 2] 2947         JP     DDROP
                                   2948 
                                   2949 ;       \       ( -- )
                                   2950 ;       Ignore following text till
                                   2951 ;       end of line.
      0090FE 90 F1                 2952         .word      LINK
                           001080  2953 LINK = . 
      009100 81                    2954 	.byte      IMEDD+1
      009101 5C                    2955         .ascii     "\"
      009102                       2956 BKSLA:
      009102 90 AE 00 0C      [ 2] 2957         ldw y,#UCTIB ; #TIB  
      009106 90 FE            [ 2] 2958         ldw y,(y)
      009108 90 89            [ 2] 2959         pushw y ; count in TIB 
      00910A 90 AE 00 0A      [ 2] 2960         ldw y,#UINN ; >IN 
      00910E 90 BF 24         [ 2] 2961         ldw YTEMP,y
      009111 90 85            [ 2] 2962         popw y 
      009113 91 CF 24         [ 5] 2963         ldw [YTEMP],y
      009116 81               [ 4] 2964         ret 
                                   2965 
                                   2966 ;       WORD    ( c -- a ; <string> )
                                   2967 ;       Parse a word from input stream
                                   2968 ;       and copy it to code dictionary.
      009117 91 00                 2969         .word      LINK
                           001099  2970 LINK = . 
      009119 04                    2971         .byte      4
      00911A 57 4F 52 44           2972         .ascii     "WORD"
      00911E                       2973 WORDD:
      00911E CD 90 B5         [ 4] 2974         CALL     PARSE
      009121 CD 8B A8         [ 4] 2975         CALL     HERE
      009124 CD 8A 23         [ 4] 2976         CALL     CELLP
      009127 CC 8C 68         [ 2] 2977         JP     PACKS
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



                                   2978 
                                   2979 ;       TOKEN   ( -- a ; <string> )
                                   2980 ;       Parse a word from input stream
                                   2981 ;       and copy it to name dictionary.
      00912A 91 19                 2982         .word      LINK
                           0010AC  2983 LINK = . 
      00912C 05                    2984         .byte      5
      00912D 54 4F 4B 45 4E        2985         .ascii     "TOKEN"
      009132                       2986 TOKEN:
      009132 CD 8A AD         [ 4] 2987         CALL     BLANK
      009135 CC 91 1E         [ 2] 2988         JP     WORDD
                                   2989 
                                   2990 ;; Dictionary search
                                   2991 
                                   2992 ;       NAME>   ( na -- ca )
                                   2993 ;       Return a code address given
                                   2994 ;       a name address.
      009138 91 2C                 2995         .word      LINK
                           0010BA  2996 LINK = . 
      00913A 05                    2997         .byte      5
      00913B 4E 41 4D 45 3E        2998         .ascii     "NAME>"
      009140                       2999 NAMET:
      009140 CD 8B 91         [ 4] 3000         CALL     COUNT
      009143 CD 84 34         [ 4] 3001         CALL     DOLIT
      009146 00 1F                 3002         .word      31
      009148 CD 85 A5         [ 4] 3003         CALL     ANDD
      00914B CC 87 54         [ 2] 3004         JP     PLUS
                                   3005 
                                   3006 ;       SAME?   ( a a u -- a a f \ -0+ )
                                   3007 ;       Compare u cells in two
                                   3008 ;       strings. Return 0 if identical.
      00914E 91 3A                 3009         .word      LINK
                           0010D0  3010 LINK = . 
      009150 05                    3011         .byte       5
      009151 53 41 4D 45 3F        3012         .ascii     "SAME?"
      009156                       3013 SAMEQ:
      009156 CD 8A 5B         [ 4] 3014         CALL     ONEM
      009159 CD 85 22         [ 4] 3015         CALL     TOR
      00915C 20 29            [ 2] 3016         JRA     SAME2
      00915E CD 85 83         [ 4] 3017 SAME1:  CALL     OVER
      009161 CD 85 16         [ 4] 3018         CALL     RAT
      009164 CD 87 54         [ 4] 3019         CALL     PLUS
      009167 CD 84 D0         [ 4] 3020         CALL     CAT
      00916A CD 85 83         [ 4] 3021         CALL     OVER
      00916D CD 85 16         [ 4] 3022         CALL     RAT
      009170 CD 87 54         [ 4] 3023         CALL     PLUS
      009173 CD 84 D0         [ 4] 3024         CALL     CAT
      009176 CD 87 CD         [ 4] 3025         CALL     SUBB
      009179 CD 87 03         [ 4] 3026         CALL     QDUP
      00917C CD 84 67         [ 4] 3027         CALL     QBRAN
      00917F 91 87                 3028         .word      SAME2
      009181 CD 85 03         [ 4] 3029         CALL     RFROM
      009184 CC 85 4F         [ 2] 3030         JP     DROP
      009187 CD 84 48         [ 4] 3031 SAME2:  CALL     DONXT
      00918A 91 5E                 3032         .word      SAME1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      00918C CC 8A BA         [ 2] 3033         JP     ZERO
                                   3034 
                                   3035 ;       find    ( a va -- ca na | a F )
                                   3036 ;       Search vocabulary for string.
                                   3037 ;       Return ca and na if succeeded.
      00918F 91 50                 3038         .word      LINK
                           001111  3039 LINK = . 
      009191 04                    3040         .byte      4
      009192 46 49 4E 44           3041         .ascii     "FIND"
      009196                       3042 FIND:
      009196 CD 85 69         [ 4] 3043         CALL     SWAPP
      009199 CD 85 59         [ 4] 3044         CALL     DUPP
      00919C CD 84 D0         [ 4] 3045         CALL     CAT
      00919F CD 86 25         [ 4] 3046         CALL     TEMP
      0091A2 CD 84 9B         [ 4] 3047         CALL     STORE
      0091A5 CD 85 59         [ 4] 3048         CALL     DUPP
      0091A8 CD 84 B2         [ 4] 3049         CALL     AT
      0091AB CD 85 22         [ 4] 3050         CALL     TOR
      0091AE CD 8A 23         [ 4] 3051         CALL     CELLP
      0091B1 CD 85 69         [ 4] 3052         CALL     SWAPP
      0091B4 CD 84 B2         [ 4] 3053 FIND1:  CALL     AT
      0091B7 CD 85 59         [ 4] 3054         CALL     DUPP
      0091BA CD 84 67         [ 4] 3055         CALL     QBRAN
      0091BD 91 F3                 3056         .word      FIND6
      0091BF CD 85 59         [ 4] 3057         CALL     DUPP
      0091C2 CD 84 B2         [ 4] 3058         CALL     AT
      0091C5 CD 84 34         [ 4] 3059         CALL     DOLIT
      0091C8 1F 7F                 3060         .word      MASKK
      0091CA CD 85 A5         [ 4] 3061         CALL     ANDD
      0091CD CD 85 16         [ 4] 3062         CALL     RAT
      0091D0 CD 85 CE         [ 4] 3063         CALL     XORR
      0091D3 CD 84 67         [ 4] 3064         CALL     QBRAN
      0091D6 91 E2                 3065         .word      FIND2
      0091D8 CD 8A 23         [ 4] 3066         CALL     CELLP
      0091DB CD 84 34         [ 4] 3067         CALL     DOLIT
      0091DE FF FF                 3068         .word     0xFFFF
      0091E0 20 0C            [ 2] 3069         JRA     FIND3
      0091E2 CD 8A 23         [ 4] 3070 FIND2:  CALL     CELLP
      0091E5 CD 86 25         [ 4] 3071         CALL     TEMP
      0091E8 CD 84 B2         [ 4] 3072         CALL     AT
      0091EB CD 91 56         [ 4] 3073         CALL     SAMEQ
      0091EE CD 84 7E         [ 4] 3074 FIND3:  CALL     BRAN
      0091F1 92 02                 3075         .word      FIND4
      0091F3 CD 85 03         [ 4] 3076 FIND6:  CALL     RFROM
      0091F6 CD 85 4F         [ 4] 3077         CALL     DROP
      0091F9 CD 85 69         [ 4] 3078         CALL     SWAPP
      0091FC CD 8A 32         [ 4] 3079         CALL     CELLM
      0091FF CC 85 69         [ 2] 3080         JP     SWAPP
      009202 CD 84 67         [ 4] 3081 FIND4:  CALL     QBRAN
      009205 92 0F                 3082         .word      FIND5
      009207 CD 8A 32         [ 4] 3083         CALL     CELLM
      00920A CD 8A 32         [ 4] 3084         CALL     CELLM
      00920D 20 A5            [ 2] 3085         JRA     FIND1
      00920F CD 85 03         [ 4] 3086 FIND5:  CALL     RFROM
      009212 CD 85 4F         [ 4] 3087         CALL     DROP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



      009215 CD 85 69         [ 4] 3088         CALL     SWAPP
      009218 CD 85 4F         [ 4] 3089         CALL     DROP
      00921B CD 8A 32         [ 4] 3090         CALL     CELLM
      00921E CD 85 59         [ 4] 3091         CALL     DUPP
      009221 CD 91 40         [ 4] 3092         CALL     NAMET
      009224 CC 85 69         [ 2] 3093         JP     SWAPP
                                   3094 
                                   3095 ;       NAME?   ( a -- ca na | a F )
                                   3096 ;       Search vocabularies for a string.
      009227 91 91                 3097         .word      LINK
                           0011A9  3098 LINK = . 
      009229 05                    3099         .byte      5
      00922A 4E 41 4D 45 3F        3100         .ascii     "NAME?"
      00922F                       3101 NAMEQ:
      00922F CD 86 99         [ 4] 3102         CALL   CNTXT
      009232 CC 91 96         [ 2] 3103         JP     FIND
                                   3104 
                                   3105 ;; Terminal response
                                   3106 
                                   3107 ;       ^H      ( bot eot cur -- bot eot cur )
                                   3108 ;       Backup cursor by one character.
      009235 92 29                 3109         .word      LINK
                           0011B7  3110 LINK = . 
      009237 02                    3111         .byte      2
      009238 5E 48                 3112         .ascii     "^H"
      00923A                       3113 BKSP:
      00923A CD 85 22         [ 4] 3114         CALL     TOR
      00923D CD 85 83         [ 4] 3115         CALL     OVER
      009240 CD 85 03         [ 4] 3116         CALL     RFROM
      009243 CD 85 69         [ 4] 3117         CALL     SWAPP
      009246 CD 85 83         [ 4] 3118         CALL     OVER
      009249 CD 85 CE         [ 4] 3119         CALL     XORR
      00924C CD 84 67         [ 4] 3120         CALL     QBRAN
      00924F 92 6A                 3121         .word      BACK1
      009251 CD 84 34         [ 4] 3122         CALL     DOLIT
      009254 00 08                 3123         .word      BKSPP
      009256 CD 84 1E         [ 4] 3124         CALL     EMIT
      009259 CD 8A 5B         [ 4] 3125         CALL     ONEM
      00925C CD 8A AD         [ 4] 3126         CALL     BLANK
      00925F CD 84 1E         [ 4] 3127         CALL     EMIT
      009262 CD 84 34         [ 4] 3128         CALL     DOLIT
      009265 00 08                 3129         .word      BKSPP
      009267 CC 84 1E         [ 2] 3130         JP     EMIT
      00926A 81               [ 4] 3131 BACK1:  RET
                                   3132 
                                   3133 ;       TAP    ( bot eot cur c -- bot eot cur )
                                   3134 ;       Accept and echo key stroke
                                   3135 ;       and bump cursor.
      00926B 92 37                 3136         .word      LINK
                           0011ED  3137 LINK = . 
      00926D 03                    3138         .byte      3
      00926E 54 41 50              3139         .ascii     "TAP"
      009271                       3140 TAP:
      009271 CD 85 59         [ 4] 3141         CALL     DUPP
      009274 CD 84 1E         [ 4] 3142         CALL     EMIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      009277 CD 85 83         [ 4] 3143         CALL     OVER
      00927A CD 84 BF         [ 4] 3144         CALL     CSTOR
      00927D CC 8A 4E         [ 2] 3145         JP     ONEP
                                   3146 
                                   3147 ;       kTAP    ( bot eot cur c -- bot eot cur )
                                   3148 ;       Process a key stroke,
                                   3149 ;       CR or backspace.
      009280 92 6D                 3150         .word      LINK
                           001202  3151 LINK = . 
      009282 04                    3152         .byte      4
      009283 4B 54 41 50           3153         .ascii     "KTAP"
      009287                       3154 KTAP:
      009287 CD 85 59         [ 4] 3155         CALL     DUPP
      00928A CD 84 34         [ 4] 3156         CALL     DOLIT
      00928D 00 0D                 3157         .word      CRR
      00928F CD 85 CE         [ 4] 3158         CALL     XORR
      009292 CD 84 67         [ 4] 3159         CALL     QBRAN
      009295 92 AD                 3160         .word      KTAP2
      009297 CD 84 34         [ 4] 3161         CALL     DOLIT
      00929A 00 08                 3162         .word      BKSPP
      00929C CD 85 CE         [ 4] 3163         CALL     XORR
      00929F CD 84 67         [ 4] 3164         CALL     QBRAN
      0092A2 92 AA                 3165         .word      KTAP1
      0092A4 CD 8A AD         [ 4] 3166         CALL     BLANK
      0092A7 CC 92 71         [ 2] 3167         JP     TAP
      0092AA CC 92 3A         [ 2] 3168 KTAP1:  JP     BKSP
      0092AD CD 85 4F         [ 4] 3169 KTAP2:  CALL     DROP
      0092B0 CD 85 69         [ 4] 3170         CALL     SWAPP
      0092B3 CD 85 4F         [ 4] 3171         CALL     DROP
      0092B6 CC 85 59         [ 2] 3172         JP     DUPP
                                   3173 
                                   3174 ;       accept  ( b u -- b u )
                                   3175 ;       Accept characters to input
                                   3176 ;       buffer. Return with actual count.
      0092B9 92 82                 3177         .word      LINK
                           00123B  3178 LINK = . 
      0092BB 06                    3179         .byte      6
      0092BC 41 43 43 45 50 54     3180         .ascii     "ACCEPT"
      0092C2                       3181 ACCEP:
      0092C2 CD 85 83         [ 4] 3182         CALL     OVER
      0092C5 CD 87 54         [ 4] 3183         CALL     PLUS
      0092C8 CD 85 83         [ 4] 3184         CALL     OVER
      0092CB CD 87 3F         [ 4] 3185 ACCP1:  CALL     DDUP
      0092CE CD 85 CE         [ 4] 3186         CALL     XORR
      0092D1 CD 84 67         [ 4] 3187         CALL     QBRAN
      0092D4 92 F6                 3188         .word      ACCP4
      0092D6 CD 8E A0         [ 4] 3189         CALL     KEY
      0092D9 CD 85 59         [ 4] 3190         CALL     DUPP
      0092DC CD 8A AD         [ 4] 3191         CALL     BLANK
      0092DF CD 84 34         [ 4] 3192         CALL     DOLIT
      0092E2 00 7F                 3193         .word      127
      0092E4 CD 88 8F         [ 4] 3194         CALL     WITHI
      0092E7 CD 84 67         [ 4] 3195         CALL     QBRAN
      0092EA 92 F1                 3196         .word      ACCP2
      0092EC CD 92 71         [ 4] 3197         CALL     TAP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



      0092EF 20 03            [ 2] 3198         JRA     ACCP3
      0092F1 CD 92 87         [ 4] 3199 ACCP2:  CALL     KTAP
      0092F4 20 D5            [ 2] 3200 ACCP3:  JRA     ACCP1
      0092F6 CD 85 4F         [ 4] 3201 ACCP4:  CALL     DROP
      0092F9 CD 85 83         [ 4] 3202         CALL     OVER
      0092FC CC 87 CD         [ 2] 3203         JP     SUBB
                                   3204 
                                   3205 ;       QUERY   ( -- )
                                   3206 ;       Accept input stream to
                                   3207 ;       terminal input buffer.
      0092FF 92 BB                 3208         .word      LINK
                                   3209         
                           001281  3210 LINK = . 
      009301 05                    3211         .byte      5
      009302 51 55 45 52 59        3212         .ascii     "QUERY"
      009307                       3213 QUERY:
      009307 CD 8B CA         [ 4] 3214         CALL     TIB
      00930A CD 84 34         [ 4] 3215         CALL     DOLIT
      00930D 00 50                 3216         .word      80
      00930F CD 92 C2         [ 4] 3217         CALL     ACCEP
      009312 CD 86 44         [ 4] 3218         CALL     NTIB
      009315 CD 84 9B         [ 4] 3219         CALL     STORE
      009318 CD 85 4F         [ 4] 3220         CALL     DROP
      00931B CD 8A BA         [ 4] 3221         CALL     ZERO
      00931E CD 86 34         [ 4] 3222         CALL     INN
      009321 CC 84 9B         [ 2] 3223         JP     STORE
                                   3224 
                                   3225 ;       ABORT   ( -- )
                                   3226 ;       Reset data stack and
                                   3227 ;       jump to QUIT.
      009324 93 01                 3228         .word      LINK
                           0012A6  3229 LINK = . 
      009326 05                    3230         .byte      5
      009327 41 42 4F 52 54        3231         .ascii     "ABORT"
      00932C                       3232 ABORT:
      00932C CD 94 23         [ 4] 3233         CALL     PRESE
      00932F CC 94 40         [ 2] 3234         JP     QUIT
                                   3235 
                                   3236 ;       abort"  ( f -- )
                                   3237 ;       Run time routine of ABORT".
                                   3238 ;       Abort with a message.
      009332 93 26                 3239         .word      LINK
                           0012B4  3240 LINK = . 
      009334 46                    3241 	.byte      COMPO+6
      009335 41 42 4F 52 54        3242         .ascii     "ABORT"
      00933A 22                    3243         .byte      '"'
      00933B                       3244 ABORQ:
      00933B CD 84 67         [ 4] 3245         CALL     QBRAN
      00933E 93 5A                 3246         .word      ABOR2   ;text flag
      009340 CD 8F 36         [ 4] 3247         CALL     DOSTR
      009343 CD 8E D8         [ 4] 3248 ABOR1:  CALL     SPACE
      009346 CD 8B 91         [ 4] 3249         CALL     COUNT
      009349 CD 8F 02         [ 4] 3250         CALL     TYPES
      00934C CD 84 34         [ 4] 3251         CALL     DOLIT
      00934F 00 3F                 3252         .word     63 ; "?"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      009351 CD 84 1E         [ 4] 3253         CALL     EMIT
      009354 CD 8F 20         [ 4] 3254         CALL     CR
      009357 CC 93 2C         [ 2] 3255         JP     ABORT   ;pass error string
      00935A CD 8F 36         [ 4] 3256 ABOR2:  CALL     DOSTR
      00935D CC 85 4F         [ 2] 3257         JP     DROP
                                   3258 
                                   3259 ;; The text interpreter
                                   3260 
                                   3261 ;       $INTERPRET      ( a -- )
                                   3262 ;       Interpret a word. If failed,
                                   3263 ;       try to convert it to an integer.
      009360 93 34                 3264         .word      LINK
                           0012E2  3265 LINK = . 
      009362 0A                    3266         .byte      10
      009363 24 49 4E 54 45 52 50  3267         .ascii     "$INTERPRET"
             52 45 54
      00936D                       3268 INTER:
      00936D CD 92 2F         [ 4] 3269         CALL     NAMEQ
      009370 CD 87 03         [ 4] 3270         CALL     QDUP    ;?defined
      009373 CD 84 67         [ 4] 3271         CALL     QBRAN
      009376 93 97                 3272         .word      INTE1
      009378 CD 84 B2         [ 4] 3273         CALL     AT
      00937B CD 84 34         [ 4] 3274         CALL     DOLIT
      00937E 40 00                 3275 	.word       0x4000	; COMPO*256
      009380 CD 85 A5         [ 4] 3276         CALL     ANDD    ;?compile only lexicon bits
      009383 CD 93 3B         [ 4] 3277         CALL     ABORQ
      009386 0D                    3278         .byte      13
      009387 20 63 6F 6D 70 69 6C  3279         .ascii     " compile only"
             65 20 6F 6E 6C 79
      009394 CC 84 8E         [ 2] 3280         JP     EXECU
      009397 CD 8D CD         [ 4] 3281 INTE1:  CALL     NUMBQ   ;convert a number
      00939A CD 84 67         [ 4] 3282         CALL     QBRAN
      00939D 93 43                 3283         .word    ABOR1
      00939F 81               [ 4] 3284         RET
                                   3285 
                                   3286 ;       [       ( -- )
                                   3287 ;       Start  text interpreter.
      0093A0 93 62                 3288         .word      LINK
                           001322  3289 LINK = . 
      0093A2 81                    3290 	.byte      IMEDD+1
      0093A3 5B                    3291         .ascii     "["
      0093A4                       3292 LBRAC:
      0093A4 CD 84 34         [ 4] 3293         CALL   DOLIT
      0093A7 93 6D                 3294         .word  INTER
      0093A9 CD 86 77         [ 4] 3295         CALL   TEVAL
      0093AC CC 84 9B         [ 2] 3296         JP     STORE
                                   3297 
                                   3298 ;       .OK     ( -- )
                                   3299 ;       Display 'ok' while interpreting.
      0093AF 93 A2                 3300         .word      LINK
                           001331  3301 LINK = . 
      0093B1 03                    3302         .byte      3
      0093B2 2E 4F 4B              3303         .ascii     ".OK"
      0093B5                       3304 DOTOK:
      0093B5 CD 84 34         [ 4] 3305         CALL     DOLIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      0093B8 93 6D                 3306         .word      INTER
      0093BA CD 86 77         [ 4] 3307         CALL     TEVAL
      0093BD CD 84 B2         [ 4] 3308         CALL     AT
      0093C0 CD 87 F5         [ 4] 3309         CALL     EQUAL
      0093C3 CD 84 67         [ 4] 3310         CALL     QBRAN
      0093C6 93 CF                 3311         .word      DOTO1
      0093C8 CD 8F 5F         [ 4] 3312         CALL     DOTQP
      0093CB 03                    3313         .byte      3
      0093CC 20 6F 6B              3314         .ascii     " ok"
      0093CF CC 8F 20         [ 2] 3315 DOTO1:  JP     CR
                                   3316 
                                   3317 ;       ?STACK  ( -- )
                                   3318 ;       Abort if stack underflows.
      0093D2 93 B1                 3319         .word      LINK
                           001354  3320 LINK = . 
      0093D4 06                    3321         .byte      6
      0093D5 3F 53 54 41 43 4B     3322         .ascii     "?STACK"
      0093DB                       3323 QSTAC: 
      0093DB CD 8A FC         [ 4] 3324         CALL     DEPTH
      0093DE CD 85 92         [ 4] 3325         CALL     ZLESS   ;check only for underflow
      0093E1 CD 93 3B         [ 4] 3326         CALL     ABORQ
      0093E4 0B                    3327         .byte      11
      0093E5 20 75 6E 64 65 72 66  3328         .ascii     " underflow "
             6C 6F 77 20
      0093F0 81               [ 4] 3329         RET
                                   3330 
                                   3331 ;       EVAL    ( -- )
                                   3332 ;       Interpret  input stream.
      0093F1 93 D4                 3333         .word      LINK
                           001373  3334 LINK = . 
      0093F3 04                    3335         .byte      4
      0093F4 45 56 41 4C           3336         .ascii     "EVAL"
      0093F8                       3337 EVAL:
      0093F8 CD 91 32         [ 4] 3338 EVAL1:  CALL     TOKEN
      0093FB CD 85 59         [ 4] 3339         CALL     DUPP
      0093FE CD 84 D0         [ 4] 3340         CALL     CAT     ;?input stream empty
      009401 CD 84 67         [ 4] 3341         CALL     QBRAN
      009404 94 14                 3342         .word    EVAL2
      009406 CD 86 77         [ 4] 3343         CALL     TEVAL
      009409 CD 8B DE         [ 4] 3344         CALL     ATEXE
      00940C CD 93 DB         [ 4] 3345         CALL     QSTAC   ;evaluate input, check stack
      00940F CD 84 7E         [ 4] 3346         CALL     BRAN
      009412 93 F8                 3347         .word    EVAL1
      009414 CD 85 4F         [ 4] 3348 EVAL2:  CALL     DROP
      009417 CC 93 B5         [ 2] 3349         JP       DOTOK
                                   3350 
                                   3351 ;       PRESET  ( -- )
                                   3352 ;       Reset data stack pointer and
                                   3353 ;       terminal input buffer.
      00941A 93 F3                 3354         .word      LINK
                           00139C  3355 LINK = . 
      00941C 06                    3356         .byte      6
      00941D 50 52 45 53 45 54     3357         .ascii     "PRESET"
      009423                       3358 PRESE:
      009423 CD 84 34         [ 4] 3359         CALL     DOLIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      009426 16 80                 3360         .word      SPP
      009428 CD 85 46         [ 4] 3361         CALL     SPSTO
      00942B CD 84 34         [ 4] 3362         CALL     DOLIT
      00942E 17 00                 3363         .word      TIBB
      009430 CD 86 44         [ 4] 3364         CALL     NTIB
      009433 CD 8A 23         [ 4] 3365         CALL     CELLP
      009436 CC 84 9B         [ 2] 3366         JP     STORE
                                   3367 
                                   3368 ;       QUIT    ( -- )
                                   3369 ;       Reset return stack pointer
                                   3370 ;       and start text interpreter.
      009439 94 1C                 3371         .word      LINK
                           0013BB  3372 LINK = . 
      00943B 04                    3373         .byte      4
      00943C 51 55 49 54           3374         .ascii     "QUIT"
      009440                       3375 QUIT:
      009440 CD 84 34         [ 4] 3376         CALL     DOLIT
      009443 17 FF                 3377         .word      RPP
      009445 CD 84 ED         [ 4] 3378         CALL     RPSTO   ;reset return stack pointer
      009448 CD 93 A4         [ 4] 3379 QUIT1:  CALL     LBRAC   ;start interpretation
      00944B CD 93 07         [ 4] 3380 QUIT2:  CALL     QUERY   ;get input
      00944E CD 93 F8         [ 4] 3381         CALL     EVAL
      009451 20 F8            [ 2] 3382         JRA     QUIT2   ;continue till error
                                   3383 
                                   3384 ;; The compiler
                                   3385 
                                   3386 ;       '       ( -- ca )
                                   3387 ;       Search vocabularies for
                                   3388 ;       next word in input stream.
      009453 94 3B                 3389         .word      LINK
                           0013D5  3390 LINK = . 
      009455 01                    3391         .byte      1
      009456 27                    3392         .ascii     "'"
      009457                       3393 TICK:
      009457 CD 91 32         [ 4] 3394         CALL     TOKEN
      00945A CD 92 2F         [ 4] 3395         CALL     NAMEQ   ;?defined
      00945D CD 84 67         [ 4] 3396         CALL     QBRAN
      009460 93 43                 3397         .word      ABOR1
      009462 81               [ 4] 3398         RET     ;yes, push code address
                                   3399 
                                   3400 ;       ALLOT   ( n -- )
                                   3401 ;       Allocate n bytes to RAM 
      009463 94 55                 3402         .word      LINK
                           0013E5  3403         LINK = . 
      009465 05                    3404         .byte      5
      009466 41 4C 4C 4F 54        3405         .ascii     "ALLOT"
      00946B                       3406 ALLOT:
      00946B CD 86 A7         [ 4] 3407         CALL     VPP
                                   3408 ; must update APP_VP each time VP is modidied
      00946E CD 8B 2A         [ 4] 3409         call PSTOR 
      009471 CC 9B B4         [ 2] 3410         jp UPDATVP 
                                   3411 
                                   3412 ;       ,       ( w -- )
                                   3413 ;         Compile an integer into
                                   3414 ;         variable space.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



      009474 94 65                 3415         .word      LINK
                           0013F6  3416 LINK = . 
      009476 01                    3417         .byte      1
      009477 2C                    3418         .ascii     ","
      009478                       3419 COMMA:
      009478 CD 8B A8         [ 4] 3420         CALL     HERE
      00947B CD 85 59         [ 4] 3421         CALL     DUPP
      00947E CD 8A 23         [ 4] 3422         CALL     CELLP   ;cell boundary
      009481 CD 86 A7         [ 4] 3423         CALL     VPP
      009484 CD 84 9B         [ 4] 3424         CALL     STORE
      009487 CC 84 9B         [ 2] 3425         JP     STORE
                                   3426 
                                   3427 ;       C,      ( c -- )
                                   3428 ;       Compile a byte into
                                   3429 ;       variables space.
      00948A 94 76                 3430        .word      LINK
                           00140C  3431 LINK = . 
      00948C 02                    3432         .byte      2
      00948D 43 2C                 3433         .ascii     "C,"
      00948F                       3434 CCOMMA:
      00948F CD 8B A8         [ 4] 3435         CALL     HERE
      009492 CD 85 59         [ 4] 3436         CALL     DUPP
      009495 CD 8A 4E         [ 4] 3437         CALL     ONEP
      009498 CD 86 A7         [ 4] 3438         CALL     VPP
      00949B CD 84 9B         [ 4] 3439         CALL     STORE
      00949E CC 84 BF         [ 2] 3440         JP     CSTOR
                                   3441 
                                   3442 ;       [COMPILE]       ( -- ; <string> )
                                   3443 ;       Compile next immediate
                                   3444 ;       word into code dictionary.
      0094A1 94 8C                 3445         .word      LINK
                           001423  3446 LINK = . 
      0094A3 89                    3447 	.byte      IMEDD+9
      0094A4 5B 43 4F 4D 50 49 4C  3448         .ascii     "[COMPILE]"
             45 5D
      0094AD                       3449 BCOMP:
      0094AD CD 94 57         [ 4] 3450         CALL     TICK
      0094B0 CC 97 73         [ 2] 3451         JP     JSRC
                                   3452 
                                   3453 ;       COMPILE ( -- )
                                   3454 ;       Compile next jsr in
                                   3455 ;       colon list to code dictionary.
      0094B3 94 A3                 3456         .word      LINK
                           001435  3457 LINK = . 
      0094B5 47                    3458 	.byte      COMPO+7
      0094B6 43 4F 4D 50 49 4C 45  3459         .ascii     "COMPILE"
      0094BD                       3460 COMPI:
      0094BD CD 85 03         [ 4] 3461         CALL     RFROM
      0094C0 CD 85 59         [ 4] 3462         CALL     DUPP
      0094C3 CD 84 B2         [ 4] 3463         CALL     AT
      0094C6 CD 97 73         [ 4] 3464         CALL     JSRC    ;compile subroutine
      0094C9 CD 8A 23         [ 4] 3465         CALL     CELLP
      0094CC 90 93            [ 1] 3466         ldw y,x 
      0094CE 90 FE            [ 2] 3467         ldw y,(y)
      0094D0 1C 00 02         [ 2] 3468         addw x,#CELLL 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      0094D3 90 FC            [ 2] 3469         jp (y)
                                   3470 
                                   3471 ;       LITERAL ( w -- )
                                   3472 ;       Compile tos to dictionary
                                   3473 ;       as an integer literal.
      0094D5 94 B5                 3474         .word      LINK
                           001457  3475 LINK = . 
      0094D7 87                    3476 	.byte      IMEDD+7
      0094D8 4C 49 54 45 52 41 4C  3477         .ascii     "LITERAL"
      0094DF                       3478 LITER:
      0094DF CD 94 BD         [ 4] 3479         CALL     COMPI
      0094E2 84 34                 3480         .word DOLIT 
      0094E4 CC 94 78         [ 2] 3481         JP     COMMA
                                   3482 
                                   3483 ;       $,"     ( -- )
                                   3484 ;       Compile a literal string
                                   3485 ;       up to next " .
      0094E7 94 D7                 3486         .word      LINK
                           001469  3487 LINK = . 
      0094E9 03                    3488         .byte      3
      0094EA 24 2C 22              3489         .byte     '$',',','"'
      0094ED                       3490 STRCQ:
      0094ED CD 84 34         [ 4] 3491         CALL     DOLIT
      0094F0 00 22                 3492         .word     34	; "
      0094F2 CD 90 B5         [ 4] 3493         CALL     PARSE
      0094F5 CD 8B A8         [ 4] 3494         CALL     HERE
      0094F8 CD 8C 68         [ 4] 3495         CALL     PACKS   ;string to code dictionary
      0094FB CD 8B 91         [ 4] 3496         CALL     COUNT
      0094FE CD 87 54         [ 4] 3497         CALL     PLUS    ;calculate aligned end of string
      009501 CD 86 A7         [ 4] 3498         CALL     VPP
      009504 CC 84 9B         [ 2] 3499         JP     STORE
                                   3500 
                                   3501 ;; Structures
                                   3502 
                                   3503 ;       FOR     ( -- a )
                                   3504 ;       Start a FOR-NEXT loop
                                   3505 ;       structure in a colon definition.
      009507 94 E9                 3506         .word      LINK
                           001489  3507 LINK = . 
      009509 83                    3508 	.byte      IMEDD+3
      00950A 46 4F 52              3509         .ascii     "FOR"
      00950D                       3510 FOR:
      00950D CD 94 BD         [ 4] 3511         CALL     COMPI
      009510 85 22                 3512         .word TOR 
      009512 CC 8B A8         [ 2] 3513         JP     HERE
                                   3514 
                                   3515 ;       NEXT    ( a -- )
                                   3516 ;       Terminate a FOR-NEXT loop.
      009515 95 09                 3517         .word      LINK
                           001497  3518 LINK = . 
      009517 84                    3519 	.byte      IMEDD+4
      009518 4E 45 58 54           3520         .ascii     "NEXT"
      00951C                       3521 NEXT:
      00951C CD 94 BD         [ 4] 3522         CALL     COMPI
      00951F 84 48                 3523         .word DONXT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      009521 CD 86 F3         [ 4] 3524         call ADRADJ
      009524 CC 94 78         [ 2] 3525         JP     COMMA
                                   3526 
                                   3527 ;       I ( -- n )
                                   3528 ;       stack FOR-NEXT COUNTER 
      009527 95 17                 3529         .word LINK 
                           0014A9  3530         LINK=.
      009529 01                    3531         .byte 1 
      00952A 49                    3532         .ascii "I"
      00952B                       3533 IFETCH: 
      00952B 1D 00 02         [ 2] 3534         subw x,#CELLL 
      00952E 16 03            [ 2] 3535         ldw y,(3,sp)
      009530 FF               [ 2] 3536         ldw (x),y 
      009531 81               [ 4] 3537         ret 
                                   3538 
                                   3539 ;       BEGIN   ( -- a )
                                   3540 ;       Start an infinite or
                                   3541 ;       indefinite loop structure.
      009532 95 29                 3542         .word      LINK
                           0014B4  3543 LINK = . 
      009534 85                    3544 	.byte      IMEDD+5
      009535 42 45 47 49 4E        3545         .ascii     "BEGIN"
      00953A                       3546 BEGIN:
      00953A CC 8B A8         [ 2] 3547         JP     HERE
                                   3548 
                                   3549 ;       UNTIL   ( a -- )
                                   3550 ;       Terminate a BEGIN-UNTIL
                                   3551 ;       indefinite loop structure.
      00953D 95 34                 3552         .word      LINK
                           0014BF  3553 LINK = . 
      00953F 85                    3554 	.byte      IMEDD+5
      009540 55 4E 54 49 4C        3555         .ascii     "UNTIL"
      009545                       3556 UNTIL:
      009545 CD 94 BD         [ 4] 3557         CALL     COMPI
      009548 84 67                 3558         .word    QBRAN 
      00954A CD 86 F3         [ 4] 3559         call ADRADJ
      00954D CC 94 78         [ 2] 3560         JP     COMMA
                                   3561 
                                   3562 ;       AGAIN   ( a -- )
                                   3563 ;       Terminate a BEGIN-AGAIN
                                   3564 ;       infinite loop structure.
      009550 95 3F                 3565         .word      LINK
                           0014D2  3566 LINK = . 
      009552 85                    3567 	.byte      IMEDD+5
      009553 41 47 41 49 4E        3568         .ascii     "AGAIN"
      009558                       3569 AGAIN:
      009558 CD 94 BD         [ 4] 3570         CALL     COMPI
      00955B 84 7E                 3571         .word BRAN
      00955D CD 86 F3         [ 4] 3572         call ADRADJ 
      009560 CC 94 78         [ 2] 3573         JP     COMMA
                                   3574 
                                   3575 ;       IF      ( -- A )
                                   3576 ;       Begin a conditional branch.
      009563 95 52                 3577         .word      LINK
                           0014E5  3578 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      009565 82                    3579 	.byte      IMEDD+2
      009566 49 46                 3580         .ascii     "IF"
      009568                       3581 IFF:
      009568 CD 94 BD         [ 4] 3582         CALL     COMPI
      00956B 84 67                 3583         .word QBRAN
      00956D CD 8B A8         [ 4] 3584         CALL     HERE
      009570 CD 8A BA         [ 4] 3585         CALL     ZERO
      009573 CC 94 78         [ 2] 3586         JP     COMMA
                                   3587 
                                   3588 ;       THEN        ( A -- )
                                   3589 ;       Terminate a conditional branch structure.
      009576 95 65                 3590         .word      LINK
                           0014F8  3591 LINK = . 
      009578 84                    3592 	.byte      IMEDD+4
      009579 54 48 45 4E           3593         .ascii     "THEN"
      00957D                       3594 THENN:
      00957D CD 8B A8         [ 4] 3595         CALL     HERE
      009580 CD 86 F3         [ 4] 3596         call ADRADJ 
      009583 CD 85 69         [ 4] 3597         CALL     SWAPP
      009586 CC 84 9B         [ 2] 3598         JP     STORE
                                   3599 
                                   3600 ;       ELSE        ( A -- A )
                                   3601 ;       Start the false clause in an IF-ELSE-THEN structure.
      009589 95 78                 3602         .word      LINK
                           00150B  3603 LINK = . 
      00958B 84                    3604 	.byte      IMEDD+4
      00958C 45 4C 53 45           3605         .ascii     "ELSE"
      009590                       3606 ELSEE:
      009590 CD 94 BD         [ 4] 3607         CALL     COMPI
      009593 84 7E                 3608         .word BRAN
      009595 CD 8B A8         [ 4] 3609         CALL     HERE
      009598 CD 8A BA         [ 4] 3610         CALL     ZERO
      00959B CD 94 78         [ 4] 3611         CALL     COMMA
      00959E CD 85 69         [ 4] 3612         CALL     SWAPP
      0095A1 CD 8B A8         [ 4] 3613         CALL     HERE
      0095A4 CD 86 F3         [ 4] 3614         call ADRADJ 
      0095A7 CD 85 69         [ 4] 3615         CALL     SWAPP
      0095AA CC 84 9B         [ 2] 3616         JP     STORE
                                   3617 
                                   3618 ;       AHEAD       ( -- A )
                                   3619 ;       Compile a forward branch instruction.
      0095AD 95 8B                 3620         .word      LINK
                           00152F  3621 LINK = . 
      0095AF 85                    3622 	.byte      IMEDD+5
      0095B0 41 48 45 41 44        3623         .ascii     "AHEAD"
      0095B5                       3624 AHEAD:
      0095B5 CD 94 BD         [ 4] 3625         CALL     COMPI
      0095B8 84 7E                 3626         .word BRAN
      0095BA CD 8B A8         [ 4] 3627         CALL     HERE
      0095BD CD 8A BA         [ 4] 3628         CALL     ZERO
      0095C0 CC 94 78         [ 2] 3629         JP     COMMA
                                   3630 
                                   3631 ;       WHILE       ( a -- A a )
                                   3632 ;       Conditional branch out of a BEGIN-WHILE-REPEAT loop.
      0095C3 95 AF                 3633         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



                           001545  3634 LINK = . 
      0095C5 85                    3635 	.byte      IMEDD+5
      0095C6 57 48 49 4C 45        3636         .ascii     "WHILE"
      0095CB                       3637 WHILE:
      0095CB CD 94 BD         [ 4] 3638         CALL     COMPI
      0095CE 84 67                 3639         .word QBRAN
      0095D0 CD 8B A8         [ 4] 3640         CALL     HERE
      0095D3 CD 8A BA         [ 4] 3641         CALL     ZERO
      0095D6 CD 94 78         [ 4] 3642         CALL     COMMA
      0095D9 CC 85 69         [ 2] 3643         JP     SWAPP
                                   3644 
                                   3645 ;       REPEAT      ( A a -- )
                                   3646 ;       Terminate a BEGIN-WHILE-REPEAT indefinite loop.
      0095DC 95 C5                 3647         .word      LINK
                           00155E  3648 LINK = . 
      0095DE 86                    3649         .byte      IMEDD+6
      0095DF 52 45 50 45 41 54     3650         .ascii     "REPEAT"
      0095E5                       3651 REPEA:
      0095E5 CD 94 BD         [ 4] 3652         CALL     COMPI
      0095E8 84 7E                 3653         .word BRAN
      0095EA CD 86 F3         [ 4] 3654         call ADRADJ 
      0095ED CD 94 78         [ 4] 3655         CALL     COMMA
      0095F0 CD 8B A8         [ 4] 3656         CALL     HERE
      0095F3 CD 86 F3         [ 4] 3657         call ADRADJ 
      0095F6 CD 85 69         [ 4] 3658         CALL     SWAPP
      0095F9 CC 84 9B         [ 2] 3659         JP     STORE
                                   3660 
                                   3661 ;       AFT         ( a -- a A )
                                   3662 ;       Jump to THEN in a FOR-AFT-THEN-NEXT loop the first time through.
      0095FC 95 DE                 3663         .word      LINK
                           00157E  3664 LINK = . 
      0095FE 83                    3665 	.byte      IMEDD+3
      0095FF 41 46 54              3666         .ascii     "AFT"
      009602                       3667 AFT:
      009602 CD 85 4F         [ 4] 3668         CALL     DROP
      009605 CD 95 B5         [ 4] 3669         CALL     AHEAD
      009608 CD 8B A8         [ 4] 3670         CALL     HERE
      00960B CC 85 69         [ 2] 3671         JP     SWAPP
                                   3672 
                                   3673 ;       ABORT"      ( -- ; <string> )
                                   3674 ;       Conditional abort with an error message.
      00960E 95 FE                 3675         .word      LINK
                           001590  3676 LINK = . 
      009610 86                    3677 	.byte      IMEDD+6
      009611 41 42 4F 52 54        3678         .ascii     "ABORT"
      009616 22                    3679         .byte      '"'
      009617                       3680 ABRTQ:
      009617 CD 94 BD         [ 4] 3681         CALL     COMPI
      00961A 93 3B                 3682         .word ABORQ
      00961C CC 94 ED         [ 2] 3683         JP     STRCQ
                                   3684 
                                   3685 ;       $"     ( -- ; <string> )
                                   3686 ;       Compile an inline string literal.
      00961F 96 10                 3687         .word      LINK
                           0015A1  3688 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      009621 82                    3689 	.byte      IMEDD+2
      009622 24 22                 3690         .byte     '$','"'
      009624                       3691 STRQ:
      009624 CD 94 BD         [ 4] 3692         CALL     COMPI
      009627 8F 55                 3693         .word STRQP 
      009629 CC 94 ED         [ 2] 3694         JP     STRCQ
                                   3695 
                                   3696 ;       ."          ( -- ; <string> )
                                   3697 ;       Compile an inline string literal to be typed out at run time.
      00962C 96 21                 3698         .word      LINK
                           0015AE  3699 LINK = . 
      00962E 82                    3700 	.byte      IMEDD+2
      00962F 2E 22                 3701         .byte     '.','"'
      009631                       3702 DOTQ:
      009631 CD 94 BD         [ 4] 3703         CALL     COMPI
      009634 8F 5F                 3704         .word DOTQP 
      009636 CC 94 ED         [ 2] 3705         JP     STRCQ
                                   3706 
                                   3707 ;; Name compiler
                                   3708 
                                   3709 ;       ?UNIQUE ( a -- a )
                                   3710 ;       Display a warning message
                                   3711 ;       if word already exists.
      009639 96 2E                 3712         .word      LINK
                           0015BB  3713 LINK = . 
      00963B 07                    3714         .byte      7
      00963C 3F 55 4E 49 51 55 45  3715         .ascii     "?UNIQUE"
      009643                       3716 UNIQU:
      009643 CD 85 59         [ 4] 3717         CALL     DUPP
      009646 CD 92 2F         [ 4] 3718         CALL     NAMEQ   ;?name exists
      009649 CD 84 67         [ 4] 3719         CALL     QBRAN
      00964C 96 62                 3720         .word      UNIQ1
      00964E CD 8F 5F         [ 4] 3721         CALL     DOTQP   ;redef are OK
      009651 07                    3722         .byte       7
      009652 20 72 65 44 65 66 20  3723         .ascii     " reDef "       
      009659 CD 85 83         [ 4] 3724         CALL     OVER
      00965C CD 8B 91         [ 4] 3725         CALL     COUNT
      00965F CD 8F 02         [ 4] 3726         CALL     TYPES   ;just in case
      009662 CC 85 4F         [ 2] 3727 UNIQ1:  JP     DROP
                                   3728 
                                   3729 ;       $,n     ( na -- )
                                   3730 ;       Build a new dictionary name
                                   3731 ;       using string at na.
                                   3732 ; compile dans l'espace des variables 
      009665 96 3B                 3733         .word      LINK
                           0015E7  3734 LINK = . 
      009667 03                    3735         .byte      3
      009668 24 2C 6E              3736         .ascii     "$,n"
      00966B                       3737 SNAME:
      00966B CD 85 59         [ 4] 3738         CALL     DUPP
      00966E CD 84 D0         [ 4] 3739         CALL     CAT     ;?null input
      009671 CD 84 67         [ 4] 3740         CALL     QBRAN
      009674 96 A1                 3741         .word      PNAM1
      009676 CD 96 43         [ 4] 3742         CALL     UNIQU   ;?redefinition
      009679 CD 85 59         [ 4] 3743         CALL     DUPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      00967C CD 8B 91         [ 4] 3744         CALL     COUNT
      00967F CD 87 54         [ 4] 3745         CALL     PLUS
      009682 CD 86 A7         [ 4] 3746         CALL     VPP
      009685 CD 84 9B         [ 4] 3747         CALL     STORE
      009688 CD 85 59         [ 4] 3748         CALL     DUPP
      00968B CD 86 C5         [ 4] 3749         CALL     LAST
      00968E CD 84 9B         [ 4] 3750         CALL     STORE   ;save na for vocabulary link
      009691 CD 8A 32         [ 4] 3751         CALL     CELLM   ;link address
      009694 CD 86 99         [ 4] 3752         CALL     CNTXT
      009697 CD 84 B2         [ 4] 3753         CALL     AT
      00969A CD 85 69         [ 4] 3754         CALL     SWAPP
      00969D CD 84 9B         [ 4] 3755         CALL     STORE
      0096A0 81               [ 4] 3756         RET     ;save code pointer
      0096A1 CD 8F 55         [ 4] 3757 PNAM1:  CALL     STRQP
      0096A4 05                    3758         .byte      5
      0096A5 20 6E 61 6D 65        3759         .ascii     " name" ;null input
      0096AA CC 93 43         [ 2] 3760         JP     ABOR1
                                   3761 
                                   3762 ;; FORTH compiler
                                   3763 
                                   3764 ;       $COMPILE        ( a -- )
                                   3765 ;       Compile next word to
                                   3766 ;       dictionary as a token or literal.
      0096AD 96 67                 3767         .word      LINK
                           00162F  3768 LINK = . 
      0096AF 08                    3769         .byte      8
      0096B0 24 43 4F 4D 50 49 4C  3770         .ascii     "$COMPILE"
             45
      0096B8                       3771 SCOMP:
      0096B8 CD 92 2F         [ 4] 3772         CALL     NAMEQ
      0096BB CD 87 03         [ 4] 3773         CALL     QDUP    ;?defined
      0096BE CD 84 67         [ 4] 3774         CALL     QBRAN
      0096C1 96 D9                 3775         .word      SCOM2
      0096C3 CD 84 B2         [ 4] 3776         CALL     AT
      0096C6 CD 84 34         [ 4] 3777         CALL     DOLIT
      0096C9 80 00                 3778         .word     0x8000	;  IMEDD*256
      0096CB CD 85 A5         [ 4] 3779         CALL     ANDD    ;?immediate
      0096CE CD 84 67         [ 4] 3780         CALL     QBRAN
      0096D1 96 D6                 3781         .word      SCOM1
      0096D3 CC 84 8E         [ 2] 3782         JP     EXECU
      0096D6 CC 97 73         [ 2] 3783 SCOM1:  JP     JSRC
      0096D9 CD 8D CD         [ 4] 3784 SCOM2:  CALL     NUMBQ   ;try to convert to number
      0096DC CD 84 67         [ 4] 3785         CALL     QBRAN
      0096DF 93 43                 3786         .word      ABOR1
      0096E1 CC 94 DF         [ 2] 3787         JP     LITER
                                   3788 
                                   3789 ;       OVERT   ( -- )
                                   3790 ;       Link a new word into vocabulary.
      0096E4 96 AF                 3791         .word      LINK
                           001666  3792 LINK = . 
      0096E6 05                    3793         .byte      5
      0096E7 4F 56 45 52 54        3794         .ascii     "OVERT"
      0096EC                       3795 OVERT:
      0096EC CD 86 C5         [ 4] 3796         CALL     LAST
      0096EF CD 84 B2         [ 4] 3797         CALL     AT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      0096F2 CD 86 99         [ 4] 3798         CALL     CNTXT
      0096F5 CC 84 9B         [ 2] 3799         JP     STORE
                                   3800 
                                   3801 ;       ;       ( -- )
                                   3802 ;       Terminate a colon definition.
      0096F8 96 E6                 3803         .word      LINK
                           00167A  3804 LINK = . 
      0096FA C1                    3805 	.byte      IMEDD+COMPO+1
      0096FB 3B                    3806         .ascii     ";"
      0096FC                       3807 SEMIS:
                           000001  3808 .if OPTIMIZE ; more compact and faster
      0096FC CD 84 34         [ 4] 3809         call DOLIT 
      0096FF 00 81                 3810         .word 0x81   ; opcode for RET 
      009701 CD 94 8F         [ 4] 3811         call CCOMMA 
                           000000  3812 .else
                                   3813         CALL     COMPI
                                   3814         .word EXIT 
                                   3815 .endif 
      009704 CD 93 A4         [ 4] 3816         CALL     LBRAC
      009707 CD 96 EC         [ 4] 3817         call OVERT 
      00970A CD A0 EE         [ 4] 3818         CALL FMOVE
      00970D CD 87 03         [ 4] 3819         call QDUP 
      009710 CD 84 67         [ 4] 3820         call QBRAN 
      009713 98 43                 3821         .word SET_RAMLAST 
      009715 CD A1 82         [ 4] 3822         CALL UPDATPTR
      009718 81               [ 4] 3823         RET 
                                   3824 
                                   3825 
                                   3826 ;       Terminate an ISR definition 
                                   3827 ;       retourn ca of ISR as double
                                   3828 ;       I; ( -- ud )
      009719 96 FA                 3829         .word LINK 
                           00169B  3830         LINK=.
      00971B C2                    3831         .byte 2+IMEDD+COMPO 
      00971C 49 3B                 3832         .ascii "I;" 
      00971E                       3833 ISEMI:
      00971E 1D 00 02         [ 2] 3834         subw x,#CELLL  
      009721 90 AE 00 80      [ 2] 3835         ldw y,#IRET_CODE 
      009725 FF               [ 2] 3836         ldw (x),y 
      009726 CD 94 8F         [ 4] 3837         call CCOMMA
      009729 CD 93 A4         [ 4] 3838         call LBRAC 
      00972C CD A1 C7         [ 4] 3839         call IFMOVE
      00972F CD 87 03         [ 4] 3840         call QDUP 
      009732 CD 84 67         [ 4] 3841         CALL QBRAN 
      009735 98 43                 3842         .word SET_RAMLAST
      009737 CD 86 B5         [ 4] 3843         CALL CPP
      00973A CD 84 B2         [ 4] 3844         call AT 
      00973D CD 85 69         [ 4] 3845         call SWAPP 
      009740 CD 86 B5         [ 4] 3846         CALL CPP 
      009743 CD 84 9B         [ 4] 3847         call STORE 
      009746 CD 9B 9D         [ 4] 3848         call UPDATCP 
      009749 CD 9B 5A         [ 4] 3849         call EEPVP 
      00974C CD 85 4F         [ 4] 3850         call DROP 
      00974F CD 84 B2         [ 4] 3851         call AT 
      009752 CD 86 A7         [ 4] 3852         call VPP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



      009755 CD 84 9B         [ 4] 3853         call STORE 
      009758 CC 8A BA         [ 2] 3854         jp ZERO
      00975B 81               [ 4] 3855         ret           
                                   3856         
                                   3857 
                                   3858 ;       ]       ( -- )
                                   3859 ;       Start compiling words in
                                   3860 ;       input stream.
      00975C 97 1B                 3861         .word      LINK
                           0016DE  3862 LINK = . 
      00975E 01                    3863         .byte      1
      00975F 5D                    3864         .ascii     "]"
      009760                       3865 RBRAC:
      009760 CD 84 34         [ 4] 3866         CALL   DOLIT
      009763 96 B8                 3867         .word  SCOMP
      009765 CD 86 77         [ 4] 3868         CALL   TEVAL
      009768 CC 84 9B         [ 2] 3869         JP     STORE
                                   3870 
                                   3871 ;       CALL,    ( ca -- )
                                   3872 ;       Compile a subroutine call.
      00976B 97 5E                 3873         .word      LINK
                           0016ED  3874 LINK = . 
      00976D 05                    3875         .byte      5
      00976E 43 41 4C 4C 2C        3876         .ascii     "CALL,"
      009773                       3877 JSRC:
      009773 CD 84 34         [ 4] 3878         CALL     DOLIT
      009776 00 CD                 3879         .word     CALLL     ;CALL
      009778 CD 94 8F         [ 4] 3880         CALL     CCOMMA
      00977B CC 94 78         [ 2] 3881         JP     COMMA
                                   3882 
                                   3883 ;       INIT-OFS ( -- )
                                   3884 ;       compute offset to adjust jump address 
                                   3885 ;       set variable OFFSET 
      00977E 97 6D                 3886         .word LINK 
                           001700  3887         LINK=.
      009780 08                    3888         .byte 8 
      009781 49 4E 49 54 2D 4F 46  3889         .ascii "INIT-OFS" 
             53
      009789                       3890 INITOFS:
      009789 CD 86 66         [ 4] 3891         call TFLASH 
      00978C CD 84 B2         [ 4] 3892         CALL AT 
      00978F CD 85 59         [ 4] 3893         CALL DUPP 
      009792 CD 84 67         [ 4] 3894         call QBRAN
      009795 97 A6                 3895         .word 1$
      009797 CD 85 4F         [ 4] 3896         call DROP  
      00979A CD 86 B5         [ 4] 3897         call CPP 
      00979D CD 84 B2         [ 4] 3898         call AT 
      0097A0 CD 8B A8         [ 4] 3899         call HERE
      0097A3 CD 87 CD         [ 4] 3900         call SUBB 
      0097A6 CD 86 EA         [ 4] 3901 1$:     call OFFSET 
      0097A9 CC 84 9B         [ 2] 3902         jp STORE  
                                   3903 
                                   3904 ;       :       ( -- ; <string> )
                                   3905 ;       Start a new colon definition
                                   3906 ;       using next word as its name.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



      0097AC 97 80                 3907         .word      LINK
                           00172E  3908 LINK = . 
      0097AE 01                    3909         .byte      1
      0097AF 3A                    3910         .ascii     ":"
      0097B0                       3911 COLON:
      0097B0 CD 97 89         [ 4] 3912         call INITOFS       
      0097B3 CD 91 32         [ 4] 3913         CALL   TOKEN
      0097B6 CD 96 6B         [ 4] 3914         CALL   SNAME
      0097B9 CC 97 60         [ 2] 3915         JP     RBRAC
                                   3916 
                                   3917 ;       I:  ( -- )
                                   3918 ;       Start interrupt service routine definition
                                   3919 ;       those definition have no name.
      0097BC 97 AE                 3920         .word LINK
                           00173E  3921         LINK=.
      0097BE 02                    3922         .byte 2 
      0097BF 49 3A                 3923         .ascii "I:" 
      0097C1                       3924 ICOLON:
      0097C1 CD 97 89         [ 4] 3925         call INITOFS 
      0097C4 CC 97 60         [ 2] 3926         jp RBRAC  
                                   3927 
                                   3928 ;       IMMEDIATE       ( -- )
                                   3929 ;       Make last compiled word
                                   3930 ;       an immediate word.
      0097C7 97 BE                 3931         .word      LINK
                           001749  3932 LINK = . 
      0097C9 09                    3933         .byte      9
      0097CA 49 4D 4D 45 44 49 41  3934         .ascii     "IMMEDIATE"
             54 45
      0097D3                       3935 IMMED:
      0097D3 CD 84 34         [ 4] 3936         CALL     DOLIT
      0097D6 80 00                 3937         .word     0x8000	;  IMEDD*256
      0097D8 CD 86 C5         [ 4] 3938         CALL     LAST
      0097DB CD 84 B2         [ 4] 3939         CALL     AT
      0097DE CD 84 B2         [ 4] 3940         CALL     AT
      0097E1 CD 85 B9         [ 4] 3941         CALL     ORR
      0097E4 CD 86 C5         [ 4] 3942         CALL     LAST
      0097E7 CD 84 B2         [ 4] 3943         CALL     AT
      0097EA CC 84 9B         [ 2] 3944         JP     STORE
                                   3945 
                                   3946 ;; Defining words
                                   3947 
                                   3948 ;       CREATE  ( -- ; <string> )
                                   3949 ;       Compile a new array
                                   3950 ;       without allocating space.
      0097ED 97 C9                 3951         .word      LINK
                           00176F  3952 LINK = . 
      0097EF 06                    3953         .byte      6
      0097F0 43 52 45 41 54 45     3954         .ascii     "CREATE"
      0097F6                       3955 CREAT:
      0097F6 CD 91 32         [ 4] 3956         CALL     TOKEN
      0097F9 CD 96 6B         [ 4] 3957         CALL     SNAME
      0097FC CD 96 EC         [ 4] 3958         CALL     OVERT        
      0097FF CD 94 BD         [ 4] 3959         CALL     COMPI 
      009802 86 06                 3960         .word DOVAR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      009804 81               [ 4] 3961         RET
                                   3962 
                                   3963 ;       VARIABLE        ( -- ; <string> )
                                   3964 ;       Compile a new variable
                                   3965 ;       initialized to 0.
      009805 97 EF                 3966         .word      LINK
                           001787  3967 LINK = . 
      009807 08                    3968         .byte      8
      009808 56 41 52 49 41 42 4C  3969         .ascii     "VARIABLE"
             45
      009810                       3970 VARIA:
                                   3971 ; indirect variable so that VARIABLE definition can be compiled in FLASH 
      009810 CD 8B A8         [ 4] 3972         CALL HERE
      009813 CD 85 59         [ 4] 3973         CALL DUPP 
      009816 CD 8A 23         [ 4] 3974         CALL CELLP
      009819 CD 86 A7         [ 4] 3975         CALL VPP 
      00981C CD 84 9B         [ 4] 3976         CALL STORE
      00981F CD 97 F6         [ 4] 3977         CALL CREAT
      009822 CD 85 59         [ 4] 3978         CALL DUPP
      009825 CD 94 78         [ 4] 3979         CALL COMMA
      009828 CD 8A BA         [ 4] 3980         CALL ZERO
      00982B CD 85 69         [ 4] 3981         call SWAPP 
      00982E CD 84 9B         [ 4] 3982         CALL STORE
      009831 CD A0 EE         [ 4] 3983         CALL FMOVE ; move definition to FLASH
      009834 CD 87 03         [ 4] 3984         CALL QDUP 
      009837 CD 84 67         [ 4] 3985         CALL QBRAN 
      00983A 98 43                 3986         .word SET_RAMLAST   
      00983C CD 9B B4         [ 4] 3987         call UPDATVP  ; don't update if variable kept in RAM.
      00983F CD A1 82         [ 4] 3988         CALL UPDATPTR
      009842 81               [ 4] 3989         RET         
      009843                       3990 SET_RAMLAST: 
      009843 CD 86 C5         [ 4] 3991         CALL LAST 
      009846 CD 84 B2         [ 4] 3992         CALL AT 
      009849 CD 86 D8         [ 4] 3993         CALL RAMLAST 
      00984C CC 84 9B         [ 2] 3994         jp STORE  
                                   3995 
                                   3996 
                                   3997 ;       CONSTANT  ( n -- ; <string> )
                                   3998 ;       Compile a new constant 
                                   3999 ;       n CONSTANT name 
      00984F 98 07                 4000         .word LINK 
                           0017D1  4001         LINK=. 
      009851 08                    4002         .byte 8 
      009852 43 4F 4E 53 54 41 4E  4003         .ascii "CONSTANT" 
             54
      00985A                       4004 CONSTANT:          
      00985A CD 91 32         [ 4] 4005         CALL TOKEN
      00985D CD 96 6B         [ 4] 4006         CALL SNAME 
      009860 CD 96 EC         [ 4] 4007         CALL OVERT 
      009863 CD 94 BD         [ 4] 4008         CALL COMPI 
      009866 98 84                 4009         .word DOCONST
      009868 CD 94 78         [ 4] 4010         CALL COMMA 
      00986B CD A0 EE         [ 4] 4011         CALL FMOVE
      00986E CD 87 03         [ 4] 4012         CALL QDUP 
      009871 CD 84 67         [ 4] 4013         CALL QBRAN 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      009874 98 43                 4014         .word SET_RAMLAST  
      009876 CD A1 82         [ 4] 4015         CALL UPDATPTR  
      009879 81               [ 4] 4016 1$:     RET          
                                   4017 
                                   4018 ; CONSTANT runtime semantic 
                                   4019 ; doCONST  ( -- n )
      00987A 98 51                 4020         .word LINK 
                           0017FC  4021         LINK=.
      00987C 07                    4022         .byte 7
      00987D 44 4F 43 4F 4E 53 54  4023         .ascii "DOCONST"
      009884                       4024 DOCONST:
      009884 1D 00 02         [ 2] 4025         subw x,#CELLL
      009887 90 85            [ 2] 4026         popw y 
      009889 90 FE            [ 2] 4027         ldw y,(y) 
      00988B FF               [ 2] 4028         ldw (x),y 
      00988C 81               [ 4] 4029         ret 
                                   4030 
                                   4031 ;----------------------------------
                                   4032 ; create double constant 
                                   4033 ; DCONST ( d -- ; <string> )
                                   4034 ;----------------------------------
      00988D 98 7C                 4035     .word LINK 
                           00180F  4036     LINK=.
      00988F 06                    4037     .byte 6 
      009890 44 43 4F 4E 53 54     4038     .ascii "DCONST"
      009896                       4039 DCONST:
      009896 CD 91 32         [ 4] 4040         CALL TOKEN
      009899 CD 96 6B         [ 4] 4041         CALL SNAME 
      00989C CD 96 EC         [ 4] 4042         CALL OVERT 
      00989F CD 94 BD         [ 4] 4043         CALL COMPI 
      0098A2 98 C5                 4044         .word DO_DCONST
      0098A4 CD 94 78         [ 4] 4045         CALL COMMA
      0098A7 CD 94 78         [ 4] 4046         CALL COMMA  
      0098AA CD A0 EE         [ 4] 4047         CALL FMOVE
      0098AD CD 87 03         [ 4] 4048         CALL QDUP 
      0098B0 CD 84 67         [ 4] 4049         CALL QBRAN 
      0098B3 98 43                 4050         .word SET_RAMLAST  
      0098B5 CD A1 82         [ 4] 4051         CALL UPDATPTR  
      0098B8 81               [ 4] 4052 1$:     RET          
                                   4053     
                                   4054 ;----------------------------------
                                   4055 ; runtime for DCONST 
                                   4056 ; stack double constant 
                                   4057 ; DO-DCONST ( -- d )
                                   4058 ;-----------------------------------
      0098B9 98 8F                 4059         .word LINK 
                           00183B  4060         LINK=.
      0098BB 09                    4061         .byte 9 
      0098BC 44 4F 2D 44 43 4F 4E  4062         .ascii "DO-DCONST"
             53 54
      0098C5                       4063 DO_DCONST:
      0098C5 90 85            [ 2] 4064     popw y 
      0098C7 90 BF 24         [ 2] 4065     ldw YTEMP,y 
      0098CA 1D 00 04         [ 2] 4066     subw x,#2*CELLL 
      0098CD 90 FE            [ 2] 4067     ldw y,(y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



      0098CF FF               [ 2] 4068     ldw (x),y 
      0098D0 90 BE 24         [ 2] 4069     ldw y,YTEMP 
      0098D3 90 EE 02         [ 2] 4070     ldw y,(2,y)
      0098D6 EF 02            [ 2] 4071     ldw (2,x),y 
      0098D8 81               [ 4] 4072     ret 
                                   4073 
                                   4074 ;; Tools
                                   4075 
                                   4076 ;       _TYPE   ( b u -- )
                                   4077 ;       Display a string. Filter
                                   4078 ;       non-printing characters.
      0098D9 98 BB                 4079         .word      LINK
                           00185B  4080 LINK = . 
      0098DB 05                    4081         .byte      5
      0098DC 5F 54 59 50 45        4082         .ascii     "_TYPE"
      0098E1                       4083 UTYPE:
      0098E1 CD 85 22         [ 4] 4084         CALL     TOR     ;start count down loop
      0098E4 20 0F            [ 2] 4085         JRA     UTYP2   ;skip first pass
      0098E6 CD 85 59         [ 4] 4086 UTYP1:  CALL     DUPP
      0098E9 CD 84 D0         [ 4] 4087         CALL     CAT
      0098EC CD 8A E4         [ 4] 4088         CALL     TCHAR
      0098EF CD 84 1E         [ 4] 4089         CALL     EMIT    ;display only printable
      0098F2 CD 8A 4E         [ 4] 4090         CALL     ONEP    ;increment address
      0098F5 CD 84 48         [ 4] 4091 UTYP2:  CALL     DONXT
      0098F8 98 E6                 4092         .word      UTYP1   ;loop till done
      0098FA CC 85 4F         [ 2] 4093         JP     DROP
                                   4094 
                                   4095 ;       dm+     ( a u -- a )
                                   4096 ;       Dump u bytes from ,
                                   4097 ;       leaving a+u on  stack.
      0098FD 98 DB                 4098         .word      LINK
                           00187F  4099 LINK = . 
      0098FF 03                    4100         .byte      3
      009900 64 6D 2B              4101         .ascii     "dm+"
      009903                       4102 DUMPP:
      009903 CD 85 83         [ 4] 4103         CALL     OVER
      009906 CD 84 34         [ 4] 4104         CALL     DOLIT
      009909 00 04                 4105         .word      4
      00990B CD 8F 88         [ 4] 4106         CALL     UDOTR   ;display address
      00990E CD 8E D8         [ 4] 4107         CALL     SPACE
      009911 CD 85 22         [ 4] 4108         CALL     TOR     ;start count down loop
      009914 20 11            [ 2] 4109         JRA     PDUM2   ;skip first pass
      009916 CD 85 59         [ 4] 4110 PDUM1:  CALL     DUPP
      009919 CD 84 D0         [ 4] 4111         CALL     CAT
      00991C CD 84 34         [ 4] 4112         CALL     DOLIT
      00991F 00 03                 4113         .word      3
      009921 CD 8F 88         [ 4] 4114         CALL     UDOTR   ;display numeric data
      009924 CD 8A 4E         [ 4] 4115         CALL     ONEP    ;increment address
      009927 CD 84 48         [ 4] 4116 PDUM2:  CALL     DONXT
      00992A 99 16                 4117         .word      PDUM1   ;loop till done
      00992C 81               [ 4] 4118         RET
                                   4119 
                                   4120 ;       DUMP    ( a u -- )
                                   4121 ;       Dump u bytes from a,
                                   4122 ;       in a formatted manner.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



      00992D 98 FF                 4123         .word      LINK
                           0018AF  4124 LINK = . 
      00992F 04                    4125         .byte      4
      009930 44 55 4D 50           4126         .ascii     "DUMP"
      009934                       4127 DUMP:
      009934 CD 86 16         [ 4] 4128         CALL     BASE
      009937 CD 84 B2         [ 4] 4129         CALL     AT
      00993A CD 85 22         [ 4] 4130         CALL     TOR
      00993D CD 8D 60         [ 4] 4131         CALL     HEX     ;save radix, set hex
      009940 CD 84 34         [ 4] 4132         CALL     DOLIT
      009943 00 10                 4133         .word      16
      009945 CD 89 74         [ 4] 4134         CALL     SLASH   ;change count to lines
      009948 CD 85 22         [ 4] 4135         CALL     TOR     ;start count down loop
      00994B CD 8F 20         [ 4] 4136 DUMP1:  CALL     CR
      00994E CD 84 34         [ 4] 4137         CALL     DOLIT
      009951 00 10                 4138         .word      16
      009953 CD 87 3F         [ 4] 4139         CALL     DDUP
      009956 CD 99 03         [ 4] 4140         CALL     DUMPP   ;display numeric
      009959 CD 87 14         [ 4] 4141         CALL     ROT
      00995C CD 87 14         [ 4] 4142         CALL     ROT
      00995F CD 8E D8         [ 4] 4143         CALL     SPACE
      009962 CD 8E D8         [ 4] 4144         CALL     SPACE
      009965 CD 98 E1         [ 4] 4145         CALL     UTYPE   ;display printable characters
      009968 CD 84 48         [ 4] 4146         CALL     DONXT
      00996B 99 4B                 4147         .word      DUMP1   ;loop till done
      00996D CD 85 4F         [ 4] 4148 DUMP3:  CALL     DROP
      009970 CD 85 03         [ 4] 4149         CALL     RFROM
      009973 CD 86 16         [ 4] 4150         CALL     BASE
      009976 CC 84 9B         [ 2] 4151         JP     STORE   ;restore radix
                                   4152 
                                   4153 ;       .S      ( ... -- ... )
                                   4154 ;        Display  contents of stack.
      009979 99 2F                 4155         .word      LINK
                           0018FB  4156 LINK = . 
      00997B 02                    4157         .byte      2
      00997C 2E 53                 4158         .ascii     ".S"
      00997E                       4159 DOTS:
      00997E CD 8F 20         [ 4] 4160         CALL     CR
      009981 CD 8A FC         [ 4] 4161         CALL     DEPTH   ;stack depth
      009984 CD 85 22         [ 4] 4162         CALL     TOR     ;start count down loop
      009987 20 09            [ 2] 4163         JRA     DOTS2   ;skip first pass
      009989 CD 85 16         [ 4] 4164 DOTS1:  CALL     RAT
      00998C CD 8B 13         [ 4] 4165 	CALL     PICK
      00998F CD 8F BB         [ 4] 4166         CALL     DOT     ;index stack, display contents
      009992 CD 84 48         [ 4] 4167 DOTS2:  CALL     DONXT
      009995 99 89                 4168         .word      DOTS1   ;loop till done
      009997 CD 8F 5F         [ 4] 4169         CALL     DOTQP
      00999A 05                    4170         .byte      5
      00999B 20 3C 73 70 20        4171         .ascii     " <sp "
      0099A0 81               [ 4] 4172         RET
                                   4173 
                                   4174 ;       >NAME   ( ca -- na | F )
                                   4175 ;       Convert code address
                                   4176 ;       to a name address.
      0099A1 99 7B                 4177         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



                           001923  4178 LINK = . 
      0099A3 05                    4179         .byte      5
      0099A4 3E 4E 41 4D 45        4180         .ascii     ">NAME"
      0099A9                       4181 TNAME:
      0099A9 CD 86 99         [ 4] 4182         CALL     CNTXT   ;vocabulary link
      0099AC CD 84 B2         [ 4] 4183 TNAM2:  CALL     AT
      0099AF CD 85 59         [ 4] 4184         CALL     DUPP    ;?last word in a vocabulary
      0099B2 CD 84 67         [ 4] 4185         CALL     QBRAN
      0099B5 99 D0                 4186         .word      TNAM4
      0099B7 CD 87 3F         [ 4] 4187         CALL     DDUP
      0099BA CD 91 40         [ 4] 4188         CALL     NAMET
      0099BD CD 85 CE         [ 4] 4189         CALL     XORR    ;compare
      0099C0 CD 84 67         [ 4] 4190         CALL     QBRAN
      0099C3 99 CA                 4191         .word      TNAM3
      0099C5 CD 8A 32         [ 4] 4192         CALL     CELLM   ;continue with next word
      0099C8 20 E2            [ 2] 4193         JRA     TNAM2
      0099CA CD 85 69         [ 4] 4194 TNAM3:  CALL     SWAPP
      0099CD CC 85 4F         [ 2] 4195         JP     DROP
      0099D0 CD 87 34         [ 4] 4196 TNAM4:  CALL     DDROP
      0099D3 CC 8A BA         [ 2] 4197         JP     ZERO
                                   4198 
                                   4199 ;       .ID     ( na -- )
                                   4200 ;        Display  name at address.
      0099D6 99 A3                 4201         .word      LINK
                           001958  4202 LINK = . 
      0099D8 03                    4203         .byte      3
      0099D9 2E 49 44              4204         .ascii     ".ID"
      0099DC                       4205 DOTID:
      0099DC CD 87 03         [ 4] 4206         CALL     QDUP    ;if zero no name
      0099DF CD 84 67         [ 4] 4207         CALL     QBRAN
      0099E2 99 F2                 4208         .word      DOTI1
      0099E4 CD 8B 91         [ 4] 4209         CALL     COUNT
      0099E7 CD 84 34         [ 4] 4210         CALL     DOLIT
      0099EA 00 1F                 4211         .word      0x1F
      0099EC CD 85 A5         [ 4] 4212         CALL     ANDD    ;mask lexicon bits
      0099EF CC 98 E1         [ 2] 4213         JP     UTYPE
      0099F2 CD 8F 5F         [ 4] 4214 DOTI1:  CALL     DOTQP
      0099F5 09                    4215         .byte      9
      0099F6 20 6E 6F 4E 61 6D 65  4216         .ascii     " noName"
      0099FD 81               [ 4] 4217         RET
                                   4218 
                           000000  4219 WANT_SEE=0
                           000000  4220 .if WANT_SEE 
                                   4221 ;       SEE     ( -- ; <string> )
                                   4222 ;       A simple decompiler.
                                   4223 ;       Updated for byte machines.
                                   4224         .word      LINK
                                   4225 LINK = . 
                                   4226         .byte      3
                                   4227         .ascii     "SEE"
                                   4228 SEE:
                                   4229         CALL     TICK    ;starting address
                                   4230         CALL     CR
                                   4231         CALL     ONEM
                                   4232 SEE1:   CALL     ONEP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



                                   4233         CALL     DUPP
                                   4234         CALL     AT
                                   4235         CALL     DUPP
                                   4236         CALL     QBRAN
                                   4237         .word    SEE2
                                   4238         CALL     TNAME   ;?is it a name
                                   4239 SEE2:   CALL     QDUP    ;name address or zero
                                   4240         CALL     QBRAN
                                   4241         .word    SEE3
                                   4242         CALL     SPACE
                                   4243         CALL     DOTID   ;display name
                                   4244         CALL     ONEP
                                   4245         JRA      SEE4
                                   4246 SEE3:   CALL     DUPP
                                   4247         CALL     CAT
                                   4248         CALL     UDOT    ;display number
                                   4249 SEE4:   CALL     NUFQ    ;user control
                                   4250         CALL     QBRAN
                                   4251         .word    SEE1
                                   4252         JP     DROP
                                   4253 .endif ; WANT_SEE 
                                   4254 
                                   4255 ;       WORDS   ( -- )
                                   4256 ;       Display names in vocabulary.
      0099FE 99 D8                 4257         .word      LINK
                           001980  4258 LINK = . 
      009A00 05                    4259         .byte      5
      009A01 57 4F 52 44 53        4260         .ascii     "WORDS"
      009A06                       4261 WORDS:
      009A06 CD 8F 20         [ 4] 4262         CALL     CR
      009A09 CD 86 99         [ 4] 4263         CALL     CNTXT   ;only in context
      009A0C CD 84 B2         [ 4] 4264 WORS1:  CALL     AT
      009A0F CD 87 03         [ 4] 4265         CALL     QDUP    ;?at end of list
      009A12 CD 84 67         [ 4] 4266         CALL     QBRAN
      009A15 9A 28                 4267         .word      WORS2
      009A17 CD 85 59         [ 4] 4268         CALL     DUPP
      009A1A CD 8E D8         [ 4] 4269         CALL     SPACE
      009A1D CD 99 DC         [ 4] 4270         CALL     DOTID   ;display a name
      009A20 CD 8A 32         [ 4] 4271         CALL     CELLM
      009A23 CD 84 7E         [ 4] 4272         CALL     BRAN
      009A26 9A 0C                 4273         .word      WORS1
      009A28 81               [ 4] 4274 WORS2:  RET
                                   4275 
                                   4276         
                                   4277 ;; Hardware reset
                                   4278 
                                   4279 ;       hi      ( -- )
                                   4280 ;       Display sign-on message.
      009A29 9A 00                 4281         .word      LINK
                           0019AB  4282 LINK = . 
      009A2B 02                    4283         .byte      2
      009A2C 68 69                 4284         .ascii     "hi"
      009A2E                       4285 HI:
      009A2E CD 8F 20         [ 4] 4286         CALL     CR
      009A31 CD 8F 5F         [ 4] 4287         CALL     DOTQP   ;initialize I/O
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



      009A34 0F                    4288         .byte      15
      009A35 73 74 6D 38 65 46 6F  4289         .ascii     "stm8eForth v"
             72 74 68 20 76
      009A41 33                    4290 	.byte      VER+'0'
      009A42 2E                    4291         .byte      '.' 
      009A43 30                    4292 	.byte      EXT+'0' ;version
      009A44 CD 8F 5F         [ 4] 4293         CALL    DOTQP
                           000001  4294 .if NUCLEO          
      009A47 12                    4295         .byte 18
      009A48 20 6F 6E 20 4E 55 43  4296         .ascii  " on NUCLEO-8S208RB"
             4C 45 4F 2D 38 53 32
             30 38 52 42
                           000000  4297 .else ; DISCOVERY 
                                   4298         .byte 19
                                   4299         .ascii  " on STM8S-DISCOVERY"
                                   4300 .endif
      009A5A CC 8F 20         [ 2] 4301         JP     CR
                                   4302 
                           000000  4303 WANT_DEBUG=0
                           000000  4304 .if WANT_DEBUG 
                                   4305 ;       DEBUG      ( -- )
                                   4306 ;       Display sign-on message.
                                   4307 ;        .word      LINK
                                   4308 LINK = . 
                                   4309         .byte      5
                                   4310         .ascii     "DEBUG"
                                   4311 DEBUG:
                                   4312 	CALL DOLIT
                                   4313 	.word 0x65
                                   4314 	CALL EMIT
                                   4315 	CALL DOLIT
                                   4316 	.word 0
                                   4317  	CALL ZLESS 
                                   4318 	CALL DOLIT
                                   4319 	.word 0xFFFE
                                   4320 	CALL ZLESS 
                                   4321 	CALL UPLUS 
                                   4322  	CALL DROP 
                                   4323 	CALL DOLIT
                                   4324 	.word 3
                                   4325 	CALL UPLUS 
                                   4326 	CALL UPLUS 
                                   4327  	CALL DROP
                                   4328 	CALL DOLIT
                                   4329 	.word 0x43
                                   4330 	CALL UPLUS 
                                   4331  	CALL DROP
                                   4332 	CALL EMIT
                                   4333 	CALL DOLIT
                                   4334 	.word 0x4F
                                   4335 	CALL DOLIT
                                   4336 	.word 0x6F
                                   4337  	CALL XORR
                                   4338 	CALL DOLIT
                                   4339 	.word 0xF0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



                                   4340  	CALL ANDD
                                   4341 	CALL DOLIT
                                   4342 	.word 0x4F
                                   4343  	CALL ORR
                                   4344 	CALL EMIT
                                   4345 	CALL DOLIT
                                   4346 	.word 8
                                   4347 	CALL DOLIT
                                   4348 	.word 6
                                   4349  	CALL SWAPP
                                   4350 	CALL OVER
                                   4351 	CALL XORR
                                   4352 	CALL DOLIT
                                   4353 	.word 3
                                   4354 	CALL ANDD 
                                   4355 	CALL ANDD
                                   4356 	CALL DOLIT
                                   4357 	.word 0x70
                                   4358 	CALL UPLUS 
                                   4359 	CALL DROP
                                   4360 	CALL EMIT
                                   4361 	CALL DOLIT
                                   4362 	.word 0
                                   4363 	CALL QBRAN
                                   4364 	.word DEBUG1
                                   4365 	CALL DOLIT
                                   4366 	.word 0x3F
                                   4367 DEBUG1:
                                   4368 	CALL DOLIT
                                   4369 	.word 0xFFFF
                                   4370 	CALL QBRAN
                                   4371 	.word DEBUG2
                                   4372 	CALL DOLIT
                                   4373 	.word 0x74
                                   4374 	CALL BRAN
                                   4375 	.word DEBUG3
                                   4376 DEBUG2:
                                   4377 	CALL DOLIT
                                   4378 	.word 0x21
                                   4379 DEBUG3:
                                   4380 	CALL EMIT
                                   4381 	CALL DOLIT
                                   4382 	.word 0x68
                                   4383 	CALL DOLIT
                                   4384 	.word 0x80
                                   4385 	CALL STORE
                                   4386 	CALL DOLIT
                                   4387 	.word 0x80
                                   4388 	CALL AT
                                   4389 	CALL EMIT
                                   4390 	CALL DOLIT
                                   4391 	.word 0x4D
                                   4392 	CALL TOR
                                   4393 	CALL RAT
                                   4394 	CALL RFROM
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



                                   4395 	CALL ANDD
                                   4396 	CALL EMIT
                                   4397 	CALL DOLIT
                                   4398 	.word 0x61
                                   4399 	CALL DOLIT
                                   4400 	.word 0xA
                                   4401 	CALL TOR
                                   4402 DEBUG4:
                                   4403 	CALL DOLIT
                                   4404 	.word 1
                                   4405 	CALL UPLUS 
                                   4406 	CALL DROP
                                   4407 	CALL DONXT
                                   4408 	.word DEBUG4
                                   4409 	CALL EMIT
                                   4410 	CALL DOLIT
                                   4411 	.word 0x656D
                                   4412 	CALL DOLIT
                                   4413 	.word 0x100
                                   4414 	CALL UMSTA
                                   4415 	CALL SWAPP
                                   4416 	CALL DOLIT
                                   4417 	.word 0x100
                                   4418 	CALL UMSTA
                                   4419 	CALL SWAPP 
                                   4420 	CALL DROP
                                   4421 	CALL EMIT
                                   4422 	CALL EMIT
                                   4423 	CALL DOLIT
                                   4424 	.word 0x2043
                                   4425 	CALL DOLIT
                                   4426 	.word 0
                                   4427 	CALL DOLIT
                                   4428 	.word 0x100
                                   4429 	CALL UMMOD
                                   4430 	CALL EMIT
                                   4431 	CALL EMIT
                                   4432 	;JP ORIG
                                   4433 	RET
                                   4434 .endif ; WANT_DEBUG 
                                   4435 
                                   4436 
                                   4437 ;       'BOOT   ( -- a )
                                   4438 ;       The application startup vector.
      009A5D 9A 2B                 4439         .word      LINK
                           0019DF  4440 LINK = . 
      009A5F 05                    4441         .byte      5
      009A60 27 42 4F 4F 54        4442         .ascii     "'BOOT"
      009A65                       4443 TBOOT:
      009A65 CD 86 06         [ 4] 4444         CALL     DOVAR
      009A68 40 02                 4445         .word    APP_RUN      ;application to boot
                                   4446 
                                   4447 ;       COLD    ( -- )
                                   4448 ;       The hilevel cold start s=ence.
      009A6A 9A 5F                 4449         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



                           0019EC  4450         LINK = . 
      009A6C 04                    4451         .byte      4
      009A6D 43 4F 4C 44           4452         .ascii     "COLD"
      009A71                       4453 COLD:
                           000000  4454 .if WANT_DEBUG
                                   4455         CALL DEBUG
                                   4456 .endif ; WANT_DEBUG
      009A71 CD 84 34         [ 4] 4457 COLD1:  CALL     DOLIT
      009A74 80 AB                 4458         .word      UZERO
      009A76 CD 84 34         [ 4] 4459 	CALL     DOLIT
      009A79 00 06                 4460         .word      UPP
      009A7B CD 84 34         [ 4] 4461         CALL     DOLIT
      009A7E 00 1A                 4462 	.word      UEND-UZERO
      009A80 CD 8B F5         [ 4] 4463         CALL     CMOVE   ;initialize user area
                                   4464 
                                   4465 ; if APP_RUN==0 initialize with ca de 'hi'  
      009A83 90 CE 40 02      [ 2] 4466         ldw y,APP_RUN 
      009A87 26 0B            [ 1] 4467         jrne 0$
      009A89 1D 00 02         [ 2] 4468         subw x,#CELLL 
      009A8C 90 AE 9A 2E      [ 2] 4469         ldw y,#HI  
      009A90 FF               [ 2] 4470         ldw (x),y
      009A91 CD 9B 8C         [ 4] 4471         call UPDATRUN 
      009A94                       4472 0$:        
                                   4473 ; update LAST with APP_LAST 
                                   4474 ; if APP_LAST > LAST else do the opposite
      009A94 90 CE 40 00      [ 2] 4475         ldw y,APP_LAST 
      009A98 90 B3 1A         [ 2] 4476         cpw y,ULAST 
      009A9B 22 05            [ 1] 4477         jrugt 1$ 
                                   4478 ; save LAST at APP_LAST  
      009A9D CD 9B 74         [ 4] 4479         call UPDATLAST 
      009AA0 20 06            [ 2] 4480         jra 2$
      009AA2                       4481 1$: ; update LAST with APP_LAST 
      009AA2 90 BF 1A         [ 2] 4482         ldw ULAST,y
      009AA5 90 BF 14         [ 2] 4483         ldw UCNTXT,y
      009AA8                       4484 2$:  
                                   4485 ; update APP_CP if < app_space 
      009AA8 90 CE 40 04      [ 2] 4486         ldw y,APP_CP  
      009AAC 90 B3 18         [ 2] 4487         cpw y,UCP   
      009AAF 24 06            [ 1] 4488         jruge 3$ 
      009AB1 CD 9B 9D         [ 4] 4489         call UPDATCP
      009AB4 90 BE 18         [ 2] 4490         ldw y,UCP   
      009AB7                       4491 3$:
      009AB7 90 BF 18         [ 2] 4492         ldw UCP,y                 
                                   4493 ; update UVP with APP_VP  
                                   4494 ; if APP_VP>UVP else do the opposite 
      009ABA 90 CE 40 06      [ 2] 4495         ldw y,APP_VP 
      009ABE 90 B3 16         [ 2] 4496         cpw y,UVP 
      009AC1 22 05            [ 1] 4497         jrugt 4$
      009AC3 CD 9B B4         [ 4] 4498         call UPDATVP 
      009AC6 20 03            [ 2] 4499         jra 6$
      009AC8                       4500 4$: ; update UVP with APP_VP 
      009AC8 90 BF 16         [ 2] 4501         ldw UVP,y 
      009ACB                       4502 6$:      
      009ACB CD 94 23         [ 4] 4503         CALL     PRESE   ;initialize data stack and TIB
      009ACE CD 9A 65         [ 4] 4504         CALL     TBOOT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



      009AD1 CD 8B DE         [ 4] 4505         CALL     ATEXE   ;application boot
      009AD4 CD 96 EC         [ 4] 4506         CALL     OVERT
      009AD7 CC 94 40         [ 2] 4507         JP     QUIT    ;start interpretation
                                   4508 
                                   4509 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



                                   4510         .include "flash.asm"
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
      009ADA 9A 6C                   30     .word LINK 
                           001A5C    31     LINK=.
      009ADC 03                      32     .byte 3 
      009ADD 46 50 21                33     .ascii "FP!"
      009AE0                         34 PSTO:
      009AE0 90 93            [ 1]   35     ldw y,x
      009AE2 90 FE            [ 2]   36     ldw y,(y)
      009AE4 90 9F            [ 1]   37     ld a,yl 
      009AE6 B7 32            [ 1]   38     ld FPTR,a 
      009AE8 1C 00 02         [ 2]   39     addw x,#CELLL 
      009AEB 90 93            [ 1]   40     ldw y,x 
      009AED 90 FE            [ 2]   41     ldw y,(y)
      009AEF 90 BF 33         [ 2]   42     ldw PTR16,y
      009AF2 1C 00 02         [ 2]   43     addw x,#CELLL 
      009AF5 81               [ 4]   44     ret 
                                     45 
                                     46 ;-----------------------------------
                                     47 ; return EEPROM base address 
                                     48 ; as a double 
                                     49 ;  EEPROM  ( -- ud )
                                     50 ;-----------------------------------
      009AF6 9A DC                   51     .word LINK 
                           001A78    52 LINK=.
      009AF8 06                      53     .byte 6 
      009AF9 45 45 50 52 4F 4D       54     .ascii "EEPROM"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      009AFF                         55 EEPROM: 
      009AFF 90 AE 40 00      [ 2]   56     ldw y,#EEPROM_BASE
      009B03 1D 00 04         [ 2]   57     subw x,#2*CELLL 
      009B06 EF 02            [ 2]   58     ldw (2,x),y 
      009B08 90 5F            [ 1]   59     clrw y 
      009B0A FF               [ 2]   60     ldw (x),y 
      009B0B 81               [ 4]   61     ret
                                     62 
                                     63 ;---------------------------------
                                     64 ; return APP_LAST pointer as double
                                     65 ; EEP-LAST ( -- ud )
                                     66 ;---------------------------------
      009B0C 9A F8                   67 	.word LINK 
                           001A8E    68 	LINK=.
      009B0E 08                      69 	.byte 8 
      009B0F 45 45 50 2D 4C 41 53    70 	.ascii "EEP-LAST"
             54
      009B17                         71 EEPLAST:
      009B17 1D 00 04         [ 2]   72 	subw x,#2*CELLL 
      009B1A 90 AE 40 00      [ 2]   73 	ldw y,#APP_LAST 
      009B1E EF 02            [ 2]   74 	ldw (2,x),y 
      009B20 90 5F            [ 1]   75 	clrw y 
      009B22 FF               [ 2]   76 	ldw (x),y 
      009B23 81               [ 4]   77 	ret 
                                     78 
                                     79 ;----------------------------------
                                     80 ; return APP_RUN pointer as double	
                                     81 ; EEP-RUN ( -- ud )
                                     82 ;-----------------------------------
      009B24 9B 0E                   83 	.word LINK 
                           001AA6    84 	LINK=.
      009B26 07                      85 	.byte 7
      009B27 45 45 50 2D 52 55 4E    86 	.ascii "EEP-RUN"
      009B2E                         87 EEPRUN:
      009B2E 1D 00 04         [ 2]   88 	subw x,#2*CELLL 
      009B31 90 AE 40 02      [ 2]   89 	ldw y,#APP_RUN 
      009B35 EF 02            [ 2]   90 	ldw (2,x),y 
      009B37 90 5F            [ 1]   91 	clrw y 
      009B39 FF               [ 2]   92 	ldw (x),y 
      009B3A 81               [ 4]   93 	ret 
                                     94 
                                     95 ;------------------------------------
                                     96 ; return APP_CP pointer as double 
                                     97 ; EEP-CP ( -- ud )
                                     98 ;------------------------------------
      009B3B 9B 26                   99 	.word LINK
                           001ABD   100 	LINK=.
      009B3D 06                     101 	.byte 6 
      009B3E 45 45 50 2D 43 50      102 	.ascii "EEP-CP"
      009B44                        103 EEPCP:
      009B44 1D 00 04         [ 2]  104 	subw x,#2*CELLL 
      009B47 90 AE 40 04      [ 2]  105 	ldw y,#APP_CP  
      009B4B EF 02            [ 2]  106 	ldw (2,x),y 
      009B4D 90 5F            [ 1]  107 	clrw y 
      009B4F FF               [ 2]  108 	ldw (x),y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



      009B50 81               [ 4]  109 	ret 
                                    110 
                                    111 ;------------------------------------
                                    112 ; return APP_VP pointer as double 
                                    113 ; EEP-VP ( -- ud )
                                    114 ;-------------------------------------
      009B51 9B 3D                  115 	.word LINK
                           001AD3   116 	LINK=.
      009B53 06                     117 	.byte 6
      009B54 45 45 50 2D 56 50      118 	.ascii "EEP-VP"
      009B5A                        119 EEPVP:
      009B5A 1D 00 04         [ 2]  120 	subw x,#2*CELLL 
      009B5D 90 AE 40 06      [ 2]  121 	ldw y,#APP_VP  
      009B61 EF 02            [ 2]  122 	ldw (2,x),y 
      009B63 90 5F            [ 1]  123 	clrw y 
      009B65 FF               [ 2]  124 	ldw (x),y 
      009B66 81               [ 4]  125 	ret 
                                    126 
                                    127 ;----------------------------------
                                    128 ; update APP_LAST with LAST 
                                    129 ; UPDAT-LAST ( -- )
                                    130 ;----------------------------------
      009B67 9B 53                  131 	.word LINK 
                           001AE9   132 	LINK=.
      009B69 0A                     133 	.byte 10
      009B6A 55 50 44 41 54 2D 4C   134 	.ascii "UPDAT-LAST"
             41 53 54
      009B74                        135 UPDATLAST:
      009B74 CD 86 C5         [ 4]  136 	call LAST
      009B77 CD 84 B2         [ 4]  137 	call AT  
      009B7A CD 9B 17         [ 4]  138 	call EEPLAST
      009B7D CC 9D 5E         [ 2]  139 	jp ee_store 
                                    140 
                                    141 ;---------------------------------
                                    142 ; update APP_RUN 
                                    143 ; UPDAT-RUN ( a -- )
                                    144 ;---------------------------------
      009B80 9B 69                  145 	.word LINK
                           001B02   146 	LINK=.
      009B82 09                     147 	.byte 9
      009B83 55 50 44 41 54 2D 52   148 	.ascii "UPDAT-RUN"
             55 4E
      009B8C                        149 UPDATRUN:
      009B8C CD 9B 2E         [ 4]  150 	call EEPRUN
      009B8F CC 9D 5E         [ 2]  151 	jp ee_store 
                                    152 	
                                    153 ;---------------------------------
                                    154 ; update APP_CP with CP 
                                    155 ; UPDAT-CP ( -- )
                                    156 ;---------------------------------
      009B92 9B 82                  157 	.word LINK 
                           001B14   158 	LINK=.
      009B94 08                     159 	.byte 8 
      009B95 55 50 44 41 54 2D 43   160 	.ascii "UPDAT-CP"
             50
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



      009B9D                        161 UPDATCP:
      009B9D CD 86 B5         [ 4]  162 	call CPP 
      009BA0 CD 84 B2         [ 4]  163 	call AT 
      009BA3 CD 9B 44         [ 4]  164 	call EEPCP 
      009BA6 CC 9D 5E         [ 2]  165 	jp ee_store 
                                    166 
                                    167 ;----------------------------------
                                    168 ; update APP_VP with VP 
                                    169 ; UPDAT-VP ( -- )
                                    170 ;----------------------------------
      009BA9 9B 94                  171 	.word LINK
                           001B2B   172 	LINK=.
      009BAB 08                     173 	.byte 8 
      009BAC 55 50 44 41 54 2D 56   174 	.ascii "UPDAT-VP" 
             50
      009BB4                        175 UPDATVP:
      009BB4 CD 86 A7         [ 4]  176 	call VPP 
      009BB7 CD 84 B2         [ 4]  177 	call AT
      009BBA CD 9B 5A         [ 4]  178 	call EEPVP 
      009BBD CC 9D 5E         [ 2]  179 	jp ee_store
                                    180 	
                                    181 
                                    182 ;----------------------------------
                                    183 ; fetch integer at address over 65535
                                    184 ;  F@   ( ud -- n )
                                    185 ;----------------------------------
      009BC0 9B AB                  186     .word LINK 
                           001B42   187 LINK=.
      009BC2 02                     188     .byte 2
      009BC3 46 40                  189     .ascii "F@"
      009BC5                        190 farat:
      009BC5 CD 9A E0         [ 4]  191     call PSTO
      009BC8 CC 9C 8D         [ 2]  192 	jp EE_READ 
                                    193 
                                    194 
                                    195 ;-------------------------------------
                                    196 ; fetch C at address over 65535 
                                    197 ; FC@ ( ud -- c)
                                    198 ;-------------------------------------
      009BCB 9B C2                  199     .word LINK
                           001B4D   200     LINK=.
      009BCD 03                     201     .byte 3 
      009BCE 46 43 40               202     .ascii "FC@" 
      009BD1                        203 farcat:
      009BD1 CD 9A E0         [ 4]  204     call PSTO
      009BD4 CC 9C AF         [ 2]  205 	jp EE_CREAD  
                                    206     
                                    207 ;----------------------------------
                                    208 ; UNLOCK EEPROM/OPT for writing/erasing
                                    209 ; wait endlessly for FLASH_IAPSR_DUL bit.
                                    210 ;  UNLKEE   ( -- )
                                    211 ;----------------------------------
      009BD7 9B CD                  212     .word LINK 
                           001B59   213 LINK=.
      009BD9 06                     214     .byte 6 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



      009BDA 55 4E 4C 4B 45 45      215     .ascii "UNLKEE"
      009BE0                        216 unlock_eeprom:
      009BE0 35 00 50 5B      [ 1]  217 	mov FLASH_CR2,#0 
      009BE4 35 FF 50 5C      [ 1]  218 	mov FLASH_NCR2,#0xFF 
      009BE8 35 AE 50 64      [ 1]  219 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      009BEC 35 56 50 64      [ 1]  220     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      009BF0 72 07 50 5F FB   [ 2]  221 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      009BF5 81               [ 4]  222 	ret
                                    223 
                                    224 ;----------------------------------
                                    225 ; UNLOCK FLASH for writing/erasing
                                    226 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                    227 ; UNLKFL  ( -- )
                                    228 ;----------------------------------
      009BF6 9B D9                  229     .word LINK 
                           001B78   230 LINK=. 
      009BF8 06                     231     .byte 6 
      009BF9 55 4E 4C 4B 46 4C      232     .ascii "UNLKFL"    
      009BFF                        233 unlock_flash:
      009BFF 35 00 50 5B      [ 1]  234 	mov FLASH_CR2,#0 
      009C03 35 FF 50 5C      [ 1]  235 	mov FLASH_NCR2,#0xFF 
      009C07 35 56 50 62      [ 1]  236 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      009C0B 35 AE 50 62      [ 1]  237 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      009C0F 72 03 50 5F FB   [ 2]  238 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      009C14 81               [ 4]  239 	ret
                                    240 
                                    241 ;-----------------------------
                                    242 ; UNLOCK FLASH or EEPROM 
                                    243 ; according to FPTR address 
                                    244 ;  UNLOCK ( -- )
                                    245 ;-----------------------------
      009C15 9B F8                  246 	.word LINK 
                           001B97   247 	LINK=.
      009C17 06                     248 	.byte 6
      009C18 55 4E 4C 4F 43 4B      249 	.ascii "UNLOCK"
      009C1E                        250 UNLOCK:
                                    251 ; put addr[15:0] in Y, for bounds check.
      009C1E 90 BE 33         [ 2]  252 	ldw y,PTR16   ; Y=addr15:0
                                    253 ; check addr[23:16], if <> 0 then it is extened flash memory
      009C21 3D 32            [ 1]  254 	tnz FPTR 
      009C23 26 16            [ 1]  255 	jrne 4$
      009C25 90 A3 80 00      [ 2]  256     cpw y,#FLASH_BASE
      009C29 24 10            [ 1]  257     jruge 4$
      009C2B 90 A3 40 00      [ 2]  258 	cpw y,#EEPROM_BASE  
      009C2F 25 0D            [ 1]  259     jrult 9$
      009C31 90 A3 48 7F      [ 2]  260 	cpw y,#OPTION_END 
      009C35 22 07            [ 1]  261 	jrugt 9$
      009C37 CD 9B E0         [ 4]  262 	call unlock_eeprom
      009C3A 81               [ 4]  263 	ret 
      009C3B CD 9B FF         [ 4]  264 4$: call unlock_flash
      009C3E 81               [ 4]  265 9$: ret 
                                    266 
                                    267 ;-------------------------
                                    268 ; LOCK write access to 
                                    269 ; FLASH and EEPROM 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



                                    270 ; LOCK ( -- )
                                    271 ;-------------------------
      009C3F 9C 17                  272 	.word LINK 
                           001BC1   273 	LINK=.
      009C41 04                     274 	.byte 4 
      009C42 4C 4F 43 4B            275 	.ascii "LOCK" 
      009C46                        276 LOCK: 
      009C46 72 13 50 5F      [ 1]  277 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      009C4A 72 17 50 5F      [ 1]  278 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009C4E 81               [ 4]  279 	ret 
                                    280 
                                    281 ;-------------------------
                                    282 ; increment FPTR 
                                    283 ; INC-FPTR ( -- )
                                    284 ;-------------------------
      009C4F 9C 41                  285 	.word LINK 
                           001BD1   286 	LINK=. 
      009C51 08                     287 	.byte 8 
      009C52 49 4E 43 2D 46 50 54   288 	.ascii "INC-FPTR" 
             52
      009C5A                        289 INC_FPTR:
      009C5A 3C 34            [ 1]  290 	inc PTR8 
      009C5C 26 0C            [ 1]  291 	jrne 1$
      009C5E 90 89            [ 2]  292 	pushw y 
      009C60 90 BE 32         [ 2]  293 	ldw y,FPTR 
      009C63 90 5C            [ 2]  294 	incw y 
      009C65 90 BF 32         [ 2]  295 	ldw FPTR,y
      009C68 90 85            [ 2]  296 	popw y  
      009C6A 81               [ 4]  297 1$: ret 
                                    298 
                                    299 ;------------------------------
                                    300 ; add u to FPTR 
                                    301 ; PTR+ ( u -- )
                                    302 ;------------------------------
      009C6B 9C 51                  303 	.word LINK 
                           001BED   304 	LINK=.
      009C6D 04                     305 	.byte 4 
      009C6E 50 54 52 2B            306 	.ascii "PTR+"
      009C72                        307 PTRPLUS:
      009C72 90 93            [ 1]  308 	ldw y,x 
      009C74 1C 00 02         [ 2]  309 	addw x,#CELLL 
      009C77 72 B9 00 33      [ 2]  310 	addw y,PTR16 
      009C7B 90 BF 33         [ 2]  311 	ldw PTR16,y  
      009C7E 24 02            [ 1]  312 	jrnc 1$
      009C80 3C 32            [ 1]  313 	inc FPTR 
      009C82 81               [ 4]  314 1$: ret 
                                    315 
                                    316 ;---------------------------------
                                    317 ; read word at address pointed FPTR
                                    318 ; increment FPTR 
                                    319 ; EE-READ ( -- w )
                                    320 ;------------------------------------
      009C83 9C 6D                  321 	.word LINK 
                           001C05   322 	LINK=.
      009C85 07                     323 	.byte 7 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



      009C86 45 45 2D 52 45 41 44   324 	.ascii "EE-READ"
      009C8D                        325 EE_READ:
      009C8D 1D 00 02         [ 2]  326 	subw x,#CELLL 
      009C90 92 BC 00 32      [ 5]  327 	ldf a,[FPTR]
      009C94 90 95            [ 1]  328 	ld yh,a 
      009C96 CD 9C 5A         [ 4]  329 	call INC_FPTR 
      009C99 92 BC 00 32      [ 5]  330 	ldf a,[FPTR]
      009C9D CD 9C 5A         [ 4]  331 	call INC_FPTR 
      009CA0 90 97            [ 1]  332 	ld yl,a 
      009CA2 FF               [ 2]  333 	ldw (x),y 
      009CA3 81               [ 4]  334 	ret 
                                    335 
                                    336 ;---------------------------------------
                                    337 ; Read byte at address pointed by FPTR 
                                    338 ; EE-CREAD ( -- c )
                                    339 ;---------------------------------------
      009CA4 9C 85                  340 	.word LINK 
                           001C26   341 	LINK=.
      009CA6 08                     342 	.byte 8
      009CA7 45 45 2D 43 52 45 41   343 	.ascii "EE-CREAD" 
             44
      009CAF                        344 EE_CREAD:
      009CAF 1D 00 02         [ 2]  345 	subw x,#CELLL 
      009CB2 92 BC 00 32      [ 5]  346 	ldf a,[FPTR]	
      009CB6 CD 9C 5A         [ 4]  347 	call INC_FPTR
      009CB9 90 5F            [ 1]  348 	clrw y 
      009CBB 90 97            [ 1]  349 	ld yl,a 
      009CBD FF               [ 2]  350 	ldw (x),y 
      009CBE 81               [ 4]  351 	ret 
                                    352 
                                    353 ;----------------------------
                                    354 ; write a byte at address pointed 
                                    355 ; by FPTR and increment FPTR.
                                    356 ; Expect pointer already initialized 
                                    357 ; and memory unlocked 
                                    358 ; WR-BYTE ( c -- )
                                    359 ;----------------------------
      009CBF 9C A6                  360 	.word LINK 
                           001C41   361 	LINK=. 
      009CC1 07                     362 	.byte 7 
      009CC2 57 52 2D 42 59 54 45   363 	.ascii "WR-BYTE" 
                                    364 
      009CC9                        365 WR_BYTE:
      009CC9 90 93            [ 1]  366 	ldw y,x 
      009CCB 90 FE            [ 2]  367 	ldw y,(y)
      009CCD 1C 00 02         [ 2]  368 	addw x,#CELLL 
      009CD0 90 9F            [ 1]  369 	ld a,yl
      009CD2 92 BD 00 32      [ 4]  370 	ldf [FPTR],a
      009CD6 72 05 50 5F FB   [ 2]  371 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009CDB CC 9C 5A         [ 2]  372 	jp INC_FPTR 
                                    373 
                                    374 ;---------------------------------------
                                    375 ; write a word at address pointed 
                                    376 ; by FPTR and increment FPTR 
                                    377 ; Expect pointer already initialzed 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



                                    378 ; and memory unlocked 
                                    379 ; WR-WORD ( w -- )
                                    380 ;---------------------------------------
      009CDE 9C C1                  381 	.word LINK 
                           001C60   382 	LINK=.
      009CE0 07                     383 	.byte 7 
      009CE1 57 52 2D 57 4F 52 44   384 	.ascii "WR-WORD" 
      009CE8                        385 WR_WORD:
      009CE8 90 93            [ 1]  386 	ldw y,x
      009CEA 90 FE            [ 2]  387 	ldw y,(y)
      009CEC 1C 00 02         [ 2]  388 	addw x,#CELLL 
      009CEF 90 9E            [ 1]  389 	ld a,yh 
      009CF1 92 BD 00 32      [ 4]  390 	ldf [FPTR],a
      009CF5 72 05 50 5F FB   [ 2]  391 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009CFA CD 9C 5A         [ 4]  392 	call INC_FPTR 
      009CFD 90 9F            [ 1]  393 	ld a,yl 
      009CFF 92 BD 00 32      [ 4]  394 	ldf [FPTR],a
      009D03 72 05 50 5F FB   [ 2]  395 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009D08 CC 9C 5A         [ 2]  396 	jp INC_FPTR 
                                    397 
                                    398 
                                    399 ;---------------------------------------
                                    400 ; write a byte to FLASH or EEPROM/OPTION  
                                    401 ; EEC!  (c ud -- )
                                    402 ;---------------------------------------
      009D0B 9C E0                  403     .word LINK 
                           001C8D   404 	LINK=.
      009D0D 04                     405     .byte 4 
      009D0E 45 45 43 21            406     .ascii "EEC!"
                                    407 	; local variables 
                           000001   408 	BTW = 1   ; byte to write offset on stack
                           000002   409     OPT = 2 
                           000002   410 	VSIZE = 2
      009D12                        411 ee_cstore:
      009D12 52 02            [ 2]  412 	sub sp,#VSIZE
      009D14 CD 9A E0         [ 4]  413     call PSTO
      009D17 E6 01            [ 1]  414 	ld a,(1,x)
      009D19 43               [ 1]  415 	cpl a 
      009D1A 6B 01            [ 1]  416 	ld (BTW,sp),a ; byte to write 
      009D1C 0F 02            [ 1]  417 	clr (OPT,sp)  ; OPTION flag
      009D1E CD 9C 1E         [ 4]  418 	call UNLOCK 
                                    419 	; check if option
      009D21 3D 32            [ 1]  420 	tnz FPTR 
      009D23 26 19            [ 1]  421 	jrne 2$
      009D25 90 BE 33         [ 2]  422 	ldw y,PTR16 
      009D28 90 A3 48 00      [ 2]  423 	cpw y,#OPTION_BASE
      009D2C 2B 10            [ 1]  424 	jrmi 2$
      009D2E 90 A3 48 80      [ 2]  425 	cpw y,#OPTION_END+1
      009D32 2A 0A            [ 1]  426 	jrpl 2$
      009D34 03 02            [ 1]  427 	cpl (OPT,sp)
                                    428 	; OPTION WRITE require this UNLOCK 
      009D36 72 1E 50 5B      [ 1]  429     bset FLASH_CR2,#FLASH_CR2_OPT
      009D3A 72 1F 50 5C      [ 1]  430     bres FLASH_NCR2,#FLASH_CR2_OPT 
      009D3E                        431 2$: 
      009D3E CD 9C C9         [ 4]  432 	call WR_BYTE 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      009D41 0D 02            [ 1]  433 	tnz (OPT,sp)
      009D43 27 0D            [ 1]  434 	jreq 3$ 
      009D45 7B 01            [ 1]  435     ld a,(BTW,sp)
      009D47 90 5F            [ 1]  436     clrw y
      009D49 90 97            [ 1]  437 	ld yl,a 
      009D4B 1D 00 02         [ 2]  438 	subw x,#CELLL 
      009D4E FF               [ 2]  439 	ldw (x),y 
      009D4F CD 9C C9         [ 4]  440 	call WR_BYTE
      009D52                        441 3$: 
      009D52 CD 9C 46         [ 4]  442 	call LOCK 
      009D55 5B 02            [ 2]  443 	addw sp,#VSIZE 
      009D57 81               [ 4]  444     ret
                                    445 
                                    446 ;------------------------------
                                    447 ; write integer in FLASH|EEPROM
                                    448 ; EE! ( n ud -- )
                                    449 ;------------------------------
      009D58 9D 0D                  450 	.word LINK 
                           001CDA   451 	LINK=.
      009D5A 03                     452 	.byte 3 
      009D5B 45 45 21               453 	.ascii "EE!"
      009D5E                        454 ee_store:
      009D5E CD 9A E0         [ 4]  455 	call PSTO 
      009D61 CD 9C 1E         [ 4]  456 	call UNLOCK 
      009D64 90 93            [ 1]  457 	ldw y,x 
      009D66 90 FE            [ 2]  458 	ldw y,(y)
      009D68 90 89            [ 2]  459 	pushw y 
      009D6A 90 5E            [ 1]  460 	swapw y 
      009D6C FF               [ 2]  461 	ldw (x),y 
      009D6D CD 9C C9         [ 4]  462 	call WR_BYTE 
      009D70 90 85            [ 2]  463 	popw y 
      009D72 1D 00 02         [ 2]  464 	subw x,#CELLL
      009D75 FF               [ 2]  465 	ldw (x),y 
      009D76 CD 9C C9         [ 4]  466 	call WR_BYTE
      009D79 CC 9C 46         [ 2]  467 	jp LOCK 
                                    468 
                                    469 
                                    470 ;----------------------------
                                    471 ; Erase flash memory row 
                                    472 ; stm8s208 as 128 bytes rows
                                    473 ; ROW-ERASE ( ud -- )
                                    474 ;----------------------------
      009D7C 9D 5A                  475 	.word LINK 
                           001CFE   476 	LINK=. 
      009D7E 09                     477 	.byte 9 
      009D7F 52 4F 57 2D 45 52 41   478 	.ascii "ROW-ERASE" 
             53 45
      009D88                        479 row_erase:
      009D88 CD 9A E0         [ 4]  480 	call PSTO
                                    481 ;code must be execute from RAM 
                                    482 ;copy routine to PAD 
      009D8B 1D 00 02         [ 2]  483 	subw x,#CELLL 
      009D8E 90 AE 9D D5      [ 2]  484 	ldw y,#row_erase_proc
      009D92 FF               [ 2]  485 	ldw (x),y 
      009D93 CD 8B B9         [ 4]  486 	call PAD 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



      009D96 90 AE 9D FC      [ 2]  487 	ldw y,#row_erase_proc_end 
      009D9A 72 A2 9D D5      [ 2]  488 	subw y,#row_erase_proc
      009D9E 1D 00 02         [ 2]  489 	subw x,#CELLL 
      009DA1 FF               [ 2]  490 	ldw (x),y 
      009DA2 CD 8B F5         [ 4]  491 	call CMOVE 
      009DA5                        492 block_erase:
      009DA5 90 BE 33         [ 2]  493 	ldw y,FPTR+1
      009DA8 90 A3 A4 00      [ 2]  494 	cpw y,#app_space 
      009DAC 2A 13            [ 1]  495 	jrpl erase_flash 
                                    496 ; erase EEPROM block
      009DAE 90 A3 40 00      [ 2]  497 	cpw y,#EEPROM_BASE 
      009DB2 24 01            [ 1]  498 	jruge 1$
      009DB4 81               [ 4]  499 	ret ; bad address 
      009DB5 90 A3 47 FF      [ 2]  500 1$: cpw y,#EEPROM_END 
      009DB9 23 01            [ 2]  501 	jrule 2$ 
      009DBB 81               [ 4]  502 	ret ; bad address 
      009DBC                        503 2$:	
      009DBC CD 9B E0         [ 4]  504 	call unlock_eeprom 
      009DBF 20 03            [ 2]  505 	jra proceed_erase
                                    506 ; erase flash block:
      009DC1                        507 erase_flash:
      009DC1 CD 9B FF         [ 4]  508 	call unlock_flash 
      009DC4                        509 proceed_erase:
      009DC4 CD 8B B9         [ 4]  510 	call PAD 
      009DC7 90 93            [ 1]  511 	ldw y,x
      009DC9 90 FE            [ 2]  512 	ldw y,(y)
      009DCB 1C 00 02         [ 2]  513 	addw x,#CELLL  
      009DCE 90 FD            [ 4]  514 	call (y) 
      009DD0 72 17 50 5F      [ 1]  515 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009DD4 81               [ 4]  516 	ret 
                                    517 
                                    518 ; this routine is to be copied to PAD 
      009DD5                        519 row_erase_proc:
      009DD5 35 20 50 5B      [ 1]  520 	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
      009DD9 35 DF 50 5C      [ 1]  521 	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
      009DDD 4F               [ 1]  522 	clr a 
      009DDE 90 5F            [ 1]  523 	clrw y 
      009DE0 91 A7 00 32      [ 1]  524 	ldf ([FPTR],y),a
      009DE4 90 5C            [ 2]  525     incw y
      009DE6 91 A7 00 32      [ 1]  526 	ldf ([FPTR],y),a
      009DEA 90 5C            [ 2]  527     incw y
      009DEC 91 A7 00 32      [ 1]  528 	ldf ([FPTR],y),a
      009DF0 90 5C            [ 2]  529     incw y
      009DF2 91 A7 00 32      [ 1]  530 	ldf ([FPTR],y),a
      009DF6 72 05 50 5F FB   [ 2]  531 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009DFB 81               [ 4]  532 	ret
      009DFC                        533 row_erase_proc_end:
                                    534 
                                    535 
                                    536 ;-----------------------------------
                                    537 ; block programming must be 
                                    538 ; executed from RAM 
                                    539 ; initial contidions: 
                                    540 ; 		memory unlocked
                                    541 ;       FPTR initialized 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



                                    542 ; input: 
                                    543 ;    x   buffer address 
                                    544 ;-----------------------------------
                           000001   545 	BCNT=1 
      009DFC                        546 copy_buffer:
      009DFC 4B 80            [ 1]  547 	push #BLOCK_SIZE  
                                    548 ;enable block programming 
      009DFE 72 10 50 5B      [ 1]  549 	bset FLASH_CR2,#FLASH_CR2_PRG 
      009E02 72 11 50 5C      [ 1]  550 	bres FLASH_NCR2,#FLASH_CR2_PRG
      009E06 90 5F            [ 1]  551 	clrw y
      009E08 F6               [ 1]  552 1$:	ld a,(x)
      009E09 91 A7 00 32      [ 1]  553 	ldf ([FPTR],y),a
      009E0D 5C               [ 2]  554 	incw x 
      009E0E 90 5C            [ 2]  555 	incw y 
      009E10 0A 01            [ 1]  556 	dec (BCNT,sp)
      009E12 26 F4            [ 1]  557 	jrne 1$
                                    558 ; wait EOP bit 
      009E14 72 05 50 5F FB   [ 2]  559 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. 
      009E19 84               [ 1]  560 	pop a ; remove BCNT from stack 
      009E1A 81               [ 4]  561 	ret 
      009E1B                        562 copy_buffer_end:
                                    563 
                                    564 ;-------------------------
                                    565 ; move program_row to RAM 
                                    566 ; in TIB 
                                    567 ;------------------------
      009E1B                        568 copy_prog_to_ram:
      009E1B 1D 00 06         [ 2]  569 	subw x,#6
      009E1E 90 AE 9D FC      [ 2]  570 	ldw y,#copy_buffer 
      009E22 EF 04            [ 2]  571 	ldw (4,x),y 
      009E24 90 AE 17 00      [ 2]  572 	ldw y,#TIBBASE
      009E28 EF 02            [ 2]  573 	ldw (2,x),y 
      009E2A 90 AE 9E 1B      [ 2]  574 	ldw y,#copy_buffer_end 
      009E2E 72 A2 9D FC      [ 2]  575 	subw y,#copy_buffer  
      009E32 FF               [ 2]  576 	ldw (x),y 
      009E33 CD 8B F5         [ 4]  577 	call CMOVE 
      009E36 81               [ 4]  578 	ret 
                                    579 
                                    580 
                                    581 ;-----------------------------
                                    582 ; write a row in FLASH/EEPROM 
                                    583 ; WR-ROW ( a ud -- )
                                    584 ; a -> address 128 byte buffer to write 
                                    585 ; ud ->  row address in FLASH|EEPROM 
                                    586 ;-----------------------------
      009E37 9D 7E                  587 	.word LINK 
                           001DB9   588 	LINK=.
      009E39 06                     589 	.byte 6 
      009E3A 57 52 2D 52 4F 57      590 	.ascii "WR-ROW"
      009E40                        591 write_row:
      009E40 CD 9A E0         [ 4]  592 	call PSTO
                                    593 ; align to FLASH block 
      009E43 A6 80            [ 1]  594 	ld a,#0x80 
      009E45 B4 34            [ 1]  595 	and a,PTR8 
      009E47 B7 34            [ 1]  596 	ld PTR8,a  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



      009E49 CD 9E 1B         [ 4]  597 	call copy_prog_to_ram
      009E4C CD 9C 1E         [ 4]  598 	call UNLOCK
      009E4F 90 93            [ 1]  599 	ldw y,x 
      009E51 90 FE            [ 2]  600 	ldw y,(y)
      009E53 1C 00 02         [ 2]  601 	addw x,#CELLL 
      009E56 89               [ 2]  602 	pushw x 
      009E57 93               [ 1]  603 	ldw x,y ; buffer address in x 
      009E58 CD 17 00         [ 4]  604 	call TIBBASE
      009E5B CD 9C 46         [ 4]  605 	call LOCK
      009E5E 85               [ 2]  606 	popw x 
      009E5F 81               [ 4]  607 	ret 
                                    608 
                                    609 ;-------------------------------------
                                    610 ; change value of OPTION register 
                                    611 ; SET-OPT (c n -- ) 
                                    612 ; c new value.
                                    613 ; n OPT  number {1..7}
                                    614 ;--------------------------------------
      009E60 9E 39                  615 		.word LINK 
                           001DE2   616 		LINK=.
      009E62 07                     617 		.byte 7 
      009E63 53 45 54 2D 4F 50 54   618 		.ascii "SET-OPT" 
      009E6A                        619 set_option: 
      009E6A 90 93            [ 1]  620 		ldw y,x 
      009E6C 90 FE            [ 2]  621 		ldw y,(y)
      009E6E 27 06            [ 1]  622 		jreq 1$
      009E70 90 A3 00 07      [ 2]  623 		cpw y,#7 
      009E74 23 04            [ 2]  624 		jrule 2$ 
                                    625 ; invalid OPTION number 		
      009E76 1C 00 04         [ 2]  626 1$:		addw x,#2*CELLL
      009E79 81               [ 4]  627 		ret
      009E7A 90 58            [ 2]  628 2$:		sllw y 
      009E7C 72 A9 47 FF      [ 2]  629 		addw y,#OPTION_BASE-1
      009E80 FF               [ 2]  630 		ldw (x),y 
      009E81 1D 00 02         [ 2]  631 		subw x,#CELLL 
      009E84 90 5F            [ 1]  632 		clrw y 
      009E86 FF               [ 2]  633 		ldw (x),y 
      009E87 CD 9D 12         [ 4]  634 		call ee_cstore
      009E8A 81               [ 4]  635 		ret 
                                    636 
                                    637 
                                    638 
                                    639 ;--------------------------------------
                                    640 ; reset system to its original state 
                                    641 ; before any user modification
                                    642 ; PRISTINE ( -- )
                                    643 ;-------------------------------------
      009E8B 9E 62                  644 	.word LINK  
                           001E0D   645 	LINK=.
      009E8D 08                     646 	.byte 8 
      009E8E 50 52 49 53 54 49 4E   647 	.ascii "PRISTINE"
             45
      009E96                        648 pristine:
                                    649 ;;; erase EEPROM
      009E96 CD 9A FF         [ 4]  650 	call EEPROM 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



      009E99 CD 87 3F         [ 4]  651 1$:	call DDUP 
      009E9C CD 9D 88         [ 4]  652 	call row_erase
      009E9F 90 93            [ 1]  653 	ldw y,x 
      009EA1 90 EE 02         [ 2]  654 	ldw y,(2,y)
      009EA4 72 A9 00 80      [ 2]  655 	addw y,#BLOCK_SIZE
      009EA8 EF 02            [ 2]  656 	ldw (2,x),y
      009EAA 90 A3 48 00      [ 2]  657 	cpw y,#OPTION_BASE 
      009EAE 25 E9            [ 1]  658 	jrult 1$
                                    659 ;;; reset OPTION to default values
      009EB0 90 AE 00 01      [ 2]  660 	ldw y,#1 ; OPT1 
      009EB4 FF               [ 2]  661 2$:	ldw (x),y   
      009EB5 90 5F            [ 1]  662 	clrw y 
      009EB7 EF 02            [ 2]  663 	ldw (2,x),y  ; ( 0 1 -- ) 
      009EB9 CD 87 3F         [ 4]  664 	call DDUP    ; ( 0 1 0 1 -- )  
      009EBC CD 9E 6A         [ 4]  665 	call set_option
      009EBF 90 93            [ 1]  666 	ldw y,x 
      009EC1 90 FE            [ 2]  667 	ldw y,(y)
      009EC3 90 5C            [ 2]  668 	incw y  ; next OPTION 
      009EC5 90 A3 00 08      [ 2]  669 	cpw y,#8 
      009EC9 25 E9            [ 1]  670 	jrult 2$
                                    671 ;;; erase first row of app_space 	
      009ECB 90 AE A4 00      [ 2]  672 	ldw y,#app_space
      009ECF EF 02            [ 2]  673 	ldw (2,x),y  
      009ED1 90 5F            [ 1]  674 	clrw y 
      009ED3 FF               [ 2]  675 	ldw (x),y ; ( app_space 0 -- )
      009ED4 CD 9D 88         [ 4]  676 	call row_erase 
                                    677 ; reset interrupt vectors 
      009ED7 1D 00 02         [ 2]  678 	subw x,#CELLL 
      009EDA 90 5F            [ 1]  679 	clrw y  
      009EDC FF               [ 2]  680 4$:	ldw (x),y  ; ( n -- ) int# 
      009EDD CD 85 59         [ 4]  681 	call DUPP  
      009EE0 CD 9E FD         [ 4]  682 	call reset_vector
      009EE3 90 93            [ 1]  683 	ldw y,x 
      009EE5 90 FE            [ 2]  684 	ldw y,(y)
      009EE7 90 5C            [ 2]  685 	incw y   ; next vector 
      009EE9 90 A3 00 19      [ 2]  686 	cpw y,#25 
      009EED 25 ED            [ 1]  687 	jrult 4$
      009EEF CC 80 80         [ 2]  688 	jp NonHandledInterrupt ; reset MCU
                                    689 
                                    690 ;------------------------------
                                    691 ; reset an interrupt vector 
                                    692 ; to its initial value 
                                    693 ; i.e. NonHandledInterrupt
                                    694 ; RST-IVEC ( n -- )
                                    695 ;-----------------------------
      009EF2 9E 8D                  696 	.word LINK 
                           001E74   697 	LINK=. 
      009EF4 08                     698 	.byte 8 
      009EF5 52 53 54 2D 49 56 45   699 	.ascii "RST-IVEC"
             43
      009EFD                        700 reset_vector:
      009EFD 90 93            [ 1]  701 	ldw y,x
      009EFF 1C 00 02         [ 2]  702 	addw x,#CELLL 
      009F02 90 FE            [ 2]  703 	ldw y,(y)
      009F04 90 A3 00 17      [ 2]  704 	cpw y,#23 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



      009F08 27 3A            [ 1]  705 	jreq 9$
      009F0A 90 A3 00 1D      [ 2]  706 	cpw y,#29 ; last vector
      009F0E 22 34            [ 1]  707 	jrugt 9$  
      009F10 90 58            [ 2]  708 	sllw y 
      009F12 90 58            [ 2]  709 	sllw y 
      009F14 72 A9 80 08      [ 2]  710 	addw y,#0x8008 ; irq0 address 
      009F18 90 BF 24         [ 2]  711 	ldw YTEMP,y
      009F1B 1D 00 06         [ 2]  712 	subw x,#3*CELLL 
      009F1E EF 02            [ 2]  713 	ldw (2,x),y 
      009F20 90 5F            [ 1]  714 	clrw y
      009F22 FF               [ 2]  715 	ldw (x),y 
      009F23 A6 82            [ 1]  716 	ld a,#0x82 
      009F25 90 95            [ 1]  717 	ld yh,a
      009F27 EF 04            [ 2]  718 	ldw (4,x),y
      009F29 CD 9D 5E         [ 4]  719 	call ee_store
      009F2C 1D 00 06         [ 2]  720 	subw x,#3*CELLL
      009F2F 90 5F            [ 1]  721 	clrw y 
      009F31 FF               [ 2]  722 	ldw (x),y 
      009F32 90 AE 80 80      [ 2]  723 	ldw y,#NonHandledInterrupt
      009F36 EF 04            [ 2]  724 	ldw (4,x),y 
      009F38 90 BE 24         [ 2]  725 	ldw y,YTEMP  
      009F3B 72 A9 00 02      [ 2]  726 	addw y,#2
      009F3F EF 02            [ 2]  727 	ldw (2,x),y 
      009F41 CD 9D 5E         [ 4]  728 	call ee_store
      009F44 81               [ 4]  729 9$:	ret 
                                    730 
                                    731 
                                    732 ;------------------------------
                                    733 ; all interrupt vector with 
                                    734 ; an address >= a are resetted 
                                    735 ; to default
                                    736 ; CHKIVEC ( a -- )
                                    737 ;------------------------------
      009F45 9E F4                  738 	.word LINK 
                           001EC7   739 	LINK=.
      009F47 07                     740 	.byte 7
      009F48 43 48 4B 49 56 45 43   741 	.ascii "CHKIVEC"
                                    742 ;local variables 
                           000001   743 	SSP=1
                           000003   744 	CADR=3
                           000005   745 	OFS=5
                           000006   746 	VSIZE=6  
      009F4F                        747 CHKIVEC:
      009F4F 52 06            [ 2]  748 	sub sp,#VSIZE ;alloc local variables 
      009F51 90 93            [ 1]  749 	ldw y,x 
      009F53 90 FE            [ 2]  750 	ldw y,(y)
      009F55 17 03            [ 2]  751 	ldw (CADR,sp),y ; ca 
      009F57 1F 01            [ 2]  752 	ldw (SSP,sp),x 
      009F59 AE 80 0A         [ 2]  753 	ldw x,#0x800a ; irq0 address 
      009F5C BF 33            [ 2]  754 	ldw PTR16,X
      009F5E AE FF FC         [ 2]  755 	ldw x,#-4 
      009F61 1C 00 04         [ 2]  756 1$:	addw x,#4
      009F64 A3 00 78         [ 2]  757 	cpw x,#30*4 ; irq0-29 
      009F67 27 22            [ 1]  758 	jreq 9$
      009F69 90 93            [ 1]  759 	ldw y,x  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



      009F6B 91 D6 33         [ 4]  760 	ld a,([PTR16],y)
      009F6E 11 03            [ 1]  761 	cp a,(CADR,sp)
      009F70 25 EF            [ 1]  762 	jrult 1$
      009F72 90 5C            [ 2]  763 	incw y 
      009F74 91 D6 33         [ 4]  764 	ld a,([PTR16],y)
      009F77 11 04            [ 1]  765 	cp a,(CADR+1,sp) 
      009F79 25 E6            [ 1]  766 	jrult 1$ 
      009F7B 1F 05            [ 2]  767 	ldw (OFS,sp),x 
      009F7D 54               [ 2]  768 	srlw x
      009F7E 54               [ 2]  769 	srlw x 
      009F7F 90 93            [ 1]  770 	ldw y,x 
      009F81 1E 01            [ 2]  771 	ldw x,(SSP,sp)
      009F83 FF               [ 2]  772 	ldw (x),y
      009F84 CD 9E FD         [ 4]  773 	call reset_vector
      009F87 1E 05            [ 2]  774 	ldw x,(OFS,sp) 
      009F89 20 D6            [ 2]  775 	jra 1$
      009F8B 1E 01            [ 2]  776 9$:	ldw x,(SSP,sp) 
      009F8D 1C 00 02         [ 2]  777 	addw x,#CELLL 
      009F90 5B 06            [ 2]  778 	addw sp,#VSIZE ; drop local variables  
      009F92 81               [ 4]  779 	ret 
                                    780 
                                    781 ;------------------------------
                                    782 ; set interrupt vector 
                                    783 ; SET-IVEC ( ud n -- )
                                    784 ;  ud Handler address
                                    785 ;  n  vector # 0 .. 29 
                                    786 ;-----------------------------
      009F93 9F 47                  787 	.word LINK
                           001F15   788 	LINK=.
      009F95 08                     789 	.byte 8 
      009F96 53 45 54 2D 49 56 45   790 	.ascii "SET-IVEC" 
             43
      009F9E                        791 set_vector:
      009F9E 90 93            [ 1]  792     ldw y,x 
      009FA0 1C 00 02         [ 2]  793 	addw x,#CELLL 
      009FA3 90 FE            [ 2]  794 	ldw y,(y) ; vector #
      009FA5 90 A3 00 1D      [ 2]  795 	cpw y,#29 ; last vector
      009FA9 23 04            [ 2]  796 	jrule 2$
      009FAB 1C 00 04         [ 2]  797 	addw x,#2*CELLL 
      009FAE 81               [ 4]  798 	ret
      009FAF 90 58            [ 2]  799 2$:	sllw y 
      009FB1 90 58            [ 2]  800 	sllw y 
      009FB3 72 A9 80 08      [ 2]  801 	addw y,#0X8008 ; IRQ0 vector address 
      009FB7 90 BF 24         [ 2]  802 	ldw YTEMP,y ; vector address 
      009FBA A6 82            [ 1]  803 	ld a,#0x82 
      009FBC 90 95            [ 1]  804 	ld yh,a 
      009FBE E6 01            [ 1]  805 	ld a,(1,x) ; isr address bits 23..16 
      009FC0 90 97            [ 1]  806 	ld yl,a 
                                    807 ;  write 0x82 + most significant byte of int address	
      009FC2 1D 00 06         [ 2]  808 	subw x,#3*CELLL 
      009FC5 EF 04            [ 2]  809 	ldw (4,x),y 
      009FC7 90 BE 24         [ 2]  810 	ldw y,YTEMP
      009FCA EF 02            [ 2]  811 	ldw (2,x),y ; vector address 
      009FCC 90 5F            [ 1]  812 	clrw y 
      009FCE FF               [ 2]  813 	ldw (x),y   ; as a double 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



      009FCF CD 9D 5E         [ 4]  814 	call ee_store 
      009FD2 90 93            [ 1]  815 	ldw y,x 
      009FD4 90 EE 02         [ 2]  816 	ldw y,(2,y) ; bits 15..0 int vector 
      009FD7 1D 00 06         [ 2]  817 	subw x,#3*CELLL 
      009FDA EF 04            [ 2]  818 	ldw (4,x),y 
      009FDC 90 BE 24         [ 2]  819 	ldw y,YTEMP 
      009FDF 72 A9 00 02      [ 2]  820 	addw y,#2 
      009FE3 EF 02            [ 2]  821 	ldw (2,x),y 
      009FE5 90 5F            [ 1]  822 	clrw y 
      009FE7 FF               [ 2]  823 	ldw (x),y 
      009FE8 CD 9D 5E         [ 4]  824 	call ee_store
      009FEB 1C 00 04         [ 2]  825 	addw x,#2*CELLL  
      009FEE 81               [ 4]  826 9$: ret 
                                    827 
                                    828 
                                    829 ;------------------------
                                    830 ; Compile word to flash
                                    831 ; EE, (w -- )
                                    832 ;-----------------------
      009FEF 9F 95                  833 	.word LINK
                           001F71   834 	LINK=.
      009FF1 03                     835 	.byte 3
      009FF2 45 45 2C               836 	.ascii "EE,"
      009FF5                        837 EE_COMMA:
      009FF5 1D 00 04         [ 2]  838 	subw x,#2*CELLL 
      009FF8 90 BE 18         [ 2]  839 	ldw y,UCP
      009FFB 90 89            [ 2]  840 	pushw y 
      009FFD EF 02            [ 2]  841 	ldw (2,x),y 
      009FFF 90 5F            [ 1]  842 	clrw y 
      00A001 FF               [ 2]  843 	ldw (x),y
      00A002 CD 9D 5E         [ 4]  844 	call ee_store
      00A005 90 85            [ 2]  845 	popw y 
      00A007 72 A9 00 02      [ 2]  846 	addw y,#2
      00A00B 90 BF 18         [ 2]  847 	ldw UCP,y
      00A00E 81               [ 4]  848 	ret 
                                    849 
                                    850 
                                    851 ;-------------------------
                                    852 ; Compile byte to flash 
                                    853 ; EEC, ( c -- )	
                                    854 ;-------------------------
      00A00F 9F F1                  855 	.word LINK 
                           001F91   856 	LINK=.
      00A011 04                     857 	.byte 4 
      00A012 45 45 43 2C            858 	.ascii "EEC,"
      00A016                        859 EE_CCOMMA:
      00A016 1D 00 04         [ 2]  860 	subw x,#2*CELLL 
      00A019 90 BE 18         [ 2]  861 	ldw y,UCP
      00A01C 90 89            [ 2]  862 	pushw y 
      00A01E EF 02            [ 2]  863 	ldw (2,x),y 
      00A020 90 5F            [ 1]  864 	clrw y 
      00A022 FF               [ 2]  865 	ldw (x),y
      00A023 CD 9D 12         [ 4]  866 	call ee_cstore
      00A026 90 85            [ 2]  867 	popw y 
      00A028 90 5C            [ 2]  868 	incw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



      00A02A 90 BF 18         [ 2]  869 	ldw UCP,y
      00A02D 81               [ 4]  870 	ret 
                                    871 
                                    872 
                                    873 ;--------------------------
                                    874 ; copy FLASH block to ROWBUF
                                    875 ; ROW>BUF ( ud -- )
                                    876 ;--------------------------
      00A02E A0 11                  877 	.word LINK 
                           001FB0   878 	LINK=.
      00A030 07                     879 	.byte 7 
      00A031 52 4F 57 3E 42 55 46   880 	.ascii "ROW>BUF"
      00A038                        881 ROW2BUF: 
      00A038 CD 9A E0         [ 4]  882 	call PSTO 
      00A03B A6 80            [ 1]  883 	ld a,#BLOCK_SIZE
      00A03D 88               [ 1]  884 	push a 
      00A03E B4 34            [ 1]  885 	and a,PTR8 ; block align 
      00A040 B7 34            [ 1]  886 	ld PTR8,a
      00A042 90 AE 16 80      [ 2]  887 	ldw y,#ROWBUFF 
      00A046 92 BC 00 32      [ 5]  888 1$: ldf a,[FPTR]
      00A04A 90 F7            [ 1]  889 	ld (y),a
      00A04C CD 9C 5A         [ 4]  890 	call INC_FPTR
      00A04F 90 5C            [ 2]  891 	incw y 
      00A051 0A 01            [ 1]  892 	dec (1,sp)
      00A053 26 F1            [ 1]  893 	jrne 1$ 
      00A055 84               [ 1]  894 	pop a 
      00A056 81               [ 4]  895 	ret 
                                    896 
                                    897 
                                    898 ;---------------------------
                                    899 ; copy ROWBUFF to flash 
                                    900 ; BUF>ROW ( ud -- )
                                    901 ; ud is row address as double 
                                    902 ;---------------------------
      00A057 A0 30                  903 	.word LINK 
                           001FD9   904 	LINK=.
      00A059 07                     905 	.byte 7 
      00A05A 42 55 46 3E 52 4F 57   906 	.ascii "BUF>ROW" 
      00A061                        907 BUF2ROW:
      00A061 CD 86 54         [ 4]  908 	call TBUF ; ( ud rb -- )
      00A064 CD 87 14         [ 4]  909 	call ROT 
      00A067 CD 87 14         [ 4]  910 	call ROT  ; ( rb ud -- )
      00A06A CD 9E 40         [ 4]  911 	call write_row 
      00A06D 81               [ 4]  912 	ret 
                                    913 
                                    914 ;---------------------------------
                                    915 ; how many byte free in that row 
                                    916 ; RFREE ( a -- n )
                                    917 ; a is least byte of target address
                                    918 ;----------------------------------
      00A06E A0 59                  919 	.word LINK 
                           001FF0   920 	LINK=.
      00A070 05                     921 	.byte 5 
      00A071 52 46 52 45 45         922 	.ascii "RFREE"
      00A076                        923 RFREE:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



      00A076 E6 01            [ 1]  924 	ld a,(1,x)
      00A078 A4 7F            [ 1]  925 	and a,#BLOCK_SIZE-1 
      00A07A B7 24            [ 1]  926 	ld YTEMP,a 
      00A07C A6 80            [ 1]  927 	ld a,#BLOCK_SIZE 
      00A07E B0 24            [ 1]  928 	sub a,YTEMP 
      00A080 90 5F            [ 1]  929 	clrw y 
      00A082 90 97            [ 1]  930 	ld yl,a
      00A084 FF               [ 2]  931 	ldw (x),y 
      00A085 81               [ 4]  932 	ret 
                                    933 
                                    934 ;---------------------------------
                                    935 ; write u bytes to flash/EEPROM 
                                    936 ; constraint to row limit 
                                    937 ; RAM>EE ( ud a u -- u2 )
                                    938 ; ud flash address 
                                    939 ; a ram address 
                                    940 ; u bytes count
                                    941 ; return u2 bytes written  
                                    942 ;-------------------------------
      00A086 A0 70                  943 	.word LINK 
                           002008   944 	LINK=. 
      00A088 06                     945 	.byte 6
      00A089 52 41 4D 3E 45 45      946 	.ascii "RAM>EE"
                                    947 	
      00A08F                        948 RAM2EE:
                                    949 ; copy ud on top 
      00A08F 90 93            [ 1]  950 	ldw y,x 
      00A091 90 EE 06         [ 2]  951 	ldw y,(6,y) ; LSW of ud  
      00A094 90 BF 24         [ 2]  952 	ldw YTEMP,y 
      00A097 90 93            [ 1]  953 	ldw y,x 
      00A099 90 EE 04         [ 2]  954 	ldw y,(4,y)  ; MSW of ud 
      00A09C 1D 00 04         [ 2]  955 	subw x,#2*CELLL 
      00A09F FF               [ 2]  956 	ldw (x),y 
      00A0A0 90 BE 24         [ 2]  957 	ldw y,YTEMP 
      00A0A3 EF 02            [ 2]  958 	ldw (2,x),y 
      00A0A5 CD A0 38         [ 4]  959 	call ROW2BUF 
      00A0A8 90 93            [ 1]  960 	ldw y,x 
      00A0AA 90 EE 06         [ 2]  961 	ldw y,(6,y)
      00A0AD 90 89            [ 2]  962 	pushw y ; udl 
      00A0AF 90 9F            [ 1]  963 	ld a,yl
      00A0B1 A4 7F            [ 1]  964 	and a,#BLOCK_SIZE-1 
      00A0B3 90 5F            [ 1]  965 	clrw y 
      00A0B5 90 97            [ 1]  966 	ld yl,a 
      00A0B7 72 A9 16 80      [ 2]  967 	addw y,#ROWBUFF 
      00A0BB 1D 00 02         [ 2]  968 	subw x,#CELLL 
      00A0BE FF               [ 2]  969 	ldw (x),y  
      00A0BF CD 85 69         [ 4]  970 	call SWAPP ;  ( ud a ra u -- )
      00A0C2 CD 85 03         [ 4]  971 	call RFROM  
      00A0C5 CD A0 76         [ 4]  972 	call RFREE 
      00A0C8 CD 88 6F         [ 4]  973 	call MIN
      00A0CB CD 85 59         [ 4]  974 	call DUPP 
      00A0CE CD 85 22         [ 4]  975 	call TOR  
      00A0D1 CD 8B F5         [ 4]  976 	call CMOVE
      00A0D4 CD A0 61         [ 4]  977 	call BUF2ROW 
      00A0D7 CD 85 03         [ 4]  978 	call RFROM 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



      00A0DA 81               [ 4]  979 	ret 
                                    980 
                                    981 ;--------------------------
                                    982 ; expand 16 bit address 
                                    983 ; to 32 bit address 
                                    984 ; FADDR ( a -- ud )
                                    985 ;--------------------------
      00A0DB A0 88                  986 	.word LINK 
                           00205D   987 	LINK=. 
      00A0DD 05                     988 	.byte 5 
      00A0DE 46 41 44 44 52         989 	.ascii "FADDR"
      00A0E3                        990 FADDR:
      00A0E3 CC 8A BA         [ 2]  991 	jp ZERO 
                                    992 
                                    993 ;--------------------------
                                    994 ; move new colon definition to FLASH 
                                    995 ; using WR-ROW for efficiency 
                                    996 ; preserving bytes already used 
                                    997 ; in the current block. 
                                    998 ; At this point the compiler as completed
                                    999 ; in RAM and pointers CP and CNTXT updated.
                                   1000 ; CNTXT point to nfa of new word and  
                                   1001 ; CP is after compiled word so CP-CNTXT+2=count to write 
                                   1002 ; 
                                   1003 ; FMOVE ( -- cp+ )
                                   1004 ; 
                                   1005 ;--------------------------
      00A0E6 A0 DD                 1006 	.word LINK 
                           002068  1007 	LINK=.
      00A0E8 05                    1008 	.byte 5 
      00A0E9 46 4D 4F 56 45        1009 	.ascii "FMOVE" 
      00A0EE                       1010 FMOVE:
      00A0EE CD 86 66         [ 4] 1011 	call TFLASH 
      00A0F1 CD 84 B2         [ 4] 1012 	CALL AT 
      00A0F4 CD 84 67         [ 4] 1013 	CALL QBRAN 
      00A0F7 A1 72                 1014 	.word no_move  
      00A0F9 CD 86 B5         [ 4] 1015 	call CPP
      00A0FC CD 84 B2         [ 4] 1016 	call AT  
      00A0FF CD 85 59         [ 4] 1017 	call DUPP ; ( udl udl -- )
      00A102 CD 86 99         [ 4] 1018 	call CNTXT 
      00A105 CD 84 B2         [ 4] 1019 	call AT 
      00A108 CD 84 34         [ 4] 1020 	call DOLIT 
      00A10B 00 02                 1021 	.word 2 
      00A10D CD 87 CD         [ 4] 1022 	call SUBB ; ( udl udl a -- )
      00A110 CD 85 69         [ 4] 1023 	call SWAPP 
      00A113 CD A0 E3         [ 4] 1024 	call FADDR 
      00A116 CD 87 14         [ 4] 1025 	call ROT  ; ( udl ud a -- )
      00A119 CD 85 59         [ 4] 1026 	call DUPP 
      00A11C CD 85 22         [ 4] 1027 	call TOR    ; R: a 
      00A11F                       1028 FMOVE2: 
      00A11F CD 8B A8         [ 4] 1029 	call HERE 
      00A122 CD 85 16         [ 4] 1030 	call RAT 
      00A125 CD 87 CD         [ 4] 1031 	call SUBB ; (udl ud a wl -- )
      00A128                       1032 next_row:
      00A128 CD 85 59         [ 4] 1033 	call DUPP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



      00A12B CD 85 22         [ 4] 1034 	call TOR  ; ( udl ud a wl -- ) R: a wl
      00A12E CD A0 8F         [ 4] 1035 	call RAM2EE ; ( udl a u -- udl u2 ) u2 is byte written to FLASH 
      00A131 CD 85 59         [ 4] 1036 	call DUPP 
      00A134 CD 85 22         [ 4] 1037 	call TOR
      00A137 CD 87 54         [ 4] 1038 	call PLUS  ; ( udl+ ) 
      00A13A CD 85 59         [ 4] 1039 	call DUPP 
      00A13D CD 8A BA         [ 4] 1040 	call ZERO   ; ( udl+ ud -- )
      00A140 CD 85 03         [ 4] 1041 	call RFROM  ; ( udl+ ud u2  R: a wl ) 
      00A143 CD 85 03         [ 4] 1042 	call RFROM  ; ( udl+ ud u2 wl R: a ) 
      00A146 CD 85 83         [ 4] 1043 	call OVER   ; ( udl+ ud u2 wl u2 -- )
      00A149 CD 87 CD         [ 4] 1044 	call SUBB  ; ( udl+ ud u2 wl- R: a )
      00A14C CD 85 59         [ 4] 1045 	call DUPP 
      00A14F CD 84 67         [ 4] 1046 	call QBRAN
      00A152 A1 6B                 1047 	.word fmove_done 
      00A154 CD 85 69         [ 4] 1048 	call SWAPP  ; ( udl+ ud wl- u2 R: a )
      00A157 CD 85 03         [ 4] 1049 	call RFROM ; ( udl+ ud wl- u2 a -- ) 
      00A15A CD 87 54         [ 4] 1050 	call PLUS  ; ( udl+2 ud wl- a+ )
      00A15D CD 85 59         [ 4] 1051 	call DUPP 
      00A160 CD 85 22         [ 4] 1052 	call TOR   ; ( udl+2 ud wl- a+ ) R: a+
      00A163 CD 85 69         [ 4] 1053 	call SWAPP 
      00A166 CD 84 7E         [ 4] 1054 	call BRAN
      00A169 A1 28                 1055 	.word next_row  
      00A16B                       1056 fmove_done:	
      00A16B CD 85 03         [ 4] 1057 	call RFROM  ; ( -- udl+ ud u2 wl- a  )
      00A16E 1C 00 0A         [ 2] 1058 	addw x,#5*CELLL ; (  -- cp+ ) new CP 
      00A171 81               [ 4] 1059  	ret  
      00A172                       1060 no_move:
      00A172 CD 8A BA         [ 4] 1061 	call ZERO
      00A175 81               [ 4] 1062 	ret 
                                   1063 
                                   1064 ;------------------------------------------
                                   1065 ; adjust pointers after **FMOVE** operetion.
                                   1066 ; UPDAT-PTR ( cp+ -- )
                                   1067 ; cp+ is new CP position after FMOVE 
                                   1068 ;-------------------------------------------
      00A176 A0 E8                 1069 	.word LINK 
                           0020F8  1070 	LINK=.
      00A178 09                    1071 	.byte 9
      00A179 55 50 44 41 54 2D 50  1072 	.ascii "UPDAT-PTR" 
             54 52
      00A182                       1073 UPDATPTR:
                                   1074 ;reset VP to previous position  
      00A182 CD 9B 5A         [ 4] 1075 	call EEPVP 
      00A185 CD 85 4F         [ 4] 1076 	call DROP 
      00A188 CD 84 B2         [ 4] 1077 	call AT
      00A18B CD 86 A7         [ 4] 1078 	call VPP 
      00A18E CD 84 9B         [ 4] 1079 	call STORE
                                   1080 ;update CONTEXT and LAST 
      00A191 CD 9B 44         [ 4] 1081 	call EEPCP 
      00A194 CD 85 4F         [ 4] 1082 	call DROP
      00A197 CD 84 B2         [ 4] 1083 	call AT
      00A19A CD 84 34         [ 4] 1084 	call DOLIT 
      00A19D 00 02                 1085 	.word 2 
      00A19F CD 87 54         [ 4] 1086 	call PLUS 
      00A1A2 CD 85 59         [ 4] 1087 	call DUPP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      00A1A5 CD 86 99         [ 4] 1088 	call CNTXT 
      00A1A8 CD 84 9B         [ 4] 1089 	call STORE
      00A1AB CD 86 C5         [ 4] 1090 	call LAST
      00A1AE CD 84 9B         [ 4] 1091 	call STORE 
      00A1B1 CD 9B 74         [ 4] 1092 	call UPDATLAST 
                                   1093 ;update CP 
      00A1B4 CD 86 B5         [ 4] 1094 	call CPP 
      00A1B7 CD 84 9B         [ 4] 1095 	call STORE
      00A1BA CD 9B 9D         [ 4] 1096 	call UPDATCP 
      00A1BD 81               [ 4] 1097 	ret 
                                   1098 
                                   1099 ;-----------------------------
                                   1100 ; move interrupt sub-routine
                                   1101 ; in flash memory
                                   1102 ;----------------------------- 
      00A1BE A1 78                 1103 	.word LINK 
                           002140  1104 	LINK=. 
      00A1C0 06                    1105 	.byte 6
      00A1C1 49 46 4D 4F 56 45     1106 	.ascii "IFMOVE" 
      00A1C7                       1107 IFMOVE:
      00A1C7 CD 86 66         [ 4] 1108 	call TFLASH 
      00A1CA CD 84 B2         [ 4] 1109 	CALL AT 
      00A1CD CD 84 67         [ 4] 1110 	CALL QBRAN 
      00A1D0 A1 72                 1111 	.word no_move 
      00A1D2 CD 86 B5         [ 4] 1112 	call CPP 
      00A1D5 CD 84 B2         [ 4] 1113 	call AT 
      00A1D8 CD 85 59         [ 4] 1114 	call DUPP ; ( udl udl -- )
      00A1DB CD 9B 5A         [ 4] 1115 	call EEPVP 
      00A1DE CD 85 4F         [ 4] 1116 	call DROP
      00A1E1 CD 84 B2         [ 4] 1117 	call AT  ; ( udl udl a )
      00A1E4 CD 85 22         [ 4] 1118 	call TOR 
      00A1E7 CD A0 E3         [ 4] 1119 	call FADDR
      00A1EA CD 85 16         [ 4] 1120 	call RAT ; ( udl ud a -- ) R: a 
      00A1ED CC A1 1F         [ 2] 1121 	jp FMOVE2 
                                   1122 
                                   1123 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



                           000001  4511 .if WANT_SCALING_CONST 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



                                   4512         .include "const_ratio.asm"
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
      00A1F0 A1 C0                   31         .word LINK 
                           002172    32         LINK=.
      00A1F2 02                      33         .byte 2
      00A1F3 50 49                   34         .ascii "PI" 
      00A1F5                         35 PII:
      00A1F5 1D 00 04         [ 2]   36         subw x,#2*CELLL 
      00A1F8 90 AE 01 63      [ 2]   37         ldw y,#355 
      00A1FC EF 02            [ 2]   38         ldw (2,x),y 
      00A1FE 90 AE 00 71      [ 2]   39         ldw y,#113 
      00A202 FF               [ 2]   40         ldw (x),y 
      00A203 81               [ 4]   41         ret 
                                     42 
                                     43 ;      SQRT2 ( -- 19601  13860 )
                                     44 ; precision: 1.5e-9 
                                     45 ; usage example to compute Voltage peek to peek from Vrms 
                                     46 ; : VPP SQRT2 */ 2 * ;
                                     47 ;
      00A204 A1 F2                   48         .word LINK 
                           002186    49         LINK=.
      00A206 05                      50         .byte 5 
      00A207 53 51 52 54 32          51         .ascii "SQRT2" 
      00A20C                         52 SQRT2:
      00A20C 1D 00 04         [ 2]   53         subw x,#2*CELLL 
      00A20F 90 AE 4C 91      [ 2]   54         ldw y,#19601 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



      00A213 EF 02            [ 2]   55         ldw (2,x),y 
      00A215 90 AE 36 24      [ 2]   56         ldw y,#13860 
      00A219 FF               [ 2]   57         ldw (x),y 
      00A21A 81               [ 4]   58         ret 
                                     59 
                                     60 ;   SQRT3 ( -- 18817 10864 )
                                     61 ; precision: 1.1e-9
                                     62 ;
      00A21B A2 06                   63         .word LINK 
                           00219D    64         LINK=.
      00A21D 05                      65         .byte 5
      00A21E 53 51 52 54 33          66         .ascii "SQRT3" 
      00A223                         67 SQRT3: 
      00A223 1D 00 04         [ 2]   68     subw x,#2*CELLL 
      00A226 90 AE 49 81      [ 2]   69     ldw y,#18817 
      00A22A EF 02            [ 2]   70     ldw (2,x),y 
      00A22C 90 AE 2A 70      [ 2]   71     ldw y,#10864 
      00A230 FF               [ 2]   72     ldw (x),y 
      00A231 81               [ 4]   73     ret 
                                     74 
                                     75 ;   E ( -- 28667 10546 )
                                     76 ; precision: 5.5e-9 
                                     77 ; natural log base 
      00A232 A2 1D                   78         .word LINK 
                           0021B4    79         LINK=.
      00A234 01                      80         .byte 1
      00A235 45                      81         .ascii "E" 
      00A236                         82 ENEPER:
      00A236 1D 00 04         [ 2]   83     subw x,#2*CELLL 
      00A239 90 AE 6F FB      [ 2]   84     ldw y,#28667 
      00A23D EF 02            [ 2]   85     ldw (2,x),y 
      00A23F 90 AE 29 32      [ 2]   86     ldw y,#10546 
      00A243 FF               [ 2]   87     ldw (x),y 
      00A244 81               [ 4]   88     ret 
                                     89 
                                     90 ;   SQRT10 ( -- 22936 7253 )
                                     91 ; precision: 5.7e-9 
      00A245 A2 34                   92         .word LINK 
                           0021C7    93         LINK=.
      00A247 06                      94         .byte 6 
      00A248 53 51 52 54 31 30       95         .ascii "SQRT10" 
      00A24E                         96 SQRT10:
      00A24E 1D 00 04         [ 2]   97     subw x,#2*CELLL
      00A251 90 AE 59 98      [ 2]   98     ldw y,#22936 
      00A255 EF 02            [ 2]   99     ldw (2,x),y 
      00A257 90 AE 1C 55      [ 2]  100     ldw y,#7253
      00A25B FF               [ 2]  101     ldw (x),y 
      00A25C 81               [ 4]  102     ret 
                                    103 
                                    104 ;   12RT2 ( -- 26797 25293 )
                                    105 ; precision: 1.0e-9 
                                    106 ; used in music to compute well tempered scale
      00A25D A2 47                  107         .word LINK 
                           0021DF   108         LINK=. 
      00A25F 05                     109         .byte 5 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



      00A260 31 32 52 54 32         110         .ascii "12RT2"
      00A265                        111 RT12_2:
      00A265 1D 00 04         [ 2]  112     subw x,#2*CELLL 
      00A268 90 AE 68 AD      [ 2]  113     ldw y,#26797
      00A26C EF 02            [ 2]  114     ldw (2,x),y 
      00A26E 90 AE 62 CD      [ 2]  115     ldw y,#25293
      00A272 FF               [ 2]  116     ldw (x),y 
      00A273 81               [ 4]  117     ret 
                                    118 
                                    119 ;   LOG2s ( -- 2040 11103 )
                                    120 ; log(2)/1.6384
                                    121 ; precision: 1.1e-8
      00A274 A2 5F                  122         .word LINK 
                           0021F6   123         LINK=.
      00A276 05                     124         .byte 5 
      00A277 4C 4F 47 32 53         125         .ascii "LOG2S" 
      00A27C                        126 LOG2S:
      00A27C 1D 00 04         [ 2]  127     subw x,#2*CELLL
      00A27F 90 AE 07 F8      [ 2]  128     ldw y,#2040 
      00A283 EF 02            [ 2]  129     ldw (2,x),y 
      00A285 90 AE 2B 5F      [ 2]  130     ldw y,#11103 
      00A289 FF               [ 2]  131     ldw (x),y 
      00A28A 81               [ 4]  132     ret 
                                    133 
                                    134 ;   LN2 ( -- 485 11464 )
                                    135 ; ln(2)/16.384 
                                    136 ; precision: 1.0e-7 
      00A28B A2 76                  137         .word LINK 
                           00220D   138         LINK=.
      00A28D 04                     139         .byte 4 
      00A28E 4C 4E 32 53            140         .ascii "LN2S" 
      00A292                        141 LN2S: 
      00A292 1D 00 04         [ 2]  142     subw x,#2*CELLL
      00A295 90 AE 01 E5      [ 2]  143     ldw y,#485
      00A299 EF 02            [ 2]  144     ldw (2,x),y 
      00A29B 90 AE 2C C8      [ 2]  145     ldw y,#11464 
      00A29F FF               [ 2]  146     ldw (x),y 
      00A2A0 81               [ 4]  147     ret 
                                    148 
                                    149 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



                                   4513 .endif
                           000001  4514 .if WANT_CONST_TABLE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



                                   4515         .include "ctable.asm"
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
                                     19 ;------------------------------
                                     20 ; words to create and read 
                                     21 ; constants tables in FLASH 
                                     22 ; and EEPROM
                                     23 ;------------------------------
                                     24 
                                     25 
                                     26 ;------------------------------
                                     27 ; create constants bytes table 
                                     28 ; in persistant memory
                                     29 ;  CT: ( --  ; <string> )
                                     30 ;-----------------------------
      00A2A1 A2 8D                   31     .word LINK 
                           002223    32     LINK=.
      00A2A3 03                      33     .byte 3
      00A2A4 43 54 3A                34     .ascii "CT:"
      00A2A7                         35 CTABLE:
                                     36 
      00A2A7 81               [ 4]   37     ret 
                                     38 
                                     39 ;-------------------------------
                                     40 ; terminate CTABLE compilation
                                     41 ; CT; ( -- )
                                     42 ;-------------------------------
      00A2A8 A2 A3                   43     .word LINK
                           00222A    44     LINK=.
      00A2AA 03                      45     .byte 3 
      00A2AB 43 54 3B                46     .ascii "CT;" 
      00A2AE                         47 CTSEMI:
                                     48 
      00A2AE 81               [ 4]   49     ret 
                                     50 
                                     51 ;--------------------------------
                                     52 ; create constants words table 
                                     53 ; in persistant memory 
                                     54 ; WT: ( -- ; <string> )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



                                     55 ;--------------------------------
      00A2AF A2 AA                   56     .word LINK 
                           002231    57     LINK=.
      00A2B1 03                      58     .byte 3
      00A2B2 57 54 3A                59     .ascii "WT:"
      00A2B5                         60 WTABLE:
                                     61 
      00A2B5 81               [ 4]   62     ret 
                                     63 
                                     64 ;-------------------------------
                                     65 ; terminate WTABLE compilation
                                     66 ; WT; ( -- )
                                     67 ;-------------------------------
      00A2B6 A2 B1                   68     .word LINK
                           002238    69     LINK=.
      00A2B8 03                      70     .byte 3 
      00A2B9 57 54 3B                71     .ascii "WT;" 
      00A2BC                         72 WTSEMI:
                                     73 
      00A2BC 81               [ 4]   74     ret 
                                     75 
                                     76 
                                     77 ;----------------------------------
                                     78 ; table runtime
                                     79 ; stack table base address 
                                     80 ; DOTABLE ( -- a|ud )
                                     81 ;----------------------------------
      00A2BD A2 B8                   82     .word LINK 
                           00223F    83     LINK=.
      00A2BF 07                      84     .byte 7
      00A2C0 44 4F 54 41 42 4C 45    85     .ascii "DOTABLE"
      00A2C7                         86 DOTABLE:
      00A2C7 90 85            [ 2]   87     popw y 
      00A2C9 90 BF 24         [ 2]   88     ldw YTEMP,y 
                           000001    89 .if NUCLEO
      00A2CC 1D 00 04         [ 2]   90     subw x,#2*CELLL 
      00A2CF 90 FE            [ 2]   91     ldw y,(y)
      00A2D1 FF               [ 2]   92     ldw (x),y 
      00A2D2 90 BE 24         [ 2]   93     ldw y,YTEMP 
      00A2D5 90 EE 02         [ 2]   94     ldw y,(2,y)
      00A2D8 EF 02            [ 2]   95     ldw (2,x),y
                           000000    96 .else ; DISCOVERY 
                                     97     subw x,#CELLL 
                                     98     ldw y,(y)
                                     99     ldw YTEMP,y
                                    100     ldw y,(y)
                                    101     ldw (x),y
                                    102 .endif 
      00A2DA 81               [ 4]  103     ret ; address stacked by call to EXEC.
                                    104 
                                    105 ;---------------------------------
                                    106 ; stack an element of CTABLE 
                                    107 ; CT@ ( u a|ad -- c )
                                    108 ; u element order {0..size-1}
                                    109 ; a|ad table address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]



                                    110 ;--------------------------------
      00A2DB A2 BF                  111     .word LINK 
                           00225D   112     LINK=.
      00A2DD 03                     113     .byte 3
      00A2DE 43 54 40               114     .ascii "CT@" 
      00A2E1                        115 CTAT:
      00A2E1 CD 9A E0         [ 4]  116     call PSTO 
      00A2E4 90 93            [ 1]  117     ldw y,x 
      00A2E6 90 FE            [ 2]  118     ldw y,(y)
      00A2E8 72 B9 00 33      [ 2]  119     addw y,PTR16
      00A2EC 90 BF 33         [ 2]  120     ldw PTR16,y 
      00A2EF 90 5F            [ 1]  121     clrw y
                           000001   122 .if NUCLEO ; 24 bits address
      00A2F1 24 02            [ 1]  123     jrnc 1$
      00A2F3 3C 32            [ 1]  124     inc FPTR 
      00A2F5                        125 1$:
      00A2F5 92 BC 00 32      [ 5]  126     ldf a,[FPTR]
                           000000   127 .else ; DISCOVERY 16 bits address     
                                    128     ld a,[PTR16]
                                    129 .endif 
      00A2F9 90 97            [ 1]  130     ld yl,a 
      00A2FB FF               [ 2]  131     ldw (x),y 
      00A2FC 81               [ 4]  132     ret 
                                    133 
                                    134 ;---------------------------------
                                    135 ; stack an element of WTABLE 
                                    136 ; WT@ ( u a|ud -- w )
                                    137 ; u is element order {0..size-1}
                                    138 ; a|ud table address 
                                    139 ;----------------------------------
      00A2FD A2 DD                  140     .word LINK 
                           00227F   141     LINK=.
      00A2FF 03                     142     .byte 3
      00A300 57 54 40               143     .ascii "WT@" 
      00A303                        144 WTAT:
      00A303 CD 9A E0         [ 4]  145     call PSTO 
      00A306 90 93            [ 1]  146     ldw y,x 
      00A308 90 FE            [ 2]  147     ldw y,(y)
      00A30A 72 B9 00 33      [ 2]  148     addw y,PTR16
      00A30E 90 BF 33         [ 2]  149     ldw PTR16,y 
                           000001   150 .if NUCLEO ; 24 bits address
      00A311 24 02            [ 1]  151     jrnc 1$
      00A313 3C 32            [ 1]  152     inc FPTR 
      00A315                        153 1$:
      00A315 92 BC 00 32      [ 5]  154     ldf a,[FPTR]
      00A319 90 95            [ 1]  155     ld yh,a 
      00A31B CD 9C 5A         [ 4]  156     call INC_FPTR 
      00A31E 92 BC 00 32      [ 5]  157     ldf a,[FPTR]
      00A322 90 97            [ 1]  158     ld yl,a 
                           000000   159 .else ; DISCOVERY 16 bits address     
                                    160     ld a,[PTR16]
                                    161     ld yh,a 
                                    162     call inc_ptr 
                                    163     ld a,[PTR16]
                                    164     ld yl,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]



                                    165 .endif 
      00A324 FF               [ 2]  166     ldw (x),y 
      00A325 81               [ 4]  167     ret 
                                    168 
                                    169 ;--------------------------
                                    170 ; fill character table 
                                    171 ; CTFILL ( ud -- )
                                    172 ;--------------------------
      00A326 A2 FF                  173     .word LINK 
                           0022A8   174     LINK=.
      00A328 06                     175     .byte 6 
      00A329 43 54 46 49 4C 4C      176     .ascii "CTFILL"
      00A32F                        177 CTFILL:
      00A32F CD 9A E0         [ 4]  178     CALL PSTO
      00A332 CD 9C 1E         [ 4]  179     CALL UNLOCK
      00A335 CD 8A BA         [ 4]  180     CALL ZERO 
      00A338 CD 8A 4E         [ 4]  181 1$: CALL ONEP 
      00A33B CD 85 59         [ 4]  182     CALL DUPP 
      00A33E CD A3 8B         [ 4]  183     CALL INTQ 
      00A341 CD 84 67         [ 4]  184     CALL QBRAN 
      00A344 A3 4E                  185     .word 2$
      00A346 CD 9C C9         [ 4]  186     call WR_BYTE 
      00A349 CD 84 7E         [ 4]  187     CALL BRAN 
      00A34C A3 38                  188     .word 1$ 
      00A34E CD 85 4F         [ 4]  189 2$: CALL DROP 
      00A351 CD 9C 46         [ 4]  190     CALL LOCK 
      00A354 81               [ 4]  191     ret 
                                    192 
                                    193 ;--------------------------
                                    194 ; fill word table 
                                    195 ; WTFILL ( ud -- )
                                    196 ;--------------------------
      00A355 A3 28                  197     .word LINK 
                           0022D7   198     LINK=.
      00A357 06                     199     .byte 6 
      00A358 57 54 46 49 4C 4C      200     .ascii "WTFILL"
      00A35E                        201 WTFILL:
      00A35E CD 9A E0         [ 4]  202     CALL PSTO
      00A361 CD 9C 1E         [ 4]  203     CALL UNLOCK
      00A364 CD 8A BA         [ 4]  204     CALL ZERO 
      00A367 CD 8A 4E         [ 4]  205 1$: CALL ONEP 
      00A36A CD 85 59         [ 4]  206     CALL DUPP
      00A36D CD A3 8B         [ 4]  207     CALL INTQ
      00A370 CD 84 67         [ 4]  208     CALL QBRAN 
      00A373 A3 7D                  209     .word 2$
      00A375 CD 9C E8         [ 4]  210     call WR_WORD 
      00A378 CD 84 7E         [ 4]  211     CALL BRAN 
      00A37B A3 67                  212     .word 1$ 
      00A37D CD 85 4F         [ 4]  213 2$: CALL DROP 
      00A380 CD 9C 46         [ 4]  214     CALL LOCK 
      00A383 81               [ 4]  215     ret 
                                    216 
                                    217 ;------------------------
                                    218 ; Prompted input for integer 
                                    219 ; [n]? ( -- a )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



                                    220 ;------------------------
      00A384 A3 57                  221     .word LINK 
                           002306   222     LINK=.
      00A386 04                     223     .byte 4
      00A387 5B 6E 5D 3F            224     .ascii "[n]?" 
      00A38B                        225 INTQ:
      00A38B CD 8F 20         [ 4]  226     CALL CR 
      00A38E CD 84 34         [ 4]  227     call DOLIT 
      00A391 00 5B                  228     .word '[
      00A393 CD 84 1E         [ 4]  229     CALL EMIT 
      00A396 CD 8F BB         [ 4]  230     CALL DOT 
      00A399 CD 8F 5F         [ 4]  231     CALL  DOTQP
      00A39C 03                     232     .byte 3
      00A39D 5D 3F 20               233     .ascii "]? " 
      00A3A0 CD 93 07         [ 4]  234     CALL QUERY 
      00A3A3 CD 91 32         [ 4]  235     call TOKEN 
      00A3A6 CC 8D CD         [ 2]  236     jp NUMBQ
                                    237 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



                                   4516 .endif
                                   4517 
                                   4518 ;===============================================================
                                   4519 
                           002306  4520 LASTN =	LINK   ;last name defined
                                   4521 
                                   4522 ; application code begin here
      00A400                       4523 	.bndry 128 ; align on flash block  
      00A400                       4524 app_space: 
                                   4525 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
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
    BTW     =  000001     |   6 BUF2ROW    001FE1 R   |   6 BYE        0000B4 R
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
  6 CHKIVEC    001ECF R   |     CLKOPT  =  004807     |     CLKOPT_C=  000002 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
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
  6 COLD       0019F1 R   |   6 COLD1      0019F1 R   |   6 COLON      001730 R
  6 COMMA      0013F8 R   |   6 COMPI      00143D R   |     COMPO   =  000040 
  6 CONSTANT   0017DA R   |   6 COUNT      000B11 R   |   6 CPP        000635 R
    CPU_A   =  007F00     |     CPU_CCR =  007F0A     |     CPU_PCE =  007F01 
    CPU_PCH =  007F02     |     CPU_PCL =  007F03     |     CPU_SPH =  007F08 
    CPU_SPL =  007F09     |     CPU_XH  =  007F04     |     CPU_XL  =  007F05 
    CPU_YH  =  007F06     |     CPU_YL  =  007F07     |   6 CR         000EA0 R
  6 CREAT      001776 R   |     CRR     =  00000D     |   6 CSTOR      00043F R
  6 CTABLE     002227 R   |   6 CTAT       002261 R   |   6 CTFILL     0022AF R
  6 CTSEMI     00222E R   |   6 DAT        000AF1 R   |     DATSTK  =  001680 
  6 DCONST     001816 R   |   6 DDROP      0006B4 R   |   6 DDUP       0006BF R
    DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF     |   6 DECIM      000CF5 R
  6 DEPTH      000A7C R   |     DEVID_BA=  0048CD     |     DEVID_EN=  0048D8 
    DEVID_LO=  0048D2     |     DEVID_LO=  0048D3     |     DEVID_LO=  0048D4 
    DEVID_LO=  0048D5     |     DEVID_LO=  0048D6     |     DEVID_LO=  0048D7 
    DEVID_LO=  0048D8     |     DEVID_WA=  0048D1     |     DEVID_XH=  0048CE 
    DEVID_XL=  0048CD     |     DEVID_YH=  0048D0     |     DEVID_YL=  0048CF 
  6 DGTQ1      000D3A R   |   6 DI         0000C2 R   |   6 DIG        000C6E R
  6 DIGIT      000C09 R   |   6 DIGS       000C7F R   |   6 DIGS1      000C7F R
  6 DIGS2      000C8C R   |   6 DIGTQ      000D09 R   |     DISCOVER=  000000 
    DM_BK1RE=  007F90     |     DM_BK1RH=  007F91     |     DM_BK1RL=  007F92 
    DM_BK2RE=  007F93     |     DM_BK2RH=  007F94     |     DM_BK2RL=  007F95 
    DM_CR1  =  007F96     |     DM_CR2  =  007F97     |     DM_CSR1 =  007F98 
    DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A     |   6 DN1        00072E R
  6 DNEGA      000711 R   |   6 DOCONST    001804 R   |   6 DOLIT      0003B4 R
  6 DONXT      0003C8 R   |   6 DOSTR      000EB6 R   |   6 DOT        000F3B R
  6 DOT1       000F51 R   |   6 DOTABLE    002247 R   |   6 DOTI1      001972 R
  6 DOTID      00195C R   |   6 DOTO1      00134F R   |   6 DOTOK      001335 R
  6 DOTPR      001064 R   |   6 DOTQ       0015B1 R   |   6 DOTQP      000EDF R
  6 DOTR       000EED R   |   6 DOTS       0018FE R   |   6 DOTS1      001909 R
  6 DOTS2      001912 R   |   6 DOVAR      000586 R   |   6 DO_DCONS   001845 R
  6 DROP       0004CF R   |   6 DSTOR      000ACB R   |   6 DUMP       0018B4 R
  6 DUMP1      0018CB R   |   6 DUMP3      0018ED R   |   6 DUMPP      001883 R
  6 DUPP       0004D9 R   |   6 EDIGS      000CAA R   |   6 EEPCP      001AC4 R
  6 EEPLAST    001A97 R   |   6 EEPROM     001A7F R   |     EEPROM_B=  004000 
    EEPROM_E=  0047FF     |     EEPROM_R=  000010     |     EEPROM_S=  000800 
  6 EEPRUN     001AAE R   |   6 EEPVP      001ADA R   |   6 EE_CCOMM   001F96 R
  6 EE_COMMA   001F75 R   |   6 EE_CREAD   001C2F R   |   6 EE_READ    001C0D R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]

Symbol Table

  6 EI         0000BB R   |   6 ELSEE      001510 R   |   6 EMIT       00039E R
  6 ENEPER     0021B6 R   |   6 EQ1        00078B R   |   6 EQUAL      000775 R
  6 ERASE      000BD7 R   |     ERR     =  00001B     |   6 EVAL       001378 R
  6 EVAL1      001378 R   |   6 EVAL2      001394 R   |   6 EXE1       000B6C R
  6 EXECU      00040E R   |     EXT     =  000000     |     EXTI_CR1=  0050A0 
    EXTI_CR2=  0050A1     |   6 EXTRC      000C31 R   |   6 FADDR      002063 R
    FHSE    =  7A1200     |     FHSI    =  F42400     |   6 FILL       000BA4 R
  6 FILL1      000BC1 R   |   6 FILL2      000BCA R   |   6 FIND       001116 R
  6 FIND1      001134 R   |   6 FIND2      001162 R   |   6 FIND3      00116E R
  6 FIND4      001182 R   |   6 FIND5      00118F R   |   6 FIND6      001173 R
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
    FLSI    =  01F400     |   6 FMOVE      00206E R   |   6 FMOVE2     00209F R
  6 FOR        00148D R   |   6 FORGET     000158 R   |   6 FORGET1    000187 R
  6 FORGET2    00020D R   |   6 FORGET4    000216 R   |   6 FORGET6    0001CF R
    FPTR    =  000032     |   6 FREEVAR    000223 R   |   6 FREEVAR4   000259 R
    GPIO_BAS=  005000     |     GPIO_CR1=  000003     |     GPIO_CR2=  000004 
    GPIO_DDR=  000002     |     GPIO_IDR=  000001     |     GPIO_ODR=  000000 
    GPIO_SIZ=  000005     |   6 HERE       000B28 R   |   6 HEX        000CE0 R
  6 HI         0019AE R   |   6 HLD        000606 R   |   6 HOLD       000C55 R
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]

Symbol Table

    I2C_WRIT=  000000     |   6 ICOLON     001741 R   |   6 IFETCH     0014AB R
  6 IFF        0014E8 R   |   6 IFMOVE     002147 R   |     IMEDD   =  000080 
  6 IMMED      001753 R   |   6 INCH       000392 R   |   6 INC_FPTR   001BDA R
  6 INITOFS    001709 R   |   6 INN        0005B4 R   |     INPUT_DI=  000000 
    INPUT_EI=  000001     |     INPUT_FL=  000000     |     INPUT_PU=  000001 
  6 INTE1      001317 R   |   6 INTER      0012ED R   |   6 INTQ       00230B R
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
  6 KTAP2      00122D R   |   6 LAST       000645 R   |   6 LASTN   =  002306 R
  6 LBRAC      001324 R   |     LED2_BIT=  000005     |     LED2_MAS=  000020 
    LED2_POR=  00500A     |   6 LESS       0007B2 R   |     LF      =  00000A 
  6 LINK    =  002306 R   |   6 LITER      00145F R   |   6 LN2S       002212 R
  6 LOCK       001BC6 R   |   6 LOG2S      0021FC R   |   6 LSHIFT     0009EC R
  6 LSHIFT1    0009F5 R   |   6 LSHIFT4    0009FD R   |   6 LT1        0007C8 R
    MASKK   =  001F7F     |   6 MAX        0007D2 R   |   6 MAX1       0007E5 R
  6 MIN        0007EF R   |   6 MIN1       000802 R   |   6 MMOD1      0008A5 R
  6 MMOD2      0008B9 R   |   6 MMOD3      0008D0 R   |   6 MMSM1      00084C R
  6 MMSM2      000860 R   |   6 MMSM3      000862 R   |   6 MMSM4      00086A R
  6 MODD       0008EA R   |   6 MONE       000A53 R   |     MS      =  00002E 
  6 MSEC       0002CE R   |   6 MSMOD      000888 R   |   6 MSTA1      00097B R
  6 MSTAR      000958 R   |     NAFR    =  004804     |   6 NAMEQ      0011AF R
  6 NAMET      0010C0 R   |     NCLKOPT =  004808     |   6 NEGAT      0006FF R
  6 NEX1       0003D5 R   |   6 NEXT       00149C R   |     NFLASH_W=  00480E 
    NHSECNT =  00480A     |     NOPT1   =  004802     |     NOPT2   =  004804 
    NOPT3   =  004806     |     NOPT4   =  004808     |     NOPT5   =  00480A 
    NOPT6   =  00480C     |     NOPT7   =  00480E     |     NOPTBL  =  00487F 
  6 NTIB       0005C4 R   |     NUBC    =  004802     |     NUCLEO  =  000001 
  6 NUFQ       000E36 R   |   6 NUFQ1      000E4F R   |   6 NUMBQ      000D4D R
  6 NUMQ1      000D81 R   |   6 NUMQ2      000DB2 R   |   6 NUMQ3      000DF4 R
  6 NUMQ4      000DF9 R   |   6 NUMQ5      000E08 R   |   6 NUMQ6      000E0B R
    NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC 
    NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE     |   6 NonHandl   000000 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]

Symbol Table

  6 OFFSET     00066A R   |     OFS     =  000005     |   6 ONE        000A45 R
  6 ONEM       0009DB R   |   6 ONEP       0009CE R   |     OPT     =  000002 
    OPT0    =  004800     |     OPT1    =  004801     |     OPT2    =  004803 
    OPT3    =  004805     |     OPT4    =  004807     |     OPT5    =  004809 
    OPT6    =  00480B     |     OPT7    =  00480D     |     OPTBL   =  00487E 
    OPTIMIZE=  000001     |     OPTION_B=  004800     |     OPTION_E=  00487F 
    OPTION_S=  000080     |   6 ORIG       000047 R   |   6 ORR        000539 R
  6 OUTPUT     0003A3 R   |     OUTPUT_F=  000001     |     OUTPUT_O=  000000 
    OUTPUT_P=  000001     |     OUTPUT_S=  000000     |   6 OVER       000503 R
  6 OVERT      00166C R   |     PA      =  000000     |   6 PACKS      000BE8 R
  6 PAD        000B39 R   |   6 PAREN      001073 R   |   6 PARS       000F6C R
  6 PARS1      000F97 R   |   6 PARS2      000FC2 R   |   6 PARS3      000FC5 R
  6 PARS4      000FCE R   |   6 PARS5      000FF1 R   |   6 PARS6      001006 R
  6 PARS7      001015 R   |   6 PARS8      001024 R   |   6 PARSE      001035 R
  6 PAUSE      0002DE R   |     PA_BASE =  005000     |     PA_CR1  =  005003 
    PA_CR2  =  005004     |     PA_DDR  =  005002     |     PA_IDR  =  005001 
    PA_ODR  =  005000     |     PB      =  000005     |     PB_BASE =  005005 
    PB_CR1  =  005008     |     PB_CR2  =  005009     |     PB_DDR  =  005007 
    PB_IDR  =  005006     |     PB_ODR  =  005005     |     PC      =  00000A 
    PC_BASE =  00500A     |     PC_CR1  =  00500D     |     PC_CR2  =  00500E 
    PC_DDR  =  00500C     |     PC_IDR  =  00500B     |     PC_ODR  =  00500A 
    PD      =  00000F     |   6 PDUM1      001896 R   |   6 PDUM2      0018A7 R
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
    PH_ODR  =  005023     |     PI      =  000028     |   6 PICK       000A93 R
  6 PII        002175 R   |     PI_BASE =  005028     |     PI_CR1  =  00502B 
    PI_CR2  =  00502C     |     PI_DDR  =  00502A     |     PI_IDR  =  005029 
    PI_ODR  =  005028     |   6 PLUS       0006D4 R   |   6 PNAM1      001621 R
  6 PRESE      0013A3 R   |     PROD1   =  000022     |     PROD2   =  000024 
    PROD3   =  000026     |   6 PROTECTE   0001FF R   |   6 PSTO       001A60 R
  6 PSTOR      000AAA R   |     PTR16   =  000033     |     PTR8    =  000034 
  6 PTRPLUS    001BF2 R   |   6 QBRAN      0003E7 R   |   6 QDUP       000683 R
  6 QDUP1      00068D R   |   6 QKEY       000380 R   |   6 QSTAC      00135B R
  6 QUERY      001287 R   |   6 QUEST      000F5E R   |   6 QUIT       0013C0 R
  6 QUIT1      0013C8 R   |   6 QUIT2      0013CB R   |   6 RAM2EE     00200F R
    RAMBASE =  000000     |   6 RAMLAST    000658 R   |     RAM_BASE=  000000 
    RAM_END =  0017FF     |     RAM_SIZE=  001800     |   6 RANDOM     00027C R
  6 RAT        000496 R   |   6 RBRAC      0016E0 R   |   6 REPEA      001565 R
  6 RFREE      001FF6 R   |   6 RFROM      000483 R   |     ROP     =  004800 
  6 ROT        000694 R   |   6 ROW2BUF    001FB8 R   |     ROWBUFF =  001680 
    RP0     =  00002C     |   6 RPAT       000460 R   |     RPP     =  0017FF 
  6 RPSTO      00046D R   |   6 RSHIFT     000A08 R   |   6 RSHIFT1    000A11 R
  6 RSHIFT4    000A19 R   |     RST_SR  =  0050B3     |   6 RT12_2     0021E5 R
  6 SAME1      0010DE R   |   6 SAME2      001107 R   |   6 SAMEQ      0010D6 R
  6 SCOM1      001656 R   |   6 SCOM2      001659 R   |   6 SCOMP      001638 R
  6 SEED       000263 R   |     SEEDX   =  000036     |     SEEDY   =  000038 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]

Symbol Table

  6 SEMIS      00167C R   |   6 SETISP     0000CE R   |   6 SET_RAML   0017C3 R
    SFR_BASE=  005000     |     SFR_END =  0057FF     |   6 SIGN       000C94 R
  6 SIGN1      000CA4 R   |   6 SLASH      0008F4 R   |   6 SLMOD      0008D8 R
  6 SNAME      0015EB R   |     SP0     =  00002A     |   6 SPACE      000E58 R
  6 SPACS      000E67 R   |   6 SPAT       0004B9 R   |     SPI_CR1 =  005200 
    SPI_CR2 =  005201     |     SPI_CRCP=  005205     |     SPI_DR  =  005204 
    SPI_ICR =  005202     |     SPI_RXCR=  005206     |     SPI_SR  =  005203 
    SPI_TXCR=  005207     |     SPP     =  001680     |     SPSAVE  =  000001 
  6 SPSTO      0004C6 R   |   6 SQRT10     0021CE R   |   6 SQRT2      00218C R
  6 SQRT3      0021A3 R   |   6 SSMOD      000984 R   |     SSP     =  000001 
    STACK   =  0017FF     |   6 STAR       00094D R   |   6 STASL      000995 R
  6 STOD       000736 R   |   6 STORE      00041B R   |   6 STR        000CC2 R
  6 STRCQ      00146D R   |   6 STRQ       0015A4 R   |   6 STRQP      000ED5 R
  6 SUBB       00074D R   |   6 SWAPP      0004E9 R   |     SWIM_CSR=  007F80 
  6 TAP        0011F1 R   |   6 TBOOT      0019E5 R   |   6 TBUF       0005D4 R
    TBUFFBAS=  001680     |   6 TCHAR      000A64 R   |   6 TEMP       0005A5 R
  6 TEVAL      0005F7 R   |   6 TFLASH     0005E6 R   |   6 THENN      0014FD R
  6 TIB        000B4A R   |     TIBB    =  001700     |     TIBBASE =  001700 
    TIC     =  000027     |   6 TICK       0013D7 R   |     TIM1_ARR=  005262 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
Hexadecimal [24-Bits]

Symbol Table

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
  6 TNAM2      00192C R   |   6 TNAM3      00194A R   |   6 TNAM4      001950 R
  6 TNAME      001929 R   |   6 TOFLASH    000333 R   |   6 TOKEN      0010B2 R
  6 TOR        0004A2 R   |   6 TORAM      000373 R   |     TRUEE   =  00FFFF 
  6 TWOSL      000A20 R   |   6 TYPE1      000E87 R   |   6 TYPE2      000E93 R
  6 TYPES      000E82 R   |   6 Timer4Ha   000005 R   |     UART1   =  000000 
    UART1_BA=  005230     |     UART1_BR=  005232     |     UART1_BR=  005233 
    UART1_CR=  005234     |     UART1_CR=  005235     |     UART1_CR=  005236 
    UART1_CR=  005237     |     UART1_CR=  005238     |     UART1_DR=  005231 
    UART1_GT=  005239     |     UART1_PO=  000000     |     UART1_PS=  00523A 
    UART1_RX=  000004     |     UART1_SR=  005230     |     UART1_TX=  000005 
    UART3   =  000001     |     UART3_BA=  005240     |     UART3_BR=  005242 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal [24-Bits]

Symbol Table

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
    UCP     =  000018     |     UCTIB   =  00000C     |     UD1     =  000001 
    UD2     =  000002     |     UD3     =  000003     |     UD4     =  000004 
  6 UDOT       000F28 R   |   6 UDOTR      000F08 R   |   6 UEND       000045 R
    UHLD    =  000012     |     UINN    =  00000A     |     UINTER  =  000010 
    ULAST   =  00001A     |   6 ULES1      0007AA R   |   6 ULESS      000794 R
  6 UMMOD      00082A R   |   6 UMSTA      000903 R   |   6 UNIQ1      0015E2 R
  6 UNIQU      0015C3 R   |   6 UNLOCK     001B9E R   |   6 UNTIL      0014C5 R
    UOFFSET =  00001C     |   6 UPDATCP    001B1D R   |   6 UPDATLAS   001AF4 R
  6 UPDATPTR   002102 R   |   6 UPDATRUN   001B0C R   |   6 UPDATVP    001B34 R
  6 UPL1       00057A R   |   6 UPLUS      000563 R   |     UPP     =  000006 
    URLAST  =  000020     |     USR_BTN_=  000004     |     USR_BTN_=  000010 
    USR_BTN_=  005015     |     UTFLASH =  00001E     |     UTIB    =  00000E 
    UTMP    =  000008     |   6 UTYP1      001866 R   |   6 UTYP2      001875 R
  6 UTYPE      001861 R   |     UVP     =  000016     |   6 UZERO      00002B R
  6 VARIA      001790 R   |     VAR_BASE=  000080     |     VAR_TOP =  0017BF 
    VER     =  000003     |   6 VPP        000627 R   |     VSIZE   =  000006 
    WANT_CON=  000001     |     WANT_DEB=  000000     |     WANT_SCA=  000001 
    WANT_SEE=  000000     |     WDGOPT  =  004805     |     WDGOPT_I=  000002 
    WDGOPT_L=  000003     |     WDGOPT_W=  000000     |     WDGOPT_W=  000001 
  6 WHILE      00154B R   |   6 WITHI      00080F R   |   6 WORDD      00109E R
  6 WORDS      001986 R   |   6 WORS1      00198C R   |   6 WORS2      0019A8 R
  6 WR_BYTE    001C49 R   |   6 WR_WORD    001C68 R   |   6 WTABLE     002235 R
  6 WTAT       002283 R   |   6 WTFILL     0022DE R   |   6 WTSEMI     00223C R
    WWDG_CR =  0050D1     |     WWDG_WR =  0050D2     |     XMEM_SIZ=  017830 
  6 XORR       00054E R   |     XTEMP   =  000022     |     YTEMP   =  000024 
  6 ZERO       000A3A R   |   6 ZL1        00051B R   |   6 ZLESS      000512 R
  6 app_spac   002380 R   |   6 block_er   001D25 R   |   6 clear_ra   000019 R
  6 clock_in   000062 R   |   6 copy_buf   001D7C R   |   6 copy_buf   001D9B R
  6 copy_pro   001D9B R   |     da      =  000002     |     db      =  000003 
    dc      =  000000     |     dd      =  000001     |   6 ee_cstor   001C92 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal [24-Bits]

Symbol Table

  6 ee_store   001CDE R   |   6 erase_fl   001D41 R   |   6 farat      001B45 R
  6 farcat     001B51 R   |   6 fmove_do   0020EB R   |   6 main       000016 R
  6 next_row   0020A8 R   |   6 no_move    0020F2 R   |   6 pristine   001E16 R
  6 proceed_   001D44 R   |   6 reboot     000325 R   |   6 reset_ve   001E7D R
  6 row_eras   001D08 R   |   6 row_eras   001D55 R   |   6 row_eras   001D7C R
  6 set_opti   001DEA R   |   6 set_vect   001F1E R   |   6 uart_ini   000074 R
  6 unlock_e   001B60 R   |   6 unlock_f   001B7F R   |   6 write_ro   001DC0 R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 DATA       size      0   flags    8
   2 DATA0      size      0   flags    8
   3 SSEG       size      0   flags    8
   4 SSEG1      size    100   flags    8
   5 HOME       size     80   flags    0
   6 CODE       size   2380   flags    0

