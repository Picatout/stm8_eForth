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
      0080B9 94 18                  296         .word      INTER   ;'EVAL
      0080BB 00 00                  297         .word      0       ;HLD
      0080BD A7 31                  298         .word      LASTN  ;CNTXT pointer
      0080BF 00 80                  299         .word      VAR_BASE   ;variables free space pointer 
      0080C1 A8 00                  300         .word      app_space ; FLASH free space pointer 
      0080C3 A7 31                  301         .word      LASTN   ;LAST
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
      00812F CC 9B 1C         [ 2]  373         jp  COLD   ;default=MN1
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
      008180 CD 8B 17         [ 4]  438         call LSHIFT ; creat slot mask 
      008183 CD 88 33         [ 4]  439         call INVER  ; ( level reg lshift rval mask )
      008186 CD 86 6A         [ 4]  440         call ANDD ; ( level reg lshift slot_masked )
      008189 CD 85 E7         [ 4]  441         call TOR  ; ( level reg lshift -- R: slot_masked )
      00818C CD 87 D9         [ 4]  442         call ROT  ; ( reg lshift level )
      00818F CD 86 2E         [ 4]  443         call SWAPP ; ( reg level lshift )
      008192 CD 8B 17         [ 4]  444         call LSHIFT  ; ( reg slot_level -- )
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
      0081AB CD 91 DD         [ 4]  458         call TOKEN 
      0081AE CD 86 1E         [ 4]  459         call DUPP 
      0081B1 CD 85 2C         [ 4]  460         call QBRAN 
      0081B4 82 91                  461         .word FORGET2
      0081B6 CD 92 DA         [ 4]  462         call NAMEQ
      0081B9 CD 87 C8         [ 4]  463         call QDUP 
      0081BC CD 85 2C         [ 4]  464         call QBRAN 
      0081BF 82 91                  465         .word FORGET2
      0081C1 CD 86 14         [ 4]  466         call DROP 
      0081C4 1D 00 04         [ 2]  467         subw x,#2*CELLL 
      0081C7 90 5F            [ 1]  468         clrw y 
      0081C9 FF               [ 2]  469         ldw (x),y 
      0081CA 90 AE 40 02      [ 2]  470         ldw y,#APP_RUN 
      0081CE EF 02            [ 2]  471         ldw (2,x),y 
      0081D0 CC 9E 18         [ 2]  472         jp EESTORE 
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
      0081DC CD 91 DD         [ 4]  483         call TOKEN
      0081DF CD 86 1E         [ 4]  484         call DUPP 
      0081E2 CD 85 2C         [ 4]  485         call QBRAN 
      0081E5 82 91                  486         .word FORGET2
      0081E7 CD 92 DA         [ 4]  487         call NAMEQ ; ( a -- ca na | a F )
      0081EA CD 87 C8         [ 4]  488         call QDUP 
      0081ED CD 85 2C         [ 4]  489         call QBRAN 
      0081F0 82 91                  490         .word FORGET2
                                    491 ; only forget users words 
      0081F2 CD 86 1E         [ 4]  492         call DUPP ; ( ca na na )
      0081F5 CD 84 F9         [ 4]  493         call DOLIT 
      0081F8 A8 00                  494         .word app_space 
      0081FA CD 86 2E         [ 4]  495         call SWAPP 
      0081FD CD 88 D9         [ 4]  496         call  ULESS 
      008200 CD 85 2C         [ 4]  497         call QBRAN 
      008203 82 53                  498         .word FORGET6 
                                    499 ; ( ca na -- )        
                                    500 ;reset ivec with address >= ca
      008205 CD 86 2E         [ 4]  501         call SWAPP ; ( na ca -- ) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



      008208 CD A0 1B         [ 4]  502         call CHKIVEC ; ( na -- ) 
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
      00824D CD 9C 4B         [ 4]  530         call UPDATCP 
      008250 CC 9C 22         [ 2]  531         jp UPDATLAST 
      008253                        532 FORGET6: ; tried to forget a RAM or system word 
                                    533 ; ( ca na -- )
      008253 1D 00 02         [ 2]  534         subw x,#CELLL 
      008256 90 BE 2E         [ 2]  535         ldw y,SP0 
      008259 FF               [ 2]  536         ldw (x),y  
      00825A CD 88 D9         [ 4]  537         call ULESS
      00825D CD 85 2C         [ 4]  538         call QBRAN 
      008260 82 83                  539         .word PROTECTED 
      008262 CD 93 E6         [ 4]  540         call ABORQ 
      008265 1D                     541         .byte 29
      008266 20 46 6F 72 20 52 41   542         .ascii " For RAM definition do REBOOT"
             4D 20 64 65 66 69 6E
             69 74 69 6F 6E 20 64
             6F 20 52 45 42 4F 4F
             54
      008283                        543 PROTECTED:
      008283 CD 93 E6         [ 4]  544         call ABORQ
      008286 0A                     545         .byte 10
      008287 20 50 72 6F 74 65 63   546         .ascii " Protected"
             74 65 64
      008291                        547 FORGET2: ; no name or not found in dictionary 
      008291 CD 93 E6         [ 4]  548         call ABORQ
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
      0082AD CD 8A F9         [ 4]  567         call ONEP ;
      0082B0 CD 88 19         [ 4]  568         CALL PLUS ; ( na c+1 -- ca ) 
      0082B3 CD 8A F9         [ 4]  569         call ONEP ; ( ca+ -- ) to get routne address 
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
      0082DA CC 9C 62         [ 2]  583         jp UPDATVP 
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
      0083C5 CD 93 E6         [ 4]  750         call ABORQ 
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
                                   1735 ;       MAX     ( n n -- n )
                                   1736 ;       Return greater of two top items.
      008911 88 F5                 1737         .word      LINK
                           000893  1738 LINK = . 
      008913 03                    1739         .byte      3
      008914 4D 41 58              1740         .ascii     "MAX"
      008917                       1741 MAX:
      008917 90 93            [ 1] 1742         LDW Y,X    ;D = n2
      008919 90 EE 02         [ 2] 1743         LDW Y,(2,Y)
      00891C 90 BF 28         [ 2] 1744         LDW YTEMP,Y
      00891F 90 93            [ 1] 1745         LDW Y,X
      008921 90 FE            [ 2] 1746         LDW Y,(Y)
      008923 90 B3 28         [ 2] 1747         CPW Y,YTEMP     ;if n2 <> n1
      008926 2F 02            [ 1] 1748         JRSLT     MAX1
      008928 EF 02            [ 2] 1749         LDW (2,X),Y
      00892A 1C 00 02         [ 2] 1750 MAX1:   ADDW X,#2
      00892D 81               [ 4] 1751 	RET     
                                   1752 
                                   1753 ;       MIN     ( n n -- n )
                                   1754 ;       Return smaller of top two items.
      00892E 89 13                 1755         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



                           0008B0  1756 LINK = . 
      008930 03                    1757         .byte      3
      008931 4D 49 4E              1758         .ascii     "MIN"
      008934                       1759 MIN:
      008934 90 93            [ 1] 1760         LDW Y,X    ;D = n2
      008936 90 EE 02         [ 2] 1761         LDW Y,(2,Y)
      008939 90 BF 28         [ 2] 1762         LDW YTEMP,Y
      00893C 90 93            [ 1] 1763         LDW Y,X
      00893E 90 FE            [ 2] 1764         LDW Y,(Y)
      008940 90 B3 28         [ 2] 1765         CPW Y,YTEMP     ;if n2 <> n1
      008943 2C 02            [ 1] 1766         JRSGT     MIN1
      008945 EF 02            [ 2] 1767         LDW (2,X),Y
      008947 1C 00 02         [ 2] 1768 MIN1:	ADDW X,#2
      00894A 81               [ 4] 1769 	RET     
                                   1770 
                                   1771 ;       WITHIN  ( u ul uh -- t )
                                   1772 ;       Return true if u is within
                                   1773 ;       range of ul and uh. ( ul <= u < uh )
      00894B 89 30                 1774         .word      LINK
                           0008CD  1775 LINK = . 
      00894D 06                    1776         .byte      6
      00894E 57 49 54 48 49 4E     1777         .ascii     "WITHIN"
      008954                       1778 WITHI:
      008954 CD 86 48         [ 4] 1779         CALL     OVER
      008957 CD 88 92         [ 4] 1780         CALL     SUBB
      00895A CD 85 E7         [ 4] 1781         CALL     TOR
      00895D CD 88 92         [ 4] 1782         CALL     SUBB
      008960 CD 85 C8         [ 4] 1783         CALL     RFROM
      008963 CC 88 D9         [ 2] 1784         JP     ULESS
                                   1785 
                                   1786 ;; Divide
                                   1787 
                                   1788 ;       UM/MOD  ( udl udh un -- ur uq )
                                   1789 ;       Unsigned divide of a double by a
                                   1790 ;       single. Return mod and quotient.
      008966 89 4D                 1791         .word      LINK
                           0008E8  1792 LINK = . 
      008968 06                    1793         .byte      6
      008969 55 4D 2F 4D 4F 44     1794         .ascii     "UM/MOD"
                                   1795 ; 2021-02-22
                                   1796 ; changed algortihm for Jeeek one 
                                   1797 ; ref: https://github.com/TG9541/stm8ef/pull/406        
      00896F                       1798 UMMOD:
      00896F 90 93            [ 1] 1799         LDW     Y,X             ; stack pointer to Y
      008971 FE               [ 2] 1800         LDW     X,(X)           ; un
      008972 BF 28            [ 2] 1801         LDW     YTEMP,X         ; save un
      008974 93               [ 1] 1802         LDW     X,Y
      008975 5C               [ 1] 1803         INCW    X               ; drop un
      008976 5C               [ 1] 1804         INCW    X
      008977 89               [ 2] 1805         PUSHW   X               ; save stack pointer
      008978 FE               [ 2] 1806         LDW     X,(X)           ; X=udh
      008979 90 EE 04         [ 2] 1807         LDW     Y,(4,Y)         ; Y=udl (offset before drop)
      00897C B3 28            [ 2] 1808         CPW     X,YTEMP
      00897E 25 0B            [ 1] 1809         JRULT   MMSM1           ; X is still on the R-stack
      008980 85               [ 2] 1810         POPW    X               ; restore stack pointer
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



      008981 90 AE FF FF      [ 2] 1811         LDW     Y,#0xFFFF       ; overflow result:
      008985 FF               [ 2] 1812         LDW     (X),Y           ; quotient max. 16 bit value
      008986 90 5F            [ 1] 1813         CLRW    Y
      008988 EF 02            [ 2] 1814         LDW     (2,X),Y         ; remainder 0
      00898A 81               [ 4] 1815         RET
      00898B                       1816 MMSM1:
      00898B A6 10            [ 1] 1817         LD      A,#16           ; loop count
      00898D 90 58            [ 2] 1818         SLLW    Y               ; udl shift udl into udh
      00898F                       1819 MMSM3:
      00898F 59               [ 2] 1820         RLCW    X               ; rotate udl bit into uhdh (= remainder)
      008990 25 04            [ 1] 1821         JRC     MMSMa           ; if carry out of rotate
      008992 B3 28            [ 2] 1822         CPW     X,YTEMP         ; compare udh to un
      008994 25 05            [ 1] 1823         JRULT   MMSM4           ; can't subtract
      008996                       1824 MMSMa:
      008996 72 B0 00 28      [ 2] 1825         SUBW    X,YTEMP         ; can subtract
      00899A 98               [ 1] 1826         RCF
      00899B                       1827 MMSM4:
      00899B 8C               [ 1] 1828         CCF                     ; quotient bit
      00899C 90 59            [ 2] 1829         RLCW    Y               ; rotate into quotient, rotate out udl
      00899E 4A               [ 1] 1830         DEC     A               ; repeat
      00899F 26 EE            [ 1] 1831         JRNE    MMSM3           ; if A == 0
      0089A1                       1832 MMSMb:
      0089A1 BF 28            [ 2] 1833         LDW     YTEMP,X         ; done, save remainder
      0089A3 85               [ 2] 1834         POPW    X               ; restore stack pointer
      0089A4 FF               [ 2] 1835         LDW     (X),Y           ; save quotient
      0089A5 90 BE 28         [ 2] 1836         LDW     Y,YTEMP         ; remainder onto stack
      0089A8 EF 02            [ 2] 1837         LDW     (2,X),Y
      0089AA 81               [ 4] 1838         RET
                                   1839 
                                   1840 
                                   1841 ;----------------------------------------------	
                                   1842 ;       M/MOD   ( d n -- r q )
                                   1843 ;       Signed floored divide of double by
                                   1844 ;       single. Return mod and quotient.
                                   1845 ;----------------------------------------------	
      0089AB 89 68                 1846         .word      LINK
                           00092D  1847 LINK = . 
      0089AD 05                    1848         .byte      5
      0089AE 4D 2F 4D 4F 44        1849         .ascii     "M/MOD"
      0089B3                       1850 MSMOD:  
      0089B3 CD 86 1E         [ 4] 1851         CALL	DUPP
      0089B6 CD 86 57         [ 4] 1852         CALL	ZLESS
      0089B9 CD 86 1E         [ 4] 1853         CALL	DUPP
      0089BC CD 85 E7         [ 4] 1854         CALL	TOR
      0089BF CD 85 2C         [ 4] 1855         CALL	QBRAN
      0089C2 89 D0                 1856         .word	MMOD1
      0089C4 CD 88 44         [ 4] 1857         CALL	NEGAT
      0089C7 CD 85 E7         [ 4] 1858         CALL	TOR
      0089CA CD 88 56         [ 4] 1859         CALL	DNEGA
      0089CD CD 85 C8         [ 4] 1860         CALL	RFROM
      0089D0 CD 85 E7         [ 4] 1861 MMOD1:	CALL	TOR
      0089D3 CD 86 1E         [ 4] 1862         CALL	DUPP
      0089D6 CD 86 57         [ 4] 1863         CALL	ZLESS
      0089D9 CD 85 2C         [ 4] 1864         CALL	QBRAN
      0089DC 89 E4                 1865         .word	MMOD2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



      0089DE CD 85 DB         [ 4] 1866         CALL	RAT
      0089E1 CD 88 19         [ 4] 1867         CALL	PLUS
      0089E4 CD 85 C8         [ 4] 1868 MMOD2:	CALL	RFROM
      0089E7 CD 89 6F         [ 4] 1869         CALL	UMMOD
      0089EA CD 85 C8         [ 4] 1870         CALL	RFROM
      0089ED CD 85 2C         [ 4] 1871         CALL	QBRAN
      0089F0 89 FB                 1872         .word	MMOD3
      0089F2 CD 86 2E         [ 4] 1873         CALL	SWAPP
      0089F5 CD 88 44         [ 4] 1874         CALL	NEGAT
      0089F8 CD 86 2E         [ 4] 1875         CALL	SWAPP
      0089FB 81               [ 4] 1876 MMOD3:	RET
                                   1877 
                                   1878 ;       /MOD    ( n n -- r q )
                                   1879 ;       Signed divide. Return mod and quotient.
      0089FC 89 AD                 1880         .word      LINK
                           00097E  1881 LINK = . 
      0089FE 04                    1882         .byte      4
      0089FF 2F 4D 4F 44           1883         .ascii     "/MOD"
      008A03                       1884 SLMOD:
      008A03 CD 86 48         [ 4] 1885         CALL	OVER
      008A06 CD 86 57         [ 4] 1886         CALL	ZLESS
      008A09 CD 86 2E         [ 4] 1887         CALL	SWAPP
      008A0C CC 89 B3         [ 2] 1888         JP	MSMOD
                                   1889 
                                   1890 ;       MOD     ( n n -- r )
                                   1891 ;       Signed divide. Return mod only.
      008A0F 89 FE                 1892         .word      LINK
                           000991  1893 LINK = . 
      008A11 03                    1894         .byte      3
      008A12 4D 4F 44              1895         .ascii     "MOD"
      008A15                       1896 MODD:
      008A15 CD 8A 03         [ 4] 1897 	CALL	SLMOD
      008A18 CC 86 14         [ 2] 1898 	JP	DROP
                                   1899 
                                   1900 ;       /       ( n n -- q )
                                   1901 ;       Signed divide. Return quotient only.
      008A1B 8A 11                 1902         .word      LINK
                           00099D  1903 LINK = . 
      008A1D 01                    1904         .byte      1
      008A1E 2F                    1905         .ascii     "/"
      008A1F                       1906 SLASH:
      008A1F CD 8A 03         [ 4] 1907         CALL	SLMOD
      008A22 CD 86 2E         [ 4] 1908         CALL	SWAPP
      008A25 CC 86 14         [ 2] 1909         JP	DROP
                                   1910 
                                   1911 ;; Multiply
                                   1912 
                                   1913 ;       UM*     ( u u -- ud )
                                   1914 ;       Unsigned multiply. Return double product.
      008A28 8A 1D                 1915         .word      LINK
                           0009AA  1916 LINK = . 
      008A2A 03                    1917         .byte      3
      008A2B 55 4D 2A              1918         .ascii     "UM*"
      008A2E                       1919 UMSTA:	; stack have 4 bytes u1=a,b u2=c,d
                                   1920 ; take advantage of SP addressing modes
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



                                   1921 ; these PRODx in RAM are not required
                                   1922 ; the product is kept on stack as local variable 
                                   1923         ;; bytes offset on data stack 
                           000002  1924         da=2 
                           000003  1925         db=3 
                           000000  1926         dc=0 
                           000001  1927         dd=1 
                                   1928         ;; product bytes offset on return stack 
                           000001  1929         UD1=1  ; ud bits 31..24
                           000002  1930         UD2=2  ; ud bits 23..16
                           000003  1931         UD3=3  ; ud bits 15..8 
                           000004  1932         UD4=4  ; ud bits 7..0 
                                   1933         ;; local variable for product set to zero   
      008A2E 90 5F            [ 1] 1934         clrw y 
      008A30 90 89            [ 2] 1935         pushw y  ; bits 15..0
      008A32 90 89            [ 2] 1936         pushw y  ; bits 31..16 
      008A34 E6 03            [ 1] 1937         ld a,(db,x) ; b 
      008A36 90 97            [ 1] 1938         ld yl,a 
      008A38 E6 01            [ 1] 1939         ld a,(dd,x)   ; d
      008A3A 90 42            [ 4] 1940         mul y,a    ; b*d  
      008A3C 17 03            [ 2] 1941         ldw (UD3,sp),y ; lowest weight product 
      008A3E E6 03            [ 1] 1942         ld a,(db,x)
      008A40 90 97            [ 1] 1943         ld yl,a 
      008A42 E6 00            [ 1] 1944         ld a,(dc,x)
      008A44 90 42            [ 4] 1945         mul y,a  ; b*c 
                                   1946         ;;; do the partial sum 
      008A46 72 F9 02         [ 2] 1947         addw y,(UD2,sp)
      008A49 4F               [ 1] 1948         clr a 
      008A4A 49               [ 1] 1949         rlc a
      008A4B 6B 01            [ 1] 1950         ld (UD1,sp),a 
      008A4D 17 02            [ 2] 1951         ldw (UD2,sp),y 
      008A4F E6 02            [ 1] 1952         ld a,(da,x)
      008A51 90 97            [ 1] 1953         ld yl,a 
      008A53 E6 01            [ 1] 1954         ld a,(dd,x)
      008A55 90 42            [ 4] 1955         mul y,a   ; a*d 
                                   1956         ;; do partial sum 
      008A57 72 F9 02         [ 2] 1957         addw y,(UD2,sp)
      008A5A 4F               [ 1] 1958         clr a 
      008A5B 19 01            [ 1] 1959         adc a,(UD1,sp)
      008A5D 6B 01            [ 1] 1960         ld (UD1,sp),a  
      008A5F 17 02            [ 2] 1961         ldw (UD2,sp),y 
      008A61 E6 02            [ 1] 1962         ld a,(da,x)
      008A63 90 97            [ 1] 1963         ld yl,a 
      008A65 E6 00            [ 1] 1964         ld a,(dc,x)
      008A67 90 42            [ 4] 1965         mul y,a  ;  a*c highest weight product 
                                   1966         ;;; do partial sum 
      008A69 72 F9 01         [ 2] 1967         addw y,(UD1,sp)
      008A6C FF               [ 2] 1968         ldw (x),y  ; udh 
      008A6D 16 03            [ 2] 1969         ldw y,(UD3,sp)
      008A6F EF 02            [ 2] 1970         ldw (2,x),y  ; udl  
      008A71 5B 04            [ 2] 1971         addw sp,#4 ; drop local variable 
      008A73 81               [ 4] 1972         ret  
                                   1973 
                                   1974 
                                   1975 ;       *       ( n n -- n )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



                                   1976 ;       Signed multiply. Return single product.
      008A74 8A 2A                 1977         .word      LINK
                           0009F6  1978 LINK = . 
      008A76 01                    1979         .byte      1
      008A77 2A                    1980         .ascii     "*"
      008A78                       1981 STAR:
      008A78 CD 8A 2E         [ 4] 1982 	CALL	UMSTA
      008A7B CC 86 14         [ 2] 1983 	JP	DROP
                                   1984 
                                   1985 ;       M*      ( n n -- d )
                                   1986 ;       Signed multiply. Return double product.
      008A7E 8A 76                 1987         .word      LINK
                           000A00  1988 LINK = . 
      008A80 02                    1989         .byte      2
      008A81 4D 2A                 1990         .ascii     "M*"
      008A83                       1991 MSTAR:      
      008A83 CD 88 04         [ 4] 1992         CALL	DDUP
      008A86 CD 86 93         [ 4] 1993         CALL	XORR
      008A89 CD 86 57         [ 4] 1994         CALL	ZLESS
      008A8C CD 85 E7         [ 4] 1995         CALL	TOR
      008A8F CD 88 AC         [ 4] 1996         CALL	ABSS
      008A92 CD 86 2E         [ 4] 1997         CALL	SWAPP
      008A95 CD 88 AC         [ 4] 1998         CALL	ABSS
      008A98 CD 8A 2E         [ 4] 1999         CALL	UMSTA
      008A9B CD 85 C8         [ 4] 2000         CALL	RFROM
      008A9E CD 85 2C         [ 4] 2001         CALL	QBRAN
      008AA1 8A A6                 2002         .word	MSTA1
      008AA3 CD 88 56         [ 4] 2003         CALL	DNEGA
      008AA6 81               [ 4] 2004 MSTA1:	RET
                                   2005 
                                   2006 ;       */MOD   ( n1 n2 n3 -- r q )
                                   2007 ;       Multiply n1 and n2, then divide
                                   2008 ;       by n3. Return mod and quotient.
      008AA7 8A 80                 2009         .word      LINK
                           000A29  2010 LINK = . 
      008AA9 05                    2011         .byte      5
      008AAA 2A 2F 4D 4F 44        2012         .ascii     "*/MOD"
      008AAF                       2013 SSMOD:
      008AAF CD 85 E7         [ 4] 2014         CALL     TOR
      008AB2 CD 8A 83         [ 4] 2015         CALL     MSTAR
      008AB5 CD 85 C8         [ 4] 2016         CALL     RFROM
      008AB8 CC 89 B3         [ 2] 2017         JP     MSMOD
                                   2018 
                                   2019 ;       */      ( n1 n2 n3 -- q )
                                   2020 ;       Multiply n1 by n2, then divide
                                   2021 ;       by n3. Return quotient only.
      008ABB 8A A9                 2022         .word      LINK
                           000A3D  2023 LINK = . 
      008ABD 02                    2024         .byte      2
      008ABE 2A 2F                 2025         .ascii     "*/"
      008AC0                       2026 STASL:
      008AC0 CD 8A AF         [ 4] 2027         CALL	SSMOD
      008AC3 CD 86 2E         [ 4] 2028         CALL	SWAPP
      008AC6 CC 86 14         [ 2] 2029         JP	DROP
                                   2030 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



                                   2031 ;; Miscellaneous
                                   2032 
                                   2033 ;       CELL+   ( a -- a )
                                   2034 ;       Add cell size in byte to address.
      008AC9 8A BD                 2035         .word      LINK
                           000A4B  2036 LINK = . 
      008ACB 02                    2037         .byte       2
      008ACC 32 2B                 2038         .ascii     "2+"
      008ACE                       2039 CELLP:
      008ACE 90 93            [ 1] 2040         LDW Y,X
      008AD0 90 FE            [ 2] 2041 	LDW Y,(Y)
      008AD2 72 A9 00 02      [ 2] 2042         ADDW Y,#CELLL 
      008AD6 FF               [ 2] 2043         LDW (X),Y
      008AD7 81               [ 4] 2044         RET
                                   2045 
                                   2046 ;       CELL-   ( a -- a )
                                   2047 ;       Subtract 2 from address.
      008AD8 8A CB                 2048         .word      LINK
                           000A5A  2049 LINK = . 
      008ADA 02                    2050         .byte       2
      008ADB 32 2D                 2051         .ascii     "2-"
      008ADD                       2052 CELLM:
      008ADD 90 93            [ 1] 2053         LDW Y,X
      008ADF 90 FE            [ 2] 2054 	LDW Y,(Y)
      008AE1 72 A2 00 02      [ 2] 2055         SUBW Y,#CELLL
      008AE5 FF               [ 2] 2056         LDW (X),Y
      008AE6 81               [ 4] 2057         RET
                                   2058 
                                   2059 ;       CELLS   ( n -- n )
                                   2060 ;       Multiply tos by 2.
      008AE7 8A DA                 2061         .word      LINK
                           000A69  2062 LINK = . 
      008AE9 02                    2063         .byte       2
      008AEA 32 2A                 2064         .ascii     "2*"
      008AEC                       2065 CELLS:
      008AEC 90 93            [ 1] 2066         LDW Y,X
      008AEE 90 FE            [ 2] 2067 	LDW Y,(Y)
      008AF0 90 58            [ 2] 2068         SLAW Y
      008AF2 FF               [ 2] 2069         LDW (X),Y
      008AF3 81               [ 4] 2070         RET
                                   2071 
                                   2072 ;       1+      ( a -- a )
                                   2073 ;       Add cell size in byte to address.
      008AF4 8A E9                 2074         .word      LINK
                           000A76  2075 LINK = . 
      008AF6 02                    2076         .byte      2
      008AF7 31 2B                 2077         .ascii     "1+"
      008AF9                       2078 ONEP:
      008AF9 90 93            [ 1] 2079         LDW Y,X
      008AFB 90 FE            [ 2] 2080 	LDW Y,(Y)
      008AFD 90 5C            [ 1] 2081         INCW Y
      008AFF FF               [ 2] 2082         LDW (X),Y
      008B00 81               [ 4] 2083         RET
                                   2084 
                                   2085 ;       1-      ( a -- a )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



                                   2086 ;       Subtract 2 from address.
      008B01 8A F6                 2087         .word      LINK
                           000A83  2088 LINK = . 
      008B03 02                    2089         .byte      2
      008B04 31 2D                 2090         .ascii     "1-"
      008B06                       2091 ONEM:
      008B06 90 93            [ 1] 2092         LDW Y,X
      008B08 90 FE            [ 2] 2093 	LDW Y,(Y)
      008B0A 90 5A            [ 2] 2094         DECW Y
      008B0C FF               [ 2] 2095         LDW (X),Y
      008B0D 81               [ 4] 2096         RET
                                   2097 
                                   2098 ;  shift left n times 
                                   2099 ; LSHIFT ( n1 n2 -- n1<<n2 )
      008B0E 8B 03                 2100         .word LINK 
                           000A90  2101         LINK=.
      008B10 06                    2102         .byte 6 
      008B11 4C 53 48 49 46 54     2103         .ascii "LSHIFT"
      008B17                       2104 LSHIFT:
      008B17 E6 01            [ 1] 2105         ld a,(1,x)
      008B19 1C 00 02         [ 2] 2106         addw x,#CELLL 
      008B1C 90 93            [ 1] 2107         ldw y,x 
      008B1E 90 FE            [ 2] 2108         ldw y,(y)
      008B20                       2109 LSHIFT1:
      008B20 4D               [ 1] 2110         tnz a 
      008B21 27 05            [ 1] 2111         jreq LSHIFT4 
      008B23 90 58            [ 2] 2112         sllw y 
      008B25 4A               [ 1] 2113         dec a 
      008B26 20 F8            [ 2] 2114         jra LSHIFT1 
      008B28                       2115 LSHIFT4:
      008B28 FF               [ 2] 2116         ldw (x),y 
      008B29 81               [ 4] 2117         ret 
                                   2118 
                                   2119 ; shift right n times                 
                                   2120 ; RSHIFT (n1 n2 -- n1>>n2 )
      008B2A 8B 10                 2121         .word LINK 
                           000AAC  2122         LINK=.
      008B2C 06                    2123         .byte 6
      008B2D 52 53 48 49 46 54     2124         .ascii "RSHIFT"
      008B33                       2125 RSHIFT:
      008B33 E6 01            [ 1] 2126         ld a,(1,x)
      008B35 1C 00 02         [ 2] 2127         addw x,#CELLL 
      008B38 90 93            [ 1] 2128         ldw y,x 
      008B3A 90 FE            [ 2] 2129         ldw y,(y)
      008B3C                       2130 RSHIFT1:
      008B3C 4D               [ 1] 2131         tnz a 
      008B3D 27 05            [ 1] 2132         jreq RSHIFT4 
      008B3F 90 54            [ 2] 2133         srlw y 
      008B41 4A               [ 1] 2134         dec a 
      008B42 20 F8            [ 2] 2135         jra RSHIFT1 
      008B44                       2136 RSHIFT4:
      008B44 FF               [ 2] 2137         ldw (x),y 
      008B45 81               [ 4] 2138         ret 
                                   2139 
                                   2140 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



                                   2141 ;       2/      ( n -- n )
                                   2142 ;       divide  tos by 2.
      008B46 8B 2C                 2143         .word      LINK
                           000AC8  2144 LINK = . 
      008B48 02                    2145         .byte      2
      008B49 32 2F                 2146         .ascii     "2/"
      008B4B                       2147 TWOSL:
      008B4B 90 93            [ 1] 2148         LDW Y,X
      008B4D 90 FE            [ 2] 2149 	LDW Y,(Y)
      008B4F 90 57            [ 2] 2150         SRAW Y
      008B51 FF               [ 2] 2151         LDW (X),Y
      008B52 81               [ 4] 2152         RET
                                   2153 
                                   2154 ;       BL      ( -- 32 )
                                   2155 ;       Return 32,  blank character.
      008B53 8B 48                 2156         .word      LINK
                           000AD5  2157 LINK = . 
      008B55 02                    2158         .byte      2
      008B56 42 4C                 2159         .ascii     "BL"
      008B58                       2160 BLANK:
      008B58 1D 00 02         [ 2] 2161         SUBW X,#2
      008B5B 90 AE 00 20      [ 2] 2162 	LDW Y,#32
      008B5F FF               [ 2] 2163         LDW (X),Y
      008B60 81               [ 4] 2164         RET
                                   2165 
                                   2166 ;         0     ( -- 0)
                                   2167 ;         Return 0.
      008B61 8B 55                 2168         .word      LINK
                           000AE3  2169 LINK = . 
      008B63 01                    2170         .byte       1
      008B64 30                    2171         .ascii     "0"
      008B65                       2172 ZERO:
      008B65 1D 00 02         [ 2] 2173         SUBW X,#2
      008B68 90 5F            [ 1] 2174 	CLRW Y
      008B6A FF               [ 2] 2175         LDW (X),Y
      008B6B 81               [ 4] 2176         RET
                                   2177 
                                   2178 ;         1     ( -- 1)
                                   2179 ;         Return 1.
      008B6C 8B 63                 2180         .word      LINK
                           000AEE  2181 LINK = . 
      008B6E 01                    2182         .byte       1
      008B6F 31                    2183         .ascii     "1"
      008B70                       2184 ONE:
      008B70 1D 00 02         [ 2] 2185         SUBW X,#2
      008B73 90 AE 00 01      [ 2] 2186 	LDW Y,#1
      008B77 FF               [ 2] 2187         LDW (X),Y
      008B78 81               [ 4] 2188         RET
                                   2189 
                                   2190 ;         -1    ( -- -1)
                                   2191 ;         Return 32,  blank character.
      008B79 8B 6E                 2192         .word      LINK
                           000AFB  2193 LINK = . 
      008B7B 02                    2194         .byte       2
      008B7C 2D 31                 2195         .ascii     "-1"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



      008B7E                       2196 MONE:
      008B7E 1D 00 02         [ 2] 2197         SUBW X,#2
      008B81 90 AE FF FF      [ 2] 2198 	LDW Y,#0xFFFF
      008B85 FF               [ 2] 2199         LDW (X),Y
      008B86 81               [ 4] 2200         RET
                                   2201 
                                   2202 ;       >CHAR   ( c -- c )
                                   2203 ;       Filter non-printing characters.
      008B87 8B 7B                 2204         .word      LINK
                           000B09  2205 LINK = . 
      008B89 05                    2206         .byte      5
      008B8A 3E 43 48 41 52        2207         .ascii     ">CHAR"
      008B8F                       2208 TCHAR:
      008B8F E6 01            [ 1] 2209         ld a,(1,x)
      008B91 A1 20            [ 1] 2210         cp a,#32  
      008B93 2B 05            [ 1] 2211         jrmi 1$ 
      008B95 A1 7F            [ 1] 2212         cp a,#127 
      008B97 2A 01            [ 1] 2213         jrpl 1$ 
      008B99 81               [ 4] 2214         ret 
      008B9A A6 5F            [ 1] 2215 1$:     ld a,#'_ 
      008B9C E7 01            [ 1] 2216         ld (1,x),a 
      008B9E 81               [ 4] 2217         ret 
                                   2218 
                                   2219 ;       DEPTH   ( -- n )
                                   2220 ;       Return  depth of  data stack.
      008B9F 8B 89                 2221         .word      LINK
                           000B21  2222 LINK = . 
      008BA1 05                    2223         .byte      5
      008BA2 44 45 50 54 48        2224         .ascii     "DEPTH"
      008BA7                       2225 DEPTH: 
      008BA7 90 BE 2E         [ 2] 2226         LDW Y,SP0    ;save data stack ptr
      008BAA BF 26            [ 2] 2227 	LDW XTEMP,X
      008BAC 72 B2 00 26      [ 2] 2228         SUBW Y,XTEMP     ;#bytes = SP0 - X
      008BB0 90 57            [ 2] 2229         SRAW Y    ;Y = #stack items
      008BB2 1D 00 02         [ 2] 2230 	SUBW X,#2
      008BB5 FF               [ 2] 2231         LDW (X),Y     ; if neg, underflow
      008BB6 81               [ 4] 2232         RET
                                   2233 
                                   2234 ;       PICK    ( ... +n -- ... w )
                                   2235 ;       Copy  nth stack item to tos.
      008BB7 8B A1                 2236         .word      LINK
                           000B39  2237 LINK = . 
      008BB9 04                    2238         .byte      4
      008BBA 50 49 43 4B           2239         .ascii     "PICK"
      008BBE                       2240 PICK:
      008BBE 90 93            [ 1] 2241         LDW Y,X   ;D = n1
      008BC0 90 FE            [ 2] 2242         LDW Y,(Y)
                                   2243 ; modified for standard compliance          
                                   2244 ; 0 PICK must be equivalent to DUP 
      008BC2 90 5C            [ 1] 2245         INCW Y 
      008BC4 90 58            [ 2] 2246         SLAW Y
      008BC6 BF 26            [ 2] 2247         LDW XTEMP,X
      008BC8 72 B9 00 26      [ 2] 2248         ADDW Y,XTEMP
      008BCC 90 FE            [ 2] 2249         LDW Y,(Y)
      008BCE FF               [ 2] 2250         LDW (X),Y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



      008BCF 81               [ 4] 2251         RET
                                   2252 
                                   2253 ;; Memory access
                                   2254 
                                   2255 ;       +!      ( n a -- )
                                   2256 ;       Add n to  contents at address a.
      008BD0 8B B9                 2257         .word      LINK
                           000B52  2258 LINK = . 
      008BD2 02                    2259         .byte      2
      008BD3 2B 21                 2260         .ascii     "+!"
      008BD5                       2261 PSTOR:
      008BD5 90 93            [ 1] 2262         ldw y,x 
      008BD7 90 FE            [ 2] 2263         ldw y,(y)
      008BD9 90 BF 28         [ 2] 2264         ldw YTEMP,y  ; address
      008BDC 90 FE            [ 2] 2265         ldw y,(y)  
      008BDE 90 89            [ 2] 2266         pushw y  ; value at address 
      008BE0 90 93            [ 1] 2267         ldw y,x 
      008BE2 90 EE 02         [ 2] 2268         ldw y,(2,y) ; n 
      008BE5 72 F9 01         [ 2] 2269         addw y,(1,sp) ; n+value
      008BE8 91 CF 28         [ 5] 2270         ldw [YTEMP],y ;  a!
      008BEB 90 85            [ 2] 2271         popw y    ;drop local var
      008BED 1C 00 04         [ 2] 2272         addw x,#4 ; DDROP 
      008BF0 81               [ 4] 2273         ret 
                                   2274 
                                   2275 ;       2!      ( d a -- )
                                   2276 ;       Store  double integer to address a.
      008BF1 8B D2                 2277         .word      LINK
                           000B73  2278 LINK = . 
      008BF3 02                    2279         .byte      2
      008BF4 32 21                 2280         .ascii     "2!"
      008BF6                       2281 DSTOR:
      008BF6 90 93            [ 1] 2282         ldw y,x 
      008BF8 90 FE            [ 2] 2283         ldw y,(y)
      008BFA 90 BF 28         [ 2] 2284         ldw YTEMP,y ; address 
      008BFD 1C 00 02         [ 2] 2285         addw x,#CELLL ; drop a 
      008C00 90 93            [ 1] 2286         ldw y,x 
      008C02 90 FE            [ 2] 2287         ldw y,(y) ; hi word 
      008C04 89               [ 2] 2288         pushw x 
      008C05 EE 02            [ 2] 2289         ldw x,(2,x) ; lo word 
      008C07 91 CF 28         [ 5] 2290         ldw [YTEMP],y
      008C0A 90 93            [ 1] 2291         ldw y,x 
      008C0C AE 00 02         [ 2] 2292         ldw x,#2 
      008C0F 92 DF 28         [ 5] 2293         ldw ([YTEMP],x),y 
      008C12 85               [ 2] 2294         popw x 
      008C13 1C 00 04         [ 2] 2295         addw x,#4 ; DDROP 
      008C16 81               [ 4] 2296         ret 
                                   2297 
                                   2298 ;       2@      ( a -- d )
                                   2299 ;       Fetch double integer from address a.
      008C17 8B F3                 2300         .word      LINK
                           000B99  2301 LINK = . 
      008C19 02                    2302         .byte      2
      008C1A 32 40                 2303         .ascii     "2@"
      008C1C                       2304 DAT:
      008C1C 90 93            [ 1] 2305         ldw y,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



      008C1E 90 FE            [ 2] 2306         ldw y,(y) ;address 
      008C20 90 BF 28         [ 2] 2307         ldw YTEMP,y 
      008C23 1D 00 02         [ 2] 2308         subw x,#CELLL ; space for udh 
      008C26 91 CE 28         [ 5] 2309         ldw y,[YTEMP] ; udh 
      008C29 FF               [ 2] 2310         ldw (x),y 
      008C2A 90 AE 00 02      [ 2] 2311         ldw y,#2
      008C2E 91 DE 28         [ 5] 2312         ldw y,([YTEMP],y) ; udl 
      008C31 EF 02            [ 2] 2313         ldw (2,x),y
      008C33 81               [ 4] 2314         ret 
                                   2315 
                                   2316 ;       COUNT   ( b -- b +n )
                                   2317 ;       Return count byte of a string
                                   2318 ;       and add 1 to byte address.
      008C34 8C 19                 2319         .word      LINK
                           000BB6  2320 LINK = . 
      008C36 05                    2321         .byte      5
      008C37 43 4F 55 4E 54        2322         .ascii     "COUNT"
      008C3C                       2323 COUNT:
      008C3C 90 93            [ 1] 2324         ldw y,x 
      008C3E 90 FE            [ 2] 2325         ldw y,(y) ; address 
      008C40 90 F6            [ 1] 2326         ld a,(y)  ; count 
      008C42 90 5C            [ 1] 2327         incw y 
      008C44 FF               [ 2] 2328         ldw (x),y 
      008C45 1D 00 02         [ 2] 2329         subw x,#CELLL 
      008C48 E7 01            [ 1] 2330         ld (1,x),a 
      008C4A 7F               [ 1] 2331         clr (x)
      008C4B 81               [ 4] 2332         ret 
                                   2333 
                                   2334 ;       HERE    ( -- a )
                                   2335 ;       Return  top of  variables
      008C4C 8C 36                 2336         .word      LINK
                           000BCE  2337 LINK = . 
      008C4E 04                    2338         .byte      4
      008C4F 48 45 52 45           2339         .ascii     "HERE"
      008C53                       2340 HERE:
      008C53 90 AE 00 1A      [ 2] 2341       	ldw y,#UVP 
      008C57 90 FE            [ 2] 2342         ldw y,(y)
      008C59 1D 00 02         [ 2] 2343         subw x,#CELLL 
      008C5C FF               [ 2] 2344         ldw (x),y 
      008C5D 81               [ 4] 2345         ret 
                                   2346 
                                   2347 ;       PAD     ( -- a )
                                   2348 ;       Return address of text buffer
                                   2349 ;       above  code dictionary.
      008C5E 8C 4E                 2350         .word      LINK
                           000BE0  2351 LINK = . 
      008C60 03                    2352         .byte      3
      008C61 50 41 44              2353         .ascii     "PAD"
      008C64                       2354 PAD:
      008C64 CD 8C 53         [ 4] 2355         CALL     HERE
      008C67 CD 84 F9         [ 4] 2356         CALL     DOLIT
      008C6A 00 50                 2357         .word      80
      008C6C CC 88 19         [ 2] 2358         JP     PLUS
                                   2359 
                                   2360 ;       TIB     ( -- a )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



                                   2361 ;       Return address of terminal input buffer.
      008C6F 8C 60                 2362         .word      LINK
                           000BF1  2363 LINK = . 
      008C71 03                    2364         .byte      3
      008C72 54 49 42              2365         .ascii     "TIB"
      008C75                       2366 TIB:
      008C75 CD 87 09         [ 4] 2367         CALL     NTIB
      008C78 CD 8A CE         [ 4] 2368         CALL     CELLP
      008C7B CC 85 77         [ 2] 2369         JP     AT
                                   2370 
                                   2371 ;       @EXECUTE        ( a -- )
                                   2372 ;       Execute vector stored in address a.
      008C7E 8C 71                 2373         .word      LINK
                           000C00  2374 LINK = . 
      008C80 08                    2375         .byte      8
      008C81 40 45 58 45 43 55 54  2376         .ascii     "@EXECUTE"
             45
      008C89                       2377 ATEXE:
      008C89 CD 85 77         [ 4] 2378         CALL     AT
      008C8C CD 87 C8         [ 4] 2379         CALL     QDUP    ;?address or zero
      008C8F CD 85 2C         [ 4] 2380         CALL     QBRAN
      008C92 8C 97                 2381         .word      EXE1
      008C94 CD 85 53         [ 4] 2382         CALL     EXECU   ;execute if non-zero
      008C97 81               [ 4] 2383 EXE1:   RET     ;do nothing if zero
                                   2384 
                                   2385 ;       CMOVE   ( b1 b2 u -- )
                                   2386 ;       Copy u bytes from b1 to b2.
      008C98 8C 80                 2387         .word      LINK
                           000C1A  2388 LINK = . 
      008C9A 05                    2389         .byte      5
      008C9B 43 4D 4F 56 45        2390         .ascii     "CMOVE"
      008CA0                       2391 CMOVE:
      008CA0 CD 85 E7         [ 4] 2392         CALL	TOR
      008CA3 CD 85 43         [ 4] 2393         CALL	BRAN
      008CA6 8C C0                 2394         .word	CMOV2
      008CA8 CD 85 E7         [ 4] 2395 CMOV1:	CALL	TOR
      008CAB CD 86 1E         [ 4] 2396         CALL	DUPP
      008CAE CD 85 95         [ 4] 2397         CALL	CAT
      008CB1 CD 85 DB         [ 4] 2398         CALL	RAT
      008CB4 CD 85 84         [ 4] 2399         CALL	CSTOR
      008CB7 CD 8A F9         [ 4] 2400         CALL	ONEP
      008CBA CD 85 C8         [ 4] 2401         CALL	RFROM
      008CBD CD 8A F9         [ 4] 2402         CALL	ONEP
      008CC0 CD 85 0D         [ 4] 2403 CMOV2:	CALL	DONXT
      008CC3 8C A8                 2404         .word	CMOV1
      008CC5 CC 87 F9         [ 2] 2405         JP	DDROP
                                   2406 
                                   2407 ;       FILL    ( b u c -- )
                                   2408 ;       Fill u bytes of character c
                                   2409 ;       to area beginning at b.
      008CC8 8C 9A                 2410         .word       LINK
                           000C4A  2411 LINK = . 
      008CCA 04                    2412         .byte       4
      008CCB 46 49 4C 4C           2413         .ascii     "FILL"
      008CCF                       2414 FILL:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      008CCF 90 93            [ 1] 2415         ldw y,x 
      008CD1 90 E6 01         [ 1] 2416         ld a,(1,y) ; c 
      008CD4 1C 00 02         [ 2] 2417         addw x,#CELLL ; drop c 
      008CD7 90 93            [ 1] 2418         ldw y,x 
      008CD9 90 FE            [ 2] 2419         ldw y,(y) ; count
      008CDB 90 89            [ 2] 2420         pushw y 
      008CDD 1C 00 02         [ 2] 2421         addw x,#CELLL ; drop u 
      008CE0 90 93            [ 1] 2422         ldw y,x 
      008CE2 1C 00 02         [ 2] 2423         addw x,#CELLL ; drop b 
      008CE5 90 FE            [ 2] 2424         ldw y,(y) ; address
      008CE7 90 BF 28         [ 2] 2425         ldw YTEMP,y
      008CEA 90 85            [ 2] 2426         popw y ; count 
      008CEC                       2427 FILL1:  
      008CEC 92 C7 28         [ 4] 2428         ld [YTEMP],a 
      008CEF 3C 29            [ 1] 2429         inc YTEMP+1
      008CF1 24 02            [ 1] 2430         jrnc FILL2 
      008CF3 3C 28            [ 1] 2431         inc YTEMP
      008CF5                       2432 FILL2: 
      008CF5 90 5A            [ 2] 2433         decw y ; count 
      008CF7 26 F3            [ 1] 2434         jrne FILL1  
      008CF9 81               [ 4] 2435         ret 
                                   2436 
                                   2437 ;       ERASE   ( b u -- )
                                   2438 ;       Erase u bytes beginning at b.
      008CFA 8C CA                 2439         .word      LINK
                           000C7C  2440 LINK = . 
      008CFC 05                    2441         .byte      5
      008CFD 45 52 41 53 45        2442         .ascii     "ERASE"
      008D02                       2443 ERASE:
      008D02 90 5F            [ 1] 2444         clrw y 
      008D04 1D 00 02         [ 2] 2445         subw x,#CELLL 
      008D07 FF               [ 2] 2446         ldw (x),y 
      008D08 CC 8C CF         [ 2] 2447         jp FILL 
                                   2448 
                                   2449 
                                   2450 ;       PACK0   ( b u a -- a )
                                   2451 ;       Build a counted string with
                                   2452 ;       u characters from b. Null fill.
      008D0B 8C FC                 2453         .word      LINK
                           000C8D  2454 LINK = . 
      008D0D 05                    2455         .byte      5
      008D0E 50 41 43 4B 30        2456         .ascii     "PACK0"
      008D13                       2457 PACKS:
      008D13 CD 86 1E         [ 4] 2458         CALL     DUPP
      008D16 CD 85 E7         [ 4] 2459         CALL     TOR     ;strings only on cell boundary
      008D19 CD 88 04         [ 4] 2460         CALL     DDUP
      008D1C CD 85 84         [ 4] 2461         CALL     CSTOR
      008D1F CD 8A F9         [ 4] 2462         CALL     ONEP ;save count
      008D22 CD 86 2E         [ 4] 2463         CALL     SWAPP
      008D25 CD 8C A0         [ 4] 2464         CALL     CMOVE
      008D28 CD 85 C8         [ 4] 2465         CALL     RFROM
      008D2B 81               [ 4] 2466         RET
                                   2467 
                                   2468 ;; Numeric output, single precision
                                   2469 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



                                   2470 ;       DIGIT   ( u -- c )
                                   2471 ;       Convert digit u to a character.
      008D2C 8D 0D                 2472         .word      LINK
                           000CAE  2473 LINK = . 
      008D2E 05                    2474         .byte      5
      008D2F 44 49 47 49 54        2475         .ascii     "DIGIT"
      008D34                       2476 DIGIT:
      008D34 CD 84 F9         [ 4] 2477         CALL	DOLIT
      008D37 00 09                 2478         .word	9
      008D39 CD 86 48         [ 4] 2479         CALL	OVER
      008D3C CD 88 F7         [ 4] 2480         CALL	LESS
      008D3F CD 84 F9         [ 4] 2481         CALL	DOLIT
      008D42 00 07                 2482         .word	7
      008D44 CD 86 6A         [ 4] 2483         CALL	ANDD
      008D47 CD 88 19         [ 4] 2484         CALL	PLUS
      008D4A CD 84 F9         [ 4] 2485         CALL	DOLIT
      008D4D 00 30                 2486         .word	48	;'0'
      008D4F CC 88 19         [ 2] 2487         JP	PLUS
                                   2488 
                                   2489 ;       EXTRACT ( n base -- n c )
                                   2490 ;       Extract least significant digit from n.
      008D52 8D 2E                 2491         .word      LINK
                           000CD4  2492 LINK = . 
      008D54 07                    2493         .byte      7
      008D55 45 58 54 52 41 43 54  2494         .ascii     "EXTRACT"
      008D5C                       2495 EXTRC:
      008D5C CD 8B 65         [ 4] 2496         CALL     ZERO
      008D5F CD 86 2E         [ 4] 2497         CALL     SWAPP
      008D62 CD 89 6F         [ 4] 2498         CALL     UMMOD
      008D65 CD 86 2E         [ 4] 2499         CALL     SWAPP
      008D68 CC 8D 34         [ 2] 2500         JP     DIGIT
                                   2501 
                                   2502 ;       <#      ( -- )
                                   2503 ;       Initiate  numeric output process.
      008D6B 8D 54                 2504         .word      LINK
                           000CED  2505 LINK = . 
      008D6D 02                    2506         .byte      2
      008D6E 3C 23                 2507         .ascii     "<#"
      008D70                       2508 BDIGS:
      008D70 CD 8C 64         [ 4] 2509         CALL     PAD
      008D73 CD 87 4B         [ 4] 2510         CALL     HLD
      008D76 CC 85 60         [ 2] 2511         JP     STORE
                                   2512 
                                   2513 ;       HOLD    ( c -- )
                                   2514 ;       Insert a character into output string.
      008D79 8D 6D                 2515         .word      LINK
                           000CFB  2516 LINK = . 
      008D7B 04                    2517         .byte      4
      008D7C 48 4F 4C 44           2518         .ascii     "HOLD"
      008D80                       2519 HOLD:
      008D80 CD 87 4B         [ 4] 2520         CALL     HLD
      008D83 CD 85 77         [ 4] 2521         CALL     AT
      008D86 CD 8B 06         [ 4] 2522         CALL     ONEM
      008D89 CD 86 1E         [ 4] 2523         CALL     DUPP
      008D8C CD 87 4B         [ 4] 2524         CALL     HLD
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



      008D8F CD 85 60         [ 4] 2525         CALL     STORE
      008D92 CC 85 84         [ 2] 2526         JP     CSTOR
                                   2527 
                                   2528 ;       #       ( u -- u )
                                   2529 ;       Extract one digit from u and
                                   2530 ;       append digit to output string.
      008D95 8D 7B                 2531         .word      LINK
                           000D17  2532 LINK = . 
      008D97 01                    2533         .byte      1
      008D98 23                    2534         .ascii     "#"
      008D99                       2535 DIG:
      008D99 CD 86 DB         [ 4] 2536         CALL     BASE
      008D9C CD 85 77         [ 4] 2537         CALL     AT
      008D9F CD 8D 5C         [ 4] 2538         CALL     EXTRC
      008DA2 CC 8D 80         [ 2] 2539         JP     HOLD
                                   2540 
                                   2541 ;       #S      ( u -- 0 )
                                   2542 ;       Convert u until all digits
                                   2543 ;       are added to output string.
      008DA5 8D 97                 2544         .word      LINK
                           000D27  2545 LINK = . 
      008DA7 02                    2546         .byte      2
      008DA8 23 53                 2547         .ascii     "#S"
      008DAA                       2548 DIGS:
      008DAA CD 8D 99         [ 4] 2549 DIGS1:  CALL     DIG
      008DAD CD 86 1E         [ 4] 2550         CALL     DUPP
      008DB0 CD 85 2C         [ 4] 2551         CALL     QBRAN
      008DB3 8D B7                 2552         .word      DIGS2
      008DB5 20 F3            [ 2] 2553         JRA     DIGS1
      008DB7 81               [ 4] 2554 DIGS2:  RET
                                   2555 
                                   2556 ;       SIGN    ( n -- )
                                   2557 ;       Add a minus sign to
                                   2558 ;       numeric output string.
      008DB8 8D A7                 2559         .word      LINK
                           000D3A  2560 LINK = . 
      008DBA 04                    2561         .byte      4
      008DBB 53 49 47 4E           2562         .ascii     "SIGN"
      008DBF                       2563 SIGN:
      008DBF CD 86 57         [ 4] 2564         CALL     ZLESS
      008DC2 CD 85 2C         [ 4] 2565         CALL     QBRAN
      008DC5 8D CF                 2566         .word      SIGN1
      008DC7 CD 84 F9         [ 4] 2567         CALL     DOLIT
      008DCA 00 2D                 2568         .word      45	;"-"
      008DCC CC 8D 80         [ 2] 2569         JP     HOLD
      008DCF 81               [ 4] 2570 SIGN1:  RET
                                   2571 
                                   2572 ;       #>      ( w -- b u )
                                   2573 ;       Prepare output string.
      008DD0 8D BA                 2574         .word      LINK
                           000D52  2575 LINK = . 
      008DD2 02                    2576         .byte      2
      008DD3 23 3E                 2577         .ascii     "#>"
      008DD5                       2578 EDIGS:
      008DD5 CD 86 14         [ 4] 2579         CALL     DROP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      008DD8 CD 87 4B         [ 4] 2580         CALL     HLD
      008DDB CD 85 77         [ 4] 2581         CALL     AT
      008DDE CD 8C 64         [ 4] 2582         CALL     PAD
      008DE1 CD 86 48         [ 4] 2583         CALL     OVER
      008DE4 CC 88 92         [ 2] 2584         JP     SUBB
                                   2585 
                                   2586 ;       str     ( w -- b u )
                                   2587 ;       Convert a signed integer
                                   2588 ;       to a numeric string.
      008DE7 8D D2                 2589         .word      LINK
                           000D69  2590 LINK = . 
      008DE9 03                    2591         .byte      3
      008DEA 53 54 52              2592         .ascii     "STR"
      008DED                       2593 STR:
      008DED CD 86 1E         [ 4] 2594         CALL     DUPP
      008DF0 CD 85 E7         [ 4] 2595         CALL     TOR
      008DF3 CD 88 AC         [ 4] 2596         CALL     ABSS
      008DF6 CD 8D 70         [ 4] 2597         CALL     BDIGS
      008DF9 CD 8D AA         [ 4] 2598         CALL     DIGS
      008DFC CD 85 C8         [ 4] 2599         CALL     RFROM
      008DFF CD 8D BF         [ 4] 2600         CALL     SIGN
      008E02 CC 8D D5         [ 2] 2601         JP     EDIGS
                                   2602 
                                   2603 ;       HEX     ( -- )
                                   2604 ;       Use radix 16 as base for
                                   2605 ;       numeric conversions.
      008E05 8D E9                 2606         .word      LINK
                           000D87  2607 LINK = . 
      008E07 03                    2608         .byte      3
      008E08 48 45 58              2609         .ascii     "HEX"
      008E0B                       2610 HEX:
      008E0B CD 84 F9         [ 4] 2611         CALL     DOLIT
      008E0E 00 10                 2612         .word      16
      008E10 CD 86 DB         [ 4] 2613         CALL     BASE
      008E13 CC 85 60         [ 2] 2614         JP     STORE
                                   2615 
                                   2616 ;       DECIMAL ( -- )
                                   2617 ;       Use radix 10 as base
                                   2618 ;       for numeric conversions.
      008E16 8E 07                 2619         .word      LINK
                           000D98  2620 LINK = . 
      008E18 07                    2621         .byte      7
      008E19 44 45 43 49 4D 41 4C  2622         .ascii     "DECIMAL"
      008E20                       2623 DECIM:
      008E20 CD 84 F9         [ 4] 2624         CALL     DOLIT
      008E23 00 0A                 2625         .word      10
      008E25 CD 86 DB         [ 4] 2626         CALL     BASE
      008E28 CC 85 60         [ 2] 2627         JP     STORE
                                   2628 
                                   2629 ;; Numeric input, single precision
                                   2630 
                                   2631 ;       DIGIT?  ( c base -- u t )
                                   2632 ;       Convert a character to its numeric
                                   2633 ;       value. A flag indicates success.
      008E2B 8E 18                 2634         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



                           000DAD  2635 LINK = . 
      008E2D 06                    2636         .byte       6
      008E2E 44 49 47 49 54 3F     2637         .ascii     "DIGIT?"
      008E34                       2638 DIGTQ:
      008E34 CD 85 E7         [ 4] 2639         CALL     TOR
      008E37 CD 84 F9         [ 4] 2640         CALL     DOLIT
      008E3A 00 30                 2641         .word     48	; "0"
      008E3C CD 88 92         [ 4] 2642         CALL     SUBB
      008E3F CD 84 F9         [ 4] 2643         CALL     DOLIT
      008E42 00 09                 2644         .word      9
      008E44 CD 86 48         [ 4] 2645         CALL     OVER
      008E47 CD 88 F7         [ 4] 2646         CALL     LESS
      008E4A CD 85 2C         [ 4] 2647         CALL     QBRAN
      008E4D 8E 65                 2648         .word      DGTQ1
      008E4F CD 84 F9         [ 4] 2649         CALL     DOLIT
      008E52 00 07                 2650         .word      7
      008E54 CD 88 92         [ 4] 2651         CALL     SUBB
      008E57 CD 86 1E         [ 4] 2652         CALL     DUPP
      008E5A CD 84 F9         [ 4] 2653         CALL     DOLIT
      008E5D 00 0A                 2654         .word      10
      008E5F CD 88 F7         [ 4] 2655         CALL     LESS
      008E62 CD 86 7E         [ 4] 2656         CALL     ORR
      008E65 CD 86 1E         [ 4] 2657 DGTQ1:  CALL     DUPP
      008E68 CD 85 C8         [ 4] 2658         CALL     RFROM
      008E6B CC 88 D9         [ 2] 2659         JP     ULESS
                                   2660 
                                   2661 ;       NUMBER? ( a -- n T | a F )
                                   2662 ;       Convert a number string to
                                   2663 ;       integer. Push a flag on tos.
      008E6E 8E 2D                 2664         .word      LINK
                           000DF0  2665 LINK = . 
      008E70 07                    2666         .byte      7
      008E71 4E 55 4D 42 45 52 3F  2667         .ascii     "NUMBER?"
      008E78                       2668 NUMBQ:
      008E78 CD 86 DB         [ 4] 2669         CALL     BASE
      008E7B CD 85 77         [ 4] 2670         CALL     AT
      008E7E CD 85 E7         [ 4] 2671         CALL     TOR
      008E81 CD 8B 65         [ 4] 2672         CALL     ZERO
      008E84 CD 86 48         [ 4] 2673         CALL     OVER
      008E87 CD 8C 3C         [ 4] 2674         CALL     COUNT
      008E8A CD 86 48         [ 4] 2675         CALL     OVER
      008E8D CD 85 95         [ 4] 2676         CALL     CAT
      008E90 CD 84 F9         [ 4] 2677         CALL     DOLIT
      008E93 00 24                 2678         .word     36	; "0x"
      008E95 CD 88 BA         [ 4] 2679         CALL     EQUAL
      008E98 CD 85 2C         [ 4] 2680         CALL     QBRAN
      008E9B 8E AC                 2681         .word      NUMQ1
      008E9D CD 8E 0B         [ 4] 2682         CALL     HEX
      008EA0 CD 86 2E         [ 4] 2683         CALL     SWAPP
      008EA3 CD 8A F9         [ 4] 2684         CALL     ONEP
      008EA6 CD 86 2E         [ 4] 2685         CALL     SWAPP
      008EA9 CD 8B 06         [ 4] 2686         CALL     ONEM
      008EAC CD 86 48         [ 4] 2687 NUMQ1:  CALL     OVER
      008EAF CD 85 95         [ 4] 2688         CALL     CAT
      008EB2 CD 84 F9         [ 4] 2689         CALL     DOLIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



      008EB5 00 2D                 2690         .word     45	; "-"
      008EB7 CD 88 BA         [ 4] 2691         CALL     EQUAL
      008EBA CD 85 E7         [ 4] 2692         CALL     TOR
      008EBD CD 86 2E         [ 4] 2693         CALL     SWAPP
      008EC0 CD 85 DB         [ 4] 2694         CALL     RAT
      008EC3 CD 88 92         [ 4] 2695         CALL     SUBB
      008EC6 CD 86 2E         [ 4] 2696         CALL     SWAPP
      008EC9 CD 85 DB         [ 4] 2697         CALL     RAT
      008ECC CD 88 19         [ 4] 2698         CALL     PLUS
      008ECF CD 87 C8         [ 4] 2699         CALL     QDUP
      008ED2 CD 85 2C         [ 4] 2700         CALL     QBRAN
      008ED5 8F 36                 2701         .word      NUMQ6
      008ED7 CD 8B 06         [ 4] 2702         CALL     ONEM
      008EDA CD 85 E7         [ 4] 2703         CALL     TOR
      008EDD CD 86 1E         [ 4] 2704 NUMQ2:  CALL     DUPP
      008EE0 CD 85 E7         [ 4] 2705         CALL     TOR
      008EE3 CD 85 95         [ 4] 2706         CALL     CAT
      008EE6 CD 86 DB         [ 4] 2707         CALL     BASE
      008EE9 CD 85 77         [ 4] 2708         CALL     AT
      008EEC CD 8E 34         [ 4] 2709         CALL     DIGTQ
      008EEF CD 85 2C         [ 4] 2710         CALL     QBRAN
      008EF2 8F 24                 2711         .word      NUMQ4
      008EF4 CD 86 2E         [ 4] 2712         CALL     SWAPP
      008EF7 CD 86 DB         [ 4] 2713         CALL     BASE
      008EFA CD 85 77         [ 4] 2714         CALL     AT
      008EFD CD 8A 78         [ 4] 2715         CALL     STAR
      008F00 CD 88 19         [ 4] 2716         CALL     PLUS
      008F03 CD 85 C8         [ 4] 2717         CALL     RFROM
      008F06 CD 8A F9         [ 4] 2718         CALL     ONEP
      008F09 CD 85 0D         [ 4] 2719         CALL     DONXT
      008F0C 8E DD                 2720         .word      NUMQ2
      008F0E CD 85 DB         [ 4] 2721         CALL     RAT
      008F11 CD 86 2E         [ 4] 2722         CALL     SWAPP
      008F14 CD 86 14         [ 4] 2723         CALL     DROP
      008F17 CD 85 2C         [ 4] 2724         CALL     QBRAN
      008F1A 8F 1F                 2725         .word      NUMQ3
      008F1C CD 88 44         [ 4] 2726         CALL     NEGAT
      008F1F CD 86 2E         [ 4] 2727 NUMQ3:  CALL     SWAPP
      008F22 20 0F            [ 2] 2728         JRA     NUMQ5
      008F24 CD 85 C8         [ 4] 2729 NUMQ4:  CALL     RFROM
      008F27 CD 85 C8         [ 4] 2730         CALL     RFROM
      008F2A CD 87 F9         [ 4] 2731         CALL     DDROP
      008F2D CD 87 F9         [ 4] 2732         CALL     DDROP
      008F30 CD 8B 65         [ 4] 2733         CALL     ZERO
      008F33 CD 86 1E         [ 4] 2734 NUMQ5:  CALL     DUPP
      008F36 CD 85 C8         [ 4] 2735 NUMQ6:  CALL     RFROM
      008F39 CD 87 F9         [ 4] 2736         CALL     DDROP
      008F3C CD 85 C8         [ 4] 2737         CALL     RFROM
      008F3F CD 86 DB         [ 4] 2738         CALL     BASE
      008F42 CC 85 60         [ 2] 2739         JP     STORE
                                   2740 
                                   2741 ;; Basic I/O
                                   2742 
                                   2743 ;       KEY     ( -- c )
                                   2744 ;       Wait for and return an
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



                                   2745 ;       input character.
      008F45 8E 70                 2746         .word      LINK
                           000EC7  2747 LINK = . 
      008F47 03                    2748         .byte      3
      008F48 4B 45 59              2749         .ascii     "KEY"
      008F4B                       2750 KEY:
      008F4B 72 0B 52 30 FB   [ 2] 2751         btjf UART_SR,#UART_SR_RXNE,. 
      008F50 C6 52 31         [ 1] 2752         ld a,UART_DR 
      008F53 1D 00 02         [ 2] 2753         subw x,#CELLL 
      008F56 E7 01            [ 1] 2754         ld (1,x),a 
      008F58 7F               [ 1] 2755         clr (x)
      008F59 81               [ 4] 2756         ret 
                                   2757 
                                   2758 ;       NUF?    ( -- t )
                                   2759 ;       Return false if no input,
                                   2760 ;       else pause and if CR return true.
      008F5A 8F 47                 2761         .word      LINK
                           000EDC  2762 LINK = . 
      008F5C 04                    2763         .byte      4
      008F5D 4E 55 46 3F           2764         .ascii     "NUF?"
      008F61                       2765 NUFQ:
      008F61 CD 84 9A         [ 4] 2766         CALL     QKEY
      008F64 CD 86 1E         [ 4] 2767         CALL     DUPP
      008F67 CD 85 2C         [ 4] 2768         CALL     QBRAN
      008F6A 8F 7A                 2769         .word    NUFQ1
      008F6C CD 87 F9         [ 4] 2770         CALL     DDROP
      008F6F CD 8F 4B         [ 4] 2771         CALL     KEY
      008F72 CD 84 F9         [ 4] 2772         CALL     DOLIT
      008F75 00 0D                 2773         .word      CRR
      008F77 CC 88 BA         [ 2] 2774         JP     EQUAL
      008F7A 81               [ 4] 2775 NUFQ1:  RET
                                   2776 
                                   2777 ;       SPACE   ( -- )
                                   2778 ;       Send  blank character to
                                   2779 ;       output device.
      008F7B 8F 5C                 2780         .word      LINK
                           000EFD  2781 LINK = . 
      008F7D 05                    2782         .byte      5
      008F7E 53 50 41 43 45        2783         .ascii     "SPACE"
      008F83                       2784 SPACE:
      008F83 CD 8B 58         [ 4] 2785         CALL     BLANK
      008F86 CC 84 B8         [ 2] 2786         JP     EMIT
                                   2787 
                                   2788 ;       SPACES  ( +n -- )
                                   2789 ;       Send n spaces to output device.
      008F89 8F 7D                 2790         .word      LINK
                           000F0B  2791 LINK = . 
      008F8B 06                    2792         .byte      6
      008F8C 53 50 41 43 45 53     2793         .ascii     "SPACES"
      008F92                       2794 SPACS:
      008F92 CD 8B 65         [ 4] 2795         CALL     ZERO
      008F95 CD 89 17         [ 4] 2796         CALL     MAX
      008F98 CD 85 E7         [ 4] 2797         CALL     TOR
      008F9B 20 03            [ 2] 2798         JRA      CHAR2
      008F9D CD 8F 83         [ 4] 2799 CHAR1:  CALL     SPACE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



      008FA0 CD 85 0D         [ 4] 2800 CHAR2:  CALL     DONXT
      008FA3 8F 9D                 2801         .word    CHAR1
      008FA5 81               [ 4] 2802         RET
                                   2803 
                                   2804 ;       TYPE    ( b u -- )
                                   2805 ;       Output u characters from b.
      008FA6 8F 8B                 2806         .word      LINK
                           000F28  2807 LINK = . 
      008FA8 04                    2808         .byte      4
      008FA9 54 59 50 45           2809         .ascii     "TYPE"
      008FAD                       2810 TYPES:
      008FAD CD 85 E7         [ 4] 2811         CALL     TOR
      008FB0 20 0C            [ 2] 2812         JRA     TYPE2
      008FB2 CD 86 1E         [ 4] 2813 TYPE1:  CALL     DUPP
      008FB5 CD 85 95         [ 4] 2814         CALL     CAT
      008FB8 CD 84 B8         [ 4] 2815         CALL     EMIT
      008FBB CD 8A F9         [ 4] 2816         CALL     ONEP
      008FBE CD 85 0D         [ 4] 2817 TYPE2:  CALL     DONXT
      008FC1 8F B2                 2818         .word      TYPE1
      008FC3 CC 86 14         [ 2] 2819         JP     DROP
                                   2820 
                                   2821 ;       CR      ( -- )
                                   2822 ;       Output a carriage return
                                   2823 ;       and a line feed.
      008FC6 8F A8                 2824         .word      LINK
                           000F48  2825 LINK = . 
      008FC8 02                    2826         .byte      2
      008FC9 43 52                 2827         .ascii     "CR"
      008FCB                       2828 CR:
      008FCB CD 84 F9         [ 4] 2829         CALL     DOLIT
      008FCE 00 0D                 2830         .word      CRR
      008FD0 CD 84 B8         [ 4] 2831         CALL     EMIT
      008FD3 CD 84 F9         [ 4] 2832         CALL     DOLIT
      008FD6 00 0A                 2833         .word      LF
      008FD8 CC 84 B8         [ 2] 2834         JP     EMIT
                                   2835 
                                   2836 ;       do$     ( -- a )
                                   2837 ;       Return  address of a compiled
                                   2838 ;       string.
      008FDB 8F C8                 2839         .word      LINK
                           000F5D  2840 LINK = . 
      008FDD 43                    2841 	.byte      COMPO+3
      008FDE 44 4F 24              2842         .ascii     "DO$"
      008FE1                       2843 DOSTR:
      008FE1 CD 85 C8         [ 4] 2844         CALL     RFROM
      008FE4 CD 85 DB         [ 4] 2845         CALL     RAT
      008FE7 CD 85 C8         [ 4] 2846         CALL     RFROM
      008FEA CD 8C 3C         [ 4] 2847         CALL     COUNT
      008FED CD 88 19         [ 4] 2848         CALL     PLUS
      008FF0 CD 85 E7         [ 4] 2849         CALL     TOR
      008FF3 CD 86 2E         [ 4] 2850         CALL     SWAPP
      008FF6 CD 85 E7         [ 4] 2851         CALL     TOR
      008FF9 81               [ 4] 2852         RET
                                   2853 
                                   2854 ;       $"|     ( -- a )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



                                   2855 ;       Run time routine compiled by $".
                                   2856 ;       Return address of a compiled string.
      008FFA 8F DD                 2857         .word      LINK
                           000F7C  2858 LINK = . 
      008FFC 43                    2859 	.byte      COMPO+3
      008FFD 24 22 7C              2860         .byte     '$','"','|'
      009000                       2861 STRQP:
      009000 CD 8F E1         [ 4] 2862         CALL     DOSTR
      009003 81               [ 4] 2863         RET
                                   2864 
                                   2865 ;       ."|     ( -- )
                                   2866 ;       Run time routine of ." .
                                   2867 ;       Output a compiled string.
      009004 8F FC                 2868         .word      LINK
                           000F86  2869 LINK = . 
      009006 43                    2870 	.byte      COMPO+3
      009007 2E 22 7C              2871         .byte     '.','"','|'
      00900A                       2872 DOTQP:
      00900A CD 8F E1         [ 4] 2873         CALL     DOSTR
      00900D CD 8C 3C         [ 4] 2874         CALL     COUNT
      009010 CC 8F AD         [ 2] 2875         JP     TYPES
                                   2876 
                                   2877 ;       .R      ( n +n -- )
                                   2878 ;       Display an integer in a field
                                   2879 ;       of n columns, right justified.
      009013 90 06                 2880         .word      LINK
                           000F95  2881 LINK = . 
      009015 02                    2882         .byte      2
      009016 2E 52                 2883         .ascii     ".R"
      009018                       2884 DOTR:
      009018 CD 85 E7         [ 4] 2885         CALL     TOR
      00901B CD 8D ED         [ 4] 2886         CALL     STR
      00901E CD 85 C8         [ 4] 2887         CALL     RFROM
      009021 CD 86 48         [ 4] 2888         CALL     OVER
      009024 CD 88 92         [ 4] 2889         CALL     SUBB
      009027 CD 8F 92         [ 4] 2890         CALL     SPACS
      00902A CC 8F AD         [ 2] 2891         JP     TYPES
                                   2892 
                                   2893 ;       U.R     ( u +n -- )
                                   2894 ;       Display an unsigned integer
                                   2895 ;       in n column, right justified.
      00902D 90 15                 2896         .word      LINK
                           000FAF  2897 LINK = . 
      00902F 03                    2898         .byte      3
      009030 55 2E 52              2899         .ascii     "U.R"
      009033                       2900 UDOTR:
      009033 CD 85 E7         [ 4] 2901         CALL     TOR
      009036 CD 8D 70         [ 4] 2902         CALL     BDIGS
      009039 CD 8D AA         [ 4] 2903         CALL     DIGS
      00903C CD 8D D5         [ 4] 2904         CALL     EDIGS
      00903F CD 85 C8         [ 4] 2905         CALL     RFROM
      009042 CD 86 48         [ 4] 2906         CALL     OVER
      009045 CD 88 92         [ 4] 2907         CALL     SUBB
      009048 CD 8F 92         [ 4] 2908         CALL     SPACS
      00904B CC 8F AD         [ 2] 2909         JP     TYPES
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



                                   2910 
                                   2911 ;       U.      ( u -- )
                                   2912 ;       Display an unsigned integer
                                   2913 ;       in free format.
      00904E 90 2F                 2914         .word      LINK
                           000FD0  2915 LINK = . 
      009050 02                    2916         .byte      2
      009051 55 2E                 2917         .ascii     "U."
      009053                       2918 UDOT:
      009053 CD 8D 70         [ 4] 2919         CALL     BDIGS
      009056 CD 8D AA         [ 4] 2920         CALL     DIGS
      009059 CD 8D D5         [ 4] 2921         CALL     EDIGS
      00905C CD 8F 83         [ 4] 2922         CALL     SPACE
      00905F CC 8F AD         [ 2] 2923         JP     TYPES
                                   2924 
                                   2925 ;       .       ( w -- )
                                   2926 ;       Display an integer in free
                                   2927 ;       format, preceeded by a space.
      009062 90 50                 2928         .word      LINK
                           000FE4  2929 LINK = . 
      009064 01                    2930         .byte      1
      009065 2E                    2931         .ascii     "."
      009066                       2932 DOT:
      009066 CD 86 DB         [ 4] 2933         CALL     BASE
      009069 CD 85 77         [ 4] 2934         CALL     AT
      00906C CD 84 F9         [ 4] 2935         CALL     DOLIT
      00906F 00 0A                 2936         .word      10
      009071 CD 86 93         [ 4] 2937         CALL     XORR    ;?decimal
      009074 CD 85 2C         [ 4] 2938         CALL     QBRAN
      009077 90 7C                 2939         .word      DOT1
      009079 CC 90 53         [ 2] 2940         JP     UDOT
      00907C CD 8D ED         [ 4] 2941 DOT1:   CALL     STR
      00907F CD 8F 83         [ 4] 2942         CALL     SPACE
      009082 CC 8F AD         [ 2] 2943         JP     TYPES
                                   2944 
                                   2945 ;       ?       ( a -- )
                                   2946 ;       Display contents in memory cell.
      009085 90 64                 2947         .word      LINK
                                   2948         
                           001007  2949 LINK = . 
      009087 01                    2950         .byte      1
      009088 3F                    2951         .ascii     "?"
      009089                       2952 QUEST:
      009089 CD 85 77         [ 4] 2953         CALL     AT
      00908C CC 90 66         [ 2] 2954         JP     DOT
                                   2955 
                                   2956 ;; Parsing
                                   2957 
                                   2958 ;       parse   ( b u c -- b u delta ; <string> )
                                   2959 ;       Scan string delimited by c.
                                   2960 ;       Return found string and its offset.
      00908F 90 87                 2961         .word      LINK
                           001011  2962 LINK = . 
      009091 05                    2963         .byte      5
      009092 70 61 72 73 65        2964         .ascii     "parse"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      009097                       2965 PARS:
      009097 CD 86 EA         [ 4] 2966         CALL     TEMP
      00909A CD 85 60         [ 4] 2967         CALL     STORE
      00909D CD 86 48         [ 4] 2968         CALL     OVER
      0090A0 CD 85 E7         [ 4] 2969         CALL     TOR
      0090A3 CD 86 1E         [ 4] 2970         CALL     DUPP
      0090A6 CD 85 2C         [ 4] 2971         CALL     QBRAN
      0090A9 91 4F                 2972         .word    PARS8
      0090AB CD 8B 06         [ 4] 2973         CALL     ONEM
      0090AE CD 86 EA         [ 4] 2974         CALL     TEMP
      0090B1 CD 85 77         [ 4] 2975         CALL     AT
      0090B4 CD 8B 58         [ 4] 2976         CALL     BLANK
      0090B7 CD 88 BA         [ 4] 2977         CALL     EQUAL
      0090BA CD 85 2C         [ 4] 2978         CALL     QBRAN
      0090BD 90 F0                 2979         .word      PARS3
      0090BF CD 85 E7         [ 4] 2980         CALL     TOR
      0090C2 CD 8B 58         [ 4] 2981 PARS1:  CALL     BLANK
      0090C5 CD 86 48         [ 4] 2982         CALL     OVER
      0090C8 CD 85 95         [ 4] 2983         CALL     CAT     ;skip leading blanks ONLY
      0090CB CD 88 92         [ 4] 2984         CALL     SUBB
      0090CE CD 86 57         [ 4] 2985         CALL     ZLESS
      0090D1 CD 88 33         [ 4] 2986         CALL     INVER
      0090D4 CD 85 2C         [ 4] 2987         CALL     QBRAN
      0090D7 90 ED                 2988         .word      PARS2
      0090D9 CD 8A F9         [ 4] 2989         CALL     ONEP
      0090DC CD 85 0D         [ 4] 2990         CALL     DONXT
      0090DF 90 C2                 2991         .word      PARS1
      0090E1 CD 85 C8         [ 4] 2992         CALL     RFROM
      0090E4 CD 86 14         [ 4] 2993         CALL     DROP
      0090E7 CD 8B 65         [ 4] 2994         CALL     ZERO
      0090EA CC 86 1E         [ 2] 2995         JP     DUPP
      0090ED CD 85 C8         [ 4] 2996 PARS2:  CALL     RFROM
      0090F0 CD 86 48         [ 4] 2997 PARS3:  CALL     OVER
      0090F3 CD 86 2E         [ 4] 2998         CALL     SWAPP
      0090F6 CD 85 E7         [ 4] 2999         CALL     TOR
      0090F9 CD 86 EA         [ 4] 3000 PARS4:  CALL     TEMP
      0090FC CD 85 77         [ 4] 3001         CALL     AT
      0090FF CD 86 48         [ 4] 3002         CALL     OVER
      009102 CD 85 95         [ 4] 3003         CALL     CAT
      009105 CD 88 92         [ 4] 3004         CALL     SUBB    ;scan for delimiter
      009108 CD 86 EA         [ 4] 3005         CALL     TEMP
      00910B CD 85 77         [ 4] 3006         CALL     AT
      00910E CD 8B 58         [ 4] 3007         CALL     BLANK
      009111 CD 88 BA         [ 4] 3008         CALL     EQUAL
      009114 CD 85 2C         [ 4] 3009         CALL     QBRAN
      009117 91 1C                 3010         .word      PARS5
      009119 CD 86 57         [ 4] 3011         CALL     ZLESS
      00911C CD 85 2C         [ 4] 3012 PARS5:  CALL     QBRAN
      00911F 91 31                 3013         .word      PARS6
      009121 CD 8A F9         [ 4] 3014         CALL     ONEP
      009124 CD 85 0D         [ 4] 3015         CALL     DONXT
      009127 90 F9                 3016         .word      PARS4
      009129 CD 86 1E         [ 4] 3017         CALL     DUPP
      00912C CD 85 E7         [ 4] 3018         CALL     TOR
      00912F 20 0F            [ 2] 3019         JRA     PARS7
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      009131 CD 85 C8         [ 4] 3020 PARS6:  CALL     RFROM
      009134 CD 86 14         [ 4] 3021         CALL     DROP
      009137 CD 86 1E         [ 4] 3022         CALL     DUPP
      00913A CD 8A F9         [ 4] 3023         CALL     ONEP
      00913D CD 85 E7         [ 4] 3024         CALL     TOR
      009140 CD 86 48         [ 4] 3025 PARS7:  CALL     OVER
      009143 CD 88 92         [ 4] 3026         CALL     SUBB
      009146 CD 85 C8         [ 4] 3027         CALL     RFROM
      009149 CD 85 C8         [ 4] 3028         CALL     RFROM
      00914C CC 88 92         [ 2] 3029         JP     SUBB
      00914F CD 86 48         [ 4] 3030 PARS8:  CALL     OVER
      009152 CD 85 C8         [ 4] 3031         CALL     RFROM
      009155 CC 88 92         [ 2] 3032         JP     SUBB
                                   3033 
                                   3034 ;       PARSE   ( c -- b u ; <string> )
                                   3035 ;       Scan input stream and return
                                   3036 ;       counted string delimited by c.
      009158 90 91                 3037         .word      LINK
                           0010DA  3038 LINK = . 
      00915A 05                    3039         .byte      5
      00915B 50 41 52 53 45        3040         .ascii     "PARSE"
      009160                       3041 PARSE:
      009160 CD 85 E7         [ 4] 3042         CALL     TOR
      009163 CD 8C 75         [ 4] 3043         CALL     TIB
      009166 CD 86 F9         [ 4] 3044         CALL     INN
      009169 CD 85 77         [ 4] 3045         CALL     AT
      00916C CD 88 19         [ 4] 3046         CALL     PLUS    ;current input buffer pointer
      00916F CD 87 09         [ 4] 3047         CALL     NTIB
      009172 CD 85 77         [ 4] 3048         CALL     AT
      009175 CD 86 F9         [ 4] 3049         CALL     INN
      009178 CD 85 77         [ 4] 3050         CALL     AT
      00917B CD 88 92         [ 4] 3051         CALL     SUBB    ;remaining count
      00917E CD 85 C8         [ 4] 3052         CALL     RFROM
      009181 CD 90 97         [ 4] 3053         CALL     PARS
      009184 CD 86 F9         [ 4] 3054         CALL     INN
      009187 CC 8B D5         [ 2] 3055         JP     PSTOR
                                   3056 
                                   3057 ;       .(      ( -- )
                                   3058 ;       Output following string up to next ) .
      00918A 91 5A                 3059         .word      LINK
                           00110C  3060 LINK = . 
      00918C 82                    3061 	.byte      IMEDD+2
      00918D 2E 28                 3062         .ascii     ".("
      00918F                       3063 DOTPR:
      00918F CD 84 F9         [ 4] 3064         CALL     DOLIT
      009192 00 29                 3065         .word     41	; ")"
      009194 CD 91 60         [ 4] 3066         CALL     PARSE
      009197 CC 8F AD         [ 2] 3067         JP     TYPES
                                   3068 
                                   3069 ;       (       ( -- )
                                   3070 ;       Ignore following string up to next ).
                                   3071 ;       A comment.
      00919A 91 8C                 3072         .word      LINK
                           00111C  3073 LINK = . 
      00919C 81                    3074 	.byte      IMEDD+1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



      00919D 28                    3075         .ascii     "("
      00919E                       3076 PAREN:
      00919E CD 84 F9         [ 4] 3077         CALL     DOLIT
      0091A1 00 29                 3078         .word     41	; ")"
      0091A3 CD 91 60         [ 4] 3079         CALL     PARSE
      0091A6 CC 87 F9         [ 2] 3080         JP     DDROP
                                   3081 
                                   3082 ;       \       ( -- )
                                   3083 ;       Ignore following text till
                                   3084 ;       end of line.
      0091A9 91 9C                 3085         .word      LINK
                           00112B  3086 LINK = . 
      0091AB 81                    3087 	.byte      IMEDD+1
      0091AC 5C                    3088         .ascii     "\"
      0091AD                       3089 BKSLA:
      0091AD 90 AE 00 10      [ 2] 3090         ldw y,#UCTIB ; #TIB  
      0091B1 90 FE            [ 2] 3091         ldw y,(y)
      0091B3 90 89            [ 2] 3092         pushw y ; count in TIB 
      0091B5 90 AE 00 0E      [ 2] 3093         ldw y,#UINN ; >IN 
      0091B9 90 BF 28         [ 2] 3094         ldw YTEMP,y
      0091BC 90 85            [ 2] 3095         popw y 
      0091BE 91 CF 28         [ 5] 3096         ldw [YTEMP],y
      0091C1 81               [ 4] 3097         ret 
                                   3098 
                                   3099 ;       WORD    ( c -- a ; <string> )
                                   3100 ;       Parse a word from input stream
                                   3101 ;       and copy it to code dictionary.
      0091C2 91 AB                 3102         .word      LINK
                           001144  3103 LINK = . 
      0091C4 04                    3104         .byte      4
      0091C5 57 4F 52 44           3105         .ascii     "WORD"
      0091C9                       3106 WORDD:
      0091C9 CD 91 60         [ 4] 3107         CALL     PARSE
      0091CC CD 8C 53         [ 4] 3108         CALL     HERE
      0091CF CD 8A CE         [ 4] 3109         CALL     CELLP
      0091D2 CC 8D 13         [ 2] 3110         JP     PACKS
                                   3111 
                                   3112 ;       TOKEN   ( -- a ; <string> )
                                   3113 ;       Parse a word from input stream
                                   3114 ;       and copy it to name dictionary.
      0091D5 91 C4                 3115         .word      LINK
                           001157  3116 LINK = . 
      0091D7 05                    3117         .byte      5
      0091D8 54 4F 4B 45 4E        3118         .ascii     "TOKEN"
      0091DD                       3119 TOKEN:
      0091DD CD 8B 58         [ 4] 3120         CALL     BLANK
      0091E0 CC 91 C9         [ 2] 3121         JP     WORDD
                                   3122 
                                   3123 ;; Dictionary search
                                   3124 
                                   3125 ;       NAME>   ( na -- ca )
                                   3126 ;       Return a code address given
                                   3127 ;       a name address.
      0091E3 91 D7                 3128         .word      LINK
                           001165  3129 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      0091E5 05                    3130         .byte      5
      0091E6 4E 41 4D 45 3E        3131         .ascii     "NAME>"
      0091EB                       3132 NAMET:
      0091EB CD 8C 3C         [ 4] 3133         CALL     COUNT
      0091EE CD 84 F9         [ 4] 3134         CALL     DOLIT
      0091F1 00 1F                 3135         .word      31
      0091F3 CD 86 6A         [ 4] 3136         CALL     ANDD
      0091F6 CC 88 19         [ 2] 3137         JP     PLUS
                                   3138 
                                   3139 ;       SAME?   ( a a u -- a a f \ -0+ )
                                   3140 ;       Compare u cells in two
                                   3141 ;       strings. Return 0 if identical.
      0091F9 91 E5                 3142         .word      LINK
                           00117B  3143 LINK = . 
      0091FB 05                    3144         .byte       5
      0091FC 53 41 4D 45 3F        3145         .ascii     "SAME?"
      009201                       3146 SAMEQ:
      009201 CD 8B 06         [ 4] 3147         CALL     ONEM
      009204 CD 85 E7         [ 4] 3148         CALL     TOR
      009207 20 29            [ 2] 3149         JRA     SAME2
      009209 CD 86 48         [ 4] 3150 SAME1:  CALL     OVER
      00920C CD 85 DB         [ 4] 3151         CALL     RAT
      00920F CD 88 19         [ 4] 3152         CALL     PLUS
      009212 CD 85 95         [ 4] 3153         CALL     CAT
      009215 CD 86 48         [ 4] 3154         CALL     OVER
      009218 CD 85 DB         [ 4] 3155         CALL     RAT
      00921B CD 88 19         [ 4] 3156         CALL     PLUS
      00921E CD 85 95         [ 4] 3157         CALL     CAT
      009221 CD 88 92         [ 4] 3158         CALL     SUBB
      009224 CD 87 C8         [ 4] 3159         CALL     QDUP
      009227 CD 85 2C         [ 4] 3160         CALL     QBRAN
      00922A 92 32                 3161         .word      SAME2
      00922C CD 85 C8         [ 4] 3162         CALL     RFROM
      00922F CC 86 14         [ 2] 3163         JP     DROP
      009232 CD 85 0D         [ 4] 3164 SAME2:  CALL     DONXT
      009235 92 09                 3165         .word      SAME1
      009237 CC 8B 65         [ 2] 3166         JP     ZERO
                                   3167 
                                   3168 ;       find    ( a va -- ca na | a F )
                                   3169 ;       Search vocabulary for string.
                                   3170 ;       Return ca and na if succeeded.
      00923A 91 FB                 3171         .word      LINK
                           0011BC  3172 LINK = . 
      00923C 04                    3173         .byte      4
      00923D 46 49 4E 44           3174         .ascii     "FIND"
      009241                       3175 FIND:
      009241 CD 86 2E         [ 4] 3176         CALL     SWAPP
      009244 CD 86 1E         [ 4] 3177         CALL     DUPP
      009247 CD 85 95         [ 4] 3178         CALL     CAT
      00924A CD 86 EA         [ 4] 3179         CALL     TEMP
      00924D CD 85 60         [ 4] 3180         CALL     STORE
      009250 CD 86 1E         [ 4] 3181         CALL     DUPP
      009253 CD 85 77         [ 4] 3182         CALL     AT
      009256 CD 85 E7         [ 4] 3183         CALL     TOR
      009259 CD 8A CE         [ 4] 3184         CALL     CELLP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



      00925C CD 86 2E         [ 4] 3185         CALL     SWAPP
      00925F CD 85 77         [ 4] 3186 FIND1:  CALL     AT
      009262 CD 86 1E         [ 4] 3187         CALL     DUPP
      009265 CD 85 2C         [ 4] 3188         CALL     QBRAN
      009268 92 9E                 3189         .word      FIND6
      00926A CD 86 1E         [ 4] 3190         CALL     DUPP
      00926D CD 85 77         [ 4] 3191         CALL     AT
      009270 CD 84 F9         [ 4] 3192         CALL     DOLIT
      009273 1F 7F                 3193         .word      MASKK
      009275 CD 86 6A         [ 4] 3194         CALL     ANDD
      009278 CD 85 DB         [ 4] 3195         CALL     RAT
      00927B CD 86 93         [ 4] 3196         CALL     XORR
      00927E CD 85 2C         [ 4] 3197         CALL     QBRAN
      009281 92 8D                 3198         .word      FIND2
      009283 CD 8A CE         [ 4] 3199         CALL     CELLP
      009286 CD 84 F9         [ 4] 3200         CALL     DOLIT
      009289 FF FF                 3201         .word     0xFFFF
      00928B 20 0C            [ 2] 3202         JRA     FIND3
      00928D CD 8A CE         [ 4] 3203 FIND2:  CALL     CELLP
      009290 CD 86 EA         [ 4] 3204         CALL     TEMP
      009293 CD 85 77         [ 4] 3205         CALL     AT
      009296 CD 92 01         [ 4] 3206         CALL     SAMEQ
      009299 CD 85 43         [ 4] 3207 FIND3:  CALL     BRAN
      00929C 92 AD                 3208         .word      FIND4
      00929E CD 85 C8         [ 4] 3209 FIND6:  CALL     RFROM
      0092A1 CD 86 14         [ 4] 3210         CALL     DROP
      0092A4 CD 86 2E         [ 4] 3211         CALL     SWAPP
      0092A7 CD 8A DD         [ 4] 3212         CALL     CELLM
      0092AA CC 86 2E         [ 2] 3213         JP     SWAPP
      0092AD CD 85 2C         [ 4] 3214 FIND4:  CALL     QBRAN
      0092B0 92 BA                 3215         .word      FIND5
      0092B2 CD 8A DD         [ 4] 3216         CALL     CELLM
      0092B5 CD 8A DD         [ 4] 3217         CALL     CELLM
      0092B8 20 A5            [ 2] 3218         JRA     FIND1
      0092BA CD 85 C8         [ 4] 3219 FIND5:  CALL     RFROM
      0092BD CD 86 14         [ 4] 3220         CALL     DROP
      0092C0 CD 86 2E         [ 4] 3221         CALL     SWAPP
      0092C3 CD 86 14         [ 4] 3222         CALL     DROP
      0092C6 CD 8A DD         [ 4] 3223         CALL     CELLM
      0092C9 CD 86 1E         [ 4] 3224         CALL     DUPP
      0092CC CD 91 EB         [ 4] 3225         CALL     NAMET
      0092CF CC 86 2E         [ 2] 3226         JP     SWAPP
                                   3227 
                                   3228 ;       NAME?   ( a -- ca na | a F )
                                   3229 ;       Search vocabularies for a string.
      0092D2 92 3C                 3230         .word      LINK
                           001254  3231 LINK = . 
      0092D4 05                    3232         .byte      5
      0092D5 4E 41 4D 45 3F        3233         .ascii     "NAME?"
      0092DA                       3234 NAMEQ:
      0092DA CD 87 5E         [ 4] 3235         CALL   CNTXT
      0092DD CC 92 41         [ 2] 3236         JP     FIND
                                   3237 
                                   3238 ;; Terminal response
                                   3239 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



                                   3240 ;       ^H      ( bot eot cur -- bot eot cur )
                                   3241 ;       Backup cursor by one character.
      0092E0 92 D4                 3242         .word      LINK
                           001262  3243 LINK = . 
      0092E2 02                    3244         .byte      2
      0092E3 5E 48                 3245         .ascii     "^H"
      0092E5                       3246 BKSP:
      0092E5 CD 85 E7         [ 4] 3247         CALL     TOR
      0092E8 CD 86 48         [ 4] 3248         CALL     OVER
      0092EB CD 85 C8         [ 4] 3249         CALL     RFROM
      0092EE CD 86 2E         [ 4] 3250         CALL     SWAPP
      0092F1 CD 86 48         [ 4] 3251         CALL     OVER
      0092F4 CD 86 93         [ 4] 3252         CALL     XORR
      0092F7 CD 85 2C         [ 4] 3253         CALL     QBRAN
      0092FA 93 15                 3254         .word      BACK1
      0092FC CD 84 F9         [ 4] 3255         CALL     DOLIT
      0092FF 00 08                 3256         .word      BKSPP
      009301 CD 84 B8         [ 4] 3257         CALL     EMIT
      009304 CD 8B 06         [ 4] 3258         CALL     ONEM
      009307 CD 8B 58         [ 4] 3259         CALL     BLANK
      00930A CD 84 B8         [ 4] 3260         CALL     EMIT
      00930D CD 84 F9         [ 4] 3261         CALL     DOLIT
      009310 00 08                 3262         .word      BKSPP
      009312 CC 84 B8         [ 2] 3263         JP     EMIT
      009315 81               [ 4] 3264 BACK1:  RET
                                   3265 
                                   3266 ;       TAP    ( bot eot cur c -- bot eot cur )
                                   3267 ;       Accept and echo key stroke
                                   3268 ;       and bump cursor.
      009316 92 E2                 3269         .word      LINK
                           001298  3270 LINK = . 
      009318 03                    3271         .byte      3
      009319 54 41 50              3272         .ascii     "TAP"
      00931C                       3273 TAP:
      00931C CD 86 1E         [ 4] 3274         CALL     DUPP
      00931F CD 84 B8         [ 4] 3275         CALL     EMIT
      009322 CD 86 48         [ 4] 3276         CALL     OVER
      009325 CD 85 84         [ 4] 3277         CALL     CSTOR
      009328 CC 8A F9         [ 2] 3278         JP     ONEP
                                   3279 
                                   3280 ;       kTAP    ( bot eot cur c -- bot eot cur )
                                   3281 ;       Process a key stroke,
                                   3282 ;       CR,LF or backspace.
      00932B 93 18                 3283         .word      LINK
                           0012AD  3284 LINK = . 
      00932D 04                    3285         .byte      4
      00932E 4B 54 41 50           3286         .ascii     "KTAP"
      009332                       3287 KTAP:
      009332 CD 86 1E         [ 4] 3288         CALL     DUPP
      009335 CD 84 F9         [ 4] 3289         CALL     DOLIT
                           000001  3290 .if EOL_CR
      009338 00 0D                 3291         .word   CRR
                           000000  3292 .else ; EOL_LF 
                                   3293         .word   LF
                                   3294 .endif 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      00933A CD 86 93         [ 4] 3295         CALL     XORR
      00933D CD 85 2C         [ 4] 3296         CALL     QBRAN
      009340 93 58                 3297         .word      KTAP2
      009342 CD 84 F9         [ 4] 3298         CALL     DOLIT
      009345 00 08                 3299         .word      BKSPP
      009347 CD 86 93         [ 4] 3300         CALL     XORR
      00934A CD 85 2C         [ 4] 3301         CALL     QBRAN
      00934D 93 55                 3302         .word      KTAP1
      00934F CD 8B 58         [ 4] 3303         CALL     BLANK
      009352 CC 93 1C         [ 2] 3304         JP     TAP
      009355 CC 92 E5         [ 2] 3305 KTAP1:  JP     BKSP
      009358 CD 86 14         [ 4] 3306 KTAP2:  CALL     DROP
      00935B CD 86 2E         [ 4] 3307         CALL     SWAPP
      00935E CD 86 14         [ 4] 3308         CALL     DROP
      009361 CC 86 1E         [ 2] 3309         JP     DUPP
                                   3310 
                                   3311 ;       accept  ( b u -- b u )
                                   3312 ;       Accept characters to input
                                   3313 ;       buffer. Return with actual count.
      009364 93 2D                 3314         .word      LINK
                           0012E6  3315 LINK = . 
      009366 06                    3316         .byte      6
      009367 41 43 43 45 50 54     3317         .ascii     "ACCEPT"
      00936D                       3318 ACCEP:
      00936D CD 86 48         [ 4] 3319         CALL     OVER
      009370 CD 88 19         [ 4] 3320         CALL     PLUS
      009373 CD 86 48         [ 4] 3321         CALL     OVER
      009376 CD 88 04         [ 4] 3322 ACCP1:  CALL     DDUP
      009379 CD 86 93         [ 4] 3323         CALL     XORR
      00937C CD 85 2C         [ 4] 3324         CALL     QBRAN
      00937F 93 A1                 3325         .word      ACCP4
      009381 CD 8F 4B         [ 4] 3326         CALL     KEY
      009384 CD 86 1E         [ 4] 3327         CALL     DUPP
      009387 CD 8B 58         [ 4] 3328         CALL     BLANK
      00938A CD 84 F9         [ 4] 3329         CALL     DOLIT
      00938D 00 7F                 3330         .word      127
      00938F CD 89 54         [ 4] 3331         CALL     WITHI
      009392 CD 85 2C         [ 4] 3332         CALL     QBRAN
      009395 93 9C                 3333         .word      ACCP2
      009397 CD 93 1C         [ 4] 3334         CALL     TAP
      00939A 20 03            [ 2] 3335         JRA     ACCP3
      00939C CD 93 32         [ 4] 3336 ACCP2:  CALL     KTAP
      00939F 20 D5            [ 2] 3337 ACCP3:  JRA     ACCP1
      0093A1 CD 86 14         [ 4] 3338 ACCP4:  CALL     DROP
      0093A4 CD 86 48         [ 4] 3339         CALL     OVER
      0093A7 CC 88 92         [ 2] 3340         JP     SUBB
                                   3341 
                                   3342 ;       QUERY   ( -- )
                                   3343 ;       Accept input stream to
                                   3344 ;       terminal input buffer.
      0093AA 93 66                 3345         .word      LINK
                                   3346         
                           00132C  3347 LINK = . 
      0093AC 05                    3348         .byte      5
      0093AD 51 55 45 52 59        3349         .ascii     "QUERY"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      0093B2                       3350 QUERY:
      0093B2 CD 8C 75         [ 4] 3351         CALL     TIB
      0093B5 CD 84 F9         [ 4] 3352         CALL     DOLIT
      0093B8 00 50                 3353         .word      80
      0093BA CD 93 6D         [ 4] 3354         CALL     ACCEP
      0093BD CD 87 09         [ 4] 3355         CALL     NTIB
      0093C0 CD 85 60         [ 4] 3356         CALL     STORE
      0093C3 CD 86 14         [ 4] 3357         CALL     DROP
      0093C6 CD 8B 65         [ 4] 3358         CALL     ZERO
      0093C9 CD 86 F9         [ 4] 3359         CALL     INN
      0093CC CC 85 60         [ 2] 3360         JP     STORE
                                   3361 
                                   3362 ;       ABORT   ( -- )
                                   3363 ;       Reset data stack and
                                   3364 ;       jump to QUIT.
      0093CF 93 AC                 3365         .word      LINK
                           001351  3366 LINK = . 
      0093D1 05                    3367         .byte      5
      0093D2 41 42 4F 52 54        3368         .ascii     "ABORT"
      0093D7                       3369 ABORT:
      0093D7 CD 94 CE         [ 4] 3370         CALL     PRESE
      0093DA CC 94 EB         [ 2] 3371         JP     QUIT
                                   3372 
                                   3373 ;       abort"  ( f -- )
                                   3374 ;       Run time routine of ABORT".
                                   3375 ;       Abort with a message.
      0093DD 93 D1                 3376         .word      LINK
                           00135F  3377 LINK = . 
      0093DF 46                    3378 	.byte      COMPO+6
      0093E0 41 42 4F 52 54        3379         .ascii     "ABORT"
      0093E5 22                    3380         .byte      '"'
      0093E6                       3381 ABORQ:
      0093E6 CD 85 2C         [ 4] 3382         CALL     QBRAN
      0093E9 94 05                 3383         .word      ABOR2   ;text flag
      0093EB CD 8F E1         [ 4] 3384         CALL     DOSTR
      0093EE CD 8F 83         [ 4] 3385 ABOR1:  CALL     SPACE
      0093F1 CD 8C 3C         [ 4] 3386         CALL     COUNT
      0093F4 CD 8F AD         [ 4] 3387         CALL     TYPES
      0093F7 CD 84 F9         [ 4] 3388         CALL     DOLIT
      0093FA 00 3F                 3389         .word     63 ; "?"
      0093FC CD 84 B8         [ 4] 3390         CALL     EMIT
      0093FF CD 8F CB         [ 4] 3391         CALL     CR
      009402 CC 93 D7         [ 2] 3392         JP     ABORT   ;pass error string
      009405 CD 8F E1         [ 4] 3393 ABOR2:  CALL     DOSTR
      009408 CC 86 14         [ 2] 3394         JP     DROP
                                   3395 
                                   3396 ;; The text interpreter
                                   3397 
                                   3398 ;       $INTERPRET      ( a -- )
                                   3399 ;       Interpret a word. If failed,
                                   3400 ;       try to convert it to an integer.
      00940B 93 DF                 3401         .word      LINK
                           00138D  3402 LINK = . 
      00940D 0A                    3403         .byte      10
      00940E 24 49 4E 54 45 52 50  3404         .ascii     "$INTERPRET"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal  52-Bits]



             52 45 54
      001398                       3405 INTER:
      009416 45 54 5A         [ 4] 3406         CALL     NAMEQ
      009418 CD 07 48         [ 4] 3407         CALL     QDUP    ;?defined
      009418 CD 92 DA         [ 4] 3408         CALL     QBRAN
      00941B CD 87                 3409         .word      INTE1
      00941D C8 CD 85         [ 4] 3410         CALL     AT
      009420 2C 94 42         [ 4] 3411         CALL     DOLIT
      009423 CD 85                 3412 	.word       0x4000	; COMPO*256
      009425 77 CD 84         [ 4] 3413         CALL     ANDD    ;?compile only lexicon bits
      009428 F9 40 00         [ 4] 3414         CALL     ABORQ
      00942B CD                    3415         .byte      13
      00942C 86 6A CD 93 E6 0D 20  3416         .ascii     " compile only"
             63 6F 6D 70 69 6C
      009439 65 20 6F         [ 2] 3417         JP     EXECU
      00943C 6E 6C 79         [ 4] 3418 INTE1:  CALL     NUMBQ   ;convert a number
      00943F CC 85 53         [ 4] 3419         CALL     QBRAN
      009442 CD 8E                 3420         .word    ABOR1
      009444 78               [ 4] 3421         RET
                                   3422 
                                   3423 ;       [       ( -- )
                                   3424 ;       Start  text interpreter.
      009445 CD 85                 3425         .word      LINK
                           0013CD  3426 LINK = . 
      009447 2C                    3427 	.byte      IMEDD+1
      009448 93                    3428         .ascii     "["
      0013CF                       3429 LBRAC:
      009449 EE 81 94         [ 4] 3430         CALL   DOLIT
      00944C 0D 81                 3431         .word  INTER
      00944E 5B 06 BC         [ 4] 3432         CALL   TEVAL
      00944F CC 04 E0         [ 2] 3433         JP     STORE
                                   3434 
                                   3435 ;       .OK     ( -- )
                                   3436 ;       Display 'ok' while interpreting.
      00944F CD 84                 3437         .word      LINK
                           0013DC  3438 LINK = . 
      009451 F9                    3439         .byte      3
      009452 94 18 CD              3440         .ascii     ".OK"
      0013E0                       3441 DOTOK:
      009455 87 3C CC         [ 4] 3442         CALL     DOLIT
      009458 85 60                 3443         .word      INTER
      00945A 94 4D 03         [ 4] 3444         CALL     TEVAL
      00945D 2E 4F 4B         [ 4] 3445         CALL     AT
      009460 CD 08 3A         [ 4] 3446         CALL     EQUAL
      009460 CD 84 F9         [ 4] 3447         CALL     QBRAN
      009463 94 18                 3448         .word      DOTO1
      009465 CD 87 3C         [ 4] 3449         CALL     DOTQP
      009468 CD                    3450         .byte      3
      009469 85 77 CD              3451         .ascii     " ok"
      00946C 88 BA CD         [ 2] 3452 DOTO1:  JP     CR
                                   3453 
                                   3454 ;       ?STACK  ( -- )
                                   3455 ;       Abort if stack underflows.
      00946F 85 2C                 3456         .word      LINK
                           0013FF  3457 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      009471 94                    3458         .byte      6
      009472 7A CD 90 0A 03 20     3459         .ascii     "?STACK"
      001406                       3460 QSTAC: 
      009478 6F 6B CC         [ 4] 3461         CALL     DEPTH
      00947B 8F CB 94         [ 4] 3462         CALL     ZLESS   ;check only for underflow
      00947E 5C 06 3F         [ 4] 3463         CALL     ABORQ
      009481 53                    3464         .byte      11
      009482 54 41 43 4B 65 72 66  3465         .ascii     " underflow "
             6C 6F 77 20
      009486 81               [ 4] 3466         RET
                                   3467 
                                   3468 ;       EVAL    ( -- )
                                   3469 ;       Interpret  input stream.
      009486 CD 8B                 3470         .word      LINK
                           00141E  3471 LINK = . 
      009488 A7                    3472         .byte      4
      009489 CD 86 57 CD           3473         .ascii     "EVAL"
      001423                       3474 EVAL:
      00948D 93 E6 0B         [ 4] 3475 EVAL1:  CALL     TOKEN
      009490 20 75 6E         [ 4] 3476         CALL     DUPP
      009493 64 65 72         [ 4] 3477         CALL     CAT     ;?input stream empty
      009496 66 6C 6F         [ 4] 3478         CALL     QBRAN
      009499 77 20                 3479         .word    EVAL2
      00949B 81 94 7F         [ 4] 3480         CALL     TEVAL
      00949E 04 45 56         [ 4] 3481         CALL     ATEXE
      0094A1 41 4C 06         [ 4] 3482         CALL     QSTAC   ;evaluate input, check stack
      0094A3 CD 04 C3         [ 4] 3483         CALL     BRAN
      0094A3 CD 91                 3484         .word    EVAL1
      0094A5 DD CD 86         [ 4] 3485 EVAL2:  CALL     DROP
      0094A8 1E CD 85         [ 2] 3486         JP       DOTOK
                                   3487 
                                   3488 ;       PRESET  ( -- )
                                   3489 ;       Reset data stack pointer and
                                   3490 ;       terminal input buffer.
      0094AB 95 CD                 3491         .word      LINK
                           001447  3492 LINK = . 
      0094AD 85                    3493         .byte      6
      0094AE 2C 94 BF CD 87 3C     3494         .ascii     "PRESET"
      00144E                       3495 PRESE:
      0094B4 CD 8C 89         [ 4] 3496         CALL     DOLIT
      0094B7 CD 94                 3497         .word      SPP
      0094B9 86 CD 85         [ 4] 3498         CALL     SPSTO
      0094BC 43 94 A3         [ 4] 3499         CALL     DOLIT
      0094BF CD 86                 3500         .word      TIBB
      0094C1 14 CC 94         [ 4] 3501         CALL     NTIB
      0094C4 60 94 9E         [ 4] 3502         CALL     CELLP
      0094C7 06 50 52         [ 2] 3503         JP     STORE
                                   3504 
                                   3505 ;       QUIT    ( -- )
                                   3506 ;       Reset return stack pointer
                                   3507 ;       and start text interpreter.
      0094CA 45 53                 3508         .word      LINK
                           001466  3509 LINK = . 
      0094CC 45                    3510         .byte      4
      0094CD 54 55 49 54           3511         .ascii     "QUIT"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      0094CE                       3512 QUIT:
      0094CE CD 84 F9         [ 4] 3513         CALL     DOLIT
      0094D1 16 80                 3514         .word      RPP
      0094D3 CD 86 0B         [ 4] 3515         CALL     RPSTO   ;reset return stack pointer
      0094D6 CD 84 F9         [ 4] 3516 QUIT1:  CALL     LBRAC   ;start interpretation
      0094D9 17 00 CD         [ 4] 3517 QUIT2:  CALL     QUERY   ;get input
      0094DC 87 09 CD         [ 4] 3518         CALL     EVAL
      0094DF 8A CE            [ 2] 3519         JRA     QUIT2   ;continue till error
                                   3520 
                                   3521 ;; The compiler
                                   3522 
                                   3523 ;       '       ( -- ca )
                                   3524 ;       Search vocabularies for
                                   3525 ;       next word in input stream.
      0094E1 CC 85                 3526         .word      LINK
                           001480  3527 LINK = . 
      0094E3 60                    3528         .byte      1
      0094E4 94                    3529         .ascii     "'"
      001482                       3530 TICK:
      0094E5 C7 04 51         [ 4] 3531         CALL     TOKEN
      0094E8 55 49 54         [ 4] 3532         CALL     NAMEQ   ;?defined
      0094EB CD 04 AC         [ 4] 3533         CALL     QBRAN
      0094EB CD 84                 3534         .word      ABOR1
      0094ED F9               [ 4] 3535         RET     ;yes, push code address
                                   3536 
                                   3537 ;       ALLOT   ( n -- )
                                   3538 ;       Allocate n bytes to RAM 
      0094EE 17 FF                 3539         .word      LINK
                           001490  3540         LINK = . 
      0094F0 CD                    3541         .byte      5
      0094F1 85 B2 CD 94 4F        3542         .ascii     "ALLOT"
      001496                       3543 ALLOT:
      0094F6 CD 93 B2         [ 4] 3544         CALL     VPP
                                   3545 ; must update APP_VP each time VP is modidied
      0094F9 CD 94 A3         [ 4] 3546         call PSTOR 
      0094FC 20 F8 94         [ 2] 3547         jp UPDATVP 
                                   3548 
                                   3549 ;       ,       ( w -- )
                                   3550 ;         Compile an integer into
                                   3551 ;         variable space.
      0094FF E6 01                 3552         .word      LINK
                           0014A1  3553 LINK = . 
      009501 27                    3554         .byte      1
      009502 2C                    3555         .ascii     ","
      0014A3                       3556 COMMA:
      009502 CD 91 DD         [ 4] 3557         CALL     HERE
      009505 CD 92 DA         [ 4] 3558         CALL     DUPP
      009508 CD 85 2C         [ 4] 3559         CALL     CELLP   ;cell boundary
      00950B 93 EE 81         [ 4] 3560         CALL     VPP
      00950E 95 00 05         [ 4] 3561         CALL     STORE
      009511 41 4C 4C         [ 2] 3562         JP     STORE
                                   3563 
                                   3564 ;       C,      ( c -- )
                                   3565 ;       Compile a byte into
                                   3566 ;       variables space.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      009514 4F 54                 3567        .word      LINK
                           0014B7  3568 LINK = . 
      009516 02                    3569         .byte      2
      009516 CD 87                 3570         .ascii     "C,"
      0014BA                       3571 CCOMMA:
      009518 6C CD 8B         [ 4] 3572         CALL     HERE
      00951B D5 CC 9C         [ 4] 3573         CALL     DUPP
      00951E 62 95 10         [ 4] 3574         CALL     ONEP
      009521 01 2C EC         [ 4] 3575         CALL     VPP
      009523 CD 04 E0         [ 4] 3576         CALL     STORE
      009523 CD 8C 53         [ 2] 3577         JP     CSTOR
                                   3578 
                                   3579 ;       [COMPILE]       ( -- ; <string> )
                                   3580 ;       Compile next immediate
                                   3581 ;       word into code dictionary.
      009526 CD 86                 3582         .word      LINK
                           0014CE  3583 LINK = . 
      009528 1E                    3584 	.byte      IMEDD+9
      009529 CD 8A CE CD 87 6C CD  3585         .ascii     "[COMPILE]"
             85 60
      0014D8                       3586 BCOMP:
      009532 CC 85 60         [ 4] 3587         CALL     TICK
      009535 95 21 02         [ 2] 3588         JP     JSRC
                                   3589 
                                   3590 ;       COMPILE ( -- )
                                   3591 ;       Compile next jsr in
                                   3592 ;       colon list to code dictionary.
      009538 43 2C                 3593         .word      LINK
                           0014E0  3594 LINK = . 
      00953A 47                    3595 	.byte      COMPO+7
      00953A CD 8C 53 CD 86 1E CD  3596         .ascii     "COMPILE"
      0014E8                       3597 COMPI:
      009541 8A F9 CD         [ 4] 3598         CALL     RFROM
      009544 87 6C CD         [ 4] 3599         CALL     DUPP
      009547 85 60 CC         [ 4] 3600         CALL     AT
      00954A 85 84 95         [ 4] 3601         CALL     JSRC    ;compile subroutine
      00954D 37 89 5B         [ 4] 3602         CALL     CELLP
      009550 43 4F            [ 1] 3603         ldw y,x 
      009552 4D 50            [ 2] 3604         ldw y,(y)
      009554 49 4C 45         [ 2] 3605         addw x,#CELLL 
      009557 5D FC            [ 2] 3606         jp (y)
                                   3607 
                                   3608 ;       LITERAL ( w -- )
                                   3609 ;       Compile tos to dictionary
                                   3610 ;       as an integer literal.
      009558 14 E0                 3611         .word      LINK
                           001502  3612 LINK = . 
      009558 CD                    3613 	.byte      IMEDD+7
      009559 95 02 CC 98 1E 95 4E  3614         .ascii     "LITERAL"
      00150A                       3615 LITER:
      009560 47 43 4F         [ 4] 3616         CALL     COMPI
      009563 4D 50                 3617         .word DOLIT 
      009565 49 4C 45         [ 2] 3618         JP     COMMA
                                   3619 
                                   3620 ;       $,"     ( -- )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



                                   3621 ;       Compile a literal string
                                   3622 ;       up to next " .
      009568 15 02                 3623         .word      LINK
                           001514  3624 LINK = . 
      009568 CD                    3625         .byte      3
      009569 85 C8 CD              3626         .byte     '$',',','"'
      001518                       3627 STRCQ:
      00956C 86 1E CD         [ 4] 3628         CALL     DOLIT
      00956F 85 77                 3629         .word     34	; "
      009571 CD 98 1E         [ 4] 3630         CALL     PARSE
      009574 CD 8A CE         [ 4] 3631         CALL     HERE
      009577 90 93 90         [ 4] 3632         CALL     PACKS   ;string to code dictionary
      00957A FE 1C 00         [ 4] 3633         CALL     COUNT
      00957D 02 90 FC         [ 4] 3634         CALL     PLUS    ;calculate aligned end of string
      009580 95 60 87         [ 4] 3635         CALL     VPP
      009583 4C 49 54         [ 2] 3636         JP     STORE
                                   3637 
                                   3638 ;; Structures
                                   3639 
                                   3640 ;       FOR     ( -- a )
                                   3641 ;       Start a FOR-NEXT loop
                                   3642 ;       structure in a colon definition.
      009586 45 52                 3643         .word      LINK
                           001534  3644 LINK = . 
      009588 41                    3645 	.byte      IMEDD+3
      009589 4C 4F 52              3646         .ascii     "FOR"
      00958A                       3647 FOR:
      00958A CD 95 68         [ 4] 3648         CALL     COMPI
      00958D 84 F9                 3649         .word TOR 
      00958F CC 95 23         [ 2] 3650         JP     HERE
                                   3651 
                                   3652 ;       NEXT    ( a -- )
                                   3653 ;       Terminate a FOR-NEXT loop.
      009592 95 82                 3654         .word      LINK
                           001542  3655 LINK = . 
      009594 03                    3656 	.byte      IMEDD+4
      009595 24 2C 22 54           3657         .ascii     "NEXT"
      009598                       3658 NEXT:
      009598 CD 84 F9         [ 4] 3659         CALL     COMPI
      00959B 00 22                 3660         .word DONXT 
      00959D CD 91 60         [ 4] 3661         call ADRADJ
      0095A0 CD 8C 53         [ 2] 3662         JP     COMMA
                                   3663 
                                   3664 ;       I ( -- n )
                                   3665 ;       stack FOR-NEXT COUNTER 
      0095A3 CD 8D                 3666         .word LINK 
                           001554  3667         LINK=.
      0095A5 13                    3668         .byte 1 
      0095A6 CD                    3669         .ascii "I"
      001556                       3670 IFETCH: 
      0095A7 8C 3C CD         [ 2] 3671         subw x,#CELLL 
      0095AA 88 19            [ 2] 3672         ldw y,(3,sp)
      0095AC CD               [ 2] 3673         ldw (x),y 
      0095AD 87               [ 4] 3674         ret 
                                   3675 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



                                   3676 ;       BEGIN   ( -- a )
                                   3677 ;       Start an infinite or
                                   3678 ;       indefinite loop structure.
      0095AE 6C CC                 3679         .word      LINK
                           00155F  3680 LINK = . 
      0095B0 85                    3681 	.byte      IMEDD+5
      0095B1 60 95 94 83 46        3682         .ascii     "BEGIN"
      001565                       3683 BEGIN:
      0095B6 4F 52 D3         [ 2] 3684         JP     HERE
                                   3685 
                                   3686 ;       UNTIL   ( a -- )
                                   3687 ;       Terminate a BEGIN-UNTIL
                                   3688 ;       indefinite loop structure.
      0095B8 15 5F                 3689         .word      LINK
                           00156A  3690 LINK = . 
      0095B8 CD                    3691 	.byte      IMEDD+5
      0095B9 95 68 85 E7 CC        3692         .ascii     "UNTIL"
      001570                       3693 UNTIL:
      0095BE 8C 53 95         [ 4] 3694         CALL     COMPI
      0095C1 B4 84                 3695         .word    QBRAN 
      0095C3 4E 45 58         [ 4] 3696         call ADRADJ
      0095C6 54 14 A3         [ 2] 3697         JP     COMMA
                                   3698 
                                   3699 ;       AGAIN   ( a -- )
                                   3700 ;       Terminate a BEGIN-AGAIN
                                   3701 ;       infinite loop structure.
      0095C7 15 6A                 3702         .word      LINK
                           00157D  3703 LINK = . 
      0095C7 CD                    3704 	.byte      IMEDD+5
      0095C8 95 68 85 0D CD        3705         .ascii     "AGAIN"
      001583                       3706 AGAIN:
      0095CD 87 B8 CC         [ 4] 3707         CALL     COMPI
      0095D0 95 23                 3708         .word BRAN
      0095D2 95 C2 01         [ 4] 3709         call ADRADJ 
      0095D5 49 14 A3         [ 2] 3710         JP     COMMA
                                   3711 
                                   3712 ;       IF      ( -- A )
                                   3713 ;       Begin a conditional branch.
      0095D6 15 7D                 3714         .word      LINK
                           001590  3715 LINK = . 
      0095D6 1D                    3716 	.byte      IMEDD+2
      0095D7 00 02                 3717         .ascii     "IF"
      001593                       3718 IFF:
      0095D9 16 03 FF         [ 4] 3719         CALL     COMPI
      0095DC 81 95                 3720         .word QBRAN
      0095DE D4 85 42         [ 4] 3721         CALL     HERE
      0095E1 45 47 49         [ 4] 3722         CALL     ZERO
      0095E4 4E 14 A3         [ 2] 3723         JP     COMMA
                                   3724 
                                   3725 ;       THEN        ( A -- )
                                   3726 ;       Terminate a conditional branch structure.
      0095E5 15 90                 3727         .word      LINK
                           0015A3  3728 LINK = . 
      0095E5 CC                    3729 	.byte      IMEDD+4
      0095E6 8C 53 95 DF           3730         .ascii     "THEN"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      0015A8                       3731 THENN:
      0095EA 85 55 4E         [ 4] 3732         CALL     HERE
      0095ED 54 49 4C         [ 4] 3733         call ADRADJ 
      0095F0 CD 05 AE         [ 4] 3734         CALL     SWAPP
      0095F0 CD 95 68         [ 2] 3735         JP     STORE
                                   3736 
                                   3737 ;       ELSE        ( A -- A )
                                   3738 ;       Start the false clause in an IF-ELSE-THEN structure.
      0095F3 85 2C                 3739         .word      LINK
                           0015B6  3740 LINK = . 
      0095F5 CD                    3741 	.byte      IMEDD+4
      0095F6 87 B8 CC 95           3742         .ascii     "ELSE"
      0015BB                       3743 ELSEE:
      0095FA 23 95 EA         [ 4] 3744         CALL     COMPI
      0095FD 85 41                 3745         .word BRAN
      0095FF 47 41 49         [ 4] 3746         CALL     HERE
      009602 4E 0A E5         [ 4] 3747         CALL     ZERO
      009603 CD 14 A3         [ 4] 3748         CALL     COMMA
      009603 CD 95 68         [ 4] 3749         CALL     SWAPP
      009606 85 43 CD         [ 4] 3750         CALL     HERE
      009609 87 B8 CC         [ 4] 3751         call ADRADJ 
      00960C 95 23 95         [ 4] 3752         CALL     SWAPP
      00960F FD 82 49         [ 2] 3753         JP     STORE
                                   3754 
                                   3755 ;       AHEAD       ( -- A )
                                   3756 ;       Compile a forward branch instruction.
      009612 46 B6                 3757         .word      LINK
                           0015DA  3758 LINK = . 
      009613 85                    3759 	.byte      IMEDD+5
      009613 CD 95 68 85 2C        3760         .ascii     "AHEAD"
      0015E0                       3761 AHEAD:
      009618 CD 8C 53         [ 4] 3762         CALL     COMPI
      00961B CD 8B                 3763         .word BRAN
      00961D 65 CC 95         [ 4] 3764         CALL     HERE
      009620 23 96 10         [ 4] 3765         CALL     ZERO
      009623 84 54 48         [ 2] 3766         JP     COMMA
                                   3767 
                                   3768 ;       WHILE       ( a -- A a )
                                   3769 ;       Conditional branch out of a BEGIN-WHILE-REPEAT loop.
      009626 45 4E                 3770         .word      LINK
                           0015F0  3771 LINK = . 
      009628 85                    3772 	.byte      IMEDD+5
      009628 CD 8C 53 CD 87        3773         .ascii     "WHILE"
      0015F6                       3774 WHILE:
      00962D B8 CD 86         [ 4] 3775         CALL     COMPI
      009630 2E CC                 3776         .word QBRAN
      009632 85 60 96         [ 4] 3777         CALL     HERE
      009635 23 84 45         [ 4] 3778         CALL     ZERO
      009638 4C 53 45         [ 4] 3779         CALL     COMMA
      00963B CC 05 AE         [ 2] 3780         JP     SWAPP
                                   3781 
                                   3782 ;       REPEAT      ( A a -- )
                                   3783 ;       Terminate a BEGIN-WHILE-REPEAT indefinite loop.
      00963B CD 95                 3784         .word      LINK
                           001609  3785 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      00963D 68                    3786         .byte      IMEDD+6
      00963E 85 43 CD 8C 53 CD     3787         .ascii     "REPEAT"
      001610                       3788 REPEA:
      009644 8B 65 CD         [ 4] 3789         CALL     COMPI
      009647 95 23                 3790         .word BRAN
      009649 CD 86 2E         [ 4] 3791         call ADRADJ 
      00964C CD 8C 53         [ 4] 3792         CALL     COMMA
      00964F CD 87 B8         [ 4] 3793         CALL     HERE
      009652 CD 86 2E         [ 4] 3794         call ADRADJ 
      009655 CC 85 60         [ 4] 3795         CALL     SWAPP
      009658 96 36 85         [ 2] 3796         JP     STORE
                                   3797 
                                   3798 ;       AFT         ( a -- a A )
                                   3799 ;       Jump to THEN in a FOR-AFT-THEN-NEXT loop the first time through.
      00965B 41 48                 3800         .word      LINK
                           001629  3801 LINK = . 
      00965D 45                    3802 	.byte      IMEDD+3
      00965E 41 44 54              3803         .ascii     "AFT"
      009660                       3804 AFT:
      009660 CD 95 68         [ 4] 3805         CALL     DROP
      009663 85 43 CD         [ 4] 3806         CALL     AHEAD
      009666 8C 53 CD         [ 4] 3807         CALL     HERE
      009669 8B 65 CC         [ 2] 3808         JP     SWAPP
                                   3809 
                                   3810 ;       ABORT"      ( -- ; <string> )
                                   3811 ;       Conditional abort with an error message.
      00966C 95 23                 3812         .word      LINK
                           00163B  3813 LINK = . 
      00966E 96                    3814 	.byte      IMEDD+6
      00966F 5A 85 57 48 49        3815         .ascii     "ABORT"
      009674 4C                    3816         .byte      '"'
      001642                       3817 ABRTQ:
      009675 45 14 E8         [ 4] 3818         CALL     COMPI
      009676 13 66                 3819         .word ABORQ
      009676 CD 95 68         [ 2] 3820         JP     STRCQ
                                   3821 
                                   3822 ;       $"     ( -- ; <string> )
                                   3823 ;       Compile an inline string literal.
      009679 85 2C                 3824         .word      LINK
                           00164C  3825 LINK = . 
      00967B CD                    3826 	.byte      IMEDD+2
      00967C 8C 53                 3827         .byte     '$','"'
      00164F                       3828 STRQ:
      00967E CD 8B 65         [ 4] 3829         CALL     COMPI
      009681 CD 95                 3830         .word STRQP 
      009683 23 CC 86         [ 2] 3831         JP     STRCQ
                                   3832 
                                   3833 ;       ."          ( -- ; <string> )
                                   3834 ;       Compile an inline string literal to be typed out at run time.
      009686 2E 96                 3835         .word      LINK
                           001659  3836 LINK = . 
      009688 70                    3837 	.byte      IMEDD+2
      009689 86 52                 3838         .byte     '.','"'
      00165C                       3839 DOTQ:
      00968B 45 50 45         [ 4] 3840         CALL     COMPI
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



      00968E 41 54                 3841         .word DOTQP 
      009690 CC 15 18         [ 2] 3842         JP     STRCQ
                                   3843 
                                   3844 ;; Name compiler
                                   3845 
                                   3846 ;       ?UNIQUE ( a -- a )
                                   3847 ;       Display a warning message
                                   3848 ;       if word already exists.
      009690 CD 95                 3849         .word      LINK
                           001666  3850 LINK = . 
      009692 68                    3851         .byte      7
      009693 85 43 CD 87 B8 CD 95  3852         .ascii     "?UNIQUE"
      00166E                       3853 UNIQU:
      00969A 23 CD 8C         [ 4] 3854         CALL     DUPP
      00969D 53 CD 87         [ 4] 3855         CALL     NAMEQ   ;?name exists
      0096A0 B8 CD 86         [ 4] 3856         CALL     QBRAN
      0096A3 2E CC                 3857         .word      UNIQ1
      0096A5 85 60 96         [ 4] 3858         CALL     DOTQP   ;redef are OK
      0096A8 89                    3859         .byte       7
      0096A9 83 41 46 54 65 66 20  3860         .ascii     " reDef "       
      0096AD CD 05 C8         [ 4] 3861         CALL     OVER
      0096AD CD 86 14         [ 4] 3862         CALL     COUNT
      0096B0 CD 96 60         [ 4] 3863         CALL     TYPES   ;just in case
      0096B3 CD 8C 53         [ 2] 3864 UNIQ1:  JP     DROP
                                   3865 
                                   3866 ;       $,n     ( na -- )
                                   3867 ;       Build a new dictionary name
                                   3868 ;       using string at na.
                                   3869 ; compile dans l'espace des variables 
      0096B6 CC 86                 3870         .word      LINK
                           001692  3871 LINK = . 
      0096B8 2E                    3872         .byte      3
      0096B9 96 A9 86              3873         .ascii     "$,n"
      001696                       3874 SNAME:
      0096BC 41 42 4F         [ 4] 3875         CALL     DUPP
      0096BF 52 54 22         [ 4] 3876         CALL     CAT     ;?null input
      0096C2 CD 04 AC         [ 4] 3877         CALL     QBRAN
      0096C2 CD 95                 3878         .word      PNAM1
      0096C4 68 93 E6         [ 4] 3879         CALL     UNIQU   ;?redefinition
      0096C7 CC 95 98         [ 4] 3880         CALL     DUPP
      0096CA 96 BB 82         [ 4] 3881         CALL     COUNT
      0096CD 24 22 99         [ 4] 3882         CALL     PLUS
      0096CF CD 06 EC         [ 4] 3883         CALL     VPP
      0096CF CD 95 68         [ 4] 3884         CALL     STORE
      0096D2 90 00 CC         [ 4] 3885         CALL     DUPP
      0096D5 95 98 96         [ 4] 3886         CALL     LAST
      0096D8 CC 82 2E         [ 4] 3887         CALL     STORE   ;save na for vocabulary link
      0096DB 22 0A 5D         [ 4] 3888         CALL     CELLM   ;link address
      0096DC CD 06 DE         [ 4] 3889         CALL     CNTXT
      0096DC CD 95 68         [ 4] 3890         CALL     AT
      0096DF 90 0A CC         [ 4] 3891         CALL     SWAPP
      0096E2 95 98 96         [ 4] 3892         CALL     STORE
      0096E5 D9               [ 4] 3893         RET     ;save code pointer
      0096E6 07 3F 55         [ 4] 3894 PNAM1:  CALL     STRQP
      0096E9 4E                    3895         .byte      5
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



      0096EA 49 51 55 45 65        3896         .ascii     " name" ;null input
      0096EE CC 13 6E         [ 2] 3897         JP     ABOR1
                                   3898 
                                   3899 ;; FORTH compiler
                                   3900 
                                   3901 ;       $COMPILE        ( a -- )
                                   3902 ;       Compile next word to
                                   3903 ;       dictionary as a token or literal.
      0096EE CD 86                 3904         .word      LINK
                           0016DA  3905 LINK = . 
      0096F0 1E                    3906         .byte      8
      0096F1 CD 92 DA CD 85 2C 97  3907         .ascii     "$COMPILE"
             0D
      0016E3                       3908 SCOMP:
      0096F9 CD 90 0A         [ 4] 3909         CALL     NAMEQ
      0096FC 07 20 72         [ 4] 3910         CALL     QDUP    ;?defined
      0096FF 65 44 65         [ 4] 3911         CALL     QBRAN
      009702 66 20                 3912         .word      SCOM2
      009704 CD 86 48         [ 4] 3913         CALL     AT
      009707 CD 8C 3C         [ 4] 3914         CALL     DOLIT
      00970A CD 8F                 3915         .word     0x8000	;  IMEDD*256
      00970C AD CC 86         [ 4] 3916         CALL     ANDD    ;?immediate
      00970F 14 96 E6         [ 4] 3917         CALL     QBRAN
      009712 03 24                 3918         .word      SCOM1
      009714 2C 6E D3         [ 2] 3919         JP     EXECU
      009716 CC 17 9E         [ 2] 3920 SCOM1:  JP     JSRC
      009716 CD 86 1E         [ 4] 3921 SCOM2:  CALL     NUMBQ   ;try to convert to number
      009719 CD 85 95         [ 4] 3922         CALL     QBRAN
      00971C CD 85                 3923         .word      ABOR1
      00971E 2C 97 4C         [ 2] 3924         JP     LITER
                                   3925 
                                   3926 ;       OVERT   ( -- )
                                   3927 ;       Link a new word into vocabulary.
      009721 CD 96                 3928         .word      LINK
                           001711  3929 LINK = . 
      009723 EE                    3930         .byte      5
      009724 CD 86 1E CD 8C        3931         .ascii     "OVERT"
      001717                       3932 OVERT:
      009729 3C CD 88         [ 4] 3933         CALL     LAST
      00972C 19 CD 87         [ 4] 3934         CALL     AT
      00972F 6C CD 85         [ 4] 3935         CALL     CNTXT
      009732 60 CD 86         [ 2] 3936         JP     STORE
                                   3937 
                                   3938 ;       ;       ( -- )
                                   3939 ;       Terminate a colon definition.
      009735 1E CD                 3940         .word      LINK
                           001725  3941 LINK = . 
      009737 87                    3942 	.byte      IMEDD+COMPO+1
      009738 8A                    3943         .ascii     ";"
      001727                       3944 SEMIS:
                           000001  3945 .if OPTIMIZE ; more compact and faster
      009739 CD 85 60         [ 4] 3946         call DOLIT 
      00973C CD 8A                 3947         .word 0x81   ; opcode for RET 
      00973E DD CD 87         [ 4] 3948         call CCOMMA 
                           000000  3949 .else
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



                                   3950         CALL     COMPI
                                   3951         .word EXIT 
                                   3952 .endif 
      009741 5E CD 85         [ 4] 3953         CALL     LBRAC
      009744 77 CD 86         [ 4] 3954         call OVERT 
      009747 2E CD 85         [ 4] 3955         CALL FMOVE
      00974A 60 81 CD         [ 4] 3956         call QDUP 
      00974D 90 00 05         [ 4] 3957         call QBRAN 
      009750 20 6E                 3958         .word SET_RAMLAST 
      009752 61 6D 65         [ 4] 3959         CALL UPDATPTR
      009755 CC               [ 4] 3960         RET 
                                   3961 
                                   3962 
                                   3963 ;       Terminate an ISR definition 
                                   3964 ;       retourn ca of ISR as double
                                   3965 ;       I; ( -- ud )
      009756 93 EE                 3966         .word LINK 
                           001746  3967         LINK=.
      009758 97                    3968         .byte 2+IMEDD+COMPO 
      009759 12 08                 3969         .ascii "I;" 
      001749                       3970 ISEMI:
      00975B 24 43 4F         [ 2] 3971         subw x,#CELLL  
      00975E 4D 50 49 4C      [ 2] 3972         ldw y,#IRET_CODE 
      009762 45               [ 2] 3973         ldw (x),y 
      009763 CD 14 BA         [ 4] 3974         call CCOMMA
      009763 CD 92 DA         [ 4] 3975         call LBRAC 
      009766 CD 87 C8         [ 4] 3976         call IFMOVE
      009769 CD 85 2C         [ 4] 3977         call QDUP 
      00976C 97 84 CD         [ 4] 3978         CALL QBRAN 
      00976F 85 77                 3979         .word SET_RAMLAST
      009771 CD 84 F9         [ 4] 3980         CALL CPP
      009774 80 00 CD         [ 4] 3981         call AT 
      009777 86 6A CD         [ 4] 3982         call SWAPP 
      00977A 85 2C 97         [ 4] 3983         CALL CPP 
      00977D 81 CC 85         [ 4] 3984         call STORE 
      009780 53 CC 98         [ 4] 3985         call UPDATCP 
      009783 1E CD 8E         [ 4] 3986         call EEPVP 
      009786 78 CD 85         [ 4] 3987         call DROP 
      009789 2C 93 EE         [ 4] 3988         call AT 
      00978C CC 95 8A         [ 4] 3989         call VPP 
      00978F 97 5A 05         [ 4] 3990         call STORE 
      009792 4F 56 45         [ 2] 3991         jp ZERO
      009795 52               [ 4] 3992         ret           
                                   3993         
                                   3994 
                                   3995 ;       ]       ( -- )
                                   3996 ;       Start compiling words in
                                   3997 ;       input stream.
      009796 54 46                 3998         .word      LINK
                           001789  3999 LINK = . 
      009797 01                    4000         .byte      1
      009797 CD                    4001         .ascii     "]"
      00178B                       4002 RBRAC:
      009798 87 8A CD         [ 4] 4003         CALL   DOLIT
      00979B 85 77                 4004         .word  SCOMP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      00979D CD 87 5E         [ 4] 4005         CALL   TEVAL
      0097A0 CC 85 60         [ 2] 4006         JP     STORE
                                   4007 
                                   4008 ;       CALL,    ( ca -- )
                                   4009 ;       Compile a subroutine call.
      0097A3 97 91                 4010         .word      LINK
                           001798  4011 LINK = . 
      0097A5 C1                    4012         .byte      5
      0097A6 3B 41 4C 4C 2C        4013         .ascii     "CALL,"
      0097A7                       4014 JSRC:
      0097A7 CD 84 F9         [ 4] 4015         CALL     DOLIT
      0097AA 00 81                 4016         .word     CALLL     ;CALL
      0097AC CD 95 3A         [ 4] 4017         CALL     CCOMMA
      0097AF CD 94 4F         [ 2] 4018         JP     COMMA
                                   4019 
                                   4020 ;       INIT-OFS ( -- )
                                   4021 ;       compute offset to adjust jump address 
                                   4022 ;       set variable OFFSET 
      0097B2 CD 97                 4023         .word LINK 
                           0017AB  4024         LINK=.
      0097B4 97                    4025         .byte 8 
      0097B5 CD A1 BA CD 87 C8 CD  4026         .ascii "INIT-OFS" 
             85
      0017B4                       4027 INITOFS:
      0097BD 2C 98 EE         [ 4] 4028         call TFLASH 
      0097C0 CD A2 4E         [ 4] 4029         CALL AT 
      0097C3 81 97 A5         [ 4] 4030         CALL DUPP 
      0097C6 C2 49 3B         [ 4] 4031         call QBRAN
      0097C9 17 D1                 4032         .word 1$
      0097C9 1D 00 02         [ 4] 4033         call DROP  
      0097CC 90 AE 00         [ 4] 4034         call CPP 
      0097CF 80 FF CD         [ 4] 4035         call AT 
      0097D2 95 3A CD         [ 4] 4036         call HERE
      0097D5 94 4F CD         [ 4] 4037         call SUBB 
      0097D8 A2 93 CD         [ 4] 4038 1$:     call OFFSET 
      0097DB 87 C8 CD         [ 2] 4039         jp STORE  
                                   4040 
                                   4041 ;       :       ( -- ; <string> )
                                   4042 ;       Start a new colon definition
                                   4043 ;       using next word as its name.
      0097DE 85 2C                 4044         .word      LINK
                           0017D9  4045 LINK = . 
      0097E0 98                    4046         .byte      1
      0097E1 EE                    4047         .ascii     ":"
      0017DB                       4048 COLON:
      0097E2 CD 87 7A         [ 4] 4049         call INITOFS       
      0097E5 CD 85 77         [ 4] 4050         CALL   TOKEN
      0097E8 CD 86 2E         [ 4] 4051         CALL   SNAME
      0097EB CD 87 7A         [ 2] 4052         JP     RBRAC
                                   4053 
                                   4054 ;       I:  ( -- )
                                   4055 ;       Start interrupt service routine definition
                                   4056 ;       those definition have no name.
      0097EE CD 85                 4057         .word LINK
                           0017E9  4058         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



      0097F0 60                    4059         .byte 2 
      0097F1 CD 9C                 4060         .ascii "I:" 
      0017EC                       4061 ICOLON:
      0097F3 4B CD 9C         [ 4] 4062         call INITOFS 
      0097F6 08 CD 86         [ 2] 4063         jp RBRAC  
                                   4064 
                                   4065 ;       IMMEDIATE       ( -- )
                                   4066 ;       Make last compiled word
                                   4067 ;       an immediate word.
      0097F9 14 CD                 4068         .word      LINK
                           0017F4  4069 LINK = . 
      0097FB 85                    4070         .byte      9
      0097FC 77 CD 87 6C CD 85 60  4071         .ascii     "IMMEDIATE"
             CC 8B
      0017FE                       4072 IMMED:
      009805 65 81 97         [ 4] 4073         CALL     DOLIT
      009808 C6 01                 4074         .word     0x8000	;  IMEDD*256
      00980A 5D 07 0A         [ 4] 4075         CALL     LAST
      00980B CD 04 F7         [ 4] 4076         CALL     AT
      00980B CD 84 F9         [ 4] 4077         CALL     AT
      00980E 97 63 CD         [ 4] 4078         CALL     ORR
      009811 87 3C CC         [ 4] 4079         CALL     LAST
      009814 85 60 98         [ 4] 4080         CALL     AT
      009817 09 05 43         [ 2] 4081         JP     STORE
                                   4082 
                                   4083 ;; Defining words
                                   4084 
                                   4085 ;       CREATE  ( -- ; <string> )
                                   4086 ;       Compile a new array
                                   4087 ;       without allocating space.
      00981A 41 4C                 4088         .word      LINK
                           00181A  4089 LINK = . 
      00981C 4C                    4090         .byte      6
      00981D 2C 52 45 41 54 45     4091         .ascii     "CREATE"
      00981E                       4092 CREAT:
      00981E CD 84 F9         [ 4] 4093         CALL     TOKEN
      009821 00 CD CD         [ 4] 4094         CALL     SNAME
      009824 95 3A CC         [ 4] 4095         CALL     OVERT        
      009827 95 23 98         [ 4] 4096         CALL     COMPI 
      00982A 18 08                 4097         .word DOVAR 
      00982C 49               [ 4] 4098         RET
                                   4099 
                                   4100 ;       VARIABLE        ( -- ; <string> )
                                   4101 ;       Compile a new variable
                                   4102 ;       initialized to 0.
      00982D 4E 49                 4103         .word      LINK
                           001832  4104 LINK = . 
      00982F 54                    4105         .byte      8
      009830 2D 4F 46 53 41 42 4C  4106         .ascii     "VARIABLE"
             45
      009834                       4107 VARIA:
                                   4108 ; indirect variable so that VARIABLE definition can be compiled in FLASH 
      009834 CD 87 2B         [ 4] 4109         CALL HERE
      009837 CD 85 77         [ 4] 4110         CALL DUPP 
      00983A CD 86 1E         [ 4] 4111         CALL CELLP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



      00983D CD 85 2C         [ 4] 4112         CALL VPP 
      009840 98 51 CD         [ 4] 4113         CALL STORE
      009843 86 14 CD         [ 4] 4114         CALL CREAT
      009846 87 7A CD         [ 4] 4115         CALL DUPP
      009849 85 77 CD         [ 4] 4116         CALL COMMA
      00984C 8C 53 CD         [ 4] 4117         CALL ZERO
      00984F 88 92 CD         [ 4] 4118         call SWAPP 
      009852 87 AF CC         [ 4] 4119         CALL STORE
      009855 85 60 98         [ 4] 4120         CALL FMOVE ; move definition to FLASH
      009858 2B 01 3A         [ 4] 4121         CALL QDUP 
      00985B CD 04 AC         [ 4] 4122         CALL QBRAN 
      00985B CD 98                 4123         .word SET_RAMLAST   
      00985D 34 CD 91         [ 4] 4124         call UPDATVP  ; don't update if variable kept in RAM.
      009860 DD CD 97         [ 4] 4125         CALL UPDATPTR
      009863 16               [ 4] 4126         RET         
      00186E                       4127 SET_RAMLAST: 
      009864 CC 98 0B         [ 4] 4128         CALL LAST 
      009867 98 59 02         [ 4] 4129         CALL AT 
      00986A 49 3A 1D         [ 4] 4130         CALL RAMLAST 
      00986C CC 04 E0         [ 2] 4131         jp STORE  
                                   4132 
                                   4133 
                                   4134 ;       CONSTANT  ( n -- ; <string> )
                                   4135 ;       Compile a new constant 
                                   4136 ;       n CONSTANT name 
      00986C CD 98                 4137         .word LINK 
                           00187C  4138         LINK=. 
      00986E 34                    4139         .byte 8 
      00986F CC 98 0B 98 69 09 49  4140         .ascii "CONSTANT" 
             4D
      001885                       4141 CONSTANT:          
      009877 4D 45 44         [ 4] 4142         CALL TOKEN
      00987A 49 41 54         [ 4] 4143         CALL SNAME 
      00987D 45 17 17         [ 4] 4144         CALL OVERT 
      00987E CD 14 E8         [ 4] 4145         CALL COMPI 
      00987E CD 84                 4146         .word DOCONST
      009880 F9 80 00         [ 4] 4147         CALL COMMA 
      009883 CD 87 8A         [ 4] 4148         CALL FMOVE
      009886 CD 85 77         [ 4] 4149         CALL QDUP 
      009889 CD 85 77         [ 4] 4150         CALL QBRAN 
      00988C CD 86                 4151         .word SET_RAMLAST  
      00988E 7E CD 87         [ 4] 4152         CALL UPDATPTR  
      009891 8A               [ 4] 4153 1$:     RET          
                                   4154 
                                   4155 ; CONSTANT runtime semantic 
                                   4156 ; doCONST  ( -- n )
      009892 CD 85                 4157         .word LINK 
                           0018A7  4158         LINK=.
      009894 77                    4159         .byte 7
      009895 CC 85 60 98 74 06 43  4160         .ascii "DOCONST"
      0018AF                       4161 DOCONST:
      00989C 52 45 41         [ 2] 4162         subw x,#CELLL
      00989F 54 45            [ 2] 4163         popw y 
      0098A1 90 FE            [ 2] 4164         ldw y,(y) 
      0098A1 CD               [ 2] 4165         ldw (x),y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



      0098A2 91               [ 4] 4166         ret 
                                   4167 
                                   4168 ;----------------------------------
                                   4169 ; create double constant 
                                   4170 ; DCONST ( d -- ; <string> )
                                   4171 ;----------------------------------
      0098A3 DD CD                 4172     .word LINK 
                           0018BA  4173     LINK=.
      0098A5 97                    4174     .byte 6 
      0098A6 16 CD 97 97 CD 95     4175     .ascii "DCONST"
      0018C1                       4176 DCONST:
      0098AC 68 86 CB         [ 4] 4177         CALL TOKEN
      0098AF 81 98 9A         [ 4] 4178         CALL SNAME 
      0098B2 08 56 41         [ 4] 4179         CALL OVERT 
      0098B5 52 49 41         [ 4] 4180         CALL COMPI 
      0098B8 42 4C                 4181         .word DO_DCONST
      0098BA 45 14 A3         [ 4] 4182         CALL COMMA
      0098BB CD 14 A3         [ 4] 4183         CALL COMMA  
      0098BB CD 8C 53         [ 4] 4184         CALL FMOVE
      0098BE CD 86 1E         [ 4] 4185         CALL QDUP 
      0098C1 CD 8A CE         [ 4] 4186         CALL QBRAN 
      0098C4 CD 87                 4187         .word SET_RAMLAST  
      0098C6 6C CD 85         [ 4] 4188         CALL UPDATPTR  
      0098C9 60               [ 4] 4189 1$:     RET          
                                   4190     
                                   4191 ;----------------------------------
                                   4192 ; runtime for DCONST 
                                   4193 ; stack double constant 
                                   4194 ; DO-DCONST ( -- d )
                                   4195 ;-----------------------------------
      0098CA CD 98                 4196         .word LINK 
                           0018E6  4197         LINK=.
      0098CC A1                    4198         .byte 9 
      0098CD CD 86 1E CD 95 23 CD  4199         .ascii "DO-DCONST"
             8B 65
      0018F0                       4200 DO_DCONST:
      0098D6 CD 86            [ 2] 4201     popw y 
      0098D8 2E CD 85         [ 2] 4202     ldw YTEMP,y 
      0098DB 60 CD A1         [ 2] 4203     subw x,#2*CELLL 
      0098DE BA CD            [ 2] 4204     ldw y,(y)
      0098E0 87               [ 2] 4205     ldw (x),y 
      0098E1 C8 CD 85         [ 2] 4206     ldw y,YTEMP 
      0098E4 2C 98 EE         [ 2] 4207     ldw y,(2,y)
      0098E7 CD 9C            [ 2] 4208     ldw (2,x),y 
      0098E9 62               [ 4] 4209     ret 
                                   4210 
                                   4211 ;; Tools
                                   4212 
                                   4213 ;       _TYPE   ( b u -- )
                                   4214 ;       Display a string. Filter
                                   4215 ;       non-printing characters.
      0098EA CD A2                 4216         .word      LINK
                           001906  4217 LINK = . 
      0098EC 4E                    4218         .byte      5
      0098ED 81 54 59 50 45        4219         .ascii     "_TYPE"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



      0098EE                       4220 UTYPE:
      0098EE CD 87 8A         [ 4] 4221         CALL     TOR     ;start count down loop
      0098F1 CD 85            [ 2] 4222         JRA     UTYP2   ;skip first pass
      0098F3 77 CD 87         [ 4] 4223 UTYP1:  CALL     DUPP
      0098F6 9D CC 85         [ 4] 4224         CALL     CAT
      0098F9 60 98 B2         [ 4] 4225         CALL     TCHAR
      0098FC 08 43 4F         [ 4] 4226         CALL     EMIT    ;display only printable
      0098FF 4E 53 54         [ 4] 4227         CALL     ONEP    ;increment address
      009902 41 4E 54         [ 4] 4228 UTYP2:  CALL     DONXT
      009905 19 11                 4229         .word      UTYP1   ;loop till done
      009905 CD 91 DD         [ 2] 4230         JP     DROP
                                   4231 
                                   4232 ;       dm+     ( a u -- a )
                                   4233 ;       Dump u bytes from ,
                                   4234 ;       leaving a+u on  stack.
      009908 CD 97                 4235         .word      LINK
                           00192A  4236 LINK = . 
      00990A 16                    4237         .byte      3
      00990B CD 97 97              4238         .ascii     "dm+"
      00192E                       4239 DUMPP:
      00990E CD 95 68         [ 4] 4240         CALL     OVER
      009911 99 2F CD         [ 4] 4241         CALL     DOLIT
      009914 95 23                 4242         .word      4
      009916 CD A1 BA         [ 4] 4243         CALL     UDOTR   ;display address
      009919 CD 87 C8         [ 4] 4244         CALL     SPACE
      00991C CD 85 2C         [ 4] 4245         CALL     TOR     ;start count down loop
      00991F 98 EE            [ 2] 4246         JRA     PDUM2   ;skip first pass
      009921 CD A2 4E         [ 4] 4247 PDUM1:  CALL     DUPP
      009924 81 98 FC         [ 4] 4248         CALL     CAT
      009927 07 44 4F         [ 4] 4249         CALL     DOLIT
      00992A 43 4F                 4250         .word      3
      00992C 4E 53 54         [ 4] 4251         CALL     UDOTR   ;display numeric data
      00992F CD 0A 79         [ 4] 4252         CALL     ONEP    ;increment address
      00992F 1D 00 02         [ 4] 4253 PDUM2:  CALL     DONXT
      009932 90 85                 4254         .word      PDUM1   ;loop till done
      009934 90               [ 4] 4255         RET
                                   4256 
                                   4257 ;       DUMP    ( a u -- )
                                   4258 ;       Dump u bytes from a,
                                   4259 ;       in a formatted manner.
      009935 FE FF                 4260         .word      LINK
                           00195A  4261 LINK = . 
      009937 81                    4262         .byte      4
      009938 99 27 06 44           4263         .ascii     "DUMP"
      00195F                       4264 DUMP:
      00993C 43 4F 4E         [ 4] 4265         CALL     BASE
      00993F 53 54 F7         [ 4] 4266         CALL     AT
      009941 CD 05 67         [ 4] 4267         CALL     TOR
      009941 CD 91 DD         [ 4] 4268         CALL     HEX     ;save radix, set hex
      009944 CD 97 16         [ 4] 4269         CALL     DOLIT
      009947 CD 97                 4270         .word      16
      009949 97 CD 95         [ 4] 4271         CALL     SLASH   ;change count to lines
      00994C 68 99 70         [ 4] 4272         CALL     TOR     ;start count down loop
      00994F CD 95 23         [ 4] 4273 DUMP1:  CALL     CR
      009952 CD 95 23         [ 4] 4274         CALL     DOLIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



      009955 CD A1                 4275         .word      16
      009957 BA CD 87         [ 4] 4276         CALL     DDUP
      00995A C8 CD 85         [ 4] 4277         CALL     DUMPP   ;display numeric
      00995D 2C 98 EE         [ 4] 4278         CALL     ROT
      009960 CD A2 4E         [ 4] 4279         CALL     ROT
      009963 81 99 3A         [ 4] 4280         CALL     SPACE
      009966 09 44 4F         [ 4] 4281         CALL     SPACE
      009969 2D 44 43         [ 4] 4282         CALL     UTYPE   ;display printable characters
      00996C 4F 4E 53         [ 4] 4283         CALL     DONXT
      00996F 54 76                 4284         .word      DUMP1   ;loop till done
      009970 CD 05 94         [ 4] 4285 DUMP3:  CALL     DROP
      009970 90 85 90         [ 4] 4286         CALL     RFROM
      009973 BF 28 1D         [ 4] 4287         CALL     BASE
      009976 00 04 90         [ 2] 4288         JP     STORE   ;restore radix
                                   4289 
                                   4290 ;       .S      ( ... -- ... )
                                   4291 ;        Display  contents of stack.
      009979 FE FF                 4292         .word      LINK
                           0019A6  4293 LINK = . 
      00997B 90                    4294         .byte      2
      00997C BE 28                 4295         .ascii     ".S"
      0019A9                       4296 DOTS:
      00997E 90 EE 02         [ 4] 4297         CALL     CR
      009981 EF 02 81         [ 4] 4298         CALL     DEPTH   ;stack depth
      009984 99 66 05         [ 4] 4299         CALL     TOR     ;start count down loop
      009987 5F 54            [ 2] 4300         JRA     DOTS2   ;skip first pass
      009989 59 50 45         [ 4] 4301 DOTS1:  CALL     RAT
      00998C CD 0B 3E         [ 4] 4302 	CALL     PICK
      00998C CD 85 E7         [ 4] 4303         CALL     DOT     ;index stack, display contents
      00998F 20 0F CD         [ 4] 4304 DOTS2:  CALL     DONXT
      009992 86 1E                 4305         .word      DOTS1   ;loop till done
      009994 CD 85 95         [ 4] 4306         CALL     DOTQP
      009997 CD                    4307         .byte      5
      009998 8B 8F CD 84 B8        4308         .ascii     " <sp "
      00999D CD               [ 4] 4309         RET
                                   4310 
                                   4311 ;       >NAME   ( ca -- na | F )
                                   4312 ;       Convert code address
                                   4313 ;       to a name address.
      00999E 8A F9                 4314         .word      LINK
                           0019CE  4315 LINK = . 
      0099A0 CD                    4316         .byte      5
      0099A1 85 0D 99 91 CC        4317         .ascii     ">NAME"
      0019D4                       4318 TNAME:
      0099A6 86 14 99         [ 4] 4319         CALL     CNTXT   ;vocabulary link
      0099A9 86 03 64         [ 4] 4320 TNAM2:  CALL     AT
      0099AC 6D 2B 9E         [ 4] 4321         CALL     DUPP    ;?last word in a vocabulary
      0099AE CD 04 AC         [ 4] 4322         CALL     QBRAN
      0099AE CD 86                 4323         .word      TNAM4
      0099B0 48 CD 84         [ 4] 4324         CALL     DDUP
      0099B3 F9 00 04         [ 4] 4325         CALL     NAMET
      0099B6 CD 90 33         [ 4] 4326         CALL     XORR    ;compare
      0099B9 CD 8F 83         [ 4] 4327         CALL     QBRAN
      0099BC CD 85                 4328         .word      TNAM3
      0099BE E7 20 11         [ 4] 4329         CALL     CELLM   ;continue with next word
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



      0099C1 CD 86            [ 2] 4330         JRA     TNAM2
      0099C3 1E CD 85         [ 4] 4331 TNAM3:  CALL     SWAPP
      0099C6 95 CD 84         [ 2] 4332         JP     DROP
      0099C9 F9 00 03         [ 4] 4333 TNAM4:  CALL     DDROP
      0099CC CD 90 33         [ 2] 4334         JP     ZERO
                                   4335 
                                   4336 ;       .ID     ( na -- )
                                   4337 ;        Display  name at address.
      0099CF CD 8A                 4338         .word      LINK
                           001A03  4339 LINK = . 
      0099D1 F9                    4340         .byte      3
      0099D2 CD 85 0D              4341         .ascii     ".ID"
      001A07                       4342 DOTID:
      0099D5 99 C1 81         [ 4] 4343         CALL     QDUP    ;if zero no name
      0099D8 99 AA 04         [ 4] 4344         CALL     QBRAN
      0099DB 44 55                 4345         .word      DOTI1
      0099DD 4D 50 BC         [ 4] 4346         CALL     COUNT
      0099DF CD 04 79         [ 4] 4347         CALL     DOLIT
      0099DF CD 86                 4348         .word      0x1F
      0099E1 DB CD 85         [ 4] 4349         CALL     ANDD    ;mask lexicon bits
      0099E4 77 CD 85         [ 2] 4350         JP     UTYPE
      0099E7 E7 CD 8E         [ 4] 4351 DOTI1:  CALL     DOTQP
      0099EA 0B                    4352         .byte      9
      0099EB CD 84 F9 00 10 CD 8A  4353         .ascii     " noName"
      0099F2 1F               [ 4] 4354         RET
                                   4355 
                           000000  4356 WANT_SEE=0
                           000000  4357 .if WANT_SEE 
                                   4358 ;       SEE     ( -- ; <string> )
                                   4359 ;       A simple decompiler.
                                   4360 ;       Updated for byte machines.
                                   4361         .word      LINK
                                   4362 LINK = . 
                                   4363         .byte      3
                                   4364         .ascii     "SEE"
                                   4365 SEE:
                                   4366         CALL     TICK    ;starting address
                                   4367         CALL     CR
                                   4368         CALL     ONEM
                                   4369 SEE1:   CALL     ONEP
                                   4370         CALL     DUPP
                                   4371         CALL     AT
                                   4372         CALL     DUPP
                                   4373         CALL     QBRAN
                                   4374         .word    SEE2
                                   4375         CALL     TNAME   ;?is it a name
                                   4376 SEE2:   CALL     QDUP    ;name address or zero
                                   4377         CALL     QBRAN
                                   4378         .word    SEE3
                                   4379         CALL     SPACE
                                   4380         CALL     DOTID   ;display name
                                   4381         CALL     ONEP
                                   4382         JRA      SEE4
                                   4383 SEE3:   CALL     DUPP
                                   4384         CALL     CAT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



                                   4385         CALL     UDOT    ;display number
                                   4386 SEE4:   CALL     NUFQ    ;user control
                                   4387         CALL     QBRAN
                                   4388         .word    SEE1
                                   4389         JP     DROP
                                   4390 .endif ; WANT_SEE 
                                   4391 
                                   4392 ;       WORDS   ( -- )
                                   4393 ;       Display names in vocabulary.
      0099F3 CD 85                 4394         .word      LINK
                           001A2B  4395 LINK = . 
      0099F5 E7                    4396         .byte      5
      0099F6 CD 8F CB CD 84        4397         .ascii     "WORDS"
      001A31                       4398 WORDS:
      0099FB F9 00 10         [ 4] 4399         CALL     CR
      0099FE CD 88 04         [ 4] 4400         CALL     CNTXT   ;only in context
      009A01 CD 99 AE         [ 4] 4401 WORS1:  CALL     AT
      009A04 CD 87 D9         [ 4] 4402         CALL     QDUP    ;?at end of list
      009A07 CD 87 D9         [ 4] 4403         CALL     QBRAN
      009A0A CD 8F                 4404         .word      WORS2
      009A0C 83 CD 8F         [ 4] 4405         CALL     DUPP
      009A0F 83 CD 99         [ 4] 4406         CALL     SPACE
      009A12 8C CD 85         [ 4] 4407         CALL     DOTID   ;display a name
      009A15 0D 99 F6         [ 4] 4408         CALL     CELLM
      009A18 CD 86 14         [ 4] 4409         CALL     BRAN
      009A1B CD 85                 4410         .word      WORS1
      009A1D C8               [ 4] 4411 WORS2:  RET
                                   4412 
                                   4413         
                                   4414 ;; Hardware reset
                                   4415 
                                   4416 ;       hi      ( -- )
                                   4417 ;       Display sign-on message.
      009A1E CD 86                 4418         .word      LINK
                           001A56  4419 LINK = . 
      009A20 DB                    4420         .byte      2
      009A21 CC 85                 4421         .ascii     "hi"
      001A59                       4422 HI:
      009A23 60 99 DA         [ 4] 4423         CALL     CR
      009A26 02 2E 53         [ 4] 4424         CALL     DOTQP   ;initialize I/O
      009A29 0F                    4425         .byte      15
      009A29 CD 8F CB CD 8B A7 CD  4426         .ascii     "stm8eForth v"
             85 E7 20 09 CD
      009A35 85                    4427 	.byte      VER+'0'
      009A36 DB                    4428         .byte      '.' 
      009A37 CD                    4429 	.byte      EXT+'0' ;version
      009A38 8B BE CD         [ 4] 4430         CALL    DOTQP
                           000001  4431 .if NUCLEO          
      009A3B 90                    4432         .byte 18
      009A3C 66 CD 85 0D 9A 34 CD  4433         .ascii  " on NUCLEO-8S208RB"
             90 0A 05 20 3C 73 70
             20 81 9A 26
                                   4434 .endif
                           000000  4435 .if DISCOVERY
                                   4436         .byte 19
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



                                   4437         .ascii  " on STM8S-DISCOVERY"
                                   4438 .endif
                           000000  4439 .if DOORBELL
                                   4440         .byte 16
                                   4441         .ascii " on stm8s105k6b6"
                                   4442 .endif
      009A4E 05 3E 4E         [ 2] 4443         JP     CR
                                   4444 
                           000000  4445 WANT_DEBUG=0
                           000000  4446 .if WANT_DEBUG 
                                   4447 ;       DEBUG      ( -- )
                                   4448 ;       Display sign-on message.
                                   4449 ;        .word      LINK
                                   4450 LINK = . 
                                   4451         .byte      5
                                   4452         .ascii     "DEBUG"
                                   4453 DEBUG:
                                   4454 	CALL DOLIT
                                   4455 	.word 0x65
                                   4456 	CALL EMIT
                                   4457 	CALL DOLIT
                                   4458 	.word 0
                                   4459  	CALL ZLESS 
                                   4460 	CALL DOLIT
                                   4461 	.word 0xFFFE
                                   4462 	CALL ZLESS 
                                   4463 	CALL UPLUS 
                                   4464  	CALL DROP 
                                   4465 	CALL DOLIT
                                   4466 	.word 3
                                   4467 	CALL UPLUS 
                                   4468 	CALL UPLUS 
                                   4469  	CALL DROP
                                   4470 	CALL DOLIT
                                   4471 	.word 0x43
                                   4472 	CALL UPLUS 
                                   4473  	CALL DROP
                                   4474 	CALL EMIT
                                   4475 	CALL DOLIT
                                   4476 	.word 0x4F
                                   4477 	CALL DOLIT
                                   4478 	.word 0x6F
                                   4479  	CALL XORR
                                   4480 	CALL DOLIT
                                   4481 	.word 0xF0
                                   4482  	CALL ANDD
                                   4483 	CALL DOLIT
                                   4484 	.word 0x4F
                                   4485  	CALL ORR
                                   4486 	CALL EMIT
                                   4487 	CALL DOLIT
                                   4488 	.word 8
                                   4489 	CALL DOLIT
                                   4490 	.word 6
                                   4491  	CALL SWAPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



                                   4492 	CALL OVER
                                   4493 	CALL XORR
                                   4494 	CALL DOLIT
                                   4495 	.word 3
                                   4496 	CALL ANDD 
                                   4497 	CALL ANDD
                                   4498 	CALL DOLIT
                                   4499 	.word 0x70
                                   4500 	CALL UPLUS 
                                   4501 	CALL DROP
                                   4502 	CALL EMIT
                                   4503 	CALL DOLIT
                                   4504 	.word 0
                                   4505 	CALL QBRAN
                                   4506 	.word DEBUG1
                                   4507 	CALL DOLIT
                                   4508 	.word 0x3F
                                   4509 DEBUG1:
                                   4510 	CALL DOLIT
                                   4511 	.word 0xFFFF
                                   4512 	CALL QBRAN
                                   4513 	.word DEBUG2
                                   4514 	CALL DOLIT
                                   4515 	.word 0x74
                                   4516 	CALL BRAN
                                   4517 	.word DEBUG3
                                   4518 DEBUG2:
                                   4519 	CALL DOLIT
                                   4520 	.word 0x21
                                   4521 DEBUG3:
                                   4522 	CALL EMIT
                                   4523 	CALL DOLIT
                                   4524 	.word 0x68
                                   4525 	CALL DOLIT
                                   4526 	.word 0x80
                                   4527 	CALL STORE
                                   4528 	CALL DOLIT
                                   4529 	.word 0x80
                                   4530 	CALL AT
                                   4531 	CALL EMIT
                                   4532 	CALL DOLIT
                                   4533 	.word 0x4D
                                   4534 	CALL TOR
                                   4535 	CALL RAT
                                   4536 	CALL RFROM
                                   4537 	CALL ANDD
                                   4538 	CALL EMIT
                                   4539 	CALL DOLIT
                                   4540 	.word 0x61
                                   4541 	CALL DOLIT
                                   4542 	.word 0xA
                                   4543 	CALL TOR
                                   4544 DEBUG4:
                                   4545 	CALL DOLIT
                                   4546 	.word 1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



                                   4547 	CALL UPLUS 
                                   4548 	CALL DROP
                                   4549 	CALL DONXT
                                   4550 	.word DEBUG4
                                   4551 	CALL EMIT
                                   4552 	CALL DOLIT
                                   4553 	.word 0x656D
                                   4554 	CALL DOLIT
                                   4555 	.word 0x100
                                   4556 	CALL UMSTA
                                   4557 	CALL SWAPP
                                   4558 	CALL DOLIT
                                   4559 	.word 0x100
                                   4560 	CALL UMSTA
                                   4561 	CALL SWAPP 
                                   4562 	CALL DROP
                                   4563 	CALL EMIT
                                   4564 	CALL EMIT
                                   4565 	CALL DOLIT
                                   4566 	.word 0x2043
                                   4567 	CALL DOLIT
                                   4568 	.word 0
                                   4569 	CALL DOLIT
                                   4570 	.word 0x100
                                   4571 	CALL UMMOD
                                   4572 	CALL EMIT
                                   4573 	CALL EMIT
                                   4574 	;JP ORIG
                                   4575 	RET
                                   4576 .endif ; WANT_DEBUG 
                                   4577 
                                   4578 
                                   4579 ;       'BOOT   ( -- a )
                                   4580 ;       The application startup vector.
      009A51 41 4D                 4581         .word      LINK
                           001A8A  4582 LINK = . 
      009A53 45                    4583         .byte      5
      009A54 27 42 4F 4F 54        4584         .ascii     "'BOOT"
      001A90                       4585 TBOOT:
      009A54 CD 87 5E         [ 4] 4586         CALL     DOVAR
      009A57 CD 85                 4587         .word    APP_RUN      ;application to boot
                                   4588 
                                   4589 ;       COLD    ( -- )
                                   4590 ;       The hilevel cold start s=ence.
      009A59 77 CD                 4591         .word      LINK
                           001A97  4592         LINK = . 
      009A5B 86                    4593         .byte      4
      009A5C 1E CD 85 2C           4594         .ascii     "COLD"
      001A9C                       4595 COLD:
                           000000  4596 .if WANT_DEBUG
                                   4597         CALL DEBUG
                                   4598 .endif ; WANT_DEBUG
      009A60 9A 7B CD         [ 4] 4599 COLD1:  CALL     DOLIT
      009A63 88 04                 4600         .word      UZERO
      009A65 CD 91 EB         [ 4] 4601 	CALL     DOLIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      009A68 CD 86                 4602         .word      UPP
      009A6A 93 CD 85         [ 4] 4603         CALL     DOLIT
      009A6D 2C 9A                 4604 	.word      UEND-UZERO
      009A6F 75 CD 8A         [ 4] 4605         CALL     CMOVE   ;initialize user area
                           000001  4606 .if WANT_FLOAT 
      009A72 DD 20 E2         [ 4] 4607         CALL    FINIT 
                                   4608 .endif 
                                   4609 ; if APP_RUN==0 initialize with ca de 'hi'  
      009A75 CD 86 2E CC      [ 2] 4610         ldw y,APP_RUN 
      009A79 86 14            [ 1] 4611         jrne 0$
      009A7B CD 87 F9         [ 2] 4612         subw x,#CELLL 
      009A7E CC 8B 65 9A      [ 2] 4613         ldw y,#HI  
      009A82 4E               [ 2] 4614         ldw (x),y
      009A83 03 2E 49         [ 4] 4615         call UPDATRUN 
      001AC2                       4616 0$:        
                                   4617 ; update LAST with APP_LAST 
                                   4618 ; if APP_LAST > LAST else do the opposite
      009A86 44 CE 40 00      [ 2] 4619         ldw y,APP_LAST 
      009A87 90 B3 1E         [ 2] 4620         cpw y,ULAST 
      009A87 CD 87            [ 1] 4621         jrugt 1$ 
                                   4622 ; save LAST at APP_LAST  
      009A89 C8 CD 85         [ 4] 4623         call UPDATLAST 
      009A8C 2C 9A            [ 2] 4624         jra 2$
      001AD0                       4625 1$: ; update LAST with APP_LAST 
      009A8E 9D CD 8C         [ 2] 4626         ldw ULAST,y
      009A91 3C CD 84         [ 2] 4627         ldw UCNTXT,y
      001AD6                       4628 2$:  
                                   4629 ; update APP_CP if < app_space 
      009A94 F9 00 1F CD      [ 2] 4630         ldw y,APP_CP  
      009A98 86 6A CC         [ 2] 4631         cpw y,UCP   
      009A9B 99 8C            [ 1] 4632         jruge 3$ 
      009A9D CD 90 0A         [ 4] 4633         call UPDATCP
      009AA0 09 20 6E         [ 2] 4634         ldw y,UCP   
      001AE5                       4635 3$:
      009AA3 6F 4E 61         [ 2] 4636         ldw UCP,y                 
                                   4637 ; update UVP with APP_VP  
                                   4638 ; if APP_VP>UVP else do the opposite 
      009AA6 6D 65 81 9A      [ 2] 4639         ldw y,APP_VP 
      009AAA 83 05 57         [ 2] 4640         cpw y,UVP 
      009AAD 4F 52            [ 1] 4641         jrugt 4$
      009AAF 44 53 E2         [ 4] 4642         call UPDATVP 
      009AB1 20 03            [ 2] 4643         jra 6$
      001AF6                       4644 4$: ; update UVP with APP_VP 
      009AB1 CD 8F CB         [ 2] 4645         ldw UVP,y 
      001AF9                       4646 6$:      
      009AB4 CD 87 5E         [ 4] 4647         CALL     PRESE   ;initialize data stack and TIB
      009AB7 CD 85 77         [ 4] 4648         CALL     TBOOT
      009ABA CD 87 C8         [ 4] 4649         CALL     ATEXE   ;application boot
      009ABD CD 85 2C         [ 4] 4650         CALL     OVERT
      009AC0 9A D3 CD         [ 2] 4651         JP     QUIT    ;start interpretation
                                   4652 
                                   4653 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



                                   4654         .include "flash.asm"
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
      009AC3 86 1E                   30     .word LINK 
                           001B0A    31     LINK=.
      009AC5 CD                      32     .byte 3 
      009AC6 8F 83 CD                33     .ascii "FP!"
      001B0E                         34 FPSTOR:
      009AC9 9A 87            [ 1]   35     ldw y,x
      009ACB CD 8A            [ 2]   36     ldw y,(y)
      009ACD DD CD            [ 1]   37     ld a,yl 
      009ACF 85 43            [ 1]   38     ld FPTR,a 
      009AD1 9A B7 81         [ 2]   39     addw x,#CELLL 
      009AD4 9A AB            [ 1]   40     ldw y,x 
      009AD6 02 68            [ 2]   41     ldw y,(y)
      009AD8 69 BF 37         [ 2]   42     ldw PTR16,y
      009AD9 1C 00 02         [ 2]   43     addw x,#CELLL 
      009AD9 CD               [ 4]   44     ret 
                                     45 
                                     46 ;-----------------------------------
                                     47 ; return EEPROM base address 
                                     48 ; as a double 
                                     49 ;  EEPROM  ( -- ud )
                                     50 ;-----------------------------------
      009ADA 8F CB                   51     .word LINK 
                           001B26    52 LINK=.
      009ADC CD                      53     .byte 6 
      009ADD 90 0A 0F 73 74 6D       54     .ascii "EEPROM"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



      001B2D                         55 EEPROM: 
      009AE3 38 65 46 6F      [ 2]   56     ldw y,#EEPROM_BASE
      009AE7 72 74 68         [ 2]   57     subw x,#2*CELLL 
      009AEA 20 76            [ 2]   58     ldw (2,x),y 
      009AEC 33 2E            [ 1]   59     clrw y 
      009AEE 30               [ 2]   60     ldw (x),y 
      009AEF CD               [ 4]   61     ret
                                     62 
                                     63 ;---------------------------------
                                     64 ; return APP_LAST pointer as double
                                     65 ; EEP-LAST ( -- ud )
                                     66 ;---------------------------------
      009AF0 90 0A                   67 	.word LINK 
                           001B3C    68 	LINK=.
      009AF2 12                      69 	.byte 8 
      009AF3 20 6F 6E 20 4E 55 43    70 	.ascii "EEP-LAST"
             4C
      001B45                         71 EEPLAST:
      009AFB 45 4F 2D         [ 2]   72 	subw x,#2*CELLL 
      009AFE 38 53 32 30      [ 2]   73 	ldw y,#APP_LAST 
      009B02 38 52            [ 2]   74 	ldw (2,x),y 
      009B04 42 CC            [ 1]   75 	clrw y 
      009B06 8F               [ 2]   76 	ldw (x),y 
      009B07 CB               [ 4]   77 	ret 
                                     78 
                                     79 ;----------------------------------
                                     80 ; return APP_RUN pointer as double	
                                     81 ; EEP-RUN ( -- ud )
                                     82 ;-----------------------------------
      009B08 9A D6                   83 	.word LINK 
                           001B54    84 	LINK=.
      009B0A 05                      85 	.byte 7
      009B0B 27 42 4F 4F 54 55 4E    86 	.ascii "EEP-RUN"
      009B10                         87 EEPRUN:
      009B10 CD 86 CB         [ 2]   88 	subw x,#2*CELLL 
      009B13 40 02 9B 0A      [ 2]   89 	ldw y,#APP_RUN 
      009B17 04 43            [ 2]   90 	ldw (2,x),y 
      009B19 4F 4C            [ 1]   91 	clrw y 
      009B1B 44               [ 2]   92 	ldw (x),y 
      009B1C 81               [ 4]   93 	ret 
                                     94 
                                     95 ;------------------------------------
                                     96 ; return APP_CP pointer as double 
                                     97 ; EEP-CP ( -- ud )
                                     98 ;------------------------------------
      009B1C CD 84                   99 	.word LINK
                           001B6B   100 	LINK=.
      009B1E F9                     101 	.byte 6 
      009B1F 80 AB CD 84 F9 00      102 	.ascii "EEP-CP"
      001B72                        103 EEPCP:
      009B25 06 CD 84         [ 2]  104 	subw x,#2*CELLL 
      009B28 F9 00 1E CD      [ 2]  105 	ldw y,#APP_CP  
      009B2C 8C A0            [ 2]  106 	ldw (2,x),y 
      009B2E CD A4            [ 1]  107 	clrw y 
      009B30 98               [ 2]  108 	ldw (x),y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



      009B31 90               [ 4]  109 	ret 
                                    110 
                                    111 ;------------------------------------
                                    112 ; return APP_VP pointer as double 
                                    113 ; EEP-VP ( -- ud )
                                    114 ;-------------------------------------
      009B32 CE 40                  115 	.word LINK
                           001B81   116 	LINK=.
      009B34 02                     117 	.byte 6
      009B35 26 0B 1D 00 02 90      118 	.ascii "EEP-VP"
      001B88                        119 EEPVP:
      009B3B AE 9A D9         [ 2]  120 	subw x,#2*CELLL 
      009B3E FF CD 9C 3A      [ 2]  121 	ldw y,#APP_VP  
      009B42 EF 02            [ 2]  122 	ldw (2,x),y 
      009B42 90 CE            [ 1]  123 	clrw y 
      009B44 40               [ 2]  124 	ldw (x),y 
      009B45 00               [ 4]  125 	ret 
                                    126 
                                    127 ;----------------------------------
                                    128 ; update APP_LAST with LAST 
                                    129 ; UPDAT-LAST ( -- )
                                    130 ;----------------------------------
      009B46 90 B3                  131 	.word LINK 
                           001B97   132 	LINK=.
      009B48 1E                     133 	.byte 10
      009B49 22 05 CD 9C 22 20 06   134 	.ascii "UPDAT-LAST"
             41 53 54
      009B50                        135 UPDATLAST:
      009B50 90 BF 1E         [ 4]  136 	call LAST
      009B53 90 BF 18         [ 4]  137 	call AT  
      009B56 CD 1B 45         [ 4]  138 	call EEPLAST
      009B56 90 CE 40         [ 2]  139 	jp EESTORE 
                                    140 
                                    141 ;---------------------------------
                                    142 ; update APP_RUN 
                                    143 ; UPDAT-RUN ( a -- )
                                    144 ;---------------------------------
      009B59 04 90                  145 	.word LINK
                           001BB0   146 	LINK=.
      009B5B B3                     147 	.byte 9
      009B5C 1C 24 06 CD 9C 4B 90   148 	.ascii "UPDAT-RUN"
             BE 1C
      009B65                        149 UPDATRUN:
      009B65 90 BF 1C         [ 4]  150 	call EEPRUN
      009B68 90 CE 40         [ 2]  151 	jp EESTORE 
                                    152 	
                                    153 ;---------------------------------
                                    154 ; update APP_CP with CP 
                                    155 ; UPDAT-CP ( -- )
                                    156 ;---------------------------------
      009B6B 06 90                  157 	.word LINK 
                           001BC2   158 	LINK=.
      009B6D B3                     159 	.byte 8 
      009B6E 1A 22 05 CD 9C 62 20   160 	.ascii "UPDAT-CP"
             03
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      009B76                        161 UPDATCP:
      009B76 90 BF 1A         [ 4]  162 	call CPP 
      009B79 CD 04 F7         [ 4]  163 	call AT 
      009B79 CD 94 CE         [ 4]  164 	call EEPCP 
      009B7C CD 9B 10         [ 2]  165 	jp EESTORE 
                                    166 
                                    167 ;----------------------------------
                                    168 ; update APP_VP with VP 
                                    169 ; UPDAT-VP ( -- )
                                    170 ;----------------------------------
      009B7F CD 8C                  171 	.word LINK
                           001BD9   172 	LINK=.
      009B81 89                     173 	.byte 8 
      009B82 CD 97 97 CC 94 EB 9B   174 	.ascii "UPDAT-VP" 
             17
      001BE2                        175 UPDATVP:
      009B8A 03 46 50         [ 4]  176 	call VPP 
      009B8D 21 04 F7         [ 4]  177 	call AT
      009B8E CD 1B 88         [ 4]  178 	call EEPVP 
      009B8E 90 93 90         [ 2]  179 	jp EESTORE
                                    180 	
                           000001   181 .if NUCLEO
                                    182 ;----------------------------------
                                    183 ; fetch integer at address over 65535
                                    184 ;  F@   ( ud -- n )
                                    185 ;----------------------------------
      009B91 FE 90                  186     .word LINK 
                           001BF0   187 LINK=.
      009B93 9F                     188     .byte 2
      009B94 B7 36                  189     .ascii "F@"
      001BF3                        190 FARAT:
      009B96 1C 00 02         [ 4]  191     call FPSTOR
      009B99 90 93 90         [ 2]  192 	jp EE_READ 
                                    193 
                                    194 
                                    195 ;-------------------------------------
                                    196 ; fetch C at address over 65535 
                                    197 ; FC@ ( ud -- c)
                                    198 ;-------------------------------------
      009B9C FE 90                  199     .word LINK
                           001BFB   200     LINK=.
      009B9E BF                     201     .byte 3 
      009B9F 37 1C 00               202     .ascii "FC@" 
      001BFF                        203 FARCAT:
      009BA2 02 81 9B         [ 4]  204     call FPSTOR
      009BA5 8A 06 45         [ 2]  205 	jp EE_CREAD  
                                    206 .endif ; NUCLEO 
                                    207 
                                    208 ;----------------------------------
                                    209 ; UNLOCK EEPROM/OPT for writing/erasing
                                    210 ; wait endlessly for FLASH_IAPSR_DUL bit.
                                    211 ;  UNLKEE   ( -- )
                                    212 ;----------------------------------
      009BA8 45 50                  213     .word LINK 
                           001C07   214 LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



      009BAA 52                     215     .byte 6 
      009BAB 4F 4D 4C 4B 45 45      216     .ascii "UNLKEE"
      009BAD                        217 UNLKEE:
      009BAD 90 AE 40 00      [ 1]  218 	mov FLASH_CR2,#0 
      009BB1 1D 00 04 EF      [ 1]  219 	mov FLASH_NCR2,#0xFF 
      009BB5 02 90 5F FF      [ 1]  220 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      009BB9 81 9B A6 08      [ 1]  221     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      009BBD 45 45 50 2D 4C   [ 2]  222 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      009BC2 41               [ 4]  223 	ret
                                    224 
                                    225 ;----------------------------------
                                    226 ; UNLOCK FLASH for writing/erasing
                                    227 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                    228 ; UNLKFL  ( -- )
                                    229 ;----------------------------------
      009BC3 53 54                  230     .word LINK 
                           001C26   231 LINK=. 
      009BC5 06                     232     .byte 6 
      009BC5 1D 00 04 90 AE 40      233     .ascii "UNLKFL"    
      001C2D                        234 UNLKFL:
      009BCB 00 EF 02 90      [ 1]  235 	mov FLASH_CR2,#0 
      009BCF 5F FF 81 9B      [ 1]  236 	mov FLASH_NCR2,#0xFF 
      009BD3 BC 07 45 45      [ 1]  237 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      009BD7 50 2D 52 55      [ 1]  238 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      009BDB 4E 03 50 5F FB   [ 2]  239 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      009BDC 81               [ 4]  240 	ret
                                    241 
                                    242 ;-----------------------------
                                    243 ; UNLOCK FLASH or EEPROM 
                                    244 ; according to FPTR address 
                                    245 ;  UNLOCK ( -- )
                                    246 ;-----------------------------
      009BDC 1D 00                  247 	.word LINK 
                           001C45   248 	LINK=.
      009BDE 04                     249 	.byte 6
      009BDF 90 AE 40 02 EF 02      250 	.ascii "UNLOCK"
      001C4C                        251 UNLOCK:
                                    252 ; put addr[15:0] in Y, for bounds check.
      009BE5 90 5F FF         [ 2]  253 	ldw y,PTR16   ; Y=addr15:0
                                    254 ; check addr[23:16], if <> 0 then it is extened flash memory
      009BE8 81 9B            [ 1]  255 	tnz FPTR 
      009BEA D4 06            [ 1]  256 	jrne 4$
      009BEC 45 45 50 2D      [ 2]  257     cpw y,#FLASH_BASE
      009BF0 43 50            [ 1]  258     jruge 4$
      009BF2 90 A3 40 00      [ 2]  259 	cpw y,#EEPROM_BASE  
      009BF2 1D 00            [ 1]  260     jrult 9$
      009BF4 04 90 AE 40      [ 2]  261 	cpw y,#OPTION_END 
      009BF8 04 EF            [ 1]  262 	jrugt 9$
      009BFA 02 90 5F         [ 4]  263 	call UNLKEE
      009BFD FF               [ 4]  264 	ret 
      009BFE 81 9B EB         [ 4]  265 4$: call UNLKFL
      009C01 06               [ 4]  266 9$: ret 
                                    267 
                                    268 ;-------------------------
                                    269 ; LOCK write access to 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



                                    270 ; FLASH and EEPROM 
                                    271 ; LOCK ( -- )
                                    272 ;-------------------------
      009C02 45 45                  273 	.word LINK 
                           001C6F   274 	LINK=.
      009C04 50                     275 	.byte 4 
      009C05 2D 56 50 4B            276 	.ascii "LOCK" 
      009C08                        277 LOCK: 
      009C08 1D 00 04 90      [ 1]  278 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      009C0C AE 40 06 EF      [ 1]  279 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009C10 02               [ 4]  280 	ret 
                                    281 
                                    282 ;-------------------------
                                    283 ; increment FPTR 
                                    284 ; INC-FPTR ( -- )
                                    285 ;-------------------------
      009C11 90 5F                  286 	.word LINK 
                           001C7F   287 	LINK=. 
      009C13 FF                     288 	.byte 8 
      009C14 81 9C 01 0A 55 50 44   289 	.ascii "INC-FPTR" 
             41
      001C88                        290 INC_FPTR:
      009C1C 54 2D            [ 1]  291 	inc PTR8 
      009C1E 4C 41            [ 1]  292 	jrne 1$
      009C20 53 54            [ 2]  293 	pushw y 
      009C22 90 BE 36         [ 2]  294 	ldw y,FPTR 
      009C22 CD 87            [ 1]  295 	incw y 
      009C24 8A CD 85         [ 2]  296 	ldw FPTR,y
      009C27 77 CD            [ 2]  297 	popw y  
      009C29 9B               [ 4]  298 1$: ret 
                                    299 
                                    300 ;------------------------------
                                    301 ; add u to FPTR 
                                    302 ; PTR+ ( u -- )
                                    303 ;------------------------------
      009C2A C5 CC                  304 	.word LINK 
                           001C9B   305 	LINK=.
      009C2C 9E                     306 	.byte 4 
      009C2D 18 9C 17 09            307 	.ascii "PTR+"
      001CA0                        308 PTRPLUS:
      009C31 55 50            [ 1]  309 	ldw y,x 
      009C33 44 41 54         [ 2]  310 	addw x,#CELLL 
      009C36 2D 52 55 4E      [ 2]  311 	addw y,PTR16 
      009C3A 90 BF 37         [ 2]  312 	ldw PTR16,y  
      009C3A CD 9B            [ 1]  313 	jrnc 1$
      009C3C DC CC            [ 1]  314 	inc FPTR 
      009C3E 9E               [ 4]  315 1$: ret 
                                    316 
                                    317 ;---------------------------------
                                    318 ; read word at address pointed FPTR
                                    319 ; increment FPTR 
                                    320 ; EE-READ ( -- w )
                                    321 ;------------------------------------
      009C3F 18 9C                  322 	.word LINK 
                           001CB3   323 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      009C41 30                     324 	.byte 7 
      009C42 08 55 50 44 41 54 2D   325 	.ascii "EE-READ"
      001CBB                        326 EE_READ:
      009C49 43 50 02         [ 2]  327 	subw x,#CELLL 
      009C4B 92 BC 00 36      [ 5]  328 	ldf a,[FPTR]
      009C4B CD 87            [ 1]  329 	ld yh,a 
      009C4D 7A CD 85         [ 4]  330 	call INC_FPTR 
      009C50 77 CD 9B F2      [ 5]  331 	ldf a,[FPTR]
      009C54 CC 9E 18         [ 4]  332 	call INC_FPTR 
      009C57 9C 42            [ 1]  333 	ld yl,a 
      009C59 08               [ 2]  334 	ldw (x),y 
      009C5A 55               [ 4]  335 	ret 
                                    336 
                                    337 ;---------------------------------------
                                    338 ; Read byte at address pointed by FPTR 
                                    339 ; EE-CREAD ( -- c )
                                    340 ;---------------------------------------
      009C5B 50 44                  341 	.word LINK 
                           001CD4   342 	LINK=.
      009C5D 41                     343 	.byte 8
      009C5E 54 2D 56 50 52 45 41   344 	.ascii "EE-CREAD" 
             44
      009C62                        345 EE_CREAD:
      009C62 CD 87 6C         [ 2]  346 	subw x,#CELLL 
      009C65 CD 85 77 CD      [ 5]  347 	ldf a,[FPTR]	
      009C69 9C 08 CC         [ 4]  348 	call INC_FPTR
      009C6C 9E 18            [ 1]  349 	clrw y 
      009C6E 9C 59            [ 1]  350 	ld yl,a 
      009C70 02               [ 2]  351 	ldw (x),y 
      009C71 46               [ 4]  352 	ret 
                                    353 
                                    354 ;----------------------------
                                    355 ; write a byte at address pointed 
                                    356 ; by FPTR and increment FPTR.
                                    357 ; Expect pointer already initialized 
                                    358 ; and memory unlocked 
                                    359 ; WR-BYTE ( c -- )
                                    360 ;----------------------------
      009C72 40 D4                  361 	.word LINK 
                           001CEF   362 	LINK=. 
      009C73 07                     363 	.byte 7 
      009C73 CD 9B 8E CC 9D 3B 9C   364 	.ascii "WR-BYTE" 
                                    365 
      001CF7                        366 WR_BYTE:
      009C7A 70 03 46         [ 4]  367 	call FC_XOFF
      009C7D 43 40            [ 1]  368 	ldw y,x 
      009C7F 90 FE            [ 2]  369 	ldw y,(y)
      009C7F CD 9B 8E         [ 2]  370 	addw x,#CELLL 
      009C82 CC 9D            [ 1]  371 	ld a,yl
      009C84 5D 9C 7B 06      [ 4]  372 	ldf [FPTR],a
      009C88 55 4E 4C 4B 45   [ 2]  373 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009C8D 45 04 4F         [ 4]  374 	call FC_XON
      009C8E CC 1C 88         [ 2]  375 	jp INC_FPTR 
                                    376 
                                    377 ;---------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



                                    378 ; write a word at address pointed 
                                    379 ; by FPTR and increment FPTR 
                                    380 ; Expect pointer already initialzed 
                                    381 ; and memory unlocked 
                                    382 ; WR-WORD ( w -- )
                                    383 ;---------------------------------------
      009C8E 35 00                  384 	.word LINK 
                           001D14   385 	LINK=.
      009C90 50                     386 	.byte 7 
      009C91 5B 35 FF 50 5C 35 AE   387 	.ascii "WR-WORD" 
      001D1C                        388 WR_WORD:
      009C98 50 64 35         [ 4]  389 	call FC_XOFF
      009C9B 56 50            [ 1]  390 	ldw y,x
      009C9D 64 72            [ 2]  391 	ldw y,(y)
      009C9F 07 50 5F         [ 2]  392 	addw x,#CELLL 
      009CA2 FB 81            [ 1]  393 	ld a,yh 
      009CA4 9C 87 06 55      [ 4]  394 	ldf [FPTR],a
      009CA8 4E 4C 4B 46 4C   [ 2]  395 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009CAD CD 1C 88         [ 4]  396 	call INC_FPTR 
      009CAD 35 00            [ 1]  397 	ld a,yl 
      009CAF 50 5B 35 FF      [ 4]  398 	ldf [FPTR],a
      009CB3 50 5C 35 56 50   [ 2]  399 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009CB8 62 35 AE         [ 4]  400 	call FC_XON
      009CBB 50 62 72         [ 2]  401 	jp INC_FPTR 
                                    402 
                                    403 
                                    404 ;---------------------------------------
                                    405 ; write a byte to FLASH or EEPROM/OPTION  
                                    406 ; EEC!  (c ud -- )
                                    407 ;---------------------------------------
      009CBE 03 50                  408     .word LINK 
                           001D47   409 	LINK=.
      009CC0 5F                     410     .byte 4 
      009CC1 FB 81 9C A6            411     .ascii "EEC!"
                                    412 	; local variables 
                           000001   413 	BTW = 1   ; byte to write offset on stack
                           000002   414     OPT = 2 
                           000002   415 	VSIZE = 2
      001D4C                        416 EECSTORE:
      009CC5 06 55            [ 2]  417 	sub sp,#VSIZE
      009CC7 4E 4C 4F         [ 4]  418     call FPSTOR
      009CCA 43 4B            [ 1]  419 	ld a,(1,x)
      009CCC 43               [ 1]  420 	cpl a 
      009CCC 90 BE            [ 1]  421 	ld (BTW,sp),a ; byte to write 
      009CCE 37 3D            [ 1]  422 	clr (OPT,sp)  ; OPTION flag
      009CD0 36 26 16         [ 4]  423 	call UNLOCK 
                                    424 	; check if option
      009CD3 90 A3            [ 1]  425 	tnz FPTR 
      009CD5 80 00            [ 1]  426 	jrne 2$
      009CD7 24 10 90         [ 2]  427 	ldw y,PTR16 
      009CDA A3 40 00 25      [ 2]  428 	cpw y,#OPTION_BASE
      009CDE 0D 90            [ 1]  429 	jrmi 2$
      009CE0 A3 48 7F 22      [ 2]  430 	cpw y,#OPTION_END+1
      009CE4 07 CD            [ 1]  431 	jrpl 2$
      009CE6 9C 8E            [ 1]  432 	cpl (OPT,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



                                    433 	; OPTION WRITE require this UNLOCK 
      009CE8 81 CD 9C AD      [ 1]  434     bset FLASH_CR2,#FLASH_CR2_OPT
      009CEC 81 9C C5 04      [ 1]  435     bres FLASH_NCR2,#FLASH_CR2_OPT 
      001D78                        436 2$: 
      009CF0 4C 4F 43         [ 4]  437 	call WR_BYTE 	
      009CF3 4B 02            [ 1]  438 	tnz (OPT,sp)
      009CF4 27 0D            [ 1]  439 	jreq 3$ 
      009CF4 72 13            [ 1]  440     ld a,(BTW,sp)
      009CF6 50 5F            [ 1]  441     clrw y
      009CF8 72 17            [ 1]  442 	ld yl,a 
      009CFA 50 5F 81         [ 2]  443 	subw x,#CELLL 
      009CFD 9C               [ 2]  444 	ldw (x),y 
      009CFE EF 08 49         [ 4]  445 	call WR_BYTE
      001D8C                        446 3$: 
      009D01 4E 43 2D         [ 4]  447 	call LOCK 
      009D04 46 50            [ 2]  448 	addw sp,#VSIZE 
      009D06 54               [ 4]  449     ret
                                    450 
                                    451 ;------------------------------
                                    452 ; write integer in FLASH|EEPROM
                                    453 ; EE! ( n ud -- )
                                    454 ;------------------------------
      009D07 52 47                  455 	.word LINK 
                           001D94   456 	LINK=.
      009D08 03                     457 	.byte 3 
      009D08 3C 38 26               458 	.ascii "EE!"
      001D98                        459 EESTORE:
      009D0B 0C 90 89         [ 4]  460 	call FPSTOR 
      009D0E 90 BE 36         [ 4]  461 	call UNLOCK 
      009D11 90 5C            [ 1]  462 	ldw y,x 
      009D13 90 BF            [ 2]  463 	ldw y,(y)
      009D15 36 90            [ 2]  464 	pushw y 
      009D17 85 81            [ 1]  465 	swapw y 
      009D19 9C               [ 2]  466 	ldw (x),y 
      009D1A FF 04 50         [ 4]  467 	call WR_BYTE 
      009D1D 54 52            [ 2]  468 	popw y 
      009D1F 2B 00 02         [ 2]  469 	subw x,#CELLL
      009D20 FF               [ 2]  470 	ldw (x),y 
      009D20 90 93 1C         [ 4]  471 	call WR_BYTE
      009D23 00 02 72         [ 2]  472 	jp LOCK 
                                    473 
                                    474 
                                    475 ;----------------------------
                                    476 ; Erase flash memory row 
                                    477 ; stm8s208 as 128 bytes rows
                                    478 ; ROW-ERASE ( ud -- )
                                    479 ;----------------------------
      009D26 B9 00                  480 	.word LINK 
                           001DB8   481 	LINK=. 
      009D28 37                     482 	.byte 9 
      009D29 90 BF 37 24 02 3C 36   483 	.ascii "ROW-ERASE" 
             81 9D
      001DC2                        484 row_erase:
      009D32 1B 07 45         [ 4]  485 	call FC_XOFF
      009D35 45 2D 52         [ 4]  486 	call FPSTOR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



                                    487 ;code must be execute from RAM 
                                    488 ;copy routine to PAD 
      009D38 45 41 44         [ 2]  489 	subw x,#CELLL 
      009D3B 90 AE 1E 1B      [ 2]  490 	ldw y,#row_erase_proc
      009D3B 1D               [ 2]  491 	ldw (x),y 
      009D3C 00 02 92         [ 4]  492 	call PAD 
      009D3F BC 00 36 90      [ 2]  493 	ldw y,#row_erase_proc_end 
      009D43 95 CD 9D 08      [ 2]  494 	subw y,#row_erase_proc
      009D47 92 BC 00         [ 2]  495 	subw x,#CELLL 
      009D4A 36               [ 2]  496 	ldw (x),y 
      009D4B CD 9D 08         [ 4]  497 	call CMOVE 
      001DE2                        498 block_erase:
      009D4E 90 97 FF         [ 2]  499 	ldw y,FPTR+1
      009D51 81 9D 33 08      [ 2]  500 	cpw y,#app_space 
      009D55 45 45            [ 1]  501 	jrpl erase_flash 
                                    502 ; erase EEPROM block
      009D57 2D 43 52 45      [ 2]  503 	cpw y,#EEPROM_BASE 
      009D5B 41 44            [ 1]  504 	jruge 1$
      009D5D CD 04 4F         [ 4]  505 	call FC_XON
      009D5D 1D               [ 4]  506 	ret ; bad address 
      009D5E 00 02 92 BC      [ 2]  507 1$: cpw y,#EEPROM_END 
      009D62 00 36            [ 2]  508 	jrule 2$ 
      009D64 CD 9D 08         [ 4]  509 	call FC_XON
      009D67 90               [ 4]  510 	ret ; bad address 
      001DFF                        511 2$:	
      009D68 5F 90 97         [ 4]  512 	call UNLKEE 
      009D6B FF 81            [ 2]  513 	jra proceed_erase
                                    514 ; erase flash block:
      001E04                        515 erase_flash:
      009D6D 9D 54 07         [ 4]  516 	call UNLKFL 
      001E07                        517 proceed_erase:
      009D70 57 52 2D         [ 4]  518 	call PAD 
      009D73 42 59            [ 1]  519 	ldw y,x
      009D75 54 45            [ 2]  520 	ldw y,(y)
      009D77 1C 00 02         [ 2]  521 	addw x,#CELLL  
      009D77 CD 84            [ 4]  522 	call (y) 
      009D79 E5 90 93 90      [ 1]  523 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009D7D FE 1C 00         [ 4]  524 	call FC_XON
      009D80 02               [ 4]  525 	ret 
                                    526 
                                    527 ; this routine is to be copied to PAD 
      001E1B                        528 row_erase_proc:
      009D81 90 9F 92 BD      [ 1]  529 	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
      009D85 00 36 72 05      [ 1]  530 	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
      009D89 50               [ 1]  531 	clr a 
      009D8A 5F FB            [ 1]  532 	clrw y 
      009D8C CD 84 CF CC      [ 1]  533 	ldf ([FPTR],y),a
      009D90 9D 08            [ 1]  534     incw y
      009D92 9D 6F 07 57      [ 1]  535 	ldf ([FPTR],y),a
      009D96 52 2D            [ 1]  536     incw y
      009D98 57 4F 52 44      [ 1]  537 	ldf ([FPTR],y),a
      009D9C 90 5C            [ 1]  538     incw y
      009D9C CD 84 E5 90      [ 1]  539 	ldf ([FPTR],y),a
      009DA0 93 90 FE 1C 00   [ 2]  540 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009DA5 02               [ 4]  541 	ret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



      001E42                        542 row_erase_proc_end:
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
      001E42                        555 copy_buffer:
      009DA6 90 9E            [ 1]  556 	push #BLOCK_SIZE  
                                    557 ;enable block programming 
      009DA8 92 BD 00 36      [ 1]  558 	bset FLASH_CR2,#FLASH_CR2_PRG 
      009DAC 72 05 50 5F      [ 1]  559 	bres FLASH_NCR2,#FLASH_CR2_PRG
      009DB0 FB CD            [ 1]  560 	clrw y
      009DB2 9D               [ 1]  561 1$:	ld a,(x)
      009DB3 08 90 9F 92      [ 1]  562 	ldf ([FPTR],y),a
      009DB7 BD               [ 1]  563 	incw x 
      009DB8 00 36            [ 1]  564 	incw y 
      009DBA 72 05            [ 1]  565 	dec (BCNT,sp)
      009DBC 50 5F            [ 1]  566 	jrne 1$
                                    567 ; wait EOP bit 
      009DBE FB CD 84 CF CC   [ 2]  568 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. 
      009DC3 9D               [ 1]  569 	pop a ; remove BCNT from stack 
      009DC4 08               [ 4]  570 	ret 
      001E61                        571 copy_buffer_end:
                                    572 
                                    573 ;-------------------------
                                    574 ; move program_row to RAM 
                                    575 ; in TIB 
                                    576 ;------------------------
      001E61                        577 copy_prog_to_ram:
      009DC5 9D 94 04         [ 2]  578 	subw x,#6
      009DC8 45 45 43 21      [ 2]  579 	ldw y,#copy_buffer 
      009DCC EF 04            [ 2]  580 	ldw (4,x),y 
      009DCC 52 02 CD 9B      [ 2]  581 	ldw y,#TIBBASE
      009DD0 8E E6            [ 2]  582 	ldw (2,x),y 
      009DD2 01 43 6B 01      [ 2]  583 	ldw y,#copy_buffer_end 
      009DD6 0F 02 CD 9C      [ 2]  584 	subw y,#copy_buffer  
      009DDA CC               [ 2]  585 	ldw (x),y 
      009DDB 3D 36 26         [ 4]  586 	call CMOVE 
      009DDE 19               [ 4]  587 	ret 
                                    588 
                                    589 
                                    590 ;-----------------------------
                                    591 ; write a row in FLASH/EEPROM 
                                    592 ; WR-ROW ( a ud -- )
                                    593 ; a -> address 128 byte buffer to write 
                                    594 ; ud ->  row address in FLASH|EEPROM 
                                    595 ;-----------------------------
      009DDF 90 BE                  596 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



                           001E7F   597 	LINK=.
      009DE1 37                     598 	.byte 6 
      009DE2 90 A3 48 00 2B 10      599 	.ascii "WR-ROW"
      001E86                        600 write_row:
      009DE8 90 A3 48         [ 4]  601 	call FC_XOFF
      009DEB 80 2A 0A         [ 4]  602 	call FPSTOR
                                    603 ; align to FLASH block 
      009DEE 03 02            [ 1]  604 	ld a,#0x80 
      009DF0 72 1E            [ 1]  605 	and a,PTR8 
      009DF2 50 5B            [ 1]  606 	ld PTR8,a  
      009DF4 72 1F 50         [ 4]  607 	call copy_prog_to_ram
      009DF7 5C 1C 4C         [ 4]  608 	call UNLOCK
      009DF8 90 93            [ 1]  609 	ldw y,x 
      009DF8 CD 9D            [ 2]  610 	ldw y,(y)
      009DFA 77 0D 02         [ 2]  611 	addw x,#CELLL 
      009DFD 27               [ 2]  612 	pushw x 
      009DFE 0D               [ 1]  613 	ldw x,y ; buffer address in x 
      009DFF 7B 01 90         [ 4]  614 	call TIBBASE
      009E02 5F 90 97         [ 4]  615 	call LOCK
      009E05 1D               [ 2]  616 	popw x 
      009E06 00 02 FF         [ 4]  617 	call FC_XON 
      009E09 CD               [ 4]  618 	ret 
                                    619 
                                    620 ;-------------------------------------
                                    621 ; change value of OPTION register 
                                    622 ; SET-OPT (c n -- ) 
                                    623 ; c new value.
                                    624 ; n OPT  number {1..7}
                                    625 ;--------------------------------------
      009E0A 9D 77                  626 		.word LINK 
                           001EAE   627 		LINK=.
      009E0C 07                     628 		.byte 7 
      009E0C CD 9C F4 5B 02 81 9D   629 		.ascii "SET-OPT" 
      001EB6                        630 set_option: 
      009E13 C7 03            [ 1]  631 		ldw y,x 
      009E15 45 45            [ 2]  632 		ldw y,(y)
      009E17 21 06            [ 1]  633 		jreq 1$
      009E18 90 A3 00 07      [ 2]  634 		cpw y,#7 
      009E18 CD 9B            [ 2]  635 		jrule 2$ 
                                    636 ; invalid OPTION number 		
      009E1A 8E CD 9C         [ 2]  637 1$:		addw x,#2*CELLL
      009E1D CC               [ 4]  638 		ret
      009E1E 90 93            [ 2]  639 2$:		sllw y 
      009E20 90 FE 90 89      [ 2]  640 		addw y,#OPTION_BASE-1
      009E24 90               [ 2]  641 		ldw (x),y 
      009E25 5E FF CD         [ 2]  642 		subw x,#CELLL 
      009E28 9D 77            [ 1]  643 		clrw y 
      009E2A 90               [ 2]  644 		ldw (x),y 
      009E2B 85 1D 00         [ 4]  645 		call EECSTORE
      009E2E 02               [ 4]  646 		ret 
                                    647 
                                    648 
                                    649 
                                    650 ;--------------------------------------
                                    651 ; reset system to its original state 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



                                    652 ; before any user modification
                                    653 ; PRISTINE ( -- )
                                    654 ;-------------------------------------
      009E2F FF CD                  655 	.word LINK  
                           001ED9   656 	LINK=.
      009E31 9D                     657 	.byte 8 
      009E32 77 CC 9C F4 9E 14 09   658 	.ascii "PRISTINE"
             52
      001EE2                        659 pristine:
                                    660 ;;; erase EEPROM
      009E3A 4F 57 2D         [ 4]  661 	call EEPROM 
      009E3D 45 52 41         [ 4]  662 1$:	call DDUP 
      009E40 53 45 C2         [ 4]  663 	call row_erase
      009E42 90 93            [ 1]  664 	ldw y,x 
      009E42 CD 84 E5         [ 2]  665 	ldw y,(2,y)
      009E45 CD 9B 8E 1D      [ 2]  666 	addw y,#BLOCK_SIZE
      009E49 00 02            [ 2]  667 	ldw (2,x),y
      009E4B 90 AE 9E 9B      [ 2]  668 	cpw y,#OPTION_BASE 
      009E4F FF CD            [ 1]  669 	jrult 1$
                                    670 ;;; reset OPTION to default values
      009E51 8C 64 90 AE      [ 2]  671 	ldw y,#1 ; OPT1 
      009E55 9E               [ 2]  672 2$:	ldw (x),y   
      009E56 C2 72            [ 1]  673 	clrw y 
      009E58 A2 9E            [ 2]  674 	ldw (2,x),y  ; ( 0 1 -- ) 
      009E5A 9B 1D 00         [ 4]  675 	call DDUP    ; ( 0 1 0 1 -- )  
      009E5D 02 FF CD         [ 4]  676 	call set_option
      009E60 8C A0            [ 1]  677 	ldw y,x 
      009E62 90 FE            [ 2]  678 	ldw y,(y)
      009E62 90 BE            [ 1]  679 	incw y  ; next OPTION 
      009E64 37 90 A3 A8      [ 2]  680 	cpw y,#8 
      009E68 00 2A            [ 1]  681 	jrult 2$
                                    682 ;;; erase first row of app_space 	
      009E6A 19 90 A3 40      [ 2]  683 	ldw y,#app_space
      009E6E 00 24            [ 2]  684 	ldw (2,x),y  
      009E70 04 CD            [ 1]  685 	clrw y 
      009E72 84               [ 2]  686 	ldw (x),y ; ( app_space 0 -- )
      009E73 CF 81 90         [ 4]  687 	call row_erase 
                                    688 ; reset interrupt vectors 
      009E76 A3 47 FF         [ 2]  689 	subw x,#CELLL 
      009E79 23 04            [ 1]  690 	clrw y  
      009E7B CD               [ 2]  691 4$:	ldw (x),y  ; ( n -- ) int# 
      009E7C 84 CF 81         [ 4]  692 	call DUPP  
      009E7F CD 1F 49         [ 4]  693 	call reset_vector
      009E7F CD 9C            [ 1]  694 	ldw y,x 
      009E81 8E 20            [ 2]  695 	ldw y,(y)
      009E83 03 5C            [ 1]  696 	incw y   ; next vector 
      009E84 90 A3 00 19      [ 2]  697 	cpw y,#25 
      009E84 CD 9C            [ 1]  698 	jrult 4$
      009E86 AD 00 00         [ 2]  699 	jp NonHandledInterrupt ; reset MCU
                                    700 
                                    701 ;------------------------------
                                    702 ; reset an interrupt vector 
                                    703 ; to its initial value 
                                    704 ; i.e. NonHandledInterrupt
                                    705 ; RST-IVEC ( n -- )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



                                    706 ;-----------------------------
      009E87 1E D9                  707 	.word LINK 
                           001F40   708 	LINK=. 
      009E87 CD                     709 	.byte 8 
      009E88 8C 64 90 93 90 FE 1C   710 	.ascii "RST-IVEC"
             00
      001F49                        711 reset_vector:
      009E90 02 90            [ 1]  712 	ldw y,x
      009E92 FD 72 17         [ 2]  713 	addw x,#CELLL 
      009E95 50 5F            [ 2]  714 	ldw y,(y)
      009E97 CD 84 CF 81      [ 2]  715 	cpw y,#23 
      009E9B 27 3A            [ 1]  716 	jreq 9$
      009E9B 35 20 50 5B      [ 2]  717 	cpw y,#29 ; last vector
      009E9F 35 DF            [ 1]  718 	jrugt 9$  
      009EA1 50 5C            [ 2]  719 	sllw y 
      009EA3 4F 90            [ 2]  720 	sllw y 
      009EA5 5F 91 A7 00      [ 2]  721 	addw y,#0x8008 ; irq0 address 
      009EA9 36 90 5C         [ 2]  722 	ldw YTEMP,y
      009EAC 91 A7 00         [ 2]  723 	subw x,#3*CELLL 
      009EAF 36 90            [ 2]  724 	ldw (2,x),y 
      009EB1 5C 91            [ 1]  725 	clrw y
      009EB3 A7               [ 2]  726 	ldw (x),y 
      009EB4 00 36            [ 1]  727 	ld a,#0x82 
      009EB6 90 5C            [ 1]  728 	ld yh,a
      009EB8 91 A7            [ 2]  729 	ldw (4,x),y
      009EBA 00 36 72         [ 4]  730 	call EESTORE
      009EBD 05 50 5F         [ 2]  731 	subw x,#3*CELLL
      009EC0 FB 81            [ 1]  732 	clrw y 
      009EC2 FF               [ 2]  733 	ldw (x),y 
      009EC2 90 AE 00 00      [ 2]  734 	ldw y,#NonHandledInterrupt
      009EC2 4B 80            [ 2]  735 	ldw (4,x),y 
      009EC4 72 10 50         [ 2]  736 	ldw y,YTEMP  
      009EC7 5B 72 11 50      [ 2]  737 	addw y,#2
      009ECB 5C 90            [ 2]  738 	ldw (2,x),y 
      009ECD 5F F6 91         [ 4]  739 	call EESTORE
      009ED0 A7               [ 4]  740 9$:	ret 
                                    741 
                                    742 
                                    743 ;------------------------------
                                    744 ; all interrupt vector with 
                                    745 ; an address >= a are resetted 
                                    746 ; to default
                                    747 ; CHKIVEC ( a -- )
                                    748 ;------------------------------
      009ED1 00 36                  749 	.word LINK 
                           001F93   750 	LINK=.
      009ED3 5C                     751 	.byte 7
      009ED4 90 5C 0A 01 26 F4 72   752 	.ascii "CHKIVEC"
                                    753 ;local variables 
                           000001   754 	SSP=1
                           000003   755 	CADR=3
                           000005   756 	OFS=5
                           000006   757 	VSIZE=6  
      001F9B                        758 CHKIVEC:
      009EDB 05 50            [ 2]  759 	sub sp,#VSIZE ;alloc local variables 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



      009EDD 5F FB            [ 1]  760 	ldw y,x 
      009EDF 84 81            [ 2]  761 	ldw y,(y)
      009EE1 17 03            [ 2]  762 	ldw (CADR,sp),y ; ca 
      009EE1 1F 01            [ 2]  763 	ldw (SSP,sp),x 
      009EE1 1D 00 06         [ 2]  764 	ldw x,#0x800a ; irq0 address 
      009EE4 90 AE            [ 2]  765 	ldw PTR16,X
      009EE6 9E C2 EF         [ 2]  766 	ldw x,#-4 
      009EE9 04 90 AE         [ 2]  767 1$:	addw x,#4
      009EEC 17 00 EF         [ 2]  768 	cpw x,#30*4 ; irq0-29 
      009EEF 02 90            [ 1]  769 	jreq 9$
      009EF1 AE 9E            [ 1]  770 	ldw y,x  
      009EF3 E1 72 A2         [ 4]  771 	ld a,([PTR16],y)
      009EF6 9E C2            [ 1]  772 	cp a,(CADR,sp)
      009EF8 FF CD            [ 1]  773 	jrult 1$
      009EFA 8C A0            [ 1]  774 	incw y 
      009EFC 81 9E 38         [ 4]  775 	ld a,([PTR16],y)
      009EFF 06 57            [ 1]  776 	cp a,(CADR+1,sp) 
      009F01 52 2D            [ 1]  777 	jrult 1$ 
      009F03 52 4F            [ 2]  778 	ldw (OFS,sp),x 
      009F05 57               [ 2]  779 	srlw x
      009F06 54               [ 2]  780 	srlw x 
      009F06 CD 84            [ 1]  781 	ldw y,x 
      009F08 E5 CD            [ 2]  782 	ldw x,(SSP,sp)
      009F0A 9B               [ 2]  783 	ldw (x),y
      009F0B 8E A6 80         [ 4]  784 	call reset_vector
      009F0E B4 38            [ 2]  785 	ldw x,(OFS,sp) 
      009F10 B7 38            [ 2]  786 	jra 1$
      009F12 CD 9E            [ 2]  787 9$:	ldw x,(SSP,sp) 
      009F14 E1 CD 9C         [ 2]  788 	addw x,#CELLL 
      009F17 CC 90            [ 2]  789 	addw sp,#VSIZE ; drop local variables  
      009F19 93               [ 4]  790 	ret 
                                    791 
                                    792 ;------------------------------
                                    793 ; set interrupt vector 
                                    794 ; SET-IVEC ( ud n -- )
                                    795 ;  ud Handler address
                                    796 ;  n  vector # 0 .. 29 
                                    797 ;-----------------------------
      009F1A 90 FE                  798 	.word LINK
                           001FE1   799 	LINK=.
      009F1C 1C                     800 	.byte 8 
      009F1D 00 02 89 93 CD 17 00   801 	.ascii "SET-IVEC" 
             CD
      001FEA                        802 set_vector:
      009F25 9C F4            [ 1]  803     ldw y,x 
      009F27 85 CD 84         [ 2]  804 	addw x,#CELLL 
      009F2A CF 81            [ 2]  805 	ldw y,(y) ; vector #
      009F2C 9E FF 07 53      [ 2]  806 	cpw y,#29 ; last vector
      009F30 45 54            [ 2]  807 	jrule 2$
      009F32 2D 4F 50         [ 2]  808 	addw x,#2*CELLL 
      009F35 54               [ 4]  809 	ret
      009F36 90 58            [ 2]  810 2$:	sllw y 
      009F36 90 93            [ 2]  811 	sllw y 
      009F38 90 FE 27 06      [ 2]  812 	addw y,#0X8008 ; IRQ0 vector address 
      009F3C 90 A3 00         [ 2]  813 	ldw YTEMP,y ; vector address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



      009F3F 07 23            [ 1]  814 	ld a,#0x82 
      009F41 04 1C            [ 1]  815 	ld yh,a 
      009F43 00 04            [ 1]  816 	ld a,(1,x) ; isr address bits 23..16 
      009F45 81 90            [ 1]  817 	ld yl,a 
                                    818 ;  write 0x82 + most significant byte of int address	
      009F47 58 72 A9         [ 2]  819 	subw x,#3*CELLL 
      009F4A 47 FF            [ 2]  820 	ldw (4,x),y 
      009F4C FF 1D 00         [ 2]  821 	ldw y,YTEMP
      009F4F 02 90            [ 2]  822 	ldw (2,x),y ; vector address 
      009F51 5F FF            [ 1]  823 	clrw y 
      009F53 CD               [ 2]  824 	ldw (x),y   ; as a double 
      009F54 9D CC 81         [ 4]  825 	call EESTORE 
      009F57 9F 2E            [ 1]  826 	ldw y,x 
      009F59 08 50 52         [ 2]  827 	ldw y,(2,y) ; bits 15..0 int vector 
      009F5C 49 53 54         [ 2]  828 	subw x,#3*CELLL 
      009F5F 49 4E            [ 2]  829 	ldw (4,x),y 
      009F61 45 BE 28         [ 2]  830 	ldw y,YTEMP 
      009F62 72 A9 00 02      [ 2]  831 	addw y,#2 
      009F62 CD 9B            [ 2]  832 	ldw (2,x),y 
      009F64 AD CD            [ 1]  833 	clrw y 
      009F66 88               [ 2]  834 	ldw (x),y 
      009F67 04 CD 9E         [ 4]  835 	call EESTORE
      009F6A 42 90 93         [ 2]  836 	addw x,#2*CELLL  
      009F6D 90               [ 4]  837 9$: ret 
                                    838 
                                    839 
                                    840 ;------------------------
                                    841 ; Compile word to flash
                                    842 ; EE, (w -- )
                                    843 ;-----------------------
      009F6E EE 02                  844 	.word LINK
                           00203D   845 	LINK=.
      009F70 72                     846 	.byte 3
      009F71 A9 00 80               847 	.ascii "EE,"
      002041                        848 EE_COMMA:
      009F74 EF 02 90         [ 2]  849 	subw x,#2*CELLL 
      009F77 A3 48 00         [ 2]  850 	ldw y,UCP
      009F7A 25 E9            [ 2]  851 	pushw y 
      009F7C 90 AE            [ 2]  852 	ldw (2,x),y 
      009F7E 00 01            [ 1]  853 	clrw y 
      009F80 FF               [ 2]  854 	ldw (x),y
      009F81 90 5F EF         [ 4]  855 	call EESTORE
      009F84 02 CD            [ 2]  856 	popw y 
      009F86 88 04 CD 9F      [ 2]  857 	addw y,#2
      009F8A 36 90 93         [ 2]  858 	ldw UCP,y
      009F8D 90               [ 4]  859 	ret 
                                    860 
                                    861 
                                    862 ;-------------------------
                                    863 ; Compile byte to flash 
                                    864 ; EEC, ( c -- )	
                                    865 ;-------------------------
      009F8E FE 90                  866 	.word LINK 
                           00205D   867 	LINK=.
      009F90 5C                     868 	.byte 4 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



      009F91 90 A3 00 08            869 	.ascii "EEC,"
      002062                        870 EE_CCOMMA:
      009F95 25 E9 90         [ 2]  871 	subw x,#2*CELLL 
      009F98 AE A8 00         [ 2]  872 	ldw y,UCP
      009F9B EF 02            [ 2]  873 	pushw y 
      009F9D 90 5F            [ 2]  874 	ldw (2,x),y 
      009F9F FF CD            [ 1]  875 	clrw y 
      009FA1 9E               [ 2]  876 	ldw (x),y
      009FA2 42 1D 00         [ 4]  877 	call EECSTORE
      009FA5 02 90            [ 2]  878 	popw y 
      009FA7 5F FF            [ 1]  879 	incw y 
      009FA9 CD 86 1E         [ 2]  880 	ldw UCP,y
      009FAC CD               [ 4]  881 	ret 
                                    882 
                                    883 
                                    884 ;--------------------------
                                    885 ; copy FLASH block to ROWBUF
                                    886 ; ROW>BUF ( ud -- )
                                    887 ;--------------------------
      009FAD 9F C9                  888 	.word LINK 
                           00207C   889 	LINK=.
      009FAF 90                     890 	.byte 7 
      009FB0 93 90 FE 90 5C 90 A3   891 	.ascii "ROW>BUF"
      002084                        892 ROW2BUF: 
      009FB7 00 19 25         [ 4]  893 	call FPSTOR 
      009FBA ED CC            [ 1]  894 	ld a,#BLOCK_SIZE
      009FBC 80               [ 1]  895 	push a 
      009FBD 80 9F            [ 1]  896 	and a,PTR8 ; block align 
      009FBF 59 08            [ 1]  897 	ld PTR8,a
      009FC1 52 53 54 2D      [ 2]  898 	ldw y,#ROWBUFF 
      009FC5 49 56 45 43      [ 5]  899 1$: ldf a,[FPTR]
      009FC9 90 F7            [ 1]  900 	ld (y),a
      009FC9 90 93 1C         [ 4]  901 	call INC_FPTR
      009FCC 00 02            [ 1]  902 	incw y 
      009FCE 90 FE            [ 1]  903 	dec (1,sp)
      009FD0 90 A3            [ 1]  904 	jrne 1$ 
      009FD2 00               [ 1]  905 	pop a 
      009FD3 17               [ 4]  906 	ret 
                                    907 
                                    908 
                                    909 ;---------------------------
                                    910 ; copy ROWBUFF to flash 
                                    911 ; BUF>ROW ( ud -- )
                                    912 ; ud is row address as double 
                                    913 ;---------------------------
      009FD4 27 3A                  914 	.word LINK 
                           0020A5   915 	LINK=.
      009FD6 90                     916 	.byte 7 
      009FD7 A3 00 1D 22 34 90 58   917 	.ascii "BUF>ROW" 
      0020AD                        918 BUF2ROW:
      009FDE 90 58 72         [ 4]  919 	call TBUF ; ( ud rb -- )
      009FE1 A9 80 08         [ 4]  920 	call ROT 
      009FE4 90 BF 28         [ 4]  921 	call ROT  ; ( rb ud -- )
      009FE7 1D 00 06         [ 4]  922 	call write_row 
      009FEA EF               [ 4]  923 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



                                    924 
                                    925 ;---------------------------------
                                    926 ; how many byte free in that row 
                                    927 ; RFREE ( a -- n )
                                    928 ; a is least byte of target address
                                    929 ;----------------------------------
      009FEB 02 90                  930 	.word LINK 
                           0020BC   931 	LINK=.
      009FED 5F                     932 	.byte 5 
      009FEE FF A6 82 90 95         933 	.ascii "RFREE"
      0020C2                        934 RFREE:
      009FF3 EF 04            [ 1]  935 	ld a,(1,x)
      009FF5 CD 9E            [ 1]  936 	and a,#BLOCK_SIZE-1 
      009FF7 18 1D            [ 1]  937 	ld YTEMP,a 
      009FF9 00 06            [ 1]  938 	ld a,#BLOCK_SIZE 
      009FFB 90 5F            [ 1]  939 	sub a,YTEMP 
      009FFD FF 90            [ 1]  940 	clrw y 
      009FFF AE 80            [ 1]  941 	ld yl,a
      00A001 80               [ 2]  942 	ldw (x),y 
      00A002 EF               [ 4]  943 	ret 
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
      00A003 04 90                  954 	.word LINK 
                           0020D4   955 	LINK=. 
      00A005 BE                     956 	.byte 6
      00A006 28 72 A9 00 02 EF      957 	.ascii "RAM>EE"
                                    958 	
      0020DB                        959 RAM2EE:
                                    960 ; copy ud on top 
      00A00C 02 CD            [ 1]  961 	ldw y,x 
      00A00E 9E 18 81         [ 2]  962 	ldw y,(6,y) ; LSW of ud  
      00A011 9F C0 07         [ 2]  963 	ldw YTEMP,y 
      00A014 43 48            [ 1]  964 	ldw y,x 
      00A016 4B 49 56         [ 2]  965 	ldw y,(4,y)  ; MSW of ud 
      00A019 45 43 04         [ 2]  966 	subw x,#2*CELLL 
      00A01B FF               [ 2]  967 	ldw (x),y 
      00A01B 52 06 90         [ 2]  968 	ldw y,YTEMP 
      00A01E 93 90            [ 2]  969 	ldw (2,x),y 
      00A020 FE 17 03         [ 4]  970 	call ROW2BUF 
      00A023 1F 01            [ 1]  971 	ldw y,x 
      00A025 AE 80 0A         [ 2]  972 	ldw y,(6,y)
      00A028 BF 37            [ 2]  973 	pushw y ; udl 
      00A02A AE FF            [ 1]  974 	ld a,yl
      00A02C FC 1C            [ 1]  975 	and a,#BLOCK_SIZE-1 
      00A02E 00 04            [ 1]  976 	clrw y 
      00A030 A3 00            [ 1]  977 	ld yl,a 
      00A032 78 27 22 90      [ 2]  978 	addw y,#ROWBUFF 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      00A036 93 91 D6         [ 2]  979 	subw x,#CELLL 
      00A039 37               [ 2]  980 	ldw (x),y  
      00A03A 11 03 25         [ 4]  981 	call SWAPP ;  ( ud a ra u -- )
      00A03D EF 90 5C         [ 4]  982 	call RFROM  
      00A040 91 D6 37         [ 4]  983 	call RFREE 
      00A043 11 04 25         [ 4]  984 	call MIN
      00A046 E6 1F 05         [ 4]  985 	call DUPP 
      00A049 54 54 90         [ 4]  986 	call TOR  
      00A04C 93 1E 01         [ 4]  987 	call CMOVE
      00A04F FF CD 9F         [ 4]  988 	call BUF2ROW 
      00A052 C9 1E 05         [ 4]  989 	call RFROM 
      00A055 20               [ 4]  990 	ret 
                                    991 
                                    992 
                                    993 ;--------------------------
                                    994 ; expand 16 bit address 
                                    995 ; to 32 bit address 
                                    996 ; FADDR ( a -- ud )
                                    997 ;--------------------------
      00A056 D6 1E                  998 	.word LINK 
                           002129   999 	LINK=. 
      00A058 01                    1000 	.byte 5 
      00A059 1C 00 02 5B 06        1001 	.ascii "FADDR"
      00212F                       1002 FADDR:
      00A05E 81 A0 13         [ 2] 1003 	jp ZERO 
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
      00A061 08 53                 1019 	.word LINK 
                           002134  1020 	LINK=.
      00A063 45                    1021 	.byte 5 
      00A064 54 2D 49 56 45        1022 	.ascii "FMOVE" 
      00213A                       1023 FMOVE:
      00A069 43 06 AB         [ 4] 1024 	call TFLASH 
      00A06A CD 04 F7         [ 4] 1025 	CALL AT 
      00A06A 90 93 1C         [ 4] 1026 	CALL QBRAN 
      00A06D 00 02                 1027 	.word no_move  
      00A06F 90 FE 90         [ 4] 1028 	call CPP
      00A072 A3 00 1D         [ 4] 1029 	call AT  
      00A075 23 04 1C         [ 4] 1030 	call DUPP ; ( udl udl -- )
      00A078 00 04 81         [ 4] 1031 	call CNTXT 
      00A07B 90 58 90         [ 4] 1032 	call AT 
      00A07E 58 72 A9         [ 4] 1033 	call DOLIT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



      00A081 80 08                 1034 	.word 2 
      00A083 90 BF 28         [ 4] 1035 	call SUBB ; ( udl udl a -- )
      00A086 A6 82 90         [ 4] 1036 	call SWAPP 
      00A089 95 E6 01         [ 4] 1037 	call FADDR 
      00A08C 90 97 1D         [ 4] 1038 	call ROT  ; ( udl ud a -- )
      00A08F 00 06 EF         [ 4] 1039 	call DUPP 
      00A092 04 90 BE         [ 4] 1040 	call TOR    ; R: a 
      00216B                       1041 FMOVE2: 
      00A095 28 EF 02         [ 4] 1042 	call HERE 
      00A098 90 5F FF         [ 4] 1043 	call RAT 
      00A09B CD 9E 18         [ 4] 1044 	call SUBB ; (udl ud a wl -- )
      002174                       1045 next_row:
      00A09E 90 93 90         [ 4] 1046 	call DUPP 
      00A0A1 EE 02 1D         [ 4] 1047 	call TOR  ; ( udl ud a wl -- ) R: a wl
      00A0A4 00 06 EF         [ 4] 1048 	call RAM2EE ; ( udl a u -- udl u2 ) u2 is byte written to FLASH 
      00A0A7 04 90 BE         [ 4] 1049 	call DUPP 
      00A0AA 28 72 A9         [ 4] 1050 	call TOR
      00A0AD 00 02 EF         [ 4] 1051 	call PLUS  ; ( udl+ ) 
      00A0B0 02 90 5F         [ 4] 1052 	call DUPP 
      00A0B3 FF CD 9E         [ 4] 1053 	call ZERO   ; ( udl+ ud -- )
      00A0B6 18 1C 00         [ 4] 1054 	call RFROM  ; ( udl+ ud u2  R: a wl ) 
      00A0B9 04 81 A0         [ 4] 1055 	call RFROM  ; ( udl+ ud u2 wl R: a ) 
      00A0BC 61 03 45         [ 4] 1056 	call OVER   ; ( udl+ ud u2 wl u2 -- )
      00A0BF 45 2C 12         [ 4] 1057 	call SUBB  ; ( udl+ ud u2 wl- R: a )
      00A0C1 CD 05 9E         [ 4] 1058 	call DUPP 
      00A0C1 1D 00 04         [ 4] 1059 	call QBRAN
      00A0C4 90 BE                 1060 	.word fmove_done 
      00A0C6 1C 90 89         [ 4] 1061 	call SWAPP  ; ( udl+ ud wl- u2 R: a )
      00A0C9 EF 02 90         [ 4] 1062 	call RFROM ; ( udl+ ud wl- u2 a -- ) 
      00A0CC 5F FF CD         [ 4] 1063 	call PLUS  ; ( udl+2 ud wl- a+ )
      00A0CF 9E 18 90         [ 4] 1064 	call DUPP 
      00A0D2 85 72 A9         [ 4] 1065 	call TOR   ; ( udl+2 ud wl- a+ ) R: a+
      00A0D5 00 02 90         [ 4] 1066 	call SWAPP 
      00A0D8 BF 1C 81         [ 4] 1067 	call BRAN
      00A0DB A0 BD                 1068 	.word next_row  
      0021B7                       1069 fmove_done:	
      00A0DD 04 45 45         [ 4] 1070 	call RFROM  ; ( -- udl+ ud u2 wl- a  )
      00A0E0 43 2C 0A         [ 2] 1071 	addw x,#5*CELLL ; (  -- cp+ ) new CP 
      00A0E2 81               [ 4] 1072  	ret  
      0021BE                       1073 no_move:
      00A0E2 1D 00 04         [ 4] 1074 	call ZERO
      00A0E5 90               [ 4] 1075 	ret 
                                   1076 
                                   1077 ;------------------------------------------
                                   1078 ; adjust pointers after **FMOVE** operetion.
                                   1079 ; UPDAT-PTR ( cp+ -- )
                                   1080 ; cp+ is new CP position after FMOVE 
                                   1081 ;-------------------------------------------
      00A0E6 BE 1C                 1082 	.word LINK 
                           0021C4  1083 	LINK=.
      00A0E8 90                    1084 	.byte 9
      00A0E9 89 EF 02 90 5F FF CD  1085 	.ascii "UPDAT-PTR" 
             9D CC
      0021CE                       1086 UPDATPTR:
                                   1087 ;reset VP to previous position  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



      00A0F2 90 85 90         [ 4] 1088 	call EEPVP 
      00A0F5 5C 90 BF         [ 4] 1089 	call DROP 
      00A0F8 1C 81 A0         [ 4] 1090 	call AT
      00A0FB DD 07 52         [ 4] 1091 	call VPP 
      00A0FE 4F 57 3E         [ 4] 1092 	call STORE
                                   1093 ;update CONTEXT and LAST 
      00A101 42 55 46         [ 4] 1094 	call EEPCP 
      00A104 CD 05 94         [ 4] 1095 	call DROP
      00A104 CD 9B 8E         [ 4] 1096 	call AT
      00A107 A6 80 88         [ 4] 1097 	call DOLIT 
      00A10A B4 38                 1098 	.word 2 
      00A10C B7 38 90         [ 4] 1099 	call PLUS 
      00A10F AE 16 80         [ 4] 1100 	call DUPP 
      00A112 92 BC 00         [ 4] 1101 	call CNTXT 
      00A115 36 90 F7         [ 4] 1102 	call STORE
      00A118 CD 9D 08         [ 4] 1103 	call LAST
      00A11B 90 5C 0A         [ 4] 1104 	call STORE 
      00A11E 01 26 F1         [ 4] 1105 	call UPDATLAST 
                                   1106 ;update CP 
      00A121 84 81 A0         [ 4] 1107 	call CPP 
      00A124 FC 07 42         [ 4] 1108 	call STORE
      00A127 55 46 3E         [ 4] 1109 	call UPDATCP 
      00A12A 52               [ 4] 1110 	ret 
                                   1111 
                                   1112 ;-----------------------------
                                   1113 ; move interrupt sub-routine
                                   1114 ; in flash memory
                                   1115 ;----------------------------- 
      00A12B 4F 57                 1116 	.word LINK 
                           00220C  1117 	LINK=. 
      00A12D 06                    1118 	.byte 6
      00A12D CD 87 19 CD 87 D9     1119 	.ascii "IFMOVE" 
      002213                       1120 IFMOVE:
      00A133 CD 87 D9         [ 4] 1121 	call TFLASH 
      00A136 CD 9F 06         [ 4] 1122 	CALL AT 
      00A139 81 A1 25         [ 4] 1123 	CALL QBRAN 
      00A13C 05 52                 1124 	.word no_move 
      00A13E 46 52 45         [ 4] 1125 	call CPP 
      00A141 45 04 F7         [ 4] 1126 	call AT 
      00A142 CD 05 9E         [ 4] 1127 	call DUPP ; ( udl udl -- )
      00A142 E6 01 A4         [ 4] 1128 	call EEPVP 
      00A145 7F B7 28         [ 4] 1129 	call DROP
      00A148 A6 80 B0         [ 4] 1130 	call AT  ; ( udl udl a )
      00A14B 28 90 5F         [ 4] 1131 	call TOR 
      00A14E 90 97 FF         [ 4] 1132 	call FADDR
      00A151 81 A1 3C         [ 4] 1133 	call RAT ; ( udl ud a -- ) R: a 
      00A154 06 52 41         [ 2] 1134 	jp FMOVE2 
                                   1135 
                                   1136 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



                           000001  4655 .if WANT_SCALING_CONST 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



                                   4656         .include "const_ratio.asm"
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
      00A157 4D 3E                   31         .word LINK 
                           00223E    32         LINK=.
      00A159 45                      33         .byte 2
      00A15A 45 49                   34         .ascii "PI" 
      00A15B                         35 PII:
      00A15B 90 93 90         [ 2]   36         subw x,#2*CELLL 
      00A15E EE 06 90 BF      [ 2]   37         ldw y,#355 
      00A162 28 90            [ 2]   38         ldw (2,x),y 
      00A164 93 90 EE 04      [ 2]   39         ldw y,#113 
      00A168 1D               [ 2]   40         ldw (x),y 
      00A169 00               [ 4]   41         ret 
                                     42 
                                     43 ;      SQRT2 ( -- 19601  13860 )
                                     44 ; precision: 1.5e-9 
                                     45 ; usage example to compute Voltage peek to peek from Vrms 
                                     46 ; : VPP SQRT2 */ 2 * ;
                                     47 ;
      00A16A 04 FF                   48         .word LINK 
                           002252    49         LINK=.
      00A16C 90                      50         .byte 5 
      00A16D BE 28 EF 02 CD          51         .ascii "SQRT2" 
      002258                         52 SQRT2:
      00A172 A1 04 90         [ 2]   53         subw x,#2*CELLL 
      00A175 93 90 EE 06      [ 2]   54         ldw y,#19601 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



      00A179 90 89            [ 2]   55         ldw (2,x),y 
      00A17B 90 9F A4 7F      [ 2]   56         ldw y,#13860 
      00A17F 90               [ 2]   57         ldw (x),y 
      00A180 5F               [ 4]   58         ret 
                                     59 
                                     60 ;   SQRT3 ( -- 18817 10864 )
                                     61 ; precision: 1.1e-9
                                     62 ;
      00A181 90 97                   63         .word LINK 
                           002269    64         LINK=.
      00A183 72                      65         .byte 5
      00A184 A9 16 80 1D 00          66         .ascii "SQRT3" 
      00226F                         67 SQRT3: 
      00A189 02 FF CD         [ 2]   68     subw x,#2*CELLL 
      00A18C 86 2E CD 85      [ 2]   69     ldw y,#18817 
      00A190 C8 CD            [ 2]   70     ldw (2,x),y 
      00A192 A1 42 CD 89      [ 2]   71     ldw y,#10864 
      00A196 34               [ 2]   72     ldw (x),y 
      00A197 CD               [ 4]   73     ret 
                                     74 
                                     75 ;   E ( -- 28667 10546 )
                                     76 ; precision: 5.5e-9 
                                     77 ; natural log base 
      00A198 86 1E                   78         .word LINK 
                           002280    79         LINK=.
      00A19A CD                      80         .byte 1
      00A19B 85                      81         .ascii "E" 
      002282                         82 ENEPER:
      00A19C E7 CD 8C         [ 2]   83     subw x,#2*CELLL 
      00A19F A0 CD A1 2D      [ 2]   84     ldw y,#28667 
      00A1A3 CD 85            [ 2]   85     ldw (2,x),y 
      00A1A5 C8 81 A1 54      [ 2]   86     ldw y,#10546 
      00A1A9 05               [ 2]   87     ldw (x),y 
      00A1AA 46               [ 4]   88     ret 
                                     89 
                                     90 ;   SQRT10 ( -- 22936 7253 )
                                     91 ; precision: 5.7e-9 
      00A1AB 41 44                   92         .word LINK 
                           002293    93         LINK=.
      00A1AD 44                      94         .byte 6 
      00A1AE 52 51 52 54 31 30       95         .ascii "SQRT10" 
      00A1AF                         96 SQRT10:
      00A1AF CC 8B 65         [ 2]   97     subw x,#2*CELLL
      00A1B2 A1 A9 05 46      [ 2]   98     ldw y,#22936 
      00A1B6 4D 4F            [ 2]   99     ldw (2,x),y 
      00A1B8 56 45 1C 55      [ 2]  100     ldw y,#7253
      00A1BA FF               [ 2]  101     ldw (x),y 
      00A1BA CD               [ 4]  102     ret 
                                    103 
                                    104 ;   12RT2 ( -- 26797 25293 )
                                    105 ; precision: 1.0e-9 
                                    106 ; used in music to compute well tempered scale
      00A1BB 87 2B                  107         .word LINK 
                           0022AB   108         LINK=. 
      00A1BD CD                     109         .byte 5 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



      00A1BE 85 77 CD 85 2C         110         .ascii "12RT2"
      0022B1                        111 RT12_2:
      00A1C3 A2 3E CD         [ 2]  112     subw x,#2*CELLL 
      00A1C6 87 7A CD 85      [ 2]  113     ldw y,#26797
      00A1CA 77 CD            [ 2]  114     ldw (2,x),y 
      00A1CC 86 1E CD 87      [ 2]  115     ldw y,#25293
      00A1D0 5E               [ 2]  116     ldw (x),y 
      00A1D1 CD               [ 4]  117     ret 
                                    118 
                                    119 ;   LOG2s ( -- 2040 11103 )
                                    120 ; log(2)/1.6384
                                    121 ; precision: 1.1e-8
      00A1D2 85 77                  122         .word LINK 
                           0022C2   123         LINK=.
      00A1D4 CD                     124         .byte 5 
      00A1D5 84 F9 00 02 CD         125         .ascii "LOG2S" 
      0022C8                        126 LOG2S:
      00A1DA 88 92 CD         [ 2]  127     subw x,#2*CELLL
      00A1DD 86 2E CD A1      [ 2]  128     ldw y,#2040 
      00A1E1 AF CD            [ 2]  129     ldw (2,x),y 
      00A1E3 87 D9 CD 86      [ 2]  130     ldw y,#11103 
      00A1E7 1E               [ 2]  131     ldw (x),y 
      00A1E8 CD               [ 4]  132     ret 
                                    133 
                                    134 ;   LN2 ( -- 485 11464 )
                                    135 ; ln(2)/16.384 
                                    136 ; precision: 1.0e-7 
      00A1E9 85 E7                  137         .word LINK 
                           0022D9   138         LINK=.
      00A1EB 04                     139         .byte 4 
      00A1EB CD 8C 53 CD            140         .ascii "LN2S" 
      0022DE                        141 LN2S: 
      00A1EF 85 DB CD         [ 2]  142     subw x,#2*CELLL
      00A1F2 88 92 01 E5      [ 2]  143     ldw y,#485
      00A1F4 EF 02            [ 2]  144     ldw (2,x),y 
      00A1F4 CD 86 1E CD      [ 2]  145     ldw y,#11464 
      00A1F8 85               [ 2]  146     ldw (x),y 
      00A1F9 E7               [ 4]  147     ret 
                                    148 
                                    149 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



                                   4657 .endif
                           000001  4658 .if WANT_CONST_TABLE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]



                                   4659         .include "ctable.asm"
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
      00A1FA CD A1                   32     .word LINK 
                           0022EF    33     LINK=.
      00A1FC 5B                      34     .byte 6
      00A1FD CD 86 1E CD 85 E7       35     .ascii "CALLOT"
      0022F6                         36 CALLOT:
      00A203 CD 88 19         [ 4]   37     CALL CPP
      00A206 CD 86 1E         [ 4]   38     CALL DUPP 
      00A209 CD 8B 65         [ 4]   39     CALL AT 
      00A20C CD 85 C8         [ 4]   40     CALL TOR 
      00A20F CD 85 C8         [ 4]   41     CALL PSTOR 
      00A212 CD 86 48         [ 4]   42     CALL UPDATCP 
      00A215 CD 88 92         [ 4]   43     CALL RFROM
      00A218 CD 86 1E         [ 2]   44     JP ZERO 
                                     45 
                                     46 ;------------------------------
                                     47 ; create constants bytes table 
                                     48 ; in persistant memory
                                     49 ;  CTABLE ( n+ -- ad ; <string> )
                                     50 ; n+ bytes reserved 
                                     51 ;-----------------------------
      00A21B CD 85                   52     .word LINK 
                           002310    53     LINK=.
      00A21D 2C                      54     .byte 6
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]



      00A21E A2 37 CD 86 2E CD       55     .ascii "CTABLE"
      002317                         56 CTABLE:
      00A224 85 C8 CD         [ 4]   57     CALL CALLOT     
      00A227 88 19 CD         [ 2]   58     JP DCONST 
                                     59      
                                     60 
                                     61 ;--------------------------------
                                     62 ; create constants words table 
                                     63 ; in persistant memory 
                                     64 ; WTABLE ( n+ -- ad ; <string> )
                                     65 ; n+  words reserved  
                                     66 ;--------------------------------
      00A22A 86 1E                   67     .word LINK 
                           00231F    68     LINK=.
      00A22C CD                      69     .byte 6
      00A22D 85 E7 CD 86 2E CD       70     .ascii "WTABLE"
      002326                         71 WTABLE:
      00A233 85 43 A1         [ 4]   72     CALL CELLS  
      00A236 F4 22 F6         [ 4]   73     CALL CALLOT 
      00A237 CC 18 C1         [ 2]   74     JP DCONST 
                                     75 
                                     76 ;---------------------------------
                                     77 ; stack an element of CTABLE 
                                     78 ; CTABL@ ( u ad -- c )
                                     79 ; u element order {0..size-1}
                                     80 ; a|ad table address 
                                     81 ;--------------------------------
      00A237 CD 85                   82     .word LINK 
                           002331    83     LINK=.
      00A239 C8                      84     .byte 6
      00A23A 1C 00 0A 81 4C 40       85     .ascii "CTABL@" 
      00A23E                         86 CTAT:
      00A23E CD 8B 65         [ 4]   87     call FPSTOR 
      00A241 81 A1 B4         [ 4]   88     call PTRPLUS 
      00A244 09 55 50         [ 2]   89     jp EE_CREAD 
                                     90 
                                     91 ;---------------------------------
                                     92 ; stack an element of WTABLE 
                                     93 ; WTABL@ ( u ud -- w )
                                     94 ; u is element order {0..size-1}
                                     95 ; a|ud table address 
                                     96 ;----------------------------------
      00A247 44 41                   97     .word LINK 
                           002343    98     LINK=.
      00A249 54                      99     .byte 6
      00A24A 2D 50 54 52 4C 40      100     .ascii "WTABL@" 
      00A24E                        101 WTAT:
      00A24E CD 9C 08         [ 4]  102     call FPSTOR 
      00A251 CD 86 14         [ 4]  103     call CELLS 
      00A254 CD 85 77         [ 4]  104     call PTRPLUS 
      00A257 CD 87 6C         [ 4]  105     call EE_READ 
      00A25A CD               [ 4]  106     ret 
                                    107 
                                    108 ;--------------------------
                                    109 ; tool to initialize character table 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



                                    110 ; CTINIT ( ad -- )
                                    111 ; ad is table address 
                                    112 ;--------------------------
      00A25B 85 60                  113     .word LINK 
                           002359   114     LINK=.
      00A25D CD                     115     .byte 6 
      00A25E 9B F2 CD 86 14 CD      116     .ascii "CTINIT"
      002360                        117 CTINIT:
      00A264 85 77 CD         [ 4]  118     CALL FPSTOR
      00A267 84 F9 00         [ 4]  119     CALL UNLOCK
      00A26A 02 CD 88         [ 4]  120     CALL ZERO 
      00A26D 19 CD 86         [ 4]  121 1$: CALL ONEP 
      00A270 1E CD 87         [ 4]  122     CALL DUPP 
      00A273 5E CD 85         [ 4]  123     CALL INTQ 
      00A276 60 CD 87         [ 4]  124     CALL QBRAN 
      00A279 8A CD                  125     .word 2$
      00A27B 85 60 CD         [ 4]  126     call WR_BYTE 
      00A27E 9C 22 CD         [ 4]  127     CALL BRAN 
      00A281 87 7A                  128     .word 1$ 
      00A283 CD 85 60         [ 4]  129 2$: CALL DDROP 
      00A286 CD 9C 4B         [ 4]  130     CALL LOCK 
      00A289 81               [ 4]  131     ret 
                                    132 
                                    133 ;--------------------------
                                    134 ; tool to initialize word table 
                                    135 ; WTINIT ( ad -- )
                                    136 ; ad is table address 
                                    137 ;--------------------------
      00A28A A2 44                  138     .word LINK 
                           002388   139     LINK=.
      00A28C 06                     140     .byte 6 
      00A28D 49 46 4D 4F 56 45      141     .ascii "WTINIT"
      00A293                        142 WTINIT:
      00A293 CD 87 2B         [ 4]  143     CALL FPSTOR
      00A296 CD 85 77         [ 4]  144     CALL UNLOCK
      00A299 CD 85 2C         [ 4]  145     CALL ZERO 
      00A29C A2 3E CD         [ 4]  146 1$: CALL ONEP 
      00A29F 87 7A CD         [ 4]  147     CALL DUPP
      00A2A2 85 77 CD         [ 4]  148     CALL INTQ
      00A2A5 86 1E CD         [ 4]  149     CALL QBRAN 
      00A2A8 9C 08                  150     .word 2$
      00A2AA CD 86 14         [ 4]  151     call WR_WORD 
      00A2AD CD 85 77         [ 4]  152     CALL BRAN 
      00A2B0 CD 85                  153     .word 1$ 
      00A2B2 E7 CD A1         [ 4]  154 2$: CALL DDROP 
      00A2B5 AF CD 85         [ 4]  155     CALL LOCK 
      00A2B8 DB               [ 4]  156     ret 
                                    157 
                                    158 ;------------------------
                                    159 ; Prompted input for integer 
                                    160 ; display n+ in bracket and
                                    161 ; '?' 
                                    162 ; [N]? ( n+ -- a )
                                    163 ;------------------------
      00A2B9 CC A1                  164     .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



                           0023B7   165     LINK=.
      00A2BB EB                     166     .byte 4
      00A2BC A2 8C 02 50            167     .ascii "[N]?" 
      0023BC                        168 INTQ:
      00A2C0 49 0F 4B         [ 4]  169     CALL CR 
      00A2C1 CD 04 79         [ 4]  170     call DOLIT 
      00A2C1 1D 00                  171     .word '[
      00A2C3 04 90 AE         [ 4]  172     CALL EMIT 
      00A2C6 01 63 EF         [ 4]  173     CALL DOT 
      00A2C9 02 90 AE         [ 4]  174     CALL  DOTQP
      00A2CC 00                     175     .byte 3
      00A2CD 71 FF 81               176     .ascii "]? " 
      00A2D0 A2 BE 05         [ 4]  177     CALL QUERY 
      00A2D3 53 51 52         [ 4]  178     call TOKEN 
      00A2D6 54 32 F8         [ 2]  179     jp NUMBQ
                                    180 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



                                   4660 .endif
                           000001  4661 .if WANT_FLOAT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]



                                   4662         .include "float.asm"
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]



                                     55 ;    floating state variable
                                     56 ;    bit 0 zero flag 
                                     57 ;    bit 1 negative flag 
                                     58 ;    bit 2 overflow/error flag 
                                     59 ;---------------------------
      00A2D8                         60     _HEADER FPSW,4,"FPSW"
      00A2D8 1D 00                    1         .word LINK 
                           0023DC     2         LINK=.
      00A2DA 04                       3         .byte 4  
      00A2DB 90 AE 4C 91              4         .ascii "FPSW"
      0023E1                          5         FPSW:
      00A2DF EF 02 90 AE      [ 2]   61 	LDW Y,#UFPSW  
      00A2E3 36 24 FF         [ 2]   62 	SUBW X,#2
      00A2E6 81               [ 2]   63     LDW (X),Y
      00A2E7 A2               [ 4]   64     RET
                                     65 
                                     66 ;----------------------------
                                     67 ;    FBASE ( -- a )
                                     68 ;    floating point numerical
                                     69 ;    base variable 
                                     70 ;----------------------------
      0023EA                         71     _HEADER FBASE,5,"FBASE"
      00A2E8 D2 05                    1         .word LINK 
                           0023EC     2         LINK=.
      00A2EA 53                       3         .byte 5  
      00A2EB 51 52 54 33 45           4         .ascii "FBASE"
      00A2EF                          5         FBASE:
      00A2EF 1D 00 04 90      [ 2]   72 	LDW Y,#UFBASE  
      00A2F3 AE 49 81         [ 2]   73 	SUBW X,#2
      00A2F6 EF               [ 2]   74     LDW (X),Y
      00A2F7 02               [ 4]   75     RET
                                     76 
                                     77 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     78 ;   FRESET ( -- )
                                     79 ;   reset FPSW variable 
                                     80 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
      0023FB                         81     _HEADER FRESET,6,"FRESET"
      00A2F8 90 AE                    1         .word LINK 
                           0023FD     2         LINK=.
      00A2FA 2A                       3         .byte 6  
      00A2FB 70 FF 81 A2 E9 01        4         .ascii "FRESET"
      002404                          5         FRESET:
      002404                         82     _DOLIT 0 
      00A301 45 04 79         [ 4]    1     CALL DOLIT 
      00A302 00 00                    2     .word 0 
      00A302 1D 00 04         [ 4]   83     CALL FPSW 
      00A305 90 AE 6F         [ 4]   84     CALL STORE 
      00A308 FB               [ 4]   85     RET 
                                     86 
                                     87 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     88 ;   FINIT ( -- )
                                     89 ;   initialize floating point 
                                     90 ;   library 
                                     91 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002410                         92     _HEADER FINIT,5,"FINIT"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]



      00A309 EF 02                    1         .word LINK 
                           002412     2         LINK=.
      00A30B 90                       3         .byte 5  
      00A30C AE 29 32 FF 81           4         .ascii "FINIT"
      002418                          5         FINIT:
      00A311 A3 00 06         [ 4]   93     CALL FRESET 
      00A314 53 51 52         [ 4]   94     CALL BASE 
      00A317 54 31 30         [ 4]   95     CALL AT 
      00A31A CD 23 F2         [ 4]   96     CALL FBASE 
      00A31A 1D 00 04         [ 4]   97     CALL STORE 
      00A31D 90               [ 4]   98     RET 
                                     99 
                                    100 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    101 ;    FER ( -- u )
                                    102 ;    return FPSW value 
                                    103 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002428                        104     _HEADER FER,3,"FER"
      00A31E AE 59                    1         .word LINK 
                           00242A     2         LINK=.
      00A320 98                       3         .byte 3  
      00A321 EF 02 90                 4         .ascii "FER"
      00242E                          5         FER:
      00A324 AE 1C 55         [ 4]  105     CALL FPSW 
      00A327 FF 81 A3         [ 4]  106     CALL AT 
      00A32A 13               [ 4]  107     RET 
                                    108 
                                    109 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    110 ;    FZE  ( -- z )
                                    111 ;    return FPSW zero flag 
                                    112 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002435                        113     _HEADER FZE,3,"FZE"
      00A32B 05 31                    1         .word LINK 
                           002437     2         LINK=.
      00A32D 32                       3         .byte 3  
      00A32E 52 54 32                 4         .ascii "FZE"
      00A331                          5         FZE:
      00A331 1D 00 04         [ 4]  114     CALL FPSW
      00A334 90 AE 68         [ 4]  115     CALL AT  
      002441                        116     _DOLIT 1
      00A337 AD EF 02         [ 4]    1     CALL DOLIT 
      00A33A 90 AE                    2     .word 1 
      00A33C 62 CD FF         [ 4]  117     CALL ANDD 
      00A33F 81               [ 4]  118     RET 
                                    119 
                                    120 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    121 ;    FNE ( -- n )
                                    122 ;    return FPSW negative flag 
                                    123 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00244A                        124     _HEADER FNE,3,"FNE"
      00A340 A3 2B                    1         .word LINK 
                           00244C     2         LINK=.
      00A342 05                       3         .byte 3  
      00A343 4C 4F 47                 4         .ascii "FNE"
      002450                          5         FNE:
      00A346 32 53 E1         [ 4]  125     CALL FPSW 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]



      00A348 CD 04 F7         [ 4]  126     CALL AT 
      002456                        127     _DOLIT 2 
      00A348 1D 00 04         [ 4]    1     CALL DOLIT 
      00A34B 90 AE                    2     .word 2 
      00A34D 07 F8 EF         [ 4]  128     CALL ANDD 
      00A350 02               [ 4]  129     RET 
                                    130 
                                    131 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    132 ;   FOV (A -- v )
                                    133 ;   return FPSW overflow flag 
                                    134 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00245F                        135     _HEADER FOV,3,"FOV"
      00A351 90 AE                    1         .word LINK 
                           002461     2         LINK=.
      00A353 2B                       3         .byte 3  
      00A354 5F FF 81                 4         .ascii "FOV"
      002465                          5         FOV:
      00A357 A3 42 04         [ 4]  136     CALL FPSW
      00A35A 4C 4E 32         [ 4]  137     CALL AT  
      00246B                        138     _DOLIT 4 
      00A35D 53 04 79         [ 4]    1     CALL DOLIT 
      00A35E 00 04                    2     .word 4 
      00A35E 1D 00 04         [ 4]  139     CALL ANDD 
      00A361 90               [ 4]  140     RET 
                                    141 
                                    142 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    143 ;    D0= ( d -- 0|-1 )
                                    144 ;    check if double is 0 
                                    145 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002474                        146     _HEADER DZEQUAL,3,"D0="
      00A362 AE 01                    1         .word LINK 
                           002476     2         LINK=.
      00A364 E5                       3         .byte 3  
      00A365 EF 02 90                 4         .ascii "D0="
      00247A                          5         DZEQUAL:
      00A368 AE 2C C8         [ 4]  147     CALL ORR 
      00A36B FF 81            [ 1]  148     LD A,#0xFF
      00A36D A3 59            [ 1]  149     LDW Y,X
      00A36F 06 43            [ 2]  150     LDW Y,(Y)
      00A371 41 4C            [ 1]  151     JRMI  ZEQ1
      00A373 4C               [ 1]  152     CLR A   ;false
      002486                        153 ZEQ1:
      00A374 4F               [ 1]  154     LD     (X),A
      00A375 54 01            [ 1]  155     LD (1,X),A
      00A376 81               [ 4]  156 	RET     
                                    157     
                                    158 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    159 ;  DNEGATE ( d -- d )
                                    160 ;  negate double (2's complement)
                                    161 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00248A                        162     _HEADER DNEGAT,7,"DNEGATE"
      00A376 CD 87                    1         .word LINK 
                           00248C     2         LINK=.
      00A378 7A                       3         .byte 7  
      00A379 CD 86 1E CD 85 77 CD     4         .ascii "DNEGATE"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal  85-Bits]



      002494                          5         DNEGAT:
      00A381 E7 CD 8B         [ 4]  163     CALL INVER
      00A384 D5 CD 9C         [ 4]  164     CALL SWAPP 
      00A387 4B CD 85         [ 4]  165     CALL INVER 
      00A38A C8 CC            [ 1]  166     LDW  Y,X 
      00A38C 8B 65            [ 2]  167     LDW Y,(Y)
      00A38E A3 6F 06 43      [ 2]  168     ADDW Y,#1 
      00A392 54               [ 2]  169     LDW (X),Y 
      00A393 41 42            [ 1]  170     JRNC DNEG1 
      00A395 4C 45            [ 1]  171     LDW Y,X 
      00A397 90 EE 02         [ 2]  172     LDW Y,(2,Y)
      00A397 CD A3 76 CC      [ 2]  173     ADDW Y,#1
      00A39B 99 41            [ 2]  174     LDW (2,X),Y 
      0024B3                        175 DNEG1:
      00A39D A3 90 06         [ 4]  176     CALL SWAPP 
      00A3A0 57               [ 4]  177     RET      
                                    178 
                                    179 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    180 ;   U> ( u1 u2 -- f )
                                    181 ;   f = true if u1>u2 
                                    182 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0024B7                        183     _HEADER UGREAT,2,"U>"
      00A3A1 54 41                    1         .word LINK 
                           0024B9     2         LINK=.
      00A3A3 42                       3         .byte 2  
      00A3A4 4C 45                    4         .ascii "U>"
      00A3A6                          5         UGREAT:
      00A3A6 CD 8A            [ 1]  184     LD A,#0
      00A3A8 EC CD            [ 1]  185     LDW Y,X 
      00A3AA A3 76 CC         [ 2]  186     LDW Y,(2,Y)
      00A3AD 99 41 A3         [ 2]  187     LDW YTEMP,Y 
      00A3B0 9F 06            [ 1]  188     LDW Y,X
      00A3B2 43 54 41         [ 2]  189     ADDW X,#2 
      00A3B5 42 4C            [ 2]  190     LDW Y,(Y)
      00A3B7 40 B3 28         [ 2]  191     CPW Y,YTEMP 
      00A3B8 2B 02            [ 1]  192     JRMI UGREAT1 
      00A3B8 CD 9B            [ 1]  193     LD A,#0XFF 
      0024D4                        194 UGREAT1:
      00A3BA 8E               [ 1]  195     LD (X),A 
      00A3BB CD 9D            [ 1]  196     LD (1,X),A 
      00A3BD 20               [ 4]  197     RET 
                                    198 
                                    199 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    200 ;    SFZ ( f# -- f# )
                                    201 ;    set FPSW zero flag 
                                    202 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0024D8                        203     _HEADER SFZ,3,"SFZ"
      00A3BE CC 9D                    1         .word LINK 
                           0024DA     2         LINK=.
      00A3C0 5D                       3         .byte 3  
      00A3C1 A3 B1 06                 4         .ascii "SFZ"
      0024DE                          5         SFZ:
      00A3C4 57 54 41         [ 4]  204     CALL DDUP 
      00A3C7 42 4C 40         [ 4]  205     CALL FER 
      00A3CA                        206     _DOLIT 0xfffe 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
Hexadecimal [24-Bits]



      00A3CA CD 9B 8E         [ 4]    1     CALL DOLIT 
      00A3CD CD 8A                    2     .word 0xfffe 
      00A3CF EC CD 9D         [ 4]  207     CALL ANDD 
      00A3D2 20 CD 9D         [ 4]  208     CALL TOR    
      0024EF                        209     _DOLIT 0x807F 
      00A3D5 3B 81 A3         [ 4]    1     CALL DOLIT 
      00A3D8 C3 06                    2     .word 0x807F 
      00A3DA 43 54 49         [ 4]  210     CALL ANDD 
      00A3DD 4E 49 54         [ 4]  211     CALL DZEQUAL 
      00A3E0                        212     _DOLIT 1 
      00A3E0 CD 9B 8E         [ 4]    1     CALL DOLIT 
      00A3E3 CD 9C                    2     .word 1 
      00A3E5 CC CD 8B         [ 4]  213     CALL ANDD 
      00A3E8 65 CD 8A         [ 4]  214     CALL RFROM 
      00A3EB F9 CD 86         [ 4]  215     CALL ORR 
      00A3EE 1E CD A4         [ 4]  216     CALL FPSW 
      00A3F1 3C CD 85         [ 4]  217     CALL STORE 
      00A3F4 2C               [ 4]  218     RET 
                                    219 
                                    220 
                                    221 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    222 ;   SFN ( f# -- f# )
                                    223 ;   set FPSW negative flag 
                                    224 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00250F                        225     _HEADER SFN,3,"SFN"
      00A3F5 A3 FF                    1         .word LINK 
                           002511     2         LINK=.
      00A3F7 CD                       3         .byte 3  
      00A3F8 9D 77 CD                 4         .ascii "SFN"
      002515                          5         SFN:
      00A3FB 85 43 A3         [ 4]  226     CALL DUPP  
      00A3FE E9 CD 87         [ 4]  227     CALL FER 
      00251B                        228     _DOLIT 0xFFFD 
      00A401 F9 CD 9C         [ 4]    1     CALL DOLIT 
      00A404 F4 81                    2     .word 0xFFFD 
      00A406 A3 D9 06         [ 4]  229     CALL ANDD  
      00A409 57 54 49         [ 4]  230     CALL TOR 
      002526                        231     _DOLIT 0x8000
      00A40C 4E 49 54         [ 4]    1     CALL DOLIT 
      00A40F 80 00                    2     .word 0x8000 
      00A40F CD 9B 8E         [ 4]  232     CALL ANDD
      00A412 CD 9C            [ 1]  233     LDW Y,X 
      00A414 CC CD            [ 2]  234     LDW Y,(Y)
      00A416 8B               [ 1]  235     RCF 
      00A417 65 CD            [ 2]  236     RLCW Y 
      00A419 8A F9            [ 2]  237     RLCW Y 
      00A41B CD 86            [ 2]  238     RLCW Y 
      00A41D 1E               [ 2]  239     LDW (X),Y 
      00A41E CD A4 3C         [ 4]  240     CALL RFROM 
      00A421 CD 85 2C         [ 4]  241     CALL ORR 
      00A424 A4 2E CD         [ 4]  242     CALL FPSW
      00A427 9D 9C CD         [ 4]  243     CALL STORE 
      00A42A 85               [ 4]  244     RET 
                                    245 
                                    246 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal [24-Bits]



                                    247 ;   SFV ( -- )
                                    248 ;   set overflow flag 
                                    249 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002547                        250     _HEADER SFV,3,"SFV"
      00A42B 43 A4                    1         .word LINK 
                           002549     2         LINK=.
      00A42D 18                       3         .byte 3  
      00A42E CD 87 F9                 4         .ascii "SFV"
      00254D                          5         SFV:
      00A431 CD 9C F4         [ 4]  251     CALL FPSW 
      00A434 81 A4 08         [ 4]  252     CALL AT 
      002553                        253     _DOLIT 4 
      00A437 04 5B 4E         [ 4]    1     CALL DOLIT 
      00A43A 5D 3F                    2     .word 4 
      00A43C CD 05 FE         [ 4]  254     CALL ORR 
      00A43C CD 8F CB         [ 4]  255     CALL FPSW 
      00A43F CD 84 F9         [ 4]  256     CALL STORE 
      00A442 00               [ 4]  257     RET 
                                    258 
                                    259 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    260 ;  @EXPONENT ( f# -- m e )
                                    261 ;  split float in mantissa/exponent 
                                    262 ;  m mantissa as a double 
                                    263 ;  e exponent as a single 
                                    264 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002562                        265     _HEADER ATEXP,9,"@EXPONENT"             
      00A443 5B CD                    1         .word LINK 
                           002564     2         LINK=.
      00A445 84                       3         .byte 9  
      00A446 B8 CD 90 66 CD 90 0A     4         .ascii "@EXPONENT"
             03 5D
      00256E                          5         ATEXP:
      00A44F 3F 20 CD         [ 4]  266     CALL FRESET
      00A452 93 B2 CD         [ 4]  267     CALL SFN
      00A455 91 DD CC         [ 4]  268     CALL SFZ 
      00A458 8E 78 A4         [ 4]  269     CALL DUPP
      00257A                        270     _DOLIT 0X7F80 
      00A45B 37 04 46         [ 4]    1     CALL DOLIT 
      00A45E 50 53                    2     .word 0X7F80 
      00A460 57 05 EA         [ 4]  271     CALL ANDD 
      00A461                        272     _DOLIT 7 
      00A461 90 AE 00         [ 4]    1     CALL DOLIT 
      00A464 0A 1D                    2     .word 7 
      00A466 00 02 FF         [ 4]  273     CALL RSHIFT
      00258A                        274     _DOLIT 127 
      00A469 81 A4 5C         [ 4]    1     CALL DOLIT 
      00A46C 05 46                    2     .word 127 
      00A46E 42 41 53         [ 4]  275     CALL SUBB
      00A471 45 05 67         [ 4]  276     CALL TOR 
      00A472                        277     _DOLIT 0x7F
      00A472 90 AE 00         [ 4]    1     CALL DOLIT 
      00A475 08 1D                    2     .word 0x7F 
      00A477 00 02 FF         [ 4]  278     CALL ANDD  ; mantissa as double  
      00A47A 81 A4 6C         [ 4]  279     CALL FNE 
      0025A0                        280     _QBRAN POSMANT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal [24-Bits]



      00A47D 06 46 52         [ 4]    1     CALL QBRAN
      00A480 45 53                    2     .word POSMANT
      00A482 45 54 94         [ 4]  281     CALL DNEGAT 
      00A484                        282 POSMANT:
      00A484 CD 84 F9         [ 4]  283     CALL RFROM 
      00A487 00               [ 4]  284     RET 
                                    285 
                                    286 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    287 ;    !EXPONENT ( m e -- f# )
                                    288 ;    built float from mantissa/exponent 
                                    289 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0025AC                        290     _HEADER STEXP,9,"!EXPONENT"
      00A488 00 CD                    1         .word LINK 
                           0025AE     2         LINK=.
      00A48A A4                       3         .byte 9  
      00A48B 61 CD 85 60 81 A4 7D     4         .ascii "!EXPONENT"
             05 46
      0025B8                          5         STEXP:
      00A494 49 4E 49         [ 4]  291     CALL DUPP 
      00A497 54 08 2C         [ 4]  292     CALL ABSS 
      00A498                        293     _DOLIT 127 
      00A498 CD A4 84         [ 4]    1     CALL DOLIT 
      00A49B CD 86                    2     .word 127 
      00A49D DB CD 85         [ 4]  294     CALL UGREAT
      0025C6                        295     _QBRAN STEXP1
      00A4A0 77 CD A4         [ 4]    1     CALL QBRAN
      00A4A3 72 CD                    2     .word STEXP1
      00A4A5 85 60 81         [ 4]  296     CALL SFV  
      0025CE                        297 STEXP1:
      0025CE                        298     _DOLIT 127 
      00A4A8 A4 92 03         [ 4]    1     CALL DOLIT 
      00A4AB 46 45                    2     .word 127 
      00A4AD 52 07 99         [ 4]  299     CALL PLUS 
      00A4AE                        300     _DOLIT 0XFF 
      00A4AE CD A4 61         [ 4]    1     CALL DOLIT 
      00A4B1 CD 85                    2     .word 0XFF 
      00A4B3 77 81 A4         [ 4]  301     CALL ANDD 
      0025DE                        302     _DOLIT 7 
      00A4B6 AA 03 46         [ 4]    1     CALL DOLIT 
      00A4B9 5A 45                    2     .word 7 
      00A4BB CD 0A 97         [ 4]  303     CALL LSHIFT 
      00A4BB CD A4 61         [ 4]  304     CALL TOR   ; R: e 
      00A4BE CD 85 77         [ 4]  305     CALL DUPP 
      0025EC                        306     _DOLIT 0X8000 
      00A4C1 CD 84 F9         [ 4]    1     CALL DOLIT 
      00A4C4 00 01                    2     .word 0X8000 
      00A4C6 CD 86 6A         [ 4]  307     CALL ANDD 
      0025F4                        308     _QBRAN STEXP2 
      00A4C9 81 A4 B7         [ 4]    1     CALL QBRAN
      00A4CC 03 46                    2     .word STEXP2
      0025F9                        309     _DOLIT 0X8000 
      00A4CE 4E 45 79         [ 4]    1     CALL DOLIT 
      00A4D0 80 00                    2     .word 0X8000 
      00A4D0 CD A4 61         [ 4]  310     CALL RFROM 
      00A4D3 CD 85 77         [ 4]  311     CALL ORR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]



      00A4D6 CD 84 F9         [ 4]  312     CALL TOR
      00A4D9 00 02 CD         [ 4]  313     CALL DNEGAT  
      00260A                        314 STEXP2:
      00A4DC 86 6A 81         [ 4]  315     CALL DUPP 
      00260D                        316     _DOLIT 0X7F
      00A4DF A4 CC 03         [ 4]    1     CALL DOLIT 
      00A4E2 46 4F                    2     .word 0X7F 
      00A4E4 56 24 BC         [ 4]  317     CALL UGREAT 
      00A4E5                        318     _QBRAN STEXP3 
      00A4E5 CD A4 61         [ 4]    1     CALL QBRAN
      00A4E8 CD 85                    2     .word STEXP3
      00A4EA 77 CD 84         [ 4]  319     CALL SFV 
      00261D                        320 STEXP3:
      00261D                        321     _DOLIT 0X7F 
      00A4ED F9 00 04         [ 4]    1     CALL DOLIT 
      00A4F0 CD 86                    2     .word 0X7F 
      00A4F2 6A 81 A4         [ 4]  322     CALL ANDD 
      00A4F5 E1 03 44         [ 4]  323     CALL RFROM 
      00A4F8 30 3D FE         [ 4]  324     CALL ORR 
      00A4FA CD 24 DE         [ 4]  325     CALL SFZ 
      00A4FA CD 86 7E         [ 4]  326     CALL SFN 
      00A4FD A6               [ 4]  327     RET 
                                    328 
                                    329 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    330 ;    -ROT ( n1 n2 n3 -- n3 n1 n2 )
                                    331 ;    rotate left 3 top elements 
                                    332 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002632                        333     _HEADER NROT,4,"-ROT"
      00A4FE FF 90                    1         .word LINK 
                           002634     2         LINK=.
      00A500 93                       3         .byte 4  
      00A501 90 FE 2B 01              4         .ascii "-ROT"
      002639                          5         NROT:
      00A505 4F 93            [ 1]  334     LDW Y,X 
      00A506 90 FE            [ 2]  335     LDW Y,(Y)
      00A506 F7 E7 01         [ 2]  336     LDW YTEMP,Y ; n3  
      00A509 81 A4            [ 1]  337     LDW Y,X 
      00A50B F6 07 44         [ 2]  338     LDW Y,(2,Y) ; Y = n2 
      00A50E 4E               [ 2]  339     LDW (X),Y   ; TOS = n2 
      00A50F 45 47            [ 1]  340     LDW Y,X    
      00A511 41 54 45         [ 2]  341     LDW Y,(4,Y) ; Y = n1 
      00A514 EF 02            [ 2]  342     LDW (2,X),Y ;   = n1 
      00A514 CD 88 33         [ 2]  343     LDW Y,YTEMP 
      00A517 CD 86            [ 2]  344     LDW (4,X),Y ; = n3 
      00A519 2E               [ 4]  345     RET 
                                    346 
                                    347 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    348 ;   D/MOD ( d s - r qd )
                                    349 ;   unsigned divide double by single 
                                    350 ;   return double quotient 
                                    351 ;   and single remainder 
                                    352 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002653                        353     _HEADER DSLMOD,5,"D/MOD"
      00A51A CD 88                    1         .word LINK 
                           002655     2         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]



      00A51C 33                       3         .byte 5  
      00A51D 90 93 90 FE 72           4         .ascii "D/MOD"
      00265B                          5         DSLMOD:
      00A522 A9 00            [ 1]  354         LDW     Y,X             ; stack pointer to Y
      00A524 01               [ 2]  355         LDW     X,(X)           ; un
      00A525 FF 24            [ 2]  356         LDW     YTEMP,X         ; save un
      00A527 0B               [ 1]  357         LDW     X,Y
      00A528 90               [ 2]  358         PUSHW   X               ; save stack pointer
      00A529 93 90            [ 2]  359         PUSHW   Y 
      00A52B EE 02            [ 2]  360         LDW     X,(2,X)           ; X=udh
      00A52D 72 A9 00         [ 2]  361         LDW     Y,YTEMP         ; divisor 
      00A530 01               [ 2]  362         DIVW    X,Y 
      00A531 EF 02            [ 2]  363         LDW     XTEMP,X         ; QUOTIENT hi 
      00A533 93               [ 1]  364         LDW     X,Y             ; remainder in X 
      00A533 CD 86            [ 2]  365         POPW    Y 
      00A535 2E 81 A5         [ 2]  366         LDW     Y,(4,Y)         ; Y=udl (offset before drop)
      00A538 0C 02            [ 1]  367         LD      A,#16           ; loop count
      00A53A 55 3E            [ 2]  368         SLLW    Y               ; udl shift udl into udh
      00A53C                        369 DSLMOD3:
      00A53C A6               [ 2]  370         RLCW    X               ; rotate udl bit into uhdh (= remainder)
      00A53D 00 90            [ 1]  371         JRC     DSLMODa         ; if carry out of rotate
      00A53F 93 90            [ 2]  372         CPW     X,YTEMP         ; compare udh to un
      00A541 EE 02            [ 1]  373         JRULT   DSLMOD4         ; can't subtract
      00267D                        374 DSLMODa:
      00A543 90 BF 28 90      [ 2]  375         SUBW    X,YTEMP         ; can subtract
      00A547 93               [ 1]  376         RCF
      002682                        377 DSLMOD4:
      00A548 1C               [ 1]  378         CCF                     ; quotient bit
      00A549 00 02            [ 2]  379         RLCW    Y               ; rotate into quotient, rotate out udl
      00A54B 90               [ 1]  380         DEC     A               ; repeat
      00A54C FE 90            [ 1]  381         JRNE    DSLMOD3           ; if A == 0
      002688                        382 DSLMODb:
      00A54E B3 28            [ 2]  383         LDW     YTEMP,X         ; done, save remainder
      00A550 2B               [ 2]  384         POPW    X               ; restore stack pointer
      00A551 02 A6            [ 2]  385         LDW     (2,X),Y           ; save quotient low 
      00A553 FF BE 26         [ 2]  386         LDW     Y,XTEMP         ; quotient hi 
      00A554 FF               [ 2]  387         LDW     (X),Y           ; save quotient hi 
      00A554 F7 E7 01         [ 2]  388         LDW     Y,YTEMP         ; remainder onto stack
      00A557 81 A5            [ 2]  389         LDW     (4,X),Y
      00A559 39               [ 4]  390         RET 
                                    391 
                                    392 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    393 ;   D# ( d -- d )
                                    394 ;   extract least digit 
                                    395 ;   from double integer 
                                    396 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002697                        397     _HEADER DDIG,2,"D#"
      00A55A 03 53                    1         .word LINK 
                           002699     2         LINK=.
      00A55C 46                       3         .byte 2  
      00A55D 5A 23                    4         .ascii "D#"
      00A55E                          5         DDIG:
      00A55E CD 88 04         [ 4]  398     CALL BASE 
      00A561 CD A4 AE         [ 4]  399     CALL AT 
      00A564 CD 84 F9         [ 4]  400     CALL DSLMOD
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]



      00A567 FF FE CD         [ 4]  401     CALL ROT   
      00A56A 86 6A CD         [ 4]  402     CALL DIGIT 
      00A56D 85 E7 CD         [ 4]  403     CALL HOLD 
      00A570 84               [ 4]  404     RET 
                                    405 
                                    406 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    407 ;   E. ( f# -- )
                                    408 ;   print float in scientific 
                                    409 ;   format 
                                    410 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0026AF                        411     _HEADER EDOT,2,"E."
      00A571 F9 80                    1         .word LINK 
                           0026B1     2         LINK=.
      00A573 7F                       3         .byte 2  
      00A574 CD 86                    4         .ascii "E."
      0026B4                          5         EDOT:
      00A576 6A CD A4         [ 4]  412     CALL BASE 
      00A579 FA CD 84         [ 4]  413     CALL AT 
      00A57C F9 00 01         [ 4]  414     CALL TOR 
      00A57F CD 86 6A         [ 4]  415     CALL FBASE 
      00A582 CD 85 C8         [ 4]  416     CALL AT
      00A585 CD 86 7E         [ 4]  417     CALL BASE 
      00A588 CD A4 61         [ 4]  418     CALL STORE 
      00A58B CD 85 60         [ 4]  419     CALL ATEXP ; m e 
      00A58E 81 A5 5A         [ 4]  420     CALL TOR   
      00A591 03 53 46         [ 4]  421     CALL FNE 
      0026D2                        422     _QBRAN EDOT1
      00A594 4E 04 AC         [ 4]    1     CALL QBRAN
      00A595 26 DA                    2     .word EDOT1
      00A595 CD 86 1E         [ 4]  423     CALL DNEGAT
      0026DA                        424 EDOT1:
      00A598 CD A4 AE         [ 4]  425     CALL SPACE 
      00A59B CD 84 F9         [ 4]  426     CALL BDIGS     
      0026E0                        427 EDOT2: 
      00A59E FF FD CD         [ 4]  428     CALL DDIG
      00A5A1 86 6A CD         [ 4]  429     CALL RFROM 
      00A5A4 85 E7 CD         [ 4]  430     CALL ONEP 
      00A5A7 84 F9 80         [ 4]  431     CALL TOR 
      00A5AA 00 CD 86         [ 4]  432     CALL DUPP
      0026EF                        433     _QBRAN EDOT3 
      00A5AD 6A 90 93         [ 4]    1     CALL QBRAN
      00A5B0 90 FE                    2     .word EDOT3
      0026F4                        434     _BRAN EDOT2  
      00A5B2 98 90 59         [ 4]    1     CALL BRAN 
      00A5B5 90 59                    2     .word EDOT2 
      0026F9                        435 EDOT3:
      00A5B7 90 59 FF         [ 4]  436     CALL OVER 
      00A5BA CD 85 C8         [ 4]  437     CALL BASE 
      00A5BD CD 86 7E         [ 4]  438     CALL AT 
      00A5C0 CD A4 61         [ 4]  439     CALL ULESS 
      002705                        440     _QBRAN EDOT2 
      00A5C3 CD 85 60         [ 4]    1     CALL QBRAN
      00A5C6 81 A5                    2     .word EDOT2
      00270A                        441     _DOLIT '.'
      00A5C8 91 03 53         [ 4]    1     CALL DOLIT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]



      00A5CB 46 56                    2     .word '.' 
      00A5CD CD 0D 00         [ 4]  442     CALL HOLD  
      00A5CD CD A4 61         [ 4]  443     CALL DDIG
      00A5D0 CD 85 77         [ 4]  444     CALL FNE 
      002718                        445     _QBRAN EDOT4 
      00A5D3 CD 84 F9         [ 4]    1     CALL QBRAN
      00A5D6 00 04                    2     .word EDOT4
      00271D                        446     _DOLIT '-'
      00A5D8 CD 86 7E         [ 4]    1     CALL DOLIT 
      00A5DB CD A4                    2     .word '-' 
      00A5DD 61 CD 85         [ 4]  447     CALL HOLD 
      002725                        448 EDOT4:       
      00A5E0 60 81 A5         [ 4]  449     CALL EDIGS 
      00A5E3 C9 09 40         [ 4]  450     CALL TYPES
      00A5E6 45 58 50         [ 4]  451     CALL RFROM 
      00A5E9 4F 4E 45         [ 4]  452     CALL QDUP 
      002731                        453     _QBRAN EDOT5     
      00A5EC 4E 54 AC         [ 4]    1     CALL QBRAN
      00A5EE 27 41                    2     .word EDOT5
      002736                        454     _DOLIT 'E'
      00A5EE CD A4 84         [ 4]    1     CALL DOLIT 
      00A5F1 CD A5                    2     .word 'E' 
      00A5F3 95 CD A5         [ 4]  455     CALL EMIT 
      00A5F6 5E CD 86         [ 4]  456     CALL DOT
      002741                        457 EDOT5: 
      00A5F9 1E CD 84         [ 4]  458     CALL RFROM 
      00A5FC F9 7F 80         [ 4]  459     CALL BASE 
      00A5FF CD 86 6A         [ 4]  460     CALL STORE  
      00A602 CD               [ 4]  461     RET 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal [24-Bits]



                                   4663 .endif 
                                   4664 
                                   4665 ;===============================================================
                                   4666 
                           0026B1  4667 LASTN =	LINK   ;last name defined
                                   4668 
                                   4669 ; application code begin here
      002780                       4670 	.bndry 128 ; align on flash block  
      002780                       4671 app_space: 
                                   4672 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   6 AB1        000835 R   |   6 ABOR1      00136E R
  6 ABOR2      001385 R   |   6 ABORQ      001366 R   |   6 ABORT      001357 R
  6 ABRTQ      001642 R   |   6 ABSS       00082C R   |   6 ACCEP      0012ED R
  6 ACCP1      0012F6 R   |   6 ACCP2      00131C R   |   6 ACCP3      00131F R
  6 ACCP4      001321 R   |     ADC_CR1 =  005401     |     ADC_CR1_=  000000 
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
  6 AFT        00162D R   |   6 AGAIN      001583 R   |   6 AHEAD      0015E0 R
  6 ALLOT      001496 R   |   6 ANDD       0005EA R   |     APP_CP  =  004004 
    APP_LAST=  004000     |     APP_RUN =  004002     |     APP_VP  =  004006 
  6 AT         0004F7 R   |   6 ATEXE      000C09 R   |   6 ATEXP      00256E R
  6 AUTORUN    00012B R   |     AWU_APR =  0050F1     |     AWU_CSR =  0050F0 
    AWU_TBR =  0050F2     |     B0_MASK =  000001     |     B115200 =  000006 
  6 B115K2     0003E2 R   |     B19200  =  000003     |   6 B19K2      0003BF R
    B1_MASK =  000002     |     B230400 =  000007     |     B2400   =  000000 
  6 B2K4       000390 R   |     B2_MASK =  000004     |     B38400  =  000004 
    B3_MASK =  000008     |     B460800 =  000008     |     B4800   =  000001 
  6 B4K8       00039E R   |     B4_MASK =  000010     |     B57600  =  000005 
  6 B57K6      0003D0 R   |     B5_MASK =  000020     |     B6_MASK =  000040 
    B7_MASK =  000080     |     B921600 =  000009     |     B9600   =  000002 
  6 B9K6       0003AE R   |   6 BACK1      001295 R   |   6 BASE       00065B R
    BASEE   =  00000A     |   6 BAUD       0003F2 R   |     BCNT    =  000001 
  6 BCOMP      0014D8 R   |   6 BDIGS      000CF0 R   |     BEEP_BIT=  000004 
    BEEP_CSR=  0050F3     |     BEEP_MAS=  000010     |     BEEP_POR=  00000F 
  6 BEGIN      001565 R   |     BIT0    =  000000     |     BIT1    =  000001 
    BIT2    =  000002     |     BIT3    =  000003     |     BIT4    =  000004 
    BIT5    =  000005     |     BIT6    =  000006     |     BIT7    =  000007 
  6 BKSLA      00112D R   |   6 BKSP       001265 R   |     BKSPP   =  000008 
  6 BLANK      000AD8 R   |     BLOCK_SI=  000080     |     BOOT_ROM=  006000 
    BOOT_ROM=  007FFF     |   6 BRAN       0004C3 R   |     BTW     =  000001 
  6 BUF2ROW    0020AD R   |   6 BYE        0000B8 R   |     CADR    =  000003 
    CALLL   =  0000CD     |   6 CALLOT     0022F6 R   |     CAN_DGR =  005426 
    CAN_FPSR=  005427     |     CAN_IER =  005425     |     CAN_MCR =  005420 
    CAN_MSR =  005421     |     CAN_P0  =  005428     |     CAN_P1  =  005429 
    CAN_P2  =  00542A     |     CAN_P3  =  00542B     |     CAN_P4  =  00542C 
    CAN_P5  =  00542D     |     CAN_P6  =  00542E     |     CAN_P7  =  00542F 
    CAN_P8  =  005430     |     CAN_P9  =  005431     |     CAN_PA  =  005432 
    CAN_PB  =  005433     |     CAN_PC  =  005434     |     CAN_PD  =  005435 
    CAN_PE  =  005436     |     CAN_PF  =  005437     |     CAN_RFR =  005424 
    CAN_TPR =  005423     |     CAN_TSR =  005422     |     CARRY   =  00002C 
  6 CAT        000515 R   |   6 CCOMMA     0014BA R   |     CC_C    =  000000 
    CC_H    =  000004     |     CC_I0   =  000003     |     CC_I1   =  000005 
    CC_N    =  000002     |     CC_V    =  000007     |     CC_Z    =  000001 
    CELLL   =  000002     |   6 CELLM      000A5D R   |   6 CELLP      000A4E R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]

