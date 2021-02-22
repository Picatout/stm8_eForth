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
      0080B5 94 14                  292         .word      INTER   ;'EVAL
      0080B7 00 00                  293         .word      0       ;HLD
      0080B9 A4 30                  294         .word      LASTN  ;CNTXT pointer
      0080BB 00 80                  295         .word      VAR_BASE   ;variables free space pointer 
      0080BD A4 80                  296         .word      app_space ; FLASH free space pointer 
      0080BF A4 30                  297         .word      LASTN   ;LAST
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
      00812B CC 9B 18         [ 2]  369         jp  COLD   ;default=MN1
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
      00817C CD 8B 13         [ 4]  434         call LSHIFT ; creat slot mask 
      00817F CD 88 2F         [ 4]  435         call INVER  ; ( level reg lshift rval mask )
      008182 CD 86 66         [ 4]  436         call ANDD ; ( level reg lshift slot_masked )
      008185 CD 85 E3         [ 4]  437         call TOR  ; ( level reg lshift -- R: slot_masked )
      008188 CD 87 D5         [ 4]  438         call ROT  ; ( reg lshift level )
      00818B CD 86 2A         [ 4]  439         call SWAPP ; ( reg level lshift )
      00818E CD 8B 13         [ 4]  440         call LSHIFT  ; ( reg slot_level -- )
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
      0081A7 CD 91 D9         [ 4]  454         call TOKEN 
      0081AA CD 86 1A         [ 4]  455         call DUPP 
      0081AD CD 85 28         [ 4]  456         call QBRAN 
      0081B0 82 8D                  457         .word FORGET2
      0081B2 CD 92 D6         [ 4]  458         call NAMEQ
      0081B5 CD 87 C4         [ 4]  459         call QDUP 
      0081B8 CD 85 28         [ 4]  460         call QBRAN 
      0081BB 82 8D                  461         .word FORGET2
      0081BD CD 86 10         [ 4]  462         call DROP 
      0081C0 1D 00 04         [ 2]  463         subw x,#2*CELLL 
      0081C3 90 5F            [ 1]  464         clrw y 
      0081C5 FF               [ 2]  465         ldw (x),y 
      0081C6 90 AE 40 02      [ 2]  466         ldw y,#APP_RUN 
      0081CA EF 02            [ 2]  467         ldw (2,x),y 
      0081CC CC 9E 11         [ 2]  468         jp EESTORE 
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
      0081D8 CD 91 D9         [ 4]  479         call TOKEN
      0081DB CD 86 1A         [ 4]  480         call DUPP 
      0081DE CD 85 28         [ 4]  481         call QBRAN 
      0081E1 82 8D                  482         .word FORGET2
      0081E3 CD 92 D6         [ 4]  483         call NAMEQ ; ( a -- ca na | a F )
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
      008204 CD A0 14         [ 4]  498         call CHKIVEC ; ( na -- ) 
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
      008249 CD 9C 44         [ 4]  526         call UPDATCP 
      00824C CC 9C 1B         [ 2]  527         jp UPDATLAST 
      00824F                        528 FORGET6: ; tried to forget a RAM or system word 
                                    529 ; ( ca na -- )
      00824F 1D 00 02         [ 2]  530         subw x,#CELLL 
      008252 90 BE 2A         [ 2]  531         ldw y,SP0 
      008255 FF               [ 2]  532         ldw (x),y  
      008256 CD 88 D5         [ 4]  533         call ULESS
      008259 CD 85 28         [ 4]  534         call QBRAN 
      00825C 82 7F                  535         .word PROTECTED 
      00825E CD 93 E2         [ 4]  536         call ABORQ 
      008261 1D                     537         .byte 29
      008262 20 46 6F 72 20 52 41   538         .ascii " For RAM definition do REBOOT"
             4D 20 64 65 66 69 6E
             69 74 69 6F 6E 20 64
             6F 20 52 45 42 4F 4F
             54
      00827F                        539 PROTECTED:
      00827F CD 93 E2         [ 4]  540         call ABORQ
      008282 0A                     541         .byte 10
      008283 20 50 72 6F 74 65 63   542         .ascii " Protected"
             74 65 64
      00828D                        543 FORGET2: ; no name or not found in dictionary 
      00828D CD 93 E2         [ 4]  544         call ABORQ
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
      0082A9 CD 8A F5         [ 4]  563         call ONEP ;
      0082AC CD 88 15         [ 4]  564         CALL PLUS ; ( na c+1 -- ca ) 
      0082AF CD 8A F5         [ 4]  565         call ONEP ; ( ca+ -- ) to get routne address 
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
      0082D6 CC 9C 5B         [ 2]  579         jp UPDATVP 
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
      0083C1 CD 93 E2         [ 4]  746         call ABORQ 
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
      00896B 90 93            [ 1] 1792         LDW     Y,X             ; stack pointer to Y
      00896D FE               [ 2] 1793         LDW     X,(X)           ; un
      00896E BF 24            [ 2] 1794         LDW     YTEMP,X         ; save un
      008970 93               [ 1] 1795         LDW     X,Y
      008971 5C               [ 1] 1796         INCW    X               ; drop un
      008972 5C               [ 1] 1797         INCW    X
      008973 89               [ 2] 1798         PUSHW   X               ; save stack pointer
      008974 FE               [ 2] 1799         LDW     X,(X)           ; X=udh
      008975 90 EE 04         [ 2] 1800         LDW     Y,(4,Y)         ; Y=udl (offset before drop)
      008978 B3 24            [ 2] 1801         CPW     X,YTEMP
      00897A 25 0B            [ 1] 1802         JRULT   MMSM1           ; X is still on the R-stack
      00897C 85               [ 2] 1803         POPW    X               ; restore stack pointer
      00897D 90 AE FF FF      [ 2] 1804         LDW     Y,#0xFFFF       ; overflow result:
      008981 FF               [ 2] 1805         LDW     (X),Y           ; quotient max. 16 bit value
      008982 90 5F            [ 1] 1806         CLRW    Y
      008984 EF 02            [ 2] 1807         LDW     (2,X),Y         ; remainder 0
      008986 81               [ 4] 1808         RET
      008987                       1809 MMSM1:
      008987 A6 10            [ 1] 1810         LD      A,#16           ; loop count
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



      008989 90 58            [ 2] 1811         SLLW    Y               ; udl shift udl into udh
      00898B                       1812 MMSM3:
      00898B 59               [ 2] 1813         RLCW    X               ; rotate udl bit into uhdh (= remainder)
      00898C 25 04            [ 1] 1814         JRC     MMSMa           ; if carry out of rotate
      00898E B3 24            [ 2] 1815         CPW     X,YTEMP         ; compare udh to un
      008990 25 05            [ 1] 1816         JRULT   MMSM4           ; can't subtract
      008992                       1817 MMSMa:
      008992 72 B0 00 24      [ 2] 1818         SUBW    X,YTEMP         ; can subtract
      008996 98               [ 1] 1819         RCF
      008997                       1820 MMSM4:
      008997 8C               [ 1] 1821         CCF                     ; quotient bit
      008998 90 59            [ 2] 1822         RLCW    Y               ; rotate into quotient, rotate out udl
      00899A 4A               [ 1] 1823         DEC     A               ; repeat
      00899B 26 EE            [ 1] 1824         JRNE    MMSM3           ; if A == 0
      00899D                       1825 MMSMb:
      00899D BF 24            [ 2] 1826         LDW     YTEMP,X         ; done, save remainder
      00899F 85               [ 2] 1827         POPW    X               ; restore stack pointer
      0089A0 FF               [ 2] 1828         LDW     (X),Y           ; save quotient
      0089A1 90 BE 24         [ 2] 1829         LDW     Y,YTEMP         ; remainder onto stack
      0089A4 EF 02            [ 2] 1830         LDW     (2,X),Y
      0089A6 81               [ 4] 1831         RET
                                   1832 
                                   1833 
                                   1834 ;----------------------------------------------	
                                   1835 ;       M/MOD   ( d n -- r q )
                                   1836 ;       Signed floored divide of double by
                                   1837 ;       single. Return mod and quotient.
                                   1838 ;----------------------------------------------	
      0089A7 89 64                 1839         .word      LINK
                           000929  1840 LINK = . 
      0089A9 05                    1841         .byte      5
      0089AA 4D 2F 4D 4F 44        1842         .ascii     "M/MOD"
      0089AF                       1843 MSMOD:  
      0089AF CD 86 1A         [ 4] 1844         CALL	DUPP
      0089B2 CD 86 53         [ 4] 1845         CALL	ZLESS
      0089B5 CD 86 1A         [ 4] 1846         CALL	DUPP
      0089B8 CD 85 E3         [ 4] 1847         CALL	TOR
      0089BB CD 85 28         [ 4] 1848         CALL	QBRAN
      0089BE 89 CC                 1849         .word	MMOD1
      0089C0 CD 88 40         [ 4] 1850         CALL	NEGAT
      0089C3 CD 85 E3         [ 4] 1851         CALL	TOR
      0089C6 CD 88 52         [ 4] 1852         CALL	DNEGA
      0089C9 CD 85 C4         [ 4] 1853         CALL	RFROM
      0089CC CD 85 E3         [ 4] 1854 MMOD1:	CALL	TOR
      0089CF CD 86 1A         [ 4] 1855         CALL	DUPP
      0089D2 CD 86 53         [ 4] 1856         CALL	ZLESS
      0089D5 CD 85 28         [ 4] 1857         CALL	QBRAN
      0089D8 89 E0                 1858         .word	MMOD2
      0089DA CD 85 D7         [ 4] 1859         CALL	RAT
      0089DD CD 88 15         [ 4] 1860         CALL	PLUS
      0089E0 CD 85 C4         [ 4] 1861 MMOD2:	CALL	RFROM
      0089E3 CD 89 6B         [ 4] 1862         CALL	UMMOD
      0089E6 CD 85 C4         [ 4] 1863         CALL	RFROM
      0089E9 CD 85 28         [ 4] 1864         CALL	QBRAN
      0089EC 89 F7                 1865         .word	MMOD3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



      0089EE CD 86 2A         [ 4] 1866         CALL	SWAPP
      0089F1 CD 88 40         [ 4] 1867         CALL	NEGAT
      0089F4 CD 86 2A         [ 4] 1868         CALL	SWAPP
      0089F7 81               [ 4] 1869 MMOD3:	RET
                                   1870 
                                   1871 ;       /MOD    ( n n -- r q )
                                   1872 ;       Signed divide. Return mod and quotient.
      0089F8 89 A9                 1873         .word      LINK
                           00097A  1874 LINK = . 
      0089FA 04                    1875         .byte      4
      0089FB 2F 4D 4F 44           1876         .ascii     "/MOD"
      0089FF                       1877 SLMOD:
      0089FF CD 86 44         [ 4] 1878         CALL	OVER
      008A02 CD 86 53         [ 4] 1879         CALL	ZLESS
      008A05 CD 86 2A         [ 4] 1880         CALL	SWAPP
      008A08 CC 89 AF         [ 2] 1881         JP	MSMOD
                                   1882 
                                   1883 ;       MOD     ( n n -- r )
                                   1884 ;       Signed divide. Return mod only.
      008A0B 89 FA                 1885         .word      LINK
                           00098D  1886 LINK = . 
      008A0D 03                    1887         .byte      3
      008A0E 4D 4F 44              1888         .ascii     "MOD"
      008A11                       1889 MODD:
      008A11 CD 89 FF         [ 4] 1890 	CALL	SLMOD
      008A14 CC 86 10         [ 2] 1891 	JP	DROP
                                   1892 
                                   1893 ;       /       ( n n -- q )
                                   1894 ;       Signed divide. Return quotient only.
      008A17 8A 0D                 1895         .word      LINK
                           000999  1896 LINK = . 
      008A19 01                    1897         .byte      1
      008A1A 2F                    1898         .ascii     "/"
      008A1B                       1899 SLASH:
      008A1B CD 89 FF         [ 4] 1900         CALL	SLMOD
      008A1E CD 86 2A         [ 4] 1901         CALL	SWAPP
      008A21 CC 86 10         [ 2] 1902         JP	DROP
                                   1903 
                                   1904 ;; Multiply
                                   1905 
                                   1906 ;       UM*     ( u u -- ud )
                                   1907 ;       Unsigned multiply. Return double product.
      008A24 8A 19                 1908         .word      LINK
                           0009A6  1909 LINK = . 
      008A26 03                    1910         .byte      3
      008A27 55 4D 2A              1911         .ascii     "UM*"
      008A2A                       1912 UMSTA:	; stack have 4 bytes u1=a,b u2=c,d
                                   1913 ; take advantage of SP addressing modes
                                   1914 ; these PRODx in RAM are not required
                                   1915 ; the product is kept on stack as local variable 
                                   1916         ;; bytes offset on data stack 
                           000002  1917         da=2 
                           000003  1918         db=3 
                           000000  1919         dc=0 
                           000001  1920         dd=1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



                                   1921         ;; product bytes offset on return stack 
                           000001  1922         UD1=1  ; ud bits 31..24
                           000002  1923         UD2=2  ; ud bits 23..16
                           000003  1924         UD3=3  ; ud bits 15..8 
                           000004  1925         UD4=4  ; ud bits 7..0 
                                   1926         ;; local variable for product set to zero   
      008A2A 90 5F            [ 1] 1927         clrw y 
      008A2C 90 89            [ 2] 1928         pushw y  ; bits 15..0
      008A2E 90 89            [ 2] 1929         pushw y  ; bits 31..16 
      008A30 E6 03            [ 1] 1930         ld a,(db,x) ; b 
      008A32 90 97            [ 1] 1931         ld yl,a 
      008A34 E6 01            [ 1] 1932         ld a,(dd,x)   ; d
      008A36 90 42            [ 4] 1933         mul y,a    ; b*d  
      008A38 17 03            [ 2] 1934         ldw (UD3,sp),y ; lowest weight product 
      008A3A E6 03            [ 1] 1935         ld a,(db,x)
      008A3C 90 97            [ 1] 1936         ld yl,a 
      008A3E E6 00            [ 1] 1937         ld a,(dc,x)
      008A40 90 42            [ 4] 1938         mul y,a  ; b*c 
                                   1939         ;;; do the partial sum 
      008A42 72 F9 02         [ 2] 1940         addw y,(UD2,sp)
      008A45 4F               [ 1] 1941         clr a 
      008A46 49               [ 1] 1942         rlc a
      008A47 6B 01            [ 1] 1943         ld (UD1,sp),a 
      008A49 17 02            [ 2] 1944         ldw (UD2,sp),y 
      008A4B E6 02            [ 1] 1945         ld a,(da,x)
      008A4D 90 97            [ 1] 1946         ld yl,a 
      008A4F E6 01            [ 1] 1947         ld a,(dd,x)
      008A51 90 42            [ 4] 1948         mul y,a   ; a*d 
                                   1949         ;; do partial sum 
      008A53 72 F9 02         [ 2] 1950         addw y,(UD2,sp)
      008A56 4F               [ 1] 1951         clr a 
      008A57 19 01            [ 1] 1952         adc a,(UD1,sp)
      008A59 6B 01            [ 1] 1953         ld (UD1,sp),a  
      008A5B 17 02            [ 2] 1954         ldw (UD2,sp),y 
      008A5D E6 02            [ 1] 1955         ld a,(da,x)
      008A5F 90 97            [ 1] 1956         ld yl,a 
      008A61 E6 00            [ 1] 1957         ld a,(dc,x)
      008A63 90 42            [ 4] 1958         mul y,a  ;  a*c highest weight product 
                                   1959         ;;; do partial sum 
      008A65 72 F9 01         [ 2] 1960         addw y,(UD1,sp)
      008A68 FF               [ 2] 1961         ldw (x),y  ; udh 
      008A69 16 03            [ 2] 1962         ldw y,(UD3,sp)
      008A6B EF 02            [ 2] 1963         ldw (2,x),y  ; udl  
      008A6D 5B 04            [ 2] 1964         addw sp,#4 ; drop local variable 
      008A6F 81               [ 4] 1965         ret  
                                   1966 
                                   1967 
                                   1968 ;       *       ( n n -- n )
                                   1969 ;       Signed multiply. Return single product.
      008A70 8A 26                 1970         .word      LINK
                           0009F2  1971 LINK = . 
      008A72 01                    1972         .byte      1
      008A73 2A                    1973         .ascii     "*"
      008A74                       1974 STAR:
      008A74 CD 8A 2A         [ 4] 1975 	CALL	UMSTA
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



      008A77 CC 86 10         [ 2] 1976 	JP	DROP
                                   1977 
                                   1978 ;       M*      ( n n -- d )
                                   1979 ;       Signed multiply. Return double product.
      008A7A 8A 72                 1980         .word      LINK
                           0009FC  1981 LINK = . 
      008A7C 02                    1982         .byte      2
      008A7D 4D 2A                 1983         .ascii     "M*"
      008A7F                       1984 MSTAR:      
      008A7F CD 88 00         [ 4] 1985         CALL	DDUP
      008A82 CD 86 8F         [ 4] 1986         CALL	XORR
      008A85 CD 86 53         [ 4] 1987         CALL	ZLESS
      008A88 CD 85 E3         [ 4] 1988         CALL	TOR
      008A8B CD 88 A8         [ 4] 1989         CALL	ABSS
      008A8E CD 86 2A         [ 4] 1990         CALL	SWAPP
      008A91 CD 88 A8         [ 4] 1991         CALL	ABSS
      008A94 CD 8A 2A         [ 4] 1992         CALL	UMSTA
      008A97 CD 85 C4         [ 4] 1993         CALL	RFROM
      008A9A CD 85 28         [ 4] 1994         CALL	QBRAN
      008A9D 8A A2                 1995         .word	MSTA1
      008A9F CD 88 52         [ 4] 1996         CALL	DNEGA
      008AA2 81               [ 4] 1997 MSTA1:	RET
                                   1998 
                                   1999 ;       */MOD   ( n1 n2 n3 -- r q )
                                   2000 ;       Multiply n1 and n2, then divide
                                   2001 ;       by n3. Return mod and quotient.
      008AA3 8A 7C                 2002         .word      LINK
                           000A25  2003 LINK = . 
      008AA5 05                    2004         .byte      5
      008AA6 2A 2F 4D 4F 44        2005         .ascii     "*/MOD"
      008AAB                       2006 SSMOD:
      008AAB CD 85 E3         [ 4] 2007         CALL     TOR
      008AAE CD 8A 7F         [ 4] 2008         CALL     MSTAR
      008AB1 CD 85 C4         [ 4] 2009         CALL     RFROM
      008AB4 CC 89 AF         [ 2] 2010         JP     MSMOD
                                   2011 
                                   2012 ;       */      ( n1 n2 n3 -- q )
                                   2013 ;       Multiply n1 by n2, then divide
                                   2014 ;       by n3. Return quotient only.
      008AB7 8A A5                 2015         .word      LINK
                           000A39  2016 LINK = . 
      008AB9 02                    2017         .byte      2
      008ABA 2A 2F                 2018         .ascii     "*/"
      008ABC                       2019 STASL:
      008ABC CD 8A AB         [ 4] 2020         CALL	SSMOD
      008ABF CD 86 2A         [ 4] 2021         CALL	SWAPP
      008AC2 CC 86 10         [ 2] 2022         JP	DROP
                                   2023 
                                   2024 ;; Miscellaneous
                                   2025 
                                   2026 ;       CELL+   ( a -- a )
                                   2027 ;       Add cell size in byte to address.
      008AC5 8A B9                 2028         .word      LINK
                           000A47  2029 LINK = . 
      008AC7 02                    2030         .byte       2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



      008AC8 32 2B                 2031         .ascii     "2+"
      008ACA                       2032 CELLP:
      008ACA 90 93            [ 1] 2033         LDW Y,X
      008ACC 90 FE            [ 2] 2034 	LDW Y,(Y)
      008ACE 72 A9 00 02      [ 2] 2035         ADDW Y,#CELLL 
      008AD2 FF               [ 2] 2036         LDW (X),Y
      008AD3 81               [ 4] 2037         RET
                                   2038 
                                   2039 ;       CELL-   ( a -- a )
                                   2040 ;       Subtract 2 from address.
      008AD4 8A C7                 2041         .word      LINK
                           000A56  2042 LINK = . 
      008AD6 02                    2043         .byte       2
      008AD7 32 2D                 2044         .ascii     "2-"
      008AD9                       2045 CELLM:
      008AD9 90 93            [ 1] 2046         LDW Y,X
      008ADB 90 FE            [ 2] 2047 	LDW Y,(Y)
      008ADD 72 A2 00 02      [ 2] 2048         SUBW Y,#CELLL
      008AE1 FF               [ 2] 2049         LDW (X),Y
      008AE2 81               [ 4] 2050         RET
                                   2051 
                                   2052 ;       CELLS   ( n -- n )
                                   2053 ;       Multiply tos by 2.
      008AE3 8A D6                 2054         .word      LINK
                           000A65  2055 LINK = . 
      008AE5 02                    2056         .byte       2
      008AE6 32 2A                 2057         .ascii     "2*"
      008AE8                       2058 CELLS:
      008AE8 90 93            [ 1] 2059         LDW Y,X
      008AEA 90 FE            [ 2] 2060 	LDW Y,(Y)
      008AEC 90 58            [ 2] 2061         SLAW Y
      008AEE FF               [ 2] 2062         LDW (X),Y
      008AEF 81               [ 4] 2063         RET
                                   2064 
                                   2065 ;       1+      ( a -- a )
                                   2066 ;       Add cell size in byte to address.
      008AF0 8A E5                 2067         .word      LINK
                           000A72  2068 LINK = . 
      008AF2 02                    2069         .byte      2
      008AF3 31 2B                 2070         .ascii     "1+"
      008AF5                       2071 ONEP:
      008AF5 90 93            [ 1] 2072         LDW Y,X
      008AF7 90 FE            [ 2] 2073 	LDW Y,(Y)
      008AF9 90 5C            [ 1] 2074         INCW Y
      008AFB FF               [ 2] 2075         LDW (X),Y
      008AFC 81               [ 4] 2076         RET
                                   2077 
                                   2078 ;       1-      ( a -- a )
                                   2079 ;       Subtract 2 from address.
      008AFD 8A F2                 2080         .word      LINK
                           000A7F  2081 LINK = . 
      008AFF 02                    2082         .byte      2
      008B00 31 2D                 2083         .ascii     "1-"
      008B02                       2084 ONEM:
      008B02 90 93            [ 1] 2085         LDW Y,X
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



      008B04 90 FE            [ 2] 2086 	LDW Y,(Y)
      008B06 90 5A            [ 2] 2087         DECW Y
      008B08 FF               [ 2] 2088         LDW (X),Y
      008B09 81               [ 4] 2089         RET
                                   2090 
                                   2091 ;  shift left n times 
                                   2092 ; LSHIFT ( n1 n2 -- n1<<n2 )
      008B0A 8A FF                 2093         .word LINK 
                           000A8C  2094         LINK=.
      008B0C 06                    2095         .byte 6 
      008B0D 4C 53 48 49 46 54     2096         .ascii "LSHIFT"
      008B13                       2097 LSHIFT:
      008B13 E6 01            [ 1] 2098         ld a,(1,x)
      008B15 1C 00 02         [ 2] 2099         addw x,#CELLL 
      008B18 90 93            [ 1] 2100         ldw y,x 
      008B1A 90 FE            [ 2] 2101         ldw y,(y)
      008B1C                       2102 LSHIFT1:
      008B1C 4D               [ 1] 2103         tnz a 
      008B1D 27 05            [ 1] 2104         jreq LSHIFT4 
      008B1F 90 58            [ 2] 2105         sllw y 
      008B21 4A               [ 1] 2106         dec a 
      008B22 20 F8            [ 2] 2107         jra LSHIFT1 
      008B24                       2108 LSHIFT4:
      008B24 FF               [ 2] 2109         ldw (x),y 
      008B25 81               [ 4] 2110         ret 
                                   2111 
                                   2112 ; shift right n times                 
                                   2113 ; RSHIFT (n1 n2 -- n1>>n2 )
      008B26 8B 0C                 2114         .word LINK 
                           000AA8  2115         LINK=.
      008B28 06                    2116         .byte 6
      008B29 52 53 48 49 46 54     2117         .ascii "RSHIFT"
      008B2F                       2118 RSHIFT:
      008B2F E6 01            [ 1] 2119         ld a,(1,x)
      008B31 1C 00 02         [ 2] 2120         addw x,#CELLL 
      008B34 90 93            [ 1] 2121         ldw y,x 
      008B36 90 FE            [ 2] 2122         ldw y,(y)
      008B38                       2123 RSHIFT1:
      008B38 4D               [ 1] 2124         tnz a 
      008B39 27 05            [ 1] 2125         jreq RSHIFT4 
      008B3B 90 54            [ 2] 2126         srlw y 
      008B3D 4A               [ 1] 2127         dec a 
      008B3E 20 F8            [ 2] 2128         jra RSHIFT1 
      008B40                       2129 RSHIFT4:
      008B40 FF               [ 2] 2130         ldw (x),y 
      008B41 81               [ 4] 2131         ret 
                                   2132 
                                   2133 
                                   2134 ;       2/      ( n -- n )
                                   2135 ;       divide  tos by 2.
      008B42 8B 28                 2136         .word      LINK
                           000AC4  2137 LINK = . 
      008B44 02                    2138         .byte      2
      008B45 32 2F                 2139         .ascii     "2/"
      008B47                       2140 TWOSL:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



      008B47 90 93            [ 1] 2141         LDW Y,X
      008B49 90 FE            [ 2] 2142 	LDW Y,(Y)
      008B4B 90 57            [ 2] 2143         SRAW Y
      008B4D FF               [ 2] 2144         LDW (X),Y
      008B4E 81               [ 4] 2145         RET
                                   2146 
                                   2147 ;       BL      ( -- 32 )
                                   2148 ;       Return 32,  blank character.
      008B4F 8B 44                 2149         .word      LINK
                           000AD1  2150 LINK = . 
      008B51 02                    2151         .byte      2
      008B52 42 4C                 2152         .ascii     "BL"
      008B54                       2153 BLANK:
      008B54 1D 00 02         [ 2] 2154         SUBW X,#2
      008B57 90 AE 00 20      [ 2] 2155 	LDW Y,#32
      008B5B FF               [ 2] 2156         LDW (X),Y
      008B5C 81               [ 4] 2157         RET
                                   2158 
                                   2159 ;         0     ( -- 0)
                                   2160 ;         Return 0.
      008B5D 8B 51                 2161         .word      LINK
                           000ADF  2162 LINK = . 
      008B5F 01                    2163         .byte       1
      008B60 30                    2164         .ascii     "0"
      008B61                       2165 ZERO:
      008B61 1D 00 02         [ 2] 2166         SUBW X,#2
      008B64 90 5F            [ 1] 2167 	CLRW Y
      008B66 FF               [ 2] 2168         LDW (X),Y
      008B67 81               [ 4] 2169         RET
                                   2170 
                                   2171 ;         1     ( -- 1)
                                   2172 ;         Return 1.
      008B68 8B 5F                 2173         .word      LINK
                           000AEA  2174 LINK = . 
      008B6A 01                    2175         .byte       1
      008B6B 31                    2176         .ascii     "1"
      008B6C                       2177 ONE:
      008B6C 1D 00 02         [ 2] 2178         SUBW X,#2
      008B6F 90 AE 00 01      [ 2] 2179 	LDW Y,#1
      008B73 FF               [ 2] 2180         LDW (X),Y
      008B74 81               [ 4] 2181         RET
                                   2182 
                                   2183 ;         -1    ( -- -1)
                                   2184 ;         Return 32,  blank character.
      008B75 8B 6A                 2185         .word      LINK
                           000AF7  2186 LINK = . 
      008B77 02                    2187         .byte       2
      008B78 2D 31                 2188         .ascii     "-1"
      008B7A                       2189 MONE:
      008B7A 1D 00 02         [ 2] 2190         SUBW X,#2
      008B7D 90 AE FF FF      [ 2] 2191 	LDW Y,#0xFFFF
      008B81 FF               [ 2] 2192         LDW (X),Y
      008B82 81               [ 4] 2193         RET
                                   2194 
                                   2195 ;       >CHAR   ( c -- c )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



                                   2196 ;       Filter non-printing characters.
      008B83 8B 77                 2197         .word      LINK
                           000B05  2198 LINK = . 
      008B85 05                    2199         .byte      5
      008B86 3E 43 48 41 52        2200         .ascii     ">CHAR"
      008B8B                       2201 TCHAR:
      008B8B E6 01            [ 1] 2202         ld a,(1,x)
      008B8D A1 20            [ 1] 2203         cp a,#32  
      008B8F 2B 05            [ 1] 2204         jrmi 1$ 
      008B91 A1 7F            [ 1] 2205         cp a,#127 
      008B93 2A 01            [ 1] 2206         jrpl 1$ 
      008B95 81               [ 4] 2207         ret 
      008B96 A6 5F            [ 1] 2208 1$:     ld a,#'_ 
      008B98 E7 01            [ 1] 2209         ld (1,x),a 
      008B9A 81               [ 4] 2210         ret 
                                   2211 
                                   2212 ;       DEPTH   ( -- n )
                                   2213 ;       Return  depth of  data stack.
      008B9B 8B 85                 2214         .word      LINK
                           000B1D  2215 LINK = . 
      008B9D 05                    2216         .byte      5
      008B9E 44 45 50 54 48        2217         .ascii     "DEPTH"
      008BA3                       2218 DEPTH: 
      008BA3 90 BE 2A         [ 2] 2219         LDW Y,SP0    ;save data stack ptr
      008BA6 BF 22            [ 2] 2220 	LDW XTEMP,X
      008BA8 72 B2 00 22      [ 2] 2221         SUBW Y,XTEMP     ;#bytes = SP0 - X
      008BAC 90 57            [ 2] 2222         SRAW Y    ;Y = #stack items
      008BAE 1D 00 02         [ 2] 2223 	SUBW X,#2
      008BB1 FF               [ 2] 2224         LDW (X),Y     ; if neg, underflow
      008BB2 81               [ 4] 2225         RET
                                   2226 
                                   2227 ;       PICK    ( ... +n -- ... w )
                                   2228 ;       Copy  nth stack item to tos.
      008BB3 8B 9D                 2229         .word      LINK
                           000B35  2230 LINK = . 
      008BB5 04                    2231         .byte      4
      008BB6 50 49 43 4B           2232         .ascii     "PICK"
      008BBA                       2233 PICK:
      008BBA 90 93            [ 1] 2234         LDW Y,X   ;D = n1
      008BBC 90 FE            [ 2] 2235         LDW Y,(Y)
                                   2236 ; modified for standard compliance          
                                   2237 ; 0 PICK must be equivalent to DUP 
      008BBE 90 5C            [ 1] 2238         INCW Y 
      008BC0 90 58            [ 2] 2239         SLAW Y
      008BC2 BF 22            [ 2] 2240         LDW XTEMP,X
      008BC4 72 B9 00 22      [ 2] 2241         ADDW Y,XTEMP
      008BC8 90 FE            [ 2] 2242         LDW Y,(Y)
      008BCA FF               [ 2] 2243         LDW (X),Y
      008BCB 81               [ 4] 2244         RET
                                   2245 
                                   2246 ;; Memory access
                                   2247 
                                   2248 ;       +!      ( n a -- )
                                   2249 ;       Add n to  contents at address a.
      008BCC 8B B5                 2250         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



                           000B4E  2251 LINK = . 
      008BCE 02                    2252         .byte      2
      008BCF 2B 21                 2253         .ascii     "+!"
      008BD1                       2254 PSTOR:
      008BD1 90 93            [ 1] 2255         ldw y,x 
      008BD3 90 FE            [ 2] 2256         ldw y,(y)
      008BD5 90 BF 24         [ 2] 2257         ldw YTEMP,y  ; address
      008BD8 90 FE            [ 2] 2258         ldw y,(y)  
      008BDA 90 89            [ 2] 2259         pushw y  ; value at address 
      008BDC 90 93            [ 1] 2260         ldw y,x 
      008BDE 90 EE 02         [ 2] 2261         ldw y,(2,y) ; n 
      008BE1 72 F9 01         [ 2] 2262         addw y,(1,sp) ; n+value
      008BE4 91 CF 24         [ 5] 2263         ldw [YTEMP],y ;  a!
      008BE7 90 85            [ 2] 2264         popw y    ;drop local var
      008BE9 1C 00 04         [ 2] 2265         addw x,#4 ; DDROP 
      008BEC 81               [ 4] 2266         ret 
                                   2267 
                                   2268 ;       2!      ( d a -- )
                                   2269 ;       Store  double integer to address a.
      008BED 8B CE                 2270         .word      LINK
                           000B6F  2271 LINK = . 
      008BEF 02                    2272         .byte      2
      008BF0 32 21                 2273         .ascii     "2!"
      008BF2                       2274 DSTOR:
      008BF2 90 93            [ 1] 2275         ldw y,x 
      008BF4 90 FE            [ 2] 2276         ldw y,(y)
      008BF6 90 BF 24         [ 2] 2277         ldw YTEMP,y ; address 
      008BF9 1C 00 02         [ 2] 2278         addw x,#CELLL ; drop a 
      008BFC 90 93            [ 1] 2279         ldw y,x 
      008BFE 90 FE            [ 2] 2280         ldw y,(y) ; hi word 
      008C00 89               [ 2] 2281         pushw x 
      008C01 EE 02            [ 2] 2282         ldw x,(2,x) ; lo word 
      008C03 91 CF 24         [ 5] 2283         ldw [YTEMP],y
      008C06 90 93            [ 1] 2284         ldw y,x 
      008C08 AE 00 02         [ 2] 2285         ldw x,#2 
      008C0B 92 DF 24         [ 5] 2286         ldw ([YTEMP],x),y 
      008C0E 85               [ 2] 2287         popw x 
      008C0F 1C 00 04         [ 2] 2288         addw x,#4 ; DDROP 
      008C12 81               [ 4] 2289         ret 
                                   2290 
                                   2291 ;       2@      ( a -- d )
                                   2292 ;       Fetch double integer from address a.
      008C13 8B EF                 2293         .word      LINK
                           000B95  2294 LINK = . 
      008C15 02                    2295         .byte      2
      008C16 32 40                 2296         .ascii     "2@"
      008C18                       2297 DAT:
      008C18 90 93            [ 1] 2298         ldw y,x 
      008C1A 90 FE            [ 2] 2299         ldw y,(y) ;address 
      008C1C 90 BF 24         [ 2] 2300         ldw YTEMP,y 
      008C1F 1D 00 02         [ 2] 2301         subw x,#CELLL ; space for udh 
      008C22 91 CE 24         [ 5] 2302         ldw y,[YTEMP] ; udh 
      008C25 FF               [ 2] 2303         ldw (x),y 
      008C26 90 AE 00 02      [ 2] 2304         ldw y,#2
      008C2A 91 DE 24         [ 5] 2305         ldw y,([YTEMP],y) ; udl 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



      008C2D EF 02            [ 2] 2306         ldw (2,x),y
      008C2F 81               [ 4] 2307         ret 
                                   2308 
                                   2309 ;       COUNT   ( b -- b +n )
                                   2310 ;       Return count byte of a string
                                   2311 ;       and add 1 to byte address.
      008C30 8C 15                 2312         .word      LINK
                           000BB2  2313 LINK = . 
      008C32 05                    2314         .byte      5
      008C33 43 4F 55 4E 54        2315         .ascii     "COUNT"
      008C38                       2316 COUNT:
      008C38 90 93            [ 1] 2317         ldw y,x 
      008C3A 90 FE            [ 2] 2318         ldw y,(y) ; address 
      008C3C 90 F6            [ 1] 2319         ld a,(y)  ; count 
      008C3E 90 5C            [ 1] 2320         incw y 
      008C40 FF               [ 2] 2321         ldw (x),y 
      008C41 1D 00 02         [ 2] 2322         subw x,#CELLL 
      008C44 E7 01            [ 1] 2323         ld (1,x),a 
      008C46 7F               [ 1] 2324         clr (x)
      008C47 81               [ 4] 2325         ret 
                                   2326 
                                   2327 ;       HERE    ( -- a )
                                   2328 ;       Return  top of  variables
      008C48 8C 32                 2329         .word      LINK
                           000BCA  2330 LINK = . 
      008C4A 04                    2331         .byte      4
      008C4B 48 45 52 45           2332         .ascii     "HERE"
      008C4F                       2333 HERE:
      008C4F 90 AE 00 16      [ 2] 2334       	ldw y,#UVP 
      008C53 90 FE            [ 2] 2335         ldw y,(y)
      008C55 1D 00 02         [ 2] 2336         subw x,#CELLL 
      008C58 FF               [ 2] 2337         ldw (x),y 
      008C59 81               [ 4] 2338         ret 
                                   2339 
                                   2340 ;       PAD     ( -- a )
                                   2341 ;       Return address of text buffer
                                   2342 ;       above  code dictionary.
      008C5A 8C 4A                 2343         .word      LINK
                           000BDC  2344 LINK = . 
      008C5C 03                    2345         .byte      3
      008C5D 50 41 44              2346         .ascii     "PAD"
      008C60                       2347 PAD:
      008C60 CD 8C 4F         [ 4] 2348         CALL     HERE
      008C63 CD 84 F5         [ 4] 2349         CALL     DOLIT
      008C66 00 50                 2350         .word      80
      008C68 CC 88 15         [ 2] 2351         JP     PLUS
                                   2352 
                                   2353 ;       TIB     ( -- a )
                                   2354 ;       Return address of terminal input buffer.
      008C6B 8C 5C                 2355         .word      LINK
                           000BED  2356 LINK = . 
      008C6D 03                    2357         .byte      3
      008C6E 54 49 42              2358         .ascii     "TIB"
      008C71                       2359 TIB:
      008C71 CD 87 05         [ 4] 2360         CALL     NTIB
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



      008C74 CD 8A CA         [ 4] 2361         CALL     CELLP
      008C77 CC 85 73         [ 2] 2362         JP     AT
                                   2363 
                                   2364 ;       @EXECUTE        ( a -- )
                                   2365 ;       Execute vector stored in address a.
      008C7A 8C 6D                 2366         .word      LINK
                           000BFC  2367 LINK = . 
      008C7C 08                    2368         .byte      8
      008C7D 40 45 58 45 43 55 54  2369         .ascii     "@EXECUTE"
             45
      008C85                       2370 ATEXE:
      008C85 CD 85 73         [ 4] 2371         CALL     AT
      008C88 CD 87 C4         [ 4] 2372         CALL     QDUP    ;?address or zero
      008C8B CD 85 28         [ 4] 2373         CALL     QBRAN
      008C8E 8C 93                 2374         .word      EXE1
      008C90 CD 85 4F         [ 4] 2375         CALL     EXECU   ;execute if non-zero
      008C93 81               [ 4] 2376 EXE1:   RET     ;do nothing if zero
                                   2377 
                                   2378 ;       CMOVE   ( b1 b2 u -- )
                                   2379 ;       Copy u bytes from b1 to b2.
      008C94 8C 7C                 2380         .word      LINK
                           000C16  2381 LINK = . 
      008C96 05                    2382         .byte      5
      008C97 43 4D 4F 56 45        2383         .ascii     "CMOVE"
      008C9C                       2384 CMOVE:
      008C9C CD 85 E3         [ 4] 2385         CALL	TOR
      008C9F CD 85 3F         [ 4] 2386         CALL	BRAN
      008CA2 8C BC                 2387         .word	CMOV2
      008CA4 CD 85 E3         [ 4] 2388 CMOV1:	CALL	TOR
      008CA7 CD 86 1A         [ 4] 2389         CALL	DUPP
      008CAA CD 85 91         [ 4] 2390         CALL	CAT
      008CAD CD 85 D7         [ 4] 2391         CALL	RAT
      008CB0 CD 85 80         [ 4] 2392         CALL	CSTOR
      008CB3 CD 8A F5         [ 4] 2393         CALL	ONEP
      008CB6 CD 85 C4         [ 4] 2394         CALL	RFROM
      008CB9 CD 8A F5         [ 4] 2395         CALL	ONEP
      008CBC CD 85 09         [ 4] 2396 CMOV2:	CALL	DONXT
      008CBF 8C A4                 2397         .word	CMOV1
      008CC1 CC 87 F5         [ 2] 2398         JP	DDROP
                                   2399 
                                   2400 ;       FILL    ( b u c -- )
                                   2401 ;       Fill u bytes of character c
                                   2402 ;       to area beginning at b.
      008CC4 8C 96                 2403         .word       LINK
                           000C46  2404 LINK = . 
      008CC6 04                    2405         .byte       4
      008CC7 46 49 4C 4C           2406         .ascii     "FILL"
      008CCB                       2407 FILL:
      008CCB 90 93            [ 1] 2408         ldw y,x 
      008CCD 90 E6 01         [ 1] 2409         ld a,(1,y) ; c 
      008CD0 1C 00 02         [ 2] 2410         addw x,#CELLL ; drop c 
      008CD3 90 93            [ 1] 2411         ldw y,x 
      008CD5 90 FE            [ 2] 2412         ldw y,(y) ; count
      008CD7 90 89            [ 2] 2413         pushw y 
      008CD9 1C 00 02         [ 2] 2414         addw x,#CELLL ; drop u 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      008CDC 90 93            [ 1] 2415         ldw y,x 
      008CDE 1C 00 02         [ 2] 2416         addw x,#CELLL ; drop b 
      008CE1 90 FE            [ 2] 2417         ldw y,(y) ; address
      008CE3 90 BF 24         [ 2] 2418         ldw YTEMP,y
      008CE6 90 85            [ 2] 2419         popw y ; count 
      008CE8                       2420 FILL1:  
      008CE8 92 C7 24         [ 4] 2421         ld [YTEMP],a 
      008CEB 3C 25            [ 1] 2422         inc YTEMP+1
      008CED 24 02            [ 1] 2423         jrnc FILL2 
      008CEF 3C 24            [ 1] 2424         inc YTEMP
      008CF1                       2425 FILL2: 
      008CF1 90 5A            [ 2] 2426         decw y ; count 
      008CF3 26 F3            [ 1] 2427         jrne FILL1  
      008CF5 81               [ 4] 2428         ret 
                                   2429 
                                   2430 ;       ERASE   ( b u -- )
                                   2431 ;       Erase u bytes beginning at b.
      008CF6 8C C6                 2432         .word      LINK
                           000C78  2433 LINK = . 
      008CF8 05                    2434         .byte      5
      008CF9 45 52 41 53 45        2435         .ascii     "ERASE"
      008CFE                       2436 ERASE:
      008CFE 90 5F            [ 1] 2437         clrw y 
      008D00 1D 00 02         [ 2] 2438         subw x,#CELLL 
      008D03 FF               [ 2] 2439         ldw (x),y 
      008D04 CC 8C CB         [ 2] 2440         jp FILL 
                                   2441 
                                   2442 
                                   2443 ;       PACK0   ( b u a -- a )
                                   2444 ;       Build a counted string with
                                   2445 ;       u characters from b. Null fill.
      008D07 8C F8                 2446         .word      LINK
                           000C89  2447 LINK = . 
      008D09 05                    2448         .byte      5
      008D0A 50 41 43 4B 30        2449         .ascii     "PACK0"
      008D0F                       2450 PACKS:
      008D0F CD 86 1A         [ 4] 2451         CALL     DUPP
      008D12 CD 85 E3         [ 4] 2452         CALL     TOR     ;strings only on cell boundary
      008D15 CD 88 00         [ 4] 2453         CALL     DDUP
      008D18 CD 85 80         [ 4] 2454         CALL     CSTOR
      008D1B CD 8A F5         [ 4] 2455         CALL     ONEP ;save count
      008D1E CD 86 2A         [ 4] 2456         CALL     SWAPP
      008D21 CD 8C 9C         [ 4] 2457         CALL     CMOVE
      008D24 CD 85 C4         [ 4] 2458         CALL     RFROM
      008D27 81               [ 4] 2459         RET
                                   2460 
                                   2461 ;; Numeric output, single precision
                                   2462 
                                   2463 ;       DIGIT   ( u -- c )
                                   2464 ;       Convert digit u to a character.
      008D28 8D 09                 2465         .word      LINK
                           000CAA  2466 LINK = . 
      008D2A 05                    2467         .byte      5
      008D2B 44 49 47 49 54        2468         .ascii     "DIGIT"
      008D30                       2469 DIGIT:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      008D30 CD 84 F5         [ 4] 2470         CALL	DOLIT
      008D33 00 09                 2471         .word	9
      008D35 CD 86 44         [ 4] 2472         CALL	OVER
      008D38 CD 88 F3         [ 4] 2473         CALL	LESS
      008D3B CD 84 F5         [ 4] 2474         CALL	DOLIT
      008D3E 00 07                 2475         .word	7
      008D40 CD 86 66         [ 4] 2476         CALL	ANDD
      008D43 CD 88 15         [ 4] 2477         CALL	PLUS
      008D46 CD 84 F5         [ 4] 2478         CALL	DOLIT
      008D49 00 30                 2479         .word	48	;'0'
      008D4B CC 88 15         [ 2] 2480         JP	PLUS
                                   2481 
                                   2482 ;       EXTRACT ( n base -- n c )
                                   2483 ;       Extract least significant digit from n.
      008D4E 8D 2A                 2484         .word      LINK
                           000CD0  2485 LINK = . 
      008D50 07                    2486         .byte      7
      008D51 45 58 54 52 41 43 54  2487         .ascii     "EXTRACT"
      008D58                       2488 EXTRC:
      008D58 CD 8B 61         [ 4] 2489         CALL     ZERO
      008D5B CD 86 2A         [ 4] 2490         CALL     SWAPP
      008D5E CD 89 6B         [ 4] 2491         CALL     UMMOD
      008D61 CD 86 2A         [ 4] 2492         CALL     SWAPP
      008D64 CC 8D 30         [ 2] 2493         JP     DIGIT
                                   2494 
                                   2495 ;       <#      ( -- )
                                   2496 ;       Initiate  numeric output process.
      008D67 8D 50                 2497         .word      LINK
                           000CE9  2498 LINK = . 
      008D69 02                    2499         .byte      2
      008D6A 3C 23                 2500         .ascii     "<#"
      008D6C                       2501 BDIGS:
      008D6C CD 8C 60         [ 4] 2502         CALL     PAD
      008D6F CD 87 47         [ 4] 2503         CALL     HLD
      008D72 CC 85 5C         [ 2] 2504         JP     STORE
                                   2505 
                                   2506 ;       HOLD    ( c -- )
                                   2507 ;       Insert a character into output string.
      008D75 8D 69                 2508         .word      LINK
                           000CF7  2509 LINK = . 
      008D77 04                    2510         .byte      4
      008D78 48 4F 4C 44           2511         .ascii     "HOLD"
      008D7C                       2512 HOLD:
      008D7C CD 87 47         [ 4] 2513         CALL     HLD
      008D7F CD 85 73         [ 4] 2514         CALL     AT
      008D82 CD 8B 02         [ 4] 2515         CALL     ONEM
      008D85 CD 86 1A         [ 4] 2516         CALL     DUPP
      008D88 CD 87 47         [ 4] 2517         CALL     HLD
      008D8B CD 85 5C         [ 4] 2518         CALL     STORE
      008D8E CC 85 80         [ 2] 2519         JP     CSTOR
                                   2520 
                                   2521 ;       #       ( u -- u )
                                   2522 ;       Extract one digit from u and
                                   2523 ;       append digit to output string.
      008D91 8D 77                 2524         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



                           000D13  2525 LINK = . 
      008D93 01                    2526         .byte      1
      008D94 23                    2527         .ascii     "#"
      008D95                       2528 DIG:
      008D95 CD 86 D7         [ 4] 2529         CALL     BASE
      008D98 CD 85 73         [ 4] 2530         CALL     AT
      008D9B CD 8D 58         [ 4] 2531         CALL     EXTRC
      008D9E CC 8D 7C         [ 2] 2532         JP     HOLD
                                   2533 
                                   2534 ;       #S      ( u -- 0 )
                                   2535 ;       Convert u until all digits
                                   2536 ;       are added to output string.
      008DA1 8D 93                 2537         .word      LINK
                           000D23  2538 LINK = . 
      008DA3 02                    2539         .byte      2
      008DA4 23 53                 2540         .ascii     "#S"
      008DA6                       2541 DIGS:
      008DA6 CD 8D 95         [ 4] 2542 DIGS1:  CALL     DIG
      008DA9 CD 86 1A         [ 4] 2543         CALL     DUPP
      008DAC CD 85 28         [ 4] 2544         CALL     QBRAN
      008DAF 8D B3                 2545         .word      DIGS2
      008DB1 20 F3            [ 2] 2546         JRA     DIGS1
      008DB3 81               [ 4] 2547 DIGS2:  RET
                                   2548 
                                   2549 ;       SIGN    ( n -- )
                                   2550 ;       Add a minus sign to
                                   2551 ;       numeric output string.
      008DB4 8D A3                 2552         .word      LINK
                           000D36  2553 LINK = . 
      008DB6 04                    2554         .byte      4
      008DB7 53 49 47 4E           2555         .ascii     "SIGN"
      008DBB                       2556 SIGN:
      008DBB CD 86 53         [ 4] 2557         CALL     ZLESS
      008DBE CD 85 28         [ 4] 2558         CALL     QBRAN
      008DC1 8D CB                 2559         .word      SIGN1
      008DC3 CD 84 F5         [ 4] 2560         CALL     DOLIT
      008DC6 00 2D                 2561         .word      45	;"-"
      008DC8 CC 8D 7C         [ 2] 2562         JP     HOLD
      008DCB 81               [ 4] 2563 SIGN1:  RET
                                   2564 
                                   2565 ;       #>      ( w -- b u )
                                   2566 ;       Prepare output string.
      008DCC 8D B6                 2567         .word      LINK
                           000D4E  2568 LINK = . 
      008DCE 02                    2569         .byte      2
      008DCF 23 3E                 2570         .ascii     "#>"
      008DD1                       2571 EDIGS:
      008DD1 CD 86 10         [ 4] 2572         CALL     DROP
      008DD4 CD 87 47         [ 4] 2573         CALL     HLD
      008DD7 CD 85 73         [ 4] 2574         CALL     AT
      008DDA CD 8C 60         [ 4] 2575         CALL     PAD
      008DDD CD 86 44         [ 4] 2576         CALL     OVER
      008DE0 CC 88 8E         [ 2] 2577         JP     SUBB
                                   2578 
                                   2579 ;       str     ( w -- b u )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



                                   2580 ;       Convert a signed integer
                                   2581 ;       to a numeric string.
      008DE3 8D CE                 2582         .word      LINK
                           000D65  2583 LINK = . 
      008DE5 03                    2584         .byte      3
      008DE6 53 54 52              2585         .ascii     "STR"
      008DE9                       2586 STR:
      008DE9 CD 86 1A         [ 4] 2587         CALL     DUPP
      008DEC CD 85 E3         [ 4] 2588         CALL     TOR
      008DEF CD 88 A8         [ 4] 2589         CALL     ABSS
      008DF2 CD 8D 6C         [ 4] 2590         CALL     BDIGS
      008DF5 CD 8D A6         [ 4] 2591         CALL     DIGS
      008DF8 CD 85 C4         [ 4] 2592         CALL     RFROM
      008DFB CD 8D BB         [ 4] 2593         CALL     SIGN
      008DFE CC 8D D1         [ 2] 2594         JP     EDIGS
                                   2595 
                                   2596 ;       HEX     ( -- )
                                   2597 ;       Use radix 16 as base for
                                   2598 ;       numeric conversions.
      008E01 8D E5                 2599         .word      LINK
                           000D83  2600 LINK = . 
      008E03 03                    2601         .byte      3
      008E04 48 45 58              2602         .ascii     "HEX"
      008E07                       2603 HEX:
      008E07 CD 84 F5         [ 4] 2604         CALL     DOLIT
      008E0A 00 10                 2605         .word      16
      008E0C CD 86 D7         [ 4] 2606         CALL     BASE
      008E0F CC 85 5C         [ 2] 2607         JP     STORE
                                   2608 
                                   2609 ;       DECIMAL ( -- )
                                   2610 ;       Use radix 10 as base
                                   2611 ;       for numeric conversions.
      008E12 8E 03                 2612         .word      LINK
                           000D94  2613 LINK = . 
      008E14 07                    2614         .byte      7
      008E15 44 45 43 49 4D 41 4C  2615         .ascii     "DECIMAL"
      008E1C                       2616 DECIM:
      008E1C CD 84 F5         [ 4] 2617         CALL     DOLIT
      008E1F 00 0A                 2618         .word      10
      008E21 CD 86 D7         [ 4] 2619         CALL     BASE
      008E24 CC 85 5C         [ 2] 2620         JP     STORE
                                   2621 
                                   2622 ;; Numeric input, single precision
                                   2623 
                                   2624 ;       DIGIT?  ( c base -- u t )
                                   2625 ;       Convert a character to its numeric
                                   2626 ;       value. A flag indicates success.
      008E27 8E 14                 2627         .word      LINK
                           000DA9  2628 LINK = . 
      008E29 06                    2629         .byte       6
      008E2A 44 49 47 49 54 3F     2630         .ascii     "DIGIT?"
      008E30                       2631 DIGTQ:
      008E30 CD 85 E3         [ 4] 2632         CALL     TOR
      008E33 CD 84 F5         [ 4] 2633         CALL     DOLIT
      008E36 00 30                 2634         .word     48	; "0"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



      008E38 CD 88 8E         [ 4] 2635         CALL     SUBB
      008E3B CD 84 F5         [ 4] 2636         CALL     DOLIT
      008E3E 00 09                 2637         .word      9
      008E40 CD 86 44         [ 4] 2638         CALL     OVER
      008E43 CD 88 F3         [ 4] 2639         CALL     LESS
      008E46 CD 85 28         [ 4] 2640         CALL     QBRAN
      008E49 8E 61                 2641         .word      DGTQ1
      008E4B CD 84 F5         [ 4] 2642         CALL     DOLIT
      008E4E 00 07                 2643         .word      7
      008E50 CD 88 8E         [ 4] 2644         CALL     SUBB
      008E53 CD 86 1A         [ 4] 2645         CALL     DUPP
      008E56 CD 84 F5         [ 4] 2646         CALL     DOLIT
      008E59 00 0A                 2647         .word      10
      008E5B CD 88 F3         [ 4] 2648         CALL     LESS
      008E5E CD 86 7A         [ 4] 2649         CALL     ORR
      008E61 CD 86 1A         [ 4] 2650 DGTQ1:  CALL     DUPP
      008E64 CD 85 C4         [ 4] 2651         CALL     RFROM
      008E67 CC 88 D5         [ 2] 2652         JP     ULESS
                                   2653 
                                   2654 ;       NUMBER? ( a -- n T | a F )
                                   2655 ;       Convert a number string to
                                   2656 ;       integer. Push a flag on tos.
      008E6A 8E 29                 2657         .word      LINK
                           000DEC  2658 LINK = . 
      008E6C 07                    2659         .byte      7
      008E6D 4E 55 4D 42 45 52 3F  2660         .ascii     "NUMBER?"
      008E74                       2661 NUMBQ:
      008E74 CD 86 D7         [ 4] 2662         CALL     BASE
      008E77 CD 85 73         [ 4] 2663         CALL     AT
      008E7A CD 85 E3         [ 4] 2664         CALL     TOR
      008E7D CD 8B 61         [ 4] 2665         CALL     ZERO
      008E80 CD 86 44         [ 4] 2666         CALL     OVER
      008E83 CD 8C 38         [ 4] 2667         CALL     COUNT
      008E86 CD 86 44         [ 4] 2668         CALL     OVER
      008E89 CD 85 91         [ 4] 2669         CALL     CAT
      008E8C CD 84 F5         [ 4] 2670         CALL     DOLIT
      008E8F 00 24                 2671         .word     36	; "0x"
      008E91 CD 88 B6         [ 4] 2672         CALL     EQUAL
      008E94 CD 85 28         [ 4] 2673         CALL     QBRAN
      008E97 8E A8                 2674         .word      NUMQ1
      008E99 CD 8E 07         [ 4] 2675         CALL     HEX
      008E9C CD 86 2A         [ 4] 2676         CALL     SWAPP
      008E9F CD 8A F5         [ 4] 2677         CALL     ONEP
      008EA2 CD 86 2A         [ 4] 2678         CALL     SWAPP
      008EA5 CD 8B 02         [ 4] 2679         CALL     ONEM
      008EA8 CD 86 44         [ 4] 2680 NUMQ1:  CALL     OVER
      008EAB CD 85 91         [ 4] 2681         CALL     CAT
      008EAE CD 84 F5         [ 4] 2682         CALL     DOLIT
      008EB1 00 2D                 2683         .word     45	; "-"
      008EB3 CD 88 B6         [ 4] 2684         CALL     EQUAL
      008EB6 CD 85 E3         [ 4] 2685         CALL     TOR
      008EB9 CD 86 2A         [ 4] 2686         CALL     SWAPP
      008EBC CD 85 D7         [ 4] 2687         CALL     RAT
      008EBF CD 88 8E         [ 4] 2688         CALL     SUBB
      008EC2 CD 86 2A         [ 4] 2689         CALL     SWAPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



      008EC5 CD 85 D7         [ 4] 2690         CALL     RAT
      008EC8 CD 88 15         [ 4] 2691         CALL     PLUS
      008ECB CD 87 C4         [ 4] 2692         CALL     QDUP
      008ECE CD 85 28         [ 4] 2693         CALL     QBRAN
      008ED1 8F 32                 2694         .word      NUMQ6
      008ED3 CD 8B 02         [ 4] 2695         CALL     ONEM
      008ED6 CD 85 E3         [ 4] 2696         CALL     TOR
      008ED9 CD 86 1A         [ 4] 2697 NUMQ2:  CALL     DUPP
      008EDC CD 85 E3         [ 4] 2698         CALL     TOR
      008EDF CD 85 91         [ 4] 2699         CALL     CAT
      008EE2 CD 86 D7         [ 4] 2700         CALL     BASE
      008EE5 CD 85 73         [ 4] 2701         CALL     AT
      008EE8 CD 8E 30         [ 4] 2702         CALL     DIGTQ
      008EEB CD 85 28         [ 4] 2703         CALL     QBRAN
      008EEE 8F 20                 2704         .word      NUMQ4
      008EF0 CD 86 2A         [ 4] 2705         CALL     SWAPP
      008EF3 CD 86 D7         [ 4] 2706         CALL     BASE
      008EF6 CD 85 73         [ 4] 2707         CALL     AT
      008EF9 CD 8A 74         [ 4] 2708         CALL     STAR
      008EFC CD 88 15         [ 4] 2709         CALL     PLUS
      008EFF CD 85 C4         [ 4] 2710         CALL     RFROM
      008F02 CD 8A F5         [ 4] 2711         CALL     ONEP
      008F05 CD 85 09         [ 4] 2712         CALL     DONXT
      008F08 8E D9                 2713         .word      NUMQ2
      008F0A CD 85 D7         [ 4] 2714         CALL     RAT
      008F0D CD 86 2A         [ 4] 2715         CALL     SWAPP
      008F10 CD 86 10         [ 4] 2716         CALL     DROP
      008F13 CD 85 28         [ 4] 2717         CALL     QBRAN
      008F16 8F 1B                 2718         .word      NUMQ3
      008F18 CD 88 40         [ 4] 2719         CALL     NEGAT
      008F1B CD 86 2A         [ 4] 2720 NUMQ3:  CALL     SWAPP
      008F1E 20 0F            [ 2] 2721         JRA     NUMQ5
      008F20 CD 85 C4         [ 4] 2722 NUMQ4:  CALL     RFROM
      008F23 CD 85 C4         [ 4] 2723         CALL     RFROM
      008F26 CD 87 F5         [ 4] 2724         CALL     DDROP
      008F29 CD 87 F5         [ 4] 2725         CALL     DDROP
      008F2C CD 8B 61         [ 4] 2726         CALL     ZERO
      008F2F CD 86 1A         [ 4] 2727 NUMQ5:  CALL     DUPP
      008F32 CD 85 C4         [ 4] 2728 NUMQ6:  CALL     RFROM
      008F35 CD 87 F5         [ 4] 2729         CALL     DDROP
      008F38 CD 85 C4         [ 4] 2730         CALL     RFROM
      008F3B CD 86 D7         [ 4] 2731         CALL     BASE
      008F3E CC 85 5C         [ 2] 2732         JP     STORE
                                   2733 
                                   2734 ;; Basic I/O
                                   2735 
                                   2736 ;       KEY     ( -- c )
                                   2737 ;       Wait for and return an
                                   2738 ;       input character.
      008F41 8E 6C                 2739         .word      LINK
                           000EC3  2740 LINK = . 
      008F43 03                    2741         .byte      3
      008F44 4B 45 59              2742         .ascii     "KEY"
      008F47                       2743 KEY:
      008F47 72 0B 52 30 FB   [ 2] 2744         btjf UART_SR,#UART_SR_RXNE,. 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



      008F4C C6 52 31         [ 1] 2745         ld a,UART_DR 
      008F4F 1D 00 02         [ 2] 2746         subw x,#CELLL 
      008F52 E7 01            [ 1] 2747         ld (1,x),a 
      008F54 7F               [ 1] 2748         clr (x)
      008F55 81               [ 4] 2749         ret 
                                   2750 
                                   2751 ;       NUF?    ( -- t )
                                   2752 ;       Return false if no input,
                                   2753 ;       else pause and if CR return true.
      008F56 8F 43                 2754         .word      LINK
                           000ED8  2755 LINK = . 
      008F58 04                    2756         .byte      4
      008F59 4E 55 46 3F           2757         .ascii     "NUF?"
      008F5D                       2758 NUFQ:
      008F5D CD 84 96         [ 4] 2759         CALL     QKEY
      008F60 CD 86 1A         [ 4] 2760         CALL     DUPP
      008F63 CD 85 28         [ 4] 2761         CALL     QBRAN
      008F66 8F 76                 2762         .word    NUFQ1
      008F68 CD 87 F5         [ 4] 2763         CALL     DDROP
      008F6B CD 8F 47         [ 4] 2764         CALL     KEY
      008F6E CD 84 F5         [ 4] 2765         CALL     DOLIT
      008F71 00 0D                 2766         .word      CRR
      008F73 CC 88 B6         [ 2] 2767         JP     EQUAL
      008F76 81               [ 4] 2768 NUFQ1:  RET
                                   2769 
                                   2770 ;       SPACE   ( -- )
                                   2771 ;       Send  blank character to
                                   2772 ;       output device.
      008F77 8F 58                 2773         .word      LINK
                           000EF9  2774 LINK = . 
      008F79 05                    2775         .byte      5
      008F7A 53 50 41 43 45        2776         .ascii     "SPACE"
      008F7F                       2777 SPACE:
      008F7F CD 8B 54         [ 4] 2778         CALL     BLANK
      008F82 CC 84 B4         [ 2] 2779         JP     EMIT
                                   2780 
                                   2781 ;       SPACES  ( +n -- )
                                   2782 ;       Send n spaces to output device.
      008F85 8F 79                 2783         .word      LINK
                           000F07  2784 LINK = . 
      008F87 06                    2785         .byte      6
      008F88 53 50 41 43 45 53     2786         .ascii     "SPACES"
      008F8E                       2787 SPACS:
      008F8E CD 8B 61         [ 4] 2788         CALL     ZERO
      008F91 CD 89 13         [ 4] 2789         CALL     MAX
      008F94 CD 85 E3         [ 4] 2790         CALL     TOR
      008F97 20 03            [ 2] 2791         JRA      CHAR2
      008F99 CD 8F 7F         [ 4] 2792 CHAR1:  CALL     SPACE
      008F9C CD 85 09         [ 4] 2793 CHAR2:  CALL     DONXT
      008F9F 8F 99                 2794         .word    CHAR1
      008FA1 81               [ 4] 2795         RET
                                   2796 
                                   2797 ;       TYPE    ( b u -- )
                                   2798 ;       Output u characters from b.
      008FA2 8F 87                 2799         .word      LINK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



                           000F24  2800 LINK = . 
      008FA4 04                    2801         .byte      4
      008FA5 54 59 50 45           2802         .ascii     "TYPE"
      008FA9                       2803 TYPES:
      008FA9 CD 85 E3         [ 4] 2804         CALL     TOR
      008FAC 20 0C            [ 2] 2805         JRA     TYPE2
      008FAE CD 86 1A         [ 4] 2806 TYPE1:  CALL     DUPP
      008FB1 CD 85 91         [ 4] 2807         CALL     CAT
      008FB4 CD 84 B4         [ 4] 2808         CALL     EMIT
      008FB7 CD 8A F5         [ 4] 2809         CALL     ONEP
      008FBA CD 85 09         [ 4] 2810 TYPE2:  CALL     DONXT
      008FBD 8F AE                 2811         .word      TYPE1
      008FBF CC 86 10         [ 2] 2812         JP     DROP
                                   2813 
                                   2814 ;       CR      ( -- )
                                   2815 ;       Output a carriage return
                                   2816 ;       and a line feed.
      008FC2 8F A4                 2817         .word      LINK
                           000F44  2818 LINK = . 
      008FC4 02                    2819         .byte      2
      008FC5 43 52                 2820         .ascii     "CR"
      008FC7                       2821 CR:
      008FC7 CD 84 F5         [ 4] 2822         CALL     DOLIT
      008FCA 00 0D                 2823         .word      CRR
      008FCC CD 84 B4         [ 4] 2824         CALL     EMIT
      008FCF CD 84 F5         [ 4] 2825         CALL     DOLIT
      008FD2 00 0A                 2826         .word      LF
      008FD4 CC 84 B4         [ 2] 2827         JP     EMIT
                                   2828 
                                   2829 ;       do$     ( -- a )
                                   2830 ;       Return  address of a compiled
                                   2831 ;       string.
      008FD7 8F C4                 2832         .word      LINK
                           000F59  2833 LINK = . 
      008FD9 43                    2834 	.byte      COMPO+3
      008FDA 44 4F 24              2835         .ascii     "DO$"
      008FDD                       2836 DOSTR:
      008FDD CD 85 C4         [ 4] 2837         CALL     RFROM
      008FE0 CD 85 D7         [ 4] 2838         CALL     RAT
      008FE3 CD 85 C4         [ 4] 2839         CALL     RFROM
      008FE6 CD 8C 38         [ 4] 2840         CALL     COUNT
      008FE9 CD 88 15         [ 4] 2841         CALL     PLUS
      008FEC CD 85 E3         [ 4] 2842         CALL     TOR
      008FEF CD 86 2A         [ 4] 2843         CALL     SWAPP
      008FF2 CD 85 E3         [ 4] 2844         CALL     TOR
      008FF5 81               [ 4] 2845         RET
                                   2846 
                                   2847 ;       $"|     ( -- a )
                                   2848 ;       Run time routine compiled by $".
                                   2849 ;       Return address of a compiled string.
      008FF6 8F D9                 2850         .word      LINK
                           000F78  2851 LINK = . 
      008FF8 43                    2852 	.byte      COMPO+3
      008FF9 24 22 7C              2853         .byte     '$','"','|'
      008FFC                       2854 STRQP:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



      008FFC CD 8F DD         [ 4] 2855         CALL     DOSTR
      008FFF 81               [ 4] 2856         RET
                                   2857 
                                   2858 ;       ."|     ( -- )
                                   2859 ;       Run time routine of ." .
                                   2860 ;       Output a compiled string.
      009000 8F F8                 2861         .word      LINK
                           000F82  2862 LINK = . 
      009002 43                    2863 	.byte      COMPO+3
      009003 2E 22 7C              2864         .byte     '.','"','|'
      009006                       2865 DOTQP:
      009006 CD 8F DD         [ 4] 2866         CALL     DOSTR
      009009 CD 8C 38         [ 4] 2867         CALL     COUNT
      00900C CC 8F A9         [ 2] 2868         JP     TYPES
                                   2869 
                                   2870 ;       .R      ( n +n -- )
                                   2871 ;       Display an integer in a field
                                   2872 ;       of n columns, right justified.
      00900F 90 02                 2873         .word      LINK
                           000F91  2874 LINK = . 
      009011 02                    2875         .byte      2
      009012 2E 52                 2876         .ascii     ".R"
      009014                       2877 DOTR:
      009014 CD 85 E3         [ 4] 2878         CALL     TOR
      009017 CD 8D E9         [ 4] 2879         CALL     STR
      00901A CD 85 C4         [ 4] 2880         CALL     RFROM
      00901D CD 86 44         [ 4] 2881         CALL     OVER
      009020 CD 88 8E         [ 4] 2882         CALL     SUBB
      009023 CD 8F 8E         [ 4] 2883         CALL     SPACS
      009026 CC 8F A9         [ 2] 2884         JP     TYPES
                                   2885 
                                   2886 ;       U.R     ( u +n -- )
                                   2887 ;       Display an unsigned integer
                                   2888 ;       in n column, right justified.
      009029 90 11                 2889         .word      LINK
                           000FAB  2890 LINK = . 
      00902B 03                    2891         .byte      3
      00902C 55 2E 52              2892         .ascii     "U.R"
      00902F                       2893 UDOTR:
      00902F CD 85 E3         [ 4] 2894         CALL     TOR
      009032 CD 8D 6C         [ 4] 2895         CALL     BDIGS
      009035 CD 8D A6         [ 4] 2896         CALL     DIGS
      009038 CD 8D D1         [ 4] 2897         CALL     EDIGS
      00903B CD 85 C4         [ 4] 2898         CALL     RFROM
      00903E CD 86 44         [ 4] 2899         CALL     OVER
      009041 CD 88 8E         [ 4] 2900         CALL     SUBB
      009044 CD 8F 8E         [ 4] 2901         CALL     SPACS
      009047 CC 8F A9         [ 2] 2902         JP     TYPES
                                   2903 
                                   2904 ;       U.      ( u -- )
                                   2905 ;       Display an unsigned integer
                                   2906 ;       in free format.
      00904A 90 2B                 2907         .word      LINK
                           000FCC  2908 LINK = . 
      00904C 02                    2909         .byte      2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      00904D 55 2E                 2910         .ascii     "U."
      00904F                       2911 UDOT:
      00904F CD 8D 6C         [ 4] 2912         CALL     BDIGS
      009052 CD 8D A6         [ 4] 2913         CALL     DIGS
      009055 CD 8D D1         [ 4] 2914         CALL     EDIGS
      009058 CD 8F 7F         [ 4] 2915         CALL     SPACE
      00905B CC 8F A9         [ 2] 2916         JP     TYPES
                                   2917 
                                   2918 ;       .       ( w -- )
                                   2919 ;       Display an integer in free
                                   2920 ;       format, preceeded by a space.
      00905E 90 4C                 2921         .word      LINK
                           000FE0  2922 LINK = . 
      009060 01                    2923         .byte      1
      009061 2E                    2924         .ascii     "."
      009062                       2925 DOT:
      009062 CD 86 D7         [ 4] 2926         CALL     BASE
      009065 CD 85 73         [ 4] 2927         CALL     AT
      009068 CD 84 F5         [ 4] 2928         CALL     DOLIT
      00906B 00 0A                 2929         .word      10
      00906D CD 86 8F         [ 4] 2930         CALL     XORR    ;?decimal
      009070 CD 85 28         [ 4] 2931         CALL     QBRAN
      009073 90 78                 2932         .word      DOT1
      009075 CC 90 4F         [ 2] 2933         JP     UDOT
      009078 CD 8D E9         [ 4] 2934 DOT1:   CALL     STR
      00907B CD 8F 7F         [ 4] 2935         CALL     SPACE
      00907E CC 8F A9         [ 2] 2936         JP     TYPES
                                   2937 
                                   2938 ;       ?       ( a -- )
                                   2939 ;       Display contents in memory cell.
      009081 90 60                 2940         .word      LINK
                                   2941         
                           001003  2942 LINK = . 
      009083 01                    2943         .byte      1
      009084 3F                    2944         .ascii     "?"
      009085                       2945 QUEST:
      009085 CD 85 73         [ 4] 2946         CALL     AT
      009088 CC 90 62         [ 2] 2947         JP     DOT
                                   2948 
                                   2949 ;; Parsing
                                   2950 
                                   2951 ;       parse   ( b u c -- b u delta ; <string> )
                                   2952 ;       Scan string delimited by c.
                                   2953 ;       Return found string and its offset.
      00908B 90 83                 2954         .word      LINK
                           00100D  2955 LINK = . 
      00908D 05                    2956         .byte      5
      00908E 70 61 72 73 65        2957         .ascii     "parse"
      009093                       2958 PARS:
      009093 CD 86 E6         [ 4] 2959         CALL     TEMP
      009096 CD 85 5C         [ 4] 2960         CALL     STORE
      009099 CD 86 44         [ 4] 2961         CALL     OVER
      00909C CD 85 E3         [ 4] 2962         CALL     TOR
      00909F CD 86 1A         [ 4] 2963         CALL     DUPP
      0090A2 CD 85 28         [ 4] 2964         CALL     QBRAN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      0090A5 91 4B                 2965         .word    PARS8
      0090A7 CD 8B 02         [ 4] 2966         CALL     ONEM
      0090AA CD 86 E6         [ 4] 2967         CALL     TEMP
      0090AD CD 85 73         [ 4] 2968         CALL     AT
      0090B0 CD 8B 54         [ 4] 2969         CALL     BLANK
      0090B3 CD 88 B6         [ 4] 2970         CALL     EQUAL
      0090B6 CD 85 28         [ 4] 2971         CALL     QBRAN
      0090B9 90 EC                 2972         .word      PARS3
      0090BB CD 85 E3         [ 4] 2973         CALL     TOR
      0090BE CD 8B 54         [ 4] 2974 PARS1:  CALL     BLANK
      0090C1 CD 86 44         [ 4] 2975         CALL     OVER
      0090C4 CD 85 91         [ 4] 2976         CALL     CAT     ;skip leading blanks ONLY
      0090C7 CD 88 8E         [ 4] 2977         CALL     SUBB
      0090CA CD 86 53         [ 4] 2978         CALL     ZLESS
      0090CD CD 88 2F         [ 4] 2979         CALL     INVER
      0090D0 CD 85 28         [ 4] 2980         CALL     QBRAN
      0090D3 90 E9                 2981         .word      PARS2
      0090D5 CD 8A F5         [ 4] 2982         CALL     ONEP
      0090D8 CD 85 09         [ 4] 2983         CALL     DONXT
      0090DB 90 BE                 2984         .word      PARS1
      0090DD CD 85 C4         [ 4] 2985         CALL     RFROM
      0090E0 CD 86 10         [ 4] 2986         CALL     DROP
      0090E3 CD 8B 61         [ 4] 2987         CALL     ZERO
      0090E6 CC 86 1A         [ 2] 2988         JP     DUPP
      0090E9 CD 85 C4         [ 4] 2989 PARS2:  CALL     RFROM
      0090EC CD 86 44         [ 4] 2990 PARS3:  CALL     OVER
      0090EF CD 86 2A         [ 4] 2991         CALL     SWAPP
      0090F2 CD 85 E3         [ 4] 2992         CALL     TOR
      0090F5 CD 86 E6         [ 4] 2993 PARS4:  CALL     TEMP
      0090F8 CD 85 73         [ 4] 2994         CALL     AT
      0090FB CD 86 44         [ 4] 2995         CALL     OVER
      0090FE CD 85 91         [ 4] 2996         CALL     CAT
      009101 CD 88 8E         [ 4] 2997         CALL     SUBB    ;scan for delimiter
      009104 CD 86 E6         [ 4] 2998         CALL     TEMP
      009107 CD 85 73         [ 4] 2999         CALL     AT
      00910A CD 8B 54         [ 4] 3000         CALL     BLANK
      00910D CD 88 B6         [ 4] 3001         CALL     EQUAL
      009110 CD 85 28         [ 4] 3002         CALL     QBRAN
      009113 91 18                 3003         .word      PARS5
      009115 CD 86 53         [ 4] 3004         CALL     ZLESS
      009118 CD 85 28         [ 4] 3005 PARS5:  CALL     QBRAN
      00911B 91 2D                 3006         .word      PARS6
      00911D CD 8A F5         [ 4] 3007         CALL     ONEP
      009120 CD 85 09         [ 4] 3008         CALL     DONXT
      009123 90 F5                 3009         .word      PARS4
      009125 CD 86 1A         [ 4] 3010         CALL     DUPP
      009128 CD 85 E3         [ 4] 3011         CALL     TOR
      00912B 20 0F            [ 2] 3012         JRA     PARS7
      00912D CD 85 C4         [ 4] 3013 PARS6:  CALL     RFROM
      009130 CD 86 10         [ 4] 3014         CALL     DROP
      009133 CD 86 1A         [ 4] 3015         CALL     DUPP
      009136 CD 8A F5         [ 4] 3016         CALL     ONEP
      009139 CD 85 E3         [ 4] 3017         CALL     TOR
      00913C CD 86 44         [ 4] 3018 PARS7:  CALL     OVER
      00913F CD 88 8E         [ 4] 3019         CALL     SUBB
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      009142 CD 85 C4         [ 4] 3020         CALL     RFROM
      009145 CD 85 C4         [ 4] 3021         CALL     RFROM
      009148 CC 88 8E         [ 2] 3022         JP     SUBB
      00914B CD 86 44         [ 4] 3023 PARS8:  CALL     OVER
      00914E CD 85 C4         [ 4] 3024         CALL     RFROM
      009151 CC 88 8E         [ 2] 3025         JP     SUBB
                                   3026 
                                   3027 ;       PARSE   ( c -- b u ; <string> )
                                   3028 ;       Scan input stream and return
                                   3029 ;       counted string delimited by c.
      009154 90 8D                 3030         .word      LINK
                           0010D6  3031 LINK = . 
      009156 05                    3032         .byte      5
      009157 50 41 52 53 45        3033         .ascii     "PARSE"
      00915C                       3034 PARSE:
      00915C CD 85 E3         [ 4] 3035         CALL     TOR
      00915F CD 8C 71         [ 4] 3036         CALL     TIB
      009162 CD 86 F5         [ 4] 3037         CALL     INN
      009165 CD 85 73         [ 4] 3038         CALL     AT
      009168 CD 88 15         [ 4] 3039         CALL     PLUS    ;current input buffer pointer
      00916B CD 87 05         [ 4] 3040         CALL     NTIB
      00916E CD 85 73         [ 4] 3041         CALL     AT
      009171 CD 86 F5         [ 4] 3042         CALL     INN
      009174 CD 85 73         [ 4] 3043         CALL     AT
      009177 CD 88 8E         [ 4] 3044         CALL     SUBB    ;remaining count
      00917A CD 85 C4         [ 4] 3045         CALL     RFROM
      00917D CD 90 93         [ 4] 3046         CALL     PARS
      009180 CD 86 F5         [ 4] 3047         CALL     INN
      009183 CC 8B D1         [ 2] 3048         JP     PSTOR
                                   3049 
                                   3050 ;       .(      ( -- )
                                   3051 ;       Output following string up to next ) .
      009186 91 56                 3052         .word      LINK
                           001108  3053 LINK = . 
      009188 82                    3054 	.byte      IMEDD+2
      009189 2E 28                 3055         .ascii     ".("
      00918B                       3056 DOTPR:
      00918B CD 84 F5         [ 4] 3057         CALL     DOLIT
      00918E 00 29                 3058         .word     41	; ")"
      009190 CD 91 5C         [ 4] 3059         CALL     PARSE
      009193 CC 8F A9         [ 2] 3060         JP     TYPES
                                   3061 
                                   3062 ;       (       ( -- )
                                   3063 ;       Ignore following string up to next ).
                                   3064 ;       A comment.
      009196 91 88                 3065         .word      LINK
                           001118  3066 LINK = . 
      009198 81                    3067 	.byte      IMEDD+1
      009199 28                    3068         .ascii     "("
      00919A                       3069 PAREN:
      00919A CD 84 F5         [ 4] 3070         CALL     DOLIT
      00919D 00 29                 3071         .word     41	; ")"
      00919F CD 91 5C         [ 4] 3072         CALL     PARSE
      0091A2 CC 87 F5         [ 2] 3073         JP     DDROP
                                   3074 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



                                   3075 ;       \       ( -- )
                                   3076 ;       Ignore following text till
                                   3077 ;       end of line.
      0091A5 91 98                 3078         .word      LINK
                           001127  3079 LINK = . 
      0091A7 81                    3080 	.byte      IMEDD+1
      0091A8 5C                    3081         .ascii     "\"
      0091A9                       3082 BKSLA:
      0091A9 90 AE 00 0C      [ 2] 3083         ldw y,#UCTIB ; #TIB  
      0091AD 90 FE            [ 2] 3084         ldw y,(y)
      0091AF 90 89            [ 2] 3085         pushw y ; count in TIB 
      0091B1 90 AE 00 0A      [ 2] 3086         ldw y,#UINN ; >IN 
      0091B5 90 BF 24         [ 2] 3087         ldw YTEMP,y
      0091B8 90 85            [ 2] 3088         popw y 
      0091BA 91 CF 24         [ 5] 3089         ldw [YTEMP],y
      0091BD 81               [ 4] 3090         ret 
                                   3091 
                                   3092 ;       WORD    ( c -- a ; <string> )
                                   3093 ;       Parse a word from input stream
                                   3094 ;       and copy it to code dictionary.
      0091BE 91 A7                 3095         .word      LINK
                           001140  3096 LINK = . 
      0091C0 04                    3097         .byte      4
      0091C1 57 4F 52 44           3098         .ascii     "WORD"
      0091C5                       3099 WORDD:
      0091C5 CD 91 5C         [ 4] 3100         CALL     PARSE
      0091C8 CD 8C 4F         [ 4] 3101         CALL     HERE
      0091CB CD 8A CA         [ 4] 3102         CALL     CELLP
      0091CE CC 8D 0F         [ 2] 3103         JP     PACKS
                                   3104 
                                   3105 ;       TOKEN   ( -- a ; <string> )
                                   3106 ;       Parse a word from input stream
                                   3107 ;       and copy it to name dictionary.
      0091D1 91 C0                 3108         .word      LINK
                           001153  3109 LINK = . 
      0091D3 05                    3110         .byte      5
      0091D4 54 4F 4B 45 4E        3111         .ascii     "TOKEN"
      0091D9                       3112 TOKEN:
      0091D9 CD 8B 54         [ 4] 3113         CALL     BLANK
      0091DC CC 91 C5         [ 2] 3114         JP     WORDD
                                   3115 
                                   3116 ;; Dictionary search
                                   3117 
                                   3118 ;       NAME>   ( na -- ca )
                                   3119 ;       Return a code address given
                                   3120 ;       a name address.
      0091DF 91 D3                 3121         .word      LINK
                           001161  3122 LINK = . 
      0091E1 05                    3123         .byte      5
      0091E2 4E 41 4D 45 3E        3124         .ascii     "NAME>"
      0091E7                       3125 NAMET:
      0091E7 CD 8C 38         [ 4] 3126         CALL     COUNT
      0091EA CD 84 F5         [ 4] 3127         CALL     DOLIT
      0091ED 00 1F                 3128         .word      31
      0091EF CD 86 66         [ 4] 3129         CALL     ANDD
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      0091F2 CC 88 15         [ 2] 3130         JP     PLUS
                                   3131 
                                   3132 ;       SAME?   ( a a u -- a a f \ -0+ )
                                   3133 ;       Compare u cells in two
                                   3134 ;       strings. Return 0 if identical.
      0091F5 91 E1                 3135         .word      LINK
                           001177  3136 LINK = . 
      0091F7 05                    3137         .byte       5
      0091F8 53 41 4D 45 3F        3138         .ascii     "SAME?"
      0091FD                       3139 SAMEQ:
      0091FD CD 8B 02         [ 4] 3140         CALL     ONEM
      009200 CD 85 E3         [ 4] 3141         CALL     TOR
      009203 20 29            [ 2] 3142         JRA     SAME2
      009205 CD 86 44         [ 4] 3143 SAME1:  CALL     OVER
      009208 CD 85 D7         [ 4] 3144         CALL     RAT
      00920B CD 88 15         [ 4] 3145         CALL     PLUS
      00920E CD 85 91         [ 4] 3146         CALL     CAT
      009211 CD 86 44         [ 4] 3147         CALL     OVER
      009214 CD 85 D7         [ 4] 3148         CALL     RAT
      009217 CD 88 15         [ 4] 3149         CALL     PLUS
      00921A CD 85 91         [ 4] 3150         CALL     CAT
      00921D CD 88 8E         [ 4] 3151         CALL     SUBB
      009220 CD 87 C4         [ 4] 3152         CALL     QDUP
      009223 CD 85 28         [ 4] 3153         CALL     QBRAN
      009226 92 2E                 3154         .word      SAME2
      009228 CD 85 C4         [ 4] 3155         CALL     RFROM
      00922B CC 86 10         [ 2] 3156         JP     DROP
      00922E CD 85 09         [ 4] 3157 SAME2:  CALL     DONXT
      009231 92 05                 3158         .word      SAME1
      009233 CC 8B 61         [ 2] 3159         JP     ZERO
                                   3160 
                                   3161 ;       find    ( a va -- ca na | a F )
                                   3162 ;       Search vocabulary for string.
                                   3163 ;       Return ca and na if succeeded.
      009236 91 F7                 3164         .word      LINK
                           0011B8  3165 LINK = . 
      009238 04                    3166         .byte      4
      009239 46 49 4E 44           3167         .ascii     "FIND"
      00923D                       3168 FIND:
      00923D CD 86 2A         [ 4] 3169         CALL     SWAPP
      009240 CD 86 1A         [ 4] 3170         CALL     DUPP
      009243 CD 85 91         [ 4] 3171         CALL     CAT
      009246 CD 86 E6         [ 4] 3172         CALL     TEMP
      009249 CD 85 5C         [ 4] 3173         CALL     STORE
      00924C CD 86 1A         [ 4] 3174         CALL     DUPP
      00924F CD 85 73         [ 4] 3175         CALL     AT
      009252 CD 85 E3         [ 4] 3176         CALL     TOR
      009255 CD 8A CA         [ 4] 3177         CALL     CELLP
      009258 CD 86 2A         [ 4] 3178         CALL     SWAPP
      00925B CD 85 73         [ 4] 3179 FIND1:  CALL     AT
      00925E CD 86 1A         [ 4] 3180         CALL     DUPP
      009261 CD 85 28         [ 4] 3181         CALL     QBRAN
      009264 92 9A                 3182         .word      FIND6
      009266 CD 86 1A         [ 4] 3183         CALL     DUPP
      009269 CD 85 73         [ 4] 3184         CALL     AT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



      00926C CD 84 F5         [ 4] 3185         CALL     DOLIT
      00926F 1F 7F                 3186         .word      MASKK
      009271 CD 86 66         [ 4] 3187         CALL     ANDD
      009274 CD 85 D7         [ 4] 3188         CALL     RAT
      009277 CD 86 8F         [ 4] 3189         CALL     XORR
      00927A CD 85 28         [ 4] 3190         CALL     QBRAN
      00927D 92 89                 3191         .word      FIND2
      00927F CD 8A CA         [ 4] 3192         CALL     CELLP
      009282 CD 84 F5         [ 4] 3193         CALL     DOLIT
      009285 FF FF                 3194         .word     0xFFFF
      009287 20 0C            [ 2] 3195         JRA     FIND3
      009289 CD 8A CA         [ 4] 3196 FIND2:  CALL     CELLP
      00928C CD 86 E6         [ 4] 3197         CALL     TEMP
      00928F CD 85 73         [ 4] 3198         CALL     AT
      009292 CD 91 FD         [ 4] 3199         CALL     SAMEQ
      009295 CD 85 3F         [ 4] 3200 FIND3:  CALL     BRAN
      009298 92 A9                 3201         .word      FIND4
      00929A CD 85 C4         [ 4] 3202 FIND6:  CALL     RFROM
      00929D CD 86 10         [ 4] 3203         CALL     DROP
      0092A0 CD 86 2A         [ 4] 3204         CALL     SWAPP
      0092A3 CD 8A D9         [ 4] 3205         CALL     CELLM
      0092A6 CC 86 2A         [ 2] 3206         JP     SWAPP
      0092A9 CD 85 28         [ 4] 3207 FIND4:  CALL     QBRAN
      0092AC 92 B6                 3208         .word      FIND5
      0092AE CD 8A D9         [ 4] 3209         CALL     CELLM
      0092B1 CD 8A D9         [ 4] 3210         CALL     CELLM
      0092B4 20 A5            [ 2] 3211         JRA     FIND1
      0092B6 CD 85 C4         [ 4] 3212 FIND5:  CALL     RFROM
      0092B9 CD 86 10         [ 4] 3213         CALL     DROP
      0092BC CD 86 2A         [ 4] 3214         CALL     SWAPP
      0092BF CD 86 10         [ 4] 3215         CALL     DROP
      0092C2 CD 8A D9         [ 4] 3216         CALL     CELLM
      0092C5 CD 86 1A         [ 4] 3217         CALL     DUPP
      0092C8 CD 91 E7         [ 4] 3218         CALL     NAMET
      0092CB CC 86 2A         [ 2] 3219         JP     SWAPP
                                   3220 
                                   3221 ;       NAME?   ( a -- ca na | a F )
                                   3222 ;       Search vocabularies for a string.
      0092CE 92 38                 3223         .word      LINK
                           001250  3224 LINK = . 
      0092D0 05                    3225         .byte      5
      0092D1 4E 41 4D 45 3F        3226         .ascii     "NAME?"
      0092D6                       3227 NAMEQ:
      0092D6 CD 87 5A         [ 4] 3228         CALL   CNTXT
      0092D9 CC 92 3D         [ 2] 3229         JP     FIND
                                   3230 
                                   3231 ;; Terminal response
                                   3232 
                                   3233 ;       ^H      ( bot eot cur -- bot eot cur )
                                   3234 ;       Backup cursor by one character.
      0092DC 92 D0                 3235         .word      LINK
                           00125E  3236 LINK = . 
      0092DE 02                    3237         .byte      2
      0092DF 5E 48                 3238         .ascii     "^H"
      0092E1                       3239 BKSP:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      0092E1 CD 85 E3         [ 4] 3240         CALL     TOR
      0092E4 CD 86 44         [ 4] 3241         CALL     OVER
      0092E7 CD 85 C4         [ 4] 3242         CALL     RFROM
      0092EA CD 86 2A         [ 4] 3243         CALL     SWAPP
      0092ED CD 86 44         [ 4] 3244         CALL     OVER
      0092F0 CD 86 8F         [ 4] 3245         CALL     XORR
      0092F3 CD 85 28         [ 4] 3246         CALL     QBRAN
      0092F6 93 11                 3247         .word      BACK1
      0092F8 CD 84 F5         [ 4] 3248         CALL     DOLIT
      0092FB 00 08                 3249         .word      BKSPP
      0092FD CD 84 B4         [ 4] 3250         CALL     EMIT
      009300 CD 8B 02         [ 4] 3251         CALL     ONEM
      009303 CD 8B 54         [ 4] 3252         CALL     BLANK
      009306 CD 84 B4         [ 4] 3253         CALL     EMIT
      009309 CD 84 F5         [ 4] 3254         CALL     DOLIT
      00930C 00 08                 3255         .word      BKSPP
      00930E CC 84 B4         [ 2] 3256         JP     EMIT
      009311 81               [ 4] 3257 BACK1:  RET
                                   3258 
                                   3259 ;       TAP    ( bot eot cur c -- bot eot cur )
                                   3260 ;       Accept and echo key stroke
                                   3261 ;       and bump cursor.
      009312 92 DE                 3262         .word      LINK
                           001294  3263 LINK = . 
      009314 03                    3264         .byte      3
      009315 54 41 50              3265         .ascii     "TAP"
      009318                       3266 TAP:
      009318 CD 86 1A         [ 4] 3267         CALL     DUPP
      00931B CD 84 B4         [ 4] 3268         CALL     EMIT
      00931E CD 86 44         [ 4] 3269         CALL     OVER
      009321 CD 85 80         [ 4] 3270         CALL     CSTOR
      009324 CC 8A F5         [ 2] 3271         JP     ONEP
                                   3272 
                                   3273 ;       kTAP    ( bot eot cur c -- bot eot cur )
                                   3274 ;       Process a key stroke,
                                   3275 ;       CR,LF or backspace.
      009327 93 14                 3276         .word      LINK
                           0012A9  3277 LINK = . 
      009329 04                    3278         .byte      4
      00932A 4B 54 41 50           3279         .ascii     "KTAP"
      00932E                       3280 KTAP:
      00932E CD 86 1A         [ 4] 3281         CALL     DUPP
      009331 CD 84 F5         [ 4] 3282         CALL     DOLIT
                           000001  3283 .if EOL_CR
      009334 00 0D                 3284         .word   CRR
                           000000  3285 .else ; EOL_LF 
                                   3286         .word   LF
                                   3287 .endif 
      009336 CD 86 8F         [ 4] 3288         CALL     XORR
      009339 CD 85 28         [ 4] 3289         CALL     QBRAN
      00933C 93 54                 3290         .word      KTAP2
      00933E CD 84 F5         [ 4] 3291         CALL     DOLIT
      009341 00 08                 3292         .word      BKSPP
      009343 CD 86 8F         [ 4] 3293         CALL     XORR
      009346 CD 85 28         [ 4] 3294         CALL     QBRAN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      009349 93 51                 3295         .word      KTAP1
      00934B CD 8B 54         [ 4] 3296         CALL     BLANK
      00934E CC 93 18         [ 2] 3297         JP     TAP
      009351 CC 92 E1         [ 2] 3298 KTAP1:  JP     BKSP
      009354 CD 86 10         [ 4] 3299 KTAP2:  CALL     DROP
      009357 CD 86 2A         [ 4] 3300         CALL     SWAPP
      00935A CD 86 10         [ 4] 3301         CALL     DROP
      00935D CC 86 1A         [ 2] 3302         JP     DUPP
                                   3303 
                                   3304 ;       accept  ( b u -- b u )
                                   3305 ;       Accept characters to input
                                   3306 ;       buffer. Return with actual count.
      009360 93 29                 3307         .word      LINK
                           0012E2  3308 LINK = . 
      009362 06                    3309         .byte      6
      009363 41 43 43 45 50 54     3310         .ascii     "ACCEPT"
      009369                       3311 ACCEP:
      009369 CD 86 44         [ 4] 3312         CALL     OVER
      00936C CD 88 15         [ 4] 3313         CALL     PLUS
      00936F CD 86 44         [ 4] 3314         CALL     OVER
      009372 CD 88 00         [ 4] 3315 ACCP1:  CALL     DDUP
      009375 CD 86 8F         [ 4] 3316         CALL     XORR
      009378 CD 85 28         [ 4] 3317         CALL     QBRAN
      00937B 93 9D                 3318         .word      ACCP4
      00937D CD 8F 47         [ 4] 3319         CALL     KEY
      009380 CD 86 1A         [ 4] 3320         CALL     DUPP
      009383 CD 8B 54         [ 4] 3321         CALL     BLANK
      009386 CD 84 F5         [ 4] 3322         CALL     DOLIT
      009389 00 7F                 3323         .word      127
      00938B CD 89 50         [ 4] 3324         CALL     WITHI
      00938E CD 85 28         [ 4] 3325         CALL     QBRAN
      009391 93 98                 3326         .word      ACCP2
      009393 CD 93 18         [ 4] 3327         CALL     TAP
      009396 20 03            [ 2] 3328         JRA     ACCP3
      009398 CD 93 2E         [ 4] 3329 ACCP2:  CALL     KTAP
      00939B 20 D5            [ 2] 3330 ACCP3:  JRA     ACCP1
      00939D CD 86 10         [ 4] 3331 ACCP4:  CALL     DROP
      0093A0 CD 86 44         [ 4] 3332         CALL     OVER
      0093A3 CC 88 8E         [ 2] 3333         JP     SUBB
                                   3334 
                                   3335 ;       QUERY   ( -- )
                                   3336 ;       Accept input stream to
                                   3337 ;       terminal input buffer.
      0093A6 93 62                 3338         .word      LINK
                                   3339         
                           001328  3340 LINK = . 
      0093A8 05                    3341         .byte      5
      0093A9 51 55 45 52 59        3342         .ascii     "QUERY"
      0093AE                       3343 QUERY:
      0093AE CD 8C 71         [ 4] 3344         CALL     TIB
      0093B1 CD 84 F5         [ 4] 3345         CALL     DOLIT
      0093B4 00 50                 3346         .word      80
      0093B6 CD 93 69         [ 4] 3347         CALL     ACCEP
      0093B9 CD 87 05         [ 4] 3348         CALL     NTIB
      0093BC CD 85 5C         [ 4] 3349         CALL     STORE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      0093BF CD 86 10         [ 4] 3350         CALL     DROP
      0093C2 CD 8B 61         [ 4] 3351         CALL     ZERO
      0093C5 CD 86 F5         [ 4] 3352         CALL     INN
      0093C8 CC 85 5C         [ 2] 3353         JP     STORE
                                   3354 
                                   3355 ;       ABORT   ( -- )
                                   3356 ;       Reset data stack and
                                   3357 ;       jump to QUIT.
      0093CB 93 A8                 3358         .word      LINK
                           00134D  3359 LINK = . 
      0093CD 05                    3360         .byte      5
      0093CE 41 42 4F 52 54        3361         .ascii     "ABORT"
      0093D3                       3362 ABORT:
      0093D3 CD 94 CA         [ 4] 3363         CALL     PRESE
      0093D6 CC 94 E7         [ 2] 3364         JP     QUIT
                                   3365 
                                   3366 ;       abort"  ( f -- )
                                   3367 ;       Run time routine of ABORT".
                                   3368 ;       Abort with a message.
      0093D9 93 CD                 3369         .word      LINK
                           00135B  3370 LINK = . 
      0093DB 46                    3371 	.byte      COMPO+6
      0093DC 41 42 4F 52 54        3372         .ascii     "ABORT"
      0093E1 22                    3373         .byte      '"'
      0093E2                       3374 ABORQ:
      0093E2 CD 85 28         [ 4] 3375         CALL     QBRAN
      0093E5 94 01                 3376         .word      ABOR2   ;text flag
      0093E7 CD 8F DD         [ 4] 3377         CALL     DOSTR
      0093EA CD 8F 7F         [ 4] 3378 ABOR1:  CALL     SPACE
      0093ED CD 8C 38         [ 4] 3379         CALL     COUNT
      0093F0 CD 8F A9         [ 4] 3380         CALL     TYPES
      0093F3 CD 84 F5         [ 4] 3381         CALL     DOLIT
      0093F6 00 3F                 3382         .word     63 ; "?"
      0093F8 CD 84 B4         [ 4] 3383         CALL     EMIT
      0093FB CD 8F C7         [ 4] 3384         CALL     CR
      0093FE CC 93 D3         [ 2] 3385         JP     ABORT   ;pass error string
      009401 CD 8F DD         [ 4] 3386 ABOR2:  CALL     DOSTR
      009404 CC 86 10         [ 2] 3387         JP     DROP
                                   3388 
                                   3389 ;; The text interpreter
                                   3390 
                                   3391 ;       $INTERPRET      ( a -- )
                                   3392 ;       Interpret a word. If failed,
                                   3393 ;       try to convert it to an integer.
      009407 93 DB                 3394         .word      LINK
                           001389  3395 LINK = . 
      009409 0A                    3396         .byte      10
      00940A 24 49 4E 54 45 52 50  3397         .ascii     "$INTERPRET"
             52 45 54
      009414                       3398 INTER:
      009414 CD 92 D6         [ 4] 3399         CALL     NAMEQ
      009417 CD 87 C4         [ 4] 3400         CALL     QDUP    ;?defined
      00941A CD 85 28         [ 4] 3401         CALL     QBRAN
      00941D 94 3E                 3402         .word      INTE1
      00941F CD 85 73         [ 4] 3403         CALL     AT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



      009422 CD 84 F5         [ 4] 3404         CALL     DOLIT
      009425 40 00                 3405 	.word       0x4000	; COMPO*256
      009427 CD 86 66         [ 4] 3406         CALL     ANDD    ;?compile only lexicon bits
      00942A CD 93 E2         [ 4] 3407         CALL     ABORQ
      00942D 0D                    3408         .byte      13
      00942E 20 63 6F 6D 70 69 6C  3409         .ascii     " compile only"
             65 20 6F 6E 6C 79
      00943B CC 85 4F         [ 2] 3410         JP     EXECU
      00943E CD 8E 74         [ 4] 3411 INTE1:  CALL     NUMBQ   ;convert a number
      009441 CD 85 28         [ 4] 3412         CALL     QBRAN
      009444 93 EA                 3413         .word    ABOR1
      009446 81               [ 4] 3414         RET
                                   3415 
                                   3416 ;       [       ( -- )
                                   3417 ;       Start  text interpreter.
      009447 94 09                 3418         .word      LINK
                           0013C9  3419 LINK = . 
      009449 81                    3420 	.byte      IMEDD+1
      00944A 5B                    3421         .ascii     "["
      00944B                       3422 LBRAC:
      00944B CD 84 F5         [ 4] 3423         CALL   DOLIT
      00944E 94 14                 3424         .word  INTER
      009450 CD 87 38         [ 4] 3425         CALL   TEVAL
      009453 CC 85 5C         [ 2] 3426         JP     STORE
                                   3427 
                                   3428 ;       .OK     ( -- )
                                   3429 ;       Display 'ok' while interpreting.
      009456 94 49                 3430         .word      LINK
                           0013D8  3431 LINK = . 
      009458 03                    3432         .byte      3
      009459 2E 4F 4B              3433         .ascii     ".OK"
      00945C                       3434 DOTOK:
      00945C CD 84 F5         [ 4] 3435         CALL     DOLIT
      00945F 94 14                 3436         .word      INTER
      009461 CD 87 38         [ 4] 3437         CALL     TEVAL
      009464 CD 85 73         [ 4] 3438         CALL     AT
      009467 CD 88 B6         [ 4] 3439         CALL     EQUAL
      00946A CD 85 28         [ 4] 3440         CALL     QBRAN
      00946D 94 76                 3441         .word      DOTO1
      00946F CD 90 06         [ 4] 3442         CALL     DOTQP
      009472 03                    3443         .byte      3
      009473 20 6F 6B              3444         .ascii     " ok"
      009476 CC 8F C7         [ 2] 3445 DOTO1:  JP     CR
                                   3446 
                                   3447 ;       ?STACK  ( -- )
                                   3448 ;       Abort if stack underflows.
      009479 94 58                 3449         .word      LINK
                           0013FB  3450 LINK = . 
      00947B 06                    3451         .byte      6
      00947C 3F 53 54 41 43 4B     3452         .ascii     "?STACK"
      009482                       3453 QSTAC: 
      009482 CD 8B A3         [ 4] 3454         CALL     DEPTH
      009485 CD 86 53         [ 4] 3455         CALL     ZLESS   ;check only for underflow
      009488 CD 93 E2         [ 4] 3456         CALL     ABORQ
      00948B 0B                    3457         .byte      11
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      00948C 20 75 6E 64 65 72 66  3458         .ascii     " underflow "
             6C 6F 77 20
      009497 81               [ 4] 3459         RET
                                   3460 
                                   3461 ;       EVAL    ( -- )
                                   3462 ;       Interpret  input stream.
      009498 94 7B                 3463         .word      LINK
                           00141A  3464 LINK = . 
      00949A 04                    3465         .byte      4
      00949B 45 56 41 4C           3466         .ascii     "EVAL"
      00949F                       3467 EVAL:
      00949F CD 91 D9         [ 4] 3468 EVAL1:  CALL     TOKEN
      0094A2 CD 86 1A         [ 4] 3469         CALL     DUPP
      0094A5 CD 85 91         [ 4] 3470         CALL     CAT     ;?input stream empty
      0094A8 CD 85 28         [ 4] 3471         CALL     QBRAN
      0094AB 94 BB                 3472         .word    EVAL2
      0094AD CD 87 38         [ 4] 3473         CALL     TEVAL
      0094B0 CD 8C 85         [ 4] 3474         CALL     ATEXE
      0094B3 CD 94 82         [ 4] 3475         CALL     QSTAC   ;evaluate input, check stack
      0094B6 CD 85 3F         [ 4] 3476         CALL     BRAN
      0094B9 94 9F                 3477         .word    EVAL1
      0094BB CD 86 10         [ 4] 3478 EVAL2:  CALL     DROP
      0094BE CC 94 5C         [ 2] 3479         JP       DOTOK
                                   3480 
                                   3481 ;       PRESET  ( -- )
                                   3482 ;       Reset data stack pointer and
                                   3483 ;       terminal input buffer.
      0094C1 94 9A                 3484         .word      LINK
                           001443  3485 LINK = . 
      0094C3 06                    3486         .byte      6
      0094C4 50 52 45 53 45 54     3487         .ascii     "PRESET"
      0094CA                       3488 PRESE:
      0094CA CD 84 F5         [ 4] 3489         CALL     DOLIT
      0094CD 16 80                 3490         .word      SPP
      0094CF CD 86 07         [ 4] 3491         CALL     SPSTO
      0094D2 CD 84 F5         [ 4] 3492         CALL     DOLIT
      0094D5 17 00                 3493         .word      TIBB
      0094D7 CD 87 05         [ 4] 3494         CALL     NTIB
      0094DA CD 8A CA         [ 4] 3495         CALL     CELLP
      0094DD CC 85 5C         [ 2] 3496         JP     STORE
                                   3497 
                                   3498 ;       QUIT    ( -- )
                                   3499 ;       Reset return stack pointer
                                   3500 ;       and start text interpreter.
      0094E0 94 C3                 3501         .word      LINK
                           001462  3502 LINK = . 
      0094E2 04                    3503         .byte      4
      0094E3 51 55 49 54           3504         .ascii     "QUIT"
      0094E7                       3505 QUIT:
      0094E7 CD 84 F5         [ 4] 3506         CALL     DOLIT
      0094EA 17 FF                 3507         .word      RPP
      0094EC CD 85 AE         [ 4] 3508         CALL     RPSTO   ;reset return stack pointer
      0094EF CD 94 4B         [ 4] 3509 QUIT1:  CALL     LBRAC   ;start interpretation
      0094F2 CD 93 AE         [ 4] 3510 QUIT2:  CALL     QUERY   ;get input
      0094F5 CD 94 9F         [ 4] 3511         CALL     EVAL
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      0094F8 20 F8            [ 2] 3512         JRA     QUIT2   ;continue till error
                                   3513 
                                   3514 ;; The compiler
                                   3515 
                                   3516 ;       '       ( -- ca )
                                   3517 ;       Search vocabularies for
                                   3518 ;       next word in input stream.
      0094FA 94 E2                 3519         .word      LINK
                           00147C  3520 LINK = . 
      0094FC 01                    3521         .byte      1
      0094FD 27                    3522         .ascii     "'"
      0094FE                       3523 TICK:
      0094FE CD 91 D9         [ 4] 3524         CALL     TOKEN
      009501 CD 92 D6         [ 4] 3525         CALL     NAMEQ   ;?defined
      009504 CD 85 28         [ 4] 3526         CALL     QBRAN
      009507 93 EA                 3527         .word      ABOR1
      009509 81               [ 4] 3528         RET     ;yes, push code address
                                   3529 
                                   3530 ;       ALLOT   ( n -- )
                                   3531 ;       Allocate n bytes to RAM 
      00950A 94 FC                 3532         .word      LINK
                           00148C  3533         LINK = . 
      00950C 05                    3534         .byte      5
      00950D 41 4C 4C 4F 54        3535         .ascii     "ALLOT"
      009512                       3536 ALLOT:
      009512 CD 87 68         [ 4] 3537         CALL     VPP
                                   3538 ; must update APP_VP each time VP is modidied
      009515 CD 8B D1         [ 4] 3539         call PSTOR 
      009518 CC 9C 5B         [ 2] 3540         jp UPDATVP 
                                   3541 
                                   3542 ;       ,       ( w -- )
                                   3543 ;         Compile an integer into
                                   3544 ;         variable space.
      00951B 95 0C                 3545         .word      LINK
                           00149D  3546 LINK = . 
      00951D 01                    3547         .byte      1
      00951E 2C                    3548         .ascii     ","
      00951F                       3549 COMMA:
      00951F CD 8C 4F         [ 4] 3550         CALL     HERE
      009522 CD 86 1A         [ 4] 3551         CALL     DUPP
      009525 CD 8A CA         [ 4] 3552         CALL     CELLP   ;cell boundary
      009528 CD 87 68         [ 4] 3553         CALL     VPP
      00952B CD 85 5C         [ 4] 3554         CALL     STORE
      00952E CC 85 5C         [ 2] 3555         JP     STORE
                                   3556 
                                   3557 ;       C,      ( c -- )
                                   3558 ;       Compile a byte into
                                   3559 ;       variables space.
      009531 95 1D                 3560        .word      LINK
                           0014B3  3561 LINK = . 
      009533 02                    3562         .byte      2
      009534 43 2C                 3563         .ascii     "C,"
      009536                       3564 CCOMMA:
      009536 CD 8C 4F         [ 4] 3565         CALL     HERE
      009539 CD 86 1A         [ 4] 3566         CALL     DUPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      00953C CD 8A F5         [ 4] 3567         CALL     ONEP
      00953F CD 87 68         [ 4] 3568         CALL     VPP
      009542 CD 85 5C         [ 4] 3569         CALL     STORE
      009545 CC 85 80         [ 2] 3570         JP     CSTOR
                                   3571 
                                   3572 ;       [COMPILE]       ( -- ; <string> )
                                   3573 ;       Compile next immediate
                                   3574 ;       word into code dictionary.
      009548 95 33                 3575         .word      LINK
                           0014CA  3576 LINK = . 
      00954A 89                    3577 	.byte      IMEDD+9
      00954B 5B 43 4F 4D 50 49 4C  3578         .ascii     "[COMPILE]"
             45 5D
      009554                       3579 BCOMP:
      009554 CD 94 FE         [ 4] 3580         CALL     TICK
      009557 CC 98 1A         [ 2] 3581         JP     JSRC
                                   3582 
                                   3583 ;       COMPILE ( -- )
                                   3584 ;       Compile next jsr in
                                   3585 ;       colon list to code dictionary.
      00955A 95 4A                 3586         .word      LINK
                           0014DC  3587 LINK = . 
      00955C 47                    3588 	.byte      COMPO+7
      00955D 43 4F 4D 50 49 4C 45  3589         .ascii     "COMPILE"
      009564                       3590 COMPI:
      009564 CD 85 C4         [ 4] 3591         CALL     RFROM
      009567 CD 86 1A         [ 4] 3592         CALL     DUPP
      00956A CD 85 73         [ 4] 3593         CALL     AT
      00956D CD 98 1A         [ 4] 3594         CALL     JSRC    ;compile subroutine
      009570 CD 8A CA         [ 4] 3595         CALL     CELLP
      009573 90 93            [ 1] 3596         ldw y,x 
      009575 90 FE            [ 2] 3597         ldw y,(y)
      009577 1C 00 02         [ 2] 3598         addw x,#CELLL 
      00957A 90 FC            [ 2] 3599         jp (y)
                                   3600 
                                   3601 ;       LITERAL ( w -- )
                                   3602 ;       Compile tos to dictionary
                                   3603 ;       as an integer literal.
      00957C 95 5C                 3604         .word      LINK
                           0014FE  3605 LINK = . 
      00957E 87                    3606 	.byte      IMEDD+7
      00957F 4C 49 54 45 52 41 4C  3607         .ascii     "LITERAL"
      009586                       3608 LITER:
      009586 CD 95 64         [ 4] 3609         CALL     COMPI
      009589 84 F5                 3610         .word DOLIT 
      00958B CC 95 1F         [ 2] 3611         JP     COMMA
                                   3612 
                                   3613 ;       $,"     ( -- )
                                   3614 ;       Compile a literal string
                                   3615 ;       up to next " .
      00958E 95 7E                 3616         .word      LINK
                           001510  3617 LINK = . 
      009590 03                    3618         .byte      3
      009591 24 2C 22              3619         .byte     '$',',','"'
      009594                       3620 STRCQ:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



      009594 CD 84 F5         [ 4] 3621         CALL     DOLIT
      009597 00 22                 3622         .word     34	; "
      009599 CD 91 5C         [ 4] 3623         CALL     PARSE
      00959C CD 8C 4F         [ 4] 3624         CALL     HERE
      00959F CD 8D 0F         [ 4] 3625         CALL     PACKS   ;string to code dictionary
      0095A2 CD 8C 38         [ 4] 3626         CALL     COUNT
      0095A5 CD 88 15         [ 4] 3627         CALL     PLUS    ;calculate aligned end of string
      0095A8 CD 87 68         [ 4] 3628         CALL     VPP
      0095AB CC 85 5C         [ 2] 3629         JP     STORE
                                   3630 
                                   3631 ;; Structures
                                   3632 
                                   3633 ;       FOR     ( -- a )
                                   3634 ;       Start a FOR-NEXT loop
                                   3635 ;       structure in a colon definition.
      0095AE 95 90                 3636         .word      LINK
                           001530  3637 LINK = . 
      0095B0 83                    3638 	.byte      IMEDD+3
      0095B1 46 4F 52              3639         .ascii     "FOR"
      0095B4                       3640 FOR:
      0095B4 CD 95 64         [ 4] 3641         CALL     COMPI
      0095B7 85 E3                 3642         .word TOR 
      0095B9 CC 8C 4F         [ 2] 3643         JP     HERE
                                   3644 
                                   3645 ;       NEXT    ( a -- )
                                   3646 ;       Terminate a FOR-NEXT loop.
      0095BC 95 B0                 3647         .word      LINK
                           00153E  3648 LINK = . 
      0095BE 84                    3649 	.byte      IMEDD+4
      0095BF 4E 45 58 54           3650         .ascii     "NEXT"
      0095C3                       3651 NEXT:
      0095C3 CD 95 64         [ 4] 3652         CALL     COMPI
      0095C6 85 09                 3653         .word DONXT 
      0095C8 CD 87 B4         [ 4] 3654         call ADRADJ
      0095CB CC 95 1F         [ 2] 3655         JP     COMMA
                                   3656 
                                   3657 ;       I ( -- n )
                                   3658 ;       stack FOR-NEXT COUNTER 
      0095CE 95 BE                 3659         .word LINK 
                           001550  3660         LINK=.
      0095D0 01                    3661         .byte 1 
      0095D1 49                    3662         .ascii "I"
      0095D2                       3663 IFETCH: 
      0095D2 1D 00 02         [ 2] 3664         subw x,#CELLL 
      0095D5 16 03            [ 2] 3665         ldw y,(3,sp)
      0095D7 FF               [ 2] 3666         ldw (x),y 
      0095D8 81               [ 4] 3667         ret 
                                   3668 
                                   3669 ;       BEGIN   ( -- a )
                                   3670 ;       Start an infinite or
                                   3671 ;       indefinite loop structure.
      0095D9 95 D0                 3672         .word      LINK
                           00155B  3673 LINK = . 
      0095DB 85                    3674 	.byte      IMEDD+5
      0095DC 42 45 47 49 4E        3675         .ascii     "BEGIN"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      0095E1                       3676 BEGIN:
      0095E1 CC 8C 4F         [ 2] 3677         JP     HERE
                                   3678 
                                   3679 ;       UNTIL   ( a -- )
                                   3680 ;       Terminate a BEGIN-UNTIL
                                   3681 ;       indefinite loop structure.
      0095E4 95 DB                 3682         .word      LINK
                           001566  3683 LINK = . 
      0095E6 85                    3684 	.byte      IMEDD+5
      0095E7 55 4E 54 49 4C        3685         .ascii     "UNTIL"
      0095EC                       3686 UNTIL:
      0095EC CD 95 64         [ 4] 3687         CALL     COMPI
      0095EF 85 28                 3688         .word    QBRAN 
      0095F1 CD 87 B4         [ 4] 3689         call ADRADJ
      0095F4 CC 95 1F         [ 2] 3690         JP     COMMA
                                   3691 
                                   3692 ;       AGAIN   ( a -- )
                                   3693 ;       Terminate a BEGIN-AGAIN
                                   3694 ;       infinite loop structure.
      0095F7 95 E6                 3695         .word      LINK
                           001579  3696 LINK = . 
      0095F9 85                    3697 	.byte      IMEDD+5
      0095FA 41 47 41 49 4E        3698         .ascii     "AGAIN"
      0095FF                       3699 AGAIN:
      0095FF CD 95 64         [ 4] 3700         CALL     COMPI
      009602 85 3F                 3701         .word BRAN
      009604 CD 87 B4         [ 4] 3702         call ADRADJ 
      009607 CC 95 1F         [ 2] 3703         JP     COMMA
                                   3704 
                                   3705 ;       IF      ( -- A )
                                   3706 ;       Begin a conditional branch.
      00960A 95 F9                 3707         .word      LINK
                           00158C  3708 LINK = . 
      00960C 82                    3709 	.byte      IMEDD+2
      00960D 49 46                 3710         .ascii     "IF"
      00960F                       3711 IFF:
      00960F CD 95 64         [ 4] 3712         CALL     COMPI
      009612 85 28                 3713         .word QBRAN
      009614 CD 8C 4F         [ 4] 3714         CALL     HERE
      009617 CD 8B 61         [ 4] 3715         CALL     ZERO
      00961A CC 95 1F         [ 2] 3716         JP     COMMA
                                   3717 
                                   3718 ;       THEN        ( A -- )
                                   3719 ;       Terminate a conditional branch structure.
      00961D 96 0C                 3720         .word      LINK
                           00159F  3721 LINK = . 
      00961F 84                    3722 	.byte      IMEDD+4
      009620 54 48 45 4E           3723         .ascii     "THEN"
      009624                       3724 THENN:
      009624 CD 8C 4F         [ 4] 3725         CALL     HERE
      009627 CD 87 B4         [ 4] 3726         call ADRADJ 
      00962A CD 86 2A         [ 4] 3727         CALL     SWAPP
      00962D CC 85 5C         [ 2] 3728         JP     STORE
                                   3729 
                                   3730 ;       ELSE        ( A -- A )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



                                   3731 ;       Start the false clause in an IF-ELSE-THEN structure.
      009630 96 1F                 3732         .word      LINK
                           0015B2  3733 LINK = . 
      009632 84                    3734 	.byte      IMEDD+4
      009633 45 4C 53 45           3735         .ascii     "ELSE"
      009637                       3736 ELSEE:
      009637 CD 95 64         [ 4] 3737         CALL     COMPI
      00963A 85 3F                 3738         .word BRAN
      00963C CD 8C 4F         [ 4] 3739         CALL     HERE
      00963F CD 8B 61         [ 4] 3740         CALL     ZERO
      009642 CD 95 1F         [ 4] 3741         CALL     COMMA
      009645 CD 86 2A         [ 4] 3742         CALL     SWAPP
      009648 CD 8C 4F         [ 4] 3743         CALL     HERE
      00964B CD 87 B4         [ 4] 3744         call ADRADJ 
      00964E CD 86 2A         [ 4] 3745         CALL     SWAPP
      009651 CC 85 5C         [ 2] 3746         JP     STORE
                                   3747 
                                   3748 ;       AHEAD       ( -- A )
                                   3749 ;       Compile a forward branch instruction.
      009654 96 32                 3750         .word      LINK
                           0015D6  3751 LINK = . 
      009656 85                    3752 	.byte      IMEDD+5
      009657 41 48 45 41 44        3753         .ascii     "AHEAD"
      00965C                       3754 AHEAD:
      00965C CD 95 64         [ 4] 3755         CALL     COMPI
      00965F 85 3F                 3756         .word BRAN
      009661 CD 8C 4F         [ 4] 3757         CALL     HERE
      009664 CD 8B 61         [ 4] 3758         CALL     ZERO
      009667 CC 95 1F         [ 2] 3759         JP     COMMA
                                   3760 
                                   3761 ;       WHILE       ( a -- A a )
                                   3762 ;       Conditional branch out of a BEGIN-WHILE-REPEAT loop.
      00966A 96 56                 3763         .word      LINK
                           0015EC  3764 LINK = . 
      00966C 85                    3765 	.byte      IMEDD+5
      00966D 57 48 49 4C 45        3766         .ascii     "WHILE"
      009672                       3767 WHILE:
      009672 CD 95 64         [ 4] 3768         CALL     COMPI
      009675 85 28                 3769         .word QBRAN
      009677 CD 8C 4F         [ 4] 3770         CALL     HERE
      00967A CD 8B 61         [ 4] 3771         CALL     ZERO
      00967D CD 95 1F         [ 4] 3772         CALL     COMMA
      009680 CC 86 2A         [ 2] 3773         JP     SWAPP
                                   3774 
                                   3775 ;       REPEAT      ( A a -- )
                                   3776 ;       Terminate a BEGIN-WHILE-REPEAT indefinite loop.
      009683 96 6C                 3777         .word      LINK
                           001605  3778 LINK = . 
      009685 86                    3779         .byte      IMEDD+6
      009686 52 45 50 45 41 54     3780         .ascii     "REPEAT"
      00968C                       3781 REPEA:
      00968C CD 95 64         [ 4] 3782         CALL     COMPI
      00968F 85 3F                 3783         .word BRAN
      009691 CD 87 B4         [ 4] 3784         call ADRADJ 
      009694 CD 95 1F         [ 4] 3785         CALL     COMMA
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      009697 CD 8C 4F         [ 4] 3786         CALL     HERE
      00969A CD 87 B4         [ 4] 3787         call ADRADJ 
      00969D CD 86 2A         [ 4] 3788         CALL     SWAPP
      0096A0 CC 85 5C         [ 2] 3789         JP     STORE
                                   3790 
                                   3791 ;       AFT         ( a -- a A )
                                   3792 ;       Jump to THEN in a FOR-AFT-THEN-NEXT loop the first time through.
      0096A3 96 85                 3793         .word      LINK
                           001625  3794 LINK = . 
      0096A5 83                    3795 	.byte      IMEDD+3
      0096A6 41 46 54              3796         .ascii     "AFT"
      0096A9                       3797 AFT:
      0096A9 CD 86 10         [ 4] 3798         CALL     DROP
      0096AC CD 96 5C         [ 4] 3799         CALL     AHEAD
      0096AF CD 8C 4F         [ 4] 3800         CALL     HERE
      0096B2 CC 86 2A         [ 2] 3801         JP     SWAPP
                                   3802 
                                   3803 ;       ABORT"      ( -- ; <string> )
                                   3804 ;       Conditional abort with an error message.
      0096B5 96 A5                 3805         .word      LINK
                           001637  3806 LINK = . 
      0096B7 86                    3807 	.byte      IMEDD+6
      0096B8 41 42 4F 52 54        3808         .ascii     "ABORT"
      0096BD 22                    3809         .byte      '"'
      0096BE                       3810 ABRTQ:
      0096BE CD 95 64         [ 4] 3811         CALL     COMPI
      0096C1 93 E2                 3812         .word ABORQ
      0096C3 CC 95 94         [ 2] 3813         JP     STRCQ
                                   3814 
                                   3815 ;       $"     ( -- ; <string> )
                                   3816 ;       Compile an inline string literal.
      0096C6 96 B7                 3817         .word      LINK
                           001648  3818 LINK = . 
      0096C8 82                    3819 	.byte      IMEDD+2
      0096C9 24 22                 3820         .byte     '$','"'
      0096CB                       3821 STRQ:
      0096CB CD 95 64         [ 4] 3822         CALL     COMPI
      0096CE 8F FC                 3823         .word STRQP 
      0096D0 CC 95 94         [ 2] 3824         JP     STRCQ
                                   3825 
                                   3826 ;       ."          ( -- ; <string> )
                                   3827 ;       Compile an inline string literal to be typed out at run time.
      0096D3 96 C8                 3828         .word      LINK
                           001655  3829 LINK = . 
      0096D5 82                    3830 	.byte      IMEDD+2
      0096D6 2E 22                 3831         .byte     '.','"'
      0096D8                       3832 DOTQ:
      0096D8 CD 95 64         [ 4] 3833         CALL     COMPI
      0096DB 90 06                 3834         .word DOTQP 
      0096DD CC 95 94         [ 2] 3835         JP     STRCQ
                                   3836 
                                   3837 ;; Name compiler
                                   3838 
                                   3839 ;       ?UNIQUE ( a -- a )
                                   3840 ;       Display a warning message
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



                                   3841 ;       if word already exists.
      0096E0 96 D5                 3842         .word      LINK
                           001662  3843 LINK = . 
      0096E2 07                    3844         .byte      7
      0096E3 3F 55 4E 49 51 55 45  3845         .ascii     "?UNIQUE"
      0096EA                       3846 UNIQU:
      0096EA CD 86 1A         [ 4] 3847         CALL     DUPP
      0096ED CD 92 D6         [ 4] 3848         CALL     NAMEQ   ;?name exists
      0096F0 CD 85 28         [ 4] 3849         CALL     QBRAN
      0096F3 97 09                 3850         .word      UNIQ1
      0096F5 CD 90 06         [ 4] 3851         CALL     DOTQP   ;redef are OK
      0096F8 07                    3852         .byte       7
      0096F9 20 72 65 44 65 66 20  3853         .ascii     " reDef "       
      009700 CD 86 44         [ 4] 3854         CALL     OVER
      009703 CD 8C 38         [ 4] 3855         CALL     COUNT
      009706 CD 8F A9         [ 4] 3856         CALL     TYPES   ;just in case
      009709 CC 86 10         [ 2] 3857 UNIQ1:  JP     DROP
                                   3858 
                                   3859 ;       $,n     ( na -- )
                                   3860 ;       Build a new dictionary name
                                   3861 ;       using string at na.
                                   3862 ; compile dans l'espace des variables 
      00970C 96 E2                 3863         .word      LINK
                           00168E  3864 LINK = . 
      00970E 03                    3865         .byte      3
      00970F 24 2C 6E              3866         .ascii     "$,n"
      009712                       3867 SNAME:
      009712 CD 86 1A         [ 4] 3868         CALL     DUPP
      009715 CD 85 91         [ 4] 3869         CALL     CAT     ;?null input
      009718 CD 85 28         [ 4] 3870         CALL     QBRAN
      00971B 97 48                 3871         .word      PNAM1
      00971D CD 96 EA         [ 4] 3872         CALL     UNIQU   ;?redefinition
      009720 CD 86 1A         [ 4] 3873         CALL     DUPP
      009723 CD 8C 38         [ 4] 3874         CALL     COUNT
      009726 CD 88 15         [ 4] 3875         CALL     PLUS
      009729 CD 87 68         [ 4] 3876         CALL     VPP
      00972C CD 85 5C         [ 4] 3877         CALL     STORE
      00972F CD 86 1A         [ 4] 3878         CALL     DUPP
      009732 CD 87 86         [ 4] 3879         CALL     LAST
      009735 CD 85 5C         [ 4] 3880         CALL     STORE   ;save na for vocabulary link
      009738 CD 8A D9         [ 4] 3881         CALL     CELLM   ;link address
      00973B CD 87 5A         [ 4] 3882         CALL     CNTXT
      00973E CD 85 73         [ 4] 3883         CALL     AT
      009741 CD 86 2A         [ 4] 3884         CALL     SWAPP
      009744 CD 85 5C         [ 4] 3885         CALL     STORE
      009747 81               [ 4] 3886         RET     ;save code pointer
      009748 CD 8F FC         [ 4] 3887 PNAM1:  CALL     STRQP
      00974B 05                    3888         .byte      5
      00974C 20 6E 61 6D 65        3889         .ascii     " name" ;null input
      009751 CC 93 EA         [ 2] 3890         JP     ABOR1
                                   3891 
                                   3892 ;; FORTH compiler
                                   3893 
                                   3894 ;       $COMPILE        ( a -- )
                                   3895 ;       Compile next word to
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



                                   3896 ;       dictionary as a token or literal.
      009754 97 0E                 3897         .word      LINK
                           0016D6  3898 LINK = . 
      009756 08                    3899         .byte      8
      009757 24 43 4F 4D 50 49 4C  3900         .ascii     "$COMPILE"
             45
      00975F                       3901 SCOMP:
      00975F CD 92 D6         [ 4] 3902         CALL     NAMEQ
      009762 CD 87 C4         [ 4] 3903         CALL     QDUP    ;?defined
      009765 CD 85 28         [ 4] 3904         CALL     QBRAN
      009768 97 80                 3905         .word      SCOM2
      00976A CD 85 73         [ 4] 3906         CALL     AT
      00976D CD 84 F5         [ 4] 3907         CALL     DOLIT
      009770 80 00                 3908         .word     0x8000	;  IMEDD*256
      009772 CD 86 66         [ 4] 3909         CALL     ANDD    ;?immediate
      009775 CD 85 28         [ 4] 3910         CALL     QBRAN
      009778 97 7D                 3911         .word      SCOM1
      00977A CC 85 4F         [ 2] 3912         JP     EXECU
      00977D CC 98 1A         [ 2] 3913 SCOM1:  JP     JSRC
      009780 CD 8E 74         [ 4] 3914 SCOM2:  CALL     NUMBQ   ;try to convert to number
      009783 CD 85 28         [ 4] 3915         CALL     QBRAN
      009786 93 EA                 3916         .word      ABOR1
      009788 CC 95 86         [ 2] 3917         JP     LITER
                                   3918 
                                   3919 ;       OVERT   ( -- )
                                   3920 ;       Link a new word into vocabulary.
      00978B 97 56                 3921         .word      LINK
                           00170D  3922 LINK = . 
      00978D 05                    3923         .byte      5
      00978E 4F 56 45 52 54        3924         .ascii     "OVERT"
      009793                       3925 OVERT:
      009793 CD 87 86         [ 4] 3926         CALL     LAST
      009796 CD 85 73         [ 4] 3927         CALL     AT
      009799 CD 87 5A         [ 4] 3928         CALL     CNTXT
      00979C CC 85 5C         [ 2] 3929         JP     STORE
                                   3930 
                                   3931 ;       ;       ( -- )
                                   3932 ;       Terminate a colon definition.
      00979F 97 8D                 3933         .word      LINK
                           001721  3934 LINK = . 
      0097A1 C1                    3935 	.byte      IMEDD+COMPO+1
      0097A2 3B                    3936         .ascii     ";"
      0097A3                       3937 SEMIS:
                           000001  3938 .if OPTIMIZE ; more compact and faster
      0097A3 CD 84 F5         [ 4] 3939         call DOLIT 
      0097A6 00 81                 3940         .word 0x81   ; opcode for RET 
      0097A8 CD 95 36         [ 4] 3941         call CCOMMA 
                           000000  3942 .else
                                   3943         CALL     COMPI
                                   3944         .word EXIT 
                                   3945 .endif 
      0097AB CD 94 4B         [ 4] 3946         CALL     LBRAC
      0097AE CD 97 93         [ 4] 3947         call OVERT 
      0097B1 CD A1 B3         [ 4] 3948         CALL FMOVE
      0097B4 CD 87 C4         [ 4] 3949         call QDUP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      0097B7 CD 85 28         [ 4] 3950         call QBRAN 
      0097BA 98 EA                 3951         .word SET_RAMLAST 
      0097BC CD A2 47         [ 4] 3952         CALL UPDATPTR
      0097BF 81               [ 4] 3953         RET 
                                   3954 
                                   3955 
                                   3956 ;       Terminate an ISR definition 
                                   3957 ;       retourn ca of ISR as double
                                   3958 ;       I; ( -- ud )
      0097C0 97 A1                 3959         .word LINK 
                           001742  3960         LINK=.
      0097C2 C2                    3961         .byte 2+IMEDD+COMPO 
      0097C3 49 3B                 3962         .ascii "I;" 
      0097C5                       3963 ISEMI:
      0097C5 1D 00 02         [ 2] 3964         subw x,#CELLL  
      0097C8 90 AE 00 80      [ 2] 3965         ldw y,#IRET_CODE 
      0097CC FF               [ 2] 3966         ldw (x),y 
      0097CD CD 95 36         [ 4] 3967         call CCOMMA
      0097D0 CD 94 4B         [ 4] 3968         call LBRAC 
      0097D3 CD A2 8C         [ 4] 3969         call IFMOVE
      0097D6 CD 87 C4         [ 4] 3970         call QDUP 
      0097D9 CD 85 28         [ 4] 3971         CALL QBRAN 
      0097DC 98 EA                 3972         .word SET_RAMLAST
      0097DE CD 87 76         [ 4] 3973         CALL CPP
      0097E1 CD 85 73         [ 4] 3974         call AT 
      0097E4 CD 86 2A         [ 4] 3975         call SWAPP 
      0097E7 CD 87 76         [ 4] 3976         CALL CPP 
      0097EA CD 85 5C         [ 4] 3977         call STORE 
      0097ED CD 9C 44         [ 4] 3978         call UPDATCP 
      0097F0 CD 9C 01         [ 4] 3979         call EEPVP 
      0097F3 CD 86 10         [ 4] 3980         call DROP 
      0097F6 CD 85 73         [ 4] 3981         call AT 
      0097F9 CD 87 68         [ 4] 3982         call VPP 
      0097FC CD 85 5C         [ 4] 3983         call STORE 
      0097FF CC 8B 61         [ 2] 3984         jp ZERO
      009802 81               [ 4] 3985         ret           
                                   3986         
                                   3987 
                                   3988 ;       ]       ( -- )
                                   3989 ;       Start compiling words in
                                   3990 ;       input stream.
      009803 97 C2                 3991         .word      LINK
                           001785  3992 LINK = . 
      009805 01                    3993         .byte      1
      009806 5D                    3994         .ascii     "]"
      009807                       3995 RBRAC:
      009807 CD 84 F5         [ 4] 3996         CALL   DOLIT
      00980A 97 5F                 3997         .word  SCOMP
      00980C CD 87 38         [ 4] 3998         CALL   TEVAL
      00980F CC 85 5C         [ 2] 3999         JP     STORE
                                   4000 
                                   4001 ;       CALL,    ( ca -- )
                                   4002 ;       Compile a subroutine call.
      009812 98 05                 4003         .word      LINK
                           001794  4004 LINK = . 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      009814 05                    4005         .byte      5
      009815 43 41 4C 4C 2C        4006         .ascii     "CALL,"
      00981A                       4007 JSRC:
      00981A CD 84 F5         [ 4] 4008         CALL     DOLIT
      00981D 00 CD                 4009         .word     CALLL     ;CALL
      00981F CD 95 36         [ 4] 4010         CALL     CCOMMA
      009822 CC 95 1F         [ 2] 4011         JP     COMMA
                                   4012 
                                   4013 ;       INIT-OFS ( -- )
                                   4014 ;       compute offset to adjust jump address 
                                   4015 ;       set variable OFFSET 
      009825 98 14                 4016         .word LINK 
                           0017A7  4017         LINK=.
      009827 08                    4018         .byte 8 
      009828 49 4E 49 54 2D 4F 46  4019         .ascii "INIT-OFS" 
             53
      009830                       4020 INITOFS:
      009830 CD 87 27         [ 4] 4021         call TFLASH 
      009833 CD 85 73         [ 4] 4022         CALL AT 
      009836 CD 86 1A         [ 4] 4023         CALL DUPP 
      009839 CD 85 28         [ 4] 4024         call QBRAN
      00983C 98 4D                 4025         .word 1$
      00983E CD 86 10         [ 4] 4026         call DROP  
      009841 CD 87 76         [ 4] 4027         call CPP 
      009844 CD 85 73         [ 4] 4028         call AT 
      009847 CD 8C 4F         [ 4] 4029         call HERE
      00984A CD 88 8E         [ 4] 4030         call SUBB 
      00984D CD 87 AB         [ 4] 4031 1$:     call OFFSET 
      009850 CC 85 5C         [ 2] 4032         jp STORE  
                                   4033 
                                   4034 ;       :       ( -- ; <string> )
                                   4035 ;       Start a new colon definition
                                   4036 ;       using next word as its name.
      009853 98 27                 4037         .word      LINK
                           0017D5  4038 LINK = . 
      009855 01                    4039         .byte      1
      009856 3A                    4040         .ascii     ":"
      009857                       4041 COLON:
      009857 CD 98 30         [ 4] 4042         call INITOFS       
      00985A CD 91 D9         [ 4] 4043         CALL   TOKEN
      00985D CD 97 12         [ 4] 4044         CALL   SNAME
      009860 CC 98 07         [ 2] 4045         JP     RBRAC
                                   4046 
                                   4047 ;       I:  ( -- )
                                   4048 ;       Start interrupt service routine definition
                                   4049 ;       those definition have no name.
      009863 98 55                 4050         .word LINK
                           0017E5  4051         LINK=.
      009865 02                    4052         .byte 2 
      009866 49 3A                 4053         .ascii "I:" 
      009868                       4054 ICOLON:
      009868 CD 98 30         [ 4] 4055         call INITOFS 
      00986B CC 98 07         [ 2] 4056         jp RBRAC  
                                   4057 
                                   4058 ;       IMMEDIATE       ( -- )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



                                   4059 ;       Make last compiled word
                                   4060 ;       an immediate word.
      00986E 98 65                 4061         .word      LINK
                           0017F0  4062 LINK = . 
      009870 09                    4063         .byte      9
      009871 49 4D 4D 45 44 49 41  4064         .ascii     "IMMEDIATE"
             54 45
      00987A                       4065 IMMED:
      00987A CD 84 F5         [ 4] 4066         CALL     DOLIT
      00987D 80 00                 4067         .word     0x8000	;  IMEDD*256
      00987F CD 87 86         [ 4] 4068         CALL     LAST
      009882 CD 85 73         [ 4] 4069         CALL     AT
      009885 CD 85 73         [ 4] 4070         CALL     AT
      009888 CD 86 7A         [ 4] 4071         CALL     ORR
      00988B CD 87 86         [ 4] 4072         CALL     LAST
      00988E CD 85 73         [ 4] 4073         CALL     AT
      009891 CC 85 5C         [ 2] 4074         JP     STORE
                                   4075 
                                   4076 ;; Defining words
                                   4077 
                                   4078 ;       CREATE  ( -- ; <string> )
                                   4079 ;       Compile a new array
                                   4080 ;       without allocating space.
      009894 98 70                 4081         .word      LINK
                           001816  4082 LINK = . 
      009896 06                    4083         .byte      6
      009897 43 52 45 41 54 45     4084         .ascii     "CREATE"
      00989D                       4085 CREAT:
      00989D CD 91 D9         [ 4] 4086         CALL     TOKEN
      0098A0 CD 97 12         [ 4] 4087         CALL     SNAME
      0098A3 CD 97 93         [ 4] 4088         CALL     OVERT        
      0098A6 CD 95 64         [ 4] 4089         CALL     COMPI 
      0098A9 86 C7                 4090         .word DOVAR 
      0098AB 81               [ 4] 4091         RET
                                   4092 
                                   4093 ;       VARIABLE        ( -- ; <string> )
                                   4094 ;       Compile a new variable
                                   4095 ;       initialized to 0.
      0098AC 98 96                 4096         .word      LINK
                           00182E  4097 LINK = . 
      0098AE 08                    4098         .byte      8
      0098AF 56 41 52 49 41 42 4C  4099         .ascii     "VARIABLE"
             45
      0098B7                       4100 VARIA:
                                   4101 ; indirect variable so that VARIABLE definition can be compiled in FLASH 
      0098B7 CD 8C 4F         [ 4] 4102         CALL HERE
      0098BA CD 86 1A         [ 4] 4103         CALL DUPP 
      0098BD CD 8A CA         [ 4] 4104         CALL CELLP
      0098C0 CD 87 68         [ 4] 4105         CALL VPP 
      0098C3 CD 85 5C         [ 4] 4106         CALL STORE
      0098C6 CD 98 9D         [ 4] 4107         CALL CREAT
      0098C9 CD 86 1A         [ 4] 4108         CALL DUPP
      0098CC CD 95 1F         [ 4] 4109         CALL COMMA
      0098CF CD 8B 61         [ 4] 4110         CALL ZERO
      0098D2 CD 86 2A         [ 4] 4111         call SWAPP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



      0098D5 CD 85 5C         [ 4] 4112         CALL STORE
      0098D8 CD A1 B3         [ 4] 4113         CALL FMOVE ; move definition to FLASH
      0098DB CD 87 C4         [ 4] 4114         CALL QDUP 
      0098DE CD 85 28         [ 4] 4115         CALL QBRAN 
      0098E1 98 EA                 4116         .word SET_RAMLAST   
      0098E3 CD 9C 5B         [ 4] 4117         call UPDATVP  ; don't update if variable kept in RAM.
      0098E6 CD A2 47         [ 4] 4118         CALL UPDATPTR
      0098E9 81               [ 4] 4119         RET         
      0098EA                       4120 SET_RAMLAST: 
      0098EA CD 87 86         [ 4] 4121         CALL LAST 
      0098ED CD 85 73         [ 4] 4122         CALL AT 
      0098F0 CD 87 99         [ 4] 4123         CALL RAMLAST 
      0098F3 CC 85 5C         [ 2] 4124         jp STORE  
                                   4125 
                                   4126 
                                   4127 ;       CONSTANT  ( n -- ; <string> )
                                   4128 ;       Compile a new constant 
                                   4129 ;       n CONSTANT name 
      0098F6 98 AE                 4130         .word LINK 
                           001878  4131         LINK=. 
      0098F8 08                    4132         .byte 8 
      0098F9 43 4F 4E 53 54 41 4E  4133         .ascii "CONSTANT" 
             54
      009901                       4134 CONSTANT:          
      009901 CD 91 D9         [ 4] 4135         CALL TOKEN
      009904 CD 97 12         [ 4] 4136         CALL SNAME 
      009907 CD 97 93         [ 4] 4137         CALL OVERT 
      00990A CD 95 64         [ 4] 4138         CALL COMPI 
      00990D 99 2B                 4139         .word DOCONST
      00990F CD 95 1F         [ 4] 4140         CALL COMMA 
      009912 CD A1 B3         [ 4] 4141         CALL FMOVE
      009915 CD 87 C4         [ 4] 4142         CALL QDUP 
      009918 CD 85 28         [ 4] 4143         CALL QBRAN 
      00991B 98 EA                 4144         .word SET_RAMLAST  
      00991D CD A2 47         [ 4] 4145         CALL UPDATPTR  
      009920 81               [ 4] 4146 1$:     RET          
                                   4147 
                                   4148 ; CONSTANT runtime semantic 
                                   4149 ; doCONST  ( -- n )
      009921 98 F8                 4150         .word LINK 
                           0018A3  4151         LINK=.
      009923 07                    4152         .byte 7
      009924 44 4F 43 4F 4E 53 54  4153         .ascii "DOCONST"
      00992B                       4154 DOCONST:
      00992B 1D 00 02         [ 2] 4155         subw x,#CELLL
      00992E 90 85            [ 2] 4156         popw y 
      009930 90 FE            [ 2] 4157         ldw y,(y) 
      009932 FF               [ 2] 4158         ldw (x),y 
      009933 81               [ 4] 4159         ret 
                                   4160 
                                   4161 ;----------------------------------
                                   4162 ; create double constant 
                                   4163 ; DCONST ( d -- ; <string> )
                                   4164 ;----------------------------------
      009934 99 23                 4165     .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



                           0018B6  4166     LINK=.
      009936 06                    4167     .byte 6 
      009937 44 43 4F 4E 53 54     4168     .ascii "DCONST"
      00993D                       4169 DCONST:
      00993D CD 91 D9         [ 4] 4170         CALL TOKEN
      009940 CD 97 12         [ 4] 4171         CALL SNAME 
      009943 CD 97 93         [ 4] 4172         CALL OVERT 
      009946 CD 95 64         [ 4] 4173         CALL COMPI 
      009949 99 6C                 4174         .word DO_DCONST
      00994B CD 95 1F         [ 4] 4175         CALL COMMA
      00994E CD 95 1F         [ 4] 4176         CALL COMMA  
      009951 CD A1 B3         [ 4] 4177         CALL FMOVE
      009954 CD 87 C4         [ 4] 4178         CALL QDUP 
      009957 CD 85 28         [ 4] 4179         CALL QBRAN 
      00995A 98 EA                 4180         .word SET_RAMLAST  
      00995C CD A2 47         [ 4] 4181         CALL UPDATPTR  
      00995F 81               [ 4] 4182 1$:     RET          
                                   4183     
                                   4184 ;----------------------------------
                                   4185 ; runtime for DCONST 
                                   4186 ; stack double constant 
                                   4187 ; DO-DCONST ( -- d )
                                   4188 ;-----------------------------------
      009960 99 36                 4189         .word LINK 
                           0018E2  4190         LINK=.
      009962 09                    4191         .byte 9 
      009963 44 4F 2D 44 43 4F 4E  4192         .ascii "DO-DCONST"
             53 54
      00996C                       4193 DO_DCONST:
      00996C 90 85            [ 2] 4194     popw y 
      00996E 90 BF 24         [ 2] 4195     ldw YTEMP,y 
      009971 1D 00 04         [ 2] 4196     subw x,#2*CELLL 
      009974 90 FE            [ 2] 4197     ldw y,(y)
      009976 FF               [ 2] 4198     ldw (x),y 
      009977 90 BE 24         [ 2] 4199     ldw y,YTEMP 
      00997A 90 EE 02         [ 2] 4200     ldw y,(2,y)
      00997D EF 02            [ 2] 4201     ldw (2,x),y 
      00997F 81               [ 4] 4202     ret 
                                   4203 
                                   4204 ;; Tools
                                   4205 
                                   4206 ;       _TYPE   ( b u -- )
                                   4207 ;       Display a string. Filter
                                   4208 ;       non-printing characters.
      009980 99 62                 4209         .word      LINK
                           001902  4210 LINK = . 
      009982 05                    4211         .byte      5
      009983 5F 54 59 50 45        4212         .ascii     "_TYPE"
      009988                       4213 UTYPE:
      009988 CD 85 E3         [ 4] 4214         CALL     TOR     ;start count down loop
      00998B 20 0F            [ 2] 4215         JRA     UTYP2   ;skip first pass
      00998D CD 86 1A         [ 4] 4216 UTYP1:  CALL     DUPP
      009990 CD 85 91         [ 4] 4217         CALL     CAT
      009993 CD 8B 8B         [ 4] 4218         CALL     TCHAR
      009996 CD 84 B4         [ 4] 4219         CALL     EMIT    ;display only printable
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



      009999 CD 8A F5         [ 4] 4220         CALL     ONEP    ;increment address
      00999C CD 85 09         [ 4] 4221 UTYP2:  CALL     DONXT
      00999F 99 8D                 4222         .word      UTYP1   ;loop till done
      0099A1 CC 86 10         [ 2] 4223         JP     DROP
                                   4224 
                                   4225 ;       dm+     ( a u -- a )
                                   4226 ;       Dump u bytes from ,
                                   4227 ;       leaving a+u on  stack.
      0099A4 99 82                 4228         .word      LINK
                           001926  4229 LINK = . 
      0099A6 03                    4230         .byte      3
      0099A7 64 6D 2B              4231         .ascii     "dm+"
      0099AA                       4232 DUMPP:
      0099AA CD 86 44         [ 4] 4233         CALL     OVER
      0099AD CD 84 F5         [ 4] 4234         CALL     DOLIT
      0099B0 00 04                 4235         .word      4
      0099B2 CD 90 2F         [ 4] 4236         CALL     UDOTR   ;display address
      0099B5 CD 8F 7F         [ 4] 4237         CALL     SPACE
      0099B8 CD 85 E3         [ 4] 4238         CALL     TOR     ;start count down loop
      0099BB 20 11            [ 2] 4239         JRA     PDUM2   ;skip first pass
      0099BD CD 86 1A         [ 4] 4240 PDUM1:  CALL     DUPP
      0099C0 CD 85 91         [ 4] 4241         CALL     CAT
      0099C3 CD 84 F5         [ 4] 4242         CALL     DOLIT
      0099C6 00 03                 4243         .word      3
      0099C8 CD 90 2F         [ 4] 4244         CALL     UDOTR   ;display numeric data
      0099CB CD 8A F5         [ 4] 4245         CALL     ONEP    ;increment address
      0099CE CD 85 09         [ 4] 4246 PDUM2:  CALL     DONXT
      0099D1 99 BD                 4247         .word      PDUM1   ;loop till done
      0099D3 81               [ 4] 4248         RET
                                   4249 
                                   4250 ;       DUMP    ( a u -- )
                                   4251 ;       Dump u bytes from a,
                                   4252 ;       in a formatted manner.
      0099D4 99 A6                 4253         .word      LINK
                           001956  4254 LINK = . 
      0099D6 04                    4255         .byte      4
      0099D7 44 55 4D 50           4256         .ascii     "DUMP"
      0099DB                       4257 DUMP:
      0099DB CD 86 D7         [ 4] 4258         CALL     BASE
      0099DE CD 85 73         [ 4] 4259         CALL     AT
      0099E1 CD 85 E3         [ 4] 4260         CALL     TOR
      0099E4 CD 8E 07         [ 4] 4261         CALL     HEX     ;save radix, set hex
      0099E7 CD 84 F5         [ 4] 4262         CALL     DOLIT
      0099EA 00 10                 4263         .word      16
      0099EC CD 8A 1B         [ 4] 4264         CALL     SLASH   ;change count to lines
      0099EF CD 85 E3         [ 4] 4265         CALL     TOR     ;start count down loop
      0099F2 CD 8F C7         [ 4] 4266 DUMP1:  CALL     CR
      0099F5 CD 84 F5         [ 4] 4267         CALL     DOLIT
      0099F8 00 10                 4268         .word      16
      0099FA CD 88 00         [ 4] 4269         CALL     DDUP
      0099FD CD 99 AA         [ 4] 4270         CALL     DUMPP   ;display numeric
      009A00 CD 87 D5         [ 4] 4271         CALL     ROT
      009A03 CD 87 D5         [ 4] 4272         CALL     ROT
      009A06 CD 8F 7F         [ 4] 4273         CALL     SPACE
      009A09 CD 8F 7F         [ 4] 4274         CALL     SPACE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



      009A0C CD 99 88         [ 4] 4275         CALL     UTYPE   ;display printable characters
      009A0F CD 85 09         [ 4] 4276         CALL     DONXT
      009A12 99 F2                 4277         .word      DUMP1   ;loop till done
      009A14 CD 86 10         [ 4] 4278 DUMP3:  CALL     DROP
      009A17 CD 85 C4         [ 4] 4279         CALL     RFROM
      009A1A CD 86 D7         [ 4] 4280         CALL     BASE
      009A1D CC 85 5C         [ 2] 4281         JP     STORE   ;restore radix
                                   4282 
                                   4283 ;       .S      ( ... -- ... )
                                   4284 ;        Display  contents of stack.
      009A20 99 D6                 4285         .word      LINK
                           0019A2  4286 LINK = . 
      009A22 02                    4287         .byte      2
      009A23 2E 53                 4288         .ascii     ".S"
      009A25                       4289 DOTS:
      009A25 CD 8F C7         [ 4] 4290         CALL     CR
      009A28 CD 8B A3         [ 4] 4291         CALL     DEPTH   ;stack depth
      009A2B CD 85 E3         [ 4] 4292         CALL     TOR     ;start count down loop
      009A2E 20 09            [ 2] 4293         JRA     DOTS2   ;skip first pass
      009A30 CD 85 D7         [ 4] 4294 DOTS1:  CALL     RAT
      009A33 CD 8B BA         [ 4] 4295 	CALL     PICK
      009A36 CD 90 62         [ 4] 4296         CALL     DOT     ;index stack, display contents
      009A39 CD 85 09         [ 4] 4297 DOTS2:  CALL     DONXT
      009A3C 9A 30                 4298         .word      DOTS1   ;loop till done
      009A3E CD 90 06         [ 4] 4299         CALL     DOTQP
      009A41 05                    4300         .byte      5
      009A42 20 3C 73 70 20        4301         .ascii     " <sp "
      009A47 81               [ 4] 4302         RET
                                   4303 
                                   4304 ;       >NAME   ( ca -- na | F )
                                   4305 ;       Convert code address
                                   4306 ;       to a name address.
      009A48 9A 22                 4307         .word      LINK
                           0019CA  4308 LINK = . 
      009A4A 05                    4309         .byte      5
      009A4B 3E 4E 41 4D 45        4310         .ascii     ">NAME"
      009A50                       4311 TNAME:
      009A50 CD 87 5A         [ 4] 4312         CALL     CNTXT   ;vocabulary link
      009A53 CD 85 73         [ 4] 4313 TNAM2:  CALL     AT
      009A56 CD 86 1A         [ 4] 4314         CALL     DUPP    ;?last word in a vocabulary
      009A59 CD 85 28         [ 4] 4315         CALL     QBRAN
      009A5C 9A 77                 4316         .word      TNAM4
      009A5E CD 88 00         [ 4] 4317         CALL     DDUP
      009A61 CD 91 E7         [ 4] 4318         CALL     NAMET
      009A64 CD 86 8F         [ 4] 4319         CALL     XORR    ;compare
      009A67 CD 85 28         [ 4] 4320         CALL     QBRAN
      009A6A 9A 71                 4321         .word      TNAM3
      009A6C CD 8A D9         [ 4] 4322         CALL     CELLM   ;continue with next word
      009A6F 20 E2            [ 2] 4323         JRA     TNAM2
      009A71 CD 86 2A         [ 4] 4324 TNAM3:  CALL     SWAPP
      009A74 CC 86 10         [ 2] 4325         JP     DROP
      009A77 CD 87 F5         [ 4] 4326 TNAM4:  CALL     DDROP
      009A7A CC 8B 61         [ 2] 4327         JP     ZERO
                                   4328 
                                   4329 ;       .ID     ( na -- )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



                                   4330 ;        Display  name at address.
      009A7D 9A 4A                 4331         .word      LINK
                           0019FF  4332 LINK = . 
      009A7F 03                    4333         .byte      3
      009A80 2E 49 44              4334         .ascii     ".ID"
      009A83                       4335 DOTID:
      009A83 CD 87 C4         [ 4] 4336         CALL     QDUP    ;if zero no name
      009A86 CD 85 28         [ 4] 4337         CALL     QBRAN
      009A89 9A 99                 4338         .word      DOTI1
      009A8B CD 8C 38         [ 4] 4339         CALL     COUNT
      009A8E CD 84 F5         [ 4] 4340         CALL     DOLIT
      009A91 00 1F                 4341         .word      0x1F
      009A93 CD 86 66         [ 4] 4342         CALL     ANDD    ;mask lexicon bits
      009A96 CC 99 88         [ 2] 4343         JP     UTYPE
      009A99 CD 90 06         [ 4] 4344 DOTI1:  CALL     DOTQP
      009A9C 09                    4345         .byte      9
      009A9D 20 6E 6F 4E 61 6D 65  4346         .ascii     " noName"
      009AA4 81               [ 4] 4347         RET
                                   4348 
                           000000  4349 WANT_SEE=0
                           000000  4350 .if WANT_SEE 
                                   4351 ;       SEE     ( -- ; <string> )
                                   4352 ;       A simple decompiler.
                                   4353 ;       Updated for byte machines.
                                   4354         .word      LINK
                                   4355 LINK = . 
                                   4356         .byte      3
                                   4357         .ascii     "SEE"
                                   4358 SEE:
                                   4359         CALL     TICK    ;starting address
                                   4360         CALL     CR
                                   4361         CALL     ONEM
                                   4362 SEE1:   CALL     ONEP
                                   4363         CALL     DUPP
                                   4364         CALL     AT
                                   4365         CALL     DUPP
                                   4366         CALL     QBRAN
                                   4367         .word    SEE2
                                   4368         CALL     TNAME   ;?is it a name
                                   4369 SEE2:   CALL     QDUP    ;name address or zero
                                   4370         CALL     QBRAN
                                   4371         .word    SEE3
                                   4372         CALL     SPACE
                                   4373         CALL     DOTID   ;display name
                                   4374         CALL     ONEP
                                   4375         JRA      SEE4
                                   4376 SEE3:   CALL     DUPP
                                   4377         CALL     CAT
                                   4378         CALL     UDOT    ;display number
                                   4379 SEE4:   CALL     NUFQ    ;user control
                                   4380         CALL     QBRAN
                                   4381         .word    SEE1
                                   4382         JP     DROP
                                   4383 .endif ; WANT_SEE 
                                   4384 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



                                   4385 ;       WORDS   ( -- )
                                   4386 ;       Display names in vocabulary.
      009AA5 9A 7F                 4387         .word      LINK
                           001A27  4388 LINK = . 
      009AA7 05                    4389         .byte      5
      009AA8 57 4F 52 44 53        4390         .ascii     "WORDS"
      009AAD                       4391 WORDS:
      009AAD CD 8F C7         [ 4] 4392         CALL     CR
      009AB0 CD 87 5A         [ 4] 4393         CALL     CNTXT   ;only in context
      009AB3 CD 85 73         [ 4] 4394 WORS1:  CALL     AT
      009AB6 CD 87 C4         [ 4] 4395         CALL     QDUP    ;?at end of list
      009AB9 CD 85 28         [ 4] 4396         CALL     QBRAN
      009ABC 9A CF                 4397         .word      WORS2
      009ABE CD 86 1A         [ 4] 4398         CALL     DUPP
      009AC1 CD 8F 7F         [ 4] 4399         CALL     SPACE
      009AC4 CD 9A 83         [ 4] 4400         CALL     DOTID   ;display a name
      009AC7 CD 8A D9         [ 4] 4401         CALL     CELLM
      009ACA CD 85 3F         [ 4] 4402         CALL     BRAN
      009ACD 9A B3                 4403         .word      WORS1
      009ACF 81               [ 4] 4404 WORS2:  RET
                                   4405 
                                   4406         
                                   4407 ;; Hardware reset
                                   4408 
                                   4409 ;       hi      ( -- )
                                   4410 ;       Display sign-on message.
      009AD0 9A A7                 4411         .word      LINK
                           001A52  4412 LINK = . 
      009AD2 02                    4413         .byte      2
      009AD3 68 69                 4414         .ascii     "hi"
      009AD5                       4415 HI:
      009AD5 CD 8F C7         [ 4] 4416         CALL     CR
      009AD8 CD 90 06         [ 4] 4417         CALL     DOTQP   ;initialize I/O
      009ADB 0F                    4418         .byte      15
      009ADC 73 74 6D 38 65 46 6F  4419         .ascii     "stm8eForth v"
             72 74 68 20 76
      009AE8 33                    4420 	.byte      VER+'0'
      009AE9 2E                    4421         .byte      '.' 
      009AEA 30                    4422 	.byte      EXT+'0' ;version
      009AEB CD 90 06         [ 4] 4423         CALL    DOTQP
                           000001  4424 .if NUCLEO          
      009AEE 12                    4425         .byte 18
      009AEF 20 6F 6E 20 4E 55 43  4426         .ascii  " on NUCLEO-8S208RB"
             4C 45 4F 2D 38 53 32
             30 38 52 42
                                   4427 .endif
                           000000  4428 .if DISCOVERY
                                   4429         .byte 19
                                   4430         .ascii  " on STM8S-DISCOVERY"
                                   4431 .endif
                           000000  4432 .if DOORBELL
                                   4433         .byte 16
                                   4434         .ascii " on stm8s105k6b6"
                                   4435 .endif
      009B01 CC 8F C7         [ 2] 4436         JP     CR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



                                   4437 
                           000000  4438 WANT_DEBUG=0
                           000000  4439 .if WANT_DEBUG 
                                   4440 ;       DEBUG      ( -- )
                                   4441 ;       Display sign-on message.
                                   4442 ;        .word      LINK
                                   4443 LINK = . 
                                   4444         .byte      5
                                   4445         .ascii     "DEBUG"
                                   4446 DEBUG:
                                   4447 	CALL DOLIT
                                   4448 	.word 0x65
                                   4449 	CALL EMIT
                                   4450 	CALL DOLIT
                                   4451 	.word 0
                                   4452  	CALL ZLESS 
                                   4453 	CALL DOLIT
                                   4454 	.word 0xFFFE
                                   4455 	CALL ZLESS 
                                   4456 	CALL UPLUS 
                                   4457  	CALL DROP 
                                   4458 	CALL DOLIT
                                   4459 	.word 3
                                   4460 	CALL UPLUS 
                                   4461 	CALL UPLUS 
                                   4462  	CALL DROP
                                   4463 	CALL DOLIT
                                   4464 	.word 0x43
                                   4465 	CALL UPLUS 
                                   4466  	CALL DROP
                                   4467 	CALL EMIT
                                   4468 	CALL DOLIT
                                   4469 	.word 0x4F
                                   4470 	CALL DOLIT
                                   4471 	.word 0x6F
                                   4472  	CALL XORR
                                   4473 	CALL DOLIT
                                   4474 	.word 0xF0
                                   4475  	CALL ANDD
                                   4476 	CALL DOLIT
                                   4477 	.word 0x4F
                                   4478  	CALL ORR
                                   4479 	CALL EMIT
                                   4480 	CALL DOLIT
                                   4481 	.word 8
                                   4482 	CALL DOLIT
                                   4483 	.word 6
                                   4484  	CALL SWAPP
                                   4485 	CALL OVER
                                   4486 	CALL XORR
                                   4487 	CALL DOLIT
                                   4488 	.word 3
                                   4489 	CALL ANDD 
                                   4490 	CALL ANDD
                                   4491 	CALL DOLIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



                                   4492 	.word 0x70
                                   4493 	CALL UPLUS 
                                   4494 	CALL DROP
                                   4495 	CALL EMIT
                                   4496 	CALL DOLIT
                                   4497 	.word 0
                                   4498 	CALL QBRAN
                                   4499 	.word DEBUG1
                                   4500 	CALL DOLIT
                                   4501 	.word 0x3F
                                   4502 DEBUG1:
                                   4503 	CALL DOLIT
                                   4504 	.word 0xFFFF
                                   4505 	CALL QBRAN
                                   4506 	.word DEBUG2
                                   4507 	CALL DOLIT
                                   4508 	.word 0x74
                                   4509 	CALL BRAN
                                   4510 	.word DEBUG3
                                   4511 DEBUG2:
                                   4512 	CALL DOLIT
                                   4513 	.word 0x21
                                   4514 DEBUG3:
                                   4515 	CALL EMIT
                                   4516 	CALL DOLIT
                                   4517 	.word 0x68
                                   4518 	CALL DOLIT
                                   4519 	.word 0x80
                                   4520 	CALL STORE
                                   4521 	CALL DOLIT
                                   4522 	.word 0x80
                                   4523 	CALL AT
                                   4524 	CALL EMIT
                                   4525 	CALL DOLIT
                                   4526 	.word 0x4D
                                   4527 	CALL TOR
                                   4528 	CALL RAT
                                   4529 	CALL RFROM
                                   4530 	CALL ANDD
                                   4531 	CALL EMIT
                                   4532 	CALL DOLIT
                                   4533 	.word 0x61
                                   4534 	CALL DOLIT
                                   4535 	.word 0xA
                                   4536 	CALL TOR
                                   4537 DEBUG4:
                                   4538 	CALL DOLIT
                                   4539 	.word 1
                                   4540 	CALL UPLUS 
                                   4541 	CALL DROP
                                   4542 	CALL DONXT
                                   4543 	.word DEBUG4
                                   4544 	CALL EMIT
                                   4545 	CALL DOLIT
                                   4546 	.word 0x656D
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



                                   4547 	CALL DOLIT
                                   4548 	.word 0x100
                                   4549 	CALL UMSTA
                                   4550 	CALL SWAPP
                                   4551 	CALL DOLIT
                                   4552 	.word 0x100
                                   4553 	CALL UMSTA
                                   4554 	CALL SWAPP 
                                   4555 	CALL DROP
                                   4556 	CALL EMIT
                                   4557 	CALL EMIT
                                   4558 	CALL DOLIT
                                   4559 	.word 0x2043
                                   4560 	CALL DOLIT
                                   4561 	.word 0
                                   4562 	CALL DOLIT
                                   4563 	.word 0x100
                                   4564 	CALL UMMOD
                                   4565 	CALL EMIT
                                   4566 	CALL EMIT
                                   4567 	;JP ORIG
                                   4568 	RET
                                   4569 .endif ; WANT_DEBUG 
                                   4570 
                                   4571 
                                   4572 ;       'BOOT   ( -- a )
                                   4573 ;       The application startup vector.
      009B04 9A D2                 4574         .word      LINK
                           001A86  4575 LINK = . 
      009B06 05                    4576         .byte      5
      009B07 27 42 4F 4F 54        4577         .ascii     "'BOOT"
      009B0C                       4578 TBOOT:
      009B0C CD 86 C7         [ 4] 4579         CALL     DOVAR
      009B0F 40 02                 4580         .word    APP_RUN      ;application to boot
                                   4581 
                                   4582 ;       COLD    ( -- )
                                   4583 ;       The hilevel cold start s=ence.
      009B11 9B 06                 4584         .word      LINK
                           001A93  4585         LINK = . 
      009B13 04                    4586         .byte      4
      009B14 43 4F 4C 44           4587         .ascii     "COLD"
      009B18                       4588 COLD:
                           000000  4589 .if WANT_DEBUG
                                   4590         CALL DEBUG
                                   4591 .endif ; WANT_DEBUG
      009B18 CD 84 F5         [ 4] 4592 COLD1:  CALL     DOLIT
      009B1B 80 AB                 4593         .word      UZERO
      009B1D CD 84 F5         [ 4] 4594 	CALL     DOLIT
      009B20 00 06                 4595         .word      UPP
      009B22 CD 84 F5         [ 4] 4596         CALL     DOLIT
      009B25 00 1A                 4597 	.word      UEND-UZERO
      009B27 CD 8C 9C         [ 4] 4598         CALL     CMOVE   ;initialize user area
                                   4599 
                                   4600 ; if APP_RUN==0 initialize with ca de 'hi'  
      009B2A 90 CE 40 02      [ 2] 4601         ldw y,APP_RUN 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      009B2E 26 0B            [ 1] 4602         jrne 0$
      009B30 1D 00 02         [ 2] 4603         subw x,#CELLL 
      009B33 90 AE 9A D5      [ 2] 4604         ldw y,#HI  
      009B37 FF               [ 2] 4605         ldw (x),y
      009B38 CD 9C 33         [ 4] 4606         call UPDATRUN 
      009B3B                       4607 0$:        
                                   4608 ; update LAST with APP_LAST 
                                   4609 ; if APP_LAST > LAST else do the opposite
      009B3B 90 CE 40 00      [ 2] 4610         ldw y,APP_LAST 
      009B3F 90 B3 1A         [ 2] 4611         cpw y,ULAST 
      009B42 22 05            [ 1] 4612         jrugt 1$ 
                                   4613 ; save LAST at APP_LAST  
      009B44 CD 9C 1B         [ 4] 4614         call UPDATLAST 
      009B47 20 06            [ 2] 4615         jra 2$
      009B49                       4616 1$: ; update LAST with APP_LAST 
      009B49 90 BF 1A         [ 2] 4617         ldw ULAST,y
      009B4C 90 BF 14         [ 2] 4618         ldw UCNTXT,y
      009B4F                       4619 2$:  
                                   4620 ; update APP_CP if < app_space 
      009B4F 90 CE 40 04      [ 2] 4621         ldw y,APP_CP  
      009B53 90 B3 18         [ 2] 4622         cpw y,UCP   
      009B56 24 06            [ 1] 4623         jruge 3$ 
      009B58 CD 9C 44         [ 4] 4624         call UPDATCP
      009B5B 90 BE 18         [ 2] 4625         ldw y,UCP   
      009B5E                       4626 3$:
      009B5E 90 BF 18         [ 2] 4627         ldw UCP,y                 
                                   4628 ; update UVP with APP_VP  
                                   4629 ; if APP_VP>UVP else do the opposite 
      009B61 90 CE 40 06      [ 2] 4630         ldw y,APP_VP 
      009B65 90 B3 16         [ 2] 4631         cpw y,UVP 
      009B68 22 05            [ 1] 4632         jrugt 4$
      009B6A CD 9C 5B         [ 4] 4633         call UPDATVP 
      009B6D 20 03            [ 2] 4634         jra 6$
      009B6F                       4635 4$: ; update UVP with APP_VP 
      009B6F 90 BF 16         [ 2] 4636         ldw UVP,y 
      009B72                       4637 6$:      
      009B72 CD 94 CA         [ 4] 4638         CALL     PRESE   ;initialize data stack and TIB
      009B75 CD 9B 0C         [ 4] 4639         CALL     TBOOT
      009B78 CD 8C 85         [ 4] 4640         CALL     ATEXE   ;application boot
      009B7B CD 97 93         [ 4] 4641         CALL     OVERT
      009B7E CC 94 E7         [ 2] 4642         JP     QUIT    ;start interpretation
                                   4643 
                                   4644 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



                                   4645         .include "flash.asm"
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
      009B81 9B 13                   30     .word LINK 
                           001B03    31     LINK=.
      009B83 03                      32     .byte 3 
      009B84 46 50 21                33     .ascii "FP!"
      009B87                         34 FPSTOR:
      009B87 90 93            [ 1]   35     ldw y,x
      009B89 90 FE            [ 2]   36     ldw y,(y)
      009B8B 90 9F            [ 1]   37     ld a,yl 
      009B8D B7 32            [ 1]   38     ld FPTR,a 
      009B8F 1C 00 02         [ 2]   39     addw x,#CELLL 
      009B92 90 93            [ 1]   40     ldw y,x 
      009B94 90 FE            [ 2]   41     ldw y,(y)
      009B96 90 BF 33         [ 2]   42     ldw PTR16,y
      009B99 1C 00 02         [ 2]   43     addw x,#CELLL 
      009B9C 81               [ 4]   44     ret 
                                     45 
                                     46 ;-----------------------------------
                                     47 ; return EEPROM base address 
                                     48 ; as a double 
                                     49 ;  EEPROM  ( -- ud )
                                     50 ;-----------------------------------
      009B9D 9B 83                   51     .word LINK 
                           001B1F    52 LINK=.
      009B9F 06                      53     .byte 6 
      009BA0 45 45 50 52 4F 4D       54     .ascii "EEPROM"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



      009BA6                         55 EEPROM: 
      009BA6 90 AE 40 00      [ 2]   56     ldw y,#EEPROM_BASE
      009BAA 1D 00 04         [ 2]   57     subw x,#2*CELLL 
      009BAD EF 02            [ 2]   58     ldw (2,x),y 
      009BAF 90 5F            [ 1]   59     clrw y 
      009BB1 FF               [ 2]   60     ldw (x),y 
      009BB2 81               [ 4]   61     ret
                                     62 
                                     63 ;---------------------------------
                                     64 ; return APP_LAST pointer as double
                                     65 ; EEP-LAST ( -- ud )
                                     66 ;---------------------------------
      009BB3 9B 9F                   67 	.word LINK 
                           001B35    68 	LINK=.
      009BB5 08                      69 	.byte 8 
      009BB6 45 45 50 2D 4C 41 53    70 	.ascii "EEP-LAST"
             54
      009BBE                         71 EEPLAST:
      009BBE 1D 00 04         [ 2]   72 	subw x,#2*CELLL 
      009BC1 90 AE 40 00      [ 2]   73 	ldw y,#APP_LAST 
      009BC5 EF 02            [ 2]   74 	ldw (2,x),y 
      009BC7 90 5F            [ 1]   75 	clrw y 
      009BC9 FF               [ 2]   76 	ldw (x),y 
      009BCA 81               [ 4]   77 	ret 
                                     78 
                                     79 ;----------------------------------
                                     80 ; return APP_RUN pointer as double	
                                     81 ; EEP-RUN ( -- ud )
                                     82 ;-----------------------------------
      009BCB 9B B5                   83 	.word LINK 
                           001B4D    84 	LINK=.
      009BCD 07                      85 	.byte 7
      009BCE 45 45 50 2D 52 55 4E    86 	.ascii "EEP-RUN"
      009BD5                         87 EEPRUN:
      009BD5 1D 00 04         [ 2]   88 	subw x,#2*CELLL 
      009BD8 90 AE 40 02      [ 2]   89 	ldw y,#APP_RUN 
      009BDC EF 02            [ 2]   90 	ldw (2,x),y 
      009BDE 90 5F            [ 1]   91 	clrw y 
      009BE0 FF               [ 2]   92 	ldw (x),y 
      009BE1 81               [ 4]   93 	ret 
                                     94 
                                     95 ;------------------------------------
                                     96 ; return APP_CP pointer as double 
                                     97 ; EEP-CP ( -- ud )
                                     98 ;------------------------------------
      009BE2 9B CD                   99 	.word LINK
                           001B64   100 	LINK=.
      009BE4 06                     101 	.byte 6 
      009BE5 45 45 50 2D 43 50      102 	.ascii "EEP-CP"
      009BEB                        103 EEPCP:
      009BEB 1D 00 04         [ 2]  104 	subw x,#2*CELLL 
      009BEE 90 AE 40 04      [ 2]  105 	ldw y,#APP_CP  
      009BF2 EF 02            [ 2]  106 	ldw (2,x),y 
      009BF4 90 5F            [ 1]  107 	clrw y 
      009BF6 FF               [ 2]  108 	ldw (x),y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



      009BF7 81               [ 4]  109 	ret 
                                    110 
                                    111 ;------------------------------------
                                    112 ; return APP_VP pointer as double 
                                    113 ; EEP-VP ( -- ud )
                                    114 ;-------------------------------------
      009BF8 9B E4                  115 	.word LINK
                           001B7A   116 	LINK=.
      009BFA 06                     117 	.byte 6
      009BFB 45 45 50 2D 56 50      118 	.ascii "EEP-VP"
      009C01                        119 EEPVP:
      009C01 1D 00 04         [ 2]  120 	subw x,#2*CELLL 
      009C04 90 AE 40 06      [ 2]  121 	ldw y,#APP_VP  
      009C08 EF 02            [ 2]  122 	ldw (2,x),y 
      009C0A 90 5F            [ 1]  123 	clrw y 
      009C0C FF               [ 2]  124 	ldw (x),y 
      009C0D 81               [ 4]  125 	ret 
                                    126 
                                    127 ;----------------------------------
                                    128 ; update APP_LAST with LAST 
                                    129 ; UPDAT-LAST ( -- )
                                    130 ;----------------------------------
      009C0E 9B FA                  131 	.word LINK 
                           001B90   132 	LINK=.
      009C10 0A                     133 	.byte 10
      009C11 55 50 44 41 54 2D 4C   134 	.ascii "UPDAT-LAST"
             41 53 54
      009C1B                        135 UPDATLAST:
      009C1B CD 87 86         [ 4]  136 	call LAST
      009C1E CD 85 73         [ 4]  137 	call AT  
      009C21 CD 9B BE         [ 4]  138 	call EEPLAST
      009C24 CC 9E 11         [ 2]  139 	jp EESTORE 
                                    140 
                                    141 ;---------------------------------
                                    142 ; update APP_RUN 
                                    143 ; UPDAT-RUN ( a -- )
                                    144 ;---------------------------------
      009C27 9C 10                  145 	.word LINK
                           001BA9   146 	LINK=.
      009C29 09                     147 	.byte 9
      009C2A 55 50 44 41 54 2D 52   148 	.ascii "UPDAT-RUN"
             55 4E
      009C33                        149 UPDATRUN:
      009C33 CD 9B D5         [ 4]  150 	call EEPRUN
      009C36 CC 9E 11         [ 2]  151 	jp EESTORE 
                                    152 	
                                    153 ;---------------------------------
                                    154 ; update APP_CP with CP 
                                    155 ; UPDAT-CP ( -- )
                                    156 ;---------------------------------
      009C39 9C 29                  157 	.word LINK 
                           001BBB   158 	LINK=.
      009C3B 08                     159 	.byte 8 
      009C3C 55 50 44 41 54 2D 43   160 	.ascii "UPDAT-CP"
             50
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      009C44                        161 UPDATCP:
      009C44 CD 87 76         [ 4]  162 	call CPP 
      009C47 CD 85 73         [ 4]  163 	call AT 
      009C4A CD 9B EB         [ 4]  164 	call EEPCP 
      009C4D CC 9E 11         [ 2]  165 	jp EESTORE 
                                    166 
                                    167 ;----------------------------------
                                    168 ; update APP_VP with VP 
                                    169 ; UPDAT-VP ( -- )
                                    170 ;----------------------------------
      009C50 9C 3B                  171 	.word LINK
                           001BD2   172 	LINK=.
      009C52 08                     173 	.byte 8 
      009C53 55 50 44 41 54 2D 56   174 	.ascii "UPDAT-VP" 
             50
      009C5B                        175 UPDATVP:
      009C5B CD 87 68         [ 4]  176 	call VPP 
      009C5E CD 85 73         [ 4]  177 	call AT
      009C61 CD 9C 01         [ 4]  178 	call EEPVP 
      009C64 CC 9E 11         [ 2]  179 	jp EESTORE
                                    180 	
                           000001   181 .if NUCLEO
                                    182 ;----------------------------------
                                    183 ; fetch integer at address over 65535
                                    184 ;  F@   ( ud -- n )
                                    185 ;----------------------------------
      009C67 9C 52                  186     .word LINK 
                           001BE9   187 LINK=.
      009C69 02                     188     .byte 2
      009C6A 46 40                  189     .ascii "F@"
      009C6C                        190 FARAT:
      009C6C CD 9B 87         [ 4]  191     call FPSTOR
      009C6F CC 9D 34         [ 2]  192 	jp EE_READ 
                                    193 
                                    194 
                                    195 ;-------------------------------------
                                    196 ; fetch C at address over 65535 
                                    197 ; FC@ ( ud -- c)
                                    198 ;-------------------------------------
      009C72 9C 69                  199     .word LINK
                           001BF4   200     LINK=.
      009C74 03                     201     .byte 3 
      009C75 46 43 40               202     .ascii "FC@" 
      009C78                        203 FARCAT:
      009C78 CD 9B 87         [ 4]  204     call FPSTOR
      009C7B CC 9D 56         [ 2]  205 	jp EE_CREAD  
                                    206 .endif ; NUCLEO 
                                    207 
                                    208 ;----------------------------------
                                    209 ; UNLOCK EEPROM/OPT for writing/erasing
                                    210 ; wait endlessly for FLASH_IAPSR_DUL bit.
                                    211 ;  UNLKEE   ( -- )
                                    212 ;----------------------------------
      009C7E 9C 74                  213     .word LINK 
                           001C00   214 LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



      009C80 06                     215     .byte 6 
      009C81 55 4E 4C 4B 45 45      216     .ascii "UNLKEE"
      009C87                        217 UNLKEE:
      009C87 35 00 50 5B      [ 1]  218 	mov FLASH_CR2,#0 
      009C8B 35 FF 50 5C      [ 1]  219 	mov FLASH_NCR2,#0xFF 
      009C8F 35 AE 50 64      [ 1]  220 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      009C93 35 56 50 64      [ 1]  221     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      009C97 72 07 50 5F FB   [ 2]  222 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      009C9C 81               [ 4]  223 	ret
                                    224 
                                    225 ;----------------------------------
                                    226 ; UNLOCK FLASH for writing/erasing
                                    227 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                    228 ; UNLKFL  ( -- )
                                    229 ;----------------------------------
      009C9D 9C 80                  230     .word LINK 
                           001C1F   231 LINK=. 
      009C9F 06                     232     .byte 6 
      009CA0 55 4E 4C 4B 46 4C      233     .ascii "UNLKFL"    
      009CA6                        234 UNLKFL:
      009CA6 35 00 50 5B      [ 1]  235 	mov FLASH_CR2,#0 
      009CAA 35 FF 50 5C      [ 1]  236 	mov FLASH_NCR2,#0xFF 
      009CAE 35 56 50 62      [ 1]  237 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      009CB2 35 AE 50 62      [ 1]  238 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      009CB6 72 03 50 5F FB   [ 2]  239 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      009CBB 81               [ 4]  240 	ret
                                    241 
                                    242 ;-----------------------------
                                    243 ; UNLOCK FLASH or EEPROM 
                                    244 ; according to FPTR address 
                                    245 ;  UNLOCK ( -- )
                                    246 ;-----------------------------
      009CBC 9C 9F                  247 	.word LINK 
                           001C3E   248 	LINK=.
      009CBE 06                     249 	.byte 6
      009CBF 55 4E 4C 4F 43 4B      250 	.ascii "UNLOCK"
      009CC5                        251 UNLOCK:
                                    252 ; put addr[15:0] in Y, for bounds check.
      009CC5 90 BE 33         [ 2]  253 	ldw y,PTR16   ; Y=addr15:0
                                    254 ; check addr[23:16], if <> 0 then it is extened flash memory
      009CC8 3D 32            [ 1]  255 	tnz FPTR 
      009CCA 26 16            [ 1]  256 	jrne 4$
      009CCC 90 A3 80 00      [ 2]  257     cpw y,#FLASH_BASE
      009CD0 24 10            [ 1]  258     jruge 4$
      009CD2 90 A3 40 00      [ 2]  259 	cpw y,#EEPROM_BASE  
      009CD6 25 0D            [ 1]  260     jrult 9$
      009CD8 90 A3 48 7F      [ 2]  261 	cpw y,#OPTION_END 
      009CDC 22 07            [ 1]  262 	jrugt 9$
      009CDE CD 9C 87         [ 4]  263 	call UNLKEE
      009CE1 81               [ 4]  264 	ret 
      009CE2 CD 9C A6         [ 4]  265 4$: call UNLKFL
      009CE5 81               [ 4]  266 9$: ret 
                                    267 
                                    268 ;-------------------------
                                    269 ; LOCK write access to 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



                                    270 ; FLASH and EEPROM 
                                    271 ; LOCK ( -- )
                                    272 ;-------------------------
      009CE6 9C BE                  273 	.word LINK 
                           001C68   274 	LINK=.
      009CE8 04                     275 	.byte 4 
      009CE9 4C 4F 43 4B            276 	.ascii "LOCK" 
      009CED                        277 LOCK: 
      009CED 72 13 50 5F      [ 1]  278 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      009CF1 72 17 50 5F      [ 1]  279 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009CF5 81               [ 4]  280 	ret 
                                    281 
                                    282 ;-------------------------
                                    283 ; increment FPTR 
                                    284 ; INC-FPTR ( -- )
                                    285 ;-------------------------
      009CF6 9C E8                  286 	.word LINK 
                           001C78   287 	LINK=. 
      009CF8 08                     288 	.byte 8 
      009CF9 49 4E 43 2D 46 50 54   289 	.ascii "INC-FPTR" 
             52
      009D01                        290 INC_FPTR:
      009D01 3C 34            [ 1]  291 	inc PTR8 
      009D03 26 0C            [ 1]  292 	jrne 1$
      009D05 90 89            [ 2]  293 	pushw y 
      009D07 90 BE 32         [ 2]  294 	ldw y,FPTR 
      009D0A 90 5C            [ 1]  295 	incw y 
      009D0C 90 BF 32         [ 2]  296 	ldw FPTR,y
      009D0F 90 85            [ 2]  297 	popw y  
      009D11 81               [ 4]  298 1$: ret 
                                    299 
                                    300 ;------------------------------
                                    301 ; add u to FPTR 
                                    302 ; PTR+ ( u -- )
                                    303 ;------------------------------
      009D12 9C F8                  304 	.word LINK 
                           001C94   305 	LINK=.
      009D14 04                     306 	.byte 4 
      009D15 50 54 52 2B            307 	.ascii "PTR+"
      009D19                        308 PTRPLUS:
      009D19 90 93            [ 1]  309 	ldw y,x 
      009D1B 1C 00 02         [ 2]  310 	addw x,#CELLL 
      009D1E 72 B9 00 33      [ 2]  311 	addw y,PTR16 
      009D22 90 BF 33         [ 2]  312 	ldw PTR16,y  
      009D25 24 02            [ 1]  313 	jrnc 1$
      009D27 3C 32            [ 1]  314 	inc FPTR 
      009D29 81               [ 4]  315 1$: ret 
                                    316 
                                    317 ;---------------------------------
                                    318 ; read word at address pointed FPTR
                                    319 ; increment FPTR 
                                    320 ; EE-READ ( -- w )
                                    321 ;------------------------------------
      009D2A 9D 14                  322 	.word LINK 
                           001CAC   323 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      009D2C 07                     324 	.byte 7 
      009D2D 45 45 2D 52 45 41 44   325 	.ascii "EE-READ"
      009D34                        326 EE_READ:
      009D34 1D 00 02         [ 2]  327 	subw x,#CELLL 
      009D37 92 BC 00 32      [ 5]  328 	ldf a,[FPTR]
      009D3B 90 95            [ 1]  329 	ld yh,a 
      009D3D CD 9D 01         [ 4]  330 	call INC_FPTR 
      009D40 92 BC 00 32      [ 5]  331 	ldf a,[FPTR]
      009D44 CD 9D 01         [ 4]  332 	call INC_FPTR 
      009D47 90 97            [ 1]  333 	ld yl,a 
      009D49 FF               [ 2]  334 	ldw (x),y 
      009D4A 81               [ 4]  335 	ret 
                                    336 
                                    337 ;---------------------------------------
                                    338 ; Read byte at address pointed by FPTR 
                                    339 ; EE-CREAD ( -- c )
                                    340 ;---------------------------------------
      009D4B 9D 2C                  341 	.word LINK 
                           001CCD   342 	LINK=.
      009D4D 08                     343 	.byte 8
      009D4E 45 45 2D 43 52 45 41   344 	.ascii "EE-CREAD" 
             44
      009D56                        345 EE_CREAD:
      009D56 1D 00 02         [ 2]  346 	subw x,#CELLL 
      009D59 92 BC 00 32      [ 5]  347 	ldf a,[FPTR]	
      009D5D CD 9D 01         [ 4]  348 	call INC_FPTR
      009D60 90 5F            [ 1]  349 	clrw y 
      009D62 90 97            [ 1]  350 	ld yl,a 
      009D64 FF               [ 2]  351 	ldw (x),y 
      009D65 81               [ 4]  352 	ret 
                                    353 
                                    354 ;----------------------------
                                    355 ; write a byte at address pointed 
                                    356 ; by FPTR and increment FPTR.
                                    357 ; Expect pointer already initialized 
                                    358 ; and memory unlocked 
                                    359 ; WR-BYTE ( c -- )
                                    360 ;----------------------------
      009D66 9D 4D                  361 	.word LINK 
                           001CE8   362 	LINK=. 
      009D68 07                     363 	.byte 7 
      009D69 57 52 2D 42 59 54 45   364 	.ascii "WR-BYTE" 
                                    365 
      009D70                        366 WR_BYTE:
      009D70 CD 84 E1         [ 4]  367 	call FC_XOFF
      009D73 90 93            [ 1]  368 	ldw y,x 
      009D75 90 FE            [ 2]  369 	ldw y,(y)
      009D77 1C 00 02         [ 2]  370 	addw x,#CELLL 
      009D7A 90 9F            [ 1]  371 	ld a,yl
      009D7C 92 BD 00 32      [ 4]  372 	ldf [FPTR],a
      009D80 72 05 50 5F FB   [ 2]  373 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009D85 CD 84 CB         [ 4]  374 	call FC_XON
      009D88 CC 9D 01         [ 2]  375 	jp INC_FPTR 
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
      009D8B 9D 68                  384 	.word LINK 
                           001D0D   385 	LINK=.
      009D8D 07                     386 	.byte 7 
      009D8E 57 52 2D 57 4F 52 44   387 	.ascii "WR-WORD" 
      009D95                        388 WR_WORD:
      009D95 CD 84 E1         [ 4]  389 	call FC_XOFF
      009D98 90 93            [ 1]  390 	ldw y,x
      009D9A 90 FE            [ 2]  391 	ldw y,(y)
      009D9C 1C 00 02         [ 2]  392 	addw x,#CELLL 
      009D9F 90 9E            [ 1]  393 	ld a,yh 
      009DA1 92 BD 00 32      [ 4]  394 	ldf [FPTR],a
      009DA5 72 05 50 5F FB   [ 2]  395 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009DAA CD 9D 01         [ 4]  396 	call INC_FPTR 
      009DAD 90 9F            [ 1]  397 	ld a,yl 
      009DAF 92 BD 00 32      [ 4]  398 	ldf [FPTR],a
      009DB3 72 05 50 5F FB   [ 2]  399 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009DB8 CD 84 CB         [ 4]  400 	call FC_XON
      009DBB CC 9D 01         [ 2]  401 	jp INC_FPTR 
                                    402 
                                    403 
                                    404 ;---------------------------------------
                                    405 ; write a byte to FLASH or EEPROM/OPTION  
                                    406 ; EEC!  (c ud -- )
                                    407 ;---------------------------------------
      009DBE 9D 8D                  408     .word LINK 
                           001D40   409 	LINK=.
      009DC0 04                     410     .byte 4 
      009DC1 45 45 43 21            411     .ascii "EEC!"
                                    412 	; local variables 
                           000001   413 	BTW = 1   ; byte to write offset on stack
                           000002   414     OPT = 2 
                           000002   415 	VSIZE = 2
      009DC5                        416 EECSTORE:
      009DC5 52 02            [ 2]  417 	sub sp,#VSIZE
      009DC7 CD 9B 87         [ 4]  418     call FPSTOR
      009DCA E6 01            [ 1]  419 	ld a,(1,x)
      009DCC 43               [ 1]  420 	cpl a 
      009DCD 6B 01            [ 1]  421 	ld (BTW,sp),a ; byte to write 
      009DCF 0F 02            [ 1]  422 	clr (OPT,sp)  ; OPTION flag
      009DD1 CD 9C C5         [ 4]  423 	call UNLOCK 
                                    424 	; check if option
      009DD4 3D 32            [ 1]  425 	tnz FPTR 
      009DD6 26 19            [ 1]  426 	jrne 2$
      009DD8 90 BE 33         [ 2]  427 	ldw y,PTR16 
      009DDB 90 A3 48 00      [ 2]  428 	cpw y,#OPTION_BASE
      009DDF 2B 10            [ 1]  429 	jrmi 2$
      009DE1 90 A3 48 80      [ 2]  430 	cpw y,#OPTION_END+1
      009DE5 2A 0A            [ 1]  431 	jrpl 2$
      009DE7 03 02            [ 1]  432 	cpl (OPT,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



                                    433 	; OPTION WRITE require this UNLOCK 
      009DE9 72 1E 50 5B      [ 1]  434     bset FLASH_CR2,#FLASH_CR2_OPT
      009DED 72 1F 50 5C      [ 1]  435     bres FLASH_NCR2,#FLASH_CR2_OPT 
      009DF1                        436 2$: 
      009DF1 CD 9D 70         [ 4]  437 	call WR_BYTE 	
      009DF4 0D 02            [ 1]  438 	tnz (OPT,sp)
      009DF6 27 0D            [ 1]  439 	jreq 3$ 
      009DF8 7B 01            [ 1]  440     ld a,(BTW,sp)
      009DFA 90 5F            [ 1]  441     clrw y
      009DFC 90 97            [ 1]  442 	ld yl,a 
      009DFE 1D 00 02         [ 2]  443 	subw x,#CELLL 
      009E01 FF               [ 2]  444 	ldw (x),y 
      009E02 CD 9D 70         [ 4]  445 	call WR_BYTE
      009E05                        446 3$: 
      009E05 CD 9C ED         [ 4]  447 	call LOCK 
      009E08 5B 02            [ 2]  448 	addw sp,#VSIZE 
      009E0A 81               [ 4]  449     ret
                                    450 
                                    451 ;------------------------------
                                    452 ; write integer in FLASH|EEPROM
                                    453 ; EE! ( n ud -- )
                                    454 ;------------------------------
      009E0B 9D C0                  455 	.word LINK 
                           001D8D   456 	LINK=.
      009E0D 03                     457 	.byte 3 
      009E0E 45 45 21               458 	.ascii "EE!"
      009E11                        459 EESTORE:
      009E11 CD 9B 87         [ 4]  460 	call FPSTOR 
      009E14 CD 9C C5         [ 4]  461 	call UNLOCK 
      009E17 90 93            [ 1]  462 	ldw y,x 
      009E19 90 FE            [ 2]  463 	ldw y,(y)
      009E1B 90 89            [ 2]  464 	pushw y 
      009E1D 90 5E            [ 1]  465 	swapw y 
      009E1F FF               [ 2]  466 	ldw (x),y 
      009E20 CD 9D 70         [ 4]  467 	call WR_BYTE 
      009E23 90 85            [ 2]  468 	popw y 
      009E25 1D 00 02         [ 2]  469 	subw x,#CELLL
      009E28 FF               [ 2]  470 	ldw (x),y 
      009E29 CD 9D 70         [ 4]  471 	call WR_BYTE
      009E2C CC 9C ED         [ 2]  472 	jp LOCK 
                                    473 
                                    474 
                                    475 ;----------------------------
                                    476 ; Erase flash memory row 
                                    477 ; stm8s208 as 128 bytes rows
                                    478 ; ROW-ERASE ( ud -- )
                                    479 ;----------------------------
      009E2F 9E 0D                  480 	.word LINK 
                           001DB1   481 	LINK=. 
      009E31 09                     482 	.byte 9 
      009E32 52 4F 57 2D 45 52 41   483 	.ascii "ROW-ERASE" 
             53 45
      009E3B                        484 row_erase:
      009E3B CD 84 E1         [ 4]  485 	call FC_XOFF
      009E3E CD 9B 87         [ 4]  486 	call FPSTOR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



                                    487 ;code must be execute from RAM 
                                    488 ;copy routine to PAD 
      009E41 1D 00 02         [ 2]  489 	subw x,#CELLL 
      009E44 90 AE 9E 94      [ 2]  490 	ldw y,#row_erase_proc
      009E48 FF               [ 2]  491 	ldw (x),y 
      009E49 CD 8C 60         [ 4]  492 	call PAD 
      009E4C 90 AE 9E BB      [ 2]  493 	ldw y,#row_erase_proc_end 
      009E50 72 A2 9E 94      [ 2]  494 	subw y,#row_erase_proc
      009E54 1D 00 02         [ 2]  495 	subw x,#CELLL 
      009E57 FF               [ 2]  496 	ldw (x),y 
      009E58 CD 8C 9C         [ 4]  497 	call CMOVE 
      009E5B                        498 block_erase:
      009E5B 90 BE 33         [ 2]  499 	ldw y,FPTR+1
      009E5E 90 A3 A4 80      [ 2]  500 	cpw y,#app_space 
      009E62 2A 19            [ 1]  501 	jrpl erase_flash 
                                    502 ; erase EEPROM block
      009E64 90 A3 40 00      [ 2]  503 	cpw y,#EEPROM_BASE 
      009E68 24 04            [ 1]  504 	jruge 1$
      009E6A CD 84 CB         [ 4]  505 	call FC_XON
      009E6D 81               [ 4]  506 	ret ; bad address 
      009E6E 90 A3 47 FF      [ 2]  507 1$: cpw y,#EEPROM_END 
      009E72 23 04            [ 2]  508 	jrule 2$ 
      009E74 CD 84 CB         [ 4]  509 	call FC_XON
      009E77 81               [ 4]  510 	ret ; bad address 
      009E78                        511 2$:	
      009E78 CD 9C 87         [ 4]  512 	call UNLKEE 
      009E7B 20 03            [ 2]  513 	jra proceed_erase
                                    514 ; erase flash block:
      009E7D                        515 erase_flash:
      009E7D CD 9C A6         [ 4]  516 	call UNLKFL 
      009E80                        517 proceed_erase:
      009E80 CD 8C 60         [ 4]  518 	call PAD 
      009E83 90 93            [ 1]  519 	ldw y,x
      009E85 90 FE            [ 2]  520 	ldw y,(y)
      009E87 1C 00 02         [ 2]  521 	addw x,#CELLL  
      009E8A 90 FD            [ 4]  522 	call (y) 
      009E8C 72 17 50 5F      [ 1]  523 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009E90 CD 84 CB         [ 4]  524 	call FC_XON
      009E93 81               [ 4]  525 	ret 
                                    526 
                                    527 ; this routine is to be copied to PAD 
      009E94                        528 row_erase_proc:
      009E94 35 20 50 5B      [ 1]  529 	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
      009E98 35 DF 50 5C      [ 1]  530 	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
      009E9C 4F               [ 1]  531 	clr a 
      009E9D 90 5F            [ 1]  532 	clrw y 
      009E9F 91 A7 00 32      [ 1]  533 	ldf ([FPTR],y),a
      009EA3 90 5C            [ 1]  534     incw y
      009EA5 91 A7 00 32      [ 1]  535 	ldf ([FPTR],y),a
      009EA9 90 5C            [ 1]  536     incw y
      009EAB 91 A7 00 32      [ 1]  537 	ldf ([FPTR],y),a
      009EAF 90 5C            [ 1]  538     incw y
      009EB1 91 A7 00 32      [ 1]  539 	ldf ([FPTR],y),a
      009EB5 72 05 50 5F FB   [ 2]  540 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009EBA 81               [ 4]  541 	ret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



      009EBB                        542 row_erase_proc_end:
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
      009EBB                        555 copy_buffer:
      009EBB 4B 80            [ 1]  556 	push #BLOCK_SIZE  
                                    557 ;enable block programming 
      009EBD 72 10 50 5B      [ 1]  558 	bset FLASH_CR2,#FLASH_CR2_PRG 
      009EC1 72 11 50 5C      [ 1]  559 	bres FLASH_NCR2,#FLASH_CR2_PRG
      009EC5 90 5F            [ 1]  560 	clrw y
      009EC7 F6               [ 1]  561 1$:	ld a,(x)
      009EC8 91 A7 00 32      [ 1]  562 	ldf ([FPTR],y),a
      009ECC 5C               [ 1]  563 	incw x 
      009ECD 90 5C            [ 1]  564 	incw y 
      009ECF 0A 01            [ 1]  565 	dec (BCNT,sp)
      009ED1 26 F4            [ 1]  566 	jrne 1$
                                    567 ; wait EOP bit 
      009ED3 72 05 50 5F FB   [ 2]  568 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. 
      009ED8 84               [ 1]  569 	pop a ; remove BCNT from stack 
      009ED9 81               [ 4]  570 	ret 
      009EDA                        571 copy_buffer_end:
                                    572 
                                    573 ;-------------------------
                                    574 ; move program_row to RAM 
                                    575 ; in TIB 
                                    576 ;------------------------
      009EDA                        577 copy_prog_to_ram:
      009EDA 1D 00 06         [ 2]  578 	subw x,#6
      009EDD 90 AE 9E BB      [ 2]  579 	ldw y,#copy_buffer 
      009EE1 EF 04            [ 2]  580 	ldw (4,x),y 
      009EE3 90 AE 17 00      [ 2]  581 	ldw y,#TIBBASE
      009EE7 EF 02            [ 2]  582 	ldw (2,x),y 
      009EE9 90 AE 9E DA      [ 2]  583 	ldw y,#copy_buffer_end 
      009EED 72 A2 9E BB      [ 2]  584 	subw y,#copy_buffer  
      009EF1 FF               [ 2]  585 	ldw (x),y 
      009EF2 CD 8C 9C         [ 4]  586 	call CMOVE 
      009EF5 81               [ 4]  587 	ret 
                                    588 
                                    589 
                                    590 ;-----------------------------
                                    591 ; write a row in FLASH/EEPROM 
                                    592 ; WR-ROW ( a ud -- )
                                    593 ; a -> address 128 byte buffer to write 
                                    594 ; ud ->  row address in FLASH|EEPROM 
                                    595 ;-----------------------------
      009EF6 9E 31                  596 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



                           001E78   597 	LINK=.
      009EF8 06                     598 	.byte 6 
      009EF9 57 52 2D 52 4F 57      599 	.ascii "WR-ROW"
      009EFF                        600 write_row:
      009EFF CD 84 E1         [ 4]  601 	call FC_XOFF
      009F02 CD 9B 87         [ 4]  602 	call FPSTOR
                                    603 ; align to FLASH block 
      009F05 A6 80            [ 1]  604 	ld a,#0x80 
      009F07 B4 34            [ 1]  605 	and a,PTR8 
      009F09 B7 34            [ 1]  606 	ld PTR8,a  
      009F0B CD 9E DA         [ 4]  607 	call copy_prog_to_ram
      009F0E CD 9C C5         [ 4]  608 	call UNLOCK
      009F11 90 93            [ 1]  609 	ldw y,x 
      009F13 90 FE            [ 2]  610 	ldw y,(y)
      009F15 1C 00 02         [ 2]  611 	addw x,#CELLL 
      009F18 89               [ 2]  612 	pushw x 
      009F19 93               [ 1]  613 	ldw x,y ; buffer address in x 
      009F1A CD 17 00         [ 4]  614 	call TIBBASE
      009F1D CD 9C ED         [ 4]  615 	call LOCK
      009F20 85               [ 2]  616 	popw x 
      009F21 CD 84 CB         [ 4]  617 	call FC_XON 
      009F24 81               [ 4]  618 	ret 
                                    619 
                                    620 ;-------------------------------------
                                    621 ; change value of OPTION register 
                                    622 ; SET-OPT (c n -- ) 
                                    623 ; c new value.
                                    624 ; n OPT  number {1..7}
                                    625 ;--------------------------------------
      009F25 9E F8                  626 		.word LINK 
                           001EA7   627 		LINK=.
      009F27 07                     628 		.byte 7 
      009F28 53 45 54 2D 4F 50 54   629 		.ascii "SET-OPT" 
      009F2F                        630 set_option: 
      009F2F 90 93            [ 1]  631 		ldw y,x 
      009F31 90 FE            [ 2]  632 		ldw y,(y)
      009F33 27 06            [ 1]  633 		jreq 1$
      009F35 90 A3 00 07      [ 2]  634 		cpw y,#7 
      009F39 23 04            [ 2]  635 		jrule 2$ 
                                    636 ; invalid OPTION number 		
      009F3B 1C 00 04         [ 2]  637 1$:		addw x,#2*CELLL
      009F3E 81               [ 4]  638 		ret
      009F3F 90 58            [ 2]  639 2$:		sllw y 
      009F41 72 A9 47 FF      [ 2]  640 		addw y,#OPTION_BASE-1
      009F45 FF               [ 2]  641 		ldw (x),y 
      009F46 1D 00 02         [ 2]  642 		subw x,#CELLL 
      009F49 90 5F            [ 1]  643 		clrw y 
      009F4B FF               [ 2]  644 		ldw (x),y 
      009F4C CD 9D C5         [ 4]  645 		call EECSTORE
      009F4F 81               [ 4]  646 		ret 
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
      009F50 9F 27                  655 	.word LINK  
                           001ED2   656 	LINK=.
      009F52 08                     657 	.byte 8 
      009F53 50 52 49 53 54 49 4E   658 	.ascii "PRISTINE"
             45
      009F5B                        659 pristine:
                                    660 ;;; erase EEPROM
      009F5B CD 9B A6         [ 4]  661 	call EEPROM 
      009F5E CD 88 00         [ 4]  662 1$:	call DDUP 
      009F61 CD 9E 3B         [ 4]  663 	call row_erase
      009F64 90 93            [ 1]  664 	ldw y,x 
      009F66 90 EE 02         [ 2]  665 	ldw y,(2,y)
      009F69 72 A9 00 80      [ 2]  666 	addw y,#BLOCK_SIZE
      009F6D EF 02            [ 2]  667 	ldw (2,x),y
      009F6F 90 A3 48 00      [ 2]  668 	cpw y,#OPTION_BASE 
      009F73 25 E9            [ 1]  669 	jrult 1$
                                    670 ;;; reset OPTION to default values
      009F75 90 AE 00 01      [ 2]  671 	ldw y,#1 ; OPT1 
      009F79 FF               [ 2]  672 2$:	ldw (x),y   
      009F7A 90 5F            [ 1]  673 	clrw y 
      009F7C EF 02            [ 2]  674 	ldw (2,x),y  ; ( 0 1 -- ) 
      009F7E CD 88 00         [ 4]  675 	call DDUP    ; ( 0 1 0 1 -- )  
      009F81 CD 9F 2F         [ 4]  676 	call set_option
      009F84 90 93            [ 1]  677 	ldw y,x 
      009F86 90 FE            [ 2]  678 	ldw y,(y)
      009F88 90 5C            [ 1]  679 	incw y  ; next OPTION 
      009F8A 90 A3 00 08      [ 2]  680 	cpw y,#8 
      009F8E 25 E9            [ 1]  681 	jrult 2$
                                    682 ;;; erase first row of app_space 	
      009F90 90 AE A4 80      [ 2]  683 	ldw y,#app_space
      009F94 EF 02            [ 2]  684 	ldw (2,x),y  
      009F96 90 5F            [ 1]  685 	clrw y 
      009F98 FF               [ 2]  686 	ldw (x),y ; ( app_space 0 -- )
      009F99 CD 9E 3B         [ 4]  687 	call row_erase 
                                    688 ; reset interrupt vectors 
      009F9C 1D 00 02         [ 2]  689 	subw x,#CELLL 
      009F9F 90 5F            [ 1]  690 	clrw y  
      009FA1 FF               [ 2]  691 4$:	ldw (x),y  ; ( n -- ) int# 
      009FA2 CD 86 1A         [ 4]  692 	call DUPP  
      009FA5 CD 9F C2         [ 4]  693 	call reset_vector
      009FA8 90 93            [ 1]  694 	ldw y,x 
      009FAA 90 FE            [ 2]  695 	ldw y,(y)
      009FAC 90 5C            [ 1]  696 	incw y   ; next vector 
      009FAE 90 A3 00 19      [ 2]  697 	cpw y,#25 
      009FB2 25 ED            [ 1]  698 	jrult 4$
      009FB4 CC 80 80         [ 2]  699 	jp NonHandledInterrupt ; reset MCU
                                    700 
                                    701 ;------------------------------
                                    702 ; reset an interrupt vector 
                                    703 ; to its initial value 
                                    704 ; i.e. NonHandledInterrupt
                                    705 ; RST-IVEC ( n -- )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



                                    706 ;-----------------------------
      009FB7 9F 52                  707 	.word LINK 
                           001F39   708 	LINK=. 
      009FB9 08                     709 	.byte 8 
      009FBA 52 53 54 2D 49 56 45   710 	.ascii "RST-IVEC"
             43
      009FC2                        711 reset_vector:
      009FC2 90 93            [ 1]  712 	ldw y,x
      009FC4 1C 00 02         [ 2]  713 	addw x,#CELLL 
      009FC7 90 FE            [ 2]  714 	ldw y,(y)
      009FC9 90 A3 00 17      [ 2]  715 	cpw y,#23 
      009FCD 27 3A            [ 1]  716 	jreq 9$
      009FCF 90 A3 00 1D      [ 2]  717 	cpw y,#29 ; last vector
      009FD3 22 34            [ 1]  718 	jrugt 9$  
      009FD5 90 58            [ 2]  719 	sllw y 
      009FD7 90 58            [ 2]  720 	sllw y 
      009FD9 72 A9 80 08      [ 2]  721 	addw y,#0x8008 ; irq0 address 
      009FDD 90 BF 24         [ 2]  722 	ldw YTEMP,y
      009FE0 1D 00 06         [ 2]  723 	subw x,#3*CELLL 
      009FE3 EF 02            [ 2]  724 	ldw (2,x),y 
      009FE5 90 5F            [ 1]  725 	clrw y
      009FE7 FF               [ 2]  726 	ldw (x),y 
      009FE8 A6 82            [ 1]  727 	ld a,#0x82 
      009FEA 90 95            [ 1]  728 	ld yh,a
      009FEC EF 04            [ 2]  729 	ldw (4,x),y
      009FEE CD 9E 11         [ 4]  730 	call EESTORE
      009FF1 1D 00 06         [ 2]  731 	subw x,#3*CELLL
      009FF4 90 5F            [ 1]  732 	clrw y 
      009FF6 FF               [ 2]  733 	ldw (x),y 
      009FF7 90 AE 80 80      [ 2]  734 	ldw y,#NonHandledInterrupt
      009FFB EF 04            [ 2]  735 	ldw (4,x),y 
      009FFD 90 BE 24         [ 2]  736 	ldw y,YTEMP  
      00A000 72 A9 00 02      [ 2]  737 	addw y,#2
      00A004 EF 02            [ 2]  738 	ldw (2,x),y 
      00A006 CD 9E 11         [ 4]  739 	call EESTORE
      00A009 81               [ 4]  740 9$:	ret 
                                    741 
                                    742 
                                    743 ;------------------------------
                                    744 ; all interrupt vector with 
                                    745 ; an address >= a are resetted 
                                    746 ; to default
                                    747 ; CHKIVEC ( a -- )
                                    748 ;------------------------------
      00A00A 9F B9                  749 	.word LINK 
                           001F8C   750 	LINK=.
      00A00C 07                     751 	.byte 7
      00A00D 43 48 4B 49 56 45 43   752 	.ascii "CHKIVEC"
                                    753 ;local variables 
                           000001   754 	SSP=1
                           000003   755 	CADR=3
                           000005   756 	OFS=5
                           000006   757 	VSIZE=6  
      00A014                        758 CHKIVEC:
      00A014 52 06            [ 2]  759 	sub sp,#VSIZE ;alloc local variables 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



      00A016 90 93            [ 1]  760 	ldw y,x 
      00A018 90 FE            [ 2]  761 	ldw y,(y)
      00A01A 17 03            [ 2]  762 	ldw (CADR,sp),y ; ca 
      00A01C 1F 01            [ 2]  763 	ldw (SSP,sp),x 
      00A01E AE 80 0A         [ 2]  764 	ldw x,#0x800a ; irq0 address 
      00A021 BF 33            [ 2]  765 	ldw PTR16,X
      00A023 AE FF FC         [ 2]  766 	ldw x,#-4 
      00A026 1C 00 04         [ 2]  767 1$:	addw x,#4
      00A029 A3 00 78         [ 2]  768 	cpw x,#30*4 ; irq0-29 
      00A02C 27 22            [ 1]  769 	jreq 9$
      00A02E 90 93            [ 1]  770 	ldw y,x  
      00A030 91 D6 33         [ 4]  771 	ld a,([PTR16],y)
      00A033 11 03            [ 1]  772 	cp a,(CADR,sp)
      00A035 25 EF            [ 1]  773 	jrult 1$
      00A037 90 5C            [ 1]  774 	incw y 
      00A039 91 D6 33         [ 4]  775 	ld a,([PTR16],y)
      00A03C 11 04            [ 1]  776 	cp a,(CADR+1,sp) 
      00A03E 25 E6            [ 1]  777 	jrult 1$ 
      00A040 1F 05            [ 2]  778 	ldw (OFS,sp),x 
      00A042 54               [ 2]  779 	srlw x
      00A043 54               [ 2]  780 	srlw x 
      00A044 90 93            [ 1]  781 	ldw y,x 
      00A046 1E 01            [ 2]  782 	ldw x,(SSP,sp)
      00A048 FF               [ 2]  783 	ldw (x),y
      00A049 CD 9F C2         [ 4]  784 	call reset_vector
      00A04C 1E 05            [ 2]  785 	ldw x,(OFS,sp) 
      00A04E 20 D6            [ 2]  786 	jra 1$
      00A050 1E 01            [ 2]  787 9$:	ldw x,(SSP,sp) 
      00A052 1C 00 02         [ 2]  788 	addw x,#CELLL 
      00A055 5B 06            [ 2]  789 	addw sp,#VSIZE ; drop local variables  
      00A057 81               [ 4]  790 	ret 
                                    791 
                                    792 ;------------------------------
                                    793 ; set interrupt vector 
                                    794 ; SET-IVEC ( ud n -- )
                                    795 ;  ud Handler address
                                    796 ;  n  vector # 0 .. 29 
                                    797 ;-----------------------------
      00A058 A0 0C                  798 	.word LINK
                           001FDA   799 	LINK=.
      00A05A 08                     800 	.byte 8 
      00A05B 53 45 54 2D 49 56 45   801 	.ascii "SET-IVEC" 
             43
      00A063                        802 set_vector:
      00A063 90 93            [ 1]  803     ldw y,x 
      00A065 1C 00 02         [ 2]  804 	addw x,#CELLL 
      00A068 90 FE            [ 2]  805 	ldw y,(y) ; vector #
      00A06A 90 A3 00 1D      [ 2]  806 	cpw y,#29 ; last vector
      00A06E 23 04            [ 2]  807 	jrule 2$
      00A070 1C 00 04         [ 2]  808 	addw x,#2*CELLL 
      00A073 81               [ 4]  809 	ret
      00A074 90 58            [ 2]  810 2$:	sllw y 
      00A076 90 58            [ 2]  811 	sllw y 
      00A078 72 A9 80 08      [ 2]  812 	addw y,#0X8008 ; IRQ0 vector address 
      00A07C 90 BF 24         [ 2]  813 	ldw YTEMP,y ; vector address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



      00A07F A6 82            [ 1]  814 	ld a,#0x82 
      00A081 90 95            [ 1]  815 	ld yh,a 
      00A083 E6 01            [ 1]  816 	ld a,(1,x) ; isr address bits 23..16 
      00A085 90 97            [ 1]  817 	ld yl,a 
                                    818 ;  write 0x82 + most significant byte of int address	
      00A087 1D 00 06         [ 2]  819 	subw x,#3*CELLL 
      00A08A EF 04            [ 2]  820 	ldw (4,x),y 
      00A08C 90 BE 24         [ 2]  821 	ldw y,YTEMP
      00A08F EF 02            [ 2]  822 	ldw (2,x),y ; vector address 
      00A091 90 5F            [ 1]  823 	clrw y 
      00A093 FF               [ 2]  824 	ldw (x),y   ; as a double 
      00A094 CD 9E 11         [ 4]  825 	call EESTORE 
      00A097 90 93            [ 1]  826 	ldw y,x 
      00A099 90 EE 02         [ 2]  827 	ldw y,(2,y) ; bits 15..0 int vector 
      00A09C 1D 00 06         [ 2]  828 	subw x,#3*CELLL 
      00A09F EF 04            [ 2]  829 	ldw (4,x),y 
      00A0A1 90 BE 24         [ 2]  830 	ldw y,YTEMP 
      00A0A4 72 A9 00 02      [ 2]  831 	addw y,#2 
      00A0A8 EF 02            [ 2]  832 	ldw (2,x),y 
      00A0AA 90 5F            [ 1]  833 	clrw y 
      00A0AC FF               [ 2]  834 	ldw (x),y 
      00A0AD CD 9E 11         [ 4]  835 	call EESTORE
      00A0B0 1C 00 04         [ 2]  836 	addw x,#2*CELLL  
      00A0B3 81               [ 4]  837 9$: ret 
                                    838 
                                    839 
                                    840 ;------------------------
                                    841 ; Compile word to flash
                                    842 ; EE, (w -- )
                                    843 ;-----------------------
      00A0B4 A0 5A                  844 	.word LINK
                           002036   845 	LINK=.
      00A0B6 03                     846 	.byte 3
      00A0B7 45 45 2C               847 	.ascii "EE,"
      00A0BA                        848 EE_COMMA:
      00A0BA 1D 00 04         [ 2]  849 	subw x,#2*CELLL 
      00A0BD 90 BE 18         [ 2]  850 	ldw y,UCP
      00A0C0 90 89            [ 2]  851 	pushw y 
      00A0C2 EF 02            [ 2]  852 	ldw (2,x),y 
      00A0C4 90 5F            [ 1]  853 	clrw y 
      00A0C6 FF               [ 2]  854 	ldw (x),y
      00A0C7 CD 9E 11         [ 4]  855 	call EESTORE
      00A0CA 90 85            [ 2]  856 	popw y 
      00A0CC 72 A9 00 02      [ 2]  857 	addw y,#2
      00A0D0 90 BF 18         [ 2]  858 	ldw UCP,y
      00A0D3 81               [ 4]  859 	ret 
                                    860 
                                    861 
                                    862 ;-------------------------
                                    863 ; Compile byte to flash 
                                    864 ; EEC, ( c -- )	
                                    865 ;-------------------------
      00A0D4 A0 B6                  866 	.word LINK 
                           002056   867 	LINK=.
      00A0D6 04                     868 	.byte 4 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



      00A0D7 45 45 43 2C            869 	.ascii "EEC,"
      00A0DB                        870 EE_CCOMMA:
      00A0DB 1D 00 04         [ 2]  871 	subw x,#2*CELLL 
      00A0DE 90 BE 18         [ 2]  872 	ldw y,UCP
      00A0E1 90 89            [ 2]  873 	pushw y 
      00A0E3 EF 02            [ 2]  874 	ldw (2,x),y 
      00A0E5 90 5F            [ 1]  875 	clrw y 
      00A0E7 FF               [ 2]  876 	ldw (x),y
      00A0E8 CD 9D C5         [ 4]  877 	call EECSTORE
      00A0EB 90 85            [ 2]  878 	popw y 
      00A0ED 90 5C            [ 1]  879 	incw y 
      00A0EF 90 BF 18         [ 2]  880 	ldw UCP,y
      00A0F2 81               [ 4]  881 	ret 
                                    882 
                                    883 
                                    884 ;--------------------------
                                    885 ; copy FLASH block to ROWBUF
                                    886 ; ROW>BUF ( ud -- )
                                    887 ;--------------------------
      00A0F3 A0 D6                  888 	.word LINK 
                           002075   889 	LINK=.
      00A0F5 07                     890 	.byte 7 
      00A0F6 52 4F 57 3E 42 55 46   891 	.ascii "ROW>BUF"
      00A0FD                        892 ROW2BUF: 
      00A0FD CD 9B 87         [ 4]  893 	call FPSTOR 
      00A100 A6 80            [ 1]  894 	ld a,#BLOCK_SIZE
      00A102 88               [ 1]  895 	push a 
      00A103 B4 34            [ 1]  896 	and a,PTR8 ; block align 
      00A105 B7 34            [ 1]  897 	ld PTR8,a
      00A107 90 AE 16 80      [ 2]  898 	ldw y,#ROWBUFF 
      00A10B 92 BC 00 32      [ 5]  899 1$: ldf a,[FPTR]
      00A10F 90 F7            [ 1]  900 	ld (y),a
      00A111 CD 9D 01         [ 4]  901 	call INC_FPTR
      00A114 90 5C            [ 1]  902 	incw y 
      00A116 0A 01            [ 1]  903 	dec (1,sp)
      00A118 26 F1            [ 1]  904 	jrne 1$ 
      00A11A 84               [ 1]  905 	pop a 
      00A11B 81               [ 4]  906 	ret 
                                    907 
                                    908 
                                    909 ;---------------------------
                                    910 ; copy ROWBUFF to flash 
                                    911 ; BUF>ROW ( ud -- )
                                    912 ; ud is row address as double 
                                    913 ;---------------------------
      00A11C A0 F5                  914 	.word LINK 
                           00209E   915 	LINK=.
      00A11E 07                     916 	.byte 7 
      00A11F 42 55 46 3E 52 4F 57   917 	.ascii "BUF>ROW" 
      00A126                        918 BUF2ROW:
      00A126 CD 87 15         [ 4]  919 	call TBUF ; ( ud rb -- )
      00A129 CD 87 D5         [ 4]  920 	call ROT 
      00A12C CD 87 D5         [ 4]  921 	call ROT  ; ( rb ud -- )
      00A12F CD 9E FF         [ 4]  922 	call write_row 
      00A132 81               [ 4]  923 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



                                    924 
                                    925 ;---------------------------------
                                    926 ; how many byte free in that row 
                                    927 ; RFREE ( a -- n )
                                    928 ; a is least byte of target address
                                    929 ;----------------------------------
      00A133 A1 1E                  930 	.word LINK 
                           0020B5   931 	LINK=.
      00A135 05                     932 	.byte 5 
      00A136 52 46 52 45 45         933 	.ascii "RFREE"
      00A13B                        934 RFREE:
      00A13B E6 01            [ 1]  935 	ld a,(1,x)
      00A13D A4 7F            [ 1]  936 	and a,#BLOCK_SIZE-1 
      00A13F B7 24            [ 1]  937 	ld YTEMP,a 
      00A141 A6 80            [ 1]  938 	ld a,#BLOCK_SIZE 
      00A143 B0 24            [ 1]  939 	sub a,YTEMP 
      00A145 90 5F            [ 1]  940 	clrw y 
      00A147 90 97            [ 1]  941 	ld yl,a
      00A149 FF               [ 2]  942 	ldw (x),y 
      00A14A 81               [ 4]  943 	ret 
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
      00A14B A1 35                  954 	.word LINK 
                           0020CD   955 	LINK=. 
      00A14D 06                     956 	.byte 6
      00A14E 52 41 4D 3E 45 45      957 	.ascii "RAM>EE"
                                    958 	
      00A154                        959 RAM2EE:
                                    960 ; copy ud on top 
      00A154 90 93            [ 1]  961 	ldw y,x 
      00A156 90 EE 06         [ 2]  962 	ldw y,(6,y) ; LSW of ud  
      00A159 90 BF 24         [ 2]  963 	ldw YTEMP,y 
      00A15C 90 93            [ 1]  964 	ldw y,x 
      00A15E 90 EE 04         [ 2]  965 	ldw y,(4,y)  ; MSW of ud 
      00A161 1D 00 04         [ 2]  966 	subw x,#2*CELLL 
      00A164 FF               [ 2]  967 	ldw (x),y 
      00A165 90 BE 24         [ 2]  968 	ldw y,YTEMP 
      00A168 EF 02            [ 2]  969 	ldw (2,x),y 
      00A16A CD A0 FD         [ 4]  970 	call ROW2BUF 
      00A16D 90 93            [ 1]  971 	ldw y,x 
      00A16F 90 EE 06         [ 2]  972 	ldw y,(6,y)
      00A172 90 89            [ 2]  973 	pushw y ; udl 
      00A174 90 9F            [ 1]  974 	ld a,yl
      00A176 A4 7F            [ 1]  975 	and a,#BLOCK_SIZE-1 
      00A178 90 5F            [ 1]  976 	clrw y 
      00A17A 90 97            [ 1]  977 	ld yl,a 
      00A17C 72 A9 16 80      [ 2]  978 	addw y,#ROWBUFF 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      00A180 1D 00 02         [ 2]  979 	subw x,#CELLL 
      00A183 FF               [ 2]  980 	ldw (x),y  
      00A184 CD 86 2A         [ 4]  981 	call SWAPP ;  ( ud a ra u -- )
      00A187 CD 85 C4         [ 4]  982 	call RFROM  
      00A18A CD A1 3B         [ 4]  983 	call RFREE 
      00A18D CD 89 30         [ 4]  984 	call MIN
      00A190 CD 86 1A         [ 4]  985 	call DUPP 
      00A193 CD 85 E3         [ 4]  986 	call TOR  
      00A196 CD 8C 9C         [ 4]  987 	call CMOVE
      00A199 CD A1 26         [ 4]  988 	call BUF2ROW 
      00A19C CD 85 C4         [ 4]  989 	call RFROM 
      00A19F 81               [ 4]  990 	ret 
                                    991 
                                    992 
                                    993 ;--------------------------
                                    994 ; expand 16 bit address 
                                    995 ; to 32 bit address 
                                    996 ; FADDR ( a -- ud )
                                    997 ;--------------------------
      00A1A0 A1 4D                  998 	.word LINK 
                           002122   999 	LINK=. 
      00A1A2 05                    1000 	.byte 5 
      00A1A3 46 41 44 44 52        1001 	.ascii "FADDR"
      00A1A8                       1002 FADDR:
      00A1A8 CC 8B 61         [ 2] 1003 	jp ZERO 
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
      00A1AB A1 A2                 1019 	.word LINK 
                           00212D  1020 	LINK=.
      00A1AD 05                    1021 	.byte 5 
      00A1AE 46 4D 4F 56 45        1022 	.ascii "FMOVE" 
      00A1B3                       1023 FMOVE:
      00A1B3 CD 87 27         [ 4] 1024 	call TFLASH 
      00A1B6 CD 85 73         [ 4] 1025 	CALL AT 
      00A1B9 CD 85 28         [ 4] 1026 	CALL QBRAN 
      00A1BC A2 37                 1027 	.word no_move  
      00A1BE CD 87 76         [ 4] 1028 	call CPP
      00A1C1 CD 85 73         [ 4] 1029 	call AT  
      00A1C4 CD 86 1A         [ 4] 1030 	call DUPP ; ( udl udl -- )
      00A1C7 CD 87 5A         [ 4] 1031 	call CNTXT 
      00A1CA CD 85 73         [ 4] 1032 	call AT 
      00A1CD CD 84 F5         [ 4] 1033 	call DOLIT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



      00A1D0 00 02                 1034 	.word 2 
      00A1D2 CD 88 8E         [ 4] 1035 	call SUBB ; ( udl udl a -- )
      00A1D5 CD 86 2A         [ 4] 1036 	call SWAPP 
      00A1D8 CD A1 A8         [ 4] 1037 	call FADDR 
      00A1DB CD 87 D5         [ 4] 1038 	call ROT  ; ( udl ud a -- )
      00A1DE CD 86 1A         [ 4] 1039 	call DUPP 
      00A1E1 CD 85 E3         [ 4] 1040 	call TOR    ; R: a 
      00A1E4                       1041 FMOVE2: 
      00A1E4 CD 8C 4F         [ 4] 1042 	call HERE 
      00A1E7 CD 85 D7         [ 4] 1043 	call RAT 
      00A1EA CD 88 8E         [ 4] 1044 	call SUBB ; (udl ud a wl -- )
      00A1ED                       1045 next_row:
      00A1ED CD 86 1A         [ 4] 1046 	call DUPP 
      00A1F0 CD 85 E3         [ 4] 1047 	call TOR  ; ( udl ud a wl -- ) R: a wl
      00A1F3 CD A1 54         [ 4] 1048 	call RAM2EE ; ( udl a u -- udl u2 ) u2 is byte written to FLASH 
      00A1F6 CD 86 1A         [ 4] 1049 	call DUPP 
      00A1F9 CD 85 E3         [ 4] 1050 	call TOR
      00A1FC CD 88 15         [ 4] 1051 	call PLUS  ; ( udl+ ) 
      00A1FF CD 86 1A         [ 4] 1052 	call DUPP 
      00A202 CD 8B 61         [ 4] 1053 	call ZERO   ; ( udl+ ud -- )
      00A205 CD 85 C4         [ 4] 1054 	call RFROM  ; ( udl+ ud u2  R: a wl ) 
      00A208 CD 85 C4         [ 4] 1055 	call RFROM  ; ( udl+ ud u2 wl R: a ) 
      00A20B CD 86 44         [ 4] 1056 	call OVER   ; ( udl+ ud u2 wl u2 -- )
      00A20E CD 88 8E         [ 4] 1057 	call SUBB  ; ( udl+ ud u2 wl- R: a )
      00A211 CD 86 1A         [ 4] 1058 	call DUPP 
      00A214 CD 85 28         [ 4] 1059 	call QBRAN
      00A217 A2 30                 1060 	.word fmove_done 
      00A219 CD 86 2A         [ 4] 1061 	call SWAPP  ; ( udl+ ud wl- u2 R: a )
      00A21C CD 85 C4         [ 4] 1062 	call RFROM ; ( udl+ ud wl- u2 a -- ) 
      00A21F CD 88 15         [ 4] 1063 	call PLUS  ; ( udl+2 ud wl- a+ )
      00A222 CD 86 1A         [ 4] 1064 	call DUPP 
      00A225 CD 85 E3         [ 4] 1065 	call TOR   ; ( udl+2 ud wl- a+ ) R: a+
      00A228 CD 86 2A         [ 4] 1066 	call SWAPP 
      00A22B CD 85 3F         [ 4] 1067 	call BRAN
      00A22E A1 ED                 1068 	.word next_row  
      00A230                       1069 fmove_done:	
      00A230 CD 85 C4         [ 4] 1070 	call RFROM  ; ( -- udl+ ud u2 wl- a  )
      00A233 1C 00 0A         [ 2] 1071 	addw x,#5*CELLL ; (  -- cp+ ) new CP 
      00A236 81               [ 4] 1072  	ret  
      00A237                       1073 no_move:
      00A237 CD 8B 61         [ 4] 1074 	call ZERO
      00A23A 81               [ 4] 1075 	ret 
                                   1076 
                                   1077 ;------------------------------------------
                                   1078 ; adjust pointers after **FMOVE** operetion.
                                   1079 ; UPDAT-PTR ( cp+ -- )
                                   1080 ; cp+ is new CP position after FMOVE 
                                   1081 ;-------------------------------------------
      00A23B A1 AD                 1082 	.word LINK 
                           0021BD  1083 	LINK=.
      00A23D 09                    1084 	.byte 9
      00A23E 55 50 44 41 54 2D 50  1085 	.ascii "UPDAT-PTR" 
             54 52
      00A247                       1086 UPDATPTR:
                                   1087 ;reset VP to previous position  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



      00A247 CD 9C 01         [ 4] 1088 	call EEPVP 
      00A24A CD 86 10         [ 4] 1089 	call DROP 
      00A24D CD 85 73         [ 4] 1090 	call AT
      00A250 CD 87 68         [ 4] 1091 	call VPP 
      00A253 CD 85 5C         [ 4] 1092 	call STORE
                                   1093 ;update CONTEXT and LAST 
      00A256 CD 9B EB         [ 4] 1094 	call EEPCP 
      00A259 CD 86 10         [ 4] 1095 	call DROP
      00A25C CD 85 73         [ 4] 1096 	call AT
      00A25F CD 84 F5         [ 4] 1097 	call DOLIT 
      00A262 00 02                 1098 	.word 2 
      00A264 CD 88 15         [ 4] 1099 	call PLUS 
      00A267 CD 86 1A         [ 4] 1100 	call DUPP 
      00A26A CD 87 5A         [ 4] 1101 	call CNTXT 
      00A26D CD 85 5C         [ 4] 1102 	call STORE
      00A270 CD 87 86         [ 4] 1103 	call LAST
      00A273 CD 85 5C         [ 4] 1104 	call STORE 
      00A276 CD 9C 1B         [ 4] 1105 	call UPDATLAST 
                                   1106 ;update CP 
      00A279 CD 87 76         [ 4] 1107 	call CPP 
      00A27C CD 85 5C         [ 4] 1108 	call STORE
      00A27F CD 9C 44         [ 4] 1109 	call UPDATCP 
      00A282 81               [ 4] 1110 	ret 
                                   1111 
                                   1112 ;-----------------------------
                                   1113 ; move interrupt sub-routine
                                   1114 ; in flash memory
                                   1115 ;----------------------------- 
      00A283 A2 3D                 1116 	.word LINK 
                           002205  1117 	LINK=. 
      00A285 06                    1118 	.byte 6
      00A286 49 46 4D 4F 56 45     1119 	.ascii "IFMOVE" 
      00A28C                       1120 IFMOVE:
      00A28C CD 87 27         [ 4] 1121 	call TFLASH 
      00A28F CD 85 73         [ 4] 1122 	CALL AT 
      00A292 CD 85 28         [ 4] 1123 	CALL QBRAN 
      00A295 A2 37                 1124 	.word no_move 
      00A297 CD 87 76         [ 4] 1125 	call CPP 
      00A29A CD 85 73         [ 4] 1126 	call AT 
      00A29D CD 86 1A         [ 4] 1127 	call DUPP ; ( udl udl -- )
      00A2A0 CD 9C 01         [ 4] 1128 	call EEPVP 
      00A2A3 CD 86 10         [ 4] 1129 	call DROP
      00A2A6 CD 85 73         [ 4] 1130 	call AT  ; ( udl udl a )
      00A2A9 CD 85 E3         [ 4] 1131 	call TOR 
      00A2AC CD A1 A8         [ 4] 1132 	call FADDR
      00A2AF CD 85 D7         [ 4] 1133 	call RAT ; ( udl ud a -- ) R: a 
      00A2B2 CC A1 E4         [ 2] 1134 	jp FMOVE2 
                                   1135 
                                   1136 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



                           000001  4646 .if WANT_SCALING_CONST 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



                                   4647         .include "const_ratio.asm"
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
      00A2B5 A2 85                   31         .word LINK 
                           002237    32         LINK=.
      00A2B7 02                      33         .byte 2
      00A2B8 50 49                   34         .ascii "PI" 
      00A2BA                         35 PII:
      00A2BA 1D 00 04         [ 2]   36         subw x,#2*CELLL 
      00A2BD 90 AE 01 63      [ 2]   37         ldw y,#355 
      00A2C1 EF 02            [ 2]   38         ldw (2,x),y 
      00A2C3 90 AE 00 71      [ 2]   39         ldw y,#113 
      00A2C7 FF               [ 2]   40         ldw (x),y 
      00A2C8 81               [ 4]   41         ret 
                                     42 
                                     43 ;      SQRT2 ( -- 19601  13860 )
                                     44 ; precision: 1.5e-9 
                                     45 ; usage example to compute Voltage peek to peek from Vrms 
                                     46 ; : VPP SQRT2 */ 2 * ;
                                     47 ;
      00A2C9 A2 B7                   48         .word LINK 
                           00224B    49         LINK=.
      00A2CB 05                      50         .byte 5 
      00A2CC 53 51 52 54 32          51         .ascii "SQRT2" 
      00A2D1                         52 SQRT2:
      00A2D1 1D 00 04         [ 2]   53         subw x,#2*CELLL 
      00A2D4 90 AE 4C 91      [ 2]   54         ldw y,#19601 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



      00A2D8 EF 02            [ 2]   55         ldw (2,x),y 
      00A2DA 90 AE 36 24      [ 2]   56         ldw y,#13860 
      00A2DE FF               [ 2]   57         ldw (x),y 
      00A2DF 81               [ 4]   58         ret 
                                     59 
                                     60 ;   SQRT3 ( -- 18817 10864 )
                                     61 ; precision: 1.1e-9
                                     62 ;
      00A2E0 A2 CB                   63         .word LINK 
                           002262    64         LINK=.
      00A2E2 05                      65         .byte 5
      00A2E3 53 51 52 54 33          66         .ascii "SQRT3" 
      00A2E8                         67 SQRT3: 
      00A2E8 1D 00 04         [ 2]   68     subw x,#2*CELLL 
      00A2EB 90 AE 49 81      [ 2]   69     ldw y,#18817 
      00A2EF EF 02            [ 2]   70     ldw (2,x),y 
      00A2F1 90 AE 2A 70      [ 2]   71     ldw y,#10864 
      00A2F5 FF               [ 2]   72     ldw (x),y 
      00A2F6 81               [ 4]   73     ret 
                                     74 
                                     75 ;   E ( -- 28667 10546 )
                                     76 ; precision: 5.5e-9 
                                     77 ; natural log base 
      00A2F7 A2 E2                   78         .word LINK 
                           002279    79         LINK=.
      00A2F9 01                      80         .byte 1
      00A2FA 45                      81         .ascii "E" 
      00A2FB                         82 ENEPER:
      00A2FB 1D 00 04         [ 2]   83     subw x,#2*CELLL 
      00A2FE 90 AE 6F FB      [ 2]   84     ldw y,#28667 
      00A302 EF 02            [ 2]   85     ldw (2,x),y 
      00A304 90 AE 29 32      [ 2]   86     ldw y,#10546 
      00A308 FF               [ 2]   87     ldw (x),y 
      00A309 81               [ 4]   88     ret 
                                     89 
                                     90 ;   SQRT10 ( -- 22936 7253 )
                                     91 ; precision: 5.7e-9 
      00A30A A2 F9                   92         .word LINK 
                           00228C    93         LINK=.
      00A30C 06                      94         .byte 6 
      00A30D 53 51 52 54 31 30       95         .ascii "SQRT10" 
      00A313                         96 SQRT10:
      00A313 1D 00 04         [ 2]   97     subw x,#2*CELLL
      00A316 90 AE 59 98      [ 2]   98     ldw y,#22936 
      00A31A EF 02            [ 2]   99     ldw (2,x),y 
      00A31C 90 AE 1C 55      [ 2]  100     ldw y,#7253
      00A320 FF               [ 2]  101     ldw (x),y 
      00A321 81               [ 4]  102     ret 
                                    103 
                                    104 ;   12RT2 ( -- 26797 25293 )
                                    105 ; precision: 1.0e-9 
                                    106 ; used in music to compute well tempered scale
      00A322 A3 0C                  107         .word LINK 
                           0022A4   108         LINK=. 
      00A324 05                     109         .byte 5 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



      00A325 31 32 52 54 32         110         .ascii "12RT2"
      00A32A                        111 RT12_2:
      00A32A 1D 00 04         [ 2]  112     subw x,#2*CELLL 
      00A32D 90 AE 68 AD      [ 2]  113     ldw y,#26797
      00A331 EF 02            [ 2]  114     ldw (2,x),y 
      00A333 90 AE 62 CD      [ 2]  115     ldw y,#25293
      00A337 FF               [ 2]  116     ldw (x),y 
      00A338 81               [ 4]  117     ret 
                                    118 
                                    119 ;   LOG2s ( -- 2040 11103 )
                                    120 ; log(2)/1.6384
                                    121 ; precision: 1.1e-8
      00A339 A3 24                  122         .word LINK 
                           0022BB   123         LINK=.
      00A33B 05                     124         .byte 5 
      00A33C 4C 4F 47 32 53         125         .ascii "LOG2S" 
      00A341                        126 LOG2S:
      00A341 1D 00 04         [ 2]  127     subw x,#2*CELLL
      00A344 90 AE 07 F8      [ 2]  128     ldw y,#2040 
      00A348 EF 02            [ 2]  129     ldw (2,x),y 
      00A34A 90 AE 2B 5F      [ 2]  130     ldw y,#11103 
      00A34E FF               [ 2]  131     ldw (x),y 
      00A34F 81               [ 4]  132     ret 
                                    133 
                                    134 ;   LN2 ( -- 485 11464 )
                                    135 ; ln(2)/16.384 
                                    136 ; precision: 1.0e-7 
      00A350 A3 3B                  137         .word LINK 
                           0022D2   138         LINK=.
      00A352 04                     139         .byte 4 
      00A353 4C 4E 32 53            140         .ascii "LN2S" 
      00A357                        141 LN2S: 
      00A357 1D 00 04         [ 2]  142     subw x,#2*CELLL
      00A35A 90 AE 01 E5      [ 2]  143     ldw y,#485
      00A35E EF 02            [ 2]  144     ldw (2,x),y 
      00A360 90 AE 2C C8      [ 2]  145     ldw y,#11464 
      00A364 FF               [ 2]  146     ldw (x),y 
      00A365 81               [ 4]  147     ret 
                                    148 
                                    149 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



                                   4648 .endif
                           000001  4649 .if WANT_CONST_TABLE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]



                                   4650         .include "ctable.asm"
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
      00A366 A3 52                   32     .word LINK 
                           0022E8    33     LINK=.
      00A368 06                      34     .byte 6
      00A369 43 41 4C 4C 4F 54       35     .ascii "CALLOT"
      00A36F                         36 CALLOT:
      00A36F CD 87 76         [ 4]   37     CALL CPP
      00A372 CD 86 1A         [ 4]   38     CALL DUPP 
      00A375 CD 85 73         [ 4]   39     CALL AT 
      00A378 CD 85 E3         [ 4]   40     CALL TOR 
      00A37B CD 8B D1         [ 4]   41     CALL PSTOR 
      00A37E CD 9C 44         [ 4]   42     CALL UPDATCP 
      00A381 CD 85 C4         [ 4]   43     CALL RFROM
      00A384 CC 8B 61         [ 2]   44     JP ZERO 
                                     45 
                                     46 ;------------------------------
                                     47 ; create constants bytes table 
                                     48 ; in persistant memory
                                     49 ;  CTABLE ( n+ -- ad ; <string> )
                                     50 ; n+ bytes reserved 
                                     51 ;-----------------------------
      00A387 A3 68                   52     .word LINK 
                           002309    53     LINK=.
      00A389 06                      54     .byte 6
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]



      00A38A 43 54 41 42 4C 45       55     .ascii "CTABLE"
      00A390                         56 CTABLE:
      00A390 CD A3 6F         [ 4]   57     CALL CALLOT     
      00A393 CC 99 3D         [ 2]   58     JP DCONST 
                                     59      
                                     60 
                                     61 ;--------------------------------
                                     62 ; create constants words table 
                                     63 ; in persistant memory 
                                     64 ; WTABLE ( n+ -- ad ; <string> )
                                     65 ; n+  words reserved  
                                     66 ;--------------------------------
      00A396 A3 89                   67     .word LINK 
                           002318    68     LINK=.
      00A398 06                      69     .byte 6
      00A399 57 54 41 42 4C 45       70     .ascii "WTABLE"
      00A39F                         71 WTABLE:
      00A39F CD 8A E8         [ 4]   72     CALL CELLS  
      00A3A2 CD A3 6F         [ 4]   73     CALL CALLOT 
      00A3A5 CC 99 3D         [ 2]   74     JP DCONST 
                                     75 
                                     76 ;---------------------------------
                                     77 ; stack an element of CTABLE 
                                     78 ; CTABL@ ( u ad -- c )
                                     79 ; u element order {0..size-1}
                                     80 ; a|ad table address 
                                     81 ;--------------------------------
      00A3A8 A3 98                   82     .word LINK 
                           00232A    83     LINK=.
      00A3AA 06                      84     .byte 6
      00A3AB 43 54 41 42 4C 40       85     .ascii "CTABL@" 
      00A3B1                         86 CTAT:
      00A3B1 CD 9B 87         [ 4]   87     call FPSTOR 
      00A3B4 CD 9D 19         [ 4]   88     call PTRPLUS 
      00A3B7 CC 9D 56         [ 2]   89     jp EE_CREAD 
                                     90 
                                     91 ;---------------------------------
                                     92 ; stack an element of WTABLE 
                                     93 ; WTABL@ ( u ud -- w )
                                     94 ; u is element order {0..size-1}
                                     95 ; a|ud table address 
                                     96 ;----------------------------------
      00A3BA A3 AA                   97     .word LINK 
                           00233C    98     LINK=.
      00A3BC 06                      99     .byte 6
      00A3BD 57 54 41 42 4C 40      100     .ascii "WTABL@" 
      00A3C3                        101 WTAT:
      00A3C3 CD 9B 87         [ 4]  102     call FPSTOR 
      00A3C6 CD 8A E8         [ 4]  103     call CELLS 
      00A3C9 CD 9D 19         [ 4]  104     call PTRPLUS 
      00A3CC CD 9D 34         [ 4]  105     call EE_READ 
      00A3CF 81               [ 4]  106     ret 
                                    107 
                                    108 ;--------------------------
                                    109 ; tool to initialize character table 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



                                    110 ; CTINIT ( ad -- )
                                    111 ; ad is table address 
                                    112 ;--------------------------
      00A3D0 A3 BC                  113     .word LINK 
                           002352   114     LINK=.
      00A3D2 06                     115     .byte 6 
      00A3D3 43 54 49 4E 49 54      116     .ascii "CTINIT"
      00A3D9                        117 CTINIT:
      00A3D9 CD 9B 87         [ 4]  118     CALL FPSTOR
      00A3DC CD 9C C5         [ 4]  119     CALL UNLOCK
      00A3DF CD 8B 61         [ 4]  120     CALL ZERO 
      00A3E2 CD 8A F5         [ 4]  121 1$: CALL ONEP 
      00A3E5 CD 86 1A         [ 4]  122     CALL DUPP 
      00A3E8 CD A4 35         [ 4]  123     CALL INTQ 
      00A3EB CD 85 28         [ 4]  124     CALL QBRAN 
      00A3EE A3 F8                  125     .word 2$
      00A3F0 CD 9D 70         [ 4]  126     call WR_BYTE 
      00A3F3 CD 85 3F         [ 4]  127     CALL BRAN 
      00A3F6 A3 E2                  128     .word 1$ 
      00A3F8 CD 87 F5         [ 4]  129 2$: CALL DDROP 
      00A3FB CD 9C ED         [ 4]  130     CALL LOCK 
      00A3FE 81               [ 4]  131     ret 
                                    132 
                                    133 ;--------------------------
                                    134 ; tool to initialize word table 
                                    135 ; WTINIT ( ad -- )
                                    136 ; ad is table address 
                                    137 ;--------------------------
      00A3FF A3 D2                  138     .word LINK 
                           002381   139     LINK=.
      00A401 06                     140     .byte 6 
      00A402 57 54 49 4E 49 54      141     .ascii "WTINIT"
      00A408                        142 WTINIT:
      00A408 CD 9B 87         [ 4]  143     CALL FPSTOR
      00A40B CD 9C C5         [ 4]  144     CALL UNLOCK
      00A40E CD 8B 61         [ 4]  145     CALL ZERO 
      00A411 CD 8A F5         [ 4]  146 1$: CALL ONEP 
      00A414 CD 86 1A         [ 4]  147     CALL DUPP
      00A417 CD A4 35         [ 4]  148     CALL INTQ
      00A41A CD 85 28         [ 4]  149     CALL QBRAN 
      00A41D A4 27                  150     .word 2$
      00A41F CD 9D 95         [ 4]  151     call WR_WORD 
      00A422 CD 85 3F         [ 4]  152     CALL BRAN 
      00A425 A4 11                  153     .word 1$ 
      00A427 CD 87 F5         [ 4]  154 2$: CALL DDROP 
      00A42A CD 9C ED         [ 4]  155     CALL LOCK 
      00A42D 81               [ 4]  156     ret 
                                    157 
                                    158 ;------------------------
                                    159 ; Prompted input for integer 
                                    160 ; display n+ in bracket and
                                    161 ; '?' 
                                    162 ; [N]? ( n+ -- a )
                                    163 ;------------------------
      00A42E A4 01                  164     .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



                           0023B0   165     LINK=.
      00A430 04                     166     .byte 4
      00A431 5B 4E 5D 3F            167     .ascii "[N]?" 
      00A435                        168 INTQ:
      00A435 CD 8F C7         [ 4]  169     CALL CR 
      00A438 CD 84 F5         [ 4]  170     call DOLIT 
      00A43B 00 5B                  171     .word '[
      00A43D CD 84 B4         [ 4]  172     CALL EMIT 
      00A440 CD 90 62         [ 4]  173     CALL DOT 
      00A443 CD 90 06         [ 4]  174     CALL  DOTQP
      00A446 03                     175     .byte 3
      00A447 5D 3F 20               176     .ascii "]? " 
      00A44A CD 93 AE         [ 4]  177     CALL QUERY 
      00A44D CD 91 D9         [ 4]  178     call TOKEN 
      00A450 CC 8E 74         [ 2]  179     jp NUMBQ
                                    180 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



                                   4651 .endif
                                   4652 
                                   4653 ;===============================================================
                                   4654 
                           0023B0  4655 LASTN =	LINK   ;last name defined
                                   4656 
                                   4657 ; application code begin here
      00A480                       4658 	.bndry 128 ; align on flash block  
      00A480                       4659 app_space: 
                                   4660 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   6 AB1        000831 R   |   6 ABOR1      00136A R
  6 ABOR2      001381 R   |   6 ABORQ      001362 R   |   6 ABORT      001353 R
  6 ABRTQ      00163E R   |   6 ABSS       000828 R   |   6 ACCEP      0012E9 R
  6 ACCP1      0012F2 R   |   6 ACCP2      001318 R   |   6 ACCP3      00131B R
  6 ACCP4      00131D R   |     ADC_CR1 =  005401     |     ADC_CR1_=  000000 
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
  6 AFT        001629 R   |   6 AGAIN      00157F R   |   6 AHEAD      0015DC R
  6 ALLOT      001492 R   |   6 ANDD       0005E6 R   |     APP_CP  =  004004 
    APP_LAST=  004000     |     APP_RUN =  004002     |     APP_VP  =  004006 
  6 AT         0004F3 R   |   6 ATEXE      000C05 R   |   6 AUTORUN    000127 R
    AWU_APR =  0050F1     |     AWU_CSR =  0050F0     |     AWU_TBR =  0050F2 
    B0_MASK =  000001     |     B115200 =  000006     |   6 B115K2     0003DE R
    B19200  =  000003     |   6 B19K2      0003BB R   |     B1_MASK =  000002 
    B230400 =  000007     |     B2400   =  000000     |   6 B2K4       00038C R
    B2_MASK =  000004     |     B38400  =  000004     |     B3_MASK =  000008 
    B460800 =  000008     |     B4800   =  000001     |   6 B4K8       00039A R
    B4_MASK =  000010     |     B57600  =  000005     |   6 B57K6      0003CC R
    B5_MASK =  000020     |     B6_MASK =  000040     |     B7_MASK =  000080 
    B921600 =  000009     |     B9600   =  000002     |   6 B9K6       0003AA R
  6 BACK1      001291 R   |   6 BASE       000657 R   |     BASEE   =  00000A 
  6 BAUD       0003EE R   |     BCNT    =  000001     |   6 BCOMP      0014D4 R
  6 BDIGS      000CEC R   |     BEEP_BIT=  000004     |     BEEP_CSR=  0050F3 
    BEEP_MAS=  000010     |     BEEP_POR=  00000F     |   6 BEGIN      001561 R
    BIT0    =  000000     |     BIT1    =  000001     |     BIT2    =  000002 
    BIT3    =  000003     |     BIT4    =  000004     |     BIT5    =  000005 
    BIT6    =  000006     |     BIT7    =  000007     |   6 BKSLA      001129 R
  6 BKSP       001261 R   |     BKSPP   =  000008     |   6 BLANK      000AD4 R
    BLOCK_SI=  000080     |     BOOT_ROM=  006000     |     BOOT_ROM=  007FFF 
  6 BRAN       0004BF R   |     BTW     =  000001     |   6 BUF2ROW    0020A6 R
  6 BYE        0000B4 R   |     CADR    =  000003     |     CALLL   =  0000CD 
  6 CALLOT     0022EF R   |     CAN_DGR =  005426     |     CAN_FPSR=  005427 
    CAN_IER =  005425     |     CAN_MCR =  005420     |     CAN_MSR =  005421 
    CAN_P0  =  005428     |     CAN_P1  =  005429     |     CAN_P2  =  00542A 
    CAN_P3  =  00542B     |     CAN_P4  =  00542C     |     CAN_P5  =  00542D 
    CAN_P6  =  00542E     |     CAN_P7  =  00542F     |     CAN_P8  =  005430 
    CAN_P9  =  005431     |     CAN_PA  =  005432     |     CAN_PB  =  005433 
    CAN_PC  =  005434     |     CAN_PD  =  005435     |     CAN_PE  =  005436 
    CAN_PF  =  005437     |     CAN_RFR =  005424     |     CAN_TPR =  005423 
    CAN_TSR =  005422     |     CARRY   =  000028     |   6 CAT        000511 R
  6 CCOMMA     0014B6 R   |     CC_C    =  000000     |     CC_H    =  000004 
    CC_I0   =  000003     |     CC_I1   =  000005     |     CC_N    =  000002 
    CC_V    =  000007     |     CC_Z    =  000001     |     CELLL   =  000002 
  6 CELLM      000A59 R   |   6 CELLP      000A4A R   |   6 CELLS      000A68 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]

