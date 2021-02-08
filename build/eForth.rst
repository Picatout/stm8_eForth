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
                           000008   112 UTMP = UBASE+2    ; temporary storage
                           00000A   113 UINN = UTMP+2     ; >IN tib pointer 
                           00000C   114 UCTIB = UINN+2    ; tib count 
                           00000E   115 UTIB = UCTIB+2    ; tib address 
                           000010   116 UINTER = UTIB+2   ; interpreter vector 
                           000012   117 UHLD = UINTER+2   ; hold 
                           000014   118 UCNTXT = UHLD+2   ; context, dictionary first link 
                           000016   119 UVP = UCNTXT+2    ; variable pointer 
                           000018   120 UCP = UVP+2      ; code pointer
                           00001A   121 ULAST = UCP+2    ; last dictionary pointer 
                           00001C   122 UOFFSET = ULAST+2 ; distance between CP and VP to adjust jump address at compile time.
                           00001E   123 UTFLASH = UOFFSET+2 ; select where between FLASH and RAM for compilation destination. 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 4.
Hexadecimal [24-Bits]



                           000020   124 URLAST = UTFLASH+2 ; context for dictionary in RAM memory 
                                    125 
                                    126 ;******  System Variables  ******
                           000022   127 XTEMP	=	URLAST +2;address called by CREATE
                           000024   128 YTEMP	=	XTEMP+2	;address called by CREATE
                           000022   129 PROD1 = XTEMP	;space for UM*
                           000024   130 PROD2 = PROD1+2
                           000026   131 PROD3 = PROD2+2
                           000028   132 CARRY = PROD3+2
                           00002A   133 SP0	= CARRY+2	;initial data stack pointer
                           00002C   134 RP0	= SP0+2		;initial return stack pointer
                           00002E   135 MS    =   RP0+2         ; millisecond counter 
                           000030   136 CNTDWN =  MS+2          ; count down timer 
                           000032   137 FPTR = CNTDWN+2         ; 24 bits farptr 
                           000033   138 PTR16 = FPTR+1          ; middle byte of farptr 
                           000034   139 PTR8 = FPTR+2           ; least byte of farptr 
                           000036   140 SEEDX = PTR8+2          ; PRNG seed X 
                           000038   141 SEEDY = SEEDX+2         ; PRNG seed Y 
                                    142 
                                    143 ; EEPROM persistant data  
                           004000   144 APP_LAST = EEPROM_BASE ; Application last word pointer  
                           004002   145 APP_RUN = APP_LAST+2   ; application autorun address 
                           004004   146 APP_CP = APP_RUN+2   ; free application space pointer 
                           004006   147 APP_VP = APP_CP+2  ; free data space pointer 
                                    148 
                                    149 
                                    150 ;***********************************************
                                    151 ;; Version control
                                    152 
                           000003   153 VER     =     3         ;major release version
                           000000   154 EXT     =     0         ;minor extension
                                    155 
                                    156 ;; Constants
                                    157 
                           00FFFF   158 TRUEE   =     0xFFFF      ;true flag
                                    159 
                           000040   160 COMPO   =     0x40     ;lexicon compile only bit
                           000080   161 IMEDD   =     0x80     ;lexicon immediate bit
                           001F7F   162 MASKK   =     0x1F7F  ;lexicon bit mask
                                    163 
                           000002   164 CELLL   =     2       ;size of a cell
                           00000A   165 BASEE   =     10      ;default radix
                           000008   166 BKSPP   =     8       ;back space
                           00000A   167 LF      =     10      ;line feed
                           00000D   168 CRR     =     13      ;carriage return
                           000011   169 XON     =     17
                           000013   170 XOFF    =     19
                           00001B   171 ERR     =     27      ;error escape
                           000027   172 TIC     =     39      ;tick
                           0000CD   173 CALLL   =     0xCD     ;CALL opcodes
                           000080   174 IRET_CODE =   0x80    ; IRET opcode 
                                    175 
                                    176         .macro _ledon
                                    177         .if NUCLEO
                                    178         bset PC_ODR,#LED2_BIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 5.
Hexadecimal [24-Bits]



                                    179         .else ;DISCOVERY 
                                    180         .if DISCOVERY
                                    181         bres PD_ODR,#LD1_BIT 
                                    182         .endif
                                    183         .endif
                                    184         .endm
                                    185 
                                    186         .macro _ledoff
                                    187         .if NUCLEO 
                                    188         bres PC_ODR,#LED2_BIT
                                    189         .else ;DISCOVERY 
                                    190         .if DISCOVERY
                                    191         bset PD_ODR,#LD1_BIT 
                                    192         .endif 
                                    193         .endif
                                    194         .endm
                                    195 
                                    196 ;**********************************************************
                                    197         .area DATA (ABS)
      000000                        198         .org RAMBASE 
                                    199 ;**********************************************************
                                    200 
                                    201 ;**********************************************************
                                    202         .area SSEG (ABS) ; STACK
      001700                        203         .org 0x1700
      001700                        204         .ds 256 
                                    205 ; space for DATSTK,TIB and STACK         
                                    206 ;**********************************************************
                                    207 
                                    208 ;**********************************************************
                                    209         .area HOME ; vectors table
                                    210 ;**********************************************************
      008000 82 00 80 96            211 	int main	        ; reset
      008004 82 00 80 80            212 	int NonHandledInterrupt	; trap
      008008 82 00 80 80            213 	int NonHandledInterrupt	; irq0
      00800C 82 00 80 80            214 	int NonHandledInterrupt	; irq1
      008010 82 00 80 80            215 	int NonHandledInterrupt	; irq2
      008014 82 00 80 80            216 	int NonHandledInterrupt	; irq3
      008018 82 00 80 80            217 	int NonHandledInterrupt	; irq4
      00801C 82 00 80 80            218 	int NonHandledInterrupt	; irq5
      008020 82 00 80 80            219 	int NonHandledInterrupt	; irq6
      008024 82 00 80 80            220 	int NonHandledInterrupt	; irq7
      008028 82 00 80 80            221 	int NonHandledInterrupt	; irq8
      00802C 82 00 80 80            222 	int NonHandledInterrupt	; irq9
      008030 82 00 80 80            223 	int NonHandledInterrupt	; irq10
      008034 82 00 80 80            224 	int NonHandledInterrupt	; irq11
      008038 82 00 80 80            225 	int NonHandledInterrupt	; irq12
      00803C 82 00 80 80            226 	int NonHandledInterrupt	; irq13
      008040 82 00 80 80            227 	int NonHandledInterrupt	; irq14
      008044 82 00 80 80            228 	int NonHandledInterrupt	; irq15
      008048 82 00 80 80            229 	int NonHandledInterrupt	; irq16
      00804C 82 00 80 80            230 	int NonHandledInterrupt	; irq17
      008050 82 00 80 80            231 	int NonHandledInterrupt	; irq18
      008054 82 00 80 80            232 	int NonHandledInterrupt	; irq19
      008058 82 00 80 80            233 	int NonHandledInterrupt	; irq20
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 6.
Hexadecimal [24-Bits]



      00805C 82 00 80 80            234 	int NonHandledInterrupt	; irq21
      008060 82 00 80 80            235 	int NonHandledInterrupt	; irq22
      008064 82 00 80 85            236 	int Timer4Handler	; irq23
      008068 82 00 80 80            237 	int NonHandledInterrupt	; irq24
      00806C 82 00 80 80            238 	int NonHandledInterrupt	; irq25
      008070 82 00 80 80            239 	int NonHandledInterrupt	; irq26
      008074 82 00 80 80            240 	int NonHandledInterrupt	; irq27
      008078 82 00 80 80            241 	int NonHandledInterrupt	; irq28
      00807C 82 00 80 80            242 	int NonHandledInterrupt	; irq29
                                    243 
                                    244 ;**********************************************************
                                    245         .area CODE
                                    246 ;**********************************************************
                                    247 
                                    248 ; non handled interrupt reset MCU
      008080                        249 NonHandledInterrupt:
      008080 A6 80            [ 1]  250         ld a, #0x80
      008082 C7 50 D1         [ 1]  251         ld WWDG_CR,a ; WWDG_CR used to reset mcu
                                    252 	;iret
                                    253 
                                    254 ; used for milliseconds counter 
                                    255 ; MS is 16 bits counter 
      008085                        256 Timer4Handler:
      008085 72 5F 53 42      [ 1]  257 	clr TIM4_SR 
      008089 BE 2E            [ 2]  258         ldw x,MS 
      00808B 5C               [ 1]  259         incw x 
      00808C BF 2E            [ 2]  260         ldw MS,x
      00808E BE 30            [ 2]  261         ldw x,CNTDWN 
      008090 27 03            [ 1]  262         jreq 1$
      008092 5A               [ 2]  263         decw x 
      008093 BF 30            [ 2]  264         ldw CNTDWN,x 
      008095                        265 1$:         
      008095 80               [11]  266         iret 
                                    267 
                                    268 
                                    269 ;; Main entry points and COLD start data
      008096                        270 main:
                                    271 ; clear all RAM
      008096 AE 00 00         [ 2]  272 	ldw X,#RAMBASE
      008099                        273 clear_ram0:
      008099 7F               [ 1]  274 	clr (X)
      00809A 5C               [ 1]  275 	incw X
      00809B A3 17 FF         [ 2]  276 	cpw X,#RAM_END
      00809E 23 F9            [ 2]  277 	jrule clear_ram0
      0080A0 AE 17 FF         [ 2]  278         ldw x,#RPP
      0080A3 94               [ 1]  279         ldw sp,x
                                    280 ; set SEEDX and SEEDY to 1 
      0080A4 3C 37            [ 1]  281         inc SEEDX+1 
      0080A6 3C 39            [ 1]  282         inc SEEDY+1          
      0080A8 CC 80 C7         [ 2]  283 	jp ORIG
                                    284 
                                    285 ; COLD initialize these variables.
      0080AB                        286 UZERO:
      0080AB 00 0A                  287         .word      BASEE   ;BASE
      0080AD 00 00                  288         .word      0       ;tmp
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 7.
Hexadecimal [24-Bits]



      0080AF 00 00                  289         .word      0       ;>IN
      0080B1 00 00                  290         .word      0       ;#TIB
      0080B3 17 00                  291         .word      TIBB    ;TIB
      0080B5 94 19                  292         .word      INTER   ;'EVAL
      0080B7 00 00                  293         .word      0       ;HLD
      0080B9 A4 35                  294         .word      LASTN  ;CNTXT pointer
      0080BB 00 80                  295         .word      VAR_BASE   ;variables free space pointer 
      0080BD A4 80                  296         .word      app_space ; FLASH free space pointer 
      0080BF A4 35                  297         .word      LASTN   ;LAST
      0080C1 00 00                  298         .word      0        ; OFFSET 
      0080C3 00 00                  299         .word      0       ; TFLASH
                                    300 ;       .word      0       ; URLAST   
      0080C5 00 00                  301 UEND:   .word      0
                                    302 
      0080C7                        303 ORIG:   
                                    304 ; initialize SP
      0080C7 AE 17 FF         [ 2]  305         LDW     X,#STACK  ;initialize return stack
      0080CA 94               [ 1]  306         LDW     SP,X
      0080CB BF 2C            [ 2]  307         LDW     RP0,X
      0080CD AE 16 80         [ 2]  308         LDW     X,#DATSTK ;initialize data stack
      0080D0 BF 2A            [ 2]  309         LDW     SP0,X
                           000001   310 .if NUCLEO        
                                    311 ; initialize PC_5 as output to control LED2
                                    312 ; added by Picatout 
      0080D2 72 1A 50 0D      [ 1]  313         bset PC_CR1,#LED2_BIT
      0080D6 72 1A 50 0E      [ 1]  314         bset PC_CR2,#LED2_BIT
      0080DA 72 1A 50 0C      [ 1]  315         bset PC_DDR,#LED2_BIT
                                    316 .endif 
                           000000   317 .if DISCOVERY
                                    318         bset PD_CR1,#LD1_BIT
                                    319         bset PD_CR2,#LD1_BIT
                                    320         bset PD_DDR,#LD1_BIT 
                                    321 .endif
      00005E                        322         _ledoff
                           000001     1         .if NUCLEO 
      0080DE 72 1B 50 0A      [ 1]    2         bres PC_ODR,#LED2_BIT
                           000000     3         .else ;DISCOVERY 
                                      4         .if DISCOVERY
                                      5         bset PD_ODR,#LD1_BIT 
                                      6         .endif 
                                      7         .endif
                                    323 ; initialize clock to HSI
                                    324 ; no divisor 16Mhz 
                                    325 ; Added by Picatout 
      0080E2                        326 clock_init:
      0080E2 72 5F 50 C6      [ 1]  327         clr CLK_CKDIVR
      0080E6 72 12 50 C5      [ 1]  328 	bset CLK_SWCR,#CLK_SWCR_SWEN
                           000001   329 .if NUCLEO|DOORBELL
      0080EA A6 E1            [ 1]  330 	ld a,#CLK_SWR_HSI
                           000000   331 .else ; DISCOVERY as 16Mhz crystal
                                    332 	ld a,#CLK_SWR_HSE
                                    333 .endif 
      0080EC C7 50 C4         [ 1]  334 	ld CLK_SWR,a
      0080EF C1 50 C3         [ 1]  335 1$:	cp a,CLK_CMSR
      0080F2 26 FB            [ 1]  336 	jrne 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 8.
Hexadecimal [24-Bits]



                                    337         
                                    338 ; initialize UART, 115200 8N1
      0080F4                        339 uart_init:
                           000001   340 .if NUCLEO 
      0080F4 72 14 50 C7      [ 1]  341 	bset CLK_PCKENR1,#CLK_PCKENR1_UART1
                                    342 	; configure tx pin
      0080F8 72 1A 50 02      [ 1]  343 	bset PA_DDR,#UART1_TX_PIN ; tx pin
      0080FC 72 1A 50 03      [ 1]  344 	bset PA_CR1,#UART1_TX_PIN ; push-pull output
      008100 72 1A 50 04      [ 1]  345 	bset PA_CR2,#UART1_TX_PIN ; fast output
                                    346 	; baud rate 115200 Fmaster=16Mhz  16000000/115200=139=0x8b
                           000000   347 .else ; DISCOVERY use UART2 
                                    348 	bset CLK_PCKENR1,#CLK_PCKENR1_UART2
                                    349 	; configure tx pin
                                    350 	bset PD_DDR,#UART2_TX_PIN ; tx pin
                                    351 	bset PD_CR1,#UART2_TX_PIN ; push-pull output
                                    352 	bset PD_CR2,#UART2_TX_PIN ; fast output
                                    353 .endif
                                    354 ; baud rate 115200 Fmaster=8Mhz  
      008104 35 0B 52 33      [ 1]  355 	mov UART_BRR2,#0x0b ; must be loaded first
      008108 35 08 52 32      [ 1]  356 	mov UART_BRR1,#0x8
      00810C 35 0C 52 35      [ 1]  357 	mov UART_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN));|(1<<UART_CR2_RIEN))
                                    358 ; initialize timer4, used for millisecond interrupt  
      008110 35 07 53 45      [ 1]  359 	mov TIM4_PSCR,#7 ; prescale 128  
      008114 35 7D 53 46      [ 1]  360 	mov TIM4_ARR,#125 ; set for 1msec.
      008118 35 05 53 40      [ 1]  361 	mov TIM4_CR1,#((1<<TIM4_CR1_CEN)|(1<<TIM4_CR1_URS))
      00811C 72 10 53 41      [ 1]  362 	bset TIM4_IER,#TIM4_IER_UIE 
                                    363 ; set TIM4 interrupt priority to highest
      008120 A6 3F            [ 1]  364         ld a,#~(IPR_MASK<<6)
      008122 C4 7F 75         [ 1]  365         and a,ITC_SPR6
      008125 AA C0            [ 1]  366         or a,#(IPR3<<6)
      008127 C7 7F 75         [ 1]  367         ld ITC_SPR6,a 
      00812A 9A               [ 1]  368         rim
      00812B CC 9B 1D         [ 2]  369         jp  COLD   ;default=MN1
                                    370 
                                    371 
                                    372 ;; place MCU in sleep mode with
                                    373 ;; halt opcode 
                                    374 ;; BYE ( -- )
      00812E 00 00                  375         .word 0
                           0000B0   376         LINK=.
      008130 03                     377         .byte 3 
      008131 42 59 45               378         .ascii "BYE"
      008134                        379 BYE: 
      008134 8E               [10]  380         halt 
      008135 81               [ 4]  381         ret 
                                    382 
                                    383 ; Enable interrupts 
                                    384 ; EI ( -- )
      008136 81 30                  385         .word LINK 
                           0000B8   386         LINK=.
      008138 02                     387         .byte 2
      008139 45 49                  388         .ascii "EI"
      00813B                        389 EI:
      00813B 9A               [ 1]  390         rim 
      00813C 81               [ 4]  391         ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 9.
Hexadecimal [24-Bits]



                                    392 
                                    393 ; Disable interrupts
                                    394 ; DI ( -- )
      00813D 81 38                  395         .word LINK 
                           0000BF   396         LINK=.
      00813F 02                     397         .byte 2 
      008140 44 49                  398         .ascii "DI"
      008142                        399 DI:
      008142 9B               [ 1]  400         sim 
      008143 81               [ 4]  401         ret 
                                    402 
                                    403 ; set interrupt priority level 
                                    404 ; SET-ISP ( n1 n2 -- )
                                    405 ; n1 level {1..3}
                                    406 ; n2 vector {0..29}
      008144 81 3F                  407         .word LINK 
                           0000C6   408         LINK=.
      008146 07                     409         .byte 7 
      008147 53 45 54 2D 49 53 50   410         .ascii "SET-ISP"
      00814E                        411 SETISP:
      00814E 90 93            [ 1]  412         ldw y,x 
      008150 90 FE            [ 2]  413         ldw y,(y)
      008152 A6 04            [ 1]  414         ld a,#4 ; 4 slot per register 
                                    415 ;  quotient select register, remainder select slot in register.        
      008154 90 62            [ 2]  416         div y,a ; register=ITC_SPR1[Y], lshift=2*A 
      008156 A4 03            [ 1]  417         and a,#3 
      008158 48               [ 1]  418         sll a ; 2*SLOT  lshift 
      008159 72 A9 7F 70      [ 2]  419         addw y,#ITC_SPR1 
      00815D FF               [ 2]  420         ldw (x),y  ; ( level reg -- )
      00815E 90 5F            [ 1]  421         clrw y 
      008160 90 97            [ 1]  422         ld yl,a 
      008162 1D 00 02         [ 2]  423         subw x,#CELLL 
      008165 FF               [ 2]  424         ldw (x),y  ; ( level reg lshift -- )
      008166 90 93            [ 1]  425         ldw y,x 
      008168 90 EE 02         [ 2]  426         ldw y,(2,y) 
      00816B 90 F6            [ 1]  427         ld a,(y)   ; reg_value
      00816D 1D 00 02         [ 2]  428         subw x,#CELLL 
      008170 FF               [ 2]  429         ldw (x),y ; ( level reg lshift rval -- )
      008171 CD 86 44         [ 4]  430         call OVER ; ( level reg lshift rval lshift -- )
      008174 CD 84 F5         [ 4]  431         call DOLIT 
      008177 00 03                  432         .word 3
      008179 CD 86 2A         [ 4]  433         call SWAPP  ; ( level reg lshift rval 3 lshift )
      00817C CD 8B 18         [ 4]  434         call LSHIFT ; creat slot mask 
      00817F CD 88 2F         [ 4]  435         call INVER  ; ( level reg lshift rval mask )
      008182 CD 86 66         [ 4]  436         call ANDD ; ( level reg lshift slot_masked )
      008185 CD 85 E3         [ 4]  437         call TOR  ; ( level reg lshift -- R: slot_masked )
      008188 CD 87 D5         [ 4]  438         call ROT  ; ( reg lshift level )
      00818B CD 86 2A         [ 4]  439         call SWAPP ; ( reg level lshift )
      00818E CD 8B 18         [ 4]  440         call LSHIFT  ; ( reg slot_level -- )
      008191 CD 85 C4         [ 4]  441         call RFROM ; ( reg slot_level masked_val )
      008194 CD 86 7A         [ 4]  442         call ORR   ; ( reg updated_rval )
      008197 CD 86 2A         [ 4]  443         call SWAPP 
      00819A CD 85 80         [ 4]  444         call CSTOR
                                    445 
                                    446 ; sélectionne l'application 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



                                    447 ; qui démarre automatique lors 
                                    448 ; d'un COLD start 
      00819D 81 46                  449         .word LINK 
                           00011F   450         LINK=.
      00819F 07                     451         .byte 7
      0081A0 41 55 54 4F 52 55 4E   452         .ascii "AUTORUN"
      0081A7                        453 AUTORUN:
      0081A7 CD 91 DE         [ 4]  454         call TOKEN 
      0081AA CD 86 1A         [ 4]  455         call DUPP 
      0081AD CD 85 28         [ 4]  456         call QBRAN 
      0081B0 82 8D                  457         .word FORGET2
      0081B2 CD 92 DB         [ 4]  458         call NAMEQ
      0081B5 CD 87 C4         [ 4]  459         call QDUP 
      0081B8 CD 85 28         [ 4]  460         call QBRAN 
      0081BB 82 8D                  461         .word FORGET2
      0081BD CD 86 10         [ 4]  462         call DROP 
      0081C0 1D 00 04         [ 2]  463         subw x,#2*CELLL 
      0081C3 90 5F            [ 1]  464         clrw y 
      0081C5 FF               [ 2]  465         ldw (x),y 
      0081C6 90 AE 40 02      [ 2]  466         ldw y,#APP_RUN 
      0081CA EF 02            [ 2]  467         ldw (2,x),y 
      0081CC CC 9E 16         [ 2]  468         jp EESTORE 
                                    469 
                                    470 ;; Reset dictionary pointer before 
                                    471 ;; forgotten word. RAM space and 
                                    472 ;; interrupt vector defined after 
                                    473 ;; must be resetted also.
      0081CF 81 9F                  474         .word LINK 
                           000151   475         LINK=.
      0081D1 06                     476         .byte 6
      0081D2 46 4F 52 47 45 54      477         .ascii "FORGET" 
      0081D8                        478 FORGET: 
      0081D8 CD 91 DE         [ 4]  479         call TOKEN
      0081DB CD 86 1A         [ 4]  480         call DUPP 
      0081DE CD 85 28         [ 4]  481         call QBRAN 
      0081E1 82 8D                  482         .word FORGET2
      0081E3 CD 92 DB         [ 4]  483         call NAMEQ ; ( a -- ca na | a F )
      0081E6 CD 87 C4         [ 4]  484         call QDUP 
      0081E9 CD 85 28         [ 4]  485         call QBRAN 
      0081EC 82 8D                  486         .word FORGET2
                                    487 ; only forget users words 
      0081EE CD 86 1A         [ 4]  488         call DUPP ; ( ca na na )
      0081F1 CD 84 F5         [ 4]  489         call DOLIT 
      0081F4 A4 80                  490         .word app_space 
      0081F6 CD 86 2A         [ 4]  491         call SWAPP 
      0081F9 CD 88 D5         [ 4]  492         call  ULESS 
      0081FC CD 85 28         [ 4]  493         call QBRAN 
      0081FF 82 4F                  494         .word FORGET6 
                                    495 ; ( ca na -- )        
                                    496 ;reset ivec with address >= ca
      008201 CD 86 2A         [ 4]  497         call SWAPP ; ( na ca -- ) 
      008204 CD A0 19         [ 4]  498         call CHKIVEC ; ( na -- ) 
                                    499 ; start at LAST and link back to na 
                                    500 ; if variable found reset VP at that point.
      008207                        501 FORGET1:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



      008207 CD 87 86         [ 4]  502         call LAST 
      00820A CD 85 73         [ 4]  503         call AT 
      00820D CD 86 1A         [ 4]  504         call DUPP  ; ( -- na last last )
      008210 CD 82 A3         [ 4]  505         call FREEVAR ; ( -- na last )
      008213 CD 86 1A         [ 4]  506         call DUPP 
      008216 CD 84 F5         [ 4]  507         call DOLIT 
      008219 00 02                  508         .word 2 
      00821B CD 88 8E         [ 4]  509         call SUBB ; ( na last -- na last lfa ) link address 
      00821E CD 85 73         [ 4]  510         call AT 
      008221 CD 86 1A         [ 4]  511         call DUPP ; ( -- na last a a )
      008224 CD 87 5A         [ 4]  512         call CNTXT 
      008227 CD 85 5C         [ 4]  513         call STORE
      00822A CD 87 86         [ 4]  514         call LAST  
      00822D CD 85 5C         [ 4]  515         call STORE ; ( --  na last )
      008230 CD 86 44         [ 4]  516         call OVER 
      008233 CD 88 B6         [ 4]  517         call EQUAL ; ( na last na -- na T|F ) 
      008236 CD 85 28         [ 4]  518         call QBRAN 
      008239 82 07                  519         .word FORGET1 
                                    520 ; ( na -- )
      00823B CD 84 F5         [ 4]  521         call DOLIT 
      00823E 00 02                  522         .word 2 
      008240 CD 88 8E         [ 4]  523         call SUBB 
      008243 CD 87 76         [ 4]  524         call CPP 
      008246 CD 85 5C         [ 4]  525         call STORE  
      008249 CD 9C 49         [ 4]  526         call UPDATCP 
      00824C CC 9C 20         [ 2]  527         jp UPDATLAST 
      00824F                        528 FORGET6: ; tried to forget a RAM or system word 
                                    529 ; ( ca na -- )
      00824F 1D 00 02         [ 2]  530         subw x,#CELLL 
      008252 90 BE 2A         [ 2]  531         ldw y,SP0 
      008255 FF               [ 2]  532         ldw (x),y  
      008256 CD 88 D5         [ 4]  533         call ULESS
      008259 CD 85 28         [ 4]  534         call QBRAN 
      00825C 82 7F                  535         .word PROTECTED 
      00825E CD 93 E7         [ 4]  536         call ABORQ 
      008261 1D                     537         .byte 29
      008262 20 46 6F 72 20 52 41   538         .ascii " For RAM definition do REBOOT"
             4D 20 64 65 66 69 6E
             69 74 69 6F 6E 20 64
             6F 20 52 45 42 4F 4F
             54
      00827F                        539 PROTECTED:
      00827F CD 93 E7         [ 4]  540         call ABORQ
      008282 0A                     541         .byte 10
      008283 20 50 72 6F 74 65 63   542         .ascii " Protected"
             74 65 64
      00828D                        543 FORGET2: ; no name or not found in dictionary 
      00828D CD 93 E7         [ 4]  544         call ABORQ
      008290 05                     545         .byte 5
      008291 20 77 68 61 74         546         .ascii " what"
      008296                        547 FORGET4:
      008296 CC 86 10         [ 2]  548         jp DROP 
                                    549 
                                    550 
                                    551 ;---------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]



                                    552 ; if na is variable 
                                    553 ; free variable data  
                                    554 ; FREEVAR ( na -- )
                                    555 ;---------------------------------
      008299 81 D1                  556         .word LINK 
                           00021B   557         LINK=.
      00829B 07                     558         .byte 7 
      00829C 46 52 45 45 56 41 52   559         .ascii "FREEVAR"
      0082A3                        560 FREEVAR:
      0082A3 CD 86 1A         [ 4]  561         call DUPP ; ( na na -- )
      0082A6 CD 85 91         [ 4]  562         CALL CAT  ; ( na c -- )
      0082A9 CD 8A FA         [ 4]  563         call ONEP ;
      0082AC CD 88 15         [ 4]  564         CALL PLUS ; ( na c+1 -- ca ) 
      0082AF CD 8A FA         [ 4]  565         call ONEP ; ( ca+ -- ) to get routne address 
      0082B2 CD 86 1A         [ 4]  566         call DUPP ; ( ca+ ca+ -- )
      0082B5 CD 85 73         [ 4]  567         CALL AT   ; ( ca+ fnaddr -- ) ; fnaddr is routine address 
      0082B8 CD 84 F5         [ 4]  568         call DOLIT 
      0082BB 86 C7                  569         .word DOVAR ; if routine address is DOVAR then variable 
      0082BD CD 88 B6         [ 4]  570         call EQUAL  ; ( ca+ fnaddr DOVAR -- ca+ T|F ) 
      0082C0 CD 85 28         [ 4]  571         call QBRAN 
      0082C3 82 D9                  572         .word FREEVAR4 
      0082C5 CD 84 F5         [ 4]  573         call DOLIT 
      0082C8 00 02                  574         .word 2 
      0082CA CD 88 15         [ 4]  575         call PLUS  ; ( ca+ 2 -- da ) da is data address 
      0082CD CD 85 73         [ 4]  576         call AT 
      0082D0 CD 87 68         [ 4]  577         call VPP   
      0082D3 CD 85 5C         [ 4]  578         call STORE 
      0082D6 CC 9C 60         [ 2]  579         jp UPDATVP 
      0082D9                        580 FREEVAR4: ; not variable
      0082D9 CC 86 10         [ 2]  581         jp  DROP 
                                    582 
                                    583 ;    SEED ( n -- )
                                    584 ; Initialize PRNG seed with n 
      0082DC 82 9B                  585         .word LINK 
                           00025E   586         LINK=. 
      0082DE 04                     587         .byte 4 
      0082DF 53 45 45 44            588         .ascii "SEED" 
      0082E3                        589 SEED:
      0082E3 90 93            [ 1]  590         ldw y,x 
      0082E5 1C 00 02         [ 2]  591         addw x,#CELLL
      0082E8 90 FE            [ 2]  592         ldw y,(y)
      0082EA 90 9E            [ 1]  593         ld a,yh 
      0082EC B7 36            [ 1]  594         ld SEEDX,a 
      0082EE 90 9F            [ 1]  595         ld a,yl 
      0082F0 B7 38            [ 1]  596         ld SEEDY,a 
      0082F2 81               [ 4]  597         ret 
                                    598 
                                    599 ;    RANDOM ( u1 -- u2 )
                                    600 ; Pseudo random number betwen 0 and u1-1
      0082F3 82 DE                  601         .word LINK 
                           000275   602         LINK=.
      0082F5 06                     603         .byte 6
      0082F6 52 41 4E 44 4F 4D      604         .ascii "RANDOM" 
      0082FC                        605 RANDOM:
                                    606 ;local variable 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 13.
Hexadecimal [24-Bits]



                           000001   607         SPSAVE=1
                           000002   608         VSIZE=2 
      0082FC 52 02            [ 2]  609         sub sp,#VSIZE
      0082FE 1F 01            [ 2]  610         ldw (SPSAVE,sp),x  
                                    611 ; XTEMP=(SEEDX<<5)^SEEDX 
      008300 90 93            [ 1]  612         ldw y,x 
      008302 90 FE            [ 2]  613         ldw y,(y)
      008304 90 BF 24         [ 2]  614         ldw YTEMP,y 
      008307 BE 36            [ 2]  615 	ldw x,SEEDX 
      008309 58               [ 2]  616 	sllw x 
      00830A 58               [ 2]  617 	sllw x 
      00830B 58               [ 2]  618 	sllw x 
      00830C 58               [ 2]  619 	sllw x 
      00830D 58               [ 2]  620 	sllw x 
      00830E 9E               [ 1]  621 	ld a,xh 
      00830F B8 36            [ 1]  622 	xor a,SEEDX 
      008311 B7 22            [ 1]  623 	ld XTEMP,a 
      008313 9F               [ 1]  624 	ld a,xl 
      008314 B8 37            [ 1]  625 	xor a,SEEDX+1 
      008316 B7 23            [ 1]  626 	ld XTEMP+1,a 
                                    627 ; SEEDX=SEEDY 
      008318 BE 38            [ 2]  628 	ldw x,SEEDY 
      00831A BF 36            [ 2]  629 	ldw SEEDX,x  
                                    630 ; SEEDY=SEEDY^(SEEDY>>1)
      00831C 54               [ 2]  631 	srlw x 
      00831D 9E               [ 1]  632 	ld a,xh 
      00831E B8 38            [ 1]  633 	xor a,SEEDY 
      008320 B7 38            [ 1]  634 	ld SEEDY,a  
      008322 9F               [ 1]  635 	ld a,xl 
      008323 B8 39            [ 1]  636 	xor a,SEEDY+1 
      008325 B7 39            [ 1]  637 	ld SEEDY+1,a 
                                    638 ; XTEMP>>3 
      008327 BE 22            [ 2]  639 	ldw x,XTEMP 
      008329 54               [ 2]  640 	srlw x 
      00832A 54               [ 2]  641 	srlw x 
      00832B 54               [ 2]  642 	srlw x 
                                    643 ; x=XTEMP^x 
      00832C 9E               [ 1]  644 	ld a,xh 
      00832D B8 22            [ 1]  645 	xor a,XTEMP 
      00832F 95               [ 1]  646 	ld xh,a 
      008330 9F               [ 1]  647 	ld a,xl 
      008331 B8 23            [ 1]  648 	xor a,XTEMP+1  
      008333 97               [ 1]  649 	ld xl,a 
                                    650 ; SEEDY=x^SEEDY 
      008334 B8 39            [ 1]  651 	xor a,SEEDY+1
      008336 97               [ 1]  652 	ld xl,a 
      008337 9E               [ 1]  653 	ld a,xh 
      008338 B8 38            [ 1]  654 	xor a,SEEDY
      00833A 95               [ 1]  655 	ld xh,a 
      00833B BF 38            [ 2]  656 	ldw SEEDY,x 
                                    657 ; return SEEDY modulo YTEMP  
      00833D 90 BE 24         [ 2]  658 	ldw y,YTEMP  
      008340 65               [ 2]  659 	divw x,y 
      008341 1E 01            [ 2]  660 	ldw x,(SPSAVE,sp)
      008343 FF               [ 2]  661         ldw (x),y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 14.
Hexadecimal [24-Bits]



      008344 5B 02            [ 2]  662         addw sp,#VSIZE 
      008346 81               [ 4]  663 	ret 
                                    664 
                                    665 
                                    666 ;;
                                    667 ;; get millisecond counter 
                                    668 ;; msec ( -- u )
                                    669 ;; Added by Picatout 2020-04-26
      008347 82 F5                  670         .word LINK  
                           0002C9   671         LINK = . 
      008349 04                     672         .byte 4
      00834A 4D 53 45 43            673         .ascii "MSEC"
      00834E                        674 MSEC: 
      00834E 1D 00 02         [ 2]  675         subw x,#CELLL 
      008351 90 BE 2E         [ 2]  676         ldw y,MS 
      008354 FF               [ 2]  677         ldw (x),y 
      008355 81               [ 4]  678         ret 
                                    679 
                                    680 ; suspend execution for u msec 
                                    681 ;  pause ( u -- )
      008356 83 49                  682         .word LINK 
                           0002D8   683         LINK=.
      008358 05                     684         .byte 5 
      008359 50 41 55 53 45         685         .ascii "PAUSE"
      00835E                        686 PAUSE:
      00835E 90 93            [ 1]  687         ldw y,x
      008360 90 FE            [ 2]  688         ldw y,(y)
      008362 72 B9 00 2E      [ 2]  689         addw y,MS 
      008366 8F               [10]  690 1$:     wfi  
      008367 90 B3 2E         [ 2]  691         cpw y,MS  
      00836A 26 FA            [ 1]  692         jrne 1$        
      00836C 1C 00 02         [ 2]  693         addw x,#CELLL 
      00836F 81               [ 4]  694         ret 
                                    695 
                                    696 ; initialize count down timer 
                                    697 ;  TIMER ( u -- )  milliseconds 
      008370 83 58                  698         .word LINK 
                           0002F2   699         LINK=.
      008372 05                     700         .byte 5 
      008373 54 49 4D 45 52         701         .ascii "TIMER" 
      008378                        702 TIMER:
      008378 90 93            [ 1]  703         ldw y,x
      00837A 90 FE            [ 2]  704         ldw y,(y) 
      00837C 90 BF 30         [ 2]  705         ldw CNTDWN,y
      00837F 1C 00 02         [ 2]  706         addw x,#CELLL 
      008382 81               [ 4]  707         ret 
                                    708 
                                    709 ; check for TIMER exiparition 
                                    710 ;  TIMEOUT? ( -- 0|-1 )
      008383 83 72                  711         .word LINK 
                           000305   712         LINK=. 
      008385 08                     713         .byte 8 
      008386 54 49 4D 45 4F 55 54   714         .ascii "TIMEOUT?"
             3F
      00838E                        715 TIMEOUTQ: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 15.
Hexadecimal [24-Bits]



      00838E 4F               [ 1]  716         clr a
      00838F 1D 00 02         [ 2]  717         subw x,#CELLL 
      008392 90 BE 30         [ 2]  718         ldw y,CNTDWN 
      008395 26 01            [ 1]  719         jrne 1$ 
      008397 43               [ 1]  720         cpl a 
      008398 E7 01            [ 1]  721 1$:     ld (1,x),a 
      00839A F7               [ 1]  722         ld (x),a 
      00839B 81               [ 4]  723         ret         
                                    724 
                                    725 ; reboot MCU 
                                    726 ; REBOOT ( -- )
      00839C 83 85                  727         .word LINK 
                           00031E   728         LINK=. 
      00839E 06                     729         .byte 6 
      00839F 52 45 42 4F 4F 54      730         .ascii "REBOOT"
      0083A5                        731 reboot:
      0083A5 CC 80 80         [ 2]  732         jp NonHandledInterrupt
                                    733 
                                    734 ; compile to flash memory 
                                    735 ; TO-FLASH ( -- )
      0083A8 83 9E                  736         .word LINK 
                           00032A   737         LINK=.
      0083AA 08                     738         .byte 8
      0083AB 54 4F 2D 46 4C 41 53   739         .ascii "TO-FLASH"
             48
      0083B3                        740 TOFLASH:
      0083B3 CD 87 99         [ 4]  741         call RAMLAST 
      0083B6 CD 85 73         [ 4]  742         call AT 
      0083B9 CD 87 C4         [ 4]  743         call QDUP 
      0083BC CD 85 28         [ 4]  744         call QBRAN
      0083BF 83 E2                  745         .word 1$
      0083C1 CD 93 E7         [ 4]  746         call ABORQ 
      0083C4 1D                     747         .byte 29
      0083C5 20 4E 6F 74 20 77 68   748         .ascii " Not while definitions in RAM"   
             69 6C 65 20 64 65 66
             69 6E 69 74 69 6F 6E
             73 20 69 6E 20 52 41
             4D
      0083E2 90 AE FF FF      [ 2]  749 1$:     ldw y,#-1 
      0083E6 90 BF 1E         [ 2]  750         ldw UTFLASH,y
      0083E9 81               [ 4]  751         ret 
                                    752 
                                    753 ; compile to RAM 
                                    754 ; TO-RAM ( -- )
      0083EA 83 AA                  755         .word LINK 
                           00036C   756         LINK=.
      0083EC 06                     757         .byte 6 
      0083ED 54 4F 2D 52 41 4D      758         .ascii "TO-RAM"
      0083F3                        759 TORAM:
      0083F3 90 5F            [ 1]  760         clrw y 
      0083F5 90 BF 1E         [ 2]  761         ldw UTFLASH,y 
      0083F8 81               [ 4]  762         ret 
                                    763 
                                    764 ;; BAUD RATE constants table
                                    765 ; values to put in BRR1 & BRR2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 16.
Hexadecimal [24-Bits]



      0083F9                        766 baudrate: 
      0083F9 A0 1B                  767 	.byte 0xa0,0x1b ; 2400
      0083FB D0 05                  768 	.byte 0xd0,0x5  ; 4800 
      0083FD 68 03                  769 	.byte 0x68,0x3  ; 9600
      0083FF 34 01                  770 	.byte 0x34,0x1  ; 19200
      008401 11 06                  771 	.byte 0x11,0x6  ; 57600
      008403 08 0B                  772 	.byte 0x8,0xb   ; 115200
                                    773 
                                    774 ; BAUD RATE CONSTANTS names 
                                    775 ; 2400 baud
      008405 83 EC                  776 	.word LINK
                           000387   777 LINK	= .
      008407 04                     778 	.byte 4
      008408 42 32 4B 34            779 	.ascii "B2K4" 
      00840C                        780 B2K4:
      00840C 1D 00 02         [ 2]  781 	subw x,#CELLL 
      00840F 90 5F            [ 1]  782         clrw y
      008411 FF               [ 2]  783         ldw (x),y
      008412 81               [ 4]  784 	ret
                                    785 ; 4800 baud	
      008413 84 07                  786 	.word LINK
                           000395   787 LINK	= .
      008415 04                     788 	.byte 4
      008416 42 34 4B 38            789 	.ascii "B4K8" 
      00841A                        790 B4K8:
      00841A 1D 00 02         [ 2]  791         subw x,#CELLL 
      00841D 90 AE 00 02      [ 2]  792         ldw y,#2 
      008421 FF               [ 2]  793         ldw (x),y
      008422 81               [ 4]  794         ret 
                                    795 ; 9600 baud
      008423 84 15                  796 	.word LINK
                           0003A5   797 LINK	= .
      008425 04                     798 	.byte 4
      008426 42 39 4B 36            799 	.ascii "B9K6" 
      00842A                        800 B9K6:
      00842A 1D 00 02         [ 2]  801         subw x,#CELLL 
      00842D 90 AE 00 04      [ 2]  802         ldw y,#4 
      008431 FF               [ 2]  803         ldw (x),y 
      008432 81               [ 4]  804         ret 
                                    805 ; 19200 baud
      008433 84 25                  806 	.word LINK
                           0003B5   807 LINK	= .
      008435 05                     808 	.byte 5
      008436 42 31 39 4B 32         809 	.ascii "B19K2" 
      00843B                        810 B19K2:
      00843B 1D 00 02         [ 2]  811         subw x,#CELLL
      00843E 90 AE 00 06      [ 2]  812         ldw y,#6 
      008442 FF               [ 2]  813         ldw (x),y 
      008443 81               [ 4]  814         ret 
                                    815 ; 57600 baud        
      008444 84 35                  816 	.word LINK
                           0003C6   817 LINK	= .
      008446 05                     818 	.byte 5
      008447 42 35 37 4B 36         819 	.ascii "B57K6" 
      00844C                        820 B57K6:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 17.
Hexadecimal [24-Bits]



      00844C 1D 00 02         [ 2]  821         subw x,#CELLL 
      00844F 90 AE 00 08      [ 2]  822         ldw y,#8 
      008453 FF               [ 2]  823         ldw (x),y 
      008454 81               [ 4]  824         ret 
                                    825 ; 115200 baud 
      008455 84 46                  826 	.word LINK
                           0003D7   827 LINK	= .
      008457 06                     828 	.byte 6
      008458 42 31 31 35 4B 32      829 	.ascii "B115K2" 
      00845E                        830 B115K2:
      00845E 1D 00 02         [ 2]  831 	subw x,#CELLL 
      008461 90 AE 00 0A      [ 2]  832         ldw y,#10 
      008465 FF               [ 2]  833         ldw (x),y 
      008466 81               [ 4]  834         ret 
                                    835 	
                                    836 ;; set UART2 BAUD rate
                                    837 ;	BAUD ( u -- )
      008467 84 57                  838 	.word LINK 
                           0003E9   839 LINK	= .
      008469 04                     840 	.byte 4
      00846A 42 41 55 44            841 	.ascii "BAUD" 
      00846E                        842 BAUD:
      00846E 1D 00 02         [ 2]  843 	subw x,#CELLL
      008471 90 AE 83 F9      [ 2]  844         ldw y,#baudrate 
      008475 FF               [ 2]  845         ldw (x),y 
      008476 CD 88 15         [ 4]  846         call PLUS
      008479 90 93            [ 1]  847         ldw y,x  
      00847B 90 FE            [ 2]  848         ldw y,(y)
      00847D 90 F6            [ 1]  849         ld a,(y)
      00847F 88               [ 1]  850         push a 
      008480 90 5C            [ 1]  851         incw y 
      008482 90 F6            [ 1]  852         ld a,(y)
      008484 C7 52 33         [ 1]  853         ld UART_BRR2,a 
      008487 84               [ 1]  854         pop a
      008488 C7 52 32         [ 1]  855         ld UART_BRR1,a 
      00848B 1C 00 02         [ 2]  856         addw x,#CELLL 
      00848E 81               [ 4]  857         ret 
                                    858 
                                    859 ;; Device dependent I/O
                                    860 ;       ?RX     ( -- c T | F )
                                    861 ;         Return input byte and true, or false.
      00848F 84 69                  862         .word      LINK 
                           000411   863 LINK	= .
      008491 04                     864         .byte      4
      008492 3F 4B 45 59            865         .ascii     "?KEY"
      008496                        866 QKEY:
      008496 90 5F            [ 1]  867         CLRW Y 
      008498 72 0B 52 30 0B   [ 2]  868         BTJF UART_SR,#UART_SR_RXNE,INCH   ;check status
      00849D C6 52 31         [ 1]  869         LD    A,UART_DR   ;get char in A
      0084A0 1D 00 02         [ 2]  870 	SUBW	X,#2
      0084A3 E7 01            [ 1]  871         LD     (1,X),A
      0084A5 7F               [ 1]  872 	CLR	(X)
      0084A6 90 53            [ 2]  873         CPLW     Y
      0084A8                        874 INCH:
      0084A8 1D 00 02         [ 2]  875 		SUBW	X,#2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
Hexadecimal [24-Bits]



      0084AB FF               [ 2]  876         LDW     (X),Y
      0084AC 81               [ 4]  877         RET
                                    878 
                                    879 ;       TX!     ( c -- )
                                    880 ;       Send character c to  output device.
      0084AD 84 91                  881         .word      LINK
                           00042F   882 LINK	= .
      0084AF 04                     883         .byte      4
      0084B0 45 4D 49 54            884         .ascii     "EMIT"
      0084B4                        885 EMIT:
      0084B4 E6 01            [ 1]  886         LD     A,(1,X)
      0084B6 1C 00 02         [ 2]  887 	ADDW	X,#2
      0084B9 72 0F 52 30 FB   [ 2]  888 OUTPUT: BTJF UART_SR,#UART_SR_TXE,OUTPUT  ;loop until tx empty 
      0084BE C7 52 31         [ 1]  889         LD    UART_DR,A   ;send A
      0084C1 81               [ 4]  890         RET
                                    891 
                                    892 ;       FC-XON  ( -- )
                                    893 ;       send XON character 
      0084C2 84 AF                  894         .word LINK
                           000444   895 LINK    = .
      0084C4 06                     896         .byte 6 
      0084C5 46 43 2D 58 4F 4E      897         .ascii "FC-XON"
      0084CB                        898 FC_XON:
      0084CB 1D 00 02         [ 2]  899         subw x,#CELLL 
      0084CE 7F               [ 1]  900         clr (x)
      0084CF A6 11            [ 1]  901         ld a,#XON 
      0084D1 E7 01            [ 1]  902         ld (1,x),a 
      0084D3 CD 84 B4         [ 4]  903         call EMIT 
      0084D6 81               [ 4]  904         ret 
                                    905 
                                    906 ;       FC-XOFF ( -- )
                                    907 ;       Send XOFF character 
      0084D7 84 C4                  908         .word LINK
                           000459   909 LINK    = .
      0084D9 07                     910         .byte 7
      0084DA 46 43 2D 58 4F 46 46   911         .ascii "FC-XOFF"
      0084E1                        912 FC_XOFF:
      0084E1 1D 00 02         [ 2]  913         subw x,#CELLL 
      0084E4 7F               [ 1]  914         clr (x)
      0084E5 A6 13            [ 1]  915         ld a,#XOFF 
      0084E7 E7 01            [ 1]  916         ld (1,x),a 
      0084E9 CD 84 B4         [ 4]  917         call EMIT 
      0084EC 81               [ 4]  918         ret
                                    919 
                                    920 ;; The kernel
                                    921 
                                    922 ;       doLIT   ( -- w )
                                    923 ;       Push an inline literal.
      0084ED 84 D9                  924         .word      LINK
                           00046F   925 LINK	= 	.
      0084EF 45                     926 	.byte      COMPO+5
      0084F0 44 4F 4C 49 54         927         .ascii     "DOLIT"
      0084F5                        928 DOLIT:
      0084F5 1D 00 02         [ 2]  929 	SUBW X,#2
      0084F8 16 01            [ 2]  930         ldw y,(1,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]



      0084FA 90 FE            [ 2]  931         ldw y,(y)
      0084FC FF               [ 2]  932         ldw (x),y
      0084FD 90 85            [ 2]  933         popw y 
      0084FF 90 EC 02         [ 2]  934         jp (2,y)
                                    935 
                                    936 ;       next    ( -- )
                                    937 ;       Code for  single index loop.
      008502 84 EF                  938         .word      LINK
                           000484   939 LINK	= 	.
      008504 44                     940 	.byte      COMPO+4
      008505 6E 65 78 74            941         .ascii     "next"
      008509                        942 DONXT:
      008509 16 03            [ 2]  943 	LDW Y,(3,SP)
      00850B 90 5A            [ 2]  944 	DECW Y
      00850D 2A 07            [ 1]  945 	JRPL NEX1 ; jump if N=0
      00850F 90 85            [ 2]  946 	POPW Y
      008511 5B 02            [ 2]  947         addw sp,#2
      008513 90 EC 02         [ 2]  948         JP (2,Y)
      008516                        949 NEX1:
      008516 17 03            [ 2]  950         LDW (3,SP),Y
      008518 90 85            [ 2]  951         POPW Y
      00851A 90 FE            [ 2]  952 	LDW Y,(Y)
      00851C 90 FC            [ 2]  953 	JP (Y)
                                    954 
                                    955 ;       ?branch ( f -- )
                                    956 ;       Branch if flag is zero.
      00851E 85 04                  957         .word      LINK
                           0004A0   958 LINK	= 	.
      008520 47                     959 	.byte      COMPO+7
      008521 3F 42 52 41 4E 43 48   960         .ascii     "?BRANCH"
      008528                        961 QBRAN:	
      008528 90 93            [ 1]  962         LDW Y,X
      00852A 1C 00 02         [ 2]  963 	ADDW X,#2
      00852D 90 FE            [ 2]  964 	LDW Y,(Y)
      00852F 27 0E            [ 1]  965         JREQ     BRAN
      008531 90 85            [ 2]  966 	POPW Y
      008533 90 EC 02         [ 2]  967 	JP (2,Y)
                                    968         
                                    969 ;       branch  ( -- )
                                    970 ;       Branch to an inline address.
      008536 85 20                  971         .word      LINK
                           0004B8   972 LINK	= 	.
      008538 46                     973 	.byte      COMPO+6
      008539 42 52 41 4E 43 48      974         .ascii     "BRANCH"
      00853F                        975 BRAN:
      00853F 90 85            [ 2]  976         POPW Y
      008541 90 FE            [ 2]  977 	LDW Y,(Y)
      008543 90 FC            [ 2]  978         JP     (Y)
                                    979 
                                    980 ;       EXECUTE ( ca -- )
                                    981 ;       Execute  word at ca.
      008545 85 38                  982         .word      LINK
                           0004C7   983 LINK	= 	.
      008547 07                     984         .byte       7
      008548 45 58 45 43 55 54 45   985         .ascii     "EXECUTE"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]



      00854F                        986 EXECU:
      00854F 90 93            [ 1]  987         LDW Y,X
      008551 1C 00 02         [ 2]  988 	ADDW X,#2
      008554 90 FE            [ 2]  989 	LDW  Y,(Y)
      008556 90 FC            [ 2]  990         JP   (Y)
                                    991 
                           000001   992 OPTIMIZE = 1
                           000001   993 .if OPTIMIZE 
                                    994 ; remplacement de CALL EXIT par 
                                    995 ; le opcode de RET.
                                    996 ; Voir modification au code de ";"
                           000000   997 .else 
                                    998 ;       EXIT    ( -- )
                                    999 ;       Terminate a colon definition.
                                   1000         .word      LINK
                                   1001 LINK = .
                                   1002         .byte      4
                                   1003         .ascii     "EXIT"
                                   1004 EXIT:
                                   1005         POPW Y
                                   1006         RET
                                   1007 .endif 
                                   1008 
                                   1009 ;       !       ( w a -- )
                                   1010 ;       Pop  data stack to memory.
      008558 85 47                 1011         .word      LINK
                           0004DA  1012 LINK = .
      00855A 01                    1013         .byte      1
      00855B 21                    1014         .ascii     "!"
      00855C                       1015 STORE:
      00855C 90 93            [ 1] 1016         LDW Y,X
      00855E 90 FE            [ 2] 1017         LDW Y,(Y)    ;Y=a
      008560 90 BF 24         [ 2] 1018         LDW YTEMP,Y
      008563 90 93            [ 1] 1019         LDW Y,X
      008565 90 EE 02         [ 2] 1020         LDW Y,(2,Y)
      008568 91 CF 24         [ 5] 1021         LDW [YTEMP],Y ;store w at a
      00856B 1C 00 04         [ 2] 1022         ADDW X,#4 ; DDROP 
      00856E 81               [ 4] 1023         RET     
                                   1024 
                                   1025 ;       @       ( a -- w )
                                   1026 ;       Push memory location to stack.
      00856F 85 5A                 1027         .word      LINK
                           0004F1  1028 LINK	= 	.
      008571 01                    1029         .byte    1
      008572 40                    1030         .ascii	"@"
      008573                       1031 AT:
      008573 90 93            [ 1] 1032         LDW Y,X     ;Y = a
      008575 90 FE            [ 2] 1033         LDW Y,(Y)   ; address 
      008577 90 FE            [ 2] 1034         LDW Y,(Y)   ; value 
      008579 FF               [ 2] 1035         LDW (X),Y ;w = @Y
      00857A 81               [ 4] 1036         RET     
                                   1037 
                                   1038 ;       C!      ( c b -- )
                                   1039 ;       Pop  data stack to byte memory.
      00857B 85 71                 1040         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



                           0004FD  1041 LINK	= .
      00857D 02                    1042         .byte      2
      00857E 43 21                 1043         .ascii     "C!"
      008580                       1044 CSTOR:
      008580 90 93            [ 1] 1045         LDW Y,X
      008582 90 FE            [ 2] 1046 	LDW Y,(Y)    ;Y=b
      008584 E6 03            [ 1] 1047         LD A,(3,X)    ;D = c
      008586 90 F7            [ 1] 1048         LD  (Y),A     ;store c at b
      008588 1C 00 04         [ 2] 1049 	ADDW X,#4 ; DDROP 
      00858B 81               [ 4] 1050         RET     
                                   1051 
                                   1052 ;       C@      ( b -- c )
                                   1053 ;       Push byte in memory to  stack.
      00858C 85 7D                 1054         .word      LINK
                           00050E  1055 LINK	= 	.
      00858E 02                    1056         .byte      2
      00858F 43 40                 1057         .ascii     "C@"
      008591                       1058 CAT:
      008591 90 93            [ 1] 1059         LDW Y,X     ;Y=b
      008593 90 FE            [ 2] 1060         LDW Y,(Y)
      008595 90 F6            [ 1] 1061         LD A,(Y)
      008597 E7 01            [ 1] 1062         LD (1,X),A
      008599 7F               [ 1] 1063         CLR (X)
      00859A 81               [ 4] 1064         RET     
                                   1065 
                                   1066 ;       RP@     ( -- a )
                                   1067 ;       Push current RP to data stack.
      00859B 85 8E                 1068         .word      LINK
                           00051D  1069 LINK	= .
      00859D 03                    1070         .byte      3
      00859E 52 50 40              1071         .ascii     "RP@"
      0085A1                       1072 RPAT:
      0085A1 90 96            [ 1] 1073         LDW Y,SP    ;save return addr
      0085A3 1D 00 02         [ 2] 1074         SUBW X,#2
      0085A6 FF               [ 2] 1075         LDW (X),Y
      0085A7 81               [ 4] 1076         RET     
                                   1077 
                                   1078 ;       RP!     ( a -- )
                                   1079 ;       Set  return stack pointer.
      0085A8 85 9D                 1080         .word      LINK
                           00052A  1081 LINK	= 	. 
      0085AA 43                    1082 	.byte      COMPO+3
      0085AB 52 50 21              1083         .ascii     "RP!"
      0085AE                       1084 RPSTO:
      0085AE 90 85            [ 2] 1085         POPW Y
      0085B0 90 BF 24         [ 2] 1086         LDW YTEMP,Y
      0085B3 90 93            [ 1] 1087         LDW Y,X
      0085B5 90 FE            [ 2] 1088         LDW Y,(Y)
      0085B7 90 94            [ 1] 1089         LDW SP,Y
      0085B9 1C 00 02         [ 2] 1090         ADDW x,#CELLL ; a was not dropped, Picatout 2020-05-24
      0085BC 92 CC 24         [ 5] 1091         JP [YTEMP]
                                   1092 
                                   1093 ;       R>      ( -- w )
                                   1094 ;       Pop return stack to data stack.
      0085BF 85 AA                 1095         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]



                           000541  1096 LINK	= 	. 
      0085C1 42                    1097 	.byte      COMPO+2
      0085C2 52 3E                 1098         .ascii     "R>"
      0085C4                       1099 RFROM:
      0085C4 90 85            [ 2] 1100         POPW Y    ;save return addr
      0085C6 90 BF 24         [ 2] 1101         LDW YTEMP,Y
      0085C9 90 85            [ 2] 1102         POPW Y
      0085CB 1D 00 02         [ 2] 1103         SUBW X,#2
      0085CE FF               [ 2] 1104         LDW (X),Y
      0085CF 92 CC 24         [ 5] 1105         JP [YTEMP]
                                   1106 
                                   1107 ;       R@      ( -- w )
                                   1108 ;       Copy top of return stack to stack.
      0085D2 85 C1                 1109         .word      LINK
                           000554  1110 LINK	= 	. 
      0085D4 02                    1111         .byte      2
      0085D5 52 40                 1112         .ascii     "R@"
      0085D7                       1113 RAT:
      0085D7 16 03            [ 2] 1114         ldw y,(3,sp)
      0085D9 1D 00 02         [ 2] 1115         subw x,#CELLL 
      0085DC FF               [ 2] 1116         ldw (x),y 
      0085DD 81               [ 4] 1117         ret 
                                   1118 
                                   1119 ;       >R      ( w -- )
                                   1120 ;       Push data stack to return stack.
      0085DE 85 D4                 1121         .word      LINK
                           000560  1122 LINK	= 	. 
      0085E0 42                    1123 	.byte      COMPO+2
      0085E1 3E 52                 1124         .ascii     ">R"
      0085E3                       1125 TOR:
      0085E3 90 85            [ 2] 1126         POPW Y    ;save return addr
      0085E5 90 BF 24         [ 2] 1127         LDW YTEMP,Y
      0085E8 90 93            [ 1] 1128         LDW Y,X
      0085EA 90 FE            [ 2] 1129         LDW Y,(Y)
      0085EC 90 89            [ 2] 1130         PUSHW Y    ;restore return addr
      0085EE 1C 00 02         [ 2] 1131         ADDW X,#2
      0085F1 92 CC 24         [ 5] 1132         JP [YTEMP]
                                   1133 
                                   1134 ;       SP@     ( -- a )
                                   1135 ;       Push current stack pointer.
      0085F4 85 E0                 1136         .word      LINK
                           000576  1137 LINK	= 	. 
      0085F6 03                    1138         .byte      3
      0085F7 53 50 40              1139         .ascii     "SP@"
      0085FA                       1140 SPAT:
      0085FA 90 93            [ 1] 1141 	LDW Y,X
      0085FC 1D 00 02         [ 2] 1142         SUBW X,#2
      0085FF FF               [ 2] 1143 	LDW (X),Y
      008600 81               [ 4] 1144         RET     
                                   1145 
                                   1146 ;       SP!     ( a -- )
                                   1147 ;       Set  data stack pointer.
      008601 85 F6                 1148         .word      LINK
                           000583  1149 LINK	= 	. 
      008603 03                    1150         .byte      3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



      008604 53 50 21              1151         .ascii     "SP!"
      008607                       1152 SPSTO:
      008607 FE               [ 2] 1153         LDW     X,(X)     ;X = a
      008608 81               [ 4] 1154         RET     
                                   1155 
                                   1156 ;       DROP    ( w -- )
                                   1157 ;       Discard top stack item.
      008609 86 03                 1158         .word      LINK
                           00058B  1159 LINK	= 	. 
      00860B 04                    1160         .byte      4
      00860C 44 52 4F 50           1161         .ascii     "DROP"
      008610                       1162 DROP:
      008610 1C 00 02         [ 2] 1163         ADDW X,#2     
      008613 81               [ 4] 1164         RET     
                                   1165 
                                   1166 ;       DUP     ( w -- w w )
                                   1167 ;       Duplicate  top stack item.
      008614 86 0B                 1168         .word      LINK
                           000596  1169 LINK	= 	. 
      008616 03                    1170         .byte      3
      008617 44 55 50              1171         .ascii     "DUP"
      00861A                       1172 DUPP:
      00861A 90 93            [ 1] 1173 	LDW Y,X
      00861C 1D 00 02         [ 2] 1174         SUBW X,#2
      00861F 90 FE            [ 2] 1175 	LDW Y,(Y)
      008621 FF               [ 2] 1176 	LDW (X),Y
      008622 81               [ 4] 1177         RET     
                                   1178 
                                   1179 ;       SWAP    ( w1 w2 -- w2 w1 )
                                   1180 ;       Exchange top two stack items.
      008623 86 16                 1181         .word      LINK
                           0005A5  1182 LINK	= 	. 
      008625 04                    1183         .byte      4
      008626 53 57 41 50           1184         .ascii     "SWAP"
      00862A                       1185 SWAPP:
      00862A 90 93            [ 1] 1186         LDW Y,X
      00862C 90 FE            [ 2] 1187         LDW Y,(Y)
      00862E 90 BF 24         [ 2] 1188         LDW YTEMP,Y
      008631 90 93            [ 1] 1189         LDW Y,X
      008633 90 EE 02         [ 2] 1190         LDW Y,(2,Y)
      008636 FF               [ 2] 1191         LDW (X),Y
      008637 90 BE 24         [ 2] 1192         LDW Y,YTEMP
      00863A EF 02            [ 2] 1193         LDW (2,X),Y
      00863C 81               [ 4] 1194         RET     
                                   1195 
                                   1196 ;       OVER    ( w1 w2 -- w1 w2 w1 )
                                   1197 ;       Copy second stack item to top.
      00863D 86 25                 1198         .word      LINK
                           0005BF  1199 LINK	= . 
      00863F 04                    1200         .byte      4
      008640 4F 56 45 52           1201         .ascii     "OVER"
      008644                       1202 OVER:
      008644 1D 00 02         [ 2] 1203         SUBW X,#2
      008647 90 93            [ 1] 1204         LDW Y,X
      008649 90 EE 04         [ 2] 1205         LDW Y,(4,Y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]



      00864C FF               [ 2] 1206         LDW (X),Y
      00864D 81               [ 4] 1207         RET     
                                   1208 
                                   1209 ;       0<      ( n -- t )
                                   1210 ;       Return true if n is negative.
      00864E 86 3F                 1211         .word      LINK
                           0005D0  1212 LINK	= . 
      008650 02                    1213         .byte      2
      008651 30 3C                 1214         .ascii     "0<"
      008653                       1215 ZLESS:
      008653 A6 FF            [ 1] 1216         LD A,#0xFF
      008655 90 93            [ 1] 1217         LDW Y,X
      008657 90 FE            [ 2] 1218         LDW Y,(Y)
      008659 2B 01            [ 1] 1219         JRMI     ZL1
      00865B 4F               [ 1] 1220         CLR A   ;false
      00865C F7               [ 1] 1221 ZL1:    LD     (X),A
      00865D E7 01            [ 1] 1222         LD (1,X),A
      00865F 81               [ 4] 1223 	RET     
                                   1224 
                                   1225 ;       AND     ( w w -- w )
                                   1226 ;       Bitwise AND.
      008660 86 50                 1227         .word      LINK
                           0005E2  1228 LINK	= . 
      008662 03                    1229         .byte      3
      008663 41 4E 44              1230         .ascii     "AND"
      008666                       1231 ANDD:
      008666 F6               [ 1] 1232         LD  A,(X)    ;D=w
      008667 E4 02            [ 1] 1233         AND A,(2,X)
      008669 E7 02            [ 1] 1234         LD (2,X),A
      00866B E6 01            [ 1] 1235         LD A,(1,X)
      00866D E4 03            [ 1] 1236         AND A,(3,X)
      00866F E7 03            [ 1] 1237         LD (3,X),A
      008671 1C 00 02         [ 2] 1238         ADDW X,#2
      008674 81               [ 4] 1239         RET
                                   1240 
                                   1241 ;       OR      ( w w -- w )
                                   1242 ;       Bitwise inclusive OR.
      008675 86 62                 1243         .word      LINK
                           0005F7  1244 LINK = . 
      008677 02                    1245         .byte      2
      008678 4F 52                 1246         .ascii     "OR"
      00867A                       1247 ORR:
      00867A F6               [ 1] 1248         LD A,(X)    ;D=w
      00867B EA 02            [ 1] 1249         OR A,(2,X)
      00867D E7 02            [ 1] 1250         LD (2,X),A
      00867F E6 01            [ 1] 1251         LD A,(1,X)
      008681 EA 03            [ 1] 1252         OR A,(3,X)
      008683 E7 03            [ 1] 1253         LD (3,X),A
      008685 1C 00 02         [ 2] 1254         ADDW X,#2
      008688 81               [ 4] 1255         RET
                                   1256 
                                   1257 ;       XOR     ( w w -- w )
                                   1258 ;       Bitwise exclusive OR.
      008689 86 77                 1259         .word      LINK
                           00060B  1260 LINK	= . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



      00868B 03                    1261         .byte      3
      00868C 58 4F 52              1262         .ascii     "XOR"
      00868F                       1263 XORR:
      00868F F6               [ 1] 1264         LD A,(X)    ;D=w
      008690 E8 02            [ 1] 1265         XOR A,(2,X)
      008692 E7 02            [ 1] 1266         LD (2,X),A
      008694 E6 01            [ 1] 1267         LD A,(1,X)
      008696 E8 03            [ 1] 1268         XOR A,(3,X)
      008698 E7 03            [ 1] 1269         LD (3,X),A
      00869A 1C 00 02         [ 2] 1270         ADDW X,#2
      00869D 81               [ 4] 1271         RET
                                   1272 
                                   1273 ;       UM+     ( u u -- udsum )
                                   1274 ;       Add two unsigned single
                                   1275 ;       and return a double sum.
      00869E 86 8B                 1276         .word      LINK
                           000620  1277 LINK	= . 
      0086A0 03                    1278         .byte      3
      0086A1 55 4D 2B              1279         .ascii     "UM+"
      0086A4                       1280 UPLUS:
      0086A4 A6 01            [ 1] 1281         LD A,#1
      0086A6 90 93            [ 1] 1282         LDW Y,X
      0086A8 90 EE 02         [ 2] 1283         LDW Y,(2,Y)
      0086AB 90 BF 24         [ 2] 1284         LDW YTEMP,Y
      0086AE 90 93            [ 1] 1285         LDW Y,X
      0086B0 90 FE            [ 2] 1286         LDW Y,(Y)
      0086B2 72 B9 00 24      [ 2] 1287         ADDW Y,YTEMP
      0086B6 EF 02            [ 2] 1288         LDW (2,X),Y
      0086B8 25 01            [ 1] 1289         JRC     UPL1
      0086BA 4F               [ 1] 1290         CLR A
      0086BB E7 01            [ 1] 1291 UPL1:   LD     (1,X),A
      0086BD 7F               [ 1] 1292         CLR (X)
      0086BE 81               [ 4] 1293         RET
                                   1294 
                                   1295 ;; System and user variables
                                   1296 
                                   1297 ;       doVAR   ( -- a )
                                   1298 ;       Code for VARIABLE and CREATE.
      0086BF 86 A0                 1299         .word      LINK
                           000641  1300 LINK	= . 
      0086C1 45                    1301 	.byte      COMPO+5
      0086C2 44 4F 56 41 52        1302         .ascii     "DOVAR"
      0086C7                       1303 DOVAR:
      0086C7 1D 00 02         [ 2] 1304 	SUBW X,#2
      0086CA 90 85            [ 2] 1305         POPW Y    ;get return addr (pfa)
      0086CC 90 FE            [ 2] 1306         LDW Y,(Y) ; indirect address 
      0086CE FF               [ 2] 1307         LDW (X),Y    ;push on stack
      0086CF 81               [ 4] 1308         RET     ;go to RET of EXEC
                                   1309 
                                   1310 ;       BASE    ( -- a )
                                   1311 ;       Radix base for numeric I/O.
      0086D0 86 C1                 1312         .word      LINK        
                           000652  1313 LINK = . 
      0086D2 04                    1314         .byte      4
      0086D3 42 41 53 45           1315         .ascii     "BASE"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



      0086D7                       1316 BASE:
      0086D7 90 AE 00 06      [ 2] 1317 	LDW Y,#UBASE 
      0086DB 1D 00 02         [ 2] 1318 	SUBW X,#2
      0086DE FF               [ 2] 1319         LDW (X),Y
      0086DF 81               [ 4] 1320         RET
                                   1321 
                                   1322 ;       tmp     ( -- a )
                                   1323 ;       A temporary storage.
      0086E0 86 D2                 1324         .word      LINK
                                   1325         
                           000662  1326 LINK = . 
      0086E2 03                    1327 	.byte      3
      0086E3 54 4D 50              1328         .ascii     "TMP"
      0086E6                       1329 TEMP:
      0086E6 90 AE 00 08      [ 2] 1330 	LDW Y,#UTMP
      0086EA 1D 00 02         [ 2] 1331 	SUBW X,#2
      0086ED FF               [ 2] 1332         LDW (X),Y
      0086EE 81               [ 4] 1333         RET
                                   1334 
                                   1335 ;       >IN     ( -- a )
                                   1336 ;        Hold parsing pointer.
      0086EF 86 E2                 1337         .word      LINK
                           000671  1338 LINK = . 
      0086F1 03                    1339         .byte      3
      0086F2 3E 49 4E              1340         .ascii    ">IN"
      0086F5                       1341 INN:
      0086F5 90 AE 00 0A      [ 2] 1342 	LDW Y,#UINN 
      0086F9 1D 00 02         [ 2] 1343 	SUBW X,#2
      0086FC FF               [ 2] 1344         LDW (X),Y
      0086FD 81               [ 4] 1345         RET
                                   1346 
                                   1347 ;       #TIB    ( -- a )
                                   1348 ;       Count in terminal input buffer.
      0086FE 86 F1                 1349         .word      LINK
                           000680  1350 LINK = . 
      008700 04                    1351         .byte      4
      008701 23 54 49 42           1352         .ascii     "#TIB"
      008705                       1353 NTIB:
      008705 90 AE 00 0C      [ 2] 1354 	LDW Y,#UCTIB 
      008709 1D 00 02         [ 2] 1355 	SUBW X,#2
      00870C FF               [ 2] 1356         LDW (X),Y
      00870D 81               [ 4] 1357         RET
                                   1358 
                                   1359 ;       TBUF ( -- a )
                                   1360 ;       address of 128 bytes transaction buffer 
      00870E 87 00                 1361         .word LINK 
                           000690  1362         LINK=.
      008710 04                    1363         .byte 4 
      008711 54 42 55 46           1364         .ascii "TBUF"
      008715                       1365 TBUF:
      008715 90 AE 16 80      [ 2] 1366         ldw y,#ROWBUFF
      008719 1D 00 02         [ 2] 1367         subw x,#CELLL
      00871C FF               [ 2] 1368         ldw (x),y 
      00871D 81               [ 4] 1369         ret 
                                   1370 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal [24-Bits]



                                   1371 ; systeme variable 
                                   1372 ; compilation destination 
                                   1373 ; TFLASH ( -- A )
      00871E 87 10                 1374         .word LINK 
                           0006A0  1375         LINK=.
      008720 06                    1376         .byte 6 
      008721 54 46 4C 41 53 48     1377         .ascii "TFLASH"         
      008727                       1378 TFLASH:
      008727 1D 00 02         [ 2] 1379         subw x,#CELLL 
      00872A 90 AE 00 1E      [ 2] 1380         ldw y,#UTFLASH
      00872E FF               [ 2] 1381         ldw (x),y 
      00872F 81               [ 4] 1382         ret 
                                   1383 
                                   1384 ;       "EVAL   ( -- a )
                                   1385 ;       Execution vector of EVAL.
      008730 87 20                 1386         .word      LINK
                           0006B2  1387 LINK = . 
      008732 05                    1388         .byte      5
      008733 27 45 56 41 4C        1389         .ascii     "'EVAL"
      008738                       1390 TEVAL:
      008738 90 AE 00 10      [ 2] 1391 	LDW Y,#UINTER 
      00873C 1D 00 02         [ 2] 1392 	SUBW X,#2
      00873F FF               [ 2] 1393         LDW (X),Y
      008740 81               [ 4] 1394         RET
                                   1395 
                                   1396 ;       HLD     ( -- a )
                                   1397 ;       Hold a pointer of output string.
      008741 87 32                 1398         .word      LINK
                           0006C3  1399 LINK = . 
      008743 03                    1400         .byte      3
      008744 48 4C 44              1401         .ascii     "HLD"
      008747                       1402 HLD:
      008747 90 AE 00 12      [ 2] 1403 	LDW Y,#UHLD 
      00874B 1D 00 02         [ 2] 1404 	SUBW X,#2
      00874E FF               [ 2] 1405         LDW (X),Y
      00874F 81               [ 4] 1406         RET
                                   1407 
                                   1408 ;       CONTEXT ( -- a )
                                   1409 ;       Start vocabulary search.
      008750 87 43                 1410         .word      LINK
                           0006D2  1411 LINK = . 
      008752 07                    1412         .byte      7
      008753 43 4F 4E 54 45 58 54  1413         .ascii     "CONTEXT"
      00875A                       1414 CNTXT:
      00875A 90 AE 00 14      [ 2] 1415 	LDW Y,#UCNTXT
      00875E 1D 00 02         [ 2] 1416 	SUBW X,#2
      008761 FF               [ 2] 1417         LDW (X),Y
      008762 81               [ 4] 1418         RET
                                   1419 
                                   1420 ;       VP      ( -- a )
                                   1421 ;       Point to top of variables
      008763 87 52                 1422         .word      LINK
                           0006E5  1423 LINK = . 
      008765 02                    1424         .byte      2
      008766 56 50                 1425         .ascii     "VP"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



      008768                       1426 VPP:
      008768 90 AE 00 16      [ 2] 1427 	LDW Y,#UVP 
      00876C 1D 00 02         [ 2] 1428 	SUBW X,#2
      00876F FF               [ 2] 1429         LDW (X),Y
      008770 81               [ 4] 1430         RET
                                   1431 
                                   1432 ;       CP    ( -- a )
                                   1433 ;       Pointer to top of FLASH 
      008771 87 65                 1434         .word LINK 
                           0006F3  1435         LINK=.
      008773 02                    1436         .byte 2 
      008774 43 50                 1437         .ascii "CP"
      008776                       1438 CPP: 
      008776 90 AE 00 18      [ 2] 1439         ldw y,#UCP 
      00877A 1D 00 02         [ 2] 1440         subw x,#CELLL 
      00877D FF               [ 2] 1441         ldw (x),y 
      00877E 81               [ 4] 1442         ret                
                                   1443 
                                   1444 ;       LAST    ( -- a )
                                   1445 ;       Point to last name in dictionary.
      00877F 87 73                 1446         .word      LINK
                           000701  1447 LINK = . 
      008781 04                    1448         .byte      4
      008782 4C 41 53 54           1449         .ascii     "LAST"
      008786                       1450 LAST:
      008786 90 AE 00 1A      [ 2] 1451 	LDW Y,#ULAST 
      00878A 1D 00 02         [ 2] 1452 	SUBW X,#2
      00878D FF               [ 2] 1453         LDW (X),Y
      00878E 81               [ 4] 1454         RET
                                   1455 
                                   1456 ; address of system variable URLAST 
                                   1457 ;       RAMLAST ( -- a )
                                   1458 ; RAM dictionary context 
      00878F 87 81                 1459         .word LINK 
                           000711  1460         LINK=. 
      008791 07                    1461         .byte 7  
      008792 52 41 4D 4C 41 53 54  1462         .ascii "RAMLAST" 
      008799                       1463 RAMLAST: 
      008799 90 AE 00 20      [ 2] 1464         ldw y,#URLAST 
      00879D 1D 00 02         [ 2] 1465         subw x,#CELLL 
      0087A0 FF               [ 2] 1466         ldw (x),y 
      0087A1 81               [ 4] 1467         ret 
                                   1468 
                                   1469 ; OFFSET ( -- a )
                                   1470 ; address of system variable OFFSET 
      0087A2 87 91                 1471         .word LINK 
                           000724  1472         LINK=.
      0087A4 06                    1473         .byte 6
      0087A5 4F 46 46 53 45 54     1474         .ascii "OFFSET" 
      0087AB                       1475 OFFSET: 
      0087AB 1D 00 02         [ 2] 1476         subw x,#CELLL
      0087AE 90 AE 00 1C      [ 2] 1477         ldw y,#UOFFSET 
      0087B2 FF               [ 2] 1478         ldw (x),y 
      0087B3 81               [ 4] 1479         ret 
                                   1480 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



                                   1481 ; adjust jump address adding OFFSET
                                   1482 ; ADR-ADJ ( a -- a+offset )
      0087B4                       1483 ADRADJ: 
      0087B4 CD 87 AB         [ 4] 1484         call OFFSET 
      0087B7 CD 85 73         [ 4] 1485         call AT 
      0087BA CC 88 15         [ 2] 1486         jp PLUS 
                                   1487 
                                   1488 
                                   1489 ;; Common functions
                                   1490 
                                   1491 ;       ?DUP    ( w -- w w | 0 )
                                   1492 ;       Dup tos if its is not zero.
      0087BD 87 A4                 1493         .word      LINK
                           00073F  1494 LINK = . 
      0087BF 04                    1495         .byte      4
      0087C0 3F 44 55 50           1496         .ascii     "?DUP"
      0087C4                       1497 QDUP:
      0087C4 90 93            [ 1] 1498         LDW Y,X
      0087C6 90 FE            [ 2] 1499 	LDW Y,(Y)
      0087C8 27 04            [ 1] 1500         JREQ     QDUP1
      0087CA 1D 00 02         [ 2] 1501 	SUBW X,#2
      0087CD FF               [ 2] 1502         LDW (X),Y
      0087CE 81               [ 4] 1503 QDUP1:  RET
                                   1504 
                                   1505 ;       ROT     ( w1 w2 w3 -- w2 w3 w1 )
                                   1506 ;       Rot 3rd item to top.
      0087CF 87 BF                 1507         .word      LINK
                           000751  1508 LINK = . 
      0087D1 03                    1509         .byte      3
      0087D2 52 4F 54              1510         .ascii     "ROT"
      0087D5                       1511 ROT:
      0087D5 90 93            [ 1] 1512         ldw y,x 
      0087D7 90 FE            [ 2] 1513         ldw y,(y)
      0087D9 90 89            [ 2] 1514         pushw y 
      0087DB 90 93            [ 1] 1515         ldw y,x 
      0087DD 90 EE 04         [ 2] 1516         ldw y,(4,y)
      0087E0 FF               [ 2] 1517         ldw (x),y 
      0087E1 90 93            [ 1] 1518         ldw y,x 
      0087E3 90 EE 02         [ 2] 1519         ldw y,(2,y)
      0087E6 EF 04            [ 2] 1520         ldw (4,x),y 
      0087E8 90 85            [ 2] 1521         popw y 
      0087EA EF 02            [ 2] 1522         ldw (2,x),y
      0087EC 81               [ 4] 1523         ret 
                                   1524 
                                   1525 ;       2DROP   ( w w -- )
                                   1526 ;       Discard two items on stack.
      0087ED 87 D1                 1527         .word      LINK
                           00076F  1528 LINK = . 
      0087EF 05                    1529         .byte      5
      0087F0 32 44 52 4F 50        1530         .ascii     "2DROP"
      0087F5                       1531 DDROP:
      0087F5 1C 00 04         [ 2] 1532         ADDW X,#4
      0087F8 81               [ 4] 1533         RET
                                   1534 
                                   1535 ;       2DUP    ( w1 w2 -- w1 w2 w1 w2 )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



                                   1536 ;       Duplicate top two items.
      0087F9 87 EF                 1537         .word      LINK
                           00077B  1538 LINK = . 
      0087FB 04                    1539         .byte      4
      0087FC 32 44 55 50           1540         .ascii     "2DUP"
      008800                       1541 DDUP:
      008800 1D 00 04         [ 2] 1542         SUBW X,#4
      008803 90 93            [ 1] 1543         LDW Y,X
      008805 90 EE 06         [ 2] 1544         LDW Y,(6,Y)
      008808 EF 02            [ 2] 1545         LDW (2,X),Y
      00880A 90 93            [ 1] 1546         LDW Y,X
      00880C 90 EE 04         [ 2] 1547         LDW Y,(4,Y)
      00880F FF               [ 2] 1548         LDW (X),Y
      008810 81               [ 4] 1549         RET
                                   1550 
                                   1551 ;       +       ( w w -- sum )
                                   1552 ;       Add top two items.
      008811 87 FB                 1553         .word      LINK
                           000793  1554 LINK = . 
      008813 01                    1555         .byte      1
      008814 2B                    1556         .ascii     "+"
      008815                       1557 PLUS:
      008815 90 93            [ 1] 1558         LDW Y,X
      008817 90 FE            [ 2] 1559         LDW Y,(Y)
      008819 90 BF 24         [ 2] 1560         LDW YTEMP,Y
      00881C 1C 00 02         [ 2] 1561         ADDW X,#2
      00881F 90 93            [ 1] 1562         LDW Y,X
      008821 90 FE            [ 2] 1563         LDW Y,(Y)
      008823 72 B9 00 24      [ 2] 1564         ADDW Y,YTEMP
      008827 FF               [ 2] 1565         LDW (X),Y
      008828 81               [ 4] 1566         RET
                                   1567 
                                   1568 ;       NOT     ( w -- w )
                                   1569 ;       One's complement of tos.
      008829 88 13                 1570         .word      LINK
                           0007AB  1571 LINK = . 
      00882B 03                    1572         .byte      3
      00882C 4E 4F 54              1573         .ascii     "NOT"
      00882F                       1574 INVER:
      00882F 90 93            [ 1] 1575         LDW Y,X
      008831 90 FE            [ 2] 1576         LDW Y,(Y)
      008833 90 53            [ 2] 1577         CPLW Y
      008835 FF               [ 2] 1578         LDW (X),Y
      008836 81               [ 4] 1579         RET
                                   1580 
                                   1581 ;       NEGATE  ( n -- -n )
                                   1582 ;       Two's complement of tos.
      008837 88 2B                 1583         .word      LINK
                           0007B9  1584 LINK = . 
      008839 06                    1585         .byte      6
      00883A 4E 45 47 41 54 45     1586         .ascii     "NEGATE"
      008840                       1587 NEGAT:
      008840 90 93            [ 1] 1588         LDW Y,X
      008842 90 FE            [ 2] 1589         LDW Y,(Y)
      008844 90 50            [ 2] 1590         NEGW Y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



      008846 FF               [ 2] 1591         LDW (X),Y
      008847 81               [ 4] 1592         RET
                                   1593 
                                   1594 ;       DNEGATE ( d -- -d )
                                   1595 ;       Two's complement of top double.
      008848 88 39                 1596         .word      LINK
                           0007CA  1597 LINK = . 
      00884A 07                    1598         .byte      7
      00884B 44 4E 45 47 41 54 45  1599         .ascii     "DNEGATE"
      008852                       1600 DNEGA:
      008852 90 93            [ 1] 1601         LDW Y,X
      008854 90 FE            [ 2] 1602 	LDW Y,(Y)
      008856 90 53            [ 2] 1603         CPLW Y     
      008858 90 BF 24         [ 2] 1604 	LDW YTEMP,Y
      00885B 90 93            [ 1] 1605         LDW Y,X
      00885D 90 EE 02         [ 2] 1606         LDW Y,(2,Y)
      008860 90 53            [ 2] 1607         CPLW Y
      008862 72 A9 00 01      [ 2] 1608         addw y,#1
      008866 EF 02            [ 2] 1609         LDW (2,X),Y
      008868 90 BE 24         [ 2] 1610         LDW Y,YTEMP
      00886B 24 02            [ 1] 1611         JRNC DN1 
      00886D 90 5C            [ 1] 1612         INCW Y
      00886F FF               [ 2] 1613 DN1:    LDW (X),Y
      008870 81               [ 4] 1614         RET
                                   1615 
                                   1616 
                                   1617 ;       S>D ( n -- d )
                                   1618 ; convert single integer to double 
      008871 88 4A                 1619         .word LINK 
                           0007F3  1620         LINK=. 
      008873 03                    1621         .byte 3 
      008874 53 3E 44              1622         .ascii "S>D"
      008877                       1623 STOD: 
      008877 1D 00 02         [ 2] 1624         subw x,#CELLL 
      00887A 90 5F            [ 1] 1625         clrw y 
      00887C FF               [ 2] 1626         ldw (x),y 
      00887D 90 93            [ 1] 1627         ldw y,x 
      00887F 90 EE 02         [ 2] 1628         ldw y,(2,y)
      008882 2A 05            [ 1] 1629         jrpl 1$ 
      008884 90 AE FF FF      [ 2] 1630         ldw y,#-1
      008888 FF               [ 2] 1631         ldw (x),y 
      008889 81               [ 4] 1632 1$:     ret 
                                   1633 
                                   1634 
                                   1635 
                                   1636 
                                   1637 ;       -       ( n1 n2 -- n1-n2 )
                                   1638 ;       Subtraction.
      00888A 88 73                 1639         .word      LINK
                           00080C  1640 LINK = . 
      00888C 01                    1641         .byte      1
      00888D 2D                    1642         .ascii     "-"
      00888E                       1643 SUBB:
      00888E 90 93            [ 1] 1644         LDW Y,X
      008890 90 FE            [ 2] 1645         LDW Y,(Y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



      008892 90 BF 24         [ 2] 1646         LDW YTEMP,Y
      008895 1C 00 02         [ 2] 1647         ADDW X,#2
      008898 90 93            [ 1] 1648         LDW Y,X
      00889A 90 FE            [ 2] 1649         LDW Y,(Y)
      00889C 72 B2 00 24      [ 2] 1650         SUBW Y,YTEMP
      0088A0 FF               [ 2] 1651         LDW (X),Y
      0088A1 81               [ 4] 1652         RET
                                   1653 
                                   1654 ;       ABS     ( n -- n )
                                   1655 ;       Return  absolute value of n.
      0088A2 88 8C                 1656         .word      LINK
                           000824  1657 LINK = . 
      0088A4 03                    1658         .byte      3
      0088A5 41 42 53              1659         .ascii     "ABS"
      0088A8                       1660 ABSS:
      0088A8 90 93            [ 1] 1661         LDW Y,X
      0088AA 90 FE            [ 2] 1662 	LDW Y,(Y)
      0088AC 2A 03            [ 1] 1663         JRPL     AB1     ;negate:
      0088AE 90 50            [ 2] 1664         NEGW     Y     ;else negate hi byte
      0088B0 FF               [ 2] 1665         LDW (X),Y
      0088B1 81               [ 4] 1666 AB1:    RET
                                   1667 
                                   1668 ;       =       ( w w -- t )
                                   1669 ;       Return true if top two are =al.
      0088B2 88 A4                 1670         .word      LINK
                           000834  1671 LINK = . 
      0088B4 01                    1672         .byte      1
      0088B5 3D                    1673         .ascii     "="
      0088B6                       1674 EQUAL:
      0088B6 A6 FF            [ 1] 1675         LD A,#0xFF  ;true
      0088B8 90 93            [ 1] 1676         LDW Y,X    ;D = n2
      0088BA 90 FE            [ 2] 1677         LDW Y,(Y)
      0088BC 90 BF 24         [ 2] 1678         LDW YTEMP,Y
      0088BF 1C 00 02         [ 2] 1679         ADDW X,#2
      0088C2 90 93            [ 1] 1680         LDW Y,X
      0088C4 90 FE            [ 2] 1681         LDW Y,(Y)
      0088C6 90 B3 24         [ 2] 1682         CPW Y,YTEMP     ;if n2 <> n1
      0088C9 27 01            [ 1] 1683         JREQ     EQ1
      0088CB 4F               [ 1] 1684         CLR A
      0088CC F7               [ 1] 1685 EQ1:    LD (X),A
      0088CD E7 01            [ 1] 1686         LD (1,X),A
      0088CF 81               [ 4] 1687 	RET     
                                   1688 
                                   1689 ;       U<      ( u u -- t )
                                   1690 ;       Unsigned compare of top two items.
      0088D0 88 B4                 1691         .word      LINK
                           000852  1692 LINK = . 
      0088D2 02                    1693         .byte      2
      0088D3 55 3C                 1694         .ascii     "U<"
      0088D5                       1695 ULESS:
      0088D5 A6 FF            [ 1] 1696         LD A,#0xFF  ;true
      0088D7 90 93            [ 1] 1697         LDW Y,X    ;D = n2
      0088D9 90 FE            [ 2] 1698         LDW Y,(Y)
      0088DB 90 BF 24         [ 2] 1699         LDW YTEMP,Y
      0088DE 1C 00 02         [ 2] 1700         ADDW X,#2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



      0088E1 90 93            [ 1] 1701         LDW Y,X
      0088E3 90 FE            [ 2] 1702         LDW Y,(Y)
      0088E5 90 B3 24         [ 2] 1703         CPW Y,YTEMP     ;if n2 <> n1
      0088E8 25 01            [ 1] 1704         JRULT     ULES1
      0088EA 4F               [ 1] 1705         CLR A
      0088EB F7               [ 1] 1706 ULES1:  LD (X),A
      0088EC E7 01            [ 1] 1707         LD (1,X),A
      0088EE 81               [ 4] 1708 	RET     
                                   1709 
                                   1710 ;       <       ( n1 n2 -- t )
                                   1711 ;       Signed compare of top two items.
      0088EF 88 D2                 1712         .word      LINK
                           000871  1713 LINK = . 
      0088F1 01                    1714         .byte      1
      0088F2 3C                    1715         .ascii     "<"
      0088F3                       1716 LESS:
      0088F3 A6 FF            [ 1] 1717         LD A,#0xFF  ;true
      0088F5 90 93            [ 1] 1718         LDW Y,X    ;D = n2
      0088F7 90 FE            [ 2] 1719         LDW Y,(Y)
      0088F9 90 BF 24         [ 2] 1720         LDW YTEMP,Y
      0088FC 1C 00 02         [ 2] 1721         ADDW X,#2
      0088FF 90 93            [ 1] 1722         LDW Y,X
      008901 90 FE            [ 2] 1723         LDW Y,(Y)
      008903 90 B3 24         [ 2] 1724         CPW Y,YTEMP     ;if n2 <> n1
      008906 2F 01            [ 1] 1725         JRSLT     LT1
      008908 4F               [ 1] 1726         CLR A
      008909 F7               [ 1] 1727 LT1:    LD (X),A
      00890A E7 01            [ 1] 1728         LD (1,X),A
      00890C 81               [ 4] 1729 	RET     
                                   1730 
                                   1731 ;       MAX     ( n n -- n )
                                   1732 ;       Return greater of two top items.
      00890D 88 F1                 1733         .word      LINK
                           00088F  1734 LINK = . 
      00890F 03                    1735         .byte      3
      008910 4D 41 58              1736         .ascii     "MAX"
      008913                       1737 MAX:
      008913 90 93            [ 1] 1738         LDW Y,X    ;D = n2
      008915 90 EE 02         [ 2] 1739         LDW Y,(2,Y)
      008918 90 BF 24         [ 2] 1740         LDW YTEMP,Y
      00891B 90 93            [ 1] 1741         LDW Y,X
      00891D 90 FE            [ 2] 1742         LDW Y,(Y)
      00891F 90 B3 24         [ 2] 1743         CPW Y,YTEMP     ;if n2 <> n1
      008922 2F 02            [ 1] 1744         JRSLT     MAX1
      008924 EF 02            [ 2] 1745         LDW (2,X),Y
      008926 1C 00 02         [ 2] 1746 MAX1:   ADDW X,#2
      008929 81               [ 4] 1747 	RET     
                                   1748 
                                   1749 ;       MIN     ( n n -- n )
                                   1750 ;       Return smaller of top two items.
      00892A 89 0F                 1751         .word      LINK
                           0008AC  1752 LINK = . 
      00892C 03                    1753         .byte      3
      00892D 4D 49 4E              1754         .ascii     "MIN"
      008930                       1755 MIN:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



      008930 90 93            [ 1] 1756         LDW Y,X    ;D = n2
      008932 90 EE 02         [ 2] 1757         LDW Y,(2,Y)
      008935 90 BF 24         [ 2] 1758         LDW YTEMP,Y
      008938 90 93            [ 1] 1759         LDW Y,X
      00893A 90 FE            [ 2] 1760         LDW Y,(Y)
      00893C 90 B3 24         [ 2] 1761         CPW Y,YTEMP     ;if n2 <> n1
      00893F 2C 02            [ 1] 1762         JRSGT     MIN1
      008941 EF 02            [ 2] 1763         LDW (2,X),Y
      008943 1C 00 02         [ 2] 1764 MIN1:	ADDW X,#2
      008946 81               [ 4] 1765 	RET     
                                   1766 
                                   1767 ;       WITHIN  ( u ul uh -- t )
                                   1768 ;       Return true if u is within
                                   1769 ;       range of ul and uh. ( ul <= u < uh )
      008947 89 2C                 1770         .word      LINK
                           0008C9  1771 LINK = . 
      008949 06                    1772         .byte      6
      00894A 57 49 54 48 49 4E     1773         .ascii     "WITHIN"
      008950                       1774 WITHI:
      008950 CD 86 44         [ 4] 1775         CALL     OVER
      008953 CD 88 8E         [ 4] 1776         CALL     SUBB
      008956 CD 85 E3         [ 4] 1777         CALL     TOR
      008959 CD 88 8E         [ 4] 1778         CALL     SUBB
      00895C CD 85 C4         [ 4] 1779         CALL     RFROM
      00895F CC 88 D5         [ 2] 1780         JP     ULESS
                                   1781 
                                   1782 ;; Divide
                                   1783 
                                   1784 ;       UM/MOD  ( udl udh un -- ur uq )
                                   1785 ;       Unsigned divide of a double by a
                                   1786 ;       single. Return mod and quotient.
      008962 89 49                 1787         .word      LINK
                           0008E4  1788 LINK = . 
      008964 06                    1789         .byte      6
      008965 55 4D 2F 4D 4F 44     1790         .ascii     "UM/MOD"
      00896B                       1791 UMMOD:
      00896B 89               [ 2] 1792         PUSHW   X               ; save stack pointer
      00896C FE               [ 2] 1793         LDW     X,(X)           ; un
      00896D BF 24            [ 2] 1794         LDW     YTEMP,X         ; save un
      00896F 16 01            [ 2] 1795         LDW     Y,(1,SP)        ; X stack pointer
      008971 90 EE 04         [ 2] 1796         LDW     Y,(4,Y)         ; Y=udl
      008974 1E 01            [ 2] 1797         LDW     X,(1,SP)        ; X
      008976 EE 02            [ 2] 1798         LDW     X,(2,X)         ; X=udh
      008978 B3 24            [ 2] 1799         CPW     X,YTEMP
      00897A 25 0D            [ 1] 1800         JRULT   MMSM1           ; X is still on the R-stack
                                   1801 ; division overflow  return q=0,r=-1 
      00897C 85               [ 2] 1802         POPW    X
      00897D 5C               [ 1] 1803         INCW    X               ; pop off 1 level
      00897E 5C               [ 1] 1804         INCW    X               ; ADDW   X,#2
      00897F 90 AE FF FF      [ 2] 1805         LDW     Y,#0xFFFF
      008983 FF               [ 2] 1806         LDW     (X),Y
      008984 90 5F            [ 1] 1807         CLRW    Y
      008986 EF 02            [ 2] 1808         LDW     (2,X),Y
      008988 81               [ 4] 1809         RET
      008989                       1810 MMSM1:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



      008989 A6 11            [ 1] 1811         LD      A,#17           ; loop count
      00898B                       1812 MMSM3:
      00898B B3 24            [ 2] 1813         CPW     X,YTEMP         ; compare udh to un
      00898D 25 05            [ 1] 1814         JRULT   MMSM4           ; can't subtract
      00898F                       1815 MMSMa:
      00898F 72 B0 00 24      [ 2] 1816         SUBW    X,YTEMP         ; can subtract
      008993 98               [ 1] 1817         RCF 
      008994                       1818 MMSM4:
      008994 8C               [ 1] 1819         CCF                     ; quotient bit
      008995 90 59            [ 2] 1820         RLCW    Y               ; rotate into quotient
      008997 59               [ 2] 1821         RLCW    X               ; rotate into remainder
      008998 4A               [ 1] 1822         DEC     A               ; repeat
      008999 27 04            [ 1] 1823         JREQ    MMSMb           ; if A == 0
      00899B 25 F2            [ 1] 1824         JRC     MMSMa           ; if carry out of rotate
      00899D 20 EC            [ 2] 1825         JRA     MMSM3           ;
      00899F                       1826 MMSMb:
      00899F 56               [ 2] 1827         RRCW    X
      0089A0 BF 24            [ 2] 1828         LDW     YTEMP,X         ; done, save remainder
      0089A2 85               [ 2] 1829         POPW    X
      0089A3 5C               [ 1] 1830         INCW    X               ; drop
      0089A4 5C               [ 1] 1831         INCW    X               ; ADDW   X,#2
      0089A5 FF               [ 2] 1832         LDW     (X),Y
      0089A6 90 BE 24         [ 2] 1833         LDW     Y,YTEMP         ; save quotient
      0089A9 EF 02            [ 2] 1834         LDW     (2,X),Y
      0089AB 81               [ 4] 1835         RET
                                   1836 
                                   1837 ;----------------------------------------------	
                                   1838 ;       M/MOD   ( d n -- r q )
                                   1839 ;       Signed floored divide of double by
                                   1840 ;       single. Return mod and quotient.
                                   1841 ;----------------------------------------------	
      0089AC 89 64                 1842         .word      LINK
                           00092E  1843 LINK = . 
      0089AE 05                    1844         .byte      5
      0089AF 4D 2F 4D 4F 44        1845         .ascii     "M/MOD"
      0089B4                       1846 MSMOD:  
      0089B4 CD 86 1A         [ 4] 1847         CALL	DUPP
      0089B7 CD 86 53         [ 4] 1848         CALL	ZLESS
      0089BA CD 86 1A         [ 4] 1849         CALL	DUPP
      0089BD CD 85 E3         [ 4] 1850         CALL	TOR
      0089C0 CD 85 28         [ 4] 1851         CALL	QBRAN
      0089C3 89 D1                 1852         .word	MMOD1
      0089C5 CD 88 40         [ 4] 1853         CALL	NEGAT
      0089C8 CD 85 E3         [ 4] 1854         CALL	TOR
      0089CB CD 88 52         [ 4] 1855         CALL	DNEGA
      0089CE CD 85 C4         [ 4] 1856         CALL	RFROM
      0089D1 CD 85 E3         [ 4] 1857 MMOD1:	CALL	TOR
      0089D4 CD 86 1A         [ 4] 1858         CALL	DUPP
      0089D7 CD 86 53         [ 4] 1859         CALL	ZLESS
      0089DA CD 85 28         [ 4] 1860         CALL	QBRAN
      0089DD 89 E5                 1861         .word	MMOD2
      0089DF CD 85 D7         [ 4] 1862         CALL	RAT
      0089E2 CD 88 15         [ 4] 1863         CALL	PLUS
      0089E5 CD 85 C4         [ 4] 1864 MMOD2:	CALL	RFROM
      0089E8 CD 89 6B         [ 4] 1865         CALL	UMMOD
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



      0089EB CD 85 C4         [ 4] 1866         CALL	RFROM
      0089EE CD 85 28         [ 4] 1867         CALL	QBRAN
      0089F1 89 FC                 1868         .word	MMOD3
      0089F3 CD 86 2A         [ 4] 1869         CALL	SWAPP
      0089F6 CD 88 40         [ 4] 1870         CALL	NEGAT
      0089F9 CD 86 2A         [ 4] 1871         CALL	SWAPP
      0089FC 81               [ 4] 1872 MMOD3:	RET
                                   1873 
                                   1874 ;       /MOD    ( n n -- r q )
                                   1875 ;       Signed divide. Return mod and quotient.
      0089FD 89 AE                 1876         .word      LINK
                           00097F  1877 LINK = . 
      0089FF 04                    1878         .byte      4
      008A00 2F 4D 4F 44           1879         .ascii     "/MOD"
      008A04                       1880 SLMOD:
      008A04 CD 86 44         [ 4] 1881         CALL	OVER
      008A07 CD 86 53         [ 4] 1882         CALL	ZLESS
      008A0A CD 86 2A         [ 4] 1883         CALL	SWAPP
      008A0D CC 89 B4         [ 2] 1884         JP	MSMOD
                                   1885 
                                   1886 ;       MOD     ( n n -- r )
                                   1887 ;       Signed divide. Return mod only.
      008A10 89 FF                 1888         .word      LINK
                           000992  1889 LINK = . 
      008A12 03                    1890         .byte      3
      008A13 4D 4F 44              1891         .ascii     "MOD"
      008A16                       1892 MODD:
      008A16 CD 8A 04         [ 4] 1893 	CALL	SLMOD
      008A19 CC 86 10         [ 2] 1894 	JP	DROP
                                   1895 
                                   1896 ;       /       ( n n -- q )
                                   1897 ;       Signed divide. Return quotient only.
      008A1C 8A 12                 1898         .word      LINK
                           00099E  1899 LINK = . 
      008A1E 01                    1900         .byte      1
      008A1F 2F                    1901         .ascii     "/"
      008A20                       1902 SLASH:
      008A20 CD 8A 04         [ 4] 1903         CALL	SLMOD
      008A23 CD 86 2A         [ 4] 1904         CALL	SWAPP
      008A26 CC 86 10         [ 2] 1905         JP	DROP
                                   1906 
                                   1907 ;; Multiply
                                   1908 
                                   1909 ;       UM*     ( u u -- ud )
                                   1910 ;       Unsigned multiply. Return double product.
      008A29 8A 1E                 1911         .word      LINK
                           0009AB  1912 LINK = . 
      008A2B 03                    1913         .byte      3
      008A2C 55 4D 2A              1914         .ascii     "UM*"
      008A2F                       1915 UMSTA:	; stack have 4 bytes u1=a,b u2=c,d
                                   1916 ; take advantage of SP addressing modes
                                   1917 ; these PRODx in RAM are not required
                                   1918 ; the product is kept on stack as local variable 
                                   1919         ;; bytes offset on data stack 
                           000002  1920         da=2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



                           000003  1921         db=3 
                           000000  1922         dc=0 
                           000001  1923         dd=1 
                                   1924         ;; product bytes offset on return stack 
                           000001  1925         UD1=1  ; ud bits 31..24
                           000002  1926         UD2=2  ; ud bits 23..16
                           000003  1927         UD3=3  ; ud bits 15..8 
                           000004  1928         UD4=4  ; ud bits 7..0 
                                   1929         ;; local variable for product set to zero   
      008A2F 90 5F            [ 1] 1930         clrw y 
      008A31 90 89            [ 2] 1931         pushw y  ; bits 15..0
      008A33 90 89            [ 2] 1932         pushw y  ; bits 31..16 
      008A35 E6 03            [ 1] 1933         ld a,(db,x) ; b 
      008A37 90 97            [ 1] 1934         ld yl,a 
      008A39 E6 01            [ 1] 1935         ld a,(dd,x)   ; d
      008A3B 90 42            [ 4] 1936         mul y,a    ; b*d  
      008A3D 17 03            [ 2] 1937         ldw (UD3,sp),y ; lowest weight product 
      008A3F E6 03            [ 1] 1938         ld a,(db,x)
      008A41 90 97            [ 1] 1939         ld yl,a 
      008A43 E6 00            [ 1] 1940         ld a,(dc,x)
      008A45 90 42            [ 4] 1941         mul y,a  ; b*c 
                                   1942         ;;; do the partial sum 
      008A47 72 F9 02         [ 2] 1943         addw y,(UD2,sp)
      008A4A 4F               [ 1] 1944         clr a 
      008A4B 49               [ 1] 1945         rlc a
      008A4C 6B 01            [ 1] 1946         ld (UD1,sp),a 
      008A4E 17 02            [ 2] 1947         ldw (UD2,sp),y 
      008A50 E6 02            [ 1] 1948         ld a,(da,x)
      008A52 90 97            [ 1] 1949         ld yl,a 
      008A54 E6 01            [ 1] 1950         ld a,(dd,x)
      008A56 90 42            [ 4] 1951         mul y,a   ; a*d 
                                   1952         ;; do partial sum 
      008A58 72 F9 02         [ 2] 1953         addw y,(UD2,sp)
      008A5B 4F               [ 1] 1954         clr a 
      008A5C 19 01            [ 1] 1955         adc a,(UD1,sp)
      008A5E 6B 01            [ 1] 1956         ld (UD1,sp),a  
      008A60 17 02            [ 2] 1957         ldw (UD2,sp),y 
      008A62 E6 02            [ 1] 1958         ld a,(da,x)
      008A64 90 97            [ 1] 1959         ld yl,a 
      008A66 E6 00            [ 1] 1960         ld a,(dc,x)
      008A68 90 42            [ 4] 1961         mul y,a  ;  a*c highest weight product 
                                   1962         ;;; do partial sum 
      008A6A 72 F9 01         [ 2] 1963         addw y,(UD1,sp)
      008A6D FF               [ 2] 1964         ldw (x),y  ; udh 
      008A6E 16 03            [ 2] 1965         ldw y,(UD3,sp)
      008A70 EF 02            [ 2] 1966         ldw (2,x),y  ; udl  
      008A72 5B 04            [ 2] 1967         addw sp,#4 ; drop local variable 
      008A74 81               [ 4] 1968         ret  
                                   1969 
                                   1970 
                                   1971 ;       *       ( n n -- n )
                                   1972 ;       Signed multiply. Return single product.
      008A75 8A 2B                 1973         .word      LINK
                           0009F7  1974 LINK = . 
      008A77 01                    1975         .byte      1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



      008A78 2A                    1976         .ascii     "*"
      008A79                       1977 STAR:
      008A79 CD 8A 2F         [ 4] 1978 	CALL	UMSTA
      008A7C CC 86 10         [ 2] 1979 	JP	DROP
                                   1980 
                                   1981 ;       M*      ( n n -- d )
                                   1982 ;       Signed multiply. Return double product.
      008A7F 8A 77                 1983         .word      LINK
                           000A01  1984 LINK = . 
      008A81 02                    1985         .byte      2
      008A82 4D 2A                 1986         .ascii     "M*"
      008A84                       1987 MSTAR:      
      008A84 CD 88 00         [ 4] 1988         CALL	DDUP
      008A87 CD 86 8F         [ 4] 1989         CALL	XORR
      008A8A CD 86 53         [ 4] 1990         CALL	ZLESS
      008A8D CD 85 E3         [ 4] 1991         CALL	TOR
      008A90 CD 88 A8         [ 4] 1992         CALL	ABSS
      008A93 CD 86 2A         [ 4] 1993         CALL	SWAPP
      008A96 CD 88 A8         [ 4] 1994         CALL	ABSS
      008A99 CD 8A 2F         [ 4] 1995         CALL	UMSTA
      008A9C CD 85 C4         [ 4] 1996         CALL	RFROM
      008A9F CD 85 28         [ 4] 1997         CALL	QBRAN
      008AA2 8A A7                 1998         .word	MSTA1
      008AA4 CD 88 52         [ 4] 1999         CALL	DNEGA
      008AA7 81               [ 4] 2000 MSTA1:	RET
                                   2001 
                                   2002 ;       */MOD   ( n1 n2 n3 -- r q )
                                   2003 ;       Multiply n1 and n2, then divide
                                   2004 ;       by n3. Return mod and quotient.
      008AA8 8A 81                 2005         .word      LINK
                           000A2A  2006 LINK = . 
      008AAA 05                    2007         .byte      5
      008AAB 2A 2F 4D 4F 44        2008         .ascii     "*/MOD"
      008AB0                       2009 SSMOD:
      008AB0 CD 85 E3         [ 4] 2010         CALL     TOR
      008AB3 CD 8A 84         [ 4] 2011         CALL     MSTAR
      008AB6 CD 85 C4         [ 4] 2012         CALL     RFROM
      008AB9 CC 89 B4         [ 2] 2013         JP     MSMOD
                                   2014 
                                   2015 ;       */      ( n1 n2 n3 -- q )
                                   2016 ;       Multiply n1 by n2, then divide
                                   2017 ;       by n3. Return quotient only.
      008ABC 8A AA                 2018         .word      LINK
                           000A3E  2019 LINK = . 
      008ABE 02                    2020         .byte      2
      008ABF 2A 2F                 2021         .ascii     "*/"
      008AC1                       2022 STASL:
      008AC1 CD 8A B0         [ 4] 2023         CALL	SSMOD
      008AC4 CD 86 2A         [ 4] 2024         CALL	SWAPP
      008AC7 CC 86 10         [ 2] 2025         JP	DROP
                                   2026 
                                   2027 ;; Miscellaneous
                                   2028 
                                   2029 ;       CELL+   ( a -- a )
                                   2030 ;       Add cell size in byte to address.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



      008ACA 8A BE                 2031         .word      LINK
                           000A4C  2032 LINK = . 
      008ACC 02                    2033         .byte       2
      008ACD 32 2B                 2034         .ascii     "2+"
      008ACF                       2035 CELLP:
      008ACF 90 93            [ 1] 2036         LDW Y,X
      008AD1 90 FE            [ 2] 2037 	LDW Y,(Y)
      008AD3 72 A9 00 02      [ 2] 2038         ADDW Y,#CELLL 
      008AD7 FF               [ 2] 2039         LDW (X),Y
      008AD8 81               [ 4] 2040         RET
                                   2041 
                                   2042 ;       CELL-   ( a -- a )
                                   2043 ;       Subtract 2 from address.
      008AD9 8A CC                 2044         .word      LINK
                           000A5B  2045 LINK = . 
      008ADB 02                    2046         .byte       2
      008ADC 32 2D                 2047         .ascii     "2-"
      008ADE                       2048 CELLM:
      008ADE 90 93            [ 1] 2049         LDW Y,X
      008AE0 90 FE            [ 2] 2050 	LDW Y,(Y)
      008AE2 72 A2 00 02      [ 2] 2051         SUBW Y,#CELLL
      008AE6 FF               [ 2] 2052         LDW (X),Y
      008AE7 81               [ 4] 2053         RET
                                   2054 
                                   2055 ;       CELLS   ( n -- n )
                                   2056 ;       Multiply tos by 2.
      008AE8 8A DB                 2057         .word      LINK
                           000A6A  2058 LINK = . 
      008AEA 02                    2059         .byte       2
      008AEB 32 2A                 2060         .ascii     "2*"
      008AED                       2061 CELLS:
      008AED 90 93            [ 1] 2062         LDW Y,X
      008AEF 90 FE            [ 2] 2063 	LDW Y,(Y)
      008AF1 90 58            [ 2] 2064         SLAW Y
      008AF3 FF               [ 2] 2065         LDW (X),Y
      008AF4 81               [ 4] 2066         RET
                                   2067 
                                   2068 ;       1+      ( a -- a )
                                   2069 ;       Add cell size in byte to address.
      008AF5 8A EA                 2070         .word      LINK
                           000A77  2071 LINK = . 
      008AF7 02                    2072         .byte      2
      008AF8 31 2B                 2073         .ascii     "1+"
      008AFA                       2074 ONEP:
      008AFA 90 93            [ 1] 2075         LDW Y,X
      008AFC 90 FE            [ 2] 2076 	LDW Y,(Y)
      008AFE 90 5C            [ 1] 2077         INCW Y
      008B00 FF               [ 2] 2078         LDW (X),Y
      008B01 81               [ 4] 2079         RET
                                   2080 
                                   2081 ;       1-      ( a -- a )
                                   2082 ;       Subtract 2 from address.
      008B02 8A F7                 2083         .word      LINK
                           000A84  2084 LINK = . 
      008B04 02                    2085         .byte      2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



      008B05 31 2D                 2086         .ascii     "1-"
      008B07                       2087 ONEM:
      008B07 90 93            [ 1] 2088         LDW Y,X
      008B09 90 FE            [ 2] 2089 	LDW Y,(Y)
      008B0B 90 5A            [ 2] 2090         DECW Y
      008B0D FF               [ 2] 2091         LDW (X),Y
      008B0E 81               [ 4] 2092         RET
                                   2093 
                                   2094 ;  shift left n times 
                                   2095 ; LSHIFT ( n1 n2 -- n1<<n2 )
      008B0F 8B 04                 2096         .word LINK 
                           000A91  2097         LINK=.
      008B11 06                    2098         .byte 6 
      008B12 4C 53 48 49 46 54     2099         .ascii "LSHIFT"
      008B18                       2100 LSHIFT:
      008B18 E6 01            [ 1] 2101         ld a,(1,x)
      008B1A 1C 00 02         [ 2] 2102         addw x,#CELLL 
      008B1D 90 93            [ 1] 2103         ldw y,x 
      008B1F 90 FE            [ 2] 2104         ldw y,(y)
      008B21                       2105 LSHIFT1:
      008B21 4D               [ 1] 2106         tnz a 
      008B22 27 05            [ 1] 2107         jreq LSHIFT4 
      008B24 90 58            [ 2] 2108         sllw y 
      008B26 4A               [ 1] 2109         dec a 
      008B27 20 F8            [ 2] 2110         jra LSHIFT1 
      008B29                       2111 LSHIFT4:
      008B29 FF               [ 2] 2112         ldw (x),y 
      008B2A 81               [ 4] 2113         ret 
                                   2114 
                                   2115 ; shift right n times                 
                                   2116 ; RSHIFT (n1 n2 -- n1>>n2 )
      008B2B 8B 11                 2117         .word LINK 
                           000AAD  2118         LINK=.
      008B2D 06                    2119         .byte 6
      008B2E 52 53 48 49 46 54     2120         .ascii "RSHIFT"
      008B34                       2121 RSHIFT:
      008B34 E6 01            [ 1] 2122         ld a,(1,x)
      008B36 1C 00 02         [ 2] 2123         addw x,#CELLL 
      008B39 90 93            [ 1] 2124         ldw y,x 
      008B3B 90 FE            [ 2] 2125         ldw y,(y)
      008B3D                       2126 RSHIFT1:
      008B3D 4D               [ 1] 2127         tnz a 
      008B3E 27 05            [ 1] 2128         jreq RSHIFT4 
      008B40 90 54            [ 2] 2129         srlw y 
      008B42 4A               [ 1] 2130         dec a 
      008B43 20 F8            [ 2] 2131         jra RSHIFT1 
      008B45                       2132 RSHIFT4:
      008B45 FF               [ 2] 2133         ldw (x),y 
      008B46 81               [ 4] 2134         ret 
                                   2135 
                                   2136 
                                   2137 ;       2/      ( n -- n )
                                   2138 ;       divide  tos by 2.
      008B47 8B 2D                 2139         .word      LINK
                           000AC9  2140 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



      008B49 02                    2141         .byte      2
      008B4A 32 2F                 2142         .ascii     "2/"
      008B4C                       2143 TWOSL:
      008B4C 90 93            [ 1] 2144         LDW Y,X
      008B4E 90 FE            [ 2] 2145 	LDW Y,(Y)
      008B50 90 57            [ 2] 2146         SRAW Y
      008B52 FF               [ 2] 2147         LDW (X),Y
      008B53 81               [ 4] 2148         RET
                                   2149 
                                   2150 ;       BL      ( -- 32 )
                                   2151 ;       Return 32,  blank character.
      008B54 8B 49                 2152         .word      LINK
                           000AD6  2153 LINK = . 
      008B56 02                    2154         .byte      2
      008B57 42 4C                 2155         .ascii     "BL"
      008B59                       2156 BLANK:
      008B59 1D 00 02         [ 2] 2157         SUBW X,#2
      008B5C 90 AE 00 20      [ 2] 2158 	LDW Y,#32
      008B60 FF               [ 2] 2159         LDW (X),Y
      008B61 81               [ 4] 2160         RET
                                   2161 
                                   2162 ;         0     ( -- 0)
                                   2163 ;         Return 0.
      008B62 8B 56                 2164         .word      LINK
                           000AE4  2165 LINK = . 
      008B64 01                    2166         .byte       1
      008B65 30                    2167         .ascii     "0"
      008B66                       2168 ZERO:
      008B66 1D 00 02         [ 2] 2169         SUBW X,#2
      008B69 90 5F            [ 1] 2170 	CLRW Y
      008B6B FF               [ 2] 2171         LDW (X),Y
      008B6C 81               [ 4] 2172         RET
                                   2173 
                                   2174 ;         1     ( -- 1)
                                   2175 ;         Return 1.
      008B6D 8B 64                 2176         .word      LINK
                           000AEF  2177 LINK = . 
      008B6F 01                    2178         .byte       1
      008B70 31                    2179         .ascii     "1"
      008B71                       2180 ONE:
      008B71 1D 00 02         [ 2] 2181         SUBW X,#2
      008B74 90 AE 00 01      [ 2] 2182 	LDW Y,#1
      008B78 FF               [ 2] 2183         LDW (X),Y
      008B79 81               [ 4] 2184         RET
                                   2185 
                                   2186 ;         -1    ( -- -1)
                                   2187 ;         Return 32,  blank character.
      008B7A 8B 6F                 2188         .word      LINK
                           000AFC  2189 LINK = . 
      008B7C 02                    2190         .byte       2
      008B7D 2D 31                 2191         .ascii     "-1"
      008B7F                       2192 MONE:
      008B7F 1D 00 02         [ 2] 2193         SUBW X,#2
      008B82 90 AE FF FF      [ 2] 2194 	LDW Y,#0xFFFF
      008B86 FF               [ 2] 2195         LDW (X),Y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



      008B87 81               [ 4] 2196         RET
                                   2197 
                                   2198 ;       >CHAR   ( c -- c )
                                   2199 ;       Filter non-printing characters.
      008B88 8B 7C                 2200         .word      LINK
                           000B0A  2201 LINK = . 
      008B8A 05                    2202         .byte      5
      008B8B 3E 43 48 41 52        2203         .ascii     ">CHAR"
      008B90                       2204 TCHAR:
      008B90 E6 01            [ 1] 2205         ld a,(1,x)
      008B92 A1 20            [ 1] 2206         cp a,#32  
      008B94 2B 05            [ 1] 2207         jrmi 1$ 
      008B96 A1 7F            [ 1] 2208         cp a,#127 
      008B98 2A 01            [ 1] 2209         jrpl 1$ 
      008B9A 81               [ 4] 2210         ret 
      008B9B A6 5F            [ 1] 2211 1$:     ld a,#'_ 
      008B9D E7 01            [ 1] 2212         ld (1,x),a 
      008B9F 81               [ 4] 2213         ret 
                                   2214 
                                   2215 ;       DEPTH   ( -- n )
                                   2216 ;       Return  depth of  data stack.
      008BA0 8B 8A                 2217         .word      LINK
                           000B22  2218 LINK = . 
      008BA2 05                    2219         .byte      5
      008BA3 44 45 50 54 48        2220         .ascii     "DEPTH"
      008BA8                       2221 DEPTH: 
      008BA8 90 BE 2A         [ 2] 2222         LDW Y,SP0    ;save data stack ptr
      008BAB BF 22            [ 2] 2223 	LDW XTEMP,X
      008BAD 72 B2 00 22      [ 2] 2224         SUBW Y,XTEMP     ;#bytes = SP0 - X
      008BB1 90 57            [ 2] 2225         SRAW Y    ;Y = #stack items
      008BB3 1D 00 02         [ 2] 2226 	SUBW X,#2
      008BB6 FF               [ 2] 2227         LDW (X),Y     ; if neg, underflow
      008BB7 81               [ 4] 2228         RET
                                   2229 
                                   2230 ;       PICK    ( ... +n -- ... w )
                                   2231 ;       Copy  nth stack item to tos.
      008BB8 8B A2                 2232         .word      LINK
                           000B3A  2233 LINK = . 
      008BBA 04                    2234         .byte      4
      008BBB 50 49 43 4B           2235         .ascii     "PICK"
      008BBF                       2236 PICK:
      008BBF 90 93            [ 1] 2237         LDW Y,X   ;D = n1
      008BC1 90 FE            [ 2] 2238         LDW Y,(Y)
                                   2239 ; modified for standard compliance          
                                   2240 ; 0 PICK must be equivalent to DUP 
      008BC3 90 5C            [ 1] 2241         INCW Y 
      008BC5 90 58            [ 2] 2242         SLAW Y
      008BC7 BF 22            [ 2] 2243         LDW XTEMP,X
      008BC9 72 B9 00 22      [ 2] 2244         ADDW Y,XTEMP
      008BCD 90 FE            [ 2] 2245         LDW Y,(Y)
      008BCF FF               [ 2] 2246         LDW (X),Y
      008BD0 81               [ 4] 2247         RET
                                   2248 
                                   2249 ;; Memory access
                                   2250 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



                                   2251 ;       +!      ( n a -- )
                                   2252 ;       Add n to  contents at address a.
      008BD1 8B BA                 2253         .word      LINK
                           000B53  2254 LINK = . 
      008BD3 02                    2255         .byte      2
      008BD4 2B 21                 2256         .ascii     "+!"
      008BD6                       2257 PSTOR:
      008BD6 90 93            [ 1] 2258         ldw y,x 
      008BD8 90 FE            [ 2] 2259         ldw y,(y)
      008BDA 90 BF 24         [ 2] 2260         ldw YTEMP,y  ; address
      008BDD 90 FE            [ 2] 2261         ldw y,(y)  
      008BDF 90 89            [ 2] 2262         pushw y  ; value at address 
      008BE1 90 93            [ 1] 2263         ldw y,x 
      008BE3 90 EE 02         [ 2] 2264         ldw y,(2,y) ; n 
      008BE6 72 F9 01         [ 2] 2265         addw y,(1,sp) ; n+value
      008BE9 91 CF 24         [ 5] 2266         ldw [YTEMP],y ;  a!
      008BEC 90 85            [ 2] 2267         popw y    ;drop local var
      008BEE 1C 00 04         [ 2] 2268         addw x,#4 ; DDROP 
      008BF1 81               [ 4] 2269         ret 
                                   2270 
                                   2271 ;       2!      ( d a -- )
                                   2272 ;       Store  double integer to address a.
      008BF2 8B D3                 2273         .word      LINK
                           000B74  2274 LINK = . 
      008BF4 02                    2275         .byte      2
      008BF5 32 21                 2276         .ascii     "2!"
      008BF7                       2277 DSTOR:
      008BF7 90 93            [ 1] 2278         ldw y,x 
      008BF9 90 FE            [ 2] 2279         ldw y,(y)
      008BFB 90 BF 24         [ 2] 2280         ldw YTEMP,y ; address 
      008BFE 1C 00 02         [ 2] 2281         addw x,#CELLL ; drop a 
      008C01 90 93            [ 1] 2282         ldw y,x 
      008C03 90 FE            [ 2] 2283         ldw y,(y) ; hi word 
      008C05 89               [ 2] 2284         pushw x 
      008C06 EE 02            [ 2] 2285         ldw x,(2,x) ; lo word 
      008C08 91 CF 24         [ 5] 2286         ldw [YTEMP],y
      008C0B 90 93            [ 1] 2287         ldw y,x 
      008C0D AE 00 02         [ 2] 2288         ldw x,#2 
      008C10 92 DF 24         [ 5] 2289         ldw ([YTEMP],x),y 
      008C13 85               [ 2] 2290         popw x 
      008C14 1C 00 04         [ 2] 2291         addw x,#4 ; DDROP 
      008C17 81               [ 4] 2292         ret 
                                   2293 
                                   2294 ;       2@      ( a -- d )
                                   2295 ;       Fetch double integer from address a.
      008C18 8B F4                 2296         .word      LINK
                           000B9A  2297 LINK = . 
      008C1A 02                    2298         .byte      2
      008C1B 32 40                 2299         .ascii     "2@"
      008C1D                       2300 DAT:
      008C1D 90 93            [ 1] 2301         ldw y,x 
      008C1F 90 FE            [ 2] 2302         ldw y,(y) ;address 
      008C21 90 BF 24         [ 2] 2303         ldw YTEMP,y 
      008C24 1D 00 02         [ 2] 2304         subw x,#CELLL ; space for udh 
      008C27 91 CE 24         [ 5] 2305         ldw y,[YTEMP] ; udh 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



      008C2A FF               [ 2] 2306         ldw (x),y 
      008C2B 90 AE 00 02      [ 2] 2307         ldw y,#2
      008C2F 91 DE 24         [ 5] 2308         ldw y,([YTEMP],y) ; udl 
      008C32 EF 02            [ 2] 2309         ldw (2,x),y
      008C34 81               [ 4] 2310         ret 
                                   2311 
                                   2312 ;       COUNT   ( b -- b +n )
                                   2313 ;       Return count byte of a string
                                   2314 ;       and add 1 to byte address.
      008C35 8C 1A                 2315         .word      LINK
                           000BB7  2316 LINK = . 
      008C37 05                    2317         .byte      5
      008C38 43 4F 55 4E 54        2318         .ascii     "COUNT"
      008C3D                       2319 COUNT:
      008C3D 90 93            [ 1] 2320         ldw y,x 
      008C3F 90 FE            [ 2] 2321         ldw y,(y) ; address 
      008C41 90 F6            [ 1] 2322         ld a,(y)  ; count 
      008C43 90 5C            [ 1] 2323         incw y 
      008C45 FF               [ 2] 2324         ldw (x),y 
      008C46 1D 00 02         [ 2] 2325         subw x,#CELLL 
      008C49 E7 01            [ 1] 2326         ld (1,x),a 
      008C4B 7F               [ 1] 2327         clr (x)
      008C4C 81               [ 4] 2328         ret 
                                   2329 
                                   2330 ;       HERE    ( -- a )
                                   2331 ;       Return  top of  variables
      008C4D 8C 37                 2332         .word      LINK
                           000BCF  2333 LINK = . 
      008C4F 04                    2334         .byte      4
      008C50 48 45 52 45           2335         .ascii     "HERE"
      008C54                       2336 HERE:
      008C54 90 AE 00 16      [ 2] 2337       	ldw y,#UVP 
      008C58 90 FE            [ 2] 2338         ldw y,(y)
      008C5A 1D 00 02         [ 2] 2339         subw x,#CELLL 
      008C5D FF               [ 2] 2340         ldw (x),y 
      008C5E 81               [ 4] 2341         ret 
                                   2342 
                                   2343 ;       PAD     ( -- a )
                                   2344 ;       Return address of text buffer
                                   2345 ;       above  code dictionary.
      008C5F 8C 4F                 2346         .word      LINK
                           000BE1  2347 LINK = . 
      008C61 03                    2348         .byte      3
      008C62 50 41 44              2349         .ascii     "PAD"
      008C65                       2350 PAD:
      008C65 CD 8C 54         [ 4] 2351         CALL     HERE
      008C68 CD 84 F5         [ 4] 2352         CALL     DOLIT
      008C6B 00 50                 2353         .word      80
      008C6D CC 88 15         [ 2] 2354         JP     PLUS
                                   2355 
                                   2356 ;       TIB     ( -- a )
                                   2357 ;       Return address of terminal input buffer.
      008C70 8C 61                 2358         .word      LINK
                           000BF2  2359 LINK = . 
      008C72 03                    2360         .byte      3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



      008C73 54 49 42              2361         .ascii     "TIB"
      008C76                       2362 TIB:
      008C76 CD 87 05         [ 4] 2363         CALL     NTIB
      008C79 CD 8A CF         [ 4] 2364         CALL     CELLP
      008C7C CC 85 73         [ 2] 2365         JP     AT
                                   2366 
                                   2367 ;       @EXECUTE        ( a -- )
                                   2368 ;       Execute vector stored in address a.
      008C7F 8C 72                 2369         .word      LINK
                           000C01  2370 LINK = . 
      008C81 08                    2371         .byte      8
      008C82 40 45 58 45 43 55 54  2372         .ascii     "@EXECUTE"
             45
      008C8A                       2373 ATEXE:
      008C8A CD 85 73         [ 4] 2374         CALL     AT
      008C8D CD 87 C4         [ 4] 2375         CALL     QDUP    ;?address or zero
      008C90 CD 85 28         [ 4] 2376         CALL     QBRAN
      008C93 8C 98                 2377         .word      EXE1
      008C95 CD 85 4F         [ 4] 2378         CALL     EXECU   ;execute if non-zero
      008C98 81               [ 4] 2379 EXE1:   RET     ;do nothing if zero
                                   2380 
                                   2381 ;       CMOVE   ( b1 b2 u -- )
                                   2382 ;       Copy u bytes from b1 to b2.
      008C99 8C 81                 2383         .word      LINK
                           000C1B  2384 LINK = . 
      008C9B 05                    2385         .byte      5
      008C9C 43 4D 4F 56 45        2386         .ascii     "CMOVE"
      008CA1                       2387 CMOVE:
      008CA1 CD 85 E3         [ 4] 2388         CALL	TOR
      008CA4 CD 85 3F         [ 4] 2389         CALL	BRAN
      008CA7 8C C1                 2390         .word	CMOV2
      008CA9 CD 85 E3         [ 4] 2391 CMOV1:	CALL	TOR
      008CAC CD 86 1A         [ 4] 2392         CALL	DUPP
      008CAF CD 85 91         [ 4] 2393         CALL	CAT
      008CB2 CD 85 D7         [ 4] 2394         CALL	RAT
      008CB5 CD 85 80         [ 4] 2395         CALL	CSTOR
      008CB8 CD 8A FA         [ 4] 2396         CALL	ONEP
      008CBB CD 85 C4         [ 4] 2397         CALL	RFROM
      008CBE CD 8A FA         [ 4] 2398         CALL	ONEP
      008CC1 CD 85 09         [ 4] 2399 CMOV2:	CALL	DONXT
      008CC4 8C A9                 2400         .word	CMOV1
      008CC6 CC 87 F5         [ 2] 2401         JP	DDROP
                                   2402 
                                   2403 ;       FILL    ( b u c -- )
                                   2404 ;       Fill u bytes of character c
                                   2405 ;       to area beginning at b.
      008CC9 8C 9B                 2406         .word       LINK
                           000C4B  2407 LINK = . 
      008CCB 04                    2408         .byte       4
      008CCC 46 49 4C 4C           2409         .ascii     "FILL"
      008CD0                       2410 FILL:
      008CD0 90 93            [ 1] 2411         ldw y,x 
      008CD2 90 E6 01         [ 1] 2412         ld a,(1,y) ; c 
      008CD5 1C 00 02         [ 2] 2413         addw x,#CELLL ; drop c 
      008CD8 90 93            [ 1] 2414         ldw y,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      008CDA 90 FE            [ 2] 2415         ldw y,(y) ; count
      008CDC 90 89            [ 2] 2416         pushw y 
      008CDE 1C 00 02         [ 2] 2417         addw x,#CELLL ; drop u 
      008CE1 90 93            [ 1] 2418         ldw y,x 
      008CE3 1C 00 02         [ 2] 2419         addw x,#CELLL ; drop b 
      008CE6 90 FE            [ 2] 2420         ldw y,(y) ; address
      008CE8 90 BF 24         [ 2] 2421         ldw YTEMP,y
      008CEB 90 85            [ 2] 2422         popw y ; count 
      008CED                       2423 FILL1:  
      008CED 92 C7 24         [ 4] 2424         ld [YTEMP],a 
      008CF0 3C 25            [ 1] 2425         inc YTEMP+1
      008CF2 24 02            [ 1] 2426         jrnc FILL2 
      008CF4 3C 24            [ 1] 2427         inc YTEMP
      008CF6                       2428 FILL2: 
      008CF6 90 5A            [ 2] 2429         decw y ; count 
      008CF8 26 F3            [ 1] 2430         jrne FILL1  
      008CFA 81               [ 4] 2431         ret 
                                   2432 
                                   2433 ;       ERASE   ( b u -- )
                                   2434 ;       Erase u bytes beginning at b.
      008CFB 8C CB                 2435         .word      LINK
                           000C7D  2436 LINK = . 
      008CFD 05                    2437         .byte      5
      008CFE 45 52 41 53 45        2438         .ascii     "ERASE"
      008D03                       2439 ERASE:
      008D03 90 5F            [ 1] 2440         clrw y 
      008D05 1D 00 02         [ 2] 2441         subw x,#CELLL 
      008D08 FF               [ 2] 2442         ldw (x),y 
      008D09 CC 8C D0         [ 2] 2443         jp FILL 
                                   2444 
                                   2445 
                                   2446 ;       PACK0   ( b u a -- a )
                                   2447 ;       Build a counted string with
                                   2448 ;       u characters from b. Null fill.
      008D0C 8C FD                 2449         .word      LINK
                           000C8E  2450 LINK = . 
      008D0E 05                    2451         .byte      5
      008D0F 50 41 43 4B 30        2452         .ascii     "PACK0"
      008D14                       2453 PACKS:
      008D14 CD 86 1A         [ 4] 2454         CALL     DUPP
      008D17 CD 85 E3         [ 4] 2455         CALL     TOR     ;strings only on cell boundary
      008D1A CD 88 00         [ 4] 2456         CALL     DDUP
      008D1D CD 85 80         [ 4] 2457         CALL     CSTOR
      008D20 CD 8A FA         [ 4] 2458         CALL     ONEP ;save count
      008D23 CD 86 2A         [ 4] 2459         CALL     SWAPP
      008D26 CD 8C A1         [ 4] 2460         CALL     CMOVE
      008D29 CD 85 C4         [ 4] 2461         CALL     RFROM
      008D2C 81               [ 4] 2462         RET
                                   2463 
                                   2464 ;; Numeric output, single precision
                                   2465 
                                   2466 ;       DIGIT   ( u -- c )
                                   2467 ;       Convert digit u to a character.
      008D2D 8D 0E                 2468         .word      LINK
                           000CAF  2469 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      008D2F 05                    2470         .byte      5
      008D30 44 49 47 49 54        2471         .ascii     "DIGIT"
      008D35                       2472 DIGIT:
      008D35 CD 84 F5         [ 4] 2473         CALL	DOLIT
      008D38 00 09                 2474         .word	9
      008D3A CD 86 44         [ 4] 2475         CALL	OVER
      008D3D CD 88 F3         [ 4] 2476         CALL	LESS
      008D40 CD 84 F5         [ 4] 2477         CALL	DOLIT
      008D43 00 07                 2478         .word	7
      008D45 CD 86 66         [ 4] 2479         CALL	ANDD
      008D48 CD 88 15         [ 4] 2480         CALL	PLUS
      008D4B CD 84 F5         [ 4] 2481         CALL	DOLIT
      008D4E 00 30                 2482         .word	48	;'0'
      008D50 CC 88 15         [ 2] 2483         JP	PLUS
                                   2484 
                                   2485 ;       EXTRACT ( n base -- n c )
                                   2486 ;       Extract least significant digit from n.
      008D53 8D 2F                 2487         .word      LINK
                           000CD5  2488 LINK = . 
      008D55 07                    2489         .byte      7
      008D56 45 58 54 52 41 43 54  2490         .ascii     "EXTRACT"
      008D5D                       2491 EXTRC:
      008D5D CD 8B 66         [ 4] 2492         CALL     ZERO
      008D60 CD 86 2A         [ 4] 2493         CALL     SWAPP
      008D63 CD 89 6B         [ 4] 2494         CALL     UMMOD
      008D66 CD 86 2A         [ 4] 2495         CALL     SWAPP
      008D69 CC 8D 35         [ 2] 2496         JP     DIGIT
                                   2497 
                                   2498 ;       <#      ( -- )
                                   2499 ;       Initiate  numeric output process.
      008D6C 8D 55                 2500         .word      LINK
                           000CEE  2501 LINK = . 
      008D6E 02                    2502         .byte      2
      008D6F 3C 23                 2503         .ascii     "<#"
      008D71                       2504 BDIGS:
      008D71 CD 8C 65         [ 4] 2505         CALL     PAD
      008D74 CD 87 47         [ 4] 2506         CALL     HLD
      008D77 CC 85 5C         [ 2] 2507         JP     STORE
                                   2508 
                                   2509 ;       HOLD    ( c -- )
                                   2510 ;       Insert a character into output string.
      008D7A 8D 6E                 2511         .word      LINK
                           000CFC  2512 LINK = . 
      008D7C 04                    2513         .byte      4
      008D7D 48 4F 4C 44           2514         .ascii     "HOLD"
      008D81                       2515 HOLD:
      008D81 CD 87 47         [ 4] 2516         CALL     HLD
      008D84 CD 85 73         [ 4] 2517         CALL     AT
      008D87 CD 8B 07         [ 4] 2518         CALL     ONEM
      008D8A CD 86 1A         [ 4] 2519         CALL     DUPP
      008D8D CD 87 47         [ 4] 2520         CALL     HLD
      008D90 CD 85 5C         [ 4] 2521         CALL     STORE
      008D93 CC 85 80         [ 2] 2522         JP     CSTOR
                                   2523 
                                   2524 ;       #       ( u -- u )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



                                   2525 ;       Extract one digit from u and
                                   2526 ;       append digit to output string.
      008D96 8D 7C                 2527         .word      LINK
                           000D18  2528 LINK = . 
      008D98 01                    2529         .byte      1
      008D99 23                    2530         .ascii     "#"
      008D9A                       2531 DIG:
      008D9A CD 86 D7         [ 4] 2532         CALL     BASE
      008D9D CD 85 73         [ 4] 2533         CALL     AT
      008DA0 CD 8D 5D         [ 4] 2534         CALL     EXTRC
      008DA3 CC 8D 81         [ 2] 2535         JP     HOLD
                                   2536 
                                   2537 ;       #S      ( u -- 0 )
                                   2538 ;       Convert u until all digits
                                   2539 ;       are added to output string.
      008DA6 8D 98                 2540         .word      LINK
                           000D28  2541 LINK = . 
      008DA8 02                    2542         .byte      2
      008DA9 23 53                 2543         .ascii     "#S"
      008DAB                       2544 DIGS:
      008DAB CD 8D 9A         [ 4] 2545 DIGS1:  CALL     DIG
      008DAE CD 86 1A         [ 4] 2546         CALL     DUPP
      008DB1 CD 85 28         [ 4] 2547         CALL     QBRAN
      008DB4 8D B8                 2548         .word      DIGS2
      008DB6 20 F3            [ 2] 2549         JRA     DIGS1
      008DB8 81               [ 4] 2550 DIGS2:  RET
                                   2551 
                                   2552 ;       SIGN    ( n -- )
                                   2553 ;       Add a minus sign to
                                   2554 ;       numeric output string.
      008DB9 8D A8                 2555         .word      LINK
                           000D3B  2556 LINK = . 
      008DBB 04                    2557         .byte      4
      008DBC 53 49 47 4E           2558         .ascii     "SIGN"
      008DC0                       2559 SIGN:
      008DC0 CD 86 53         [ 4] 2560         CALL     ZLESS
      008DC3 CD 85 28         [ 4] 2561         CALL     QBRAN
      008DC6 8D D0                 2562         .word      SIGN1
      008DC8 CD 84 F5         [ 4] 2563         CALL     DOLIT
      008DCB 00 2D                 2564         .word      45	;"-"
      008DCD CC 8D 81         [ 2] 2565         JP     HOLD
      008DD0 81               [ 4] 2566 SIGN1:  RET
                                   2567 
                                   2568 ;       #>      ( w -- b u )
                                   2569 ;       Prepare output string.
      008DD1 8D BB                 2570         .word      LINK
                           000D53  2571 LINK = . 
      008DD3 02                    2572         .byte      2
      008DD4 23 3E                 2573         .ascii     "#>"
      008DD6                       2574 EDIGS:
      008DD6 CD 86 10         [ 4] 2575         CALL     DROP
      008DD9 CD 87 47         [ 4] 2576         CALL     HLD
      008DDC CD 85 73         [ 4] 2577         CALL     AT
      008DDF CD 8C 65         [ 4] 2578         CALL     PAD
      008DE2 CD 86 44         [ 4] 2579         CALL     OVER
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      008DE5 CC 88 8E         [ 2] 2580         JP     SUBB
                                   2581 
                                   2582 ;       str     ( w -- b u )
                                   2583 ;       Convert a signed integer
                                   2584 ;       to a numeric string.
      008DE8 8D D3                 2585         .word      LINK
                           000D6A  2586 LINK = . 
      008DEA 03                    2587         .byte      3
      008DEB 53 54 52              2588         .ascii     "STR"
      008DEE                       2589 STR:
      008DEE CD 86 1A         [ 4] 2590         CALL     DUPP
      008DF1 CD 85 E3         [ 4] 2591         CALL     TOR
      008DF4 CD 88 A8         [ 4] 2592         CALL     ABSS
      008DF7 CD 8D 71         [ 4] 2593         CALL     BDIGS
      008DFA CD 8D AB         [ 4] 2594         CALL     DIGS
      008DFD CD 85 C4         [ 4] 2595         CALL     RFROM
      008E00 CD 8D C0         [ 4] 2596         CALL     SIGN
      008E03 CC 8D D6         [ 2] 2597         JP     EDIGS
                                   2598 
                                   2599 ;       HEX     ( -- )
                                   2600 ;       Use radix 16 as base for
                                   2601 ;       numeric conversions.
      008E06 8D EA                 2602         .word      LINK
                           000D88  2603 LINK = . 
      008E08 03                    2604         .byte      3
      008E09 48 45 58              2605         .ascii     "HEX"
      008E0C                       2606 HEX:
      008E0C CD 84 F5         [ 4] 2607         CALL     DOLIT
      008E0F 00 10                 2608         .word      16
      008E11 CD 86 D7         [ 4] 2609         CALL     BASE
      008E14 CC 85 5C         [ 2] 2610         JP     STORE
                                   2611 
                                   2612 ;       DECIMAL ( -- )
                                   2613 ;       Use radix 10 as base
                                   2614 ;       for numeric conversions.
      008E17 8E 08                 2615         .word      LINK
                           000D99  2616 LINK = . 
      008E19 07                    2617         .byte      7
      008E1A 44 45 43 49 4D 41 4C  2618         .ascii     "DECIMAL"
      008E21                       2619 DECIM:
      008E21 CD 84 F5         [ 4] 2620         CALL     DOLIT
      008E24 00 0A                 2621         .word      10
      008E26 CD 86 D7         [ 4] 2622         CALL     BASE
      008E29 CC 85 5C         [ 2] 2623         JP     STORE
                                   2624 
                                   2625 ;; Numeric input, single precision
                                   2626 
                                   2627 ;       DIGIT?  ( c base -- u t )
                                   2628 ;       Convert a character to its numeric
                                   2629 ;       value. A flag indicates success.
      008E2C 8E 19                 2630         .word      LINK
                           000DAE  2631 LINK = . 
      008E2E 06                    2632         .byte       6
      008E2F 44 49 47 49 54 3F     2633         .ascii     "DIGIT?"
      008E35                       2634 DIGTQ:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



      008E35 CD 85 E3         [ 4] 2635         CALL     TOR
      008E38 CD 84 F5         [ 4] 2636         CALL     DOLIT
      008E3B 00 30                 2637         .word     48	; "0"
      008E3D CD 88 8E         [ 4] 2638         CALL     SUBB
      008E40 CD 84 F5         [ 4] 2639         CALL     DOLIT
      008E43 00 09                 2640         .word      9
      008E45 CD 86 44         [ 4] 2641         CALL     OVER
      008E48 CD 88 F3         [ 4] 2642         CALL     LESS
      008E4B CD 85 28         [ 4] 2643         CALL     QBRAN
      008E4E 8E 66                 2644         .word      DGTQ1
      008E50 CD 84 F5         [ 4] 2645         CALL     DOLIT
      008E53 00 07                 2646         .word      7
      008E55 CD 88 8E         [ 4] 2647         CALL     SUBB
      008E58 CD 86 1A         [ 4] 2648         CALL     DUPP
      008E5B CD 84 F5         [ 4] 2649         CALL     DOLIT
      008E5E 00 0A                 2650         .word      10
      008E60 CD 88 F3         [ 4] 2651         CALL     LESS
      008E63 CD 86 7A         [ 4] 2652         CALL     ORR
      008E66 CD 86 1A         [ 4] 2653 DGTQ1:  CALL     DUPP
      008E69 CD 85 C4         [ 4] 2654         CALL     RFROM
      008E6C CC 88 D5         [ 2] 2655         JP     ULESS
                                   2656 
                                   2657 ;       NUMBER? ( a -- n T | a F )
                                   2658 ;       Convert a number string to
                                   2659 ;       integer. Push a flag on tos.
      008E6F 8E 2E                 2660         .word      LINK
                           000DF1  2661 LINK = . 
      008E71 07                    2662         .byte      7
      008E72 4E 55 4D 42 45 52 3F  2663         .ascii     "NUMBER?"
      008E79                       2664 NUMBQ:
      008E79 CD 86 D7         [ 4] 2665         CALL     BASE
      008E7C CD 85 73         [ 4] 2666         CALL     AT
      008E7F CD 85 E3         [ 4] 2667         CALL     TOR
      008E82 CD 8B 66         [ 4] 2668         CALL     ZERO
      008E85 CD 86 44         [ 4] 2669         CALL     OVER
      008E88 CD 8C 3D         [ 4] 2670         CALL     COUNT
      008E8B CD 86 44         [ 4] 2671         CALL     OVER
      008E8E CD 85 91         [ 4] 2672         CALL     CAT
      008E91 CD 84 F5         [ 4] 2673         CALL     DOLIT
      008E94 00 24                 2674         .word     36	; "0x"
      008E96 CD 88 B6         [ 4] 2675         CALL     EQUAL
      008E99 CD 85 28         [ 4] 2676         CALL     QBRAN
      008E9C 8E AD                 2677         .word      NUMQ1
      008E9E CD 8E 0C         [ 4] 2678         CALL     HEX
      008EA1 CD 86 2A         [ 4] 2679         CALL     SWAPP
      008EA4 CD 8A FA         [ 4] 2680         CALL     ONEP
      008EA7 CD 86 2A         [ 4] 2681         CALL     SWAPP
      008EAA CD 8B 07         [ 4] 2682         CALL     ONEM
      008EAD CD 86 44         [ 4] 2683 NUMQ1:  CALL     OVER
      008EB0 CD 85 91         [ 4] 2684         CALL     CAT
      008EB3 CD 84 F5         [ 4] 2685         CALL     DOLIT
      008EB6 00 2D                 2686         .word     45	; "-"
      008EB8 CD 88 B6         [ 4] 2687         CALL     EQUAL
      008EBB CD 85 E3         [ 4] 2688         CALL     TOR
      008EBE CD 86 2A         [ 4] 2689         CALL     SWAPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



      008EC1 CD 85 D7         [ 4] 2690         CALL     RAT
      008EC4 CD 88 8E         [ 4] 2691         CALL     SUBB
      008EC7 CD 86 2A         [ 4] 2692         CALL     SWAPP
      008ECA CD 85 D7         [ 4] 2693         CALL     RAT
      008ECD CD 88 15         [ 4] 2694         CALL     PLUS
      008ED0 CD 87 C4         [ 4] 2695         CALL     QDUP
      008ED3 CD 85 28         [ 4] 2696         CALL     QBRAN
      008ED6 8F 37                 2697         .word      NUMQ6
      008ED8 CD 8B 07         [ 4] 2698         CALL     ONEM
      008EDB CD 85 E3         [ 4] 2699         CALL     TOR
      008EDE CD 86 1A         [ 4] 2700 NUMQ2:  CALL     DUPP
      008EE1 CD 85 E3         [ 4] 2701         CALL     TOR
      008EE4 CD 85 91         [ 4] 2702         CALL     CAT
      008EE7 CD 86 D7         [ 4] 2703         CALL     BASE
      008EEA CD 85 73         [ 4] 2704         CALL     AT
      008EED CD 8E 35         [ 4] 2705         CALL     DIGTQ
      008EF0 CD 85 28         [ 4] 2706         CALL     QBRAN
      008EF3 8F 25                 2707         .word      NUMQ4
      008EF5 CD 86 2A         [ 4] 2708         CALL     SWAPP
      008EF8 CD 86 D7         [ 4] 2709         CALL     BASE
      008EFB CD 85 73         [ 4] 2710         CALL     AT
      008EFE CD 8A 79         [ 4] 2711         CALL     STAR
      008F01 CD 88 15         [ 4] 2712         CALL     PLUS
      008F04 CD 85 C4         [ 4] 2713         CALL     RFROM
      008F07 CD 8A FA         [ 4] 2714         CALL     ONEP
      008F0A CD 85 09         [ 4] 2715         CALL     DONXT
      008F0D 8E DE                 2716         .word      NUMQ2
      008F0F CD 85 D7         [ 4] 2717         CALL     RAT
      008F12 CD 86 2A         [ 4] 2718         CALL     SWAPP
      008F15 CD 86 10         [ 4] 2719         CALL     DROP
      008F18 CD 85 28         [ 4] 2720         CALL     QBRAN
      008F1B 8F 20                 2721         .word      NUMQ3
      008F1D CD 88 40         [ 4] 2722         CALL     NEGAT
      008F20 CD 86 2A         [ 4] 2723 NUMQ3:  CALL     SWAPP
      008F23 20 0F            [ 2] 2724         JRA     NUMQ5
      008F25 CD 85 C4         [ 4] 2725 NUMQ4:  CALL     RFROM
      008F28 CD 85 C4         [ 4] 2726         CALL     RFROM
      008F2B CD 87 F5         [ 4] 2727         CALL     DDROP
      008F2E CD 87 F5         [ 4] 2728         CALL     DDROP
      008F31 CD 8B 66         [ 4] 2729         CALL     ZERO
      008F34 CD 86 1A         [ 4] 2730 NUMQ5:  CALL     DUPP
      008F37 CD 85 C4         [ 4] 2731 NUMQ6:  CALL     RFROM
      008F3A CD 87 F5         [ 4] 2732         CALL     DDROP
      008F3D CD 85 C4         [ 4] 2733         CALL     RFROM
      008F40 CD 86 D7         [ 4] 2734         CALL     BASE
      008F43 CC 85 5C         [ 2] 2735         JP     STORE
                                   2736 
                                   2737 ;; Basic I/O
                                   2738 
                                   2739 ;       KEY     ( -- c )
                                   2740 ;       Wait for and return an
                                   2741 ;       input character.
      008F46 8E 71                 2742         .word      LINK
                           000EC8  2743 LINK = . 
      008F48 03                    2744         .byte      3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



      008F49 4B 45 59              2745         .ascii     "KEY"
      008F4C                       2746 KEY:
      008F4C 72 0B 52 30 FB   [ 2] 2747         btjf UART_SR,#UART_SR_RXNE,. 
      008F51 C6 52 31         [ 1] 2748         ld a,UART_DR 
      008F54 1D 00 02         [ 2] 2749         subw x,#CELLL 
      008F57 E7 01            [ 1] 2750         ld (1,x),a 
      008F59 7F               [ 1] 2751         clr (x)
      008F5A 81               [ 4] 2752         ret 
                                   2753 
                                   2754 ;       NUF?    ( -- t )
                                   2755 ;       Return false if no input,
                                   2756 ;       else pause and if CR return true.
      008F5B 8F 48                 2757         .word      LINK
                           000EDD  2758 LINK = . 
      008F5D 04                    2759         .byte      4
      008F5E 4E 55 46 3F           2760         .ascii     "NUF?"
      008F62                       2761 NUFQ:
      008F62 CD 84 96         [ 4] 2762         CALL     QKEY
      008F65 CD 86 1A         [ 4] 2763         CALL     DUPP
      008F68 CD 85 28         [ 4] 2764         CALL     QBRAN
      008F6B 8F 7B                 2765         .word    NUFQ1
      008F6D CD 87 F5         [ 4] 2766         CALL     DDROP
      008F70 CD 8F 4C         [ 4] 2767         CALL     KEY
      008F73 CD 84 F5         [ 4] 2768         CALL     DOLIT
      008F76 00 0D                 2769         .word      CRR
      008F78 CC 88 B6         [ 2] 2770         JP     EQUAL
      008F7B 81               [ 4] 2771 NUFQ1:  RET
                                   2772 
                                   2773 ;       SPACE   ( -- )
                                   2774 ;       Send  blank character to
                                   2775 ;       output device.
      008F7C 8F 5D                 2776         .word      LINK
                           000EFE  2777 LINK = . 
      008F7E 05                    2778         .byte      5
      008F7F 53 50 41 43 45        2779         .ascii     "SPACE"
      008F84                       2780 SPACE:
      008F84 CD 8B 59         [ 4] 2781         CALL     BLANK
      008F87 CC 84 B4         [ 2] 2782         JP     EMIT
                                   2783 
                                   2784 ;       SPACES  ( +n -- )
                                   2785 ;       Send n spaces to output device.
      008F8A 8F 7E                 2786         .word      LINK
                           000F0C  2787 LINK = . 
      008F8C 06                    2788         .byte      6
      008F8D 53 50 41 43 45 53     2789         .ascii     "SPACES"
      008F93                       2790 SPACS:
      008F93 CD 8B 66         [ 4] 2791         CALL     ZERO
      008F96 CD 89 13         [ 4] 2792         CALL     MAX
      008F99 CD 85 E3         [ 4] 2793         CALL     TOR
      008F9C 20 03            [ 2] 2794         JRA      CHAR2
      008F9E CD 8F 84         [ 4] 2795 CHAR1:  CALL     SPACE
      008FA1 CD 85 09         [ 4] 2796 CHAR2:  CALL     DONXT
      008FA4 8F 9E                 2797         .word    CHAR1
      008FA6 81               [ 4] 2798         RET
                                   2799 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



                                   2800 ;       TYPE    ( b u -- )
                                   2801 ;       Output u characters from b.
      008FA7 8F 8C                 2802         .word      LINK
                           000F29  2803 LINK = . 
      008FA9 04                    2804         .byte      4
      008FAA 54 59 50 45           2805         .ascii     "TYPE"
      008FAE                       2806 TYPES:
      008FAE CD 85 E3         [ 4] 2807         CALL     TOR
      008FB1 20 0C            [ 2] 2808         JRA     TYPE2
      008FB3 CD 86 1A         [ 4] 2809 TYPE1:  CALL     DUPP
      008FB6 CD 85 91         [ 4] 2810         CALL     CAT
      008FB9 CD 84 B4         [ 4] 2811         CALL     EMIT
      008FBC CD 8A FA         [ 4] 2812         CALL     ONEP
      008FBF CD 85 09         [ 4] 2813 TYPE2:  CALL     DONXT
      008FC2 8F B3                 2814         .word      TYPE1
      008FC4 CC 86 10         [ 2] 2815         JP     DROP
                                   2816 
                                   2817 ;       CR      ( -- )
                                   2818 ;       Output a carriage return
                                   2819 ;       and a line feed.
      008FC7 8F A9                 2820         .word      LINK
                           000F49  2821 LINK = . 
      008FC9 02                    2822         .byte      2
      008FCA 43 52                 2823         .ascii     "CR"
      008FCC                       2824 CR:
      008FCC CD 84 F5         [ 4] 2825         CALL     DOLIT
      008FCF 00 0D                 2826         .word      CRR
      008FD1 CD 84 B4         [ 4] 2827         CALL     EMIT
      008FD4 CD 84 F5         [ 4] 2828         CALL     DOLIT
      008FD7 00 0A                 2829         .word      LF
      008FD9 CC 84 B4         [ 2] 2830         JP     EMIT
                                   2831 
                                   2832 ;       do$     ( -- a )
                                   2833 ;       Return  address of a compiled
                                   2834 ;       string.
      008FDC 8F C9                 2835         .word      LINK
                           000F5E  2836 LINK = . 
      008FDE 43                    2837 	.byte      COMPO+3
      008FDF 44 4F 24              2838         .ascii     "DO$"
      008FE2                       2839 DOSTR:
      008FE2 CD 85 C4         [ 4] 2840         CALL     RFROM
      008FE5 CD 85 D7         [ 4] 2841         CALL     RAT
      008FE8 CD 85 C4         [ 4] 2842         CALL     RFROM
      008FEB CD 8C 3D         [ 4] 2843         CALL     COUNT
      008FEE CD 88 15         [ 4] 2844         CALL     PLUS
      008FF1 CD 85 E3         [ 4] 2845         CALL     TOR
      008FF4 CD 86 2A         [ 4] 2846         CALL     SWAPP
      008FF7 CD 85 E3         [ 4] 2847         CALL     TOR
      008FFA 81               [ 4] 2848         RET
                                   2849 
                                   2850 ;       $"|     ( -- a )
                                   2851 ;       Run time routine compiled by $".
                                   2852 ;       Return address of a compiled string.
      008FFB 8F DE                 2853         .word      LINK
                           000F7D  2854 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



      008FFD 43                    2855 	.byte      COMPO+3
      008FFE 24 22 7C              2856         .byte     '$','"','|'
      009001                       2857 STRQP:
      009001 CD 8F E2         [ 4] 2858         CALL     DOSTR
      009004 81               [ 4] 2859         RET
                                   2860 
                                   2861 ;       ."|     ( -- )
                                   2862 ;       Run time routine of ." .
                                   2863 ;       Output a compiled string.
      009005 8F FD                 2864         .word      LINK
                           000F87  2865 LINK = . 
      009007 43                    2866 	.byte      COMPO+3
      009008 2E 22 7C              2867         .byte     '.','"','|'
      00900B                       2868 DOTQP:
      00900B CD 8F E2         [ 4] 2869         CALL     DOSTR
      00900E CD 8C 3D         [ 4] 2870         CALL     COUNT
      009011 CC 8F AE         [ 2] 2871         JP     TYPES
                                   2872 
                                   2873 ;       .R      ( n +n -- )
                                   2874 ;       Display an integer in a field
                                   2875 ;       of n columns, right justified.
      009014 90 07                 2876         .word      LINK
                           000F96  2877 LINK = . 
      009016 02                    2878         .byte      2
      009017 2E 52                 2879         .ascii     ".R"
      009019                       2880 DOTR:
      009019 CD 85 E3         [ 4] 2881         CALL     TOR
      00901C CD 8D EE         [ 4] 2882         CALL     STR
      00901F CD 85 C4         [ 4] 2883         CALL     RFROM
      009022 CD 86 44         [ 4] 2884         CALL     OVER
      009025 CD 88 8E         [ 4] 2885         CALL     SUBB
      009028 CD 8F 93         [ 4] 2886         CALL     SPACS
      00902B CC 8F AE         [ 2] 2887         JP     TYPES
                                   2888 
                                   2889 ;       U.R     ( u +n -- )
                                   2890 ;       Display an unsigned integer
                                   2891 ;       in n column, right justified.
      00902E 90 16                 2892         .word      LINK
                           000FB0  2893 LINK = . 
      009030 03                    2894         .byte      3
      009031 55 2E 52              2895         .ascii     "U.R"
      009034                       2896 UDOTR:
      009034 CD 85 E3         [ 4] 2897         CALL     TOR
      009037 CD 8D 71         [ 4] 2898         CALL     BDIGS
      00903A CD 8D AB         [ 4] 2899         CALL     DIGS
      00903D CD 8D D6         [ 4] 2900         CALL     EDIGS
      009040 CD 85 C4         [ 4] 2901         CALL     RFROM
      009043 CD 86 44         [ 4] 2902         CALL     OVER
      009046 CD 88 8E         [ 4] 2903         CALL     SUBB
      009049 CD 8F 93         [ 4] 2904         CALL     SPACS
      00904C CC 8F AE         [ 2] 2905         JP     TYPES
                                   2906 
                                   2907 ;       U.      ( u -- )
                                   2908 ;       Display an unsigned integer
                                   2909 ;       in free format.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      00904F 90 30                 2910         .word      LINK
                           000FD1  2911 LINK = . 
      009051 02                    2912         .byte      2
      009052 55 2E                 2913         .ascii     "U."
      009054                       2914 UDOT:
      009054 CD 8D 71         [ 4] 2915         CALL     BDIGS
      009057 CD 8D AB         [ 4] 2916         CALL     DIGS
      00905A CD 8D D6         [ 4] 2917         CALL     EDIGS
      00905D CD 8F 84         [ 4] 2918         CALL     SPACE
      009060 CC 8F AE         [ 2] 2919         JP     TYPES
                                   2920 
                                   2921 ;       .       ( w -- )
                                   2922 ;       Display an integer in free
                                   2923 ;       format, preceeded by a space.
      009063 90 51                 2924         .word      LINK
                           000FE5  2925 LINK = . 
      009065 01                    2926         .byte      1
      009066 2E                    2927         .ascii     "."
      009067                       2928 DOT:
      009067 CD 86 D7         [ 4] 2929         CALL     BASE
      00906A CD 85 73         [ 4] 2930         CALL     AT
      00906D CD 84 F5         [ 4] 2931         CALL     DOLIT
      009070 00 0A                 2932         .word      10
      009072 CD 86 8F         [ 4] 2933         CALL     XORR    ;?decimal
      009075 CD 85 28         [ 4] 2934         CALL     QBRAN
      009078 90 7D                 2935         .word      DOT1
      00907A CC 90 54         [ 2] 2936         JP     UDOT
      00907D CD 8D EE         [ 4] 2937 DOT1:   CALL     STR
      009080 CD 8F 84         [ 4] 2938         CALL     SPACE
      009083 CC 8F AE         [ 2] 2939         JP     TYPES
                                   2940 
                                   2941 ;       ?       ( a -- )
                                   2942 ;       Display contents in memory cell.
      009086 90 65                 2943         .word      LINK
                                   2944         
                           001008  2945 LINK = . 
      009088 01                    2946         .byte      1
      009089 3F                    2947         .ascii     "?"
      00908A                       2948 QUEST:
      00908A CD 85 73         [ 4] 2949         CALL     AT
      00908D CC 90 67         [ 2] 2950         JP     DOT
                                   2951 
                                   2952 ;; Parsing
                                   2953 
                                   2954 ;       parse   ( b u c -- b u delta ; <string> )
                                   2955 ;       Scan string delimited by c.
                                   2956 ;       Return found string and its offset.
      009090 90 88                 2957         .word      LINK
                           001012  2958 LINK = . 
      009092 05                    2959         .byte      5
      009093 70 61 72 73 65        2960         .ascii     "parse"
      009098                       2961 PARS:
      009098 CD 86 E6         [ 4] 2962         CALL     TEMP
      00909B CD 85 5C         [ 4] 2963         CALL     STORE
      00909E CD 86 44         [ 4] 2964         CALL     OVER
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      0090A1 CD 85 E3         [ 4] 2965         CALL     TOR
      0090A4 CD 86 1A         [ 4] 2966         CALL     DUPP
      0090A7 CD 85 28         [ 4] 2967         CALL     QBRAN
      0090AA 91 50                 2968         .word    PARS8
      0090AC CD 8B 07         [ 4] 2969         CALL     ONEM
      0090AF CD 86 E6         [ 4] 2970         CALL     TEMP
      0090B2 CD 85 73         [ 4] 2971         CALL     AT
      0090B5 CD 8B 59         [ 4] 2972         CALL     BLANK
      0090B8 CD 88 B6         [ 4] 2973         CALL     EQUAL
      0090BB CD 85 28         [ 4] 2974         CALL     QBRAN
      0090BE 90 F1                 2975         .word      PARS3
      0090C0 CD 85 E3         [ 4] 2976         CALL     TOR
      0090C3 CD 8B 59         [ 4] 2977 PARS1:  CALL     BLANK
      0090C6 CD 86 44         [ 4] 2978         CALL     OVER
      0090C9 CD 85 91         [ 4] 2979         CALL     CAT     ;skip leading blanks ONLY
      0090CC CD 88 8E         [ 4] 2980         CALL     SUBB
      0090CF CD 86 53         [ 4] 2981         CALL     ZLESS
      0090D2 CD 88 2F         [ 4] 2982         CALL     INVER
      0090D5 CD 85 28         [ 4] 2983         CALL     QBRAN
      0090D8 90 EE                 2984         .word      PARS2
      0090DA CD 8A FA         [ 4] 2985         CALL     ONEP
      0090DD CD 85 09         [ 4] 2986         CALL     DONXT
      0090E0 90 C3                 2987         .word      PARS1
      0090E2 CD 85 C4         [ 4] 2988         CALL     RFROM
      0090E5 CD 86 10         [ 4] 2989         CALL     DROP
      0090E8 CD 8B 66         [ 4] 2990         CALL     ZERO
      0090EB CC 86 1A         [ 2] 2991         JP     DUPP
      0090EE CD 85 C4         [ 4] 2992 PARS2:  CALL     RFROM
      0090F1 CD 86 44         [ 4] 2993 PARS3:  CALL     OVER
      0090F4 CD 86 2A         [ 4] 2994         CALL     SWAPP
      0090F7 CD 85 E3         [ 4] 2995         CALL     TOR
      0090FA CD 86 E6         [ 4] 2996 PARS4:  CALL     TEMP
      0090FD CD 85 73         [ 4] 2997         CALL     AT
      009100 CD 86 44         [ 4] 2998         CALL     OVER
      009103 CD 85 91         [ 4] 2999         CALL     CAT
      009106 CD 88 8E         [ 4] 3000         CALL     SUBB    ;scan for delimiter
      009109 CD 86 E6         [ 4] 3001         CALL     TEMP
      00910C CD 85 73         [ 4] 3002         CALL     AT
      00910F CD 8B 59         [ 4] 3003         CALL     BLANK
      009112 CD 88 B6         [ 4] 3004         CALL     EQUAL
      009115 CD 85 28         [ 4] 3005         CALL     QBRAN
      009118 91 1D                 3006         .word      PARS5
      00911A CD 86 53         [ 4] 3007         CALL     ZLESS
      00911D CD 85 28         [ 4] 3008 PARS5:  CALL     QBRAN
      009120 91 32                 3009         .word      PARS6
      009122 CD 8A FA         [ 4] 3010         CALL     ONEP
      009125 CD 85 09         [ 4] 3011         CALL     DONXT
      009128 90 FA                 3012         .word      PARS4
      00912A CD 86 1A         [ 4] 3013         CALL     DUPP
      00912D CD 85 E3         [ 4] 3014         CALL     TOR
      009130 20 0F            [ 2] 3015         JRA     PARS7
      009132 CD 85 C4         [ 4] 3016 PARS6:  CALL     RFROM
      009135 CD 86 10         [ 4] 3017         CALL     DROP
      009138 CD 86 1A         [ 4] 3018         CALL     DUPP
      00913B CD 8A FA         [ 4] 3019         CALL     ONEP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      00913E CD 85 E3         [ 4] 3020         CALL     TOR
      009141 CD 86 44         [ 4] 3021 PARS7:  CALL     OVER
      009144 CD 88 8E         [ 4] 3022         CALL     SUBB
      009147 CD 85 C4         [ 4] 3023         CALL     RFROM
      00914A CD 85 C4         [ 4] 3024         CALL     RFROM
      00914D CC 88 8E         [ 2] 3025         JP     SUBB
      009150 CD 86 44         [ 4] 3026 PARS8:  CALL     OVER
      009153 CD 85 C4         [ 4] 3027         CALL     RFROM
      009156 CC 88 8E         [ 2] 3028         JP     SUBB
                                   3029 
                                   3030 ;       PARSE   ( c -- b u ; <string> )
                                   3031 ;       Scan input stream and return
                                   3032 ;       counted string delimited by c.
      009159 90 92                 3033         .word      LINK
                           0010DB  3034 LINK = . 
      00915B 05                    3035         .byte      5
      00915C 50 41 52 53 45        3036         .ascii     "PARSE"
      009161                       3037 PARSE:
      009161 CD 85 E3         [ 4] 3038         CALL     TOR
      009164 CD 8C 76         [ 4] 3039         CALL     TIB
      009167 CD 86 F5         [ 4] 3040         CALL     INN
      00916A CD 85 73         [ 4] 3041         CALL     AT
      00916D CD 88 15         [ 4] 3042         CALL     PLUS    ;current input buffer pointer
      009170 CD 87 05         [ 4] 3043         CALL     NTIB
      009173 CD 85 73         [ 4] 3044         CALL     AT
      009176 CD 86 F5         [ 4] 3045         CALL     INN
      009179 CD 85 73         [ 4] 3046         CALL     AT
      00917C CD 88 8E         [ 4] 3047         CALL     SUBB    ;remaining count
      00917F CD 85 C4         [ 4] 3048         CALL     RFROM
      009182 CD 90 98         [ 4] 3049         CALL     PARS
      009185 CD 86 F5         [ 4] 3050         CALL     INN
      009188 CC 8B D6         [ 2] 3051         JP     PSTOR
                                   3052 
                                   3053 ;       .(      ( -- )
                                   3054 ;       Output following string up to next ) .
      00918B 91 5B                 3055         .word      LINK
                           00110D  3056 LINK = . 
      00918D 82                    3057 	.byte      IMEDD+2
      00918E 2E 28                 3058         .ascii     ".("
      009190                       3059 DOTPR:
      009190 CD 84 F5         [ 4] 3060         CALL     DOLIT
      009193 00 29                 3061         .word     41	; ")"
      009195 CD 91 61         [ 4] 3062         CALL     PARSE
      009198 CC 8F AE         [ 2] 3063         JP     TYPES
                                   3064 
                                   3065 ;       (       ( -- )
                                   3066 ;       Ignore following string up to next ).
                                   3067 ;       A comment.
      00919B 91 8D                 3068         .word      LINK
                           00111D  3069 LINK = . 
      00919D 81                    3070 	.byte      IMEDD+1
      00919E 28                    3071         .ascii     "("
      00919F                       3072 PAREN:
      00919F CD 84 F5         [ 4] 3073         CALL     DOLIT
      0091A2 00 29                 3074         .word     41	; ")"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



      0091A4 CD 91 61         [ 4] 3075         CALL     PARSE
      0091A7 CC 87 F5         [ 2] 3076         JP     DDROP
                                   3077 
                                   3078 ;       \       ( -- )
                                   3079 ;       Ignore following text till
                                   3080 ;       end of line.
      0091AA 91 9D                 3081         .word      LINK
                           00112C  3082 LINK = . 
      0091AC 81                    3083 	.byte      IMEDD+1
      0091AD 5C                    3084         .ascii     "\"
      0091AE                       3085 BKSLA:
      0091AE 90 AE 00 0C      [ 2] 3086         ldw y,#UCTIB ; #TIB  
      0091B2 90 FE            [ 2] 3087         ldw y,(y)
      0091B4 90 89            [ 2] 3088         pushw y ; count in TIB 
      0091B6 90 AE 00 0A      [ 2] 3089         ldw y,#UINN ; >IN 
      0091BA 90 BF 24         [ 2] 3090         ldw YTEMP,y
      0091BD 90 85            [ 2] 3091         popw y 
      0091BF 91 CF 24         [ 5] 3092         ldw [YTEMP],y
      0091C2 81               [ 4] 3093         ret 
                                   3094 
                                   3095 ;       WORD    ( c -- a ; <string> )
                                   3096 ;       Parse a word from input stream
                                   3097 ;       and copy it to code dictionary.
      0091C3 91 AC                 3098         .word      LINK
                           001145  3099 LINK = . 
      0091C5 04                    3100         .byte      4
      0091C6 57 4F 52 44           3101         .ascii     "WORD"
      0091CA                       3102 WORDD:
      0091CA CD 91 61         [ 4] 3103         CALL     PARSE
      0091CD CD 8C 54         [ 4] 3104         CALL     HERE
      0091D0 CD 8A CF         [ 4] 3105         CALL     CELLP
      0091D3 CC 8D 14         [ 2] 3106         JP     PACKS
                                   3107 
                                   3108 ;       TOKEN   ( -- a ; <string> )
                                   3109 ;       Parse a word from input stream
                                   3110 ;       and copy it to name dictionary.
      0091D6 91 C5                 3111         .word      LINK
                           001158  3112 LINK = . 
      0091D8 05                    3113         .byte      5
      0091D9 54 4F 4B 45 4E        3114         .ascii     "TOKEN"
      0091DE                       3115 TOKEN:
      0091DE CD 8B 59         [ 4] 3116         CALL     BLANK
      0091E1 CC 91 CA         [ 2] 3117         JP     WORDD
                                   3118 
                                   3119 ;; Dictionary search
                                   3120 
                                   3121 ;       NAME>   ( na -- ca )
                                   3122 ;       Return a code address given
                                   3123 ;       a name address.
      0091E4 91 D8                 3124         .word      LINK
                           001166  3125 LINK = . 
      0091E6 05                    3126         .byte      5
      0091E7 4E 41 4D 45 3E        3127         .ascii     "NAME>"
      0091EC                       3128 NAMET:
      0091EC CD 8C 3D         [ 4] 3129         CALL     COUNT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      0091EF CD 84 F5         [ 4] 3130         CALL     DOLIT
      0091F2 00 1F                 3131         .word      31
      0091F4 CD 86 66         [ 4] 3132         CALL     ANDD
      0091F7 CC 88 15         [ 2] 3133         JP     PLUS
                                   3134 
                                   3135 ;       SAME?   ( a a u -- a a f \ -0+ )
                                   3136 ;       Compare u cells in two
                                   3137 ;       strings. Return 0 if identical.
      0091FA 91 E6                 3138         .word      LINK
                           00117C  3139 LINK = . 
      0091FC 05                    3140         .byte       5
      0091FD 53 41 4D 45 3F        3141         .ascii     "SAME?"
      009202                       3142 SAMEQ:
      009202 CD 8B 07         [ 4] 3143         CALL     ONEM
      009205 CD 85 E3         [ 4] 3144         CALL     TOR
      009208 20 29            [ 2] 3145         JRA     SAME2
      00920A CD 86 44         [ 4] 3146 SAME1:  CALL     OVER
      00920D CD 85 D7         [ 4] 3147         CALL     RAT
      009210 CD 88 15         [ 4] 3148         CALL     PLUS
      009213 CD 85 91         [ 4] 3149         CALL     CAT
      009216 CD 86 44         [ 4] 3150         CALL     OVER
      009219 CD 85 D7         [ 4] 3151         CALL     RAT
      00921C CD 88 15         [ 4] 3152         CALL     PLUS
      00921F CD 85 91         [ 4] 3153         CALL     CAT
      009222 CD 88 8E         [ 4] 3154         CALL     SUBB
      009225 CD 87 C4         [ 4] 3155         CALL     QDUP
      009228 CD 85 28         [ 4] 3156         CALL     QBRAN
      00922B 92 33                 3157         .word      SAME2
      00922D CD 85 C4         [ 4] 3158         CALL     RFROM
      009230 CC 86 10         [ 2] 3159         JP     DROP
      009233 CD 85 09         [ 4] 3160 SAME2:  CALL     DONXT
      009236 92 0A                 3161         .word      SAME1
      009238 CC 8B 66         [ 2] 3162         JP     ZERO
                                   3163 
                                   3164 ;       find    ( a va -- ca na | a F )
                                   3165 ;       Search vocabulary for string.
                                   3166 ;       Return ca and na if succeeded.
      00923B 91 FC                 3167         .word      LINK
                           0011BD  3168 LINK = . 
      00923D 04                    3169         .byte      4
      00923E 46 49 4E 44           3170         .ascii     "FIND"
      009242                       3171 FIND:
      009242 CD 86 2A         [ 4] 3172         CALL     SWAPP
      009245 CD 86 1A         [ 4] 3173         CALL     DUPP
      009248 CD 85 91         [ 4] 3174         CALL     CAT
      00924B CD 86 E6         [ 4] 3175         CALL     TEMP
      00924E CD 85 5C         [ 4] 3176         CALL     STORE
      009251 CD 86 1A         [ 4] 3177         CALL     DUPP
      009254 CD 85 73         [ 4] 3178         CALL     AT
      009257 CD 85 E3         [ 4] 3179         CALL     TOR
      00925A CD 8A CF         [ 4] 3180         CALL     CELLP
      00925D CD 86 2A         [ 4] 3181         CALL     SWAPP
      009260 CD 85 73         [ 4] 3182 FIND1:  CALL     AT
      009263 CD 86 1A         [ 4] 3183         CALL     DUPP
      009266 CD 85 28         [ 4] 3184         CALL     QBRAN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



      009269 92 9F                 3185         .word      FIND6
      00926B CD 86 1A         [ 4] 3186         CALL     DUPP
      00926E CD 85 73         [ 4] 3187         CALL     AT
      009271 CD 84 F5         [ 4] 3188         CALL     DOLIT
      009274 1F 7F                 3189         .word      MASKK
      009276 CD 86 66         [ 4] 3190         CALL     ANDD
      009279 CD 85 D7         [ 4] 3191         CALL     RAT
      00927C CD 86 8F         [ 4] 3192         CALL     XORR
      00927F CD 85 28         [ 4] 3193         CALL     QBRAN
      009282 92 8E                 3194         .word      FIND2
      009284 CD 8A CF         [ 4] 3195         CALL     CELLP
      009287 CD 84 F5         [ 4] 3196         CALL     DOLIT
      00928A FF FF                 3197         .word     0xFFFF
      00928C 20 0C            [ 2] 3198         JRA     FIND3
      00928E CD 8A CF         [ 4] 3199 FIND2:  CALL     CELLP
      009291 CD 86 E6         [ 4] 3200         CALL     TEMP
      009294 CD 85 73         [ 4] 3201         CALL     AT
      009297 CD 92 02         [ 4] 3202         CALL     SAMEQ
      00929A CD 85 3F         [ 4] 3203 FIND3:  CALL     BRAN
      00929D 92 AE                 3204         .word      FIND4
      00929F CD 85 C4         [ 4] 3205 FIND6:  CALL     RFROM
      0092A2 CD 86 10         [ 4] 3206         CALL     DROP
      0092A5 CD 86 2A         [ 4] 3207         CALL     SWAPP
      0092A8 CD 8A DE         [ 4] 3208         CALL     CELLM
      0092AB CC 86 2A         [ 2] 3209         JP     SWAPP
      0092AE CD 85 28         [ 4] 3210 FIND4:  CALL     QBRAN
      0092B1 92 BB                 3211         .word      FIND5
      0092B3 CD 8A DE         [ 4] 3212         CALL     CELLM
      0092B6 CD 8A DE         [ 4] 3213         CALL     CELLM
      0092B9 20 A5            [ 2] 3214         JRA     FIND1
      0092BB CD 85 C4         [ 4] 3215 FIND5:  CALL     RFROM
      0092BE CD 86 10         [ 4] 3216         CALL     DROP
      0092C1 CD 86 2A         [ 4] 3217         CALL     SWAPP
      0092C4 CD 86 10         [ 4] 3218         CALL     DROP
      0092C7 CD 8A DE         [ 4] 3219         CALL     CELLM
      0092CA CD 86 1A         [ 4] 3220         CALL     DUPP
      0092CD CD 91 EC         [ 4] 3221         CALL     NAMET
      0092D0 CC 86 2A         [ 2] 3222         JP     SWAPP
                                   3223 
                                   3224 ;       NAME?   ( a -- ca na | a F )
                                   3225 ;       Search vocabularies for a string.
      0092D3 92 3D                 3226         .word      LINK
                           001255  3227 LINK = . 
      0092D5 05                    3228         .byte      5
      0092D6 4E 41 4D 45 3F        3229         .ascii     "NAME?"
      0092DB                       3230 NAMEQ:
      0092DB CD 87 5A         [ 4] 3231         CALL   CNTXT
      0092DE CC 92 42         [ 2] 3232         JP     FIND
                                   3233 
                                   3234 ;; Terminal response
                                   3235 
                                   3236 ;       ^H      ( bot eot cur -- bot eot cur )
                                   3237 ;       Backup cursor by one character.
      0092E1 92 D5                 3238         .word      LINK
                           001263  3239 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      0092E3 02                    3240         .byte      2
      0092E4 5E 48                 3241         .ascii     "^H"
      0092E6                       3242 BKSP:
      0092E6 CD 85 E3         [ 4] 3243         CALL     TOR
      0092E9 CD 86 44         [ 4] 3244         CALL     OVER
      0092EC CD 85 C4         [ 4] 3245         CALL     RFROM
      0092EF CD 86 2A         [ 4] 3246         CALL     SWAPP
      0092F2 CD 86 44         [ 4] 3247         CALL     OVER
      0092F5 CD 86 8F         [ 4] 3248         CALL     XORR
      0092F8 CD 85 28         [ 4] 3249         CALL     QBRAN
      0092FB 93 16                 3250         .word      BACK1
      0092FD CD 84 F5         [ 4] 3251         CALL     DOLIT
      009300 00 08                 3252         .word      BKSPP
      009302 CD 84 B4         [ 4] 3253         CALL     EMIT
      009305 CD 8B 07         [ 4] 3254         CALL     ONEM
      009308 CD 8B 59         [ 4] 3255         CALL     BLANK
      00930B CD 84 B4         [ 4] 3256         CALL     EMIT
      00930E CD 84 F5         [ 4] 3257         CALL     DOLIT
      009311 00 08                 3258         .word      BKSPP
      009313 CC 84 B4         [ 2] 3259         JP     EMIT
      009316 81               [ 4] 3260 BACK1:  RET
                                   3261 
                                   3262 ;       TAP    ( bot eot cur c -- bot eot cur )
                                   3263 ;       Accept and echo key stroke
                                   3264 ;       and bump cursor.
      009317 92 E3                 3265         .word      LINK
                           001299  3266 LINK = . 
      009319 03                    3267         .byte      3
      00931A 54 41 50              3268         .ascii     "TAP"
      00931D                       3269 TAP:
      00931D CD 86 1A         [ 4] 3270         CALL     DUPP
      009320 CD 84 B4         [ 4] 3271         CALL     EMIT
      009323 CD 86 44         [ 4] 3272         CALL     OVER
      009326 CD 85 80         [ 4] 3273         CALL     CSTOR
      009329 CC 8A FA         [ 2] 3274         JP     ONEP
                                   3275 
                                   3276 ;       kTAP    ( bot eot cur c -- bot eot cur )
                                   3277 ;       Process a key stroke,
                                   3278 ;       CR,LF or backspace.
      00932C 93 19                 3279         .word      LINK
                           0012AE  3280 LINK = . 
      00932E 04                    3281         .byte      4
      00932F 4B 54 41 50           3282         .ascii     "KTAP"
      009333                       3283 KTAP:
      009333 CD 86 1A         [ 4] 3284         CALL     DUPP
      009336 CD 84 F5         [ 4] 3285         CALL     DOLIT
                           000001  3286 .if EOL_CR
      009339 00 0D                 3287         .word   CRR
                           000000  3288 .else ; EOL_LF 
                                   3289         .word   LF
                                   3290 .endif 
      00933B CD 86 8F         [ 4] 3291         CALL     XORR
      00933E CD 85 28         [ 4] 3292         CALL     QBRAN
      009341 93 59                 3293         .word      KTAP2
      009343 CD 84 F5         [ 4] 3294         CALL     DOLIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      009346 00 08                 3295         .word      BKSPP
      009348 CD 86 8F         [ 4] 3296         CALL     XORR
      00934B CD 85 28         [ 4] 3297         CALL     QBRAN
      00934E 93 56                 3298         .word      KTAP1
      009350 CD 8B 59         [ 4] 3299         CALL     BLANK
      009353 CC 93 1D         [ 2] 3300         JP     TAP
      009356 CC 92 E6         [ 2] 3301 KTAP1:  JP     BKSP
      009359 CD 86 10         [ 4] 3302 KTAP2:  CALL     DROP
      00935C CD 86 2A         [ 4] 3303         CALL     SWAPP
      00935F CD 86 10         [ 4] 3304         CALL     DROP
      009362 CC 86 1A         [ 2] 3305         JP     DUPP
                                   3306 
                                   3307 ;       accept  ( b u -- b u )
                                   3308 ;       Accept characters to input
                                   3309 ;       buffer. Return with actual count.
      009365 93 2E                 3310         .word      LINK
                           0012E7  3311 LINK = . 
      009367 06                    3312         .byte      6
      009368 41 43 43 45 50 54     3313         .ascii     "ACCEPT"
      00936E                       3314 ACCEP:
      00936E CD 86 44         [ 4] 3315         CALL     OVER
      009371 CD 88 15         [ 4] 3316         CALL     PLUS
      009374 CD 86 44         [ 4] 3317         CALL     OVER
      009377 CD 88 00         [ 4] 3318 ACCP1:  CALL     DDUP
      00937A CD 86 8F         [ 4] 3319         CALL     XORR
      00937D CD 85 28         [ 4] 3320         CALL     QBRAN
      009380 93 A2                 3321         .word      ACCP4
      009382 CD 8F 4C         [ 4] 3322         CALL     KEY
      009385 CD 86 1A         [ 4] 3323         CALL     DUPP
      009388 CD 8B 59         [ 4] 3324         CALL     BLANK
      00938B CD 84 F5         [ 4] 3325         CALL     DOLIT
      00938E 00 7F                 3326         .word      127
      009390 CD 89 50         [ 4] 3327         CALL     WITHI
      009393 CD 85 28         [ 4] 3328         CALL     QBRAN
      009396 93 9D                 3329         .word      ACCP2
      009398 CD 93 1D         [ 4] 3330         CALL     TAP
      00939B 20 03            [ 2] 3331         JRA     ACCP3
      00939D CD 93 33         [ 4] 3332 ACCP2:  CALL     KTAP
      0093A0 20 D5            [ 2] 3333 ACCP3:  JRA     ACCP1
      0093A2 CD 86 10         [ 4] 3334 ACCP4:  CALL     DROP
      0093A5 CD 86 44         [ 4] 3335         CALL     OVER
      0093A8 CC 88 8E         [ 2] 3336         JP     SUBB
                                   3337 
                                   3338 ;       QUERY   ( -- )
                                   3339 ;       Accept input stream to
                                   3340 ;       terminal input buffer.
      0093AB 93 67                 3341         .word      LINK
                                   3342         
                           00132D  3343 LINK = . 
      0093AD 05                    3344         .byte      5
      0093AE 51 55 45 52 59        3345         .ascii     "QUERY"
      0093B3                       3346 QUERY:
      0093B3 CD 8C 76         [ 4] 3347         CALL     TIB
      0093B6 CD 84 F5         [ 4] 3348         CALL     DOLIT
      0093B9 00 50                 3349         .word      80
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      0093BB CD 93 6E         [ 4] 3350         CALL     ACCEP
      0093BE CD 87 05         [ 4] 3351         CALL     NTIB
      0093C1 CD 85 5C         [ 4] 3352         CALL     STORE
      0093C4 CD 86 10         [ 4] 3353         CALL     DROP
      0093C7 CD 8B 66         [ 4] 3354         CALL     ZERO
      0093CA CD 86 F5         [ 4] 3355         CALL     INN
      0093CD CC 85 5C         [ 2] 3356         JP     STORE
                                   3357 
                                   3358 ;       ABORT   ( -- )
                                   3359 ;       Reset data stack and
                                   3360 ;       jump to QUIT.
      0093D0 93 AD                 3361         .word      LINK
                           001352  3362 LINK = . 
      0093D2 05                    3363         .byte      5
      0093D3 41 42 4F 52 54        3364         .ascii     "ABORT"
      0093D8                       3365 ABORT:
      0093D8 CD 94 CF         [ 4] 3366         CALL     PRESE
      0093DB CC 94 EC         [ 2] 3367         JP     QUIT
                                   3368 
                                   3369 ;       abort"  ( f -- )
                                   3370 ;       Run time routine of ABORT".
                                   3371 ;       Abort with a message.
      0093DE 93 D2                 3372         .word      LINK
                           001360  3373 LINK = . 
      0093E0 46                    3374 	.byte      COMPO+6
      0093E1 41 42 4F 52 54        3375         .ascii     "ABORT"
      0093E6 22                    3376         .byte      '"'
      0093E7                       3377 ABORQ:
      0093E7 CD 85 28         [ 4] 3378         CALL     QBRAN
      0093EA 94 06                 3379         .word      ABOR2   ;text flag
      0093EC CD 8F E2         [ 4] 3380         CALL     DOSTR
      0093EF CD 8F 84         [ 4] 3381 ABOR1:  CALL     SPACE
      0093F2 CD 8C 3D         [ 4] 3382         CALL     COUNT
      0093F5 CD 8F AE         [ 4] 3383         CALL     TYPES
      0093F8 CD 84 F5         [ 4] 3384         CALL     DOLIT
      0093FB 00 3F                 3385         .word     63 ; "?"
      0093FD CD 84 B4         [ 4] 3386         CALL     EMIT
      009400 CD 8F CC         [ 4] 3387         CALL     CR
      009403 CC 93 D8         [ 2] 3388         JP     ABORT   ;pass error string
      009406 CD 8F E2         [ 4] 3389 ABOR2:  CALL     DOSTR
      009409 CC 86 10         [ 2] 3390         JP     DROP
                                   3391 
                                   3392 ;; The text interpreter
                                   3393 
                                   3394 ;       $INTERPRET      ( a -- )
                                   3395 ;       Interpret a word. If failed,
                                   3396 ;       try to convert it to an integer.
      00940C 93 E0                 3397         .word      LINK
                           00138E  3398 LINK = . 
      00940E 0A                    3399         .byte      10
      00940F 24 49 4E 54 45 52 50  3400         .ascii     "$INTERPRET"
             52 45 54
      009419                       3401 INTER:
      009419 CD 92 DB         [ 4] 3402         CALL     NAMEQ
      00941C CD 87 C4         [ 4] 3403         CALL     QDUP    ;?defined
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



      00941F CD 85 28         [ 4] 3404         CALL     QBRAN
      009422 94 43                 3405         .word      INTE1
      009424 CD 85 73         [ 4] 3406         CALL     AT
      009427 CD 84 F5         [ 4] 3407         CALL     DOLIT
      00942A 40 00                 3408 	.word       0x4000	; COMPO*256
      00942C CD 86 66         [ 4] 3409         CALL     ANDD    ;?compile only lexicon bits
      00942F CD 93 E7         [ 4] 3410         CALL     ABORQ
      009432 0D                    3411         .byte      13
      009433 20 63 6F 6D 70 69 6C  3412         .ascii     " compile only"
             65 20 6F 6E 6C 79
      009440 CC 85 4F         [ 2] 3413         JP     EXECU
      009443 CD 8E 79         [ 4] 3414 INTE1:  CALL     NUMBQ   ;convert a number
      009446 CD 85 28         [ 4] 3415         CALL     QBRAN
      009449 93 EF                 3416         .word    ABOR1
      00944B 81               [ 4] 3417         RET
                                   3418 
                                   3419 ;       [       ( -- )
                                   3420 ;       Start  text interpreter.
      00944C 94 0E                 3421         .word      LINK
                           0013CE  3422 LINK = . 
      00944E 81                    3423 	.byte      IMEDD+1
      00944F 5B                    3424         .ascii     "["
      009450                       3425 LBRAC:
      009450 CD 84 F5         [ 4] 3426         CALL   DOLIT
      009453 94 19                 3427         .word  INTER
      009455 CD 87 38         [ 4] 3428         CALL   TEVAL
      009458 CC 85 5C         [ 2] 3429         JP     STORE
                                   3430 
                                   3431 ;       .OK     ( -- )
                                   3432 ;       Display 'ok' while interpreting.
      00945B 94 4E                 3433         .word      LINK
                           0013DD  3434 LINK = . 
      00945D 03                    3435         .byte      3
      00945E 2E 4F 4B              3436         .ascii     ".OK"
      009461                       3437 DOTOK:
      009461 CD 84 F5         [ 4] 3438         CALL     DOLIT
      009464 94 19                 3439         .word      INTER
      009466 CD 87 38         [ 4] 3440         CALL     TEVAL
      009469 CD 85 73         [ 4] 3441         CALL     AT
      00946C CD 88 B6         [ 4] 3442         CALL     EQUAL
      00946F CD 85 28         [ 4] 3443         CALL     QBRAN
      009472 94 7B                 3444         .word      DOTO1
      009474 CD 90 0B         [ 4] 3445         CALL     DOTQP
      009477 03                    3446         .byte      3
      009478 20 6F 6B              3447         .ascii     " ok"
      00947B CC 8F CC         [ 2] 3448 DOTO1:  JP     CR
                                   3449 
                                   3450 ;       ?STACK  ( -- )
                                   3451 ;       Abort if stack underflows.
      00947E 94 5D                 3452         .word      LINK
                           001400  3453 LINK = . 
      009480 06                    3454         .byte      6
      009481 3F 53 54 41 43 4B     3455         .ascii     "?STACK"
      009487                       3456 QSTAC: 
      009487 CD 8B A8         [ 4] 3457         CALL     DEPTH
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      00948A CD 86 53         [ 4] 3458         CALL     ZLESS   ;check only for underflow
      00948D CD 93 E7         [ 4] 3459         CALL     ABORQ
      009490 0B                    3460         .byte      11
      009491 20 75 6E 64 65 72 66  3461         .ascii     " underflow "
             6C 6F 77 20
      00949C 81               [ 4] 3462         RET
                                   3463 
                                   3464 ;       EVAL    ( -- )
                                   3465 ;       Interpret  input stream.
      00949D 94 80                 3466         .word      LINK
                           00141F  3467 LINK = . 
      00949F 04                    3468         .byte      4
      0094A0 45 56 41 4C           3469         .ascii     "EVAL"
      0094A4                       3470 EVAL:
      0094A4 CD 91 DE         [ 4] 3471 EVAL1:  CALL     TOKEN
      0094A7 CD 86 1A         [ 4] 3472         CALL     DUPP
      0094AA CD 85 91         [ 4] 3473         CALL     CAT     ;?input stream empty
      0094AD CD 85 28         [ 4] 3474         CALL     QBRAN
      0094B0 94 C0                 3475         .word    EVAL2
      0094B2 CD 87 38         [ 4] 3476         CALL     TEVAL
      0094B5 CD 8C 8A         [ 4] 3477         CALL     ATEXE
      0094B8 CD 94 87         [ 4] 3478         CALL     QSTAC   ;evaluate input, check stack
      0094BB CD 85 3F         [ 4] 3479         CALL     BRAN
      0094BE 94 A4                 3480         .word    EVAL1
      0094C0 CD 86 10         [ 4] 3481 EVAL2:  CALL     DROP
      0094C3 CC 94 61         [ 2] 3482         JP       DOTOK
                                   3483 
                                   3484 ;       PRESET  ( -- )
                                   3485 ;       Reset data stack pointer and
                                   3486 ;       terminal input buffer.
      0094C6 94 9F                 3487         .word      LINK
                           001448  3488 LINK = . 
      0094C8 06                    3489         .byte      6
      0094C9 50 52 45 53 45 54     3490         .ascii     "PRESET"
      0094CF                       3491 PRESE:
      0094CF CD 84 F5         [ 4] 3492         CALL     DOLIT
      0094D2 16 80                 3493         .word      SPP
      0094D4 CD 86 07         [ 4] 3494         CALL     SPSTO
      0094D7 CD 84 F5         [ 4] 3495         CALL     DOLIT
      0094DA 17 00                 3496         .word      TIBB
      0094DC CD 87 05         [ 4] 3497         CALL     NTIB
      0094DF CD 8A CF         [ 4] 3498         CALL     CELLP
      0094E2 CC 85 5C         [ 2] 3499         JP     STORE
                                   3500 
                                   3501 ;       QUIT    ( -- )
                                   3502 ;       Reset return stack pointer
                                   3503 ;       and start text interpreter.
      0094E5 94 C8                 3504         .word      LINK
                           001467  3505 LINK = . 
      0094E7 04                    3506         .byte      4
      0094E8 51 55 49 54           3507         .ascii     "QUIT"
      0094EC                       3508 QUIT:
      0094EC CD 84 F5         [ 4] 3509         CALL     DOLIT
      0094EF 17 FF                 3510         .word      RPP
      0094F1 CD 85 AE         [ 4] 3511         CALL     RPSTO   ;reset return stack pointer
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      0094F4 CD 94 50         [ 4] 3512 QUIT1:  CALL     LBRAC   ;start interpretation
      0094F7 CD 93 B3         [ 4] 3513 QUIT2:  CALL     QUERY   ;get input
      0094FA CD 94 A4         [ 4] 3514         CALL     EVAL
      0094FD 20 F8            [ 2] 3515         JRA     QUIT2   ;continue till error
                                   3516 
                                   3517 ;; The compiler
                                   3518 
                                   3519 ;       '       ( -- ca )
                                   3520 ;       Search vocabularies for
                                   3521 ;       next word in input stream.
      0094FF 94 E7                 3522         .word      LINK
                           001481  3523 LINK = . 
      009501 01                    3524         .byte      1
      009502 27                    3525         .ascii     "'"
      009503                       3526 TICK:
      009503 CD 91 DE         [ 4] 3527         CALL     TOKEN
      009506 CD 92 DB         [ 4] 3528         CALL     NAMEQ   ;?defined
      009509 CD 85 28         [ 4] 3529         CALL     QBRAN
      00950C 93 EF                 3530         .word      ABOR1
      00950E 81               [ 4] 3531         RET     ;yes, push code address
                                   3532 
                                   3533 ;       ALLOT   ( n -- )
                                   3534 ;       Allocate n bytes to RAM 
      00950F 95 01                 3535         .word      LINK
                           001491  3536         LINK = . 
      009511 05                    3537         .byte      5
      009512 41 4C 4C 4F 54        3538         .ascii     "ALLOT"
      009517                       3539 ALLOT:
      009517 CD 87 68         [ 4] 3540         CALL     VPP
                                   3541 ; must update APP_VP each time VP is modidied
      00951A CD 8B D6         [ 4] 3542         call PSTOR 
      00951D CC 9C 60         [ 2] 3543         jp UPDATVP 
                                   3544 
                                   3545 ;       ,       ( w -- )
                                   3546 ;         Compile an integer into
                                   3547 ;         variable space.
      009520 95 11                 3548         .word      LINK
                           0014A2  3549 LINK = . 
      009522 01                    3550         .byte      1
      009523 2C                    3551         .ascii     ","
      009524                       3552 COMMA:
      009524 CD 8C 54         [ 4] 3553         CALL     HERE
      009527 CD 86 1A         [ 4] 3554         CALL     DUPP
      00952A CD 8A CF         [ 4] 3555         CALL     CELLP   ;cell boundary
      00952D CD 87 68         [ 4] 3556         CALL     VPP
      009530 CD 85 5C         [ 4] 3557         CALL     STORE
      009533 CC 85 5C         [ 2] 3558         JP     STORE
                                   3559 
                                   3560 ;       C,      ( c -- )
                                   3561 ;       Compile a byte into
                                   3562 ;       variables space.
      009536 95 22                 3563        .word      LINK
                           0014B8  3564 LINK = . 
      009538 02                    3565         .byte      2
      009539 43 2C                 3566         .ascii     "C,"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      00953B                       3567 CCOMMA:
      00953B CD 8C 54         [ 4] 3568         CALL     HERE
      00953E CD 86 1A         [ 4] 3569         CALL     DUPP
      009541 CD 8A FA         [ 4] 3570         CALL     ONEP
      009544 CD 87 68         [ 4] 3571         CALL     VPP
      009547 CD 85 5C         [ 4] 3572         CALL     STORE
      00954A CC 85 80         [ 2] 3573         JP     CSTOR
                                   3574 
                                   3575 ;       [COMPILE]       ( -- ; <string> )
                                   3576 ;       Compile next immediate
                                   3577 ;       word into code dictionary.
      00954D 95 38                 3578         .word      LINK
                           0014CF  3579 LINK = . 
      00954F 89                    3580 	.byte      IMEDD+9
      009550 5B 43 4F 4D 50 49 4C  3581         .ascii     "[COMPILE]"
             45 5D
      009559                       3582 BCOMP:
      009559 CD 95 03         [ 4] 3583         CALL     TICK
      00955C CC 98 1F         [ 2] 3584         JP     JSRC
                                   3585 
                                   3586 ;       COMPILE ( -- )
                                   3587 ;       Compile next jsr in
                                   3588 ;       colon list to code dictionary.
      00955F 95 4F                 3589         .word      LINK
                           0014E1  3590 LINK = . 
      009561 47                    3591 	.byte      COMPO+7
      009562 43 4F 4D 50 49 4C 45  3592         .ascii     "COMPILE"
      009569                       3593 COMPI:
      009569 CD 85 C4         [ 4] 3594         CALL     RFROM
      00956C CD 86 1A         [ 4] 3595         CALL     DUPP
      00956F CD 85 73         [ 4] 3596         CALL     AT
      009572 CD 98 1F         [ 4] 3597         CALL     JSRC    ;compile subroutine
      009575 CD 8A CF         [ 4] 3598         CALL     CELLP
      009578 90 93            [ 1] 3599         ldw y,x 
      00957A 90 FE            [ 2] 3600         ldw y,(y)
      00957C 1C 00 02         [ 2] 3601         addw x,#CELLL 
      00957F 90 FC            [ 2] 3602         jp (y)
                                   3603 
                                   3604 ;       LITERAL ( w -- )
                                   3605 ;       Compile tos to dictionary
                                   3606 ;       as an integer literal.
      009581 95 61                 3607         .word      LINK
                           001503  3608 LINK = . 
      009583 87                    3609 	.byte      IMEDD+7
      009584 4C 49 54 45 52 41 4C  3610         .ascii     "LITERAL"
      00958B                       3611 LITER:
      00958B CD 95 69         [ 4] 3612         CALL     COMPI
      00958E 84 F5                 3613         .word DOLIT 
      009590 CC 95 24         [ 2] 3614         JP     COMMA
                                   3615 
                                   3616 ;       $,"     ( -- )
                                   3617 ;       Compile a literal string
                                   3618 ;       up to next " .
      009593 95 83                 3619         .word      LINK
                           001515  3620 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



      009595 03                    3621         .byte      3
      009596 24 2C 22              3622         .byte     '$',',','"'
      009599                       3623 STRCQ:
      009599 CD 84 F5         [ 4] 3624         CALL     DOLIT
      00959C 00 22                 3625         .word     34	; "
      00959E CD 91 61         [ 4] 3626         CALL     PARSE
      0095A1 CD 8C 54         [ 4] 3627         CALL     HERE
      0095A4 CD 8D 14         [ 4] 3628         CALL     PACKS   ;string to code dictionary
      0095A7 CD 8C 3D         [ 4] 3629         CALL     COUNT
      0095AA CD 88 15         [ 4] 3630         CALL     PLUS    ;calculate aligned end of string
      0095AD CD 87 68         [ 4] 3631         CALL     VPP
      0095B0 CC 85 5C         [ 2] 3632         JP     STORE
                                   3633 
                                   3634 ;; Structures
                                   3635 
                                   3636 ;       FOR     ( -- a )
                                   3637 ;       Start a FOR-NEXT loop
                                   3638 ;       structure in a colon definition.
      0095B3 95 95                 3639         .word      LINK
                           001535  3640 LINK = . 
      0095B5 83                    3641 	.byte      IMEDD+3
      0095B6 46 4F 52              3642         .ascii     "FOR"
      0095B9                       3643 FOR:
      0095B9 CD 95 69         [ 4] 3644         CALL     COMPI
      0095BC 85 E3                 3645         .word TOR 
      0095BE CC 8C 54         [ 2] 3646         JP     HERE
                                   3647 
                                   3648 ;       NEXT    ( a -- )
                                   3649 ;       Terminate a FOR-NEXT loop.
      0095C1 95 B5                 3650         .word      LINK
                           001543  3651 LINK = . 
      0095C3 84                    3652 	.byte      IMEDD+4
      0095C4 4E 45 58 54           3653         .ascii     "NEXT"
      0095C8                       3654 NEXT:
      0095C8 CD 95 69         [ 4] 3655         CALL     COMPI
      0095CB 85 09                 3656         .word DONXT 
      0095CD CD 87 B4         [ 4] 3657         call ADRADJ
      0095D0 CC 95 24         [ 2] 3658         JP     COMMA
                                   3659 
                                   3660 ;       I ( -- n )
                                   3661 ;       stack FOR-NEXT COUNTER 
      0095D3 95 C3                 3662         .word LINK 
                           001555  3663         LINK=.
      0095D5 01                    3664         .byte 1 
      0095D6 49                    3665         .ascii "I"
      0095D7                       3666 IFETCH: 
      0095D7 1D 00 02         [ 2] 3667         subw x,#CELLL 
      0095DA 16 03            [ 2] 3668         ldw y,(3,sp)
      0095DC FF               [ 2] 3669         ldw (x),y 
      0095DD 81               [ 4] 3670         ret 
                                   3671 
                                   3672 ;       BEGIN   ( -- a )
                                   3673 ;       Start an infinite or
                                   3674 ;       indefinite loop structure.
      0095DE 95 D5                 3675         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



                           001560  3676 LINK = . 
      0095E0 85                    3677 	.byte      IMEDD+5
      0095E1 42 45 47 49 4E        3678         .ascii     "BEGIN"
      0095E6                       3679 BEGIN:
      0095E6 CC 8C 54         [ 2] 3680         JP     HERE
                                   3681 
                                   3682 ;       UNTIL   ( a -- )
                                   3683 ;       Terminate a BEGIN-UNTIL
                                   3684 ;       indefinite loop structure.
      0095E9 95 E0                 3685         .word      LINK
                           00156B  3686 LINK = . 
      0095EB 85                    3687 	.byte      IMEDD+5
      0095EC 55 4E 54 49 4C        3688         .ascii     "UNTIL"
      0095F1                       3689 UNTIL:
      0095F1 CD 95 69         [ 4] 3690         CALL     COMPI
      0095F4 85 28                 3691         .word    QBRAN 
      0095F6 CD 87 B4         [ 4] 3692         call ADRADJ
      0095F9 CC 95 24         [ 2] 3693         JP     COMMA
                                   3694 
                                   3695 ;       AGAIN   ( a -- )
                                   3696 ;       Terminate a BEGIN-AGAIN
                                   3697 ;       infinite loop structure.
      0095FC 95 EB                 3698         .word      LINK
                           00157E  3699 LINK = . 
      0095FE 85                    3700 	.byte      IMEDD+5
      0095FF 41 47 41 49 4E        3701         .ascii     "AGAIN"
      009604                       3702 AGAIN:
      009604 CD 95 69         [ 4] 3703         CALL     COMPI
      009607 85 3F                 3704         .word BRAN
      009609 CD 87 B4         [ 4] 3705         call ADRADJ 
      00960C CC 95 24         [ 2] 3706         JP     COMMA
                                   3707 
                                   3708 ;       IF      ( -- A )
                                   3709 ;       Begin a conditional branch.
      00960F 95 FE                 3710         .word      LINK
                           001591  3711 LINK = . 
      009611 82                    3712 	.byte      IMEDD+2
      009612 49 46                 3713         .ascii     "IF"
      009614                       3714 IFF:
      009614 CD 95 69         [ 4] 3715         CALL     COMPI
      009617 85 28                 3716         .word QBRAN
      009619 CD 8C 54         [ 4] 3717         CALL     HERE
      00961C CD 8B 66         [ 4] 3718         CALL     ZERO
      00961F CC 95 24         [ 2] 3719         JP     COMMA
                                   3720 
                                   3721 ;       THEN        ( A -- )
                                   3722 ;       Terminate a conditional branch structure.
      009622 96 11                 3723         .word      LINK
                           0015A4  3724 LINK = . 
      009624 84                    3725 	.byte      IMEDD+4
      009625 54 48 45 4E           3726         .ascii     "THEN"
      009629                       3727 THENN:
      009629 CD 8C 54         [ 4] 3728         CALL     HERE
      00962C CD 87 B4         [ 4] 3729         call ADRADJ 
      00962F CD 86 2A         [ 4] 3730         CALL     SWAPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      009632 CC 85 5C         [ 2] 3731         JP     STORE
                                   3732 
                                   3733 ;       ELSE        ( A -- A )
                                   3734 ;       Start the false clause in an IF-ELSE-THEN structure.
      009635 96 24                 3735         .word      LINK
                           0015B7  3736 LINK = . 
      009637 84                    3737 	.byte      IMEDD+4
      009638 45 4C 53 45           3738         .ascii     "ELSE"
      00963C                       3739 ELSEE:
      00963C CD 95 69         [ 4] 3740         CALL     COMPI
      00963F 85 3F                 3741         .word BRAN
      009641 CD 8C 54         [ 4] 3742         CALL     HERE
      009644 CD 8B 66         [ 4] 3743         CALL     ZERO
      009647 CD 95 24         [ 4] 3744         CALL     COMMA
      00964A CD 86 2A         [ 4] 3745         CALL     SWAPP
      00964D CD 8C 54         [ 4] 3746         CALL     HERE
      009650 CD 87 B4         [ 4] 3747         call ADRADJ 
      009653 CD 86 2A         [ 4] 3748         CALL     SWAPP
      009656 CC 85 5C         [ 2] 3749         JP     STORE
                                   3750 
                                   3751 ;       AHEAD       ( -- A )
                                   3752 ;       Compile a forward branch instruction.
      009659 96 37                 3753         .word      LINK
                           0015DB  3754 LINK = . 
      00965B 85                    3755 	.byte      IMEDD+5
      00965C 41 48 45 41 44        3756         .ascii     "AHEAD"
      009661                       3757 AHEAD:
      009661 CD 95 69         [ 4] 3758         CALL     COMPI
      009664 85 3F                 3759         .word BRAN
      009666 CD 8C 54         [ 4] 3760         CALL     HERE
      009669 CD 8B 66         [ 4] 3761         CALL     ZERO
      00966C CC 95 24         [ 2] 3762         JP     COMMA
                                   3763 
                                   3764 ;       WHILE       ( a -- A a )
                                   3765 ;       Conditional branch out of a BEGIN-WHILE-REPEAT loop.
      00966F 96 5B                 3766         .word      LINK
                           0015F1  3767 LINK = . 
      009671 85                    3768 	.byte      IMEDD+5
      009672 57 48 49 4C 45        3769         .ascii     "WHILE"
      009677                       3770 WHILE:
      009677 CD 95 69         [ 4] 3771         CALL     COMPI
      00967A 85 28                 3772         .word QBRAN
      00967C CD 8C 54         [ 4] 3773         CALL     HERE
      00967F CD 8B 66         [ 4] 3774         CALL     ZERO
      009682 CD 95 24         [ 4] 3775         CALL     COMMA
      009685 CC 86 2A         [ 2] 3776         JP     SWAPP
                                   3777 
                                   3778 ;       REPEAT      ( A a -- )
                                   3779 ;       Terminate a BEGIN-WHILE-REPEAT indefinite loop.
      009688 96 71                 3780         .word      LINK
                           00160A  3781 LINK = . 
      00968A 86                    3782         .byte      IMEDD+6
      00968B 52 45 50 45 41 54     3783         .ascii     "REPEAT"
      009691                       3784 REPEA:
      009691 CD 95 69         [ 4] 3785         CALL     COMPI
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      009694 85 3F                 3786         .word BRAN
      009696 CD 87 B4         [ 4] 3787         call ADRADJ 
      009699 CD 95 24         [ 4] 3788         CALL     COMMA
      00969C CD 8C 54         [ 4] 3789         CALL     HERE
      00969F CD 87 B4         [ 4] 3790         call ADRADJ 
      0096A2 CD 86 2A         [ 4] 3791         CALL     SWAPP
      0096A5 CC 85 5C         [ 2] 3792         JP     STORE
                                   3793 
                                   3794 ;       AFT         ( a -- a A )
                                   3795 ;       Jump to THEN in a FOR-AFT-THEN-NEXT loop the first time through.
      0096A8 96 8A                 3796         .word      LINK
                           00162A  3797 LINK = . 
      0096AA 83                    3798 	.byte      IMEDD+3
      0096AB 41 46 54              3799         .ascii     "AFT"
      0096AE                       3800 AFT:
      0096AE CD 86 10         [ 4] 3801         CALL     DROP
      0096B1 CD 96 61         [ 4] 3802         CALL     AHEAD
      0096B4 CD 8C 54         [ 4] 3803         CALL     HERE
      0096B7 CC 86 2A         [ 2] 3804         JP     SWAPP
                                   3805 
                                   3806 ;       ABORT"      ( -- ; <string> )
                                   3807 ;       Conditional abort with an error message.
      0096BA 96 AA                 3808         .word      LINK
                           00163C  3809 LINK = . 
      0096BC 86                    3810 	.byte      IMEDD+6
      0096BD 41 42 4F 52 54        3811         .ascii     "ABORT"
      0096C2 22                    3812         .byte      '"'
      0096C3                       3813 ABRTQ:
      0096C3 CD 95 69         [ 4] 3814         CALL     COMPI
      0096C6 93 E7                 3815         .word ABORQ
      0096C8 CC 95 99         [ 2] 3816         JP     STRCQ
                                   3817 
                                   3818 ;       $"     ( -- ; <string> )
                                   3819 ;       Compile an inline string literal.
      0096CB 96 BC                 3820         .word      LINK
                           00164D  3821 LINK = . 
      0096CD 82                    3822 	.byte      IMEDD+2
      0096CE 24 22                 3823         .byte     '$','"'
      0096D0                       3824 STRQ:
      0096D0 CD 95 69         [ 4] 3825         CALL     COMPI
      0096D3 90 01                 3826         .word STRQP 
      0096D5 CC 95 99         [ 2] 3827         JP     STRCQ
                                   3828 
                                   3829 ;       ."          ( -- ; <string> )
                                   3830 ;       Compile an inline string literal to be typed out at run time.
      0096D8 96 CD                 3831         .word      LINK
                           00165A  3832 LINK = . 
      0096DA 82                    3833 	.byte      IMEDD+2
      0096DB 2E 22                 3834         .byte     '.','"'
      0096DD                       3835 DOTQ:
      0096DD CD 95 69         [ 4] 3836         CALL     COMPI
      0096E0 90 0B                 3837         .word DOTQP 
      0096E2 CC 95 99         [ 2] 3838         JP     STRCQ
                                   3839 
                                   3840 ;; Name compiler
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



                                   3841 
                                   3842 ;       ?UNIQUE ( a -- a )
                                   3843 ;       Display a warning message
                                   3844 ;       if word already exists.
      0096E5 96 DA                 3845         .word      LINK
                           001667  3846 LINK = . 
      0096E7 07                    3847         .byte      7
      0096E8 3F 55 4E 49 51 55 45  3848         .ascii     "?UNIQUE"
      0096EF                       3849 UNIQU:
      0096EF CD 86 1A         [ 4] 3850         CALL     DUPP
      0096F2 CD 92 DB         [ 4] 3851         CALL     NAMEQ   ;?name exists
      0096F5 CD 85 28         [ 4] 3852         CALL     QBRAN
      0096F8 97 0E                 3853         .word      UNIQ1
      0096FA CD 90 0B         [ 4] 3854         CALL     DOTQP   ;redef are OK
      0096FD 07                    3855         .byte       7
      0096FE 20 72 65 44 65 66 20  3856         .ascii     " reDef "       
      009705 CD 86 44         [ 4] 3857         CALL     OVER
      009708 CD 8C 3D         [ 4] 3858         CALL     COUNT
      00970B CD 8F AE         [ 4] 3859         CALL     TYPES   ;just in case
      00970E CC 86 10         [ 2] 3860 UNIQ1:  JP     DROP
                                   3861 
                                   3862 ;       $,n     ( na -- )
                                   3863 ;       Build a new dictionary name
                                   3864 ;       using string at na.
                                   3865 ; compile dans l'espace des variables 
      009711 96 E7                 3866         .word      LINK
                           001693  3867 LINK = . 
      009713 03                    3868         .byte      3
      009714 24 2C 6E              3869         .ascii     "$,n"
      009717                       3870 SNAME:
      009717 CD 86 1A         [ 4] 3871         CALL     DUPP
      00971A CD 85 91         [ 4] 3872         CALL     CAT     ;?null input
      00971D CD 85 28         [ 4] 3873         CALL     QBRAN
      009720 97 4D                 3874         .word      PNAM1
      009722 CD 96 EF         [ 4] 3875         CALL     UNIQU   ;?redefinition
      009725 CD 86 1A         [ 4] 3876         CALL     DUPP
      009728 CD 8C 3D         [ 4] 3877         CALL     COUNT
      00972B CD 88 15         [ 4] 3878         CALL     PLUS
      00972E CD 87 68         [ 4] 3879         CALL     VPP
      009731 CD 85 5C         [ 4] 3880         CALL     STORE
      009734 CD 86 1A         [ 4] 3881         CALL     DUPP
      009737 CD 87 86         [ 4] 3882         CALL     LAST
      00973A CD 85 5C         [ 4] 3883         CALL     STORE   ;save na for vocabulary link
      00973D CD 8A DE         [ 4] 3884         CALL     CELLM   ;link address
      009740 CD 87 5A         [ 4] 3885         CALL     CNTXT
      009743 CD 85 73         [ 4] 3886         CALL     AT
      009746 CD 86 2A         [ 4] 3887         CALL     SWAPP
      009749 CD 85 5C         [ 4] 3888         CALL     STORE
      00974C 81               [ 4] 3889         RET     ;save code pointer
      00974D CD 90 01         [ 4] 3890 PNAM1:  CALL     STRQP
      009750 05                    3891         .byte      5
      009751 20 6E 61 6D 65        3892         .ascii     " name" ;null input
      009756 CC 93 EF         [ 2] 3893         JP     ABOR1
                                   3894 
                                   3895 ;; FORTH compiler
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



                                   3896 
                                   3897 ;       $COMPILE        ( a -- )
                                   3898 ;       Compile next word to
                                   3899 ;       dictionary as a token or literal.
      009759 97 13                 3900         .word      LINK
                           0016DB  3901 LINK = . 
      00975B 08                    3902         .byte      8
      00975C 24 43 4F 4D 50 49 4C  3903         .ascii     "$COMPILE"
             45
      009764                       3904 SCOMP:
      009764 CD 92 DB         [ 4] 3905         CALL     NAMEQ
      009767 CD 87 C4         [ 4] 3906         CALL     QDUP    ;?defined
      00976A CD 85 28         [ 4] 3907         CALL     QBRAN
      00976D 97 85                 3908         .word      SCOM2
      00976F CD 85 73         [ 4] 3909         CALL     AT
      009772 CD 84 F5         [ 4] 3910         CALL     DOLIT
      009775 80 00                 3911         .word     0x8000	;  IMEDD*256
      009777 CD 86 66         [ 4] 3912         CALL     ANDD    ;?immediate
      00977A CD 85 28         [ 4] 3913         CALL     QBRAN
      00977D 97 82                 3914         .word      SCOM1
      00977F CC 85 4F         [ 2] 3915         JP     EXECU
      009782 CC 98 1F         [ 2] 3916 SCOM1:  JP     JSRC
      009785 CD 8E 79         [ 4] 3917 SCOM2:  CALL     NUMBQ   ;try to convert to number
      009788 CD 85 28         [ 4] 3918         CALL     QBRAN
      00978B 93 EF                 3919         .word      ABOR1
      00978D CC 95 8B         [ 2] 3920         JP     LITER
                                   3921 
                                   3922 ;       OVERT   ( -- )
                                   3923 ;       Link a new word into vocabulary.
      009790 97 5B                 3924         .word      LINK
                           001712  3925 LINK = . 
      009792 05                    3926         .byte      5
      009793 4F 56 45 52 54        3927         .ascii     "OVERT"
      009798                       3928 OVERT:
      009798 CD 87 86         [ 4] 3929         CALL     LAST
      00979B CD 85 73         [ 4] 3930         CALL     AT
      00979E CD 87 5A         [ 4] 3931         CALL     CNTXT
      0097A1 CC 85 5C         [ 2] 3932         JP     STORE
                                   3933 
                                   3934 ;       ;       ( -- )
                                   3935 ;       Terminate a colon definition.
      0097A4 97 92                 3936         .word      LINK
                           001726  3937 LINK = . 
      0097A6 C1                    3938 	.byte      IMEDD+COMPO+1
      0097A7 3B                    3939         .ascii     ";"
      0097A8                       3940 SEMIS:
                           000001  3941 .if OPTIMIZE ; more compact and faster
      0097A8 CD 84 F5         [ 4] 3942         call DOLIT 
      0097AB 00 81                 3943         .word 0x81   ; opcode for RET 
      0097AD CD 95 3B         [ 4] 3944         call CCOMMA 
                           000000  3945 .else
                                   3946         CALL     COMPI
                                   3947         .word EXIT 
                                   3948 .endif 
      0097B0 CD 94 50         [ 4] 3949         CALL     LBRAC
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      0097B3 CD 97 98         [ 4] 3950         call OVERT 
      0097B6 CD A1 B8         [ 4] 3951         CALL FMOVE
      0097B9 CD 87 C4         [ 4] 3952         call QDUP 
      0097BC CD 85 28         [ 4] 3953         call QBRAN 
      0097BF 98 EF                 3954         .word SET_RAMLAST 
      0097C1 CD A2 4C         [ 4] 3955         CALL UPDATPTR
      0097C4 81               [ 4] 3956         RET 
                                   3957 
                                   3958 
                                   3959 ;       Terminate an ISR definition 
                                   3960 ;       retourn ca of ISR as double
                                   3961 ;       I; ( -- ud )
      0097C5 97 A6                 3962         .word LINK 
                           001747  3963         LINK=.
      0097C7 C2                    3964         .byte 2+IMEDD+COMPO 
      0097C8 49 3B                 3965         .ascii "I;" 
      0097CA                       3966 ISEMI:
      0097CA 1D 00 02         [ 2] 3967         subw x,#CELLL  
      0097CD 90 AE 00 80      [ 2] 3968         ldw y,#IRET_CODE 
      0097D1 FF               [ 2] 3969         ldw (x),y 
      0097D2 CD 95 3B         [ 4] 3970         call CCOMMA
      0097D5 CD 94 50         [ 4] 3971         call LBRAC 
      0097D8 CD A2 91         [ 4] 3972         call IFMOVE
      0097DB CD 87 C4         [ 4] 3973         call QDUP 
      0097DE CD 85 28         [ 4] 3974         CALL QBRAN 
      0097E1 98 EF                 3975         .word SET_RAMLAST
      0097E3 CD 87 76         [ 4] 3976         CALL CPP
      0097E6 CD 85 73         [ 4] 3977         call AT 
      0097E9 CD 86 2A         [ 4] 3978         call SWAPP 
      0097EC CD 87 76         [ 4] 3979         CALL CPP 
      0097EF CD 85 5C         [ 4] 3980         call STORE 
      0097F2 CD 9C 49         [ 4] 3981         call UPDATCP 
      0097F5 CD 9C 06         [ 4] 3982         call EEPVP 
      0097F8 CD 86 10         [ 4] 3983         call DROP 
      0097FB CD 85 73         [ 4] 3984         call AT 
      0097FE CD 87 68         [ 4] 3985         call VPP 
      009801 CD 85 5C         [ 4] 3986         call STORE 
      009804 CC 8B 66         [ 2] 3987         jp ZERO
      009807 81               [ 4] 3988         ret           
                                   3989         
                                   3990 
                                   3991 ;       ]       ( -- )
                                   3992 ;       Start compiling words in
                                   3993 ;       input stream.
      009808 97 C7                 3994         .word      LINK
                           00178A  3995 LINK = . 
      00980A 01                    3996         .byte      1
      00980B 5D                    3997         .ascii     "]"
      00980C                       3998 RBRAC:
      00980C CD 84 F5         [ 4] 3999         CALL   DOLIT
      00980F 97 64                 4000         .word  SCOMP
      009811 CD 87 38         [ 4] 4001         CALL   TEVAL
      009814 CC 85 5C         [ 2] 4002         JP     STORE
                                   4003 
                                   4004 ;       CALL,    ( ca -- )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



                                   4005 ;       Compile a subroutine call.
      009817 98 0A                 4006         .word      LINK
                           001799  4007 LINK = . 
      009819 05                    4008         .byte      5
      00981A 43 41 4C 4C 2C        4009         .ascii     "CALL,"
      00981F                       4010 JSRC:
      00981F CD 84 F5         [ 4] 4011         CALL     DOLIT
      009822 00 CD                 4012         .word     CALLL     ;CALL
      009824 CD 95 3B         [ 4] 4013         CALL     CCOMMA
      009827 CC 95 24         [ 2] 4014         JP     COMMA
                                   4015 
                                   4016 ;       INIT-OFS ( -- )
                                   4017 ;       compute offset to adjust jump address 
                                   4018 ;       set variable OFFSET 
      00982A 98 19                 4019         .word LINK 
                           0017AC  4020         LINK=.
      00982C 08                    4021         .byte 8 
      00982D 49 4E 49 54 2D 4F 46  4022         .ascii "INIT-OFS" 
             53
      009835                       4023 INITOFS:
      009835 CD 87 27         [ 4] 4024         call TFLASH 
      009838 CD 85 73         [ 4] 4025         CALL AT 
      00983B CD 86 1A         [ 4] 4026         CALL DUPP 
      00983E CD 85 28         [ 4] 4027         call QBRAN
      009841 98 52                 4028         .word 1$
      009843 CD 86 10         [ 4] 4029         call DROP  
      009846 CD 87 76         [ 4] 4030         call CPP 
      009849 CD 85 73         [ 4] 4031         call AT 
      00984C CD 8C 54         [ 4] 4032         call HERE
      00984F CD 88 8E         [ 4] 4033         call SUBB 
      009852 CD 87 AB         [ 4] 4034 1$:     call OFFSET 
      009855 CC 85 5C         [ 2] 4035         jp STORE  
                                   4036 
                                   4037 ;       :       ( -- ; <string> )
                                   4038 ;       Start a new colon definition
                                   4039 ;       using next word as its name.
      009858 98 2C                 4040         .word      LINK
                           0017DA  4041 LINK = . 
      00985A 01                    4042         .byte      1
      00985B 3A                    4043         .ascii     ":"
      00985C                       4044 COLON:
      00985C CD 98 35         [ 4] 4045         call INITOFS       
      00985F CD 91 DE         [ 4] 4046         CALL   TOKEN
      009862 CD 97 17         [ 4] 4047         CALL   SNAME
      009865 CC 98 0C         [ 2] 4048         JP     RBRAC
                                   4049 
                                   4050 ;       I:  ( -- )
                                   4051 ;       Start interrupt service routine definition
                                   4052 ;       those definition have no name.
      009868 98 5A                 4053         .word LINK
                           0017EA  4054         LINK=.
      00986A 02                    4055         .byte 2 
      00986B 49 3A                 4056         .ascii "I:" 
      00986D                       4057 ICOLON:
      00986D CD 98 35         [ 4] 4058         call INITOFS 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



      009870 CC 98 0C         [ 2] 4059         jp RBRAC  
                                   4060 
                                   4061 ;       IMMEDIATE       ( -- )
                                   4062 ;       Make last compiled word
                                   4063 ;       an immediate word.
      009873 98 6A                 4064         .word      LINK
                           0017F5  4065 LINK = . 
      009875 09                    4066         .byte      9
      009876 49 4D 4D 45 44 49 41  4067         .ascii     "IMMEDIATE"
             54 45
      00987F                       4068 IMMED:
      00987F CD 84 F5         [ 4] 4069         CALL     DOLIT
      009882 80 00                 4070         .word     0x8000	;  IMEDD*256
      009884 CD 87 86         [ 4] 4071         CALL     LAST
      009887 CD 85 73         [ 4] 4072         CALL     AT
      00988A CD 85 73         [ 4] 4073         CALL     AT
      00988D CD 86 7A         [ 4] 4074         CALL     ORR
      009890 CD 87 86         [ 4] 4075         CALL     LAST
      009893 CD 85 73         [ 4] 4076         CALL     AT
      009896 CC 85 5C         [ 2] 4077         JP     STORE
                                   4078 
                                   4079 ;; Defining words
                                   4080 
                                   4081 ;       CREATE  ( -- ; <string> )
                                   4082 ;       Compile a new array
                                   4083 ;       without allocating space.
      009899 98 75                 4084         .word      LINK
                           00181B  4085 LINK = . 
      00989B 06                    4086         .byte      6
      00989C 43 52 45 41 54 45     4087         .ascii     "CREATE"
      0098A2                       4088 CREAT:
      0098A2 CD 91 DE         [ 4] 4089         CALL     TOKEN
      0098A5 CD 97 17         [ 4] 4090         CALL     SNAME
      0098A8 CD 97 98         [ 4] 4091         CALL     OVERT        
      0098AB CD 95 69         [ 4] 4092         CALL     COMPI 
      0098AE 86 C7                 4093         .word DOVAR 
      0098B0 81               [ 4] 4094         RET
                                   4095 
                                   4096 ;       VARIABLE        ( -- ; <string> )
                                   4097 ;       Compile a new variable
                                   4098 ;       initialized to 0.
      0098B1 98 9B                 4099         .word      LINK
                           001833  4100 LINK = . 
      0098B3 08                    4101         .byte      8
      0098B4 56 41 52 49 41 42 4C  4102         .ascii     "VARIABLE"
             45
      0098BC                       4103 VARIA:
                                   4104 ; indirect variable so that VARIABLE definition can be compiled in FLASH 
      0098BC CD 8C 54         [ 4] 4105         CALL HERE
      0098BF CD 86 1A         [ 4] 4106         CALL DUPP 
      0098C2 CD 8A CF         [ 4] 4107         CALL CELLP
      0098C5 CD 87 68         [ 4] 4108         CALL VPP 
      0098C8 CD 85 5C         [ 4] 4109         CALL STORE
      0098CB CD 98 A2         [ 4] 4110         CALL CREAT
      0098CE CD 86 1A         [ 4] 4111         CALL DUPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



      0098D1 CD 95 24         [ 4] 4112         CALL COMMA
      0098D4 CD 8B 66         [ 4] 4113         CALL ZERO
      0098D7 CD 86 2A         [ 4] 4114         call SWAPP 
      0098DA CD 85 5C         [ 4] 4115         CALL STORE
      0098DD CD A1 B8         [ 4] 4116         CALL FMOVE ; move definition to FLASH
      0098E0 CD 87 C4         [ 4] 4117         CALL QDUP 
      0098E3 CD 85 28         [ 4] 4118         CALL QBRAN 
      0098E6 98 EF                 4119         .word SET_RAMLAST   
      0098E8 CD 9C 60         [ 4] 4120         call UPDATVP  ; don't update if variable kept in RAM.
      0098EB CD A2 4C         [ 4] 4121         CALL UPDATPTR
      0098EE 81               [ 4] 4122         RET         
      0098EF                       4123 SET_RAMLAST: 
      0098EF CD 87 86         [ 4] 4124         CALL LAST 
      0098F2 CD 85 73         [ 4] 4125         CALL AT 
      0098F5 CD 87 99         [ 4] 4126         CALL RAMLAST 
      0098F8 CC 85 5C         [ 2] 4127         jp STORE  
                                   4128 
                                   4129 
                                   4130 ;       CONSTANT  ( n -- ; <string> )
                                   4131 ;       Compile a new constant 
                                   4132 ;       n CONSTANT name 
      0098FB 98 B3                 4133         .word LINK 
                           00187D  4134         LINK=. 
      0098FD 08                    4135         .byte 8 
      0098FE 43 4F 4E 53 54 41 4E  4136         .ascii "CONSTANT" 
             54
      009906                       4137 CONSTANT:          
      009906 CD 91 DE         [ 4] 4138         CALL TOKEN
      009909 CD 97 17         [ 4] 4139         CALL SNAME 
      00990C CD 97 98         [ 4] 4140         CALL OVERT 
      00990F CD 95 69         [ 4] 4141         CALL COMPI 
      009912 99 30                 4142         .word DOCONST
      009914 CD 95 24         [ 4] 4143         CALL COMMA 
      009917 CD A1 B8         [ 4] 4144         CALL FMOVE
      00991A CD 87 C4         [ 4] 4145         CALL QDUP 
      00991D CD 85 28         [ 4] 4146         CALL QBRAN 
      009920 98 EF                 4147         .word SET_RAMLAST  
      009922 CD A2 4C         [ 4] 4148         CALL UPDATPTR  
      009925 81               [ 4] 4149 1$:     RET          
                                   4150 
                                   4151 ; CONSTANT runtime semantic 
                                   4152 ; doCONST  ( -- n )
      009926 98 FD                 4153         .word LINK 
                           0018A8  4154         LINK=.
      009928 07                    4155         .byte 7
      009929 44 4F 43 4F 4E 53 54  4156         .ascii "DOCONST"
      009930                       4157 DOCONST:
      009930 1D 00 02         [ 2] 4158         subw x,#CELLL
      009933 90 85            [ 2] 4159         popw y 
      009935 90 FE            [ 2] 4160         ldw y,(y) 
      009937 FF               [ 2] 4161         ldw (x),y 
      009938 81               [ 4] 4162         ret 
                                   4163 
                                   4164 ;----------------------------------
                                   4165 ; create double constant 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



                                   4166 ; DCONST ( d -- ; <string> )
                                   4167 ;----------------------------------
      009939 99 28                 4168     .word LINK 
                           0018BB  4169     LINK=.
      00993B 06                    4170     .byte 6 
      00993C 44 43 4F 4E 53 54     4171     .ascii "DCONST"
      009942                       4172 DCONST:
      009942 CD 91 DE         [ 4] 4173         CALL TOKEN
      009945 CD 97 17         [ 4] 4174         CALL SNAME 
      009948 CD 97 98         [ 4] 4175         CALL OVERT 
      00994B CD 95 69         [ 4] 4176         CALL COMPI 
      00994E 99 71                 4177         .word DO_DCONST
      009950 CD 95 24         [ 4] 4178         CALL COMMA
      009953 CD 95 24         [ 4] 4179         CALL COMMA  
      009956 CD A1 B8         [ 4] 4180         CALL FMOVE
      009959 CD 87 C4         [ 4] 4181         CALL QDUP 
      00995C CD 85 28         [ 4] 4182         CALL QBRAN 
      00995F 98 EF                 4183         .word SET_RAMLAST  
      009961 CD A2 4C         [ 4] 4184         CALL UPDATPTR  
      009964 81               [ 4] 4185 1$:     RET          
                                   4186     
                                   4187 ;----------------------------------
                                   4188 ; runtime for DCONST 
                                   4189 ; stack double constant 
                                   4190 ; DO-DCONST ( -- d )
                                   4191 ;-----------------------------------
      009965 99 3B                 4192         .word LINK 
                           0018E7  4193         LINK=.
      009967 09                    4194         .byte 9 
      009968 44 4F 2D 44 43 4F 4E  4195         .ascii "DO-DCONST"
             53 54
      009971                       4196 DO_DCONST:
      009971 90 85            [ 2] 4197     popw y 
      009973 90 BF 24         [ 2] 4198     ldw YTEMP,y 
      009976 1D 00 04         [ 2] 4199     subw x,#2*CELLL 
      009979 90 FE            [ 2] 4200     ldw y,(y)
      00997B FF               [ 2] 4201     ldw (x),y 
      00997C 90 BE 24         [ 2] 4202     ldw y,YTEMP 
      00997F 90 EE 02         [ 2] 4203     ldw y,(2,y)
      009982 EF 02            [ 2] 4204     ldw (2,x),y 
      009984 81               [ 4] 4205     ret 
                                   4206 
                                   4207 ;; Tools
                                   4208 
                                   4209 ;       _TYPE   ( b u -- )
                                   4210 ;       Display a string. Filter
                                   4211 ;       non-printing characters.
      009985 99 67                 4212         .word      LINK
                           001907  4213 LINK = . 
      009987 05                    4214         .byte      5
      009988 5F 54 59 50 45        4215         .ascii     "_TYPE"
      00998D                       4216 UTYPE:
      00998D CD 85 E3         [ 4] 4217         CALL     TOR     ;start count down loop
      009990 20 0F            [ 2] 4218         JRA     UTYP2   ;skip first pass
      009992 CD 86 1A         [ 4] 4219 UTYP1:  CALL     DUPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



      009995 CD 85 91         [ 4] 4220         CALL     CAT
      009998 CD 8B 90         [ 4] 4221         CALL     TCHAR
      00999B CD 84 B4         [ 4] 4222         CALL     EMIT    ;display only printable
      00999E CD 8A FA         [ 4] 4223         CALL     ONEP    ;increment address
      0099A1 CD 85 09         [ 4] 4224 UTYP2:  CALL     DONXT
      0099A4 99 92                 4225         .word      UTYP1   ;loop till done
      0099A6 CC 86 10         [ 2] 4226         JP     DROP
                                   4227 
                                   4228 ;       dm+     ( a u -- a )
                                   4229 ;       Dump u bytes from ,
                                   4230 ;       leaving a+u on  stack.
      0099A9 99 87                 4231         .word      LINK
                           00192B  4232 LINK = . 
      0099AB 03                    4233         .byte      3
      0099AC 64 6D 2B              4234         .ascii     "dm+"
      0099AF                       4235 DUMPP:
      0099AF CD 86 44         [ 4] 4236         CALL     OVER
      0099B2 CD 84 F5         [ 4] 4237         CALL     DOLIT
      0099B5 00 04                 4238         .word      4
      0099B7 CD 90 34         [ 4] 4239         CALL     UDOTR   ;display address
      0099BA CD 8F 84         [ 4] 4240         CALL     SPACE
      0099BD CD 85 E3         [ 4] 4241         CALL     TOR     ;start count down loop
      0099C0 20 11            [ 2] 4242         JRA     PDUM2   ;skip first pass
      0099C2 CD 86 1A         [ 4] 4243 PDUM1:  CALL     DUPP
      0099C5 CD 85 91         [ 4] 4244         CALL     CAT
      0099C8 CD 84 F5         [ 4] 4245         CALL     DOLIT
      0099CB 00 03                 4246         .word      3
      0099CD CD 90 34         [ 4] 4247         CALL     UDOTR   ;display numeric data
      0099D0 CD 8A FA         [ 4] 4248         CALL     ONEP    ;increment address
      0099D3 CD 85 09         [ 4] 4249 PDUM2:  CALL     DONXT
      0099D6 99 C2                 4250         .word      PDUM1   ;loop till done
      0099D8 81               [ 4] 4251         RET
                                   4252 
                                   4253 ;       DUMP    ( a u -- )
                                   4254 ;       Dump u bytes from a,
                                   4255 ;       in a formatted manner.
      0099D9 99 AB                 4256         .word      LINK
                           00195B  4257 LINK = . 
      0099DB 04                    4258         .byte      4
      0099DC 44 55 4D 50           4259         .ascii     "DUMP"
      0099E0                       4260 DUMP:
      0099E0 CD 86 D7         [ 4] 4261         CALL     BASE
      0099E3 CD 85 73         [ 4] 4262         CALL     AT
      0099E6 CD 85 E3         [ 4] 4263         CALL     TOR
      0099E9 CD 8E 0C         [ 4] 4264         CALL     HEX     ;save radix, set hex
      0099EC CD 84 F5         [ 4] 4265         CALL     DOLIT
      0099EF 00 10                 4266         .word      16
      0099F1 CD 8A 20         [ 4] 4267         CALL     SLASH   ;change count to lines
      0099F4 CD 85 E3         [ 4] 4268         CALL     TOR     ;start count down loop
      0099F7 CD 8F CC         [ 4] 4269 DUMP1:  CALL     CR
      0099FA CD 84 F5         [ 4] 4270         CALL     DOLIT
      0099FD 00 10                 4271         .word      16
      0099FF CD 88 00         [ 4] 4272         CALL     DDUP
      009A02 CD 99 AF         [ 4] 4273         CALL     DUMPP   ;display numeric
      009A05 CD 87 D5         [ 4] 4274         CALL     ROT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



      009A08 CD 87 D5         [ 4] 4275         CALL     ROT
      009A0B CD 8F 84         [ 4] 4276         CALL     SPACE
      009A0E CD 8F 84         [ 4] 4277         CALL     SPACE
      009A11 CD 99 8D         [ 4] 4278         CALL     UTYPE   ;display printable characters
      009A14 CD 85 09         [ 4] 4279         CALL     DONXT
      009A17 99 F7                 4280         .word      DUMP1   ;loop till done
      009A19 CD 86 10         [ 4] 4281 DUMP3:  CALL     DROP
      009A1C CD 85 C4         [ 4] 4282         CALL     RFROM
      009A1F CD 86 D7         [ 4] 4283         CALL     BASE
      009A22 CC 85 5C         [ 2] 4284         JP     STORE   ;restore radix
                                   4285 
                                   4286 ;       .S      ( ... -- ... )
                                   4287 ;        Display  contents of stack.
      009A25 99 DB                 4288         .word      LINK
                           0019A7  4289 LINK = . 
      009A27 02                    4290         .byte      2
      009A28 2E 53                 4291         .ascii     ".S"
      009A2A                       4292 DOTS:
      009A2A CD 8F CC         [ 4] 4293         CALL     CR
      009A2D CD 8B A8         [ 4] 4294         CALL     DEPTH   ;stack depth
      009A30 CD 85 E3         [ 4] 4295         CALL     TOR     ;start count down loop
      009A33 20 09            [ 2] 4296         JRA     DOTS2   ;skip first pass
      009A35 CD 85 D7         [ 4] 4297 DOTS1:  CALL     RAT
      009A38 CD 8B BF         [ 4] 4298 	CALL     PICK
      009A3B CD 90 67         [ 4] 4299         CALL     DOT     ;index stack, display contents
      009A3E CD 85 09         [ 4] 4300 DOTS2:  CALL     DONXT
      009A41 9A 35                 4301         .word      DOTS1   ;loop till done
      009A43 CD 90 0B         [ 4] 4302         CALL     DOTQP
      009A46 05                    4303         .byte      5
      009A47 20 3C 73 70 20        4304         .ascii     " <sp "
      009A4C 81               [ 4] 4305         RET
                                   4306 
                                   4307 ;       >NAME   ( ca -- na | F )
                                   4308 ;       Convert code address
                                   4309 ;       to a name address.
      009A4D 9A 27                 4310         .word      LINK
                           0019CF  4311 LINK = . 
      009A4F 05                    4312         .byte      5
      009A50 3E 4E 41 4D 45        4313         .ascii     ">NAME"
      009A55                       4314 TNAME:
      009A55 CD 87 5A         [ 4] 4315         CALL     CNTXT   ;vocabulary link
      009A58 CD 85 73         [ 4] 4316 TNAM2:  CALL     AT
      009A5B CD 86 1A         [ 4] 4317         CALL     DUPP    ;?last word in a vocabulary
      009A5E CD 85 28         [ 4] 4318         CALL     QBRAN
      009A61 9A 7C                 4319         .word      TNAM4
      009A63 CD 88 00         [ 4] 4320         CALL     DDUP
      009A66 CD 91 EC         [ 4] 4321         CALL     NAMET
      009A69 CD 86 8F         [ 4] 4322         CALL     XORR    ;compare
      009A6C CD 85 28         [ 4] 4323         CALL     QBRAN
      009A6F 9A 76                 4324         .word      TNAM3
      009A71 CD 8A DE         [ 4] 4325         CALL     CELLM   ;continue with next word
      009A74 20 E2            [ 2] 4326         JRA     TNAM2
      009A76 CD 86 2A         [ 4] 4327 TNAM3:  CALL     SWAPP
      009A79 CC 86 10         [ 2] 4328         JP     DROP
      009A7C CD 87 F5         [ 4] 4329 TNAM4:  CALL     DDROP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



      009A7F CC 8B 66         [ 2] 4330         JP     ZERO
                                   4331 
                                   4332 ;       .ID     ( na -- )
                                   4333 ;        Display  name at address.
      009A82 9A 4F                 4334         .word      LINK
                           001A04  4335 LINK = . 
      009A84 03                    4336         .byte      3
      009A85 2E 49 44              4337         .ascii     ".ID"
      009A88                       4338 DOTID:
      009A88 CD 87 C4         [ 4] 4339         CALL     QDUP    ;if zero no name
      009A8B CD 85 28         [ 4] 4340         CALL     QBRAN
      009A8E 9A 9E                 4341         .word      DOTI1
      009A90 CD 8C 3D         [ 4] 4342         CALL     COUNT
      009A93 CD 84 F5         [ 4] 4343         CALL     DOLIT
      009A96 00 1F                 4344         .word      0x1F
      009A98 CD 86 66         [ 4] 4345         CALL     ANDD    ;mask lexicon bits
      009A9B CC 99 8D         [ 2] 4346         JP     UTYPE
      009A9E CD 90 0B         [ 4] 4347 DOTI1:  CALL     DOTQP
      009AA1 09                    4348         .byte      9
      009AA2 20 6E 6F 4E 61 6D 65  4349         .ascii     " noName"
      009AA9 81               [ 4] 4350         RET
                                   4351 
                           000000  4352 WANT_SEE=0
                           000000  4353 .if WANT_SEE 
                                   4354 ;       SEE     ( -- ; <string> )
                                   4355 ;       A simple decompiler.
                                   4356 ;       Updated for byte machines.
                                   4357         .word      LINK
                                   4358 LINK = . 
                                   4359         .byte      3
                                   4360         .ascii     "SEE"
                                   4361 SEE:
                                   4362         CALL     TICK    ;starting address
                                   4363         CALL     CR
                                   4364         CALL     ONEM
                                   4365 SEE1:   CALL     ONEP
                                   4366         CALL     DUPP
                                   4367         CALL     AT
                                   4368         CALL     DUPP
                                   4369         CALL     QBRAN
                                   4370         .word    SEE2
                                   4371         CALL     TNAME   ;?is it a name
                                   4372 SEE2:   CALL     QDUP    ;name address or zero
                                   4373         CALL     QBRAN
                                   4374         .word    SEE3
                                   4375         CALL     SPACE
                                   4376         CALL     DOTID   ;display name
                                   4377         CALL     ONEP
                                   4378         JRA      SEE4
                                   4379 SEE3:   CALL     DUPP
                                   4380         CALL     CAT
                                   4381         CALL     UDOT    ;display number
                                   4382 SEE4:   CALL     NUFQ    ;user control
                                   4383         CALL     QBRAN
                                   4384         .word    SEE1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



                                   4385         JP     DROP
                                   4386 .endif ; WANT_SEE 
                                   4387 
                                   4388 ;       WORDS   ( -- )
                                   4389 ;       Display names in vocabulary.
      009AAA 9A 84                 4390         .word      LINK
                           001A2C  4391 LINK = . 
      009AAC 05                    4392         .byte      5
      009AAD 57 4F 52 44 53        4393         .ascii     "WORDS"
      009AB2                       4394 WORDS:
      009AB2 CD 8F CC         [ 4] 4395         CALL     CR
      009AB5 CD 87 5A         [ 4] 4396         CALL     CNTXT   ;only in context
      009AB8 CD 85 73         [ 4] 4397 WORS1:  CALL     AT
      009ABB CD 87 C4         [ 4] 4398         CALL     QDUP    ;?at end of list
      009ABE CD 85 28         [ 4] 4399         CALL     QBRAN
      009AC1 9A D4                 4400         .word      WORS2
      009AC3 CD 86 1A         [ 4] 4401         CALL     DUPP
      009AC6 CD 8F 84         [ 4] 4402         CALL     SPACE
      009AC9 CD 9A 88         [ 4] 4403         CALL     DOTID   ;display a name
      009ACC CD 8A DE         [ 4] 4404         CALL     CELLM
      009ACF CD 85 3F         [ 4] 4405         CALL     BRAN
      009AD2 9A B8                 4406         .word      WORS1
      009AD4 81               [ 4] 4407 WORS2:  RET
                                   4408 
                                   4409         
                                   4410 ;; Hardware reset
                                   4411 
                                   4412 ;       hi      ( -- )
                                   4413 ;       Display sign-on message.
      009AD5 9A AC                 4414         .word      LINK
                           001A57  4415 LINK = . 
      009AD7 02                    4416         .byte      2
      009AD8 68 69                 4417         .ascii     "hi"
      009ADA                       4418 HI:
      009ADA CD 8F CC         [ 4] 4419         CALL     CR
      009ADD CD 90 0B         [ 4] 4420         CALL     DOTQP   ;initialize I/O
      009AE0 0F                    4421         .byte      15
      009AE1 73 74 6D 38 65 46 6F  4422         .ascii     "stm8eForth v"
             72 74 68 20 76
      009AED 33                    4423 	.byte      VER+'0'
      009AEE 2E                    4424         .byte      '.' 
      009AEF 30                    4425 	.byte      EXT+'0' ;version
      009AF0 CD 90 0B         [ 4] 4426         CALL    DOTQP
                           000001  4427 .if NUCLEO          
      009AF3 12                    4428         .byte 18
      009AF4 20 6F 6E 20 4E 55 43  4429         .ascii  " on NUCLEO-8S208RB"
             4C 45 4F 2D 38 53 32
             30 38 52 42
                                   4430 .endif
                           000000  4431 .if DISCOVERY
                                   4432         .byte 19
                                   4433         .ascii  " on STM8S-DISCOVERY"
                                   4434 .endif
                           000000  4435 .if DOORBELL
                                   4436         .byte 16
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



                                   4437         .ascii " on stm8s105k6b6"
                                   4438 .endif
      009B06 CC 8F CC         [ 2] 4439         JP     CR
                                   4440 
                           000000  4441 WANT_DEBUG=0
                           000000  4442 .if WANT_DEBUG 
                                   4443 ;       DEBUG      ( -- )
                                   4444 ;       Display sign-on message.
                                   4445 ;        .word      LINK
                                   4446 LINK = . 
                                   4447         .byte      5
                                   4448         .ascii     "DEBUG"
                                   4449 DEBUG:
                                   4450 	CALL DOLIT
                                   4451 	.word 0x65
                                   4452 	CALL EMIT
                                   4453 	CALL DOLIT
                                   4454 	.word 0
                                   4455  	CALL ZLESS 
                                   4456 	CALL DOLIT
                                   4457 	.word 0xFFFE
                                   4458 	CALL ZLESS 
                                   4459 	CALL UPLUS 
                                   4460  	CALL DROP 
                                   4461 	CALL DOLIT
                                   4462 	.word 3
                                   4463 	CALL UPLUS 
                                   4464 	CALL UPLUS 
                                   4465  	CALL DROP
                                   4466 	CALL DOLIT
                                   4467 	.word 0x43
                                   4468 	CALL UPLUS 
                                   4469  	CALL DROP
                                   4470 	CALL EMIT
                                   4471 	CALL DOLIT
                                   4472 	.word 0x4F
                                   4473 	CALL DOLIT
                                   4474 	.word 0x6F
                                   4475  	CALL XORR
                                   4476 	CALL DOLIT
                                   4477 	.word 0xF0
                                   4478  	CALL ANDD
                                   4479 	CALL DOLIT
                                   4480 	.word 0x4F
                                   4481  	CALL ORR
                                   4482 	CALL EMIT
                                   4483 	CALL DOLIT
                                   4484 	.word 8
                                   4485 	CALL DOLIT
                                   4486 	.word 6
                                   4487  	CALL SWAPP
                                   4488 	CALL OVER
                                   4489 	CALL XORR
                                   4490 	CALL DOLIT
                                   4491 	.word 3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



                                   4492 	CALL ANDD 
                                   4493 	CALL ANDD
                                   4494 	CALL DOLIT
                                   4495 	.word 0x70
                                   4496 	CALL UPLUS 
                                   4497 	CALL DROP
                                   4498 	CALL EMIT
                                   4499 	CALL DOLIT
                                   4500 	.word 0
                                   4501 	CALL QBRAN
                                   4502 	.word DEBUG1
                                   4503 	CALL DOLIT
                                   4504 	.word 0x3F
                                   4505 DEBUG1:
                                   4506 	CALL DOLIT
                                   4507 	.word 0xFFFF
                                   4508 	CALL QBRAN
                                   4509 	.word DEBUG2
                                   4510 	CALL DOLIT
                                   4511 	.word 0x74
                                   4512 	CALL BRAN
                                   4513 	.word DEBUG3
                                   4514 DEBUG2:
                                   4515 	CALL DOLIT
                                   4516 	.word 0x21
                                   4517 DEBUG3:
                                   4518 	CALL EMIT
                                   4519 	CALL DOLIT
                                   4520 	.word 0x68
                                   4521 	CALL DOLIT
                                   4522 	.word 0x80
                                   4523 	CALL STORE
                                   4524 	CALL DOLIT
                                   4525 	.word 0x80
                                   4526 	CALL AT
                                   4527 	CALL EMIT
                                   4528 	CALL DOLIT
                                   4529 	.word 0x4D
                                   4530 	CALL TOR
                                   4531 	CALL RAT
                                   4532 	CALL RFROM
                                   4533 	CALL ANDD
                                   4534 	CALL EMIT
                                   4535 	CALL DOLIT
                                   4536 	.word 0x61
                                   4537 	CALL DOLIT
                                   4538 	.word 0xA
                                   4539 	CALL TOR
                                   4540 DEBUG4:
                                   4541 	CALL DOLIT
                                   4542 	.word 1
                                   4543 	CALL UPLUS 
                                   4544 	CALL DROP
                                   4545 	CALL DONXT
                                   4546 	.word DEBUG4
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



                                   4547 	CALL EMIT
                                   4548 	CALL DOLIT
                                   4549 	.word 0x656D
                                   4550 	CALL DOLIT
                                   4551 	.word 0x100
                                   4552 	CALL UMSTA
                                   4553 	CALL SWAPP
                                   4554 	CALL DOLIT
                                   4555 	.word 0x100
                                   4556 	CALL UMSTA
                                   4557 	CALL SWAPP 
                                   4558 	CALL DROP
                                   4559 	CALL EMIT
                                   4560 	CALL EMIT
                                   4561 	CALL DOLIT
                                   4562 	.word 0x2043
                                   4563 	CALL DOLIT
                                   4564 	.word 0
                                   4565 	CALL DOLIT
                                   4566 	.word 0x100
                                   4567 	CALL UMMOD
                                   4568 	CALL EMIT
                                   4569 	CALL EMIT
                                   4570 	;JP ORIG
                                   4571 	RET
                                   4572 .endif ; WANT_DEBUG 
                                   4573 
                                   4574 
                                   4575 ;       'BOOT   ( -- a )
                                   4576 ;       The application startup vector.
      009B09 9A D7                 4577         .word      LINK
                           001A8B  4578 LINK = . 
      009B0B 05                    4579         .byte      5
      009B0C 27 42 4F 4F 54        4580         .ascii     "'BOOT"
      009B11                       4581 TBOOT:
      009B11 CD 86 C7         [ 4] 4582         CALL     DOVAR
      009B14 40 02                 4583         .word    APP_RUN      ;application to boot
                                   4584 
                                   4585 ;       COLD    ( -- )
                                   4586 ;       The hilevel cold start s=ence.
      009B16 9B 0B                 4587         .word      LINK
                           001A98  4588         LINK = . 
      009B18 04                    4589         .byte      4
      009B19 43 4F 4C 44           4590         .ascii     "COLD"
      009B1D                       4591 COLD:
                           000000  4592 .if WANT_DEBUG
                                   4593         CALL DEBUG
                                   4594 .endif ; WANT_DEBUG
      009B1D CD 84 F5         [ 4] 4595 COLD1:  CALL     DOLIT
      009B20 80 AB                 4596         .word      UZERO
      009B22 CD 84 F5         [ 4] 4597 	CALL     DOLIT
      009B25 00 06                 4598         .word      UPP
      009B27 CD 84 F5         [ 4] 4599         CALL     DOLIT
      009B2A 00 1A                 4600 	.word      UEND-UZERO
      009B2C CD 8C A1         [ 4] 4601         CALL     CMOVE   ;initialize user area
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



                                   4602 
                                   4603 ; if APP_RUN==0 initialize with ca de 'hi'  
      009B2F 90 CE 40 02      [ 2] 4604         ldw y,APP_RUN 
      009B33 26 0B            [ 1] 4605         jrne 0$
      009B35 1D 00 02         [ 2] 4606         subw x,#CELLL 
      009B38 90 AE 9A DA      [ 2] 4607         ldw y,#HI  
      009B3C FF               [ 2] 4608         ldw (x),y
      009B3D CD 9C 38         [ 4] 4609         call UPDATRUN 
      009B40                       4610 0$:        
                                   4611 ; update LAST with APP_LAST 
                                   4612 ; if APP_LAST > LAST else do the opposite
      009B40 90 CE 40 00      [ 2] 4613         ldw y,APP_LAST 
      009B44 90 B3 1A         [ 2] 4614         cpw y,ULAST 
      009B47 22 05            [ 1] 4615         jrugt 1$ 
                                   4616 ; save LAST at APP_LAST  
      009B49 CD 9C 20         [ 4] 4617         call UPDATLAST 
      009B4C 20 06            [ 2] 4618         jra 2$
      009B4E                       4619 1$: ; update LAST with APP_LAST 
      009B4E 90 BF 1A         [ 2] 4620         ldw ULAST,y
      009B51 90 BF 14         [ 2] 4621         ldw UCNTXT,y
      009B54                       4622 2$:  
                                   4623 ; update APP_CP if < app_space 
      009B54 90 CE 40 04      [ 2] 4624         ldw y,APP_CP  
      009B58 90 B3 18         [ 2] 4625         cpw y,UCP   
      009B5B 24 06            [ 1] 4626         jruge 3$ 
      009B5D CD 9C 49         [ 4] 4627         call UPDATCP
      009B60 90 BE 18         [ 2] 4628         ldw y,UCP   
      009B63                       4629 3$:
      009B63 90 BF 18         [ 2] 4630         ldw UCP,y                 
                                   4631 ; update UVP with APP_VP  
                                   4632 ; if APP_VP>UVP else do the opposite 
      009B66 90 CE 40 06      [ 2] 4633         ldw y,APP_VP 
      009B6A 90 B3 16         [ 2] 4634         cpw y,UVP 
      009B6D 22 05            [ 1] 4635         jrugt 4$
      009B6F CD 9C 60         [ 4] 4636         call UPDATVP 
      009B72 20 03            [ 2] 4637         jra 6$
      009B74                       4638 4$: ; update UVP with APP_VP 
      009B74 90 BF 16         [ 2] 4639         ldw UVP,y 
      009B77                       4640 6$:      
      009B77 CD 94 CF         [ 4] 4641         CALL     PRESE   ;initialize data stack and TIB
      009B7A CD 9B 11         [ 4] 4642         CALL     TBOOT
      009B7D CD 8C 8A         [ 4] 4643         CALL     ATEXE   ;application boot
      009B80 CD 97 98         [ 4] 4644         CALL     OVERT
      009B83 CC 94 EC         [ 2] 4645         JP     QUIT    ;start interpretation
                                   4646 
                                   4647 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



                                   4648         .include "flash.asm"
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
      009B86 9B 18                   30     .word LINK 
                           001B08    31     LINK=.
      009B88 03                      32     .byte 3 
      009B89 46 50 21                33     .ascii "FP!"
      009B8C                         34 FPSTOR:
      009B8C 90 93            [ 1]   35     ldw y,x
      009B8E 90 FE            [ 2]   36     ldw y,(y)
      009B90 90 9F            [ 1]   37     ld a,yl 
      009B92 B7 32            [ 1]   38     ld FPTR,a 
      009B94 1C 00 02         [ 2]   39     addw x,#CELLL 
      009B97 90 93            [ 1]   40     ldw y,x 
      009B99 90 FE            [ 2]   41     ldw y,(y)
      009B9B 90 BF 33         [ 2]   42     ldw PTR16,y
      009B9E 1C 00 02         [ 2]   43     addw x,#CELLL 
      009BA1 81               [ 4]   44     ret 
                                     45 
                                     46 ;-----------------------------------
                                     47 ; return EEPROM base address 
                                     48 ; as a double 
                                     49 ;  EEPROM  ( -- ud )
                                     50 ;-----------------------------------
      009BA2 9B 88                   51     .word LINK 
                           001B24    52 LINK=.
      009BA4 06                      53     .byte 6 
      009BA5 45 45 50 52 4F 4D       54     .ascii "EEPROM"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



      009BAB                         55 EEPROM: 
      009BAB 90 AE 40 00      [ 2]   56     ldw y,#EEPROM_BASE
      009BAF 1D 00 04         [ 2]   57     subw x,#2*CELLL 
      009BB2 EF 02            [ 2]   58     ldw (2,x),y 
      009BB4 90 5F            [ 1]   59     clrw y 
      009BB6 FF               [ 2]   60     ldw (x),y 
      009BB7 81               [ 4]   61     ret
                                     62 
                                     63 ;---------------------------------
                                     64 ; return APP_LAST pointer as double
                                     65 ; EEP-LAST ( -- ud )
                                     66 ;---------------------------------
      009BB8 9B A4                   67 	.word LINK 
                           001B3A    68 	LINK=.
      009BBA 08                      69 	.byte 8 
      009BBB 45 45 50 2D 4C 41 53    70 	.ascii "EEP-LAST"
             54
      009BC3                         71 EEPLAST:
      009BC3 1D 00 04         [ 2]   72 	subw x,#2*CELLL 
      009BC6 90 AE 40 00      [ 2]   73 	ldw y,#APP_LAST 
      009BCA EF 02            [ 2]   74 	ldw (2,x),y 
      009BCC 90 5F            [ 1]   75 	clrw y 
      009BCE FF               [ 2]   76 	ldw (x),y 
      009BCF 81               [ 4]   77 	ret 
                                     78 
                                     79 ;----------------------------------
                                     80 ; return APP_RUN pointer as double	
                                     81 ; EEP-RUN ( -- ud )
                                     82 ;-----------------------------------
      009BD0 9B BA                   83 	.word LINK 
                           001B52    84 	LINK=.
      009BD2 07                      85 	.byte 7
      009BD3 45 45 50 2D 52 55 4E    86 	.ascii "EEP-RUN"
      009BDA                         87 EEPRUN:
      009BDA 1D 00 04         [ 2]   88 	subw x,#2*CELLL 
      009BDD 90 AE 40 02      [ 2]   89 	ldw y,#APP_RUN 
      009BE1 EF 02            [ 2]   90 	ldw (2,x),y 
      009BE3 90 5F            [ 1]   91 	clrw y 
      009BE5 FF               [ 2]   92 	ldw (x),y 
      009BE6 81               [ 4]   93 	ret 
                                     94 
                                     95 ;------------------------------------
                                     96 ; return APP_CP pointer as double 
                                     97 ; EEP-CP ( -- ud )
                                     98 ;------------------------------------
      009BE7 9B D2                   99 	.word LINK
                           001B69   100 	LINK=.
      009BE9 06                     101 	.byte 6 
      009BEA 45 45 50 2D 43 50      102 	.ascii "EEP-CP"
      009BF0                        103 EEPCP:
      009BF0 1D 00 04         [ 2]  104 	subw x,#2*CELLL 
      009BF3 90 AE 40 04      [ 2]  105 	ldw y,#APP_CP  
      009BF7 EF 02            [ 2]  106 	ldw (2,x),y 
      009BF9 90 5F            [ 1]  107 	clrw y 
      009BFB FF               [ 2]  108 	ldw (x),y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



      009BFC 81               [ 4]  109 	ret 
                                    110 
                                    111 ;------------------------------------
                                    112 ; return APP_VP pointer as double 
                                    113 ; EEP-VP ( -- ud )
                                    114 ;-------------------------------------
      009BFD 9B E9                  115 	.word LINK
                           001B7F   116 	LINK=.
      009BFF 06                     117 	.byte 6
      009C00 45 45 50 2D 56 50      118 	.ascii "EEP-VP"
      009C06                        119 EEPVP:
      009C06 1D 00 04         [ 2]  120 	subw x,#2*CELLL 
      009C09 90 AE 40 06      [ 2]  121 	ldw y,#APP_VP  
      009C0D EF 02            [ 2]  122 	ldw (2,x),y 
      009C0F 90 5F            [ 1]  123 	clrw y 
      009C11 FF               [ 2]  124 	ldw (x),y 
      009C12 81               [ 4]  125 	ret 
                                    126 
                                    127 ;----------------------------------
                                    128 ; update APP_LAST with LAST 
                                    129 ; UPDAT-LAST ( -- )
                                    130 ;----------------------------------
      009C13 9B FF                  131 	.word LINK 
                           001B95   132 	LINK=.
      009C15 0A                     133 	.byte 10
      009C16 55 50 44 41 54 2D 4C   134 	.ascii "UPDAT-LAST"
             41 53 54
      009C20                        135 UPDATLAST:
      009C20 CD 87 86         [ 4]  136 	call LAST
      009C23 CD 85 73         [ 4]  137 	call AT  
      009C26 CD 9B C3         [ 4]  138 	call EEPLAST
      009C29 CC 9E 16         [ 2]  139 	jp EESTORE 
                                    140 
                                    141 ;---------------------------------
                                    142 ; update APP_RUN 
                                    143 ; UPDAT-RUN ( a -- )
                                    144 ;---------------------------------
      009C2C 9C 15                  145 	.word LINK
                           001BAE   146 	LINK=.
      009C2E 09                     147 	.byte 9
      009C2F 55 50 44 41 54 2D 52   148 	.ascii "UPDAT-RUN"
             55 4E
      009C38                        149 UPDATRUN:
      009C38 CD 9B DA         [ 4]  150 	call EEPRUN
      009C3B CC 9E 16         [ 2]  151 	jp EESTORE 
                                    152 	
                                    153 ;---------------------------------
                                    154 ; update APP_CP with CP 
                                    155 ; UPDAT-CP ( -- )
                                    156 ;---------------------------------
      009C3E 9C 2E                  157 	.word LINK 
                           001BC0   158 	LINK=.
      009C40 08                     159 	.byte 8 
      009C41 55 50 44 41 54 2D 43   160 	.ascii "UPDAT-CP"
             50
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      009C49                        161 UPDATCP:
      009C49 CD 87 76         [ 4]  162 	call CPP 
      009C4C CD 85 73         [ 4]  163 	call AT 
      009C4F CD 9B F0         [ 4]  164 	call EEPCP 
      009C52 CC 9E 16         [ 2]  165 	jp EESTORE 
                                    166 
                                    167 ;----------------------------------
                                    168 ; update APP_VP with VP 
                                    169 ; UPDAT-VP ( -- )
                                    170 ;----------------------------------
      009C55 9C 40                  171 	.word LINK
                           001BD7   172 	LINK=.
      009C57 08                     173 	.byte 8 
      009C58 55 50 44 41 54 2D 56   174 	.ascii "UPDAT-VP" 
             50
      009C60                        175 UPDATVP:
      009C60 CD 87 68         [ 4]  176 	call VPP 
      009C63 CD 85 73         [ 4]  177 	call AT
      009C66 CD 9C 06         [ 4]  178 	call EEPVP 
      009C69 CC 9E 16         [ 2]  179 	jp EESTORE
                                    180 	
                           000001   181 .if NUCLEO
                                    182 ;----------------------------------
                                    183 ; fetch integer at address over 65535
                                    184 ;  F@   ( ud -- n )
                                    185 ;----------------------------------
      009C6C 9C 57                  186     .word LINK 
                           001BEE   187 LINK=.
      009C6E 02                     188     .byte 2
      009C6F 46 40                  189     .ascii "F@"
      009C71                        190 FARAT:
      009C71 CD 9B 8C         [ 4]  191     call FPSTOR
      009C74 CC 9D 39         [ 2]  192 	jp EE_READ 
                                    193 
                                    194 
                                    195 ;-------------------------------------
                                    196 ; fetch C at address over 65535 
                                    197 ; FC@ ( ud -- c)
                                    198 ;-------------------------------------
      009C77 9C 6E                  199     .word LINK
                           001BF9   200     LINK=.
      009C79 03                     201     .byte 3 
      009C7A 46 43 40               202     .ascii "FC@" 
      009C7D                        203 FARCAT:
      009C7D CD 9B 8C         [ 4]  204     call FPSTOR
      009C80 CC 9D 5B         [ 2]  205 	jp EE_CREAD  
                                    206 .endif ; NUCLEO 
                                    207 
                                    208 ;----------------------------------
                                    209 ; UNLOCK EEPROM/OPT for writing/erasing
                                    210 ; wait endlessly for FLASH_IAPSR_DUL bit.
                                    211 ;  UNLKEE   ( -- )
                                    212 ;----------------------------------
      009C83 9C 79                  213     .word LINK 
                           001C05   214 LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



      009C85 06                     215     .byte 6 
      009C86 55 4E 4C 4B 45 45      216     .ascii "UNLKEE"
      009C8C                        217 UNLKEE:
      009C8C 35 00 50 5B      [ 1]  218 	mov FLASH_CR2,#0 
      009C90 35 FF 50 5C      [ 1]  219 	mov FLASH_NCR2,#0xFF 
      009C94 35 AE 50 64      [ 1]  220 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      009C98 35 56 50 64      [ 1]  221     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      009C9C 72 07 50 5F FB   [ 2]  222 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      009CA1 81               [ 4]  223 	ret
                                    224 
                                    225 ;----------------------------------
                                    226 ; UNLOCK FLASH for writing/erasing
                                    227 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                    228 ; UNLKFL  ( -- )
                                    229 ;----------------------------------
      009CA2 9C 85                  230     .word LINK 
                           001C24   231 LINK=. 
      009CA4 06                     232     .byte 6 
      009CA5 55 4E 4C 4B 46 4C      233     .ascii "UNLKFL"    
      009CAB                        234 UNLKFL:
      009CAB 35 00 50 5B      [ 1]  235 	mov FLASH_CR2,#0 
      009CAF 35 FF 50 5C      [ 1]  236 	mov FLASH_NCR2,#0xFF 
      009CB3 35 56 50 62      [ 1]  237 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      009CB7 35 AE 50 62      [ 1]  238 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      009CBB 72 03 50 5F FB   [ 2]  239 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      009CC0 81               [ 4]  240 	ret
                                    241 
                                    242 ;-----------------------------
                                    243 ; UNLOCK FLASH or EEPROM 
                                    244 ; according to FPTR address 
                                    245 ;  UNLOCK ( -- )
                                    246 ;-----------------------------
      009CC1 9C A4                  247 	.word LINK 
                           001C43   248 	LINK=.
      009CC3 06                     249 	.byte 6
      009CC4 55 4E 4C 4F 43 4B      250 	.ascii "UNLOCK"
      009CCA                        251 UNLOCK:
                                    252 ; put addr[15:0] in Y, for bounds check.
      009CCA 90 BE 33         [ 2]  253 	ldw y,PTR16   ; Y=addr15:0
                                    254 ; check addr[23:16], if <> 0 then it is extened flash memory
      009CCD 3D 32            [ 1]  255 	tnz FPTR 
      009CCF 26 16            [ 1]  256 	jrne 4$
      009CD1 90 A3 80 00      [ 2]  257     cpw y,#FLASH_BASE
      009CD5 24 10            [ 1]  258     jruge 4$
      009CD7 90 A3 40 00      [ 2]  259 	cpw y,#EEPROM_BASE  
      009CDB 25 0D            [ 1]  260     jrult 9$
      009CDD 90 A3 48 7F      [ 2]  261 	cpw y,#OPTION_END 
      009CE1 22 07            [ 1]  262 	jrugt 9$
      009CE3 CD 9C 8C         [ 4]  263 	call UNLKEE
      009CE6 81               [ 4]  264 	ret 
      009CE7 CD 9C AB         [ 4]  265 4$: call UNLKFL
      009CEA 81               [ 4]  266 9$: ret 
                                    267 
                                    268 ;-------------------------
                                    269 ; LOCK write access to 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



                                    270 ; FLASH and EEPROM 
                                    271 ; LOCK ( -- )
                                    272 ;-------------------------
      009CEB 9C C3                  273 	.word LINK 
                           001C6D   274 	LINK=.
      009CED 04                     275 	.byte 4 
      009CEE 4C 4F 43 4B            276 	.ascii "LOCK" 
      009CF2                        277 LOCK: 
      009CF2 72 13 50 5F      [ 1]  278 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      009CF6 72 17 50 5F      [ 1]  279 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009CFA 81               [ 4]  280 	ret 
                                    281 
                                    282 ;-------------------------
                                    283 ; increment FPTR 
                                    284 ; INC-FPTR ( -- )
                                    285 ;-------------------------
      009CFB 9C ED                  286 	.word LINK 
                           001C7D   287 	LINK=. 
      009CFD 08                     288 	.byte 8 
      009CFE 49 4E 43 2D 46 50 54   289 	.ascii "INC-FPTR" 
             52
      009D06                        290 INC_FPTR:
      009D06 3C 34            [ 1]  291 	inc PTR8 
      009D08 26 0C            [ 1]  292 	jrne 1$
      009D0A 90 89            [ 2]  293 	pushw y 
      009D0C 90 BE 32         [ 2]  294 	ldw y,FPTR 
      009D0F 90 5C            [ 1]  295 	incw y 
      009D11 90 BF 32         [ 2]  296 	ldw FPTR,y
      009D14 90 85            [ 2]  297 	popw y  
      009D16 81               [ 4]  298 1$: ret 
                                    299 
                                    300 ;------------------------------
                                    301 ; add u to FPTR 
                                    302 ; PTR+ ( u -- )
                                    303 ;------------------------------
      009D17 9C FD                  304 	.word LINK 
                           001C99   305 	LINK=.
      009D19 04                     306 	.byte 4 
      009D1A 50 54 52 2B            307 	.ascii "PTR+"
      009D1E                        308 PTRPLUS:
      009D1E 90 93            [ 1]  309 	ldw y,x 
      009D20 1C 00 02         [ 2]  310 	addw x,#CELLL 
      009D23 72 B9 00 33      [ 2]  311 	addw y,PTR16 
      009D27 90 BF 33         [ 2]  312 	ldw PTR16,y  
      009D2A 24 02            [ 1]  313 	jrnc 1$
      009D2C 3C 32            [ 1]  314 	inc FPTR 
      009D2E 81               [ 4]  315 1$: ret 
                                    316 
                                    317 ;---------------------------------
                                    318 ; read word at address pointed FPTR
                                    319 ; increment FPTR 
                                    320 ; EE-READ ( -- w )
                                    321 ;------------------------------------
      009D2F 9D 19                  322 	.word LINK 
                           001CB1   323 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      009D31 07                     324 	.byte 7 
      009D32 45 45 2D 52 45 41 44   325 	.ascii "EE-READ"
      009D39                        326 EE_READ:
      009D39 1D 00 02         [ 2]  327 	subw x,#CELLL 
      009D3C 92 BC 00 32      [ 5]  328 	ldf a,[FPTR]
      009D40 90 95            [ 1]  329 	ld yh,a 
      009D42 CD 9D 06         [ 4]  330 	call INC_FPTR 
      009D45 92 BC 00 32      [ 5]  331 	ldf a,[FPTR]
      009D49 CD 9D 06         [ 4]  332 	call INC_FPTR 
      009D4C 90 97            [ 1]  333 	ld yl,a 
      009D4E FF               [ 2]  334 	ldw (x),y 
      009D4F 81               [ 4]  335 	ret 
                                    336 
                                    337 ;---------------------------------------
                                    338 ; Read byte at address pointed by FPTR 
                                    339 ; EE-CREAD ( -- c )
                                    340 ;---------------------------------------
      009D50 9D 31                  341 	.word LINK 
                           001CD2   342 	LINK=.
      009D52 08                     343 	.byte 8
      009D53 45 45 2D 43 52 45 41   344 	.ascii "EE-CREAD" 
             44
      009D5B                        345 EE_CREAD:
      009D5B 1D 00 02         [ 2]  346 	subw x,#CELLL 
      009D5E 92 BC 00 32      [ 5]  347 	ldf a,[FPTR]	
      009D62 CD 9D 06         [ 4]  348 	call INC_FPTR
      009D65 90 5F            [ 1]  349 	clrw y 
      009D67 90 97            [ 1]  350 	ld yl,a 
      009D69 FF               [ 2]  351 	ldw (x),y 
      009D6A 81               [ 4]  352 	ret 
                                    353 
                                    354 ;----------------------------
                                    355 ; write a byte at address pointed 
                                    356 ; by FPTR and increment FPTR.
                                    357 ; Expect pointer already initialized 
                                    358 ; and memory unlocked 
                                    359 ; WR-BYTE ( c -- )
                                    360 ;----------------------------
      009D6B 9D 52                  361 	.word LINK 
                           001CED   362 	LINK=. 
      009D6D 07                     363 	.byte 7 
      009D6E 57 52 2D 42 59 54 45   364 	.ascii "WR-BYTE" 
                                    365 
      009D75                        366 WR_BYTE:
      009D75 CD 84 E1         [ 4]  367 	call FC_XOFF
      009D78 90 93            [ 1]  368 	ldw y,x 
      009D7A 90 FE            [ 2]  369 	ldw y,(y)
      009D7C 1C 00 02         [ 2]  370 	addw x,#CELLL 
      009D7F 90 9F            [ 1]  371 	ld a,yl
      009D81 92 BD 00 32      [ 4]  372 	ldf [FPTR],a
      009D85 72 05 50 5F FB   [ 2]  373 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009D8A CD 84 CB         [ 4]  374 	call FC_XON
      009D8D CC 9D 06         [ 2]  375 	jp INC_FPTR 
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
      009D90 9D 6D                  384 	.word LINK 
                           001D12   385 	LINK=.
      009D92 07                     386 	.byte 7 
      009D93 57 52 2D 57 4F 52 44   387 	.ascii "WR-WORD" 
      009D9A                        388 WR_WORD:
      009D9A CD 84 E1         [ 4]  389 	call FC_XOFF
      009D9D 90 93            [ 1]  390 	ldw y,x
      009D9F 90 FE            [ 2]  391 	ldw y,(y)
      009DA1 1C 00 02         [ 2]  392 	addw x,#CELLL 
      009DA4 90 9E            [ 1]  393 	ld a,yh 
      009DA6 92 BD 00 32      [ 4]  394 	ldf [FPTR],a
      009DAA 72 05 50 5F FB   [ 2]  395 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009DAF CD 9D 06         [ 4]  396 	call INC_FPTR 
      009DB2 90 9F            [ 1]  397 	ld a,yl 
      009DB4 92 BD 00 32      [ 4]  398 	ldf [FPTR],a
      009DB8 72 05 50 5F FB   [ 2]  399 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009DBD CD 84 CB         [ 4]  400 	call FC_XON
      009DC0 CC 9D 06         [ 2]  401 	jp INC_FPTR 
                                    402 
                                    403 
                                    404 ;---------------------------------------
                                    405 ; write a byte to FLASH or EEPROM/OPTION  
                                    406 ; EEC!  (c ud -- )
                                    407 ;---------------------------------------
      009DC3 9D 92                  408     .word LINK 
                           001D45   409 	LINK=.
      009DC5 04                     410     .byte 4 
      009DC6 45 45 43 21            411     .ascii "EEC!"
                                    412 	; local variables 
                           000001   413 	BTW = 1   ; byte to write offset on stack
                           000002   414     OPT = 2 
                           000002   415 	VSIZE = 2
      009DCA                        416 EECSTORE:
      009DCA 52 02            [ 2]  417 	sub sp,#VSIZE
      009DCC CD 9B 8C         [ 4]  418     call FPSTOR
      009DCF E6 01            [ 1]  419 	ld a,(1,x)
      009DD1 43               [ 1]  420 	cpl a 
      009DD2 6B 01            [ 1]  421 	ld (BTW,sp),a ; byte to write 
      009DD4 0F 02            [ 1]  422 	clr (OPT,sp)  ; OPTION flag
      009DD6 CD 9C CA         [ 4]  423 	call UNLOCK 
                                    424 	; check if option
      009DD9 3D 32            [ 1]  425 	tnz FPTR 
      009DDB 26 19            [ 1]  426 	jrne 2$
      009DDD 90 BE 33         [ 2]  427 	ldw y,PTR16 
      009DE0 90 A3 48 00      [ 2]  428 	cpw y,#OPTION_BASE
      009DE4 2B 10            [ 1]  429 	jrmi 2$
      009DE6 90 A3 48 80      [ 2]  430 	cpw y,#OPTION_END+1
      009DEA 2A 0A            [ 1]  431 	jrpl 2$
      009DEC 03 02            [ 1]  432 	cpl (OPT,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



                                    433 	; OPTION WRITE require this UNLOCK 
      009DEE 72 1E 50 5B      [ 1]  434     bset FLASH_CR2,#FLASH_CR2_OPT
      009DF2 72 1F 50 5C      [ 1]  435     bres FLASH_NCR2,#FLASH_CR2_OPT 
      009DF6                        436 2$: 
      009DF6 CD 9D 75         [ 4]  437 	call WR_BYTE 	
      009DF9 0D 02            [ 1]  438 	tnz (OPT,sp)
      009DFB 27 0D            [ 1]  439 	jreq 3$ 
      009DFD 7B 01            [ 1]  440     ld a,(BTW,sp)
      009DFF 90 5F            [ 1]  441     clrw y
      009E01 90 97            [ 1]  442 	ld yl,a 
      009E03 1D 00 02         [ 2]  443 	subw x,#CELLL 
      009E06 FF               [ 2]  444 	ldw (x),y 
      009E07 CD 9D 75         [ 4]  445 	call WR_BYTE
      009E0A                        446 3$: 
      009E0A CD 9C F2         [ 4]  447 	call LOCK 
      009E0D 5B 02            [ 2]  448 	addw sp,#VSIZE 
      009E0F 81               [ 4]  449     ret
                                    450 
                                    451 ;------------------------------
                                    452 ; write integer in FLASH|EEPROM
                                    453 ; EE! ( n ud -- )
                                    454 ;------------------------------
      009E10 9D C5                  455 	.word LINK 
                           001D92   456 	LINK=.
      009E12 03                     457 	.byte 3 
      009E13 45 45 21               458 	.ascii "EE!"
      009E16                        459 EESTORE:
      009E16 CD 9B 8C         [ 4]  460 	call FPSTOR 
      009E19 CD 9C CA         [ 4]  461 	call UNLOCK 
      009E1C 90 93            [ 1]  462 	ldw y,x 
      009E1E 90 FE            [ 2]  463 	ldw y,(y)
      009E20 90 89            [ 2]  464 	pushw y 
      009E22 90 5E            [ 1]  465 	swapw y 
      009E24 FF               [ 2]  466 	ldw (x),y 
      009E25 CD 9D 75         [ 4]  467 	call WR_BYTE 
      009E28 90 85            [ 2]  468 	popw y 
      009E2A 1D 00 02         [ 2]  469 	subw x,#CELLL
      009E2D FF               [ 2]  470 	ldw (x),y 
      009E2E CD 9D 75         [ 4]  471 	call WR_BYTE
      009E31 CC 9C F2         [ 2]  472 	jp LOCK 
                                    473 
                                    474 
                                    475 ;----------------------------
                                    476 ; Erase flash memory row 
                                    477 ; stm8s208 as 128 bytes rows
                                    478 ; ROW-ERASE ( ud -- )
                                    479 ;----------------------------
      009E34 9E 12                  480 	.word LINK 
                           001DB6   481 	LINK=. 
      009E36 09                     482 	.byte 9 
      009E37 52 4F 57 2D 45 52 41   483 	.ascii "ROW-ERASE" 
             53 45
      009E40                        484 row_erase:
      009E40 CD 84 E1         [ 4]  485 	call FC_XOFF
      009E43 CD 9B 8C         [ 4]  486 	call FPSTOR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



                                    487 ;code must be execute from RAM 
                                    488 ;copy routine to PAD 
      009E46 1D 00 02         [ 2]  489 	subw x,#CELLL 
      009E49 90 AE 9E 99      [ 2]  490 	ldw y,#row_erase_proc
      009E4D FF               [ 2]  491 	ldw (x),y 
      009E4E CD 8C 65         [ 4]  492 	call PAD 
      009E51 90 AE 9E C0      [ 2]  493 	ldw y,#row_erase_proc_end 
      009E55 72 A2 9E 99      [ 2]  494 	subw y,#row_erase_proc
      009E59 1D 00 02         [ 2]  495 	subw x,#CELLL 
      009E5C FF               [ 2]  496 	ldw (x),y 
      009E5D CD 8C A1         [ 4]  497 	call CMOVE 
      009E60                        498 block_erase:
      009E60 90 BE 33         [ 2]  499 	ldw y,FPTR+1
      009E63 90 A3 A4 80      [ 2]  500 	cpw y,#app_space 
      009E67 2A 19            [ 1]  501 	jrpl erase_flash 
                                    502 ; erase EEPROM block
      009E69 90 A3 40 00      [ 2]  503 	cpw y,#EEPROM_BASE 
      009E6D 24 04            [ 1]  504 	jruge 1$
      009E6F CD 84 CB         [ 4]  505 	call FC_XON
      009E72 81               [ 4]  506 	ret ; bad address 
      009E73 90 A3 47 FF      [ 2]  507 1$: cpw y,#EEPROM_END 
      009E77 23 04            [ 2]  508 	jrule 2$ 
      009E79 CD 84 CB         [ 4]  509 	call FC_XON
      009E7C 81               [ 4]  510 	ret ; bad address 
      009E7D                        511 2$:	
      009E7D CD 9C 8C         [ 4]  512 	call UNLKEE 
      009E80 20 03            [ 2]  513 	jra proceed_erase
                                    514 ; erase flash block:
      009E82                        515 erase_flash:
      009E82 CD 9C AB         [ 4]  516 	call UNLKFL 
      009E85                        517 proceed_erase:
      009E85 CD 8C 65         [ 4]  518 	call PAD 
      009E88 90 93            [ 1]  519 	ldw y,x
      009E8A 90 FE            [ 2]  520 	ldw y,(y)
      009E8C 1C 00 02         [ 2]  521 	addw x,#CELLL  
      009E8F 90 FD            [ 4]  522 	call (y) 
      009E91 72 17 50 5F      [ 1]  523 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009E95 CD 84 CB         [ 4]  524 	call FC_XON
      009E98 81               [ 4]  525 	ret 
                                    526 
                                    527 ; this routine is to be copied to PAD 
      009E99                        528 row_erase_proc:
      009E99 35 20 50 5B      [ 1]  529 	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
      009E9D 35 DF 50 5C      [ 1]  530 	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
      009EA1 4F               [ 1]  531 	clr a 
      009EA2 90 5F            [ 1]  532 	clrw y 
      009EA4 91 A7 00 32      [ 1]  533 	ldf ([FPTR],y),a
      009EA8 90 5C            [ 1]  534     incw y
      009EAA 91 A7 00 32      [ 1]  535 	ldf ([FPTR],y),a
      009EAE 90 5C            [ 1]  536     incw y
      009EB0 91 A7 00 32      [ 1]  537 	ldf ([FPTR],y),a
      009EB4 90 5C            [ 1]  538     incw y
      009EB6 91 A7 00 32      [ 1]  539 	ldf ([FPTR],y),a
      009EBA 72 05 50 5F FB   [ 2]  540 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009EBF 81               [ 4]  541 	ret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



      009EC0                        542 row_erase_proc_end:
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
      009EC0                        555 copy_buffer:
      009EC0 4B 80            [ 1]  556 	push #BLOCK_SIZE  
                                    557 ;enable block programming 
      009EC2 72 10 50 5B      [ 1]  558 	bset FLASH_CR2,#FLASH_CR2_PRG 
      009EC6 72 11 50 5C      [ 1]  559 	bres FLASH_NCR2,#FLASH_CR2_PRG
      009ECA 90 5F            [ 1]  560 	clrw y
      009ECC F6               [ 1]  561 1$:	ld a,(x)
      009ECD 91 A7 00 32      [ 1]  562 	ldf ([FPTR],y),a
      009ED1 5C               [ 1]  563 	incw x 
      009ED2 90 5C            [ 1]  564 	incw y 
      009ED4 0A 01            [ 1]  565 	dec (BCNT,sp)
      009ED6 26 F4            [ 1]  566 	jrne 1$
                                    567 ; wait EOP bit 
      009ED8 72 05 50 5F FB   [ 2]  568 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. 
      009EDD 84               [ 1]  569 	pop a ; remove BCNT from stack 
      009EDE 81               [ 4]  570 	ret 
      009EDF                        571 copy_buffer_end:
                                    572 
                                    573 ;-------------------------
                                    574 ; move program_row to RAM 
                                    575 ; in TIB 
                                    576 ;------------------------
      009EDF                        577 copy_prog_to_ram:
      009EDF 1D 00 06         [ 2]  578 	subw x,#6
      009EE2 90 AE 9E C0      [ 2]  579 	ldw y,#copy_buffer 
      009EE6 EF 04            [ 2]  580 	ldw (4,x),y 
      009EE8 90 AE 17 00      [ 2]  581 	ldw y,#TIBBASE
      009EEC EF 02            [ 2]  582 	ldw (2,x),y 
      009EEE 90 AE 9E DF      [ 2]  583 	ldw y,#copy_buffer_end 
      009EF2 72 A2 9E C0      [ 2]  584 	subw y,#copy_buffer  
      009EF6 FF               [ 2]  585 	ldw (x),y 
      009EF7 CD 8C A1         [ 4]  586 	call CMOVE 
      009EFA 81               [ 4]  587 	ret 
                                    588 
                                    589 
                                    590 ;-----------------------------
                                    591 ; write a row in FLASH/EEPROM 
                                    592 ; WR-ROW ( a ud -- )
                                    593 ; a -> address 128 byte buffer to write 
                                    594 ; ud ->  row address in FLASH|EEPROM 
                                    595 ;-----------------------------
      009EFB 9E 36                  596 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



                           001E7D   597 	LINK=.
      009EFD 06                     598 	.byte 6 
      009EFE 57 52 2D 52 4F 57      599 	.ascii "WR-ROW"
      009F04                        600 write_row:
      009F04 CD 84 E1         [ 4]  601 	call FC_XOFF
      009F07 CD 9B 8C         [ 4]  602 	call FPSTOR
                                    603 ; align to FLASH block 
      009F0A A6 80            [ 1]  604 	ld a,#0x80 
      009F0C B4 34            [ 1]  605 	and a,PTR8 
      009F0E B7 34            [ 1]  606 	ld PTR8,a  
      009F10 CD 9E DF         [ 4]  607 	call copy_prog_to_ram
      009F13 CD 9C CA         [ 4]  608 	call UNLOCK
      009F16 90 93            [ 1]  609 	ldw y,x 
      009F18 90 FE            [ 2]  610 	ldw y,(y)
      009F1A 1C 00 02         [ 2]  611 	addw x,#CELLL 
      009F1D 89               [ 2]  612 	pushw x 
      009F1E 93               [ 1]  613 	ldw x,y ; buffer address in x 
      009F1F CD 17 00         [ 4]  614 	call TIBBASE
      009F22 CD 9C F2         [ 4]  615 	call LOCK
      009F25 85               [ 2]  616 	popw x 
      009F26 CD 84 CB         [ 4]  617 	call FC_XON 
      009F29 81               [ 4]  618 	ret 
                                    619 
                                    620 ;-------------------------------------
                                    621 ; change value of OPTION register 
                                    622 ; SET-OPT (c n -- ) 
                                    623 ; c new value.
                                    624 ; n OPT  number {1..7}
                                    625 ;--------------------------------------
      009F2A 9E FD                  626 		.word LINK 
                           001EAC   627 		LINK=.
      009F2C 07                     628 		.byte 7 
      009F2D 53 45 54 2D 4F 50 54   629 		.ascii "SET-OPT" 
      009F34                        630 set_option: 
      009F34 90 93            [ 1]  631 		ldw y,x 
      009F36 90 FE            [ 2]  632 		ldw y,(y)
      009F38 27 06            [ 1]  633 		jreq 1$
      009F3A 90 A3 00 07      [ 2]  634 		cpw y,#7 
      009F3E 23 04            [ 2]  635 		jrule 2$ 
                                    636 ; invalid OPTION number 		
      009F40 1C 00 04         [ 2]  637 1$:		addw x,#2*CELLL
      009F43 81               [ 4]  638 		ret
      009F44 90 58            [ 2]  639 2$:		sllw y 
      009F46 72 A9 47 FF      [ 2]  640 		addw y,#OPTION_BASE-1
      009F4A FF               [ 2]  641 		ldw (x),y 
      009F4B 1D 00 02         [ 2]  642 		subw x,#CELLL 
      009F4E 90 5F            [ 1]  643 		clrw y 
      009F50 FF               [ 2]  644 		ldw (x),y 
      009F51 CD 9D CA         [ 4]  645 		call EECSTORE
      009F54 81               [ 4]  646 		ret 
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
      009F55 9F 2C                  655 	.word LINK  
                           001ED7   656 	LINK=.
      009F57 08                     657 	.byte 8 
      009F58 50 52 49 53 54 49 4E   658 	.ascii "PRISTINE"
             45
      009F60                        659 pristine:
                                    660 ;;; erase EEPROM
      009F60 CD 9B AB         [ 4]  661 	call EEPROM 
      009F63 CD 88 00         [ 4]  662 1$:	call DDUP 
      009F66 CD 9E 40         [ 4]  663 	call row_erase
      009F69 90 93            [ 1]  664 	ldw y,x 
      009F6B 90 EE 02         [ 2]  665 	ldw y,(2,y)
      009F6E 72 A9 00 80      [ 2]  666 	addw y,#BLOCK_SIZE
      009F72 EF 02            [ 2]  667 	ldw (2,x),y
      009F74 90 A3 48 00      [ 2]  668 	cpw y,#OPTION_BASE 
      009F78 25 E9            [ 1]  669 	jrult 1$
                                    670 ;;; reset OPTION to default values
      009F7A 90 AE 00 01      [ 2]  671 	ldw y,#1 ; OPT1 
      009F7E FF               [ 2]  672 2$:	ldw (x),y   
      009F7F 90 5F            [ 1]  673 	clrw y 
      009F81 EF 02            [ 2]  674 	ldw (2,x),y  ; ( 0 1 -- ) 
      009F83 CD 88 00         [ 4]  675 	call DDUP    ; ( 0 1 0 1 -- )  
      009F86 CD 9F 34         [ 4]  676 	call set_option
      009F89 90 93            [ 1]  677 	ldw y,x 
      009F8B 90 FE            [ 2]  678 	ldw y,(y)
      009F8D 90 5C            [ 1]  679 	incw y  ; next OPTION 
      009F8F 90 A3 00 08      [ 2]  680 	cpw y,#8 
      009F93 25 E9            [ 1]  681 	jrult 2$
                                    682 ;;; erase first row of app_space 	
      009F95 90 AE A4 80      [ 2]  683 	ldw y,#app_space
      009F99 EF 02            [ 2]  684 	ldw (2,x),y  
      009F9B 90 5F            [ 1]  685 	clrw y 
      009F9D FF               [ 2]  686 	ldw (x),y ; ( app_space 0 -- )
      009F9E CD 9E 40         [ 4]  687 	call row_erase 
                                    688 ; reset interrupt vectors 
      009FA1 1D 00 02         [ 2]  689 	subw x,#CELLL 
      009FA4 90 5F            [ 1]  690 	clrw y  
      009FA6 FF               [ 2]  691 4$:	ldw (x),y  ; ( n -- ) int# 
      009FA7 CD 86 1A         [ 4]  692 	call DUPP  
      009FAA CD 9F C7         [ 4]  693 	call reset_vector
      009FAD 90 93            [ 1]  694 	ldw y,x 
      009FAF 90 FE            [ 2]  695 	ldw y,(y)
      009FB1 90 5C            [ 1]  696 	incw y   ; next vector 
      009FB3 90 A3 00 19      [ 2]  697 	cpw y,#25 
      009FB7 25 ED            [ 1]  698 	jrult 4$
      009FB9 CC 80 80         [ 2]  699 	jp NonHandledInterrupt ; reset MCU
                                    700 
                                    701 ;------------------------------
                                    702 ; reset an interrupt vector 
                                    703 ; to its initial value 
                                    704 ; i.e. NonHandledInterrupt
                                    705 ; RST-IVEC ( n -- )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



                                    706 ;-----------------------------
      009FBC 9F 57                  707 	.word LINK 
                           001F3E   708 	LINK=. 
      009FBE 08                     709 	.byte 8 
      009FBF 52 53 54 2D 49 56 45   710 	.ascii "RST-IVEC"
             43
      009FC7                        711 reset_vector:
      009FC7 90 93            [ 1]  712 	ldw y,x
      009FC9 1C 00 02         [ 2]  713 	addw x,#CELLL 
      009FCC 90 FE            [ 2]  714 	ldw y,(y)
      009FCE 90 A3 00 17      [ 2]  715 	cpw y,#23 
      009FD2 27 3A            [ 1]  716 	jreq 9$
      009FD4 90 A3 00 1D      [ 2]  717 	cpw y,#29 ; last vector
      009FD8 22 34            [ 1]  718 	jrugt 9$  
      009FDA 90 58            [ 2]  719 	sllw y 
      009FDC 90 58            [ 2]  720 	sllw y 
      009FDE 72 A9 80 08      [ 2]  721 	addw y,#0x8008 ; irq0 address 
      009FE2 90 BF 24         [ 2]  722 	ldw YTEMP,y
      009FE5 1D 00 06         [ 2]  723 	subw x,#3*CELLL 
      009FE8 EF 02            [ 2]  724 	ldw (2,x),y 
      009FEA 90 5F            [ 1]  725 	clrw y
      009FEC FF               [ 2]  726 	ldw (x),y 
      009FED A6 82            [ 1]  727 	ld a,#0x82 
      009FEF 90 95            [ 1]  728 	ld yh,a
      009FF1 EF 04            [ 2]  729 	ldw (4,x),y
      009FF3 CD 9E 16         [ 4]  730 	call EESTORE
      009FF6 1D 00 06         [ 2]  731 	subw x,#3*CELLL
      009FF9 90 5F            [ 1]  732 	clrw y 
      009FFB FF               [ 2]  733 	ldw (x),y 
      009FFC 90 AE 80 80      [ 2]  734 	ldw y,#NonHandledInterrupt
      00A000 EF 04            [ 2]  735 	ldw (4,x),y 
      00A002 90 BE 24         [ 2]  736 	ldw y,YTEMP  
      00A005 72 A9 00 02      [ 2]  737 	addw y,#2
      00A009 EF 02            [ 2]  738 	ldw (2,x),y 
      00A00B CD 9E 16         [ 4]  739 	call EESTORE
      00A00E 81               [ 4]  740 9$:	ret 
                                    741 
                                    742 
                                    743 ;------------------------------
                                    744 ; all interrupt vector with 
                                    745 ; an address >= a are resetted 
                                    746 ; to default
                                    747 ; CHKIVEC ( a -- )
                                    748 ;------------------------------
      00A00F 9F BE                  749 	.word LINK 
                           001F91   750 	LINK=.
      00A011 07                     751 	.byte 7
      00A012 43 48 4B 49 56 45 43   752 	.ascii "CHKIVEC"
                                    753 ;local variables 
                           000001   754 	SSP=1
                           000003   755 	CADR=3
                           000005   756 	OFS=5
                           000006   757 	VSIZE=6  
      00A019                        758 CHKIVEC:
      00A019 52 06            [ 2]  759 	sub sp,#VSIZE ;alloc local variables 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



      00A01B 90 93            [ 1]  760 	ldw y,x 
      00A01D 90 FE            [ 2]  761 	ldw y,(y)
      00A01F 17 03            [ 2]  762 	ldw (CADR,sp),y ; ca 
      00A021 1F 01            [ 2]  763 	ldw (SSP,sp),x 
      00A023 AE 80 0A         [ 2]  764 	ldw x,#0x800a ; irq0 address 
      00A026 BF 33            [ 2]  765 	ldw PTR16,X
      00A028 AE FF FC         [ 2]  766 	ldw x,#-4 
      00A02B 1C 00 04         [ 2]  767 1$:	addw x,#4
      00A02E A3 00 78         [ 2]  768 	cpw x,#30*4 ; irq0-29 
      00A031 27 22            [ 1]  769 	jreq 9$
      00A033 90 93            [ 1]  770 	ldw y,x  
      00A035 91 D6 33         [ 4]  771 	ld a,([PTR16],y)
      00A038 11 03            [ 1]  772 	cp a,(CADR,sp)
      00A03A 25 EF            [ 1]  773 	jrult 1$
      00A03C 90 5C            [ 1]  774 	incw y 
      00A03E 91 D6 33         [ 4]  775 	ld a,([PTR16],y)
      00A041 11 04            [ 1]  776 	cp a,(CADR+1,sp) 
      00A043 25 E6            [ 1]  777 	jrult 1$ 
      00A045 1F 05            [ 2]  778 	ldw (OFS,sp),x 
      00A047 54               [ 2]  779 	srlw x
      00A048 54               [ 2]  780 	srlw x 
      00A049 90 93            [ 1]  781 	ldw y,x 
      00A04B 1E 01            [ 2]  782 	ldw x,(SSP,sp)
      00A04D FF               [ 2]  783 	ldw (x),y
      00A04E CD 9F C7         [ 4]  784 	call reset_vector
      00A051 1E 05            [ 2]  785 	ldw x,(OFS,sp) 
      00A053 20 D6            [ 2]  786 	jra 1$
      00A055 1E 01            [ 2]  787 9$:	ldw x,(SSP,sp) 
      00A057 1C 00 02         [ 2]  788 	addw x,#CELLL 
      00A05A 5B 06            [ 2]  789 	addw sp,#VSIZE ; drop local variables  
      00A05C 81               [ 4]  790 	ret 
                                    791 
                                    792 ;------------------------------
                                    793 ; set interrupt vector 
                                    794 ; SET-IVEC ( ud n -- )
                                    795 ;  ud Handler address
                                    796 ;  n  vector # 0 .. 29 
                                    797 ;-----------------------------
      00A05D A0 11                  798 	.word LINK
                           001FDF   799 	LINK=.
      00A05F 08                     800 	.byte 8 
      00A060 53 45 54 2D 49 56 45   801 	.ascii "SET-IVEC" 
             43
      00A068                        802 set_vector:
      00A068 90 93            [ 1]  803     ldw y,x 
      00A06A 1C 00 02         [ 2]  804 	addw x,#CELLL 
      00A06D 90 FE            [ 2]  805 	ldw y,(y) ; vector #
      00A06F 90 A3 00 1D      [ 2]  806 	cpw y,#29 ; last vector
      00A073 23 04            [ 2]  807 	jrule 2$
      00A075 1C 00 04         [ 2]  808 	addw x,#2*CELLL 
      00A078 81               [ 4]  809 	ret
      00A079 90 58            [ 2]  810 2$:	sllw y 
      00A07B 90 58            [ 2]  811 	sllw y 
      00A07D 72 A9 80 08      [ 2]  812 	addw y,#0X8008 ; IRQ0 vector address 
      00A081 90 BF 24         [ 2]  813 	ldw YTEMP,y ; vector address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



      00A084 A6 82            [ 1]  814 	ld a,#0x82 
      00A086 90 95            [ 1]  815 	ld yh,a 
      00A088 E6 01            [ 1]  816 	ld a,(1,x) ; isr address bits 23..16 
      00A08A 90 97            [ 1]  817 	ld yl,a 
                                    818 ;  write 0x82 + most significant byte of int address	
      00A08C 1D 00 06         [ 2]  819 	subw x,#3*CELLL 
      00A08F EF 04            [ 2]  820 	ldw (4,x),y 
      00A091 90 BE 24         [ 2]  821 	ldw y,YTEMP
      00A094 EF 02            [ 2]  822 	ldw (2,x),y ; vector address 
      00A096 90 5F            [ 1]  823 	clrw y 
      00A098 FF               [ 2]  824 	ldw (x),y   ; as a double 
      00A099 CD 9E 16         [ 4]  825 	call EESTORE 
      00A09C 90 93            [ 1]  826 	ldw y,x 
      00A09E 90 EE 02         [ 2]  827 	ldw y,(2,y) ; bits 15..0 int vector 
      00A0A1 1D 00 06         [ 2]  828 	subw x,#3*CELLL 
      00A0A4 EF 04            [ 2]  829 	ldw (4,x),y 
      00A0A6 90 BE 24         [ 2]  830 	ldw y,YTEMP 
      00A0A9 72 A9 00 02      [ 2]  831 	addw y,#2 
      00A0AD EF 02            [ 2]  832 	ldw (2,x),y 
      00A0AF 90 5F            [ 1]  833 	clrw y 
      00A0B1 FF               [ 2]  834 	ldw (x),y 
      00A0B2 CD 9E 16         [ 4]  835 	call EESTORE
      00A0B5 1C 00 04         [ 2]  836 	addw x,#2*CELLL  
      00A0B8 81               [ 4]  837 9$: ret 
                                    838 
                                    839 
                                    840 ;------------------------
                                    841 ; Compile word to flash
                                    842 ; EE, (w -- )
                                    843 ;-----------------------
      00A0B9 A0 5F                  844 	.word LINK
                           00203B   845 	LINK=.
      00A0BB 03                     846 	.byte 3
      00A0BC 45 45 2C               847 	.ascii "EE,"
      00A0BF                        848 EE_COMMA:
      00A0BF 1D 00 04         [ 2]  849 	subw x,#2*CELLL 
      00A0C2 90 BE 18         [ 2]  850 	ldw y,UCP
      00A0C5 90 89            [ 2]  851 	pushw y 
      00A0C7 EF 02            [ 2]  852 	ldw (2,x),y 
      00A0C9 90 5F            [ 1]  853 	clrw y 
      00A0CB FF               [ 2]  854 	ldw (x),y
      00A0CC CD 9E 16         [ 4]  855 	call EESTORE
      00A0CF 90 85            [ 2]  856 	popw y 
      00A0D1 72 A9 00 02      [ 2]  857 	addw y,#2
      00A0D5 90 BF 18         [ 2]  858 	ldw UCP,y
      00A0D8 81               [ 4]  859 	ret 
                                    860 
                                    861 
                                    862 ;-------------------------
                                    863 ; Compile byte to flash 
                                    864 ; EEC, ( c -- )	
                                    865 ;-------------------------
      00A0D9 A0 BB                  866 	.word LINK 
                           00205B   867 	LINK=.
      00A0DB 04                     868 	.byte 4 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



      00A0DC 45 45 43 2C            869 	.ascii "EEC,"
      00A0E0                        870 EE_CCOMMA:
      00A0E0 1D 00 04         [ 2]  871 	subw x,#2*CELLL 
      00A0E3 90 BE 18         [ 2]  872 	ldw y,UCP
      00A0E6 90 89            [ 2]  873 	pushw y 
      00A0E8 EF 02            [ 2]  874 	ldw (2,x),y 
      00A0EA 90 5F            [ 1]  875 	clrw y 
      00A0EC FF               [ 2]  876 	ldw (x),y
      00A0ED CD 9D CA         [ 4]  877 	call EECSTORE
      00A0F0 90 85            [ 2]  878 	popw y 
      00A0F2 90 5C            [ 1]  879 	incw y 
      00A0F4 90 BF 18         [ 2]  880 	ldw UCP,y
      00A0F7 81               [ 4]  881 	ret 
                                    882 
                                    883 
                                    884 ;--------------------------
                                    885 ; copy FLASH block to ROWBUF
                                    886 ; ROW>BUF ( ud -- )
                                    887 ;--------------------------
      00A0F8 A0 DB                  888 	.word LINK 
                           00207A   889 	LINK=.
      00A0FA 07                     890 	.byte 7 
      00A0FB 52 4F 57 3E 42 55 46   891 	.ascii "ROW>BUF"
      00A102                        892 ROW2BUF: 
      00A102 CD 9B 8C         [ 4]  893 	call FPSTOR 
      00A105 A6 80            [ 1]  894 	ld a,#BLOCK_SIZE
      00A107 88               [ 1]  895 	push a 
      00A108 B4 34            [ 1]  896 	and a,PTR8 ; block align 
      00A10A B7 34            [ 1]  897 	ld PTR8,a
      00A10C 90 AE 16 80      [ 2]  898 	ldw y,#ROWBUFF 
      00A110 92 BC 00 32      [ 5]  899 1$: ldf a,[FPTR]
      00A114 90 F7            [ 1]  900 	ld (y),a
      00A116 CD 9D 06         [ 4]  901 	call INC_FPTR
      00A119 90 5C            [ 1]  902 	incw y 
      00A11B 0A 01            [ 1]  903 	dec (1,sp)
      00A11D 26 F1            [ 1]  904 	jrne 1$ 
      00A11F 84               [ 1]  905 	pop a 
      00A120 81               [ 4]  906 	ret 
                                    907 
                                    908 
                                    909 ;---------------------------
                                    910 ; copy ROWBUFF to flash 
                                    911 ; BUF>ROW ( ud -- )
                                    912 ; ud is row address as double 
                                    913 ;---------------------------
      00A121 A0 FA                  914 	.word LINK 
                           0020A3   915 	LINK=.
      00A123 07                     916 	.byte 7 
      00A124 42 55 46 3E 52 4F 57   917 	.ascii "BUF>ROW" 
      00A12B                        918 BUF2ROW:
      00A12B CD 87 15         [ 4]  919 	call TBUF ; ( ud rb -- )
      00A12E CD 87 D5         [ 4]  920 	call ROT 
      00A131 CD 87 D5         [ 4]  921 	call ROT  ; ( rb ud -- )
      00A134 CD 9F 04         [ 4]  922 	call write_row 
      00A137 81               [ 4]  923 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



                                    924 
                                    925 ;---------------------------------
                                    926 ; how many byte free in that row 
                                    927 ; RFREE ( a -- n )
                                    928 ; a is least byte of target address
                                    929 ;----------------------------------
      00A138 A1 23                  930 	.word LINK 
                           0020BA   931 	LINK=.
      00A13A 05                     932 	.byte 5 
      00A13B 52 46 52 45 45         933 	.ascii "RFREE"
      00A140                        934 RFREE:
      00A140 E6 01            [ 1]  935 	ld a,(1,x)
      00A142 A4 7F            [ 1]  936 	and a,#BLOCK_SIZE-1 
      00A144 B7 24            [ 1]  937 	ld YTEMP,a 
      00A146 A6 80            [ 1]  938 	ld a,#BLOCK_SIZE 
      00A148 B0 24            [ 1]  939 	sub a,YTEMP 
      00A14A 90 5F            [ 1]  940 	clrw y 
      00A14C 90 97            [ 1]  941 	ld yl,a
      00A14E FF               [ 2]  942 	ldw (x),y 
      00A14F 81               [ 4]  943 	ret 
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
      00A150 A1 3A                  954 	.word LINK 
                           0020D2   955 	LINK=. 
      00A152 06                     956 	.byte 6
      00A153 52 41 4D 3E 45 45      957 	.ascii "RAM>EE"
                                    958 	
      00A159                        959 RAM2EE:
                                    960 ; copy ud on top 
      00A159 90 93            [ 1]  961 	ldw y,x 
      00A15B 90 EE 06         [ 2]  962 	ldw y,(6,y) ; LSW of ud  
      00A15E 90 BF 24         [ 2]  963 	ldw YTEMP,y 
      00A161 90 93            [ 1]  964 	ldw y,x 
      00A163 90 EE 04         [ 2]  965 	ldw y,(4,y)  ; MSW of ud 
      00A166 1D 00 04         [ 2]  966 	subw x,#2*CELLL 
      00A169 FF               [ 2]  967 	ldw (x),y 
      00A16A 90 BE 24         [ 2]  968 	ldw y,YTEMP 
      00A16D EF 02            [ 2]  969 	ldw (2,x),y 
      00A16F CD A1 02         [ 4]  970 	call ROW2BUF 
      00A172 90 93            [ 1]  971 	ldw y,x 
      00A174 90 EE 06         [ 2]  972 	ldw y,(6,y)
      00A177 90 89            [ 2]  973 	pushw y ; udl 
      00A179 90 9F            [ 1]  974 	ld a,yl
      00A17B A4 7F            [ 1]  975 	and a,#BLOCK_SIZE-1 
      00A17D 90 5F            [ 1]  976 	clrw y 
      00A17F 90 97            [ 1]  977 	ld yl,a 
      00A181 72 A9 16 80      [ 2]  978 	addw y,#ROWBUFF 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      00A185 1D 00 02         [ 2]  979 	subw x,#CELLL 
      00A188 FF               [ 2]  980 	ldw (x),y  
      00A189 CD 86 2A         [ 4]  981 	call SWAPP ;  ( ud a ra u -- )
      00A18C CD 85 C4         [ 4]  982 	call RFROM  
      00A18F CD A1 40         [ 4]  983 	call RFREE 
      00A192 CD 89 30         [ 4]  984 	call MIN
      00A195 CD 86 1A         [ 4]  985 	call DUPP 
      00A198 CD 85 E3         [ 4]  986 	call TOR  
      00A19B CD 8C A1         [ 4]  987 	call CMOVE
      00A19E CD A1 2B         [ 4]  988 	call BUF2ROW 
      00A1A1 CD 85 C4         [ 4]  989 	call RFROM 
      00A1A4 81               [ 4]  990 	ret 
                                    991 
                                    992 
                                    993 ;--------------------------
                                    994 ; expand 16 bit address 
                                    995 ; to 32 bit address 
                                    996 ; FADDR ( a -- ud )
                                    997 ;--------------------------
      00A1A5 A1 52                  998 	.word LINK 
                           002127   999 	LINK=. 
      00A1A7 05                    1000 	.byte 5 
      00A1A8 46 41 44 44 52        1001 	.ascii "FADDR"
      00A1AD                       1002 FADDR:
      00A1AD CC 8B 66         [ 2] 1003 	jp ZERO 
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
      00A1B0 A1 A7                 1019 	.word LINK 
                           002132  1020 	LINK=.
      00A1B2 05                    1021 	.byte 5 
      00A1B3 46 4D 4F 56 45        1022 	.ascii "FMOVE" 
      00A1B8                       1023 FMOVE:
      00A1B8 CD 87 27         [ 4] 1024 	call TFLASH 
      00A1BB CD 85 73         [ 4] 1025 	CALL AT 
      00A1BE CD 85 28         [ 4] 1026 	CALL QBRAN 
      00A1C1 A2 3C                 1027 	.word no_move  
      00A1C3 CD 87 76         [ 4] 1028 	call CPP
      00A1C6 CD 85 73         [ 4] 1029 	call AT  
      00A1C9 CD 86 1A         [ 4] 1030 	call DUPP ; ( udl udl -- )
      00A1CC CD 87 5A         [ 4] 1031 	call CNTXT 
      00A1CF CD 85 73         [ 4] 1032 	call AT 
      00A1D2 CD 84 F5         [ 4] 1033 	call DOLIT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



      00A1D5 00 02                 1034 	.word 2 
      00A1D7 CD 88 8E         [ 4] 1035 	call SUBB ; ( udl udl a -- )
      00A1DA CD 86 2A         [ 4] 1036 	call SWAPP 
      00A1DD CD A1 AD         [ 4] 1037 	call FADDR 
      00A1E0 CD 87 D5         [ 4] 1038 	call ROT  ; ( udl ud a -- )
      00A1E3 CD 86 1A         [ 4] 1039 	call DUPP 
      00A1E6 CD 85 E3         [ 4] 1040 	call TOR    ; R: a 
      00A1E9                       1041 FMOVE2: 
      00A1E9 CD 8C 54         [ 4] 1042 	call HERE 
      00A1EC CD 85 D7         [ 4] 1043 	call RAT 
      00A1EF CD 88 8E         [ 4] 1044 	call SUBB ; (udl ud a wl -- )
      00A1F2                       1045 next_row:
      00A1F2 CD 86 1A         [ 4] 1046 	call DUPP 
      00A1F5 CD 85 E3         [ 4] 1047 	call TOR  ; ( udl ud a wl -- ) R: a wl
      00A1F8 CD A1 59         [ 4] 1048 	call RAM2EE ; ( udl a u -- udl u2 ) u2 is byte written to FLASH 
      00A1FB CD 86 1A         [ 4] 1049 	call DUPP 
      00A1FE CD 85 E3         [ 4] 1050 	call TOR
      00A201 CD 88 15         [ 4] 1051 	call PLUS  ; ( udl+ ) 
      00A204 CD 86 1A         [ 4] 1052 	call DUPP 
      00A207 CD 8B 66         [ 4] 1053 	call ZERO   ; ( udl+ ud -- )
      00A20A CD 85 C4         [ 4] 1054 	call RFROM  ; ( udl+ ud u2  R: a wl ) 
      00A20D CD 85 C4         [ 4] 1055 	call RFROM  ; ( udl+ ud u2 wl R: a ) 
      00A210 CD 86 44         [ 4] 1056 	call OVER   ; ( udl+ ud u2 wl u2 -- )
      00A213 CD 88 8E         [ 4] 1057 	call SUBB  ; ( udl+ ud u2 wl- R: a )
      00A216 CD 86 1A         [ 4] 1058 	call DUPP 
      00A219 CD 85 28         [ 4] 1059 	call QBRAN
      00A21C A2 35                 1060 	.word fmove_done 
      00A21E CD 86 2A         [ 4] 1061 	call SWAPP  ; ( udl+ ud wl- u2 R: a )
      00A221 CD 85 C4         [ 4] 1062 	call RFROM ; ( udl+ ud wl- u2 a -- ) 
      00A224 CD 88 15         [ 4] 1063 	call PLUS  ; ( udl+2 ud wl- a+ )
      00A227 CD 86 1A         [ 4] 1064 	call DUPP 
      00A22A CD 85 E3         [ 4] 1065 	call TOR   ; ( udl+2 ud wl- a+ ) R: a+
      00A22D CD 86 2A         [ 4] 1066 	call SWAPP 
      00A230 CD 85 3F         [ 4] 1067 	call BRAN
      00A233 A1 F2                 1068 	.word next_row  
      00A235                       1069 fmove_done:	
      00A235 CD 85 C4         [ 4] 1070 	call RFROM  ; ( -- udl+ ud u2 wl- a  )
      00A238 1C 00 0A         [ 2] 1071 	addw x,#5*CELLL ; (  -- cp+ ) new CP 
      00A23B 81               [ 4] 1072  	ret  
      00A23C                       1073 no_move:
      00A23C CD 8B 66         [ 4] 1074 	call ZERO
      00A23F 81               [ 4] 1075 	ret 
                                   1076 
                                   1077 ;------------------------------------------
                                   1078 ; adjust pointers after **FMOVE** operetion.
                                   1079 ; UPDAT-PTR ( cp+ -- )
                                   1080 ; cp+ is new CP position after FMOVE 
                                   1081 ;-------------------------------------------
      00A240 A1 B2                 1082 	.word LINK 
                           0021C2  1083 	LINK=.
      00A242 09                    1084 	.byte 9
      00A243 55 50 44 41 54 2D 50  1085 	.ascii "UPDAT-PTR" 
             54 52
      00A24C                       1086 UPDATPTR:
                                   1087 ;reset VP to previous position  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



      00A24C CD 9C 06         [ 4] 1088 	call EEPVP 
      00A24F CD 86 10         [ 4] 1089 	call DROP 
      00A252 CD 85 73         [ 4] 1090 	call AT
      00A255 CD 87 68         [ 4] 1091 	call VPP 
      00A258 CD 85 5C         [ 4] 1092 	call STORE
                                   1093 ;update CONTEXT and LAST 
      00A25B CD 9B F0         [ 4] 1094 	call EEPCP 
      00A25E CD 86 10         [ 4] 1095 	call DROP
      00A261 CD 85 73         [ 4] 1096 	call AT
      00A264 CD 84 F5         [ 4] 1097 	call DOLIT 
      00A267 00 02                 1098 	.word 2 
      00A269 CD 88 15         [ 4] 1099 	call PLUS 
      00A26C CD 86 1A         [ 4] 1100 	call DUPP 
      00A26F CD 87 5A         [ 4] 1101 	call CNTXT 
      00A272 CD 85 5C         [ 4] 1102 	call STORE
      00A275 CD 87 86         [ 4] 1103 	call LAST
      00A278 CD 85 5C         [ 4] 1104 	call STORE 
      00A27B CD 9C 20         [ 4] 1105 	call UPDATLAST 
                                   1106 ;update CP 
      00A27E CD 87 76         [ 4] 1107 	call CPP 
      00A281 CD 85 5C         [ 4] 1108 	call STORE
      00A284 CD 9C 49         [ 4] 1109 	call UPDATCP 
      00A287 81               [ 4] 1110 	ret 
                                   1111 
                                   1112 ;-----------------------------
                                   1113 ; move interrupt sub-routine
                                   1114 ; in flash memory
                                   1115 ;----------------------------- 
      00A288 A2 42                 1116 	.word LINK 
                           00220A  1117 	LINK=. 
      00A28A 06                    1118 	.byte 6
      00A28B 49 46 4D 4F 56 45     1119 	.ascii "IFMOVE" 
      00A291                       1120 IFMOVE:
      00A291 CD 87 27         [ 4] 1121 	call TFLASH 
      00A294 CD 85 73         [ 4] 1122 	CALL AT 
      00A297 CD 85 28         [ 4] 1123 	CALL QBRAN 
      00A29A A2 3C                 1124 	.word no_move 
      00A29C CD 87 76         [ 4] 1125 	call CPP 
      00A29F CD 85 73         [ 4] 1126 	call AT 
      00A2A2 CD 86 1A         [ 4] 1127 	call DUPP ; ( udl udl -- )
      00A2A5 CD 9C 06         [ 4] 1128 	call EEPVP 
      00A2A8 CD 86 10         [ 4] 1129 	call DROP
      00A2AB CD 85 73         [ 4] 1130 	call AT  ; ( udl udl a )
      00A2AE CD 85 E3         [ 4] 1131 	call TOR 
      00A2B1 CD A1 AD         [ 4] 1132 	call FADDR
      00A2B4 CD 85 D7         [ 4] 1133 	call RAT ; ( udl ud a -- ) R: a 
      00A2B7 CC A1 E9         [ 2] 1134 	jp FMOVE2 
                                   1135 
                                   1136 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



                           000001  4649 .if WANT_SCALING_CONST 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



                                   4650         .include "const_ratio.asm"
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
      00A2BA A2 8A                   31         .word LINK 
                           00223C    32         LINK=.
      00A2BC 02                      33         .byte 2
      00A2BD 50 49                   34         .ascii "PI" 
      00A2BF                         35 PII:
      00A2BF 1D 00 04         [ 2]   36         subw x,#2*CELLL 
      00A2C2 90 AE 01 63      [ 2]   37         ldw y,#355 
      00A2C6 EF 02            [ 2]   38         ldw (2,x),y 
      00A2C8 90 AE 00 71      [ 2]   39         ldw y,#113 
      00A2CC FF               [ 2]   40         ldw (x),y 
      00A2CD 81               [ 4]   41         ret 
                                     42 
                                     43 ;      SQRT2 ( -- 19601  13860 )
                                     44 ; precision: 1.5e-9 
                                     45 ; usage example to compute Voltage peek to peek from Vrms 
                                     46 ; : VPP SQRT2 */ 2 * ;
                                     47 ;
      00A2CE A2 BC                   48         .word LINK 
                           002250    49         LINK=.
      00A2D0 05                      50         .byte 5 
      00A2D1 53 51 52 54 32          51         .ascii "SQRT2" 
      00A2D6                         52 SQRT2:
      00A2D6 1D 00 04         [ 2]   53         subw x,#2*CELLL 
      00A2D9 90 AE 4C 91      [ 2]   54         ldw y,#19601 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



      00A2DD EF 02            [ 2]   55         ldw (2,x),y 
      00A2DF 90 AE 36 24      [ 2]   56         ldw y,#13860 
      00A2E3 FF               [ 2]   57         ldw (x),y 
      00A2E4 81               [ 4]   58         ret 
                                     59 
                                     60 ;   SQRT3 ( -- 18817 10864 )
                                     61 ; precision: 1.1e-9
                                     62 ;
      00A2E5 A2 D0                   63         .word LINK 
                           002267    64         LINK=.
      00A2E7 05                      65         .byte 5
      00A2E8 53 51 52 54 33          66         .ascii "SQRT3" 
      00A2ED                         67 SQRT3: 
      00A2ED 1D 00 04         [ 2]   68     subw x,#2*CELLL 
      00A2F0 90 AE 49 81      [ 2]   69     ldw y,#18817 
      00A2F4 EF 02            [ 2]   70     ldw (2,x),y 
      00A2F6 90 AE 2A 70      [ 2]   71     ldw y,#10864 
      00A2FA FF               [ 2]   72     ldw (x),y 
      00A2FB 81               [ 4]   73     ret 
                                     74 
                                     75 ;   E ( -- 28667 10546 )
                                     76 ; precision: 5.5e-9 
                                     77 ; natural log base 
      00A2FC A2 E7                   78         .word LINK 
                           00227E    79         LINK=.
      00A2FE 01                      80         .byte 1
      00A2FF 45                      81         .ascii "E" 
      00A300                         82 ENEPER:
      00A300 1D 00 04         [ 2]   83     subw x,#2*CELLL 
      00A303 90 AE 6F FB      [ 2]   84     ldw y,#28667 
      00A307 EF 02            [ 2]   85     ldw (2,x),y 
      00A309 90 AE 29 32      [ 2]   86     ldw y,#10546 
      00A30D FF               [ 2]   87     ldw (x),y 
      00A30E 81               [ 4]   88     ret 
                                     89 
                                     90 ;   SQRT10 ( -- 22936 7253 )
                                     91 ; precision: 5.7e-9 
      00A30F A2 FE                   92         .word LINK 
                           002291    93         LINK=.
      00A311 06                      94         .byte 6 
      00A312 53 51 52 54 31 30       95         .ascii "SQRT10" 
      00A318                         96 SQRT10:
      00A318 1D 00 04         [ 2]   97     subw x,#2*CELLL
      00A31B 90 AE 59 98      [ 2]   98     ldw y,#22936 
      00A31F EF 02            [ 2]   99     ldw (2,x),y 
      00A321 90 AE 1C 55      [ 2]  100     ldw y,#7253
      00A325 FF               [ 2]  101     ldw (x),y 
      00A326 81               [ 4]  102     ret 
                                    103 
                                    104 ;   12RT2 ( -- 26797 25293 )
                                    105 ; precision: 1.0e-9 
                                    106 ; used in music to compute well tempered scale
      00A327 A3 11                  107         .word LINK 
                           0022A9   108         LINK=. 
      00A329 05                     109         .byte 5 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



      00A32A 31 32 52 54 32         110         .ascii "12RT2"
      00A32F                        111 RT12_2:
      00A32F 1D 00 04         [ 2]  112     subw x,#2*CELLL 
      00A332 90 AE 68 AD      [ 2]  113     ldw y,#26797
      00A336 EF 02            [ 2]  114     ldw (2,x),y 
      00A338 90 AE 62 CD      [ 2]  115     ldw y,#25293
      00A33C FF               [ 2]  116     ldw (x),y 
      00A33D 81               [ 4]  117     ret 
                                    118 
                                    119 ;   LOG2s ( -- 2040 11103 )
                                    120 ; log(2)/1.6384
                                    121 ; precision: 1.1e-8
      00A33E A3 29                  122         .word LINK 
                           0022C0   123         LINK=.
      00A340 05                     124         .byte 5 
      00A341 4C 4F 47 32 53         125         .ascii "LOG2S" 
      00A346                        126 LOG2S:
      00A346 1D 00 04         [ 2]  127     subw x,#2*CELLL
      00A349 90 AE 07 F8      [ 2]  128     ldw y,#2040 
      00A34D EF 02            [ 2]  129     ldw (2,x),y 
      00A34F 90 AE 2B 5F      [ 2]  130     ldw y,#11103 
      00A353 FF               [ 2]  131     ldw (x),y 
      00A354 81               [ 4]  132     ret 
                                    133 
                                    134 ;   LN2 ( -- 485 11464 )
                                    135 ; ln(2)/16.384 
                                    136 ; precision: 1.0e-7 
      00A355 A3 40                  137         .word LINK 
                           0022D7   138         LINK=.
      00A357 04                     139         .byte 4 
      00A358 4C 4E 32 53            140         .ascii "LN2S" 
      00A35C                        141 LN2S: 
      00A35C 1D 00 04         [ 2]  142     subw x,#2*CELLL
      00A35F 90 AE 01 E5      [ 2]  143     ldw y,#485
      00A363 EF 02            [ 2]  144     ldw (2,x),y 
      00A365 90 AE 2C C8      [ 2]  145     ldw y,#11464 
      00A369 FF               [ 2]  146     ldw (x),y 
      00A36A 81               [ 4]  147     ret 
                                    148 
                                    149 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



                                   4651 .endif
                           000001  4652 .if WANT_CONST_TABLE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]



                                   4653         .include "ctable.asm"
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
      00A36B A3 57                   32     .word LINK 
                           0022ED    33     LINK=.
      00A36D 06                      34     .byte 6
      00A36E 43 41 4C 4C 4F 54       35     .ascii "CALLOT"
      00A374                         36 CALLOT:
      00A374 CD 87 76         [ 4]   37     CALL CPP
      00A377 CD 86 1A         [ 4]   38     CALL DUPP 
      00A37A CD 85 73         [ 4]   39     CALL AT 
      00A37D CD 85 E3         [ 4]   40     CALL TOR 
      00A380 CD 8B D6         [ 4]   41     CALL PSTOR 
      00A383 CD 9C 49         [ 4]   42     CALL UPDATCP 
      00A386 CD 85 C4         [ 4]   43     CALL RFROM
      00A389 CC 8B 66         [ 2]   44     JP ZERO 
                                     45 
                                     46 ;------------------------------
                                     47 ; create constants bytes table 
                                     48 ; in persistant memory
                                     49 ;  CTABLE ( n+ -- ad ; <string> )
                                     50 ; n+ bytes reserved 
                                     51 ;-----------------------------
      00A38C A3 6D                   52     .word LINK 
                           00230E    53     LINK=.
      00A38E 06                      54     .byte 6
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]



      00A38F 43 54 41 42 4C 45       55     .ascii "CTABLE"
      00A395                         56 CTABLE:
      00A395 CD A3 74         [ 4]   57     CALL CALLOT     
      00A398 CC 99 42         [ 2]   58     JP DCONST 
                                     59      
                                     60 
                                     61 ;--------------------------------
                                     62 ; create constants words table 
                                     63 ; in persistant memory 
                                     64 ; WTABLE ( n+ -- ad ; <string> )
                                     65 ; n+  words reserved  
                                     66 ;--------------------------------
      00A39B A3 8E                   67     .word LINK 
                           00231D    68     LINK=.
      00A39D 06                      69     .byte 6
      00A39E 57 54 41 42 4C 45       70     .ascii "WTABLE"
      00A3A4                         71 WTABLE:
      00A3A4 CD 8A ED         [ 4]   72     CALL CELLS  
      00A3A7 CD A3 74         [ 4]   73     CALL CALLOT 
      00A3AA CC 99 42         [ 2]   74     JP DCONST 
                                     75 
                                     76 ;---------------------------------
                                     77 ; stack an element of CTABLE 
                                     78 ; CTABL@ ( u ad -- c )
                                     79 ; u element order {0..size-1}
                                     80 ; a|ad table address 
                                     81 ;--------------------------------
      00A3AD A3 9D                   82     .word LINK 
                           00232F    83     LINK=.
      00A3AF 06                      84     .byte 6
      00A3B0 43 54 41 42 4C 40       85     .ascii "CTABL@" 
      00A3B6                         86 CTAT:
      00A3B6 CD 9B 8C         [ 4]   87     call FPSTOR 
      00A3B9 CD 9D 1E         [ 4]   88     call PTRPLUS 
      00A3BC CC 9D 5B         [ 2]   89     jp EE_CREAD 
                                     90 
                                     91 ;---------------------------------
                                     92 ; stack an element of WTABLE 
                                     93 ; WTABL@ ( u ud -- w )
                                     94 ; u is element order {0..size-1}
                                     95 ; a|ud table address 
                                     96 ;----------------------------------
      00A3BF A3 AF                   97     .word LINK 
                           002341    98     LINK=.
      00A3C1 06                      99     .byte 6
      00A3C2 57 54 41 42 4C 40      100     .ascii "WTABL@" 
      00A3C8                        101 WTAT:
      00A3C8 CD 9B 8C         [ 4]  102     call FPSTOR 
      00A3CB CD 8A ED         [ 4]  103     call CELLS 
      00A3CE CD 9D 1E         [ 4]  104     call PTRPLUS 
      00A3D1 CD 9D 39         [ 4]  105     call EE_READ 
      00A3D4 81               [ 4]  106     ret 
                                    107 
                                    108 ;--------------------------
                                    109 ; tool to initialize character table 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



                                    110 ; CTINIT ( ad -- )
                                    111 ; ad is table address 
                                    112 ;--------------------------
      00A3D5 A3 C1                  113     .word LINK 
                           002357   114     LINK=.
      00A3D7 06                     115     .byte 6 
      00A3D8 43 54 49 4E 49 54      116     .ascii "CTINIT"
      00A3DE                        117 CTINIT:
      00A3DE CD 9B 8C         [ 4]  118     CALL FPSTOR
      00A3E1 CD 9C CA         [ 4]  119     CALL UNLOCK
      00A3E4 CD 8B 66         [ 4]  120     CALL ZERO 
      00A3E7 CD 8A FA         [ 4]  121 1$: CALL ONEP 
      00A3EA CD 86 1A         [ 4]  122     CALL DUPP 
      00A3ED CD A4 3A         [ 4]  123     CALL INTQ 
      00A3F0 CD 85 28         [ 4]  124     CALL QBRAN 
      00A3F3 A3 FD                  125     .word 2$
      00A3F5 CD 9D 75         [ 4]  126     call WR_BYTE 
      00A3F8 CD 85 3F         [ 4]  127     CALL BRAN 
      00A3FB A3 E7                  128     .word 1$ 
      00A3FD CD 87 F5         [ 4]  129 2$: CALL DDROP 
      00A400 CD 9C F2         [ 4]  130     CALL LOCK 
      00A403 81               [ 4]  131     ret 
                                    132 
                                    133 ;--------------------------
                                    134 ; tool to initialize word table 
                                    135 ; WTINIT ( ad -- )
                                    136 ; ad is table address 
                                    137 ;--------------------------
      00A404 A3 D7                  138     .word LINK 
                           002386   139     LINK=.
      00A406 06                     140     .byte 6 
      00A407 57 54 49 4E 49 54      141     .ascii "WTINIT"
      00A40D                        142 WTINIT:
      00A40D CD 9B 8C         [ 4]  143     CALL FPSTOR
      00A410 CD 9C CA         [ 4]  144     CALL UNLOCK
      00A413 CD 8B 66         [ 4]  145     CALL ZERO 
      00A416 CD 8A FA         [ 4]  146 1$: CALL ONEP 
      00A419 CD 86 1A         [ 4]  147     CALL DUPP
      00A41C CD A4 3A         [ 4]  148     CALL INTQ
      00A41F CD 85 28         [ 4]  149     CALL QBRAN 
      00A422 A4 2C                  150     .word 2$
      00A424 CD 9D 9A         [ 4]  151     call WR_WORD 
      00A427 CD 85 3F         [ 4]  152     CALL BRAN 
      00A42A A4 16                  153     .word 1$ 
      00A42C CD 87 F5         [ 4]  154 2$: CALL DDROP 
      00A42F CD 9C F2         [ 4]  155     CALL LOCK 
      00A432 81               [ 4]  156     ret 
                                    157 
                                    158 ;------------------------
                                    159 ; Prompted input for integer 
                                    160 ; display n+ in bracket and
                                    161 ; '?' 
                                    162 ; [N]? ( n+ -- a )
                                    163 ;------------------------
      00A433 A4 06                  164     .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



                           0023B5   165     LINK=.
      00A435 04                     166     .byte 4
      00A436 5B 4E 5D 3F            167     .ascii "[N]?" 
      00A43A                        168 INTQ:
      00A43A CD 8F CC         [ 4]  169     CALL CR 
      00A43D CD 84 F5         [ 4]  170     call DOLIT 
      00A440 00 5B                  171     .word '[
      00A442 CD 84 B4         [ 4]  172     CALL EMIT 
      00A445 CD 90 67         [ 4]  173     CALL DOT 
      00A448 CD 90 0B         [ 4]  174     CALL  DOTQP
      00A44B 03                     175     .byte 3
      00A44C 5D 3F 20               176     .ascii "]? " 
      00A44F CD 93 B3         [ 4]  177     CALL QUERY 
      00A452 CD 91 DE         [ 4]  178     call TOKEN 
      00A455 CC 8E 79         [ 2]  179     jp NUMBQ
                                    180 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



                                   4654 .endif
                                   4655 
                                   4656 ;===============================================================
                                   4657 
                           0023B5  4658 LASTN =	LINK   ;last name defined
                                   4659 
                                   4660 ; application code begin here
      00A480                       4661 	.bndry 128 ; align on flash block  
      00A480                       4662 app_space: 
                                   4663 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   6 AB1        000831 R   |   6 ABOR1      00136F R
  6 ABOR2      001386 R   |   6 ABORQ      001367 R   |   6 ABORT      001358 R
  6 ABRTQ      001643 R   |   6 ABSS       000828 R   |   6 ACCEP      0012EE R
  6 ACCP1      0012F7 R   |   6 ACCP2      00131D R   |   6 ACCP3      001320 R
  6 ACCP4      001322 R   |     ADC_CR1 =  005401     |     ADC_CR1_=  000000 
    ADC_CR1_=  000001     |     ADC_CR1_=  000004     |     ADC_CR1_=  000005 
    ADC_CR1_=  000006     |     ADC_CR2 =  005402     |     ADC_CR2_=  000003 
    ADC_CR2_=  000004     |     ADC_CR2_=  000005     |     ADC_CR2_=  000006 
    ADC_CR2_=  000001     |     ADC_CR3 =  005403     |     ADC_CR3_=  000007 
    ADC_CR3_=  000006     |     ADC_CSR =  005400     |     ADC_CSR_=  000006 
    ADC_CSR_=  000004     |     ADC_CSR_=  000000     |     ADC_CSR_=  000001 
    ADC_CSR_=  000002     |     ADC_CSR_=  000003     |     ADC_CSR_=  000007 
    ADC_CSR_=  000005     |     ADC_DRH =  005404     |     ADC_DRL =  005405 
    ADC_TDRH=  005406     |     ADC_TDRL=  005407     |   6 ADRADJ     000734 R
    AFR     =  004803     |     AFR0_ADC=  000000     |     AFR1_TIM=  000001 
    AFR2_CCO=  000002     |     AFR3_TIM=  000003     |     AFR4_TIM=  000004 
    AFR5_TIM=  000005     |     AFR6_I2C=  000006     |     AFR7_BEE=  000007 
  6 AFT        00162E R   |   6 AGAIN      001584 R   |   6 AHEAD      0015E1 R
  6 ALLOT      001497 R   |   6 ANDD       0005E6 R   |     APP_CP  =  004004 
    APP_LAST=  004000     |     APP_RUN =  004002     |     APP_VP  =  004006 
  6 AT         0004F3 R   |   6 ATEXE      000C0A R   |   6 AUTORUN    000127 R
    AWU_APR =  0050F1     |     AWU_CSR =  0050F0     |     AWU_TBR =  0050F2 
    B0_MASK =  000001     |     B115200 =  000006     |   6 B115K2     0003DE R
    B19200  =  000003     |   6 B19K2      0003BB R   |     B1_MASK =  000002 
    B230400 =  000007     |     B2400   =  000000     |   6 B2K4       00038C R
    B2_MASK =  000004     |     B38400  =  000004     |     B3_MASK =  000008 
    B460800 =  000008     |     B4800   =  000001     |   6 B4K8       00039A R
    B4_MASK =  000010     |     B57600  =  000005     |   6 B57K6      0003CC R
    B5_MASK =  000020     |     B6_MASK =  000040     |     B7_MASK =  000080 
    B921600 =  000009     |     B9600   =  000002     |   6 B9K6       0003AA R
  6 BACK1      001296 R   |   6 BASE       000657 R   |     BASEE   =  00000A 
  6 BAUD       0003EE R   |     BCNT    =  000001     |   6 BCOMP      0014D9 R
  6 BDIGS      000CF1 R   |     BEEP_BIT=  000004     |     BEEP_CSR=  0050F3 
    BEEP_MAS=  000010     |     BEEP_POR=  00000F     |   6 BEGIN      001566 R
    BIT0    =  000000     |     BIT1    =  000001     |     BIT2    =  000002 
    BIT3    =  000003     |     BIT4    =  000004     |     BIT5    =  000005 
    BIT6    =  000006     |     BIT7    =  000007     |   6 BKSLA      00112E R
  6 BKSP       001266 R   |     BKSPP   =  000008     |   6 BLANK      000AD9 R
    BLOCK_SI=  000080     |     BOOT_ROM=  006000     |     BOOT_ROM=  007FFF 
  6 BRAN       0004BF R   |     BTW     =  000001     |   6 BUF2ROW    0020AB R
  6 BYE        0000B4 R   |     CADR    =  000003     |     CALLL   =  0000CD 
  6 CALLOT     0022F4 R   |     CAN_DGR =  005426     |     CAN_FPSR=  005427 
    CAN_IER =  005425     |     CAN_MCR =  005420     |     CAN_MSR =  005421 
    CAN_P0  =  005428     |     CAN_P1  =  005429     |     CAN_P2  =  00542A 
    CAN_P3  =  00542B     |     CAN_P4  =  00542C     |     CAN_P5  =  00542D 
    CAN_P6  =  00542E     |     CAN_P7  =  00542F     |     CAN_P8  =  005430 
    CAN_P9  =  005431     |     CAN_PA  =  005432     |     CAN_PB  =  005433 
    CAN_PC  =  005434     |     CAN_PD  =  005435     |     CAN_PE  =  005436 
    CAN_PF  =  005437     |     CAN_RFR =  005424     |     CAN_TPR =  005423 
    CAN_TSR =  005422     |     CARRY   =  000028     |   6 CAT        000511 R
  6 CCOMMA     0014BB R   |     CC_C    =  000000     |     CC_H    =  000004 
    CC_I0   =  000003     |     CC_I1   =  000005     |     CC_N    =  000002 
    CC_V    =  000007     |     CC_Z    =  000001     |     CELLL   =  000002 
  6 CELLM      000A5E R   |   6 CELLP      000A4F R   |   6 CELLS      000A6D R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]

Symbol Table

    CFG_GCR =  007F60     |     CFG_GCR_=  000001     |     CFG_GCR_=  000000 
  6 CHAR1      000F1E R   |   6 CHAR2      000F21 R   |   6 CHKIVEC    001F99 R
    CLKOPT  =  004807     |     CLKOPT_C=  000002     |     CLKOPT_E=  000003 
    CLKOPT_P=  000000     |     CLKOPT_P=  000001     |     CLK_CCOR=  0050C9 
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
  6 CMOV1      000C29 R   |   6 CMOV2      000C41 R   |   6 CMOVE      000C21 R
    CNTDWN  =  000030     |   6 CNTXT      0006DA R   |   6 COLD       001A9D R
  6 COLD1      001A9D R   |   6 COLON      0017DC R   |   6 COMMA      0014A4 R
  6 COMPI      0014E9 R   |     COMPO   =  000040     |   6 CONSTANT   001886 R
  6 COUNT      000BBD R   |   6 CPP        0006F6 R   |     CPU_A   =  007F00 
    CPU_CCR =  007F0A     |     CPU_PCE =  007F01     |     CPU_PCH =  007F02 
    CPU_PCL =  007F03     |     CPU_SPH =  007F08     |     CPU_SPL =  007F09 
    CPU_XH  =  007F04     |     CPU_XL  =  007F05     |     CPU_YH  =  007F06 
    CPU_YL  =  007F07     |   6 CR         000F4C R   |   6 CREAT      001822 R
    CRR     =  00000D     |   6 CSTOR      000500 R   |   6 CTABLE     002315 R
  6 CTAT       002336 R   |   6 CTINIT     00235E R   |   6 DAT        000B9D R
    DATSTK  =  001680     |   6 DCONST     0018C2 R   |   6 DDROP      000775 R
  6 DDUP       000780 R   |     DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF 
  6 DECIM      000DA1 R   |   6 DEPTH      000B28 R   |     DEVID_BA=  0048CD 
    DEVID_EN=  0048D8     |     DEVID_LO=  0048D2     |     DEVID_LO=  0048D3 
    DEVID_LO=  0048D4     |     DEVID_LO=  0048D5     |     DEVID_LO=  0048D6 
    DEVID_LO=  0048D7     |     DEVID_LO=  0048D8     |     DEVID_WA=  0048D1 
    DEVID_XH=  0048CE     |     DEVID_XL=  0048CD     |     DEVID_YH=  0048D0 
    DEVID_YL=  0048CF     |   6 DGTQ1      000DE6 R   |   6 DI         0000C2 R
  6 DIG        000D1A R   |   6 DIGIT      000CB5 R   |   6 DIGS       000D2B R
  6 DIGS1      000D2B R   |   6 DIGS2      000D38 R   |   6 DIGTQ      000DB5 R
    DISCOVER=  000000     |     DM_BK1RE=  007F90     |     DM_BK1RH=  007F91 
    DM_BK1RL=  007F92     |     DM_BK2RE=  007F93     |     DM_BK2RH=  007F94 
    DM_BK2RL=  007F95     |     DM_CR1  =  007F96     |     DM_CR2  =  007F97 
    DM_CSR1 =  007F98     |     DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A 
  6 DN1        0007EF R   |   6 DNEGA      0007D2 R   |   6 DOCONST    0018B0 R
  6 DOLIT      000475 R   |   6 DONXT      000489 R   |     DOORBELL=  000000 
  6 DOSTR      000F62 R   |   6 DOT        000FE7 R   |   6 DOT1       000FFD R
  6 DOTI1      001A1E R   |   6 DOTID      001A08 R   |   6 DOTO1      0013FB R
  6 DOTOK      0013E1 R   |   6 DOTPR      001110 R   |   6 DOTQ       00165D R
  6 DOTQP      000F8B R   |   6 DOTR       000F99 R   |   6 DOTS       0019AA R
  6 DOTS1      0019B5 R   |   6 DOTS2      0019BE R   |   6 DOVAR      000647 R
  6 DO_DCONS   0018F1 R   |   6 DROP       000590 R   |   6 DSTOR      000B77 R
  6 DUMP       001960 R   |   6 DUMP1      001977 R   |   6 DUMP3      001999 R
  6 DUMPP      00192F R   |   6 DUPP       00059A R   |   6 EDIGS      000D56 R
  6 EECSTORE   001D4A R   |   6 EEPCP      001B70 R   |   6 EEPLAST    001B43 R
  6 EEPROM     001B2B R   |     EEPROM_B=  004000     |     EEPROM_E=  0047FF 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]

Symbol Table

    EEPROM_R=  000010     |     EEPROM_S=  000800     |   6 EEPRUN     001B5A R
  6 EEPVP      001B86 R   |   6 EESTORE    001D96 R   |   6 EE_CCOMM   002060 R
  6 EE_COMMA   00203F R   |   6 EE_CREAD   001CDB R   |   6 EE_READ    001CB9 R
  6 EI         0000BB R   |   6 ELSEE      0015BC R   |   6 EMIT       000434 R
  6 ENEPER     002280 R   |     EOL_CR  =  000001     |     EOL_LF  =  000000 
  6 EQ1        00084C R   |   6 EQUAL      000836 R   |   6 ERASE      000C83 R
    ERR     =  00001B     |   6 EVAL       001424 R   |   6 EVAL1      001424 R
  6 EVAL2      001440 R   |   6 EXE1       000C18 R   |   6 EXECU      0004CF R
    EXT     =  000000     |     EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1 
  6 EXTRC      000CDD R   |   6 FADDR      00212D R   |   6 FARAT      001BF1 R
  6 FARCAT     001BFD R   |   6 FC_XOFF    000461 R   |   6 FC_XON     00044B R
    FHSE    =  7A1200     |     FHSI    =  F42400     |   6 FILL       000C50 R
  6 FILL1      000C6D R   |   6 FILL2      000C76 R   |   6 FIND       0011C2 R
  6 FIND1      0011E0 R   |   6 FIND2      00120E R   |   6 FIND3      00121A R
  6 FIND4      00122E R   |   6 FIND5      00123B R   |   6 FIND6      00121F R
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
    FLSI    =  01F400     |   6 FMOVE      002138 R   |   6 FMOVE2     002169 R
  6 FOR        001539 R   |   6 FORGET     000158 R   |   6 FORGET1    000187 R
  6 FORGET2    00020D R   |   6 FORGET4    000216 R   |   6 FORGET6    0001CF R
  6 FPSTOR     001B0C R   |     FPTR    =  000032     |   6 FREEVAR    000223 R
  6 FREEVAR4   000259 R   |     GPIO_BAS=  005000     |     GPIO_CR1=  000003 
    GPIO_CR2=  000004     |     GPIO_DDR=  000002     |     GPIO_IDR=  000001 
    GPIO_ODR=  000000     |     GPIO_SIZ=  000005     |   6 HERE       000BD4 R
  6 HEX        000D8C R   |   6 HI         001A5A R   |   6 HLD        0006C7 R
  6 HOLD       000D01 R   |     HSECNT  =  004809     |     I2C_CCRH=  00521C 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]

Symbol Table

    I2C_SR2_=  000000     |     I2C_SR2_=  000003     |     I2C_SR2_=  000005 
    I2C_SR3 =  005219     |     I2C_SR3_=  000001     |     I2C_SR3_=  000007 
    I2C_SR3_=  000004     |     I2C_SR3_=  000000     |     I2C_SR3_=  000002 
    I2C_TRIS=  00521D     |     I2C_TRIS=  000005     |     I2C_TRIS=  000005 
    I2C_TRIS=  000005     |     I2C_TRIS=  000011     |     I2C_TRIS=  000011 
    I2C_TRIS=  000011     |     I2C_WRIT=  000000     |   6 ICOLON     0017ED R
  6 IFETCH     001557 R   |   6 IFF        001594 R   |   6 IFMOVE     002211 R
    IMEDD   =  000080     |   6 IMMED      0017FF R   |   6 INCH       000428 R
  6 INC_FPTR   001C86 R   |   6 INITOFS    0017B5 R   |   6 INN        000675 R
    INPUT_DI=  000000     |     INPUT_EI=  000001     |     INPUT_FL=  000000 
    INPUT_PU=  000001     |   6 INTE1      0013C3 R   |   6 INTER      001399 R
  6 INTQ       0023BA R   |     INT_ADC2=  000016     |     INT_AUAR=  000012 
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
    INT_VECT=  00805C     |     INT_VECT=  008058     |   6 INVER      0007AF R
    IPR0    =  000002     |     IPR1    =  000001     |     IPR2    =  000000 
    IPR3    =  000003     |     IPR_MASK=  000003     |     IRET_COD=  000080 
  6 ISEMI      00174A R   |     ITC_SPR1=  007F70     |     ITC_SPR2=  007F71 
    ITC_SPR3=  007F72     |     ITC_SPR4=  007F73     |     ITC_SPR5=  007F74 
    ITC_SPR6=  007F75     |     ITC_SPR7=  007F76     |     ITC_SPR8=  007F77 
    IWDG_KR =  0050E0     |     IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2 
  6 JSRC       00179F R   |   6 KEY        000ECC R   |   6 KTAP       0012B3 R
  6 KTAP1      0012D6 R   |   6 KTAP2      0012D9 R   |   6 LAST       000706 R
  6 LASTN   =  0023B5 R   |   6 LBRAC      0013D0 R   |     LED2_BIT=  000005 
    LED2_MAS=  000020     |     LED2_POR=  00500A     |   6 LESS       000873 R
    LF      =  00000A     |   6 LINK    =  0023B5 R   |   6 LITER      00150B R
  6 LN2S       0022DC R   |   6 LOCK       001C72 R   |   6 LOG2S      0022C6 R
  6 LSHIFT     000A98 R   |   6 LSHIFT1    000AA1 R   |   6 LSHIFT4    000AA9 R
  6 LT1        000889 R   |     MASKK   =  001F7F     |   6 MAX        000893 R
  6 MAX1       0008A6 R   |   6 MIN        0008B0 R   |   6 MIN1       0008C3 R
  6 MMOD1      000951 R   |   6 MMOD2      000965 R   |   6 MMOD3      00097C R
  6 MMSM1      000909 R   |   6 MMSM3      00090B R   |   6 MMSM4      000914 R
  6 MMSMa      00090F R   |   6 MMSMb      00091F R   |   6 MODD       000996 R
  6 MONE       000AFF R   |     MS      =  00002E     |   6 MSEC       0002CE R
  6 MSMOD      000934 R   |   6 MSTA1      000A27 R   |   6 MSTAR      000A04 R
    NAFR    =  004804     |   6 NAMEQ      00125B R   |   6 NAMET      00116C R
    NCLKOPT =  004808     |   6 NEGAT      0007C0 R   |   6 NEX1       000496 R
  6 NEXT       001548 R   |     NFLASH_W=  00480E     |     NHSECNT =  00480A 
    NOPT1   =  004802     |     NOPT2   =  004804     |     NOPT3   =  004806 
    NOPT4   =  004808     |     NOPT5   =  00480A     |     NOPT6   =  00480C 
    NOPT7   =  00480E     |     NOPTBL  =  00487F     |   6 NTIB       000685 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]

Symbol Table

    NUBC    =  004802     |     NUCLEO  =  000001     |   6 NUFQ       000EE2 R
  6 NUFQ1      000EFB R   |   6 NUMBQ      000DF9 R   |   6 NUMQ1      000E2D R
  6 NUMQ2      000E5E R   |   6 NUMQ3      000EA0 R   |   6 NUMQ4      000EA5 R
  6 NUMQ5      000EB4 R   |   6 NUMQ6      000EB7 R   |     NWDGOPT =  004806 
    NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF 
    NWDGOPT_=  FFFFFFFE     |   6 NonHandl   000000 R   |   6 OFFSET     00072B R
    OFS     =  000005     |   6 ONE        000AF1 R   |   6 ONEM       000A87 R
  6 ONEP       000A7A R   |     OPT     =  000002     |     OPT0    =  004800 
    OPT1    =  004801     |     OPT2    =  004803     |     OPT3    =  004805 
    OPT4    =  004807     |     OPT5    =  004809     |     OPT6    =  00480B 
    OPT7    =  00480D     |     OPTBL   =  00487E     |     OPTIMIZE=  000001 
    OPTION_B=  004800     |     OPTION_E=  00487F     |     OPTION_S=  000080 
  6 ORIG       000047 R   |   6 ORR        0005FA R   |   6 OUTPUT     000439 R
    OUTPUT_F=  000001     |     OUTPUT_O=  000000     |     OUTPUT_P=  000001 
    OUTPUT_S=  000000     |   6 OVER       0005C4 R   |   6 OVERT      001718 R
    PA      =  000000     |   6 PACKS      000C94 R   |   6 PAD        000BE5 R
  6 PAREN      00111F R   |   6 PARS       001018 R   |   6 PARS1      001043 R
  6 PARS2      00106E R   |   6 PARS3      001071 R   |   6 PARS4      00107A R
  6 PARS5      00109D R   |   6 PARS6      0010B2 R   |   6 PARS7      0010C1 R
  6 PARS8      0010D0 R   |   6 PARSE      0010E1 R   |   6 PAUSE      0002DE R
    PA_BASE =  005000     |     PA_CR1  =  005003     |     PA_CR2  =  005004 
    PA_DDR  =  005002     |     PA_IDR  =  005001     |     PA_ODR  =  005000 
    PB      =  000005     |     PB_BASE =  005005     |     PB_CR1  =  005008 
    PB_CR2  =  005009     |     PB_DDR  =  005007     |     PB_IDR  =  005006 
    PB_ODR  =  005005     |     PC      =  00000A     |     PC_BASE =  00500A 
    PC_CR1  =  00500D     |     PC_CR2  =  00500E     |     PC_DDR  =  00500C 
    PC_IDR  =  00500B     |     PC_ODR  =  00500A     |     PD      =  00000F 
  6 PDUM1      001942 R   |   6 PDUM2      001953 R   |     PD_BASE =  00500F 
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
    PI      =  000028     |   6 PICK       000B3F R   |   6 PII        00223F R
    PI_BASE =  005028     |     PI_CR1  =  00502B     |     PI_CR2  =  00502C 
    PI_DDR  =  00502A     |     PI_IDR  =  005029     |     PI_ODR  =  005028 
  6 PLUS       000795 R   |   6 PNAM1      0016CD R   |   6 PRESE      00144F R
    PROD1   =  000022     |     PROD2   =  000024     |     PROD3   =  000026 
  6 PROTECTE   0001FF R   |   6 PSTOR      000B56 R   |     PTR16   =  000033 
    PTR8    =  000034     |   6 PTRPLUS    001C9E R   |   6 QBRAN      0004A8 R
  6 QDUP       000744 R   |   6 QDUP1      00074E R   |   6 QKEY       000416 R
  6 QSTAC      001407 R   |   6 QUERY      001333 R   |   6 QUEST      00100A R
  6 QUIT       00146C R   |   6 QUIT1      001474 R   |   6 QUIT2      001477 R
  6 RAM2EE     0020D9 R   |     RAMBASE =  000000     |   6 RAMLAST    000719 R
    RAM_BASE=  000000     |     RAM_END =  0017FF     |     RAM_SIZE=  001800 
  6 RANDOM     00027C R   |   6 RAT        000557 R   |   6 RBRAC      00178C R
  6 REPEA      001611 R   |   6 RFREE      0020C0 R   |   6 RFROM      000544 R
    ROP     =  004800     |   6 ROT        000755 R   |   6 ROW2BUF    002082 R
    ROWBUFF =  001680     |     RP0     =  00002C     |   6 RPAT       000521 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
Hexadecimal [24-Bits]

Symbol Table

    RPP     =  0017FF     |   6 RPSTO      00052E R   |   6 RSHIFT     000AB4 R
  6 RSHIFT1    000ABD R   |   6 RSHIFT4    000AC5 R   |     RST_SR  =  0050B3 
  6 RT12_2     0022AF R   |   6 SAME1      00118A R   |   6 SAME2      0011B3 R
  6 SAMEQ      001182 R   |   6 SCOM1      001702 R   |   6 SCOM2      001705 R
  6 SCOMP      0016E4 R   |   6 SEED       000263 R   |     SEEDX   =  000036 
    SEEDY   =  000038     |   6 SEMIS      001728 R   |   6 SETISP     0000CE R
  6 SET_RAML   00186F R   |     SFR_BASE=  005000     |     SFR_END =  0057FF 
  6 SIGN       000D40 R   |   6 SIGN1      000D50 R   |   6 SLASH      0009A0 R
  6 SLMOD      000984 R   |   6 SNAME      001697 R   |     SP0     =  00002A 
  6 SPACE      000F04 R   |   6 SPACS      000F13 R   |   6 SPAT       00057A R
    SPI_CR1 =  005200     |     SPI_CR2 =  005201     |     SPI_CRCP=  005205 
    SPI_DR  =  005204     |     SPI_ICR =  005202     |     SPI_RXCR=  005206 
    SPI_SR  =  005203     |     SPI_TXCR=  005207     |     SPP     =  001680 
    SPSAVE  =  000001     |   6 SPSTO      000587 R   |   6 SQRT10     002298 R
  6 SQRT2      002256 R   |   6 SQRT3      00226D R   |   6 SSMOD      000A30 R
    SSP     =  000001     |     STACK   =  0017FF     |   6 STAR       0009F9 R
  6 STASL      000A41 R   |   6 STOD       0007F7 R   |   6 STORE      0004DC R
  6 STR        000D6E R   |   6 STRCQ      001519 R   |   6 STRQ       001650 R
  6 STRQP      000F81 R   |   6 SUBB       00080E R   |   6 SWAPP      0005AA R
    SWIM_CSR=  007F80     |   6 TAP        00129D R   |   6 TBOOT      001A91 R
  6 TBUF       000695 R   |     TBUFFBAS=  001680     |   6 TCHAR      000B10 R
  6 TEMP       000666 R   |   6 TEVAL      0006B8 R   |   6 TFLASH     0006A7 R
  6 THENN      0015A9 R   |   6 TIB        000BF6 R   |     TIBB    =  001700 
    TIBBASE =  001700     |     TIC     =  000027     |   6 TICK       001483 R
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal [24-Bits]

Symbol Table

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
    TIM4_PSC=  000003     |     TIM4_PSC=  000000     |     TIM4_PSC=  000001 
    TIM4_PSC=  000002     |     TIM4_SR =  005342     |     TIM4_SR_=  000000 
  6 TIMEOUTQ   00030E R   |   6 TIMER      0002F8 R   |     TIM_CR1_=  000007 
    TIM_CR1_=  000000     |     TIM_CR1_=  000006     |     TIM_CR1_=  000005 
    TIM_CR1_=  000004     |     TIM_CR1_=  000003     |     TIM_CR1_=  000001 
    TIM_CR1_=  000002     |   6 TNAM2      0019D8 R   |   6 TNAM3      0019F6 R
  6 TNAM4      0019FC R   |   6 TNAME      0019D5 R   |   6 TOFLASH    000333 R
  6 TOKEN      00115E R   |   6 TOR        000563 R   |   6 TORAM      000373 R
    TRUEE   =  00FFFF     |   6 TWOSL      000ACC R   |   6 TYPE1      000F33 R
  6 TYPE2      000F3F R   |   6 TYPES      000F2E R   |   6 Timer4Ha   000005 R
    UART1   =  000000     |     UART1_BA=  005230     |     UART1_BR=  005232 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal [24-Bits]

Symbol Table

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
    UCNTXT  =  000014     |     UCP     =  000018     |     UCTIB   =  00000C 
    UD1     =  000001     |     UD2     =  000002     |     UD3     =  000003 
    UD4     =  000004     |   6 UDOT       000FD4 R   |   6 UDOTR      000FB4 R
  6 UEND       000045 R   |     UHLD    =  000012     |     UINN    =  00000A 
    UINTER  =  000010     |     ULAST   =  00001A     |   6 ULES1      00086B R
  6 ULESS      000855 R   |   6 UMMOD      0008EB R   |   6 UMSTA      0009AF R
  6 UNIQ1      00168E R   |   6 UNIQU      00166F R   |   6 UNLKEE     001C0C R
  6 UNLKFL     001C2B R   |   6 UNLOCK     001C4A R   |   6 UNTIL      001571 R
    UOFFSET =  00001C     |   6 UPDATCP    001BC9 R   |   6 UPDATLAS   001BA0 R
  6 UPDATPTR   0021CC R   |   6 UPDATRUN   001BB8 R   |   6 UPDATVP    001BE0 R
  6 UPL1       00063B R   |   6 UPLUS      000624 R   |     UPP     =  000006 
    URLAST  =  000020     |     USR_BTN_=  000004     |     USR_BTN_=  000010 
    USR_BTN_=  005015     |     UTFLASH =  00001E     |     UTIB    =  00000E 
    UTMP    =  000008     |   6 UTYP1      001912 R   |   6 UTYP2      001921 R
  6 UTYPE      00190D R   |     UVP     =  000016     |   6 UZERO      00002B R
  6 VARIA      00183C R   |     VAR_BASE=  000080     |     VAR_TOP =  0017BF 
    VER     =  000003     |   6 VPP        0006E8 R   |     VSIZE   =  000006 
    WANT_CON=  000001     |     WANT_DEB=  000000     |     WANT_SCA=  000001 
    WANT_SEE=  000000     |     WDGOPT  =  004805     |     WDGOPT_I=  000002 
    WDGOPT_L=  000003     |     WDGOPT_W=  000000     |     WDGOPT_W=  000001 
  6 WHILE      0015F7 R   |   6 WITHI      0008D0 R   |   6 WORDD      00114A R
  6 WORDS      001A32 R   |   6 WORS1      001A38 R   |   6 WORS2      001A54 R
  6 WR_BYTE    001CF5 R   |   6 WR_WORD    001D1A R   |   6 WTABLE     002324 R
  6 WTAT       002348 R   |   6 WTINIT     00238D R   |     WWDG_CR =  0050D1 
    WWDG_WR =  0050D2     |     XMEM_SIZ=  017830     |     XOFF    =  000013 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]

Symbol Table

    XON     =  000011     |   6 XORR       00060F R   |     XTEMP   =  000022 
    YTEMP   =  000024     |   6 ZERO       000AE6 R   |   6 ZL1        0005DC R
  6 ZLESS      0005D3 R   |   6 app_spac   002400 R   |   6 baudrate   000379 R
  6 block_er   001DE0 R   |   6 clear_ra   000019 R   |   6 clock_in   000062 R
  6 copy_buf   001E40 R   |   6 copy_buf   001E5F R   |   6 copy_pro   001E5F R
    da      =  000002     |     db      =  000003     |     dc      =  000000 
    dd      =  000001     |   6 erase_fl   001E02 R   |   6 fmove_do   0021B5 R
  6 main       000016 R   |   6 next_row   002172 R   |   6 no_move    0021BC R
  6 pristine   001EE0 R   |   6 proceed_   001E05 R   |   6 reboot     000325 R
  6 reset_ve   001F47 R   |   6 row_eras   001DC0 R   |   6 row_eras   001E19 R
  6 row_eras   001E40 R   |   6 set_opti   001EB4 R   |   6 set_vect   001FE8 R
  6 uart_ini   000074 R   |   6 write_ro   001E84 R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 DATA       size      0   flags    8
   2 DATA0      size      0   flags    8
   3 SSEG       size      0   flags    8
   4 SSEG1      size    100   flags    8
   5 HOME       size     80   flags    0
   6 CODE       size   2400   flags    0