Symbol Table

  6 CELLS      000A6C R   |     CFG_GCR =  007F60     |     CFG_GCR_=  000001 
    CFG_GCR_=  000000     |   6 CHAR1      000F1D R   |   6 CHAR2      000F20 R
  6 CHKIVEC    001F9B R   |     CLKOPT  =  004807     |     CLKOPT_C=  000002 
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
    CLK_SWR_=  0000D2     |   6 CMOV1      000C28 R   |   6 CMOV2      000C40 R
  6 CMOVE      000C20 R   |     CNTDWN  =  000034     |   6 CNTXT      0006DE R
  6 COLD       001A9C R   |   6 COLD1      001A9C R   |   6 COLON      0017DB R
  6 COMMA      0014A3 R   |   6 COMPI      0014E8 R   |     COMPO   =  000040 
  6 CONSTANT   001885 R   |   6 COUNT      000BBC R   |   6 CPP        0006FA R
    CPU_A   =  007F00     |     CPU_CCR =  007F0A     |     CPU_PCE =  007F01 
    CPU_PCH =  007F02     |     CPU_PCL =  007F03     |     CPU_SPH =  007F08 
    CPU_SPL =  007F09     |     CPU_XH  =  007F04     |     CPU_XL  =  007F05 
    CPU_YH  =  007F06     |     CPU_YL  =  007F07     |   6 CR         000F4B R
  6 CREAT      001821 R   |     CRR     =  00000D     |   6 CSTOR      000504 R
  6 CTABLE     002317 R   |   6 CTAT       002338 R   |   6 CTINIT     002360 R
  6 DAT        000B9C R   |     DATSTK  =  001680     |   6 DCONST     0018C1 R
  6 DDIG       00269C R   |   6 DDROP      000779 R   |   6 DDUP       000784 R
    DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF     |   6 DECIM      000DA0 R
  6 DEPTH      000B27 R   |     DEVID_BA=  0048CD     |     DEVID_EN=  0048D8 
    DEVID_LO=  0048D2     |     DEVID_LO=  0048D3     |     DEVID_LO=  0048D4 
    DEVID_LO=  0048D5     |     DEVID_LO=  0048D6     |     DEVID_LO=  0048D7 
    DEVID_LO=  0048D8     |     DEVID_WA=  0048D1     |     DEVID_XH=  0048CE 
    DEVID_XL=  0048CD     |     DEVID_YH=  0048D0     |     DEVID_YL=  0048CF 
  6 DGTQ1      000DE5 R   |   6 DI         0000C6 R   |   6 DIG        000D19 R
  6 DIGIT      000CB4 R   |   6 DIGS       000D2A R   |   6 DIGS1      000D2A R
  6 DIGS2      000D37 R   |   6 DIGTQ      000DB4 R   |     DISCOVER=  000000 
    DM_BK1RE=  007F90     |     DM_BK1RH=  007F91     |     DM_BK1RL=  007F92 
    DM_BK2RE=  007F93     |     DM_BK2RH=  007F94     |     DM_BK2RL=  007F95 
    DM_CR1  =  007F96     |     DM_CR2  =  007F97     |     DM_CSR1 =  007F98 
    DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A     |   6 DN1        0007F3 R
  6 DNEG1      0024B3 R   |   6 DNEGA      0007D6 R   |   6 DNEGAT     002494 R
  6 DOCONST    0018AF R   |   6 DOLIT      000479 R   |   6 DONXT      00048D R
    DOORBELL=  000000     |   6 DOSTR      000F61 R   |   6 DOT        000FE6 R
  6 DOT1       000FFC R   |   6 DOTI1      001A1D R   |   6 DOTID      001A07 R
  6 DOTO1      0013FA R   |   6 DOTOK      0013E0 R   |   6 DOTPR      00110F R
  6 DOTQ       00165C R   |   6 DOTQP      000F8A R   |   6 DOTR       000F98 R
  6 DOTS       0019A9 R   |   6 DOTS1      0019B4 R   |   6 DOTS2      0019BD R
  6 DOVAR      00064B R   |   6 DO_DCONS   0018F0 R   |   6 DROP       000594 R
  6 DSLMOD     00265B R   |   6 DSLMOD3    002676 R   |   6 DSLMOD4    002682 R
  6 DSLMODa    00267D R   |   6 DSLMODb    002688 R   |   6 DSTOR      000B76 R
  6 DUMP       00195F R   |   6 DUMP1      001976 R   |   6 DUMP3      001998 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]