Symbol Table

    CFG_GCR =  007F60     |     CFG_GCR_=  000001     |     CFG_GCR_=  000000 
  6 CHAR1      000F19 R   |   6 CHAR2      000F1C R   |   6 CHKIVEC    001F94 R
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
  6 CMOV1      000C24 R   |   6 CMOV2      000C3C R   |   6 CMOVE      000C1C R
    CNTDWN  =  000030     |   6 CNTXT      0006DA R   |   6 COLD       001A98 R
  6 COLD1      001A98 R   |   6 COLON      0017D7 R   |   6 COMMA      00149F R
  6 COMPI      0014E4 R   |     COMPO   =  000040     |   6 CONSTANT   001881 R
  6 COUNT      000BB8 R   |   6 CPP        0006F6 R   |     CPU_A   =  007F00 
    CPU_CCR =  007F0A     |     CPU_PCE =  007F01     |     CPU_PCH =  007F02 
    CPU_PCL =  007F03     |     CPU_SPH =  007F08     |     CPU_SPL =  007F09 
    CPU_XH  =  007F04     |     CPU_XL  =  007F05     |     CPU_YH  =  007F06 
    CPU_YL  =  007F07     |   6 CR         000F47 R   |   6 CREAT      00181D R
    CRR     =  00000D     |   6 CSTOR      000500 R   |   6 CTABLE     002310 R
  6 CTAT       002331 R   |   6 CTINIT     002359 R   |   6 DAT        000B98 R
    DATSTK  =  001680     |   6 DCONST     0018BD R   |   6 DDROP      000775 R
  6 DDUP       000780 R   |     DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF 
  6 DECIM      000D9C R   |   6 DEPTH      000B23 R   |     DEVID_BA=  0048CD 
    DEVID_EN=  0048D8     |     DEVID_LO=  0048D2     |     DEVID_LO=  0048D3 
    DEVID_LO=  0048D4     |     DEVID_LO=  0048D5     |     DEVID_LO=  0048D6 
    DEVID_LO=  0048D7     |     DEVID_LO=  0048D8     |     DEVID_WA=  0048D1 
    DEVID_XH=  0048CE     |     DEVID_XL=  0048CD     |     DEVID_YH=  0048D0 
    DEVID_YL=  0048CF     |   6 DGTQ1      000DE1 R   |   6 DI         0000C2 R
  6 DIG        000D15 R   |   6 DIGIT      000CB0 R   |   6 DIGS       000D26 R
  6 DIGS1      000D26 R   |   6 DIGS2      000D33 R   |   6 DIGTQ      000DB0 R
    DISCOVER=  000000     |     DM_BK1RE=  007F90     |     DM_BK1RH=  007F91 
    DM_BK1RL=  007F92     |     DM_BK2RE=  007F93     |     DM_BK2RH=  007F94 
    DM_BK2RL=  007F95     |     DM_CR1  =  007F96     |     DM_CR2  =  007F97 
    DM_CSR1 =  007F98     |     DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A 
  6 DN1        0007EF R   |   6 DNEGA      0007D2 R   |   6 DOCONST    0018AB R
  6 DOLIT      000475 R   |   6 DONXT      000489 R   |     DOORBELL=  000000 
  6 DOSTR      000F5D R   |   6 DOT        000FE2 R   |   6 DOT1       000FF8 R
  6 DOTI1      001A19 R   |   6 DOTID      001A03 R   |   6 DOTO1      0013F6 R
  6 DOTOK      0013DC R   |   6 DOTPR      00110B R   |   6 DOTQ       001658 R
  6 DOTQP      000F86 R   |   6 DOTR       000F94 R   |   6 DOTS       0019A5 R
  6 DOTS1      0019B0 R   |   6 DOTS2      0019B9 R   |   6 DOVAR      000647 R
  6 DO_DCONS   0018EC R   |   6 DROP       000590 R   |   6 DSTOR      000B72 R
  6 DUMP       00195B R   |   6 DUMP1      001972 R   |   6 DUMP3      001994 R
  6 DUMPP      00192A R   |   6 DUPP       00059A R   |   6 EDIGS      000D51 R
  6 EECSTORE   001D45 R   |   6 EEPCP      001B6B R   |   6 EEPLAST    001B3E R
  6 EEPROM     001B26 R   |     EEPROM_B=  004000     |     EEPROM_E=  0047FF 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]

