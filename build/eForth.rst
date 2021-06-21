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
                                        ; board or MCU set it to 1 and the other
                                        ; to 0. 
                                 
                                 
                                 
                                        
                                        ; select end of line character
                                 
                                 
                                        
                                        ; set to 1 to include 
                                        ; scaling constants vocabulary
                                        ; see: const_ratio.asm 
                                 
                                        
                                        ; set to 1 to include 
                                        ; constants tables vocabulary 
                                        ; see: ctable.asm 
                                 
                                        
                                        ; to include floating point 
                                        ; library 
                                 
                                        
                                        ; set to 1 to make vocabulary 
                                        ; case sensitive 
                                 
                                        
                                        ; how many bytes are reserved 
                                        ; by system at EEPROM base.
                                 
                                        
                                 
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
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        .endif
                                        
                                 
                                        	.include "inc/stm8s105.inc"
                                        .if DISCOVERY
                                        	.include "inc/stm8s_disco.inc"
                                        .endif 
                                        XMEM_SIZE=0 ; size in bytes of EXTENDED MEMORY 
                                        UART_SR=UART2_SR
                                        UART_DR=UART2_DR
                                        UART_BRR1=UART2_BRR1
                                        UART_BRR2=UART2_BRR2
                                        UART_CR1=UART2_CR1
                                        UART_CR2=UART2_CR2
                                        .endif 
                                        
                                        	
                                         
                                        
                                        
                                        
                                     12 	.list
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 2.
Hexadecimal [24-Bits]



                                     14 
                                     15 ;===============================================================
                                     16 ;  Adaption to NUCLEO-8S208RB by Picatout
                                     17 ;  Date: 2020-06-07 
                                     18 ;       Suite aux nombreux changement remplacé le numéro de version pour 3.0
                                     19 ;  Date: 2019-10-26
                                     20 ;  Changes to memory map:
                                     21 ;       0x16f0  Data Stack, growing downward
                                     22 ;       0x1700  Terminal input buffer TIB
                                     23 ;       0x17ff  Return Stack, growing downard
                                     24 ;================================================================
                                     25 ;       STM8EF, Version 2.1, 13 July
                                     26 ;               Implemented on STM8S-Discovery Board.
                                     27 ;               Assembled by ST VisualDevelop STVD 
                                     28 ;               Bootup on internal 2 MHz clock
                                     29 ;               Switch to external 16 MHz crystal clock
                                     30 ;
                                     31 ; FORTH Virtual Machine:
                                     32 ; Subroutine threaded model
                                     33 ; SP Return stack pointer
                                     34 ; X Data stack pointer
                                     35 ; A,Y Scratch pad registers
                                     36 ;
                                     37 ; Memory Map:
                                     38 ; 0x0 RAM memory, system variables
                                     39 ; 0x80 Start of user defined words, linked to ROM dictionary
                                     40 ; 0x780 Data stack, growing downward
                                     41 ; 0x790 Terminal input buffer TIB
                                     42 ; 0x7FF Return stack, growing downward
                                     43 ; 0x8000 Interrupt vector table
                                     44 ; 0x8080 FORTH startup code
                                     45 ; 0x80E7 Start of FORTH dictionary in ROM
                                     46 ; 0x9584 End of FORTH dictionary
                                     47 ;
                                     48 ;       2020-04-26 Addapted for NUCLEO-8S208RB by Picatout 
                                     49 ;                  use UART1 instead of UART2 for communication with user.
                                     50 ;                  UART1 is available as ttyACM* device via USB connection.
                                     51 ;                  Use TIMER4 for millisecond interrupt to support MS counter 
                                     52 ;                  and MSEC word that return MS value.
                                     53 ;
                                     54 ;       EF12, Version 2.1, 18apr00cht
                                     55 ;               move to 8000H replacing WHYP.
                                     56 ;               copy interrupt vectors from WHYPFLSH.S19
                                     57 ;               to EF12.S19 before flashing
                                     58 ;               add TICKS1 and DELAY1 for motor stepping
                                     59 ;
                                     60 ;       EF12, 02/18/00, C. H. Ting
                                     61 ;       Adapt 86eForth v2.02 to 68HC12.
                                     62 ;               Use WHYP to seed EF12.ASM
                                     63 ;               Use AS12 native 68HC12 assembler:
                                     64 ;               as12 ef12.asm >ef12.lst
                                     65 ;       EF12A, add ADC code, 02mar00cht
                                     66 ;       EF12B, 01mar00cht
                                     67 ;               stack to 0x78, return stack to 0xf8.
                                     68 ;               add all port definitions
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 3.
Hexadecimal [24-Bits]



                                     69 ;               add PWM registers
                                     70 ;               add SPI registers and code
                                     71 ;       EF12C, 12mar00cht
                                     72 ;               add MAX5250 D/A converter
                                     73 ;       EF12D, 15mar00cht
                                     74 ;               add all the Lexel interface words
                                     75 ;       EF12E, 18apr00cht, save for reference
                                     76 ;
                                     77 ;       Copyright (c) 2000
                                     78 ;       Dr. C. H. Ting
                                     79 ;       156 14th Avenue
                                     80 ;       San Mateo, CA 94402
                                     81 ;       (650) 571-7639
                                     82 ;
                                     83 
                                     84       
                                     85 ;*********************************************************
                                     86 ;	Assembler constants
                                     87 ;*********************************************************
                           000000    88 RAMBASE =	0x0000	   ;ram base
                           000001    89 .if NUCLEO 
                           0017FF    90 STACK   =	0x17FF 	;system (return) stack empty 
                           001680    91 DATSTK  =	0x1680	;data stack  empty
                           001680    92 TBUFFBASE =     0x1680  ; flash read/write transaction buffer address  
                           001700    93 TIBBASE =       0X1700  ; transaction input buffer addr.
                           000000    94 .else ; DISCOVERY
                                     95 STACK   =	0x7FF 	;system (return) stack empty 
                                     96 DATSTK  =	0x680	;data stack  empty
                                     97 TBUFFBASE =     0x680  ; flash read/write transaction buffer address  
                                     98 TIBBASE =       0X700  ; transaction input buffer addr.
                                     99 .endif
                                    100 
                                    101 ;; Memory allocation
                           000006   102 UPP     =     RAMBASE+6          ; systeme variables base address 
                           001680   103 SPP     =     RAMBASE+DATSTK     ; data stack bottom 
                           0017FF   104 RPP     =     RAMBASE+STACK      ;  return stack bottom
                           001680   105 ROWBUFF =     RAMBASE+TBUFFBASE ; flash write buffer 
                           001700   106 TIBB    =     RAMBASE+TIBBASE  ; transaction input buffer
                           000080   107 VAR_BASE =    RAMBASE+0x80  ; user variables start here .
                           0017BF   108 VAR_TOP =     STACK-32*CELLL  ; reserve 32 cells for data stack. 
                                    109 
                                    110 ; user variables constants 
                           000006   111 UBASE = UPP       ; numeric base 
                           000008   112 UFBASE = UBASE+2  ; floating point base 
                           00000A   113 UFPSW = UFBASE+2  ; floating point state word 
                           00000C   114 UTMP = UFPSW+2    ; temporary storage
                           00000E   115 UINN = UTMP+2     ; >IN tib pointer 
                           000010   116 UCTIB = UINN+2    ; tib count 
                           000012   117 UTIB = UCTIB+2    ; tib address 
                           000014   118 UINTER = UTIB+2   ; interpreter vector 
                           000016   119 UHLD = UINTER+2   ; hold 
                           000018   120 UCNTXT = UHLD+2   ; context, dictionary first link 
                           00001A   121 UVP = UCNTXT+2    ; variable pointer 
                           00001C   122 UCP = UVP+2      ; code pointer
                           00001E   123 ULAST = UCP+2    ; last dictionary pointer 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 4.
Hexadecimal [24-Bits]



                           000020   124 UOFFSET = ULAST+2 ; distance between CP and VP to adjust jump address at compile time.
                           000022   125 UTFLASH = UOFFSET+2 ; select where between FLASH and RAM for compilation destination. 
                           000024   126 URLAST = UTFLASH+2 ; context for dictionary in RAM memory 
                                    127 
                                    128 ;******  System Variables  ******
                           000026   129 XTEMP	=	URLAST +2;address called by CREATE
                           000028   130 YTEMP	=	XTEMP+2	;address called by CREATE
                           000026   131 PROD1 = XTEMP	;space for UM*
                           000028   132 PROD2 = PROD1+2
                           00002A   133 PROD3 = PROD2+2
                           00002C   134 CARRY = PROD3+2
                           00002E   135 SP0	= CARRY+2	;initial data stack pointer
                           000030   136 RP0	= SP0+2		;initial return stack pointer
                           000032   137 MS    =   RP0+2         ; millisecond counter 
                           000034   138 CNTDWN =  MS+2          ; count down timer 
                           000036   139 FPTR = CNTDWN+2         ; 24 bits farptr 
                           000037   140 PTR16 = FPTR+1          ; middle byte of farptr 
                           000038   141 PTR8 = FPTR+2           ; least byte of farptr 
                           00003A   142 SEEDX = PTR8+2          ; PRNG seed X 
                           00003C   143 SEEDY = SEEDX+2         ; PRNG seed Y 
                                    144 
                                    145 ; EEPROM persistant data  
                           004000   146 APP_LAST = EEPROM_BASE ; Application last word pointer  
                           004002   147 APP_RUN = APP_LAST+2   ; application autorun address 
                           004004   148 APP_CP = APP_RUN+2   ; free application space pointer 
                           004006   149 APP_VP = APP_CP+2  ; free data space pointer 
                                    150 
                                    151 
                                    152 ;***********************************************
                                    153 ;; Version control
                                    154 
                           000003   155 VER     =     3         ;major release version
                           000000   156 EXT     =     0         ;minor extension
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
                           000011   171 XON     =     17
                           000013   172 XOFF    =     19
                           00001B   173 ERR     =     27      ;error escape
                           000027   174 TIC     =     39      ;tick
                           0000CD   175 CALLL   =     0xCD     ;CALL opcodes
                           000080   176 IRET_CODE =   0x80    ; IRET opcode 
                                    177 
                                    178         .macro _ledon
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 5.
Hexadecimal [24-Bits]



                                    179         .if NUCLEO
                                    180         bset PC_ODR,#LED2_BIT
                                    181         .else ;DISCOVERY 
                                    182         .if DISCOVERY
                                    183         bres PD_ODR,#LD1_BIT 
                                    184         .endif
                                    185         .endif
                                    186         .endm
                                    187 
                                    188         .macro _ledoff
                                    189         .if NUCLEO 
                                    190         bres PC_ODR,#LED2_BIT
                                    191         .else ;DISCOVERY 
                                    192         .if DISCOVERY
                                    193         bset PD_ODR,#LD1_BIT 
                                    194         .endif 
                                    195         .endif
                                    196         .endm
                                    197 
                                    198 ;**********************************************************
                                    199         .area DATA (ABS)
      000000                        200         .org RAMBASE 
                                    201 ;**********************************************************
                                    202 
                                    203 ;**********************************************************
                                    204         .area SSEG (ABS) ; STACK
      001700                        205         .org 0x1700
      001700                        206         .ds 256 
                                    207 ; space for DATSTK,TIB and STACK         
                                    208 ;**********************************************************
                                    209 
                                    210 ;**********************************************************
                                    211         .area HOME ; vectors table
                                    212 ;**********************************************************
      008000 82 00 80 96            213 	int main	        ; reset
      008004 82 00 80 80            214 	int NonHandledInterrupt	; trap
      008008 82 00 80 80            215 	int NonHandledInterrupt	; irq0
      00800C 82 00 80 80            216 	int NonHandledInterrupt	; irq1
      008010 82 00 80 80            217 	int NonHandledInterrupt	; irq2
      008014 82 00 80 80            218 	int NonHandledInterrupt	; irq3
      008018 82 00 80 80            219 	int NonHandledInterrupt	; irq4
      00801C 82 00 80 80            220 	int NonHandledInterrupt	; irq5
      008020 82 00 80 80            221 	int NonHandledInterrupt	; irq6
      008024 82 00 80 80            222 	int NonHandledInterrupt	; irq7
      008028 82 00 80 80            223 	int NonHandledInterrupt	; irq8
      00802C 82 00 80 80            224 	int NonHandledInterrupt	; irq9
      008030 82 00 80 80            225 	int NonHandledInterrupt	; irq10
      008034 82 00 80 80            226 	int NonHandledInterrupt	; irq11
      008038 82 00 80 80            227 	int NonHandledInterrupt	; irq12
      00803C 82 00 80 80            228 	int NonHandledInterrupt	; irq13
      008040 82 00 80 80            229 	int NonHandledInterrupt	; irq14
      008044 82 00 80 80            230 	int NonHandledInterrupt	; irq15
      008048 82 00 80 80            231 	int NonHandledInterrupt	; irq16
      00804C 82 00 80 80            232 	int NonHandledInterrupt	; irq17
      008050 82 00 80 80            233 	int NonHandledInterrupt	; irq18
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 6.
Hexadecimal [24-Bits]



      008054 82 00 80 80            234 	int NonHandledInterrupt	; irq19
      008058 82 00 80 80            235 	int NonHandledInterrupt	; irq20
      00805C 82 00 80 80            236 	int NonHandledInterrupt	; irq21
      008060 82 00 80 80            237 	int NonHandledInterrupt	; irq22
      008064 82 00 80 85            238 	int Timer4Handler	; irq23
      008068 82 00 80 80            239 	int NonHandledInterrupt	; irq24
      00806C 82 00 80 80            240 	int NonHandledInterrupt	; irq25
      008070 82 00 80 80            241 	int NonHandledInterrupt	; irq26
      008074 82 00 80 80            242 	int NonHandledInterrupt	; irq27
      008078 82 00 80 80            243 	int NonHandledInterrupt	; irq28
      00807C 82 00 80 80            244 	int NonHandledInterrupt	; irq29
                                    245 
                                    246 ;**********************************************************
                                    247         .area CODE
                                    248 ;**********************************************************
                                    249 
                                    250 ; non handled interrupt reset MCU
      008080                        251 NonHandledInterrupt:
      008080 A6 80            [ 1]  252         ld a, #0x80
      008082 C7 50 D1         [ 1]  253         ld WWDG_CR,a ; WWDG_CR used to reset mcu
                                    254 	;iret
                                    255 
                                    256 ; used for milliseconds counter 
                                    257 ; MS is 16 bits counter 
      008085                        258 Timer4Handler:
      008085 72 5F 53 42      [ 1]  259 	clr TIM4_SR 
      008089 BE 32            [ 2]  260         ldw x,MS 
      00808B 5C               [ 1]  261         incw x 
      00808C BF 32            [ 2]  262         ldw MS,x
      00808E BE 34            [ 2]  263         ldw x,CNTDWN 
      008090 27 03            [ 1]  264         jreq 1$
      008092 5A               [ 2]  265         decw x 
      008093 BF 34            [ 2]  266         ldw CNTDWN,x 
      008095                        267 1$:         
      008095 80               [11]  268         iret 
                                    269 
                                    270 
                                    271 ;; Main entry points and COLD start data
      008096                        272 main:
                                    273 ; clear all RAM
      008096 AE 00 00         [ 2]  274 	ldw X,#RAMBASE
      008099                        275 clear_ram0:
      008099 7F               [ 1]  276 	clr (X)
      00809A 5C               [ 1]  277 	incw X
      00809B A3 17 FF         [ 2]  278 	cpw X,#RAM_END
      00809E 23 F9            [ 2]  279 	jrule clear_ram0
      0080A0 AE 17 FF         [ 2]  280         ldw x,#RPP
      0080A3 94               [ 1]  281         ldw sp,x
                                    282 ; set SEEDX and SEEDY to 1 
      0080A4 3C 3B            [ 1]  283         inc SEEDX+1 
      0080A6 3C 3D            [ 1]  284         inc SEEDY+1          
      0080A8 CC 80 CB         [ 2]  285 	jp ORIG
                                    286 
                                    287 ; COLD initialize these variables.
      0080AB                        288 UZERO:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 7.
Hexadecimal [24-Bits]



      0080AB 00 0A                  289         .word      BASEE   ;BASE
      0080AD 00 0A                  290         .word      10      ; floating point base 
      0080AF 00 00                  291         .word      0       ; floating point state 
      0080B1 00 00                  292         .word      0       ;tmp
      0080B3 00 00                  293         .word      0       ;>IN
      0080B5 00 00                  294         .word      0       ;#TIB
      0080B7 17 00                  295         .word      TIBB    ;TIB
      0080B9 94 79                  296         .word      INTER   ;'EVAL
      0080BB 00 00                  297         .word      0       ;HLD
      0080BD AA D8                  298         .word      LASTN  ;CNTXT pointer
      0080BF 00 80                  299         .word      VAR_BASE   ;variables free space pointer 
      0080C1 AB 00                  300         .word      app_space ; FLASH free space pointer 
      0080C3 AA D8                  301         .word      LASTN   ;LAST
      0080C5 00 00                  302         .word      0        ; OFFSET 
      0080C7 00 00                  303         .word      0       ; TFLASH
                                    304 ;       .word      0       ; URLAST   
      0080C9 00 00                  305 UEND:   .word      0
                                    306 
      0080CB                        307 ORIG:   
                                    308 ; initialize SP
      0080CB AE 17 FF         [ 2]  309         LDW     X,#STACK  ;initialize return stack
      0080CE 94               [ 1]  310         LDW     SP,X
      0080CF BF 30            [ 2]  311         LDW     RP0,X
      0080D1 AE 16 80         [ 2]  312         LDW     X,#DATSTK ;initialize data stack
      0080D4 BF 2E            [ 2]  313         LDW     SP0,X
                           000001   314 .if NUCLEO        
                                    315 ; initialize PC_5 as output to control LED2
                                    316 ; added by Picatout 
      0080D6 72 1A 50 0D      [ 1]  317         bset PC_CR1,#LED2_BIT
      0080DA 72 1A 50 0E      [ 1]  318         bset PC_CR2,#LED2_BIT
      0080DE 72 1A 50 0C      [ 1]  319         bset PC_DDR,#LED2_BIT
                                    320 .endif 
                           000000   321 .if DISCOVERY
                                    322         bset PD_CR1,#LD1_BIT
                                    323         bset PD_CR2,#LD1_BIT
                                    324         bset PD_DDR,#LD1_BIT 
                                    325 .endif
      000062                        326         _ledoff
                           000001     1         .if NUCLEO 
      0080E2 72 1B 50 0A      [ 1]    2         bres PC_ODR,#LED2_BIT
                           000000     3         .else ;DISCOVERY 
                                      4         .if DISCOVERY
                                      5         bset PD_ODR,#LD1_BIT 
                                      6         .endif 
                                      7         .endif
                                    327 ; initialize clock to HSI
                                    328 ; no divisor 16Mhz 
                                    329 ; Added by Picatout 
      0080E6                        330 clock_init:
      0080E6 72 5F 50 C6      [ 1]  331         clr CLK_CKDIVR
      0080EA 72 12 50 C5      [ 1]  332 	bset CLK_SWCR,#CLK_SWCR_SWEN
                           000001   333 .if NUCLEO|DOORBELL
      0080EE A6 E1            [ 1]  334 	ld a,#CLK_SWR_HSI
                           000000   335 .else ; DISCOVERY as 16Mhz crystal
                                    336 	ld a,#CLK_SWR_HSE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 8.
Hexadecimal [24-Bits]



                                    337 .endif 
      0080F0 C7 50 C4         [ 1]  338 	ld CLK_SWR,a
      0080F3 C1 50 C3         [ 1]  339 1$:	cp a,CLK_CMSR
      0080F6 26 FB            [ 1]  340 	jrne 1$
                                    341         
                                    342 ; initialize UART, 115200 8N1
      0080F8                        343 uart_init:
                           000001   344 .if NUCLEO 
      0080F8 72 14 50 C7      [ 1]  345 	bset CLK_PCKENR1,#CLK_PCKENR1_UART1
                                    346 	; configure tx pin
      0080FC 72 1A 50 02      [ 1]  347 	bset PA_DDR,#UART1_TX_PIN ; tx pin
      008100 72 1A 50 03      [ 1]  348 	bset PA_CR1,#UART1_TX_PIN ; push-pull output
      008104 72 1A 50 04      [ 1]  349 	bset PA_CR2,#UART1_TX_PIN ; fast output
                                    350 	; baud rate 115200 Fmaster=16Mhz  16000000/115200=139=0x8b
                           000000   351 .else ; DISCOVERY use UART2 
                                    352 	bset CLK_PCKENR1,#CLK_PCKENR1_UART2
                                    353 	; configure tx pin
                                    354 	bset PD_DDR,#UART2_TX_PIN ; tx pin
                                    355 	bset PD_CR1,#UART2_TX_PIN ; push-pull output
                                    356 	bset PD_CR2,#UART2_TX_PIN ; fast output
                                    357 .endif
                                    358 ; baud rate 115200 Fmaster=8Mhz  
      008108 35 0B 52 33      [ 1]  359 	mov UART_BRR2,#0x0b ; must be loaded first
      00810C 35 08 52 32      [ 1]  360 	mov UART_BRR1,#0x8
      008110 35 0C 52 35      [ 1]  361 	mov UART_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN));|(1<<UART_CR2_RIEN))
                                    362 ; initialize timer4, used for millisecond interrupt  
      008114 35 07 53 45      [ 1]  363 	mov TIM4_PSCR,#7 ; prescale 128  
      008118 35 7D 53 46      [ 1]  364 	mov TIM4_ARR,#125 ; set for 1msec.
      00811C 35 05 53 40      [ 1]  365 	mov TIM4_CR1,#((1<<TIM4_CR1_CEN)|(1<<TIM4_CR1_URS))
      008120 72 10 53 41      [ 1]  366 	bset TIM4_IER,#TIM4_IER_UIE 
                                    367 ; set TIM4 interrupt priority to highest
      008124 A6 3F            [ 1]  368         ld a,#~(IPR_MASK<<6)
      008126 C4 7F 75         [ 1]  369         and a,ITC_SPR6
      008129 AA C0            [ 1]  370         or a,#(IPR3<<6)
      00812B C7 7F 75         [ 1]  371         ld ITC_SPR6,a 
      00812E 9A               [ 1]  372         rim
      00812F CC 9B 7D         [ 2]  373         jp  COLD   ;default=MN1
                                    374 
                                    375 
                                    376 ;; place MCU in sleep mode with
                                    377 ;; halt opcode 
                                    378 ;; BYE ( -- )
      008132 00 00                  379         .word 0
                           0000B4   380         LINK=.
      008134 03                     381         .byte 3 
      008135 42 59 45               382         .ascii "BYE"
      008138                        383 BYE: 
      008138 8E               [10]  384         halt 
      008139 81               [ 4]  385         ret 
                                    386 
                                    387 ; Enable interrupts 
                                    388 ; EI ( -- )
      00813A 81 34                  389         .word LINK 
                           0000BC   390         LINK=.
      00813C 02                     391         .byte 2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 9.
Hexadecimal [24-Bits]



      00813D 45 49                  392         .ascii "EI"
      00813F                        393 EI:
      00813F 9A               [ 1]  394         rim 
      008140 81               [ 4]  395         ret 
                                    396 
                                    397 ; Disable interrupts
                                    398 ; DI ( -- )
      008141 81 3C                  399         .word LINK 
                           0000C3   400         LINK=.
      008143 02                     401         .byte 2 
      008144 44 49                  402         .ascii "DI"
      008146                        403 DI:
      008146 9B               [ 1]  404         sim 
      008147 81               [ 4]  405         ret 
                                    406 
                                    407 ; set interrupt priority level 
                                    408 ; SET-ISP ( n1 n2 -- )
                                    409 ; n1 level {1..3}
                                    410 ; n2 vector {0..29}
      008148 81 43                  411         .word LINK 
                           0000CA   412         LINK=.
      00814A 07                     413         .byte 7 
      00814B 53 45 54 2D 49 53 50   414         .ascii "SET-ISP"
      008152                        415 SETISP:
      008152 90 93            [ 1]  416         ldw y,x 
      008154 90 FE            [ 2]  417         ldw y,(y)
      008156 A6 04            [ 1]  418         ld a,#4 ; 4 slot per register 
                                    419 ;  quotient select register, remainder select slot in register.        
      008158 90 62            [ 2]  420         div y,a ; register=ITC_SPR1[Y], lshift=2*A 
      00815A A4 03            [ 1]  421         and a,#3 
      00815C 48               [ 1]  422         sll a ; 2*SLOT  lshift 
      00815D 72 A9 7F 70      [ 2]  423         addw y,#ITC_SPR1 
      008161 FF               [ 2]  424         ldw (x),y  ; ( level reg -- )
      008162 90 5F            [ 1]  425         clrw y 
      008164 90 97            [ 1]  426         ld yl,a 
      008166 1D 00 02         [ 2]  427         subw x,#CELLL 
      008169 FF               [ 2]  428         ldw (x),y  ; ( level reg lshift -- )
      00816A 90 93            [ 1]  429         ldw y,x 
      00816C 90 EE 02         [ 2]  430         ldw y,(2,y) 
      00816F 90 F6            [ 1]  431         ld a,(y)   ; reg_value
      008171 1D 00 02         [ 2]  432         subw x,#CELLL 
      008174 FF               [ 2]  433         ldw (x),y ; ( level reg lshift rval -- )
      008175 CD 86 48         [ 4]  434         call OVER ; ( level reg lshift rval lshift -- )
      008178 CD 84 F9         [ 4]  435         call DOLIT 
      00817B 00 03                  436         .word 3
      00817D CD 86 2E         [ 4]  437         call SWAPP  ; ( level reg lshift rval 3 lshift )
      008180 CD 8B 35         [ 4]  438         call LSHIFT ; creat slot mask 
      008183 CD 88 33         [ 4]  439         call INVER  ; ( level reg lshift rval mask )
      008186 CD 86 6A         [ 4]  440         call ANDD ; ( level reg lshift slot_masked )
      008189 CD 85 E7         [ 4]  441         call TOR  ; ( level reg lshift -- R: slot_masked )
      00818C CD 87 D9         [ 4]  442         call ROT  ; ( reg lshift level )
      00818F CD 86 2E         [ 4]  443         call SWAPP ; ( reg level lshift )
      008192 CD 8B 35         [ 4]  444         call LSHIFT  ; ( reg slot_level -- )
      008195 CD 85 C8         [ 4]  445         call RFROM ; ( reg slot_level masked_val )
      008198 CD 86 7E         [ 4]  446         call ORR   ; ( reg updated_rval )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



      00819B CD 86 2E         [ 4]  447         call SWAPP 
      00819E CD 85 84         [ 4]  448         call CSTOR
                                    449 
                                    450 ; sélectionne l'application 
                                    451 ; qui démarre automatique lors 
                                    452 ; d'un COLD start 
      0081A1 81 4A                  453         .word LINK 
                           000123   454         LINK=.
      0081A3 07                     455         .byte 7
      0081A4 41 55 54 4F 52 55 4E   456         .ascii "AUTORUN"
      0081AB                        457 AUTORUN:
      0081AB CD 92 3E         [ 4]  458         call TOKEN 
      0081AE CD 86 1E         [ 4]  459         call DUPP 
      0081B1 CD 85 2C         [ 4]  460         call QBRAN 
      0081B4 82 91                  461         .word FORGET2
      0081B6 CD 93 3B         [ 4]  462         call NAMEQ
      0081B9 CD 87 C8         [ 4]  463         call QDUP 
      0081BC CD 85 2C         [ 4]  464         call QBRAN 
      0081BF 82 91                  465         .word FORGET2
      0081C1 CD 86 14         [ 4]  466         call DROP 
      0081C4 1D 00 04         [ 2]  467         subw x,#2*CELLL 
      0081C7 90 5F            [ 1]  468         clrw y 
      0081C9 FF               [ 2]  469         ldw (x),y 
      0081CA 90 AE 40 02      [ 2]  470         ldw y,#APP_RUN 
      0081CE EF 02            [ 2]  471         ldw (2,x),y 
      0081D0 CC 9E 79         [ 2]  472         jp EESTORE 
                                    473 
                                    474 ;; Reset dictionary pointer before 
                                    475 ;; forgotten word. RAM space and 
                                    476 ;; interrupt vector defined after 
                                    477 ;; must be resetted also.
      0081D3 81 A3                  478         .word LINK 
                           000155   479         LINK=.
      0081D5 06                     480         .byte 6
      0081D6 46 4F 52 47 45 54      481         .ascii "FORGET" 
      0081DC                        482 FORGET: 
      0081DC CD 92 3E         [ 4]  483         call TOKEN
      0081DF CD 86 1E         [ 4]  484         call DUPP 
      0081E2 CD 85 2C         [ 4]  485         call QBRAN 
      0081E5 82 91                  486         .word FORGET2
      0081E7 CD 93 3B         [ 4]  487         call NAMEQ ; ( a -- ca na | a F )
      0081EA CD 87 C8         [ 4]  488         call QDUP 
      0081ED CD 85 2C         [ 4]  489         call QBRAN 
      0081F0 82 91                  490         .word FORGET2
                                    491 ; only forget users words 
      0081F2 CD 86 1E         [ 4]  492         call DUPP ; ( ca na na )
      0081F5 CD 84 F9         [ 4]  493         call DOLIT 
      0081F8 AB 00                  494         .word app_space 
      0081FA CD 86 2E         [ 4]  495         call SWAPP 
      0081FD CD 88 D9         [ 4]  496         call  ULESS 
      008200 CD 85 2C         [ 4]  497         call QBRAN 
      008203 82 53                  498         .word FORGET6 
                                    499 ; ( ca na -- )        
                                    500 ;reset ivec with address >= ca
      008205 CD 86 2E         [ 4]  501         call SWAPP ; ( na ca -- ) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



      008208 CD A0 7C         [ 4]  502         call CHKIVEC ; ( na -- ) 
                                    503 ; start at LAST and link back to na 
                                    504 ; if variable found reset VP at that point.
      00820B                        505 FORGET1:
      00820B CD 87 8A         [ 4]  506         call LAST 
      00820E CD 85 77         [ 4]  507         call AT 
      008211 CD 86 1E         [ 4]  508         call DUPP  ; ( -- na last last )
      008214 CD 82 A7         [ 4]  509         call FREEVAR ; ( -- na last )
      008217 CD 86 1E         [ 4]  510         call DUPP 
      00821A CD 84 F9         [ 4]  511         call DOLIT 
      00821D 00 02                  512         .word 2 
      00821F CD 88 92         [ 4]  513         call SUBB ; ( na last -- na last lfa ) link address 
      008222 CD 85 77         [ 4]  514         call AT 
      008225 CD 86 1E         [ 4]  515         call DUPP ; ( -- na last a a )
      008228 CD 87 5E         [ 4]  516         call CNTXT 
      00822B CD 85 60         [ 4]  517         call STORE
      00822E CD 87 8A         [ 4]  518         call LAST  
      008231 CD 85 60         [ 4]  519         call STORE ; ( --  na last )
      008234 CD 86 48         [ 4]  520         call OVER 
      008237 CD 88 BA         [ 4]  521         call EQUAL ; ( na last na -- na T|F ) 
      00823A CD 85 2C         [ 4]  522         call QBRAN 
      00823D 82 0B                  523         .word FORGET1 
                                    524 ; ( na -- )
      00823F CD 84 F9         [ 4]  525         call DOLIT 
      008242 00 02                  526         .word 2 
      008244 CD 88 92         [ 4]  527         call SUBB 
      008247 CD 87 7A         [ 4]  528         call CPP 
      00824A CD 85 60         [ 4]  529         call STORE  
      00824D CD 9C AC         [ 4]  530         call UPDATCP 
      008250 CC 9C 83         [ 2]  531         jp UPDATLAST 
      008253                        532 FORGET6: ; tried to forget a RAM or system word 
                                    533 ; ( ca na -- )
      008253 1D 00 02         [ 2]  534         subw x,#CELLL 
      008256 90 BE 2E         [ 2]  535         ldw y,SP0 
      008259 FF               [ 2]  536         ldw (x),y  
      00825A CD 88 D9         [ 4]  537         call ULESS
      00825D CD 85 2C         [ 4]  538         call QBRAN 
      008260 82 83                  539         .word PROTECTED 
      008262 CD 94 47         [ 4]  540         call ABORQ 
      008265 1D                     541         .byte 29
      008266 20 46 6F 72 20 52 41   542         .ascii " For RAM definition do REBOOT"
             4D 20 64 65 66 69 6E
             69 74 69 6F 6E 20 64
             6F 20 52 45 42 4F 4F
             54
      008283                        543 PROTECTED:
      008283 CD 94 47         [ 4]  544         call ABORQ
      008286 0A                     545         .byte 10
      008287 20 50 72 6F 74 65 63   546         .ascii " Protected"
             74 65 64
      008291                        547 FORGET2: ; no name or not found in dictionary 
      008291 CD 94 47         [ 4]  548         call ABORQ
      008294 05                     549         .byte 5
      008295 20 77 68 61 74         550         .ascii " what"
      00829A                        551 FORGET4:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]



      00829A CC 86 14         [ 2]  552         jp DROP 
                                    553 
                                    554 
                                    555 ;---------------------------------
                                    556 ; if na is variable 
                                    557 ; free variable data  
                                    558 ; FREEVAR ( na -- )
                                    559 ;---------------------------------
      00829D 81 D5                  560         .word LINK 
                           00021F   561         LINK=.
      00829F 07                     562         .byte 7 
      0082A0 46 52 45 45 56 41 52   563         .ascii "FREEVAR"
      0082A7                        564 FREEVAR:
      0082A7 CD 86 1E         [ 4]  565         call DUPP ; ( na na -- )
      0082AA CD 85 95         [ 4]  566         CALL CAT  ; ( na c -- )
      0082AD CD 8B 17         [ 4]  567         call ONEP ;
      0082B0 CD 88 19         [ 4]  568         CALL PLUS ; ( na c+1 -- ca ) 
      0082B3 CD 8B 17         [ 4]  569         call ONEP ; ( ca+ -- ) to get routne address 
      0082B6 CD 86 1E         [ 4]  570         call DUPP ; ( ca+ ca+ -- )
      0082B9 CD 85 77         [ 4]  571         CALL AT   ; ( ca+ fnaddr -- ) ; fnaddr is routine address 
      0082BC CD 84 F9         [ 4]  572         call DOLIT 
      0082BF 86 CB                  573         .word DOVAR ; if routine address is DOVAR then variable 
      0082C1 CD 88 BA         [ 4]  574         call EQUAL  ; ( ca+ fnaddr DOVAR -- ca+ T|F ) 
      0082C4 CD 85 2C         [ 4]  575         call QBRAN 
      0082C7 82 DD                  576         .word FREEVAR4 
      0082C9 CD 84 F9         [ 4]  577         call DOLIT 
      0082CC 00 02                  578         .word 2 
      0082CE CD 88 19         [ 4]  579         call PLUS  ; ( ca+ 2 -- da ) da is data address 
      0082D1 CD 85 77         [ 4]  580         call AT 
      0082D4 CD 87 6C         [ 4]  581         call VPP   
      0082D7 CD 85 60         [ 4]  582         call STORE 
      0082DA CC 9C C3         [ 2]  583         jp UPDATVP 
      0082DD                        584 FREEVAR4: ; not variable
      0082DD CC 86 14         [ 2]  585         jp  DROP 
                                    586 
                                    587 ;    SEED ( n -- )
                                    588 ; Initialize PRNG seed with n 
      0082E0 82 9F                  589         .word LINK 
                           000262   590         LINK=. 
      0082E2 04                     591         .byte 4 
      0082E3 53 45 45 44            592         .ascii "SEED" 
      0082E7                        593 SEED:
      0082E7 90 93            [ 1]  594         ldw y,x 
      0082E9 1C 00 02         [ 2]  595         addw x,#CELLL
      0082EC 90 FE            [ 2]  596         ldw y,(y)
      0082EE 90 9E            [ 1]  597         ld a,yh 
      0082F0 B7 3A            [ 1]  598         ld SEEDX,a 
      0082F2 90 9F            [ 1]  599         ld a,yl 
      0082F4 B7 3C            [ 1]  600         ld SEEDY,a 
      0082F6 81               [ 4]  601         ret 
                                    602 
                                    603 ;    RANDOM ( u1 -- u2 )
                                    604 ; Pseudo random number betwen 0 and u1-1
      0082F7 82 E2                  605         .word LINK 
                           000279   606         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 13.
Hexadecimal [24-Bits]



      0082F9 06                     607         .byte 6
      0082FA 52 41 4E 44 4F 4D      608         .ascii "RANDOM" 
      008300                        609 RANDOM:
                                    610 ;local variable 
                           000001   611         SPSAVE=1
                           000002   612         VSIZE=2 
      008300 52 02            [ 2]  613         sub sp,#VSIZE
      008302 1F 01            [ 2]  614         ldw (SPSAVE,sp),x  
                                    615 ; XTEMP=(SEEDX<<5)^SEEDX 
      008304 90 93            [ 1]  616         ldw y,x 
      008306 90 FE            [ 2]  617         ldw y,(y)
      008308 90 BF 28         [ 2]  618         ldw YTEMP,y 
      00830B BE 3A            [ 2]  619 	ldw x,SEEDX 
      00830D 58               [ 2]  620 	sllw x 
      00830E 58               [ 2]  621 	sllw x 
      00830F 58               [ 2]  622 	sllw x 
      008310 58               [ 2]  623 	sllw x 
      008311 58               [ 2]  624 	sllw x 
      008312 9E               [ 1]  625 	ld a,xh 
      008313 B8 3A            [ 1]  626 	xor a,SEEDX 
      008315 B7 26            [ 1]  627 	ld XTEMP,a 
      008317 9F               [ 1]  628 	ld a,xl 
      008318 B8 3B            [ 1]  629 	xor a,SEEDX+1 
      00831A B7 27            [ 1]  630 	ld XTEMP+1,a 
                                    631 ; SEEDX=SEEDY 
      00831C BE 3C            [ 2]  632 	ldw x,SEEDY 
      00831E BF 3A            [ 2]  633 	ldw SEEDX,x  
                                    634 ; SEEDY=SEEDY^(SEEDY>>1)
      008320 54               [ 2]  635 	srlw x 
      008321 9E               [ 1]  636 	ld a,xh 
      008322 B8 3C            [ 1]  637 	xor a,SEEDY 
      008324 B7 3C            [ 1]  638 	ld SEEDY,a  
      008326 9F               [ 1]  639 	ld a,xl 
      008327 B8 3D            [ 1]  640 	xor a,SEEDY+1 
      008329 B7 3D            [ 1]  641 	ld SEEDY+1,a 
                                    642 ; XTEMP>>3 
      00832B BE 26            [ 2]  643 	ldw x,XTEMP 
      00832D 54               [ 2]  644 	srlw x 
      00832E 54               [ 2]  645 	srlw x 
      00832F 54               [ 2]  646 	srlw x 
                                    647 ; x=XTEMP^x 
      008330 9E               [ 1]  648 	ld a,xh 
      008331 B8 26            [ 1]  649 	xor a,XTEMP 
      008333 95               [ 1]  650 	ld xh,a 
      008334 9F               [ 1]  651 	ld a,xl 
      008335 B8 27            [ 1]  652 	xor a,XTEMP+1  
      008337 97               [ 1]  653 	ld xl,a 
                                    654 ; SEEDY=x^SEEDY 
      008338 B8 3D            [ 1]  655 	xor a,SEEDY+1
      00833A 97               [ 1]  656 	ld xl,a 
      00833B 9E               [ 1]  657 	ld a,xh 
      00833C B8 3C            [ 1]  658 	xor a,SEEDY
      00833E 95               [ 1]  659 	ld xh,a 
      00833F BF 3C            [ 2]  660 	ldw SEEDY,x 
                                    661 ; return SEEDY modulo YTEMP  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 14.
Hexadecimal [24-Bits]



      008341 90 BE 28         [ 2]  662 	ldw y,YTEMP  
      008344 65               [ 2]  663 	divw x,y 
      008345 1E 01            [ 2]  664 	ldw x,(SPSAVE,sp)
      008347 FF               [ 2]  665         ldw (x),y 
      008348 5B 02            [ 2]  666         addw sp,#VSIZE 
      00834A 81               [ 4]  667 	ret 
                                    668 
                                    669 
                                    670 ;;
                                    671 ;; get millisecond counter 
                                    672 ;; msec ( -- u )
                                    673 ;; Added by Picatout 2020-04-26
      00834B 82 F9                  674         .word LINK  
                           0002CD   675         LINK = . 
      00834D 04                     676         .byte 4
      00834E 4D 53 45 43            677         .ascii "MSEC"
      008352                        678 MSEC: 
      008352 1D 00 02         [ 2]  679         subw x,#CELLL 
      008355 90 BE 32         [ 2]  680         ldw y,MS 
      008358 FF               [ 2]  681         ldw (x),y 
      008359 81               [ 4]  682         ret 
                                    683 
                                    684 ; suspend execution for u msec 
                                    685 ;  pause ( u -- )
      00835A 83 4D                  686         .word LINK 
                           0002DC   687         LINK=.
      00835C 05                     688         .byte 5 
      00835D 50 41 55 53 45         689         .ascii "PAUSE"
      008362                        690 PAUSE:
      008362 90 93            [ 1]  691         ldw y,x
      008364 90 FE            [ 2]  692         ldw y,(y)
      008366 72 B9 00 32      [ 2]  693         addw y,MS 
      00836A 8F               [10]  694 1$:     wfi  
      00836B 90 B3 32         [ 2]  695         cpw y,MS  
      00836E 26 FA            [ 1]  696         jrne 1$        
      008370 1C 00 02         [ 2]  697         addw x,#CELLL 
      008373 81               [ 4]  698         ret 
                                    699 
                                    700 ; initialize count down timer 
                                    701 ;  TIMER ( u -- )  milliseconds 
      008374 83 5C                  702         .word LINK 
                           0002F6   703         LINK=.
      008376 05                     704         .byte 5 
      008377 54 49 4D 45 52         705         .ascii "TIMER" 
      00837C                        706 TIMER:
      00837C 90 93            [ 1]  707         ldw y,x
      00837E 90 FE            [ 2]  708         ldw y,(y) 
      008380 90 BF 34         [ 2]  709         ldw CNTDWN,y
      008383 1C 00 02         [ 2]  710         addw x,#CELLL 
      008386 81               [ 4]  711         ret 
                                    712 
                                    713 ; check for TIMER exiparition 
                                    714 ;  TIMEOUT? ( -- 0|-1 )
      008387 83 76                  715         .word LINK 
                           000309   716         LINK=. 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 15.
Hexadecimal [24-Bits]



      008389 08                     717         .byte 8 
      00838A 54 49 4D 45 4F 55 54   718         .ascii "TIMEOUT?"
             3F
      008392                        719 TIMEOUTQ: 
      008392 4F               [ 1]  720         clr a
      008393 1D 00 02         [ 2]  721         subw x,#CELLL 
      008396 90 BE 34         [ 2]  722         ldw y,CNTDWN 
      008399 26 01            [ 1]  723         jrne 1$ 
      00839B 43               [ 1]  724         cpl a 
      00839C E7 01            [ 1]  725 1$:     ld (1,x),a 
      00839E F7               [ 1]  726         ld (x),a 
      00839F 81               [ 4]  727         ret         
                                    728 
                                    729 ; reboot MCU 
                                    730 ; REBOOT ( -- )
      0083A0 83 89                  731         .word LINK 
                           000322   732         LINK=. 
      0083A2 06                     733         .byte 6 
      0083A3 52 45 42 4F 4F 54      734         .ascii "REBOOT"
      0083A9                        735 reboot:
      0083A9 CC 80 80         [ 2]  736         jp NonHandledInterrupt
                                    737 
                                    738 ; compile to flash memory 
                                    739 ; TO-FLASH ( -- )
      0083AC 83 A2                  740         .word LINK 
                           00032E   741         LINK=.
      0083AE 08                     742         .byte 8
      0083AF 54 4F 2D 46 4C 41 53   743         .ascii "TO-FLASH"
             48
      0083B7                        744 TOFLASH:
      0083B7 CD 87 9D         [ 4]  745         call RAMLAST 
      0083BA CD 85 77         [ 4]  746         call AT 
      0083BD CD 87 C8         [ 4]  747         call QDUP 
      0083C0 CD 85 2C         [ 4]  748         call QBRAN
      0083C3 83 E6                  749         .word 1$
      0083C5 CD 94 47         [ 4]  750         call ABORQ 
      0083C8 1D                     751         .byte 29
      0083C9 20 4E 6F 74 20 77 68   752         .ascii " Not while definitions in RAM"   
             69 6C 65 20 64 65 66
             69 6E 69 74 69 6F 6E
             73 20 69 6E 20 52 41
             4D
      0083E6 90 AE FF FF      [ 2]  753 1$:     ldw y,#-1 
      0083EA 90 BF 22         [ 2]  754         ldw UTFLASH,y
      0083ED 81               [ 4]  755         ret 
                                    756 
                                    757 ; compile to RAM 
                                    758 ; TO-RAM ( -- )
      0083EE 83 AE                  759         .word LINK 
                           000370   760         LINK=.
      0083F0 06                     761         .byte 6 
      0083F1 54 4F 2D 52 41 4D      762         .ascii "TO-RAM"
      0083F7                        763 TORAM:
      0083F7 90 5F            [ 1]  764         clrw y 
      0083F9 90 BF 22         [ 2]  765         ldw UTFLASH,y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 16.
Hexadecimal [24-Bits]



      0083FC 81               [ 4]  766         ret 
                                    767 
                                    768 ;; BAUD RATE constants table
                                    769 ; values to put in BRR1 & BRR2 
      0083FD                        770 baudrate: 
      0083FD A0 1B                  771 	.byte 0xa0,0x1b ; 2400
      0083FF D0 05                  772 	.byte 0xd0,0x5  ; 4800 
      008401 68 03                  773 	.byte 0x68,0x3  ; 9600
      008403 34 01                  774 	.byte 0x34,0x1  ; 19200
      008405 11 06                  775 	.byte 0x11,0x6  ; 57600
      008407 08 0B                  776 	.byte 0x8,0xb   ; 115200
                                    777 
                                    778 ; BAUD RATE CONSTANTS names 
                                    779 ; 2400 baud
      008409 83 F0                  780 	.word LINK
                           00038B   781 LINK	= .
      00840B 04                     782 	.byte 4
      00840C 42 32 4B 34            783 	.ascii "B2K4" 
      008410                        784 B2K4:
      008410 1D 00 02         [ 2]  785 	subw x,#CELLL 
      008413 90 5F            [ 1]  786         clrw y
      008415 FF               [ 2]  787         ldw (x),y
      008416 81               [ 4]  788 	ret
                                    789 ; 4800 baud	
      008417 84 0B                  790 	.word LINK
                           000399   791 LINK	= .
      008419 04                     792 	.byte 4
      00841A 42 34 4B 38            793 	.ascii "B4K8" 
      00841E                        794 B4K8:
      00841E 1D 00 02         [ 2]  795         subw x,#CELLL 
      008421 90 AE 00 02      [ 2]  796         ldw y,#2 
      008425 FF               [ 2]  797         ldw (x),y
      008426 81               [ 4]  798         ret 
                                    799 ; 9600 baud
      008427 84 19                  800 	.word LINK
                           0003A9   801 LINK	= .
      008429 04                     802 	.byte 4
      00842A 42 39 4B 36            803 	.ascii "B9K6" 
      00842E                        804 B9K6:
      00842E 1D 00 02         [ 2]  805         subw x,#CELLL 
      008431 90 AE 00 04      [ 2]  806         ldw y,#4 
      008435 FF               [ 2]  807         ldw (x),y 
      008436 81               [ 4]  808         ret 
                                    809 ; 19200 baud
      008437 84 29                  810 	.word LINK
                           0003B9   811 LINK	= .
      008439 05                     812 	.byte 5
      00843A 42 31 39 4B 32         813 	.ascii "B19K2" 
      00843F                        814 B19K2:
      00843F 1D 00 02         [ 2]  815         subw x,#CELLL
      008442 90 AE 00 06      [ 2]  816         ldw y,#6 
      008446 FF               [ 2]  817         ldw (x),y 
      008447 81               [ 4]  818         ret 
                                    819 ; 57600 baud        
      008448 84 39                  820 	.word LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 17.
Hexadecimal [24-Bits]



                           0003CA   821 LINK	= .
      00844A 05                     822 	.byte 5
      00844B 42 35 37 4B 36         823 	.ascii "B57K6" 
      008450                        824 B57K6:
      008450 1D 00 02         [ 2]  825         subw x,#CELLL 
      008453 90 AE 00 08      [ 2]  826         ldw y,#8 
      008457 FF               [ 2]  827         ldw (x),y 
      008458 81               [ 4]  828         ret 
                                    829 ; 115200 baud 
      008459 84 4A                  830 	.word LINK
                           0003DB   831 LINK	= .
      00845B 06                     832 	.byte 6
      00845C 42 31 31 35 4B 32      833 	.ascii "B115K2" 
      008462                        834 B115K2:
      008462 1D 00 02         [ 2]  835 	subw x,#CELLL 
      008465 90 AE 00 0A      [ 2]  836         ldw y,#10 
      008469 FF               [ 2]  837         ldw (x),y 
      00846A 81               [ 4]  838         ret 
                                    839 	
                                    840 ;; set UART2 BAUD rate
                                    841 ;	BAUD ( u -- )
      00846B 84 5B                  842 	.word LINK 
                           0003ED   843 LINK	= .
      00846D 04                     844 	.byte 4
      00846E 42 41 55 44            845 	.ascii "BAUD" 
      008472                        846 BAUD:
      008472 1D 00 02         [ 2]  847 	subw x,#CELLL
      008475 90 AE 83 FD      [ 2]  848         ldw y,#baudrate 
      008479 FF               [ 2]  849         ldw (x),y 
      00847A CD 88 19         [ 4]  850         call PLUS
      00847D 90 93            [ 1]  851         ldw y,x  
      00847F 90 FE            [ 2]  852         ldw y,(y)
      008481 90 F6            [ 1]  853         ld a,(y)
      008483 88               [ 1]  854         push a 
      008484 90 5C            [ 1]  855         incw y 
      008486 90 F6            [ 1]  856         ld a,(y)
      008488 C7 52 33         [ 1]  857         ld UART_BRR2,a 
      00848B 84               [ 1]  858         pop a
      00848C C7 52 32         [ 1]  859         ld UART_BRR1,a 
      00848F 1C 00 02         [ 2]  860         addw x,#CELLL 
      008492 81               [ 4]  861         ret 
                                    862 
                                    863 ;; Device dependent I/O
                                    864 ;       ?RX     ( -- c T | F )
                                    865 ;         Return input byte and true, or false.
      008493 84 6D                  866         .word      LINK 
                           000415   867 LINK	= .
      008495 04                     868         .byte      4
      008496 3F 4B 45 59            869         .ascii     "?KEY"
      00849A                        870 QKEY:
      00849A 90 5F            [ 1]  871         CLRW Y 
      00849C 72 0B 52 30 0B   [ 2]  872         BTJF UART_SR,#UART_SR_RXNE,INCH   ;check status
      0084A1 C6 52 31         [ 1]  873         LD    A,UART_DR   ;get char in A
      0084A4 1D 00 02         [ 2]  874 	SUBW	X,#2
      0084A7 E7 01            [ 1]  875         LD     (1,X),A
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
Hexadecimal [24-Bits]



      0084A9 7F               [ 1]  876 	CLR	(X)
      0084AA 90 53            [ 2]  877         CPLW     Y
      0084AC                        878 INCH:
      0084AC 1D 00 02         [ 2]  879 		SUBW	X,#2
      0084AF FF               [ 2]  880         LDW     (X),Y
      0084B0 81               [ 4]  881         RET
                                    882 
                                    883 ;       TX!     ( c -- )
                                    884 ;       Send character c to  output device.
      0084B1 84 95                  885         .word      LINK
                           000433   886 LINK	= .
      0084B3 04                     887         .byte      4
      0084B4 45 4D 49 54            888         .ascii     "EMIT"
      0084B8                        889 EMIT:
      0084B8 E6 01            [ 1]  890         LD     A,(1,X)
      0084BA 1C 00 02         [ 2]  891 	ADDW	X,#2
      0084BD 72 0F 52 30 FB   [ 2]  892 OUTPUT: BTJF UART_SR,#UART_SR_TXE,OUTPUT  ;loop until tx empty 
      0084C2 C7 52 31         [ 1]  893         LD    UART_DR,A   ;send A
      0084C5 81               [ 4]  894         RET
                                    895 
                                    896 ;       FC-XON  ( -- )
                                    897 ;       send XON character 
      0084C6 84 B3                  898         .word LINK
                           000448   899 LINK    = .
      0084C8 06                     900         .byte 6 
      0084C9 46 43 2D 58 4F 4E      901         .ascii "FC-XON"
      0084CF                        902 FC_XON:
      0084CF 1D 00 02         [ 2]  903         subw x,#CELLL 
      0084D2 7F               [ 1]  904         clr (x)
      0084D3 A6 11            [ 1]  905         ld a,#XON 
      0084D5 E7 01            [ 1]  906         ld (1,x),a 
      0084D7 CD 84 B8         [ 4]  907         call EMIT 
      0084DA 81               [ 4]  908         ret 
                                    909 
                                    910 ;       FC-XOFF ( -- )
                                    911 ;       Send XOFF character 
      0084DB 84 C8                  912         .word LINK
                           00045D   913 LINK    = .
      0084DD 07                     914         .byte 7
      0084DE 46 43 2D 58 4F 46 46   915         .ascii "FC-XOFF"
      0084E5                        916 FC_XOFF:
      0084E5 1D 00 02         [ 2]  917         subw x,#CELLL 
      0084E8 7F               [ 1]  918         clr (x)
      0084E9 A6 13            [ 1]  919         ld a,#XOFF 
      0084EB E7 01            [ 1]  920         ld (1,x),a 
      0084ED CD 84 B8         [ 4]  921         call EMIT 
      0084F0 81               [ 4]  922         ret
                                    923 
                                    924 ;; The kernel
                                    925 
                                    926 ;       doLIT   ( -- w )
                                    927 ;       Push an inline literal.
      0084F1 84 DD                  928         .word      LINK
                           000473   929 LINK	= 	.
      0084F3 45                     930 	.byte      COMPO+5
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]



      0084F4 44 4F 4C 49 54         931         .ascii     "DOLIT"
      0084F9                        932 DOLIT:
      0084F9 1D 00 02         [ 2]  933 	SUBW X,#2
      0084FC 16 01            [ 2]  934         ldw y,(1,sp)
      0084FE 90 FE            [ 2]  935         ldw y,(y)
      008500 FF               [ 2]  936         ldw (x),y
      008501 90 85            [ 2]  937         popw y 
      008503 90 EC 02         [ 2]  938         jp (2,y)
                                    939 
                                    940 ;       next    ( -- )
                                    941 ;       Code for  single index loop.
      008506 84 F3                  942         .word      LINK
                           000488   943 LINK	= 	.
      008508 44                     944 	.byte      COMPO+4
      008509 6E 65 78 74            945         .ascii     "next"
      00850D                        946 DONXT:
      00850D 16 03            [ 2]  947 	LDW Y,(3,SP)
      00850F 90 5A            [ 2]  948 	DECW Y
      008511 2A 07            [ 1]  949 	JRPL NEX1 ; jump if N=0
      008513 90 85            [ 2]  950 	POPW Y
      008515 5B 02            [ 2]  951         addw sp,#2
      008517 90 EC 02         [ 2]  952         JP (2,Y)
      00851A                        953 NEX1:
      00851A 17 03            [ 2]  954         LDW (3,SP),Y
      00851C 90 85            [ 2]  955         POPW Y
      00851E 90 FE            [ 2]  956 	LDW Y,(Y)
      008520 90 FC            [ 2]  957 	JP (Y)
                                    958 
                                    959 ;       ?branch ( f -- )
                                    960 ;       Branch if flag is zero.
      008522 85 08                  961         .word      LINK
                           0004A4   962 LINK	= 	.
      008524 47                     963 	.byte      COMPO+7
      008525 3F 42 52 41 4E 43 48   964         .ascii     "?BRANCH"
      00852C                        965 QBRAN:	
      00852C 90 93            [ 1]  966         LDW Y,X
      00852E 1C 00 02         [ 2]  967 	ADDW X,#2
      008531 90 FE            [ 2]  968 	LDW Y,(Y)
      008533 27 0E            [ 1]  969         JREQ     BRAN
      008535 90 85            [ 2]  970 	POPW Y
      008537 90 EC 02         [ 2]  971 	JP (2,Y)
                                    972         
                                    973 ;       branch  ( -- )
                                    974 ;       Branch to an inline address.
      00853A 85 24                  975         .word      LINK
                           0004BC   976 LINK	= 	.
      00853C 46                     977 	.byte      COMPO+6
      00853D 42 52 41 4E 43 48      978         .ascii     "BRANCH"
      008543                        979 BRAN:
      008543 90 85            [ 2]  980         POPW Y
      008545 90 FE            [ 2]  981 	LDW Y,(Y)
      008547 90 FC            [ 2]  982         JP     (Y)
                                    983 
                                    984 ;       EXECUTE ( ca -- )
                                    985 ;       Execute  word at ca.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]



      008549 85 3C                  986         .word      LINK
                           0004CB   987 LINK	= 	.
      00854B 07                     988         .byte       7
      00854C 45 58 45 43 55 54 45   989         .ascii     "EXECUTE"
      008553                        990 EXECU:
      008553 90 93            [ 1]  991         LDW Y,X
      008555 1C 00 02         [ 2]  992 	ADDW X,#2
      008558 90 FE            [ 2]  993 	LDW  Y,(Y)
      00855A 90 FC            [ 2]  994         JP   (Y)
                                    995 
                           000001   996 OPTIMIZE = 1
                           000001   997 .if OPTIMIZE 
                                    998 ; remplacement de CALL EXIT par 
                                    999 ; le opcode de RET.
                                   1000 ; Voir modification au code de ";"
                           000000  1001 .else 
                                   1002 ;       EXIT    ( -- )
                                   1003 ;       Terminate a colon definition.
                                   1004         .word      LINK
                                   1005 LINK = .
                                   1006         .byte      4
                                   1007         .ascii     "EXIT"
                                   1008 EXIT:
                                   1009         POPW Y
                                   1010         RET
                                   1011 .endif 
                                   1012 
                                   1013 ;       !       ( w a -- )
                                   1014 ;       Pop  data stack to memory.
      00855C 85 4B                 1015         .word      LINK
                           0004DE  1016 LINK = .
      00855E 01                    1017         .byte      1
      00855F 21                    1018         .ascii     "!"
      008560                       1019 STORE:
      008560 90 93            [ 1] 1020         LDW Y,X
      008562 90 FE            [ 2] 1021         LDW Y,(Y)    ;Y=a
      008564 90 BF 28         [ 2] 1022         LDW YTEMP,Y
      008567 90 93            [ 1] 1023         LDW Y,X
      008569 90 EE 02         [ 2] 1024         LDW Y,(2,Y)
      00856C 91 CF 28         [ 5] 1025         LDW [YTEMP],Y ;store w at a
      00856F 1C 00 04         [ 2] 1026         ADDW X,#4 ; DDROP 
      008572 81               [ 4] 1027         RET     
                                   1028 
                                   1029 ;       @       ( a -- w )
                                   1030 ;       Push memory location to stack.
      008573 85 5E                 1031         .word      LINK
                           0004F5  1032 LINK	= 	.
      008575 01                    1033         .byte    1
      008576 40                    1034         .ascii	"@"
      008577                       1035 AT:
      008577 90 93            [ 1] 1036         LDW Y,X     ;Y = a
      008579 90 FE            [ 2] 1037         LDW Y,(Y)   ; address 
      00857B 90 FE            [ 2] 1038         LDW Y,(Y)   ; value 
      00857D FF               [ 2] 1039         LDW (X),Y ;w = @Y
      00857E 81               [ 4] 1040         RET     
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



                                   1041 
                                   1042 ;       C!      ( c b -- )
                                   1043 ;       Pop  data stack to byte memory.
      00857F 85 75                 1044         .word      LINK
                           000501  1045 LINK	= .
      008581 02                    1046         .byte      2
      008582 43 21                 1047         .ascii     "C!"
      008584                       1048 CSTOR:
      008584 90 93            [ 1] 1049         LDW Y,X
      008586 90 FE            [ 2] 1050 	LDW Y,(Y)    ;Y=b
      008588 E6 03            [ 1] 1051         LD A,(3,X)    ;D = c
      00858A 90 F7            [ 1] 1052         LD  (Y),A     ;store c at b
      00858C 1C 00 04         [ 2] 1053 	ADDW X,#4 ; DDROP 
      00858F 81               [ 4] 1054         RET     
                                   1055 
                                   1056 ;       C@      ( b -- c )
                                   1057 ;       Push byte in memory to  stack.
      008590 85 81                 1058         .word      LINK
                           000512  1059 LINK	= 	.
      008592 02                    1060         .byte      2
      008593 43 40                 1061         .ascii     "C@"
      008595                       1062 CAT:
      008595 90 93            [ 1] 1063         LDW Y,X     ;Y=b
      008597 90 FE            [ 2] 1064         LDW Y,(Y)
      008599 90 F6            [ 1] 1065         LD A,(Y)
      00859B E7 01            [ 1] 1066         LD (1,X),A
      00859D 7F               [ 1] 1067         CLR (X)
      00859E 81               [ 4] 1068         RET     
                                   1069 
                                   1070 ;       RP@     ( -- a )
                                   1071 ;       Push current RP to data stack.
      00859F 85 92                 1072         .word      LINK
                           000521  1073 LINK	= .
      0085A1 03                    1074         .byte      3
      0085A2 52 50 40              1075         .ascii     "RP@"
      0085A5                       1076 RPAT:
      0085A5 90 96            [ 1] 1077         LDW Y,SP    ;save return addr
      0085A7 1D 00 02         [ 2] 1078         SUBW X,#2
      0085AA FF               [ 2] 1079         LDW (X),Y
      0085AB 81               [ 4] 1080         RET     
                                   1081 
                                   1082 ;       RP!     ( a -- )
                                   1083 ;       Set  return stack pointer.
      0085AC 85 A1                 1084         .word      LINK
                           00052E  1085 LINK	= 	. 
      0085AE 43                    1086 	.byte      COMPO+3
      0085AF 52 50 21              1087         .ascii     "RP!"
      0085B2                       1088 RPSTO:
      0085B2 90 85            [ 2] 1089         POPW Y
      0085B4 90 BF 28         [ 2] 1090         LDW YTEMP,Y
      0085B7 90 93            [ 1] 1091         LDW Y,X
      0085B9 90 FE            [ 2] 1092         LDW Y,(Y)
      0085BB 90 94            [ 1] 1093         LDW SP,Y
      0085BD 1C 00 02         [ 2] 1094         ADDW x,#CELLL ; a was not dropped, Picatout 2020-05-24
      0085C0 92 CC 28         [ 5] 1095         JP [YTEMP]
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]



                                   1096 
                                   1097 ;       R>      ( -- w )
                                   1098 ;       Pop return stack to data stack.
      0085C3 85 AE                 1099         .word      LINK
                           000545  1100 LINK	= 	. 
      0085C5 42                    1101 	.byte      COMPO+2
      0085C6 52 3E                 1102         .ascii     "R>"
      0085C8                       1103 RFROM:
      0085C8 90 85            [ 2] 1104         POPW Y    ;save return addr
      0085CA 90 BF 28         [ 2] 1105         LDW YTEMP,Y
      0085CD 90 85            [ 2] 1106         POPW Y
      0085CF 1D 00 02         [ 2] 1107         SUBW X,#2
      0085D2 FF               [ 2] 1108         LDW (X),Y
      0085D3 92 CC 28         [ 5] 1109         JP [YTEMP]
                                   1110 
                                   1111 ;       R@      ( -- w )
                                   1112 ;       Copy top of return stack to stack.
      0085D6 85 C5                 1113         .word      LINK
                           000558  1114 LINK	= 	. 
      0085D8 02                    1115         .byte      2
      0085D9 52 40                 1116         .ascii     "R@"
      0085DB                       1117 RAT:
      0085DB 16 03            [ 2] 1118         ldw y,(3,sp)
      0085DD 1D 00 02         [ 2] 1119         subw x,#CELLL 
      0085E0 FF               [ 2] 1120         ldw (x),y 
      0085E1 81               [ 4] 1121         ret 
                                   1122 
                                   1123 ;       >R      ( w -- )
                                   1124 ;       Push data stack to return stack.
      0085E2 85 D8                 1125         .word      LINK
                           000564  1126 LINK	= 	. 
      0085E4 42                    1127 	.byte      COMPO+2
      0085E5 3E 52                 1128         .ascii     ">R"
      0085E7                       1129 TOR:
      0085E7 90 85            [ 2] 1130         POPW Y    ;save return addr
      0085E9 90 BF 28         [ 2] 1131         LDW YTEMP,Y
      0085EC 90 93            [ 1] 1132         LDW Y,X
      0085EE 90 FE            [ 2] 1133         LDW Y,(Y)
      0085F0 90 89            [ 2] 1134         PUSHW Y    ;restore return addr
      0085F2 1C 00 02         [ 2] 1135         ADDW X,#2
      0085F5 92 CC 28         [ 5] 1136         JP [YTEMP]
                                   1137 
                                   1138 ;       SP@     ( -- a )
                                   1139 ;       Push current stack pointer.
      0085F8 85 E4                 1140         .word      LINK
                           00057A  1141 LINK	= 	. 
      0085FA 03                    1142         .byte      3
      0085FB 53 50 40              1143         .ascii     "SP@"
      0085FE                       1144 SPAT:
      0085FE 90 93            [ 1] 1145 	LDW Y,X
      008600 1D 00 02         [ 2] 1146         SUBW X,#2
      008603 FF               [ 2] 1147 	LDW (X),Y
      008604 81               [ 4] 1148         RET     
                                   1149 
                                   1150 ;       SP!     ( a -- )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



                                   1151 ;       Set  data stack pointer.
      008605 85 FA                 1152         .word      LINK
                           000587  1153 LINK	= 	. 
      008607 03                    1154         .byte      3
      008608 53 50 21              1155         .ascii     "SP!"
      00860B                       1156 SPSTO:
      00860B FE               [ 2] 1157         LDW     X,(X)     ;X = a
      00860C 81               [ 4] 1158         RET     
                                   1159 
                                   1160 ;       DROP    ( w -- )
                                   1161 ;       Discard top stack item.
      00860D 86 07                 1162         .word      LINK
                           00058F  1163 LINK	= 	. 
      00860F 04                    1164         .byte      4
      008610 44 52 4F 50           1165         .ascii     "DROP"
      008614                       1166 DROP:
      008614 1C 00 02         [ 2] 1167         ADDW X,#2     
      008617 81               [ 4] 1168         RET     
                                   1169 
                                   1170 ;       DUP     ( w -- w w )
                                   1171 ;       Duplicate  top stack item.
      008618 86 0F                 1172         .word      LINK
                           00059A  1173 LINK	= 	. 
      00861A 03                    1174         .byte      3
      00861B 44 55 50              1175         .ascii     "DUP"
      00861E                       1176 DUPP:
      00861E 90 93            [ 1] 1177 	LDW Y,X
      008620 1D 00 02         [ 2] 1178         SUBW X,#2
      008623 90 FE            [ 2] 1179 	LDW Y,(Y)
      008625 FF               [ 2] 1180 	LDW (X),Y
      008626 81               [ 4] 1181         RET     
                                   1182 
                                   1183 ;       SWAP    ( w1 w2 -- w2 w1 )
                                   1184 ;       Exchange top two stack items.
      008627 86 1A                 1185         .word      LINK
                           0005A9  1186 LINK	= 	. 
      008629 04                    1187         .byte      4
      00862A 53 57 41 50           1188         .ascii     "SWAP"
      00862E                       1189 SWAPP:
      00862E 90 93            [ 1] 1190         LDW Y,X
      008630 90 FE            [ 2] 1191         LDW Y,(Y)
      008632 90 BF 28         [ 2] 1192         LDW YTEMP,Y
      008635 90 93            [ 1] 1193         LDW Y,X
      008637 90 EE 02         [ 2] 1194         LDW Y,(2,Y)
      00863A FF               [ 2] 1195         LDW (X),Y
      00863B 90 BE 28         [ 2] 1196         LDW Y,YTEMP
      00863E EF 02            [ 2] 1197         LDW (2,X),Y
      008640 81               [ 4] 1198         RET     
                                   1199 
                                   1200 ;       OVER    ( w1 w2 -- w1 w2 w1 )
                                   1201 ;       Copy second stack item to top.
      008641 86 29                 1202         .word      LINK
                           0005C3  1203 LINK	= . 
      008643 04                    1204         .byte      4
      008644 4F 56 45 52           1205         .ascii     "OVER"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]



      008648                       1206 OVER:
      008648 1D 00 02         [ 2] 1207         SUBW X,#2
      00864B 90 93            [ 1] 1208         LDW Y,X
      00864D 90 EE 04         [ 2] 1209         LDW Y,(4,Y)
      008650 FF               [ 2] 1210         LDW (X),Y
      008651 81               [ 4] 1211         RET     
                                   1212 
                                   1213 ;       0<      ( n -- t )
                                   1214 ;       Return true if n is negative.
      008652 86 43                 1215         .word      LINK
                           0005D4  1216 LINK	= . 
      008654 02                    1217         .byte      2
      008655 30 3C                 1218         .ascii     "0<"
      008657                       1219 ZLESS:
      008657 A6 FF            [ 1] 1220         LD A,#0xFF
      008659 90 93            [ 1] 1221         LDW Y,X
      00865B 90 FE            [ 2] 1222         LDW Y,(Y)
      00865D 2B 01            [ 1] 1223         JRMI     ZL1
      00865F 4F               [ 1] 1224         CLR A   ;false
      008660 F7               [ 1] 1225 ZL1:    LD     (X),A
      008661 E7 01            [ 1] 1226         LD (1,X),A
      008663 81               [ 4] 1227 	RET     
                                   1228 
                                   1229 ;       AND     ( w w -- w )
                                   1230 ;       Bitwise AND.
      008664 86 54                 1231         .word      LINK
                           0005E6  1232 LINK	= . 
      008666 03                    1233         .byte      3
      008667 41 4E 44              1234         .ascii     "AND"
      00866A                       1235 ANDD:
      00866A F6               [ 1] 1236         LD  A,(X)    ;D=w
      00866B E4 02            [ 1] 1237         AND A,(2,X)
      00866D E7 02            [ 1] 1238         LD (2,X),A
      00866F E6 01            [ 1] 1239         LD A,(1,X)
      008671 E4 03            [ 1] 1240         AND A,(3,X)
      008673 E7 03            [ 1] 1241         LD (3,X),A
      008675 1C 00 02         [ 2] 1242         ADDW X,#2
      008678 81               [ 4] 1243         RET
                                   1244 
                                   1245 ;       OR      ( w w -- w )
                                   1246 ;       Bitwise inclusive OR.
      008679 86 66                 1247         .word      LINK
                           0005FB  1248 LINK = . 
      00867B 02                    1249         .byte      2
      00867C 4F 52                 1250         .ascii     "OR"
      00867E                       1251 ORR:
      00867E F6               [ 1] 1252         LD A,(X)    ;D=w
      00867F EA 02            [ 1] 1253         OR A,(2,X)
      008681 E7 02            [ 1] 1254         LD (2,X),A
      008683 E6 01            [ 1] 1255         LD A,(1,X)
      008685 EA 03            [ 1] 1256         OR A,(3,X)
      008687 E7 03            [ 1] 1257         LD (3,X),A
      008689 1C 00 02         [ 2] 1258         ADDW X,#2
      00868C 81               [ 4] 1259         RET
                                   1260 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



                                   1261 ;       XOR     ( w w -- w )
                                   1262 ;       Bitwise exclusive OR.
      00868D 86 7B                 1263         .word      LINK
                           00060F  1264 LINK	= . 
      00868F 03                    1265         .byte      3
      008690 58 4F 52              1266         .ascii     "XOR"
      008693                       1267 XORR:
      008693 F6               [ 1] 1268         LD A,(X)    ;D=w
      008694 E8 02            [ 1] 1269         XOR A,(2,X)
      008696 E7 02            [ 1] 1270         LD (2,X),A
      008698 E6 01            [ 1] 1271         LD A,(1,X)
      00869A E8 03            [ 1] 1272         XOR A,(3,X)
      00869C E7 03            [ 1] 1273         LD (3,X),A
      00869E 1C 00 02         [ 2] 1274         ADDW X,#2
      0086A1 81               [ 4] 1275         RET
                                   1276 
                                   1277 ;       UM+     ( u u -- udsum )
                                   1278 ;       Add two unsigned single
                                   1279 ;       and return a double sum.
      0086A2 86 8F                 1280         .word      LINK
                           000624  1281 LINK	= . 
      0086A4 03                    1282         .byte      3
      0086A5 55 4D 2B              1283         .ascii     "UM+"
      0086A8                       1284 UPLUS:
      0086A8 A6 01            [ 1] 1285         LD A,#1
      0086AA 90 93            [ 1] 1286         LDW Y,X
      0086AC 90 EE 02         [ 2] 1287         LDW Y,(2,Y)
      0086AF 90 BF 28         [ 2] 1288         LDW YTEMP,Y
      0086B2 90 93            [ 1] 1289         LDW Y,X
      0086B4 90 FE            [ 2] 1290         LDW Y,(Y)
      0086B6 72 B9 00 28      [ 2] 1291         ADDW Y,YTEMP
      0086BA EF 02            [ 2] 1292         LDW (2,X),Y
      0086BC 25 01            [ 1] 1293         JRC     UPL1
      0086BE 4F               [ 1] 1294         CLR A
      0086BF E7 01            [ 1] 1295 UPL1:   LD     (1,X),A
      0086C1 7F               [ 1] 1296         CLR (X)
      0086C2 81               [ 4] 1297         RET
                                   1298 
                                   1299 ;; System and user variables
                                   1300 
                                   1301 ;       doVAR   ( -- a )
                                   1302 ;       Code for VARIABLE and CREATE.
      0086C3 86 A4                 1303         .word      LINK
                           000645  1304 LINK	= . 
      0086C5 45                    1305 	.byte      COMPO+5
      0086C6 44 4F 56 41 52        1306         .ascii     "DOVAR"
      0086CB                       1307 DOVAR:
      0086CB 1D 00 02         [ 2] 1308 	SUBW X,#2
      0086CE 90 85            [ 2] 1309         POPW Y    ;get return addr (pfa)
      0086D0 90 FE            [ 2] 1310         LDW Y,(Y) ; indirect address 
      0086D2 FF               [ 2] 1311         LDW (X),Y    ;push on stack
      0086D3 81               [ 4] 1312         RET     ;go to RET of EXEC
                                   1313 
                                   1314 ;       BASE    ( -- a )
                                   1315 ;       Radix base for numeric I/O.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



      0086D4 86 C5                 1316         .word      LINK        
                           000656  1317 LINK = . 
      0086D6 04                    1318         .byte      4
      0086D7 42 41 53 45           1319         .ascii     "BASE"
      0086DB                       1320 BASE:
      0086DB 90 AE 00 06      [ 2] 1321 	LDW Y,#UBASE 
      0086DF 1D 00 02         [ 2] 1322 	SUBW X,#2
      0086E2 FF               [ 2] 1323         LDW (X),Y
      0086E3 81               [ 4] 1324         RET
                                   1325 
                                   1326 ;       tmp     ( -- a )
                                   1327 ;       A temporary storage.
      0086E4 86 D6                 1328         .word      LINK
                                   1329         
                           000666  1330 LINK = . 
      0086E6 03                    1331 	.byte      3
      0086E7 54 4D 50              1332         .ascii     "TMP"
      0086EA                       1333 TEMP:
      0086EA 90 AE 00 0C      [ 2] 1334 	LDW Y,#UTMP
      0086EE 1D 00 02         [ 2] 1335 	SUBW X,#2
      0086F1 FF               [ 2] 1336         LDW (X),Y
      0086F2 81               [ 4] 1337         RET
                                   1338 
                                   1339 ;       >IN     ( -- a )
                                   1340 ;        Hold parsing pointer.
      0086F3 86 E6                 1341         .word      LINK
                           000675  1342 LINK = . 
      0086F5 03                    1343         .byte      3
      0086F6 3E 49 4E              1344         .ascii    ">IN"
      0086F9                       1345 INN:
      0086F9 90 AE 00 0E      [ 2] 1346 	LDW Y,#UINN 
      0086FD 1D 00 02         [ 2] 1347 	SUBW X,#2
      008700 FF               [ 2] 1348         LDW (X),Y
      008701 81               [ 4] 1349         RET
                                   1350 
                                   1351 ;       #TIB    ( -- a )
                                   1352 ;       Count in terminal input buffer.
      008702 86 F5                 1353         .word      LINK
                           000684  1354 LINK = . 
      008704 04                    1355         .byte      4
      008705 23 54 49 42           1356         .ascii     "#TIB"
      008709                       1357 NTIB:
      008709 90 AE 00 10      [ 2] 1358 	LDW Y,#UCTIB 
      00870D 1D 00 02         [ 2] 1359 	SUBW X,#2
      008710 FF               [ 2] 1360         LDW (X),Y
      008711 81               [ 4] 1361         RET
                                   1362 
                                   1363 ;       TBUF ( -- a )
                                   1364 ;       address of 128 bytes transaction buffer 
      008712 87 04                 1365         .word LINK 
                           000694  1366         LINK=.
      008714 04                    1367         .byte 4 
      008715 54 42 55 46           1368         .ascii "TBUF"
      008719                       1369 TBUF:
      008719 90 AE 16 80      [ 2] 1370         ldw y,#ROWBUFF
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal [24-Bits]



      00871D 1D 00 02         [ 2] 1371         subw x,#CELLL
      008720 FF               [ 2] 1372         ldw (x),y 
      008721 81               [ 4] 1373         ret 
                                   1374 
                                   1375 ; systeme variable 
                                   1376 ; compilation destination 
                                   1377 ; TFLASH ( -- A )
      008722 87 14                 1378         .word LINK 
                           0006A4  1379         LINK=.
      008724 06                    1380         .byte 6 
      008725 54 46 4C 41 53 48     1381         .ascii "TFLASH"         
      00872B                       1382 TFLASH:
      00872B 1D 00 02         [ 2] 1383         subw x,#CELLL 
      00872E 90 AE 00 22      [ 2] 1384         ldw y,#UTFLASH
      008732 FF               [ 2] 1385         ldw (x),y 
      008733 81               [ 4] 1386         ret 
                                   1387 
                                   1388 ;       "EVAL   ( -- a )
                                   1389 ;       Execution vector of EVAL.
      008734 87 24                 1390         .word      LINK
                           0006B6  1391 LINK = . 
      008736 05                    1392         .byte      5
      008737 27 45 56 41 4C        1393         .ascii     "'EVAL"
      00873C                       1394 TEVAL:
      00873C 90 AE 00 14      [ 2] 1395 	LDW Y,#UINTER 
      008740 1D 00 02         [ 2] 1396 	SUBW X,#2
      008743 FF               [ 2] 1397         LDW (X),Y
      008744 81               [ 4] 1398         RET
                                   1399 
                                   1400 ;       HLD     ( -- a )
                                   1401 ;       Hold a pointer of output string.
      008745 87 36                 1402         .word      LINK
                           0006C7  1403 LINK = . 
      008747 03                    1404         .byte      3
      008748 48 4C 44              1405         .ascii     "HLD"
      00874B                       1406 HLD:
      00874B 90 AE 00 16      [ 2] 1407 	LDW Y,#UHLD 
      00874F 1D 00 02         [ 2] 1408 	SUBW X,#2
      008752 FF               [ 2] 1409         LDW (X),Y
      008753 81               [ 4] 1410         RET
                                   1411 
                                   1412 ;       CONTEXT ( -- a )
                                   1413 ;       Start vocabulary search.
      008754 87 47                 1414         .word      LINK
                           0006D6  1415 LINK = . 
      008756 07                    1416         .byte      7
      008757 43 4F 4E 54 45 58 54  1417         .ascii     "CONTEXT"
      00875E                       1418 CNTXT:
      00875E 90 AE 00 18      [ 2] 1419 	LDW Y,#UCNTXT
      008762 1D 00 02         [ 2] 1420 	SUBW X,#2
      008765 FF               [ 2] 1421         LDW (X),Y
      008766 81               [ 4] 1422         RET
                                   1423 
                                   1424 ;       VP      ( -- a )
                                   1425 ;       Point to top of variables
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



      008767 87 56                 1426         .word      LINK
                           0006E9  1427 LINK = . 
      008769 02                    1428         .byte      2
      00876A 56 50                 1429         .ascii     "VP"
      00876C                       1430 VPP:
      00876C 90 AE 00 1A      [ 2] 1431 	LDW Y,#UVP 
      008770 1D 00 02         [ 2] 1432 	SUBW X,#2
      008773 FF               [ 2] 1433         LDW (X),Y
      008774 81               [ 4] 1434         RET
                                   1435 
                                   1436 ;       CP    ( -- a )
                                   1437 ;       Pointer to top of FLASH 
      008775 87 69                 1438         .word LINK 
                           0006F7  1439         LINK=.
      008777 02                    1440         .byte 2 
      008778 43 50                 1441         .ascii "CP"
      00877A                       1442 CPP: 
      00877A 90 AE 00 1C      [ 2] 1443         ldw y,#UCP 
      00877E 1D 00 02         [ 2] 1444         subw x,#CELLL 
      008781 FF               [ 2] 1445         ldw (x),y 
      008782 81               [ 4] 1446         ret                
                                   1447 
                                   1448 ;       LAST    ( -- a )
                                   1449 ;       Point to last name in dictionary.
      008783 87 77                 1450         .word      LINK
                           000705  1451 LINK = . 
      008785 04                    1452         .byte      4
      008786 4C 41 53 54           1453         .ascii     "LAST"
      00878A                       1454 LAST:
      00878A 90 AE 00 1E      [ 2] 1455 	LDW Y,#ULAST 
      00878E 1D 00 02         [ 2] 1456 	SUBW X,#2
      008791 FF               [ 2] 1457         LDW (X),Y
      008792 81               [ 4] 1458         RET
                                   1459 
                                   1460 ; address of system variable URLAST 
                                   1461 ;       RAMLAST ( -- a )
                                   1462 ; RAM dictionary context 
      008793 87 85                 1463         .word LINK 
                           000715  1464         LINK=. 
      008795 07                    1465         .byte 7  
      008796 52 41 4D 4C 41 53 54  1466         .ascii "RAMLAST" 
      00879D                       1467 RAMLAST: 
      00879D 90 AE 00 24      [ 2] 1468         ldw y,#URLAST 
      0087A1 1D 00 02         [ 2] 1469         subw x,#CELLL 
      0087A4 FF               [ 2] 1470         ldw (x),y 
      0087A5 81               [ 4] 1471         ret 
                                   1472 
                                   1473 ; OFFSET ( -- a )
                                   1474 ; address of system variable OFFSET 
      0087A6 87 95                 1475         .word LINK 
                           000728  1476         LINK=.
      0087A8 06                    1477         .byte 6
      0087A9 4F 46 46 53 45 54     1478         .ascii "OFFSET" 
      0087AF                       1479 OFFSET: 
      0087AF 1D 00 02         [ 2] 1480         subw x,#CELLL
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



      0087B2 90 AE 00 20      [ 2] 1481         ldw y,#UOFFSET 
      0087B6 FF               [ 2] 1482         ldw (x),y 
      0087B7 81               [ 4] 1483         ret 
                                   1484 
                                   1485 ; adjust jump address adding OFFSET
                                   1486 ; ADR-ADJ ( a -- a+offset )
      0087B8                       1487 ADRADJ: 
      0087B8 CD 87 AF         [ 4] 1488         call OFFSET 
      0087BB CD 85 77         [ 4] 1489         call AT 
      0087BE CC 88 19         [ 2] 1490         jp PLUS 
                                   1491 
                                   1492 
                                   1493 ;; Common functions
                                   1494 
                                   1495 ;       ?DUP    ( w -- w w | 0 )
                                   1496 ;       Dup tos if its is not zero.
      0087C1 87 A8                 1497         .word      LINK
                           000743  1498 LINK = . 
      0087C3 04                    1499         .byte      4
      0087C4 3F 44 55 50           1500         .ascii     "?DUP"
      0087C8                       1501 QDUP:
      0087C8 90 93            [ 1] 1502         LDW Y,X
      0087CA 90 FE            [ 2] 1503 	LDW Y,(Y)
      0087CC 27 04            [ 1] 1504         JREQ     QDUP1
      0087CE 1D 00 02         [ 2] 1505 	SUBW X,#2
      0087D1 FF               [ 2] 1506         LDW (X),Y
      0087D2 81               [ 4] 1507 QDUP1:  RET
                                   1508 
                                   1509 ;       ROT     ( w1 w2 w3 -- w2 w3 w1 )
                                   1510 ;       Rot 3rd item to top.
      0087D3 87 C3                 1511         .word      LINK
                           000755  1512 LINK = . 
      0087D5 03                    1513         .byte      3
      0087D6 52 4F 54              1514         .ascii     "ROT"
      0087D9                       1515 ROT:
      0087D9 90 93            [ 1] 1516         ldw y,x 
      0087DB 90 FE            [ 2] 1517         ldw y,(y)
      0087DD 90 89            [ 2] 1518         pushw y 
      0087DF 90 93            [ 1] 1519         ldw y,x 
      0087E1 90 EE 04         [ 2] 1520         ldw y,(4,y)
      0087E4 FF               [ 2] 1521         ldw (x),y 
      0087E5 90 93            [ 1] 1522         ldw y,x 
      0087E7 90 EE 02         [ 2] 1523         ldw y,(2,y)
      0087EA EF 04            [ 2] 1524         ldw (4,x),y 
      0087EC 90 85            [ 2] 1525         popw y 
      0087EE EF 02            [ 2] 1526         ldw (2,x),y
      0087F0 81               [ 4] 1527         ret 
                                   1528 
                                   1529 ;       2DROP   ( w w -- )
                                   1530 ;       Discard two items on stack.
      0087F1 87 D5                 1531         .word      LINK
                           000773  1532 LINK = . 
      0087F3 05                    1533         .byte      5
      0087F4 32 44 52 4F 50        1534         .ascii     "2DROP"
      0087F9                       1535 DDROP:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



      0087F9 1C 00 04         [ 2] 1536         ADDW X,#4
      0087FC 81               [ 4] 1537         RET
                                   1538 
                                   1539 ;       2DUP    ( w1 w2 -- w1 w2 w1 w2 )
                                   1540 ;       Duplicate top two items.
      0087FD 87 F3                 1541         .word      LINK
                           00077F  1542 LINK = . 
      0087FF 04                    1543         .byte      4
      008800 32 44 55 50           1544         .ascii     "2DUP"
      008804                       1545 DDUP:
      008804 1D 00 04         [ 2] 1546         SUBW X,#4
      008807 90 93            [ 1] 1547         LDW Y,X
      008809 90 EE 06         [ 2] 1548         LDW Y,(6,Y)
      00880C EF 02            [ 2] 1549         LDW (2,X),Y
      00880E 90 93            [ 1] 1550         LDW Y,X
      008810 90 EE 04         [ 2] 1551         LDW Y,(4,Y)
      008813 FF               [ 2] 1552         LDW (X),Y
      008814 81               [ 4] 1553         RET
                                   1554 
                                   1555 ;       +       ( w w -- sum )
                                   1556 ;       Add top two items.
      008815 87 FF                 1557         .word      LINK
                           000797  1558 LINK = . 
      008817 01                    1559         .byte      1
      008818 2B                    1560         .ascii     "+"
      008819                       1561 PLUS:
      008819 90 93            [ 1] 1562         LDW Y,X
      00881B 90 FE            [ 2] 1563         LDW Y,(Y)
      00881D 90 BF 28         [ 2] 1564         LDW YTEMP,Y
      008820 1C 00 02         [ 2] 1565         ADDW X,#2
      008823 90 93            [ 1] 1566         LDW Y,X
      008825 90 FE            [ 2] 1567         LDW Y,(Y)
      008827 72 B9 00 28      [ 2] 1568         ADDW Y,YTEMP
      00882B FF               [ 2] 1569         LDW (X),Y
      00882C 81               [ 4] 1570         RET
                                   1571 
                                   1572 ;       NOT     ( w -- w )
                                   1573 ;       One's complement of tos.
      00882D 88 17                 1574         .word      LINK
                           0007AF  1575 LINK = . 
      00882F 03                    1576         .byte      3
      008830 4E 4F 54              1577         .ascii     "NOT"
      008833                       1578 INVER:
      008833 90 93            [ 1] 1579         LDW Y,X
      008835 90 FE            [ 2] 1580         LDW Y,(Y)
      008837 90 53            [ 2] 1581         CPLW Y
      008839 FF               [ 2] 1582         LDW (X),Y
      00883A 81               [ 4] 1583         RET
                                   1584 
                                   1585 ;       NEGATE  ( n -- -n )
                                   1586 ;       Two's complement of tos.
      00883B 88 2F                 1587         .word      LINK
                           0007BD  1588 LINK = . 
      00883D 06                    1589         .byte      6
      00883E 4E 45 47 41 54 45     1590         .ascii     "NEGATE"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



      008844                       1591 NEGAT:
      008844 90 93            [ 1] 1592         LDW Y,X
      008846 90 FE            [ 2] 1593         LDW Y,(Y)
      008848 90 50            [ 2] 1594         NEGW Y
      00884A FF               [ 2] 1595         LDW (X),Y
      00884B 81               [ 4] 1596         RET
                                   1597 
                                   1598 ;       DNEGATE ( d -- -d )
                                   1599 ;       Two's complement of top double.
      00884C 88 3D                 1600         .word      LINK
                           0007CE  1601 LINK = . 
      00884E 07                    1602         .byte      7
      00884F 44 4E 45 47 41 54 45  1603         .ascii     "DNEGATE"
      008856                       1604 DNEGA:
      008856 90 93            [ 1] 1605         LDW Y,X
      008858 90 FE            [ 2] 1606 	LDW Y,(Y)
      00885A 90 53            [ 2] 1607         CPLW Y     
      00885C 90 BF 28         [ 2] 1608 	LDW YTEMP,Y
      00885F 90 93            [ 1] 1609         LDW Y,X
      008861 90 EE 02         [ 2] 1610         LDW Y,(2,Y)
      008864 90 53            [ 2] 1611         CPLW Y
      008866 72 A9 00 01      [ 2] 1612         addw y,#1
      00886A EF 02            [ 2] 1613         LDW (2,X),Y
      00886C 90 BE 28         [ 2] 1614         LDW Y,YTEMP
      00886F 24 02            [ 1] 1615         JRNC DN1 
      008871 90 5C            [ 1] 1616         INCW Y
      008873 FF               [ 2] 1617 DN1:    LDW (X),Y
      008874 81               [ 4] 1618         RET
                                   1619 
                                   1620 
                                   1621 ;       S>D ( n -- d )
                                   1622 ; convert single integer to double 
      008875 88 4E                 1623         .word LINK 
                           0007F7  1624         LINK=. 
      008877 03                    1625         .byte 3 
      008878 53 3E 44              1626         .ascii "S>D"
      00887B                       1627 STOD: 
      00887B 1D 00 02         [ 2] 1628         subw x,#CELLL 
      00887E 90 5F            [ 1] 1629         clrw y 
      008880 FF               [ 2] 1630         ldw (x),y 
      008881 90 93            [ 1] 1631         ldw y,x 
      008883 90 EE 02         [ 2] 1632         ldw y,(2,y)
      008886 2A 05            [ 1] 1633         jrpl 1$ 
      008888 90 AE FF FF      [ 2] 1634         ldw y,#-1
      00888C FF               [ 2] 1635         ldw (x),y 
      00888D 81               [ 4] 1636 1$:     ret 
                                   1637 
                                   1638 
                                   1639 
                                   1640 
                                   1641 ;       -       ( n1 n2 -- n1-n2 )
                                   1642 ;       Subtraction.
      00888E 88 77                 1643         .word      LINK
                           000810  1644 LINK = . 
      008890 01                    1645         .byte      1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



      008891 2D                    1646         .ascii     "-"
      008892                       1647 SUBB:
      008892 90 93            [ 1] 1648         LDW Y,X
      008894 90 FE            [ 2] 1649         LDW Y,(Y)
      008896 90 BF 28         [ 2] 1650         LDW YTEMP,Y
      008899 1C 00 02         [ 2] 1651         ADDW X,#2
      00889C 90 93            [ 1] 1652         LDW Y,X
      00889E 90 FE            [ 2] 1653         LDW Y,(Y)
      0088A0 72 B2 00 28      [ 2] 1654         SUBW Y,YTEMP
      0088A4 FF               [ 2] 1655         LDW (X),Y
      0088A5 81               [ 4] 1656         RET
                                   1657 
                                   1658 ;       ABS     ( n -- n )
                                   1659 ;       Return  absolute value of n.
      0088A6 88 90                 1660         .word      LINK
                           000828  1661 LINK = . 
      0088A8 03                    1662         .byte      3
      0088A9 41 42 53              1663         .ascii     "ABS"
      0088AC                       1664 ABSS:
      0088AC 90 93            [ 1] 1665         LDW Y,X
      0088AE 90 FE            [ 2] 1666 	LDW Y,(Y)
      0088B0 2A 03            [ 1] 1667         JRPL     AB1     ;negate:
      0088B2 90 50            [ 2] 1668         NEGW     Y     ;else negate hi byte
      0088B4 FF               [ 2] 1669         LDW (X),Y
      0088B5 81               [ 4] 1670 AB1:    RET
                                   1671 
                                   1672 ;       =       ( w w -- t )
                                   1673 ;       Return true if top two are =al.
      0088B6 88 A8                 1674         .word      LINK
                           000838  1675 LINK = . 
      0088B8 01                    1676         .byte      1
      0088B9 3D                    1677         .ascii     "="
      0088BA                       1678 EQUAL:
      0088BA A6 FF            [ 1] 1679         LD A,#0xFF  ;true
      0088BC 90 93            [ 1] 1680         LDW Y,X    ;D = n2
      0088BE 90 FE            [ 2] 1681         LDW Y,(Y)
      0088C0 90 BF 28         [ 2] 1682         LDW YTEMP,Y
      0088C3 1C 00 02         [ 2] 1683         ADDW X,#2
      0088C6 90 93            [ 1] 1684         LDW Y,X
      0088C8 90 FE            [ 2] 1685         LDW Y,(Y)
      0088CA 90 B3 28         [ 2] 1686         CPW Y,YTEMP     ;if n2 <> n1
      0088CD 27 01            [ 1] 1687         JREQ     EQ1
      0088CF 4F               [ 1] 1688         CLR A
      0088D0 F7               [ 1] 1689 EQ1:    LD (X),A
      0088D1 E7 01            [ 1] 1690         LD (1,X),A
      0088D3 81               [ 4] 1691 	RET     
                                   1692 
                                   1693 ;       U<      ( u u -- t )
                                   1694 ;       Unsigned compare of top two items.
      0088D4 88 B8                 1695         .word      LINK
                           000856  1696 LINK = . 
      0088D6 02                    1697         .byte      2
      0088D7 55 3C                 1698         .ascii     "U<"
      0088D9                       1699 ULESS:
      0088D9 A6 FF            [ 1] 1700         LD A,#0xFF  ;true
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



      0088DB 90 93            [ 1] 1701         LDW Y,X    ;D = n2
      0088DD 90 FE            [ 2] 1702         LDW Y,(Y)
      0088DF 90 BF 28         [ 2] 1703         LDW YTEMP,Y
      0088E2 1C 00 02         [ 2] 1704         ADDW X,#2
      0088E5 90 93            [ 1] 1705         LDW Y,X
      0088E7 90 FE            [ 2] 1706         LDW Y,(Y)
      0088E9 90 B3 28         [ 2] 1707         CPW Y,YTEMP     ;if n2 <> n1
      0088EC 25 01            [ 1] 1708         JRULT     ULES1
      0088EE 4F               [ 1] 1709         CLR A
      0088EF F7               [ 1] 1710 ULES1:  LD (X),A
      0088F0 E7 01            [ 1] 1711         LD (1,X),A
      0088F2 81               [ 4] 1712 	RET     
                                   1713 
                                   1714 ;       <       ( n1 n2 -- t )
                                   1715 ;       Signed compare of top two items.
      0088F3 88 D6                 1716         .word      LINK
                           000875  1717 LINK = . 
      0088F5 01                    1718         .byte      1
      0088F6 3C                    1719         .ascii     "<"
      0088F7                       1720 LESS:
      0088F7 A6 FF            [ 1] 1721         LD A,#0xFF  ;true
      0088F9 90 93            [ 1] 1722         LDW Y,X    ;D = n2
      0088FB 90 FE            [ 2] 1723         LDW Y,(Y)
      0088FD 90 BF 28         [ 2] 1724         LDW YTEMP,Y
      008900 1C 00 02         [ 2] 1725         ADDW X,#2
      008903 90 93            [ 1] 1726         LDW Y,X
      008905 90 FE            [ 2] 1727         LDW Y,(Y)
      008907 90 B3 28         [ 2] 1728         CPW Y,YTEMP     ;if n2 <> n1
      00890A 2F 01            [ 1] 1729         JRSLT     LT1
      00890C 4F               [ 1] 1730         CLR A
      00890D F7               [ 1] 1731 LT1:    LD (X),A
      00890E E7 01            [ 1] 1732         LD (1,X),A
      008910 81               [ 4] 1733 	RET     
                                   1734 
                                   1735 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1736 ;       >   (n1 n2 -- f )
                                   1737 ;  signed compare n1 n2 
                                   1738 ;  true if n1 > n2 
                                   1739 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      008911 88 F5                 1740         .word   LINK 
                           000893  1741         LINK = . 
      008913 01                    1742         .byte 1
      008914 3E                    1743         .ascii ">"
      008915                       1744 GREAT:
      008915 A6 FF            [ 1] 1745         LD A,#0xFF ;
      008917 90 93            [ 1] 1746         LDW Y,X 
      008919 90 FE            [ 2] 1747         LDW Y,(Y)
      00891B 90 BF 28         [ 2] 1748         LDW YTEMP,Y 
      00891E 1C 00 02         [ 2] 1749         ADDW X,#2 
      008921 90 93            [ 1] 1750         LDW Y,X 
      008923 90 FE            [ 2] 1751         LDW Y,(Y)
      008925 90 B3 28         [ 2] 1752         CPW  Y,YTEMP 
      008928 2C 01            [ 1] 1753         JRSGT GREAT1 
      00892A 4F               [ 1] 1754         CLR  A
      00892B                       1755 GREAT1:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



      00892B F7               [ 1] 1756         LD (X),A 
      00892C E7 01            [ 1] 1757         LD (1,X),A 
      00892E 81               [ 4] 1758         RET 
                                   1759 
                                   1760 
                                   1761 ;       MAX     ( n n -- n )
                                   1762 ;       Return greater of two top items.
      00892F 89 13                 1763         .word      LINK
                           0008B1  1764 LINK = . 
      008931 03                    1765         .byte      3
      008932 4D 41 58              1766         .ascii     "MAX"
      008935                       1767 MAX:
      008935 90 93            [ 1] 1768         LDW Y,X    ;D = n2
      008937 90 EE 02         [ 2] 1769         LDW Y,(2,Y)
      00893A 90 BF 28         [ 2] 1770         LDW YTEMP,Y
      00893D 90 93            [ 1] 1771         LDW Y,X
      00893F 90 FE            [ 2] 1772         LDW Y,(Y)
      008941 90 B3 28         [ 2] 1773         CPW Y,YTEMP     ;if n2 <> n1
      008944 2F 02            [ 1] 1774         JRSLT     MAX1
      008946 EF 02            [ 2] 1775         LDW (2,X),Y
      008948 1C 00 02         [ 2] 1776 MAX1:   ADDW X,#2
      00894B 81               [ 4] 1777 	RET     
                                   1778 
                                   1779 ;       MIN     ( n n -- n )
                                   1780 ;       Return smaller of top two items.
      00894C 89 31                 1781         .word      LINK
                           0008CE  1782 LINK = . 
      00894E 03                    1783         .byte      3
      00894F 4D 49 4E              1784         .ascii     "MIN"
      008952                       1785 MIN:
      008952 90 93            [ 1] 1786         LDW Y,X    ;D = n2
      008954 90 EE 02         [ 2] 1787         LDW Y,(2,Y)
      008957 90 BF 28         [ 2] 1788         LDW YTEMP,Y
      00895A 90 93            [ 1] 1789         LDW Y,X
      00895C 90 FE            [ 2] 1790         LDW Y,(Y)
      00895E 90 B3 28         [ 2] 1791         CPW Y,YTEMP     ;if n2 <> n1
      008961 2C 02            [ 1] 1792         JRSGT     MIN1
      008963 EF 02            [ 2] 1793         LDW (2,X),Y
      008965 1C 00 02         [ 2] 1794 MIN1:	ADDW X,#2
      008968 81               [ 4] 1795 	RET     
                                   1796 
                                   1797 ;       WITHIN  ( u ul uh -- t )
                                   1798 ;       Return true if u is within
                                   1799 ;       range of ul and uh. ( ul <= u < uh )
      008969 89 4E                 1800         .word      LINK
                           0008EB  1801 LINK = . 
      00896B 06                    1802         .byte      6
      00896C 57 49 54 48 49 4E     1803         .ascii     "WITHIN"
      008972                       1804 WITHI:
      008972 CD 86 48         [ 4] 1805         CALL     OVER
      008975 CD 88 92         [ 4] 1806         CALL     SUBB
      008978 CD 85 E7         [ 4] 1807         CALL     TOR
      00897B CD 88 92         [ 4] 1808         CALL     SUBB
      00897E CD 85 C8         [ 4] 1809         CALL     RFROM
      008981 CC 88 D9         [ 2] 1810         JP     ULESS
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



                                   1811 
                                   1812 ;; Divide
                                   1813 
                                   1814 ;       UM/MOD  ( udl udh un -- ur uq )
                                   1815 ;       Unsigned divide of a double by a
                                   1816 ;       single. Return mod and quotient.
      008984 89 6B                 1817         .word      LINK
                           000906  1818 LINK = . 
      008986 06                    1819         .byte      6
      008987 55 4D 2F 4D 4F 44     1820         .ascii     "UM/MOD"
                                   1821 ; 2021-02-22
                                   1822 ; changed algortihm for Jeeek one 
                                   1823 ; ref: https://github.com/TG9541/stm8ef/pull/406        
      00898D                       1824 UMMOD:
      00898D 90 93            [ 1] 1825         LDW     Y,X             ; stack pointer to Y
      00898F FE               [ 2] 1826         LDW     X,(X)           ; un
      008990 BF 28            [ 2] 1827         LDW     YTEMP,X         ; save un
      008992 93               [ 1] 1828         LDW     X,Y
      008993 5C               [ 1] 1829         INCW    X               ; drop un
      008994 5C               [ 1] 1830         INCW    X
      008995 89               [ 2] 1831         PUSHW   X               ; save stack pointer
      008996 FE               [ 2] 1832         LDW     X,(X)           ; X=udh
      008997 90 EE 04         [ 2] 1833         LDW     Y,(4,Y)         ; Y=udl (offset before drop)
      00899A B3 28            [ 2] 1834         CPW     X,YTEMP
      00899C 25 0B            [ 1] 1835         JRULT   MMSM1           ; X is still on the R-stack
      00899E 85               [ 2] 1836         POPW    X               ; restore stack pointer
      00899F 90 AE FF FF      [ 2] 1837         LDW     Y,#0xFFFF       ; overflow result:
      0089A3 FF               [ 2] 1838         LDW     (X),Y           ; quotient max. 16 bit value
      0089A4 90 5F            [ 1] 1839         CLRW    Y
      0089A6 EF 02            [ 2] 1840         LDW     (2,X),Y         ; remainder 0
      0089A8 81               [ 4] 1841         RET
      0089A9                       1842 MMSM1:
      0089A9 A6 10            [ 1] 1843         LD      A,#16           ; loop count
      0089AB 90 58            [ 2] 1844         SLLW    Y               ; udl shift udl into udh
      0089AD                       1845 MMSM3:
      0089AD 59               [ 2] 1846         RLCW    X               ; rotate udl bit into uhdh (= remainder)
      0089AE 25 04            [ 1] 1847         JRC     MMSMa           ; if carry out of rotate
      0089B0 B3 28            [ 2] 1848         CPW     X,YTEMP         ; compare udh to un
      0089B2 25 05            [ 1] 1849         JRULT   MMSM4           ; can't subtract
      0089B4                       1850 MMSMa:
      0089B4 72 B0 00 28      [ 2] 1851         SUBW    X,YTEMP         ; can subtract
      0089B8 98               [ 1] 1852         RCF
      0089B9                       1853 MMSM4:
      0089B9 8C               [ 1] 1854         CCF                     ; quotient bit
      0089BA 90 59            [ 2] 1855         RLCW    Y               ; rotate into quotient, rotate out udl
      0089BC 4A               [ 1] 1856         DEC     A               ; repeat
      0089BD 26 EE            [ 1] 1857         JRNE    MMSM3           ; if A == 0
      0089BF                       1858 MMSMb:
      0089BF BF 28            [ 2] 1859         LDW     YTEMP,X         ; done, save remainder
      0089C1 85               [ 2] 1860         POPW    X               ; restore stack pointer
      0089C2 FF               [ 2] 1861         LDW     (X),Y           ; save quotient
      0089C3 90 BE 28         [ 2] 1862         LDW     Y,YTEMP         ; remainder onto stack
      0089C6 EF 02            [ 2] 1863         LDW     (2,X),Y
      0089C8 81               [ 4] 1864         RET
                                   1865 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



                                   1866 
                                   1867 ;----------------------------------------------	
                                   1868 ;       M/MOD   ( d n -- r q )
                                   1869 ;       Signed floored divide of double by
                                   1870 ;       single. Return mod and quotient.
                                   1871 ;----------------------------------------------	
      0089C9 89 86                 1872         .word      LINK
                           00094B  1873 LINK = . 
      0089CB 05                    1874         .byte      5
      0089CC 4D 2F 4D 4F 44        1875         .ascii     "M/MOD"
      0089D1                       1876 MSMOD:  
      0089D1 CD 86 1E         [ 4] 1877         CALL	DUPP
      0089D4 CD 86 57         [ 4] 1878         CALL	ZLESS
      0089D7 CD 86 1E         [ 4] 1879         CALL	DUPP
      0089DA CD 85 E7         [ 4] 1880         CALL	TOR
      0089DD CD 85 2C         [ 4] 1881         CALL	QBRAN
      0089E0 89 EE                 1882         .word	MMOD1
      0089E2 CD 88 44         [ 4] 1883         CALL	NEGAT
      0089E5 CD 85 E7         [ 4] 1884         CALL	TOR
      0089E8 CD 88 56         [ 4] 1885         CALL	DNEGA
      0089EB CD 85 C8         [ 4] 1886         CALL	RFROM
      0089EE CD 85 E7         [ 4] 1887 MMOD1:	CALL	TOR
      0089F1 CD 86 1E         [ 4] 1888         CALL	DUPP
      0089F4 CD 86 57         [ 4] 1889         CALL	ZLESS
      0089F7 CD 85 2C         [ 4] 1890         CALL	QBRAN
      0089FA 8A 02                 1891         .word	MMOD2
      0089FC CD 85 DB         [ 4] 1892         CALL	RAT
      0089FF CD 88 19         [ 4] 1893         CALL	PLUS
      008A02 CD 85 C8         [ 4] 1894 MMOD2:	CALL	RFROM
      008A05 CD 89 8D         [ 4] 1895         CALL	UMMOD
      008A08 CD 85 C8         [ 4] 1896         CALL	RFROM
      008A0B CD 85 2C         [ 4] 1897         CALL	QBRAN
      008A0E 8A 19                 1898         .word	MMOD3
      008A10 CD 86 2E         [ 4] 1899         CALL	SWAPP
      008A13 CD 88 44         [ 4] 1900         CALL	NEGAT
      008A16 CD 86 2E         [ 4] 1901         CALL	SWAPP
      008A19 81               [ 4] 1902 MMOD3:	RET
                                   1903 
                                   1904 ;       /MOD    ( n n -- r q )
                                   1905 ;       Signed divide. Return mod and quotient.
      008A1A 89 CB                 1906         .word      LINK
                           00099C  1907 LINK = . 
      008A1C 04                    1908         .byte      4
      008A1D 2F 4D 4F 44           1909         .ascii     "/MOD"
      008A21                       1910 SLMOD:
      008A21 CD 86 48         [ 4] 1911         CALL	OVER
      008A24 CD 86 57         [ 4] 1912         CALL	ZLESS
      008A27 CD 86 2E         [ 4] 1913         CALL	SWAPP
      008A2A CC 89 D1         [ 2] 1914         JP	MSMOD
                                   1915 
                                   1916 ;       MOD     ( n n -- r )
                                   1917 ;       Signed divide. Return mod only.
      008A2D 8A 1C                 1918         .word      LINK
                           0009AF  1919 LINK = . 
      008A2F 03                    1920         .byte      3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



      008A30 4D 4F 44              1921         .ascii     "MOD"
      008A33                       1922 MODD:
      008A33 CD 8A 21         [ 4] 1923 	CALL	SLMOD
      008A36 CC 86 14         [ 2] 1924 	JP	DROP
                                   1925 
                                   1926 ;       /       ( n n -- q )
                                   1927 ;       Signed divide. Return quotient only.
      008A39 8A 2F                 1928         .word      LINK
                           0009BB  1929 LINK = . 
      008A3B 01                    1930         .byte      1
      008A3C 2F                    1931         .ascii     "/"
      008A3D                       1932 SLASH:
      008A3D CD 8A 21         [ 4] 1933         CALL	SLMOD
      008A40 CD 86 2E         [ 4] 1934         CALL	SWAPP
      008A43 CC 86 14         [ 2] 1935         JP	DROP
                                   1936 
                                   1937 ;; Multiply
                                   1938 
                                   1939 ;       UM*     ( u u -- ud )
                                   1940 ;       Unsigned multiply. Return double product.
      008A46 8A 3B                 1941         .word      LINK
                           0009C8  1942 LINK = . 
      008A48 03                    1943         .byte      3
      008A49 55 4D 2A              1944         .ascii     "UM*"
      008A4C                       1945 UMSTA:	; stack have 4 bytes u1=a,b u2=c,d
                                   1946 ; take advantage of SP addressing modes
                                   1947 ; these PRODx in RAM are not required
                                   1948 ; the product is kept on stack as local variable 
                                   1949         ;; bytes offset on data stack 
                           000002  1950         da=2 
                           000003  1951         db=3 
                           000000  1952         dc=0 
                           000001  1953         dd=1 
                                   1954         ;; product bytes offset on return stack 
                           000001  1955         UD1=1  ; ud bits 31..24
                           000002  1956         UD2=2  ; ud bits 23..16
                           000003  1957         UD3=3  ; ud bits 15..8 
                           000004  1958         UD4=4  ; ud bits 7..0 
                                   1959         ;; local variable for product set to zero   
      008A4C 90 5F            [ 1] 1960         clrw y 
      008A4E 90 89            [ 2] 1961         pushw y  ; bits 15..0
      008A50 90 89            [ 2] 1962         pushw y  ; bits 31..16 
      008A52 E6 03            [ 1] 1963         ld a,(db,x) ; b 
      008A54 90 97            [ 1] 1964         ld yl,a 
      008A56 E6 01            [ 1] 1965         ld a,(dd,x)   ; d
      008A58 90 42            [ 4] 1966         mul y,a    ; b*d  
      008A5A 17 03            [ 2] 1967         ldw (UD3,sp),y ; lowest weight product 
      008A5C E6 03            [ 1] 1968         ld a,(db,x)
      008A5E 90 97            [ 1] 1969         ld yl,a 
      008A60 E6 00            [ 1] 1970         ld a,(dc,x)
      008A62 90 42            [ 4] 1971         mul y,a  ; b*c 
                                   1972         ;;; do the partial sum 
      008A64 72 F9 02         [ 2] 1973         addw y,(UD2,sp)
      008A67 4F               [ 1] 1974         clr a 
      008A68 49               [ 1] 1975         rlc a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



      008A69 6B 01            [ 1] 1976         ld (UD1,sp),a 
      008A6B 17 02            [ 2] 1977         ldw (UD2,sp),y 
      008A6D E6 02            [ 1] 1978         ld a,(da,x)
      008A6F 90 97            [ 1] 1979         ld yl,a 
      008A71 E6 01            [ 1] 1980         ld a,(dd,x)
      008A73 90 42            [ 4] 1981         mul y,a   ; a*d 
                                   1982         ;; do partial sum 
      008A75 72 F9 02         [ 2] 1983         addw y,(UD2,sp)
      008A78 4F               [ 1] 1984         clr a 
      008A79 19 01            [ 1] 1985         adc a,(UD1,sp)
      008A7B 6B 01            [ 1] 1986         ld (UD1,sp),a  
      008A7D 17 02            [ 2] 1987         ldw (UD2,sp),y 
      008A7F E6 02            [ 1] 1988         ld a,(da,x)
      008A81 90 97            [ 1] 1989         ld yl,a 
      008A83 E6 00            [ 1] 1990         ld a,(dc,x)
      008A85 90 42            [ 4] 1991         mul y,a  ;  a*c highest weight product 
                                   1992         ;;; do partial sum 
      008A87 72 F9 01         [ 2] 1993         addw y,(UD1,sp)
      008A8A FF               [ 2] 1994         ldw (x),y  ; udh 
      008A8B 16 03            [ 2] 1995         ldw y,(UD3,sp)
      008A8D EF 02            [ 2] 1996         ldw (2,x),y  ; udl  
      008A8F 5B 04            [ 2] 1997         addw sp,#4 ; drop local variable 
      008A91 81               [ 4] 1998         ret  
                                   1999 
                                   2000 
                                   2001 ;       *       ( n n -- n )
                                   2002 ;       Signed multiply. Return single product.
      008A92 8A 48                 2003         .word      LINK
                           000A14  2004 LINK = . 
      008A94 01                    2005         .byte      1
      008A95 2A                    2006         .ascii     "*"
      008A96                       2007 STAR:
      008A96 CD 8A 4C         [ 4] 2008 	CALL	UMSTA
      008A99 CC 86 14         [ 2] 2009 	JP	DROP
                                   2010 
                                   2011 ;       M*      ( n n -- d )
                                   2012 ;       Signed multiply. Return double product.
      008A9C 8A 94                 2013         .word      LINK
                           000A1E  2014 LINK = . 
      008A9E 02                    2015         .byte      2
      008A9F 4D 2A                 2016         .ascii     "M*"
      008AA1                       2017 MSTAR:      
      008AA1 CD 88 04         [ 4] 2018         CALL	DDUP
      008AA4 CD 86 93         [ 4] 2019         CALL	XORR
      008AA7 CD 86 57         [ 4] 2020         CALL	ZLESS
      008AAA CD 85 E7         [ 4] 2021         CALL	TOR
      008AAD CD 88 AC         [ 4] 2022         CALL	ABSS
      008AB0 CD 86 2E         [ 4] 2023         CALL	SWAPP
      008AB3 CD 88 AC         [ 4] 2024         CALL	ABSS
      008AB6 CD 8A 4C         [ 4] 2025         CALL	UMSTA
      008AB9 CD 85 C8         [ 4] 2026         CALL	RFROM
      008ABC CD 85 2C         [ 4] 2027         CALL	QBRAN
      008ABF 8A C4                 2028         .word	MSTA1
      008AC1 CD 88 56         [ 4] 2029         CALL	DNEGA
      008AC4 81               [ 4] 2030 MSTA1:	RET
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



                                   2031 
                                   2032 ;       */MOD   ( n1 n2 n3 -- r q )
                                   2033 ;       Multiply n1 and n2, then divide
                                   2034 ;       by n3. Return mod and quotient.
      008AC5 8A 9E                 2035         .word      LINK
                           000A47  2036 LINK = . 
      008AC7 05                    2037         .byte      5
      008AC8 2A 2F 4D 4F 44        2038         .ascii     "*/MOD"
      008ACD                       2039 SSMOD:
      008ACD CD 85 E7         [ 4] 2040         CALL     TOR
      008AD0 CD 8A A1         [ 4] 2041         CALL     MSTAR
      008AD3 CD 85 C8         [ 4] 2042         CALL     RFROM
      008AD6 CC 89 D1         [ 2] 2043         JP     MSMOD
                                   2044 
                                   2045 ;       */      ( n1 n2 n3 -- q )
                                   2046 ;       Multiply n1 by n2, then divide
                                   2047 ;       by n3. Return quotient only.
      008AD9 8A C7                 2048         .word      LINK
                           000A5B  2049 LINK = . 
      008ADB 02                    2050         .byte      2
      008ADC 2A 2F                 2051         .ascii     "*/"
      008ADE                       2052 STASL:
      008ADE CD 8A CD         [ 4] 2053         CALL	SSMOD
      008AE1 CD 86 2E         [ 4] 2054         CALL	SWAPP
      008AE4 CC 86 14         [ 2] 2055         JP	DROP
                                   2056 
                                   2057 ;; Miscellaneous
                                   2058 
                                   2059 ;       CELL+   ( a -- a )
                                   2060 ;       Add cell size in byte to address.
      008AE7 8A DB                 2061         .word      LINK
                           000A69  2062 LINK = . 
      008AE9 02                    2063         .byte       2
      008AEA 32 2B                 2064         .ascii     "2+"
      008AEC                       2065 CELLP:
      008AEC 90 93            [ 1] 2066         LDW Y,X
      008AEE 90 FE            [ 2] 2067 	LDW Y,(Y)
      008AF0 72 A9 00 02      [ 2] 2068         ADDW Y,#CELLL 
      008AF4 FF               [ 2] 2069         LDW (X),Y
      008AF5 81               [ 4] 2070         RET
                                   2071 
                                   2072 ;       CELL-   ( a -- a )
                                   2073 ;       Subtract 2 from address.
      008AF6 8A E9                 2074         .word      LINK
                           000A78  2075 LINK = . 
      008AF8 02                    2076         .byte       2
      008AF9 32 2D                 2077         .ascii     "2-"
      008AFB                       2078 CELLM:
      008AFB 90 93            [ 1] 2079         LDW Y,X
      008AFD 90 FE            [ 2] 2080 	LDW Y,(Y)
      008AFF 72 A2 00 02      [ 2] 2081         SUBW Y,#CELLL
      008B03 FF               [ 2] 2082         LDW (X),Y
      008B04 81               [ 4] 2083         RET
                                   2084 
                                   2085 ;       CELLS   ( n -- n )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



                                   2086 ;       Multiply tos by 2.
      008B05 8A F8                 2087         .word      LINK
                           000A87  2088 LINK = . 
      008B07 02                    2089         .byte       2
      008B08 32 2A                 2090         .ascii     "2*"
      008B0A                       2091 CELLS:
      008B0A 90 93            [ 1] 2092         LDW Y,X
      008B0C 90 FE            [ 2] 2093 	LDW Y,(Y)
      008B0E 90 58            [ 2] 2094         SLAW Y
      008B10 FF               [ 2] 2095         LDW (X),Y
      008B11 81               [ 4] 2096         RET
                                   2097 
                                   2098 ;       1+      ( a -- a )
                                   2099 ;       Add cell size in byte to address.
      008B12 8B 07                 2100         .word      LINK
                           000A94  2101 LINK = . 
      008B14 02                    2102         .byte      2
      008B15 31 2B                 2103         .ascii     "1+"
      008B17                       2104 ONEP:
      008B17 90 93            [ 1] 2105         LDW Y,X
      008B19 90 FE            [ 2] 2106 	LDW Y,(Y)
      008B1B 90 5C            [ 1] 2107         INCW Y
      008B1D FF               [ 2] 2108         LDW (X),Y
      008B1E 81               [ 4] 2109         RET
                                   2110 
                                   2111 ;       1-      ( a -- a )
                                   2112 ;       Subtract 2 from address.
      008B1F 8B 14                 2113         .word      LINK
                           000AA1  2114 LINK = . 
      008B21 02                    2115         .byte      2
      008B22 31 2D                 2116         .ascii     "1-"
      008B24                       2117 ONEM:
      008B24 90 93            [ 1] 2118         LDW Y,X
      008B26 90 FE            [ 2] 2119 	LDW Y,(Y)
      008B28 90 5A            [ 2] 2120         DECW Y
      008B2A FF               [ 2] 2121         LDW (X),Y
      008B2B 81               [ 4] 2122         RET
                                   2123 
                                   2124 ;  shift left n times 
                                   2125 ; LSHIFT ( n1 n2 -- n1<<n2 )
      008B2C 8B 21                 2126         .word LINK 
                           000AAE  2127         LINK=.
      008B2E 06                    2128         .byte 6 
      008B2F 4C 53 48 49 46 54     2129         .ascii "LSHIFT"
      008B35                       2130 LSHIFT:
      008B35 E6 01            [ 1] 2131         ld a,(1,x)
      008B37 1C 00 02         [ 2] 2132         addw x,#CELLL 
      008B3A 90 93            [ 1] 2133         ldw y,x 
      008B3C 90 FE            [ 2] 2134         ldw y,(y)
      008B3E                       2135 LSHIFT1:
      008B3E 4D               [ 1] 2136         tnz a 
      008B3F 27 05            [ 1] 2137         jreq LSHIFT4 
      008B41 90 58            [ 2] 2138         sllw y 
      008B43 4A               [ 1] 2139         dec a 
      008B44 20 F8            [ 2] 2140         jra LSHIFT1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



      008B46                       2141 LSHIFT4:
      008B46 FF               [ 2] 2142         ldw (x),y 
      008B47 81               [ 4] 2143         ret 
                                   2144 
                                   2145 ; shift right n times                 
                                   2146 ; RSHIFT (n1 n2 -- n1>>n2 )
      008B48 8B 2E                 2147         .word LINK 
                           000ACA  2148         LINK=.
      008B4A 06                    2149         .byte 6
      008B4B 52 53 48 49 46 54     2150         .ascii "RSHIFT"
      008B51                       2151 RSHIFT:
      008B51 E6 01            [ 1] 2152         ld a,(1,x)
      008B53 1C 00 02         [ 2] 2153         addw x,#CELLL 
      008B56 90 93            [ 1] 2154         ldw y,x 
      008B58 90 FE            [ 2] 2155         ldw y,(y)
      008B5A                       2156 RSHIFT1:
      008B5A 4D               [ 1] 2157         tnz a 
      008B5B 27 05            [ 1] 2158         jreq RSHIFT4 
      008B5D 90 54            [ 2] 2159         srlw y 
      008B5F 4A               [ 1] 2160         dec a 
      008B60 20 F8            [ 2] 2161         jra RSHIFT1 
      008B62                       2162 RSHIFT4:
      008B62 FF               [ 2] 2163         ldw (x),y 
      008B63 81               [ 4] 2164         ret 
                                   2165 
                                   2166 
                                   2167 ;       2/      ( n -- n )
                                   2168 ;       divide  tos by 2.
      008B64 8B 4A                 2169         .word      LINK
                           000AE6  2170 LINK = . 
      008B66 02                    2171         .byte      2
      008B67 32 2F                 2172         .ascii     "2/"
      008B69                       2173 TWOSL:
      008B69 90 93            [ 1] 2174         LDW Y,X
      008B6B 90 FE            [ 2] 2175 	LDW Y,(Y)
      008B6D 90 57            [ 2] 2176         SRAW Y
      008B6F FF               [ 2] 2177         LDW (X),Y
      008B70 81               [ 4] 2178         RET
                                   2179 
                                   2180 ;       BL      ( -- 32 )
                                   2181 ;       Return 32,  blank character.
      008B71 8B 66                 2182         .word      LINK
                           000AF3  2183 LINK = . 
      008B73 02                    2184         .byte      2
      008B74 42 4C                 2185         .ascii     "BL"
      008B76                       2186 BLANK:
      008B76 1D 00 02         [ 2] 2187         SUBW X,#2
      008B79 90 AE 00 20      [ 2] 2188 	LDW Y,#32
      008B7D FF               [ 2] 2189         LDW (X),Y
      008B7E 81               [ 4] 2190         RET
                                   2191 
                                   2192 ;         0     ( -- 0)
                                   2193 ;         Return 0.
      008B7F 8B 73                 2194         .word      LINK
                           000B01  2195 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



      008B81 01                    2196         .byte       1
      008B82 30                    2197         .ascii     "0"
      008B83                       2198 ZERO:
      008B83 1D 00 02         [ 2] 2199         SUBW X,#2
      008B86 90 5F            [ 1] 2200 	CLRW Y
      008B88 FF               [ 2] 2201         LDW (X),Y
      008B89 81               [ 4] 2202         RET
                                   2203 
                                   2204 ;         1     ( -- 1)
                                   2205 ;         Return 1.
      008B8A 8B 81                 2206         .word      LINK
                           000B0C  2207 LINK = . 
      008B8C 01                    2208         .byte       1
      008B8D 31                    2209         .ascii     "1"
      008B8E                       2210 ONE:
      008B8E 1D 00 02         [ 2] 2211         SUBW X,#2
      008B91 90 AE 00 01      [ 2] 2212 	LDW Y,#1
      008B95 FF               [ 2] 2213         LDW (X),Y
      008B96 81               [ 4] 2214         RET
                                   2215 
                                   2216 ;         -1    ( -- -1)
                                   2217 ;         Return 32,  blank character.
      008B97 8B 8C                 2218         .word      LINK
                           000B19  2219 LINK = . 
      008B99 02                    2220         .byte       2
      008B9A 2D 31                 2221         .ascii     "-1"
      008B9C                       2222 MONE:
      008B9C 1D 00 02         [ 2] 2223         SUBW X,#2
      008B9F 90 AE FF FF      [ 2] 2224 	LDW Y,#0xFFFF
      008BA3 FF               [ 2] 2225         LDW (X),Y
      008BA4 81               [ 4] 2226         RET
                                   2227 
                                   2228 ;       >CHAR   ( c -- c )
                                   2229 ;       Filter non-printing characters.
      008BA5 8B 99                 2230         .word      LINK
                           000B27  2231 LINK = . 
      008BA7 05                    2232         .byte      5
      008BA8 3E 43 48 41 52        2233         .ascii     ">CHAR"
      008BAD                       2234 TCHAR:
      008BAD E6 01            [ 1] 2235         ld a,(1,x)
      008BAF A1 20            [ 1] 2236         cp a,#32  
      008BB1 2B 05            [ 1] 2237         jrmi 1$ 
      008BB3 A1 7F            [ 1] 2238         cp a,#127 
      008BB5 2A 01            [ 1] 2239         jrpl 1$ 
      008BB7 81               [ 4] 2240         ret 
      008BB8 A6 5F            [ 1] 2241 1$:     ld a,#'_ 
      008BBA E7 01            [ 1] 2242         ld (1,x),a 
      008BBC 81               [ 4] 2243         ret 
                                   2244 
                                   2245 ;       DEPTH   ( -- n )
                                   2246 ;       Return  depth of  data stack.
      008BBD 8B A7                 2247         .word      LINK
                           000B3F  2248 LINK = . 
      008BBF 05                    2249         .byte      5
      008BC0 44 45 50 54 48        2250         .ascii     "DEPTH"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



      008BC5                       2251 DEPTH: 
      008BC5 90 BE 2E         [ 2] 2252         LDW Y,SP0    ;save data stack ptr
      008BC8 BF 26            [ 2] 2253 	LDW XTEMP,X
      008BCA 72 B2 00 26      [ 2] 2254         SUBW Y,XTEMP     ;#bytes = SP0 - X
      008BCE 90 57            [ 2] 2255         SRAW Y    ;Y = #stack items
      008BD0 1D 00 02         [ 2] 2256 	SUBW X,#2
      008BD3 FF               [ 2] 2257         LDW (X),Y     ; if neg, underflow
      008BD4 81               [ 4] 2258         RET
                                   2259 
                                   2260 ;       PICK    ( ... +n -- ... w )
                                   2261 ;       Copy  nth stack item to tos.
      008BD5 8B BF                 2262         .word      LINK
                           000B57  2263 LINK = . 
      008BD7 04                    2264         .byte      4
      008BD8 50 49 43 4B           2265         .ascii     "PICK"
      008BDC                       2266 PICK:
      008BDC 90 93            [ 1] 2267         LDW Y,X   ;D = n1
      008BDE 90 FE            [ 2] 2268         LDW Y,(Y)
                                   2269 ; modified for standard compliance          
                                   2270 ; 0 PICK must be equivalent to DUP 
      008BE0 90 5C            [ 1] 2271         INCW Y 
      008BE2 90 58            [ 2] 2272         SLAW Y
      008BE4 BF 26            [ 2] 2273         LDW XTEMP,X
      008BE6 72 B9 00 26      [ 2] 2274         ADDW Y,XTEMP
      008BEA 90 FE            [ 2] 2275         LDW Y,(Y)
      008BEC FF               [ 2] 2276         LDW (X),Y
      008BED 81               [ 4] 2277         RET
                                   2278 
                                   2279 ;; Memory access
                                   2280 
                                   2281 ;       +!      ( n a -- )
                                   2282 ;       Add n to  contents at address a.
      008BEE 8B D7                 2283         .word      LINK
                           000B70  2284 LINK = . 
      008BF0 02                    2285         .byte      2
      008BF1 2B 21                 2286         .ascii     "+!"
      008BF3                       2287 PSTOR:
      008BF3 90 93            [ 1] 2288         ldw y,x 
      008BF5 90 FE            [ 2] 2289         ldw y,(y)
      008BF7 90 BF 28         [ 2] 2290         ldw YTEMP,y  ; address
      008BFA 90 FE            [ 2] 2291         ldw y,(y)  
      008BFC 90 89            [ 2] 2292         pushw y  ; value at address 
      008BFE 90 93            [ 1] 2293         ldw y,x 
      008C00 90 EE 02         [ 2] 2294         ldw y,(2,y) ; n 
      008C03 72 F9 01         [ 2] 2295         addw y,(1,sp) ; n+value
      008C06 91 CF 28         [ 5] 2296         ldw [YTEMP],y ;  a!
      008C09 90 85            [ 2] 2297         popw y    ;drop local var
      008C0B 1C 00 04         [ 2] 2298         addw x,#4 ; DDROP 
      008C0E 81               [ 4] 2299         ret 
                                   2300 
                                   2301 ;       2!      ( d a -- )
                                   2302 ;       Store  double integer to address a.
      008C0F 8B F0                 2303         .word      LINK
                           000B91  2304 LINK = . 
      008C11 02                    2305         .byte      2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



      008C12 32 21                 2306         .ascii     "2!"
      008C14                       2307 DSTOR:
      008C14 90 93            [ 1] 2308         ldw y,x 
      008C16 90 FE            [ 2] 2309         ldw y,(y)
      008C18 90 BF 28         [ 2] 2310         ldw YTEMP,y ; address 
      008C1B 1C 00 02         [ 2] 2311         addw x,#CELLL ; drop a 
      008C1E 90 93            [ 1] 2312         ldw y,x 
      008C20 90 FE            [ 2] 2313         ldw y,(y) ; hi word 
      008C22 89               [ 2] 2314         pushw x 
      008C23 EE 02            [ 2] 2315         ldw x,(2,x) ; lo word 
      008C25 91 CF 28         [ 5] 2316         ldw [YTEMP],y
      008C28 90 93            [ 1] 2317         ldw y,x 
      008C2A AE 00 02         [ 2] 2318         ldw x,#2 
      008C2D 92 DF 28         [ 5] 2319         ldw ([YTEMP],x),y 
      008C30 85               [ 2] 2320         popw x 
      008C31 1C 00 04         [ 2] 2321         addw x,#4 ; DDROP 
      008C34 81               [ 4] 2322         ret 
                                   2323 
                                   2324 ;       2@      ( a -- d )
                                   2325 ;       Fetch double integer from address a.
      008C35 8C 11                 2326         .word      LINK
                           000BB7  2327 LINK = . 
      008C37 02                    2328         .byte      2
      008C38 32 40                 2329         .ascii     "2@"
      008C3A                       2330 DAT:
      008C3A 90 93            [ 1] 2331         ldw y,x 
      008C3C 90 FE            [ 2] 2332         ldw y,(y) ;address 
      008C3E 90 BF 28         [ 2] 2333         ldw YTEMP,y 
      008C41 1D 00 02         [ 2] 2334         subw x,#CELLL ; space for udh 
      008C44 91 CE 28         [ 5] 2335         ldw y,[YTEMP] ; udh 
      008C47 FF               [ 2] 2336         ldw (x),y 
      008C48 90 AE 00 02      [ 2] 2337         ldw y,#2
      008C4C 91 DE 28         [ 5] 2338         ldw y,([YTEMP],y) ; udl 
      008C4F EF 02            [ 2] 2339         ldw (2,x),y
      008C51 81               [ 4] 2340         ret 
                                   2341 
                                   2342 ;       COUNT   ( b -- b +n )
                                   2343 ;       Return count byte of a string
                                   2344 ;       and add 1 to byte address.
      008C52 8C 37                 2345         .word      LINK
                           000BD4  2346 LINK = . 
      008C54 05                    2347         .byte      5
      008C55 43 4F 55 4E 54        2348         .ascii     "COUNT"
      008C5A                       2349 COUNT:
      008C5A 90 93            [ 1] 2350         ldw y,x 
      008C5C 90 FE            [ 2] 2351         ldw y,(y) ; address 
      008C5E 90 F6            [ 1] 2352         ld a,(y)  ; count 
      008C60 90 5C            [ 1] 2353         incw y 
      008C62 FF               [ 2] 2354         ldw (x),y 
      008C63 1D 00 02         [ 2] 2355         subw x,#CELLL 
      008C66 E7 01            [ 1] 2356         ld (1,x),a 
      008C68 7F               [ 1] 2357         clr (x)
      008C69 81               [ 4] 2358         ret 
                                   2359 
                                   2360 ;       HERE    ( -- a )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



                                   2361 ;       Return  top of  variables
      008C6A 8C 54                 2362         .word      LINK
                           000BEC  2363 LINK = . 
      008C6C 04                    2364         .byte      4
      008C6D 48 45 52 45           2365         .ascii     "HERE"
      008C71                       2366 HERE:
      008C71 90 AE 00 1A      [ 2] 2367       	ldw y,#UVP 
      008C75 90 FE            [ 2] 2368         ldw y,(y)
      008C77 1D 00 02         [ 2] 2369         subw x,#CELLL 
      008C7A FF               [ 2] 2370         ldw (x),y 
      008C7B 81               [ 4] 2371         ret 
                                   2372 
                                   2373 ;       PAD     ( -- a )
                                   2374 ;       Return address of text buffer
                                   2375 ;       above  code dictionary.
      008C7C 8C 6C                 2376         .word      LINK
                           000BFE  2377 LINK = . 
      008C7E 03                    2378         .byte      3
      008C7F 50 41 44              2379         .ascii     "PAD"
      008C82                       2380 PAD:
      008C82 CD 8C 71         [ 4] 2381         CALL     HERE
      008C85 CD 84 F9         [ 4] 2382         CALL     DOLIT
      008C88 00 50                 2383         .word      80
      008C8A CC 88 19         [ 2] 2384         JP     PLUS
                                   2385 
                                   2386 ;       TIB     ( -- a )
                                   2387 ;       Return address of terminal input buffer.
      008C8D 8C 7E                 2388         .word      LINK
                           000C0F  2389 LINK = . 
      008C8F 03                    2390         .byte      3
      008C90 54 49 42              2391         .ascii     "TIB"
      008C93                       2392 TIB:
      008C93 CD 87 09         [ 4] 2393         CALL     NTIB
      008C96 CD 8A EC         [ 4] 2394         CALL     CELLP
      008C99 CC 85 77         [ 2] 2395         JP     AT
                                   2396 
                                   2397 ;       @EXECUTE        ( a -- )
                                   2398 ;       Execute vector stored in address a.
      008C9C 8C 8F                 2399         .word      LINK
                           000C1E  2400 LINK = . 
      008C9E 08                    2401         .byte      8
      008C9F 40 45 58 45 43 55 54  2402         .ascii     "@EXECUTE"
             45
      008CA7                       2403 ATEXE:
      008CA7 CD 85 77         [ 4] 2404         CALL     AT
      008CAA CD 87 C8         [ 4] 2405         CALL     QDUP    ;?address or zero
      008CAD CD 85 2C         [ 4] 2406         CALL     QBRAN
      008CB0 8C B5                 2407         .word      EXE1
      008CB2 CD 85 53         [ 4] 2408         CALL     EXECU   ;execute if non-zero
      008CB5 81               [ 4] 2409 EXE1:   RET     ;do nothing if zero
                                   2410 
                                   2411 ;       CMOVE   ( b1 b2 u -- )
                                   2412 ;       Copy u bytes from b1 to b2.
      008CB6 8C 9E                 2413         .word      LINK
                           000C38  2414 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      008CB8 05                    2415         .byte      5
      008CB9 43 4D 4F 56 45        2416         .ascii     "CMOVE"
      008CBE                       2417 CMOVE:
      008CBE CD 85 E7         [ 4] 2418         CALL	TOR
      008CC1 CD 85 43         [ 4] 2419         CALL	BRAN
      008CC4 8C DE                 2420         .word	CMOV2
      008CC6 CD 85 E7         [ 4] 2421 CMOV1:	CALL	TOR
      008CC9 CD 86 1E         [ 4] 2422         CALL	DUPP
      008CCC CD 85 95         [ 4] 2423         CALL	CAT
      008CCF CD 85 DB         [ 4] 2424         CALL	RAT
      008CD2 CD 85 84         [ 4] 2425         CALL	CSTOR
      008CD5 CD 8B 17         [ 4] 2426         CALL	ONEP
      008CD8 CD 85 C8         [ 4] 2427         CALL	RFROM
      008CDB CD 8B 17         [ 4] 2428         CALL	ONEP
      008CDE CD 85 0D         [ 4] 2429 CMOV2:	CALL	DONXT
      008CE1 8C C6                 2430         .word	CMOV1
      008CE3 CC 87 F9         [ 2] 2431         JP	DDROP
                                   2432 
                                   2433 ;       FILL    ( b u c -- )
                                   2434 ;       Fill u bytes of character c
                                   2435 ;       to area beginning at b.
      008CE6 8C B8                 2436         .word       LINK
                           000C68  2437 LINK = . 
      008CE8 04                    2438         .byte       4
      008CE9 46 49 4C 4C           2439         .ascii     "FILL"
      008CED                       2440 FILL:
      008CED 90 93            [ 1] 2441         ldw y,x 
      008CEF 90 E6 01         [ 1] 2442         ld a,(1,y) ; c 
      008CF2 1C 00 02         [ 2] 2443         addw x,#CELLL ; drop c 
      008CF5 90 93            [ 1] 2444         ldw y,x 
      008CF7 90 FE            [ 2] 2445         ldw y,(y) ; count
      008CF9 90 89            [ 2] 2446         pushw y 
      008CFB 1C 00 02         [ 2] 2447         addw x,#CELLL ; drop u 
      008CFE 90 93            [ 1] 2448         ldw y,x 
      008D00 1C 00 02         [ 2] 2449         addw x,#CELLL ; drop b 
      008D03 90 FE            [ 2] 2450         ldw y,(y) ; address
      008D05 90 BF 28         [ 2] 2451         ldw YTEMP,y
      008D08 90 85            [ 2] 2452         popw y ; count 
      008D0A                       2453 FILL1:  
      008D0A 92 C7 28         [ 4] 2454         ld [YTEMP],a 
      008D0D 3C 29            [ 1] 2455         inc YTEMP+1
      008D0F 24 02            [ 1] 2456         jrnc FILL2 
      008D11 3C 28            [ 1] 2457         inc YTEMP
      008D13                       2458 FILL2: 
      008D13 90 5A            [ 2] 2459         decw y ; count 
      008D15 26 F3            [ 1] 2460         jrne FILL1  
      008D17 81               [ 4] 2461         ret 
                                   2462 
                                   2463 ;       ERASE   ( b u -- )
                                   2464 ;       Erase u bytes beginning at b.
      008D18 8C E8                 2465         .word      LINK
                           000C9A  2466 LINK = . 
      008D1A 05                    2467         .byte      5
      008D1B 45 52 41 53 45        2468         .ascii     "ERASE"
      008D20                       2469 ERASE:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      008D20 90 5F            [ 1] 2470         clrw y 
      008D22 1D 00 02         [ 2] 2471         subw x,#CELLL 
      008D25 FF               [ 2] 2472         ldw (x),y 
      008D26 CC 8C ED         [ 2] 2473         jp FILL 
                                   2474 
                                   2475 
                                   2476 ;       PACK0   ( b u a -- a )
                                   2477 ;       Build a counted string with
                                   2478 ;       u characters from b. Null fill.
      008D29 8D 1A                 2479         .word      LINK
                           000CAB  2480 LINK = . 
      008D2B 05                    2481         .byte      5
      008D2C 50 41 43 4B 30        2482         .ascii     "PACK0"
      008D31                       2483 PACKS:
      008D31 CD 86 1E         [ 4] 2484         CALL     DUPP
      008D34 CD 85 E7         [ 4] 2485         CALL     TOR     ;strings only on cell boundary
      008D37 CD 88 04         [ 4] 2486         CALL     DDUP
      008D3A CD 85 84         [ 4] 2487         CALL     CSTOR
      008D3D CD 8B 17         [ 4] 2488         CALL     ONEP ;save count
      008D40 CD 86 2E         [ 4] 2489         CALL     SWAPP
      008D43 CD 8C BE         [ 4] 2490         CALL     CMOVE
      008D46 CD 85 C8         [ 4] 2491         CALL     RFROM
      008D49 81               [ 4] 2492         RET
                                   2493 
                                   2494 ;; Numeric output, single precision
                                   2495 
                                   2496 ;       DIGIT   ( u -- c )
                                   2497 ;       Convert digit u to a character.
      008D4A 8D 2B                 2498         .word      LINK
                           000CCC  2499 LINK = . 
      008D4C 05                    2500         .byte      5
      008D4D 44 49 47 49 54        2501         .ascii     "DIGIT"
      008D52                       2502 DIGIT:
      008D52 CD 84 F9         [ 4] 2503         CALL	DOLIT
      008D55 00 09                 2504         .word	9
      008D57 CD 86 48         [ 4] 2505         CALL	OVER
      008D5A CD 88 F7         [ 4] 2506         CALL	LESS
      008D5D CD 84 F9         [ 4] 2507         CALL	DOLIT
      008D60 00 07                 2508         .word	7
      008D62 CD 86 6A         [ 4] 2509         CALL	ANDD
      008D65 CD 88 19         [ 4] 2510         CALL	PLUS
      008D68 CD 84 F9         [ 4] 2511         CALL	DOLIT
      008D6B 00 30                 2512         .word	48	;'0'
      008D6D CC 88 19         [ 2] 2513         JP	PLUS
                                   2514 
                                   2515 ;       EXTRACT ( n base -- n c )
                                   2516 ;       Extract least significant digit from n.
      008D70 8D 4C                 2517         .word      LINK
                           000CF2  2518 LINK = . 
      008D72 07                    2519         .byte      7
      008D73 45 58 54 52 41 43 54  2520         .ascii     "EXTRACT"
      008D7A                       2521 EXTRC:
      008D7A CD 8B 83         [ 4] 2522         CALL     ZERO
      008D7D CD 86 2E         [ 4] 2523         CALL     SWAPP
      008D80 CD 89 8D         [ 4] 2524         CALL     UMMOD
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



      008D83 CD 86 2E         [ 4] 2525         CALL     SWAPP
      008D86 CC 8D 52         [ 2] 2526         JP     DIGIT
                                   2527 
                                   2528 ;       <#      ( -- )
                                   2529 ;       Initiate  numeric output process.
      008D89 8D 72                 2530         .word      LINK
                           000D0B  2531 LINK = . 
      008D8B 02                    2532         .byte      2
      008D8C 3C 23                 2533         .ascii     "<#"
      008D8E                       2534 BDIGS:
      008D8E CD 8C 82         [ 4] 2535         CALL     PAD
      008D91 CD 87 4B         [ 4] 2536         CALL     HLD
      008D94 CC 85 60         [ 2] 2537         JP     STORE
                                   2538 
                                   2539 ;       HOLD    ( c -- )
                                   2540 ;       Insert a character into output string.
      008D97 8D 8B                 2541         .word      LINK
                           000D19  2542 LINK = . 
      008D99 04                    2543         .byte      4
      008D9A 48 4F 4C 44           2544         .ascii     "HOLD"
      008D9E                       2545 HOLD:
      008D9E CD 87 4B         [ 4] 2546         CALL     HLD
      008DA1 CD 85 77         [ 4] 2547         CALL     AT
      008DA4 CD 8B 24         [ 4] 2548         CALL     ONEM
      008DA7 CD 86 1E         [ 4] 2549         CALL     DUPP
      008DAA CD 87 4B         [ 4] 2550         CALL     HLD
      008DAD CD 85 60         [ 4] 2551         CALL     STORE
      008DB0 CC 85 84         [ 2] 2552         JP     CSTOR
                                   2553 
                                   2554 ;       #       ( u -- u )
                                   2555 ;       Extract one digit from u and
                                   2556 ;       append digit to output string.
      008DB3 8D 99                 2557         .word      LINK
                           000D35  2558 LINK = . 
      008DB5 01                    2559         .byte      1
      008DB6 23                    2560         .ascii     "#"
      008DB7                       2561 DIG:
      008DB7 CD 86 DB         [ 4] 2562         CALL     BASE
      008DBA CD 85 77         [ 4] 2563         CALL     AT
      008DBD CD 8D 7A         [ 4] 2564         CALL     EXTRC
      008DC0 CC 8D 9E         [ 2] 2565         JP     HOLD
                                   2566 
                                   2567 ;       #S      ( u -- 0 )
                                   2568 ;       Convert u until all digits
                                   2569 ;       are added to output string.
      008DC3 8D B5                 2570         .word      LINK
                           000D45  2571 LINK = . 
      008DC5 02                    2572         .byte      2
      008DC6 23 53                 2573         .ascii     "#S"
      008DC8                       2574 DIGS:
      008DC8 CD 8D B7         [ 4] 2575 DIGS1:  CALL     DIG
      008DCB CD 86 1E         [ 4] 2576         CALL     DUPP
      008DCE CD 85 2C         [ 4] 2577         CALL     QBRAN
      008DD1 8D D5                 2578         .word      DIGS2
      008DD3 20 F3            [ 2] 2579         JRA     DIGS1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      008DD5 81               [ 4] 2580 DIGS2:  RET
                                   2581 
                                   2582 ;       SIGN    ( n -- )
                                   2583 ;       Add a minus sign to
                                   2584 ;       numeric output string.
      008DD6 8D C5                 2585         .word      LINK
                           000D58  2586 LINK = . 
      008DD8 04                    2587         .byte      4
      008DD9 53 49 47 4E           2588         .ascii     "SIGN"
      008DDD                       2589 SIGN:
      008DDD CD 86 57         [ 4] 2590         CALL     ZLESS
      008DE0 CD 85 2C         [ 4] 2591         CALL     QBRAN
      008DE3 8D ED                 2592         .word      SIGN1
      008DE5 CD 84 F9         [ 4] 2593         CALL     DOLIT
      008DE8 00 2D                 2594         .word      45	;"-"
      008DEA CC 8D 9E         [ 2] 2595         JP     HOLD
      008DED 81               [ 4] 2596 SIGN1:  RET
                                   2597 
                                   2598 ;       #>      ( w -- b u )
                                   2599 ;       Prepare output string.
      008DEE 8D D8                 2600         .word      LINK
                           000D70  2601 LINK = . 
      008DF0 02                    2602         .byte      2
      008DF1 23 3E                 2603         .ascii     "#>"
      008DF3                       2604 EDIGS:
      008DF3 CD 86 14         [ 4] 2605         CALL     DROP
      008DF6 CD 87 4B         [ 4] 2606         CALL     HLD
      008DF9 CD 85 77         [ 4] 2607         CALL     AT
      008DFC CD 8C 82         [ 4] 2608         CALL     PAD
      008DFF CD 86 48         [ 4] 2609         CALL     OVER
      008E02 CC 88 92         [ 2] 2610         JP     SUBB
                                   2611 
                                   2612 ;       str     ( w -- b u )
                                   2613 ;       Convert a signed integer
                                   2614 ;       to a numeric string.
      008E05 8D F0                 2615         .word      LINK
                           000D87  2616 LINK = . 
      008E07 03                    2617         .byte      3
      008E08 53 54 52              2618         .ascii     "STR"
      008E0B                       2619 STR:
      008E0B CD 86 1E         [ 4] 2620         CALL     DUPP
      008E0E CD 85 E7         [ 4] 2621         CALL     TOR
      008E11 CD 88 AC         [ 4] 2622         CALL     ABSS
      008E14 CD 8D 8E         [ 4] 2623         CALL     BDIGS
      008E17 CD 8D C8         [ 4] 2624         CALL     DIGS
      008E1A CD 85 C8         [ 4] 2625         CALL     RFROM
      008E1D CD 8D DD         [ 4] 2626         CALL     SIGN
      008E20 CC 8D F3         [ 2] 2627         JP     EDIGS
                                   2628 
                                   2629 ;       HEX     ( -- )
                                   2630 ;       Use radix 16 as base for
                                   2631 ;       numeric conversions.
      008E23 8E 07                 2632         .word      LINK
                           000DA5  2633 LINK = . 
      008E25 03                    2634         .byte      3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



      008E26 48 45 58              2635         .ascii     "HEX"
      008E29                       2636 HEX:
      008E29 CD 84 F9         [ 4] 2637         CALL     DOLIT
      008E2C 00 10                 2638         .word      16
      008E2E CD 86 DB         [ 4] 2639         CALL     BASE
      008E31 CC 85 60         [ 2] 2640         JP     STORE
                                   2641 
                                   2642 ;       DECIMAL ( -- )
                                   2643 ;       Use radix 10 as base
                                   2644 ;       for numeric conversions.
      008E34 8E 25                 2645         .word      LINK
                           000DB6  2646 LINK = . 
      008E36 07                    2647         .byte      7
      008E37 44 45 43 49 4D 41 4C  2648         .ascii     "DECIMAL"
      008E3E                       2649 DECIM:
      008E3E CD 84 F9         [ 4] 2650         CALL     DOLIT
      008E41 00 0A                 2651         .word      10
      008E43 CD 86 DB         [ 4] 2652         CALL     BASE
      008E46 CC 85 60         [ 2] 2653         JP     STORE
                                   2654 
                                   2655 ;; Numeric input, single precision
                                   2656 
                                   2657 ;       DIGIT?  ( c base -- u t )
                                   2658 ;       Convert a character to its numeric
                                   2659 ;       value. A flag indicates success.
      008E49 8E 36                 2660         .word      LINK
                           000DCB  2661 LINK = . 
      008E4B 06                    2662         .byte       6
      008E4C 44 49 47 49 54 3F     2663         .ascii     "DIGIT?"
      008E52                       2664 DIGTQ:
      008E52 CD 85 E7         [ 4] 2665         CALL     TOR
      008E55 CD 84 F9         [ 4] 2666         CALL     DOLIT
      008E58 00 30                 2667         .word     48	; "0"
      008E5A CD 88 92         [ 4] 2668         CALL     SUBB
      008E5D CD 84 F9         [ 4] 2669         CALL     DOLIT
      008E60 00 09                 2670         .word      9
      008E62 CD 86 48         [ 4] 2671         CALL     OVER
      008E65 CD 88 F7         [ 4] 2672         CALL     LESS
      008E68 CD 85 2C         [ 4] 2673         CALL     QBRAN
      008E6B 8E 83                 2674         .word      DGTQ1
      008E6D CD 84 F9         [ 4] 2675         CALL     DOLIT
      008E70 00 07                 2676         .word      7
      008E72 CD 88 92         [ 4] 2677         CALL     SUBB
      008E75 CD 86 1E         [ 4] 2678         CALL     DUPP
      008E78 CD 84 F9         [ 4] 2679         CALL     DOLIT
      008E7B 00 0A                 2680         .word      10
      008E7D CD 88 F7         [ 4] 2681         CALL     LESS
      008E80 CD 86 7E         [ 4] 2682         CALL     ORR
      008E83 CD 86 1E         [ 4] 2683 DGTQ1:  CALL     DUPP
      008E86 CD 85 C8         [ 4] 2684         CALL     RFROM
      008E89 CC 88 D9         [ 2] 2685         JP     ULESS
                                   2686 
                                   2687 ;       NUMBER? ( a -- n T | a F )
                                   2688 ;       Convert a number string to
                                   2689 ;       integer. Push a flag on tos.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



      008E8C 8E 4B                 2690         .word      LINK
                           000E0E  2691 LINK = . 
      008E8E 07                    2692         .byte      7
      008E8F 4E 55 4D 42 45 52 3F  2693         .ascii     "NUMBER?"
      008E96                       2694 NUMBQ:
      008E96 CD 86 DB         [ 4] 2695         CALL     BASE
      008E99 CD 85 77         [ 4] 2696         CALL     AT
      008E9C CD 85 E7         [ 4] 2697         CALL     TOR
      008E9F CD 8B 83         [ 4] 2698         CALL     ZERO
      008EA2 CD 86 48         [ 4] 2699         CALL     OVER
      008EA5 CD 8C 5A         [ 4] 2700         CALL     COUNT
      008EA8 CD 86 48         [ 4] 2701         CALL     OVER
      008EAB CD 85 95         [ 4] 2702         CALL     CAT
      008EAE CD 84 F9         [ 4] 2703         CALL     DOLIT
      008EB1 00 24                 2704         .word     36	; "0x"
      008EB3 CD 88 BA         [ 4] 2705         CALL     EQUAL
      008EB6 CD 85 2C         [ 4] 2706         CALL     QBRAN
      008EB9 8E CA                 2707         .word      NUMQ1
      008EBB CD 8E 29         [ 4] 2708         CALL     HEX
      008EBE CD 86 2E         [ 4] 2709         CALL     SWAPP
      008EC1 CD 8B 17         [ 4] 2710         CALL     ONEP
      008EC4 CD 86 2E         [ 4] 2711         CALL     SWAPP
      008EC7 CD 8B 24         [ 4] 2712         CALL     ONEM
      008ECA CD 86 48         [ 4] 2713 NUMQ1:  CALL     OVER
      008ECD CD 85 95         [ 4] 2714         CALL     CAT
      008ED0 CD 84 F9         [ 4] 2715         CALL     DOLIT
      008ED3 00 2D                 2716         .word     45	; "-"
      008ED5 CD 88 BA         [ 4] 2717         CALL     EQUAL
      008ED8 CD 85 E7         [ 4] 2718         CALL     TOR
      008EDB CD 86 2E         [ 4] 2719         CALL     SWAPP
      008EDE CD 85 DB         [ 4] 2720         CALL     RAT
      008EE1 CD 88 92         [ 4] 2721         CALL     SUBB
      008EE4 CD 86 2E         [ 4] 2722         CALL     SWAPP
      008EE7 CD 85 DB         [ 4] 2723         CALL     RAT
      008EEA CD 88 19         [ 4] 2724         CALL     PLUS
      008EED CD 87 C8         [ 4] 2725         CALL     QDUP
      008EF0 CD 85 2C         [ 4] 2726         CALL     QBRAN
      008EF3 8F 54                 2727         .word      NUMQ6
      008EF5 CD 8B 24         [ 4] 2728         CALL     ONEM
      008EF8 CD 85 E7         [ 4] 2729         CALL     TOR
      008EFB CD 86 1E         [ 4] 2730 NUMQ2:  CALL     DUPP
      008EFE CD 85 E7         [ 4] 2731         CALL     TOR
      008F01 CD 85 95         [ 4] 2732         CALL     CAT
      008F04 CD 86 DB         [ 4] 2733         CALL     BASE
      008F07 CD 85 77         [ 4] 2734         CALL     AT
      008F0A CD 8E 52         [ 4] 2735         CALL     DIGTQ
      008F0D CD 85 2C         [ 4] 2736         CALL     QBRAN
      008F10 8F 42                 2737         .word      NUMQ4
      008F12 CD 86 2E         [ 4] 2738         CALL     SWAPP
      008F15 CD 86 DB         [ 4] 2739         CALL     BASE
      008F18 CD 85 77         [ 4] 2740         CALL     AT
      008F1B CD 8A 96         [ 4] 2741         CALL     STAR
      008F1E CD 88 19         [ 4] 2742         CALL     PLUS
      008F21 CD 85 C8         [ 4] 2743         CALL     RFROM
      008F24 CD 8B 17         [ 4] 2744         CALL     ONEP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



      008F27 CD 85 0D         [ 4] 2745         CALL     DONXT
      008F2A 8E FB                 2746         .word      NUMQ2
      008F2C CD 85 DB         [ 4] 2747         CALL     RAT
      008F2F CD 86 2E         [ 4] 2748         CALL     SWAPP
      008F32 CD 86 14         [ 4] 2749         CALL     DROP
      008F35 CD 85 2C         [ 4] 2750         CALL     QBRAN
      008F38 8F 3D                 2751         .word      NUMQ3
      008F3A CD 88 44         [ 4] 2752         CALL     NEGAT
      008F3D CD 86 2E         [ 4] 2753 NUMQ3:  CALL     SWAPP
      008F40 20 0F            [ 2] 2754         JRA     NUMQ5
      008F42 CD 85 C8         [ 4] 2755 NUMQ4:  CALL     RFROM
      008F45 CD 85 C8         [ 4] 2756         CALL     RFROM
      008F48 CD 87 F9         [ 4] 2757         CALL     DDROP
      008F4B CD 87 F9         [ 4] 2758         CALL     DDROP
      008F4E CD 8B 83         [ 4] 2759         CALL     ZERO
      008F51 CD 86 1E         [ 4] 2760 NUMQ5:  CALL     DUPP
      008F54 CD 85 C8         [ 4] 2761 NUMQ6:  CALL     RFROM
      008F57 CD 87 F9         [ 4] 2762         CALL     DDROP
      008F5A CD 85 C8         [ 4] 2763         CALL     RFROM
      008F5D CD 86 DB         [ 4] 2764         CALL     BASE
      008F60 CC 85 60         [ 2] 2765         JP     STORE
                                   2766 
                                   2767 ;; Basic I/O
                                   2768 
                                   2769 ;       KEY     ( -- c )
                                   2770 ;       Wait for and return an
                                   2771 ;       input character.
      008F63 8E 8E                 2772         .word      LINK
                           000EE5  2773 LINK = . 
      008F65 03                    2774         .byte      3
      008F66 4B 45 59              2775         .ascii     "KEY"
      008F69                       2776 KEY:
      008F69 72 0B 52 30 FB   [ 2] 2777         btjf UART_SR,#UART_SR_RXNE,. 
      008F6E C6 52 31         [ 1] 2778         ld a,UART_DR 
      008F71 1D 00 02         [ 2] 2779         subw x,#CELLL 
      008F74 E7 01            [ 1] 2780         ld (1,x),a 
      008F76 7F               [ 1] 2781         clr (x)
      008F77 81               [ 4] 2782         ret 
                                   2783 
                                   2784 ;       NUF?    ( -- t )
                                   2785 ;       Return false if no input,
                                   2786 ;       else pause and if CR return true.
      008F78 8F 65                 2787         .word      LINK
                           000EFA  2788 LINK = . 
      008F7A 04                    2789         .byte      4
      008F7B 4E 55 46 3F           2790         .ascii     "NUF?"
      008F7F                       2791 NUFQ:
      008F7F CD 84 9A         [ 4] 2792         CALL     QKEY
      008F82 CD 86 1E         [ 4] 2793         CALL     DUPP
      008F85 CD 85 2C         [ 4] 2794         CALL     QBRAN
      008F88 8F 98                 2795         .word    NUFQ1
      008F8A CD 87 F9         [ 4] 2796         CALL     DDROP
      008F8D CD 8F 69         [ 4] 2797         CALL     KEY
      008F90 CD 84 F9         [ 4] 2798         CALL     DOLIT
      008F93 00 0D                 2799         .word      CRR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



      008F95 CC 88 BA         [ 2] 2800         JP     EQUAL
      008F98 81               [ 4] 2801 NUFQ1:  RET
                                   2802 
                                   2803 ;       SPACE   ( -- )
                                   2804 ;       Send  blank character to
                                   2805 ;       output device.
      008F99 8F 7A                 2806         .word      LINK
                           000F1B  2807 LINK = . 
      008F9B 05                    2808         .byte      5
      008F9C 53 50 41 43 45        2809         .ascii     "SPACE"
      008FA1                       2810 SPACE:
      008FA1 CD 8B 76         [ 4] 2811         CALL     BLANK
      008FA4 CC 84 B8         [ 2] 2812         JP     EMIT
                                   2813 
                                   2814 ;       SPACES  ( +n -- )
                                   2815 ;       Send n spaces to output device.
      008FA7 8F 9B                 2816         .word      LINK
                           000F29  2817 LINK = . 
      008FA9 06                    2818         .byte      6
      008FAA 53 50 41 43 45 53     2819         .ascii     "SPACES"
      008FB0                       2820 SPACS:
      008FB0 CD 8B 83         [ 4] 2821         CALL     ZERO
      008FB3 CD 89 35         [ 4] 2822         CALL     MAX
      008FB6 CD 85 E7         [ 4] 2823         CALL     TOR
      008FB9 20 03            [ 2] 2824         JRA      CHAR2
      008FBB CD 8F A1         [ 4] 2825 CHAR1:  CALL     SPACE
      008FBE CD 85 0D         [ 4] 2826 CHAR2:  CALL     DONXT
      008FC1 8F BB                 2827         .word    CHAR1
      008FC3 81               [ 4] 2828         RET
                                   2829 
                                   2830 ;       TYPE    ( b u -- )
                                   2831 ;       Output u characters from b.
      008FC4 8F A9                 2832         .word      LINK
                           000F46  2833 LINK = . 
      008FC6 04                    2834         .byte      4
      008FC7 54 59 50 45           2835         .ascii     "TYPE"
      008FCB                       2836 TYPES:
      008FCB CD 85 E7         [ 4] 2837         CALL     TOR
      008FCE 20 0C            [ 2] 2838         JRA     TYPE2
      008FD0 CD 86 1E         [ 4] 2839 TYPE1:  CALL     DUPP
      008FD3 CD 85 95         [ 4] 2840         CALL     CAT
      008FD6 CD 84 B8         [ 4] 2841         CALL     EMIT
      008FD9 CD 8B 17         [ 4] 2842         CALL     ONEP
      008FDC CD 85 0D         [ 4] 2843 TYPE2:  CALL     DONXT
      008FDF 8F D0                 2844         .word      TYPE1
      008FE1 CC 86 14         [ 2] 2845         JP     DROP
                                   2846 
                                   2847 ;       CR      ( -- )
                                   2848 ;       Output a carriage return
                                   2849 ;       and a line feed.
      008FE4 8F C6                 2850         .word      LINK
                           000F66  2851 LINK = . 
      008FE6 02                    2852         .byte      2
      008FE7 43 52                 2853         .ascii     "CR"
      008FE9                       2854 CR:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



      008FE9 CD 84 F9         [ 4] 2855         CALL     DOLIT
      008FEC 00 0D                 2856         .word      CRR
      008FEE CD 84 B8         [ 4] 2857         CALL     EMIT
      008FF1 CD 84 F9         [ 4] 2858         CALL     DOLIT
      008FF4 00 0A                 2859         .word      LF
      008FF6 CC 84 B8         [ 2] 2860         JP     EMIT
                                   2861 
                                   2862 ;       do$     ( -- a )
                                   2863 ;       Return  address of a compiled
                                   2864 ;       string.
      008FF9 8F E6                 2865         .word      LINK
                           000F7B  2866 LINK = . 
      008FFB 43                    2867 	.byte      COMPO+3
      008FFC 44 4F 24              2868         .ascii     "DO$"
      008FFF                       2869 DOSTR:
      008FFF CD 85 C8         [ 4] 2870         CALL     RFROM
      009002 CD 85 DB         [ 4] 2871         CALL     RAT
      009005 CD 85 C8         [ 4] 2872         CALL     RFROM
      009008 CD 8C 5A         [ 4] 2873         CALL     COUNT
      00900B CD 88 19         [ 4] 2874         CALL     PLUS
      00900E CD 85 E7         [ 4] 2875         CALL     TOR
      009011 CD 86 2E         [ 4] 2876         CALL     SWAPP
      009014 CD 85 E7         [ 4] 2877         CALL     TOR
      009017 81               [ 4] 2878         RET
                                   2879 
                                   2880 ;       $"|     ( -- a )
                                   2881 ;       Run time routine compiled by $".
                                   2882 ;       Return address of a compiled string.
      009018 8F FB                 2883         .word      LINK
                           000F9A  2884 LINK = . 
      00901A 43                    2885 	.byte      COMPO+3
      00901B 24 22 7C              2886         .byte     '$','"','|'
      00901E                       2887 STRQP:
      00901E CD 8F FF         [ 4] 2888         CALL     DOSTR
      009021 81               [ 4] 2889         RET
                                   2890 
                                   2891 ;       ."|     ( -- )
                                   2892 ;       Run time routine of ." .
                                   2893 ;       Output a compiled string.
      009022 90 1A                 2894         .word      LINK
                           000FA4  2895 LINK = . 
      009024 43                    2896 	.byte      COMPO+3
      009025 2E 22 7C              2897         .byte     '.','"','|'
      009028                       2898 DOTQP:
      009028 CD 8F FF         [ 4] 2899         CALL     DOSTR
      00902B CD 8C 5A         [ 4] 2900         CALL     COUNT
      00902E CC 8F CB         [ 2] 2901         JP     TYPES
                                   2902 
                                   2903 ;       .R      ( n +n -- )
                                   2904 ;       Display an integer in a field
                                   2905 ;       of n columns, right justified.
      009031 90 24                 2906         .word      LINK
                           000FB3  2907 LINK = . 
      009033 02                    2908         .byte      2
      009034 2E 52                 2909         .ascii     ".R"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      009036                       2910 DOTR:
      009036 CD 85 E7         [ 4] 2911         CALL     TOR
      009039 CD 8E 0B         [ 4] 2912         CALL     STR
      00903C CD 85 C8         [ 4] 2913         CALL     RFROM
      00903F CD 86 48         [ 4] 2914         CALL     OVER
      009042 CD 88 92         [ 4] 2915         CALL     SUBB
      009045 CD 8F B0         [ 4] 2916         CALL     SPACS
      009048 CC 8F CB         [ 2] 2917         JP     TYPES
                                   2918 
                                   2919 ;       U.R     ( u +n -- )
                                   2920 ;       Display an unsigned integer
                                   2921 ;       in n column, right justified.
      00904B 90 33                 2922         .word      LINK
                           000FCD  2923 LINK = . 
      00904D 03                    2924         .byte      3
      00904E 55 2E 52              2925         .ascii     "U.R"
      009051                       2926 UDOTR:
      009051 CD 85 E7         [ 4] 2927         CALL     TOR
      009054 CD 8D 8E         [ 4] 2928         CALL     BDIGS
      009057 CD 8D C8         [ 4] 2929         CALL     DIGS
      00905A CD 8D F3         [ 4] 2930         CALL     EDIGS
      00905D CD 85 C8         [ 4] 2931         CALL     RFROM
      009060 CD 86 48         [ 4] 2932         CALL     OVER
      009063 CD 88 92         [ 4] 2933         CALL     SUBB
      009066 CD 8F B0         [ 4] 2934         CALL     SPACS
      009069 CC 8F CB         [ 2] 2935         JP     TYPES
                                   2936 
                                   2937 ;       U.      ( u -- )
                                   2938 ;       Display an unsigned integer
                                   2939 ;       in free format.
      00906C 90 4D                 2940         .word      LINK
                           000FEE  2941 LINK = . 
      00906E 02                    2942         .byte      2
      00906F 55 2E                 2943         .ascii     "U."
      009071                       2944 UDOT:
      009071 CD 8D 8E         [ 4] 2945         CALL     BDIGS
      009074 CD 8D C8         [ 4] 2946         CALL     DIGS
      009077 CD 8D F3         [ 4] 2947         CALL     EDIGS
      00907A CD 8F A1         [ 4] 2948         CALL     SPACE
      00907D CC 8F CB         [ 2] 2949         JP     TYPES
                                   2950 
                                   2951 ;       .       ( w -- )
                                   2952 ;       Display an integer in free
                                   2953 ;       format, preceeded by a space.
      009080 90 6E                 2954         .word      LINK
                           001002  2955 LINK = . 
      009082 01                    2956         .byte      1
      009083 2E                    2957         .ascii     "."
      009084                       2958 DOT:
      009084 CD 86 DB         [ 4] 2959         CALL     BASE
      009087 CD 85 77         [ 4] 2960         CALL     AT
      00908A CD 84 F9         [ 4] 2961         CALL     DOLIT
      00908D 00 0A                 2962         .word      10
      00908F CD 86 93         [ 4] 2963         CALL     XORR    ;?decimal
      009092 CD 85 2C         [ 4] 2964         CALL     QBRAN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      009095 90 9A                 2965         .word      DOT1
      009097 CC 90 71         [ 2] 2966         JP     UDOT
      00909A CD 8E 0B         [ 4] 2967 DOT1:   CALL     STR
      00909D CD 8F A1         [ 4] 2968         CALL     SPACE
      0090A0 CC 8F CB         [ 2] 2969         JP     TYPES
                                   2970 
                                   2971 ;       ?       ( a -- )
                                   2972 ;       Display contents in memory cell.
      0090A3 90 82                 2973         .word      LINK
                                   2974         
                           001025  2975 LINK = . 
      0090A5 01                    2976         .byte      1
      0090A6 3F                    2977         .ascii     "?"
      0090A7                       2978 QUEST:
      0090A7 CD 85 77         [ 4] 2979         CALL     AT
      0090AA CC 90 84         [ 2] 2980         JP     DOT
                                   2981 
                                   2982 ;; Parsing
                                   2983 
                                   2984 ;       parse   ( b u c -- b u delta ; <string> )
                                   2985 ;       Scan string delimited by c.
                                   2986 ;       Return found string and its offset.
      0090AD 90 A5                 2987         .word      LINK
                           00102F  2988 LINK = . 
      0090AF 05                    2989         .byte      5
      0090B0 70 61 72 73 65        2990         .ascii     "parse"
      0090B5                       2991 PARS:
      0090B5 CD 86 EA         [ 4] 2992         CALL     TEMP
      0090B8 CD 85 60         [ 4] 2993         CALL     STORE
      0090BB CD 86 48         [ 4] 2994         CALL     OVER
      0090BE CD 85 E7         [ 4] 2995         CALL     TOR
      0090C1 CD 86 1E         [ 4] 2996         CALL     DUPP
      0090C4 CD 85 2C         [ 4] 2997         CALL     QBRAN
      0090C7 91 6D                 2998         .word    PARS8
      0090C9 CD 8B 24         [ 4] 2999         CALL     ONEM
      0090CC CD 86 EA         [ 4] 3000         CALL     TEMP
      0090CF CD 85 77         [ 4] 3001         CALL     AT
      0090D2 CD 8B 76         [ 4] 3002         CALL     BLANK
      0090D5 CD 88 BA         [ 4] 3003         CALL     EQUAL
      0090D8 CD 85 2C         [ 4] 3004         CALL     QBRAN
      0090DB 91 0E                 3005         .word      PARS3
      0090DD CD 85 E7         [ 4] 3006         CALL     TOR
      0090E0 CD 8B 76         [ 4] 3007 PARS1:  CALL     BLANK
      0090E3 CD 86 48         [ 4] 3008         CALL     OVER
      0090E6 CD 85 95         [ 4] 3009         CALL     CAT     ;skip leading blanks ONLY
      0090E9 CD 88 92         [ 4] 3010         CALL     SUBB
      0090EC CD 86 57         [ 4] 3011         CALL     ZLESS
      0090EF CD 88 33         [ 4] 3012         CALL     INVER
      0090F2 CD 85 2C         [ 4] 3013         CALL     QBRAN
      0090F5 91 0B                 3014         .word      PARS2
      0090F7 CD 8B 17         [ 4] 3015         CALL     ONEP
      0090FA CD 85 0D         [ 4] 3016         CALL     DONXT
      0090FD 90 E0                 3017         .word      PARS1
      0090FF CD 85 C8         [ 4] 3018         CALL     RFROM
      009102 CD 86 14         [ 4] 3019         CALL     DROP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      009105 CD 8B 83         [ 4] 3020         CALL     ZERO
      009108 CC 86 1E         [ 2] 3021         JP     DUPP
      00910B CD 85 C8         [ 4] 3022 PARS2:  CALL     RFROM
      00910E CD 86 48         [ 4] 3023 PARS3:  CALL     OVER
      009111 CD 86 2E         [ 4] 3024         CALL     SWAPP
      009114 CD 85 E7         [ 4] 3025         CALL     TOR
      009117 CD 86 EA         [ 4] 3026 PARS4:  CALL     TEMP
      00911A CD 85 77         [ 4] 3027         CALL     AT
      00911D CD 86 48         [ 4] 3028         CALL     OVER
      009120 CD 85 95         [ 4] 3029         CALL     CAT
      009123 CD 88 92         [ 4] 3030         CALL     SUBB    ;scan for delimiter
      009126 CD 86 EA         [ 4] 3031         CALL     TEMP
      009129 CD 85 77         [ 4] 3032         CALL     AT
      00912C CD 8B 76         [ 4] 3033         CALL     BLANK
      00912F CD 88 BA         [ 4] 3034         CALL     EQUAL
      009132 CD 85 2C         [ 4] 3035         CALL     QBRAN
      009135 91 3A                 3036         .word      PARS5
      009137 CD 86 57         [ 4] 3037         CALL     ZLESS
      00913A CD 85 2C         [ 4] 3038 PARS5:  CALL     QBRAN
      00913D 91 4F                 3039         .word      PARS6
      00913F CD 8B 17         [ 4] 3040         CALL     ONEP
      009142 CD 85 0D         [ 4] 3041         CALL     DONXT
      009145 91 17                 3042         .word      PARS4
      009147 CD 86 1E         [ 4] 3043         CALL     DUPP
      00914A CD 85 E7         [ 4] 3044         CALL     TOR
      00914D 20 0F            [ 2] 3045         JRA     PARS7
      00914F CD 85 C8         [ 4] 3046 PARS6:  CALL     RFROM
      009152 CD 86 14         [ 4] 3047         CALL     DROP
      009155 CD 86 1E         [ 4] 3048         CALL     DUPP
      009158 CD 8B 17         [ 4] 3049         CALL     ONEP
      00915B CD 85 E7         [ 4] 3050         CALL     TOR
      00915E CD 86 48         [ 4] 3051 PARS7:  CALL     OVER
      009161 CD 88 92         [ 4] 3052         CALL     SUBB
      009164 CD 85 C8         [ 4] 3053         CALL     RFROM
      009167 CD 85 C8         [ 4] 3054         CALL     RFROM
      00916A CC 88 92         [ 2] 3055         JP     SUBB
      00916D CD 86 48         [ 4] 3056 PARS8:  CALL     OVER
      009170 CD 85 C8         [ 4] 3057         CALL     RFROM
      009173 CC 88 92         [ 2] 3058         JP     SUBB
                                   3059 
                                   3060 ;       PARSE   ( c -- b u ; <string> )
                                   3061 ;       Scan input stream and return
                                   3062 ;       counted string delimited by c.
      009176 90 AF                 3063         .word      LINK
                           0010F8  3064 LINK = . 
      009178 05                    3065         .byte      5
      009179 50 41 52 53 45        3066         .ascii     "PARSE"
      00917E                       3067 PARSE:
      00917E CD 85 E7         [ 4] 3068         CALL     TOR
      009181 CD 8C 93         [ 4] 3069         CALL     TIB
      009184 CD 86 F9         [ 4] 3070         CALL     INN
      009187 CD 85 77         [ 4] 3071         CALL     AT
      00918A CD 88 19         [ 4] 3072         CALL     PLUS    ;current input buffer pointer
      00918D CD 87 09         [ 4] 3073         CALL     NTIB
      009190 CD 85 77         [ 4] 3074         CALL     AT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



      009193 CD 86 F9         [ 4] 3075         CALL     INN
      009196 CD 85 77         [ 4] 3076         CALL     AT
      009199 CD 88 92         [ 4] 3077         CALL     SUBB    ;remaining count
      00919C CD 85 C8         [ 4] 3078         CALL     RFROM
      00919F CD 90 B5         [ 4] 3079         CALL     PARS
      0091A2 CD 86 F9         [ 4] 3080         CALL     INN
      0091A5 CC 8B F3         [ 2] 3081         JP     PSTOR
                                   3082 
                                   3083 ;       .(      ( -- )
                                   3084 ;       Output following string up to next ) .
      0091A8 91 78                 3085         .word      LINK
                           00112A  3086 LINK = . 
      0091AA 82                    3087 	.byte      IMEDD+2
      0091AB 2E 28                 3088         .ascii     ".("
      0091AD                       3089 DOTPR:
      0091AD CD 84 F9         [ 4] 3090         CALL     DOLIT
      0091B0 00 29                 3091         .word     41	; ")"
      0091B2 CD 91 7E         [ 4] 3092         CALL     PARSE
      0091B5 CC 8F CB         [ 2] 3093         JP     TYPES
                                   3094 
                                   3095 ;       (       ( -- )
                                   3096 ;       Ignore following string up to next ).
                                   3097 ;       A comment.
      0091B8 91 AA                 3098         .word      LINK
                           00113A  3099 LINK = . 
      0091BA 81                    3100 	.byte      IMEDD+1
      0091BB 28                    3101         .ascii     "("
      0091BC                       3102 PAREN:
      0091BC CD 84 F9         [ 4] 3103         CALL     DOLIT
      0091BF 00 29                 3104         .word     41	; ")"
      0091C1 CD 91 7E         [ 4] 3105         CALL     PARSE
      0091C4 CC 87 F9         [ 2] 3106         JP     DDROP
                                   3107 
                                   3108 ;       \       ( -- )
                                   3109 ;       Ignore following text till
                                   3110 ;       end of line.
      0091C7 91 BA                 3111         .word      LINK
                           001149  3112 LINK = . 
      0091C9 81                    3113 	.byte      IMEDD+1
      0091CA 5C                    3114         .ascii     "\"
      0091CB                       3115 BKSLA:
      0091CB 90 AE 00 10      [ 2] 3116         ldw y,#UCTIB ; #TIB  
      0091CF 90 FE            [ 2] 3117         ldw y,(y)
      0091D1 90 89            [ 2] 3118         pushw y ; count in TIB 
      0091D3 90 AE 00 0E      [ 2] 3119         ldw y,#UINN ; >IN 
      0091D7 90 BF 28         [ 2] 3120         ldw YTEMP,y
      0091DA 90 85            [ 2] 3121         popw y 
      0091DC 91 CF 28         [ 5] 3122         ldw [YTEMP],y
      0091DF 81               [ 4] 3123         ret 
                                   3124 
                                   3125 ;       WORD    ( c -- a ; <string> )
                                   3126 ;       Parse a word from input stream
                                   3127 ;       and copy it to code dictionary.
      0091E0 91 C9                 3128         .word      LINK
                           001162  3129 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      0091E2 04                    3130         .byte      4
      0091E3 57 4F 52 44           3131         .ascii     "WORD"
      0091E7                       3132 WORDD:
      0091E7 CD 91 7E         [ 4] 3133         CALL     PARSE
      0091EA CD 8C 71         [ 4] 3134         CALL     HERE
      0091ED CD 8A EC         [ 4] 3135         CALL     CELLP
                           000000  3136 .IF CASE_SENSE 
                                   3137         JP      PACKS 
                           000001  3138 .ELSE                 
      0091F0 CD 8D 31         [ 4] 3139         CALL     PACKS
                                   3140 ; uppercase TOKEN 
      0091F3 CD 86 1E         [ 4] 3141         CALL    DUPP 
      0091F6 CD 8C 5A         [ 4] 3142         CALL    COUNT 
      0091F9 CD 85 E7         [ 4] 3143         CALL    TOR 
      0091FC CD 85 43         [ 4] 3144         CALL    BRAN 
      0091FF 92 2D                 3145         .word   UPPER2  
      009201                       3146 UPPER:
      009201 CD 86 1E         [ 4] 3147         CALL    DUPP 
      009204 CD 85 95         [ 4] 3148         CALL    CAT
      009207 CD 86 1E         [ 4] 3149         CALL    DUPP 
      00920A CD 84 F9         [ 4] 3150         CALL   DOLIT
      00920D 00 61                 3151         .word   'a' 
      00920F CD 84 F9         [ 4] 3152         CALL    DOLIT
      009212 00 7B                 3153         .word   'z'+1 
      009214 CD 89 72         [ 4] 3154         CALL   WITHI 
      009217 CD 85 2C         [ 4] 3155         CALL   QBRAN
      00921A 92 24                 3156         .word  UPPER1  
      00921C CD 84 F9         [ 4] 3157         CALL    DOLIT 
      00921F 00 DF                 3158         .word   0xDF 
      009221 CD 86 6A         [ 4] 3159         CALL    ANDD 
      009224                       3160 UPPER1:
      009224 CD 86 48         [ 4] 3161         CALL    OVER 
      009227 CD 85 84         [ 4] 3162         CALL    CSTOR          
      00922A CD 8B 17         [ 4] 3163         CALL    ONEP 
      00922D                       3164 UPPER2: 
      00922D CD 85 0D         [ 4] 3165         CALL    DONXT
      009230 92 01                 3166         .word   UPPER  
      009232 CD 86 14         [ 4] 3167         CALL    DROP  
      009235 81               [ 4] 3168         RET 
                                   3169 .ENDIF 
                                   3170 
                                   3171 ;       TOKEN   ( -- a ; <string> )
                                   3172 ;       Parse a word from input stream
                                   3173 ;       and copy it to name dictionary.
      009236 91 E2                 3174         .word      LINK
                           0011B8  3175 LINK = . 
      009238 05                    3176         .byte      5
      009239 54 4F 4B 45 4E        3177         .ascii     "TOKEN"
      00923E                       3178 TOKEN:
      00923E CD 8B 76         [ 4] 3179         CALL     BLANK
      009241 CC 91 E7         [ 2] 3180         JP     WORDD
                                   3181 
                                   3182 ;; Dictionary search
                                   3183 
                                   3184 ;       NAME>   ( na -- ca )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



                                   3185 ;       Return a code address given
                                   3186 ;       a name address.
      009244 92 38                 3187         .word      LINK
                           0011C6  3188 LINK = . 
      009246 05                    3189         .byte      5
      009247 4E 41 4D 45 3E        3190         .ascii     "NAME>"
      00924C                       3191 NAMET:
      00924C CD 8C 5A         [ 4] 3192         CALL     COUNT
      00924F CD 84 F9         [ 4] 3193         CALL     DOLIT
      009252 00 1F                 3194         .word      31
      009254 CD 86 6A         [ 4] 3195         CALL     ANDD
      009257 CC 88 19         [ 2] 3196         JP     PLUS
                                   3197 
                                   3198 ;       SAME?   ( a a u -- a a f \ -0+ )
                                   3199 ;       Compare u cells in two
                                   3200 ;       strings. Return 0 if identical.
      00925A 92 46                 3201         .word      LINK
                           0011DC  3202 LINK = . 
      00925C 05                    3203         .byte       5
      00925D 53 41 4D 45 3F        3204         .ascii     "SAME?"
      009262                       3205 SAMEQ:
      009262 CD 8B 24         [ 4] 3206         CALL     ONEM
      009265 CD 85 E7         [ 4] 3207         CALL     TOR
      009268 20 29            [ 2] 3208         JRA     SAME2
      00926A CD 86 48         [ 4] 3209 SAME1:  CALL     OVER
      00926D CD 85 DB         [ 4] 3210         CALL     RAT
      009270 CD 88 19         [ 4] 3211         CALL     PLUS
      009273 CD 85 95         [ 4] 3212         CALL     CAT
      009276 CD 86 48         [ 4] 3213         CALL     OVER
      009279 CD 85 DB         [ 4] 3214         CALL     RAT
      00927C CD 88 19         [ 4] 3215         CALL     PLUS
      00927F CD 85 95         [ 4] 3216         CALL     CAT
      009282 CD 88 92         [ 4] 3217         CALL     SUBB
      009285 CD 87 C8         [ 4] 3218         CALL     QDUP
      009288 CD 85 2C         [ 4] 3219         CALL     QBRAN
      00928B 92 93                 3220         .word      SAME2
      00928D CD 85 C8         [ 4] 3221         CALL     RFROM
      009290 CC 86 14         [ 2] 3222         JP     DROP
      009293 CD 85 0D         [ 4] 3223 SAME2:  CALL     DONXT
      009296 92 6A                 3224         .word      SAME1
      009298 CC 8B 83         [ 2] 3225         JP     ZERO
                                   3226 
                                   3227 ;       find    ( a va -- ca na | a F )
                                   3228 ;       Search vocabulary for string.
                                   3229 ;       Return ca and na if succeeded.
      00929B 92 5C                 3230         .word      LINK
                           00121D  3231 LINK = . 
      00929D 04                    3232         .byte      4
      00929E 46 49 4E 44           3233         .ascii     "FIND"
      0092A2                       3234 FIND:
      0092A2 CD 86 2E         [ 4] 3235         CALL     SWAPP
      0092A5 CD 86 1E         [ 4] 3236         CALL     DUPP
      0092A8 CD 85 95         [ 4] 3237         CALL     CAT
      0092AB CD 86 EA         [ 4] 3238         CALL     TEMP
      0092AE CD 85 60         [ 4] 3239         CALL     STORE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      0092B1 CD 86 1E         [ 4] 3240         CALL     DUPP
      0092B4 CD 85 77         [ 4] 3241         CALL     AT
      0092B7 CD 85 E7         [ 4] 3242         CALL     TOR
      0092BA CD 8A EC         [ 4] 3243         CALL     CELLP
      0092BD CD 86 2E         [ 4] 3244         CALL     SWAPP
      0092C0 CD 85 77         [ 4] 3245 FIND1:  CALL     AT
      0092C3 CD 86 1E         [ 4] 3246         CALL     DUPP
      0092C6 CD 85 2C         [ 4] 3247         CALL     QBRAN
      0092C9 92 FF                 3248         .word      FIND6
      0092CB CD 86 1E         [ 4] 3249         CALL     DUPP
      0092CE CD 85 77         [ 4] 3250         CALL     AT
      0092D1 CD 84 F9         [ 4] 3251         CALL     DOLIT
      0092D4 1F 7F                 3252         .word      MASKK
      0092D6 CD 86 6A         [ 4] 3253         CALL     ANDD
      0092D9 CD 85 DB         [ 4] 3254         CALL     RAT
      0092DC CD 86 93         [ 4] 3255         CALL     XORR
      0092DF CD 85 2C         [ 4] 3256         CALL     QBRAN
      0092E2 92 EE                 3257         .word      FIND2
      0092E4 CD 8A EC         [ 4] 3258         CALL     CELLP
      0092E7 CD 84 F9         [ 4] 3259         CALL     DOLIT
      0092EA FF FF                 3260         .word     0xFFFF
      0092EC 20 0C            [ 2] 3261         JRA     FIND3
      0092EE CD 8A EC         [ 4] 3262 FIND2:  CALL     CELLP
      0092F1 CD 86 EA         [ 4] 3263         CALL     TEMP
      0092F4 CD 85 77         [ 4] 3264         CALL     AT
      0092F7 CD 92 62         [ 4] 3265         CALL     SAMEQ
      0092FA CD 85 43         [ 4] 3266 FIND3:  CALL     BRAN
      0092FD 93 0E                 3267         .word      FIND4
      0092FF CD 85 C8         [ 4] 3268 FIND6:  CALL     RFROM
      009302 CD 86 14         [ 4] 3269         CALL     DROP
      009305 CD 86 2E         [ 4] 3270         CALL     SWAPP
      009308 CD 8A FB         [ 4] 3271         CALL     CELLM
      00930B CC 86 2E         [ 2] 3272         JP     SWAPP
      00930E CD 85 2C         [ 4] 3273 FIND4:  CALL     QBRAN
      009311 93 1B                 3274         .word      FIND5
      009313 CD 8A FB         [ 4] 3275         CALL     CELLM
      009316 CD 8A FB         [ 4] 3276         CALL     CELLM
      009319 20 A5            [ 2] 3277         JRA     FIND1
      00931B CD 85 C8         [ 4] 3278 FIND5:  CALL     RFROM
      00931E CD 86 14         [ 4] 3279         CALL     DROP
      009321 CD 86 2E         [ 4] 3280         CALL     SWAPP
      009324 CD 86 14         [ 4] 3281         CALL     DROP
      009327 CD 8A FB         [ 4] 3282         CALL     CELLM
      00932A CD 86 1E         [ 4] 3283         CALL     DUPP
      00932D CD 92 4C         [ 4] 3284         CALL     NAMET
      009330 CC 86 2E         [ 2] 3285         JP     SWAPP
                                   3286 
                                   3287 ;       NAME?   ( a -- ca na | a F )
                                   3288 ;       Search vocabularies for a string.
      009333 92 9D                 3289         .word      LINK
                           0012B5  3290 LINK = . 
      009335 05                    3291         .byte      5
      009336 4E 41 4D 45 3F        3292         .ascii     "NAME?"
      00933B                       3293 NAMEQ:
      00933B CD 87 5E         [ 4] 3294         CALL   CNTXT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      00933E CC 92 A2         [ 2] 3295         JP     FIND
                                   3296 
                                   3297 ;; Terminal response
                                   3298 
                                   3299 ;       ^H      ( bot eot cur -- bot eot cur )
                                   3300 ;       Backup cursor by one character.
      009341 93 35                 3301         .word      LINK
                           0012C3  3302 LINK = . 
      009343 02                    3303         .byte      2
      009344 5E 48                 3304         .ascii     "^H"
      009346                       3305 BKSP:
      009346 CD 85 E7         [ 4] 3306         CALL     TOR
      009349 CD 86 48         [ 4] 3307         CALL     OVER
      00934C CD 85 C8         [ 4] 3308         CALL     RFROM
      00934F CD 86 2E         [ 4] 3309         CALL     SWAPP
      009352 CD 86 48         [ 4] 3310         CALL     OVER
      009355 CD 86 93         [ 4] 3311         CALL     XORR
      009358 CD 85 2C         [ 4] 3312         CALL     QBRAN
      00935B 93 76                 3313         .word      BACK1
      00935D CD 84 F9         [ 4] 3314         CALL     DOLIT
      009360 00 08                 3315         .word      BKSPP
      009362 CD 84 B8         [ 4] 3316         CALL     EMIT
      009365 CD 8B 24         [ 4] 3317         CALL     ONEM
      009368 CD 8B 76         [ 4] 3318         CALL     BLANK
      00936B CD 84 B8         [ 4] 3319         CALL     EMIT
      00936E CD 84 F9         [ 4] 3320         CALL     DOLIT
      009371 00 08                 3321         .word      BKSPP
      009373 CC 84 B8         [ 2] 3322         JP     EMIT
      009376 81               [ 4] 3323 BACK1:  RET
                                   3324 
                                   3325 ;       TAP    ( bot eot cur c -- bot eot cur )
                                   3326 ;       Accept and echo key stroke
                                   3327 ;       and bump cursor.
      009377 93 43                 3328         .word      LINK
                           0012F9  3329 LINK = . 
      009379 03                    3330         .byte      3
      00937A 54 41 50              3331         .ascii     "TAP"
      00937D                       3332 TAP:
      00937D CD 86 1E         [ 4] 3333         CALL     DUPP
      009380 CD 84 B8         [ 4] 3334         CALL     EMIT
      009383 CD 86 48         [ 4] 3335         CALL     OVER
      009386 CD 85 84         [ 4] 3336         CALL     CSTOR
      009389 CC 8B 17         [ 2] 3337         JP     ONEP
                                   3338 
                                   3339 ;       kTAP    ( bot eot cur c -- bot eot cur )
                                   3340 ;       Process a key stroke,
                                   3341 ;       CR,LF or backspace.
      00938C 93 79                 3342         .word      LINK
                           00130E  3343 LINK = . 
      00938E 04                    3344         .byte      4
      00938F 4B 54 41 50           3345         .ascii     "KTAP"
      009393                       3346 KTAP:
      009393 CD 86 1E         [ 4] 3347         CALL     DUPP
      009396 CD 84 F9         [ 4] 3348         CALL     DOLIT
                           000001  3349 .if EOL_CR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      009399 00 0D                 3350         .word   CRR
                           000000  3351 .else ; EOL_LF 
                                   3352         .word   LF
                                   3353 .endif 
      00939B CD 86 93         [ 4] 3354         CALL     XORR
      00939E CD 85 2C         [ 4] 3355         CALL     QBRAN
      0093A1 93 B9                 3356         .word      KTAP2
      0093A3 CD 84 F9         [ 4] 3357         CALL     DOLIT
      0093A6 00 08                 3358         .word      BKSPP
      0093A8 CD 86 93         [ 4] 3359         CALL     XORR
      0093AB CD 85 2C         [ 4] 3360         CALL     QBRAN
      0093AE 93 B6                 3361         .word      KTAP1
      0093B0 CD 8B 76         [ 4] 3362         CALL     BLANK
      0093B3 CC 93 7D         [ 2] 3363         JP     TAP
      0093B6 CC 93 46         [ 2] 3364 KTAP1:  JP     BKSP
      0093B9 CD 86 14         [ 4] 3365 KTAP2:  CALL     DROP
      0093BC CD 86 2E         [ 4] 3366         CALL     SWAPP
      0093BF CD 86 14         [ 4] 3367         CALL     DROP
      0093C2 CC 86 1E         [ 2] 3368         JP     DUPP
                                   3369 
                                   3370 ;       accept  ( b u -- b u )
                                   3371 ;       Accept characters to input
                                   3372 ;       buffer. Return with actual count.
      0093C5 93 8E                 3373         .word      LINK
                           001347  3374 LINK = . 
      0093C7 06                    3375         .byte      6
      0093C8 41 43 43 45 50 54     3376         .ascii     "ACCEPT"
      0093CE                       3377 ACCEP:
      0093CE CD 86 48         [ 4] 3378         CALL     OVER
      0093D1 CD 88 19         [ 4] 3379         CALL     PLUS
      0093D4 CD 86 48         [ 4] 3380         CALL     OVER
      0093D7 CD 88 04         [ 4] 3381 ACCP1:  CALL     DDUP
      0093DA CD 86 93         [ 4] 3382         CALL     XORR
      0093DD CD 85 2C         [ 4] 3383         CALL     QBRAN
      0093E0 94 02                 3384         .word      ACCP4
      0093E2 CD 8F 69         [ 4] 3385         CALL     KEY
      0093E5 CD 86 1E         [ 4] 3386         CALL     DUPP
      0093E8 CD 8B 76         [ 4] 3387         CALL     BLANK
      0093EB CD 84 F9         [ 4] 3388         CALL     DOLIT
      0093EE 00 7F                 3389         .word      127
      0093F0 CD 89 72         [ 4] 3390         CALL     WITHI
      0093F3 CD 85 2C         [ 4] 3391         CALL     QBRAN
      0093F6 93 FD                 3392         .word      ACCP2
      0093F8 CD 93 7D         [ 4] 3393         CALL     TAP
      0093FB 20 03            [ 2] 3394         JRA     ACCP3
      0093FD CD 93 93         [ 4] 3395 ACCP2:  CALL     KTAP
      009400 20 D5            [ 2] 3396 ACCP3:  JRA     ACCP1
      009402 CD 86 14         [ 4] 3397 ACCP4:  CALL     DROP
      009405 CD 86 48         [ 4] 3398         CALL     OVER
      009408 CC 88 92         [ 2] 3399         JP     SUBB
                                   3400 
                                   3401 ;       QUERY   ( -- )
                                   3402 ;       Accept input stream to
                                   3403 ;       terminal input buffer.
      00940B 93 C7                 3404         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



                                   3405         
                           00138D  3406 LINK = . 
      00940D 05                    3407         .byte      5
      00940E 51 55 45 52 59        3408         .ascii     "QUERY"
      009413                       3409 QUERY:
      009413 CD 8C 93         [ 4] 3410         CALL     TIB
      009416 CD 84 F9         [ 4] 3411         CALL     DOLIT
      009419 00 50                 3412         .word      80
      00941B CD 93 CE         [ 4] 3413         CALL     ACCEP
      00941E CD 87 09         [ 4] 3414         CALL     NTIB
      009421 CD 85 60         [ 4] 3415         CALL     STORE
      009424 CD 86 14         [ 4] 3416         CALL     DROP
      009427 CD 8B 83         [ 4] 3417         CALL     ZERO
      00942A CD 86 F9         [ 4] 3418         CALL     INN
      00942D CC 85 60         [ 2] 3419         JP     STORE
                                   3420 
                                   3421 ;       ABORT   ( -- )
                                   3422 ;       Reset data stack and
                                   3423 ;       jump to QUIT.
      009430 94 0D                 3424         .word      LINK
                           0013B2  3425 LINK = . 
      009432 05                    3426         .byte      5
      009433 41 42 4F 52 54        3427         .ascii     "ABORT"
      009438                       3428 ABORT:
      009438 CD 95 2F         [ 4] 3429         CALL     PRESE
      00943B CC 95 4C         [ 2] 3430         JP     QUIT
                                   3431 
                                   3432 ;       abort"  ( f -- )
                                   3433 ;       Run time routine of ABORT".
                                   3434 ;       Abort with a message.
      00943E 94 32                 3435         .word      LINK
                           0013C0  3436 LINK = . 
      009440 46                    3437 	.byte      COMPO+6
      009441 41 42 4F 52 54        3438         .ascii     "ABORT"
      009446 22                    3439         .byte      '"'
      009447                       3440 ABORQ:
      009447 CD 85 2C         [ 4] 3441         CALL     QBRAN
      00944A 94 66                 3442         .word      ABOR2   ;text flag
      00944C CD 8F FF         [ 4] 3443         CALL     DOSTR
      00944F CD 8F A1         [ 4] 3444 ABOR1:  CALL     SPACE
      009452 CD 8C 5A         [ 4] 3445         CALL     COUNT
      009455 CD 8F CB         [ 4] 3446         CALL     TYPES
      009458 CD 84 F9         [ 4] 3447         CALL     DOLIT
      00945B 00 3F                 3448         .word     63 ; "?"
      00945D CD 84 B8         [ 4] 3449         CALL     EMIT
      009460 CD 8F E9         [ 4] 3450         CALL     CR
      009463 CC 94 38         [ 2] 3451         JP     ABORT   ;pass error string
      009466 CD 8F FF         [ 4] 3452 ABOR2:  CALL     DOSTR
      009469 CC 86 14         [ 2] 3453         JP     DROP
                                   3454 
                                   3455 ;; The text interpreter
                                   3456 
                                   3457 ;       $INTERPRET      ( a -- )
                                   3458 ;       Interpret a word. If failed,
                                   3459 ;       try to convert it to an integer.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      00946C 94 40                 3460         .word      LINK
                           0013EE  3461 LINK = . 
      00946E 0A                    3462         .byte      10
      00946F 24 49 4E 54 45 52 50  3463         .ascii     "$INTERPRET"
             52 45 54
      009479                       3464 INTER:
      009479 CD 93 3B         [ 4] 3465         CALL     NAMEQ
      00947C CD 87 C8         [ 4] 3466         CALL     QDUP    ;?defined
      00947F CD 85 2C         [ 4] 3467         CALL     QBRAN
      009482 94 A3                 3468         .word      INTE1
      009484 CD 85 77         [ 4] 3469         CALL     AT
      009487 CD 84 F9         [ 4] 3470         CALL     DOLIT
      00948A 40 00                 3471 	.word       0x4000	; COMPO*256
      00948C CD 86 6A         [ 4] 3472         CALL     ANDD    ;?compile only lexicon bits
      00948F CD 94 47         [ 4] 3473         CALL     ABORQ
      009492 0D                    3474         .byte      13
      009493 20 63 6F 6D 70 69 6C  3475         .ascii     " compile only"
             65 20 6F 6E 6C 79
      0094A0 CC 85 53         [ 2] 3476         JP     EXECU
      0094A3 CD 8E 96         [ 4] 3477 INTE1:  CALL     NUMBQ   ;convert a number
      0094A6 CD 85 2C         [ 4] 3478         CALL     QBRAN
      0094A9 94 4F                 3479         .word    ABOR1
      0094AB 81               [ 4] 3480         RET
                                   3481 
                                   3482 ;       [       ( -- )
                                   3483 ;       Start  text interpreter.
      0094AC 94 6E                 3484         .word      LINK
                           00142E  3485 LINK = . 
      0094AE 81                    3486 	.byte      IMEDD+1
      0094AF 5B                    3487         .ascii     "["
      0094B0                       3488 LBRAC:
      0094B0 CD 84 F9         [ 4] 3489         CALL   DOLIT
      0094B3 94 79                 3490         .word  INTER
      0094B5 CD 87 3C         [ 4] 3491         CALL   TEVAL
      0094B8 CC 85 60         [ 2] 3492         JP     STORE
                                   3493 
                                   3494 ;       .OK     ( -- )
                                   3495 ;       Display 'ok' while interpreting.
      0094BB 94 AE                 3496         .word      LINK
                           00143D  3497 LINK = . 
      0094BD 03                    3498         .byte      3
      0094BE 2E 4F 4B              3499         .ascii     ".OK"
      0094C1                       3500 DOTOK:
      0094C1 CD 84 F9         [ 4] 3501         CALL     DOLIT
      0094C4 94 79                 3502         .word      INTER
      0094C6 CD 87 3C         [ 4] 3503         CALL     TEVAL
      0094C9 CD 85 77         [ 4] 3504         CALL     AT
      0094CC CD 88 BA         [ 4] 3505         CALL     EQUAL
      0094CF CD 85 2C         [ 4] 3506         CALL     QBRAN
      0094D2 94 DB                 3507         .word      DOTO1
      0094D4 CD 90 28         [ 4] 3508         CALL     DOTQP
      0094D7 03                    3509         .byte      3
      0094D8 20 6F 6B              3510         .ascii     " ok"
      0094DB CC 8F E9         [ 2] 3511 DOTO1:  JP     CR
                                   3512 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



                                   3513 ;       ?STACK  ( -- )
                                   3514 ;       Abort if stack underflows.
      0094DE 94 BD                 3515         .word      LINK
                           001460  3516 LINK = . 
      0094E0 06                    3517         .byte      6
      0094E1 3F 53 54 41 43 4B     3518         .ascii     "?STACK"
      0094E7                       3519 QSTAC: 
      0094E7 CD 8B C5         [ 4] 3520         CALL     DEPTH
      0094EA CD 86 57         [ 4] 3521         CALL     ZLESS   ;check only for underflow
      0094ED CD 94 47         [ 4] 3522         CALL     ABORQ
      0094F0 0B                    3523         .byte      11
      0094F1 20 75 6E 64 65 72 66  3524         .ascii     " underflow "
             6C 6F 77 20
      0094FC 81               [ 4] 3525         RET
                                   3526 
                                   3527 ;       EVAL    ( -- )
                                   3528 ;       Interpret  input stream.
      0094FD 94 E0                 3529         .word      LINK
                           00147F  3530 LINK = . 
      0094FF 04                    3531         .byte      4
      009500 45 56 41 4C           3532         .ascii     "EVAL"
      009504                       3533 EVAL:
      009504 CD 92 3E         [ 4] 3534 EVAL1:  CALL     TOKEN
      009507 CD 86 1E         [ 4] 3535         CALL     DUPP
      00950A CD 85 95         [ 4] 3536         CALL     CAT     ;?input stream empty
      00950D CD 85 2C         [ 4] 3537         CALL     QBRAN
      009510 95 20                 3538         .word    EVAL2
      009512 CD 87 3C         [ 4] 3539         CALL     TEVAL
      009515 CD 8C A7         [ 4] 3540         CALL     ATEXE
      009518 CD 94 E7         [ 4] 3541         CALL     QSTAC   ;evaluate input, check stack
      00951B CD 85 43         [ 4] 3542         CALL     BRAN
      00951E 95 04                 3543         .word    EVAL1
      009520 CD 86 14         [ 4] 3544 EVAL2:  CALL     DROP
      009523 CC 94 C1         [ 2] 3545         JP       DOTOK
                                   3546 
                                   3547 ;       PRESET  ( -- )
                                   3548 ;       Reset data stack pointer and
                                   3549 ;       terminal input buffer.
      009526 94 FF                 3550         .word      LINK
                           0014A8  3551 LINK = . 
      009528 06                    3552         .byte      6
      009529 50 52 45 53 45 54     3553         .ascii     "PRESET"
      00952F                       3554 PRESE:
      00952F CD 84 F9         [ 4] 3555         CALL     DOLIT
      009532 16 80                 3556         .word      SPP
      009534 CD 86 0B         [ 4] 3557         CALL     SPSTO
      009537 CD 84 F9         [ 4] 3558         CALL     DOLIT
      00953A 17 00                 3559         .word      TIBB
      00953C CD 87 09         [ 4] 3560         CALL     NTIB
      00953F CD 8A EC         [ 4] 3561         CALL     CELLP
      009542 CC 85 60         [ 2] 3562         JP     STORE
                                   3563 
                                   3564 ;       QUIT    ( -- )
                                   3565 ;       Reset return stack pointer
                                   3566 ;       and start text interpreter.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      009545 95 28                 3567         .word      LINK
                           0014C7  3568 LINK = . 
      009547 04                    3569         .byte      4
      009548 51 55 49 54           3570         .ascii     "QUIT"
      00954C                       3571 QUIT:
      00954C CD 84 F9         [ 4] 3572         CALL     DOLIT
      00954F 17 FF                 3573         .word      RPP
      009551 CD 85 B2         [ 4] 3574         CALL     RPSTO   ;reset return stack pointer
      009554 CD 94 B0         [ 4] 3575 QUIT1:  CALL     LBRAC   ;start interpretation
      009557 CD 94 13         [ 4] 3576 QUIT2:  CALL     QUERY   ;get input
      00955A CD 95 04         [ 4] 3577         CALL     EVAL
      00955D 20 F8            [ 2] 3578         JRA     QUIT2   ;continue till error
                                   3579 
                                   3580 ;; The compiler
                                   3581 
                                   3582 ;       '       ( -- ca )
                                   3583 ;       Search vocabularies for
                                   3584 ;       next word in input stream.
      00955F 95 47                 3585         .word      LINK
                           0014E1  3586 LINK = . 
      009561 01                    3587         .byte      1
      009562 27                    3588         .ascii     "'"
      009563                       3589 TICK:
      009563 CD 92 3E         [ 4] 3590         CALL     TOKEN
      009566 CD 93 3B         [ 4] 3591         CALL     NAMEQ   ;?defined
      009569 CD 85 2C         [ 4] 3592         CALL     QBRAN
      00956C 94 4F                 3593         .word      ABOR1
      00956E 81               [ 4] 3594         RET     ;yes, push code address
                                   3595 
                                   3596 ;       ALLOT   ( n -- )
                                   3597 ;       Allocate n bytes to RAM 
      00956F 95 61                 3598         .word      LINK
                           0014F1  3599         LINK = . 
      009571 05                    3600         .byte      5
      009572 41 4C 4C 4F 54        3601         .ascii     "ALLOT"
      009577                       3602 ALLOT:
      009577 CD 87 6C         [ 4] 3603         CALL     VPP
                                   3604 ; must update APP_VP each time VP is modidied
      00957A CD 8B F3         [ 4] 3605         call PSTOR 
      00957D CC 9C C3         [ 2] 3606         jp UPDATVP 
                                   3607 
                                   3608 ;       ,       ( w -- )
                                   3609 ;         Compile an integer into
                                   3610 ;         variable space.
      009580 95 71                 3611         .word      LINK
                           001502  3612 LINK = . 
      009582 01                    3613         .byte      1
      009583 2C                    3614         .ascii     ","
      009584                       3615 COMMA:
      009584 CD 8C 71         [ 4] 3616         CALL     HERE
      009587 CD 86 1E         [ 4] 3617         CALL     DUPP
      00958A CD 8A EC         [ 4] 3618         CALL     CELLP   ;cell boundary
      00958D CD 87 6C         [ 4] 3619         CALL     VPP
      009590 CD 85 60         [ 4] 3620         CALL     STORE
      009593 CC 85 60         [ 2] 3621         JP     STORE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



                                   3622 
                                   3623 ;       C,      ( c -- )
                                   3624 ;       Compile a byte into
                                   3625 ;       variables space.
      009596 95 82                 3626        .word      LINK
                           001518  3627 LINK = . 
      009598 02                    3628         .byte      2
      009599 43 2C                 3629         .ascii     "C,"
      00959B                       3630 CCOMMA:
      00959B CD 8C 71         [ 4] 3631         CALL     HERE
      00959E CD 86 1E         [ 4] 3632         CALL     DUPP
      0095A1 CD 8B 17         [ 4] 3633         CALL     ONEP
      0095A4 CD 87 6C         [ 4] 3634         CALL     VPP
      0095A7 CD 85 60         [ 4] 3635         CALL     STORE
      0095AA CC 85 84         [ 2] 3636         JP     CSTOR
                                   3637 
                                   3638 ;       [COMPILE]       ( -- ; <string> )
                                   3639 ;       Compile next immediate
                                   3640 ;       word into code dictionary.
      0095AD 95 98                 3641         .word      LINK
                           00152F  3642 LINK = . 
      0095AF 89                    3643 	.byte      IMEDD+9
      0095B0 5B 43 4F 4D 50 49 4C  3644         .ascii     "[COMPILE]"
             45 5D
      0095B9                       3645 BCOMP:
      0095B9 CD 95 63         [ 4] 3646         CALL     TICK
      0095BC CC 98 7F         [ 2] 3647         JP     JSRC
                                   3648 
                                   3649 ;       COMPILE ( -- )
                                   3650 ;       Compile next jsr in
                                   3651 ;       colon list to code dictionary.
      0095BF 95 AF                 3652         .word      LINK
                           001541  3653 LINK = . 
      0095C1 47                    3654 	.byte      COMPO+7
      0095C2 43 4F 4D 50 49 4C 45  3655         .ascii     "COMPILE"
      0095C9                       3656 COMPI:
      0095C9 CD 85 C8         [ 4] 3657         CALL     RFROM
      0095CC CD 86 1E         [ 4] 3658         CALL     DUPP
      0095CF CD 85 77         [ 4] 3659         CALL     AT
      0095D2 CD 98 7F         [ 4] 3660         CALL     JSRC    ;compile subroutine
      0095D5 CD 8A EC         [ 4] 3661         CALL     CELLP
      0095D8 90 93            [ 1] 3662         ldw y,x 
      0095DA 90 FE            [ 2] 3663         ldw y,(y)
      0095DC 1C 00 02         [ 2] 3664         addw x,#CELLL 
      0095DF 90 FC            [ 2] 3665         jp (y)
                                   3666 
                                   3667 ;       LITERAL ( w -- )
                                   3668 ;       Compile tos to dictionary
                                   3669 ;       as an integer literal.
      0095E1 95 C1                 3670         .word      LINK
                           001563  3671 LINK = . 
      0095E3 87                    3672 	.byte      IMEDD+7
      0095E4 4C 49 54 45 52 41 4C  3673         .ascii     "LITERAL"
      0095EB                       3674 LITER:
      0095EB CD 95 C9         [ 4] 3675         CALL     COMPI
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      0095EE 84 F9                 3676         .word DOLIT 
      0095F0 CC 95 84         [ 2] 3677         JP     COMMA
                                   3678 
                                   3679 ;       $,"     ( -- )
                                   3680 ;       Compile a literal string
                                   3681 ;       up to next " .
      0095F3 95 E3                 3682         .word      LINK
                           001575  3683 LINK = . 
      0095F5 03                    3684         .byte      3
      0095F6 24 2C 22              3685         .byte     '$',',','"'
      0095F9                       3686 STRCQ:
      0095F9 CD 84 F9         [ 4] 3687         CALL     DOLIT
      0095FC 00 22                 3688         .word     34	; "
      0095FE CD 91 7E         [ 4] 3689         CALL     PARSE
      009601 CD 8C 71         [ 4] 3690         CALL     HERE
      009604 CD 8D 31         [ 4] 3691         CALL     PACKS   ;string to code dictionary
      009607 CD 8C 5A         [ 4] 3692         CALL     COUNT
      00960A CD 88 19         [ 4] 3693         CALL     PLUS    ;calculate aligned end of string
      00960D CD 87 6C         [ 4] 3694         CALL     VPP
      009610 CC 85 60         [ 2] 3695         JP     STORE
                                   3696 
                                   3697 ;; Structures
                                   3698 
                                   3699 ;       FOR     ( -- a )
                                   3700 ;       Start a FOR-NEXT loop
                                   3701 ;       structure in a colon definition.
      009613 95 F5                 3702         .word      LINK
                           001595  3703 LINK = . 
      009615 83                    3704 	.byte      IMEDD+3
      009616 46 4F 52              3705         .ascii     "FOR"
      009619                       3706 FOR:
      009619 CD 95 C9         [ 4] 3707         CALL     COMPI
      00961C 85 E7                 3708         .word TOR 
      00961E CC 8C 71         [ 2] 3709         JP     HERE
                                   3710 
                                   3711 ;       NEXT    ( a -- )
                                   3712 ;       Terminate a FOR-NEXT loop.
      009621 96 15                 3713         .word      LINK
                           0015A3  3714 LINK = . 
      009623 84                    3715 	.byte      IMEDD+4
      009624 4E 45 58 54           3716         .ascii     "NEXT"
      009628                       3717 NEXT:
      009628 CD 95 C9         [ 4] 3718         CALL     COMPI
      00962B 85 0D                 3719         .word DONXT 
      00962D CD 87 B8         [ 4] 3720         call ADRADJ
      009630 CC 95 84         [ 2] 3721         JP     COMMA
                                   3722 
                                   3723 ;       I ( -- n )
                                   3724 ;       stack FOR-NEXT COUNTER 
      009633 96 23                 3725         .word LINK 
                           0015B5  3726         LINK=.
      009635 01                    3727         .byte 1 
      009636 49                    3728         .ascii "I"
      009637                       3729 IFETCH: 
      009637 1D 00 02         [ 2] 3730         subw x,#CELLL 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      00963A 16 03            [ 2] 3731         ldw y,(3,sp)
      00963C FF               [ 2] 3732         ldw (x),y 
      00963D 81               [ 4] 3733         ret 
                                   3734 
                                   3735 ;       BEGIN   ( -- a )
                                   3736 ;       Start an infinite or
                                   3737 ;       indefinite loop structure.
      00963E 96 35                 3738         .word      LINK
                           0015C0  3739 LINK = . 
      009640 85                    3740 	.byte      IMEDD+5
      009641 42 45 47 49 4E        3741         .ascii     "BEGIN"
      009646                       3742 BEGIN:
      009646 CC 8C 71         [ 2] 3743         JP     HERE
                                   3744 
                                   3745 ;       UNTIL   ( a -- )
                                   3746 ;       Terminate a BEGIN-UNTIL
                                   3747 ;       indefinite loop structure.
      009649 96 40                 3748         .word      LINK
                           0015CB  3749 LINK = . 
      00964B 85                    3750 	.byte      IMEDD+5
      00964C 55 4E 54 49 4C        3751         .ascii     "UNTIL"
      009651                       3752 UNTIL:
      009651 CD 95 C9         [ 4] 3753         CALL     COMPI
      009654 85 2C                 3754         .word    QBRAN 
      009656 CD 87 B8         [ 4] 3755         call ADRADJ
      009659 CC 95 84         [ 2] 3756         JP     COMMA
                                   3757 
                                   3758 ;       AGAIN   ( a -- )
                                   3759 ;       Terminate a BEGIN-AGAIN
                                   3760 ;       infinite loop structure.
      00965C 96 4B                 3761         .word      LINK
                           0015DE  3762 LINK = . 
      00965E 85                    3763 	.byte      IMEDD+5
      00965F 41 47 41 49 4E        3764         .ascii     "AGAIN"
      009664                       3765 AGAIN:
      009664 CD 95 C9         [ 4] 3766         CALL     COMPI
      009667 85 43                 3767         .word BRAN
      009669 CD 87 B8         [ 4] 3768         call ADRADJ 
      00966C CC 95 84         [ 2] 3769         JP     COMMA
                                   3770 
                                   3771 ;       IF      ( -- A )
                                   3772 ;       Begin a conditional branch.
      00966F 96 5E                 3773         .word      LINK
                           0015F1  3774 LINK = . 
      009671 82                    3775 	.byte      IMEDD+2
      009672 49 46                 3776         .ascii     "IF"
      009674                       3777 IFF:
      009674 CD 95 C9         [ 4] 3778         CALL     COMPI
      009677 85 2C                 3779         .word QBRAN
      009679 CD 8C 71         [ 4] 3780         CALL     HERE
      00967C CD 8B 83         [ 4] 3781         CALL     ZERO
      00967F CC 95 84         [ 2] 3782         JP     COMMA
                                   3783 
                                   3784 ;       THEN        ( A -- )
                                   3785 ;       Terminate a conditional branch structure.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      009682 96 71                 3786         .word      LINK
                           001604  3787 LINK = . 
      009684 84                    3788 	.byte      IMEDD+4
      009685 54 48 45 4E           3789         .ascii     "THEN"
      009689                       3790 THENN:
      009689 CD 8C 71         [ 4] 3791         CALL     HERE
      00968C CD 87 B8         [ 4] 3792         call ADRADJ 
      00968F CD 86 2E         [ 4] 3793         CALL     SWAPP
      009692 CC 85 60         [ 2] 3794         JP     STORE
                                   3795 
                                   3796 ;       ELSE        ( A -- A )
                                   3797 ;       Start the false clause in an IF-ELSE-THEN structure.
      009695 96 84                 3798         .word      LINK
                           001617  3799 LINK = . 
      009697 84                    3800 	.byte      IMEDD+4
      009698 45 4C 53 45           3801         .ascii     "ELSE"
      00969C                       3802 ELSEE:
      00969C CD 95 C9         [ 4] 3803         CALL     COMPI
      00969F 85 43                 3804         .word BRAN
      0096A1 CD 8C 71         [ 4] 3805         CALL     HERE
      0096A4 CD 8B 83         [ 4] 3806         CALL     ZERO
      0096A7 CD 95 84         [ 4] 3807         CALL     COMMA
      0096AA CD 86 2E         [ 4] 3808         CALL     SWAPP
      0096AD CD 8C 71         [ 4] 3809         CALL     HERE
      0096B0 CD 87 B8         [ 4] 3810         call ADRADJ 
      0096B3 CD 86 2E         [ 4] 3811         CALL     SWAPP
      0096B6 CC 85 60         [ 2] 3812         JP     STORE
                                   3813 
                                   3814 ;       AHEAD       ( -- A )
                                   3815 ;       Compile a forward branch instruction.
      0096B9 96 97                 3816         .word      LINK
                           00163B  3817 LINK = . 
      0096BB 85                    3818 	.byte      IMEDD+5
      0096BC 41 48 45 41 44        3819         .ascii     "AHEAD"
      0096C1                       3820 AHEAD:
      0096C1 CD 95 C9         [ 4] 3821         CALL     COMPI
      0096C4 85 43                 3822         .word BRAN
      0096C6 CD 8C 71         [ 4] 3823         CALL     HERE
      0096C9 CD 8B 83         [ 4] 3824         CALL     ZERO
      0096CC CC 95 84         [ 2] 3825         JP     COMMA
                                   3826 
                                   3827 ;       WHILE       ( a -- A a )
                                   3828 ;       Conditional branch out of a BEGIN-WHILE-REPEAT loop.
      0096CF 96 BB                 3829         .word      LINK
                           001651  3830 LINK = . 
      0096D1 85                    3831 	.byte      IMEDD+5
      0096D2 57 48 49 4C 45        3832         .ascii     "WHILE"
      0096D7                       3833 WHILE:
      0096D7 CD 95 C9         [ 4] 3834         CALL     COMPI
      0096DA 85 2C                 3835         .word QBRAN
      0096DC CD 8C 71         [ 4] 3836         CALL     HERE
      0096DF CD 8B 83         [ 4] 3837         CALL     ZERO
      0096E2 CD 95 84         [ 4] 3838         CALL     COMMA
      0096E5 CC 86 2E         [ 2] 3839         JP     SWAPP
                                   3840 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



                                   3841 ;       REPEAT      ( A a -- )
                                   3842 ;       Terminate a BEGIN-WHILE-REPEAT indefinite loop.
      0096E8 96 D1                 3843         .word      LINK
                           00166A  3844 LINK = . 
      0096EA 86                    3845         .byte      IMEDD+6
      0096EB 52 45 50 45 41 54     3846         .ascii     "REPEAT"
      0096F1                       3847 REPEA:
      0096F1 CD 95 C9         [ 4] 3848         CALL     COMPI
      0096F4 85 43                 3849         .word BRAN
      0096F6 CD 87 B8         [ 4] 3850         call ADRADJ 
      0096F9 CD 95 84         [ 4] 3851         CALL     COMMA
      0096FC CD 8C 71         [ 4] 3852         CALL     HERE
      0096FF CD 87 B8         [ 4] 3853         call ADRADJ 
      009702 CD 86 2E         [ 4] 3854         CALL     SWAPP
      009705 CC 85 60         [ 2] 3855         JP     STORE
                                   3856 
                                   3857 ;       AFT         ( a -- a A )
                                   3858 ;       Jump to THEN in a FOR-AFT-THEN-NEXT loop the first time through.
      009708 96 EA                 3859         .word      LINK
                           00168A  3860 LINK = . 
      00970A 83                    3861 	.byte      IMEDD+3
      00970B 41 46 54              3862         .ascii     "AFT"
      00970E                       3863 AFT:
      00970E CD 86 14         [ 4] 3864         CALL     DROP
      009711 CD 96 C1         [ 4] 3865         CALL     AHEAD
      009714 CD 8C 71         [ 4] 3866         CALL     HERE
      009717 CC 86 2E         [ 2] 3867         JP     SWAPP
                                   3868 
                                   3869 ;       ABORT"      ( -- ; <string> )
                                   3870 ;       Conditional abort with an error message.
      00971A 97 0A                 3871         .word      LINK
                           00169C  3872 LINK = . 
      00971C 86                    3873 	.byte      IMEDD+6
      00971D 41 42 4F 52 54        3874         .ascii     "ABORT"
      009722 22                    3875         .byte      '"'
      009723                       3876 ABRTQ:
      009723 CD 95 C9         [ 4] 3877         CALL     COMPI
      009726 94 47                 3878         .word ABORQ
      009728 CC 95 F9         [ 2] 3879         JP     STRCQ
                                   3880 
                                   3881 ;       $"     ( -- ; <string> )
                                   3882 ;       Compile an inline string literal.
      00972B 97 1C                 3883         .word      LINK
                           0016AD  3884 LINK = . 
      00972D 82                    3885 	.byte      IMEDD+2
      00972E 24 22                 3886         .byte     '$','"'
      009730                       3887 STRQ:
      009730 CD 95 C9         [ 4] 3888         CALL     COMPI
      009733 90 1E                 3889         .word STRQP 
      009735 CC 95 F9         [ 2] 3890         JP     STRCQ
                                   3891 
                                   3892 ;       ."          ( -- ; <string> )
                                   3893 ;       Compile an inline string literal to be typed out at run time.
      009738 97 2D                 3894         .word      LINK
                           0016BA  3895 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



      00973A 82                    3896 	.byte      IMEDD+2
      00973B 2E 22                 3897         .byte     '.','"'
      00973D                       3898 DOTQ:
      00973D CD 95 C9         [ 4] 3899         CALL     COMPI
      009740 90 28                 3900         .word DOTQP 
      009742 CC 95 F9         [ 2] 3901         JP     STRCQ
                                   3902 
                                   3903 ;; Name compiler
                                   3904 
                                   3905 ;       ?UNIQUE ( a -- a )
                                   3906 ;       Display a warning message
                                   3907 ;       if word already exists.
      009745 97 3A                 3908         .word      LINK
                           0016C7  3909 LINK = . 
      009747 07                    3910         .byte      7
      009748 3F 55 4E 49 51 55 45  3911         .ascii     "?UNIQUE"
      00974F                       3912 UNIQU:
      00974F CD 86 1E         [ 4] 3913         CALL     DUPP
      009752 CD 93 3B         [ 4] 3914         CALL     NAMEQ   ;?name exists
      009755 CD 85 2C         [ 4] 3915         CALL     QBRAN
      009758 97 6E                 3916         .word      UNIQ1
      00975A CD 90 28         [ 4] 3917         CALL     DOTQP   ;redef are OK
      00975D 07                    3918         .byte       7
      00975E 20 72 65 44 65 66 20  3919         .ascii     " reDef "       
      009765 CD 86 48         [ 4] 3920         CALL     OVER
      009768 CD 8C 5A         [ 4] 3921         CALL     COUNT
      00976B CD 8F CB         [ 4] 3922         CALL     TYPES   ;just in case
      00976E CC 86 14         [ 2] 3923 UNIQ1:  JP     DROP
                                   3924 
                                   3925 ;       $,n     ( na -- )
                                   3926 ;       Build a new dictionary name
                                   3927 ;       using string at na.
                                   3928 ; compile dans l'espace des variables 
      009771 97 47                 3929         .word      LINK
                           0016F3  3930 LINK = . 
      009773 03                    3931         .byte      3
      009774 24 2C 6E              3932         .ascii     "$,n"
      009777                       3933 SNAME:
      009777 CD 86 1E         [ 4] 3934         CALL     DUPP
      00977A CD 85 95         [ 4] 3935         CALL     CAT     ;?null input
      00977D CD 85 2C         [ 4] 3936         CALL     QBRAN
      009780 97 AD                 3937         .word      PNAM1
      009782 CD 97 4F         [ 4] 3938         CALL     UNIQU   ;?redefinition
      009785 CD 86 1E         [ 4] 3939         CALL     DUPP
      009788 CD 8C 5A         [ 4] 3940         CALL     COUNT
      00978B CD 88 19         [ 4] 3941         CALL     PLUS
      00978E CD 87 6C         [ 4] 3942         CALL     VPP
      009791 CD 85 60         [ 4] 3943         CALL     STORE
      009794 CD 86 1E         [ 4] 3944         CALL     DUPP
      009797 CD 87 8A         [ 4] 3945         CALL     LAST
      00979A CD 85 60         [ 4] 3946         CALL     STORE   ;save na for vocabulary link
      00979D CD 8A FB         [ 4] 3947         CALL     CELLM   ;link address
      0097A0 CD 87 5E         [ 4] 3948         CALL     CNTXT
      0097A3 CD 85 77         [ 4] 3949         CALL     AT
      0097A6 CD 86 2E         [ 4] 3950         CALL     SWAPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      0097A9 CD 85 60         [ 4] 3951         CALL     STORE
      0097AC 81               [ 4] 3952         RET     ;save code pointer
      0097AD CD 90 1E         [ 4] 3953 PNAM1:  CALL     STRQP
      0097B0 05                    3954         .byte      5
      0097B1 20 6E 61 6D 65        3955         .ascii     " name" ;null input
      0097B6 CC 94 4F         [ 2] 3956         JP     ABOR1
                                   3957 
                                   3958 ;; FORTH compiler
                                   3959 
                                   3960 ;       $COMPILE        ( a -- )
                                   3961 ;       Compile next word to
                                   3962 ;       dictionary as a token or literal.
      0097B9 97 73                 3963         .word      LINK
                           00173B  3964 LINK = . 
      0097BB 08                    3965         .byte      8
      0097BC 24 43 4F 4D 50 49 4C  3966         .ascii     "$COMPILE"
             45
      0097C4                       3967 SCOMP:
      0097C4 CD 93 3B         [ 4] 3968         CALL     NAMEQ
      0097C7 CD 87 C8         [ 4] 3969         CALL     QDUP    ;?defined
      0097CA CD 85 2C         [ 4] 3970         CALL     QBRAN
      0097CD 97 E5                 3971         .word      SCOM2
      0097CF CD 85 77         [ 4] 3972         CALL     AT
      0097D2 CD 84 F9         [ 4] 3973         CALL     DOLIT
      0097D5 80 00                 3974         .word     0x8000	;  IMEDD*256
      0097D7 CD 86 6A         [ 4] 3975         CALL     ANDD    ;?immediate
      0097DA CD 85 2C         [ 4] 3976         CALL     QBRAN
      0097DD 97 E2                 3977         .word      SCOM1
      0097DF CC 85 53         [ 2] 3978         JP     EXECU
      0097E2 CC 98 7F         [ 2] 3979 SCOM1:  JP     JSRC
      0097E5 CD 8E 96         [ 4] 3980 SCOM2:  CALL     NUMBQ   ;try to convert to number
      0097E8 CD 85 2C         [ 4] 3981         CALL     QBRAN
      0097EB 94 4F                 3982         .word      ABOR1
      0097ED CC 95 EB         [ 2] 3983         JP     LITER
                                   3984 
                                   3985 ;       OVERT   ( -- )
                                   3986 ;       Link a new word into vocabulary.
      0097F0 97 BB                 3987         .word      LINK
                           001772  3988 LINK = . 
      0097F2 05                    3989         .byte      5
      0097F3 4F 56 45 52 54        3990         .ascii     "OVERT"
      0097F8                       3991 OVERT:
      0097F8 CD 87 8A         [ 4] 3992         CALL     LAST
      0097FB CD 85 77         [ 4] 3993         CALL     AT
      0097FE CD 87 5E         [ 4] 3994         CALL     CNTXT
      009801 CC 85 60         [ 2] 3995         JP     STORE
                                   3996 
                                   3997 ;       ;       ( -- )
                                   3998 ;       Terminate a colon definition.
      009804 97 F2                 3999         .word      LINK
                           001786  4000 LINK = . 
      009806 C1                    4001 	.byte      IMEDD+COMPO+1
      009807 3B                    4002         .ascii     ";"
      009808                       4003 SEMIS:
                           000001  4004 .if OPTIMIZE ; more compact and faster
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      009808 CD 84 F9         [ 4] 4005         call DOLIT 
      00980B 00 81                 4006         .word 0x81   ; opcode for RET 
      00980D CD 95 9B         [ 4] 4007         call CCOMMA 
                           000000  4008 .else
                                   4009         CALL     COMPI
                                   4010         .word EXIT 
                                   4011 .endif 
      009810 CD 94 B0         [ 4] 4012         CALL     LBRAC
      009813 CD 97 F8         [ 4] 4013         call OVERT 
      009816 CD A2 1B         [ 4] 4014         CALL FMOVE
      009819 CD 87 C8         [ 4] 4015         call QDUP 
      00981C CD 85 2C         [ 4] 4016         call QBRAN 
      00981F 99 4F                 4017         .word SET_RAMLAST 
      009821 CD A2 AF         [ 4] 4018         CALL UPDATPTR
      009824 81               [ 4] 4019         RET 
                                   4020 
                                   4021 
                                   4022 ;       Terminate an ISR definition 
                                   4023 ;       retourn ca of ISR as double
                                   4024 ;       I; ( -- ud )
      009825 98 06                 4025         .word LINK 
                           0017A7  4026         LINK=.
      009827 C2                    4027         .byte 2+IMEDD+COMPO 
      009828 49 3B                 4028         .ascii "I;" 
      00982A                       4029 ISEMI:
      00982A 1D 00 02         [ 2] 4030         subw x,#CELLL  
      00982D 90 AE 00 80      [ 2] 4031         ldw y,#IRET_CODE 
      009831 FF               [ 2] 4032         ldw (x),y 
      009832 CD 95 9B         [ 4] 4033         call CCOMMA
      009835 CD 94 B0         [ 4] 4034         call LBRAC 
      009838 CD A2 F4         [ 4] 4035         call IFMOVE
      00983B CD 87 C8         [ 4] 4036         call QDUP 
      00983E CD 85 2C         [ 4] 4037         CALL QBRAN 
      009841 99 4F                 4038         .word SET_RAMLAST
      009843 CD 87 7A         [ 4] 4039         CALL CPP
      009846 CD 85 77         [ 4] 4040         call AT 
      009849 CD 86 2E         [ 4] 4041         call SWAPP 
      00984C CD 87 7A         [ 4] 4042         CALL CPP 
      00984F CD 85 60         [ 4] 4043         call STORE 
      009852 CD 9C AC         [ 4] 4044         call UPDATCP 
      009855 CD 9C 69         [ 4] 4045         call EEPVP 
      009858 CD 86 14         [ 4] 4046         call DROP 
      00985B CD 85 77         [ 4] 4047         call AT 
      00985E CD 87 6C         [ 4] 4048         call VPP 
      009861 CD 85 60         [ 4] 4049         call STORE 
      009864 CC 8B 83         [ 2] 4050         jp ZERO
      009867 81               [ 4] 4051         ret           
                                   4052         
                                   4053 
                                   4054 ;       ]       ( -- )
                                   4055 ;       Start compiling words in
                                   4056 ;       input stream.
      009868 98 27                 4057         .word      LINK
                           0017EA  4058 LINK = . 
      00986A 01                    4059         .byte      1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



      00986B 5D                    4060         .ascii     "]"
      00986C                       4061 RBRAC:
      00986C CD 84 F9         [ 4] 4062         CALL   DOLIT
      00986F 97 C4                 4063         .word  SCOMP
      009871 CD 87 3C         [ 4] 4064         CALL   TEVAL
      009874 CC 85 60         [ 2] 4065         JP     STORE
                                   4066 
                                   4067 ;       CALL,    ( ca -- )
                                   4068 ;       Compile a subroutine call.
      009877 98 6A                 4069         .word      LINK
                           0017F9  4070 LINK = . 
      009879 05                    4071         .byte      5
      00987A 43 41 4C 4C 2C        4072         .ascii     "CALL,"
      00987F                       4073 JSRC:
      00987F CD 84 F9         [ 4] 4074         CALL     DOLIT
      009882 00 CD                 4075         .word     CALLL     ;CALL
      009884 CD 95 9B         [ 4] 4076         CALL     CCOMMA
      009887 CC 95 84         [ 2] 4077         JP     COMMA
                                   4078 
                                   4079 ;       INIT-OFS ( -- )
                                   4080 ;       compute offset to adjust jump address 
                                   4081 ;       set variable OFFSET 
      00988A 98 79                 4082         .word LINK 
                           00180C  4083         LINK=.
      00988C 08                    4084         .byte 8 
      00988D 49 4E 49 54 2D 4F 46  4085         .ascii "INIT-OFS" 
             53
      009895                       4086 INITOFS:
      009895 CD 87 2B         [ 4] 4087         call TFLASH 
      009898 CD 85 77         [ 4] 4088         CALL AT 
      00989B CD 86 1E         [ 4] 4089         CALL DUPP 
      00989E CD 85 2C         [ 4] 4090         call QBRAN
      0098A1 98 B2                 4091         .word 1$
      0098A3 CD 86 14         [ 4] 4092         call DROP  
      0098A6 CD 87 7A         [ 4] 4093         call CPP 
      0098A9 CD 85 77         [ 4] 4094         call AT 
      0098AC CD 8C 71         [ 4] 4095         call HERE
      0098AF CD 88 92         [ 4] 4096         call SUBB 
      0098B2 CD 87 AF         [ 4] 4097 1$:     call OFFSET 
      0098B5 CC 85 60         [ 2] 4098         jp STORE  
                                   4099 
                                   4100 ;       :       ( -- ; <string> )
                                   4101 ;       Start a new colon definition
                                   4102 ;       using next word as its name.
      0098B8 98 8C                 4103         .word      LINK
                           00183A  4104 LINK = . 
      0098BA 01                    4105         .byte      1
      0098BB 3A                    4106         .ascii     ":"
      0098BC                       4107 COLON:
      0098BC CD 98 95         [ 4] 4108         call INITOFS       
      0098BF CD 92 3E         [ 4] 4109         CALL   TOKEN
      0098C2 CD 97 77         [ 4] 4110         CALL   SNAME
      0098C5 CC 98 6C         [ 2] 4111         JP     RBRAC
                                   4112 
                                   4113 ;       I:  ( -- )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



                                   4114 ;       Start interrupt service routine definition
                                   4115 ;       those definition have no name.
      0098C8 98 BA                 4116         .word LINK
                           00184A  4117         LINK=.
      0098CA 02                    4118         .byte 2 
      0098CB 49 3A                 4119         .ascii "I:" 
      0098CD                       4120 ICOLON:
      0098CD CD 98 95         [ 4] 4121         call INITOFS 
      0098D0 CC 98 6C         [ 2] 4122         jp RBRAC  
                                   4123 
                                   4124 ;       IMMEDIATE       ( -- )
                                   4125 ;       Make last compiled word
                                   4126 ;       an immediate word.
      0098D3 98 CA                 4127         .word      LINK
                           001855  4128 LINK = . 
      0098D5 09                    4129         .byte      9
      0098D6 49 4D 4D 45 44 49 41  4130         .ascii     "IMMEDIATE"
             54 45
      0098DF                       4131 IMMED:
      0098DF CD 84 F9         [ 4] 4132         CALL     DOLIT
      0098E2 80 00                 4133         .word     0x8000	;  IMEDD*256
      0098E4 CD 87 8A         [ 4] 4134         CALL     LAST
      0098E7 CD 85 77         [ 4] 4135         CALL     AT
      0098EA CD 85 77         [ 4] 4136         CALL     AT
      0098ED CD 86 7E         [ 4] 4137         CALL     ORR
      0098F0 CD 87 8A         [ 4] 4138         CALL     LAST
      0098F3 CD 85 77         [ 4] 4139         CALL     AT
      0098F6 CC 85 60         [ 2] 4140         JP     STORE
                                   4141 
                                   4142 ;; Defining words
                                   4143 
                                   4144 ;       CREATE  ( -- ; <string> )
                                   4145 ;       Compile a new array
                                   4146 ;       without allocating space.
      0098F9 98 D5                 4147         .word      LINK
                           00187B  4148 LINK = . 
      0098FB 06                    4149         .byte      6
      0098FC 43 52 45 41 54 45     4150         .ascii     "CREATE"
      009902                       4151 CREAT:
      009902 CD 92 3E         [ 4] 4152         CALL     TOKEN
      009905 CD 97 77         [ 4] 4153         CALL     SNAME
      009908 CD 97 F8         [ 4] 4154         CALL     OVERT        
      00990B CD 95 C9         [ 4] 4155         CALL     COMPI 
      00990E 86 CB                 4156         .word DOVAR 
      009910 81               [ 4] 4157         RET
                                   4158 
                                   4159 ;       VARIABLE        ( -- ; <string> )
                                   4160 ;       Compile a new variable
                                   4161 ;       initialized to 0.
      009911 98 FB                 4162         .word      LINK
                           001893  4163 LINK = . 
      009913 08                    4164         .byte      8
      009914 56 41 52 49 41 42 4C  4165         .ascii     "VARIABLE"
             45
      00991C                       4166 VARIA:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



                                   4167 ; indirect variable so that VARIABLE definition can be compiled in FLASH 
      00991C CD 8C 71         [ 4] 4168         CALL HERE
      00991F CD 86 1E         [ 4] 4169         CALL DUPP 
      009922 CD 8A EC         [ 4] 4170         CALL CELLP
      009925 CD 87 6C         [ 4] 4171         CALL VPP 
      009928 CD 85 60         [ 4] 4172         CALL STORE
      00992B CD 99 02         [ 4] 4173         CALL CREAT
      00992E CD 86 1E         [ 4] 4174         CALL DUPP
      009931 CD 95 84         [ 4] 4175         CALL COMMA
      009934 CD 8B 83         [ 4] 4176         CALL ZERO
      009937 CD 86 2E         [ 4] 4177         call SWAPP 
      00993A CD 85 60         [ 4] 4178         CALL STORE
      00993D CD A2 1B         [ 4] 4179         CALL FMOVE ; move definition to FLASH
      009940 CD 87 C8         [ 4] 4180         CALL QDUP 
      009943 CD 85 2C         [ 4] 4181         CALL QBRAN 
      009946 99 4F                 4182         .word SET_RAMLAST   
      009948 CD 9C C3         [ 4] 4183         call UPDATVP  ; don't update if variable kept in RAM.
      00994B CD A2 AF         [ 4] 4184         CALL UPDATPTR
      00994E 81               [ 4] 4185         RET         
      00994F                       4186 SET_RAMLAST: 
      00994F CD 87 8A         [ 4] 4187         CALL LAST 
      009952 CD 85 77         [ 4] 4188         CALL AT 
      009955 CD 87 9D         [ 4] 4189         CALL RAMLAST 
      009958 CC 85 60         [ 2] 4190         jp STORE  
                                   4191 
                                   4192 
                                   4193 ;       CONSTANT  ( n -- ; <string> )
                                   4194 ;       Compile a new constant 
                                   4195 ;       n CONSTANT name 
      00995B 99 13                 4196         .word LINK 
                           0018DD  4197         LINK=. 
      00995D 08                    4198         .byte 8 
      00995E 43 4F 4E 53 54 41 4E  4199         .ascii "CONSTANT" 
             54
      009966                       4200 CONSTANT:          
      009966 CD 92 3E         [ 4] 4201         CALL TOKEN
      009969 CD 97 77         [ 4] 4202         CALL SNAME 
      00996C CD 97 F8         [ 4] 4203         CALL OVERT 
      00996F CD 95 C9         [ 4] 4204         CALL COMPI 
      009972 99 90                 4205         .word DOCONST
      009974 CD 95 84         [ 4] 4206         CALL COMMA 
      009977 CD A2 1B         [ 4] 4207         CALL FMOVE
      00997A CD 87 C8         [ 4] 4208         CALL QDUP 
      00997D CD 85 2C         [ 4] 4209         CALL QBRAN 
      009980 99 4F                 4210         .word SET_RAMLAST  
      009982 CD A2 AF         [ 4] 4211         CALL UPDATPTR  
      009985 81               [ 4] 4212 1$:     RET          
                                   4213 
                                   4214 ; CONSTANT runtime semantic 
                                   4215 ; doCONST  ( -- n )
      009986 99 5D                 4216         .word LINK 
                           001908  4217         LINK=.
      009988 07                    4218         .byte 7
      009989 44 4F 43 4F 4E 53 54  4219         .ascii "DOCONST"
      009990                       4220 DOCONST:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



      009990 1D 00 02         [ 2] 4221         subw x,#CELLL
      009993 90 85            [ 2] 4222         popw y 
      009995 90 FE            [ 2] 4223         ldw y,(y) 
      009997 FF               [ 2] 4224         ldw (x),y 
      009998 81               [ 4] 4225         ret 
                                   4226 
                                   4227 ;----------------------------------
                                   4228 ; create double constant 
                                   4229 ; DCONST ( d -- ; <string> )
                                   4230 ;----------------------------------
      009999 99 88                 4231     .word LINK 
                           00191B  4232     LINK=.
      00999B 06                    4233     .byte 6 
      00999C 44 43 4F 4E 53 54     4234     .ascii "DCONST"
      0099A2                       4235 DCONST:
      0099A2 CD 92 3E         [ 4] 4236         CALL TOKEN
      0099A5 CD 97 77         [ 4] 4237         CALL SNAME 
      0099A8 CD 97 F8         [ 4] 4238         CALL OVERT 
      0099AB CD 95 C9         [ 4] 4239         CALL COMPI 
      0099AE 99 D1                 4240         .word DO_DCONST
      0099B0 CD 95 84         [ 4] 4241         CALL COMMA
      0099B3 CD 95 84         [ 4] 4242         CALL COMMA  
      0099B6 CD A2 1B         [ 4] 4243         CALL FMOVE
      0099B9 CD 87 C8         [ 4] 4244         CALL QDUP 
      0099BC CD 85 2C         [ 4] 4245         CALL QBRAN 
      0099BF 99 4F                 4246         .word SET_RAMLAST  
      0099C1 CD A2 AF         [ 4] 4247         CALL UPDATPTR  
      0099C4 81               [ 4] 4248 1$:     RET          
                                   4249     
                                   4250 ;----------------------------------
                                   4251 ; runtime for DCONST 
                                   4252 ; stack double constant 
                                   4253 ; DO-DCONST ( -- d )
                                   4254 ;-----------------------------------
      0099C5 99 9B                 4255         .word LINK 
                           001947  4256         LINK=.
      0099C7 09                    4257         .byte 9 
      0099C8 44 4F 2D 44 43 4F 4E  4258         .ascii "DO-DCONST"
             53 54
      0099D1                       4259 DO_DCONST:
      0099D1 90 85            [ 2] 4260     popw y 
      0099D3 90 BF 28         [ 2] 4261     ldw YTEMP,y 
      0099D6 1D 00 04         [ 2] 4262     subw x,#2*CELLL 
      0099D9 90 FE            [ 2] 4263     ldw y,(y)
      0099DB FF               [ 2] 4264     ldw (x),y 
      0099DC 90 BE 28         [ 2] 4265     ldw y,YTEMP 
      0099DF 90 EE 02         [ 2] 4266     ldw y,(2,y)
      0099E2 EF 02            [ 2] 4267     ldw (2,x),y 
      0099E4 81               [ 4] 4268     ret 
                                   4269 
                                   4270 ;; Tools
                                   4271 
                                   4272 ;       _TYPE   ( b u -- )
                                   4273 ;       Display a string. Filter
                                   4274 ;       non-printing characters.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



      0099E5 99 C7                 4275         .word      LINK
                           001967  4276 LINK = . 
      0099E7 05                    4277         .byte      5
      0099E8 5F 54 59 50 45        4278         .ascii     "_TYPE"
      0099ED                       4279 UTYPE:
      0099ED CD 85 E7         [ 4] 4280         CALL     TOR     ;start count down loop
      0099F0 20 0F            [ 2] 4281         JRA     UTYP2   ;skip first pass
      0099F2 CD 86 1E         [ 4] 4282 UTYP1:  CALL     DUPP
      0099F5 CD 85 95         [ 4] 4283         CALL     CAT
      0099F8 CD 8B AD         [ 4] 4284         CALL     TCHAR
      0099FB CD 84 B8         [ 4] 4285         CALL     EMIT    ;display only printable
      0099FE CD 8B 17         [ 4] 4286         CALL     ONEP    ;increment address
      009A01 CD 85 0D         [ 4] 4287 UTYP2:  CALL     DONXT
      009A04 99 F2                 4288         .word      UTYP1   ;loop till done
      009A06 CC 86 14         [ 2] 4289         JP     DROP
                                   4290 
                                   4291 ;       dm+     ( a u -- a )
                                   4292 ;       Dump u bytes from ,
                                   4293 ;       leaving a+u on  stack.
      009A09 99 E7                 4294         .word      LINK
                           00198B  4295 LINK = . 
      009A0B 03                    4296         .byte      3
      009A0C 64 6D 2B              4297         .ascii     "dm+"
      009A0F                       4298 DUMPP:
      009A0F CD 86 48         [ 4] 4299         CALL     OVER
      009A12 CD 84 F9         [ 4] 4300         CALL     DOLIT
      009A15 00 04                 4301         .word      4
      009A17 CD 90 51         [ 4] 4302         CALL     UDOTR   ;display address
      009A1A CD 8F A1         [ 4] 4303         CALL     SPACE
      009A1D CD 85 E7         [ 4] 4304         CALL     TOR     ;start count down loop
      009A20 20 11            [ 2] 4305         JRA     PDUM2   ;skip first pass
      009A22 CD 86 1E         [ 4] 4306 PDUM1:  CALL     DUPP
      009A25 CD 85 95         [ 4] 4307         CALL     CAT
      009A28 CD 84 F9         [ 4] 4308         CALL     DOLIT
      009A2B 00 03                 4309         .word      3
      009A2D CD 90 51         [ 4] 4310         CALL     UDOTR   ;display numeric data
      009A30 CD 8B 17         [ 4] 4311         CALL     ONEP    ;increment address
      009A33 CD 85 0D         [ 4] 4312 PDUM2:  CALL     DONXT
      009A36 9A 22                 4313         .word      PDUM1   ;loop till done
      009A38 81               [ 4] 4314         RET
                                   4315 
                                   4316 ;       DUMP    ( a u -- )
                                   4317 ;       Dump u bytes from a,
                                   4318 ;       in a formatted manner.
      009A39 9A 0B                 4319         .word      LINK
                           0019BB  4320 LINK = . 
      009A3B 04                    4321         .byte      4
      009A3C 44 55 4D 50           4322         .ascii     "DUMP"
      009A40                       4323 DUMP:
      009A40 CD 86 DB         [ 4] 4324         CALL     BASE
      009A43 CD 85 77         [ 4] 4325         CALL     AT
      009A46 CD 85 E7         [ 4] 4326         CALL     TOR
      009A49 CD 8E 29         [ 4] 4327         CALL     HEX     ;save radix, set hex
      009A4C CD 84 F9         [ 4] 4328         CALL     DOLIT
      009A4F 00 10                 4329         .word      16
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



      009A51 CD 8A 3D         [ 4] 4330         CALL     SLASH   ;change count to lines
      009A54 CD 85 E7         [ 4] 4331         CALL     TOR     ;start count down loop
      009A57 CD 8F E9         [ 4] 4332 DUMP1:  CALL     CR
      009A5A CD 84 F9         [ 4] 4333         CALL     DOLIT
      009A5D 00 10                 4334         .word      16
      009A5F CD 88 04         [ 4] 4335         CALL     DDUP
      009A62 CD 9A 0F         [ 4] 4336         CALL     DUMPP   ;display numeric
      009A65 CD 87 D9         [ 4] 4337         CALL     ROT
      009A68 CD 87 D9         [ 4] 4338         CALL     ROT
      009A6B CD 8F A1         [ 4] 4339         CALL     SPACE
      009A6E CD 8F A1         [ 4] 4340         CALL     SPACE
      009A71 CD 99 ED         [ 4] 4341         CALL     UTYPE   ;display printable characters
      009A74 CD 85 0D         [ 4] 4342         CALL     DONXT
      009A77 9A 57                 4343         .word      DUMP1   ;loop till done
      009A79 CD 86 14         [ 4] 4344 DUMP3:  CALL     DROP
      009A7C CD 85 C8         [ 4] 4345         CALL     RFROM
      009A7F CD 86 DB         [ 4] 4346         CALL     BASE
      009A82 CC 85 60         [ 2] 4347         JP     STORE   ;restore radix
                                   4348 
                                   4349 ;       .S      ( ... -- ... )
                                   4350 ;        Display  contents of stack.
      009A85 9A 3B                 4351         .word      LINK
                           001A07  4352 LINK = . 
      009A87 02                    4353         .byte      2
      009A88 2E 53                 4354         .ascii     ".S"
      009A8A                       4355 DOTS:
      009A8A CD 8F E9         [ 4] 4356         CALL     CR
      009A8D CD 8B C5         [ 4] 4357         CALL     DEPTH   ;stack depth
      009A90 CD 85 E7         [ 4] 4358         CALL     TOR     ;start count down loop
      009A93 20 09            [ 2] 4359         JRA     DOTS2   ;skip first pass
      009A95 CD 85 DB         [ 4] 4360 DOTS1:  CALL     RAT
      009A98 CD 8B DC         [ 4] 4361 	CALL     PICK
      009A9B CD 90 84         [ 4] 4362         CALL     DOT     ;index stack, display contents
      009A9E CD 85 0D         [ 4] 4363 DOTS2:  CALL     DONXT
      009AA1 9A 95                 4364         .word      DOTS1   ;loop till done
      009AA3 CD 90 28         [ 4] 4365         CALL     DOTQP
      009AA6 05                    4366         .byte      5
      009AA7 20 3C 73 70 20        4367         .ascii     " <sp "
      009AAC 81               [ 4] 4368         RET
                                   4369 
                                   4370 ;       >NAME   ( ca -- na | F )
                                   4371 ;       Convert code address
                                   4372 ;       to a name address.
      009AAD 9A 87                 4373         .word      LINK
                           001A2F  4374 LINK = . 
      009AAF 05                    4375         .byte      5
      009AB0 3E 4E 41 4D 45        4376         .ascii     ">NAME"
      009AB5                       4377 TNAME:
      009AB5 CD 87 5E         [ 4] 4378         CALL     CNTXT   ;vocabulary link
      009AB8 CD 85 77         [ 4] 4379 TNAM2:  CALL     AT
      009ABB CD 86 1E         [ 4] 4380         CALL     DUPP    ;?last word in a vocabulary
      009ABE CD 85 2C         [ 4] 4381         CALL     QBRAN
      009AC1 9A DC                 4382         .word      TNAM4
      009AC3 CD 88 04         [ 4] 4383         CALL     DDUP
      009AC6 CD 92 4C         [ 4] 4384         CALL     NAMET
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



      009AC9 CD 86 93         [ 4] 4385         CALL     XORR    ;compare
      009ACC CD 85 2C         [ 4] 4386         CALL     QBRAN
      009ACF 9A D6                 4387         .word      TNAM3
      009AD1 CD 8A FB         [ 4] 4388         CALL     CELLM   ;continue with next word
      009AD4 20 E2            [ 2] 4389         JRA     TNAM2
      009AD6 CD 86 2E         [ 4] 4390 TNAM3:  CALL     SWAPP
      009AD9 CC 86 14         [ 2] 4391         JP     DROP
      009ADC CD 87 F9         [ 4] 4392 TNAM4:  CALL     DDROP
      009ADF CC 8B 83         [ 2] 4393         JP     ZERO
                                   4394 
                                   4395 ;       .ID     ( na -- )
                                   4396 ;        Display  name at address.
      009AE2 9A AF                 4397         .word      LINK
                           001A64  4398 LINK = . 
      009AE4 03                    4399         .byte      3
      009AE5 2E 49 44              4400         .ascii     ".ID"
      009AE8                       4401 DOTID:
      009AE8 CD 87 C8         [ 4] 4402         CALL     QDUP    ;if zero no name
      009AEB CD 85 2C         [ 4] 4403         CALL     QBRAN
      009AEE 9A FE                 4404         .word      DOTI1
      009AF0 CD 8C 5A         [ 4] 4405         CALL     COUNT
      009AF3 CD 84 F9         [ 4] 4406         CALL     DOLIT
      009AF6 00 1F                 4407         .word      0x1F
      009AF8 CD 86 6A         [ 4] 4408         CALL     ANDD    ;mask lexicon bits
      009AFB CC 99 ED         [ 2] 4409         JP     UTYPE
      009AFE CD 90 28         [ 4] 4410 DOTI1:  CALL     DOTQP
      009B01 09                    4411         .byte      9
      009B02 20 6E 6F 4E 61 6D 65  4412         .ascii     " noName"
      009B09 81               [ 4] 4413         RET
                                   4414 
                           000000  4415 WANT_SEE=0
                           000000  4416 .if WANT_SEE 
                                   4417 ;       SEE     ( -- ; <string> )
                                   4418 ;       A simple decompiler.
                                   4419 ;       Updated for byte machines.
                                   4420         .word      LINK
                                   4421 LINK = . 
                                   4422         .byte      3
                                   4423         .ascii     "SEE"
                                   4424 SEE:
                                   4425         CALL     TICK    ;starting address
                                   4426         CALL     CR
                                   4427         CALL     ONEM
                                   4428 SEE1:   CALL     ONEP
                                   4429         CALL     DUPP
                                   4430         CALL     AT
                                   4431         CALL     DUPP
                                   4432         CALL     QBRAN
                                   4433         .word    SEE2
                                   4434         CALL     TNAME   ;?is it a name
                                   4435 SEE2:   CALL     QDUP    ;name address or zero
                                   4436         CALL     QBRAN
                                   4437         .word    SEE3
                                   4438         CALL     SPACE
                                   4439         CALL     DOTID   ;display name
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



                                   4440         CALL     ONEP
                                   4441         JRA      SEE4
                                   4442 SEE3:   CALL     DUPP
                                   4443         CALL     CAT
                                   4444         CALL     UDOT    ;display number
                                   4445 SEE4:   CALL     NUFQ    ;user control
                                   4446         CALL     QBRAN
                                   4447         .word    SEE1
                                   4448         JP     DROP
                                   4449 .endif ; WANT_SEE 
                                   4450 
                                   4451 ;       WORDS   ( -- )
                                   4452 ;       Display names in vocabulary.
      009B0A 9A E4                 4453         .word      LINK
                           001A8C  4454 LINK = . 
      009B0C 05                    4455         .byte      5
      009B0D 57 4F 52 44 53        4456         .ascii     "WORDS"
      009B12                       4457 WORDS:
      009B12 CD 8F E9         [ 4] 4458         CALL     CR
      009B15 CD 87 5E         [ 4] 4459         CALL     CNTXT   ;only in context
      009B18 CD 85 77         [ 4] 4460 WORS1:  CALL     AT
      009B1B CD 87 C8         [ 4] 4461         CALL     QDUP    ;?at end of list
      009B1E CD 85 2C         [ 4] 4462         CALL     QBRAN
      009B21 9B 34                 4463         .word      WORS2
      009B23 CD 86 1E         [ 4] 4464         CALL     DUPP
      009B26 CD 8F A1         [ 4] 4465         CALL     SPACE
      009B29 CD 9A E8         [ 4] 4466         CALL     DOTID   ;display a name
      009B2C CD 8A FB         [ 4] 4467         CALL     CELLM
      009B2F CD 85 43         [ 4] 4468         CALL     BRAN
      009B32 9B 18                 4469         .word      WORS1
      009B34 81               [ 4] 4470 WORS2:  RET
                                   4471 
                                   4472         
                                   4473 ;; Hardware reset
                                   4474 
                                   4475 ;       hi      ( -- )
                                   4476 ;       Display sign-on message.
      009B35 9B 0C                 4477         .word      LINK
                           001AB7  4478 LINK = . 
      009B37 02                    4479         .byte      2
      009B38 68 69                 4480         .ascii     "hi"
      009B3A                       4481 HI:
      009B3A CD 8F E9         [ 4] 4482         CALL     CR
      009B3D CD 90 28         [ 4] 4483         CALL     DOTQP   ;initialize I/O
      009B40 0F                    4484         .byte      15
      009B41 73 74 6D 38 65 46 6F  4485         .ascii     "stm8eForth v"
             72 74 68 20 76
      009B4D 33                    4486 	.byte      VER+'0'
      009B4E 2E                    4487         .byte      '.' 
      009B4F 30                    4488 	.byte      EXT+'0' ;version
      009B50 CD 90 28         [ 4] 4489         CALL    DOTQP
                           000001  4490 .if NUCLEO          
      009B53 12                    4491         .byte 18
      009B54 20 6F 6E 20 4E 55 43  4492         .ascii  " on NUCLEO-8S208RB"
             4C 45 4F 2D 38 53 32
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal  30-Bits]



             30 38 52 42
                                   4493 .endif
                           000000  4494 .if DISCOVERY
                                   4495         .byte 19
                                   4496         .ascii  " on STM8S-DISCOVERY"
                                   4497 .endif
                           000000  4498 .if DOORBELL
                                   4499         .byte 16
                                   4500         .ascii " on stm8s105k6b6"
                                   4501 .endif
      009B63 38 52 42         [ 2] 4502         JP     CR
                                   4503 
                           000000  4504 WANT_DEBUG=0
                           000000  4505 .if WANT_DEBUG 
                                   4506 ;       DEBUG      ( -- )
                                   4507 ;       Display sign-on message.
                                   4508 ;        .word      LINK
                                   4509 LINK = . 
                                   4510         .byte      5
                                   4511         .ascii     "DEBUG"
                                   4512 DEBUG:
                                   4513 	CALL DOLIT
                                   4514 	.word 0x65
                                   4515 	CALL EMIT
                                   4516 	CALL DOLIT
                                   4517 	.word 0
                                   4518  	CALL ZLESS 
                                   4519 	CALL DOLIT
                                   4520 	.word 0xFFFE
                                   4521 	CALL ZLESS 
                                   4522 	CALL UPLUS 
                                   4523  	CALL DROP 
                                   4524 	CALL DOLIT
                                   4525 	.word 3
                                   4526 	CALL UPLUS 
                                   4527 	CALL UPLUS 
                                   4528  	CALL DROP
                                   4529 	CALL DOLIT
                                   4530 	.word 0x43
                                   4531 	CALL UPLUS 
                                   4532  	CALL DROP
                                   4533 	CALL EMIT
                                   4534 	CALL DOLIT
                                   4535 	.word 0x4F
                                   4536 	CALL DOLIT
                                   4537 	.word 0x6F
                                   4538  	CALL XORR
                                   4539 	CALL DOLIT
                                   4540 	.word 0xF0
                                   4541  	CALL ANDD
                                   4542 	CALL DOLIT
                                   4543 	.word 0x4F
                                   4544  	CALL ORR
                                   4545 	CALL EMIT
                                   4546 	CALL DOLIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



                                   4547 	.word 8
                                   4548 	CALL DOLIT
                                   4549 	.word 6
                                   4550  	CALL SWAPP
                                   4551 	CALL OVER
                                   4552 	CALL XORR
                                   4553 	CALL DOLIT
                                   4554 	.word 3
                                   4555 	CALL ANDD 
                                   4556 	CALL ANDD
                                   4557 	CALL DOLIT
                                   4558 	.word 0x70
                                   4559 	CALL UPLUS 
                                   4560 	CALL DROP
                                   4561 	CALL EMIT
                                   4562 	CALL DOLIT
                                   4563 	.word 0
                                   4564 	CALL QBRAN
                                   4565 	.word DEBUG1
                                   4566 	CALL DOLIT
                                   4567 	.word 0x3F
                                   4568 DEBUG1:
                                   4569 	CALL DOLIT
                                   4570 	.word 0xFFFF
                                   4571 	CALL QBRAN
                                   4572 	.word DEBUG2
                                   4573 	CALL DOLIT
                                   4574 	.word 0x74
                                   4575 	CALL BRAN
                                   4576 	.word DEBUG3
                                   4577 DEBUG2:
                                   4578 	CALL DOLIT
                                   4579 	.word 0x21
                                   4580 DEBUG3:
                                   4581 	CALL EMIT
                                   4582 	CALL DOLIT
                                   4583 	.word 0x68
                                   4584 	CALL DOLIT
                                   4585 	.word 0x80
                                   4586 	CALL STORE
                                   4587 	CALL DOLIT
                                   4588 	.word 0x80
                                   4589 	CALL AT
                                   4590 	CALL EMIT
                                   4591 	CALL DOLIT
                                   4592 	.word 0x4D
                                   4593 	CALL TOR
                                   4594 	CALL RAT
                                   4595 	CALL RFROM
                                   4596 	CALL ANDD
                                   4597 	CALL EMIT
                                   4598 	CALL DOLIT
                                   4599 	.word 0x61
                                   4600 	CALL DOLIT
                                   4601 	.word 0xA
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



                                   4602 	CALL TOR
                                   4603 DEBUG4:
                                   4604 	CALL DOLIT
                                   4605 	.word 1
                                   4606 	CALL UPLUS 
                                   4607 	CALL DROP
                                   4608 	CALL DONXT
                                   4609 	.word DEBUG4
                                   4610 	CALL EMIT
                                   4611 	CALL DOLIT
                                   4612 	.word 0x656D
                                   4613 	CALL DOLIT
                                   4614 	.word 0x100
                                   4615 	CALL UMSTA
                                   4616 	CALL SWAPP
                                   4617 	CALL DOLIT
                                   4618 	.word 0x100
                                   4619 	CALL UMSTA
                                   4620 	CALL SWAPP 
                                   4621 	CALL DROP
                                   4622 	CALL EMIT
                                   4623 	CALL EMIT
                                   4624 	CALL DOLIT
                                   4625 	.word 0x2043
                                   4626 	CALL DOLIT
                                   4627 	.word 0
                                   4628 	CALL DOLIT
                                   4629 	.word 0x100
                                   4630 	CALL UMMOD
                                   4631 	CALL EMIT
                                   4632 	CALL EMIT
                                   4633 	;JP ORIG
                                   4634 	RET
                                   4635 .endif ; WANT_DEBUG 
                                   4636 
                                   4637 
                                   4638 ;       'BOOT   ( -- a )
                                   4639 ;       The application startup vector.
      009B66 CC 8F                 4640         .word      LINK
                           001AEB  4641 LINK = . 
      009B68 E9                    4642         .byte      5
      009B69 9B 37 05 27 42        4643         .ascii     "'BOOT"
      001AF1                       4644 TBOOT:
      009B6E 4F 4F 54         [ 4] 4645         CALL     DOVAR
      009B71 40 02                 4646         .word    APP_RUN      ;application to boot
                                   4647 
                                   4648 ;       COLD    ( -- )
                                   4649 ;       The hilevel cold start s=ence.
      009B71 CD 86                 4650         .word      LINK
                           001AF8  4651         LINK = . 
      009B73 CB                    4652         .byte      4
      009B74 40 02 9B 6B           4653         .ascii     "COLD"
      001AFD                       4654 COLD:
                           000000  4655 .if WANT_DEBUG
                                   4656         CALL DEBUG
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



                                   4657 .endif ; WANT_DEBUG
      009B78 04 43 4F         [ 4] 4658 COLD1:  CALL     DOLIT
      009B7B 4C 44                 4659         .word      UZERO
      009B7D CD 04 79         [ 4] 4660 	CALL     DOLIT
      009B7D CD 84                 4661         .word      UPP
      009B7F F9 80 AB         [ 4] 4662         CALL     DOLIT
      009B82 CD 84                 4663 	.word      UEND-UZERO
      009B84 F9 00 06         [ 4] 4664         CALL     CMOVE   ;initialize user area
                           000001  4665 .if WANT_FLOAT 
      009B87 CD 84 F9         [ 4] 4666         CALL    FINIT 
                                   4667 .endif 
                                   4668 ; if APP_RUN==0 initialize with ca de 'hi'  
      009B8A 00 1E CD 8C      [ 2] 4669         ldw y,APP_RUN 
      009B8E BE CD            [ 1] 4670         jrne 0$
      009B90 A4 F9 90         [ 2] 4671         subw x,#CELLL 
      009B93 CE 40 02 26      [ 2] 4672         ldw y,#HI  
      009B97 0B               [ 2] 4673         ldw (x),y
      009B98 1D 00 02         [ 4] 4674         call UPDATRUN 
      001B23                       4675 0$:        
                                   4676 ; update LAST with APP_LAST 
                                   4677 ; if APP_LAST > LAST else do the opposite
      009B9B 90 AE 9B 3A      [ 2] 4678         ldw y,APP_LAST 
      009B9F FF CD 9C         [ 2] 4679         cpw y,ULAST 
      009BA2 9B 05            [ 1] 4680         jrugt 1$ 
                                   4681 ; save LAST at APP_LAST  
      009BA3 CD 1C 03         [ 4] 4682         call UPDATLAST 
      009BA3 90 CE            [ 2] 4683         jra 2$
      001B31                       4684 1$: ; update LAST with APP_LAST 
      009BA5 40 00 90         [ 2] 4685         ldw ULAST,y
      009BA8 B3 1E 22         [ 2] 4686         ldw UCNTXT,y
      001B37                       4687 2$:  
                                   4688 ; update APP_CP if < app_space 
      009BAB 05 CD 9C 83      [ 2] 4689         ldw y,APP_CP  
      009BAF 20 06 1C         [ 2] 4690         cpw y,UCP   
      009BB1 24 06            [ 1] 4691         jruge 3$ 
      009BB1 90 BF 1E         [ 4] 4692         call UPDATCP
      009BB4 90 BF 18         [ 2] 4693         ldw y,UCP   
      009BB7                       4694 3$:
      009BB7 90 CE 40         [ 2] 4695         ldw UCP,y                 
                                   4696 ; update UVP with APP_VP  
                                   4697 ; if APP_VP>UVP else do the opposite 
      009BBA 04 90 B3 1C      [ 2] 4698         ldw y,APP_VP 
      009BBE 24 06 CD         [ 2] 4699         cpw y,UVP 
      009BC1 9C AC            [ 1] 4700         jrugt 4$
      009BC3 90 BE 1C         [ 4] 4701         call UPDATVP 
      009BC6 20 03            [ 2] 4702         jra 6$
      001B57                       4703 4$: ; update UVP with APP_VP 
      009BC6 90 BF 1C         [ 2] 4704         ldw UVP,y 
      001B5A                       4705 6$:      
      009BC9 90 CE 40         [ 4] 4706         CALL     PRESE   ;initialize data stack and TIB
      009BCC 06 90 B3         [ 4] 4707         CALL     TBOOT
      009BCF 1A 22 05         [ 4] 4708         CALL     ATEXE   ;application boot
      009BD2 CD 9C C3         [ 4] 4709         CALL     OVERT
      009BD5 20 03 CC         [ 2] 4710         JP     QUIT    ;start interpretation
                                   4711 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



                                   4712 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



                                   4713         .include "flash.asm"
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
      009BD7 1A F8                   30     .word LINK 
                           001B6B    31     LINK=.
      009BD7 90                      32     .byte 3 
      009BD8 BF 1A 21                33     .ascii "FP!"
      009BDA                         34 FPSTOR:
      009BDA CD 95            [ 1]   35     ldw y,x
      009BDC 2F CD            [ 2]   36     ldw y,(y)
      009BDE 9B 71            [ 1]   37     ld a,yl 
      009BE0 CD 8C            [ 1]   38     ld FPTR,a 
      009BE2 A7 CD 97         [ 2]   39     addw x,#CELLL 
      009BE5 F8 CC            [ 1]   40     ldw y,x 
      009BE7 95 4C            [ 2]   41     ldw y,(y)
      009BE9 9B 78 03         [ 2]   42     ldw PTR16,y
      009BEC 46 50 21         [ 2]   43     addw x,#CELLL 
      009BEF 81               [ 4]   44     ret 
                                     45 
                                     46 ;-----------------------------------
                                     47 ; return EEPROM base address 
                                     48 ; as a double 
                                     49 ;  EEPROM  ( -- ud )
                                     50 ;-----------------------------------
      009BEF 90 93                   51     .word LINK 
                           001B87    52 LINK=.
      009BF1 90                      53     .byte 6 
      009BF2 FE 90 9F B7 36 1C       54     .ascii "EEPROM"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      001B8E                         55 EEPROM: 
      009BF8 00 02 90 93      [ 2]   56     ldw y,#EEPROM_BASE
      009BFC 90 FE 90         [ 2]   57     subw x,#2*CELLL 
      009BFF BF 37            [ 2]   58     ldw (2,x),y 
      009C01 1C 00            [ 1]   59     clrw y 
      009C03 02               [ 2]   60     ldw (x),y 
      009C04 81               [ 4]   61     ret
                                     62 
                                     63 ;---------------------------------
                                     64 ; return APP_LAST pointer as double
                                     65 ; EEP-LAST ( -- ud )
                                     66 ;---------------------------------
      009C05 9B EB                   67 	.word LINK 
                           001B9D    68 	LINK=.
      009C07 06                      69 	.byte 8 
      009C08 45 45 50 52 4F 4D 53    70 	.ascii "EEP-LAST"
             54
      009C0E                         71 EEPLAST:
      009C0E 90 AE 40         [ 2]   72 	subw x,#2*CELLL 
      009C11 00 1D 00 04      [ 2]   73 	ldw y,#APP_LAST 
      009C15 EF 02            [ 2]   74 	ldw (2,x),y 
      009C17 90 5F            [ 1]   75 	clrw y 
      009C19 FF               [ 2]   76 	ldw (x),y 
      009C1A 81               [ 4]   77 	ret 
                                     78 
                                     79 ;----------------------------------
                                     80 ; return APP_RUN pointer as double	
                                     81 ; EEP-RUN ( -- ud )
                                     82 ;-----------------------------------
      009C1B 9C 07                   83 	.word LINK 
                           001BB5    84 	LINK=.
      009C1D 08                      85 	.byte 7
      009C1E 45 45 50 2D 4C 41 53    86 	.ascii "EEP-RUN"
      001BBD                         87 EEPRUN:
      009C25 54 00 04         [ 2]   88 	subw x,#2*CELLL 
      009C26 90 AE 40 02      [ 2]   89 	ldw y,#APP_RUN 
      009C26 1D 00            [ 2]   90 	ldw (2,x),y 
      009C28 04 90            [ 1]   91 	clrw y 
      009C2A AE               [ 2]   92 	ldw (x),y 
      009C2B 40               [ 4]   93 	ret 
                                     94 
                                     95 ;------------------------------------
                                     96 ; return APP_CP pointer as double 
                                     97 ; EEP-CP ( -- ud )
                                     98 ;------------------------------------
      009C2C 00 EF                   99 	.word LINK
                           001BCC   100 	LINK=.
      009C2E 02                     101 	.byte 6 
      009C2F 90 5F FF 81 9C 1D      102 	.ascii "EEP-CP"
      001BD3                        103 EEPCP:
      009C35 07 45 45         [ 2]  104 	subw x,#2*CELLL 
      009C38 50 2D 52 55      [ 2]  105 	ldw y,#APP_CP  
      009C3C 4E 02            [ 2]  106 	ldw (2,x),y 
      009C3D 90 5F            [ 1]  107 	clrw y 
      009C3D 1D               [ 2]  108 	ldw (x),y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



      009C3E 00               [ 4]  109 	ret 
                                    110 
                                    111 ;------------------------------------
                                    112 ; return APP_VP pointer as double 
                                    113 ; EEP-VP ( -- ud )
                                    114 ;-------------------------------------
      009C3F 04 90                  115 	.word LINK
                           001BE2   116 	LINK=.
      009C41 AE                     117 	.byte 6
      009C42 40 02 EF 02 90 5F      118 	.ascii "EEP-VP"
      001BE9                        119 EEPVP:
      009C48 FF 81 9C         [ 2]  120 	subw x,#2*CELLL 
      009C4B 35 06 45 45      [ 2]  121 	ldw y,#APP_VP  
      009C4F 50 2D            [ 2]  122 	ldw (2,x),y 
      009C51 43 50            [ 1]  123 	clrw y 
      009C53 FF               [ 2]  124 	ldw (x),y 
      009C53 1D               [ 4]  125 	ret 
                                    126 
                                    127 ;----------------------------------
                                    128 ; update APP_LAST with LAST 
                                    129 ; UPDAT-LAST ( -- )
                                    130 ;----------------------------------
      009C54 00 04                  131 	.word LINK 
                           001BF8   132 	LINK=.
      009C56 90                     133 	.byte 10
      009C57 AE 40 04 EF 02 90 5F   134 	.ascii "UPDAT-LAST"
             FF 81 9C
      001C03                        135 UPDATLAST:
      009C61 4C 06 45         [ 4]  136 	call LAST
      009C64 45 50 2D         [ 4]  137 	call AT  
      009C67 56 50 A6         [ 4]  138 	call EEPLAST
      009C69 CC 1D F9         [ 2]  139 	jp EESTORE 
                                    140 
                                    141 ;---------------------------------
                                    142 ; update APP_RUN 
                                    143 ; UPDAT-RUN ( a -- )
                                    144 ;---------------------------------
      009C69 1D 00                  145 	.word LINK
                           001C11   146 	LINK=.
      009C6B 04                     147 	.byte 9
      009C6C 90 AE 40 06 EF 02 90   148 	.ascii "UPDAT-RUN"
             5F FF
      001C1B                        149 UPDATRUN:
      009C75 81 9C 62         [ 4]  150 	call EEPRUN
      009C78 0A 55 50         [ 2]  151 	jp EESTORE 
                                    152 	
                                    153 ;---------------------------------
                                    154 ; update APP_CP with CP 
                                    155 ; UPDAT-CP ( -- )
                                    156 ;---------------------------------
      009C7B 44 41                  157 	.word LINK 
                           001C23   158 	LINK=.
      009C7D 54                     159 	.byte 8 
      009C7E 2D 4C 41 53 54 2D 43   160 	.ascii "UPDAT-CP"
             50
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



      009C83                        161 UPDATCP:
      009C83 CD 87 8A         [ 4]  162 	call CPP 
      009C86 CD 85 77         [ 4]  163 	call AT 
      009C89 CD 9C 26         [ 4]  164 	call EEPCP 
      009C8C CC 9E 79         [ 2]  165 	jp EESTORE 
                                    166 
                                    167 ;----------------------------------
                                    168 ; update APP_VP with VP 
                                    169 ; UPDAT-VP ( -- )
                                    170 ;----------------------------------
      009C8F 9C 78                  171 	.word LINK
                           001C3A   172 	LINK=.
      009C91 09                     173 	.byte 8 
      009C92 55 50 44 41 54 2D 52   174 	.ascii "UPDAT-VP" 
             55
      001C43                        175 UPDATVP:
      009C9A 4E 06 EC         [ 4]  176 	call VPP 
      009C9B CD 04 F7         [ 4]  177 	call AT
      009C9B CD 9C 3D         [ 4]  178 	call EEPVP 
      009C9E CC 9E 79         [ 2]  179 	jp EESTORE
                                    180 	
                           000001   181 .if NUCLEO
                                    182 ;----------------------------------
                                    183 ; fetch integer at address over 65535
                                    184 ;  F@   ( ud -- n )
                                    185 ;----------------------------------
      009CA1 9C 91                  186     .word LINK 
                           001C51   187 LINK=.
      009CA3 08                     188     .byte 2
      009CA4 55 50                  189     .ascii "F@"
      001C54                        190 FARAT:
      009CA6 44 41 54         [ 4]  191     call FPSTOR
      009CA9 2D 43 50         [ 2]  192 	jp EE_READ 
                                    193 
                                    194 
                                    195 ;-------------------------------------
                                    196 ; fetch C at address over 65535 
                                    197 ; FC@ ( ud -- c)
                                    198 ;-------------------------------------
      009CAC 1C 51                  199     .word LINK
                           001C5C   200     LINK=.
      009CAC CD                     201     .byte 3 
      009CAD 87 7A CD               202     .ascii "FC@" 
      001C60                        203 FARCAT:
      009CB0 85 77 CD         [ 4]  204     call FPSTOR
      009CB3 9C 53 CC         [ 2]  205 	jp EE_CREAD  
                                    206 .endif ; NUCLEO 
                                    207 
                                    208 ;----------------------------------
                                    209 ; UNLOCK EEPROM/OPT for writing/erasing
                                    210 ; wait endlessly for FLASH_IAPSR_DUL bit.
                                    211 ;  UNLKEE   ( -- )
                                    212 ;----------------------------------
      009CB6 9E 79                  213     .word LINK 
                           001C68   214 LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      009CB8 9C                     215     .byte 6 
      009CB9 A3 08 55 50 44 41      216     .ascii "UNLKEE"
      001C6F                        217 UNLKEE:
      009CBF 54 2D 56 50      [ 1]  218 	mov FLASH_CR2,#0 
      009CC3 35 FF 50 5C      [ 1]  219 	mov FLASH_NCR2,#0xFF 
      009CC3 CD 87 6C CD      [ 1]  220 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      009CC7 85 77 CD 9C      [ 1]  221     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      009CCB 69 CC 9E 79 9C   [ 2]  222 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      009CD0 BA               [ 4]  223 	ret
                                    224 
                                    225 ;----------------------------------
                                    226 ; UNLOCK FLASH for writing/erasing
                                    227 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                    228 ; UNLKFL  ( -- )
                                    229 ;----------------------------------
      009CD1 02 46                  230     .word LINK 
                           001C87   231 LINK=. 
      009CD3 40                     232     .byte 6 
      009CD4 55 4E 4C 4B 46 4C      233     .ascii "UNLKFL"    
      001C8E                        234 UNLKFL:
      009CD4 CD 9B EF CC      [ 1]  235 	mov FLASH_CR2,#0 
      009CD8 9D 9C 9C D1      [ 1]  236 	mov FLASH_NCR2,#0xFF 
      009CDC 03 46 43 40      [ 1]  237 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      009CE0 35 AE 50 62      [ 1]  238 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      009CE0 CD 9B EF CC 9D   [ 2]  239 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      009CE5 BE               [ 4]  240 	ret
                                    241 
                                    242 ;-----------------------------
                                    243 ; UNLOCK FLASH or EEPROM 
                                    244 ; according to FPTR address 
                                    245 ;  UNLOCK ( -- )
                                    246 ;-----------------------------
      009CE6 9C DC                  247 	.word LINK 
                           001CA6   248 	LINK=.
      009CE8 06                     249 	.byte 6
      009CE9 55 4E 4C 4B 45 45      250 	.ascii "UNLOCK"
      009CEF                        251 UNLOCK:
                                    252 ; put addr[15:0] in Y, for bounds check.
      009CEF 35 00 50         [ 2]  253 	ldw y,PTR16   ; Y=addr15:0
                                    254 ; check addr[23:16], if <> 0 then it is extened flash memory
      009CF2 5B 35            [ 1]  255 	tnz FPTR 
      009CF4 FF 50            [ 1]  256 	jrne 4$
      009CF6 5C 35 AE 50      [ 2]  257     cpw y,#FLASH_BASE
      009CFA 64 35            [ 1]  258     jruge 4$
      009CFC 56 50 64 72      [ 2]  259 	cpw y,#EEPROM_BASE  
      009D00 07 50            [ 1]  260     jrult 9$
      009D02 5F FB 81 9C      [ 2]  261 	cpw y,#OPTION_END 
      009D06 E8 06            [ 1]  262 	jrugt 9$
      009D08 55 4E 4C         [ 4]  263 	call UNLKEE
      009D0B 4B               [ 4]  264 	ret 
      009D0C 46 4C 8E         [ 4]  265 4$: call UNLKFL
      009D0E 81               [ 4]  266 9$: ret 
                                    267 
                                    268 ;-------------------------
                                    269 ; LOCK write access to 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



                                    270 ; FLASH and EEPROM 
                                    271 ; LOCK ( -- )
                                    272 ;-------------------------
      009D0E 35 00                  273 	.word LINK 
                           001CD0   274 	LINK=.
      009D10 50                     275 	.byte 4 
      009D11 5B 35 FF 50            276 	.ascii "LOCK" 
      001CD5                        277 LOCK: 
      009D15 5C 35 56 50      [ 1]  278 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      009D19 62 35 AE 50      [ 1]  279 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009D1D 62               [ 4]  280 	ret 
                                    281 
                                    282 ;-------------------------
                                    283 ; increment FPTR 
                                    284 ; INC-FPTR ( -- )
                                    285 ;-------------------------
      009D1E 72 03                  286 	.word LINK 
                           001CE0   287 	LINK=. 
      009D20 50                     288 	.byte 8 
      009D21 5F FB 81 9D 07 06 55   289 	.ascii "INC-FPTR" 
             4E
      001CE9                        290 INC_FPTR:
      009D29 4C 4F            [ 1]  291 	inc PTR8 
      009D2B 43 4B            [ 1]  292 	jrne 1$
      009D2D 90 89            [ 2]  293 	pushw y 
      009D2D 90 BE 37         [ 2]  294 	ldw y,FPTR 
      009D30 3D 36            [ 1]  295 	incw y 
      009D32 26 16 90         [ 2]  296 	ldw FPTR,y
      009D35 A3 80            [ 2]  297 	popw y  
      009D37 00               [ 4]  298 1$: ret 
                                    299 
                                    300 ;------------------------------
                                    301 ; add u to FPTR 
                                    302 ; PTR+ ( u -- )
                                    303 ;------------------------------
      009D38 24 10                  304 	.word LINK 
                           001CFC   305 	LINK=.
      009D3A 90                     306 	.byte 4 
      009D3B A3 40 00 25            307 	.ascii "PTR+"
      001D01                        308 PTRPLUS:
      009D3F 0D 90            [ 1]  309 	ldw y,x 
      009D41 A3 48 7F         [ 2]  310 	addw x,#CELLL 
      009D44 22 07 CD 9C      [ 2]  311 	addw y,PTR16 
      009D48 EF 81 CD         [ 2]  312 	ldw PTR16,y  
      009D4B 9D 0E            [ 1]  313 	jrnc 1$
      009D4D 81 9D            [ 1]  314 	inc FPTR 
      009D4F 26               [ 4]  315 1$: ret 
                                    316 
                                    317 ;---------------------------------
                                    318 ; read word at address pointed FPTR
                                    319 ; increment FPTR 
                                    320 ; EE-READ ( -- w )
                                    321 ;------------------------------------
      009D50 04 4C                  322 	.word LINK 
                           001D14   323 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



      009D52 4F                     324 	.byte 7 
      009D53 43 4B 2D 52 45 41 44   325 	.ascii "EE-READ"
      009D55                        326 EE_READ:
      009D55 72 13 50         [ 2]  327 	subw x,#CELLL 
      009D58 5F 72 17 50      [ 5]  328 	ldf a,[FPTR]
      009D5C 5F 81            [ 1]  329 	ld yh,a 
      009D5E 9D 50 08         [ 4]  330 	call INC_FPTR 
      009D61 49 4E 43 2D      [ 5]  331 	ldf a,[FPTR]
      009D65 46 50 54         [ 4]  332 	call INC_FPTR 
      009D68 52 97            [ 1]  333 	ld yl,a 
      009D69 FF               [ 2]  334 	ldw (x),y 
      009D69 3C               [ 4]  335 	ret 
                                    336 
                                    337 ;---------------------------------------
                                    338 ; Read byte at address pointed by FPTR 
                                    339 ; EE-CREAD ( -- c )
                                    340 ;---------------------------------------
      009D6A 38 26                  341 	.word LINK 
                           001D35   342 	LINK=.
      009D6C 0C                     343 	.byte 8
      009D6D 90 89 90 BE 36 90 5C   344 	.ascii "EE-CREAD" 
             90
      001D3E                        345 EE_CREAD:
      009D75 BF 36 90         [ 2]  346 	subw x,#CELLL 
      009D78 85 81 9D 60      [ 5]  347 	ldf a,[FPTR]	
      009D7C 04 50 54         [ 4]  348 	call INC_FPTR
      009D7F 52 2B            [ 1]  349 	clrw y 
      009D81 90 97            [ 1]  350 	ld yl,a 
      009D81 90               [ 2]  351 	ldw (x),y 
      009D82 93               [ 4]  352 	ret 
                                    353 
                                    354 ;----------------------------
                                    355 ; write a byte at address pointed 
                                    356 ; by FPTR and increment FPTR.
                                    357 ; Expect pointer already initialized 
                                    358 ; and memory unlocked 
                                    359 ; WR-BYTE ( c -- )
                                    360 ;----------------------------
      009D83 1C 00                  361 	.word LINK 
                           001D50   362 	LINK=. 
      009D85 02                     363 	.byte 7 
      009D86 72 B9 00 37 90 BF 37   364 	.ascii "WR-BYTE" 
                                    365 
      001D58                        366 WR_BYTE:
      009D8D 24 02 3C         [ 4]  367 	call FC_XOFF
      009D90 36 81            [ 1]  368 	ldw y,x 
      009D92 9D 7C            [ 2]  369 	ldw y,(y)
      009D94 07 45 45         [ 2]  370 	addw x,#CELLL 
      009D97 2D 52            [ 1]  371 	ld a,yl
      009D99 45 41 44 36      [ 4]  372 	ldf [FPTR],a
      009D9C 72 05 50 5F FB   [ 2]  373 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009D9C 1D 00 02         [ 4]  374 	call FC_XON
      009D9F 92 BC 00         [ 2]  375 	jp INC_FPTR 
                                    376 
                                    377 ;---------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



                                    378 ; write a word at address pointed 
                                    379 ; by FPTR and increment FPTR 
                                    380 ; Expect pointer already initialzed 
                                    381 ; and memory unlocked 
                                    382 ; WR-WORD ( w -- )
                                    383 ;---------------------------------------
      009DA2 36 90                  384 	.word LINK 
                           001D75   385 	LINK=.
      009DA4 95                     386 	.byte 7 
      009DA5 CD 9D 69 92 BC 00 36   387 	.ascii "WR-WORD" 
      001D7D                        388 WR_WORD:
      009DAC CD 9D 69         [ 4]  389 	call FC_XOFF
      009DAF 90 97            [ 1]  390 	ldw y,x
      009DB1 FF 81            [ 2]  391 	ldw y,(y)
      009DB3 9D 94 08         [ 2]  392 	addw x,#CELLL 
      009DB6 45 45            [ 1]  393 	ld a,yh 
      009DB8 2D 43 52 45      [ 4]  394 	ldf [FPTR],a
      009DBC 41 44 50 5F FB   [ 2]  395 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009DBE CD 1C E9         [ 4]  396 	call INC_FPTR 
      009DBE 1D 00            [ 1]  397 	ld a,yl 
      009DC0 02 92 BC 00      [ 4]  398 	ldf [FPTR],a
      009DC4 36 CD 9D 69 90   [ 2]  399 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009DC9 5F 90 97         [ 4]  400 	call FC_XON
      009DCC FF 81 9D         [ 2]  401 	jp INC_FPTR 
                                    402 
                                    403 
                                    404 ;---------------------------------------
                                    405 ; write a byte to FLASH or EEPROM/OPTION  
                                    406 ; EEC!  (c ud -- )
                                    407 ;---------------------------------------
      009DCF B5 07                  408     .word LINK 
                           001DA8   409 	LINK=.
      009DD1 57                     410     .byte 4 
      009DD2 52 2D 42 59            411     .ascii "EEC!"
                                    412 	; local variables 
                           000001   413 	BTW = 1   ; byte to write offset on stack
                           000002   414     OPT = 2 
                           000002   415 	VSIZE = 2
      001DAD                        416 EECSTORE:
      009DD6 54 45            [ 2]  417 	sub sp,#VSIZE
      009DD8 CD 1B 6F         [ 4]  418     call FPSTOR
      009DD8 CD 84            [ 1]  419 	ld a,(1,x)
      009DDA E5               [ 1]  420 	cpl a 
      009DDB 90 93            [ 1]  421 	ld (BTW,sp),a ; byte to write 
      009DDD 90 FE            [ 1]  422 	clr (OPT,sp)  ; OPTION flag
      009DDF 1C 00 02         [ 4]  423 	call UNLOCK 
                                    424 	; check if option
      009DE2 90 9F            [ 1]  425 	tnz FPTR 
      009DE4 92 BD            [ 1]  426 	jrne 2$
      009DE6 00 36 72         [ 2]  427 	ldw y,PTR16 
      009DE9 05 50 5F FB      [ 2]  428 	cpw y,#OPTION_BASE
      009DED CD 84            [ 1]  429 	jrmi 2$
      009DEF CF CC 9D 69      [ 2]  430 	cpw y,#OPTION_END+1
      009DF3 9D D0            [ 1]  431 	jrpl 2$
      009DF5 07 57            [ 1]  432 	cpl (OPT,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



                                    433 	; OPTION WRITE require this UNLOCK 
      009DF7 52 2D 57 4F      [ 1]  434     bset FLASH_CR2,#FLASH_CR2_OPT
      009DFB 52 44 50 5C      [ 1]  435     bres FLASH_NCR2,#FLASH_CR2_OPT 
      009DFD                        436 2$: 
      009DFD CD 84 E5         [ 4]  437 	call WR_BYTE 	
      009E00 90 93            [ 1]  438 	tnz (OPT,sp)
      009E02 90 FE            [ 1]  439 	jreq 3$ 
      009E04 1C 00            [ 1]  440     ld a,(BTW,sp)
      009E06 02 90            [ 1]  441     clrw y
      009E08 9E 92            [ 1]  442 	ld yl,a 
      009E0A BD 00 36         [ 2]  443 	subw x,#CELLL 
      009E0D 72               [ 2]  444 	ldw (x),y 
      009E0E 05 50 5F         [ 4]  445 	call WR_BYTE
      001DED                        446 3$: 
      009E11 FB CD 9D         [ 4]  447 	call LOCK 
      009E14 69 90            [ 2]  448 	addw sp,#VSIZE 
      009E16 9F               [ 4]  449     ret
                                    450 
                                    451 ;------------------------------
                                    452 ; write integer in FLASH|EEPROM
                                    453 ; EE! ( n ud -- )
                                    454 ;------------------------------
      009E17 92 BD                  455 	.word LINK 
                           001DF5   456 	LINK=.
      009E19 00                     457 	.byte 3 
      009E1A 36 72 05               458 	.ascii "EE!"
      001DF9                        459 EESTORE:
      009E1D 50 5F FB         [ 4]  460 	call FPSTOR 
      009E20 CD 84 CF         [ 4]  461 	call UNLOCK 
      009E23 CC 9D            [ 1]  462 	ldw y,x 
      009E25 69 9D            [ 2]  463 	ldw y,(y)
      009E27 F5 04            [ 2]  464 	pushw y 
      009E29 45 45            [ 1]  465 	swapw y 
      009E2B 43               [ 2]  466 	ldw (x),y 
      009E2C 21 1D 58         [ 4]  467 	call WR_BYTE 
      009E2D 90 85            [ 2]  468 	popw y 
      009E2D 52 02 CD         [ 2]  469 	subw x,#CELLL
      009E30 9B               [ 2]  470 	ldw (x),y 
      009E31 EF E6 01         [ 4]  471 	call WR_BYTE
      009E34 43 6B 01         [ 2]  472 	jp LOCK 
                                    473 
                                    474 
                                    475 ;----------------------------
                                    476 ; Erase flash memory row 
                                    477 ; stm8s208 as 128 bytes rows
                                    478 ; ROW-ERASE ( ud -- )
                                    479 ;----------------------------
      009E37 0F 02                  480 	.word LINK 
                           001E19   481 	LINK=. 
      009E39 CD                     482 	.byte 9 
      009E3A 9D 2D 3D 36 26 19 90   483 	.ascii "ROW-ERASE" 
             BE 37
      001E23                        484 row_erase:
      009E43 90 A3 48         [ 4]  485 	call FC_XOFF
      009E46 00 2B 10         [ 4]  486 	call FPSTOR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



                                    487 ;code must be execute from RAM 
                                    488 ;copy routine to PAD 
      009E49 90 A3 48         [ 2]  489 	subw x,#CELLL 
      009E4C 80 2A 0A 03      [ 2]  490 	ldw y,#row_erase_proc
      009E50 02               [ 2]  491 	ldw (x),y 
      009E51 72 1E 50         [ 4]  492 	call PAD 
      009E54 5B 72 1F 50      [ 2]  493 	ldw y,#row_erase_proc_end 
      009E58 5C A2 1E 7C      [ 2]  494 	subw y,#row_erase_proc
      009E59 1D 00 02         [ 2]  495 	subw x,#CELLL 
      009E59 CD               [ 2]  496 	ldw (x),y 
      009E5A 9D D8 0D         [ 4]  497 	call CMOVE 
      001E43                        498 block_erase:
      009E5D 02 27 0D         [ 2]  499 	ldw y,FPTR+1
      009E60 7B 01 90 5F      [ 2]  500 	cpw y,#app_space 
      009E64 90 97            [ 1]  501 	jrpl erase_flash 
                                    502 ; erase EEPROM block
      009E66 1D 00 02 FF      [ 2]  503 	cpw y,#EEPROM_BASE 
      009E6A CD 9D            [ 1]  504 	jruge 1$
      009E6C D8 04 4F         [ 4]  505 	call FC_XON
      009E6D 81               [ 4]  506 	ret ; bad address 
      009E6D CD 9D 55 5B      [ 2]  507 1$: cpw y,#EEPROM_END 
      009E71 02 81            [ 2]  508 	jrule 2$ 
      009E73 9E 28 03         [ 4]  509 	call FC_XON
      009E76 45               [ 4]  510 	ret ; bad address 
      001E60                        511 2$:	
      009E77 45 21 6F         [ 4]  512 	call UNLKEE 
      009E79 20 03            [ 2]  513 	jra proceed_erase
                                    514 ; erase flash block:
      001E65                        515 erase_flash:
      009E79 CD 9B EF         [ 4]  516 	call UNLKFL 
      001E68                        517 proceed_erase:
      009E7C CD 9D 2D         [ 4]  518 	call PAD 
      009E7F 90 93            [ 1]  519 	ldw y,x
      009E81 90 FE            [ 2]  520 	ldw y,(y)
      009E83 90 89 90         [ 2]  521 	addw x,#CELLL  
      009E86 5E FF            [ 4]  522 	call (y) 
      009E88 CD 9D D8 90      [ 1]  523 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009E8C 85 1D 00         [ 4]  524 	call FC_XON
      009E8F 02               [ 4]  525 	ret 
                                    526 
                                    527 ; this routine is to be copied to PAD 
      001E7C                        528 row_erase_proc:
      009E90 FF CD 9D D8      [ 1]  529 	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
      009E94 CC 9D 55 9E      [ 1]  530 	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
      009E98 75               [ 1]  531 	clr a 
      009E99 09 52            [ 1]  532 	clrw y 
      009E9B 4F 57 2D 45      [ 1]  533 	ldf ([FPTR],y),a
      009E9F 52 41            [ 1]  534     incw y
      009EA1 53 45 00 36      [ 1]  535 	ldf ([FPTR],y),a
      009EA3 90 5C            [ 1]  536     incw y
      009EA3 CD 84 E5 CD      [ 1]  537 	ldf ([FPTR],y),a
      009EA7 9B EF            [ 1]  538     incw y
      009EA9 1D 00 02 90      [ 1]  539 	ldf ([FPTR],y),a
      009EAD AE 9E FC FF CD   [ 2]  540 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009EB2 8C               [ 4]  541 	ret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



      001EA3                        542 row_erase_proc_end:
                                    543 
                                    544 
                                    545 ;-----------------------------------
                                    546 ; block programming must be 
                                    547 ; executed from RAM 
                                    548 ; initial contidions: 
                                    549 ; 		memory unlocked
                                    550 ;       FPTR initialized 
                                    551 ; input: 
                                    552 ;    x   buffer address 
                                    553 ;-----------------------------------
                           000001   554 	BCNT=1 
      001EA3                        555 copy_buffer:
      009EB3 82 90            [ 1]  556 	push #BLOCK_SIZE  
                                    557 ;enable block programming 
      009EB5 AE 9F 23 72      [ 1]  558 	bset FLASH_CR2,#FLASH_CR2_PRG 
      009EB9 A2 9E FC 1D      [ 1]  559 	bres FLASH_NCR2,#FLASH_CR2_PRG
      009EBD 00 02            [ 1]  560 	clrw y
      009EBF FF               [ 1]  561 1$:	ld a,(x)
      009EC0 CD 8C BE 36      [ 1]  562 	ldf ([FPTR],y),a
      009EC3 5C               [ 1]  563 	incw x 
      009EC3 90 BE            [ 1]  564 	incw y 
      009EC5 37 90            [ 1]  565 	dec (BCNT,sp)
      009EC7 A3 AB            [ 1]  566 	jrne 1$
                                    567 ; wait EOP bit 
      009EC9 00 2A 19 90 A3   [ 2]  568 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. 
      009ECE 40               [ 1]  569 	pop a ; remove BCNT from stack 
      009ECF 00               [ 4]  570 	ret 
      001EC2                        571 copy_buffer_end:
                                    572 
                                    573 ;-------------------------
                                    574 ; move program_row to RAM 
                                    575 ; in TIB 
                                    576 ;------------------------
      001EC2                        577 copy_prog_to_ram:
      009ED0 24 04 CD         [ 2]  578 	subw x,#6
      009ED3 84 CF 81 90      [ 2]  579 	ldw y,#copy_buffer 
      009ED7 A3 47            [ 2]  580 	ldw (4,x),y 
      009ED9 FF 23 04 CD      [ 2]  581 	ldw y,#TIBBASE
      009EDD 84 CF            [ 2]  582 	ldw (2,x),y 
      009EDF 81 AE 1E C2      [ 2]  583 	ldw y,#copy_buffer_end 
      009EE0 72 A2 1E A3      [ 2]  584 	subw y,#copy_buffer  
      009EE0 CD               [ 2]  585 	ldw (x),y 
      009EE1 9C EF 20         [ 4]  586 	call CMOVE 
      009EE4 03               [ 4]  587 	ret 
                                    588 
                                    589 
                                    590 ;-----------------------------
                                    591 ; write a row in FLASH/EEPROM 
                                    592 ; WR-ROW ( a ud -- )
                                    593 ; a -> address 128 byte buffer to write 
                                    594 ; ud ->  row address in FLASH|EEPROM 
                                    595 ;-----------------------------
      009EE5 1E 19                  596 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



                           001EE0   597 	LINK=.
      009EE5 CD                     598 	.byte 6 
      009EE6 9D 0E 2D 52 4F 57      599 	.ascii "WR-ROW"
      009EE8                        600 write_row:
      009EE8 CD 8C 82         [ 4]  601 	call FC_XOFF
      009EEB 90 93 90         [ 4]  602 	call FPSTOR
                                    603 ; align to FLASH block 
      009EEE FE 1C            [ 1]  604 	ld a,#0x80 
      009EF0 00 02            [ 1]  605 	and a,PTR8 
      009EF2 90 FD            [ 1]  606 	ld PTR8,a  
      009EF4 72 17 50         [ 4]  607 	call copy_prog_to_ram
      009EF7 5F CD 84         [ 4]  608 	call UNLOCK
      009EFA CF 81            [ 1]  609 	ldw y,x 
      009EFC 90 FE            [ 2]  610 	ldw y,(y)
      009EFC 35 20 50         [ 2]  611 	addw x,#CELLL 
      009EFF 5B               [ 2]  612 	pushw x 
      009F00 35               [ 1]  613 	ldw x,y ; buffer address in x 
      009F01 DF 50 5C         [ 4]  614 	call TIBBASE
      009F04 4F 90 5F         [ 4]  615 	call LOCK
      009F07 91               [ 2]  616 	popw x 
      009F08 A7 00 36         [ 4]  617 	call FC_XON 
      009F0B 90               [ 4]  618 	ret 
                                    619 
                                    620 ;-------------------------------------
                                    621 ; change value of OPTION register 
                                    622 ; SET-OPT (c n -- ) 
                                    623 ; c new value.
                                    624 ; n OPT  number {1..7}
                                    625 ;--------------------------------------
      009F0C 5C 91                  626 		.word LINK 
                           001F0F   627 		LINK=.
      009F0E A7                     628 		.byte 7 
      009F0F 00 36 90 5C 91 A7 00   629 		.ascii "SET-OPT" 
      001F17                        630 set_option: 
      009F16 36 90            [ 1]  631 		ldw y,x 
      009F18 5C 91            [ 2]  632 		ldw y,(y)
      009F1A A7 00            [ 1]  633 		jreq 1$
      009F1C 36 72 05 50      [ 2]  634 		cpw y,#7 
      009F20 5F FB            [ 2]  635 		jrule 2$ 
                                    636 ; invalid OPTION number 		
      009F22 81 00 04         [ 2]  637 1$:		addw x,#2*CELLL
      009F23 81               [ 4]  638 		ret
      009F23 90 58            [ 2]  639 2$:		sllw y 
      009F23 4B 80 72 10      [ 2]  640 		addw y,#OPTION_BASE-1
      009F27 50               [ 2]  641 		ldw (x),y 
      009F28 5B 72 11         [ 2]  642 		subw x,#CELLL 
      009F2B 50 5C            [ 1]  643 		clrw y 
      009F2D 90               [ 2]  644 		ldw (x),y 
      009F2E 5F F6 91         [ 4]  645 		call EECSTORE
      009F31 A7               [ 4]  646 		ret 
                                    647 
                                    648 
                                    649 
                                    650 ;--------------------------------------
                                    651 ; reset system to its original state 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



                                    652 ; before any user modification
                                    653 ; PRISTINE ( -- )
                                    654 ;-------------------------------------
      009F32 00 36                  655 	.word LINK  
                           001F3A   656 	LINK=.
      009F34 5C                     657 	.byte 8 
      009F35 90 5C 0A 01 26 F4 72   658 	.ascii "PRISTINE"
             05
      001F43                        659 pristine:
                                    660 ;;; erase EEPROM
      009F3D 50 5F FB         [ 4]  661 	call EEPROM 
      009F40 84 81 84         [ 4]  662 1$:	call DDUP 
      009F42 CD 1E 23         [ 4]  663 	call row_erase
      009F42 90 93            [ 1]  664 	ldw y,x 
      009F42 1D 00 06         [ 2]  665 	ldw y,(2,y)
      009F45 90 AE 9F 23      [ 2]  666 	addw y,#BLOCK_SIZE
      009F49 EF 04            [ 2]  667 	ldw (2,x),y
      009F4B 90 AE 17 00      [ 2]  668 	cpw y,#OPTION_BASE 
      009F4F EF 02            [ 1]  669 	jrult 1$
                                    670 ;;; reset OPTION to default values
      009F51 90 AE 9F 42      [ 2]  671 	ldw y,#1 ; OPT1 
      009F55 72               [ 2]  672 2$:	ldw (x),y   
      009F56 A2 9F            [ 1]  673 	clrw y 
      009F58 23 FF            [ 2]  674 	ldw (2,x),y  ; ( 0 1 -- ) 
      009F5A CD 8C BE         [ 4]  675 	call DDUP    ; ( 0 1 0 1 -- )  
      009F5D 81 9E 99         [ 4]  676 	call set_option
      009F60 06 57            [ 1]  677 	ldw y,x 
      009F62 52 2D            [ 2]  678 	ldw y,(y)
      009F64 52 4F            [ 1]  679 	incw y  ; next OPTION 
      009F66 57 A3 00 08      [ 2]  680 	cpw y,#8 
      009F67 25 E9            [ 1]  681 	jrult 2$
                                    682 ;;; erase first row of app_space 	
      009F67 CD 84 E5 CD      [ 2]  683 	ldw y,#app_space
      009F6B 9B EF            [ 2]  684 	ldw (2,x),y  
      009F6D A6 80            [ 1]  685 	clrw y 
      009F6F B4               [ 2]  686 	ldw (x),y ; ( app_space 0 -- )
      009F70 38 B7 38         [ 4]  687 	call row_erase 
                                    688 ; reset interrupt vectors 
      009F73 CD 9F 42         [ 2]  689 	subw x,#CELLL 
      009F76 CD 9D            [ 1]  690 	clrw y  
      009F78 2D               [ 2]  691 4$:	ldw (x),y  ; ( n -- ) int# 
      009F79 90 93 90         [ 4]  692 	call DUPP  
      009F7C FE 1C 00         [ 4]  693 	call reset_vector
      009F7F 02 89            [ 1]  694 	ldw y,x 
      009F81 93 CD            [ 2]  695 	ldw y,(y)
      009F83 17 00            [ 1]  696 	incw y   ; next vector 
      009F85 CD 9D 55 85      [ 2]  697 	cpw y,#25 
      009F89 CD 84            [ 1]  698 	jrult 4$
      009F8B CF 81 9F         [ 2]  699 	jp NonHandledInterrupt ; reset MCU
                                    700 
                                    701 ;------------------------------
                                    702 ; reset an interrupt vector 
                                    703 ; to its initial value 
                                    704 ; i.e. NonHandledInterrupt
                                    705 ; RST-IVEC ( n -- )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



                                    706 ;-----------------------------
      009F8E 60 07                  707 	.word LINK 
                           001FA1   708 	LINK=. 
      009F90 53                     709 	.byte 8 
      009F91 45 54 2D 4F 50 54 45   710 	.ascii "RST-IVEC"
             43
      009F97                        711 reset_vector:
      009F97 90 93            [ 1]  712 	ldw y,x
      009F99 90 FE 27         [ 2]  713 	addw x,#CELLL 
      009F9C 06 90            [ 2]  714 	ldw y,(y)
      009F9E A3 00 07 23      [ 2]  715 	cpw y,#23 
      009FA2 04 1C            [ 1]  716 	jreq 9$
      009FA4 00 04 81 90      [ 2]  717 	cpw y,#29 ; last vector
      009FA8 58 72            [ 1]  718 	jrugt 9$  
      009FAA A9 47            [ 2]  719 	sllw y 
      009FAC FF FF            [ 2]  720 	sllw y 
      009FAE 1D 00 02 90      [ 2]  721 	addw y,#0x8008 ; irq0 address 
      009FB2 5F FF CD         [ 2]  722 	ldw YTEMP,y
      009FB5 9E 2D 81         [ 2]  723 	subw x,#3*CELLL 
      009FB8 9F 8F            [ 2]  724 	ldw (2,x),y 
      009FBA 08 50            [ 1]  725 	clrw y
      009FBC 52               [ 2]  726 	ldw (x),y 
      009FBD 49 53            [ 1]  727 	ld a,#0x82 
      009FBF 54 49            [ 1]  728 	ld yh,a
      009FC1 4E 45            [ 2]  729 	ldw (4,x),y
      009FC3 CD 1D F9         [ 4]  730 	call EESTORE
      009FC3 CD 9C 0E         [ 2]  731 	subw x,#3*CELLL
      009FC6 CD 88            [ 1]  732 	clrw y 
      009FC8 04               [ 2]  733 	ldw (x),y 
      009FC9 CD 9E A3 90      [ 2]  734 	ldw y,#NonHandledInterrupt
      009FCD 93 90            [ 2]  735 	ldw (4,x),y 
      009FCF EE 02 72         [ 2]  736 	ldw y,YTEMP  
      009FD2 A9 00 80 EF      [ 2]  737 	addw y,#2
      009FD6 02 90            [ 2]  738 	ldw (2,x),y 
      009FD8 A3 48 00         [ 4]  739 	call EESTORE
      009FDB 25               [ 4]  740 9$:	ret 
                                    741 
                                    742 
                                    743 ;------------------------------
                                    744 ; all interrupt vector with 
                                    745 ; an address >= a are resetted 
                                    746 ; to default
                                    747 ; CHKIVEC ( a -- )
                                    748 ;------------------------------
      009FDC E9 90                  749 	.word LINK 
                           001FF4   750 	LINK=.
      009FDE AE                     751 	.byte 7
      009FDF 00 01 FF 90 5F EF 02   752 	.ascii "CHKIVEC"
                                    753 ;local variables 
                           000001   754 	SSP=1
                           000003   755 	CADR=3
                           000005   756 	OFS=5
                           000006   757 	VSIZE=6  
      001FFC                        758 CHKIVEC:
      009FE6 CD 88            [ 2]  759 	sub sp,#VSIZE ;alloc local variables 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



      009FE8 04 CD            [ 1]  760 	ldw y,x 
      009FEA 9F 97            [ 2]  761 	ldw y,(y)
      009FEC 90 93            [ 2]  762 	ldw (CADR,sp),y ; ca 
      009FEE 90 FE            [ 2]  763 	ldw (SSP,sp),x 
      009FF0 90 5C 90         [ 2]  764 	ldw x,#0x800a ; irq0 address 
      009FF3 A3 00            [ 2]  765 	ldw PTR16,X
      009FF5 08 25 E9         [ 2]  766 	ldw x,#-4 
      009FF8 90 AE AB         [ 2]  767 1$:	addw x,#4
      009FFB 00 EF 02         [ 2]  768 	cpw x,#30*4 ; irq0-29 
      009FFE 90 5F            [ 1]  769 	jreq 9$
      00A000 FF CD            [ 1]  770 	ldw y,x  
      00A002 9E A3 1D         [ 4]  771 	ld a,([PTR16],y)
      00A005 00 02            [ 1]  772 	cp a,(CADR,sp)
      00A007 90 5F            [ 1]  773 	jrult 1$
      00A009 FF CD            [ 1]  774 	incw y 
      00A00B 86 1E CD         [ 4]  775 	ld a,([PTR16],y)
      00A00E A0 2A            [ 1]  776 	cp a,(CADR+1,sp) 
      00A010 90 93            [ 1]  777 	jrult 1$ 
      00A012 90 FE            [ 2]  778 	ldw (OFS,sp),x 
      00A014 90               [ 2]  779 	srlw x
      00A015 5C               [ 2]  780 	srlw x 
      00A016 90 A3            [ 1]  781 	ldw y,x 
      00A018 00 19            [ 2]  782 	ldw x,(SSP,sp)
      00A01A 25               [ 2]  783 	ldw (x),y
      00A01B ED CC 80         [ 4]  784 	call reset_vector
      00A01E 80 9F            [ 2]  785 	ldw x,(OFS,sp) 
      00A020 BA 08            [ 2]  786 	jra 1$
      00A022 52 53            [ 2]  787 9$:	ldw x,(SSP,sp) 
      00A024 54 2D 49         [ 2]  788 	addw x,#CELLL 
      00A027 56 45            [ 2]  789 	addw sp,#VSIZE ; drop local variables  
      00A029 43               [ 4]  790 	ret 
                                    791 
                                    792 ;------------------------------
                                    793 ; set interrupt vector 
                                    794 ; SET-IVEC ( ud n -- )
                                    795 ;  ud Handler address
                                    796 ;  n  vector # 0 .. 29 
                                    797 ;-----------------------------
      00A02A 1F F4                  798 	.word LINK
                           002042   799 	LINK=.
      00A02A 90                     800 	.byte 8 
      00A02B 93 1C 00 02 90 FE 90   801 	.ascii "SET-IVEC" 
             A3
      00204B                        802 set_vector:
      00A033 00 17            [ 1]  803     ldw y,x 
      00A035 27 3A 90         [ 2]  804 	addw x,#CELLL 
      00A038 A3 00            [ 2]  805 	ldw y,(y) ; vector #
      00A03A 1D 22 34 90      [ 2]  806 	cpw y,#29 ; last vector
      00A03E 58 90            [ 2]  807 	jrule 2$
      00A040 58 72 A9         [ 2]  808 	addw x,#2*CELLL 
      00A043 80               [ 4]  809 	ret
      00A044 08 90            [ 2]  810 2$:	sllw y 
      00A046 BF 28            [ 2]  811 	sllw y 
      00A048 1D 00 06 EF      [ 2]  812 	addw y,#0X8008 ; IRQ0 vector address 
      00A04C 02 90 5F         [ 2]  813 	ldw YTEMP,y ; vector address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



      00A04F FF A6            [ 1]  814 	ld a,#0x82 
      00A051 82 90            [ 1]  815 	ld yh,a 
      00A053 95 EF            [ 1]  816 	ld a,(1,x) ; isr address bits 23..16 
      00A055 04 CD            [ 1]  817 	ld yl,a 
                                    818 ;  write 0x82 + most significant byte of int address	
      00A057 9E 79 1D         [ 2]  819 	subw x,#3*CELLL 
      00A05A 00 06            [ 2]  820 	ldw (4,x),y 
      00A05C 90 5F FF         [ 2]  821 	ldw y,YTEMP
      00A05F 90 AE            [ 2]  822 	ldw (2,x),y ; vector address 
      00A061 80 80            [ 1]  823 	clrw y 
      00A063 EF               [ 2]  824 	ldw (x),y   ; as a double 
      00A064 04 90 BE         [ 4]  825 	call EESTORE 
      00A067 28 72            [ 1]  826 	ldw y,x 
      00A069 A9 00 02         [ 2]  827 	ldw y,(2,y) ; bits 15..0 int vector 
      00A06C EF 02 CD         [ 2]  828 	subw x,#3*CELLL 
      00A06F 9E 79            [ 2]  829 	ldw (4,x),y 
      00A071 81 A0 21         [ 2]  830 	ldw y,YTEMP 
      00A074 07 43 48 4B      [ 2]  831 	addw y,#2 
      00A078 49 56            [ 2]  832 	ldw (2,x),y 
      00A07A 45 43            [ 1]  833 	clrw y 
      00A07C FF               [ 2]  834 	ldw (x),y 
      00A07C 52 06 90         [ 4]  835 	call EESTORE
      00A07F 93 90 FE         [ 2]  836 	addw x,#2*CELLL  
      00A082 17               [ 4]  837 9$: ret 
                                    838 
                                    839 
                                    840 ;------------------------
                                    841 ; Compile word to flash
                                    842 ; EE, (w -- )
                                    843 ;-----------------------
      00A083 03 1F                  844 	.word LINK
                           00209E   845 	LINK=.
      00A085 01                     846 	.byte 3
      00A086 AE 80 0A               847 	.ascii "EE,"
      0020A2                        848 EE_COMMA:
      00A089 BF 37 AE         [ 2]  849 	subw x,#2*CELLL 
      00A08C FF FC 1C         [ 2]  850 	ldw y,UCP
      00A08F 00 04            [ 2]  851 	pushw y 
      00A091 A3 00            [ 2]  852 	ldw (2,x),y 
      00A093 78 27            [ 1]  853 	clrw y 
      00A095 22               [ 2]  854 	ldw (x),y
      00A096 90 93 91         [ 4]  855 	call EESTORE
      00A099 D6 37            [ 2]  856 	popw y 
      00A09B 11 03 25 EF      [ 2]  857 	addw y,#2
      00A09F 90 5C 91         [ 2]  858 	ldw UCP,y
      00A0A2 D6               [ 4]  859 	ret 
                                    860 
                                    861 
                                    862 ;-------------------------
                                    863 ; Compile byte to flash 
                                    864 ; EEC, ( c -- )	
                                    865 ;-------------------------
      00A0A3 37 11                  866 	.word LINK 
                           0020BE   867 	LINK=.
      00A0A5 04                     868 	.byte 4 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      00A0A6 25 E6 1F 05            869 	.ascii "EEC,"
      0020C3                        870 EE_CCOMMA:
      00A0AA 54 54 90         [ 2]  871 	subw x,#2*CELLL 
      00A0AD 93 1E 01         [ 2]  872 	ldw y,UCP
      00A0B0 FF CD            [ 2]  873 	pushw y 
      00A0B2 A0 2A            [ 2]  874 	ldw (2,x),y 
      00A0B4 1E 05            [ 1]  875 	clrw y 
      00A0B6 20               [ 2]  876 	ldw (x),y
      00A0B7 D6 1E 01         [ 4]  877 	call EECSTORE
      00A0BA 1C 00            [ 2]  878 	popw y 
      00A0BC 02 5B            [ 1]  879 	incw y 
      00A0BE 06 81 A0         [ 2]  880 	ldw UCP,y
      00A0C1 74               [ 4]  881 	ret 
                                    882 
                                    883 
                                    884 ;--------------------------
                                    885 ; copy FLASH block to ROWBUF
                                    886 ; ROW>BUF ( ud -- )
                                    887 ;--------------------------
      00A0C2 08 53                  888 	.word LINK 
                           0020DD   889 	LINK=.
      00A0C4 45                     890 	.byte 7 
      00A0C5 54 2D 49 56 45 43 46   891 	.ascii "ROW>BUF"
      00A0CB                        892 ROW2BUF: 
      00A0CB 90 93 1C         [ 4]  893 	call FPSTOR 
      00A0CE 00 02            [ 1]  894 	ld a,#BLOCK_SIZE
      00A0D0 90               [ 1]  895 	push a 
      00A0D1 FE 90            [ 1]  896 	and a,PTR8 ; block align 
      00A0D3 A3 00            [ 1]  897 	ld PTR8,a
      00A0D5 1D 23 04 1C      [ 2]  898 	ldw y,#ROWBUFF 
      00A0D9 00 04 81 90      [ 5]  899 1$: ldf a,[FPTR]
      00A0DD 58 90            [ 1]  900 	ld (y),a
      00A0DF 58 72 A9         [ 4]  901 	call INC_FPTR
      00A0E2 80 08            [ 1]  902 	incw y 
      00A0E4 90 BF            [ 1]  903 	dec (1,sp)
      00A0E6 28 A6            [ 1]  904 	jrne 1$ 
      00A0E8 82               [ 1]  905 	pop a 
      00A0E9 90               [ 4]  906 	ret 
                                    907 
                                    908 
                                    909 ;---------------------------
                                    910 ; copy ROWBUFF to flash 
                                    911 ; BUF>ROW ( ud -- )
                                    912 ; ud is row address as double 
                                    913 ;---------------------------
      00A0EA 95 E6                  914 	.word LINK 
                           002106   915 	LINK=.
      00A0EC 01                     916 	.byte 7 
      00A0ED 90 97 1D 00 06 EF 04   917 	.ascii "BUF>ROW" 
      00210E                        918 BUF2ROW:
      00A0F4 90 BE 28         [ 4]  919 	call TBUF ; ( ud rb -- )
      00A0F7 EF 02 90         [ 4]  920 	call ROT 
      00A0FA 5F FF CD         [ 4]  921 	call ROT  ; ( rb ud -- )
      00A0FD 9E 79 90         [ 4]  922 	call write_row 
      00A100 93               [ 4]  923 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



                                    924 
                                    925 ;---------------------------------
                                    926 ; how many byte free in that row 
                                    927 ; RFREE ( a -- n )
                                    928 ; a is least byte of target address
                                    929 ;----------------------------------
      00A101 90 EE                  930 	.word LINK 
                           00211D   931 	LINK=.
      00A103 02                     932 	.byte 5 
      00A104 1D 00 06 EF 04         933 	.ascii "RFREE"
      002123                        934 RFREE:
      00A109 90 BE            [ 1]  935 	ld a,(1,x)
      00A10B 28 72            [ 1]  936 	and a,#BLOCK_SIZE-1 
      00A10D A9 00            [ 1]  937 	ld YTEMP,a 
      00A10F 02 EF            [ 1]  938 	ld a,#BLOCK_SIZE 
      00A111 02 90            [ 1]  939 	sub a,YTEMP 
      00A113 5F FF            [ 1]  940 	clrw y 
      00A115 CD 9E            [ 1]  941 	ld yl,a
      00A117 79               [ 2]  942 	ldw (x),y 
      00A118 1C               [ 4]  943 	ret 
                                    944 
                                    945 ;---------------------------------
                                    946 ; write u bytes to flash/EEPROM 
                                    947 ; constraint to row limit 
                                    948 ; RAM>EE ( ud a u -- u2 )
                                    949 ; ud flash address 
                                    950 ; a ram address 
                                    951 ; u bytes count
                                    952 ; return u2 bytes written  
                                    953 ;-------------------------------
      00A119 00 04                  954 	.word LINK 
                           002135   955 	LINK=. 
      00A11B 81                     956 	.byte 6
      00A11C A0 C2 03 45 45 2C      957 	.ascii "RAM>EE"
                                    958 	
      00A122                        959 RAM2EE:
                                    960 ; copy ud on top 
      00A122 1D 00            [ 1]  961 	ldw y,x 
      00A124 04 90 BE         [ 2]  962 	ldw y,(6,y) ; LSW of ud  
      00A127 1C 90 89         [ 2]  963 	ldw YTEMP,y 
      00A12A EF 02            [ 1]  964 	ldw y,x 
      00A12C 90 5F FF         [ 2]  965 	ldw y,(4,y)  ; MSW of ud 
      00A12F CD 9E 79         [ 2]  966 	subw x,#2*CELLL 
      00A132 90               [ 2]  967 	ldw (x),y 
      00A133 85 72 A9         [ 2]  968 	ldw y,YTEMP 
      00A136 00 02            [ 2]  969 	ldw (2,x),y 
      00A138 90 BF 1C         [ 4]  970 	call ROW2BUF 
      00A13B 81 A1            [ 1]  971 	ldw y,x 
      00A13D 1E 04 45         [ 2]  972 	ldw y,(6,y)
      00A140 45 43            [ 2]  973 	pushw y ; udl 
      00A142 2C 9F            [ 1]  974 	ld a,yl
      00A143 A4 7F            [ 1]  975 	and a,#BLOCK_SIZE-1 
      00A143 1D 00            [ 1]  976 	clrw y 
      00A145 04 90            [ 1]  977 	ld yl,a 
      00A147 BE 1C 90 89      [ 2]  978 	addw y,#ROWBUFF 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



      00A14B EF 02 90         [ 2]  979 	subw x,#CELLL 
      00A14E 5F               [ 2]  980 	ldw (x),y  
      00A14F FF CD 9E         [ 4]  981 	call SWAPP ;  ( ud a ra u -- )
      00A152 2D 90 85         [ 4]  982 	call RFROM  
      00A155 90 5C 90         [ 4]  983 	call RFREE 
      00A158 BF 1C 81         [ 4]  984 	call MIN
      00A15B A1 3E 07         [ 4]  985 	call DUPP 
      00A15E 52 4F 57         [ 4]  986 	call TOR  
      00A161 3E 42 55         [ 4]  987 	call CMOVE
      00A164 46 21 0E         [ 4]  988 	call BUF2ROW 
      00A165 CD 05 48         [ 4]  989 	call RFROM 
      00A165 CD               [ 4]  990 	ret 
                                    991 
                                    992 
                                    993 ;--------------------------
                                    994 ; expand 16 bit address 
                                    995 ; to 32 bit address 
                                    996 ; FADDR ( a -- ud )
                                    997 ;--------------------------
      00A166 9B EF                  998 	.word LINK 
                           00218A   999 	LINK=. 
      00A168 A6                    1000 	.byte 5 
      00A169 80 88 B4 38 B7        1001 	.ascii "FADDR"
      002190                       1002 FADDR:
      00A16E 38 90 AE         [ 2] 1003 	jp ZERO 
                                   1004 
                                   1005 
                                   1006 ;--------------------------
                                   1007 ; move new colon definition to FLASH 
                                   1008 ; using WR-ROW for efficiency 
                                   1009 ; preserving bytes already used 
                                   1010 ; in the current block. 
                                   1011 ; At this point the compiler as completed
                                   1012 ; in RAM and pointers CP and CNTXT updated.
                                   1013 ; CNTXT point to nfa of new word and  
                                   1014 ; CP is after compiled word so CP-CNTXT+2=count to write 
                                   1015 ; 
                                   1016 ; FMOVE ( -- cp+ )
                                   1017 ; 
                                   1018 ;--------------------------
      00A171 16 80                 1019 	.word LINK 
                           002195  1020 	LINK=.
      00A173 92                    1021 	.byte 5 
      00A174 BC 00 36 90 F7        1022 	.ascii "FMOVE" 
      00219B                       1023 FMOVE:
      00A179 CD 9D 69         [ 4] 1024 	call TFLASH 
      00A17C 90 5C 0A         [ 4] 1025 	CALL AT 
      00A17F 01 26 F1         [ 4] 1026 	CALL QBRAN 
      00A182 84 81                 1027 	.word no_move  
      00A184 A1 5D 07         [ 4] 1028 	call CPP
      00A187 42 55 46         [ 4] 1029 	call AT  
      00A18A 3E 52 4F         [ 4] 1030 	call DUPP ; ( udl udl -- )
      00A18D 57 06 DE         [ 4] 1031 	call CNTXT 
      00A18E CD 04 F7         [ 4] 1032 	call AT 
      00A18E CD 87 19         [ 4] 1033 	call DOLIT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



      00A191 CD 87                 1034 	.word 2 
      00A193 D9 CD 87         [ 4] 1035 	call SUBB ; ( udl udl a -- )
      00A196 D9 CD 9F         [ 4] 1036 	call SWAPP 
      00A199 67 81 A1         [ 4] 1037 	call FADDR 
      00A19C 86 05 52         [ 4] 1038 	call ROT  ; ( udl ud a -- )
      00A19F 46 52 45         [ 4] 1039 	call DUPP 
      00A1A2 45 05 67         [ 4] 1040 	call TOR    ; R: a 
      00A1A3                       1041 FMOVE2: 
      00A1A3 E6 01 A4         [ 4] 1042 	call HERE 
      00A1A6 7F B7 28         [ 4] 1043 	call RAT 
      00A1A9 A6 80 B0         [ 4] 1044 	call SUBB ; (udl ud a wl -- )
      0021D5                       1045 next_row:
      00A1AC 28 90 5F         [ 4] 1046 	call DUPP 
      00A1AF 90 97 FF         [ 4] 1047 	call TOR  ; ( udl ud a wl -- ) R: a wl
      00A1B2 81 A1 9D         [ 4] 1048 	call RAM2EE ; ( udl a u -- udl u2 ) u2 is byte written to FLASH 
      00A1B5 06 52 41         [ 4] 1049 	call DUPP 
      00A1B8 4D 3E 45         [ 4] 1050 	call TOR
      00A1BB 45 07 99         [ 4] 1051 	call PLUS  ; ( udl+ ) 
      00A1BC CD 05 9E         [ 4] 1052 	call DUPP 
      00A1BC 90 93 90         [ 4] 1053 	call ZERO   ; ( udl+ ud -- )
      00A1BF EE 06 90         [ 4] 1054 	call RFROM  ; ( udl+ ud u2  R: a wl ) 
      00A1C2 BF 28 90         [ 4] 1055 	call RFROM  ; ( udl+ ud u2 wl R: a ) 
      00A1C5 93 90 EE         [ 4] 1056 	call OVER   ; ( udl+ ud u2 wl u2 -- )
      00A1C8 04 1D 00         [ 4] 1057 	call SUBB  ; ( udl+ ud u2 wl- R: a )
      00A1CB 04 FF 90         [ 4] 1058 	call DUPP 
      00A1CE BE 28 EF         [ 4] 1059 	call QBRAN
      00A1D1 02 CD                 1060 	.word fmove_done 
      00A1D3 A1 65 90         [ 4] 1061 	call SWAPP  ; ( udl+ ud wl- u2 R: a )
      00A1D6 93 90 EE         [ 4] 1062 	call RFROM ; ( udl+ ud wl- u2 a -- ) 
      00A1D9 06 90 89         [ 4] 1063 	call PLUS  ; ( udl+2 ud wl- a+ )
      00A1DC 90 9F A4         [ 4] 1064 	call DUPP 
      00A1DF 7F 90 5F         [ 4] 1065 	call TOR   ; ( udl+2 ud wl- a+ ) R: a+
      00A1E2 90 97 72         [ 4] 1066 	call SWAPP 
      00A1E5 A9 16 80         [ 4] 1067 	call BRAN
      00A1E8 1D 00                 1068 	.word next_row  
      002218                       1069 fmove_done:	
      00A1EA 02 FF CD         [ 4] 1070 	call RFROM  ; ( -- udl+ ud u2 wl- a  )
      00A1ED 86 2E CD         [ 2] 1071 	addw x,#5*CELLL ; (  -- cp+ ) new CP 
      00A1F0 85               [ 4] 1072  	ret  
      00221F                       1073 no_move:
      00A1F1 C8 CD A1         [ 4] 1074 	call ZERO
      00A1F4 A3               [ 4] 1075 	ret 
                                   1076 
                                   1077 ;------------------------------------------
                                   1078 ; adjust pointers after **FMOVE** operetion.
                                   1079 ; UPDAT-PTR ( cp+ -- )
                                   1080 ; cp+ is new CP position after FMOVE 
                                   1081 ;-------------------------------------------
      00A1F5 CD 89                 1082 	.word LINK 
                           002225  1083 	LINK=.
      00A1F7 52                    1084 	.byte 9
      00A1F8 CD 86 1E CD 85 E7 CD  1085 	.ascii "UPDAT-PTR" 
             8C BE
      00222F                       1086 UPDATPTR:
                                   1087 ;reset VP to previous position  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



      00A201 CD A1 8E         [ 4] 1088 	call EEPVP 
      00A204 CD 85 C8         [ 4] 1089 	call DROP 
      00A207 81 A1 B5         [ 4] 1090 	call AT
      00A20A 05 46 41         [ 4] 1091 	call VPP 
      00A20D 44 44 52         [ 4] 1092 	call STORE
                                   1093 ;update CONTEXT and LAST 
      00A210 CD 1B D3         [ 4] 1094 	call EEPCP 
      00A210 CC 8B 83         [ 4] 1095 	call DROP
      00A213 A2 0A 05         [ 4] 1096 	call AT
      00A216 46 4D 4F         [ 4] 1097 	call DOLIT 
      00A219 56 45                 1098 	.word 2 
      00A21B CD 07 99         [ 4] 1099 	call PLUS 
      00A21B CD 87 2B         [ 4] 1100 	call DUPP 
      00A21E CD 85 77         [ 4] 1101 	call CNTXT 
      00A221 CD 85 2C         [ 4] 1102 	call STORE
      00A224 A2 9F CD         [ 4] 1103 	call LAST
      00A227 87 7A CD         [ 4] 1104 	call STORE 
      00A22A 85 77 CD         [ 4] 1105 	call UPDATLAST 
                                   1106 ;update CP 
      00A22D 86 1E CD         [ 4] 1107 	call CPP 
      00A230 87 5E CD         [ 4] 1108 	call STORE
      00A233 85 77 CD         [ 4] 1109 	call UPDATCP 
      00A236 84               [ 4] 1110 	ret 
                                   1111 
                                   1112 ;-----------------------------
                                   1113 ; move interrupt sub-routine
                                   1114 ; in flash memory
                                   1115 ;----------------------------- 
      00A237 F9 00                 1116 	.word LINK 
                           00226D  1117 	LINK=. 
      00A239 02                    1118 	.byte 6
      00A23A CD 88 92 CD 86 2E     1119 	.ascii "IFMOVE" 
      002274                       1120 IFMOVE:
      00A240 CD A2 10         [ 4] 1121 	call TFLASH 
      00A243 CD 87 D9         [ 4] 1122 	CALL AT 
      00A246 CD 86 1E         [ 4] 1123 	CALL QBRAN 
      00A249 CD 85                 1124 	.word no_move 
      00A24B E7 06 FA         [ 4] 1125 	call CPP 
      00A24C CD 04 F7         [ 4] 1126 	call AT 
      00A24C CD 8C 71         [ 4] 1127 	call DUPP ; ( udl udl -- )
      00A24F CD 85 DB         [ 4] 1128 	call EEPVP 
      00A252 CD 88 92         [ 4] 1129 	call DROP
      00A255 CD 04 F7         [ 4] 1130 	call AT  ; ( udl udl a )
      00A255 CD 86 1E         [ 4] 1131 	call TOR 
      00A258 CD 85 E7         [ 4] 1132 	call FADDR
      00A25B CD A1 BC         [ 4] 1133 	call RAT ; ( udl ud a -- ) R: a 
      00A25E CD 86 1E         [ 2] 1134 	jp FMOVE2 
                                   1135 
                                   1136 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



                           000001  4714 .if WANT_SCALING_CONST 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



                                   4715         .include "const_ratio.asm"
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
      00A261 CD 85                   31         .word LINK 
                           00229F    32         LINK=.
      00A263 E7                      33         .byte 2
      00A264 CD 88                   34         .ascii "PI" 
      0022A2                         35 PII:
      00A266 19 CD 86         [ 2]   36         subw x,#2*CELLL 
      00A269 1E CD 8B 83      [ 2]   37         ldw y,#355 
      00A26D CD 85            [ 2]   38         ldw (2,x),y 
      00A26F C8 CD 85 C8      [ 2]   39         ldw y,#113 
      00A273 CD               [ 2]   40         ldw (x),y 
      00A274 86               [ 4]   41         ret 
                                     42 
                                     43 ;      SQRT2 ( -- 19601  13860 )
                                     44 ; precision: 1.5e-9 
                                     45 ; usage example to compute Voltage peek to peek from Vrms 
                                     46 ; : VPP SQRT2 */ 2 * ;
                                     47 ;
      00A275 48 CD                   48         .word LINK 
                           0022B3    49         LINK=.
      00A277 88                      50         .byte 5 
      00A278 92 CD 86 1E CD          51         .ascii "SQRT2" 
      0022B9                         52 SQRT2:
      00A27D 85 2C A2         [ 2]   53         subw x,#2*CELLL 
      00A280 98 CD 86 2E      [ 2]   54         ldw y,#19601 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



      00A284 CD 85            [ 2]   55         ldw (2,x),y 
      00A286 C8 CD 88 19      [ 2]   56         ldw y,#13860 
      00A28A CD               [ 2]   57         ldw (x),y 
      00A28B 86               [ 4]   58         ret 
                                     59 
                                     60 ;   SQRT3 ( -- 18817 10864 )
                                     61 ; precision: 1.1e-9
                                     62 ;
      00A28C 1E CD                   63         .word LINK 
                           0022CA    64         LINK=.
      00A28E 85                      65         .byte 5
      00A28F E7 CD 86 2E CD          66         .ascii "SQRT3" 
      0022D0                         67 SQRT3: 
      00A294 85 43 A2         [ 2]   68     subw x,#2*CELLL 
      00A297 55 AE 49 81      [ 2]   69     ldw y,#18817 
      00A298 EF 02            [ 2]   70     ldw (2,x),y 
      00A298 CD 85 C8 1C      [ 2]   71     ldw y,#10864 
      00A29C 00               [ 2]   72     ldw (x),y 
      00A29D 0A               [ 4]   73     ret 
                                     74 
                                     75 ;   E ( -- 28667 10546 )
                                     76 ; precision: 5.5e-9 
                                     77 ; natural log base 
      00A29E 81 CA                   78         .word LINK 
                           0022E1    79         LINK=.
      00A29F 01                      80         .byte 1
      00A29F CD                      81         .ascii "E" 
      0022E3                         82 ENEPER:
      00A2A0 8B 83 81         [ 2]   83     subw x,#2*CELLL 
      00A2A3 A2 15 09 55      [ 2]   84     ldw y,#28667 
      00A2A7 50 44            [ 2]   85     ldw (2,x),y 
      00A2A9 41 54 2D 50      [ 2]   86     ldw y,#10546 
      00A2AD 54               [ 2]   87     ldw (x),y 
      00A2AE 52               [ 4]   88     ret 
                                     89 
                                     90 ;   SQRT10 ( -- 22936 7253 )
                                     91 ; precision: 5.7e-9 
      00A2AF 22 E1                   92         .word LINK 
                           0022F4    93         LINK=.
      00A2AF CD                      94         .byte 6 
      00A2B0 9C 69 CD 86 14 CD       95         .ascii "SQRT10" 
      0022FB                         96 SQRT10:
      00A2B6 85 77 CD         [ 2]   97     subw x,#2*CELLL
      00A2B9 87 6C CD 85      [ 2]   98     ldw y,#22936 
      00A2BD 60 CD            [ 2]   99     ldw (2,x),y 
      00A2BF 9C 53 CD 86      [ 2]  100     ldw y,#7253
      00A2C3 14               [ 2]  101     ldw (x),y 
      00A2C4 CD               [ 4]  102     ret 
                                    103 
                                    104 ;   12RT2 ( -- 26797 25293 )
                                    105 ; precision: 1.0e-9 
                                    106 ; used in music to compute well tempered scale
      00A2C5 85 77                  107         .word LINK 
                           00230C   108         LINK=. 
      00A2C7 CD                     109         .byte 5 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]



      00A2C8 84 F9 00 02 CD         110         .ascii "12RT2"
      002312                        111 RT12_2:
      00A2CD 88 19 CD         [ 2]  112     subw x,#2*CELLL 
      00A2D0 86 1E CD 87      [ 2]  113     ldw y,#26797
      00A2D4 5E CD            [ 2]  114     ldw (2,x),y 
      00A2D6 85 60 CD 87      [ 2]  115     ldw y,#25293
      00A2DA 8A               [ 2]  116     ldw (x),y 
      00A2DB CD               [ 4]  117     ret 
                                    118 
                                    119 ;   LOG2s ( -- 2040 11103 )
                                    120 ; log(2)/1.6384
                                    121 ; precision: 1.1e-8
      00A2DC 85 60                  122         .word LINK 
                           002323   123         LINK=.
      00A2DE CD                     124         .byte 5 
      00A2DF 9C 83 CD 87 7A         125         .ascii "LOG2S" 
      002329                        126 LOG2S:
      00A2E4 CD 85 60         [ 2]  127     subw x,#2*CELLL
      00A2E7 CD 9C AC 81      [ 2]  128     ldw y,#2040 
      00A2EB A2 A5            [ 2]  129     ldw (2,x),y 
      00A2ED 06 49 46 4D      [ 2]  130     ldw y,#11103 
      00A2F1 4F               [ 2]  131     ldw (x),y 
      00A2F2 56               [ 4]  132     ret 
                                    133 
                                    134 ;   LN2 ( -- 485 11464 )
                                    135 ; ln(2)/16.384 
                                    136 ; precision: 1.0e-7 
      00A2F3 45 23                  137         .word LINK 
                           00233A   138         LINK=.
      00A2F4 04                     139         .byte 4 
      00A2F4 CD 87 2B CD            140         .ascii "LN2S" 
      00233F                        141 LN2S: 
      00A2F8 85 77 CD         [ 2]  142     subw x,#2*CELLL
      00A2FB 85 2C A2 9F      [ 2]  143     ldw y,#485
      00A2FF CD 87            [ 2]  144     ldw (2,x),y 
      00A301 7A CD 85 77      [ 2]  145     ldw y,#11464 
      00A305 CD               [ 2]  146     ldw (x),y 
      00A306 86               [ 4]  147     ret 
                                    148 
                                    149 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]



                                   4716 .endif
                           000001  4717 .if WANT_CONST_TABLE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



                                   4718         .include "ctable.asm"
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
                                     25 ;-----------------------------
                                     26 ; allocate space in CODE area 
                                     27 ; for constant table.
                                     28 ; CALLOT ( u -- ad )
                                     29 ; u  bytes to allocates 
                                     30 ; ad data address as double.
                                     31 ;-----------------------------
      00A307 1E CD                   32     .word LINK 
                           002350    33     LINK=.
      00A309 9C                      34     .byte 6
      00A30A 69 CD 86 14 CD 85       35     .ascii "CALLOT"
      002357                         36 CALLOT:
      00A310 77 CD 85         [ 4]   37     CALL CPP
      00A313 E7 CD A2         [ 4]   38     CALL DUPP 
      00A316 10 CD 85         [ 4]   39     CALL AT 
      00A319 DB CC A2         [ 4]   40     CALL TOR 
      00A31C 4C A2 ED         [ 4]   41     CALL PSTOR 
      00A31F 02 50 49         [ 4]   42     CALL UPDATCP 
      00A322 CD 05 48         [ 4]   43     CALL RFROM
      00A322 1D 00 04         [ 2]   44     JP ZERO 
                                     45 
                                     46 ;------------------------------
                                     47 ; create constants bytes table 
                                     48 ; in persistant memory
                                     49 ;  CTABLE ( n+ -- ad ; <string> )
                                     50 ; n+ bytes reserved 
                                     51 ;-----------------------------
      00A325 90 AE                   52     .word LINK 
                           002371    53     LINK=.
      00A327 01                      54     .byte 6
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



      00A328 63 EF 02 90 AE 00       55     .ascii "CTABLE"
      002378                         56 CTABLE:
      00A32E 71 FF 81         [ 4]   57     CALL CALLOT     
      00A331 A3 1F 05         [ 2]   58     JP DCONST 
                                     59      
                                     60 
                                     61 ;--------------------------------
                                     62 ; create constants words table 
                                     63 ; in persistant memory 
                                     64 ; WTABLE ( n+ -- ad ; <string> )
                                     65 ; n+  words reserved  
                                     66 ;--------------------------------
      00A334 53 51                   67     .word LINK 
                           002380    68     LINK=.
      00A336 52                      69     .byte 6
      00A337 54 32 41 42 4C 45       70     .ascii "WTABLE"
      00A339                         71 WTABLE:
      00A339 1D 00 04         [ 4]   72     CALL CELLS  
      00A33C 90 AE 4C         [ 4]   73     CALL CALLOT 
      00A33F 91 EF 02         [ 2]   74     JP DCONST 
                                     75 
                                     76 ;---------------------------------
                                     77 ; stack an element of CTABLE 
                                     78 ; CTABL@ ( u ad -- c )
                                     79 ; u element order {0..size-1}
                                     80 ; a|ad table address 
                                     81 ;--------------------------------
      00A342 90 AE                   82     .word LINK 
                           002392    83     LINK=.
      00A344 36                      84     .byte 6
      00A345 24 FF 81 A3 33 05       85     .ascii "CTABL@" 
      002399                         86 CTAT:
      00A34B 53 51 52         [ 4]   87     call FPSTOR 
      00A34E 54 33 01         [ 4]   88     call PTRPLUS 
      00A350 CC 1D 3E         [ 2]   89     jp EE_CREAD 
                                     90 
                                     91 ;---------------------------------
                                     92 ; stack an element of WTABLE 
                                     93 ; WTABL@ ( u ud -- w )
                                     94 ; u is element order {0..size-1}
                                     95 ; a|ud table address 
                                     96 ;----------------------------------
      00A350 1D 00                   97     .word LINK 
                           0023A4    98     LINK=.
      00A352 04                      99     .byte 6
      00A353 90 AE 49 81 EF 02      100     .ascii "WTABL@" 
      0023AB                        101 WTAT:
      00A359 90 AE 2A         [ 4]  102     call FPSTOR 
      00A35C 70 FF 81         [ 4]  103     call CELLS 
      00A35F A3 4A 01         [ 4]  104     call PTRPLUS 
      00A362 45 1D 1C         [ 4]  105     call EE_READ 
      00A363 81               [ 4]  106     ret 
                                    107 
                                    108 ;--------------------------
                                    109 ; tool to initialize character table 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



                                    110 ; CTINIT ( ad -- )
                                    111 ; ad is table address 
                                    112 ;--------------------------
      00A363 1D 00                  113     .word LINK 
                           0023BA   114     LINK=.
      00A365 04                     115     .byte 6 
      00A366 90 AE 6F FB EF 02      116     .ascii "CTINIT"
      0023C1                        117 CTINIT:
      00A36C 90 AE 29         [ 4]  118     CALL FPSTOR
      00A36F 32 FF 81         [ 4]  119     CALL UNLOCK
      00A372 A3 61 06         [ 4]  120     CALL ZERO 
      00A375 53 51 52         [ 4]  121 1$: CALL ONEP 
      00A378 54 31 30         [ 4]  122     CALL DUPP 
      00A37B CD 24 1D         [ 4]  123     CALL INTQ 
      00A37B 1D 00 04         [ 4]  124     CALL QBRAN 
      00A37E 90 AE                  125     .word 2$
      00A380 59 98 EF         [ 4]  126     call WR_BYTE 
      00A383 02 90 AE         [ 4]  127     CALL BRAN 
      00A386 1C 55                  128     .word 1$ 
      00A388 FF 81 A3         [ 4]  129 2$: CALL DDROP 
      00A38B 74 05 31         [ 4]  130     CALL LOCK 
      00A38E 32               [ 4]  131     ret 
                                    132 
                                    133 ;--------------------------
                                    134 ; tool to initialize word table 
                                    135 ; WTINIT ( ad -- )
                                    136 ; ad is table address 
                                    137 ;--------------------------
      00A38F 52 54                  138     .word LINK 
                           0023E9   139     LINK=.
      00A391 32                     140     .byte 6 
      00A392 57 54 49 4E 49 54      141     .ascii "WTINIT"
      0023F0                        142 WTINIT:
      00A392 1D 00 04         [ 4]  143     CALL FPSTOR
      00A395 90 AE 68         [ 4]  144     CALL UNLOCK
      00A398 AD EF 02         [ 4]  145     CALL ZERO 
      00A39B 90 AE 62         [ 4]  146 1$: CALL ONEP 
      00A39E CD FF 81         [ 4]  147     CALL DUPP
      00A3A1 A3 8C 05         [ 4]  148     CALL INTQ
      00A3A4 4C 4F 47         [ 4]  149     CALL QBRAN 
      00A3A7 32 53                  150     .word 2$
      00A3A9 CD 1D 7D         [ 4]  151     call WR_WORD 
      00A3A9 1D 00 04         [ 4]  152     CALL BRAN 
      00A3AC 90 AE                  153     .word 1$ 
      00A3AE 07 F8 EF         [ 4]  154 2$: CALL DDROP 
      00A3B1 02 90 AE         [ 4]  155     CALL LOCK 
      00A3B4 2B               [ 4]  156     ret 
                                    157 
                                    158 ;------------------------
                                    159 ; Prompted input for integer 
                                    160 ; display n+ in bracket and
                                    161 ; '?' 
                                    162 ; [N]? ( n+ -- a )
                                    163 ;------------------------
      00A3B5 5F FF                  164     .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]



                           002418   165     LINK=.
      00A3B7 81                     166     .byte 4
      00A3B8 A3 A3 04 4C            167     .ascii "[N]?" 
      00241D                        168 INTQ:
      00A3BC 4E 32 53         [ 4]  169     CALL CR 
      00A3BF CD 04 79         [ 4]  170     call DOLIT 
      00A3BF 1D 00                  171     .word '[
      00A3C1 04 90 AE         [ 4]  172     CALL EMIT 
      00A3C4 01 E5 EF         [ 4]  173     CALL DOT 
      00A3C7 02 90 AE         [ 4]  174     CALL  DOTQP
      00A3CA 2C                     175     .byte 3
      00A3CB C8 FF 81               176     .ascii "]? " 
      00A3CE A3 BA 06         [ 4]  177     CALL QUERY 
      00A3D1 43 41 4C         [ 4]  178     call TOKEN 
      00A3D4 4C 4F 54         [ 2]  179     jp NUMBQ
                                    180 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]



                                   4719 .endif
                           000001  4720 .if WANT_FLOAT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]



                                   4721         .include "float.asm"
                                      1 ;*********************************
                                      2 ;    floating point library
                                      3 ;    adapted from 
                                      4 ;    Forth dimensions Vol. IV #1 
                                      5 ;    published in  may/june 1982
                                      6 ;
                                      7 ; Creation date: 2021-06-15 
                                      8 ;
                                      9 ; NOTE: I used a different format 
                                     10 ;       for float number. This 
                                     11 ;       enable comparison of floats 
                                     12 ;       as they were integer hence 
                                     13 ;       there no need for F>,F<,etc 
                                     14 ;************************************
                                     15 
                                     16 ;*************************************************
                                     17 ;  FLOAT format double for storage 
                                     18 ;  bits 22:0  mantissa absolute value 
                                     19 ;  bits  30:23  exponent with 127 offset added  
                                     20 ;  bit 31  mantissa sign 
                                     21 ;  float value: if bit 31 is 1 negate mantissa
                                     22 ;                else keep mantissas as bits 22:0
                                     23 ;                as is
                                     24 ;                eponent: 10^^(exp-127) 
                                     25 ;***********************************************  
                                     26     ; macro to create dictionary header record
                                     27     .macro _HEADER label,len,name 
                                     28         .word LINK 
                                     29         LINK=.
                                     30         .byte len  
                                     31         .ascii name
                                     32         label:
                                     33     .endm 
                                     34 
                                     35     ; runtime literal 
                                     36     .macro _DOLIT value 
                                     37     CALL DOLIT 
                                     38     .word value 
                                     39     .endm 
                                     40 
                                     41     ; 0BRANCH 
                                     42     .macro _QBRAN target 
                                     43     CALL QBRAN
                                     44     .word target
                                     45     .endm 
                                     46 
                                     47     ; BRANCH 
                                     48     .macro _BRAN target 
                                     49     CALL BRAN 
                                     50     .word target 
                                     51     .endm 
                                     52 
                                     53 ;-------------------------
                                     54 ;    FPSW ( -- a )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]



                                     55 ;    floating state variable
                                     56 ;    bit 0 zero flag 
                                     57 ;    bit 1 negative flag 
                                     58 ;    bit 2 overflow/error flag 
                                     59 ;---------------------------
      00A3D7                         60     _HEADER FPSW,4,"FPSW"
      00A3D7 CD 87                    1         .word LINK 
                           00243D     2         LINK=.
      00A3D9 7A                       3         .byte 4  
      00A3DA CD 86 1E CD              4         .ascii "FPSW"
      002442                          5         FPSW:
      00A3DE 85 77 CD 85      [ 2]   61 	LDW Y,#UFPSW  
      00A3E2 E7 CD 8B         [ 2]   62 	SUBW X,#2
      00A3E5 F3               [ 2]   63     LDW (X),Y
      00A3E6 CD               [ 4]   64     RET
                                     65 
                                     66 ;----------------------------
                                     67 ;    FBASE ( -- a )
                                     68 ;    floating point numerical
                                     69 ;    base variable 
                                     70 ;----------------------------
      00244B                         71     _HEADER FBASE,5,"FBASE"
      00A3E7 9C AC                    1         .word LINK 
                           00244D     2         LINK=.
      00A3E9 CD                       3         .byte 5  
      00A3EA 85 C8 CC 8B 83           4         .ascii "FBASE"
      002453                          5         FBASE:
      00A3EF A3 D0 06 43      [ 2]   72 	LDW Y,#UFBASE  
      00A3F3 54 41 42         [ 2]   73 	SUBW X,#2
      00A3F6 4C               [ 2]   74     LDW (X),Y
      00A3F7 45               [ 4]   75     RET
                                     76 
                                     77 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     78 ;   FRESET ( -- )
                                     79 ;   reset FPSW variable 
                                     80 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
      00A3F8                         81     _HEADER FRESET,6,"FRESET"
      00A3F8 CD A3                    1         .word LINK 
                           00245E     2         LINK=.
      00A3FA D7                       3         .byte 6  
      00A3FB CC 99 A2 A3 F1 06        4         .ascii "FRESET"
      002465                          5         FRESET:
      002465                         82     _DOLIT 0 
      00A401 57 54 41         [ 4]    1     CALL DOLIT 
      00A404 42 4C                    2     .word 0 
      00A406 45 24 42         [ 4]   83     CALL FPSW 
      00A407 CD 04 E0         [ 4]   84     CALL STORE 
      00A407 CD               [ 4]   85     RET 
                                     86 
                                     87 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     88 ;   FINIT ( -- )
                                     89 ;   initialize floating point 
                                     90 ;   library 
                                     91 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002471                         92     _HEADER FINIT,5,"FINIT"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]



      00A408 8B 0A                    1         .word LINK 
                           002473     2         LINK=.
      00A40A CD                       3         .byte 5  
      00A40B A3 D7 CC 99 A2           4         .ascii "FINIT"
      002479                          5         FINIT:
      00A410 A4 00 06         [ 4]   93     CALL FRESET 
      00A413 43 54 41         [ 4]   94     CALL BASE 
      00A416 42 4C 40         [ 4]   95     CALL AT 
      00A419 CD 24 53         [ 4]   96     CALL FBASE 
      00A419 CD 9B EF         [ 4]   97     CALL STORE 
      00A41C CD               [ 4]   98     RET 
                                     99 
                                    100 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    101 ;    FER ( -- u )
                                    102 ;    return FPSW value 
                                    103 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002489                        104     _HEADER FER,3,"FER"
      00A41D 9D 81                    1         .word LINK 
                           00248B     2         LINK=.
      00A41F CC                       3         .byte 3  
      00A420 9D BE A4                 4         .ascii "FER"
      00248F                          5         FER:
      00A423 12 06 57         [ 4]  105     CALL FPSW 
      00A426 54 41 42         [ 4]  106     CALL AT 
      00A429 4C               [ 4]  107     RET 
                                    108 
                                    109 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    110 ;    FZE  ( -- z )
                                    111 ;    return FPSW zero flag 
                                    112 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002496                        113     _HEADER FZE,3,"FZE"
      00A42A 40 8B                    1         .word LINK 
                           002498     2         LINK=.
      00A42B 03                       3         .byte 3  
      00A42B CD 9B EF                 4         .ascii "FZE"
      00249C                          5         FZE:
      00A42E CD 8B 0A         [ 4]  114     CALL FPSW
      00A431 CD 9D 81         [ 4]  115     CALL AT  
      0024A2                        116     _DOLIT 1
      00A434 CD 9D 9C         [ 4]    1     CALL DOLIT 
      00A437 81 A4                    2     .word 1 
      00A439 24 06 43         [ 4]  117     CALL ANDD 
      00A43C 54               [ 4]  118     RET 
                                    119 
                                    120 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    121 ;    FNE ( -- n )
                                    122 ;    return FPSW negative flag 
                                    123 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0024AB                        124     _HEADER FNE,3,"FNE"
      00A43D 49 4E                    1         .word LINK 
                           0024AD     2         LINK=.
      00A43F 49                       3         .byte 3  
      00A440 54 4E 45                 4         .ascii "FNE"
      00A441                          5         FNE:
      00A441 CD 9B EF         [ 4]  125     CALL FPSW 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
Hexadecimal [24-Bits]



      00A444 CD 9D 2D         [ 4]  126     CALL AT 
      0024B7                        127     _DOLIT 2 
      00A447 CD 8B 83         [ 4]    1     CALL DOLIT 
      00A44A CD 8B                    2     .word 2 
      00A44C 17 CD 86         [ 4]  128     CALL ANDD 
      00A44F 1E               [ 4]  129     RET 
                                    130 
                                    131 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    132 ;   FOV (A -- v )
                                    133 ;   return FPSW overflow flag 
                                    134 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0024C0                        135     _HEADER FOV,3,"FOV"
      00A450 CD A4                    1         .word LINK 
                           0024C2     2         LINK=.
      00A452 9D                       3         .byte 3  
      00A453 CD 85 2C                 4         .ascii "FOV"
      0024C6                          5         FOV:
      00A456 A4 60 CD         [ 4]  136     CALL FPSW
      00A459 9D D8 CD         [ 4]  137     CALL AT  
      0024CC                        138     _DOLIT 4 
      00A45C 85 43 A4         [ 4]    1     CALL DOLIT 
      00A45F 4A CD                    2     .word 4 
      00A461 87 F9 CD         [ 4]  139     CALL ANDD 
      00A464 9D               [ 4]  140     RET 
                                    141 
                                    142 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    143 ;    D0= ( d -- 0|-1 )
                                    144 ;    check if double is 0 
                                    145 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0024D5                        146     _HEADER DZEQUAL,3,"D0="
      00A465 55 81                    1         .word LINK 
                           0024D7     2         LINK=.
      00A467 A4                       3         .byte 3  
      00A468 3A 06 57                 4         .ascii "D0="
      0024DB                          5         DZEQUAL:
      00A46B 54 49 4E         [ 4]  147     CALL ORR 
      00A46E 49 54            [ 1]  148     LD A,#0xFF
      00A470 90 93            [ 1]  149     LDW Y,X
      00A470 CD 9B            [ 2]  150     LDW Y,(Y)
      00A472 EF CD 9D 2D      [ 2]  151     CPW Y,#0 
      00A476 CD 8B            [ 1]  152     JREQ  ZEQ1
      00A478 83               [ 1]  153     CLR A   ;false
      0024EB                        154 ZEQ1:
      00A479 CD               [ 1]  155     LD     (X),A
      00A47A 8B 17            [ 1]  156     LD (1,X),A
      00A47C CD               [ 4]  157 	RET     
                                    158     
                                    159 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    160 ;  DNEGATE ( d -- d )
                                    161 ;  negate double (2's complement)
                                    162 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0024EF                        163     _HEADER DNEGAT,7,"DNEGATE"
      00A47D 86 1E                    1         .word LINK 
                           0024F1     2         LINK=.
      00A47F CD                       3         .byte 7  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal [24-Bits]



      00A480 A4 9D CD 85 2C A4 8F     4         .ascii "DNEGATE"
      0024F9                          5         DNEGAT:
      00A487 CD 9D FD         [ 4]  164     CALL INVER
      00A48A CD 85 43         [ 4]  165     CALL SWAPP 
      00A48D A4 79 CD         [ 4]  166     CALL INVER 
      00A490 87 F9            [ 1]  167     LDW  Y,X 
      00A492 CD 9D            [ 2]  168     LDW Y,(Y)
      00A494 55 81 A4 69      [ 2]  169     ADDW Y,#1 
      00A498 04               [ 2]  170     LDW (X),Y 
      00A499 5B 4E            [ 1]  171     JRNC DNEG1 
      00A49B 5D 3F            [ 1]  172     LDW Y,X 
      00A49D 90 EE 02         [ 2]  173     LDW Y,(2,Y)
      00A49D CD 8F E9 CD      [ 2]  174     ADDW Y,#1
      00A4A1 84 F9            [ 2]  175     LDW (2,X),Y 
      002518                        176 DNEG1:
      00A4A3 00 5B CD         [ 4]  177     CALL SWAPP 
      00A4A6 84               [ 4]  178     RET      
                                    179 
                                    180 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    181 ;   U> ( u1 u2 -- f )
                                    182 ;   f = true if u1>u2 
                                    183 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00251C                        184     _HEADER UGREAT,2,"U>"
      00A4A7 B8 CD                    1         .word LINK 
                           00251E     2         LINK=.
      00A4A9 90                       3         .byte 2  
      00A4AA 84 CD                    4         .ascii "U>"
      002521                          5         UGREAT:
      00A4AC 90 28            [ 1]  185     LD A,#0
      00A4AE 03 5D            [ 1]  186     LDW Y,X 
      00A4B0 3F 20 CD         [ 2]  187     LDW Y,(2,Y)
      00A4B3 94 13 CD         [ 2]  188     LDW YTEMP,Y 
      00A4B6 92 3E            [ 1]  189     LDW Y,X
      00A4B8 CC 8E 96         [ 2]  190     ADDW X,#2 
      00A4BB A4 98            [ 2]  191     LDW Y,(Y)
      00A4BD 04 46 50         [ 2]  192     CPW Y,YTEMP 
      00A4C0 53 57            [ 1]  193     JRMI UGREAT1 
      00A4C2 A6 FF            [ 1]  194     LD A,#0XFF 
      002539                        195 UGREAT1:
      00A4C2 90               [ 1]  196     LD (X),A 
      00A4C3 AE 00            [ 1]  197     LD (1,X),A 
      00A4C5 0A               [ 4]  198     RET 
                                    199 
                                    200 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    201 ;    SFZ ( f# -- f# )
                                    202 ;    set FPSW zero flag 
                                    203 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00253D                        204     _HEADER SFZ,3,"SFZ"
      00A4C6 1D 00                    1         .word LINK 
                           00253F     2         LINK=.
      00A4C8 02                       3         .byte 3  
      00A4C9 FF 81 A4                 4         .ascii "SFZ"
      002543                          5         SFZ:
      00A4CC BD 05 46         [ 4]  205     CALL DDUP 
      00A4CF 42 41 53         [ 4]  206     CALL FER 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal [24-Bits]



      002549                        207     _DOLIT 0xfffe 
      00A4D2 45 04 79         [ 4]    1     CALL DOLIT 
      00A4D3 FF FE                    2     .word 0xfffe 
      00A4D3 90 AE 00         [ 4]  208     CALL ANDD 
      00A4D6 08 1D 00         [ 4]  209     CALL TOR    
      002554                        210     _DOLIT 0x807F 
      00A4D9 02 FF 81         [ 4]    1     CALL DOLIT 
      00A4DC A4 CD                    2     .word 0x807F 
      00A4DE 06 46 52         [ 4]  211     CALL ANDD 
      00A4E1 45 53 45         [ 4]  212     CALL DZEQUAL 
      00255F                        213     _DOLIT 1 
      00A4E4 54 04 79         [ 4]    1     CALL DOLIT 
      00A4E5 00 01                    2     .word 1 
      00A4E5 CD 84 F9         [ 4]  214     CALL ANDD 
      00A4E8 00 00 CD         [ 4]  215     CALL RFROM 
      00A4EB A4 C2 CD         [ 4]  216     CALL ORR 
      00A4EE 85 60 81         [ 4]  217     CALL FPSW 
      00A4F1 A4 DE 05         [ 4]  218     CALL STORE 
      00A4F4 46               [ 4]  219     RET 
                                    220 
                                    221 
                                    222 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    223 ;   SFN ( f# -- f# )
                                    224 ;   set FPSW negative flag 
                                    225 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002574                        226     _HEADER SFN,3,"SFN"
      00A4F5 49 4E                    1         .word LINK 
                           002576     2         LINK=.
      00A4F7 49                       3         .byte 3  
      00A4F8 54 46 4E                 4         .ascii "SFN"
      00A4F9                          5         SFN:
      00A4F9 CD A4 E5         [ 4]  227     CALL DUPP  
      00A4FC CD 86 DB         [ 4]  228     CALL FER 
      002580                        229     _DOLIT 0xFFFD 
      00A4FF CD 85 77         [ 4]    1     CALL DOLIT 
      00A502 CD A4                    2     .word 0xFFFD 
      00A504 D3 CD 85         [ 4]  230     CALL ANDD  
      00A507 60 81 A4         [ 4]  231     CALL TOR 
      00258B                        232     _DOLIT 0x8000
      00A50A F3 03 46         [ 4]    1     CALL DOLIT 
      00A50D 45 52                    2     .word 0x8000 
      00A50F CD 05 EA         [ 4]  233     CALL ANDD
      00A50F CD A4            [ 1]  234     LDW Y,X 
      00A511 C2 CD            [ 2]  235     LDW Y,(Y)
      00A513 85               [ 1]  236     RCF 
      00A514 77 81            [ 2]  237     RLCW Y 
      00A516 A5 0B            [ 2]  238     RLCW Y 
      00A518 03 46            [ 2]  239     RLCW Y 
      00A51A 5A               [ 2]  240     LDW (X),Y 
      00A51B 45 05 48         [ 4]  241     CALL RFROM 
      00A51C CD 05 FE         [ 4]  242     CALL ORR 
      00A51C CD A4 C2         [ 4]  243     CALL FPSW
      00A51F CD 85 77         [ 4]  244     CALL STORE 
      00A522 CD               [ 4]  245     RET 
                                    246 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]



                                    247 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    248 ;   SFV ( -- )
                                    249 ;   set overflow flag 
                                    250 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0025AC                        251     _HEADER SFV,3,"SFV"
      00A523 84 F9                    1         .word LINK 
                           0025AE     2         LINK=.
      00A525 00                       3         .byte 3  
      00A526 01 CD 86                 4         .ascii "SFV"
      0025B2                          5         SFV:
      00A529 6A 81 A5         [ 4]  252     CALL FPSW 
      00A52C 18 03 46         [ 4]  253     CALL AT 
      0025B8                        254     _DOLIT 4 
      00A52F 4E 45 79         [ 4]    1     CALL DOLIT 
      00A531 00 04                    2     .word 4 
      00A531 CD A4 C2         [ 4]  255     CALL ORR 
      00A534 CD 85 77         [ 4]  256     CALL FPSW 
      00A537 CD 84 F9         [ 4]  257     CALL STORE 
      00A53A 00               [ 4]  258     RET 
                                    259 
                                    260 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    261 ;  @EXPONENT ( f# -- m e )
                                    262 ;  split float in mantissa/exponent 
                                    263 ;  m mantissa as a double 
                                    264 ;  e exponent as a single 
                                    265 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0025C7                        266     _HEADER ATEXP,9,"@EXPONENT"             
      00A53B 02 CD                    1         .word LINK 
                           0025C9     2         LINK=.
      00A53D 86                       3         .byte 9  
      00A53E 6A 81 A5 2D 03 46 4F     4         .ascii "@EXPONENT"
             56 54
      00A546                          5         ATEXP:
      00A546 CD A4 C2         [ 4]  267     CALL FRESET
      00A549 CD 85 77         [ 4]  268     CALL SFN
      00A54C CD 84 F9         [ 4]  269     CALL SFZ 
      00A54F 00 04 CD         [ 4]  270     CALL DUPP
      0025DF                        271     _DOLIT 0X7F80 
      00A552 86 6A 81         [ 4]    1     CALL DOLIT 
      00A555 A5 42                    2     .word 0X7F80 
      00A557 03 44 30         [ 4]  272     CALL ANDD 
      0025E7                        273     _DOLIT 7 
      00A55A 3D 04 79         [ 4]    1     CALL DOLIT 
      00A55B 00 07                    2     .word 7 
      00A55B CD 86 7E         [ 4]  274     CALL RSHIFT
      0025EF                        275     _DOLIT 127 
      00A55E A6 FF 90         [ 4]    1     CALL DOLIT 
      00A561 93 90                    2     .word 127 
      00A563 FE 90 A3         [ 4]  276     CALL SUBB
      00A566 00 00 27         [ 4]  277     CALL TOR 
      0025FA                        278     _DOLIT 0x7F
      00A569 01 4F 79         [ 4]    1     CALL DOLIT 
      00A56B 00 7F                    2     .word 0x7F 
      00A56B F7 E7 01         [ 4]  279     CALL ANDD  ; mantissa as double  
      00A56E 81 A5 57         [ 4]  280     CALL FNE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]



      002605                        281     _QBRAN POSMANT 
      00A571 07 44 4E         [ 4]    1     CALL QBRAN
      00A574 45 47                    2     .word POSMANT
      00A576 41 54 45         [ 4]  282     CALL DNEGAT 
      00A579                        283 POSMANT:
      00A579 CD 88 33         [ 4]  284     CALL RFROM 
      00A57C CD               [ 4]  285     RET 
                                    286 
                                    287 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    288 ;    !EXPONENT ( m e -- f# )
                                    289 ;    built float from mantissa/exponent 
                                    290 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002611                        291     _HEADER STEXP,9,"!EXPONENT"
      00A57D 86 2E                    1         .word LINK 
                           002613     2         LINK=.
      00A57F CD                       3         .byte 9  
      00A580 88 33 90 93 90 FE 72     4         .ascii "!EXPONENT"
             A9 00
      00261D                          5         STEXP:
      00A589 01 FF 24         [ 4]  292     CALL DUPP 
      00A58C 0B 90 93         [ 4]  293     CALL ABSS 
      002623                        294     _DOLIT 127 
      00A58F 90 EE 02         [ 4]    1     CALL DOLIT 
      00A592 72 A9                    2     .word 127 
      00A594 00 01 EF         [ 4]  295     CALL UGREAT
      00262B                        296     _QBRAN STEXP1
      00A597 02 04 AC         [ 4]    1     CALL QBRAN
      00A598 26 33                    2     .word STEXP1
      00A598 CD 86 2E         [ 4]  297     CALL SFV  
      002633                        298 STEXP1:
      002633                        299     _DOLIT 127 
      00A59B 81 A5 71         [ 4]    1     CALL DOLIT 
      00A59E 02 55                    2     .word 127 
      00A5A0 3E 07 99         [ 4]  300     CALL PLUS 
      00A5A1                        301     _DOLIT 0XFF 
      00A5A1 A6 00 90         [ 4]    1     CALL DOLIT 
      00A5A4 93 90                    2     .word 0XFF 
      00A5A6 EE 02 90         [ 4]  302     CALL ANDD 
      002643                        303     _DOLIT 7 
      00A5A9 BF 28 90         [ 4]    1     CALL DOLIT 
      00A5AC 93 1C                    2     .word 7 
      00A5AE 00 02 90         [ 4]  304     CALL LSHIFT 
      00A5B1 FE 90 B3         [ 4]  305     CALL TOR   ; R: e 
      00A5B4 28 2B 02         [ 4]  306     CALL DUPP 
      002651                        307     _DOLIT 0X8000 
      00A5B7 A6 FF 79         [ 4]    1     CALL DOLIT 
      00A5B9 80 00                    2     .word 0X8000 
      00A5B9 F7 E7 01         [ 4]  308     CALL ANDD 
      002659                        309     _QBRAN STEXP2 
      00A5BC 81 A5 9E         [ 4]    1     CALL QBRAN
      00A5BF 03 53                    2     .word STEXP2
      00265E                        310     _DOLIT 0X8000 
      00A5C1 46 5A 79         [ 4]    1     CALL DOLIT 
      00A5C3 80 00                    2     .word 0X8000 
      00A5C3 CD 88 04         [ 4]  311     CALL RFROM 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]



      00A5C6 CD A5 0F         [ 4]  312     CALL ORR
      00A5C9 CD 84 F9         [ 4]  313     CALL TOR
      00A5CC FF FE CD         [ 4]  314     CALL DNEGAT  
      00266F                        315 STEXP2:
      00A5CF 86 6A CD         [ 4]  316     CALL DUPP 
      002672                        317     _DOLIT 0X7F
      00A5D2 85 E7 CD         [ 4]    1     CALL DOLIT 
      00A5D5 84 F9                    2     .word 0X7F 
      00A5D7 80 7F CD         [ 4]  318     CALL UGREAT 
      00267A                        319     _QBRAN STEXP3 
      00A5DA 86 6A CD         [ 4]    1     CALL QBRAN
      00A5DD A5 5B                    2     .word STEXP3
      00A5DF CD 84 F9         [ 4]  320     CALL SFV 
      002682                        321 STEXP3:
      002682                        322     _DOLIT 0X7F 
      00A5E2 00 01 CD         [ 4]    1     CALL DOLIT 
      00A5E5 86 6A                    2     .word 0X7F 
      00A5E7 CD 85 C8         [ 4]  323     CALL ANDD 
      00A5EA CD 86 7E         [ 4]  324     CALL RFROM 
      00A5ED CD A4 C2         [ 4]  325     CALL ORR 
      00A5F0 CD 85 60         [ 4]  326     CALL SFZ 
      00A5F3 81 A5 BF         [ 4]  327     CALL SFN 
      00A5F6 03               [ 4]  328     RET 
                                    329 
                                    330 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    331 ;    <ROT ( n1 n2 n3 -- n3 n1 n2 )
                                    332 ;    rotate left 3 top elements 
                                    333 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002697                        334     _HEADER NROT,4,"<ROT"
      00A5F7 53 46                    1         .word LINK 
                           002699     2         LINK=.
      00A5F9 4E                       3         .byte 4  
      00A5FA 3C 52 4F 54              4         .ascii "<ROT"
      00269E                          5         NROT:
      00A5FA CD 86            [ 1]  335     LDW Y,X 
      00A5FC 1E CD            [ 2]  336     LDW Y,(Y)
      00A5FE A5 0F CD         [ 2]  337     LDW YTEMP,Y ; n3  
      00A601 84 F9            [ 1]  338     LDW Y,X 
      00A603 FF FD CD         [ 2]  339     LDW Y,(2,Y) ; Y = n2 
      00A606 86               [ 2]  340     LDW (X),Y   ; TOS = n2 
      00A607 6A CD            [ 1]  341     LDW Y,X    
      00A609 85 E7 CD         [ 2]  342     LDW Y,(4,Y) ; Y = n1 
      00A60C 84 F9            [ 2]  343     LDW (2,X),Y ;   = n1 
      00A60E 80 00 CD         [ 2]  344     LDW Y,YTEMP 
      00A611 86 6A            [ 2]  345     LDW (4,X),Y ; = n3 
      00A613 90               [ 4]  346     RET 
                                    347 
                                    348 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    349 ;   D/MOD ( d s - r qd )
                                    350 ;   unsigned divide double by single 
                                    351 ;   return double quotient 
                                    352 ;   and single remainder 
                                    353 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0026B8                        354     _HEADER DSLMOD,5,"D/MOD"
      00A614 93 90                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]



                           0026BA     2         LINK=.
      00A616 FE                       3         .byte 5  
      00A617 98 90 59 90 59           4         .ascii "D/MOD"
      0026C0                          5         DSLMOD:
      00A61C 90 59            [ 1]  355         LDW     Y,X             ; stack pointer to Y
      00A61E FF               [ 2]  356         LDW     X,(X)           ; un
      00A61F CD 85            [ 2]  357         LDW     YTEMP,X         ; save un
      00A621 C8               [ 1]  358         LDW     X,Y
      00A622 CD               [ 2]  359         PUSHW   X               ; save stack pointer
      00A623 86 7E            [ 2]  360         PUSHW   Y 
      00A625 CD A4            [ 2]  361         LDW     X,(2,X)           ; X=udh
      00A627 C2 CD 85         [ 2]  362         LDW     Y,YTEMP         ; divisor 
      00A62A 60               [ 2]  363         DIVW    X,Y 
      00A62B 81 A5            [ 2]  364         LDW     XTEMP,X         ; QUOTIENT hi 
      00A62D F6               [ 1]  365         LDW     X,Y             ; remainder in X 
      00A62E 03 53            [ 2]  366         POPW    Y 
      00A630 46 56 04         [ 2]  367         LDW     Y,(4,Y)         ; Y=udl (offset before drop)
      00A632 A6 10            [ 1]  368         LD      A,#16           ; loop count
      00A632 CD A4            [ 2]  369         SLLW    Y               ; udl shift udl into udh
      0026DB                        370 DSLMOD3:
      00A634 C2               [ 2]  371         RLCW    X               ; rotate udl bit into uhdh (= remainder)
      00A635 CD 85            [ 1]  372         JRC     DSLMODa         ; if carry out of rotate
      00A637 77 CD            [ 2]  373         CPW     X,YTEMP         ; compare udh to un
      00A639 84 F9            [ 1]  374         JRULT   DSLMOD4         ; can't subtract
      0026E2                        375 DSLMODa:
      00A63B 00 04 CD 86      [ 2]  376         SUBW    X,YTEMP         ; can subtract
      00A63F 7E               [ 1]  377         RCF
      0026E7                        378 DSLMOD4:
      00A640 CD               [ 1]  379         CCF                     ; quotient bit
      00A641 A4 C2            [ 2]  380         RLCW    Y               ; rotate into quotient, rotate out udl
      00A643 CD               [ 1]  381         DEC     A               ; repeat
      00A644 85 60            [ 1]  382         JRNE    DSLMOD3           ; if A == 0
      0026ED                        383 DSLMODb:
      00A646 81 A6            [ 2]  384         LDW     YTEMP,X         ; done, save remainder
      00A648 2E               [ 2]  385         POPW    X               ; restore stack pointer
      00A649 09 40            [ 2]  386         LDW     (2,X),Y           ; save quotient low 
      00A64B 45 58 50         [ 2]  387         LDW     Y,XTEMP         ; quotient hi 
      00A64E 4F               [ 2]  388         LDW     (X),Y           ; save quotient hi 
      00A64F 4E 45 4E         [ 2]  389         LDW     Y,YTEMP         ; remainder onto stack
      00A652 54 04            [ 2]  390         LDW     (4,X),Y
      00A653 81               [ 4]  391         RET 
                                    392 
                                    393 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    394 ;   D# ( d -- d )
                                    395 ;   extract least digit 
                                    396 ;   from double integer 
                                    397 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0026FC                        398     _HEADER DDIG,2,"D#"
      00A653 CD A4                    1         .word LINK 
                           0026FE     2         LINK=.
      00A655 E5                       3         .byte 2  
      00A656 CD A5                    4         .ascii "D#"
      002701                          5         DDIG:
      00A658 FA CD A5         [ 4]  399     CALL BASE 
      00A65B C3 CD 86         [ 4]  400     CALL AT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal [24-Bits]



      00A65E 1E CD 84         [ 4]  401     CALL DSLMOD
      00A661 F9 7F 80         [ 4]  402     CALL ROT   
      00A664 CD 86 6A         [ 4]  403     CALL DIGIT 
      00A667 CD 84 F9         [ 4]  404     CALL HOLD 
      00A66A 00               [ 4]  405     RET 
                                    406 
                                    407 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    408 ;    D#S ( d -- s )
                                    409 ;   extract digit from double 
                                    410 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002714                        411     _HEADER DDIGS,3,"D#S"
      00A66B 07 CD                    1         .word LINK 
                           002716     2         LINK=.
      00A66D 8B                       3         .byte 3  
      00A66E 51 CD 84                 4         .ascii "D#S"
      00271A                          5         DDIGS:
      00A671 F9 00 7F         [ 4]  412     CALL    DDIG 
      00A674 CD 88 92         [ 4]  413     CALL    DDUP 
      00A677 CD 85 E7         [ 4]  414     CALL    DZEQUAL
      002723                        415     _QBRAN  DDIGS 
      00A67A CD 84 F9         [ 4]    1     CALL QBRAN
      00A67D 00 7F                    2     .word DDIGS
      00A67F CD 86 6A         [ 4]  416     CALL    DROP 
      00A682 CD               [ 4]  417     RET 
                                    418 
                                    419 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    420 ;   E. ( f# -- )
                                    421 ;   print float in scientific 
                                    422 ;   format 
                                    423 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00272C                        424     _HEADER EDOT,2,"E."
      00A683 A5 31                    1         .word LINK 
                           00272E     2         LINK=.
      00A685 CD                       3         .byte 2  
      00A686 85 2C                    4         .ascii "E."
      002731                          5         EDOT:
      00A688 A6 8D CD         [ 4]  425     CALL BASE 
      00A68B A5 79 F7         [ 4]  426     CALL AT 
      00A68D CD 05 67         [ 4]  427     CALL TOR 
      00A68D CD 85 C8         [ 4]  428     CALL FBASE 
      00A690 81 A6 49         [ 4]  429     CALL AT
      00A693 09 21 45         [ 4]  430     CALL BASE 
      00A696 58 50 4F         [ 4]  431     CALL STORE 
      00A699 4E 45 4E         [ 4]  432     CALL ATEXP ; m e 
      002749                        433 EDOT0:
      00A69C 54 05 67         [ 4]  434     CALL TOR   
      00A69D CD 24 B1         [ 4]  435     CALL FNE 
      00274F                        436     _QBRAN EDOT1
      00A69D CD 86 1E         [ 4]    1     CALL QBRAN
      00A6A0 CD 88                    2     .word EDOT1
      00A6A2 AC CD 84         [ 4]  437     CALL DNEGAT
      002757                        438 EDOT1:
      00A6A5 F9 00 7F         [ 4]  439     CALL SPACE 
      00A6A8 CD A5 A1         [ 4]  440     CALL BDIGS     
      00275D                        441 EDOT2: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]



      00A6AB CD 85 2C         [ 4]  442     CALL DDIG
      00A6AE A6 B3 CD         [ 4]  443     CALL RFROM 
      00A6B1 A6 32 97         [ 4]  444     CALL ONEP 
      00A6B3 CD 05 67         [ 4]  445     CALL TOR 
      00A6B3 CD 84 F9         [ 4]  446     CALL DUPP
      00276C                        447     _QBRAN EDOT3 
      00A6B6 00 7F CD         [ 4]    1     CALL QBRAN
      00A6B9 88 19                    2     .word EDOT3
      002771                        448     _BRAN EDOT2  
      00A6BB CD 84 F9         [ 4]    1     CALL BRAN 
      00A6BE 00 FF                    2     .word EDOT2 
      002776                        449 EDOT3:
      00A6C0 CD 86 6A         [ 4]  450     CALL OVER 
      00A6C3 CD 84 F9         [ 4]  451     CALL BASE 
      00A6C6 00 07 CD         [ 4]  452     CALL AT 
      00A6C9 8B 35 CD         [ 4]  453     CALL ULESS 
      002782                        454     _QBRAN EDOT2 
      00A6CC 85 E7 CD         [ 4]    1     CALL QBRAN
      00A6CF 86 1E                    2     .word EDOT2
      002787                        455     _DOLIT '.'
      00A6D1 CD 84 F9         [ 4]    1     CALL DOLIT 
      00A6D4 80 00                    2     .word '.' 
      00A6D6 CD 86 6A         [ 4]  456     CALL HOLD  
      00A6D9 CD 85 2C         [ 4]  457     CALL DDIG
      00A6DC A6 EF CD         [ 4]  458     CALL FNE 
      002795                        459     _QBRAN EDOT4 
      00A6DF 84 F9 80         [ 4]    1     CALL QBRAN
      00A6E2 00 CD                    2     .word EDOT4
      00279A                        460     _DOLIT '-'
      00A6E4 85 C8 CD         [ 4]    1     CALL DOLIT 
      00A6E7 86 7E                    2     .word '-' 
      00A6E9 CD 85 E7         [ 4]  461     CALL HOLD 
      0027A2                        462 EDOT4:       
      00A6EC CD A5 79         [ 4]  463     CALL EDIGS 
      00A6EF CD 0F 4B         [ 4]  464     CALL TYPES
      00A6EF CD 86 1E         [ 4]  465     CALL RFROM 
      00A6F2 CD 84 F9         [ 4]  466     CALL QDUP 
      0027AE                        467     _QBRAN EDOT5     
      00A6F5 00 7F CD         [ 4]    1     CALL QBRAN
      00A6F8 A5 A1                    2     .word EDOT5
      0027B3                        468     _DOLIT 'E'
      00A6FA CD 85 2C         [ 4]    1     CALL DOLIT 
      00A6FD A7 02                    2     .word 'E' 
      00A6FF CD A6 32         [ 4]  469     CALL EMIT 
      00A702 CD 10 04         [ 4]  470     CALL DOT
      0027BE                        471 EDOT5: 
      00A702 CD 84 F9         [ 4]  472     CALL RFROM 
      00A705 00 7F CD         [ 4]  473     CALL BASE 
      00A708 86 6A CD         [ 4]  474     CALL STORE  
      00A70B 85               [ 4]  475     RET 
                                    476 
                                    477 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                    478 ;   F. (f# -- )
                                    479 ;   print float in fixed
                                    480 ;   point format. 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]



                                    481 ;;;;;;;;;;;;;;;;;;;;;;;;;
      0027C8                        482     _HEADER FDOT,2,"F."
      00A70C C8 CD                    1         .word LINK 
                           0027CA     2         LINK=.
      00A70E 86                       3         .byte 2  
      00A70F 7E CD                    4         .ascii "F."
      0027CD                          5         FDOT:
      00A711 A5 C3 CD         [ 4]  483     CALL BASE 
      00A714 A5 FA 81         [ 4]  484     CALL AT 
      00A717 A6 93 04         [ 4]  485     CALL TOR 
      00A71A 3C 52 4F         [ 4]  486     CALL FBASE 
      00A71D 54 04 F7         [ 4]  487     CALL AT
      00A71E CD 06 5B         [ 4]  488     CALL BASE 
      00A71E 90 93 90         [ 4]  489     CALL STORE 
      00A721 FE 90 BF         [ 4]  490     CALL    ATEXP
      00A724 28 90 93         [ 4]  491     CALL    DUPP  
      00A727 90 EE 02         [ 4]  492     CALL    ABSS 
      0027EB                        493     _DOLIT  8
      00A72A FF 90 93         [ 4]    1     CALL DOLIT 
      00A72D 90 EE                    2     .word 8 
      00A72F 04 EF 02         [ 4]  494     CALL    GREAT 
      0027F3                        495     _QBRAN  FDOT1 
      00A732 90 BE 28         [ 4]    1     CALL QBRAN
      00A735 EF 04                    2     .word FDOT1
      00A737 81 A7 19         [ 2]  496     JP      EDOT0 
      0027FB                        497 FDOT1:
      00A73A 05 44 2F         [ 4]  498     CALL    SPACE 
      00A73D 4D 4F 44         [ 4]  499     CALL    TOR 
      00A740 CD 24 B1         [ 4]  500     CALL    FNE 
      002804                        501     _QBRAN  FDOT0 
      00A740 90 93 FE         [ 4]    1     CALL QBRAN
      00A743 BF 28                    2     .word FDOT0
      00A745 93 89 90         [ 4]  502     CALL    DNEGAT 
      00280C                        503 FDOT0: 
      00A748 89 EE 02         [ 4]  504     CALL    BDIGS
      00A74B 90 BE 28         [ 4]  505     CALL    RAT  
      00A74E 65 BF 26         [ 4]  506     CALL    ZLESS 
      002815                        507     _QBRAN  FDOT6 
      00A751 93 90 85         [ 4]    1     CALL QBRAN
      00A754 90 EE                    2     .word FDOT6
      00281A                        508 FDOT2: ; e<0 
      00A756 04 A6 10         [ 4]  509     CALL    DDIG 
      00A759 90 58 48         [ 4]  510     CALL    RFROM
      00A75B CD 0A 97         [ 4]  511     CALL    ONEP 
      00A75B 59 25 04         [ 4]  512     CALL    QDUP 
      002826                        513     _QBRAN  FDOT3 
      00A75E B3 28 25         [ 4]    1     CALL QBRAN
      00A761 05 33                    2     .word FDOT3
      00A762 CD 05 67         [ 4]  514     CALL    TOR 
      00282E                        515     _BRAN   FDOT2 
      00A762 72 B0 00         [ 4]    1     CALL BRAN 
      00A765 28 98                    2     .word FDOT2 
      00A767                        516 FDOT3:
      002833                        517     _DOLIT  '.' 
      00A767 8C 90 59         [ 4]    1     CALL DOLIT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]



      00A76A 4A 26                    2     .word '.' 
      00A76C EE 0D 1E         [ 4]  518     CALL    HOLD 
      00A76D CD 27 1A         [ 4]  519     CALL    DDIGS
      00283E                        520     _BRAN   FDOT9  
      00A76D BF 28 85         [ 4]    1     CALL BRAN 
      00A770 EF 02                    2     .word FDOT9 
      002843                        521 FDOT6: ; e>=0 
      002843                        522     _BRAN   FDOT8
      00A772 90 BE 26         [ 4]    1     CALL BRAN 
      00A775 FF 90                    2     .word FDOT8 
      002848                        523 FDOT7:     
      002848                        524     _DOLIT  '0'
      00A777 BE 28 EF         [ 4]    1     CALL DOLIT 
      00A77A 04 81                    2     .word '0' 
      00A77C A7 3A 02         [ 4]  525     CALL    HOLD 
      002850                        526 FDOT8:
      00A77F 44 23 8D         [ 4]  527     CALL    DONXT 
      00A781 28 48                  528     .word   FDOT7
      00A781 CD 86 DB         [ 4]  529     CALL    DDIGS 
      002858                        530 FDOT9:
      00A784 CD 85 77         [ 4]  531     CALL    FNE 
      00285B                        532     _QBRAN  FDOT10 
      00A787 CD A7 40         [ 4]    1     CALL QBRAN
      00A78A CD 87                    2     .word FDOT10
      002860                        533     _DOLIT '-' 
      00A78C D9 CD 8D         [ 4]    1     CALL DOLIT 
      00A78F 52 CD                    2     .word '-' 
      00A791 8D 9E 81         [ 4]  534     CALL   HOLD 
      002868                        535 FDOT10:
      00A794 A7 7E 03         [ 4]  536     CALL    EDIGS 
      00A797 44 23 53         [ 4]  537     CALL    TYPES 
      00A79A CD 05 48         [ 4]  538     CALL    RFROM 
      00A79A CD A7 81         [ 4]  539     CALL    BASE 
      00A79D CD 88 04         [ 4]  540     CALL    STORE 
      00A7A0 CD               [ 4]  541     RET 
                                    542 
                                    543 ; decrement exponent 
                                    544 ; ( f# -- f# )
      002878                        545 DECEXP: 
      00A7A1 A5 5B            [ 1]  546     LD A,(1,X)
      00A7A3 CD               [ 1]  547     RLC A 
      00A7A4 85               [ 1]  548     LD A,(X)
      00A7A5 2C               [ 1]  549     RLC A 
      00A7A6 A7 9A            [ 1]  550     SUB A,#1 
      00A7A8 CD               [ 1]  551     RCF
      00A7A9 86               [ 1]  552     RRC A 
      00A7AA 14 81            [ 1]  553     LD YTEMP,A
      00A7AC A7 96            [ 1]  554     LD A,(1,X)
      00A7AE 02               [ 1]  555     SLL A 
      00A7AF 45               [ 1]  556     RRC A 
      00A7B0 2E 01            [ 1]  557     LD (1,X),A 
      00A7B1 F6               [ 1]  558     LD A,(X)
      00A7B1 CD 86            [ 1]  559     AND A,0X80 
      00A7B3 DB CD            [ 1]  560     ADD A,YTEMP 
      00A7B5 85               [ 1]  561     LD (X),A 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]



      00A7B6 77               [ 4]  562     RET 
                                    563 
                                    564 ; increment exponent 
                                    565 ;  ( f# -- f# )
      002890                        566 INCEXP:
      00A7B7 CD 85            [ 1]  567     LD A,(1,X)
      00A7B9 E7               [ 1]  568     RLC A 
      00A7BA CD               [ 1]  569     LD A,(X)
      00A7BB A4               [ 1]  570     RLC A 
      00A7BC D3 CD            [ 1]  571     ADD A,#1 
      00A7BE 85               [ 1]  572     RCF
      00A7BF 77               [ 1]  573     RRC A 
      00A7C0 CD 86            [ 1]  574     LD YTEMP,A
      00A7C2 DB CD            [ 1]  575     LD A,(1,X)
      00A7C4 85               [ 1]  576     SLL A 
      00A7C5 60               [ 1]  577     RRC A 
      00A7C6 CD A6            [ 1]  578     LD (1,X),A 
      00A7C8 53               [ 1]  579     LD A,(X)
      00A7C9 B4 80            [ 1]  580     AND A,0X80 
      00A7C9 CD 85            [ 1]  581     ADD A,YTEMP 
      00A7CB E7               [ 1]  582     LD (X),A 
      00A7CC CD               [ 4]  583     RET 
                                    584 
                                    585 
                                    586 ; multiply double by single 
                                    587 ; return double 
                                    588 ;  ( d s -- d )
      0028A8                        589     _HEADER DSSTAR,3,"DS*"
      00A7CD A5 31                    1         .word LINK 
                           0028AA     2         LINK=.
      00A7CF CD                       3         .byte 3  
      00A7D0 85 2C A7                 4         .ascii "DS*"
      0028AE                          5         DSSTAR:
                                    590 ;DSSTAR:
      00A7D3 D7 CD A5         [ 4]  591     CALL TOR
      00A7D6 79 05 9E         [ 4]  592     CALL DUPP 
      00A7D7 CD 05 D7         [ 4]  593     CALL ZLESS
      00A7D7 CD 8F A1         [ 4]  594     CALL DUPP 
      00A7DA CD 8D 8E         [ 4]  595     CALL TOR 
      00A7DD                        596     _QBRAN DSSTAR1 
      00A7DD CD A7 81         [ 4]    1     CALL QBRAN
      00A7E0 CD 85                    2     .word DSSTAR1
      00A7E2 C8 CD 8B         [ 4]  597     CALL DNEGA 
      0028C5                        598 DSSTAR1:
      00A7E5 17 CD 85         [ 4]  599     CALL RFROM 
      00A7E8 E7 CD 86         [ 4]  600     CALL NROT       
      00A7EB 1E CD 85         [ 4]  601     CALL SWAPP 
      00A7EE 2C A7 F6         [ 4]  602     CALL RAT 
      00A7F1 CD 85 43         [ 4]  603     CALL UMSTA
      00A7F4 A7 DD 59         [ 4]  604     CALL ROT 
      00A7F6 CD 05 48         [ 4]  605     CALL RFROM 
      00A7F6 CD 86 48         [ 4]  606     CALL UMSTA 
      00A7F9 CD 86 DB         [ 4]  607     CALL DROP ; DROP OVERFLOW 
      00A7FC CD 85 77         [ 4]  608     CALL PLUS 
      00A7FF CD 88 D9         [ 4]  609     CALL ROT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 135.
Hexadecimal [24-Bits]



      0028E6                        610     _QBRAN DSSTAR3 
      00A802 CD 85 2C         [ 4]    1     CALL QBRAN
      00A805 A7 DD                    2     .word DSSTAR3
      00A807 CD 84 F9         [ 4]  611     CALL DNEGA 
      0028EE                        612 DSSTAR3:
      00A80A 00               [ 4]  613     RET 
                                    614 
                                    615     
                                    616 
                                    617 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    618 ;  LSCALE ( f# -- f# )
                                    619 ;  m *=fbase , e -= 1
                                    620 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0028EF                        621     _HEADER LSCALE,6,"LSCALE"
      00A80B 2E CD                    1         .word LINK 
                           0028F1     2         LINK=.
      00A80D 8D                       3         .byte 6  
      00A80E 9E CD A7 81 CD A5        4         .ascii "LSCALE"
      0028F8                          5         LSCALE:
      00A814 31 CD 85         [ 4]  622     CALL ATEXP 
      0028FB                        623     _DOLIT 1 
      00A817 2C A8 22         [ 4]    1     CALL DOLIT 
      00A81A CD 84                    2     .word 1 
      00A81C F9 00 2D         [ 4]  624     CALL SUBB 
      00A81F CD 8D 9E         [ 4]  625     CALL TOR
      00A822 CD 24 53         [ 4]  626     CALL FBASE 
      00A822 CD 8D F3         [ 4]  627     CALL AT 
      00A825 CD 8F CB         [ 4]  628     CALL DSSTAR
      00A828 CD 85 C8         [ 4]  629     CALL RFROM 
      00A82B CD 87 C8         [ 4]  630     CALL STEXP 
      00A82E CD               [ 4]  631     RET  
                                    632 
                                    633 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    634 ;  2SWAP ( d1 d2 -- d2 d1 )
                                    635 ;  swap double 
                                    636 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002916                        637     _HEADER DSWAP,5,"2SWAP"
      00A82F 85 2C                    1         .word LINK 
                           002918     2         LINK=.
      00A831 A8                       3         .byte 5  
      00A832 3E CD 84 F9 00           4         .ascii "2SWAP"
      00291E                          5         DSWAP:
      00A837 45 CD            [ 1]  638     LDW Y,X 
      00A839 84 B8            [ 2]  639     LDW Y,(Y)
      00A83B CD 90 84         [ 2]  640     LDW YTEMP,Y ; d2 hi 
      00A83E 90 93            [ 1]  641     LDW Y,X 
      00A83E CD 85 C8         [ 2]  642     LDW Y,(2,Y)
      00A841 CD 86 DB         [ 2]  643     LDW XTEMP,Y  ; d2 lo 
      00A844 CD 85            [ 1]  644     LDW Y,X 
      00A846 60 81 A7         [ 2]  645     LDW Y,(4,Y)  ; d1 hi 
      00A849 AE               [ 2]  646     LDW (X),Y 
      00A84A 02 46            [ 1]  647     LDW Y,X
      00A84C 2E EE 06         [ 2]  648     LDW Y,(6,Y)  ; d1 lo 
      00A84D EF 02            [ 2]  649     LDW (2,X),Y
      00A84D CD 86 DB         [ 2]  650     LDW Y,YTEMP  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 136.
Hexadecimal [24-Bits]



      00A850 CD 85            [ 2]  651     LDW (4,X),Y 
      00A852 77 CD 85         [ 2]  652     LDW Y,XTEMP 
      00A855 E7 CD            [ 2]  653     LDW (6,X),Y 
      00A857 A4               [ 4]  654     RET 
                                    655 
                                    656 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    657 ;  RSCALE ( f# -- f# )
                                    658 ;  m /=fbase , e+=1 
                                    659 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002945                        660     _HEADER RSCALE,6,"RSCALE"
      00A858 D3 CD                    1         .word LINK 
                           002947     2         LINK=.
      00A85A 85                       3         .byte 6  
      00A85B 77 CD 86 DB CD 85        4         .ascii "RSCALE"
      00294E                          5         RSCALE:
      00A861 60 CD A6         [ 4]  661     CALL ATEXP 
      002951                        662     _DOLIT 1 
      00A864 53 CD 86         [ 4]    1     CALL DOLIT 
      00A867 1E CD                    2     .word 1 
      00A869 88 AC CD         [ 4]  663     CALL PLUS 
      00A86C 84 F9 00         [ 4]  664     CALL TOR 
      00A86F 08 CD 89         [ 4]  665     CALL FBASE 
      00A872 15 CD 85         [ 4]  666     CALL AT 
      00A875 2C A8 7B         [ 4]  667     CALL DSLMOD 
      00A878 CC A7 C9         [ 4]  668     CALL ROT 
      00A87B CD 05 94         [ 4]  669     CALL DROP 
      00A87B CD 8F A1         [ 4]  670     CALL RFROM 
      00A87E CD 85 E7         [ 4]  671     CALL STEXP 
      00A881 CD               [ 4]  672     RET 
                                    673 
                                    674 
                                    675 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    676 ;   DD* ( d1 d2 -- d3 )
                                    677 ;   double product 
                                    678 ;   
                                    679 ;   d3 = d1 * d2
                                    680 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002972                        681     _HEADER DDSTAR,3,"DD*"
      00A882 A5 31                    1         .word LINK 
                           002974     2         LINK=.
      00A884 CD                       3         .byte 3  
      00A885 85 2C A8                 4         .ascii "DD*"
      002978                          5         DDSTAR:
      002978                        682     _DOLIT 0 
      00A888 8C CD A5         [ 4]    1     CALL DOLIT 
      00A88B 79 00                    2     .word 0 
      00A88C CD 26 9E         [ 4]  683     CALL NROT  
      00A88C CD 8D 8E         [ 4]  684     CALL DUPP 
      00A88F CD 85 DB         [ 4]  685     CALL ZLESS 
      002986                        686     _QBRAN DDSTAR1 
      00A892 CD 86 57         [ 4]    1     CALL QBRAN
      00A895 CD 85                    2     .word DDSTAR1
      00A897 2C A8 C3         [ 4]  687     CALL DNEGA 
      00A89A CD 07 59         [ 4]  688     CALL ROT  
      00A89A CD A7 81         [ 4]  689     CALL INVER 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 137.
Hexadecimal [24-Bits]



      00A89D CD 85 C8         [ 4]  690     CALL NROT  
      002997                        691 DDSTAR1:
      00A8A0 CD 8B 17         [ 4]  692     CALL TOR 
      00A8A3 CD 87 C8         [ 4]  693     CALL TOR
      00A8A6 CD 85 2C         [ 4]  694     CALL NROT  
      00A8A9 A8 B3 CD         [ 4]  695     CALL DUPP 
      00A8AC 85 E7 CD         [ 4]  696     CALL ZLESS 
      0029A6                        697     _QBRAN DDSTAR2 
      00A8AF 85 43 A8         [ 4]    1     CALL QBRAN
      00A8B2 9A B7                    2     .word DDSTAR2
      00A8B3 CD 07 D6         [ 4]  698     CALL DNEGA 
      00A8B3 CD 84 F9         [ 4]  699     CALL ROT
      00A8B6 00 2E CD         [ 4]  700     CALL INVER 
      00A8B9 8D 9E CD         [ 4]  701     CALL NROT 
      0029B7                        702 DDSTAR2:
      00A8BC A7 9A CD         [ 4]  703     CALL DDUP 
      00A8BF 85 43 A8         [ 4]  704     CALL RFROM 
      00A8C2 D8 28 AE         [ 4]  705     CALL DSSTAR 
      00A8C3 CD 29 1E         [ 4]  706     CALL DSWAP 
      00A8C3 CD 85 43         [ 4]  707     CALL RFROM 
      00A8C6 A8 D0 AE         [ 4]  708     CALL DSSTAR 
      00A8C8 CD 05 94         [ 4]  709     CALL DROP
      00A8C8 CD 84 F9         [ 4]  710     CALL PLUS
      00A8CB 00 30 CD         [ 4]  711     CALL ROT 
      0029D2                        712     _QBRAN DDSTAR3 
      00A8CE 8D 9E AC         [ 4]    1     CALL QBRAN
      00A8D0 29 DA                    2     .word DDSTAR3
      00A8D0 CD 85 0D         [ 4]  713     CALL DNEGA 
      0029DA                        714 DDSTAR3:  
      00A8D3 A8               [ 4]  715     RET 
                                    716 
                                    717 
                                    718 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    719 ;    F* ( f#1 f#2 -- f#3 )
                                    720 ;    float product 
                                    721 ;    f#3=f#1 * f#2 
                                    722 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0029DB                        723     _HEADER FSTAR,2,"F*"
      00A8D4 C8 CD                    1         .word LINK 
                           0029DD     2         LINK=.
      00A8D6 A7                       3         .byte 2  
      00A8D7 9A 2A                    4         .ascii "F*"
      00A8D8                          5         FSTAR:
      00A8D8 CD A5 31         [ 4]  724     CALL ATEXP 
      00A8DB CD 85 2C         [ 4]  725     CALL TOR 
      00A8DE A8 E8 CD         [ 4]  726     CALL DSWAP 
      00A8E1 84 F9 00         [ 4]  727     CALL ATEXP
      00A8E4 2D CD 8D         [ 4]  728     CALL RFROM 
      00A8E7 9E 07 99         [ 4]  729     CALL PLUS  
      00A8E8 CD 05 67         [ 4]  730     CALL TOR
      00A8E8 CD 8D F3         [ 4]  731     CALL DDSTAR
      0029F8                        732     _DOLIT 0 
      00A8EB CD 8F CB         [ 4]    1     CALL DOLIT 
      00A8EE CD 85                    2     .word 0 
      00A8F0 C8 CD 86         [ 4]  733     CALL NROT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 138.
Hexadecimal [24-Bits]



      00A8F3 DB CD 85         [ 4]  734     CALL DUPP 
      00A8F6 60 81 D7         [ 4]  735     CALL ZLESS 
      00A8F8                        736     _QBRAN FSTAR1 
      00A8F8 E6 01 49         [ 4]    1     CALL QBRAN
      00A8FB F6 49                    2     .word FSTAR1
      00A8FD A0 01 98         [ 4]  737     CALL DNEGA 
      00A900 46 B7 28         [ 4]  738     CALL ROT 
      00A903 E6 01 48         [ 4]  739     CALL INVER 
      00A906 46 E7 01         [ 4]  740     CALL NROT 
      002A17                        741 FSTAR1:
      00A909 F6 B4 80         [ 4]  742     CALL DUPP
      002A1A                        743     _DOLIT 0X7F   
      00A90C BB 28 F7         [ 4]    1     CALL DOLIT 
      00A90F 81 7F                    2     .word 0X7F 
      00A910 CD 08 95         [ 4]  744     CALL GREAT 
      002A22                        745     _QBRAN FSTAR2 
      00A910 E6 01 49         [ 4]    1     CALL QBRAN
      00A913 F6 49                    2     .word FSTAR2
      00A915 AB 01 98         [ 4]  746     CALL FBASE 
      00A918 46 B7 28         [ 4]  747     CALL AT 
      00A91B E6 01 48         [ 4]  748     CALL DSLMOD 
      00A91E 46 E7 01         [ 4]  749     CALL ROT 
      00A921 F6 B4 80         [ 4]  750     CALL DROP
      00A924 BB 28 F7         [ 4]  751     CALL RFROM 
      00A927 81 A8 4A         [ 4]  752     CALL ONEP 
      00A92A 03 44 53         [ 4]  753     CALL TOR  
      002A3F                        754     _BRAN FSTAR1
      00A92D 2A 04 C3         [ 4]    1     CALL BRAN 
      00A92E 2A 17                    2     .word FSTAR1 
      002A44                        755 FSTAR2:
      00A92E CD 85 E7         [ 4]  756     CALL ROT 
      002A47                        757     _QBRAN FSTAR3 
      00A931 CD 86 1E         [ 4]    1     CALL QBRAN
      00A934 CD 86                    2     .word FSTAR3
      00A936 57 CD 86         [ 4]  758     CALL DNEGA 
      002A4F                        759 FSTAR3:     
      00A939 1E CD 85         [ 4]  760     CALL RFROM 
      00A93C E7 CD 85         [ 4]  761     CALL STEXP 
      00A93F 2C               [ 4]  762     RET 
                                    763 
                                    764 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    765 ;  F/ ( f#1 f#2 -- f#3 )
                                    766 ;  float division
                                    767 ;  f#3 = f#1/f#2
                                    768 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002A56                        769     _HEADER FSLASH,2,"F/"
      00A940 A9 45                    1         .word LINK 
                           002A58     2         LINK=.
      00A942 CD                       3         .byte 2  
      00A943 88 56                    4         .ascii "F/"
      00A945                          5         FSLASH:
      00A945 CD 85 C8         [ 4]  770     CALL ATEXP 
      00A948 CD A7 1E         [ 4]  771     CALL TOR 
      00A94B CD 86 2E         [ 4]  772     CALL NROT 
      00A94E CD 85 DB         [ 4]  773     CALL ATEXP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
Hexadecimal [24-Bits]



      00A951 CD 8A 4C         [ 4]  774     CALL TOR 
      00A954 CD 87 D9         [ 4]  775     CALL DSWAP 
                                    776 
      00A957 CD               [ 4]  777     RET     
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
Hexadecimal [24-Bits]



                                   4722 .endif 
                                   4723 
                                   4724 ;===============================================================
                                   4725 
                           002A58  4726 LASTN =	LINK   ;last name defined
                                   4727 
                                   4728 ; application code begin here
      002A80                       4729 	.bndry 128 ; align on flash block  
      002A80                       4730 app_space: 
                                   4731 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 141.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   6 AB1        000835 R   |   6 ABOR1      0013CF R
  6 ABOR2      0013E6 R   |   6 ABORQ      0013C7 R   |   6 ABORT      0013B8 R
  6 ABRTQ      0016A3 R   |   6 ABSS       00082C R   |   6 ACCEP      00134E R
  6 ACCP1      001357 R   |   6 ACCP2      00137D R   |   6 ACCP3      001380 R
  6 ACCP4      001382 R   |     ADC_CR1 =  005401     |     ADC_CR1_=  000000 
    ADC_CR1_=  000001     |     ADC_CR1_=  000004     |     ADC_CR1_=  000005 
    ADC_CR1_=  000006     |     ADC_CR2 =  005402     |     ADC_CR2_=  000003 
    ADC_CR2_=  000004     |     ADC_CR2_=  000005     |     ADC_CR2_=  000006 
    ADC_CR2_=  000001     |     ADC_CR3 =  005403     |     ADC_CR3_=  000007 
    ADC_CR3_=  000006     |     ADC_CSR =  005400     |     ADC_CSR_=  000006 
    ADC_CSR_=  000004     |     ADC_CSR_=  000000     |     ADC_CSR_=  000001 
    ADC_CSR_=  000002     |     ADC_CSR_=  000003     |     ADC_CSR_=  000007 
    ADC_CSR_=  000005     |     ADC_DRH =  005404     |     ADC_DRL =  005405 
    ADC_TDRH=  005406     |     ADC_TDRL=  005407     |   6 ADRADJ     000738 R
    AFR     =  004803     |     AFR0_ADC=  000000     |     AFR1_TIM=  000001 
    AFR2_CCO=  000002     |     AFR3_TIM=  000003     |     AFR4_TIM=  000004 
    AFR5_TIM=  000005     |     AFR6_I2C=  000006     |     AFR7_BEE=  000007 
  6 AFT        00168E R   |   6 AGAIN      0015E4 R   |   6 AHEAD      001641 R
  6 ALLOT      0014F7 R   |   6 ANDD       0005EA R   |     APP_CP  =  004004 
    APP_LAST=  004000     |     APP_RUN =  004002     |     APP_VP  =  004006 
  6 AT         0004F7 R   |   6 ATEXE      000C27 R   |   6 ATEXP      0025D3 R
  6 AUTORUN    00012B R   |     AWU_APR =  0050F1     |     AWU_CSR =  0050F0 
    AWU_TBR =  0050F2     |     B0_MASK =  000001     |     B115200 =  000006 
  6 B115K2     0003E2 R   |     B19200  =  000003     |   6 B19K2      0003BF R
    B1_MASK =  000002     |     B230400 =  000007     |     B2400   =  000000 
  6 B2K4       000390 R   |     B2_MASK =  000004     |     B38400  =  000004 
    B3_MASK =  000008     |     B460800 =  000008     |     B4800   =  000001 
  6 B4K8       00039E R   |     B4_MASK =  000010     |     B57600  =  000005 
  6 B57K6      0003D0 R   |     B5_MASK =  000020     |     B6_MASK =  000040 
    B7_MASK =  000080     |     B921600 =  000009     |     B9600   =  000002 
  6 B9K6       0003AE R   |   6 BACK1      0012F6 R   |   6 BASE       00065B R
    BASEE   =  00000A     |   6 BAUD       0003F2 R   |     BCNT    =  000001 
  6 BCOMP      001539 R   |   6 BDIGS      000D0E R   |     BEEP_BIT=  000004 
    BEEP_CSR=  0050F3     |     BEEP_MAS=  000010     |     BEEP_POR=  00000F 
  6 BEGIN      0015C6 R   |     BIT0    =  000000     |     BIT1    =  000001 
    BIT2    =  000002     |     BIT3    =  000003     |     BIT4    =  000004 
    BIT5    =  000005     |     BIT6    =  000006     |     BIT7    =  000007 
  6 BKSLA      00114B R   |   6 BKSP       0012C6 R   |     BKSPP   =  000008 
  6 BLANK      000AF6 R   |     BLOCK_SI=  000080     |     BOOT_ROM=  006000 
    BOOT_ROM=  007FFF     |   6 BRAN       0004C3 R   |     BTW     =  000001 
  6 BUF2ROW    00210E R   |   6 BYE        0000B8 R   |     CADR    =  000003 
    CALLL   =  0000CD     |   6 CALLOT     002357 R   |     CAN_DGR =  005426 
    CAN_FPSR=  005427     |     CAN_IER =  005425     |     CAN_MCR =  005420 
    CAN_MSR =  005421     |     CAN_P0  =  005428     |     CAN_P1  =  005429 
    CAN_P2  =  00542A     |     CAN_P3  =  00542B     |     CAN_P4  =  00542C 
    CAN_P5  =  00542D     |     CAN_P6  =  00542E     |     CAN_P7  =  00542F 
    CAN_P8  =  005430     |     CAN_P9  =  005431     |     CAN_PA  =  005432 
    CAN_PB  =  005433     |     CAN_PC  =  005434     |     CAN_PD  =  005435 
    CAN_PE  =  005436     |     CAN_PF  =  005437     |     CAN_RFR =  005424 
    CAN_TPR =  005423     |     CAN_TSR =  005422     |     CARRY   =  00002C 
    CASE_SEN=  000000     |   6 CAT        000515 R   |   6 CCOMMA     00151B R
    CC_C    =  000000     |     CC_H    =  000004     |     CC_I0   =  000003 
    CC_I1   =  000005     |     CC_N    =  000002     |     CC_V    =  000007 
    CC_Z    =  000001     |     CELLL   =  000002     |   6 CELLM      000A7B R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 142.
Hexadecimal [24-Bits]

Symbol Table

  6 CELLP      000A6C R   |   6 CELLS      000A8A R   |     CFG_GCR =  007F60 
    CFG_GCR_=  000001     |     CFG_GCR_=  000000     |   6 CHAR1      000F3B R
  6 CHAR2      000F3E R   |   6 CHKIVEC    001FFC R   |     CLKOPT  =  004807 
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
    CLK_SWR_=  0000E1     |     CLK_SWR_=  0000D2     |   6 CMOV1      000C46 R
  6 CMOV2      000C5E R   |   6 CMOVE      000C3E R   |     CNTDWN  =  000034 
  6 CNTXT      0006DE R   |   6 COLD       001AFD R   |   6 COLD1      001AFD R
  6 COLON      00183C R   |   6 COMMA      001504 R   |   6 COMPI      001549 R
    COMPO   =  000040     |   6 CONSTANT   0018E6 R   |   6 COUNT      000BDA R
  6 CPP        0006FA R   |     CPU_A   =  007F00     |     CPU_CCR =  007F0A 
    CPU_PCE =  007F01     |     CPU_PCH =  007F02     |     CPU_PCL =  007F03 
    CPU_SPH =  007F08     |     CPU_SPL =  007F09     |     CPU_XH  =  007F04 
    CPU_XL  =  007F05     |     CPU_YH  =  007F06     |     CPU_YL  =  007F07 
  6 CR         000F69 R   |   6 CREAT      001882 R   |     CRR     =  00000D 
  6 CSTOR      000504 R   |   6 CTABLE     002378 R   |   6 CTAT       002399 R
  6 CTINIT     0023C1 R   |   6 DAT        000BBA R   |     DATSTK  =  001680 
  6 DCONST     001922 R   |   6 DDIG       002701 R   |   6 DDIGS      00271A R
  6 DDROP      000779 R   |   6 DDSTAR     002978 R   |   6 DDSTAR1    002997 R
  6 DDSTAR2    0029B7 R   |   6 DDSTAR3    0029DA R   |   6 DDUP       000784 R
    DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF     |   6 DECEXP     002878 R
  6 DECIM      000DBE R   |   6 DEPTH      000B45 R   |     DEVID_BA=  0048CD 
    DEVID_EN=  0048D8     |     DEVID_LO=  0048D2     |     DEVID_LO=  0048D3 
    DEVID_LO=  0048D4     |     DEVID_LO=  0048D5     |     DEVID_LO=  0048D6 
    DEVID_LO=  0048D7     |     DEVID_LO=  0048D8     |     DEVID_WA=  0048D1 
    DEVID_XH=  0048CE     |     DEVID_XL=  0048CD     |     DEVID_YH=  0048D0 
    DEVID_YL=  0048CF     |   6 DGTQ1      000E03 R   |   6 DI         0000C6 R
  6 DIG        000D37 R   |   6 DIGIT      000CD2 R   |   6 DIGS       000D48 R
  6 DIGS1      000D48 R   |   6 DIGS2      000D55 R   |   6 DIGTQ      000DD2 R
    DISCOVER=  000000     |     DM_BK1RE=  007F90     |     DM_BK1RH=  007F91 
    DM_BK1RL=  007F92     |     DM_BK2RE=  007F93     |     DM_BK2RH=  007F94 
    DM_BK2RL=  007F95     |     DM_CR1  =  007F96     |     DM_CR2  =  007F97 
    DM_CSR1 =  007F98     |     DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A 
  6 DN1        0007F3 R   |   6 DNEG1      002518 R   |   6 DNEGA      0007D6 R
  6 DNEGAT     0024F9 R   |   6 DOCONST    001910 R   |   6 DOLIT      000479 R
  6 DONXT      00048D R   |     DOORBELL=  000000     |   6 DOSTR      000F7F R
  6 DOT        001004 R   |   6 DOT1       00101A R   |   6 DOTI1      001A7E R
  6 DOTID      001A68 R   |   6 DOTO1      00145B R   |   6 DOTOK      001441 R
  6 DOTPR      00112D R   |   6 DOTQ       0016BD R   |   6 DOTQP      000FA8 R
  6 DOTR       000FB6 R   |   6 DOTS       001A0A R   |   6 DOTS1      001A15 R
  6 DOTS2      001A1E R   |   6 DOVAR      00064B R   |   6 DO_DCONS   001951 R
  6 DROP       000594 R   |   6 DSLMOD     0026C0 R   |   6 DSLMOD3    0026DB R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 143.
Hexadecimal [24-Bits]

Symbol Table

  6 DSLMOD4    0026E7 R   |   6 DSLMODa    0026E2 R   |   6 DSLMODb    0026ED R
  6 DSSTAR     0028AE R   |   6 DSSTAR1    0028C5 R   |   6 DSSTAR3    0028EE R
  6 DSTOR      000B94 R   |   6 DSWAP      00291E R   |   6 DUMP       0019C0 R
  6 DUMP1      0019D7 R   |   6 DUMP3      0019F9 R   |   6 DUMPP      00198F R
  6 DUPP       00059E R   |   6 DZEQUAL    0024DB R   |   6 EDIGS      000D73 R
  6 EDOT       002731 R   |   6 EDOT0      002749 R   |   6 EDOT1      002757 R
  6 EDOT2      00275D R   |   6 EDOT3      002776 R   |   6 EDOT4      0027A2 R
  6 EDOT5      0027BE R   |   6 EECSTORE   001DAD R   |   6 EEPCP      001BD3 R
  6 EEPLAST    001BA6 R   |   6 EEPROM     001B8E R   |     EEPROM_B=  004000 
    EEPROM_E=  0047FF     |     EEPROM_R=  000010     |     EEPROM_S=  000800 
  6 EEPRUN     001BBD R   |   6 EEPVP      001BE9 R   |   6 EESTORE    001DF9 R
  6 EE_CCOMM   0020C3 R   |   6 EE_COMMA   0020A2 R   |   6 EE_CREAD   001D3E R
  6 EE_READ    001D1C R   |   6 EI         0000BF R   |   6 ELSEE      00161C R
  6 EMIT       000438 R   |   6 ENEPER     0022E3 R   |     EOL_CR  =  000001 
    EOL_LF  =  000000     |   6 EQ1        000850 R   |   6 EQUAL      00083A R
  6 ERASE      000CA0 R   |     ERR     =  00001B     |   6 EVAL       001484 R
  6 EVAL1      001484 R   |   6 EVAL2      0014A0 R   |   6 EXE1       000C35 R
  6 EXECU      0004D3 R   |     EXT     =  000000     |     EXTI_CR1=  0050A0 
    EXTI_CR2=  0050A1     |   6 EXTRC      000CFA R   |   6 FADDR      002190 R
  6 FARAT      001C54 R   |   6 FARCAT     001C60 R   |   6 FBASE      002453 R
  6 FC_XOFF    000465 R   |   6 FC_XON     00044F R   |   6 FDOT       0027CD R
  6 FDOT0      00280C R   |   6 FDOT1      0027FB R   |   6 FDOT10     002868 R
  6 FDOT2      00281A R   |   6 FDOT3      002833 R   |   6 FDOT6      002843 R
  6 FDOT7      002848 R   |   6 FDOT8      002850 R   |   6 FDOT9      002858 R
  6 FER        00248F R   |     FHSE    =  7A1200     |     FHSI    =  F42400 
  6 FILL       000C6D R   |   6 FILL1      000C8A R   |   6 FILL2      000C93 R
  6 FIND       001222 R   |   6 FIND1      001240 R   |   6 FIND2      00126E R
  6 FIND3      00127A R   |   6 FIND4      00128E R   |   6 FIND5      00129B R
  6 FIND6      00127F R   |   6 FINIT      002479 R   |     FLASH_BA=  008000 
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
  6 FMOVE      00219B R   |   6 FMOVE2     0021CC R   |   6 FNE        0024B1 R
  6 FOR        001599 R   |   6 FORGET     00015C R   |   6 FORGET1    00018B R
  6 FORGET2    000211 R   |   6 FORGET4    00021A R   |   6 FORGET6    0001D3 R
  6 FOV        0024C6 R   |   6 FPSTOR     001B6F R   |   6 FPSW       002442 R
    FPTR    =  000036     |   6 FREEVAR    000227 R   |   6 FREEVAR4   00025D R
  6 FRESET     002465 R   |   6 FSLASH     002A5B R   |   6 FSTAR      0029E0 R
  6 FSTAR1     002A17 R   |   6 FSTAR2     002A44 R   |   6 FSTAR3     002A4F R
  6 FZE        00249C R   |     GPIO_BAS=  005000     |     GPIO_CR1=  000003 
    GPIO_CR2=  000004     |     GPIO_DDR=  000002     |     GPIO_IDR=  000001 
    GPIO_ODR=  000000     |     GPIO_SIZ=  000005     |   6 GREAT      000895 R
  6 GREAT1     0008AB R   |   6 HERE       000BF1 R   |   6 HEX        000DA9 R
  6 HI         001ABA R   |   6 HLD        0006CB R   |   6 HOLD       000D1E R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
Hexadecimal [24-Bits]

Symbol Table

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
    I2C_WRIT=  000000     |   6 ICOLON     00184D R   |   6 IFETCH     0015B7 R
  6 IFF        0015F4 R   |   6 IFMOVE     002274 R   |     IMEDD   =  000080 
  6 IMMED      00185F R   |   6 INCEXP     002890 R   |   6 INCH       00042C R
  6 INC_FPTR   001CE9 R   |   6 INITOFS    001815 R   |   6 INN        000679 R
    INPUT_DI=  000000     |     INPUT_EI=  000001     |     INPUT_FL=  000000 
    INPUT_PU=  000001     |   6 INTE1      001423 R   |   6 INTER      0013F9 R
  6 INTQ       00241D R   |     INT_ADC2=  000016     |     INT_AUAR=  000012 
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
    INT_VECT=  00805C     |     INT_VECT=  008058     |   6 INVER      0007B3 R
    IPR0    =  000002     |     IPR1    =  000001     |     IPR2    =  000000 
    IPR3    =  000003     |     IPR_MASK=  000003     |     IRET_COD=  000080 
  6 ISEMI      0017AA R   |     ITC_SPR1=  007F70     |     ITC_SPR2=  007F71 
    ITC_SPR3=  007F72     |     ITC_SPR4=  007F73     |     ITC_SPR5=  007F74 
    ITC_SPR6=  007F75     |     ITC_SPR7=  007F76     |     ITC_SPR8=  007F77 
    IWDG_KR =  0050E0     |     IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2 
  6 JSRC       0017FF R   |   6 KEY        000EE9 R   |   6 KTAP       001313 R
  6 KTAP1      001336 R   |   6 KTAP2      001339 R   |   6 LAST       00070A R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 145.
Hexadecimal [24-Bits]

Symbol Table

  6 LASTN   =  002A58 R   |   6 LBRAC      001430 R   |     LED2_BIT=  000005 
    LED2_MAS=  000020     |     LED2_POR=  00500A     |   6 LESS       000877 R
    LF      =  00000A     |   6 LINK    =  002A58 R   |   6 LITER      00156B R
  6 LN2S       00233F R   |   6 LOCK       001CD5 R   |   6 LOG2S      002329 R
  6 LSCALE     0028F8 R   |   6 LSHIFT     000AB5 R   |   6 LSHIFT1    000ABE R
  6 LSHIFT4    000AC6 R   |   6 LT1        00088D R   |     MASKK   =  001F7F 
  6 MAX        0008B5 R   |   6 MAX1       0008C8 R   |   6 MIN        0008D2 R
  6 MIN1       0008E5 R   |   6 MMOD1      00096E R   |   6 MMOD2      000982 R
  6 MMOD3      000999 R   |   6 MMSM1      000929 R   |   6 MMSM3      00092D R
  6 MMSM4      000939 R   |   6 MMSMa      000934 R   |   6 MMSMb      00093F R
  6 MODD       0009B3 R   |   6 MONE       000B1C R   |     MS      =  000032 
  6 MSEC       0002D2 R   |   6 MSMOD      000951 R   |   6 MSTA1      000A44 R
  6 MSTAR      000A21 R   |     NAFR    =  004804     |   6 NAMEQ      0012BB R
  6 NAMET      0011CC R   |     NCLKOPT =  004808     |   6 NEGAT      0007C4 R
  6 NEX1       00049A R   |   6 NEXT       0015A8 R   |     NFLASH_W=  00480E 
    NHSECNT =  00480A     |     NOPT1   =  004802     |     NOPT2   =  004804 
    NOPT3   =  004806     |     NOPT4   =  004808     |     NOPT5   =  00480A 
    NOPT6   =  00480C     |     NOPT7   =  00480E     |     NOPTBL  =  00487F 
  6 NROT       00269E R   |   6 NTIB       000689 R   |     NUBC    =  004802 
    NUCLEO  =  000001     |   6 NUFQ       000EFF R   |   6 NUFQ1      000F18 R
  6 NUMBQ      000E16 R   |   6 NUMQ1      000E4A R   |   6 NUMQ2      000E7B R
  6 NUMQ3      000EBD R   |   6 NUMQ4      000EC2 R   |   6 NUMQ5      000ED1 R
  6 NUMQ6      000ED4 R   |     NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD 
    NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE 
  6 NonHandl   000000 R   |   6 OFFSET     00072F R   |     OFS     =  000005 
  6 ONE        000B0E R   |   6 ONEM       000AA4 R   |   6 ONEP       000A97 R
    OPT     =  000002     |     OPT0    =  004800     |     OPT1    =  004801 
    OPT2    =  004803     |     OPT3    =  004805     |     OPT4    =  004807 
    OPT5    =  004809     |     OPT6    =  00480B     |     OPT7    =  00480D 
    OPTBL   =  00487E     |     OPTIMIZE=  000001     |     OPTION_B=  004800 
    OPTION_E=  00487F     |     OPTION_S=  000080     |   6 ORIG       00004B R
  6 ORR        0005FE R   |   6 OUTPUT     00043D R   |     OUTPUT_F=  000001 
    OUTPUT_O=  000000     |     OUTPUT_P=  000001     |     OUTPUT_S=  000000 
  6 OVER       0005C8 R   |   6 OVERT      001778 R   |     PA      =  000000 
  6 PACKS      000CB1 R   |   6 PAD        000C02 R   |   6 PAREN      00113C R
  6 PARS       001035 R   |   6 PARS1      001060 R   |   6 PARS2      00108B R
  6 PARS3      00108E R   |   6 PARS4      001097 R   |   6 PARS5      0010BA R
  6 PARS6      0010CF R   |   6 PARS7      0010DE R   |   6 PARS8      0010ED R
  6 PARSE      0010FE R   |   6 PAUSE      0002E2 R   |     PA_BASE =  005000 
    PA_CR1  =  005003     |     PA_CR2  =  005004     |     PA_DDR  =  005002 
    PA_IDR  =  005001     |     PA_ODR  =  005000     |     PB      =  000005 
    PB_BASE =  005005     |     PB_CR1  =  005008     |     PB_CR2  =  005009 
    PB_DDR  =  005007     |     PB_IDR  =  005006     |     PB_ODR  =  005005 
    PC      =  00000A     |     PC_BASE =  00500A     |     PC_CR1  =  00500D 
    PC_CR2  =  00500E     |     PC_DDR  =  00500C     |     PC_IDR  =  00500B 
    PC_ODR  =  00500A     |     PD      =  00000F     |   6 PDUM1      0019A2 R
  6 PDUM2      0019B3 R   |     PD_BASE =  00500F     |     PD_CR1  =  005012 
    PD_CR2  =  005013     |     PD_DDR  =  005011     |     PD_IDR  =  005010 
    PD_ODR  =  00500F     |     PE      =  000014     |     PE_BASE =  005014 
    PE_CR1  =  005017     |     PE_CR2  =  005018     |     PE_DDR  =  005016 
    PE_IDR  =  005015     |     PE_ODR  =  005014     |     PF      =  000019 
    PF_BASE =  005019     |     PF_CR1  =  00501C     |     PF_CR2  =  00501D 
    PF_DDR  =  00501B     |     PF_IDR  =  00501A     |     PF_ODR  =  005019 
    PG      =  00001E     |     PG_BASE =  00501E     |     PG_CR1  =  005021 
    PG_CR2  =  005022     |     PG_DDR  =  005020     |     PG_IDR  =  00501F 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 146.
Hexadecimal [24-Bits]

Symbol Table

    PG_ODR  =  00501E     |     PH      =  000023     |     PH_BASE =  005023 
    PH_CR1  =  005026     |     PH_CR2  =  005027     |     PH_DDR  =  005025 
    PH_IDR  =  005024     |     PH_ODR  =  005023     |     PI      =  000028 
  6 PICK       000B5C R   |   6 PII        0022A2 R   |     PI_BASE =  005028 
    PI_CR1  =  00502B     |     PI_CR2  =  00502C     |     PI_DDR  =  00502A 
    PI_IDR  =  005029     |     PI_ODR  =  005028     |   6 PLUS       000799 R
  6 PNAM1      00172D R   |   6 POSMANT    00260D R   |   6 PRESE      0014AF R
    PROD1   =  000026     |     PROD2   =  000028     |     PROD3   =  00002A 
  6 PROTECTE   000203 R   |   6 PSTOR      000B73 R   |     PTR16   =  000037 
    PTR8    =  000038     |   6 PTRPLUS    001D01 R   |   6 QBRAN      0004AC R
  6 QDUP       000748 R   |   6 QDUP1      000752 R   |   6 QKEY       00041A R
  6 QSTAC      001467 R   |   6 QUERY      001393 R   |   6 QUEST      001027 R
  6 QUIT       0014CC R   |   6 QUIT1      0014D4 R   |   6 QUIT2      0014D7 R
  6 RAM2EE     00213C R   |     RAMBASE =  000000     |   6 RAMLAST    00071D R
    RAM_BASE=  000000     |     RAM_END =  0017FF     |     RAM_SIZE=  001800 
  6 RANDOM     000280 R   |   6 RAT        00055B R   |   6 RBRAC      0017EC R
  6 REPEA      001671 R   |   6 RFREE      002123 R   |   6 RFROM      000548 R
    ROP     =  004800     |   6 ROT        000759 R   |   6 ROW2BUF    0020E5 R
    ROWBUFF =  001680     |     RP0     =  000030     |   6 RPAT       000525 R
    RPP     =  0017FF     |   6 RPSTO      000532 R   |   6 RSCALE     00294E R
  6 RSHIFT     000AD1 R   |   6 RSHIFT1    000ADA R   |   6 RSHIFT4    000AE2 R
    RST_SR  =  0050B3     |   6 RT12_2     002312 R   |   6 SAME1      0011EA R
  6 SAME2      001213 R   |   6 SAMEQ      0011E2 R   |   6 SCOM1      001762 R
  6 SCOM2      001765 R   |   6 SCOMP      001744 R   |   6 SEED       000267 R
    SEEDX   =  00003A     |     SEEDY   =  00003C     |   6 SEMIS      001788 R
  6 SETISP     0000D2 R   |   6 SET_RAML   0018CF R   |   6 SFN        00257A R
    SFR_BASE=  005000     |     SFR_END =  0057FF     |   6 SFV        0025B2 R
  6 SFZ        002543 R   |   6 SIGN       000D5D R   |   6 SIGN1      000D6D R
  6 SLASH      0009BD R   |   6 SLMOD      0009A1 R   |   6 SNAME      0016F7 R
    SP0     =  00002E     |   6 SPACE      000F21 R   |   6 SPACS      000F30 R
  6 SPAT       00057E R   |     SPI_CR1 =  005200     |     SPI_CR2 =  005201 
    SPI_CRCP=  005205     |     SPI_DR  =  005204     |     SPI_ICR =  005202 
    SPI_RXCR=  005206     |     SPI_SR  =  005203     |     SPI_TXCR=  005207 
    SPP     =  001680     |     SPSAVE  =  000001     |   6 SPSTO      00058B R
  6 SQRT10     0022FB R   |   6 SQRT2      0022B9 R   |   6 SQRT3      0022D0 R
  6 SSMOD      000A4D R   |     SSP     =  000001     |     STACK   =  0017FF 
  6 STAR       000A16 R   |   6 STASL      000A5E R   |   6 STEXP      00261D R
  6 STEXP1     002633 R   |   6 STEXP2     00266F R   |   6 STEXP3     002682 R
  6 STOD       0007FB R   |   6 STORE      0004E0 R   |   6 STR        000D8B R
  6 STRCQ      001579 R   |   6 STRQ       0016B0 R   |   6 STRQP      000F9E R
  6 SUBB       000812 R   |   6 SWAPP      0005AE R   |     SWIM_CSR=  007F80 
  6 TAP        0012FD R   |   6 TBOOT      001AF1 R   |   6 TBUF       000699 R
    TBUFFBAS=  001680     |   6 TCHAR      000B2D R   |   6 TEMP       00066A R
  6 TEVAL      0006BC R   |   6 TFLASH     0006AB R   |   6 THENN      001609 R
  6 TIB        000C13 R   |     TIBB    =  001700     |     TIBBASE =  001700 
    TIC     =  000027     |   6 TICK       0014E3 R   |     TIM1_ARR=  005262 
    TIM1_ARR=  005263     |     TIM1_BKR=  00526D     |     TIM1_CCE=  00525C 
    TIM1_CCE=  00525D     |     TIM1_CCM=  005258     |     TIM1_CCM=  000000 
    TIM1_CCM=  000001     |     TIM1_CCM=  000004     |     TIM1_CCM=  000005 
    TIM1_CCM=  000006     |     TIM1_CCM=  000007     |     TIM1_CCM=  000002 
    TIM1_CCM=  000003     |     TIM1_CCM=  000007     |     TIM1_CCM=  000002 
    TIM1_CCM=  000004     |     TIM1_CCM=  000005     |     TIM1_CCM=  000006 
    TIM1_CCM=  000003     |     TIM1_CCM=  005259     |     TIM1_CCM=  000000 
    TIM1_CCM=  000001     |     TIM1_CCM=  000004     |     TIM1_CCM=  000005 
    TIM1_CCM=  000006     |     TIM1_CCM=  000007     |     TIM1_CCM=  000002 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 147.
Hexadecimal [24-Bits]

Symbol Table

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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 148.
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
    TIM4_SR =  005342     |     TIM4_SR_=  000000     |   6 TIMEOUTQ   000312 R
  6 TIMER      0002FC R   |     TIM_CR1_=  000007     |     TIM_CR1_=  000000 
    TIM_CR1_=  000006     |     TIM_CR1_=  000005     |     TIM_CR1_=  000004 
    TIM_CR1_=  000003     |     TIM_CR1_=  000001     |     TIM_CR1_=  000002 
  6 TNAM2      001A38 R   |   6 TNAM3      001A56 R   |   6 TNAM4      001A5C R
  6 TNAME      001A35 R   |   6 TOFLASH    000337 R   |   6 TOKEN      0011BE R
  6 TOR        000567 R   |   6 TORAM      000377 R   |     TRUEE   =  00FFFF 
  6 TWOSL      000AE9 R   |   6 TYPE1      000F50 R   |   6 TYPE2      000F5C R
  6 TYPES      000F4B R   |   6 Timer4Ha   000005 R   |     UART1   =  000000 
    UART1_BA=  005230     |     UART1_BR=  005232     |     UART1_BR=  005233 
    UART1_CR=  005234     |     UART1_CR=  005235     |     UART1_CR=  005236 
    UART1_CR=  005237     |     UART1_CR=  005238     |     UART1_DR=  005231 
    UART1_GT=  005239     |     UART1_PO=  000000     |     UART1_PS=  00523A 
    UART1_RX=  000004     |     UART1_SR=  005230     |     UART1_TX=  000005 
    UART3   =  000001     |     UART3_BA=  005240     |     UART3_BR=  005242 
    UART3_BR=  005243     |     UART3_CR=  005244     |     UART3_CR=  005245 
    UART3_CR=  005246     |     UART3_CR=  005247     |     UART3_CR=  004249 
    UART3_DR=  005241     |     UART3_PO=  00000F     |     UART3_RX=  000006 
    UART3_SR=  005240     |     UART3_TX=  000005     |     UART_BRR=  005232 
    UART_BRR=  005233     |     UART_CR1=  005234     |     UART_CR1=  000004 
    UART_CR1=  000002     |     UART_CR1=  000000     |     UART_CR1=  000001 
    UART_CR1=  000007     |     UART_CR1=  000006     |     UART_CR1=  000005 
    UART_CR1=  000003     |     UART_CR2=  005235     |     UART_CR2=  000004 
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
    UART_DR =  005231     |     UART_GTR=  000009     |     UART_PSC=  00000A 
    UART_SR =  005230     |     UART_SR_=  000001     |     UART_SR_=  000004 
    UART_SR_=  000002     |     UART_SR_=  000003     |     UART_SR_=  000000 
    UART_SR_=  000005     |     UART_SR_=  000006     |     UART_SR_=  000007 
    UBASE   =  000006     |     UBC     =  004801     |     UCNTXT  =  000018 
    UCP     =  00001C     |     UCTIB   =  000010     |     UD1     =  000001 
    UD2     =  000002     |     UD3     =  000003     |     UD4     =  000004 
  6 UDOT       000FF1 R   |   6 UDOTR      000FD1 R   |   6 UEND       000049 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 149.
Hexadecimal [24-Bits]

Symbol Table

    UFBASE  =  000008     |     UFPSW   =  00000A     |   6 UGREAT     002521 R
  6 UGREAT1    002539 R   |     UHLD    =  000016     |     UINN    =  00000E 
    UINTER  =  000014     |     ULAST   =  00001E     |   6 ULES1      00086F R
  6 ULESS      000859 R   |   6 UMMOD      00090D R   |   6 UMSTA      0009CC R
  6 UNIQ1      0016EE R   |   6 UNIQU      0016CF R   |   6 UNLKEE     001C6F R
  6 UNLKFL     001C8E R   |   6 UNLOCK     001CAD R   |   6 UNTIL      0015D1 R
    UOFFSET =  000020     |   6 UPDATCP    001C2C R   |   6 UPDATLAS   001C03 R
  6 UPDATPTR   00222F R   |   6 UPDATRUN   001C1B R   |   6 UPDATVP    001C43 R
  6 UPL1       00063F R   |   6 UPLUS      000628 R   |     UPP     =  000006 
  6 UPPER      001181 R   |   6 UPPER1     0011A4 R   |   6 UPPER2     0011AD R
    URLAST  =  000024     |     USR_BTN_=  000004     |     USR_BTN_=  000010 
    USR_BTN_=  005015     |     UTFLASH =  000022     |     UTIB    =  000012 
    UTMP    =  00000C     |   6 UTYP1      001972 R   |   6 UTYP2      001981 R
  6 UTYPE      00196D R   |     UVP     =  00001A     |   6 UZERO      00002B R
  6 VARIA      00189C R   |     VAR_BASE=  000080     |     VAR_TOP =  0017BF 
    VER     =  000003     |   6 VPP        0006EC R   |     VSIZE   =  000006 
    WANT_CON=  000001     |     WANT_DEB=  000000     |     WANT_FLO=  000001 
    WANT_SCA=  000001     |     WANT_SEE=  000000     |     WDGOPT  =  004805 
    WDGOPT_I=  000002     |     WDGOPT_L=  000003     |     WDGOPT_W=  000000 
    WDGOPT_W=  000001     |   6 WHILE      001657 R   |   6 WITHI      0008F2 R
  6 WORDD      001167 R   |   6 WORDS      001A92 R   |   6 WORS1      001A98 R
  6 WORS2      001AB4 R   |   6 WR_BYTE    001D58 R   |   6 WR_WORD    001D7D R
  6 WTABLE     002387 R   |   6 WTAT       0023AB R   |   6 WTINIT     0023F0 R
    WWDG_CR =  0050D1     |     WWDG_WR =  0050D2     |     XMEM_SIZ=  017830 
    XOFF    =  000013     |     XON     =  000011     |   6 XORR       000613 R
    XTEMP   =  000026     |     YTEMP   =  000028     |   6 ZEQ1       0024EB R
  6 ZERO       000B03 R   |   6 ZL1        0005E0 R   |   6 ZLESS      0005D7 R
  6 app_spac   002A80 R   |   6 baudrate   00037D R   |   6 block_er   001E43 R
  6 clear_ra   000019 R   |   6 clock_in   000066 R   |   6 copy_buf   001EA3 R
  6 copy_buf   001EC2 R   |   6 copy_pro   001EC2 R   |     da      =  000002 
    db      =  000003     |     dc      =  000000     |     dd      =  000001 
  6 erase_fl   001E65 R   |   6 fmove_do   002218 R   |   6 main       000016 R
  6 next_row   0021D5 R   |   6 no_move    00221F R   |   6 pristine   001F43 R
  6 proceed_   001E68 R   |   6 reboot     000329 R   |   6 reset_ve   001FAA R
  6 row_eras   001E23 R   |   6 row_eras   001E7C R   |   6 row_eras   001EA3 R
  6 set_opti   001F17 R   |   6 set_vect   00204B R   |   6 uart_ini   000078 R
  6 write_ro   001EE7 R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 150.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 DATA       size      0   flags    8
   2 DATA0      size      0   flags    8
   3 SSEG       size      0   flags    8
   4 SSEG1      size    100   flags    8
   5 HOME       size     80   flags    0
   6 CODE       size   2A80   flags    0