Symbol Table

  6 DUMPP      00192E R   |   6 DUPP       00059E R   |   6 DZEQUAL    00247A R
  6 EDIGS      000D55 R   |   6 EDOT       0026B4 R   |   6 EDOT1      0026DA R
  6 EDOT2      0026E0 R   |   6 EDOT3      0026F9 R   |   6 EDOT4      002725 R
  6 EDOT5      002741 R   |   6 EECSTORE   001D4C R   |   6 EEPCP      001B72 R
  6 EEPLAST    001B45 R   |   6 EEPROM     001B2D R   |     EEPROM_B=  004000 
    EEPROM_E=  0047FF     |     EEPROM_R=  000010     |     EEPROM_S=  000800 
  6 EEPRUN     001B5C R   |   6 EEPVP      001B88 R   |   6 EESTORE    001D98 R
  6 EE_CCOMM   002062 R   |   6 EE_COMMA   002041 R   |   6 EE_CREAD   001CDD R
  6 EE_READ    001CBB R   |   6 EI         0000BF R   |   6 ELSEE      0015BB R
  6 EMIT       000438 R   |   6 ENEPER     002282 R   |     EOL_CR  =  000001 
    EOL_LF  =  000000     |   6 EQ1        000850 R   |   6 EQUAL      00083A R
  6 ERASE      000C82 R   |     ERR     =  00001B     |   6 EVAL       001423 R
  6 EVAL1      001423 R   |   6 EVAL2      00143F R   |   6 EXE1       000C17 R
  6 EXECU      0004D3 R   |     EXT     =  000000     |     EXTI_CR1=  0050A0 
    EXTI_CR2=  0050A1     |   6 EXTRC      000CDC R   |   6 FADDR      00212F R
  6 FARAT      001BF3 R   |   6 FARCAT     001BFF R   |   6 FBASE      0023F2 R
  6 FC_XOFF    000465 R   |   6 FC_XON     00044F R   |   6 FER        00242E R
    FHSE    =  7A1200     |     FHSI    =  F42400     |   6 FILL       000C4F R
  6 FILL1      000C6C R   |   6 FILL2      000C75 R   |   6 FIND       0011C1 R
  6 FIND1      0011DF R   |   6 FIND2      00120D R   |   6 FIND3      001219 R
  6 FIND4      00122D R   |   6 FIND5      00123A R   |   6 FIND6      00121E R
  6 FINIT      002418 R   |     FLASH_BA=  008000     |     FLASH_CR=  00505A 
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
    FLASH_WS=  00480D     |     FLSI    =  01F400     |   6 FMOVE      00213A R
  6 FMOVE2     00216B R   |   6 FNE        002450 R   |   6 FOR        001538 R
  6 FORGET     00015C R   |   6 FORGET1    00018B R   |   6 FORGET2    000211 R
  6 FORGET4    00021A R   |   6 FORGET6    0001D3 R   |   6 FOV        002465 R
  6 FPSTOR     001B0E R   |   6 FPSW       0023E1 R   |     FPTR    =  000036 
  6 FREEVAR    000227 R   |   6 FREEVAR4   00025D R   |   6 FRESET     002404 R
  6 FZE        00243B R   |     GPIO_BAS=  005000     |     GPIO_CR1=  000003 
    GPIO_CR2=  000004     |     GPIO_DDR=  000002     |     GPIO_IDR=  000001 
    GPIO_ODR=  000000     |     GPIO_SIZ=  000005     |   6 HERE       000BD3 R
  6 HEX        000D8B R   |   6 HI         001A59 R   |   6 HLD        0006CB R
  6 HOLD       000D00 R   |     HSECNT  =  004809     |     I2C_CCRH=  00521C 
    I2C_CCRH=  000080     |     I2C_CCRH=  0000C0     |     I2C_CCRH=  000080 
    I2C_CCRH=  000000     |     I2C_CCRH=  000001     |     I2C_CCRH=  000000 
    I2C_CCRL=  00521B     |     I2C_CCRL=  00001A     |     I2C_CCRL=  000002 
    I2C_CCRL=  00000D     |     I2C_CCRL=  000050     |     I2C_CCRL=  000090 
    I2C_CCRL=  0000A0     |     I2C_CR1 =  005210     |     I2C_CR1_=  000006 
    I2C_CR1_=  000007     |     I2C_CR1_=  000000     |     I2C_CR2 =  005211 
    I2C_CR2_=  000002     |     I2C_CR2_=  000003     |     I2C_CR2_=  000000 
    I2C_CR2_=  000001     |     I2C_CR2_=  000007     |     I2C_DR  =  005216 
    I2C_FREQ=  005212     |     I2C_ITR =  00521A     |     I2C_ITR_=  000002 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]