Symbol Table

    EEPROM_R=  000010     |     EEPROM_S=  000800     |   6 EEPRUN     001B55 R
  6 EEPVP      001B81 R   |   6 EESTORE    001D91 R   |   6 EE_CCOMM   00205B R
  6 EE_COMMA   00203A R   |   6 EE_CREAD   001CD6 R   |   6 EE_READ    001CB4 R
  6 EI         0000BB R   |   6 ELSEE      0015B7 R   |   6 EMIT       000434 R
  6 ENEPER     00227B R   |     EOL_CR  =  000001     |     EOL_LF  =  000000 
  6 EQ1        00084C R   |   6 EQUAL      000836 R   |   6 ERASE      000C7E R
    ERR     =  00001B     |   6 EVAL       00141F R   |   6 EVAL1      00141F R
  6 EVAL2      00143B R   |   6 EXE1       000C13 R   |   6 EXECU      0004CF R
    EXT     =  000000     |     EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1 
  6 EXTRC      000CD8 R   |   6 FADDR      002128 R   |   6 FARAT      001BEC R
  6 FARCAT     001BF8 R   |   6 FC_XOFF    000461 R   |   6 FC_XON     00044B R
    FHSE    =  7A1200     |     FHSI    =  F42400     |   6 FILL       000C4B R
  6 FILL1      000C68 R   |   6 FILL2      000C71 R   |   6 FIND       0011BD R
  6 FIND1      0011DB R   |   6 FIND2      001209 R   |   6 FIND3      001215 R
  6 FIND4      001229 R   |   6 FIND5      001236 R   |   6 FIND6      00121A R
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
    FLSI    =  01F400     |   6 FMOVE      002133 R   |   6 FMOVE2     002164 R
  6 FOR        001534 R   |   6 FORGET     000158 R   |   6 FORGET1    000187 R
  6 FORGET2    00020D R   |   6 FORGET4    000216 R   |   6 FORGET6    0001CF R
  6 FPSTOR     001B07 R   |     FPTR    =  000032     |   6 FREEVAR    000223 R
  6 FREEVAR4   000259 R   |     GPIO_BAS=  005000     |     GPIO_CR1=  000003 
    GPIO_CR2=  000004     |     GPIO_DDR=  000002     |     GPIO_IDR=  000001 
    GPIO_ODR=  000000     |     GPIO_SIZ=  000005     |   6 HERE       000BCF R
  6 HEX        000D87 R   |   6 HI         001A55 R   |   6 HLD        0006C7 R
  6 HOLD       000CFC R   |     HSECNT  =  004809     |     I2C_CCRH=  00521C 
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
    I2C_TRIS=  000011     |     I2C_WRIT=  000000     |   6 ICOLON     0017E8 R
  6 IFETCH     001552 R   |   6 IFF        00158F R   |   6 IFMOVE     00220C R
    IMEDD   =  000080     |   6 IMMED      0017FA R   |   6 INCH       000428 R
  6 INC_FPTR   001C81 R   |   6 INITOFS    0017B0 R   |   6 INN        000675 R
    INPUT_DI=  000000     |     INPUT_EI=  000001     |     INPUT_FL=  000000 
    INPUT_PU=  000001     |   6 INTE1      0013BE R   |   6 INTER      001394 R
  6 INTQ       0023B5 R   |     INT_ADC2=  000016     |     INT_AUAR=  000012 
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
  6 ISEMI      001745 R   |     ITC_SPR1=  007F70     |     ITC_SPR2=  007F71 
    ITC_SPR3=  007F72     |     ITC_SPR4=  007F73     |     ITC_SPR5=  007F74 
    ITC_SPR6=  007F75     |     ITC_SPR7=  007F76     |     ITC_SPR8=  007F77 
    IWDG_KR =  0050E0     |     IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2 
  6 JSRC       00179A R   |   6 KEY        000EC7 R   |   6 KTAP       0012AE R
  6 KTAP1      0012D1 R   |   6 KTAP2      0012D4 R   |   6 LAST       000706 R
  6 LASTN   =  0023B0 R   |   6 LBRAC      0013CB R   |     LED2_BIT=  000005 
    LED2_MAS=  000020     |     LED2_POR=  00500A     |   6 LESS       000873 R
    LF      =  00000A     |   6 LINK    =  0023B0 R   |   6 LITER      001506 R
  6 LN2S       0022D7 R   |   6 LOCK       001C6D R   |   6 LOG2S      0022C1 R
  6 LSHIFT     000A93 R   |   6 LSHIFT1    000A9C R   |   6 LSHIFT4    000AA4 R
  6 LT1        000889 R   |     MASKK   =  001F7F     |   6 MAX        000893 R
  6 MAX1       0008A6 R   |   6 MIN        0008B0 R   |   6 MIN1       0008C3 R
  6 MMOD1      00094C R   |   6 MMOD2      000960 R   |   6 MMOD3      000977 R
  6 MMSM1      000907 R   |   6 MMSM3      00090B R   |   6 MMSM4      000917 R
  6 MMSMa      000912 R   |   6 MMSMb      00091D R   |   6 MODD       000991 R
  6 MONE       000AFA R   |     MS      =  00002E     |   6 MSEC       0002CE R
  6 MSMOD      00092F R   |   6 MSTA1      000A22 R   |   6 MSTAR      0009FF R
    NAFR    =  004804     |   6 NAMEQ      001256 R   |   6 NAMET      001167 R
    NCLKOPT =  004808     |   6 NEGAT      0007C0 R   |   6 NEX1       000496 R
  6 NEXT       001543 R   |     NFLASH_W=  00480E     |     NHSECNT =  00480A 
    NOPT1   =  004802     |     NOPT2   =  004804     |     NOPT3   =  004806 
    NOPT4   =  004808     |     NOPT5   =  00480A     |     NOPT6   =  00480C 
    NOPT7   =  00480E     |     NOPTBL  =  00487F     |   6 NTIB       000685 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]

