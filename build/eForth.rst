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
      0080B5 94 2E                  292         .word      INTER   ;'EVAL
      0080B7 00 00                  293         .word      0       ;HLD
      0080B9 A4 4A                  294         .word      LASTN  ;CNTXT pointer
      0080BB 00 80                  295         .word      VAR_BASE   ;variables free space pointer 
      0080BD A4 80                  296         .word      app_space ; FLASH free space pointer 
      0080BF A4 4A                  297         .word      LASTN   ;LAST
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
                                    347 ;	mov UART_BRR2,#0x0b ; must be loaded first
                                    348 ;	mov UART_BRR1,#0x8
                                    349 ;	mov UART_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN));|(1<<UART_CR2_RIEN))
                           000000   350 .else ; DISCOVERY use UART2 
                                    351 	bset CLK_PCKENR1,#CLK_PCKENR1_UART2
                                    352 	; configure tx pin
                                    353 	bset PD_DDR,#UART2_TX_PIN ; tx pin
                                    354 	bset PD_CR1,#UART2_TX_PIN ; push-pull output
                                    355 	bset PD_CR2,#UART2_TX_PIN ; fast output
                                    356 .endif
                                    357 	; baud rate 115200 Fmaster=8Mhz  
      008104 35 0B 52 33      [ 1]  358 	mov UART_BRR2,#0x0b ; must be loaded first
      008108 35 08 52 32      [ 1]  359 	mov UART_BRR1,#0x8
      00810C 35 0C 52 35      [ 1]  360 	mov UART_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN));|(1<<UART_CR2_RIEN))
                                    361 ; initialize timer4, used for millisecond interrupt  
      008110 35 07 53 45      [ 1]  362 	mov TIM4_PSCR,#7 ; prescale 128  
      008114 35 7D 53 46      [ 1]  363 	mov TIM4_ARR,#125 ; set for 1msec.
      008118 35 05 53 40      [ 1]  364 	mov TIM4_CR1,#((1<<TIM4_CR1_CEN)|(1<<TIM4_CR1_URS))
      00811C 72 10 53 41      [ 1]  365 	bset TIM4_IER,#TIM4_IER_UIE 
                                    366 ; set TIM4 interrupt priority to highest
      008120 A6 3F            [ 1]  367         ld a,#~(IPR_MASK<<6)
      008122 C4 7F 75         [ 1]  368         and a,ITC_SPR6
      008125 AA C0            [ 1]  369         or a,#(IPR3<<6)
      008127 C7 7F 75         [ 1]  370         ld ITC_SPR6,a 
      00812A 9A               [ 1]  371         rim
      00812B CC 9B 32         [ 2]  372         jp  COLD   ;default=MN1
                                    373 
                                    374 
                                    375 ;; place MCU in sleep mode with
                                    376 ;; halt opcode 
                                    377 ;; BYE ( -- )
      00812E 00 00                  378         .word 0
                           0000B0   379         LINK=.
      008130 03                     380         .byte 3 
      008131 42 59 45               381         .ascii "BYE"
      008134                        382 BYE: 
      008134 8E               [10]  383         halt 
      008135 81               [ 4]  384         ret 
                                    385 
                                    386 ; Enable interrupts 
                                    387 ; EI ( -- )
      008136 81 30                  388         .word LINK 
                           0000B8   389         LINK=.
      008138 02                     390         .byte 2
      008139 45 49                  391         .ascii "EI"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 9.
Hexadecimal [24-Bits]



      00813B                        392 EI:
      00813B 9A               [ 1]  393         rim 
      00813C 81               [ 4]  394         ret 
                                    395 
                                    396 ; Disable interrupts
                                    397 ; DI ( -- )
      00813D 81 38                  398         .word LINK 
                           0000BF   399         LINK=.
      00813F 02                     400         .byte 2 
      008140 44 49                  401         .ascii "DI"
      008142                        402 DI:
      008142 9B               [ 1]  403         sim 
      008143 81               [ 4]  404         ret 
                                    405 
                                    406 ; set interrupt priority level 
                                    407 ; SET-ISP ( n1 n2 -- )
                                    408 ; n1 level {1..3}
                                    409 ; n2 vector {0..29}
      008144 81 3F                  410         .word LINK 
                           0000C6   411         LINK=.
      008146 07                     412         .byte 7 
      008147 53 45 54 2D 49 53 50   413         .ascii "SET-ISP"
      00814E                        414 SETISP:
      00814E 90 93            [ 1]  415         ldw y,x 
      008150 90 FE            [ 2]  416         ldw y,(y)
      008152 A6 04            [ 1]  417         ld a,#4 ; 4 slot per register 
                                    418 ;  quotient select register, remainder select slot in register.        
      008154 90 62            [ 2]  419         div y,a ; register=ITC_SPR1[Y], lshift=2*A 
      008156 A4 03            [ 1]  420         and a,#3 
      008158 48               [ 1]  421         sll a ; 2*SLOT  lshift 
      008159 72 A9 7F 70      [ 2]  422         addw y,#ITC_SPR1 
      00815D FF               [ 2]  423         ldw (x),y  ; ( level reg -- )
      00815E 90 5F            [ 1]  424         clrw y 
      008160 90 97            [ 1]  425         ld yl,a 
      008162 1D 00 02         [ 2]  426         subw x,#CELLL 
      008165 FF               [ 2]  427         ldw (x),y  ; ( level reg lshift -- )
      008166 90 93            [ 1]  428         ldw y,x 
      008168 90 EE 02         [ 2]  429         ldw y,(2,y) 
      00816B 90 F6            [ 1]  430         ld a,(y)   ; reg_value
      00816D 1D 00 02         [ 2]  431         subw x,#CELLL 
      008170 FF               [ 2]  432         ldw (x),y ; ( level reg lshift rval -- )
      008171 CD 86 44         [ 4]  433         call OVER ; ( level reg lshift rval lshift -- )
      008174 CD 84 F5         [ 4]  434         call DOLIT 
      008177 00 03                  435         .word 3
      008179 CD 86 2A         [ 4]  436         call SWAPP  ; ( level reg lshift rval 3 lshift )
      00817C CD 8B 2D         [ 4]  437         call LSHIFT ; creat slot mask 
      00817F CD 88 2F         [ 4]  438         call INVER  ; ( level reg lshift rval mask )
      008182 CD 86 66         [ 4]  439         call ANDD ; ( level reg lshift slot_masked )
      008185 CD 85 E3         [ 4]  440         call TOR  ; ( level reg lshift -- R: slot_masked )
      008188 CD 87 D5         [ 4]  441         call ROT  ; ( reg lshift level )
      00818B CD 86 2A         [ 4]  442         call SWAPP ; ( reg level lshift )
      00818E CD 8B 2D         [ 4]  443         call LSHIFT  ; ( reg slot_level -- )
      008191 CD 85 C4         [ 4]  444         call RFROM ; ( reg slot_level masked_val )
      008194 CD 86 7A         [ 4]  445         call ORR   ; ( reg updated_rval )
      008197 CD 86 2A         [ 4]  446         call SWAPP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



      00819A CD 85 80         [ 4]  447         call CSTOR
                                    448 
                                    449 ; sélectionne l'application 
                                    450 ; qui démarre automatique lors 
                                    451 ; d'un COLD start 
      00819D 81 46                  452         .word LINK 
                           00011F   453         LINK=.
      00819F 07                     454         .byte 7
      0081A0 41 55 54 4F 52 55 4E   455         .ascii "AUTORUN"
      0081A7                        456 AUTORUN:
      0081A7 CD 91 F3         [ 4]  457         call TOKEN 
      0081AA CD 86 1A         [ 4]  458         call DUPP 
      0081AD CD 85 28         [ 4]  459         call QBRAN 
      0081B0 82 8D                  460         .word FORGET2
      0081B2 CD 92 F0         [ 4]  461         call NAMEQ
      0081B5 CD 87 C4         [ 4]  462         call QDUP 
      0081B8 CD 85 28         [ 4]  463         call QBRAN 
      0081BB 82 8D                  464         .word FORGET2
      0081BD CD 86 10         [ 4]  465         call DROP 
      0081C0 1D 00 04         [ 2]  466         subw x,#2*CELLL 
      0081C3 90 5F            [ 1]  467         clrw y 
      0081C5 FF               [ 2]  468         ldw (x),y 
      0081C6 90 AE 40 02      [ 2]  469         ldw y,#APP_RUN 
      0081CA EF 02            [ 2]  470         ldw (2,x),y 
      0081CC CC 9E 2B         [ 2]  471         jp EESTORE 
                                    472 
                                    473 ;; Reset dictionary pointer before 
                                    474 ;; forgotten word. RAM space and 
                                    475 ;; interrupt vector defined after 
                                    476 ;; must be resetted also.
      0081CF 81 9F                  477         .word LINK 
                           000151   478         LINK=.
      0081D1 06                     479         .byte 6
      0081D2 46 4F 52 47 45 54      480         .ascii "FORGET" 
      0081D8                        481 FORGET: 
      0081D8 CD 91 F3         [ 4]  482         call TOKEN
      0081DB CD 86 1A         [ 4]  483         call DUPP 
      0081DE CD 85 28         [ 4]  484         call QBRAN 
      0081E1 82 8D                  485         .word FORGET2
      0081E3 CD 92 F0         [ 4]  486         call NAMEQ ; ( a -- ca na | a F )
      0081E6 CD 87 C4         [ 4]  487         call QDUP 
      0081E9 CD 85 28         [ 4]  488         call QBRAN 
      0081EC 82 8D                  489         .word FORGET2
                                    490 ; only forget users words 
      0081EE CD 86 1A         [ 4]  491         call DUPP ; ( ca na na )
      0081F1 CD 84 F5         [ 4]  492         call DOLIT 
      0081F4 A4 80                  493         .word app_space 
      0081F6 CD 86 2A         [ 4]  494         call SWAPP 
      0081F9 CD 88 D5         [ 4]  495         call  ULESS 
      0081FC CD 85 28         [ 4]  496         call QBRAN 
      0081FF 82 4F                  497         .word FORGET6 
                                    498 ; ( ca na -- )        
                                    499 ;reset ivec with address >= ca
      008201 CD 86 2A         [ 4]  500         call SWAPP ; ( na ca -- ) 
      008204 CD A0 2E         [ 4]  501         call CHKIVEC ; ( na -- ) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



                                    502 ; start at LAST and link back to na 
                                    503 ; if variable found reset VP at that point.
      008207                        504 FORGET1:
      008207 CD 87 86         [ 4]  505         call LAST 
      00820A CD 85 73         [ 4]  506         call AT 
      00820D CD 86 1A         [ 4]  507         call DUPP  ; ( -- na last last )
      008210 CD 82 A3         [ 4]  508         call FREEVAR ; ( -- na last )
      008213 CD 86 1A         [ 4]  509         call DUPP 
      008216 CD 84 F5         [ 4]  510         call DOLIT 
      008219 00 02                  511         .word 2 
      00821B CD 88 8E         [ 4]  512         call SUBB ; ( na last -- na last lfa ) link address 
      00821E CD 85 73         [ 4]  513         call AT 
      008221 CD 86 1A         [ 4]  514         call DUPP ; ( -- na last a a )
      008224 CD 87 5A         [ 4]  515         call CNTXT 
      008227 CD 85 5C         [ 4]  516         call STORE
      00822A CD 87 86         [ 4]  517         call LAST  
      00822D CD 85 5C         [ 4]  518         call STORE ; ( --  na last )
      008230 CD 86 44         [ 4]  519         call OVER 
      008233 CD 88 B6         [ 4]  520         call EQUAL ; ( na last na -- na T|F ) 
      008236 CD 85 28         [ 4]  521         call QBRAN 
      008239 82 07                  522         .word FORGET1 
                                    523 ; ( na -- )
      00823B CD 84 F5         [ 4]  524         call DOLIT 
      00823E 00 02                  525         .word 2 
      008240 CD 88 8E         [ 4]  526         call SUBB 
      008243 CD 87 76         [ 4]  527         call CPP 
      008246 CD 85 5C         [ 4]  528         call STORE  
      008249 CD 9C 5E         [ 4]  529         call UPDATCP 
      00824C CC 9C 35         [ 2]  530         jp UPDATLAST 
      00824F                        531 FORGET6: ; tried to forget a RAM or system word 
                                    532 ; ( ca na -- )
      00824F 1D 00 02         [ 2]  533         subw x,#CELLL 
      008252 90 BE 2A         [ 2]  534         ldw y,SP0 
      008255 FF               [ 2]  535         ldw (x),y  
      008256 CD 88 D5         [ 4]  536         call ULESS
      008259 CD 85 28         [ 4]  537         call QBRAN 
      00825C 82 7F                  538         .word PROTECTED 
      00825E CD 93 FC         [ 4]  539         call ABORQ 
      008261 1D                     540         .byte 29
      008262 20 46 6F 72 20 52 41   541         .ascii " For RAM definition do REBOOT"
             4D 20 64 65 66 69 6E
             69 74 69 6F 6E 20 64
             6F 20 52 45 42 4F 4F
             54
      00827F                        542 PROTECTED:
      00827F CD 93 FC         [ 4]  543         call ABORQ
      008282 0A                     544         .byte 10
      008283 20 50 72 6F 74 65 63   545         .ascii " Protected"
             74 65 64
      00828D                        546 FORGET2: ; no name or not found in dictionary 
      00828D CD 93 FC         [ 4]  547         call ABORQ
      008290 05                     548         .byte 5
      008291 20 77 68 61 74         549         .ascii " what"
      008296                        550 FORGET4:
      008296 CC 86 10         [ 2]  551         jp DROP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]



                                    552 
                                    553 
                                    554 ;---------------------------------
                                    555 ; if na is variable 
                                    556 ; free variable data  
                                    557 ; FREEVAR ( na -- )
                                    558 ;---------------------------------
      008299 81 D1                  559         .word LINK 
                           00021B   560         LINK=.
      00829B 07                     561         .byte 7 
      00829C 46 52 45 45 56 41 52   562         .ascii "FREEVAR"
      0082A3                        563 FREEVAR:
      0082A3 CD 86 1A         [ 4]  564         call DUPP ; ( na na -- )
      0082A6 CD 85 91         [ 4]  565         CALL CAT  ; ( na c -- )
      0082A9 CD 8B 0F         [ 4]  566         call ONEP ;
      0082AC CD 88 15         [ 4]  567         CALL PLUS ; ( na c+1 -- ca ) 
      0082AF CD 8B 0F         [ 4]  568         call ONEP ; ( ca+ -- ) to get routne address 
      0082B2 CD 86 1A         [ 4]  569         call DUPP ; ( ca+ ca+ -- )
      0082B5 CD 85 73         [ 4]  570         CALL AT   ; ( ca+ fnaddr -- ) ; fnaddr is routine address 
      0082B8 CD 84 F5         [ 4]  571         call DOLIT 
      0082BB 86 C7                  572         .word DOVAR ; if routine address is DOVAR then variable 
      0082BD CD 88 B6         [ 4]  573         call EQUAL  ; ( ca+ fnaddr DOVAR -- ca+ T|F ) 
      0082C0 CD 85 28         [ 4]  574         call QBRAN 
      0082C3 82 D9                  575         .word FREEVAR4 
      0082C5 CD 84 F5         [ 4]  576         call DOLIT 
      0082C8 00 02                  577         .word 2 
      0082CA CD 88 15         [ 4]  578         call PLUS  ; ( ca+ 2 -- da ) da is data address 
      0082CD CD 85 73         [ 4]  579         call AT 
      0082D0 CD 87 68         [ 4]  580         call VPP   
      0082D3 CD 85 5C         [ 4]  581         call STORE 
      0082D6 CC 9C 75         [ 2]  582         jp UPDATVP 
      0082D9                        583 FREEVAR4: ; not variable
      0082D9 CC 86 10         [ 2]  584         jp  DROP 
                                    585 
                                    586 ;    SEED ( n -- )
                                    587 ; Initialize PRNG seed with n 
      0082DC 82 9B                  588         .word LINK 
                           00025E   589         LINK=. 
      0082DE 04                     590         .byte 4 
      0082DF 53 45 45 44            591         .ascii "SEED" 
      0082E3                        592 SEED:
      0082E3 90 93            [ 1]  593         ldw y,x 
      0082E5 1C 00 02         [ 2]  594         addw x,#CELLL
      0082E8 90 FE            [ 2]  595         ldw y,(y)
      0082EA 90 9E            [ 1]  596         ld a,yh 
      0082EC B7 36            [ 1]  597         ld SEEDX,a 
      0082EE 90 9F            [ 1]  598         ld a,yl 
      0082F0 B7 38            [ 1]  599         ld SEEDY,a 
      0082F2 81               [ 4]  600         ret 
                                    601 
                                    602 ;    RANDOM ( u1 -- u2 )
                                    603 ; Pseudo random number betwen 0 and u1-1
      0082F3 82 DE                  604         .word LINK 
                           000275   605         LINK=.
      0082F5 06                     606         .byte 6
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 13.
Hexadecimal [24-Bits]



      0082F6 52 41 4E 44 4F 4D      607         .ascii "RANDOM" 
      0082FC                        608 RANDOM:
                                    609 ;local variable 
                           000001   610         SPSAVE=1
                           000002   611         VSIZE=2 
      0082FC 52 02            [ 2]  612         sub sp,#VSIZE
      0082FE 1F 01            [ 2]  613         ldw (SPSAVE,sp),x  
                                    614 ; XTEMP=(SEEDX<<5)^SEEDX 
      008300 90 93            [ 1]  615         ldw y,x 
      008302 90 FE            [ 2]  616         ldw y,(y)
      008304 90 BF 24         [ 2]  617         ldw YTEMP,y 
      008307 BE 36            [ 2]  618 	ldw x,SEEDX 
      008309 58               [ 2]  619 	sllw x 
      00830A 58               [ 2]  620 	sllw x 
      00830B 58               [ 2]  621 	sllw x 
      00830C 58               [ 2]  622 	sllw x 
      00830D 58               [ 2]  623 	sllw x 
      00830E 9E               [ 1]  624 	ld a,xh 
      00830F B8 36            [ 1]  625 	xor a,SEEDX 
      008311 B7 22            [ 1]  626 	ld XTEMP,a 
      008313 9F               [ 1]  627 	ld a,xl 
      008314 B8 37            [ 1]  628 	xor a,SEEDX+1 
      008316 B7 23            [ 1]  629 	ld XTEMP+1,a 
                                    630 ; SEEDX=SEEDY 
      008318 BE 38            [ 2]  631 	ldw x,SEEDY 
      00831A BF 36            [ 2]  632 	ldw SEEDX,x  
                                    633 ; SEEDY=SEEDY^(SEEDY>>1)
      00831C 54               [ 2]  634 	srlw x 
      00831D 9E               [ 1]  635 	ld a,xh 
      00831E B8 38            [ 1]  636 	xor a,SEEDY 
      008320 B7 38            [ 1]  637 	ld SEEDY,a  
      008322 9F               [ 1]  638 	ld a,xl 
      008323 B8 39            [ 1]  639 	xor a,SEEDY+1 
      008325 B7 39            [ 1]  640 	ld SEEDY+1,a 
                                    641 ; XTEMP>>3 
      008327 BE 22            [ 2]  642 	ldw x,XTEMP 
      008329 54               [ 2]  643 	srlw x 
      00832A 54               [ 2]  644 	srlw x 
      00832B 54               [ 2]  645 	srlw x 
                                    646 ; x=XTEMP^x 
      00832C 9E               [ 1]  647 	ld a,xh 
      00832D B8 22            [ 1]  648 	xor a,XTEMP 
      00832F 95               [ 1]  649 	ld xh,a 
      008330 9F               [ 1]  650 	ld a,xl 
      008331 B8 23            [ 1]  651 	xor a,XTEMP+1  
      008333 97               [ 1]  652 	ld xl,a 
                                    653 ; SEEDY=x^SEEDY 
      008334 B8 39            [ 1]  654 	xor a,SEEDY+1
      008336 97               [ 1]  655 	ld xl,a 
      008337 9E               [ 1]  656 	ld a,xh 
      008338 B8 38            [ 1]  657 	xor a,SEEDY
      00833A 95               [ 1]  658 	ld xh,a 
      00833B BF 38            [ 2]  659 	ldw SEEDY,x 
                                    660 ; return SEEDY modulo YTEMP  
      00833D 90 BE 24         [ 2]  661 	ldw y,YTEMP  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 14.
Hexadecimal [24-Bits]



      008340 65               [ 2]  662 	divw x,y 
      008341 1E 01            [ 2]  663 	ldw x,(SPSAVE,sp)
      008343 FF               [ 2]  664         ldw (x),y 
      008344 5B 02            [ 2]  665         addw sp,#VSIZE 
      008346 81               [ 4]  666 	ret 
                                    667 
                                    668 
                                    669 ;;
                                    670 ;; get millisecond counter 
                                    671 ;; msec ( -- u )
                                    672 ;; Added by Picatout 2020-04-26
      008347 82 F5                  673         .word LINK  
                           0002C9   674         LINK = . 
      008349 04                     675         .byte 4
      00834A 4D 53 45 43            676         .ascii "MSEC"
      00834E                        677 MSEC: 
      00834E 1D 00 02         [ 2]  678         subw x,#CELLL 
      008351 90 BE 2E         [ 2]  679         ldw y,MS 
      008354 FF               [ 2]  680         ldw (x),y 
      008355 81               [ 4]  681         ret 
                                    682 
                                    683 ; suspend execution for u msec 
                                    684 ;  pause ( u -- )
      008356 83 49                  685         .word LINK 
                           0002D8   686         LINK=.
      008358 05                     687         .byte 5 
      008359 50 41 55 53 45         688         .ascii "PAUSE"
      00835E                        689 PAUSE:
      00835E 90 93            [ 1]  690         ldw y,x
      008360 90 FE            [ 2]  691         ldw y,(y)
      008362 72 B9 00 2E      [ 2]  692         addw y,MS 
      008366 8F               [10]  693 1$:     wfi  
      008367 90 B3 2E         [ 2]  694         cpw y,MS  
      00836A 26 FA            [ 1]  695         jrne 1$        
      00836C 1C 00 02         [ 2]  696         addw x,#CELLL 
      00836F 81               [ 4]  697         ret 
                                    698 
                                    699 ; initialize count down timer 
                                    700 ;  TIMER ( u -- )  milliseconds 
      008370 83 58                  701         .word LINK 
                           0002F2   702         LINK=.
      008372 05                     703         .byte 5 
      008373 54 49 4D 45 52         704         .ascii "TIMER" 
      008378                        705 TIMER:
      008378 90 93            [ 1]  706         ldw y,x
      00837A 90 FE            [ 2]  707         ldw y,(y) 
      00837C 90 BF 30         [ 2]  708         ldw CNTDWN,y
      00837F 1C 00 02         [ 2]  709         addw x,#CELLL 
      008382 81               [ 4]  710         ret 
                                    711 
                                    712 ; check for TIMER exiparition 
                                    713 ;  TIMEOUT? ( -- 0|-1 )
      008383 83 72                  714         .word LINK 
                           000305   715         LINK=. 
      008385 08                     716         .byte 8 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 15.
Hexadecimal [24-Bits]



      008386 54 49 4D 45 4F 55 54   717         .ascii "TIMEOUT?"
             3F
      00838E                        718 TIMEOUTQ: 
      00838E 4F               [ 1]  719         clr a
      00838F 1D 00 02         [ 2]  720         subw x,#CELLL 
      008392 90 BE 30         [ 2]  721         ldw y,CNTDWN 
      008395 26 01            [ 1]  722         jrne 1$ 
      008397 43               [ 1]  723         cpl a 
      008398 E7 01            [ 1]  724 1$:     ld (1,x),a 
      00839A F7               [ 1]  725         ld (x),a 
      00839B 81               [ 4]  726         ret         
                                    727 
                                    728 ; reboot MCU 
                                    729 ; REBOOT ( -- )
      00839C 83 85                  730         .word LINK 
                           00031E   731         LINK=. 
      00839E 06                     732         .byte 6 
      00839F 52 45 42 4F 4F 54      733         .ascii "REBOOT"
      0083A5                        734 reboot:
      0083A5 CC 80 80         [ 2]  735         jp NonHandledInterrupt
                                    736 
                                    737 ; compile to flash memory 
                                    738 ; TO-FLASH ( -- )
      0083A8 83 9E                  739         .word LINK 
                           00032A   740         LINK=.
      0083AA 08                     741         .byte 8
      0083AB 54 4F 2D 46 4C 41 53   742         .ascii "TO-FLASH"
             48
      0083B3                        743 TOFLASH:
      0083B3 CD 87 99         [ 4]  744         call RAMLAST 
      0083B6 CD 85 73         [ 4]  745         call AT 
      0083B9 CD 87 C4         [ 4]  746         call QDUP 
      0083BC CD 85 28         [ 4]  747         call QBRAN
      0083BF 83 E2                  748         .word 1$
      0083C1 CD 93 FC         [ 4]  749         call ABORQ 
      0083C4 1D                     750         .byte 29
      0083C5 20 4E 6F 74 20 77 68   751         .ascii " Not while definitions in RAM"   
             69 6C 65 20 64 65 66
             69 6E 69 74 69 6F 6E
             73 20 69 6E 20 52 41
             4D
      0083E2 90 AE FF FF      [ 2]  752 1$:     ldw y,#-1 
      0083E6 90 BF 1E         [ 2]  753         ldw UTFLASH,y
      0083E9 81               [ 4]  754         ret 
                                    755 
                                    756 ; compile to RAM 
                                    757 ; TO-RAM ( -- )
      0083EA 83 AA                  758         .word LINK 
                           00036C   759         LINK=.
      0083EC 06                     760         .byte 6 
      0083ED 54 4F 2D 52 41 4D      761         .ascii "TO-RAM"
      0083F3                        762 TORAM:
      0083F3 90 5F            [ 1]  763         clrw y 
      0083F5 90 BF 1E         [ 2]  764         ldw UTFLASH,y 
      0083F8 81               [ 4]  765         ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 16.
Hexadecimal [24-Bits]



                                    766 
                                    767 ;; BAUD RATE constants table
                                    768 ; values to put in BRR1 & BRR2 
      0083F9                        769 baudrate: 
      0083F9 A0 1B                  770 	.byte 0xa0,0x1b ; 2400
      0083FB D0 05                  771 	.byte 0xd0,0x5  ; 4800 
      0083FD 68 03                  772 	.byte 0x68,0x3  ; 9600
      0083FF 34 01                  773 	.byte 0x34,0x1  ; 19200
      008401 11 06                  774 	.byte 0x11,0x6  ; 57600
      008403 08 0B                  775 	.byte 0x8,0xb   ; 115200
                                    776 
                                    777 ; BAUD RATE CONSTANTS names 
                                    778 ; 2400 baud
      008405 83 EC                  779 	.word LINK
                           000387   780 LINK	= .
      008407 04                     781 	.byte 4
      008408 42 32 4B 34            782 	.ascii "B2K4" 
      00840C                        783 B2K4:
      00840C 1D 00 02         [ 2]  784 	subw x,#CELLL 
      00840F 90 5F            [ 1]  785         clrw y
      008411 FF               [ 2]  786         ldw (x),y
      008412 81               [ 4]  787 	ret
                                    788 ; 4800 baud	
      008413 84 07                  789 	.word LINK
                           000395   790 LINK	= .
      008415 04                     791 	.byte 4
      008416 42 34 4B 38            792 	.ascii "B4K8" 
      00841A                        793 B4K8:
      00841A 1D 00 02         [ 2]  794         subw x,#CELLL 
      00841D 90 AE 00 02      [ 2]  795         ldw y,#2 
      008421 FF               [ 2]  796         ldw (x),y
      008422 81               [ 4]  797         ret 
                                    798 ; 9600 baud
      008423 84 15                  799 	.word LINK
                           0003A5   800 LINK	= .
      008425 04                     801 	.byte 4
      008426 42 39 4B 36            802 	.ascii "B9K6" 
      00842A                        803 B9K6:
      00842A 1D 00 02         [ 2]  804         subw x,#CELLL 
      00842D 90 AE 00 04      [ 2]  805         ldw y,#4 
      008431 FF               [ 2]  806         ldw (x),y 
      008432 81               [ 4]  807         ret 
                                    808 ; 19200 baud
      008433 84 25                  809 	.word LINK
                           0003B5   810 LINK	= .
      008435 05                     811 	.byte 5
      008436 42 31 39 4B 32         812 	.ascii "B19K2" 
      00843B                        813 B19K2:
      00843B 1D 00 02         [ 2]  814         subw x,#CELLL
      00843E 90 AE 00 06      [ 2]  815         ldw y,#6 
      008442 FF               [ 2]  816         ldw (x),y 
      008443 81               [ 4]  817         ret 
                                    818 ; 57600 baud        
      008444 84 35                  819 	.word LINK
                           0003C6   820 LINK	= .
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 17.
Hexadecimal [24-Bits]



      008446 05                     821 	.byte 5
      008447 42 35 37 4B 36         822 	.ascii "B57K6" 
      00844C                        823 B57K6:
      00844C 1D 00 02         [ 2]  824         subw x,#CELLL 
      00844F 90 AE 00 08      [ 2]  825         ldw y,#8 
      008453 FF               [ 2]  826         ldw (x),y 
      008454 81               [ 4]  827         ret 
                                    828 ; 115200 baud 
      008455 84 46                  829 	.word LINK
                           0003D7   830 LINK	= .
      008457 06                     831 	.byte 6
      008458 42 31 31 35 4B 32      832 	.ascii "B115K2" 
      00845E                        833 B115K2:
      00845E 1D 00 02         [ 2]  834 	subw x,#CELLL 
      008461 90 AE 00 0A      [ 2]  835         ldw y,#10 
      008465 FF               [ 2]  836         ldw (x),y 
      008466 81               [ 4]  837         ret 
                                    838 	
                                    839        
                                    840 ;; set UART2 BAUD rate
                                    841 ;	BAUD ( u -- )
      008467 84 57                  842 	.word LINK 
                           0003E9   843 LINK	= .
      008469 04                     844 	.byte 4
      00846A 42 41 55 44            845 	.ascii "BAUD" 
      00846E                        846 BAUD:
      00846E 1D 00 02         [ 2]  847 	subw x,#CELLL
      008471 90 AE 83 F9      [ 2]  848         ldw y,#baudrate 
      008475 FF               [ 2]  849         ldw (x),y 
      008476 CD 88 15         [ 4]  850         call PLUS
      008479 90 93            [ 1]  851         ldw y,x  
      00847B 90 FE            [ 2]  852         ldw y,(y)
      00847D 90 F6            [ 1]  853         ld a,(y)
      00847F 88               [ 1]  854         push a 
      008480 90 5C            [ 1]  855         incw y 
      008482 90 F6            [ 1]  856         ld a,(y)
      008484 C7 52 33         [ 1]  857         ld UART_BRR2,a 
      008487 84               [ 1]  858         pop a
      008488 C7 52 32         [ 1]  859         ld UART_BRR1,a 
      00848B 1C 00 02         [ 2]  860         addw x,#CELLL 
      00848E 81               [ 4]  861         ret 
                                    862 
                                    863 ;; Device dependent I/O
                                    864 ;       ?RX     ( -- c T | F )
                                    865 ;         Return input byte and true, or false.
      00848F 84 69                  866         .word      LINK 
                           000411   867 LINK	= .
      008491 04                     868         .byte      4
      008492 3F 4B 45 59            869         .ascii     "?KEY"
      008496                        870 QKEY:
      008496 90 5F            [ 1]  871         CLRW Y 
      008498 72 0B 52 30 0B   [ 2]  872         BTJF UART_SR,#UART_SR_RXNE,INCH   ;check status
      00849D C6 52 31         [ 1]  873         LD    A,UART_DR   ;get char in A
      0084A0 1D 00 02         [ 2]  874 	SUBW	X,#2
      0084A3 E7 01            [ 1]  875         LD     (1,X),A
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
Hexadecimal [24-Bits]



      0084A5 7F               [ 1]  876 	CLR	(X)
      0084A6 90 53            [ 2]  877         CPLW     Y
      0084A8                        878 INCH:
      0084A8 1D 00 02         [ 2]  879 		SUBW	X,#2
      0084AB FF               [ 2]  880         LDW     (X),Y
      0084AC 81               [ 4]  881         RET
                                    882 
                                    883 ;       TX!     ( c -- )
                                    884 ;       Send character c to  output device.
      0084AD 84 91                  885         .word      LINK
                           00042F   886 LINK	= .
      0084AF 04                     887         .byte      4
      0084B0 45 4D 49 54            888         .ascii     "EMIT"
      0084B4                        889 EMIT:
      0084B4 E6 01            [ 1]  890         LD     A,(1,X)
      0084B6 1C 00 02         [ 2]  891 	ADDW	X,#2
      0084B9 72 0F 52 30 FB   [ 2]  892 OUTPUT: BTJF UART_SR,#UART_SR_TXE,OUTPUT  ;loop until tx empty 
      0084BE C7 52 31         [ 1]  893         LD    UART_DR,A   ;send A
      0084C1 81               [ 4]  894         RET
                                    895 
                                    896 ;       FC-XON  ( -- )
                                    897 ;       send XON character 
      0084C2 84 AF                  898         .word LINK
                           000444   899 LINK    = .
      0084C4 06                     900         .byte 6 
      0084C5 46 43 2D 58 4F 4E      901         .ascii "FC-XON"
      0084CB                        902 FC_XON:
      0084CB 1D 00 02         [ 2]  903         subw x,#CELLL 
      0084CE 7F               [ 1]  904         clr (x)
      0084CF A6 11            [ 1]  905         ld a,#XON 
      0084D1 E7 01            [ 1]  906         ld (1,x),a 
      0084D3 CD 84 B4         [ 4]  907         call EMIT 
      0084D6 81               [ 4]  908         ret 
                                    909 
                                    910 ;       FC-XOFF ( -- )
                                    911 ;       Send XOFF character 
      0084D7 84 C4                  912         .word LINK
                           000459   913 LINK    = .
      0084D9 07                     914         .byte 7
      0084DA 46 43 2D 58 4F 46 46   915         .ascii "FC-XOFF"
      0084E1                        916 FC_XOFF:
      0084E1 1D 00 02         [ 2]  917         subw x,#CELLL 
      0084E4 7F               [ 1]  918         clr (x)
      0084E5 A6 13            [ 1]  919         ld a,#XOFF 
      0084E7 E7 01            [ 1]  920         ld (1,x),a 
      0084E9 CD 84 B4         [ 4]  921         call EMIT 
      0084EC 81               [ 4]  922         ret
                                    923 
                                    924 ;; The kernel
                                    925 
                                    926 ;       doLIT   ( -- w )
                                    927 ;       Push an inline literal.
      0084ED 84 D9                  928         .word      LINK
                           00046F   929 LINK	= 	.
      0084EF 45                     930 	.byte      COMPO+5
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]



      0084F0 44 4F 4C 49 54         931         .ascii     "DOLIT"
      0084F5                        932 DOLIT:
      0084F5 1D 00 02         [ 2]  933 	SUBW X,#2
      0084F8 16 01            [ 2]  934         ldw y,(1,sp)
      0084FA 90 FE            [ 2]  935         ldw y,(y)
      0084FC FF               [ 2]  936         ldw (x),y
      0084FD 90 85            [ 2]  937         popw y 
      0084FF 90 EC 02         [ 2]  938         jp (2,y)
                                    939 
                                    940 ;       next    ( -- )
                                    941 ;       Code for  single index loop.
      008502 84 EF                  942         .word      LINK
                           000484   943 LINK	= 	.
      008504 44                     944 	.byte      COMPO+4
      008505 6E 65 78 74            945         .ascii     "next"
      008509                        946 DONXT:
      008509 16 03            [ 2]  947 	LDW Y,(3,SP)
      00850B 90 5A            [ 2]  948 	DECW Y
      00850D 2A 07            [ 1]  949 	JRPL NEX1 ; jump if N=0
      00850F 90 85            [ 2]  950 	POPW Y
      008511 5B 02            [ 2]  951         addw sp,#2
      008513 90 EC 02         [ 2]  952         JP (2,Y)
      008516                        953 NEX1:
      008516 17 03            [ 2]  954         LDW (3,SP),Y
      008518 90 85            [ 2]  955         POPW Y
      00851A 90 FE            [ 2]  956 	LDW Y,(Y)
      00851C 90 FC            [ 2]  957 	JP (Y)
                                    958 
                                    959 ;       ?branch ( f -- )
                                    960 ;       Branch if flag is zero.
      00851E 85 04                  961         .word      LINK
                           0004A0   962 LINK	= 	.
      008520 47                     963 	.byte      COMPO+7
      008521 3F 42 52 41 4E 43 48   964         .ascii     "?BRANCH"
      008528                        965 QBRAN:	
      008528 90 93            [ 1]  966         LDW Y,X
      00852A 1C 00 02         [ 2]  967 	ADDW X,#2
      00852D 90 FE            [ 2]  968 	LDW Y,(Y)
      00852F 27 0E            [ 1]  969         JREQ     BRAN
      008531 90 85            [ 2]  970 	POPW Y
      008533 90 EC 02         [ 2]  971 	JP (2,Y)
                                    972         
                                    973 ;       branch  ( -- )
                                    974 ;       Branch to an inline address.
      008536 85 20                  975         .word      LINK
                           0004B8   976 LINK	= 	.
      008538 46                     977 	.byte      COMPO+6
      008539 42 52 41 4E 43 48      978         .ascii     "BRANCH"
      00853F                        979 BRAN:
      00853F 90 85            [ 2]  980         POPW Y
      008541 90 FE            [ 2]  981 	LDW Y,(Y)
      008543 90 FC            [ 2]  982         JP     (Y)
                                    983 
                                    984 ;       EXECUTE ( ca -- )
                                    985 ;       Execute  word at ca.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]



      008545 85 38                  986         .word      LINK
                           0004C7   987 LINK	= 	.
      008547 07                     988         .byte       7
      008548 45 58 45 43 55 54 45   989         .ascii     "EXECUTE"
      00854F                        990 EXECU:
      00854F 90 93            [ 1]  991         LDW Y,X
      008551 1C 00 02         [ 2]  992 	ADDW X,#2
      008554 90 FE            [ 2]  993 	LDW  Y,(Y)
      008556 90 FC            [ 2]  994         JP   (Y)
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
      008558 85 47                 1015         .word      LINK
                           0004DA  1016 LINK = .
      00855A 01                    1017         .byte      1
      00855B 21                    1018         .ascii     "!"
      00855C                       1019 STORE:
      00855C 90 93            [ 1] 1020         LDW Y,X
      00855E 90 FE            [ 2] 1021         LDW Y,(Y)    ;Y=a
      008560 90 BF 24         [ 2] 1022         LDW YTEMP,Y
      008563 90 93            [ 1] 1023         LDW Y,X
      008565 90 EE 02         [ 2] 1024         LDW Y,(2,Y)
      008568 91 CF 24         [ 5] 1025         LDW [YTEMP],Y ;store w at a
      00856B 1C 00 04         [ 2] 1026         ADDW X,#4 ; DDROP 
      00856E 81               [ 4] 1027         RET     
                                   1028 
                                   1029 ;       @       ( a -- w )
                                   1030 ;       Push memory location to stack.
      00856F 85 5A                 1031         .word      LINK
                           0004F1  1032 LINK	= 	.
      008571 01                    1033         .byte    1
      008572 40                    1034         .ascii	"@"
      008573                       1035 AT:
      008573 90 93            [ 1] 1036         LDW Y,X     ;Y = a
      008575 90 FE            [ 2] 1037         LDW Y,(Y)   ; address 
      008577 90 FE            [ 2] 1038         LDW Y,(Y)   ; value 
      008579 FF               [ 2] 1039         LDW (X),Y ;w = @Y
      00857A 81               [ 4] 1040         RET     
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



                                   1041 
                                   1042 ;       C!      ( c b -- )
                                   1043 ;       Pop  data stack to byte memory.
      00857B 85 71                 1044         .word      LINK
                           0004FD  1045 LINK	= .
      00857D 02                    1046         .byte      2
      00857E 43 21                 1047         .ascii     "C!"
      008580                       1048 CSTOR:
      008580 90 93            [ 1] 1049         LDW Y,X
      008582 90 FE            [ 2] 1050 	LDW Y,(Y)    ;Y=b
      008584 E6 03            [ 1] 1051         LD A,(3,X)    ;D = c
      008586 90 F7            [ 1] 1052         LD  (Y),A     ;store c at b
      008588 1C 00 04         [ 2] 1053 	ADDW X,#4 ; DDROP 
      00858B 81               [ 4] 1054         RET     
                                   1055 
                                   1056 ;       C@      ( b -- c )
                                   1057 ;       Push byte in memory to  stack.
      00858C 85 7D                 1058         .word      LINK
                           00050E  1059 LINK	= 	.
      00858E 02                    1060         .byte      2
      00858F 43 40                 1061         .ascii     "C@"
      008591                       1062 CAT:
      008591 90 93            [ 1] 1063         LDW Y,X     ;Y=b
      008593 90 FE            [ 2] 1064         LDW Y,(Y)
      008595 90 F6            [ 1] 1065         LD A,(Y)
      008597 E7 01            [ 1] 1066         LD (1,X),A
      008599 7F               [ 1] 1067         CLR (X)
      00859A 81               [ 4] 1068         RET     
                                   1069 
                                   1070 ;       RP@     ( -- a )
                                   1071 ;       Push current RP to data stack.
      00859B 85 8E                 1072         .word      LINK
                           00051D  1073 LINK	= .
      00859D 03                    1074         .byte      3
      00859E 52 50 40              1075         .ascii     "RP@"
      0085A1                       1076 RPAT:
      0085A1 90 96            [ 1] 1077         LDW Y,SP    ;save return addr
      0085A3 1D 00 02         [ 2] 1078         SUBW X,#2
      0085A6 FF               [ 2] 1079         LDW (X),Y
      0085A7 81               [ 4] 1080         RET     
                                   1081 
                                   1082 ;       RP!     ( a -- )
                                   1083 ;       Set  return stack pointer.
      0085A8 85 9D                 1084         .word      LINK
                           00052A  1085 LINK	= 	. 
      0085AA 43                    1086 	.byte      COMPO+3
      0085AB 52 50 21              1087         .ascii     "RP!"
      0085AE                       1088 RPSTO:
      0085AE 90 85            [ 2] 1089         POPW Y
      0085B0 90 BF 24         [ 2] 1090         LDW YTEMP,Y
      0085B3 90 93            [ 1] 1091         LDW Y,X
      0085B5 90 FE            [ 2] 1092         LDW Y,(Y)
      0085B7 90 94            [ 1] 1093         LDW SP,Y
      0085B9 1C 00 02         [ 2] 1094         ADDW x,#CELLL ; a was not dropped, Picatout 2020-05-24
      0085BC 92 CC 24         [ 5] 1095         JP [YTEMP]
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]



                                   1096 
                                   1097 ;       R>      ( -- w )
                                   1098 ;       Pop return stack to data stack.
      0085BF 85 AA                 1099         .word      LINK
                           000541  1100 LINK	= 	. 
      0085C1 42                    1101 	.byte      COMPO+2
      0085C2 52 3E                 1102         .ascii     "R>"
      0085C4                       1103 RFROM:
      0085C4 90 85            [ 2] 1104         POPW Y    ;save return addr
      0085C6 90 BF 24         [ 2] 1105         LDW YTEMP,Y
      0085C9 90 85            [ 2] 1106         POPW Y
      0085CB 1D 00 02         [ 2] 1107         SUBW X,#2
      0085CE FF               [ 2] 1108         LDW (X),Y
      0085CF 92 CC 24         [ 5] 1109         JP [YTEMP]
                                   1110 
                                   1111 ;       R@      ( -- w )
                                   1112 ;       Copy top of return stack to stack.
      0085D2 85 C1                 1113         .word      LINK
                           000554  1114 LINK	= 	. 
      0085D4 02                    1115         .byte      2
      0085D5 52 40                 1116         .ascii     "R@"
      0085D7                       1117 RAT:
      0085D7 16 03            [ 2] 1118         ldw y,(3,sp)
      0085D9 1D 00 02         [ 2] 1119         subw x,#CELLL 
      0085DC FF               [ 2] 1120         ldw (x),y 
      0085DD 81               [ 4] 1121         ret 
                                   1122 
                                   1123 ;       >R      ( w -- )
                                   1124 ;       Push data stack to return stack.
      0085DE 85 D4                 1125         .word      LINK
                           000560  1126 LINK	= 	. 
      0085E0 42                    1127 	.byte      COMPO+2
      0085E1 3E 52                 1128         .ascii     ">R"
      0085E3                       1129 TOR:
      0085E3 90 85            [ 2] 1130         POPW Y    ;save return addr
      0085E5 90 BF 24         [ 2] 1131         LDW YTEMP,Y
      0085E8 90 93            [ 1] 1132         LDW Y,X
      0085EA 90 FE            [ 2] 1133         LDW Y,(Y)
      0085EC 90 89            [ 2] 1134         PUSHW Y    ;restore return addr
      0085EE 1C 00 02         [ 2] 1135         ADDW X,#2
      0085F1 92 CC 24         [ 5] 1136         JP [YTEMP]
                                   1137 
                                   1138 ;       SP@     ( -- a )
                                   1139 ;       Push current stack pointer.
      0085F4 85 E0                 1140         .word      LINK
                           000576  1141 LINK	= 	. 
      0085F6 03                    1142         .byte      3
      0085F7 53 50 40              1143         .ascii     "SP@"
      0085FA                       1144 SPAT:
      0085FA 90 93            [ 1] 1145 	LDW Y,X
      0085FC 1D 00 02         [ 2] 1146         SUBW X,#2
      0085FF FF               [ 2] 1147 	LDW (X),Y
      008600 81               [ 4] 1148         RET     
                                   1149 
                                   1150 ;       SP!     ( a -- )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



                                   1151 ;       Set  data stack pointer.
      008601 85 F6                 1152         .word      LINK
                           000583  1153 LINK	= 	. 
      008603 03                    1154         .byte      3
      008604 53 50 21              1155         .ascii     "SP!"
      008607                       1156 SPSTO:
      008607 FE               [ 2] 1157         LDW     X,(X)     ;X = a
      008608 81               [ 4] 1158         RET     
                                   1159 
                                   1160 ;       DROP    ( w -- )
                                   1161 ;       Discard top stack item.
      008609 86 03                 1162         .word      LINK
                           00058B  1163 LINK	= 	. 
      00860B 04                    1164         .byte      4
      00860C 44 52 4F 50           1165         .ascii     "DROP"
      008610                       1166 DROP:
      008610 1C 00 02         [ 2] 1167         ADDW X,#2     
      008613 81               [ 4] 1168         RET     
                                   1169 
                                   1170 ;       DUP     ( w -- w w )
                                   1171 ;       Duplicate  top stack item.
      008614 86 0B                 1172         .word      LINK
                           000596  1173 LINK	= 	. 
      008616 03                    1174         .byte      3
      008617 44 55 50              1175         .ascii     "DUP"
      00861A                       1176 DUPP:
      00861A 90 93            [ 1] 1177 	LDW Y,X
      00861C 1D 00 02         [ 2] 1178         SUBW X,#2
      00861F 90 FE            [ 2] 1179 	LDW Y,(Y)
      008621 FF               [ 2] 1180 	LDW (X),Y
      008622 81               [ 4] 1181         RET     
                                   1182 
                                   1183 ;       SWAP    ( w1 w2 -- w2 w1 )
                                   1184 ;       Exchange top two stack items.
      008623 86 16                 1185         .word      LINK
                           0005A5  1186 LINK	= 	. 
      008625 04                    1187         .byte      4
      008626 53 57 41 50           1188         .ascii     "SWAP"
      00862A                       1189 SWAPP:
      00862A 90 93            [ 1] 1190         LDW Y,X
      00862C 90 FE            [ 2] 1191         LDW Y,(Y)
      00862E 90 BF 24         [ 2] 1192         LDW YTEMP,Y
      008631 90 93            [ 1] 1193         LDW Y,X
      008633 90 EE 02         [ 2] 1194         LDW Y,(2,Y)
      008636 FF               [ 2] 1195         LDW (X),Y
      008637 90 BE 24         [ 2] 1196         LDW Y,YTEMP
      00863A EF 02            [ 2] 1197         LDW (2,X),Y
      00863C 81               [ 4] 1198         RET     
                                   1199 
                                   1200 ;       OVER    ( w1 w2 -- w1 w2 w1 )
                                   1201 ;       Copy second stack item to top.
      00863D 86 25                 1202         .word      LINK
                           0005BF  1203 LINK	= . 
      00863F 04                    1204         .byte      4
      008640 4F 56 45 52           1205         .ascii     "OVER"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]



      008644                       1206 OVER:
      008644 1D 00 02         [ 2] 1207         SUBW X,#2
      008647 90 93            [ 1] 1208         LDW Y,X
      008649 90 EE 04         [ 2] 1209         LDW Y,(4,Y)
      00864C FF               [ 2] 1210         LDW (X),Y
      00864D 81               [ 4] 1211         RET     
                                   1212 
                                   1213 ;       0<      ( n -- t )
                                   1214 ;       Return true if n is negative.
      00864E 86 3F                 1215         .word      LINK
                           0005D0  1216 LINK	= . 
      008650 02                    1217         .byte      2
      008651 30 3C                 1218         .ascii     "0<"
      008653                       1219 ZLESS:
      008653 A6 FF            [ 1] 1220         LD A,#0xFF
      008655 90 93            [ 1] 1221         LDW Y,X
      008657 90 FE            [ 2] 1222         LDW Y,(Y)
      008659 2B 01            [ 1] 1223         JRMI     ZL1
      00865B 4F               [ 1] 1224         CLR A   ;false
      00865C F7               [ 1] 1225 ZL1:    LD     (X),A
      00865D E7 01            [ 1] 1226         LD (1,X),A
      00865F 81               [ 4] 1227 	RET     
                                   1228 
                                   1229 ;       AND     ( w w -- w )
                                   1230 ;       Bitwise AND.
      008660 86 50                 1231         .word      LINK
                           0005E2  1232 LINK	= . 
      008662 03                    1233         .byte      3
      008663 41 4E 44              1234         .ascii     "AND"
      008666                       1235 ANDD:
      008666 F6               [ 1] 1236         LD  A,(X)    ;D=w
      008667 E4 02            [ 1] 1237         AND A,(2,X)
      008669 E7 02            [ 1] 1238         LD (2,X),A
      00866B E6 01            [ 1] 1239         LD A,(1,X)
      00866D E4 03            [ 1] 1240         AND A,(3,X)
      00866F E7 03            [ 1] 1241         LD (3,X),A
      008671 1C 00 02         [ 2] 1242         ADDW X,#2
      008674 81               [ 4] 1243         RET
                                   1244 
                                   1245 ;       OR      ( w w -- w )
                                   1246 ;       Bitwise inclusive OR.
      008675 86 62                 1247         .word      LINK
                           0005F7  1248 LINK = . 
      008677 02                    1249         .byte      2
      008678 4F 52                 1250         .ascii     "OR"
      00867A                       1251 ORR:
      00867A F6               [ 1] 1252         LD A,(X)    ;D=w
      00867B EA 02            [ 1] 1253         OR A,(2,X)
      00867D E7 02            [ 1] 1254         LD (2,X),A
      00867F E6 01            [ 1] 1255         LD A,(1,X)
      008681 EA 03            [ 1] 1256         OR A,(3,X)
      008683 E7 03            [ 1] 1257         LD (3,X),A
      008685 1C 00 02         [ 2] 1258         ADDW X,#2
      008688 81               [ 4] 1259         RET
                                   1260 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



                                   1261 ;       XOR     ( w w -- w )
                                   1262 ;       Bitwise exclusive OR.
      008689 86 77                 1263         .word      LINK
                           00060B  1264 LINK	= . 
      00868B 03                    1265         .byte      3
      00868C 58 4F 52              1266         .ascii     "XOR"
      00868F                       1267 XORR:
      00868F F6               [ 1] 1268         LD A,(X)    ;D=w
      008690 E8 02            [ 1] 1269         XOR A,(2,X)
      008692 E7 02            [ 1] 1270         LD (2,X),A
      008694 E6 01            [ 1] 1271         LD A,(1,X)
      008696 E8 03            [ 1] 1272         XOR A,(3,X)
      008698 E7 03            [ 1] 1273         LD (3,X),A
      00869A 1C 00 02         [ 2] 1274         ADDW X,#2
      00869D 81               [ 4] 1275         RET
                                   1276 
                                   1277 ;       UM+     ( u u -- udsum )
                                   1278 ;       Add two unsigned single
                                   1279 ;       and return a double sum.
      00869E 86 8B                 1280         .word      LINK
                           000620  1281 LINK	= . 
      0086A0 03                    1282         .byte      3
      0086A1 55 4D 2B              1283         .ascii     "UM+"
      0086A4                       1284 UPLUS:
      0086A4 A6 01            [ 1] 1285         LD A,#1
      0086A6 90 93            [ 1] 1286         LDW Y,X
      0086A8 90 EE 02         [ 2] 1287         LDW Y,(2,Y)
      0086AB 90 BF 24         [ 2] 1288         LDW YTEMP,Y
      0086AE 90 93            [ 1] 1289         LDW Y,X
      0086B0 90 FE            [ 2] 1290         LDW Y,(Y)
      0086B2 72 B9 00 24      [ 2] 1291         ADDW Y,YTEMP
      0086B6 EF 02            [ 2] 1292         LDW (2,X),Y
      0086B8 25 01            [ 1] 1293         JRC     UPL1
      0086BA 4F               [ 1] 1294         CLR A
      0086BB E7 01            [ 1] 1295 UPL1:   LD     (1,X),A
      0086BD 7F               [ 1] 1296         CLR (X)
      0086BE 81               [ 4] 1297         RET
                                   1298 
                                   1299 ;; System and user variables
                                   1300 
                                   1301 ;       doVAR   ( -- a )
                                   1302 ;       Code for VARIABLE and CREATE.
      0086BF 86 A0                 1303         .word      LINK
                           000641  1304 LINK	= . 
      0086C1 45                    1305 	.byte      COMPO+5
      0086C2 44 4F 56 41 52        1306         .ascii     "DOVAR"
      0086C7                       1307 DOVAR:
      0086C7 1D 00 02         [ 2] 1308 	SUBW X,#2
      0086CA 90 85            [ 2] 1309         POPW Y    ;get return addr (pfa)
      0086CC 90 FE            [ 2] 1310         LDW Y,(Y) ; indirect address 
      0086CE FF               [ 2] 1311         LDW (X),Y    ;push on stack
      0086CF 81               [ 4] 1312         RET     ;go to RET of EXEC
                                   1313 
                                   1314 ;       BASE    ( -- a )
                                   1315 ;       Radix base for numeric I/O.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



      0086D0 86 C1                 1316         .word      LINK        
                           000652  1317 LINK = . 
      0086D2 04                    1318         .byte      4
      0086D3 42 41 53 45           1319         .ascii     "BASE"
      0086D7                       1320 BASE:
      0086D7 90 AE 00 06      [ 2] 1321 	LDW Y,#UBASE 
      0086DB 1D 00 02         [ 2] 1322 	SUBW X,#2
      0086DE FF               [ 2] 1323         LDW (X),Y
      0086DF 81               [ 4] 1324         RET
                                   1325 
                                   1326 ;       tmp     ( -- a )
                                   1327 ;       A temporary storage.
      0086E0 86 D2                 1328         .word      LINK
                                   1329         
                           000662  1330 LINK = . 
      0086E2 03                    1331 	.byte      3
      0086E3 54 4D 50              1332         .ascii     "TMP"
      0086E6                       1333 TEMP:
      0086E6 90 AE 00 08      [ 2] 1334 	LDW Y,#UTMP
      0086EA 1D 00 02         [ 2] 1335 	SUBW X,#2
      0086ED FF               [ 2] 1336         LDW (X),Y
      0086EE 81               [ 4] 1337         RET
                                   1338 
                                   1339 ;       >IN     ( -- a )
                                   1340 ;        Hold parsing pointer.
      0086EF 86 E2                 1341         .word      LINK
                           000671  1342 LINK = . 
      0086F1 03                    1343         .byte      3
      0086F2 3E 49 4E              1344         .ascii    ">IN"
      0086F5                       1345 INN:
      0086F5 90 AE 00 0A      [ 2] 1346 	LDW Y,#UINN 
      0086F9 1D 00 02         [ 2] 1347 	SUBW X,#2
      0086FC FF               [ 2] 1348         LDW (X),Y
      0086FD 81               [ 4] 1349         RET
                                   1350 
                                   1351 ;       #TIB    ( -- a )
                                   1352 ;       Count in terminal input buffer.
      0086FE 86 F1                 1353         .word      LINK
                           000680  1354 LINK = . 
      008700 04                    1355         .byte      4
      008701 23 54 49 42           1356         .ascii     "#TIB"
      008705                       1357 NTIB:
      008705 90 AE 00 0C      [ 2] 1358 	LDW Y,#UCTIB 
      008709 1D 00 02         [ 2] 1359 	SUBW X,#2
      00870C FF               [ 2] 1360         LDW (X),Y
      00870D 81               [ 4] 1361         RET
                                   1362 
                                   1363 ;       TBUF ( -- a )
                                   1364 ;       address of 128 bytes transaction buffer 
      00870E 87 00                 1365         .word LINK 
                           000690  1366         LINK=.
      008710 04                    1367         .byte 4 
      008711 54 42 55 46           1368         .ascii "TBUF"
      008715                       1369 TBUF:
      008715 90 AE 16 80      [ 2] 1370         ldw y,#ROWBUFF
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal [24-Bits]



      008719 1D 00 02         [ 2] 1371         subw x,#CELLL
      00871C FF               [ 2] 1372         ldw (x),y 
      00871D 81               [ 4] 1373         ret 
                                   1374 
                                   1375 ; systeme variable 
                                   1376 ; compilation destination 
                                   1377 ; TFLASH ( -- A )
      00871E 87 10                 1378         .word LINK 
                           0006A0  1379         LINK=.
      008720 06                    1380         .byte 6 
      008721 54 46 4C 41 53 48     1381         .ascii "TFLASH"         
      008727                       1382 TFLASH:
      008727 1D 00 02         [ 2] 1383         subw x,#CELLL 
      00872A 90 AE 00 1E      [ 2] 1384         ldw y,#UTFLASH
      00872E FF               [ 2] 1385         ldw (x),y 
      00872F 81               [ 4] 1386         ret 
                                   1387 
                                   1388 ;       "EVAL   ( -- a )
                                   1389 ;       Execution vector of EVAL.
      008730 87 20                 1390         .word      LINK
                           0006B2  1391 LINK = . 
      008732 05                    1392         .byte      5
      008733 27 45 56 41 4C        1393         .ascii     "'EVAL"
      008738                       1394 TEVAL:
      008738 90 AE 00 10      [ 2] 1395 	LDW Y,#UINTER 
      00873C 1D 00 02         [ 2] 1396 	SUBW X,#2
      00873F FF               [ 2] 1397         LDW (X),Y
      008740 81               [ 4] 1398         RET
                                   1399 
                                   1400 ;       HLD     ( -- a )
                                   1401 ;       Hold a pointer of output string.
      008741 87 32                 1402         .word      LINK
                           0006C3  1403 LINK = . 
      008743 03                    1404         .byte      3
      008744 48 4C 44              1405         .ascii     "HLD"
      008747                       1406 HLD:
      008747 90 AE 00 12      [ 2] 1407 	LDW Y,#UHLD 
      00874B 1D 00 02         [ 2] 1408 	SUBW X,#2
      00874E FF               [ 2] 1409         LDW (X),Y
      00874F 81               [ 4] 1410         RET
                                   1411 
                                   1412 ;       CONTEXT ( -- a )
                                   1413 ;       Start vocabulary search.
      008750 87 43                 1414         .word      LINK
                           0006D2  1415 LINK = . 
      008752 07                    1416         .byte      7
      008753 43 4F 4E 54 45 58 54  1417         .ascii     "CONTEXT"
      00875A                       1418 CNTXT:
      00875A 90 AE 00 14      [ 2] 1419 	LDW Y,#UCNTXT
      00875E 1D 00 02         [ 2] 1420 	SUBW X,#2
      008761 FF               [ 2] 1421         LDW (X),Y
      008762 81               [ 4] 1422         RET
                                   1423 
                                   1424 ;       VP      ( -- a )
                                   1425 ;       Point to top of variables
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



      008763 87 52                 1426         .word      LINK
                           0006E5  1427 LINK = . 
      008765 02                    1428         .byte      2
      008766 56 50                 1429         .ascii     "VP"
      008768                       1430 VPP:
      008768 90 AE 00 16      [ 2] 1431 	LDW Y,#UVP 
      00876C 1D 00 02         [ 2] 1432 	SUBW X,#2
      00876F FF               [ 2] 1433         LDW (X),Y
      008770 81               [ 4] 1434         RET
                                   1435 
                                   1436 ;       CP    ( -- a )
                                   1437 ;       Pointer to top of FLASH 
      008771 87 65                 1438         .word LINK 
                           0006F3  1439         LINK=.
      008773 02                    1440         .byte 2 
      008774 43 50                 1441         .ascii "CP"
      008776                       1442 CPP: 
      008776 90 AE 00 18      [ 2] 1443         ldw y,#UCP 
      00877A 1D 00 02         [ 2] 1444         subw x,#CELLL 
      00877D FF               [ 2] 1445         ldw (x),y 
      00877E 81               [ 4] 1446         ret                
                                   1447 
                                   1448 ;       LAST    ( -- a )
                                   1449 ;       Point to last name in dictionary.
      00877F 87 73                 1450         .word      LINK
                           000701  1451 LINK = . 
      008781 04                    1452         .byte      4
      008782 4C 41 53 54           1453         .ascii     "LAST"
      008786                       1454 LAST:
      008786 90 AE 00 1A      [ 2] 1455 	LDW Y,#ULAST 
      00878A 1D 00 02         [ 2] 1456 	SUBW X,#2
      00878D FF               [ 2] 1457         LDW (X),Y
      00878E 81               [ 4] 1458         RET
                                   1459 
                                   1460 ; address of system variable URLAST 
                                   1461 ;       RAMLAST ( -- a )
                                   1462 ; RAM dictionary context 
      00878F 87 81                 1463         .word LINK 
                           000711  1464         LINK=. 
      008791 07                    1465         .byte 7  
      008792 52 41 4D 4C 41 53 54  1466         .ascii "RAMLAST" 
      008799                       1467 RAMLAST: 
      008799 90 AE 00 20      [ 2] 1468         ldw y,#URLAST 
      00879D 1D 00 02         [ 2] 1469         subw x,#CELLL 
      0087A0 FF               [ 2] 1470         ldw (x),y 
      0087A1 81               [ 4] 1471         ret 
                                   1472 
                                   1473 ; OFFSET ( -- a )
                                   1474 ; address of system variable OFFSET 
      0087A2 87 91                 1475         .word LINK 
                           000724  1476         LINK=.
      0087A4 06                    1477         .byte 6
      0087A5 4F 46 46 53 45 54     1478         .ascii "OFFSET" 
      0087AB                       1479 OFFSET: 
      0087AB 1D 00 02         [ 2] 1480         subw x,#CELLL
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



      0087AE 90 AE 00 1C      [ 2] 1481         ldw y,#UOFFSET 
      0087B2 FF               [ 2] 1482         ldw (x),y 
      0087B3 81               [ 4] 1483         ret 
                                   1484 
                                   1485 ; adjust jump address adding OFFSET
                                   1486 ; ADR-ADJ ( a -- a+offset )
      0087B4                       1487 ADRADJ: 
      0087B4 CD 87 AB         [ 4] 1488         call OFFSET 
      0087B7 CD 85 73         [ 4] 1489         call AT 
      0087BA CC 88 15         [ 2] 1490         jp PLUS 
                                   1491 
                                   1492 
                                   1493 ;; Common functions
                                   1494 
                                   1495 ;       ?DUP    ( w -- w w | 0 )
                                   1496 ;       Dup tos if its is not zero.
      0087BD 87 A4                 1497         .word      LINK
                           00073F  1498 LINK = . 
      0087BF 04                    1499         .byte      4
      0087C0 3F 44 55 50           1500         .ascii     "?DUP"
      0087C4                       1501 QDUP:
      0087C4 90 93            [ 1] 1502         LDW Y,X
      0087C6 90 FE            [ 2] 1503 	LDW Y,(Y)
      0087C8 27 04            [ 1] 1504         JREQ     QDUP1
      0087CA 1D 00 02         [ 2] 1505 	SUBW X,#2
      0087CD FF               [ 2] 1506         LDW (X),Y
      0087CE 81               [ 4] 1507 QDUP1:  RET
                                   1508 
                                   1509 ;       ROT     ( w1 w2 w3 -- w2 w3 w1 )
                                   1510 ;       Rot 3rd item to top.
      0087CF 87 BF                 1511         .word      LINK
                           000751  1512 LINK = . 
      0087D1 03                    1513         .byte      3
      0087D2 52 4F 54              1514         .ascii     "ROT"
      0087D5                       1515 ROT:
      0087D5 90 93            [ 1] 1516         ldw y,x 
      0087D7 90 FE            [ 2] 1517         ldw y,(y)
      0087D9 90 89            [ 2] 1518         pushw y 
      0087DB 90 93            [ 1] 1519         ldw y,x 
      0087DD 90 EE 04         [ 2] 1520         ldw y,(4,y)
      0087E0 FF               [ 2] 1521         ldw (x),y 
      0087E1 90 93            [ 1] 1522         ldw y,x 
      0087E3 90 EE 02         [ 2] 1523         ldw y,(2,y)
      0087E6 EF 04            [ 2] 1524         ldw (4,x),y 
      0087E8 90 85            [ 2] 1525         popw y 
      0087EA EF 02            [ 2] 1526         ldw (2,x),y
      0087EC 81               [ 4] 1527         ret 
                                   1528 
                                   1529 ;       2DROP   ( w w -- )
                                   1530 ;       Discard two items on stack.
      0087ED 87 D1                 1531         .word      LINK
                           00076F  1532 LINK = . 
      0087EF 05                    1533         .byte      5
      0087F0 32 44 52 4F 50        1534         .ascii     "2DROP"
      0087F5                       1535 DDROP:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



      0087F5 1C 00 04         [ 2] 1536         ADDW X,#4
      0087F8 81               [ 4] 1537         RET
                                   1538 
                                   1539 ;       2DUP    ( w1 w2 -- w1 w2 w1 w2 )
                                   1540 ;       Duplicate top two items.
      0087F9 87 EF                 1541         .word      LINK
                           00077B  1542 LINK = . 
      0087FB 04                    1543         .byte      4
      0087FC 32 44 55 50           1544         .ascii     "2DUP"
      008800                       1545 DDUP:
      008800 1D 00 04         [ 2] 1546         SUBW X,#4
      008803 90 93            [ 1] 1547         LDW Y,X
      008805 90 EE 06         [ 2] 1548         LDW Y,(6,Y)
      008808 EF 02            [ 2] 1549         LDW (2,X),Y
      00880A 90 93            [ 1] 1550         LDW Y,X
      00880C 90 EE 04         [ 2] 1551         LDW Y,(4,Y)
      00880F FF               [ 2] 1552         LDW (X),Y
      008810 81               [ 4] 1553         RET
                                   1554 
                                   1555 ;       +       ( w w -- sum )
                                   1556 ;       Add top two items.
      008811 87 FB                 1557         .word      LINK
                           000793  1558 LINK = . 
      008813 01                    1559         .byte      1
      008814 2B                    1560         .ascii     "+"
      008815                       1561 PLUS:
      008815 90 93            [ 1] 1562         LDW Y,X
      008817 90 FE            [ 2] 1563         LDW Y,(Y)
      008819 90 BF 24         [ 2] 1564         LDW YTEMP,Y
      00881C 1C 00 02         [ 2] 1565         ADDW X,#2
      00881F 90 93            [ 1] 1566         LDW Y,X
      008821 90 FE            [ 2] 1567         LDW Y,(Y)
      008823 72 B9 00 24      [ 2] 1568         ADDW Y,YTEMP
      008827 FF               [ 2] 1569         LDW (X),Y
      008828 81               [ 4] 1570         RET
                                   1571 
                                   1572 ;       NOT     ( w -- w )
                                   1573 ;       One's complement of tos.
      008829 88 13                 1574         .word      LINK
                           0007AB  1575 LINK = . 
      00882B 03                    1576         .byte      3
      00882C 4E 4F 54              1577         .ascii     "NOT"
      00882F                       1578 INVER:
      00882F 90 93            [ 1] 1579         LDW Y,X
      008831 90 FE            [ 2] 1580         LDW Y,(Y)
      008833 90 53            [ 2] 1581         CPLW Y
      008835 FF               [ 2] 1582         LDW (X),Y
      008836 81               [ 4] 1583         RET
                                   1584 
                                   1585 ;       NEGATE  ( n -- -n )
                                   1586 ;       Two's complement of tos.
      008837 88 2B                 1587         .word      LINK
                           0007B9  1588 LINK = . 
      008839 06                    1589         .byte      6
      00883A 4E 45 47 41 54 45     1590         .ascii     "NEGATE"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



      008840                       1591 NEGAT:
      008840 90 93            [ 1] 1592         LDW Y,X
      008842 90 FE            [ 2] 1593         LDW Y,(Y)
      008844 90 50            [ 2] 1594         NEGW Y
      008846 FF               [ 2] 1595         LDW (X),Y
      008847 81               [ 4] 1596         RET
                                   1597 
                                   1598 ;       DNEGATE ( d -- -d )
                                   1599 ;       Two's complement of top double.
      008848 88 39                 1600         .word      LINK
                           0007CA  1601 LINK = . 
      00884A 07                    1602         .byte      7
      00884B 44 4E 45 47 41 54 45  1603         .ascii     "DNEGATE"
      008852                       1604 DNEGA:
      008852 90 93            [ 1] 1605         LDW Y,X
      008854 90 FE            [ 2] 1606 	LDW Y,(Y)
      008856 90 53            [ 2] 1607         CPLW Y     
      008858 90 BF 24         [ 2] 1608 	LDW YTEMP,Y
      00885B 90 93            [ 1] 1609         LDW Y,X
      00885D 90 EE 02         [ 2] 1610         LDW Y,(2,Y)
      008860 90 53            [ 2] 1611         CPLW Y
      008862 72 A9 00 01      [ 2] 1612         addw y,#1
      008866 EF 02            [ 2] 1613         LDW (2,X),Y
      008868 90 BE 24         [ 2] 1614         LDW Y,YTEMP
      00886B 24 02            [ 1] 1615         JRNC DN1 
      00886D 90 5C            [ 1] 1616         INCW Y
      00886F FF               [ 2] 1617 DN1:    LDW (X),Y
      008870 81               [ 4] 1618         RET
                                   1619 
                                   1620 
                                   1621 ;       S>D ( n -- d )
                                   1622 ; convert single integer to double 
      008871 88 4A                 1623         .word LINK 
                           0007F3  1624         LINK=. 
      008873 03                    1625         .byte 3 
      008874 53 3E 44              1626         .ascii "S>D"
      008877                       1627 STOD: 
      008877 1D 00 02         [ 2] 1628         subw x,#CELLL 
      00887A 90 5F            [ 1] 1629         clrw y 
      00887C FF               [ 2] 1630         ldw (x),y 
      00887D 90 93            [ 1] 1631         ldw y,x 
      00887F 90 EE 02         [ 2] 1632         ldw y,(2,y)
      008882 2A 05            [ 1] 1633         jrpl 1$ 
      008884 90 AE FF FF      [ 2] 1634         ldw y,#-1
      008888 FF               [ 2] 1635         ldw (x),y 
      008889 81               [ 4] 1636 1$:     ret 
                                   1637 
                                   1638 
                                   1639 
                                   1640 
                                   1641 ;       -       ( n1 n2 -- n1-n2 )
                                   1642 ;       Subtraction.
      00888A 88 73                 1643         .word      LINK
                           00080C  1644 LINK = . 
      00888C 01                    1645         .byte      1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



      00888D 2D                    1646         .ascii     "-"
      00888E                       1647 SUBB:
      00888E 90 93            [ 1] 1648         LDW Y,X
      008890 90 FE            [ 2] 1649         LDW Y,(Y)
      008892 90 BF 24         [ 2] 1650         LDW YTEMP,Y
      008895 1C 00 02         [ 2] 1651         ADDW X,#2
      008898 90 93            [ 1] 1652         LDW Y,X
      00889A 90 FE            [ 2] 1653         LDW Y,(Y)
      00889C 72 B2 00 24      [ 2] 1654         SUBW Y,YTEMP
      0088A0 FF               [ 2] 1655         LDW (X),Y
      0088A1 81               [ 4] 1656         RET
                                   1657 
                                   1658 ;       ABS     ( n -- n )
                                   1659 ;       Return  absolute value of n.
      0088A2 88 8C                 1660         .word      LINK
                           000824  1661 LINK = . 
      0088A4 03                    1662         .byte      3
      0088A5 41 42 53              1663         .ascii     "ABS"
      0088A8                       1664 ABSS:
      0088A8 90 93            [ 1] 1665         LDW Y,X
      0088AA 90 FE            [ 2] 1666 	LDW Y,(Y)
      0088AC 2A 03            [ 1] 1667         JRPL     AB1     ;negate:
      0088AE 90 50            [ 2] 1668         NEGW     Y     ;else negate hi byte
      0088B0 FF               [ 2] 1669         LDW (X),Y
      0088B1 81               [ 4] 1670 AB1:    RET
                                   1671 
                                   1672 ;       =       ( w w -- t )
                                   1673 ;       Return true if top two are =al.
      0088B2 88 A4                 1674         .word      LINK
                           000834  1675 LINK = . 
      0088B4 01                    1676         .byte      1
      0088B5 3D                    1677         .ascii     "="
      0088B6                       1678 EQUAL:
      0088B6 A6 FF            [ 1] 1679         LD A,#0xFF  ;true
      0088B8 90 93            [ 1] 1680         LDW Y,X    ;D = n2
      0088BA 90 FE            [ 2] 1681         LDW Y,(Y)
      0088BC 90 BF 24         [ 2] 1682         LDW YTEMP,Y
      0088BF 1C 00 02         [ 2] 1683         ADDW X,#2
      0088C2 90 93            [ 1] 1684         LDW Y,X
      0088C4 90 FE            [ 2] 1685         LDW Y,(Y)
      0088C6 90 B3 24         [ 2] 1686         CPW Y,YTEMP     ;if n2 <> n1
      0088C9 27 01            [ 1] 1687         JREQ     EQ1
      0088CB 4F               [ 1] 1688         CLR A
      0088CC F7               [ 1] 1689 EQ1:    LD (X),A
      0088CD E7 01            [ 1] 1690         LD (1,X),A
      0088CF 81               [ 4] 1691 	RET     
                                   1692 
                                   1693 ;       U<      ( u u -- t )
                                   1694 ;       Unsigned compare of top two items.
      0088D0 88 B4                 1695         .word      LINK
                           000852  1696 LINK = . 
      0088D2 02                    1697         .byte      2
      0088D3 55 3C                 1698         .ascii     "U<"
      0088D5                       1699 ULESS:
      0088D5 A6 FF            [ 1] 1700         LD A,#0xFF  ;true
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



      0088D7 90 93            [ 1] 1701         LDW Y,X    ;D = n2
      0088D9 90 FE            [ 2] 1702         LDW Y,(Y)
      0088DB 90 BF 24         [ 2] 1703         LDW YTEMP,Y
      0088DE 1C 00 02         [ 2] 1704         ADDW X,#2
      0088E1 90 93            [ 1] 1705         LDW Y,X
      0088E3 90 FE            [ 2] 1706         LDW Y,(Y)
      0088E5 90 B3 24         [ 2] 1707         CPW Y,YTEMP     ;if n2 <> n1
      0088E8 25 01            [ 1] 1708         JRULT     ULES1
      0088EA 4F               [ 1] 1709         CLR A
      0088EB F7               [ 1] 1710 ULES1:  LD (X),A
      0088EC E7 01            [ 1] 1711         LD (1,X),A
      0088EE 81               [ 4] 1712 	RET     
                                   1713 
                                   1714 ;       <       ( n1 n2 -- t )
                                   1715 ;       Signed compare of top two items.
      0088EF 88 D2                 1716         .word      LINK
                           000871  1717 LINK = . 
      0088F1 01                    1718         .byte      1
      0088F2 3C                    1719         .ascii     "<"
      0088F3                       1720 LESS:
      0088F3 A6 FF            [ 1] 1721         LD A,#0xFF  ;true
      0088F5 90 93            [ 1] 1722         LDW Y,X    ;D = n2
      0088F7 90 FE            [ 2] 1723         LDW Y,(Y)
      0088F9 90 BF 24         [ 2] 1724         LDW YTEMP,Y
      0088FC 1C 00 02         [ 2] 1725         ADDW X,#2
      0088FF 90 93            [ 1] 1726         LDW Y,X
      008901 90 FE            [ 2] 1727         LDW Y,(Y)
      008903 90 B3 24         [ 2] 1728         CPW Y,YTEMP     ;if n2 <> n1
      008906 2F 01            [ 1] 1729         JRSLT     LT1
      008908 4F               [ 1] 1730         CLR A
      008909 F7               [ 1] 1731 LT1:    LD (X),A
      00890A E7 01            [ 1] 1732         LD (1,X),A
      00890C 81               [ 4] 1733 	RET     
                                   1734 
                                   1735 ;       MAX     ( n n -- n )
                                   1736 ;       Return greater of two top items.
      00890D 88 F1                 1737         .word      LINK
                           00088F  1738 LINK = . 
      00890F 03                    1739         .byte      3
      008910 4D 41 58              1740         .ascii     "MAX"
      008913                       1741 MAX:
      008913 90 93            [ 1] 1742         LDW Y,X    ;D = n2
      008915 90 EE 02         [ 2] 1743         LDW Y,(2,Y)
      008918 90 BF 24         [ 2] 1744         LDW YTEMP,Y
      00891B 90 93            [ 1] 1745         LDW Y,X
      00891D 90 FE            [ 2] 1746         LDW Y,(Y)
      00891F 90 B3 24         [ 2] 1747         CPW Y,YTEMP     ;if n2 <> n1
      008922 2F 02            [ 1] 1748         JRSLT     MAX1
      008924 EF 02            [ 2] 1749         LDW (2,X),Y
      008926 1C 00 02         [ 2] 1750 MAX1:   ADDW X,#2
      008929 81               [ 4] 1751 	RET     
                                   1752 
                                   1753 ;       MIN     ( n n -- n )
                                   1754 ;       Return smaller of top two items.
      00892A 89 0F                 1755         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



                           0008AC  1756 LINK = . 
      00892C 03                    1757         .byte      3
      00892D 4D 49 4E              1758         .ascii     "MIN"
      008930                       1759 MIN:
      008930 90 93            [ 1] 1760         LDW Y,X    ;D = n2
      008932 90 EE 02         [ 2] 1761         LDW Y,(2,Y)
      008935 90 BF 24         [ 2] 1762         LDW YTEMP,Y
      008938 90 93            [ 1] 1763         LDW Y,X
      00893A 90 FE            [ 2] 1764         LDW Y,(Y)
      00893C 90 B3 24         [ 2] 1765         CPW Y,YTEMP     ;if n2 <> n1
      00893F 2C 02            [ 1] 1766         JRSGT     MIN1
      008941 EF 02            [ 2] 1767         LDW (2,X),Y
      008943 1C 00 02         [ 2] 1768 MIN1:	ADDW X,#2
      008946 81               [ 4] 1769 	RET     
                                   1770 
                                   1771 ;       WITHIN  ( u ul uh -- t )
                                   1772 ;       Return true if u is within
                                   1773 ;       range of ul and uh. ( ul <= u < uh )
      008947 89 2C                 1774         .word      LINK
                           0008C9  1775 LINK = . 
      008949 06                    1776         .byte      6
      00894A 57 49 54 48 49 4E     1777         .ascii     "WITHIN"
      008950                       1778 WITHI:
      008950 CD 86 44         [ 4] 1779         CALL     OVER
      008953 CD 88 8E         [ 4] 1780         CALL     SUBB
      008956 CD 85 E3         [ 4] 1781         CALL     TOR
      008959 CD 88 8E         [ 4] 1782         CALL     SUBB
      00895C CD 85 C4         [ 4] 1783         CALL     RFROM
      00895F CC 88 D5         [ 2] 1784         JP     ULESS
                                   1785 
                                   1786 ;; Divide
                                   1787 
                                   1788 ;       UM/MOD  ( udl udh un -- ur uq )
                                   1789 ;       Unsigned divide of a double by a
                                   1790 ;       single. Return mod and quotient.
      008962 89 49                 1791         .word      LINK
                           0008E4  1792 LINK = . 
      008964 06                    1793         .byte      6
      008965 55 4D 2F 4D 4F 44     1794         .ascii     "UM/MOD"
      00896B                       1795 UMMOD:
      00896B BF 22            [ 2] 1796 	LDW XTEMP,X	; save stack pointer
      00896D FE               [ 2] 1797 	LDW X,(X)	; un
      00896E BF 24            [ 2] 1798 	LDW YTEMP,X     ; save un
      008970 90 BE 22         [ 2] 1799 	LDW Y,XTEMP	; stack pointer
      008973 90 EE 04         [ 2] 1800 	LDW Y,(4,Y)     ; Y=udl
      008976 BE 22            [ 2] 1801 	LDW X,XTEMP
      008978 EE 02            [ 2] 1802 	LDW X,(2,X)	; X=udh
      00897A B3 24            [ 2] 1803 	CPW X,YTEMP
      00897C 23 0F            [ 2] 1804 	JRULE MMSM1
      00897E BE 22            [ 2] 1805 	LDW X,XTEMP
      008980 1C 00 02         [ 2] 1806 	ADDW X,#2	; pop off 1 level
      008983 90 AE FF FF      [ 2] 1807 	LDW Y,#0xFFFF
      008987 FF               [ 2] 1808 	LDW (X),Y
      008988 90 5F            [ 1] 1809 	CLRW Y
      00898A EF 02            [ 2] 1810 	LDW (2,X),Y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



      00898C 81               [ 4] 1811 	RET
      00898D                       1812 MMSM1:
                                   1813 ; take advantage of divw x,y when udh==0
      00898D 5D               [ 2] 1814         tnzw x  ; is udh==0?
      00898E 26 11            [ 1] 1815         jrne MMSM2 
      008990 93               [ 1] 1816         ldw x,y    ;udl 
      008991 90 BE 24         [ 2] 1817         ldw y,YTEMP ; divisor 
      008994 65               [ 2] 1818         divw x,y 
      008995 89               [ 2] 1819         pushw x     ; quotient 
      008996 BE 22            [ 2] 1820         ldw x,XTEMP 
      008998 1C 00 02         [ 2] 1821         addw x,#CELLL 
      00899B EF 02            [ 2] 1822         ldw (2,x),y  ; ur
      00899D 90 85            [ 2] 1823         popw y 
      00899F FF               [ 2] 1824         ldw (x),y ; uq 
      0089A0 81               [ 4] 1825         ret 
      0089A1                       1826 MMSM2:        
      0089A1 A6 11            [ 1] 1827 	LD A,#17	; loop count
      0089A3                       1828 MMSM3:
      0089A3 B3 24            [ 2] 1829 	CPW X,YTEMP	; compare udh to un
      0089A5 25 04            [ 1] 1830 	JRULT MMSM4	; can't subtract
      0089A7 72 B0 00 24      [ 2] 1831 	SUBW X,YTEMP	; can subtract
      0089AB                       1832 MMSM4:
      0089AB 8C               [ 1] 1833 	CCF	; quotient bit
      0089AC 90 59            [ 2] 1834 	RLCW Y	; rotate into quotient
      0089AE 59               [ 2] 1835 	RLCW X	; rotate into remainder
      0089AF 4A               [ 1] 1836 	DEC A	; repeat
      0089B0 22 F1            [ 1] 1837 	JRUGT MMSM3
      0089B2 56               [ 2] 1838         RRCW X 
      0089B3 BF 24            [ 2] 1839 	LDW YTEMP,X	; done, save remainder
      0089B5 BE 22            [ 2] 1840 	LDW X,XTEMP
      0089B7 1C 00 02         [ 2] 1841 	ADDW X,#2	; drop
      0089BA FF               [ 2] 1842 	LDW (X),Y
      0089BB 90 BE 24         [ 2] 1843 	LDW Y,YTEMP	; save quotient
      0089BE EF 02            [ 2] 1844 	LDW (2,X),Y
      0089C0 81               [ 4] 1845 	RET
                                   1846 	
                                   1847 ;       M/MOD   ( d n -- r q )
                                   1848 ;       Signed floored divide of double by
                                   1849 ;       single. Return mod and quotient.
      0089C1 89 64                 1850         .word      LINK
                           000943  1851 LINK = . 
      0089C3 05                    1852         .byte      5
      0089C4 4D 2F 4D 4F 44        1853         .ascii     "M/MOD"
      0089C9                       1854 MSMOD:  
      0089C9 CD 86 1A         [ 4] 1855         CALL	DUPP
      0089CC CD 86 53         [ 4] 1856         CALL	ZLESS
      0089CF CD 86 1A         [ 4] 1857         CALL	DUPP
      0089D2 CD 85 E3         [ 4] 1858         CALL	TOR
      0089D5 CD 85 28         [ 4] 1859         CALL	QBRAN
      0089D8 89 E6                 1860         .word	MMOD1
      0089DA CD 88 40         [ 4] 1861         CALL	NEGAT
      0089DD CD 85 E3         [ 4] 1862         CALL	TOR
      0089E0 CD 88 52         [ 4] 1863         CALL	DNEGA
      0089E3 CD 85 C4         [ 4] 1864         CALL	RFROM
      0089E6 CD 85 E3         [ 4] 1865 MMOD1:	CALL	TOR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



      0089E9 CD 86 1A         [ 4] 1866         CALL	DUPP
      0089EC CD 86 53         [ 4] 1867         CALL	ZLESS
      0089EF CD 85 28         [ 4] 1868         CALL	QBRAN
      0089F2 89 FA                 1869         .word	MMOD2
      0089F4 CD 85 D7         [ 4] 1870         CALL	RAT
      0089F7 CD 88 15         [ 4] 1871         CALL	PLUS
      0089FA CD 85 C4         [ 4] 1872 MMOD2:	CALL	RFROM
      0089FD CD 89 6B         [ 4] 1873         CALL	UMMOD
      008A00 CD 85 C4         [ 4] 1874         CALL	RFROM
      008A03 CD 85 28         [ 4] 1875         CALL	QBRAN
      008A06 8A 11                 1876         .word	MMOD3
      008A08 CD 86 2A         [ 4] 1877         CALL	SWAPP
      008A0B CD 88 40         [ 4] 1878         CALL	NEGAT
      008A0E CD 86 2A         [ 4] 1879         CALL	SWAPP
      008A11 81               [ 4] 1880 MMOD3:	RET
                                   1881 
                                   1882 ;       /MOD    ( n n -- r q )
                                   1883 ;       Signed divide. Return mod and quotient.
      008A12 89 C3                 1884         .word      LINK
                           000994  1885 LINK = . 
      008A14 04                    1886         .byte      4
      008A15 2F 4D 4F 44           1887         .ascii     "/MOD"
      008A19                       1888 SLMOD:
      008A19 CD 86 44         [ 4] 1889         CALL	OVER
      008A1C CD 86 53         [ 4] 1890         CALL	ZLESS
      008A1F CD 86 2A         [ 4] 1891         CALL	SWAPP
      008A22 CC 89 C9         [ 2] 1892         JP	MSMOD
                                   1893 
                                   1894 ;       MOD     ( n n -- r )
                                   1895 ;       Signed divide. Return mod only.
      008A25 8A 14                 1896         .word      LINK
                           0009A7  1897 LINK = . 
      008A27 03                    1898         .byte      3
      008A28 4D 4F 44              1899         .ascii     "MOD"
      008A2B                       1900 MODD:
      008A2B CD 8A 19         [ 4] 1901 	CALL	SLMOD
      008A2E CC 86 10         [ 2] 1902 	JP	DROP
                                   1903 
                                   1904 ;       /       ( n n -- q )
                                   1905 ;       Signed divide. Return quotient only.
      008A31 8A 27                 1906         .word      LINK
                           0009B3  1907 LINK = . 
      008A33 01                    1908         .byte      1
      008A34 2F                    1909         .ascii     "/"
      008A35                       1910 SLASH:
      008A35 CD 8A 19         [ 4] 1911         CALL	SLMOD
      008A38 CD 86 2A         [ 4] 1912         CALL	SWAPP
      008A3B CC 86 10         [ 2] 1913         JP	DROP
                                   1914 
                                   1915 ;; Multiply
                                   1916 
                                   1917 ;       UM*     ( u u -- ud )
                                   1918 ;       Unsigned multiply. Return double product.
      008A3E 8A 33                 1919         .word      LINK
                           0009C0  1920 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



      008A40 03                    1921         .byte      3
      008A41 55 4D 2A              1922         .ascii     "UM*"
      008A44                       1923 UMSTA:	; stack have 4 bytes u1=a,b u2=c,d
                                   1924 ; take advantage of SP addressing modes
                                   1925 ; these PRODx in RAM are not required
                                   1926 ; the product is kept on stack as local variable 
                                   1927         ;; bytes offset on data stack 
                           000002  1928         da=2 
                           000003  1929         db=3 
                           000000  1930         dc=0 
                           000001  1931         dd=1 
                                   1932         ;; product bytes offset on return stack 
                           000001  1933         UD1=1  ; ud bits 31..24
                           000002  1934         UD2=2  ; ud bits 23..16
                           000003  1935         UD3=3  ; ud bits 15..8 
                           000004  1936         UD4=4  ; ud bits 7..0 
                                   1937         ;; local variable for product set to zero   
      008A44 90 5F            [ 1] 1938         clrw y 
      008A46 90 89            [ 2] 1939         pushw y  ; bits 15..0
      008A48 90 89            [ 2] 1940         pushw y  ; bits 31..16 
      008A4A E6 03            [ 1] 1941         ld a,(db,x) ; b 
      008A4C 90 97            [ 1] 1942         ld yl,a 
      008A4E E6 01            [ 1] 1943         ld a,(dd,x)   ; d
      008A50 90 42            [ 4] 1944         mul y,a    ; b*d  
      008A52 17 03            [ 2] 1945         ldw (UD3,sp),y ; lowest weight product 
      008A54 E6 03            [ 1] 1946         ld a,(db,x)
      008A56 90 97            [ 1] 1947         ld yl,a 
      008A58 E6 00            [ 1] 1948         ld a,(dc,x)
      008A5A 90 42            [ 4] 1949         mul y,a  ; b*c 
                                   1950         ;;; do the partial sum 
      008A5C 72 F9 02         [ 2] 1951         addw y,(UD2,sp)
      008A5F 4F               [ 1] 1952         clr a 
      008A60 49               [ 1] 1953         rlc a
      008A61 6B 01            [ 1] 1954         ld (UD1,sp),a 
      008A63 17 02            [ 2] 1955         ldw (UD2,sp),y 
      008A65 E6 02            [ 1] 1956         ld a,(da,x)
      008A67 90 97            [ 1] 1957         ld yl,a 
      008A69 E6 01            [ 1] 1958         ld a,(dd,x)
      008A6B 90 42            [ 4] 1959         mul y,a   ; a*d 
                                   1960         ;; do partial sum 
      008A6D 72 F9 02         [ 2] 1961         addw y,(UD2,sp)
      008A70 4F               [ 1] 1962         clr a 
      008A71 19 01            [ 1] 1963         adc a,(UD1,sp)
      008A73 6B 01            [ 1] 1964         ld (UD1,sp),a  
      008A75 17 02            [ 2] 1965         ldw (UD2,sp),y 
      008A77 E6 02            [ 1] 1966         ld a,(da,x)
      008A79 90 97            [ 1] 1967         ld yl,a 
      008A7B E6 00            [ 1] 1968         ld a,(dc,x)
      008A7D 90 42            [ 4] 1969         mul y,a  ;  a*c highest weight product 
                                   1970         ;;; do partial sum 
      008A7F 72 F9 01         [ 2] 1971         addw y,(UD1,sp)
      008A82 FF               [ 2] 1972         ldw (x),y  ; udh 
      008A83 16 03            [ 2] 1973         ldw y,(UD3,sp)
      008A85 EF 02            [ 2] 1974         ldw (2,x),y  ; udl  
      008A87 5B 04            [ 2] 1975         addw sp,#4 ; drop local variable 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



      008A89 81               [ 4] 1976         ret  
                                   1977 
                                   1978 
                                   1979 ;       *       ( n n -- n )
                                   1980 ;       Signed multiply. Return single product.
      008A8A 8A 40                 1981         .word      LINK
                           000A0C  1982 LINK = . 
      008A8C 01                    1983         .byte      1
      008A8D 2A                    1984         .ascii     "*"
      008A8E                       1985 STAR:
      008A8E CD 8A 44         [ 4] 1986 	CALL	UMSTA
      008A91 CC 86 10         [ 2] 1987 	JP	DROP
                                   1988 
                                   1989 ;       M*      ( n n -- d )
                                   1990 ;       Signed multiply. Return double product.
      008A94 8A 8C                 1991         .word      LINK
                           000A16  1992 LINK = . 
      008A96 02                    1993         .byte      2
      008A97 4D 2A                 1994         .ascii     "M*"
      008A99                       1995 MSTAR:      
      008A99 CD 88 00         [ 4] 1996         CALL	DDUP
      008A9C CD 86 8F         [ 4] 1997         CALL	XORR
      008A9F CD 86 53         [ 4] 1998         CALL	ZLESS
      008AA2 CD 85 E3         [ 4] 1999         CALL	TOR
      008AA5 CD 88 A8         [ 4] 2000         CALL	ABSS
      008AA8 CD 86 2A         [ 4] 2001         CALL	SWAPP
      008AAB CD 88 A8         [ 4] 2002         CALL	ABSS
      008AAE CD 8A 44         [ 4] 2003         CALL	UMSTA
      008AB1 CD 85 C4         [ 4] 2004         CALL	RFROM
      008AB4 CD 85 28         [ 4] 2005         CALL	QBRAN
      008AB7 8A BC                 2006         .word	MSTA1
      008AB9 CD 88 52         [ 4] 2007         CALL	DNEGA
      008ABC 81               [ 4] 2008 MSTA1:	RET
                                   2009 
                                   2010 ;       */MOD   ( n1 n2 n3 -- r q )
                                   2011 ;       Multiply n1 and n2, then divide
                                   2012 ;       by n3. Return mod and quotient.
      008ABD 8A 96                 2013         .word      LINK
                           000A3F  2014 LINK = . 
      008ABF 05                    2015         .byte      5
      008AC0 2A 2F 4D 4F 44        2016         .ascii     "*/MOD"
      008AC5                       2017 SSMOD:
      008AC5 CD 85 E3         [ 4] 2018         CALL     TOR
      008AC8 CD 8A 99         [ 4] 2019         CALL     MSTAR
      008ACB CD 85 C4         [ 4] 2020         CALL     RFROM
      008ACE CC 89 C9         [ 2] 2021         JP     MSMOD
                                   2022 
                                   2023 ;       */      ( n1 n2 n3 -- q )
                                   2024 ;       Multiply n1 by n2, then divide
                                   2025 ;       by n3. Return quotient only.
      008AD1 8A BF                 2026         .word      LINK
                           000A53  2027 LINK = . 
      008AD3 02                    2028         .byte      2
      008AD4 2A 2F                 2029         .ascii     "*/"
      008AD6                       2030 STASL:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



      008AD6 CD 8A C5         [ 4] 2031         CALL	SSMOD
      008AD9 CD 86 2A         [ 4] 2032         CALL	SWAPP
      008ADC CC 86 10         [ 2] 2033         JP	DROP
                                   2034 
                                   2035 ;; Miscellaneous
                                   2036 
                                   2037 ;       CELL+   ( a -- a )
                                   2038 ;       Add cell size in byte to address.
      008ADF 8A D3                 2039         .word      LINK
                           000A61  2040 LINK = . 
      008AE1 02                    2041         .byte       2
      008AE2 32 2B                 2042         .ascii     "2+"
      008AE4                       2043 CELLP:
      008AE4 90 93            [ 1] 2044         LDW Y,X
      008AE6 90 FE            [ 2] 2045 	LDW Y,(Y)
      008AE8 72 A9 00 02      [ 2] 2046         ADDW Y,#CELLL 
      008AEC FF               [ 2] 2047         LDW (X),Y
      008AED 81               [ 4] 2048         RET
                                   2049 
                                   2050 ;       CELL-   ( a -- a )
                                   2051 ;       Subtract 2 from address.
      008AEE 8A E1                 2052         .word      LINK
                           000A70  2053 LINK = . 
      008AF0 02                    2054         .byte       2
      008AF1 32 2D                 2055         .ascii     "2-"
      008AF3                       2056 CELLM:
      008AF3 90 93            [ 1] 2057         LDW Y,X
      008AF5 90 FE            [ 2] 2058 	LDW Y,(Y)
      008AF7 72 A2 00 02      [ 2] 2059         SUBW Y,#CELLL
      008AFB FF               [ 2] 2060         LDW (X),Y
      008AFC 81               [ 4] 2061         RET
                                   2062 
                                   2063 ;       CELLS   ( n -- n )
                                   2064 ;       Multiply tos by 2.
      008AFD 8A F0                 2065         .word      LINK
                           000A7F  2066 LINK = . 
      008AFF 02                    2067         .byte       2
      008B00 32 2A                 2068         .ascii     "2*"
      008B02                       2069 CELLS:
      008B02 90 93            [ 1] 2070         LDW Y,X
      008B04 90 FE            [ 2] 2071 	LDW Y,(Y)
      008B06 90 58            [ 2] 2072         SLAW Y
      008B08 FF               [ 2] 2073         LDW (X),Y
      008B09 81               [ 4] 2074         RET
                                   2075 
                                   2076 ;       1+      ( a -- a )
                                   2077 ;       Add cell size in byte to address.
      008B0A 8A FF                 2078         .word      LINK
                           000A8C  2079 LINK = . 
      008B0C 02                    2080         .byte      2
      008B0D 31 2B                 2081         .ascii     "1+"
      008B0F                       2082 ONEP:
      008B0F 90 93            [ 1] 2083         LDW Y,X
      008B11 90 FE            [ 2] 2084 	LDW Y,(Y)
      008B13 90 5C            [ 1] 2085         INCW Y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



      008B15 FF               [ 2] 2086         LDW (X),Y
      008B16 81               [ 4] 2087         RET
                                   2088 
                                   2089 ;       1-      ( a -- a )
                                   2090 ;       Subtract 2 from address.
      008B17 8B 0C                 2091         .word      LINK
                           000A99  2092 LINK = . 
      008B19 02                    2093         .byte      2
      008B1A 31 2D                 2094         .ascii     "1-"
      008B1C                       2095 ONEM:
      008B1C 90 93            [ 1] 2096         LDW Y,X
      008B1E 90 FE            [ 2] 2097 	LDW Y,(Y)
      008B20 90 5A            [ 2] 2098         DECW Y
      008B22 FF               [ 2] 2099         LDW (X),Y
      008B23 81               [ 4] 2100         RET
                                   2101 
                                   2102 ;  shift left n times 
                                   2103 ; LSHIFT ( n1 n2 -- n1<<n2 )
      008B24 8B 19                 2104         .word LINK 
                           000AA6  2105         LINK=.
      008B26 06                    2106         .byte 6 
      008B27 4C 53 48 49 46 54     2107         .ascii "LSHIFT"
      008B2D                       2108 LSHIFT:
      008B2D E6 01            [ 1] 2109         ld a,(1,x)
      008B2F 1C 00 02         [ 2] 2110         addw x,#CELLL 
      008B32 90 93            [ 1] 2111         ldw y,x 
      008B34 90 FE            [ 2] 2112         ldw y,(y)
      008B36                       2113 LSHIFT1:
      008B36 4D               [ 1] 2114         tnz a 
      008B37 27 05            [ 1] 2115         jreq LSHIFT4 
      008B39 90 58            [ 2] 2116         sllw y 
      008B3B 4A               [ 1] 2117         dec a 
      008B3C 20 F8            [ 2] 2118         jra LSHIFT1 
      008B3E                       2119 LSHIFT4:
      008B3E FF               [ 2] 2120         ldw (x),y 
      008B3F 81               [ 4] 2121         ret 
                                   2122 
                                   2123 ; shift right n times                 
                                   2124 ; RSHIFT (n1 n2 -- n1>>n2 )
      008B40 8B 26                 2125         .word LINK 
                           000AC2  2126         LINK=.
      008B42 06                    2127         .byte 6
      008B43 52 53 48 49 46 54     2128         .ascii "RSHIFT"
      008B49                       2129 RSHIFT:
      008B49 E6 01            [ 1] 2130         ld a,(1,x)
      008B4B 1C 00 02         [ 2] 2131         addw x,#CELLL 
      008B4E 90 93            [ 1] 2132         ldw y,x 
      008B50 90 FE            [ 2] 2133         ldw y,(y)
      008B52                       2134 RSHIFT1:
      008B52 4D               [ 1] 2135         tnz a 
      008B53 27 05            [ 1] 2136         jreq RSHIFT4 
      008B55 90 54            [ 2] 2137         srlw y 
      008B57 4A               [ 1] 2138         dec a 
      008B58 20 F8            [ 2] 2139         jra RSHIFT1 
      008B5A                       2140 RSHIFT4:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



      008B5A FF               [ 2] 2141         ldw (x),y 
      008B5B 81               [ 4] 2142         ret 
                                   2143 
                                   2144 
                                   2145 ;       2/      ( n -- n )
                                   2146 ;       divide  tos by 2.
      008B5C 8B 42                 2147         .word      LINK
                           000ADE  2148 LINK = . 
      008B5E 02                    2149         .byte      2
      008B5F 32 2F                 2150         .ascii     "2/"
      008B61                       2151 TWOSL:
      008B61 90 93            [ 1] 2152         LDW Y,X
      008B63 90 FE            [ 2] 2153 	LDW Y,(Y)
      008B65 90 57            [ 2] 2154         SRAW Y
      008B67 FF               [ 2] 2155         LDW (X),Y
      008B68 81               [ 4] 2156         RET
                                   2157 
                                   2158 ;       BL      ( -- 32 )
                                   2159 ;       Return 32,  blank character.
      008B69 8B 5E                 2160         .word      LINK
                           000AEB  2161 LINK = . 
      008B6B 02                    2162         .byte      2
      008B6C 42 4C                 2163         .ascii     "BL"
      008B6E                       2164 BLANK:
      008B6E 1D 00 02         [ 2] 2165         SUBW X,#2
      008B71 90 AE 00 20      [ 2] 2166 	LDW Y,#32
      008B75 FF               [ 2] 2167         LDW (X),Y
      008B76 81               [ 4] 2168         RET
                                   2169 
                                   2170 ;         0     ( -- 0)
                                   2171 ;         Return 0.
      008B77 8B 6B                 2172         .word      LINK
                           000AF9  2173 LINK = . 
      008B79 01                    2174         .byte       1
      008B7A 30                    2175         .ascii     "0"
      008B7B                       2176 ZERO:
      008B7B 1D 00 02         [ 2] 2177         SUBW X,#2
      008B7E 90 5F            [ 1] 2178 	CLRW Y
      008B80 FF               [ 2] 2179         LDW (X),Y
      008B81 81               [ 4] 2180         RET
                                   2181 
                                   2182 ;         1     ( -- 1)
                                   2183 ;         Return 1.
      008B82 8B 79                 2184         .word      LINK
                           000B04  2185 LINK = . 
      008B84 01                    2186         .byte       1
      008B85 31                    2187         .ascii     "1"
      008B86                       2188 ONE:
      008B86 1D 00 02         [ 2] 2189         SUBW X,#2
      008B89 90 AE 00 01      [ 2] 2190 	LDW Y,#1
      008B8D FF               [ 2] 2191         LDW (X),Y
      008B8E 81               [ 4] 2192         RET
                                   2193 
                                   2194 ;         -1    ( -- -1)
                                   2195 ;         Return 32,  blank character.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



      008B8F 8B 84                 2196         .word      LINK
                           000B11  2197 LINK = . 
      008B91 02                    2198         .byte       2
      008B92 2D 31                 2199         .ascii     "-1"
      008B94                       2200 MONE:
      008B94 1D 00 02         [ 2] 2201         SUBW X,#2
      008B97 90 AE FF FF      [ 2] 2202 	LDW Y,#0xFFFF
      008B9B FF               [ 2] 2203         LDW (X),Y
      008B9C 81               [ 4] 2204         RET
                                   2205 
                                   2206 ;       >CHAR   ( c -- c )
                                   2207 ;       Filter non-printing characters.
      008B9D 8B 91                 2208         .word      LINK
                           000B1F  2209 LINK = . 
      008B9F 05                    2210         .byte      5
      008BA0 3E 43 48 41 52        2211         .ascii     ">CHAR"
      008BA5                       2212 TCHAR:
      008BA5 E6 01            [ 1] 2213         ld a,(1,x)
      008BA7 A1 20            [ 1] 2214         cp a,#32  
      008BA9 2B 05            [ 1] 2215         jrmi 1$ 
      008BAB A1 7F            [ 1] 2216         cp a,#127 
      008BAD 2A 01            [ 1] 2217         jrpl 1$ 
      008BAF 81               [ 4] 2218         ret 
      008BB0 A6 5F            [ 1] 2219 1$:     ld a,#'_ 
      008BB2 E7 01            [ 1] 2220         ld (1,x),a 
      008BB4 81               [ 4] 2221         ret 
                                   2222 
                                   2223 ;       DEPTH   ( -- n )
                                   2224 ;       Return  depth of  data stack.
      008BB5 8B 9F                 2225         .word      LINK
                           000B37  2226 LINK = . 
      008BB7 05                    2227         .byte      5
      008BB8 44 45 50 54 48        2228         .ascii     "DEPTH"
      008BBD                       2229 DEPTH: 
      008BBD 90 BE 2A         [ 2] 2230         LDW Y,SP0    ;save data stack ptr
      008BC0 BF 22            [ 2] 2231 	LDW XTEMP,X
      008BC2 72 B2 00 22      [ 2] 2232         SUBW Y,XTEMP     ;#bytes = SP0 - X
      008BC6 90 57            [ 2] 2233         SRAW Y    ;Y = #stack items
      008BC8 1D 00 02         [ 2] 2234 	SUBW X,#2
      008BCB FF               [ 2] 2235         LDW (X),Y     ; if neg, underflow
      008BCC 81               [ 4] 2236         RET
                                   2237 
                                   2238 ;       PICK    ( ... +n -- ... w )
                                   2239 ;       Copy  nth stack item to tos.
      008BCD 8B B7                 2240         .word      LINK
                           000B4F  2241 LINK = . 
      008BCF 04                    2242         .byte      4
      008BD0 50 49 43 4B           2243         .ascii     "PICK"
      008BD4                       2244 PICK:
      008BD4 90 93            [ 1] 2245         LDW Y,X   ;D = n1
      008BD6 90 FE            [ 2] 2246         LDW Y,(Y)
                                   2247 ; modified for standard compliance          
                                   2248 ; 0 PICK must be equivalent to DUP 
      008BD8 90 5C            [ 1] 2249         INCW Y 
      008BDA 90 58            [ 2] 2250         SLAW Y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



      008BDC BF 22            [ 2] 2251         LDW XTEMP,X
      008BDE 72 B9 00 22      [ 2] 2252         ADDW Y,XTEMP
      008BE2 90 FE            [ 2] 2253         LDW Y,(Y)
      008BE4 FF               [ 2] 2254         LDW (X),Y
      008BE5 81               [ 4] 2255         RET
                                   2256 
                                   2257 ;; Memory access
                                   2258 
                                   2259 ;       +!      ( n a -- )
                                   2260 ;       Add n to  contents at address a.
      008BE6 8B CF                 2261         .word      LINK
                           000B68  2262 LINK = . 
      008BE8 02                    2263         .byte      2
      008BE9 2B 21                 2264         .ascii     "+!"
      008BEB                       2265 PSTOR:
      008BEB 90 93            [ 1] 2266         ldw y,x 
      008BED 90 FE            [ 2] 2267         ldw y,(y)
      008BEF 90 BF 24         [ 2] 2268         ldw YTEMP,y  ; address
      008BF2 90 FE            [ 2] 2269         ldw y,(y)  
      008BF4 90 89            [ 2] 2270         pushw y  ; value at address 
      008BF6 90 93            [ 1] 2271         ldw y,x 
      008BF8 90 EE 02         [ 2] 2272         ldw y,(2,y) ; n 
      008BFB 72 F9 01         [ 2] 2273         addw y,(1,sp) ; n+value
      008BFE 91 CF 24         [ 5] 2274         ldw [YTEMP],y ;  a!
      008C01 90 85            [ 2] 2275         popw y    ;drop local var
      008C03 1C 00 04         [ 2] 2276         addw x,#4 ; DDROP 
      008C06 81               [ 4] 2277         ret 
                                   2278 
                                   2279 ;       2!      ( d a -- )
                                   2280 ;       Store  double integer to address a.
      008C07 8B E8                 2281         .word      LINK
                           000B89  2282 LINK = . 
      008C09 02                    2283         .byte      2
      008C0A 32 21                 2284         .ascii     "2!"
      008C0C                       2285 DSTOR:
      008C0C 90 93            [ 1] 2286         ldw y,x 
      008C0E 90 FE            [ 2] 2287         ldw y,(y)
      008C10 90 BF 24         [ 2] 2288         ldw YTEMP,y ; address 
      008C13 1C 00 02         [ 2] 2289         addw x,#CELLL ; drop a 
      008C16 90 93            [ 1] 2290         ldw y,x 
      008C18 90 FE            [ 2] 2291         ldw y,(y) ; hi word 
      008C1A 89               [ 2] 2292         pushw x 
      008C1B EE 02            [ 2] 2293         ldw x,(2,x) ; lo word 
      008C1D 91 CF 24         [ 5] 2294         ldw [YTEMP],y
      008C20 90 93            [ 1] 2295         ldw y,x 
      008C22 AE 00 02         [ 2] 2296         ldw x,#2 
      008C25 92 DF 24         [ 5] 2297         ldw ([YTEMP],x),y 
      008C28 85               [ 2] 2298         popw x 
      008C29 1C 00 04         [ 2] 2299         addw x,#4 ; DDROP 
      008C2C 81               [ 4] 2300         ret 
                                   2301 
                                   2302 ;       2@      ( a -- d )
                                   2303 ;       Fetch double integer from address a.
      008C2D 8C 09                 2304         .word      LINK
                           000BAF  2305 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



      008C2F 02                    2306         .byte      2
      008C30 32 40                 2307         .ascii     "2@"
      008C32                       2308 DAT:
      008C32 90 93            [ 1] 2309         ldw y,x 
      008C34 90 FE            [ 2] 2310         ldw y,(y) ;address 
      008C36 90 BF 24         [ 2] 2311         ldw YTEMP,y 
      008C39 1D 00 02         [ 2] 2312         subw x,#CELLL ; space for udh 
      008C3C 91 CE 24         [ 5] 2313         ldw y,[YTEMP] ; udh 
      008C3F FF               [ 2] 2314         ldw (x),y 
      008C40 90 AE 00 02      [ 2] 2315         ldw y,#2
      008C44 91 DE 24         [ 5] 2316         ldw y,([YTEMP],y) ; udl 
      008C47 EF 02            [ 2] 2317         ldw (2,x),y
      008C49 81               [ 4] 2318         ret 
                                   2319 
                                   2320 ;       COUNT   ( b -- b +n )
                                   2321 ;       Return count byte of a string
                                   2322 ;       and add 1 to byte address.
      008C4A 8C 2F                 2323         .word      LINK
                           000BCC  2324 LINK = . 
      008C4C 05                    2325         .byte      5
      008C4D 43 4F 55 4E 54        2326         .ascii     "COUNT"
      008C52                       2327 COUNT:
      008C52 90 93            [ 1] 2328         ldw y,x 
      008C54 90 FE            [ 2] 2329         ldw y,(y) ; address 
      008C56 90 F6            [ 1] 2330         ld a,(y)  ; count 
      008C58 90 5C            [ 1] 2331         incw y 
      008C5A FF               [ 2] 2332         ldw (x),y 
      008C5B 1D 00 02         [ 2] 2333         subw x,#CELLL 
      008C5E E7 01            [ 1] 2334         ld (1,x),a 
      008C60 7F               [ 1] 2335         clr (x)
      008C61 81               [ 4] 2336         ret 
                                   2337 
                                   2338 ;       HERE    ( -- a )
                                   2339 ;       Return  top of  variables
      008C62 8C 4C                 2340         .word      LINK
                           000BE4  2341 LINK = . 
      008C64 04                    2342         .byte      4
      008C65 48 45 52 45           2343         .ascii     "HERE"
      008C69                       2344 HERE:
      008C69 90 AE 00 16      [ 2] 2345       	ldw y,#UVP 
      008C6D 90 FE            [ 2] 2346         ldw y,(y)
      008C6F 1D 00 02         [ 2] 2347         subw x,#CELLL 
      008C72 FF               [ 2] 2348         ldw (x),y 
      008C73 81               [ 4] 2349         ret 
                                   2350 
                                   2351 ;       PAD     ( -- a )
                                   2352 ;       Return address of text buffer
                                   2353 ;       above  code dictionary.
      008C74 8C 64                 2354         .word      LINK
                           000BF6  2355 LINK = . 
      008C76 03                    2356         .byte      3
      008C77 50 41 44              2357         .ascii     "PAD"
      008C7A                       2358 PAD:
      008C7A CD 8C 69         [ 4] 2359         CALL     HERE
      008C7D CD 84 F5         [ 4] 2360         CALL     DOLIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



      008C80 00 50                 2361         .word      80
      008C82 CC 88 15         [ 2] 2362         JP     PLUS
                                   2363 
                                   2364 ;       TIB     ( -- a )
                                   2365 ;       Return address of terminal input buffer.
      008C85 8C 76                 2366         .word      LINK
                           000C07  2367 LINK = . 
      008C87 03                    2368         .byte      3
      008C88 54 49 42              2369         .ascii     "TIB"
      008C8B                       2370 TIB:
      008C8B CD 87 05         [ 4] 2371         CALL     NTIB
      008C8E CD 8A E4         [ 4] 2372         CALL     CELLP
      008C91 CC 85 73         [ 2] 2373         JP     AT
                                   2374 
                                   2375 ;       @EXECUTE        ( a -- )
                                   2376 ;       Execute vector stored in address a.
      008C94 8C 87                 2377         .word      LINK
                           000C16  2378 LINK = . 
      008C96 08                    2379         .byte      8
      008C97 40 45 58 45 43 55 54  2380         .ascii     "@EXECUTE"
             45
      008C9F                       2381 ATEXE:
      008C9F CD 85 73         [ 4] 2382         CALL     AT
      008CA2 CD 87 C4         [ 4] 2383         CALL     QDUP    ;?address or zero
      008CA5 CD 85 28         [ 4] 2384         CALL     QBRAN
      008CA8 8C AD                 2385         .word      EXE1
      008CAA CD 85 4F         [ 4] 2386         CALL     EXECU   ;execute if non-zero
      008CAD 81               [ 4] 2387 EXE1:   RET     ;do nothing if zero
                                   2388 
                                   2389 ;       CMOVE   ( b1 b2 u -- )
                                   2390 ;       Copy u bytes from b1 to b2.
      008CAE 8C 96                 2391         .word      LINK
                           000C30  2392 LINK = . 
      008CB0 05                    2393         .byte      5
      008CB1 43 4D 4F 56 45        2394         .ascii     "CMOVE"
      008CB6                       2395 CMOVE:
      008CB6 CD 85 E3         [ 4] 2396         CALL	TOR
      008CB9 CD 85 3F         [ 4] 2397         CALL	BRAN
      008CBC 8C D6                 2398         .word	CMOV2
      008CBE CD 85 E3         [ 4] 2399 CMOV1:	CALL	TOR
      008CC1 CD 86 1A         [ 4] 2400         CALL	DUPP
      008CC4 CD 85 91         [ 4] 2401         CALL	CAT
      008CC7 CD 85 D7         [ 4] 2402         CALL	RAT
      008CCA CD 85 80         [ 4] 2403         CALL	CSTOR
      008CCD CD 8B 0F         [ 4] 2404         CALL	ONEP
      008CD0 CD 85 C4         [ 4] 2405         CALL	RFROM
      008CD3 CD 8B 0F         [ 4] 2406         CALL	ONEP
      008CD6 CD 85 09         [ 4] 2407 CMOV2:	CALL	DONXT
      008CD9 8C BE                 2408         .word	CMOV1
      008CDB CC 87 F5         [ 2] 2409         JP	DDROP
                                   2410 
                                   2411 ;       FILL    ( b u c -- )
                                   2412 ;       Fill u bytes of character c
                                   2413 ;       to area beginning at b.
      008CDE 8C B0                 2414         .word       LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



                           000C60  2415 LINK = . 
      008CE0 04                    2416         .byte       4
      008CE1 46 49 4C 4C           2417         .ascii     "FILL"
      008CE5                       2418 FILL:
      008CE5 90 93            [ 1] 2419         ldw y,x 
      008CE7 90 E6 01         [ 1] 2420         ld a,(1,y) ; c 
      008CEA 1C 00 02         [ 2] 2421         addw x,#CELLL ; drop c 
      008CED 90 93            [ 1] 2422         ldw y,x 
      008CEF 90 FE            [ 2] 2423         ldw y,(y) ; count
      008CF1 90 89            [ 2] 2424         pushw y 
      008CF3 1C 00 02         [ 2] 2425         addw x,#CELLL ; drop u 
      008CF6 90 93            [ 1] 2426         ldw y,x 
      008CF8 1C 00 02         [ 2] 2427         addw x,#CELLL ; drop b 
      008CFB 90 FE            [ 2] 2428         ldw y,(y) ; address
      008CFD 90 BF 24         [ 2] 2429         ldw YTEMP,y
      008D00 90 85            [ 2] 2430         popw y ; count 
      008D02                       2431 FILL1:  
      008D02 92 C7 24         [ 4] 2432         ld [YTEMP],a 
      008D05 3C 25            [ 1] 2433         inc YTEMP+1
      008D07 24 02            [ 1] 2434         jrnc FILL2 
      008D09 3C 24            [ 1] 2435         inc YTEMP
      008D0B                       2436 FILL2: 
      008D0B 90 5A            [ 2] 2437         decw y ; count 
      008D0D 26 F3            [ 1] 2438         jrne FILL1  
      008D0F 81               [ 4] 2439         ret 
                                   2440 
                                   2441 ;       ERASE   ( b u -- )
                                   2442 ;       Erase u bytes beginning at b.
      008D10 8C E0                 2443         .word      LINK
                           000C92  2444 LINK = . 
      008D12 05                    2445         .byte      5
      008D13 45 52 41 53 45        2446         .ascii     "ERASE"
      008D18                       2447 ERASE:
      008D18 90 5F            [ 1] 2448         clrw y 
      008D1A 1D 00 02         [ 2] 2449         subw x,#CELLL 
      008D1D FF               [ 2] 2450         ldw (x),y 
      008D1E CC 8C E5         [ 2] 2451         jp FILL 
                                   2452 
                                   2453 
                                   2454 ;       PACK0   ( b u a -- a )
                                   2455 ;       Build a counted string with
                                   2456 ;       u characters from b. Null fill.
      008D21 8D 12                 2457         .word      LINK
                           000CA3  2458 LINK = . 
      008D23 05                    2459         .byte      5
      008D24 50 41 43 4B 30        2460         .ascii     "PACK0"
      008D29                       2461 PACKS:
      008D29 CD 86 1A         [ 4] 2462         CALL     DUPP
      008D2C CD 85 E3         [ 4] 2463         CALL     TOR     ;strings only on cell boundary
      008D2F CD 88 00         [ 4] 2464         CALL     DDUP
      008D32 CD 85 80         [ 4] 2465         CALL     CSTOR
      008D35 CD 8B 0F         [ 4] 2466         CALL     ONEP ;save count
      008D38 CD 86 2A         [ 4] 2467         CALL     SWAPP
      008D3B CD 8C B6         [ 4] 2468         CALL     CMOVE
      008D3E CD 85 C4         [ 4] 2469         CALL     RFROM
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      008D41 81               [ 4] 2470         RET
                                   2471 
                                   2472 ;; Numeric output, single precision
                                   2473 
                                   2474 ;       DIGIT   ( u -- c )
                                   2475 ;       Convert digit u to a character.
      008D42 8D 23                 2476         .word      LINK
                           000CC4  2477 LINK = . 
      008D44 05                    2478         .byte      5
      008D45 44 49 47 49 54        2479         .ascii     "DIGIT"
      008D4A                       2480 DIGIT:
      008D4A CD 84 F5         [ 4] 2481         CALL	DOLIT
      008D4D 00 09                 2482         .word	9
      008D4F CD 86 44         [ 4] 2483         CALL	OVER
      008D52 CD 88 F3         [ 4] 2484         CALL	LESS
      008D55 CD 84 F5         [ 4] 2485         CALL	DOLIT
      008D58 00 07                 2486         .word	7
      008D5A CD 86 66         [ 4] 2487         CALL	ANDD
      008D5D CD 88 15         [ 4] 2488         CALL	PLUS
      008D60 CD 84 F5         [ 4] 2489         CALL	DOLIT
      008D63 00 30                 2490         .word	48	;'0'
      008D65 CC 88 15         [ 2] 2491         JP	PLUS
                                   2492 
                                   2493 ;       EXTRACT ( n base -- n c )
                                   2494 ;       Extract least significant digit from n.
      008D68 8D 44                 2495         .word      LINK
                           000CEA  2496 LINK = . 
      008D6A 07                    2497         .byte      7
      008D6B 45 58 54 52 41 43 54  2498         .ascii     "EXTRACT"
      008D72                       2499 EXTRC:
      008D72 CD 8B 7B         [ 4] 2500         CALL     ZERO
      008D75 CD 86 2A         [ 4] 2501         CALL     SWAPP
      008D78 CD 89 6B         [ 4] 2502         CALL     UMMOD
      008D7B CD 86 2A         [ 4] 2503         CALL     SWAPP
      008D7E CC 8D 4A         [ 2] 2504         JP     DIGIT
                                   2505 
                                   2506 ;       <#      ( -- )
                                   2507 ;       Initiate  numeric output process.
      008D81 8D 6A                 2508         .word      LINK
                           000D03  2509 LINK = . 
      008D83 02                    2510         .byte      2
      008D84 3C 23                 2511         .ascii     "<#"
      008D86                       2512 BDIGS:
      008D86 CD 8C 7A         [ 4] 2513         CALL     PAD
      008D89 CD 87 47         [ 4] 2514         CALL     HLD
      008D8C CC 85 5C         [ 2] 2515         JP     STORE
                                   2516 
                                   2517 ;       HOLD    ( c -- )
                                   2518 ;       Insert a character into output string.
      008D8F 8D 83                 2519         .word      LINK
                           000D11  2520 LINK = . 
      008D91 04                    2521         .byte      4
      008D92 48 4F 4C 44           2522         .ascii     "HOLD"
      008D96                       2523 HOLD:
      008D96 CD 87 47         [ 4] 2524         CALL     HLD
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



      008D99 CD 85 73         [ 4] 2525         CALL     AT
      008D9C CD 8B 1C         [ 4] 2526         CALL     ONEM
      008D9F CD 86 1A         [ 4] 2527         CALL     DUPP
      008DA2 CD 87 47         [ 4] 2528         CALL     HLD
      008DA5 CD 85 5C         [ 4] 2529         CALL     STORE
      008DA8 CC 85 80         [ 2] 2530         JP     CSTOR
                                   2531 
                                   2532 ;       #       ( u -- u )
                                   2533 ;       Extract one digit from u and
                                   2534 ;       append digit to output string.
      008DAB 8D 91                 2535         .word      LINK
                           000D2D  2536 LINK = . 
      008DAD 01                    2537         .byte      1
      008DAE 23                    2538         .ascii     "#"
      008DAF                       2539 DIG:
      008DAF CD 86 D7         [ 4] 2540         CALL     BASE
      008DB2 CD 85 73         [ 4] 2541         CALL     AT
      008DB5 CD 8D 72         [ 4] 2542         CALL     EXTRC
      008DB8 CC 8D 96         [ 2] 2543         JP     HOLD
                                   2544 
                                   2545 ;       #S      ( u -- 0 )
                                   2546 ;       Convert u until all digits
                                   2547 ;       are added to output string.
      008DBB 8D AD                 2548         .word      LINK
                           000D3D  2549 LINK = . 
      008DBD 02                    2550         .byte      2
      008DBE 23 53                 2551         .ascii     "#S"
      008DC0                       2552 DIGS:
      008DC0 CD 8D AF         [ 4] 2553 DIGS1:  CALL     DIG
      008DC3 CD 86 1A         [ 4] 2554         CALL     DUPP
      008DC6 CD 85 28         [ 4] 2555         CALL     QBRAN
      008DC9 8D CD                 2556         .word      DIGS2
      008DCB 20 F3            [ 2] 2557         JRA     DIGS1
      008DCD 81               [ 4] 2558 DIGS2:  RET
                                   2559 
                                   2560 ;       SIGN    ( n -- )
                                   2561 ;       Add a minus sign to
                                   2562 ;       numeric output string.
      008DCE 8D BD                 2563         .word      LINK
                           000D50  2564 LINK = . 
      008DD0 04                    2565         .byte      4
      008DD1 53 49 47 4E           2566         .ascii     "SIGN"
      008DD5                       2567 SIGN:
      008DD5 CD 86 53         [ 4] 2568         CALL     ZLESS
      008DD8 CD 85 28         [ 4] 2569         CALL     QBRAN
      008DDB 8D E5                 2570         .word      SIGN1
      008DDD CD 84 F5         [ 4] 2571         CALL     DOLIT
      008DE0 00 2D                 2572         .word      45	;"-"
      008DE2 CC 8D 96         [ 2] 2573         JP     HOLD
      008DE5 81               [ 4] 2574 SIGN1:  RET
                                   2575 
                                   2576 ;       #>      ( w -- b u )
                                   2577 ;       Prepare output string.
      008DE6 8D D0                 2578         .word      LINK
                           000D68  2579 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      008DE8 02                    2580         .byte      2
      008DE9 23 3E                 2581         .ascii     "#>"
      008DEB                       2582 EDIGS:
      008DEB CD 86 10         [ 4] 2583         CALL     DROP
      008DEE CD 87 47         [ 4] 2584         CALL     HLD
      008DF1 CD 85 73         [ 4] 2585         CALL     AT
      008DF4 CD 8C 7A         [ 4] 2586         CALL     PAD
      008DF7 CD 86 44         [ 4] 2587         CALL     OVER
      008DFA CC 88 8E         [ 2] 2588         JP     SUBB
                                   2589 
                                   2590 ;       str     ( w -- b u )
                                   2591 ;       Convert a signed integer
                                   2592 ;       to a numeric string.
      008DFD 8D E8                 2593         .word      LINK
                           000D7F  2594 LINK = . 
      008DFF 03                    2595         .byte      3
      008E00 53 54 52              2596         .ascii     "STR"
      008E03                       2597 STR:
      008E03 CD 86 1A         [ 4] 2598         CALL     DUPP
      008E06 CD 85 E3         [ 4] 2599         CALL     TOR
      008E09 CD 88 A8         [ 4] 2600         CALL     ABSS
      008E0C CD 8D 86         [ 4] 2601         CALL     BDIGS
      008E0F CD 8D C0         [ 4] 2602         CALL     DIGS
      008E12 CD 85 C4         [ 4] 2603         CALL     RFROM
      008E15 CD 8D D5         [ 4] 2604         CALL     SIGN
      008E18 CC 8D EB         [ 2] 2605         JP     EDIGS
                                   2606 
                                   2607 ;       HEX     ( -- )
                                   2608 ;       Use radix 16 as base for
                                   2609 ;       numeric conversions.
      008E1B 8D FF                 2610         .word      LINK
                           000D9D  2611 LINK = . 
      008E1D 03                    2612         .byte      3
      008E1E 48 45 58              2613         .ascii     "HEX"
      008E21                       2614 HEX:
      008E21 CD 84 F5         [ 4] 2615         CALL     DOLIT
      008E24 00 10                 2616         .word      16
      008E26 CD 86 D7         [ 4] 2617         CALL     BASE
      008E29 CC 85 5C         [ 2] 2618         JP     STORE
                                   2619 
                                   2620 ;       DECIMAL ( -- )
                                   2621 ;       Use radix 10 as base
                                   2622 ;       for numeric conversions.
      008E2C 8E 1D                 2623         .word      LINK
                           000DAE  2624 LINK = . 
      008E2E 07                    2625         .byte      7
      008E2F 44 45 43 49 4D 41 4C  2626         .ascii     "DECIMAL"
      008E36                       2627 DECIM:
      008E36 CD 84 F5         [ 4] 2628         CALL     DOLIT
      008E39 00 0A                 2629         .word      10
      008E3B CD 86 D7         [ 4] 2630         CALL     BASE
      008E3E CC 85 5C         [ 2] 2631         JP     STORE
                                   2632 
                                   2633 ;; Numeric input, single precision
                                   2634 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



                                   2635 ;       DIGIT?  ( c base -- u t )
                                   2636 ;       Convert a character to its numeric
                                   2637 ;       value. A flag indicates success.
      008E41 8E 2E                 2638         .word      LINK
                           000DC3  2639 LINK = . 
      008E43 06                    2640         .byte       6
      008E44 44 49 47 49 54 3F     2641         .ascii     "DIGIT?"
      008E4A                       2642 DIGTQ:
      008E4A CD 85 E3         [ 4] 2643         CALL     TOR
      008E4D CD 84 F5         [ 4] 2644         CALL     DOLIT
      008E50 00 30                 2645         .word     48	; "0"
      008E52 CD 88 8E         [ 4] 2646         CALL     SUBB
      008E55 CD 84 F5         [ 4] 2647         CALL     DOLIT
      008E58 00 09                 2648         .word      9
      008E5A CD 86 44         [ 4] 2649         CALL     OVER
      008E5D CD 88 F3         [ 4] 2650         CALL     LESS
      008E60 CD 85 28         [ 4] 2651         CALL     QBRAN
      008E63 8E 7B                 2652         .word      DGTQ1
      008E65 CD 84 F5         [ 4] 2653         CALL     DOLIT
      008E68 00 07                 2654         .word      7
      008E6A CD 88 8E         [ 4] 2655         CALL     SUBB
      008E6D CD 86 1A         [ 4] 2656         CALL     DUPP
      008E70 CD 84 F5         [ 4] 2657         CALL     DOLIT
      008E73 00 0A                 2658         .word      10
      008E75 CD 88 F3         [ 4] 2659         CALL     LESS
      008E78 CD 86 7A         [ 4] 2660         CALL     ORR
      008E7B CD 86 1A         [ 4] 2661 DGTQ1:  CALL     DUPP
      008E7E CD 85 C4         [ 4] 2662         CALL     RFROM
      008E81 CC 88 D5         [ 2] 2663         JP     ULESS
                                   2664 
                                   2665 ;       NUMBER? ( a -- n T | a F )
                                   2666 ;       Convert a number string to
                                   2667 ;       integer. Push a flag on tos.
      008E84 8E 43                 2668         .word      LINK
                           000E06  2669 LINK = . 
      008E86 07                    2670         .byte      7
      008E87 4E 55 4D 42 45 52 3F  2671         .ascii     "NUMBER?"
      008E8E                       2672 NUMBQ:
      008E8E CD 86 D7         [ 4] 2673         CALL     BASE
      008E91 CD 85 73         [ 4] 2674         CALL     AT
      008E94 CD 85 E3         [ 4] 2675         CALL     TOR
      008E97 CD 8B 7B         [ 4] 2676         CALL     ZERO
      008E9A CD 86 44         [ 4] 2677         CALL     OVER
      008E9D CD 8C 52         [ 4] 2678         CALL     COUNT
      008EA0 CD 86 44         [ 4] 2679         CALL     OVER
      008EA3 CD 85 91         [ 4] 2680         CALL     CAT
      008EA6 CD 84 F5         [ 4] 2681         CALL     DOLIT
      008EA9 00 24                 2682         .word     36	; "0x"
      008EAB CD 88 B6         [ 4] 2683         CALL     EQUAL
      008EAE CD 85 28         [ 4] 2684         CALL     QBRAN
      008EB1 8E C2                 2685         .word      NUMQ1
      008EB3 CD 8E 21         [ 4] 2686         CALL     HEX
      008EB6 CD 86 2A         [ 4] 2687         CALL     SWAPP
      008EB9 CD 8B 0F         [ 4] 2688         CALL     ONEP
      008EBC CD 86 2A         [ 4] 2689         CALL     SWAPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



      008EBF CD 8B 1C         [ 4] 2690         CALL     ONEM
      008EC2 CD 86 44         [ 4] 2691 NUMQ1:  CALL     OVER
      008EC5 CD 85 91         [ 4] 2692         CALL     CAT
      008EC8 CD 84 F5         [ 4] 2693         CALL     DOLIT
      008ECB 00 2D                 2694         .word     45	; "-"
      008ECD CD 88 B6         [ 4] 2695         CALL     EQUAL
      008ED0 CD 85 E3         [ 4] 2696         CALL     TOR
      008ED3 CD 86 2A         [ 4] 2697         CALL     SWAPP
      008ED6 CD 85 D7         [ 4] 2698         CALL     RAT
      008ED9 CD 88 8E         [ 4] 2699         CALL     SUBB
      008EDC CD 86 2A         [ 4] 2700         CALL     SWAPP
      008EDF CD 85 D7         [ 4] 2701         CALL     RAT
      008EE2 CD 88 15         [ 4] 2702         CALL     PLUS
      008EE5 CD 87 C4         [ 4] 2703         CALL     QDUP
      008EE8 CD 85 28         [ 4] 2704         CALL     QBRAN
      008EEB 8F 4C                 2705         .word      NUMQ6
      008EED CD 8B 1C         [ 4] 2706         CALL     ONEM
      008EF0 CD 85 E3         [ 4] 2707         CALL     TOR
      008EF3 CD 86 1A         [ 4] 2708 NUMQ2:  CALL     DUPP
      008EF6 CD 85 E3         [ 4] 2709         CALL     TOR
      008EF9 CD 85 91         [ 4] 2710         CALL     CAT
      008EFC CD 86 D7         [ 4] 2711         CALL     BASE
      008EFF CD 85 73         [ 4] 2712         CALL     AT
      008F02 CD 8E 4A         [ 4] 2713         CALL     DIGTQ
      008F05 CD 85 28         [ 4] 2714         CALL     QBRAN
      008F08 8F 3A                 2715         .word      NUMQ4
      008F0A CD 86 2A         [ 4] 2716         CALL     SWAPP
      008F0D CD 86 D7         [ 4] 2717         CALL     BASE
      008F10 CD 85 73         [ 4] 2718         CALL     AT
      008F13 CD 8A 8E         [ 4] 2719         CALL     STAR
      008F16 CD 88 15         [ 4] 2720         CALL     PLUS
      008F19 CD 85 C4         [ 4] 2721         CALL     RFROM
      008F1C CD 8B 0F         [ 4] 2722         CALL     ONEP
      008F1F CD 85 09         [ 4] 2723         CALL     DONXT
      008F22 8E F3                 2724         .word      NUMQ2
      008F24 CD 85 D7         [ 4] 2725         CALL     RAT
      008F27 CD 86 2A         [ 4] 2726         CALL     SWAPP
      008F2A CD 86 10         [ 4] 2727         CALL     DROP
      008F2D CD 85 28         [ 4] 2728         CALL     QBRAN
      008F30 8F 35                 2729         .word      NUMQ3
      008F32 CD 88 40         [ 4] 2730         CALL     NEGAT
      008F35 CD 86 2A         [ 4] 2731 NUMQ3:  CALL     SWAPP
      008F38 20 0F            [ 2] 2732         JRA     NUMQ5
      008F3A CD 85 C4         [ 4] 2733 NUMQ4:  CALL     RFROM
      008F3D CD 85 C4         [ 4] 2734         CALL     RFROM
      008F40 CD 87 F5         [ 4] 2735         CALL     DDROP
      008F43 CD 87 F5         [ 4] 2736         CALL     DDROP
      008F46 CD 8B 7B         [ 4] 2737         CALL     ZERO
      008F49 CD 86 1A         [ 4] 2738 NUMQ5:  CALL     DUPP
      008F4C CD 85 C4         [ 4] 2739 NUMQ6:  CALL     RFROM
      008F4F CD 87 F5         [ 4] 2740         CALL     DDROP
      008F52 CD 85 C4         [ 4] 2741         CALL     RFROM
      008F55 CD 86 D7         [ 4] 2742         CALL     BASE
      008F58 CC 85 5C         [ 2] 2743         JP     STORE
                                   2744 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



                                   2745 ;; Basic I/O
                                   2746 
                                   2747 ;       KEY     ( -- c )
                                   2748 ;       Wait for and return an
                                   2749 ;       input character.
      008F5B 8E 86                 2750         .word      LINK
                           000EDD  2751 LINK = . 
      008F5D 03                    2752         .byte      3
      008F5E 4B 45 59              2753         .ascii     "KEY"
      008F61                       2754 KEY:
      008F61 72 0B 52 30 FB   [ 2] 2755         btjf UART_SR,#UART_SR_RXNE,. 
      008F66 C6 52 31         [ 1] 2756         ld a,UART_DR 
      008F69 1D 00 02         [ 2] 2757         subw x,#CELLL 
      008F6C E7 01            [ 1] 2758         ld (1,x),a 
      008F6E 7F               [ 1] 2759         clr (x)
      008F6F 81               [ 4] 2760         ret 
                                   2761 
                                   2762 ;       NUF?    ( -- t )
                                   2763 ;       Return false if no input,
                                   2764 ;       else pause and if CR return true.
      008F70 8F 5D                 2765         .word      LINK
                           000EF2  2766 LINK = . 
      008F72 04                    2767         .byte      4
      008F73 4E 55 46 3F           2768         .ascii     "NUF?"
      008F77                       2769 NUFQ:
      008F77 CD 84 96         [ 4] 2770         CALL     QKEY
      008F7A CD 86 1A         [ 4] 2771         CALL     DUPP
      008F7D CD 85 28         [ 4] 2772         CALL     QBRAN
      008F80 8F 90                 2773         .word    NUFQ1
      008F82 CD 87 F5         [ 4] 2774         CALL     DDROP
      008F85 CD 8F 61         [ 4] 2775         CALL     KEY
      008F88 CD 84 F5         [ 4] 2776         CALL     DOLIT
      008F8B 00 0D                 2777         .word      CRR
      008F8D CC 88 B6         [ 2] 2778         JP     EQUAL
      008F90 81               [ 4] 2779 NUFQ1:  RET
                                   2780 
                                   2781 ;       SPACE   ( -- )
                                   2782 ;       Send  blank character to
                                   2783 ;       output device.
      008F91 8F 72                 2784         .word      LINK
                           000F13  2785 LINK = . 
      008F93 05                    2786         .byte      5
      008F94 53 50 41 43 45        2787         .ascii     "SPACE"
      008F99                       2788 SPACE:
      008F99 CD 8B 6E         [ 4] 2789         CALL     BLANK
      008F9C CC 84 B4         [ 2] 2790         JP     EMIT
                                   2791 
                                   2792 ;       SPACES  ( +n -- )
                                   2793 ;       Send n spaces to output device.
      008F9F 8F 93                 2794         .word      LINK
                           000F21  2795 LINK = . 
      008FA1 06                    2796         .byte      6
      008FA2 53 50 41 43 45 53     2797         .ascii     "SPACES"
      008FA8                       2798 SPACS:
      008FA8 CD 8B 7B         [ 4] 2799         CALL     ZERO
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



      008FAB CD 89 13         [ 4] 2800         CALL     MAX
      008FAE CD 85 E3         [ 4] 2801         CALL     TOR
      008FB1 20 03            [ 2] 2802         JRA      CHAR2
      008FB3 CD 8F 99         [ 4] 2803 CHAR1:  CALL     SPACE
      008FB6 CD 85 09         [ 4] 2804 CHAR2:  CALL     DONXT
      008FB9 8F B3                 2805         .word    CHAR1
      008FBB 81               [ 4] 2806         RET
                                   2807 
                                   2808 ;       TYPE    ( b u -- )
                                   2809 ;       Output u characters from b.
      008FBC 8F A1                 2810         .word      LINK
                           000F3E  2811 LINK = . 
      008FBE 04                    2812         .byte      4
      008FBF 54 59 50 45           2813         .ascii     "TYPE"
      008FC3                       2814 TYPES:
      008FC3 CD 85 E3         [ 4] 2815         CALL     TOR
      008FC6 20 0C            [ 2] 2816         JRA     TYPE2
      008FC8 CD 86 1A         [ 4] 2817 TYPE1:  CALL     DUPP
      008FCB CD 85 91         [ 4] 2818         CALL     CAT
      008FCE CD 84 B4         [ 4] 2819         CALL     EMIT
      008FD1 CD 8B 0F         [ 4] 2820         CALL     ONEP
      008FD4 CD 85 09         [ 4] 2821 TYPE2:  CALL     DONXT
      008FD7 8F C8                 2822         .word      TYPE1
      008FD9 CC 86 10         [ 2] 2823         JP     DROP
                                   2824 
                                   2825 ;       CR      ( -- )
                                   2826 ;       Output a carriage return
                                   2827 ;       and a line feed.
      008FDC 8F BE                 2828         .word      LINK
                           000F5E  2829 LINK = . 
      008FDE 02                    2830         .byte      2
      008FDF 43 52                 2831         .ascii     "CR"
      008FE1                       2832 CR:
      008FE1 CD 84 F5         [ 4] 2833         CALL     DOLIT
      008FE4 00 0D                 2834         .word      CRR
      008FE6 CD 84 B4         [ 4] 2835         CALL     EMIT
      008FE9 CD 84 F5         [ 4] 2836         CALL     DOLIT
      008FEC 00 0A                 2837         .word      LF
      008FEE CC 84 B4         [ 2] 2838         JP     EMIT
                                   2839 
                                   2840 ;       do$     ( -- a )
                                   2841 ;       Return  address of a compiled
                                   2842 ;       string.
      008FF1 8F DE                 2843         .word      LINK
                           000F73  2844 LINK = . 
      008FF3 43                    2845 	.byte      COMPO+3
      008FF4 44 4F 24              2846         .ascii     "DO$"
      008FF7                       2847 DOSTR:
      008FF7 CD 85 C4         [ 4] 2848         CALL     RFROM
      008FFA CD 85 D7         [ 4] 2849         CALL     RAT
      008FFD CD 85 C4         [ 4] 2850         CALL     RFROM
      009000 CD 8C 52         [ 4] 2851         CALL     COUNT
      009003 CD 88 15         [ 4] 2852         CALL     PLUS
      009006 CD 85 E3         [ 4] 2853         CALL     TOR
      009009 CD 86 2A         [ 4] 2854         CALL     SWAPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



      00900C CD 85 E3         [ 4] 2855         CALL     TOR
      00900F 81               [ 4] 2856         RET
                                   2857 
                                   2858 ;       $"|     ( -- a )
                                   2859 ;       Run time routine compiled by $".
                                   2860 ;       Return address of a compiled string.
      009010 8F F3                 2861         .word      LINK
                           000F92  2862 LINK = . 
      009012 43                    2863 	.byte      COMPO+3
      009013 24 22 7C              2864         .byte     '$','"','|'
      009016                       2865 STRQP:
      009016 CD 8F F7         [ 4] 2866         CALL     DOSTR
      009019 81               [ 4] 2867         RET
                                   2868 
                                   2869 ;       ."|     ( -- )
                                   2870 ;       Run time routine of ." .
                                   2871 ;       Output a compiled string.
      00901A 90 12                 2872         .word      LINK
                           000F9C  2873 LINK = . 
      00901C 43                    2874 	.byte      COMPO+3
      00901D 2E 22 7C              2875         .byte     '.','"','|'
      009020                       2876 DOTQP:
      009020 CD 8F F7         [ 4] 2877         CALL     DOSTR
      009023 CD 8C 52         [ 4] 2878         CALL     COUNT
      009026 CC 8F C3         [ 2] 2879         JP     TYPES
                                   2880 
                                   2881 ;       .R      ( n +n -- )
                                   2882 ;       Display an integer in a field
                                   2883 ;       of n columns, right justified.
      009029 90 1C                 2884         .word      LINK
                           000FAB  2885 LINK = . 
      00902B 02                    2886         .byte      2
      00902C 2E 52                 2887         .ascii     ".R"
      00902E                       2888 DOTR:
      00902E CD 85 E3         [ 4] 2889         CALL     TOR
      009031 CD 8E 03         [ 4] 2890         CALL     STR
      009034 CD 85 C4         [ 4] 2891         CALL     RFROM
      009037 CD 86 44         [ 4] 2892         CALL     OVER
      00903A CD 88 8E         [ 4] 2893         CALL     SUBB
      00903D CD 8F A8         [ 4] 2894         CALL     SPACS
      009040 CC 8F C3         [ 2] 2895         JP     TYPES
                                   2896 
                                   2897 ;       U.R     ( u +n -- )
                                   2898 ;       Display an unsigned integer
                                   2899 ;       in n column, right justified.
      009043 90 2B                 2900         .word      LINK
                           000FC5  2901 LINK = . 
      009045 03                    2902         .byte      3
      009046 55 2E 52              2903         .ascii     "U.R"
      009049                       2904 UDOTR:
      009049 CD 85 E3         [ 4] 2905         CALL     TOR
      00904C CD 8D 86         [ 4] 2906         CALL     BDIGS
      00904F CD 8D C0         [ 4] 2907         CALL     DIGS
      009052 CD 8D EB         [ 4] 2908         CALL     EDIGS
      009055 CD 85 C4         [ 4] 2909         CALL     RFROM
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      009058 CD 86 44         [ 4] 2910         CALL     OVER
      00905B CD 88 8E         [ 4] 2911         CALL     SUBB
      00905E CD 8F A8         [ 4] 2912         CALL     SPACS
      009061 CC 8F C3         [ 2] 2913         JP     TYPES
                                   2914 
                                   2915 ;       U.      ( u -- )
                                   2916 ;       Display an unsigned integer
                                   2917 ;       in free format.
      009064 90 45                 2918         .word      LINK
                           000FE6  2919 LINK = . 
      009066 02                    2920         .byte      2
      009067 55 2E                 2921         .ascii     "U."
      009069                       2922 UDOT:
      009069 CD 8D 86         [ 4] 2923         CALL     BDIGS
      00906C CD 8D C0         [ 4] 2924         CALL     DIGS
      00906F CD 8D EB         [ 4] 2925         CALL     EDIGS
      009072 CD 8F 99         [ 4] 2926         CALL     SPACE
      009075 CC 8F C3         [ 2] 2927         JP     TYPES
                                   2928 
                                   2929 ;       .       ( w -- )
                                   2930 ;       Display an integer in free
                                   2931 ;       format, preceeded by a space.
      009078 90 66                 2932         .word      LINK
                           000FFA  2933 LINK = . 
      00907A 01                    2934         .byte      1
      00907B 2E                    2935         .ascii     "."
      00907C                       2936 DOT:
      00907C CD 86 D7         [ 4] 2937         CALL     BASE
      00907F CD 85 73         [ 4] 2938         CALL     AT
      009082 CD 84 F5         [ 4] 2939         CALL     DOLIT
      009085 00 0A                 2940         .word      10
      009087 CD 86 8F         [ 4] 2941         CALL     XORR    ;?decimal
      00908A CD 85 28         [ 4] 2942         CALL     QBRAN
      00908D 90 92                 2943         .word      DOT1
      00908F CC 90 69         [ 2] 2944         JP     UDOT
      009092 CD 8E 03         [ 4] 2945 DOT1:   CALL     STR
      009095 CD 8F 99         [ 4] 2946         CALL     SPACE
      009098 CC 8F C3         [ 2] 2947         JP     TYPES
                                   2948 
                                   2949 ;       ?       ( a -- )
                                   2950 ;       Display contents in memory cell.
      00909B 90 7A                 2951         .word      LINK
                                   2952         
                           00101D  2953 LINK = . 
      00909D 01                    2954         .byte      1
      00909E 3F                    2955         .ascii     "?"
      00909F                       2956 QUEST:
      00909F CD 85 73         [ 4] 2957         CALL     AT
      0090A2 CC 90 7C         [ 2] 2958         JP     DOT
                                   2959 
                                   2960 ;; Parsing
                                   2961 
                                   2962 ;       parse   ( b u c -- b u delta ; <string> )
                                   2963 ;       Scan string delimited by c.
                                   2964 ;       Return found string and its offset.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      0090A5 90 9D                 2965         .word      LINK
                           001027  2966 LINK = . 
      0090A7 05                    2967         .byte      5
      0090A8 70 61 72 73 65        2968         .ascii     "parse"
      0090AD                       2969 PARS:
      0090AD CD 86 E6         [ 4] 2970         CALL     TEMP
      0090B0 CD 85 5C         [ 4] 2971         CALL     STORE
      0090B3 CD 86 44         [ 4] 2972         CALL     OVER
      0090B6 CD 85 E3         [ 4] 2973         CALL     TOR
      0090B9 CD 86 1A         [ 4] 2974         CALL     DUPP
      0090BC CD 85 28         [ 4] 2975         CALL     QBRAN
      0090BF 91 65                 2976         .word    PARS8
      0090C1 CD 8B 1C         [ 4] 2977         CALL     ONEM
      0090C4 CD 86 E6         [ 4] 2978         CALL     TEMP
      0090C7 CD 85 73         [ 4] 2979         CALL     AT
      0090CA CD 8B 6E         [ 4] 2980         CALL     BLANK
      0090CD CD 88 B6         [ 4] 2981         CALL     EQUAL
      0090D0 CD 85 28         [ 4] 2982         CALL     QBRAN
      0090D3 91 06                 2983         .word      PARS3
      0090D5 CD 85 E3         [ 4] 2984         CALL     TOR
      0090D8 CD 8B 6E         [ 4] 2985 PARS1:  CALL     BLANK
      0090DB CD 86 44         [ 4] 2986         CALL     OVER
      0090DE CD 85 91         [ 4] 2987         CALL     CAT     ;skip leading blanks ONLY
      0090E1 CD 88 8E         [ 4] 2988         CALL     SUBB
      0090E4 CD 86 53         [ 4] 2989         CALL     ZLESS
      0090E7 CD 88 2F         [ 4] 2990         CALL     INVER
      0090EA CD 85 28         [ 4] 2991         CALL     QBRAN
      0090ED 91 03                 2992         .word      PARS2
      0090EF CD 8B 0F         [ 4] 2993         CALL     ONEP
      0090F2 CD 85 09         [ 4] 2994         CALL     DONXT
      0090F5 90 D8                 2995         .word      PARS1
      0090F7 CD 85 C4         [ 4] 2996         CALL     RFROM
      0090FA CD 86 10         [ 4] 2997         CALL     DROP
      0090FD CD 8B 7B         [ 4] 2998         CALL     ZERO
      009100 CC 86 1A         [ 2] 2999         JP     DUPP
      009103 CD 85 C4         [ 4] 3000 PARS2:  CALL     RFROM
      009106 CD 86 44         [ 4] 3001 PARS3:  CALL     OVER
      009109 CD 86 2A         [ 4] 3002         CALL     SWAPP
      00910C CD 85 E3         [ 4] 3003         CALL     TOR
      00910F CD 86 E6         [ 4] 3004 PARS4:  CALL     TEMP
      009112 CD 85 73         [ 4] 3005         CALL     AT
      009115 CD 86 44         [ 4] 3006         CALL     OVER
      009118 CD 85 91         [ 4] 3007         CALL     CAT
      00911B CD 88 8E         [ 4] 3008         CALL     SUBB    ;scan for delimiter
      00911E CD 86 E6         [ 4] 3009         CALL     TEMP
      009121 CD 85 73         [ 4] 3010         CALL     AT
      009124 CD 8B 6E         [ 4] 3011         CALL     BLANK
      009127 CD 88 B6         [ 4] 3012         CALL     EQUAL
      00912A CD 85 28         [ 4] 3013         CALL     QBRAN
      00912D 91 32                 3014         .word      PARS5
      00912F CD 86 53         [ 4] 3015         CALL     ZLESS
      009132 CD 85 28         [ 4] 3016 PARS5:  CALL     QBRAN
      009135 91 47                 3017         .word      PARS6
      009137 CD 8B 0F         [ 4] 3018         CALL     ONEP
      00913A CD 85 09         [ 4] 3019         CALL     DONXT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      00913D 91 0F                 3020         .word      PARS4
      00913F CD 86 1A         [ 4] 3021         CALL     DUPP
      009142 CD 85 E3         [ 4] 3022         CALL     TOR
      009145 20 0F            [ 2] 3023         JRA     PARS7
      009147 CD 85 C4         [ 4] 3024 PARS6:  CALL     RFROM
      00914A CD 86 10         [ 4] 3025         CALL     DROP
      00914D CD 86 1A         [ 4] 3026         CALL     DUPP
      009150 CD 8B 0F         [ 4] 3027         CALL     ONEP
      009153 CD 85 E3         [ 4] 3028         CALL     TOR
      009156 CD 86 44         [ 4] 3029 PARS7:  CALL     OVER
      009159 CD 88 8E         [ 4] 3030         CALL     SUBB
      00915C CD 85 C4         [ 4] 3031         CALL     RFROM
      00915F CD 85 C4         [ 4] 3032         CALL     RFROM
      009162 CC 88 8E         [ 2] 3033         JP     SUBB
      009165 CD 86 44         [ 4] 3034 PARS8:  CALL     OVER
      009168 CD 85 C4         [ 4] 3035         CALL     RFROM
      00916B CC 88 8E         [ 2] 3036         JP     SUBB
                                   3037 
                                   3038 ;       PARSE   ( c -- b u ; <string> )
                                   3039 ;       Scan input stream and return
                                   3040 ;       counted string delimited by c.
      00916E 90 A7                 3041         .word      LINK
                           0010F0  3042 LINK = . 
      009170 05                    3043         .byte      5
      009171 50 41 52 53 45        3044         .ascii     "PARSE"
      009176                       3045 PARSE:
      009176 CD 85 E3         [ 4] 3046         CALL     TOR
      009179 CD 8C 8B         [ 4] 3047         CALL     TIB
      00917C CD 86 F5         [ 4] 3048         CALL     INN
      00917F CD 85 73         [ 4] 3049         CALL     AT
      009182 CD 88 15         [ 4] 3050         CALL     PLUS    ;current input buffer pointer
      009185 CD 87 05         [ 4] 3051         CALL     NTIB
      009188 CD 85 73         [ 4] 3052         CALL     AT
      00918B CD 86 F5         [ 4] 3053         CALL     INN
      00918E CD 85 73         [ 4] 3054         CALL     AT
      009191 CD 88 8E         [ 4] 3055         CALL     SUBB    ;remaining count
      009194 CD 85 C4         [ 4] 3056         CALL     RFROM
      009197 CD 90 AD         [ 4] 3057         CALL     PARS
      00919A CD 86 F5         [ 4] 3058         CALL     INN
      00919D CC 8B EB         [ 2] 3059         JP     PSTOR
                                   3060 
                                   3061 ;       .(      ( -- )
                                   3062 ;       Output following string up to next ) .
      0091A0 91 70                 3063         .word      LINK
                           001122  3064 LINK = . 
      0091A2 82                    3065 	.byte      IMEDD+2
      0091A3 2E 28                 3066         .ascii     ".("
      0091A5                       3067 DOTPR:
      0091A5 CD 84 F5         [ 4] 3068         CALL     DOLIT
      0091A8 00 29                 3069         .word     41	; ")"
      0091AA CD 91 76         [ 4] 3070         CALL     PARSE
      0091AD CC 8F C3         [ 2] 3071         JP     TYPES
                                   3072 
                                   3073 ;       (       ( -- )
                                   3074 ;       Ignore following string up to next ).
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



                                   3075 ;       A comment.
      0091B0 91 A2                 3076         .word      LINK
                           001132  3077 LINK = . 
      0091B2 81                    3078 	.byte      IMEDD+1
      0091B3 28                    3079         .ascii     "("
      0091B4                       3080 PAREN:
      0091B4 CD 84 F5         [ 4] 3081         CALL     DOLIT
      0091B7 00 29                 3082         .word     41	; ")"
      0091B9 CD 91 76         [ 4] 3083         CALL     PARSE
      0091BC CC 87 F5         [ 2] 3084         JP     DDROP
                                   3085 
                                   3086 ;       \       ( -- )
                                   3087 ;       Ignore following text till
                                   3088 ;       end of line.
      0091BF 91 B2                 3089         .word      LINK
                           001141  3090 LINK = . 
      0091C1 81                    3091 	.byte      IMEDD+1
      0091C2 5C                    3092         .ascii     "\"
      0091C3                       3093 BKSLA:
      0091C3 90 AE 00 0C      [ 2] 3094         ldw y,#UCTIB ; #TIB  
      0091C7 90 FE            [ 2] 3095         ldw y,(y)
      0091C9 90 89            [ 2] 3096         pushw y ; count in TIB 
      0091CB 90 AE 00 0A      [ 2] 3097         ldw y,#UINN ; >IN 
      0091CF 90 BF 24         [ 2] 3098         ldw YTEMP,y
      0091D2 90 85            [ 2] 3099         popw y 
      0091D4 91 CF 24         [ 5] 3100         ldw [YTEMP],y
      0091D7 81               [ 4] 3101         ret 
                                   3102 
                                   3103 ;       WORD    ( c -- a ; <string> )
                                   3104 ;       Parse a word from input stream
                                   3105 ;       and copy it to code dictionary.
      0091D8 91 C1                 3106         .word      LINK
                           00115A  3107 LINK = . 
      0091DA 04                    3108         .byte      4
      0091DB 57 4F 52 44           3109         .ascii     "WORD"
      0091DF                       3110 WORDD:
      0091DF CD 91 76         [ 4] 3111         CALL     PARSE
      0091E2 CD 8C 69         [ 4] 3112         CALL     HERE
      0091E5 CD 8A E4         [ 4] 3113         CALL     CELLP
      0091E8 CC 8D 29         [ 2] 3114         JP     PACKS
                                   3115 
                                   3116 ;       TOKEN   ( -- a ; <string> )
                                   3117 ;       Parse a word from input stream
                                   3118 ;       and copy it to name dictionary.
      0091EB 91 DA                 3119         .word      LINK
                           00116D  3120 LINK = . 
      0091ED 05                    3121         .byte      5
      0091EE 54 4F 4B 45 4E        3122         .ascii     "TOKEN"
      0091F3                       3123 TOKEN:
      0091F3 CD 8B 6E         [ 4] 3124         CALL     BLANK
      0091F6 CC 91 DF         [ 2] 3125         JP     WORDD
                                   3126 
                                   3127 ;; Dictionary search
                                   3128 
                                   3129 ;       NAME>   ( na -- ca )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



                                   3130 ;       Return a code address given
                                   3131 ;       a name address.
      0091F9 91 ED                 3132         .word      LINK
                           00117B  3133 LINK = . 
      0091FB 05                    3134         .byte      5
      0091FC 4E 41 4D 45 3E        3135         .ascii     "NAME>"
      009201                       3136 NAMET:
      009201 CD 8C 52         [ 4] 3137         CALL     COUNT
      009204 CD 84 F5         [ 4] 3138         CALL     DOLIT
      009207 00 1F                 3139         .word      31
      009209 CD 86 66         [ 4] 3140         CALL     ANDD
      00920C CC 88 15         [ 2] 3141         JP     PLUS
                                   3142 
                                   3143 ;       SAME?   ( a a u -- a a f \ -0+ )
                                   3144 ;       Compare u cells in two
                                   3145 ;       strings. Return 0 if identical.
      00920F 91 FB                 3146         .word      LINK
                           001191  3147 LINK = . 
      009211 05                    3148         .byte       5
      009212 53 41 4D 45 3F        3149         .ascii     "SAME?"
      009217                       3150 SAMEQ:
      009217 CD 8B 1C         [ 4] 3151         CALL     ONEM
      00921A CD 85 E3         [ 4] 3152         CALL     TOR
      00921D 20 29            [ 2] 3153         JRA     SAME2
      00921F CD 86 44         [ 4] 3154 SAME1:  CALL     OVER
      009222 CD 85 D7         [ 4] 3155         CALL     RAT
      009225 CD 88 15         [ 4] 3156         CALL     PLUS
      009228 CD 85 91         [ 4] 3157         CALL     CAT
      00922B CD 86 44         [ 4] 3158         CALL     OVER
      00922E CD 85 D7         [ 4] 3159         CALL     RAT
      009231 CD 88 15         [ 4] 3160         CALL     PLUS
      009234 CD 85 91         [ 4] 3161         CALL     CAT
      009237 CD 88 8E         [ 4] 3162         CALL     SUBB
      00923A CD 87 C4         [ 4] 3163         CALL     QDUP
      00923D CD 85 28         [ 4] 3164         CALL     QBRAN
      009240 92 48                 3165         .word      SAME2
      009242 CD 85 C4         [ 4] 3166         CALL     RFROM
      009245 CC 86 10         [ 2] 3167         JP     DROP
      009248 CD 85 09         [ 4] 3168 SAME2:  CALL     DONXT
      00924B 92 1F                 3169         .word      SAME1
      00924D CC 8B 7B         [ 2] 3170         JP     ZERO
                                   3171 
                                   3172 ;       find    ( a va -- ca na | a F )
                                   3173 ;       Search vocabulary for string.
                                   3174 ;       Return ca and na if succeeded.
      009250 92 11                 3175         .word      LINK
                           0011D2  3176 LINK = . 
      009252 04                    3177         .byte      4
      009253 46 49 4E 44           3178         .ascii     "FIND"
      009257                       3179 FIND:
      009257 CD 86 2A         [ 4] 3180         CALL     SWAPP
      00925A CD 86 1A         [ 4] 3181         CALL     DUPP
      00925D CD 85 91         [ 4] 3182         CALL     CAT
      009260 CD 86 E6         [ 4] 3183         CALL     TEMP
      009263 CD 85 5C         [ 4] 3184         CALL     STORE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



      009266 CD 86 1A         [ 4] 3185         CALL     DUPP
      009269 CD 85 73         [ 4] 3186         CALL     AT
      00926C CD 85 E3         [ 4] 3187         CALL     TOR
      00926F CD 8A E4         [ 4] 3188         CALL     CELLP
      009272 CD 86 2A         [ 4] 3189         CALL     SWAPP
      009275 CD 85 73         [ 4] 3190 FIND1:  CALL     AT
      009278 CD 86 1A         [ 4] 3191         CALL     DUPP
      00927B CD 85 28         [ 4] 3192         CALL     QBRAN
      00927E 92 B4                 3193         .word      FIND6
      009280 CD 86 1A         [ 4] 3194         CALL     DUPP
      009283 CD 85 73         [ 4] 3195         CALL     AT
      009286 CD 84 F5         [ 4] 3196         CALL     DOLIT
      009289 1F 7F                 3197         .word      MASKK
      00928B CD 86 66         [ 4] 3198         CALL     ANDD
      00928E CD 85 D7         [ 4] 3199         CALL     RAT
      009291 CD 86 8F         [ 4] 3200         CALL     XORR
      009294 CD 85 28         [ 4] 3201         CALL     QBRAN
      009297 92 A3                 3202         .word      FIND2
      009299 CD 8A E4         [ 4] 3203         CALL     CELLP
      00929C CD 84 F5         [ 4] 3204         CALL     DOLIT
      00929F FF FF                 3205         .word     0xFFFF
      0092A1 20 0C            [ 2] 3206         JRA     FIND3
      0092A3 CD 8A E4         [ 4] 3207 FIND2:  CALL     CELLP
      0092A6 CD 86 E6         [ 4] 3208         CALL     TEMP
      0092A9 CD 85 73         [ 4] 3209         CALL     AT
      0092AC CD 92 17         [ 4] 3210         CALL     SAMEQ
      0092AF CD 85 3F         [ 4] 3211 FIND3:  CALL     BRAN
      0092B2 92 C3                 3212         .word      FIND4
      0092B4 CD 85 C4         [ 4] 3213 FIND6:  CALL     RFROM
      0092B7 CD 86 10         [ 4] 3214         CALL     DROP
      0092BA CD 86 2A         [ 4] 3215         CALL     SWAPP
      0092BD CD 8A F3         [ 4] 3216         CALL     CELLM
      0092C0 CC 86 2A         [ 2] 3217         JP     SWAPP
      0092C3 CD 85 28         [ 4] 3218 FIND4:  CALL     QBRAN
      0092C6 92 D0                 3219         .word      FIND5
      0092C8 CD 8A F3         [ 4] 3220         CALL     CELLM
      0092CB CD 8A F3         [ 4] 3221         CALL     CELLM
      0092CE 20 A5            [ 2] 3222         JRA     FIND1
      0092D0 CD 85 C4         [ 4] 3223 FIND5:  CALL     RFROM
      0092D3 CD 86 10         [ 4] 3224         CALL     DROP
      0092D6 CD 86 2A         [ 4] 3225         CALL     SWAPP
      0092D9 CD 86 10         [ 4] 3226         CALL     DROP
      0092DC CD 8A F3         [ 4] 3227         CALL     CELLM
      0092DF CD 86 1A         [ 4] 3228         CALL     DUPP
      0092E2 CD 92 01         [ 4] 3229         CALL     NAMET
      0092E5 CC 86 2A         [ 2] 3230         JP     SWAPP
                                   3231 
                                   3232 ;       NAME?   ( a -- ca na | a F )
                                   3233 ;       Search vocabularies for a string.
      0092E8 92 52                 3234         .word      LINK
                           00126A  3235 LINK = . 
      0092EA 05                    3236         .byte      5
      0092EB 4E 41 4D 45 3F        3237         .ascii     "NAME?"
      0092F0                       3238 NAMEQ:
      0092F0 CD 87 5A         [ 4] 3239         CALL   CNTXT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      0092F3 CC 92 57         [ 2] 3240         JP     FIND
                                   3241 
                                   3242 ;; Terminal response
                                   3243 
                                   3244 ;       ^H      ( bot eot cur -- bot eot cur )
                                   3245 ;       Backup cursor by one character.
      0092F6 92 EA                 3246         .word      LINK
                           001278  3247 LINK = . 
      0092F8 02                    3248         .byte      2
      0092F9 5E 48                 3249         .ascii     "^H"
      0092FB                       3250 BKSP:
      0092FB CD 85 E3         [ 4] 3251         CALL     TOR
      0092FE CD 86 44         [ 4] 3252         CALL     OVER
      009301 CD 85 C4         [ 4] 3253         CALL     RFROM
      009304 CD 86 2A         [ 4] 3254         CALL     SWAPP
      009307 CD 86 44         [ 4] 3255         CALL     OVER
      00930A CD 86 8F         [ 4] 3256         CALL     XORR
      00930D CD 85 28         [ 4] 3257         CALL     QBRAN
      009310 93 2B                 3258         .word      BACK1
      009312 CD 84 F5         [ 4] 3259         CALL     DOLIT
      009315 00 08                 3260         .word      BKSPP
      009317 CD 84 B4         [ 4] 3261         CALL     EMIT
      00931A CD 8B 1C         [ 4] 3262         CALL     ONEM
      00931D CD 8B 6E         [ 4] 3263         CALL     BLANK
      009320 CD 84 B4         [ 4] 3264         CALL     EMIT
      009323 CD 84 F5         [ 4] 3265         CALL     DOLIT
      009326 00 08                 3266         .word      BKSPP
      009328 CC 84 B4         [ 2] 3267         JP     EMIT
      00932B 81               [ 4] 3268 BACK1:  RET
                                   3269 
                                   3270 ;       TAP    ( bot eot cur c -- bot eot cur )
                                   3271 ;       Accept and echo key stroke
                                   3272 ;       and bump cursor.
      00932C 92 F8                 3273         .word      LINK
                           0012AE  3274 LINK = . 
      00932E 03                    3275         .byte      3
      00932F 54 41 50              3276         .ascii     "TAP"
      009332                       3277 TAP:
      009332 CD 86 1A         [ 4] 3278         CALL     DUPP
      009335 CD 84 B4         [ 4] 3279         CALL     EMIT
      009338 CD 86 44         [ 4] 3280         CALL     OVER
      00933B CD 85 80         [ 4] 3281         CALL     CSTOR
      00933E CC 8B 0F         [ 2] 3282         JP     ONEP
                                   3283 
                                   3284 ;       kTAP    ( bot eot cur c -- bot eot cur )
                                   3285 ;       Process a key stroke,
                                   3286 ;       CR,LF or backspace.
      009341 93 2E                 3287         .word      LINK
                           0012C3  3288 LINK = . 
      009343 04                    3289         .byte      4
      009344 4B 54 41 50           3290         .ascii     "KTAP"
      009348                       3291 KTAP:
      009348 CD 86 1A         [ 4] 3292         CALL     DUPP
      00934B CD 84 F5         [ 4] 3293         CALL     DOLIT
                           000001  3294 .if EOL_CR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      00934E 00 0D                 3295         .word   CRR
                           000000  3296 .else ; EOL_LF 
                                   3297         .word   LF
                                   3298 .endif 
      009350 CD 86 8F         [ 4] 3299         CALL     XORR
      009353 CD 85 28         [ 4] 3300         CALL     QBRAN
      009356 93 6E                 3301         .word      KTAP2
      009358 CD 84 F5         [ 4] 3302         CALL     DOLIT
      00935B 00 08                 3303         .word      BKSPP
      00935D CD 86 8F         [ 4] 3304         CALL     XORR
      009360 CD 85 28         [ 4] 3305         CALL     QBRAN
      009363 93 6B                 3306         .word      KTAP1
      009365 CD 8B 6E         [ 4] 3307         CALL     BLANK
      009368 CC 93 32         [ 2] 3308         JP     TAP
      00936B CC 92 FB         [ 2] 3309 KTAP1:  JP     BKSP
      00936E CD 86 10         [ 4] 3310 KTAP2:  CALL     DROP
      009371 CD 86 2A         [ 4] 3311         CALL     SWAPP
      009374 CD 86 10         [ 4] 3312         CALL     DROP
      009377 CC 86 1A         [ 2] 3313         JP     DUPP
                                   3314 
                                   3315 ;       accept  ( b u -- b u )
                                   3316 ;       Accept characters to input
                                   3317 ;       buffer. Return with actual count.
      00937A 93 43                 3318         .word      LINK
                           0012FC  3319 LINK = . 
      00937C 06                    3320         .byte      6
      00937D 41 43 43 45 50 54     3321         .ascii     "ACCEPT"
      009383                       3322 ACCEP:
      009383 CD 86 44         [ 4] 3323         CALL     OVER
      009386 CD 88 15         [ 4] 3324         CALL     PLUS
      009389 CD 86 44         [ 4] 3325         CALL     OVER
      00938C CD 88 00         [ 4] 3326 ACCP1:  CALL     DDUP
      00938F CD 86 8F         [ 4] 3327         CALL     XORR
      009392 CD 85 28         [ 4] 3328         CALL     QBRAN
      009395 93 B7                 3329         .word      ACCP4
      009397 CD 8F 61         [ 4] 3330         CALL     KEY
      00939A CD 86 1A         [ 4] 3331         CALL     DUPP
      00939D CD 8B 6E         [ 4] 3332         CALL     BLANK
      0093A0 CD 84 F5         [ 4] 3333         CALL     DOLIT
      0093A3 00 7F                 3334         .word      127
      0093A5 CD 89 50         [ 4] 3335         CALL     WITHI
      0093A8 CD 85 28         [ 4] 3336         CALL     QBRAN
      0093AB 93 B2                 3337         .word      ACCP2
      0093AD CD 93 32         [ 4] 3338         CALL     TAP
      0093B0 20 03            [ 2] 3339         JRA     ACCP3
      0093B2 CD 93 48         [ 4] 3340 ACCP2:  CALL     KTAP
      0093B5 20 D5            [ 2] 3341 ACCP3:  JRA     ACCP1
      0093B7 CD 86 10         [ 4] 3342 ACCP4:  CALL     DROP
      0093BA CD 86 44         [ 4] 3343         CALL     OVER
      0093BD CC 88 8E         [ 2] 3344         JP     SUBB
                                   3345 
                                   3346 ;       QUERY   ( -- )
                                   3347 ;       Accept input stream to
                                   3348 ;       terminal input buffer.
      0093C0 93 7C                 3349         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



                                   3350         
                           001342  3351 LINK = . 
      0093C2 05                    3352         .byte      5
      0093C3 51 55 45 52 59        3353         .ascii     "QUERY"
      0093C8                       3354 QUERY:
      0093C8 CD 8C 8B         [ 4] 3355         CALL     TIB
      0093CB CD 84 F5         [ 4] 3356         CALL     DOLIT
      0093CE 00 50                 3357         .word      80
      0093D0 CD 93 83         [ 4] 3358         CALL     ACCEP
      0093D3 CD 87 05         [ 4] 3359         CALL     NTIB
      0093D6 CD 85 5C         [ 4] 3360         CALL     STORE
      0093D9 CD 86 10         [ 4] 3361         CALL     DROP
      0093DC CD 8B 7B         [ 4] 3362         CALL     ZERO
      0093DF CD 86 F5         [ 4] 3363         CALL     INN
      0093E2 CC 85 5C         [ 2] 3364         JP     STORE
                                   3365 
                                   3366 ;       ABORT   ( -- )
                                   3367 ;       Reset data stack and
                                   3368 ;       jump to QUIT.
      0093E5 93 C2                 3369         .word      LINK
                           001367  3370 LINK = . 
      0093E7 05                    3371         .byte      5
      0093E8 41 42 4F 52 54        3372         .ascii     "ABORT"
      0093ED                       3373 ABORT:
      0093ED CD 94 E4         [ 4] 3374         CALL     PRESE
      0093F0 CC 95 01         [ 2] 3375         JP     QUIT
                                   3376 
                                   3377 ;       abort"  ( f -- )
                                   3378 ;       Run time routine of ABORT".
                                   3379 ;       Abort with a message.
      0093F3 93 E7                 3380         .word      LINK
                           001375  3381 LINK = . 
      0093F5 46                    3382 	.byte      COMPO+6
      0093F6 41 42 4F 52 54        3383         .ascii     "ABORT"
      0093FB 22                    3384         .byte      '"'
      0093FC                       3385 ABORQ:
      0093FC CD 85 28         [ 4] 3386         CALL     QBRAN
      0093FF 94 1B                 3387         .word      ABOR2   ;text flag
      009401 CD 8F F7         [ 4] 3388         CALL     DOSTR
      009404 CD 8F 99         [ 4] 3389 ABOR1:  CALL     SPACE
      009407 CD 8C 52         [ 4] 3390         CALL     COUNT
      00940A CD 8F C3         [ 4] 3391         CALL     TYPES
      00940D CD 84 F5         [ 4] 3392         CALL     DOLIT
      009410 00 3F                 3393         .word     63 ; "?"
      009412 CD 84 B4         [ 4] 3394         CALL     EMIT
      009415 CD 8F E1         [ 4] 3395         CALL     CR
      009418 CC 93 ED         [ 2] 3396         JP     ABORT   ;pass error string
      00941B CD 8F F7         [ 4] 3397 ABOR2:  CALL     DOSTR
      00941E CC 86 10         [ 2] 3398         JP     DROP
                                   3399 
                                   3400 ;; The text interpreter
                                   3401 
                                   3402 ;       $INTERPRET      ( a -- )
                                   3403 ;       Interpret a word. If failed,
                                   3404 ;       try to convert it to an integer.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



      009421 93 F5                 3405         .word      LINK
                           0013A3  3406 LINK = . 
      009423 0A                    3407         .byte      10
      009424 24 49 4E 54 45 52 50  3408         .ascii     "$INTERPRET"
             52 45 54
      00942E                       3409 INTER:
      00942E CD 92 F0         [ 4] 3410         CALL     NAMEQ
      009431 CD 87 C4         [ 4] 3411         CALL     QDUP    ;?defined
      009434 CD 85 28         [ 4] 3412         CALL     QBRAN
      009437 94 58                 3413         .word      INTE1
      009439 CD 85 73         [ 4] 3414         CALL     AT
      00943C CD 84 F5         [ 4] 3415         CALL     DOLIT
      00943F 40 00                 3416 	.word       0x4000	; COMPO*256
      009441 CD 86 66         [ 4] 3417         CALL     ANDD    ;?compile only lexicon bits
      009444 CD 93 FC         [ 4] 3418         CALL     ABORQ
      009447 0D                    3419         .byte      13
      009448 20 63 6F 6D 70 69 6C  3420         .ascii     " compile only"
             65 20 6F 6E 6C 79
      009455 CC 85 4F         [ 2] 3421         JP     EXECU
      009458 CD 8E 8E         [ 4] 3422 INTE1:  CALL     NUMBQ   ;convert a number
      00945B CD 85 28         [ 4] 3423         CALL     QBRAN
      00945E 94 04                 3424         .word    ABOR1
      009460 81               [ 4] 3425         RET
                                   3426 
                                   3427 ;       [       ( -- )
                                   3428 ;       Start  text interpreter.
      009461 94 23                 3429         .word      LINK
                           0013E3  3430 LINK = . 
      009463 81                    3431 	.byte      IMEDD+1
      009464 5B                    3432         .ascii     "["
      009465                       3433 LBRAC:
      009465 CD 84 F5         [ 4] 3434         CALL   DOLIT
      009468 94 2E                 3435         .word  INTER
      00946A CD 87 38         [ 4] 3436         CALL   TEVAL
      00946D CC 85 5C         [ 2] 3437         JP     STORE
                                   3438 
                                   3439 ;       .OK     ( -- )
                                   3440 ;       Display 'ok' while interpreting.
      009470 94 63                 3441         .word      LINK
                           0013F2  3442 LINK = . 
      009472 03                    3443         .byte      3
      009473 2E 4F 4B              3444         .ascii     ".OK"
      009476                       3445 DOTOK:
      009476 CD 84 F5         [ 4] 3446         CALL     DOLIT
      009479 94 2E                 3447         .word      INTER
      00947B CD 87 38         [ 4] 3448         CALL     TEVAL
      00947E CD 85 73         [ 4] 3449         CALL     AT
      009481 CD 88 B6         [ 4] 3450         CALL     EQUAL
      009484 CD 85 28         [ 4] 3451         CALL     QBRAN
      009487 94 90                 3452         .word      DOTO1
      009489 CD 90 20         [ 4] 3453         CALL     DOTQP
      00948C 03                    3454         .byte      3
      00948D 20 6F 6B              3455         .ascii     " ok"
      009490 CC 8F E1         [ 2] 3456 DOTO1:  JP     CR
                                   3457 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



                                   3458 ;       ?STACK  ( -- )
                                   3459 ;       Abort if stack underflows.
      009493 94 72                 3460         .word      LINK
                           001415  3461 LINK = . 
      009495 06                    3462         .byte      6
      009496 3F 53 54 41 43 4B     3463         .ascii     "?STACK"
      00949C                       3464 QSTAC: 
      00949C CD 8B BD         [ 4] 3465         CALL     DEPTH
      00949F CD 86 53         [ 4] 3466         CALL     ZLESS   ;check only for underflow
      0094A2 CD 93 FC         [ 4] 3467         CALL     ABORQ
      0094A5 0B                    3468         .byte      11
      0094A6 20 75 6E 64 65 72 66  3469         .ascii     " underflow "
             6C 6F 77 20
      0094B1 81               [ 4] 3470         RET
                                   3471 
                                   3472 ;       EVAL    ( -- )
                                   3473 ;       Interpret  input stream.
      0094B2 94 95                 3474         .word      LINK
                           001434  3475 LINK = . 
      0094B4 04                    3476         .byte      4
      0094B5 45 56 41 4C           3477         .ascii     "EVAL"
      0094B9                       3478 EVAL:
      0094B9 CD 91 F3         [ 4] 3479 EVAL1:  CALL     TOKEN
      0094BC CD 86 1A         [ 4] 3480         CALL     DUPP
      0094BF CD 85 91         [ 4] 3481         CALL     CAT     ;?input stream empty
      0094C2 CD 85 28         [ 4] 3482         CALL     QBRAN
      0094C5 94 D5                 3483         .word    EVAL2
      0094C7 CD 87 38         [ 4] 3484         CALL     TEVAL
      0094CA CD 8C 9F         [ 4] 3485         CALL     ATEXE
      0094CD CD 94 9C         [ 4] 3486         CALL     QSTAC   ;evaluate input, check stack
      0094D0 CD 85 3F         [ 4] 3487         CALL     BRAN
      0094D3 94 B9                 3488         .word    EVAL1
      0094D5 CD 86 10         [ 4] 3489 EVAL2:  CALL     DROP
      0094D8 CC 94 76         [ 2] 3490         JP       DOTOK
                                   3491 
                                   3492 ;       PRESET  ( -- )
                                   3493 ;       Reset data stack pointer and
                                   3494 ;       terminal input buffer.
      0094DB 94 B4                 3495         .word      LINK
                           00145D  3496 LINK = . 
      0094DD 06                    3497         .byte      6
      0094DE 50 52 45 53 45 54     3498         .ascii     "PRESET"
      0094E4                       3499 PRESE:
      0094E4 CD 84 F5         [ 4] 3500         CALL     DOLIT
      0094E7 16 80                 3501         .word      SPP
      0094E9 CD 86 07         [ 4] 3502         CALL     SPSTO
      0094EC CD 84 F5         [ 4] 3503         CALL     DOLIT
      0094EF 17 00                 3504         .word      TIBB
      0094F1 CD 87 05         [ 4] 3505         CALL     NTIB
      0094F4 CD 8A E4         [ 4] 3506         CALL     CELLP
      0094F7 CC 85 5C         [ 2] 3507         JP     STORE
                                   3508 
                                   3509 ;       QUIT    ( -- )
                                   3510 ;       Reset return stack pointer
                                   3511 ;       and start text interpreter.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      0094FA 94 DD                 3512         .word      LINK
                           00147C  3513 LINK = . 
      0094FC 04                    3514         .byte      4
      0094FD 51 55 49 54           3515         .ascii     "QUIT"
      009501                       3516 QUIT:
      009501 CD 84 F5         [ 4] 3517         CALL     DOLIT
      009504 17 FF                 3518         .word      RPP
      009506 CD 85 AE         [ 4] 3519         CALL     RPSTO   ;reset return stack pointer
      009509 CD 94 65         [ 4] 3520 QUIT1:  CALL     LBRAC   ;start interpretation
      00950C CD 93 C8         [ 4] 3521 QUIT2:  CALL     QUERY   ;get input
      00950F CD 94 B9         [ 4] 3522         CALL     EVAL
      009512 20 F8            [ 2] 3523         JRA     QUIT2   ;continue till error
                                   3524 
                                   3525 ;; The compiler
                                   3526 
                                   3527 ;       '       ( -- ca )
                                   3528 ;       Search vocabularies for
                                   3529 ;       next word in input stream.
      009514 94 FC                 3530         .word      LINK
                           001496  3531 LINK = . 
      009516 01                    3532         .byte      1
      009517 27                    3533         .ascii     "'"
      009518                       3534 TICK:
      009518 CD 91 F3         [ 4] 3535         CALL     TOKEN
      00951B CD 92 F0         [ 4] 3536         CALL     NAMEQ   ;?defined
      00951E CD 85 28         [ 4] 3537         CALL     QBRAN
      009521 94 04                 3538         .word      ABOR1
      009523 81               [ 4] 3539         RET     ;yes, push code address
                                   3540 
                                   3541 ;       ALLOT   ( n -- )
                                   3542 ;       Allocate n bytes to RAM 
      009524 95 16                 3543         .word      LINK
                           0014A6  3544         LINK = . 
      009526 05                    3545         .byte      5
      009527 41 4C 4C 4F 54        3546         .ascii     "ALLOT"
      00952C                       3547 ALLOT:
      00952C CD 87 68         [ 4] 3548         CALL     VPP
                                   3549 ; must update APP_VP each time VP is modidied
      00952F CD 8B EB         [ 4] 3550         call PSTOR 
      009532 CC 9C 75         [ 2] 3551         jp UPDATVP 
                                   3552 
                                   3553 ;       ,       ( w -- )
                                   3554 ;         Compile an integer into
                                   3555 ;         variable space.
      009535 95 26                 3556         .word      LINK
                           0014B7  3557 LINK = . 
      009537 01                    3558         .byte      1
      009538 2C                    3559         .ascii     ","
      009539                       3560 COMMA:
      009539 CD 8C 69         [ 4] 3561         CALL     HERE
      00953C CD 86 1A         [ 4] 3562         CALL     DUPP
      00953F CD 8A E4         [ 4] 3563         CALL     CELLP   ;cell boundary
      009542 CD 87 68         [ 4] 3564         CALL     VPP
      009545 CD 85 5C         [ 4] 3565         CALL     STORE
      009548 CC 85 5C         [ 2] 3566         JP     STORE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



                                   3567 
                                   3568 ;       C,      ( c -- )
                                   3569 ;       Compile a byte into
                                   3570 ;       variables space.
      00954B 95 37                 3571        .word      LINK
                           0014CD  3572 LINK = . 
      00954D 02                    3573         .byte      2
      00954E 43 2C                 3574         .ascii     "C,"
      009550                       3575 CCOMMA:
      009550 CD 8C 69         [ 4] 3576         CALL     HERE
      009553 CD 86 1A         [ 4] 3577         CALL     DUPP
      009556 CD 8B 0F         [ 4] 3578         CALL     ONEP
      009559 CD 87 68         [ 4] 3579         CALL     VPP
      00955C CD 85 5C         [ 4] 3580         CALL     STORE
      00955F CC 85 80         [ 2] 3581         JP     CSTOR
                                   3582 
                                   3583 ;       [COMPILE]       ( -- ; <string> )
                                   3584 ;       Compile next immediate
                                   3585 ;       word into code dictionary.
      009562 95 4D                 3586         .word      LINK
                           0014E4  3587 LINK = . 
      009564 89                    3588 	.byte      IMEDD+9
      009565 5B 43 4F 4D 50 49 4C  3589         .ascii     "[COMPILE]"
             45 5D
      00956E                       3590 BCOMP:
      00956E CD 95 18         [ 4] 3591         CALL     TICK
      009571 CC 98 34         [ 2] 3592         JP     JSRC
                                   3593 
                                   3594 ;       COMPILE ( -- )
                                   3595 ;       Compile next jsr in
                                   3596 ;       colon list to code dictionary.
      009574 95 64                 3597         .word      LINK
                           0014F6  3598 LINK = . 
      009576 47                    3599 	.byte      COMPO+7
      009577 43 4F 4D 50 49 4C 45  3600         .ascii     "COMPILE"
      00957E                       3601 COMPI:
      00957E CD 85 C4         [ 4] 3602         CALL     RFROM
      009581 CD 86 1A         [ 4] 3603         CALL     DUPP
      009584 CD 85 73         [ 4] 3604         CALL     AT
      009587 CD 98 34         [ 4] 3605         CALL     JSRC    ;compile subroutine
      00958A CD 8A E4         [ 4] 3606         CALL     CELLP
      00958D 90 93            [ 1] 3607         ldw y,x 
      00958F 90 FE            [ 2] 3608         ldw y,(y)
      009591 1C 00 02         [ 2] 3609         addw x,#CELLL 
      009594 90 FC            [ 2] 3610         jp (y)
                                   3611 
                                   3612 ;       LITERAL ( w -- )
                                   3613 ;       Compile tos to dictionary
                                   3614 ;       as an integer literal.
      009596 95 76                 3615         .word      LINK
                           001518  3616 LINK = . 
      009598 87                    3617 	.byte      IMEDD+7
      009599 4C 49 54 45 52 41 4C  3618         .ascii     "LITERAL"
      0095A0                       3619 LITER:
      0095A0 CD 95 7E         [ 4] 3620         CALL     COMPI
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



      0095A3 84 F5                 3621         .word DOLIT 
      0095A5 CC 95 39         [ 2] 3622         JP     COMMA
                                   3623 
                                   3624 ;       $,"     ( -- )
                                   3625 ;       Compile a literal string
                                   3626 ;       up to next " .
      0095A8 95 98                 3627         .word      LINK
                           00152A  3628 LINK = . 
      0095AA 03                    3629         .byte      3
      0095AB 24 2C 22              3630         .byte     '$',',','"'
      0095AE                       3631 STRCQ:
      0095AE CD 84 F5         [ 4] 3632         CALL     DOLIT
      0095B1 00 22                 3633         .word     34	; "
      0095B3 CD 91 76         [ 4] 3634         CALL     PARSE
      0095B6 CD 8C 69         [ 4] 3635         CALL     HERE
      0095B9 CD 8D 29         [ 4] 3636         CALL     PACKS   ;string to code dictionary
      0095BC CD 8C 52         [ 4] 3637         CALL     COUNT
      0095BF CD 88 15         [ 4] 3638         CALL     PLUS    ;calculate aligned end of string
      0095C2 CD 87 68         [ 4] 3639         CALL     VPP
      0095C5 CC 85 5C         [ 2] 3640         JP     STORE
                                   3641 
                                   3642 ;; Structures
                                   3643 
                                   3644 ;       FOR     ( -- a )
                                   3645 ;       Start a FOR-NEXT loop
                                   3646 ;       structure in a colon definition.
      0095C8 95 AA                 3647         .word      LINK
                           00154A  3648 LINK = . 
      0095CA 83                    3649 	.byte      IMEDD+3
      0095CB 46 4F 52              3650         .ascii     "FOR"
      0095CE                       3651 FOR:
      0095CE CD 95 7E         [ 4] 3652         CALL     COMPI
      0095D1 85 E3                 3653         .word TOR 
      0095D3 CC 8C 69         [ 2] 3654         JP     HERE
                                   3655 
                                   3656 ;       NEXT    ( a -- )
                                   3657 ;       Terminate a FOR-NEXT loop.
      0095D6 95 CA                 3658         .word      LINK
                           001558  3659 LINK = . 
      0095D8 84                    3660 	.byte      IMEDD+4
      0095D9 4E 45 58 54           3661         .ascii     "NEXT"
      0095DD                       3662 NEXT:
      0095DD CD 95 7E         [ 4] 3663         CALL     COMPI
      0095E0 85 09                 3664         .word DONXT 
      0095E2 CD 87 B4         [ 4] 3665         call ADRADJ
      0095E5 CC 95 39         [ 2] 3666         JP     COMMA
                                   3667 
                                   3668 ;       I ( -- n )
                                   3669 ;       stack FOR-NEXT COUNTER 
      0095E8 95 D8                 3670         .word LINK 
                           00156A  3671         LINK=.
      0095EA 01                    3672         .byte 1 
      0095EB 49                    3673         .ascii "I"
      0095EC                       3674 IFETCH: 
      0095EC 1D 00 02         [ 2] 3675         subw x,#CELLL 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      0095EF 16 03            [ 2] 3676         ldw y,(3,sp)
      0095F1 FF               [ 2] 3677         ldw (x),y 
      0095F2 81               [ 4] 3678         ret 
                                   3679 
                                   3680 ;       BEGIN   ( -- a )
                                   3681 ;       Start an infinite or
                                   3682 ;       indefinite loop structure.
      0095F3 95 EA                 3683         .word      LINK
                           001575  3684 LINK = . 
      0095F5 85                    3685 	.byte      IMEDD+5
      0095F6 42 45 47 49 4E        3686         .ascii     "BEGIN"
      0095FB                       3687 BEGIN:
      0095FB CC 8C 69         [ 2] 3688         JP     HERE
                                   3689 
                                   3690 ;       UNTIL   ( a -- )
                                   3691 ;       Terminate a BEGIN-UNTIL
                                   3692 ;       indefinite loop structure.
      0095FE 95 F5                 3693         .word      LINK
                           001580  3694 LINK = . 
      009600 85                    3695 	.byte      IMEDD+5
      009601 55 4E 54 49 4C        3696         .ascii     "UNTIL"
      009606                       3697 UNTIL:
      009606 CD 95 7E         [ 4] 3698         CALL     COMPI
      009609 85 28                 3699         .word    QBRAN 
      00960B CD 87 B4         [ 4] 3700         call ADRADJ
      00960E CC 95 39         [ 2] 3701         JP     COMMA
                                   3702 
                                   3703 ;       AGAIN   ( a -- )
                                   3704 ;       Terminate a BEGIN-AGAIN
                                   3705 ;       infinite loop structure.
      009611 96 00                 3706         .word      LINK
                           001593  3707 LINK = . 
      009613 85                    3708 	.byte      IMEDD+5
      009614 41 47 41 49 4E        3709         .ascii     "AGAIN"
      009619                       3710 AGAIN:
      009619 CD 95 7E         [ 4] 3711         CALL     COMPI
      00961C 85 3F                 3712         .word BRAN
      00961E CD 87 B4         [ 4] 3713         call ADRADJ 
      009621 CC 95 39         [ 2] 3714         JP     COMMA
                                   3715 
                                   3716 ;       IF      ( -- A )
                                   3717 ;       Begin a conditional branch.
      009624 96 13                 3718         .word      LINK
                           0015A6  3719 LINK = . 
      009626 82                    3720 	.byte      IMEDD+2
      009627 49 46                 3721         .ascii     "IF"
      009629                       3722 IFF:
      009629 CD 95 7E         [ 4] 3723         CALL     COMPI
      00962C 85 28                 3724         .word QBRAN
      00962E CD 8C 69         [ 4] 3725         CALL     HERE
      009631 CD 8B 7B         [ 4] 3726         CALL     ZERO
      009634 CC 95 39         [ 2] 3727         JP     COMMA
                                   3728 
                                   3729 ;       THEN        ( A -- )
                                   3730 ;       Terminate a conditional branch structure.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      009637 96 26                 3731         .word      LINK
                           0015B9  3732 LINK = . 
      009639 84                    3733 	.byte      IMEDD+4
      00963A 54 48 45 4E           3734         .ascii     "THEN"
      00963E                       3735 THENN:
      00963E CD 8C 69         [ 4] 3736         CALL     HERE
      009641 CD 87 B4         [ 4] 3737         call ADRADJ 
      009644 CD 86 2A         [ 4] 3738         CALL     SWAPP
      009647 CC 85 5C         [ 2] 3739         JP     STORE
                                   3740 
                                   3741 ;       ELSE        ( A -- A )
                                   3742 ;       Start the false clause in an IF-ELSE-THEN structure.
      00964A 96 39                 3743         .word      LINK
                           0015CC  3744 LINK = . 
      00964C 84                    3745 	.byte      IMEDD+4
      00964D 45 4C 53 45           3746         .ascii     "ELSE"
      009651                       3747 ELSEE:
      009651 CD 95 7E         [ 4] 3748         CALL     COMPI
      009654 85 3F                 3749         .word BRAN
      009656 CD 8C 69         [ 4] 3750         CALL     HERE
      009659 CD 8B 7B         [ 4] 3751         CALL     ZERO
      00965C CD 95 39         [ 4] 3752         CALL     COMMA
      00965F CD 86 2A         [ 4] 3753         CALL     SWAPP
      009662 CD 8C 69         [ 4] 3754         CALL     HERE
      009665 CD 87 B4         [ 4] 3755         call ADRADJ 
      009668 CD 86 2A         [ 4] 3756         CALL     SWAPP
      00966B CC 85 5C         [ 2] 3757         JP     STORE
                                   3758 
                                   3759 ;       AHEAD       ( -- A )
                                   3760 ;       Compile a forward branch instruction.
      00966E 96 4C                 3761         .word      LINK
                           0015F0  3762 LINK = . 
      009670 85                    3763 	.byte      IMEDD+5
      009671 41 48 45 41 44        3764         .ascii     "AHEAD"
      009676                       3765 AHEAD:
      009676 CD 95 7E         [ 4] 3766         CALL     COMPI
      009679 85 3F                 3767         .word BRAN
      00967B CD 8C 69         [ 4] 3768         CALL     HERE
      00967E CD 8B 7B         [ 4] 3769         CALL     ZERO
      009681 CC 95 39         [ 2] 3770         JP     COMMA
                                   3771 
                                   3772 ;       WHILE       ( a -- A a )
                                   3773 ;       Conditional branch out of a BEGIN-WHILE-REPEAT loop.
      009684 96 70                 3774         .word      LINK
                           001606  3775 LINK = . 
      009686 85                    3776 	.byte      IMEDD+5
      009687 57 48 49 4C 45        3777         .ascii     "WHILE"
      00968C                       3778 WHILE:
      00968C CD 95 7E         [ 4] 3779         CALL     COMPI
      00968F 85 28                 3780         .word QBRAN
      009691 CD 8C 69         [ 4] 3781         CALL     HERE
      009694 CD 8B 7B         [ 4] 3782         CALL     ZERO
      009697 CD 95 39         [ 4] 3783         CALL     COMMA
      00969A CC 86 2A         [ 2] 3784         JP     SWAPP
                                   3785 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



                                   3786 ;       REPEAT      ( A a -- )
                                   3787 ;       Terminate a BEGIN-WHILE-REPEAT indefinite loop.
      00969D 96 86                 3788         .word      LINK
                           00161F  3789 LINK = . 
      00969F 86                    3790         .byte      IMEDD+6
      0096A0 52 45 50 45 41 54     3791         .ascii     "REPEAT"
      0096A6                       3792 REPEA:
      0096A6 CD 95 7E         [ 4] 3793         CALL     COMPI
      0096A9 85 3F                 3794         .word BRAN
      0096AB CD 87 B4         [ 4] 3795         call ADRADJ 
      0096AE CD 95 39         [ 4] 3796         CALL     COMMA
      0096B1 CD 8C 69         [ 4] 3797         CALL     HERE
      0096B4 CD 87 B4         [ 4] 3798         call ADRADJ 
      0096B7 CD 86 2A         [ 4] 3799         CALL     SWAPP
      0096BA CC 85 5C         [ 2] 3800         JP     STORE
                                   3801 
                                   3802 ;       AFT         ( a -- a A )
                                   3803 ;       Jump to THEN in a FOR-AFT-THEN-NEXT loop the first time through.
      0096BD 96 9F                 3804         .word      LINK
                           00163F  3805 LINK = . 
      0096BF 83                    3806 	.byte      IMEDD+3
      0096C0 41 46 54              3807         .ascii     "AFT"
      0096C3                       3808 AFT:
      0096C3 CD 86 10         [ 4] 3809         CALL     DROP
      0096C6 CD 96 76         [ 4] 3810         CALL     AHEAD
      0096C9 CD 8C 69         [ 4] 3811         CALL     HERE
      0096CC CC 86 2A         [ 2] 3812         JP     SWAPP
                                   3813 
                                   3814 ;       ABORT"      ( -- ; <string> )
                                   3815 ;       Conditional abort with an error message.
      0096CF 96 BF                 3816         .word      LINK
                           001651  3817 LINK = . 
      0096D1 86                    3818 	.byte      IMEDD+6
      0096D2 41 42 4F 52 54        3819         .ascii     "ABORT"
      0096D7 22                    3820         .byte      '"'
      0096D8                       3821 ABRTQ:
      0096D8 CD 95 7E         [ 4] 3822         CALL     COMPI
      0096DB 93 FC                 3823         .word ABORQ
      0096DD CC 95 AE         [ 2] 3824         JP     STRCQ
                                   3825 
                                   3826 ;       $"     ( -- ; <string> )
                                   3827 ;       Compile an inline string literal.
      0096E0 96 D1                 3828         .word      LINK
                           001662  3829 LINK = . 
      0096E2 82                    3830 	.byte      IMEDD+2
      0096E3 24 22                 3831         .byte     '$','"'
      0096E5                       3832 STRQ:
      0096E5 CD 95 7E         [ 4] 3833         CALL     COMPI
      0096E8 90 16                 3834         .word STRQP 
      0096EA CC 95 AE         [ 2] 3835         JP     STRCQ
                                   3836 
                                   3837 ;       ."          ( -- ; <string> )
                                   3838 ;       Compile an inline string literal to be typed out at run time.
      0096ED 96 E2                 3839         .word      LINK
                           00166F  3840 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



      0096EF 82                    3841 	.byte      IMEDD+2
      0096F0 2E 22                 3842         .byte     '.','"'
      0096F2                       3843 DOTQ:
      0096F2 CD 95 7E         [ 4] 3844         CALL     COMPI
      0096F5 90 20                 3845         .word DOTQP 
      0096F7 CC 95 AE         [ 2] 3846         JP     STRCQ
                                   3847 
                                   3848 ;; Name compiler
                                   3849 
                                   3850 ;       ?UNIQUE ( a -- a )
                                   3851 ;       Display a warning message
                                   3852 ;       if word already exists.
      0096FA 96 EF                 3853         .word      LINK
                           00167C  3854 LINK = . 
      0096FC 07                    3855         .byte      7
      0096FD 3F 55 4E 49 51 55 45  3856         .ascii     "?UNIQUE"
      009704                       3857 UNIQU:
      009704 CD 86 1A         [ 4] 3858         CALL     DUPP
      009707 CD 92 F0         [ 4] 3859         CALL     NAMEQ   ;?name exists
      00970A CD 85 28         [ 4] 3860         CALL     QBRAN
      00970D 97 23                 3861         .word      UNIQ1
      00970F CD 90 20         [ 4] 3862         CALL     DOTQP   ;redef are OK
      009712 07                    3863         .byte       7
      009713 20 72 65 44 65 66 20  3864         .ascii     " reDef "       
      00971A CD 86 44         [ 4] 3865         CALL     OVER
      00971D CD 8C 52         [ 4] 3866         CALL     COUNT
      009720 CD 8F C3         [ 4] 3867         CALL     TYPES   ;just in case
      009723 CC 86 10         [ 2] 3868 UNIQ1:  JP     DROP
                                   3869 
                                   3870 ;       $,n     ( na -- )
                                   3871 ;       Build a new dictionary name
                                   3872 ;       using string at na.
                                   3873 ; compile dans l'espace des variables 
      009726 96 FC                 3874         .word      LINK
                           0016A8  3875 LINK = . 
      009728 03                    3876         .byte      3
      009729 24 2C 6E              3877         .ascii     "$,n"
      00972C                       3878 SNAME:
      00972C CD 86 1A         [ 4] 3879         CALL     DUPP
      00972F CD 85 91         [ 4] 3880         CALL     CAT     ;?null input
      009732 CD 85 28         [ 4] 3881         CALL     QBRAN
      009735 97 62                 3882         .word      PNAM1
      009737 CD 97 04         [ 4] 3883         CALL     UNIQU   ;?redefinition
      00973A CD 86 1A         [ 4] 3884         CALL     DUPP
      00973D CD 8C 52         [ 4] 3885         CALL     COUNT
      009740 CD 88 15         [ 4] 3886         CALL     PLUS
      009743 CD 87 68         [ 4] 3887         CALL     VPP
      009746 CD 85 5C         [ 4] 3888         CALL     STORE
      009749 CD 86 1A         [ 4] 3889         CALL     DUPP
      00974C CD 87 86         [ 4] 3890         CALL     LAST
      00974F CD 85 5C         [ 4] 3891         CALL     STORE   ;save na for vocabulary link
      009752 CD 8A F3         [ 4] 3892         CALL     CELLM   ;link address
      009755 CD 87 5A         [ 4] 3893         CALL     CNTXT
      009758 CD 85 73         [ 4] 3894         CALL     AT
      00975B CD 86 2A         [ 4] 3895         CALL     SWAPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



      00975E CD 85 5C         [ 4] 3896         CALL     STORE
      009761 81               [ 4] 3897         RET     ;save code pointer
      009762 CD 90 16         [ 4] 3898 PNAM1:  CALL     STRQP
      009765 05                    3899         .byte      5
      009766 20 6E 61 6D 65        3900         .ascii     " name" ;null input
      00976B CC 94 04         [ 2] 3901         JP     ABOR1
                                   3902 
                                   3903 ;; FORTH compiler
                                   3904 
                                   3905 ;       $COMPILE        ( a -- )
                                   3906 ;       Compile next word to
                                   3907 ;       dictionary as a token or literal.
      00976E 97 28                 3908         .word      LINK
                           0016F0  3909 LINK = . 
      009770 08                    3910         .byte      8
      009771 24 43 4F 4D 50 49 4C  3911         .ascii     "$COMPILE"
             45
      009779                       3912 SCOMP:
      009779 CD 92 F0         [ 4] 3913         CALL     NAMEQ
      00977C CD 87 C4         [ 4] 3914         CALL     QDUP    ;?defined
      00977F CD 85 28         [ 4] 3915         CALL     QBRAN
      009782 97 9A                 3916         .word      SCOM2
      009784 CD 85 73         [ 4] 3917         CALL     AT
      009787 CD 84 F5         [ 4] 3918         CALL     DOLIT
      00978A 80 00                 3919         .word     0x8000	;  IMEDD*256
      00978C CD 86 66         [ 4] 3920         CALL     ANDD    ;?immediate
      00978F CD 85 28         [ 4] 3921         CALL     QBRAN
      009792 97 97                 3922         .word      SCOM1
      009794 CC 85 4F         [ 2] 3923         JP     EXECU
      009797 CC 98 34         [ 2] 3924 SCOM1:  JP     JSRC
      00979A CD 8E 8E         [ 4] 3925 SCOM2:  CALL     NUMBQ   ;try to convert to number
      00979D CD 85 28         [ 4] 3926         CALL     QBRAN
      0097A0 94 04                 3927         .word      ABOR1
      0097A2 CC 95 A0         [ 2] 3928         JP     LITER
                                   3929 
                                   3930 ;       OVERT   ( -- )
                                   3931 ;       Link a new word into vocabulary.
      0097A5 97 70                 3932         .word      LINK
                           001727  3933 LINK = . 
      0097A7 05                    3934         .byte      5
      0097A8 4F 56 45 52 54        3935         .ascii     "OVERT"
      0097AD                       3936 OVERT:
      0097AD CD 87 86         [ 4] 3937         CALL     LAST
      0097B0 CD 85 73         [ 4] 3938         CALL     AT
      0097B3 CD 87 5A         [ 4] 3939         CALL     CNTXT
      0097B6 CC 85 5C         [ 2] 3940         JP     STORE
                                   3941 
                                   3942 ;       ;       ( -- )
                                   3943 ;       Terminate a colon definition.
      0097B9 97 A7                 3944         .word      LINK
                           00173B  3945 LINK = . 
      0097BB C1                    3946 	.byte      IMEDD+COMPO+1
      0097BC 3B                    3947         .ascii     ";"
      0097BD                       3948 SEMIS:
                           000001  3949 .if OPTIMIZE ; more compact and faster
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      0097BD CD 84 F5         [ 4] 3950         call DOLIT 
      0097C0 00 81                 3951         .word 0x81   ; opcode for RET 
      0097C2 CD 95 50         [ 4] 3952         call CCOMMA 
                           000000  3953 .else
                                   3954         CALL     COMPI
                                   3955         .word EXIT 
                                   3956 .endif 
      0097C5 CD 94 65         [ 4] 3957         CALL     LBRAC
      0097C8 CD 97 AD         [ 4] 3958         call OVERT 
      0097CB CD A1 CD         [ 4] 3959         CALL FMOVE
      0097CE CD 87 C4         [ 4] 3960         call QDUP 
      0097D1 CD 85 28         [ 4] 3961         call QBRAN 
      0097D4 99 04                 3962         .word SET_RAMLAST 
      0097D6 CD A2 61         [ 4] 3963         CALL UPDATPTR
      0097D9 81               [ 4] 3964         RET 
                                   3965 
                                   3966 
                                   3967 ;       Terminate an ISR definition 
                                   3968 ;       retourn ca of ISR as double
                                   3969 ;       I; ( -- ud )
      0097DA 97 BB                 3970         .word LINK 
                           00175C  3971         LINK=.
      0097DC C2                    3972         .byte 2+IMEDD+COMPO 
      0097DD 49 3B                 3973         .ascii "I;" 
      0097DF                       3974 ISEMI:
      0097DF 1D 00 02         [ 2] 3975         subw x,#CELLL  
      0097E2 90 AE 00 80      [ 2] 3976         ldw y,#IRET_CODE 
      0097E6 FF               [ 2] 3977         ldw (x),y 
      0097E7 CD 95 50         [ 4] 3978         call CCOMMA
      0097EA CD 94 65         [ 4] 3979         call LBRAC 
      0097ED CD A2 A6         [ 4] 3980         call IFMOVE
      0097F0 CD 87 C4         [ 4] 3981         call QDUP 
      0097F3 CD 85 28         [ 4] 3982         CALL QBRAN 
      0097F6 99 04                 3983         .word SET_RAMLAST
      0097F8 CD 87 76         [ 4] 3984         CALL CPP
      0097FB CD 85 73         [ 4] 3985         call AT 
      0097FE CD 86 2A         [ 4] 3986         call SWAPP 
      009801 CD 87 76         [ 4] 3987         CALL CPP 
      009804 CD 85 5C         [ 4] 3988         call STORE 
      009807 CD 9C 5E         [ 4] 3989         call UPDATCP 
      00980A CD 9C 1B         [ 4] 3990         call EEPVP 
      00980D CD 86 10         [ 4] 3991         call DROP 
      009810 CD 85 73         [ 4] 3992         call AT 
      009813 CD 87 68         [ 4] 3993         call VPP 
      009816 CD 85 5C         [ 4] 3994         call STORE 
      009819 CC 8B 7B         [ 2] 3995         jp ZERO
      00981C 81               [ 4] 3996         ret           
                                   3997         
                                   3998 
                                   3999 ;       ]       ( -- )
                                   4000 ;       Start compiling words in
                                   4001 ;       input stream.
      00981D 97 DC                 4002         .word      LINK
                           00179F  4003 LINK = . 
      00981F 01                    4004         .byte      1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      009820 5D                    4005         .ascii     "]"
      009821                       4006 RBRAC:
      009821 CD 84 F5         [ 4] 4007         CALL   DOLIT
      009824 97 79                 4008         .word  SCOMP
      009826 CD 87 38         [ 4] 4009         CALL   TEVAL
      009829 CC 85 5C         [ 2] 4010         JP     STORE
                                   4011 
                                   4012 ;       CALL,    ( ca -- )
                                   4013 ;       Compile a subroutine call.
      00982C 98 1F                 4014         .word      LINK
                           0017AE  4015 LINK = . 
      00982E 05                    4016         .byte      5
      00982F 43 41 4C 4C 2C        4017         .ascii     "CALL,"
      009834                       4018 JSRC:
      009834 CD 84 F5         [ 4] 4019         CALL     DOLIT
      009837 00 CD                 4020         .word     CALLL     ;CALL
      009839 CD 95 50         [ 4] 4021         CALL     CCOMMA
      00983C CC 95 39         [ 2] 4022         JP     COMMA
                                   4023 
                                   4024 ;       INIT-OFS ( -- )
                                   4025 ;       compute offset to adjust jump address 
                                   4026 ;       set variable OFFSET 
      00983F 98 2E                 4027         .word LINK 
                           0017C1  4028         LINK=.
      009841 08                    4029         .byte 8 
      009842 49 4E 49 54 2D 4F 46  4030         .ascii "INIT-OFS" 
             53
      00984A                       4031 INITOFS:
      00984A CD 87 27         [ 4] 4032         call TFLASH 
      00984D CD 85 73         [ 4] 4033         CALL AT 
      009850 CD 86 1A         [ 4] 4034         CALL DUPP 
      009853 CD 85 28         [ 4] 4035         call QBRAN
      009856 98 67                 4036         .word 1$
      009858 CD 86 10         [ 4] 4037         call DROP  
      00985B CD 87 76         [ 4] 4038         call CPP 
      00985E CD 85 73         [ 4] 4039         call AT 
      009861 CD 8C 69         [ 4] 4040         call HERE
      009864 CD 88 8E         [ 4] 4041         call SUBB 
      009867 CD 87 AB         [ 4] 4042 1$:     call OFFSET 
      00986A CC 85 5C         [ 2] 4043         jp STORE  
                                   4044 
                                   4045 ;       :       ( -- ; <string> )
                                   4046 ;       Start a new colon definition
                                   4047 ;       using next word as its name.
      00986D 98 41                 4048         .word      LINK
                           0017EF  4049 LINK = . 
      00986F 01                    4050         .byte      1
      009870 3A                    4051         .ascii     ":"
      009871                       4052 COLON:
      009871 CD 98 4A         [ 4] 4053         call INITOFS       
      009874 CD 91 F3         [ 4] 4054         CALL   TOKEN
      009877 CD 97 2C         [ 4] 4055         CALL   SNAME
      00987A CC 98 21         [ 2] 4056         JP     RBRAC
                                   4057 
                                   4058 ;       I:  ( -- )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



                                   4059 ;       Start interrupt service routine definition
                                   4060 ;       those definition have no name.
      00987D 98 6F                 4061         .word LINK
                           0017FF  4062         LINK=.
      00987F 02                    4063         .byte 2 
      009880 49 3A                 4064         .ascii "I:" 
      009882                       4065 ICOLON:
      009882 CD 98 4A         [ 4] 4066         call INITOFS 
      009885 CC 98 21         [ 2] 4067         jp RBRAC  
                                   4068 
                                   4069 ;       IMMEDIATE       ( -- )
                                   4070 ;       Make last compiled word
                                   4071 ;       an immediate word.
      009888 98 7F                 4072         .word      LINK
                           00180A  4073 LINK = . 
      00988A 09                    4074         .byte      9
      00988B 49 4D 4D 45 44 49 41  4075         .ascii     "IMMEDIATE"
             54 45
      009894                       4076 IMMED:
      009894 CD 84 F5         [ 4] 4077         CALL     DOLIT
      009897 80 00                 4078         .word     0x8000	;  IMEDD*256
      009899 CD 87 86         [ 4] 4079         CALL     LAST
      00989C CD 85 73         [ 4] 4080         CALL     AT
      00989F CD 85 73         [ 4] 4081         CALL     AT
      0098A2 CD 86 7A         [ 4] 4082         CALL     ORR
      0098A5 CD 87 86         [ 4] 4083         CALL     LAST
      0098A8 CD 85 73         [ 4] 4084         CALL     AT
      0098AB CC 85 5C         [ 2] 4085         JP     STORE
                                   4086 
                                   4087 ;; Defining words
                                   4088 
                                   4089 ;       CREATE  ( -- ; <string> )
                                   4090 ;       Compile a new array
                                   4091 ;       without allocating space.
      0098AE 98 8A                 4092         .word      LINK
                           001830  4093 LINK = . 
      0098B0 06                    4094         .byte      6
      0098B1 43 52 45 41 54 45     4095         .ascii     "CREATE"
      0098B7                       4096 CREAT:
      0098B7 CD 91 F3         [ 4] 4097         CALL     TOKEN
      0098BA CD 97 2C         [ 4] 4098         CALL     SNAME
      0098BD CD 97 AD         [ 4] 4099         CALL     OVERT        
      0098C0 CD 95 7E         [ 4] 4100         CALL     COMPI 
      0098C3 86 C7                 4101         .word DOVAR 
      0098C5 81               [ 4] 4102         RET
                                   4103 
                                   4104 ;       VARIABLE        ( -- ; <string> )
                                   4105 ;       Compile a new variable
                                   4106 ;       initialized to 0.
      0098C6 98 B0                 4107         .word      LINK
                           001848  4108 LINK = . 
      0098C8 08                    4109         .byte      8
      0098C9 56 41 52 49 41 42 4C  4110         .ascii     "VARIABLE"
             45
      0098D1                       4111 VARIA:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



                                   4112 ; indirect variable so that VARIABLE definition can be compiled in FLASH 
      0098D1 CD 8C 69         [ 4] 4113         CALL HERE
      0098D4 CD 86 1A         [ 4] 4114         CALL DUPP 
      0098D7 CD 8A E4         [ 4] 4115         CALL CELLP
      0098DA CD 87 68         [ 4] 4116         CALL VPP 
      0098DD CD 85 5C         [ 4] 4117         CALL STORE
      0098E0 CD 98 B7         [ 4] 4118         CALL CREAT
      0098E3 CD 86 1A         [ 4] 4119         CALL DUPP
      0098E6 CD 95 39         [ 4] 4120         CALL COMMA
      0098E9 CD 8B 7B         [ 4] 4121         CALL ZERO
      0098EC CD 86 2A         [ 4] 4122         call SWAPP 
      0098EF CD 85 5C         [ 4] 4123         CALL STORE
      0098F2 CD A1 CD         [ 4] 4124         CALL FMOVE ; move definition to FLASH
      0098F5 CD 87 C4         [ 4] 4125         CALL QDUP 
      0098F8 CD 85 28         [ 4] 4126         CALL QBRAN 
      0098FB 99 04                 4127         .word SET_RAMLAST   
      0098FD CD 9C 75         [ 4] 4128         call UPDATVP  ; don't update if variable kept in RAM.
      009900 CD A2 61         [ 4] 4129         CALL UPDATPTR
      009903 81               [ 4] 4130         RET         
      009904                       4131 SET_RAMLAST: 
      009904 CD 87 86         [ 4] 4132         CALL LAST 
      009907 CD 85 73         [ 4] 4133         CALL AT 
      00990A CD 87 99         [ 4] 4134         CALL RAMLAST 
      00990D CC 85 5C         [ 2] 4135         jp STORE  
                                   4136 
                                   4137 
                                   4138 ;       CONSTANT  ( n -- ; <string> )
                                   4139 ;       Compile a new constant 
                                   4140 ;       n CONSTANT name 
      009910 98 C8                 4141         .word LINK 
                           001892  4142         LINK=. 
      009912 08                    4143         .byte 8 
      009913 43 4F 4E 53 54 41 4E  4144         .ascii "CONSTANT" 
             54
      00991B                       4145 CONSTANT:          
      00991B CD 91 F3         [ 4] 4146         CALL TOKEN
      00991E CD 97 2C         [ 4] 4147         CALL SNAME 
      009921 CD 97 AD         [ 4] 4148         CALL OVERT 
      009924 CD 95 7E         [ 4] 4149         CALL COMPI 
      009927 99 45                 4150         .word DOCONST
      009929 CD 95 39         [ 4] 4151         CALL COMMA 
      00992C CD A1 CD         [ 4] 4152         CALL FMOVE
      00992F CD 87 C4         [ 4] 4153         CALL QDUP 
      009932 CD 85 28         [ 4] 4154         CALL QBRAN 
      009935 99 04                 4155         .word SET_RAMLAST  
      009937 CD A2 61         [ 4] 4156         CALL UPDATPTR  
      00993A 81               [ 4] 4157 1$:     RET          
                                   4158 
                                   4159 ; CONSTANT runtime semantic 
                                   4160 ; doCONST  ( -- n )
      00993B 99 12                 4161         .word LINK 
                           0018BD  4162         LINK=.
      00993D 07                    4163         .byte 7
      00993E 44 4F 43 4F 4E 53 54  4164         .ascii "DOCONST"
      009945                       4165 DOCONST:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



      009945 1D 00 02         [ 2] 4166         subw x,#CELLL
      009948 90 85            [ 2] 4167         popw y 
      00994A 90 FE            [ 2] 4168         ldw y,(y) 
      00994C FF               [ 2] 4169         ldw (x),y 
      00994D 81               [ 4] 4170         ret 
                                   4171 
                                   4172 ;----------------------------------
                                   4173 ; create double constant 
                                   4174 ; DCONST ( d -- ; <string> )
                                   4175 ;----------------------------------
      00994E 99 3D                 4176     .word LINK 
                           0018D0  4177     LINK=.
      009950 06                    4178     .byte 6 
      009951 44 43 4F 4E 53 54     4179     .ascii "DCONST"
      009957                       4180 DCONST:
      009957 CD 91 F3         [ 4] 4181         CALL TOKEN
      00995A CD 97 2C         [ 4] 4182         CALL SNAME 
      00995D CD 97 AD         [ 4] 4183         CALL OVERT 
      009960 CD 95 7E         [ 4] 4184         CALL COMPI 
      009963 99 86                 4185         .word DO_DCONST
      009965 CD 95 39         [ 4] 4186         CALL COMMA
      009968 CD 95 39         [ 4] 4187         CALL COMMA  
      00996B CD A1 CD         [ 4] 4188         CALL FMOVE
      00996E CD 87 C4         [ 4] 4189         CALL QDUP 
      009971 CD 85 28         [ 4] 4190         CALL QBRAN 
      009974 99 04                 4191         .word SET_RAMLAST  
      009976 CD A2 61         [ 4] 4192         CALL UPDATPTR  
      009979 81               [ 4] 4193 1$:     RET          
                                   4194     
                                   4195 ;----------------------------------
                                   4196 ; runtime for DCONST 
                                   4197 ; stack double constant 
                                   4198 ; DO-DCONST ( -- d )
                                   4199 ;-----------------------------------
      00997A 99 50                 4200         .word LINK 
                           0018FC  4201         LINK=.
      00997C 09                    4202         .byte 9 
      00997D 44 4F 2D 44 43 4F 4E  4203         .ascii "DO-DCONST"
             53 54
      009986                       4204 DO_DCONST:
      009986 90 85            [ 2] 4205     popw y 
      009988 90 BF 24         [ 2] 4206     ldw YTEMP,y 
      00998B 1D 00 04         [ 2] 4207     subw x,#2*CELLL 
      00998E 90 FE            [ 2] 4208     ldw y,(y)
      009990 FF               [ 2] 4209     ldw (x),y 
      009991 90 BE 24         [ 2] 4210     ldw y,YTEMP 
      009994 90 EE 02         [ 2] 4211     ldw y,(2,y)
      009997 EF 02            [ 2] 4212     ldw (2,x),y 
      009999 81               [ 4] 4213     ret 
                                   4214 
                                   4215 ;; Tools
                                   4216 
                                   4217 ;       _TYPE   ( b u -- )
                                   4218 ;       Display a string. Filter
                                   4219 ;       non-printing characters.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



      00999A 99 7C                 4220         .word      LINK
                           00191C  4221 LINK = . 
      00999C 05                    4222         .byte      5
      00999D 5F 54 59 50 45        4223         .ascii     "_TYPE"
      0099A2                       4224 UTYPE:
      0099A2 CD 85 E3         [ 4] 4225         CALL     TOR     ;start count down loop
      0099A5 20 0F            [ 2] 4226         JRA     UTYP2   ;skip first pass
      0099A7 CD 86 1A         [ 4] 4227 UTYP1:  CALL     DUPP
      0099AA CD 85 91         [ 4] 4228         CALL     CAT
      0099AD CD 8B A5         [ 4] 4229         CALL     TCHAR
      0099B0 CD 84 B4         [ 4] 4230         CALL     EMIT    ;display only printable
      0099B3 CD 8B 0F         [ 4] 4231         CALL     ONEP    ;increment address
      0099B6 CD 85 09         [ 4] 4232 UTYP2:  CALL     DONXT
      0099B9 99 A7                 4233         .word      UTYP1   ;loop till done
      0099BB CC 86 10         [ 2] 4234         JP     DROP
                                   4235 
                                   4236 ;       dm+     ( a u -- a )
                                   4237 ;       Dump u bytes from ,
                                   4238 ;       leaving a+u on  stack.
      0099BE 99 9C                 4239         .word      LINK
                           001940  4240 LINK = . 
      0099C0 03                    4241         .byte      3
      0099C1 64 6D 2B              4242         .ascii     "dm+"
      0099C4                       4243 DUMPP:
      0099C4 CD 86 44         [ 4] 4244         CALL     OVER
      0099C7 CD 84 F5         [ 4] 4245         CALL     DOLIT
      0099CA 00 04                 4246         .word      4
      0099CC CD 90 49         [ 4] 4247         CALL     UDOTR   ;display address
      0099CF CD 8F 99         [ 4] 4248         CALL     SPACE
      0099D2 CD 85 E3         [ 4] 4249         CALL     TOR     ;start count down loop
      0099D5 20 11            [ 2] 4250         JRA     PDUM2   ;skip first pass
      0099D7 CD 86 1A         [ 4] 4251 PDUM1:  CALL     DUPP
      0099DA CD 85 91         [ 4] 4252         CALL     CAT
      0099DD CD 84 F5         [ 4] 4253         CALL     DOLIT
      0099E0 00 03                 4254         .word      3
      0099E2 CD 90 49         [ 4] 4255         CALL     UDOTR   ;display numeric data
      0099E5 CD 8B 0F         [ 4] 4256         CALL     ONEP    ;increment address
      0099E8 CD 85 09         [ 4] 4257 PDUM2:  CALL     DONXT
      0099EB 99 D7                 4258         .word      PDUM1   ;loop till done
      0099ED 81               [ 4] 4259         RET
                                   4260 
                                   4261 ;       DUMP    ( a u -- )
                                   4262 ;       Dump u bytes from a,
                                   4263 ;       in a formatted manner.
      0099EE 99 C0                 4264         .word      LINK
                           001970  4265 LINK = . 
      0099F0 04                    4266         .byte      4
      0099F1 44 55 4D 50           4267         .ascii     "DUMP"
      0099F5                       4268 DUMP:
      0099F5 CD 86 D7         [ 4] 4269         CALL     BASE
      0099F8 CD 85 73         [ 4] 4270         CALL     AT
      0099FB CD 85 E3         [ 4] 4271         CALL     TOR
      0099FE CD 8E 21         [ 4] 4272         CALL     HEX     ;save radix, set hex
      009A01 CD 84 F5         [ 4] 4273         CALL     DOLIT
      009A04 00 10                 4274         .word      16
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



      009A06 CD 8A 35         [ 4] 4275         CALL     SLASH   ;change count to lines
      009A09 CD 85 E3         [ 4] 4276         CALL     TOR     ;start count down loop
      009A0C CD 8F E1         [ 4] 4277 DUMP1:  CALL     CR
      009A0F CD 84 F5         [ 4] 4278         CALL     DOLIT
      009A12 00 10                 4279         .word      16
      009A14 CD 88 00         [ 4] 4280         CALL     DDUP
      009A17 CD 99 C4         [ 4] 4281         CALL     DUMPP   ;display numeric
      009A1A CD 87 D5         [ 4] 4282         CALL     ROT
      009A1D CD 87 D5         [ 4] 4283         CALL     ROT
      009A20 CD 8F 99         [ 4] 4284         CALL     SPACE
      009A23 CD 8F 99         [ 4] 4285         CALL     SPACE
      009A26 CD 99 A2         [ 4] 4286         CALL     UTYPE   ;display printable characters
      009A29 CD 85 09         [ 4] 4287         CALL     DONXT
      009A2C 9A 0C                 4288         .word      DUMP1   ;loop till done
      009A2E CD 86 10         [ 4] 4289 DUMP3:  CALL     DROP
      009A31 CD 85 C4         [ 4] 4290         CALL     RFROM
      009A34 CD 86 D7         [ 4] 4291         CALL     BASE
      009A37 CC 85 5C         [ 2] 4292         JP     STORE   ;restore radix
                                   4293 
                                   4294 ;       .S      ( ... -- ... )
                                   4295 ;        Display  contents of stack.
      009A3A 99 F0                 4296         .word      LINK
                           0019BC  4297 LINK = . 
      009A3C 02                    4298         .byte      2
      009A3D 2E 53                 4299         .ascii     ".S"
      009A3F                       4300 DOTS:
      009A3F CD 8F E1         [ 4] 4301         CALL     CR
      009A42 CD 8B BD         [ 4] 4302         CALL     DEPTH   ;stack depth
      009A45 CD 85 E3         [ 4] 4303         CALL     TOR     ;start count down loop
      009A48 20 09            [ 2] 4304         JRA     DOTS2   ;skip first pass
      009A4A CD 85 D7         [ 4] 4305 DOTS1:  CALL     RAT
      009A4D CD 8B D4         [ 4] 4306 	CALL     PICK
      009A50 CD 90 7C         [ 4] 4307         CALL     DOT     ;index stack, display contents
      009A53 CD 85 09         [ 4] 4308 DOTS2:  CALL     DONXT
      009A56 9A 4A                 4309         .word      DOTS1   ;loop till done
      009A58 CD 90 20         [ 4] 4310         CALL     DOTQP
      009A5B 05                    4311         .byte      5
      009A5C 20 3C 73 70 20        4312         .ascii     " <sp "
      009A61 81               [ 4] 4313         RET
                                   4314 
                                   4315 ;       >NAME   ( ca -- na | F )
                                   4316 ;       Convert code address
                                   4317 ;       to a name address.
      009A62 9A 3C                 4318         .word      LINK
                           0019E4  4319 LINK = . 
      009A64 05                    4320         .byte      5
      009A65 3E 4E 41 4D 45        4321         .ascii     ">NAME"
      009A6A                       4322 TNAME:
      009A6A CD 87 5A         [ 4] 4323         CALL     CNTXT   ;vocabulary link
      009A6D CD 85 73         [ 4] 4324 TNAM2:  CALL     AT
      009A70 CD 86 1A         [ 4] 4325         CALL     DUPP    ;?last word in a vocabulary
      009A73 CD 85 28         [ 4] 4326         CALL     QBRAN
      009A76 9A 91                 4327         .word      TNAM4
      009A78 CD 88 00         [ 4] 4328         CALL     DDUP
      009A7B CD 92 01         [ 4] 4329         CALL     NAMET
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



      009A7E CD 86 8F         [ 4] 4330         CALL     XORR    ;compare
      009A81 CD 85 28         [ 4] 4331         CALL     QBRAN
      009A84 9A 8B                 4332         .word      TNAM3
      009A86 CD 8A F3         [ 4] 4333         CALL     CELLM   ;continue with next word
      009A89 20 E2            [ 2] 4334         JRA     TNAM2
      009A8B CD 86 2A         [ 4] 4335 TNAM3:  CALL     SWAPP
      009A8E CC 86 10         [ 2] 4336         JP     DROP
      009A91 CD 87 F5         [ 4] 4337 TNAM4:  CALL     DDROP
      009A94 CC 8B 7B         [ 2] 4338         JP     ZERO
                                   4339 
                                   4340 ;       .ID     ( na -- )
                                   4341 ;        Display  name at address.
      009A97 9A 64                 4342         .word      LINK
                           001A19  4343 LINK = . 
      009A99 03                    4344         .byte      3
      009A9A 2E 49 44              4345         .ascii     ".ID"
      009A9D                       4346 DOTID:
      009A9D CD 87 C4         [ 4] 4347         CALL     QDUP    ;if zero no name
      009AA0 CD 85 28         [ 4] 4348         CALL     QBRAN
      009AA3 9A B3                 4349         .word      DOTI1
      009AA5 CD 8C 52         [ 4] 4350         CALL     COUNT
      009AA8 CD 84 F5         [ 4] 4351         CALL     DOLIT
      009AAB 00 1F                 4352         .word      0x1F
      009AAD CD 86 66         [ 4] 4353         CALL     ANDD    ;mask lexicon bits
      009AB0 CC 99 A2         [ 2] 4354         JP     UTYPE
      009AB3 CD 90 20         [ 4] 4355 DOTI1:  CALL     DOTQP
      009AB6 09                    4356         .byte      9
      009AB7 20 6E 6F 4E 61 6D 65  4357         .ascii     " noName"
      009ABE 81               [ 4] 4358         RET
                                   4359 
                           000000  4360 WANT_SEE=0
                           000000  4361 .if WANT_SEE 
                                   4362 ;       SEE     ( -- ; <string> )
                                   4363 ;       A simple decompiler.
                                   4364 ;       Updated for byte machines.
                                   4365         .word      LINK
                                   4366 LINK = . 
                                   4367         .byte      3
                                   4368         .ascii     "SEE"
                                   4369 SEE:
                                   4370         CALL     TICK    ;starting address
                                   4371         CALL     CR
                                   4372         CALL     ONEM
                                   4373 SEE1:   CALL     ONEP
                                   4374         CALL     DUPP
                                   4375         CALL     AT
                                   4376         CALL     DUPP
                                   4377         CALL     QBRAN
                                   4378         .word    SEE2
                                   4379         CALL     TNAME   ;?is it a name
                                   4380 SEE2:   CALL     QDUP    ;name address or zero
                                   4381         CALL     QBRAN
                                   4382         .word    SEE3
                                   4383         CALL     SPACE
                                   4384         CALL     DOTID   ;display name
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



                                   4385         CALL     ONEP
                                   4386         JRA      SEE4
                                   4387 SEE3:   CALL     DUPP
                                   4388         CALL     CAT
                                   4389         CALL     UDOT    ;display number
                                   4390 SEE4:   CALL     NUFQ    ;user control
                                   4391         CALL     QBRAN
                                   4392         .word    SEE1
                                   4393         JP     DROP
                                   4394 .endif ; WANT_SEE 
                                   4395 
                                   4396 ;       WORDS   ( -- )
                                   4397 ;       Display names in vocabulary.
      009ABF 9A 99                 4398         .word      LINK
                           001A41  4399 LINK = . 
      009AC1 05                    4400         .byte      5
      009AC2 57 4F 52 44 53        4401         .ascii     "WORDS"
      009AC7                       4402 WORDS:
      009AC7 CD 8F E1         [ 4] 4403         CALL     CR
      009ACA CD 87 5A         [ 4] 4404         CALL     CNTXT   ;only in context
      009ACD CD 85 73         [ 4] 4405 WORS1:  CALL     AT
      009AD0 CD 87 C4         [ 4] 4406         CALL     QDUP    ;?at end of list
      009AD3 CD 85 28         [ 4] 4407         CALL     QBRAN
      009AD6 9A E9                 4408         .word      WORS2
      009AD8 CD 86 1A         [ 4] 4409         CALL     DUPP
      009ADB CD 8F 99         [ 4] 4410         CALL     SPACE
      009ADE CD 9A 9D         [ 4] 4411         CALL     DOTID   ;display a name
      009AE1 CD 8A F3         [ 4] 4412         CALL     CELLM
      009AE4 CD 85 3F         [ 4] 4413         CALL     BRAN
      009AE7 9A CD                 4414         .word      WORS1
      009AE9 81               [ 4] 4415 WORS2:  RET
                                   4416 
                                   4417         
                                   4418 ;; Hardware reset
                                   4419 
                                   4420 ;       hi      ( -- )
                                   4421 ;       Display sign-on message.
      009AEA 9A C1                 4422         .word      LINK
                           001A6C  4423 LINK = . 
      009AEC 02                    4424         .byte      2
      009AED 68 69                 4425         .ascii     "hi"
      009AEF                       4426 HI:
      009AEF CD 8F E1         [ 4] 4427         CALL     CR
      009AF2 CD 90 20         [ 4] 4428         CALL     DOTQP   ;initialize I/O
      009AF5 0F                    4429         .byte      15
      009AF6 73 74 6D 38 65 46 6F  4430         .ascii     "stm8eForth v"
             72 74 68 20 76
      009B02 33                    4431 	.byte      VER+'0'
      009B03 2E                    4432         .byte      '.' 
      009B04 30                    4433 	.byte      EXT+'0' ;version
      009B05 CD 90 20         [ 4] 4434         CALL    DOTQP
                           000001  4435 .if NUCLEO          
      009B08 12                    4436         .byte 18
      009B09 20 6F 6E 20 4E 55 43  4437         .ascii  " on NUCLEO-8S208RB"
             4C 45 4F 2D 38 53 32
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal  30-Bits]



             30 38 52 42
                                   4438 .endif
                           000000  4439 .if DISCOVERY
                                   4440         .byte 19
                                   4441         .ascii  " on STM8S-DISCOVERY"
                                   4442 .endif
                           000000  4443 .if DOORBELL
                                   4444         .byte 16
                                   4445         .ascii " on stm8s105k6b6"
                                   4446 .endif
      009B18 38 52 42         [ 2] 4447         JP     CR
                                   4448 
                           000000  4449 WANT_DEBUG=0
                           000000  4450 .if WANT_DEBUG 
                                   4451 ;       DEBUG      ( -- )
                                   4452 ;       Display sign-on message.
                                   4453 ;        .word      LINK
                                   4454 LINK = . 
                                   4455         .byte      5
                                   4456         .ascii     "DEBUG"
                                   4457 DEBUG:
                                   4458 	CALL DOLIT
                                   4459 	.word 0x65
                                   4460 	CALL EMIT
                                   4461 	CALL DOLIT
                                   4462 	.word 0
                                   4463  	CALL ZLESS 
                                   4464 	CALL DOLIT
                                   4465 	.word 0xFFFE
                                   4466 	CALL ZLESS 
                                   4467 	CALL UPLUS 
                                   4468  	CALL DROP 
                                   4469 	CALL DOLIT
                                   4470 	.word 3
                                   4471 	CALL UPLUS 
                                   4472 	CALL UPLUS 
                                   4473  	CALL DROP
                                   4474 	CALL DOLIT
                                   4475 	.word 0x43
                                   4476 	CALL UPLUS 
                                   4477  	CALL DROP
                                   4478 	CALL EMIT
                                   4479 	CALL DOLIT
                                   4480 	.word 0x4F
                                   4481 	CALL DOLIT
                                   4482 	.word 0x6F
                                   4483  	CALL XORR
                                   4484 	CALL DOLIT
                                   4485 	.word 0xF0
                                   4486  	CALL ANDD
                                   4487 	CALL DOLIT
                                   4488 	.word 0x4F
                                   4489  	CALL ORR
                                   4490 	CALL EMIT
                                   4491 	CALL DOLIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



                                   4492 	.word 8
                                   4493 	CALL DOLIT
                                   4494 	.word 6
                                   4495  	CALL SWAPP
                                   4496 	CALL OVER
                                   4497 	CALL XORR
                                   4498 	CALL DOLIT
                                   4499 	.word 3
                                   4500 	CALL ANDD 
                                   4501 	CALL ANDD
                                   4502 	CALL DOLIT
                                   4503 	.word 0x70
                                   4504 	CALL UPLUS 
                                   4505 	CALL DROP
                                   4506 	CALL EMIT
                                   4507 	CALL DOLIT
                                   4508 	.word 0
                                   4509 	CALL QBRAN
                                   4510 	.word DEBUG1
                                   4511 	CALL DOLIT
                                   4512 	.word 0x3F
                                   4513 DEBUG1:
                                   4514 	CALL DOLIT
                                   4515 	.word 0xFFFF
                                   4516 	CALL QBRAN
                                   4517 	.word DEBUG2
                                   4518 	CALL DOLIT
                                   4519 	.word 0x74
                                   4520 	CALL BRAN
                                   4521 	.word DEBUG3
                                   4522 DEBUG2:
                                   4523 	CALL DOLIT
                                   4524 	.word 0x21
                                   4525 DEBUG3:
                                   4526 	CALL EMIT
                                   4527 	CALL DOLIT
                                   4528 	.word 0x68
                                   4529 	CALL DOLIT
                                   4530 	.word 0x80
                                   4531 	CALL STORE
                                   4532 	CALL DOLIT
                                   4533 	.word 0x80
                                   4534 	CALL AT
                                   4535 	CALL EMIT
                                   4536 	CALL DOLIT
                                   4537 	.word 0x4D
                                   4538 	CALL TOR
                                   4539 	CALL RAT
                                   4540 	CALL RFROM
                                   4541 	CALL ANDD
                                   4542 	CALL EMIT
                                   4543 	CALL DOLIT
                                   4544 	.word 0x61
                                   4545 	CALL DOLIT
                                   4546 	.word 0xA
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



                                   4547 	CALL TOR
                                   4548 DEBUG4:
                                   4549 	CALL DOLIT
                                   4550 	.word 1
                                   4551 	CALL UPLUS 
                                   4552 	CALL DROP
                                   4553 	CALL DONXT
                                   4554 	.word DEBUG4
                                   4555 	CALL EMIT
                                   4556 	CALL DOLIT
                                   4557 	.word 0x656D
                                   4558 	CALL DOLIT
                                   4559 	.word 0x100
                                   4560 	CALL UMSTA
                                   4561 	CALL SWAPP
                                   4562 	CALL DOLIT
                                   4563 	.word 0x100
                                   4564 	CALL UMSTA
                                   4565 	CALL SWAPP 
                                   4566 	CALL DROP
                                   4567 	CALL EMIT
                                   4568 	CALL EMIT
                                   4569 	CALL DOLIT
                                   4570 	.word 0x2043
                                   4571 	CALL DOLIT
                                   4572 	.word 0
                                   4573 	CALL DOLIT
                                   4574 	.word 0x100
                                   4575 	CALL UMMOD
                                   4576 	CALL EMIT
                                   4577 	CALL EMIT
                                   4578 	;JP ORIG
                                   4579 	RET
                                   4580 .endif ; WANT_DEBUG 
                                   4581 
                                   4582 
                                   4583 ;       'BOOT   ( -- a )
                                   4584 ;       The application startup vector.
      009B1B CC 8F                 4585         .word      LINK
                           001AA0  4586 LINK = . 
      009B1D E1                    4587         .byte      5
      009B1E 9A EC 05 27 42        4588         .ascii     "'BOOT"
      001AA6                       4589 TBOOT:
      009B23 4F 4F 54         [ 4] 4590         CALL     DOVAR
      009B26 40 02                 4591         .word    APP_RUN      ;application to boot
                                   4592 
                                   4593 ;       COLD    ( -- )
                                   4594 ;       The hilevel cold start s=ence.
      009B26 CD 86                 4595         .word      LINK
                           001AAD  4596         LINK = . 
      009B28 C7                    4597         .byte      4
      009B29 40 02 9B 20           4598         .ascii     "COLD"
      001AB2                       4599 COLD:
                           000000  4600 .if WANT_DEBUG
                                   4601         CALL DEBUG
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



                                   4602 .endif ; WANT_DEBUG
      009B2D 04 43 4F         [ 4] 4603 COLD1:  CALL     DOLIT
      009B30 4C 44                 4604         .word      UZERO
      009B32 CD 04 75         [ 4] 4605 	CALL     DOLIT
      009B32 CD 84                 4606         .word      UPP
      009B34 F5 80 AB         [ 4] 4607         CALL     DOLIT
      009B37 CD 84                 4608 	.word      UEND-UZERO
      009B39 F5 00 06         [ 4] 4609         CALL     CMOVE   ;initialize user area
                                   4610 
                                   4611 ; if APP_RUN==0 initialize with ca de 'hi'  
      009B3C CD 84 F5 00      [ 2] 4612         ldw y,APP_RUN 
      009B40 1A CD            [ 1] 4613         jrne 0$
      009B42 8C B6 90         [ 2] 4614         subw x,#CELLL 
      009B45 CE 40 02 26      [ 2] 4615         ldw y,#HI  
      009B49 0B               [ 2] 4616         ldw (x),y
      009B4A 1D 00 02         [ 4] 4617         call UPDATRUN 
      001AD5                       4618 0$:        
                                   4619 ; update LAST with APP_LAST 
                                   4620 ; if APP_LAST > LAST else do the opposite
      009B4D 90 AE 9A EF      [ 2] 4621         ldw y,APP_LAST 
      009B51 FF CD 9C         [ 2] 4622         cpw y,ULAST 
      009B54 4D 05            [ 1] 4623         jrugt 1$ 
                                   4624 ; save LAST at APP_LAST  
      009B55 CD 1B B5         [ 4] 4625         call UPDATLAST 
      009B55 90 CE            [ 2] 4626         jra 2$
      001AE3                       4627 1$: ; update LAST with APP_LAST 
      009B57 40 00 90         [ 2] 4628         ldw ULAST,y
      009B5A B3 1A 22         [ 2] 4629         ldw UCNTXT,y
      001AE9                       4630 2$:  
                                   4631 ; update APP_CP if < app_space 
      009B5D 05 CD 9C 35      [ 2] 4632         ldw y,APP_CP  
      009B61 20 06 18         [ 2] 4633         cpw y,UCP   
      009B63 24 06            [ 1] 4634         jruge 3$ 
      009B63 90 BF 1A         [ 4] 4635         call UPDATCP
      009B66 90 BF 14         [ 2] 4636         ldw y,UCP   
      009B69                       4637 3$:
      009B69 90 CE 40         [ 2] 4638         ldw UCP,y                 
                                   4639 ; update UVP with APP_VP  
                                   4640 ; if APP_VP>UVP else do the opposite 
      009B6C 04 90 B3 18      [ 2] 4641         ldw y,APP_VP 
      009B70 24 06 CD         [ 2] 4642         cpw y,UVP 
      009B73 9C 5E            [ 1] 4643         jrugt 4$
      009B75 90 BE 18         [ 4] 4644         call UPDATVP 
      009B78 20 03            [ 2] 4645         jra 6$
      001B09                       4646 4$: ; update UVP with APP_VP 
      009B78 90 BF 18         [ 2] 4647         ldw UVP,y 
      001B0C                       4648 6$:      
      009B7B 90 CE 40         [ 4] 4649         CALL     PRESE   ;initialize data stack and TIB
      009B7E 06 90 B3         [ 4] 4650         CALL     TBOOT
      009B81 16 22 05         [ 4] 4651         CALL     ATEXE   ;application boot
      009B84 CD 9C 75         [ 4] 4652         CALL     OVERT
      009B87 20 03 81         [ 2] 4653         JP     QUIT    ;start interpretation
                                   4654 
                                   4655 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



                                   4656         .include "flash.asm"
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
      009B89 1A AD                   30     .word LINK 
                           001B1D    31     LINK=.
      009B89 90                      32     .byte 3 
      009B8A BF 16 21                33     .ascii "FP!"
      009B8C                         34 FPSTOR:
      009B8C CD 94            [ 1]   35     ldw y,x
      009B8E E4 CD            [ 2]   36     ldw y,(y)
      009B90 9B 26            [ 1]   37     ld a,yl 
      009B92 CD 8C            [ 1]   38     ld FPTR,a 
      009B94 9F CD 97         [ 2]   39     addw x,#CELLL 
      009B97 AD CC            [ 1]   40     ldw y,x 
      009B99 95 01            [ 2]   41     ldw y,(y)
      009B9B 9B 2D 03         [ 2]   42     ldw PTR16,y
      009B9E 46 50 21         [ 2]   43     addw x,#CELLL 
      009BA1 81               [ 4]   44     ret 
                                     45 
                                     46 ;-----------------------------------
                                     47 ; return EEPROM base address 
                                     48 ; as a double 
                                     49 ;  EEPROM  ( -- ud )
                                     50 ;-----------------------------------
      009BA1 90 93                   51     .word LINK 
                           001B39    52 LINK=.
      009BA3 90                      53     .byte 6 
      009BA4 FE 90 9F B7 32 1C       54     .ascii "EEPROM"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



      001B40                         55 EEPROM: 
      009BAA 00 02 90 93      [ 2]   56     ldw y,#EEPROM_BASE
      009BAE 90 FE 90         [ 2]   57     subw x,#2*CELLL 
      009BB1 BF 33            [ 2]   58     ldw (2,x),y 
      009BB3 1C 00            [ 1]   59     clrw y 
      009BB5 02               [ 2]   60     ldw (x),y 
      009BB6 81               [ 4]   61     ret
                                     62 
                                     63 ;---------------------------------
                                     64 ; return APP_LAST pointer as double
                                     65 ; EEP-LAST ( -- ud )
                                     66 ;---------------------------------
      009BB7 9B 9D                   67 	.word LINK 
                           001B4F    68 	LINK=.
      009BB9 06                      69 	.byte 8 
      009BBA 45 45 50 52 4F 4D 53    70 	.ascii "EEP-LAST"
             54
      009BC0                         71 EEPLAST:
      009BC0 90 AE 40         [ 2]   72 	subw x,#2*CELLL 
      009BC3 00 1D 00 04      [ 2]   73 	ldw y,#APP_LAST 
      009BC7 EF 02            [ 2]   74 	ldw (2,x),y 
      009BC9 90 5F            [ 1]   75 	clrw y 
      009BCB FF               [ 2]   76 	ldw (x),y 
      009BCC 81               [ 4]   77 	ret 
                                     78 
                                     79 ;----------------------------------
                                     80 ; return APP_RUN pointer as double	
                                     81 ; EEP-RUN ( -- ud )
                                     82 ;-----------------------------------
      009BCD 9B B9                   83 	.word LINK 
                           001B67    84 	LINK=.
      009BCF 08                      85 	.byte 7
      009BD0 45 45 50 2D 4C 41 53    86 	.ascii "EEP-RUN"
      001B6F                         87 EEPRUN:
      009BD7 54 00 04         [ 2]   88 	subw x,#2*CELLL 
      009BD8 90 AE 40 02      [ 2]   89 	ldw y,#APP_RUN 
      009BD8 1D 00            [ 2]   90 	ldw (2,x),y 
      009BDA 04 90            [ 1]   91 	clrw y 
      009BDC AE               [ 2]   92 	ldw (x),y 
      009BDD 40               [ 4]   93 	ret 
                                     94 
                                     95 ;------------------------------------
                                     96 ; return APP_CP pointer as double 
                                     97 ; EEP-CP ( -- ud )
                                     98 ;------------------------------------
      009BDE 00 EF                   99 	.word LINK
                           001B7E   100 	LINK=.
      009BE0 02                     101 	.byte 6 
      009BE1 90 5F FF 81 9B CF      102 	.ascii "EEP-CP"
      001B85                        103 EEPCP:
      009BE7 07 45 45         [ 2]  104 	subw x,#2*CELLL 
      009BEA 50 2D 52 55      [ 2]  105 	ldw y,#APP_CP  
      009BEE 4E 02            [ 2]  106 	ldw (2,x),y 
      009BEF 90 5F            [ 1]  107 	clrw y 
      009BEF 1D               [ 2]  108 	ldw (x),y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



      009BF0 00               [ 4]  109 	ret 
                                    110 
                                    111 ;------------------------------------
                                    112 ; return APP_VP pointer as double 
                                    113 ; EEP-VP ( -- ud )
                                    114 ;-------------------------------------
      009BF1 04 90                  115 	.word LINK
                           001B94   116 	LINK=.
      009BF3 AE                     117 	.byte 6
      009BF4 40 02 EF 02 90 5F      118 	.ascii "EEP-VP"
      001B9B                        119 EEPVP:
      009BFA FF 81 9B         [ 2]  120 	subw x,#2*CELLL 
      009BFD E7 06 45 45      [ 2]  121 	ldw y,#APP_VP  
      009C01 50 2D            [ 2]  122 	ldw (2,x),y 
      009C03 43 50            [ 1]  123 	clrw y 
      009C05 FF               [ 2]  124 	ldw (x),y 
      009C05 1D               [ 4]  125 	ret 
                                    126 
                                    127 ;----------------------------------
                                    128 ; update APP_LAST with LAST 
                                    129 ; UPDAT-LAST ( -- )
                                    130 ;----------------------------------
      009C06 00 04                  131 	.word LINK 
                           001BAA   132 	LINK=.
      009C08 90                     133 	.byte 10
      009C09 AE 40 04 EF 02 90 5F   134 	.ascii "UPDAT-LAST"
             FF 81 9B
      001BB5                        135 UPDATLAST:
      009C13 FE 06 45         [ 4]  136 	call LAST
      009C16 45 50 2D         [ 4]  137 	call AT  
      009C19 56 50 58         [ 4]  138 	call EEPLAST
      009C1B CC 1D AB         [ 2]  139 	jp EESTORE 
                                    140 
                                    141 ;---------------------------------
                                    142 ; update APP_RUN 
                                    143 ; UPDAT-RUN ( a -- )
                                    144 ;---------------------------------
      009C1B 1D 00                  145 	.word LINK
                           001BC3   146 	LINK=.
      009C1D 04                     147 	.byte 9
      009C1E 90 AE 40 06 EF 02 90   148 	.ascii "UPDAT-RUN"
             5F FF
      001BCD                        149 UPDATRUN:
      009C27 81 9C 14         [ 4]  150 	call EEPRUN
      009C2A 0A 55 50         [ 2]  151 	jp EESTORE 
                                    152 	
                                    153 ;---------------------------------
                                    154 ; update APP_CP with CP 
                                    155 ; UPDAT-CP ( -- )
                                    156 ;---------------------------------
      009C2D 44 41                  157 	.word LINK 
                           001BD5   158 	LINK=.
      009C2F 54                     159 	.byte 8 
      009C30 2D 4C 41 53 54 2D 43   160 	.ascii "UPDAT-CP"
             50
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      009C35                        161 UPDATCP:
      009C35 CD 87 86         [ 4]  162 	call CPP 
      009C38 CD 85 73         [ 4]  163 	call AT 
      009C3B CD 9B D8         [ 4]  164 	call EEPCP 
      009C3E CC 9E 2B         [ 2]  165 	jp EESTORE 
                                    166 
                                    167 ;----------------------------------
                                    168 ; update APP_VP with VP 
                                    169 ; UPDAT-VP ( -- )
                                    170 ;----------------------------------
      009C41 9C 2A                  171 	.word LINK
                           001BEC   172 	LINK=.
      009C43 09                     173 	.byte 8 
      009C44 55 50 44 41 54 2D 52   174 	.ascii "UPDAT-VP" 
             55
      001BF5                        175 UPDATVP:
      009C4C 4E 06 E8         [ 4]  176 	call VPP 
      009C4D CD 04 F3         [ 4]  177 	call AT
      009C4D CD 9B EF         [ 4]  178 	call EEPVP 
      009C50 CC 9E 2B         [ 2]  179 	jp EESTORE
                                    180 	
                           000001   181 .if NUCLEO
                                    182 ;----------------------------------
                                    183 ; fetch integer at address over 65535
                                    184 ;  F@   ( ud -- n )
                                    185 ;----------------------------------
      009C53 9C 43                  186     .word LINK 
                           001C03   187 LINK=.
      009C55 08                     188     .byte 2
      009C56 55 50                  189     .ascii "F@"
      001C06                        190 FARAT:
      009C58 44 41 54         [ 4]  191     call FPSTOR
      009C5B 2D 43 50         [ 2]  192 	jp EE_READ 
                                    193 
                                    194 
                                    195 ;-------------------------------------
                                    196 ; fetch C at address over 65535 
                                    197 ; FC@ ( ud -- c)
                                    198 ;-------------------------------------
      009C5E 1C 03                  199     .word LINK
                           001C0E   200     LINK=.
      009C5E CD                     201     .byte 3 
      009C5F 87 76 CD               202     .ascii "FC@" 
      001C12                        203 FARCAT:
      009C62 85 73 CD         [ 4]  204     call FPSTOR
      009C65 9C 05 CC         [ 2]  205 	jp EE_CREAD  
                                    206 .endif ; NUCLEO 
                                    207 
                                    208 ;----------------------------------
                                    209 ; UNLOCK EEPROM/OPT for writing/erasing
                                    210 ; wait endlessly for FLASH_IAPSR_DUL bit.
                                    211 ;  UNLKEE   ( -- )
                                    212 ;----------------------------------
      009C68 9E 2B                  213     .word LINK 
                           001C1A   214 LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



      009C6A 9C                     215     .byte 6 
      009C6B 55 08 55 50 44 41      216     .ascii "UNLKEE"
      001C21                        217 UNLKEE:
      009C71 54 2D 56 50      [ 1]  218 	mov FLASH_CR2,#0 
      009C75 35 FF 50 5C      [ 1]  219 	mov FLASH_NCR2,#0xFF 
      009C75 CD 87 68 CD      [ 1]  220 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      009C79 85 73 CD 9C      [ 1]  221     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      009C7D 1B CC 9E 2B 9C   [ 2]  222 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      009C82 6C               [ 4]  223 	ret
                                    224 
                                    225 ;----------------------------------
                                    226 ; UNLOCK FLASH for writing/erasing
                                    227 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                    228 ; UNLKFL  ( -- )
                                    229 ;----------------------------------
      009C83 02 46                  230     .word LINK 
                           001C39   231 LINK=. 
      009C85 40                     232     .byte 6 
      009C86 55 4E 4C 4B 46 4C      233     .ascii "UNLKFL"    
      001C40                        234 UNLKFL:
      009C86 CD 9B A1 CC      [ 1]  235 	mov FLASH_CR2,#0 
      009C8A 9D 4E 9C 83      [ 1]  236 	mov FLASH_NCR2,#0xFF 
      009C8E 03 46 43 40      [ 1]  237 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      009C92 35 AE 50 62      [ 1]  238 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      009C92 CD 9B A1 CC 9D   [ 2]  239 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      009C97 70               [ 4]  240 	ret
                                    241 
                                    242 ;-----------------------------
                                    243 ; UNLOCK FLASH or EEPROM 
                                    244 ; according to FPTR address 
                                    245 ;  UNLOCK ( -- )
                                    246 ;-----------------------------
      009C98 9C 8E                  247 	.word LINK 
                           001C58   248 	LINK=.
      009C9A 06                     249 	.byte 6
      009C9B 55 4E 4C 4B 45 45      250 	.ascii "UNLOCK"
      009CA1                        251 UNLOCK:
                                    252 ; put addr[15:0] in Y, for bounds check.
      009CA1 35 00 50         [ 2]  253 	ldw y,PTR16   ; Y=addr15:0
                                    254 ; check addr[23:16], if <> 0 then it is extened flash memory
      009CA4 5B 35            [ 1]  255 	tnz FPTR 
      009CA6 FF 50            [ 1]  256 	jrne 4$
      009CA8 5C 35 AE 50      [ 2]  257     cpw y,#FLASH_BASE
      009CAC 64 35            [ 1]  258     jruge 4$
      009CAE 56 50 64 72      [ 2]  259 	cpw y,#EEPROM_BASE  
      009CB2 07 50            [ 1]  260     jrult 9$
      009CB4 5F FB 81 9C      [ 2]  261 	cpw y,#OPTION_END 
      009CB8 9A 06            [ 1]  262 	jrugt 9$
      009CBA 55 4E 4C         [ 4]  263 	call UNLKEE
      009CBD 4B               [ 4]  264 	ret 
      009CBE 46 4C 40         [ 4]  265 4$: call UNLKFL
      009CC0 81               [ 4]  266 9$: ret 
                                    267 
                                    268 ;-------------------------
                                    269 ; LOCK write access to 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



                                    270 ; FLASH and EEPROM 
                                    271 ; LOCK ( -- )
                                    272 ;-------------------------
      009CC0 35 00                  273 	.word LINK 
                           001C82   274 	LINK=.
      009CC2 50                     275 	.byte 4 
      009CC3 5B 35 FF 50            276 	.ascii "LOCK" 
      001C87                        277 LOCK: 
      009CC7 5C 35 56 50      [ 1]  278 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      009CCB 62 35 AE 50      [ 1]  279 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009CCF 62               [ 4]  280 	ret 
                                    281 
                                    282 ;-------------------------
                                    283 ; increment FPTR 
                                    284 ; INC-FPTR ( -- )
                                    285 ;-------------------------
      009CD0 72 03                  286 	.word LINK 
                           001C92   287 	LINK=. 
      009CD2 50                     288 	.byte 8 
      009CD3 5F FB 81 9C B9 06 55   289 	.ascii "INC-FPTR" 
             4E
      001C9B                        290 INC_FPTR:
      009CDB 4C 4F            [ 1]  291 	inc PTR8 
      009CDD 43 4B            [ 1]  292 	jrne 1$
      009CDF 90 89            [ 2]  293 	pushw y 
      009CDF 90 BE 33         [ 2]  294 	ldw y,FPTR 
      009CE2 3D 32            [ 1]  295 	incw y 
      009CE4 26 16 90         [ 2]  296 	ldw FPTR,y
      009CE7 A3 80            [ 2]  297 	popw y  
      009CE9 00               [ 4]  298 1$: ret 
                                    299 
                                    300 ;------------------------------
                                    301 ; add u to FPTR 
                                    302 ; PTR+ ( u -- )
                                    303 ;------------------------------
      009CEA 24 10                  304 	.word LINK 
                           001CAE   305 	LINK=.
      009CEC 90                     306 	.byte 4 
      009CED A3 40 00 25            307 	.ascii "PTR+"
      001CB3                        308 PTRPLUS:
      009CF1 0D 90            [ 1]  309 	ldw y,x 
      009CF3 A3 48 7F         [ 2]  310 	addw x,#CELLL 
      009CF6 22 07 CD 9C      [ 2]  311 	addw y,PTR16 
      009CFA A1 81 CD         [ 2]  312 	ldw PTR16,y  
      009CFD 9C C0            [ 1]  313 	jrnc 1$
      009CFF 81 9C            [ 1]  314 	inc FPTR 
      009D01 D8               [ 4]  315 1$: ret 
                                    316 
                                    317 ;---------------------------------
                                    318 ; read word at address pointed FPTR
                                    319 ; increment FPTR 
                                    320 ; EE-READ ( -- w )
                                    321 ;------------------------------------
      009D02 04 4C                  322 	.word LINK 
                           001CC6   323 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      009D04 4F                     324 	.byte 7 
      009D05 43 4B 2D 52 45 41 44   325 	.ascii "EE-READ"
      009D07                        326 EE_READ:
      009D07 72 13 50         [ 2]  327 	subw x,#CELLL 
      009D0A 5F 72 17 50      [ 5]  328 	ldf a,[FPTR]
      009D0E 5F 81            [ 1]  329 	ld yh,a 
      009D10 9D 02 08         [ 4]  330 	call INC_FPTR 
      009D13 49 4E 43 2D      [ 5]  331 	ldf a,[FPTR]
      009D17 46 50 54         [ 4]  332 	call INC_FPTR 
      009D1A 52 97            [ 1]  333 	ld yl,a 
      009D1B FF               [ 2]  334 	ldw (x),y 
      009D1B 3C               [ 4]  335 	ret 
                                    336 
                                    337 ;---------------------------------------
                                    338 ; Read byte at address pointed by FPTR 
                                    339 ; EE-CREAD ( -- c )
                                    340 ;---------------------------------------
      009D1C 34 26                  341 	.word LINK 
                           001CE7   342 	LINK=.
      009D1E 0C                     343 	.byte 8
      009D1F 90 89 90 BE 32 90 5C   344 	.ascii "EE-CREAD" 
             90
      001CF0                        345 EE_CREAD:
      009D27 BF 32 90         [ 2]  346 	subw x,#CELLL 
      009D2A 85 81 9D 12      [ 5]  347 	ldf a,[FPTR]	
      009D2E 04 50 54         [ 4]  348 	call INC_FPTR
      009D31 52 2B            [ 1]  349 	clrw y 
      009D33 90 97            [ 1]  350 	ld yl,a 
      009D33 90               [ 2]  351 	ldw (x),y 
      009D34 93               [ 4]  352 	ret 
                                    353 
                                    354 ;----------------------------
                                    355 ; write a byte at address pointed 
                                    356 ; by FPTR and increment FPTR.
                                    357 ; Expect pointer already initialized 
                                    358 ; and memory unlocked 
                                    359 ; WR-BYTE ( c -- )
                                    360 ;----------------------------
      009D35 1C 00                  361 	.word LINK 
                           001D02   362 	LINK=. 
      009D37 02                     363 	.byte 7 
      009D38 72 B9 00 33 90 BF 33   364 	.ascii "WR-BYTE" 
                                    365 
      001D0A                        366 WR_BYTE:
      009D3F 24 02 3C         [ 4]  367 	call FC_XOFF
      009D42 32 81            [ 1]  368 	ldw y,x 
      009D44 9D 2E            [ 2]  369 	ldw y,(y)
      009D46 07 45 45         [ 2]  370 	addw x,#CELLL 
      009D49 2D 52            [ 1]  371 	ld a,yl
      009D4B 45 41 44 32      [ 4]  372 	ldf [FPTR],a
      009D4E 72 05 50 5F FB   [ 2]  373 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009D4E 1D 00 02         [ 4]  374 	call FC_XON
      009D51 92 BC 00         [ 2]  375 	jp INC_FPTR 
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
      009D54 32 90                  384 	.word LINK 
                           001D27   385 	LINK=.
      009D56 95                     386 	.byte 7 
      009D57 CD 9D 1B 92 BC 00 32   387 	.ascii "WR-WORD" 
      001D2F                        388 WR_WORD:
      009D5E CD 9D 1B         [ 4]  389 	call FC_XOFF
      009D61 90 97            [ 1]  390 	ldw y,x
      009D63 FF 81            [ 2]  391 	ldw y,(y)
      009D65 9D 46 08         [ 2]  392 	addw x,#CELLL 
      009D68 45 45            [ 1]  393 	ld a,yh 
      009D6A 2D 43 52 45      [ 4]  394 	ldf [FPTR],a
      009D6E 41 44 50 5F FB   [ 2]  395 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009D70 CD 1C 9B         [ 4]  396 	call INC_FPTR 
      009D70 1D 00            [ 1]  397 	ld a,yl 
      009D72 02 92 BC 00      [ 4]  398 	ldf [FPTR],a
      009D76 32 CD 9D 1B 90   [ 2]  399 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009D7B 5F 90 97         [ 4]  400 	call FC_XON
      009D7E FF 81 9D         [ 2]  401 	jp INC_FPTR 
                                    402 
                                    403 
                                    404 ;---------------------------------------
                                    405 ; write a byte to FLASH or EEPROM/OPTION  
                                    406 ; EEC!  (c ud -- )
                                    407 ;---------------------------------------
      009D81 67 07                  408     .word LINK 
                           001D5A   409 	LINK=.
      009D83 57                     410     .byte 4 
      009D84 52 2D 42 59            411     .ascii "EEC!"
                                    412 	; local variables 
                           000001   413 	BTW = 1   ; byte to write offset on stack
                           000002   414     OPT = 2 
                           000002   415 	VSIZE = 2
      001D5F                        416 EECSTORE:
      009D88 54 45            [ 2]  417 	sub sp,#VSIZE
      009D8A CD 1B 21         [ 4]  418     call FPSTOR
      009D8A CD 84            [ 1]  419 	ld a,(1,x)
      009D8C E1               [ 1]  420 	cpl a 
      009D8D 90 93            [ 1]  421 	ld (BTW,sp),a ; byte to write 
      009D8F 90 FE            [ 1]  422 	clr (OPT,sp)  ; OPTION flag
      009D91 1C 00 02         [ 4]  423 	call UNLOCK 
                                    424 	; check if option
      009D94 90 9F            [ 1]  425 	tnz FPTR 
      009D96 92 BD            [ 1]  426 	jrne 2$
      009D98 00 32 72         [ 2]  427 	ldw y,PTR16 
      009D9B 05 50 5F FB      [ 2]  428 	cpw y,#OPTION_BASE
      009D9F CD 84            [ 1]  429 	jrmi 2$
      009DA1 CB CC 9D 1B      [ 2]  430 	cpw y,#OPTION_END+1
      009DA5 9D 82            [ 1]  431 	jrpl 2$
      009DA7 07 57            [ 1]  432 	cpl (OPT,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



                                    433 	; OPTION WRITE require this UNLOCK 
      009DA9 52 2D 57 4F      [ 1]  434     bset FLASH_CR2,#FLASH_CR2_OPT
      009DAD 52 44 50 5C      [ 1]  435     bres FLASH_NCR2,#FLASH_CR2_OPT 
      009DAF                        436 2$: 
      009DAF CD 84 E1         [ 4]  437 	call WR_BYTE 	
      009DB2 90 93            [ 1]  438 	tnz (OPT,sp)
      009DB4 90 FE            [ 1]  439 	jreq 3$ 
      009DB6 1C 00            [ 1]  440     ld a,(BTW,sp)
      009DB8 02 90            [ 1]  441     clrw y
      009DBA 9E 92            [ 1]  442 	ld yl,a 
      009DBC BD 00 32         [ 2]  443 	subw x,#CELLL 
      009DBF 72               [ 2]  444 	ldw (x),y 
      009DC0 05 50 5F         [ 4]  445 	call WR_BYTE
      001D9F                        446 3$: 
      009DC3 FB CD 9D         [ 4]  447 	call LOCK 
      009DC6 1B 90            [ 2]  448 	addw sp,#VSIZE 
      009DC8 9F               [ 4]  449     ret
                                    450 
                                    451 ;------------------------------
                                    452 ; write integer in FLASH|EEPROM
                                    453 ; EE! ( n ud -- )
                                    454 ;------------------------------
      009DC9 92 BD                  455 	.word LINK 
                           001DA7   456 	LINK=.
      009DCB 00                     457 	.byte 3 
      009DCC 32 72 05               458 	.ascii "EE!"
      001DAB                        459 EESTORE:
      009DCF 50 5F FB         [ 4]  460 	call FPSTOR 
      009DD2 CD 84 CB         [ 4]  461 	call UNLOCK 
      009DD5 CC 9D            [ 1]  462 	ldw y,x 
      009DD7 1B 9D            [ 2]  463 	ldw y,(y)
      009DD9 A7 04            [ 2]  464 	pushw y 
      009DDB 45 45            [ 1]  465 	swapw y 
      009DDD 43               [ 2]  466 	ldw (x),y 
      009DDE 21 1D 0A         [ 4]  467 	call WR_BYTE 
      009DDF 90 85            [ 2]  468 	popw y 
      009DDF 52 02 CD         [ 2]  469 	subw x,#CELLL
      009DE2 9B               [ 2]  470 	ldw (x),y 
      009DE3 A1 E6 01         [ 4]  471 	call WR_BYTE
      009DE6 43 6B 01         [ 2]  472 	jp LOCK 
                                    473 
                                    474 
                                    475 ;----------------------------
                                    476 ; Erase flash memory row 
                                    477 ; stm8s208 as 128 bytes rows
                                    478 ; ROW-ERASE ( ud -- )
                                    479 ;----------------------------
      009DE9 0F 02                  480 	.word LINK 
                           001DCB   481 	LINK=. 
      009DEB CD                     482 	.byte 9 
      009DEC 9C DF 3D 32 26 19 90   483 	.ascii "ROW-ERASE" 
             BE 33
      001DD5                        484 row_erase:
      009DF5 90 A3 48         [ 4]  485 	call FC_XOFF
      009DF8 00 2B 10         [ 4]  486 	call FPSTOR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



                                    487 ;code must be execute from RAM 
                                    488 ;copy routine to PAD 
      009DFB 90 A3 48         [ 2]  489 	subw x,#CELLL 
      009DFE 80 2A 0A 03      [ 2]  490 	ldw y,#row_erase_proc
      009E02 02               [ 2]  491 	ldw (x),y 
      009E03 72 1E 50         [ 4]  492 	call PAD 
      009E06 5B 72 1F 50      [ 2]  493 	ldw y,#row_erase_proc_end 
      009E0A 5C A2 1E 2E      [ 2]  494 	subw y,#row_erase_proc
      009E0B 1D 00 02         [ 2]  495 	subw x,#CELLL 
      009E0B CD               [ 2]  496 	ldw (x),y 
      009E0C 9D 8A 0D         [ 4]  497 	call CMOVE 
      001DF5                        498 block_erase:
      009E0F 02 27 0D         [ 2]  499 	ldw y,FPTR+1
      009E12 7B 01 90 5F      [ 2]  500 	cpw y,#app_space 
      009E16 90 97            [ 1]  501 	jrpl erase_flash 
                                    502 ; erase EEPROM block
      009E18 1D 00 02 FF      [ 2]  503 	cpw y,#EEPROM_BASE 
      009E1C CD 9D            [ 1]  504 	jruge 1$
      009E1E 8A 04 4B         [ 4]  505 	call FC_XON
      009E1F 81               [ 4]  506 	ret ; bad address 
      009E1F CD 9D 07 5B      [ 2]  507 1$: cpw y,#EEPROM_END 
      009E23 02 81            [ 2]  508 	jrule 2$ 
      009E25 9D DA 03         [ 4]  509 	call FC_XON
      009E28 45               [ 4]  510 	ret ; bad address 
      001E12                        511 2$:	
      009E29 45 21 21         [ 4]  512 	call UNLKEE 
      009E2B 20 03            [ 2]  513 	jra proceed_erase
                                    514 ; erase flash block:
      001E17                        515 erase_flash:
      009E2B CD 9B A1         [ 4]  516 	call UNLKFL 
      001E1A                        517 proceed_erase:
      009E2E CD 9C DF         [ 4]  518 	call PAD 
      009E31 90 93            [ 1]  519 	ldw y,x
      009E33 90 FE            [ 2]  520 	ldw y,(y)
      009E35 90 89 90         [ 2]  521 	addw x,#CELLL  
      009E38 5E FF            [ 4]  522 	call (y) 
      009E3A CD 9D 8A 90      [ 1]  523 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009E3E 85 1D 00         [ 4]  524 	call FC_XON
      009E41 02               [ 4]  525 	ret 
                                    526 
                                    527 ; this routine is to be copied to PAD 
      001E2E                        528 row_erase_proc:
      009E42 FF CD 9D 8A      [ 1]  529 	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
      009E46 CC 9D 07 9E      [ 1]  530 	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
      009E4A 27               [ 1]  531 	clr a 
      009E4B 09 52            [ 1]  532 	clrw y 
      009E4D 4F 57 2D 45      [ 1]  533 	ldf ([FPTR],y),a
      009E51 52 41            [ 1]  534     incw y
      009E53 53 45 00 32      [ 1]  535 	ldf ([FPTR],y),a
      009E55 90 5C            [ 1]  536     incw y
      009E55 CD 84 E1 CD      [ 1]  537 	ldf ([FPTR],y),a
      009E59 9B A1            [ 1]  538     incw y
      009E5B 1D 00 02 90      [ 1]  539 	ldf ([FPTR],y),a
      009E5F AE 9E AE FF CD   [ 2]  540 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009E64 8C               [ 4]  541 	ret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



      001E55                        542 row_erase_proc_end:
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
      001E55                        555 copy_buffer:
      009E65 7A 90            [ 1]  556 	push #BLOCK_SIZE  
                                    557 ;enable block programming 
      009E67 AE 9E D5 72      [ 1]  558 	bset FLASH_CR2,#FLASH_CR2_PRG 
      009E6B A2 9E AE 1D      [ 1]  559 	bres FLASH_NCR2,#FLASH_CR2_PRG
      009E6F 00 02            [ 1]  560 	clrw y
      009E71 FF               [ 1]  561 1$:	ld a,(x)
      009E72 CD 8C B6 32      [ 1]  562 	ldf ([FPTR],y),a
      009E75 5C               [ 1]  563 	incw x 
      009E75 90 BE            [ 1]  564 	incw y 
      009E77 33 90            [ 1]  565 	dec (BCNT,sp)
      009E79 A3 A4            [ 1]  566 	jrne 1$
                                    567 ; wait EOP bit 
      009E7B 80 2A 19 90 A3   [ 2]  568 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. 
      009E80 40               [ 1]  569 	pop a ; remove BCNT from stack 
      009E81 00               [ 4]  570 	ret 
      001E74                        571 copy_buffer_end:
                                    572 
                                    573 ;-------------------------
                                    574 ; move program_row to RAM 
                                    575 ; in TIB 
                                    576 ;------------------------
      001E74                        577 copy_prog_to_ram:
      009E82 24 04 CD         [ 2]  578 	subw x,#6
      009E85 84 CB 81 90      [ 2]  579 	ldw y,#copy_buffer 
      009E89 A3 47            [ 2]  580 	ldw (4,x),y 
      009E8B FF 23 04 CD      [ 2]  581 	ldw y,#TIBBASE
      009E8F 84 CB            [ 2]  582 	ldw (2,x),y 
      009E91 81 AE 1E 74      [ 2]  583 	ldw y,#copy_buffer_end 
      009E92 72 A2 1E 55      [ 2]  584 	subw y,#copy_buffer  
      009E92 CD               [ 2]  585 	ldw (x),y 
      009E93 9C A1 20         [ 4]  586 	call CMOVE 
      009E96 03               [ 4]  587 	ret 
                                    588 
                                    589 
                                    590 ;-----------------------------
                                    591 ; write a row in FLASH/EEPROM 
                                    592 ; WR-ROW ( a ud -- )
                                    593 ; a -> address 128 byte buffer to write 
                                    594 ; ud ->  row address in FLASH|EEPROM 
                                    595 ;-----------------------------
      009E97 1D CB                  596 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



                           001E92   597 	LINK=.
      009E97 CD                     598 	.byte 6 
      009E98 9C C0 2D 52 4F 57      599 	.ascii "WR-ROW"
      009E9A                        600 write_row:
      009E9A CD 8C 7A         [ 4]  601 	call FC_XOFF
      009E9D 90 93 90         [ 4]  602 	call FPSTOR
                                    603 ; align to FLASH block 
      009EA0 FE 1C            [ 1]  604 	ld a,#0x80 
      009EA2 00 02            [ 1]  605 	and a,PTR8 
      009EA4 90 FD            [ 1]  606 	ld PTR8,a  
      009EA6 72 17 50         [ 4]  607 	call copy_prog_to_ram
      009EA9 5F CD 84         [ 4]  608 	call UNLOCK
      009EAC CB 81            [ 1]  609 	ldw y,x 
      009EAE 90 FE            [ 2]  610 	ldw y,(y)
      009EAE 35 20 50         [ 2]  611 	addw x,#CELLL 
      009EB1 5B               [ 2]  612 	pushw x 
      009EB2 35               [ 1]  613 	ldw x,y ; buffer address in x 
      009EB3 DF 50 5C         [ 4]  614 	call TIBBASE
      009EB6 4F 90 5F         [ 4]  615 	call LOCK
      009EB9 91               [ 2]  616 	popw x 
      009EBA A7 00 32         [ 4]  617 	call FC_XON 
      009EBD 90               [ 4]  618 	ret 
                                    619 
                                    620 ;-------------------------------------
                                    621 ; change value of OPTION register 
                                    622 ; SET-OPT (c n -- ) 
                                    623 ; c new value.
                                    624 ; n OPT  number {1..7}
                                    625 ;--------------------------------------
      009EBE 5C 91                  626 		.word LINK 
                           001EC1   627 		LINK=.
      009EC0 A7                     628 		.byte 7 
      009EC1 00 32 90 5C 91 A7 00   629 		.ascii "SET-OPT" 
      001EC9                        630 set_option: 
      009EC8 32 90            [ 1]  631 		ldw y,x 
      009ECA 5C 91            [ 2]  632 		ldw y,(y)
      009ECC A7 00            [ 1]  633 		jreq 1$
      009ECE 32 72 05 50      [ 2]  634 		cpw y,#7 
      009ED2 5F FB            [ 2]  635 		jrule 2$ 
                                    636 ; invalid OPTION number 		
      009ED4 81 00 04         [ 2]  637 1$:		addw x,#2*CELLL
      009ED5 81               [ 4]  638 		ret
      009ED5 90 58            [ 2]  639 2$:		sllw y 
      009ED5 4B 80 72 10      [ 2]  640 		addw y,#OPTION_BASE-1
      009ED9 50               [ 2]  641 		ldw (x),y 
      009EDA 5B 72 11         [ 2]  642 		subw x,#CELLL 
      009EDD 50 5C            [ 1]  643 		clrw y 
      009EDF 90               [ 2]  644 		ldw (x),y 
      009EE0 5F F6 91         [ 4]  645 		call EECSTORE
      009EE3 A7               [ 4]  646 		ret 
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
      009EE4 00 32                  655 	.word LINK  
                           001EEC   656 	LINK=.
      009EE6 5C                     657 	.byte 8 
      009EE7 90 5C 0A 01 26 F4 72   658 	.ascii "PRISTINE"
             05
      001EF5                        659 pristine:
                                    660 ;;; erase EEPROM
      009EEF 50 5F FB         [ 4]  661 	call EEPROM 
      009EF2 84 81 80         [ 4]  662 1$:	call DDUP 
      009EF4 CD 1D D5         [ 4]  663 	call row_erase
      009EF4 90 93            [ 1]  664 	ldw y,x 
      009EF4 1D 00 06         [ 2]  665 	ldw y,(2,y)
      009EF7 90 AE 9E D5      [ 2]  666 	addw y,#BLOCK_SIZE
      009EFB EF 04            [ 2]  667 	ldw (2,x),y
      009EFD 90 AE 17 00      [ 2]  668 	cpw y,#OPTION_BASE 
      009F01 EF 02            [ 1]  669 	jrult 1$
                                    670 ;;; reset OPTION to default values
      009F03 90 AE 9E F4      [ 2]  671 	ldw y,#1 ; OPT1 
      009F07 72               [ 2]  672 2$:	ldw (x),y   
      009F08 A2 9E            [ 1]  673 	clrw y 
      009F0A D5 FF            [ 2]  674 	ldw (2,x),y  ; ( 0 1 -- ) 
      009F0C CD 8C B6         [ 4]  675 	call DDUP    ; ( 0 1 0 1 -- )  
      009F0F 81 9E 4B         [ 4]  676 	call set_option
      009F12 06 57            [ 1]  677 	ldw y,x 
      009F14 52 2D            [ 2]  678 	ldw y,(y)
      009F16 52 4F            [ 1]  679 	incw y  ; next OPTION 
      009F18 57 A3 00 08      [ 2]  680 	cpw y,#8 
      009F19 25 E9            [ 1]  681 	jrult 2$
                                    682 ;;; erase first row of app_space 	
      009F19 CD 84 E1 CD      [ 2]  683 	ldw y,#app_space
      009F1D 9B A1            [ 2]  684 	ldw (2,x),y  
      009F1F A6 80            [ 1]  685 	clrw y 
      009F21 B4               [ 2]  686 	ldw (x),y ; ( app_space 0 -- )
      009F22 34 B7 34         [ 4]  687 	call row_erase 
                                    688 ; reset interrupt vectors 
      009F25 CD 9E F4         [ 2]  689 	subw x,#CELLL 
      009F28 CD 9C            [ 1]  690 	clrw y  
      009F2A DF               [ 2]  691 4$:	ldw (x),y  ; ( n -- ) int# 
      009F2B 90 93 90         [ 4]  692 	call DUPP  
      009F2E FE 1C 00         [ 4]  693 	call reset_vector
      009F31 02 89            [ 1]  694 	ldw y,x 
      009F33 93 CD            [ 2]  695 	ldw y,(y)
      009F35 17 00            [ 1]  696 	incw y   ; next vector 
      009F37 CD 9D 07 85      [ 2]  697 	cpw y,#25 
      009F3B CD 84            [ 1]  698 	jrult 4$
      009F3D CB 81 9F         [ 2]  699 	jp NonHandledInterrupt ; reset MCU
                                    700 
                                    701 ;------------------------------
                                    702 ; reset an interrupt vector 
                                    703 ; to its initial value 
                                    704 ; i.e. NonHandledInterrupt
                                    705 ; RST-IVEC ( n -- )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



                                    706 ;-----------------------------
      009F40 12 07                  707 	.word LINK 
                           001F53   708 	LINK=. 
      009F42 53                     709 	.byte 8 
      009F43 45 54 2D 4F 50 54 45   710 	.ascii "RST-IVEC"
             43
      009F49                        711 reset_vector:
      009F49 90 93            [ 1]  712 	ldw y,x
      009F4B 90 FE 27         [ 2]  713 	addw x,#CELLL 
      009F4E 06 90            [ 2]  714 	ldw y,(y)
      009F50 A3 00 07 23      [ 2]  715 	cpw y,#23 
      009F54 04 1C            [ 1]  716 	jreq 9$
      009F56 00 04 81 90      [ 2]  717 	cpw y,#29 ; last vector
      009F5A 58 72            [ 1]  718 	jrugt 9$  
      009F5C A9 47            [ 2]  719 	sllw y 
      009F5E FF FF            [ 2]  720 	sllw y 
      009F60 1D 00 02 90      [ 2]  721 	addw y,#0x8008 ; irq0 address 
      009F64 5F FF CD         [ 2]  722 	ldw YTEMP,y
      009F67 9D DF 81         [ 2]  723 	subw x,#3*CELLL 
      009F6A 9F 41            [ 2]  724 	ldw (2,x),y 
      009F6C 08 50            [ 1]  725 	clrw y
      009F6E 52               [ 2]  726 	ldw (x),y 
      009F6F 49 53            [ 1]  727 	ld a,#0x82 
      009F71 54 49            [ 1]  728 	ld yh,a
      009F73 4E 45            [ 2]  729 	ldw (4,x),y
      009F75 CD 1D AB         [ 4]  730 	call EESTORE
      009F75 CD 9B C0         [ 2]  731 	subw x,#3*CELLL
      009F78 CD 88            [ 1]  732 	clrw y 
      009F7A 00               [ 2]  733 	ldw (x),y 
      009F7B CD 9E 55 90      [ 2]  734 	ldw y,#NonHandledInterrupt
      009F7F 93 90            [ 2]  735 	ldw (4,x),y 
      009F81 EE 02 72         [ 2]  736 	ldw y,YTEMP  
      009F84 A9 00 80 EF      [ 2]  737 	addw y,#2
      009F88 02 90            [ 2]  738 	ldw (2,x),y 
      009F8A A3 48 00         [ 4]  739 	call EESTORE
      009F8D 25               [ 4]  740 9$:	ret 
                                    741 
                                    742 
                                    743 ;------------------------------
                                    744 ; all interrupt vector with 
                                    745 ; an address >= a are resetted 
                                    746 ; to default
                                    747 ; CHKIVEC ( a -- )
                                    748 ;------------------------------
      009F8E E9 90                  749 	.word LINK 
                           001FA6   750 	LINK=.
      009F90 AE                     751 	.byte 7
      009F91 00 01 FF 90 5F EF 02   752 	.ascii "CHKIVEC"
                                    753 ;local variables 
                           000001   754 	SSP=1
                           000003   755 	CADR=3
                           000005   756 	OFS=5
                           000006   757 	VSIZE=6  
      001FAE                        758 CHKIVEC:
      009F98 CD 88            [ 2]  759 	sub sp,#VSIZE ;alloc local variables 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



      009F9A 00 CD            [ 1]  760 	ldw y,x 
      009F9C 9F 49            [ 2]  761 	ldw y,(y)
      009F9E 90 93            [ 2]  762 	ldw (CADR,sp),y ; ca 
      009FA0 90 FE            [ 2]  763 	ldw (SSP,sp),x 
      009FA2 90 5C 90         [ 2]  764 	ldw x,#0x800a ; irq0 address 
      009FA5 A3 00            [ 2]  765 	ldw PTR16,X
      009FA7 08 25 E9         [ 2]  766 	ldw x,#-4 
      009FAA 90 AE A4         [ 2]  767 1$:	addw x,#4
      009FAD 80 EF 02         [ 2]  768 	cpw x,#30*4 ; irq0-29 
      009FB0 90 5F            [ 1]  769 	jreq 9$
      009FB2 FF CD            [ 1]  770 	ldw y,x  
      009FB4 9E 55 1D         [ 4]  771 	ld a,([PTR16],y)
      009FB7 00 02            [ 1]  772 	cp a,(CADR,sp)
      009FB9 90 5F            [ 1]  773 	jrult 1$
      009FBB FF CD            [ 1]  774 	incw y 
      009FBD 86 1A CD         [ 4]  775 	ld a,([PTR16],y)
      009FC0 9F DC            [ 1]  776 	cp a,(CADR+1,sp) 
      009FC2 90 93            [ 1]  777 	jrult 1$ 
      009FC4 90 FE            [ 2]  778 	ldw (OFS,sp),x 
      009FC6 90               [ 2]  779 	srlw x
      009FC7 5C               [ 2]  780 	srlw x 
      009FC8 90 A3            [ 1]  781 	ldw y,x 
      009FCA 00 19            [ 2]  782 	ldw x,(SSP,sp)
      009FCC 25               [ 2]  783 	ldw (x),y
      009FCD ED CC 80         [ 4]  784 	call reset_vector
      009FD0 80 9F            [ 2]  785 	ldw x,(OFS,sp) 
      009FD2 6C 08            [ 2]  786 	jra 1$
      009FD4 52 53            [ 2]  787 9$:	ldw x,(SSP,sp) 
      009FD6 54 2D 49         [ 2]  788 	addw x,#CELLL 
      009FD9 56 45            [ 2]  789 	addw sp,#VSIZE ; drop local variables  
      009FDB 43               [ 4]  790 	ret 
                                    791 
                                    792 ;------------------------------
                                    793 ; set interrupt vector 
                                    794 ; SET-IVEC ( ud n -- )
                                    795 ;  ud Handler address
                                    796 ;  n  vector # 0 .. 29 
                                    797 ;-----------------------------
      009FDC 1F A6                  798 	.word LINK
                           001FF4   799 	LINK=.
      009FDC 90                     800 	.byte 8 
      009FDD 93 1C 00 02 90 FE 90   801 	.ascii "SET-IVEC" 
             A3
      001FFD                        802 set_vector:
      009FE5 00 17            [ 1]  803     ldw y,x 
      009FE7 27 3A 90         [ 2]  804 	addw x,#CELLL 
      009FEA A3 00            [ 2]  805 	ldw y,(y) ; vector #
      009FEC 1D 22 34 90      [ 2]  806 	cpw y,#29 ; last vector
      009FF0 58 90            [ 2]  807 	jrule 2$
      009FF2 58 72 A9         [ 2]  808 	addw x,#2*CELLL 
      009FF5 80               [ 4]  809 	ret
      009FF6 08 90            [ 2]  810 2$:	sllw y 
      009FF8 BF 24            [ 2]  811 	sllw y 
      009FFA 1D 00 06 EF      [ 2]  812 	addw y,#0X8008 ; IRQ0 vector address 
      009FFE 02 90 5F         [ 2]  813 	ldw YTEMP,y ; vector address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



      00A001 FF A6            [ 1]  814 	ld a,#0x82 
      00A003 82 90            [ 1]  815 	ld yh,a 
      00A005 95 EF            [ 1]  816 	ld a,(1,x) ; isr address bits 23..16 
      00A007 04 CD            [ 1]  817 	ld yl,a 
                                    818 ;  write 0x82 + most significant byte of int address	
      00A009 9E 2B 1D         [ 2]  819 	subw x,#3*CELLL 
      00A00C 00 06            [ 2]  820 	ldw (4,x),y 
      00A00E 90 5F FF         [ 2]  821 	ldw y,YTEMP
      00A011 90 AE            [ 2]  822 	ldw (2,x),y ; vector address 
      00A013 80 80            [ 1]  823 	clrw y 
      00A015 EF               [ 2]  824 	ldw (x),y   ; as a double 
      00A016 04 90 BE         [ 4]  825 	call EESTORE 
      00A019 24 72            [ 1]  826 	ldw y,x 
      00A01B A9 00 02         [ 2]  827 	ldw y,(2,y) ; bits 15..0 int vector 
      00A01E EF 02 CD         [ 2]  828 	subw x,#3*CELLL 
      00A021 9E 2B            [ 2]  829 	ldw (4,x),y 
      00A023 81 9F D3         [ 2]  830 	ldw y,YTEMP 
      00A026 07 43 48 4B      [ 2]  831 	addw y,#2 
      00A02A 49 56            [ 2]  832 	ldw (2,x),y 
      00A02C 45 43            [ 1]  833 	clrw y 
      00A02E FF               [ 2]  834 	ldw (x),y 
      00A02E 52 06 90         [ 4]  835 	call EESTORE
      00A031 93 90 FE         [ 2]  836 	addw x,#2*CELLL  
      00A034 17               [ 4]  837 9$: ret 
                                    838 
                                    839 
                                    840 ;------------------------
                                    841 ; Compile word to flash
                                    842 ; EE, (w -- )
                                    843 ;-----------------------
      00A035 03 1F                  844 	.word LINK
                           002050   845 	LINK=.
      00A037 01                     846 	.byte 3
      00A038 AE 80 0A               847 	.ascii "EE,"
      002054                        848 EE_COMMA:
      00A03B BF 33 AE         [ 2]  849 	subw x,#2*CELLL 
      00A03E FF FC 1C         [ 2]  850 	ldw y,UCP
      00A041 00 04            [ 2]  851 	pushw y 
      00A043 A3 00            [ 2]  852 	ldw (2,x),y 
      00A045 78 27            [ 1]  853 	clrw y 
      00A047 22               [ 2]  854 	ldw (x),y
      00A048 90 93 91         [ 4]  855 	call EESTORE
      00A04B D6 33            [ 2]  856 	popw y 
      00A04D 11 03 25 EF      [ 2]  857 	addw y,#2
      00A051 90 5C 91         [ 2]  858 	ldw UCP,y
      00A054 D6               [ 4]  859 	ret 
                                    860 
                                    861 
                                    862 ;-------------------------
                                    863 ; Compile byte to flash 
                                    864 ; EEC, ( c -- )	
                                    865 ;-------------------------
      00A055 33 11                  866 	.word LINK 
                           002070   867 	LINK=.
      00A057 04                     868 	.byte 4 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



      00A058 25 E6 1F 05            869 	.ascii "EEC,"
      002075                        870 EE_CCOMMA:
      00A05C 54 54 90         [ 2]  871 	subw x,#2*CELLL 
      00A05F 93 1E 01         [ 2]  872 	ldw y,UCP
      00A062 FF CD            [ 2]  873 	pushw y 
      00A064 9F DC            [ 2]  874 	ldw (2,x),y 
      00A066 1E 05            [ 1]  875 	clrw y 
      00A068 20               [ 2]  876 	ldw (x),y
      00A069 D6 1E 01         [ 4]  877 	call EECSTORE
      00A06C 1C 00            [ 2]  878 	popw y 
      00A06E 02 5B            [ 1]  879 	incw y 
      00A070 06 81 A0         [ 2]  880 	ldw UCP,y
      00A073 26               [ 4]  881 	ret 
                                    882 
                                    883 
                                    884 ;--------------------------
                                    885 ; copy FLASH block to ROWBUF
                                    886 ; ROW>BUF ( ud -- )
                                    887 ;--------------------------
      00A074 08 53                  888 	.word LINK 
                           00208F   889 	LINK=.
      00A076 45                     890 	.byte 7 
      00A077 54 2D 49 56 45 43 46   891 	.ascii "ROW>BUF"
      00A07D                        892 ROW2BUF: 
      00A07D 90 93 1C         [ 4]  893 	call FPSTOR 
      00A080 00 02            [ 1]  894 	ld a,#BLOCK_SIZE
      00A082 90               [ 1]  895 	push a 
      00A083 FE 90            [ 1]  896 	and a,PTR8 ; block align 
      00A085 A3 00            [ 1]  897 	ld PTR8,a
      00A087 1D 23 04 1C      [ 2]  898 	ldw y,#ROWBUFF 
      00A08B 00 04 81 90      [ 5]  899 1$: ldf a,[FPTR]
      00A08F 58 90            [ 1]  900 	ld (y),a
      00A091 58 72 A9         [ 4]  901 	call INC_FPTR
      00A094 80 08            [ 1]  902 	incw y 
      00A096 90 BF            [ 1]  903 	dec (1,sp)
      00A098 24 A6            [ 1]  904 	jrne 1$ 
      00A09A 82               [ 1]  905 	pop a 
      00A09B 90               [ 4]  906 	ret 
                                    907 
                                    908 
                                    909 ;---------------------------
                                    910 ; copy ROWBUFF to flash 
                                    911 ; BUF>ROW ( ud -- )
                                    912 ; ud is row address as double 
                                    913 ;---------------------------
      00A09C 95 E6                  914 	.word LINK 
                           0020B8   915 	LINK=.
      00A09E 01                     916 	.byte 7 
      00A09F 90 97 1D 00 06 EF 04   917 	.ascii "BUF>ROW" 
      0020C0                        918 BUF2ROW:
      00A0A6 90 BE 24         [ 4]  919 	call TBUF ; ( ud rb -- )
      00A0A9 EF 02 90         [ 4]  920 	call ROT 
      00A0AC 5F FF CD         [ 4]  921 	call ROT  ; ( rb ud -- )
      00A0AF 9E 2B 90         [ 4]  922 	call write_row 
      00A0B2 93               [ 4]  923 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



                                    924 
                                    925 ;---------------------------------
                                    926 ; how many byte free in that row 
                                    927 ; RFREE ( a -- n )
                                    928 ; a is least byte of target address
                                    929 ;----------------------------------
      00A0B3 90 EE                  930 	.word LINK 
                           0020CF   931 	LINK=.
      00A0B5 02                     932 	.byte 5 
      00A0B6 1D 00 06 EF 04         933 	.ascii "RFREE"
      0020D5                        934 RFREE:
      00A0BB 90 BE            [ 1]  935 	ld a,(1,x)
      00A0BD 24 72            [ 1]  936 	and a,#BLOCK_SIZE-1 
      00A0BF A9 00            [ 1]  937 	ld YTEMP,a 
      00A0C1 02 EF            [ 1]  938 	ld a,#BLOCK_SIZE 
      00A0C3 02 90            [ 1]  939 	sub a,YTEMP 
      00A0C5 5F FF            [ 1]  940 	clrw y 
      00A0C7 CD 9E            [ 1]  941 	ld yl,a
      00A0C9 2B               [ 2]  942 	ldw (x),y 
      00A0CA 1C               [ 4]  943 	ret 
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
      00A0CB 00 04                  954 	.word LINK 
                           0020E7   955 	LINK=. 
      00A0CD 81                     956 	.byte 6
      00A0CE A0 74 03 45 45 2C      957 	.ascii "RAM>EE"
                                    958 	
      00A0D4                        959 RAM2EE:
                                    960 ; copy ud on top 
      00A0D4 1D 00            [ 1]  961 	ldw y,x 
      00A0D6 04 90 BE         [ 2]  962 	ldw y,(6,y) ; LSW of ud  
      00A0D9 18 90 89         [ 2]  963 	ldw YTEMP,y 
      00A0DC EF 02            [ 1]  964 	ldw y,x 
      00A0DE 90 5F FF         [ 2]  965 	ldw y,(4,y)  ; MSW of ud 
      00A0E1 CD 9E 2B         [ 2]  966 	subw x,#2*CELLL 
      00A0E4 90               [ 2]  967 	ldw (x),y 
      00A0E5 85 72 A9         [ 2]  968 	ldw y,YTEMP 
      00A0E8 00 02            [ 2]  969 	ldw (2,x),y 
      00A0EA 90 BF 18         [ 4]  970 	call ROW2BUF 
      00A0ED 81 A0            [ 1]  971 	ldw y,x 
      00A0EF D0 04 45         [ 2]  972 	ldw y,(6,y)
      00A0F2 45 43            [ 2]  973 	pushw y ; udl 
      00A0F4 2C 9F            [ 1]  974 	ld a,yl
      00A0F5 A4 7F            [ 1]  975 	and a,#BLOCK_SIZE-1 
      00A0F5 1D 00            [ 1]  976 	clrw y 
      00A0F7 04 90            [ 1]  977 	ld yl,a 
      00A0F9 BE 18 90 89      [ 2]  978 	addw y,#ROWBUFF 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      00A0FD EF 02 90         [ 2]  979 	subw x,#CELLL 
      00A100 5F               [ 2]  980 	ldw (x),y  
      00A101 FF CD 9D         [ 4]  981 	call SWAPP ;  ( ud a ra u -- )
      00A104 DF 90 85         [ 4]  982 	call RFROM  
      00A107 90 5C 90         [ 4]  983 	call RFREE 
      00A10A BF 18 81         [ 4]  984 	call MIN
      00A10D A0 F0 07         [ 4]  985 	call DUPP 
      00A110 52 4F 57         [ 4]  986 	call TOR  
      00A113 3E 42 55         [ 4]  987 	call CMOVE
      00A116 46 20 C0         [ 4]  988 	call BUF2ROW 
      00A117 CD 05 44         [ 4]  989 	call RFROM 
      00A117 CD               [ 4]  990 	ret 
                                    991 
                                    992 
                                    993 ;--------------------------
                                    994 ; expand 16 bit address 
                                    995 ; to 32 bit address 
                                    996 ; FADDR ( a -- ud )
                                    997 ;--------------------------
      00A118 9B A1                  998 	.word LINK 
                           00213C   999 	LINK=. 
      00A11A A6                    1000 	.byte 5 
      00A11B 80 88 B4 34 B7        1001 	.ascii "FADDR"
      002142                       1002 FADDR:
      00A120 34 90 AE         [ 2] 1003 	jp ZERO 
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
      00A123 16 80                 1019 	.word LINK 
                           002147  1020 	LINK=.
      00A125 92                    1021 	.byte 5 
      00A126 BC 00 32 90 F7        1022 	.ascii "FMOVE" 
      00214D                       1023 FMOVE:
      00A12B CD 9D 1B         [ 4] 1024 	call TFLASH 
      00A12E 90 5C 0A         [ 4] 1025 	CALL AT 
      00A131 01 26 F1         [ 4] 1026 	CALL QBRAN 
      00A134 84 81                 1027 	.word no_move  
      00A136 A1 0F 07         [ 4] 1028 	call CPP
      00A139 42 55 46         [ 4] 1029 	call AT  
      00A13C 3E 52 4F         [ 4] 1030 	call DUPP ; ( udl udl -- )
      00A13F 57 06 DA         [ 4] 1031 	call CNTXT 
      00A140 CD 04 F3         [ 4] 1032 	call AT 
      00A140 CD 87 15         [ 4] 1033 	call DOLIT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



      00A143 CD 87                 1034 	.word 2 
      00A145 D5 CD 87         [ 4] 1035 	call SUBB ; ( udl udl a -- )
      00A148 D5 CD 9F         [ 4] 1036 	call SWAPP 
      00A14B 19 81 A1         [ 4] 1037 	call FADDR 
      00A14E 38 05 52         [ 4] 1038 	call ROT  ; ( udl ud a -- )
      00A151 46 52 45         [ 4] 1039 	call DUPP 
      00A154 45 05 63         [ 4] 1040 	call TOR    ; R: a 
      00A155                       1041 FMOVE2: 
      00A155 E6 01 A4         [ 4] 1042 	call HERE 
      00A158 7F B7 24         [ 4] 1043 	call RAT 
      00A15B A6 80 B0         [ 4] 1044 	call SUBB ; (udl ud a wl -- )
      002187                       1045 next_row:
      00A15E 24 90 5F         [ 4] 1046 	call DUPP 
      00A161 90 97 FF         [ 4] 1047 	call TOR  ; ( udl ud a wl -- ) R: a wl
      00A164 81 A1 4F         [ 4] 1048 	call RAM2EE ; ( udl a u -- udl u2 ) u2 is byte written to FLASH 
      00A167 06 52 41         [ 4] 1049 	call DUPP 
      00A16A 4D 3E 45         [ 4] 1050 	call TOR
      00A16D 45 07 95         [ 4] 1051 	call PLUS  ; ( udl+ ) 
      00A16E CD 05 9A         [ 4] 1052 	call DUPP 
      00A16E 90 93 90         [ 4] 1053 	call ZERO   ; ( udl+ ud -- )
      00A171 EE 06 90         [ 4] 1054 	call RFROM  ; ( udl+ ud u2  R: a wl ) 
      00A174 BF 24 90         [ 4] 1055 	call RFROM  ; ( udl+ ud u2 wl R: a ) 
      00A177 93 90 EE         [ 4] 1056 	call OVER   ; ( udl+ ud u2 wl u2 -- )
      00A17A 04 1D 00         [ 4] 1057 	call SUBB  ; ( udl+ ud u2 wl- R: a )
      00A17D 04 FF 90         [ 4] 1058 	call DUPP 
      00A180 BE 24 EF         [ 4] 1059 	call QBRAN
      00A183 02 CD                 1060 	.word fmove_done 
      00A185 A1 17 90         [ 4] 1061 	call SWAPP  ; ( udl+ ud wl- u2 R: a )
      00A188 93 90 EE         [ 4] 1062 	call RFROM ; ( udl+ ud wl- u2 a -- ) 
      00A18B 06 90 89         [ 4] 1063 	call PLUS  ; ( udl+2 ud wl- a+ )
      00A18E 90 9F A4         [ 4] 1064 	call DUPP 
      00A191 7F 90 5F         [ 4] 1065 	call TOR   ; ( udl+2 ud wl- a+ ) R: a+
      00A194 90 97 72         [ 4] 1066 	call SWAPP 
      00A197 A9 16 80         [ 4] 1067 	call BRAN
      00A19A 1D 00                 1068 	.word next_row  
      0021CA                       1069 fmove_done:	
      00A19C 02 FF CD         [ 4] 1070 	call RFROM  ; ( -- udl+ ud u2 wl- a  )
      00A19F 86 2A CD         [ 2] 1071 	addw x,#5*CELLL ; (  -- cp+ ) new CP 
      00A1A2 85               [ 4] 1072  	ret  
      0021D1                       1073 no_move:
      00A1A3 C4 CD A1         [ 4] 1074 	call ZERO
      00A1A6 55               [ 4] 1075 	ret 
                                   1076 
                                   1077 ;------------------------------------------
                                   1078 ; adjust pointers after **FMOVE** operetion.
                                   1079 ; UPDAT-PTR ( cp+ -- )
                                   1080 ; cp+ is new CP position after FMOVE 
                                   1081 ;-------------------------------------------
      00A1A7 CD 89                 1082 	.word LINK 
                           0021D7  1083 	LINK=.
      00A1A9 30                    1084 	.byte 9
      00A1AA CD 86 1A CD 85 E3 CD  1085 	.ascii "UPDAT-PTR" 
             8C B6
      0021E1                       1086 UPDATPTR:
                                   1087 ;reset VP to previous position  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



      00A1B3 CD A1 40         [ 4] 1088 	call EEPVP 
      00A1B6 CD 85 C4         [ 4] 1089 	call DROP 
      00A1B9 81 A1 67         [ 4] 1090 	call AT
      00A1BC 05 46 41         [ 4] 1091 	call VPP 
      00A1BF 44 44 52         [ 4] 1092 	call STORE
                                   1093 ;update CONTEXT and LAST 
      00A1C2 CD 1B 85         [ 4] 1094 	call EEPCP 
      00A1C2 CC 8B 7B         [ 4] 1095 	call DROP
      00A1C5 A1 BC 05         [ 4] 1096 	call AT
      00A1C8 46 4D 4F         [ 4] 1097 	call DOLIT 
      00A1CB 56 45                 1098 	.word 2 
      00A1CD CD 07 95         [ 4] 1099 	call PLUS 
      00A1CD CD 87 27         [ 4] 1100 	call DUPP 
      00A1D0 CD 85 73         [ 4] 1101 	call CNTXT 
      00A1D3 CD 85 28         [ 4] 1102 	call STORE
      00A1D6 A2 51 CD         [ 4] 1103 	call LAST
      00A1D9 87 76 CD         [ 4] 1104 	call STORE 
      00A1DC 85 73 CD         [ 4] 1105 	call UPDATLAST 
                                   1106 ;update CP 
      00A1DF 86 1A CD         [ 4] 1107 	call CPP 
      00A1E2 87 5A CD         [ 4] 1108 	call STORE
      00A1E5 85 73 CD         [ 4] 1109 	call UPDATCP 
      00A1E8 84               [ 4] 1110 	ret 
                                   1111 
                                   1112 ;-----------------------------
                                   1113 ; move interrupt sub-routine
                                   1114 ; in flash memory
                                   1115 ;----------------------------- 
      00A1E9 F5 00                 1116 	.word LINK 
                           00221F  1117 	LINK=. 
      00A1EB 02                    1118 	.byte 6
      00A1EC CD 88 8E CD 86 2A     1119 	.ascii "IFMOVE" 
      002226                       1120 IFMOVE:
      00A1F2 CD A1 C2         [ 4] 1121 	call TFLASH 
      00A1F5 CD 87 D5         [ 4] 1122 	CALL AT 
      00A1F8 CD 86 1A         [ 4] 1123 	CALL QBRAN 
      00A1FB CD 85                 1124 	.word no_move 
      00A1FD E3 06 F6         [ 4] 1125 	call CPP 
      00A1FE CD 04 F3         [ 4] 1126 	call AT 
      00A1FE CD 8C 69         [ 4] 1127 	call DUPP ; ( udl udl -- )
      00A201 CD 85 D7         [ 4] 1128 	call EEPVP 
      00A204 CD 88 8E         [ 4] 1129 	call DROP
      00A207 CD 04 F3         [ 4] 1130 	call AT  ; ( udl udl a )
      00A207 CD 86 1A         [ 4] 1131 	call TOR 
      00A20A CD 85 E3         [ 4] 1132 	call FADDR
      00A20D CD A1 6E         [ 4] 1133 	call RAT ; ( udl ud a -- ) R: a 
      00A210 CD 86 1A         [ 2] 1134 	jp FMOVE2 
                                   1135 
                                   1136 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



                           000001  4657 .if WANT_SCALING_CONST 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



                                   4658         .include "const_ratio.asm"
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
      00A213 CD 85                   31         .word LINK 
                           002251    32         LINK=.
      00A215 E3                      33         .byte 2
      00A216 CD 88                   34         .ascii "PI" 
      002254                         35 PII:
      00A218 15 CD 86         [ 2]   36         subw x,#2*CELLL 
      00A21B 1A CD 8B 7B      [ 2]   37         ldw y,#355 
      00A21F CD 85            [ 2]   38         ldw (2,x),y 
      00A221 C4 CD 85 C4      [ 2]   39         ldw y,#113 
      00A225 CD               [ 2]   40         ldw (x),y 
      00A226 86               [ 4]   41         ret 
                                     42 
                                     43 ;      SQRT2 ( -- 19601  13860 )
                                     44 ; precision: 1.5e-9 
                                     45 ; usage example to compute Voltage peek to peek from Vrms 
                                     46 ; : VPP SQRT2 */ 2 * ;
                                     47 ;
      00A227 44 CD                   48         .word LINK 
                           002265    49         LINK=.
      00A229 88                      50         .byte 5 
      00A22A 8E CD 86 1A CD          51         .ascii "SQRT2" 
      00226B                         52 SQRT2:
      00A22F 85 28 A2         [ 2]   53         subw x,#2*CELLL 
      00A232 4A CD 86 2A      [ 2]   54         ldw y,#19601 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



      00A236 CD 85            [ 2]   55         ldw (2,x),y 
      00A238 C4 CD 88 15      [ 2]   56         ldw y,#13860 
      00A23C CD               [ 2]   57         ldw (x),y 
      00A23D 86               [ 4]   58         ret 
                                     59 
                                     60 ;   SQRT3 ( -- 18817 10864 )
                                     61 ; precision: 1.1e-9
                                     62 ;
      00A23E 1A CD                   63         .word LINK 
                           00227C    64         LINK=.
      00A240 85                      65         .byte 5
      00A241 E3 CD 86 2A CD          66         .ascii "SQRT3" 
      002282                         67 SQRT3: 
      00A246 85 3F A2         [ 2]   68     subw x,#2*CELLL 
      00A249 07 AE 49 81      [ 2]   69     ldw y,#18817 
      00A24A EF 02            [ 2]   70     ldw (2,x),y 
      00A24A CD 85 C4 1C      [ 2]   71     ldw y,#10864 
      00A24E 00               [ 2]   72     ldw (x),y 
      00A24F 0A               [ 4]   73     ret 
                                     74 
                                     75 ;   E ( -- 28667 10546 )
                                     76 ; precision: 5.5e-9 
                                     77 ; natural log base 
      00A250 81 7C                   78         .word LINK 
                           002293    79         LINK=.
      00A251 01                      80         .byte 1
      00A251 CD                      81         .ascii "E" 
      002295                         82 ENEPER:
      00A252 8B 7B 81         [ 2]   83     subw x,#2*CELLL 
      00A255 A1 C7 09 55      [ 2]   84     ldw y,#28667 
      00A259 50 44            [ 2]   85     ldw (2,x),y 
      00A25B 41 54 2D 50      [ 2]   86     ldw y,#10546 
      00A25F 54               [ 2]   87     ldw (x),y 
      00A260 52               [ 4]   88     ret 
                                     89 
                                     90 ;   SQRT10 ( -- 22936 7253 )
                                     91 ; precision: 5.7e-9 
      00A261 22 93                   92         .word LINK 
                           0022A6    93         LINK=.
      00A261 CD                      94         .byte 6 
      00A262 9C 1B CD 86 10 CD       95         .ascii "SQRT10" 
      0022AD                         96 SQRT10:
      00A268 85 73 CD         [ 2]   97     subw x,#2*CELLL
      00A26B 87 68 CD 85      [ 2]   98     ldw y,#22936 
      00A26F 5C CD            [ 2]   99     ldw (2,x),y 
      00A271 9C 05 CD 86      [ 2]  100     ldw y,#7253
      00A275 10               [ 2]  101     ldw (x),y 
      00A276 CD               [ 4]  102     ret 
                                    103 
                                    104 ;   12RT2 ( -- 26797 25293 )
                                    105 ; precision: 1.0e-9 
                                    106 ; used in music to compute well tempered scale
      00A277 85 73                  107         .word LINK 
                           0022BE   108         LINK=. 
      00A279 CD                     109         .byte 5 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



      00A27A 84 F5 00 02 CD         110         .ascii "12RT2"
      0022C4                        111 RT12_2:
      00A27F 88 15 CD         [ 2]  112     subw x,#2*CELLL 
      00A282 86 1A CD 87      [ 2]  113     ldw y,#26797
      00A286 5A CD            [ 2]  114     ldw (2,x),y 
      00A288 85 5C CD 87      [ 2]  115     ldw y,#25293
      00A28C 86               [ 2]  116     ldw (x),y 
      00A28D CD               [ 4]  117     ret 
                                    118 
                                    119 ;   LOG2s ( -- 2040 11103 )
                                    120 ; log(2)/1.6384
                                    121 ; precision: 1.1e-8
      00A28E 85 5C                  122         .word LINK 
                           0022D5   123         LINK=.
      00A290 CD                     124         .byte 5 
      00A291 9C 35 CD 87 76         125         .ascii "LOG2S" 
      0022DB                        126 LOG2S:
      00A296 CD 85 5C         [ 2]  127     subw x,#2*CELLL
      00A299 CD 9C 5E 81      [ 2]  128     ldw y,#2040 
      00A29D A2 57            [ 2]  129     ldw (2,x),y 
      00A29F 06 49 46 4D      [ 2]  130     ldw y,#11103 
      00A2A3 4F               [ 2]  131     ldw (x),y 
      00A2A4 56               [ 4]  132     ret 
                                    133 
                                    134 ;   LN2 ( -- 485 11464 )
                                    135 ; ln(2)/16.384 
                                    136 ; precision: 1.0e-7 
      00A2A5 45 D5                  137         .word LINK 
                           0022EC   138         LINK=.
      00A2A6 04                     139         .byte 4 
      00A2A6 CD 87 27 CD            140         .ascii "LN2S" 
      0022F1                        141 LN2S: 
      00A2AA 85 73 CD         [ 2]  142     subw x,#2*CELLL
      00A2AD 85 28 A2 51      [ 2]  143     ldw y,#485
      00A2B1 CD 87            [ 2]  144     ldw (2,x),y 
      00A2B3 76 CD 85 73      [ 2]  145     ldw y,#11464 
      00A2B7 CD               [ 2]  146     ldw (x),y 
      00A2B8 86               [ 4]  147     ret 
                                    148 
                                    149 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



                                   4659 .endif
                           000001  4660 .if WANT_CONST_TABLE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]



                                   4661         .include "ctable.asm"
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
      00A2B9 1A CD                   32     .word LINK 
                           002302    33     LINK=.
      00A2BB 9C                      34     .byte 6
      00A2BC 1B CD 86 10 CD 85       35     .ascii "CALLOT"
      002309                         36 CALLOT:
      00A2C2 73 CD 85         [ 4]   37     CALL CPP
      00A2C5 E3 CD A1         [ 4]   38     CALL DUPP 
      00A2C8 C2 CD 85         [ 4]   39     CALL AT 
      00A2CB D7 CC A1         [ 4]   40     CALL TOR 
      00A2CE FE A2 9F         [ 4]   41     CALL PSTOR 
      00A2D1 02 50 49         [ 4]   42     CALL UPDATCP 
      00A2D4 CD 05 44         [ 4]   43     CALL RFROM
      00A2D4 1D 00 04         [ 2]   44     JP ZERO 
                                     45 
                                     46 ;------------------------------
                                     47 ; create constants bytes table 
                                     48 ; in persistant memory
                                     49 ;  CTABLE ( n+ -- ad ; <string> )
                                     50 ; n+ bytes reserved 
                                     51 ;-----------------------------
      00A2D7 90 AE                   52     .word LINK 
                           002323    53     LINK=.
      00A2D9 01                      54     .byte 6
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]



      00A2DA 63 EF 02 90 AE 00       55     .ascii "CTABLE"
      00232A                         56 CTABLE:
      00A2E0 71 FF 81         [ 4]   57     CALL CALLOT     
      00A2E3 A2 D1 05         [ 2]   58     JP DCONST 
                                     59      
                                     60 
                                     61 ;--------------------------------
                                     62 ; create constants words table 
                                     63 ; in persistant memory 
                                     64 ; WTABLE ( n+ -- ad ; <string> )
                                     65 ; n+  words reserved  
                                     66 ;--------------------------------
      00A2E6 53 51                   67     .word LINK 
                           002332    68     LINK=.
      00A2E8 52                      69     .byte 6
      00A2E9 54 32 41 42 4C 45       70     .ascii "WTABLE"
      00A2EB                         71 WTABLE:
      00A2EB 1D 00 04         [ 4]   72     CALL CELLS  
      00A2EE 90 AE 4C         [ 4]   73     CALL CALLOT 
      00A2F1 91 EF 02         [ 2]   74     JP DCONST 
                                     75 
                                     76 ;---------------------------------
                                     77 ; stack an element of CTABLE 
                                     78 ; CTABL@ ( u ad -- c )
                                     79 ; u element order {0..size-1}
                                     80 ; a|ad table address 
                                     81 ;--------------------------------
      00A2F4 90 AE                   82     .word LINK 
                           002344    83     LINK=.
      00A2F6 36                      84     .byte 6
      00A2F7 24 FF 81 A2 E5 05       85     .ascii "CTABL@" 
      00234B                         86 CTAT:
      00A2FD 53 51 52         [ 4]   87     call FPSTOR 
      00A300 54 33 B3         [ 4]   88     call PTRPLUS 
      00A302 CC 1C F0         [ 2]   89     jp EE_CREAD 
                                     90 
                                     91 ;---------------------------------
                                     92 ; stack an element of WTABLE 
                                     93 ; WTABL@ ( u ud -- w )
                                     94 ; u is element order {0..size-1}
                                     95 ; a|ud table address 
                                     96 ;----------------------------------
      00A302 1D 00                   97     .word LINK 
                           002356    98     LINK=.
      00A304 04                      99     .byte 6
      00A305 90 AE 49 81 EF 02      100     .ascii "WTABL@" 
      00235D                        101 WTAT:
      00A30B 90 AE 2A         [ 4]  102     call FPSTOR 
      00A30E 70 FF 81         [ 4]  103     call CELLS 
      00A311 A2 FC 01         [ 4]  104     call PTRPLUS 
      00A314 45 1C CE         [ 4]  105     call EE_READ 
      00A315 81               [ 4]  106     ret 
                                    107 
                                    108 ;--------------------------
                                    109 ; tool to initialize character table 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



                                    110 ; CTINIT ( ad -- )
                                    111 ; ad is table address 
                                    112 ;--------------------------
      00A315 1D 00                  113     .word LINK 
                           00236C   114     LINK=.
      00A317 04                     115     .byte 6 
      00A318 90 AE 6F FB EF 02      116     .ascii "CTINIT"
      002373                        117 CTINIT:
      00A31E 90 AE 29         [ 4]  118     CALL FPSTOR
      00A321 32 FF 81         [ 4]  119     CALL UNLOCK
      00A324 A3 13 06         [ 4]  120     CALL ZERO 
      00A327 53 51 52         [ 4]  121 1$: CALL ONEP 
      00A32A 54 31 30         [ 4]  122     CALL DUPP 
      00A32D CD 23 CF         [ 4]  123     CALL INTQ 
      00A32D 1D 00 04         [ 4]  124     CALL QBRAN 
      00A330 90 AE                  125     .word 2$
      00A332 59 98 EF         [ 4]  126     call WR_BYTE 
      00A335 02 90 AE         [ 4]  127     CALL BRAN 
      00A338 1C 55                  128     .word 1$ 
      00A33A FF 81 A3         [ 4]  129 2$: CALL DDROP 
      00A33D 26 05 31         [ 4]  130     CALL LOCK 
      00A340 32               [ 4]  131     ret 
                                    132 
                                    133 ;--------------------------
                                    134 ; tool to initialize word table 
                                    135 ; WTINIT ( ad -- )
                                    136 ; ad is table address 
                                    137 ;--------------------------
      00A341 52 54                  138     .word LINK 
                           00239B   139     LINK=.
      00A343 32                     140     .byte 6 
      00A344 57 54 49 4E 49 54      141     .ascii "WTINIT"
      0023A2                        142 WTINIT:
      00A344 1D 00 04         [ 4]  143     CALL FPSTOR
      00A347 90 AE 68         [ 4]  144     CALL UNLOCK
      00A34A AD EF 02         [ 4]  145     CALL ZERO 
      00A34D 90 AE 62         [ 4]  146 1$: CALL ONEP 
      00A350 CD FF 81         [ 4]  147     CALL DUPP
      00A353 A3 3E 05         [ 4]  148     CALL INTQ
      00A356 4C 4F 47         [ 4]  149     CALL QBRAN 
      00A359 32 53                  150     .word 2$
      00A35B CD 1D 2F         [ 4]  151     call WR_WORD 
      00A35B 1D 00 04         [ 4]  152     CALL BRAN 
      00A35E 90 AE                  153     .word 1$ 
      00A360 07 F8 EF         [ 4]  154 2$: CALL DDROP 
      00A363 02 90 AE         [ 4]  155     CALL LOCK 
      00A366 2B               [ 4]  156     ret 
                                    157 
                                    158 ;------------------------
                                    159 ; Prompted input for integer 
                                    160 ; display n+ in bracket and
                                    161 ; '?' 
                                    162 ; [N]? ( n+ -- a )
                                    163 ;------------------------
      00A367 5F FF                  164     .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



                           0023CA   165     LINK=.
      00A369 81                     166     .byte 4
      00A36A A3 55 04 4C            167     .ascii "[N]?" 
      0023CF                        168 INTQ:
      00A36E 4E 32 53         [ 4]  169     CALL CR 
      00A371 CD 04 75         [ 4]  170     call DOLIT 
      00A371 1D 00                  171     .word '[
      00A373 04 90 AE         [ 4]  172     CALL EMIT 
      00A376 01 E5 EF         [ 4]  173     CALL DOT 
      00A379 02 90 AE         [ 4]  174     CALL  DOTQP
      00A37C 2C                     175     .byte 3
      00A37D C8 FF 81               176     .ascii "]? " 
      00A380 A3 6C 06         [ 4]  177     CALL QUERY 
      00A383 43 41 4C         [ 4]  178     call TOKEN 
      00A386 4C 4F 54         [ 2]  179     jp NUMBQ
                                    180 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



                                   4662 .endif
                                   4663 
                                   4664 ;===============================================================
                                   4665 
                           0023CA  4666 LASTN =	LINK   ;last name defined
                                   4667 
                                   4668 ; application code begin here
      00A389                       4669 	.bndry 128 ; align on flash block  
      002400                       4670 app_space: 
                                   4671 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   6 AB1        000831 R   |   6 ABOR1      001384 R
  6 ABOR2      00139B R   |   6 ABORQ      00137C R   |   6 ABORT      00136D R
  6 ABRTQ      001658 R   |   6 ABSS       000828 R   |   6 ACCEP      001303 R
  6 ACCP1      00130C R   |   6 ACCP2      001332 R   |   6 ACCP3      001335 R
  6 ACCP4      001337 R   |     ADC_CR1 =  005401     |     ADC_CR1_=  000000 
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
  6 AFT        001643 R   |   6 AGAIN      001599 R   |   6 AHEAD      0015F6 R
  6 ALLOT      0014AC R   |   6 ANDD       0005E6 R   |     APP_CP  =  004004 
    APP_LAST=  004000     |     APP_RUN =  004002     |     APP_VP  =  004006 
  6 AT         0004F3 R   |   6 ATEXE      000C1F R   |   6 AUTORUN    000127 R
    AWU_APR =  0050F1     |     AWU_CSR =  0050F0     |     AWU_TBR =  0050F2 
    B0_MASK =  000001     |     B115200 =  000006     |   6 B115K2     0003DE R
    B19200  =  000003     |   6 B19K2      0003BB R   |     B1_MASK =  000002 
    B230400 =  000007     |     B2400   =  000000     |   6 B2K4       00038C R
    B2_MASK =  000004     |     B38400  =  000004     |     B3_MASK =  000008 
    B460800 =  000008     |     B4800   =  000001     |   6 B4K8       00039A R
    B4_MASK =  000010     |     B57600  =  000005     |   6 B57K6      0003CC R
    B5_MASK =  000020     |     B6_MASK =  000040     |     B7_MASK =  000080 
    B921600 =  000009     |     B9600   =  000002     |   6 B9K6       0003AA R
  6 BACK1      0012AB R   |   6 BASE       000657 R   |     BASEE   =  00000A 
  6 BAUD       0003EE R   |     BCNT    =  000001     |   6 BCOMP      0014EE R
  6 BDIGS      000D06 R   |     BEEP_BIT=  000004     |     BEEP_CSR=  0050F3 
    BEEP_MAS=  000010     |     BEEP_POR=  00000F     |   6 BEGIN      00157B R
    BIT0    =  000000     |     BIT1    =  000001     |     BIT2    =  000002 
    BIT3    =  000003     |     BIT4    =  000004     |     BIT5    =  000005 
    BIT6    =  000006     |     BIT7    =  000007     |   6 BKSLA      001143 R
  6 BKSP       00127B R   |     BKSPP   =  000008     |   6 BLANK      000AEE R
    BLOCK_SI=  000080     |     BOOT_ROM=  006000     |     BOOT_ROM=  007FFF 
  6 BRAN       0004BF R   |     BTW     =  000001     |   6 BUF2ROW    0020C0 R
  6 BYE        0000B4 R   |     CADR    =  000003     |     CALLL   =  0000CD 
  6 CALLOT     002309 R   |     CAN_DGR =  005426     |     CAN_FPSR=  005427 
    CAN_IER =  005425     |     CAN_MCR =  005420     |     CAN_MSR =  005421 
    CAN_P0  =  005428     |     CAN_P1  =  005429     |     CAN_P2  =  00542A 
    CAN_P3  =  00542B     |     CAN_P4  =  00542C     |     CAN_P5  =  00542D 
    CAN_P6  =  00542E     |     CAN_P7  =  00542F     |     CAN_P8  =  005430 
    CAN_P9  =  005431     |     CAN_PA  =  005432     |     CAN_PB  =  005433 
    CAN_PC  =  005434     |     CAN_PD  =  005435     |     CAN_PE  =  005436 
    CAN_PF  =  005437     |     CAN_RFR =  005424     |     CAN_TPR =  005423 
    CAN_TSR =  005422     |     CARRY   =  000028     |   6 CAT        000511 R
  6 CCOMMA     0014D0 R   |     CC_C    =  000000     |     CC_H    =  000004 
    CC_I0   =  000003     |     CC_I1   =  000005     |     CC_N    =  000002 
    CC_V    =  000007     |     CC_Z    =  000001     |     CELLL   =  000002 
  6 CELLM      000A73 R   |   6 CELLP      000A64 R   |   6 CELLS      000A82 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]

Symbol Table

    CFG_GCR =  007F60     |     CFG_GCR_=  000001     |     CFG_GCR_=  000000 
  6 CHAR1      000F33 R   |   6 CHAR2      000F36 R   |   6 CHKIVEC    001FAE R
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
  6 CMOV1      000C3E R   |   6 CMOV2      000C56 R   |   6 CMOVE      000C36 R
    CNTDWN  =  000030     |   6 CNTXT      0006DA R   |   6 COLD       001AB2 R
  6 COLD1      001AB2 R   |   6 COLON      0017F1 R   |   6 COMMA      0014B9 R
  6 COMPI      0014FE R   |     COMPO   =  000040     |   6 CONSTANT   00189B R
  6 COUNT      000BD2 R   |   6 CPP        0006F6 R   |     CPU_A   =  007F00 
    CPU_CCR =  007F0A     |     CPU_PCE =  007F01     |     CPU_PCH =  007F02 
    CPU_PCL =  007F03     |     CPU_SPH =  007F08     |     CPU_SPL =  007F09 
    CPU_XH  =  007F04     |     CPU_XL  =  007F05     |     CPU_YH  =  007F06 
    CPU_YL  =  007F07     |   6 CR         000F61 R   |   6 CREAT      001837 R
    CRR     =  00000D     |   6 CSTOR      000500 R   |   6 CTABLE     00232A R
  6 CTAT       00234B R   |   6 CTINIT     002373 R   |   6 DAT        000BB2 R
    DATSTK  =  001680     |   6 DCONST     0018D7 R   |   6 DDROP      000775 R
  6 DDUP       000780 R   |     DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF 
  6 DECIM      000DB6 R   |   6 DEPTH      000B3D R   |     DEVID_BA=  0048CD 
    DEVID_EN=  0048D8     |     DEVID_LO=  0048D2     |     DEVID_LO=  0048D3 
    DEVID_LO=  0048D4     |     DEVID_LO=  0048D5     |     DEVID_LO=  0048D6 
    DEVID_LO=  0048D7     |     DEVID_LO=  0048D8     |     DEVID_WA=  0048D1 
    DEVID_XH=  0048CE     |     DEVID_XL=  0048CD     |     DEVID_YH=  0048D0 
    DEVID_YL=  0048CF     |   6 DGTQ1      000DFB R   |   6 DI         0000C2 R
  6 DIG        000D2F R   |   6 DIGIT      000CCA R   |   6 DIGS       000D40 R
  6 DIGS1      000D40 R   |   6 DIGS2      000D4D R   |   6 DIGTQ      000DCA R
    DISCOVER=  000000     |     DM_BK1RE=  007F90     |     DM_BK1RH=  007F91 
    DM_BK1RL=  007F92     |     DM_BK2RE=  007F93     |     DM_BK2RH=  007F94 
    DM_BK2RL=  007F95     |     DM_CR1  =  007F96     |     DM_CR2  =  007F97 
    DM_CSR1 =  007F98     |     DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A 
  6 DN1        0007EF R   |   6 DNEGA      0007D2 R   |   6 DOCONST    0018C5 R
  6 DOLIT      000475 R   |   6 DONXT      000489 R   |     DOORBELL=  000000 
  6 DOSTR      000F77 R   |   6 DOT        000FFC R   |   6 DOT1       001012 R
  6 DOTI1      001A33 R   |   6 DOTID      001A1D R   |   6 DOTO1      001410 R
  6 DOTOK      0013F6 R   |   6 DOTPR      001125 R   |   6 DOTQ       001672 R
  6 DOTQP      000FA0 R   |   6 DOTR       000FAE R   |   6 DOTS       0019BF R
  6 DOTS1      0019CA R   |   6 DOTS2      0019D3 R   |   6 DOVAR      000647 R
  6 DO_DCONS   001906 R   |   6 DROP       000590 R   |   6 DSTOR      000B8C R
  6 DUMP       001975 R   |   6 DUMP1      00198C R   |   6 DUMP3      0019AE R
  6 DUMPP      001944 R   |   6 DUPP       00059A R   |   6 EDIGS      000D6B R
  6 EECSTORE   001D5F R   |   6 EEPCP      001B85 R   |   6 EEPLAST    001B58 R
  6 EEPROM     001B40 R   |     EEPROM_B=  004000     |     EEPROM_E=  0047FF 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]

Symbol Table

    EEPROM_R=  000010     |     EEPROM_S=  000800     |   6 EEPRUN     001B6F R
  6 EEPVP      001B9B R   |   6 EESTORE    001DAB R   |   6 EE_CCOMM   002075 R
  6 EE_COMMA   002054 R   |   6 EE_CREAD   001CF0 R   |   6 EE_READ    001CCE R
  6 EI         0000BB R   |   6 ELSEE      0015D1 R   |   6 EMIT       000434 R
  6 ENEPER     002295 R   |     EOL_CR  =  000001     |     EOL_LF  =  000000 
  6 EQ1        00084C R   |   6 EQUAL      000836 R   |   6 ERASE      000C98 R
    ERR     =  00001B     |   6 EVAL       001439 R   |   6 EVAL1      001439 R
  6 EVAL2      001455 R   |   6 EXE1       000C2D R   |   6 EXECU      0004CF R
    EXT     =  000000     |     EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1 
  6 EXTRC      000CF2 R   |   6 FADDR      002142 R   |   6 FARAT      001C06 R
  6 FARCAT     001C12 R   |   6 FC_XOFF    000461 R   |   6 FC_XON     00044B R
    FHSE    =  7A1200     |     FHSI    =  F42400     |   6 FILL       000C65 R
  6 FILL1      000C82 R   |   6 FILL2      000C8B R   |   6 FIND       0011D7 R
  6 FIND1      0011F5 R   |   6 FIND2      001223 R   |   6 FIND3      00122F R
  6 FIND4      001243 R   |   6 FIND5      001250 R   |   6 FIND6      001234 R
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
    FLSI    =  01F400     |   6 FMOVE      00214D R   |   6 FMOVE2     00217E R
  6 FOR        00154E R   |   6 FORGET     000158 R   |   6 FORGET1    000187 R
  6 FORGET2    00020D R   |   6 FORGET4    000216 R   |   6 FORGET6    0001CF R
  6 FPSTOR     001B21 R   |     FPTR    =  000032     |   6 FREEVAR    000223 R
  6 FREEVAR4   000259 R   |     GPIO_BAS=  005000     |     GPIO_CR1=  000003 
    GPIO_CR2=  000004     |     GPIO_DDR=  000002     |     GPIO_IDR=  000001 
    GPIO_ODR=  000000     |     GPIO_SIZ=  000005     |   6 HERE       000BE9 R
  6 HEX        000DA1 R   |   6 HI         001A6F R   |   6 HLD        0006C7 R
  6 HOLD       000D16 R   |     HSECNT  =  004809     |     I2C_CCRH=  00521C 
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
    I2C_TRIS=  000011     |     I2C_WRIT=  000000     |   6 ICOLON     001802 R
  6 IFETCH     00156C R   |   6 IFF        0015A9 R   |   6 IFMOVE     002226 R
    IMEDD   =  000080     |   6 IMMED      001814 R   |   6 INCH       000428 R
  6 INC_FPTR   001C9B R   |   6 INITOFS    0017CA R   |   6 INN        000675 R
    INPUT_DI=  000000     |     INPUT_EI=  000001     |     INPUT_FL=  000000 
    INPUT_PU=  000001     |   6 INTE1      0013D8 R   |   6 INTER      0013AE R
  6 INTQ       0023CF R   |     INT_ADC2=  000016     |     INT_AUAR=  000012 
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
  6 ISEMI      00175F R   |     ITC_SPR1=  007F70     |     ITC_SPR2=  007F71 
    ITC_SPR3=  007F72     |     ITC_SPR4=  007F73     |     ITC_SPR5=  007F74 
    ITC_SPR6=  007F75     |     ITC_SPR7=  007F76     |     ITC_SPR8=  007F77 
    IWDG_KR =  0050E0     |     IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2 
  6 JSRC       0017B4 R   |   6 KEY        000EE1 R   |   6 KTAP       0012C8 R
  6 KTAP1      0012EB R   |   6 KTAP2      0012EE R   |   6 LAST       000706 R
  6 LASTN   =  0023CA R   |   6 LBRAC      0013E5 R   |     LED2_BIT=  000005 
    LED2_MAS=  000020     |     LED2_POR=  00500A     |   6 LESS       000873 R
    LF      =  00000A     |   6 LINK    =  0023CA R   |   6 LITER      001520 R
  6 LN2S       0022F1 R   |   6 LOCK       001C87 R   |   6 LOG2S      0022DB R
  6 LSHIFT     000AAD R   |   6 LSHIFT1    000AB6 R   |   6 LSHIFT4    000ABE R
  6 LT1        000889 R   |     MASKK   =  001F7F     |   6 MAX        000893 R
  6 MAX1       0008A6 R   |   6 MIN        0008B0 R   |   6 MIN1       0008C3 R
  6 MMOD1      000966 R   |   6 MMOD2      00097A R   |   6 MMOD3      000991 R
  6 MMSM1      00090D R   |   6 MMSM2      000921 R   |   6 MMSM3      000923 R
  6 MMSM4      00092B R   |   6 MODD       0009AB R   |   6 MONE       000B14 R
    MS      =  00002E     |   6 MSEC       0002CE R   |   6 MSMOD      000949 R
  6 MSTA1      000A3C R   |   6 MSTAR      000A19 R   |     NAFR    =  004804 
  6 NAMEQ      001270 R   |   6 NAMET      001181 R   |     NCLKOPT =  004808 
  6 NEGAT      0007C0 R   |   6 NEX1       000496 R   |   6 NEXT       00155D R
    NFLASH_W=  00480E     |     NHSECNT =  00480A     |     NOPT1   =  004802 
    NOPT2   =  004804     |     NOPT3   =  004806     |     NOPT4   =  004808 
    NOPT5   =  00480A     |     NOPT6   =  00480C     |     NOPT7   =  00480E 
    NOPTBL  =  00487F     |   6 NTIB       000685 R   |     NUBC    =  004802 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]

Symbol Table

    NUCLEO  =  000001     |   6 NUFQ       000EF7 R   |   6 NUFQ1      000F10 R
  6 NUMBQ      000E0E R   |   6 NUMQ1      000E42 R   |   6 NUMQ2      000E73 R
  6 NUMQ3      000EB5 R   |   6 NUMQ4      000EBA R   |   6 NUMQ5      000EC9 R
  6 NUMQ6      000ECC R   |     NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD 
    NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE 
  6 NonHandl   000000 R   |   6 OFFSET     00072B R   |     OFS     =  000005 
  6 ONE        000B06 R   |   6 ONEM       000A9C R   |   6 ONEP       000A8F R
    OPT     =  000002     |     OPT0    =  004800     |     OPT1    =  004801 
    OPT2    =  004803     |     OPT3    =  004805     |     OPT4    =  004807 
    OPT5    =  004809     |     OPT6    =  00480B     |     OPT7    =  00480D 
    OPTBL   =  00487E     |     OPTIMIZE=  000001     |     OPTION_B=  004800 
    OPTION_E=  00487F     |     OPTION_S=  000080     |   6 ORIG       000047 R
  6 ORR        0005FA R   |   6 OUTPUT     000439 R   |     OUTPUT_F=  000001 
    OUTPUT_O=  000000     |     OUTPUT_P=  000001     |     OUTPUT_S=  000000 
  6 OVER       0005C4 R   |   6 OVERT      00172D R   |     PA      =  000000 
  6 PACKS      000CA9 R   |   6 PAD        000BFA R   |   6 PAREN      001134 R
  6 PARS       00102D R   |   6 PARS1      001058 R   |   6 PARS2      001083 R
  6 PARS3      001086 R   |   6 PARS4      00108F R   |   6 PARS5      0010B2 R
  6 PARS6      0010C7 R   |   6 PARS7      0010D6 R   |   6 PARS8      0010E5 R
  6 PARSE      0010F6 R   |   6 PAUSE      0002DE R   |     PA_BASE =  005000 
    PA_CR1  =  005003     |     PA_CR2  =  005004     |     PA_DDR  =  005002 
    PA_IDR  =  005001     |     PA_ODR  =  005000     |     PB      =  000005 
    PB_BASE =  005005     |     PB_CR1  =  005008     |     PB_CR2  =  005009 
    PB_DDR  =  005007     |     PB_IDR  =  005006     |     PB_ODR  =  005005 
    PC      =  00000A     |     PC_BASE =  00500A     |     PC_CR1  =  00500D 
    PC_CR2  =  00500E     |     PC_DDR  =  00500C     |     PC_IDR  =  00500B 
    PC_ODR  =  00500A     |     PD      =  00000F     |   6 PDUM1      001957 R
  6 PDUM2      001968 R   |     PD_BASE =  00500F     |     PD_CR1  =  005012 
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
  6 PICK       000B54 R   |   6 PII        002254 R   |     PI_BASE =  005028 
    PI_CR1  =  00502B     |     PI_CR2  =  00502C     |     PI_DDR  =  00502A 
    PI_IDR  =  005029     |     PI_ODR  =  005028     |   6 PLUS       000795 R
  6 PNAM1      0016E2 R   |   6 PRESE      001464 R   |     PROD1   =  000022 
    PROD2   =  000024     |     PROD3   =  000026     |   6 PROTECTE   0001FF R
  6 PSTOR      000B6B R   |     PTR16   =  000033     |     PTR8    =  000034 
  6 PTRPLUS    001CB3 R   |   6 QBRAN      0004A8 R   |   6 QDUP       000744 R
  6 QDUP1      00074E R   |   6 QKEY       000416 R   |   6 QSTAC      00141C R
  6 QUERY      001348 R   |   6 QUEST      00101F R   |   6 QUIT       001481 R
  6 QUIT1      001489 R   |   6 QUIT2      00148C R   |   6 RAM2EE     0020EE R
    RAMBASE =  000000     |   6 RAMLAST    000719 R   |     RAM_BASE=  000000 
    RAM_END =  0017FF     |     RAM_SIZE=  001800     |   6 RANDOM     00027C R
  6 RAT        000557 R   |   6 RBRAC      0017A1 R   |   6 REPEA      001626 R
  6 RFREE      0020D5 R   |   6 RFROM      000544 R   |     ROP     =  004800 
  6 ROT        000755 R   |   6 ROW2BUF    002097 R   |     ROWBUFF =  001680 
    RP0     =  00002C     |   6 RPAT       000521 R   |     RPP     =  0017FF 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
Hexadecimal [24-Bits]

Symbol Table

  6 RPSTO      00052E R   |   6 RSHIFT     000AC9 R   |   6 RSHIFT1    000AD2 R
  6 RSHIFT4    000ADA R   |     RST_SR  =  0050B3     |   6 RT12_2     0022C4 R
  6 SAME1      00119F R   |   6 SAME2      0011C8 R   |   6 SAMEQ      001197 R
  6 SCOM1      001717 R   |   6 SCOM2      00171A R   |   6 SCOMP      0016F9 R
  6 SEED       000263 R   |     SEEDX   =  000036     |     SEEDY   =  000038 
  6 SEMIS      00173D R   |   6 SETISP     0000CE R   |   6 SET_RAML   001884 R
    SFR_BASE=  005000     |     SFR_END =  0057FF     |   6 SIGN       000D55 R
  6 SIGN1      000D65 R   |   6 SLASH      0009B5 R   |   6 SLMOD      000999 R
  6 SNAME      0016AC R   |     SP0     =  00002A     |   6 SPACE      000F19 R
  6 SPACS      000F28 R   |   6 SPAT       00057A R   |     SPI_CR1 =  005200 
    SPI_CR2 =  005201     |     SPI_CRCP=  005205     |     SPI_DR  =  005204 
    SPI_ICR =  005202     |     SPI_RXCR=  005206     |     SPI_SR  =  005203 
    SPI_TXCR=  005207     |     SPP     =  001680     |     SPSAVE  =  000001 
  6 SPSTO      000587 R   |   6 SQRT10     0022AD R   |   6 SQRT2      00226B R
  6 SQRT3      002282 R   |   6 SSMOD      000A45 R   |     SSP     =  000001 
    STACK   =  0017FF     |   6 STAR       000A0E R   |   6 STASL      000A56 R
  6 STOD       0007F7 R   |   6 STORE      0004DC R   |   6 STR        000D83 R
  6 STRCQ      00152E R   |   6 STRQ       001665 R   |   6 STRQP      000F96 R
  6 SUBB       00080E R   |   6 SWAPP      0005AA R   |     SWIM_CSR=  007F80 
  6 TAP        0012B2 R   |   6 TBOOT      001AA6 R   |   6 TBUF       000695 R
    TBUFFBAS=  001680     |   6 TCHAR      000B25 R   |   6 TEMP       000666 R
  6 TEVAL      0006B8 R   |   6 TFLASH     0006A7 R   |   6 THENN      0015BE R
  6 TIB        000C0B R   |     TIBB    =  001700     |     TIBBASE =  001700 
    TIC     =  000027     |   6 TICK       001498 R   |     TIM1_ARR=  005262 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal [24-Bits]

Symbol Table

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
  6 TNAM2      0019ED R   |   6 TNAM3      001A0B R   |   6 TNAM4      001A11 R
  6 TNAME      0019EA R   |   6 TOFLASH    000333 R   |   6 TOKEN      001173 R
  6 TOR        000563 R   |   6 TORAM      000373 R   |     TRUEE   =  00FFFF 
  6 TWOSL      000AE1 R   |   6 TYPE1      000F48 R   |   6 TYPE2      000F54 R
  6 TYPES      000F43 R   |   6 Timer4Ha   000005 R   |     UART1   =  000000 
    UART1_BA=  005230     |     UART1_BR=  005232     |     UART1_BR=  005233 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal [24-Bits]

Symbol Table

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
    UBASE   =  000006     |     UBC     =  004801     |     UCNTXT  =  000014 
    UCP     =  000018     |     UCTIB   =  00000C     |     UD1     =  000001 
    UD2     =  000002     |     UD3     =  000003     |     UD4     =  000004 
  6 UDOT       000FE9 R   |   6 UDOTR      000FC9 R   |   6 UEND       000045 R
    UHLD    =  000012     |     UINN    =  00000A     |     UINTER  =  000010 
    ULAST   =  00001A     |   6 ULES1      00086B R   |   6 ULESS      000855 R
  6 UMMOD      0008EB R   |   6 UMSTA      0009C4 R   |   6 UNIQ1      0016A3 R
  6 UNIQU      001684 R   |   6 UNLKEE     001C21 R   |   6 UNLKFL     001C40 R
  6 UNLOCK     001C5F R   |   6 UNTIL      001586 R   |     UOFFSET =  00001C 
  6 UPDATCP    001BDE R   |   6 UPDATLAS   001BB5 R   |   6 UPDATPTR   0021E1 R
  6 UPDATRUN   001BCD R   |   6 UPDATVP    001BF5 R   |   6 UPL1       00063B R
  6 UPLUS      000624 R   |     UPP     =  000006     |     URLAST  =  000020 
    USR_BTN_=  000004     |     USR_BTN_=  000010     |     USR_BTN_=  005015 
    UTFLASH =  00001E     |     UTIB    =  00000E     |     UTMP    =  000008 
  6 UTYP1      001927 R   |   6 UTYP2      001936 R   |   6 UTYPE      001922 R
    UVP     =  000016     |   6 UZERO      00002B R   |   6 VARIA      001851 R
    VAR_BASE=  000080     |     VAR_TOP =  0017BF     |     VER     =  000003 
  6 VPP        0006E8 R   |     VSIZE   =  000006     |     WANT_CON=  000001 
    WANT_DEB=  000000     |     WANT_SCA=  000001     |     WANT_SEE=  000000 
    WDGOPT  =  004805     |     WDGOPT_I=  000002     |     WDGOPT_L=  000003 
    WDGOPT_W=  000000     |     WDGOPT_W=  000001     |   6 WHILE      00160C R
  6 WITHI      0008D0 R   |   6 WORDD      00115F R   |   6 WORDS      001A47 R
  6 WORS1      001A4D R   |   6 WORS2      001A69 R   |   6 WR_BYTE    001D0A R
  6 WR_WORD    001D2F R   |   6 WTABLE     002339 R   |   6 WTAT       00235D R
  6 WTINIT     0023A2 R   |     WWDG_CR =  0050D1     |     WWDG_WR =  0050D2 
    XMEM_SIZ=  017830     |     XOFF    =  000013     |     XON     =  000011 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]

Symbol Table

  6 XORR       00060F R   |     XTEMP   =  000022     |     YTEMP   =  000024 
  6 ZERO       000AFB R   |   6 ZL1        0005DC R   |   6 ZLESS      0005D3 R
  6 app_spac   002400 R   |   6 baudrate   000379 R   |   6 block_er   001DF5 R
  6 clear_ra   000019 R   |   6 clock_in   000062 R   |   6 copy_buf   001E55 R
  6 copy_buf   001E74 R   |   6 copy_pro   001E74 R   |     da      =  000002 
    db      =  000003     |     dc      =  000000     |     dd      =  000001 
  6 erase_fl   001E17 R   |   6 fmove_do   0021CA R   |   6 main       000016 R
  6 next_row   002187 R   |   6 no_move    0021D1 R   |   6 pristine   001EF5 R
  6 proceed_   001E1A R   |   6 reboot     000325 R   |   6 reset_ve   001F5C R
  6 row_eras   001DD5 R   |   6 row_eras   001E2E R   |   6 row_eras   001E55 R
  6 set_opti   001EC9 R   |   6 set_vect   001FFD R   |   6 uart_ini   000074 R
  6 write_ro   001E99 R

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