Symbol Table

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
    I2C_TRIS=  000011     |     I2C_WRIT=  000000     |   6 ICOLON     0017EC R
  6 IFETCH     001556 R   |   6 IFF        001593 R   |   6 IFMOVE     002213 R
    IMEDD   =  000080     |   6 IMMED      0017FE R   |   6 INCH       00042C R
  6 INC_FPTR   001C88 R   |   6 INITOFS    0017B4 R   |   6 INN        000679 R
    INPUT_DI=  000000     |     INPUT_EI=  000001     |     INPUT_FL=  000000 
    INPUT_PU=  000001     |   6 INTE1      0013C2 R   |   6 INTER      001398 R
  6 INTQ       0023BC R   |     INT_ADC2=  000016     |     INT_AUAR=  000012 
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
  6 ISEMI      001749 R   |     ITC_SPR1=  007F70     |     ITC_SPR2=  007F71 
    ITC_SPR3=  007F72     |     ITC_SPR4=  007F73     |     ITC_SPR5=  007F74 
    ITC_SPR6=  007F75     |     ITC_SPR7=  007F76     |     ITC_SPR8=  007F77 
    IWDG_KR =  0050E0     |     IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2 
  6 JSRC       00179E R   |   6 KEY        000ECB R   |   6 KTAP       0012B2 R
  6 KTAP1      0012D5 R   |   6 KTAP2      0012D8 R   |   6 LAST       00070A R
  6 LASTN   =  0026B1 R   |   6 LBRAC      0013CF R   |     LED2_BIT=  000005 
    LED2_MAS=  000020     |     LED2_POR=  00500A     |   6 LESS       000877 R
    LF      =  00000A     |   6 LINK    =  0026B1 R   |   6 LITER      00150A R
  6 LN2S       0022DE R   |   6 LOCK       001C74 R   |   6 LOG2S      0022C8 R
  6 LSHIFT     000A97 R   |   6 LSHIFT1    000AA0 R   |   6 LSHIFT4    000AA8 R
  6 LT1        00088D R   |     MASKK   =  001F7F     |   6 MAX        000897 R
  6 MAX1       0008AA R   |   6 MIN        0008B4 R   |   6 MIN1       0008C7 R
  6 MMOD1      000950 R   |   6 MMOD2      000964 R   |   6 MMOD3      00097B R
  6 MMSM1      00090B R   |   6 MMSM3      00090F R   |   6 MMSM4      00091B R
  6 MMSMa      000916 R   |   6 MMSMb      000921 R   |   6 MODD       000995 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 135.