Symbol Table

    NUBC    =  004802     |     NUCLEO  =  000001     |   6 NUFQ       000EDD R
  6 NUFQ1      000EF6 R   |   6 NUMBQ      000DF4 R   |   6 NUMQ1      000E28 R
  6 NUMQ2      000E59 R   |   6 NUMQ3      000E9B R   |   6 NUMQ4      000EA0 R
  6 NUMQ5      000EAF R   |   6 NUMQ6      000EB2 R   |     NWDGOPT =  004806 
    NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF 
    NWDGOPT_=  FFFFFFFE     |   6 NonHandl   000000 R   |   6 OFFSET     00072B R
    OFS     =  000005     |   6 ONE        000AEC R   |   6 ONEM       000A82 R
  6 ONEP       000A75 R   |     OPT     =  000002     |     OPT0    =  004800 
    OPT1    =  004801     |     OPT2    =  004803     |     OPT3    =  004805 
    OPT4    =  004807     |     OPT5    =  004809     |     OPT6    =  00480B 
    OPT7    =  00480D     |     OPTBL   =  00487E     |     OPTIMIZE=  000001 
    OPTION_B=  004800     |     OPTION_E=  00487F     |     OPTION_S=  000080 
  6 ORIG       000047 R   |   6 ORR        0005FA R   |   6 OUTPUT     000439 R
    OUTPUT_F=  000001     |     OUTPUT_O=  000000     |     OUTPUT_P=  000001 
    OUTPUT_S=  000000     |   6 OVER       0005C4 R   |   6 OVERT      001713 R
    PA      =  000000     |   6 PACKS      000C8F R   |   6 PAD        000BE0 R
  6 PAREN      00111A R   |   6 PARS       001013 R   |   6 PARS1      00103E R
  6 PARS2      001069 R   |   6 PARS3      00106C R   |   6 PARS4      001075 R
  6 PARS5      001098 R   |   6 PARS6      0010AD R   |   6 PARS7      0010BC R
  6 PARS8      0010CB R   |   6 PARSE      0010DC R   |   6 PAUSE      0002DE R
    PA_BASE =  005000     |     PA_CR1  =  005003     |     PA_CR2  =  005004 
    PA_DDR  =  005002     |     PA_IDR  =  005001     |     PA_ODR  =  005000 
    PB      =  000005     |     PB_BASE =  005005     |     PB_CR1  =  005008 
    PB_CR2  =  005009     |     PB_DDR  =  005007     |     PB_IDR  =  005006 
    PB_ODR  =  005005     |     PC      =  00000A     |     PC_BASE =  00500A 
    PC_CR1  =  00500D     |     PC_CR2  =  00500E     |     PC_DDR  =  00500C 
    PC_IDR  =  00500B     |     PC_ODR  =  00500A     |     PD      =  00000F 
  6 PDUM1      00193D R   |   6 PDUM2      00194E R   |     PD_BASE =  00500F 
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
    PI      =  000028     |   6 PICK       000B3A R   |   6 PII        00223A R
    PI_BASE =  005028     |     PI_CR1  =  00502B     |     PI_CR2  =  00502C 
    PI_DDR  =  00502A     |     PI_IDR  =  005029     |     PI_ODR  =  005028 
  6 PLUS       000795 R   |   6 PNAM1      0016C8 R   |   6 PRESE      00144A R
    PROD1   =  000022     |     PROD2   =  000024     |     PROD3   =  000026 
  6 PROTECTE   0001FF R   |   6 PSTOR      000B51 R   |     PTR16   =  000033 
    PTR8    =  000034     |   6 PTRPLUS    001C99 R   |   6 QBRAN      0004A8 R
  6 QDUP       000744 R   |   6 QDUP1      00074E R   |   6 QKEY       000416 R
  6 QSTAC      001402 R   |   6 QUERY      00132E R   |   6 QUEST      001005 R
  6 QUIT       001467 R   |   6 QUIT1      00146F R   |   6 QUIT2      001472 R
  6 RAM2EE     0020D4 R   |     RAMBASE =  000000     |   6 RAMLAST    000719 R
    RAM_BASE=  000000     |     RAM_END =  0017FF     |     RAM_SIZE=  001800 
  6 RANDOM     00027C R   |   6 RAT        000557 R   |   6 RBRAC      001787 R
  6 REPEA      00160C R   |   6 RFREE      0020BB R   |   6 RFROM      000544 R
    ROP     =  004800     |   6 ROT        000755 R   |   6 ROW2BUF    00207D R
    ROWBUFF =  001680     |     RP0     =  00002C     |   6 RPAT       000521 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
