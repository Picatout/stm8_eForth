ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 1.
Hexadecimal [24-Bits]



                                      1 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                      2 ;; Copyright Jacques Deschênes 2019,2020,2021 
                                      3 ;; This file is part of stm32_eforth  
                                      4 ;;
                                      5 ;;     stm8_eforth is free software: you can redistribute it and/or modify
                                      6 ;;     it under the terms of the GNU General Public License as published by
                                      7 ;;     the Free Software Foundation, either version 3 of the License, or
                                      8 ;;     (at your option) any later version.
                                      9 ;;
                                     10 ;;     stm32_eforth is distributed in the hope that it will be useful,
                                     11 ;;     but WITHOUT ANY WARRANTY;; without even the implied warranty of
                                     12 ;;     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                                     13 ;;     GNU General Public License for more details.
                                     14 ;;
                                     15 ;;     You should have received a copy of the GNU General Public License
                                     16 ;;     along with stm32_eforth.  If not, see <http:;;www.gnu.org/licenses/>.
                                     17 ;;;;
                                     18 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     19 
                                     20 ;-------------------------------------------------------------
                                     21 ;  eForth for STM8S adapted from C. H. Ting source file to 
                                     22 ;  assemble using sdasstm8
                                     23 ;  implemented on NUCLEO-8S208RB board
                                     24 ;  Adapted by picatout 2019/10/27
                                     25 ;  https://github.com/picatout/stm8_nucleo/eForth
                                     26 ;--------------------------------------------------------------
                                     27 	.module EFORTH
                                     28          .optsdcc -mstm8
                                                .include "inc/macros.inc" 
                                        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        ;; Copyright Jacques Deschênes 2019,2020,2021 
                                        ;; This file is part of stm32_eforth  
                                        ;;
                                        ;;     stm8_eforth is free software: you can redistribute it and/or modify
                                        ;;     it under the terms of the GNU General Public License as published by
                                        ;;     the Free Software Foundation, either version 3 of the License, or
                                        ;;     (at your option) any later version.
                                        ;;
                                        ;;     stm32_eforth is distributed in the hope that it will be useful,
                                        ;;     but WITHOUT ANY WARRANTY;; without even the implied warranty of
                                        ;;     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                                        ;;     GNU General Public License for more details.
                                        ;;
                                        ;;     You should have received a copy of the GNU General Public License
                                        ;;     along with stm32_eforth.  If not, see <http:;;www.gnu.org/licenses/>.
                                        ;;;;
                                        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        
                                        ;--------------------------------------
                                        ;   console Input/Output module
                                        ;   DATE: 2019-12-11
                                        ;    
                                        ;   General usage macros.   
                                        ;
                                        ;--------------------------------------
                                        
                                            ; reserve space on stack
                                            ; for local variabls
                                            .macro _vars n 
                                            
                                            ; declare ARG_OFS for arguments 
                                            ; displacement on stack. This 
                                            ; value depend on local variables 
                                            ; size.
                                            .macro _argofs n 
                                        
                                            ; declare a function argument 
                                            ; position relative to stack pointer 
                                            ; _argofs must be called before it.
                                            .macro _arg name ofs 
                                        
                                            ; macro to create dictionary header record
                                            .macro _HEADER label,len,name 
                                        
                                            ; runtime literal 
                                            .macro _DOLIT value 
                                        
                                            ; branch if TOS<>0
                                            ; TBRANCH 
                                            .macro _TBRAN target 
                                            
                                            ; branch if TOS==0 
                                            ; 0BRANCH 
                                            .macro _QBRAN target 
                                        
                                            ; uncondittionnal BRANCH 
                                            .macro _BRAN target 
                                        
                                            ; run time NEXT 
                                            .macro _DONXT target 
                                        
                                            ; drop TOS 
                                            .macro _DROP 
                                          
                                           ; drop a double 
                                           .macro _DDROP 
                                        
                                                .include "inc/config.inc"
                                        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        ;; Copyright Jacques Deschênes 2019,2020,2021 
                                        ;; This file is part of stm32_eforth  
                                        ;;
                                        ;;     stm8_eforth is free software: you can redistribute it and/or modify
                                        ;;     it under the terms of the GNU General Public License as published by
                                        ;;     the Free Software Foundation, either version 3 of the License, or
                                        ;;     (at your option) any later version.
                                        ;;
                                        ;;     stm32_eforth is distributed in the hope that it will be useful,
                                        ;;     but WITHOUT ANY WARRANTY;; without even the implied warranty of
                                        ;;     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                                        ;;     GNU General Public License for more details.
                                        ;;
                                        ;;     You should have received a copy of the GNU General Public License
                                        ;;     along with stm32_eforth.  If not, see <http:;;www.gnu.org/licenses/>.
                                        ;;;;
                                        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        
                                        
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
                                 
                                        
                                        ; include double library 
                                 
                                        
                                        ; to include floating point 
                                        ; library
                                        ; require double library  
                                 
                                        
                                        ; set to 1 to make vocabulary 
                                        ; case sensitive 
                                 
                                        
                                        ; how many bytes are reserved 
                                        ; by system at EEPROM base.
                                 
                                        
                                 
                                        	.include "inc/nucleo_8s208.inc"
                                        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        ;; Copyright Jacques Deschênes 2019,2020,2021 
                                        ;; This file is part of stm32_eforth  
                                        ;;
                                        ;;     stm8_eforth is free software: you can redistribute it and/or modify
                                        ;;     it under the terms of the GNU General Public License as published by
                                        ;;     the Free Software Foundation, either version 3 of the License, or
                                        ;;     (at your option) any later version.
                                        ;;
                                        ;;     stm32_eforth is distributed in the hope that it will be useful,
                                        ;;     but WITHOUT ANY WARRANTY;; without even the implied warranty of
                                        ;;     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                                        ;;     GNU General Public License for more details.
                                        ;;
                                        ;;     You should have received a copy of the GNU General Public License
                                        ;;     along with stm32_eforth.  If not, see <http:;;www.gnu.org/licenses/>.
                                        ;;;;
                                        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        
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
                                        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        ;; Copyright Jacques Deschênes 2019,2020,2021 
                                        ;; This file is part of stm32_eforth  
                                        ;;
                                        ;;     stm8_eforth is free software: you can redistribute it and/or modify
                                        ;;     it under the terms of the GNU General Public License as published by
                                        ;;     the Free Software Foundation, either version 3 of the License, or
                                        ;;     (at your option) any later version.
                                        ;;
                                        ;;     stm32_eforth is distributed in the hope that it will be useful,
                                        ;;     but WITHOUT ANY WARRANTY;; without even the implied warranty of
                                        ;;     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                                        ;;     GNU General Public License for more details.
                                        ;;
                                        ;;     You should have received a copy of the GNU General Public License
                                        ;;     along with stm32_eforth.  If not, see <http:;;www.gnu.org/licenses/>.
                                        ;;;;
                                        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        
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
                                        
                                        	
                                         
                                        
                                        
                                        
                                     32 	.list
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 2.
Hexadecimal [24-Bits]



                                     34 
                                     35 ;===============================================================
                                     36 ;  Adaption to NUCLEO-8S208RB by Picatout
                                     37 ;  Date: 2020-06-07 
                                     38 ;       Suite aux nombreux changement remplacé le numéro de version pour 3.0
                                     39 ;  Date: 2019-10-26
                                     40 ;  Changes to memory map:
                                     41 ;       0x16f0  Data Stack, growing downward
                                     42 ;       0x1700  Terminal input buffer TIB
                                     43 ;       0x17ff  Return Stack, growing downard
                                     44 ;================================================================
                                     45 ;       STM8EF, Version 2.1, 13 July
                                     46 ;               Implemented on STM8S-Discovery Board.
                                     47 ;               Assembled by ST VisualDevelop STVD 
                                     48 ;               Bootup on internal 2 MHz clock
                                     49 ;               Switch to external 16 MHz crystal clock
                                     50 ;
                                     51 ; FORTH Virtual Machine:
                                     52 ; Subroutine threaded model
                                     53 ; SP Return stack pointer
                                     54 ; X Data stack pointer
                                     55 ; A,Y Scratch pad registers
                                     56 ;
                                     57 ; Memory Map:
                                     58 ; 0x0 RAM memory, system variables
                                     59 ; 0x80 Start of user defined words, linked to ROM dictionary
                                     60 ; 0x780 Data stack, growing downward
                                     61 ; 0x790 Terminal input buffer TIB
                                     62 ; 0x7FF Return stack, growing downward
                                     63 ; 0x8000 Interrupt vector table
                                     64 ; 0x8080 FORTH startup code
                                     65 ; 0x80E7 Start of FORTH dictionary in ROM
                                     66 ; 0x9584 End of FORTH dictionary
                                     67 ;
                                     68 ;       2020-04-26 Addapted for NUCLEO-8S208RB by Picatout 
                                     69 ;                  use UART1 instead of UART2 for communication with user.
                                     70 ;                  UART1 is available as ttyACM* device via USB connection.
                                     71 ;                  Use TIMER4 for millisecond interrupt to support MS counter 
                                     72 ;                  and MSEC word that return MS value.
                                     73 ;
                                     74 ;       EF12, Version 2.1, 18apr00cht
                                     75 ;               move to 8000H replacing WHYP.
                                     76 ;               copy interrupt vectors from WHYPFLSH.S19
                                     77 ;               to EF12.S19 before flashing
                                     78 ;               add TICKS1 and DELAY1 for motor stepping
                                     79 ;
                                     80 ;       EF12, 02/18/00, C. H. Ting
                                     81 ;       Adapt 86eForth v2.02 to 68HC12.
                                     82 ;               Use WHYP to seed EF12.ASM
                                     83 ;               Use AS12 native 68HC12 assembler:
                                     84 ;               as12 ef12.asm >ef12.lst
                                     85 ;       EF12A, add ADC code, 02mar00cht
                                     86 ;       EF12B, 01mar00cht
                                     87 ;               stack to 0x78, return stack to 0xf8.
                                     88 ;               add all port definitions
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 3.
Hexadecimal [24-Bits]



                                     89 ;               add PWM registers
                                     90 ;               add SPI registers and code
                                     91 ;       EF12C, 12mar00cht
                                     92 ;               add MAX5250 D/A converter
                                     93 ;       EF12D, 15mar00cht
                                     94 ;               add all the Lexel interface words
                                     95 ;       EF12E, 18apr00cht, save for reference
                                     96 ;
                                     97 ;       Copyright (c) 2000
                                     98 ;       Dr. C. H. Ting
                                     99 ;       156 14th Avenue
                                    100 ;       San Mateo, CA 94402
                                    101 ;       (650) 571-7639
                                    102 ;
                                    103 
                                    104       
                                    105 ;*********************************************************
                                    106 ;	Assembler constants
                                    107 ;*********************************************************
                           000000   108 RAMBASE =	0x0000	   ;ram base
                           000001   109 .if NUCLEO 
                           0017FF   110 STACK   =	0x17FF 	;system (return) stack empty 
                           001680   111 DATSTK  =	0x1680	;data stack  empty
                           001680   112 TBUFFBASE =     0x1680  ; flash read/write transaction buffer address  
                           001700   113 TIBBASE =       0X1700  ; transaction input buffer addr.
                           000000   114 .else ; DISCOVERY
                                    115 STACK   =	0x7FF 	;system (return) stack empty 
                                    116 DATSTK  =	0x680	;data stack  empty
                                    117 TBUFFBASE =     0x680  ; flash read/write transaction buffer address  
                                    118 TIBBASE =       0X700  ; transaction input buffer addr.
                                    119 .endif
                                    120 
                                    121 ;; Memory allocation
                           000006   122 UPP     =     RAMBASE+6          ; systeme variables base address 
                           001680   123 SPP     =     RAMBASE+DATSTK     ; data stack bottom 
                           0017FF   124 RPP     =     RAMBASE+STACK      ;  return stack bottom
                           001680   125 ROWBUFF =     RAMBASE+TBUFFBASE ; flash write buffer 
                           001700   126 TIBB    =     RAMBASE+TIBBASE  ; transaction input buffer
                           000080   127 VAR_BASE =    RAMBASE+0x80  ; user variables start here .
                           0017BF   128 VAR_TOP =     STACK-32*CELLL  ; reserve 32 cells for data stack. 
                                    129 
                                    130 ; user variables constants 
                           000006   131 UBASE = UPP       ; numeric base 
                           000008   132 UFPSW = UBASE+2  ; floating point state word 
                           00000A   133 UTMP = UFPSW+2    ; temporary storage
                           00000C   134 UINN = UTMP+2     ; >IN tib pointer 
                           00000E   135 UCTIB = UINN+2    ; tib count 
                           000010   136 UTIB = UCTIB+2    ; tib address 
                           000012   137 UINTER = UTIB+2   ; interpreter vector 
                           000014   138 UHLD = UINTER+2   ; hold 
                           000016   139 UCNTXT = UHLD+2   ; context, dictionary first link 
                           000018   140 UVP = UCNTXT+2    ; variable pointer 
                           00001A   141 UCP = UVP+2      ; code pointer
                           00001C   142 ULAST = UCP+2    ; last dictionary pointer 
                           00001E   143 UOFFSET = ULAST+2 ; distance between CP and VP to adjust jump address at compile time.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 4.
Hexadecimal [24-Bits]



                           000020   144 UTFLASH = UOFFSET+2 ; select where between FLASH and RAM for compilation destination. 
                           000022   145 URLAST = UTFLASH+2 ; context for dictionary in RAM memory 
                                    146 
                                    147 ;******  System Variables  ******
                           000024   148 XTEMP	=	URLAST +2;address called by CREATE
                           000026   149 YTEMP	=	XTEMP+2	;address called by CREATE
                           000024   150 PROD1 = XTEMP	;space for UM*
                           000026   151 PROD2 = PROD1+2
                           000028   152 PROD3 = PROD2+2
                           00002A   153 CARRY = PROD3+2
                           00002C   154 SP0	= CARRY+2	;initial data stack pointer
                           00002E   155 RP0	= SP0+2		;initial return stack pointer
                           000030   156 MS    =   RP0+2         ; millisecond counter 
                           000032   157 CNTDWN =  MS+2          ; count down timer 
                           000034   158 FPTR = CNTDWN+2         ; 24 bits farptr 
                           000035   159 PTR16 = FPTR+1          ; middle byte of farptr 
                           000036   160 PTR8 = FPTR+2           ; least byte of farptr 
                           000038   161 SEEDX = PTR8+2          ; PRNG seed X 
                           00003A   162 SEEDY = SEEDX+2         ; PRNG seed Y 
                                    163 
                                    164 ; EEPROM persistant data  
                           004000   165 APP_LAST = EEPROM_BASE ; Application last word pointer  
                           004002   166 APP_RUN = APP_LAST+2   ; application autorun address 
                           004004   167 APP_CP = APP_RUN+2   ; free application space pointer 
                           004006   168 APP_VP = APP_CP+2  ; free data space pointer 
                                    169 
                                    170 
                                    171 ;***********************************************
                                    172 ;; Version control
                                    173 
                           000004   174 VER     =     4         ;major release version
                           000000   175 EXT     =     0         ;minor extension
                                    176 
                                    177 ;; Constants
                                    178 
                           00FFFF   179 TRUEE   =     0xFFFF      ;true flag
                                    180 
                           000040   181 COMPO   =     0x40     ;lexicon compile only bit
                           000080   182 IMEDD   =     0x80     ;lexicon immediate bit
                           001F7F   183 MASKK   =     0x1F7F  ;lexicon bit mask
                                    184 
                           000002   185 CELLL   =     2       ;size of a cell
                           00000A   186 BASEE   =     10      ;default radix
                           000008   187 BKSPP   =     8       ;back space
                           00000A   188 LF      =     10      ;line feed
                           00000D   189 CRR     =     13      ;carriage return
                           000011   190 XON     =     17
                           000013   191 XOFF    =     19
                           00001B   192 ERR     =     27      ;error escape
                           000027   193 TIC     =     39      ;tick
                           0000CD   194 CALLL   =     0xCD     ;CALL opcodes
                           000080   195 IRET_CODE =   0x80    ; IRET opcode 
                                    196 
                                    197         .macro _ledon
                                    198         .if NUCLEO
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 5.
Hexadecimal [24-Bits]



                                    199         bset PC_ODR,#LED2_BIT
                                    200         .else ;DISCOVERY 
                                    201         .if DISCOVERY
                                    202         bres PD_ODR,#LD1_BIT 
                                    203         .endif
                                    204         .endif
                                    205         .endm
                                    206 
                                    207         .macro _ledoff
                                    208         .if NUCLEO 
                                    209         bres PC_ODR,#LED2_BIT
                                    210         .else ;DISCOVERY 
                                    211         .if DISCOVERY
                                    212         bset PD_ODR,#LD1_BIT 
                                    213         .endif 
                                    214         .endif
                                    215         .endm
                                    216 
                                    217 ;**********************************************************
                                    218         .area DATA (ABS)
      000000                        219         .org RAMBASE 
                                    220 ;**********************************************************
                                    221 
                                    222 ;**********************************************************
                                    223         .area SSEG (ABS) ; STACK
      001700                        224         .org 0x1700
      001700                        225         .ds 256 
                                    226 ; space for DATSTK,TIB and STACK         
                                    227 ;**********************************************************
                                    228 
                                    229 ;**********************************************************
                                    230         .area HOME ; vectors table
                                    231 ;**********************************************************
      008000 82 00 80 96            232 	int main	        ; reset
      008004 82 00 80 80            233 	int NonHandledInterrupt	; trap
      008008 82 00 80 80            234 	int NonHandledInterrupt	; irq0
      00800C 82 00 80 80            235 	int NonHandledInterrupt	; irq1
      008010 82 00 80 80            236 	int NonHandledInterrupt	; irq2
      008014 82 00 80 80            237 	int NonHandledInterrupt	; irq3
      008018 82 00 80 80            238 	int NonHandledInterrupt	; irq4
      00801C 82 00 80 80            239 	int NonHandledInterrupt	; irq5
      008020 82 00 80 80            240 	int NonHandledInterrupt	; irq6
      008024 82 00 80 80            241 	int NonHandledInterrupt	; irq7
      008028 82 00 80 80            242 	int NonHandledInterrupt	; irq8
      00802C 82 00 80 80            243 	int NonHandledInterrupt	; irq9
      008030 82 00 80 80            244 	int NonHandledInterrupt	; irq10
      008034 82 00 80 80            245 	int NonHandledInterrupt	; irq11
      008038 82 00 80 80            246 	int NonHandledInterrupt	; irq12
      00803C 82 00 80 80            247 	int NonHandledInterrupt	; irq13
      008040 82 00 80 80            248 	int NonHandledInterrupt	; irq14
      008044 82 00 80 80            249 	int NonHandledInterrupt	; irq15
      008048 82 00 80 80            250 	int NonHandledInterrupt	; irq16
      00804C 82 00 80 80            251 	int NonHandledInterrupt	; irq17
      008050 82 00 80 80            252 	int NonHandledInterrupt	; irq18
      008054 82 00 80 80            253 	int NonHandledInterrupt	; irq19
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 6.
Hexadecimal [24-Bits]



      008058 82 00 80 80            254 	int NonHandledInterrupt	; irq20
      00805C 82 00 80 80            255 	int NonHandledInterrupt	; irq21
      008060 82 00 80 80            256 	int NonHandledInterrupt	; irq22
      008064 82 00 80 85            257 	int Timer4Handler	; irq23
      008068 82 00 80 80            258 	int NonHandledInterrupt	; irq24
      00806C 82 00 80 80            259 	int NonHandledInterrupt	; irq25
      008070 82 00 80 80            260 	int NonHandledInterrupt	; irq26
      008074 82 00 80 80            261 	int NonHandledInterrupt	; irq27
      008078 82 00 80 80            262 	int NonHandledInterrupt	; irq28
      00807C 82 00 80 80            263 	int NonHandledInterrupt	; irq29
                                    264 
                                    265 ;**********************************************************
                                    266         .area CODE
                                    267 ;**********************************************************
                                    268 
                                    269 ; non handled interrupt reset MCU
      008080                        270 NonHandledInterrupt:
      008080 A6 80            [ 1]  271         ld a, #0x80
      008082 C7 50 D1         [ 1]  272         ld WWDG_CR,a ; WWDG_CR used to reset mcu
                                    273 	;iret
                                    274 
                                    275 ; used for milliseconds counter 
                                    276 ; MS is 16 bits counter 
      008085                        277 Timer4Handler:
      008085 72 5F 53 42      [ 1]  278 	clr TIM4_SR 
      008089 BE 30            [ 2]  279         ldw x,MS 
      00808B 5C               [ 1]  280         incw x 
      00808C BF 30            [ 2]  281         ldw MS,x
      00808E BE 32            [ 2]  282         ldw x,CNTDWN 
      008090 27 03            [ 1]  283         jreq 1$
      008092 5A               [ 2]  284         decw x 
      008093 BF 32            [ 2]  285         ldw CNTDWN,x 
      008095                        286 1$:         
      008095 80               [11]  287         iret 
                                    288 
                                    289 
                                    290 ;; Main entry points and COLD start data
      008096                        291 main:
                                    292 ; clear all RAM
      008096 AE 00 00         [ 2]  293 	ldw X,#RAMBASE
      008099                        294 clear_ram0:
      008099 7F               [ 1]  295 	clr (X)
      00809A 5C               [ 1]  296 	incw X
      00809B A3 17 FF         [ 2]  297 	cpw X,#RAM_END
      00809E 23 F9            [ 2]  298 	jrule clear_ram0
      0080A0 AE 17 FF         [ 2]  299         ldw x,#RPP
      0080A3 94               [ 1]  300         ldw sp,x
                                    301 ; set SEEDX and SEEDY to 1 
      0080A4 3C 39            [ 1]  302         inc SEEDX+1 
      0080A6 3C 3B            [ 1]  303         inc SEEDY+1          
      0080A8 CC 80 C9         [ 2]  304 	jp ORIG
                                    305 
                                    306 ; COLD initialize these variables.
      0080AB                        307 UZERO:
      0080AB 00 0A                  308         .word      BASEE   ;BASE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 7.
Hexadecimal [24-Bits]



      0080AD 00 00                  309         .word      0       ; floating point state 
      0080AF 00 00                  310         .word      0       ;tmp
      0080B1 00 00                  311         .word      0       ;>IN
      0080B3 00 00                  312         .word      0       ;#TIB
      0080B5 17 00                  313         .word      TIBB    ;TIB
      0080B7 94 A6                  314         .word      INTER   ;'EVAL
      0080B9 00 00                  315         .word      0       ;HLD
      0080BB B5 E9                  316         .word      LASTN  ;CNTXT pointer
      0080BD 00 80                  317         .word      VAR_BASE   ;variables free space pointer 
      0080BF B6 80                  318         .word      app_space ; FLASH free space pointer 
      0080C1 B5 E9                  319         .word      LASTN   ;LAST
      0080C3 00 00                  320         .word      0        ; OFFSET 
      0080C5 00 00                  321         .word      0       ; TFLASH
                                    322 ;       .word      0       ; URLAST   
      0080C7 00 00                  323 UEND:   .word      0
                                    324 
      0080C9                        325 ORIG:   
                                    326 ; initialize SP
      0080C9 AE 17 FF         [ 2]  327         LDW     X,#STACK  ;initialize return stack
      0080CC 94               [ 1]  328         LDW     SP,X
      0080CD BF 2E            [ 2]  329         LDW     RP0,X
      0080CF AE 16 80         [ 2]  330         LDW     X,#DATSTK ;initialize data stack
      0080D2 BF 2C            [ 2]  331         LDW     SP0,X
                           000001   332 .if NUCLEO        
                                    333 ; initialize PC_5 as output to control LED2
                                    334 ; added by Picatout 
      0080D4 72 1A 50 0D      [ 1]  335         bset PC_CR1,#LED2_BIT
      0080D8 72 1A 50 0E      [ 1]  336         bset PC_CR2,#LED2_BIT
      0080DC 72 1A 50 0C      [ 1]  337         bset PC_DDR,#LED2_BIT
                                    338 .endif 
                           000000   339 .if DISCOVERY
                                    340         bset PD_CR1,#LD1_BIT
                                    341         bset PD_CR2,#LD1_BIT
                                    342         bset PD_DDR,#LD1_BIT 
                                    343 .endif
      000060                        344         _ledoff
                           000001     1         .if NUCLEO 
      0080E0 72 1B 50 0A      [ 1]    2         bres PC_ODR,#LED2_BIT
                           000000     3         .else ;DISCOVERY 
                                      4         .if DISCOVERY
                                      5         bset PD_ODR,#LD1_BIT 
                                      6         .endif 
                                      7         .endif
                                    345 ; initialize clock to HSI
                                    346 ; no divisor 16Mhz 
                                    347 ; Added by Picatout 
      0080E4                        348 clock_init:
      0080E4 72 5F 50 C6      [ 1]  349         clr CLK_CKDIVR
      0080E8 72 12 50 C5      [ 1]  350 	bset CLK_SWCR,#CLK_SWCR_SWEN
                           000001   351 .if NUCLEO|DOORBELL
      0080EC A6 E1            [ 1]  352 	ld a,#CLK_SWR_HSI
                           000000   353 .else ; DISCOVERY as 16Mhz crystal
                                    354 	ld a,#CLK_SWR_HSE
                                    355 .endif 
      0080EE C7 50 C4         [ 1]  356 	ld CLK_SWR,a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 8.
Hexadecimal [24-Bits]



      0080F1 C1 50 C3         [ 1]  357 1$:	cp a,CLK_CMSR
      0080F4 26 FB            [ 1]  358 	jrne 1$
                                    359         
                                    360 ; initialize UART, 115200 8N1
      0080F6                        361 uart_init:
                           000001   362 .if NUCLEO 
      0080F6 72 14 50 C7      [ 1]  363 	bset CLK_PCKENR1,#CLK_PCKENR1_UART1
                                    364 	; configure tx pin
      0080FA 72 1A 50 02      [ 1]  365 	bset PA_DDR,#UART1_TX_PIN ; tx pin
      0080FE 72 1A 50 03      [ 1]  366 	bset PA_CR1,#UART1_TX_PIN ; push-pull output
      008102 72 1A 50 04      [ 1]  367 	bset PA_CR2,#UART1_TX_PIN ; fast output
                                    368 	; baud rate 115200 Fmaster=16Mhz  16000000/115200=139=0x8b
                           000000   369 .else ; DISCOVERY use UART2 
                                    370 	bset CLK_PCKENR1,#CLK_PCKENR1_UART2
                                    371 	; configure tx pin
                                    372 	bset PD_DDR,#UART2_TX_PIN ; tx pin
                                    373 	bset PD_CR1,#UART2_TX_PIN ; push-pull output
                                    374 	bset PD_CR2,#UART2_TX_PIN ; fast output
                                    375 .endif
                                    376 ; baud rate 115200 Fmaster=8Mhz  
      008106 35 0B 52 33      [ 1]  377 	mov UART_BRR2,#0x0b ; must be loaded first
      00810A 35 08 52 32      [ 1]  378 	mov UART_BRR1,#0x8
      00810E 35 0C 52 35      [ 1]  379 	mov UART_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN));|(1<<UART_CR2_RIEN))
                                    380 ; initialize timer4, used for millisecond interrupt  
      008112 35 07 53 45      [ 1]  381 	mov TIM4_PSCR,#7 ; prescale 128  
      008116 35 7D 53 46      [ 1]  382 	mov TIM4_ARR,#125 ; set for 1msec.
      00811A 35 05 53 40      [ 1]  383 	mov TIM4_CR1,#((1<<TIM4_CR1_CEN)|(1<<TIM4_CR1_URS))
      00811E 72 10 53 41      [ 1]  384 	bset TIM4_IER,#TIM4_IER_UIE 
                                    385 ; set TIM4 interrupt priority to highest
      008122 A6 3F            [ 1]  386         ld a,#~(IPR_MASK<<6)
      008124 C4 7F 75         [ 1]  387         and a,ITC_SPR6
      008127 AA C0            [ 1]  388         or a,#(IPR3<<6)
      008129 C7 7F 75         [ 1]  389         ld ITC_SPR6,a 
      00812C 9A               [ 1]  390         rim
      00812D CC 9C 16         [ 2]  391         jp  COLD   ;default=MN1
                                    392 
                           000000   393         LINK=0 
                                    394 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;        
                                    395 ;; place MCU in sleep mode with
                                    396 ;; halt opcode 
                                    397 ;; BYE ( -- )
                                    398 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0000B0                        399         _HEADER BYE,3,"BYE"
      008130 00 00                    1         .word LINK 
                           0000B2     2         LINK=.
      008132 03                       3         .byte 3  
      008133 42 59 45                 4         .ascii "BYE"
      008136                          5         BYE:
      008136 8E               [10]  400         halt 
      008137 81               [ 4]  401         ret 
                                    402 
                                    403 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    404 ; Enable interrupts 
                                    405 ; EI ( -- )
                                    406 ;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 9.
Hexadecimal [24-Bits]



      0000B8                        407         _HEADER EI,2,"EI"
      008138 81 32                    1         .word LINK 
                           0000BA     2         LINK=.
      00813A 02                       3         .byte 2  
      00813B 45 49                    4         .ascii "EI"
      00813D                          5         EI:
      00813D 9A               [ 1]  408         rim 
      00813E 81               [ 4]  409         ret 
                                    410 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    411 ; Disable interrupts
                                    412 ; DI ( -- )
                                    413 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      0000BF                        414         _HEADER DI,2,"DI"
      00813F 81 3A                    1         .word LINK 
                           0000C1     2         LINK=.
      008141 02                       3         .byte 2  
      008142 44 49                    4         .ascii "DI"
      008144                          5         DI:
      008144 9B               [ 1]  415         sim 
      008145 81               [ 4]  416         ret 
                                    417 
                                    418 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    419 ; set interrupt priority level 
                                    420 ; SET-ISP ( n1 n2 -- )
                                    421 ; n1 level {1..3}
                                    422 ; n2 vector {0..29}
                                    423 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0000C6                        424         _HEADER SETISP,7,"SET-ISP"
      008146 81 41                    1         .word LINK 
                           0000C8     2         LINK=.
      008148 07                       3         .byte 7  
      008149 53 45 54 2D 49 53 50     4         .ascii "SET-ISP"
      008150                          5         SETISP:
      008150 90 93            [ 1]  425         ldw y,x 
      008152 90 FE            [ 2]  426         ldw y,(y)
      008154 A6 04            [ 1]  427         ld a,#4 ; 4 slot per register 
                                    428 ;  quotient select register, remainder select slot in register.        
      008156 90 62            [ 2]  429         div y,a ; register=ITC_SPR1[Y], lshift=2*A 
      008158 A4 03            [ 1]  430         and a,#3 
      00815A 48               [ 1]  431         sll a ; 2*SLOT  lshift 
      00815B 72 A9 7F 70      [ 2]  432         addw y,#ITC_SPR1 
      00815F FF               [ 2]  433         ldw (x),y  ; ( level reg -- )
      008160 90 5F            [ 1]  434         clrw y 
      008162 90 97            [ 1]  435         ld yl,a 
      008164 1D 00 02         [ 2]  436         subw x,#CELLL 
      008167 FF               [ 2]  437         ldw (x),y  ; ( level reg lshift -- )
      008168 90 93            [ 1]  438         ldw y,x 
      00816A 90 EE 02         [ 2]  439         ldw y,(2,y) 
      00816D 90 F6            [ 1]  440         ld a,(y)   ; reg_value
      00816F 1D 00 02         [ 2]  441         subw x,#CELLL 
      008172 FF               [ 2]  442         ldw (x),y ; ( level reg lshift rval -- )
      008173 CD 86 C1         [ 4]  443         call OVER ; ( level reg lshift rval lshift -- )
      008176 CD 84 EF         [ 4]  444         call DOLIT 
      008179 00 03                  445         .word 3
      00817B CD 86 A9         [ 4]  446         call SWAPP  ; ( level reg lshift rval 3 lshift )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



      00817E CD 8C 35         [ 4]  447         call LSHIFT ; creat slot mask 
      008181 CD 88 F5         [ 4]  448         call INVER  ; ( level reg lshift rval mask )
      008184 CD 86 F6         [ 4]  449         call ANDD ; ( level reg lshift slot_masked )
      008187 CD 86 62         [ 4]  450         call TOR  ; ( level reg lshift -- R: slot_masked )
      00818A CD 88 5D         [ 4]  451         call ROT  ; ( reg lshift level )
      00818D CD 86 A9         [ 4]  452         call SWAPP ; ( reg level lshift )
      008190 CD 8C 35         [ 4]  453         call LSHIFT  ; ( reg slot_level -- )
      008193 CD 85 B4         [ 4]  454         call RFROM ; ( reg slot_level masked_val )
      008196 CD 87 0A         [ 4]  455         call ORR   ; ( reg updated_rval )
      008199 CD 86 A9         [ 4]  456         call SWAPP 
      00819C CD 85 70         [ 4]  457         call CSTOR
                                    458 
                                    459 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    460 ; sélectionne l'application 
                                    461 ; qui démarre automatique lors 
                                    462 ; d'un COLD start 
                                    463 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00011F                        464         _HEADER AUTORUN,7,"AUTORUN"
      00819F 81 48                    1         .word LINK 
                           000121     2         LINK=.
      0081A1 07                       3         .byte 7  
      0081A2 41 55 54 4F 52 55 4E     4         .ascii "AUTORUN"
      0081A9                          5         AUTORUN:
      0081A9 CD 92 6B         [ 4]  465         call TOKEN 
      0081AC CD 86 99         [ 4]  466         call DUPP 
      0081AF CD 85 18         [ 4]  467         call QBRAN 
      0081B2 82 8F                  468         .word FORGET2
      0081B4 CD 93 68         [ 4]  469         call NAMEQ
      0081B7 CD 88 4C         [ 4]  470         call QDUP 
      0081BA CD 85 18         [ 4]  471         call QBRAN 
      0081BD 82 8F                  472         .word FORGET2
      00013F                        473         _DROP 
      0081BF 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      0081C2 1D 00 04         [ 2]  474         subw x,#2*CELLL 
      0081C5 90 5F            [ 1]  475         clrw y 
      0081C7 FF               [ 2]  476         ldw (x),y 
      0081C8 90 AE 40 02      [ 2]  477         ldw y,#APP_RUN 
      0081CC EF 02            [ 2]  478         ldw (2,x),y 
      0081CE CC 9F 12         [ 2]  479         jp EESTORE 
                                    480 
                                    481 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    482 ;; Reset dictionary pointer before 
                                    483 ;; forgotten word. RAM space and 
                                    484 ;; interrupt vector defined after 
                                    485 ;; must be resetted also.
                                    486 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000151                        487         _HEADER FORGET,6,"FORGET"
      0081D1 81 A1                    1         .word LINK 
                           000153     2         LINK=.
      0081D3 06                       3         .byte 6  
      0081D4 46 4F 52 47 45 54        4         .ascii "FORGET"
      0081DA                          5         FORGET:
      0081DA CD 92 6B         [ 4]  488         call TOKEN
      0081DD CD 86 99         [ 4]  489         call DUPP 
      0081E0 CD 85 18         [ 4]  490         call QBRAN 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



      0081E3 82 8F                  491         .word FORGET2
      0081E5 CD 93 68         [ 4]  492         call NAMEQ ; ( a -- ca na | a F )
      0081E8 CD 88 4C         [ 4]  493         call QDUP 
      0081EB CD 85 18         [ 4]  494         call QBRAN 
      0081EE 82 8F                  495         .word FORGET2
                                    496 ; only forget users words 
      0081F0 CD 86 99         [ 4]  497         call DUPP ; ( ca na na )
      0081F3 CD 84 EF         [ 4]  498         call DOLIT 
      0081F6 B6 80                  499         .word app_space 
      0081F8 CD 86 A9         [ 4]  500         call SWAPP 
      0081FB CD 89 90         [ 4]  501         call  ULESS 
      0081FE CD 85 18         [ 4]  502         call QBRAN 
      008201 82 51                  503         .word FORGET6 
                                    504 ; ( ca na -- )        
                                    505 ;reset ivec with address >= ca
      008203 CD 86 A9         [ 4]  506         call SWAPP ; ( na ca -- ) 
      008206 CD A1 15         [ 4]  507         call CHKIVEC ; ( na -- ) 
                                    508 ; start at LAST and link back to na 
                                    509 ; if variable found reset VP at that point.
      008209                        510 FORGET1:
      008209 CD 88 0E         [ 4]  511         call LAST 
      00820C CD 85 63         [ 4]  512         call AT 
      00820F CD 86 99         [ 4]  513         call DUPP  ; ( -- na last last )
      008212 CD 82 A5         [ 4]  514         call FREEVAR ; ( -- na last )
      008215 CD 86 99         [ 4]  515         call DUPP 
      008218 CD 84 EF         [ 4]  516         call DOLIT 
      00821B 00 02                  517         .word 2 
      00821D CD 89 52         [ 4]  518         call SUBB ; ( na last -- na last lfa ) link address 
      008220 CD 85 63         [ 4]  519         call AT 
      008223 CD 86 99         [ 4]  520         call DUPP ; ( -- na last a a )
      008226 CD 87 E2         [ 4]  521         call CNTXT 
      008229 CD 85 51         [ 4]  522         call STORE
      00822C CD 88 0E         [ 4]  523         call LAST  
      00822F CD 85 51         [ 4]  524         call STORE ; ( --  na last )
      008232 CD 86 C1         [ 4]  525         call OVER 
      008235 CD 89 7A         [ 4]  526         call EQUAL ; ( na last na -- na T|F ) 
      008238 CD 85 18         [ 4]  527         call QBRAN 
      00823B 82 09                  528         .word FORGET1 
                                    529 ; ( na -- )
      00823D CD 84 EF         [ 4]  530         call DOLIT 
      008240 00 02                  531         .word 2 
      008242 CD 89 52         [ 4]  532         call SUBB 
      008245 CD 87 FE         [ 4]  533         call CPP 
      008248 CD 85 51         [ 4]  534         call STORE  
      00824B CD 9D 45         [ 4]  535         call UPDATCP 
      00824E CC 9D 1C         [ 2]  536         jp UPDATLAST 
      008251                        537 FORGET6: ; tried to forget a RAM or system word 
                                    538 ; ( ca na -- )
      008251 1D 00 02         [ 2]  539         subw x,#CELLL 
      008254 90 BE 2C         [ 2]  540         ldw y,SP0 
      008257 FF               [ 2]  541         ldw (x),y  
      008258 CD 89 90         [ 4]  542         call ULESS
      00825B CD 85 18         [ 4]  543         call QBRAN 
      00825E 82 81                  544         .word PROTECTED 
      008260 CD 94 74         [ 4]  545         call ABORQ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]



      008263 1D                     546         .byte 29
      008264 20 46 6F 72 20 52 41   547         .ascii " For RAM definition do REBOOT"
             4D 20 64 65 66 69 6E
             69 74 69 6F 6E 20 64
             6F 20 52 45 42 4F 4F
             54
      008281                        548 PROTECTED:
      008281 CD 94 74         [ 4]  549         call ABORQ
      008284 0A                     550         .byte 10
      008285 20 50 72 6F 74 65 63   551         .ascii " Protected"
             74 65 64
      00828F                        552 FORGET2: ; no name or not found in dictionary 
      00828F CD 94 74         [ 4]  553         call ABORQ
      008292 05                     554         .byte 5
      008293 20 77 68 61 74         555         .ascii " what"
      008298                        556 FORGET4:
      008298 CC 86 8F         [ 2]  557         jp DROP 
                                    558 
                                    559 
                                    560 ;;;;;;;;;;;;;;;;;;;;;
                                    561 ; if na is variable 
                                    562 ; free variable data  
                                    563 ; FREEVAR ( na -- )
                                    564 ;;;;;;;;;;;;;;;;;;;;;;
      00021B                        565         _HEADER FREEVAR,7,"FREEVAR"
      00829B 81 D3                    1         .word LINK 
                           00021D     2         LINK=.
      00829D 07                       3         .byte 7  
      00829E 46 52 45 45 56 41 52     4         .ascii "FREEVAR"
      0082A5                          5         FREEVAR:
      0082A5 CD 86 99         [ 4]  566         call DUPP ; ( na na -- )
      0082A8 CD 85 81         [ 4]  567         CALL CAT  ; ( na c -- )
      0082AB CD 8C 17         [ 4]  568         call ONEP ;
      0082AE CD 88 BC         [ 4]  569         CALL PLUS ; ( na c+1 -- ca ) 
      0082B1 CD 8C 17         [ 4]  570         call ONEP ; ( ca+ -- ) to get routne address 
      0082B4 CD 86 99         [ 4]  571         call DUPP ; ( ca+ ca+ -- )
      0082B7 CD 85 63         [ 4]  572         CALL AT   ; ( ca+ fnaddr -- ) ; fnaddr is routine address 
      0082BA CD 84 EF         [ 4]  573         call DOLIT 
      0082BD 87 4F                  574         .word DOVAR ; if routine address is DOVAR then variable 
      0082BF CD 89 7A         [ 4]  575         call EQUAL  ; ( ca+ fnaddr DOVAR -- ca+ T|F ) 
      0082C2 CD 85 18         [ 4]  576         call QBRAN 
      0082C5 82 DB                  577         .word FREEVAR4 
      0082C7 CD 84 EF         [ 4]  578         call DOLIT 
      0082CA 00 02                  579         .word 2 
      0082CC CD 88 BC         [ 4]  580         call PLUS  ; ( ca+ 2 -- da ) da is data address 
      0082CF CD 85 63         [ 4]  581         call AT 
      0082D2 CD 87 F0         [ 4]  582         call VPP   
      0082D5 CD 85 51         [ 4]  583         call STORE 
      0082D8 CC 9D 5C         [ 2]  584         jp UPDATVP 
      0082DB                        585 FREEVAR4: ; not variable
      0082DB CC 86 8F         [ 2]  586         jp  DROP 
                                    587 
                                    588 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    589 ;    SEED ( n -- )
                                    590 ; Initialize PRNG seed with n 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 13.
Hexadecimal [24-Bits]



                                    591 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00025E                        592         _HEADER SEED,4,"SEED"
      0082DE 82 9D                    1         .word LINK 
                           000260     2         LINK=.
      0082E0 04                       3         .byte 4  
      0082E1 53 45 45 44              4         .ascii "SEED"
      0082E5                          5         SEED:
      0082E5 90 93            [ 1]  593         ldw y,x 
      0082E7 1C 00 02         [ 2]  594         addw x,#CELLL
      0082EA 90 FE            [ 2]  595         ldw y,(y)
      0082EC 90 9E            [ 1]  596         ld a,yh 
      0082EE B7 38            [ 1]  597         ld SEEDX,a 
      0082F0 90 9F            [ 1]  598         ld a,yl 
      0082F2 B7 3A            [ 1]  599         ld SEEDY,a 
      0082F4 81               [ 4]  600         ret 
                                    601 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    602 ;    RANDOM ( u1 -- u2 )
                                    603 ; Pseudo random number betwen 0 and u1-1
                                    604 ;  XOR32 algorithm 
                                    605 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000275                        606         _HEADER RANDOM,6,"RANDOM"
      0082F5 82 E0                    1         .word LINK 
                           000277     2         LINK=.
      0082F7 06                       3         .byte 6  
      0082F8 52 41 4E 44 4F 4D        4         .ascii "RANDOM"
      0082FE                          5         RANDOM:
                                    607 ;local variable 
                           000001   608         SPSAVE=1
                           000002   609         VSIZE=2 
      0082FE 52 02            [ 2]  610         sub sp,#VSIZE
      008300 1F 01            [ 2]  611         ldw (SPSAVE,sp),x  
                                    612 ; XTEMP=(SEEDX<<5)^SEEDX 
      008302 90 93            [ 1]  613         ldw y,x 
      008304 90 FE            [ 2]  614         ldw y,(y)
      008306 90 BF 26         [ 2]  615         ldw YTEMP,y 
      008309 BE 38            [ 2]  616 	ldw x,SEEDX 
      00830B 58               [ 2]  617 	sllw x 
      00830C 58               [ 2]  618 	sllw x 
      00830D 58               [ 2]  619 	sllw x 
      00830E 58               [ 2]  620 	sllw x 
      00830F 58               [ 2]  621 	sllw x 
      008310 9E               [ 1]  622 	ld a,xh 
      008311 B8 38            [ 1]  623 	xor a,SEEDX 
      008313 B7 24            [ 1]  624 	ld XTEMP,a 
      008315 9F               [ 1]  625 	ld a,xl 
      008316 B8 39            [ 1]  626 	xor a,SEEDX+1 
      008318 B7 25            [ 1]  627 	ld XTEMP+1,a 
                                    628 ; SEEDX=SEEDY 
      00831A BE 3A            [ 2]  629 	ldw x,SEEDY 
      00831C BF 38            [ 2]  630 	ldw SEEDX,x  
                                    631 ; SEEDY=SEEDY^(SEEDY>>1)
      00831E 54               [ 2]  632 	srlw x 
      00831F 9E               [ 1]  633 	ld a,xh 
      008320 B8 3A            [ 1]  634 	xor a,SEEDY 
      008322 B7 3A            [ 1]  635 	ld SEEDY,a  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 14.
Hexadecimal [24-Bits]



      008324 9F               [ 1]  636 	ld a,xl 
      008325 B8 3B            [ 1]  637 	xor a,SEEDY+1 
      008327 B7 3B            [ 1]  638 	ld SEEDY+1,a 
                                    639 ; XTEMP>>3 
      008329 BE 24            [ 2]  640 	ldw x,XTEMP 
      00832B 54               [ 2]  641 	srlw x 
      00832C 54               [ 2]  642 	srlw x 
      00832D 54               [ 2]  643 	srlw x 
                                    644 ; x=XTEMP^x 
      00832E 9E               [ 1]  645 	ld a,xh 
      00832F B8 24            [ 1]  646 	xor a,XTEMP 
      008331 95               [ 1]  647 	ld xh,a 
      008332 9F               [ 1]  648 	ld a,xl 
      008333 B8 25            [ 1]  649 	xor a,XTEMP+1  
      008335 97               [ 1]  650 	ld xl,a 
                                    651 ; SEEDY=x^SEEDY 
      008336 B8 3B            [ 1]  652 	xor a,SEEDY+1
      008338 97               [ 1]  653 	ld xl,a 
      008339 9E               [ 1]  654 	ld a,xh 
      00833A B8 3A            [ 1]  655 	xor a,SEEDY
      00833C 95               [ 1]  656 	ld xh,a 
      00833D BF 3A            [ 2]  657 	ldw SEEDY,x 
                                    658 ; return SEEDY modulo YTEMP  
      00833F 90 BE 26         [ 2]  659 	ldw y,YTEMP  
      008342 65               [ 2]  660 	divw x,y 
      008343 1E 01            [ 2]  661 	ldw x,(SPSAVE,sp)
      008345 FF               [ 2]  662         ldw (x),y 
      008346 5B 02            [ 2]  663         addw sp,#VSIZE 
      008348 81               [ 4]  664 	ret 
                                    665 
                                    666 
                                    667 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    668 ;; get millisecond counter 
                                    669 ;; msec ( -- u )
                                    670 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0002C9                        671         _HEADER MSEC,4,"MSEC"
      008349 82 F7                    1         .word LINK 
                           0002CB     2         LINK=.
      00834B 04                       3         .byte 4  
      00834C 4D 53 45 43              4         .ascii "MSEC"
      008350                          5         MSEC:
      008350 1D 00 02         [ 2]  672         subw x,#CELLL 
      008353 90 BE 30         [ 2]  673         ldw y,MS 
      008356 FF               [ 2]  674         ldw (x),y 
      008357 81               [ 4]  675         ret 
                                    676 
                                    677 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    678 ; suspend execution for u msec 
                                    679 ;  pause ( u -- )
                                    680 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0002D8                        681         _HEADER PAUSE,5,"PAUSE"
      008358 83 4B                    1         .word LINK 
                           0002DA     2         LINK=.
      00835A 05                       3         .byte 5  
      00835B 50 41 55 53 45           4         .ascii "PAUSE"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 15.
Hexadecimal [24-Bits]



      008360                          5         PAUSE:
      008360 90 93            [ 1]  682         ldw y,x
      008362 90 FE            [ 2]  683         ldw y,(y)
      008364 72 B9 00 30      [ 2]  684         addw y,MS 
      008368 8F               [10]  685 1$:     wfi  
      008369 90 B3 30         [ 2]  686         cpw y,MS  
      00836C 26 FA            [ 1]  687         jrne 1$        
      00836E 1C 00 02         [ 2]  688         addw x,#CELLL 
      008371 81               [ 4]  689         ret 
                                    690 
                                    691 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    692 ; initialize count down timer 
                                    693 ;  TIMER ( u -- )  milliseconds
                                    694 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0002F2                        695         _HEADER TIMER,5,"TIMER"
      008372 83 5A                    1         .word LINK 
                           0002F4     2         LINK=.
      008374 05                       3         .byte 5  
      008375 54 49 4D 45 52           4         .ascii "TIMER"
      00837A                          5         TIMER:
      00837A 90 93            [ 1]  696         ldw y,x
      00837C 90 FE            [ 2]  697         ldw y,(y) 
      00837E 90 BF 32         [ 2]  698         ldw CNTDWN,y
      008381 1C 00 02         [ 2]  699         addw x,#CELLL 
      008384 81               [ 4]  700         ret 
                                    701 
                                    702 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    703 ; check for TIMER exiparition 
                                    704 ;  TIMEOUT? ( -- 0|-1 )
                                    705 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000305                        706         _HEADER TIMEOUTQ,8,"TIMEOUT?"
      008385 83 74                    1         .word LINK 
                           000307     2         LINK=.
      008387 08                       3         .byte 8  
      008388 54 49 4D 45 4F 55 54     4         .ascii "TIMEOUT?"
             3F
      008390                          5         TIMEOUTQ:
      008390 4F               [ 1]  707         clr a
      008391 1D 00 02         [ 2]  708         subw x,#CELLL 
      008394 90 BE 32         [ 2]  709         ldw y,CNTDWN 
      008397 26 01            [ 1]  710         jrne 1$ 
      008399 43               [ 1]  711         cpl a 
      00839A E7 01            [ 1]  712 1$:     ld (1,x),a 
      00839C F7               [ 1]  713         ld (x),a 
      00839D 81               [ 4]  714         ret         
                                    715 
                                    716 ;;;;;;;;;;;;;;;;;;;;;
                                    717 ; reboot MCU 
                                    718 ; REBOOT ( -- )
                                    719 ;;;;;;;;;;;;;;;;;;;;;
      00031E                        720         _HEADER reboot,6,"REBOOT"
      00839E 83 87                    1         .word LINK 
                           000320     2         LINK=.
      0083A0 06                       3         .byte 6  
      0083A1 52 45 42 4F 4F 54        4         .ascii "REBOOT"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 16.
Hexadecimal [24-Bits]



      0083A7                          5         reboot:
      0083A7 CC 80 80         [ 2]  721         jp NonHandledInterrupt
                                    722 
                                    723 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    724 ; compile to flash memory 
                                    725 ; TO-FLASH ( -- )
                                    726 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      00032A                        727         _HEADER TOFLASH,8,"TO-FLASH"
      0083AA 83 A0                    1         .word LINK 
                           00032C     2         LINK=.
      0083AC 08                       3         .byte 8  
      0083AD 54 4F 2D 46 4C 41 53     4         .ascii "TO-FLASH"
             48
      0083B5                          5         TOFLASH:
      0083B5 CD 88 21         [ 4]  728         call RAMLAST 
      0083B8 CD 85 63         [ 4]  729         call AT 
      0083BB CD 88 4C         [ 4]  730         call QDUP 
      0083BE CD 85 18         [ 4]  731         call QBRAN
      0083C1 83 E4                  732         .word 1$
      0083C3 CD 94 74         [ 4]  733         call ABORQ 
      0083C6 1D                     734         .byte 29
      0083C7 20 4E 6F 74 20 77 68   735         .ascii " Not while definitions in RAM"   
             69 6C 65 20 64 65 66
             69 6E 69 74 69 6F 6E
             73 20 69 6E 20 52 41
             4D
      0083E4 90 AE FF FF      [ 2]  736 1$:     ldw y,#-1 
      0083E8 90 BF 20         [ 2]  737         ldw UTFLASH,y
      0083EB 81               [ 4]  738         ret 
                                    739 
                                    740 ;;;;;;;;;;;;;;;;;;;;;;
                                    741 ; compile to RAM 
                                    742 ; TO-RAM ( -- )
                                    743 ;;;;;;;;;;;;;;;;;;;;;;
      00036C                        744         _HEADER TORAM,6,"TO-RAM"
      0083EC 83 AC                    1         .word LINK 
                           00036E     2         LINK=.
      0083EE 06                       3         .byte 6  
      0083EF 54 4F 2D 52 41 4D        4         .ascii "TO-RAM"
      0083F5                          5         TORAM:
      0083F5 90 5F            [ 1]  745         clrw y 
      0083F7 90 BF 20         [ 2]  746         ldw UTFLASH,y 
      0083FA 81               [ 4]  747         ret 
                                    748 
                                    749 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    750 ;; BAUD RATE constants table
                                    751 ; values to put in BRR1 & BRR2 
                                    752 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0083FB                        753 baudrate: 
      0083FB A0 1B                  754 	.byte 0xa0,0x1b ; 2400
      0083FD D0 05                  755 	.byte 0xd0,0x5  ; 4800 
      0083FF 68 03                  756 	.byte 0x68,0x3  ; 9600
      008401 34 01                  757 	.byte 0x34,0x1  ; 19200
      008403 11 06                  758 	.byte 0x11,0x6  ; 57600
      008405 08 0B                  759 	.byte 0x8,0xb   ; 115200
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 17.
Hexadecimal [24-Bits]



                                    760 
                                    761 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    762 ; BAUD RATE CONSTANTS names 
                                    763 ; 2400 baud  ( -- n )
                                    764 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000387                        765         _HEADER B2K4,4,"B2K4"
      008407 83 EE                    1         .word LINK 
                           000389     2         LINK=.
      008409 04                       3         .byte 4  
      00840A 42 32 4B 34              4         .ascii "B2K4"
      00840E                          5         B2K4:
      00840E 1D 00 02         [ 2]  766 	subw x,#CELLL 
      008411 90 5F            [ 1]  767         clrw y
      008413 FF               [ 2]  768         ldw (x),y
      008414 81               [ 4]  769 	ret
                                    770 
                                    771 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    772 ; 4800 baud	
                                    773 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000395                        774         _HEADER B4K8,4,"B4K8"
      008415 84 09                    1         .word LINK 
                           000397     2         LINK=.
      008417 04                       3         .byte 4  
      008418 42 34 4B 38              4         .ascii "B4K8"
      00841C                          5         B4K8:
      00841C 1D 00 02         [ 2]  775         subw x,#CELLL 
      00841F 90 AE 00 02      [ 2]  776         ldw y,#2 
      008423 FF               [ 2]  777         ldw (x),y
      008424 81               [ 4]  778         ret 
                                    779 
                                    780 ;;;;;;;;;;;;;;;;;;;;
                                    781 ; 9600 baud
                                    782 ;;;;;;;;;;;;;;;;;;;;
      0003A5                        783         _HEADER B9K6,4,"B9K6"
      008425 84 17                    1         .word LINK 
                           0003A7     2         LINK=.
      008427 04                       3         .byte 4  
      008428 42 39 4B 36              4         .ascii "B9K6"
      00842C                          5         B9K6:
      00842C 1D 00 02         [ 2]  784         subw x,#CELLL 
      00842F 90 AE 00 04      [ 2]  785         ldw y,#4 
      008433 FF               [ 2]  786         ldw (x),y 
      008434 81               [ 4]  787         ret 
                                    788 ;;;;;;;;;;;;;;
                                    789 ; 19200 baud
                                    790 ;;;;;;;;;;;;;;
      0003B5                        791         _HEADER B19K2,5,"B19K2"
      008435 84 27                    1         .word LINK 
                           0003B7     2         LINK=.
      008437 05                       3         .byte 5  
      008438 42 31 39 4B 32           4         .ascii "B19K2"
      00843D                          5         B19K2:
      00843D 1D 00 02         [ 2]  792         subw x,#CELLL
      008440 90 AE 00 06      [ 2]  793         ldw y,#6 
      008444 FF               [ 2]  794         ldw (x),y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
Hexadecimal [24-Bits]



      008445 81               [ 4]  795         ret 
                                    796 ;;;;;;;;;;;;;;
                                    797 ; 57600 baud  
                                    798 ;;;;;;;;;;;;;;
      0003C6                        799         _HEADER B57K6,5,"B57K6"
      008446 84 37                    1         .word LINK 
                           0003C8     2         LINK=.
      008448 05                       3         .byte 5  
      008449 42 35 37 4B 36           4         .ascii "B57K6"
      00844E                          5         B57K6:
      00844E 1D 00 02         [ 2]  800         subw x,#CELLL 
      008451 90 AE 00 08      [ 2]  801         ldw y,#8 
      008455 FF               [ 2]  802         ldw (x),y 
      008456 81               [ 4]  803         ret 
                                    804 ;;;;;;;;;;;;;;
                                    805 ; 115200 baud 
                                    806 ;;;;;;;;;;;;;;
      0003D7                        807         _HEADER B115K2,6,"B115K2"
      008457 84 48                    1         .word LINK 
                           0003D9     2         LINK=.
      008459 06                       3         .byte 6  
      00845A 42 31 31 35 4B 32        4         .ascii "B115K2"
      008460                          5         B115K2:
      008460 1D 00 02         [ 2]  808 	subw x,#CELLL 
      008463 90 AE 00 0A      [ 2]  809         ldw y,#10 
      008467 FF               [ 2]  810         ldw (x),y 
      008468 81               [ 4]  811         ret 
                                    812 
                                    813 ;;;;;;;;;;;;;;;;;;;;;;;	
                                    814 ;; set UART2 BAUD rate
                                    815 ;	BAUD ( u -- )
                                    816 ;;;;;;;;;;;;;;;;;;;;;;;
      0003E9                        817         _HEADER BAUD,4,"BAUD"
      008469 84 59                    1         .word LINK 
                           0003EB     2         LINK=.
      00846B 04                       3         .byte 4  
      00846C 42 41 55 44              4         .ascii "BAUD"
      008470                          5         BAUD:
      008470 1D 00 02         [ 2]  818 	subw x,#CELLL
      008473 90 AE 83 FB      [ 2]  819         ldw y,#baudrate 
      008477 FF               [ 2]  820         ldw (x),y 
      008478 CD 88 BC         [ 4]  821         call PLUS
      00847B 90 93            [ 1]  822         ldw y,x  
      00847D 90 FE            [ 2]  823         ldw y,(y)
      00847F 90 F6            [ 1]  824         ld a,(y)
      008481 88               [ 1]  825         push a 
      008482 90 5C            [ 1]  826         incw y 
      008484 90 F6            [ 1]  827         ld a,(y)
      008486 C7 52 33         [ 1]  828         ld UART_BRR2,a 
      008489 84               [ 1]  829         pop a
      00848A C7 52 32         [ 1]  830         ld UART_BRR1,a 
      00848D 1C 00 02         [ 2]  831         addw x,#CELLL 
      008490 81               [ 4]  832         ret 
                                    833 
                                    834 ;; Device dependent I/O
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]



                                    835 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    836 ;       ?RX     ( -- c T | F )
                                    837 ;         Return input byte and true, or false.
                                    838 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000411                        839         _HEADER QKEY,4,"?KEY"
      008491 84 6B                    1         .word LINK 
                           000413     2         LINK=.
      008493 04                       3         .byte 4  
      008494 3F 4B 45 59              4         .ascii "?KEY"
      008498                          5         QKEY:
      008498 90 5F            [ 1]  840         CLRW Y 
      00849A 72 0B 52 30 0B   [ 2]  841         BTJF UART_SR,#UART_SR_RXNE,INCH   ;check status
      00849F C6 52 31         [ 1]  842         LD    A,UART_DR   ;get char in A
      0084A2 1D 00 02         [ 2]  843 	SUBW	X,#2
      0084A5 E7 01            [ 1]  844         LD     (1,X),A
      0084A7 7F               [ 1]  845 	CLR	(X)
      0084A8 90 53            [ 2]  846         CPLW     Y
      0084AA                        847 INCH:
      0084AA 1D 00 02         [ 2]  848 		SUBW	X,#2
      0084AD FF               [ 2]  849         LDW     (X),Y
      0084AE 81               [ 4]  850         RET
                                    851 
                                    852 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    853 ;       TX!     ( c -- )
                                    854 ;       Send character c to  output device.
                                    855 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00042F                        856         _HEADER EMIT,4,"EMIT"
      0084AF 84 93                    1         .word LINK 
                           000431     2         LINK=.
      0084B1 04                       3         .byte 4  
      0084B2 45 4D 49 54              4         .ascii "EMIT"
      0084B6                          5         EMIT:
      0084B6 E6 01            [ 1]  857         LD     A,(1,X)
      0084B8 1C 00 02         [ 2]  858 	ADDW	X,#2
      0084BB 72 0F 52 30 FB   [ 2]  859 OUTPUT: BTJF UART_SR,#UART_SR_TXE,OUTPUT  ;loop until tx empty 
      0084C0 C7 52 31         [ 1]  860         LD    UART_DR,A   ;send A
      0084C3 81               [ 4]  861         RET
                                    862 
                                    863 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    864 ;       FC-XON  ( -- )
                                    865 ;       send XON character 
                                    866 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000444                        867         _HEADER FC_XON,6,"FC-XON"
      0084C4 84 B1                    1         .word LINK 
                           000446     2         LINK=.
      0084C6 06                       3         .byte 6  
      0084C7 46 43 2D 58 4F 4E        4         .ascii "FC-XON"
      0084CD                          5         FC_XON:
      0084CD 1D 00 02         [ 2]  868         subw x,#CELLL 
      0084D0 7F               [ 1]  869         clr (x)
      0084D1 A6 11            [ 1]  870         ld a,#XON 
      0084D3 E7 01            [ 1]  871         ld (1,x),a 
      0084D5 CD 84 B6         [ 4]  872         call EMIT 
      0084D8 81               [ 4]  873         ret 
                                    874 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]



                                    875 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    876 ;       FC-XOFF ( -- )
                                    877 ;       Send XOFF character 
                                    878 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000459                        879         _HEADER FC_XOFF,7,"FC-XOFF"
      0084D9 84 C6                    1         .word LINK 
                           00045B     2         LINK=.
      0084DB 07                       3         .byte 7  
      0084DC 46 43 2D 58 4F 46 46     4         .ascii "FC-XOFF"
      0084E3                          5         FC_XOFF:
      0084E3 1D 00 02         [ 2]  880         subw x,#CELLL 
      0084E6 7F               [ 1]  881         clr (x)
      0084E7 A6 13            [ 1]  882         ld a,#XOFF 
      0084E9 E7 01            [ 1]  883         ld (1,x),a 
      0084EB CD 84 B6         [ 4]  884         call EMIT 
      0084EE 81               [ 4]  885         ret
                                    886 
                                    887 ;; The kernel
                                    888 
                                    889 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    890 ;       doLIT   ( -- w )
                                    891 ;       Push an inline literal.
                                    892 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0084EF                        893 DOLIT:
      0084EF 1D 00 02         [ 2]  894 	SUBW X,#2
      0084F2 16 01            [ 2]  895         ldw y,(1,sp)
      0084F4 90 FE            [ 2]  896         ldw y,(y)
      0084F6 FF               [ 2]  897         ldw (x),y
      0084F7 90 85            [ 2]  898         popw y 
      0084F9 90 EC 02         [ 2]  899         jp (2,y)
                                    900 
                                    901 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    902 ;       NEXT    ( -- )
                                    903 ;       Code for  single index loop.
                                    904 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00047C                        905         _HEADER DONXT,COMPO+4,"NEXT"
      0084FC 84 DB                    1         .word LINK 
                           00047E     2         LINK=.
      0084FE 44                       3         .byte COMPO+4  
      0084FF 4E 45 58 54              4         .ascii "NEXT"
      008503                          5         DONXT:
      008503 16 03            [ 2]  906 	LDW Y,(3,SP)
      008505 90 5A            [ 2]  907 	DECW Y
      008507 2A 07            [ 1]  908 	JRPL NEX1 ; jump if N=0
      008509 90 85            [ 2]  909 	POPW Y
      00850B 5B 02            [ 2]  910         addw sp,#2
      00850D 90 EC 02         [ 2]  911         JP (2,Y)
      008510                        912 NEX1:
      008510 17 03            [ 2]  913         LDW (3,SP),Y
      008512 90 85            [ 2]  914         POPW Y
      008514 90 FE            [ 2]  915 	LDW Y,(Y)
      008516 90 FC            [ 2]  916 	JP (Y)
                                    917 
                                    918 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    919 ;       ?branch ( f -- )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



                                    920 ;       Branch if flag is zero.
                                    921 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    922 ;       _HEADER QBRAN,COMPO+7,"?BRANCH"        
      008518                        923 QBRAN:	
      008518 90 93            [ 1]  924         LDW Y,X
      00851A 1C 00 02         [ 2]  925 	ADDW X,#2
      00851D 90 FE            [ 2]  926 	LDW Y,(Y)
      00851F 27 13            [ 1]  927         JREQ     BRAN
      008521 90 85            [ 2]  928 	POPW Y
      008523 90 EC 02         [ 2]  929 	JP (2,Y)
                                    930 
                                    931 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    932 ;  TBRANCH ( f -- )
                                    933 ;  branch if f==TRUE 
                                    934 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    935 ;        _HEADER TBRAN,COMPO+7,"TBRANCH"
      008526                        936 TBRAN: 
      008526 90 93            [ 1]  937         LDW Y,X 
      008528 1C 00 02         [ 2]  938         ADDW X,#2 
      00852B 90 FE            [ 2]  939         LDW Y,(Y)
      00852D 26 05            [ 1]  940         JRNE BRAN 
      00852F 90 85            [ 2]  941         POPW Y 
      008531 90 EC 02         [ 2]  942         JP (2,Y)
                                    943 
                                    944 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    945 ;       branch  ( -- )
                                    946 ;       Branch to an inline address.
                                    947 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    948 ;       _HEADER BRAN,COMPO+6,"BRANCH"
      008534                        949 BRAN:
      008534 90 85            [ 2]  950         POPW Y
      008536 90 FE            [ 2]  951 	LDW Y,(Y)
      008538 90 FC            [ 2]  952         JP  (Y)
                                    953 
                                    954 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    955 ;       EXECUTE ( ca -- )
                                    956 ;       Execute  word at ca.
                                    957 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0004BA                        958         _HEADER EXECU,7,"EXECUTE"
      00853A 84 FE                    1         .word LINK 
                           0004BC     2         LINK=.
      00853C 07                       3         .byte 7  
      00853D 45 58 45 43 55 54 45     4         .ascii "EXECUTE"
      008544                          5         EXECU:
      008544 90 93            [ 1]  959         LDW Y,X
      008546 1C 00 02         [ 2]  960 	ADDW X,#CELLL 
      008549 90 FE            [ 2]  961 	LDW  Y,(Y)
      00854B 90 FC            [ 2]  962         JP   (Y)
                                    963 
                           000001   964 OPTIMIZE = 1
                           000001   965 .if OPTIMIZE 
                                    966 ; remplacement de CALL EXIT par 
                                    967 ; le opcode de RET.
                                    968 ; Voir modification au code de ";"
                           000000   969 .else 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]



                                    970 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    971 ;       EXIT    ( -- )
                                    972 ;       Terminate a colon definition.
                                    973 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    974 ;       _HEADER EXIT,4,"EXIT"
                                    975 EXIT:
                                    976         POPW Y
                                    977         RET
                                    978 .endif 
                                    979 
                                    980 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    981 ;       !       ( w a -- )
                                    982 ;       Pop  data stack to memory.
                                    983 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0004CD                        984         _HEADER STORE,1,"!"
      00854D 85 3C                    1         .word LINK 
                           0004CF     2         LINK=.
      00854F 01                       3         .byte 1  
      008550 21                       4         .ascii "!"
      008551                          5         STORE:
      008551 90 93            [ 1]  985         LDW Y,X
      008553 90 FE            [ 2]  986         LDW Y,(Y)    ;Y=a
      008555 89               [ 2]  987         PUSHW X
      008556 EE 02            [ 2]  988         LDW X,(2,X) ; x=w 
      008558 90 FF            [ 2]  989         LDW (Y),X 
      00855A 85               [ 2]  990         POPW X  
      00855B 1C 00 04         [ 2]  991         ADDW X,#4 ; DDROP 
      00855E 81               [ 4]  992         RET     
                                    993 
                                    994 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    995 ;       @       ( a -- w )
                                    996 ;       Push memory location to stack.
                                    997 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0004DF                        998         _HEADER AT,1,"@"
      00855F 85 4F                    1         .word LINK 
                           0004E1     2         LINK=.
      008561 01                       3         .byte 1  
      008562 40                       4         .ascii "@"
      008563                          5         AT:
      008563 90 93            [ 1]  999         LDW Y,X     ;Y = a
      008565 90 FE            [ 2] 1000         LDW Y,(Y)   ; address 
      008567 90 FE            [ 2] 1001         LDW Y,(Y)   ; value 
      008569 FF               [ 2] 1002         LDW (X),Y ;w = @Y
      00856A 81               [ 4] 1003         RET     
                                   1004 
                                   1005 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1006 ;       C!      ( c b -- )
                                   1007 ;       Pop  data stack to byte memory.
                                   1008 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0004EB                       1009         _HEADER CSTOR,2,"C!"
      00856B 85 61                    1         .word LINK 
                           0004ED     2         LINK=.
      00856D 02                       3         .byte 2  
      00856E 43 21                    4         .ascii "C!"
      008570                          5         CSTOR:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



      008570 90 93            [ 1] 1010         LDW Y,X
      008572 90 FE            [ 2] 1011 	LDW Y,(Y)    ;Y=b
      008574 E6 03            [ 1] 1012         LD A,(3,X)    ;D = c
      008576 90 F7            [ 1] 1013         LD  (Y),A     ;store c at b
      008578 1C 00 04         [ 2] 1014 	ADDW X,#4 ; DDROP 
      00857B 81               [ 4] 1015         RET     
                                   1016 
                                   1017 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1018 ;       C@      ( b -- c )
                                   1019 ;       Push byte in memory to  stack.
                                   1020 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0004FC                       1021         _HEADER CAT,2,"C@"
      00857C 85 6D                    1         .word LINK 
                           0004FE     2         LINK=.
      00857E 02                       3         .byte 2  
      00857F 43 40                    4         .ascii "C@"
      008581                          5         CAT:
      008581 90 93            [ 1] 1022         LDW Y,X     ;Y=b
      008583 90 FE            [ 2] 1023         LDW Y,(Y)
      008585 90 F6            [ 1] 1024         LD A,(Y)
      008587 E7 01            [ 1] 1025         LD (1,X),A
      008589 7F               [ 1] 1026         CLR (X)
      00858A 81               [ 4] 1027         RET     
                                   1028 
                                   1029 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1030 ;       RP@     ( -- a )
                                   1031 ;       Push current RP to data stack.
                                   1032 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00050B                       1033         _HEADER RPAT,3,"RP@"
      00858B 85 7E                    1         .word LINK 
                           00050D     2         LINK=.
      00858D 03                       3         .byte 3  
      00858E 52 50 40                 4         .ascii "RP@"
      008591                          5         RPAT:
      008591 90 96            [ 1] 1034         LDW Y,SP    ;save return addr
      008593 1D 00 02         [ 2] 1035         SUBW X,#2
      008596 FF               [ 2] 1036         LDW (X),Y
      008597 81               [ 4] 1037         RET     
                                   1038 
                                   1039 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1040 ;       RP!     ( a -- )
                                   1041 ;       Set  return stack pointer.
                                   1042 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000518                       1043         _HEADER RPSTO,COMPO+3,"RP!"
      008598 85 8D                    1         .word LINK 
                           00051A     2         LINK=.
      00859A 43                       3         .byte COMPO+3  
      00859B 52 50 21                 4         .ascii "RP!"
      00859E                          5         RPSTO:
      00859E 90 85            [ 2] 1044         POPW Y
      0085A0 90 BF 26         [ 2] 1045         LDW YTEMP,Y
      0085A3 90 93            [ 1] 1046         LDW Y,X
      0085A5 90 FE            [ 2] 1047         LDW Y,(Y)
      0085A7 90 94            [ 1] 1048         LDW SP,Y
      0085A9 1C 00 02         [ 2] 1049         ADDW X,#CELLL ; a was not dropped, Picatout 2020-05-24
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]



      0085AC 92 CC 26         [ 5] 1050         JP [YTEMP]
                                   1051 
                                   1052 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1053 ;       R>      ( -- w )
                                   1054 ;       Pop return stack to data stack.
                                   1055 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00052F                       1056         _HEADER RFROM,2,"R>"
      0085AF 85 9A                    1         .word LINK 
                           000531     2         LINK=.
      0085B1 02                       3         .byte 2  
      0085B2 52 3E                    4         .ascii "R>"
      0085B4                          5         RFROM:
      0085B4 1D 00 02         [ 2] 1057         SUBW X,#CELLL 
      0085B7 16 03            [ 2] 1058         LDW Y,(3,SP)
      0085B9 FF               [ 2] 1059         LDW (X),Y 
      0085BA 90 85            [ 2] 1060         POPW Y 
      0085BC 5B 02            [ 2] 1061         ADDW SP,#2 
      0085BE 90 FC            [ 2] 1062         JP (Y)
                                   1063 
                                   1064 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1065 ;       R@      ( -- w )
                                   1066 ;       Copy top of return stack to stack.
                                   1067 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000540                       1068         _HEADER RAT,2,"R@"
      0085C0 85 B1                    1         .word LINK 
                           000542     2         LINK=.
      0085C2 02                       3         .byte 2  
      0085C3 52 40                    4         .ascii "R@"
      0085C5                          5         RAT:
      0085C5 16 03            [ 2] 1069         ldw y,(3,sp)
      0085C7 1D 00 02         [ 2] 1070         subw x,#CELLL 
      0085CA FF               [ 2] 1071         ldw (x),y 
      0085CB 81               [ 4] 1072         ret 
                                   1073 
                                   1074 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1075 ;       LOCAL ( n -- )
                                   1076 ;       reserve n slots on return stack
                                   1077 ;       for local variables 
                                   1078 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00054C                       1079         _HEADER LOCAL,5,"LOCAL"
      0085CC 85 C2                    1         .word LINK 
                           00054E     2         LINK=.
      0085CE 05                       3         .byte 5  
      0085CF 4C 4F 43 41 4C           4         .ascii "LOCAL"
      0085D4                          5         LOCAL:
      0085D4 90 85            [ 2] 1080         POPW Y  
      0085D6 90 BF 26         [ 2] 1081         LDW YTEMP,Y ; RETURN ADDRESS 
      0085D9 E6 01            [ 1] 1082         LD A,(1,X)
      0085DB 90 97            [ 1] 1083         LD YL,A 
      0085DD A6 02            [ 1] 1084         LD A,#CELLL 
      0085DF 90 42            [ 4] 1085         MUL Y,A 
      0085E1 90 BF 24         [ 2] 1086         LDw XTEMP,Y
      0085E4 90 96            [ 1] 1087         LDW Y,SP 
      0085E6 72 B2 00 24      [ 2] 1088         SUBW Y,XTEMP
      0085EA 90 94            [ 1] 1089         LDW SP,Y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



      0085EC 1C 00 02         [ 2] 1090         ADDW X,#CELLL 
      0085EF 92 CC 26         [ 5] 1091         JP [YTEMP]
                                   1092 
                                   1093 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1094 ;       NRDROP ( n -- )
                                   1095 ;       drop n elements from rstack
                                   1096 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000572                       1097         _HEADER NRDROP,6,"NRDROP" 
      0085F2 85 CE                    1         .word LINK 
                           000574     2         LINK=.
      0085F4 06                       3         .byte 6  
      0085F5 4E 52 44 52 4F 50        4         .ascii "NRDROP"
      0085FB                          5         NRDROP:
      0085FB 90 85            [ 2] 1098         POPW Y 
      0085FD 90 BF 26         [ 2] 1099         LDW YTEMP,Y ; RETURN ADDRESS 
      008600 E6 01            [ 1] 1100         LD A,(1,X)
      008602 90 97            [ 1] 1101         LD YL,A  
      008604 A6 02            [ 1] 1102         LD A,#CELLL 
      008606 90 42            [ 4] 1103         MUL Y,A 
      008608 90 BF 24         [ 2] 1104         LDW XTEMP,Y 
      00860B 90 96            [ 1] 1105         LDW Y,SP 
      00860D 72 B9 00 24      [ 2] 1106         ADDW Y,XTEMP 
      008611 90 94            [ 1] 1107         LDW SP,Y  
      008613 1C 00 02         [ 2] 1108         ADDW X,#CELLL 
      008616 92 CC 26         [ 5] 1109         JP [YTEMP]
                                   1110 
                                   1111 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1112 ;        ( n -- w)
                                   1113 ;      fetch nth element ofr return stack 
                                   1114 ;      n==0 is same as R@ 
                                   1115 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000599                       1116         _HEADER NRAT,3,"NR@"
      008619 85 F4                    1         .word LINK 
                           00059B     2         LINK=.
      00861B 03                       3         .byte 3  
      00861C 4E 52 40                 4         .ascii "NR@"
      00861F                          5         NRAT:
      00861F E6 01            [ 1] 1117         LD A,(1,X)
      008621 90 97            [ 1] 1118         LD YL,A 
      008623 A6 02            [ 1] 1119         LD A,#CELLL 
      008625 90 42            [ 4] 1120         MUL Y,A 
      008627 90 BF 26         [ 2] 1121         LDW YTEMP,Y 
      00862A 90 96            [ 1] 1122         LDW Y,SP 
      00862C 72 A9 00 03      [ 2] 1123         ADDW Y,#3 
      008630 72 B9 00 26      [ 2] 1124         ADDW Y,YTEMP 
      008634 90 FE            [ 2] 1125         LDW Y,(Y)
      008636 FF               [ 2] 1126         LDW (X),Y 
      008637 81               [ 4] 1127         RET 
                                   1128 
                                   1129 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1130 ;       NR! ( w n --  )
                                   1131 ;       store w on nth position of 
                                   1132 ;       return stack 
                                   1133 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0005B8                       1134         _HEADER NRSTO,3,"NR!"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



      008638 86 1B                    1         .word LINK 
                           0005BA     2         LINK=.
      00863A 03                       3         .byte 3  
      00863B 4E 52 21                 4         .ascii "NR!"
      00863E                          5         NRSTO:
      00863E 90 96            [ 1] 1135         LDW Y,SP
      008640 72 A9 00 03      [ 2] 1136         ADDW Y,#3 
      008644 90 BF 26         [ 2] 1137         LDW YTEMP,Y 
      008647 E6 01            [ 1] 1138         LD A,(1,X)
      008649 90 97            [ 1] 1139         LD YL,A 
      00864B A6 02            [ 1] 1140         LD A,#CELLL 
      00864D 90 42            [ 4] 1141         MUL Y,A 
      00864F 72 B9 00 26      [ 2] 1142         ADDW Y,YTEMP
      008653 89               [ 2] 1143         PUSHW X 
      008654 EE 02            [ 2] 1144         LDW X,(2,X)
      008656 90 FF            [ 2] 1145         LDW (Y),X
      008658 85               [ 2] 1146         POPW X 
      008659 1C 00 04         [ 2] 1147         ADDW X,#2*CELLL 
      00865C 81               [ 4] 1148         RET 
                                   1149 
                                   1150 
                                   1151 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1152 ;       >R      ( w -- )
                                   1153 ;       Push data stack to return stack.
                                   1154 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0005DD                       1155         _HEADER TOR,COMPO+2,">R"
      00865D 86 3A                    1         .word LINK 
                           0005DF     2         LINK=.
      00865F 42                       3         .byte COMPO+2  
      008660 3E 52                    4         .ascii ">R"
      008662                          5         TOR:
      008662 90 85            [ 2] 1156         POPW Y    ;save return addr
      008664 90 BF 26         [ 2] 1157         LDW YTEMP,Y
      008667 90 93            [ 1] 1158         LDW Y,X
      008669 90 FE            [ 2] 1159         LDW Y,(Y)  ; W
      00866B 90 89            [ 2] 1160         PUSHW Y    ;W >R 
      00866D 1C 00 02         [ 2] 1161         ADDW X,#2
      008670 92 CC 26         [ 5] 1162         JP [YTEMP]
                                   1163 
                                   1164 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1165 ;       SP@     ( -- a )
                                   1166 ;       Push current stack pointer.
                                   1167 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0005F3                       1168         _HEADER SPAT,3,"SP@"
      008673 86 5F                    1         .word LINK 
                           0005F5     2         LINK=.
      008675 03                       3         .byte 3  
      008676 53 50 40                 4         .ascii "SP@"
      008679                          5         SPAT:
      008679 90 93            [ 1] 1169 	LDW Y,X
      00867B 1D 00 02         [ 2] 1170         SUBW X,#2
      00867E FF               [ 2] 1171 	LDW (X),Y
      00867F 81               [ 4] 1172         RET     
                                   1173 
                                   1174 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal [24-Bits]



                                   1175 ;       SP!     ( a -- )
                                   1176 ;       Set  data stack pointer.
                                   1177 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000600                       1178         _HEADER SPSTO,3,"SP!"
      008680 86 75                    1         .word LINK 
                           000602     2         LINK=.
      008682 03                       3         .byte 3  
      008683 53 50 21                 4         .ascii "SP!"
      008686                          5         SPSTO:
      008686 FE               [ 2] 1179         LDW     X,(X)     ;X = a
      008687 81               [ 4] 1180         RET     
                                   1181 
                                   1182 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1183 ;       DROP    ( w -- )
                                   1184 ;       Discard top stack item.
                                   1185 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000608                       1186         _HEADER DROP,4,"DROP"
      008688 86 82                    1         .word LINK 
                           00060A     2         LINK=.
      00868A 04                       3         .byte 4  
      00868B 44 52 4F 50              4         .ascii "DROP"
      00868F                          5         DROP:
      00868F 1C 00 02         [ 2] 1187         ADDW X,#2     
      008692 81               [ 4] 1188         RET     
                                   1189 
                                   1190 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1191 ;       DUP     ( w -- w w )
                                   1192 ;       Duplicate  top stack item.
                                   1193 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000613                       1194         _HEADER DUPP,3,"DUP"
      008693 86 8A                    1         .word LINK 
                           000615     2         LINK=.
      008695 03                       3         .byte 3  
      008696 44 55 50                 4         .ascii "DUP"
      008699                          5         DUPP:
      008699 90 93            [ 1] 1195 	LDW Y,X
      00869B 1D 00 02         [ 2] 1196         SUBW X,#2
      00869E 90 FE            [ 2] 1197 	LDW Y,(Y)
      0086A0 FF               [ 2] 1198 	LDW (X),Y
      0086A1 81               [ 4] 1199         RET     
                                   1200 
                                   1201 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1202 ;       SWAP    ( w1 w2 -- w2 w1 )
                                   1203 ;       Exchange top two stack items.
                                   1204 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000622                       1205         _HEADER SWAPP,4,"SWAP"
      0086A2 86 95                    1         .word LINK 
                           000624     2         LINK=.
      0086A4 04                       3         .byte 4  
      0086A5 53 57 41 50              4         .ascii "SWAP"
      0086A9                          5         SWAPP:
      0086A9 90 93            [ 1] 1206         LDW Y,X
      0086AB 90 FE            [ 2] 1207         LDW Y,(Y)
      0086AD 90 89            [ 2] 1208         PUSHW Y  
      0086AF 90 93            [ 1] 1209         LDW Y,X
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



      0086B1 90 EE 02         [ 2] 1210         LDW Y,(2,Y)
      0086B4 FF               [ 2] 1211         LDW (X),Y
      0086B5 90 85            [ 2] 1212         POPW Y 
      0086B7 EF 02            [ 2] 1213         LDW (2,X),Y
      0086B9 81               [ 4] 1214         RET     
                                   1215 
                                   1216 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1217 ;       OVER    ( w1 w2 -- w1 w2 w1 )
                                   1218 ;       Copy second stack item to top.
                                   1219 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00063A                       1220         _HEADER OVER,4,"OVER"
      0086BA 86 A4                    1         .word LINK 
                           00063C     2         LINK=.
      0086BC 04                       3         .byte 4  
      0086BD 4F 56 45 52              4         .ascii "OVER"
      0086C1                          5         OVER:
      0086C1 1D 00 02         [ 2] 1221         SUBW X,#2
      0086C4 90 93            [ 1] 1222         LDW Y,X
      0086C6 90 EE 04         [ 2] 1223         LDW Y,(4,Y)
      0086C9 FF               [ 2] 1224         LDW (X),Y
      0086CA 81               [ 4] 1225         RET     
                                   1226 
                                   1227 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1228 ;       0<      ( n -- t )
                                   1229 ;       Return true if n is negative.
                                   1230 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00064B                       1231         _HEADER ZLESS,2,"0<"
      0086CB 86 BC                    1         .word LINK 
                           00064D     2         LINK=.
      0086CD 02                       3         .byte 2  
      0086CE 30 3C                    4         .ascii "0<"
      0086D0                          5         ZLESS:
      0086D0 A6 FF            [ 1] 1232         LD A,#0xFF
      0086D2 90 93            [ 1] 1233         LDW Y,X
      0086D4 90 FE            [ 2] 1234         LDW Y,(Y)
      0086D6 2B 01            [ 1] 1235         JRMI     ZL1
      0086D8 4F               [ 1] 1236         CLR A   ;false
      0086D9 F7               [ 1] 1237 ZL1:    LD     (X),A
      0086DA E7 01            [ 1] 1238         LD (1,X),A
      0086DC 81               [ 4] 1239 	RET     
                                   1240 
                                   1241 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1242 ;       0= ( n -- f )
                                   1243 ;   n==0?
                                   1244 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00065D                       1245         _HEADER ZEQUAL,2,"0="
      0086DD 86 CD                    1         .word LINK 
                           00065F     2         LINK=.
      0086DF 02                       3         .byte 2  
      0086E0 30 3D                    4         .ascii "0="
      0086E2                          5         ZEQUAL:
      0086E2 A6 FF            [ 1] 1246         LD A,#0XFF 
      0086E4 90 93            [ 1] 1247         LDW Y,X 
      0086E6 90 FE            [ 2] 1248         LDW Y,(Y)
      0086E8 27 02            [ 1] 1249         JREQ ZEQU1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



      0086EA A6 00            [ 1] 1250         LD A,#0 
      0086EC                       1251 ZEQU1:  
      0086EC F7               [ 1] 1252         LD (X),A 
      0086ED E7 01            [ 1] 1253         LD (1,X),A         
      0086EF 81               [ 4] 1254         RET 
                                   1255 
                                   1256 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1257 ;       AND     ( w w -- w )
                                   1258 ;       Bitwise AND.
                                   1259 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000670                       1260         _HEADER ANDD,3,"AND"
      0086F0 86 DF                    1         .word LINK 
                           000672     2         LINK=.
      0086F2 03                       3         .byte 3  
      0086F3 41 4E 44                 4         .ascii "AND"
      0086F6                          5         ANDD:
      0086F6 F6               [ 1] 1261         LD  A,(X)    ;D=w
      0086F7 E4 02            [ 1] 1262         AND A,(2,X)
      0086F9 E7 02            [ 1] 1263         LD (2,X),A
      0086FB E6 01            [ 1] 1264         LD A,(1,X)
      0086FD E4 03            [ 1] 1265         AND A,(3,X)
      0086FF E7 03            [ 1] 1266         LD (3,X),A
      008701 1C 00 02         [ 2] 1267         ADDW X,#2
      008704 81               [ 4] 1268         RET
                                   1269 
                                   1270 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1271 ;       OR      ( w w -- w )
                                   1272 ;       Bitwise inclusive OR.
                                   1273 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000685                       1274         _HEADER ORR,2,"OR"
      008705 86 F2                    1         .word LINK 
                           000687     2         LINK=.
      008707 02                       3         .byte 2  
      008708 4F 52                    4         .ascii "OR"
      00870A                          5         ORR:
      00870A F6               [ 1] 1275         LD A,(X)    ;D=w
      00870B EA 02            [ 1] 1276         OR A,(2,X)
      00870D E7 02            [ 1] 1277         LD (2,X),A
      00870F E6 01            [ 1] 1278         LD A,(1,X)
      008711 EA 03            [ 1] 1279         OR A,(3,X)
      008713 E7 03            [ 1] 1280         LD (3,X),A
      008715 1C 00 02         [ 2] 1281         ADDW X,#2
      008718 81               [ 4] 1282         RET
                                   1283 
                                   1284 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1285 ;       XOR     ( w w -- w )
                                   1286 ;       Bitwise exclusive OR.
                                   1287 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000699                       1288         _HEADER XORR,3,"XOR"
      008719 87 07                    1         .word LINK 
                           00069B     2         LINK=.
      00871B 03                       3         .byte 3  
      00871C 58 4F 52                 4         .ascii "XOR"
      00871F                          5         XORR:
      00871F F6               [ 1] 1289         LD A,(X)    ;D=w
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



      008720 E8 02            [ 1] 1290         XOR A,(2,X)
      008722 E7 02            [ 1] 1291         LD (2,X),A
      008724 E6 01            [ 1] 1292         LD A,(1,X)
      008726 E8 03            [ 1] 1293         XOR A,(3,X)
      008728 E7 03            [ 1] 1294         LD (3,X),A
      00872A 1C 00 02         [ 2] 1295         ADDW X,#2
      00872D 81               [ 4] 1296         RET
                                   1297 
                                   1298 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1299 ;       UM+     ( u u -- udsum )
                                   1300 ;       Add two unsigned single
                                   1301 ;       and return a double sum.
                                   1302 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0006AE                       1303         _HEADER UPLUS,3,"UM+"
      00872E 87 1B                    1         .word LINK 
                           0006B0     2         LINK=.
      008730 03                       3         .byte 3  
      008731 55 4D 2B                 4         .ascii "UM+"
      008734                          5         UPLUS:
      008734 A6 01            [ 1] 1304         LD A,#1
      008736 90 93            [ 1] 1305         LDW Y,X
      008738 90 EE 02         [ 2] 1306         LDW Y,(2,Y)
      00873B 90 BF 26         [ 2] 1307         LDW YTEMP,Y
      00873E 90 93            [ 1] 1308         LDW Y,X
      008740 90 FE            [ 2] 1309         LDW Y,(Y)
      008742 72 B9 00 26      [ 2] 1310         ADDW Y,YTEMP
      008746 EF 02            [ 2] 1311         LDW (2,X),Y
      008748 25 01            [ 1] 1312         JRC     UPL1
      00874A 4F               [ 1] 1313         CLR A
      00874B E7 01            [ 1] 1314 UPL1:   LD     (1,X),A
      00874D 7F               [ 1] 1315         CLR (X)
      00874E 81               [ 4] 1316         RET
                                   1317 
                                   1318 ;; System and user variables
                                   1319 
                                   1320 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1321 ;       doVAR   ( -- a )
                                   1322 ;       run time code 
                                   1323 ;       for VARIABLE and CREATE.
                                   1324 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1325 ;       HEADER DOVAR,COMPO+5,"DOVAR"
      00874F                       1326 DOVAR:
      00874F 1D 00 02         [ 2] 1327 	SUBW X,#2
      008752 90 85            [ 2] 1328         POPW Y    ;get return addr (pfa)
      008754 90 FE            [ 2] 1329         LDW Y,(Y) ; indirect address 
      008756 FF               [ 2] 1330         LDW (X),Y    ;push on stack
      008757 81               [ 4] 1331         RET     ;go to RET of EXEC
                                   1332 
                                   1333 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1334 ;       BASE    ( -- a )
                                   1335 ;       Radix base for numeric I/O.
                                   1336 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0006D8                       1337         _HEADER BASE,4,"BASE"
      008758 87 30                    1         .word LINK 
                           0006DA     2         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



      00875A 04                       3         .byte 4  
      00875B 42 41 53 45              4         .ascii "BASE"
      00875F                          5         BASE:
      00875F 90 AE 00 06      [ 2] 1338 	LDW Y,#UBASE 
      008763 1D 00 02         [ 2] 1339 	SUBW X,#2
      008766 FF               [ 2] 1340         LDW (X),Y
      008767 81               [ 4] 1341         RET
                                   1342 
                                   1343 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1344 ;       tmp     ( -- a )
                                   1345 ;       A temporary storage.
                                   1346 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0006E8                       1347         _HEADER TEMP,3,"TMP"
      008768 87 5A                    1         .word LINK 
                           0006EA     2         LINK=.
      00876A 03                       3         .byte 3  
      00876B 54 4D 50                 4         .ascii "TMP"
      00876E                          5         TEMP:
      00876E 90 AE 00 0A      [ 2] 1348 	LDW Y,#UTMP
      008772 1D 00 02         [ 2] 1349 	SUBW X,#2
      008775 FF               [ 2] 1350         LDW (X),Y
      008776 81               [ 4] 1351         RET
                                   1352 
                                   1353 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1354 ;       >IN     ( -- a )
                                   1355 ;        Hold parsing pointer.
                                   1356 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0006F7                       1357         _HEADER INN,3,">IN"
      008777 87 6A                    1         .word LINK 
                           0006F9     2         LINK=.
      008779 03                       3         .byte 3  
      00877A 3E 49 4E                 4         .ascii ">IN"
      00877D                          5         INN:
      00877D 90 AE 00 0C      [ 2] 1358 	LDW Y,#UINN 
      008781 1D 00 02         [ 2] 1359 	SUBW X,#2
      008784 FF               [ 2] 1360         LDW (X),Y
      008785 81               [ 4] 1361         RET
                                   1362 
                                   1363 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1364 ;       #TIB    ( -- a )
                                   1365 ;       Count in terminal input 
                                   1366 ;       buffer.
                                   1367 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000706                       1368         _HEADER NTIB,4,"#TIB"
      008786 87 79                    1         .word LINK 
                           000708     2         LINK=.
      008788 04                       3         .byte 4  
      008789 23 54 49 42              4         .ascii "#TIB"
      00878D                          5         NTIB:
      00878D 90 AE 00 0E      [ 2] 1369 	LDW Y,#UCTIB 
      008791 1D 00 02         [ 2] 1370 	SUBW X,#2
      008794 FF               [ 2] 1371         LDW (X),Y
      008795 81               [ 4] 1372         RET
                                   1373 
                                   1374 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



                                   1375 ;       TBUF ( -- a )
                                   1376 ;       address of 128 bytes 
                                   1377 ;       transaction buffer
                                   1378 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000716                       1379         _HEADER TBUF,4,"TBUF"
      008796 87 88                    1         .word LINK 
                           000718     2         LINK=.
      008798 04                       3         .byte 4  
      008799 54 42 55 46              4         .ascii "TBUF"
      00879D                          5         TBUF:
      00879D 90 AE 16 80      [ 2] 1380         ldw y,#ROWBUFF
      0087A1 1D 00 02         [ 2] 1381         subw x,#CELLL
      0087A4 FF               [ 2] 1382         ldw (x),y 
      0087A5 81               [ 4] 1383         ret 
                                   1384 
                                   1385 ; systeme variable 
                                   1386 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1387 ; compilation destination 
                                   1388 ; TFLASH ( -- A )
                                   1389 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000726                       1390         _HEADER TFLASH,6,"TFLASH"
      0087A6 87 98                    1         .word LINK 
                           000728     2         LINK=.
      0087A8 06                       3         .byte 6  
      0087A9 54 46 4C 41 53 48        4         .ascii "TFLASH"
      0087AF                          5         TFLASH:
      0087AF 1D 00 02         [ 2] 1391         subw x,#CELLL 
      0087B2 90 AE 00 20      [ 2] 1392         ldw y,#UTFLASH
      0087B6 FF               [ 2] 1393         ldw (x),y 
      0087B7 81               [ 4] 1394         ret 
                                   1395 
                                   1396 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1397 ;       "EVAL   ( -- a )
                                   1398 ;       Execution vector of EVAL.
                                   1399 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000738                       1400         _HEADER TEVAL,5,"'EVAL"
      0087B8 87 A8                    1         .word LINK 
                           00073A     2         LINK=.
      0087BA 05                       3         .byte 5  
      0087BB 27 45 56 41 4C           4         .ascii "'EVAL"
      0087C0                          5         TEVAL:
      0087C0 90 AE 00 12      [ 2] 1401 	LDW Y,#UINTER 
      0087C4 1D 00 02         [ 2] 1402 	SUBW X,#2
      0087C7 FF               [ 2] 1403         LDW (X),Y
      0087C8 81               [ 4] 1404         RET
                                   1405 
                                   1406 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1407 ;       HLD     ( -- a )
                                   1408 ;       Hold a pointer of output
                                   1409 ;        string.
                                   1410 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000749                       1411         _HEADER HLD,3,"HLD"
      0087C9 87 BA                    1         .word LINK 
                           00074B     2         LINK=.
      0087CB 03                       3         .byte 3  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



      0087CC 48 4C 44                 4         .ascii "HLD"
      0087CF                          5         HLD:
      0087CF 90 AE 00 14      [ 2] 1412 	LDW Y,#UHLD 
      0087D3 1D 00 02         [ 2] 1413 	SUBW X,#2
      0087D6 FF               [ 2] 1414         LDW (X),Y
      0087D7 81               [ 4] 1415         RET
                                   1416 
                                   1417 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1418 ;       CONTEXT ( -- a )
                                   1419 ;       Start vocabulary search.
                                   1420 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000758                       1421         _HEADER CNTXT,7,"CONTEXT"
      0087D8 87 CB                    1         .word LINK 
                           00075A     2         LINK=.
      0087DA 07                       3         .byte 7  
      0087DB 43 4F 4E 54 45 58 54     4         .ascii "CONTEXT"
      0087E2                          5         CNTXT:
      0087E2 90 AE 00 16      [ 2] 1422 	LDW Y,#UCNTXT
      0087E6 1D 00 02         [ 2] 1423 	SUBW X,#2
      0087E9 FF               [ 2] 1424         LDW (X),Y
      0087EA 81               [ 4] 1425         RET
                                   1426 
                                   1427 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1428 ;       VP      ( -- a )
                                   1429 ;       Point to top of variables
                                   1430 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00076B                       1431         _HEADER VPP,2,"VP"
      0087EB 87 DA                    1         .word LINK 
                           00076D     2         LINK=.
      0087ED 02                       3         .byte 2  
      0087EE 56 50                    4         .ascii "VP"
      0087F0                          5         VPP:
      0087F0 90 AE 00 18      [ 2] 1432 	LDW Y,#UVP 
      0087F4 1D 00 02         [ 2] 1433 	SUBW X,#2
      0087F7 FF               [ 2] 1434         LDW (X),Y
      0087F8 81               [ 4] 1435         RET
                                   1436 
                                   1437 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1438 ;       CP    ( -- a )
                                   1439 ;       Pointer to top of FLASH 
                                   1440 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000779                       1441         _HEADER CPP,2,"CP"
      0087F9 87 ED                    1         .word LINK 
                           00077B     2         LINK=.
      0087FB 02                       3         .byte 2  
      0087FC 43 50                    4         .ascii "CP"
      0087FE                          5         CPP:
      0087FE 90 AE 00 1A      [ 2] 1442         ldw y,#UCP 
      008802 1D 00 02         [ 2] 1443         subw x,#CELLL 
      008805 FF               [ 2] 1444         ldw (x),y 
      008806 81               [ 4] 1445         ret                
                                   1446 
                                   1447 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1448 ;       LAST    ( -- a )
                                   1449 ;       Point to last name in 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



                                   1450 ;       dictionary.
                                   1451 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000787                       1452         _HEADER LAST,4,"LAST"
      008807 87 FB                    1         .word LINK 
                           000789     2         LINK=.
      008809 04                       3         .byte 4  
      00880A 4C 41 53 54              4         .ascii "LAST"
      00880E                          5         LAST:
      00880E 90 AE 00 1C      [ 2] 1453 	LDW Y,#ULAST 
      008812 1D 00 02         [ 2] 1454 	SUBW X,#2
      008815 FF               [ 2] 1455         LDW (X),Y
      008816 81               [ 4] 1456         RET
                                   1457 
                                   1458 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1459 ; address of system variable URLAST 
                                   1460 ;       RAMLAST ( -- a )
                                   1461 ; RAM dictionary context 
                                   1462 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000797                       1463         _HEADER RAMLAST,7,"RAMLAST"
      008817 88 09                    1         .word LINK 
                           000799     2         LINK=.
      008819 07                       3         .byte 7  
      00881A 52 41 4D 4C 41 53 54     4         .ascii "RAMLAST"
      008821                          5         RAMLAST:
      008821 90 AE 00 22      [ 2] 1464         ldw y,#URLAST 
      008825 1D 00 02         [ 2] 1465         subw x,#CELLL 
      008828 FF               [ 2] 1466         ldw (x),y 
      008829 81               [ 4] 1467         ret 
                                   1468 
                                   1469 ;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1470 ;       OFFSET ( -- a )
                                   1471 ;       address of system 
                                   1472 ;       variable OFFSET 
                                   1473 ;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0007AA                       1474         _HEADER OFFSET,6,"OFFSET"
      00882A 88 19                    1         .word LINK 
                           0007AC     2         LINK=.
      00882C 06                       3         .byte 6  
      00882D 4F 46 46 53 45 54        4         .ascii "OFFSET"
      008833                          5         OFFSET:
      008833 1D 00 02         [ 2] 1475         subw x,#CELLL
      008836 90 AE 00 1E      [ 2] 1476         ldw y,#UOFFSET 
      00883A FF               [ 2] 1477         ldw (x),y 
      00883B 81               [ 4] 1478         ret 
                                   1479 
                                   1480 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1481 ; adjust jump address 
                                   1482 ;  adding OFFSET
                                   1483 ; ADR-ADJ ( a -- a+offset )
                                   1484 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00883C                       1485 ADRADJ: 
      00883C CD 88 33         [ 4] 1486         call OFFSET 
      00883F CD 85 63         [ 4] 1487         call AT 
      008842 CC 88 BC         [ 2] 1488         jp PLUS 
                                   1489 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



                                   1490 
                                   1491 ;; Common functions
                                   1492 
                                   1493 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1494 ;       ?DUP    ( w -- w w | 0 )
                                   1495 ;       Dup tos if its is not zero.
                                   1496 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0007C5                       1497         _HEADER QDUP,4,"?DUP"
      008845 88 2C                    1         .word LINK 
                           0007C7     2         LINK=.
      008847 04                       3         .byte 4  
      008848 3F 44 55 50              4         .ascii "?DUP"
      00884C                          5         QDUP:
      00884C 90 93            [ 1] 1498         LDW Y,X
      00884E 90 FE            [ 2] 1499 	LDW Y,(Y)
      008850 27 04            [ 1] 1500         JREQ     QDUP1
      008852 1D 00 02         [ 2] 1501 	SUBW X,#CELLL 
      008855 FF               [ 2] 1502         LDW (X),Y
      008856 81               [ 4] 1503 QDUP1:  RET
                                   1504 
                                   1505 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1506 ;       ROT     ( w1 w2 w3 -- w2 w3 w1 )
                                   1507 ;       Rot 3rd item to top.
                                   1508 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0007D7                       1509         _HEADER ROT,3,"ROT"
      008857 88 47                    1         .word LINK 
                           0007D9     2         LINK=.
      008859 03                       3         .byte 3  
      00885A 52 4F 54                 4         .ascii "ROT"
      00885D                          5         ROT:
      00885D 90 93            [ 1] 1510         ldw y,x 
      00885F 90 FE            [ 2] 1511         ldw y,(y)
      008861 90 89            [ 2] 1512         pushw y 
      008863 90 93            [ 1] 1513         ldw y,x 
      008865 90 EE 04         [ 2] 1514         ldw y,(4,y)
      008868 FF               [ 2] 1515         ldw (x),y 
      008869 90 93            [ 1] 1516         ldw y,x 
      00886B 90 EE 02         [ 2] 1517         ldw y,(2,y)
      00886E EF 04            [ 2] 1518         ldw (4,x),y 
      008870 90 85            [ 2] 1519         popw y 
      008872 EF 02            [ 2] 1520         ldw (2,x),y
      008874 81               [ 4] 1521         ret 
                                   1522 
                                   1523 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1524 ;    <ROT ( n1 n2 n3 -- n3 n1 n2 )
                                   1525 ;    rotate left 3 top elements 
                                   1526 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0007F5                       1527     _HEADER NROT,4,"<ROT"
      008875 88 59                    1         .word LINK 
                           0007F7     2         LINK=.
      008877 04                       3         .byte 4  
      008878 3C 52 4F 54              4         .ascii "<ROT"
      00887C                          5         NROT:
      00887C 90 93            [ 1] 1528     LDW Y,X 
      00887E 90 FE            [ 2] 1529     LDW Y,(Y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



      008880 90 89            [ 2] 1530     PUSHW Y ; n3 >R 
      008882 90 93            [ 1] 1531     LDW Y,X 
      008884 90 EE 02         [ 2] 1532     LDW Y,(2,Y) ; Y = n2 
      008887 FF               [ 2] 1533     LDW (X),Y   ; TOS = n2 
      008888 90 93            [ 1] 1534     LDW Y,X    
      00888A 90 EE 04         [ 2] 1535     LDW Y,(4,Y) ; Y = n1 
      00888D EF 02            [ 2] 1536     LDW (2,X),Y ;   = n1 
      00888F 90 85            [ 2] 1537     POPW Y  ; R> Y 
      008891 EF 04            [ 2] 1538     LDW (4,X),Y ; = n3 
      008893 81               [ 4] 1539     RET 
                                   1540 
                                   1541 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1542 ;       2DROP   ( w w -- )
                                   1543 ;       Discard two items on stack.
                                   1544 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000814                       1545         _HEADER DDROP,5,"2DROP"
      008894 88 77                    1         .word LINK 
                           000816     2         LINK=.
      008896 05                       3         .byte 5  
      008897 32 44 52 4F 50           4         .ascii "2DROP"
      00889C                          5         DDROP:
      00889C 1C 00 04         [ 2] 1546         ADDW X,#4
      00889F 81               [ 4] 1547         RET
                                   1548 
                                   1549 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1550 ;       2DUP    ( w1 w2 -- w1 w2 w1 w2 )
                                   1551 ;       Duplicate top two items.
                                   1552 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000820                       1553         _HEADER DDUP,4,"2DUP"
      0088A0 88 96                    1         .word LINK 
                           000822     2         LINK=.
      0088A2 04                       3         .byte 4  
      0088A3 32 44 55 50              4         .ascii "2DUP"
      0088A7                          5         DDUP:
      0088A7 1D 00 04         [ 2] 1554         SUBW X,#4
      0088AA 90 93            [ 1] 1555         LDW Y,X
      0088AC 90 EE 06         [ 2] 1556         LDW Y,(6,Y)
      0088AF EF 02            [ 2] 1557         LDW (2,X),Y
      0088B1 90 93            [ 1] 1558         LDW Y,X
      0088B3 90 EE 04         [ 2] 1559         LDW Y,(4,Y)
      0088B6 FF               [ 2] 1560         LDW (X),Y
      0088B7 81               [ 4] 1561         RET
                                   1562 
                                   1563 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1564 ;       +       ( w w -- sum )
                                   1565 ;       Add top two items.
                                   1566 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000838                       1567         _HEADER PLUS,1,"+"
      0088B8 88 A2                    1         .word LINK 
                           00083A     2         LINK=.
      0088BA 01                       3         .byte 1  
      0088BB 2B                       4         .ascii "+"
      0088BC                          5         PLUS:
      0088BC 90 93            [ 1] 1568         LDW Y,X
      0088BE 90 FE            [ 2] 1569         LDW Y,(Y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



      0088C0 90 BF 26         [ 2] 1570         LDW YTEMP,Y
      0088C3 1C 00 02         [ 2] 1571         ADDW X,#2
      0088C6 90 93            [ 1] 1572         LDW Y,X
      0088C8 90 FE            [ 2] 1573         LDW Y,(Y)
      0088CA 72 B9 00 26      [ 2] 1574         ADDW Y,YTEMP
      0088CE FF               [ 2] 1575         LDW (X),Y
      0088CF 81               [ 4] 1576         RET
                                   1577 
                                   1578 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1579 ;       TRUE ( -- -1 )
                                   1580 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000850                       1581         _HEADER TRUE,4,"TRUE"
      0088D0 88 BA                    1         .word LINK 
                           000852     2         LINK=.
      0088D2 04                       3         .byte 4  
      0088D3 54 52 55 45              4         .ascii "TRUE"
      0088D7                          5         TRUE:
      0088D7 A6 FF            [ 1] 1582         LD A,#255 
      0088D9 1D 00 02         [ 2] 1583         SUBW X,#CELLL
      0088DC F7               [ 1] 1584         LD (X),A 
      0088DD E7 01            [ 1] 1585         LD (1,X),A 
      0088DF 81               [ 4] 1586         RET 
                                   1587 
                                   1588 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1589 ;       FALSE ( -- 0 )
                                   1590 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000860                       1591         _HEADER FALSE,5,"FALSE"
      0088E0 88 D2                    1         .word LINK 
                           000862     2         LINK=.
      0088E2 05                       3         .byte 5  
      0088E3 46 41 4C 53 45           4         .ascii "FALSE"
      0088E8                          5         FALSE:
      0088E8 1D 00 02         [ 2] 1592         SUBW X,#CELLL 
      0088EB 7F               [ 1] 1593         CLR (X) 
      0088EC 6F 01            [ 1] 1594         CLR (1,X)
      0088EE 81               [ 4] 1595         RET 
                                   1596 
                                   1597 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1598 ;       NOT     ( w -- w )
                                   1599 ;       One's complement of tos.
                                   1600 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00086F                       1601         _HEADER INVER,3,"NOT"
      0088EF 88 E2                    1         .word LINK 
                           000871     2         LINK=.
      0088F1 03                       3         .byte 3  
      0088F2 4E 4F 54                 4         .ascii "NOT"
      0088F5                          5         INVER:
      0088F5 90 93            [ 1] 1602         LDW Y,X
      0088F7 90 FE            [ 2] 1603         LDW Y,(Y)
      0088F9 90 53            [ 2] 1604         CPLW Y
      0088FB FF               [ 2] 1605         LDW (X),Y
      0088FC 81               [ 4] 1606         RET
                                   1607 
                                   1608 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1609 ;       NEGATE  ( n -- -n )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



                                   1610 ;       Two's complement of tos.
                                   1611 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00087D                       1612         _HEADER NEGAT,6,"NEGATE"
      0088FD 88 F1                    1         .word LINK 
                           00087F     2         LINK=.
      0088FF 06                       3         .byte 6  
      008900 4E 45 47 41 54 45        4         .ascii "NEGATE"
      008906                          5         NEGAT:
      008906 90 93            [ 1] 1613         LDW Y,X
      008908 90 FE            [ 2] 1614         LDW Y,(Y)
      00890A 90 50            [ 2] 1615         NEGW Y
      00890C FF               [ 2] 1616         LDW (X),Y
      00890D 81               [ 4] 1617         RET
                                   1618 
                                   1619 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1620 ;       DNEGATE ( d -- -d )
                                   1621 ;       Two's complement of double.
                                   1622 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00088E                       1623         _HEADER DNEGA,7,"DNEGATE"
      00890E 88 FF                    1         .word LINK 
                           000890     2         LINK=.
      008910 07                       3         .byte 7  
      008911 44 4E 45 47 41 54 45     4         .ascii "DNEGATE"
      008918                          5         DNEGA:
      008918 90 93            [ 1] 1624         LDW Y,X
      00891A 90 FE            [ 2] 1625 	LDW Y,(Y)
      00891C 90 53            [ 2] 1626         CPLW Y
      00891E 90 89            [ 2] 1627         PUSHW Y      ; Y >R 
      008920 90 93            [ 1] 1628         LDW Y,X
      008922 90 EE 02         [ 2] 1629         LDW Y,(2,Y)
      008925 90 53            [ 2] 1630         CPLW Y
      008927 72 A9 00 01      [ 2] 1631         ADDW Y,#1
      00892B EF 02            [ 2] 1632         LDW (2,X),Y
      00892D 90 85            [ 2] 1633         POPW Y       ; R> Y  
      00892F 24 02            [ 1] 1634         JRNC DN1 
      008931 90 5C            [ 1] 1635         INCW Y
      008933 FF               [ 2] 1636 DN1:    LDW (X),Y
      008934 81               [ 4] 1637         RET
                                   1638 
                                   1639 
                                   1640 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1641 ;       S>D ( n -- d )
                                   1642 ; convert single integer to double 
                                   1643 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0008B5                       1644         _HEADER STOD,3,"S>D"
      008935 89 10                    1         .word LINK 
                           0008B7     2         LINK=.
      008937 03                       3         .byte 3  
      008938 53 3E 44                 4         .ascii "S>D"
      00893B                          5         STOD:
      00893B 1D 00 02         [ 2] 1645         SUBW X,#CELLL 
      00893E 7F               [ 1] 1646         CLR (X) 
      00893F 6F 01            [ 1] 1647         CLR (1,X) 
      008941 90 93            [ 1] 1648         LDW Y,X 
      008943 90 EE 02         [ 2] 1649         LDW Y,(2,Y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



      008946 2A 05            [ 1] 1650         JRPL 1$
      008948 90 AE FF FF      [ 2] 1651         LDW Y,#-1 
      00894C FF               [ 2] 1652         LDW (X),Y 
      00894D 81               [ 4] 1653 1$:     RET 
                                   1654 
                                   1655 
                                   1656 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1657 ;       -       ( n1 n2 -- n1-n2 )
                                   1658 ;       Subtraction.
                                   1659 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0008CE                       1660         _HEADER SUBB,1,"-"
      00894E 89 37                    1         .word LINK 
                           0008D0     2         LINK=.
      008950 01                       3         .byte 1  
      008951 2D                       4         .ascii "-"
      008952                          5         SUBB:
      008952 90 93            [ 1] 1661         LDW Y,X
      008954 90 FE            [ 2] 1662         LDW Y,(Y) ; n2 
      008956 90 89            [ 2] 1663         PUSHW Y ; n2 >R 
      008958 1C 00 02         [ 2] 1664         ADDW X,#CELLL 
      00895B 90 93            [ 1] 1665         LDW Y,X
      00895D 90 FE            [ 2] 1666         LDW Y,(Y) ; n1 
      00895F 72 F2 01         [ 2] 1667         SUBW Y,(1,SP) ; n1-n2 
      008962 FF               [ 2] 1668         LDW (X),Y
      008963 5B 02            [ 2] 1669         ADDW SP,#2 ; drop n2 from rstack 
      008965 81               [ 4] 1670         RET
                                   1671 
                                   1672 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1673 ;       ABS     ( n -- n )
                                   1674 ;       Return  absolute value of n.
                                   1675 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0008E6                       1676         _HEADER ABSS,3,"ABS"
      008966 89 50                    1         .word LINK 
                           0008E8     2         LINK=.
      008968 03                       3         .byte 3  
      008969 41 42 53                 4         .ascii "ABS"
      00896C                          5         ABSS:
      00896C 90 93            [ 1] 1677         LDW Y,X
      00896E 90 FE            [ 2] 1678 	LDW Y,(Y)
      008970 2A 03            [ 1] 1679         JRPL     AB1     ;negate:
      008972 90 50            [ 2] 1680         NEGW     Y     ;else negate hi byte
      008974 FF               [ 2] 1681         LDW (X),Y
      008975 81               [ 4] 1682 AB1:    RET
                                   1683 
                                   1684 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1685 ;       =       ( w w -- t )
                                   1686 ;       Return true if top two are equal.
                                   1687 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0008F6                       1688         _HEADER EQUAL,1,"="
      008976 89 68                    1         .word LINK 
                           0008F8     2         LINK=.
      008978 01                       3         .byte 1  
      008979 3D                       4         .ascii "="
      00897A                          5         EQUAL:
      00897A A6 FF            [ 1] 1689         LD A,#0xFF  ;true
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



      00897C 90 93            [ 1] 1690         LDW Y,X    
      00897E 90 FE            [ 2] 1691         LDW Y,(Y)   ; n2 
      008980 1C 00 02         [ 2] 1692         ADDW X,#CELLL 
      008983 F3               [ 2] 1693         CPW Y,(X)   ; n1==n2
      008984 27 01            [ 1] 1694         JREQ EQ1 
      008986 4F               [ 1] 1695         CLR A 
      008987 F7               [ 1] 1696 EQ1:    LD (X),A
      008988 E7 01            [ 1] 1697         LD (1,X),A
      00898A 81               [ 4] 1698 	RET     
                                   1699 
                                   1700 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1701 ;       U<      ( u1 u2 -- f )
                                   1702 ;       Unsigned compare of top two items.
                                   1703 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00090B                       1704         _HEADER ULESS,2,"U<"
      00898B 89 78                    1         .word LINK 
                           00090D     2         LINK=.
      00898D 02                       3         .byte 2  
      00898E 55 3C                    4         .ascii "U<"
      008990                          5         ULESS:
      008990 A6 FF            [ 1] 1705         LD A,#0xFF  ;true
      008992 90 93            [ 1] 1706         LDW Y,X    
      008994 90 EE 02         [ 2] 1707         LDW Y,(2,Y) ; u1 
      008997 F3               [ 2] 1708         CPW Y,(X)   ; cpw u1  u2 
      008998 25 01            [ 1] 1709         JRULT     ULES1
      00899A 4F               [ 1] 1710         CLR A
      00899B 1C 00 02         [ 2] 1711 ULES1:  ADDW X,#CELLL 
      00899E F7               [ 1] 1712         LD (X),A
      00899F E7 01            [ 1] 1713         LD (1,X),A
      0089A1 81               [ 4] 1714 	RET     
                                   1715 
                                   1716 
                                   1717 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1718 ;       <       ( n1 n2 -- t )
                                   1719 ;       Signed compare of top two items.
                                   1720 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000922                       1721         _HEADER LESS,1,"<"
      0089A2 89 8D                    1         .word LINK 
                           000924     2         LINK=.
      0089A4 01                       3         .byte 1  
      0089A5 3C                       4         .ascii "<"
      0089A6                          5         LESS:
      0089A6 A6 FF            [ 1] 1722         LD A,#0xFF  ;true
      0089A8 90 93            [ 1] 1723         LDW Y,X    
      0089AA 90 EE 02         [ 2] 1724         LDW Y,(2,Y)  ; n1 
      0089AD F3               [ 2] 1725         CPW Y,(X)  ; n1 < n2 ? 
      0089AE 2F 01            [ 1] 1726         JRSLT     LT1
      0089B0 4F               [ 1] 1727         CLR A
      0089B1 1C 00 02         [ 2] 1728 LT1:    ADDW X,#CELLL 
      0089B4 F7               [ 1] 1729         LD (X),A
      0089B5 E7 01            [ 1] 1730         LD (1,X),A
      0089B7 81               [ 4] 1731 	RET     
                                   1732 
                                   1733 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1734 ;   U> ( u1 u2 -- f )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



                                   1735 ;   f = true if u1>u2 
                                   1736 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000938                       1737         _HEADER UGREAT,2,"U>"
      0089B8 89 A4                    1         .word LINK 
                           00093A     2         LINK=.
      0089BA 02                       3         .byte 2  
      0089BB 55 3E                    4         .ascii "U>"
      0089BD                          5         UGREAT:
      0089BD A6 FF            [ 1] 1738         LD A,#255  
      0089BF 90 93            [ 1] 1739         LDW Y,X 
      0089C1 90 EE 02         [ 2] 1740         LDW Y,(2,Y)  ; u1 
      0089C4 F3               [ 2] 1741         CPW Y,(X)  ; u1 > u2 
      0089C5 22 01            [ 1] 1742         JRUGT UGREAT1 
      0089C7 4F               [ 1] 1743         CLR A   
      0089C8                       1744 UGREAT1:
      0089C8 1C 00 02         [ 2] 1745         ADDW X,#CELLL 
      0089CB F7               [ 1] 1746         LD (X),A 
      0089CC E7 01            [ 1] 1747         LD (1,X),A 
      0089CE 81               [ 4] 1748         RET 
                                   1749 
                                   1750 
                                   1751 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1752 ;       >   (n1 n2 -- f )
                                   1753 ;  signed compare n1 n2 
                                   1754 ;  true if n1 > n2 
                                   1755 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00094F                       1756         _HEADER GREAT,1,">"
      0089CF 89 BA                    1         .word LINK 
                           000951     2         LINK=.
      0089D1 01                       3         .byte 1  
      0089D2 3E                       4         .ascii ">"
      0089D3                          5         GREAT:
      0089D3 A6 FF            [ 1] 1757         LD A,#0xFF ;
      0089D5 90 93            [ 1] 1758         LDW Y,X 
      0089D7 90 EE 02         [ 2] 1759         LDW Y,(2,Y)  ; n1 
      0089DA F3               [ 2] 1760         CPW Y,(X) ; n1 > n2 ?  
      0089DB 2C 01            [ 1] 1761         JRSGT GREAT1 
      0089DD 4F               [ 1] 1762         CLR  A
      0089DE                       1763 GREAT1:
      0089DE 1C 00 02         [ 2] 1764         ADDW X,#CELLL 
      0089E1 F7               [ 1] 1765         LD (X),A 
      0089E2 E7 01            [ 1] 1766         LD (1,X),A 
      0089E4 81               [ 4] 1767         RET 
                                   1768 
                                   1769 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1770 ;       MAX     ( n n -- n )
                                   1771 ;       Return greater of two top items.
                                   1772 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000965                       1773         _HEADER MAX,3,"MAX"
      0089E5 89 D1                    1         .word LINK 
                           000967     2         LINK=.
      0089E7 03                       3         .byte 3  
      0089E8 4D 41 58                 4         .ascii "MAX"
      0089EB                          5         MAX:
      0089EB 90 93            [ 1] 1774         LDW Y,X    
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



      0089ED 90 FE            [ 2] 1775         LDW Y,(Y) ; n2 
      0089EF E3 02            [ 2] 1776         CPW Y,(2,X)   
      0089F1 2F 02            [ 1] 1777         JRSLT  MAX1
      0089F3 EF 02            [ 2] 1778         LDW (2,X),Y
      0089F5 1C 00 02         [ 2] 1779 MAX1:   ADDW X,#2
      0089F8 81               [ 4] 1780 	RET     
                                   1781 
                                   1782 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1783 ;       MIN     ( n n -- n )
                                   1784 ;       Return smaller of top two items.
                                   1785 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000979                       1786         _HEADER MIN,3,"MIN"
      0089F9 89 E7                    1         .word LINK 
                           00097B     2         LINK=.
      0089FB 03                       3         .byte 3  
      0089FC 4D 49 4E                 4         .ascii "MIN"
      0089FF                          5         MIN:
      0089FF 90 93            [ 1] 1787         LDW Y,X    
      008A01 90 FE            [ 2] 1788         LDW Y,(Y)  ; n2 
      008A03 E3 02            [ 2] 1789         CPW Y,(2,X) 
      008A05 2C 02            [ 1] 1790         JRSGT MIN1
      008A07 EF 02            [ 2] 1791         LDW (2,X),Y
      008A09 1C 00 02         [ 2] 1792 MIN1:	ADDW X,#2
      008A0C 81               [ 4] 1793 	RET     
                                   1794 
                                   1795 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1796 ;       WITHIN  ( u ul uh -- t )
                                   1797 ;       Return true if u is within
                                   1798 ;       range of ul and uh. ( ul <= u < uh )
                                   1799 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00098D                       1800         _HEADER WITHI,6,"WITHIN"
      008A0D 89 FB                    1         .word LINK 
                           00098F     2         LINK=.
      008A0F 06                       3         .byte 6  
      008A10 57 49 54 48 49 4E        4         .ascii "WITHIN"
      008A16                          5         WITHI:
      008A16 CD 86 C1         [ 4] 1801         CALL     OVER
      008A19 CD 89 52         [ 4] 1802         CALL     SUBB
      008A1C CD 86 62         [ 4] 1803         CALL     TOR
      008A1F CD 89 52         [ 4] 1804         CALL     SUBB
      008A22 CD 85 B4         [ 4] 1805         CALL     RFROM
      008A25 CC 89 90         [ 2] 1806         JP     ULESS
                                   1807 
                                   1808 ;; Divide
                                   1809 
                                   1810 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1811 ;       UM/MOD  ( udl udh un -- ur uq )
                                   1812 ;       Unsigned divide of a double by a
                                   1813 ;       single. Return mod and quotient.
                                   1814 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1815 ; 2021-02-22
                                   1816 ; changed algorithm for Jeeek one 
                                   1817 ; ref: https://github.com/TG9541/stm8ef/pull/406        
      0009A8                       1818         _HEADER UMMOD,6,"UM/MOD"
      008A28 8A 0F                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



                           0009AA     2         LINK=.
      008A2A 06                       3         .byte 6  
      008A2B 55 4D 2F 4D 4F 44        4         .ascii "UM/MOD"
      008A31                          5         UMMOD:
      008A31 90 93            [ 1] 1819         LDW     Y,X             ; stack pointer to Y
      008A33 FE               [ 2] 1820         LDW     X,(X)           ; un
      008A34 BF 26            [ 2] 1821         LDW     YTEMP,X         ; save un
      008A36 93               [ 1] 1822         LDW     X,Y
      008A37 5C               [ 1] 1823         INCW    X               ; drop un
      008A38 5C               [ 1] 1824         INCW    X
      008A39 89               [ 2] 1825         PUSHW   X               ; save stack pointer
      008A3A FE               [ 2] 1826         LDW     X,(X)           ; X=udh
      008A3B 26 0B            [ 1] 1827         JRNE    MMSM0
      008A3D 1E 01            [ 2] 1828         LDW    X,(1,SP)
      008A3F EE 02            [ 2] 1829         LDW    X,(2,X)          ; udl 
      008A41 90 BE 26         [ 2] 1830         LDW     Y,YTEMP         ;divisor 
      008A44 65               [ 2] 1831         DIVW    X,Y             ; udl/un 
      008A45 51               [ 1] 1832         EXGW    X,Y 
      008A46 20 26            [ 2] 1833         JRA     MMSMb 
      008A48                       1834 MMSM0:    
      008A48 90 EE 04         [ 2] 1835         LDW     Y,(4,Y)         ; Y=udl (offset before drop)
      008A4B B3 26            [ 2] 1836         CPW     X,YTEMP
      008A4D 25 09            [ 1] 1837         JRULT   MMSM1           ; X is still on the R-stack
      008A4F 85               [ 2] 1838         POPW    X               ; restore stack pointer
      008A50 90 5F            [ 1] 1839         CLRW    Y
      008A52 EF 02            [ 2] 1840         LDW     (2,X),Y         ; remainder 0
      008A54 90 5A            [ 2] 1841         DECW    Y
      008A56 FF               [ 2] 1842         LDW     (X),Y           ; quotient max. 16 bit value
      008A57 81               [ 4] 1843         RET
      008A58                       1844 MMSM1:
      008A58 A6 10            [ 1] 1845         LD      A,#16           ; loop count
      008A5A 90 58            [ 2] 1846         SLLW    Y               ; udl shift udl into udh
      008A5C                       1847 MMSM3:
      008A5C 59               [ 2] 1848         RLCW    X               ; rotate udl bit into uhdh (= remainder)
      008A5D 25 04            [ 1] 1849         JRC     MMSMa           ; if carry out of rotate
      008A5F B3 26            [ 2] 1850         CPW     X,YTEMP         ; compare udh to un
      008A61 25 05            [ 1] 1851         JRULT   MMSM4           ; can't subtract
      008A63                       1852 MMSMa:
      008A63 72 B0 00 26      [ 2] 1853         SUBW    X,YTEMP         ; can subtract
      008A67 98               [ 1] 1854         RCF
      008A68                       1855 MMSM4:
      008A68 8C               [ 1] 1856         CCF                     ; quotient bit
      008A69 90 59            [ 2] 1857         RLCW    Y               ; rotate into quotient, rotate out udl
      008A6B 4A               [ 1] 1858         DEC     A               ; repeat
      008A6C 26 EE            [ 1] 1859         JRNE    MMSM3           ; if A == 0
      008A6E                       1860 MMSMb:
      008A6E BF 26            [ 2] 1861         LDW     YTEMP,X         ; done, save remainder
      008A70 85               [ 2] 1862         POPW    X               ; restore stack pointer
      008A71 FF               [ 2] 1863         LDW     (X),Y           ; save quotient
      008A72 90 BE 26         [ 2] 1864         LDW     Y,YTEMP         ; remainder onto stack
      008A75 EF 02            [ 2] 1865         LDW     (2,X),Y
      008A77 81               [ 4] 1866         RET
                                   1867 
                                   1868 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1869 ;   U/MOD ( u1 u2 -- ur uq )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



                                   1870 ;   unsigned divide u1/u2 
                                   1871 ;   return remainder and quotient 
                                   1872 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0009F8                       1873         _HEADER USLMOD,5,"U/MOD"
      008A78 8A 2A                    1         .word LINK 
                           0009FA     2         LINK=.
      008A7A 05                       3         .byte 5  
      008A7B 55 2F 4D 4F 44           4         .ascii "U/MOD"
      008A80                          5         USLMOD:
      008A80 90 93            [ 1] 1874         LDW Y,X 
      008A82 90 FE            [ 2] 1875         LDW Y,(Y)  ; dividend 
      008A84 89               [ 2] 1876         PUSHW X    ; DP >R 
      008A85 EE 02            [ 2] 1877         LDW X,(2,X) ; divisor 
      008A87 65               [ 2] 1878         DIVW X,Y 
      008A88 89               [ 2] 1879         PUSHW X     ; quotient 
      008A89 1E 03            [ 2] 1880         LDW X,(3,SP) ; DP 
      008A8B EF 02            [ 2] 1881         LDW (2,X),Y ; remainder 
      008A8D 16 01            [ 2] 1882         LDW Y,(1,SP) ; quotient 
      008A8F FF               [ 2] 1883         LDW (X),Y 
      008A90 5B 04            [ 2] 1884         ADDW SP,#2*CELLL ; drop quotient and DP from rstack 
      008A92 81               [ 4] 1885         RET 
                                   1886 
                                   1887 
                                   1888 
                                   1889 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
                                   1890 ;       M/MOD   ( d n -- r q )
                                   1891 ;       Signed floored divide of double by
                                   1892 ;       single. Return mod and quotient.
                                   1893 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000A13                       1894         _HEADER MSMOD,5,"M/MOD"
      008A93 8A 7A                    1         .word LINK 
                           000A15     2         LINK=.
      008A95 05                       3         .byte 5  
      008A96 4D 2F 4D 4F 44           4         .ascii "M/MOD"
      008A9B                          5         MSMOD:
      008A9B CD 86 99         [ 4] 1895         CALL	DUPP
      008A9E CD 86 D0         [ 4] 1896         CALL	ZLESS
      008AA1 CD 86 99         [ 4] 1897         CALL	DUPP
      008AA4 CD 86 62         [ 4] 1898         CALL	TOR
      008AA7 CD 85 18         [ 4] 1899         CALL	QBRAN
      008AAA 8A B8                 1900         .word	MMOD1
      008AAC CD 89 06         [ 4] 1901         CALL	NEGAT
      008AAF CD 86 62         [ 4] 1902         CALL	TOR
      008AB2 CD 89 18         [ 4] 1903         CALL	DNEGA
      008AB5 CD 85 B4         [ 4] 1904         CALL	RFROM
      008AB8 CD 86 62         [ 4] 1905 MMOD1:	CALL	TOR
      008ABB CD 86 99         [ 4] 1906         CALL	DUPP
      008ABE CD 86 D0         [ 4] 1907         CALL	ZLESS
      008AC1 CD 85 18         [ 4] 1908         CALL	QBRAN
      008AC4 8A CC                 1909         .word	MMOD2
      008AC6 CD 85 C5         [ 4] 1910         CALL	RAT
      008AC9 CD 88 BC         [ 4] 1911         CALL	PLUS
      008ACC CD 85 B4         [ 4] 1912 MMOD2:	CALL	RFROM
      008ACF CD 8A 31         [ 4] 1913         CALL	UMMOD
      008AD2 CD 85 B4         [ 4] 1914         CALL	RFROM
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



      008AD5 CD 85 18         [ 4] 1915         CALL	QBRAN
      008AD8 8A E3                 1916         .word	MMOD3
      008ADA CD 86 A9         [ 4] 1917         CALL	SWAPP
      008ADD CD 89 06         [ 4] 1918         CALL	NEGAT
      008AE0 CD 86 A9         [ 4] 1919         CALL	SWAPP
      008AE3 81               [ 4] 1920 MMOD3:	RET
                                   1921 
                                   1922 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1923 ;       /MOD    ( n1 n2 -- r q )
                                   1924 ;       Signed divide n1/n2. 
                                   1925 ;       Return mod and quotient.
                                   1926 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000A64                       1927         _HEADER SLMOD,4,"/MOD"
      008AE4 8A 95                    1         .word LINK 
                           000A66     2         LINK=.
      008AE6 04                       3         .byte 4  
      008AE7 2F 4D 4F 44              4         .ascii "/MOD"
      008AEB                          5         SLMOD:
      008AEB F6               [ 1] 1928         LD A,(X)
      008AEC 88               [ 1] 1929         PUSH A   ; n2 sign 
      008AED E6 02            [ 1] 1930         LD A,(2,X)
      008AEF 88               [ 1] 1931         PUSH A    ; n1 sign 
      008AF0 CD 89 6C         [ 4] 1932         CALL ABSS 
      008AF3 CD 86 62         [ 4] 1933         CALL TOR  ; 
      008AF6 CD 89 6C         [ 4] 1934         CALL ABSS 
      008AF9 CD 85 C5         [ 4] 1935         CALL RAT   
      008AFC CD 8A 80         [ 4] 1936         CALL USLMOD 
      008AFF 7B 03            [ 1] 1937         LD A,(3,SP)
      008B01 1A 04            [ 1] 1938         OR A,(4,SP)
      008B03 2A 25            [ 1] 1939         JRPL SLMOD8 ; both positive nothing to change 
      008B05 7B 03            [ 1] 1940         LD A,(3,SP)
      008B07 18 04            [ 1] 1941         XOR A,(4,SP)
      008B09 2A 12            [ 1] 1942         JRPL SLMOD1
                                   1943 ; dividend and divisor are opposite sign          
      008B0B CD 8C 17         [ 4] 1944         CALL ONEP   ; add one to quotient 
      008B0E CD 89 06         [ 4] 1945         CALL NEGAT ; negative quotient
      008B11 CD 85 C5         [ 4] 1946         CALL RAT 
      008B14 CD 88 5D         [ 4] 1947         CALL ROT 
      008B17 CD 89 52         [ 4] 1948         CALL SUBB  ; corrected_remainder=divisor-remainder 
      008B1A CD 86 A9         [ 4] 1949         CALL SWAPP
      008B1D                       1950 SLMOD1:
      008B1D 7B 04            [ 1] 1951         LD A,(4,SP) ; divisor sign 
      008B1F 2A 09            [ 1] 1952         JRPL SLMOD8 
      008B21 CD 86 62         [ 4] 1953         CALL TOR 
      008B24 CD 89 06         [ 4] 1954         CALL NEGAT ; if divisor negative negate remainder 
      008B27 CD 85 B4         [ 4] 1955         CALL RFROM 
      008B2A                       1956 SLMOD8: 
      008B2A 5B 04            [ 2] 1957         ADDW SP,#4 
      008B2C 81               [ 4] 1958         RET 
                                   1959 
                                   1960 ;        CALL	OVER
                                   1961 ;        CALL	ZLESS
                                   1962 ;        CALL	SWAPP
                                   1963 ;        JP	MSMOD
                                   1964 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



                                   1965 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1966 ;       MOD     ( n n -- r )
                                   1967 ;       Signed divide. Return mod only.
                                   1968 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000AAD                       1969         _HEADER MODD,3,"MOD"
      008B2D 8A E6                    1         .word LINK 
                           000AAF     2         LINK=.
      008B2F 03                       3         .byte 3  
      008B30 4D 4F 44                 4         .ascii "MOD"
      008B33                          5         MODD:
      008B33 CD 8A EB         [ 4] 1970 	CALL	SLMOD
      008B36 CC 86 8F         [ 2] 1971 	JP	DROP
                                   1972 
                                   1973 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1974 ;       /       ( n n -- q )
                                   1975 ;       Signed divide. Return quotient only.
                                   1976 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000AB9                       1977         _HEADER SLASH,1,"/"
      008B39 8B 2F                    1         .word LINK 
                           000ABB     2         LINK=.
      008B3B 01                       3         .byte 1  
      008B3C 2F                       4         .ascii "/"
      008B3D                          5         SLASH:
      008B3D CD 8A EB         [ 4] 1978         CALL	SLMOD
      008B40 CD 86 A9         [ 4] 1979         CALL	SWAPP
      008B43 CC 86 8F         [ 2] 1980         JP	DROP
                                   1981 
                                   1982 ;; Multiply
                                   1983 
                                   1984 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1985 ;       UM*     ( u1 u2 -- ud )
                                   1986 ;       Unsigned multiply. Return 
                                   1987 ;       double product.
                                   1988 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000AC6                       1989         _HEADER UMSTA,3,"UM*"
      008B46 8B 3B                    1         .word LINK 
                           000AC8     2         LINK=.
      008B48 03                       3         .byte 3  
      008B49 55 4D 2A                 4         .ascii "UM*"
      008B4C                          5         UMSTA:
                                   1990 ; stack have 4 bytes u1=a:b u2=c:d
                                   1991         ;; bytes offset on data stack 
                           000002  1992         da=2 
                           000003  1993         db=3 
                           000000  1994         dc=0 
                           000001  1995         dd=1 
                                   1996         ;;;;;; local variables ;;;;;;;;;
                                   1997         ;; product bytes offset on return stack 
                           000001  1998         UD1=1  ; ud bits 31..24
                           000002  1999         UD2=2  ; ud bits 23..16
                           000003  2000         UD3=3  ; ud bits 15..8 
                           000004  2001         UD4=4  ; ud bits 7..0 
                                   2002         ;; local variable for product set to zero   
      008B4C 90 5F            [ 1] 2003         clrw y 
      008B4E 90 89            [ 2] 2004         pushw y  ; bits 15..0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      008B50 90 89            [ 2] 2005         pushw y  ; bits 31..16 
      008B52 E6 03            [ 1] 2006         ld a,(db,x) ; b 
      008B54 90 97            [ 1] 2007         ld yl,a 
      008B56 E6 01            [ 1] 2008         ld a,(dd,x)   ; d
      008B58 90 42            [ 4] 2009         mul y,a    ; b*d  
      008B5A 17 03            [ 2] 2010         ldw (UD3,sp),y ; lowest weight product 
      008B5C E6 03            [ 1] 2011         ld a,(db,x)
      008B5E 90 97            [ 1] 2012         ld yl,a 
      008B60 E6 00            [ 1] 2013         ld a,(dc,x)
      008B62 90 42            [ 4] 2014         mul y,a  ; b*c 
                                   2015         ;;; do the partial sum 
      008B64 72 F9 02         [ 2] 2016         addw y,(UD2,sp)
      008B67 4F               [ 1] 2017         clr a 
      008B68 49               [ 1] 2018         rlc a
      008B69 6B 01            [ 1] 2019         ld (UD1,sp),a 
      008B6B 17 02            [ 2] 2020         ldw (UD2,sp),y 
      008B6D E6 02            [ 1] 2021         ld a,(da,x)
      008B6F 90 97            [ 1] 2022         ld yl,a 
      008B71 E6 01            [ 1] 2023         ld a,(dd,x)
      008B73 90 42            [ 4] 2024         mul y,a   ; a*d 
                                   2025         ;; do partial sum 
      008B75 72 F9 02         [ 2] 2026         addw y,(UD2,sp)
      008B78 4F               [ 1] 2027         clr a 
      008B79 19 01            [ 1] 2028         adc a,(UD1,sp)
      008B7B 6B 01            [ 1] 2029         ld (UD1,sp),a  
      008B7D 17 02            [ 2] 2030         ldw (UD2,sp),y 
      008B7F E6 02            [ 1] 2031         ld a,(da,x)
      008B81 90 97            [ 1] 2032         ld yl,a 
      008B83 E6 00            [ 1] 2033         ld a,(dc,x)
      008B85 90 42            [ 4] 2034         mul y,a  ;  a*c highest weight product 
                                   2035         ;;; do partial sum 
      008B87 72 F9 01         [ 2] 2036         addw y,(UD1,sp)
      008B8A FF               [ 2] 2037         ldw (x),y  ; udh 
      008B8B 16 03            [ 2] 2038         ldw y,(UD3,sp)
      008B8D EF 02            [ 2] 2039         ldw (2,x),y  ; udl  
      008B8F 5B 04            [ 2] 2040         addw sp,#4 ; drop local variable 
      008B91 81               [ 4] 2041         ret  
                                   2042 
                                   2043 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2044 ;       *       ( n n -- n )
                                   2045 ;       Signed multiply. Return 
                                   2046 ;       single product.
                                   2047 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B12                       2048         _HEADER STAR,1,"*"
      008B92 8B 48                    1         .word LINK 
                           000B14     2         LINK=.
      008B94 01                       3         .byte 1  
      008B95 2A                       4         .ascii "*"
      008B96                          5         STAR:
      008B96 CD 8B 4C         [ 4] 2049 	CALL	UMSTA
      008B99 CC 86 8F         [ 2] 2050 	JP	DROP
                                   2051 
                                   2052 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2053 ;       M*      ( n n -- d )
                                   2054 ;       Signed multiply. Return 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



                                   2055 ;       double product.
                                   2056 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B1C                       2057         _HEADER MSTAR,2,"M*"
      008B9C 8B 94                    1         .word LINK 
                           000B1E     2         LINK=.
      008B9E 02                       3         .byte 2  
      008B9F 4D 2A                    4         .ascii "M*"
      008BA1                          5         MSTAR:
      008BA1 CD 88 A7         [ 4] 2058         CALL	DDUP
      008BA4 CD 87 1F         [ 4] 2059         CALL	XORR
      008BA7 CD 86 D0         [ 4] 2060         CALL	ZLESS
      008BAA CD 86 62         [ 4] 2061         CALL	TOR
      008BAD CD 89 6C         [ 4] 2062         CALL	ABSS
      008BB0 CD 86 A9         [ 4] 2063         CALL	SWAPP
      008BB3 CD 89 6C         [ 4] 2064         CALL	ABSS
      008BB6 CD 8B 4C         [ 4] 2065         CALL	UMSTA
      008BB9 CD 85 B4         [ 4] 2066         CALL	RFROM
      008BBC CD 85 18         [ 4] 2067         CALL	QBRAN
      008BBF 8B C4                 2068         .word	MSTA1
      008BC1 CD 89 18         [ 4] 2069         CALL	DNEGA
      008BC4 81               [ 4] 2070 MSTA1:	RET
                                   2071 
                                   2072 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2073 ;       */MOD   ( n1 n2 n3 -- r q )
                                   2074 ;       Multiply n1 and n2, then divide
                                   2075 ;       by n3. Return mod and quotient.
                                   2076 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B45                       2077         _HEADER SSMOD,5,"*/MOD"
      008BC5 8B 9E                    1         .word LINK 
                           000B47     2         LINK=.
      008BC7 05                       3         .byte 5  
      008BC8 2A 2F 4D 4F 44           4         .ascii "*/MOD"
      008BCD                          5         SSMOD:
      008BCD CD 86 62         [ 4] 2078         CALL     TOR
      008BD0 CD 8B A1         [ 4] 2079         CALL     MSTAR
      008BD3 CD 85 B4         [ 4] 2080         CALL     RFROM
      008BD6 CC 8A 9B         [ 2] 2081         JP     MSMOD
                                   2082 
                                   2083 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2084 ;       */      ( n1 n2 n3 -- q )
                                   2085 ;       Multiply n1 by n2, then divide
                                   2086 ;       by n3. Return quotient only.
                                   2087 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B59                       2088         _HEADER STASL,2,"*/"
      008BD9 8B C7                    1         .word LINK 
                           000B5B     2         LINK=.
      008BDB 02                       3         .byte 2  
      008BDC 2A 2F                    4         .ascii "*/"
      008BDE                          5         STASL:
      008BDE CD 8B CD         [ 4] 2089         CALL	SSMOD
      008BE1 CD 86 A9         [ 4] 2090         CALL	SWAPP
      008BE4 CC 86 8F         [ 2] 2091         JP	DROP
                                   2092 
                                   2093 ;; Miscellaneous
                                   2094 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



                                   2095 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2096 ;       2+   ( a -- a )
                                   2097 ;       Add cell size in byte to address.
                                   2098 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B67                       2099         _HEADER CELLP,2,"2+"
      008BE7 8B DB                    1         .word LINK 
                           000B69     2         LINK=.
      008BE9 02                       3         .byte 2  
      008BEA 32 2B                    4         .ascii "2+"
      008BEC                          5         CELLP:
      008BEC 90 93            [ 1] 2100         LDW Y,X
      008BEE 90 FE            [ 2] 2101 	LDW Y,(Y)
      008BF0 72 A9 00 02      [ 2] 2102         ADDW Y,#CELLL 
      008BF4 FF               [ 2] 2103         LDW (X),Y
      008BF5 81               [ 4] 2104         RET
                                   2105 
                                   2106 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2107 ;       2-   ( a -- a )
                                   2108 ;       Subtract 2 from address.
                                   2109 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B76                       2110         _HEADER CELLM,2,"2-"
      008BF6 8B E9                    1         .word LINK 
                           000B78     2         LINK=.
      008BF8 02                       3         .byte 2  
      008BF9 32 2D                    4         .ascii "2-"
      008BFB                          5         CELLM:
      008BFB 90 93            [ 1] 2111         LDW Y,X
      008BFD 90 FE            [ 2] 2112 	LDW Y,(Y)
      008BFF 72 A2 00 02      [ 2] 2113         SUBW Y,#CELLL
      008C03 FF               [ 2] 2114         LDW (X),Y
      008C04 81               [ 4] 2115         RET
                                   2116 
                                   2117 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2118 ;       2*   ( n -- n )
                                   2119 ;       Multiply tos by 2.
                                   2120 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B85                       2121         _HEADER CELLS,2,"2*"
      008C05 8B F8                    1         .word LINK 
                           000B87     2         LINK=.
      008C07 02                       3         .byte 2  
      008C08 32 2A                    4         .ascii "2*"
      008C0A                          5         CELLS:
      008C0A 90 93            [ 1] 2122         LDW Y,X
      008C0C 90 FE            [ 2] 2123 	LDW Y,(Y)
      008C0E 90 58            [ 2] 2124         SLAW Y
      008C10 FF               [ 2] 2125         LDW (X),Y
      008C11 81               [ 4] 2126         RET
                                   2127 
                                   2128 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2129 ;       1+      ( a -- a )
                                   2130 ;       Add cell size in byte 
                                   2131 ;       to address.
                                   2132 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B92                       2133         _HEADER ONEP,2,"1+"
      008C12 8C 07                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



                           000B94     2         LINK=.
      008C14 02                       3         .byte 2  
      008C15 31 2B                    4         .ascii "1+"
      008C17                          5         ONEP:
      008C17 90 93            [ 1] 2134         LDW Y,X
      008C19 90 FE            [ 2] 2135 	LDW Y,(Y)
      008C1B 90 5C            [ 1] 2136         INCW Y
      008C1D FF               [ 2] 2137         LDW (X),Y
      008C1E 81               [ 4] 2138         RET
                                   2139 
                                   2140 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2141 ;       1-      ( a -- a )
                                   2142 ;       Subtract 2 from address.
                                   2143 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000B9F                       2144         _HEADER ONEM,2,"1-"
      008C1F 8C 14                    1         .word LINK 
                           000BA1     2         LINK=.
      008C21 02                       3         .byte 2  
      008C22 31 2D                    4         .ascii "1-"
      008C24                          5         ONEM:
      008C24 90 93            [ 1] 2145         LDW Y,X
      008C26 90 FE            [ 2] 2146 	LDW Y,(Y)
      008C28 90 5A            [ 2] 2147         DECW Y
      008C2A FF               [ 2] 2148         LDW (X),Y
      008C2B 81               [ 4] 2149         RET
                                   2150 
                                   2151 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2152 ;  shift left n times 
                                   2153 ; LSHIFT ( n1 n2 -- n1<<n2 )
                                   2154 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000BAC                       2155         _HEADER LSHIFT,6,"LSHIFT"
      008C2C 8C 21                    1         .word LINK 
                           000BAE     2         LINK=.
      008C2E 06                       3         .byte 6  
      008C2F 4C 53 48 49 46 54        4         .ascii "LSHIFT"
      008C35                          5         LSHIFT:
      008C35 E6 01            [ 1] 2156         ld a,(1,x)
      008C37 1C 00 02         [ 2] 2157         addw x,#CELLL 
      008C3A 90 93            [ 1] 2158         ldw y,x 
      008C3C 90 FE            [ 2] 2159         ldw y,(y)
      008C3E                       2160 LSHIFT1:
      008C3E 4D               [ 1] 2161         tnz a 
      008C3F 27 05            [ 1] 2162         jreq LSHIFT4 
      008C41 90 58            [ 2] 2163         sllw y 
      008C43 4A               [ 1] 2164         dec a 
      008C44 20 F8            [ 2] 2165         jra LSHIFT1 
      008C46                       2166 LSHIFT4:
      008C46 FF               [ 2] 2167         ldw (x),y 
      008C47 81               [ 4] 2168         ret 
                                   2169 
                                   2170 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2171 ; shift right n times                 
                                   2172 ; RSHIFT (n1 n2 -- n1>>n2 )
                                   2173 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000BC8                       2174         _HEADER RSHIFT,6,"RSHIFT"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



      008C48 8C 2E                    1         .word LINK 
                           000BCA     2         LINK=.
      008C4A 06                       3         .byte 6  
      008C4B 52 53 48 49 46 54        4         .ascii "RSHIFT"
      008C51                          5         RSHIFT:
      008C51 E6 01            [ 1] 2175         ld a,(1,x)
      008C53 1C 00 02         [ 2] 2176         addw x,#CELLL 
      008C56 90 93            [ 1] 2177         ldw y,x 
      008C58 90 FE            [ 2] 2178         ldw y,(y)
      008C5A                       2179 RSHIFT1:
      008C5A 4D               [ 1] 2180         tnz a 
      008C5B 27 05            [ 1] 2181         jreq RSHIFT4 
      008C5D 90 54            [ 2] 2182         srlw y 
      008C5F 4A               [ 1] 2183         dec a 
      008C60 20 F8            [ 2] 2184         jra RSHIFT1 
      008C62                       2185 RSHIFT4:
      008C62 FF               [ 2] 2186         ldw (x),y 
      008C63 81               [ 4] 2187         ret 
                                   2188 
                                   2189 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2190 ;       2/      ( n -- n )
                                   2191 ;       divide  tos by 2.
                                   2192 ;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000BE4                       2193         _HEADER TWOSL,2,"2/"
      008C64 8C 4A                    1         .word LINK 
                           000BE6     2         LINK=.
      008C66 02                       3         .byte 2  
      008C67 32 2F                    4         .ascii "2/"
      008C69                          5         TWOSL:
      008C69 90 93            [ 1] 2194         LDW Y,X
      008C6B 90 FE            [ 2] 2195 	LDW Y,(Y)
      008C6D 90 57            [ 2] 2196         SRAW Y
      008C6F FF               [ 2] 2197         LDW (X),Y
      008C70 81               [ 4] 2198         RET
                                   2199 
                                   2200 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2201 ;       BL      ( -- 32 )
                                   2202 ;       Return 32,  blank character.
                                   2203 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000BF1                       2204         _HEADER BLANK,2,"BL"
      008C71 8C 66                    1         .word LINK 
                           000BF3     2         LINK=.
      008C73 02                       3         .byte 2  
      008C74 42 4C                    4         .ascii "BL"
      008C76                          5         BLANK:
      008C76 1D 00 02         [ 2] 2205         SUBW X,#2
      008C79 90 AE 00 20      [ 2] 2206 	LDW Y,#32
      008C7D FF               [ 2] 2207         LDW (X),Y
      008C7E 81               [ 4] 2208         RET
                                   2209 
                                   2210 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2211 ;         0     ( -- 0)
                                   2212 ;         Return 0.
                                   2213 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000BFF                       2214         _HEADER ZERO,1,"0"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



      008C7F 8C 73                    1         .word LINK 
                           000C01     2         LINK=.
      008C81 01                       3         .byte 1  
      008C82 30                       4         .ascii "0"
      008C83                          5         ZERO:
      008C83 1D 00 02         [ 2] 2215         SUBW X,#2
      008C86 90 5F            [ 1] 2216 	CLRW Y
      008C88 FF               [ 2] 2217         LDW (X),Y
      008C89 81               [ 4] 2218         RET
                                   2219 
                                   2220 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2221 ;         1     ( -- 1)
                                   2222 ;         Return 1.
                                   2223 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000C0A                       2224         _HEADER ONE,1,"1"
      008C8A 8C 81                    1         .word LINK 
                           000C0C     2         LINK=.
      008C8C 01                       3         .byte 1  
      008C8D 31                       4         .ascii "1"
      008C8E                          5         ONE:
      008C8E 1D 00 02         [ 2] 2225         SUBW X,#2
      008C91 90 AE 00 01      [ 2] 2226 	LDW Y,#1
      008C95 FF               [ 2] 2227         LDW (X),Y
      008C96 81               [ 4] 2228         RET
                                   2229 
                                   2230 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2231 ;         -1    ( -- -1)
                                   2232 ;   Return -1
                                   2233 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000C17                       2234         _HEADER MONE,2,"-1"
      008C97 8C 8C                    1         .word LINK 
                           000C19     2         LINK=.
      008C99 02                       3         .byte 2  
      008C9A 2D 31                    4         .ascii "-1"
      008C9C                          5         MONE:
      008C9C 1D 00 02         [ 2] 2235         SUBW X,#2
      008C9F 90 AE FF FF      [ 2] 2236 	LDW Y,#0xFFFF
      008CA3 FF               [ 2] 2237         LDW (X),Y
      008CA4 81               [ 4] 2238         RET
                                   2239 
                                   2240 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2241 ;       >CHAR   ( c -- c )
                                   2242 ;       Filter non-printing characters.
                                   2243 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000C25                       2244         _HEADER TCHAR,5,">CHAR"
      008CA5 8C 99                    1         .word LINK 
                           000C27     2         LINK=.
      008CA7 05                       3         .byte 5  
      008CA8 3E 43 48 41 52           4         .ascii ">CHAR"
      008CAD                          5         TCHAR:
      008CAD E6 01            [ 1] 2245         ld a,(1,x)
      008CAF A1 20            [ 1] 2246         cp a,#32  
      008CB1 2B 05            [ 1] 2247         jrmi 1$ 
      008CB3 A1 7F            [ 1] 2248         cp a,#127 
      008CB5 2A 01            [ 1] 2249         jrpl 1$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



      008CB7 81               [ 4] 2250         ret 
      008CB8 A6 5F            [ 1] 2251 1$:     ld a,#'_ 
      008CBA E7 01            [ 1] 2252         ld (1,x),a 
      008CBC 81               [ 4] 2253         ret 
                                   2254 
                                   2255 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2256 ;       DEPTH   ( -- n )
                                   2257 ;       Return  depth of  data stack.
                                   2258 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000C3D                       2259         _HEADER DEPTH,5,"DEPTH"
      008CBD 8C A7                    1         .word LINK 
                           000C3F     2         LINK=.
      008CBF 05                       3         .byte 5  
      008CC0 44 45 50 54 48           4         .ascii "DEPTH"
      008CC5                          5         DEPTH:
      008CC5 90 BE 2C         [ 2] 2260         LDW Y,SP0    ;save data stack ptr
      008CC8 BF 24            [ 2] 2261 	LDW XTEMP,X
      008CCA 72 B2 00 24      [ 2] 2262         SUBW Y,XTEMP     ;#bytes = SP0 - X
      008CCE 90 57            [ 2] 2263         SRAW Y    ;Y = #stack items
      008CD0 1D 00 02         [ 2] 2264 	SUBW X,#2
      008CD3 FF               [ 2] 2265         LDW (X),Y     ; if neg, underflow
      008CD4 81               [ 4] 2266         RET
                                   2267 
                                   2268 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2269 ;       PICK    ( ... +n -- ... w )
                                   2270 ;       Copy  nth stack item to tos.
                                   2271 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000C55                       2272         _HEADER PICK,4,"PICK"
      008CD5 8C BF                    1         .word LINK 
                           000C57     2         LINK=.
      008CD7 04                       3         .byte 4  
      008CD8 50 49 43 4B              4         .ascii "PICK"
      008CDC                          5         PICK:
      008CDC 90 93            [ 1] 2273         LDW Y,X   ;D = n1
      008CDE 90 FE            [ 2] 2274         LDW Y,(Y)
                                   2275 ; modified for standard compliance          
                                   2276 ; 0 PICK must be equivalent to DUP 
      008CE0 90 5C            [ 1] 2277         INCW Y 
      008CE2 90 58            [ 2] 2278         SLAW Y
      008CE4 BF 24            [ 2] 2279         LDW XTEMP,X
      008CE6 72 B9 00 24      [ 2] 2280         ADDW Y,XTEMP
      008CEA 90 FE            [ 2] 2281         LDW Y,(Y)
      008CEC FF               [ 2] 2282         LDW (X),Y
      008CED 81               [ 4] 2283         RET
                                   2284 
                                   2285 ;; Memory access
                                   2286 
                                   2287 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2288 ;       +!      ( n a -- )
                                   2289 ;       Add n to  contents at 
                                   2290 ;       address a.
                                   2291 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000C6E                       2292         _HEADER PSTOR,2,"+!"
      008CEE 8C D7                    1         .word LINK 
                           000C70     2         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



      008CF0 02                       3         .byte 2  
      008CF1 2B 21                    4         .ascii "+!"
      008CF3                          5         PSTOR:
      008CF3 89               [ 2] 2293         PUSHW X   ; R: DP 
      008CF4 90 93            [ 1] 2294         LDW Y,X 
      008CF6 FE               [ 2] 2295         LDW X,(X) ; a 
      008CF7 90 EE 02         [ 2] 2296         LDW Y,(2,Y)  ; n 
      008CFA 90 89            [ 2] 2297         PUSHW Y      ; R: DP n 
      008CFC 90 93            [ 1] 2298         LDW Y,X 
      008CFE 90 FE            [ 2] 2299         LDW Y,(Y)
      008D00 72 F9 01         [ 2] 2300         ADDW Y,(1,SP) ; *a + n 
      008D03 FF               [ 2] 2301         LDW (X),Y 
      008D04 1E 03            [ 2] 2302         LDW X,(3,SP) ; DP
      008D06 1C 00 04         [ 2] 2303         ADDW X,#2*CELLL  ; ( n a -- )  
      008D09 5B 04            [ 2] 2304         ADDW SP,#2*CELLL ; R: DP n -- 
      008D0B 81               [ 4] 2305         RET 
                                   2306                 
                                   2307 
                                   2308 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2309 ;       2!      ( d a -- )
                                   2310 ;       Store  double integer 
                                   2311 ;       to address a.
                                   2312 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000C8C                       2313         _HEADER DSTOR,2,"2!"
      008D0C 8C F0                    1         .word LINK 
                           000C8E     2         LINK=.
      008D0E 02                       3         .byte 2  
      008D0F 32 21                    4         .ascii "2!"
      008D11                          5         DSTOR:
      008D11 90 93            [ 1] 2314         LDW Y,X 
      008D13 89               [ 2] 2315         PUSHW X 
      008D14 FE               [ 2] 2316         LDW X,(X) ; a 
      008D15 90 EE 02         [ 2] 2317         LDW Y,(2,Y) ; dhi 
      008D18 FF               [ 2] 2318         LDW (X),Y 
      008D19 16 01            [ 2] 2319         LDW Y,(1,SP)  
      008D1B 90 EE 04         [ 2] 2320         LDW Y,(4,Y) ; dlo 
      008D1E EF 02            [ 2] 2321         LDW (2,X),Y  
      008D20 85               [ 2] 2322         POPW X 
      008D21 1C 00 06         [ 2] 2323         ADDW X,#3*CELLL 
      008D24 81               [ 4] 2324         RET 
                                   2325 
                                   2326 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2327 ;       2@      ( a -- d )
                                   2328 ;       Fetch double integer 
                                   2329 ;       from address a.
                                   2330 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000CA5                       2331         _HEADER DAT,2,"2@"
      008D25 8D 0E                    1         .word LINK 
                           000CA7     2         LINK=.
      008D27 02                       3         .byte 2  
      008D28 32 40                    4         .ascii "2@"
      008D2A                          5         DAT:
      008D2A 90 93            [ 1] 2332         ldw y,x 
      008D2C 1D 00 02         [ 2] 2333         subw x,#CELLL 
      008D2F 90 FE            [ 2] 2334         ldw y,(y) ;address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      008D31 90 89            [ 2] 2335         pushw y  
      008D33 90 FE            [ 2] 2336         ldw y,(y) ; dhi 
      008D35 FF               [ 2] 2337         ldw (x),y 
      008D36 90 85            [ 2] 2338         popw y 
      008D38 90 EE 02         [ 2] 2339         ldw y,(2,y) ; dlo 
      008D3B EF 02            [ 2] 2340         ldw (2,x),y 
      008D3D 81               [ 4] 2341         ret 
                                   2342 
                                   2343 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2344 ;       COUNT   ( b -- b +n )
                                   2345 ;       Return count byte of a string
                                   2346 ;       and add 1 to byte address.
                                   2347 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000CBE                       2348         _HEADER COUNT,5,"COUNT"
      008D3E 8D 27                    1         .word LINK 
                           000CC0     2         LINK=.
      008D40 05                       3         .byte 5  
      008D41 43 4F 55 4E 54           4         .ascii "COUNT"
      008D46                          5         COUNT:
      008D46 90 93            [ 1] 2349         ldw y,x 
      008D48 90 FE            [ 2] 2350         ldw y,(y) ; address 
      008D4A 90 F6            [ 1] 2351         ld a,(y)  ; count 
      008D4C 90 5C            [ 1] 2352         incw y 
      008D4E FF               [ 2] 2353         ldw (x),y 
      008D4F 1D 00 02         [ 2] 2354         subw x,#CELLL 
      008D52 E7 01            [ 1] 2355         ld (1,x),a 
      008D54 7F               [ 1] 2356         clr (x)
      008D55 81               [ 4] 2357         ret 
                                   2358 
                                   2359 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2360 ;       HERE    ( -- a )
                                   2361 ;       Return  top of  variables
                                   2362 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000CD6                       2363         _HEADER HERE,4,"HERE"
      008D56 8D 40                    1         .word LINK 
                           000CD8     2         LINK=.
      008D58 04                       3         .byte 4  
      008D59 48 45 52 45              4         .ascii "HERE"
      008D5D                          5         HERE:
      008D5D 90 AE 00 18      [ 2] 2364       	ldw y,#UVP 
      008D61 90 FE            [ 2] 2365         ldw y,(y)
      008D63 1D 00 02         [ 2] 2366         subw x,#CELLL 
      008D66 FF               [ 2] 2367         ldw (x),y 
      008D67 81               [ 4] 2368         ret 
                                   2369 
                                   2370 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2371 ;       PAD     ( -- a )
                                   2372 ;       Return address of text buffer
                                   2373 ;       above  code dictionary.
                                   2374 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000CE8                       2375         _HEADER PAD,3,"PAD"
      008D68 8D 58                    1         .word LINK 
                           000CEA     2         LINK=.
      008D6A 03                       3         .byte 3  
      008D6B 50 41 44                 4         .ascii "PAD"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      008D6E                          5         PAD:
      008D6E CD 8D 5D         [ 4] 2376         CALL     HERE
      000CF1                       2377         _DOLIT   80
      008D71 CD 84 EF         [ 4]    1     CALL DOLIT 
      008D74 00 50                    2     .word 80 
      008D76 CC 88 BC         [ 2] 2378         JP     PLUS
                                   2379 
                                   2380 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2381 ;       TIB     ( -- a )
                                   2382 ;       Return address of 
                                   2383 ;       terminal input buffer.
                                   2384 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000CF9                       2385         _HEADER TIB,3,"TIB"
      008D79 8D 6A                    1         .word LINK 
                           000CFB     2         LINK=.
      008D7B 03                       3         .byte 3  
      008D7C 54 49 42                 4         .ascii "TIB"
      008D7F                          5         TIB:
      008D7F CD 87 8D         [ 4] 2386         CALL     NTIB
      008D82 CD 8B EC         [ 4] 2387         CALL     CELLP
      008D85 CC 85 63         [ 2] 2388         JP     AT
                                   2389 
                                   2390 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2391 ;       @EXECUTE        ( a -- )
                                   2392 ;       Execute vector stored in 
                                   2393 ;       address a.
                                   2394 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000D08                       2395         _HEADER ATEXE,8,"@EXECUTE"
      008D88 8D 7B                    1         .word LINK 
                           000D0A     2         LINK=.
      008D8A 08                       3         .byte 8  
      008D8B 40 45 58 45 43 55 54     4         .ascii "@EXECUTE"
             45
      008D93                          5         ATEXE:
      008D93 CD 85 63         [ 4] 2396         CALL     AT
      008D96 CD 88 4C         [ 4] 2397         CALL     QDUP    ;?address or zero
      008D99 CD 85 18         [ 4] 2398         CALL     QBRAN
      008D9C 8D A1                 2399         .word      EXE1
      008D9E CD 85 44         [ 4] 2400         CALL     EXECU   ;execute if non-zero
      008DA1 81               [ 4] 2401 EXE1:   RET     ;do nothing if zero
                                   2402 
                                   2403 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2404 ;       CMOVE   ( b1 b2 u -- )
                                   2405 ;       Copy u bytes from b1 to b2.
                                   2406 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000D22                       2407         _HEADER CMOVE,5,"CMOVE"
      008DA2 8D 8A                    1         .word LINK 
                           000D24     2         LINK=.
      008DA4 05                       3         .byte 5  
      008DA5 43 4D 4F 56 45           4         .ascii "CMOVE"
      008DAA                          5         CMOVE:
                                   2408         ;;;;  local variables ;;;;;;;
                           000005  2409         DP = 5
                           000003  2410         YTMP = 3 
                           000001  2411         CNT  = 1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



                                   2412         ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      008DAA 89               [ 2] 2413         PUSHW X  ; R: DP  
      008DAB 52 02            [ 2] 2414         SUB SP,#2 ; R: DP YTMP 
      008DAD 90 93            [ 1] 2415         LDW Y,X 
      008DAF 90 FE            [ 2] 2416         LDW Y,(Y) ; CNT 
      008DB1 90 89            [ 2] 2417         PUSHW Y  ; R: DP YTMP CNT
      008DB3 90 93            [ 1] 2418         LDW Y,X 
      008DB5 90 EE 02         [ 2] 2419         LDW Y,(2,Y) ; b2, dest 
      008DB8 EE 04            [ 2] 2420         LDW X,(4,X) ; b1, src 
      008DBA 17 03            [ 2] 2421         LDW (YTMP,SP),Y 
      008DBC 13 03            [ 2] 2422         CPW X,(YTMP,SP) 
      008DBE 22 1A            [ 1] 2423         JRUGT CMOV2  ; src>dest 
                                   2424 ; src<dest copy from top to bottom
      008DC0 72 FB 01         [ 2] 2425         ADDW X,(CNT,SP)
      008DC3 72 F9 01         [ 2] 2426         ADDW Y,(CNT,SP)
      008DC6                       2427 CMOV1:  
      008DC6 17 03            [ 2] 2428         LDW (YTMP,SP),Y 
      008DC8 16 01            [ 2] 2429         LDW Y,(CNT,SP)
      008DCA 27 22            [ 1] 2430         JREQ CMOV3 
      008DCC 90 5A            [ 2] 2431         DECW Y 
      008DCE 17 01            [ 2] 2432         LDW (CNT,SP),Y 
      008DD0 16 03            [ 2] 2433         LDW Y,(YTMP,SP)
      008DD2 5A               [ 2] 2434         DECW X
      008DD3 F6               [ 1] 2435         LD A,(X)
      008DD4 90 5A            [ 2] 2436         DECW Y 
      008DD6 90 F7            [ 1] 2437         LD (Y),A 
      008DD8 20 EC            [ 2] 2438         JRA CMOV1
                                   2439 ; src>dest copy from bottom to top   
      008DDA                       2440 CMOV2: 
      008DDA 17 03            [ 2] 2441         LDW (YTMP,SP),Y 
      008DDC 16 01            [ 2] 2442         LDW Y,(CNT,SP)
      008DDE 27 0E            [ 1] 2443         JREQ CMOV3
      008DE0 90 5A            [ 2] 2444         DECW Y 
      008DE2 17 01            [ 2] 2445         LDW (CNT,SP),Y 
      008DE4 16 03            [ 2] 2446         LDW Y,(YTMP,SP)
      008DE6 F6               [ 1] 2447         LD A,(X)
      008DE7 5C               [ 1] 2448         INCW X 
      008DE8 90 F7            [ 1] 2449         LD (Y),A 
      008DEA 90 5C            [ 1] 2450         INCW Y 
      008DEC 20 EC            [ 2] 2451         JRA CMOV2 
      008DEE                       2452 CMOV3:
      008DEE 1E 05            [ 2] 2453         LDW X,(DP,SP)
      008DF0 1C 00 06         [ 2] 2454         ADDW X,#3*CELLL 
      008DF3 5B 06            [ 2] 2455         ADDW SP,#3*CELLL 
      008DF5 81               [ 4] 2456         RET 
                                   2457         
                                   2458 
                                   2459 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2460 ;       FILL    ( b u c -- )
                                   2461 ;       Fill u bytes of character c
                                   2462 ;       to area beginning at b.
                                   2463 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000D76                       2464         _HEADER FILL,4,"FILL"
      008DF6 8D A4                    1         .word LINK 
                           000D78     2         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



      008DF8 04                       3         .byte 4  
      008DF9 46 49 4C 4C              4         .ascii "FILL"
      008DFD                          5         FILL:
      008DFD E6 01            [ 1] 2465         LD A,(1,X)
      008DFF 90 93            [ 1] 2466         LDW Y,X 
      008E01 1C 00 06         [ 2] 2467         ADDW X,#3*CELLL 
      008E04 89               [ 2] 2468         PUSHW X ; R: DP 
      008E05 93               [ 1] 2469         LDW X,Y 
      008E06 EE 04            [ 2] 2470         LDW X,(4,X) ; b
      008E08 90 EE 02         [ 2] 2471         LDW Y,(2,Y) ; u
      008E0B                       2472 FILL0:
      008E0B 27 06            [ 1] 2473         JREQ FILL1
      008E0D F7               [ 1] 2474         LD (X),A 
      008E0E 5C               [ 1] 2475         INCW X 
      008E0F 90 5A            [ 2] 2476         DECW Y 
      008E11 20 F8            [ 2] 2477         JRA FILL0         
      008E13 85               [ 2] 2478 FILL1: POPW X 
      008E14 81               [ 4] 2479         RET         
                                   2480         
                                   2481 
                                   2482 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2483 ;       ERASE   ( b u -- )
                                   2484 ;       Erase u bytes beginning at b.
                                   2485 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000D95                       2486         _HEADER ERASE,5,"ERASE"
      008E15 8D F8                    1         .word LINK 
                           000D97     2         LINK=.
      008E17 05                       3         .byte 5  
      008E18 45 52 41 53 45           4         .ascii "ERASE"
      008E1D                          5         ERASE:
      008E1D 90 5F            [ 1] 2487         clrw y 
      008E1F 1D 00 02         [ 2] 2488         subw x,#CELLL 
      008E22 FF               [ 2] 2489         ldw (x),y 
      008E23 CC 8D FD         [ 2] 2490         jp FILL 
                                   2491 
                                   2492 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2493 ;       PACK0   ( b u a -- a )
                                   2494 ;       Build a counted string with
                                   2495 ;       u characters from b. Null fill.
                                   2496 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000DA6                       2497         _HEADER PACKS,5,"PACK0"
      008E26 8E 17                    1         .word LINK 
                           000DA8     2         LINK=.
      008E28 05                       3         .byte 5  
      008E29 50 41 43 4B 30           4         .ascii "PACK0"
      008E2E                          5         PACKS:
      008E2E CD 86 99         [ 4] 2498         CALL     DUPP
      008E31 CD 86 62         [ 4] 2499         CALL     TOR     ;strings only on cell boundary
      008E34 CD 88 A7         [ 4] 2500         CALL     DDUP
      008E37 CD 85 70         [ 4] 2501         CALL     CSTOR
      008E3A CD 8C 17         [ 4] 2502         CALL     ONEP ;save count
      008E3D CD 86 A9         [ 4] 2503         CALL     SWAPP
      008E40 CD 8D AA         [ 4] 2504         CALL     CMOVE
      008E43 CD 85 B4         [ 4] 2505         CALL     RFROM
      008E46 81               [ 4] 2506         RET
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



                                   2507 
                                   2508 ;; Numeric output, single precision
                                   2509 
                                   2510 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2511 ;       DIGIT   ( u -- c )
                                   2512 ;       Convert digit u to a character.
                                   2513 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000DC7                       2514         _HEADER DIGIT,5,"DIGIT"
      008E47 8E 28                    1         .word LINK 
                           000DC9     2         LINK=.
      008E49 05                       3         .byte 5  
      008E4A 44 49 47 49 54           4         .ascii "DIGIT"
      008E4F                          5         DIGIT:
      008E4F CD 84 EF         [ 4] 2515         CALL	DOLIT
      008E52 00 09                 2516         .word	9
      008E54 CD 86 C1         [ 4] 2517         CALL	OVER
      008E57 CD 89 A6         [ 4] 2518         CALL	LESS
      008E5A CD 84 EF         [ 4] 2519         CALL	DOLIT
      008E5D 00 07                 2520         .word	7
      008E5F CD 86 F6         [ 4] 2521         CALL	ANDD
      008E62 CD 88 BC         [ 4] 2522         CALL	PLUS
      008E65 CD 84 EF         [ 4] 2523         CALL	DOLIT
      008E68 00 30                 2524         .word	48	;'0'
      008E6A CC 88 BC         [ 2] 2525         JP	PLUS
                                   2526 
                                   2527 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2528 ;       EXTRACT ( n base -- n c )
                                   2529 ;       Extract least significant 
                                   2530 ;       digit from n.
                                   2531 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000DED                       2532         _HEADER EXTRC,7,"EXTRACT"
      008E6D 8E 49                    1         .word LINK 
                           000DEF     2         LINK=.
      008E6F 07                       3         .byte 7  
      008E70 45 58 54 52 41 43 54     4         .ascii "EXTRACT"
      008E77                          5         EXTRC:
      008E77 CD 8C 83         [ 4] 2533         CALL     ZERO
      008E7A CD 86 A9         [ 4] 2534         CALL     SWAPP
      008E7D CD 8A 31         [ 4] 2535         CALL     UMMOD
      008E80 CD 86 A9         [ 4] 2536         CALL     SWAPP
      008E83 CC 8E 4F         [ 2] 2537         JP     DIGIT
                                   2538 
                                   2539 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2540 ;       <#      ( -- )
                                   2541 ;       Initiate  numeric 
                                   2542 ;       output process.
                                   2543 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000E06                       2544         _HEADER BDIGS,2,"#<"
      008E86 8E 6F                    1         .word LINK 
                           000E08     2         LINK=.
      008E88 02                       3         .byte 2  
      008E89 23 3C                    4         .ascii "#<"
      008E8B                          5         BDIGS:
      008E8B CD 8D 6E         [ 4] 2545         CALL     PAD
      008E8E CD 87 CF         [ 4] 2546         CALL     HLD
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



      008E91 CC 85 51         [ 2] 2547         JP     STORE
                                   2548 
                                   2549 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2550 ;       HOLD    ( c -- )
                                   2551 ;       Insert a character 
                                   2552 ;       into output string.
                                   2553 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000E14                       2554         _HEADER HOLD,4,"HOLD"
      008E94 8E 88                    1         .word LINK 
                           000E16     2         LINK=.
      008E96 04                       3         .byte 4  
      008E97 48 4F 4C 44              4         .ascii "HOLD"
      008E9B                          5         HOLD:
      008E9B CD 87 CF         [ 4] 2555         CALL     HLD
      008E9E CD 85 63         [ 4] 2556         CALL     AT
      008EA1 CD 8C 24         [ 4] 2557         CALL     ONEM
      008EA4 CD 86 99         [ 4] 2558         CALL     DUPP
      008EA7 CD 87 CF         [ 4] 2559         CALL     HLD
      008EAA CD 85 51         [ 4] 2560         CALL     STORE
      008EAD CC 85 70         [ 2] 2561         JP     CSTOR
                                   2562 
                                   2563 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2564 ;       #       ( u -- u )
                                   2565 ;       Extract one digit from u and
                                   2566 ;       append digit to output string.
                                   2567 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000E30                       2568         _HEADER DIG,1,"#"
      008EB0 8E 96                    1         .word LINK 
                           000E32     2         LINK=.
      008EB2 01                       3         .byte 1  
      008EB3 23                       4         .ascii "#"
      008EB4                          5         DIG:
      008EB4 CD 87 5F         [ 4] 2569         CALL     BASE
      008EB7 CD 85 63         [ 4] 2570         CALL     AT
      008EBA CD 8E 77         [ 4] 2571         CALL     EXTRC
      008EBD CC 8E 9B         [ 2] 2572         JP     HOLD
                                   2573 
                                   2574 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2575 ;       #S      ( u -- 0 )
                                   2576 ;       Convert u until all digits
                                   2577 ;       are added to output string.
                                   2578 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000E40                       2579         _HEADER DIGS,2,"#S"
      008EC0 8E B2                    1         .word LINK 
                           000E42     2         LINK=.
      008EC2 02                       3         .byte 2  
      008EC3 23 53                    4         .ascii "#S"
      008EC5                          5         DIGS:
      008EC5 CD 8E B4         [ 4] 2580 DIGS1:  CALL     DIG
      008EC8 CD 86 99         [ 4] 2581         CALL     DUPP
      008ECB CD 85 18         [ 4] 2582         CALL     QBRAN
      008ECE 8E D2                 2583         .word      DIGS2
      008ED0 20 F3            [ 2] 2584         JRA     DIGS1
      008ED2 81               [ 4] 2585 DIGS2:  RET
                                   2586 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



                                   2587 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2588 ;       SIGN    ( n -- )
                                   2589 ;       Add a minus sign to
                                   2590 ;       numeric output string.
                                   2591 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000E53                       2592         _HEADER SIGN,4,"SIGN"
      008ED3 8E C2                    1         .word LINK 
                           000E55     2         LINK=.
      008ED5 04                       3         .byte 4  
      008ED6 53 49 47 4E              4         .ascii "SIGN"
      008EDA                          5         SIGN:
      008EDA CD 86 D0         [ 4] 2593         CALL     ZLESS
      008EDD CD 85 18         [ 4] 2594         CALL     QBRAN
      008EE0 8E EA                 2595         .word      SIGN1
      008EE2 CD 84 EF         [ 4] 2596         CALL     DOLIT
      008EE5 00 2D                 2597         .word      45	;"-"
      008EE7 CC 8E 9B         [ 2] 2598         JP     HOLD
      008EEA 81               [ 4] 2599 SIGN1:  RET
                                   2600 
                                   2601 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2602 ;       #>      ( w -- b u )
                                   2603 ;       Prepare output string.
                                   2604 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000E6B                       2605         _HEADER EDIGS,2,"#>"
      008EEB 8E D5                    1         .word LINK 
                           000E6D     2         LINK=.
      008EED 02                       3         .byte 2  
      008EEE 23 3E                    4         .ascii "#>"
      008EF0                          5         EDIGS:
      008EF0 CD 86 8F         [ 4] 2606         CALL     DROP
      008EF3 CD 87 CF         [ 4] 2607         CALL     HLD
      008EF6 CD 85 63         [ 4] 2608         CALL     AT
      008EF9 CD 8D 6E         [ 4] 2609         CALL     PAD
      008EFC CD 86 C1         [ 4] 2610         CALL     OVER
      008EFF CC 89 52         [ 2] 2611         JP     SUBB
                                   2612 
                                   2613 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2614 ;       str     ( w -- b u )
                                   2615 ;       Convert a signed integer
                                   2616 ;       to a numeric string.
                                   2617 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000E82                       2618         _HEADER STR,3,"STR"
      008F02 8E ED                    1         .word LINK 
                           000E84     2         LINK=.
      008F04 03                       3         .byte 3  
      008F05 53 54 52                 4         .ascii "STR"
      008F08                          5         STR:
      008F08 CD 86 99         [ 4] 2619         CALL     DUPP
      008F0B CD 86 62         [ 4] 2620         CALL     TOR
      008F0E CD 89 6C         [ 4] 2621         CALL     ABSS
      008F11 CD 8E 8B         [ 4] 2622         CALL     BDIGS
      008F14 CD 8E C5         [ 4] 2623         CALL     DIGS
      008F17 CD 85 B4         [ 4] 2624         CALL     RFROM
      008F1A CD 8E DA         [ 4] 2625         CALL     SIGN
      008F1D CC 8E F0         [ 2] 2626         JP     EDIGS
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



                                   2627 
                                   2628 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2629 ;       HEX     ( -- )
                                   2630 ;       Use radix 16 as base for
                                   2631 ;       numeric conversions.
                                   2632 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000EA0                       2633         _HEADER HEX,3,"HEX"
      008F20 8F 04                    1         .word LINK 
                           000EA2     2         LINK=.
      008F22 03                       3         .byte 3  
      008F23 48 45 58                 4         .ascii "HEX"
      008F26                          5         HEX:
      008F26 CD 84 EF         [ 4] 2634         CALL     DOLIT
      008F29 00 10                 2635         .word      16
      008F2B CD 87 5F         [ 4] 2636         CALL     BASE
      008F2E CC 85 51         [ 2] 2637         JP     STORE
                                   2638 
                                   2639 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2640 ;       DECIMAL ( -- )
                                   2641 ;       Use radix 10 as base
                                   2642 ;       for numeric conversions.
                                   2643 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000EB1                       2644         _HEADER DECIM,7,"DECIMAL"
      008F31 8F 22                    1         .word LINK 
                           000EB3     2         LINK=.
      008F33 07                       3         .byte 7  
      008F34 44 45 43 49 4D 41 4C     4         .ascii "DECIMAL"
      008F3B                          5         DECIM:
      008F3B CD 84 EF         [ 4] 2645         CALL     DOLIT
      008F3E 00 0A                 2646         .word      10
      008F40 CD 87 5F         [ 4] 2647         CALL     BASE
      008F43 CC 85 51         [ 2] 2648         JP     STORE
                                   2649 
                                   2650 ;; Numeric input, single precision
                                   2651 
                                   2652 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2653 ;       DIGIT?  ( c base -- u t )
                                   2654 ;       Convert a character to its numeric
                                   2655 ;       value. A flag indicates success.
                                   2656 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000EC6                       2657         _HEADER DIGTQ,6,"DIGIT?"
      008F46 8F 33                    1         .word LINK 
                           000EC8     2         LINK=.
      008F48 06                       3         .byte 6  
      008F49 44 49 47 49 54 3F        4         .ascii "DIGIT?"
      008F4F                          5         DIGTQ:
      008F4F CD 86 62         [ 4] 2658         CALL     TOR
      008F52 CD 84 EF         [ 4] 2659         CALL     DOLIT
      008F55 00 30                 2660         .word     48	; "0"
      008F57 CD 89 52         [ 4] 2661         CALL     SUBB
      008F5A CD 84 EF         [ 4] 2662         CALL     DOLIT
      008F5D 00 09                 2663         .word      9
      008F5F CD 86 C1         [ 4] 2664         CALL     OVER
      008F62 CD 89 A6         [ 4] 2665         CALL     LESS
      008F65 CD 85 18         [ 4] 2666         CALL     QBRAN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      008F68 8F 80                 2667         .word      DGTQ1
      008F6A CD 84 EF         [ 4] 2668         CALL     DOLIT
      008F6D 00 07                 2669         .word      7
      008F6F CD 89 52         [ 4] 2670         CALL     SUBB
      008F72 CD 86 99         [ 4] 2671         CALL     DUPP
      008F75 CD 84 EF         [ 4] 2672         CALL     DOLIT
      008F78 00 0A                 2673         .word      10
      008F7A CD 89 A6         [ 4] 2674         CALL     LESS
      008F7D CD 87 0A         [ 4] 2675         CALL     ORR
      008F80 CD 86 99         [ 4] 2676 DGTQ1:  CALL     DUPP
      008F83 CD 85 B4         [ 4] 2677         CALL     RFROM
      008F86 CC 89 90         [ 2] 2678         JP     ULESS
                                   2679 
                           000001  2680 .if  WANT_DOUBLE
                           000000  2681 .else 
                                   2682 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2683 ;       NUMBER? ( a -- n T | a F )
                                   2684 ;       Convert a number string to
                                   2685 ;       integer. Push a flag on tos.
                                   2686 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2687         _HEADER NUMBQ,7,"NUMBER?"
                                   2688         CALL     BASE
                                   2689         CALL     AT
                                   2690         CALL     TOR
                                   2691         CALL     ZERO
                                   2692         CALL     OVER
                                   2693         CALL     COUNT
                                   2694         CALL     OVER
                                   2695         CALL     CAT
                                   2696         CALL     DOLIT
                                   2697         .word     36	; "0x"
                                   2698         CALL     EQUAL
                                   2699         CALL     QBRAN
                                   2700         .word      NUMQ1
                                   2701         CALL     HEX
                                   2702         CALL     SWAPP
                                   2703         CALL     ONEP
                                   2704         CALL     SWAPP
                                   2705         CALL     ONEM
                                   2706 NUMQ1:  CALL     OVER
                                   2707         CALL     CAT
                                   2708         CALL     DOLIT
                                   2709         .word     45	; "-"
                                   2710         CALL     EQUAL
                                   2711         CALL     TOR
                                   2712         CALL     SWAPP
                                   2713         CALL     RAT
                                   2714         CALL     SUBB
                                   2715         CALL     SWAPP
                                   2716         CALL     RAT
                                   2717         CALL     PLUS
                                   2718         CALL     QDUP
                                   2719         CALL     QBRAN
                                   2720         .word      NUMQ6
                                   2721         CALL     ONEM
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



                                   2722         CALL     TOR
                                   2723 NUMQ2:  CALL     DUPP
                                   2724         CALL     TOR
                                   2725         CALL     CAT
                                   2726         CALL     BASE
                                   2727         CALL     AT
                                   2728         CALL     DIGTQ
                                   2729         CALL     QBRAN
                                   2730         .word      NUMQ4
                                   2731         CALL     SWAPP
                                   2732         CALL     BASE
                                   2733         CALL     AT
                                   2734         CALL     STAR
                                   2735         CALL     PLUS
                                   2736         CALL     RFROM
                                   2737         CALL     ONEP
                                   2738         CALL     DONXT
                                   2739         .word      NUMQ2
                                   2740         CALL     RAT
                                   2741         CALL     SWAPP
                                   2742         CALL     DROP
                                   2743         CALL     QBRAN
                                   2744         .word      NUMQ3
                                   2745         CALL     NEGAT
                                   2746 NUMQ3:  CALL     SWAPP
                                   2747         JRA     NUMQ5
                                   2748 NUMQ4:  CALL     RFROM
                                   2749         CALL     RFROM
                                   2750         CALL     DDROP
                                   2751         CALL     DDROP
                                   2752         CALL     ZERO
                                   2753 NUMQ5:  CALL     DUPP
                                   2754 NUMQ6:  CALL     RFROM
                                   2755         CALL     DDROP
                                   2756         CALL     RFROM
                                   2757         CALL     BASE
                                   2758         JP     STORE
                                   2759 .endif ; WANT_DOUBLE  
                                   2760 
                                   2761 ;; Basic I/O
                                   2762 
                                   2763 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2764 ;       KEY     ( -- c )
                                   2765 ;       Wait for and return an
                                   2766 ;       input character.
                                   2767 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000F09                       2768         _HEADER KEY,3,"KEY"
      008F89 8F 48                    1         .word LINK 
                           000F0B     2         LINK=.
      008F8B 03                       3         .byte 3  
      008F8C 4B 45 59                 4         .ascii "KEY"
      008F8F                          5         KEY:
      008F8F 72 0B 52 30 FB   [ 2] 2769         btjf UART_SR,#UART_SR_RXNE,. 
      008F94 C6 52 31         [ 1] 2770         ld a,UART_DR 
      008F97 1D 00 02         [ 2] 2771         subw x,#CELLL 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      008F9A E7 01            [ 1] 2772         ld (1,x),a 
      008F9C 7F               [ 1] 2773         clr (x)
      008F9D 81               [ 4] 2774         ret 
                                   2775 
                                   2776 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2777 ;       NUF?    ( -- t )
                                   2778 ;       Return false if no input,
                                   2779 ;       else pause and if CR return true.
                                   2780 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000F1E                       2781         _HEADER NUFQ,4,"NUF?"
      008F9E 8F 8B                    1         .word LINK 
                           000F20     2         LINK=.
      008FA0 04                       3         .byte 4  
      008FA1 4E 55 46 3F              4         .ascii "NUF?"
      008FA5                          5         NUFQ:
      008FA5 CD 84 98         [ 4] 2782         CALL     QKEY
      008FA8 CD 86 99         [ 4] 2783         CALL     DUPP
      008FAB CD 85 18         [ 4] 2784         CALL     QBRAN
      008FAE 8F BE                 2785         .word    NUFQ1
      008FB0 CD 88 9C         [ 4] 2786         CALL     DDROP
      008FB3 CD 8F 8F         [ 4] 2787         CALL     KEY
      008FB6 CD 84 EF         [ 4] 2788         CALL     DOLIT
      008FB9 00 0D                 2789         .word      CRR
      008FBB CC 89 7A         [ 2] 2790         JP     EQUAL
      008FBE 81               [ 4] 2791 NUFQ1:  RET
                                   2792 
                                   2793 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2794 ;       SPACE   ( -- )
                                   2795 ;       Send  blank character to
                                   2796 ;       output device.
                                   2797 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000F3F                       2798         _HEADER SPACE,5,"SPACE"
      008FBF 8F A0                    1         .word LINK 
                           000F41     2         LINK=.
      008FC1 05                       3         .byte 5  
      008FC2 53 50 41 43 45           4         .ascii "SPACE"
      008FC7                          5         SPACE:
      008FC7 CD 8C 76         [ 4] 2799         CALL     BLANK
      008FCA CC 84 B6         [ 2] 2800         JP     EMIT
                                   2801 
                                   2802 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2803 ;       SPACES  ( +n -- )
                                   2804 ;       Send n spaces to output device.
                                   2805 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000F4D                       2806         _HEADER SPACS,6,"SPACES"
      008FCD 8F C1                    1         .word LINK 
                           000F4F     2         LINK=.
      008FCF 06                       3         .byte 6  
      008FD0 53 50 41 43 45 53        4         .ascii "SPACES"
      008FD6                          5         SPACS:
      008FD6 CD 8C 83         [ 4] 2807         CALL     ZERO
      008FD9 CD 89 EB         [ 4] 2808         CALL     MAX
      008FDC CD 86 62         [ 4] 2809         CALL     TOR
      008FDF 20 03            [ 2] 2810         JRA      CHAR2
      008FE1 CD 8F C7         [ 4] 2811 CHAR1:  CALL     SPACE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      008FE4 CD 85 03         [ 4] 2812 CHAR2:  CALL     DONXT
      008FE7 8F E1                 2813         .word    CHAR1
      008FE9 81               [ 4] 2814         RET
                                   2815 
                                   2816 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2817 ;       TYPE    ( b u -- )
                                   2818 ;       Output u characters from b.
                                   2819 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000F6A                       2820         _HEADER TYPES,4,"TYPE"
      008FEA 8F CF                    1         .word LINK 
                           000F6C     2         LINK=.
      008FEC 04                       3         .byte 4  
      008FED 54 59 50 45              4         .ascii "TYPE"
      008FF1                          5         TYPES:
      008FF1 CD 86 62         [ 4] 2821         CALL     TOR
      008FF4 20 06            [ 2] 2822         JRA     TYPE2
      008FF6 CD 8D 46         [ 4] 2823 TYPE1:  CALL     COUNT 
      008FF9 CD 84 B6         [ 4] 2824         CALL     EMIT
      000F7C                       2825 TYPE2:  _DONXT  TYPE1
      008FFC CD 85 03         [ 4]    1     CALL DONXT 
      008FFF 8F F6                    2     .word TYPE1 
      009001 CC 86 8F         [ 2] 2826         JP     DROP
                                   2827 
                                   2828 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2829 ;       CR      ( -- )
                                   2830 ;       Output a carriage return
                                   2831 ;       and a line feed.
                                   2832 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000F84                       2833         _HEADER CR,2,"CR"
      009004 8F EC                    1         .word LINK 
                           000F86     2         LINK=.
      009006 02                       3         .byte 2  
      009007 43 52                    4         .ascii "CR"
      009009                          5         CR:
      000F89                       2834         _DOLIT  CRR 
      009009 CD 84 EF         [ 4]    1     CALL DOLIT 
      00900C 00 0D                    2     .word CRR 
      00900E CD 84 B6         [ 4] 2835         CALL    EMIT
      000F91                       2836         _DOLIT  LF
      009011 CD 84 EF         [ 4]    1     CALL DOLIT 
      009014 00 0A                    2     .word LF 
      009016 CC 84 B6         [ 2] 2837         JP      EMIT
                                   2838 
                                   2839 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2840 ;       do$     ( -- a )
                                   2841 ;       Return  address of a compiled
                                   2842 ;       string.
                                   2843 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2844 ;       _HEADER DOSTR,COMPO+3,"DO$"
      009019                       2845 DOSTR:
      009019 CD 85 B4         [ 4] 2846         CALL     RFROM
      00901C CD 85 C5         [ 4] 2847         CALL     RAT
      00901F CD 85 B4         [ 4] 2848         CALL     RFROM
      009022 CD 8D 46         [ 4] 2849         CALL     COUNT
      009025 CD 88 BC         [ 4] 2850         CALL     PLUS
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      009028 CD 86 62         [ 4] 2851         CALL     TOR
      00902B CD 86 A9         [ 4] 2852         CALL     SWAPP
      00902E CD 86 62         [ 4] 2853         CALL     TOR
      009031 81               [ 4] 2854         RET
                                   2855 
                                   2856 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2857 ;       $"|     ( -- a )
                                   2858 ;       Run time routine compiled by $".
                                   2859 ;       Return address of a compiled string.
                                   2860 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2861 ;       _HEADER STRQP,COMPO+3,"$\"|"
      009032                       2862 STRQP:
      009032 CD 90 19         [ 4] 2863         CALL     DOSTR
      009035 81               [ 4] 2864         RET
                                   2865 
                                   2866 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2867 ;       ."|     ( -- )
                                   2868 ;       Run time routine of ." .
                                   2869 ;       Output a compiled string.
                                   2870 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2871 ;       _HEADER DOTQP,COMPO+3,".\"|"
      009036                       2872 DOTQP:
      009036 CD 90 19         [ 4] 2873         CALL     DOSTR
      009039 CD 8D 46         [ 4] 2874         CALL     COUNT
      00903C CC 8F F1         [ 2] 2875         JP     TYPES
                                   2876 
                                   2877 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2878 ;       .R      ( n +n -- )
                                   2879 ;       Display an integer in a field
                                   2880 ;       of n columns, right justified.
                                   2881 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000FBF                       2882         _HEADER DOTR,2,".R"
      00903F 90 06                    1         .word LINK 
                           000FC1     2         LINK=.
      009041 02                       3         .byte 2  
      009042 2E 52                    4         .ascii ".R"
      009044                          5         DOTR:
      009044 CD 86 62         [ 4] 2883         CALL     TOR
      009047 CD 8F 08         [ 4] 2884         CALL     STR
      00904A CD 85 B4         [ 4] 2885         CALL     RFROM
      00904D CD 86 C1         [ 4] 2886         CALL     OVER
      009050 CD 89 52         [ 4] 2887         CALL     SUBB
      009053 CD 8F D6         [ 4] 2888         CALL     SPACS
      009056 CC 8F F1         [ 2] 2889         JP     TYPES
                                   2890 
                                   2891 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2892 ;       U.R     ( u +n -- )
                                   2893 ;       Display an unsigned integer
                                   2894 ;       in n column, right justified.
                                   2895 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000FD9                       2896         _HEADER UDOTR,3,"U.R"
      009059 90 41                    1         .word LINK 
                           000FDB     2         LINK=.
      00905B 03                       3         .byte 3  
      00905C 55 2E 52                 4         .ascii "U.R"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



      00905F                          5         UDOTR:
      00905F CD 86 62         [ 4] 2897         CALL     TOR
      009062 CD 8E 8B         [ 4] 2898         CALL     BDIGS
      009065 CD 8E C5         [ 4] 2899         CALL     DIGS
      009068 CD 8E F0         [ 4] 2900         CALL     EDIGS
      00906B CD 85 B4         [ 4] 2901         CALL     RFROM
      00906E CD 86 C1         [ 4] 2902         CALL     OVER
      009071 CD 89 52         [ 4] 2903         CALL     SUBB
      009074 CD 8F D6         [ 4] 2904         CALL     SPACS
      009077 CC 8F F1         [ 2] 2905         JP     TYPES
                                   2906 
                                   2907 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2908 ;       U.      ( u -- )
                                   2909 ;       Display an unsigned integer
                                   2910 ;       in free format.
                                   2911 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000FFA                       2912         _HEADER UDOT,2,"U."
      00907A 90 5B                    1         .word LINK 
                           000FFC     2         LINK=.
      00907C 02                       3         .byte 2  
      00907D 55 2E                    4         .ascii "U."
      00907F                          5         UDOT:
      00907F CD 8E 8B         [ 4] 2913         CALL     BDIGS
      009082 CD 8E C5         [ 4] 2914         CALL     DIGS
      009085 CD 8E F0         [ 4] 2915         CALL     EDIGS
      009088 CD 8F C7         [ 4] 2916         CALL     SPACE
      00908B CC 8F F1         [ 2] 2917         JP     TYPES
                                   2918 
                                   2919 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2920 ;   H. ( n -- )
                                   2921 ;   display n in hexadecimal 
                                   2922 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00100E                       2923         _HEADER HDOT,2,"H."
      00908E 90 7C                    1         .word LINK 
                           001010     2         LINK=.
      009090 02                       3         .byte 2  
      009091 48 2E                    4         .ascii "H."
      009093                          5         HDOT:
      009093 CD 87 5F         [ 4] 2924         CALL BASE 
      009096 CD 85 63         [ 4] 2925         CALL AT 
      009099 CD 86 62         [ 4] 2926         CALL TOR 
      00909C CD 8F 26         [ 4] 2927         CALL HEX 
      00909F CD 90 7F         [ 4] 2928         CALL UDOT 
      0090A2 CD 85 B4         [ 4] 2929         CALL RFROM 
      0090A5 CD 87 5F         [ 4] 2930         CALL BASE 
      0090A8 CD 85 51         [ 4] 2931         CALL STORE 
      0090AB 81               [ 4] 2932         RET 
                                   2933 
                                   2934 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2935 ;       .       ( w -- )
                                   2936 ;       Display an integer in free
                                   2937 ;       format, preceeded by a space.
                                   2938 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00102C                       2939         _HEADER DOT,1,"."
      0090AC 90 90                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



                           00102E     2         LINK=.
      0090AE 01                       3         .byte 1  
      0090AF 2E                       4         .ascii "."
      0090B0                          5         DOT:
      0090B0 CD 87 5F         [ 4] 2940         CALL     BASE
      0090B3 CD 85 63         [ 4] 2941         CALL     AT
      0090B6 CD 84 EF         [ 4] 2942         CALL     DOLIT
      0090B9 00 0A                 2943         .word      10
      0090BB CD 87 1F         [ 4] 2944         CALL     XORR    ;?decimal
      0090BE CD 85 18         [ 4] 2945         CALL     QBRAN
      0090C1 90 C6                 2946         .word      DOT1
      0090C3 CC 90 7F         [ 2] 2947         JP     UDOT
      0090C6 CD 8F 08         [ 4] 2948 DOT1:   CALL     STR
      0090C9 CD 8F C7         [ 4] 2949         CALL     SPACE
      0090CC CC 8F F1         [ 2] 2950         JP     TYPES
                                   2951 
                                   2952 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2953 ;       ?       ( a -- )
                                   2954 ;       Display contents in memory cell.
                                   2955 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00104F                       2956         _HEADER QUEST,1,"?"
      0090CF 90 AE                    1         .word LINK 
                           001051     2         LINK=.
      0090D1 01                       3         .byte 1  
      0090D2 3F                       4         .ascii "?"
      0090D3                          5         QUEST:
      0090D3 CD 85 63         [ 4] 2957         CALL     AT
      0090D6 CC 90 B0         [ 2] 2958         JP     DOT
                                   2959 
                                   2960 ;; Parsing
                                   2961 
                                   2962 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2963 ;       parse   ( b u c -- b u delta ; <string> )
                                   2964 ;       Scan string delimited by c.
                                   2965 ;       Return found string and its offset.
                                   2966 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001059                       2967         _HEADER PARS,5,"PARS$"
      0090D9 90 D1                    1         .word LINK 
                           00105B     2         LINK=.
      0090DB 05                       3         .byte 5  
      0090DC 50 41 52 53 24           4         .ascii "PARS$"
      0090E1                          5         PARS:
      0090E1 CD 87 6E         [ 4] 2968         CALL     TEMP
      0090E4 CD 85 51         [ 4] 2969         CALL     STORE
      0090E7 CD 86 C1         [ 4] 2970         CALL     OVER
      0090EA CD 86 62         [ 4] 2971         CALL     TOR
      0090ED CD 86 99         [ 4] 2972         CALL     DUPP
      0090F0 CD 85 18         [ 4] 2973         CALL     QBRAN
      0090F3 91 99                 2974         .word    PARS8
      0090F5 CD 8C 24         [ 4] 2975         CALL     ONEM
      0090F8 CD 87 6E         [ 4] 2976         CALL     TEMP
      0090FB CD 85 63         [ 4] 2977         CALL     AT
      0090FE CD 8C 76         [ 4] 2978         CALL     BLANK
      009101 CD 89 7A         [ 4] 2979         CALL     EQUAL
      009104 CD 85 18         [ 4] 2980         CALL     QBRAN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      009107 91 3A                 2981         .word      PARS3
      009109 CD 86 62         [ 4] 2982         CALL     TOR
      00910C CD 8C 76         [ 4] 2983 PARS1:  CALL     BLANK
      00910F CD 86 C1         [ 4] 2984         CALL     OVER
      009112 CD 85 81         [ 4] 2985         CALL     CAT     ;skip leading blanks ONLY
      009115 CD 89 52         [ 4] 2986         CALL     SUBB
      009118 CD 86 D0         [ 4] 2987         CALL     ZLESS
      00911B CD 88 F5         [ 4] 2988         CALL     INVER
      00911E CD 85 18         [ 4] 2989         CALL     QBRAN
      009121 91 37                 2990         .word      PARS2
      009123 CD 8C 17         [ 4] 2991         CALL     ONEP
      009126 CD 85 03         [ 4] 2992         CALL     DONXT
      009129 91 0C                 2993         .word      PARS1
      00912B CD 85 B4         [ 4] 2994         CALL     RFROM
      00912E CD 86 8F         [ 4] 2995         CALL     DROP
      009131 CD 8C 83         [ 4] 2996         CALL     ZERO
      009134 CC 86 99         [ 2] 2997         JP     DUPP
      009137 CD 85 B4         [ 4] 2998 PARS2:  CALL     RFROM
      00913A CD 86 C1         [ 4] 2999 PARS3:  CALL     OVER
      00913D CD 86 A9         [ 4] 3000         CALL     SWAPP
      009140 CD 86 62         [ 4] 3001         CALL     TOR
      009143 CD 87 6E         [ 4] 3002 PARS4:  CALL     TEMP
      009146 CD 85 63         [ 4] 3003         CALL     AT
      009149 CD 86 C1         [ 4] 3004         CALL     OVER
      00914C CD 85 81         [ 4] 3005         CALL     CAT
      00914F CD 89 52         [ 4] 3006         CALL     SUBB    ;scan for delimiter
      009152 CD 87 6E         [ 4] 3007         CALL     TEMP
      009155 CD 85 63         [ 4] 3008         CALL     AT
      009158 CD 8C 76         [ 4] 3009         CALL     BLANK
      00915B CD 89 7A         [ 4] 3010         CALL     EQUAL
      00915E CD 85 18         [ 4] 3011         CALL     QBRAN
      009161 91 66                 3012         .word      PARS5
      009163 CD 86 D0         [ 4] 3013         CALL     ZLESS
      009166 CD 85 18         [ 4] 3014 PARS5:  CALL     QBRAN
      009169 91 7B                 3015         .word      PARS6
      00916B CD 8C 17         [ 4] 3016         CALL     ONEP
      00916E CD 85 03         [ 4] 3017         CALL     DONXT
      009171 91 43                 3018         .word      PARS4
      009173 CD 86 99         [ 4] 3019         CALL     DUPP
      009176 CD 86 62         [ 4] 3020         CALL     TOR
      009179 20 0F            [ 2] 3021         JRA     PARS7
      00917B CD 85 B4         [ 4] 3022 PARS6:  CALL     RFROM
      00917E CD 86 8F         [ 4] 3023         CALL     DROP
      009181 CD 86 99         [ 4] 3024         CALL     DUPP
      009184 CD 8C 17         [ 4] 3025         CALL     ONEP
      009187 CD 86 62         [ 4] 3026         CALL     TOR
      00918A CD 86 C1         [ 4] 3027 PARS7:  CALL     OVER
      00918D CD 89 52         [ 4] 3028         CALL     SUBB
      009190 CD 85 B4         [ 4] 3029         CALL     RFROM
      009193 CD 85 B4         [ 4] 3030         CALL     RFROM
      009196 CC 89 52         [ 2] 3031         JP     SUBB
      009199 CD 86 C1         [ 4] 3032 PARS8:  CALL     OVER
      00919C CD 85 B4         [ 4] 3033         CALL     RFROM
      00919F CC 89 52         [ 2] 3034         JP     SUBB
                                   3035 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



                                   3036 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3037 ;       PARSE   ( c -- b u ; <string> )
                                   3038 ;       Scan input stream and return
                                   3039 ;       counted string delimited by c.
                                   3040 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001122                       3041         _HEADER PARSE,5,"PARSE"
      0091A2 90 DB                    1         .word LINK 
                           001124     2         LINK=.
      0091A4 05                       3         .byte 5  
      0091A5 50 41 52 53 45           4         .ascii "PARSE"
      0091AA                          5         PARSE:
      0091AA CD 86 62         [ 4] 3042         CALL     TOR
      0091AD CD 8D 7F         [ 4] 3043         CALL     TIB
      0091B0 CD 87 7D         [ 4] 3044         CALL     INN
      0091B3 CD 85 63         [ 4] 3045         CALL     AT
      0091B6 CD 88 BC         [ 4] 3046         CALL     PLUS    ;current input buffer pointer
      0091B9 CD 87 8D         [ 4] 3047         CALL     NTIB
      0091BC CD 85 63         [ 4] 3048         CALL     AT
      0091BF CD 87 7D         [ 4] 3049         CALL     INN
      0091C2 CD 85 63         [ 4] 3050         CALL     AT
      0091C5 CD 89 52         [ 4] 3051         CALL     SUBB    ;remaining count
      0091C8 CD 85 B4         [ 4] 3052         CALL     RFROM
      0091CB CD 90 E1         [ 4] 3053         CALL     PARS
      0091CE CD 87 7D         [ 4] 3054         CALL     INN
      0091D1 CC 8C F3         [ 2] 3055         JP     PSTOR
                                   3056 
                                   3057 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3058 ;       .(      ( -- )
                                   3059 ;       Output following string up to next ) .
                                   3060 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001154                       3061         _HEADER DOTPR,IMEDD+2,".("
      0091D4 91 A4                    1         .word LINK 
                           001156     2         LINK=.
      0091D6 82                       3         .byte IMEDD+2  
      0091D7 2E 28                    4         .ascii ".("
      0091D9                          5         DOTPR:
      0091D9 CD 84 EF         [ 4] 3062         CALL     DOLIT
      0091DC 00 29                 3063         .word     41	; ")"
      0091DE CD 91 AA         [ 4] 3064         CALL     PARSE
      0091E1 CC 8F F1         [ 2] 3065         JP     TYPES
                                   3066 
                                   3067 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3068 ;       (       ( -- )
                                   3069 ;       Ignore following string up to next ).
                                   3070 ;       A comment.
                                   3071 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001164                       3072         _HEADER PAREN,IMEDD+1,"("
      0091E4 91 D6                    1         .word LINK 
                           001166     2         LINK=.
      0091E6 81                       3         .byte IMEDD+1  
      0091E7 28                       4         .ascii "("
      0091E8                          5         PAREN:
      0091E8 CD 84 EF         [ 4] 3073         CALL     DOLIT
      0091EB 00 29                 3074         .word     41	; ")"
      0091ED CD 91 AA         [ 4] 3075         CALL     PARSE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



      0091F0 CC 88 9C         [ 2] 3076         JP     DDROP
                                   3077 
                                   3078 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3079 ;       \       ( -- )
                                   3080 ;       Ignore following text till
                                   3081 ;       end of line.
                                   3082 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001173                       3083         _HEADER BKSLA,IMEDD+1,"\\"
      0091F3 91 E6                    1         .word LINK 
                           001175     2         LINK=.
      0091F5 81                       3         .byte IMEDD+1  
      0091F6 5C 5C                    4         .ascii "\\"
      0091F8                          5         BKSLA:
      0091F8 90 AE 00 0E      [ 2] 3084         ldw y,#UCTIB ; #TIB  
      0091FC 90 FE            [ 2] 3085         ldw y,(y)
      0091FE 90 89            [ 2] 3086         pushw y ; count in TIB 
      009200 90 AE 00 0C      [ 2] 3087         ldw y,#UINN ; >IN 
      009204 90 BF 26         [ 2] 3088         ldw YTEMP,y
      009207 90 85            [ 2] 3089         popw y 
      009209 91 CF 26         [ 5] 3090         ldw [YTEMP],y
      00920C 81               [ 4] 3091         ret 
                                   3092 
                                   3093 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3094 ;       WORD    ( c -- a ; <string> )
                                   3095 ;       Parse a word from input stream
                                   3096 ;       and copy it to code dictionary.
                                   3097 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00118D                       3098         _HEADER WORDD,4,"WORD"
      00920D 91 F5                    1         .word LINK 
                           00118F     2         LINK=.
      00920F 04                       3         .byte 4  
      009210 57 4F 52 44              4         .ascii "WORD"
      009214                          5         WORDD:
      009214 CD 91 AA         [ 4] 3099         CALL     PARSE
      009217 CD 8D 5D         [ 4] 3100         CALL     HERE
      00921A CD 8B EC         [ 4] 3101         CALL     CELLP
                           000000  3102 .IF CASE_SENSE 
                                   3103         JP      PACKS 
                           000001  3104 .ELSE                 
      00921D CD 8E 2E         [ 4] 3105         CALL     PACKS
                                   3106 ; uppercase TOKEN 
      009220 CD 86 99         [ 4] 3107         CALL    DUPP 
      009223 CD 8D 46         [ 4] 3108         CALL    COUNT 
      009226 CD 86 62         [ 4] 3109         CALL    TOR 
      009229 CD 85 34         [ 4] 3110         CALL    BRAN 
      00922C 92 5A                 3111         .word   UPPER2  
      00922E                       3112 UPPER:
      00922E CD 86 99         [ 4] 3113         CALL    DUPP 
      009231 CD 85 81         [ 4] 3114         CALL    CAT
      009234 CD 86 99         [ 4] 3115         CALL    DUPP 
      009237 CD 84 EF         [ 4] 3116         CALL   DOLIT
      00923A 00 61                 3117         .word   'a' 
      00923C CD 84 EF         [ 4] 3118         CALL    DOLIT
      00923F 00 7B                 3119         .word   'z'+1 
      009241 CD 8A 16         [ 4] 3120         CALL   WITHI 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



      009244 CD 85 18         [ 4] 3121         CALL   QBRAN
      009247 92 51                 3122         .word  UPPER1  
      009249 CD 84 EF         [ 4] 3123         CALL    DOLIT 
      00924C 00 DF                 3124         .word   0xDF 
      00924E CD 86 F6         [ 4] 3125         CALL    ANDD 
      009251                       3126 UPPER1:
      009251 CD 86 C1         [ 4] 3127         CALL    OVER 
      009254 CD 85 70         [ 4] 3128         CALL    CSTOR          
      009257 CD 8C 17         [ 4] 3129         CALL    ONEP 
      00925A                       3130 UPPER2: 
      00925A CD 85 03         [ 4] 3131         CALL    DONXT
      00925D 92 2E                 3132         .word   UPPER  
      00925F CD 86 8F         [ 4] 3133         CALL    DROP  
      009262 81               [ 4] 3134         RET 
                                   3135 .ENDIF 
                                   3136 
                                   3137 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3138 ;       TOKEN   ( -- a ; <string> )
                                   3139 ;       Parse a word from input stream
                                   3140 ;       and copy it to name dictionary.
                                   3141 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0011E3                       3142         _HEADER TOKEN,5,"TOKEN"
      009263 92 0F                    1         .word LINK 
                           0011E5     2         LINK=.
      009265 05                       3         .byte 5  
      009266 54 4F 4B 45 4E           4         .ascii "TOKEN"
      00926B                          5         TOKEN:
      00926B CD 8C 76         [ 4] 3143         CALL     BLANK
      00926E CC 92 14         [ 2] 3144         JP     WORDD
                                   3145 
                                   3146 ;; Dictionary search
                                   3147 
                                   3148 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3149 ;       NAME>   ( na -- ca )
                                   3150 ;       Return a code address given
                                   3151 ;       a name address.
                                   3152 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0011F1                       3153         _HEADER NAMET,5,"NAME>"
      009271 92 65                    1         .word LINK 
                           0011F3     2         LINK=.
      009273 05                       3         .byte 5  
      009274 4E 41 4D 45 3E           4         .ascii "NAME>"
      009279                          5         NAMET:
      009279 CD 8D 46         [ 4] 3154         CALL     COUNT
      00927C CD 84 EF         [ 4] 3155         CALL     DOLIT
      00927F 00 1F                 3156         .word      31
      009281 CD 86 F6         [ 4] 3157         CALL     ANDD
      009284 CC 88 BC         [ 2] 3158         JP     PLUS
                                   3159 
                                   3160 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3161 ;       SAME?   ( a a u -- a a f \ -0+ )
                                   3162 ;       Compare u cells in two
                                   3163 ;       strings. Return 0 if identical.
                                   3164 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001207                       3165         _HEADER SAMEQ,5,"SAME?"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      009287 92 73                    1         .word LINK 
                           001209     2         LINK=.
      009289 05                       3         .byte 5  
      00928A 53 41 4D 45 3F           4         .ascii "SAME?"
      00928F                          5         SAMEQ:
      00928F CD 8C 24         [ 4] 3166         CALL     ONEM
      009292 CD 86 62         [ 4] 3167         CALL     TOR
      009295 20 29            [ 2] 3168         JRA     SAME2
      009297 CD 86 C1         [ 4] 3169 SAME1:  CALL     OVER
      00929A CD 85 C5         [ 4] 3170         CALL     RAT
      00929D CD 88 BC         [ 4] 3171         CALL     PLUS
      0092A0 CD 85 81         [ 4] 3172         CALL     CAT
      0092A3 CD 86 C1         [ 4] 3173         CALL     OVER
      0092A6 CD 85 C5         [ 4] 3174         CALL     RAT
      0092A9 CD 88 BC         [ 4] 3175         CALL     PLUS
      0092AC CD 85 81         [ 4] 3176         CALL     CAT
      0092AF CD 89 52         [ 4] 3177         CALL     SUBB
      0092B2 CD 88 4C         [ 4] 3178         CALL     QDUP
      0092B5 CD 85 18         [ 4] 3179         CALL     QBRAN
      0092B8 92 C0                 3180         .word      SAME2
      0092BA CD 85 B4         [ 4] 3181         CALL     RFROM
      0092BD CC 86 8F         [ 2] 3182         JP     DROP
      0092C0 CD 85 03         [ 4] 3183 SAME2:  CALL     DONXT
      0092C3 92 97                 3184         .word      SAME1
      0092C5 CC 8C 83         [ 2] 3185         JP     ZERO
                                   3186 
                                   3187 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3188 ;       find    ( a va -- ca na | a F )
                                   3189 ;       Search vocabulary for string.
                                   3190 ;       Return ca and na if succeeded.
                                   3191 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001248                       3192         _HEADER FIND,4,"FIND"
      0092C8 92 89                    1         .word LINK 
                           00124A     2         LINK=.
      0092CA 04                       3         .byte 4  
      0092CB 46 49 4E 44              4         .ascii "FIND"
      0092CF                          5         FIND:
      0092CF CD 86 A9         [ 4] 3193         CALL     SWAPP
      0092D2 CD 86 99         [ 4] 3194         CALL     DUPP
      0092D5 CD 85 81         [ 4] 3195         CALL     CAT
      0092D8 CD 87 6E         [ 4] 3196         CALL     TEMP
      0092DB CD 85 51         [ 4] 3197         CALL     STORE
      0092DE CD 86 99         [ 4] 3198         CALL     DUPP
      0092E1 CD 85 63         [ 4] 3199         CALL     AT
      0092E4 CD 86 62         [ 4] 3200         CALL     TOR
      0092E7 CD 8B EC         [ 4] 3201         CALL     CELLP
      0092EA CD 86 A9         [ 4] 3202         CALL     SWAPP
      0092ED CD 85 63         [ 4] 3203 FIND1:  CALL     AT
      0092F0 CD 86 99         [ 4] 3204         CALL     DUPP
      0092F3 CD 85 18         [ 4] 3205         CALL     QBRAN
      0092F6 93 2C                 3206         .word      FIND6
      0092F8 CD 86 99         [ 4] 3207         CALL     DUPP
      0092FB CD 85 63         [ 4] 3208         CALL     AT
      0092FE CD 84 EF         [ 4] 3209         CALL     DOLIT
      009301 1F 7F                 3210         .word      MASKK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      009303 CD 86 F6         [ 4] 3211         CALL     ANDD
      009306 CD 85 C5         [ 4] 3212         CALL     RAT
      009309 CD 87 1F         [ 4] 3213         CALL     XORR
      00930C CD 85 18         [ 4] 3214         CALL     QBRAN
      00930F 93 1B                 3215         .word      FIND2
      009311 CD 8B EC         [ 4] 3216         CALL     CELLP
      009314 CD 84 EF         [ 4] 3217         CALL     DOLIT
      009317 FF FF                 3218         .word     0xFFFF
      009319 20 0C            [ 2] 3219         JRA     FIND3
      00931B CD 8B EC         [ 4] 3220 FIND2:  CALL     CELLP
      00931E CD 87 6E         [ 4] 3221         CALL     TEMP
      009321 CD 85 63         [ 4] 3222         CALL     AT
      009324 CD 92 8F         [ 4] 3223         CALL     SAMEQ
      009327 CD 85 34         [ 4] 3224 FIND3:  CALL     BRAN
      00932A 93 3B                 3225         .word      FIND4
      00932C CD 85 B4         [ 4] 3226 FIND6:  CALL     RFROM
      00932F CD 86 8F         [ 4] 3227         CALL     DROP
      009332 CD 86 A9         [ 4] 3228         CALL     SWAPP
      009335 CD 8B FB         [ 4] 3229         CALL     CELLM
      009338 CC 86 A9         [ 2] 3230         JP     SWAPP
      00933B CD 85 18         [ 4] 3231 FIND4:  CALL     QBRAN
      00933E 93 48                 3232         .word      FIND5
      009340 CD 8B FB         [ 4] 3233         CALL     CELLM
      009343 CD 8B FB         [ 4] 3234         CALL     CELLM
      009346 20 A5            [ 2] 3235         JRA     FIND1
      009348 CD 85 B4         [ 4] 3236 FIND5:  CALL     RFROM
      00934B CD 86 8F         [ 4] 3237         CALL     DROP
      00934E CD 86 A9         [ 4] 3238         CALL     SWAPP
      009351 CD 86 8F         [ 4] 3239         CALL     DROP
      009354 CD 8B FB         [ 4] 3240         CALL     CELLM
      009357 CD 86 99         [ 4] 3241         CALL     DUPP
      00935A CD 92 79         [ 4] 3242         CALL     NAMET
      00935D CC 86 A9         [ 2] 3243         JP     SWAPP
                                   3244 
                                   3245 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3246 ;       NAME?   ( a -- ca na | a F )
                                   3247 ;       Search vocabularies for a string.
                                   3248 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0012E0                       3249         _HEADER NAMEQ,5,"NAME?"
      009360 92 CA                    1         .word LINK 
                           0012E2     2         LINK=.
      009362 05                       3         .byte 5  
      009363 4E 41 4D 45 3F           4         .ascii "NAME?"
      009368                          5         NAMEQ:
      009368 CD 87 E2         [ 4] 3250         CALL   CNTXT
      00936B CC 92 CF         [ 2] 3251         JP     FIND
                                   3252 
                                   3253 ;; Terminal response
                                   3254 
                                   3255 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3256 ;       ^H      ( bot eot cur -- bot eot cur )
                                   3257 ;       Backup cursor by one character.
                                   3258 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0012EE                       3259         _HEADER BKSP,2,"^H"
      00936E 93 62                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



                           0012F0     2         LINK=.
      009370 02                       3         .byte 2  
      009371 5E 48                    4         .ascii "^H"
      009373                          5         BKSP:
      009373 CD 86 62         [ 4] 3260         CALL     TOR
      009376 CD 86 C1         [ 4] 3261         CALL     OVER
      009379 CD 85 B4         [ 4] 3262         CALL     RFROM
      00937C CD 86 A9         [ 4] 3263         CALL     SWAPP
      00937F CD 86 C1         [ 4] 3264         CALL     OVER
      009382 CD 87 1F         [ 4] 3265         CALL     XORR
      009385 CD 85 18         [ 4] 3266         CALL     QBRAN
      009388 93 A3                 3267         .word      BACK1
      00938A CD 84 EF         [ 4] 3268         CALL     DOLIT
      00938D 00 08                 3269         .word      BKSPP
      00938F CD 84 B6         [ 4] 3270         CALL     EMIT
      009392 CD 8C 24         [ 4] 3271         CALL     ONEM
      009395 CD 8C 76         [ 4] 3272         CALL     BLANK
      009398 CD 84 B6         [ 4] 3273         CALL     EMIT
      00939B CD 84 EF         [ 4] 3274         CALL     DOLIT
      00939E 00 08                 3275         .word      BKSPP
      0093A0 CC 84 B6         [ 2] 3276         JP     EMIT
      0093A3 81               [ 4] 3277 BACK1:  RET
                                   3278 
                                   3279 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3280 ;       TAP    ( bot eot cur c -- bot eot cur )
                                   3281 ;       Accept and echo key stroke
                                   3282 ;       and bump cursor.
                                   3283 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001324                       3284         _HEADER TAP,3,"TAP"
      0093A4 93 70                    1         .word LINK 
                           001326     2         LINK=.
      0093A6 03                       3         .byte 3  
      0093A7 54 41 50                 4         .ascii "TAP"
      0093AA                          5         TAP:
      0093AA CD 86 99         [ 4] 3285         CALL     DUPP
      0093AD CD 84 B6         [ 4] 3286         CALL     EMIT
      0093B0 CD 86 C1         [ 4] 3287         CALL     OVER
      0093B3 CD 85 70         [ 4] 3288         CALL     CSTOR
      0093B6 CC 8C 17         [ 2] 3289         JP     ONEP
                                   3290 
                                   3291 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3292 ;       kTAP    ( bot eot cur c -- bot eot cur )
                                   3293 ;       Process a key stroke,
                                   3294 ;       CR,LF or backspace.
                                   3295 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001339                       3296         _HEADER KTAP,4,"KTAP"
      0093B9 93 A6                    1         .word LINK 
                           00133B     2         LINK=.
      0093BB 04                       3         .byte 4  
      0093BC 4B 54 41 50              4         .ascii "KTAP"
      0093C0                          5         KTAP:
      0093C0 CD 86 99         [ 4] 3297         CALL     DUPP
      0093C3 CD 84 EF         [ 4] 3298         CALL     DOLIT
                           000001  3299 .if EOL_CR
      0093C6 00 0D                 3300         .word   CRR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



                           000000  3301 .else ; EOL_LF 
                                   3302         .word   LF
                                   3303 .endif 
      0093C8 CD 87 1F         [ 4] 3304         CALL     XORR
      0093CB CD 85 18         [ 4] 3305         CALL     QBRAN
      0093CE 93 E6                 3306         .word      KTAP2
      0093D0 CD 84 EF         [ 4] 3307         CALL     DOLIT
      0093D3 00 08                 3308         .word      BKSPP
      0093D5 CD 87 1F         [ 4] 3309         CALL     XORR
      0093D8 CD 85 18         [ 4] 3310         CALL     QBRAN
      0093DB 93 E3                 3311         .word      KTAP1
      0093DD CD 8C 76         [ 4] 3312         CALL     BLANK
      0093E0 CC 93 AA         [ 2] 3313         JP     TAP
      0093E3 CC 93 73         [ 2] 3314 KTAP1:  JP     BKSP
      0093E6 CD 86 8F         [ 4] 3315 KTAP2:  CALL     DROP
      0093E9 CD 86 A9         [ 4] 3316         CALL     SWAPP
      0093EC CD 86 8F         [ 4] 3317         CALL     DROP
      0093EF CC 86 99         [ 2] 3318         JP     DUPP
                                   3319 
                                   3320 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3321 ;       accept  ( b u -- b u )
                                   3322 ;       Accept characters to input
                                   3323 ;       buffer. Return with actual count.
                                   3324 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001372                       3325         _HEADER ACCEP,6,"ACCEPT"
      0093F2 93 BB                    1         .word LINK 
                           001374     2         LINK=.
      0093F4 06                       3         .byte 6  
      0093F5 41 43 43 45 50 54        4         .ascii "ACCEPT"
      0093FB                          5         ACCEP:
      0093FB CD 86 C1         [ 4] 3326         CALL     OVER
      0093FE CD 88 BC         [ 4] 3327         CALL     PLUS
      009401 CD 86 C1         [ 4] 3328         CALL     OVER
      009404 CD 88 A7         [ 4] 3329 ACCP1:  CALL     DDUP
      009407 CD 87 1F         [ 4] 3330         CALL     XORR
      00940A CD 85 18         [ 4] 3331         CALL     QBRAN
      00940D 94 2F                 3332         .word      ACCP4
      00940F CD 8F 8F         [ 4] 3333         CALL     KEY
      009412 CD 86 99         [ 4] 3334         CALL     DUPP
      009415 CD 8C 76         [ 4] 3335         CALL     BLANK
      009418 CD 84 EF         [ 4] 3336         CALL     DOLIT
      00941B 00 7F                 3337         .word      127
      00941D CD 8A 16         [ 4] 3338         CALL     WITHI
      009420 CD 85 18         [ 4] 3339         CALL     QBRAN
      009423 94 2A                 3340         .word      ACCP2
      009425 CD 93 AA         [ 4] 3341         CALL     TAP
      009428 20 03            [ 2] 3342         JRA     ACCP3
      00942A CD 93 C0         [ 4] 3343 ACCP2:  CALL     KTAP
      00942D 20 D5            [ 2] 3344 ACCP3:  JRA     ACCP1
      00942F CD 86 8F         [ 4] 3345 ACCP4:  CALL     DROP
      009432 CD 86 C1         [ 4] 3346         CALL     OVER
      009435 CC 89 52         [ 2] 3347         JP     SUBB
                                   3348 
                                   3349 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3350 ;       QUERY   ( -- )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



                                   3351 ;       Accept input stream to
                                   3352 ;       terminal input buffer.
                                   3353 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0013B8                       3354         _HEADER QUERY,5,"QUERY"
      009438 93 F4                    1         .word LINK 
                           0013BA     2         LINK=.
      00943A 05                       3         .byte 5  
      00943B 51 55 45 52 59           4         .ascii "QUERY"
      009440                          5         QUERY:
      009440 CD 8D 7F         [ 4] 3355         CALL     TIB
      009443 CD 84 EF         [ 4] 3356         CALL     DOLIT
      009446 00 50                 3357         .word      80
      009448 CD 93 FB         [ 4] 3358         CALL     ACCEP
      00944B CD 87 8D         [ 4] 3359         CALL     NTIB
      00944E CD 85 51         [ 4] 3360         CALL     STORE
      009451 CD 86 8F         [ 4] 3361         CALL     DROP
      009454 CD 8C 83         [ 4] 3362         CALL     ZERO
      009457 CD 87 7D         [ 4] 3363         CALL     INN
      00945A CC 85 51         [ 2] 3364         JP     STORE
                                   3365 
                                   3366 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3367 ;       ABORT   ( -- )
                                   3368 ;       Reset data stack and
                                   3369 ;       jump to QUIT.
                                   3370 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0013DD                       3371         _HEADER ABORT,5,"ABORT"
      00945D 94 3A                    1         .word LINK 
                           0013DF     2         LINK=.
      00945F 05                       3         .byte 5  
      009460 41 42 4F 52 54           4         .ascii "ABORT"
      009465                          5         ABORT:
      009465 CD 95 5C         [ 4] 3372         CALL     PRESE
      009468 CC 95 79         [ 2] 3373         JP     QUIT
                                   3374 
                                   3375 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3376 ;       abort"  ( f -- )
                                   3377 ;       Run time routine of ABORT".
                                   3378 ;       Abort with a message.
                                   3379 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0013EB                       3380         _HEADER ABORQ,COMPO+6,'ABORT"'
      00946B 94 5F                    1         .word LINK 
                           0013ED     2         LINK=.
      00946D 46                       3         .byte COMPO+6  
      00946E 41 42 4F 52 54 22        4         .ascii 'ABORT"'
      009474                          5         ABORQ:
      009474 CD 85 18         [ 4] 3381         CALL     QBRAN
      009477 94 93                 3382         .word      ABOR2   ;text flag
      009479 CD 90 19         [ 4] 3383         CALL     DOSTR
      00947C CD 8F C7         [ 4] 3384 ABOR1:  CALL     SPACE
      00947F CD 8D 46         [ 4] 3385         CALL     COUNT
      009482 CD 8F F1         [ 4] 3386         CALL     TYPES
      009485 CD 84 EF         [ 4] 3387         CALL     DOLIT
      009488 00 3F                 3388         .word     63 ; "?"
      00948A CD 84 B6         [ 4] 3389         CALL     EMIT
      00948D CD 90 09         [ 4] 3390         CALL     CR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



      009490 CC 94 65         [ 2] 3391         JP     ABORT   ;pass error string
      009493 CD 90 19         [ 4] 3392 ABOR2:  CALL     DOSTR
      009496 CC 86 8F         [ 2] 3393         JP     DROP
                                   3394 
                                   3395 ;; The text interpreter
                                   3396 
                                   3397 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3398 ;       $INTERPRET      ( a -- )
                                   3399 ;       Interpret a word. If failed,
                                   3400 ;       try to convert it to an integer.
                                   3401 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001419                       3402         _HEADER INTER,10,"$INTERPRET"
      009499 94 6D                    1         .word LINK 
                           00141B     2         LINK=.
      00949B 0A                       3         .byte 10  
      00949C 24 49 4E 54 45 52 50     4         .ascii "$INTERPRET"
             52 45 54
      0094A6                          5         INTER:
      0094A6 CD 93 68         [ 4] 3403         CALL     NAMEQ
      0094A9 CD 88 4C         [ 4] 3404         CALL     QDUP    ;?defined
      0094AC CD 85 18         [ 4] 3405         CALL     QBRAN
      0094AF 94 D0                 3406         .word      INTE1
      0094B1 CD 85 63         [ 4] 3407         CALL     AT
      0094B4 CD 84 EF         [ 4] 3408         CALL     DOLIT
      0094B7 40 00                 3409 	.word       0x4000	; COMPO*256
      0094B9 CD 86 F6         [ 4] 3410         CALL     ANDD    ;?compile only lexicon bits
      0094BC CD 94 74         [ 4] 3411         CALL     ABORQ
      0094BF 0D                    3412         .byte      13
      0094C0 20 63 6F 6D 70 69 6C  3413         .ascii     " compile only"
             65 20 6F 6E 6C 79
      0094CD CC 85 44         [ 2] 3414         JP     EXECU
      0094D0 CD A6 10         [ 4] 3415 INTE1:  CALL     NUMBQ   ;convert a number
      0094D3 CD 85 18         [ 4] 3416         CALL     QBRAN
      0094D6 94 7C                 3417         .word    ABOR1
      0094D8 81               [ 4] 3418         RET
                                   3419 
                                   3420 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3421 ;       [       ( -- )
                                   3422 ;       Start  text interpreter.
                                   3423 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001459                       3424         _HEADER LBRAC,IMEDD+1,"["
      0094D9 94 9B                    1         .word LINK 
                           00145B     2         LINK=.
      0094DB 81                       3         .byte IMEDD+1  
      0094DC 5B                       4         .ascii "["
      0094DD                          5         LBRAC:
      0094DD CD 84 EF         [ 4] 3425         CALL   DOLIT
      0094E0 94 A6                 3426         .word  INTER
      0094E2 CD 87 C0         [ 4] 3427         CALL   TEVAL
      0094E5 CC 85 51         [ 2] 3428         JP     STORE
                                   3429 
                                   3430 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3431 ;       .OK     ( -- )
                                   3432 ;       Display 'ok' while interpreting.
                                   3433 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



      001468                       3434         _HEADER DOTOK,3,".OK"
      0094E8 94 DB                    1         .word LINK 
                           00146A     2         LINK=.
      0094EA 03                       3         .byte 3  
      0094EB 2E 4F 4B                 4         .ascii ".OK"
      0094EE                          5         DOTOK:
      0094EE CD 84 EF         [ 4] 3435         CALL     DOLIT
      0094F1 94 A6                 3436         .word      INTER
      0094F3 CD 87 C0         [ 4] 3437         CALL     TEVAL
      0094F6 CD 85 63         [ 4] 3438         CALL     AT
      0094F9 CD 89 7A         [ 4] 3439         CALL     EQUAL
      0094FC CD 85 18         [ 4] 3440         CALL     QBRAN
      0094FF 95 08                 3441         .word      DOTO1
      009501 CD 90 36         [ 4] 3442         CALL     DOTQP
      009504 03                    3443         .byte      3
      009505 20 6F 6B              3444         .ascii     " ok"
      009508 CC 90 09         [ 2] 3445 DOTO1:  JP     CR
                                   3446 
                                   3447 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3448 ;       ?STACK  ( -- )
                                   3449 ;       Abort if stack underflows.
                                   3450 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00148B                       3451         _HEADER QSTAC,6,"?STACK"
      00950B 94 EA                    1         .word LINK 
                           00148D     2         LINK=.
      00950D 06                       3         .byte 6  
      00950E 3F 53 54 41 43 4B        4         .ascii "?STACK"
      009514                          5         QSTAC:
      009514 CD 8C C5         [ 4] 3452         CALL     DEPTH
      009517 CD 86 D0         [ 4] 3453         CALL     ZLESS   ;check only for underflow
      00951A CD 94 74         [ 4] 3454         CALL     ABORQ
      00951D 0B                    3455         .byte      11
      00951E 20 75 6E 64 65 72 66  3456         .ascii     " underflow "
             6C 6F 77 20
      009529 81               [ 4] 3457         RET
                                   3458 
                                   3459 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3460 ;       EVAL    ( -- )
                                   3461 ;       Interpret  input stream.
                                   3462 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0014AA                       3463         _HEADER EVAL,4,"EVAL"
      00952A 95 0D                    1         .word LINK 
                           0014AC     2         LINK=.
      00952C 04                       3         .byte 4  
      00952D 45 56 41 4C              4         .ascii "EVAL"
      009531                          5         EVAL:
      009531 CD 92 6B         [ 4] 3464 EVAL1:  CALL     TOKEN
      009534 CD 86 99         [ 4] 3465         CALL     DUPP
      009537 CD 85 81         [ 4] 3466         CALL     CAT     ;?input stream empty
      00953A CD 85 18         [ 4] 3467         CALL     QBRAN
      00953D 95 4D                 3468         .word    EVAL2
      00953F CD 87 C0         [ 4] 3469         CALL     TEVAL
      009542 CD 8D 93         [ 4] 3470         CALL     ATEXE
      009545 CD 95 14         [ 4] 3471         CALL     QSTAC   ;evaluate input, check stack
      009548 CD 85 34         [ 4] 3472         CALL     BRAN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



      00954B 95 31                 3473         .word    EVAL1
      00954D CD 86 8F         [ 4] 3474 EVAL2:  CALL     DROP
      009550 CC 94 EE         [ 2] 3475         JP       DOTOK
                                   3476 
                                   3477 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3478 ;       PRESET  ( -- )
                                   3479 ;       Reset data stack pointer and
                                   3480 ;       terminal input buffer.
                                   3481 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0014D3                       3482         _HEADER PRESE,6,"PRESET"
      009553 95 2C                    1         .word LINK 
                           0014D5     2         LINK=.
      009555 06                       3         .byte 6  
      009556 50 52 45 53 45 54        4         .ascii "PRESET"
      00955C                          5         PRESE:
      00955C CD 84 EF         [ 4] 3483         CALL     DOLIT
      00955F 16 80                 3484         .word      SPP
      009561 CD 86 86         [ 4] 3485         CALL     SPSTO
      009564 CD 84 EF         [ 4] 3486         CALL     DOLIT
      009567 17 00                 3487         .word      TIBB
      009569 CD 87 8D         [ 4] 3488         CALL     NTIB
      00956C CD 8B EC         [ 4] 3489         CALL     CELLP
      00956F CC 85 51         [ 2] 3490         JP     STORE
                                   3491 
                                   3492 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3493 ;       QUIT    ( -- )
                                   3494 ;       Reset return stack pointer
                                   3495 ;       and start text interpreter.
                                   3496 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0014F2                       3497         _HEADER QUIT,4,"QUIT"
      009572 95 55                    1         .word LINK 
                           0014F4     2         LINK=.
      009574 04                       3         .byte 4  
      009575 51 55 49 54              4         .ascii "QUIT"
      009579                          5         QUIT:
      009579 CD 84 EF         [ 4] 3498         CALL     DOLIT
      00957C 17 FF                 3499         .word      RPP
      00957E CD 85 9E         [ 4] 3500         CALL     RPSTO   ;reset return stack pointer
      009581 CD 94 DD         [ 4] 3501 QUIT1:  CALL     LBRAC   ;start interpretation
      009584 CD 94 40         [ 4] 3502 QUIT2:  CALL     QUERY   ;get input
      009587 CD 95 31         [ 4] 3503         CALL     EVAL
      00958A 20 F8            [ 2] 3504         JRA     QUIT2   ;continue till error
                                   3505 
                                   3506 ;; The compiler
                                   3507 
                                   3508 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3509 ;       '       ( -- ca )
                                   3510 ;       Search vocabularies for
                                   3511 ;       next word in input stream.
                                   3512 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00150C                       3513         _HEADER TICK,1,"'"
      00958C 95 74                    1         .word LINK 
                           00150E     2         LINK=.
      00958E 01                       3         .byte 1  
      00958F 27                       4         .ascii "'"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



      009590                          5         TICK:
      009590 CD 92 6B         [ 4] 3514         CALL     TOKEN
      009593 CD 93 68         [ 4] 3515         CALL     NAMEQ   ;?defined
      009596 CD 85 18         [ 4] 3516         CALL     QBRAN
      009599 94 7C                 3517         .word      ABOR1
      00959B 81               [ 4] 3518         RET     ;yes, push code address
                                   3519 
                                   3520 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3521 ;       ALLOT   ( n -- )
                                   3522 ;       Allocate n bytes to RAM 
                                   3523 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00151C                       3524         _HEADER ALLOT,5,"ALLOT"
      00959C 95 8E                    1         .word LINK 
                           00151E     2         LINK=.
      00959E 05                       3         .byte 5  
      00959F 41 4C 4C 4F 54           4         .ascii "ALLOT"
      0095A4                          5         ALLOT:
      0095A4 CD 87 F0         [ 4] 3525         CALL     VPP
                                   3526 ; must update APP_VP each time VP is modidied
      0095A7 CD 8C F3         [ 4] 3527         call PSTOR 
      0095AA CC 9D 5C         [ 2] 3528         jp UPDATVP 
                                   3529 
                                   3530 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3531 ;       ,       ( w -- )
                                   3532 ;         Compile an integer into
                                   3533 ;         variable space.
                                   3534 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00152D                       3535         _HEADER COMMA,1,^/"\,"/
      0095AD 95 9E                    1         .word LINK 
                           00152F     2         LINK=.
      0095AF 01                       3         .byte 1  
      0095B0 5C 2C                    4         .ascii "\,"
      0095B2                          5         COMMA:
      0095B2 CD 8D 5D         [ 4] 3536         CALL     HERE
      0095B5 CD 86 99         [ 4] 3537         CALL     DUPP
      0095B8 CD 8B EC         [ 4] 3538         CALL     CELLP   ;cell boundary
      0095BB CD 87 F0         [ 4] 3539         CALL     VPP
      0095BE CD 85 51         [ 4] 3540         CALL     STORE
      0095C1 CC 85 51         [ 2] 3541         JP     STORE
                                   3542 
                                   3543 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3544 ;       C,      ( c -- )
                                   3545 ;       Compile a byte into
                                   3546 ;       variables space.
                                   3547 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001544                       3548         _HEADER CCOMMA,2,^/"C,"/
      0095C4 95 AF                    1         .word LINK 
                           001546     2         LINK=.
      0095C6 02                       3         .byte 2  
      0095C7 43 2C                    4         .ascii "C,"
      0095C9                          5         CCOMMA:
      0095C9 CD 8D 5D         [ 4] 3549         CALL     HERE
      0095CC CD 86 99         [ 4] 3550         CALL     DUPP
      0095CF CD 8C 17         [ 4] 3551         CALL     ONEP
      0095D2 CD 87 F0         [ 4] 3552         CALL     VPP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



      0095D5 CD 85 51         [ 4] 3553         CALL     STORE
      0095D8 CC 85 70         [ 2] 3554         JP     CSTOR
                                   3555 
                                   3556 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3557 ;       [COMPILE]       ( -- ; <string> )
                                   3558 ;       Compile next immediate
                                   3559 ;       word into code dictionary.
                                   3560 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00155B                       3561         _HEADER BCOMP,IMEDD+9,"[COMPILE]"
      0095DB 95 C6                    1         .word LINK 
                           00155D     2         LINK=.
      0095DD 89                       3         .byte IMEDD+9  
      0095DE 5B 43 4F 4D 50 49 4C     4         .ascii "[COMPILE]"
             45 5D
      0095E7                          5         BCOMP:
      0095E7 CD 95 90         [ 4] 3562         CALL     TICK
      0095EA CC 98 BC         [ 2] 3563         JP     JSRC
                                   3564 
                                   3565 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3566 ;       COMPILE ( -- )
                                   3567 ;       Compile next jsr in
                                   3568 ;       colon list to code dictionary.
                                   3569 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00156D                       3570         _HEADER COMPI,COMPO+7,"COMPILE"
      0095ED 95 DD                    1         .word LINK 
                           00156F     2         LINK=.
      0095EF 47                       3         .byte COMPO+7  
      0095F0 43 4F 4D 50 49 4C 45     4         .ascii "COMPILE"
      0095F7                          5         COMPI:
      0095F7 CD 85 B4         [ 4] 3571         CALL     RFROM
      0095FA CD 86 99         [ 4] 3572         CALL     DUPP
      0095FD CD 85 63         [ 4] 3573         CALL     AT
      009600 CD 98 BC         [ 4] 3574         CALL     JSRC    ;compile subroutine
      009603 CD 8B EC         [ 4] 3575         CALL     CELLP
      009606 90 93            [ 1] 3576         ldw y,x 
      009608 90 FE            [ 2] 3577         ldw y,(y)
      00960A 1C 00 02         [ 2] 3578         addw x,#CELLL 
      00960D 90 FC            [ 2] 3579         jp (y)
                                   3580 
                                   3581 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3582 ;       LITERAL ( w -- )
                                   3583 ;       Compile tos to dictionary
                                   3584 ;       as an integer literal.
                                   3585 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00158F                       3586         _HEADER LITER,COMPO+IMEDD+7,"LITERAL"
      00960F 95 EF                    1         .word LINK 
                           001591     2         LINK=.
      009611 C7                       3         .byte COMPO+IMEDD+7  
      009612 4C 49 54 45 52 41 4C     4         .ascii "LITERAL"
      009619                          5         LITER:
      009619 CD 95 F7         [ 4] 3587         CALL     COMPI
      00961C 84 EF                 3588         .word DOLIT 
      00961E CC 95 B2         [ 2] 3589         JP     COMMA
                                   3590 
                                   3591 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



                                   3592 ;       $,"     ( -- )
                                   3593 ;       Compile a literal string
                                   3594 ;       up to next " .
                                   3595 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3596 ;        _HEADER STRCQ,3,^/'$,"'/
      009621                       3597 STRCQ:
      009621 CD 84 EF         [ 4] 3598         CALL     DOLIT
      009624 00 22                 3599         .word     34	; "
      009626 CD 91 AA         [ 4] 3600         CALL     PARSE
      009629 CD 8D 5D         [ 4] 3601         CALL     HERE
      00962C CD 8E 2E         [ 4] 3602         CALL     PACKS   ;string to code dictionary
      00962F CD 8D 46         [ 4] 3603         CALL     COUNT
      009632 CD 88 BC         [ 4] 3604         CALL     PLUS    ;calculate aligned end of string
      009635 CD 87 F0         [ 4] 3605         CALL     VPP
      009638 CC 85 51         [ 2] 3606         JP     STORE
                                   3607 
                                   3608 ;; Structures
                                   3609 
                                   3610 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3611 ;       FOR     ( -- a )
                                   3612 ;       Start a FOR-NEXT loop
                                   3613 ;       structure in a colon definition.
                                   3614 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0015BB                       3615         _HEADER FOR,IMEDD+3,"FOR"
      00963B 96 11                    1         .word LINK 
                           0015BD     2         LINK=.
      00963D 83                       3         .byte IMEDD+3  
      00963E 46 4F 52                 4         .ascii "FOR"
      009641                          5         FOR:
      009641 CD 95 F7         [ 4] 3616         CALL     COMPI
      009644 86 62                 3617         .word TOR 
      009646 CC 8D 5D         [ 2] 3618         JP     HERE
                                   3619 
                                   3620 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3621 ;       NEXT    ( a -- )
                                   3622 ;       Terminate a FOR-NEXT loop.
                                   3623 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0015C9                       3624         _HEADER NEXT,IMEDD+4,"NEXT"
      009649 96 3D                    1         .word LINK 
                           0015CB     2         LINK=.
      00964B 84                       3         .byte IMEDD+4  
      00964C 4E 45 58 54              4         .ascii "NEXT"
      009650                          5         NEXT:
      009650 CD 95 F7         [ 4] 3625         CALL     COMPI
      009653 85 03                 3626         .word DONXT 
      009655 CD 88 3C         [ 4] 3627         call ADRADJ
      009658 CC 95 B2         [ 2] 3628         JP     COMMA
                                   3629 
                                   3630 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3631 ;       I ( -- n )
                                   3632 ;       stack COUNTER
                                   3633 ;       of innermost FOR-NEXT  
                                   3634 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0015DB                       3635         _HEADER IFETCH,1,"I"
      00965B 96 4B                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



                           0015DD     2         LINK=.
      00965D 01                       3         .byte 1  
      00965E 49                       4         .ascii "I"
      00965F                          5         IFETCH:
      00965F 1D 00 02         [ 2] 3636         subw x,#CELLL 
      009662 16 03            [ 2] 3637         ldw y,(3,sp)
      009664 FF               [ 2] 3638         ldw (x),y 
      009665 81               [ 4] 3639         ret 
                                   3640 
                                   3641 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3642 ;       J ( -- n )
                                   3643 ;   stack COUNTER
                                   3644 ;   of outer FOR-NEXT  
                                   3645 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0015E6                       3646         _HEADER JFETCH,1,"J"
      009666 96 5D                    1         .word LINK 
                           0015E8     2         LINK=.
      009668 01                       3         .byte 1  
      009669 4A                       4         .ascii "J"
      00966A                          5         JFETCH:
      00966A 1D 00 02         [ 2] 3647         SUBW X,#CELLL 
      00966D 16 05            [ 2] 3648         LDW Y,(5,SP)
      00966F FF               [ 2] 3649         LDW (X),Y 
      009670 81               [ 4] 3650         RET 
                                   3651 
                                   3652 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3653 ;       BEGIN   ( -- a )
                                   3654 ;       Start an infinite or
                                   3655 ;       indefinite loop structure.
                                   3656 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0015F1                       3657         _HEADER BEGIN,IMEDD+5,"BEGIN"
      009671 96 68                    1         .word LINK 
                           0015F3     2         LINK=.
      009673 85                       3         .byte IMEDD+5  
      009674 42 45 47 49 4E           4         .ascii "BEGIN"
      009679                          5         BEGIN:
      009679 CC 8D 5D         [ 2] 3658         JP     HERE
                                   3659 
                                   3660 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3661 ;       UNTIL   ( a -- )
                                   3662 ;       Terminate a BEGIN-UNTIL
                                   3663 ;       indefinite loop structure.
                                   3664 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0015FC                       3665         _HEADER UNTIL,IMEDD+5,"UNTIL"
      00967C 96 73                    1         .word LINK 
                           0015FE     2         LINK=.
      00967E 85                       3         .byte IMEDD+5  
      00967F 55 4E 54 49 4C           4         .ascii "UNTIL"
      009684                          5         UNTIL:
      009684 CD 95 F7         [ 4] 3666         CALL     COMPI
      009687 85 18                 3667         .word    QBRAN 
      009689 CD 88 3C         [ 4] 3668         call ADRADJ
      00968C CC 95 B2         [ 2] 3669         JP     COMMA
                                   3670 
                                   3671 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



                                   3672 ;       AGAIN   ( a -- )
                                   3673 ;       Terminate a BEGIN-AGAIN
                                   3674 ;       infinite loop structure.
                                   3675 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00160F                       3676         _HEADER AGAIN,IMEDD+5,"AGAIN"
      00968F 96 7E                    1         .word LINK 
                           001611     2         LINK=.
      009691 85                       3         .byte IMEDD+5  
      009692 41 47 41 49 4E           4         .ascii "AGAIN"
      009697                          5         AGAIN:
      009697 CD 95 F7         [ 4] 3677         CALL     COMPI
      00969A 85 34                 3678         .word BRAN
      00969C CD 88 3C         [ 4] 3679         call ADRADJ 
      00969F CC 95 B2         [ 2] 3680         JP     COMMA
                                   3681 
                                   3682 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3683 ;       IF      ( -- A )
                                   3684 ;       Begin a conditional branch.
                                   3685 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001622                       3686         _HEADER IFF,IMEDD+2,"IF"
      0096A2 96 91                    1         .word LINK 
                           001624     2         LINK=.
      0096A4 82                       3         .byte IMEDD+2  
      0096A5 49 46                    4         .ascii "IF"
      0096A7                          5         IFF:
      0096A7 CD 95 F7         [ 4] 3687         CALL     COMPI
      0096AA 85 18                 3688         .word QBRAN
      0096AC CD 8D 5D         [ 4] 3689         CALL     HERE
      0096AF CD 8C 83         [ 4] 3690         CALL     ZERO
      0096B2 CC 95 B2         [ 2] 3691         JP     COMMA
                                   3692 
                                   3693 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3694 ;       THEN        ( A -- )
                                   3695 ;       Terminate a conditional 
                                   3696 ;       branch structure.
                                   3697 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001635                       3698         _HEADER THENN,IMEDD+4,"THEN"
      0096B5 96 A4                    1         .word LINK 
                           001637     2         LINK=.
      0096B7 84                       3         .byte IMEDD+4  
      0096B8 54 48 45 4E              4         .ascii "THEN"
      0096BC                          5         THENN:
      0096BC CD 8D 5D         [ 4] 3699         CALL     HERE
      0096BF CD 88 3C         [ 4] 3700         call ADRADJ 
      0096C2 CD 86 A9         [ 4] 3701         CALL     SWAPP
      0096C5 CC 85 51         [ 2] 3702         JP     STORE
                                   3703 
                                   3704 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3705 ;       ELSE        ( A -- A )
                                   3706 ;       Start the false clause in 
                                   3707 ;       an IF-ELSE-THEN structure.
                                   3708 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001648                       3709         _HEADER ELSEE,IMEDD+4,"ELSE"
      0096C8 96 B7                    1         .word LINK 
                           00164A     2         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



      0096CA 84                       3         .byte IMEDD+4  
      0096CB 45 4C 53 45              4         .ascii "ELSE"
      0096CF                          5         ELSEE:
      0096CF CD 95 F7         [ 4] 3710         CALL     COMPI
      0096D2 85 34                 3711         .word BRAN
      0096D4 CD 8D 5D         [ 4] 3712         CALL     HERE
      0096D7 CD 8C 83         [ 4] 3713         CALL     ZERO
      0096DA CD 95 B2         [ 4] 3714         CALL     COMMA
      0096DD CD 86 A9         [ 4] 3715         CALL     SWAPP
      0096E0 CD 8D 5D         [ 4] 3716         CALL     HERE
      0096E3 CD 88 3C         [ 4] 3717         call ADRADJ 
      0096E6 CD 86 A9         [ 4] 3718         CALL     SWAPP
      0096E9 CC 85 51         [ 2] 3719         JP     STORE
                                   3720 
                                   3721 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3722 ;       AHEAD       ( -- A )
                                   3723 ;       Compile a forward branch
                                   3724 ;       instruction.
                                   3725 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00166C                       3726         _HEADER AHEAD,IMEDD+5,"AHEAD"
      0096EC 96 CA                    1         .word LINK 
                           00166E     2         LINK=.
      0096EE 85                       3         .byte IMEDD+5  
      0096EF 41 48 45 41 44           4         .ascii "AHEAD"
      0096F4                          5         AHEAD:
      0096F4 CD 95 F7         [ 4] 3727         CALL     COMPI
      0096F7 85 34                 3728         .word BRAN
      0096F9 CD 8D 5D         [ 4] 3729         CALL     HERE
      0096FC CD 8C 83         [ 4] 3730         CALL     ZERO
      0096FF CC 95 B2         [ 2] 3731         JP     COMMA
                                   3732 
                                   3733 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3734 ;       WHILE       ( a -- A a )
                                   3735 ;       Conditional branch out of a 
                                   3736 ;       BEGIN-WHILE-REPEAT loop.
                                   3737 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001682                       3738         _HEADER WHILE,IMEDD+5,"WHILE"
      009702 96 EE                    1         .word LINK 
                           001684     2         LINK=.
      009704 85                       3         .byte IMEDD+5  
      009705 57 48 49 4C 45           4         .ascii "WHILE"
      00970A                          5         WHILE:
      00970A CD 95 F7         [ 4] 3739         CALL     COMPI
      00970D 85 18                 3740         .word QBRAN
      00970F CD 8D 5D         [ 4] 3741         CALL     HERE
      009712 CD 8C 83         [ 4] 3742         CALL     ZERO
      009715 CD 95 B2         [ 4] 3743         CALL     COMMA
      009718 CC 86 A9         [ 2] 3744         JP     SWAPP
                                   3745 
                                   3746 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3747 ;       REPEAT      ( A a -- )
                                   3748 ;       Terminate a BEGIN-WHILE-REPEAT 
                                   3749 ;       indefinite loop.
                                   3750 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00169B                       3751         _HEADER REPEA,IMEDD+6,"REPEAT"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



      00971B 97 04                    1         .word LINK 
                           00169D     2         LINK=.
      00971D 86                       3         .byte IMEDD+6  
      00971E 52 45 50 45 41 54        4         .ascii "REPEAT"
      009724                          5         REPEA:
      009724 CD 95 F7         [ 4] 3752         CALL     COMPI
      009727 85 34                 3753         .word BRAN
      009729 CD 88 3C         [ 4] 3754         call ADRADJ 
      00972C CD 95 B2         [ 4] 3755         CALL     COMMA
      00972F CD 8D 5D         [ 4] 3756         CALL     HERE
      009732 CD 88 3C         [ 4] 3757         call ADRADJ 
      009735 CD 86 A9         [ 4] 3758         CALL     SWAPP
      009738 CC 85 51         [ 2] 3759         JP     STORE
                                   3760 
                                   3761 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3762 ;       AFT         ( a -- a A )
                                   3763 ;       Jump to THEN in a FOR-AFT-THEN-NEXT 
                                   3764 ;       loop the first time through.
                                   3765 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0016BB                       3766         _HEADER AFT,IMEDD+3,"AFT"
      00973B 97 1D                    1         .word LINK 
                           0016BD     2         LINK=.
      00973D 83                       3         .byte IMEDD+3  
      00973E 41 46 54                 4         .ascii "AFT"
      009741                          5         AFT:
      009741 CD 86 8F         [ 4] 3767         CALL     DROP
      009744 CD 96 F4         [ 4] 3768         CALL     AHEAD
      009747 CD 8D 5D         [ 4] 3769         CALL     HERE
      00974A CC 86 A9         [ 2] 3770         JP     SWAPP
                                   3771 
                                   3772 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3773 ;       ABORT"      ( -- ; <string> )
                                   3774 ;       Conditional abort with an error message.
                                   3775 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0016CD                       3776         _HEADER ABRTQ,IMEDD+6,'ABORT"'
      00974D 97 3D                    1         .word LINK 
                           0016CF     2         LINK=.
      00974F 86                       3         .byte IMEDD+6  
      009750 41 42 4F 52 54 22        4         .ascii 'ABORT"'
      009756                          5         ABRTQ:
      009756 CD 95 F7         [ 4] 3777         CALL     COMPI
      009759 94 74                 3778         .word ABORQ
      00975B CC 96 21         [ 2] 3779         JP     STRCQ
                                   3780 
                                   3781 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3782 ;       $"     ( -- ; <string> )
                                   3783 ;       Compile an inline string literal.
                                   3784 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0016DE                       3785         _HEADER STRQ,IMEDD+2,'$"'
      00975E 97 4F                    1         .word LINK 
                           0016E0     2         LINK=.
      009760 82                       3         .byte IMEDD+2  
      009761 24 22                    4         .ascii '$"'
      009763                          5         STRQ:
      009763 CD 95 F7         [ 4] 3786         CALL     COMPI
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



      009766 90 32                 3787         .word STRQP 
      009768 CC 96 21         [ 2] 3788         JP     STRCQ
                                   3789 
                                   3790 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3791 ;       ."          ( -- ; <string> )
                                   3792 ;       Compile an inline string literal 
                                   3793 ;       to be typed out at run time.
                                   3794 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0016EB                       3795         _HEADER DOTQ,IMEDD+2,'."'
      00976B 97 60                    1         .word LINK 
                           0016ED     2         LINK=.
      00976D 82                       3         .byte IMEDD+2  
      00976E 2E 22                    4         .ascii '."'
      009770                          5         DOTQ:
      009770 CD 95 F7         [ 4] 3796         CALL     COMPI
      009773 90 36                 3797         .word DOTQP 
      009775 CC 96 21         [ 2] 3798         JP     STRCQ
                                   3799 
                                   3800 ;; Name compiler
                                   3801 
                                   3802 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3803 ;       ?UNIQUE ( a -- a )
                                   3804 ;       Display a warning message
                                   3805 ;       if word already exists.
                                   3806 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0016F8                       3807         _HEADER UNIQU,7,"?UNIQUE"
      009778 97 6D                    1         .word LINK 
                           0016FA     2         LINK=.
      00977A 07                       3         .byte 7  
      00977B 3F 55 4E 49 51 55 45     4         .ascii "?UNIQUE"
      009782                          5         UNIQU:
      009782 CD 86 99         [ 4] 3808         CALL     DUPP
      009785 CD 93 68         [ 4] 3809         CALL     NAMEQ   ;?name exists
      009788 CD 85 18         [ 4] 3810         CALL     QBRAN
      00978B 97 A1                 3811         .word      UNIQ1
      00978D CD 90 36         [ 4] 3812         CALL     DOTQP   ;redef are OK
      009790 07                    3813         .byte       7
      009791 20 72 65 44 65 66 20  3814         .ascii     " reDef "       
      009798 CD 86 C1         [ 4] 3815         CALL     OVER
      00979B CD 8D 46         [ 4] 3816         CALL     COUNT
      00979E CD 8F F1         [ 4] 3817         CALL     TYPES   ;just in case
      0097A1 CC 86 8F         [ 2] 3818 UNIQ1:  JP     DROP
                                   3819 
                                   3820 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3821 ;       $,n     ( na -- )
                                   3822 ;       Build a new dictionary name
                                   3823 ;       using string at na.
                                   3824 ; compile dans l'espace des variables 
                                   3825 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3826 ;        _HEADER SNAME,3,^/"$,n"/
      0097A4                       3827 SNAME: 
      0097A4 CD 86 99         [ 4] 3828         CALL     DUPP
      0097A7 CD 85 81         [ 4] 3829         CALL     CAT     ;?null input
      0097AA CD 85 18         [ 4] 3830         CALL     QBRAN
      0097AD 97 DA                 3831         .word      PNAM1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      0097AF CD 97 82         [ 4] 3832         CALL     UNIQU   ;?redefinition
      0097B2 CD 86 99         [ 4] 3833         CALL     DUPP
      0097B5 CD 8D 46         [ 4] 3834         CALL     COUNT
      0097B8 CD 88 BC         [ 4] 3835         CALL     PLUS
      0097BB CD 87 F0         [ 4] 3836         CALL     VPP
      0097BE CD 85 51         [ 4] 3837         CALL     STORE
      0097C1 CD 86 99         [ 4] 3838         CALL     DUPP
      0097C4 CD 88 0E         [ 4] 3839         CALL     LAST
      0097C7 CD 85 51         [ 4] 3840         CALL     STORE   ;save na for vocabulary link
      0097CA CD 8B FB         [ 4] 3841         CALL     CELLM   ;link address
      0097CD CD 87 E2         [ 4] 3842         CALL     CNTXT
      0097D0 CD 85 63         [ 4] 3843         CALL     AT
      0097D3 CD 86 A9         [ 4] 3844         CALL     SWAPP
      0097D6 CD 85 51         [ 4] 3845         CALL     STORE
      0097D9 81               [ 4] 3846         RET     ;save code pointer
      0097DA CD 90 32         [ 4] 3847 PNAM1:  CALL     STRQP
      0097DD 05                    3848         .byte      5
      0097DE 20 6E 61 6D 65        3849         .ascii     " name" ;null input
      0097E3 CC 94 7C         [ 2] 3850         JP     ABOR1
                                   3851 
                                   3852 ;; FORTH compiler
                                   3853 
                                   3854 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3855 ;       $COMPILE        ( a -- )
                                   3856 ;       Compile next word to
                                   3857 ;       dictionary as a token or literal.
                                   3858 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001766                       3859         _HEADER SCOMP,8,"$COMPILE"
      0097E6 97 7A                    1         .word LINK 
                           001768     2         LINK=.
      0097E8 08                       3         .byte 8  
      0097E9 24 43 4F 4D 50 49 4C     4         .ascii "$COMPILE"
             45
      0097F1                          5         SCOMP:
      0097F1 CD 93 68         [ 4] 3860         CALL     NAMEQ
      0097F4 CD 88 4C         [ 4] 3861         CALL     QDUP    ;?defined
      0097F7 CD 85 18         [ 4] 3862         CALL     QBRAN
      0097FA 98 12                 3863         .word      SCOM2
      0097FC CD 85 63         [ 4] 3864         CALL     AT
      0097FF CD 84 EF         [ 4] 3865         CALL     DOLIT
      009802 80 00                 3866         .word     0x8000	;  IMEDD*256
      009804 CD 86 F6         [ 4] 3867         CALL     ANDD    ;?immediate
      009807 CD 85 18         [ 4] 3868         CALL     QBRAN
      00980A 98 0F                 3869         .word      SCOM1
      00980C CC 85 44         [ 2] 3870         JP     EXECU
      00980F CC 98 BC         [ 2] 3871 SCOM1:  JP     JSRC
      009812 CD A6 10         [ 4] 3872 SCOM2:  CALL     NUMBQ   ;try to convert to number
      009815 CD 88 4C         [ 4] 3873         CALL    QDUP  
      009818 CD 85 18         [ 4] 3874         CALL     QBRAN
      00981B 94 7C                 3875         .word      ABOR1
      00179D                       3876         _DOLIT  -1
      00981D CD 84 EF         [ 4]    1     CALL DOLIT 
      009820 FF FF                    2     .word -1 
      009822 CD 89 7A         [ 4] 3877         CALL    EQUAL
      0017A5                       3878         _QBRAN DLITER  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



      009825 CD 85 18         [ 4]    1     CALL QBRAN
      009828 A9 E3                    2     .word DLITER
      00982A CC 96 19         [ 2] 3879         JP     LITER
                                   3880 
                                   3881 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3882 ;       OVERT   ( -- )
                                   3883 ;       Link a new word into vocabulary.
                                   3884 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0017AD                       3885         _HEADER OVERT,5,"OVERT"
      00982D 97 E8                    1         .word LINK 
                           0017AF     2         LINK=.
      00982F 05                       3         .byte 5  
      009830 4F 56 45 52 54           4         .ascii "OVERT"
      009835                          5         OVERT:
      009835 CD 88 0E         [ 4] 3886         CALL     LAST
      009838 CD 85 63         [ 4] 3887         CALL     AT
      00983B CD 87 E2         [ 4] 3888         CALL     CNTXT
      00983E CC 85 51         [ 2] 3889         JP     STORE
                                   3890 
                                   3891 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3892 ;       ;       ( -- )
                                   3893 ;       Terminate a colon definition.
                                   3894 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0017C1                       3895         _HEADER SEMIS,IMEDD+COMPO+1,^/";"/
      009841 98 2F                    1         .word LINK 
                           0017C3     2         LINK=.
      009843 C1                       3         .byte IMEDD+COMPO+1  
      009844 3B                       4         .ascii ";"
      009845                          5         SEMIS:
                           000001  3896 .if OPTIMIZE ; more compact and faster
      009845 CD 84 EF         [ 4] 3897         call DOLIT 
      009848 00 81                 3898         .word 0x81   ; opcode for RET 
      00984A CD 95 C9         [ 4] 3899         call CCOMMA 
                           000000  3900 .else
                                   3901         CALL     COMPI
                                   3902         .word EXIT 
                                   3903 .endif 
      00984D CD 94 DD         [ 4] 3904         CALL     LBRAC
      009850 CD 98 35         [ 4] 3905         call OVERT 
      009853 CD A2 B4         [ 4] 3906         CALL FMOVE
      009856 CD 88 4C         [ 4] 3907         call QDUP 
      009859 CD 85 18         [ 4] 3908         call QBRAN 
      00985C 99 8C                 3909         .word SET_RAMLAST 
      00985E CD A3 48         [ 4] 3910         CALL UPDATPTR
      009861 81               [ 4] 3911         RET 
                                   3912 
                                   3913 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3914 ;       Terminate an ISR definition 
                                   3915 ;       retourn ca of ISR as double
                                   3916 ;       I; ( -- ud )
                                   3917 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0017E2                       3918        _HEADER ISEMI,2+IMEDD+COMPO,^/"I;"/
      009862 98 43                    1         .word LINK 
                           0017E4     2         LINK=.
      009864 C2                       3         .byte 2+IMEDD+COMPO  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



      009865 49 3B                    4         .ascii "I;"
      009867                          5         ISEMI:
      009867 1D 00 02         [ 2] 3919         subw x,#CELLL  
      00986A 90 AE 00 80      [ 2] 3920         ldw y,#IRET_CODE 
      00986E FF               [ 2] 3921         ldw (x),y 
      00986F CD 95 C9         [ 4] 3922         call CCOMMA
      009872 CD 94 DD         [ 4] 3923         call LBRAC 
      009875 CD A3 8D         [ 4] 3924         call IFMOVE
      009878 CD 88 4C         [ 4] 3925         call QDUP 
      00987B CD 85 18         [ 4] 3926         CALL QBRAN 
      00987E 99 8C                 3927         .word SET_RAMLAST
      009880 CD 87 FE         [ 4] 3928         CALL CPP
      009883 CD 85 63         [ 4] 3929         call AT 
      009886 CD 86 A9         [ 4] 3930         call SWAPP 
      009889 CD 87 FE         [ 4] 3931         CALL CPP 
      00988C CD 85 51         [ 4] 3932         call STORE 
      00988F CD 9D 45         [ 4] 3933         call UPDATCP 
      009892 CD 9D 02         [ 4] 3934         call EEPVP 
      001815                       3935         _DROP 
      009895 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      009898 CD 85 63         [ 4] 3936         call AT 
      00989B CD 87 F0         [ 4] 3937         call VPP 
      00989E CD 85 51         [ 4] 3938         call STORE 
      0098A1 CC 8C 83         [ 2] 3939         jp ZERO
      0098A4 81               [ 4] 3940         ret           
                                   3941         
                                   3942 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3943 ;       ]       ( -- )
                                   3944 ;       Start compiling words in
                                   3945 ;       input stream.
                                   3946 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001825                       3947         _HEADER RBRAC,1,"]"
      0098A5 98 64                    1         .word LINK 
                           001827     2         LINK=.
      0098A7 01                       3         .byte 1  
      0098A8 5D                       4         .ascii "]"
      0098A9                          5         RBRAC:
      0098A9 CD 84 EF         [ 4] 3948         CALL   DOLIT
      0098AC 97 F1                 3949         .word  SCOMP
      0098AE CD 87 C0         [ 4] 3950         CALL   TEVAL
      0098B1 CC 85 51         [ 2] 3951         JP     STORE
                                   3952 
                                   3953 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3954 ;       CALL,    ( ca -- )
                                   3955 ;       Compile a subroutine call.
                                   3956 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001834                       3957         _HEADER JSRC,5,^/"CALL,"/
      0098B4 98 A7                    1         .word LINK 
                           001836     2         LINK=.
      0098B6 05                       3         .byte 5  
      0098B7 43 41 4C 4C 2C           4         .ascii "CALL,"
      0098BC                          5         JSRC:
      0098BC CD 84 EF         [ 4] 3958         CALL     DOLIT
      0098BF 00 CD                 3959         .word     CALLL     ;CALL
      0098C1 CD 95 C9         [ 4] 3960         CALL     CCOMMA
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      0098C4 CC 95 B2         [ 2] 3961         JP     COMMA
                                   3962 
                                   3963 ;       INIT-OFS ( -- )
                                   3964 ;       compute offset to adjust jump address 
                                   3965 ;       set variable OFFSET 
      0098C7 98 B6                 3966         .word LINK 
                           001849  3967         LINK=.
      0098C9 08                    3968         .byte 8 
      0098CA 49 4E 49 54 2D 4F 46  3969         .ascii "INIT-OFS" 
             53
      0098D2                       3970 INITOFS:
      0098D2 CD 87 AF         [ 4] 3971         call TFLASH 
      0098D5 CD 85 63         [ 4] 3972         CALL AT 
      0098D8 CD 86 99         [ 4] 3973         CALL DUPP 
      0098DB CD 85 18         [ 4] 3974         call QBRAN
      0098DE 98 EF                 3975         .word 1$
      001860                       3976         _DROP  
      0098E0 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      0098E3 CD 87 FE         [ 4] 3977         call CPP 
      0098E6 CD 85 63         [ 4] 3978         call AT 
      0098E9 CD 8D 5D         [ 4] 3979         call HERE
      0098EC CD 89 52         [ 4] 3980         call SUBB 
      0098EF CD 88 33         [ 4] 3981 1$:     call OFFSET 
      0098F2 CC 85 51         [ 2] 3982         jp STORE  
                                   3983 
                                   3984 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3985 ;       :       ( -- ; <string> )
                                   3986 ;       Start a new colon definition
                                   3987 ;       using next word as its name.
                                   3988 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001875                       3989         _HEADER COLON,1,":"
      0098F5 98 C9                    1         .word LINK 
                           001877     2         LINK=.
      0098F7 01                       3         .byte 1  
      0098F8 3A                       4         .ascii ":"
      0098F9                          5         COLON:
      0098F9 CD 98 D2         [ 4] 3990         call INITOFS       
      0098FC CD 92 6B         [ 4] 3991         CALL   TOKEN
      0098FF CD 97 A4         [ 4] 3992         CALL   SNAME
      009902 CC 98 A9         [ 2] 3993         JP     RBRAC
                                   3994 
                                   3995 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3996 ;       I:  ( -- )
                                   3997 ;       Start interrupt service 
                                   3998 ;       routine definition
                                   3999 ;       those definition have 
                                   4000 ;       no name.
                                   4001 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001885                       4002         _HEADER ICOLON,2,"I:"
      009905 98 F7                    1         .word LINK 
                           001887     2         LINK=.
      009907 02                       3         .byte 2  
      009908 49 3A                    4         .ascii "I:"
      00990A                          5         ICOLON:
      00990A CD 98 D2         [ 4] 4003         call INITOFS 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



      00990D CC 98 A9         [ 2] 4004         jp RBRAC  
                                   4005 
                                   4006 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4007 ;       IMMEDIATE       ( -- )
                                   4008 ;       Make last compiled word
                                   4009 ;       an immediate word.
                                   4010 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001890                       4011         _HEADER IMMED,9,"IMMEDIATE"
      009910 99 07                    1         .word LINK 
                           001892     2         LINK=.
      009912 09                       3         .byte 9  
      009913 49 4D 4D 45 44 49 41     4         .ascii "IMMEDIATE"
             54 45
      00991C                          5         IMMED:
      00991C CD 84 EF         [ 4] 4012         CALL     DOLIT
      00991F 80 00                 4013         .word     0x8000	;  IMEDD*256
      009921 CD 88 0E         [ 4] 4014         CALL     LAST
      009924 CD 85 63         [ 4] 4015         CALL     AT
      009927 CD 85 63         [ 4] 4016         CALL     AT
      00992A CD 87 0A         [ 4] 4017         CALL     ORR
      00992D CD 88 0E         [ 4] 4018         CALL     LAST
      009930 CD 85 63         [ 4] 4019         CALL     AT
      009933 CC 85 51         [ 2] 4020         JP     STORE
                                   4021 
                                   4022 ;; Defining words
                                   4023 
                                   4024 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4025 ;       CREATE  ( -- ; <string> )
                                   4026 ;       Compile a new array
                                   4027 ;       without allocating space.
                                   4028 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0018B6                       4029         _HEADER CREAT,6,"CREATE"
      009936 99 12                    1         .word LINK 
                           0018B8     2         LINK=.
      009938 06                       3         .byte 6  
      009939 43 52 45 41 54 45        4         .ascii "CREATE"
      00993F                          5         CREAT:
      00993F CD 92 6B         [ 4] 4030         CALL     TOKEN
      009942 CD 97 A4         [ 4] 4031         CALL     SNAME
      009945 CD 98 35         [ 4] 4032         CALL     OVERT        
      009948 CD 95 F7         [ 4] 4033         CALL     COMPI 
      00994B 87 4F                 4034         .word DOVAR 
      00994D 81               [ 4] 4035         RET
                                   4036 
                                   4037 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4038 ;       VARIABLE  ( -- ; <string> )
                                   4039 ;       Compile a new variable
                                   4040 ;       initialized to 0.
                                   4041 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0018CE                       4042         _HEADER VARIA,8,"VARIABLE"
      00994E 99 38                    1         .word LINK 
                           0018D0     2         LINK=.
      009950 08                       3         .byte 8  
      009951 56 41 52 49 41 42 4C     4         .ascii "VARIABLE"
             45
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



      009959                          5         VARIA:
                                   4043 ; indirect variable so that VARIABLE definition can be compiled in FLASH 
      009959 CD 8D 5D         [ 4] 4044         CALL HERE
      00995C CD 86 99         [ 4] 4045         CALL DUPP 
      00995F CD 8B EC         [ 4] 4046         CALL CELLP
      009962 CD 87 F0         [ 4] 4047         CALL VPP 
      009965 CD 85 51         [ 4] 4048         CALL STORE
      009968 CD 99 3F         [ 4] 4049         CALL CREAT
      00996B CD 86 99         [ 4] 4050         CALL DUPP
      00996E CD 95 B2         [ 4] 4051         CALL COMMA
      009971 CD 8C 83         [ 4] 4052         CALL ZERO
      009974 CD 86 A9         [ 4] 4053         call SWAPP 
      009977 CD 85 51         [ 4] 4054         CALL STORE
      00997A CD A2 B4         [ 4] 4055         CALL FMOVE ; move definition to FLASH
      00997D CD 88 4C         [ 4] 4056         CALL QDUP 
      009980 CD 85 18         [ 4] 4057         CALL QBRAN 
      009983 99 8C                 4058         .word SET_RAMLAST   
      009985 CD 9D 5C         [ 4] 4059         call UPDATVP  ; don't update if variable kept in RAM.
      009988 CD A3 48         [ 4] 4060         CALL UPDATPTR
      00998B 81               [ 4] 4061         RET         
      00998C                       4062 SET_RAMLAST: 
      00998C CD 88 0E         [ 4] 4063         CALL LAST 
      00998F CD 85 63         [ 4] 4064         CALL AT 
      009992 CD 88 21         [ 4] 4065         CALL RAMLAST 
      009995 CC 85 51         [ 2] 4066         jp STORE  
                                   4067 
                                   4068 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4069 ;       CONSTANT  ( n -- ; <string> )
                                   4070 ;       Compile a new constant 
                                   4071 ;       n CONSTANT name 
                                   4072 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001918                       4073         _HEADER CONSTANT,8,"CONSTANT"
      009998 99 50                    1         .word LINK 
                           00191A     2         LINK=.
      00999A 08                       3         .byte 8  
      00999B 43 4F 4E 53 54 41 4E     4         .ascii "CONSTANT"
             54
      0099A3                          5         CONSTANT:
      0099A3 CD 92 6B         [ 4] 4074         CALL TOKEN
      0099A6 CD 97 A4         [ 4] 4075         CALL SNAME 
      0099A9 CD 98 35         [ 4] 4076         CALL OVERT 
      0099AC CD 95 F7         [ 4] 4077         CALL COMPI 
      0099AF 99 C3                 4078         .word DOCONST
      0099B1 CD 95 B2         [ 4] 4079         CALL COMMA 
      0099B4 CD A2 B4         [ 4] 4080         CALL FMOVE
      0099B7 CD 88 4C         [ 4] 4081         CALL QDUP 
      0099BA CD 85 18         [ 4] 4082         CALL QBRAN 
      0099BD 99 8C                 4083         .word SET_RAMLAST  
      0099BF CD A3 48         [ 4] 4084         CALL UPDATPTR  
      0099C2 81               [ 4] 4085 1$:     RET          
                                   4086 
                                   4087 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4088 ; CONSTANT runtime semantic 
                                   4089 ; doCONST  ( -- n )
                                   4090 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



                                   4091 ;       _HEADER DOCONST,7,"DOCONST"
      0099C3                       4092 DOCONST:
      0099C3 1D 00 02         [ 2] 4093         subw x,#CELLL
      0099C6 90 85            [ 2] 4094         popw y 
      0099C8 90 FE            [ 2] 4095         ldw y,(y) 
      0099CA FF               [ 2] 4096         ldw (x),y 
      0099CB 81               [ 4] 4097         ret 
                                   4098 
                                   4099 ;----------------------------------
                                   4100 ; create double constant 
                                   4101 ; 2CONSTANT ( d -- ; <string> )
                                   4102 ;----------------------------------
      00194C                       4103         _HEADER DCONST,9,"2CONSTANT"
      0099CC 99 9A                    1         .word LINK 
                           00194E     2         LINK=.
      0099CE 09                       3         .byte 9  
      0099CF 32 43 4F 4E 53 54 41     4         .ascii "2CONSTANT"
             4E 54
      0099D8                          5         DCONST:
      0099D8 CD 92 6B         [ 4] 4104         CALL TOKEN
      0099DB CD 97 A4         [ 4] 4105         CALL SNAME 
      0099DE CD 98 35         [ 4] 4106         CALL OVERT 
      0099E1 CD 95 F7         [ 4] 4107         CALL COMPI 
      0099E4 99 FB                 4108         .word DO_DCONST
      0099E6 CD 95 B2         [ 4] 4109         CALL COMMA
      0099E9 CD 95 B2         [ 4] 4110         CALL COMMA  
      0099EC CD A2 B4         [ 4] 4111         CALL FMOVE
      0099EF CD 88 4C         [ 4] 4112         CALL QDUP 
      0099F2 CD 85 18         [ 4] 4113         CALL QBRAN 
      0099F5 99 8C                 4114         .word SET_RAMLAST  
      0099F7 CD A3 48         [ 4] 4115         CALL UPDATPTR  
      0099FA 81               [ 4] 4116 1$:     RET          
                                   4117     
                                   4118 ;----------------------------------
                                   4119 ; runtime for DCONST 
                                   4120 ; stack double constant 
                                   4121 ; DO-DCONST ( -- d )
                                   4122 ;-----------------------------------
                                   4123 ;       _HEADER DO_DCONST,9,"DO-DCONST"
      0099FB                       4124 DO_DCONST:
      0099FB 90 85            [ 2] 4125     popw y 
      0099FD 90 BF 26         [ 2] 4126     ldw YTEMP,y 
      009A00 1D 00 04         [ 2] 4127     subw x,#2*CELLL 
      009A03 90 FE            [ 2] 4128     ldw y,(y)
      009A05 FF               [ 2] 4129     ldw (x),y 
      009A06 90 BE 26         [ 2] 4130     ldw y,YTEMP 
      009A09 90 EE 02         [ 2] 4131     ldw y,(2,y)
      009A0C EF 02            [ 2] 4132     ldw (2,x),y 
      009A0E 81               [ 4] 4133     ret 
                                   4134 
                                   4135 ;; Tools
                                   4136 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4137 ;       _TYPE   ( b u -- )
                                   4138 ;       Display a string. Filter
                                   4139 ;       non-printing characters.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



                                   4140 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00198F                       4141         _HEADER UTYPE,5,"_TYPE"
      009A0F 99 CE                    1         .word LINK 
                           001991     2         LINK=.
      009A11 05                       3         .byte 5  
      009A12 5F 54 59 50 45           4         .ascii "_TYPE"
      009A17                          5         UTYPE:
      009A17 CD 86 62         [ 4] 4142         CALL     TOR     ;start count down loop
      009A1A 20 0F            [ 2] 4143         JRA     UTYP2   ;skip first pass
      009A1C CD 86 99         [ 4] 4144 UTYP1:  CALL     DUPP
      009A1F CD 85 81         [ 4] 4145         CALL     CAT
      009A22 CD 8C AD         [ 4] 4146         CALL     TCHAR
      009A25 CD 84 B6         [ 4] 4147         CALL     EMIT    ;display only printable
      009A28 CD 8C 17         [ 4] 4148         CALL     ONEP    ;increment address
      009A2B CD 85 03         [ 4] 4149 UTYP2:  CALL     DONXT
      009A2E 9A 1C                 4150         .word      UTYP1   ;loop till done
      009A30 CC 86 8F         [ 2] 4151         JP     DROP
                                   4152 
                                   4153 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4154 ;       dm+     ( a u -- a )
                                   4155 ;       Dump u bytes from ,
                                   4156 ;       leaving a+u on  stack.
                                   4157 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0019B3                       4158         _HEADER DUMPP,3,"DM+"
      009A33 9A 11                    1         .word LINK 
                           0019B5     2         LINK=.
      009A35 03                       3         .byte 3  
      009A36 44 4D 2B                 4         .ascii "DM+"
      009A39                          5         DUMPP:
      009A39 CD 86 C1         [ 4] 4159         CALL     OVER
      009A3C CD 84 EF         [ 4] 4160         CALL     DOLIT
      009A3F 00 04                 4161         .word      4
      009A41 CD 90 5F         [ 4] 4162         CALL     UDOTR   ;display address
      009A44 CD 8F C7         [ 4] 4163         CALL     SPACE
      009A47 CD 86 62         [ 4] 4164         CALL     TOR     ;start count down loop
      009A4A 20 11            [ 2] 4165         JRA     PDUM2   ;skip first pass
      009A4C CD 86 99         [ 4] 4166 PDUM1:  CALL     DUPP
      009A4F CD 85 81         [ 4] 4167         CALL     CAT
      009A52 CD 84 EF         [ 4] 4168         CALL     DOLIT
      009A55 00 03                 4169         .word      3
      009A57 CD 90 5F         [ 4] 4170         CALL     UDOTR   ;display numeric data
      009A5A CD 8C 17         [ 4] 4171         CALL     ONEP    ;increment address
      009A5D CD 85 03         [ 4] 4172 PDUM2:  CALL     DONXT
      009A60 9A 4C                 4173         .word      PDUM1   ;loop till done
      009A62 81               [ 4] 4174         RET
                                   4175 
                                   4176 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4177 ;       DUMP    ( a u -- )
                                   4178 ;       Dump u bytes from a,
                                   4179 ;       in a formatted manner.
                                   4180 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0019E3                       4181         _HEADER DUMP,4,"DUMP"
      009A63 9A 35                    1         .word LINK 
                           0019E5     2         LINK=.
      009A65 04                       3         .byte 4  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



      009A66 44 55 4D 50              4         .ascii "DUMP"
      009A6A                          5         DUMP:
      009A6A CD 87 5F         [ 4] 4182         CALL     BASE
      009A6D CD 85 63         [ 4] 4183         CALL     AT
      009A70 CD 86 62         [ 4] 4184         CALL     TOR
      009A73 CD 8F 26         [ 4] 4185         CALL     HEX     ;save radix, set hex
      009A76 CD 84 EF         [ 4] 4186         CALL     DOLIT
      009A79 00 10                 4187         .word      16
      009A7B CD 8B 3D         [ 4] 4188         CALL     SLASH   ;change count to lines
      009A7E CD 86 62         [ 4] 4189         CALL     TOR     ;start count down loop
      009A81 CD 90 09         [ 4] 4190 DUMP1:  CALL     CR
      009A84 CD 84 EF         [ 4] 4191         CALL     DOLIT
      009A87 00 10                 4192         .word      16
      009A89 CD 88 A7         [ 4] 4193         CALL     DDUP
      009A8C CD 9A 39         [ 4] 4194         CALL     DUMPP   ;display numeric
      009A8F CD 88 5D         [ 4] 4195         CALL     ROT
      009A92 CD 88 5D         [ 4] 4196         CALL     ROT
      009A95 CD 8F C7         [ 4] 4197         CALL     SPACE
      009A98 CD 8F C7         [ 4] 4198         CALL     SPACE
      009A9B CD 9A 17         [ 4] 4199         CALL     UTYPE   ;display printable characters
      009A9E CD 85 03         [ 4] 4200         CALL     DONXT
      009AA1 9A 81                 4201         .word      DUMP1   ;loop till done
      009AA3 CD 86 8F         [ 4] 4202 DUMP3:  CALL     DROP
      009AA6 CD 85 B4         [ 4] 4203         CALL     RFROM
      009AA9 CD 87 5F         [ 4] 4204         CALL     BASE
      009AAC CC 85 51         [ 2] 4205         JP     STORE   ;restore radix
                                   4206 
                                   4207 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4208 ;       .S      ( ... -- ... )
                                   4209 ;        Display  contents of stack.
                                   4210 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001A2F                       4211         _HEADER DOTS,2,".S"
      009AAF 9A 65                    1         .word LINK 
                           001A31     2         LINK=.
      009AB1 02                       3         .byte 2  
      009AB2 2E 53                    4         .ascii ".S"
      009AB4                          5         DOTS:
      009AB4 CD 90 09         [ 4] 4212         CALL     CR
      009AB7 CD 8C C5         [ 4] 4213         CALL     DEPTH   ;stack depth
      009ABA CD 86 62         [ 4] 4214         CALL     TOR     ;start count down loop
      009ABD 20 09            [ 2] 4215         JRA     DOTS2   ;skip first pass
      009ABF CD 85 C5         [ 4] 4216 DOTS1:  CALL     RAT
      009AC2 CD 8C DC         [ 4] 4217 	CALL     PICK
      009AC5 CD 90 B0         [ 4] 4218         CALL     DOT     ;index stack, display contents
      009AC8 CD 85 03         [ 4] 4219 DOTS2:  CALL     DONXT
      009ACB 9A BF                 4220         .word      DOTS1   ;loop till done
      009ACD CD 90 36         [ 4] 4221         CALL     DOTQP
      009AD0 05                    4222         .byte      5
      009AD1 20 3C 73 70 20        4223         .ascii     " <sp "
      009AD6 81               [ 4] 4224         RET
                                   4225 
                                   4226 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4227 ;       >NAME   ( ca -- na | F )
                                   4228 ;       Convert code address
                                   4229 ;       to a name address.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



                                   4230 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001A57                       4231         _HEADER TNAME,5,">NAME"
      009AD7 9A B1                    1         .word LINK 
                           001A59     2         LINK=.
      009AD9 05                       3         .byte 5  
      009ADA 3E 4E 41 4D 45           4         .ascii ">NAME"
      009ADF                          5         TNAME:
      009ADF CD 87 E2         [ 4] 4232         CALL     CNTXT   ;vocabulary link
      009AE2 CD 85 63         [ 4] 4233 TNAM2:  CALL     AT
      009AE5 CD 86 99         [ 4] 4234         CALL     DUPP    ;?last word in a vocabulary
      009AE8 CD 85 18         [ 4] 4235         CALL     QBRAN
      009AEB 9B 06                 4236         .word      TNAM4
      009AED CD 88 A7         [ 4] 4237         CALL     DDUP
      009AF0 CD 92 79         [ 4] 4238         CALL     NAMET
      009AF3 CD 87 1F         [ 4] 4239         CALL     XORR    ;compare
      009AF6 CD 85 18         [ 4] 4240         CALL     QBRAN
      009AF9 9B 00                 4241         .word      TNAM3
      009AFB CD 8B FB         [ 4] 4242         CALL     CELLM   ;continue with next word
      009AFE 20 E2            [ 2] 4243         JRA     TNAM2
      009B00 CD 86 A9         [ 4] 4244 TNAM3:  CALL     SWAPP
      009B03 CC 86 8F         [ 2] 4245         JP     DROP
      009B06 CD 88 9C         [ 4] 4246 TNAM4:  CALL     DDROP
      009B09 CC 8C 83         [ 2] 4247         JP     ZERO
                                   4248 
                                   4249 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4250 ;       .ID     ( na -- )
                                   4251 ;        Display  name at address.
                                   4252 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001A8C                       4253         _HEADER DOTID,3,".ID"
      009B0C 9A D9                    1         .word LINK 
                           001A8E     2         LINK=.
      009B0E 03                       3         .byte 3  
      009B0F 2E 49 44                 4         .ascii ".ID"
      009B12                          5         DOTID:
      009B12 CD 88 4C         [ 4] 4254         CALL     QDUP    ;if zero no name
      009B15 CD 85 18         [ 4] 4255         CALL     QBRAN
      009B18 9B 28                 4256         .word      DOTI1
      009B1A CD 8D 46         [ 4] 4257         CALL     COUNT
      009B1D CD 84 EF         [ 4] 4258         CALL     DOLIT
      009B20 00 1F                 4259         .word      0x1F
      009B22 CD 86 F6         [ 4] 4260         CALL     ANDD    ;mask lexicon bits
      009B25 CC 9A 17         [ 2] 4261         JP     UTYPE
      009B28 CD 90 36         [ 4] 4262 DOTI1:  CALL     DOTQP
      009B2B 09                    4263         .byte      9
      009B2C 20 6E 6F 4E 61 6D 65  4264         .ascii     " noName"
      009B33 81               [ 4] 4265         RET
                                   4266 
                           000000  4267 WANT_SEE=0
                           000000  4268 .if WANT_SEE 
                                   4269 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4270 ;       SEE     ( -- ; <string> )
                                   4271 ;       A simple decompiler.
                                   4272 ;       Updated for byte machines.
                                   4273 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4274         _HEADER SEE,3,"SEE"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



                                   4275         CALL     TICK    ;starting address
                                   4276         CALL     CR
                                   4277         CALL     ONEM
                                   4278 SEE1:   CALL     ONEP
                                   4279         CALL     DUPP
                                   4280         CALL     AT
                                   4281         CALL     DUPP
                                   4282         CALL     QBRAN
                                   4283         .word    SEE2
                                   4284         CALL     TNAME   ;?is it a name
                                   4285 SEE2:   CALL     QDUP    ;name address or zero
                                   4286         CALL     QBRAN
                                   4287         .word    SEE3
                                   4288         CALL     SPACE
                                   4289         CALL     DOTID   ;display name
                                   4290         CALL     ONEP
                                   4291         JRA      SEE4
                                   4292 SEE3:   CALL     DUPP
                                   4293         CALL     CAT
                                   4294         CALL     UDOT    ;display number
                                   4295 SEE4:   CALL     NUFQ    ;user control
                                   4296         CALL     QBRAN
                                   4297         .word    SEE1
                                   4298         JP     DROP
                                   4299 .endif ; WANT_SEE 
                                   4300 
                                   4301 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4302 ;       WORDS   ( -- )
                                   4303 ;       Display names in vocabulary.
                                   4304 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001AB4                       4305         _HEADER WORDS,5,"WORDS"
      009B34 9B 0E                    1         .word LINK 
                           001AB6     2         LINK=.
      009B36 05                       3         .byte 5  
      009B37 57 4F 52 44 53           4         .ascii "WORDS"
      009B3C                          5         WORDS:
      009B3C CD 90 09         [ 4] 4306         CALL     CR
      009B3F CD 87 E2         [ 4] 4307         CALL     CNTXT   ;only in context
      009B42 CD 85 63         [ 4] 4308 WORS1:  CALL     AT
      009B45 CD 88 4C         [ 4] 4309         CALL     QDUP    ;?at end of list
      009B48 CD 85 18         [ 4] 4310         CALL     QBRAN
      009B4B 9B 5E                 4311         .word      WORS2
      009B4D CD 86 99         [ 4] 4312         CALL     DUPP
      009B50 CD 8F C7         [ 4] 4313         CALL     SPACE
      009B53 CD 9B 12         [ 4] 4314         CALL     DOTID   ;display a name
      009B56 CD 8B FB         [ 4] 4315         CALL     CELLM
      009B59 CD 85 34         [ 4] 4316         CALL     BRAN
      009B5C 9B 42                 4317         .word      WORS1
      009B5E 81               [ 4] 4318 WORS2:  RET
                                   4319 
                                   4320         
                                   4321 ;; Hardware reset
                                   4322 
                                   4323 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4324 ;  COPYRIGTH
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



                                   4325 ; print copyright notice 
                                   4326 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      009B5F                       4327 COPYRIGHT:
      009B5F CD 90 36         [ 4] 4328     CALL DOTQP 
      009B62 21                    4329     .byte 33 
      009B63 4A 61 63 71 75 65 73  4330     .ascii "Jacques Deschenes, Copyright 2021"
             20 44 65 73 63 68 65
             6E 65 73 2C 20 43 6F
             70 79 72 69 67 68 74
             20 32 30 32 31
      009B84 CC 90 09         [ 2] 4331     JP CR 
                                   4332 
                                   4333 
                                   4334 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4335 ;  PRT_LICENCE 
                                   4336 ;  print GPLV2 licence 
                                   4337 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      009B87                       4338 PRT_LICENCE:
      009B87 CD 90 36         [ 4] 4339         CALL DOTQP 
      009B8A 0F                    4340         .byte  15 
      009B8B 4C 49 43 45 4E 43 45  4341         .ascii "LICENCE GPLV3\r\n"
             20 47 50 4C 56 33 0D
             0A
      009B9A 81               [ 4] 4342         RET 
                                   4343 
                                   4344 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4345 ;    PRINT_VERSION ( c1 c2 -- )
                                   4346 ;    c2 minor 
                                   4347 ;    c1 major 
                                   4348 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      009B9B                       4349 PRINT_VERSION:
      009B9B CD 90 36         [ 4] 4350      CALL DOTQP 
      009B9E 09                    4351      .byte 9
      009B9F 20 76 65 72 73 69 6F  4352      .ascii " version "
             6E 20
      009BA8 CD 8E 8B         [ 4] 4353      CALL BDIGS 
      009BAB CD 8E C5         [ 4] 4354      CALL DIGS 
      009BAE CD 8E C5         [ 4] 4355      CALL DIGS 
      001B31                       4356      _DOLIT '.' 
      009BB1 CD 84 EF         [ 4]    1     CALL DOLIT 
      009BB4 00 2E                    2     .word '.' 
      009BB6 CD 8E 9B         [ 4] 4357      CALL HOLD 
      001B39                       4358      _DROP 
      009BB9 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      009BBC CD 8E C5         [ 4] 4359      CALL DIGS 
      009BBF CD 8E F0         [ 4] 4360      CALL EDIGS 
      009BC2 CD 8F F1         [ 4] 4361      CALL TYPES 
      009BC5 81               [ 4] 4362      RET 
                                   4363 
                                   4364 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4365 ;       hi      ( -- )
                                   4366 ;       Display sign-on message.
                                   4367 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001B46                       4368         _HEADER HI,2,"HI"
      009BC6 9B 36                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



                           001B48     2         LINK=.
      009BC8 02                       3         .byte 2  
      009BC9 48 49                    4         .ascii "HI"
      009BCB                          5         HI:
      009BCB CD 90 09         [ 4] 4369         CALL     CR
      009BCE CD 90 36         [ 4] 4370         CALL     DOTQP   
      009BD1 0A                    4371         .byte      10
      009BD2 73 74 6D 38 65 46 6F  4372         .ascii     "stm8eForth"
             72 74 68
      001B5C                       4373 	_DOLIT VER 
      009BDC CD 84 EF         [ 4]    1     CALL DOLIT 
      009BDF 00 04                    2     .word VER 
      001B61                       4374         _DOLIT EXT 
      009BE1 CD 84 EF         [ 4]    1     CALL DOLIT 
      009BE4 00 00                    2     .word EXT 
      009BE6 CD 9B 9B         [ 4] 4375         CALL PRINT_VERSION 
      009BE9 CD 90 36         [ 4] 4376         CALL    DOTQP
                           000001  4377 .if NUCLEO          
      009BEC 12                    4378         .byte 18
      009BED 20 6F 6E 20 4E 55 43  4379         .ascii  " on NUCLEO-8S208RB"
             4C 45 4F 2D 38 53 32
             30 38 52 42
                                   4380 .endif
                           000000  4381 .if DISCOVERY
                                   4382         .byte 19
                                   4383         .ascii  " on STM8S-DISCOVERY"
                                   4384 .endif
                           000000  4385 .if DOORBELL
                                   4386         .byte 16
                                   4387         .ascii " on stm8s105k6b6"
                                   4388 .endif
      009BFF CC 90 09         [ 2] 4389         JP     CR
                                   4390 
                           000000  4391 WANT_DEBUG=0
                           000000  4392 .if WANT_DEBUG 
                                   4393 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4394 ;       DEBUG      ( -- )
                                   4395 ;       Display sign-on message.
                                   4396 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4397         _HEADER DEBUG,5,"DEBUG"
                                   4398 	CALL DOLIT
                                   4399 	.word 0x65
                                   4400 	CALL EMIT
                                   4401 	CALL ZERO
                                   4402  	CALL ZLESS 
                                   4403 	CALL DOLIT
                                   4404 	.word 0xFFFE
                                   4405 	CALL ZLESS 
                                   4406 	CALL UPLUS 
                                   4407  	_DROP 
                                   4408 	CALL DOLIT
                                   4409 	.word 3
                                   4410 	CALL UPLUS 
                                   4411 	CALL UPLUS 
                                   4412  	_DROP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



                                   4413 	CALL DOLIT
                                   4414 	.word 0x43
                                   4415 	CALL UPLUS 
                                   4416  	_DROP
                                   4417 	CALL EMIT
                                   4418 	CALL DOLIT
                                   4419 	.word 0x4F
                                   4420 	CALL DOLIT
                                   4421 	.word 0x6F
                                   4422  	CALL XORR
                                   4423 	CALL DOLIT
                                   4424 	.word 0xF0
                                   4425  	CALL ANDD
                                   4426 	CALL DOLIT
                                   4427 	.word 0x4F
                                   4428  	CALL ORR
                                   4429 	CALL EMIT
                                   4430 	CALL DOLIT
                                   4431 	.word 8
                                   4432 	CALL DOLIT
                                   4433 	.word 6
                                   4434  	CALL SWAPP
                                   4435 	CALL OVER
                                   4436 	CALL XORR
                                   4437 	CALL DOLIT
                                   4438 	.word 3
                                   4439 	CALL ANDD 
                                   4440 	CALL ANDD
                                   4441 	CALL DOLIT
                                   4442 	.word 0x70
                                   4443 	CALL UPLUS 
                                   4444 	_DROP
                                   4445 	CALL EMIT
                                   4446 	CALL ZERO
                                   4447 	CALL QBRAN
                                   4448 	.word DEBUG1
                                   4449 	CALL DOLIT
                                   4450 	.word 0x3F
                                   4451 DEBUG1:
                                   4452 	CALL DOLIT
                                   4453 	.word 0xFFFF
                                   4454 	CALL QBRAN
                                   4455 	.word DEBUG2
                                   4456 	CALL DOLIT
                                   4457 	.word 0x74
                                   4458 	CALL BRAN
                                   4459 	.word DEBUG3
                                   4460 DEBUG2:
                                   4461 	CALL DOLIT
                                   4462 	.word 0x21
                                   4463 DEBUG3:
                                   4464 	CALL EMIT
                                   4465 	CALL DOLIT
                                   4466 	.word 0x68
                                   4467 	CALL DOLIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



                                   4468 	.word 0x80
                                   4469 	CALL STORE
                                   4470 	CALL DOLIT
                                   4471 	.word 0x80
                                   4472 	CALL AT
                                   4473 	CALL EMIT
                                   4474 	CALL DOLIT
                                   4475 	.word 0x4D
                                   4476 	CALL TOR
                                   4477 	CALL RAT
                                   4478 	CALL RFROM
                                   4479 	CALL ANDD
                                   4480 	CALL EMIT
                                   4481 	CALL DOLIT
                                   4482 	.word 0x61
                                   4483 	CALL DOLIT
                                   4484 	.word 0xA
                                   4485 	CALL TOR
                                   4486 DEBUG4:
                                   4487 	CALL ONE
                                   4488 	CALL UPLUS 
                                   4489 	_DROP
                                   4490 	CALL DONXT
                                   4491 	.word DEBUG4
                                   4492 	CALL EMIT
                                   4493 	CALL DOLIT
                                   4494 	.word 0x656D
                                   4495 	CALL DOLIT
                                   4496 	.word 0x100
                                   4497 	CALL UMSTA
                                   4498 	CALL SWAPP
                                   4499 	CALL DOLIT
                                   4500 	.word 0x100
                                   4501 	CALL UMSTA
                                   4502 	CALL SWAPP 
                                   4503 	_DROP
                                   4504 	CALL EMIT
                                   4505 	CALL EMIT
                                   4506 	CALL DOLIT
                                   4507 	.word 0x2043
                                   4508 	CALL ZERO
                                   4509 	CALL DOLIT
                                   4510 	.word 0x100
                                   4511 	CALL UMMOD
                                   4512 	CALL EMIT
                                   4513 	CALL EMIT
                                   4514 	;JP ORIG
                                   4515 	RET
                                   4516 .endif ; WANT_DEBUG 
                                   4517 
                                   4518 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4519 ;       'BOOT   ( -- a )
                                   4520 ;       The application startup vector.
                                   4521 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001B82                       4522         _HEADER TBOOT,5,"'BOOT"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      009C02 9B C8                    1         .word LINK 
                           001B84     2         LINK=.
      009C04 05                       3         .byte 5  
      009C05 27 42 4F 4F 54           4         .ascii "'BOOT"
      009C0A                          5         TBOOT:
      009C0A CD 87 4F         [ 4] 4523         CALL     DOVAR
      009C0D 40 02                 4524         .word    APP_RUN      ;application to boot
                                   4525 
                                   4526 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4527 ;       COLD    ( -- )
                                   4528 ;       The hilevel cold start s=ence.
                                   4529 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001B8F                       4530         _HEADER COLD,4,"COLD"
      009C0F 9C 04                    1         .word LINK 
                           001B91     2         LINK=.
      009C11 04                       3         .byte 4  
      009C12 43 4F 4C 44              4         .ascii "COLD"
      009C16                          5         COLD:
                           000000  4531 .if WANT_DEBUG
                                   4532         CALL DEBUG
                                   4533 .endif ; WANT_DEBUG
      009C16 CD 84 EF         [ 4] 4534 COLD1:  CALL     DOLIT
      009C19 80 AB                 4535         .word      UZERO
      009C1B CD 84 EF         [ 4] 4536 	CALL     DOLIT
      009C1E 00 06                 4537         .word      UPP
      009C20 CD 84 EF         [ 4] 4538         CALL     DOLIT
      009C23 00 1C                 4539 	.word      UEND-UZERO
      009C25 CD 8D AA         [ 4] 4540         CALL     CMOVE   ;initialize user area
                           000001  4541 .if WANT_FLOAT 
      009C28 CD AC C7         [ 4] 4542         CALL    FINIT 
                                   4543 .endif 
                                   4544 ; if APP_RUN==0 initialize with ca de 'hi'  
      009C2B 90 CE 40 02      [ 2] 4545         ldw y,APP_RUN 
      009C2F 26 0B            [ 1] 4546         jrne 0$
      009C31 1D 00 02         [ 2] 4547         subw x,#CELLL 
      009C34 90 AE 9B CB      [ 2] 4548         ldw y,#HI  
      009C38 FF               [ 2] 4549         ldw (x),y
      009C39 CD 9D 34         [ 4] 4550         call UPDATRUN 
      009C3C                       4551 0$:        
                                   4552 ; update LAST with APP_LAST 
                                   4553 ; if APP_LAST > LAST else do the opposite
      009C3C 90 CE 40 00      [ 2] 4554         ldw y,APP_LAST 
      009C40 90 B3 1C         [ 2] 4555         cpw y,ULAST 
      009C43 22 05            [ 1] 4556         jrugt 1$ 
                                   4557 ; save LAST at APP_LAST  
      009C45 CD 9D 1C         [ 4] 4558         call UPDATLAST 
      009C48 20 06            [ 2] 4559         jra 2$
      009C4A                       4560 1$: ; update LAST with APP_LAST 
      009C4A 90 BF 1C         [ 2] 4561         ldw ULAST,y
      009C4D 90 BF 16         [ 2] 4562         ldw UCNTXT,y
      009C50                       4563 2$:  
                                   4564 ; update APP_CP if < app_space 
      009C50 90 CE 40 04      [ 2] 4565         ldw y,APP_CP  
      009C54 90 B3 1A         [ 2] 4566         cpw y,UCP   
      009C57 24 06            [ 1] 4567         jruge 3$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



      009C59 CD 9D 45         [ 4] 4568         call UPDATCP
      009C5C 90 BE 1A         [ 2] 4569         ldw y,UCP   
      009C5F                       4570 3$:
      009C5F 90 BF 1A         [ 2] 4571         ldw UCP,y                 
                                   4572 ; update UVP with APP_VP  
                                   4573 ; if APP_VP>UVP else do the opposite 
      009C62 90 CE 40 06      [ 2] 4574         ldw y,APP_VP 
      009C66 90 B3 18         [ 2] 4575         cpw y,UVP 
      009C69 22 05            [ 1] 4576         jrugt 4$
      009C6B CD 9D 5C         [ 4] 4577         call UPDATVP 
      009C6E 20 03            [ 2] 4578         jra 6$
      009C70                       4579 4$: ; update UVP with APP_VP 
      009C70 90 BF 18         [ 2] 4580         ldw UVP,y 
      009C73                       4581 6$:      
      009C73 CD 95 5C         [ 4] 4582         CALL     PRESE   ;initialize data stack and TIB
      009C76 CD 9C 0A         [ 4] 4583         CALL     TBOOT
      009C79 CD 8D 93         [ 4] 4584         CALL     ATEXE   ;application boot
      009C7C CD 98 35         [ 4] 4585         CALL     OVERT
      009C7F CC 95 79         [ 2] 4586         JP     QUIT    ;start interpretation
                                   4587 
                                   4588 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



                                   4589         .include "flash.asm"
                                      1 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                      2 ;; Copyright Jacques Deschênes 2019,2020,2021 
                                      3 ;; This file is part of stm32_eforth  
                                      4 ;;
                                      5 ;;     stm8_eforth is free software: you can redistribute it and/or modify
                                      6 ;;     it under the terms of the GNU General Public License as published by
                                      7 ;;     the Free Software Foundation, either version 3 of the License, or
                                      8 ;;     (at your option) any later version.
                                      9 ;;
                                     10 ;;     stm32_eforth is distributed in the hope that it will be useful,
                                     11 ;;     but WITHOUT ANY WARRANTY;; without even the implied warranty of
                                     12 ;;     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                                     13 ;;     GNU General Public License for more details.
                                     14 ;;
                                     15 ;;     You should have received a copy of the GNU General Public License
                                     16 ;;     along with stm32_eforth.  If not, see <http:;;www.gnu.org/licenses/>.
                                     17 ;;;;
                                     18 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     19 
                                     20 
                                     21 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     22 ;  routines to write to FLASH, EEPROM 
                                     23 ;  and OPTION 
                                     24 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     25 
                                     26 
                                     27 ;--------------------------------
                                     28 ; initialize FPTR 
                                     29 ; FP!  ( ud -- )
                                     30 ;---------------------------------
      009C82 9C 11                   31     .word LINK 
                           001C04    32     LINK=.
      009C84 03                      33     .byte 3 
      009C85 46 50 21                34     .ascii "FP!"
      009C88                         35 FPSTOR:
      009C88 90 93            [ 1]   36     ldw y,x
      009C8A 90 FE            [ 2]   37     ldw y,(y)
      009C8C 90 9F            [ 1]   38     ld a,yl 
      009C8E B7 34            [ 1]   39     ld FPTR,a 
      009C90 1C 00 02         [ 2]   40     addw x,#CELLL 
      009C93 90 93            [ 1]   41     ldw y,x 
      009C95 90 FE            [ 2]   42     ldw y,(y)
      009C97 90 BF 35         [ 2]   43     ldw PTR16,y
      009C9A 1C 00 02         [ 2]   44     addw x,#CELLL 
      009C9D 81               [ 4]   45     ret 
                                     46 
                                     47 ;-----------------------------------
                                     48 ; return EEPROM base address 
                                     49 ; as a double 
                                     50 ;  EEPROM  ( -- ud )
                                     51 ;-----------------------------------
      009C9E 9C 84                   52     .word LINK 
                           001C20    53 LINK=.
      009CA0 06                      54     .byte 6 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



      009CA1 45 45 50 52 4F 4D       55     .ascii "EEPROM"
      009CA7                         56 EEPROM: 
      009CA7 90 AE 40 00      [ 2]   57     ldw y,#EEPROM_BASE
      009CAB 1D 00 04         [ 2]   58     subw x,#2*CELLL 
      009CAE EF 02            [ 2]   59     ldw (2,x),y 
      009CB0 90 5F            [ 1]   60     clrw y 
      009CB2 FF               [ 2]   61     ldw (x),y 
      009CB3 81               [ 4]   62     ret
                                     63 
                                     64 ;---------------------------------
                                     65 ; return APP_LAST pointer as double
                                     66 ; EEP-LAST ( -- ud )
                                     67 ;---------------------------------
      009CB4 9C A0                   68 	.word LINK 
                           001C36    69 	LINK=.
      009CB6 08                      70 	.byte 8 
      009CB7 45 45 50 2D 4C 41 53    71 	.ascii "EEP-LAST"
             54
      009CBF                         72 EEPLAST:
      009CBF 1D 00 04         [ 2]   73 	subw x,#2*CELLL 
      009CC2 90 AE 40 00      [ 2]   74 	ldw y,#APP_LAST 
      009CC6 EF 02            [ 2]   75 	ldw (2,x),y 
      009CC8 90 5F            [ 1]   76 	clrw y 
      009CCA FF               [ 2]   77 	ldw (x),y 
      009CCB 81               [ 4]   78 	ret 
                                     79 
                                     80 ;----------------------------------
                                     81 ; return APP_RUN pointer as double	
                                     82 ; EEP-RUN ( -- ud )
                                     83 ;-----------------------------------
      009CCC 9C B6                   84 	.word LINK 
                           001C4E    85 	LINK=.
      009CCE 07                      86 	.byte 7
      009CCF 45 45 50 2D 52 55 4E    87 	.ascii "EEP-RUN"
      009CD6                         88 EEPRUN:
      009CD6 1D 00 04         [ 2]   89 	subw x,#2*CELLL 
      009CD9 90 AE 40 02      [ 2]   90 	ldw y,#APP_RUN 
      009CDD EF 02            [ 2]   91 	ldw (2,x),y 
      009CDF 90 5F            [ 1]   92 	clrw y 
      009CE1 FF               [ 2]   93 	ldw (x),y 
      009CE2 81               [ 4]   94 	ret 
                                     95 
                                     96 ;------------------------------------
                                     97 ; return APP_CP pointer as double 
                                     98 ; EEP-CP ( -- ud )
                                     99 ;------------------------------------
      009CE3 9C CE                  100 	.word LINK
                           001C65   101 	LINK=.
      009CE5 06                     102 	.byte 6 
      009CE6 45 45 50 2D 43 50      103 	.ascii "EEP-CP"
      009CEC                        104 EEPCP:
      009CEC 1D 00 04         [ 2]  105 	subw x,#2*CELLL 
      009CEF 90 AE 40 04      [ 2]  106 	ldw y,#APP_CP  
      009CF3 EF 02            [ 2]  107 	ldw (2,x),y 
      009CF5 90 5F            [ 1]  108 	clrw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



      009CF7 FF               [ 2]  109 	ldw (x),y 
      009CF8 81               [ 4]  110 	ret 
                                    111 
                                    112 ;------------------------------------
                                    113 ; return APP_VP pointer as double 
                                    114 ; EEP-VP ( -- ud )
                                    115 ;-------------------------------------
      009CF9 9C E5                  116 	.word LINK
                           001C7B   117 	LINK=.
      009CFB 06                     118 	.byte 6
      009CFC 45 45 50 2D 56 50      119 	.ascii "EEP-VP"
      009D02                        120 EEPVP:
      009D02 1D 00 04         [ 2]  121 	subw x,#2*CELLL 
      009D05 90 AE 40 06      [ 2]  122 	ldw y,#APP_VP  
      009D09 EF 02            [ 2]  123 	ldw (2,x),y 
      009D0B 90 5F            [ 1]  124 	clrw y 
      009D0D FF               [ 2]  125 	ldw (x),y 
      009D0E 81               [ 4]  126 	ret 
                                    127 
                                    128 ;----------------------------------
                                    129 ; update APP_LAST with LAST 
                                    130 ; UPDAT-LAST ( -- )
                                    131 ;----------------------------------
      009D0F 9C FB                  132 	.word LINK 
                           001C91   133 	LINK=.
      009D11 0A                     134 	.byte 10
      009D12 55 50 44 41 54 2D 4C   135 	.ascii "UPDAT-LAST"
             41 53 54
      009D1C                        136 UPDATLAST:
      009D1C CD 88 0E         [ 4]  137 	call LAST
      009D1F CD 85 63         [ 4]  138 	call AT  
      009D22 CD 9C BF         [ 4]  139 	call EEPLAST
      009D25 CC 9F 12         [ 2]  140 	jp EESTORE 
                                    141 
                                    142 ;---------------------------------
                                    143 ; update APP_RUN 
                                    144 ; UPDAT-RUN ( a -- )
                                    145 ;---------------------------------
      009D28 9D 11                  146 	.word LINK
                           001CAA   147 	LINK=.
      009D2A 09                     148 	.byte 9
      009D2B 55 50 44 41 54 2D 52   149 	.ascii "UPDAT-RUN"
             55 4E
      009D34                        150 UPDATRUN:
      009D34 CD 9C D6         [ 4]  151 	call EEPRUN
      009D37 CC 9F 12         [ 2]  152 	jp EESTORE 
                                    153 	
                                    154 ;---------------------------------
                                    155 ; update APP_CP with CP 
                                    156 ; UPDAT-CP ( -- )
                                    157 ;---------------------------------
      009D3A 9D 2A                  158 	.word LINK 
                           001CBC   159 	LINK=.
      009D3C 08                     160 	.byte 8 
      009D3D 55 50 44 41 54 2D 43   161 	.ascii "UPDAT-CP"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal  50-Bits]



             50
      009D45                        162 UPDATCP:
      009D45 CD 87 FE         [ 4]  163 	call CPP 
      009D48 CD 85 63         [ 4]  164 	call AT 
      009D4B CD 9C EC         [ 4]  165 	call EEPCP 
      009D4E CC 9F 12         [ 2]  166 	jp EESTORE 
                                    167 
                                    168 ;----------------------------------
                                    169 ; update APP_VP with VP 
                                    170 ; UPDAT-VP ( -- )
                                    171 ;----------------------------------
      009D51 9D 3C                  172 	.word LINK
                           001CD3   173 	LINK=.
      009D53 08                     174 	.byte 8 
      009D54 55 50 44 41 54 2D 56   175 	.ascii "UPDAT-VP" 
             50
      009D5C                        176 UPDATVP:
      009D5C CD 87 F0         [ 4]  177 	call VPP 
      009D5F CD 85 63         [ 4]  178 	call AT
      009D62 CD 9D 02         [ 4]  179 	call EEPVP 
      009D65 CC 9F 12         [ 2]  180 	jp EESTORE
                                    181 	
                           000001   182 .if NUCLEO
                                    183 ;----------------------------------
                                    184 ; fetch integer at address over 65535
                                    185 ;  F@   ( ud -- n )
                                    186 ;----------------------------------
      009D68 9D 53                  187     .word LINK 
                           001CEA   188 LINK=.
      009D6A 02                     189     .byte 2
      009D6B 46 40                  190     .ascii "F@"
      009D6D                        191 FARAT:
      009D6D CD 9C 88         [ 4]  192     call FPSTOR
      009D70 CC 9E 35         [ 2]  193 	jp EE_READ 
                                    194 
                                    195 
                                    196 ;-------------------------------------
                                    197 ; fetch C at address over 65535 
                                    198 ; FC@ ( ud -- c)
                                    199 ;-------------------------------------
      009D73 9D 6A                  200     .word LINK
                           001CF5   201     LINK=.
      009D75 03                     202     .byte 3 
      009D76 46 43 40               203     .ascii "FC@" 
      009D79                        204 FARCAT:
      009D79 CD 9C 88         [ 4]  205     call FPSTOR
      009D7C CC 9E 57         [ 2]  206 	jp EE_CREAD  
                                    207 .endif ; NUCLEO 
                                    208 
                                    209 ;----------------------------------
                                    210 ; UNLOCK EEPROM/OPT for writing/erasing
                                    211 ; wait endlessly for FLASH_IAPSR_DUL bit.
                                    212 ;  UNLKEE   ( -- )
                                    213 ;----------------------------------
      009D7F 9D 75                  214     .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



                           001D01   215 LINK=.
      009D81 06                     216     .byte 6 
      009D82 55 4E 4C 4B 45 45      217     .ascii "UNLKEE"
      009D88                        218 UNLKEE:
      009D88 35 00 50 5B      [ 1]  219 	mov FLASH_CR2,#0 
      009D8C 35 FF 50 5C      [ 1]  220 	mov FLASH_NCR2,#0xFF 
      009D90 35 AE 50 64      [ 1]  221 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      009D94 35 56 50 64      [ 1]  222     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      009D98 72 07 50 5F FB   [ 2]  223 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      009D9D 81               [ 4]  224 	ret
                                    225 
                                    226 ;----------------------------------
                                    227 ; UNLOCK FLASH for writing/erasing
                                    228 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                    229 ; UNLKFL  ( -- )
                                    230 ;----------------------------------
      009D9E 9D 81                  231     .word LINK 
                           001D20   232 LINK=. 
      009DA0 06                     233     .byte 6 
      009DA1 55 4E 4C 4B 46 4C      234     .ascii "UNLKFL"    
      009DA7                        235 UNLKFL:
      009DA7 35 00 50 5B      [ 1]  236 	mov FLASH_CR2,#0 
      009DAB 35 FF 50 5C      [ 1]  237 	mov FLASH_NCR2,#0xFF 
      009DAF 35 56 50 62      [ 1]  238 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      009DB3 35 AE 50 62      [ 1]  239 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      009DB7 72 03 50 5F FB   [ 2]  240 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      009DBC 81               [ 4]  241 	ret
                                    242 
                                    243 ;-----------------------------
                                    244 ; UNLOCK FLASH or EEPROM 
                                    245 ; according to FPTR address 
                                    246 ;  UNLOCK ( -- )
                                    247 ;-----------------------------
      009DBD 9D A0                  248 	.word LINK 
                           001D3F   249 	LINK=.
      009DBF 06                     250 	.byte 6
      009DC0 55 4E 4C 4F 43 4B      251 	.ascii "UNLOCK"
      009DC6                        252 UNLOCK:
                                    253 ; put addr[15:0] in Y, for bounds check.
      009DC6 90 BE 35         [ 2]  254 	ldw y,PTR16   ; Y=addr15:0
                                    255 ; check addr[23:16], if <> 0 then it is extened flash memory
      009DC9 3D 34            [ 1]  256 	tnz FPTR 
      009DCB 26 16            [ 1]  257 	jrne 4$
      009DCD 90 A3 80 00      [ 2]  258     cpw y,#FLASH_BASE
      009DD1 24 10            [ 1]  259     jruge 4$
      009DD3 90 A3 40 00      [ 2]  260 	cpw y,#EEPROM_BASE  
      009DD7 25 0D            [ 1]  261     jrult 9$
      009DD9 90 A3 48 7F      [ 2]  262 	cpw y,#OPTION_END 
      009DDD 22 07            [ 1]  263 	jrugt 9$
      009DDF CD 9D 88         [ 4]  264 	call UNLKEE
      009DE2 81               [ 4]  265 	ret 
      009DE3 CD 9D A7         [ 4]  266 4$: call UNLKFL
      009DE6 81               [ 4]  267 9$: ret 
                                    268 
                                    269 ;-------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



                                    270 ; LOCK write access to 
                                    271 ; FLASH and EEPROM 
                                    272 ; LOCK ( -- )
                                    273 ;-------------------------
      009DE7 9D BF                  274 	.word LINK 
                           001D69   275 	LINK=.
      009DE9 04                     276 	.byte 4 
      009DEA 4C 4F 43 4B            277 	.ascii "LOCK" 
      009DEE                        278 LOCK: 
      009DEE 72 13 50 5F      [ 1]  279 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      009DF2 72 17 50 5F      [ 1]  280 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009DF6 81               [ 4]  281 	ret 
                                    282 
                                    283 ;-------------------------
                                    284 ; increment FPTR 
                                    285 ; INC-FPTR ( -- )
                                    286 ;-------------------------
      009DF7 9D E9                  287 	.word LINK 
                           001D79   288 	LINK=. 
      009DF9 08                     289 	.byte 8 
      009DFA 49 4E 43 2D 46 50 54   290 	.ascii "INC-FPTR" 
             52
      009E02                        291 INC_FPTR:
      009E02 3C 36            [ 1]  292 	inc PTR8 
      009E04 26 0C            [ 1]  293 	jrne 1$
      009E06 90 89            [ 2]  294 	pushw y 
      009E08 90 BE 34         [ 2]  295 	ldw y,FPTR 
      009E0B 90 5C            [ 1]  296 	incw y 
      009E0D 90 BF 34         [ 2]  297 	ldw FPTR,y
      009E10 90 85            [ 2]  298 	popw y  
      009E12 81               [ 4]  299 1$: ret 
                                    300 
                                    301 ;------------------------------
                                    302 ; add u to FPTR 
                                    303 ; PTR+ ( u -- )
                                    304 ;------------------------------
      009E13 9D F9                  305 	.word LINK 
                           001D95   306 	LINK=.
      009E15 04                     307 	.byte 4 
      009E16 50 54 52 2B            308 	.ascii "PTR+"
      009E1A                        309 PTRPLUS:
      009E1A 90 93            [ 1]  310 	ldw y,x 
      009E1C 1C 00 02         [ 2]  311 	addw x,#CELLL 
      009E1F 72 B9 00 35      [ 2]  312 	addw y,PTR16 
      009E23 90 BF 35         [ 2]  313 	ldw PTR16,y  
      009E26 24 02            [ 1]  314 	jrnc 1$
      009E28 3C 34            [ 1]  315 	inc FPTR 
      009E2A 81               [ 4]  316 1$: ret 
                                    317 
                                    318 ;---------------------------------
                                    319 ; read word at address pointed FPTR
                                    320 ; increment FPTR 
                                    321 ; EE-READ ( -- w )
                                    322 ;------------------------------------
      009E2B 9E 15                  323 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]



                           001DAD   324 	LINK=.
      009E2D 07                     325 	.byte 7 
      009E2E 45 45 2D 52 45 41 44   326 	.ascii "EE-READ"
      009E35                        327 EE_READ:
      009E35 1D 00 02         [ 2]  328 	subw x,#CELLL 
      009E38 92 BC 00 34      [ 5]  329 	ldf a,[FPTR]
      009E3C 90 95            [ 1]  330 	ld yh,a 
      009E3E CD 9E 02         [ 4]  331 	call INC_FPTR 
      009E41 92 BC 00 34      [ 5]  332 	ldf a,[FPTR]
      009E45 CD 9E 02         [ 4]  333 	call INC_FPTR 
      009E48 90 97            [ 1]  334 	ld yl,a 
      009E4A FF               [ 2]  335 	ldw (x),y 
      009E4B 81               [ 4]  336 	ret 
                                    337 
                                    338 ;---------------------------------------
                                    339 ; Read byte at address pointed by FPTR 
                                    340 ; EE-CREAD ( -- c )
                                    341 ;---------------------------------------
      009E4C 9E 2D                  342 	.word LINK 
                           001DCE   343 	LINK=.
      009E4E 08                     344 	.byte 8
      009E4F 45 45 2D 43 52 45 41   345 	.ascii "EE-CREAD" 
             44
      009E57                        346 EE_CREAD:
      009E57 1D 00 02         [ 2]  347 	subw x,#CELLL 
      009E5A 92 BC 00 34      [ 5]  348 	ldf a,[FPTR]	
      009E5E CD 9E 02         [ 4]  349 	call INC_FPTR
      009E61 90 5F            [ 1]  350 	clrw y 
      009E63 90 97            [ 1]  351 	ld yl,a 
      009E65 FF               [ 2]  352 	ldw (x),y 
      009E66 81               [ 4]  353 	ret 
                                    354 
                                    355 ;----------------------------
                                    356 ; write a byte at address pointed 
                                    357 ; by FPTR and increment FPTR.
                                    358 ; Expect pointer already initialized 
                                    359 ; and memory unlocked 
                                    360 ; WR-BYTE ( c -- )
                                    361 ;----------------------------
      009E67 9E 4E                  362 	.word LINK 
                           001DE9   363 	LINK=. 
      009E69 07                     364 	.byte 7 
      009E6A 57 52 2D 42 59 54 45   365 	.ascii "WR-BYTE" 
                                    366 
      009E71                        367 WR_BYTE:
      009E71 CD 84 E3         [ 4]  368 	call FC_XOFF
      009E74 90 93            [ 1]  369 	ldw y,x 
      009E76 90 FE            [ 2]  370 	ldw y,(y)
      009E78 1C 00 02         [ 2]  371 	addw x,#CELLL 
      009E7B 90 9F            [ 1]  372 	ld a,yl
      009E7D 92 BD 00 34      [ 4]  373 	ldf [FPTR],a
      009E81 72 05 50 5F FB   [ 2]  374 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009E86 CD 84 CD         [ 4]  375 	call FC_XON
      009E89 CC 9E 02         [ 2]  376 	jp INC_FPTR 
                                    377 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]



                                    378 ;---------------------------------------
                                    379 ; write a word at address pointed 
                                    380 ; by FPTR and increment FPTR 
                                    381 ; Expect pointer already initialzed 
                                    382 ; and memory unlocked 
                                    383 ; WR-WORD ( w -- )
                                    384 ;---------------------------------------
      009E8C 9E 69                  385 	.word LINK 
                           001E0E   386 	LINK=.
      009E8E 07                     387 	.byte 7 
      009E8F 57 52 2D 57 4F 52 44   388 	.ascii "WR-WORD" 
      009E96                        389 WR_WORD:
      009E96 CD 84 E3         [ 4]  390 	call FC_XOFF
      009E99 90 93            [ 1]  391 	ldw y,x
      009E9B 90 FE            [ 2]  392 	ldw y,(y)
      009E9D 1C 00 02         [ 2]  393 	addw x,#CELLL 
      009EA0 90 9E            [ 1]  394 	ld a,yh 
      009EA2 92 BD 00 34      [ 4]  395 	ldf [FPTR],a
      009EA6 72 05 50 5F FB   [ 2]  396 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009EAB CD 9E 02         [ 4]  397 	call INC_FPTR 
      009EAE 90 9F            [ 1]  398 	ld a,yl 
      009EB0 92 BD 00 34      [ 4]  399 	ldf [FPTR],a
      009EB4 72 05 50 5F FB   [ 2]  400 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      009EB9 CD 84 CD         [ 4]  401 	call FC_XON
      009EBC CC 9E 02         [ 2]  402 	jp INC_FPTR 
                                    403 
                                    404 
                                    405 ;---------------------------------------
                                    406 ; write a byte to FLASH or EEPROM/OPTION  
                                    407 ; EEC!  (c ud -- )
                                    408 ;---------------------------------------
      009EBF 9E 8E                  409     .word LINK 
                           001E41   410 	LINK=.
      009EC1 04                     411     .byte 4 
      009EC2 45 45 43 21            412     .ascii "EEC!"
                                    413 	; local variables 
                           000001   414 	BTW = 1   ; byte to write offset on stack
                           000002   415     OPT = 2 
                           000002   416 	VSIZE = 2
      009EC6                        417 EECSTORE:
      009EC6 52 02            [ 2]  418 	sub sp,#VSIZE
      009EC8 CD 9C 88         [ 4]  419     call FPSTOR
      009ECB E6 01            [ 1]  420 	ld a,(1,x)
      009ECD 43               [ 1]  421 	cpl a 
      009ECE 6B 01            [ 1]  422 	ld (BTW,sp),a ; byte to write 
      009ED0 0F 02            [ 1]  423 	clr (OPT,sp)  ; OPTION flag
      009ED2 CD 9D C6         [ 4]  424 	call UNLOCK 
                                    425 	; check if option
      009ED5 3D 34            [ 1]  426 	tnz FPTR 
      009ED7 26 19            [ 1]  427 	jrne 2$
      009ED9 90 BE 35         [ 2]  428 	ldw y,PTR16 
      009EDC 90 A3 48 00      [ 2]  429 	cpw y,#OPTION_BASE
      009EE0 2B 10            [ 1]  430 	jrmi 2$
      009EE2 90 A3 48 80      [ 2]  431 	cpw y,#OPTION_END+1
      009EE6 2A 0A            [ 1]  432 	jrpl 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



      009EE8 03 02            [ 1]  433 	cpl (OPT,sp)
                                    434 	; OPTION WRITE require this UNLOCK 
      009EEA 72 1E 50 5B      [ 1]  435     bset FLASH_CR2,#FLASH_CR2_OPT
      009EEE 72 1F 50 5C      [ 1]  436     bres FLASH_NCR2,#FLASH_CR2_OPT 
      009EF2                        437 2$: 
      009EF2 CD 9E 71         [ 4]  438 	call WR_BYTE 	
      009EF5 0D 02            [ 1]  439 	tnz (OPT,sp)
      009EF7 27 0D            [ 1]  440 	jreq 3$ 
      009EF9 7B 01            [ 1]  441     ld a,(BTW,sp)
      009EFB 90 5F            [ 1]  442     clrw y
      009EFD 90 97            [ 1]  443 	ld yl,a 
      009EFF 1D 00 02         [ 2]  444 	subw x,#CELLL 
      009F02 FF               [ 2]  445 	ldw (x),y 
      009F03 CD 9E 71         [ 4]  446 	call WR_BYTE
      009F06                        447 3$: 
      009F06 CD 9D EE         [ 4]  448 	call LOCK 
      009F09 5B 02            [ 2]  449 	addw sp,#VSIZE 
      009F0B 81               [ 4]  450     ret
                                    451 
                                    452 ;------------------------------
                                    453 ; write integer in FLASH|EEPROM
                                    454 ; EE! ( n ud -- )
                                    455 ;------------------------------
      009F0C 9E C1                  456 	.word LINK 
                           001E8E   457 	LINK=.
      009F0E 03                     458 	.byte 3 
      009F0F 45 45 21               459 	.ascii "EE!"
      009F12                        460 EESTORE:
      009F12 CD 9C 88         [ 4]  461 	call FPSTOR 
      009F15 CD 9D C6         [ 4]  462 	call UNLOCK 
      009F18 90 93            [ 1]  463 	ldw y,x 
      009F1A 90 FE            [ 2]  464 	ldw y,(y)
      009F1C 90 89            [ 2]  465 	pushw y 
      009F1E 90 5E            [ 1]  466 	swapw y 
      009F20 FF               [ 2]  467 	ldw (x),y 
      009F21 CD 9E 71         [ 4]  468 	call WR_BYTE 
      009F24 90 85            [ 2]  469 	popw y 
      009F26 1D 00 02         [ 2]  470 	subw x,#CELLL
      009F29 FF               [ 2]  471 	ldw (x),y 
      009F2A CD 9E 71         [ 4]  472 	call WR_BYTE
      009F2D CC 9D EE         [ 2]  473 	jp LOCK 
                                    474 
                                    475 
                                    476 ;----------------------------
                                    477 ; Erase flash memory row 
                                    478 ; stm8s208 as 128 bytes rows
                                    479 ; ROW-ERASE ( ud -- )
                                    480 ;----------------------------
      009F30 9F 0E                  481 	.word LINK 
                           001EB2   482 	LINK=. 
      009F32 09                     483 	.byte 9 
      009F33 52 4F 57 2D 45 52 41   484 	.ascii "ROW-ERASE" 
             53 45
      009F3C                        485 row_erase:
      009F3C CD 84 E3         [ 4]  486 	call FC_XOFF
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



      009F3F CD 9C 88         [ 4]  487 	call FPSTOR
                                    488 ;code must be execute from RAM 
                                    489 ;copy routine to PAD 
      009F42 1D 00 02         [ 2]  490 	subw x,#CELLL 
      009F45 90 AE 9F 95      [ 2]  491 	ldw y,#row_erase_proc
      009F49 FF               [ 2]  492 	ldw (x),y 
      009F4A CD 8D 6E         [ 4]  493 	call PAD 
      009F4D 90 AE 9F BC      [ 2]  494 	ldw y,#row_erase_proc_end 
      009F51 72 A2 9F 95      [ 2]  495 	subw y,#row_erase_proc
      009F55 1D 00 02         [ 2]  496 	subw x,#CELLL 
      009F58 FF               [ 2]  497 	ldw (x),y 
      009F59 CD 8D AA         [ 4]  498 	call CMOVE 
      009F5C                        499 block_erase:
      009F5C 90 BE 35         [ 2]  500 	ldw y,FPTR+1
      009F5F 90 A3 B6 80      [ 2]  501 	cpw y,#app_space 
      009F63 2A 19            [ 1]  502 	jrpl erase_flash 
                                    503 ; erase EEPROM block
      009F65 90 A3 40 00      [ 2]  504 	cpw y,#EEPROM_BASE 
      009F69 24 04            [ 1]  505 	jruge 1$
      009F6B CD 84 CD         [ 4]  506 	call FC_XON
      009F6E 81               [ 4]  507 	ret ; bad address 
      009F6F 90 A3 47 FF      [ 2]  508 1$: cpw y,#EEPROM_END 
      009F73 23 04            [ 2]  509 	jrule 2$ 
      009F75 CD 84 CD         [ 4]  510 	call FC_XON
      009F78 81               [ 4]  511 	ret ; bad address 
      009F79                        512 2$:	
      009F79 CD 9D 88         [ 4]  513 	call UNLKEE 
      009F7C 20 03            [ 2]  514 	jra proceed_erase
                                    515 ; erase flash block:
      009F7E                        516 erase_flash:
      009F7E CD 9D A7         [ 4]  517 	call UNLKFL 
      009F81                        518 proceed_erase:
      009F81 CD 8D 6E         [ 4]  519 	call PAD 
      009F84 90 93            [ 1]  520 	ldw y,x
      009F86 90 FE            [ 2]  521 	ldw y,(y)
      009F88 1C 00 02         [ 2]  522 	addw x,#CELLL  
      009F8B 90 FD            [ 4]  523 	call (y) 
      009F8D 72 17 50 5F      [ 1]  524 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      009F91 CD 84 CD         [ 4]  525 	call FC_XON
      009F94 81               [ 4]  526 	ret 
                                    527 
                                    528 ; this routine is to be copied to PAD 
      009F95                        529 row_erase_proc:
      009F95 35 20 50 5B      [ 1]  530 	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
      009F99 35 DF 50 5C      [ 1]  531 	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
      009F9D 4F               [ 1]  532 	clr a 
      009F9E 90 5F            [ 1]  533 	clrw y 
      009FA0 91 A7 00 34      [ 1]  534 	ldf ([FPTR],y),a
      009FA4 90 5C            [ 1]  535     incw y
      009FA6 91 A7 00 34      [ 1]  536 	ldf ([FPTR],y),a
      009FAA 90 5C            [ 1]  537     incw y
      009FAC 91 A7 00 34      [ 1]  538 	ldf ([FPTR],y),a
      009FB0 90 5C            [ 1]  539     incw y
      009FB2 91 A7 00 34      [ 1]  540 	ldf ([FPTR],y),a
      009FB6 72 05 50 5F FB   [ 2]  541 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



      009FBB 81               [ 4]  542 	ret
      009FBC                        543 row_erase_proc_end:
                                    544 
                                    545 
                                    546 ;-----------------------------------
                                    547 ; block programming must be 
                                    548 ; executed from RAM 
                                    549 ; initial contidions: 
                                    550 ; 		memory unlocked
                                    551 ;       FPTR initialized 
                                    552 ; input: 
                                    553 ;    x   buffer address 
                                    554 ;-----------------------------------
                           000001   555 	BCNT=1 
      009FBC                        556 copy_buffer:
      009FBC 4B 80            [ 1]  557 	push #BLOCK_SIZE  
                                    558 ;enable block programming 
      009FBE 72 10 50 5B      [ 1]  559 	bset FLASH_CR2,#FLASH_CR2_PRG 
      009FC2 72 11 50 5C      [ 1]  560 	bres FLASH_NCR2,#FLASH_CR2_PRG
      009FC6 90 5F            [ 1]  561 	clrw y
      009FC8 F6               [ 1]  562 1$:	ld a,(x)
      009FC9 91 A7 00 34      [ 1]  563 	ldf ([FPTR],y),a
      009FCD 5C               [ 1]  564 	incw x 
      009FCE 90 5C            [ 1]  565 	incw y 
      009FD0 0A 01            [ 1]  566 	dec (BCNT,sp)
      009FD2 26 F4            [ 1]  567 	jrne 1$
                                    568 ; wait EOP bit 
      009FD4 72 05 50 5F FB   [ 2]  569 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. 
      009FD9 84               [ 1]  570 	pop a ; remove BCNT from stack 
      009FDA 81               [ 4]  571 	ret 
      009FDB                        572 copy_buffer_end:
                                    573 
                                    574 ;-------------------------
                                    575 ; move program_row to RAM 
                                    576 ; in TIB 
                                    577 ;------------------------
      009FDB                        578 copy_prog_to_ram:
      009FDB 1D 00 06         [ 2]  579 	subw x,#6
      009FDE 90 AE 9F BC      [ 2]  580 	ldw y,#copy_buffer 
      009FE2 EF 04            [ 2]  581 	ldw (4,x),y 
      009FE4 90 AE 17 00      [ 2]  582 	ldw y,#TIBBASE
      009FE8 EF 02            [ 2]  583 	ldw (2,x),y 
      009FEA 90 AE 9F DB      [ 2]  584 	ldw y,#copy_buffer_end 
      009FEE 72 A2 9F BC      [ 2]  585 	subw y,#copy_buffer  
      009FF2 FF               [ 2]  586 	ldw (x),y 
      009FF3 CD 8D AA         [ 4]  587 	call CMOVE 
      009FF6 81               [ 4]  588 	ret 
                                    589 
                                    590 
                                    591 ;-----------------------------
                                    592 ; write a row in FLASH/EEPROM 
                                    593 ; WR-ROW ( a ud -- )
                                    594 ; a -> address 128 byte buffer to write 
                                    595 ; ud ->  row address in FLASH|EEPROM 
                                    596 ;-----------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]



      009FF7 9F 32                  597 	.word LINK 
                           001F79   598 	LINK=.
      009FF9 06                     599 	.byte 6 
      009FFA 57 52 2D 52 4F 57      600 	.ascii "WR-ROW"
      00A000                        601 write_row:
      00A000 CD 84 E3         [ 4]  602 	call FC_XOFF
      00A003 CD 9C 88         [ 4]  603 	call FPSTOR
                                    604 ; align to FLASH block 
      00A006 A6 80            [ 1]  605 	ld a,#0x80 
      00A008 B4 36            [ 1]  606 	and a,PTR8 
      00A00A B7 36            [ 1]  607 	ld PTR8,a  
      00A00C CD 9F DB         [ 4]  608 	call copy_prog_to_ram
      00A00F CD 9D C6         [ 4]  609 	call UNLOCK
      00A012 90 93            [ 1]  610 	ldw y,x 
      00A014 90 FE            [ 2]  611 	ldw y,(y)
      00A016 1C 00 02         [ 2]  612 	addw x,#CELLL 
      00A019 89               [ 2]  613 	pushw x 
      00A01A 93               [ 1]  614 	ldw x,y ; buffer address in x 
      00A01B CD 17 00         [ 4]  615 	call TIBBASE
      00A01E CD 9D EE         [ 4]  616 	call LOCK
      00A021 85               [ 2]  617 	popw x 
      00A022 CD 84 CD         [ 4]  618 	call FC_XON 
      00A025 81               [ 4]  619 	ret 
                                    620 
                                    621 ;-------------------------------------
                                    622 ; change value of OPTION register 
                                    623 ; SET-OPT (c n -- ) 
                                    624 ; c new value.
                                    625 ; n OPT  number {1..7}
                                    626 ;--------------------------------------
      00A026 9F F9                  627 		.word LINK 
                           001FA8   628 		LINK=.
      00A028 07                     629 		.byte 7 
      00A029 53 45 54 2D 4F 50 54   630 		.ascii "SET-OPT" 
      00A030                        631 set_option: 
      00A030 90 93            [ 1]  632 		ldw y,x 
      00A032 90 FE            [ 2]  633 		ldw y,(y)
      00A034 27 06            [ 1]  634 		jreq 1$
      00A036 90 A3 00 07      [ 2]  635 		cpw y,#7 
      00A03A 23 04            [ 2]  636 		jrule 2$ 
                                    637 ; invalid OPTION number 		
      00A03C 1C 00 04         [ 2]  638 1$:		addw x,#2*CELLL
      00A03F 81               [ 4]  639 		ret
      00A040 90 58            [ 2]  640 2$:		sllw y 
      00A042 72 A9 47 FF      [ 2]  641 		addw y,#OPTION_BASE-1
      00A046 FF               [ 2]  642 		ldw (x),y 
      00A047 1D 00 02         [ 2]  643 		subw x,#CELLL 
      00A04A 90 5F            [ 1]  644 		clrw y 
      00A04C FF               [ 2]  645 		ldw (x),y 
      00A04D CD 9E C6         [ 4]  646 		call EECSTORE
      00A050 81               [ 4]  647 		ret 
                                    648 
                                    649 
                                    650 
                                    651 ;--------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]



                                    652 ; reset system to its original state 
                                    653 ; before any user modification
                                    654 ; PRISTINE ( -- )
                                    655 ;-------------------------------------
      00A051 A0 28                  656 	.word LINK  
                           001FD3   657 	LINK=.
      00A053 08                     658 	.byte 8 
      00A054 50 52 49 53 54 49 4E   659 	.ascii "PRISTINE"
             45
      00A05C                        660 pristine:
                                    661 ;;; erase EEPROM
      00A05C CD 9C A7         [ 4]  662 	call EEPROM 
      00A05F CD 88 A7         [ 4]  663 1$:	call DDUP 
      00A062 CD 9F 3C         [ 4]  664 	call row_erase
      00A065 90 93            [ 1]  665 	ldw y,x 
      00A067 90 EE 02         [ 2]  666 	ldw y,(2,y)
      00A06A 72 A9 00 80      [ 2]  667 	addw y,#BLOCK_SIZE
      00A06E EF 02            [ 2]  668 	ldw (2,x),y
      00A070 90 A3 48 00      [ 2]  669 	cpw y,#OPTION_BASE 
      00A074 25 E9            [ 1]  670 	jrult 1$
                                    671 ;;; reset OPTION to default values
      00A076 90 AE 00 01      [ 2]  672 	ldw y,#1 ; OPT1 
      00A07A FF               [ 2]  673 2$:	ldw (x),y   
      00A07B 90 5F            [ 1]  674 	clrw y 
      00A07D EF 02            [ 2]  675 	ldw (2,x),y  ; ( 0 1 -- ) 
      00A07F CD 88 A7         [ 4]  676 	call DDUP    ; ( 0 1 0 1 -- )  
      00A082 CD A0 30         [ 4]  677 	call set_option
      00A085 90 93            [ 1]  678 	ldw y,x 
      00A087 90 FE            [ 2]  679 	ldw y,(y)
      00A089 90 5C            [ 1]  680 	incw y  ; next OPTION 
      00A08B 90 A3 00 08      [ 2]  681 	cpw y,#8 
      00A08F 25 E9            [ 1]  682 	jrult 2$
                                    683 ;;; erase first row of app_space 	
      00A091 90 AE B6 80      [ 2]  684 	ldw y,#app_space
      00A095 EF 02            [ 2]  685 	ldw (2,x),y  
      00A097 90 5F            [ 1]  686 	clrw y 
      00A099 FF               [ 2]  687 	ldw (x),y ; ( app_space 0 -- )
      00A09A CD 9F 3C         [ 4]  688 	call row_erase 
                                    689 ; reset interrupt vectors 
      00A09D 1D 00 02         [ 2]  690 	subw x,#CELLL 
      00A0A0 90 5F            [ 1]  691 	clrw y  
      00A0A2 FF               [ 2]  692 4$:	ldw (x),y  ; ( n -- ) int# 
      00A0A3 CD 86 99         [ 4]  693 	call DUPP  
      00A0A6 CD A0 C3         [ 4]  694 	call reset_vector
      00A0A9 90 93            [ 1]  695 	ldw y,x 
      00A0AB 90 FE            [ 2]  696 	ldw y,(y)
      00A0AD 90 5C            [ 1]  697 	incw y   ; next vector 
      00A0AF 90 A3 00 19      [ 2]  698 	cpw y,#25 
      00A0B3 25 ED            [ 1]  699 	jrult 4$
      00A0B5 CC 80 80         [ 2]  700 	jp NonHandledInterrupt ; reset MCU
                                    701 
                                    702 ;------------------------------
                                    703 ; reset an interrupt vector 
                                    704 ; to its initial value 
                                    705 ; i.e. NonHandledInterrupt
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]



                                    706 ; RST-IVEC ( n -- )
                                    707 ;-----------------------------
      00A0B8 A0 53                  708 	.word LINK 
                           00203A   709 	LINK=. 
      00A0BA 08                     710 	.byte 8 
      00A0BB 52 53 54 2D 49 56 45   711 	.ascii "RST-IVEC"
             43
      00A0C3                        712 reset_vector:
      00A0C3 90 93            [ 1]  713 	ldw y,x
      00A0C5 1C 00 02         [ 2]  714 	addw x,#CELLL 
      00A0C8 90 FE            [ 2]  715 	ldw y,(y)
      00A0CA 90 A3 00 17      [ 2]  716 	cpw y,#23 
      00A0CE 27 3A            [ 1]  717 	jreq 9$
      00A0D0 90 A3 00 1D      [ 2]  718 	cpw y,#29 ; last vector
      00A0D4 22 34            [ 1]  719 	jrugt 9$  
      00A0D6 90 58            [ 2]  720 	sllw y 
      00A0D8 90 58            [ 2]  721 	sllw y 
      00A0DA 72 A9 80 08      [ 2]  722 	addw y,#0x8008 ; irq0 address 
      00A0DE 90 BF 26         [ 2]  723 	ldw YTEMP,y
      00A0E1 1D 00 06         [ 2]  724 	subw x,#3*CELLL 
      00A0E4 EF 02            [ 2]  725 	ldw (2,x),y 
      00A0E6 90 5F            [ 1]  726 	clrw y
      00A0E8 FF               [ 2]  727 	ldw (x),y 
      00A0E9 A6 82            [ 1]  728 	ld a,#0x82 
      00A0EB 90 95            [ 1]  729 	ld yh,a
      00A0ED EF 04            [ 2]  730 	ldw (4,x),y
      00A0EF CD 9F 12         [ 4]  731 	call EESTORE
      00A0F2 1D 00 06         [ 2]  732 	subw x,#3*CELLL
      00A0F5 90 5F            [ 1]  733 	clrw y 
      00A0F7 FF               [ 2]  734 	ldw (x),y 
      00A0F8 90 AE 80 80      [ 2]  735 	ldw y,#NonHandledInterrupt
      00A0FC EF 04            [ 2]  736 	ldw (4,x),y 
      00A0FE 90 BE 26         [ 2]  737 	ldw y,YTEMP  
      00A101 72 A9 00 02      [ 2]  738 	addw y,#2
      00A105 EF 02            [ 2]  739 	ldw (2,x),y 
      00A107 CD 9F 12         [ 4]  740 	call EESTORE
      00A10A 81               [ 4]  741 9$:	ret 
                                    742 
                                    743 
                                    744 ;------------------------------
                                    745 ; all interrupt vector with 
                                    746 ; an address >= a are resetted 
                                    747 ; to default
                                    748 ; CHKIVEC ( a -- )
                                    749 ;------------------------------
      00A10B A0 BA                  750 	.word LINK 
                           00208D   751 	LINK=.
      00A10D 07                     752 	.byte 7
      00A10E 43 48 4B 49 56 45 43   753 	.ascii "CHKIVEC"
                                    754 ;local variables 
                           000001   755 	SSP=1
                           000003   756 	CADR=3
                           000005   757 	OFS=5
                           000006   758 	VSIZE=6  
      00A115                        759 CHKIVEC:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]



      00A115 52 06            [ 2]  760 	sub sp,#VSIZE ;alloc local variables 
      00A117 90 93            [ 1]  761 	ldw y,x 
      00A119 90 FE            [ 2]  762 	ldw y,(y)
      00A11B 17 03            [ 2]  763 	ldw (CADR,sp),y ; ca 
      00A11D 1F 01            [ 2]  764 	ldw (SSP,sp),x 
      00A11F AE 80 0A         [ 2]  765 	ldw x,#0x800a ; irq0 address 
      00A122 BF 35            [ 2]  766 	ldw PTR16,X
      00A124 AE FF FC         [ 2]  767 	ldw x,#-4 
      00A127 1C 00 04         [ 2]  768 1$:	addw x,#4
      00A12A A3 00 78         [ 2]  769 	cpw x,#30*4 ; irq0-29 
      00A12D 27 22            [ 1]  770 	jreq 9$
      00A12F 90 93            [ 1]  771 	ldw y,x  
      00A131 91 D6 35         [ 4]  772 	ld a,([PTR16],y)
      00A134 11 03            [ 1]  773 	cp a,(CADR,sp)
      00A136 25 EF            [ 1]  774 	jrult 1$
      00A138 90 5C            [ 1]  775 	incw y 
      00A13A 91 D6 35         [ 4]  776 	ld a,([PTR16],y)
      00A13D 11 04            [ 1]  777 	cp a,(CADR+1,sp) 
      00A13F 25 E6            [ 1]  778 	jrult 1$ 
      00A141 1F 05            [ 2]  779 	ldw (OFS,sp),x 
      00A143 54               [ 2]  780 	srlw x
      00A144 54               [ 2]  781 	srlw x 
      00A145 90 93            [ 1]  782 	ldw y,x 
      00A147 1E 01            [ 2]  783 	ldw x,(SSP,sp)
      00A149 FF               [ 2]  784 	ldw (x),y
      00A14A CD A0 C3         [ 4]  785 	call reset_vector
      00A14D 1E 05            [ 2]  786 	ldw x,(OFS,sp) 
      00A14F 20 D6            [ 2]  787 	jra 1$
      00A151 1E 01            [ 2]  788 9$:	ldw x,(SSP,sp) 
      00A153 1C 00 02         [ 2]  789 	addw x,#CELLL 
      00A156 5B 06            [ 2]  790 	addw sp,#VSIZE ; drop local variables  
      00A158 81               [ 4]  791 	ret 
                                    792 
                                    793 ;------------------------------
                                    794 ; set interrupt vector 
                                    795 ; SET-IVEC ( ud n -- )
                                    796 ;  ud Handler address
                                    797 ;  n  vector # 0 .. 29 
                                    798 ;-----------------------------
      00A159 A1 0D                  799 	.word LINK
                           0020DB   800 	LINK=.
      00A15B 08                     801 	.byte 8 
      00A15C 53 45 54 2D 49 56 45   802 	.ascii "SET-IVEC" 
             43
      00A164                        803 set_vector:
      00A164 90 93            [ 1]  804     ldw y,x 
      00A166 1C 00 02         [ 2]  805 	addw x,#CELLL 
      00A169 90 FE            [ 2]  806 	ldw y,(y) ; vector #
      00A16B 90 A3 00 1D      [ 2]  807 	cpw y,#29 ; last vector
      00A16F 23 04            [ 2]  808 	jrule 2$
      00A171 1C 00 04         [ 2]  809 	addw x,#2*CELLL 
      00A174 81               [ 4]  810 	ret
      00A175 90 58            [ 2]  811 2$:	sllw y 
      00A177 90 58            [ 2]  812 	sllw y 
      00A179 72 A9 80 08      [ 2]  813 	addw y,#0X8008 ; IRQ0 vector address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]



      00A17D 90 BF 26         [ 2]  814 	ldw YTEMP,y ; vector address 
      00A180 A6 82            [ 1]  815 	ld a,#0x82 
      00A182 90 95            [ 1]  816 	ld yh,a 
      00A184 E6 01            [ 1]  817 	ld a,(1,x) ; isr address bits 23..16 
      00A186 90 97            [ 1]  818 	ld yl,a 
                                    819 ;  write 0x82 + most significant byte of int address	
      00A188 1D 00 06         [ 2]  820 	subw x,#3*CELLL 
      00A18B EF 04            [ 2]  821 	ldw (4,x),y 
      00A18D 90 BE 26         [ 2]  822 	ldw y,YTEMP
      00A190 EF 02            [ 2]  823 	ldw (2,x),y ; vector address 
      00A192 90 5F            [ 1]  824 	clrw y 
      00A194 FF               [ 2]  825 	ldw (x),y   ; as a double 
      00A195 CD 9F 12         [ 4]  826 	call EESTORE 
      00A198 90 93            [ 1]  827 	ldw y,x 
      00A19A 90 EE 02         [ 2]  828 	ldw y,(2,y) ; bits 15..0 int vector 
      00A19D 1D 00 06         [ 2]  829 	subw x,#3*CELLL 
      00A1A0 EF 04            [ 2]  830 	ldw (4,x),y 
      00A1A2 90 BE 26         [ 2]  831 	ldw y,YTEMP 
      00A1A5 72 A9 00 02      [ 2]  832 	addw y,#2 
      00A1A9 EF 02            [ 2]  833 	ldw (2,x),y 
      00A1AB 90 5F            [ 1]  834 	clrw y 
      00A1AD FF               [ 2]  835 	ldw (x),y 
      00A1AE CD 9F 12         [ 4]  836 	call EESTORE
      00A1B1 1C 00 04         [ 2]  837 	addw x,#2*CELLL  
      00A1B4 81               [ 4]  838 9$: ret 
                                    839 
                                    840 
                                    841 ;------------------------
                                    842 ; Compile word to flash
                                    843 ; EE, (w -- )
                                    844 ;-----------------------
      00A1B5 A1 5B                  845 	.word LINK
                           002137   846 	LINK=.
      00A1B7 03                     847 	.byte 3
      00A1B8 45 45 2C               848 	.ascii "EE,"
      00A1BB                        849 EE_COMMA:
      00A1BB 1D 00 04         [ 2]  850 	subw x,#2*CELLL 
      00A1BE 90 BE 1A         [ 2]  851 	ldw y,UCP
      00A1C1 90 89            [ 2]  852 	pushw y 
      00A1C3 EF 02            [ 2]  853 	ldw (2,x),y 
      00A1C5 90 5F            [ 1]  854 	clrw y 
      00A1C7 FF               [ 2]  855 	ldw (x),y
      00A1C8 CD 9F 12         [ 4]  856 	call EESTORE
      00A1CB 90 85            [ 2]  857 	popw y 
      00A1CD 72 A9 00 02      [ 2]  858 	addw y,#2
      00A1D1 90 BF 1A         [ 2]  859 	ldw UCP,y
      00A1D4 81               [ 4]  860 	ret 
                                    861 
                                    862 
                                    863 ;-------------------------
                                    864 ; Compile byte to flash 
                                    865 ; EEC, ( c -- )	
                                    866 ;-------------------------
      00A1D5 A1 B7                  867 	.word LINK 
                           002157   868 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
Hexadecimal [24-Bits]



      00A1D7 04                     869 	.byte 4 
      00A1D8 45 45 43 2C            870 	.ascii "EEC,"
      00A1DC                        871 EE_CCOMMA:
      00A1DC 1D 00 04         [ 2]  872 	subw x,#2*CELLL 
      00A1DF 90 BE 1A         [ 2]  873 	ldw y,UCP
      00A1E2 90 89            [ 2]  874 	pushw y 
      00A1E4 EF 02            [ 2]  875 	ldw (2,x),y 
      00A1E6 90 5F            [ 1]  876 	clrw y 
      00A1E8 FF               [ 2]  877 	ldw (x),y
      00A1E9 CD 9E C6         [ 4]  878 	call EECSTORE
      00A1EC 90 85            [ 2]  879 	popw y 
      00A1EE 90 5C            [ 1]  880 	incw y 
      00A1F0 90 BF 1A         [ 2]  881 	ldw UCP,y
      00A1F3 81               [ 4]  882 	ret 
                                    883 
                                    884 
                                    885 ;--------------------------
                                    886 ; copy FLASH block to ROWBUF
                                    887 ; ROW>BUF ( ud -- )
                                    888 ;--------------------------
      00A1F4 A1 D7                  889 	.word LINK 
                           002176   890 	LINK=.
      00A1F6 07                     891 	.byte 7 
      00A1F7 52 4F 57 3E 42 55 46   892 	.ascii "ROW>BUF"
      00A1FE                        893 ROW2BUF: 
      00A1FE CD 9C 88         [ 4]  894 	call FPSTOR 
      00A201 A6 80            [ 1]  895 	ld a,#BLOCK_SIZE
      00A203 88               [ 1]  896 	push a 
      00A204 B4 36            [ 1]  897 	and a,PTR8 ; block align 
      00A206 B7 36            [ 1]  898 	ld PTR8,a
      00A208 90 AE 16 80      [ 2]  899 	ldw y,#ROWBUFF 
      00A20C 92 BC 00 34      [ 5]  900 1$: ldf a,[FPTR]
      00A210 90 F7            [ 1]  901 	ld (y),a
      00A212 CD 9E 02         [ 4]  902 	call INC_FPTR
      00A215 90 5C            [ 1]  903 	incw y 
      00A217 0A 01            [ 1]  904 	dec (1,sp)
      00A219 26 F1            [ 1]  905 	jrne 1$ 
      00A21B 84               [ 1]  906 	pop a 
      00A21C 81               [ 4]  907 	ret 
                                    908 
                                    909 
                                    910 ;---------------------------
                                    911 ; copy ROWBUFF to flash 
                                    912 ; BUF>ROW ( ud -- )
                                    913 ; ud is row address as double 
                                    914 ;---------------------------
      00A21D A1 F6                  915 	.word LINK 
                           00219F   916 	LINK=.
      00A21F 07                     917 	.byte 7 
      00A220 42 55 46 3E 52 4F 57   918 	.ascii "BUF>ROW" 
      00A227                        919 BUF2ROW:
      00A227 CD 87 9D         [ 4]  920 	call TBUF ; ( ud rb -- )
      00A22A CD 88 5D         [ 4]  921 	call ROT 
      00A22D CD 88 5D         [ 4]  922 	call ROT  ; ( rb ud -- )
      00A230 CD A0 00         [ 4]  923 	call write_row 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal [24-Bits]



      00A233 81               [ 4]  924 	ret 
                                    925 
                                    926 ;---------------------------------
                                    927 ; how many byte free in that row 
                                    928 ; RFREE ( a -- n )
                                    929 ; a is least byte of target address
                                    930 ;----------------------------------
      00A234 A2 1F                  931 	.word LINK 
                           0021B6   932 	LINK=.
      00A236 05                     933 	.byte 5 
      00A237 52 46 52 45 45         934 	.ascii "RFREE"
      00A23C                        935 RFREE:
      00A23C E6 01            [ 1]  936 	ld a,(1,x)
      00A23E A4 7F            [ 1]  937 	and a,#BLOCK_SIZE-1 
      00A240 B7 26            [ 1]  938 	ld YTEMP,a 
      00A242 A6 80            [ 1]  939 	ld a,#BLOCK_SIZE 
      00A244 B0 26            [ 1]  940 	sub a,YTEMP 
      00A246 90 5F            [ 1]  941 	clrw y 
      00A248 90 97            [ 1]  942 	ld yl,a
      00A24A FF               [ 2]  943 	ldw (x),y 
      00A24B 81               [ 4]  944 	ret 
                                    945 
                                    946 ;---------------------------------
                                    947 ; write u bytes to flash/EEPROM 
                                    948 ; constraint to row limit 
                                    949 ; RAM>EE ( ud a u -- u2 )
                                    950 ; ud flash address 
                                    951 ; a ram address 
                                    952 ; u bytes count
                                    953 ; return u2 bytes written  
                                    954 ;-------------------------------
      00A24C A2 36                  955 	.word LINK 
                           0021CE   956 	LINK=. 
      00A24E 06                     957 	.byte 6
      00A24F 52 41 4D 3E 45 45      958 	.ascii "RAM>EE"
                                    959 	
      00A255                        960 RAM2EE:
                                    961 ; copy ud on top 
      00A255 90 93            [ 1]  962 	ldw y,x 
      00A257 90 EE 06         [ 2]  963 	ldw y,(6,y) ; LSW of ud  
      00A25A 90 BF 26         [ 2]  964 	ldw YTEMP,y 
      00A25D 90 93            [ 1]  965 	ldw y,x 
      00A25F 90 EE 04         [ 2]  966 	ldw y,(4,y)  ; MSW of ud 
      00A262 1D 00 04         [ 2]  967 	subw x,#2*CELLL 
      00A265 FF               [ 2]  968 	ldw (x),y 
      00A266 90 BE 26         [ 2]  969 	ldw y,YTEMP 
      00A269 EF 02            [ 2]  970 	ldw (2,x),y 
      00A26B CD A1 FE         [ 4]  971 	call ROW2BUF 
      00A26E 90 93            [ 1]  972 	ldw y,x 
      00A270 90 EE 06         [ 2]  973 	ldw y,(6,y)
      00A273 90 89            [ 2]  974 	pushw y ; udl 
      00A275 90 9F            [ 1]  975 	ld a,yl
      00A277 A4 7F            [ 1]  976 	and a,#BLOCK_SIZE-1 
      00A279 90 5F            [ 1]  977 	clrw y 
      00A27B 90 97            [ 1]  978 	ld yl,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal [24-Bits]



      00A27D 72 A9 16 80      [ 2]  979 	addw y,#ROWBUFF 
      00A281 1D 00 02         [ 2]  980 	subw x,#CELLL 
      00A284 FF               [ 2]  981 	ldw (x),y  
      00A285 CD 86 A9         [ 4]  982 	call SWAPP ;  ( ud a ra u -- )
      00A288 CD 85 B4         [ 4]  983 	call RFROM  
      00A28B CD A2 3C         [ 4]  984 	call RFREE 
      00A28E CD 89 FF         [ 4]  985 	call MIN
      00A291 CD 86 99         [ 4]  986 	call DUPP 
      00A294 CD 86 62         [ 4]  987 	call TOR  
      00A297 CD 8D AA         [ 4]  988 	call CMOVE
      00A29A CD A2 27         [ 4]  989 	call BUF2ROW 
      00A29D CD 85 B4         [ 4]  990 	call RFROM 
      00A2A0 81               [ 4]  991 	ret 
                                    992 
                                    993 
                                    994 ;--------------------------
                                    995 ; expand 16 bit address 
                                    996 ; to 32 bit address 
                                    997 ; FADDR ( a -- ud )
                                    998 ;--------------------------
      00A2A1 A2 4E                  999 	.word LINK 
                           002223  1000 	LINK=. 
      00A2A3 05                    1001 	.byte 5 
      00A2A4 46 41 44 44 52        1002 	.ascii "FADDR"
      00A2A9                       1003 FADDR:
      00A2A9 CC 8C 83         [ 2] 1004 	jp ZERO 
                                   1005 
                                   1006 
                                   1007 ;--------------------------
                                   1008 ; move new colon definition to FLASH 
                                   1009 ; using WR-ROW for efficiency 
                                   1010 ; preserving bytes already used 
                                   1011 ; in the current block. 
                                   1012 ; At this point the compiler as completed
                                   1013 ; in RAM and pointers CP and CNTXT updated.
                                   1014 ; CNTXT point to nfa of new word and  
                                   1015 ; CP is after compiled word so CP-CNTXT+2=count to write 
                                   1016 ; 
                                   1017 ; FMOVE ( -- cp+ )
                                   1018 ; 
                                   1019 ;--------------------------
      00A2AC A2 A3                 1020 	.word LINK 
                           00222E  1021 	LINK=.
      00A2AE 05                    1022 	.byte 5 
      00A2AF 46 4D 4F 56 45        1023 	.ascii "FMOVE" 
      00A2B4                       1024 FMOVE:
      00A2B4 CD 87 AF         [ 4] 1025 	call TFLASH 
      00A2B7 CD 85 63         [ 4] 1026 	CALL AT 
      00A2BA CD 85 18         [ 4] 1027 	CALL QBRAN 
      00A2BD A3 38                 1028 	.word no_move  
      00A2BF CD 87 FE         [ 4] 1029 	call CPP
      00A2C2 CD 85 63         [ 4] 1030 	call AT  
      00A2C5 CD 86 99         [ 4] 1031 	call DUPP ; ( udl udl -- )
      00A2C8 CD 87 E2         [ 4] 1032 	call CNTXT 
      00A2CB CD 85 63         [ 4] 1033 	call AT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]



      00A2CE CD 84 EF         [ 4] 1034 	call DOLIT 
      00A2D1 00 02                 1035 	.word 2 
      00A2D3 CD 89 52         [ 4] 1036 	call SUBB ; ( udl udl a -- )
      00A2D6 CD 86 A9         [ 4] 1037 	call SWAPP 
      00A2D9 CD A2 A9         [ 4] 1038 	call FADDR 
      00A2DC CD 88 5D         [ 4] 1039 	call ROT  ; ( udl ud a -- )
      00A2DF CD 86 99         [ 4] 1040 	call DUPP 
      00A2E2 CD 86 62         [ 4] 1041 	call TOR    ; R: a 
      00A2E5                       1042 FMOVE2: 
      00A2E5 CD 8D 5D         [ 4] 1043 	call HERE 
      00A2E8 CD 85 C5         [ 4] 1044 	call RAT 
      00A2EB CD 89 52         [ 4] 1045 	call SUBB ; (udl ud a wl -- )
      00A2EE                       1046 next_row:
      00A2EE CD 86 99         [ 4] 1047 	call DUPP 
      00A2F1 CD 86 62         [ 4] 1048 	call TOR  ; ( udl ud a wl -- ) R: a wl
      00A2F4 CD A2 55         [ 4] 1049 	call RAM2EE ; ( udl a u -- udl u2 ) u2 is byte written to FLASH 
      00A2F7 CD 86 99         [ 4] 1050 	call DUPP 
      00A2FA CD 86 62         [ 4] 1051 	call TOR
      00A2FD CD 88 BC         [ 4] 1052 	call PLUS  ; ( udl+ ) 
      00A300 CD 86 99         [ 4] 1053 	call DUPP 
      00A303 CD 8C 83         [ 4] 1054 	call ZERO   ; ( udl+ ud -- )
      00A306 CD 85 B4         [ 4] 1055 	call RFROM  ; ( udl+ ud u2  R: a wl ) 
      00A309 CD 85 B4         [ 4] 1056 	call RFROM  ; ( udl+ ud u2 wl R: a ) 
      00A30C CD 86 C1         [ 4] 1057 	call OVER   ; ( udl+ ud u2 wl u2 -- )
      00A30F CD 89 52         [ 4] 1058 	call SUBB  ; ( udl+ ud u2 wl- R: a )
      00A312 CD 86 99         [ 4] 1059 	call DUPP 
      00A315 CD 85 18         [ 4] 1060 	call QBRAN
      00A318 A3 31                 1061 	.word fmove_done 
      00A31A CD 86 A9         [ 4] 1062 	call SWAPP  ; ( udl+ ud wl- u2 R: a )
      00A31D CD 85 B4         [ 4] 1063 	call RFROM ; ( udl+ ud wl- u2 a -- ) 
      00A320 CD 88 BC         [ 4] 1064 	call PLUS  ; ( udl+2 ud wl- a+ )
      00A323 CD 86 99         [ 4] 1065 	call DUPP 
      00A326 CD 86 62         [ 4] 1066 	call TOR   ; ( udl+2 ud wl- a+ ) R: a+
      00A329 CD 86 A9         [ 4] 1067 	call SWAPP 
      00A32C CD 85 34         [ 4] 1068 	call BRAN
      00A32F A2 EE                 1069 	.word next_row  
      00A331                       1070 fmove_done:	
      00A331 CD 85 B4         [ 4] 1071 	call RFROM  ; ( -- udl+ ud u2 wl- a  )
      00A334 1C 00 0A         [ 2] 1072 	addw x,#5*CELLL ; (  -- cp+ ) new CP 
      00A337 81               [ 4] 1073  	ret  
      00A338                       1074 no_move:
      00A338 CD 8C 83         [ 4] 1075 	call ZERO
      00A33B 81               [ 4] 1076 	ret 
                                   1077 
                                   1078 ;------------------------------------------
                                   1079 ; adjust pointers after **FMOVE** operetion.
                                   1080 ; UPDAT-PTR ( cp+ -- )
                                   1081 ; cp+ is new CP position after FMOVE 
                                   1082 ;-------------------------------------------
      00A33C A2 AE                 1083 	.word LINK 
                           0022BE  1084 	LINK=.
      00A33E 09                    1085 	.byte 9
      00A33F 55 50 44 41 54 2D 50  1086 	.ascii "UPDAT-PTR" 
             54 52
      00A348                       1087 UPDATPTR:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]



                                   1088 ;reset VP to previous position  
      00A348 CD 9D 02         [ 4] 1089 	call EEPVP 
      0022CB                       1090 	_DROP 
      00A34B 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00A34E CD 85 63         [ 4] 1091 	call AT
      00A351 CD 87 F0         [ 4] 1092 	call VPP 
      00A354 CD 85 51         [ 4] 1093 	call STORE
                                   1094 ;update CONTEXT and LAST 
      00A357 CD 9C EC         [ 4] 1095 	call EEPCP 
      0022DA                       1096 	_DROP
      00A35A 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00A35D CD 85 63         [ 4] 1097 	call AT
      00A360 CD 84 EF         [ 4] 1098 	call DOLIT 
      00A363 00 02                 1099 	.word 2 
      00A365 CD 88 BC         [ 4] 1100 	call PLUS 
      00A368 CD 86 99         [ 4] 1101 	call DUPP 
      00A36B CD 87 E2         [ 4] 1102 	call CNTXT 
      00A36E CD 85 51         [ 4] 1103 	call STORE
      00A371 CD 88 0E         [ 4] 1104 	call LAST
      00A374 CD 85 51         [ 4] 1105 	call STORE 
      00A377 CD 9D 1C         [ 4] 1106 	call UPDATLAST 
                                   1107 ;update CP 
      00A37A CD 87 FE         [ 4] 1108 	call CPP 
      00A37D CD 85 51         [ 4] 1109 	call STORE
      00A380 CD 9D 45         [ 4] 1110 	call UPDATCP 
      00A383 81               [ 4] 1111 	ret 
                                   1112 
                                   1113 ;-----------------------------
                                   1114 ; move interrupt sub-routine
                                   1115 ; in flash memory
                                   1116 ;----------------------------- 
      00A384 A3 3E                 1117 	.word LINK 
                           002306  1118 	LINK=. 
      00A386 06                    1119 	.byte 6
      00A387 49 46 4D 4F 56 45     1120 	.ascii "IFMOVE" 
      00A38D                       1121 IFMOVE:
      00A38D CD 87 AF         [ 4] 1122 	call TFLASH 
      00A390 CD 85 63         [ 4] 1123 	CALL AT 
      00A393 CD 85 18         [ 4] 1124 	CALL QBRAN 
      00A396 A3 38                 1125 	.word no_move 
      00A398 CD 87 FE         [ 4] 1126 	call CPP 
      00A39B CD 85 63         [ 4] 1127 	call AT 
      00A39E CD 86 99         [ 4] 1128 	call DUPP ; ( udl udl -- )
      00A3A1 CD 9D 02         [ 4] 1129 	call EEPVP 
      002324                       1130 	_DROP
      00A3A4 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00A3A7 CD 85 63         [ 4] 1131 	call AT  ; ( udl udl a )
      00A3AA CD 86 62         [ 4] 1132 	call TOR 
      00A3AD CD A2 A9         [ 4] 1133 	call FADDR
      00A3B0 CD 85 C5         [ 4] 1134 	call RAT ; ( udl ud a -- ) R: a 
      00A3B3 CC A2 E5         [ 2] 1135 	jp FMOVE2 
                                   1136 
                                   1137 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]



                           000001  4590 .if WANT_SCALING_CONST 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]



                                   4591         .include "const_ratio.asm"
                                      1 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                      2 ;; Copyright Jacques Deschênes 2019,2020,2021 
                                      3 ;; This file is part of stm32_eforth  
                                      4 ;;
                                      5 ;;     stm8_eforth is free software: you can redistribute it and/or modify
                                      6 ;;     it under the terms of the GNU General Public License as published by
                                      7 ;;     the Free Software Foundation, either version 3 of the License, or
                                      8 ;;     (at your option) any later version.
                                      9 ;;
                                     10 ;;     stm32_eforth is distributed in the hope that it will be useful,
                                     11 ;;     but WITHOUT ANY WARRANTY;; without even the implied warranty of
                                     12 ;;     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                                     13 ;;     GNU General Public License for more details.
                                     14 ;;
                                     15 ;;     You should have received a copy of the GNU General Public License
                                     16 ;;     along with stm32_eforth.  If not, see <http:;;www.gnu.org/licenses/>.
                                     17 ;;;;
                                     18 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     19 
                                     20 
                                     21 ;--------------------------------------------------------------------
                                     22 ; Irrationals constants 
                                     23 ; expressed as 2 integers ratio
                                     24 ; aproximation. These are to be used with scaling operators */ and */MOD 
                                     25 ; REF: https://www.forth.com/starting-forth/5-fixed-point-arithmetic/
                                     26 ;---------------------------------------------------------------------
                                     27 
                                     28 ;       PI ( --  355 113 )
                                     29 ; precision 8.5e-8 
                                     30 ; usage example to compute circle area
                                     31 ; : CAREA DUP * PI */ ;
                                     32 ; 
                                     33 
      00A3B6 A3 86                   34         .word LINK 
                           002338    35         LINK=.
      00A3B8 02                      36         .byte 2
      00A3B9 50 49                   37         .ascii "PI" 
      00A3BB                         38 PII:
      00A3BB 1D 00 04         [ 2]   39         subw x,#2*CELLL 
      00A3BE 90 AE 01 63      [ 2]   40         ldw y,#355 
      00A3C2 EF 02            [ 2]   41         ldw (2,x),y 
      00A3C4 90 AE 00 71      [ 2]   42         ldw y,#113 
      00A3C8 FF               [ 2]   43         ldw (x),y 
      00A3C9 81               [ 4]   44         ret 
                                     45 
                                     46 ;      SQRT2 ( -- 19601  13860 )
                                     47 ; precision: 1.5e-9 
                                     48 ; usage example to compute Voltage peek to peek from Vrms 
                                     49 ; : VPP SQRT2 */ 2 * ;
                                     50 ;
      00A3CA A3 B8                   51         .word LINK 
                           00234C    52         LINK=.
      00A3CC 05                      53         .byte 5 
      00A3CD 53 51 52 54 32          54         .ascii "SQRT2" 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal [24-Bits]



      00A3D2                         55 SQRT2:
      00A3D2 1D 00 04         [ 2]   56         subw x,#2*CELLL 
      00A3D5 90 AE 4C 91      [ 2]   57         ldw y,#19601 
      00A3D9 EF 02            [ 2]   58         ldw (2,x),y 
      00A3DB 90 AE 36 24      [ 2]   59         ldw y,#13860 
      00A3DF FF               [ 2]   60         ldw (x),y 
      00A3E0 81               [ 4]   61         ret 
                                     62 
                                     63 ;   SQRT3 ( -- 18817 10864 )
                                     64 ; precision: 1.1e-9
                                     65 ;
      00A3E1 A3 CC                   66         .word LINK 
                           002363    67         LINK=.
      00A3E3 05                      68         .byte 5
      00A3E4 53 51 52 54 33          69         .ascii "SQRT3" 
      00A3E9                         70 SQRT3: 
      00A3E9 1D 00 04         [ 2]   71     subw x,#2*CELLL 
      00A3EC 90 AE 49 81      [ 2]   72     ldw y,#18817 
      00A3F0 EF 02            [ 2]   73     ldw (2,x),y 
      00A3F2 90 AE 2A 70      [ 2]   74     ldw y,#10864 
      00A3F6 FF               [ 2]   75     ldw (x),y 
      00A3F7 81               [ 4]   76     ret 
                                     77 
                                     78 ;   E ( -- 28667 10546 )
                                     79 ; precision: 5.5e-9 
                                     80 ; natural log base 
      00A3F8 A3 E3                   81         .word LINK 
                           00237A    82         LINK=.
      00A3FA 01                      83         .byte 1
      00A3FB 45                      84         .ascii "E" 
      00A3FC                         85 ENEPER:
      00A3FC 1D 00 04         [ 2]   86     subw x,#2*CELLL 
      00A3FF 90 AE 6F FB      [ 2]   87     ldw y,#28667 
      00A403 EF 02            [ 2]   88     ldw (2,x),y 
      00A405 90 AE 29 32      [ 2]   89     ldw y,#10546 
      00A409 FF               [ 2]   90     ldw (x),y 
      00A40A 81               [ 4]   91     ret 
                                     92 
                                     93 ;   SQRT10 ( -- 22936 7253 )
                                     94 ; precision: 5.7e-9 
      00A40B A3 FA                   95         .word LINK 
                           00238D    96         LINK=.
      00A40D 06                      97         .byte 6 
      00A40E 53 51 52 54 31 30       98         .ascii "SQRT10" 
      00A414                         99 SQRT10:
      00A414 1D 00 04         [ 2]  100     subw x,#2*CELLL
      00A417 90 AE 59 98      [ 2]  101     ldw y,#22936 
      00A41B EF 02            [ 2]  102     ldw (2,x),y 
      00A41D 90 AE 1C 55      [ 2]  103     ldw y,#7253
      00A421 FF               [ 2]  104     ldw (x),y 
      00A422 81               [ 4]  105     ret 
                                    106 
                                    107 ;   12RT2 ( -- 26797 25293 )
                                    108 ; precision: 1.0e-9 
                                    109 ; used in music to compute well tempered scale
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]



      00A423 A4 0D                  110         .word LINK 
                           0023A5   111         LINK=. 
      00A425 05                     112         .byte 5 
      00A426 31 32 52 54 32         113         .ascii "12RT2"
      00A42B                        114 RT12_2:
      00A42B 1D 00 04         [ 2]  115     subw x,#2*CELLL 
      00A42E 90 AE 68 AD      [ 2]  116     ldw y,#26797
      00A432 EF 02            [ 2]  117     ldw (2,x),y 
      00A434 90 AE 62 CD      [ 2]  118     ldw y,#25293
      00A438 FF               [ 2]  119     ldw (x),y 
      00A439 81               [ 4]  120     ret 
                                    121 
                                    122 ;   LOG2s ( -- 2040 11103 )
                                    123 ; log(2)/1.6384
                                    124 ; precision: 1.1e-8
      00A43A A4 25                  125         .word LINK 
                           0023BC   126         LINK=.
      00A43C 05                     127         .byte 5 
      00A43D 4C 4F 47 32 53         128         .ascii "LOG2S" 
      00A442                        129 LOG2S:
      00A442 1D 00 04         [ 2]  130     subw x,#2*CELLL
      00A445 90 AE 07 F8      [ 2]  131     ldw y,#2040 
      00A449 EF 02            [ 2]  132     ldw (2,x),y 
      00A44B 90 AE 2B 5F      [ 2]  133     ldw y,#11103 
      00A44F FF               [ 2]  134     ldw (x),y 
      00A450 81               [ 4]  135     ret 
                                    136 
                                    137 ;   LN2 ( -- 485 11464 )
                                    138 ; ln(2)/16.384 
                                    139 ; precision: 1.0e-7 
      00A451 A4 3C                  140         .word LINK 
                           0023D3   141         LINK=.
      00A453 04                     142         .byte 4 
      00A454 4C 4E 32 53            143         .ascii "LN2S" 
      00A458                        144 LN2S: 
      00A458 1D 00 04         [ 2]  145     subw x,#2*CELLL
      00A45B 90 AE 01 E5      [ 2]  146     ldw y,#485
      00A45F EF 02            [ 2]  147     ldw (2,x),y 
      00A461 90 AE 2C C8      [ 2]  148     ldw y,#11464 
      00A465 FF               [ 2]  149     ldw (x),y 
      00A466 81               [ 4]  150     ret 
                                    151 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]



                                   4592 .endif
                           000001  4593 .if WANT_CONST_TABLE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]



                                   4594         .include "ctable.asm"
                                      1 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                      2 ;; Copyright Jacques Deschênes 2019,2020,2021 
                                      3 ;; This file is part of stm32_eforth  
                                      4 ;;
                                      5 ;;     stm8_eforth is free software: you can redistribute it and/or modify
                                      6 ;;     it under the terms of the GNU General Public License as published by
                                      7 ;;     the Free Software Foundation, either version 3 of the License, or
                                      8 ;;     (at your option) any later version.
                                      9 ;;
                                     10 ;;     stm32_eforth is distributed in the hope that it will be useful,
                                     11 ;;     but WITHOUT ANY WARRANTY;; without even the implied warranty of
                                     12 ;;     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                                     13 ;;     GNU General Public License for more details.
                                     14 ;;
                                     15 ;;     You should have received a copy of the GNU General Public License
                                     16 ;;     along with stm32_eforth.  If not, see <http:;;www.gnu.org/licenses/>.
                                     17 ;;;;
                                     18 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     19 
                                     20 
                                     21 ;------------------------------
                                     22 ; words to create and read 
                                     23 ; constants tables in FLASH 
                                     24 ; and EEPROM
                                     25 ;------------------------------
                                     26 
                                     27 ;-----------------------------
                                     28 ; allocate space in CODE area 
                                     29 ; for constant table.
                                     30 ; CALLOT ( u -- ad )
                                     31 ; u  bytes to allocates 
                                     32 ; ad data address as double.
                                     33 ;-----------------------------
      00A467 A4 53                   34     .word LINK 
                           0023E9    35     LINK=.
      00A469 06                      36     .byte 6
      00A46A 43 41 4C 4C 4F 54       37     .ascii "CALLOT"
      00A470                         38 CALLOT:
      00A470 CD 87 FE         [ 4]   39     CALL CPP
      00A473 CD 86 99         [ 4]   40     CALL DUPP 
      00A476 CD 85 63         [ 4]   41     CALL AT 
      00A479 CD 86 62         [ 4]   42     CALL TOR 
      00A47C CD 8C F3         [ 4]   43     CALL PSTOR 
      00A47F CD 9D 45         [ 4]   44     CALL UPDATCP 
      00A482 CD 85 B4         [ 4]   45     CALL RFROM
      00A485 CC 8C 83         [ 2]   46     JP ZERO 
                                     47 
                                     48 ;------------------------------
                                     49 ; create constants bytes table 
                                     50 ; in persistant memory
                                     51 ;  CTABLE ( n+ -- ad ; <string> )
                                     52 ; n+ bytes reserved 
                                     53 ;-----------------------------
      00A488 A4 69                   54     .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]



                           00240A    55     LINK=.
      00A48A 06                      56     .byte 6
      00A48B 43 54 41 42 4C 45       57     .ascii "CTABLE"
      00A491                         58 CTABLE:
      00A491 CD A4 70         [ 4]   59     CALL CALLOT     
      00A494 CC 99 D8         [ 2]   60     JP DCONST 
                                     61      
                                     62 
                                     63 ;--------------------------------
                                     64 ; create constants words table 
                                     65 ; in persistant memory 
                                     66 ; WTABLE ( n+ -- ad ; <string> )
                                     67 ; n+  words reserved  
                                     68 ;--------------------------------
      00A497 A4 8A                   69     .word LINK 
                           002419    70     LINK=.
      00A499 06                      71     .byte 6
      00A49A 57 54 41 42 4C 45       72     .ascii "WTABLE"
      00A4A0                         73 WTABLE:
      00A4A0 CD 8C 0A         [ 4]   74     CALL CELLS  
      00A4A3 CD A4 70         [ 4]   75     CALL CALLOT 
      00A4A6 CC 99 D8         [ 2]   76     JP DCONST 
                                     77 
                                     78 ;---------------------------------
                                     79 ; stack an element of CTABLE 
                                     80 ; CTABL@ ( u ad -- c )
                                     81 ; u element order {0..size-1}
                                     82 ; a|ad table address 
                                     83 ;--------------------------------
      00A4A9 A4 99                   84     .word LINK 
                           00242B    85     LINK=.
      00A4AB 06                      86     .byte 6
      00A4AC 43 54 41 42 4C 40       87     .ascii "CTABL@" 
      00A4B2                         88 CTAT:
      00A4B2 CD 9C 88         [ 4]   89     call FPSTOR 
      00A4B5 CD 9E 1A         [ 4]   90     call PTRPLUS 
      00A4B8 CC 9E 57         [ 2]   91     jp EE_CREAD 
                                     92 
                                     93 ;---------------------------------
                                     94 ; stack an element of WTABLE 
                                     95 ; WTABL@ ( u ud -- w )
                                     96 ; u is element order {0..size-1}
                                     97 ; a|ud table address 
                                     98 ;----------------------------------
      00A4BB A4 AB                   99     .word LINK 
                           00243D   100     LINK=.
      00A4BD 06                     101     .byte 6
      00A4BE 57 54 41 42 4C 40      102     .ascii "WTABL@" 
      00A4C4                        103 WTAT:
      00A4C4 CD 9C 88         [ 4]  104     call FPSTOR 
      00A4C7 CD 8C 0A         [ 4]  105     call CELLS 
      00A4CA CD 9E 1A         [ 4]  106     call PTRPLUS 
      00A4CD CD 9E 35         [ 4]  107     call EE_READ 
      00A4D0 81               [ 4]  108     ret 
                                    109 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 135.
Hexadecimal [24-Bits]



                                    110 ;--------------------------
                                    111 ; tool to initialize character table 
                                    112 ; CTINIT ( ad -- )
                                    113 ; ad is table address 
                                    114 ;--------------------------
      00A4D1 A4 BD                  115     .word LINK 
                           002453   116     LINK=.
      00A4D3 06                     117     .byte 6 
      00A4D4 43 54 49 4E 49 54      118     .ascii "CTINIT"
      00A4DA                        119 CTINIT:
      00A4DA CD 9C 88         [ 4]  120     CALL FPSTOR
      00A4DD CD 9D C6         [ 4]  121     CALL UNLOCK
      00A4E0 CD 8C 83         [ 4]  122     CALL ZERO 
      00A4E3 CD 8C 17         [ 4]  123 1$: CALL ONEP 
      00A4E6 CD 86 99         [ 4]  124     CALL DUPP 
      00A4E9 CD A5 36         [ 4]  125     CALL INTQ 
      00A4EC CD 85 18         [ 4]  126     CALL QBRAN 
      00A4EF A4 F9                  127     .word 2$
      00A4F1 CD 9E 71         [ 4]  128     call WR_BYTE 
      00A4F4 CD 85 34         [ 4]  129     CALL BRAN 
      00A4F7 A4 E3                  130     .word 1$ 
      002479                        131 2$: _DDROP 
      00A4F9 1C 00 04         [ 2]    1    ADDW X,#2*CELLL 
      00A4FC CD 9D EE         [ 4]  132     CALL LOCK 
      00A4FF 81               [ 4]  133     ret 
                                    134 
                                    135 ;--------------------------
                                    136 ; tool to initialize word table 
                                    137 ; WTINIT ( ad -- )
                                    138 ; ad is table address 
                                    139 ;--------------------------
      00A500 A4 D3                  140     .word LINK 
                           002482   141     LINK=.
      00A502 06                     142     .byte 6 
      00A503 57 54 49 4E 49 54      143     .ascii "WTINIT"
      00A509                        144 WTINIT:
      00A509 CD 9C 88         [ 4]  145     CALL FPSTOR
      00A50C CD 9D C6         [ 4]  146     CALL UNLOCK
      00A50F CD 8C 83         [ 4]  147     CALL ZERO 
      00A512 CD 8C 17         [ 4]  148 1$: CALL ONEP 
      00A515 CD 86 99         [ 4]  149     CALL DUPP
      00A518 CD A5 36         [ 4]  150     CALL INTQ
      00A51B CD 85 18         [ 4]  151     CALL QBRAN 
      00A51E A5 28                  152     .word 2$
      00A520 CD 9E 96         [ 4]  153     call WR_WORD 
      00A523 CD 85 34         [ 4]  154     CALL BRAN 
      00A526 A5 12                  155     .word 1$ 
      0024A8                        156 2$: _DDROP 
      00A528 1C 00 04         [ 2]    1    ADDW X,#2*CELLL 
      00A52B CD 9D EE         [ 4]  157     CALL LOCK 
      00A52E 81               [ 4]  158     ret 
                                    159 
                                    160 ;------------------------
                                    161 ; Prompted input for integer 
                                    162 ; display n+ in bracket and
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 136.
Hexadecimal [24-Bits]



                                    163 ; '?' 
                                    164 ; [N]? ( n+ -- a )
                                    165 ;------------------------
      00A52F A5 02                  166     .word LINK 
                           0024B1   167     LINK=.
      00A531 04                     168     .byte 4
      00A532 5B 4E 5D 3F            169     .ascii "[N]?" 
      00A536                        170 INTQ:
      00A536 CD 90 09         [ 4]  171     CALL CR 
      00A539 CD 84 EF         [ 4]  172     call DOLIT 
      00A53C 00 5B                  173     .word '[
      00A53E CD 84 B6         [ 4]  174     CALL EMIT 
      00A541 CD 90 B0         [ 4]  175     CALL DOT 
      00A544 CD 90 36         [ 4]  176     CALL  DOTQP
      00A547 03                     177     .byte 3
      00A548 5D 3F 20               178     .ascii "]? " 
      00A54B CD 94 40         [ 4]  179     CALL QUERY 
      00A54E CD 92 6B         [ 4]  180     call TOKEN 
      00A551 CC A6 10         [ 2]  181     jp NUMBQ
                                    182 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 137.
Hexadecimal [24-Bits]



                                   4595 .endif
                           000001  4596 .if WANT_DOUBLE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 138.
Hexadecimal [24-Bits]



                                   4597         .include "double.asm"
                                      1 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                      2 ;; Copyright Jacques Deschênes 2019,2020,2021 
                                      3 ;; This file is part of stm32_eforth  
                                      4 ;;
                                      5 ;;     stm8_eforth is free software: you can redistribute it and/or modify
                                      6 ;;     it under the terms of the GNU General Public License as published by
                                      7 ;;     the Free Software Foundation, either version 3 of the License, or
                                      8 ;;     (at your option) any later version.
                                      9 ;;
                                     10 ;;     stm32_eforth is distributed in the hope that it will be useful,
                                     11 ;;     but WITHOUT ANY WARRANTY;; without even the implied warranty of
                                     12 ;;     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                                     13 ;;     GNU General Public License for more details.
                                     14 ;;
                                     15 ;;     You should have received a copy of the GNU General Public License
                                     16 ;;     along with stm32_eforth.  If not, see <http:;;www.gnu.org/licenses/>.
                                     17 ;;;;
                                     18 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     19 
                                     20 ;************************************
                                     21 ;    doubles integers library 
                                     22 ;    doubles are signed 32 bits 
                                     23 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     24 
                                     25 
                                     26     .module DOUBLE 
                                     27 
                           000001    28     DVER_MAJOR=1 
                           000000    29     DVER_MINOR=0 
                                     30 
                                     31 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     32 ;  DBL-VER ( -- )
                                     33 ;  print library version 
                                     34 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0024D4                         35     _HEADER DBLVER,7,"DBL-VER"
      00A554 A5 31                    1         .word LINK 
                           0024D6     2         LINK=.
      00A556 07                       3         .byte 7  
      00A557 44 42 4C 2D 56 45 52     4         .ascii "DBL-VER"
      00A55E                          5         DBLVER:
      00A55E CD 90 09         [ 4]   36     CALL CR 
      00A561 CD 90 36         [ 4]   37     CALL DOTQP 
      00A564 18                      38     .byte  24 
      00A565 64 6F 75 62 6C 65 20    39     .ascii "double integer library, "
             69 6E 74 65 67 65 72
             20 6C 69 62 72 61 72
             79 2C 20
      00A57D CD 9B 87         [ 4]   40     CALL PRT_LICENCE
      00A580 CD 9B 5F         [ 4]   41     CALL COPYRIGHT  
      002503                         42     _DOLIT DVER_MAJOR 
      00A583 CD 84 EF         [ 4]    1     CALL DOLIT 
      00A586 00 01                    2     .word DVER_MAJOR 
      002508                         43     _DOLIT DVER_MINOR  
      00A588 CD 84 EF         [ 4]    1     CALL DOLIT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
Hexadecimal [24-Bits]



      00A58B 00 00                    2     .word DVER_MINOR 
      00A58D CC 9B 9B         [ 2]   44     JP PRINT_VERSION  
                                     45 
                                     46 
                                     47 ; check for negative sign 
                                     48 ; ajust pointer and cntr 
      00A590                         49 nsign: ; addr cntr -- addr cntr f 
      00A590 1D 00 02         [ 2]   50     SUBW X,#CELLL ; a cntr f 
      00A593 90 93            [ 1]   51     LDW Y,X 
      00A595 90 EE 04         [ 2]   52     LDW Y,(4,Y) ; addr 
      00A598 90 F6            [ 1]   53     LD A,(Y) ; char=*addr  
      00A59A A1 2D            [ 1]   54     CP A,#'-' 
      00A59C 27 03            [ 1]   55     JREQ NEG_SIGN 
      00A59E 4F               [ 1]   56     CLR A  
      00A59F 20 18            [ 2]   57     JRA STO_SIGN 
      00A5A1                         58 NEG_SIGN:
                                     59 ; increment addr 
      00A5A1 90 93            [ 1]   60     LDW Y,X 
      00A5A3 90 EE 04         [ 2]   61     LDW Y,(4,Y)
      00A5A6 72 A9 00 01      [ 2]   62     ADDW Y,#1   ;addr+1 
      00A5AA EF 04            [ 2]   63     LDW (4,X),Y 
                                     64 ; decrement cntr 
      00A5AC 90 93            [ 1]   65     LDW Y,X
      00A5AE 90 EE 02         [ 2]   66     LDW Y,(2,Y)
      00A5B1 72 A2 00 01      [ 2]   67     SUBW Y,#1   ;cntr-1 
      00A5B5 EF 02            [ 2]   68     LDW (2,X),Y 
      00A5B7 A6 FF            [ 1]   69     LD A,#0XFF
      00A5B9                         70 STO_SIGN:   
      00A5B9 F7               [ 1]   71     LD (X),A 
      00A5BA E7 01            [ 1]   72     LD (1,X),A 
      00A5BC 81               [ 4]   73     RET 
                                     74 
                                     75 
                                     76 ; get all digits in row 
                                     77 ; stop at first non-digit or end of string 
                                     78 ; ( dlo dhi a cntr -- dlo dhi [ a+ cntr- | a+ 0 ] )
      00A5BD                         79 parse_digits:
      00A5BD                         80 1$:
      00A5BD CD 86 99         [ 4]   81     CALL DUPP 
      002540                         82     _QBRAN 5$ 
      00A5C0 CD 85 18         [ 4]    1     CALL QBRAN
      00A5C3 A6 05                    2     .word 5$
      00A5C5 CD 86 62         [ 4]   83     CALL TOR   ; dlo dhi a R: cntr 
      00A5C8 CD 8D 46         [ 4]   84     CALL COUNT ; dlo dhi a+ char 
      00A5CB CD 87 5F         [ 4]   85     CALL BASE 
      00A5CE CD 85 63         [ 4]   86     CALL AT 
      00A5D1 CD 8F 4F         [ 4]   87     CALL DIGTQ 
      002554                         88     _QBRAN 4$ ; not a digit
      00A5D4 CD 85 18         [ 4]    1     CALL QBRAN
      00A5D7 A5 FC                    2     .word 4$
      00A5D9 CD A9 43         [ 4]   89     CALL DTOR  ; dlo dhi R: cntr a+ c  
      00A5DC CD 87 5F         [ 4]   90     CALL BASE 
      00A5DF CD 85 63         [ 4]   91     CALL AT 
      00A5E2 CD A7 CE         [ 4]   92     CALL DSSTAR
      00A5E5 CD 85 B4         [ 4]   93     CALL RFROM 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
Hexadecimal [24-Bits]



      00A5E8 CD 8C 83         [ 4]   94     CALL ZERO 
      00A5EB CD AC 06         [ 4]   95     CALL DPLUS 
      00A5EE CD 85 B4         [ 4]   96     CALL RFROM  ; dlo dhi a+ 
      00A5F1 CD 85 B4         [ 4]   97     CALL RFROM ; dlo dhi a+ cntr 
      00A5F4 CD 8C 24         [ 4]   98     CALL ONEM 
      002577                         99     _BRAN 1$ ; dlo dhi a+ R: 
      00A5F7 CD 85 34         [ 4]    1     CALL BRAN 
      00A5FA A5 BD                    2     .word 1$ 
      00257C                        100 4$: _DROP  ; dlo dhi a+ 
      00A5FC 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00A5FF CD 8C 24         [ 4]  101     CALL ONEM  ; unget char 
      00A602 CD 85 B4         [ 4]  102     CALL RFROM ; dlo dhi a+ cntr-
      00A605                        103 5$:
      00A605 81               [ 4]  104     RET 
                                    105 
                                    106 
                                    107 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    108 ;   NUMBER? (a -- s -1 |d -2 | a F )
                                    109 ;   convert string to integer 
                                    110 ;   double begin with '#' 
                                    111 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002586                        112     _HEADER NUMBQ,7,"NUMBER?"
      00A606 A5 56                    1         .word LINK 
                           002588     2         LINK=.
      00A608 07                       3         .byte 7  
      00A609 4E 55 4D 42 45 52 3F     4         .ascii "NUMBER?"
      00A610                          5         NUMBQ:
                                    113 ; save current base value 
      00A610 CD 87 5F         [ 4]  114     CALL BASE 
      00A613 CD 85 63         [ 4]  115     CALL AT 
      00A616 CD 86 62         [ 4]  116     CALL TOR 
                                    117 ; initialize integer to 0     
      00A619 1D 00 04         [ 2]  118     SUBW X,#4 
      00A61C 90 5F            [ 1]  119     CLRW Y 
      00A61E FF               [ 2]  120     LDW (X),Y 
      00A61F EF 02            [ 2]  121     LDW (2,X),Y ; a 0 0 R: base  
      0025A1                        122     _DOLIT 2 
      00A621 CD 84 EF         [ 4]    1     CALL DOLIT 
      00A624 00 02                    2     .word 2 
      00A626 CD 8C DC         [ 4]  123     CALL PICK  ; a 0 0 a R: base    
      00A629 CD 8D 46         [ 4]  124     CALL COUNT ; a 0 0 a+ n 
                                    125 ; check for '#' double integer 
      00A62C CD 86 C1         [ 4]  126     CALL OVER  ; a 0 0 a+ n a+
      00A62F CD 85 81         [ 4]  127     CALL CAT   ; a 0 0 a+ n c 
      0025B2                        128     _DOLIT '#' ; a 0 0 a+ n c '#' 
      00A632 CD 84 EF         [ 4]    1     CALL DOLIT 
      00A635 00 23                    2     .word '#' 
      00A637 CD 89 7A         [ 4]  129     CALL EQUAL 
      00A63A CD 86 62         [ 4]  130     CALL TOR   ; a 0 0 a+ n R: base d? 
      00A63D CD 85 C5         [ 4]  131     CALL RAT   ; a 0 0 a+ n d? R: base d?
      0025C0                        132     _QBRAN NUMQ0
      00A640 CD 85 18         [ 4]    1     CALL QBRAN
      00A643 A6 51                    2     .word NUMQ0
                                    133 ; update a and count
      00A645 CD 86 A9         [ 4]  134     CALL SWAPP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 141.
Hexadecimal [24-Bits]



      00A648 CD 8C 17         [ 4]  135     CALL ONEP 
      00A64B CD 86 A9         [ 4]  136     CALL SWAPP 
      00A64E CD 8C 24         [ 4]  137     CALL ONEM  ; a 0 0 a+ n- R: base d?
                                    138 ; check for '$' hexadecimal  
      00A651                        139 NUMQ0: 
      00A651 CD 86 C1         [ 4]  140     CALL OVER   
      00A654 CD 85 81         [ 4]  141     CALL CAT   
      0025D7                        142     _DOLIT '$'
      00A657 CD 84 EF         [ 4]    1     CALL DOLIT 
      00A65A 00 24                    2     .word '$' 
      00A65C CD 89 7A         [ 4]  143     CALL EQUAL ; a 0 0 a+ n- f  
      0025DF                        144     _QBRAN NUMQ1 
      00A65F CD 85 18         [ 4]    1     CALL QBRAN
      00A662 A6 73                    2     .word NUMQ1
      00A664 CD 8F 26         [ 4]  145     CALL HEX   ; switch to hexadecimal base 
                                    146 ; update a and count 
      00A667 CD 86 A9         [ 4]  147     CALL SWAPP 
      00A66A CD 8C 17         [ 4]  148     CALL ONEP 
      00A66D CD 86 A9         [ 4]  149     CALL SWAPP
      00A670 CD 8C 24         [ 4]  150     CALL ONEM ; a 0 0 a+ n-  R: base d?
                                    151 ; check for minus sign 
      00A673                        152 NUMQ1: 
      00A673 CD A5 90         [ 4]  153     CALL nsign 
      00A676 CD 86 62         [ 4]  154     CALL TOR ; R: base d? sign  
                                    155 ; check for end of string     
      00A679 CD 88 4C         [ 4]  156     CALL QDUP    ; a dlo dhi a+ cntr R: base d? sign 
      0025FC                        157     _QBRAN NUMQ4 ; yes , not a number 
      00A67C CD 85 18         [ 4]    1     CALL QBRAN
      00A67F A6 BE                    2     .word NUMQ4
      00A681 CD A5 BD         [ 4]  158     CALL parse_digits
      00A684 CD 88 4C         [ 4]  159     CALL QDUP 
      00A687 CD 86 E2         [ 4]  160     CALL ZEQUAL  
      00260A                        161     _QBRAN NUMQ4 ; error not end of string  ( a dlo dhi a+ R: base d? sign )
      00A68A CD 85 18         [ 4]    1     CALL QBRAN
      00A68D A6 BE                    2     .word NUMQ4
      00260F                        162     _DROP  ; a dlo dhi 
      00A68F 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00A692 CD 85 B4         [ 4]  163     CALL RFROM  ; a dlo dhi sign 
      002615                        164     _QBRAN NUMQ3
      00A695 CD 85 18         [ 4]    1     CALL QBRAN
      00A698 A6 9D                    2     .word NUMQ3
      00A69A CD 89 18         [ 4]  165     CALL DNEGA
      00A69D                        166 NUMQ3: 
      00A69D CD 88 5D         [ 4]  167     CALL ROT ; dlo dhi a  R: base d?
      002620                        168     _DROP
      00A6A0 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      002623                        169     _DOLIT -2  ; double return -2 flag 
      00A6A3 CD 84 EF         [ 4]    1     CALL DOLIT 
      00A6A6 FF FE                    2     .word -2 
      00A6A8 CD 85 B4         [ 4]  170     CALL RFROM ; dlo dhi d? R: base 
      00262B                        171     _TBRAN NUMQ8 
      00A6AB CD 85 26         [ 4]    1     CALL TBRAN 
      00A6AE A6 C7                    2     .word NUMQ8 
      00A6B0 CD 86 A9         [ 4]  172     CALL SWAPP 
      002633                        173     _DROP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 142.
Hexadecimal [24-Bits]



      00A6B3 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00A6B6 CD 8C 17         [ 4]  174     CALL ONEP   ; single return -1 flag   
      002639                        175     _BRAN NUMQ8
      00A6B9 CD 85 34         [ 4]    1     CALL BRAN 
      00A6BC A6 C7                    2     .word NUMQ8 
      00A6BE                        176 NUMQ4: ; not end of string error , ( a dlo dhi a+ cntr R: base d? sign )
                           000001   177 .if WANT_FLOAT
      00A6BE CD 85 B4         [ 4]  178     CALL RFROM ; sign 
      00A6C1 CD 85 B4         [ 4]  179     CALL RFROM ; d? 
      00A6C4 CD AF E1         [ 4]  180     CALL FLOATQ ; ( a dlo dhi a+ cntr sign d? )    
                           000000   181 .else 
                                    182     ADDW X,#4 ; drop dhi a+  , ( a dlo R: base d? sign ) 
                                    183     ADDW SP,#4 ; drop d? sign  R: base 
                                    184     CLRW Y 
                                    185     LDW (X),Y ; dlo replaced by 0 ( -- a 0 R: base ) 
                                    186 .endif 
                                    187 ; restore original base value     
      00A6C7                        188 NUMQ8: 
      00A6C7 CD 85 B4         [ 4]  189     CALL RFROM 
      00A6CA CD 87 5F         [ 4]  190     CALL BASE 
      00A6CD CD 85 51         [ 4]  191     CALL STORE 
      00A6D0 81               [ 4]  192     RET 
                                    193 
                                    194 
                                    195 
                                    196 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    197 ;   DABS ( d -- d )
                                    198 ;   absolute value of double
                                    199 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002651                        200     _HEADER DABS,4,"DABS"
      00A6D1 A6 08                    1         .word LINK 
                           002653     2         LINK=.
      00A6D3 04                       3         .byte 4  
      00A6D4 44 41 42 53              4         .ascii "DABS"
      00A6D8                          5         DABS:
      00A6D8 F6               [ 1]  201     LD A,(X) 
      00A6D9 A4 80            [ 1]  202     AND A,#0X80 
      00A6DB 27 03            [ 1]  203     JREQ DABS1 
      00A6DD CD 89 18         [ 4]  204     CALL DNEGA 
      00A6E0                        205 DABS1:
      00A6E0 81               [ 4]  206     RET 
                                    207 
                                    208 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    209 ;  DSIGN ( d -- d f )
                                    210 ;  sign of double 
                                    211 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002661                        212     _HEADER DSIGN,5,"DSIGN"
      00A6E1 A6 D3                    1         .word LINK 
                           002663     2         LINK=.
      00A6E3 05                       3         .byte 5  
      00A6E4 44 53 49 47 4E           4         .ascii "DSIGN"
      00A6E9                          5         DSIGN:
      00A6E9 A6 00            [ 1]  213     LD A,#0 
      00A6EB 90 93            [ 1]  214     LDW Y,X 
      00A6ED 90 FE            [ 2]  215     LDW Y,(Y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 143.
Hexadecimal [24-Bits]



      00A6EF 2A 02            [ 1]  216     JRPL DSIGN1
      00A6F1 A6 FF            [ 1]  217     LD A,#0XFF 
      00A6F3                        218 DSIGN1:
      00A6F3 1D 00 02         [ 2]  219     SUBW X,#2 
      00A6F6 F7               [ 1]  220     LD (X),A 
      00A6F7 E7 01            [ 1]  221     LD (1,X),A 
      00A6F9 81               [ 4]  222     RET 
                                    223 
                                    224 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    225 ;   DS/MOD ( ud us - ur qud )
                                    226 ;   unsigned divide double by single 
                                    227 ;   return double quotient 
                                    228 ;   and single remainder 
                                    229 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00267A                        230     _HEADER DSLMOD,6,"DS/MOD"
      00A6FA A6 E3                    1         .word LINK 
                           00267C     2         LINK=.
      00A6FC 06                       3         .byte 6  
      00A6FD 44 53 2F 4D 4F 44        4         .ascii "DS/MOD"
      00A703                          5         DSLMOD:
      00A703 90 93            [ 1]  231         LDW     Y,X             ; stack pointer to Y
      00A705 FE               [ 2]  232         LDW     X,(X)           ; un
      00A706 BF 26            [ 2]  233         LDW     YTEMP,X         ; save un
      00A708 93               [ 1]  234         LDW     X,Y
      00A709 89               [ 2]  235         PUSHW   X               ; save stack pointer
      00A70A 90 89            [ 2]  236         PUSHW   Y 
      00A70C EE 02            [ 2]  237         LDW     X,(2,X)           ; X=udh
      00A70E 90 BE 26         [ 2]  238         LDW     Y,YTEMP         ; divisor 
      00A711 65               [ 2]  239         DIVW    X,Y 
      00A712 BF 24            [ 2]  240         LDW     XTEMP,X         ; QUOTIENT hi 
      00A714 93               [ 1]  241         LDW     X,Y             ; remainder in X 
      00A715 90 85            [ 2]  242         POPW    Y 
      00A717 90 EE 04         [ 2]  243         LDW     Y,(4,Y)         ; Y=udl (offset before drop)
      00A71A A6 10            [ 1]  244         LD      A,#16           ; loop count
      00A71C 90 58            [ 2]  245         SLLW    Y               ; udl shift udl into udh
      00A71E                        246 DSLMOD3:
      00A71E 59               [ 2]  247         RLCW    X               ; rotate udl bit into uhdh (= remainder)
      00A71F 25 04            [ 1]  248         JRC     DSLMODa         ; if carry out of rotate
      00A721 B3 26            [ 2]  249         CPW     X,YTEMP         ; compare udh to un
      00A723 25 05            [ 1]  250         JRULT   DSLMOD4         ; can't subtract
      00A725                        251 DSLMODa:
      00A725 72 B0 00 26      [ 2]  252         SUBW    X,YTEMP         ; can subtract
      00A729 98               [ 1]  253         RCF
      00A72A                        254 DSLMOD4:
      00A72A 8C               [ 1]  255         CCF                     ; quotient bit
      00A72B 90 59            [ 2]  256         RLCW    Y               ; rotate into quotient, rotate out udl
      00A72D 4A               [ 1]  257         DEC     A               ; repeat
      00A72E 26 EE            [ 1]  258         JRNE    DSLMOD3           ; if A == 0
      00A730                        259 DSLMODb:
      00A730 BF 26            [ 2]  260         LDW     YTEMP,X         ; done, save remainder
      00A732 85               [ 2]  261         POPW    X               ; restore stack pointer
      00A733 EF 02            [ 2]  262         LDW     (2,X),Y           ; save quotient low 
      00A735 90 BE 24         [ 2]  263         LDW     Y,XTEMP         ; quotient hi 
      00A738 FF               [ 2]  264         LDW     (X),Y           ; save quotient hi 
      00A739 90 BE 26         [ 2]  265         LDW     Y,YTEMP         ; remainder onto stack
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
Hexadecimal [24-Bits]



      00A73C EF 04            [ 2]  266         LDW     (4,X),Y
      00A73E 81               [ 4]  267         RET 
                                    268 
                                    269 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    270 ;   D# ( d -- d )
                                    271 ;   extract least digit 
                                    272 ;   from double integer 
                                    273 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0026BF                        274     _HEADER DDIG,2,"D#"
      00A73F A6 FC                    1         .word LINK 
                           0026C1     2         LINK=.
      00A741 02                       3         .byte 2  
      00A742 44 23                    4         .ascii "D#"
      00A744                          5         DDIG:
      00A744 CD 87 5F         [ 4]  275     CALL BASE 
      00A747 CD 85 63         [ 4]  276     CALL AT 
      00A74A CD A7 03         [ 4]  277     CALL DSLMOD
      00A74D CD 88 5D         [ 4]  278     CALL ROT   
      00A750 CD 8E 4F         [ 4]  279     CALL DIGIT 
      00A753 CD 8E 9B         [ 4]  280     CALL HOLD 
      00A756 81               [ 4]  281     RET 
                                    282 
                                    283 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    284 ;    D#S ( d -- s )
                                    285 ;   extract digit from double 
                                    286 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0026D7                        287     _HEADER DDIGS,3,"D#S"
      00A757 A7 41                    1         .word LINK 
                           0026D9     2         LINK=.
      00A759 03                       3         .byte 3  
      00A75A 44 23 53                 4         .ascii "D#S"
      00A75D                          5         DDIGS:
      00A75D CD A7 44         [ 4]  288     CALL    DDIG 
      00A760 CD 88 A7         [ 4]  289     CALL    DDUP 
      00A763 CD A8 C9         [ 4]  290     CALL    DZEQUAL
      0026E6                        291     _QBRAN  DDIGS 
      00A766 CD 85 18         [ 4]    1     CALL QBRAN
      00A769 A7 5D                    2     .word DDIGS
      00A76B CD 86 8F         [ 4]  292     CALL    DROP 
      00A76E 81               [ 4]  293     RET 
                                    294 
                                    295 
                                    296 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    297 ;   D. ( d -- )
                                    298 ;   display double integer 
                                    299 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0026EF                        300     _HEADER DDOT,2,"D."
      00A76F A7 59                    1         .word LINK 
                           0026F1     2         LINK=.
      00A771 02                       3         .byte 2  
      00A772 44 2E                    4         .ascii "D."
      00A774                          5         DDOT:
      00A774 CD 8F C7         [ 4]  301     CALL SPACE 
      00A777 CD A6 E9         [ 4]  302     CALL DSIGN 
      00A77A CD 86 62         [ 4]  303     CALL TOR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 145.
Hexadecimal [24-Bits]



      00A77D CD 85 C5         [ 4]  304     CALL RAT 
      002700                        305     _QBRAN DDOT0
      00A780 CD 85 18         [ 4]    1     CALL QBRAN
      00A783 A7 88                    2     .word DDOT0
      00A785 CD 89 18         [ 4]  306     CALL DNEGA 
      00A788                        307 DDOT0:     
      00A788 CD 8E 8B         [ 4]  308     CALL BDIGS 
      00A78B CD A7 5D         [ 4]  309     CALL DDIGS 
      00A78E CD 85 B4         [ 4]  310     CALL RFROM 
      002711                        311     _QBRAN DDOT1 
      00A791 CD 85 18         [ 4]    1     CALL QBRAN
      00A794 A7 9E                    2     .word DDOT1
      002716                        312     _DOLIT '-' 
      00A796 CD 84 EF         [ 4]    1     CALL DOLIT 
      00A799 00 2D                    2     .word '-' 
      00A79B CD 8E 9B         [ 4]  313     CALL HOLD 
      00A79E                        314 DDOT1: 
      00A79E CD 8E F0         [ 4]  315     CALL EDIGS 
      00A7A1 CD 8F F1         [ 4]  316     CALL TYPES     
      00A7A4 81               [ 4]  317     RET 
                                    318 
                                    319 
                                    320 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    321 ;  UDS* ( ud u -- ud*u )
                                    322 ;  uint32*uint16 
                                    323 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002725                        324     _HEADER UDSSTAR,4,"UDS*"
      00A7A5 A7 71                    1         .word LINK 
                           002727     2         LINK=.
      00A7A7 04                       3         .byte 4  
      00A7A8 55 44 53 2A              4         .ascii "UDS*"
      00A7AC                          5         UDSSTAR:
      00A7AC CD 86 62         [ 4]  325     CALL TOR 
      00A7AF CD 86 A9         [ 4]  326     CALL SWAPP 
      00A7B2 CD 85 C5         [ 4]  327     CALL RAT 
      00A7B5 CD 8B 4C         [ 4]  328     CALL UMSTA ; udlo*u 
      00A7B8 CD 88 5D         [ 4]  329     CALL ROT 
      00A7BB CD 85 B4         [ 4]  330     CALL RFROM 
      00A7BE CD 8B 4C         [ 4]  331     CALL UMSTA ; udhi*u 
      002741                        332     _DROP  ; drop overflow 
      00A7C1 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00A7C4 CD 88 BC         [ 4]  333     CALL PLUS  ; udlo*u+(uhi*u<<16)
      00A7C7 81               [ 4]  334     RET 
                                    335 
                                    336 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    337 ; multiply double by unsigned single 
                                    338 ; return double 
                                    339 ;  ( d u -- d )
                                    340 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002748                        341     _HEADER DSSTAR,3,"DS*"
      00A7C8 A7 A7                    1         .word LINK 
                           00274A     2         LINK=.
      00A7CA 03                       3         .byte 3  
      00A7CB 44 53 2A                 4         .ascii "DS*"
      00A7CE                          5         DSSTAR:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 146.
Hexadecimal [24-Bits]



                                    342 ;DSSTAR:
      00A7CE CD 86 62         [ 4]  343     CALL TOR
      00A7D1 CD A6 E9         [ 4]  344     CALL DSIGN 
      00A7D4 CD 88 7C         [ 4]  345     CALL NROT 
      00A7D7 CD A6 D8         [ 4]  346     CALL DABS
      00A7DA CD 85 B4         [ 4]  347     CALL RFROM 
      00A7DD CD A7 AC         [ 4]  348     CALL UDSSTAR  
      00A7E0 CD 88 5D         [ 4]  349     CALL ROT 
      002763                        350     _QBRAN DSSTAR3 
      00A7E3 CD 85 18         [ 4]    1     CALL QBRAN
      00A7E6 A7 EB                    2     .word DSSTAR3
      00A7E8 CD 89 18         [ 4]  351     CALL DNEGA 
      00A7EB                        352 DSSTAR3:
      00A7EB 81               [ 4]  353     RET 
                                    354 
                                    355 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    356 ;  2SWAP ( d1 d2 -- d2 d1 )
                                    357 ;  swap double 
                                    358 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00276C                        359     _HEADER DSWAP,5,"2SWAP"
      00A7EC A7 CA                    1         .word LINK 
                           00276E     2         LINK=.
      00A7EE 05                       3         .byte 5  
      00A7EF 32 53 57 41 50           4         .ascii "2SWAP"
      00A7F4                          5         DSWAP:
      00A7F4 90 93            [ 1]  360     LDW Y,X 
      00A7F6 90 FE            [ 2]  361     LDW Y,(Y)
      00A7F8 90 BF 26         [ 2]  362     LDW YTEMP,Y ; d2 hi 
      00A7FB 90 93            [ 1]  363     LDW Y,X 
      00A7FD 90 EE 02         [ 2]  364     LDW Y,(2,Y)
      00A800 90 BF 24         [ 2]  365     LDW XTEMP,Y  ; d2 lo 
      00A803 90 93            [ 1]  366     LDW Y,X 
      00A805 90 EE 04         [ 2]  367     LDW Y,(4,Y)  ; d1 hi 
      00A808 FF               [ 2]  368     LDW (X),Y 
      00A809 90 93            [ 1]  369     LDW Y,X
      00A80B 90 EE 06         [ 2]  370     LDW Y,(6,Y)  ; d1 lo 
      00A80E EF 02            [ 2]  371     LDW (2,X),Y
      00A810 90 BE 26         [ 2]  372     LDW Y,YTEMP  
      00A813 EF 04            [ 2]  373     LDW (4,X),Y 
      00A815 90 BE 24         [ 2]  374     LDW Y,XTEMP 
      00A818 EF 06            [ 2]  375     LDW (6,X),Y 
      00A81A 81               [ 4]  376     RET 
                                    377 
                                    378 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    379 ;    DCLZ ( d -- u )
                                    380 ;    double count leading zeros
                                    381 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00279B                        382     _HEADER DCLZ,4,"DCLZ"
      00A81B A7 EE                    1         .word LINK 
                           00279D     2         LINK=.
      00A81D 04                       3         .byte 4  
      00A81E 44 43 4C 5A              4         .ascii "DCLZ"
      00A822                          5         DCLZ:
      00A822 4F               [ 1]  383     CLR A 
      00A823 90 93            [ 1]  384     LDW Y,X 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 147.
Hexadecimal [24-Bits]



      00A825 90 FE            [ 2]  385     LDW Y,(Y)
      00A827 2B 18            [ 1]  386     JRMI DCLZ8 ; no leading zero 
      00A829 27 09            [ 1]  387     JREQ DCLZ4 ; >=16 
      00A82B                        388 DCLZ1: ; <16
      00A82B 90 58            [ 2]  389     SLLW Y
      00A82D 4C               [ 1]  390     INC A 
      00A82E 90 5D            [ 2]  391     TNZW Y 
      00A830 2B 0F            [ 1]  392     JRMI DCLZ8
      00A832 20 F7            [ 2]  393     JRA DCLZ1 
      00A834                        394 DCLZ4: ; >=16 
      00A834 A6 10            [ 1]  395     LD A,#16 
      00A836 90 93            [ 1]  396     LDW Y,X 
      00A838 90 EE 02         [ 2]  397     LDW Y,(2,Y)
      00A83B 2B 04            [ 1]  398     JRMI DCLZ8 
      00A83D 26 EC            [ 1]  399     JRNE DCLZ1 
      00A83F AB 10            [ 1]  400     ADD A,#16
      00A841                        401 DCLZ8: 
      00A841 1C 00 02         [ 2]  402     ADDW X,#2 
      00A844 90 5F            [ 1]  403     CLRW Y 
      00A846 90 97            [ 1]  404     LD YL,A 
      00A848 FF               [ 2]  405     LDW (X),Y 
      00A849 81               [ 4]  406     RET 
                                    407 
                                    408 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    409 ;   <2ROT ( d1 d2 d3 -- d3 d1 d2 )
                                    410 ;   rotate left doubles 
                                    411 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0027CA                        412     _HEADER NDROT,5,"<2ROT"
      00A84A A8 1D                    1         .word LINK 
                           0027CC     2         LINK=.
      00A84C 05                       3         .byte 5  
      00A84D 3C 32 52 4F 54           4         .ascii "<2ROT"
      00A852                          5         NDROT:
                                    413 ; save d3 in temp 
      00A852 90 93            [ 1]  414     LDW Y,X 
      00A854 90 FE            [ 2]  415     LDW Y,(Y)
      00A856 90 BF 26         [ 2]  416     LDW YTEMP,Y  ; d3 hi 
      00A859 90 93            [ 1]  417     LDW Y,X 
      00A85B 90 EE 02         [ 2]  418     LDW Y,(2,Y)
      00A85E 90 BF 24         [ 2]  419     LDW XTEMP,Y  ; d3 lo 
                                    420 ; put d2 in d1 slot 
      00A861 90 93            [ 1]  421     LDW Y,X 
      00A863 90 EE 04         [ 2]  422     LDW Y,(4,Y) 
      00A866 FF               [ 2]  423     LDW (X),Y   ; d2 hi 
      00A867 90 93            [ 1]  424     LDW Y,X 
      00A869 90 EE 06         [ 2]  425     LDW Y,(6,Y)
      00A86C EF 02            [ 2]  426     LDW (2,X),Y ; d2 lo
                                    427 ; put d1 in d2 slot 
      00A86E 90 93            [ 1]  428     LDW Y,X 
      00A870 90 EE 08         [ 2]  429     LDW Y,(8,Y) 
      00A873 EF 04            [ 2]  430     LDW (4,X),Y ; d1 hi 
      00A875 90 93            [ 1]  431     LDW Y,X 
      00A877 90 EE 0A         [ 2]  432     LDW Y,(10,Y)
      00A87A EF 06            [ 2]  433     LDW (6,X),Y  ; d1 lo 
                                    434 ; put d3 in d1 slot 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 148.
Hexadecimal [24-Bits]



      00A87C 90 BE 26         [ 2]  435     LDW Y,YTEMP 
      00A87F EF 08            [ 2]  436     LDW (8,X),Y  ; d3 hi 
      00A881 90 BE 24         [ 2]  437     LDW Y,XTEMP 
      00A884 EF 0A            [ 2]  438     LDW (10,X),Y  ; d3 lo 
      00A886 81               [ 4]  439     RET 
                                    440 
                                    441 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    442 ;   2ROT ( d1 d2 d3 -- d2 d3 d1 )
                                    443 ;   rotate right doubles 
                                    444 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002807                        445     _HEADER DROT,4,"2ROT"
      00A887 A8 4C                    1         .word LINK 
                           002809     2         LINK=.
      00A889 04                       3         .byte 4  
      00A88A 32 52 4F 54              4         .ascii "2ROT"
      00A88E                          5         DROT:
                                    446 ; save d3 in temp 
      00A88E 90 93            [ 1]  447     LDW Y,X 
      00A890 90 FE            [ 2]  448     LDW Y,(Y)
      00A892 90 BF 26         [ 2]  449     LDW YTEMP,Y ; d3 hi 
      00A895 90 93            [ 1]  450     LDW Y,X 
      00A897 90 EE 02         [ 2]  451     LDW Y,(2,Y)
      00A89A 90 BF 24         [ 2]  452     LDW XTEMP,Y ; d3 lo 
                                    453 ; put d1 in d3 slot 
      00A89D 90 93            [ 1]  454     LDW Y,X 
      00A89F 90 EE 08         [ 2]  455     LDW Y,(8,Y)
      00A8A2 FF               [ 2]  456     LDW (X),Y  ; d1 hi 
      00A8A3 90 93            [ 1]  457     LDW Y,X 
      00A8A5 90 EE 0A         [ 2]  458     LDW Y,(10,Y) 
      00A8A8 EF 02            [ 2]  459     LDW (2,X),Y ; d1 lo 
                                    460 ; put d2 in d1 slot 
      00A8AA 90 93            [ 1]  461     LDW Y,X 
      00A8AC 90 EE 04         [ 2]  462     LDW Y,(4,Y) ; d2 hi 
      00A8AF EF 08            [ 2]  463     LDW (8,X),Y 
      00A8B1 90 93            [ 1]  464     LDW Y,X 
      00A8B3 90 EE 06         [ 2]  465     LDW Y,(6,Y) ; d2 lo 
      00A8B6 EF 0A            [ 2]  466     LDW (10,X),Y 
                                    467 ; put d3 in d2 slot 
      00A8B8 90 BE 26         [ 2]  468     LDW Y,YTEMP 
      00A8BB EF 04            [ 2]  469     LDW (4,X),Y 
      00A8BD 90 BE 24         [ 2]  470     LDW Y,XTEMP 
      00A8C0 EF 06            [ 2]  471     LDW (6,X),Y 
      00A8C2 81               [ 4]  472     RET 
                                    473 
                                    474 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    475 ;    D0= ( d -- 0|-1 )
                                    476 ;    check if double is 0 
                                    477 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002843                        478     _HEADER DZEQUAL,3,"D0="
      00A8C3 A8 89                    1         .word LINK 
                           002845     2         LINK=.
      00A8C5 03                       3         .byte 3  
      00A8C6 44 30 3D                 4         .ascii "D0="
      00A8C9                          5         DZEQUAL:
      00A8C9 4F               [ 1]  479     CLR A  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 149.
Hexadecimal [24-Bits]



      00A8CA 90 93            [ 1]  480     LDW Y,X 
      00A8CC 90 FE            [ 2]  481     LDW Y,(Y)
      00A8CE 26 09            [ 1]  482     JRNE ZEQ1 
      00A8D0 90 93            [ 1]  483     LDW Y,X 
      00A8D2 90 EE 02         [ 2]  484     LDW Y,(2,Y)
      00A8D5 26 02            [ 1]  485     JRNE ZEQ1 
      00A8D7 A6 FF            [ 1]  486     LD A,#0xFF
      00A8D9                        487 ZEQ1:
      00A8D9 1C 00 02         [ 2]  488     ADDW X,#CELLL 
      00A8DC F7               [ 1]  489     LD (X),A
      00A8DD E7 01            [ 1]  490     LD (1,X),A
      00A8DF 81               [ 4]  491 	RET     
                                    492 
                                    493 
                                    494 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    495 ;   D= ( d1 d2 -- f )
                                    496 ;   d1==d2?
                                    497 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002860                        498     _HEADER DEQUAL,2,"D="
      00A8E0 A8 C5                    1         .word LINK 
                           002862     2         LINK=.
      00A8E2 02                       3         .byte 2  
      00A8E3 44 3D                    4         .ascii "D="
      00A8E5                          5         DEQUAL:
      00A8E5 A6 00            [ 1]  499     LD A,#0 
      00A8E7 90 93            [ 1]  500     LDW Y,X 
      00A8E9 90 FE            [ 2]  501     LDW Y,(Y)
      00A8EB E3 04            [ 2]  502     CPW Y,(4,X)
      00A8ED 26 0B            [ 1]  503     JRNE DEQU4 
      00A8EF 90 93            [ 1]  504     LDW Y,X 
      00A8F1 90 EE 02         [ 2]  505     LDW Y,(2,Y)
      00A8F4 E3 06            [ 2]  506     CPW Y,(6,X)
      00A8F6 26 02            [ 1]  507     JRNE DEQU4 
      00A8F8 A6 FF            [ 1]  508     LD A,#0XFF
      00A8FA                        509 DEQU4:
      00A8FA 1C 00 06         [ 2]  510     ADDW X,#6
      00A8FD F7               [ 1]  511     LD (X),A 
      00A8FE E7 01            [ 1]  512     LD (1,X),A 
      00A900 81               [ 4]  513     RET 
                                    514 
                                    515 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    516 ;   D> ( d1 d2 -- f )
                                    517 ;   d1>d2?
                                    518 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002881                        519     _HEADER DGREAT,2,"D>"
      00A901 A8 E2                    1         .word LINK 
                           002883     2         LINK=.
      00A903 02                       3         .byte 2  
      00A904 44 3E                    4         .ascii "D>"
      00A906                          5         DGREAT:
      00A906 CD A7 F4         [ 4]  520     CALL DSWAP 
      00A909 CC A9 11         [ 2]  521     JP DLESS 
                                    522 
                                    523 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    524 ;   D< ( d1 d2 -- f )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 150.
Hexadecimal [24-Bits]



                                    525 ;   d1<d2? 
                                    526 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00288C                        527     _HEADER DLESS,2,"D<"
      00A90C A9 03                    1         .word LINK 
                           00288E     2         LINK=.
      00A90E 02                       3         .byte 2  
      00A90F 44 3C                    4         .ascii "D<"
      00A911                          5         DLESS:
      00A911 CD AC 38         [ 4]  528     CALL DSUB
      00A914 CD 8C 83         [ 4]  529     CALL ZERO
      00A917 CD 88 7C         [ 4]  530     CALL NROT  
      00A91A CD A9 2C         [ 4]  531     CALL DZLESS 
      00289D                        532     _QBRAN DLESS4
      00A91D CD 85 18         [ 4]    1     CALL QBRAN
      00A920 A9 25                    2     .word DLESS4
      00A922 CD 88 F5         [ 4]  533     CALL INVER  
      00A925                        534 DLESS4:
      00A925 81               [ 4]  535     RET
                                    536 
                                    537 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    538 ;  D0< ( d -- f )
                                    539 ;  d<0? 
                                    540 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0028A6                        541     _HEADER DZLESS,3,"D0<"
      00A926 A9 0E                    1         .word LINK 
                           0028A8     2         LINK=.
      00A928 03                       3         .byte 3  
      00A929 44 30 3C                 4         .ascii "D0<"
      00A92C                          5         DZLESS:
      00A92C A6 00            [ 1]  542     LD A,#0 
      00A92E 90 93            [ 1]  543     LDW Y,X 
      00A930 90 FE            [ 2]  544     LDW Y,(Y)
      00A932 2A 02            [ 1]  545     JRPL DZLESS1 
      00A934 A6 FF            [ 1]  546     LD A,#0XFF 
      00A936                        547 DZLESS1:
      00A936 1C 00 02         [ 2]  548     ADDW X,#CELLL 
      00A939 F7               [ 1]  549     LD (X),A 
      00A93A E7 01            [ 1]  550     LD (1,X),A    
      00A93C 81               [ 4]  551     RET 
                                    552 
                                    553 
                                    554 
                                    555 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    556 ;   2>R ( d -- R: d )
                                    557 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0028BD                        558     _HEADER DTOR,3,"2>R"
      00A93D A9 28                    1         .word LINK 
                           0028BF     2         LINK=.
      00A93F 03                       3         .byte 3  
      00A940 32 3E 52                 4         .ascii "2>R"
      00A943                          5         DTOR:
      00A943 90 85            [ 2]  559     POPW Y 
      00A945 90 BF 26         [ 2]  560     LDW YTEMP,Y 
      00A948 90 93            [ 1]  561     LDW Y,X 
      00A94A 90 EE 02         [ 2]  562     LDW Y,(2,Y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 151.
Hexadecimal [24-Bits]



      00A94D 90 89            [ 2]  563     PUSHW Y   ; d low 
      00A94F 90 93            [ 1]  564     LDW Y,X 
      00A951 90 FE            [ 2]  565     LDW Y,(Y)
      00A953 90 89            [ 2]  566     PUSHW Y   ; d hi 
      00A955 1C 00 04         [ 2]  567     ADDW X,#4  
      00A958 92 CC 26         [ 5]  568     JP [YTEMP]
                                    569 
                                    570 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    571 ;  2R> ( -- d ) R: d --      
                                    572 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0028DB                        573     _HEADER DRFROM,3,"2R>"
      00A95B A9 3F                    1         .word LINK 
                           0028DD     2         LINK=.
      00A95D 03                       3         .byte 3  
      00A95E 32 52 3E                 4         .ascii "2R>"
      00A961                          5         DRFROM:
      00A961 90 85            [ 2]  574     POPW Y      ; d hi 
      00A963 90 BF 26         [ 2]  575     LDW YTEMP,Y 
      00A966 1D 00 04         [ 2]  576     SUBW X,#4
      00A969 90 85            [ 2]  577     POPW Y       ; d hi 
      00A96B FF               [ 2]  578     LDW (X),Y 
      00A96C 90 85            [ 2]  579     POPW Y       ; d low  
      00A96E EF 02            [ 2]  580     LDW (2,X),Y 
      00A970 92 CC 26         [ 5]  581     JP [YTEMP]
                                    582     
                                    583 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    584 ;   2R@ ( -- d )
                                    585 ;   fecth a double from RSTACK
                                    586 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0028F3                        587     _HEADER DRAT,3,"2R@"
      00A973 A9 5D                    1         .word LINK 
                           0028F5     2         LINK=.
      00A975 03                       3         .byte 3  
      00A976 32 52 40                 4         .ascii "2R@"
      00A979                          5         DRAT:
      00A979 90 85            [ 2]  588     POPW Y 
      00A97B 90 BF 26         [ 2]  589     LDW YTEMP,Y 
      00A97E 1D 00 04         [ 2]  590     SUBW X,#4 
      00A981 16 01            [ 2]  591     LDW Y,(1,SP)
      00A983 FF               [ 2]  592     LDW (X),Y 
      00A984 16 03            [ 2]  593     LDW Y,(3,SP)
      00A986 EF 02            [ 2]  594     LDW (2,X),Y 
      00A988 92 CC 26         [ 5]  595     JP [YTEMP]
                                    596 
                                    597 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    598 ;  2VARIABLE <name> 
                                    599 ;  create a double variable 
                                    600 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00290B                        601     _HEADER DVARIA,9,"2VARIABLE"
      00A98B A9 75                    1         .word LINK 
                           00290D     2         LINK=.
      00A98D 09                       3         .byte 9  
      00A98E 32 56 41 52 49 41 42     4         .ascii "2VARIABLE"
             4C 45
      00A997                          5         DVARIA:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 152.
Hexadecimal [24-Bits]



      00A997 CD 8D 5D         [ 4]  602         CALL HERE
      00A99A CD 86 99         [ 4]  603         CALL DUPP
      00291D                        604         _DOLIT 4  
      00A99D CD 84 EF         [ 4]    1     CALL DOLIT 
      00A9A0 00 04                    2     .word 4 
      00A9A2 CD 88 BC         [ 4]  605         CALL PLUS 
      00A9A5 CD 87 F0         [ 4]  606         CALL VPP 
      00A9A8 CD 85 51         [ 4]  607         CALL STORE
      00A9AB CD 99 3F         [ 4]  608         CALL CREAT
      00A9AE CD 86 99         [ 4]  609         CALL DUPP
      00A9B1 CD 95 B2         [ 4]  610         CALL COMMA
      00A9B4 CD 8C 83         [ 4]  611         CALL ZERO
      00A9B7 CD 86 C1         [ 4]  612         CALL OVER 
      00A9BA CD 85 51         [ 4]  613         CALL STORE 
      00A9BD CD 8C 83         [ 4]  614         CALL ZERO 
      00A9C0 CD 86 A9         [ 4]  615         CALL SWAPP 
      00A9C3 CD 85 51         [ 4]  616         CALL STORE
      00A9C6 CD A2 B4         [ 4]  617         CALL FMOVE ; move definition to FLASH
      00A9C9 CD 88 4C         [ 4]  618         CALL QDUP 
      00A9CC CD 85 18         [ 4]  619         CALL QBRAN 
      00A9CF 99 8C                  620         .word SET_RAMLAST   
      00A9D1 CD 9D 5C         [ 4]  621         call UPDATVP  ; don't update if variable kept in RAM.
      00A9D4 CD A3 48         [ 4]  622         CALL UPDATPTR
      00A9D7 81               [ 4]  623         RET         
                                    624 
                                    625 
                                    626 
                                    627 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    628 ;  2LITERAL ( d -- )
                                    629 ;  compile double literal 
                                    630 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002958                        631     _HEADER DLITER,IMEDD+8,"2LITERAL"
      00A9D8 A9 8D                    1         .word LINK 
                           00295A     2         LINK=.
      00A9DA 88                       3         .byte IMEDD+8  
      00A9DB 32 4C 49 54 45 52 41     4         .ascii "2LITERAL"
             4C
      00A9E3                          5         DLITER:
      00A9E3 CD 95 F7         [ 4]  632     CALL COMPI 
      00A9E6 A9 EE                  633     .word do2lit 
      00A9E8 CD 95 B2         [ 4]  634     CALL COMMA 
      00A9EB CC 95 B2         [ 2]  635     JP   COMMA 
                                    636 
                                    637 
                                    638 ; runtime for 2LITERAL 
      00A9EE                        639 do2lit:
      00A9EE 1D 00 04         [ 2]  640     SUBW X,#4 
      00A9F1 16 01            [ 2]  641     LDW Y,(1,SP)
      00A9F3 90 FE            [ 2]  642     LDW Y,(Y)
      00A9F5 FF               [ 2]  643     LDW (X),Y 
      00A9F6 16 01            [ 2]  644     LDW Y,(1,SP)
      00A9F8 90 EE 02         [ 2]  645     LDW Y,(2,Y)
      00A9FB EF 02            [ 2]  646     LDW (2,X),Y 
      00A9FD 90 85            [ 2]  647     POPW Y 
      00A9FF 90 EC 04         [ 2]  648     JP (4,Y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 153.
Hexadecimal [24-Bits]



                                    649 
                                    650 
                                    651 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    652 ;   2OVER ( d1 d2 -- d1 d2 d1 )
                                    653 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002982                        654     _HEADER DOVER,5,"2OVER"
      00AA02 A9 DA                    1         .word LINK 
                           002984     2         LINK=.
      00AA04 05                       3         .byte 5  
      00AA05 32 4F 56 45 52           4         .ascii "2OVER"
      00AA0A                          5         DOVER:
      00AA0A 90 93            [ 1]  655     LDW Y,X 
      00AA0C 1D 00 04         [ 2]  656     SUBW X,#4 
      00AA0F 90 89            [ 2]  657     PUSHW Y 
      00AA11 90 EE 04         [ 2]  658     LDW Y,(4,Y)  ; d1 hi 
      00AA14 FF               [ 2]  659     LDW (X),Y 
      00AA15 90 85            [ 2]  660     POPW Y 
      00AA17 90 EE 06         [ 2]  661     LDW Y,(6,Y)  ;d1 lo 
      00AA1A EF 02            [ 2]  662     LDW (2,X),Y 
      00AA1C 81               [ 4]  663     RET 
                                    664 
                                    665 
                                    666 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    667 ;   D2/ ( d -- d/2 )
                                    668 ;   divide double by 2 
                                    669 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00299D                        670     _HEADER D2SLASH,3,"D2/"
      00AA1D AA 04                    1         .word LINK 
                           00299F     2         LINK=.
      00AA1F 03                       3         .byte 3  
      00AA20 44 32 2F                 4         .ascii "D2/"
      00AA23                          5         D2SLASH:
      00AA23 90 93            [ 1]  671     LDW Y,X 
      00AA25 90 FE            [ 2]  672     LDW Y,(Y)
      00AA27 90 57            [ 2]  673     SRAW Y 
      00AA29 FF               [ 2]  674     LDW (X),Y 
      00AA2A 90 93            [ 1]  675     LDW Y,X 
      00AA2C 90 EE 02         [ 2]  676     LDW Y,(2,Y)
      00AA2F 90 56            [ 2]  677     RRCW Y 
      00AA31 EF 02            [ 2]  678     LDW (2,X),Y 
      00AA33 81               [ 4]  679     RET
                                    680 
                                    681 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    682 ;  D2* ( d -- d*2 )
                                    683 ;  multiply double by 2 
                                    684 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0029B4                        685     _HEADER D2STAR,3,"D2*"
      00AA34 AA 1F                    1         .word LINK 
                           0029B6     2         LINK=.
      00AA36 03                       3         .byte 3  
      00AA37 44 32 2A                 4         .ascii "D2*"
      00AA3A                          5         D2STAR:
      00AA3A 90 93            [ 1]  686     LDW Y,X 
      00AA3C 90 EE 02         [ 2]  687     LDW Y,(2,Y)
      00AA3F 98               [ 1]  688     RCF 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 154.
Hexadecimal [24-Bits]



      00AA40 90 59            [ 2]  689     RLCW Y 
      00AA42 EF 02            [ 2]  690     LDW (2,X),Y 
      00AA44 90 93            [ 1]  691     LDW Y,X 
      00AA46 90 FE            [ 2]  692     LDW Y,(Y)
      00AA48 90 59            [ 2]  693     RLCW Y 
      00AA4A FF               [ 2]  694     LDW (X),Y 
      00AA4B 81               [ 4]  695     RET 
                                    696 
                                    697 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    698 ;   DLSHIFT ( d n -- d )
                                    699 ;   left shift double 
                                    700 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0029CC                        701     _HEADER DLSHIFT,7,"DLSHIFT"
      00AA4C AA 36                    1         .word LINK 
                           0029CE     2         LINK=.
      00AA4E 07                       3         .byte 7  
      00AA4F 44 4C 53 48 49 46 54     4         .ascii "DLSHIFT"
      00AA56                          5         DLSHIFT:
      00AA56 E6 01            [ 1]  702     LD A,(1,X) ; shift count 
      00AA58 A4 1F            [ 1]  703     AND A,#31
      00AA5A 1C 00 02         [ 2]  704     ADDW X,#CELLL 
      00AA5D 90 93            [ 1]  705     LDW Y,X 
      00AA5F 90 FE            [ 2]  706     LDW Y,(Y)
      00AA61 90 BF 26         [ 2]  707     LDW YTEMP,Y  ; d hi 
      00AA64 90 93            [ 1]  708     LDW Y,X 
      00AA66 90 EE 02         [ 2]  709     LDW Y,(2,Y)  ; d low 
      00AA69                        710 DLSHIFT1:
      00AA69 4D               [ 1]  711     TNZ A 
      00AA6A 27 12            [ 1]  712     JREQ DLSHIFT2 
      00AA6C 98               [ 1]  713     RCF 
      00AA6D 90 59            [ 2]  714     RLCW Y 
      00AA6F 90 89            [ 2]  715     PUSHW Y 
      00AA71 90 BE 26         [ 2]  716     LDW Y,YTEMP 
      00AA74 90 59            [ 2]  717     RLCW Y 
      00AA76 90 BF 26         [ 2]  718     LDW YTEMP,Y 
      00AA79 90 85            [ 2]  719     POPW Y 
      00AA7B 4A               [ 1]  720     DEC A 
      00AA7C 20 EB            [ 2]  721     JRA DLSHIFT1 
      00AA7E                        722 DLSHIFT2:
      00AA7E EF 02            [ 2]  723     LDW (2,X),Y 
      00AA80 90 BE 26         [ 2]  724     LDW Y,YTEMP 
      00AA83 FF               [ 2]  725     LDW (X),Y 
      00AA84 81               [ 4]  726     RET 
                                    727 
                                    728 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    729 ;  DRSHIFT ( d n -- d )
                                    730 ;  shift right n bits 
                                    731 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002A05                        732     _HEADER DRSHIFT,7,"DRSHIFT"
      00AA85 AA 4E                    1         .word LINK 
                           002A07     2         LINK=.
      00AA87 07                       3         .byte 7  
      00AA88 44 52 53 48 49 46 54     4         .ascii "DRSHIFT"
      00AA8F                          5         DRSHIFT:
      00AA8F E6 01            [ 1]  733     LD A,(1,X)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 155.
Hexadecimal [24-Bits]



      00AA91 A4 1F            [ 1]  734     AND A,#31
      00AA93 1C 00 02         [ 2]  735     ADDW X,#2 
      00AA96                        736 DRSHIFT1:
      00AA96 4D               [ 1]  737     TNZ A 
      00AA97 27 13            [ 1]  738     JREQ DRSHIFT2 
      00AA99 90 93            [ 1]  739     LDW Y,X 
      00AA9B 90 FE            [ 2]  740     LDW Y,(Y)
      00AA9D 90 54            [ 2]  741     SRLW Y 
      00AA9F FF               [ 2]  742     LDW (X),Y 
      00AAA0 90 93            [ 1]  743     LDW Y,X 
      00AAA2 90 EE 02         [ 2]  744     LDW Y,(2,Y)
      00AAA5 90 56            [ 2]  745     RRCW Y 
      00AAA7 EF 02            [ 2]  746     LDW (2,X),Y 
      00AAA9 4A               [ 1]  747     DEC A
      00AAAA 20 EA            [ 2]  748     JRA DRSHIFT1  
      00AAAC                        749 DRSHIFT2:
      00AAAC 81               [ 4]  750     RET 
                                    751 
                                    752 
                                    753 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    754 ;   D* ( d1 d2 -- d3 )
                                    755 ;   double product 
                                    756 ;   d3 = d1 * d2
                                    757 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002A2D                        758     _HEADER DSTAR,2,"D*"
      00AAAD AA 87                    1         .word LINK 
                           002A2F     2         LINK=.
      00AAAF 02                       3         .byte 2  
      00AAB0 44 2A                    4         .ascii "D*"
      00AAB2                          5         DSTAR:
      00AAB2 CD 86 99         [ 4]  759     CALL DUPP 
      00AAB5 CD 86 D0         [ 4]  760     CALL ZLESS  
      00AAB8 CD 86 62         [ 4]  761     CALL TOR    ; R: d2sign 
      00AABB CD A6 D8         [ 4]  762     CALL DABS   
      00AABE CD 85 B4         [ 4]  763     CALL RFROM 
      00AAC1 CD 88 7C         [ 4]  764     CALL NROT  ; d1 d2s ud2
      00AAC4 CD A9 43         [ 4]  765     CALL DTOR  ; d1 d2s R: ud2  
      00AAC7 CD 86 62         [ 4]  766     CALL TOR   ; d1 R: ud2 d2s   
      00AACA CD 86 99         [ 4]  767     CALL DUPP 
      00AACD CD 86 D0         [ 4]  768     CALL ZLESS 
      00AAD0 CD 85 B4         [ 4]  769     CALL RFROM 
      00AAD3 CD 87 1F         [ 4]  770     CALL XORR   
      00AAD6 CD 86 62         [ 4]  771     CALL TOR   ; d1 R: ud2 prod_sign  
      00AAD9 CD A6 D8         [ 4]  772     CALL DABS ; ud1 R: ud2 ps  
      00AADC CD 85 B4         [ 4]  773     CALL RFROM  
      00AADF CD 88 7C         [ 4]  774     CALL NROT   ; ps ud1 
      00AAE2 CD 88 A7         [ 4]  775     CALL DDUP   ; ps ud1 ud1  
      00AAE5 CD 85 B4         [ 4]  776     CALL RFROM  ; ps ud1 ud1 ud2hi 
      00AAE8 CD A7 CE         [ 4]  777     CALL DSSTAR ; ps ud1 dprodhi 
                                    778 ; shift partial product 16 bits left 
      002A6B                        779     _DROP   ; drop overflow 
      00AAEB 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00AAEE CD 8C 83         [ 4]  780     CALL ZERO   ; ps ud1 prodhi 
      00AAF1 CD 86 A9         [ 4]  781     CALL SWAPP  
      00AAF4 CD A7 F4         [ 4]  782     CALL DSWAP  ; ps dprodhi ud1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 156.
Hexadecimal [24-Bits]



      00AAF7 CD 85 B4         [ 4]  783     CALL RFROM  ; ps dprodhi ud1 ud2lo
      00AAFA CD A7 CE         [ 4]  784     CALL DSSTAR ; ps  dprodhi dprodlo 
      00AAFD CD AC 06         [ 4]  785     CALL DPLUS
      00AB00 CD 88 5D         [ 4]  786     CALL ROT    ; dprod ps 
      002A83                        787     _QBRAN DDSTAR3 
      00AB03 CD 85 18         [ 4]    1     CALL QBRAN
      00AB06 AB 0B                    2     .word DDSTAR3
      00AB08 CD 89 18         [ 4]  788     CALL DNEGA 
      00AB0B                        789 DDSTAR3:  
      00AB0B 81               [ 4]  790     RET 
                                    791 
                                    792 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    793 ;  UD/MOD ( ud1 ud2 -- dr udq )
                                    794 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002A8C                        795     _HEADER UDSLMOD,6,"UD/MOD"
      00AB0C AA AF                    1         .word LINK 
                           002A8E     2         LINK=.
      00AB0E 06                       3         .byte 6  
      00AB0F 55 44 2F 4D 4F 44        4         .ascii "UD/MOD"
      00AB15                          5         UDSLMOD:
                                    796 ; unsigned double division 
      00AB15 CD 8C 83         [ 4]  797     CALL ZERO 
      00AB18 CD 8C 83         [ 4]  798     CALL ZERO
      00AB1B CD A9 43         [ 4]  799     CALL DTOR ; quotient  R: qlo qhi 
      00AB1E CD AA 0A         [ 4]  800     CALL DOVER 
      00AB21 CD A8 22         [ 4]  801     CALL DCLZ ; n2, dividend leading zeros  
      00AB24 CD 86 62         [ 4]  802     CALL TOR 
      00AB27 CD 88 A7         [ 4]  803     CALL DDUP    
      00AB2A CD A8 22         [ 4]  804     CALL DCLZ  ; n1, divisor leading zeros
      00AB2D CD 85 B4         [ 4]  805     CALL RFROM ; n1 n2 
      00AB30 CD 89 52         [ 4]  806     CALL SUBB  ; loop count 
      00AB33 CD 86 99         [ 4]  807     CALL DUPP
      00AB36 CD A9 43         [ 4]  808     CALL DTOR  ; ud1 ud2 R: qlo qhi cntr cntr 
      00AB39 CD 85 C5         [ 4]  809     CALL RAT    
      00AB3C CD 86 D0         [ 4]  810     CALL ZLESS 
      002ABF                        811     _TBRAN UDSLA7 ; quotient is null 
      00AB3F CD 85 26         [ 4]    1     CALL TBRAN 
      00AB42 AB A1                    2     .word UDSLA7 
      00AB44 CD 85 C5         [ 4]  812     CALL RAT 
      00AB47 CD AA 56         [ 4]  813     CALL DLSHIFT ; align divisor with dividend 
      00AB4A                        814 UDSLA3: ; division loop -- dividend divisor  
      00AB4A 90 5F            [ 1]  815     CLRW Y 
      00AB4C 90 89            [ 2]  816     PUSHW Y  
      00AB4E CD AA 0A         [ 4]  817     CALL DOVER 
      00AB51 CD AA 0A         [ 4]  818     CALL DOVER 
      00AB54 CD A9 11         [ 4]  819     CALL DLESS 
      002AD7                        820     _TBRAN UDSLA4 
      00AB57 CD 85 26         [ 4]    1     CALL TBRAN 
      00AB5A AB 70                    2     .word UDSLA4 
      00AB5C 90 85            [ 2]  821     POPW Y 
      00AB5E 72 A9 00 01      [ 2]  822     ADDW Y,#1 
      00AB62 90 89            [ 2]  823     PUSHW Y    ; quotiend least bit 
      00AB64 CD 88 A7         [ 4]  824     CALL DDUP  ; dividend divisor divisor 
      00AB67 CD A9 43         [ 4]  825     CALL DTOR  
      00AB6A CD AC 38         [ 4]  826     CALL DSUB  ; dividend-divisor 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 157.
Hexadecimal [24-Bits]



      00AB6D CD A9 61         [ 4]  827     CALL DRFROM  ; dividend- divisor  
      00AB70                        828 UDSLA4: ; shift quotient and add 1 bit 
      00AB70 90 85            [ 2]  829     POPW Y 
      00AB72 90 BF 26         [ 2]  830     LDW YTEMP,Y 
      00AB75 16 07            [ 2]  831     LDW Y,(7,SP) ; quotient low 
      00AB77 98               [ 1]  832     RCF 
      00AB78 90 59            [ 2]  833     RLCW Y
      00AB7A 17 07            [ 2]  834     LDW (7,SP),Y 
      00AB7C 16 05            [ 2]  835     LDW Y,(5,SP) ; quotient hi 
      00AB7E 90 59            [ 2]  836     RLCW Y 
      00AB80 17 05            [ 2]  837     LDW (5,SP),Y 
      00AB82 16 07            [ 2]  838     LDW Y,(7,SP) 
      00AB84 72 B9 00 26      [ 2]  839     ADDW Y,YTEMP
      00AB88 17 07            [ 2]  840     LDW (7,SP),Y 
      00AB8A 16 01            [ 2]  841     LDW Y,(1,SP) ; loop counter 
      00AB8C 90 5D            [ 2]  842     TNZW Y 
      00AB8E 27 1C            [ 1]  843     JREQ UDSLA8
      00AB90 72 A2 00 01      [ 2]  844     SUBW Y,#1  
      00AB94 17 01            [ 2]  845     LDW (1,SP),Y  
                                    846 ; shift dividend left 1 bit      
      00AB96 CD A7 F4         [ 4]  847     CALL DSWAP 
      00AB99 CD AA 3A         [ 4]  848     CALL D2STAR 
      00AB9C CD A7 F4         [ 4]  849     CALL DSWAP 
      00AB9F 20 A9            [ 2]  850     JRA UDSLA3 
      00ABA1                        851 UDSLA7:
      00ABA1 CD 8C 83         [ 4]  852     CALL ZERO 
      002B24                        853     _DOLIT 1 
      00ABA4 CD 84 EF         [ 4]    1     CALL DOLIT 
      00ABA7 00 01                    2     .word 1 
      00ABA9 CD 86 3E         [ 4]  854     CALL NRSTO ; R: 0 0 0 cntr    
      00ABAC                        855 UDSLA8:
      00ABAC 1C 00 04         [ 2]  856     ADDW X,#4 ; drop divisor
      00ABAF CD 85 B4         [ 4]  857     CALL RFROM  
      002B32                        858     _DROP ; drop cntr 
      00ABB2 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00ABB5 CD 85 B4         [ 4]  859     CALL RFROM   ; shift count
      00ABB8 CD AA 8F         [ 4]  860     CALL DRSHIFT 
                                    861     ; quotient replace dividend 
      00ABBB CD A9 61         [ 4]  862     CALL DRFROM  ; quotient 
      00ABBE 81               [ 4]  863     RET 
                                    864 
                                    865 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    866 ;   D/MOD  ( d1 d2 -- dr dq )
                                    867 ;   double division dq=d1/d2
                                    868 ;   dr remainder double 
                                    869 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002B3F                        870     _HEADER DDSLMOD,5,"D/MOD"  
      00ABBF AB 0E                    1         .word LINK 
                           002B41     2         LINK=.
      00ABC1 05                       3         .byte 5  
      00ABC2 44 2F 4D 4F 44           4         .ascii "D/MOD"
      00ABC7                          5         DDSLMOD:
      00ABC7 CD A6 E9         [ 4]  871     CALL DSIGN 
      00ABCA CD 86 62         [ 4]  872     CALL TOR   ; R: divisor sign 
      00ABCD CD A6 D8         [ 4]  873     CALL DABS 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 158.
Hexadecimal [24-Bits]



      00ABD0 CD A7 F4         [ 4]  874     CALL DSWAP 
      00ABD3 CD A6 E9         [ 4]  875     CALL DSIGN ; dividend sign 
      00ABD6 CD 85 B4         [ 4]  876     CALL RFROM 
      00ABD9 CD 87 1F         [ 4]  877     CALL XORR  ; quotient sign
      00ABDC CD 86 62         [ 4]  878     CALL TOR   ; 
      00ABDF CD A6 D8         [ 4]  879     CALL DABS  ; d2 ud1 R: sign 
      00ABE2 CD A7 F4         [ 4]  880     CALL DSWAP  ; ud1 ud2 
      00ABE5 CD AB 15         [ 4]  881     CALL UDSLMOD ; ud1/ud2 -- dr dq  
      00ABE8 90 85            [ 2]  882     POPW Y ; sign 
      00ABEA 90 5D            [ 2]  883     TNZW Y 
      00ABEC 2A 03            [ 1]  884     JRPL DSLA9 
      00ABEE CD 89 18         [ 4]  885     CALL DNEGA ; remainder quotient 
      00ABF1                        886 DSLA9: 
      00ABF1 81               [ 4]  887     RET 
                                    888 
                                    889 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    890 ;   D/  ( d1 d2 -- dq )
                                    891 ;   division double by double 
                                    892 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002B72                        893     _HEADER DSLASH,2,"D/"
      00ABF2 AB C1                    1         .word LINK 
                           002B74     2         LINK=.
      00ABF4 02                       3         .byte 2  
      00ABF5 44 2F                    4         .ascii "D/"
      00ABF7                          5         DSLASH:
      00ABF7 CD AB C7         [ 4]  894     CALL DDSLMOD
      00ABFA CD A7 F4         [ 4]  895     CALL DSWAP
      002B7D                        896     _DDROP 
      00ABFD 1C 00 04         [ 2]    1    ADDW X,#2*CELLL 
      00AC00 81               [ 4]  897     RET 
                                    898 
                                    899 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    900 ;   D+ ( d1 d2 -- d3 )
                                    901 ;   add 2 doubles 
                                    902 ;   d3=d1+d2 
                                    903 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002B81                        904     _HEADER DPLUS,2,"D+"
      00AC01 AB F4                    1         .word LINK 
                           002B83     2         LINK=.
      00AC03 02                       3         .byte 2  
      00AC04 44 2B                    4         .ascii "D+"
      00AC06                          5         DPLUS:
      00AC06 90 93            [ 1]  905     LDW Y,X 
      00AC08 90 FE            [ 2]  906     LDW Y,(Y)
      00AC0A 90 BF 26         [ 2]  907     LDW YTEMP,Y ; d2 hi 
      00AC0D 90 93            [ 1]  908     LDW Y,X 
      00AC0F 90 EE 02         [ 2]  909     LDW Y,(2,Y)
      00AC12 90 BF 24         [ 2]  910     LDW XTEMP,Y ; d2 lo 
      00AC15 1C 00 04         [ 2]  911     ADDW X,#4 
      00AC18 90 93            [ 1]  912     LDW Y,X 
      00AC1A 90 EE 02         [ 2]  913     LDW Y,(2,Y) ; d1 lo
      00AC1D 72 B9 00 24      [ 2]  914     ADDW Y,XTEMP
      00AC21 EF 02            [ 2]  915     LDW (2,X),Y 
      00AC23 90 93            [ 1]  916     LDW Y,X 
      00AC25 90 FE            [ 2]  917     LDW Y,(Y) ; d1 hi 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 159.
Hexadecimal [24-Bits]



      00AC27 24 04            [ 1]  918     JRNC DPLUS1 
      00AC29 72 A9 00 01      [ 2]  919     ADDW Y,#1 
      00AC2D                        920 DPLUS1: 
      00AC2D 72 B9 00 26      [ 2]  921     ADDW Y,YTEMP 
      00AC31 FF               [ 2]  922     LDW (X),Y 
      00AC32 81               [ 4]  923     RET 
                                    924 
                                    925 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    926 ;   D- ( d1 d2 -- d3 )
                                    927 ;   d3=d1-d2 
                                    928 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002BB3                        929     _HEADER DSUB,2,"D-"
      00AC33 AC 03                    1         .word LINK 
                           002BB5     2         LINK=.
      00AC35 02                       3         .byte 2  
      00AC36 44 2D                    4         .ascii "D-"
      00AC38                          5         DSUB:
      00AC38 90 93            [ 1]  930     LDW Y,X 
      00AC3A 90 FE            [ 2]  931     LDW Y,(Y)
      00AC3C 90 BF 26         [ 2]  932     LDW YTEMP,Y ; d2 hi 
      00AC3F 90 93            [ 1]  933     LDW Y,X 
      00AC41 90 EE 02         [ 2]  934     LDW Y,(2,Y)
      00AC44 90 BF 24         [ 2]  935     LDW XTEMP,Y ; d2 lo 
      00AC47 1C 00 04         [ 2]  936     ADDW X,#4 
      00AC4A 90 93            [ 1]  937     LDW Y,X 
      00AC4C 90 EE 02         [ 2]  938     LDW Y,(2,Y) ; d1 lo
      00AC4F 72 B2 00 24      [ 2]  939     SUBW Y,XTEMP
      00AC53 EF 02            [ 2]  940     LDW (2,X),Y 
      00AC55 90 93            [ 1]  941     LDW Y,X 
      00AC57 90 FE            [ 2]  942     LDW Y,(Y) ; d1 hi 
      00AC59 24 04            [ 1]  943     JRNC DSUB1 
      00AC5B 72 A2 00 01      [ 2]  944     SUBW Y,#1 
      00AC5F                        945 DSUB1: 
      00AC5F 72 B2 00 26      [ 2]  946     SUBW Y,YTEMP 
      00AC63 FF               [ 2]  947     LDW (X),Y 
      00AC64 81               [ 4]  948     RET 
                                    949 
                                    950 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 160.
Hexadecimal [24-Bits]



                                   4598 .endif 
                           000001  4599 .if WANT_FLOAT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 161.
Hexadecimal [24-Bits]



                                   4600         .include "float.asm"
                                      1 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                      2 ;; Copyright Jacques Deschênes 2019,2020,2021 
                                      3 ;; This file is part of stm32_eforth  
                                      4 ;;
                                      5 ;;     stm8_eforth is free software: you can redistribute it and/or modify
                                      6 ;;     it under the terms of the GNU General Public License as published by
                                      7 ;;     the Free Software Foundation, either version 3 of the License, or
                                      8 ;;     (at your option) any later version.
                                      9 ;;
                                     10 ;;     stm32_eforth is distributed in the hope that it will be useful,
                                     11 ;;     but WITHOUT ANY WARRANTY;; without even the implied warranty of
                                     12 ;;     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                                     13 ;;     GNU General Public License for more details.
                                     14 ;;
                                     15 ;;     You should have received a copy of the GNU General Public License
                                     16 ;;     along with stm32_eforth.  If not, see <http:;;www.gnu.org/licenses/>.
                                     17 ;;;;
                                     18 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     19 
                                     20 ;*********************************
                                     21 ;    floating point library
                                     22 ;    adapted from 
                                     23 ;    Forth dimensions Vol. IV #1 
                                     24 ;    published in  may/june 1982
                                     25 ;
                                     26 ; Creation date: 2021-06-15 
                                     27 ;
                                     28 ;  This file is part of stm8_eforth 
                                     29 ;  project and same licence apply.
                                     30 ;************************************
                                     31 
                                     32 ;*************************************************
                                     33 ;  FLOAT format double for storage 
                                     34 ;  bits 23:0  signed mantissa
                                     35 ;  bits  31:24  signed exponent
                                     36 ;***********************************************  
                                     37 
                                     38     .module FLOAT 
                                     39 
                           000001    40 .if WANT_DOUBLE 
                                     41 ; already included 
                           000000    42 .else
                                     43 ;  must be included  
                                     44     .include "double.asm"
                                     45 .endif  
                                     46 
                           7FFFFF    47     MAX_MANTISSA = 0x7FFFFF 
                                     48 
                           000001    49     FLOAT_MAJOR=1 
                           000000    50     FLOAT_MINOR=0 
                                     51 
                                     52 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     53 ;   FLOAT-VER ( -- )
                                     54 ;   print library version 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 162.
Hexadecimal [24-Bits]



                                     55 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002BE5                         56     _HEADER FVER,9,"FLOAT-VER"
      00AC65 AC 35                    1         .word LINK 
                           002BE7     2         LINK=.
      00AC67 09                       3         .byte 9  
      00AC68 46 4C 4F 41 54 2D 56     4         .ascii "FLOAT-VER"
             45 52
      00AC71                          5         FVER:
      00AC71 CD 90 09         [ 4]   57     CALL CR 
      00AC74 CD 90 36         [ 4]   58     CALL DOTQP 
      00AC77 11                      59     .byte  17 
      00AC78 66 6C 6F 61 74 33 32    60     .ascii "float32 library, "
             20 6C 69 62 72 61 72
             79 2C 20
      00AC89 CD 9B 87         [ 4]   61     CALL PRT_LICENCE 
      00AC8C CD 9B 5F         [ 4]   62     CALL COPYRIGHT 
      002C0F                         63     _DOLIT FLOAT_MAJOR     
      00AC8F CD 84 EF         [ 4]    1     CALL DOLIT 
      00AC92 00 01                    2     .word FLOAT_MAJOR 
      002C14                         64     _DOLIT FLOAT_MINOR 
      00AC94 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AC97 00 00                    2     .word FLOAT_MINOR 
      00AC99 CC 9B 9B         [ 2]   65     JP PRINT_VERSION 
                                     66 
                                     67 
                                     68 ;-------------------------
                                     69 ;    FPSW ( -- a )
                                     70 ;    floating state variable
                                     71 ;    bit 0 zero flag 
                                     72 ;    bit 1 negative flag 
                                     73 ;    bit 2 overflow/error flag 
                                     74 ;---------------------------
      002C1C                         75     _HEADER FPSW,4,"FPSW"
      00AC9C AC 67                    1         .word LINK 
                           002C1E     2         LINK=.
      00AC9E 04                       3         .byte 4  
      00AC9F 46 50 53 57              4         .ascii "FPSW"
      00ACA3                          5         FPSW:
      00ACA3 90 AE 00 08      [ 2]   76 	LDW Y,#UFPSW  
      00ACA7 1D 00 02         [ 2]   77 	SUBW X,#2
      00ACAA FF               [ 2]   78     LDW (X),Y
      00ACAB 81               [ 4]   79     RET
                                     80 
                                     81 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     82 ;   FRESET ( -- )
                                     83 ;   reset FPSW variable 
                                     84 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
      002C2C                         85     _HEADER FRESET,6,"FRESET"
      00ACAC AC 9E                    1         .word LINK 
                           002C2E     2         LINK=.
      00ACAE 06                       3         .byte 6  
      00ACAF 46 52 45 53 45 54        4         .ascii "FRESET"
      00ACB5                          5         FRESET:
      00ACB5 CD 8C 83         [ 4]   86     CALL ZERO  
      00ACB8 CD AC A3         [ 4]   87     CALL FPSW 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 163.
Hexadecimal [24-Bits]



      00ACBB CD 85 51         [ 4]   88     CALL STORE 
      00ACBE 81               [ 4]   89     RET 
                                     90 
                                     91 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     92 ;   FINIT ( -- )
                                     93 ;   initialize floating point 
                                     94 ;   library 
                                     95 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002C3F                         96     _HEADER FINIT,5,"FINIT"
      00ACBF AC AE                    1         .word LINK 
                           002C41     2         LINK=.
      00ACC1 05                       3         .byte 5  
      00ACC2 46 49 4E 49 54           4         .ascii "FINIT"
      00ACC7                          5         FINIT:
      00ACC7 CD AC B5         [ 4]   97     CALL FRESET 
      00ACCA 81               [ 4]   98     RET 
                                     99 
                                    100 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    101 ;    FER ( -- u )
                                    102 ;    return FPSW value 
                                    103 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002C4B                        104     _HEADER FER,3,"FER"
      00ACCB AC C1                    1         .word LINK 
                           002C4D     2         LINK=.
      00ACCD 03                       3         .byte 3  
      00ACCE 46 45 52                 4         .ascii "FER"
      00ACD1                          5         FER:
      00ACD1 CD AC A3         [ 4]  105     CALL FPSW 
      00ACD4 CD 85 63         [ 4]  106     CALL AT 
      00ACD7 81               [ 4]  107     RET 
                                    108 
                                    109 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    110 ;    FZE  ( -- 0|-1 )
                                    111 ;    return FPSW zero flag 
                                    112 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002C58                        113     _HEADER FZE,3,"FZE"
      00ACD8 AC CD                    1         .word LINK 
                           002C5A     2         LINK=.
      00ACDA 03                       3         .byte 3  
      00ACDB 46 5A 45                 4         .ascii "FZE"
      00ACDE                          5         FZE:
      00ACDE CD AC A3         [ 4]  114     CALL FPSW
      00ACE1 CD 85 63         [ 4]  115     CALL AT  
      00ACE4 CD 8C 8E         [ 4]  116     CALL ONE 
      00ACE7 CD 86 F6         [ 4]  117     CALL ANDD
      00ACEA CD 89 06         [ 4]  118     CALL NEGAT  
      00ACED 81               [ 4]  119     RET 
                                    120 
                                    121 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    122 ;    FNE ( -- 0|-1 )
                                    123 ;    return FPSW negative flag 
                                    124 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002C6E                        125     _HEADER FNE,3,"FNE"
      00ACEE AC DA                    1         .word LINK 
                           002C70     2         LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 164.
Hexadecimal [24-Bits]



      00ACF0 03                       3         .byte 3  
      00ACF1 46 4E 45                 4         .ascii "FNE"
      00ACF4                          5         FNE:
      00ACF4 CD AC A3         [ 4]  126     CALL FPSW 
      00ACF7 CD 85 63         [ 4]  127     CALL AT 
      002C7A                        128     _DOLIT 2 
      00ACFA CD 84 EF         [ 4]    1     CALL DOLIT 
      00ACFD 00 02                    2     .word 2 
      00ACFF CD 86 F6         [ 4]  129     CALL ANDD
      00AD02 CD 8C 69         [ 4]  130     CALL TWOSL
      00AD05 CD 89 06         [ 4]  131     CALL NEGAT   
      00AD08 81               [ 4]  132     RET 
                                    133 
                                    134 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    135 ;   FOV (  -- 0|-1 )
                                    136 ;   return FPSW overflow flag 
                                    137 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002C89                        138     _HEADER FOV,3,"FOV"
      00AD09 AC F0                    1         .word LINK 
                           002C8B     2         LINK=.
      00AD0B 03                       3         .byte 3  
      00AD0C 46 4F 56                 4         .ascii "FOV"
      00AD0F                          5         FOV:
      00AD0F CD AC A3         [ 4]  139     CALL FPSW
      00AD12 CD 85 63         [ 4]  140     CALL AT  
      002C95                        141     _DOLIT 4 
      00AD15 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AD18 00 04                    2     .word 4 
      00AD1A CD 86 F6         [ 4]  142     CALL ANDD
      002C9D                        143     _DOLIT 2 
      00AD1D CD 84 EF         [ 4]    1     CALL DOLIT 
      00AD20 00 02                    2     .word 2 
      00AD22 CD 8C 51         [ 4]  144     CALL RSHIFT 
      00AD25 CD 89 06         [ 4]  145     CALL NEGAT  
      00AD28 81               [ 4]  146     RET 
                                    147 
                                    148 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    149 ;    SFZ ( f# -- f# )
                                    150 ;    set FPSW zero flag 
                                    151 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002CA9                        152     _HEADER SFZ,3,"SFZ"
      00AD29 AD 0B                    1         .word LINK 
                           002CAB     2         LINK=.
      00AD2B 03                       3         .byte 3  
      00AD2C 53 46 5A                 4         .ascii "SFZ"
      00AD2F                          5         SFZ:
      00AD2F CD AC D1         [ 4]  153     CALL FER 
      002CB2                        154     _DOLIT 0xfffe 
      00AD32 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AD35 FF FE                    2     .word 0xfffe 
      00AD37 CD 86 F6         [ 4]  155     CALL ANDD 
      00AD3A CD 86 62         [ 4]  156     CALL TOR    
      00AD3D CD 88 A7         [ 4]  157     CALL DDUP 
      002CC0                        158     _DOLIT 0xFF  
      00AD40 CD 84 EF         [ 4]    1     CALL DOLIT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 165.
Hexadecimal [24-Bits]



      00AD43 00 FF                    2     .word 0xFF 
      00AD45 CD 86 F6         [ 4]  159     CALL ANDD
      00AD48 CD A8 C9         [ 4]  160     CALL DZEQUAL 
      002CCB                        161     _DOLIT 1 
      00AD4B CD 84 EF         [ 4]    1     CALL DOLIT 
      00AD4E 00 01                    2     .word 1 
      00AD50 CD 86 F6         [ 4]  162     CALL ANDD 
      00AD53 CD 85 B4         [ 4]  163     CALL RFROM 
      00AD56 CD 87 0A         [ 4]  164     CALL ORR 
      00AD59 CD AC A3         [ 4]  165     CALL FPSW 
      00AD5C CD 85 51         [ 4]  166     CALL STORE 
      00AD5F 81               [ 4]  167     RET 
                                    168 
                                    169 
                                    170 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    171 ;   SFN ( f# -- f# )
                                    172 ;   set FPSW negative flag 
                                    173 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002CE0                        174     _HEADER SFN,3,"SFN"
      00AD60 AD 2B                    1         .word LINK 
                           002CE2     2         LINK=.
      00AD62 03                       3         .byte 3  
      00AD63 53 46 4E                 4         .ascii "SFN"
      00AD66                          5         SFN:
      00AD66 CD AC D1         [ 4]  175     CALL FER 
      002CE9                        176     _DOLIT 0xFFFD 
      00AD69 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AD6C FF FD                    2     .word 0xFFFD 
      00AD6E CD 86 F6         [ 4]  177     CALL ANDD  
      00AD71 CD 86 62         [ 4]  178     CALL TOR 
      00AD74 CD 86 99         [ 4]  179     CALL DUPP 
      002CF7                        180     _DOLIT 0X80 
      00AD77 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AD7A 00 80                    2     .word 0X80 
      00AD7C CD 86 F6         [ 4]  181     CALL ANDD 
      002CFF                        182     _DOLIT 6 
      00AD7F CD 84 EF         [ 4]    1     CALL DOLIT 
      00AD82 00 06                    2     .word 6 
      00AD84 CD 8C 51         [ 4]  183     CALL RSHIFT 
      00AD87 CD 85 B4         [ 4]  184     CALL RFROM 
      00AD8A CD 87 0A         [ 4]  185     CALL ORR 
      00AD8D CD AC A3         [ 4]  186     CALL FPSW 
      00AD90 CD 85 51         [ 4]  187     CALL STORE 
      00AD93 81               [ 4]  188     RET 
                                    189 
                                    190 
                                    191 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    192 ;   SFV ( -- )
                                    193 ;   set overflow flag 
                                    194 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002D14                        195     _HEADER SFV,3,"SFV"
      00AD94 AD 62                    1         .word LINK 
                           002D16     2         LINK=.
      00AD96 03                       3         .byte 3  
      00AD97 53 46 56                 4         .ascii "SFV"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 166.
Hexadecimal [24-Bits]



      00AD9A                          5         SFV:
      00AD9A CD AC D1         [ 4]  196     CALL FER 
      002D1D                        197     _DOLIT 4 
      00AD9D CD 84 EF         [ 4]    1     CALL DOLIT 
      00ADA0 00 04                    2     .word 4 
      00ADA2 CD 87 0A         [ 4]  198     CALL ORR 
      00ADA5 CD AC A3         [ 4]  199     CALL FPSW 
      00ADA8 CD 85 51         [ 4]  200     CALL STORE 
      00ADAB 81               [ 4]  201     RET 
                                    202 
                                    203 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    204 ;  F>ME ( f# -- m e )
                                    205 ;  split float in mantissa/exponent 
                                    206 ;  m mantissa as a double 
                                    207 ;  e exponent as a single 
                                    208 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002D2C                        209     _HEADER ATEXP,4,"F>ME"             
      00ADAC AD 96                    1         .word LINK 
                           002D2E     2         LINK=.
      00ADAE 04                       3         .byte 4  
      00ADAF 46 3E 4D 45              4         .ascii "F>ME"
      00ADB3                          5         ATEXP:
      00ADB3 CD AC B5         [ 4]  210     CALL FRESET
      00ADB6 CD AD 66         [ 4]  211     CALL SFN
      00ADB9 CD AD 2F         [ 4]  212     CALL SFZ 
      00ADBC 90 93            [ 1]  213     LDW Y,X 
      00ADBE 90 FE            [ 2]  214     LDW Y,(Y)
      00ADC0 90 89            [ 2]  215     PUSHW Y 
      00ADC2 4F               [ 1]  216     CLR A  
      00ADC3 90 5E            [ 1]  217     SWAPW Y 
      00ADC5 2A 01            [ 1]  218     JRPL ATEXP1 
      00ADC7 43               [ 1]  219     CPL A 
      00ADC8                        220 ATEXP1: ; sign extend mantissa 
      00ADC8 90 5E            [ 1]  221     SWAPW Y 
      00ADCA 90 95            [ 1]  222     LD YH,A 
      00ADCC FF               [ 2]  223     LDW (X),Y 
      00ADCD 1D 00 02         [ 2]  224     SUBW X,#CELLL 
      00ADD0 90 85            [ 2]  225     POPW Y 
      00ADD2 4F               [ 1]  226     CLR A 
      00ADD3 90 5D            [ 2]  227     TNZW Y 
      00ADD5 2A 01            [ 1]  228     JRPL ATEXP2 
      00ADD7 43               [ 1]  229     CPL A 
      00ADD8                        230 ATEXP2:
      00ADD8 90 5E            [ 1]  231     SWAPW Y 
      00ADDA 90 95            [ 1]  232     LD YH,A 
      00ADDC FF               [ 2]  233     LDW (X),Y 
      00ADDD 81               [ 4]  234     RET 
                                    235 
                                    236 
                                    237 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    238 ;    ME>F ( m e -- f# )
                                    239 ;    built float from mantissa/exponent 
                                    240 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002D5E                        241     _HEADER STEXP,4,"ME>F"
      00ADDE AD AE                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 167.
Hexadecimal [24-Bits]



                           002D60     2         LINK=.
      00ADE0 04                       3         .byte 4  
      00ADE1 4D 45 3E 46              4         .ascii "ME>F"
      00ADE5                          5         STEXP:
      00ADE5 CD 86 99         [ 4]  242     CALL DUPP 
      00ADE8 CD 89 6C         [ 4]  243     CALL ABSS 
      002D6B                        244     _DOLIT 127 
      00ADEB CD 84 EF         [ 4]    1     CALL DOLIT 
      00ADEE 00 7F                    2     .word 127 
      00ADF0 CD 89 D3         [ 4]  245     CALL GREAT
      002D73                        246     _QBRAN STEXP1
      00ADF3 CD 85 18         [ 4]    1     CALL QBRAN
      00ADF6 AD FB                    2     .word STEXP1
      00ADF8 CD AD 9A         [ 4]  247     CALL SFV
      00ADFB                        248 STEXP1:
      00ADFB 90 93            [ 1]  249     LDW Y,X 
      00ADFD 90 FE            [ 2]  250     LDW Y,(Y)
      00ADFF 4F               [ 1]  251     CLR A 
      00AE00 90 95            [ 1]  252     LD YH,A
      00AE02 90 5E            [ 1]  253     SWAPW Y 
      00AE04 90 89            [ 2]  254     PUSHW Y  ; e >r 
      00AE06 1C 00 02         [ 2]  255     ADDW X,#CELLL 
      00AE09 CD 88 A7         [ 4]  256     CALL DDUP 
      00AE0C CD A6 D8         [ 4]  257     CALL DABS
      00AE0F CD 86 A9         [ 4]  258     CALL SWAPP 
      002D92                        259     _DROP  
      00AE12 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      002D95                        260     _DOLIT 127 
      00AE15 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AE18 00 7F                    2     .word 127 
      00AE1A CD 89 D3         [ 4]  261     CALL GREAT 
      002D9D                        262     _QBRAN STEXP2 
      00AE1D CD 85 18         [ 4]    1     CALL QBRAN
      00AE20 AE 25                    2     .word STEXP2
      00AE22 CD AD 9A         [ 4]  263     CALL SFV 
      00AE25                        264 STEXP2: 
      00AE25 4F               [ 1]  265     CLR A 
      00AE26 F7               [ 1]  266     LD (X),A     
      00AE27 CD 85 B4         [ 4]  267     CALL RFROM 
      00AE2A CD 87 0A         [ 4]  268     CALL ORR
      00AE2D CD AD 2F         [ 4]  269     CALL SFZ 
      00AE30 CD AD 66         [ 4]  270     CALL SFN 
      00AE33 81               [ 4]  271     RET 
                                    272 
                                    273 
                                    274 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    275 ;   E. ( f# -- )
                                    276 ;   print float in scientific 
                                    277 ;   format 
                                    278 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002DB4                        279     _HEADER EDOT,2,"E."
      00AE34 AD E0                    1         .word LINK 
                           002DB6     2         LINK=.
      00AE36 02                       3         .byte 2  
      00AE37 45 2E                    4         .ascii "E."
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 168.
Hexadecimal [24-Bits]



      00AE39                          5         EDOT:
      00AE39 CD 87 5F         [ 4]  280     CALL BASE 
      00AE3C CD 85 63         [ 4]  281     CALL AT 
      00AE3F CD 86 62         [ 4]  282     CALL TOR 
      002DC2                        283     _DOLIT 10 
      00AE42 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AE45 00 0A                    2     .word 10 
      00AE47 CD 87 5F         [ 4]  284     CALL BASE 
      00AE4A CD 85 51         [ 4]  285     CALL STORE 
      00AE4D CD AD B3         [ 4]  286     CALL ATEXP ; m e 
      00AE50                        287 EDOT0:
      00AE50 CD 86 62         [ 4]  288     CALL TOR   
      00AE53 CD A6 D8         [ 4]  289     CALL DABS 
      00AE56 CD 8F C7         [ 4]  290     CALL SPACE 
      00AE59 CD 8E 8B         [ 4]  291     CALL BDIGS     
      00AE5C                        292 EDOT2: 
      00AE5C CD A7 44         [ 4]  293     CALL DDIG
      00AE5F CD 85 B4         [ 4]  294     CALL RFROM 
      00AE62 CD 8C 17         [ 4]  295     CALL ONEP 
      00AE65 CD 86 62         [ 4]  296     CALL TOR 
      00AE68 CD 86 99         [ 4]  297     CALL DUPP
      002DEB                        298     _QBRAN EDOT3 
      00AE6B CD 85 18         [ 4]    1     CALL QBRAN
      00AE6E AE 75                    2     .word EDOT3
      002DF0                        299     _BRAN EDOT2  
      00AE70 CD 85 34         [ 4]    1     CALL BRAN 
      00AE73 AE 5C                    2     .word EDOT2 
      00AE75                        300 EDOT3:
      00AE75 CD 86 C1         [ 4]  301     CALL OVER 
      00AE78 CD 87 5F         [ 4]  302     CALL BASE 
      00AE7B CD 85 63         [ 4]  303     CALL AT 
      00AE7E CD 89 90         [ 4]  304     CALL ULESS 
      002E01                        305     _QBRAN EDOT2 
      00AE81 CD 85 18         [ 4]    1     CALL QBRAN
      00AE84 AE 5C                    2     .word EDOT2
      002E06                        306     _DOLIT '.'
      00AE86 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AE89 00 2E                    2     .word '.' 
      00AE8B CD 8E 9B         [ 4]  307     CALL HOLD  
      00AE8E CD A7 44         [ 4]  308     CALL DDIG
      00AE91 CD AC F4         [ 4]  309     CALL FNE 
      002E14                        310     _QBRAN EDOT4 
      00AE94 CD 85 18         [ 4]    1     CALL QBRAN
      00AE97 AE A1                    2     .word EDOT4
      002E19                        311     _DOLIT '-'
      00AE99 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AE9C 00 2D                    2     .word '-' 
      00AE9E CD 8E 9B         [ 4]  312     CALL HOLD 
      00AEA1                        313 EDOT4:       
      002E21                        314     _DROP 
      00AEA1 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00AEA4 CD 8E F0         [ 4]  315     CALL EDIGS 
      00AEA7 CD 8F F1         [ 4]  316     CALL TYPES
      00AEAA CD 85 B4         [ 4]  317     CALL RFROM 
      00AEAD CD 88 4C         [ 4]  318     CALL QDUP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 169.
Hexadecimal [24-Bits]



      002E30                        319     _QBRAN EDOT5     
      00AEB0 CD 85 18         [ 4]    1     CALL QBRAN
      00AEB3 AE C0                    2     .word EDOT5
      002E35                        320     _DOLIT 'E'
      00AEB5 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AEB8 00 45                    2     .word 'E' 
      00AEBA CD 84 B6         [ 4]  321     CALL EMIT 
      00AEBD CD 90 B0         [ 4]  322     CALL DOT
      00AEC0                        323 EDOT5: 
      00AEC0 CD 85 B4         [ 4]  324     CALL RFROM 
      00AEC3 CD 87 5F         [ 4]  325     CALL BASE 
      00AEC6 CD 85 51         [ 4]  326     CALL STORE  
      00AEC9 81               [ 4]  327     RET 
                                    328 
                                    329 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                    330 ;   F. (f# -- )
                                    331 ;   print float in fixed
                                    332 ;   point format. 
                                    333 ;;;;;;;;;;;;;;;;;;;;;;;;;
      002E4A                        334     _HEADER FDOT,2,"F."
      00AECA AE 36                    1         .word LINK 
                           002E4C     2         LINK=.
      00AECC 02                       3         .byte 2  
      00AECD 46 2E                    4         .ascii "F."
      00AECF                          5         FDOT:
      00AECF CD 87 5F         [ 4]  335     CALL BASE 
      00AED2 CD 85 63         [ 4]  336     CALL AT 
      00AED5 CD 86 62         [ 4]  337     CALL TOR 
      002E58                        338     _DOLIT 10 
      00AED8 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AEDB 00 0A                    2     .word 10 
      00AEDD CD 87 5F         [ 4]  339     CALL BASE 
      00AEE0 CD 85 51         [ 4]  340     CALL STORE 
      00AEE3 CD AD B3         [ 4]  341     CALL    ATEXP
      00AEE6 CD 86 99         [ 4]  342     CALL    DUPP  
      00AEE9 CD 89 6C         [ 4]  343     CALL    ABSS 
      002E6C                        344     _DOLIT  8
      00AEEC CD 84 EF         [ 4]    1     CALL DOLIT 
      00AEEF 00 08                    2     .word 8 
      00AEF1 CD 89 D3         [ 4]  345     CALL    GREAT 
      002E74                        346     _QBRAN  FDOT1 
      00AEF4 CD 85 18         [ 4]    1     CALL QBRAN
      00AEF7 AE FC                    2     .word FDOT1
      00AEF9 CC AE 50         [ 2]  347     JP      EDOT0 
      00AEFC                        348 FDOT1:
      00AEFC CD 8F C7         [ 4]  349     CALL    SPACE 
      00AEFF CD 86 62         [ 4]  350     CALL    TOR 
      00AF02 CD AC F4         [ 4]  351     CALL    FNE 
      002E85                        352     _QBRAN  FDOT0 
      00AF05 CD 85 18         [ 4]    1     CALL QBRAN
      00AF08 AF 0D                    2     .word FDOT0
      00AF0A CD 89 18         [ 4]  353     CALL    DNEGA 
      00AF0D                        354 FDOT0: 
      00AF0D CD 8E 8B         [ 4]  355     CALL    BDIGS
      00AF10 CD 85 C5         [ 4]  356     CALL    RAT  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 170.
Hexadecimal [24-Bits]



      00AF13 CD 86 D0         [ 4]  357     CALL    ZLESS 
      002E96                        358     _QBRAN  FDOT6 
      00AF16 CD 85 18         [ 4]    1     CALL QBRAN
      00AF19 AF 44                    2     .word FDOT6
      00AF1B                        359 FDOT2: ; e<0 
      00AF1B CD A7 44         [ 4]  360     CALL    DDIG 
      00AF1E CD 85 B4         [ 4]  361     CALL    RFROM
      00AF21 CD 8C 17         [ 4]  362     CALL    ONEP 
      00AF24 CD 88 4C         [ 4]  363     CALL    QDUP 
      002EA7                        364     _QBRAN  FDOT3 
      00AF27 CD 85 18         [ 4]    1     CALL QBRAN
      00AF2A AF 34                    2     .word FDOT3
      00AF2C CD 86 62         [ 4]  365     CALL    TOR 
      002EAF                        366     _BRAN   FDOT2 
      00AF2F CD 85 34         [ 4]    1     CALL BRAN 
      00AF32 AF 1B                    2     .word FDOT2 
      00AF34                        367 FDOT3:
      002EB4                        368     _DOLIT  '.' 
      00AF34 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AF37 00 2E                    2     .word '.' 
      00AF39 CD 8E 9B         [ 4]  369     CALL    HOLD 
      00AF3C CD A7 5D         [ 4]  370     CALL    DDIGS
      002EBF                        371     _BRAN   FDOT9  
      00AF3F CD 85 34         [ 4]    1     CALL BRAN 
      00AF42 AF 59                    2     .word FDOT9 
      00AF44                        372 FDOT6: ; e>=0 
      002EC4                        373     _BRAN   FDOT8
      00AF44 CD 85 34         [ 4]    1     CALL BRAN 
      00AF47 AF 51                    2     .word FDOT8 
      00AF49                        374 FDOT7:     
      002EC9                        375     _DOLIT  '0'
      00AF49 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AF4C 00 30                    2     .word '0' 
      00AF4E CD 8E 9B         [ 4]  376     CALL    HOLD 
      00AF51                        377 FDOT8:
      00AF51 CD 85 03         [ 4]  378     CALL    DONXT 
      00AF54 AF 49                  379     .word   FDOT7
      00AF56 CD A7 5D         [ 4]  380     CALL    DDIGS 
      00AF59                        381 FDOT9:
      00AF59 CD AC F4         [ 4]  382     CALL    FNE 
      002EDC                        383     _QBRAN  FDOT10 
      00AF5C CD 85 18         [ 4]    1     CALL QBRAN
      00AF5F AF 69                    2     .word FDOT10
      002EE1                        384     _DOLIT '-' 
      00AF61 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AF64 00 2D                    2     .word '-' 
      00AF66 CD 8E 9B         [ 4]  385     CALL   HOLD 
      00AF69                        386 FDOT10:
      00AF69 CD 8E F0         [ 4]  387     CALL    EDIGS 
      00AF6C CD 8F F1         [ 4]  388     CALL    TYPES 
      00AF6F CD 85 B4         [ 4]  389     CALL    RFROM 
      00AF72 CD 87 5F         [ 4]  390     CALL    BASE 
      00AF75 CD 85 51         [ 4]  391     CALL    STORE 
      00AF78 81               [ 4]  392     RET 
                                    393 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 171.
Hexadecimal [24-Bits]



                                    394 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    395 ; return parsed exponent or 
                                    396 ; 0 if failed
                                    397 ; at entry exprect *a=='E'    
                                    398 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00AF79                        399 parse_exponent: ; a cntr -- e -1 | 0 
      00AF79 CD 86 62         [ 4]  400     CALL TOR   ; R: cntr 
      00AF7C CD 86 99         [ 4]  401     CALL DUPP 
      00AF7F CD 85 81         [ 4]  402     CALL CAT 
      002F02                        403     _DOLIT 'E' 
      00AF82 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AF85 00 45                    2     .word 'E' 
      00AF87 CD 89 7A         [ 4]  404     CALL EQUAL 
      002F0A                        405     _QBRAN 1$
      00AF8A CD 85 18         [ 4]    1     CALL QBRAN
      00AF8D AF BA                    2     .word 1$
      00AF8F CD 8C 17         [ 4]  406     CALL ONEP 
      00AF92 CD 85 B4         [ 4]  407     CALL RFROM  ; a cntr 
      00AF95 CD 8C 24         [ 4]  408     CALL ONEM
      00AF98 CD 86 99         [ 4]  409     CALL DUPP 
      002F1B                        410     _QBRAN 2$ ; a cntr 
      00AF9B CD 85 18         [ 4]    1     CALL QBRAN
      00AF9E AF BD                    2     .word 2$
      00AFA0 CD 8C 83         [ 4]  411     CALL ZERO
      00AFA3 CD 86 99         [ 4]  412     CALL DUPP 
      00AFA6 CD A7 F4         [ 4]  413     CALL DSWAP ; 0 0 a cntr  
      00AFA9 CD A5 90         [ 4]  414     CALL nsign 
      00AFAC CD 86 62         [ 4]  415     CALL TOR   ; R: esign  
      00AFAF CD A5 BD         [ 4]  416     CALL parse_digits
      002F32                        417     _QBRAN PARSEXP_SUCCESS ; parsed to end of string 
      00AFB2 CD 85 18         [ 4]    1     CALL QBRAN
      00AFB5 AF C4                    2     .word PARSEXP_SUCCESS
                                    418 ; failed invalid character
      002F37                        419     _DDROP ; 0 a 
      00AFB7 1C 00 04         [ 2]    1    ADDW X,#2*CELLL 
      00AFBA                        420 1$: 
      00AFBA CD 85 B4         [ 4]  421     CALL RFROM ; sign||cntr  
      00AFBD                        422 2$:
      002F3D                        423     _DDROP  ; a cntr || a sign || 0 cntr   
      00AFBD 1C 00 04         [ 2]    1    ADDW X,#2*CELLL 
      00AFC0 CD 8C 83         [ 4]  424     CALL ZERO   ; return only 0 
      00AFC3 81               [ 4]  425     RET 
      00AFC4                        426 PARSEXP_SUCCESS: 
      002F44                        427     _DDROP ; drop dhi a 
      00AFC4 1C 00 04         [ 2]    1    ADDW X,#2*CELLL 
      00AFC7 CD 85 B4         [ 4]  428     CALL RFROM ; es 
      002F4A                        429     _QBRAN 1$
      00AFCA CD 85 18         [ 4]    1     CALL QBRAN
      00AFCD AF D2                    2     .word 1$
      00AFCF CD 89 06         [ 4]  430     CALL NEGAT
      00AFD2                        431 1$:
      002F52                        432     _DOLIT -1 ; -- e -1 
      00AFD2 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AFD5 FF FF                    2     .word -1 
      00AFD7 81               [ 4]  433     RET 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 172.
Hexadecimal [24-Bits]



                                    434 
                                    435 
                                    436 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    437 ;   FLOAT?  ( a dlo dhi a+ cntr sign d? -- f -3 | a 0 )
                                    438 ;   called by NUMBER? 
                                    439 ;   convert string to float 
                                    440 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002F58                        441     _HEADER FLOATQ,5,"FLOAT?"
      00AFD8 AE CC                    1         .word LINK 
                           002F5A     2         LINK=.
      00AFDA 05                       3         .byte 5  
      00AFDB 46 4C 4F 41 54 3F        4         .ascii "FLOAT?"
      00AFE1                          5         FLOATQ:
      002F61                        442     _QBRAN FLOATQ0 
      00AFE1 CD 85 18         [ 4]    1     CALL QBRAN
      00AFE4 AF EB                    2     .word FLOATQ0
      002F66                        443     _BRAN FLOAT_ERROR  ; not a float, string start with '#'
      00AFE6 CD 85 34         [ 4]    1     CALL BRAN 
      00AFE9 B0 90                    2     .word FLOAT_ERROR 
      00AFEB                        444 FLOATQ0:
                                    445 ; BASE must be 10 
      00AFEB CD 87 5F         [ 4]  446     CALL BASE 
      00AFEE CD 85 63         [ 4]  447     CALL AT 
      002F71                        448     _DOLIT 10 
      00AFF1 CD 84 EF         [ 4]    1     CALL DOLIT 
      00AFF4 00 0A                    2     .word 10 
      00AFF6 CD 89 7A         [ 4]  449     CALL EQUAL 
      002F79                        450     _QBRAN FLOAT_ERROR 
      00AFF9 CD 85 18         [ 4]    1     CALL QBRAN
      00AFFC B0 90                    2     .word FLOAT_ERROR
                                    451 ; if float next char is '.' or 'E' 
      00AFFE CD 86 62         [ 4]  452     CALL TOR ; R: sign  
      00B001 CD 86 62         [ 4]  453     CALL TOR ; R: sign cntr 
      00B004 CD 86 99         [ 4]  454     CALL DUPP
      00B007 CD 85 81         [ 4]  455     CALL CAT 
      002F8A                        456     _DOLIT '.' 
      00B00A CD 84 EF         [ 4]    1     CALL DOLIT 
      00B00D 00 2E                    2     .word '.' 
      00B00F CD 89 7A         [ 4]  457     CALL EQUAL 
      002F92                        458     _QBRAN FLOATQ1 ; not a dot 
      00B012 CD 85 18         [ 4]    1     CALL QBRAN
      00B015 B0 50                    2     .word FLOATQ1
      00B017 CD 8C 17         [ 4]  459     CALL ONEP 
      00B01A CD 85 B4         [ 4]  460     CALL RFROM  ; dlo dhi a cntr R: sign  
      00B01D CD 8C 24         [ 4]  461     CALL ONEM 
      00B020 CD 86 99         [ 4]  462     CALL DUPP 
      00B023 CD 86 62         [ 4]  463     CALL TOR  ; R: sign cntr 
                                    464 ; parse fractional part
      00B026 CD A5 BD         [ 4]  465     CALL parse_digits ; dlo dhi a cntr -- dm a cntr 
      00B029 CD 86 99         [ 4]  466     CALL DUPP 
      00B02C CD 85 B4         [ 4]  467     CALL RFROM 
      00B02F CD 86 A9         [ 4]  468     CALL SWAPP 
      00B032 CD 89 52         [ 4]  469     CALL SUBB ; fd -> fraction digits count 
      00B035 CD 86 62         [ 4]  470     CALL TOR  ; dlo dhi a cntr R: sign fd 
      00B038 CD 86 99         [ 4]  471     CALL DUPP ; cntr cntr  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 173.
Hexadecimal [24-Bits]



      002FBB                        472     _QBRAN 1$ ; end of string, no exponent
      00B03B CD 85 18         [ 4]    1     CALL QBRAN
      00B03E B0 45                    2     .word 1$
      002FC0                        473     _BRAN FLOATQ2
      00B040 CD 85 34         [ 4]    1     CALL BRAN 
      00B043 B0 59                    2     .word FLOATQ2 
      00B045 CD 86 A9         [ 4]  474 1$: CALL SWAPP 
      002FC8                        475     _DROP ; a
      00B048 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      002FCB                        476     _BRAN FLOATQ3        
      00B04B CD 85 34         [ 4]    1     CALL BRAN 
      00B04E B0 61                    2     .word FLOATQ3 
      00B050                        477 FLOATQ1: ; must push fd==0 on RSTACK 
      00B050 CD 85 B4         [ 4]  478     CALL RFROM ; cntr 
      00B053 CD 8C 83         [ 4]  479     CALL ZERO  ; fd 
      00B056 CD 86 62         [ 4]  480     CALL TOR   ; dm a cntr R: sign fd 
      00B059                        481 FLOATQ2: 
      00B059 CD AF 79         [ 4]  482     CALL parse_exponent 
      002FDC                        483     _QBRAN FLOAT_ERROR0 ; exponent expected 
      00B05C CD 85 18         [ 4]    1     CALL QBRAN
      00B05F B0 8D                    2     .word FLOAT_ERROR0
      00B061                        484 FLOATQ3: ; dm 0 || dm e  
      00B061 CD 85 B4         [ 4]  485     CALL RFROM ;  fd  
      00B064 CD 89 52         [ 4]  486     CALL SUBB  ; exp=e-fd 
      00B067 CD 88 7C         [ 4]  487     CALL NROT 
      00B06A CD 85 B4         [ 4]  488     CALL RFROM  ; sign 
      002FED                        489     _QBRAN FLOATQ4 
      00B06D CD 85 18         [ 4]    1     CALL QBRAN
      00B070 B0 75                    2     .word FLOATQ4
      00B072 CD 89 18         [ 4]  490     CALL DNEGA 
      00B075                        491 FLOATQ4:
      00B075 CD 88 5D         [ 4]  492     CALL ROT 
      00B078 CD AD E5         [ 4]  493     CALL STEXP 
      00B07B CD 88 5D         [ 4]  494     CALL ROT 
      002FFE                        495     _DROP 
      00B07E 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00B081 CD AD 66         [ 4]  496     CALL SFN 
      00B084 CD AD 2F         [ 4]  497     CALL SFZ 
      003007                        498     _DOLIT -3 
      00B087 CD 84 EF         [ 4]    1     CALL DOLIT 
      00B08A FF FD                    2     .word -3 
      00B08C 81               [ 4]  499     RET       
      00B08D                        500 FLOAT_ERROR0: 
      00B08D CD A9 61         [ 4]  501     CALL DRFROM ; sign df      
      00B090                        502 FLOAT_ERROR: 
      00B090 CD 8C C5         [ 4]  503     CALL DEPTH 
      00B093 CD 8C 0A         [ 4]  504     CALL CELLS 
      00B096 CD 86 79         [ 4]  505     CALL SPAT 
      00B099 CD 86 A9         [ 4]  506     CALL SWAPP 
      00B09C CD 88 BC         [ 4]  507     CALL PLUS  
      00B09F CD 86 86         [ 4]  508     CALL SPSTO 
      00B0A2 CD 8C 83         [ 4]  509     CALL ZERO 
      00B0A5 81               [ 4]  510     RET 
                                    511 
                                    512 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 174.
Hexadecimal [24-Bits]



                                    513 ;  LSCALE ( f# -- f# )
                                    514 ;  m *=10 , e -= 1
                                    515 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      003026                        516     _HEADER LSCALE,6,"LSCALE"
      00B0A6 AF DA                    1         .word LINK 
                           003028     2         LINK=.
      00B0A8 06                       3         .byte 6  
      00B0A9 4C 53 43 41 4C 45        4         .ascii "LSCALE"
      00B0AF                          5         LSCALE:
      00B0AF CD AD B3         [ 4]  517     CALL ATEXP 
      00B0B2 CD 8C 8E         [ 4]  518     CALL ONE 
      00B0B5 CD 89 52         [ 4]  519     CALL SUBB 
      00B0B8 CD 86 62         [ 4]  520     CALL TOR
      00303B                        521     _DOLIT 10 
      00B0BB CD 84 EF         [ 4]    1     CALL DOLIT 
      00B0BE 00 0A                    2     .word 10 
      00B0C0 CD A7 CE         [ 4]  522     CALL DSSTAR
      00B0C3 CD 85 B4         [ 4]  523     CALL RFROM 
      00B0C6 CD AD E5         [ 4]  524     CALL STEXP 
      00B0C9 81               [ 4]  525     RET  
                                    526 
                                    527 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    528 ;  RSCALE ( f# -- f# )
                                    529 ;  m /=10 , e+=1 
                                    530 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00304A                        531     _HEADER RSCALE,6,"RSCALE"
      00B0CA B0 A8                    1         .word LINK 
                           00304C     2         LINK=.
      00B0CC 06                       3         .byte 6  
      00B0CD 52 53 43 41 4C 45        4         .ascii "RSCALE"
      00B0D3                          5         RSCALE:
      00B0D3 CD AD B3         [ 4]  532     CALL ATEXP 
      00B0D6 CD 8C 8E         [ 4]  533     CALL ONE 
      00B0D9 CD 88 BC         [ 4]  534     CALL PLUS 
      00B0DC CD 86 62         [ 4]  535     CALL TOR 
      00305F                        536     _DOLIT 10 
      00B0DF CD 84 EF         [ 4]    1     CALL DOLIT 
      00B0E2 00 0A                    2     .word 10 
      00B0E4 CD A7 03         [ 4]  537     CALL DSLMOD 
      00B0E7 CD 88 5D         [ 4]  538     CALL ROT 
      00306A                        539     _DROP 
      00B0EA 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00B0ED CD 85 B4         [ 4]  540     CALL RFROM 
      00B0F0 CD AD E5         [ 4]  541     CALL STEXP 
      00B0F3 81               [ 4]  542     RET 
                                    543 
                                    544 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    545 ;  SCALEUP ( ud u1 u2 -- ud*10 u1 u2 )
                                    546 ;  while (ud<=0xcccccccc && u1<u2 ){
                                    547 ;        ud*10;
                                    548 ;        u2--;
                                    549 ;  }  
                                    550 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00B0F4                        551 SCALEUP:
      00B0F4 CD 88 A7         [ 4]  552     CALL DDUP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 175.
Hexadecimal [24-Bits]



      00B0F7 CD 89 A6         [ 4]  553     CALL LESS  
      00307A                        554     _QBRAN SCALEUP3
      00B0FA CD 85 18         [ 4]    1     CALL QBRAN
      00B0FD B1 2A                    2     .word SCALEUP3
      00B0FF CD A9 43         [ 4]  555     CALL DTOR   ; R: u1 u2  
      00B102 CD 88 A7         [ 4]  556     CALL DDUP 
      003085                        557     _DOLIT 0XCCCC 
      00B105 CD 84 EF         [ 4]    1     CALL DOLIT 
      00B108 CC CC                    2     .word 0XCCCC 
      00308A                        558     _DOLIT 0XCCC 
      00B10A CD 84 EF         [ 4]    1     CALL DOLIT 
      00B10D 0C CC                    2     .word 0XCCC 
      00B10F CD A9 06         [ 4]  559     CALL DGREAT  
      003092                        560     _TBRAN SCALEUP2 
      00B112 CD 85 26         [ 4]    1     CALL TBRAN 
      00B115 B1 27                    2     .word SCALEUP2 
      003097                        561     _DOLIT 10 
      00B117 CD 84 EF         [ 4]    1     CALL DOLIT 
      00B11A 00 0A                    2     .word 10 
      00B11C CD A7 AC         [ 4]  562     CALL UDSSTAR 
      00B11F CD A9 61         [ 4]  563     CALL DRFROM 
      00B122 CD 8C 24         [ 4]  564     CALL ONEM
      00B125 20 CD            [ 2]  565     JRA SCALEUP
      00B127                        566 SCALEUP2:
      00B127 CD A9 61         [ 4]  567     CALL DRFROM
      00B12A                        568 SCALEUP3: 
      00B12A 81               [ 4]  569     RET 
                                    570 
                                    571 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    572 ; SCALEDOWN ( ud u1 u2 -- ud u1 u2 )
                                    573 ;  whhile (ud && u1>u2 ){ 
                                    574 ;     ud/10;
                                    575 ;     u2++;
                                    576 ;  } 
                                    577 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00B12B                        578 SCALEDOWN: 
      00B12B CD 88 A7         [ 4]  579     CALL DDUP 
      00B12E CD 89 D3         [ 4]  580     CALL GREAT 
      0030B1                        581     _QBRAN SCALDN3 
      00B131 CD 85 18         [ 4]    1     CALL QBRAN
      00B134 B1 5A                    2     .word SCALDN3
      00B136 CD A9 43         [ 4]  582     CALL DTOR 
      00B139 CD 88 A7         [ 4]  583     CALL DDUP 
      00B13C CD A8 C9         [ 4]  584     CALL DZEQUAL 
      0030BF                        585     _TBRAN SCALDN2  
      00B13F CD 85 26         [ 4]    1     CALL TBRAN 
      00B142 B1 57                    2     .word SCALDN2 
      0030C4                        586     _DOLIT 10
      00B144 CD 84 EF         [ 4]    1     CALL DOLIT 
      00B147 00 0A                    2     .word 10 
      00B149 CD 8C 83         [ 4]  587     CALL ZERO  
      00B14C CD AB F7         [ 4]  588     CALL DSLASH 
      00B14F CD A9 61         [ 4]  589     CALL DRFROM 
      00B152 CD 8C 17         [ 4]  590     CALL ONEP  
      00B155 20 D4            [ 2]  591     JRA SCALEDOWN 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 176.
Hexadecimal [24-Bits]



      00B157                        592 SCALDN2:
      00B157 CD A9 61         [ 4]  593     CALL DRFROM 
      00B15A                        594 SCALDN3:
      00B15A 81               [ 4]  595     RET 
                                    596 
                                    597 
                                    598 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    599 ;  F-ALIGN ( f#1 f#2 -- m1 m2 e )
                                    600 ;  align to same exponent 
                                    601 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0030DB                        602     _HEADER FALIGN,7,"F-ALIGN"
      00B15B B0 CC                    1         .word LINK 
                           0030DD     2         LINK=.
      00B15D 07                       3         .byte 7  
      00B15E 46 2D 41 4C 49 47 4E     4         .ascii "F-ALIGN"
      00B165                          5         FALIGN:
      00B165 CD AD B3         [ 4]  603     CALL ATEXP 
      00B168 CD 86 62         [ 4]  604     CALL TOR 
      00B16B CD A7 F4         [ 4]  605     CALL DSWAP 
      00B16E CD AD B3         [ 4]  606     CALL ATEXP 
      00B171 CD 86 62         [ 4]  607     CALL TOR    ; m2 m1 R: e2 e1 
      00B174 CD A7 F4         [ 4]  608     CALL DSWAP 
      00B177 CD A9 79         [ 4]  609     CALL DRAT 
      00B17A CD 89 7A         [ 4]  610     CALL EQUAL 
      0030FD                        611     _TBRAN FALGN8
      00B17D CD 85 26         [ 4]    1     CALL TBRAN 
      00B180 B2 02                    2     .word FALGN8 
                                    612 ; scaleup the largest float 
                                    613 ; but limit mantissa <=0xccccccc
                                    614 ; to avoid mantissa overflow     
      00B182 CD A9 79         [ 4]  615     CALL DRAT ; m1 m2 e2 e1 
      00B185 CD 89 D3         [ 4]  616     CALL GREAT 
      003108                        617     _QBRAN FALGN4 ; e2<e1 
      00B188 CD 85 18         [ 4]    1     CALL QBRAN
      00B18B B1 9E                    2     .word FALGN4
                                    618 ; e2>e1 then scale up m2   
      00B18D CD A9 61         [ 4]  619     CALL DRFROM 
      00B190 CD 86 A9         [ 4]  620     CALL SWAPP 
      00B193 CD B0 F4         [ 4]  621     CALL SCALEUP 
      00B196 CD 86 A9         [ 4]  622     CALL SWAPP 
      00B199 CD A9 43         [ 4]  623     CALL DTOR 
      00B19C 20 0F            [ 2]  624     JRA FALGN6
      00B19E                        625 FALGN4: ; e2<e1 then scaleup m1 
      00B19E CD A7 F4         [ 4]  626     CALL DSWAP 
      00B1A1 CD A9 61         [ 4]  627     CALL DRFROM 
      00B1A4 CD B0 F4         [ 4]  628     CALL SCALEUP 
      00B1A7 CD A9 43         [ 4]  629     CALL DTOR
      00B1AA CD A7 F4         [ 4]  630     CALL DSWAP 
                                    631 ; check again for e2==e1 
                                    632 ; if scaleup was not enough 
                                    633 ; to equalize exponent then
                                    634 ; scaledown smallest float     
      00B1AD                        635 FALGN6: 
      00B1AD CD A9 79         [ 4]  636     CALL DRAT 
      00B1B0 CD 89 7A         [ 4]  637     CALL EQUAL 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 177.
Hexadecimal [24-Bits]



      003133                        638     _TBRAN FALGN8 
      00B1B3 CD 85 26         [ 4]    1     CALL TBRAN 
      00B1B6 B2 02                    2     .word FALGN8 
                                    639 ; e2!=e1 need to scale down smallest 
      00B1B8 CD A9 79         [ 4]  640     CALL DRAT 
      00B1BB CD 89 D3         [ 4]  641     CALL GREAT 
      00313E                        642     _QBRAN FALGN7 ; e2<e1 
      00B1BE CD 85 18         [ 4]    1     CALL QBRAN
      00B1C1 B1 D4                    2     .word FALGN7
                                    643 ; e2>e1 scaledown m1 
      00B1C3 CD A7 F4         [ 4]  644     CALL DSWAP 
      00B1C6 CD A9 61         [ 4]  645     CALL DRFROM 
      00B1C9 CD B1 2B         [ 4]  646     CALL SCALEDOWN
      00B1CC CD 86 A9         [ 4]  647     CALL SWAPP 
      00B1CF CD A9 43         [ 4]  648     CALL DTOR 
      00B1D2 20 0F            [ 2]  649     JRA FALGN71  
      00B1D4                        650 FALGN7: ; e2<e1 scaledown m2 
      00B1D4 CD A9 61         [ 4]  651     CALL DRFROM 
      00B1D7 CD 86 A9         [ 4]  652     CALL SWAPP 
      00B1DA CD B1 2B         [ 4]  653     CALL SCALEDOWN 
      00B1DD CD 86 A9         [ 4]  654     CALL SWAPP 
      00B1E0 CD A9 43         [ 4]  655     CALL DTOR 
                                    656 ; after scaledown if e2!=e1 
                                    657 ; this imply that one of mantissa 
                                    658 ; as been nullified by scalling 
                                    659 ; hence keep largest exponent 
      00B1E3                        660 FALGN71:
      00B1E3 CD A9 79         [ 4]  661     CALL DRAT 
      00B1E6 CD 89 7A         [ 4]  662     CALL EQUAL
      003169                        663     _TBRAN FALGN8 
      00B1E9 CD 85 26         [ 4]    1     CALL TBRAN 
      00B1EC B2 02                    2     .word FALGN8 
      00B1EE CD A9 61         [ 4]  664     CALL DRFROM 
      00B1F1 CD 88 A7         [ 4]  665     CALL DDUP 
      00B1F4 CD 89 D3         [ 4]  666     CALL GREAT 
      003177                        667     _TBRAN FALGN72
      00B1F7 CD 85 26         [ 4]    1     CALL TBRAN 
      00B1FA B1 FF                    2     .word FALGN72 
      00B1FC CD 86 A9         [ 4]  668     CALL SWAPP     
      00B1FF                        669 FALGN72:
      00B1FF CD A9 43         [ 4]  670     CALL DTOR  ; now smallest e is at rtop.
      00B202                        671 FALGN8:
      00B202 CD A9 61         [ 4]  672     CALL DRFROM 
      003185                        673     _DROP 
      00B205 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00B208 81               [ 4]  674     RET 
                                    675 
                                    676 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    677 ;   F+ ( f#1 f#2 -- f#1+f#2 )
                                    678 ;   float addition 
                                    679 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      003189                        680     _HEADER FPLUS,2,"F+"
      00B209 B1 5D                    1         .word LINK 
                           00318B     2         LINK=.
      00B20B 02                       3         .byte 2  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 178.
Hexadecimal [24-Bits]



      00B20C 46 2B                    4         .ascii "F+"
      00B20E                          5         FPLUS:
      00B20E CD B1 65         [ 4]  681     CALL FALIGN 
      00B211 CD 86 62         [ 4]  682     CALL TOR 
      00B214 CD AC 06         [ 4]  683     CALL DPLUS
      00B217 CD A6 E9         [ 4]  684     CALL DSIGN 
      00B21A CD 86 62         [ 4]  685     CALL TOR 
      00B21D CD A6 D8         [ 4]  686     CALL DABS 
      00B220 CD B2 83         [ 4]  687     CALL SCALETOM
      00B223 CD 85 B4         [ 4]  688     CALL RFROM 
      0031A6                        689     _QBRAN FPLUS1 
      00B226 CD 85 18         [ 4]    1     CALL QBRAN
      00B229 B2 2E                    2     .word FPLUS1
      00B22B CD 89 18         [ 4]  690     CALL DNEGA  
      00B22E                        691 FPLUS1: 
      00B22E CD 88 5D         [ 4]  692     CALL ROT   
      00B231 CD 85 B4         [ 4]  693     CALL RFROM
      00B234 CD 88 BC         [ 4]  694     CALL PLUS  
      00B237 CD AD E5         [ 4]  695     CALL STEXP 
      00B23A 81               [ 4]  696     RET 
                                    697 
                                    698 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    699 ;  F- ( f#1 f#2 -- f#1-f#2 )
                                    700 ;  substraction 
                                    701 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0031BB                        702     _HEADER FSUB,2,"F-"
      00B23B B2 0B                    1         .word LINK 
                           0031BD     2         LINK=.
      00B23D 02                       3         .byte 2  
      00B23E 46 2D                    4         .ascii "F-"
      00B240                          5         FSUB:
      00B240 CD B1 65         [ 4]  703     CALL FALIGN 
      00B243 CD 86 62         [ 4]  704     CALL TOR 
      00B246 CD AC 38         [ 4]  705     CALL DSUB
      00B249 CD A6 E9         [ 4]  706     CALL DSIGN 
      00B24C CD 86 62         [ 4]  707     CALL TOR 
      00B24F CD A6 D8         [ 4]  708     CALL DABS 
      00B252 CD B2 83         [ 4]  709     CALL SCALETOM 
      00B255 CD 85 B4         [ 4]  710     CALL RFROM 
      0031D8                        711     _QBRAN FSUB1 
      00B258 CD 85 18         [ 4]    1     CALL QBRAN
      00B25B B2 60                    2     .word FSUB1
      00B25D CD 89 18         [ 4]  712     CALL DNEGA 
      00B260                        713 FSUB1:
      00B260 CD 88 5D         [ 4]  714     CALL ROT 
      00B263 CD 85 B4         [ 4]  715     CALL RFROM
      00B266 CD 88 BC         [ 4]  716     CALL PLUS  
      00B269 CD AD E5         [ 4]  717     CALL STEXP 
      00B26C 81               [ 4]  718     RET 
                                    719 
                                    720 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    721 ; /mod10  ( m -- m/10 r )
                                    722 ; divide mantissa by 10 
                                    723 ; return quotient and remainder 
                                    724 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 179.
Hexadecimal [24-Bits]



      00B26D                        725 UMOD10:
      0031ED                        726     _DOLIT 10 
      00B26D CD 84 EF         [ 4]    1     CALL DOLIT 
      00B270 00 0A                    2     .word 10 
      00B272 CD A7 03         [ 4]  727     CALL DSLMOD
      00B275 CD 88 5D         [ 4]  728     CALL ROT  
      00B278 81               [ 4]  729     RET 
                                    730 
                                    731 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    732 ;   SCALE>M ( ud1 -- e ud2 )
                                    733 ;   scale down a double  
                                    734 ;   by repeated d/10
                                    735 ;   until ud<=MAX_MANTISSA   
                                    736 ;   e is log10 exponent of scaled down
                                    737 ;   ud2 is scaled down ud1 
                                    738 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0031F9                        739     _HEADER SCALETOM,7,"SCALE>M"
      00B279 B2 3D                    1         .word LINK 
                           0031FB     2         LINK=.
      00B27B 07                       3         .byte 7  
      00B27C 53 43 41 4C 45 3E 4D     4         .ascii "SCALE>M"
      00B283                          5         SCALETOM:
      00B283 CD 8C 83         [ 4]  740     CALL ZERO 
      00B286 CD 88 7C         [ 4]  741     CALL NROT 
      00B289                        742 SCAL1:
      00B289 CD 86 99         [ 4]  743     CALL DUPP 
      00320C                        744     _DOLIT 0X7F 
      00B28C CD 84 EF         [ 4]    1     CALL DOLIT 
      00B28F 00 7F                    2     .word 0X7F 
      00B291 CD 89 BD         [ 4]  745     CALL UGREAT 
      003214                        746     _QBRAN SCAL2  
      00B294 CD 85 18         [ 4]    1     CALL QBRAN
      00B297 B2 AD                    2     .word SCAL2
      00B299 CD B2 6D         [ 4]  747     CALL UMOD10 
      00321C                        748     _DROP 
      00B29C 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00B29F CD 88 5D         [ 4]  749     CALL ROT 
      00B2A2 CD 8C 17         [ 4]  750     CALL ONEP 
      00B2A5 CD 88 7C         [ 4]  751     CALL NROT  
      003228                        752     _BRAN SCAL1 
      00B2A8 CD 85 34         [ 4]    1     CALL BRAN 
      00B2AB B2 89                    2     .word SCAL1 
      00B2AD                        753 SCAL2: 
      00B2AD 81               [ 4]  754     RET 
                                    755 
                                    756 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    757 ;  UDIV10 ( ut -- ut )
                                    758 ;  divide a 48 bits uint by 10 
                                    759 ;  used to scale down MM* 
                                    760 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00B2AE                        761 UDIV10:
      00B2AE 90 93            [ 1]  762     LDW Y,X 
      00B2B0 90 FE            [ 2]  763     LDW Y,(Y)
      00B2B2 A6 0A            [ 1]  764     LD A,#10 
      00B2B4 90 62            [ 2]  765     DIV Y,A 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 180.
Hexadecimal [24-Bits]



      00B2B6 FF               [ 2]  766     LDW (X),Y 
      00B2B7 90 95            [ 1]  767     LD YH,A 
      00B2B9 E6 02            [ 1]  768     LD A,(2,X)
      00B2BB 90 97            [ 1]  769     LD YL,A 
      00B2BD A6 0A            [ 1]  770     LD A,#10 
      00B2BF 90 62            [ 2]  771     DIV Y,A 
      00B2C1 90 95            [ 1]  772     LD YH,A 
      00B2C3 90 9F            [ 1]  773     LD A,YL 
      00B2C5 E7 02            [ 1]  774     LD (2,X),A 
      00B2C7 E6 03            [ 1]  775     LD A,(3,X)
      00B2C9 90 97            [ 1]  776     LD YL,A 
      00B2CB A6 0A            [ 1]  777     LD A,#10 
      00B2CD 90 62            [ 2]  778     DIV Y,A 
      00B2CF 90 95            [ 1]  779     LD YH,A 
      00B2D1 90 9F            [ 1]  780     LD A,YL 
      00B2D3 E7 03            [ 1]  781     LD (3,X),A 
      00B2D5 E6 04            [ 1]  782     LD A,(4,X)
      00B2D7 90 97            [ 1]  783     LD YL,A 
      00B2D9 A6 0A            [ 1]  784     LD A,#10 
      00B2DB 90 62            [ 2]  785     DIV Y,A 
      00B2DD 90 95            [ 1]  786     LD YH,A 
      00B2DF 90 9F            [ 1]  787     LD A,YL 
      00B2E1 E7 04            [ 1]  788     LD (4,X),A 
      00B2E3 E6 05            [ 1]  789     LD A,(5,X)
      00B2E5 90 97            [ 1]  790     LD YL,A 
      00B2E7 A6 0A            [ 1]  791     LD A,#10 
      00B2E9 90 62            [ 2]  792     DIV Y,A 
      00B2EB 90 9F            [ 1]  793     LD A,YL 
      00B2ED E7 05            [ 1]  794     LD (5,X),A 
      00B2EF 81               [ 4]  795     RET 
                                    796 
                                    797 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    798 ;   MM* ( m1 m2 -- m3 e )
                                    799 ;   mantissa product 
                                    800 ;  scale down to 23 bits 
                                    801 ;   e  is log10 scaling factor.
                                    802 ;   The maximum product size 
                                    803 ;   before scaling is 46 bits .
                                    804 ;   UDIV10 is used to scale down.  
                                    805 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      003270                        806     _HEADER MMSTAR,3,"MM*"
      00B2F0 B2 7B                    1         .word LINK 
                           003272     2         LINK=.
      00B2F2 03                       3         .byte 3  
      00B2F3 4D 4D 2A                 4         .ascii "MM*"
      00B2F6                          5         MMSTAR:
      00B2F6 CD 88 A7         [ 4]  807     CALL DDUP
      00B2F9 CD A8 C9         [ 4]  808     CALL DZEQUAL
      00327C                        809     _TBRAN MMSTA2
      00B2FC CD 85 26         [ 4]    1     CALL TBRAN 
      00B2FF B3 0C                    2     .word MMSTA2 
      00B301                        810 MMSTA1:
      00B301 CD AA 0A         [ 4]  811     CALL DOVER 
      00B304 CD A8 C9         [ 4]  812     CALL DZEQUAL 
      003287                        813     _QBRAN MMSTA3 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 181.
Hexadecimal [24-Bits]



      00B307 CD 85 18         [ 4]    1     CALL QBRAN
      00B30A B3 17                    2     .word MMSTA3
      00B30C                        814 MMSTA2: ; ( -- 0 0 0 )
      00B30C 1C 00 02         [ 2]  815     ADDW X,#2 
      00B30F 90 5F            [ 1]  816     CLRW Y 
      00B311 FF               [ 2]  817     LDW (X),Y 
      00B312 EF 02            [ 2]  818     LDW (2,X),Y
      00B314 EF 04            [ 2]  819     LDW (4,X),Y 
      00B316 81               [ 4]  820     RET 
      00B317                        821 MMSTA3:
      00B317 CD A6 E9         [ 4]  822     CALL DSIGN 
      00B31A CD 86 62         [ 4]  823     CALL TOR    ; R: m2sign 
      00B31D CD A6 D8         [ 4]  824     CALL DABS   ; m1 um2 
      00B320 CD A7 F4         [ 4]  825     CALL DSWAP  ; um2 m1 
      00B323 CD A6 E9         [ 4]  826     CALL DSIGN  ; um2 m1 m1sign 
      00B326 CD 85 B4         [ 4]  827     CALL RFROM 
      00B329 CD 87 1F         [ 4]  828     CALL XORR 
      00B32C CD 86 62         [ 4]  829     CALL TOR   ; R: product_sign 
      00B32F CD A6 D8         [ 4]  830     CALL DABS  ; um2 um1  
      00B332 CD A9 43         [ 4]  831     CALL DTOR  ; um2 
      00B335 CD 86 99         [ 4]  832     CALL DUPP  ; um2 um2hi 
      00B338 CD 85 C5         [ 4]  833     CALL RAT   ; um2 um2hi um1hi
                                    834 ; first partial product  
                                    835 ; pd1=um2hi*um1hi 
      00B33B CD 8B 96         [ 4]  836     CALL STAR 
      00B33E CD 8C 83         [ 4]  837     CALL ZERO 
      00B341 CD 86 A9         [ 4]  838     CALL SWAPP ; pd1<<16  
      00B344 CD A7 F4         [ 4]  839     CALL DSWAP ; pd1 um2 
      00B347 CD 86 C1         [ 4]  840     CALL OVER  ; pd1 um2 um2lo 
      00B34A CD 85 B4         [ 4]  841     CALL RFROM ; pd1 um2 um2lo um1hi 
                                    842 ; pd2=um2lo*um1hi 
      00B34D CD 8B 4C         [ 4]  843     CALL UMSTA ; pd1 um2 pd2 
      00B350 CD A7 F4         [ 4]  844     CALL DSWAP ; pd1 pd2 um2 
      00B353 CD 85 C5         [ 4]  845     CALL RAT   ; pd1 pd2 um2 um1lo 
                                    846 ; pd3= um2hi*um1lo 
      00B356 CD 8B 4C         [ 4]  847     CALL UMSTA ; pd1 pd2 um2lo pd3 
      00B359 CD 88 5D         [ 4]  848     CALL ROT ; pd1 pd2 pd3 um2lo 
      00B35C CD 86 62         [ 4]  849     CALL TOR ; pd1 pd2 pd3 R: psign um1lo um2lo 
                                    850 ; pd1+pd2+pd3  pd1
      00B35F CD AC 06         [ 4]  851     CALL DPLUS 
      00B362 CD AC 06         [ 4]  852     CALL DPLUS  
      00B365 CD A9 61         [ 4]  853     CALL DRFROM ; triple um2lo um1lo 
                                    854 ; last partial product um2lo*um1lo 
      00B368 CD 8B 4C         [ 4]  855     CALL UMSTA ; prod pd4 
                                    856 ; mm*=prod<<16+pd4  
      00B36B CD A9 43         [ 4]  857     CALL DTOR ;   R: psign pd4lo pd4hi  
                                    858  ; add pd4hi to prodlo and propagate carry 
      00B36E 90 93            [ 1]  859     LDW Y,X 
      00B370 90 EE 02         [ 2]  860     LDW Y,(2,Y)  ; prodlo 
      00B373 72 F9 01         [ 2]  861     ADDW Y,(1,SP)  ; prodlo+pd4hi 
      00B376 17 01            [ 2]  862     LDW (1,SP),Y    ; plo phi  
      00B378 90 93            [ 1]  863     LDW Y,X
      00B37A 90 FE            [ 2]  864     LDW Y,(Y) ; prodhi  
      00B37C 24 04            [ 1]  865     JRNC MMSTA4
      00B37E 72 A9 00 01      [ 2]  866     ADDW Y,#1 ; add carry 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 182.
Hexadecimal [24-Bits]



      00B382                        867 MMSTA4:     
      00B382 1D 00 02         [ 2]  868     SUBW X,#2 
      00B385 FF               [ 2]  869     LDW (X),Y 
      00B386 90 85            [ 2]  870     POPW Y 
      00B388 EF 02            [ 2]  871     LDW (2,X),Y 
      00B38A 90 85            [ 2]  872     POPW Y 
      00B38C EF 04            [ 2]  873     LDW (4,X),Y
      00B38E CD 8C 83         [ 4]  874     CALL ZERO 
      00B391 CD 86 62         [ 4]  875     CALL TOR 
      00B394                        876 MMSTA5:
      00B394 CD 88 4C         [ 4]  877     CALL QDUP 
      003317                        878     _QBRAN MMSTA6 
      00B397 CD 85 18         [ 4]    1     CALL QBRAN
      00B39A B3 AD                    2     .word MMSTA6
      00B39C CD B2 AE         [ 4]  879     CALL UDIV10 
      00B39F CD 85 B4         [ 4]  880     CALL RFROM 
      00B3A2 CD 8C 17         [ 4]  881     CALL ONEP 
      00B3A5 CD 86 62         [ 4]  882     CALL TOR 
      003328                        883     _BRAN MMSTA5 
      00B3A8 CD 85 34         [ 4]    1     CALL BRAN 
      00B3AB B3 94                    2     .word MMSTA5 
                                    884 ; now scale to double 
                                    885 ; scale further <= MAX_MANTISSA 
      00B3AD                        886 MMSTA6: 
      00B3AD CD 85 B4         [ 4]  887     CALL RFROM 
      00B3B0 CD 88 7C         [ 4]  888     CALL NROT 
      00B3B3 CD B2 83         [ 4]  889     CALL SCALETOM
      00B3B6 CD A9 43         [ 4]  890     CALL DTOR 
      00B3B9 CD 88 BC         [ 4]  891     CALL PLUS 
      00B3BC CD A9 61         [ 4]  892     CALL DRFROM 
      00B3BF CD 85 B4         [ 4]  893     CALL RFROM
      003342                        894     _QBRAN MMSTA7
      00B3C2 CD 85 18         [ 4]    1     CALL QBRAN
      00B3C5 B3 CA                    2     .word MMSTA7
      00B3C7 CD 89 18         [ 4]  895     CALL DNEGA
      00B3CA                        896 MMSTA7:
      00B3CA CD 88 5D         [ 4]  897     CALL ROT ; m e 
      00B3CD 81               [ 4]  898     RET 
                                    899 
                                    900 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    901 ;    F* ( f#1 f#2 -- f#3 )
                                    902 ;    float product 
                                    903 ;    f#3=f#1 * f#2 
                                    904 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00334E                        905     _HEADER FSTAR,2,"F*"
      00B3CE B2 F2                    1         .word LINK 
                           003350     2         LINK=.
      00B3D0 02                       3         .byte 2  
      00B3D1 46 2A                    4         .ascii "F*"
      00B3D3                          5         FSTAR:
      00B3D3 CD AD B3         [ 4]  906     CALL ATEXP ; f#1 m2 e2 
      00B3D6 CD 86 62         [ 4]  907     CALL TOR   
      00B3D9 CD A7 F4         [ 4]  908     CALL DSWAP ; m2 f#1
      00B3DC CD AD B3         [ 4]  909     CALL ATEXP ; m2 m1 e1 
      00B3DF CD 85 B4         [ 4]  910     CALL RFROM ; m2 m1 e1 e2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 183.
Hexadecimal [24-Bits]



      00B3E2 CD 88 BC         [ 4]  911     CALL PLUS  ; m2 m1 e 
      00B3E5 CD 86 62         [ 4]  912     CALL TOR   ; m2 m1 R: e 
      00B3E8 CD B2 F6         [ 4]  913     CALL MMSTAR ; m2*m1 e   
      00B3EB CD 85 B4         [ 4]  914     CALL RFROM 
      00B3EE CD 88 BC         [ 4]  915     CALL PLUS 
      00B3F1 CD AD E5         [ 4]  916     CALL STEXP ; f#3 
      00B3F4 81               [ 4]  917     RET 
                                    918 
                                    919 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    920 ;  F/ ( f#1 f#2 -- f#3 )
                                    921 ;  float division
                                    922 ;  f#3 = f#1/f#2
                                    923 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      003375                        924     _HEADER FSLASH,2,"F/"
      00B3F5 B3 D0                    1         .word LINK 
                           003377     2         LINK=.
      00B3F7 02                       3         .byte 2  
      00B3F8 46 2F                    4         .ascii "F/"
      00B3FA                          5         FSLASH:
      00B3FA CD AD B3         [ 4]  925     CALL ATEXP  ; f#1 m2 e2 
      00B3FD CD 86 62         [ 4]  926     CALL TOR    ; f#1 m2   R: e2 
      00B400 CD A6 E9         [ 4]  927     CALL DSIGN  ; f#1 m2 m2sign 
      00B403 CD 86 62         [ 4]  928     CALL TOR    ; F#1 m2 R: e2 m2s 
      00B406 CD A6 D8         [ 4]  929     CALL DABS   ; F#1 um2 
      00B409 CD A7 F4         [ 4]  930     CALL DSWAP  ; m2 f#1 
      00B40C CD AD B3         [ 4]  931     CALL ATEXP  ; m2 m1 e1 
      00B40F CD 8C 8E         [ 4]  932     CALL ONE    ; e2 slot on rstack  
      00B412 CD 86 1F         [ 4]  933     CALL NRAT   ; m2 m1 e1 e2 
      00B415 CD 89 52         [ 4]  934     CALL SUBB   ; m2 m1 e 
      00B418 CD 8C 8E         [ 4]  935     CALL ONE    ; e slot on rstack 
      00B41B CD 86 3E         [ 4]  936     CALL NRSTO  ; m2 m1 R: e m2s 
      00B41E CD A6 E9         [ 4]  937     CALL DSIGN  ; m2 m1 m1sign 
      00B421 CD 85 B4         [ 4]  938     CALL RFROM  ; m2 m1 m1s m2s  
      00B424 CD 87 1F         [ 4]  939     CALL XORR   ; m2 m1 quot_sign R: e 
      00B427 CD 85 B4         [ 4]  940     CALL RFROM   
      00B42A CD A9 43         [ 4]  941     CALL DTOR   ; m2 m1 R: qs e  
      00B42D CD A6 D8         [ 4]  942     CALL DABS   ; um2 um1 R: qs e  
      00B430 CD A7 F4         [ 4]  943     CALL DSWAP  ; m1 m2 R: qs e
      00B433 CD 88 A7         [ 4]  944     CALL DDUP  ; m1 m2 m2 R: qs e
      00B436 CD A9 43         [ 4]  945     CALL DTOR  ; m1 m2 R: qs e m2 ( keep divisor need later ) 
      00B439 CD AB 15         [ 4]  946     CALL UDSLMOD ; remainder m1/m2 R: e m2 
      00B43C                        947 FSLASH1: 
      00B43C CD AA 0A         [ 4]  948     CALL DOVER ; if remainder null done 
      00B43F CD A8 C9         [ 4]  949     CALL DZEQUAL 
      0033C2                        950     _TBRAN FSLASH8 
      00B442 CD 85 26         [ 4]    1     CALL TBRAN 
      00B445 B4 A2                    2     .word FSLASH8 
                                    951 ; get fractional digits from remainder until mantissa saturate
                                    952 ; remainder mantissa R: e divisor 
                                    953 ; check for mantissa saturation 
      00B447 CD 88 A7         [ 4]  954     CALL DDUP 
      0033CA                        955     _DOLIT 0XCCCC 
      00B44A CD 84 EF         [ 4]    1     CALL DOLIT 
      00B44D CC CC                    2     .word 0XCCCC 
      0033CF                        956     _DOLIT 0xC
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 184.
Hexadecimal [24-Bits]



      00B44F CD 84 EF         [ 4]    1     CALL DOLIT 
      00B452 00 0C                    2     .word 0xC 
      00B454 CD A9 06         [ 4]  957     CALL DGREAT 
      0033D7                        958     _TBRAN FSLASH8 ; another loop would result in mantissa overflow 
      00B457 CD 85 26         [ 4]    1     CALL TBRAN 
      00B45A B4 A2                    2     .word FSLASH8 
                                    959 ; multiply mantissa by 10 
      0033DC                        960     _DOLIT 10 
      00B45C CD 84 EF         [ 4]    1     CALL DOLIT 
      00B45F 00 0A                    2     .word 10 
      00B461 CD 8C 83         [ 4]  961     CALL ZERO 
      00B464 CD AA B2         [ 4]  962     CALL DSTAR 
                                    963 ; mutliply remainder by 10     
      00B467 CD A7 F4         [ 4]  964     CALL DSWAP 
      0033EA                        965     _DOLIT 10 
      00B46A CD 84 EF         [ 4]    1     CALL DOLIT 
      00B46D 00 0A                    2     .word 10 
      00B46F CD 8C 83         [ 4]  966     CALL ZERO 
      00B472 CD AA B2         [ 4]  967     CALL DSTAR 
                                    968 ; divide remainder by m2     
      00B475 CD A9 79         [ 4]  969     CALL DRAT  ; mantissa remainder divisor R: e divisor 
      00B478 CD AB 15         [ 4]  970     CALL UDSLMOD ; mantissa dr dq R: qs e divisor 
      00B47B CD A7 F4         [ 4]  971     CALL DSWAP ; mantissa frac_digit remainder R: qs e divisor  
      00B47E CD A9 43         [ 4]  972     CALL DTOR  ; mantissa frac_digit R: qs e divisor remainder 
      00B481 CD AC 06         [ 4]  973     CALL DPLUS ; mantissa+frac_digit 
      00B484 CD A9 61         [ 4]  974     CALL DRFROM ; mantissa remainder R: qs e divisor  
      00B487 CD A7 F4         [ 4]  975     CALL DSWAP  ; remainder mantissa  
                                    976 ; increment e 
      00340A                        977     _DOLIT 2    ; e slot on rstack 
      00B48A CD 84 EF         [ 4]    1     CALL DOLIT 
      00B48D 00 02                    2     .word 2 
      00B48F CD 86 1F         [ 4]  978     CALL NRAT   ;  2 NR@ -- e 
      00B492 CD 8C 17         [ 4]  979     CALL ONEP   ; increment exponent 
      003415                        980     _DOLIT 2 
      00B495 CD 84 EF         [ 4]    1     CALL DOLIT 
      00B498 00 02                    2     .word 2 
      00B49A CD 86 3E         [ 4]  981     CALL NRSTO  ; e 2 NR! , update e on rstack     
      00341D                        982     _BRAN FSLASH1
      00B49D CD 85 34         [ 4]    1     CALL BRAN 
      00B4A0 B4 3C                    2     .word FSLASH1 
      00B4A2                        983 FSLASH8: ; remainder mantissa R: qs e divisor 
      00B4A2 CD A7 F4         [ 4]  984     CALL DSWAP  
      003425                        985     _DDROP  ; drop remainder     
      00B4A5 1C 00 04         [ 2]    1    ADDW X,#2*CELLL 
      00B4A8 CD A9 61         [ 4]  986     CALL DRFROM
      00342B                        987     _DDROP  ; drop divisor 
      00B4AB 1C 00 04         [ 2]    1    ADDW X,#2*CELLL 
      00B4AE CD 96 6A         [ 4]  988     CALL JFETCH    ; quotient sign 
      003431                        989     _QBRAN FSLASH9 
      00B4B1 CD 85 18         [ 4]    1     CALL QBRAN
      00B4B4 B4 B9                    2     .word FSLASH9
      00B4B6 CD 89 18         [ 4]  990     CALL DNEGA  
      00B4B9                        991 FSLASH9:
      00B4B9 CD 85 B4         [ 4]  992     CALL RFROM  ; exponent 
      00B4BC CD AD E5         [ 4]  993     CALL STEXP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 185.
Hexadecimal [24-Bits]



      00B4BF CD 85 B4         [ 4]  994     CALL RFROM 
      003442                        995     _DROP ; drop qs 
      00B4C2 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00B4C5 81               [ 4]  996     RET 
                                    997 
                                    998 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    999 ;   D>F  ( # -- f# )
                                   1000 ;   convert double to float 
                                   1001 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      003446                       1002     _HEADER DTOF,3,"D>F"
      00B4C6 B3 F7                    1         .word LINK 
                           003448     2         LINK=.
      00B4C8 03                       3         .byte 3  
      00B4C9 44 3E 46                 4         .ascii "D>F"
      00B4CC                          5         DTOF:
      00B4CC CD A6 E9         [ 4] 1003     CALL DSIGN 
      00B4CF CD 86 62         [ 4] 1004     CALL TOR
      00B4D2 CD A6 D8         [ 4] 1005     CALL DABS  
      00B4D5                       1006 DTOF1:      
      00B4D5 CD B2 83         [ 4] 1007     CALL SCALETOM 
      00B4D8 CD 85 B4         [ 4] 1008     CALL RFROM
      00345B                       1009     _QBRAN DTOF2 
      00B4DB CD 85 18         [ 4]    1     CALL QBRAN
      00B4DE B4 E3                    2     .word DTOF2
      00B4E0 CD 89 18         [ 4] 1010     CALL DNEGA 
      00B4E3                       1011 DTOF2: 
      00B4E3 CD 88 5D         [ 4] 1012     CALL ROT 
      00B4E6 CD AD E5         [ 4] 1013     CALL STEXP 
      00B4E9 81               [ 4] 1014     RET 
                                   1015 
                                   1016 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1017 ;   F>D  ( f# -- # )
                                   1018 ;  convert float to double 
                                   1019 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00346A                       1020     _HEADER FTOD,3,"F>D"
      00B4EA B4 C8                    1         .word LINK 
                           00346C     2         LINK=.
      00B4EC 03                       3         .byte 3  
      00B4ED 46 3E 44                 4         .ascii "F>D"
      00B4F0                          5         FTOD:
      00B4F0 CD AD B3         [ 4] 1021     CALL ATEXP ; m e 
      00B4F3 CD 88 4C         [ 4] 1022     CALL QDUP
      003476                       1023     _QBRAN FTOD9
      00B4F6 CD 85 18         [ 4]    1     CALL QBRAN
      00B4F9 B5 86                    2     .word FTOD9
      00B4FB CD 86 62         [ 4] 1024     CALL TOR 
      00B4FE CD A6 E9         [ 4] 1025     CALL DSIGN 
      00B501 CD 88 7C         [ 4] 1026     CALL NROT 
      00B504 CD A6 D8         [ 4] 1027     CALL DABS
      00B507 CD 85 B4         [ 4] 1028     CALL RFROM  
      00B50A CD 86 99         [ 4] 1029     CALL DUPP   
      00B50D CD 86 D0         [ 4] 1030     CALL ZLESS 
      003490                       1031     _QBRAN FTOD4 
      00B510 CD 85 18         [ 4]    1     CALL QBRAN
      00B513 B5 4E                    2     .word FTOD4
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 186.
Hexadecimal [24-Bits]



                                   1032 ; negative exponent 
      00B515 CD 89 6C         [ 4] 1033     CALL ABSS 
      00B518 CD 86 62         [ 4] 1034     CALL TOR
      00349B                       1035     _BRAN FTOD2  
      00B51B CD 85 34         [ 4]    1     CALL BRAN 
      00B51E B5 39                    2     .word FTOD2 
      00B520                       1036 FTOD1:
      00B520 CD 88 A7         [ 4] 1037     CALL DDUP 
      00B523 CD A8 C9         [ 4] 1038     CALL DZEQUAL 
      0034A6                       1039     _TBRAN FTOD3 
      00B526 CD 85 26         [ 4]    1     CALL TBRAN 
      00B529 B5 43                    2     .word FTOD3 
      0034AB                       1040     _DOLIT 10 
      00B52B CD 84 EF         [ 4]    1     CALL DOLIT 
      00B52E 00 0A                    2     .word 10 
      00B530 CD A7 03         [ 4] 1041     CALL DSLMOD 
      00B533 CD 88 5D         [ 4] 1042     CALL ROT 
      0034B6                       1043     _DROP
      00B536 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00B539                       1044 FTOD2:      
      0034B9                       1045     _DONXT FTOD1
      00B539 CD 85 03         [ 4]    1     CALL DONXT 
      00B53C B5 20                    2     .word FTOD1 
      0034BE                       1046     _BRAN FTOD8   
      00B53E CD 85 34         [ 4]    1     CALL BRAN 
      00B541 B5 7B                    2     .word FTOD8 
      00B543                       1047 FTOD3: 
      00B543 CD 85 B4         [ 4] 1048     CALL RFROM 
      0034C6                       1049     _DROP 
      00B546 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      0034C9                       1050     _BRAN FTOD8  
      00B549 CD 85 34         [ 4]    1     CALL BRAN 
      00B54C B5 7B                    2     .word FTOD8 
                                   1051 ; positive exponent 
      00B54E                       1052 FTOD4:
      00B54E CD 86 62         [ 4] 1053     CALL TOR 
      0034D1                       1054     _BRAN FTOD6
      00B551 CD 85 34         [ 4]    1     CALL BRAN 
      00B554 B5 76                    2     .word FTOD6 
      00B556                       1055 FTOD5:
      00B556 CD 88 A7         [ 4] 1056     CALL DDUP 
      0034D9                       1057     _DOLIT 0XCCCC
      00B559 CD 84 EF         [ 4]    1     CALL DOLIT 
      00B55C CC CC                    2     .word 0XCCCC 
      0034DE                       1058     _DOLIT 0XCCC  
      00B55E CD 84 EF         [ 4]    1     CALL DOLIT 
      00B561 0C CC                    2     .word 0XCCC 
      00B563 CD A9 06         [ 4] 1059     CALL DGREAT 
      0034E6                       1060     _TBRAN FTOD3 
      00B566 CD 85 26         [ 4]    1     CALL TBRAN 
      00B569 B5 43                    2     .word FTOD3 
      0034EB                       1061     _DOLIT 10 
      00B56B CD 84 EF         [ 4]    1     CALL DOLIT 
      00B56E 00 0A                    2     .word 10 
      00B570 CD 8C 83         [ 4] 1062     CALL ZERO 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 187.
Hexadecimal [24-Bits]



      00B573 CD AA B2         [ 4] 1063     CALL DSTAR 
      00B576                       1064 FTOD6: 
      0034F6                       1065     _DONXT FTOD5 
      00B576 CD 85 03         [ 4]    1     CALL DONXT 
      00B579 B5 56                    2     .word FTOD5 
      00B57B                       1066 FTOD8:
      00B57B CD 88 5D         [ 4] 1067     CALL ROT 
      0034FE                       1068     _QBRAN FTOD9 
      00B57E CD 85 18         [ 4]    1     CALL QBRAN
      00B581 B5 86                    2     .word FTOD9
      00B583 CD 89 18         [ 4] 1069     CALL DNEGA
      00B586                       1070 FTOD9:          
      00B586 81               [ 4] 1071     RET 
                                   1072 
                                   1073 
                                   1074 ;;;;;;;;;;;;;;;;;;;;;;;;
                                   1075 ;   F0< ( f# -- f )
                                   1076 ;   true if f#<0
                                   1077 ;;;;;;;;;;;;;;;;;;;;;;;;
      003507                       1078     _HEADER FZLESS,3,"F0<"
      00B587 B4 EC                    1         .word LINK 
                           003509     2         LINK=.
      00B589 03                       3         .byte 3  
      00B58A 46 30 3C                 4         .ascii "F0<"
      00B58D                          5         FZLESS:
      00B58D CD AD B3         [ 4] 1079     CALL ATEXP 
      003510                       1080     _DROP 
      00B590 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00B593 CD 86 A9         [ 4] 1081     CALL SWAPP 
      003516                       1082     _DROP 
      00B596 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00B599 CD 86 D0         [ 4] 1083     CALL ZLESS 
      00B59C 81               [ 4] 1084     RET
                                   1085 
                                   1086 ;;;;;;;;;;;;;;;;;;;;;;;;
                                   1087 ;   F< ( f#1 f#2 -- f )
                                   1088 ; true if f#1 < f#1 
                                   1089 ;;;;;;;;;;;;;;;;;;;;;;;
      00351D                       1090     _HEADER FLESS,2,"F<"
      00B59D B5 89                    1         .word LINK 
                           00351F     2         LINK=.
      00B59F 02                       3         .byte 2  
      00B5A0 46 3C                    4         .ascii "F<"
      00B5A2                          5         FLESS:
      00B5A2 CD B2 40         [ 4] 1091     CALL FSUB  
      00B5A5 CC B5 8D         [ 2] 1092     JP FZLESS
                                   1093 
                                   1094 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1095 ;   F> ( f#1 f#2 -- f )
                                   1096 ;   true fi f#1>f#2
                                   1097 ;;;;;;;;;;;;;;;;;;;;;;;;;
      003528                       1098     _HEADER FGREAT,2,"F>"
      00B5A8 B5 9F                    1         .word LINK 
                           00352A     2         LINK=.
      00B5AA 02                       3         .byte 2  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 188.
Hexadecimal [24-Bits]



      00B5AB 46 3E                    4         .ascii "F>"
      00B5AD                          5         FGREAT:
      00B5AD CD A7 F4         [ 4] 1099     CALL DSWAP 
      00B5B0 CC B5 A2         [ 2] 1100     JP FLESS 
                                   1101 
                                   1102 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1103 ;   F= ( f#1 f#2 -- f ) 
                                   1104 ;   true fi f#1==f#2 
                                   1105 ;;;;;;;;;;;;;;;;;;;;;;;;;
      003533                       1106     _HEADER FEQUAL,2,"F="
      00B5B3 B5 AA                    1         .word LINK 
                           003535     2         LINK=.
      00B5B5 02                       3         .byte 2  
      00B5B6 46 3D                    4         .ascii "F="
      00B5B8                          5         FEQUAL:
      00B5B8 CC A8 E5         [ 2] 1107     JP DEQUAL 
                                   1108 
                                   1109 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1110 ;   F0= ( f# -- f )
                                   1111 ;   true if f# is 0.0 
                                   1112 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      00353B                       1113     _HEADER FZEQUAL,3,"F0="
      00B5BB B5 B5                    1         .word LINK 
                           00353D     2         LINK=.
      00B5BD 03                       3         .byte 3  
      00B5BE 46 30 3D                 4         .ascii "F0="
      00B5C1                          5         FZEQUAL:
      00B5C1 CD AD B3         [ 4] 1114     CALL ATEXP 
      003544                       1115     _DROP 
      00B5C4 1C 00 02         [ 2]    1     ADDW X,#CELLL  
      00B5C7 CC A8 C9         [ 2] 1116     JP DZEQUAL  
                                   1117 
                                   1118 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1119 ;  FNEGATE ( f#1 -- f#2 )
                                   1120 ;  f#2 is negation of f#1 
                                   1121 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      00354A                       1122     _HEADER FNEGA,7,"FNEGATE"
      00B5CA B5 BD                    1         .word LINK 
                           00354C     2         LINK=.
      00B5CC 07                       3         .byte 7  
      00B5CD 46 4E 45 47 41 54 45     4         .ascii "FNEGATE"
      00B5D4                          5         FNEGA:
      00B5D4 CD AD B3         [ 4] 1123     CALL ATEXP 
      00B5D7 CD 86 62         [ 4] 1124     CALL TOR 
      00B5DA CD 89 18         [ 4] 1125     CALL DNEGA
      00B5DD CD 85 B4         [ 4] 1126     CALL RFROM 
      00B5E0 CD AD E5         [ 4] 1127     CALL STEXP 
      00B5E3 CD AD 66         [ 4] 1128     CALL SFN 
      00B5E6 81               [ 4] 1129     RET 
                                   1130 
                                   1131 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1132 ;  FABS ( f#1 -- abs(f#1) )
                                   1133 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      003567                       1134     _HEADER FABS,4,"FABS"
      00B5E7 B5 CC                    1         .word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 189.
Hexadecimal [24-Bits]



                           003569     2         LINK=.
      00B5E9 04                       3         .byte 4  
      00B5EA 46 41 42 53              4         .ascii "FABS"
      00B5EE                          5         FABS:
      00B5EE CD AD B3         [ 4] 1135     CALL ATEXP 
      00B5F1 CD 86 62         [ 4] 1136     CALL TOR 
      00B5F4 CD 86 99         [ 4] 1137     CALL DUPP 
      003577                       1138     _DOLIT 0X80 
      00B5F7 CD 84 EF         [ 4]    1     CALL DOLIT 
      00B5FA 00 80                    2     .word 0X80 
      00B5FC CD 86 F6         [ 4] 1139     CALL ANDD 
      00357F                       1140     _QBRAN FABS1
      00B5FF CD 85 18         [ 4]    1     CALL QBRAN
      00B602 B6 07                    2     .word FABS1
      00B604 CD 89 18         [ 4] 1141     CALL DNEGA 
      00B607                       1142 FABS1: 
      00B607 CD 85 B4         [ 4] 1143     CALL RFROM 
      00B60A CD AD E5         [ 4] 1144     CALL STEXP 
      00B60D CD AD 66         [ 4] 1145     CALL SFN 
      00B610 81               [ 4] 1146     RET 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 190.
Hexadecimal [24-Bits]



                                   4601 .endif 
                                   4602 
                                   4603 ;===============================================================
                                   4604 
                           003569  4605 LASTN =	LINK   ;last name defined
                                   4606 
                                   4607 ; application code begin here
      00B680                       4608 	.bndry 128 ; align on flash block  
      00B680                       4609 app_space: 
                                   4610 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 191.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   6 AB1        0008F5 R   |   6 ABOR1      0013FC R
  6 ABOR2      001413 R   |   6 ABORQ      0013F4 R   |   6 ABORT      0013E5 R
  6 ABRTQ      0016D6 R   |   6 ABSS       0008EC R   |   6 ACCEP      00137B R
  6 ACCP1      001384 R   |   6 ACCP2      0013AA R   |   6 ACCP3      0013AD R
  6 ACCP4      0013AF R   |     ADC_CR1 =  005401     |     ADC_CR1_=  000000 
    ADC_CR1_=  000001     |     ADC_CR1_=  000004     |     ADC_CR1_=  000005 
    ADC_CR1_=  000006     |     ADC_CR2 =  005402     |     ADC_CR2_=  000003 
    ADC_CR2_=  000004     |     ADC_CR2_=  000005     |     ADC_CR2_=  000006 
    ADC_CR2_=  000001     |     ADC_CR3 =  005403     |     ADC_CR3_=  000007 
    ADC_CR3_=  000006     |     ADC_CSR =  005400     |     ADC_CSR_=  000006 
    ADC_CSR_=  000004     |     ADC_CSR_=  000000     |     ADC_CSR_=  000001 
    ADC_CSR_=  000002     |     ADC_CSR_=  000003     |     ADC_CSR_=  000007 
    ADC_CSR_=  000005     |     ADC_DRH =  005404     |     ADC_DRL =  005405 
    ADC_TDRH=  005406     |     ADC_TDRL=  005407     |   6 ADRADJ     0007BC R
    AFR     =  004803     |     AFR0_ADC=  000000     |     AFR1_TIM=  000001 
    AFR2_CCO=  000002     |     AFR3_TIM=  000003     |     AFR4_TIM=  000004 
    AFR5_TIM=  000005     |     AFR6_I2C=  000006     |     AFR7_BEE=  000007 
  6 AFT        0016C1 R   |   6 AGAIN      001617 R   |   6 AHEAD      001674 R
  6 ALLOT      001524 R   |   6 ANDD       000676 R   |     APP_CP  =  004004 
    APP_LAST=  004000     |     APP_RUN =  004002     |     APP_VP  =  004006 
  6 AT         0004E3 R   |   6 ATEXE      000D13 R   |   6 ATEXP      002D33 R
  6 ATEXP1     002D48 R   |   6 ATEXP2     002D58 R   |   6 AUTORUN    000129 R
    AWU_APR =  0050F1     |     AWU_CSR =  0050F0     |     AWU_TBR =  0050F2 
    B0_MASK =  000001     |     B115200 =  000006     |   6 B115K2     0003E0 R
    B19200  =  000003     |   6 B19K2      0003BD R   |     B1_MASK =  000002 
    B230400 =  000007     |     B2400   =  000000     |   6 B2K4       00038E R
    B2_MASK =  000004     |     B38400  =  000004     |     B3_MASK =  000008 
    B460800 =  000008     |     B4800   =  000001     |   6 B4K8       00039C R
    B4_MASK =  000010     |     B57600  =  000005     |   6 B57K6      0003CE R
    B5_MASK =  000020     |     B6_MASK =  000040     |     B7_MASK =  000080 
    B921600 =  000009     |     B9600   =  000002     |   6 B9K6       0003AC R
  6 BACK1      001323 R   |   6 BASE       0006DF R   |     BASEE   =  00000A 
  6 BAUD       0003F0 R   |     BCNT    =  000001     |   6 BCOMP      001567 R
  6 BDIGS      000E0B R   |     BEEP_BIT=  000004     |     BEEP_CSR=  0050F3 
    BEEP_MAS=  000010     |     BEEP_POR=  00000F     |   6 BEGIN      0015F9 R
    BIT0    =  000000     |     BIT1    =  000001     |     BIT2    =  000002 
    BIT3    =  000003     |     BIT4    =  000004     |     BIT5    =  000005 
    BIT6    =  000006     |     BIT7    =  000007     |   6 BKSLA      001178 R
  6 BKSP       0012F3 R   |     BKSPP   =  000008     |   6 BLANK      000BF6 R
    BLOCK_SI=  000080     |     BOOT_ROM=  006000     |     BOOT_ROM=  007FFF 
  6 BRAN       0004B4 R   |     BTW     =  000001     |   6 BUF2ROW    0021A7 R
  6 BYE        0000B6 R   |     CADR    =  000003     |     CALLL   =  0000CD 
  6 CALLOT     0023F0 R   |     CAN_DGR =  005426     |     CAN_FPSR=  005427 
    CAN_IER =  005425     |     CAN_MCR =  005420     |     CAN_MSR =  005421 
    CAN_P0  =  005428     |     CAN_P1  =  005429     |     CAN_P2  =  00542A 
    CAN_P3  =  00542B     |     CAN_P4  =  00542C     |     CAN_P5  =  00542D 
    CAN_P6  =  00542E     |     CAN_P7  =  00542F     |     CAN_P8  =  005430 
    CAN_P9  =  005431     |     CAN_PA  =  005432     |     CAN_PB  =  005433 
    CAN_PC  =  005434     |     CAN_PD  =  005435     |     CAN_PE  =  005436 
    CAN_PF  =  005437     |     CAN_RFR =  005424     |     CAN_TPR =  005423 
    CAN_TSR =  005422     |     CARRY   =  00002A     |     CASE_SEN=  000000 
  6 CAT        000501 R   |   6 CCOMMA     001549 R   |     CC_C    =  000000 
    CC_H    =  000004     |     CC_I0   =  000003     |     CC_I1   =  000005 
    CC_N    =  000002     |     CC_V    =  000007     |     CC_Z    =  000001 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 192.
Hexadecimal [24-Bits]

Symbol Table

    CELLL   =  000002     |   6 CELLM      000B7B R   |   6 CELLP      000B6C R
  6 CELLS      000B8A R   |     CFG_GCR =  007F60     |     CFG_GCR_=  000001 
    CFG_GCR_=  000000     |   6 CHAR1      000F61 R   |   6 CHAR2      000F64 R
  6 CHKIVEC    002095 R   |     CLKOPT  =  004807     |     CLKOPT_C=  000002 
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
    CLK_SWR_=  0000D2     |   6 CMOV1      000D46 R   |   6 CMOV2      000D5A R
  6 CMOV3      000D6E R   |   6 CMOVE      000D2A R   |     CNT     =  000001 
    CNTDWN  =  000032     |   6 CNTXT      000762 R   |   6 COLD       001B96 R
  6 COLD1      001B96 R   |   6 COLON      001879 R   |   6 COMMA      001532 R
  6 COMPI      001577 R   |     COMPO   =  000040     |   6 CONSTANT   001923 R
  6 COPYRIGH   001ADF R   |   6 COUNT      000CC6 R   |   6 CPP        00077E R
    CPU_A   =  007F00     |     CPU_CCR =  007F0A     |     CPU_PCE =  007F01 
    CPU_PCH =  007F02     |     CPU_PCL =  007F03     |     CPU_SPH =  007F08 
    CPU_SPL =  007F09     |     CPU_XH  =  007F04     |     CPU_XL  =  007F05 
    CPU_YH  =  007F06     |     CPU_YL  =  007F07     |   6 CR         000F89 R
  6 CREAT      0018BF R   |     CRR     =  00000D     |   6 CSTOR      0004F0 R
  6 CTABLE     002411 R   |   6 CTAT       002432 R   |   6 CTINIT     00245A R
  6 D2SLASH    0029A3 R   |   6 D2STAR     0029BA R   |   6 DABS       002658 R
  6 DABS1      002660 R   |   6 DAT        000CAA R   |     DATSTK  =  001680 
  6 DBLVER     0024DE R   |   6 DCLZ       0027A2 R   |   6 DCLZ1      0027AB R
  6 DCLZ4      0027B4 R   |   6 DCLZ8      0027C1 R   |   6 DCONST     001958 R
  6 DDIG       0026C4 R   |   6 DDIGS      0026DD R   |   6 DDOT       0026F4 R
  6 DDOT0      002708 R   |   6 DDOT1      00271E R   |   6 DDROP      00081C R
  6 DDSLMOD    002B47 R   |   6 DDSTAR3    002A8B R   |   6 DDUP       000827 R
    DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF     |   6 DECIM      000EBB R
  6 DEPTH      000C45 R   |   6 DEQU4      00287A R   |   6 DEQUAL     002865 R
    DEVID_BA=  0048CD     |     DEVID_EN=  0048D8     |     DEVID_LO=  0048D2 
    DEVID_LO=  0048D3     |     DEVID_LO=  0048D4     |     DEVID_LO=  0048D5 
    DEVID_LO=  0048D6     |     DEVID_LO=  0048D7     |     DEVID_LO=  0048D8 
    DEVID_WA=  0048D1     |     DEVID_XH=  0048CE     |     DEVID_XL=  0048CD 
    DEVID_YH=  0048D0     |     DEVID_YL=  0048CF     |   6 DGREAT     002886 R
  6 DGTQ1      000F00 R   |   6 DI         0000C4 R   |   6 DIG        000E34 R
  6 DIGIT      000DCF R   |   6 DIGS       000E45 R   |   6 DIGS1      000E45 R
  6 DIGS2      000E52 R   |   6 DIGTQ      000ECF R   |     DISCOVER=  000000 
  6 DLESS      002891 R   |   6 DLESS4     0028A5 R   |   6 DLITER     002963 R
  6 DLSHIFT    0029D6 R   |   6 DLSHIFT1   0029E9 R   |   6 DLSHIFT2   0029FE R
    DM_BK1RE=  007F90     |     DM_BK1RH=  007F91     |     DM_BK1RL=  007F92 
    DM_BK2RE=  007F93     |     DM_BK2RH=  007F94     |     DM_BK2RL=  007F95 
    DM_CR1  =  007F96     |     DM_CR2  =  007F97     |     DM_CSR1 =  007F98 
    DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A     |   6 DN1        0008B3 R
  6 DNEGA      000898 R   |   6 DOCONST    001943 R   |   6 DOLIT      00046F R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 193.
Hexadecimal [24-Bits]

Symbol Table

  6 DONXT      000483 R   |     DOORBELL=  000000     |   6 DOSTR      000F99 R
  6 DOT        001030 R   |   6 DOT1       001046 R   |   6 DOTI1      001AA8 R
  6 DOTID      001A92 R   |   6 DOTO1      001488 R   |   6 DOTOK      00146E R
  6 DOTPR      001159 R   |   6 DOTQ       0016F0 R   |   6 DOTQP      000FB6 R
  6 DOTR       000FC4 R   |   6 DOTS       001A34 R   |   6 DOTS1      001A3F R
  6 DOTS2      001A48 R   |   6 DOVAR      0006CF R   |   6 DOVER      00298A R
  6 DO_DCONS   00197B R   |     DP      =  000005     |   6 DPLUS      002B86 R
  6 DPLUS1     002BAD R   |   6 DRAT       0028F9 R   |   6 DRFROM     0028E1 R
  6 DROP       00060F R   |   6 DROT       00280E R   |   6 DRSHIFT    002A0F R
  6 DRSHIFT1   002A16 R   |   6 DRSHIFT2   002A2C R   |   6 DSIGN      002669 R
  6 DSIGN1     002673 R   |   6 DSLA9      002B71 R   |   6 DSLASH     002B77 R
  6 DSLMOD     002683 R   |   6 DSLMOD3    00269E R   |   6 DSLMOD4    0026AA R
  6 DSLMODa    0026A5 R   |   6 DSLMODb    0026B0 R   |   6 DSSTAR     00274E R
  6 DSSTAR3    00276B R   |   6 DSTAR      002A32 R   |   6 DSTOR      000C91 R
  6 DSUB       002BB8 R   |   6 DSUB1      002BDF R   |   6 DSWAP      002774 R
  6 DTOF       00344C R   |   6 DTOF1      003455 R   |   6 DTOF2      003463 R
  6 DTOR       0028C3 R   |   6 DUMP       0019EA R   |   6 DUMP1      001A01 R
  6 DUMP3      001A23 R   |   6 DUMPP      0019B9 R   |   6 DUPP       000619 R
  6 DVARIA     002917 R   |     DVER_MAJ=  000001     |     DVER_MIN=  000000 
  6 DZEQUAL    002849 R   |   6 DZLESS     0028AC R   |   6 DZLESS1    0028B6 R
  6 EDIGS      000E70 R   |   6 EDOT       002DB9 R   |   6 EDOT0      002DD0 R
  6 EDOT2      002DDC R   |   6 EDOT3      002DF5 R   |   6 EDOT4      002E21 R
  6 EDOT5      002E40 R   |   6 EECSTORE   001E46 R   |   6 EEPCP      001C6C R
  6 EEPLAST    001C3F R   |   6 EEPROM     001C27 R   |     EEPROM_B=  004000 
    EEPROM_E=  0047FF     |     EEPROM_R=  000010     |     EEPROM_S=  000800 
  6 EEPRUN     001C56 R   |   6 EEPVP      001C82 R   |   6 EESTORE    001E92 R
  6 EE_CCOMM   00215C R   |   6 EE_COMMA   00213B R   |   6 EE_CREAD   001DD7 R
  6 EE_READ    001DB5 R   |   6 EI         0000BD R   |   6 ELSEE      00164F R
  6 EMIT       000436 R   |   6 ENEPER     00237C R   |     EOL_CR  =  000001 
    EOL_LF  =  000000     |   6 EQ1        000907 R   |   6 EQUAL      0008FA R
  6 ERASE      000D9D R   |     ERR     =  00001B     |   6 EVAL       0014B1 R
  6 EVAL1      0014B1 R   |   6 EVAL2      0014CD R   |   6 EXE1       000D21 R
  6 EXECU      0004C4 R   |     EXT     =  000000     |     EXTI_CR1=  0050A0 
    EXTI_CR2=  0050A1     |   6 EXTRC      000DF7 R   |   6 FABS       00356E R
  6 FABS1      003587 R   |   6 FADDR      002229 R   |   6 FALGN4     00311E R
  6 FALGN6     00312D R   |   6 FALGN7     003154 R   |   6 FALGN71    003163 R
  6 FALGN72    00317F R   |   6 FALGN8     003182 R   |   6 FALIGN     0030E5 R
  6 FALSE      000868 R   |   6 FARAT      001CED R   |   6 FARCAT     001CF9 R
  6 FC_XOFF    000463 R   |   6 FC_XON     00044D R   |   6 FDOT       002E4F R
  6 FDOT0      002E8D R   |   6 FDOT1      002E7C R   |   6 FDOT10     002EE9 R
  6 FDOT2      002E9B R   |   6 FDOT3      002EB4 R   |   6 FDOT6      002EC4 R
  6 FDOT7      002EC9 R   |   6 FDOT8      002ED1 R   |   6 FDOT9      002ED9 R
  6 FEQUAL     003538 R   |   6 FER        002C51 R   |   6 FGREAT     00352D R
    FHSE    =  7A1200     |     FHSI    =  F42400     |   6 FILL       000D7D R
  6 FILL0      000D8B R   |   6 FILL1      000D93 R   |   6 FIND       00124F R
  6 FIND1      00126D R   |   6 FIND2      00129B R   |   6 FIND3      0012A7 R
  6 FIND4      0012BB R   |   6 FIND5      0012C8 R   |   6 FIND6      0012AC R
  6 FINIT      002C47 R   |     FLASH_BA=  008000     |     FLASH_CR=  00505A 
    FLASH_CR=  000002     |     FLASH_CR=  000000     |     FLASH_CR=  000003 
    FLASH_CR=  000001     |     FLASH_CR=  00505B     |     FLASH_CR=  000005 
    FLASH_CR=  000004     |     FLASH_CR=  000007     |     FLASH_CR=  000000 
    FLASH_CR=  000006     |     FLASH_DU=  005064     |     FLASH_DU=  0000AE 
    FLASH_DU=  000056     |     FLASH_EN=  027FFF     |     FLASH_FP=  00505D 
    FLASH_FP=  000000     |     FLASH_FP=  000001     |     FLASH_FP=  000002 
    FLASH_FP=  000003     |     FLASH_FP=  000004     |     FLASH_FP=  000005 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 194.
Hexadecimal [24-Bits]

Symbol Table

    FLASH_IA=  00505F     |     FLASH_IA=  000003     |     FLASH_IA=  000002 
    FLASH_IA=  000006     |     FLASH_IA=  000001     |     FLASH_IA=  000000 
    FLASH_NC=  00505C     |     FLASH_NF=  00505E     |     FLASH_NF=  000000 
    FLASH_NF=  000001     |     FLASH_NF=  000002     |     FLASH_NF=  000003 
    FLASH_NF=  000004     |     FLASH_NF=  000005     |     FLASH_PU=  005062 
    FLASH_PU=  000056     |     FLASH_PU=  0000AE     |     FLASH_SI=  020000 
    FLASH_WS=  00480D     |   6 FLESS      003522 R   |   6 FLOATQ     002F61 R
  6 FLOATQ0    002F6B R   |   6 FLOATQ1    002FD0 R   |   6 FLOATQ2    002FD9 R
  6 FLOATQ3    002FE1 R   |   6 FLOATQ4    002FF5 R   |   6 FLOAT_ER   003010 R
  6 FLOAT_ER   00300D R   |     FLOAT_MA=  000001     |     FLOAT_MI=  000000 
    FLSI    =  01F400     |   6 FMOVE      002234 R   |   6 FMOVE2     002265 R
  6 FNE        002C74 R   |   6 FNEGA      003554 R   |   6 FOR        0015C1 R
  6 FORGET     00015A R   |   6 FORGET1    000189 R   |   6 FORGET2    00020F R
  6 FORGET4    000218 R   |   6 FORGET6    0001D1 R   |   6 FOV        002C8F R
  6 FPLUS      00318E R   |   6 FPLUS1     0031AE R   |   6 FPSTOR     001C08 R
  6 FPSW       002C23 R   |     FPTR    =  000034     |   6 FREEVAR    000225 R
  6 FREEVAR4   00025B R   |   6 FRESET     002C35 R   |   6 FSLASH     00337A R
  6 FSLASH1    0033BC R   |   6 FSLASH8    003422 R   |   6 FSLASH9    003439 R
  6 FSTAR      003353 R   |   6 FSUB       0031C0 R   |   6 FSUB1      0031E0 R
  6 FTOD       003470 R   |   6 FTOD1      0034A0 R   |   6 FTOD2      0034B9 R
  6 FTOD3      0034C3 R   |   6 FTOD4      0034CE R   |   6 FTOD5      0034D6 R
  6 FTOD6      0034F6 R   |   6 FTOD8      0034FB R   |   6 FTOD9      003506 R
  6 FVER       002BF1 R   |   6 FZE        002C5E R   |   6 FZEQUAL    003541 R
  6 FZLESS     00350D R   |     GPIO_BAS=  005000     |     GPIO_CR1=  000003 
    GPIO_CR2=  000004     |     GPIO_DDR=  000002     |     GPIO_IDR=  000001 
    GPIO_ODR=  000000     |     GPIO_SIZ=  000005     |   6 GREAT      000953 R
  6 GREAT1     00095E R   |   6 HDOT       001013 R   |   6 HERE       000CDD R
  6 HEX        000EA6 R   |   6 HI         001B4B R   |   6 HLD        00074F R
  6 HOLD       000E1B R   |     HSECNT  =  004809     |     I2C_CCRH=  00521C 
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
    I2C_SR2_=  000000     |     I2C_SR2_=  000003     |     I2C_SR2_=  000005 
    I2C_SR3 =  005219     |     I2C_SR3_=  000001     |     I2C_SR3_=  000007 
    I2C_SR3_=  000004     |     I2C_SR3_=  000000     |     I2C_SR3_=  000002 
    I2C_TRIS=  00521D     |     I2C_TRIS=  000005     |     I2C_TRIS=  000005 
    I2C_TRIS=  000005     |     I2C_TRIS=  000011     |     I2C_TRIS=  000011 
    I2C_TRIS=  000011     |     I2C_WRIT=  000000     |   6 ICOLON     00188A R
  6 IFETCH     0015DF R   |   6 IFF        001627 R   |   6 IFMOVE     00230D R
    IMEDD   =  000080     |   6 IMMED      00189C R   |   6 INCH       00042A R
  6 INC_FPTR   001D82 R   |   6 INITOFS    001852 R   |   6 INN        0006FD R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 195.
Hexadecimal [24-Bits]

Symbol Table

    INPUT_DI=  000000     |     INPUT_EI=  000001     |     INPUT_FL=  000000 
    INPUT_PU=  000001     |   6 INTE1      001450 R   |   6 INTER      001426 R
  6 INTQ       0024B6 R   |     INT_ADC2=  000016     |     INT_AUAR=  000012 
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
    INT_VECT=  00805C     |     INT_VECT=  008058     |   6 INVER      000875 R
    IPR0    =  000002     |     IPR1    =  000001     |     IPR2    =  000000 
    IPR3    =  000003     |     IPR_MASK=  000003     |     IRET_COD=  000080 
  6 ISEMI      0017E7 R   |     ITC_SPR1=  007F70     |     ITC_SPR2=  007F71 
    ITC_SPR3=  007F72     |     ITC_SPR4=  007F73     |     ITC_SPR5=  007F74 
    ITC_SPR6=  007F75     |     ITC_SPR7=  007F76     |     ITC_SPR8=  007F77 
    IWDG_KR =  0050E0     |     IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2 
  6 JFETCH     0015EA R   |   6 JSRC       00183C R   |   6 KEY        000F0F R
  6 KTAP       001340 R   |   6 KTAP1      001363 R   |   6 KTAP2      001366 R
  6 LAST       00078E R   |   6 LASTN   =  003569 R   |   6 LBRAC      00145D R
    LED2_BIT=  000005     |     LED2_MAS=  000020     |     LED2_POR=  00500A 
  6 LESS       000926 R   |     LF      =  00000A     |   6 LINK    =  003569 R
  6 LITER      001599 R   |   6 LN2S       0023D8 R   |   6 LOCAL      000554 R
  6 LOCK       001D6E R   |   6 LOG2S      0023C2 R   |   6 LSCALE     00302F R
  6 LSHIFT     000BB5 R   |   6 LSHIFT1    000BBE R   |   6 LSHIFT4    000BC6 R
  6 LT1        000931 R   |     MASKK   =  001F7F     |   6 MAX        00096B R
  6 MAX1       000975 R   |     MAX_MANT=  7FFFFF     |   6 MIN        00097F R
  6 MIN1       000989 R   |   6 MMOD1      000A38 R   |   6 MMOD2      000A4C R
  6 MMOD3      000A63 R   |   6 MMSM0      0009C8 R   |   6 MMSM1      0009D8 R
  6 MMSM3      0009DC R   |   6 MMSM4      0009E8 R   |   6 MMSMa      0009E3 R
  6 MMSMb      0009EE R   |   6 MMSTA1     003281 R   |   6 MMSTA2     00328C R
  6 MMSTA3     003297 R   |   6 MMSTA4     003302 R   |   6 MMSTA5     003314 R
  6 MMSTA6     00332D R   |   6 MMSTA7     00334A R   |   6 MMSTAR     003276 R
  6 MODD       000AB3 R   |   6 MONE       000C1C R   |     MS      =  000030 
  6 MSEC       0002D0 R   |   6 MSMOD      000A1B R   |   6 MSTA1      000B44 R
  6 MSTAR      000B21 R   |     NAFR    =  004804     |   6 NAMEQ      0012E8 R
  6 NAMET      0011F9 R   |     NCLKOPT =  004808     |   6 NDROT      0027D2 R
  6 NEGAT      000886 R   |   6 NEG_SIGN   002521 R   |   6 NEX1       000490 R
  6 NEXT       0015D0 R   |     NFLASH_W=  00480E     |     NHSECNT =  00480A 
    NOPT1   =  004802     |     NOPT2   =  004804     |     NOPT3   =  004806 
    NOPT4   =  004808     |     NOPT5   =  00480A     |     NOPT6   =  00480C 
    NOPT7   =  00480E     |     NOPTBL  =  00487F     |   6 NRAT       00059F R
  6 NRDROP     00057B R   |   6 NROT       0007FC R   |   6 NRSTO      0005BE R
  6 NTIB       00070D R   |     NUBC    =  004802     |     NUCLEO  =  000001 
  6 NUFQ       000F25 R   |   6 NUFQ1      000F3E R   |   6 NUMBQ      002590 R
  6 NUMQ0      0025D1 R   |   6 NUMQ1      0025F3 R   |   6 NUMQ3      00261D R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 196.
Hexadecimal [24-Bits]

Symbol Table

  6 NUMQ4      00263E R   |   6 NUMQ8      002647 R   |     NWDGOPT =  004806 
    NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF 
    NWDGOPT_=  FFFFFFFE     |   6 NonHandl   000000 R   |   6 OFFSET     0007B3 R
    OFS     =  000005     |   6 ONE        000C0E R   |   6 ONEM       000BA4 R
  6 ONEP       000B97 R   |     OPT     =  000002     |     OPT0    =  004800 
    OPT1    =  004801     |     OPT2    =  004803     |     OPT3    =  004805 
    OPT4    =  004807     |     OPT5    =  004809     |     OPT6    =  00480B 
    OPT7    =  00480D     |     OPTBL   =  00487E     |     OPTIMIZE=  000001 
    OPTION_B=  004800     |     OPTION_E=  00487F     |     OPTION_S=  000080 
  6 ORIG       000049 R   |   6 ORR        00068A R   |   6 OUTPUT     00043B R
    OUTPUT_F=  000001     |     OUTPUT_O=  000000     |     OUTPUT_P=  000001 
    OUTPUT_S=  000000     |   6 OVER       000641 R   |   6 OVERT      0017B5 R
    PA      =  000000     |   6 PACKS      000DAE R   |   6 PAD        000CEE R
  6 PAREN      001168 R   |   6 PARS       001061 R   |   6 PARS1      00108C R
  6 PARS2      0010B7 R   |   6 PARS3      0010BA R   |   6 PARS4      0010C3 R
  6 PARS5      0010E6 R   |   6 PARS6      0010FB R   |   6 PARS7      00110A R
  6 PARS8      001119 R   |   6 PARSE      00112A R   |   6 PARSEXP_   002F44 R
  6 PAUSE      0002E0 R   |     PA_BASE =  005000     |     PA_CR1  =  005003 
    PA_CR2  =  005004     |     PA_DDR  =  005002     |     PA_IDR  =  005001 
    PA_ODR  =  005000     |     PB      =  000005     |     PB_BASE =  005005 
    PB_CR1  =  005008     |     PB_CR2  =  005009     |     PB_DDR  =  005007 
    PB_IDR  =  005006     |     PB_ODR  =  005005     |     PC      =  00000A 
    PC_BASE =  00500A     |     PC_CR1  =  00500D     |     PC_CR2  =  00500E 
    PC_DDR  =  00500C     |     PC_IDR  =  00500B     |     PC_ODR  =  00500A 
    PD      =  00000F     |   6 PDUM1      0019CC R   |   6 PDUM2      0019DD R
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
    PH_ODR  =  005023     |     PI      =  000028     |   6 PICK       000C5C R
  6 PII        00233B R   |     PI_BASE =  005028     |     PI_CR1  =  00502B 
    PI_CR2  =  00502C     |     PI_DDR  =  00502A     |     PI_IDR  =  005029 
    PI_ODR  =  005028     |   6 PLUS       00083C R   |   6 PNAM1      00175A R
  6 PRESE      0014DC R   |   6 PRINT_VE   001B1B R   |     PROD1   =  000024 
    PROD2   =  000026     |     PROD3   =  000028     |   6 PROTECTE   000201 R
  6 PRT_LICE   001B07 R   |   6 PSTOR      000C73 R   |     PTR16   =  000035 
    PTR8    =  000036     |   6 PTRPLUS    001D9A R   |   6 QBRAN      000498 R
  6 QDUP       0007CC R   |   6 QDUP1      0007D6 R   |   6 QKEY       000418 R
  6 QSTAC      001494 R   |   6 QUERY      0013C0 R   |   6 QUEST      001053 R
  6 QUIT       0014F9 R   |   6 QUIT1      001501 R   |   6 QUIT2      001504 R
  6 RAM2EE     0021D5 R   |     RAMBASE =  000000     |   6 RAMLAST    0007A1 R
    RAM_BASE=  000000     |     RAM_END =  0017FF     |     RAM_SIZE=  001800 
  6 RANDOM     00027E R   |   6 RAT        000545 R   |   6 RBRAC      001829 R
  6 REPEA      0016A4 R   |   6 RFREE      0021BC R   |   6 RFROM      000534 R
    ROP     =  004800     |   6 ROT        0007DD R   |   6 ROW2BUF    00217E R
    ROWBUFF =  001680     |     RP0     =  00002E     |   6 RPAT       000511 R
    RPP     =  0017FF     |   6 RPSTO      00051E R   |   6 RSCALE     003053 R
  6 RSHIFT     000BD1 R   |   6 RSHIFT1    000BDA R   |   6 RSHIFT4    000BE2 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 197.
Hexadecimal [24-Bits]

Symbol Table

    RST_SR  =  0050B3     |   6 RT12_2     0023AB R   |   6 SAME1      001217 R
  6 SAME2      001240 R   |   6 SAMEQ      00120F R   |   6 SCAL1      003209 R
  6 SCAL2      00322D R   |   6 SCALDN2    0030D7 R   |   6 SCALDN3    0030DA R
  6 SCALEDOW   0030AB R   |   6 SCALETOM   003203 R   |   6 SCALEUP    003074 R
  6 SCALEUP2   0030A7 R   |   6 SCALEUP3   0030AA R   |   6 SCOM1      00178F R
  6 SCOM2      001792 R   |   6 SCOMP      001771 R   |   6 SEED       000265 R
    SEEDX   =  000038     |     SEEDY   =  00003A     |   6 SEMIS      0017C5 R
  6 SETISP     0000D0 R   |   6 SET_RAML   00190C R   |   6 SFN        002CE6 R
    SFR_BASE=  005000     |     SFR_END =  0057FF     |   6 SFV        002D1A R
  6 SFZ        002CAF R   |   6 SIGN       000E5A R   |   6 SIGN1      000E6A R
  6 SLASH      000ABD R   |   6 SLMOD      000A6B R   |   6 SLMOD1     000A9D R
  6 SLMOD8     000AAA R   |   6 SNAME      001724 R   |     SP0     =  00002C 
  6 SPACE      000F47 R   |   6 SPACS      000F56 R   |   6 SPAT       0005F9 R
    SPI_CR1 =  005200     |     SPI_CR2 =  005201     |     SPI_CRCP=  005205 
    SPI_DR  =  005204     |     SPI_ICR =  005202     |     SPI_RXCR=  005206 
    SPI_SR  =  005203     |     SPI_TXCR=  005207     |     SPP     =  001680 
    SPSAVE  =  000001     |   6 SPSTO      000606 R   |   6 SQRT10     002394 R
  6 SQRT2      002352 R   |   6 SQRT3      002369 R   |   6 SSMOD      000B4D R
    SSP     =  000001     |     STACK   =  0017FF     |   6 STAR       000B16 R
  6 STASL      000B5E R   |   6 STEXP      002D65 R   |   6 STEXP1     002D7B R
  6 STEXP2     002DA5 R   |   6 STOD       0008BB R   |   6 STORE      0004D1 R
  6 STO_SIGN   002539 R   |   6 STR        000E88 R   |   6 STRCQ      0015A1 R
  6 STRQ       0016E3 R   |   6 STRQP      000FB2 R   |   6 SUBB       0008D2 R
  6 SWAPP      000629 R   |     SWIM_CSR=  007F80     |   6 TAP        00132A R
  6 TBOOT      001B8A R   |   6 TBRAN      0004A6 R   |   6 TBUF       00071D R
    TBUFFBAS=  001680     |   6 TCHAR      000C2D R   |   6 TEMP       0006EE R
  6 TEVAL      000740 R   |   6 TFLASH     00072F R   |   6 THENN      00163C R
  6 TIB        000CFF R   |     TIBB    =  001700     |     TIBBASE =  001700 
    TIC     =  000027     |   6 TICK       001510 R   |     TIM1_ARR=  005262 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 198.
Hexadecimal [24-Bits]

Symbol Table

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
    TIM4_SR =  005342     |     TIM4_SR_=  000000     |   6 TIMEOUTQ   000310 R
  6 TIMER      0002FA R   |     TIM_CR1_=  000007     |     TIM_CR1_=  000000 
    TIM_CR1_=  000006     |     TIM_CR1_=  000005     |     TIM_CR1_=  000004 
    TIM_CR1_=  000003     |     TIM_CR1_=  000001     |     TIM_CR1_=  000002 
  6 TNAM2      001A62 R   |   6 TNAM3      001A80 R   |   6 TNAM4      001A86 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 199.
Hexadecimal [24-Bits]

Symbol Table

  6 TNAME      001A5F R   |   6 TOFLASH    000335 R   |   6 TOKEN      0011EB R
  6 TOR        0005E2 R   |   6 TORAM      000375 R   |   6 TRUE       000857 R
    TRUEE   =  00FFFF     |   6 TWOSL      000BE9 R   |   6 TYPE1      000F76 R
  6 TYPE2      000F7C R   |   6 TYPES      000F71 R   |   6 Timer4Ha   000005 R
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
    UCNTXT  =  000016     |     UCP     =  00001A     |     UCTIB   =  00000E 
    UD1     =  000001     |     UD2     =  000002     |     UD3     =  000003 
    UD4     =  000004     |   6 UDIV10     00322E R   |   6 UDOT       000FFF R
  6 UDOTR      000FDF R   |   6 UDSLA3     002ACA R   |   6 UDSLA4     002AF0 R
  6 UDSLA7     002B21 R   |   6 UDSLA8     002B2C R   |   6 UDSLMOD    002A95 R
  6 UDSSTAR    00272C R   |   6 UEND       000047 R   |     UFPSW   =  000008 
  6 UGREAT     00093D R   |   6 UGREAT1    000948 R   |     UHLD    =  000014 
    UINN    =  00000C     |     UINTER  =  000012     |     ULAST   =  00001C 
  6 ULES1      00091B R   |   6 ULESS      000910 R   |   6 UMMOD      0009B1 R
  6 UMOD10     0031ED R   |   6 UMSTA      000ACC R   |   6 UNIQ1      001721 R
  6 UNIQU      001702 R   |   6 UNLKEE     001D08 R   |   6 UNLKFL     001D27 R
  6 UNLOCK     001D46 R   |   6 UNTIL      001604 R   |     UOFFSET =  00001E 
  6 UPDATCP    001CC5 R   |   6 UPDATLAS   001C9C R   |   6 UPDATPTR   0022C8 R
  6 UPDATRUN   001CB4 R   |   6 UPDATVP    001CDC R   |   6 UPL1       0006CB R
  6 UPLUS      0006B4 R   |     UPP     =  000006     |   6 UPPER      0011AE R
  6 UPPER1     0011D1 R   |   6 UPPER2     0011DA R   |     URLAST  =  000022 
  6 USLMOD     000A00 R   |     USR_BTN_=  000004     |     USR_BTN_=  000010 
    USR_BTN_=  005015     |     UTFLASH =  000020     |     UTIB    =  000010 
    UTMP    =  00000A     |   6 UTYP1      00199C R   |   6 UTYP2      0019AB R
  6 UTYPE      001997 R   |     UVP     =  000018     |   6 UZERO      00002B R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 200.
Hexadecimal [24-Bits]

Symbol Table

  6 VARIA      0018D9 R   |     VAR_BASE=  000080     |     VAR_TOP =  0017BF 
    VER     =  000004     |   6 VPP        000770 R   |     VSIZE   =  000006 
    WANT_CON=  000001     |     WANT_DEB=  000000     |     WANT_DOU=  000001 
    WANT_FLO=  000001     |     WANT_SCA=  000001     |     WANT_SEE=  000000 
    WDGOPT  =  004805     |     WDGOPT_I=  000002     |     WDGOPT_L=  000003 
    WDGOPT_W=  000000     |     WDGOPT_W=  000001     |   6 WHILE      00168A R
  6 WITHI      000996 R   |   6 WORDD      001194 R   |   6 WORDS      001ABC R
  6 WORS1      001AC2 R   |   6 WORS2      001ADE R   |   6 WR_BYTE    001DF1 R
  6 WR_WORD    001E16 R   |   6 WTABLE     002420 R   |   6 WTAT       002444 R
  6 WTINIT     002489 R   |     WWDG_CR =  0050D1     |     WWDG_WR =  0050D2 
    XMEM_SIZ=  017830     |     XOFF    =  000013     |     XON     =  000011 
  6 XORR       00069F R   |     XTEMP   =  000024     |     YTEMP   =  000026 
    YTMP    =  000003     |   6 ZEQ1       002859 R   |   6 ZEQU1      00066C R
  6 ZEQUAL     000662 R   |   6 ZERO       000C03 R   |   6 ZL1        000659 R
  6 ZLESS      000650 R   |   6 app_spac   003600 R   |   6 baudrate   00037B R
  6 block_er   001EDC R   |   6 clear_ra   000019 R   |   6 clock_in   000064 R
  6 copy_buf   001F3C R   |   6 copy_buf   001F5B R   |   6 copy_pro   001F5B R
    da      =  000002     |     db      =  000003     |     dc      =  000000 
    dd      =  000001     |   6 do2lit     00296E R   |   6 erase_fl   001EFE R
  6 fmove_do   0022B1 R   |   6 main       000016 R   |   6 next_row   00226E R
  6 no_move    0022B8 R   |   6 nsign      002510 R   |   6 parse_di   00253D R
  6 parse_ex   002EF9 R   |   6 pristine   001FDC R   |   6 proceed_   001F01 R
  6 reboot     000327 R   |   6 reset_ve   002043 R   |   6 row_eras   001EBC R
  6 row_eras   001F15 R   |   6 row_eras   001F3C R   |   6 set_opti   001FB0 R
  6 set_vect   0020E4 R   |   6 uart_ini   000076 R   |   6 write_ro   001F80 R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 201.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 DATA       size      0   flags    8
   2 DATA0      size      0   flags    8
   3 SSEG       size      0   flags    8
   4 SSEG1      size    100   flags    8
   5 HOME       size     80   flags    0
   6 CODE       size   3600   flags    0