Hexadecimal [24-Bits]

Symbol Table

  6 MONE       000AFE R   |     MS      =  000032     |   6 MSEC       0002D2 R
  6 MSMOD      000933 R   |   6 MSTA1      000A26 R   |   6 MSTAR      000A03 R
    NAFR    =  004804     |   6 NAMEQ      00125A R   |   6 NAMET      00116B R
    NCLKOPT =  004808     |   6 NEGAT      0007C4 R   |   6 NEX1       00049A R
  6 NEXT       001547 R   |     NFLASH_W=  00480E     |     NHSECNT =  00480A 
    NOPT1   =  004802     |     NOPT2   =  004804     |     NOPT3   =  004806 
    NOPT4   =  004808     |     NOPT5   =  00480A     |     NOPT6   =  00480C 
    NOPT7   =  00480E     |     NOPTBL  =  00487F     |   6 NROT       002639 R
  6 NTIB       000689 R   |     NUBC    =  004802     |     NUCLEO  =  000001 
  6 NUFQ       000EE1 R   |   6 NUFQ1      000EFA R   |   6 NUMBQ      000DF8 R
  6 NUMQ1      000E2C R   |   6 NUMQ2      000E5D R   |   6 NUMQ3      000E9F R
  6 NUMQ4      000EA4 R   |   6 NUMQ5      000EB3 R   |   6 NUMQ6      000EB6 R
    NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC 
    NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE     |   6 NonHandl   000000 R
  6 OFFSET     00072F R   |     OFS     =  000005     |   6 ONE        000AF0 R
  6 ONEM       000A86 R   |   6 ONEP       000A79 R   |     OPT     =  000002 
    OPT0    =  004800     |     OPT1    =  004801     |     OPT2    =  004803 
    OPT3    =  004805     |     OPT4    =  004807     |     OPT5    =  004809 
    OPT6    =  00480B     |     OPT7    =  00480D     |     OPTBL   =  00487E 
    OPTIMIZE=  000001     |     OPTION_B=  004800     |     OPTION_E=  00487F 
    OPTION_S=  000080     |   6 ORIG       00004B R   |   6 ORR        0005FE R
  6 OUTPUT     00043D R   |     OUTPUT_F=  000001     |     OUTPUT_O=  000000 
    OUTPUT_P=  000001     |     OUTPUT_S=  000000     |   6 OVER       0005C8 R
  6 OVERT      001717 R   |     PA      =  000000     |   6 PACKS      000C93 R
  6 PAD        000BE4 R   |   6 PAREN      00111E R   |   6 PARS       001017 R
  6 PARS1      001042 R   |   6 PARS2      00106D R   |   6 PARS3      001070 R
  6 PARS4      001079 R   |   6 PARS5      00109C R   |   6 PARS6      0010B1 R
  6 PARS7      0010C0 R   |   6 PARS8      0010CF R   |   6 PARSE      0010E0 R
  6 PAUSE      0002E2 R   |     PA_BASE =  005000     |     PA_CR1  =  005003 
    PA_CR2  =  005004     |     PA_DDR  =  005002     |     PA_IDR  =  005001 
    PA_ODR  =  005000     |     PB      =  000005     |     PB_BASE =  005005 
    PB_CR1  =  005008     |     PB_CR2  =  005009     |     PB_DDR  =  005007 
    PB_IDR  =  005006     |     PB_ODR  =  005005     |     PC      =  00000A 
    PC_BASE =  00500A     |     PC_CR1  =  00500D     |     PC_CR2  =  00500E 
    PC_DDR  =  00500C     |     PC_IDR  =  00500B     |     PC_ODR  =  00500A 
    PD      =  00000F     |   6 PDUM1      001941 R   |   6 PDUM2      001952 R
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
    PH_ODR  =  005023     |     PI      =  000028     |   6 PICK       000B3E R
  6 PII        002241 R   |     PI_BASE =  005028     |     PI_CR1  =  00502B 
    PI_CR2  =  00502C     |     PI_DDR  =  00502A     |     PI_IDR  =  005029 
    PI_ODR  =  005028     |   6 PLUS       000799 R   |   6 PNAM1      0016CC R
  6 POSMANT    0025A8 R   |   6 PRESE      00144E R   |     PROD1   =  000026 
    PROD2   =  000028     |     PROD3   =  00002A     |   6 PROTECTE   000203 R
  6 PSTOR      000B55 R   |     PTR16   =  000037     |     PTR8    =  000038 
  6 PTRPLUS    001CA0 R   |   6 QBRAN      0004AC R   |   6 QDUP       000748 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 136.