Hexadecimal [24-Bits]

Symbol Table

    RPP     =  0017FF     |   6 RPSTO      00052E R   |   6 RSHIFT     000AAF R
  6 RSHIFT1    000AB8 R   |   6 RSHIFT4    000AC0 R   |     RST_SR  =  0050B3 
  6 RT12_2     0022AA R   |   6 SAME1      001185 R   |   6 SAME2      0011AE R
  6 SAMEQ      00117D R   |   6 SCOM1      0016FD R   |   6 SCOM2      001700 R
  6 SCOMP      0016DF R   |   6 SEED       000263 R   |     SEEDX   =  000036 
    SEEDY   =  000038     |   6 SEMIS      001723 R   |   6 SETISP     0000CE R
  6 SET_RAML   00186A R   |     SFR_BASE=  005000     |     SFR_END =  0057FF 
  6 SIGN       000D3B R   |   6 SIGN1      000D4B R   |   6 SLASH      00099B R
  6 SLMOD      00097F R   |   6 SNAME      001692 R   |     SP0     =  00002A 
  6 SPACE      000EFF R   |   6 SPACS      000F0E R   |   6 SPAT       00057A R
    SPI_CR1 =  005200     |     SPI_CR2 =  005201     |     SPI_CRCP=  005205 
    SPI_DR  =  005204     |     SPI_ICR =  005202     |     SPI_RXCR=  005206 
    SPI_SR  =  005203     |     SPI_TXCR=  005207     |     SPP     =  001680 
    SPSAVE  =  000001     |   6 SPSTO      000587 R   |   6 SQRT10     002293 R
  6 SQRT2      002251 R   |   6 SQRT3      002268 R   |   6 SSMOD      000A2B R
    SSP     =  000001     |     STACK   =  0017FF     |   6 STAR       0009F4 R
  6 STASL      000A3C R   |   6 STOD       0007F7 R   |   6 STORE      0004DC R
  6 STR        000D69 R   |   6 STRCQ      001514 R   |   6 STRQ       00164B R
  6 STRQP      000F7C R   |   6 SUBB       00080E R   |   6 SWAPP      0005AA R
    SWIM_CSR=  007F80     |   6 TAP        001298 R   |   6 TBOOT      001A8C R
  6 TBUF       000695 R   |     TBUFFBAS=  001680     |   6 TCHAR      000B0B R
  6 TEMP       000666 R   |   6 TEVAL      0006B8 R   |   6 TFLASH     0006A7 R
  6 THENN      0015A4 R   |   6 TIB        000BF1 R   |     TIBB    =  001700 
    TIBBASE =  001700     |     TIC     =  000027     |   6 TICK       00147E R
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
    TIM_CR1_=  000002     |   6 TNAM2      0019D3 R   |   6 TNAM3      0019F1 R
  6 TNAM4      0019F7 R   |   6 TNAME      0019D0 R   |   6 TOFLASH    000333 R
  6 TOKEN      001159 R   |   6 TOR        000563 R   |   6 TORAM      000373 R
    TRUEE   =  00FFFF     |   6 TWOSL      000AC7 R   |   6 TYPE1      000F2E R
  6 TYPE2      000F3A R   |   6 TYPES      000F29 R   |   6 Timer4Ha   000005 R
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
    UD4     =  000004     |   6 UDOT       000FCF R   |   6 UDOTR      000FAF R
  6 UEND       000045 R   |     UHLD    =  000012     |     UINN    =  00000A 
    UINTER  =  000010     |     ULAST   =  00001A     |   6 ULES1      00086B R
  6 ULESS      000855 R   |   6 UMMOD      0008EB R   |   6 UMSTA      0009AA R
  6 UNIQ1      001689 R   |   6 UNIQU      00166A R   |   6 UNLKEE     001C07 R
  6 UNLKFL     001C26 R   |   6 UNLOCK     001C45 R   |   6 UNTIL      00156C R
    UOFFSET =  00001C     |   6 UPDATCP    001BC4 R   |   6 UPDATLAS   001B9B R
  6 UPDATPTR   0021C7 R   |   6 UPDATRUN   001BB3 R   |   6 UPDATVP    001BDB R
  6 UPL1       00063B R   |   6 UPLUS      000624 R   |     UPP     =  000006 
    URLAST  =  000020     |     USR_BTN_=  000004     |     USR_BTN_=  000010 
    USR_BTN_=  005015     |     UTFLASH =  00001E     |     UTIB    =  00000E 
    UTMP    =  000008     |   6 UTYP1      00190D R   |   6 UTYP2      00191C R
  6 UTYPE      001908 R   |     UVP     =  000016     |   6 UZERO      00002B R
  6 VARIA      001837 R   |     VAR_BASE=  000080     |     VAR_TOP =  0017BF 
    VER     =  000003     |   6 VPP        0006E8 R   |     VSIZE   =  000006 
    WANT_CON=  000001     |     WANT_DEB=  000000     |     WANT_SCA=  000001 
    WANT_SEE=  000000     |     WDGOPT  =  004805     |     WDGOPT_I=  000002 
    WDGOPT_L=  000003     |     WDGOPT_W=  000000     |     WDGOPT_W=  000001 
  6 WHILE      0015F2 R   |   6 WITHI      0008D0 R   |   6 WORDD      001145 R
  6 WORDS      001A2D R   |   6 WORS1      001A33 R   |   6 WORS2      001A4F R
  6 WR_BYTE    001CF0 R   |   6 WR_WORD    001D15 R   |   6 WTABLE     00231F R
  6 WTAT       002343 R   |   6 WTINIT     002388 R   |     WWDG_CR =  0050D1 
    WWDG_WR =  0050D2     |     XMEM_SIZ=  017830     |     XOFF    =  000013 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]

Symbol Table

    XON     =  000011     |   6 XORR       00060F R   |     XTEMP   =  000022 
    YTEMP   =  000024     |   6 ZERO       000AE1 R   |   6 ZL1        0005DC R
  6 ZLESS      0005D3 R   |   6 app_spac   002400 R   |   6 baudrate   000379 R
  6 block_er   001DDB R   |   6 clear_ra   000019 R   |   6 clock_in   000062 R
  6 copy_buf   001E3B R   |   6 copy_buf   001E5A R   |   6 copy_pro   001E5A R
    da      =  000002     |     db      =  000003     |     dc      =  000000 
    dd      =  000001     |   6 erase_fl   001DFD R   |   6 fmove_do   0021B0 R
  6 main       000016 R   |   6 next_row   00216D R   |   6 no_move    0021B7 R
  6 pristine   001EDB R   |   6 proceed_   001E00 R   |   6 reboot     000325 R
  6 reset_ve   001F42 R   |   6 row_eras   001DBB R   |   6 row_eras   001E14 R
  6 row_eras   001E3B R   |   6 set_opti   001EAF R   |   6 set_vect   001FE3 R
  6 uart_ini   000074 R   |   6 write_ro   001E7F R

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