Hexadecimal [24-Bits]

Symbol Table

  6 QDUP1      000752 R   |   6 QKEY       00041A R   |   6 QSTAC      001406 R
  6 QUERY      001332 R   |   6 QUEST      001009 R   |   6 QUIT       00146B R
  6 QUIT1      001473 R   |   6 QUIT2      001476 R   |   6 RAM2EE     0020DB R
    RAMBASE =  000000     |   6 RAMLAST    00071D R   |     RAM_BASE=  000000 
    RAM_END =  0017FF     |     RAM_SIZE=  001800     |   6 RANDOM     000280 R
  6 RAT        00055B R   |   6 RBRAC      00178B R   |   6 REPEA      001610 R
  6 RFREE      0020C2 R   |   6 RFROM      000548 R   |     ROP     =  004800 
  6 ROT        000759 R   |   6 ROW2BUF    002084 R   |     ROWBUFF =  001680 
    RP0     =  000030     |   6 RPAT       000525 R   |     RPP     =  0017FF 
  6 RPSTO      000532 R   |   6 RSHIFT     000AB3 R   |   6 RSHIFT1    000ABC R
  6 RSHIFT4    000AC4 R   |     RST_SR  =  0050B3     |   6 RT12_2     0022B1 R
  6 SAME1      001189 R   |   6 SAME2      0011B2 R   |   6 SAMEQ      001181 R
  6 SCOM1      001701 R   |   6 SCOM2      001704 R   |   6 SCOMP      0016E3 R
  6 SEED       000267 R   |     SEEDX   =  00003A     |     SEEDY   =  00003C 
  6 SEMIS      001727 R   |   6 SETISP     0000D2 R   |   6 SET_RAML   00186E R
  6 SFN        002515 R   |     SFR_BASE=  005000     |     SFR_END =  0057FF 
  6 SFV        00254D R   |   6 SFZ        0024DE R   |   6 SIGN       000D3F R
  6 SIGN1      000D4F R   |   6 SLASH      00099F R   |   6 SLMOD      000983 R
  6 SNAME      001696 R   |     SP0     =  00002E     |   6 SPACE      000F03 R
  6 SPACS      000F12 R   |   6 SPAT       00057E R   |     SPI_CR1 =  005200 
    SPI_CR2 =  005201     |     SPI_CRCP=  005205     |     SPI_DR  =  005204 
    SPI_ICR =  005202     |     SPI_RXCR=  005206     |     SPI_SR  =  005203 
    SPI_TXCR=  005207     |     SPP     =  001680     |     SPSAVE  =  000001 
  6 SPSTO      00058B R   |   6 SQRT10     00229A R   |   6 SQRT2      002258 R
  6 SQRT3      00226F R   |   6 SSMOD      000A2F R   |     SSP     =  000001 
    STACK   =  0017FF     |   6 STAR       0009F8 R   |   6 STASL      000A40 R
  6 STEXP      0025B8 R   |   6 STEXP1     0025CE R   |   6 STEXP2     00260A R
  6 STEXP3     00261D R   |   6 STOD       0007FB R   |   6 STORE      0004E0 R
  6 STR        000D6D R   |   6 STRCQ      001518 R   |   6 STRQ       00164F R
  6 STRQP      000F80 R   |   6 SUBB       000812 R   |   6 SWAPP      0005AE R
    SWIM_CSR=  007F80     |   6 TAP        00129C R   |   6 TBOOT      001A90 R
  6 TBUF       000699 R   |     TBUFFBAS=  001680     |   6 TCHAR      000B0F R
  6 TEMP       00066A R   |   6 TEVAL      0006BC R   |   6 TFLASH     0006AB R
  6 THENN      0015A8 R   |   6 TIB        000BF5 R   |     TIBB    =  001700 
    TIBBASE =  001700     |     TIC     =  000027     |   6 TICK       001482 R
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 137.
Hexadecimal [24-Bits]

Symbol Table

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
    TIM2_CCE=  005308     |     TIM2_CCE=  000000     |     TIM2_CCE=  000001 
    TIM2_CCE=  000004     |     TIM2_CCE=  000005     |     TIM2_CCE=  005309 
    TIM2_CCM=  005305     |     TIM2_CCM=  005306     |     TIM2_CCM=  005307 
    TIM2_CCM=  000000     |     TIM2_CCM=  000004     |     TIM2_CCM=  000003 
    TIM2_CCR=  00530F     |     TIM2_CCR=  005310     |     TIM2_CCR=  005311 
    TIM2_CCR=  005312     |     TIM2_CCR=  005313     |     TIM2_CCR=  005314 
    TIM2_CNT=  00530A     |     TIM2_CNT=  00530B     |     TIM2_CR1=  005300 
    TIM2_CR1=  000007     |     TIM2_CR1=  000000     |     TIM2_CR1=  000003 
    TIM2_CR1=  000001     |     TIM2_CR1=  000002     |     TIM2_EGR=  005304 
    TIM2_EGR=  000001     |     TIM2_EGR=  000002     |     TIM2_EGR=  000003 
    TIM2_EGR=  000006     |     TIM2_EGR=  000000     |     TIM2_IER=  005301 
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
    TIM3_IER=  005321     |     TIM3_PSC=  00532A     |     TIM3_SR1=  005322 
    TIM3_SR2=  005323     |     TIM4_ARR=  005346     |     TIM4_CNT=  005344 
    TIM4_CR1=  005340     |     TIM4_CR1=  000007     |     TIM4_CR1=  000000 
    TIM4_CR1=  000003     |     TIM4_CR1=  000001     |     TIM4_CR1=  000002 
    TIM4_EGR=  005343     |     TIM4_EGR=  000000     |     TIM4_IER=  005341 
    TIM4_IER=  000000     |     TIM4_PSC=  005345     |     TIM4_PSC=  000000 
    TIM4_PSC=  000007     |     TIM4_PSC=  000004     |     TIM4_PSC=  000001 
    TIM4_PSC=  000005     |     TIM4_PSC=  000002     |     TIM4_PSC=  000006 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 138.
Hexadecimal [24-Bits]

Symbol Table

    TIM4_PSC=  000003     |     TIM4_PSC=  000000     |     TIM4_PSC=  000001 
    TIM4_PSC=  000002     |     TIM4_SR =  005342     |     TIM4_SR_=  000000 
  6 TIMEOUTQ   000312 R   |   6 TIMER      0002FC R   |     TIM_CR1_=  000007 
    TIM_CR1_=  000000     |     TIM_CR1_=  000006     |     TIM_CR1_=  000005 
    TIM_CR1_=  000004     |     TIM_CR1_=  000003     |     TIM_CR1_=  000001 
    TIM_CR1_=  000002     |   6 TNAM2      0019D7 R   |   6 TNAM3      0019F5 R
  6 TNAM4      0019FB R   |   6 TNAME      0019D4 R   |   6 TOFLASH    000337 R
  6 TOKEN      00115D R   |   6 TOR        000567 R   |   6 TORAM      000377 R
    TRUEE   =  00FFFF     |   6 TWOSL      000ACB R   |   6 TYPE1      000F32 R
  6 TYPE2      000F3E R   |   6 TYPES      000F2D R   |   6 Timer4Ha   000005 R
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
    UART_BRR=  005232     |     UART_BRR=  005233     |     UART_CR1=  005234 
    UART_CR1=  000004     |     UART_CR1=  000002     |     UART_CR1=  000000 
    UART_CR1=  000001     |     UART_CR1=  000007     |     UART_CR1=  000006 
    UART_CR1=  000005     |     UART_CR1=  000003     |     UART_CR2=  005235 
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
    UART_CR6=  000005     |     UART_DR =  005231     |     UART_GTR=  000009 
    UART_PSC=  00000A     |     UART_SR =  005230     |     UART_SR_=  000001 
    UART_SR_=  000004     |     UART_SR_=  000002     |     UART_SR_=  000003 
    UART_SR_=  000000     |     UART_SR_=  000005     |     UART_SR_=  000006 
    UART_SR_=  000007     |     UBASE   =  000006     |     UBC     =  004801 
    UCNTXT  =  000018     |     UCP     =  00001C     |     UCTIB   =  000010 
    UD1     =  000001     |     UD2     =  000002     |     UD3     =  000003 
    UD4     =  000004     |   6 UDOT       000FD3 R   |   6 UDOTR      000FB3 R
  6 UEND       000049 R   |     UFBASE  =  000008     |     UFPSW   =  00000A 
  6 UGREAT     0024BC R   |   6 UGREAT1    0024D4 R   |     UHLD    =  000016 
    UINN    =  00000E     |     UINTER  =  000014     |     ULAST   =  00001E 
  6 ULES1      00086F R   |   6 ULESS      000859 R   |   6 UMMOD      0008EF R
  6 UMSTA      0009AE R   |   6 UNIQ1      00168D R   |   6 UNIQU      00166E R
  6 UNLKEE     001C0E R   |   6 UNLKFL     001C2D R   |   6 UNLOCK     001C4C R
  6 UNTIL      001570 R   |     UOFFSET =  000020     |   6 UPDATCP    001BCB R
  6 UPDATLAS   001BA2 R   |   6 UPDATPTR   0021CE R   |   6 UPDATRUN   001BBA R
  6 UPDATVP    001BE2 R   |   6 UPL1       00063F R   |   6 UPLUS      000628 R
    UPP     =  000006     |     URLAST  =  000024     |     USR_BTN_=  000004 
    USR_BTN_=  000010     |     USR_BTN_=  005015     |     UTFLASH =  000022 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
Hexadecimal [24-Bits]

Symbol Table

    UTIB    =  000012     |     UTMP    =  00000C     |   6 UTYP1      001911 R
  6 UTYP2      001920 R   |   6 UTYPE      00190C R   |     UVP     =  00001A 
  6 UZERO      00002B R   |   6 VARIA      00183B R   |     VAR_BASE=  000080 
    VAR_TOP =  0017BF     |     VER     =  000003     |   6 VPP        0006EC R
    VSIZE   =  000006     |     WANT_CON=  000001     |     WANT_DEB=  000000 
    WANT_FLO=  000001     |     WANT_SCA=  000001     |     WANT_SEE=  000000 
    WDGOPT  =  004805     |     WDGOPT_I=  000002     |     WDGOPT_L=  000003 
    WDGOPT_W=  000000     |     WDGOPT_W=  000001     |   6 WHILE      0015F6 R
  6 WITHI      0008D4 R   |   6 WORDD      001149 R   |   6 WORDS      001A31 R
  6 WORS1      001A37 R   |   6 WORS2      001A53 R   |   6 WR_BYTE    001CF7 R
  6 WR_WORD    001D1C R   |   6 WTABLE     002326 R   |   6 WTAT       00234A R
  6 WTINIT     00238F R   |     WWDG_CR =  0050D1     |     WWDG_WR =  0050D2 
    XMEM_SIZ=  017830     |     XOFF    =  000013     |     XON     =  000011 
  6 XORR       000613 R   |     XTEMP   =  000026     |     YTEMP   =  000028 
  6 ZEQ1       002486 R   |   6 ZERO       000AE5 R   |   6 ZL1        0005E0 R
  6 ZLESS      0005D7 R   |   6 app_spac   002780 R   |   6 baudrate   00037D R
  6 block_er   001DE2 R   |   6 clear_ra   000019 R   |   6 clock_in   000066 R
  6 copy_buf   001E42 R   |   6 copy_buf   001E61 R   |   6 copy_pro   001E61 R
    da      =  000002     |     db      =  000003     |     dc      =  000000 
    dd      =  000001     |   6 erase_fl   001E04 R   |   6 fmove_do   0021B7 R
  6 main       000016 R   |   6 next_row   002174 R   |   6 no_move    0021BE R
  6 pristine   001EE2 R   |   6 proceed_   001E07 R   |   6 reboot     000329 R
  6 reset_ve   001F49 R   |   6 row_eras   001DC2 R   |   6 row_eras   001E1B R
  6 row_eras   001E42 R   |   6 set_opti   001EB6 R   |   6 set_vect   001FEA R
  6 uart_ini   000078 R   |   6 write_ro   001E86 R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 DATA       size      0   flags    8
   2 DATA0      size      0   flags    8
   3 SSEG       size      0   flags    8
   4 SSEG1      size    100   flags    8
   5 HOME       size     80   flags    0
   6 CODE       size   2780   flags    0

